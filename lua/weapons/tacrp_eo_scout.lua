SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Steyr Scout"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "3Security"
SWEP.SubCatType = "5Sporter"

SWEP.Description = "Lightweight rifle designed for portability and comfort rather than direct firepower. Has a built-in bipod.\nEquipped with a 6x scope by default."
SWEP.Description_Quote = "\"Headshot!\" \"Humiliation!\" "

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Steyr Mannlicher"
SWEP.Trivia_Year = "1997"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[Model: Twinke Masta
Texture: Thanez
Sound: iFlip, Vunsunta, Unbreakable
Animations: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_scout.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_scout.mdl"
SWEP.DefaultBodygroups = "00001"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 60,
        Damage_Min = 45,

        Range_Min = 1800,
        Range_Max = 7000,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 52,
        Damage_Min = 35,
        Range_Min = 500,
        Range_Max = 2500,

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
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.SniperRifle

// "ballistics"

SWEP.Damage_Max = 50
SWEP.Damage_Min = 40
SWEP.Range_Min = 1000
SWEP.Range_Max = 5500
SWEP.Penetration = 10 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.7
SWEP.ArmorBonus = 1.5

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

SWEP.MuzzleVelocity = 33000

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 60

SWEP.Spread = 0

SWEP.HipFireSpreadPenalty = 0.025
SWEP.PeekPenaltyFraction = 0.3
SWEP.MidAirSpreadPenalty = 0.02

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 2
SWEP.RecoilResetTime = 0.3
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 2

SWEP.RecoilKick = 2

SWEP.RecoilSpreadPenalty = 0 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.95
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.3

SWEP.AimDownSightsTime = 0.35
SWEP.SprintToFireTime = 0.4

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 7

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -5)

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

SWEP.SightAng = Angle(0, 0.4, 0)
SWEP.SightPos = Vector(-2.7, -6.5, -3.95)

SWEP.CorrectivePos = Vector(0.05, 0, 0.2)
SWEP.CorrectiveAng = Angle(-0.36, -0.3, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)


SWEP.Bipod = true
SWEP.BipodRecoil = 0.25
SWEP.BipodKick = 0.125

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/l96.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 6
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true

// reload

SWEP.ClipSize = 10
SWEP.Ammo = "smg1"
SWEP.Ammo_Expanded = "smg1"

SWEP.ReloadTimeMult = 1.1
SWEP.ShootTimeMult = 0.68
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/scout.mdl"

SWEP.ReloadUpInTime = 2.1
SWEP.DropMagazineTime = 1.4

// sounds

local path = "TacRP/weapons/spr/"
local path1 = "tacint_extras/scout/"

SWEP.Sound_Shoot = "^" .. path1 .. "scout_fire-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "scout_fire-1-suppressed.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectEffect = 2
SWEP.EjectDelay = 0.6

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "shoot1"
}

// attachments

SWEP.AttachmentElements = {
    ["optic"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["irons"] = {
        BGs_VM = {
            {2, 1}
        },
    },
    ["bipod"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights_sniper", "optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        VMScale = 1,
        Pos_VM = Vector(-3.6, 0.1, 12),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 1.25, -5.6),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.8,
        WMScale = 0.8,
        Pos_VM = Vector(-2.65, 0.1, 33),
        Pos_WM = Vector(21, 1.2, -4.75),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        WMBone = "Bone02",
        Bone = "SPR_root",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-1, 0.1, 20),
        Pos_WM = Vector(8, 1.2, -3),
        Ang_VM = Angle(90, 0, 180),
        Ang_WM = Angle(0, 0, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_sniper", "acc_sling", "acc_duffle", "acc_bipod"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Trigger",
        Category = {"trigger_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Ammo",
        Category = {"ammo_rifle", "ammo_scout"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
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

addsound("tacint_scout.Clip_Out", path1 .. "m24_magin.wav")
addsound("tacint_scout.Clip_In", path1 .. "m24_magout.wav")
addsound("tacint_scout.Bolt_Back", path1 .. "m24_boltback.wav")
addsound("tacint_scout.bolt_forward", path1 .. "m24_boltforward.wav")
addsound("tacint_scout.safety", path .. "safety-1.wav")