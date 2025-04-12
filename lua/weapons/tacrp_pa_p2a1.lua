SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK P2A1"
SWEP.AbbrevName = "P2A1"
SWEP.Category = "Tactical RP (Special)"

SWEP.SubCatTier = "9Special"
SWEP.SubCatType = "7Special Weapon"

SWEP.Description = "Single-shot flare pistol for signaling and illumination use.\nStandard round has a weak incendiary explosion. Can load a variety of payloads, including some shotshell types."
SWEP.Description_Quote = ""

SWEP.ViewModel = "models/weapons/tacint_extras/v_p2a1.mdl"
SWEP.WorldModel = "models/weapons/tacint_extras/w_p2a1.mdl"

SWEP.Trivia_Caliber = "25mm Flares" // approx. 7.5 gauge
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "1974"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model/Texture: New World Interactive
Sound: Raising The Bar: Redux, speedonerd
Animation: 8Z
]]

SWEP.Slot = 1

SWEP.BalanceStats = {
}

// "ballistics"

SWEP.NoRanger = true
SWEP.Damage_Max = 50
SWEP.Damage_Min = 50
SWEP.Range_Min = 1000
SWEP.Range_Max = 1000
SWEP.Penetration = 1
SWEP.Num = 1
SWEP.ArmorPenetration = 0.5

SWEP.MuzzleVelocity = 7000

SWEP.ShootEnt = "tacrp_proj_p2a1_flare"
SWEP.ShootEntForce = 1200

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
}

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 90

SWEP.Spread = 0.005

SWEP.ShootTimeMult = 0.75

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.15
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 5
SWEP.RecoilKick = 3
SWEP.RecoilStability = 0.4

SWEP.RecoilSpreadPenalty = 0.01
SWEP.HipFireSpreadPenalty = 0.01
SWEP.MoveSpreadPenalty = 0
SWEP.MidAirSpreadPenalty = 0

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.85

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.2
SWEP.SprintToFireTime = 0.2

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.3

SWEP.FreeAimMaxAngle = 2

// hold types

SWEP.HoldType = "pistol"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, 0, 0)

SWEP.CustomizePos = Vector(5, 0, -1)

SWEP.BlindFireAng = Angle(0, 0, 0)
SWEP.BlindFirePos = Vector(0, 0, 2)

SWEP.BlindFireLeftAng = Angle(60, 0, 0)
SWEP.BlindFireLeftPos = Vector(14, 10, -10)

SWEP.BlindFireRightAng = Angle(-60, 0, 0)
SWEP.BlindFireRightPos = Vector(-10, 20, -11)

SWEP.BlindFireSuicideAng = Angle(260, 0, 5)
SWEP.BlindFireSuicidePos = Vector(42, 12, -4)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 0, -6)

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(-4.02, 0, 2.25)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)

// reload

SWEP.ClipSize = 1
SWEP.Ammo = "buckshot"

SWEP.ReloadTimeMult = 1.15
SWEP.ReloadUpInTime = 1.2

// sounds

local path = "tacint_extras/p2a1/"

SWEP.Sound_Shoot = "^" .. path .. "flaregun_fire_player_01.wav"

SWEP.Vol_Shoot = 100
SWEP.Pitch_Shoot = 111
SWEP.ShootPitchVariance = 0

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1

SWEP.MuzzleEffect = "muzzleflash_smg"

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
    ["deploy"] = "deploy",
    ["fire_iron"] = "fire",
    ["fire"] = "fire",
    ["blind_idle"] = "blind_idle",
    ["blind_fire"] = "blind_fire",
    ["melee"] = "melee1",
}

SWEP.AttachmentElements = {
}

SWEP.DeployTimeMult = 0.8

SWEP.LastShot = false
SWEP.NoIdle = true

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Ammo",
        Category = {"ammo_p2a1"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_holster", "acc_brace"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
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

addsound("tacint_p2a1.open", path .. "flaregun_chamber_open_01.wav")
addsound("tacint_p2a1.close", path .. "flaregun_chamber_close_01.wav")
addsound("tacint_p2a1.eject", path .. "flaregun_shell_out_01.wav")
addsound("tacint_p2a1.insert", path .. "flaregun_shell_load_01.wav")
addsound("tacint_p2a1.hammer", path .. "flaregun_hammer_cock_01.wav")
addsound("tacint_p2a1.draw", path .. "twirl1.wav")
addsound("tacint_p2a1.palm", "common/null.wav")