if restoration.Options:GetValue("HUD/MainHud") then
function HUDManager:_create_teammates_panel(hud)
	hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	self._hud.teammate_panels_data = self._hud.teammate_panels_data or {}
	self._teammate_panels = {}
	if hud.panel:child("teammates_panel") then
		hud.panel:remove(hud.panel:child("teammates_panel"))
	end
	local h = 152
	local teammates_panel = hud.panel:panel({
		name = "teammates_panel",
		h = h,
		y = hud.panel:h() - h,
		halign = "grow",
		valign = "bottom"
	})
	local teammate_w = 204
	local player_gap = 240
	local small_gap = (teammates_panel:w() - player_gap - teammate_w * 4) / 3
	for i = 1, 4 do
		local is_player = i == HUDManager.PLAYER_PANEL
		self._hud.teammate_panels_data[i] = {
			taken = false and is_player,
			special_equipments = {}
		}
		local pw = teammate_w
		local teammate = HUDTeammate:new(i, teammates_panel, is_player, pw)
		local x = math.floor((pw + small_gap) * (i - 1) + (i == HUDManager.PLAYER_PANEL and player_gap or 0))
		teammate._panel:set_x(math.floor(x))
		table.insert(self._teammate_panels, teammate)
		if is_player then
			teammate:add_panel()
		end
	end
end


function HUDManager:teammate_progress(peer_id, type_index, enabled, tweak_data_id, timer, success)
	local name_label = self:_name_label_by_peer_id(peer_id)
	if name_label then
		name_label.interact:set_visible(enabled)
		name_label.panel:child("action"):set_visible(enabled)
		local action_text = ""
		if type_index == 1 then
			action_text = managers.localization:text(tweak_data.interaction[tweak_data_id].action_text_id or "hud_action_generic")
			--action_text = managers.localization:text("hud_action_generic")
		elseif type_index == 2 then
			if enabled then
				local equipment_name = managers.localization:text(tweak_data.equipments[tweak_data_id].text_id)
				local deploying_text = tweak_data.equipments[tweak_data_id].deploying_text_id and managers.localization:text(tweak_data.equipments[tweak_data_id].deploying_text_id) or false
				action_text = deploying_text or managers.localization:text("hud_deploying_equipment", {EQUIPMENT = equipment_name})
			end
		elseif type_index == 3 then
			action_text = managers.localization:text("hud_starting_heist")
		end
		name_label.panel:child("action"):set_text(utf8.to_upper(action_text))
		name_label.panel:stop()
		if enabled then
			name_label.panel:animate(callback(self, self, "_animate_label_interact"), name_label.interact, timer)
		elseif success then
			local panel = name_label.panel
			local bitmap = panel:bitmap({
				rotation = 360,
				texture = "guis/textures/restoration/hud_progress_active",
				blend_mode = "add",
				align = "center",
				valign = "center",
				layer = 2
			})
			bitmap:set_size(name_label.interact:size())
			bitmap:set_position(name_label.interact:position())
			local radius = name_label.interact:radius()
			local circle = CircleBitmapGuiObject:new(panel, {
				rotation = 360,
				radius = radius,
				color = Color.white:with_alpha(1),
				blend_mode = "normal",
				layer = 3
			})
			circle:set_position(name_label.interact:position())
			bitmap:animate(callback(HUDInteraction, HUDInteraction, "_animate_interaction_complete"), circle)
		end
	end
	local character_data = managers.criminals:character_data_by_peer_id(peer_id)
	if character_data then
		self._teammate_panels[character_data.panel_id]:teammate_progress(enabled, tweak_data_id, timer, success)
	end
end

function HUDManager:hide_player_gear(panel_id)
	if self._teammate_panels[panel_id] and self._teammate_panels[panel_id]:panel() and self._teammate_panels[panel_id]:panel():child("player") then
		local player_panel = self._teammate_panels[panel_id]:panel():child("player")
		player_panel:child("weapons_panel"):set_visible(false)
		player_panel:child("deployable_equipment_panel"):set_visible(false)
		player_panel:child("cable_ties_panel"):set_visible(false)
        if player_panel:child("grenades_panel") then
                player_panel:child("grenades_panel"):set_visible(false)
        end
	end
end
function HUDManager:show_player_gear(panel_id)
	if self._teammate_panels[panel_id] and self._teammate_panels[panel_id]:panel() and self._teammate_panels[panel_id]:panel():child("player") then
		local player_panel = self._teammate_panels[panel_id]:panel():child("player")
		player_panel:child("weapons_panel"):set_visible(true)
		player_panel:child("deployable_equipment_panel"):set_visible(true)
		player_panel:child("cable_ties_panel"):set_visible(true)
        if player_panel:child("grenades_panel") then
                player_panel:child("grenades_panel"):set_visible(true)
        end
	end
end

function HUDManager:_add_name_label(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
	local last_id = self._hud.name_labels[#self._hud.name_labels] and self._hud.name_labels[#self._hud.name_labels].id or 0
	local id = last_id + 1
	local character_name = data.name
	local rank = 0
	local peer_id
	local is_husk_player = data.unit:base().is_husk_player
	if is_husk_player then
		peer_id = data.unit:network():peer():id()
		local level = data.unit:network():peer():level()
		rank = data.unit:network():peer():rank()
		if level then
			local experience = (rank > 0 and managers.experience:rank_string(rank) .. "-" or "") .. level
			data.name = data.name .. " [" .. experience .. "]"
		end
	end
	local panel = hud.panel:panel({
		name = "name_label" .. id
	})
	local radius = 24
	local interact = CircleBitmapGuiObject:new(panel, {
		use_bg = true,
		radius = radius,
		blend_mode = "add",
		color = Color.white,
		layer = 0
	})
	interact:set_visible(false)
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bag_rect = {
		2,
		34,
		20,
		17
	}
	local color_id = managers.criminals:character_color_id_by_unit(data.unit)
	local crim_color = tweak_data.chat_colors[color_id]
	local text = panel:text({
		name = "text",
		text = utf8.to_upper(data.name),
		font = tweak_data.menu.medium_font,
		font_size = 28,
		color = crim_color,
		align = "left",
		vertical = "top",
		layer = -1,
		w = 256,
		h = 18
	})
	local bag = panel:bitmap({
		name = "bag",
		texture = tabs_texture,
		texture_rect = bag_rect,
		visible = false,
		layer = 0,
		color = crim_color:with_alpha(1),
		x = 1,
		y = 1
	})
	panel:text({
		name = "cheater",
		text = utf8.to_upper(managers.localization:text("menu_hud_cheater")),
		font = tweak_data.menu.medium_font,
		font_size = 28,
		color = tweak_data.screen_colors.pro_color,
		align = "center",
		visible = false,
		layer = -1,
		w = 256,
		h = 18
	})
	panel:text({
		name = "action",
		rotation = 360,
		visible = false,
		text = utf8.to_upper("Fixing"),
		font = tweak_data.menu.medium_font,
		font_size = 28,
		color = crim_color:with_alpha(1),
		align = "left",
		vertical = "bottom",
		layer = -1,
		w = 256,
		h = 18
	})
	if rank > 0 then
		local infamy_icon = tweak_data.hud_icons:get_icon_data("infamy_icon")
		panel:bitmap({
			name = "infamy",
			texture = infamy_icon,
			layer = 0,
			w = 16,
			h = 32,
			color = crim_color
		})
	end
	self:align_teammate_name_label(panel, interact)
	table.insert(self._hud.name_labels, {
		movement = data.unit:movement(),
		panel = panel,
		text = text,
		id = id,
		peer_id = peer_id,
		character_name = character_name,
		interact = interact,
		bag = bag
	})
	return id
end

end