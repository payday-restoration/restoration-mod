if restoration.Options:GetValue("HUD/MainHud") then
function HUDTemp:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("temp_panel") then
		self._hud_panel:remove(self._hud_panel:child("temp_panel"))
	end
	self._temp_panel = self._hud_panel:panel({
		visible = true,
		name = "temp_panel",
		y = 0,
		valign = "scale",
		layer = 0
	})
	local bag_panel = self._temp_panel:panel({
		visible = false,
		name = "bag_panel",
		halign = "right",
		valign = "bottom",
		layer = 10
	})
	local carry_bag = bag_panel:bitmap( { name = "carry_bag", texture_rect = { 28, 52, 201, 161 }, layer = 1, visible = true, halign = "scale", valign = "scale", texture = "guis/textures/restoration/icon_carrybag", color = Color.white, alpha = 1} )
	carry_bag:set_size( carry_bag:w() * 0.5, carry_bag:h() * 0.5 )
	bag_panel:set_size( carry_bag:size() )
	local bag_text = bag_panel:text({
		name = "bag_text",
		visible = true,
		text = "JEWELRY\n$250,000",
		font = "fonts/font_medium_noshadow_mf",
		align = "center",
		vertical = "center",
		font_size = 42,
		layer = 2,
		halign = "scale",
		valign = "scale",
		color = Color.black,
		w = 256,
		h = 128
	})
	bag_text:set_size(bag_panel:size())
	bag_text:set_position( 0, 4 )
	self._bag_panel_w = bag_panel:w()
	self._bag_panel_h = bag_panel:h()
	carry_bag:set_size( bag_panel:size() )
	bag_panel:set_right(self._temp_panel:w())
	bag_panel:set_bottom( self._temp_panel:h() - 152 )
	self._curr_stamina = 0
	self._max_stamina = 0
	self._stamina_panel = self._temp_panel:panel({
		visible = true,
		name = "stamina_panel",
		layer = 0,
		w = 16,
		h = 128,
		halign = "right",
		valign = "center",
		alpha = 1
	})
	local stamina_bar_bg = self._stamina_panel:rect({
		name = "stamina_bar_bg",
		color = Color(0.6, 0.6, 0.6),
		alpha = 0.25
	})
	local low_stamina_bar = self._stamina_panel:rect({
		name = "low_stamina_bar",
		color = Color(0.6, 0.6, 0.6),
		alpha = 0
	})
	local stamina_bar = self._stamina_panel:rect({
		name = "stamina_bar",
		color = Color(0.6, 0.6, 0.6),
		layer = 1
	})
	local stamina_threshold = self._stamina_panel:rect({
		name = "stamina_threshold",
		color = Color(1, 1, 1),
		layer = 2,
		h = 2
	})
	self._stamina_panel:rect({
		name = "top_border",
		color = Color(),
		layer = 3,
		h = 2
	}):set_top(0)
	self._stamina_panel:rect({
		name = "bottom_border",
		color = Color(),
		layer = 3,
		h = 2
	}):set_bottom(128)
	self._stamina_panel:rect({
		name = "left_border",
		color = Color(),
		layer = 3,
		w = 2
	}):set_left(0)
	self._stamina_panel:rect({
		name = "right_border",
		color = Color(),
		layer = 3,
		w = 2
	}):set_right(16)
	self._stamina_panel:set_right(self._temp_panel:w())
	self._stamina_panel:set_center_y(self._temp_panel:center_y())
end
function HUDTemp:_bag_panel_bottom()
	return self._temp_panel:h() - managers.hud:teampanels_height()
end
function HUDTemp:show_carry_bag(carry_id, value)
	local bag_panel = self._temp_panel:child("bag_panel")
	local carry_data = tweak_data.carry[carry_id]
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
	local bag_text = bag_panel:child("bag_text")
	local real_value = managers.money:get_secured_bonus_bag_value(carry_id, value)
	bag_text:set_text(utf8.to_upper(type_text .. [[
 
 ]] .. managers.experience:cash_string(real_value)))
	bag_panel:set_x(self._temp_panel:parent():w() / 2)
	bag_panel:set_visible(true)
	bag_panel:stop()
	bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
end
function HUDTemp:hide_carry_bag()
	local bag_panel = self._temp_panel:child("bag_panel")
	bag_panel:set_visible(false)
end
function HUDTemp:_animate_show_bag_panel(bag_panel)
	local w, h = self._bag_panel_w, self._bag_panel_h
	local scx = self._temp_panel:w() / 2
	local ecx = self._temp_panel:w() - w / 2
	local scy = self._temp_panel:h() / 2
	local ecy = (self._temp_panel:h() - 152) - self._bag_panel_h / 2
	if pdth_hud and pdth_hud.Options:GetValue("HUD/MainHud") then -- some love for Bushy
		local const = pdth_hud.constants
		ecx = self._temp_panel:w() - ((w / 2) + (const.main_equipment_size *  1.5) + const.main_bag_gap)
		ecy = self._temp_panel:h() - ((h / 2) + (const.main_equipment_size * const.main_equipment_y_offset_multiplier))
	end
	local bottom = bag_panel:bottom()
	local center_y = bag_panel:center_y()
	local scale = 2
	bag_panel:set_size(w * scale, h * scale)
	local font_size = 24
	local bag_text = bag_panel:child("bag_text")
	bag_text:set_font_size(font_size * scale)
	bag_text:set_rotation(360)
	local _, _, tw, th = bag_text:text_rect()
	font_size = font_size * math.min(1, bag_panel:w() / (tw * 1.15))
	local TOTAL_T = 0.25
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local wm = math.lerp(0, w * scale, 1 - t / TOTAL_T)
		local hm = math.lerp(0, h * scale, 1 - t / TOTAL_T)
		bag_panel:set_size(wm, hm)
		bag_panel:set_center_x(scx)
		bag_panel:set_center_y(scy)
		bag_text:set_font_size(math.lerp(0, font_size * scale, 1 - t / TOTAL_T))
	end
	wait(0.5)
	local TOTAL_T = 0.5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local wm = math.lerp(w * scale, w, 1 - t / TOTAL_T)
		local hm = math.lerp(h * scale, h, 1 - t / TOTAL_T)
		bag_panel:set_size(wm, hm)
		bag_panel:set_center_x(math.lerp(scx, ecx, 1 - t / TOTAL_T))
		bag_panel:set_center_y(math.lerp(scy, ecy, 1 - t / TOTAL_T))
		bag_text:set_font_size(math.lerp(font_size * scale, font_size, 1 - t / TOTAL_T))
	end
	bag_panel:set_size(w, h)
	bag_panel:set_center_x(ecx)
	bag_panel:set_center_y(ecy)
	bag_text:set_font_size(font_size)
end
function HUDTemp:set_stamina_value(value)
	self._curr_stamina = value
	self._stamina_panel:child("stamina_bar"):set_h(value / math.max(1, self._max_stamina) * self._stamina_panel:h())
	self._stamina_panel:child("stamina_bar"):set_bottom(self._stamina_panel:h())
	if self._curr_stamina < tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD then
		self._stamina_panel:animate(callback(self, self, "_animate_low_stamina"))
	else
		self._stamina_panel:child("low_stamina_bar"):set_alpha(0)
		self._stamina_panel:stop()
	end
end

end
function HUDTemp:set_max_stamina(value)
	self._max_stamina = value
	self._stamina_panel:set_alpha(restoration.Options:GetValue("HUD/StaminaIndicator") and 1 or 0)
	self._stamina_panel:child("stamina_threshold"):set_center_y(self._stamina_panel:h() - tweak_data.player.movement_state.stamina.MIN_STAMINA_THRESHOLD / math.max(1, self._max_stamina) * self._stamina_panel:h())
end