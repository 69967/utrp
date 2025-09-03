AddCSLuaFile()

ENT.Type                     = "anim"
ENT.Base                     = "base_entity"
ENT.RenderGroup              = RENDERGROUP_OPAQUE
ENT.PrintName                = "9mm HP"
ENT.Category                 = "Tactical RP"
ENT.AdminOnly                = true
ENT.Spawnable                = true
ENT.Model                    = "models/props_junk/cardboard_box004a.mdl"
ENT.Ammo                     = "9x19mm_HP"

ENT.CollisionSounds = {
    "physics/plaster/ceiling_tile_step1.wav",
    "physics/plaster/ceiling_tile_step2.wav",
    "physics/plaster/ceiling_tile_step3.wav",
    "physics/plaster/ceiling_tile_step4.wav"
}

function ENT:Initialize()
    self:SetModel(self.Model)
    self.AmmoRemaining = 1000
    self.NextUse = 0
	self:SetColor( Color( 178,132,190, 255 ) )
	self:SetMaterial("phoenix_storms/trains/track_beamtop")
    
    if SERVER then
        self:SetMaterial("")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetUseType(SIMPLE_USE)
        self:PhysWake()

        self:SetNWInt("AmmoRemaining", 1000)
    end
    self.BaseClass.Initialize(self)
end

function ENT:PhysicsCollide(data)
    if data.DeltaTime < 0.1 or data.Speed < 25 then return end
    self:EmitSound(self.CollisionSounds[math.random(4)])
end

function ENT:Use(ply)
    if CurTime() < self.NextUse then 
        return 
    end
    self.NextUse = CurTime() + 1.2
    self:ApplyAmmo(ply)
end

function ENT:ApplyAmmo(ply)

    local currentAmmo = ply:GetAmmoCount(self.Ammo)
    local maxAmmo = 36
    local ammoToGive = math.min(10, self.AmmoRemaining)  -- Don't give more than what's in the box

    if currentAmmo >= maxAmmo then
        ply:ChatPrint("9x19mm HP full [" .. maxAmmo .. "]")
        return
    elseif currentAmmo + ammoToGive > maxAmmo then
        ammoToGive = maxAmmo - currentAmmo
        ply:ChatPrint("All 9x19mm HP rounds didn't fit, got (" .. ammoToGive .. ")")
    end

    ply:GiveAmmo(ammoToGive, self.Ammo)
    self.AmmoRemaining = self.AmmoRemaining - ammoToGive  -- Subtract from remaining ammo

    self:SetNWInt("AmmoRemaining", self.AmmoRemaining)

    if self.AmmoRemaining <= 0 then
        self:Remove()
    end
end

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
        local ammoType = "9x19mm HP"
        local ammoCount = tostring(self:GetNWInt("AmmoRemaining", 1000))

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