SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AI AWM-F"
SWEP.AbbrevName = "AWM"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "7Sniper Rifle"

SWEP.Description = "Robust magnum sniper with unmatched power and accuracy. A counter-terrorist favourite.\nEquipped with a 12x scope by default."
SWEP.Description_Quote = "\"He's a madman, a scientist, and a sharpshooter.\"" // Nifty's 51 frags at IEM Sydney 2018

SWEP.Trivia_Caliber = ".338 Lapua Magnum"
SWEP.Trivia_Manufacturer = "Accuracy International"
SWEP.Trivia_Year = "1988"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: Hav0c
Texture: Bullethead & Kimono
Sounds: Vunsunta
Animations: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_awp.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_awp.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 90,
        Damage_Min = 125,

        Range_Min = 2000,
        Range_Max = 6000,

        Sway = 2,
        ScopedSway = 0.075,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 80,
        Damage_Min = 130,

        Range_Min = 2000,
        Range_Max = 5000,
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.SniperRifle

// "ballistics"

SWEP.Damage_Max = 125
SWEP.Damage_Min = 100
SWEP.Range_Min = 1000
SWEP.Range_Max = 6000
SWEP.Penetration = 25
SWEP.ArmorPenetration = 1
SWEP.ArmorBonus = 4

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.5
}

SWEP.MuzzleVelocity = 36000

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 30

SWEP.ShootTimeMult = 1.2

SWEP.Spread = 0.00

SWEP.HipFireSpreadPenalty = 0.05
SWEP.PeekPenaltyFraction = 0.2

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.5 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 5

SWEP.RecoilKick = 10

SWEP.RecoilSpreadPenalty = 0 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.5
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.3

SWEP.AimDownSightsTime = 0.36
SWEP.SprintToFireTime = 0.42

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.01

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

SWEP.BlindFireAng = Angle(-10, -15, -0)
SWEP.BlindFirePos = Vector(3, -2, -2)

SWEP.BlindFireSuicideAng = Angle(0, 115, 0)
SWEP.BlindFireSuicidePos = Vector(0, 32, -24)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -4)

SWEP.SightAng = Angle(0.4, 0.1, 0)
SWEP.SightPos = Vector(-3.75, -10.5, -3.83)

SWEP.CorrectivePos = Vector(0.015, 0, 0.3)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/sniper.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 12
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true
SWEP.ScopeOverlaySize = 0.75

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "357"
SWEP.AmmoTTT = "357"

SWEP.ReloadTimeMult = 1.25
SWEP.DropMagazineImpact = "metal"
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl"

SWEP.ReloadUpInTime = 2.2
SWEP.DropMagazineTime = 1.15

// sounds

local path = "TacRP/weapons/uratio/uratio_"
local path1 = "tacint_shark/awp/awp"

SWEP.Sound_Shoot = "^" .. path1 .. "1.wav"
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
SWEP.EjectDelay = 0.9

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "blind_shoot1"
}

SWEP.DeployTimeMult = 1.3

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["optic"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["irons"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights_sniper", "optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "ValveBiped.Bip01_R_Hand",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-5.3, 0.05, 6.5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(10, 1.3, -6),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        WMBone = "ValveBiped.Bip01_R_Hand",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-4.2, 0.1, 41),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(48, 1.3, -5.4),
        Ang_WM = Angle(0, 0, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        WMBone = "ValveBiped.Bip01_R_Hand",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-2.2, 0, 17),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(23, 1.2, -2.8),
        Ang_WM = Angle(0, 0, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_extmag_sniper", "acc_sling", "acc_duffle", "acc_bipod"},
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
        Category = {"ammo_sniper"},
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

addsound("tacint_aiawp.Clip_Out", path1 .. "_magout.wav")
addsound("tacint_aiawp.Clip_In", path1 .. "_magin.wav")
addsound("tacint_aiawp.Bolt_Back", path1 .. "_boltback.wav")
addsound("tacint_aiawp.bolt_forward", path1 .. "_boltforward.wav")
addsound("tacint_aiawp.safety", path .. "safety.wav")
addsound("tacint_aiawp.buttstock_back", path .. "buttstock_back.wav")
addsound("tacint_aiawp.buttstock_rest_down", path .. "buttstock_rest_down.wav")
addsound("tacint_aiawp.flip_up_cover", path .. "flip_up_cover.wav")