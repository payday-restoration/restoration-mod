--[[function HUDBlackScreen:set_job_data()
	if not managers.job:has_active_job() then
		return
	end
	local job_panel = self._blackscreen_panel:panel({
		visible = true,
		name = "job_panel",
		y = 0,
		valign = "grow",
		halign = "grow",
		layer = 1
	})
	local risk_panel = job_panel:panel({})
	local last_risk_level
	local blackscreen_risk_textures = tweak_data.gui.blackscreen_risk_textures
	for i = 1, managers.job:current_difficulty_stars() do
		local difficulty_name = tweak_data.difficulties[i + 2]
		local texture = blackscreen_risk_textures[difficulty_name] or "guis/textures/pd2/risklevel_blackscreen"
		last_risk_level = risk_panel:bitmap({
			texture = texture,
			color = tweak_data.screen_colors.risk
		})
		last_risk_level:move((i - 1) * last_risk_level:w(), 0)
	end
	if last_risk_level then
		risk_panel:set_size(last_risk_level:right(), last_risk_level:bottom())
		risk_panel:set_center(job_panel:w() / 2, job_panel:h() / 2)
		risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
		local risk_text = job_panel:text({
			text = managers.localization:to_upper_text(tweak_data.difficulty_name_id),
			font = tweak_data.menu.pd2_large_font,
			font_size = tweak_data.menu.pd2_small_large_size,
			align = "center",
			vertical = "bottom",
			color = tweak_data.screen_colors.risk
		})
		risk_text:set_bottom(risk_panel:top())
		risk_text:set_center_x(risk_panel:center_x())
	else
		risk_panel:set_size(64, 64)
		risk_panel:set_center_x(job_panel:w() / 2)
		risk_panel:set_bottom(job_panel:h() / 2)
		risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
	end
	--do return end
	local contact_data = managers.job:current_contact_data()
	local job_data = managers.job:current_job_data()
	if self._blackscreen_panel:child("job_panel") then
		self._blackscreen_panel:remove(self._blackscreen_panel:child("job_panel"))
	end
	local job_panel = self._blackscreen_panel:panel({
		visible = true,
		name = "job_panel",
		y = 0,
		valign = "grow",
		halign = "grow",
		layer = 0
	})
	--job_panel:hide()
	job_panel:text({
		name = "title",
		text = managers.localization:text(job_data.name_id),
		layer = 1,
		align = "center",
		vertical = "top",
		font_size = tweak_data.hud.default_font_size,
		font = tweak_data.hud.medium_font,
		w = job_panel:w(),
		h = 32
	})
	local contact_name = job_panel:text({
		name = "contact_name",
		text = managers.localization:text(contact_data.name_id),
		layer = 1,
		align = "left",
		vertical = "top",
		font_size = tweak_data.hud.default_font_size,
		font = tweak_data.hud.medium_font,
		w = job_panel:w(),
		h = 32,
		y = 50
	})
	local portrait = job_panel:bitmap({
		name = "portrait",
		texture = "guis/textures/pd2/mission_briefing/dallas/dallas",
		y = contact_name:bottom()
	})
	job_panel:text({
		name = "payout",
		text = "Payout: $1.000.000",
		layer = 1,
		align = "left",
		vertical = "top",
		font_size = tweak_data.hud.default_font_size,
		font = tweak_data.hud.medium_font,
		w = job_panel:w(),
		h = 32,
		y = portrait:bottom() + 32
	})
	self:_create_stages()
	local level_data = managers.job:current_level_data()
	local objective_title = job_panel:text({
		name = "objective_title",
		text = managers.localization:text("hud_objectives"),
		layer = 1,
		align = "left",
		vertical = "top",
		font_size = tweak_data.hud.default_font_size,
		font = tweak_data.hud.medium_font,
		w = job_panel:w(),
		h = 32,
		y = job_panel:h() / 2
	})
	local objective_text = job_panel:text({
		name = "objective_text",
		text = managers.localization:text(level_data.briefing_id),
		layer = 1,
		align = "left",
		vertical = "top",
		font_size = tweak_data.hud.small_font_size,
		font = tweak_data.hud.small_font,
		w = job_panel:w(),
		h = 32,
		y = job_panel:h() / 2 + 50,
		wrap = true,
		word_wrap = true
	})
end

function HUDBlackScreen:_create_stages()
	local job_chain = managers.job:current_job_chain_data()
	local job_panel = self._blackscreen_panel:child("job_panel")
	local stages_panel = job_panel:panel({
		visible = true,
		name = "stages_panel",
		y = job_panel:child("contact_name"):bottom(),
		x = 320,
		h = 256
	})
	local types = {
		a = {
			256,
			0,
			64,
			64
		},
		b = {
			192,
			0,
			64,
			64
		},
		c = {
			128,
			0,
			64,
			64
		},
		d = {
			64,
			0,
			64,
			64
		},
		e = {
			0,
			0,
			64,
			64
		}
	}
	local level_rects = {
		{
			0,
			0,
			256,
			256
		},
		{
			768,
			0,
			256,
			256
		},
		{
			512,
			0,
			256,
			256
		},
		{
			256,
			0,
			256,
			256
		}
	}
	local x = 0
	for i, heist in ipairs(job_chain) do
		local is_current_stage = managers.job:current_stage() == i
		local is_completed = i < managers.job:current_stage()
		local panel = stages_panel:panel({
			visible = true,
			name = "panel",
			y = 0,
			x = x,
			w = is_current_stage and 256 or 80
		})
		if not is_completed and not is_current_stage then
			local image = panel:bitmap({
				texture = "guis/textures/pd2/icon_mission_overview_unknown",
				layer = 1,
				blend_mode = "normal"
			})
			image:set_center(panel:w() / 2, panel:h() / 2)
		else
			local image = panel:bitmap({
				texture = "guis/textures/pd2/icon_mission_overview",
				layer = 1,
				texture_rect = level_rects[i],
				blend_mode = "normal"
			})
			image:set_center(panel:w() / 2, panel:h() / 2)
		end
		local badge = panel:bitmap({
			texture = "guis/textures/pd2/gui_grade_badges",
			layer = 4,
			texture_rect = types[heist.type]
		})
		badge:set_right(panel:w() - 8)
		badge:set_bottom(panel:h() - 8)
		if (not is_completed or not {
			0,
			Color(120/ 255, 255/ 255, 120/ 255):with_alpha(0.25),
			1,
			Color(120/ 255, 255/ 255, 120/ 255):with_alpha(0)
		}) and (not is_current_stage or not {
			0,
			Color(230/ 255, 200/ 255, 150/ 255):with_alpha(0.5),
			1,
			Color(230/ 255, 200/ 255, 150/ 255):with_alpha(0)
		}) then
			local gradient_points = {
				0,
				Color.black:with_alpha(0),
				1,
				Color.black:with_alpha(0)
			}
		end
		panel:gradient({
			layer = 3,
			gradient_points = gradient_points,
			orientation = "vertical",
			h = panel:h() / 2
		})
		x = x + panel:w() + 10
		local level_data = tweak_data.levels[heist.level_id]
		if is_current_stage then
			local pad = 8
			panel:text({
				name = "stage_name",
				text = utf8.to_upper(managers.localization:text(level_data.name_id)),
				layer = 0,
				align = "left",
				vertical = "top",
				font_size = tweak_data.hud.small_font_size,
				font = tweak_data.hud.small_font,
				w = panel:w(),
				h = 24,
				x = pad,
				y = pad,
				layer = 4
			})
			panel:text({
				name = "type",
				text = utf8.to_upper(managers.localization:text(heist.type_id)),
				layer = 0,
				align = "left",
				vertical = "top",
				font_size = tweak_data.hud.small_font_size,
				font = tweak_data.hud.small_font,
				w = panel:w(),
				h = 24,
				x = pad,
				y = pad + 24,
				layer = 4
			})
		end
		stages_panel:set_w(panel:right())
	end
	stages_panel:set_center_x(math.round(job_panel:child("portrait"):w() + (job_panel:w() - job_panel:child("portrait"):w()) / 2))
end]]

function HUDBlackScreen:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("blackscreen_panel") then
		self._hud_panel:remove(self._hud_panel:child("blackscreen_panel"))
	end
	self._blackscreen_panel = self._hud_panel:panel({
		visible = true,
		name = "blackscreen_panel",
		y = 0,
		valign = "grow",
		halign = "grow",
		layer = 0
	})
	local mid_text = self._blackscreen_panel:text({
		name = "mid_text",
		visible = true,
		text = "000",
		layer = 1,
		color = Color.white,
		y = 0,
		valign = {0.4, 0},
		align = "center",
		vertical = "center",
		font_size = tweak_data.hud.default_font_size,
		font = tweak_data.hud.medium_font,
		w = self._blackscreen_panel:w()
	})
	local _, _, _, h = mid_text:text_rect()
	mid_text:set_h(h)
	mid_text:set_center_x(self._blackscreen_panel:center_x())
	mid_text:set_center_y(self._blackscreen_panel:h() / 3)
	local is_server = Network:is_server()
	local continue_button = managers.menu:is_pc_controller() and "[ENTER]" or nil
	local text = utf8.to_upper(managers.localization:text("hud_skip_blackscreen", {BTN_ACCEPT = continue_button}))
	local skip_text = self._blackscreen_panel:text({
		name = "skip_text",
		visible = is_server,
		text = text,
		layer = 1,
		color = Color.white,
		y = 0,
		align = "right",
		vertical = "bottom",
		font_size = nil,
		font = tweak_data.hud.medium_font_noshadow
	})
	local loading_text = utf8.to_upper(managers.localization:text("menu_loading_progress", {prog = 0}))
	local loading_text_object = self._blackscreen_panel:text({
		name = "loading_text",
		visible = false,
		text = loading_text,
		layer = 1,
		color = Color.white,
		y = 0,
		align = "right",
		vertical = "bottom",
		font_size = nil,
		font = tweak_data.hud.medium_font_noshadow
	})
	self._circle_radius = 16
	self._sides = 64
	skip_text:set_x(skip_text:x() - self._circle_radius * 3)
	skip_text:set_y(skip_text:y() - self._circle_radius)
	loading_text_object:set_x(loading_text_object:x() - self._circle_radius * 3)
	loading_text_object:set_y(loading_text_object:y() - self._circle_radius)
	self._skip_circle = CircleBitmapGuiObject:new(self._blackscreen_panel, {
		image = "guis/textures/pd2/hud_progress_32px",
		radius = self._circle_radius,
		sides = self._sides,
		current = self._sides,
		total = self._sides,
		blend_mode = "normal",
		color = Color.white,
		layer = 2
	})
	self._skip_circle:set_position(self._blackscreen_panel:w() - self._circle_radius * 3, self._blackscreen_panel:h() - self._circle_radius * 3)
end


function HUDBlackScreen:set_mid_text(text)
	local mid_text = self._blackscreen_panel:child("mid_text")
	mid_text:set_alpha(0)
	local current_map = managers.job:current_level_id()
	--mid_text:set_text(utf8.to_upper("9pm, Debug Text st."))
	mid_text:set_text(utf8.to_upper(managers.localization:text("restoration_level_data_".. current_map)))
end