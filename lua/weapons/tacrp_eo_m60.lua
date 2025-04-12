SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "M60"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "5Machine Gun"

SWEP.Description = "Heavy machine gun with intense stopping power but a low rate of fire. Nicknamed \"The Pig\" for its considerable heft."
SWEP.Description_Quote = "\"Live for nothing, or die for something. Your call.\""

SWEP.Trivia_Caliber = "7.62x51mm"
SWEP.Trivia_Manufacturer = "General Dynamics"
SWEP.Trivia_Year = "1957"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model: Twinke Masta
Texture: Millenia
Sounds: xLongWayHome, Lain & rzen1th
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_m60.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_m60.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 42,
        Damage_Min = 28,
        RecoilKick = 10,
        ClipSize = 75,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1.25,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.75
        }
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 20,
        Damage_Min = 12,
        Range_Min = 1200,
        Range_Max = 4000,
        RPM = 450,

        ClipSize = 75,
        RecoilKick = 5,
        ShootingSpeedMult = 0.5,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachineGun

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

// "ballistics"

SWEP.Damage_Max = 38
SWEP.Damage_Min = 25
SWEP.Range_Min = 1200
SWEP.Range_Max = 4500
SWEP.Penetration = 10
SWEP.ArmorPenetration = 0.75

SWEP.MuzzleVelocity = 17500

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 500

SWEP.Spread = 0.009

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 25
SWEP.RecoilResetTime = 0.18
SWEP.RecoilDissipationRate = 35
SWEP.RecoilFirstShotMult = 2

SWEP.RecoilVisualKick = 1.5
SWEP.RecoilKick = 8
SWEP.RecoilAltMultiplier = 200
SWEP.RecoilStability = 0.15

SWEP.HipFireSpreadPenalty = 0.025
SWEP.MoveSpreadPenalty = 0.02
SWEP.RecoilSpreadPenalty = 0.0005
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.7
SWEP.ShootingSpeedMult = 0.2
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.15
SWEP.ReloadSpeedMultTime = 1

SWEP.AimDownSightsTime = 0.65
SWEP.SprintToFireTime = 0.72

SWEP.Sway = 3
SWEP.ScopedSway = 0.75

SWEP.FreeAimMaxAngle = 7

SWEP.Bipod = true
SWEP.BipodRecoil = 0.3
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
SWEP.SightPos = Vector(-4.49, -7.5, -5.3)

SWEP.CorrectivePos = Vector(0.025, 0, 0.125)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 100
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.4
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/m60.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 4.7
SWEP.DropMagazineTime = 2.6

SWEP.BulletBodygroups = {
    [1] = {5, 0},
    [2] = {5, 1},
    [3] = {5, 2},
    [4] = {5, 3},
    [5] = {5, 4},
    [6] = {5, 5},
    [7] = {5, 6},
}
SWEP.DefaultBodygroups = "000006"

// sounds

local path = "TacRP/weapons/mg4/"
local path1 = "tacint_shark/weapons/m60/m249"

SWEP.Sound_Shoot = "^" .. path1 .. "-1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/g36k/g36k_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
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
    ["fire_iron"] = {"fire4_M", "fire3_M", "fire2_M", "fire1_M"},
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = {"melee1", "melee2"},
    ["deploy"] = "unholster",
}

SWEP.DeployTimeMult = 2.5

// attachments

SWEP.AttachmentElements = {
    ["bipod"] = {
        BGs_VM = {
            {3, 1}
        },
        BGs_WM = {
            {3, 1}
        },
    },
}

//ValveBiped.MG4_root

SWEP.Attachments = {
    -- [1] = {
    --     PrintName = "Optic",
    --     Category = {"optic_cqb", "optic_medium"},
    --     Bone = "ValveBiped.feed_cover",
    --     InstalledElements = {"sights"},
    --     AttachSound = "TacRP/weapons/optic_on.wav",
    --     DetachSound = "TacRP/weapons/optic_off.wav",
    --     VMScale = 1.25,
    --     Pos_VM = Vector(-1.8, -1.2, -7),
    --     Pos_WM = Vector(5, 1.15, -8),
    --     Ang_VM = Angle(90, 0, 0),
    --     Ang_WM = Angle(0, 0, 180),
    -- },
    [1] = {
        PrintName = "Muzzle",
        Category = "barrel",
        Bone = "ValveBiped.MG4_root",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-5.5, 0, 32),
        Pos_WM = Vector(33, 1.15, -5.75),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Accessory",
        Category = {"acc", "extendedbelt", "acc_duffle", "acc_bipod", "acc_sling"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Trigger",
        Category = {"trigger_auto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Ammo",
        Category = {"ammo_rifle"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
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

addsound("tacint_m60.Clip_Out", path1 .. "_boxout.wav")
addsound("tacint_m60.Clip_In", path1 .. "_boxin.wav")
addsound("tacint_m60.bolt_release", path .. "bolt_release-1.wav")
addsound("tacint_m60.bolt_back", "Tacint_shark/weapons/m60/m60_boltback.wav")
addsound("tacint_m60.bolt_forward", "Tacint_shark/weapons/m60/m60_boltforward.wav")
addsound("tacint_m60.feedcover_close", path1 .. "_coverdown.wav")
addsound("tacint_m60.feedcover_open", path1 .. "_coverup.wav")
addsound("tacint_m60.insertbullets", path1 .. "_chain.wav")
addsound("tacint_m60.deploy", path .. "deploy-1.wav")