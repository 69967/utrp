AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "25mm Stun"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.1

ENT.ExplodeSounds = {
    "^TacRP/weapons/grenade/frag_explode-1.wav",
    "^TacRP/weapons/grenade/frag_explode-2.wav",
    "^TacRP/weapons/grenade/frag_explode-3.wav",
}

ENT.SmokeTrail = true

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner() or self
    local mult = (self.NPCDamage and 0.25 or 1) * TacRP.ConVars["mult_damage_explosive"]:GetFloat()

    local dmg = DamageInfo()
    dmg:SetAttacker(attacker)
    dmg:SetInflictor(self)
    dmg:SetDamageType(DMG_SONIC)
    dmg:SetDamagePosition(self:GetPos())
    dmg:SetDamage(50 * mult)
    util.BlastDamageInfo(dmg, self:GetPos(), 256)
    dmg:SetDamage(5)
    util.BlastDamageInfo(dmg, self:GetPos(), 512)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        fx:SetRadius(512)
        fx:SetScale(0.5)
        util.Effect("TacRP_flashexplosion", fx)
        util.Effect("HelicopterMegaBomb", fx)
    end

    TacRP.Flashbang(self, self:GetPos(), 512, 1, 0.5, 0.5)
    self:EmitSound(table.Random(self.ExplodeSounds), 115)

    self:Remove()
end