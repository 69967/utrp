-- Server-side Lua code for dropping ammo on player death
-- Place this in lua/autorun/server/sv_ammo_drop.lua

AddCSLuaFile()

-- Prevent duplicate drops
local death_processed = {}

-- Function to get proper ammo display name using game functions
local function GetProperAmmoName(ammo_type)
    -- If it's a numeric ID, use game.GetAmmoName to get the actual name
    if tonumber(ammo_type) then
        local game_name = game.GetAmmoName(tonumber(ammo_type))
        if game_name and game_name ~= "" then
            return game_name
        end
        return "Unknown Ammo " .. ammo_type
    end
    
    -- For string ammo types, try to find the corresponding ammo info
    local ammo_types = game.GetAmmoTypes()
    for ammo_id, ammo_info in pairs(ammo_types) do
        if ammo_info.name == ammo_type or ammo_id == ammo_type then
            return ammo_info.name or ammo_type
        end
    end
    
    -- If no match found in registered types, return the original string
    return ammo_type
end

-- Function to scan ALL possible ammo the player might have
local function GetAllPlayerAmmo(ply)
    local ammo_data = {}
    
    print("[Ammo Drop] Scanning all ammo for " .. ply:Name())
    
    -- Method 1: Standard registered ammo types
    for ammo_id, ammo_info in pairs(game.GetAmmoTypes()) do
        local count = ply:GetAmmoCount(ammo_id)
        if count > 0 then
            local display_name = GetProperAmmoName(ammo_info.name or ammo_id)
            ammo_data[ammo_id] = {
                count = count,
                name = display_name
            }
            print("[Ammo Drop] Found standard ammo: " .. display_name .. " = " .. count)
        end
    end
    
    -- Method 2: Brute force numeric IDs (0-100 should cover most cases)
    for i = 0, 100 do
        local count = ply:GetAmmoCount(i)
        if count > 0 then
            local raw_name = game.GetAmmoName(i) or tostring(i)
            local display_name = GetProperAmmoName(raw_name)
            
            -- Check if we already have this ammo (avoid duplicates)
            local already_exists = false
            for _, existing in pairs(ammo_data) do
                if existing.name == display_name and existing.count == count then
                    already_exists = true
                    break
                end
            end
            
            if not already_exists then
                ammo_data[i] = {
                    count = count,
                    name = display_name
                }
                print("[Ammo Drop] Found numeric ammo ID " .. i .. ": " .. display_name .. " = " .. count)
            end
        end
    end
    
    -- Method 3: Direct string checks for known tactical RP ammo
    local tactical_ammo_types = {
        "40", ".40 S&W", "40sw",
        "45acp", ".45 ACP", 
        "556", "5.56x45mm", "556x45",
        "762", "7.62x39mm", "762x39",
        "12gauge", "12 Gauge", "buckshot",
        "50ae", ".50 AE",
        "9x19mm", "9x19mm HP"
    }
    
    for _, ammo_type in pairs(tactical_ammo_types) do
        local count = ply:GetAmmoCount(ammo_type)
        if count > 0 then
            local display_name = GetProperAmmoName(ammo_type)
            
            -- Check if we already have this (avoid duplicates)
            local already_exists = false
            for _, existing in pairs(ammo_data) do
                if existing.name == display_name and existing.count == count then
                    already_exists = true
                    break
                end
            end
            
            if not already_exists then
                ammo_data[ammo_type] = {
                    count = count,
                    name = display_name
                }
                print("[Ammo Drop] Found tactical ammo: " .. display_name .. " = " .. count)
            end
        end
    end
    
    print("[Ammo Drop] Total ammo types found: " .. table.Count(ammo_data))
    return ammo_data
end

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

scripted_ents.Register(ENT, "custom_ammo_box")

-- Function to create ammo box entity
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
	
	ent:SetColor( Color( 150, 150, 150, 150 ) ) 
    
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
end

-- Use only DoPlayerDeath to prevent duplicates
hook.Add("DoPlayerDeath", "DropAmmoOnDoPlayerDeath", function(victim, attacker, dmginfo)
    if not IsValid(victim) then return end

    -- Prevent duplicate processing
    local steamid = victim:SteamID()
    local time_key = steamid .. "_" .. math.floor(CurTime())
    
    if death_processed[time_key] then
        print("[Ammo Drop] Already processed death for " .. victim:Name())
        return
    end
    death_processed[time_key] = true
    
    -- Clean old entries
    for key, _ in pairs(death_processed) do
        if string.find(key, math.floor(CurTime() - 10)) then
            death_processed[key] = nil
        end
    end
    
    print("[Ammo Drop] DoPlayerDeath for " .. victim:Name())
    
    local ammo_data = GetAllPlayerAmmo(victim)
    local death_pos = victim:GetPos()
    
    if table.Count(ammo_data) > 0 then
        print("[Ammo Drop] Found ammo in DoPlayerDeath, creating boxes...")
        
        for ammo_type, ammo_info in pairs(ammo_data) do
            local box = CreateAmmoBox(ammo_type, ammo_info.name, ammo_info.count, death_pos)
            if IsValid(box) then
                print("[Ammo Drop] Created box for " .. ammo_info.name)
            end
        end
    else
        print("[Ammo Drop] No ammo found in DoPlayerDeath")
    end
end)

-- Test commands
concommand.Add("drop_my_ammo", function(ply, cmd, args)
    if not IsValid(ply) or not ply:IsAdmin() then return end
    
    local ammo_data = GetAllPlayerAmmo(ply)
    local pos = ply:GetPos()
    local dropped = 0
    
    for ammo_type, ammo_info in pairs(ammo_data) do
        local box = CreateAmmoBox(ammo_type, ammo_info.name, ammo_info.count, pos)
        if IsValid(box) then
            ply:RemoveAmmo(ammo_info.count, ammo_type)
            dropped = dropped + 1
        end
    end
    
    ply:ChatPrint("Dropped " .. dropped .. " ammo types!")
end)

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