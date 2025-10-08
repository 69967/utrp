SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Slurpgewehr-22"
SWEP.AbbrevName = "SG-22"
SWEP.Category = "UTRP Handguns"
SWEP.SubCatType = "0Other"

SWEP.ViewModel = "models/weapons/tacint_extras/v_woodsman.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_woodsman.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 15
SWEP.Damage_Min = 5
SWEP.Range_Min = 3000
SWEP.Range_Max = 4000
SWEP.Penetration = 4
SWEP.MuzzleVelocity = 27500
SWEP.ArmorPenetration = 0

SWEP.Firemode = 1
SWEP.RPM = 500
SWEP.ShootTimeMult = 0.5
SWEP.JamFactor = 0.5

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.0015
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 20
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.4
SWEP.RecoilKick = 1
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.25

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 1

SWEP.CanBlindFire = true

// hold types

SWEP.HoldType = "pistol"
SWEP.HoldTypeSprint = "slam"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(-1, 0, -8)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-125, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 12, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(-0.01, 0.5, 0)
SWEP.SightPos = Vector(-3.2, 0, -2.99)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)


// reload

SWEP.ClipSize = 12 // 10 irl but it should be slightly better than the Amphibian
SWEP.Ammo = "9x19mm_sc"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.25

SWEP.ReloadTimeMult = 0.875

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/vertec.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "TacRP/weapons/vertec/vertec_"
local path1 = "tacint_extras/woodsman/"

SWEP.Sound_Shoot = "^" .. path1 .. "p228-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 95
SWEP.Pitch_Shoot = 105
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_silenced"
SWEP.EjectEffect = 1

// anims

SWEP.DeployTimeMult = 0.5
SWEP.HolsterTimeMult = 0.5

-- SWEP.AnimationTranslationTable = {
--     ["deploy"] = "draw",
--     ["fire_iron"] = "shoot3",
--     ["fire"] = {"shoot1", "shoot2", "shoot3"},
--     ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
--     ["melee"] = {"melee1", "melee2"},
--     ["jam"] = "midreload"
-- }

SWEP.AnimationTranslationTable = {
    ["deploy"] = "sh_draw",
    ["unholster"] = "sh_unholster",
    ["fire"] = {"sh_shoot1"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "sh_midreload",
    ["reload"] = "sh_reload",
    ["dryfire"] = "sh_dryfire",
    ["idle"] = "sh_idle",
    ["holster"] = "sh_holster",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.6, -0.5),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -2.5),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.2,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

SWEP.LastShot = false

// attachments

SWEP.Attachments = {
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.barrel",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(0.35, 0, 9.35),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0.125, 13.5, -1.75),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.vertec_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2.5, 0, 7),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 7, -2.2),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol", "acc_holster", "acc_brace"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
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
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_woodsman.clip_in", path1 .. "p228_clipin.wav")
addsound("tacint_woodsman.clip_in-mid", path .. "clip_in-mid.wav")
addsound("tacint_woodsman.clip_out", path1 .. "p228_clipout.wav")
addsound("tacint_woodsman.slide_action", path1 .. "p228_deploy.wav")
