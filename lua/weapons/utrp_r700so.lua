SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Remington 700 Sawed-off"
SWEP.AbbrevName = "Sawed-off Remington"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "Cut-down hunting rifle built by the sidearm-deficient to be a concealable handgun substitute. Modification seriously harms accuracy and ranged performance."

SWEP.Trivia_Caliber = ".308 Winchester"
SWEP.Trivia_Manufacturer = "Remington Arms, Bubba"
SWEP.Trivia_Year = "1962"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Assets: Bethesda Game Studios\nAnimation: Tactical Intervention\nPorted By: Arctic"

SWEP.ViewModel = "models/weapons/tacint/v_obrez.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_obrez.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 50
SWEP.Damage_Min = 30
SWEP.Range_Min = 2750
SWEP.Range_Max = 4225
SWEP.Penetration = 8
SWEP.ArmorPenetration = 1
SWEP.JamFactor = 0.0002


SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.8,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
    [HITGROUP_GEAR] = 1
}


SWEP.MuzzleVelocity = 40000

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 50

SWEP.Spread = 0.006

SWEP.HipFireSpreadPenalty = 0.015
SWEP.PeekPenaltyFraction = 0.3

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 2
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 6

SWEP.RecoilKick = 15
SWEP.RecoilStability = 0.5

SWEP.RecoilSpreadPenalty = 0.02

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.8

SWEP.ReloadSpeedMult = 0.6

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.8

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 4

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 15, -45)
SWEP.BlindFirePos = Vector(1, -2, -3)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireRightAng = Angle(-75, 0, 0)
SWEP.BlindFireRightPos = Vector(-10, 10, -5)

SWEP.BlindFireSuicideAng = Angle(0, 135, 0)
SWEP.BlindFireSuicidePos = Vector(-2, 45, -35)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -8)

SWEP.SightAng = Angle(0.03, 0.4, 0)
SWEP.SightPos = Vector(-2.68, -6.5, -3.05)

SWEP.CorrectivePos = Vector(0.05, 0, 0.2)
SWEP.CorrectiveAng = Angle(-0.36, -0.3, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "357"
SWEP.AmmoTTT = "357"
SWEP.Ammo_Expanded = "ti_rifle"

SWEP.ReloadTimeMult = 1
SWEP.ShootTimeMult = 0.8
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl" // why doesn't it have its own mag model?

SWEP.ReloadUpInTime = 2.1
SWEP.DropMagazineTime = 1.4

// sounds

local path = "TacRP/weapons/spr/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 2
SWEP.EjectDelay = 0.5

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = "shoot1",
	["melee"] = "melee2"
}

// attachments

SWEP.AttachmentElements = {
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_sniper", "acc_holster", "acc_brace"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Trigger",
        Category = {"trigger_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Ammo",
        Category = {"ammo_sniper"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
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

addsound("TacInt_spr.Clip_Out", path .. "clip_out-1.wav")
addsound("TacInt_spr.Clip_In", path .. "clip_in-1.wav")
addsound("TacInt_spr.Bolt_Back", path .. "bolt_back-1.wav")
addsound("TacInt_spr.bolt_forward", path .. "bolt_forward-1.wav")
addsound("TacInt_spr.safety", path .. "safety-1.wav")