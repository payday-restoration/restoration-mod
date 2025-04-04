local function get_opts_pro_job_ponr()
	local pro_job = Global.game_settings and Global.game_settings.one_down
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local ponr_value = (difficulty <= 5 and 1260 or (difficulty == 6 or difficulty == 7) and 1230) or 1200
	local ponr_timer_player_mul = {
		1,
		0.9,
		0.8,
		0.7,
		0.65,  -- 5 or more players
	}

	return {
		elements = { 100035, },
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

local opts_pro_job_ponr, opts_pro_job_ponr_input
local pro_job_ponr, pro_job_ponr_input
return {
	["levels/instances/unique/are_heli_escape/world/world"] = function(result)
		opts_pro_job_ponr = opts_pro_job_ponr or get_opts_pro_job_ponr()
		pro_job_ponr = pro_job_ponr or restoration:gen_pointofnoreturn(
			140001,
			"pro_job_ponr",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			opts_pro_job_ponr
		)
		opts_pro_job_ponr_input = opts_pro_job_ponr_input or get_opts_pro_job_ponr_input()
		pro_job_ponr_input = pro_job_ponr_input or restoration:gen_instance_input(
			140002,
			"pro_job_ponr_input",
			Vector3(0, 0, 0),
			Rotation(0, 0, 0),
			opts_pro_job_ponr_input
		)

		if not table.contains(result.default.elements, pro_job_ponr) then
			table.insert(result.default.elements, pro_job_ponr)
		end

		if not table.contains(result.default.elements, pro_job_ponr_input) then
			table.insert(result.default.elements, pro_job_ponr_input)
		end
	end,
}
