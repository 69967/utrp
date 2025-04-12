AddCSLuaFile()

ENT.Base                     = "tacrp_proj_smaw"
ENT.PrintName                = "SMAW Nikita Rocket"
ENT.Spawnable                = false

ENT.Model                    = "models/weapons/tacint/rocket_deployed.mdl"

ENT.IsRocket = true // projectile has a booster and will not drop.

ENT.InstantFuse = false // projectile is armed immediately after firing.
ENT.RemoteFuse = false // allow this projectile to be triggered by remote detonator.
ENT.ImpactFuse = true // projectile explodes on impact.

ENT.ExplodeOnDamage = true
ENT.ExplodeUnderwater = true

ENT.Delay = 0
ENT.SafetyFuse = 0.5

ENT.AudioLoop = "TacRP/weapons/rpg7/rocket_flight-1.wav"

ENT.SmokeTrail = true

ENT.FlareColor = Color(150, 255, 255)
ENT.FlareSizeMin = 50
ENT.FlareSizeMax = 80

ENT.SteerSpeed = 150
ENT.SteerDelay = 0.5

ENT.MaxSpeed = 320
ENT.MinSpeed = 0
ENT.Acceleration = 320
ENT.SteerBrake = 0

ENT.CornershotOffset = Vector()
ENT.CornershotAngles = Angle()

DEFINE_BASECLASS(ENT.Base)

function ENT:SetupDataTables()
    self:NetworkVar("Angle", 0, "DesireAng")
    self:NetworkVar("Float", 0, "DesireLast")
    BaseClass.SetupDataTables(self)
end

function ENT:Initialize()
    BaseClass.Initialize(self)
end

function ENT:OnThink()
    if IsValid(self:GetWeapon()) and !self.Tracked then
        self:GetWeapon():SetCornershotEntity(self)
        self.Tracked = true
        if CLIENT then
            self:SetPredictable( true )
        end
    end
    BaseClass.OnThink(self)
end

function ENT:PhysicsUpdate(phys)
    local v = phys:GetVelocity()
    if (self.SteerDelay + self.SpawnTime) <= CurTime() then
        local tgtang = angle_zero
        if (self:GetDesireLast() + 0.1) > CurTime() then
            tgtang = self:GetDesireAng()
        end
        local p = self:GetAngles().p
        local y = self:GetAngles().y

        p = math.ApproachAngle(p, p + tgtang.p, FrameTime() * self.SteerSpeed)
        y = math.ApproachAngle(y, y + tgtang.y, FrameTime() * self.SteerSpeed)

        self:SetAngles(Angle(p, y, 0))
    end

    phys:SetVelocityInstantaneous(self:GetForward() * math.Clamp(v:Length() + self.Acceleration * FrameTime(), self.MinSpeed, self.MaxSpeed))

end

hook.Add( "StartCommand", "TacRP_Nikita_StartCommand", function( ply, cmd )
    local wep = ply:GetActiveWeapon()
    if IsValid(wep) and wep.ArcticTacRP and wep:GetClass() == "tacrp_h_smaw" and wep:GetTactical() and !wep:GetIsSprinting() and !wep:GetReloading() and IsValid(wep:GetOwner()) and wep:GetOwner():IsPlayer() and wep:GetOwner():Alive() and wep:GetScopeLevel() > 0 then
        local rocket = wep:GetCornershotEntity()
        if IsValid(rocket) then
            local pitch = (cmd:KeyDown( IN_FORWARD ) and 1) or (cmd:KeyDown( IN_BACK ) and -1) or 0
            local yaw = (cmd:KeyDown( IN_MOVERIGHT ) and 1) or (cmd:KeyDown( IN_MOVELEFT ) and -1) or 0

            rocket:SetDesireAng( Angle( -pitch*90*FrameTime(), -yaw*90*FrameTime(), 0 ) )
            rocket:SetDesireLast( CurTime() )

            cmd:ClearMovement()
        end
    end
end)

hook.Add( "SetupPlayerVisibility", "TacRP_Nikita_SetupPlayerVisibility", function( ply, viewEntity )
    local wep = ply:GetActiveWeapon()
    if IsValid(wep) and wep.ArcticTacRP and wep:GetClass() == "tacrp_h_smaw" and wep:GetTactical() and IsValid(wep:GetOwner()) and wep:GetOwner():IsPlayer() and wep:GetOwner():Alive() then
        local rocket = wep:GetCornershotEntity()
        if IsValid(rocket) then
            -- if !rocket:TestPVS() then -- If we don't test if the PVS is already loaded, it could crash the server.
                -- Is what you say, Wiki, but it doesn't JUST accept no arguments and it won't work with it. If it crashes, here's why!!
                AddOriginToPVS( rocket:GetPos() )
            -- end
        end
    end
end )