local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job_and_death_sentence = difficulty == 8 and Global.game_settings and Global.game_settings.one_down
local TitanWelcomingPartyChance = 0.5

if pro_job_and_death_sentence and math.random() < TitanWelcomingPartyChance then
	tdozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
	tshield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
end

	if difficulty <= 5 then
		ponr_value = 360
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
	end

return {
	--Pro Job PONR 
	[101774] = {
		ponr = ponr_value
	},
	--End PONR once everyone is inside the chopper
	[102357] = {
        ponr_end = true
    },
	--slope forces
	[100373] = {
		values = {
            enemy = tdozer
		}
	},
	[100402] = {
		values = {
            enemy = tshield
		}
	},
	[101498] = {
		values = {
            enemy = tshield
		}
	}
}