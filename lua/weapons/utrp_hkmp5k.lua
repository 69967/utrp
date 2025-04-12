SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK MP5K"
SWEP.AbbrevName = "MP5K"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "5Machine Pistol"

SWEP.Description = "Compact variant of the iconic SMG. Well-rounded but trades the precision and control of its full-size counterpart for improved handling."
SWEP.Description_Quote = "\"Guns. Lots of guns.\""

SWEP.Trivia_Caliber = "9x19mm"
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "1976"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model: Twinke Masta
Texture: Thanez
Animation: Tactical Intervention, edited by speedonerd
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_mp5k.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_mp5k.mdl"

SWEP.Slot = 1

// "ballistics"

SWEP.Damage_Max = 25
SWEP.Damage_Min = 10
SWEP.Range_Min = 4000
SWEP.Range_Max = 5500
SWEP.Penetration = 5
SWEP.ArmorPenetration = 0
SWEP.ArmorBonus = 1.2
SWEP.MuzzleVelocity = 33500

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

SWEP.Firemodes = {2, 1 }

SWEP.Firemode = 1
SWEP.RPM = 900
SWEP.RPMMultSemi = 0.7
SWEP.JamFactor = 0.0002

SWEP.Spread = 0.0025
SWEP.RecoilSpreadPenalty = 0.001
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0.00275

SWEP.ShootTimeMult = 0.5

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 30
SWEP.RecoilResetTime = 0.275
SWEP.RecoilDissipationRate = 50
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.3
SWEP.RecoilKick = 1.125
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

SWEP.HoldType = "crossbow"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -7)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -4, -3)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(8, -1, -5)

SWEP.SightAng = Angle(-0.05, 0.12, 0)
SWEP.SightPos = Vector(-4.6, -7.5, -3.2)

SWEP.CorrectivePos = Vector(0.025, 0, 0.1)
SWEP.CorrectiveAng = Angle(0, 0, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 25
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/mp5k.mdl"
SWEP.DropMagazineImpact = "plastic"

SWEP.ReloadUpInTime = 1.55
SWEP.DropMagazineTime = 1

// sounds

local path = "TacRP/weapons/mp5/mp5_"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_suppressed"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "dryfire",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire1_M",
    ["fire3"] = "fire1_M",
    ["fire4"] = "fire1_M",
    ["fire5"] = "fire1_M",
    ["melee"] = "melee2",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.25,
    tmax = 0.25,
}

SWEP.DeployTimeMult = 0.9

// attachments

SWEP.AttachmentElements = {
    ["optic"] = {
        BGs_VM = {
            {1, 1}
        },
    },
    ["tactical"] = {
        BGs_VM = {
            {2, 1}
        },
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb_nookp7", "optic_medium"},
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        InstalledElements = {"optic"},
        Pos_VM = Vector(-6.4, -0.3, 4.25),
        Pos_WM = Vector(7.5, 1.7, -7),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-4.3, -0.25, 17.25),
        Pos_WM = Vector(21.25, 2.5, -5.15),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -3.5, 180),
    },
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        Bone = "ValveBiped.mp5_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        Pos_VM = Vector(-4.75, 0.5, 9.75),
        Pos_WM = Vector(13.5, 1.2, -5),
        Ang_VM = Angle(90, 0, 75),
        Ang_WM = Angle(0, -3.5, -90),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_holster", "acc_duffle", "acc_extmag_smg"},
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
        Category = {"trigger_auto"},
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

addsound("tacint_mp5k.remove_clip", path .. "remove_clip.wav")
addsound("tacint_mp5k.insert_clip", path .. "insert_clip.wav")
addsound("tacint_mp5k.insert_clip-mid", path .. "insert_clip-mid.wav")
addsound("tacint_mp5k.HK_Slap", path .. "hk_slap.wav")
addsound("tacint_mp5k.bolt_back", path .. "bolt_back.wav")
addsound("tacint_mp5k.fire_select", {
    path .. "fire_select-1.wav",
    path .. "fire_select-2.wav",
    path .. "fire_select-3.wav",
})