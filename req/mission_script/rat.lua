local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 7 then
		clonker = "units/payday2/characters/ene_spook_1/ene_spook_1"
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		clonker = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"	
	end
	
return {
	--Replace Heavy SWATs that spawn from the chopper with cloakers
	[101571] = {
		values = {
            enemy = clonker
		}
	},
	[101572] = {
		values = {
            enemy = clonker
		}
	}
}