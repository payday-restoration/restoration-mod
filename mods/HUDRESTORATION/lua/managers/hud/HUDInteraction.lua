if restoration.Options:GetValue("HUD/MainHud") == true then
function HUDInteraction:init(hud, child_name)
	self._hud_panel = hud.panel
	self._circle_radius = 64
	self._sides = 64
	self._child_name_text = (child_name or "interact") .. "_text"
	self._child_ivalid_name_text = (child_name or "interact") .. "_invalid_text"
	if self._hud_panel:child(self._child_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_name_text))
	end
	if self._hud_panel:child(self._child_ivalid_name_text) then
		self._hud_panel:remove(self._hud_panel:child(self._child_ivalid_name_text))
	end
	local interact_text = self._hud_panel:text({
		name = self._child_name_text,
		visible = false,
		text = "HELLO",
		valign = "center",
		align = "center",
		layer = 1,
		color = Color.white,
		font = "fonts/font_medium_shadow_mf",
		font_size = 32,
		h = 64
	})
	local invalid_text = self._hud_panel:text({
		name = self._child_ivalid_name_text,
		visible = false,
		text = "HELLO",
		valign = "center",
		align = "center",
		layer = 3,
		color = Color(1, 0.3, 0.3),
		blend_mode = "normal",
		font = "fonts/font_medium_shadow_mf",
		font_size = 32,
		h = 64
	})
	interact_text:set_y( self._hud_panel:h() * 0.6 )
	
	invalid_text:set_center_y( interact_text:center_y() )
end

function HUDInteraction:show_interaction_bar(current, total)
	if self._interact_circle then
		self._interact_circle:remove()
		self._interact_circle = nil
	end
	self._interact_circle = CircleBitmapGuiObject:new(self._hud_panel, {
		use_bg = true,
		radius = self._circle_radius,
		sides = self._sides,
		current = self._sides,
		total = self._sides,
		color = Color.white:with_alpha(1),
		blend_mode = "add",
		layer = 2
	})
	self._interact_circle:set_position(self._hud_panel:w() / 2 - self._circle_radius, self._hud_panel:h() / 2 - self._circle_radius)
end

function HUDInteraction:set_bar_valid(valid, text_id)
	local texture = valid and "guis/textures/restoration/hud_progress_active" or "guis/textures/restoration/hud_progress_invalid"
	self._interact_circle:set_image(texture)
	self._hud_panel:child(self._child_name_text):set_visible(valid)
	local invalid_text = self._hud_panel:child(self._child_ivalid_name_text)
	if text_id then
		invalid_text:set_text(managers.localization:to_upper_text(text_id))
	end
	invalid_text:set_visible(not valid)
end

function HUDInteraction:hide_interaction_bar(complete)
	if complete then
		local bitmap = self._hud_panel:bitmap({
			texture = "guis/textures/restoration/hud_progress_active",
			blend_mode = "add",
			align = "center",
			valign = "center",
			layer = 2
		})
		bitmap:set_position(bitmap:parent():w() / 2 - bitmap:w() / 2, bitmap:parent():h() / 2 - bitmap:h() / 2)
		local radius = 64
		local circle = CircleBitmapGuiObject:new(self._hud_panel, {
			radius = radius,
			sides = 64,
			current = 64,
			total = 64,
			color = Color.white:with_alpha(1),
			blend_mode = "normal",
			layer = 3
		})
		circle:set_position(self._hud_panel:w() / 2 - radius, self._hud_panel:h() / 2 - radius)
		bitmap:animate(callback(self, self, "_animate_interaction_complete"), circle)
	end
	if self._interact_circle then
		self._interact_circle:remove()
		self._interact_circle = nil
	end
end

end