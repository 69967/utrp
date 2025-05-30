function calcbleed(ply, hpl, hp)

	local sid = ply:SteamID64()
	ply.hp, ply.cbl = ply.hp or hp, ply.cbl or hpl

	if timer.Exists("BleedT" .. sid) then
		ply.cbl = ply.cbl + hpl
	else
		timer.Create("BleedT" .. sid, 10, 0, function()
			local tr = util.TraceLine({
				start = ply:EyePos() + Vector(30,0,0),
				endpos = ply:GetPos() + Vector(0,0,-1000),
				mask = MASK_NPCWORLDSTATIC
			})

			if ply.cbl > 10 then
				ply:SetHealth(ply.hp - ply.cbl*0.1)
				ply.cbl = ply.cbl - 4
				util.Decal("Blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal) --TODO replace with bloodstain ent
			else
				timer.Remove("BleedT" .. sid())
			end
		end)
	end
end

local dtb = bit.bor(DMG_BULLET, DMG_BUCKSHOT, DMG_BLAST, DMG_SLASH, DMG_CLUB)
local dtmap = {
	[DMG_BULLET] = { ab = nil, apen = nil, dtype = 1 },
	[DMG_BUCKSHOT] = { ab = 0.25, apen = 0.25, dtype = 2 },
	[DMG_BLAST] = { ab = 0.33, apen = 0.75, dtype = 3 },
	[DMG_SLASH] = { ab = 0.1, apen = 0, dtype = 4 },
	[DMG_CLUB] = { ab = 0.1, apen = 0.33, dtype = 0 }
}		

hook.Add("ScalePlayerDamage", "utrpdam", function(ply, hitgroup, dmginfo)
	local ent = dmginfo:GetInflictor()
	local a, hp, ap, dmg, apen, b, hpl, wep, ab, dtype = ent:Alive(), ply:Health(), ply:Armor(), dmginfo:GetDamage(), 0, 0

	if a and ap > 0 and not dmginfo:IsDamageType(dtb) and not (hitgroup == 0 or hitgroup == 2 or hitgroup == 3) then 
		ply:SetHealth(hp - dmg)
	else
		if a then
			wep = ent:GetActiveWeapon()
			ab = wep:GetValue("ArmorBonus")
			apen = wep:GetValue("ArmorPenetration")
		end

		for dtkey, data in pairs(dtmap) do
			if dmginfo:IsDamageType(dtkey) then
				ab = data.ab or ab
				apen = data.apen
				dtype = data.dtype
				break
			end
		end

		if dtype == 1 and ap*3 < ab*50 then
			apen = 0.5
		else
			if hitgroup == 2 then
				dmg = dmg*0.6667 --inverts 1.5x dmgmult on chest
			end
		end

		ply:SetArmor(math.max(ap - dmg * ab, 0))
		ply:SetHealth(hp - dmg * apen)
		if ap > 0 then b=3 end
	end

	hpl = dmg
	ply:SetBloodColor(b)
	dmginfo:SetDamage(0)

	if hpl < 20 then return else calcbleed(ply, hpl, hp) end
end)

--[[
local startTime = SysTime() --beginning of hook
print("EntityTakeDamage hook took " .. (SysTime() - startTime) .. " seconds to run.") --before "end)"
Convert to seconds to miliseconds	https://www.convertworld.com/en/time/seconds.html
]]

hook.Add("DoPlayerDeath", "TacRP_DropGrenade", function(ply, attacker, dmginfo)

		for _, wep in ipairs( ply:GetWeapons() ) do
		if not wep.ArcticTacRP then continue end
		
			ply:DropWeapon( wep, Vector(0.05, 5, -1.7), Vector(0.01, 2, -1.7))
		end 

    local wep = ply:GetActiveWeapon()
    if !IsValid(wep) or !wep.ArcticTacRP or !wep:GetPrimedGrenade() then return end
	if wep then TacRP.DropWeapon(wep) end
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

--[[ See how fast your/tacrp's functions are

local start = SysTime()
for i = 1, 10000 do
    -- Run hook code here
end
print("Time: ", (SysTime() - start) * 1000, "ms")

]]



--[[ TODO Damage count for bleed timers

	local tdam = hdmg or dmg
	if tdam > 10 and timer.exists == false then
	timer.create("bleedtimer" ..ply:SteamID64()), 6, 5 function())
		if tdam then 
			dmginfo:SetDamage(tdam / 5)
			tdam - 5

	for _, weptbl in pairs(weapons.GetList()) do
    if weptbl.ArcticTacRP then
        print(weptbl.ClassName, weptbl.HolsterPos) -- may just be Vector(0,0,0) unless set
    end
end

]]

--[[ TODO salvage some of this code to make ammunition drop into james inventory
	 Should be: [however much ammo they have - clipsize1, clipsize 2] grabbbed by for loop and placed in inventory

if not TacRP.AttachmentLookup then
    TacRP.AttachmentLookup = {}
    for id, data in pairs(TacRP.Attachments_Index) do
        TacRP.AttachmentLookup[data.ID] = id
    end
end

local function HasAttachments(wep)
    local attachments = wep:GetValue("Attachments")
    if not attachments then return false end

    for _, att in pairs(attachments) do
        if istable(att) and att.Installed and att.Installed ~= "" then
            return true
        end
    end

    return false
end

local function DropAllTacRPWeaponsWithAttachments(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end

    for _, wep in ipairs(ply:GetWeapons()) do
        if not wep.ArcticTacRP then continue end
        if not HasAttachments(wep) then continue end

        local class = wep:GetClass()
        local weptbl = weapons.Get(class)
        if not weptbl then continue end

        local holPos = weptbl.HolsterPos or Vector(0, 0, 0)
        local holAng = weptbl.HolsterAng or Angle(0, 0, 0)

        local worldAng = ply:EyeAngles()
        worldAng:RotateAroundAxis(worldAng:Up(), holAng.y)
        worldAng:RotateAroundAxis(worldAng:Right(), holAng.p)
        worldAng:RotateAroundAxis(worldAng:Forward(), holAng.r)

        local dropPos = ply:GetPos() + holPos + worldAng:Forward() * 10

        local clip1 = wep:Clip1()
        local clip2 = wep:Clip2()
        local ammoType = wep:GetPrimaryAmmoType()
        local ammoCount = ply:GetAmmoCount(ammoType)

        local savedAttachments = table.Copy(wep:GetValue("Attachments"))

        -- Strip weapon
        ply:StripWeapon(class)
        ply:RemoveAmmo(ammoCount, ammoType)

        local dropped = ents.Create(class)
        if not IsValid(dropped) then continue end

        dropped:SetPos(dropPos)
        dropped:SetAngles(worldAng)
        dropped:Spawn()

        if dropped:IsWeapon() then
            dropped:SetClip1(clip1)
            dropped:SetClip2(clip2)
            dropped:SetNWInt("DroppedAmmo", ammoCount)

            -- Reapply attachments properly
            for slot, att in pairs(savedAttachments) do
                if istable(att) and att.Installed and att.Installed ~= "" then
                    local index = TacRP.AttachmentLookup[att.Installed]
                    if index then
                        dropped:Attach(slot, index, true)
                    else
                        print("[TacRP] Warning: Unknown attachment ID", att.Installed)
                    end
                end
            end
        end

        local phys = dropped:GetPhysicsObject()
        if IsValid(phys) then
            phys:Wake()
            phys:ApplyForceCenter(VectorRand() * 100)
        end
    end
end

concommand.Add("drop_tacrp_attached_weapons", function(ply)
    DropAllTacRPWeaponsWithAttachments(ply)
end)

]]