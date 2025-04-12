AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "M202 Rocket (HE)"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/rocket_deployed.mdl"

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.05

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

ENT.FlareColor = Color(255, 255, 200)


function ENT:Detonate()
    local attacker = self.Attacker or self:GetOwner()

    local mult = TacRP.ConVars["mult_damage_explosive"]:GetFloat() * (self.NPCDamage and 0.25 or 1)
    util.BlastDamage(self, attacker, self:GetPos(), 350, 150 * mult)
    self:ImpactTraceAttack(ent, 800 * mult, 13000)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("Explosion", fx)
    end

    self:EmitSound("TacRP/weapons/rpg7/explode.wav", 125)

    self:Remove()
end