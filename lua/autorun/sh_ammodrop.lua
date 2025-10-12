-- Complete Ammo Drop System
-- Place this in lua/autorun/server/sv_ammo_drop.lua

AddCSLuaFile()

-- Network strings for interaction menu
if SERVER then
    util.AddNetworkString("imenu_ammodrop")
    util.AddNetworkString("iaction_ammodrop")
end

-- Custom ammo box entity
local ENT = {}
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.PrintName = "Ammo Box"
ENT.Category = "Tactical RP"
ENT.Spawnable = false
ENT.Model = "models/props_junk/cardboard_box004a.mdl"
ENT.ItemName = "Ammo Box"
ENT.Maxamount = 9999
ENT.CollisionSounds = {
    "physics/plaster/ceiling_tile_step1.wav",
    "physics/plaster/ceiling_tile_step2.wav",
    "physics/plaster/ceiling_tile_step3.wav",
    "physics/plaster/ceiling_tile_step4.wav"
}

function ENT:Initialize()
    self:SetModel(self.Model)
    
    if SERVER then
        self:SetMaterial("")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetUseType(SIMPLE_USE)
        self:PhysWake()
        
        -- Default values
        self.AmmoType = self.AmmoType or "pistol"
        self.AmmoName = self.AmmoName or "Unknown Ammo"
        self.amountRemaining = self.amountRemaining or 0
        self.Maxamount = self.Maxamount or 9999
        self.NextUse = 0
        
        -- Set networked vars
        self:SetNWString("AmmoType", tostring(self.AmmoType))
        self:SetNWString("AmmoName", self.AmmoName)
        self:SetNWInt("amount", self.amountRemaining)
        
        print("[Ammo Drop] Ammo box initialized with " .. self.amountRemaining .. " " .. self.AmmoName)
    end
    
    self.BaseClass.Initialize(self)
end

function ENT:PhysicsCollide(data)
    if data.DeltaTime < 0.1 or data.Speed < 25 then return end
    self:EmitSound(self.CollisionSounds[math.random(4)])
end

function ENT:Use(activator, caller)
    if not IsValid(activator) or not activator:IsPlayer() then 
        print("[Ammo Drop] Invalid activator for use")
        return 
    end
    
    -- Check if player is holding walk key for menu
    if activator:KeyDown(IN_WALK) then
        net.Start("imenu_ammodrop")
        net.WriteEntity(self)
        net.Send(activator)
        return
    end
    
    -- Otherwise, try to pick up the entity
    if CurTime() < self.NextUse then 
        print("[Ammo Drop] Use on cooldown")
        return 
    end
    
    print("[Ammo Drop] " .. activator:Name() .. " is using ammo box with " .. self.amountRemaining .. " " .. self.AmmoName)
    
    self.NextUse = CurTime() + 1.2
    
    if self.amountRemaining <= 0 then
        print("[Ammo Drop] Ammo box is empty")
        return
    end
    
    local currentAmmo = activator:GetAmmoCount(self.AmmoType)
    local maxAmmo = game.GetAmmoMax(self.AmmoType) or 9999
    
    if currentAmmo >= maxAmmo then
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. maxAmmo .. "/" .. maxAmmo .. "]")
        return
    end
    
    local ammoToGive = math.min(10, self.amountRemaining)
    local spaceAvailable = maxAmmo - currentAmmo
    ammoToGive = math.min(ammoToGive, spaceAvailable)
    
    if ammoToGive <= 0 then
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. currentAmmo .. "/" .. maxAmmo .. "]")
        return
    end
    
    local oldAmmo = activator:GetAmmoCount(self.AmmoType)
    activator:GiveAmmo(ammoToGive, self.AmmoType)
    local newAmmo = activator:GetAmmoCount(self.AmmoType)
    local actualGiven = newAmmo - oldAmmo
    
    print("[Ammo Drop] Gave " .. actualGiven .. " ammo (requested " .. ammoToGive .. "), player now has " .. newAmmo .. "/" .. maxAmmo)
    
    if actualGiven > 0 then
        activator:EmitSound("items/ammo_pickup.wav")
        activator:ChatPrint("Picked up " .. actualGiven .. " " .. self.AmmoName .. " [" .. newAmmo .. "/" .. maxAmmo .. "]")
        
        self.amountRemaining = self.amountRemaining - actualGiven
        self:SetNWInt("amount", self.amountRemaining)
        
        if self.amountRemaining <= 0 then
            print("[Ammo Drop] Ammo box depleted, removing")
            self:Remove()
        end
    else
        activator:ChatPrint("Cannot carry more " .. self.AmmoName .. " [" .. currentAmmo .. "/" .. maxAmmo .. "]")
    end
end

-- Consume item function (for menu use)
function ENT:ConsumeItem(p)
    if not IsValid(p) or not p:IsPlayer() then return end
    
    if self.amountRemaining <= 0 then
        p:ChatPrint("Ammo box is empty!")
        return
    end
    
    local currentAmmo = p:GetAmmoCount(self.AmmoType)
    local maxAmmo = game.GetAmmoMax(self.AmmoType) or 9999
    local spaceAvailable = maxAmmo - currentAmmo
    
    if spaceAvailable <= 0 then
        p:ChatPrint("You're already carrying max ammo!")
        return
    end
    
    local ammoToGive = math.min(10, self.amountRemaining, spaceAvailable)
    local oldAmmo = p:GetAmmoCount(self.AmmoType)
    p:GiveAmmo(ammoToGive, self.AmmoType)
    local newAmmo = p:GetAmmoCount(self.AmmoType)
    local actualGiven = newAmmo - oldAmmo
    
    if actualGiven > 0 then
        p:EmitSound("items/ammo_pickup.wav")
        p:ChatPrint("Picked up " .. actualGiven .. " " .. self.AmmoName .. " [" .. newAmmo .. "/" .. maxAmmo .. "]")
        
        self.amountRemaining = self.amountRemaining - actualGiven
        self:SetNWInt("amount", self.amountRemaining)
        
        if self.amountRemaining <= 0 then
            self:Remove()
        end
    end
end

-- Split function
function ENT:Split(p, n)
    if n <= 0 or n >= self.amountRemaining then return end
    
    local e = ents.Create("custom_ammo_box")
    if not IsValid(e) then return end
    
    e:SetPos(self:GetPos() + Vector(0, 0, 15))
    e.AmmoType = self.AmmoType
    e.AmmoName = self.AmmoName
    e.amountRemaining = n
    e.Maxamount = self.Maxamount
    e:Spawn()
    
    e:SetNWString("AmmoType", tostring(self.AmmoType))
    e:SetNWString("AmmoName", self.AmmoName)
    e:SetNWInt("amount", n)
    e:SetColor(self:GetColor())
    
    self.amountRemaining = self.amountRemaining - n
    self:SetNWInt("amount", self.amountRemaining)
    
    p:EmitSound("physics/body/body_medium_impact_soft2.wav")
end

-- Combine function
function ENT:Combine(p)
    local totalCombined = 0
    
    -- Find all nearby ammo boxes with the same AmmoType
    for _, e in ipairs(ents.FindInSphere(self:GetPos(), 100)) do
        if e ~= self and e:GetClass() == "custom_ammo_box" and e.AmmoType == self.AmmoType then
            -- Check if this box has room for more ammo
            if self.amountRemaining < self.Maxamount then
                -- Calculate how much we can take from the other box
                local spaceAvailable = self.Maxamount - self.amountRemaining
                local amountToTake = math.min(e.amountRemaining, spaceAvailable)
                
                -- Transfer ammo
                self.amountRemaining = self.amountRemaining + amountToTake
                e.amountRemaining = e.amountRemaining - amountToTake
                
                -- Update networked vars
                e:SetNWInt("amount", e.amountRemaining)
                totalCombined = totalCombined + amountToTake
                
                -- Remove the other box if it's empty
                if e.amountRemaining <= 0 then
                    e:Remove()
                end
                
                -- Stop if we've reached max capacity
                if self.amountRemaining >= self.Maxamount then
                    break
                end
            end
        end
    end
    
    -- Update this box's networked var
    self:SetNWInt("amount", self.amountRemaining)
    
    if totalCombined > 0 then
        p:EmitSound("items/ammopickup.wav")
        p:ChatPrint("Combined " .. totalCombined .. " " .. self.AmmoName .. " into this box!")
    else
        p:ChatPrint("No nearby " .. self.AmmoName .. " boxes to combine!")
    end
end

-- Network receive for menu actions
if SERVER then
    net.Receive("iaction_ammodrop", function(len, p)
        local e = net.ReadEntity()
        local action = net.ReadUInt(2)
        local value = net.ReadUInt(8)
        
        if not IsValid(e) or not IsValid(p) then return end
        
        if action == 0 then
            e:ConsumeItem(p)
        elseif action == 1 then
            e:Split(p, value)
        elseif action == 2 then
            e:Combine(p)
        end
    end)
end

-- Client-side rendering and menu
if CLIENT then
    surface.CreateFont("ammoinbox", {
        font = "Arial",
        size = 200,
        weight = 500,
        antialias = true,
    })
    
    function ENT:Draw()
        self:DrawModel()
        
        local ang = self:GetAngles()
        ang:RotateAroundAxis(self:GetUp(), 90)
        ang:RotateAroundAxis(self:GetRight(), 0)
        ang:RotateAroundAxis(self:GetForward(), 0)
        
        local pos = self:GetPos()
        pos = pos + self:GetForward() * -5.2
        pos = pos + self:GetRight() * 2.5
        pos = pos + self:GetUp() * 4.05
        
        local resolution = 9
        local ammoType = self:GetNWString("AmmoName", "Unknown Ammo")
        local ammoCount = tostring(self:GetNWInt("amount", 0))
        
        cam.Start3D2D(pos, ang, 0.08 / resolution)
            surface.SetFont("ammoinbox")
            
            local tW1, tH1 = surface.GetTextSize(ammoType)
            local tW2, tH2 = surface.GetTextSize(ammoCount)
            
            if tW1 and tH1 then
                draw.SimpleText(ammoType, "ammoinbox", -tW1 / 2 + 285, -7, Color(255, 255, 255, 255))
                
                if tW2 and tH2 then
                    draw.SimpleText(ammoCount, "ammoinbox", -tW2 / 2 + 285, -7 + tH1 + 5, Color(255, 255, 0, 255))
                end
            end
        cam.End3D2D()
    end
    
    -- Menu system
    net.Receive("imenu_ammodrop", function()
        local e = net.ReadEntity()
        if not IsValid(e) then return end
        local d = e:GetNWInt("amount", 0)
        
        local f = vgui.Create("DFrame")
        f:SetSize(233, d > 1 and 225 or 165)
        f:SetPos(ScrW() * 0.433, ScrH() * 0.775)
        f:SetTitle("")
        f:SetDraggable(false)
        f:ShowCloseButton(false)
        f:MakePopup()
        f.Paint = function(s, w, h) draw.RoundedBox(8, 0, 0, w, h, Color(0, 30, 35, 225)) end
        
        local l = vgui.Create("DLabel", f)
        l:SetPos(10, 8)
        l:SetSize(213, 15)
        l:SetText(e:GetNWString("AmmoName", "Ammo Box"))
        l:SetFont("ChatFont")
        l:SetContentAlignment(5)
        
        local btns = {
            {"EXIT [X]", 32, function() f:Close() end, nil},
            {"USE [E]", 67, function() 
                net.Start("iaction_ammodrop") 
                net.WriteEntity(e) 
                net.WriteUInt(0, 2) 
                net.WriteUInt(0, 8) 
                net.SendToServer() 
                f:Close() 
            end, nil},
            {"COMBINE [D]", 110, function() 
                net.Start("iaction_ammodrop") 
                net.WriteEntity(e) 
                net.WriteUInt(2, 2) 
                net.WriteUInt(0, 8) 
                net.SendToServer() 
                f:Close() 
            end, Color(80, 120, 160, 50)}
        }
        
        for _, b in ipairs(btns) do
            local btn = vgui.Create("DButton", f)
            btn:SetPos(30, b[2])
            btn:SetSize(175, b[2] == 32 and 22 or 30)
            btn:SetText(b[1])
            if b[4] then
                btn.Paint = function(s, w, h)
                    draw.RoundedBox(6, 0, 0, w, h, s:IsHovered() and ColorAlpha(b[4], 75) or b[4])
                end
            end
            btn.DoClick = function() b[3]() surface.PlaySound("buttons/button14.wav") end
        end
        
        if d > 1 then
            local sb = vgui.Create("DButton", f)
            sb:SetPos(30, 150)
            sb:SetSize(175, 60)
            sb:SetText("SPLIT [C]")
            sb.Paint = function(s, w, h) 
                draw.RoundedBox(6, 0, 0, w, h, s:IsHovered() and Color(90, 120, 80, 75) or Color(90, 120, 80, 50)) 
            end
            
            local sl = vgui.Create("DNumSlider", sb)
            sl:SetPos(-108, 35)
            sl:SetSize(300, 30)
            sl:SetMin(1)
            sl:SetMax(d - 1)
            sl:SetDecimals(0)
            sl:SetValue(1)
            
            sb.DoClick = function()
                local v = math.floor(sl:GetValue())
                net.Start("iaction_ammodrop") 
                net.WriteEntity(e) 
                net.WriteUInt(1, 2) 
                net.WriteUInt(v, 8) 
                net.SendToServer()
                f:Close()
                surface.PlaySound("buttons/button14.wav")
            end
            f.sl = sl
        end
        
        f.OnKeyCodePressed = function(s, k)
            local actions = {
                [KEY_X] = function() f:Close() end,
                [KEY_E] = function() 
                    net.Start("iaction_ammodrop") 
                    net.WriteEntity(e) 
                    net.WriteUInt(0, 2) 
                    net.WriteUInt(0, 8) 
                    net.SendToServer() 
                    f:Close() 
                end,
                [KEY_D] = function() 
                    net.Start("iaction_ammodrop") 
                    net.WriteEntity(e) 
                    net.WriteUInt(2, 2) 
                    net.WriteUInt(0, 8) 
                    net.SendToServer() 
                    f:Close() 
                end,
                [KEY_C] = d > 1 and function()
                    if f.sl then
                        net.Start("iaction_ammodrop") 
                        net.WriteEntity(e) 
                        net.WriteUInt(1, 2) 
                        net.WriteUInt(math.floor(f.sl:GetValue()), 8) 
                        net.SendToServer()
                        f:Close()
                    end
                end or nil
            }
            if actions[k] then actions[k]() surface.PlaySound("buttons/button14.wav") end
        end
    end)
end

scripted_ents.Register(ENT, "custom_ammo_box")

-- Function to create ammo box entity
function CreateAmmoBox(ammo_type, ammo_name, amount, pos)
    local ent = ents.Create("custom_ammo_box")
    if not IsValid(ent) then 
        print("[Ammo Drop] Failed to create custom_ammo_box")
        return nil 
    end
    
    -- Set data before spawning
    ent.AmmoType = ammo_type
    ent.AmmoName = ammo_name
    ent.amountRemaining = amount
    ent.Maxamount = 9999
    
    ent:SetPos(pos + Vector(math.random(-40, 40), math.random(-40, 40), 20))
    ent:SetAngles(Angle(0, math.random(0, 360), 0))
    ent:Spawn()
	
    ent:SetColor(Color(150, 150, 150, 150)) 
    
    -- Set networked vars for client display
    ent:SetNWString("AmmoType", tostring(ammo_type))
    ent:SetNWString("AmmoName", ammo_name)
    ent:SetNWInt("amount", amount)
    ent:SetNWBool("IsCustomAmmoBox", true)
    
    -- Add some physics motion
    timer.Simple(0.1, function()
        if IsValid(ent) then
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocity(Vector(math.random(-80, 80), math.random(-80, 80), math.random(50, 120)))
                phys:AddAngleVelocity(Vector(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
            end
        end
    end)
    
    return ent
end

-- Hook for dropping ammo on player death
hook.Add("PlayerDeath", "ammochecks", function(ply)
    local ammos = ply:GetAmmo()
    local ammoindex = {}
    local pos = ply:GetPos()
    
    for k, v in pairs(ammos) do
        if v > 0 then
            table.insert(ammoindex, {
                ammoname = game.GetAmmoName(k),
                ammocount = v,
                ammotype = k
            })
        end
    end
    
    if ammoindex and next(ammoindex) then
        print("[Ammo Drop] Player " .. ply:Name() .. " dropped:")
        for _, aidata in ipairs(ammoindex) do 
            print("  " .. aidata.ammoname .. ": " .. aidata.ammocount)
        end
    end
    
    for i, data in ipairs(ammoindex) do
        CreateAmmoBox(data.ammotype, data.ammoname, data.ammocount, pos)
    end
end)

-- Test command for admins to test the system
concommand.Add("drop_my_ammo", function(ply, cmd, args)
    if not IsValid(ply) or not ply:IsAdmin() then return end
    
    local ammos = ply:GetAmmo()
    local pos = ply:GetPos()
    local dropped = 0
    
    for k, v in pairs(ammos) do
        if v > 0 then
            local ammoname = game.GetAmmoName(k)
            local box = CreateAmmoBox(k, ammoname, v, pos)
            if IsValid(box) then
                ply:RemoveAmmo(v, k)
                dropped = dropped + 1
            end
        end
    end
    
    ply:ChatPrint("Dropped " .. dropped .. " ammo types!")
end)