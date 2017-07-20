if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

if (Holo and Holo.Options:GetValue("Base/Hud")) or (pdth_hud and (pdth_hud.Options:GetValue("HUD/MainHud") or pdth_hud.Options:GetValue("HUD/Assault"))) or MUIMenu or (restoration and (restoration.Options:GetValue("HUD/MainHud") or restoration.Options:GetValue("HUD/AssaultPanel"))) then
	return
end

function HUDAssaultCorner:init(hud, full_hud, tweak_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
	if self._hud_panel:child("assault_panel") then
		self._hud_panel:remove(self._hud_panel:child("assault_panel"))
	end
	local size = 200
	local assault_panel = self._hud_panel:panel({
		visible = false,
		name = "assault_panel",
		w = 400,
		h = 100
	})
	assault_panel:set_top(0)
	assault_panel:set_right(self._hud_panel:w())
	self._assault_mode = "normal"
	self._assault_color = Color(1, 1, 1, 0)
	self._vip_assault_color = Color(1, 1, 0.5019608, 0)
	if managers.mutators:are_mutators_active() then
		self._assault_color = Color(255, 211, 133, 255) / 255
		self._vip_assault_color = Color(255, 255, 133, 225) / 255
	end
	self._assault_survived_color = Color(1, 0.1254902, 0.9019608, 0.1254902)
	self._current_assault_color = self._assault_color
	local icon_assaultbox = assault_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._assault_color,
		name = "icon_assaultbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_assaultbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_assaultbox:set_right(icon_assaultbox:parent():w())
	self._bg_box = HUDBGBox_create(assault_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._assault_color,
		blend_mode = "add"
	})
	self._bg_box:set_right(icon_assaultbox:left() - 3)
	local yellow_tape = assault_panel:rect({
		visible = false,
		name = "yellow_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(1, 0.8, 0),
		layer = 1
	})
	yellow_tape:set_center(10, 10)
	yellow_tape:set_rotation(30)
	yellow_tape:set_blend_mode("add")
	assault_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
	if self._hud_panel:child("hostages_panel") then
		self._hud_panel:remove(self._hud_panel:child("hostages_panel"))
	end
	local hostage_w, hostage_h, hostage_box = 70, 38, 38
	local hostages_panel = self._hud_panel:panel({
		name = "hostages_panel",
		w = hostage_w,
		h = hostage_h,
		x = self._hud_panel:w() - hostage_w
	})
	local hostages_icon = hostages_panel:bitmap({
		name = "hostages_icon",
		texture = "guis/textures/pd2/hud_icon_hostage",
		valign = "top",
		layer = 1,
		x = 0,
		y = 0
	})
	self._hostages_bg_box = HUDBGBox_create(hostages_panel, {
		w = hostage_box,
		h = hostage_box,
		x = 0,
		y = 0
	}, {})
	hostages_icon:set_right(hostages_panel:w() + 5)
	hostages_icon:set_center_y(self._hostages_bg_box:h() / 2)
	self._hostages_bg_box:set_right(hostages_icon:left())
	local num_hostages = self._hostages_bg_box:text({
		name = "num_hostages",
		text = "0",
		valign = "center",
		align = "center",
		vertical = "center",
		w = self._hostages_bg_box:w(),
		h = self._hostages_bg_box:h(),
		layer = 1,
		x = 0,
		y = 0,
		color = Color.white,
		font = tweak_data.hud_corner.assault_font,
		font_size = tweak_data.hud_corner.numhostages_size
	})
	if tweak_hud.no_hostages then
		hostages_panel:hide()
	end
	if self._hud_panel:child("wave_panel") then
		self._hud_panel:remove(self._hud_panel:child("wave_panel"))
	end
	self._max_waves = tweak_data.safehouse.combat.waves[Global.game_settings.difficulty or "normal"]
	if self:is_safehouse_raid() then
		self._wave_panel_size = {250, 38}
		local wave_w, wave_h = 38, 38
		local wave_panel = self._hud_panel:panel({
			name = "wave_panel",
			w = self._wave_panel_size[1],
			h = self._wave_panel_size[2]
		})
		wave_panel:set_top(0)
		wave_panel:set_right(hostages_panel:left() - 3)
		local waves_icon = wave_panel:bitmap({
			name = "hostages_icon",
			texture = "guis/textures/pd2/specialization/icons_atlas",
			texture_rect = {
				192,
				64,
				64,
				64
			},
			valign = "top",
			layer = 1,
			x = 0,
			y = 0,
			w = wave_w,
			h = wave_h
		})
		self._wave_bg_box = HUDBGBox_create(wave_panel, {
			w = 100,
			h = wave_h,
			x = 0,
			y = 0
		}, {blend_mode = "add"})
		waves_icon:set_right(wave_panel:w())
		waves_icon:set_center_y(self._wave_bg_box:h() * 0.5)
		self._wave_bg_box:set_right(waves_icon:left())
		local num_waves = self._wave_bg_box:text({
			name = "num_waves",
			text = self:get_completed_waves_string(),
			valign = "center",
			vertical = "center",
			align = "center",
			halign = "right",
			w = self._wave_bg_box:w(),
			h = self._wave_bg_box:h(),
			layer = 1,
			x = 0,
			y = 0,
			color = Color.white,
			font = tweak_data.hud_corner.assault_font,
			font_size = tweak_data.hud_corner.numhostages_size
		})
	end
	if self._hud_panel:child("point_of_no_return_panel") then
		self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
	end
	local size = 300
	local point_of_no_return_panel = self._hud_panel:panel({
		visible = false,
		name = "point_of_no_return_panel",
		w = size,
		h = 40,
		x = self._hud_panel:w() - size
	})
	self._noreturn_color = Color(1, 1, 0, 0)
	local icon_noreturnbox = point_of_no_return_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._noreturn_color,
		name = "icon_noreturnbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_noreturnbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_noreturnbox:set_right(icon_noreturnbox:parent():w())
	self._noreturn_bg_box = HUDBGBox_create(point_of_no_return_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._noreturn_color,
		blend_mode = "add"
	})
	self._noreturn_bg_box:set_right(icon_noreturnbox:left() - 3)
	local w = point_of_no_return_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	local point_of_no_return_text = self._noreturn_bg_box:text({
		name = "point_of_no_return_text",
		text = "",
		blend_mode = "add",
		layer = 1,
		valign = "center",
		align = "right",
		vertical = "center",
		x = 0,
		y = 0,
		color = self._noreturn_color,
		font_size = tweak_data.hud_corner.noreturn_size,
		font = tweak_data.hud_corner.assault_font
	})
	point_of_no_return_text:set_text(utf8.to_upper(managers.localization:text("hud_assault_point_no_return_in", {time = ""})))
	point_of_no_return_text:set_size(self._noreturn_bg_box:w(), self._noreturn_bg_box:h())
	local point_of_no_return_timer = self._noreturn_bg_box:text({
		name = "point_of_no_return_timer",
		text = "",
		blend_mode = "add",
		layer = 1,
		valign = "center",
		align = "center",
		vertical = "center",
		x = 0,
		y = 0,
		color = self._noreturn_color,
		font_size = tweak_data.hud_corner.noreturn_size,
		font = tweak_data.hud_corner.assault_font
	})
	local _, _, w, h = point_of_no_return_timer:text_rect()
	point_of_no_return_timer:set_size(46, self._noreturn_bg_box:h())
	point_of_no_return_timer:set_right(point_of_no_return_timer:parent():w())
	point_of_no_return_text:set_right(math.round(point_of_no_return_timer:left()))
	if self._hud_panel:child("casing_panel") then
		self._hud_panel:remove(self._hud_panel:child("casing_panel"))
	end
	local size = 300
	local casing_panel = self._hud_panel:panel({
		visible = false,
		name = "casing_panel",
		w = size,
		h = 40,
		x = self._hud_panel:w() - size
	})
	self._casing_color = Color.white
	local icon_casingbox = casing_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._casing_color,
		name = "icon_casingbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_stealthbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_casingbox:set_right(icon_casingbox:parent():w())
	self._casing_bg_box = HUDBGBox_create(casing_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._casing_color,
		blend_mode = "add"
	})
	self._casing_bg_box:set_right(icon_casingbox:left() - 3)
	local w = casing_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	casing_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
	if self._hud_panel:child("buffs_panel") then
		self._hud_panel:remove(self._hud_panel:child("buffs_panel"))
	end
	local width = 200
	local x = assault_panel:left() + self._bg_box:left() - 3 - width
	local buffs_panel = self._hud_panel:panel({
		visible = false,
		name = "buffs_panel",
		w = width,
		h = 38,
		x = x
	})
	self._vip_bg_box_bg_color = Color(1, 0, 0.6666667, 1)
	self._vip_bg_box = HUDBGBox_create(buffs_panel, {
		w = 38,
		h = 38,
		x = width - 38,
		y = 0
	}, {
		color = Color.white,
		bg_color = self._vip_bg_box_bg_color
	})
	local job = Global.level_data and Global.level_data.level_id
    	if job == "branchbank" or job == "man" or job == "firestarter_2" or job == "framing_frame_3" or job == "four_stores" or job == "alex_2" or job == "rat" or job == "flat" then
		buff_icon = "guis/textures/pd2/hud_buff_skull"
	elseif job == "pal" or job == "run" or job == "mia_2" or job == "firestarter_3" or job == "mad" or job == "jolly" then
		buff_icon = "guis/textures/pd2/hud_buff_fire"
    	else
		buff_icon = "guis/textures/pd2/hud_buff_shield"
    	end
	local vip_icon = self._vip_bg_box:bitmap({
		halign = "center",
		valign = "center",
		color = Color.white,
		name = "vip_icon",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = buff_icon,
		x = 0,
		y = 0,
		w = 38,
		h = 38
	})
	vip_icon:set_center(self._vip_bg_box:w() / 2, self._vip_bg_box:h() / 2)
end

end