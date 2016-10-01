HUDSuspicion = HUDSuspicion or class()
function HUDSuspicion:init(hud, sound_source)
	self._hud_panel = hud.panel
	self._sound_source = sound_source
	if self._hud_panel:child("suspicion_panel") then
		self._hud_panel:remove(self._hud_panel:child("suspicion_panel"))
	end
	self._suspicion_panel = self._hud_panel:panel({
		visible = false,
		name = "suspicion_panel",
		y = 0,
		valign = {1/3,0},
		layer = 3
	})
	self._misc_panel = self._suspicion_panel:panel({name = "misc_panel"})
	self._suspicion_panel:set_size(200, 200)
	self._suspicion_panel:set_center(self._suspicion_panel:parent():w() / 2, self._suspicion_panel:parent():h() / 6)
	--local suspicion = self._suspicion_panel:bitmap( { name = "suspicion", visible = true, texture = "guis/textures/pd2/icon_detection", color = Color.white, alpha = 1, valign = "center", w = 128, h = 128, layer=1 } )
	--suspicion:set_center_x( self._suspicion_panel:w() / 2 )
	--suspicion:set_center_y( self._suspicion_panel:h() / 6 )
	local scale = 1 --.175
	local suspicion_left = self._suspicion_panel:bitmap({
		name = "suspicion_left",
		visible = true,
		texture = "guis/textures/pd2/hud_stealthmeter",
		color = Color(1, 0.8, 0),
		alpha = 1,
		valign = "center",
		w = 128,
		h = 128,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1
	})
	suspicion_left:set_size(suspicion_left:w() * scale, suspicion_left:h() * scale)
	suspicion_left:set_center_x(self._suspicion_panel:w() / 2)
	suspicion_left:set_center_y(self._suspicion_panel:h() / 2)
	local suspicion_right = self._suspicion_panel:bitmap({
		name = "suspicion_right",
		visible = true,
		texture = "guis/textures/pd2/hud_stealthmeter",
		color = Color(0, 1, 1),
		alpha = 1,
		valign = "center",
		w = 128,
		h = 128,
		blend_mode = "add",
		render_template = "VertexColorTexturedRadial",
		layer = 1
	})
	suspicion_right:set_size(suspicion_right:w() * scale, suspicion_right:h() * scale)
	suspicion_right:set_center(suspicion_left:center())
	suspicion_left:set_texture_rect(128, 0, -128, 128)
	local hud_stealthmeter_bg = self._misc_panel:bitmap({
		name = "hud_stealthmeter_bg",
		visible = true,
		texture = "guis/textures/pd2/hud_stealthmeter_bg",
		color = Color(0.2, 1, 1, 1),
		alpha = 1,
		valign = {0.5, 0},
		w = 128,
		h = 128,
		blend_mode = "normal"
	})
	hud_stealthmeter_bg:set_size(hud_stealthmeter_bg:w() * scale, hud_stealthmeter_bg:h() * scale)
	hud_stealthmeter_bg:set_center(suspicion_left:center())
	local suspicion_detected = self._suspicion_panel:text({
		name = "suspicion_detected",
		text = managers.localization:to_upper_text("hud_detected"),
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.pd2_medium_font,
		layer = 2,
		align = "center",
		vertical = "center",
		alpha = 0
	})
	suspicion_detected:set_text(utf8.to_upper(managers.localization:text("hud_suspicion_detected")))
	suspicion_detected:set_center(suspicion_left:center())
	local hud_stealth_cam = self._misc_panel:bitmap( { name = "hud_stealth_cam", visible = true, texture = "guis/textures/pd2/hud_stealth_cam", alpha = 0, w = 32, h = 32, blend_mode="add", layer=1 } )
	hud_stealth_cam:set_center( suspicion_left:center_x(), suspicion_left:bottom() )
	local hud_stealth_eye = self._misc_panel:bitmap({
		name = "hud_stealth_eye",
		visible = true,
		texture = "guis/textures/pd2/hud_stealth_eye",
		alpha = 0,
		w = 32,
		h = 32,
		valign = "center",
		blend_mode = "add",
		layer = 1
	})
	--hud_stealth_eye:set_center(suspicion_left:center_x(), suspicion_left:bottom() - 4)
	hud_stealth_eye:set_center_x( hud_stealth_cam:center_x() )
	hud_stealth_eye:set_bottom( hud_stealth_cam:top() + 10 )
	local hud_stealth_exclam = self._misc_panel:bitmap({
		name = "hud_stealth_exclam",
		visible = true,
		texture = "guis/textures/pd2/hud_stealth_exclam",
		alpha = 0,
		w = 32,
		h = 32,
		valign = "center",
		blend_mode = "add",
		layer = 1
	})
	hud_stealth_exclam:set_center(suspicion_left:center_x(), suspicion_left:top() - 4)
	self._eye_animation = nil
	self._suspicion_value = 0
end

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
			local hud_stealth_cam = o:child( "hud_stealth_cam" )
			local hud_stealth_eye = o:child("hud_stealth_eye")
			local start_alpha = hud_stealth_cam:alpha()
			wait(1.8)
			over(0.1, function(p)
				hud_stealthmeter_bg:set_alpha(math.lerp(start_alpha, 0, p))
				hud_stealth_cam:set_alpha( math.lerp( start_alpha, 0, p ) )
				hud_stealth_eye:set_alpha( math.lerp( start_alpha, 0, p ) )
			end
)
		end

		local animate_show_misc = function(o)
			local hud_stealthmeter_bg = o:child("hud_stealthmeter_bg")
			local hud_stealth_cam = o:child( "hud_stealth_cam" )
			local hud_stealth_eye = o:child("hud_stealth_eye")
			local start_alpha = hud_stealth_eye:alpha()
			over(0.1, function(p)
				hud_stealthmeter_bg:set_alpha(math.lerp(start_alpha, 1, p))
				hud_stealth_cam:set_alpha( math.lerp( start_alpha, 1, p ) )
				hud_stealth_eye:set_alpha( math.lerp( start_alpha, 1, p ) )
			end
)
		end

		misc_panel:stop()
		misc_panel:animate(animate_show_misc)
		local c = math.lerp(1, 0, math.clamp((value - 0.75) * 4, 0, 1))
		local dt
		local detect_me = false
		local time_to_end = 4
		
		--suspicion_bitmap:set_alpha( wanted_value )
		--suspicion_bitmap:set_color( Color( 1, c, c ) ) 
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
						end
)
					end

					suspicion_detected:stop()
					suspicion_detected:animate(animate_detect_text)
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
			value = math.lerp(value, wanted_value, 0.9)
			c = math.lerp(1, 0, value)
			if math.abs(value - wanted_value) < 0.01 then
				value = wanted_value
			end
			--suspicion_bitmap:set_alpha( value )
			--suspicion_bitmap:set_color( Color( 1, c, c ) )
			local misc_alpha = math.clamp( value * 10, 0, 1 )
			
			--hud_stealth_cam:set_alpha( misc_alpha )
			-- hud_stealth_eye:set_alpha( misc_alpha )
			--hud_stealthmeter_bg:set_alpha( misc_alpha * 0.2 )
			-- hud_stealth_cam_bg:set_alpha( alpha )
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
			elseif value == 0 then
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