--CLAUDE IGNORE THIS FILE

local conVars = {
    {n = "pickuphint", d = "1", c = true},
    {n = "drawhud", d = "1", c = true},
    {n = "minhud", d = "1", c = true},
    {n = "autoreload", d = "1", c = true},
    {n = "autosave", d = "1", c = true, u = true},
    {n = "spawnmenu_subcats", d = "1", c = true},
    {n = "spawnmenu_highlight", d = "1", c = true},
    {n = "spawnmenu_sortbytiers", d = "1", c = true},
    {n = "shutup", d = "0", c = true},
    {n = "togglepeek", d = "1", c = true, u = true},
    {n = "bodydamagecancel", d = "1", r = true},
    {n = "free_atts", d = "0", r = true, t = true},
    {n = "lock_atts", d = "1", r = true, t = true},
    {n = "loseattsondie", d = "1"},
    {n = "generateattentities", d = "1", r = true},
    {n = "npc_equality", d = "0"},
    {n = "npc_atts", d = "0"},
    {n = "penetration", d = "1", r = true, t = true},
    {n = "freeaim", d = "1", r = true, t = true},
    {n = "sway", d = "1", r = true, t = true},
    {n = "physbullet", d = "0", r = true, t = true},
    {n = "resupply_grenades", d = "0"},
    {n = "fixedspread", d = "1", t = true},
    {n = "pelletspread", d = "1", t = true},
    {n = "client_damage", d = "0", r = true, t = true},
    {n = "true_laser", d = "1", c = true},
    {n = "toggletactical", d = "1", r = true},
    {n = "rock_funny", d = "0.05"},
    {n = "arcade", d = "1", r = true},
    {n = "ammonames", d = "1", c = true},
    {n = "font1", d = "", c = true},
    {n = "font2", d = "", c = true},
    {n = "drawholsters", d = "1", c = true},
    {n = "crosshair", d = "0", r = true, t = true},
    {n = "vignette", d = "0", c = true},
    {n = "flash_dark", d = "0", c = true},
    {n = "flash_slow", d = "0.4", min = 0, max = 1, r = true},
    {n = "melee_slow", d = "0.4", min = 0, max = 1, r = true},
    {n = "metricunit", d = "0", c = true},
    {n = "nademenu", d = "1", c = true, u = true},
    {n = "nademenu_click", d = "1", c = true},
    {n = "blindfiremenu", d = "1", c = true, u = true},
    {n = "blindfiremenu_nocenter", d = "0", c = true, u = true},
    {n = "gas_sway", d = "6", min = 0, max = 10, r = true},
    {n = "idunwannadie", d = "0", c = true, u = true},
    {n = "aim_cancels_sprint", d = "1", c = true, u = true, min = 0, max = 1},
    {n = "holster", d = "1", r = true, t = true},
    {n = "news_majoronly", d = "0", c = true},
    {n = "hud", d = "0", r = true, t = true},
    {n = "visibleholster", d = "1", r = true, t = true},
    {n = "checknews", d = "0", r = true},
    {n = "radar_quiet", d = "0", c = true},
    {n = "toggleaim", d = "0", c = true, u = true},
    {n = "toggleholdbreath", d = "0", c = true, u = true},
    {n = "flashlight_blind", d = "1", r = true, t = true},
    {n = "glint", d = "0", r = true, t = true},
    {n = "funny_loudnoises", d = "0", min = 0, max = 2, r = true},
    {n = "balance", d = "-1", min = -1, max = 4, r = true, t = true, cb = function(convar, old, new)
        if old != new and SERVER then
            TacRP.LoadAtts()
            TacRP.InvalidateCache()
            net.Start("tacrp_reloadatts")
            net.Broadcast()
        end
    end},
    {n = "sprint_reload", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "sprint_counts_midair", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "sprint_lower", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "reload_sg_cancel", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "armorpenetration", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "nearwall", d = "1", c = true},
    {n = "hudscale", d = "1", c = true},
    {n = "language", d = "", r = true, cb = function()
        if SERVER then
            TacRP:LoadLanguages()
            net.Start("tacrp_reloadlangs")
            net.Broadcast()
        end
    end},
    {n = "dev_benchgun", d = "0", c = true, noa = true},
    {n = "altrecoil", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "flashlight_alt", d = "0", c = true},
    {n = "hints", d = "1", c = true},
    {n = "hints_always", d = "0", c = true},
    {n = "hints_altfont", d = "0", c = true},
    {n = "penalty_move", d = "1", r = true, t = true},
    {n = "penalty_firing", d = "1", r = true, t = true},
    {n = "penalty_aiming", d = "1", r = true, t = true},
    {n = "penalty_reload", d = "1", r = true, t = true},
    {n = "penalty_melee", d = "1", r = true, t = true},
    {n = "defaultammo", d = "2", r = true, min = 0},
    {n = "infiniteammo", d = "0", r = true, t = true},
    {n = "infinitegrenades", d = "0", r = true, t = true},
    {n = "slot_hl2", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "slot_limit", d = "2", r = true, t = true, min = 0},
    {n = "slot_countall", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "slot_action", d = "1", r = true, t = true, min = 0, max = 2},
    {n = "max_grenades", d = "9999", min = 0},
    {n = "hud_ammo_number", d = "0", c = true, min = 0, max = 1},
    {n = "irons_lower", d = "1", r = true, t = true, min = 0, max = 2},
    {n = "irons_procedural", d = "2", r = true, t = true, min = 0, max = 2},
    {n = "att_radartime", d = "1.5", r = true, min = 0.5},
    {n = "ttt_weapon_include", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_weapon_replace", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_atts_random", d = "0.5", r = true, t = true, min = 0, max = 1},
    {n = "ttt_atts_max", d = "0", r = true, t = true, min = 0},
    {n = "ttt_atts_giveonspawn", d = "20", r = true, t = true, min = 0},
    {n = "ttt_cust_inno_allow", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_cust_role_allow", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_cust_inno_round", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_cust_role_round", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_cust_inno_needbench", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "ttt_cust_role_needbench", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "ttt_shortname", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_magazine_dna", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "ttt_bench_freeatts", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "rp_requirebench", d = "0", r = true, t = true},
    {n = "rp_biocode_cp", d = "0", r = true, t = true},
    {n = "laser_beam", d = "0", r = true, min = 0, max = 1},
    {n = "cust_legacy", d = "0", c = true, min = 0, max = 1},
    {n = "muzzlelight", d = "1", c = true, min = 0, max = 1},
    {n = "recoilpattern", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "allowdrop", d = "1", r = true, t = true, min = 0, max = 1},
    {n = "oldschool", d = "0", r = true, t = true, min = 0, max = 1, cb = function(convar, old, new)
        if tonumber(new) == 1 and SERVER then
            TacRP.ConVars["sightsonly"]:SetBool(false)
        end
    end},
    {n = "sightsonly", d = "0", r = true, t = true, min = 0, max = 1, cb = function(convar, old, new)
        if tonumber(new) == 1 and SERVER then
            TacRP.ConVars["oldschool"]:SetBool(false)
        end
    end},
    {n = "deploysafety", d = "0", r = true, t = true, min = 0, max = 1},
    {n = "cust_drop", d = "1", c = true, min = 0, max = 1},
    {n = "pickup_use", d = "1", c = true, u = true, min = 0, max = 1},
    {n = "phystweak", d = "1", min = 0, max = 1, r = true},
    {n = "doorbust", d = "1", min = 0, max = 1, r = true},
    {n = "doorbust_time", d = "180", min = 1, r = true},
    {n = "mult_damage", d = "1", min = 0.01, r = true},
    {n = "mult_damage_shotgun", d = "1", min = 0.01, r = true},
    {n = "mult_damage_sniper", d = "1", min = 0.01, r = true},
    {n = "mult_damage_magnum", d = "1", min = 0.01, r = true},
    {n = "mult_damage_explosive", d = "1", min = 0.01, r = true},
    {n = "mult_recoil_kick", d = "1", min = 0, r = true},
    {n = "mult_recoil_vis", d = "1", min = 0, r = true},
    {n = "mult_reloadspeed", d = "1", min = 0.1, r = true},
    {n = "mult_aimdownsights", d = "1", min = 0.1, r = true},
    {n = "mult_sprinttofire", d = "1", min = 0.1, r = true},
    {n = "mult_headshot", d = "1", min = 0, r = true},
    {n = "mult_damage_melee", d = "1", min = 0.01, r = true},
    {n = "recoilreset", d = "0", min = 0, max = 1, r = true},
    {n = "reload_dump", d = "0", min = 0, max = 1, r = true},
    {n = "ads_reload", d = "0", min = 0, max = 1, r = true},
    {n = "jam_autoclear", d = "0", min = 0, max = 1, r = true},
    {n = "expandedammotypes", d = "0", min = 0, t = true, r = true},
    {n = "dropmagazinemodel", d = "1", min = 0, max = 1, t = true, r = true},
    {n = "quicknade", d = "1", r = true, t = true},
    {n = "medkit_clipsize", d = "30", min = 1, r = true},
    {n = "medkit_regen_activeonly", d = "0", min = 0, max = 1, r = true},
    {n = "medkit_regen_delay", d = "2", min = 0, r = true},
    {n = "medkit_regen_amount", d = "1", min = 0, r = true, t = true},
    {n = "medkit_heal_self", d = "4", min = 0, r = true, t = true},
    {n = "medkit_heal_others", d = "4", min = 0, r = true, t = true},
    {n = "medkit_interval", d = "0.2", min = 0, r = true, t = true},
    {n = "shield_melee", d = "1", min = 0, max = 1, r = true},
    {n = "shield_knockback", d = "1", min = 0, max = 1, r = true},
    {n = "shield_riot_resistance", d = "3.5", min = 0, r = true},
    {n = "shield_riot_hp", d = "0", min = 0, r = true},
    {n = "smoke_affectnpcs", d = "1", min = 0, max = 1},
    {n = "flash_affectnpcs", d = "1", min = 0, max = 1},
    {n = "thermite_damage_min", d = "20", min = 0},
    {n = "thermite_damage_max", d = "40", min = 0},
    {n = "thermite_radius", d = "200", min = 0},
    {n = "frag_damage", d = "150", min = 0},
    {n = "frag_radius", d = "350", min = 0},
    {n = "charge_damage", d = "500", min = 0},
    {n = "charge_radius", d = "200", min = 0},
    {n = "c4_damage", d = "300", min = 0},
    {n = "c4_radius", d = "400", min = 0},
    {n = "healnade_heal", d = "3", min = 0},
    {n = "healnade_armor", d = "1", min = 0},
    {n = "healnade_damage", d = "20", min = 0}
}

TacRP.ConVars = {}

local prefix = "tacrp_"
local FLAG_REPLICATED = FCVAR_REPLICATED
local FLAG_USERINFO = FCVAR_USERINFO
local FLAG_NOTIFY = FCVAR_NOTIFY
local FLAG_ARCHIVE = FCVAR_ARCHIVE

local pendingChanges = {}
local playerCache = LocalPlayer

function TacRP.NetworkConvar(convar, old_value, value)
    if not playerCache() or not playerCache():IsAdmin() or old_value == value then return end
    if type(value) == "boolean" then value = value and 1 or 0
    elseif IsColor(value) then value = string.format("%d %d %d %d", value.r, value.g, value.b, value.a) end

    pendingChanges[convar] = value
    timer.Create("tacrp_convar_debounce", 0.25, 1, function()
        for cmd, val in pairs(pendingChanges) do
            net.Start("tacrp_sendconvar")
            net.WriteString(cmd .. " " .. val)
            net.SendToServer()
        end
        table.Empty(pendingChanges)
    end)
end

for _, var in ipairs(conVars) do
    local convar_name = prefix .. var.n
    local flags = FLAG_ARCHIVE
    if var.r then flags = flags + FLAG_REPLICATED end
    if var.u then flags = flags + FLAG_USERINFO end
    if var.t then flags = flags + FLAG_NOTIFY end

    if var.c and CLIENT then
        TacRP.ConVars[var.n] = CreateClientConVar(convar_name, var.d, not var.noa, var.u)
    elseif not var.c then
        TacRP.ConVars[var.n] = CreateConVar(convar_name, var.d, flags, var.h, var.min, var.max)
    end

    if var.cb then
        cvars.AddChangeCallback(convar_name, var.cb, "tacrp")
    end
    if CLIENT then
        cvars.AddChangeCallback(convar_name, TacRP.NetworkConvar, "tacrp_onchange")
    end
end

if CLIENT then
    local function reset_cvars()
        for _, cvar in pairs(TacRP.ConVars) do
            if bit.band(cvar:GetFlags(), FCVAR_LUA_CLIENT) != 0 then
                cvar:Revert()
            end
        end
    end

    local function header(panel, text)
        local ctrl = panel:Help(text)
        ctrl:SetFont("DermaDefaultBold")
        return ctrl
    end

    local function addCheckbox(panel, label, command, help)
        panel:AddControl("checkbox", {label = label, command = prefix .. command})
        if help then panel:ControlHelp(help) end
    end

    local function addSlider(panel, label, command, min, max, type)
        panel:AddControl("slider", {label = label, command = prefix .. command, type = type or "float", min = min, max = max})
    end

    local function menu_client_ti(panel)
        local btn_reset = vgui.Create("DButton")
        btn_reset:Dock(TOP)
        btn_reset:SetText("Apply Default Client Settings")
        btn_reset.DoClick = function()
            Derma_Query(
                "Are you sure you want to reset ALL client settings to default values? This is irreversible!",
                "TacRP",
                "Yes",
                reset_cvars,
                "No"
            )
        end
        panel:AddPanel(btn_reset)

        header(panel, "Interface")
        addCheckbox(panel, "Show HUD", "drawhud")
        addCheckbox(panel, "Show Backup HUD", "minhud")
        addCheckbox(panel, "Quickthrow Radial Menu", "nademenu", "When enabled, +grenade2 brings up a menu to select grenades. Otherwise it switches between them.")
        addCheckbox(panel, "Quickthrow Menu Clicking", "nademenu_click", "When enabled, left click and right click in the quickthrow menu performs an overhand and underhand throw of the highlighted grenade.")
        addCheckbox(panel, "Blindfire Radial Menu", "blindfiremenu", "When enabled, +zoom brings up a menu to change blindfire type. Otherwise it sets blindfire based on movement keys pressed.")
        addCheckbox(panel, "Blindfire Menu Empty Center", "blindfiremenu_nocenter", "When enabled, center option does nothing, and bottom option will cancel blindfire instead.\nThis will hide the option to shoot yourself.")
        addCheckbox(panel, "Use Meters instead of HU", "metricunit")
        addCheckbox(panel, "Recoil Vignette", "vignette", "Vignette intensity is based on amount of accumulated recoil.")
        addCheckbox(panel, "Show \"Drop Weapon\" Button", "cust_drop")
        addSlider(panel, "HUD Scale", "hudscale", 0.25, 1.5)
        panel:ControlHelp("HUD is already scaled to screen width; this slider may help ultrawide users or people with a vertical setup.")

        header(panel, "\nHints")
        addCheckbox(panel, "Show Control Hints", "hints", "Shows your currently available actions regardless of whether the HUD is enabled or not.")
        addCheckbox(panel, "Hints Always Active", "hints_always")
        addCheckbox(panel, "Hints Use Alternate Font", "hints_altfont")
        addCheckbox(panel, "Hide Startup Quickthrow Bind Reminder", "shutup")

        header(panel, "\nPreference")
        addCheckbox(panel, "Toggle Aiming", "toggleaim")
        addCheckbox(panel, "Toggle Peeking", "togglepeek")
        addCheckbox(panel, "Aiming Stops Sprinting", "aim_cancels_sprint", "When holding both Sprint and Aim buttons, aim the weapon and prevent sprinting.")
        addCheckbox(panel, "Auto-Save Weapon", "autosave")
        addCheckbox(panel, "Auto Reload When Empty", "autoreload")
        addCheckbox(panel, "Flashbang Dark Mode", "flash_dark", "In dark mode, flashbangs turn your screen black instead of white, and mutes audio instead of ringing.")
        addCheckbox(panel, "Quiet Radar", "radar_quiet", "This mutes your own radar sound for yourself only. Others can still hear your radar, and you can still hear others' radars.")
        addCheckbox(panel, "Pickup Requires +USE", "pickup_use", "This option only affects TacRP weapons.")
        addCheckbox(panel, "Toggle Tactical with +WALK", "flashlight_alt", "If disabled, ALT+F toggles HL2 flashlight and F toggles tactical;\nif enabled, F toggles HL2 flashlight and ALT+F toggles tactical.")

        header(panel, "\nSpawnmenu")
        panel:ControlHelp("Use ConCommand \"spawnmenu_reload\" to apply changes.")
        addCheckbox(panel, "Subcategory Headers", "spawnmenu_subcats")
        addCheckbox(panel, "Sort by Tiers", "spawnmenu_sortbytiers")
        addCheckbox(panel, "Tier Highlighting", "spawnmenu_highlight", "Only applies when tiered balance is enabled.")

        header(panel, "\nMiscellaneous")
        addCheckbox(panel, "Muzzle Light", "muzzlelight", "Emits a brief projected light when you shoot (but not for others).")
        addCheckbox(panel, "Near Walling", "nearwall", "Pushes viewmodel back when the point of aim is in front of a wall. Purely visual effect, but may help when blindfiring.")
        addCheckbox(panel, "Disable Suicide Mode", "idunwannadie", "Hides the option to shoot yourself from the radial menu, and disables the SHIFT+ALT+B key combo.")
        addCheckbox(panel, "Draw Holstered Weapons", "drawholsters")
        addCheckbox(panel, "True Laser Position", "true_laser")
        addCheckbox(panel, "Immersive Ammo Names (Requires map reload)", "ammonames")
    end

    local function menu_server_ti(panel)
        header(panel, "Features")
        panel:Help("Settings in this section affect ALL PLAYERS.")
        addCheckbox(panel, "Enable Crosshair", "crosshair")
        addCheckbox(panel, "Enable HUD", "hud")
        addCheckbox(panel, "Holstered Weapon Models", "visibleholster")
        addCheckbox(panel, "Enable Newsletter", "checknews", "If turned off, newsletter popup/notification will not happen. Players can still open the newsletter page manually.")
        addCheckbox(panel, "Allow Dropping & Swapping", "allowdrop")
        addCheckbox(panel, "Enable Safety On Deploy", "deploysafety")

        local cb_irons_procedural, lb_irons_procedural = panel:ComboBox("Use Procedural Ironsights", prefix .. "irons_procedural")
        cb_irons_procedural:AddChoice("0 - Never", "0")
        cb_irons_procedural:AddChoice("1 - With Optic", "1")
        cb_irons_procedural:AddChoice("2 - Always", "2")
        cb_irons_procedural:DockMargin(8, 0, 0, 0)
        lb_irons_procedural:SizeToContents()
        panel:ControlHelp("Applies mostly to pistols. Replaces firing animation while aiming with a much less disruptive procedural effect, making aiming with the weapon's sights easier.")

        local cb_irons_lower, lb_irons_lower = panel:ComboBox("Use Lowered Ironsights", prefix .. "irons_lower")
        cb_irons_lower:AddChoice("0 - Never", "0")
        cb_irons_lower:AddChoice("1 - In TTT", "1")
        cb_irons_lower:AddChoice("2 - Always", "2")
        cb_irons_lower:DockMargin(8, 0, 0, 0)
        lb_irons_lower:SizeToContents()
        panel:ControlHelp("While aiming with ironsights, lower the weapon and draw a dot where the point of aim is (even when Enable Crosshair is off). The dot does not display weapon sway or spread.")

        header(panel, "\nWeapon Slot Restriction")
        panel:ControlHelp("Restrict TacRP weapons for pickup/spawning based on their weapon slot.")
        addSlider(panel, "Max Per Slot (0 - no limit)", "slot_limit", 0, 3, "int")
        addCheckbox(panel, "Use HL2-style slots", "slot_hl2", "Use slot 4 for MGs, shotguns and snipers, slot 5 for explosives.")
        addCheckbox(panel, "Count ALL weapons", "slot_countall", "WARNING! If set, non-TacRP weapons may be dropped/removed to make room for TacRP weapons! This can have unintended consequences!")

        local cb_slot_action, lb_slot_action = panel:ComboBox("Weapon Spawning Behavior", prefix .. "slot_action")
        cb_slot_action:AddChoice("0 - Fail", "0")
        cb_slot_action:AddChoice("1 - Remove", "1")
        cb_slot_action:AddChoice("2 - Drop", "2")
        cb_slot_action:DockMargin(8, 0, 0, 0)
        lb_slot_action:SizeToContents()
        panel:ControlHelp("Only affects giving weapons with the spawnmenu.")

        header(panel, "\nNPC")
        addCheckbox(panel, "NPCs Deal Equal Damage", "npc_equality")
        addCheckbox(panel, "NPCs Get Random Attachments", "npc_atts")

        header(panel, "\nMiscellaneous")
        addCheckbox(panel, "Client Authoritative Hitreg", "client_damage", "Dramatically improve multiplayer hit registration by letting the client declare when damage is dealt.\nMay be abusable by exploiters, so usage in public servers is not recommended.")
        addCheckbox(panel, "Drop Magazine Models", "dropmagazinemodel")
        addCheckbox(panel, "Supply Boxes Resupply Grenades", "resupply_grenades")
        addCheckbox(panel, "Default Body Damage Cancel", "bodydamagecancel", "Only disable this if another addon or gamemode is also modifying default hitgroup damage multipliers.")
        addCheckbox(panel, "Door Busting", "doorbust", "Blow doors off their hinges, even locked ones. If disabled, only unlocked doors can be knocked open, and they won't be blown off.")
        addSlider(panel, "Door Respawn Time", "doorbust_time", 10, 600, "int")
    end

    local function menu_balance_ti(panel)
        header(panel, "Damage")
        panel:Help("Adjust weapon attributes to suit your gameplay needs.")
        local cb_balance, lb_balance = panel:ComboBox("Weapon Tiers", prefix .. "balance")
        cb_balance:AddChoice("[Automatic]", "-1")
        cb_balance:AddChoice("0 - Tiered", "0")
        cb_balance:AddChoice("1 - Untiered", "1")
        cb_balance:AddChoice("2 - TTT", "2")
        cb_balance:DockMargin(8, 0, 0, 0)
        lb_balance:SizeToContents()
        panel:Help("Weapon are divided into 4 tiers, with higher tiers having slightly better overall performance.\nDisable to adjust weapon performance to around the same level.")
        panel:Help("TTT option is untiered, and has lower RPM and high time to kill close to vanilla TTT weapons.")
        panel:Help("Weapon tiers, best to worst: \n1 - Elite \n2 - Operator \n3 - Security \n4 - Consumer\n5 - Value")

        addSlider(panel, "Overall Damage", "mult_damage", 0.1, 3)
        panel:ControlHelp("Only affects bullets. Type-specific damage multipliers takes priority and doesn't stack.")
        addSlider(panel, "Shotgun Damage", "mult_damage_shotgun", 0.1, 3)
        addSlider(panel, "Sniper Rifle Damage", "mult_damage_sniper", 0.1, 3)
        addSlider(panel, "Magnum Pistol Damage", "mult_damage_magnum", 0.1, 3)
        addSlider(panel, "Explosive Damage", "mult_damage_explosive", 0.1, 10)
        panel:ControlHelp("Does not affect quicknades.")
        addSlider(panel, "Melee Weapon Damage", "mult_damage_melee", 0.1, 3)
        panel:ControlHelp("Does not affect quick melee / bashing.")
        addSlider(panel, "Headshot Multiplier", "mult_headshot", 0, 2)
        panel:ControlHelp("If set to 0, headshots will not do any bonus damage.")

        header(panel, "\nRecoil")
        addCheckbox(panel, "Bloom Modifies Recoil", "altrecoil", "If enabled, gaining bloom intensifies recoil but does not modify spread.\nIf disabled, gaining bloom increases spread but does not modify recoil kick (old behavior).\nBloom is gained when firing consecutive shots.")
        addCheckbox(panel, "Recoil Patterns", "recoilpattern", "Recoil follows a weapon-specific pattern, reset when bloom disappears.\nPattern fades away in long bursts, but reduces vertical recoil.")
        addSlider(panel, "Recoil Kick", "mult_recoil_kick", 0, 2)
        addSlider(panel, "Visual Recoil", "mult_recoil_vis", 0, 2)

        header(panel, "\nAiming")
        addCheckbox(panel, "Enable Crosshair", "crosshair")
        addCheckbox(panel, "Enable Old School Scopes", "oldschool", "Weapons without a scope or holosight cannot aim down sights.\nHip-fire spread is reduced and moving spread is increased based on scope magnification.\nEnabling the crosshair with this enabled is strongly encouraged.")
        addCheckbox(panel, "Enable Sway", "sway", "Weapon point of aim will move around gently. While aiming, hold sprint key to hold breath and steady aim.")
        addCheckbox(panel, "Enable Free Aim", "freeaim", "While not aiming, moving around will cause the crosshair to move off center.")
        addSlider(panel, "Aim Down Sights Time", "mult_aimdownsights", 0.5, 1.5)
        addSlider(panel, "Sprint To Fire Time", "mult_sprinttofire", 0.5, 1.5)

        header(panel, "\nAmmo & Reloading")
        addCheckbox(panel, "Infinite Ammo", "infiniteammo", "Reloading does not require or consume ammo.")
        addCheckbox(panel, "Infinite Grenades", "infinitegrenades")
        addCheckbox(panel, "Dump Ammo In Magazines", "reload_dump", "Dropping a magazine during a reload will also drop all ammo in the gun. The dropped magazine can be retrieved (unless Infinite Ammo is enabled).")
        addCheckbox(panel, "Automatically Clear Jams", "jam_autoclear")
        addCheckbox(panel, "Expanded Ammo Types (Requires map reload)", "expandedammotypes", "Adds new ammo types to diversify ammo economy. Weapon performance is unchanged.")
        addSlider(panel, "Default Clip Multiplier", "defaultammo", 0, 10)
        addSlider(panel, "Reload Speed", "mult_reloadspeed", 0.5, 1.5)
    end

    local function menu_mechanics_ti(panel)
        header(panel, "\nBallistics")
        addCheckbox(panel, "Enable Penetration", "penetration")
        addCheckbox(panel, "Enable Physical Bullets", "physbullet", "Bullets will be hitscan up to a certain range depending on muzzle velocity.")
        addCheckbox(panel, "Enable Shotgun Patterns", "fixedspread", "Shotgun pellets uses a pattern that covers the spread area for more consistency.")
        addCheckbox(panel, "Enable Pattern Randomness", "pelletspread", "Add random spread onto the pattern. Does not affect total spread. If disabled, shotgun patterns become completely static.")
        addCheckbox(panel, "Custom Armor Penetration", "armorpenetration", "Use AP stats against players with HL2 suit armor. This generally increases weapon damage against armor.\nCompatible with Danger Zone Entities.")

        header(panel, "\nMovement")
        addCheckbox(panel, "Allow Reload while Sprinting", "sprint_reload", "If disabled, starting a sprint will cancel an unfinished reload.")
        addCheckbox(panel, "Lower Weapon While Sprinting", "sprint_lower")
        addCheckbox(panel, "Lower Weapon While Airborne", "sprint_counts_midair")
        addCheckbox(panel, "Lower Weapon While Not Aiming", "sightsonly", "Weapons can only be fired when aiming, like DarkRP weapons. Doesn't affect weapons that cannot aim.\nDisables safety and can't use with Old School Scopes.")

        addCheckbox(panel, "Movement Penalty", "penalty_move", "Penalty when weapon is up.\nDoes not apply in safety.")
        addCheckbox(panel, "Firing Movement Penalty", "penalty_firing", "Penalty from firing the weapon.")
        addCheckbox(panel, "Aiming Movement Penalty", "penalty_aiming", "Penalty while aiming the weapon.")
        addCheckbox(panel, "Reload Movement Penalty", "penalty_reload", "Penalty while reloading.")
        addCheckbox(panel, "Melee Movement Penalty", "penalty_melee", "Penalty from melee bashing.")

        header(panel, "\nMiscellaneous")
        addCheckbox(panel, "Delayed Holstering", "holster", "Play a holster animation before pulling out another weapon. If disabled, holstering is instant.")
        addCheckbox(panel, "Shotgun Reload Cancel", "reload_sg_cancel", "Instantly fire out of a shotgun reload. If disabled, the finishing part of the animation must play out.")
        addCheckbox(panel, "Allow Aiming While Reloading", "ads_reload")
        addCheckbox(panel, "Enable Quick Grenades", "quicknade")
    end

    local function menu_atts_ti(panel)
        header(panel, "Attachment Inventory")
        addCheckbox(panel, "Free Attachments", "free_atts")
        addCheckbox(panel, "Attachment Locking", "lock_atts", "In Locking mode, owning one attachment allows you to use it on multiple weapons, a-la CW2.0.")
        addCheckbox(panel, "Lose Attachments On Death", "loseattsondie")
        addCheckbox(panel, "Attachment Entities in Spawnmenu", "generateattentities")

        header(panel, "\nAttachment Mechanics")
        addCheckbox(panel, "Enable Scope Glint", "glint", "Scopes show a visible glint. Glint size is dependent on angle of view, scope magnification and distance, and is bigger when zoomed in.")
        addCheckbox(panel, "Enable Blinding Flashlights", "flashlight_blind", "Flashlight glare will obscure vision based on distance and viewing angle. Effect is more significant on scopes. If disabled, glare sprite will be visible but not grow in size.")
        addCheckbox(panel, "Laser Beam", "laser_beam", "If disabled, laser has no beam and only a dot, like Insurgency: Sandstorm. The dot remains static on high RPM weapons to help aiming.")

        header(panel, "\nAttachment Balance")
        addSlider(panel, "Smackdown Slow", "melee_slow", 0, 1)
        addSlider(panel, "Radar Frequency", "att_radartime", 0.5, 10)
    end

    local function menu_equipment_ti(panel)
        header(panel, "Grenades")
        addCheckbox(panel, "Smoke Affects NPCs", "smoke_affectnpcs")
        addCheckbox(panel, "Flashbang Affects NPCs", "flash_affectnpcs")
        addSlider(panel, "Flashbang Slow", "flash_slow", 0, 1)
        addSlider(panel, "Frag Grenade Damage", "frag_damage", 50, 500, "int")
        addSlider(panel, "Frag Grenade Radius", "frag_radius", 64, 512, "int")
        addSlider(panel, "Thermite Starting Damage", "thermite_damage_min", 1, 100, "int")
        addSlider(panel, "Thermite Maximum Damage", "thermite_damage_max", 1, 100, "int")
        addSlider(panel, "Thermite Radius", "thermite_radius", 64, 512, "int")
        panel:ControlHelp("Thermite damage is dealt every 0.2s and falls off with distance.")
        addSlider(panel, "Door Charge Damage", "charge_damage", 100, 1000, "int")
        addSlider(panel, "Door Charge Radius", "charge_radius", 64, 512, "int")
        addSlider(panel, "C4 Damage", "c4_damage", 100, 1000, "int")
        addSlider(panel, "C4 Radius", "c4_radius", 64, 512, "int")
        panel:ControlHelp("C4 does its damage a second time with half the radius.")
        addSlider(panel, "Medi-Smoke Health", "healnade_heal", 0, 20, "int")
        addSlider(panel, "Medi-Smoke Armor", "healnade_armor", 0, 20, "int")
        addSlider(panel, "Medi-Smoke Damage", "healnade_damage", 0, 100, "int")
        panel:ControlHelp("Medi-Smoke damage is applied to anything considered a zombie.")
        addSlider(panel, "CS Gas Sway", "gas_sway", 0, 10)

        header(panel, "\nMedkit")
        addCheckbox(panel, "Only Regen Charge When Held", "medkit_regen_activeonly")
        addSlider(panel, "Max Charge", "medkit_clipsize", 10, 100, "int")
        addSlider(panel, "Charge Regen Interval", "medkit_regen_delay", 0.01, 5)
        addSlider(panel, "Charge Regen Amount", "medkit_regen_amount", 0, 3, "int")
        panel:ControlHelp("When set to 0, the medkit is consumed when all charge is spent.")
        addSlider(panel, "Self Heal Per Charge", "medkit_heal_self", 0, 10, "int")
        panel:ControlHelp("When set to 0, the medkit cannot be used on yourself.")
        addSlider(panel, "Heal Per Charge", "medkit_heal_others", 0, 10, "int")
        panel:ControlHelp("When set to 0, the medkit cannot be used on others.")
        addSlider(panel, "Charge Interval", "medkit_interval", 0.01, 1)
        panel:ControlHelp("Delay between charges. For example, 0.1 interval means 10 charge per second.")

        header(panel, "\nRiot Shield")
        addCheckbox(panel, "Allow Quick Melee", "shield_melee")
        addCheckbox(panel, "Knockback On Melee Block", "shield_knockback")
        addSlider(panel, "Penetration Resistance", "shield_riot_resistance", 0, 5)
        panel:ControlHelp("Higher value is harder to penetrate.")
        addSlider(panel, "Durability", "shield_riot_hp", 0, 9999, "int")
        panel:ControlHelp("When set to 0, the shield will never break.")
    end

    local clientmenus_ti = {
        {text = "Client", func = menu_client_ti},
        {text = "Server", func = menu_server_ti},
        {text = "Mechanics", func = menu_mechanics_ti},
        {text = "Attachments", func = menu_atts_ti},
        {text = "Balance", func = menu_balance_ti},
        {text = "Equipment", func = menu_equipment_ti}
    }

    hook.Add("PopulateToolMenu", "TacRP_MenuOptions", function()
        for smenu, data in ipairs(clientmenus_ti) do
            spawnmenu.AddToolMenuOption("Options", "Tactical RP Weapons", "TacRP_" .. smenu, data.text, "", "", data.func)
        end
    end)
end