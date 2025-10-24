-- muzz.lua

local ATT = {}

------------------------------
-- #region muzz_comp_mac10
------------------------------
ATT = {}

ATT.PrintName = "att.muzz_pistol_comp.name"
ATT.Icon = Material("entities/tacrp_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "att.muzz_pistol_comp.desc"
ATT.Pros = {"stat.recoil", "stat.spread", "stat.range"}
ATT.Cons = {"stat.rpm"}

ATT.Category = "comp_mac10"
ATT.InvAtt = "muzz_pistol_comp"
ATT.SortOrder = 1

ATT.Mult_RecoilKick = 0.75
ATT.Mult_RPM = 0.8
ATT.Mult_RecoilSpreadPenalty = 0.65
ATT.Mult_Spread = 0.5
ATT.Mult_Range_Max = 1.5
ATT.Mult_Range_Min = 1.5

ATT.InstalledElements = {"pistol_comp"}

TacRP.LoadAtt(ATT, "muzz_comp_mac10")
-- #endregion

------------------------------
-- #region muzz_comp_usp
------------------------------
ATT = {}

ATT.PrintName = "att.muzz_pistol_comp.name"
ATT.Icon = Material("entities/tacrp_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "att.muzz_pistol_comp.desc"
ATT.Pros = {"stat.recoil", "stat.spread", "stat.range_min"}
ATT.Cons = {"stat.rpm"}

ATT.Category = "comp_usp"
ATT.InvAtt = "muzz_pistol_comp"
ATT.SortOrder = 1

ATT.Mult_RecoilKick = 0.5
ATT.Mult_RPM = 0.9
ATT.Mult_Spread = 0.75
ATT.Mult_Range_Min = 1.5

ATT.InstalledElements = {"pistol_comp"}

TacRP.LoadAtt(ATT, "muzz_comp_usp")
-- #endregion


------------------------------
-- #region muzz_pistol_comp
------------------------------
ATT = {}

ATT.PrintName = "att.muzz_pistol_comp.name"
ATT.Icon = Material("entities/tacrp_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "att.muzz_pistol_comp.desc"
ATT.Pros = {"stat.recoil", "stat.spread", "stat.range_min"}
ATT.Cons = {"stat.rpm"}

ATT.Model = "models/weapons/tacint/addons/pistol_comp.mdl"
ATT.Scale = 2
ATT.ModelOffset = Vector(-17.75, 0, -3.5)

ATT.Category = "pistol_muzzle"

ATT.SortOrder = 1

ATT.Mult_RecoilKick = 0.5
ATT.Mult_RPM = 0.9
ATT.Mult_Spread = 0.75
ATT.Mult_Range_Min = 1.5

TacRP.LoadAtt(ATT, "muzz_pistol_comp")
-- #endregion

------------------------------
-- #region muzz_silencer
------------------------------
-- #endregion

------------------------------
-- #region muzz_supp_compact
------------------------------

------------------------------
-- #region muzz_supp_weighted
------------------------------
-- #endregion

------------------------------
-- #region muzz_brake_aggressor
------------------------------
ATT = {}

ATT.PrintName = "A. Brake"
ATT.FullName = "Aggressor Brake"
ATT.Icon = Material("entities/tacrp_att_muzz_brake_aggressor.png", "mips smooth")
ATT.Description = "Muzzle brake designed to redirect vented gases away from the shooter."
ATT.Pros = {"stat.shootingspeed"}
ATT.Cons = {"stat.recoilstability", "stat.spread", "stat.vol_shoot"}

ATT.Model = "models/weapons/tacint_extras/addons/brake_aggressor.mdl"
ATT.Scale = 1.25

ATT.ModelOffset = Vector(-5.0, 0, 0)

ATT.Category = {"silencer", "brake"}

ATT.Add_ShootingSpeedMult = 0.05
ATT.Mult_RecoilStability = 0.9
ATT.Mult_Spread = 1.15
ATT.Add_Vol_Shoot = 5

ATT.SortOrder = 100

TacRP.LoadAtt(ATT, "muzz_brake_aggressor")
-- #endregion

------------------------------
-- #region muzz_brake_breaching
------------------------------
ATT = {}

ATT.PrintName = "B. Brake"
ATT.FullName = "Breaching Brake"
ATT.Icon = Material("entities/tacrp_att_muzz_brake_breaching.png", "mips smooth")
ATT.Description = "Spiked muzzle brake designed for close combat."
ATT.Pros = {"stat.meleedamage", "stat.recoilstability"}
ATT.Cons = {"stat.spread"}

ATT.Model = "models/weapons/tacint_extras/addons/brake_breacher.mdl"
ATT.Scale = 1.25

ATT.ModelOffset = Vector(-5.4, 0, 0)

ATT.Category = {"silencer", "brake"}

ATT.Mult_MeleeDamage = 1.4
ATT.Mult_Spread = 1.25
ATT.Mult_RecoilStability = 1.15

ATT.SortOrder = 101

TacRP.LoadAtt(ATT, "muzz_brake_breaching")
-- #endregion

------------------------------
-- #region muzz_brake_concussive
------------------------------
ATT = {}

ATT.PrintName = "C. Brake"
ATT.FullName = "Concussive Brake"
ATT.Icon = Material("entities/tacrp_att_muzz_brake_concussive.png", "mips smooth")
ATT.Description = "Viciously loud, uncomfortable muzzle brake for extreme recoil control."
ATT.Pros = {"stat.recoilkick"}
ATT.Cons = {"stat.shootingspeed", "stat.spread", "stat.vol_shoot"}

ATT.Model = "models/weapons/tacint_extras/addons/brake_concussive.mdl"
ATT.Scale = 1.25

ATT.ModelOffset = Vector(-5.4, 0, 0)

ATT.Category = {"silencer", "brake"}

ATT.Mult_RecoilKick = 0.6
-- ATT.Mult_RecoilStability = 1.1

ATT.Add_ShootingSpeedMult = -0.4
ATT.Mult_Spread = 1.2

ATT.Add_Vol_Shoot = 15
ATT.Mult_Pitch_Shoot = 0.9

ATT.SortOrder = 102

ATT.Override_MuzzleEffect = "muzzleflash_pistol_deagle"

TacRP.LoadAtt(ATT, "muzz_brake_concussive")
-- #endregion