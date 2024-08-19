local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 650
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 600
	else
		ponr_value = 550
	end
local responder_table = {
	responder_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
	responder_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2",
	responder_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
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
        enemy = responder_table.responder_dozer
	}
}
local fbi_ready_team_1 = {
	values = {
        enemy = responder_table.responder_1
	}
}
local fbi_ready_team_2 = {
	values = {
        enemy = responder_table.responder_2
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
	[102288] = fbi_ready_team_1,
	[102289] = fbi_ready_team_1,
	[102290] = fbi_ready_team_2,
	[102291] = fbi_ready_team_2,
	[102318] = fbi_ready_team_1,
	[102319] = fbi_ready_team_2,
	[102320] = fbi_ready_team_2,
	[102321] = fbi_ready_team_2,
	[102322] = fbi_ready_team_2,
	[102323] = fbi_ready_team_1,
	[102324] = fbi_ready_team_2,
	[102325] = fbi_ready_team_2,
	[102326] = fbi_ready_team_2,
	[102327] = fbi_ready_team_1,
	[102328] = fbi_ready_team_2,
	[102329] = fbi_ready_team_2,
	[102330] = fbi_ready_team_1,
	[102331] = fbi_ready_team_1,
	[102332] = fbi_ready_team_1,
	[102333] = fbi_ready_team_2,
	[102334] = fbi_ready_team_2,
	[102335] = fbi_ready_team_2,
	[102336] = fbi_ready_team_1,
	[102337] = fbi_ready_team_1
}