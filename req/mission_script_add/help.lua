local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local death_wish_above = difficulty >= 7
local tank_skull =  ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer" or "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3")
local shields = ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec")
local cloaker = ((difficulty >= 8) and "units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1")
local sans = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"

local optsDefend_SO = {
	SO_access = {
        "tank",
        "shield",
		"swat", 
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
local optsCloaker_Hide_SO = {
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
local skeleton_defense_escape_defense_1 = {
	enemy = sans,
	enabled = true,
	on_executed = { { id = 400015 , delay = 0, } },
}
local skeleton_defense_escape_defense_2 = {
	enemy = sans,
	enabled = true,
	on_executed = { { id = 400017 , delay = 0, } },
}
local skeleton_defense_escape_defense_3 = {
	enemy = sans,
	enabled = true,
	on_executed = { { id = 400019 , delay = 0, } },
}
local skeleton_defense_escape_defense_4 = {
	enemy = sans,
	enabled = true,
	on_executed = { { id = 400022 , delay = 0, } },
}
local skeleton_defense_escape_defense_5 = {
	enemy = sans,
	enabled = true,
	on_executed = { { id = 400024 , delay = 0, } },
}
local skully_defense_escape = {
	enemy = tank_skull,
	enabled = true,
	on_executed = { { id = 400026 , delay = 0, } },
}
local spook_escape_01 = {
	enemy = cloaker,
	enabled = true,
	spawn_action = "e_sp_clk_up_manhole",
	on_executed = {  {  id = 400028, delay = 0, } },
}
local spook_escape_02 = {
	enemy = cloaker,
	enabled = true,
	spawn_action = "e_sp_clk_up_manhole",
	on_executed = {  {  id = 400030, delay = 0, } },
}
local spawn_escape_defenders = {
	enabled = death_wish_above, 
	on_executed = {
		{ id = 400014, delay = 0, },
		{ id = 400016, delay = 0, },
		{ id = 400018, delay = 0, },
		{ id = 400021, delay = 0, },
		{ id = 400023, delay = 0, },
		{ id = 400025, delay = 0, },
		{ id = 400027, delay = 0, },
		{ id = 400029, delay = 0, },

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
		restoration:gen_so(400006, "spook_hide", Vector3(-5352, -6230, 374.11), Rotation(0, 0, -0), optsCloaker_Hide_SO), 

		-- Shields
		restoration:gen_dummy(400007, "stair_blocker_01", Vector3(-4502, -6440, 364.026), Rotation(-93, 0, -0), optsShield_blocker_01),
		restoration:gen_dummy(400008, "stair_blocker_02", Vector3(-4490, -6312, 363.204), Rotation(-93, 0, -0), optsShield_blocker_02),
		restoration:gen_dummy(400009, "stair_blocker_03", Vector3(-4473, -6184, 363.768), Rotation(-98, 0, -0), optsShield_blocker_03), 
		restoration:gen_so(400010, "shield_so_1", Vector3(-4502, -6440, 364.026), Rotation(-93, 0, -0), optsDefend_SO),
		restoration:gen_so(400011, "shield_so_2", Vector3(-4490, -6312, 363.204), Rotation(-93, 0, -0), optsDefend_SO),
		restoration:gen_so(400012, "shield_so_3", Vector3(-4473, -6184, 363.768), Rotation(-98, 0, -0), optsDefend_SO),

		-- the mission script (ziplien)
		restoration:gen_missionscript(400013, "zipline_defend", spawn_zipline_defenders),

		-- The NecroCloaker really doesn't want you to leave..
		-- Megalovania starts playing 
		restoration:gen_dummy(400014, "sans_01", Vector3(-2920, 11205, 1760.23), Rotation(178, 0, -0), skeleton_defense_escape_defense_1),
		restoration:gen_so(400015, "escape_defend_01", Vector3(-2920, 11205, 1760.23), Rotation(178, 0, -0), optsDefend_SO),
		restoration:gen_dummy(400016, "sans_02", Vector3(-2767.88, 11205.7, 1760.23), Rotation(178, 0, -0), skeleton_defense_escape_defense_2),
		restoration:gen_so(400017, "escape_defend_02", Vector3(-2767.88, 11205.7, 1760.23), Rotation(178, 0, -0), optsDefend_SO),
		restoration:gen_dummy(400018, "sans_03", Vector3(-2586.99, 11199.4, 1775.23), Rotation(178, 0, -0), skeleton_defense_escape_defense_3),
		restoration:gen_so(400019, "escape_defend_03", Vector3(-2586.99, 11199.4, 1775.23), Rotation(178, 0, -0), optsDefend_SO),
		restoration:gen_dummy(400021, "sans_04", Vector3(-2430.58, 11323, 1775.23), Rotation(178, 0, -0), skeleton_defense_escape_defense_4),
		restoration:gen_so(400022, "escape_defend_04", Vector3(-2430.58, 11323, 1775.23), Rotation(178, 0, -0), optsDefend_SO),
		restoration:gen_dummy(400023, "sans_05", Vector3(-2197.72, 11314.9, 1775.23), Rotation(178, 0, -0), skeleton_defense_escape_defense_5),
		restoration:gen_so(400024, "escape_defend_05", Vector3(-2197.72, 11314.9, 1775.23), Rotation(178, 0, -0), optsDefend_SO),
		-- skully 
		restoration:gen_dummy(400025, "skully_blocker", Vector3(-2612.91, 11435.9, 1773.91), Rotation(-175, 0, -0), skully_defense_escape),
		restoration:gen_so(400026, "skully_defend", Vector3(-2612.91, 11435.9, 1773.91), Rotation(-175, 0, -0), optsDefend_SO),
		-- Cloakers 
		restoration:gen_dummy(400027, "spook_2", Vector3(-2768, 10070, 1763.21), Rotation(-90, 0, -0), spook_escape_01),
		restoration:gen_so(400028, "spook_so_2", Vector3(-2678, 10088, 1772.45) , Rotation(-91, 0, -0), optsCloaker_Hide_SO),
		restoration:gen_dummy(400029, "spoook_3", Vector3(-2083, 11483, 1760.23),  Rotation(95, -0, -0), spook_escape_02),
		restoration:gen_so(400030, "spook_so_3", Vector3(-2315, 11344, 1767.41), Rotation(87, -0, -0), optsCloaker_Hide_SO),
		-- the mission script (escape)
		restoration:gen_missionscript(400031, "escape_defend", spawn_escape_defenders),
	},
}