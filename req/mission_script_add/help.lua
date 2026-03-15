local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local death_wish_above = difficulty >= 7
local tank_skull =  ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer" or "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3")
local shields = ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec")
local cloaker = ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1")

local optsDefend_SO = {
	SO_access = {
        "tank",
        "shield",
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
local optsCloaker_Hide_SO_zipline = {
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
    so_action = "e_so_sneak_wait_crh_var3",
}
local optsDozer_zipline_guard_01 = {
	enemy = tank_skull,
	on_executed = { { id = 400003, delay = 0 } },
	enabled = true,
}
local optsDozer_zipline_guard_02 = {
	enemy = tank_skull,
	on_executed = { { id = 400004, delay = 0 } },
	enabled = true,
}
local optsCloaker_zipline = {
	spawn_action = "e_sp_uno_jump_in",
	enemy = cloaker,
	on_executed = { { id = 400006, delay = 0 } },
	enabled = true,
}
local optsShield_blocker_01 = {
	enemy = shields,
	on_executed = { { id = 400010, delay = 0 } },
	enabled = true,
}
local optsShield_blocker_02 = {
	enemy = shields,
	on_executed = { { id = 400011, delay = 0 } },
	enabled = true,
}
local optsShield_blocker_03 = {
	enemy = shields,
	on_executed = { { id = 400012, delay = 0 } },
	enabled = true,
}
local spawn_zipline_defenders = {
	enabled = death_wish_above, 
	on_executed = {
		{ id = 400001, delay = 0, },
		{ id = 400002, delay = 0, },
		{ id = 400005, delay = 0, },
		{ id = 400007, delay = 0, },
		{ id = 400008, delay = 0, },
		{ id = 400009, delay = 0, },

	},
}
return {
	elements = {
		-- Zombies defendding the zipline area to slow down the heisters 
		-- SO stuff and dummies 
		-- Dozers 
		restoration:gen_dummy(400001, "zipline_guard_01", Vector3(-5233.89, -5295.38, 410), Rotation(-169, 0, -0), optsDozer_zipline_guard_01),
		restoration:gen_dummy(400002, "zipline_guard_02", Vector3(-5080.02, -5280.46, 393), Rotation(172, 0, -0), optsDozer_zipline_guard_02),
		restoration:gen_so(400003, "zipline_guard_so_01", Vector3(-5037, -5621, 373), Rotation(177, 0, -0), optsDefend_SO),
		restoration:gen_so(400004, "zipline_guard_so_02", Vector3(-5186, -5625, 373.929), Rotation(-178, 0, -0), optsDefend_SO),
		-- Cloaker 
		restoration:gen_dummy(400005, "zipline_spook", Vector3(-5959, -6526, 458.973), Rotation(-112, 0, -0), optsCloaker_zipline),
		restoration:gen_so(400006, "spook_hide", Vector3(-5352, -6230, 374.11), Rotation(0, 0, -0), optsCloaker_Hide_SO_zipline), 
		-- Shields
		restoration:gen_dummy(400007, "stair_blocker_01", Vector3(-4502, -6440, 364.026), Rotation(-93, 0, -0), optsShield_blocker_01),
		restoration:gen_dummy(400008, "stair_blocker_02", Vector3(-4490, -6312, 363.204), Rotation(-93, 0, -0), optsShield_blocker_02),
		restoration:gen_dummy(400009, "stair_blocker_03", Vector3(-4473, -6184, 363.768), Rotation(-98, 0, -0), optsShield_blocker_03), 
		restoration:gen_so(400010, "shield_so_1", Vector3(-4502, -6440, 364.026), Rotation(-93, 0, -0), optsDefend_SO),
		restoration:gen_so(400011, "shield_so_2", Vector3(-4490, -6312, 363.204), Rotation(-93, 0, -0), optsDefend_SO),
		restoration:gen_so(400012, "shield_so_3", Vector3(-4473, -6184, 363.768), Rotation(-98, 0, -0), optsDefend_SO),
		-- the mission script 
		restoration:gen_missionscript(400013, "zipline_defend", spawn_zipline_defenders),
	},
}