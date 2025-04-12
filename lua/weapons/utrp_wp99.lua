SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

SWEP.PrintName = "Walther P99"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "29mm Pistols"

SWEP.Description = "Well-rounded pistol with a rapid rate of fire."

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "Walther"
SWEP.Trivia_Year = "1990"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: Afterburner
Texture: NCFurious
Sounds: KingFriday, Vunsunta & speedonerd
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_p99.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_p99.mdl"

SWEP.Slot = 1


// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 3500
SWEP.Range_Max = 5000
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2
SWEP.MuzzleVelocity = 32500

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

SWEP.Firemode = 1
SWEP.RPM = 500
SWEP.RPMMultSemi = 0.9
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.0015
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.4
SWEP.RecoilKick = 1.25
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

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 60)
SWEP.BlindFireSuicidePos = Vector(25, 10, -4)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(0.1, 0.2, 0)
SWEP.SightPos = Vector(-3.41, 0, -3.3)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 15
SWEP.Ammo = "pistol"

SWEP.ReloadUpInTime = 0.85
SWEP.DropMagazineTime = 0.2

SWEP.ReloadTimeMult = 1.2

SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/p99.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "tacrp/weapons/p2000/p2000_"
local path1 = "tacint_shark/weapons/p99/p99_"

SWEP.Sound_Shoot = "^" .. path1 .. "unsil-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "sil-1.wav"

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
    ["fire_iron"] = "shoot2",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
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

SWEP.NoIdle = true

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true

// attachments

SWEP.Attachments = {
    [2] = {
        PrintName = "Muzzle",
        Category = {"brake", "lc_silencer", "barrel"},
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.6,
        Pos_VM = Vector(-0.47, 0.43, 5.7),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(13.5, 1.3, -4.1),
        Ang_WM = Angle(0, -0, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical_ebullet",
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        VMScale = 0.9,
        WMScale = 0.9,
        Pos_VM = Vector(-2, 0, 5.25),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(10, 1.25, -2.75),
        Ang_WM = Angle(0, 0, 0),
    },
    [4] = {
        PrintName = "Holster",
        Category = "acc_holster",
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
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol"},
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

addsound("tacint_p99.clip_in", path1 .. "magin.wav")
addsound("tacint_p99.clip_in-mid", path1 .. "magin.wav")
addsound("tacint_p99.clip_out", path1 .. "magout.wav")
addsound("tacint_p99.slide_action", path1 .. "slideaction.wav")
addsound("tacint_p99.slide_shut", path1 .. "sliderelease.wav")
addsound("tacint_p99.cock_hammer", path .. "cockhammer.wav")
