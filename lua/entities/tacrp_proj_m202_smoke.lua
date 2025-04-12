AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "M202 Rocket (Smoke)"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/rocket_deployed.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.05

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

ENT.FlareColor = Color(255, 255, 255)

ENT.ExplodeSounds = {
    "TacRP/weapons/grenade/smoke_explode-1.wav",
}

function ENT:Detonate()
    if self:WaterLevel() > 0 then self:Remove() return end

    self:EmitSound(table.Random(self.ExplodeSounds), 75)

    local cloud = ents.Create( "TacRP_smoke_cloud" )

    if !IsValid(cloud) then return end

    cloud:SetPos(self:GetPos())
    cloud:Spawn()

    self:Remove()
end