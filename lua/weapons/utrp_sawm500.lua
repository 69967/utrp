SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

SWEP.PrintName = "SW Model 500"
SWEP.AbbrevName = "M500"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "1Revolvers"

SWEP.Description = "Massive long barrel revolver firing a massive magnum round, reigning as the most powerful production handgun in the world."

SWEP.Trivia_Caliber = ".500 S&W Magnum"
SWEP.Trivia_Manufacturer = "Smith & Wesson"
SWEP.Trivia_Year = "2003"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Alliance of Valiant Arms
Originally ported to CS 1.6 by GR_Lucia
Sound: Ghost597879, MSKyuuni & Zira
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_500mag.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_m500.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 125
SWEP.Damage_Min = 20
SWEP.Range_Min = 5000
SWEP.Range_Max = 15000
SWEP.Penetration = 12
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 5

SWEP.MuzzleVelocity = 40000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 20,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
    [HITGROUP_GEAR] = 1
}

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Double-Action"

SWEP.RPM = 180

SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.00175
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.005
SWEP.PeekPenaltyFraction = 0.125

SWEP.RecoilPerShot = 15
SWEP.RecoilMaximum = 75
SWEP.RecoilResetTime = 0.5
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 9
SWEP.RecoilKick = 16
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.233
SWEP.SprintToFireTime = 0.233

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_REVOLVER

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6.25)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 60)
SWEP.BlindFireSuicidePos = Vector(35, 18, -4)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -10)

SWEP.SightAng = Angle(0.01, 0.6, 0.4)
SWEP.SightPos = Vector(-3.45, 0, -4.25)

SWEP.CorrectiveAng = Angle(-0.2, 0, 0.5)
SWEP.CorrectivePos = Vector(-0.125, 0, 0.13)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.Sway = 2
SWEP.ScopedSway = 0.75

SWEP.FreeAimMaxAngle = 5

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "357"

SWEP.ReloadTimeMult = 1.25

SWEP.ReloadUpInTime = 1.35

SWEP.JamSkipFix = true

// sounds

local path = "tacint_shark/500mag/"
local path1 = "tacrp/weapons/mr96/"
SWEP.Sound_Shoot = "^" .. path .. "deagle-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 2
SWEP.QCA_Eject = 0
SWEP.EjectEffect = 0

SWEP.MuzzleEffect = "muzzleflash_1"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2"},
    ["melee"] = "melee2",
    ["jam"] = "draw",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -3, -5),
    vm_ang = Angle(0, 20, 0),
    t = 0.75,
    tmax = 0.75,
    bones = {
        {
            bone = "ValveBiped.cylinder",
            ang = Angle(-60, 0, 0),
            t0 = 0,
            t1 = 0.3,
        },
        {
            bone = "ValveBiped.hammer",
            ang = Angle(35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.2,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-4.7, -0.1, 10),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0.15, 8, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2.75, -0.1, 11),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 10, -1.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Trigger",
        Category = {"trigger_revolver"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol", "ammo_roulette"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    }
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_m500.Release_Cylinder", path1 .. "mr96_release_cylinder.wav")
addsound("tacint_m500.Eject_Shells", path1 .. "mr96_eject_shells.wav")
addsound("tacint_m500.Insert_Bullets", path1 .. "mr96_insert_bullets.wav")
addsound("tacint_m500.Shut_Cylinder", path1 .. "mr96_shut_cylinder.wav")
addsound("tacint_m500.Insert_Bullets-Mid", path1 .. "mr96_insert_bullets-mid.wav")
addsound("tacint_m500.Cock_Hammer", path1 .. "mr96_cockhammer.wav")
addsound("tacint_m500.Deploy", path1 .. "mr96_deploy.wav")