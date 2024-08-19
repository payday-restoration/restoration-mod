--[[
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/payday2/characters/ene_spook_1/ene_spook_1"
local cop_1 = "units/payday2/characters/ene_cop_1/ene_cop_1"
local cop_2 = "units/payday2/characters/ene_cop_2/ene_cop_2"
local cop_4 = "units/payday2/characters/ene_cop_4/ene_cop_4"
local pro_job = Global.game_settings and Global.game_settings.one_down
local death_wish_above = difficulty >= 7
local death_sentence = difficulty == 8
local diff_scaling = 0.065 * difficulty
local diff_scaling_2 = 0.085 * difficulty


local optsBulldozer = {
    enemy = tank_skull,
    on_executed = { 
		{ id = 400003, delay = 3 }
	},
	enabled = death_wish
}
local optsBulldozerDS = {
    enemy = tank_skull,
    on_executed = { 
		{ id = 400004, delay = 3 }
	},
	enabled = death_sentence
}
local optsPatrolCop_1 = {
    enemy = patrolman_1,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400013, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_2 = {
    enemy = patrolman_2,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400013, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_3 = {
    enemy = patrolman_3,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400015, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_4 = {
    enemy = patrolman_1,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400015, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_5 = {
    enemy = patrolman_2,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400014, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_6 = {
    enemy = patrolman_3,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400014, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_7 = {
    enemy = patrolman_1,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400016, delay = 0 } 
	},
    enabled = true
}
local optsPatrolCop_8 = {
    enemy = patrolman_2,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400016, delay = 0 } 
	},
    enabled = true
}
local optsCloaker = {
    enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_clk_over_2_5m",
    enabled = true
}
local optsDefend_SO = {
	SO_access = "4096",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_defend"
}
local optsWalkToSpot = {
	SO_access = "64",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_b",
	can_not_be_muted = true
}


return {
    elements = {
        -- Skulldozer nearby the van (based on DW Trailer)
        restoration:gen_dummy(
            400001,
            "van_dozer_1",
            Vector3(-8305, -3511, 0),
            Rotation(-90, 0, -0),
            optsBulldozer
        ),
        restoration:gen_dummy(
            400002,
            "van_dozer_2",
            Vector3(-8305, -3593, 0),
            Rotation(-90, 0, -0),
            optsBulldozerDS
        ),
        restoration:gen_so(
            400003,
            "dozer_defend_so_1",
            Vector3(-7273, -2895, -19.999),
            Rotation(0, 0, -0),
            optsDefend_SO
        ),
		restoration:gen_so(
            400004,
            "dozer_defend_so_2",
            Vector3(-7177, -2895, -19.999),
            Rotation(0, 0, 0),
            optsDefend_SO
        ),
		--Patrol Cops
		restoration:gen_dummy(
            400005,
            "patrolman_1",
            Vector3(-6140, -6534, 0),
            Rotation(90, -0, -0),
            optsPatrolCop_1
        ),
        restoration:gen_dummy(
            400006,
            "patrolman_2",
			Vector3(-6190, -6534, 0),
            Rotation(90, -0, -0),
            optsPatrolCop_2
        ),
		restoration:gen_dummy(
            400007,
            "patrolman_3",
            Vector3(6602, 134, 5),
            Rotation(-180, 0, -0),
            optsPatrolCop_3
        ),
        restoration:gen_dummy(
            400008,
            "patrolman_4",
            Vector3(6602, 76, 5),
            Rotation(-180, 0, -0),
            optsPatrolCop_4
        ),
		restoration:gen_dummy(
            400009,
            "patrolman_5",
            Vector3(2604, -2207, 0),
            Rotation(0, 0, -0),
            optsPatrolCop_5
        ),
        restoration:gen_dummy(
            400010,
            "patrolman_6",
            Vector3(2604, -2294, 0),
            Rotation(0, 0, -0),
            optsPatrolCop_6
        ),
		restoration:gen_dummy(
            400011,
            "patrolman_7",
            Vector3(2665, 6771, 0),
            Rotation(90, -0, -0),
            optsPatrolCop_7
        ),
		restoration:gen_dummy(
            400012,
            "patrolman_8",
            Vector3(2586, 6771, 0),
            Rotation(90, -0, -0),
            optsPatrolCop_8
        ),
		restoration:gen_so(
            400013,
            "walk_to_the_spot_1",
            Vector3(6502, -2060, 1.001),
            Rotation(-180, 0, -0),
            optsWalkToSpot
        ),
		restoration:gen_so(
            400014,
            "walk_to_the_spot_2",
            Vector3(-5801, -6560, 0),
            Rotation(-90, 0, -0),
            optsWalkToSpot
        ),
		restoration:gen_so(
            400015,
            "walk_to_the_spot_3",
            Vector3(3001, 6407, 0),
            Rotation(-90, 0, -0),
            optsWalkToSpot
        ),
		restoration:gen_so(
            400016,
            "walk_to_the_spot_4",
            Vector3(6637, 297, 0),
            Rotation(0, 0, -0),
            optsWalkToSpot
        ),
		restoration:gen_dummy(
            4000017,
            "cloaker_1",
            Vector3(-1147, 4391, 0),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
        restoration:gen_dummy(
            400018,
            "cloaker_2",
            Vector3(-1233, 4395, 0),
            Rotation(-180, 0, -0),
            optsCloaker
        ),
		restoration:gen_dummy(
            400019,
            "cloaker_3",
            Vector3(-1317, 4395, 0),
            Rotation(-180, 0, -0),
            optsCloaker
        )
    }
}
]]--