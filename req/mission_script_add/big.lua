local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local skully = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local mayhem_above = difficulty >= 6

local optsBulldozer1 = {
    enemy = skully,
    on_executed = { { id = 400003, delay = 0 } },
    enabled = mayhem_above
}

local optsBulldozer2 = {
    enemy = skully,
    on_executed = { { id = 400003, delay = 0 } },
    enabled = mayhem_above
}

local optsBulldozerSO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}

return {
    elements = {
        -- Skulldozers that spawn after cops arrive (20 seconds after)
        restoration:gen_dummy(
            400001,
            "fwb_dozer_1",
            Vector3(3960, 2480, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer1
        ),
        restoration:gen_dummy(
            400002,
            "fwb_dozer_2",
            Vector3(3911, 2473, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer2
        ),
        restoration:gen_so(
            400003,
            "dozer_hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsBulldozerSO
        )
    }
}