local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value = 1730	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1630	
	else
		ponr_value = 1530	
	end
	
local biker_table = {
	guard_biker = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1",
	female_1 = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1",
	female_2 = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2",
	female_3 = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
}
local ponr_timer_player_mul = {
		1,
		0.9,
		0.8,
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
		0.65
}
local disabled = {
	values = {
        enabled = false
	}
}
local fem_biker_1 = {
	values = {
        enemy = biker_table.female_1
	}
}
local fem_biker_2 = {
	values = {
        enemy = biker_table.female_2
	}
}
local fem_biker_3 = {
	values = {
        enemy = biker_table.female_3
	}
}
local guard_biker = {
	values = {
        enemy = biker_table.guard_biker
	}
}
return {
	--Pro Job PONR 
	[101016] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[103048] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false,
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	--Always spawn keycard in Mexico
	[102270] = disabled,
	[100697] = {
		on_executed = {
			{id = 102271, delay = 0}
		}
	},
	-- Remove red lights from keycard readers because vault can be opened in loud now
	[103709] = disabled,
	--female/guard bikers
	[100670] = fem_biker_3,
	[100673] = fem_biker_2,
	[100116] = guard_biker,
	[101571] = fem_biker_3,
	[101556] = fem_biker_1,
	[101037] = guard_biker,
	[101034] = fem_biker_2,
	[101222] = fem_biker_3,
	[101235] = fem_biker_2,
	[101310] = guard_biker,
	[101683] = fem_biker_1,
	[101866] = guard_biker
}