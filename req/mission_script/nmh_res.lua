local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local surprise_dozers = {
  on_executed = {
        {id = 400005, delay = 0},
        },
    }
return {
    -- Nasty Elevator surprise
    -- enable when A) goes loud right away if you dont do the stealth portion B) activate during the ICU segment 
    [100021] = surprise_dozers, 
    [104090] = surprise_dozers,
    -- ACCESS DENIED 
    [103439] = {
        on_executed = {
            -- smokebomb
            {id = 400006, delay = 0},
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
                name = "break_room",
                force = 3,  
                position = Vector3(3306, 1156, 0.382),
            },
        },
    },
}