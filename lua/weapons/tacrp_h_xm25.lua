SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "HK XM25 CDTE"
SWEP.AbbrevName = "XM25"
SWEP.Category = "Tactical RP (Special)"

SWEP.SubCatTier = "9Special"
SWEP.SubCatType = "6Launcher"

SWEP.Description = "Bullpup grenade launcher with an integrated rangefinder scope, good for medium range suppression. High rate of fire but grenades are fairly slow and weak."
SWEP.Trivia_Caliber = "25x40mm"
SWEP.Trivia_Manufacturer = "Heckler & Koch"
SWEP.Trivia_Year = "2010"

SWEP.Faction = TacRP.FACTION_COALITION
SWEP.Credits = [[
Assets: Call of Duty: Modern Warfare 3 (2011)
Animation: Tactical Intervention, edited by speedonerd
]]

SWEP.ViewModel = "models/weapons/tacint_shark/v_xm25.mdl"
SWEP.WorldModel = "models/weapons/tacint_shark/w_xm25.mdl"

SWEP.NoRanger = true

SWEP.Slot = 4
SWEP.SlotAlt = 4

SWEP.BalanceStats = {
    [TacRP.BALANCE_TTT] = {
        RPM = 75,
    },
}

// "ballistics"

SWEP.ShootEnt = "tacrp_proj_25mm_he"
SWEP.ShootEntForce = 3000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}


SWEP.Damage_Max = 100 // just to fool the ratings
SWEP.Damage_Min = 100
SWEP.Range_Max = 5000
SWEP.Range_Min = 2000

SWEP.MuzzleVelocity = 3000

SWEP.Num = 1

// misc. shooting

SWEP.Firemode = 1

SWEP.RPM = 120

SWEP.Spread = 0.01

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 2
SWEP.RecoilResetTime = 0.2
SWEP.RecoilDissipationRate = 3
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 3

SWEP.RecoilKick = 8

SWEP.RecoilSpreadPenalty = 0.03
SWEP.HipFireSpreadPenalty = 0.08
SWEP.PeekPenaltyFraction = 0.25
SWEP.RecoilStability = 0.3

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.75
SWEP.ShootingSpeedMult = 0.5
SWEP.SightedSpeedMult = 0.5

SWEP.ReloadSpeedMult = 0.25

SWEP.AimDownSightsTime = 0.42
SWEP.SprintToFireTime = 0.45

SWEP.Sway = 2
SWEP.ScopedSway = 0.3

SWEP.FreeAimMaxAngle = 7

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.PassiveAng = Angle(0, 5, 0)
SWEP.PassivePos = Vector(0, -3, -7)

SWEP.BlindFireAng = Angle(0, 0, -30)
SWEP.BlindFirePos = Vector(1, -3, 0)

SWEP.BlindFireLeftAng = Angle(75, 0, 0)
SWEP.BlindFireLeftPos = Vector(8, 10, -6)

SWEP.BlindFireSuicideAng = Angle(0, 135, 0)
SWEP.BlindFireSuicidePos = Vector(-3, 25, -19)

SWEP.SprintAng = Angle(40, -15, 0)
SWEP.SprintPos = Vector(4, 0, -4)

SWEP.SightAng = Angle(-0.7, 2, 2)
SWEP.SightPos = Vector(-3.8, -3, -5.5)

SWEP.CustomizeAng = Angle(35, 12, 0)
SWEP.CustomizePos = Vector(4, 0, -8)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.25

// scope

SWEP.Scope = true
SWEP.ScopeOverlay = Material("tacrp/scopes/scopexm25.png", "mips smooth") // Material("path/to/overlay")
SWEP.ScopeFOV = 90 / 2
SWEP.ScopeLevels = 1 // 2 = like CS:S
SWEP.ScopeHideWeapon = true

// melee

SWEP.CanMeleeAttack = true

// reload

SWEP.ClipSize = 5
SWEP.Ammo = "smg1_grenade"

SWEP.ReloadTimeMult = 1.7
SWEP.DropMagazineModel = "models/weapons/tacint_shark/magazines/xm25.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.DropMagazineTime = 0.8

SWEP.ReloadUpInTime = 2

// sounds

local path = "tacint_shark/xm25/"

SWEP.Sound_Shoot = "^" .. path .. "fire.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 105
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 0

SWEP.MuzzleEffect = "muzzleflash_m79"

// anims

SWEP.AnimationTranslationTable = {
    ["deploy"] = "unholster",
    ["fire"] = "fire1_M",
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = {"melee1", "melee2"},
    ["reload"] = "reload",
}

SWEP.DeployTimeMult = 2.25

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Ammo",
        Category = "ammo_25mm",
        AttachSound = "TacRP/weapons/m320/shell_in-1.wav",
        DetachSound = "TacRP/weapons/m320/shell_out-1.wav",
    },
    [2] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_sling"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Perk",
        Category = {"perk", "perk_shooting", "perk_reload", "perk_melee"},
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

addsound("tacint_xm25.Remove_Clip", path .. "magout.wav")
addsound("tacint_xm25.Insert_Clip", path .. "magin.wav")
addsound("tacint_xm25.Bolt_LockBack", path .. "bolt.wav")

SWEP.AutoSpawnable = false
if engine.ActiveGamemode() == "terrortown" then
    SWEP.HolsterVisible = false
    SWEP.Kind = WEAPON_RPG
    SWEP.CanBuy = { ROLE_TRAITOR, ROLE_DETECTIVE }
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Magazine-fed grenade launcher. Low muzzle velocity but high fire rate.",
    }
end

local last_laze_time = 0
local laze_interval = 0.2
local ccip_v = 0
local ccip_t = 0
local ccip_visible = false
local dropalpha = 0
local dropalpha2 = 0

local lastrangefinder = 0
local rftime = 1 / 10
local rawdist = 0
function SWEP.TacticalDraw(self)
    local txt = "NO RTN"
    local txt2 = ""

    if !self:IsInScope() or self:GetReloading() then return end

    if lastrangefinder + rftime < CurTime() then
        local tr = util.TraceLine({
            start = self:GetMuzzleOrigin(),
            endpos = self:GetMuzzleOrigin() + (self:GetShootDir():Forward() * 50000),
            mask = MASK_SHOT,
            filter = self:GetOwner()
        })

        rawdist = (tr.HitPos - tr.StartPos):Length()
        local dist
        if TacRP.ConVars["metricunit"]:GetBool() then
            dist = math.min(math.Round(rawdist * TacRP.HUToM, 0), 99999)
            txt = tostring(dist) .. "m"
        else
            dist = math.min(math.Round(rawdist, 0), 99999)
            txt = tostring(dist) .. "HU"
        end

        txt2 = ccip_t and (tostring(math.Round(ccip_t, 2)) .. "s") or ""

        local edmg = self:GetDamageAtRange(rawdist)
        edmg = math.ceil(edmg)

        cached_txt = txt
        cached_txt2 = txt2
        lastrangefinder = CurTime()
    else
        txt = cached_txt
        txt2 = cached_txt2
    end

    local scrw = ScrW()
    local scrh = ScrH()

    local w = TacRP.SS(100)
    local h = TacRP.SS(50)

    local x = (scrw - w) * 0.4
    local y = (scrh - h) * 0.4

    surface.SetFont("TacRP_HD44780A00_5x8_10")

    surface.SetTextColor(0, 0, 0, 200)
    surface.SetTextPos(x + TacRP.SS(3) + 2, y + TacRP.SS(12) + 2)
    surface.DrawText(txt)
    surface.SetTextPos(x + TacRP.SS(3) + 2, y + TacRP.SS(22) + 2)
    surface.DrawText(txt2)

    surface.SetTextColor(255, 255, 255)
    surface.SetTextPos(x + TacRP.SS(3), y + TacRP.SS(12))
    surface.DrawText(txt)
    surface.SetTextPos(x + TacRP.SS(3), y + TacRP.SS(22))
    surface.DrawText(txt2)

end

function SWEP.TacticalCrosshair(self, x, y, spread, sway)

    if self:IsInScope() and (self:GetValue("ScopeOverlay") or !self:GetReloading()) then
        dropalpha = math.Approach(dropalpha, self:GetSightAmount() ^ 2, FrameTime() * 1)
        dropalpha2 = math.Approach(dropalpha2, dropalpha, FrameTime() * 1)
    else
        dropalpha = math.Approach(dropalpha, 0, FrameTime() * 10)
        dropalpha2 = dropalpha
    end
    if dropalpha == 0 then return end

    if last_laze_time + laze_interval <= CurTime() then
        last_laze_time = CurTime()
        local ccip, t, steps = self:GetCCIP()
        ccip_t = t

        if !ccip then
            ccip_v = 0
        else
            ccip_visible = 1
            for i, v in ipairs(steps) do
                local tr_vis = util.TraceLine({
                    start = self:GetMuzzleOrigin(),
                    endpos = v,
                    filter = self:GetOwner(),
                    mask = MASK_VISIBLE,
                })
                if tr_vis.Fraction < 0.99 then
                    ccip_visible = i / #steps
                else
                    break
                end
            end

            local fov = LocalPlayer():GetFOV()
            local true_hitpos = TacRP.FormatViewModelAttachment(fov, ccip.HitPos, false)

            cam.Start3D()
                local hit = true_hitpos:ToScreen()
            cam.End3D()
            ccip_v = hit.y - y
        end
    end

    local dots = math.Round((ccip_v - 4) / 4)
    for i = 1, dots do
        if ccip_visible < 1 and i / dots > 1 - ccip_visible then
            surface.DrawCircle(x, y + i * 4, 1, 150, 150, 150, dropalpha2 * 50)
        else
            surface.DrawCircle(x, y + i * 4, 1, 255, 255, 255, dropalpha2 * 75)
        end
    end
    if ccip_visible == 1 then
        surface.SetDrawColor(255, 255, 255, dropalpha2 * 150)
        surface.DrawLine(x - 7, y - 7 + ccip_v, x + 7, y + 7 + ccip_v)
        surface.DrawLine(x - 7, y + 7 + ccip_v, x + 7, y - 7 + ccip_v)
    else
        surface.DrawCircle(x, y + ccip_v, 16, 150, 150, 150, dropalpha2 * 75)
        surface.DrawCircle(x, y + ccip_v, 16 + 2, 150, 150, 150, dropalpha2 * 75)
    end
end
SWEP.TacticalCrosshairTruePos = true