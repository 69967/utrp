-- Complete Ammo Drop System
-- Place this in lua/autorun/server/sv_ammo_drop.lua

AddCSLuaFile()

-- Custom ammo box entity
local ENT = {}
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.PrintName = "Ammo Box"
ENT.Category = "Tactical RP"
ENT.Spawnable = false
ENT.Model = "models/props_junk/cardboard_box004a.mdl"
ENT.CollisionSounds = {
    "physics/plaster/ceiling_tile_step1.wav",
    "physics/plaster/ceiling_tile_step2.wav",
    "physics/plaster/ceiling_tile_step3.wav",
    "physics/plaster/ceiling_tile_step4.wav"
}

function ENT:Initialize()
    self:SetModel(self.Model)
    
    if SERVER then
        self:SetMaterial("")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetUseType(SIMPLE_USE)
        self:PhysWake()
        
        -- Default values
        self.AmmoType = self.AmmoType or "pistol"
        self.AmmoName = self.AmmoName or "Unknown Ammo"
        self.AmmoRemaining = self.AmmoRemaining or 0
        self.NextUse = 0
        
        -- Set networked vars
        self:SetNWString("AmmoType", tostring(self.AmmoType))
        self:SetNWString("AmmoName", self.AmmoName)
        self:SetNWInt("AmmoRemaining", self.AmmoRemaining)
        
        print("[Ammo Drop] Ammo box initialized with " .. self.AmmoRemaining .. " " .. self.AmmoName)
    end
    
    self.BaseClass.Initialize(self)
end

function ENT:PhysicsCollide(data)
    if data.DeltaTime < 0.1 or data.Speed < 25 then return end
    self:EmitSound(self.CollisionSounds[math.random(4)])
end

function ENT:Use(activator, caller)
    if not IsValid(activator) or not activator:IsPlayer() then 
        print("[Ammo Drop] Invalid activator for use")
        return 
    end
    
    if CurTime() < self.NextUse then 
        print("[Ammo Drop] Use on cooldown")
        return 
    end
    
    print("[Ammo Drop] " .. activator:Name() .. " is using ammo box with " .. self.AmmoRemaining .. " " .. self.AmmoName)
    
    self.NextUse = CurTime() + 1.2
    
    if self.AmmoRemaining <= 0 then
        print("[Ammo Drop] Ammo box is empty")
        return
    end
    
    local currentAmmo = activator:GetAmmoCount(self.AmmoType)
    local maxAmmo = game.GetAmmoMax(self.AmmoType) or 9999  -- Fallback to high number if no max set
    
    -- Check if player is already at max capacity
    if currentAmmo >= maxAmmo then
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. maxAmmo .. "/" .. maxAmmo .. "]")
        return
    end
    
    -- Calculate how much we can actually give (limited by box contents and player capacity)
    local ammoToGive = math.min(10, self.AmmoRemaining)  -- Standard pickup amount
    local spaceAvailable = maxAmmo - currentAmmo
    ammoToGive = math.min(ammoToGive, spaceAvailable)  -- Don't exceed player capacity
    
    if ammoToGive <= 0 then
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. currentAmmo .. "/" .. maxAmmo .. "]")
        return
    end
    
    local oldAmmo = activator:GetAmmoCount(self.AmmoType)
    activator:GiveAmmo(ammoToGive, self.AmmoType)
    local newAmmo = activator:GetAmmoCount(self.AmmoType)
    local actualGiven = newAmmo - oldAmmo
    
    print("[Ammo Drop] Gave " .. actualGiven .. " ammo (requested " .. ammoToGive .. "), player now has " .. newAmmo .. "/" .. maxAmmo)
    
    if actualGiven > 0 then
        activator:EmitSound("items/ammo_pickup.wav")
        activator:ChatPrint("Picked up " .. actualGiven .. " " .. self.AmmoName .. " [" .. newAmmo .. "/" .. maxAmmo .. "]")
        
        self.AmmoRemaining = self.AmmoRemaining - actualGiven
        self:SetNWInt("AmmoRemaining", self.AmmoRemaining)
        
        if self.AmmoRemaining <= 0 then
            print("[Ammo Drop] Ammo box depleted, removing")
            self:Remove()
        end
    else
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. currentAmmo .. "/" .. maxAmmo .. "]")
    end
end

-- Client-side rendering
if CLIENT then
    surface.CreateFont("ammoinbox", {
        font = "Arial",
        size = 200,
        weight = 500,
        antialias = true,
    })
    
    function ENT:Draw()
        self:DrawModel()
        
        local ang = self:GetAngles()
        ang:RotateAroundAxis(self:GetUp(), 90)
        ang:RotateAroundAxis(self:GetRight(), 0)
        ang:RotateAroundAxis(self:GetForward(), 0)
        
        local pos = self:GetPos()
        pos = pos + self:GetForward() * -5.2
        pos = pos + self:GetRight() * 2.5
        pos = pos + self:GetUp() * 4.05
        
        local resolution = 9
        local ammoType = self:GetNWString("AmmoName", "Unknown Ammo")
        local ammoCount = tostring(self:GetNWInt("AmmoRemaining", 0))
        
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

scripted_ents.Register(ENT, "custom_ammo_box")

-- Function to create ammo box entity
function CreateAmmoBox(ammo_type, ammo_name, amount, pos)
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

-- Hook for dropping ammo on player death - using your original ammo detection logic
hook.Add("PlayerDeath", "ammochecks", function(ply)
    local ammos = ply:GetAmmo() -- returns dictionary of ammo indices and count
    local ammoindex = {} -- moved inside the function to avoid accumulation
    local pos = ply:GetPos() -- Get player's position for dropping ammo
    
    for k, v in pairs(ammos) do -- array-table
        -- Only add ammo types that have more than 0 count
        if v > 0 then
            table.insert(ammoindex, {
                ammoname = game.GetAmmoName(k),
                ammocount = v,
                ammotype = k
            })
        end
    end
    
    -- Debug print to see what ammo the player had
    if ammoindex and next(ammoindex) then
        print("[Ammo Drop] Player " .. ply:Name() .. " dropped:")
        for _, aidata in ipairs(ammoindex) do 
            print("  " .. aidata.ammoname .. ": " .. aidata.ammocount)
        end
    end
    
    -- Create ammo boxes for each ammo type using your original data structure
    for i, data in ipairs(ammoindex) do
        CreateAmmoBox(data.ammotype, data.ammoname, data.ammocount, pos)
    end
end)

-- Test command for admins to test the system
concommand.Add("drop_my_ammo", function(ply, cmd, args)
    if not IsValid(ply) or not ply:IsAdmin() then return end
    
    local ammos = ply:GetAmmo()
    local pos = ply:GetPos()
    local dropped = 0
    
    for k, v in pairs(ammos) do
        if v > 0 then
            local ammoname = game.GetAmmoName(k)
            local box = CreateAmmoBox(k, ammoname, v, pos)
            if IsValid(box) then
                ply:RemoveAmmo(v, k)
                dropped = dropped + 1
            end
        end
    end
    
    ply:ChatPrint("Dropped " .. dropped .. " ammo types!")
end)