local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local TitanWelcomingPartyChance = math.random() < 0.5
local tdozer = ((difficulty == 8 and pro_job and TitanWelcomingPartyChance) and "units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2")
local tshield = ((difficulty == 8 and pro_job and TitanWelcomingPartyChance) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300

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