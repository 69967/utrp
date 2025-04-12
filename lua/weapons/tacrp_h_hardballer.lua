SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AMT Hardballer"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "1Pistol"

SWEP.Description = "Long-slide pistol with stainless steel construction. Accurate and hits hard at range."
SWEP.Description_Quote = "\"I'll be back...\""

SWEP.Trivia_Caliber = ".45 ACP"
SWEP.Trivia_Manufacturer = "Arcadia Machine & Tool."
SWEP.Trivia_Year = "1980"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Terminator: Resistance (port by Sirgibsalot)
Sounds: Navaro
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_hardballer.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_hardballer.mdl"

SWEP.Slot = 1

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 38,
        RPM = 300,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 35,
        Damage_Min = 25,
        Range_Min = 500,
        Range_Max = 2000,

        RPM = 210,
        RPMMultSemi = 0.7,
        ShootTimeMult = 0.8,

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
        Damage_Max = 15,
        Damage_Min = 6,
        RPM = 300,

        RecoilResetInstant = true,
        HipFireSpreadPenalty = 0.015,
        RecoilSpreadPenalty = 0.005,
        RecoilMaximum = 3,
        RecoilResetTime = 0.25,
        RecoilDissipationRate = 5,
        RecoilFirstShotMult = 0.8,
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Pistol

// "ballistics"

SWEP.Damage_Max = 40
SWEP.Damage_Min = 20
SWEP.Range_Min = 500 // distance for which to maintain maximum damage
SWEP.Range_Max = 2400 // distance at which we drop to minimum damage
SWEP.Penetration = 6 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.65
SWEP.ArmorBonus = 0.5

SWEP.MuzzleVelocity = 12000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 400
SWEP.RPMMultSemi = 0.7

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.01
SWEP.HipFireSpreadPenalty = 0.025

SWEP.ShootTimeMult = 0.75

SWEP.RecoilResetInstant = true
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 2
SWEP.RecoilResetTime = 0.1
SWEP.RecoilDissipationRate = 5
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 2

SWEP.RecoilKick = 6
SWEP.RecoilStability = 0.6

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.8

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.28
SWEP.SprintToFireTime = 0.26

// hold types

SWEP.HoldType = "revolver"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(3, 0, 0)
SWEP.PassivePos = Vector(1, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 45)
SWEP.BlindFireSuicidePos = Vector(27, 17, -6)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -12)

SWEP.SightAng = Angle(5.05, 0.1, 0)
SWEP.SightPos = Vector(-2.35, 0, -3.6)

SWEP.CorrectivePos = Vector(-1.47, 0, 0)
SWEP.CorrectiveAng = Angle(-5, 5, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.Sway = 1
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 5

// reload

SWEP.ClipSize = 7
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_heavy"

SWEP.ReloadTimeMult = 1.15

SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/hardballer.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.2

// sounds

local path = "TacRP/weapons/gsr1911/gsr1911_"
local path1 = "Tacint_shark/hardballer/"

SWEP.Sound_Shoot = "^" .. path1 .. "hardballer_fire.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "shots.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4
SWEP.QCA_Eject = 2
SWEP.EjectEffect = 1

SWEP.MuzzleEffect = "muzzleflash_pistol"

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
            bone = "slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "hammer",
            ang = Angle(-15, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.2,
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

SWEP.NoTactical = true

SWEP.AttachmentElements = {
    ["lazur"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_pistol", "hardballer_laser"},
        Bone = "slide",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(0, 0, 0.4),
        Ang_VM = Angle(0, -90, 0),
        Pos_WM = Vector(0, -1, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "barrel",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.6,
        WMScale = 0.6,
        Pos_VM = Vector(-0.6, 0, 10.3),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 11.85, -1.75),
        Ang_WM = Angle(0, -90, 0),
    },
	[3] = {
        PrintName = "Tactical",
        Category = {"tactical_zoom", "tactical_ebullet"},
        Bone = "sphinx_ROOT",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0.1, 6.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5.5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol2", "acc_holster", "acc_brace"},
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

addsound("tacint_hardballer.Clip_In", path1 .. "clipin.wav")
addsound("tacint_hardballer.Clip_Out", path1 .. "clipout.wav")
addsound("tacint_hardballer.Slide_Shut", path1 .. "sliderelease2.wav")
addsound("tacint_hardballer.Slide_Back", path1 .. "SlideBack.wav")
addsound("tacint_hardballer.Slide_Forward", path1 .. "sliderelease.wav")
