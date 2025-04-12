SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "OTs-33 Pernach"
SWEP.AbbrevName = "OTs-33"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "3Machine Pistol"

SWEP.Description = "Russian machine pistol with low recoil and high mobility, designed for paramilitary forces."
SWEP.Description_Quote = "\"I hope this hurts.\""

SWEP.Trivia_Caliber = "9x18mm"
SWEP.Trivia_Manufacturer = "KBP Instrument Design Bureau"
SWEP.Trivia_Year = "1996"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model: Kimono
Texture: Kimono, Millenia
Sound: iFlip, Vunsunta
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_ots33.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_ots33.mdl"

SWEP.Slot = 1

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 22,
        Damage_Min = 6,
        RPM = 800,

        FreeAimMaxAngle = 4,
        HipFireSpreadPenalty = 0.028,
    },
    [TacRP.BALANCE_TTT] = {
        // TODO
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachinePistol

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 8
SWEP.Range_Min = 400
SWEP.Range_Max = 2000
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0.725
SWEP.ArmorBonus = 0.75

SWEP.MuzzleVelocity = 11500

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {2, 1}

SWEP.RPM = 900

SWEP.Spread = 0.008

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 15
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 48
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 0.75
SWEP.RecoilKick = 3.5
SWEP.RecoilStability = 0.35

SWEP.RecoilSpreadPenalty = 0.0015
SWEP.HipFireSpreadPenalty = 0.02

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.85
SWEP.SightedSpeedMult = 0.8

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.25

SWEP.Sway = 1
SWEP.ScopedSway = 0.4

SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "revolver"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-135, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 19, -5)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -12)

SWEP.SightAng = Angle(0.05, 0, 0)
SWEP.SightPos = Vector(-3.35, 1, -3.43)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 27
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_light"

SWEP.ReloadTimeMult = 1.15

SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/ots33.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.3

// sounds

local path = "tacrp/weapons/xd45/"
local path1 = "tacint_extras/ots33/"

SWEP.Sound_Shoot = "^" .. path1 .. "fiveseven-1.wav"
SWEP.Sound_Shoot_Silenced = "tacrp/weapons/skorpion/fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.Pitch_Shoot = 102
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1

SWEP.MuzzleEffect = "muzzleflash_pistol"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire1"] = "shoot1",
    ["fire2"] = "shoot2",
    ["fire3"] = "shoot3",
    ["fire4"] = "shoot4",
    ["fire5"] = {"shoot5", "shoot5L", "shoot5R"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.4),
    vm_ang = Angle(0, 1.5, 0),
    t = 0.15,
    tmax = 0.15,
    bones = {
        {
            bone = "xd45_rig.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "xd45_rig.hammer",
            ang = Angle(-15, 0, 0),
            t0 = 0,
            t1 = 0.12,
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
            t1 = 0.1,
        },
    },
}

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true
SWEP.NoIdle = true

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "xd45_rig.slide",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(0, -0.5, 0.5),
        Ang_VM = Angle(0, -90, 0),
        Pos_WM = Vector(0, -1, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "xd45_rig.barrel",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-0.5, 0, 7.6),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "xd45_rig.xd45_ROOT",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0, 6.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_smg", "acc_holster", "acc_brace"},
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

addsound("tacint_ots33.clip_in", path1 .. "usp_magin.wav")
addsound("tacint_ots33.clip_out", path1 .. "usp_magout.wav")
addsound("tacint_ots33.clip_slap", path .. "clip_slap-1.wav")
addsound("tacint_ots33.slide_back", path1 .. "usp_slideback.wav")
addsound("tacint_ots33.slide_forward", path1 .. "usp_slideforward.wav")
addsound("tacint_ots33.slide_shut", path1 .. "usp_slideforward.wav")
addsound("tacint_ots33.cock_hammer", path .. "cockhammer.wav")
addsound("tacint_ots33.safety_switch", path .. "safety_switch.wav")
