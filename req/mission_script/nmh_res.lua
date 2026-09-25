local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

return {
    -- Alert all civs on mask up and delay panic button SO
	[102518] = {
		on_executed = {
			{ id = 102540, delay = 10 }
		},
		func = function()
			for _, u_data in pairs(managers.enemy:all_civilians()) do
				u_data.unit:movement():set_cool(false)
			end
		end
	},
	-- Delay SWAT response
	[102675] = {
		on_executed = {
			{ id = 103225, delay = 20 }
		}
	},
    -- Disable most reinforce points
	[103706] = disabled,
	[103707] = disabled,
	[103847] = disabled
	[103847] = disabled,
	-- Let cloaker interrupt sniper SO
	[104306] = {
		values = {
			interruptible = true,
			interrupt_dmg = 0.1,
			interrupt_dis = 3
		}
	},
    -- Bravos spawn when elevator starts moving to your floor 
    [100184] = {
        spawn_bravos = pro_job,
		values = {
			time = 20,
		},
    },
    -- ACCESS DENIED 
    [103439] = {
        on_executed = {
            -- TAAAAANKKKK(s) (will change if medic dozer gets added in roster)
            {id = 400005, delay = 0},
             -- smokebomb
            {id = 400006, delay = 0.3},
        },
    },
    -- Reinforce
    [102325] = { -- when the ICU doors open 

        reinforce = {
            {
                name = "reception",
                force = 3,
                position = Vector3(508, 130, 0.382),
            },
            {
                name = "elevators", 
                force = 2, 
                position = Vector3(1526, 866, -0.118),
            },
            {
                name = "break_room",
                force = 3,  
                position = Vector3(3306, 1156, 0.382),
            },
        },
    },
}