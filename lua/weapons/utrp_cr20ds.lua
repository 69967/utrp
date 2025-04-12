SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Chiappa Rhino 20DS"
SWEP.AbbrevName = "Rhino 20DS"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "1Revolvers"

SWEP.Description = "A modern snub-nose revolver with a hexagonal cylinder—no one can see you're packing until it's in your hands."

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "Chiappa Firearms"
SWEP.Trivia_Year = "2008"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model/Texture: MirzaMiftahulFadillah, edited by 8Z
Sound: Ghost597879, Tatwaffe, The Wastes Mod
Animation: Tactical Intervention
]]


SWEP.ViewModel = "models/weapons/tacint_extras/v_rhino20ds.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_rhino20ds.mdl"

SWEP.Slot = 1

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 3000
SWEP.Range_Max = 4500
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2

SWEP.MuzzleVelocity = 31500

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

SWEP.RPM = 450
SWEP.RPMMultSemi = 0.8
SWEP.DeployTimeMult = 0.75

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.0017
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.5
SWEP.RecoilKick = 1.275
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.2
SWEP.SprintToFireTime = 0.2

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

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

SWEP.BlindFireSuicideAng = Angle(-125, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 12, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(-0.05, -0.3, 0.5)
SWEP.SightPos = Vector(-3.475, 0, -2.75)

SWEP.HolsterVisible = false
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 6
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1

SWEP.ReloadUpInTime = 1.35

SWEP.JamSkipFix = true

// sounds

local path = "tacint_extras/rhino20ds/"
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
            bone = "ValveBiped.hammer",
            ang = Angle(-60, 0, 0),
            t0 = 0.05,
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
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.mr96_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-3.3, -0.1, 2.2),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0.15, -0, -0.7),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical_ebullet", "tactical_zoom"},
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
        PrintName = "Trigger",
        Category = {"trigger_revolver"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
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

addsound("tacint_rhino20ds.Release_Cylinder", path .. "open.wav")
addsound("tacint_rhino20ds.Eject_Shells", path1 .. "mr96_eject_shells.wav")
addsound("tacint_rhino20ds.Insert_Bullets", path .. "insert.wav")
addsound("tacint_rhino20ds.Shut_Cylinder", path .. "close.wav")
addsound("tacint_rhino20ds.Insert_Bullets-Mid", path1 .. "mr96_insert_bullets-mid.wav")
addsound("tacint_rhino20ds.Cock_Hammer", path .. "hammer.wav")
addsound("tacint_rhino20ds.Deploy", "weapons/357/357_spin1.wav")