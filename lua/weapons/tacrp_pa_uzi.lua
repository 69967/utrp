SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "IMI Uzi"
SWEP.AbbrevName = "Uzi"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "3Submachine Gun"

SWEP.Description = "Post-war submachine gun with amazing controllability. One of the most iconic guns ever invented."
SWEP.Description_Quote = "\"You know your weapons, buddy.\"" // Terminator!

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "Israeli Military Industries"
SWEP.Trivia_Year = "1950"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model/Texture: Firearms: Source
Sound: Ghost597879, Ganryu, Strelok, Sticer
Animations: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint/v_uzi_b.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_uzi_b.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 25,
        Damage_Min = 14,
        HipFireSpreadPenalty = 0.01,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 20,
        Damage_Min = 10,
        Range_Min = 500,
        Range_Max = 1800,
        RPM = 500,

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
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachinePistol

// "ballistics"

SWEP.Damage_Max = 22
SWEP.Damage_Min = 10
SWEP.Range_Min = 700
SWEP.Range_Max = 2200
SWEP.Penetration = 3
SWEP.ArmorPenetration = 0.525
SWEP.ArmorBonus = 0.5

SWEP.MuzzleVelocity = 15000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.15,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {2, 1}

SWEP.RPM = 600

SWEP.Spread = 0.009


SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 14
SWEP.RecoilResetTime = 0.02
SWEP.RecoilDissipationRate = 33
SWEP.RecoilFirstShotMult = 1.5

SWEP.RecoilVisualKick = 1.25
SWEP.RecoilKick = 2.5
SWEP.RecoilStability = 0.5
SWEP.RecoilAltMultiplier = 300

SWEP.RecoilSpreadPenalty = 0.0013
SWEP.HipFireSpreadPenalty = 0.015

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.8

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.27
SWEP.SprintToFireTime = 0.32

SWEP.Sway = 0.9
SWEP.ScopedSway = 0.25

SWEP.FreeAimMaxAngle = 4

// hold types

SWEP.HoldType = "revolver"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-135, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 19, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -4)

SWEP.SightAng = Angle(0.3, 1.3, 0)
SWEP.SightPos = Vector(-3.30, -4, -3.8)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 32
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1.3

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/uzi.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.3

// sounds

local path = "tacrp/weapons/uzi/"
local path1 = "tacint_extras/uzi/"

SWEP.Sound_Shoot = "^" .. path1 .. "mac10-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "mp5-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1

SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "fire1_M",
    ["deploy"] = "unholster",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire1_M",
    ["fire3"] = "fire2_M",
    ["fire4"] = "fire3_M",
    ["fire5"] = {"fire4_M", "fire4_R"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.DeployTimeMult = 2

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.1),
    vm_ang = Angle(0, 0.25, 0),
    t = 0.2,
    tmax = 0.2,
}

SWEP.ShootTimeMult = 0.75

// attachments

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

SWEP.Attachments = {
    [1] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.uzi_rootbone",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2.9, -0.5, 14.7),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(18, 1.2, -3.8),
        Ang_WM = Angle(0, 0, 180),
    },

    [2] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.uzi_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-2, -0.25, 7.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(11, 1.2, -2.5),
        Ang_WM = Angle(0, 0, 0),
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_sling", "acc_duffle", "acc_extmag_smg"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_auto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol"},
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

addsound("tacint_ex_uzi.insert_clip", path1 .. "Clipin.wav")
addsound("tacint_ex_uzi.remove_clip", path1 .. "Clipout.wav")
addsound("tacint_ex_uzi.bolt_action", path1 .. "Boltpull.wav")
addsound("tacint_ex_uzi.foldingstock_back", path .. "foldingstock_back.wav")