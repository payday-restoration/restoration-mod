local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local responder_dozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local responders_table = {
	"units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1",
	"units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2",
}
local fbi_ready_team_dozer = {
	values = {
		enemy = responder_dozer,
	},
}
local fbi_ready_team = {
	values = {
		enemy = responders_table,
	},
}
return {
	-- Pro Job PONR
	-- Triggers once both A) the rat dies, and B) whisper state is off (on alarm)
	[101735] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	[100824] = {
		on_executed = {
			{ id = 400002, delay = 0, },
		},
	},
	-- Disable garage escape
	[100206] = {
		values = {
			enabled = false,
		},
	},
	-- Add new reinforce around the house (from Eclipse)
	[100109] = {
		reinforce = {
			{
				name = "house_front",
				force = 3,
				position = Vector3(-1600, 0, 0),
			},
			{
				name = "house_left",
				force = 2,
				position = Vector3(-650, 2500, -150),
			},
			{
				name = "house_right",
				force = 2,
				position = Vector3(1600, -900, 0),
			},
			{
				name = "house_back",
				force = 3,
				position = Vector3(3000, 800, 20),
			},
		},
	},
	-- FBI Team Responders
	-- Don't let ZEAL Dozers spawn on DS
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
	[102337] = fbi_ready_team,
}
