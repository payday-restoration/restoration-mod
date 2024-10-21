local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 640 or (difficulty == 6 or difficulty == 7) and 520) or 480
local law_team = {
	values = {
		team = "law1"
	}
}

return {
	--Pro Job PONR 
	[101174] = {
		ponr = ponr_value
	},
	--Dimitri's men are friendly to cops
	[101858] = law_team,
	[101865] = law_team,
	[101927] = law_team,
	[101934] = law_team,
	[102193] = law_team,
	[102200] = law_team,
	[102202] = law_team,
	[102206] = law_team,
	[102617] = law_team,
	[102619] = law_team,
	[100513] = law_team,
	[100517] = law_team,
	[100518] = law_team,
	[100520] = law_team,
	[100522] = law_team,
	[100522] = law_team,
	[100523] = law_team,
	[100528] = law_team,
	[100530] = law_team,
	[100532] = law_team,
	[100534] = law_team,
	[101252] = law_team,
	[102708] = law_team,
	[102709] = law_team,
	[103450] = law_team,
	[103451] = law_team,
	[103452] = law_team,
	[103637] = law_team,
	[103638] = law_team,
	[103639] = law_team,
	[100991] = law_team,
	[100994] = law_team,
	[101100] = law_team,
	[101231] = law_team,
	[101232] = law_team,
	[101233] = law_team,
	[102088] = law_team,
	[102099] = law_team
}