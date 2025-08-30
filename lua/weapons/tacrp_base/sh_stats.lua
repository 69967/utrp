SWEP.StatCache = {}
SWEP.HookCache = {}
SWEP.StatScoreCache = {} -- used by cust menu
SWEP.MiscCache = {}

SWEP.ExcludeFromRawStats = {
    ["FullName"] = true,
    ["PrintName"] = true,
    ["Description"] = true,
}

SWEP.IntegerStats = {
    ["ClipSize"] = true,
    ["Num"] = true,
}

SWEP.AllowNegativeStats = {
    ["RecoilKick"] = true,
}

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
    if !self.HookCache[val] then
        self.HookCache[val] = {}

        if self:GetTable()[val] then
            table.insert(self.HookCache[val], self:GetTable()[val])
        end

        for slot, slottbl in pairs(self.Attachments) do
            if !slottbl.Installed then continue end

            local atttbl = TacRP.GetAttTable(slottbl.Installed)

            if atttbl[val] then
                table.insert(self.HookCache[val], atttbl[val])
            end
        end
    end

    for _, chook in pairs(self.HookCache[val]) do
        local d = chook(self, data)
        if d != nil then
            data = d
        end
    end

    data = hook.Run("TacRP_" .. val, self, data) or data

    return data
end

function SWEP:GetBaseValue(val)
    local stat = self:GetTable()[val]

    local b = TacRP.GetBalanceMode()
    if b > 0 and self.BalanceStats != nil then
        if TacRP.BalanceDefaults[b] and TacRP.BalanceDefaults[b][val] != nil then
            stat = TacRP.BalanceDefaults[b][val]
        end
        for j = b, 1, -1 do
            if self.BalanceStats[j] and self.BalanceStats[j][val] != nil then -- Fixed: was using [b] instead of [j]
                stat = self.BalanceStats[j][val]
                break
            end
        end
    end

    if isnumber(stat) then
        if self.IntegerStats[val] then
            stat = math.ceil(stat)
        end
        if !self.AllowNegativeStats[val] then
            stat = math.max(stat, 0)
        end
    end

    return stat
end

function SWEP:GetValue(val, static, invert)
    -- Create a proper cache key that includes all parameters that affect the result
    local cacheKey = val .. "_" .. tostring(static or self.StaticStats) .. "_" .. tostring(invert or false)
    
    -- Check if we have a cached result for this exact combination
    if self.StatCache[cacheKey] then
        return self.StatCache[cacheKey]
    end

    local stat = self:GetBaseValue(val)

    local modifiers = {
        ["stat"] = nil, -- return this unless hook is set
        ["hook"] = nil, -- if set, always call hook and use the following values
        ["func"] = {}, -- modifying functions
        ["set"] = stat, -- override and no prefix
        ["prio"] = 0, -- override priority
        ["add"] = 0,
        ["mul"] = 1,
    }

    if !self.ExcludeFromRawStats[val] then
        for slot, slottbl in pairs(self.Attachments) do
            if !slottbl.Installed then continue end

            local atttbl = TacRP.GetAttTable(slottbl.Installed)

            local att_priority = atttbl["Priority_" .. val] or 1

            if atttbl[val] != nil and att_priority > modifiers.prio then
                modifiers.set = atttbl[val]
                modifiers.prio = att_priority
            end
        end
    end

    for slot, slottbl in pairs(self.Attachments) do
        if !slottbl.Installed then continue end

        local atttbl = TacRP.GetAttTable(slottbl.Installed)

        local att_priority = atttbl["Override_Priority_" .. val] or 1

        if atttbl["Override_" .. val] != nil and att_priority > modifiers.prio then
            modifiers.set = atttbl["Override_" .. val]
            modifiers.prio = att_priority
        end

        if atttbl["Add_" .. val] then
            modifiers.add = modifiers.add + atttbl["Add_" .. val] * (invert and -1 or 1)
        end

        if atttbl["Mult_" .. val] then
            if invert then
                modifiers.mul = modifiers.mul / atttbl["Mult_" .. val]
            else
                modifiers.mul = modifiers.mul * atttbl["Mult_" .. val]
            end
        end

        if atttbl["Func_" .. val] then
            table.insert(modifiers.func, atttbl["Func_" .. val])
        end
    end

    if isfunction(self["Func_" .. val]) then
        table.insert(modifiers.func, self["Func_" .. val])
    end

    -- Check for stat hooks only if we haven't cached this check yet
    local hookCacheKey = "hook_check_" .. val
    if self.MiscCache[hookCacheKey] == nil then
        self.MiscCache[hookCacheKey] = table.Count(hook.GetTable()["TacRP_Stat_" .. val] or {}) > 0
    end
    modifiers.hook = self.MiscCache[hookCacheKey]

    -- Calculate the final value
    if isnumber(modifiers.set) then
        modifiers.stat = (modifiers.set + modifiers.add) * modifiers.mul
        if self.IntegerStats[val] then
            modifiers.stat = math.ceil(modifiers.stat)
        end
        if !self.AllowNegativeStats[val] then
            modifiers.stat = math.max(modifiers.stat, 0)
        end
    else
        modifiers.stat = modifiers.set
    end

    local finalStat = modifiers.stat

    -- Only run dynamic hooks/functions if not in static mode
    if static != true and (modifiers.hook or #modifiers.func > 0) then
        local dynamicModifiers = {set = nil, prio = 0, add = 0, mul = 1}

        if #modifiers.func > 0 then
            for _, f in ipairs(modifiers.func) do
                f(self, dynamicModifiers)
            end
        end
        
        if modifiers.hook then
            hook.Run("TacRP_Stat_" .. val, self, dynamicModifiers)
            if !istable(dynamicModifiers) then 
                dynamicModifiers = {set = nil, prio = 0, add = 0, mul = 1}
            end
        end

        if dynamicModifiers.prio > modifiers.prio then
            finalStat = dynamicModifiers.set
        else
            finalStat = modifiers.set
        end

        if isnumber(finalStat) then
            if invert then
                finalStat = (finalStat - dynamicModifiers.add - modifiers.add) / dynamicModifiers.mul / modifiers.mul
            else
                finalStat = (finalStat + dynamicModifiers.add + modifiers.add) * dynamicModifiers.mul * modifiers.mul
            end

            if self.IntegerStats[val] then
                finalStat = math.ceil(finalStat)
            end
            if !self.AllowNegativeStats[val] then
                finalStat = math.max(finalStat, 0)
            end
        end
    end

    -- Cache the final result only if we're in static mode or there are no dynamic modifiers
    if static == true or (!modifiers.hook and #modifiers.func == 0) then
        self.StatCache[cacheKey] = finalStat
    end

    return finalStat
end