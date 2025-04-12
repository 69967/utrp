SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Taurus Raging Judge"
SWEP.AbbrevName = "Executioner"

SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "1Revolvers"

SWEP.Description = "Massive revolver shooting small-bore shotgun shells."

SWEP.Trivia_Caliber = ".410 Bore"
SWEP.Trivia_Manufacturer = "Taurus"
SWEP.Trivia_Year = "2010"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Main model: Firearms: Source, edited by speedonerd
Shells & speedloader: Call of Duty: Black Ops II
Sounds: Call of Duty: Black Ops II
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_executioner.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_executioner.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 10
SWEP.Damage_Min = 4
SWEP.Range_Min = 2000
SWEP.Range_Max = 4000
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0.1
SWEP.ArmorBonus = 0
SWEP.Num = 12

SWEP.MuzzleVelocity = 30000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1.25,
    [HITGROUP_STOMACH] = 0.9,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Double-Action"

SWEP.RPM = 160

SWEP.Spread = 0.04
SWEP.ShotgunPelletSpread = 0.015

SWEP.ShootTimeMult = 1

SWEP.RecoilPerShot = 2
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 50

SWEP.RecoilVisualKick = 3
SWEP.RecoilKick = 12
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

SWEP.RecoilSpreadPenalty = 0.05
SWEP.HipFireSpreadPenalty = 0.02

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.25

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

SWEP.BlindFireSuicideAng = Angle(-135, 0, 60)
SWEP.BlindFireSuicidePos = Vector(30, 24, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -10)

SWEP.SightAng = Angle(0.03, 0.05, 0.5)
SWEP.SightPos = Vector(-3.4, -0.1, -4.2)

SWEP.CorrectiveAng = Angle(-0.2, 0, 0.5)
SWEP.CorrectivePos = Vector(-0.125, 0, 0.13)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.Sway = 1
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 4

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "buckshot"

SWEP.ReloadTimeMult = 1.35

SWEP.ReloadUpInTime = 1.35

SWEP.JamSkipFix = true

// sounds

local path = "tacint_shark/executioner/"
local path1 = "tacrp/weapons/mr96/"
SWEP.Sound_Shoot = "^" .. path .. "fire_judge.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 0
SWEP.EjectEffect = 0

SWEP.MuzzleEffect = "muzzleflash_suppressed"

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

SWEP.AttachmentElements = {
    ["rail"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
}

SWEP.Attachments = {
--[[    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb"},
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        InstalledElements = {"rail"},
        Pos_VM = Vector(-5.4, -0.2, 8),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0.15, 7, 0.75),
        Ang_WM = Angle(0, -90, 0),
    },  ]]
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2.8, -0.1, 11),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 7.5, -1.8),
        Ang_WM = Angle(0, -90, 180),
    },
    [3] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Accessory",
        Category = "acc",
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
        Category = {"ammo_shotgun", "ammo_roulette"},
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

addsound("tacint_executioner.Release_Cylinder", path .. "open.wav")
addsound("tacint_executioner.Eject_Shells", path .. "empty_judge.wav")
addsound("tacint_executioner.Insert_Bullets", path1 .. "mr96_insert_bullets.wav")
addsound("tacint_executioner.Shut_Cylinder", path .. "close.wav")
addsound("tacint_executioner.Insert_Bullets-Mid", path1 .. "mr96_insert_bullets-mid.wav")
addsound("tacint_executioner.Cock_Hammer", path1 .. "mr96_cockhammer.wav")
addsound("tacint_executioner.Deploy", path1 .. "mr96_deploy.wav")