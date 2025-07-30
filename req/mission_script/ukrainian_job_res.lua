local disable = {
	values = {
		enabled = false,
	},
}
local pro_job_ponr = {
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}

return {
	-- Pro Job PONR
	-- Triggers once both A) whisper state is off (on alarm), and B) the tiara has been collected
	[100035] = pro_job_ponr,
	[101371] = pro_job_ponr,
	-- No endless assault
	[104124] = disable,
	-- Give glass cutter to all players
	[100007] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	}
}
