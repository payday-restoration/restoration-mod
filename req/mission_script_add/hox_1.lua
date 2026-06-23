local pro_job = Global.game_settings and Global.game_settings.one_down 
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local death_wish_above = difficulty >= 7
local prison_guard_1 = "units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1"
local prison_guard_2 = "units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1"
local tank_skull =  ((difficulty >= 8) and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc" or "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc")
local gunner = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
local T_Taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
local cloaker = ((difficulty >= 8)  and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/payday2/characters/ene_spook_1/ene_spook_1")
local chance_sneaky_cloaker_escape = math.random() < 0.4

local opts_lobby_unit_1 = {
	enemy = prison_guard_1,
    enabled = true,
    on_executed = {
        { id = 400007, delay = 0, }, 
    },
}
local opts_lobby_unit_2 = {
	enemy = prison_guard_1,
    enabled = true,
    on_executed = {
        { id = 400008, delay = 0, }, 
    },
}
local opts_lobby_unit_3 = {
	enemy = prison_guard_1,
    enabled = true,
    on_executed = {
        { id = 400009, delay = 0, }, 
    },
}
local opts_lobby_unit_4 = {
	enemy = prison_guard_2,
    enabled = true,
    on_executed = {
        { id = 400010, delay = 0, },
    },
}
local opts_lobby_unit_5 = {
	enemy = prison_guard_1,
    enabled = true,
    on_executed = {
        { id = 400011, delay = 0, }, 
    },
}
local opts_lobby_unit_6 = {
	enemy = prison_guard_2,
    enabled = true,
    on_executed = {
        { id = 400012, delay = 0, }, 
    },
}
local optsDefend_SO = {
	SO_access = {
        "swat",
        "tank",
        "fbi",
        "cop",
    },
	scan = true,
	forced = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_enable_prison_guard_lobby_units = {
    enabled = death_wish_above,
    on_executed = {
        { id = 400001, delay = 0, },
        { id = 400002, delay = 0, },
        { id = 400003, delay = 0, },
        { id = 400004, delay = 0, },
        { id = 400005, delay = 0, },
        { id = 400006, delay = 0, },

    },
}
local escape_garage_esc_unit_1 = {
    enemy = tank_skull,
    enabled = true,
    on_executed = {
        { id = 400018, delay = 0}
    },
}
local escape_garage_esc_unit_2 = {
    enemy = gunnner,
    enabled = true,
    on_executed = {
        { id = 400019, delay = 0},
    },
}
local escape_garage_esc_unit_3 = {
    enemy = T_Taser,
    enabled = true,
    on_executed = {
        { id =  400020, delay = 0},
    },
}
local opts_enable_anti_camping_escape_garage_units = {
    enabled = death_wish_above,
    on_executed = {
        { id = 400014, delay = 0, },
        { id = 400015, delay = 0, },
        { id = 400016, delay = 0, },

    },
}
local optsCloaker_Hide_SO_01 = {
    SO_access = {
        "spooc",
    },
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_hide_under_car_enter"
}
local clk_garage = {
    enemy = cloaker,
    enabled = true,
    on_executed = {
        { id = 400022, delay = 0},
    },
}
local spawn_clk_garage = {
    enabled = ( death_wish_above and chance_sneaky_cloaker_escape),
    on_executed = {
        { id = 400021, delay = 0}, 
    },
}
return {
    elements = {
        -- prison guards  in lobby
        restoration:gen_dummy(400001, "grd_lobby_1", Vector3(-7818, -8809, -2000), Rotation(0, 0, -0), opts_lobby_unit_1),
        restoration:gen_dummy(400002, "grd_lobby_2", Vector3(-7952, -8809, -2000), Rotation(0, 0, -0), opts_lobby_unit_2),
        restoration:gen_dummy(400003, "grd_lobby_3", Vector3(-7818, -8679, -2000), Rotation(0, 0, -0), opts_lobby_unit_3),
        restoration:gen_dummy(400004, "grd_lobby_4", Vector3(-7951, -8686, -2000), Rotation(0, 0, -0), opts_lobby_unit_4),
        restoration:gen_dummy(400005, "grd_lobby_5", Vector3(-7818, -8599, -2000), Rotation(0, 0, -0), opts_lobby_unit_5),
        restoration:gen_dummy(400006, "grd_lobby_6", Vector3(-7935, -8592, -2000), Rotation(0, 0, -0), opts_lobby_unit_6),
        restoration:gen_so(400007, "grd_so_1", Vector3(-7607.35, -7928.38, -2000), Rotation(-146, 0, -0), optsDefend_SO),
        restoration:gen_so(400008, "grd_so_2", Vector3(-7464.75, -7832.2, -2000), Rotation(-146, 0, -0), optsDefend_SO),
        restoration:gen_so(400009, "grd_so_3", Vector3(-7354.07, -7798.55, -2000), Rotation(-177, 0, -0), optsDefend_SO),
        restoration:gen_so(400010, "grd_so_4", Vector3(-7216.26, -7791.33, -1996), Rotation(-177, 0, -0), optsDefend_SO),
        restoration:gen_so(400011, "grd_so_5", Vector3(-7300, -7500, -2000), Rotation(-180, 0, -0), optsDefend_SO),
        restoration:gen_so(400012, "grd_so_6", Vector3(-6900, -7600, -2000), Rotation(135, 0, -0), optsDefend_SO),
        restoration:gen_missionscript(400013, "rdy_teams_lobby", opts_enable_prison_guard_lobby_units),
        
        -- Garage escape anti camping zone because FUUCCKK YOUUUU
        restoration:gen_dummy(4000014, "skully", Vector3(13216, 3284.02, -2800), Rotation(91, -0, -0), escape_garage_esc_unit_1),
        restoration:gen_dummy(400015, "shotty_like_a_melody", Vector3(13214.9, 3344.01, -2800), Rotation(91, -0, -0), escape_garage_esc_unit_2),
        restoration:gen_dummy(400016, "slow_down_buddy", Vector3(13217.4, 3203.04, -2800), Rotation(91, -0, -0), escape_garage_esc_unit_3),
        restoration:gen_missionscript(4000017, "anti_esc_camping_zone", opts_enable_anti_camping_escape_garage_units),
        restoration:gen_so(400018, "anti_camp_so_1", Vector3(12638, 3871.28, -2800), Rotation(14, -0, -0), optsDefend_SO),
        restoration:gen_so(400019, "anti_camp_so_2", Vector3(12742.8, 3897.41, -2800), Rotation(14, -0, -0), optsDefend_SO),
        restoration:gen_so(400020, "anti_camp_so_3", Vector3(12539, 3846.61, -2800), Rotation(14, -0, -0), optsDefend_SO),

        -- :)
        restoration:gen_dummy(400021, "clomker", Vector3(12607, 3245, -2800), Rotation(0, 0, -0), clk_garage),
        restoration:gen_so(400022, "hide_car", Vector3(11594, 5065.06, -2800), Rotation(-96, 0, -0), optsCloaker_Hide_SO_01),
        restoration:gen_missionscript(400023, "spawn_chance_clk", spawn_clk_garage),
    },
}