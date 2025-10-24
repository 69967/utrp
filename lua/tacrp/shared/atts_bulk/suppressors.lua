--LCS START
ATT = {}
ATT.PrintName = "LC Suppressor"
ATT.FullName = "Low Caliber Suppressor"
ATT.Icon = Material("entities/tacrp_att_muzz_supp_assassin.png", "mips smooth")
ATT.Description = "Suppressor for 9x19mm and below."

ATT.Model = "models/weapons/tacint_shark/addons/suppressor_assassin.mdl"
ATT.Scale = 1.3

ATT.ModelOffset = Vector(1, 0, 0)

ATT.Category = "lc_s"

ATT.SortOrder = 7

ATT.Add_Vol_Shoot = -20
ATT.Mult_Range_Max = 1.1
ATT.Mult_Range_Min = 1.1
ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_RecoilKick = 0.9
ATT.Mult_RecoilDissipationRate = 0.9
ATT.Mult_Spread = 0.9

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"
TacRP.LoadAtt(ATT, "muzz_supp_assassin")
--LCS END

--45S START
ATT = {}

ATT.PrintName = ".45 Suppressor"
ATT.FullName = ".45 APC Suppressor"
ATT.Icon = Material("entities/tacrp_att_muzz_supp_compact.png", "mips smooth")
ATT.Description = "2 world wa r silentt."

ATT.Model = "models/weapons/tacint_extras/addons/suppressor.mdl"
ATT.Scale = 1.3

ATT.ModelOffset = Vector(0, 0, 0)

ATT.Category = "silencer"

ATT.SortOrder = 5

ATT.Add_Vol_Shoot = -20
ATT.Mult_Range_Max = 1.1
ATT.Mult_Range_Min = 1.1
ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_RecoilKick = 0.9
ATT.Mult_RecoilDissipationRate = 0.9
ATT.Mult_Spread = 0.9

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"
TacRP.LoadAtt(ATT, "muzz_supp_compact")
--45S END

--556S START
ATT = {}

ATT.PrintName = "5.56 Suppressor"
ATT.FullName = "5.56 Suppressor"
ATT.Icon = Material("entities/tacrp_att_muzz_silencer.png", "mips smooth")
ATT.Description = "Rifle Suppressor for ARs mostly."

ATT.Model = "models/weapons/tacint/addons/silencer.mdl"
ATT.Scale = 0.35

ATT.Category = "silencer"
ATT.SortOrder = 4

ATT.Add_Vol_Shoot = -25
ATT.Mult_RecoilSpreadPenalty = 0.95
ATT.Mult_Range_Max = 1.1
ATT.Mult_Range_Min = 1.1
ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_RecoilKick = 0.9
ATT.Mult_RecoilDissipationRate = 0.9
ATT.Mult_Spread = 0.9

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"

TacRP.LoadAtt(ATT, "muzz_silencer")
--556S END

--762NS START
ATT = {}

ATT.PrintName = "7.62 Suppressor"
ATT.FullName = "7.62 NATO Suppressor"
ATT.Icon = Material("entities/tacrp_att_muzz_supp_weighted.png", "mips smooth")
ATT.Description = "Heavy suppressor with superior ballistics compared to its contemporaries."

ATT.Model = "models/weapons/tacint_extras/addons/suppressor_salvo.mdl"
ATT.Scale = 1.5

ATT.ModelOffset = Vector(0, 0, 0)

ATT.Category = "silencer"

ATT.SortOrder = 6

ATT.Add_Vol_Shoot = -25
ATT.Mult_RecoilSpreadPenalty = 0.95
ATT.Mult_Range_Max = 1.1
ATT.Mult_Range_Min = 1.1
ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_RecoilKick = 0.8
ATT.Mult_RecoilDissipationRate = 0.8
ATT.Mult_Spread = 0.9
ATT.Add_SprintToFireTime = 0.02
ATT.Add_AimDownSightsTime = 0.03

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"

TacRP.LoadAtt(ATT, "muzz_supp_weighted")
--762NS END

--762RS START
ATT = {}
ATT.PrintName = "AK Suppressor"
ATT.FullName = "AK Suppressor"
ATT.Icon = Material("entities/tacrp_att_muzz_supp_pbs.png", "mips smooth")
ATT.Description = "AK pattern suppressor"

ATT.Model = "models/weapons/tacint_extras/addons/suppressor_pbs.mdl"
ATT.Scale = 1.5

ATT.ModelOffset = Vector(0, 0, 0)

ATT.Category = "silencer"

ATT.SortOrder = 8

ATT.Add_Vol_Shoot = -25
ATT.Mult_RecoilSpreadPenalty = 0.95
ATT.Mult_Range_Max = 1.1
ATT.Mult_Range_Min = 1.1
ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_RecoilKick = 0.8
ATT.Mult_RecoilDissipationRate = 0.8
ATT.Mult_Spread = 0.9
ATT.Add_SprintToFireTime = 0.02
ATT.Add_AimDownSightsTime = 0.03

ATT.Silencer = true
ATT.Override_MuzzleEffect = "muzzleflash_suppressed"

TacRP.LoadAtt(ATT, "muzz_supp_pbs")
--762RS END