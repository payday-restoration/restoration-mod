local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

return {
    -- Nasty Elevator surprise
    -- Enable them in loud first 
    [100021] = {
        on_executed = {
        {id = 400005, delay = 0},
        },
    },
    -- ACCESS DENIED 
    [102876] = {
        on_executed = {
            {id = 400006, delay = 2}, -- smokebomb
            -- Fishbowl men (will change if medic dozer gets added in roster)
            {id = 400001, delay = 0},
            {id = 400002, delay = 0},
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
                name = "break_roomm",
                force = 3,  
                position = Vector3(3306, 1156, 0.382),
            },
        },
    },
}