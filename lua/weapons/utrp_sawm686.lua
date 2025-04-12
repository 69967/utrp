SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

SWEP.PrintName = "SW Model 686"
SWEP.AbbrevName = "SW M686"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "1Revolvers"

SWEP.Description = "Magnum revolver with balanced, reliable performance."

SWEP.Trivia_Caliber = ".357 Magnum"
SWEP.Trivia_Manufacturer = "Smith & Wesson"
SWEP.Trivia_Year = "1981"

SWEP.ViewModel = "models/weapons/tacint_extras/v_sw686.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_sw686.mdl"

SWEP.Slot = 1


// "ballistics"
SWEP.Damage_Max = 45
SWEP.Damage_Min = 25
SWEP.Range_Min = 300
SWEP.Range_Max = 2500
SWEP.Penetration = 7
SWEP.ArmorPenetration = 0

SWEP.MuzzleVelocity = 35000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.8,
    [HITGROUP_RIGHTARM] = 0.8,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
    [HITGROUP_GEAR] = 0.8
}

SWEP.Firemode = 1

SWEP.FiremodeName = "Double-Action"

SWEP.RPM = 300

SWEP.Spread = 0.001

SWEP.ShootTimeMult = 1

SWEP.Spread = 0.0033
SWEP.RecoilSpreadPenalty = 0.0015
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 5
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.5
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 3
SWEP.RecoilKick = 4
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.8

SWEP.AimDownSightsTime = 0.23
SWEP.SprintToFireTime = 0.23

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 4.5

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_REVOLVER

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-125, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 12, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(-0.05, 0, 0)
SWEP.SightPos = Vector(-3.45, 0, -3.2)

SWEP.CorrectivePos = Vector(0, 0, 0.1)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.6

// reload

SWEP.ClipSize = 6
SWEP.Ammo = "357"

SWEP.ReloadTimeMult = 1

SWEP.ReloadUpInTime = 1.35

SWEP.JamSkipFix = true

// sounds

local path = "TacRP/weapons/mr96/"
local path1 = "tacint_extras/sw686/"

SWEP.Sound_Shoot = "^" .. path1 .. "revolver_fire_01.wav"
SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 2
SWEP.QCA_Eject = 0
SWEP.EjectEffect = 0

SWEP.MuzzleEffect = "muzzleflash_silenced"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["fire_iron"] = "shoot1",
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2"},
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "draw"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -3, -4.5),
    vm_ang = Angle(0, 15, 0),
    t = 0.5,
    tmax = 0.5,
    bones = {
        {
            bone = "ValveBiped.cylinder",
            ang = Angle(-60, 0, 0),
            t0 = 0,
            t1 = 0.25,
        },
        {
            bone = "ValveBiped.hammer",
            ang = Angle(35, 0, 0),
            t0 = 0.05,
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
        VMScale = 0.8,
        WMScale = 1,
        Pos_VM = Vector(-3.75, -0.125, 6),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 4, -0.2),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2.25, -0.125, 9),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 8, -2.25),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_holster", "acc_brace", "acc_bipod"}, // yes, MR96 with bipod is a real thing!
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
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

addsound("tacint_sw686.Release_Cylinder", path .. "mr96_release_cylinder.wav")
addsound("tacint_sw686.Eject_Shells", path .. "mr96_eject_shells.wav")
addsound("tacint_sw686.Insert_Bullets", path .. "mr96_insert_bullets.wav")
addsound("tacint_sw686.Shut_Cylinder", path .. "mr96_shut_cylinder.wav")
addsound("tacint_sw686.Insert_Bullets-Mid", path .. "mr96_insert_bullets-mid.wav")
addsound("tacint_sw686.Cock_Hammer", path1 .. "revolver_hammerback1.wav")
addsound("tacint_sw686.Deploy", path1 .. "revolver_spincyl.wav")