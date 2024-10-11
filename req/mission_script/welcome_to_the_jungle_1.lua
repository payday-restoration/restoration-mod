local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 560 or (difficulty == 6 or difficulty == 7) and 520) or 480
local biker_guard = (difficulty >= 7 and "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1")

local guard_biker = {
	values = {
         enemy = biker_guard
	}
}

return {
	--Pro Job PONR 
	[101375] = {
		ponr = ponr_value
	},
	--Disable Titan Cams
	[101301] = {
		values = {
			enabled = false
		}
	},
	--Biker Guards replacing some outside bikers on DW above
	[103338] = guard_biker,
	[103337] = guard_biker
}