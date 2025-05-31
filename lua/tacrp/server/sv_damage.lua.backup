-- ULTRA CPU OPTIMIZED: Maximum performance damage calculations
-- Pass 10: Cache-friendly patterns, minimal allocations, optimized algorithms

-- Pre-cache frequently used globals for maximum CPU efficiency
local mathmax, mathrand, mathmin = math.max, math.Rand, math.min
local timerExists, timerCreate, timerRemove = timer.Exists, timer.Create, timer.Remove
local utilTraceLine, utilDecal = util.TraceLine, util.Decal
local entsCreate = ents.Create
local isValid = IsValid
local curTime = CurTime
local vectorRand = VectorRand

-- Pre-computed constants for hot path optimization
local dtb = bit.bor(DMG_BULLET, DMG_BUCKSHOT, DMG_BLAST, DMG_SLASH, DMG_CLUB)
local chestDmgMultiplier = 0.6667 -- Pre-computed inverse of 1.5x chest multiplier

-- Optimized damage type lookup table with cache-friendly structure
local dtmap = {
	[DMG_BULLET] = { ab = nil, apen = 0, dtype = 1 },
	[DMG_BUCKSHOT] = { ab = 0.25, apen = 0.25, dtype = 2 },
	[DMG_BLAST] = { ab = 0.33, apen = 0.75, dtype = 3 },
	[DMG_SLASH] = { ab = 0.1, apen = 0, dtype = 4 },
	[DMG_CLUB] = { ab = 0.1, apen = 0.33, dtype = 0 }
}

-- Pre-allocated vectors to minimize memory allocation overhead
local traceOffset = Vector(30, 0, 0)
local traceDown = Vector(0, 0, -1000)
local dropVel1 = Vector(0.05, 5, -1.7)
local dropVel2 = Vector(0.01, 2, -1.7)

-- Pre-allocated trace structure for optimal memory reuse
local traceStruct = {
	start = Vector(),
	endpos = Vector(),
	mask = MASK_NPCWORLDSTATIC
}

-- Ultra-optimized bleed calculation with minimal function overhead
function calcbleed(ply, hpl, hp)
	local sid = ply:SteamID64()
	ply.hp = ply.hp or hp
	ply.cbl = ply.cbl or hpl

	local timerName = "BleedT" .. sid
	
	if timerExists(timerName) then
		ply.cbl = ply.cbl + hpl
	else
		timerCreate(timerName, 10, 0, function()
			-- Early exit optimization for invalid players
			if not isValid(ply) then
				timerRemove(timerName)
				return
			end
			
			-- Reuse pre-allocated trace structure for memory efficiency
			local plyPos = ply:GetPos()
			traceStruct.start:Set(ply:EyePos() + traceOffset)
			traceStruct.endpos:Set(plyPos + traceDown)
			
			local tr = utilTraceLine(traceStruct)

			if ply.cbl > 10 then
				ply:SetHealth(ply.hp - ply.cbl * 0.1)
				ply.cbl = ply.cbl - 4
				utilDecal("Blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			else
				timerRemove(timerName)
			end
		end)
	end
end

-- Ultra-optimized damage scaling hook with CPU cache-friendly patterns
hook.Add("ScalePlayerDamage", "utrpdam", function(ply, hitgroup, dmginfo)
	local ent = dmginfo:GetInflictor()
	
	-- Early exit for non-alive entities
	if not ent:Alive() then return end
	
	-- Cache hot path variables for maximum CPU efficiency
	local hp, ap, dmg = ply:Health(), ply:Armor(), dmginfo:GetDamage()
	local apen, ab, dtype, b = 0, nil, nil, 0
	
	-- Fast path: non-weapon damage optimization
	if ap > 0 and not dmginfo:IsDamageType(dtb) and hitgroup ~= 0 and hitgroup ~= 2 and hitgroup ~= 3 then 
		ply:SetHealth(hp - dmg)
		dmginfo:SetDamage(0)
		return
	end
	
	-- Weapon damage calculation with minimal validity checks
	local wep = ent:GetActiveWeapon()
	if isValid(wep) then
		ab = wep:GetValue("ArmorBonus")
		apen = wep:GetValue("ArmorPenetration")
	end

	-- Optimized damage type detection with early break pattern
	for dtkey, data in pairs(dtmap) do
		if dmginfo:IsDamageType(dtkey) then
			ab = data.ab or ab
			apen = data.apen
			dtype = data.dtype
			break
		end
	end

	-- Branch prediction optimization: most common cases first
	if dtype == 1 and ap * 3 < (ab or 0) * 50 then
		apen = 0.5
	elseif hitgroup == 2 then
		dmg = dmg * chestDmgMultiplier
	end

	-- Apply damage calculations with optimized math operations
	if ab then
		ply:SetArmor(mathmax(ap - dmg * ab, 0))
	end
	ply:SetHealth(hp - dmg * apen)
	
	if ap > 0 then b = 3 end

	ply:SetBloodColor(b)
	dmginfo:SetDamage(0)

	-- Threshold-based bleed calculation to minimize function calls
	if dmg >= 20 then
		calcbleed(ply, dmg, hp)
	end
end)

-- Optimized death hook with efficient weapon iteration
hook.Add("DoPlayerDeath", "TacRP_DropGrenade", function(ply, attacker, dmginfo)
	-- Cache weapon list for efficient iteration
	local weapons = ply:GetWeapons()
	local weaponCount = #weapons
	
	-- Numeric for loop for maximum performance
	for i = 1, weaponCount do
		local wep = weapons[i]
		if wep.ArcticTacRP then
			ply:DropWeapon(wep, dropVel1, dropVel2)
		end
	end

	local wep = ply:GetActiveWeapon()
	-- Combined validity checks for early exit optimization
	if not isValid(wep) or not wep.ArcticTacRP or not wep:GetPrimedGrenade() then 
		return 
	end
	
	TacRP.DropWeapon(wep)
	
	-- Cache grenade data with optimized fallback
	local nade = wep:GetValue("PrimaryGrenade") and TacRP.QuickNades[wep:GetValue("PrimaryGrenade")] or wep:GetGrenade()
	if not nade then return end

	-- Pre-cache frequently accessed values to minimize function calls
	local entType = nade.GrenadeEnt
	if not entType then return end
	
	local src = ply:EyePos()
	local ang = ply:EyeAngles()
	local rocket = entsCreate(entType)

	if not isValid(rocket) then return end

	-- Batch entity setup for improved performance
	rocket:SetPos(src)
	rocket:SetOwner(ply)
	rocket:SetAngles(ang)
	rocket:Spawn()
	rocket:SetPhysicsAttacker(ply, 10)

	-- Optimized conditional property setting
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

	-- TTT timer optimization with batched property setting
	if nade.TTTTimer then
		rocket:SetGravity(0.4)
		rocket:SetFriction(0.2)
		rocket:SetElasticity(0.45)
		rocket:SetDetonateExact(curTime() + nade.TTTTimer)
		rocket:SetThrower(ply)
	end

	-- Physics optimization with pre-computed forces
	local phys = rocket:GetPhysicsObject()
	if isValid(phys) then
		local plyVel = ply:GetVelocity()
		local randForce = vectorRand() * 50
		randForce.z = randForce.z + mathrand(25, 50)
		
		phys:ApplyForceCenter(plyVel + randForce)
		phys:AddAngleVelocity(vectorRand() * 500)
	end

	-- Optimized spoon creation with cached ConVar access
	if nade.Spoon and TacRP.ConVars["dropmagazinemodel"]:GetBool() then
		local mag = entsCreate("TacRP_droppedmag")
		if isValid(mag) then
			mag:SetPos(src)
			mag:SetAngles(ang)
			mag.Model = "models/weapons/tacint/flashbang_spoon.mdl"
			mag.ImpactType = "spoon"
			mag:SetOwner(ply)
			mag:Spawn()

			local phys2 = mag:GetPhysicsObject()
			if isValid(phys2) then
				phys2:ApplyForceCenter(vectorRand() * 25)
				-- Pre-compute random angle velocity for cache efficiency
				local randAng = Vector(mathrand(-300, 300), mathrand(-300, 300), mathrand(-300, 300))
				phys2:AddAngleVelocity(randAng)
			end
		end
	end
end)
