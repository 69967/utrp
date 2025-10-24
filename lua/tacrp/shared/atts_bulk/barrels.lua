--HB START
ATT = {}

ATT.PrintName = "Heavy Barrel"
ATT.Icon = Material("entities/tacrp_att_muzz_hbar.png", "mips smooth")
ATT.Description = "IMPROVED range, recoil, and sustained fire, but WORSENS spread"

ATT.Category = "barrel"

ATT.SortOrder = 1

ATT.Mult_Spread = 2
ATT.Mult_Range_Min = 1.1
ATT.Mult_Range_Max = 1.1
ATT.Mult_RecoilKick = 0.9
ATT.Mult_RecoilSpreadPenalty = 0.8

TacRP.LoadAtt(ATT, "muzz_hbar")
--HB END

--LB START
ATT = {}

ATT.PrintName = "Light Barrel"
ATT.Icon = Material("entities/tacrp_att_muzz_lbar.png", "mips smooth")
ATT.Description = "IMPROVED spread, range, and sway, but WORSENS recoil"

ATT.Category = "barrel"

ATT.SortOrder = 1

ATT.Mult_Spread = 0.5
ATT.Mult_Range_Min = 1.2
ATT.Mult_Range_Max = 1.2
ATT.Mult_RecoilKick = 1.25
ATT.Mult_ScopedSway = 0.8

TacRP.LoadAtt(ATT, "muzz_lbar")
--LB END