SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AR-15 Compact"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "1Pistol"

SWEP.Description = "Stockless, extremely short barrel AR-15 configuration.\nLegally a pistol and light enough to function as a sidearm, but it is unstable and imprecise without the form factor of a rifle."

SWEP.Trivia_Caliber = "5.56x45mm"
SWEP.Trivia_Manufacturer = "Ultra-Tac" // Fake company. Sounds like the kind of company that would sell an AR-15 pistol
SWEP.Trivia_Year = "2012" // Could be literally anytime within the current century tbh

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

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 26,
        Damage_Min = 15,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 15,
        Damage_Min = 8,
        Range_Min = 500,
        Range_Max = 2000,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 9,
        Damage_Min = 5,
        Range_Min = 600,
        Range_Max = 2800,

        RecoilSpreadPenalty = 0.0017,
    },
}

SWEP.TTTReplace = {["weapon_zm_mac10"] = 0.5}

// "ballistics"

SWEP.Damage_Max = 22
SWEP.Damage_Min = 12
SWEP.Range_Min = 300
SWEP.Range_Max = 1700
SWEP.Penetration = 8 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.7

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 17000

// misc. shooting

SWEP.Firemode = 1
SWEP.RPM = 600
SWEP.RPMMultSemi = 0.7

SWEP.Spread = 0.01

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 7
SWEP.RecoilResetTime = 0.12
SWEP.RecoilDissipationRate = 10
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 1

SWEP.RecoilKick = 6
SWEP.RecoilStability = 0.2
SWEP.RecoilAltMultiplier = 75

SWEP.RecoilSpreadPenalty = 0.003
SWEP.HipFireSpreadPenalty = 0.02
SWEP.PeekPenaltyFraction = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.95
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.85

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.28

SWEP.Sway = 1.25
SWEP.ScopedSway = 0.55

SWEP.FreeAimMaxAngle = 4

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

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
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/m4.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.3
SWEP.DropMagazineTime = 0.4

// sounds

local path = "TacRP/weapons/m4/m4_"
local path2 = "tacrp_extras/m4a1/m4a1_"
local path3 = "tacint_extras/ar15pistol/"

SWEP.Sound_Shoot = "^" .. path3 .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path3 .. "m4a1-1.wav"

SWEP.Vol_Shoot = 120
SWEP.Pitch_Shoot = 105
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire2_M",
    ["fire2"] = "fire3_M",
    ["fire3"] = "fire4_M",
    ["fire4"] = "fire5_M",
    ["fire5"] = {"fire5_M", "fire5_L", "fire5_R"},
    ["melee"] = {"melee1", "melee2"},
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
        Category = "silencer",
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
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
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
        Category = {"acc", "perk_extendedmag", "acc_holster"},
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

addsound("tacint_ar15pistol.Remove_Clip", path2 .. "clipout.mp3")
addsound("tacint_ar15pistol.Insert_Clip", path2 .. "clipin.mp3")
addsound("tacint_ar15pistol.Insert_Clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_ar15pistol.bolt_action", path .. "bolt_action.wav")
addsound("tacint_ar15pistol.bolt_slap", path .. "bolt_slap.wav")
addsound("tacint_ar15pistol.throw_catch", path .. "throw_catch.wav")