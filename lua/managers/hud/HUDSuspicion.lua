if not restoration:all_enabled("HUD/MainHUD", "HUD/Stealth") then
	return
end

RestorationCoreHooks:Post(HUDSuspicion, "init", function(self)
	if not restoration.Options:GetValue("HUD/Extra/StealthOrigPos") then
		self._suspicion_panel:set_center(self._suspicion_panel:parent():w() / 2, self._suspicion_panel:parent():h() / 6)
	end
	
    local s = 128
    local hud_stealth_eye = self._misc_panel:child("hud_stealth_eye")
	local suspicion_left = self._suspicion_panel:child("suspicion_left")
	local hud_stealth_exclam = self._misc_panel:child("hud_stealth_exclam")
    hud_stealth_eye:set_image("guis/textures/restoration/hud_stealth_eye")
	suspicion_left:configure({texture = "guis/textures/restoration/hud_stealthmeter", w = s, h = s})
	suspicion_left:set_center(self._suspicion_panel:w() / 2, self._suspicion_panel:h() / 2)
    hud_stealth_exclam:set_image("guis/textures/restoration/hud_stealth_exclam")
    self._suspicion_panel:child("suspicion_right"):configure({texture = "guis/textures/restoration/hud_stealthmeter", x = suspicion_left:x(), y = suspicion_left:y(), w = s, h = s})
    self._misc_panel:child("hud_stealthmeter_bg"):configure({texture = "guis/textures/restoration/hud_stealthmeter_bg", x = suspicion_left:x(), y = suspicion_left:y(), w = s, h = s})
	self._suspicion_panel:child("suspicion_detected"):set_center(suspicion_left:center())
    local hud_stealth_cam = self._misc_panel:bitmap({
		name = "hud_stealth_cam",
		texture = "guis/textures/pd2/hud_stealth_cam",
		alpha = 0,
		w = 32,
		h = 32,
		blend_mode = "add",
		layer = 1
	})
	
    hud_stealth_cam:set_center(suspicion_left:center_x(), suspicion_left:bottom())
    hud_stealth_eye:set_center_x(hud_stealth_cam:center_x())
	hud_stealth_eye:set_bottom(hud_stealth_cam:y() + 10)
	hud_stealth_exclam:set_center(suspicion_left:center_x(), suspicion_left:top() - 4)
end)

function HUDSuspicion:animate_eye()
	if self._eye_animation then
		return
	end
	self._suspicion_value = 0
	self._discovered = nil
	self._back_to_stealth = nil
	local animate_func = function(o, self)
		local wanted_value = 0
		local value = wanted_value
		local suspicion_left = o:child("suspicion_left")
		local suspicion_right = o:child("suspicion_right")
		local suspicion_detected = o:child("suspicion_detected")
		local misc_panel = o:child("misc_panel")
		local animate_hide_misc = function(o)
			local hud_stealthmeter_bg = o:child("hud_stealthmeter_bg")
			local hud_stealth_cam = o:child("hud_stealth_cam")
			local hud_stealth_exclam = o:child( "hud_stealth_exclam")
			local hud_stealth_eye = o:child( "hud_stealth_eye")
			local start_alpha = hud_stealth_cam:alpha()
			wait(1.8)
			over(0.1, function(p)
				hud_stealthmeter_bg:set_alpha(math.lerp(start_alpha, 0, p))
				hud_stealth_cam:set_alpha(math.lerp( start_alpha, 0, p ))
				hud_stealth_eye:set_alpha(math.lerp( start_alpha, 0, p ))
				hud_stealth_exclam:set_alpha(math.lerp( start_alpha, 0, p ))
			end)
		end
		local animate_show_misc = function(o)
			local hud_stealthmeter_bg = o:child("hud_stealthmeter_bg")
			local hud_stealth_cam = o:child("hud_stealth_cam")
			local hud_stealth_eye = o:child("hud_stealth_eye")
			local hud_stealth_exclam = o:child("hud_stealth_exclam")
			
			local start_alpha = hud_stealth_cam:alpha()
			
			over(0.1, function( p )
				hud_stealthmeter_bg:set_alpha(math.lerp(start_alpha, 1, p))
				hud_stealth_cam:set_alpha(math.lerp(start_alpha, 1, p))
				hud_stealth_eye:set_alpha(math.lerp(start_alpha, 1, p))
				hud_stealth_exclam:set_alpha(math.lerp(start_alpha, 1, p))
			end)
		end
		misc_panel:stop()
		misc_panel:animate(animate_show_misc)
		local c = math.lerp(1, 0, math.clamp((value - 0.75) * 4, 0, 1))
		local dt
		local detect_me = false
		local time_to_end = 4
		while true do
			if not alive(o) then
				return
			end
			dt = coroutine.yield()
			if self._discovered then
				self._discovered = nil
				if not detect_me then
					detect_me = true
					wanted_value = 1
					self._suspicion_value = wanted_value
					self._sound_source:post_event("hud_suspicion_discovered")
					local animate_detect_text = function(o)
						local c = 0
						local s = 0
						local a = 0
						local font_scale = o:font_scale()
						over(0.8, function(p)
							c = math.lerp(1, 0, math.clamp((p - 0.75) * 6, 0, 1))
							s = math.lerp(0, 1, math.min(1, p * 2))
							a = math.lerp(0, 1, math.min(1, p * 3))
							o:set_alpha(a)
							o:set_font_scale(font_scale * s)
							o:set_color(Color(1, c, c))
						end)
					end
				end
			end
			if not detect_me and wanted_value ~= self._suspicion_value then
				wanted_value = self._suspicion_value
			end
			if (not detect_me or time_to_end < 2) and self._back_to_stealth then
				self._back_to_stealth = nil
				detect_me = false
				wanted_value = 0
				self._suspicion_value = wanted_value
				misc_panel:stop()
				misc_panel:animate(animate_hide_misc)
			end
			value = math.lerp(value, wanted_value, dt * 10 )
			c = math.lerp(1, 0, value)
			if math.abs(value - wanted_value) < 0.01 then
				value = wanted_value
			end
			
			suspicion_left:set_color(Color(0.5 + value * 0.5, 1, 1))
			suspicion_right:set_color(Color(0.5 + value * 0.5, 1, 1))
			local misc_panel = o:child("misc_panel")
			local hud_stealth_exclam = misc_panel:child("hud_stealth_exclam")
			hud_stealth_exclam:set_alpha(math.clamp((value - 0.5) * 2, 0, 1))
			if value == 1 then
				time_to_end = time_to_end - dt
				if time_to_end <= 0 then
					self._eye_animation = nil
					self:hide()
					return
				end
			elseif value <= 0 then
				time_to_end = time_to_end - dt * 2
				if time_to_end <= 0 then
					self._eye_animation = nil
					self:hide()
					return
				end
			elseif time_to_end ~= 4 then
				time_to_end = 4
				misc_panel:stop()
				misc_panel:animate(animate_show_misc)
			end
		end
	end
	self._sound_source:post_event("hud_suspicion_start")
	self._eye_animation = self._suspicion_panel:animate(animate_func, self)
end

function HUDSuspicion:hide()
	if self._eye_animation then
		self._eye_animation:stop()
		self._eye_animation = nil
		self._sound_source:post_event("hud_suspicion_end")
	end
	self._suspicion_value = 0
	self._discovered = nil
	self._back_to_stealth = nil
	if alive(self._misc_panel) then
		self._misc_panel:stop()
		if alive(self._misc_panel:child("hud_stealth_cam")) then
			self._misc_panel:child("hud_stealth_cam"):set_alpha(0)
		end
		self._misc_panel:child("hud_stealth_eye"):set_alpha(0)
		self._misc_panel:child("hud_stealth_exclam"):set_alpha(0)
		self._misc_panel:child("hud_stealthmeter_bg"):set_alpha(0)
	end
	if alive(self._suspicion_panel) then
		self._suspicion_panel:set_visible(false)
	end
end