SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "KAC SR-25 EMR"
SWEP.AbbrevName = "SR-25"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "6Marksman Rifle"

SWEP.Description = "\"Enhanced Match Rifle\" made for precision shooting.\nLow capacity, but otherwise has excellent performance.\nEquipped with a 10x scope by default."

SWEP.Trivia_Caliber = "7.62x51mm"
SWEP.Trivia_Manufacturer = "Knight's Armament"
SWEP.Trivia_Year = "1990"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Firearms: Source
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_sr25.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_sr25.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 50,
        Damage_Min = 30,

        RecoilKick = 6,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 32,
        Damage_Min = 40,
        Range_Min = 500,
        Range_Max = 1800,
        RPM = 220,

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
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 30,
        Damage_Min = 14,
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MarksmanRifle

// "ballistics"

SWEP.Damage_Max = 50
SWEP.Damage_Min = 30
SWEP.Range_Min = 500
SWEP.Range_Max = 4500
SWEP.Penetration = 11 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.725
SWEP.ArmorBonus = 1.5

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 24000

// misc. shooting

SWEP.Firemodes = {
    1
}

SWEP.RPM = 400
SWEP.RPMMultSemi = 0.75

SWEP.Spread = 0.0002

SWEP.ShootTimeMult = 0.75

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.015
SWEP.RecoilDissipationRate = 12
SWEP.RecoilFirstShotMult = 0.8

SWEP.RecoilVisualKick = 1
SWEP.RecoilKick = 5
SWEP.RecoilStability = 0.65
SWEP.RecoilAltMultiplier = 300

SWEP.RecoilSpreadPenalty = 0.003
SWEP.HipFireSpreadPenalty = 0.06
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

SWEP.Bipod = true
SWEP.BipodRecoil = 0.25
SWEP.BipodKick = 0.25

// handling

SWEP.MoveSpeedMult = 0.875
SWEP.ShootingSpeedMult = 0.5
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.4

SWEP.AimDownSightsTime = 0.44
SWEP.SprintToFireTime = 0.49

SWEP.Sway = 2
SWEP.ScopedSway = 0.12

SWEP.FreeAimMaxAngle = 6.5

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.175, -0.3, 0)
SWEP.SightPos = Vector(-4.155, -7.5, -4.95)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/sniper.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 10
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true
SWEP.ScopeOverlaySize = 0.85

// reload

SWEP.ClipSize = 10
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1.2
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/m16a4.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.DeployTimeMult = 1.3

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path1 = "tacint_extras/sr25/"

SWEP.Sound_Shoot = "^" .. path1 .. "sr25_fire.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "sr25_suppressed_fire1.wav"

SWEP.Silencer = false

SWEP.Vol_Shoot = 120
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
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire3_M",
    ["fire2"] = "fire4_M",
    ["fire3"] = "fire4_M",
    ["fire4"] = "fire5_M",
    ["fire5"] = {"fire5_M", "fire5_L", "fire5_R"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.25,
    tmax = 0.25,
}

// attachments

SWEP.AttachmentElements = {
    ["irons"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["sights"] = {
        BGs_VM = {
            {2, 2}
        },
        BGs_WM = {
            {2, 2}
        },
    },
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["bipod"] = {
        BGs_VM = {
            {3, 1}
        },
        BGs_WM = {
            {3, 1}
        },
    },
    ["suppressor"] = {
        BGs_VM = {
            {4, 1}
        },
        BGs_WM = {
            {4, 1}
        },
    },
}

SWEP.BulletBodygroups = {
    [1] = {5, 2},
    [2] = {5, 1},
    [3] = {5, 0},
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"ironsights_sniper", "optic_cqb", "optic_medium", "optic_sniper"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        WMScale = 1.15,
        Pos_VM = Vector(-5.6, -0.05, 5),
        Pos_WM = Vector(0.45, 2, 1.4),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "muzz_sr25"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.9, 0, 31),
        Pos_WM = Vector(2, 33, -0.45),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.9, -1.25, 18),
        Pos_WM = Vector(2.4, 16, -1),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-90, -90, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc_foldstock2", "acc", "acc_sling", "acc_duffle", "acc_extmag_sniper"},
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

addsound("tacint_sr25.Remove_Clip", path1 .. "sr25_magout.wav")
addsound("tacint_sr25.Insert_Clip", path1 .. "sr25_magin.wav")
addsound("tacint_sr25.Insert_Clip-mid", path1 .. "sr25_magslap.wav")
addsound("tacint_sr25.bolt_action", path1 .. "m4a1_boltpull.wav")
addsound("tacint_sr25.Bolt_Back", path1 .. "sr25_charginghandle_back.wav")
addsound("tacint_sr25.Bolt_Forward", path1 .. "sr25_charginghandle_forward.wav")
addsound("tacint_sr25.bolt_slap", path1 .. "sr25_boltcatchslap.wav")
addsound("tacint_sr25.throw_catch", "tacint_extras/m16a4/m4a1_deploy.wav")