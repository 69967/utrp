SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "Mk 153 SMAW"
SWEP.AbbrevName = "SMAW"
SWEP.Category = "Tactical RP (Special)"

SWEP.SubCatTier = "9Special"
SWEP.SubCatType = "6Launcher"

SWEP.Description = "Man-portable bunker buster with slow, powerful rockets. Laser pointer allows rocket steering when toggled on. Can mount optics and has a built in Corner-Cam."
SWEP.Description_Quote = "\"Here's what I think of your best laid plans...\""

SWEP.Trivia_Caliber = "83mm Rockets"
SWEP.Trivia_Manufacturer = "Nammo Talley"
SWEP.Trivia_Year = "1984"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Assets: Call of Duty: Modern Warfare 3 (2011)
Animation: Tactical Intervention & speedonerd
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_smaw.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_smaw.mdl"

SWEP.NoRanger = true

SWEP.Slot = 2
SWEP.SlotAlt = 4

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
    },
    [TacRP.BALANCE_TTT] = {
    },
}

// "ballistics"

SWEP.Damage_Max = 250 // just to fool the ratings
SWEP.Damage_Min = 250
SWEP.Range_Max = 7000
SWEP.Range_Min = 4000

SWEP.ShootEnt = "tacrp_proj_smaw"
SWEP.ShootEntForce = 2000

SWEP.Num = 1

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Single-Shot" // only used externally for firemode name distinction

SWEP.RPM = 100

SWEP.Spread = 0.01

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 1
SWEP.RecoilResetTime = 0.2// time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 5
SWEP.RecoilVisualShake = 0.5

SWEP.RecoilKick = 0

SWEP.RecoilSpreadPenalty = 0 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

SWEP.Laser = true
SWEP.BlindFireCamera = true
SWEP.LaserPower = 4
SWEP.LaserQCAttachmentVM = 1
SWEP.LaserQCAttachmentWM = 1
SWEP.LaserAlwaysAccurate = true
SWEP.CanToggle = true
SWEP.TacticalName = "hint.tac.laser"

// handling

SWEP.MoveSpeedMult = 0.65
SWEP.ShootingSpeedMult = 0.25
SWEP.SightedSpeedMult = 0.45

SWEP.ReloadSpeedMult = 0.2

SWEP.AimDownSightsTime = 0.6
SWEP.SprintToFireTime = 0.8 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "rpg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "ar2"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(2, -2, -9)

SWEP.BlindFireAng = Angle(0, 0, 0)
SWEP.BlindFirePos = Vector(1, -3, 0)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireSuicideAng = Angle(0, 125, 0)
SWEP.BlindFireSuicidePos = Vector(-2, 25, -24)

SWEP.SprintAng = Angle(0, -20, 15)
SWEP.SprintPos = Vector(2, 0, -7)

SWEP.SightAng = Angle(-1.55, -0.5, 0)
SWEP.SightPos = Vector(-3.04, -8, -8.9)

SWEP.CorrectiveAng = Angle(1.4, -2, 0)
SWEP.CorrectivePos = Vector(0.45, 0, 0.23)

SWEP.CustomizeAng = Angle(45, 15, 0)
SWEP.CustomizePos = Vector(5, 2, -11)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_SPECIAL
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// sway

SWEP.Sway = 2
SWEP.ScopedSway = 0.2

SWEP.FreeAimMaxAngle = 10

// melee

SWEP.CanMeleeAttack = false

// reload

SWEP.ClipSize = 1
SWEP.Ammo = "rpg_round"

SWEP.ReloadTimeMult = 1.6
SWEP.DropMagazineImpact = "metal"
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/smaw.mdl"

SWEP.DropMagazineTime = 0.6

--SWEP.BulletBodygroups = {
  --  [1] = {5, 1}
--}

// sounds

local path = "TacRP/weapons/rpg7/"
local path1 = "Tacint_shark/smaw/"

SWEP.Sound_Shoot = "^" .. path1 .. "fire.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_1"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "draw",
    ["blind_fire"] = "aimed_fire",
    ["blind_idle"] = "aimed_idle",
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper"},
        WMBone = "ValveBiped.Bip01_R_Hand",
        Bone = "ValveBiped.RPG7_rootbone",
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 0.8,
        WMScale = 0.8,
        Pos_VM = Vector(-10.11, -2.2, 4.8),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(7.5, 3, -6.2),
        Ang_WM = Angle(0, -0, -180),
    },
    [2] = {
        PrintName = "Ammo",
        Category = {"ammo_smaw"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_duffle", "acc_sling"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Perk",
        Category = {"perk", "perk_shooting", "perk_reload"},
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

addsound("tacint_SMAW.jingle", path1 .. "lift.wav")
addsound("tacint_SMAW.insert_rocket", path1 .. "chamber.wav")
addsound("tacint_SMAW.unload", path1 .. "unload.wav")
addsound("tacint_SMAW.flipup_sight", path .. "flipup_sight.wav")

if engine.ActiveGamemode() == "terrortown" then
    SWEP.AutoSpawnable = false
    SWEP.Kind = WEAPON_EQUIP
    SWEP.Slot  = 6
    SWEP.CanBuy = { ROLE_TRAITOR }
    SWEP.LimitedStock = true
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Rocket launcher. Can't explode at point blank.\nComes with 2 rockets.\n\nBEWARE: May be visible while holstered!",
    }

    function SWEP:TTTBought(buyer)
        buyer:GiveAmmo(1, "RPG_Round")
    end
end

function SWEP:ShouldAutoReload()
    return false
end