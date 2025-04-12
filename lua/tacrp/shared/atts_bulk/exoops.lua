-- exoops.lua

local ATT = {}

-- ACR 6.5 Grendel conversion
ATT = {}

ATT.PrintName = "Grendel"
ATT.FullName = "ACR 6.5mm Grendel Mod Kit"
ATT.Icon = Material("entities/tacrp_att_ammo_grendel.png", "mips smooth")
ATT.Description = "Modification to load ammo with improved ballistics."
ATT.Pros = {"rating.range", "rating.control", "stat.muzzlevelocity"}
ATT.Cons = {"stat.damage_max"}

ATT.Category = "ammo_masada"
ATT.SortOrder = 0.5

ATT.Mult_Damage_Max = 22 / 25
ATT.Mult_Damage_Min = 1
ATT.Mult_Range_Min = 1.25
ATT.Mult_Range_Max = 1.25

ATT.Add_RecoilKick = -1
ATT.Mult_RecoilSpreadPenalty = 0.85
ATT.Mult_MuzzleVelocity = 1.1


ATT.Override_Sound_Shoot = "^tacint_shark/weapons/masada/65_unsil.wav"
ATT.Override_Sound_Shoot_Silenced = "^tacint_shark/weapons/masada/65_sil.wav"

TacRP.LoadAtt(ATT, "ammo_modular_65gren")

-- ACR 6.5 Grendel conversion
ATT = {}

ATT.PrintName = "Bushmaster"
ATT.FullName = "ACR .450 Bushmaster Mod Kit"
ATT.Icon = Material("entities/tacrp_att_ammo_450bm.png", "mips smooth")
ATT.Description = "Modification to load low capacity, high power magnum rounds."
ATT.Pros = {"rating.lethality"}
ATT.Cons = {"rating.range", "rating.control", "att.procon.armor"}

ATT.Category = "ammo_masada"
ATT.SortOrder = 0.6

ATT.Mult_Damage_Max = 1.6
ATT.Mult_Damage_Min = 1.6
ATT.Mult_Range_Min = 0.25
ATT.Mult_Range_Max = 0.5

ATT.Mult_Penetration = 0.25
ATT.Add_ArmorPenetration = -0.1
ATT.Mult_ArmorBonus = 0.75

ATT.Override_RPM = 400
ATT.Mult_ClipSize = 1 / 3

ATT.Add_RecoilKick = 6
ATT.Mult_RecoilSpreadPenalty = 2.5
ATT.Add_RecoilResetTime = 0.075
ATT.Mult_MuzzleVelocity = 0.6
ATT.Add_RecoilPerShot = 0.4

ATT.Mult_ShootTimeMult = 1.5
ATT.Add_Pitch_Shoot = 5
ATT.Override_Sound_Shoot = "^tacint_shark/weapons/masada/fire_beo.ogg"
ATT.Override_Sound_Shoot_Silenced = "^tacint_shark/weapons/masada/fire_beo-supp.ogg"

TacRP.LoadAtt(ATT, "ammo_modular_450bm")

--SPAS-15 pump-action mode
ATT = {}

ATT.PrintName = "Pump"
ATT.FullName = "Pump-Action"
ATT.Icon = Material("entities/tacrp_att_bolt_light.png", "mips smooth")
ATT.Description = "Switch to pump-action operation, sacrificing fire-rate for improved control."
ATT.Pros = {"stat.damage_max", "stat.spread", "stat.muzzlevelocity", "stat.shootingspeed"}
ATT.Cons = {"stat.rpm"}
ATT.Ignore = false

ATT.Category = "bolt_pump"

ATT.SortOrder = 0

ATT.Add_Damage_Max = 2

ATT.Mult_RPM = 0.35
ATT.Mult_ShootTimeMult = 0.9

ATT.Mult_MuzzleVelocity = 1.15
ATT.Mult_Spread = 0.6

ATT.Mult_ShootingSpeedMult = 1.15

ATT.Override_EjectDelay = 0.45
ATT.Override_Sound_Shoot = "^tacint_shark/weapons/spas15/fire_pump.wav"

ATT.Override_LastShot = false

ATT.Hook_TranslateSequence = function(self, seq)
    if seq == "fire1" then
        return {"fire_pump"}
    elseif seq == "blind_fire1" then
        return {"fire_pump"}
    elseif seq == "fire_iron" then
        return {"fire_pump"}
    end
end

ATT.Free = true

TacRP.LoadAtt(ATT, "bolt_spas15_pump")

--Mk 22 Slide Lock
ATT = {}

ATT.PrintName = "Slide Lock"
ATT.FullName = "Mk 22 Slide Lock"
ATT.Icon = Material("entities/tacrp_att_bolt_light.png", "mips smooth")
ATT.Description = "Locks the slide in place when firing to further reduce noise."
ATT.Pros = {"stat.damage", "rating.precision", "stat.muzzlevelocity", "stat.range"}
ATT.Cons = {"stat.rpm"}
ATT.Ignore = false

ATT.Category = "trigger_mk22"

ATT.SortOrder = 0

ATT.Add_Damage_Max = 5
ATT.Add_Damage_Min = 5

ATT.Mult_Spread = 0.5
ATT.Mult_HipFireSpreadPenalty = 0.75
ATT.Mult_MoveSpreadPenalty = 0.25
ATT.Override_RPM = 80
ATT.Override_RPMMultSemi = 1
ATT.Override_ShootTimeMult = 0.55

ATT.Add_Range_Min = 500
ATT.Add_Range_Max = 500

ATT.Mult_MuzzleVelocity = 1.15

ATT.Override_EjectDelay = 0.6

ATT.Override_TracerNum = 0
ATT.Mult_Vol_Shoot = 0.75

ATT.Override_ProceduralIronFire = false

ATT.Hook_TranslateSequence = function(self, seq)
    if seq == "fire" then
        return {"shoot_locked"}
    elseif seq == "lastshot" then
        return {"shoot_locked_lastshot"}
    elseif seq == "blind_fire" then
        return {"blind_shoot_locked"}
    elseif seq == "blind_lastshot" then
        return {"blind_shoot_locked_last"}
    end
end

ATT.Free = true

TacRP.LoadAtt(ATT, "trigger_mk22_locked")

-- Howa Scope
ATT = {}

ATT.PrintName = "Scope"
ATT.FullName = "Howa 2.2x DMR Scope"
ATT.Icon = Material("entities/tacrp_att_optic_howa.png", "mips smooth")
ATT.Description = "Proprietary marksman scope for the Type 64."
ATT.Pros = {"att.zoom.2.2"}
ATT.Cons = {"stat.aimdownsights"}

ATT.Category = "optic_howa"

ATT.SortOrder = 0

ATT.Override_Scope = true
ATT.Override_ScopeHideWeapon = true
ATT.Override_ScopeOverlay = Material("tacrp/scopes/shortdot.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 2.2

ATT.Add_AimDownSightsTime = 0.03

ATT.InstalledElements = {"scope"}

if engine.ActiveGamemode() == "terrortown" then
    ATT.Free = true
end

TacRP.LoadAtt(ATT, "optic_howa_scope")

-- L85 refurbished bolt
-- sorry i secretly like the l85 and want to run it with no jams

ATT = {}
ATT.PrintName = "att.bolt_refurbished.name"
ATT.FullName = "att.bolt_refurbished.name.full"
ATT.Icon = Material("entities/tacrp_att_bolt_refurbished.png", "mips smooth")
ATT.Description = "att.bolt_refurbished.desc"
ATT.Pros = {"att.procon.reliability"}
ATT.Cons = {"stat.rpm", "stat.spread"}

ATT.Category = "bolt_l85"
ATT.InvAtt = "bolt_refurbished"

ATT.SortOrder = 10

ATT.Mult_RPM = 700 / 750
ATT.Add_Spread = 0.004
ATT.Override_JamFactor = 0

TacRP.LoadAtt(ATT, "bolt_l85")

-- G36C Scope

ATT = {}
ATT.PrintName = "Int. Scope"
ATT.FullName = "G36C Integrated Scope"
ATT.Icon = Material("entities/tacrp_att_optic_g36c_scope.png", "mips smooth")
ATT.Description = "Low power integrated scope and carry handle for the G36C."
ATT.Pros = {"att.zoom.2"}

ATT.Category = "optic_g36c"

ATT.SortOrder = 2

ATT.Override_ScopeOverlay = Material("tacrp/scopes/g36.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 2
ATT.Override_ScopeHideWeapon = true

ATT.InstalledElements = {"scope"}


TacRP.LoadAtt(ATT, "optic_g36c_scope")

-- Scout .376 Steyr Ammo
ATT = {}

ATT.PrintName = ".376 Steyr"
ATT.FullName = "Scout .376 Steyr Mod Kit"
ATT.Icon = Material("entities/tacrp_att_ammo_376steyr.png", "mips smooth")
ATT.Description = "Modification to load a unique high-power hunting cartridge."
ATT.Pros = {"rating.lethality", "stat.muzzlevelocity"}
ATT.Cons = {"stat.clipsize", "stat.rpm", "stat.recoilkick"}

ATT.Category = "ammo_scout"
ATT.SortOrder = 0.5

ATT.InstalledElements = {"50beo"}

ATT.Add_ClipSize = -4

ATT.Mult_Damage_Max = 1.5
ATT.Mult_Damage_Min = 1.5

ATT.Mult_RPM = 1 / 1.6
ATT.Mult_ShootTimeMult = 1.6

ATT.Add_RecoilKick = 15
ATT.Mult_MuzzleVelocity = 1.1

ATT.Override_Ammo = "357"
ATT.Override_Ammo_Expanded = "ti_sniper"

ATT.Override_Sound_Shoot = "tacint_extras/scout/scout_fire-1-magnum.wav"
ATT.Add_Pitch_Shoot = 10

TacRP.LoadAtt(ATT, "ammo_scout_376")

ATT = {}

ATT.PrintName = "att.muzz_pistol_comp.name"
ATT.Icon = Material("entities/tacrp_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "att.muzz_pistol_comp.desc"
ATT.Pros = {"stat.recoil", "stat.spread", "stat.range_min"}
ATT.Cons = {"stat.rpm"}

ATT.Model = "models/weapons/tacint/addons/pistol_comp.mdl"
ATT.Scale = 2
ATT.ModelOffset = Vector(-18, 0, -3.8)

ATT.Category = "muzzle_megastar"
ATT.InvAtt = "muzz_pistol_comp"

ATT.SortOrder = 1

ATT.Mult_RecoilKick = 0.5
ATT.Mult_RPM = 0.9
ATT.Mult_Spread = 0.75
ATT.Mult_Range_Min = 1.5

TacRP.LoadAtt(ATT, "muzz_megastar_comp")