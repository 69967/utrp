SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK HK417"
SWEP.AbbrevName = "HK417"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "87.62x51mm Automatic Rifles"

SWEP.Description = "Battle rifle with superb damage, fire rate and precision. Capable of automatic fire, although it is very unstable."

SWEP.Trivia_Caliber = "7.62x51mm"
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "2006"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = "Assets: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint/v_hk417.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_hk417.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 50
SWEP.Damage_Min = 30
SWEP.Range_Min = 10000 // distance for which to maintain maximum damage
SWEP.Range_Max = 15000 // distance at which we drop to minimum damage
SWEP.Penetration = 10 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 1
SWEP.JamFactor = 0.0002

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 3,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
    [HITGROUP_GEAR] = 1
}

SWEP.MuzzleVelocity = 60000

// misc. shooting

SWEP.Firemodes = {1, 2}

SWEP.RPM = 750

SWEP.Spread = 0.001
SWEP.RecoilSpreadPenalty = 0.0006
SWEP.HipFireSpreadPenalty = 0.03
SWEP.MoveSpreadPenalty = 0.007

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 3
SWEP.RecoilMaximum = 60
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.75
SWEP.RecoilKick = 1.5
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9

SWEP.ReloadSpeedMult = 0.725

SWEP.AimDownSightsTime = 0.26
SWEP.SprintToFireTime = 0.26

SWEP.Sway = 1
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 5.5

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 1, -8)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 10)
SWEP.SprintPos = Vector(5, 0, -5)

SWEP.SightAng = Angle(0.05, 0, 0)
SWEP.SightPos = Vector(-4.495, -7.5, -4.17)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/g36k.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.3

// sounds

local path = "tacrp/weapons/hk417/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "tacrp/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
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
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
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
    },
    ["foldstock"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "ValveBiped._ROOT_HK417",
        InstalledElements = {"sights"},
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.85,
        Pos_VM = Vector(-4.7, 0.6, 5),
        Pos_WM = Vector(10, 1.25, -6.25),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped._ROOT_HK417",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.9, 0.6, 24),
        Pos_WM = Vector(27, 1.25, -4.25),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped._ROOT_HK417",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-3, -0.35, 15),
        Pos_WM = Vector(19, 2.25, -4.4),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, 0, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_extmag_rifle2", "acc_sling", "acc_duffle", "acc_bipod"},
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
        Category = {"ammo_rifle"},
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

addsound("tacint_hk417.clip_out", path .. "clip_out.wav")
addsound("tacint_hk417.clip_in", path .. "clip_in.wav")
addsound("tacint_hk417.bolt_action", path .. "bolt_action.wav")
addsound("tacint_hk417.bolt_latch", path .. "bolt_latch.wav")
addsound("tacint_hk417.fire_select", path .. "fire_select.wav")
addsound("tacint_hk417.Buttstock_Back", path .. "buttstock_back.wav")