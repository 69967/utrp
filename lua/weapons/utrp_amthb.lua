SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AMT Hardballer"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "3.45 ACP Pistols"

SWEP.Description = "Long-slide pistol with stainless steel construction. Accurate and hits hard at range."

SWEP.Trivia_Caliber = ".45 ACP"
SWEP.Trivia_Manufacturer = "Arcadia Machine & Tool."
SWEP.Trivia_Year = "1980"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Assets: Terminator: Resistance (port by Sirgibsalot)
Sounds: Navaro
Animation: Tactical Intervention
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_hardballer.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_hardballer.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 34
SWEP.Damage_Min = 15
SWEP.Range_Min = 3500
SWEP.Range_Max = 4750
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 0
SWEP.MuzzleVelocity = 31000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

SWEP.Firemode = 1
SWEP.RPM = 600
SWEP.ShootTimeMult = 0.5
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.005
SWEP.RecoilSpreadPenalty = 0.00235
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1.2
SWEP.RecoilMaximum = 20
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.45
SWEP.RecoilKick = 1.3
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.225
SWEP.SprintToFireTime = 0.225

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 5

SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_heavy"
SWEP.ClipSize = 7
SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.25
SWEP.ReloadTimeMult = 1

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(3, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 45)
SWEP.BlindFireSuicidePos = Vector(27, 17, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(5.05, 0.1, 0)
SWEP.SightPos = Vector(-2.35, 0, -3.6)

SWEP.CorrectivePos = Vector(-1.47, 0, 0)
SWEP.CorrectiveAng = Angle(-5, 5, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/hardballer.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

SWEP.Sound_Shoot = "1911_fire_close.wav"
SWEP.Sound_Shoot_Silenced = "hardballer_fire.wav"

SWEP.Vol_Shoot = 500
SWEP.ShootPitchVariance = 2.5

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = "sh_sshoot1",
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1"
}



SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.6),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "hammer",
            ang = Angle(-15, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.2,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

SWEP.LastShot = true

// attachments

SWEP.NoTactical = true

SWEP.AttachmentElements = {
    ["lazur"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"hardballer_laser"},
        Bone = "slide",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(0, 0, 0.4),
        Ang_VM = Angle(0, -90, 0),
        Pos_WM = Vector(0, -1, -1),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "lc_silencer",
        Bone = "barrel",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.6,
        WMScale = 0.6,
        Pos_VM = Vector(-0.6, 0, 10.3),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 11.85, -1.75),
        Ang_WM = Angle(0, -90, 0),
    },
	[3] = {
        PrintName = "Tactical",
        Category = "tactical_ebullet",
        Bone = "sphinx_ROOT",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-2, 0.1, 6.5),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5.5, -2.75),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Holster",
        Category = "acc_holster",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
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
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Accessory",
        Category = "acc_extmag_pistol2",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
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

addsound("tacint_hardballer.Clip_In", "amthb_mi.wav")
addsound("tacint_hardballer.Clip_Out", "amthb_mo.wav")
addsound("tacint_hardballer.Slide_Shut", "amthb_ss.wav")
addsound("tacint_hardballer.Slide_Back", "amthb_sb.wav")
addsound("tacint_hardballer.Slide_Forward", "amthb_sf.wav")