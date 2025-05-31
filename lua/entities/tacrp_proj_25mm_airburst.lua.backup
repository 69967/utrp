AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "25mm HE"
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

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

DEFINE_BASECLASS(ENT.Base)

function ENT:Initialize()
    BaseClass.Initialize(self)
    if SERVER then
        self:SetTrigger(true)
        self:UseTriggerBounds(true, 128)
    end
end

function ENT:StartTouch(ent)
    if SERVER and ent ~= self:GetOwner() and (ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot()) then
        self:Detonate()
    end
end

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner() or self
    local mult = (self.NPCDamage and 0.25 or 1) * TacRP.ConVars["mult_damage_explosive"]:GetFloat()
    util.BlastDamage(self, attacker, self:GetPos(), 400, 75 * mult)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())
    local dir = self:GetForward()

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        fx:SetMagnitude(8)
        fx:SetScale(1.5)
        fx:SetRadius(8)
        fx:SetNormal(dir)
        util.Effect("Sparks", fx)
        util.Effect("HelicopterMegaBomb", fx)
    end

    self:EmitSound(table.Random(self.ExplodeSounds), 125)
    self:EmitSound("physics/metal/metal_box_break1.wav", 100, 190, 0.5)

    self:Remove()
end

ENT.SmokeTrail = true

local smokeimages = {"particle/smokesprites_0001", "particle/smokesprites_0002", "particle/smokesprites_0003", "particle/smokesprites_0004", "particle/smokesprites_0005", "particle/smokesprites_0006", "particle/smokesprites_0007", "particle/smokesprites_0008", "particle/smokesprites_0009", "particle/smokesprites_0010", "particle/smokesprites_0011", "particle/smokesprites_0012", "particle/smokesprites_0013", "particle/smokesprites_0014", "particle/smokesprites_0015", "particle/smokesprites_0016"}
local function GetSmokeImage()
    return smokeimages[math.random(#smokeimages)]
end

function ENT:DoSmokeTrail()
    if CLIENT and self.SmokeTrail then
        local emitter = ParticleEmitter(self:GetPos())

        local smoke = emitter:Add(GetSmokeImage(), self:GetPos())

        smoke:SetStartAlpha(50)
        smoke:SetEndAlpha(0)

        smoke:SetStartSize(10)
        smoke:SetEndSize(math.Rand(20, 40))

        smoke:SetRoll(math.Rand(-180, 180))
        smoke:SetRollDelta(math.Rand(-1, 1))

        smoke:SetVelocity(-self:GetAngles():Forward() * 400 + (VectorRand() * 10))

        smoke:SetColor(200, 200, 200)
        smoke:SetLighting(true)

        smoke:SetDieTime(math.Rand(0.5, 1))
        smoke:SetGravity(Vector(0, 0, 0))

        local spark = emitter:Add("effects/spark", self:GetPos())

        spark:SetStartAlpha(255)
        spark:SetEndAlpha(255)

        spark:SetStartSize(4)
        spark:SetEndSize(0)

        spark:SetRoll(math.Rand(-180, 180))
        spark:SetRollDelta(math.Rand(-1, 1))

        spark:SetVelocity(-self:GetAngles():Forward() * 300 + (VectorRand() * 100))

        spark:SetColor(255, 255, 255)
        spark:SetLighting(false)

        spark:SetDieTime(math.Rand(0.1, 0.3))

        spark:SetGravity(Vector(0, 0, 10))

        emitter:Finish()
    end
end