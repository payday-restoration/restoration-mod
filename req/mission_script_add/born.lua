local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local diff_scaling = 0.125 * difficulty
local biker_tank = "units/payday2/characters/ene_bulldozer_biker_1/ene_bulldozer_biker_1"
local overkill_above = difficulty >= 5
local enabled_chance_biker_dozer = math.random() < diff_scaling

local optsBulldozerBiker = {
    enemy = biker_tank,
    enabled = (overkill_above and enabled_chance_biker_dozer)
}

return {
    elements = {
        -- Bikerdozer in the bunker
        restoration:gen_dummy(
            400001,
            "biker_dozer",
            Vector3(-763.778, 1828.911, -400),
            Rotation(0, 0, -0),
            optsBulldozerBiker
        )
    }
}