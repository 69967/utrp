-- Server-side Ammo Drop Handler
-- Add this to your existing lua/autorun/server/sv_ammo_drop.lua file
-- OR create a new file lua/autorun/server/sv_ammo_drop_handler.lua

-- Network string for client-server communication
util.AddNetworkString("RequestAmmoDrop")

-- Function to create ammo box entity (if not already defined in your main file)
-- This assumes the CreateAmmoBox function from your original code exists
-- If not, uncomment the function below:

--[[
local function CreateAmmoBox(ammo_type, ammo_name, amount, pos)
    local ent = ents.Create("custom_ammo_box")
    if not IsValid(ent) then 
        print("[Ammo Drop] Failed to create custom_ammo_box")
        return nil 
    end
    
    -- Set data before spawning
    ent.AmmoType = ammo_type
    ent.AmmoName = ammo_name
    ent.AmmoRemaining = amount
    
    ent:SetPos(pos + Vector(math.random(-40, 40), math.random(-40, 40), 20))
    ent:SetAngles(Angle(0, math.random(0, 360), 0))
    ent:Spawn()
    
    ent:SetColor(Color(150, 150, 150, 150)) 
    
    -- Set networked vars for client display
    ent:SetNWString("AmmoType", tostring(ammo_type))
    ent:SetNWString("AmmoName", ammo_name)
    ent:SetNWInt("AmmoRemaining", amount)
    ent:SetNWBool("IsCustomAmmoBox", true)
    
    -- Add some physics motion
    timer.Simple(0.1, function()
        if IsValid(ent) then
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocity(Vector(math.random(-80, 80), math.random(-80, 80), math.random(50, 120)))
                phys:AddAngleVelocity(Vector(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
            end
        end
    end)
    
    return ent
end
--]]

-- Handle ammo drop requests from clients
net.Receive("RequestAmmoDrop", function(len, ply)
    if not IsValid(ply) or not ply:Alive() then 
        return 
    end
    
    -- Read the network data
    local ammoIndex = net.ReadInt(16)
    local dropAmount = net.ReadInt(32)
    
    -- Validate the ammo index
    if not ammoIndex or ammoIndex < 0 then
        return
    end
    
    -- Get player's current ammo count
    local currentAmmo = ply:GetAmmoCount(ammoIndex)
    local ammoName = game.GetAmmoName(ammoIndex)
    
    -- Validate drop amount
    if dropAmount <= 0 or dropAmount > currentAmmo then
        return
    end
    
    -- Calculate drop position (in front of player)
    local tr = ply:GetEyeTrace()
    local dropPos = ply:GetPos() + ply:GetForward() * 50 + Vector(0, 0, 10)
    
    -- If player is looking at a nearby surface, drop there instead
    if tr.Hit and tr.HitPos:Distance(ply:GetPos()) < 150 then
        dropPos = tr.HitPos + tr.HitNormal * 10
    end
    
    -- Create the ammo box
    local box = CreateAmmoBox(ammoIndex, ammoName, dropAmount, dropPos)
    
    if IsValid(box) then
        -- Remove ammo from player
        ply:RemoveAmmo(dropAmount, ammoIndex)
                
        -- Optional: Add a small upward velocity to make it pop out
        timer.Simple(0.05, function()
            if IsValid(box) then
                local phys = box:GetPhysicsObject()
                if IsValid(phys) then
                    phys:SetVelocity(ply:GetVelocity() + ply:GetForward() * 100 + Vector(0, 0, 150))
                end
            end
        end)
    else
    end
end)

-- Optional: Add a cooldown system to prevent spam

-- Enhanced version with cooldown
net.Receive("RequestAmmoDrop", function(len, ply)
    if not IsValid(ply) or not ply:Alive() then return end
    
    -- Check cooldown
    local steamID = ply:SteamID()
    
    local ammoIndex = net.ReadInt(16)
    local dropAmount = net.ReadInt(32)
    
    if not ammoIndex or ammoIndex < 0 then return end
    
    local currentAmmo = ply:GetAmmoCount(ammoIndex)
    local ammoName = game.GetAmmoName(ammoIndex)
    
    if dropAmount <= 0 or dropAmount > currentAmmo then
        return
    end
    
    -- Calculate drop position
    local tr = ply:GetEyeTrace()
    local dropPos = ply:GetPos() + ply:GetForward() * 50 + Vector(0, 0, 10)
    
    if tr.Hit and tr.HitPos:Distance(ply:GetPos()) < 150 then
        dropPos = tr.HitPos + tr.HitNormal * 10
    end
    
    -- Create the ammo box
    local box = CreateAmmoBox(ammoIndex, ammoName, dropAmount, dropPos)
    
    if IsValid(box) then
        ply:RemoveAmmo(dropAmount, ammoIndex)
        
        timer.Simple(0.05, function()
            if IsValid(box) then
                local phys = box:GetPhysicsObject()
                if IsValid(phys) then
                    phys:SetVelocity(ply:GetVelocity() + ply:GetForward() * 100 + Vector(0, 0, 150))
                end
            end
        end)
    else
    end
end)

-- Console command for quick drop (drops all of a specific ammo type)
concommand.Add("ammo_drop_all", function(ply, cmd, args)
    if not IsValid(ply) or not ply:Alive() then return end
    
    if not args[1] then
        return
    end
    
    local ammoName = string.lower(args[1])
    local ammos = ply:GetAmmo()
    local dropped = false
    
    for k, v in pairs(ammos) do
        if v > 0 then
            local name = string.lower(game.GetAmmoName(k))
            if string.find(name, ammoName) then
                local dropPos = ply:GetPos() + ply:GetForward() * 50 + Vector(0, 0, 10)
                local box = CreateAmmoBox(k, game.GetAmmoName(k), v, dropPos)
                
                if IsValid(box) then
                    ply:RemoveAmmo(v, k)
                    dropped = true
                end
                break
            end
        end
    end
    
    if not dropped then
    end
end)