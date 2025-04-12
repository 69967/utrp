SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Kriss Vector"
SWEP.AbbrevName = "Vector"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "29x19 Submachine Guns"

SWEP.Description = "Close range SMG with extremely high fire rate and practically no recoil. Low armor penetration, but can chew through it very quickly."

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "Kriss USA, Inc."
SWEP.Trivia_Year = "2009"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = "Assets: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint/v_superv.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_superv.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 4500
SWEP.Range_Max = 7000
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

SWEP.Firemodes = {2, -2, 1}

SWEP.RPM = 1200
SWEP.RPMMultBurst = 2
SWEP.RunawayBurst = true
SWEP.PostBurstDelay = 0.11

SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.0007
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.004

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 25
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

SWEP.AimDownSightsTime = 0.26
SWEP.SprintToFireTime = 0.26

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "crossbow"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -7)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -30, -15)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(0.025, 0.1, 0)
SWEP.SightPos = Vector(-4.7, -7.5, -3.55)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -5)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 32
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/superv.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/superv/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
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
    ["fire_iron"] = "fire2_M",
    ["fire1"] = "fire1_L",
    ["fire2"] = "fire2_L",
    ["fire3"] = "fire3_L",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = "melee1",
    ["jam"] = "deploy"
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
            {1, 1}
        }
    },
    ["optic"] = {
        BGs_VM = {
            {1, 1}
        },
    },
    ["tactical"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.NoRMR = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-4.1, -0.15, 5),
        Pos_WM = Vector(7, 1.5, -5.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-1.3, -0.1, 19),
        Pos_WM = Vector(23, 2.5, -2.8),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "superv_rig.SuperV_ROOT",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-1.15, -1.1, 11),
        Pos_WM = Vector(14, 3, -3),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -3.5, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_extmag_smg", "acc_sling", "acc_duffle"},
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
        Category = {"trigger_4pos"},
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

addsound("TacInt_superv.Clip_Out", path .. "clip_out-1.wav")
addsound("TacInt_superv.Clip_In", path .. "clip_in-1.wav")
addsound("TacInt_superv.bolt_release", path .. "bolt_release-1.wav")
addsound("TacInt_superv.bolt_back", path .. "bolt_back-1.wav")
addsound("TacInt_superv.bolt_forward", path .. "bolt_forward-1.wav")