local T = CurTime

local G = {
    function(s) return s:GetOwner() end,
    function(s) return s:GetValue() end,
    function(s) return s:GetBurstCount() end,
    function(s) return s:GetCurrentFiremode() end,
    function(s) return s:GetPatternCount() end,
    function(s) return s:GetRecoilAmount() end,
    function(s) return s:GetReloading() end,
    function(s) return s:GetScopeLevel() end,
    function(s) return s:GetCustomize() end,
    function(s) return s:GetPeeking() end,
    function(s) return s:GetSightAmount() end,
    function(s) return s:GetLastScopeTime() end,
    function(s) return s:GetTactical() end,
    function(s) return s:GetJammed() end,
    function(s) return s:GetNextIdle() end,
    function(s) return s:GetInBipod() end,
    function(s) return s:CanBipod() end,
    function(s) return s:GetTactical() end,
    function(s) return s:GetMelee() end,
    function(s) return s:GetOwner() end,
    function(s) return s:GetTactical() end,
    function(s) return s:GetInBipod() end,
    function(s) return s:GetValue("RunawayBurst") end,
    function(s) return s:GetValue("PostBurstDelay") end,
    function(s) return s:GetValue("AutoBurst") end,
    function(s) return s:GetValue("RPM") end,
    function(s) return s:GetValue("AlwaysPeek") end,
    function(s) return s:GetValue("Melee") end,
    function(s) return s:GetValue("TacticalThink") end,
    function(s) return s:GetValue("Bipod") end,
}

local S = {
    [3] = function(s, v) s:SetBurstCount(v) end,
    [5] = function(s, v) s:SetPatternCount(v) end,
    [9] = function(s, v) s:ToggleCustomize(v) end,
    [10] = function(s, v) s:SetPeeking(v) end,
    [12] = function(s, v) s:SetLastScopeTime(v) end,
    [14] = function(s, v) s:SetJammed(v) end,
    [22] = function(s) s:ExitBipod() end,
}

local C, V, TM = {}, {}, {}
C[1], C[6], C[7] = true, true, true

function SWEP:Think()
    local o = G[1](self)
    if not IsValid(o) then return end

    if self:RunHook("Hook_PreThink") then return end

    local cfm = G[4](self)
    local rb = G[23](self)
    
    if rb and cfm < 0 then
        local bc = G[3](self)
        if bc >= -cfm then
            S[3](self, 0)
            self:SetNextPrimaryFire(T() + G[24](self))
        elseif bc > 0 and bc < -cfm then
            self:PrimaryAttack()
        end
    else
        local bc = G[3](self)
        if o:KeyReleased(IN_ATTACK) or (cfm < 0 and bc >= -cfm) then
            if cfm < 0 and bc > 1 then
                if not G[25](self) then
                    self.Primary.Automatic = false
                end
                local add = bc >= -cfm and (60 / G[26](self)) or 0
                self:SetNextPrimaryFire(T() + G[24](self) + add)
            end
            S[3](self, 0)
        end
    end

    local pc, ra, rl = G[5](self), G[6](self), G[7](self)
    if pc > 0 and (ra == 0 or rl) then
        S[5](self, 0)
    end

    if o:KeyPressed(TacRP.IN_CUSTOMIZE) then
        if G[8](self) == 0 then
            S[9](self, not G[9](self))
        else
            if not G[27](self) then
                local sp = not G[10](self)
                if o:GetInfoNum("tacrp_togglepeek", 0) == 0 then sp = true end
                S[10](self, sp)
                if G[11](self) > 0 then S[12](self, T()) end
            end
        end
    elseif not G[27](self) and o:GetInfoNum("tacrp_togglepeek", 0) == 0 and G[10](self) and o:KeyReleased(TacRP.IN_CUSTOMIZE) then
        S[10](self, false)
        if G[11](self) > 0 then S[12](self, T()) end
    end

    if o:KeyPressed(TacRP.IN_TACTICAL) then self:ToggleTactical() end

    self:ThinkRecoil()
    self:ThinkSprint()
    self:ThinkGrenade()
    self:ThinkReload()
    self:ThinkSights()
    self:ThinkFreeAim()
    self:ThinkBlindFire()
    self:ProcessTimers()
    self:ThinkLockOn()
    self:ThinkHoldBreath()

    if G[28](self) and o:KeyPressed(TacRP.IN_MELEE) then
        self:Melee()
        return
    end

    if IsValid(o) and o:IsPlayer() and G[29](self) and G[13](self) then
        G[29](self)(self)
    end

    if G[14](self) and not self:StillWaiting() and TacRP.ConVars["jam_autoclear"]:GetBool() then
        self:PlayAnimation("jam", 0.75, true, true)
        S[14](self, false)
    end

    if G[15](self) < T() and (SERVER or not game.SinglePlayer()) then
        self:Idle()
    end

    if G[30](self) and G[16](self) and not G[17](self) then
        S[22](self)
    end

    if CLIENT and (IsFirstTimePredicted() or game.SinglePlayer()) then
        self:ThinkNearWall()

        local ml = self.MuzzleLight
        if IsValid(ml) then
            local ct = UnPredictedCurTime()
            if (self.MuzzleLightEnd or 0) < ct then
                ml:Remove()
                self.MuzzleLight = nil
            else
                ml:SetBrightness(math.Remap(ct, self.MuzzleLightStart, self.MuzzleLightEnd, self.MuzzleLightBrightness, 0))
                ml:SetFOV(math.Remap(ct, self.MuzzleLightStart, self.MuzzleLightEnd, self.MuzzleLightFOV, 60))
                ml:Update()
            end
        end

        if not self.LoadedPreset then
            self.LoadedPreset = true
            if TacRP.ConVars["autosave"]:GetBool() and TacRP.ConVars["free_atts"]:GetBool() then
                self:LoadPreset()
            end
        end

        G[17](self)
    end

    self:RunHook("Hook_PostThink")
end