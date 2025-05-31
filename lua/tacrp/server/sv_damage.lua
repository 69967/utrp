-- ULTRA CPU OPTIMIZATION: Maximum performance damage calculations with forensic-level optimizations
-- Pass 8: Micro-optimizations, pre-computed lookups, minimal allocations, cache-friendly access patterns

-- Pre-cache all frequently used functions at module level for maximum performance
local string_format = string.format
local util_TraceLine = util.TraceLine
local util_Decal = util.Decal
local timer_Create = timer.Create
local timer_Remove = timer.Remove
local timer_Exists = timer.Exists
local math_max = math.max
local math_Rand = math.Rand
local math_min = math.min
local ents_Create = ents.Create
local IsValid = IsValid
local CurTime = CurTime
local VectorRand = VectorRand

-- Pre-calculate damage type bitmask - single bit operation
local dtb = bit.bor(DMG_BULLET, DMG_BUCKSHOT, DMG_BLAST, DMG_SLASH, DMG_CLUB)

-- Optimized damage type lookup with pre-computed values and minimal branching
local dtmap = {
	[DMG_BULLET] = { ab = nil, apen = 0, dtype = 1 },
	[DMG_BUCKSHOT] = { ab = 0.25, apen = 0.25, dtype = 2 },
	[DMG_BLAST] = { ab = 0.33, apen = 0.75, dtype = 3 },
	[DMG_SLASH] = { ab = 0.1, apen = 0, dtype = 4 },
	[DMG_CLUB] = { ab = 0.1, apen = 0.33, dtype = 0 }
}

-- Pre-allocate and cache vectors to avoid repeated memory allocation
local trace_offset = Vector(30, 0, 0)
local trace_down = Vector(0, 0, -1000)
local drop_vel1 = Vector(0.05, 5, -1.7)
local drop_vel2 = Vector(0.01, 2, -1.7)
local zero_vec = Vector(0, 0, 0)

-- Pre-allocate trace table to avoid repeated table creation
local trace_struct = {
	start = Vector(),
	endpos = Vector(),
	mask = MASK_NPCWORLDSTATIC
}

-- Optimized bleed calculation with minimal function calls and memory allocation
function calcbleed(ply, hpl, hp)
	local sid = ply:SteamID64()
	ply.hp = ply.hp or hp
	ply.cbl = ply.cbl or hpl

	local timer_name = "BleedT" .. sid
	
	if timer_Exists(timer_name) then
		ply.cbl = ply.cbl + hpl
	else
		timer_Create(timer_name, 10, 0, function()
			if not IsValid(ply) then
				timer_Remove(timer_name)
				return
			end
			
			-- Reuse pre-allocated trace structure for optimal memory usage
			local ply_pos = ply:GetPos()
			trace_struct.start:Set(ply:EyePos() + trace_offset)
			trace_struct.endpos:Set(ply_pos + trace_down)
			
			local tr = util_TraceLine(trace_struct)

			if ply.cbl > 10 then
				ply:SetHealth(ply.hp - ply.cbl * 0.1)
				ply.cbl = ply.cbl - 4
				util_Decal("Blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			else
				timer_Remove(timer_name)
			end
		end)
	end
end

-- Ultra-optimized damage scaling hook with minimal branching and function calls
hook.Add("ScalePlayerDamage", "utrpdam", function(ply, hitgroup, dmginfo)
	local ent = dmginfo:GetInflictor()
	local a = ent:Alive()
	local hp = ply:Health()
	local ap = ply:Armor()
	local dmg = dmginfo:GetDamage()
	local apen = 0
	local ab, dtype, wep, hpl, b = nil, nil, nil, dmg, 0

	-- Fast path optimization: Early exit for simple non-armor damage
	if a and ap > 0 and not dmginfo:IsDamageType(dtb) and hitgroup ~= 0 and hitgroup ~= 2 and hitgroup ~= 3 then 
		ply:SetHealth(hp - dmg)
	else
		-- Weapon stats extraction with minimal validity checks
		if a then
			wep = ent:GetActiveWeapon()
			if IsValid(wep) then
				ab = wep:GetValue("ArmorBonus")
				apen = wep:GetValue("ArmorPenetration")
			end
		end

		-- Optimized damage type lookup with early termination
		for dtkey, data in pairs(dtmap) do
			if dmginfo:IsDamageType(dtkey) then
				ab = data.ab or ab
				apen = data.apen
				dtype = data.dtype
				break
			end
		end

		-- Conditional damage modifications with minimal branching
		if dtype == 1 and ap * 3 < (ab or 0) * 50 then
			apen = 0.5
		elseif hitgroup == 2 then
			dmg = dmg * 0.6667 -- Pre-calculated inverse of 1.5x chest multiplier
		end

		-- Apply damage calculations with optimized math operations
		if ab then
			ply:SetArmor(math_max(ap - dmg * ab, 0))
		end
		ply:SetHealth(hp - dmg * apen)
		
		if ap > 0 then 
			b = 3 
		end
	end

	ply:SetBloodColor(b)
	dmginfo:SetDamage(0)

	-- Threshold-based bleed calculation to avoid unnecessary function calls
	if hpl >= 20 then 
		calcbleed(ply, hpl, hp) 
	end
end)

-- Optimized death hook with efficient weapon iteration and minimal allocations
hook.Add("DoPlayerDeath", "TacRP_DropGrenade", function(ply, attacker, dmginfo)
	-- Cache weapons list to avoid repeated calls
	local weapons = ply:GetWeapons()
	local weapon_count = #weapons
	
	-- Use numeric for loop for maximum performance
	for i = 1, weapon_count do
		local wep = weapons[i]
		if wep.ArcticTacRP then
			ply:DropWeapon(wep, drop_vel1, drop_vel2)
		end
	end

	local wep = ply:GetActiveWeapon()
	-- Early exit with combined validity checks
	if not IsValid(wep) or not wep.ArcticTacRP or not wep:GetPrimedGrenade() then 
		return 
	end
	
	TacRP.DropWeapon(wep)
	
	-- Cache grenade data with fallback
	local nade = wep:GetValue("PrimaryGrenade") and TacRP.QuickNades[wep:GetValue("PrimaryGrenade")] or wep:GetGrenade()
	if not nade then 
		return 
	end

	-- Pre-cache frequently accessed values
	local ent = nade.GrenadeEnt
	local src = ply:EyePos()
	local ang = ply:EyeAngles()
	local rocket = ents_Create(ent or "")

	if not IsValid(rocket) then 
		return 
	end

	-- Batch entity setup calls for better performance
	rocket:SetPos(src)
	rocket:SetOwner(ply)
	rocket:SetAngles(ang)
	rocket:Spawn()
	rocket:SetPhysicsAttractor(ply, 10)

	-- Conditional property setting with minimal function calls
	if TacRP.IsGrenadeInfiniteAmmo(nade) then
		rocket.PickupAmmo = nil
		rocket.WeaponClass = nil
	end

	if wep:GetValue("QuickNadeTryImpact") and nade.CanSetImpact then
		rocket.InstantFuse = false
		rocket.Delay = 0
		rocket.Armed = false
		rocket.ImpactFuse = true
	end

	-- TTT timer optimization with batch property setting
	if nade.TTTTimer then
		rocket:SetGravity(0.4)
		rocket:SetFriction(0.2)
		rocket:SetElasticity(0.45)
		rocket:SetDetonateExact(CurTime() + nade.TTTTimer)
		rocket:SetThrower(ply)
	end

	-- Physics optimization with pre-calculated forces
	local phys = rocket:GetPhysicsObject()
	if IsValid(phys) then
		local ply_vel = ply:GetVelocity()
		local rand_force = VectorRand() * 50
		local upward_force = Vector(0, 0, math_Rand(25, 50))
		
		phys:ApplyForceCenter(ply_vel + rand_force + upward_force)
		phys:AddAngleVelocity(VectorRand() * 500)
	end

	-- Optimized spoon creation with minimal branching
	if nade.Spoon and TacRP.ConVars["dropmagazinemodel"]:GetBool() then
		local mag = ents_Create("TacRP_droppedmag")
		if IsValid(mag) then
			mag:SetPos(src)
			mag:SetAngles(ang)
			mag.Model = "models/weapons/tacint/flashbang_spoon.mdl"
			mag.ImpactType = "spoon"
			mag:SetOwner(ply)
			mag:Spawn()

			local phys2 = mag:GetPhysicsObject()
			if IsValid(phys2) then
				phys2:ApplyForceCenter(VectorRand() * 25)
				phys2:AddAngleVelocity(Vector(math_Rand(-300, 300), math_Rand(-300, 300), math_Rand(-300, 300)))
			end
		end
	end
end)
