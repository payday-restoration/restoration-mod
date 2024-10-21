local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local diff_scaling = 0.095 * difficulty
local dozer = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local dozer_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local shield = ((difficulty >= 6 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc" or difficulty == 7 and "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec") or "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local overkill_above = difficulty >= 5
local mayhem_above = difficulty >= 6
local enabled_chance_taser_and_shields = math.random() < diff_scaling
local enabled_chance_dozer = math.random() < diff_scaling
local enabled_chance_dozer_scaffold = math.random() < diff_scaling
local enabled_chance_shield_scaffold = math.random() < diff_scaling

local optsBulldozer = {
    enemy = dozer,
    enabled = (overkill_above and enabled_chance_dozer)
}
local optsBulldozer_skull = {
    enemy = dozer_skull,
    enabled = (mayhem_above and enabled_chance_dozer_scaffold)
}
local optsShield_1 = {
    enemy = shield,
	on_executed = { 
		{ id = 400009, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_taser_and_shields)
}
local optsShield_2 = {
    enemy = shield,
	on_executed = { 
		{ id = 400010, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_taser_and_shields)
}
local optsShield_scaff_1 = {
    enemy = shield,
	on_executed = { 
		{ id = 400012, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_shield_scaffold)
}
local optsShield_scaff_2 = {
    enemy = shield,
	on_executed = { 
		{ id = 400013, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_shield_scaffold)
}
local optsTaser = {
    enemy = taser,
	on_executed = { 
		{ id = 400011, delay = 0 } 
	},
    enabled = (overkill_above and enabled_chance_taser_and_shields)
}
local optsDefend_and_Sniper_SO = {
	SO_access = tostring(2048+8192),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsrespawn_dozer = {
	on_executed = { 
		{id = 101320, delay = 30, delay_rand = 10}
	},
	elements = { 
		101320
	},
    event = "death"
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
            optsShield_1
        ),
		restoration:gen_dummy(
            400003,
            "shield_stairs_2",
            Vector3(-2524.437, -47481.051, 5372.570),
            Rotation(-87, -0, -0),
            optsShield_2
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
            Rotation(0, -0, -0),
            optsShield_scaff_1
        ),
		 restoration:gen_dummy(
            400006,
            "shield_scaffolding_2",
            Vector3(-2781.016, -23341.270, 7115.008),
            Rotation(90, -0, -0),
            optsShield_scaff_2
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
        ),
		restoration:gen_so(
            400009,
            "shield_blockade_so_1",
            Vector3(-2520.983, -47546.961, 5370.570),
            Rotation(-87, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400010,
            "shield_blockade_so_2",
            Vector3(-2524.437, -47481.051, 5372.570),
            Rotation(-87, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400011,
            "taser_blockade_so_1",
            Vector3(-2994, -47502, 5225.499),
            Rotation(-90, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400012,
            "shield_scaffold_blockade_so_1",
            Vector3(-4100, -22849, 7115.008),
            Rotation(0, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400013,
            "shield_scaffold_blockade_so_2",
            Vector3(-2781.016, -23341.270, 7115.008),
            Rotation(90, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummytrigger(
            400014,
            "respawn_bulldozer",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_dozer
        )
    }
}
