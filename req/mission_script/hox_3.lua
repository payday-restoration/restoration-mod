local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 650 or (difficulty == 6 or difficulty == 7) and 600) or 550
local responder_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local responders_table = {
		"units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
		"units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
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
local fbi_ready_team_dozer = {
	values = {
        enemy = responder_dozer
	}
}
local fbi_ready_team = {
	values = {
        enemy = responders_table
	}
}

return {
	--Pro Job PONR 
	[101735] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Boss spawn
	[102107] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100788] = {
		difficulty = 1
	},
	--Disable garage escape
	[100206] = {
		values = {
			enabled = false
		}
	},
	--FBI Team Responders
	--Don't let ZEAL Dozers spawn on DS
	[102346] = fbi_ready_team_dozer,
	[102347] = fbi_ready_team_dozer,
	[102348] = fbi_ready_team_dozer,
	[102349] = fbi_ready_team_dozer,
	[102288] = fbi_ready_team,
	[102289] = fbi_ready_team,
	[102290] = fbi_ready_team,
	[102291] = fbi_ready_team,
	[102318] = fbi_ready_team,
	[102319] = fbi_ready_team,
	[102320] = fbi_ready_team,
	[102321] = fbi_ready_team,
	[102322] = fbi_ready_team,
	[102323] = fbi_ready_team,
	[102324] = fbi_ready_team,
	[102325] = fbi_ready_team,
	[102326] = fbi_ready_team,
	[102327] = fbi_ready_team,
	[102328] = fbi_ready_team,
	[102329] = fbi_ready_team,
	[102330] = fbi_ready_team,
	[102331] = fbi_ready_team,
	[102332] = fbi_ready_team,
	[102333] = fbi_ready_team,
	[102334] = fbi_ready_team,
	[102335] = fbi_ready_team,
	[102336] = fbi_ready_team,
	[102337] = fbi_ready_team
}