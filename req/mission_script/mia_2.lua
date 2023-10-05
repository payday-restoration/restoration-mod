local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 330
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 300
	elseif difficulty_index == 8 then
		ponr_value = 240		
	end

return {
	--Pro Job PONR 
	[100220] = {
		ponr = ponr_value
	},
	--Snipers that look on Panic Room zone now spawn more than 1 time
	[101128] = {
		values = {
			trigger_times = 0
		}
	},
	[101121] = {
		values = {
			trigger_times = 0
		}
	},
	[101520] = {
		values = {
			trigger_times = 0
		}
	},
	[101113] = {
		values = {
			trigger_times = 0
		}
	},
	[101140] = {
		values = {
			trigger_times = 0
		}
	},
	[101136] = {
		values = {
			trigger_times = 0
		}
	},
	--Should decrease sniper spawn intensity (I hope)
	[101202] = {
		values = {
			chance = 2
		}
	},
	[100686] = {
		values = {
			chance = 4
		}
	},
	-- Boss spawn
	[100521] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100533] = {
		difficulty = 1
	}
}