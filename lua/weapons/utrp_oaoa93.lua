SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Olypmic Arms OA-93"
SWEP.AbbrevName = "OA-93"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "AR-15 derived pistol with a top charging handle and no buffer tube. Designed to circumvent legal restrictions, but this one is ironically modified to fire in full auto."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Olympic Arms"
SWEP.Trivia_Year = "1993"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model/Texture: Tuuttipingu, edited by 8Z
Sound: NightmareMutant, Teh Strelok
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_oa93.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_oa93.mdl"

SWEP.Slot = 1

// "ballistics"
SWEP.Damage_Max = 38
SWEP.Damage_Min = 15
SWEP.Range_Min = 4250
SWEP.Range_Max = 7250
SWEP.Penetration = 6
SWEP.ArmorPenetration = 1

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

SWEP.MuzzleVelocity = 37500

// misc. shooting

SWEP.Firemode = 1
SWEP.RPM = 650
SWEP.RPMMultSemi = 0.7

SWEP.Spread = 0.003
SWEP.RecoilSpreadPenalty = 0.0012
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.004

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 2.2
SWEP.RecoilMaximum = 40
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.8
SWEP.RecoilKick = 1.6
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

SWEP.PeekPenaltyFraction = 0.2

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.25

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 3.5

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -30, -15)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(-4.26, -1.2, 1)
SWEP.SightPos = Vector(-5.22, -3, -4.55)

SWEP.CorrectivePos = Vector(1.25, 0, -0.4)
SWEP.CorrectiveAng = Angle(5, -3, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)
// reload

SWEP.ClipSize = 30
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1.5
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/m4.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.35

// sounds


local path = "TacRP/weapons/m4/m4_"
local path2 = "tacrp_extras/m4a1/m4a1_"
local path3 = "tacint_extras/oa93/"

SWEP.Sound_Shoot = "^" .. path3 .. "Shoot_Unsil.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 100
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
    ["fire_iron"] = "fire2_M",
    ["fire1"] = {"fire1_L", "fire1_M"},
    ["fire2"] = {"fire2_M", "fire2_R"},
    ["fire3"] = {"fire3_L", "fire3_M"},
    ["fire4"] = {"fire4_M", "fire4_R"},
    ["fire5"] = {"fire5_L", "fire5_M", "fire5_R"},
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
    ["sights"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
}

SWEP.DeployTimeMult = 1.25

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        InstalledElements = {"sights"},
        Bone = "Skorpion_ROOT",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.9,
        WMScale = 0.9,
        Pos_VM = Vector(6.5, 0, 2.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(1.4, 21, -0.5),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "Skorpion_ROOT",
        WMBone = "Bone02",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.75,
        WMScale = 0.7,
        Pos_VM = Vector(3.6, -0.015, 17.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(1.5, 1.25, -4.3),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "Skorpion_ROOT",
        WMBone = "Bone02",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 0.9,
        WMScale = 0.9,
        Pos_VM = Vector(2.75, 0, 10),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(-4, 1.25, -3.5),
        Ang_WM = Angle(0, 0, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "perk_extendedmag", "acc_holster"},
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

addsound("tacint_oa93.Clip_Out", path2 .. "clipout.mp3")
addsound("tacint_oa93.Clip_In", path2 .. "clipin.mp3")
addsound("tacint_oa93.bolt_action", "tacrp/weapons/skorpion/bolt_action-1.wav")