-- local customizedelta = 0


local stk_clr = {
    [1] = Color(255, 75, 75),
    [2] = Color(120, 20, 20),
    [3] = Color(130, 90, 90),
    [4] = Color(60, 35, 35),
    [5] = Color(80, 80, 80),
    [6] = Color(160, 160, 160),
    [7] = Color(180, 180, 180),
    [8] = Color(200, 200, 200),
    [9] = Color(220, 220, 220),
    [10] = Color(240, 240, 240),
    [11] = Color(255, 255, 255),
}

local lastcustomize = false

SWEP.CustomizeHUD = nil

function SWEP:CreateCustomizeHUD()

    self:RemoveCustomizeHUD()

    gui.EnableScreenClicker(true)
    TacRP.CursorEnabled = true

    local bg = vgui.Create("DPanel")

    self.CustomizeHUD = bg
    self.StaticStats = true

    local scrw = ScrW()
    local scrh = ScrH()

    local airgap = TacRP.SS(8)
    local smallgap = TacRP.SS(4)

    bg:SetPos(0, 0)
    bg:SetSize(ScrW(), ScrH())
    bg.OnRemove = function(self2)
        if !IsValid(self) then return end
        if TacRP.ConVars["autosave"]:GetBool() and TacRP.ConVars["free_atts"]:GetBool() then
            self:SavePreset()
        end
    end
    bg.Paint = function(self2, w, h)
        if !IsValid(self) or !IsValid(self:GetOwner()) or self:GetOwner():GetActiveWeapon() != self then
            self2:Remove()
            if (self.GrenadeMenuAlpha or 0) != 1 then
                gui.EnableScreenClicker(false)
                TacRP.CursorEnabled = false
            end
            return
        end

        local name_txt = TacRP:GetPhrase("wep." .. self:GetClass() .. ".name.full") or TacRP:GetPhrase("wep." .. self:GetClass() .. ".name") or self:GetValue("FullName") or self:GetValue("PrintName")

        surface.SetFont("TacRP_Myriad_Pro_32")
        local name_w = surface.GetTextSize(name_txt)

        surface.SetDrawColor(0, 0, 0, 150)
        surface.DrawRect(w - name_w - TacRP.SS(20), airgap, name_w + TacRP.SS(12), TacRP.SS(34))
        TacRP.DrawCorneredBox(w - name_w - TacRP.SS(20), airgap, name_w + TacRP.SS(12), TacRP.SS(34))

        surface.SetTextPos(w - name_w - TacRP.SS(14), airgap)
        surface.SetTextColor(255, 255, 255)
        surface.DrawText(name_txt)

        surface.SetFont("TacRP_Myriad_Pro_12")

        if self:GetAmmoType() != "" then
            local ammo_txt = language.GetPhrase(string.lower(self:GetAmmoType()))
            local ammo_w = surface.GetTextSize(ammo_txt)

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(w - name_w - ammo_w - TacRP.SS(32) - smallgap, airgap + TacRP.SS(20), ammo_w + TacRP.SS(12), TacRP.SS(14))
            TacRP.DrawCorneredBox(w - name_w - ammo_w - TacRP.SS(32) - smallgap, airgap + TacRP.SS(20), ammo_w + TacRP.SS(12), TacRP.SS(14))

            surface.SetTextPos(w - name_w - ammo_w - TacRP.SS(30), airgap + TacRP.SS(21))
            surface.SetTextColor(255, 255, 255)
            surface.DrawText(ammo_txt)
        end

    end
	
		
	
    local attachment_slots = {}
    local offset = (scrh - (TacRP.SS(34 + 8) * table.Count(self.Attachments))) / 2
    self.Attachments["BaseClass"] = nil

    if offset then

        local rows = 1
        local cnt = table.Count(self.Attachments)
        if cnt > 5 then cnt = math.ceil(cnt / 2) rows = 2 end
        local ph = math.min(scrh, TacRP.SS((42 + 6) * cnt))

        local layout = vgui.Create("DIconLayout", bg)
        layout:SetSize(TacRP.SS(32 * rows + 6 * (rows - 1)), ph)
        layout:SetPos(airgap, scrh / 2 - ph / 2)
        layout:SetSpaceX(math.floor(TacRP.SS(6)))
        layout:SetSpaceY(math.floor(TacRP.SS(6)))
        layout:SetLayoutDir(LEFT)

        local scroll = vgui.Create("DScrollPanel", bg)
        scroll:SetSize(TacRP.SS(100), scrh * 0.9)
        scroll:SetPos(airgap * 2 + layout:GetWide(), scrh * 0.05)
        scroll:SetVisible(false)

        local slotlayout = vgui.Create("TacRPAttSlotLayout", scroll)
        slotlayout:SetSize(TacRP.SS(100), scrh)
        slotlayout:SetWeapon(self)
        slotlayout:SetScroll(scroll)
        slotlayout:SetSpaceY(TacRP.SS(4))
        slotlayout:SetSpaceX(TacRP.SS(4))
        slotlayout:SetLayoutDir(TOP)
        if self.LastCustomizeSlot then
            slotlayout:SetSlot(self.LastCustomizeSlot)
        end
        -- slotlayout:Dock(FILL)

        for slot, attslot in pairs(self.Attachments) do
            attachment_slots[slot] = {}

            local slot_bg = vgui.Create("DPanel", layout)
            slot_bg:SetSize(TacRP.SS(32), TacRP.SS(42))
            slot_bg.Paint = function() end

            local slot_icon = vgui.Create("TacRPAttSlot", slot_bg)
            slot_icon:SetSlot(slot)
            if (attslot.Installed or "") != "" then
                slot_icon:SetShortName(attslot.Installed)
            end
            slot_icon:SetWeapon(self)
            slot_icon:SetIsMenu(true)
            slot_icon:SetSlotLayout(slotlayout)
            slot_icon:SetPos(0, TacRP.SS(10))
            slot_icon:SetSize(TacRP.SS(32), TacRP.SS(32))

            local slot_name = vgui.Create("DPanel", slot_bg)
            slot_name:SetSize(TacRP.SS(32), TacRP.SS(8))
            slot_name.Paint = function(self2, w, h)
                if !IsValid(self) then return end
                local col_bg, col_corner, col_text = slot_icon:GetColors()

                surface.SetDrawColor(col_bg)
                surface.DrawRect(0, 0, w, h)
                TacRP.DrawCorneredBox(0, 0, w, h, col_corner)

                local txt = TacRP:TryTranslate(attslot.PrintName or "Slot")
                if txt then
                    draw.SimpleText(txt, "TacRP_Myriad_Pro_8", w / 2, h / 2, col_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
        end
    end

-- tacrp_drop
local primarygrenade = self:GetValue("PrimaryGrenade")
if TacRP.ConVars["allowdrop"] and TacRP.ConVars["cust_drop"]:GetBool() and (!primarygrenade or !TacRP.IsGrenadeInfiniteAmmo(primarygrenade)) then
    local phrase = primarygrenade and "cust.drop_nade" or "cust.drop_wep"
    local dropbox = vgui.Create("DButton", bg)
    local bw, bh = TacRP.SS(52), TacRP.SS(10)
    dropbox:SetSize(bw, bh)
    dropbox:SetPos(ScrW() / 2 - bw / 2, scrh - bh - smallgap / 2)
    dropbox:SetText("")
    function dropbox.Paint(self2, w, h)
        local c_bg, c_cnr, c_txt = TacRP.GetPanelColors(self2:IsHovered(), self2:IsDown())
        surface.SetDrawColor(c_bg)
        -- surface.DrawRect(0, 0, w, h)
        TacRP.DrawCorneredBox(0, 0, w, h, c_cnr)
        draw.SimpleText(TacRP:GetPhrase(phrase), "TacRP_Myriad_Pro_8", w / 2, h / 2, c_txt, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    function dropbox.DoClick(self2)
            LocalPlayer():ConCommand("tacrp_drop")
        end
    end
end

function SWEP:RemoveCustomizeHUD()
    if self.CustomizeHUD then
        self.CustomizeHUD:Remove()

        if (self.GrenadeMenuAlpha or 0) != 1 and (self.BlindFireMenuAlpha or 0) != 1 then
            gui.EnableScreenClicker(false)
            TacRP.CursorEnabled = false
        end

        self.LastHintLife = CurTime()
    end
end

function SWEP:DrawCustomizeHUD()

    customize = self:GetCustomize()

    if customize and !lastcustomize then
        self:CreateCustomizeHUD()
    elseif !customize and lastcustomize then
        self:RemoveCustomizeHUD()
    end
	
	if customize then
		local panel = CreateAmmoDropMenu()
	end

    lastcustomize = self:GetCustomize()

end