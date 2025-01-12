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
	--Force Vet Cop on DS (cause OMNIA ASU in FBI HQ looks odd)
	[103085] = vet,
	[103092] = vet,
	[103097] = vet
}