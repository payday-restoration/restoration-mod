local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/payday2/characters/ene_spook_1/ene_spook_1"
local shield = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
local bravo_1 = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"
local bravo_2 = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"
local bravo_3 = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"
local tank_bravo = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
local rouge = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
local pro_job = Global.game_settings and Global.game_settings.one_down
local very_hard_above = difficulty >= 4
local overkill_above = difficulty >= 5
local death_sentence = difficulty == 8
local diff_scaling = 0.065 * difficulty
local diff_scaling_2 = 0.085 * difficulty
local enabled_chance_cloakers = math.random() < diff_scaling
local enabled_chance_cloakers_2 = math.random() < diff_scaling_2


	if difficulty == 5 then
		shield = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"
	elseif difficulty == 6 or difficulty == 7 then
		shield = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec"
	elseif difficulty == 8 then
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
	end

if pro_job then
	if difficulty >= 5 then
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
	if difficulty == 8 then
		cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
	end
end	

local optsBulldozer = {
    enemy = tank,
    on_executed = { 
		{ id = 400003, delay = 3 },
		{ id = 400048, delay = 0 },
	},
    enabled = overkill_above
}
local optsBulldozer_2 = {
    enemy = tank,
    on_executed = { 
		{ id = 400003, delay = 3 },
		{ id = 400048, delay = 0 }
	},
    enabled = death_sentence
}
local optsCloaker_1 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400009, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400010, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_3 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400011, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_4 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400012, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_5 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400013, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsTitanCloaker_1 = {
	enemy = rouge,
	participate_to_group_ai = true,
	on_executed = { { id = 400016, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsTitanCloaker_2 = {
	enemy = rouge,
	participate_to_group_ai = true,
	on_executed = { { id = 400017, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsBulldozer_SO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsBravo_1 = {
    enemy = bravo_1,
	participate_to_group_ai = true,
    on_executed = { 
		{ id = 400024, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_2 = {
    enemy = bravo_2,
	participate_to_group_ai = true,
    on_executed = { 
		{ id = 400025, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_1 = {
    enemy = bravo_1,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_walk_left",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_2 = {
    enemy = bravo_1,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_fall_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_Bus_Escape_3 = {
    enemy = bravo_2,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_look_around",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_3 = {
    enemy = bravo_3,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_fall_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsBravo_dozer = {
    enemy = tank_bravo,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400026, delay = 0 } 
	},
    enabled = (very_hard_above and pro_job)
}
local optsBravo_dozer_bus_escape = {
    enemy = tank_bravo,
	participate_to_group_ai = true,
	spawn_action = "e_sp_dizzy_get_up",
    enabled = (very_hard_above and pro_job)
}
local optsShield_Defend_1 = {
    enemy = shield,
	on_executed = { 
		{ id = 400038, delay = 0 } 
	},
	participate_to_group_ai = true,
    enabled = true
}
local optsShield_Defend_2 = {
    enemy = shield,
	on_executed = { 
		{ id = 400039, delay = 0 } 
	},
	participate_to_group_ai = true,
    enabled = true
}
local optsShield_Defend_3 = {
    enemy = shield,
	on_executed = { 
		{ id = 400040, delay = 0 } 
	},
	participate_to_group_ai = true,
    enabled = true
}
local optsDefend_and_Sniper_SO = {
	SO_access = tostring(128+2048+4096+8192),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_idle_by_container"
}
local optsCloaker_Hide_SO_2 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_sneak_wait_stand"
}
local spawn_bravo_eleavtor_escape = {
	enabled = true,
	on_executed = { 
		{ id = 400021, delay = 0 },
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 }
	}
}
local spawn_bravo_bus_escape = {
	enabled = true,
	on_executed = { 
		{ id = 400027, delay = 0 },
		{ id = 400028, delay = 0 },
		{ id = 400029, delay = 0 },
		{ id = 400030, delay = 0 },
		{ id = 400031, delay = 0 },
		{ id = 400032, delay = 0 },
		{ id = 400033, delay = 0 }
	}
}
local spawn_cloakers = {
	enabled = true,
	on_executed = { 
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 }
	}
}
local enable_bravos = {
	elements = { 
		400018,
		400042
	}
}
local disable_bravos = {
	toggle = "off",
	elements = { 
		400018,
		400042
	}
}
local disable_bo_dozers = {
	toggle = "off",
	elements = { 
		400001,
		400002,
		400046,
		400047
	}
}
local optsrespawn_shields = {
	on_executed = { 
		{ id = 400035, delay = 45 },
		{ id = 400036, delay = 45 },
		{ id = 400037, delay = 45 }
	},
	elements = { 
		400036
	},
    event = "death"
}
local optsmanager_has_been_killed = {
	on_executed = { 
		{ id = 400044, delay = 0 },
	},
	elements = { 
		101506
	},
    event = "death"
}
local enable_bo_dozers_the_sequel = {
	elements = { 
		400001,
		400002,
		400046,
		400047
	}
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_b",
	can_not_be_muted = true
}


return {
    elements = {
        -- Bulldozers that spawn after cops arrive (20 seconds after)
        restoration:gen_dummy(
            400001,
            "fwb_dozer_1",
            Vector3(3960, 2480, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer
        ),
        restoration:gen_dummy(
            400002,
            "fwb_dozer_2",
            Vector3(3911, -4422, -1021),
            Rotation(-90, 0, -0),
            optsBulldozer
        ),
        restoration:gen_so(
            400003,
            "dozer_hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsBulldozer_SO
        ),
		--Cloakers, spawn as ambush in vault hallway (similiar to First World Bank)
		restoration:gen_dummy(
            400004,
            "cloaker_1",
            Vector3(-2864, 746, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_1
        ),
		restoration:gen_dummy(
            400005,
            "cloaker_2",
            Vector3(-2864, -1449, -599),
            Rotation(0, 0, -0),
            optsCloaker_2
        ),
		restoration:gen_dummy(
            400006,
            "cloaker_3",
            Vector3(-2098, 416, -998),
            Rotation(-177, 0, -0),
            optsCloaker_3
        ),
		restoration:gen_dummy(
            400007,
            "cloaker_4",
            Vector3(-2135.105, 1124.028, -998),
            Rotation(90, -0, -0),
            optsCloaker_4
        ),
		restoration:gen_dummy(
            400008,
            "cloaker_5",
            Vector3(-2690, 1478, -599),
            Rotation(-180, -0, -0),
            optsCloaker_5
        ),
		restoration:gen_so(
            400009,
            "cloaker_hide_so_1",
            Vector3(-2830, 375, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400010,
            "cloaker_hide_so_2",
            Vector3(-2854, -1158, -597),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400011,
            "cloaker_hide_so_3",
            Vector3(-2104.004, 52.529, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400012,
            "cloaker_hide_so_4",
            Vector3(-2858.536, 1231.877, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400013,
            "cloaker_hide_so_5",
            Vector3(-2475, 1258, -599),
            Rotation(-180, 0, 0),
            optsCloaker_Hide_SO_1
        ),
		--C4 spawns (Pro Job only)
		restoration:gen_dummy(
            400014,
            "rouge_c4_1",
            Vector3(-4649, 1877, -599),
            Rotation(-90, -0, -0),
            optsTitanCloaker_1
        ),
		restoration:gen_dummy(
            400015,
            "rouge_c4_2",
            Vector3(-6634, 1349, -599),
            Rotation(-0, 0, -0),
            optsTitanCloaker_2
        ),
		restoration:gen_so(
            400016,
            "rouge_hide_so_1",
            Vector3(-4253.838, 1914.332, -598),
            Rotation(90, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400017,
            "rouge_hide_so_2",
            Vector3(-6642, 1505, -599),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		--Bravo waiting for you in Elevator/Bus Escape
		restoration:gen_missionscript(
            400018,
            "spawn_bravo_elevator",
            spawn_bravo_eleavtor_escape
        ),
		restoration:gen_missionscript(
            400019,
            "spawn_bravo_bus",
            spawn_bravo_bus_escape
        ),
		restoration:gen_toggleelement(
            400020,
            "enable_bravos",
            enable_bravos
        ),
		restoration:gen_dummy(
            400021,
            "bravo_elevator_1",
            Vector3(-1547, -434, -1479.426),
            Rotation(-90, 0, -0),
            optsBravo_1
        ),
		restoration:gen_dummy(
            400022,
            "bravo_elevator_2",
            Vector3(-1547, -312, -1479.426),
            Rotation(-90, 0, -0),
            optsBravo_2
        ),
		restoration:gen_dummy(
            400023,
            "bravo_elevator_3",
            Vector3(-1208, -499, -1479.426),
            Rotation(180, 0, -0),
            optsBravo_dozer
        ),
		restoration:gen_so(
            400024,
            "bravo_defend_so_1",
            Vector3(-1450, -458, -1479.426),
            Rotation(-131, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400025,
            "bravo_defend_so_2",
            Vector3(-1369.305, -365.171, -1479.426),
            Rotation(-131, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400026,
            "bravo_defend_so_3",
            Vector3(-1189, -485, -1479.426),
            Rotation(180, 0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummy(
            400027,
            "bravo_bus_1",
            Vector3(-2264, -3668.836, -475),
            Rotation(-27, 0, -0),
            optsBravo_Bus_Escape_1
        ),
		restoration:gen_dummy(
            400028,
            "bravo_bus_2",
            Vector3(-2469.351, -3852.690, -475),
            Rotation(-10, 0, -0),
            optsBravo_Bus_Escape_2
        ),
		restoration:gen_dummy(
            400029,
            "bravo_bus_3",
            Vector3(-2635.076, -3674.971, -475),
            Rotation(-47, 0, -0),
            optsBravo_Bus_Escape_3
        ),
		restoration:gen_dummy(
            400030,
            "bravo_bus_4",
            Vector3(-2828.566, -3609.568, -475),
            Rotation(-96, 0, -0),
            optsBravo_Bus_Escape_2
        ),
		restoration:gen_dummy(
            400031,
            "bravo_bus_5",
            Vector3(-2623, -3900, -475),
            Rotation(-180, 0, -0),
            optsBravo_3
        ),
		restoration:gen_dummy(
            400032,
            "bravo_bus_6",
            Vector3(-2560.908, -3794.890, -475),
            Rotation(-12, 0, -0),
            optsBravo_dozer_bus_escape
        ),
		restoration:gen_dummy(
            400033,
            "bravo_bus_7",
            Vector3(-2766, -3829, -475),
            Rotation(0, 0, -0),
            optsBravo_Bus_Escape_1
        ),
		restoration:gen_toggleelement(
            400034,
            "disable_bravos",
            disable_bravos
        ),
		--Defend Shields
		restoration:gen_dummy(
            400035,
            "shield_heli_1",
            Vector3(1806, -3449, 954.990),
            Rotation(0, 0, -0),
            optsShield_Defend_1
        ),
		restoration:gen_dummy(
            400036,
            "shield_heli_2",
            Vector3(1727, -3449, 954.990),
            Rotation(0, 0, -0),
            optsShield_Defend_2
        ),
		restoration:gen_dummy(
            400037,
            "shield_heli_3",
            Vector3(1649, -3442, 954.990),
            Rotation(0, 0, -0),
            optsShield_Defend_3
        ),
		restoration:gen_so(
            400038,
            "shield_defend_so_1",
            Vector3(3349, -819.660, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400039,
            "shield_defend_so_2",
            Vector3(3388.500, -888.076, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_so(
            400040,
            "shield_defend_so_3",
            Vector3(3426, -953.028, 224.989),
            Rotation(120, -0, -0),
            optsDefend_and_Sniper_SO
        ),
		restoration:gen_dummytrigger(
            400041,
            "respawn_the_blockade",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsrespawn_shields
        ),
		restoration:gen_missionscript(
            400042,
            "spawn_cloakers",
            spawn_cloakers
        ),
		restoration:gen_dummytrigger(
            400043,
            "manager_death",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optsmanager_has_been_killed
        ),
		restoration:gen_toggleelement(
            400044,
            "enable_dozers",
            enable_bo_dozers_the_sequel
        ),
		restoration:gen_toggleelement(
            400045,
            "disable_dozers",
            disable_bo_dozers
        ),
		restoration:gen_dummy(
            400046,
            "fwb_dozer_3",
            Vector3(7498, -207, -1590.010),
            Rotation(180, 0, -0),
            optsBulldozer_2
        ),
        restoration:gen_dummy(
            400047,
            "fwb_dozer_4",
            Vector3(3874, 2469, -1200.010),
            Rotation(-90, 0, -0),
            optsBulldozer_2
        ),
		restoration:gen_dialogue(
            400048,
            "they_sending_dozers",
            Bain_senddozers
        )
    }
}