local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 6 and 240) or 180

local ponr = {
	ponr = ponr_value,
	hunt = hunt_projob
}	

return {
	--Pro Job PONR 
	[101761] = ponr,
	[101836] = ponr,
	[102031] = ponr,
	[102033] = ponr,
	--Give glass cutter to all players
	[100007] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	}
}