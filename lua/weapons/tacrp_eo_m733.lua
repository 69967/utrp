SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Colt Model 733"
SWEP.AbbrevName = "M733"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "3Security"
SWEP.SubCatType = "4Assault Rifle"

SWEP.Description = "Sub-carbine-length AR-15 with a high but hard to control firerate. Fixed carry handle limits optic options."
SWEP.Description_Quote = "\"I do what I do best; I take scores.\""

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Colt"
SWEP.Trivia_Year = "1985"

SWEP.Faction = TacRP.FACTION_NEUTRAL // you know... for robbing banks
SWEP.Credits = [[
Model: Twinke Masta & The End
Texture: Acid Snake & JamesM
Sound: Vunsunta & Teh Strelok
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_m733.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_m733.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 20,
        HipFireSpreadPenalty = 0.03,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1.25,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.9,
            [HITGROUP_RIGHTLEG] = 0.9,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 14,
        Damage_Min = 6,
        Range_Min = 200,
        Range_Max = 1800,
        RPM = 850,

        RecoilSpreadPenalty = 0.0025,

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
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.AssaultRifle

// "ballistics"

SWEP.Damage_Max = 19
SWEP.Damage_Min = 10
SWEP.Range_Min = 500
SWEP.Range_Max = 2200
SWEP.Penetration = 7 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.7

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.15,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 21000

// misc. shooting

SWEP.Firemodes = {
    2,
    1
}

SWEP.RPM = 900

SWEP.Spread = 0.01

SWEP.ShootTimeMult = 0.5

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 12
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 35
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 1

SWEP.RecoilKick = 6
SWEP.RecoilStability = 0.2
SWEP.RecoilAltMultiplier = 150

SWEP.RecoilSpreadPenalty = 0.0024
SWEP.HipFireSpreadPenalty = 0.03
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.925
SWEP.ShootingSpeedMult = 0.7
SWEP.SightedSpeedMult = 0.65

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.34
SWEP.SprintToFireTime = 0.36 // multiplies how long it takes to recover from sprinting

SWEP.Sway = 1.1
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 4

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

SWEP.SightAng = Angle(0.18, -0.4, 0)
SWEP.SightPos = Vector(-4.09, -9.5, -4.32)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 30
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/m4.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/m4/m4_"
local path2 = "tacrp_extras/m4a1/m4a1_"

SWEP.Sound_Shoot = {
    "^tacint_shark/weapons/m733/m4a1_unsil-1.wav",
    "^tacint_shark/weapons/m733/m4a1_unsil-2.wav",
}
SWEP.Sound_Shoot_Silenced = {
    "^tacint_shark/weapons/m733/m4a1-1.wav",
    "^tacint_shark/weapons/m733/m4a1-2.wav",
}

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
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
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
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["chmount"] = {
        BGs_VM = {
            {2, 0}
        },
        BGs_WM = {
            {2, 0}
        },
        AttPosMods = {
            [1] = {
                Pos_VM = Vector(-7.7, -0.05, 4),
                Pos_WM = Vector(0.4, 3, 3.15),
            }
        },
        SortOrder = 2,
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_ar",
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.6, -0.075, 4),
        Pos_WM = Vector(0.4, 3, 1.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.9,
        Pos_VM = Vector(-3.95, 0, 22),
        Pos_WM = Vector(1.7, 22, -0.7),
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
        Pos_VM = Vector(-3.9, -1.2, 13.5),
        Pos_WM = Vector(2, 13, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-90, -90 + 3.5, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling", "acc_foldstock2", "perk_extendedmag"},
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

addsound("tacint_m733.Remove_Clip", path2 .. "clipout.mp3")
addsound("tacint_m733.Insert_Clip", path2 .. "clipin.mp3")
addsound("tacint_m733.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_m733.bolt_action", path .. "bolt_action.wav")
addsound("tacint_m733.bolt_slap", path .. "bolt_slap.wav")
addsound("tacint_m733.throw_catch", path .. "throw_catch.wav")