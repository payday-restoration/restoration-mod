return {
	--fixes rappeling SWAT using wrong spawn animation
	[100846] = {
		values = {
            spawn_action = "e_sp_down_16m_right"
		}
	},
	-- fixed some sniping swats not spawning
	[102486] = {
		on_executed = {
            {id = 100677, delay = 0}
		}
	},
	[102457] = {
		on_executed = {
           {id = 100677, delay = 0}
		}
	}
}