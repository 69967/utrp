local function dcalc(dmginfo, ap, dmg, ab, apen)

	local dtype=nil

	if dmginfo:IsDamageType(DMG_BULLET) then dtype = 1
	elseif dmginfo:IsDamageType(DMG_BUCKSHOT) then dtype = 2
	elseif dmginfo:IsDamageType(DMG_BLAST) then dtype = 3
	elseif dmginfo:IsDamageType(DMG_SLASH) then dtype = 4
	end

	if dtype == 1 and ap*2 < ab*20 then
		dmg=ab*6
		apen=0.5
	elseif dtype == 1 then
		dmg=ab*4
		apen=0
	elseif dtype == 2 then
		ab=0.25
		apen=0.25
	elseif dtype == 3 then
		ab=0.33
		apen=0.75
	elseif dtype == 4 then
		ab=0.1
		apen=0
	else
		ab=0.1
		apen=0.33
	end

	local hdmg=dmg*apen
	local admg=dmg*ab

	return hdmg, admg
end

hook.Add("EntityTakeDamage", "armordam", function(ply, dmginfo)
	if TacRP.ConVars["armorpenetration"] == false then return end
	if ply.IsPlayer() == false then return end
	if ply:Armor() == 0 then return end
	if dmginfo:GetDamage() < 1 or dmginfo:IsDamageType(DMG_BULLET + DMG_BUCKSHOT + DMG_BLAST + DMG_SLASH + DMG_CLUB) == false then return end

	local ent=dmginfo:GetInflictor()
	local wep=nil

	if ent:Alive() then
		wep = ent:GetActiveWeapon()
	end

	local dmg=nil
	local ab=nil
	local apen=nil

	if wep and wep.ArcticTacRP then
		dmg = dmginfo:GetDamage()
		ab = wep:GetValue("ArmorBonus")
		apen = wep:GetValue("ArmorPenetration")
	else
		dmg = dmginfo:GetDamage()
		ab = 0
		apen = 0
	end

	local ap=ply:Armor()
	local hp=ply:Health()
	local hg=ply:LastHitGroup()

	if ent:Alive() and hg ~= 0 and hg ~= 2 and hg ~=3 then --0,2,3:generic, stomach, chest; models may assign hitgroups differently.
		ply:SetHealth(hp-dmg)
		dmginfo:SetDamage(0)
	else
		local hdmg, admg = dcalc(dmginfo, ap, dmg, ab, apen)
		ply:SetArmor(math.max(ap-admg, 0))
		ply:SetHealth(hp-hdmg)
		dmginfo:SetDamage(0)
		print(ply:LastHitGroup())
	end
end)

hook.Add("DoPlayerDeath", "TacRP_DropGrenade", function(ply, attacker, dmginfo)
    local wep = ply:GetActiveWeapon()
    if !IsValid(wep) or !wep.ArcticTacRP or !wep:GetPrimedGrenade() then return end
    local nade = wep:GetValue("PrimaryGrenade") and TacRP.QuickNades[wep:GetValue("PrimaryGrenade")] or wep:GetGrenade()
    if nade then
        local ent = nade.GrenadeEnt
        local src = ply:EyePos()
        local ang = ply:EyeAngles()
        local rocket = ents.Create(ent or "")

        if !IsValid(rocket) then return end

        rocket:SetPos(src)
        rocket:SetOwner(ply)
        rocket:SetAngles(ang)
        rocket:Spawn()
        rocket:SetPhysicsAttacker(ply, 10)

        if TacRP.IsGrenadeInfiniteAmmo(nade) then
            rocket.PickupAmmo = nil
            rocket.WeaponClass = nil -- dz ents
        end

        if wep:GetValue("QuickNadeTryImpact") and nade.CanSetImpact then
            rocket.InstantFuse = false
            rocket.Delay = 0
            rocket.Armed = false
            rocket.ImpactFuse = true
        end

        if nade.TTTTimer then
            rocket:SetGravity(0.4)
            rocket:SetFriction(0.2)
            rocket:SetElasticity(0.45)
            rocket:SetDetonateExact(CurTime() + nade.TTTTimer)
            rocket:SetThrower(ply)
        end

        local phys = rocket:GetPhysicsObject()

        if phys:IsValid() then
            phys:ApplyForceCenter(ply:GetVelocity() + VectorRand() * 50 + Vector(0, 0, math.Rand(25, 50)))
            phys:AddAngleVelocity(VectorRand() * 500)
        end

        if nade.Spoon and TacRP.ConVars["dropmagazinemodel"]:GetBool() then
            local mag = ents.Create("TacRP_droppedmag")

            if mag then
                mag:SetPos(src)
                mag:SetAngles(ang)
                mag.Model = "models/weapons/tacint/flashbang_spoon.mdl"
                mag.ImpactType = "spoon"
                mag:SetOwner(ply)
                mag:Spawn()

                local phys2 = mag:GetPhysicsObject()

                if IsValid(phys2) then
                    phys2:ApplyForceCenter(VectorRand() * 25)
                    phys2:AddAngleVelocity(Vector(math.Rand(-300, 300), math.Rand(-300, 300), math.Rand(-300, 300)))
                end
            end
        end
    end
end)

--[[ TODO func to Drop weapons on death from their holster positions in trp

    for _, wep in ipairs(ply:GetWeapons()) do
        local class = wep:GetClass()
        local primaryAmmoType = wep:GetPrimaryAmmoType()
        local ammoCount = ply:GetAmmoCount(primaryAmmoType)

        -- Remove the weapon *before* spawning to avoid ammo duplication
        if wep.ArcticTacRP then ply:StripWeapon(class) end

        -- Create weapon entity
        local dropped = ents.Create(class)
        if not IsValid(dropped) then continue end

        local dropPos = basePos + Angle(0, angleOffset, 0):Forward() * 30
        dropped:SetPos(dropPos)
        dropped:SetAngles(Angle(0, math.random(0, 360), 0))
        dropped:Spawn()

        -- Set correct ammo
        if dropped:IsWeapon() and primaryAmmoType >= 0 then
            dropped:SetClip1(wep:Clip1()) -- current mag
            dropped:SetClip2(wep:Clip2()) -- if used
            dropped:SetNWInt("DroppedAmmo", ammoCount) -- optional, to save it if needed
        end

        -- Remove the ammo from the player to avoid duplication
        ply:RemoveAmmo(ammoCount, primaryAmmoType)

        -- Physics impulse
        local phys = dropped:GetPhysicsObject()
        if IsValid(phys) then
            phys:Wake()
            phys:ApplyForceCenter(VectorRand() * 100)
        end

        angleOffset = angleOffset + 45
    end
end

concommand.Add("drop_my_weapons", function(ply)
    DropAllWeapons(ply)
end)