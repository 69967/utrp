SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Inventar GyroJet"
SWEP.Category = "UTRP Handguns"

SWEP.SubCatType = "0Other Pistols"

SWEP.Description = "A rocket pistol.\n\n\n[for law enforcement use only.]"

SWEP.Trivia_Caliber = "12mm Minirockets"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model & Textures: RedRougeXIII
Sounds: speedonerd
Animations: Tactical Intervention, with additions from speedonerd
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_gyrojet.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_gyrojet.mdl"

SWEP.NoRanger = false

SWEP.Slot = 1

// "ballistics"
-- it speeds up and deals more damage, this is correct leave it alone
SWEP.Damage_Max = 50
SWEP.Damage_Min = 100

SWEP.Range_Min = 750
SWEP.Range_Max = 1000

SWEP.Penetration = 0
SWEP.ArmorPenetration = 2
SWEP.ArmorBonus = 50

SWEP.ShootEnt = "tacrp_proj_gyrojet"
SWEP.ShootEntForce = 990000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 0.75,
    [HITGROUP_RIGHTARM] = 0.75,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.75
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 400

SWEP.Spread = 0.00001

SWEP.ShootTimeMult = 0.25

SWEP.JamFactor = 0.01

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 4
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 4
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 1
SWEP.RecoilKick = 2
SWEP.RecoilSpreadPenalty = 0.01

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 0.9
SWEP.SightedSpeedMult = 0.9
SWEP.ReloadSpeedMult = 0.8

SWEP.AimDownSightsTime = 0.25
SWEP.SprintToFireTime = 0.25

SWEP.Sway = 0.33
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 1

// hold types

SWEP.HoldType = "pistol"
SWEP.HoldTypeSprint = "slam"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(-1, 0, -8)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-135, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 19, -5)

SWEP.SprintAng = Angle(0, -20, 0)
SWEP.SprintPos = Vector(-1, 0, -9)

SWEP.SightAng = Angle(0.06, -0.4, 0)
SWEP.SightPos = Vector(-3.35, 1, -4)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

SWEP.CorrectivePos = Vector(0, 0, 0)
SWEP.CorrectiveAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 8
SWEP.Ammo = "357"

SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1

// sounds

local path = "tacint_shark/weapons/gyrojet/"
local path1 = "tacrp/weapons/xd45/"

SWEP.Sound_Shoot = "^" .. path .. "fire.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

SWEP.EffectsAlternate = true
SWEP.EffectsDoubled = true

SWEP.QCA_MuzzleL = 1
SWEP.QCA_MuzzleR = 4
SWEP.QCA_EjectL = 2
SWEP.QCA_EjectR = 3

SWEP.EjectEffect = 0

SWEP.MuzzleEffect = "muzzleflash_suppressed"

// anims
// VM:
// idle
// fire
// fire1, fire2
// dryfire
// melee
// reload
// midreload
// prime_grenade
// throw_grenade
// throw_grenade_underhand
// deploy
// blind_idle
// blind_fire
// blind_fire1, blind_fire2...
// blind_dryfire

// WM:
// attack1
SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["fire"] = {"shoot1", "shoot2", "shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1.25, -0.6),
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
    },
}

SWEP.LastShot = false

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_holster", "acc_brace", "bolt_jammable"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Trigger",
        Category = {"trigger_semi"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Ammo",
        Category = {"ammo_gyrojet"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
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

addsound("tacint_gyrojet.clip_in", path1 .. "clip_in-1.wav")
addsound("tacint_gyrojet.clip_out", path1 .. "clip_out-1.wav")
addsound("tacint_gyrojet.clip_slap", path1 .. "clip_slap-1.wav")
addsound("tacint_gyrojet.slide_back", {
    path1 .. "slide_back-1.wav",
    path1 .. "slide_back-2.wav",
})
addsound("tacint_gyrojet.cock_hammer", path1 .. "cockhammer.wav")
addsound("tacint_gyrojet.safety_switch", path1 .. "safety_switch.wav")
addsound("tacint_gyrojet.insert",
    {
        path .. "gyrojet_insert1.wav",
        path .. "gyrojet_insert2.wav",
        path .. "gyrojet_insert3.wav",
    }
)

if engine.ActiveGamemode() == "terrortown" then
    SWEP.HolsterVisible = false
    SWEP.AutoSpawnable = false
    SWEP.Kind = WEAPON_PISTOL
    SWEP.CanBuy = { ROLE_TRAITOR, ROLE_DETECTIVE }
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "High damage pistol firing mini-rockets.\nUses standard magnum ammo.",
    }
end