local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

return {
    -- Bravos spawn when elevator starts moving to your floor 
    [103443] = {
        spawn_bravos = pro_job,
		values = {
			time = 30,
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