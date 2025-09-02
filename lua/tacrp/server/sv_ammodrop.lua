-- Server-side Lua code for dropping ammo on player death
-- Place this in lua/autorun/server/sv_ammo_drop.lua

-- Function to get all ammo types from a player
local function GetPlayerAmmoTypes(ply)
    local ammo_data = {}
    
    -- Iterate through all registered ammo types
    for ammo_id, ammo_data_table in pairs(game.GetAmmoTypes()) do
        local ammo_count = ply:GetAmmoCount(ammo_id)
        if ammo_count > 0 then
            ammo_data[ammo_id] = {
                count = ammo_count,
                name = ammo_data_table.name or ammo_id
            }
        end
    end
    
    return ammo_data
end

-- Function to create ammo box entity for specific ammo type
local function CreateAmmoBoxEntity(ammo_type, ammo_name, amount, pos)
    local ent = ents.Create("base_entity")
    if IsValid(ent) then
        ent:SetModel("models/props_junk/cardboard_box004a.mdl")
        ent:SetPos(pos + Vector(math.random(-30, 30), math.random(-30, 30), 10))
        ent:SetAngles(Angle(0, math.random(0, 360), 0))
        
        -- Set entity properties
        ent.Type = "anim"
        ent.RenderGroup = RENDERGROUP_OPAQUE
        ent.PrintName = ammo_name .. " Box"
        ent.AmmoType = ammo_type
        ent.AmmoName = ammo_name
        ent.AmmoRemaining = amount
        ent.NextUse = 0
        
        -- Collision sounds like the original
        ent.CollisionSounds = {
            "physics/plaster/ceiling_tile_step1.wav",
            "physics/plaster/ceiling_tile_step2.wav",
            "physics/plaster/ceiling_tile_step3.wav",
            "physics/plaster/ceiling_tile_step4.wav"
        }
        
        ent:Spawn()
        
        if SERVER then
            ent:PhysicsInit(SOLID_VPHYSICS)
            ent:SetMoveType(MOVETYPE_VPHYSICS)
            ent:SetSolid(SOLID_VPHYSICS)
            ent:SetCollisionGroup(COLLISION_GROUP_WEAPON)
            ent:SetUseType(SIMPLE_USE)
            ent:PhysWake()
            
            ent:SetNWInt("AmmoRemaining", amount)
            ent:SetNWString("AmmoType", ammo_type)
            ent:SetNWString("AmmoName", ammo_name)
        end
        
        -- Physics collision sound
        ent.PhysicsCollide = function(self, data)
            if data.DeltaTime < 0.1 or data.Speed < 25 then return end
            self:EmitSound(self.CollisionSounds[math.random(4)])
        end
        
        -- Use function like the original
        ent.Use = function(self, activator, caller)
            if CurTime() < self.NextUse then 
                return 
            end
            self.NextUse = CurTime() + 1.2
            self:ApplyAmmo(activator)
        end
        
        -- Apply ammo function like the original
        ent.ApplyAmmo = function(self, ply)
            local currentAmmo = ply:GetAmmoCount(self.AmmoType)
            local maxAmmo = game.GetAmmoMax(self.AmmoType) or 999 -- Get max ammo for this type
            local ammoToGive = math.min(10, self.AmmoRemaining) -- Give up to 10 rounds at a time
            
            if currentAmmo >= maxAmmo then
                ply:ChatPrint(self.AmmoName .. " full [" .. maxAmmo .. "]")
                return
            elseif currentAmmo + ammoToGive > maxAmmo then
                ammoToGive = maxAmmo - currentAmmo
                ply:ChatPrint("All " .. self.AmmoName .. " rounds didn't fit, got (" .. ammoToGive .. ")")
            end
            
            ply:GiveAmmo(ammoToGive, self.AmmoType)
            self.AmmoRemaining = self.AmmoRemaining - ammoToGive
            
            self:SetNWInt("AmmoRemaining", self.AmmoRemaining)
            ply:EmitSound("items/ammo_pickup.wav")
            
            if self.AmmoRemaining <= 0 then
                self:Remove()
            end
        end
        
        -- Add physics impulse for realistic dropping
        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocity(Vector(math.random(-50, 50), math.random(-50, 50), math.random(0, 100)))
            phys:AddAngleVelocity(Vector(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
        end
        
        -- Optional: Remove after 5 minutes to prevent clutter
        timer.Simple(300, function()
            if IsValid(ent) then
                ent:Remove()
            end
        end)
        
        return ent
    end
    
    return nil
end

-- Main function to drop all player ammo
local function DropPlayerAmmo(ply)
    if not IsValid(ply) then return end
    
    local pos = ply:GetPos()
    local dropped_items = {}
    
    -- Get all ammo types dynamically from the player
    local player_ammo = GetPlayerAmmoTypes(ply)
    
    for ammo_type, ammo_info in pairs(player_ammo) do
        -- Create ammo box for this ammo type
        local ent = CreateAmmoBoxEntity(ammo_type, ammo_info.name, ammo_info.count, pos)
        
        if IsValid(ent) then
            table.insert(dropped_items, ent)
            -- Remove ammo from player
            ply:RemoveAmmo(ammo_info.count, ammo_type)
        end
    end
    
    -- Print debug info (optional)
    if #dropped_items > 0 then
        print("[Ammo Drop] " .. ply:Name() .. " dropped " .. #dropped_items .. " ammo types")
    end
    
    return dropped_items
end

-- Hook into player death
hook.Add("PlayerDeath", "DropAmmoOnDeath", function(victim, inflictor, attacker)
    if IsValid(victim) then
        -- Small delay to ensure the player is properly dead
        timer.Simple(0.1, function()
            if IsValid(victim) then
                DropPlayerAmmo(victim)
            end
        end)
    end
end)

-- Optional: Also drop ammo when player disconnects while alive
hook.Add("PlayerDisconnected", "DropAmmoOnDisconnect", function(ply)
    if IsValid(ply) and ply:Alive() then
        DropPlayerAmmo(ply)
    end
end)

-- Console command for testing (admin only)
concommand.Add("drop_my_ammo", function(ply, cmd, args)
    if not IsValid(ply) or not ply:IsAdmin() then return end
    DropPlayerAmmo(ply)
    ply:ChatPrint("Dropped all ammo!")
end)

-- Client-side rendering for the ammo boxes
if CLIENT then
    -- Create font for ammo display
    surface.CreateFont("ammoinbox", {
        font = "Arial",
        size = 200,
        weight = 500,
        antialias = true,
    })
    
    -- Hook to render ammo boxes
    hook.Add("PostDrawOpaqueRenderables", "DrawAmmoBoxes", function()
        for _, ent in pairs(ents.FindByClass("base_entity")) do
            if IsValid(ent) and ent:GetNWString("AmmoType", "") ~= "" then
                -- This is one of our ammo boxes
                ent:DrawModel()
                
                local ang = ent:GetAngles()
                ang:RotateAroundAxis(ent:GetUp(), 90)
                ang:RotateAroundAxis(ent:GetRight(), 0)
                ang:RotateAroundAxis(ent:GetForward(), 0)
                
                local pos = ent:GetPos()
                pos = pos + ent:GetForward() * -5.2
                pos = pos + ent:GetRight() * 2.5
                pos = pos + ent:GetUp() * 4.05
                
                local resolution = 9
                local ammoType = ent:GetNWString("AmmoName", "Unknown Ammo")
                local ammoCount = tostring(ent:GetNWInt("AmmoRemaining", 0))
                
                cam.Start3D2D(pos, ang, 0.08 / resolution)
                    surface.SetFont("ammoinbox")
                    
                    local tW1, tH1 = surface.GetTextSize(ammoType)
                    local tW2, tH2 = surface.GetTextSize(ammoCount)
                    
                    if tW1 and tH1 then
                        draw.SimpleText(ammoType, "ammoinbox", -tW1 / 2 + 285, -7, Color(255, 255, 255, 255))
                        
                        if tW2 and tH2 then
                            draw.SimpleText(ammoCount, "ammoinbox", -tW2 / 2 + 285, -7 + tH1 + 5, Color(255, 255, 0, 255))
                        end
                    end
                cam.End3D2D()
            end
        end
    end)
end