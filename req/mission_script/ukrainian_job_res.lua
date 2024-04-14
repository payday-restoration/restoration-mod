local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
		
	if difficulty <= 6 then
		ponr_value = 240	
	else
		ponr_value = 180		
	end
	
	if pro_job then
		hunt_projob = true
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
	--Endless Assault for Pro Job
	[104124] = {
		values = {
			enabled = hunt_projob
		}
	},
	--Give glass cutter to all players
	[100007] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	}
}