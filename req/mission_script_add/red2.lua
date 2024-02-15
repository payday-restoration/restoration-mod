local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
local sniper = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local tank_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
local taser = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc") or "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"
local swat_shotgunner = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"
local security_1 = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
local security_2 = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
local security_3 = "units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
local pro_job = Global.game_settings and Global.game_settings.one_down
local diff_scaling = 0.125 * difficulty
local hard_above = difficulty >= 3
local very_hard_above = difficulty >= 4
local death_wish_above = difficulty >= 7
local death_sentence = difficulty == 8
local enabled_chance_more_guards = math.random() < diff_scaling
local enabled_chance_shields = math.random() < diff_scaling
local enabled_chance_cloakers = math.random() < diff_scaling

	if difficulty == 7 then
		security_1 = "units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"
		security_2 = "units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
		security_3 = "units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3"
	elseif difficulty == 8 then
		security_1 = "units/payday2/characters/ene_city_guard_1/ene_city_guard_1"
		security_2 = "units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
		security_3 = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
	end
	
	if difficulty == 5 or difficulty == 6 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"
		sniper = "units/pd2_mod_nypd/characters/ene_sniper_2/ene_sniper_2"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
	elseif difficulty == 7 then
		shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
		sniper = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"
		swat_shotgunner = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
	elseif difficulty == 8 then
		shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		swat_shotgunner = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end
	
	if pro_job and difficulty >= 5 then
		shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		swat_shotgunner = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
	end

local optsSecurity_1 = {
    enemy = security_1,
	participate_to_group_ai = true,
    enabled = (very_hard_above and enabled_chance_more_guards)
}
local optsSecurity_2 = {
    enemy = security_2,
	participate_to_group_ai = true,
    enabled = (very_hard_above and enabled_chance_more_guards)
}
local optsSecurity_3 = {
    enemy = security_3,
	participate_to_group_ai = true,
    enabled = (very_hard_above and enabled_chance_more_guards)
}
local optsShield_1 = {
    enemy = shield,
    on_executed = { { id = 100696, delay = 0 } },
	participate_to_group_ai = true,
    enabled = enabled_chance_shields
}
local optsShield_2 = {
    enemy = shield,
    on_executed = { { id = 100695, delay = 0 } },
	participate_to_group_ai = true,
    enabled = enabled_chance_shields
}
local optsSniper_1 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 103091, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_2 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 103090, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_3 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 103117, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_4 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 103127, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_5 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 103124, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = very_hard_above
}
local optsSniper_6 = {
	enemy = sniper,
	participate_to_group_ai = true,
	on_executed = { { id = 400009, delay = 3 } },
	spawn_action = "e_sp_repel_into_window",
    enabled = death_wish_above
}
local optsBulldozer_193 = {
    enemy = tank,
	on_executed = { { id = 400023, delay = 0 } },
    enabled = death_sentence
}
local optsBulldozer_special = {
    enemy = tank_skull,
    enabled = (death_wish_above and pro_job)
}
local optsCloaker_rush_1 = {
    enemy = cloaker,
	participate_to_group_ai = true,
	trigger_times = 3,
	spawn_action = "e_sp_clk_jump_dwn_5m_heli_l",
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsCloaker_rush_2 = {
    enemy = cloaker,
	participate_to_group_ai = true,
	trigger_times = 3,
	spawn_action = "e_sp_repel_into_window",
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsBulldozer_BO = {
    enemy = tank,
	on_executed = { { id = 400023, delay = 0 } },
    enabled = true
}
local optsTaser = {
    enemy = taser,
	participate_to_group_ai = true,
    enabled = true
}
local optsSWAT_Heavy = {
    enemy = swat_shotgunner,
	participate_to_group_ai = true,
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
            optsSecurity_1
        ),
		restoration:gen_dummy(
            400011,
            "guard_blockade_2",
            Vector3(1887, 1493, -24.895),
            Rotation(90, 0, -0),
            optsSecurity_2
        ),
		restoration:gen_dummy(
            400012,
            "guard_blockade_3",
            Vector3(2276, 1493, -24.895),
            Rotation(90, -0, -0),
            optsSecurity_1
        ),
		restoration:gen_dummy(
            400013,
            "guard_blockade_4",
            Vector3(2276, 998, -24.895),
            Rotation(90, -0, -0),
            optsSecurity_2
        ),
		restoration:gen_dummy(
            400014,
            "guard_blockade_5",
            Vector3(2797, 1243, -24.895),
            Rotation(90, -0, -0),
            optsSecurity_1
        ),
		restoration:gen_dummy(
            400015,
            "guard_blockade_6",
            Vector3(3447, 1794, -14.895),
            Rotation(90, -0, -0),
            optsSecurity_1
        ),
		restoration:gen_dummy(
            400016,
            "guard_blockade_7",
            Vector3(3447, 704, -14.895),
            Rotation(90, -0, -0),
            optsSecurity_2
        ),
		restoration:gen_dummy(
            400017,
            "guard_blockade_8",
            Vector3(5959, 704, -21.895),
            Rotation(90, -0, -0),
            optsSecurity_2
        ),
		restoration:gen_dummy(
            400018,
            "guard_blockade_9",
            Vector3(5959, 1810, -21.895),
            Rotation(90, -0, -0),
            optsSecurity_1
        ),
		restoration:gen_dummy(
            400019,
            "guard_blockade_10",
            Vector3(6650, 1249, -21.895),
            Rotation(90, -0, -0),
            optsSecurity_3
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
        )
    }
}