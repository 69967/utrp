SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "SKS"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "5Battle Rifle"

SWEP.Description = "Soviet semi-automatic rifle intended to complement the AK. A well-rounded medium range firearm."
SWEP.Description_Quote = "\"Don't breathe.\"" // Mad Max: Fury Road, when Furiosa snipes Bullet Farmer's spotlight

SWEP.Trivia_Caliber = "7.62x39mm"
SWEP.Trivia_Manufacturer = "Tula Arsenal"
SWEP.Trivia_Year = "1949"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = "Assets: Firearms: Source\nAnimations: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint_extras/v_sks.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_sks.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 35,
        Damage_Min = 22,
        Range_Min = 1500,
        Range_Max = 3000,
        RPM = 500,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 25,
        Damage_Min = 16,
        Range_Min = 1000,
        Range_Max = 2500,

        RPM = 300,
        RPMMultSemi = 0.75,

        RecoilMaximum = 6,
        RecoilResetTime = 0.03,
        RecoilDissipationRate = 18,
        RecoilFirstShotMult = 0.8,
        RecoilSpreadPenalty = 0.003,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MarksmanRifle

// "ballistics"

SWEP.Damage_Max = 30 // damage at minimum range
SWEP.Damage_Min = 20 // damage at maximum range
SWEP.Range_Min = 600 // distance for which to maintain maximum damage
SWEP.Range_Max = 2800 // distance at which we drop to minimum damage
SWEP.Penetration = 8 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.705

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

SWEP.MuzzleVelocity = 32000

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 480
SWEP.RPMMultSemi = 0.75

SWEP.Spread = 0.003

SWEP.ShootTimeMult = 0.65

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 6
SWEP.RecoilResetTime = 0.01
SWEP.RecoilDissipationRate = 35
SWEP.RecoilFirstShotMult = 0.9

SWEP.RecoilVisualKick = 0.75
SWEP.RecoilKick = 4
SWEP.RecoilStability = 0.5
SWEP.RecoilAltMultiplier = 200

SWEP.RecoilSpreadPenalty = 0.0025
SWEP.HipFireSpreadPenalty = 0.03
SWEP.PeekPenaltyFraction = 0.15

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.7

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.4
SWEP.SprintToFireTime = 0.42

SWEP.Sway = 1.25
SWEP.ScopedSway = 0.15

SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(7, -3, -2)

SWEP.SprintMidPoint = {
    Pos = Vector(4, 5, 2),
    Ang = Angle(0, -2, -45)
}

SWEP.SightAng = Angle(0, -0, 0)
SWEP.SightPos = Vector(-3.81, -7.5, -2.6)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// scope

SWEP.Scope = true
SWEP.ScopeFOV = 90 / 1.1

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.15
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/m14.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.85
SWEP.DropMagazineTime = 0.5

// sounds

local path = "TacRP/weapons/m14/m14_"
local path1 = "tacint_extras/sks/"

SWEP.Sound_Shoot = "^" .. path1 .. "sks_distance_fire1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/g36k/g36k_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "shoot2",
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "blind_shoot1"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.75, -0.12),
    vm_ang = Angle(0, 0.3, 0),
    t = 0.25,
    tmax = 0.25,
    bones = {
        {
            bone = "ValveBiped.bolt_handle",
            pos = Vector(0, 0, -3),
            t0 = 0.05,
            t1 = 0.2,
        },
    },
}

// attachments

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
    ["bayonet"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        }
    },
    ["akmount"] = {
        BGs_VM = {
            {1, 0}
        },
        BGs_WM = {
            {1, 0}
        },
        AttPosMods = {
            [1] = {
                Pos_VM = Vector(-5, 0.55, 3),
                Pos_WM = Vector(5.4, 0.9, -6.1),
            }
        },
        SortOrder = 2,
    },
}

SWEP.NoRMR = false

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_ak"}, // "optic_sniper"
        Bone = "ValveBiped.m14_rootbone",
        InstalledElements = {"sights"},
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-4.95, 0.2, 2),
        Pos_WM = Vector(5.4, 1.1, -6.1),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(-22.5, 5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "muzz_sks"},
        Bone = "ValveBiped.m14_rootbone",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.825, 0.2, 35.2),
        Pos_WM = Vector(30, 0, -14.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(-22.5, 5, 180),
        VMScale = 0.75
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.m14_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-2.9, -0.2, 22),
        Pos_WM = Vector(23, 0, -11),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-22.5, 5, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_rifle2", "acc_sling", "acc_duffle", "acc_bipod"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Trigger",
        Category = {"trigger_semi"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
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

addsound("tacint_sks.remove_clip", path1 .. "sks_magout.wav")
addsound("tacint_sks.insert_clip", path1 .. "sks_magin.wav")
addsound("tacint_sks.insert_clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_sks.bolt_back", path1 .. "sks_boltback.wav")
addsound("tacint_sks.bolt_release", path1 .. "sks_boltforward.wav")
addsound("tacint_sks.safety", path .. "safety.wav")
