SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Sako 85"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "5Value"
SWEP.SubCatType = "7Sniper Rifle"

SWEP.Description = "A simple, rugged hunting rifle with no room for tactical nonsense. Equipped with an adjustable 6x scope."
SWEP.Description_Quote = "Get a girl who loves you for your braaaains."

SWEP.Trivia_Caliber = ".270 Winchester"
SWEP.Trivia_Manufacturer = "SAKO"
SWEP.Trivia_Year = "2006"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Assets: No More Room In Hell\nAnimations: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint_extras/v_sako85.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_sako85.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 66,
        Damage_Min = 50,

        Range_Min = 1500,
        Range_Max = 4000,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 35,
        Damage_Min = 60,
        Range_Min = 1000,
        Range_Max = 3000,

        RPM = 40,
        ShootTimeMult = 0.82,
        HipFireSpreadPenalty = 0.025,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 5,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 22,
        Damage_Min = 50,

        Range_Min = 500,
        Range_Max = 1750,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        HipFireSpreadPenalty = 0.018
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.SniperRifle

// "ballistics"

SWEP.Damage_Max = 60
SWEP.Damage_Min = 52
SWEP.Range_Min = 1000
SWEP.Range_Max = 6000
SWEP.Penetration = 12 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.8
SWEP.ArmorBonus = 3

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
    [HITGROUP_GEAR] = 0.5
}

SWEP.MuzzleVelocity = 30000

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 45

SWEP.Spread = 0

SWEP.HipFireSpreadPenalty = 0.04
SWEP.PeekPenaltyFraction = 0.25

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 3

SWEP.RecoilKick = 2

SWEP.RecoilSpreadPenalty = 0 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.92
SWEP.ShootingSpeedMult = 0.7
SWEP.SightedSpeedMult = 0.55

SWEP.ReloadSpeedMult = 0.3

SWEP.AimDownSightsTime = 0.37
SWEP.SprintToFireTime = 0.42

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.05

SWEP.FreeAimMaxAngle = 9

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -6)

SWEP.BlindFireAng = Angle(0, 15, -45)
SWEP.BlindFirePos = Vector(1, -2, -3)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireRightAng = Angle(-75, 0, 0)
SWEP.BlindFireRightPos = Vector(-10, 10, -5)

SWEP.BlindFireSuicideAng = Angle(0, 135, 0)
SWEP.BlindFireSuicidePos = Vector(-2, 45, -35)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0, 0.95, 0)
SWEP.SightPos = Vector(-2.675, -6.5, -3.35)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/l96.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 6
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "ar2"
SWEP.Ammo_Expanded = "ar2"

SWEP.ReloadTimeMult = 0.95
SWEP.ShootTimeMult = 0.9
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl" // why doesn't it have its own mag model?

SWEP.ReloadUpInTime = 2.1
SWEP.DropMagazineTime = 1.4

// sounds

local path = "tacint_extras/sako85/"
local path1 = "TacRP/weapons/spr/"

SWEP.Sound_Shoot = "^" .. path .. "sako_fire_01.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectEffect = 2
SWEP.EjectDelay = 0.8

SWEP.BulletBodygroups = {
    [1] = {2, 2},
    [2] = {2, 1},
    [3] = {2, 0},
}

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "shoot1"
}

// attachments

SWEP.AttachmentElements = {
    ["irons"] = {
        BGs_VM = {
            {1, 1}
        },
    },
}

SWEP.NoTactical = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_sako85",
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-3.95, 0.1, 9),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(-3, 1.25, -5.6),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.7,
        Pos_VM = Vector(-2.7, 0.125, 38.6),
        Pos_WM = Vector(22.5, 1.2, -4.9),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical_zoom", "tactical_ebullet"},
        Bone = "sphinx_ROOT",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0.1, 6.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5.5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_sniper", "acc_sling", "acc_duffle", "acc_bipod"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Caliber",
        Category = {"ammo_sako85"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Trigger",
        Category = {"trigger_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Ammo",
        Category = {"ammo_sniper"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [9] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_sako85.Clip_Out", path .. "sako_magout.wav")
addsound("tacint_sako85.Clip_In", path .. "sako_magin.wav")
addsound("tacint_sako85.Bolt_Back", path1 .. "bolt_back-1.wav")
addsound("tacint_sako85.bolt_forward", path1 .. "bolt_forward-1.wav")
addsound("tacint_sako85.safety", path1 .. "safety-1.wav")