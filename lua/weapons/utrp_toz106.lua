SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "TOZ-106"
SWEP.AbbrevName = "TOZ-106"
SWEP.Category = "UTRP Longarms"

SWEP.SubCatType = "920 Gague Shotguns"

SWEP.Description = "Bolt-action hunting shotgun. Small caliber shells have excellent accuracy but are not very lethal."

SWEP.Trivia_Caliber = "20 Gauge"
SWEP.Trivia_Manufacturer = "Tulsky Oruzheiny Zavod"
SWEP.Trivia_Year = "1993"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Model: RusMarine85\nAnimation: Tactical Intervention\nPorted by: Arctic"

SWEP.ViewModel = "models/weapons/tacint/v_toz106.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_toz106.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3


// "ballistics"

SWEP.Damage_Max = 7
SWEP.Damage_Min = 4
SWEP.Range_Min = 3000
SWEP.Range_Max = 4000
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0.1
SWEP.ArmorBonus = 0

SWEP.Num = 17

SWEP.MuzzleVelocity = 30000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.25,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.8,
    [HITGROUP_RIGHTARM] = 0.8,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
    [HITGROUP_GEAR] = 0.8
}

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 42

SWEP.ShootTimeMult = 0.85

SWEP.Spread = 0.0075
SWEP.ShotgunPelletSpread = 0.02

SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0075


SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.3
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 2
SWEP.RecoilVisualShake = 2

SWEP.RecoilKick = 9

SWEP.RecoilSpreadPenalty = 0.02

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.8
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.36
SWEP.SprintToFireTime = 0.36

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "shotgun"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(-1, 0, -10)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(4, -2, -4)

SWEP.SprintAng = Angle(30, -22, -15)
SWEP.SprintPos = Vector(0, 0, -7)

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(-3.83424, -2, -3.2791)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, -0.2)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 4
SWEP.Ammo = "buckshot"

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uratio.mdl"
SWEP.DropMagazineImpact = "pistol"
SWEP.DropMagazineTime = 0.8
SWEP.ReloadTimeMult = 1
SWEP.ReloadUpInTime = 1.7

// sounds

SWEP.Sound_Shoot = "^tacrp/weapons/m4star10/fire-1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 115
SWEP.ShootPitchVariance = 0 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_pistol"
SWEP.EjectEffect = 3
SWEP.EjectDelay = 0.5


SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
}

SWEP.AnimationTranslationTable = {
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = "melee2"	,
    ["reload"] = "reload",
    ["deploy"] = "unholster"
}

// attachments

SWEP.Attachments = {
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_ebullet"},
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-2.5, 0, 17),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(20, 1, -5.5),
        Ang_WM = Angle(-10, 0, 0),
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_extmag_sniper", "acc_sling", "acc_duffle", "acc_bipod"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Ammo",
        Category = {"ammo_shotgun2"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
}

local path = "TacRP/weapons/uratio/uratio_"

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("TacInt_uratio.Clip_Out", path .. "clip_out.wav")
addsound("TacInt_uratio.Clip_In", path .. "clip_in.wav")
addsound("TacInt_uratio.Bolt_Back", path .. "bolt_back.wav")
addsound("TacInt_uratio.bolt_forward", path .. "bolt_forward.wav")
addsound("TacInt_uratio.safety", path .. "safety.wav")
addsound("TacInt_uratio.buttstock_back", path .. "buttstock_back.wav")
addsound("TacInt_uratio.buttstock_rest_down", path .. "buttstock_rest_down.wav")
addsound("TacInt_uratio.flip_up_cover", path .. "flip_up_cover.wav")