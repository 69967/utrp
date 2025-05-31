ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Flare Particle"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/Items/AR2_Grenade.mdl"

ENT.FireTime = 15

ENT.Armed = false

ENT.NextDamageTick = 0

ENT.Ticks = 0

ENT.FlareLength = 1

AddCSLuaFile()

function ENT:Initialize()
    self.SpawnTime = CurTime()

    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        local maxs = Vector(2, 2, 2)
        local mins = -maxs
        self:PhysicsInitBox(mins, maxs)
        self:DrawShadow( false )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
            phys:SetDragCoefficient(4)
        end

        self:Detonate()
    end
end

ENT.LastTraceTime = 0
ENT.LastTracePos = nil

function ENT:Think()
    if CLIENT then
        local d = Lerp((self.SpawnTime + self.FireTime - CurTime()) / 12, 1, 0.000001) ^ 2

        if !self.Light then
            self.Light = DynamicLight(self:EntIndex())
            if (self.Light) then
                self.Light.Pos = self:GetPos()
                self.Light.r = 255
                self.Light.g = 200
                self.Light.b = 140
                self.Light.Brightness = 1
                self.Light.Size = 1500
                self.Light.DieTime = CurTime() + self.FireTime
            end
        else
            self.Light.Pos = self:GetPos()
        end

        -- fucking expensive
        --[[]
        if !self.ProjectedTexture then
            self.ProjectedTexture = ProjectedTexture()
            self.ProjectedTexture:SetTexture("effects/flashlight001")
            self.ProjectedTexture:SetColor(Color(255, 200, 140))
            self.ProjectedTexture:SetNearZ(728)
            self.ProjectedTexture:SetFarZ(4096)
            self.ProjectedTexture:SetAngles(down)
            self.ProjectedTexture:SetFOV(170)
            self.ProjectedTexture:SetLightWorld(false)
            self.ProjectedTexture:SetBrightness(0.75)
        end
        self.ProjectedTexture:SetPos(self:GetPos())
        self.ProjectedTexture:Update()
        ]]

        local emitter = ParticleEmitter(self:GetPos())

        if !self:IsValid() or self:WaterLevel() > 2 then return end
        if !IsValid(emitter) then return end

        if self.Ticks % math.ceil(4 + d * 8) == 0 then
            local fire = emitter:Add("particles/smokey", self:GetPos() + Vector(math.Rand(-4, 4), math.Rand(-4, 4), 8))
            fire:SetVelocity( VectorRand() * 8 )
            fire:SetGravity( Vector(0, 0, 100) )
            fire:SetDieTime( self.FlareLength * math.Rand(5, 6) )
            fire:SetStartAlpha( 20 )
            fire:SetEndAlpha( 0 )
            fire:SetStartSize( 12 )
            fire:SetEndSize( math.Rand(32, 48) )
            fire:SetRoll( math.Rand(-180, 180) )
            fire:SetRollDelta( math.Rand(-0.2,0.2) )
            fire:SetColor( 255, 255, 255 )
            fire:SetAirResistance( 100 )
            fire:SetPos( self:GetPos() )
            fire:SetLighting( false )
            fire:SetCollide(true)
            fire:SetBounce(1)
            fire:SetNextThink( CurTime() + FrameTime() )
            fire:SetThinkFunction( function(pa)
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
        end

        if self.Ticks % math.ceil(4 + d * 10)  == 0 then
            local fire = emitter:Add("effects/spark", self:GetPos())
            fire:SetVelocity( VectorRand() * 300 + Vector(0, 0, 300) )
            fire:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), -2000) )
            fire:SetDieTime( math.Rand(0.5, 1) )
            fire:SetStartAlpha( 255 )
            fire:SetEndAlpha( 0 )
            fire:SetStartSize( 5 )
            fire:SetEndSize( 0 )
            fire:SetRoll( math.Rand(-180, 180) )
            fire:SetRollDelta( math.Rand(-0.2,0.2) )
            fire:SetColor( 255, 255, 255 )
            fire:SetAirResistance( 50 )
            fire:SetPos( self:GetPos() )
            fire:SetLighting( false )
            fire:SetCollide(true)
            fire:SetBounce(0.8)
            fire.Ticks = 0
        end

        emitter:Finish()

        self.Ticks = self.Ticks + 1
    else

        if !self:GetOwner():IsValid() then self:Remove() return end

        if self.NextDamageTick > CurTime() then return end

        if self:WaterLevel() > 2 then self:Remove() return end

        local dmg = DamageInfo()
        dmg:SetDamageType(DMG_BURN)
        dmg:SetDamage(15)
        dmg:SetInflictor(self)
        dmg:SetAttacker(self:GetOwner())
        util.BlastDamageInfo(dmg, IsValid(self:GetParent()) and self:GetParent():GetPos() or self:GetPos(), 96)

        if self.SpawnTime + self.FireTime <= CurTime() then self:Remove() return end

        self.NextDamageTick = CurTime() + 0.2
        self:NextThink(self.NextDamageTick)
        return true
    end
end

function ENT:OnRemove()
    if self.Light then
        self.Light.dietime = CurTime() + 0.5
        self.Light.decay = 800
    end
    if IsValid(self.ProjectedTexture) then
        self.ProjectedTexture:Remove()
    end
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if !self:IsValid() then return end

    self.Armed = true

    if self.Order and self.Order != 1 then return end

    -- self.FireSound = CreateSound(self, "tacrp_extras/grenades/fire_loop_1.wav")
    self.FireSound = CreateSound(self, "weapons/flaregun/burn.wav")
    self.FireSound:SetSoundLevel(70)
    self.FireSound:Play()
    self.FireSound:ChangePitch(105)

    self.FireSound:ChangePitch(95, self.FireTime)

    timer.Simple(self.FireTime - 1, function()
        if !IsValid(self) then return end

        self.FireSound:ChangeVolume(0, 1)
    end)

    timer.Simple(self.FireTime, function()
        if !IsValid(self) then return end

        self:Remove()
    end)
end

ENT.FlareColor = Color(255, 240, 240)
ENT.FlareSizeMin = 64
ENT.FlareSizeMax = 96

local mat = Material("effects/ar2_altfire1b")
function ENT:Draw()
    render.SetMaterial(mat)
    render.DrawSprite(self:GetPos() + Vector(0, 0, 4), math.Rand(self.FlareSizeMin, self.FlareSizeMax), math.Rand(self.FlareSizeMin, self.FlareSizeMax), self.FlareColor)
end

function ENT:PhysicsUpdate(phys)
    if phys:IsGravityEnabled() and self:WaterLevel() <= 2 then
        local v = phys:GetVelocity()
        v.z = math.max(v.z, -70)
        phys:SetVelocityInstantaneous(v)
    end
end