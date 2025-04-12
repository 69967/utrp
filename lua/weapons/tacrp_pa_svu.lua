SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "SVU"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "3Security"
SWEP.SubCatType = "7Sniper Rifle"

SWEP.Description = "Bullpup modernized model of the SVD. Has good handling but average effective range.\nEquipped with a 6x scope by default."
SWEP.Description_Quote = "\"It's all just about perpective.\"" // Black Ops 6


SWEP.Trivia_Caliber = "7.62x54mmR"
SWEP.Trivia_Manufacturer = "KBP Instrument Design Bureau"
SWEP.Trivia_Year = "1994"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = "Assets: B0T\nSound: NightmareMutant, sHiBaN, xLongWayHome\nAnimations: speedonerd"

SWEP.ViewModel = "models/weapons/tacint_extras/v_svu.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_svu.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 42,
        Damage_Min = 60,
        Range_Max = 6000,
        Range_Min = 1800,

        RPM = 200,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 25,
        Damage_Min = 35,
        Range_Min = 300,
        Range_Max = 2500,
        RPM = 120,

        RecoilResetInstant = true,
        RecoilResetTime = 0.27,
        RecoilDissipationRate = 3,
        RecoilMaximum = 3,
        RecoilSpreadPenalty = 0.005,
        RecoilFirstShotMult = 0.9,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3.5,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.AssaultRifle

// "ballistics"

SWEP.Damage_Max = 52
SWEP.Damage_Min = 32
SWEP.Range_Min = 1400 // distance for which to maintain maximum damage
SWEP.Range_Max = 5000 // distance at which we drop to minimum damage
SWEP.Penetration = 11 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.8
SWEP.ArmorBonus = 2

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 30000

// misc. shooting

SWEP.Firemodes = {1}

SWEP.RPM = 180

SWEP.Spread = 0.0004

SWEP.ShootTimeMult = 1

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 4
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 10
SWEP.RecoilFirstShotMult = 0.75

SWEP.RecoilVisualKick = 1
SWEP.RecoilKick = 5
SWEP.RecoilStability = 0.75

SWEP.RecoilSpreadPenalty = 0.006
SWEP.HipFireSpreadPenalty = 0.04
SWEP.PeekPenaltyFraction = 0.3

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.55

SWEP.ReloadSpeedMult = 0.4

SWEP.AimDownSightsTime = 0.36
SWEP.SprintToFireTime = 0.42

SWEP.Sway = 1
SWEP.ScopedSway = 0.125

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0.25, 1, 0)

SWEP.CustomizeAng = Angle(30, 15, 0)
SWEP.CustomizePos = Vector(4.5, -0.4, -0.7)

SWEP.BlindFireAng = Angle(0, 0, 0)
SWEP.BlindFirePos = Vector(-1, 1, 1)

SWEP.BlindFireLeftAng = Angle(90, 0, 0)
SWEP.BlindFireLeftPos = Vector(10, 6, -4)

SWEP.BlindFireRightAng = Angle(-90, 0, 0)
SWEP.BlindFireRightPos = Vector(-4, 20, -4)

SWEP.SprintAng = Angle(30, -15, -5)
SWEP.SprintPos = Vector(2, 0, 1.5)

SWEP.SightAng = Angle(0, 0.1, 0)
SWEP.SightPos = Vector(-3.96, -8, 1.5)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, -0)

--SWEP.CorrectiveBoneAng = Angle(90, 38, 38)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, -2, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/pso1.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 6
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true

SWEP.ClipSize = 10
SWEP.Ammo = "357"
SWEP.Ammo_Expanded = "ti_rifle"

SWEP.ReloadTimeMult = 1.3
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/svu.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.4
SWEP.DropMagazineTime = 0.55

SWEP.FreeAimMaxAngle = 5

// sounds

local path = "tacint_extras/svu/"

SWEP.Sound_Shoot = "^" .. path .. "g3sg1-2.wav"
SWEP.Sound_Shoot_Silenced = path .. "g3sg1-1.wav"

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
    ["deploy"] = "deploy",
    ["fire_iron"] = "idle",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "midreload"
}


SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.2, -0.12),
    vm_ang = Angle(0, 0.25, 0),
    t = 0.1,
    tmax = 0.1,
    bones = {
        {
            bone = "ValveBiped.bolt",
            pos = Vector(0, 0, -3),
            t0 = 0.01,
            t1 = 0.08,
        },
    },
}

SWEP.DeployTimeMult = 1.25

// attachments

SWEP.AttachmentElements = {
    ["rail"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["irons"] = {
        BGs_VM = {
            {1, 2}
        },
        BGs_WM = {
            {1, 2}
        },
    },
    ["supp"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
}

SWEP.NoRMR = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights_sniper", "optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "famas_root",
        WMBone = "ValveBiped.Bip01_R_Hand",
        InstalledElements = {"rail"},
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.8,
        WMScale = 0.8,
        Pos_VM = Vector(-0, -5.4, 4),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(7.3, 1.15, -6.9),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "muzz_svu"},
        Bone = "famas_root",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.9,
        WMScale = 0.9,
        Pos_VM = Vector(0, -2.1, 21.5),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(25.5, 1.15, -3.9),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "famas_root",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        Pos_VM = Vector(-0.7, -2.5, 9),
        Pos_WM = Vector(12, 1.8, -4.25),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling", "acc_duffle", "acc_extmag_sniper"},
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

addsound("tacint_svu.remove_clip", path .. "g3sg1_clipout.wav")
addsound("tacint_svu.insert_clip", path .. "g3sg1_clipin.wav")
addsound("tacint_svu.boltaction", path .. "g3sg1_slide.wav")
