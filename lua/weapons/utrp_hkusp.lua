SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK USP"
SWEP.AbbrevName = "USP"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "3.45 ACP Pistols"

SWEP.Description = "Tactical pistol with good damage and range."
SWEP.Description_Quote = "\"Man of few words, aren't you?\""

SWEP.Trivia_Caliber = ".45 ACP"
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "1993"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: Thanez, Racer445
Texture: Thanez, fxdarkloki
Sound: Vunsunta, BlitzBoaR
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_usp.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_usp.mdl"

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

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-125, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 12, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(-0.01, 0.14, 0)
SWEP.SightPos = Vector(-3.48, 0, -3.5)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 12
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_heavy"

SWEP.ReloadTimeMult = 1.25

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/p2000.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 0.85

// sounds

local path = "tacrp_extras/usp/"

SWEP.Sound_Shoot = "^" .. path .. "Fire.wav"
SWEP.Sound_Shoot_Silenced = path .. "Supressed.wav"

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
    ["fire_iron"] = "new_shoot1",
    ["fire"] = "new_shoot1", // {"shoot1", "shoot2", "shoot3"},
    ["lastshot"] = "new_lastshot",
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1",
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
            t1 = 0.1,
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

SWEP.NoIdle = false

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true

// attachments

SWEP.AttachmentElements = {
    ["pistol_comp"] = {
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
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1.2,
        Pos_VM = Vector(0.035, 0, -0.2),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0, -1, -0.8),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"comp_usp", "silencer"},
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.6,
        WMScale = 0.5,
        Pos_VM = Vector(-0.5, 0.39, 7),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8.5, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0, 6),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -3),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol", "acc_holster", "acc_brace"},
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
        Category = {"ammo_usp", "ammo_pistol"},
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

addsound("tacint_extras_usp.clip_in", path .. "clipin.wav")
addsound("tacint_extras_usp.clip_in-mid", path .. "clipin.wav")
addsound("tacint_extras_usp.clip_out", path .. "clipout.wav")

addsound("tacint_extras_usp.slide_action", path .. "SlideBack.wav")

addsound("tacint_extras_usp.slide_open", path .. "magshove.mp3")
addsound("tacint_extras_usp.slide_shut", path .. "boltrelease.wav")