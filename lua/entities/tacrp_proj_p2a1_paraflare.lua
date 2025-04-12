AddCSLuaFile()

ENT.Base                     = "tacrp_proj_p2a1_flare"
ENT.PrintName                = "P2A1 Parachute Flare"
ENT.Spawnable                = false

ENT.InstantFuse = true
ENT.RemoteFuse = false
ENT.ImpactFuse = false

ENT.ExplodeOnDamage = false // projectile explodes when it takes damage.
ENT.ExplodeUnderwater = true

ENT.Delay = 2

ENT.Radius = 328

ENT.FlareColor = Color(255, 240, 240)

function ENT:Detonate(ent)
    local attacker = self.Attacker or self:GetOwner()

    local fx = EffectData()
    fx:SetOrigin(self:GetPos())

    if self:WaterLevel() > 0 then
        util.Effect("WaterSurfaceExplosion", fx)
    else
        self:EmitSound("tacint_extras/p2a1/confetti.wav", 80, 80)
    end

    local cloud = ents.Create("tacrp_flare_cloud_para")

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
            cloud:GetPhysicsObject():SetVelocityInstantaneous(self:GetVelocity() * 1 + Vector(math.Rand(-64, 64), math.Rand(-64, 64), 256))
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
            self.Light.g = 200
            self.Light.b = 100
            self.Light.Brightness = 0.5
            self.Light.Size = 728
            self.Light.DieTime = CurTime() + 2
        end
    else
        self.Light.Pos = self:GetPos()
    end

    render.SetMaterial(mat)
    render.DrawSprite(self:GetPos(), math.Rand(self.FlareSizeMin, self.FlareSizeMax), math.Rand(self.FlareSizeMin, self.FlareSizeMax), self.FlareColor)
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
            local col1 = Color(255, 200, 150)
            local col2 = Color(255, 255, 225)

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
