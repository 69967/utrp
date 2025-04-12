SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "SIG P226"
SWEP.AbbrevName = "P226"
SWEP.Category = "UTRP Handguns"
SWEP.SubCatType = "3.45 ACP Pistols"


SWEP.Description = "Handgun with superior range and precision but low capacity."

SWEP.Trivia_Caliber = ".45 ACP"
SWEP.Trivia_Manufacturer = "SIG Sauer AG"
SWEP.Trivia_Year = "1984"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model: SoulSlayer
Texture: Thanez
Sound: Anders, DMG, FxDarkloki, & Thanez
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_p226.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_p226.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 34
SWEP.Damage_Min = 15
SWEP.Range_Min = 3250
SWEP.Range_Max = 4500
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 0
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

SWEP.Firemode = 1
SWEP.RPM = 600
SWEP.ShootTimeMult = 0.5
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.0025
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1.2
SWEP.RecoilMaximum = 20
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.5
SWEP.RecoilKick = 1.33
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

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-135, 0, 60)
SWEP.BlindFireSuicidePos = Vector(29, 16, -3.9)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(0.02, 0.15, 0)
SWEP.SightPos = Vector(-3.45, 0, -3.35)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)


// reload

SWEP.ClipSize = 15
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_heavy"

SWEP.ReloadTimeMult = 1

SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/p226.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 0.85
SWEP.DropMagazineTime = 0.2

// sounds

local path = "tacint_extras/p226/"
local path1 = "tacrp/weapons/p250/p250_"
SWEP.Sound_Shoot = "^" .. path .. "p228-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "fire_silenced-1.wav"

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
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.2,
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

SWEP.LastShot = true

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1.2,
        Pos_VM = Vector(0.01, -0.3, -0.1),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0.04, -1.4, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-0.6, 0.43, 6.4),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8.2, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.p250_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1,
        Pos_VM = Vector(-2, 0, 5.25),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 4.5, -2.9),
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

addsound("tacint_p226.clip_in", path .. "magshove.wav")
addsound("tacint_p226.clip_in-mid", path .. "magshove.wav")
addsound("tacint_p226.clip_out", path .. "magout.wav")
addsound("tacint_p226.slide_action", path1 .. "slide_action.wav")
addsound("tacint_p226.slide_shut", path .. "sliderelease.wav")
addsound("tacint_p226.cock_hammer", path .. "cockhammer.wav")