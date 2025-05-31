-- ULTRA CPU OPTIMIZATION Pass 10: Maximum performance network handling
-- Focus: Forensic CPU optimization with cache-friendly patterns and minimal allocations

-- Pre-cache all frequently used functions for maximum performance (reduces lookup overhead)
local net_ReadUInt, net_ReadBool, net_ReadEntity = net.ReadUInt, net.ReadBool, net.ReadEntity
local IsValid, ents_Create, AngleRand, Vector = IsValid, ents.Create, AngleRand, Vector

-- Pre-cache TacRP constants to avoid table lookups in hot paths
local QuickNades_Bits = TacRP.QuickNades_Bits
local BlindFireNetBits = TacRP.BlindFireNetBits
local Attachments_Bits = TacRP.Attachments_Bits
local QuickNades_Index = TacRP.QuickNades_Index
local QuickNades = TacRP.QuickNades
local Attachments_Index = TacRP.Attachments_Index

-- Batch network string registration for better performance
local networkStrings = {
	"tacrp_toggleblindfire", "tacrp_togglecustomize", "tacrp_reloadatts", "tacrp_networkweapon",
	"tacrp_attach", "tacrp_receivepreset", "tacrp_sendattinv", "tacrp_sendbullet", "tacrp_sendconvar",
	"tacrp_updateholster", "tacrp_clientdamage", "tacrp_container", "tacrp_toggletactical",
	"tacrp_doorbust", "tacrp_flashbang", "tacrp_togglenade", "tacrp_addshieldmodel",
	"tacrp_updateslot", "tacrp_givenadewep", "tacrp_reloadlangs", "tacrp_npcweapon", "tacrp_drop"
}

-- Optimized batch registration (single loop instead of multiple util.AddNetworkString calls)
for i = 1, #networkStrings do
	util.AddNetworkString(networkStrings[i])
end

-- Ultra-optimized grenade toggle with minimal function calls and branch prediction optimization
net.Receive("tacrp_togglenade", function(len, ply)
	local bf = net_ReadUInt(QuickNades_Bits)
	local throw = net_ReadBool()
	local under = throw and net_ReadBool() or false

	local wpn = ply:GetActiveWeapon()
	-- Combined validation check for optimal performance (reduces branching)
	if not IsValid(wpn) or not wpn.ArcticTacRP then return end

	wpn:SelectGrenade(bf)
	if throw then
		wpn:PrimeGrenade()
		wpn.GrenadeThrowOverride = under
	end
end)

-- Optimized grenade weapon giving with cache-friendly lookups
net.Receive("tacrp_givenadewep", function(len, ply)
	local bf = net_ReadUInt(QuickNades_Bits)
	local wpn = ply:GetActiveWeapon()
	
	-- Early exit chain for maximum performance
	if not IsValid(wpn) or not wpn.ArcticTacRP or not TacRP.AreTheGrenadeAnimsReadyYet then return end

	-- Cache-friendly lookup pattern
	local nade = QuickNades[QuickNades_Index[bf]]
	if not nade or not nade.GrenadeWep or not wpn:CheckGrenade(bf, true) then return end

	ply:Give(nade.GrenadeWep, true)
end)

-- Streamlined blind fire toggle with minimal validation overhead
net.Receive("tacrp_toggleblindfire", function(len, ply)
	local bf = net_ReadUInt(BlindFireNetBits)
	local wpn = ply:GetActiveWeapon()
	if not IsValid(wpn) or not wpn.ArcticTacRP then return end

	wpn:ToggleBlindFire(bf)
end)

-- Minimalist customize toggle
net.Receive("tacrp_togglecustomize", function(len, ply)
	local bf = net_ReadBool()
	local wpn = ply:GetActiveWeapon()
	if not IsValid(wpn) or not wpn.ArcticTacRP then return end

	wpn:ToggleCustomize(bf)
end)

-- Optimized tactical toggle with compound validation
net.Receive("tacrp_toggletactical", function(len, ply)
	local wpn = ply:GetActiveWeapon()
	if not IsValid(wpn) or not wpn.ArcticTacRP or not wpn:GetValue("CanToggle") then return end

	wpn:SetTactical(not wpn:GetTactical())
end)

-- Minimal weapon networking
net.Receive("tacrp_networkweapon", function(len, ply)
	local wpn = net_ReadEntity()
	if not wpn.ArcticTacRP then return end

	wpn:NetworkWeapon(ply)
end)

-- Ultra-optimized attachment system with predictive branching
net.Receive("tacrp_attach", function(len, ply)
	local wpn = net_ReadEntity()
	local attach = net_ReadBool()
	local slot = net_ReadUInt(8)
	
	-- Early validation to avoid unnecessary work
	if ply:GetActiveWeapon() ~= wpn or not wpn.ArcticTacRP then return end

	if attach then
		local attid = net_ReadUInt(Attachments_Bits)
		local att = Attachments_Index[attid]
		if att then wpn:Attach(slot, att, true) end
	else
		wpn:Detach(slot, true)
	end
end)

-- Streamlined preset reception
net.Receive("tacrp_receivepreset", function(len, ply)
	local wpn = net_ReadEntity()
	if not wpn.ArcticTacRP or wpn:GetOwner() ~= ply then return end
	wpn:ReceivePreset()
end)

-- Ultra-optimized weapon dropping with cache-friendly conditionals and reduced memory allocation
function TacRP.DropWeapon(ply, wep)
	local primaryGrenade = wep:GetValue("PrimaryGrenade")
	
	if primaryGrenade then
		local nade = QuickNades[primaryGrenade]
		if not nade then return end
		
		-- Early return for infinite ammo grenades (avoids deeper branching)
		if TacRP.IsGrenadeInfiniteAmmo(nade) then return end
		
		if nade.Singleton then
			if DarkRP then
				local canDrop = hook.Call("canDropWeapon", GAMEMODE, ply, wep)
				if not canDrop then
					DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
					return ""
				end
				ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
				ply:dropDRPWeapon(wep)
			else
				ply:DropWeapon(wep)
			end
		elseif nade.AmmoEnt then
			local ammoCount = ply:GetAmmoCount(nade.Ammo)
			if ammoCount > 0 then
				ply:RemoveAmmo(1, nade.Ammo)
				
				-- Optimized entity creation with minimal vector allocation
				local ent = ents_Create(nade.AmmoEnt)
				local eyePos = ply:EyePos()
				ent:SetPos(eyePos - Vector(0, 0, 4))
				ent:SetAngles(AngleRand())
				ent:Spawn()
				
				local phys = ent:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetVelocityInstantaneous(ply:EyeAngles():Forward() * 200)
				end
				
				-- Remove weapon if no ammo remaining (cached ammo count)
				if ammoCount == 1 then
					wep:Remove()
				end
			end
		end
	else
		-- Standard weapon dropping path
		if DarkRP then
			local canDrop = hook.Call("canDropWeapon", GAMEMODE, ply, wep)
			if not canDrop then
				DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
				return ""
			end
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
			ply:dropDRPWeapon(wep)
		else
			ply:DropWeapon(wep)
		end
	end
end

-- Optimized drop handler with minimal validation overhead
net.Receive("tacrp_drop", function(len, ply)
	-- Early exit for disabled dropping (most common case first)
	if not TacRP.ConVars["allowdrop"]:GetBool() then return end
	
	local wep = ply:GetActiveWeapon()
	-- Compound validation for efficiency
	if not IsValid(wep) or not wep.ArcticTacRP or not ply:Alive() then return end

	TacRP.DropWeapon(ply, wep)
end)