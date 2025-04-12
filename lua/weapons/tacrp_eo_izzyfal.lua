SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "DSA SA58 Light-Barrel"
SWEP.AbbrevName = "FAL Izzy"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "5Sporter"

SWEP.Description = "Civilian variant of the iconic battle rifle. A bit heavy but boasts excellent stopping power and range."

SWEP.Trivia_Caliber = ".308 Winchester"
SWEP.Trivia_Manufacturer = "DS Arms"
SWEP.Trivia_Year = "2019"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model: Pete3D
Texture: Enron
Sounds: New World Interactive & speedonerd
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_izzyfal.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_izzyfal.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 45,
        Damage_Min = 30,
        ClipSize = 20,
        RPM = 450,
        RecoilKick = 5,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 30,
        Damage_Min = 20,
        Range_Min = 1000,
        Range_Max = 3000,

        RPM = 360,
        RPMMultSemi = 0.8,
        RecoilKick = 6,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.BattleRifle

// "ballistics"

SWEP.Damage_Max = 35
SWEP.Damage_Min = 26
SWEP.Range_Min = 1400
SWEP.Range_Max = 3800
SWEP.Penetration = 15
SWEP.ArmorPenetration = 0.9

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 29000

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 420
SWEP.RPMMultSemi = 0.5

SWEP.Spread = 0.0028

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 5
SWEP.RecoilResetTime = 0.12
SWEP.RecoilDissipationRate = 8
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 1.5

SWEP.RecoilKick = 8
SWEP.RecoilStability = 0.6
SWEP.RecoilAltMultiplier = 200

SWEP.RecoilSpreadPenalty = 0.006
SWEP.HipFireSpreadPenalty = 0.05
SWEP.PeekPenaltyFraction = 0.25

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.875
SWEP.ShootingSpeedMult = 0.8
SWEP.SightedSpeedMult = 0.6

SWEP.ReloadSpeedMult = 0.4

SWEP.AimDownSightsTime = 0.42
SWEP.SprintToFireTime = 0.45

SWEP.Sway = 1.25
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 6

SWEP.Bipod = false
SWEP.BipodRecoil = 0.5
SWEP.BipodKick = 0.4

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 1, 0)
SWEP.PassivePos = Vector(0, -2, -5.75)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(0.04, 0.13, 0)
SWEP.SightPos = Vector(-4.11, -7.2, -3.89)

SWEP.CorrectivePos = Vector(0, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 10
SWEP.Ammo = "ar2"
SWEP.Ammo_Expanded = "ti_rifle"

SWEP.ReloadTimeMult = 1.25
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/dsa58.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.45
SWEP.DropMagazineTime = 0.3

// sounds

local path = "TacRP/weapons/dsa58/dsa58_"
local path1 = "Tacint_shark/weapons/fal/"

SWEP.Sound_Shoot = "^" .. path1 .. "fal_fire1.wav"
SWEP.Sound_Shoot_Silenced = "^" .. path1 .. "fal_fire1_supp.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_g3"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire3_M",
    ["fire2"] = "fire4_M",
    ["fire3"] = "fire5_M",
    ["fire4"] = "fire5_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"}
}

SWEP.ShootTimeMult = 0.9

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.25,
    tmax = 0.25,
}

// attachments

SWEP.AttachmentElements = {
    ["sights"] = {
        BGs_VM = {
            {1, 1},
            {2, 1},
        },
    },
}

SWEP.NoRMR = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        InstalledElements = {"sights"},
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        Pos_VM = Vector(-5, -0.07, 4),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 3, 0.9),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        VMScale = 0.8,
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-3.4, 0, 31.5),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 37, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.sg551_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        Pos_VM = Vector(-3.5, -0.7, 18),
        Ang_VM = Angle(90, 0, -75),
        Pos_WM = Vector(0.75, 21, -0.75),
        Ang_WM = Angle(0, -90, -60),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling", "acc_duffle", "acc_extmag_rifle2", "acc_bipod"},
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

addsound("tacint_stg58.insert_clip", path1 .. "magin.wav")
addsound("tacint_stg58.insert_clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_stg58.remove_clip", path1 .. "magout.wav")
addsound("tacint_stg58.Handle_FoldDown", path .. "handle_folddown.wav")
addsound("tacint_stg58.bolt_back", path1 .. "boltback.wav")
addsound("tacint_stg58.bolt_release", path1 .. "boltrelease.wav")