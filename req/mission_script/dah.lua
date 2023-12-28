local chance_ovk = 10
local chance_dw = 20

if Global.game_settings and Global.game_settings.one_down then	
	chance_ovk = chance_ovk + 5
	chance_dw = chance_dw + 5
end

return {
	--Disable outline for Ralph if he is tied
	[100461] = {
		on_executed = {
			{id = 100082, delay = 0}
		}
	},
	-- Increase chances to spawn red diamond if PJ is enabled
	[104079] = {
		values = {
			chance = chance_ovk
		}
	},
	[104082] = {
		values = {
			chance = chance_dw
		}
	},
	-- Slow down vault group spawns
	[100722] = {
		values = {
			interval = 30
		}
	},
	[100723] = {
		values = {
			interval = 30
		}
	},
	[104821] = {
		values = {
			interval = 30
		}
	},
	[104822] = {
		values = {
			interval = 30
		}
	}
}