SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Magpul Masada"
SWEP.AbbrevName = "Masada"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "2Operator"
SWEP.SubCatType = "4Assault Rifle"

SWEP.Description = "Modern rifle with lightweight polymer construction."
SWEP.Description_Quote = "\"You could rid the world of iron and I'd sell wooden clubs.\""

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Magpul Indutries"
SWEP.Trivia_Year = "2006"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: End of Days
Texture: IppE
Sounds: Strelok & XLongWayHome
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_masada.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_masada.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 15,
        Damage_Min = 8,

        Range_Min = 600,
        Range_Max = 2000,

        RPM = 650,

        RecoilSpreadPenalty = 0.002,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1.25,
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

SWEP.Damage_Max = 23
SWEP.Damage_Min = 15
SWEP.Range_Min = 1000
SWEP.Range_Max = 2800
SWEP.Penetration = 7 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.7

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 5,
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
    2,
    1
}

SWEP.RPM = 700

SWEP.Spread = 0.0045

SWEP.RecoilSpreadPenalty = 0.0018
SWEP.HipFireSpreadPenalty = 0.036
SWEP.PeekPenaltyFraction = 0.2

SWEP.ShootTimeMult = 0.5

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 35
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.75
SWEP.RecoilKick = 4
SWEP.RecoilStability = 0.55



SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.94
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.72

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.34
SWEP.SprintToFireTime = 0.35

SWEP.Sway = 1.25
SWEP.ScopedSway = 0.15

SWEP.FreeAimMaxAngle = 4.5

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -3, -5.5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.66, -0.1, -1.4)
SWEP.SightPos = Vector(-3.8, -7, -4.5)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 32
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/masada.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/m4/m4_"
local path1 = "Tacint_shark/weapons/masada/"

SWEP.Sound_Shoot = "^" .. path1 .. "masada_unsil.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "masada_sil.wav"

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
    ["sights"] = {
        BGs_VM = {
            {2, 1},
            {3, 1},
        },
        BGs_WM = {
            {2, 1},
        }
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.7, -0.2, 3),
        Pos_WM = Vector(-0.4, 3, 1.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -92, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.7, 0, 27.5),
        Pos_WM = Vector(-1.3, 23, -1),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -92, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.9, -0.8, 15),
        Pos_WM = Vector(-0.3, 13, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-85, -90, 3),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_sling", "acc_duffle", "perk_extendedmag"},
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
        Category = {"ammo_rifle", "ammo_masada"},
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

addsound("tacint_masada.Remove_Clip", path1 .. "magout.wav")
addsound("tacint_masada.Insert_Clip", path1 .. "magin.wav")
addsound("tacint_masada.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_masada.bolt_action", path1 .. "boltaction.wav")
addsound("tacint_masada.bolt_slap", path1 .. "boltrelease.wav")
addsound("tacint_masada.throw_catch", path .. "throw_catch.wav")