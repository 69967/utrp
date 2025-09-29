-- File: lua/autorun/client/cl_ammo_drop_menu.lua

surface.CreateFont("AmmoDropTitle", {
    font = "Roboto",
    size = 24,
    weight = 600,
    antialias = true,
})

surface.CreateFont("AmmoDropText", {
    font = "Roboto",
    size = 18,
    weight = 500,
    antialias = true,
})

surface.CreateFont("AmmoDropButton", {
    font = "Roboto",
    size = 16,
    weight = 500,
    antialias = true,
})

local alreadydrawn = false
local frame = nil

-- Function to get player's ammo data
local function GetAmmoData()
    local ply = LocalPlayer()
    local ammos = ply:GetAmmo()
    local ammoData = {}

    for k, v in pairs(ammos) do
        if v > 0 then
            table.insert(ammoData, {
                index = k,
                name = game.GetAmmoName(k),
                count = v,
                max = game.GetAmmoMax(k) or 9999
            })
        end
    end

    return ammoData
end

-- Function to create or refresh the ammo drop menu
function CreateAmmoDropMenu()
    local ply = LocalPlayer()

    -- Prevent multiple menus
    if alreadydrawn or not IsValid(ply) then return end
    alreadydrawn = true

    -- Get player's ammo
    local ammoData = GetAmmoData()

    -- Don't open menu if player has no ammo
    if #ammoData == 0 then
        alreadydrawn = false
        return
    end

    -- Create or reuse main frame
    if not IsValid(frame) then
        frame = vgui.Create("DFrame")
		frame:SetName("AM")
        frame:SetSize(295, 495)
        frame:SetPos(ScrW() - 300, ScrH() - 790)
        frame:SetTitle("")
        frame:SetDraggable(false)
        frame:ShowCloseButton(false)
        frame:SetAlpha(0)
        frame:AlphaTo(225, 0, 0)

        frame.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(0, 30, 35, 250))
        end

        -- Close frame and reset alreadydrawn when closed
        frame.OnClose = function()
            alreadydrawn = false
            frame = nil
        end
    end

    -- Clear existing content in scroll panel
    if IsValid(frame.scroll) then
        frame.scroll:Remove()
    end

    -- Create scroll panel for ammo list
    local scroll = vgui.Create("DScrollPanel", frame)
    frame.scroll = scroll
    scroll:SetSize(295, 485)
    scroll:SetPos(0, 5)

    -- Style the scrollbar
    local sbar = scroll:GetVBar()
    sbar:SetWide(8)
    sbar.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(50, 50, 55, 100))
    end
    sbar.btnUp.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(255, 100, 100, 150))
    end
    sbar.btnDown.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(255, 100, 100, 150))
    end
    sbar.btnGrip.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, self:IsHovered() and Color(233, 233, 233, 200) or Color(200, 200, 200, 150))
    end

    -- Create ammo panels
    for _, ammo in ipairs(ammoData) do
        local ammoPanel = vgui.Create("DPanel")
        ammoPanel:SetSize(280, 53)
        ammoPanel:Dock(TOP)
        ammoPanel:DockMargin(0, 0, 0, 5)

        ammoPanel.Paint = function(self, w, h)
            local bgColor = self:IsHovered() and Color(60, 55, 50, 225) or Color(30, 30, 45, 225)
            draw.RoundedBox(6, 0, 0, w, h, bgColor)

            -- Ammo name
            draw.SimpleText(ammo.name, "AmmoDropText", 69, 40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            -- Ammo count
            local countText = ammo.count .. " / " .. ammo.max
            draw.SimpleText(countText, "AmmoDropButton", 5, 40, Color(255, 255, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        ammoPanel.IsHovered = function(self)
            local x, y = self:CursorPos()
            return x >= 0 and y >= 0 and x <= self:GetWide() and y <= self:GetTall()
        end

        -- Drop amount slider
        local slider = vgui.Create("DNumSlider", ammoPanel)
        slider:SetPos(60, -4)
        slider:SetSize(220, 35)
        slider:SetText("")
        slider:SetMin(1)
        slider:SetMax(ammo.count)
        slider:SetDecimals(0)
        slider:SetValue(math.min(1, ammo.count))

        -- Style the slider
        slider.Label:SetVisible(false)
        slider.TextArea:SetFont("AmmoDropButton")
        slider.TextArea:SetTextColor(Color(255, 255, 255))
        slider.TextArea.Paint = function(self, w, h)
            self:DrawTextEntryText(Color(255, 255, 255), Color(100, 100, 255), Color(255, 255, 255))
        end

        -- Drop button
        local dropBtn = vgui.Create("DButton", ammoPanel)
        dropBtn:SetPos(5, 8)
        dropBtn:SetSize(40, 25)
        dropBtn:SetText("")

        dropBtn.Paint = function(self, w, h)
            local bgColor = Color(0, 150, 10, 200)
            if self:IsHovered() then
                bgColor = Color(0, 110, 5, 255)
            end
            if self:IsDown() then
                bgColor = Color(80, 120, 80, 255)
            end
            draw.RoundedBox(3, 0, 0, w, h, bgColor)
            draw.SimpleText("DROP", "AmmoDropButton", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        dropBtn.DoClick = function()
            local dropAmount = math.floor(slider:GetValue())
            if dropAmount > 0 and dropAmount <= ammo.count then
                -- Send drop request to server
                net.Start("RequestAmmoDrop")
                net.WriteInt(ammo.index, 16)
                net.WriteInt(dropAmount, 32)
                net.SendToServer()

                surface.PlaySound("items/ammocrate_open.wav")

                -- Update ammo count
                ammo.count = math.max(0, ammo.count - dropAmount)
                slider:SetMax(ammo.count)
                slider:SetValue(math.min(1, ammo.count))

                -- Close menu if no ammo left
                if #GetAmmoData() == 0 then
                    frame:Close()
                    alreadydrawn = false
                end
            end
        end

        scroll:AddItem(ammoPanel)
    end

    -- Key press to close menu
    hook.Add("Think", "CheckKeyC", function()
        if input.IsKeyDown(KEY_C) and alreadydrawn then
            frame:Close()
            alreadydrawn = false
            hook.Remove("Think", "CheckKeyC")
        end
    end)
end

-- Bind to C key
hook.Add("PlayerButtonDown", "AmmoDropMenuOpen", function(ply, button)
    if button == KEY_C and IsFirstTimePredicted() then
        CreateAmmoDropMenu()
    end
end)

-- Alternative: Use concommand
concommand.Add("ammo_drop_menu", CreateAmmoDropMenu)