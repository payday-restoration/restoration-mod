if not restoration.Options:GetValue("HUD/UI/BlackScreen") then
	return
end

RestorationCoreHooks:Post(HUDBlackScreen, "init", function(self)
	self._blackscreen_panel:set_layer(0)
	self._blackscreen_panel:child("mid_text"):set_center_y(self._blackscreen_panel:h() / 3)
	self._blackscreen_panel:child("skip_text"):set_text(managers.localization:text("hud_skip_blackscreen", {BTN_ACCEPT = managers.menu:is_pc_controller() and "[ENTER]" or nil}))
	self._blackscreen_panel:child("loading_text"):set_text(managers.localization:text("menu_loading_progress", {prog = 0}))
end)

RestorationCoreHooks:Post(HUDBlackScreen, "set_loading_text_status", function(self, status)
	if status == "wait_for_peers" then
		self._blackscreen_panel:child("loading_text"):set_text(managers.localization:text("menu_waiting_for_players_progress", {player_name = peer_name, prog = peer_status}))
	elseif status and status ~= "allow_skip" then
		self._blackscreen_panel:child("loading_text"):set_text(managers.localization:text("menu_loading_progress", {prog = status}))
	end
end)

function HUDBlackScreen:set_mid_text(text)
	local mid_text = self._blackscreen_panel:child("mid_text")
	if managers.localization:exists("restoration_level_data_".. managers.job:current_level_id()) then
		mid_text:set_text(utf8.to_upper(managers.localization:text("restoration_level_data_".. managers.job:current_level_id())))
	else
		mid_text:set_text(utf8.to_upper(managers.localization:text("restoration_level_data_unknown")))
	end
end

--Gonna keep those, I don't want to use child(index) to get these because it might break(btw thx ovk again for not using names)
function HUDBlackScreen:_set_job_data_crime_spree()
	local job_panel = self._blackscreen_panel:panel({
		name = "job_panel",
		valign = "grow",
		halign = "grow",
		layer = 1
	})
	local job_text = job_panel:text({
		text = managers.localization:to_upper_text("cn_crime_spree"),
		font = tweak_data.menu.eroded_font,
		font_size = tweak_data.menu.eroded_font_size,
		align = "center",
		vertical = "bottom",
		color = tweak_data.screen_colors.crime_spree_risk
	})
	job_text:set_bottom(job_panel:h() * 0.5)
	job_text:set_center_x(job_panel:center_x())
	local risk_text = job_panel:text({
		text = managers.localization:to_upper_text("menu_cs_level", {level = managers.experience:cash_string(managers.crime_spree:server_spree_level(), "")}),
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		align = "center",
		vertical = "top",
		color = tweak_data.screen_colors.crime_spree_risk
	})
	risk_text:set_top(job_panel:h() * 0.5)
	risk_text:set_center_x(job_panel:center_x())
end

function HUDBlackScreen:_set_job_data()
	if not managers.job:has_active_job() then
		return
	end

	local job_panel = self._blackscreen_panel:panel({
		name = "job_panel",
		halign = "grow",
		layer = 1,
		valign = "grow"
	})
	local risk_panel = job_panel:panel({})
	local last_risk_level = nil
	local blackscreen_risk_textures = tweak_data.gui.blackscreen_risk_textures

	for i = 1, managers.job:current_difficulty_stars(), 1 do
		local difficulty_name = tweak_data.difficulties[i + 2]
		local texture = "guis/textures/restoration/risklevel_blackscreen"
		last_risk_level = risk_panel:bitmap({
			texture = texture,
			color = tweak_data.screen_color_red
		})

		last_risk_level:move((i - 1) * last_risk_level:w(), 0)
	end

	if last_risk_level then
		risk_panel:set_size(last_risk_level:right(), last_risk_level:bottom())
		risk_panel:set_center(job_panel:w() / 2, job_panel:h() / 2)
		risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
		local risk_text = job_panel:text({
			text = managers.localization:to_upper_text(tweak_data.difficulty_name_id),
			font = tweak_data.menu.eroded_font,
			font_size = tweak_data.menu.eroded_font_size,
			align = "center",
			vertical = "bottom",
			color = tweak_data.screen_color_red
		})
		risk_text:set_bottom(risk_panel:top() + 10)
		risk_text:set_center_x(risk_panel:center_x())
	else
		risk_panel:set_size(64, 64)
		risk_panel:set_center_x(job_panel:w() / 2)
		risk_panel:set_bottom(job_panel:h() / 2)
		risk_panel:set_position(math.round(risk_panel:x()), math.round(risk_panel:y()))
	end
end