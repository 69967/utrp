SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "CZ Scorpion EVO 3"
SWEP.AbbrevName = "EVO 3"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "29x19 Submachine Guns"

SWEP.Description = "Modern SMG boasting a very high rate of fire. Used for police applications."

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "CZ Uherský Brod"
SWEP.Trivia_Year = "2009"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Assets: Warface, Ghost1592365
Sounds: Vunsunta
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_evo3.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_evo3.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 5000
SWEP.Range_Max = 8000
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2
SWEP.MuzzleVelocity = 35000

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

SWEP.Firemodes = {2, -3, 1}

SWEP.RunawayBurst = false

SWEP.RPM = 1150
SWEP.RPMMultBurst = 1.25
SWEP.PostBurstDelay = 0.1
SWEP.RunawayBurst = false

SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.0008
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.004

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.5
SWEP.RecoilKick = 1.25
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
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(-0.03, 0.2, 0)
SWEP.SightPos = Vector(-4.58, -7.5, -2.75)

SWEP.CorrectivePos = Vector(0.025, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 30
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1.1
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/evo3.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.55
SWEP.DropMagazineTime = 1

// sounds

local path = "TacRP/weapons/mp5/mp5_"
local path1 = "Tacint_shark/scorpionevo/"

SWEP.Sound_Shoot = "^" .. path1 .. "mp5-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "mp5-2.wav"

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
    ["fire_iron"] = {"fire1_L", "fire1_M"},
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = {"melee1", "melee2"}
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
        }
    },
    ["optic"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["tactical"] = {
        BGs_VM = {
            {3, 1}
        },
    },
}

SWEP.NoRMR = false

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-5.75, -0.3, 4.5),
        Pos_WM = Vector(7.2, 1.65, -6.3),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.85,
        WMScale = 0.85,
        Pos_VM = Vector(-3.4, -0.25, 17.6),
        Pos_WM = Vector(20.5, 2.3, -4),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.05,
        Pos_VM = Vector(-2.3, -0.25, 13),
        Pos_WM = Vector(14, 1.3, -5),
        Ang_VM = Angle(90, 0, 180),
        Ang_WM = Angle(0, -3.5, -90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_sling", "acc_duffle", "acc_extmag_smg"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
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
    }
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_evo3.remove_clip", path .. "remove_clip.wav")
addsound("tacint_evo3.insert_clip", path .. "insert_clip.wav")
addsound("tacint_evo3.insert_clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_evo3.HK_Slap", path .. "hk_slap.wav")
addsound("tacint_evo3.bolt_back", path .. "bolt_back.wav")
addsound("tacint_evo3.fire_select", {
    path .. "fire_select-1.wav",
    path .. "fire_select-2.wav",
    path .. "fire_select-3.wav",
})