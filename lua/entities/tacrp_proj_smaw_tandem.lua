AddCSLuaFile()

ENT.Base                     = "tacrp_proj_smaw"
ENT.PrintName                = "SMAW Tandem Rocket"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/rocket_deployed.mdl"

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.5

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

ENT.FlareColor = Color(255, 150, 255)
ENT.FlareSizeMin = 150
ENT.FlareSizeMax = 200

ENT.SteerSpeed = 45
ENT.SteerDelay = 0

ENT.MaxSpeed = 6000
ENT.Acceleration = 2500
ENT.SteerBrake = 0

DEFINE_BASECLASS(ENT.Base)

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner()
    local mult = TacRP.ConVars["mult_damage_explosive"]:GetFloat() * (self.NPCDamage and 0.25 or 1)

    util.BlastDamage(self, attacker, self:GetPos(), 350, 200 * mult)
    self:ImpactTraceAttack(ent, 3000 * mult, 35000)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("Explosion", fx)
    end

    self:EmitSound("TacRP/weapons/rpg7/explode.wav", 125, 90)

    self:Remove()
end