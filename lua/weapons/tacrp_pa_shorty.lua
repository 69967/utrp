SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Serbu Super Shorty"
SWEP.AbbrevName = "Shorty"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "5Shotgun"

SWEP.Description = "A custom-made ultra short shotgun, intended for extreme concealability but sacrifices accuracy and capacity. Fits in sidearm holsters."
SWEP.Description_Quote = "\"Need a facelift, pretty boy?\"" // The Expendables

SWEP.Trivia_Caliber = "12 Gauge"
SWEP.Trivia_Manufacturer = "Serbu Firearms"
SWEP.Trivia_Year = "1996"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = "Assets: Millennia\nAnimations: Tactical Intervention\nPorted by: Arctic"

SWEP.ViewModel = "models/weapons/tacint/v_shorty.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_shorty.mdl"

SWEP.Slot = 1
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 18,
        Damage_Min = 6,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 10,
        Damage_Min = 2,
        Range_Min = 200,
        Range_Max = 1200,
        Num = 9,
        ClipSize = 3,

        Spread = 0.05,
        ShotgunPelletSpread = 0.03,
        HipFireSpreadPenalty = 0,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 12,
        Damage_Min = 3,
        Range_Min = 100,
        Range_Max = 1200,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 1.5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        RecoilDissipationRate = 1.5,
        HipFireSpreadPenalty = 0.04
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Shotgun

// "ballistics"

SWEP.Damage_Max = 14
SWEP.Damage_Min = 5
SWEP.Range_Min = 150 // distance for which to maintain maximum damage
SWEP.Range_Max = 800 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.5
SWEP.ArmorBonus = 1.25

SWEP.Num = 8

SWEP.MuzzleVelocity = 12000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1.5,
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

SWEP.FiremodeName = "Pump-Action" // only used externally for firemode name distinction

SWEP.RPM = 80

SWEP.Spread = 0.05
SWEP.ShotgunPelletSpread = 0.04
SWEP.ShootTimeMult = 0.75

SWEP.MidAirSpreadPenalty = 0
SWEP.MoveSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 2.5
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 4
SWEP.RecoilKick = 20
SWEP.RecoilStability = 0.2

SWEP.RecoilSpreadPenalty = 0.02
SWEP.HipFireSpreadPenalty = 0.015

SWEP.CanBlindFire = true

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 2

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.65
SWEP.SightedSpeedMult = 0.9

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.28

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(1, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.3, 1.35, 0)
SWEP.SightPos = Vector(-2.98, -3, -3.5)

SWEP.CorrectivePos = Vector(0.09, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.25, -0.05, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(-3, 4, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 3
SWEP.Ammo = "buckshot"
SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1

// sounds

local path = "tacrp/weapons/tgs12/"

SWEP.Sound_Shoot = "^tacint_extras/shorty/shorty-1.wav"
SWEP.Sound_Shoot_Silenced = "tacrp/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 0 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.EjectEffect = 3
SWEP.EjectDelay = 0.5

// anims

SWEP.AnimationTranslationTable = {
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = {"melee1", "melee2"},
    ["reload"] = {"reload", "reload2"},
    ["jam"] = "reload_finish"
}

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {5, 1}
        },
    },
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped._ROOT_TGS12",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.25,
        Pos_VM = Vector(4, 0.5, 12),
        Pos_WM = Vector(15, 1, -5.75),
        Ang_VM = Angle(-90, 180, -90),
        Ang_WM = Angle(-10, 0, 90),
    },
    [2] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_holster", "acc_extmag_shotgun"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Trigger",
        Category = {"trigger_manual", "trigger_pump"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Ammo",
        Category = {"ammo_shotgun"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
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

addsound("tacint_fp6.Insertshell",
    {
        "tacrp/weapons/fp6/fp6_insertshell-1.wav",
        "tacrp/weapons/fp6/fp6_insertshell-2.wav",
        "tacrp/weapons/fp6/fp6_insertshell-3.wav",
    }
)
addsound("tacint_Bekas.Insertshell", "tacrp/weapons/bekas/insertshell-1.wav")
addsound("tacint_Bekas.Movement", "tacrp/weapons/bekas/movement-1.wav")
addsound("tacint_tgs12.PumpBack", path .. "pump_backward-1.wav")
addsound("tacint_tgs12.PumpForward", path .. "pump_forward-1.wav")