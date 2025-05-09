AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "25mm HEAT"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.15

ENT.ExplodeSounds = {
    "^TacRP/weapons/grenade/frag_explode-1.wav",
    "^TacRP/weapons/grenade/frag_explode-2.wav",
    "^TacRP/weapons/grenade/frag_explode-3.wav",
}

ENT.SmokeTrail = true

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner() or self
    local mult = (self.NPCDamage and 0.25 or 1) * TacRP.ConVars["mult_damage_explosive"]:GetFloat()

    util.BlastDamage(self, attacker, self:GetPos(), 256, 100 * mult)
    self:ImpactTraceAttack(ent, 400 * mult, 12000)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("HelicopterMegaBomb", fx)
    end

    self:EmitSound(table.Random(self.ExplodeSounds), 125)

    self:Remove()
end