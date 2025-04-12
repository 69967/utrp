SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Taurus 850 Ultralite"
SWEP.AbbrevName = "T850"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "1Revolvers"

SWEP.Description = "A snub-nosed revolver—no one can see you're packing until it's in your hands."

SWEP.Trivia_Caliber = ".38 Special"
SWEP.Trivia_Manufacturer = "Taurus"
SWEP.Trivia_Year = "2001"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model: Fearfisch
Texture: Millenia
Sound: Vunsunta
Animation: Tactical Intervention
]]


// https://gamebanana.com/mods/207972
SWEP.ViewModel = "models/weapons/tacint_extras/v_t850.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_t850.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 2750
SWEP.Range_Max = 3750
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 0

SWEP.MuzzleVelocity = 27500

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 20,
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

SWEP.FiremodeName = "Double-Action"

SWEP.RPM = 350
SWEP.ShootTimeMult = 0.8

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

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_REVOLVER

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6.25)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 60)
SWEP.BlindFireSuicidePos = Vector(25, 10, -4)

SWEP.SprintAng = Angle(0, 0, 0)
SWEP.SprintPos = Vector(0, 0, -14)

SWEP.SightAng = Angle(-0.05, -0.2, 0.5)
SWEP.SightPos = Vector(-3.475, 0, -2.5)

SWEP.HolsterVisible = false
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_light"

SWEP.ReloadTimeMult = 1

SWEP.ReloadUpInTime = 1.35

SWEP.JamSkipFix = true

// sounds

local path = "tacint_extras/t850/"
local path1 = "tacrp/weapons/mr96/"
SWEP.Sound_Shoot = "^" .. path .. "deagle-1.wav"

SWEP.Vol_Shoot = 120
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 2
SWEP.QCA_Eject = 0
SWEP.EjectEffect = 0

SWEP.MuzzleEffect = "muzzleflash_suppressed"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2"},
    ["melee"] = "melee2",
    ["jam"] = "draw",
}

SWEP.DeployTimeMult = 0.7

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -3, -3.5),
    vm_ang = Angle(0, 12, 0),
    t = 0.25,
    tmax = 0.3,
    bones = {
        {
            bone = "ValveBiped.cylinder",
            ang = Angle(-60, 0, 0),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

// attachments

SWEP.NoTactical = true

SWEP.Attachments = {
--[[    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-3, -0.1, 3),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, -0.5, -2),
        Ang_WM = Angle(0, -90, 0),
    }, ]]
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
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
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Trigger",
        Category = {"trigger_revolver"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [1] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol", "ammo_roulette"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Holster",
        Category = "acc_holster",
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

addsound("tacint_extras_t850.Release_Cylinder", path1 .. "mr96_release_cylinder.wav")
addsound("tacint_extras_t850.Eject_Shells", path1 .. "mr96_eject_shells.wav")
addsound("tacint_extras_t850.Insert_Bullets", path1 .. "mr96_insert_bullets.wav")
addsound("tacint_extras_t850.Shut_Cylinder", path1 .. "mr96_shut_cylinder.wav")
addsound("tacint_extras_t850.Insert_Bullets-Mid", path1 .. "mr96_insert_bullets-mid.wav")
addsound("tacint_extras_t850.Cock_Hammer", path1 .. "mr96_cockhammer.wav")
addsound("tacint_extras_t850.Deploy", "weapons/357/357_spin1.wav")