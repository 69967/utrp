SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "M202 FLASH"
SWEP.Category = "Tactical RP (Special)"

SWEP.SubCatTier = "9Special"
SWEP.SubCatType = "6Launcher"

SWEP.Description = "Incendiary rocket launcher. Fires four thermobaric rockets in quick succession, which can ignite targets but have low explosive power."
SWEP.Description_Quote = "\"Fire and forget!\""

SWEP.Trivia_Caliber = "66mm Rockets"
SWEP.Trivia_Manufacturer = "Northrop Electro-Mechanical Division"
SWEP.Trivia_Year = "1978"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = "Assets: Tactical Intervention"

SWEP.ViewModel = "models/weapons/tacint/v_m202.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_m202.mdl"

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

SWEP.Damage_Max = 60 // just to fool the ratings
SWEP.Damage_Min = 60
SWEP.Range_Max = 5000
SWEP.Range_Min = 3000

SWEP.ShootEnt = "tacrp_proj_m202"
SWEP.ShootEntForce = 7500

SWEP.NotShotgun = true

SWEP.Num = 1

// misc. shooting

SWEP.Firemode = 2

SWEP.RPM = 300

SWEP.Spread = 0.005

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.3 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 6
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.NeverAltRecoil = true

SWEP.RecoilVisualKick = 5
SWEP.RecoilVisualShake = 0.2

SWEP.RecoilKick = 0.5

SWEP.RecoilSpreadPenalty = 0.015 // extra spread per one unit of recoil

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.75
SWEP.ShootingSpeedMult = 0.25
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.2

SWEP.AimDownSightsTime = 0.95
SWEP.SprintToFireTime = 0.95 // multiplies how long it takes to recover from sprinting

// hold types

SWEP.HoldType = "rpg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "ar2"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(4, 0, -6)

SWEP.BlindFireAng = Angle(0, 0, 0)
SWEP.BlindFirePos = Vector(1, -3, 2)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireRightAng = Angle(-75, 0, 0)
SWEP.BlindFireRightPos = Vector(-8, 10, -12)

SWEP.BlindFireSuicideAng = Angle(0, 125, 0)
SWEP.BlindFireSuicidePos = Vector(-2, 25, -24)

SWEP.SprintAng = Angle(40, -15, 0)
SWEP.SprintPos = Vector(4, 0, -8)

SWEP.SightAng = Angle(0, 0, 0)
SWEP.SightPos = Vector(2.58, -6.5, -8.73)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_SPECIAL
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

SWEP.CanBlindFire = false

// sway

SWEP.Sway = 3
SWEP.ScopedSway = 0.25

SWEP.FreeAimMaxAngle = 10

// melee

SWEP.CanMeleeAttack = false

// reload

SWEP.ClipSize = 4
SWEP.Ammo = "rpg_round"

// sounds

local path = "TacRP/weapons/rpg7/"

SWEP.Sound_Shoot = {
    "^tacint_extras/m202/fire1.wav",
    "^tacint_extras/m202/fire2.wav",
    "^tacint_extras/m202/fire3.wav",
    "^tacint_extras/m202/fire4.wav"
}

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
    ["deploy"] = "unholster",
    ["blind_fire"] = "aimed_fire",
    ["blind_idle"] = "aimed_idle",
}

SWEP.DeployTimeMult = 2

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Ammo",
        Category = {"ammo_m202"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_duffle", "acc_sling"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
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

addsound("TacInt_rpg7.jingle", path .. "handling-1.wav")
addsound("TacInt_rpg7.insert_rocket", path .. "insert_rocket.wav")
addsound("TacInt_rpg7.flipup_sight", path .. "flipup_sight.wav")

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