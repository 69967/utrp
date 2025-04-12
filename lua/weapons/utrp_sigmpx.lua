SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

SWEP.PrintName = "SIG MPX"
SWEP.AbbrevName = "MPX"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "29x19 Submachine Guns"

SWEP.Description = "A Higher-end SMG with a higher rate of fire and larger magazine. Used for police applications."

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "SIG Sauer AG"
SWEP.Trivia_Year = "2015"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Assets: Contract Wars
Originally ported to CS 1.6 by GR_Lucia
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_mpx.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_mpx.mdl"

SWEP.Slot = 2


// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 5000
SWEP.Range_Max = 8000
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2
SWEP.MuzzleVelocity = 30000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

// misc. shooting

SWEP.Firemodes = {2, 1}
SWEP.RPM = 850
SWEP.JamFactor = 0.00015


SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.00075
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.004

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 28
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 0.75

SWEP.RecoilVisualKick = 0.3
SWEP.RecoilKick = 1
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.26
SWEP.SprintToFireTime = 0.26

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, -7)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(0.25, -0.15, -1.2)
SWEP.SightPos = Vector(-4, -7, -4.05)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 35
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/mpx.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/m4/m4_"
local path1 = "Tacint_shark/weapons/mpx/"

SWEP.Sound_Shoot = "^" .. path1 .. "mp5-1.wav"
SWEP.Sound_Shoot_Silenced = "tacrp_extras/mp9/fire_silenced-1.wav"

SWEP.Vol_Shoot = 120
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

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
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
    ["sights"] = {
        BGs_VM = {
            {2, 1},
        },
    },
}

SWEP.NoRMR = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 0.85,
        Pos_VM = Vector(-5.4, -0.15, 6),
        Pos_WM = Vector(0.5, 6, 1.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -87, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.85,
        Pos_VM = Vector(-3.7, -0.1, 17.5),
        Pos_WM = Vector(1.1, 18.5, -0.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -87, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 0.85,
        Pos_VM = Vector(-3.5, 0.8, 12),
        Pos_WM = Vector(-0.45, 12.25, -0.5),
        Ang_VM = Angle(90, 180, -90),
        Ang_WM = Angle(-50, -85, 130),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_sling", "acc_duffle", "acc_extmag_smg"},
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
        Category = {"ammo_pistol"},
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

addsound("tacint_mpx.Remove_Clip", path1 .. "magout.wav")
addsound("tacint_mpx.Insert_Clip", path1 .. "magin.wav")
addsound("tacint_mpx.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_mpx.bolt_action", path .. "bolt_action.wav")
addsound("tacint_mpx.bolt_slap", path1 .. "slideforward.wav")
addsound("tacint_mpx.throw_catch", path .. "throw_catch.wav")