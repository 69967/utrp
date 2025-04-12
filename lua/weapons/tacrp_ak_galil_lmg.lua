SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "IMI Galil ARM"
SWEP.AbbrevName = "Galil ARM"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "5Machine Gun"

SWEP.Description = "AK derivative in machine gun configuration.\nLightweight and fires at a brisk and controllable pace but with average stopping power."
SWEP.Description_Quote = "\"Well ya know, for me, the action is the juice.\""

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Israel Military Industries"
SWEP.Trivia_Year = "1972"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Galil Assets: Counter Strike: Online 2
Accessories: Insurgency (2014), ported by Lt. Rocky
Suppressed Sound: Vunsunta
Animation: Tactical Intervention]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_galil_lmg.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_galil_lmg.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 23,
        Damage_Min = 13,
        ArmorPenetration = 0.75,

        AimDownSightsTime = 0.42,
        SprintToFireTime = 0.45,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 14,
        Damage_Min = 10,

        Range_Min = 500,
        Range_Max = 1750,

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
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 8,
        Damage_Min = 4,
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachineGun

// "ballistics"

SWEP.Damage_Max = 19
SWEP.Damage_Min = 10
SWEP.Range_Min = 900 // distance for which to maintain maximum damage
SWEP.Range_Max = 3500 // distance at which we drop to minimum damage
SWEP.Penetration = 7 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.675

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 23500

// misc. shooting

SWEP.Firemodes = {
    2,
    1
}

SWEP.RPM = 650

SWEP.Spread = 0.0045

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 14
SWEP.RecoilResetTime = 0.15
SWEP.RecoilDissipationRate = 16
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 1

SWEP.RecoilKick = 2.5
SWEP.RecoilStability = 0.4

SWEP.RecoilSpreadPenalty = 0.0013
SWEP.HipFireSpreadPenalty = 0.055

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.875
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.6

SWEP.ReloadSpeedMult = 0.25

SWEP.AimDownSightsTime = 0.44
SWEP.SprintToFireTime = 0.47

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.2

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -4.75)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.05, -0.65, 0)
SWEP.SightPos = Vector(-4.665, -7.5, -3.62)

SWEP.CorrectivePos = Vector(-0.02, 0, 0)
SWEP.CorrectiveAng = Angle(0.725, 0.4, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, -2, -6)
SWEP.HolsterAng = Angle(0, 0, 0)


SWEP.ClipSize = 65
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1.3
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/galil_lmg.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.65
SWEP.DropMagazineTime = 0.65

SWEP.FreeAimMaxAngle = 5.5

SWEP.Bipod = true
SWEP.BipodRecoil = 0.3
SWEP.BipodKick = 0.35


// sounds

local path = "tacrp/weapons/ak47/ak47_"
local path1 = "tacint_extras/galil_lmg/"

SWEP.Sound_Shoot = "^" .. path1 .. "galil-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "m4a1-1.wav"

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
    ["deploy"] = "deploy",
    ["fire_iron"] = "fire1_M",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "mid_reload"
}
SWEP.DeployTimeMult = 1.5

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
    ["tactical"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["scope"] = {
        BGs_VM = {
            {2, 2}
        },
        BGs_WM = {
            {2, 2}
        },
        SortOrder = 2,
    },
    ["bipod"] = {
        BGs_VM = {
            {3, 1}
        },
        BGs_WM = {
            {3, 1}
        }
    },
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.07),
    vm_ang = Angle(0, 0.2, 0),
    t = 0.12,
    tmax = 0.12,
    bones = {
        {
            bone = "ValveBiped.bolt",
            pos = Vector(0, 0, -3),
            t0 = 0.01,
            t1 = 0.12,
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper", "optic_galil"},
        Bone = "ValveBiped.AK47_rootbone",
        WMBone = "Box01",
        InstalledElements = {"tactical"},
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.85,
        WMScale = 0.85,
        Pos_VM = Vector(-6.65, 0.125, 4),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 2, 1.4),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "muzz_ak"},
        Bone = "ValveBiped.AK47_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.96, 0.13, 32.6),
        Pos_WM = Vector(0, 30.4, -1.3),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.AK47_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.9, -0.3, 19),
        Pos_WM = Vector(-0.3, 19, -1.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -90, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_sling", "acc_duffle", "extendedbelt"},
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
        Category = {"trigger_auto"},
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

addsound("tacint_extras_galil_lmg.remove_clip", path .. "remove_clip.wav")
addsound("tacint_extras_galil_lmg.insert_clip", path .. "insert_clip.wav")
addsound("tacint_extras_galil_lmg.boltaction", path .. "boltaction.wav")
addsound("tacint_extras_galil_lmg.Buttstock_Back", path .. "buttstock_back.wav")