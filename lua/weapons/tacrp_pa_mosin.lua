SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Mosin-Nagant 91/30"
SWEP.AbbrevName = "M91/30"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "5Value"
SWEP.SubCatType = "6Marksman Rifle"

SWEP.Description = "Mass production Soviet bolt-action rifle. Infantry model cycles faster but is inaccurate; equip a scope for increased accuracy at cost of firerate."
SWEP.Description_Quote = "\"One out of two gets a rifle, one without follows him!\""
SWEP.Trivia_Caliber = "7.62x54mmR"
SWEP.Trivia_Manufacturer = "Tula Arms Plant" // ... among countless others
SWEP.Trivia_Year = "1891"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = [[
Model/Texture: Red Orchestra 2
Sound: Red Orchestra 2, rzen1th
Animations: Cry of Fear, Lazarus, 8Z
]]

SWEP.ViewModel = "models/weapons/tacint_extras/v_mosin.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_mosin.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 78,
        Damage_Min = 45,

        RPM = 55,
        ShootTimeMult = 0.65,
        HipFireSpreadPenalty = 0.03,
        Spread = 0.0075,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1.25,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 70,
        Damage_Min = 30,
        Range_Min = 500,
        Range_Max = 4000,

        RPM = 35,
        ShootTimeMult = 1.1,
        Spread = 0.001,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 4,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.75,
            [HITGROUP_RIGHTARM] = 0.75,
            [HITGROUP_LEFTLEG] = 0.5,
            [HITGROUP_RIGHTLEG] = 0.5,
            [HITGROUP_GEAR] = 0.5
        },
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.SniperRifle

// "ballistics"

SWEP.Damage_Max = 78
SWEP.Damage_Min = 36
SWEP.Range_Min = 800
SWEP.Range_Max = 2800
SWEP.Penetration = 12
SWEP.ArmorPenetration = 0.8
SWEP.ArmorBonus = 1

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.15,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
    [HITGROUP_GEAR] = 0.5
}

SWEP.MuzzleVelocity = 32000

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Bolt-Action" // only used externally for firemode name distinction

SWEP.RPM = 52

SWEP.Spread = 0.01 // WW2 rifles weren't all that accurate...

SWEP.HipFireSpreadPenalty = 0.04
SWEP.PeekPenaltyFraction = 0.2

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 5
SWEP.RecoilKick = 7.5

SWEP.RecoilSpreadPenalty = 0 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.85
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.55

SWEP.ReloadSpeedMult = 0.3

SWEP.AimDownSightsTime = 0.35
SWEP.SprintToFireTime = 0.42

SWEP.Sway = 1
SWEP.ScopedSway = 0.1

SWEP.FreeAimMaxAngle = 7

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 2, 0)
SWEP.PassivePos = Vector(1.25, 4.5, -0.5)

SWEP.BlindFireAng = Angle(0, 15, -45)
SWEP.BlindFirePos = Vector(1, -2, -3)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireRightAng = Angle(-75, 0, 0)
SWEP.BlindFireRightPos = Vector(-10, 10, -5)

SWEP.BlindFireSuicideAng = Angle(0, 135, 0)
SWEP.BlindFireSuicidePos = Vector(-2, 45, -35)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(2, 4.5, 0.75)

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(-2.335, 1, 1.87)

SWEP.CorrectivePos = Vector(0.05, 0, 0.2)
SWEP.CorrectiveAng = Angle(0.1, -0.3, 0)

SWEP.CustomizePos = Vector(4, 3, -1.5)
SWEP.CustomizeAng = Angle(30, 15, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 4, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// scope

SWEP.Scope = true
SWEP.ScopeFOV = 90 / 1.25

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "ar2"
SWEP.Ammo_Expanded = "ti_rifle"

SWEP.ShotgunReload = true
SWEP.ShotgunThreeload = false
SWEP.ShotgunFullCancel = true
SWEP.ShotgunNoReverseStart = true

SWEP.ReloadTimeMult = 1
SWEP.ShootTimeMult = 0.675
SWEP.DropMagazineModel = false

SWEP.ShotgunLoadInTime = 0
SWEP.BulletBodygroups = {
    [1] = {1, 1},
}

// sounds

// local path = "TacRP/weapons/spr/"
local path1 = "tacint_extras/mosin/"

SWEP.Sound_Shoot = "^" .. path1 .. "mosin_fire.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 100
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.EjectEffect = 2
SWEP.EjectDelay = 0.5

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = "shoot2",
    ["fire_iron"] = "shoot2_iron",
    ["blind_fire"] = "blind_shoot1",
    ["reload"] = "reload_insert",
    ["reload_finish"] = "reload_end2",
    ["reload_start"] = "reload_start2",
    ["melee"] = "melee",
    ["dryfire"] = "shoot_noshot",
    ["jam"] = "unjam2",
}

SWEP.AnimationTranslationTable_Curved = {
    ["fire"] = "shoot1",
    ["fire_iron"] = "shoot1",
    ["reload_start"] = "reload_start1",
    ["reload_finish"] = "reload_end1",
    ["jam"] = "unjam",
}


SWEP.Hook_TranslateSequence = function(self, seq)
    if self.Attachments[1].Installed then
        return self.AnimationTranslationTable_Curved[seq]
    end
end

// attachments

SWEP.AttachmentElements = {
    ["scope1"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1},
        },
    },
    ["scope2"] = {
        BGs_VM = {
            {2, 2}
        },
        BGs_WM = {
            {2, 2},
        },
    },
    ["scope3"] = {
        BGs_VM = {
            {2, 3}
        },
        BGs_WM = {
            {2, 3},
        },
    },
    ["bayonet"] = {
        BGs_VM = {
            {4, 1}
        },
        BGs_WM = {
            {4, 1},
        },
    },
    ["bolt"] = {
        BGs_VM = {
            {3, 1}
        },
        BGs_WM = {
            {3, 1},
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_mosin",
        WMBone = "Bone02",
        Bone = "rifle",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        Pos_VM = Vector(0.05, 0, 2),
        Ang_VM = Angle(0, -90, 0),
        Pos_WM = Vector(0, 1.25, -5.6),
        Ang_WM = Angle(0, 0, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "muzz_mosin"},
        WMBone = "Bone02",
        Bone = "rifle",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.7,
        WMScale = 0.7,
        Pos_VM = Vector(-0.02, 27, 0.94),
        Pos_WM = Vector(25.5, 1.2, -4.9),
        Ang_VM = Angle(0, -90, 0),
        Ang_WM = Angle(0, 0, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom"},
        WMBone = "Bone02",
        Bone = "rifle",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(0.5, 11, 0.75),
        Pos_WM = Vector(8, 2, -4),
        Ang_VM = Angle(0, -90, -90),
        Ang_WM = Angle(0, 0, 90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling", "acc_duffle", "acc_bipod"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Trigger",
        Category = {"trigger_manual"},
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

addsound("tacint_mosin.Clip_Out", path1 .. "magout.wav")
addsound("tacint_mosin.Clip_In", path1 .. "magin.wav")
addsound("tacint_mosin.CockBack", path1 .. "boltback.wav")
addsound("tacint_mosin.CockForward", path1 .. "boltforward.wav")
addsound("tacint_mosin.safety", path1 .. "magrelease.wav")
addsound("tacint_mosin.InsertShell", path1 .. "roundinsert.wav")
addsound("tacint_mosin.bolt_up", path1 .. "boltlatch.wav")
addsound("tacint_mosin.bolt_down", path1 .. "boltrelease.wav")