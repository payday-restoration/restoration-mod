local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8 and pro_job) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local shields = ((difficulty >= 8 and pro_job)    and "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city" or "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield")
local death_wish_above = difficulty >= 7

local optsBulldozer = {
    spawn_action = "e_sp_armored_truck_3rd",
    enabled = false,
    enemy = tank_skull,
    on_executed = {
        {id = 400002, delay = 0, },
    },
}
local optsDefend_SO = {
	SO_access = tostring (2048 + 4096),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_enable_dozer = {
	enabled = (death_wish_above and pro_job),
	elements = { 400001, },
	toggle = "on",
}
local optsShield_01 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400004,  delay = 0, },
	},
}
local optsShield_02 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400005,  delay = 0, },
	},
}
local optsShield_03 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400006,  delay = 0, },
	},
}
local optsShield_04 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400013,  delay = 0, },
	},
}
local opts_enabale_shields = {
	enabled = {death_wish_above and pro_job},
	elements = { 400004, 400005, 400006, 400007 },
	toggle = "on",
}
return  {
    elements = {
        -- Skulldozer by the gate (i love dozer wih the sniper SO!!!)
		restoration:gen_dummy(400001, "boat_gate_dozer_1", Vector3(-8700, 3500, 2.500), Rotation(0, 0, -0), optsBulldozer),
		restoration:gen_so(400002, "dozer_defend_so_1", Vector3(-8800, 4200, 2.500), Rotation(-97, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400003, "enable_dozer", opts_enable_dozer),
		-- Shield blockade after the gate opens (happens during the ship was moving as well, same when the dozer is activated)
		restoration:gen_dummy(400004, "boat_blockade_01", Vector3(-7300, 11200, 2.500), Rotation(180, 0, -0), optsShield_01),
		restoration:gen_dummy(400005, "boat_blockade_02", Vector3(-7100, 11200, 2.500), Rotation(179, 0, -0), optsShield_02),
		restoration:gen_dummy(400006, "boat_blockade_03", Vector3(-6900, 11200, 2.500), Rotation(180, 0, -0), optsShield_03),
		restoration:gen_dummy(400007, "boat_blockade_03", Vector3(-6700, 11200, 2.500), Rotation(-180, 0, -0), optsShield_04),
		restoration:gen_so(400008, "shield_defend_so_1", Vector3(-7200, 7500, 2.500), Rotation( 95, -0, -0), optsDefend_SO),
		restoration:gen_so(400009, "shield_defend_so_2", Vector3(-7200, 7600, 2.500), Rotation( 96, -0, -0), optsDefend_SO),
		restoration:gen_so(400010, "shield_defend_so_3", Vector3(-7200, 7400, 2.500), Rotation( 85, -0, -0), optsDefend_SO),
		restoration:gen_so(400011, "shield_defend_so_4", Vector3(-7208.716, 7300.380 , 2.500), Rotation( 85, -0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400012, "enable_shields", opts_enabale_shields),
    },
}