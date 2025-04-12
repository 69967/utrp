SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AN-94"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "4Assault Rifle"

SWEP.Description = "Experimental assault rifle with a unique 2-round \"hyperburst.\" The rifle's complex mechanism affords low recoil but is very bulky."
SWEP.Description_Quote = "\"Antje\""

SWEP.Trivia_Caliber = "5.45x39mm"
SWEP.Trivia_Manufacturer = "Kalashnikov Concern"
SWEP.Trivia_Year = "1994"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Firearms: Source
Animation: Tactical Intervention]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_an94.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_an94.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 23,
        Damage_Min = 15,

        RecoilKick = 3,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 16,
        Damage_Min = 11,
        Range_Min = 400,
        Range_Max = 2000,

        RecoilSpreadPenalty = 0.0025,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2.5,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 8,
        Damage_Min = 4,
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        RecoilResetTime = 0.3,
        RecoilSpreadPenalty = 0.004
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.AssaultRifle

// "ballistics"

SWEP.Damage_Max = 24
SWEP.Damage_Min = 17
SWEP.Range_Min = 1100
SWEP.Range_Max = 3300
SWEP.Penetration = 7 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.725

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.85,
    [HITGROUP_RIGHTLEG] = 0.85,
    [HITGROUP_GEAR] = 0.9
}

SWEP.MuzzleVelocity = 25000

// misc. shooting

SWEP.Firemodes = {
    -2,
	2,
    1
}

SWEP.RPM = 600
SWEP.RPMMultBurst = 3

SWEP.PostBurstDelay = 0.25
SWEP.RunawayBurst = true

SWEP.Spread = 0.006

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 4
SWEP.RecoilResetTime = 0.12
SWEP.RecoilDissipationRate = 10
SWEP.RecoilFirstShotMult = 0.35 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 1
SWEP.RecoilKick = 2
SWEP.RecoilStability = 0.5
SWEP.RecoilAltMultiplier = 55

SWEP.RecoilSpreadPenalty = 0.006
SWEP.HipFireSpreadPenalty = 0.035

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.8
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.42
SWEP.SprintToFireTime = 0.45

SWEP.Sway = 1.3
SWEP.ScopedSway = 0.2

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -3, -4)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.03, -0.15, 0)
SWEP.SightPos = Vector(-4.66, -7.5, -2.45)

SWEP.CorrectivePos = Vector(0, 0, -0.05)
SWEP.CorrectiveAng = Angle(0.75, 0.7, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, -2, -6)
SWEP.HolsterAng = Angle(0, 0, 0)


SWEP.ClipSize = 30
SWEP.Ammo = "smg1"

SWEP.ReloadTimeMult = 1.05
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/aek.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.65
SWEP.DropMagazineTime = 0.65

SWEP.FreeAimMaxAngle = 4.5

// sounds

local path = "tacint_shark/weapons/an94/ak47_"

SWEP.Sound_Shoot = "tacint_shark/weapons/an94/an-94_fire.wav"
SWEP.Sound_Shoot_Silenced = path .. "suppressed_fire1.wav"

SWEP.Vol_Shoot = 120
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "deploy",
    ["fire_iron"] = "fire1_M",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = {"fire4_M", "fire4_L", "fire4_R"},
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "mid_reload"
}

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
    ["tactical"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["akmount"] = {
        BGs_VM = {
            {2, 0}
        },
        AttPosMods = {
            [1] = {
                Pos_VM = Vector(-5, 0.4, 3),
                Pos_WM = Vector(-0.4, 2, 0.5),
                VMScale = 1.2,
            }
        },
        SortOrder = 2,
    },
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.2),
    vm_ang = Angle(0, 0.25, 0),
    t = 0.25,
    tmax = 0.25,
    bones = {
        {
            bone = "ValveBiped.bolt",
            pos = Vector(0, 0, -3),
            t0 = 0.01,
            t1 = 0.12,
        },
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper", "optic_ak"},
        Bone = "ValveBiped.AK47_rootbone",
        WMBone = "Box01",
        InstalledElements = {"tactical"},
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        VMScale = 0.8,
        Pos_VM = Vector(-5.8, 0.2, 4),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 4.25, 0.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.bolt",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        VMScale = 0.85,
        WMScale = 0.85,
        Pos_VM = Vector(-0, 21.75, -1.45),
        Pos_WM = Vector(0, 29.5, -1.75),
        Ang_VM = Angle(90, -90, -90),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.AK47_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        Pos_VM = Vector(-2.25, -0, 22.25),
        Pos_WM = Vector(-0.15, 22, -3),
        Ang_VM = Angle(90, 0, 180),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_sling", "acc_duffle", "perk_extendedmag"},
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
        Category = {"trigger_4pos"},
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

addsound("tacint_an94.remove_clip", path .. "magout_empty.wav")
addsound("tacint_an94.insert_clip", path .. "magin.wav")
addsound("tacint_an94.boltaction", path .. "cock.wav")
addsound("tacint_an94.Buttstock_Back", "tacrp/weapons/ak47/ak47_buttstock_back.wav")