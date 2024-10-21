local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 1200 or (difficulty == 6 or difficulty == 7) and 1000) or 900

local guard_replacement = {
	elite_guard_1 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1",
	elite_guard_2 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2",
	elite_guard_3 = "units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"
}

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}
local bravo_1 = {
	values = {
        enemy = guard_replacement.elite_guard_1
	}
}
local bravo_2 = {
	values = {
        enemy = guard_replacement.elite_guard_2
	}
}
local bravo_3 = {
	values = {
        enemy = guard_replacement.elite_guard_3
	}
}
return {
	--Pro Job PONR when someone pickup a bomb part
	-- Van escape
	[105877] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 150
	},
	-- Boat escape
	[106036] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Increase PONR timers
	[102120] = {
		values = {
			time_normal = 60,
			time_hard = 60,
			time_overkill = 60,
			time_overkill_145 = 60,
			time_easy_wish = 60,
			time_overkill_290 = 60,
			time_sm_wish = 60
		}
	},
	--Murky Elite Guards
	--https://www.youtube.com/watch?v=cNuluqg3GfQ
	[101189] = bravo_1,
	[102077] = bravo_1,
	[102078] = bravo_2,
	[102079] = bravo_2,
	[102101] = bravo_1,
	[102102] = bravo_1,
	[102103] = bravo_3,
	[102121] = bravo_2,
	[102526] = bravo_1,
	[103837] = bravo_2,
	[103845] = bravo_1,
	[103849] = bravo_3,
	[103850] = bravo_2,
	[103817] = bravo_1,
	[103818] = bravo_1,
	[103865] = bravo_3,
	[103872] = bravo_1,
	[103880] = bravo_2,
	[103888] = bravo_3,
	[103772] = bravo_1,
	[103889] = bravo_1,
	[105610] = bravo_1,
	[105631] = bravo_3,
	[102174] = bravo_1,
	[102369] = bravo_2,
	[103618] = bravo_1,
	[103619] = bravo_2,
	[100123] = bravo_1,
	[100124] = bravo_1,
	[101525] = bravo_3,
	[101528] = bravo_3
}