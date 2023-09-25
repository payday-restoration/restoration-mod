local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 360
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 480
	end	

return {
	--Pro Job PONR 
	[101095] = {
		ponr = ponr_value
	},
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	--disable the bad van escape spots
	[100754] = {
		values = {
			enabled = false
		}
	},
	[100755] = {
		values = {
			enabled = false
		}
	}
}	