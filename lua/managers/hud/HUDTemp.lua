if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	function HUDTemp:dodge_init()
		self._dodge_panel = self._temp_panel:panel({
			visible = true,
			name = "dodge_panel",
			layer = 0,
			w = 16,
			h = 128,
			halign = "right",
			valign = "center",
			alpha = 0
		})
		local dodge_bar_bg = self._dodge_panel:rect({
			name = "dodge_bar_bg",
			color = Color(0.6, 0.6, 0.6),
			alpha = 0.25
		})
		local dodge_bar = self._dodge_panel:rect({
			name = "dodge_bar",
			color = Color(0.5, 0.5, 0.8),
			layer = 1
		})
		local dodge_threshold = self._dodge_panel:rect({
			name = "dodge_threshold",
			color = Color(0.0, 0.0, 0.0),
			layer = 4,
			h = 2
		})
		self._dodge_panel:rect({
			name = "top_border",
			color = Color(0.0, 0.0, 0.0),
			layer = 3,
			h = 2
		}):set_top(0)
		self._dodge_panel:rect({
			name = "bottom_border",
			color = Color(0.0, 0.0, 0.0),
			layer = 3,
			h = 2
		}):set_bottom(128)
		self._dodge_panel:rect({
			name = "left_border",
			color = Color(0.0, 0.0, 0.0),
			layer = 3,
			w = 2
		}):set_left(0)
		self._dodge_panel:rect({
			name = "right_border",
			color = Color(0.0, 0.0, 0.0),
			layer = 3,
			w = 2
		}):set_right(16)
		--Move slightly closer to center of screen for readability and so it doesn't overlap with stamina.
		self._dodge_panel:set_right(self._temp_panel:w() - 16)
		self._dodge_panel:set_center_y(self._temp_panel:center_y())
		self._dodge_panel:set_alpha(0) --Hide dodge panel until players actually get dodge.
		if restoration.Options:GetValue("HUD/MainHUD") then
			self:RestorationValueChanged()
		end
	end

	function HUDTemp:set_dodge_value(value, total_dodge)
		self._dodge_panel:set_alpha(1) --Display dodge panel when needed.
		self._dodge_panel:child("dodge_bar"):set_h((value / (1.5-total_dodge)) * self._dodge_panel:h())
		self._dodge_panel:child("dodge_bar"):set_bottom(self._dodge_panel:h())
		self._dodge_panel:child("dodge_threshold"):set_center_y((1.0 - ((1.0-total_dodge) / (1.5-total_dodge))) * self._dodge_panel:h())
		if value >= 1.0 - total_dodge then
			self._dodge_panel:animate(callback(self, self, "_animate_high_dodge"))
		else
			self._dodge_panel:stop()
			self._dodge_panel:child("dodge_bar"):set_color(Color(0.5, 0.5, 0.8))
		end
	end

	function HUDTemp:_animate_high_dodge(input_panel)
		--Flashing animation for when next hit will be dodged.
		local dodge_bar = input_panel:child("dodge_bar")
		while true do
			local a = (math.sin(Application:time() * 750) + 1) / 4
			dodge_bar:set_color(Color(0.5 + a, 0.5 + a, 0.8))
			coroutine.yield()
		end
	end
end

if not restoration.Options:GetValue("HUD/MainHUD") then
	RestorationCoreHooks:Post(HUDTemp, "init", function(self)
		if restoration and restoration.Options:GetValue("SC/SC") then
			self:dodge_init()
		end

	end)
end

if restoration.Options:GetValue("HUD/MainHUD") then
	RestorationCoreHooks:Post(HUDTemp, "init", function(self)
		if restoration.Options:GetValue("HUD/Bag") then
			self._bg_box:set_alpha(0)
			self._bg_box:hide()
			self._bg_box:set_size(0,0)
			local bag_panel = self._temp_panel:child("bag_panel")
			bag_panel:child("bag_text"):configure({
				visible = true,
				text = "JEWELRY\n$250,000",
				font = "fonts/font_medium_noshadow_mf",
				layer = 2
			})
			local carry_bag = bag_panel:bitmap({name = "carry_bag", texture_rect = {28, 52, 201, 161}, layer = 1, halign = "scale", valign = "scale", texture = "guis/textures/restoration/icon_carrybag"})
			carry_bag:set_size(carry_bag:w() * 0.5, carry_bag:h() * 0.5)
			bag_panel:set_size(carry_bag:size())
			carry_bag:set_size(bag_panel:size())
			bag_panel:set_bottom(self._temp_panel:h() - 152)
			self._stamina_panel:set_alpha(1)
			self._bag_panel_w, self._bag_panel_h = bag_panel:size()
		end
		if restoration and restoration.Options:GetValue("SC/SC") and restoration.Options:GetValue("HUD/MainHUD") then
			self:dodge_init()
		end
		RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
		self:RestorationValueChanged()
	end)

	function HUDTemp:RestorationValueChanged()
		self._stamina_panel:set_alpha(restoration.Options:GetValue("HUD/StaminaIndicator") and 1 or 0)
		local stamina_color = restoration.Options:GetValue("HUD/Colors/Stamina")
		self._stamina_panel:child("stamina_bar_bg"):set_color(stamina_color)
		self._stamina_panel:child("low_stamina_bar"):set_color(stamina_color)
		self._stamina_panel:child("stamina_bar"):set_color(stamina_color)
		self._stamina_panel:child("stamina_threshold"):set_color(restoration.Options:GetValue("HUD/Colors/StaminaThreshold"))
		local bag_panel = self._temp_panel:child("bag_panel")
		if alive(bag_panel:child("carry_bag")) then
			bag_panel:child("carry_bag"):set_color(restoration.Options:GetValue("HUD/Colors/BagBitmap"))
			bag_panel:child("bag_text"):set_color(restoration.Options:GetValue("HUD/Colors/BagText"))
		end
	end

	if not restoration.Options:GetValue("HUD/Bag") then
		return
	end

	function HUDTemp:show_carry_bag(carry_id, value)
		local bag_panel = self._temp_panel:child("bag_panel")
		local carry_data = tweak_data.carry[carry_id]
		local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
		local bag_text = bag_panel:child("bag_text")
		local real_value = managers.money:get_secured_bonus_bag_value(carry_id, value)
		bag_text:set_text(utf8.to_upper(type_text .. "\n" .. tostring(managers.experience:cash_string(real_value))))
		bag_panel:set_x(self._temp_panel:parent():w() / 2)
		bag_panel:set_visible(true)
		bag_panel:stop()
		bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
	end

	RestorationCoreHooks:Post(HUDTemp, "hide_carry_bag", function(self)
		local bag_panel = self._temp_panel:child("bag_panel")
		bag_panel:stop()
		bag_panel:set_visible(false)
		self._temp_panel:child("throw_instruction"):set_visible(false)
	end)

	function HUDTemp:_animate_show_bag_panel(bag_panel)
		local w, h = self._bag_panel_w, self._bag_panel_h
		local scx = self._temp_panel:w() / 2
		local ecx = self._temp_panel:w() - w / 2
		local scy = self._temp_panel:h() / 2
		local ecy = (self._temp_panel:h() - 152) - self._bag_panel_h / 2
		if restoration.Options:GetValue("HUD/Extra/LowerBag") then
			scy = ecy
		end
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

	function HUDTemp:set_throw_bag_text()
		self._temp_panel:child("throw_instruction"):set_text(utf8.to_upper(managers.localization:text("hud_instruct_throw_bag", {BTN_USE_ITEM = managers.localization:btn_macro("use_item")})))
	end
end
