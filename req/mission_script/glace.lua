bulldozer = ""

	if tweak_data:difficulty_to_index(difficulty) <= 7 then
		bulldozer = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		bulldozer = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
	end	

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 540
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 510
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 480
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 420
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 390
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 360
		ponr_toggle = true		
	end
end

return {
		--Pro Job PONR 
		[100137] = {
			ponr = ponr_value,
			enabled = ponr_toggle
	},
	--PDTH's OVK 145+ Throwback (Fixes the special scaffolding spawn not using the zipline and replaces cloaker with bulldozer)
	[100670] = {
		values = {
			enemy = bulldozer,	
			on_executed = { id = 101521, delay = 3 }
		}
	}	
}	