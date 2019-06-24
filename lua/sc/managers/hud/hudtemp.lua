if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	RestorationCoreHooks:Post(HUDTemp, "init", function(self)
		if restoration.Options:GetValue("HUD/MainHUD") then --The stamina bar doesn't show up without these. Why? Beats me!
			RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
		end
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
			color = Color(1, 1, 1),
			layer = 2,
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
	end)

	function HUDTemp:set_dodge_value(value, total_dodge)
		self._dodge_panel:set_alpha(1) --Display dodge panel when needed.
		self._dodge_panel:child("dodge_bar"):set_h((value / (1.0 - (total_dodge / 2.0))) * self._dodge_panel:h())
		self._dodge_panel:child("dodge_bar"):set_bottom(self._dodge_panel:h())
		if value >= 1.0 - (total_dodge / 2.0) then
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
