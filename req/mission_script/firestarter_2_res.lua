local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local vet_cop = (difficulty == 8 and "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")

	if difficulty <= 5 then
		ponr_value = 360	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end
	
local vet = {
	values = {
        enemy = vet_cop
	}
}
return {
	--Pro Job PONR 
	[107143] = {
		ponr = ponr_value
	},
	--Force Vet Cop on DS (cause OMNIA ASU in FBI HQ looks odd)
	[103085] = vet,
	[103092] = vet,
	[103097] = vet
}