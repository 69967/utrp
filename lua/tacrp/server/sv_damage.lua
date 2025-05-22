hook.Add("EntityTakeDamage", "armordam", function(ply, dmginfo)
    if not TacRP.ConVars["armorpenetration"] or not ply:IsPlayer() or ply:Armor() == 0 or
       dmginfo:GetDamage() < 1 or not dmginfo:IsDamageType(DMG_BULLET + DMG_BUCKSHOT + DMG_BLAST + DMG_SLASH + DMG_CLUB) then
        return
    end

    local ent = dmginfo:GetInflictor()
	local wep = nil
	local ab = nil
    if ent:Alive() then wep = ent:GetActiveWeapon() ab = wep:GetValue("ArmorBonus") end print(ab)
    local dmg = dmginfo:GetDamage()
	local gdmg = 0
    local ap, hp, hg = ply:Armor(), ply:Health(), ply:LastHitGroup()

    if ent:Alive() and hg ~= 0 and hg ~= 2 and hg ~= 3 then
        ply:SetHealth(hp - dmg)
    else
        local dtype = dmginfo:IsDamageType(DMG_BULLET) and 1 or
                      dmginfo:IsDamageType(DMG_BUCKSHOT) and 2 or
                      dmginfo:IsDamageType(DMG_BLAST) and 3 or
                      dmginfo:IsDamageType(DMG_SLASH) and 4 or 0
        if dtype == 1 then
            if ap+ap < ab * 20 then
                gdmg = ab * 4
                apen = dmg*0.015
				dmg = 0
            else
                gdmg = ab * 4
                apen = 0
				dmg = 0
            end
        elseif dtype == 2 then
            ab = 0.25
            apen = 0.25
        elseif dtype == 3 then
            ab = 0.33
            apen = 0.75
        elseif dtype == 4 then
            ab = 0.1
            apen = 0
        else
            ab = 0.1
            apen = 0.33
        end
		ply:SetArmor(ap - dmg * ab and ap - gdmg or 0)
        ply:SetHealth(hp - dmg * apen)
    end
    dmginfo:SetDamage(0)
end)

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