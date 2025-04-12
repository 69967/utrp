SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Walther PPK"
SWEP.AbbrevName = "PPK"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "A compact German pistol—no one can see you're packing until it's in your hands."

SWEP.Trivia_Caliber = ".380 ACP"
SWEP.Trivia_Manufacturer = "Walther"
SWEP.Trivia_Year = "1929"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Model & Texture: Kimono\nSound: HK & Vunsunta\nAnimation: Tactical Intervention, edited by speedonerd"

SWEP.ViewModel = "models/weapons/tacint_shark/v_ppk.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_ppk.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 3000
SWEP.Range_Max = 4000
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0.25
SWEP.ArmorBonus = 0
SWEP.MuzzleVelocity = 29000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.Firemode = 1
SWEP.RPM = 500
SWEP.ShootTimeMult = 0.5
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.00125
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 0.5
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.4
SWEP.RecoilKick = 0.9
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.8

SWEP.AimDownSightsTime = 0.2
SWEP.SprintToFireTime = 0.2

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6.25)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 60)
SWEP.BlindFireSuicidePos = Vector(25, 10, -4)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(-0.075, 0.14, 0)
SWEP.SightPos = Vector(-3.2, 0, -3.2)

SWEP.HolsterVisible = false
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)


// reload

SWEP.ClipSize = 7
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_light"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.25

SWEP.ReloadTimeMult = 0.9

SWEP.DeployTimeMult = 0.75

SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/ppk.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacint_shark/weapons/cz52/cz52_"
local path1 = "tacint_shark/weapons/ppk/"

SWEP.Sound_Shoot = "^" .. path .. "fire.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "suppressed_fire-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1",
    ["jam"] = "midreload"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.6),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.hammer",
            ang = Angle(-15, 0, 0),
            t0 = 0,
            t1 = 0.15,
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

SWEP.LastShot = true

// attachments

SWEP.NoTactical = true

SWEP.Attachments = {
    --[1] = {
        --PrintName = "Optic",
        --Category = "optic_pistol",
        --Bone = "ValveBiped.slide",
        --WMBone = "Box01",
        --AttachSound = "TacRP/weapons/optic_on.wav",
        --DetachSound = "TacRP/weapons/optic_off.wav",
        --VMScale = 1,
        --WMScale = 1,
        --Pos_VM = Vector(0, 0, -0.2),
        --Ang_VM = Angle(0, 90, 180),
        --Pos_WM = Vector(0, -1, -1.9),
        --Ang_WM = Angle(0, -90, 0),
    --},
    [1] = {
        PrintName = "Muzzle",
        Category = {"lc_silencer", "barrel"},
        Bone = "ValveBiped.vertec_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.55,
        WMScale = 0.55,
        Pos_VM = Vector(-2.9, -0.02, 8.5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 5.9, -2.4),
        Ang_WM = Angle(0, -90, 0),
    },
    [6] = {
        PrintName = "Tactical",
        Category = "tactical_ebullet",
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
    [3] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_semi"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Accessory",
        Category = "acc_extmag_pistol",
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

addsound("tacint_ppk.clip_in", path .. "clipin.wav")
addsound("tacint_ppk.clip_in-mid", path .. "clipin.wav")
addsound("tacint_ppk.clip_out", path .. "clipout.wav")
addsound("tacint_ppk.slide_action", path .. "slide_action.wav")
addsound("tacint_ppk.slide_shut", path .. "sliderelease.wav")
addsound("tacint_ppk.cock_hammer", path .. "cockhammer.wav")