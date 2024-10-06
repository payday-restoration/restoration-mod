local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local shield = ((difficulty >= 6 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc" or difficulty == 7 and "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield" or difficulty == 6 or difficulty == 5 and "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc") or "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
local sniper = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper" or difficulty == 7 and "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3" or difficulty == 6 or difficulty == 5 and "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc") or "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc"
local mayhem_above = difficulty >= 6
local death_sentence = difficulty == 8
local enabled_chance_snipers = math.random() < 0.6

local optsShield_nearlootpickup_1 = {
    enemy = shield,
    on_executed = { { id = 400011, delay = 0 } },
    enabled = true
}
local optsShield_nearlootpickup_2 = {
    enemy = shield,
    on_executed = { { id = 400012, delay = 0 } },
    enabled = true
}
local optsShield_nearlootpickup_3 = {
    enemy = shield,
    on_executed = { { id = 400017, delay = 0 } },
    enabled = true
}
local optsShield_nearlootpickup_4 = {
    enemy = shield,
    on_executed = { { id = 400018, delay = 0 } },
    enabled = true
}
local optsSniper_nearlootpickup_1 = {
	enemy = sniper,
	on_executed = { { id = 400010, delay = 0 } },
    enabled = true
}
local optsSniper_nearlootpickup_2 = {
	enemy = sniper,
	on_executed = { { id = 400016, delay = 0 } },
    enabled = true
}
local optsSniper_Ambush_1 = {
	enemy = sniper,
	on_executed = { { id = 400004, delay = 0 } },
    enabled = true
}
local optsSniper_Ambush_2 = {
	enemy = sniper,
	on_executed = { { id = 400005, delay = 0 } },
    enabled = true
}
local optsSniper_Ambush_3 = {
	enemy = sniper,
	on_executed = { { id = 400006, delay = 0 } },
    enabled = true
}
local optsSniper_Ambush_4 = {
	enemy = sniper,
	on_executed = { { id = 400024, delay = 0 } },
    enabled = death_sentence
}
local optsSniper_Ambush_5 = {
	enemy = sniper,
	on_executed = { { id = 400025, delay = 0 } },
    enabled = death_sentence
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	path_stance = "cbt",
	interval = 2,
    so_action = "AI_sniper"
}
local optsShieldDefend_SO = {
	SO_access = "2048",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
    so_action = "AI_sniper"
}
local spawn_AmbushSnipers = {
	enabled = (mayhem_above and enabled_chance_snipers),
	on_executed = { 
		{ id = 400001, delay = 0 },
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 }
	}
}
local spawn_Squadblockade_1 = {
	enabled = mayhem_above,
	on_executed = { 
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
		{ id = 400009, delay = 0 }
	}
}
local spawn_Squadblockade_2 = {
	enabled = mayhem_above,
	on_executed = { 
		{ id = 400013, delay = 0 },
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 }
	}
}

return {
    elements = {
        --Ambush Snipers
		restoration:gen_dummy(
            400001,
            "sniper_ambush_1",
            Vector3(-2624, 78, -19.814),
            Rotation(-90, 0, -0),
            optsSniper_Ambush_1
        ),
		restoration:gen_dummy(
            400002,
            "sniper_ambush_2",
            Vector3(-1715, 604, -19.814),
            Rotation(-90, 0, -0),
            optsSniper_Ambush_2
        ),
		restoration:gen_dummy(
            400003,
            "sniper_ambush_3",
            Vector3(-1699, -46, -20.814),
            Rotation(-90, 0, -0),
            optsSniper_Ambush_3
        ),
		restoration:gen_so(
            400004,
            "sniper_ambush_so_1",
            Vector3(-2624, 78, -19.814),
            Rotation(-90, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400005,
            "sniper_ambush_so_2",
            Vector3(-1715, 604, -19.814),
            Rotation(-90, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400006,
            "sniper_ambush_so_3",
            Vector3(-1699, -46, -20.814),
            Rotation(-90, 0, -0),
            optsSniper_SO
        ),
		--Not so fast. We knew where le pickup van is gonna arrive so we blocked the way
		restoration:gen_dummy(
            400007,
            "sniper_defend_1",
            Vector3(-3800, 2872, 800),
            Rotation(-180, 0, -0),
            optsSniper_nearlootpickup_1
        ),
		restoration:gen_dummy(
            400008,
            "shield_defend_1",
            Vector3(-3881, 2872, 800),
            Rotation(-180, 0, -0),
            optsShield_nearlootpickup_1
        ),
		restoration:gen_dummy(
            400009,
            "shield_defend_2",
            Vector3(-3727, 2872, 800),
            Rotation(-180, 0, -0),
            optsShield_nearlootpickup_2
        ),
		restoration:gen_so(
            400010,
            "sniper_defend_so_1",
            Vector3(-3804, 2296, 814.006),
            Rotation(-90, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400011,
            "shield_defend_so_1",
            Vector3(-3727, 2257, 814.006),
            Rotation(-90, 0, -0),
            optsShieldDefend_SO
        ),
		restoration:gen_so(
            400012,
            "shield_defend_so_2",
            Vector3(-3721, 2344, 814.006),
            Rotation(-90, 0, -0),
            optsShieldDefend_SO
        ),
		restoration:gen_dummy(
            400013,
            "sniper_defend_2",
            Vector3(195, -2927, 800),
            Rotation(0, 0, -0),
            optsSniper_nearlootpickup_2
        ),
		restoration:gen_dummy(
            400014,
            "shield_defend_3",
            Vector3(122, -2930, 800),
            Rotation(0, 0, -0),
            optsShield_nearlootpickup_3
        ),
		restoration:gen_dummy(
            400015,
            "shield_defend_4",
            Vector3(272, -2929, 800),
            Rotation(0, 0, -0),
            optsShield_nearlootpickup_4
        ),
		restoration:gen_so(
            400016,
            "sniper_defend_so_2",
            Vector3(-893, -2991, 800.006),
            Rotation(0, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400017,
            "shield_defend_so_3",
            Vector3(-870, -2925, 800.006),
            Rotation(0, 0, -0),
            optsShieldDefend_SO
        ),
		restoration:gen_so(
            400018,
            "shield_defend_so_4",
            Vector3(-946, -2925, 800.006),
            Rotation(0, 0, -0),
            optsShieldDefend_SO
        ),
		--Mission Scripts
		restoration:gen_missionscript(
            400019,
            "spawn_ambush_snipers",
            spawn_AmbushSnipers
        ),
		restoration:gen_missionscript(
            400020,
            "spawn_the_squad_blockade_1",
            spawn_Squadblockade_1
        ),
		restoration:gen_missionscript(
            400021,
            "spawn_the_squad_blockade_2",
            spawn_Squadblockade_2
        ),
		--2 additional ambush snipers for death sentence
 		restoration:gen_dummy(
            400022,
            "sniper_ambush_4",
            Vector3(-2710, 1259, 814.006),
            Rotation(-115, 0, -0),
            optsSniper_Ambush_4
        ),
		restoration:gen_dummy(
            400023,
            "sniper_ambush_5",
            Vector3(-3405, -2681, 862.098),
            Rotation(-50, 0, -0),
            optsSniper_Ambush_5
        ),
		restoration:gen_so(
            400024,
            "sniper_ambush_so_4",
            Vector3(-2710, 1259, 814.006),
            Rotation(-115, 0, -0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400025,
            "sniper_ambush_so_5",
            Vector3(-3405, -2681, 862.098),
            Rotation(-50, 0, -0),
            optsSniper_SO
        )
    }
}