SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Steyr AUG A2"
SWEP.AbbrevName = "AUG A2"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "65.56x45mm Automatic Rifles"

SWEP.Description = "Burst bullpup rifle with a generous magazine capacity and great handling."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Steyr Arms"
SWEP.Trivia_Year = "1977"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = "Assets: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint/v_aug.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_aug.mdl"

SWEP.Slot = 2

SWEP.Damage_Max = 38
SWEP.Damage_Min = 15
SWEP.Range_Min = 6000
SWEP.Range_Max = 9000
SWEP.Penetration = 6
SWEP.ArmorPenetration = 0.775
SWEP.MuzzleVelocity = 42500


SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 0.8,
    [HITGROUP_RIGHTARM] = 0.8,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {-3, 1}
SWEP.RPM = 750
SWEP.RPMMultBurst = 900 / 750
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.0015
SWEP.RecoilSpreadPenalty = 0.0006
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0075

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 2.2
SWEP.RecoilMaximum = 50
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.3
SWEP.RecoilKick = 0.6
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.8
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.28
SWEP.SprintToFireTime = 0.28

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "crossbow"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, -8)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -12)

SWEP.SightAng = Angle(0.01, 0.12, 0)
SWEP.SightPos = Vector(-3.93, -6, -4.9)

SWEP.CorrectivePos = Vector(0.12, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, -1)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 36
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/aug.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.7
SWEP.DropMagazineTime = 0.8

// sounds

local path = "tacrp/weapons/aug/aug_"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 115
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
    ["melee"] = {"melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.25,
    tmax = 0.25,
}

// attachments

SWEP.AttachmentElements = {
    ["irons"] = {
        BGs_VM = {
            {1, 1}
        },
    },
}

SWEP.NoRMR = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        InstalledElements = {"irons"},
        Bone = "ValveBiped.AUG_rootbone",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-6.4, 0, 1),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(4.5, 1, -7),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.AUG_rootbone",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.7, 0, 18.5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(23, 1, -4.5),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.AUG_rootbone",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-5, 0, 10),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(14, 1, -6),
        Ang_WM = Angle(0, 0, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling", "acc_duffle", "perk_extendedmag"},
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
        Category = {"trigger_burst"},
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

addsound("tacint_aug.insert_clip", path .. "insert_clip.wav")
addsound("tacint_aug.remove_clip", path .. "remove_clip.wav")
addsound("tacint_aug.Handle_FoldDown", path .. "handle_folddown.wav")
addsound("tacint_aug.bolt_lockback", path .. "bolt_lockback.wav")
addsound("tacint_aug.bolt_release", path .. "bolt_release.wav")