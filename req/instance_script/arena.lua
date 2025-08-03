local function get_opts_pro_job_ponr()
	local pro_job = Global.game_settings and Global.game_settings.one_down
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	-- 1200s on DS, up to 1320s on Normal
	local ponr_value = 1200 + (8 - difficulty) * 20
	local ponr_timer_player_mul = {
		1.1,
		1.05,
		1,
		0.95,
		0.9,
		0.85,
		0.8,
		0.75,  -- 8+ players
	}

	return {
		elements = { 100035, },
		trigger_times = 1,
		min_difficulty = 0.4,
		difficulty_add = 0.3,
		bravos_difficulty_threshold = 0.5,
		bravos_timer = 60,
		time_balance_mul_include_team_ai = false,
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

local function get_opts_pro_job_ponr_input()
	local pro_job = Global.game_settings and Global.game_settings.one_down

	return {
		enabled = pro_job,
		instance_name = "are_heli_escape_001",
		event = "activate_pro_job_ponr",
		on_executed = {
			{ id = 140001, delay = 0, },
		},
	}
end

local pro_job_ponr, pro_job_ponr_input
return {
	["levels/instances/unique/are_heli_escape/world/world"] = function(result)
		pro_job_ponr = pro_job_ponr or restoration:gen_pointofnoreturn(
			140001,
			"pro_job_ponr",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			get_opts_pro_job_ponr()
		)
		pro_job_ponr_input = pro_job_ponr_input or restoration:gen_instance_input(
			140002,
			"pro_job_ponr_input",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			get_opts_pro_job_ponr_input()
		)

		if not table.contains(result.default.elements, pro_job_ponr) then
			table.insert(result.default.elements, pro_job_ponr)
		end

		if not table.contains(result.default.elements, pro_job_ponr_input) then
			table.insert(result.default.elements, pro_job_ponr_input)
		end
	end,
}
