AddCSLuaFile()

ENT.Base                     = "tacrp_proj_p2a1_flare"
ENT.PrintName                = "P2A1 Smoke Flare"
ENT.Spawnable                = false

ENT.ImpactDamage = 0

ENT.SmokeTrail = true
ENT.FlareColor = Color(255, 255, 255)
ENT.FlareSizeMin = 16
ENT.FlareSizeMax = 32
ENT.Gravity = Vector(0, 0, 9.81 * 0.3333)

function ENT:Detonate(ent)

    self:EmitSound("TacRP/weapons/grenade/smoke_explode-1.wav", 80, 108)
    timer.Simple(0, function()
        local cloud = ents.Create( "tacrp_smoke_cloud_p2a1" )
        if !IsValid(cloud) then return end
        cloud:SetPos(self:GetPos())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
        self:Remove()
    end)
end


local mat = Material("effects/ar2_altfire1b")
function ENT:Draw()
    render.SetMaterial(mat)
    render.DrawSprite(self:GetPos(), math.Rand(self.FlareSizeMin, self.FlareSizeMax), math.Rand(self.FlareSizeMin, self.FlareSizeMax), self.FlareColor)
end

function ENT:DoSmokeTrail()
    if CLIENT and self.SmokeTrail and !(self:GetOwner() == LocalPlayer() and (self.SpawnTime + 0.1) > CurTime()) then
        local emitter = ParticleEmitter(self:GetPos())

        local smoke = emitter:Add("particles/smokey", self:GetPos())

        smoke:SetStartAlpha(50)
        smoke:SetEndAlpha(0)

        smoke:SetStartSize(4)
        smoke:SetEndSize(math.Rand(25, 35))

        smoke:SetRoll(math.Rand(-180, 180))
        smoke:SetRollDelta(math.Rand(-1, 1))

        smoke:SetPos(self:GetPos())
        smoke:SetVelocity(VectorRand() * 32)

        smoke:SetColor(255, 255, 255)
        smoke:SetLighting(false)
        smoke:SetDieTime(math.Rand(0.3, 0.5))
        smoke:SetGravity(Vector(0, 0, 0))
        emitter:Finish()
    end
end