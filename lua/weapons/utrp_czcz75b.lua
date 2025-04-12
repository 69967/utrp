SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "CZ 75 B"
SWEP.AbbrevName = "CZ 75 B"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "29mm Pistols"

SWEP.Description = "Fast firing and controllable, but capacity is low."
SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "CZ Uherský Brod"
SWEP.Trivia_Year = "1993"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model & Texture: Arby
Sound: Hk, Vunsunta, xLongWayHome, Strelok, Cas, IceFluxx
Animation: Tactical Intervention]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_cz75.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_cz75.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 3500
SWEP.Range_Max = 5000
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2
SWEP.MuzzleVelocity = 32500

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

SWEP.Firemode = 1

SWEP.RPM = 850
SWEP.RPMMultSemi = 0.8
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.0015
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.4
SWEP.RecoilKick = 1.225
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.225
SWEP.SprintToFireTime = 0.225

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, -4, 45)
SWEP.BlindFireSuicidePos = Vector(25, 15, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(5, 0.6, 0)
SWEP.SightPos = Vector(-2.375, 0, -3.85)

SWEP.CorrectivePos = Vector(-1.435, 0, 0)
SWEP.CorrectiveAng = Angle(-5, 5, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 12 // not realism capacity but it's the gun's gimmick
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1.15

SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/cz75.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1.2
SWEP.DropMagazineTime = 0.2

// sounds

local path = "tacint_extras/cz75/"
local path1 = "tacrp/weapons/sphinx/"

SWEP.Sound_Shoot = "^" .. path .. "p228-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "/fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.6),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "slide",
            pos = Vector(0, 0, -1),
            t0 = 0.02,
            t1 = 0.2,
        },
        {
            bone = "bullet",
            pos = Vector(0, 0, 0),
            t0 = 0,
            t1 = 0.2,
        },
        {
            bone = "hammer",
            ang = Angle(0, 0, 0),
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

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true

// attachments

SWEP.AttachmentElements = {
    ["magazine"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "slide",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(0, 0, 0.5),
        Ang_VM = Angle(0, -90, 0),
        Pos_WM = Vector(0, -1, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "sphinx_ROOT",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-2.95, 0, 10.05),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8.75, -1.62),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet", "tactical_cz75"},
        Bone = "sphinx_ROOT",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        VMScale = 0.7,
        WMScale = 1.3,
        Pos_VM = Vector(-1.9, 0, 5.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -2.75),
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

addsound("tacint_cz75.clip_in", path .. "fiveseven_clipin.wav")
addsound("tacint_cz75.clip_out", path .. "fiveseven_clipout.wav")
addsound("tacint_cz75.slide_back", path .. "fiveseven_slideback2.wav")
addsound("tacint_cz75.slide_forward", path1 .. "slide_forward-2.wav")
addsound("tacint_cz75.slide_shut", path .. "fiveseven_sliderelease.wav")
addsound("tacint_cz75.cock_hammer", path1 .. "cockhammer.wav")
addsound("tacint_cz75.safety_switch", path1 .. "safety_switch.wav")
