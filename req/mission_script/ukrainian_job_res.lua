local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 300	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 240	
	else
		ponr_value = 180		
	end

return {
	--Pro Job PONR 
	[101761] = {
		ponr = ponr_value
	},
	[101836] = {
		ponr = ponr_value
	},
	[102031] = {
		ponr = ponr_value
	},
	[102033] = {
		ponr = ponr_value
	},
	--Give glass cutter to all players
	[100007] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	}
}