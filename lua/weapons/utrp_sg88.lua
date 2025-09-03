SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Slurpgewehr 88"
SWEP.AbbrevName = "SG-88"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "0Other"

SWEP.Description = "Vintage assault rifle revamped, Uses a proprietary ammo type."

SWEP.Trivia_Caliber = "9x19mm Slurpcorporate Premium"
SWEP.Trivia_Manufacturer = "Jack Haenel"
SWEP.Trivia_Year = "1988"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model/Texture: Tuuttipingu
Sounds: 
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_stg44.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_stg44.mdl"

SWEP.Slot = 2

// "ballistics"

SWEP.Damage_Max = 15
SWEP.Damage_Min = 5
SWEP.Range_Min = 4000
SWEP.Range_Max = 5000
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.8,
    [HITGROUP_RIGHTARM] = 0.8,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
    [HITGROUP_GEAR] = 0.8
}

SWEP.MuzzleVelocity = 32500

// misc. shooting

SWEP.Firemodes = {1}

SWEP.RPM = 500

SWEP.JamFactor = 1

SWEP.Spread = 0.003

SWEP.RecoilSpreadPenalty = 0.0003
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0075

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 35
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.4
SWEP.RecoilKick = 0.6
SWEP.RecoilStability = 0
SWEP.RecoilAltMultiplier = 0

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.8
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.45
SWEP.SprintToFireTime = 0.45

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(-2, 0, -10)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(-0.74, 0.3, 0)
SWEP.SightPos = Vector(-4.25, -7.5, -4.1)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.1

// reload

SWEP.ClipSize = 45
SWEP.Ammo = "9x19mm_sc"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/stg44.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.7
SWEP.DropMagazineTime = 0.6

// sounds

local path = "tacint_shark/stg44/"

SWEP.Sound_Shoot = "^" .. path .. "sg552-1.wav"
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
    ["fire4"] = "fire4_M",
    ["melee"] = "melee2"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.3, -0.2),
    vm_ang = Angle(0, 0.5, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.bolt_cover",
            pos = Vector(0, 0, -3),
            t0 = 0.01,
            t1 = 0.1,
        },
    },
}

// attachments

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {1, 1},
        },
    },
    ["tactical"] = {
        BGs_VM = {
            {2, 1}
        },
    },
}

SWEP.NoRMR = true


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-5.1, 0, 2.6),
        Pos_WM = Vector(5, 1.2, -6),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(180, 180, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
		VMScale = 0.75,
        Pos_VM = Vector(-3.3, -0.05, 25),
        Pos_WM = Vector(32, 1.2, -4.8),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(180, 180, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        InstalledElements = {"tactical"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
		VMScale = 0.85,
        Pos_VM = Vector(-4.05, -0.65, 15),
        Pos_WM = Vector(20, 1.5, -4.8),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(180, 180, -90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "perk_extendedmag", "acc_sling", "acc_duffle"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic", "bolt_jammable"},
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
        Category = {"9x19mm"},
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

addsound("tacint_stg44.Remove_Clip", path .. "magout.wav")
addsound("tacint_stg44.Insert_Clip", path .. "magin.wav")
addsound("tacint_stg44.Insert_Clip-mid", path .. "magtap.wav")
addsound("tacint_stg44.bolt_action", path .. "boltrelease.wav")
addsound("tacint_stg44.bolt_shut", path .. "boltrelease.wav")
addsound("tacint_stg44.bolt_back", path .. "boltpull.wav")
addsound("tacint_stg44.throw_catch", "tacrp/weapons/sg551/sg551_throw_catch.wav")
addsound("tacint_stg44.fire_selector", "tacrp/weapons/sg551/sg551_fire_selector.wav")