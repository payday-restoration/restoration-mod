local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local dozer = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local dozer_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local shield = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc") or (difficulty <= 7 and "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec") or (difficulty <= 5 and "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1")
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local overkill_above = difficulty >= 5
local mayhem_above = difficulty >= 6
local diff_scaling = 12.5 * difficulty
local enabled_chance_taser_and_shields = math.rand(1) <= diff_scaling
local enabled_chance_dozer = math.rand(1) <= diff_scaling
local enabled_chance_dozer_scaffold = math.rand(1) <= diff_scaling
local enabled_chance_shield_scaffold = math.rand(1) <= diff_scaling

local optsBulldozer = {
    enemy = dozer,
    enabled = (overkill_above and enabled_chance_dozer)
}
local optsBulldozer_skull = {
    enemy = dozer_skull,
    enabled = (mayhem_above and enabled_chance_dozer_scaffold)
}
local optsShield = {
    enemy = shield,
    enabled = (overkill_above and enabled_chance_taser_and_shields)
}
local optsShield_scaff = {
    enemy = shield,
    enabled = (overkill_above and enabled_chance_shield_scaffold)
}
local optsTaser = {
    enemy = taser,
    enabled = (overkill_above and enabled_chance_taser_and_shields)
}


return {
    elements = {
	--spawns near the escape (Similiar to PDTH)
        restoration:gen_dummy(
            400001,
            "dozer_stairs",
            Vector3(-3129, -48029, 5030.316),
            Rotation(90, -0, -0),
            optsBulldozer
        ),
        restoration:gen_dummy(
            400002,
            "shield_stairs_1",
            Vector3(-2520.983, -47546.961, 5370.570),
            Rotation(-87, -0, -0),
            optsShield
        ),
		restoration:gen_dummy(
            400003,
            "shield_stairs_2",
            Vector3(-2524.437, -47481.051, 5372.570),
            Rotation(-87, -0, -0),
            optsShield
        ),
        restoration:gen_dummy(
            400004,
            "taser_stairs",
            Vector3(-2994, -47502, 5225.499),
            Rotation(-90, -0, -0),
            optsTaser
        ),
	--scaffolding spawns	
		 restoration:gen_dummy(
            400005,
            "shield_scaffolding_1",
            Vector3(-4100, -22849, 7115.008),
            Rotation(2, -0, -0),
            optsShield_scaff
        ),
		 restoration:gen_dummy(
            400006,
            "shield_scaffolding_2",
            Vector3(-2781.016, -23341.270, 7115.008),
            Rotation(83, -0, -0),
            optsShield_scaff
        ),
		restoration:gen_dummy(
            400007,
            "dozer_scaffolding_1",
            Vector3(-3102, -23325, 6519.008),
            Rotation(90, -0, -0),
            optsBulldozer_skull
        ),
		restoration:gen_dummy(
            400008,
            "dozer_scaffolding_2",
            Vector3(-3580, -22030, 6519.008),
            Rotation(90, -0, -0),
            optsBulldozer_skull
        )
    }
}
