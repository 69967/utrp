AddCSLuaFile()

ENT.Base                     = "tacrp_proj_smaw"
ENT.PrintName                = "SMAW Triple Rocket"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/rocket_deployed.mdl"

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.1

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

ENT.FlareColor = Color(200, 255, 255)
ENT.FlareSizeMin = 48
ENT.FlareSizeMax = 64

ENT.SteerSpeed = 180
ENT.SteerDelay = 0.25

ENT.MaxSpeed = 4000
ENT.Acceleration = 3000
ENT.SteerBrake = 0

ENT.AlwaysSteer = true

ENT.ExplodeSounds = {
    "^TacRP/weapons/grenade/40mm_explode-1.wav",
    "^TacRP/weapons/grenade/40mm_explode-2.wav",
    "^TacRP/weapons/grenade/40mm_explode-3.wav",
}

function ENT:OnInitialize()
    if CLIENT then return end
    local wep = self.Inflictor
    if IsValid(wep) and !wep:GetTactical() then
        local pos_tr = wep:GetMuzzleOrigin()
        local ang = wep:GetShootDir()

        local tr = util.TraceLine({
            start = pos_tr,
            endpos = pos_tr + (ang:Forward() * 30000),
            mask = MASK_VISIBLE,
            filter = wep:GetOwner()
        })
        if tr.Hit then
            self.TargetPos = tr.HitPos
        end
    end
end

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner()
    local mult = TacRP.ConVars["mult_damage_explosive"]:GetFloat() * (self.NPCDamage and 0.25 or 1)

    util.BlastDamage(self, attacker, self:GetPos(), 256, 70 * mult)
    self:ImpactTraceAttack(ent, 300 * mult, 10000)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("HelicopterMegaBomb", fx)
    end

    self:EmitSound(self.ExplodeSounds[math.random(1, #self.ExplodeSounds)], 100, 90)

    self:Remove()
end