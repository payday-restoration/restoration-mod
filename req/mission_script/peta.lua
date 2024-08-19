local pro_job = Global.game_settings and Global.game_settings.one_down
local bravos_inbound = false

	if pro_job then	
		bravos_inbound = true
	end	

return {
	--Highlight all remaining goats when Boris arrives
	--Call Bravos when on PJs
	[100245] = {
	--spawn_bravos = bravos_inbound,
	on_executed = {
			{id = 100672, delay = 0}
		}
	}
}