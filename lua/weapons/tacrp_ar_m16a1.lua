SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Colt M16A1"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "5Value"
SWEP.SubCatType = "4Assault Rifle"

SWEP.Description = "An antique rifle recovered from the rice fields.\nBoasts high firing rate and good range, though don't expect this bucket of rust to run without a hitch or two."
SWEP.Description_Quote = "Welcome to the jungle."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Colt"
SWEP.Trivia_Year = "1967"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model: Hav0c
Texture: Millenia
Compile: The_AntiPirate
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_m16a1.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_m16a1.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 22,
        Damage_Min = 16,

        JamFactor = 0.035,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 12,
        Damage_Min = 8,
        Range_Min = 600,
        Range_Max = 2800,

        JamFactor = 0.035,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 9,
        Damage_Min = 5,
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        Description = "An antique rifle recovered from the rice fields, complete with 20-round box magazines and fixed carry handle. Boasts high firing rate and good range, but poor accuracy.",
        JamFactor = 0,
        HipFireSpreadPenalty = 0.008,
        RecoilSpreadPenalty = 0.0032
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.AssaultRifle

// "ballistics"

SWEP.Damage_Max = 18
SWEP.Damage_Min = 10
SWEP.Range_Min = 700
SWEP.Range_Max = 3200
SWEP.Penetration = 8 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.7

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 29000

// misc. shooting

SWEP.Firemodes = {
    2,
    1
}

SWEP.RPM = 900

SWEP.Spread = 0.0055

SWEP.JamFactor = 0.1

SWEP.ShootTimeMult = 0.4

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 7
SWEP.RecoilResetTime = 0.01
SWEP.RecoilDissipationRate = 35
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 1.5
SWEP.RecoilKick = 5
SWEP.RecoilStability = 0.3
SWEP.RecoilAltMultiplier = 250

SWEP.RecoilSpreadPenalty = 0.0032
SWEP.HipFireSpreadPenalty = 0.035
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.925
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.65

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.35
SWEP.SprintToFireTime = 0.38

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
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.175, -0.3, 0)
SWEP.SightPos = Vector(-4.2, -7.5, -4.3)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/m16a1.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/m4/m4_"
local path1 = "tacint_extras/m16a1/"

SWEP.Sound_Shoot = "^" .. path1 .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "fire_silenced-1.wav"

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
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "unjam",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.25,
    tmax = 0.25,
}

// attachments

SWEP.AttachmentElements = {
    ["chmount"] = {
        AttPosMods = {
            [1] = {
                Pos_VM = Vector(-7.7, -0.05, 5),
                Pos_WM = Vector(0.75, 3, 3.25),
            }
        },
        SortOrder = 2,
    },
}

SWEP.NoTactical = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_ar"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.35, -0.05, 7),
        Pos_WM = Vector(0.75, 5, 1.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        VMScale = 0.9,
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.95, 0, 31),
        Pos_WM = Vector(2, 31.5, -0.85),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
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
        Category = {"acc", "acc_sling", "acc_duffle", "perk_extendedmag"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic", "bolt_m16a1"},
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

addsound("tacint_m16a1.Remove_Clip", path1 .. "magout.wav")
addsound("tacint_m16a1.Insert_Clip", path1 .. "magin.wav")
addsound("tacint_m16a1.Mag_Tap", path1 .. "magspank.wav")
addsound("tacint_m16a1.Insert_Clip-mid", path1 .. "magspank.wav")
addsound("tacint_m16a1.bolt_action", path1 .. "boltcatch.wav")
addsound("tacint_m16a1.bolt_slap", path .. "bolt_slap.wav")
addsound("tacint_m16a1.throw_catch", path .. "throw_catch.wav")