SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "FN MAG"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "3Security"
SWEP.SubCatType = "5Machine Gun"

SWEP.Description = "Machine gun with practically no mobility but compensates with incredible firepower and capacity."
SWEP.Description_Quote = "\"You can't leave me here with these... animals.\"" // Made up out of thin air

SWEP.Trivia_Caliber = "7.62x51mm"
SWEP.Trivia_Manufacturer = "Fabrique National"
SWEP.Trivia_Year = "1958"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = "Model & Texture: Call to Arms\nAnimation: Tactical Intervention\nPorted By: Arctic"

SWEP.ViewModel = "models/weapons/tacint/v_fnmag.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_fnmag.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 50,
        Damage_Min = 34,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 20,
        Damage_Min = 13,
        Range_Min = 600,
        Range_Max = 2000,
        ClipSize = 200,

        HipFireSpreadPenalty = 0.03,
        RecoilMaximum = 20,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachineGun

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

// "ballistics"

SWEP.Damage_Max = 45
SWEP.Damage_Min = 28
SWEP.Range_Min = 1800
SWEP.Range_Max = 6000
SWEP.Penetration = 10
SWEP.ArmorPenetration = 0.75

SWEP.MuzzleVelocity = 22000

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 650

SWEP.Spread = 0.009

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 50
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 25
SWEP.RecoilFirstShotMult = 2

SWEP.RecoilVisualKick = 1.25
SWEP.RecoilKick = 5
SWEP.RecoilAltMultiplier = 170
SWEP.RecoilStability = 0.05

SWEP.HipFireSpreadPenalty = 0.05
SWEP.MoveSpreadPenalty = 0.02
SWEP.RecoilSpreadPenalty = 0.01
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.65
SWEP.ShootingSpeedMult = 0.1
SWEP.SightedSpeedMult = 0.35

SWEP.ReloadSpeedMult = 0.1
SWEP.ReloadSpeedMultTime = 1

SWEP.AimDownSightsTime = 0.75
SWEP.SprintToFireTime = 0.90

SWEP.Sway = 3
SWEP.ScopedSway = 0.75

SWEP.FreeAimMaxAngle = 12

SWEP.Bipod = true
SWEP.BipodRecoil = 0.25
SWEP.BipodKick = 0.125

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -7)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0, 0.15, 0)
SWEP.SightPos = Vector(-4.355, -5, -3.2)

SWEP.CorrectivePos = Vector(0.025, 0, 0.125)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 200
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.75
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/fnmag.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 3.5
SWEP.DropMagazineTime = 0.7

SWEP.BulletBodygroups = {
    [1] = {1, 1},
    [2] = {2, 1},
    [3] = {3, 1},
    [4] = {4, 1},
    [5] = {5, 1},
    [6] = {6, 1},
    [7] = {7, 1},
    [8] = {8, 1},
    [9] = {9, 1},
    [10] = {10, 1},
    [11] = {11, 1},
    [12] = {12, 1},
}
SWEP.DefaultBodygroups = "000000000000000000000000000"
SWEP.BulletBodygroupsSetAll = true

// sounds

local path = "TacRP/weapons/mg4/"
local path1 = "tacint_extras/fnmag/"

SWEP.Sound_Shoot = "^" .. path1 .. "fire.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/g36k/g36k_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 90
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_minimi"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = {"fire4_L", "fire3_L", "fire2_L", "fire1_L"},
    ["fire1"] = "fire1_L",
    ["fire2"] = "fire2_L",
    ["fire3"] = "fire3_L",
    ["fire4"] = "fire4_L",
    ["fire5"] = "fire5_L",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
}

//ValveBiped.MG4_root

SWEP.NoTactical = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped.feed_cover",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1.1,
        Pos_VM = Vector(-1.1, -0.2, -4),
        Pos_WM = Vector(8, 1.15, -7),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical_zoom", "tactical_ebullet"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "extendedbelt", "acc_duffle", "acc_bipod", "acc_sling"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_auto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Ammo",
        Category = {"ammo_rifle"},
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

addsound("TacInt_mg4.Clip_Out", path .. "clip_out-1.wav")
addsound("TacInt_mg4.Clip_In", path .. "clip_in-1.wav")
addsound("TacInt_mg4.bolt_release", path .. "bolt_release-1.wav")
addsound("TacInt_mg4.bolt_back", path .. "bolt_back-1.wav")
addsound("TacInt_mg4.bolt_forward", path .. "bolt_forward-1.wav")
addsound("TacInt_mg4.feedcover_close", path .. "feed_cover_close-1.wav")
addsound("TacInt_mg4.feedcover_open", path .. "feed_cover_open-1.wav")
addsound("TacInt_mg4.insertbullets", path .. "insert_bullets-1.wav")
addsound("TacInt_mg4.deploy", path .. "deploy-1.wav")