local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600

return {
	--Pro Job PONR 
	[100034] = {
		ponr = ponr_value
	},
	[101050] = {
		values = {
			enemy = "units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2"
		}
	}
}
