local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local vet_cop = (difficulty == 8 and "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
local hunt_projob = pro_job


local vet = {
	values = {
        enemy = vet_cop
	}
}
return {
	--Pro Job PONR+Endless assault
	[107143] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	-- FBI Ready Team mini wave 
	[103285] = {
		on_executed = {
			{id = 400016, delay = 15, delay_rand = 10,}
		},
	},
	-- Reinfroce cause fuck you 
	[100973] = {
		reinforce = {
			{
				name = "reception", 
				force = 3,
				position = Vector3(-800, 973, 0),
			},
			{
				name = "aquarium",
				force = 2,
				position = Vector3(-832, -584, -0),
			},
			{
				name = "desk_1",
				force = 2,
				position = Vector3(1276, -443, 0),
			},
			{
				name = "desk_2",
				force = 2,
				position = Vector3(1297, -1552, 0),
			},
		},
	},
	--Force Vet Cop on DS (cause OMNIA ASU in FBI HQ looks odd)
	[103085] = vet_cop,
	[103092] = vet_cop,
	[103097] = vet_cop
}