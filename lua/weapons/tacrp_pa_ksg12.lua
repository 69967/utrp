SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "KelTec KSG"
SWEP.AbbrevName = "KSG"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "5Shotgun"

SWEP.Description = "A bizarre bullpup, twin-tubed, pump-action shotgun. Super high capacity offset by extreme heft."
SWEP.Description_Quote = "\"Hey! Quit eyeballing the chicks.\"" // blops 2 karma mission

SWEP.Trivia_Caliber = "12 Gauge"
SWEP.Trivia_Manufacturer = "Kel-Tec CNC Industries"
SWEP.Trivia_Year = "2011"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Alliance of Valiant Arms
Sounds: Infinity Ward & Navarro
Animation: Tactical Intervention, edited by speedonerd
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_ksg12.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_ksg12.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
    },
    [TacRP.BALANCE_TTT] = {
        // TODO
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Shotgun

// "ballistics"

SWEP.Damage_Max = 18
SWEP.Damage_Min = 4
SWEP.Range_Min = 300 // distance for which to maintain maximum damage
SWEP.Range_Max = 1500 // distance at which we drop to minimum damage
SWEP.Penetration = 1 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.75
SWEP.ArmorBonus = 1.25

SWEP.Num = 8

SWEP.MuzzleVelocity = 9500

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

SWEP.RPM = 60

SWEP.Spread = 0.035
SWEP.ShotgunPelletSpread = 0.035

SWEP.ShootTimeMult = 1

SWEP.MidAirSpreadPenalty = 0
SWEP.MoveSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.25
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 4
SWEP.RecoilKick = 18
SWEP.RecoilStability = 0.15

SWEP.RecoilSpreadPenalty = 0.02
SWEP.HipFireSpreadPenalty = 0.02

SWEP.CanBlindFire = true

SWEP.Sway = 1
SWEP.ScopedSway = 0.3

SWEP.FreeAimMaxAngle = 5

// handling

SWEP.MoveSpeedMult = 0.875
SWEP.ShootingSpeedMult = 0.7
SWEP.SightedSpeedMult = 0.7

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.32
SWEP.SprintToFireTime = 0.45

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(1.2, 0, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.3, 0.3, 0)
SWEP.SightPos = Vector(-3.11, -3, -5.2)

SWEP.CorrectivePos = Vector(0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.25, -0.05, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 14
SWEP.Ammo = "buckshot"
SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1.35

// sounds

local path = "tacint_shark/ksg/ksg_"

SWEP.Sound_Shoot = "^" .. path .. "fire.wav"
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
    ["reload"] = {"reload"},
    ["jam"] = "reload_finish"
}

SWEP.DeployTimeMult = 1.2

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

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped._ROOT_TGS12",
        InstalledElements = {"sights"},
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(6.25, -0.17, 6),
        Pos_WM = Vector(11, 1, -6.9),
        Ang_VM = Angle(-90, 180, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom"},
        Bone = "ValveBiped.foregrip",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.25,
        Pos_VM = Vector(0.1, 0, -0.15),
        Pos_WM = Vector(18, 2, -4.5),
        Ang_VM = Angle(0, 90, -90),
        Ang_WM = Angle(0, 0, 90),
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_duffle", "acc_extmag_shotgun", "acc_slingonly"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_manual", "trigger_pump"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Ammo",
        Category = {"ammo_shotgun"},
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

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_ksg12.PumpBack", path .. "pump_back.wav")
addsound("tacint_ksg12.PumpForward", path .. "pump_forward.wav")