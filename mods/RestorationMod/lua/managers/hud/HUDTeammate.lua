if restoration.Options:GetValue("HUD/MainHud") then
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
		visible = false,
		name = "" .. i,
		w = math.round(width),
		x = 0,
		halign = "right"
	})
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
		text = " " .. names[i],
		layer = 1,
		color = Color.white,
		y = 0,
		vertical = "bottom",
		font_size = tweak_data.hud_players.name_size,
		font = tweak_data.hud_players.name_font
	})
	local _, _, name_w, _ = name:text_rect()
	managers.hud:make_fine_text(name)
	name:set_leftbottom(name:h(), teammate_panel:h() - 70)
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
		texture = tabs_texture,
		texture_rect = bg_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		x = name:x(),
		y = name:y() - 1,
		w = name_w + 4,
		h = name:h()
	})
	teammate_panel:bitmap({
		name = "callsign_bg",
		texture = tabs_texture,
		texture_rect = csbg_rect,
		layer = 0,
		color = bg_color,
		blend_mode = "normal",
		x = name:x() - name:h(),
		y = name:y() + 1,
		w = name:h() - 2,
		h = name:h() - 2
	})
	teammate_panel:bitmap({
		name = "callsign",
		texture = tabs_texture,
		texture_rect = cs_rect,
		layer = 1,
		color = tweak_data.chat_colors[i]:with_alpha(1),
		blend_mode = "normal",
		x = name:x() - name:h(),
		y = name:y() + 1,
		w = name:h() - 2,
		h = name:h() - 2
	})
	local box_ai_bg = teammate_panel:bitmap({
		visible = false,
		name = "box_ai_bg",
		texture = "guis/textures/pd2/box_ai_bg",
		color = Color.white,
		alpha = 0,
		y = 0,
		w = teammate_panel:w()
	})
	box_ai_bg:set_bottom(name:top())
	local box_bg = teammate_panel:bitmap({
		visible = false,
		name = "box_bg",
		texture = "guis/textures/pd2/box_bg",
		color = Color.white,
		y = 0,
		w = teammate_panel:w()
	})
	box_bg:set_bottom(name:top())
	local texture, rect = tweak_data.hud_icons:get_icon_data("pd2_mask_" .. i)
	local size = 64
	local mask_pad = 2
	local mask_pad_x = 3
	local y = teammate_panel:h() - name:h() - size + mask_pad
	local mask = teammate_panel:bitmap({
		visible = false,
		name = "mask",
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
		layer = 1,
		w = radial_size + 4,
		h = radial_size + 4,
		x = 0,
		y = mask:y()
	})
	radial_health_panel:set_bottom(self._player_panel:h())
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
			64,
			0,
			-64,
			64
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
			64,
			0,
			-64,
			64
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
	local radial_ability_panel = radial_health_panel:panel({name = "radial_ability"})
	local radial_ability_meter = radial_ability_panel:bitmap({
		blend_mode = "add",
		name = "ability_meter",
		texture = "guis/dlcs/chico/textures/pd2/hud_fearless",
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})
	local radial_ability_icon = radial_ability_panel:bitmap({
		blend_mode = "add",
		name = "ability_icon",
		visible = false,
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
		layer = 5,
		w = radial_delayed_damage_panel:w(),
		h = radial_delayed_damage_panel:h()
	})
	local radial_delayed_damage_health = radial_delayed_damage_panel:bitmap({
		texture = "guis/textures/restoration/hud_dot",
		name = "radial_delayed_damage_health",
		visible = false,
		render_template = "VertexColorTexturedRadialFlex",
		layer = 5,
		w = radial_delayed_damage_panel:w(),
		h = radial_delayed_damage_panel:h()
	})

	if main_player then
		local radial_rip = radial_health_panel:bitmap({
			texture = "guis/textures/pd2/hud_rip",
			name = "radial_rip",
			layer = 3,
			blend_mode = "add",
			visible = false,
			render_template = "VertexColorTexturedRadial",
			texture_rect = {
				64,
				0,
				-64,
				64
			},
			color = Color(1, 0, 0, 0),
			w = radial_health_panel:w(),
			h = radial_health_panel:h()
		})
		local radial_rip_bg = radial_health_panel:bitmap({
			texture = "guis/textures/pd2/hud_rip_bg",
			name = "radial_rip_bg",
			layer = 1,
			visible = false,
			render_template = "VertexColorTexturedRadial",
			texture_rect = {
				64,
				0,
				-64,
				64
			},
			color = Color(1, 0, 0, 0),
			w = radial_health_panel:w(),
			h = radial_health_panel:h()
		})
	end

	radial_health_panel:bitmap({
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_shield",
		name = "radial_absorb_shield_active",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		layer = 5,
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})

	local radial_absorb_health_active = radial_health_panel:bitmap({
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_health",
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
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_stack_fg",
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
		texture = "guis/dlcs/coco/textures/pd2/hud_absorb_stack_bg",
		name = "radial_info_meter_bg",
		layer = 1,
		visible = false,
		render_template = "VertexColorTexturedRadial",
		texture_rect = {
			64,
			0,
			-64,
			64
		},
		color = Color(1, 0, 0, 0),
		w = radial_health_panel:w(),
		h = radial_health_panel:h()
	})

	local x, y, w, h = radial_health_panel:shape()
	teammate_panel:bitmap({
		name = "condition_icon",
		layer = 4,
		visible = false,
		color = Color.white,
		x = x,
		y = y,
		w = w,
		h = h
	})
	local condition_timer = teammate_panel:text({
		name = "condition_timer",
		visible = false,
		text = "000",
		layer = 5,
		color = Color.white,
		y = 0,
		align = "center",
		vertical = "center",
		font_size = tweak_data.hud_players.timer_size,
		font = tweak_data.hud_players.timer_font
	})
	condition_timer:set_shape(radial_health_panel:shape())
	local w_selection_w = 13
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
	local weapons_panel = self._player_panel:panel({
		name = "weapons_panel",
		visible = true,
		layer = 0,
		w = weapon_panel_w,
		h = radial_health_panel:h(),
		x = radial_health_panel:right() + 4,
		y = radial_health_panel:y()
	})
	local primary_weapon_panel = weapons_panel:panel({
		name = "primary_weapon_panel",
		visible = false,
		layer = 1,
		w = weapon_panel_w,
		h = 32,
		x = 0,
		y = 0
	})
	primary_weapon_panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = bg_rect,
		visible = true,
		layer = 0,
		--color = bg_color,
		w = 67,
		x = 0
	})
	primary_weapon_panel:text({
		name = "ammo_clip",
		visible = true,
		text = "0" .. math.random(40),
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		w = ammo_text_w + extra_clip_w,
		h = primary_weapon_panel:h(),
		x = 0,
		y = -1,-- + font_bottom_align_correction,
		vertical = "bottom",
		align = "center",
		font_size = 30,
		font = "fonts/font_medium_noshadow_mf"
	})
	primary_weapon_panel:text({
		name = "ammo_total",
		visible = true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		w = ammo_text_w - extra_clip_w,
		h = primary_weapon_panel:h(),
		x = ammo_text_w + extra_clip_w,
		y = -1, --+ font_bottom_align_correction,
		vertical = "bottom",
		align = "center",
		font_size = 20,
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
		visible = false,
		layer = 1,
		w = weapon_panel_w,
		h = 32,
		x = 0,
		y = primary_weapon_panel:bottom()
	})
	secondary_weapon_panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = bg_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		w = 67,
		x = 0
	})
	secondary_weapon_panel:text({
		name = "ammo_clip",
		visible = true,
		text = "" .. math.random(40),
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		w = ammo_text_w + extra_clip_w,
		h = secondary_weapon_panel:h(),
		x = 0,
		y = -1, --+ font_bottom_align_correction,
		vertical = "bottom",
		align = "center",
		font_size = 30,
		font = "fonts/font_medium_noshadow_mf"
	})
	secondary_weapon_panel:text({
		name = "ammo_total",
		visible = true,
		text = "000",
		color = Color.white,
		blend_mode = "normal",
		layer = 1,
		w = ammo_text_w - extra_clip_w,
		h = secondary_weapon_panel:h(),
		x = ammo_text_w + extra_clip_w,
		y = -1, --+ font_bottom_align_correction,
		vertical = "bottom",
		align = "center",
		font_size = 20,
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
		w = 48,
		h = 32,
		x = weapons_panel:right() + 4,
		y = weapons_panel:y()
	})
	deployable_equipment_panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = eq_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		w = deployable_equipment_panel:w(),
		x = 0
	})
	local equipment = deployable_equipment_panel:bitmap({
		name = "equipment",
		visible = false,
		layer = 1,
		--color = Color.white,
		w = deployable_equipment_panel:h(),
		h = deployable_equipment_panel:h(),
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
	local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.cable_tie.icon)
	local cable_ties_panel = self._player_panel:panel({
		name = "cable_ties_panel",
		visible = true,
		layer = 1,
		w = 48,
		h = 32,
		x = weapons_panel:right() + 4,
		y = weapons_panel:y()
	})
	cable_ties_panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = eq_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		w = deployable_equipment_panel:w(),
		x = 0
	})
	local cable_ties = cable_ties_panel:bitmap({
		name = "cable_ties",
		visible = false,
		texture = texture,
		texture_rect = rect,
		layer = 1,
		color = Color.white,
		w = deployable_equipment_panel:h(),
		h = deployable_equipment_panel:h(),
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

		cable_ties_panel:set_bottom(weapons_panel:bottom())

	--[[if PlayerBase.USE_GRENADES then
		local texture, rect = tweak_data.hud_icons:get_icon_data("frag_grenade")
		local grenades_panel = self._player_panel:panel({
			name = "grenades_panel",
			visible = true,
			layer = 1,
			w = eq_w,
			h = eq_h,
			x = weapons_panel:right() + 4,
			y = weapons_panel:y()
		})
		grenades_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = eq_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			w = cable_ties_panel:w(),
			x = 0
		})
		local grenades = grenades_panel:bitmap({
			name = "grenades",
			visible = true,
			texture = texture,
			texture_rect = rect,
			layer = 1,
			color = Color.white,
			w = cable_ties_panel:h() * temp_scale,
			h = cable_ties_panel:h() * temp_scale,
			x = -(cable_ties_panel:h() * temp_scale - cable_ties_panel:h()) / 2,
			y = -(cable_ties_panel:h() * temp_scale - cable_ties_panel:h()) / 2
		})
		local amount = grenades_panel:text({
			name = "amount",
			visible = true,
			text = tostring("03"),
			font = "fonts/font_medium_mf",
			font_size = 22,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			x = -2,
			y = 2,
			w = grenades_panel:w(),
			h = grenades_panel:h()
		})
		grenades_panel:set_bottom(weapons_panel:bottom())
	end]]
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
	local carry_panel = self._player_panel:panel({ 
		name = "carry_panel", 
		visible = false, 
		layer = 1, 
		w = self._player_panel:w(), 
		h = bag_rect[ 4 ] + 2, 
		x = name:x(), 
		y = name:top() - 4 - (bag_rect[ 4 ] + 2) 
	})
	--carry_panel:set_x(24 - bag_w / 2)
	--carry_panel:set_center_x(name:center_x())
	carry_panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = bg_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		x = 0,
		y = 0,
		w = 100,
		h = carry_panel:h()
	})
	carry_panel:bitmap({
		name = "bag",
		texture = tabs_texture,
		w = bag_w,
		h = bag_h,
		texture_rect = bag_rect,
		visible = true,
		layer = 0,
		color = Color.white,
		x = 1,
		y = 1
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
	local interact_panel = self._player_panel:panel({
		name = "interact_panel",
		visible = false,
		layer = 3
	})
	interact_panel:set_shape(weapons_panel:shape())
	interact_panel:set_shape(radial_health_panel:shape())
	interact_panel:set_size(radial_size * 1.25, radial_size * 1.25)
	interact_panel:set_center(weapons_panel:center())
	local radius = interact_panel:h() / 2 - 4
	self._interact = CircleBitmapGuiObject:new(interact_panel, {
		use_bg = true,
		rotation = 360,
		radius = radius,
		blend_mode = "add",
		color = Color.white,
		layer = 0
	})
	self._interact:set_position(4, 4)
	self._special_equipment = {}
	self._panel = teammate_panel
	self:create_waiting_panel(teammates_panel)
end

function HUDTeammate:_create_equipment(panel, icon_name, scale)
	scale = scale or 1
	local icon, rect
	if icon_name then
		icon, rect = tweak_data.hud_icons:get_icon_data(icon_name)
	end
	local eq_h = 21.333334
	local eq_w = 48
	local eq_rect = {
		84,
		0,
		44,
		32
	}
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bg_color = Color.white / 3
	panel:set_w(eq_w * scale)
	panel:set_h(eq_h * scale)
	local vis_at_start = true
	local bg = panel:bitmap({
		name = "bg",
		texture = tabs_texture,
		texture_rect = eq_rect,
		visible = true,
		layer = 0,
		color = bg_color,
		w = panel:w(),
		h = panel:h(),
		x = 0
	})
	local icon = panel:bitmap({
		name = "icon",
		texture = icon,
		texture_rect = rect,
		visible = vis_at_start,
		layer = 1,
		color = Color.white,
		w = panel:h() * scale,
		h = panel:h() * scale,
		x = 2
	})
	local amount = panel:text({
		name = "amount",
		visible = vis_at_start,
		text = "00",
		font = "fonts/font_medium_mf",
		font_size = 22,
		color = Color.white,
		align = "center",
		vertical = "center",
		layer = 2,
		w = panel:w(),
		h = panel:h()
	})
	managers.hud:make_fine_text(amount)
	amount:set_right(bg:right() - 2)
	amount:set_center_y(bg:center_y() + 1)
end

function HUDTeammate:create_waiting_panel(parent_panel)
	local PADD = 2
	local panel = parent_panel:panel()
	print(self._panel:lefttop())
	print(panel:lefttop())
	print(self._panel:world_x(), self._panel:world_y())
	print(panel:world_x(), panel:world_y())
	panel:set_visible(false)
	panel:set_lefttop(self._panel:lefttop())
	local name = panel:text({
		name = "name",
		font_size = tweak_data.hud_players.name_size,
		font = tweak_data.hud_players.name_font
	})
	local player_panel = self._panel:child("player")
	local health_panel = player_panel:child("radial_health_panel")
	local detection = panel:panel({
		name = "detection",
		w = health_panel:w(),
		h = health_panel:h()
	})
	detection:set_lefttop(health_panel:lefttop())
	local detection_ring_left_bg = detection:bitmap({
		name = "detection_left_bg",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		alpha = 0.2,
		blend_mode = "add",
		w = detection:w(),
		h = detection:h()
	})
	local detection_ring_right_bg = detection:bitmap({
		name = "detection_right_bg",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		alpha = 0.2,
		blend_mode = "add",
		w = detection:w(),
		h = detection:h()
	})
	detection_ring_right_bg:set_texture_rect(detection_ring_right_bg:texture_width(), 0, -detection_ring_right_bg:texture_width(), detection_ring_right_bg:texture_height())
	local detection_ring_left = detection:bitmap({
		name = "detection_left",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1,
		w = detection:w(),
		h = detection:h()
	})
	local detection_ring_right = detection:bitmap({
		name = "detection_right",
		texture = "guis/textures/pd2/mission_briefing/inv_detection_meter",
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1,
		w = detection:w(),
		h = detection:h()
	})
	detection_ring_right:set_texture_rect(detection_ring_right:texture_width(), 0, -detection_ring_right:texture_width(), detection_ring_right:texture_height())
	local detection_value = panel:text({
		name = "detection_value",
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.pd2_medium_font,
		align = "center",
		vertical = "center"
	})
	detection_value:set_center_x(detection:left() + detection:w() / 2)
	detection_value:set_center_y(detection:top() + detection:h() / 2 + 2)
	local bg_rect = {
		84,
		0,
		44,
		32
	}
	local tabs_texture = "guis/textures/pd2/hud_tabs"
	local bg_color = Color.white / 3
	name:set_lefttop(detection:right() + PADD, detection:top())
	local bg = panel:bitmap({
		name = "name_bg",
		texture = tabs_texture,
		texture_rect = bg_rect,
		visible = true,
		layer = -1,
		color = bg_color,
		y = name:y() - PADD
	})
	bg:set_lefttop(detection:right() + PADD, detection:top())
	local deploy_panel = panel:panel({name = "deploy"})
	local throw_panel = panel:panel({name = "throw"})
	local perk_panel = panel:panel({name = "perk"})
	self:_create_equipment(deploy_panel, "frag_grenade")
	self:_create_equipment(throw_panel, "frag_grenade")
	self:_create_equipment(perk_panel, "frag_grenade")
	deploy_panel:set_lefttop(detection:right() + PADD, detection:center_y())
	throw_panel:set_lefttop(deploy_panel:right() + PADD, deploy_panel:top())
	perk_panel:set_lefttop(throw_panel:right() + PADD, deploy_panel:top())
	self._wait_panel = panel
end
local set_icon_data = function(image, icon, rect)
	if rect then
		image:set_image(icon, unpack(rect))
		return
	end
	local text, rect = tweak_data.hud_icons:get_icon_data(icon or "fallback")
	image:set_image(text, unpack(rect))
end
function HUDTeammate:set_waiting(waiting, peer)
	local my_peer = managers.network:session():peer(self._peer_id)
	peer = peer or my_peer
	if self._wait_panel then
		if waiting then
			self._panel:set_visible(false)
			self._wait_panel:set_lefttop(self._panel:lefttop())
			local name = self._wait_panel:child("name")
			local name_bg = self._wait_panel:child("name_bg")
			local detection = self._wait_panel:child("detection")
			local detection_value = self._wait_panel:child("detection_value")
			local current, reached = managers.blackmarket:get_suspicion_offset_of_peer(peer, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
			detection:child("detection_left"):set_color(Color(0.5 + current * 0.5, 1, 1))
			detection:child("detection_right"):set_color(Color(0.5 + current * 0.5, 1, 1))
			detection_value:set_text(math.round(current * 100))
			if reached then
				detection_value:set_color(Color(255, 255, 42, 0) / 255)
			else
				detection_value:set_color(tweak_data.screen_colors.text)
			end
			local outfit = peer:profile().outfit
			outfit = outfit or managers.blackmarket:unpack_outfit_from_string(peer:profile().outfit_string) or {}
			name:set_text(" " .. peer:name() .. "  " .. (0 < peer:rank() and managers.experience:rank_string(peer:rank()) .. "-" or "") .. (peer:level() or "") .. "")
			managers.hud:make_fine_text(name)
			name_bg:set_w(name:w() + 4)
			name_bg:set_h(name:h())
			local has_deployable = outfit.deployable and outfit.deployable ~= "nil"
			self._wait_panel:child("deploy"):child("amount"):set_text(has_deployable and outfit.deployable_amount or "")
			self._wait_panel:child("throw"):child("amount"):set_text(managers.player:get_max_grenades(peer:grenade_id()))
			self._wait_panel:child("perk"):child("amount"):set_text(outfit.skills.specializations[2])
			local deploy_image = self._wait_panel:child("deploy"):child("icon")
			if has_deployable then
				set_icon_data(deploy_image, tweak_data.equipments[outfit.deployable].icon)
				deploy_image:set_position(0, 0)
			else
				set_icon_data(deploy_image, "none_icon")
				deploy_image:set_world_center(self._wait_panel:child("deploy"):world_center())
			end
			set_icon_data(self._wait_panel:child("throw"):child("icon"), outfit.grenade and tweak_data.blackmarket.projectiles[outfit.grenade].icon)
			set_icon_data(self._wait_panel:child("perk"):child("icon"), tweak_data.skilltree:get_specialization_icon_data(tonumber(outfit.skills.specializations[1])))
		elseif self._ai or my_peer and my_peer:unit() then
			self._panel:set_visible(true)
		end
		self._wait_panel:set_visible(waiting)
	end
end

function HUDTeammate:is_waiting()
	return self._wait_panel:visible()
end


function HUDTeammate:set_name(teammate_name)
	local teammate_panel = self._panel
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign = teammate_panel:child("callsign")
	name:set_text( utf8.to_upper( " "..teammate_name ) )
	local h = name:h()
	managers.hud:make_fine_text(name)
	name:set_h(h)
	name_bg:set_w(name:w() + 4)
end

function HUDTeammate:set_carry_info(carry_id, value)
	local carry_panel = self._player_panel:child("carry_panel")
	carry_panel:set_visible(true)
	local value_text = carry_panel:child("value")
	local real_value = managers.money:get_secured_bonus_bag_value(carry_id, value)
	value_text:set_text(managers.experience:cash_string(real_value))
	local _, _, w, _ = value_text:text_rect()
	local bg = carry_panel:child("bg")
	bg:set_w(carry_panel:child("bag"):w() + w + 4)
end

function HUDTeammate:_set_amount_string(text, amount)
	text:set_text( tostring( amount ) )
	text:set_visible( amount ~= 0 )
end

function HUDTeammate:set_state(state)
	local teammate_panel = self._panel
	local is_player = state == "player"
	teammate_panel:child("player"):set_alpha(is_player and 1 or 0)
	local name = teammate_panel:child("name")
	local name_bg = teammate_panel:child("name_bg")
	local callsign_bg = teammate_panel:child("callsign_bg")
	local callsign = teammate_panel:child("callsign")
end

function HUDTeammate:teammate_progress(enabled, tweak_data_id, timer, success)
	self._player_panel:child( "weapons_panel" ):set_alpha( enabled and 0.2 or 1 )
	self._player_panel:child("interact_panel"):stop()
	self._player_panel:child("interact_panel"):set_visible(enabled)
	if enabled then
		self._player_panel:child("interact_panel"):animate(callback(HUDManager, HUDManager, "_animate_label_interact"), self._interact, timer)
	elseif success then
		local panel = self._player_panel
		local bitmap = panel:bitmap({
			rotation = 360,
			texture = "guis/textures/restoration/hud_progress_active",
			blend_mode = "add",
			align = "center",
			valign = "center",
			layer = 2
		})
		bitmap:set_size(self._interact:size())
		bitmap:set_position(self._player_panel:child("interact_panel"):x() + 4, self._player_panel:child("interact_panel"):y() + 4)
		local radius = self._interact:radius()
		local circle = CircleBitmapGuiObject:new(panel, {
			rotation = 360,
			radius = radius,
			color = Color.white:with_alpha(1),
			blend_mode = "normal",
			layer = 3
		})
		circle:set_position(bitmap:position())
		bitmap:animate(callback(HUDInteraction, HUDInteraction, "_animate_interaction_complete"), circle)
	end
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
			RestorationCore.log_shit("J = " .. j .. "I = " .. i)
			local x_offset = i > 3 and panel:w()/2 or 0
			panel:set_x( w - (panel:w() + 0) * (j) - x_offset )
			panel:set_y( y )
		end
	end
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
				RestorationCore.log_shit("[RESTORATION] Added a grenade panel.")
            else
                return
            end
        end
end

function HUDTeammate:set_grenades_amount(data, ignore)
	if not data then
		return
	end
	if data.amount < 1 and not ignore then
		self:remove_special_equipment("grenades_panel")
	else
		self:set_special_equipment_amount("grenades_panel", data.amount)
		local test = data.amount
		log("RESTORE" .. test)
		self:set_grenades(data)
	end
end


function HUDTeammate:set_ability_cooldown(data) -- Not working anymore, left just in case ~~ D.A.
    if not PlayerBase.USE_GRENADES then
     	return
    end
	data.cooldown = data.cooldown and math.ceil(data.cooldown) or 0
	self:set_grenades_amount({amount = data.cooldown}, true)
end

function HUDTeammate:set_grenade_cooldown(data)
	if not PlayerBase.USE_GRENADES then
		return
	end

	local teammate_panel = self
	local end_time = data and data.end_time
	local duration = data and data.duration

	if self._main_player then
		managers.network:session():send_to_peers("sync_grenades_cooldown", end_time, duration)
	end
end

function HUDTeammate:animate_grenade_flash()
	local teammate_panel = self._panel:child("player")
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
		name = id,
		layer = 0,
		y = 0
	})
	if icon_conversion[data.icon] then -- thanks a lot Bushy
		data.icon = icon_conversion[data.icon]
	end
	local icon, texture_rect = tweak_data.hud_icons:get_icon_data(data.icon)
	equipment_panel:set_size( 32, 32 )
	local bitmap = equipment_panel:bitmap({
		name = "bitmap",
		texture = icon,
		--color = Color.white,
		layer = 1,
		texture_rect = texture_rect,
		w = equipment_panel:w(),
		h = equipment_panel:w()
	})
	local amount, amount_bg
	if data.amount then
		amount = equipment_panel:child("amount") or equipment_panel:text({
			name = "amount",
			text = tostring(data.amount),
			font = "fonts/font_small_noshadow_mf",
			font_size = 12,
			color = Color.black,
			align = "center",
			vertical = "center",
			layer = 4,
			w = equipment_panel:w(),
			h = equipment_panel:h()
		})
		amount:set_visible(1 < data.amount)
		amount_bg = equipment_panel:child("amount_bg") or equipment_panel:bitmap({
			name = "amount_bg",
			texture = "guis/textures/pd2/equip_count",
			color = Color.white,
			layer = 3
		})
		amount_bg:set_visible(1 < data.amount)
	end

	table.insert(special_equipment, equipment_panel)
	local w = teammate_panel:w()
	equipment_panel:set_x(w - (equipment_panel:w() + 0) * #special_equipment)
	if amount then
		amount_bg:set_center(bitmap:center())
		amount_bg:move(7, 7)
		amount:set_center(amount_bg:center())
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
		flash_icon:animate(callback(self, self, "equipment_flash_icon"))
	end
	self:layout_special_equipments()
end

function HUDTeammate:equipment_flash_icon( o)
  		local t = 4
		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			o:set_color( o:color():with_alpha( 0.5 + (math.sin( Application:time()*750 )+1)/4 ) )
		end
		o:set_alpha(0)
end

end
