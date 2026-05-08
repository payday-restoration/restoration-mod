if _G.IS_VR then
	return
end
if not restoration:all_enabled("HUD/MainHUD", "HUD/Teammate") then
	return
end

function HUDTeammate:init(i, teammates_panel, is_player, width)
	self._id = i
	local small_gap = 8
	local gap = 0
	local pad = 4
	local main_player = i == HUDManager.PLAYER_PANEL
	self._main_player = main_player
	local names = {
		"WWWWWWWWWWWWQWWW",
		"AI Teammate",
		"FutureCatCar",
		"WWWWWWWWWWWWQWWW"
	}
	local teammate_panel = teammates_panel:panel({
		halign = "right",
		visible = false,
		x = 0,
		name = "" .. i,
		w = math.round(width)
	})
	self._panel = teammate_panel
	self._player_panel = teammate_panel:panel({name = "player"})
	self._health_data = {
		current = 0,
		total = 0
	}
	self._armor_data = {
		current = 0,
		total = 0
	}
	local name = teammate_panel:text({
		name = "name",
		vertical = "bottom",
		y = 0,
		layer = 1,
		text = "PLAYER-" .. i,
		color = Color.white,
		font_size = tweak_data.hud_players.name_size,
		font = tweak_data.hud_players.name_font
	})
	local _, _, name_w, _ = name:text_rect()

	managers.hud:make_fine_text(name)
	name:set_leftbottom(name:h(), teammate_panel:h() - 70)

	local revive_panel = self._player_panel:panel({
		name = "revive_panel"
	})

	local revive_text = revive_panel:text({
		text = "2x",
		name = "revive_text",
		font_size = tweak_data.hud_players.name_size,
		font = tweak_data.hud_players.name_font,
		layer = 1,
		color = Color.white,
		y = name:y()
	})
	local _, _, revive_w, _ = revive_text:text_rect()

	managers.hud:make_fine_text(revive_text)

	local tabs_texture = "guis/textures/restoration/hud_tabs"
	local bg_rect = {
		84,
		0,
		44,
		32
	}
	local cs_rect = {
		84,
		34,
		19,
		19
	}
	local csbg_rect = {
		105,
		34,
		19,
		19
	}
	local bg_color = Color.white / 1

	teammate_panel:bitmap({
		name = "name_bg",
		visible = true,
		layer = 0,
		texture = tabs_texture,
		texture_rect = bg_rect,
		color = bg_color,
		x = name:x(),
		y = name:y() - 1,
		w = name_w + 4,
		h = name:h()
	})
	revive_panel:bitmap({
		name = "revive_bg",
		visible = true,
		layer = 0,
		texture = tabs_texture,
		texture_rect = bg_rect,
		color = bg_color,
		x = revive_text:x(),
		y = revive_text:y() - 1,
		w = revive_w + 4,
		h = revive_text:h()
	})
	teammate_panel:bitmap({
		name = "callsign_bg",
		layer = 0,
		blend_mode = "normal",
		texture = tabs_texture,
		texture_rect = csbg_rect,
		color = bg_color,
		x = name:x() - name:h(),
		y = name:y() + 1,
		w = name:h() - 2,
		h = name:h() - 2
	})
	teammate_panel:bitmap({
		name = "callsign",
		layer = 1,
		blend_mode = "normal",
		texture = tabs_texture,
		texture_rect = cs_rect,
		color = (tweak_data.chat_colors[i] or tweak_data.chat_colors[#tweak_data.chat_colors]):with_alpha(1),
		x = name:x() - name:h(),
		y = name:y() + 1,
		w = name:h() - 2,
		h = name:h() - 2
	})

	local box_ai_bg = teammate_panel:bitmap({
		texture = "guis/textures/pd2/box_ai_bg",
		name = "box_ai_bg",
		alpha = 0,
		visible = false,
		y = 0,
		color = Color.white,
		w = teammate_panel:w()
	})

	box_ai_bg:set_bottom(name:top())

	local name_bg = teammate_panel:child("name_bg")

	self._panel:child("callsign_bg"):set_visible(true)
	self._panel:child("callsign"):set_visible(true)

	local box_bg = teammate_panel:bitmap({
		texture = "guis/textures/pd2/box_bg",
		name = "box_bg",
		y = 0,
		visible = false,
		color = Color.white,
		w = teammate_panel:w()
	})

	box_bg:set_bottom(name:top())

	local texture, rect = tweak_data.hud_icons:get_icon_data("pd2_mask_" .. i)
	local size = 64
	local mask_pad = 2
	local mask_pad_x = 3
	local y = (teammate_panel:h() - name:h()) - size + mask_pad
	local mask = teammate_panel:bitmap({
		name = "mask",
		visible = false,
		layer = 1,
		color = Color.white,
		texture = texture,
		texture_rect = rect,
		x = -mask_pad_x,
		w = size,
		h = size,
		y = y
	})
	local radial_size = 64
	local radial_health_panel = self._player_panel:panel({
		name = "radial_health_panel",
		x = 0,
		layer = 1,
		w = radial_size + 4,
		h = radial_size + 4,
		y = mask:y()
	})

	radial_health_panel:set_bottom(self._player_panel:h())
	self:_create_radial_health(radial_health_panel, main_player)

	local weapon_panel_w = 80
	local weapons_panel = self._player_panel:panel({
		name = "weapons_panel",
		visible = true,
		layer = 0,
		w = weapon_panel_w,
		h = radial_health_panel:h(),
		x = radial_health_panel:right() + 4,
		y = radial_health_panel:y()
	})

	self:_create_weapon_panels(weapons_panel)
	self:_create_equipment_panels(self._player_panel, weapons_panel:right(), weapons_panel:top(), weapons_panel:bottom())

	local bag_w = 20
	local bag_h = 17
	local carry_panel = self._player_panel:panel({
		name = "carry_panel",
		visible = false,
		layer = 1,
		w = self._player_panel:w(),
		x = name:x(),
		h = bag_h + 2,
		y = name:top() - 23
	})

	self:_create_carry(carry_panel)

	local interact_panel = self._player_panel:panel({
		layer = 3,
		name = "interact_panel",
		visible = false
	})

	interact_panel:set_shape(weapons_panel:shape())
	interact_panel:set_shape(radial_health_panel:shape())
	interact_panel:set_size(radial_size * 1.25, radial_size * 1.25)
	interact_panel:set_center(weapons_panel:center())

	local radius = interact_panel:h() / 2 - 4
	self._interact = CircleBitmapGuiObject:new(interact_panel, {
		blend_mode = "add",
		use_bg = true,
		rotation = 360,
		layer = 0,
		radius = radius,
		color = Color.white
	})

	self._interact:set_position(4, 4)

	self._special_equipment = {}

	self:create_waiting_panel(teammates_panel)
end

function HUDTeammate:_create_carry(carry_panel)
	self._carry_panel = carry_panel
	local tabs_texture = "guis/textures/restoration/hud_tabs"
	local bg_color = Color.white / 1
	local bag_rect = {
		2,
		34,
		20,
		17
	}
	local bg_rect = {
		84,
		0,
		44,
		32
	}
	local bag_w = bag_rect[3]
	local bag_h = bag_rect[4]

	carry_panel:bitmap({
		name = "bg",
		visible = true,
		w = 100,
		layer = 0,
		y = 0,
		x = 0,
		texture = tabs_texture,
		texture_rect = bg_rect,
		color = bg_color,
		h = carry_panel:h()
	})
	carry_panel:bitmap({
		name = "bag",
		layer = 0,
		y = 1,
		visible = true,
		x = 1,
		texture = tabs_texture,
		w = bag_w,
		h = bag_h,
		texture_rect = bag_rect,
		color = Color.white
	})
	carry_panel:text({
		name = "value",
		visible = true,
		text = "$2,000,000",
		layer = 1,
		color = Color.white,
		x = bag_rect[3] + 4,
		y = 0,
		vertical = "center",
		font_size = tweak_data.hud_players.name_size,
		font = "fonts/font_small_mf"
	})
end

-- function HUDTeammate:_create_radial_health(radial_health_panel)
Hooks:OverrideFunction(HUDTeammate, "_create_radial_health", function(self, radial_health_panel)
	self._radial_health_panel = radial_health_panel
	local radial_size = 64
	local radial_bg = radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_radialbg",
		name = "radial_bg",
		alpha = 1,
		layer = 0,
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_health = radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_health",
		name = "radial_health",
		layer = 2,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		texture_rect = {
			128,
			0,
			-128,
			128
		},
		color = Color(1, 0, 1, 1),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_shield = radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_shield",
		name = "radial_shield",
		layer = 1,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		texture_rect = {
			128,
			0,
			-128,
			128
		},
		color = Color(1, 0, 1, 1),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local damage_indicator = radial_health_panel:bitmap({
		blend_mode = "add",
		name = "damage_indicator",
		alpha = 0,
		texture = "guis/textures/restoration/hud_radial_rim",
		layer = 1,
		color = Color(1, 1, 1, 1),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_custom = radial_health_panel:bitmap({
		texture = "guis/textures/pd2/hud_swansong",
		name = "radial_custom",
		blend_mode = "add",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_ability_panel = radial_health_panel:panel({
		visible = false,
		name = "radial_ability"
	})
	local radial_ability_meter = radial_ability_panel:bitmap({
		blend_mode = "add",
		name = "ability_meter",
		texture = "guis/textures/pd2/hud_fearless",
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_ability_icon = radial_ability_panel:bitmap({
		blend_mode = "add",
		name = "ability_icon",
		alpha = 1,
		layer = 5,
		w = radial_size * 0.5,
		h = radial_size * 0.5
	})

	radial_ability_icon:set_center(radial_ability_panel:center())

	local radial_delayed_damage_panel = radial_health_panel:panel({name = "radial_delayed_damage"})
	local radial_delayed_damage_armor = radial_delayed_damage_panel:bitmap({
		texture = "guis/textures/pd2/hud_dot_shield",
		name = "radial_delayed_damage_armor",
		visible = false,
		render_template = "VertexColorTexturedRadialFlex",
		layer = 6,
		w = radial_delayed_damage_panel:w(),
		h = radial_delayed_damage_panel:h()
	})
	local radial_delayed_damage_health = radial_delayed_damage_panel:bitmap({
		texture = "guis/textures/restoration/hud_dot",
		name = "radial_delayed_damage_health",
		visible = false,
		render_template = "VertexColorTexturedRadialFlex",
		layer = 6,
		w = radial_delayed_damage_panel:w(),
		h = radial_delayed_damage_panel:h()
	})

	if self._main_player then
		local radial_rip = radial_health_panel:bitmap({
			texture = "guis/textures/restoration/hud_rip",
			name = "radial_rip",
			layer = 3,
			blend_mode = "add",
			visible = false,
			render_template = "VertexColorTexturedRadial",
			texture_rect = {
				128,
				0,
				-128,
				128
			},
			color = Color(1, 0, 0, 0),
			w = radial_health_panel:w(),
			h = radial_health_panel:h()
		})
		local radial_rip_bg = radial_health_panel:bitmap({
			texture = "guis/textures/restoration/hud_rip_bg",
			name = "radial_rip_bg",
			layer = 1,
			visible = false,
			render_template = "VertexColorTexturedRadial",
			texture_rect = {
				128,
				0,
				-128,
				128
			},
			color = Color(1, 0, 0, 0),
			w = radial_health_panel:w(),
			h = radial_health_panel:h()
		})
	end

	radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_absorb_shield",
		name = "radial_absorb_shield_active",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})

	local radial_absorb_health_active = radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_absorb_health",
		name = "radial_absorb_health_active",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})

	radial_absorb_health_active:animate(callback(self, self, "animate_update_absorb_active"))
	radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_absorb_stack_fg",
		name = "radial_info_meter",
		blend_mode = "add",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		layer = 3,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	radial_health_panel:bitmap({
		texture = "guis/textures/restoration/hud_absorb_stack_bg",
		name = "radial_info_meter_bg",
		layer = 1,
		visible = false,
		render_template = "VertexColorTexturedRadial",
		texture_rect = {
			128,
			0,
			-128,
			128
		},
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})

	local copr_overlay_panel = radial_health_panel:panel({
		name = "copr_overlay_panel",
		layer = 3,
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	self:_create_condition(radial_health_panel)
end)
-- end

function HUDTeammate:_create_weapon_panels(weapons_panel)
	local bg_color = Color.white / 1
	local w_selection_w = 12
	local weapon_panel_w = 80
	local extra_clip_w = 4
	local ammo_text_w = (weapon_panel_w - w_selection_w) / 2
	local font_bottom_align_correction = 3
	local tabs_texture = "guis/textures/restoration/hud_tabs"
	local bg_rect = {
		0,
		0,
		67,
		32
	}
	local weapon_selection_rect1 = {
		67,
		0,
		13,
		32
	}
	local weapon_selection_rect2 = {
		67,
		32,
		13,
		32
	}
	local primary_weapon_panel = weapons_panel:panel({
		y = 0,
		name = "primary_weapon_panel",
		h = 32,
		visible = false,
		x = 0,
		layer = 1,
		w = weapon_panel_w
	})

	primary_weapon_panel:bitmap({
		name = "bg",
		layer = 0,
		visible = true,
		x = 0,
		texture = tabs_texture,
		texture_rect = bg_rect,
		w = weapon_panel_w
	})
	primary_weapon_panel:text({
		name = "ammo_clip",
		align = "center",
		vertical = "bottom",
		font_size = 30,
		blend_mode = "normal",
		x = 0,
		layer = 1,
		visible = true,
		text = "0" .. math.random(40),
		color = Color.white,
		w = ammo_text_w + extra_clip_w,
		h = primary_weapon_panel:h(),
		y = - 1,
		font = "fonts/font_medium_noshadow_mf"
	})
	primary_weapon_panel:text({
		text = "000",
		name = "ammo_total",
		align = "center",
		vertical = "bottom",
		font_size = 20,
		blend_mode = "normal",
		visible = true,
		layer = 1,
		color = Color.white,
		w = ammo_text_w - extra_clip_w,
		h = primary_weapon_panel:h(),
		x = ammo_text_w + extra_clip_w,
		y = - 1,
		font = "fonts/font_medium_noshadow_mf"
	})

	local weapon_selection_panel = primary_weapon_panel:panel({
		name = "weapon_selection",
		layer = 1,
		visible = true,
		w = w_selection_w,
		x = weapon_panel_w - w_selection_w
	})

	weapon_selection_panel:bitmap({
		name = "weapon_selection",
		texture = tabs_texture,
		texture_rect = weapon_selection_rect1,
		color = Color.white,
		w = w_selection_w
	})
	self:_create_primary_weapon_firemode()

	local secondary_weapon_panel = weapons_panel:panel({
		name = "secondary_weapon_panel",
		h = 32,
		visible = false,
		x = 0,
		layer = 1,
		w = weapon_panel_w,
		y = primary_weapon_panel:bottom()
	})

	secondary_weapon_panel:bitmap({
		name = "bg",
		layer = 0,
		visible = true,
		x = 0,
		texture = tabs_texture,
		texture_rect = bg_rect,
		color = bg_color,
		w = weapon_panel_w
	})
	secondary_weapon_panel:text({
		name = "ammo_clip",
		align = "center",
		vertical = "bottom",
		font_size = 30,
		blend_mode = "normal",
		x = 0,
		layer = 1,
		visible = true,
		text = "" .. math.random(40),
		color = Color.white,
		w = ammo_text_w + extra_clip_w,
		h = secondary_weapon_panel:h(),
		y = - 1,
		font = "fonts/font_medium_noshadow_mf"
	})
	secondary_weapon_panel:text({
		text = "000",
		name = "ammo_total",
		align = "center",
		vertical = "bottom",
		font_size = 20,
		blend_mode = "normal",
		visible = true,
		layer = 1,
		color = Color.white,
		w = ammo_text_w - extra_clip_w,
		h = secondary_weapon_panel:h(),
		x = ammo_text_w + extra_clip_w,
		y = - 1,
		font = "fonts/font_medium_noshadow_mf"
	})

	local weapon_selection_panel = secondary_weapon_panel:panel({
		name = "weapon_selection",
		layer = 1,
		visible = true,
		w = w_selection_w,
		x = weapon_panel_w - w_selection_w
	})

	weapon_selection_panel:bitmap({
		name = "weapon_selection",
		texture = tabs_texture,
		texture_rect = weapon_selection_rect2,
		color = Color.white,
		w = w_selection_w
	})
	secondary_weapon_panel:set_bottom(weapons_panel:h())
	self:_create_secondary_weapon_firemode()

end

function HUDTeammate:_create_equipment_panels(player_panel, x, top, bottom)
	local tabs_texture = "guis/textures/restoration/hud_tabs"
	local bg_color = Color.white / 1
	local eq_rect = {
		84,
		0,
		44,
		32
	}
	local temp_scale = 1
	local eq_h = 64 / 2
	local eq_w = 48
	local eq_tm_scale = 0.75
	local deployable_equipment_panel = self._player_panel:panel({
		name = "deployable_equipment_panel",
		layer = 1,
		w = eq_w,
		h = eq_h,
		x = x + 4,
		y = top
	})

	deployable_equipment_panel:bitmap({
		name = "bg",
		layer = 0,
		x = 0,
		texture = tabs_texture,
		texture_rect = eq_rect,
		color = bg_color,
		w = deployable_equipment_panel:w()
	})

	local equipment = deployable_equipment_panel:bitmap({
		name = "equipment",
		visible = false,
		layer = 1,
		color = Color.white,
		w = deployable_equipment_panel:h() * temp_scale,
		h = deployable_equipment_panel:h() * temp_scale,
		x = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2,
		y = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2
	})
	local amount = deployable_equipment_panel:text({
		name = "amount",
		visible = false,
		text = tostring(12),
		font = tweak_data.menu.small_font,
		font_size = 14,
		color = Color.white,
		align = "right",
		vertical = "top",
		layer = 2,
		x = -3,
		y = 1,
		w = deployable_equipment_panel:w(),
		h = deployable_equipment_panel:h()
	})

	self._deployable_equipment_panel = deployable_equipment_panel
	local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.cable_tie.icon)
	local cable_ties_panel = self._player_panel:panel({
		name = "cable_ties_panel",
		layer = 1,
		w = eq_w,
		h = eq_h,
		x = x + 4,
		y = top
	})

	cable_ties_panel:bitmap({
		name = "bg",
		layer = 0,
		x = 0,
		texture = tabs_texture,
		texture_rect = eq_rect,
		color = bg_color,
		w = deployable_equipment_panel:w()
	})

	local cable_ties = cable_ties_panel:bitmap({
		name = "cable_ties",
		layer = 1,
		texture = texture,
		texture_rect = rect,
		color = Color.white,
		w = deployable_equipment_panel:h() * temp_scale,
		h = deployable_equipment_panel:h() * temp_scale,
		x = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2,
		y = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2
	})
	local amount = cable_ties_panel:text({
		name = "amount",
		visible = false,
		text = tostring(12),
		font = tweak_data.menu.small_font,
		font_size = 14,
		color = Color.white,
		align = "right",
		vertical = "top",
		layer = 2,
		x = -3,
		y = 1,
		w = deployable_equipment_panel:w(),
		h = deployable_equipment_panel:h()
	})

	cable_ties_panel:set_bottom(bottom)

	self._cable_ties_panel = cable_ties_panel
end

-- https://github.com/subsoap/defstring/blob/master/defstring/defstring.lua
-- Shortens a string to a max length and adds a tail if you want (such as ...)
-- set reversed to true to start from line end to left
function string.shorten(s,length,tail,reversed)
	tail = tail or '...'
	if length < #tail then return tail:sub(1,w) end
	if #s > length then
		if reversed then
			local i = #s - length + 1 + #tail
			return tail .. s:sub(i)
		else
			return s:sub(1,length-#tail) .. tail
		end
	end
	return s
end

function HUDTeammate:set_name(teammate_name)
	local teammate_panel = self._panel
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign = teammate_panel:child("callsign")
	local name_text
	if restoration.Options:GetValue("HUD/UppercaseNames") then
	    name_text = utf8.to_upper( " "..teammate_name )
	else
	    name_text = " "..teammate_name
	end
	name:set_text( string.shorten(name_text, 23, false) )
	local h = name:h()
	managers.hud:make_fine_text(name)
	name:set_h(h)
	name_bg:set_w(name:w() + 4)
end

function HUDTeammate:set_revives_amount(revive_amount)
	if revive_amount then
		local teammate_panel = self._panel:child("player")
		local player_panel = teammate_panel:child("revive_panel")
		local revive_text = player_panel:child("revive_text")

		if revive_text then
			revive_text:set_color(tweak_data.hud.revive_colors_resmod[revive_amount] or tweak_data.hud.revive_colors[4])
			revive_text:set_text(" "..tostring(math.max(revive_amount - 1, 0)) .." ".. managers.localization:get_default_macro("BTN_SKULL"))
		end
	end
	self:set_revive_position()
end

function HUDTeammate:set_revive_position()
	local teammate_panel = self._panel
	local player_panel = self._panel:child("player")
	local revive_panel = player_panel:child("revive_panel")
	local revive_text = revive_panel:child("revive_text")
	local revive_bg = revive_panel:child("revive_bg")
	local name_bg = teammate_panel:child("name_bg")

	local r_h = revive_text:h()
	managers.hud:make_fine_text(revive_text)
	revive_text:set_h(r_h)
	revive_bg:set_w(revive_text:w() + 4)
	revive_text:set_x(name_bg:right() + 4)
	revive_bg:set_x(name_bg:right() + 4)
end

function HUDTeammate:_set_amount_string(text, amount)
	text:set_text( tostring( amount ) )
	text:set_visible( amount ~= 0 )
end

function HUDTeammate:set_state(state)
	local teammate_panel = self._panel
	local is_player = state == "player"

	teammate_panel:child("player"):set_alpha(is_player and 1 or 0)
end

function HUDTeammate:set_grenades(data)
	if not data then
		return
	end
	--local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	if not self._panel:child("grenades_panel") then
            if data.amount > 0 then
                self:add_special_equipment({
                    id = "grenades_panel",
                    icon = data.icon or "",
					noflashing = true,
                    amount = data.amount
                })
				restoration.log_shit("[RESTORATION] Added a grenade panel.")
            else
                return
            end
        end
end

function HUDTeammate:set_grenade_cooldown(data)
	if not PlayerBase.USE_GRENADES then
		return
	end

	local teammate_panel = self
	local end_time = data and data.end_time
	local duration = data and data.duration
	local special_equipment = self._special_equipment
	for i, panel in ipairs(special_equipment) do
		if panel:name() == "grenades_panel" then
			local grenades_radial = panel:child("grenades_radial")
			if not end_time or not duration then
			grenades_radial:stop()
			grenades_radial:set_color(Color(0.5, 0, 1, 1))

			return
			end


			local function animate_radial(o)
			repeat
				local now = managers.game_play_central:get_heist_timer()
				local time_left = end_time - now
				local progress = 1 - time_left / duration

				o:set_color(Color(0.5, progress, 1, 1))
				coroutine.yield()
			until time_left <= 0

			o:set_color(Color(0.5, 0, 1, 1))
			end

			grenades_radial:stop()
			grenades_radial:animate(animate_radial)
		end
	end

	if self._main_player then
		managers.network:session():send_to_peers("sync_grenades_cooldown", end_time, duration)
	end
end

function HUDTeammate:animate_grenade_flash()
	local teammate_panel = self._panel:child("player")
end

function HUDTeammate:set_grenades_amount(data, ignore)
	if not data then
		return
	end
		self:set_special_equipment_amount("grenades_panel", data.amount)
end

function HUDTeammate:set_carry_info(carry_id, value)
	local carry_panel = self._carry_panel

	carry_panel:set_visible(true)

	local value_text = carry_panel:child("value")
	local real_value = managers.money:get_secured_bonus_bag_value(carry_id, value)
	value_text:set_text(managers.experience:cash_string(real_value))
	local _, _, w, _ = value_text:text_rect()
	local bg = carry_panel:child("bg")

	bg:set_w(carry_panel:child("bag"):w() + w + 4)
end

function HUDTeammate:layout_special_equipments()
	local teammate_panel = self._panel
	local special_equipment = self._special_equipment
	local name = teammate_panel:child("name")
	local w = teammate_panel:w()
	for i, panel in ipairs(special_equipment) do
		if self._main_player then
			panel:set_x( w - (panel:w() + 0) * (i) )
			panel:set_y( panel:h() )
		else
			local j = i < 7 and (1 + math.mod( i-1, 3 )) or i - 3
			local y = i > 3 and 0 or panel:h()
			restoration.log_shit("J = " .. j .. "I = " .. i)
			local x_offset = i > 3 and panel:w()/2 or 0
			panel:set_x( w - (panel:w() + 0) * (j) - x_offset )
			panel:set_y( y )
		end
	end
end

local icon_conversion = {
		pd2_c4 = "equipment_c4",
		pd2_generic_saw = "equipment_saw"
}

function HUDTeammate:add_special_equipment(data)
	local teammate_panel = self._panel
	local special_equipment = self._special_equipment
	local id = data.id
	local equipment_panel = teammate_panel:panel({
		y = 0,
		layer = 0,
		name = id
	})
	if icon_conversion[data.icon] then -- thanks a lot Bushy
		data.icon = icon_conversion[data.icon]
	end
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)

	equipment_panel:set_size(32, 32)

	local bitmap = equipment_panel:bitmap({
		name = "bitmap",
		layer = 0,
		rotation = 360,
		texture = icon,
		color = Color.white,
		texture_rect = texture_rect,
		w = equipment_panel:w(),
		h = equipment_panel:h()
	})
	local w = teammate_panel:w()

	equipment_panel:set_x(w - (equipment_panel:w() + 0) * #special_equipment)
	table.insert(special_equipment, equipment_panel)

	local amount, amount_bg = nil

	if data.amount then
		amount_bg = equipment_panel:child("amount_bg") or equipment_panel:bitmap({
			texture = "guis/textures/pd2/equip_count",
			name = "amount_bg",
			rotation = 360,
			layer = 2,
			color = Color.white
		})
		amount = equipment_panel:child("amount") or equipment_panel:text({
			name = "amount",
			vertical = "center",
			font_size = 12,
			align = "center",
			font = "fonts/font_small_noshadow_mf",
			rotation = 360,
			layer = 3,
			text = tostring(data.amount),
			color = Color.black,
			w = equipment_panel:w(),
			h = equipment_panel:h()
		})

		amount_bg:set_center(bitmap:center())
		amount_bg:move(7, 7)
		amount_bg:set_visible(data.amount > 1)
		amount:set_center(amount_bg:center())
		amount:set_visible(data.amount > 1)
	end

	if id == "grenades_panel" then
		local bitmap_ghost = equipment_panel:bitmap({
			name = "bitmap_ghost",
			layer = 1,
			rotation = 360,
			visible = false,
			texture = icon,
			color = Color.black,
			texture_rect = texture_rect,
			w = equipment_panel:w(),
			h = equipment_panel:h()
		})
		local grenades_radial = equipment_panel:bitmap({
			texture = "guis/textures/pd2/hud_cooldown_timer",
			name = "grenades_radial",
			render_template = "VertexColorTexturedRadial",
			layer = 2,
			color = Color(0.5, 0, 1, 1),
			w = equipment_panel:w(),
			h = equipment_panel:h()
		})
	end
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	if not data.noflashing then
		local flash_icon = equipment_panel:bitmap({
		name = "bitmap",
		texture = icon,
		color = tweak_data.hud.prime_color,
		layer = 2,
		texture_rect = texture_rect,
		w = equipment_panel:w() + 2,
		h = equipment_panel:w() + 2
	})
		flash_icon:set_center(bitmap:center())
		flash_icon:animate(hud.flash_icon, nil, equipment_panel)
	end
	self:layout_special_equipments()
end

function HUDTeammate:set_special_equipment_amount(equipment_id, amount)
	local teammate_panel = self._panel
	local special_equipment = self._special_equipment

	for i, panel in ipairs(special_equipment) do
		if panel:name() == equipment_id then
			panel:child("amount"):set_text(tostring(amount))
			panel:child("amount"):set_visible(amount > 1)
			panel:child("amount_bg"):set_visible(amount > 1)
			if panel:name() == "grenades_panel" then
				panel:child("amount"):set_visible(true)
				panel:child("amount_bg"):set_visible(true)
				panel:child("bitmap"):set_alpha(amount > 0 and 1 or 0.5)
			end
			return
		end
	end
end

function HUDTeammate:teammate_progress(enabled, tweak_data_id, timer, success)
	self._player_panel:child("weapons_panel"):set_alpha(enabled and 0.2 or 1)
	self._player_panel:child("interact_panel"):stop()
	self._player_panel:child("interact_panel"):set_visible(enabled)

	if enabled then
		self._player_panel:child("interact_panel"):animate(callback(HUDManager, HUDManager, "_animate_label_interact"), self._interact, timer)
	elseif success then
		local panel = self._player_panel
		local bitmap = panel:bitmap({
			blend_mode = "add",
			texture = "guis/textures/restoration/hud_progress_active",
			layer = 2,
			align = "center",
			rotation = 360,
			valign = "center"
		})

		bitmap:set_size(self._interact:size())
		bitmap:set_position(self._player_panel:child("interact_panel"):x() + 4, self._player_panel:child("interact_panel"):y() + 4)

		local radius = self._interact:radius()
		local circle = CircleBitmapGuiObject:new(panel, {
			blend_mode = "normal",
			rotation = 360,
			layer = 3,
			radius = radius,
			color = Color.white:with_alpha(1)
		})

		circle:set_position(bitmap:position())
		bitmap:animate(callback(HUDInteraction, HUDInteraction, "_animate_interaction_complete"), circle)
	end
end

function HUDTeammate:set_voice_com(status)
	local texture = status and "guis/textures/pd2/jukebox_playing" or "guis/textures/pd2/hud_tabs"
	local texture_rect = status and { 0, 0, 16, 16 } or { 84, 34, 19, 19 }
	local callsign = self._panel:child("callsign")
	callsign:set_image(texture, unpack(texture_rect))
end

function HUDTeammate:set_callsign(id)
	local teammate_panel = self._panel
	local callsign = teammate_panel:child("callsign")
	local alpha = callsign:color().a

	callsign:set_color((tweak_data.chat_colors[id] or tweak_data.chat_colors[#tweak_data.chat_colors]):with_alpha(alpha))
end