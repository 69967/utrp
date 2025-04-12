SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AWC Amphibian Ruger"
SWEP.AbbrevName = "Amphibian"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "Small caliber pistol fitted with an integrated suppressor. Near-zero recoil due to weak rounds."
SWEP.Description_Quote = "\"Take comfort in knowing you never had a choice.\""

SWEP.Trivia_Caliber = ".22 LR"
SWEP.Trivia_Manufacturer = "Sturm, Ruger & Co."
SWEP.Trivia_Year = "1982"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Model: The Lama
Texture: The Miller
Animation: Tactical Intervention
]]

// https://gamebanana.com/mods/214299
SWEP.ViewModel = "models/weapons/tacint_extras/v_ruger.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_ruger.mdl"

SWEP.Slot = 1


// "ballistics"

SWEP.Damage_Max = 20
SWEP.Damage_Min = 5
SWEP.Range_Min = 3500
SWEP.Range_Max = 4500
SWEP.Penetration = 1
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 0

SWEP.MuzzleVelocity = 35000

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

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 500
SWEP.RPMMultSemi = 1

SWEP.Spread = 0.004
SWEP.RecoilSpreadPenalty = 0.001
SWEP.HipFireSpreadPenalty = 0.025
SWEP.MoveSpreadPenalty = 0.0033

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 20
SWEP.RecoilResetTime = 0.33
SWEP.RecoilDissipationRate = 100
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.2
SWEP.RecoilKick = 0.3
SWEP.RecoilStability = 0

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.65

SWEP.AimDownSightsTime = 0.2
SWEP.SprintToFireTime = 0.2

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.2
SWEP.FreeAimMaxAngle = 3

// reload

SWEP.ClipSize = 10
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_light"

SWEP.ReloadTimeMult = 1

SWEP.HoldType = "slam"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -6.25)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-130, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 15, -6)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(2, 0, -8)

SWEP.SightAng = Angle(-0.025, 0, 0)
SWEP.SightPos = Vector(-3.34, 0, -3.52)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.DropMagazineModel = "models/weapons/tacint_extras/magazines/ruger.mdl"
SWEP.DropMagazineImpact = "pistol"

SWEP.ReloadUpInTime = 0.75
SWEP.DropMagazineTime = 0.2

// sounds

local path = "tacrp/weapons/p2000/p2000_"
local path1 = "tacint_extras/ruger/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path1 .. "fiveseven-1.wav"

SWEP.Silencer = true

SWEP.Vol_Shoot = 70
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 3
SWEP.EjectScale = 0.7

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.DeployTimeMult = 1
SWEP.HolsterTimeMult = 1

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = "sshoot1",
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = "melee1"
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.2, -0.2),
    vm_ang = Angle(0, 0.5, 0),
    t = 0.15,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.15,
        },
        {
            bone = "ValveBiped.hammer",
            ang = Angle(-15, 0, 0),
            t0 = 0,
            t1 = 0.125,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

SWEP.NoIdle = true

SWEP.ShootTimeMult = 0.5

SWEP.LastShot = true

// attachments
SWEP.AttachmentElements = {
    ["irons"] = {
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
        Category = "optic_pistol",
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/optic_on.wav",
        DetachSound = "tacrp/weapons/optic_off.wav",
        InstalledElements = {"irons"},
        VMScale = 1,
        WMScale = 1,
        Pos_VM = Vector(-3.5, -0.18, -0.25),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, -2, -1.15),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "barrel",
        Bone = "ValveBiped.barrel_assembly",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/silencer_on.wav",
        DetachSound = "tacrp/weapons/silencer_off.wav",
        Pos_VM = Vector(-0.5, 0.39, 6),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(0, 8, -1.5),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.p2000_rootbone",
        WMBone = "Box01",
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
        VMScale = 1,
        WMScale = 1.3,
        Pos_VM = Vector(-2.6, 0, 10),
        Ang_VM = Angle(90, 0, 180),
        Pos_WM = Vector(0, 7, -2),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Holster",
        Category = "acc_holster",
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
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Accessory",
        Category = "acc_extmag_pistol",
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

addsound("tacint_extras_ruger.clip_in", path1 .. "fiveseven_clipin.wav")
addsound("tacint_extras_ruger.clip_in-mid", path .. "clip_in-mid.wav")
addsound("tacint_extras_ruger.clip_out", path1 .. "fiveseven_clipout.wav")
addsound("tacint_extras_ruger.slide_action", path1 .. "fiveseven_slidepull.wav")
addsound("tacint_extras_ruger.slide_shut", path1 .. "fiveseven_sliderelease.wav")
addsound("tacint_extras_ruger.cock_hammer", path .. "cockhammer.wav")
