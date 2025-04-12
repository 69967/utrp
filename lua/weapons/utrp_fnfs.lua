SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "FN Five-seveN"
SWEP.AbbrevName = "Five-seveN"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "Bulky PDW caliber pistol with excellent capacity.\nHigh velocity rounds retain effectiveness at range and pierces armor easily."

SWEP.Trivia_Caliber = "5.7x28mm"
SWEP.Trivia_Manufacturer = "FN Herstal"
SWEP.Trivia_Year = "1998"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Assets: Counter-Strike: Online 2, edited by speedonerd
Sounds: Vunsunta, Counter-Strike: Online 2
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_57.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_57.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 20
SWEP.Damage_Min = 5
SWEP.Range_Min = 4500
SWEP.Range_Max = 6500
SWEP.Penetration = 7
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.75

SWEP.MuzzleVelocity = 37500

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

SWEP.Firemode = 1

SWEP.RPM = 600
SWEP.RPMMultSemi = 0.65

SWEP.Spread = 0.004
SWEP.RecoilSpreadPenalty = 0.0009
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 0.8
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.33
SWEP.RecoilKick = 1
SWEP.RecoilStability = 0

SWEP.CanBlindFire = true

// handling

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
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0.25, -2, -6.5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 15, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(0.1, 0.55, 0)
SWEP.SightPos = Vector(-3.44, 0, -3.75)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 20
SWEP.Ammo = "smg1"
SWEP.Ammo_Expanded = "ti_pdw"

SWEP.ReloadTimeMult = 1.35

SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/57.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 0.85
SWEP.DropMagazineTime = 0.2

// sounds

local path = "tacrp/weapons/p2000/p2000_"
local path1 = "tacint_shark/57/"

SWEP.Sound_Shoot = "^" .. path1 .. "fiveseven-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "usp1.wav"


SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4
SWEP.EjectEffect = 2

SWEP.MuzzleEffect = "muzzleflash_suppressed"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"sshoot1"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.7),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.2,
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
            t1 = 0.1,
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
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(0.04, 0.25, -0.4),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(-0.2, -1, -0.75),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.55,
        WMScale = 0.6,
        Pos_VM = Vector(-3.2, -0.05, 10),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(-0.1, 9, -1.5),
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
        Pos_VM = Vector(-2, -0.05, 6),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(-0.2, 5, -2.75),
        Ang_WM = Angle(0, -90, 180),
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
        Category = {"ammo_rifle"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Accessory",
        Category = "acc_extmag_pistol",
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

addsound("tacint_57.clip_in", path1 .. "p228_clipin.wav")
addsound("tacint_57.clip_in-mid", path1 .. "p228_clipin.wav")
addsound("tacint_57.clip_out", path1 .. "magout.wav")
addsound("tacint_57.slide_action", path1 .. "fiveseven_slidepull.wav")
addsound("tacint_57.slide_shut", path1 .. "sliderelease.wav")
addsound("tacint_57.cock_hammer", path .. "cockhammer.wav")