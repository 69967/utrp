SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "SIG 1911 GSR"
SWEP.AbbrevName = "SIG 1911"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "3.45 ACP Pistols"

SWEP.Description = "High damage pistol with low range and capacity.\nA tactical evolution, or some would call devolution, of a venerable classic."

SWEP.Trivia_Caliber = ".45 ACP"
SWEP.Trivia_Manufacturer = "SIG Sauer, Inc."
SWEP.Trivia_Year = "2004"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = "Assets: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint/v_gsr1911.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_gsr1911.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 34
SWEP.Damage_Min = 15
SWEP.Range_Min = 3250
SWEP.Range_Max = 4500
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 0
SWEP.MuzzleVelocity = 30000

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
SWEP.RecoilSpreadPenalty = 0.0025
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1.2
SWEP.RecoilMaximum = 20
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.5
SWEP.RecoilKick = 1.33
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

// hold types

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -6)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 45)
SWEP.BlindFireSuicidePos = Vector(27, 17, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(0, 0, -9)

SWEP.SightAng = Angle(0.04, -0.1, 0)
SWEP.SightPos = Vector(-3.3, 0, -3.7)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.Sway = 1
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 3.5

// reload

SWEP.ClipSize = 8
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_heavy"

SWEP.ReloadTimeMult = 1.05

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/gsr1911.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.2

// sounds

local path = "TacRP/weapons/gsr1911/gsr1911_"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.5, -0.6),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.hammer",
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

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = "optic_pistol",
        Bone = "ValveBiped.slide",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-0.05, 1.75, 0),
        Ang_VM = Angle(0, 90, 180),
        Pos_WM = Vector(0, -1, -0.85),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = {"silencer", "pistol_muzzle"},
        Bone = "ValveBiped.barrel",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        VMScale = 0.5,
        WMScale = 0.5,
        Pos_VM = Vector(-0.76, 0.7, 7.35),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 9.25, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.GSR1911_rootbone",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        VMScale = 1.1,
        WMScale = 1.3,
        Pos_VM = Vector(-1.7, 0, 6),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 5, -3),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol2", "acc_holster", "acc_brace"},
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

addsound("TacInt_GSR1911.clip_in", path .. "clip_in.wav")
addsound("TacInt_GSR1911.clip_in-mid", path .. "clip_in-mid.wav")
addsound("TacInt_GSR1911.clip_out", path .. "clip_out.wav")
addsound("TacInt_GSR1911.slide_action", path .. "slide_action.wav")
addsound("TacInt_GSR1911.slide_shut", path .. "slide_shut.wav")
addsound("TacInt_GSR1911.cock_hammer", path .. "cockhammer.wav")
