local security_guard_1 = "units/payday2/characters/ene_security_1/ene_security_1"
local security_guard_2 = "units/payday2/characters/ene_security_2/ene_security_2"
local security_guard_3 = "units/payday2/characters/ene_security_3/ene_security_3"
local security_table = {security_guard_1, security_guard_1, security_guard_2, security_guard_2, security_guard_3}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local diff_scaling_1 = 0.125 * difficulty
local diff_scaling_2 = 0.065 * difficulty
local shield = "units/payday2/characters/ene_shield_2/ene_shield_2"
local sniper = "units/payday2/characters/ene_sniper_1/ene_sniper_1"
local tank = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
local taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1"
local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local swat_shotgunner = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
local security = security_table
local hard_above = difficulty >= 3
local very_hard_above = difficulty >= 4
local overkill_above = difficulty >= 5
local death_wish_above = difficulty >= 7
local death_sentence = difficulty == 8
local enabled_chance_more_guards = math.random() < diff_scaling_2
local enabled_chance_shields = math.random() < diff_scaling_2
local enabled_chance_cloakers = math.random() < diff_scaling_1
local enabled_chance_dozers_exitvault = math.random() < diff_scaling_2
local enabled_chance_dozers_ambush_escape = math.random() < 0.5
local surprise_tank_chance = math.random() < 0.5

local optsSecurity = {
    enemy_table = security,
    enabled = (hard_above and enabled_chance_more_guards)
}
local optsShield_1 = {
    enemy = shield,
    on_executed = { { id = 100696, delay = 0 } },
	participate_to_group_ai = true,
    enabled = true
}
local optsShield_2 = {
    enemy = shield,
    on_executed = { { id = 100695, delay = 0 } },
	participate_to_group_ai = true,
    enabled = true
}
local optsSniper_1 = {
	enemy = sniper,
	on_executed = { { id = 103091, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_2 = {
	enemy = sniper,
	on_executed = { { id = 103090, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_3 = {
	enemy = sniper,
	on_executed = { { id = 103117, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_4 = {
	enemy = sniper,
	on_executed = { { id = 400033, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_5 = {
	enemy = sniper,
	on_executed = { { id = 400034, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_6 = {
	enemy = sniper,
	on_executed = { { id = 400009, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = death_wish_above
}
local optsBulldozer_193 = {
    enemy = tank,
	on_executed = { 
		{ id = 400023, delay = 3 },
		{ id = 400052, delay = 0 },
	},
    enabled = death_sentence
}
local optsBulldozer_special = {
    enemy = tank,
	on_executed = {
		{ id = 400052, delay = 0 }
	},
    enabled = (death_wish_above and pro_job and enabled_chance_dozers_exitvault)
}
local optsCloaker_rush_1 = {
    enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_clk_jump_dwn_5m_heli_l",
	on_executed = { 
		{ id = 400051, delay = 0 }
	},
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsCloaker_rush_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_repel_into_window",
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsBulldozer_BO = {
    enemy = tank,
	on_executed = { 
		{ id = 400023, delay = 3 },
		{ id = 400052, delay = 0 }
	},
    enabled = true
}
local optsTaser = {
    enemy = taser,
    enabled = true
}
local optsTaser_special = {
    enemy = taser,
	participate_to_group_ai = true,
	spawn_action = "e_sp_down_12m",
	on_executed = { 
		{ id = 400050, delay = 0 }
	},
    enabled = true
}
local optsDozerAmbush = {
    enemy = tank,
	participate_to_group_ai = true,
	spawn_action = "e_sp_down_10m_swing_in_var2",
	on_executed = {
		{ id = 400052, delay = 0 }
	},
    enabled = true
}
local optsDozerAmbush_2 = {
    enemy = tank,
	participate_to_group_ai = true,
	spawn_action = "e_sp_clk_3_5m_dwn_vent",
    enabled = (death_sentence and surprise_tank_chance)
}
local optsShield_Defend_1 = {
    enemy = shield,
    on_executed = { { id = 400040, delay = 0 } },
	participate_to_group_ai = true,
    enabled = overkill_above
}
local optsShield_Defend_2 = {
    enemy = shield,
    on_executed = { { id = 400039, delay = 0 } },
	participate_to_group_ai = true,
    enabled = overkill_above
}
local optsSWAT_Heavy = {
    enemy = swat_shotgunner,
    enabled = true
}
local optsBulldozer_SO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsSniper_SO = {
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
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
local enable_shields = {
	enabled = enabled_chance_shields,
	elements = { 
		400001,
		400002
	}
}
local disable_shields = {
	enabled = true,
	toggle = "off",
	elements = { 
		400001,
		400002
	}
}
local disable_OverdrillPONR = {
	enabled = pro_job,
	toggle = "off",
	elements = { 
		400048
	}
}
local enable_OverdrillPONR = {
	enabled = pro_job,
	elements = { 
		400048
	}
}
local disable_RegularPONR = {
	enabled = pro_job,
	toggle = "off",
	elements = { 
		400047
	}
}
local disable_thetank = {
	enabled = true,
	toggle = "off",
	elements = { 
		400055
	}
}
local enable_thetank = {
	enabled = true,
	elements = { 
		400055
	}
}
local optsRegularPONR = {
	time_normal = 420,
	time_hard = 420,
	time_overkill = 420,
	time_overkill_145 = 420,
	time_easy_wish = 540,
    time_overkill_290 = 540,
	time_sm_wish = 540,
	enabled = pro_job
}
local optsOverdrillPONR = {
	time_normal = 1800,
	time_hard = 1800,
	time_overkill = 1800,
	time_overkill_145 = 1800,
	time_easy_wish = 1800,
    time_overkill_290 = 1800,
	time_sm_wish = 1800,
	enabled = pro_job
}
local Bain_sendtasers = {
	dialogue = "Play_ban_s01_b",
	can_not_be_muted = true
}
local Bain_senddozers = {
	dialogue = "Play_ban_s02_b",
	can_not_be_muted = true
}
local Bain_sendcloakers = {
	dialogue = "Play_ban_s04",
	can_not_be_muted = true
}
local optsBlackTankAmbushFilter = {
	difficulty_sm_wish = true,
	player_3 = true,
	player_4 = true,
	enabled = enabled_chance_dozers_ambush_escape,
	on_executed = { 
		{ id = 400035, delay = 1, delay_rand = 1 },
		{ id = 400036, delay = 1, delay_rand = 1 }
	}
}
local spawn_the_surprise_tank = {
	enabled = true,
	on_executed = { 
		{ id = 400054, delay = 0 }
	}
}

return {
    elements = {
        --Lobby Shields
        restoration:gen_dummy(
            400001,
            "shield_lobby_wall_1",
            Vector3(-3123, -3103, -24.998),
            Rotation(0, 0, -0),
            optsShield_1
        ),
        restoration:gen_dummy(
            400002,
            "shield_lobby_wall_2",
            Vector3(-3190, -3098, -24.998),
            Rotation(0, 0, -0),
            optsShield_2
        ),
		--Lobby Snipers
		restoration:gen_dummy(
            400003,
            "sniper_lobby_1",
            Vector3(677, 57, 475.020),
            Rotation(90, -0, -0),
            optsSniper_1
        ),
		restoration:gen_dummy(
            400004,
            "sniper_lobby_2",
            Vector3(677, 12, 475.020),
            Rotation(90, -0, -0),
            optsSniper_2
        ),
		restoration:gen_dummy(
            400005,
            "sniper_lobby_3",
            Vector3(677, 57, 475.020),
            Rotation(90, -0, -0),
            optsSniper_3
        ),
		restoration:gen_dummy(
            400006,
            "sniper_lobby_4",
            Vector3(677, 12, 475.020),
            Rotation(90, -0, -0),
            optsSniper_4
        ),
		restoration:gen_dummy(
            400007,
            "sniper_lobby_5",
            Vector3(677, 57, 475.020),
            Rotation(90, -0, -0),
            optsSniper_5
        ),
		restoration:gen_dummy(
            400008,
            "sniper_lobby_6",
            Vector3(677, 12, 475.020),
            Rotation(90, -0, -0),
            optsSniper_6
        ),
		restoration:gen_so(
            400009,
            "special_sniper_so_1",
            Vector3(90, -1882, 475),
            Rotation(90, -0, -0),
            optsSniper_SO
        ),
		--Damn bank guards! Are we done with them, yet?
		restoration:gen_dummy(
            400010,
            "guard_blockade_1",
            Vector3(1887, 1002, -24.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400011,
            "guard_blockade_2",
            Vector3(1887, 1493, -24.895),
            Rotation(90, 0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400012,
            "guard_blockade_3",
            Vector3(2276, 1493, -24.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400013,
            "guard_blockade_4",
            Vector3(2276, 998, -24.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400014,
            "guard_blockade_5",
            Vector3(2797, 1243, -24.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400015,
            "guard_blockade_6",
            Vector3(3447, 1794, -14.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400016,
            "guard_blockade_7",
            Vector3(3447, 704, -14.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400017,
            "guard_blockade_8",
            Vector3(5959, 704, -21.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400018,
            "guard_blockade_9",
            Vector3(5959, 1810, -21.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		restoration:gen_dummy(
            400019,
            "guard_blockade_10",
            Vector3(6650, 1249, -21.895),
            Rotation(90, -0, -0),
            optsSecurity
        ),
		--2 dozers spawn after killing Bo The Manager+2 extra dozers on DS (even if you did not killed Bo)
		restoration:gen_dummy(
            400020,
            "ai_spawn_enemy_Bo's_bulldozer_2",
            Vector3(-2682, -3588, -125),
            Rotation(90, -0, -0),
            optsBulldozer_BO
        ),
		restoration:gen_dummy(
            400021,
            "extra_tank_1",
            Vector3(-3176, 3750, -125),
            Rotation(90, -0, -0),
            optsBulldozer_193
        ),
		restoration:gen_dummy(
            400022,
            "extra_tank_2",
            Vector3(-2657, -3569, -125),
            Rotation(90, -0, -0),
            optsBulldozer_193
        ),
		restoration:gen_so(
            400023,
            "dozer_cloaker_hunt_so",
            Vector3(-2657, -3569, -90),
            Rotation(90, -0, -0),
            optsBulldozer_SO
        ),
		--two PJ dozers when leaving the vault
		restoration:gen_dummy(
            400024,
            "projob_tank_exit_vault_1",
            Vector3(3359, 1790, -15),
            Rotation(-90, 0, -0),
            optsBulldozer_special
        ),
		restoration:gen_dummy(
            400025,
            "projob_tank_exit_vault_2",
            Vector3(3359, 713, -15),
            Rotation(-90, 0, -0),
            optsBulldozer_special
        ),
		--145+ throwback, 3 tasers+1 heavy swat in staircase escape
		restoration:gen_dummy(
            400026,
            "taser_escape_1",
            Vector3(6050, -2351, -135.691),
            Rotation(0, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400027,
            "taser_escape_2",
            Vector3(5887, -2347, -135.691),
            Rotation(0, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400028,
            "taser_escape_3",
            Vector3(5553, -2367, -135.691),
            Rotation(-90, 0, -0),
            optsTaser
        ),
		restoration:gen_dummy(
            400029,
            "swat_escape_1",
            Vector3(5553, -2502, -135.691),
            Rotation(-90, 0, -0),
            optsSWAT_Heavy
        ),
		--3 cloakers coming down the vent+elevator
		restoration:gen_dummy(
            400030,
            "cloaker_rush_1",
            Vector3(483, 352, 475.020),
            Rotation(0, 0, -0),
            optsCloaker_rush_1
        ),
		restoration:gen_dummy(
            400031,
            "cloaker_rush_2",
            Vector3(677, 57, 475.020),
            Rotation(90, -0, -0),
            optsCloaker_rush_2
        ),
		restoration:gen_dummy(
            400032,
            "cloaker_rush_3",
            Vector3(677, 12, 475.020),
            Rotation(90, -0, -0),
            optsCloaker_rush_2
        ),
		restoration:gen_so(
            400033,
            "special_sniper_so_2",
            Vector3(-1175, -1375, 475),
            Rotation(0, 0, 0),
            optsSniper_SO
        ),
		restoration:gen_so(
            400034,
            "special_sniper_so_3",
            Vector3(-1000, -1375, 475),
            Rotation(0, 0, 0),
            optsSniper_SO
        ),
		restoration:gen_dummy(
            400035,
            "dozer_ambush_elevator_1",
            Vector3(5879, -3035, 464.309),
            Rotation(90, -0, -0),
            optsDozerAmbush
        ),
		restoration:gen_dummy(
            400036,
            "dozer_ambush_elevator_2",
            Vector3(5879, -3252, 464.309),
            Rotation(90, -0, -0),
            optsDozerAmbush
        ),
		restoration:gen_dummy(
            400037,
            "taser_special_1",
            Vector3(-777, -1616, 475),
            Rotation(0, 0, -0),
            optsTaser_special
        ),
		restoration:gen_dummy(
            400038,
            "taser_special_2",
            Vector3(-861, -1616, 475),
            Rotation(0, 0, -0),
            optsTaser_special
        ),
		restoration:gen_so(
            400039,
            "shield_defend_so_1",
            Vector3(3307, 700, -15),
            Rotation(90, -0, -0),
            optsShieldDefend_SO
        ),
		restoration:gen_so(
            400040,
            "shield_defend_so_2",
            Vector3(3307, 1800, -15),
            Rotation(90, -0, -0),
            optsShieldDefend_SO
        ),
		restoration:gen_dummy(
            400041,
            "shield_defend_1",
            Vector3(3963, 1836, -42.895),
            Rotation(90, -0, -0),
            optsShield_Defend_1
        ),
        restoration:gen_dummy(
            400042,
            "shield_defend_2",
            Vector3(3959, 721, -43.895),
            Rotation(90, -0, -0),
            optsShield_Defend_2
        ),
		restoration:gen_toggleelement(
            400043,
            "enable_lobby_shields",
            enable_shields
        ),
		restoration:gen_toggleelement(
            400044,
            "disable_lobby_shields",
            disable_shields
        ),
		restoration:gen_toggleelement(
            400045,
            "enable_OverdrillPONR",
            enable_OverdrillPONR
        ),
		restoration:gen_toggleelement(
            400046,
            "disable_RegularPONR",
            disable_RegularPONR
        ),
		restoration:gen_pointofnoreturn(
            400047,
            "Regular_PONR",
            Vector3(-2657, -3569, -90),
            Rotation(90, -0, -0),
            optsRegularPONR
        ),
		restoration:gen_pointofnoreturn(
            400048,
            "Overdrill_PONR",
            Vector3(-2657, -3569, -90),
            Rotation(90, -0, -0),
            optsOverdrillPONR
        ),
		restoration:gen_toggleelement(
            400049,
            "disable_OverdrillPONR",
            disable_OverdrillPONR
        ),
		restoration:gen_dialogue(
            400050,
            "they_sending_tasers",
            Bain_sendtasers
        ),
		restoration:gen_dialogue(
            400051,
            "they_sending_cloakers",
            Bain_sendcloakers
        ),
		restoration:gen_dialogue(
            400052,
            "they_sending_dozers",
            Bain_senddozers
        ),
		restoration:gen_dynamicfilter(
            400053,
            "black_tank_elevator_ambush_for_3_and_above_players",
			Vector3(-2657, -3569, -90),
            Rotation(90, -0, -0),
            optsBlackTankAmbushFilter
        ),
		restoration:gen_dummy(
            400054,
            "surprise_tank",
            Vector3(4657, -1100, -735.693),
            Rotation(-180, 0, -0),
            optsDozerAmbush_2
        ),
		restoration:gen_missionscript(
            400055,
            "spawn_the_surprise_tank",
            spawn_the_surprise_tank
        ),
		restoration:gen_toggleelement(
            400056,
            "enable_the_surpise_tank",
            enable_thetank
        ),
		restoration:gen_toggleelement(
            400057,
            "disable_the_surpise_tank",
            disable_thetank
        )
    }
}