local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank = (difficulty == 8 and "units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"
local diff_scaling = 0.085 * difficulty
local mayhem_above = difficulty >= 6
local enabled_chance_vault_dozer = math.random() < diff_scaling

local optsBulldozer_vault = {
    enemy = tank,
    enabled = (mayhem_above and enabled_chance_vault_dozer)
}

return {
    elements = {
		restoration:gen_dummy(
            400001,
            "bulldozer_vault_1",
            Vector3(47, -5298, -400),
            Rotation(0, 0, -0),
            optsBulldozer_vault
        ),
		restoration:gen_dummy(
            400002,
            "bulldozer_vault_2",
            Vector3(-78, -5298, -400),
            Rotation(0, 0, -0),
            optsBulldozer_vault
        )
    }
}
