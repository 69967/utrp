SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "TOZ-106"
SWEP.AbbrevName = "TOZ-106"
SWEP.Category = "Tactical RP" // "Tactical RP (Arctic)"

SWEP.SubCatTier = "5Value"
SWEP.SubCatType = "5Shotgun"

SWEP.Description = "Bolt-action hunting shotgun. Small caliber shells have excellent accuracy but are not very lethal."
SWEP.Description_Quote = "\"Head, eyes.\""

SWEP.Trivia_Caliber = "20 Gauge"
SWEP.Trivia_Manufacturer = "Tulsky Oruzheiny Zavod"
SWEP.Trivia_Year = "1993"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Model: RusMarine85\nAnimation: Tactical Intervention\nPorted by: Arctic"

SWEP.ViewModel = "models/weapons/tacint/v_toz106.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_toz106.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 14,
        Damage_Min = 6,
        Range_Min = 1400,
        ClipSize = 4,
        ReloadTimeMult = 0.9,
        MuzzleVelocity = 17000,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.9,
            [HITGROUP_RIGHTLEG] = 0.9,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 14,
        Damage_Min = 6,
        Range_Min = 400,
        Range_Max = 2500,
        Num = 6,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },

        ReloadTimeMult = 1.25,

        MoveSpeedMult = 0.9,
        ShootingSpeedMult = 0.5,
        SightedSpeedMult = 0.75,
        ReloadSpeedMult = 0.5,
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Shotgun

// "ballistics"

SWEP.Damage_Max = 11
SWEP.Damage_Min = 4
SWEP.Range_Min = 900 // distance for which to maintain maximum damage
SWEP.Range_Max = 2800 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.25
SWEP.ArmorBonus = 1

SWEP.Num = 6

SWEP.MuzzleVelocity = 11000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 42

SWEP.ShootTimeMult = 0.85

SWEP.Spread = 0.008
SWEP.ShotgunPelletSpread = 0.008

SWEP.HipfireSpreadPenalty = 0.01
SWEP.MidAirSpreadPenalty = 0.02

SWEP.ScopedSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.3 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 2
SWEP.RecoilVisualShake = 2

SWEP.RecoilKick = 9

SWEP.RecoilSpreadPenalty = 0.02

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.6
SWEP.SightedSpeedMult = 0.75

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.24

SWEP.Sway = 1
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 5

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -4)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(4, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(-3.83424, -2, -3.2791)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, -0.2)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 3
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

SWEP.MuzzleEffect = "muzzleflash_shotgun"
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

// anims

// VM:
// idle
// fire
// fire1, fire2...
// dryfire
// melee
// reload
// midreload
// prime_grenade
// throw_grenade
// throw_grenade_underhand
// deploy
// blind_idle
// blind_fire
// blind_fire1, blind_fire2...
// blind_dryfire

// WM:
// attack1
SWEP.AnimationTranslationTable = {
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = {"melee1", "melee2"},
    ["reload"] = "reload",
    ["deploy"] = "unholster"
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_ak",
        Bone = "ValveBiped.uratio_rootbone",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        Pos_VM = Vector(-5.6, 0.5, 9),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(20, 1, -5.5),
        Ang_WM = Angle(-10, 0, 0),
    },
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
        Category = {"acc", "acc_foldstock", "acc_extmag_sniper", "acc_sling", "acc_duffle", "acc_bipod"},
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
    [7] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
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