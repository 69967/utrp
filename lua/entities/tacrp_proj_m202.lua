AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "M202 Rocket"
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

ENT.FlareColor = Color(255, 200, 150)

ENT.Radius = 400

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner()

    local mult = TacRP.ConVars["mult_damage_explosive"]:GetFloat()
    local dmg = DamageInfo()
    dmg:SetDamagePosition(self:GetPos())
    dmg:SetInflictor(self)
    dmg:SetAttacker(attacker)

    // Apply a small instance of damage to ignite first, before doing the real damage
    // This will ensure if the target dies it is on fire first (so it can ignite its ragdolls etc.)
    dmg:SetDamageType(DMG_SLOWBURN)
    dmg:SetDamage(5)
    util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

    dmg:SetDamageType(DMG_BLAST + DMG_BURN)
    dmg:SetDamage(250 * mult)
    util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

    self:ImpactTraceAttack(ent, 100 * mult, 100)

    local decaltr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() + self:GetForward() * 128,
        filter = self,
        mask = MASK_SOLID,
    })
    util.Decal("Scorch", decaltr.StartPos, decaltr.HitPos - (decaltr.HitNormal * 16), self)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("tacrp_m202_explode", fx)
        self:EmitSound("^weapons/explode5.wav", 100, 110)
        self:EmitSound("^ambient/fire/ignite.wav", 110, 110)
    end

    self:Remove()
end

local burn = {
    tacrp_proj_m202 = 12,
    tacrp_proj_p2a1_flare = 4,
    tacrp_proj_p2a1_paraflare = 4,
    tacrp_proj_p2a1_incendiary = 8,
}

hook.Add("PostEntityTakeDamage", "tacrp_pa_m202", function(ent, dmginfo, took)
    local infl = dmginfo:GetInflictor()
    if took and IsValid(infl) and burn[infl:GetClass()] and dmginfo:IsDamageType(DMG_SLOWBURN) then
        local fr = Lerp(1 - (ent:GetPos():Distance(infl:GetPos())) / infl.Radius, 0.25, 1)
        ent:Ignite(fr * burn[infl:GetClass()] * (ent:IsPlayer() and 1 or 2.5))
    end
end)