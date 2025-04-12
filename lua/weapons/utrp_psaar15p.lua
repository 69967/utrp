SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AR-15 Pistol"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "10.5in barreled variant of a familiar rifle.\n\n\n Frightful close-quarters stopping power on a budget."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Palmetto State Armory"
SWEP.Trivia_Year = "2012"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model/Texture: Mateusz Woliński, Jordan Whincup
Magazine: Twinke Masta
Sound: Teh Strelok, Vunsunta, xLongWayHome, CS:O2
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_ar15pistol.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_ar15pistol.mdl"

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
SWEP.PassivePos = Vector(0, -1, -7)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -30, -15)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(0.15, 0, 0)
SWEP.SightPos = Vector(-4.2, -7.5, -4.18)

SWEP.CorrectivePos = Vector(-0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.03, 0.45, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)
// reload

SWEP.ClipSize = 30
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/ak47q.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

SWEP.Sound_Shoot = "m4_fire_o_single.wav"
SWEP.Sound_Shoot_Silenced = ""
SWEP.Sound_Shoot_Indoors = ""
SWEP.Sound_Shoot_Silenced_Indoors = ""

SWEP.Vol_Shoot = 120
SWEP.Pitch_Shoot = 105
SWEP.ShootPitchVariance = 2.5

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
    ["fire1"] = "fire2_M",
    ["fire2"] = "fire3_M",
    ["fire3"] = "fire4_M",
    ["fire4"] = "fire5_M",
    ["fire5"] = {"fire5_M", "fire5_L", "fire5_R"},
    ["melee"] = "melee2",
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

SWEP.DeployTimeMult = 0.75


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        InstalledElements = {"sights"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5.5, -0.05, 4),
        Pos_WM = Vector(0.4, 3, 0.6),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"556_silencer", "barrel", "brake"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.8,
        WMScale = 0.8,
        Pos_VM = Vector(-3.94, -0.05, 16.4),
        Pos_WM = Vector(1.1, 15.2, -1),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90 + 3.5, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_ebullet"},
        Bone = "ValveBiped.m4_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 0.8,
        WMScale = 0.8,
        Pos_VM = Vector(-4.6, -0.7, 9.5),
        Pos_WM = Vector(1.25, 8, -0.4),
        Ang_VM = Angle(90, 0, -45),
        Ang_WM = Angle(-75, -90, 0),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "tactical_zoom", "perk_extendedmag"},
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
        Category = {"trigger_semi"},
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
        PrintName = "Accessory",
        Category = {"acc", "perk_extendedmag"},
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

addsound("tacint_ar15pistol.Remove_Clip", "m4_mo.wav")
addsound("tacint_ar15pistol.Insert_Clip", "m4_mi.wav")
addsound("tacint_ar15pistol.Insert_Clip-mid", "m4_mi_mid.wav")
addsound("tacint_ar15pistol.bolt_action", "m4_ba.wav")
addsound("tacint_ar15pistol.bolt_slap", "m4_bs.wav")
addsound("tacint_ar15pistol.throw_catch", "m4_thc.wav")