AddCSLuaFile()

ENT.Base                     = "tacrp_proj_base"
ENT.PrintName                = "P2A1 Signal Flare"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/grenade_40mm.mdl"

ENT.IsRocket = false // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0

ENT.ImpactDamage = 50
ENT.ImpactDamageType = DMG_BURN + DMG_SLOWBURN

ENT.AudioLoop = false

ENT.Radius = 200

ENT.SmokeTrail = true
ENT.FlareColor = Color(255, 200, 200)
ENT.FlareSizeMin = 16
ENT.FlareSizeMax = 32
ENT.Gravity = Vector(0, 0, 9.81 * 0.333333)

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:PhysicsInitBox(-Vector(3, 3, 3), Vector(3, 3, 3) )
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

        local phys = self:GetPhysicsObject()
        if !phys:IsValid() then
            self:Remove()
            return
        end

        phys:EnableDrag(false)
        phys:SetDragCoefficient(0)
        phys:SetMass(1)
        phys:SetBuoyancyRatio(0)
        phys:Wake()
    end

    self.SpawnTime = CurTime()
    self.NextFlareRedirectTime = 0

    self.NPCDamage = IsValid(self:GetOwner()) and self:GetOwner():IsNPC() and !TacRP.ConVars["npc_equality"]:GetBool()

    if self.AudioLoop then
        self.LoopSound = CreateSound(self, self.AudioLoop)
        self.LoopSound:Play()
    end

    if self.InstantFuse then
        self.ArmTime = CurTime()
        self.Armed = true
    end
end

function ENT:PhysicsUpdate(phys)
    if phys:IsGravityEnabled() and self:WaterLevel() <= 2 then
        local v = phys:GetVelocity()
        phys:SetVelocityInstantaneous(v + self.Gravity)
    end
end

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner() or self
    local mult = TacRP.ConVars["mult_damage_explosive"]:GetFloat() * (self.NPCDamage and 0.25 or 1)
    local dmg = DamageInfo()
    dmg:SetDamagePosition(self:GetPos())
    dmg:SetInflictor(self)
    dmg:SetAttacker(attacker)

    // Apply a small instance of damage to ignite first, before doing the real damage
    // This will ensure if the target dies it is on fire first (so it can ignite its ragdolls etc.)
    dmg:SetDamageType(DMG_SLOWBURN)
    dmg:SetDamage(5)
    util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

    dmg:SetDamageType(DMG_BURN)
    dmg:SetDamage(60 * mult)
    util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

    // TacRP.Flashbang(self, self:GetPos(), 512, 0.5, 0.1, 0)

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        util.Effect("tacrp_flare_explode", fx)
        self:EmitSound("^ambient/fire/ignite.wav", 80, 112)
    end

    local cloud = ents.Create("tacrp_flare_cloud")

    if !IsValid(cloud) then return end

    cloud:SetPos(self:GetPos())
    cloud:SetAngles(self:GetAngles())
    cloud:SetOwner(attacker)
    timer.Simple(0, function()
        cloud:Spawn()
        if IsValid(self:GetParent()) then
            cloud:SetParent(self:GetParent())
        elseif self:GetMoveType() == MOVETYPE_NONE then
            cloud:SetMoveType(MOVETYPE_NONE)
        else
            cloud:GetPhysicsObject():SetVelocityInstantaneous(self:GetVelocity() * 0.5)
        end
        self:Remove()
    end)
end

local mat = Material("effects/ar2_altfire1b")
function ENT:Draw()
    if !self.Light then
        self.Light = DynamicLight(self:EntIndex())
        if (self.Light) then
            self.Light.Pos = self:GetPos()
            self.Light.r = 255
            self.Light.g = 75
            self.Light.b = 60
            self.Light.Brightness = 1
            self.Light.Size = 1024
            self.Light.DieTime = CurTime() + 30
        end
    else
        self.Light.Pos = self:GetPos()
    end

    render.SetMaterial(mat)
    render.DrawSprite(self:GetPos(), math.Rand(self.FlareSizeMin, self.FlareSizeMax), math.Rand(self.FlareSizeMin, self.FlareSizeMax), self.FlareColor)
end

function ENT:OnRemove()
    if self.Light then
        self.Light.Size = 1200
        self.Light.Brightness = 1.5
        self.Light.DieTime = CurTime() + 1
        self.Light.Decay = 2000
    end
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:DoSmokeTrail()
    if CLIENT and self.SmokeTrail and !(self:GetOwner() == LocalPlayer() and (self.SpawnTime + 0.1) > CurTime()) then
        local emitter = ParticleEmitter(self:GetPos())

        local smoke = emitter:Add("particles/smokey", self:GetPos())

        smoke:SetStartAlpha(30)
        smoke:SetEndAlpha(0)

        smoke:SetStartSize(4)
        smoke:SetEndSize(math.Rand(30, 40))

        smoke:SetRoll(math.Rand(-180, 180))
        smoke:SetRollDelta(math.Rand(-1, 1))

        smoke:SetPos(self:GetPos())
        smoke:SetVelocity(VectorRand() * 4)

        smoke:SetColor(255, 50, 25)
        smoke:SetLighting(false)
        smoke:SetDieTime(math.Rand(3.5, 4.5))
        smoke:SetGravity(Vector(0, 0, -7))
        smoke:SetNextThink( CurTime() + FrameTime() )
        smoke:SetThinkFunction( function(pa)
            if !pa then return end
            local col1 = Color(255, 50, 25)
            local col2 = Color(255, 155, 155)

            local col3 = col1
            local d = pa:GetLifeTime() / pa:GetDieTime()
            col3.r = Lerp(d, col1.r, col2.r)
            col3.g = Lerp(d, col1.g, col2.g)
            col3.b = Lerp(d, col1.b, col2.b)

            pa:SetColor(col3.r, col3.g, col3.b)
            pa:SetNextThink( CurTime() + FrameTime() )
        end )

        emitter:Finish()
    end
end


function ENT:SafetyImpact(data, collider)
    local attacker = self.Attacker or self:GetOwner()
    local ang = data.OurOldVelocity:Angle()
    local fx = EffectData()
    fx:SetOrigin(data.HitPos)
    fx:SetNormal(-ang:Forward())
    fx:SetAngles(-ang)
    util.Effect("StunstickImpact", fx)

    if IsValid(data.HitEntity) then
        local dmginfo = DamageInfo()
        dmginfo:SetAttacker(attacker)
        dmginfo:SetInflictor(self)
        dmginfo:SetDamageType(DMG_CRUSH + DMG_SLOWBURN)
        dmginfo:SetDamage(self.ImpactDamage * (self.NPCDamage and 0.25 or 1))
        dmginfo:SetDamageForce(data.OurOldVelocity * 20)
        dmginfo:SetDamagePosition(data.HitPos)
        data.HitEntity:TakeDamageInfo(dmginfo)
    end

    self:EmitSound("physics/plastic/plastic_barrel_impact_hard2.wav", 70, 110)
end