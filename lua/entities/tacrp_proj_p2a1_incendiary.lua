AddCSLuaFile()

ENT.Base                     = "tacrp_proj_p2a1_flare"
ENT.PrintName                = "P2A1 Incendiary Flare"
ENT.Spawnable                = false

ENT.Radius = 328

ENT.SafetyFuse = 0.3

ENT.SmokeTrail = true
ENT.FlareColor = Color(255, 200, 100)
ENT.FlareSizeMin = 16
ENT.FlareSizeMax = 32
ENT.Gravity = Vector(0, 0, 9.81 * 0.3)

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
        util.Effect("tacrp_m202_explode", fx)
        self:EmitSound("^ambient/fire/ignite.wav", 80, 108)
        self:EmitSound("^weapons/explode5.wav", 80, 115, 0.8)
    end

    self:Remove()
end


local mat = Material("effects/ar2_altfire1b")
function ENT:Draw()
    if !self.Light then
        self.Light = DynamicLight(self:EntIndex())
        if (self.Light) then
            self.Light.Pos = self:GetPos()
            self.Light.r = 255
            self.Light.g = 128
            self.Light.b = 50
            self.Light.Brightness = 1
            self.Light.Size = 328
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
        self.Light.Size = 728
        self.Light.Brightness = 1
        self.Light.DieTime = CurTime() + 4
        self.Light.Decay = 250
    end
    if !self.FireSound then return end
    self.FireSound:Stop()
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

        smoke:SetColor(255, 200, 25)
        smoke:SetLighting(false)
        smoke:SetDieTime(math.Rand(0.3, 0.5))
        smoke:SetGravity(Vector(0, 0, 0))
        smoke:SetNextThink( CurTime() + FrameTime() )
        smoke:SetThinkFunction( function(pa)
            if !pa then return end
            local col1 = Color(255, 128, 50)
            local col2 = Color(220, 200, 180)

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
        dmginfo:SetDamageType(self.ImpactDamageType)
        dmginfo:SetDamage(self.ImpactDamage * (self.NPCDamage and 0.25 or 1))
        dmginfo:SetDamageForce(data.OurOldVelocity * 20)
        dmginfo:SetDamagePosition(data.HitPos)
        data.HitEntity:TakeDamageInfo(dmginfo)
    end

    self:EmitSound("physics/plastic/plastic_barrel_impact_hard2.wav", 70, 110)
end