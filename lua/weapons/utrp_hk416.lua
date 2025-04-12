SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK HK416"
SWEP.AbbrevName = "HK416"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "65.56x45mm Automatic Rifles"

SWEP.Description = "Sleek black rifle made as a competitior to the AR-15. Accurate and low recoil at the cost of some bulk."
SWEP.Description_Quote = "An elite gun like this is all you need."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "2004"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: Twinke Masta, B0T, SoulSlayer
Texture: Acid Snake, el maestro de graffiti, Antman
Sound: Vunsunta, xLongWayHome
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_hk416.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_hk416.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 38
SWEP.Damage_Min = 15
SWEP.Range_Min = 6000
SWEP.Range_Max = 9000
SWEP.Penetration = 6
SWEP.ArmorPenetration = 0.775
SWEP.MuzzleVelocity = 27500


SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 0.8,
    [HITGROUP_RIGHTARM] = 0.8,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {2, 1}
SWEP.RPM = 850
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.0006
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0075

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 2.2
SWEP.RecoilMaximum = 50
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.3
SWEP.RecoilKick = 0.6
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.8
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.3
SWEP.SprintToFireTime = 0.3

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, -8)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(0.2, 0, 0)
SWEP.SightPos = Vector(-4.16, -7.5, -4.65)

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
SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/hk416.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

SWEP.DeployTimeMult = 1.1

// sounds

local path = "TacRP/weapons/m4/m4_"
local path1 = "tacint_extras/hk416/"

SWEP.Sound_Shoot = "^" .. path1 .. "m4a1_unsil-1.wav"
SWEP.Sound_Shoot_Silenced = "^" .. path1 .. "m4a1-1.wav"

SWEP.Vol_Shoot = 120
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = "melee2"
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
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["sights"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.8, -0.05, 6.5),
        Pos_WM = Vector(0.5, 5.5, 1.2),
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
        Pos_VM = Vector(-3.95, -0.04, 25.5),
        Pos_WM = Vector(1.6, 25.5, -0.7),
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
        Pos_VM = Vector(-3.95, -1, 16),
        Pos_WM = Vector(2, 13, -0.5),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(-90, -90 + 3.5, 0),
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

addsound("tacint_hk416.Remove_Clip", path1 .. "m4a1_clipout.wav")
addsound("tacint_hk416.Insert_Clip", path1 .. "m4a1_clipin.wav")
addsound("tacint_hk416.Insert_Clip-mid", path1 .. "m4a1_magtap.wav")
addsound("tacint_hk416.bolt_action", path1 .. "m4a1_bolt_action.wav")
addsound("tacint_hk416.bolt_slap", path1 .. "m4a1_boltrelease.wav")
addsound("tacint_hk416.throw_catch", path .. "throw_catch.wav")