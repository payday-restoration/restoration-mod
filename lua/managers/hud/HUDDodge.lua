HUDDodgeMeter = HUDDodgeMeter or class()
function HUDDodgeMeter:init(hud)
	self._hud_panel = hud.panel
	
	self._dodge_meter_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:panel({
		name = "dodge_meter_init",
		layer = 0,
		visible = true,
		valign = "center",
		y = 0
	})
	self._dodge_panel = self._dodge_meter_panel:panel({
		visible = true,
		name = "dodge_panel",
		layer = 0,
		w = 16,
		h = 128,
		halign = "right",
		valign = "bottom",
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
		layer = 1,
		h = 0
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
	self._dodge_panel:set_right(self._hud_panel:w() - 16)
	self._dodge_panel:set_center_y(self._hud_panel:center_y())
	self._dodge_panel:set_alpha(0) --Hide dodge panel until players actually get dodge.
	self._dodge_points = 0
end

function HUDDodgeMeter:unhide_dodge_panel(dodge_points)
	local dodge_display = restoration.Options:GetValue("HUD/DodgeDisplay")
	self._dodge_panel:set_alpha(1)
	self._dodge_points = dodge_points
	if dodge_display then
		if dodge_display == 2 then
			self._dodge_panel:child("dodge_threshold"):set_center_y((1.0 - ((1.0 - dodge_points) / 1.5)) * self._dodge_panel:h())
		elseif dodge_display == 3 then
			self._dodge_panel:child("dodge_threshold"):set_center_y((1.0 - ((1.0 - dodge_points) / 1.0)) * self._dodge_panel:h())
		else
			self._dodge_panel:child("dodge_threshold"):set_center_y((1.0 - ((1.0 - dodge_points) / (1.5 - dodge_points))) * self._dodge_panel:h())
		end
	else
		self._dodge_panel:child("dodge_threshold"):set_center_y((1.0 - ((1.0 - dodge_points) / (1.5 - dodge_points))) * self._dodge_panel:h())
	end
end

function HUDDodgeMeter:set_dodge_value(value)
	local dodge_display = restoration.Options:GetValue("HUD/DodgeDisplay")
	if dodge_display then
		if dodge_display == 2 then
			self._dodge_panel:child("dodge_bar"):set_h(self._dodge_panel:h() * value / 1.5)
		elseif dodge_display == 3 then
			self._dodge_panel:child("dodge_bar"):set_h(self._dodge_panel:h() * value / 1.0)
		else
			self._dodge_panel:child("dodge_bar"):set_h(self._dodge_panel:h() * value / (1.5 - self._dodge_points))
		end
	else
		self._dodge_panel:child("dodge_bar"):set_h(self._dodge_panel:h() * value / (1.5 - self._dodge_points))
	end
	self._dodge_panel:child("dodge_bar"):set_bottom(self._dodge_panel:h())
	if value >= 1.0 - self._dodge_points then
		self._dodge_panel:animate(callback(self, self, "_animate_high_dodge"))
	else
		self._dodge_panel:stop()
		self._dodge_panel:child("dodge_bar"):set_color(Color(0.5, 0.5, 0.8))
	end
end

function HUDDodgeMeter:_animate_high_dodge(input_panel)
	--Flashing animation for when next hit will be dodged.
	local dodge_bar = input_panel:child("dodge_bar")
	while true do
		local a = (math.sin(Application:time() * 750) + 1) / 4
		dodge_bar:set_color(Color(0.5 + a, 0.5 + a, 0.8))
		coroutine.yield()
	end
end