SWEP.StatCache = {}
SWEP.HookCache = {}
SWEP.StatScoreCache = {}
SWEP.MiscCache = {}

local ExcludeFromRawStats = {
    FullName = true,
    PrintName = true,
    Description = true,
}

local IntegerStats = {
    ClipSize = true,
    Num = true,
}

local AllowNegativeStats = {
    RecoilKick = true,
}

SWEP.ExcludeFromRawStats = ExcludeFromRawStats
SWEP.IntegerStats = IntegerStats
SWEP.AllowNegativeStats = AllowNegativeStats

local math_ceil = math.ceil
local math_max = math.max
local table_insert = table.insert
local table_Count = table.Count
local pairs = pairs
local ipairs = ipairs
local isnumber = isnumber
local istable = istable
local isfunction = isfunction
local hook_Run = hook.Run
local hook_GetTable = hook.GetTable

function SWEP:InvalidateCache()
    self.StatCache = {}
    self.HookCache = {}
    self.StatScoreCache = {}
    self.MiscCache = {}
    self.RecoilPatternCache = {}
    self.AutoSightPos = nil
    self.AutoSightAng = nil
end

function SWEP:RunHook(val, data)
    local hcache = self.HookCache
    local cached = hcache[val]
    
    if !cached then
        cached = {}
        hcache[val] = cached
        
        local tbl = self:GetTable()
        local hookfn = tbl[val]
        if hookfn then
            cached[1] = hookfn
        end
        
        local atts = self.Attachments
        for slot, slottbl in pairs(atts) do
            if slottbl.Installed then
                local atttbl = TacRP.GetAttTable(slottbl.Installed)
                local attval = atttbl[val]
                if attval then
                    cached[#cached + 1] = attval
                end
            end
        end
    end
    
    for i = 1, #cached do
        local d = cached[i](self, data)
        if d != nil then
            data = d
        end
    end
    
    data = hook_Run("TacRP_" .. val, self, data) or data
    return data
end

function SWEP:GetBaseValue(val)
    local mcache = self.MiscCache
    local ckey = "b" .. val
    local cached = mcache[ckey]
    if cached != nil then
        return cached
    end
    
    local stat = self:GetTable()[val]
    local bstats = self.BalanceStats
    
    if bstats then
        local b = TacRP.GetBalanceMode()
        if b > 0 then
            local bdef = TacRP.BalanceDefaults[b]
            if bdef then
                local bval = bdef[val]
                if bval != nil then
                    stat = bval
                end
            end
            for j = b, 1, -1 do
                local bs = bstats[j]
                if bs then
                    local bval = bs[val]
                    if bval != nil then
                        stat = bval
                        break
                    end
                end
            end
        end
    end
    
    if isnumber(stat) then
        if IntegerStats[val] then
            stat = math_ceil(stat)
        end
        if !AllowNegativeStats[val] then
            stat = math_max(stat, 0)
        end
    end
    
    mcache[ckey] = stat
    return stat
end

function SWEP:GetValue(val, static, invert)
    local useStatic = static != nil and static or self.StaticStats
    
    local scache = self.StatCache
    local ckey
    if invert then
        ckey = useStatic and (val .. "si") or (val .. "i")
    else
        ckey = useStatic and (val .. "s") or val
    end
    
    local cached = scache[ckey]
    if cached != nil then
        return cached
    end
    
    local stat = self:GetBaseValue(val)
    local mcache = self.MiscCache
    local modkey = "m" .. val
    local mods = mcache[modkey]
    
    local set, prio, add, mul, func, hook
    if mods then
        set = stat
        prio = 0
        add = 0
        mul = 1
        func = mods[1]
        hook = mods[2]
    else
        set = stat
        prio = 0
        add = 0
        mul = 1
        func = {}
        
        local hkey = "h" .. val
        local hcached = mcache[hkey]
        if hcached == nil then
            local htbl = hook_GetTable()["TacRP_Stat_" .. val]
            hcached = htbl and table_Count(htbl) > 0 or false
            mcache[hkey] = hcached
        end
        hook = hcached
        
        mods = {func, hook}
        mcache[modkey] = mods
    end
    
    local atts = self.Attachments
    local excluded = ExcludeFromRawStats[val]
    
    if !excluded then
        for slot, slottbl in pairs(atts) do
            if slottbl.Installed then
                local atttbl = TacRP.GetAttTable(slottbl.Installed)
                local attval = atttbl[val]
                if attval != nil then
                    local ap = atttbl["Priority_" .. val] or 1
                    if ap > prio then
                        set = attval
                        prio = ap
                    end
                end
            end
        end
    end
    
    local invertMul = invert and -1 or 1
    for slot, slottbl in pairs(atts) do
        if slottbl.Installed then
            local atttbl = TacRP.GetAttTable(slottbl.Installed)
            
            local ov = atttbl["Override_" .. val]
            if ov != nil then
                local ap = atttbl["Override_Priority_" .. val] or 1
                if ap > prio then
                    set = ov
                    prio = ap
                end
            end
            
            local av = atttbl["Add_" .. val]
            if av then
                add = add + av * invertMul
            end
            
            local mv = atttbl["Mult_" .. val]
            if mv then
                mul = invert and (mul / mv) or (mul * mv)
            end
            
            local fv = atttbl["Func_" .. val]
            if fv then
                func[#func + 1] = fv
            end
        end
    end
    
    local selfFunc = self["Func_" .. val]
    if isfunction(selfFunc) then
        func[#func + 1] = selfFunc
    end
    
    local statval
    if isnumber(set) then
        statval = (set + add) * mul
        if IntegerStats[val] then
            statval = math_ceil(statval)
        end
        if !AllowNegativeStats[val] then
            statval = math_max(statval, 0)
        end
    else
        statval = set
    end
    
    local finalStat = statval
    local hasDynamic = hook or #func > 0
    
    if !useStatic and hasDynamic then
        local dset, dprio, dadd, dmul = nil, 0, 0, 1
        
        local fcount = #func
        if fcount > 0 then
            local dmods = {set = dset, prio = dprio, add = dadd, mul = dmul}
            for i = 1, fcount do
                func[i](self, dmods)
            end
            dset = dmods.set
            dprio = dmods.prio
            dadd = dmods.add
            dmul = dmods.mul
        end
        
        if hook then
            local dmods = {set = dset, prio = dprio, add = dadd, mul = dmul}
            hook_Run("TacRP_Stat_" .. val, self, dmods)
            if istable(dmods) then
                dset = dmods.set
                dprio = dmods.prio
                dadd = dmods.add
                dmul = dmods.mul
            end
        end
        
        finalStat = dprio > prio and dset or set
        
        if isnumber(finalStat) then
            if invert then
                finalStat = (finalStat - dadd - add) / dmul / mul
            else
                finalStat = (finalStat + dadd + add) * dmul * mul
            end
            
            if IntegerStats[val] then
                finalStat = math_ceil(finalStat)
            end
            if !AllowNegativeStats[val] then
                finalStat = math_max(finalStat, 0)
            end
        end
    end
    
    if useStatic or !hasDynamic then
        scache[ckey] = finalStat
    end
    
    return finalStat
end