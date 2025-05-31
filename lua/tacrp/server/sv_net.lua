-- ULTRA CPU OPTIMIZATION: Maximum performance network handling with forensic optimizations
-- Pass 8: Pre-cached functions, minimal allocations, optimized validation chains

-- Pre-cache all frequently used functions for maximum performance
local net_ReadUInt = net.ReadUInt
local net_ReadBool = net.ReadBool
local net_ReadEntity = net.ReadEntity
local IsValid = IsValid
local ents_Create = ents.Create
local AngleRand = AngleRand
local Vector = Vector

-- Pre-cache network bit constants
local QuickNades_Bits = TacRP.QuickNades_Bits
local BlindFireNetBits = TacRP.BlindFireNetBits
local Attachments_Bits = TacRP.Attachments_Bits

-- Network string registration (batch for better performance)
util.AddNetworkString("tacrp_toggleblindfire")
util.AddNetworkString("tacrp_togglecustomize")
util.AddNetworkString("tacrp_reloadatts")
util.AddNetworkString("tacrp_networkweapon")
util.AddNetworkString("tacrp_attach")
util.AddNetworkString("tacrp_receivepreset")
util.AddNetworkString("tacrp_sendattinv")
util.AddNetworkString("tacrp_sendbullet")
util.AddNetworkString("tacrp_sendconvar")
util.AddNetworkString("tacrp_updateholster")
util.AddNetworkString("tacrp_clientdamage")
util.AddNetworkString("tacrp_container")
util.AddNetworkString("tacrp_toggletactical")
util.AddNetworkString("tacrp_doorbust")
util.AddNetworkString("tacrp_flashbang")
util.AddNetworkString("tacrp_togglenade")
util.AddNetworkString("tacrp_addshieldmodel")
util.AddNetworkString("tacrp_updateslot")
util.AddNetworkString("tacrp_givenadewep")
util.AddNetworkString("tacrp_reloadlangs")
util.AddNetworkString("tacrp_npcweapon")
util.AddNetworkString("tacrp_drop")

-- Optimized grenade toggle with minimal function calls and early exits
net.Receive("tacrp_togglenade", function(len, ply)
    local bf = net_ReadUInt(QuickNades_Bits)
    local throw = net_ReadBool()
    local under = throw and net_ReadBool() or false

    local wpn = ply:GetActiveWeapon()
    -- Combined validation check for optimal performance
    if not wpn or not IsValid(wpn) or not wpn.ArcticTacRP then 
        return 
    end

    wpn:SelectGrenade(bf)
    if throw then
        wpn:PrimeGrenade()
        wpn.GrenadeThrowOverride = under
    end
end)

-- Optimized grenade weapon giving with early validation
net.Receive("tacrp_givenadewep", function(len, ply)
    local bf = net_ReadUInt(QuickNades_Bits)
    local wpn = ply:GetActiveWeapon()
    
    -- Early exit with combined validation
    if not wpn or not IsValid(wpn) or not wpn.ArcticTacRP or not TacRP.AreTheGrenadeAnimsReadyYet then 
        return 
    end

    local nade = TacRP.QuickNades[TacRP.QuickNades_Index[bf]]
    if not nade or not nade.GrenadeWep or not wpn:CheckGrenade(bf, true) then 
        return 
    end

    ply:Give(nade.GrenadeWep, true)
end)

-- Optimized blind fire toggle with minimal validation overhead
net.Receive("tacrp_toggleblindfire", function(len, ply)
    local bf = net_ReadUInt(BlindFireNetBits)
    local wpn = ply:GetActiveWeapon()

    if not wpn or not IsValid(wpn) or not wpn.ArcticTacRP then 
        return 
    end

    wpn:ToggleBlindFire(bf)
end)

-- Streamlined customize toggle
net.Receive("tacrp_togglecustomize", function(len, ply)
    local bf = net_ReadBool()
    local wpn = ply:GetActiveWeapon()

    if not wpn or not IsValid(wpn) or not wpn.ArcticTacRP then 
        return 
    end

    wpn:ToggleCustomize(bf)
end)

-- Optimized tactical toggle with combined validation
net.Receive("tacrp_toggletactical", function(len, ply)
    local wpn = ply:GetActiveWeapon()

    if not wpn or not IsValid(wpn) or not wpn.ArcticTacRP or not wpn:GetValue("CanToggle") then 
        return 
    end

    wpn:SetTactical(not wpn:GetTactical())
end)

-- Streamlined weapon networking
net.Receive("tacrp_networkweapon", function(len, ply)
    local wpn = net_ReadEntity()

    if not wpn.ArcticTacRP then 
        return 
    end

    wpn:NetworkWeapon(ply)
end)

-- Optimized attachment system with early validation
net.Receive("tacrp_attach", function(len, ply)
    local wpn = net_ReadEntity()
    local attach = net_ReadBool()
    local slot = net_ReadUInt(8)
    local attid = attach and net_ReadUInt(Attachments_Bits) or 0

    -- Combined validation for optimal performance
    if ply:GetActiveWeapon() ~= wpn or not wpn.ArcticTacRP then 
        return 
    end

    if attach then
        local att = TacRP.Attachments_Index[attid]
        wpn:Attach(slot, att, true)
    else
        wpn:Detach(slot, true)
    end
end)

-- Streamlined preset reception
net.Receive("tacrp_receivepreset", function(len, ply)
    local wpn = net_ReadEntity()

    if not wpn.ArcticTacRP or wpn:GetOwner() ~= ply then 
        return 
    end
    
    wpn:ReceivePreset()
end)

-- Ultra-optimized weapon dropping with minimal branching and pre-cached values
function TacRP.DropWeapon(ply, wep)
    local primary_grenade = wep:GetValue("PrimaryGrenade")
    
    if primary_grenade then
        local nade = TacRP.QuickNades[primary_grenade]
        
        -- Early exit for infinite ammo grenades
        if TacRP.IsGrenadeInfiniteAmmo(nade) then
            return
        end
        
        if nade.Singleton then
            if DarkRP then
                local canDrop = hook.Call("canDropWeapon", GAMEMODE, ply, wep)
                if not canDrop then
                    DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
                    return ""
                end
                ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
                ply:dropDRPWeapon(wep)
            else
                ply:DropWeapon(wep)
            end
        elseif nade.AmmoEnt and ply:GetAmmoCount(nade.Ammo) > 0 then
            ply:RemoveAmmo(1, nade.Ammo)
            
            -- Optimized entity creation and setup
            local ent = ents_Create(nade.AmmoEnt)
            local eye_pos = ply:EyePos()
            ent:SetPos(eye_pos - Vector(0, 0, 4))
            ent:SetAngles(AngleRand())
            ent:Spawn()
            
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocityInstantaneous(ply:EyeAngles():Forward() * 200)
            end
            
            -- Remove weapon if no ammo remaining
            if ply:GetAmmoCount(nade.Ammo) == 0 then
                wep:Remove()
            end
        end
    else
        -- Standard weapon dropping with DarkRP compatibility
        if DarkRP then
            local canDrop = hook.Call("canDropWeapon", GAMEMODE, ply, wep)
            if not canDrop then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
                return ""
            end
            ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
            ply:dropDRPWeapon(wep)
        else
            ply:DropWeapon(wep)
        end
    end
end

-- Optimized drop handler with early validation
net.Receive("tacrp_drop", function(len, ply)
    -- Early exit for disabled dropping
    if not TacRP.ConVars["allowdrop"]:GetBool() then 
        return 
    end
    
    local wep = ply:GetActiveWeapon()
    
    -- Combined validation check
    if not IsValid(wep) or not wep.ArcticTacRP or not ply:Alive() then 
        return 
    end

    TacRP.DropWeapon(ply, wep)
end)
