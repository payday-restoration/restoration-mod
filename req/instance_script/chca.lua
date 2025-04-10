local function get_opts_pro_job_ponr_its_payday_style()
	local pro_job = Global.game_settings and Global.game_settings.one_down
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local ponr_value = (difficulty <= 5 and 960 or (difficulty == 6 or difficulty == 7) and 930) or 900
	local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,  -- 4 or more players
	}

	return {
		elements = { 100010, },
		time_balance_mul = ponr_timer_player_mul,
		time_easy = ponr_value,
		time_normal = ponr_value,
		time_hard = ponr_value,
		time_overkill = ponr_value,
		time_overkill_145 = ponr_value,
		time_easy_wish = ponr_value,
		time_overkill_290 = ponr_value,
		time_sm_wish = ponr_value,
		enabled = pro_job,
	}
end

local function get_opts_pro_job_ponr_its_payday_style_input()
	local pro_job = Global.game_settings and Global.game_settings.one_down

	return {
		enabled = pro_job,
		instance_name = "chca_heli_escape_001",
		event = "activate_pro_job_ponr",
		on_executed = {
			{ id = 140001, delay = 0, },
		},
	}
end

local pro_job_ponr_its_payday_style, pro_job_ponr_its_payday_style_input
return {
	["levels/instances/unique/chca/chca_heli_escape/world/world"] = function(result)
		pro_job_ponr_its_payday_style = pro_job_ponr_its_payday_style or restoration:gen_pointofnoreturn(
			140001,
			"pro_job_ponr_its_payday_style",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			get_opts_pro_job_ponr_its_payday_style()
		)
		pro_job_ponr_its_payday_style_input = pro_job_ponr_its_payday_style_input or restoration:gen_instance_input(
			140002,
			"pro_job_ponr_its_payday_style_input",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			get_opts_pro_job_ponr_its_payday_style_input()
		)

		if not table.contains(result.default.elements, pro_job_ponr_its_payday_style) then
			table.insert(result.default.elements, pro_job_ponr_its_payday_style)
		end

		if not table.contains(result.default.elements, pro_job_ponr_its_payday_style_input) then
			table.insert(result.default.elements, pro_job_ponr_its_payday_style_input)
		end
	end,
}
