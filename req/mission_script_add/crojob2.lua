local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3" or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
local shields = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city")
local gunners = ((difficulty >= 8)  and "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky" or "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle")
local death_wish_above = difficulty >= 7

local optsBulldozer = {
    spawn_action = "e_sp_armored_truck_3rd",
    enabled = false,
    enemy = tank_skull,
    on_executed = {
        {id = 400002, delay = 0, },
    },
}
local opts_gunner_1 = {
	spawn_action = "e_sp_armored_truck_3rd",
	enemy = gunners,
	enabled = false,
	on_executed = {
		{id =  400014, delay = 0,},
	},
}
local opts_gunner_2 = {
	spawn_action = "e_sp_armored_truck_3rd",
	enemy = gunners,
	enabled = false,
	on_executed = {
		{id = 400015, delay = 0,},
	},
}
local optsDefend_SO = {
	SO_access = {
        "tank",
        "shield",
        "swat",
    },
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
}
local optsShield_01 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400008,  delay = 0, },
	},
}
local optsShield_02 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400009,  delay = 0, },
	},
}
local optsShield_03 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400010,  delay = 0, },
	},
}
local optsShield_04 = {
	spawn_action = "e_sp_clk_up_manhole",
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400011,  delay = 0, },
	},
}
local opts_enabale_ship_defense = {
	enabled = death_wish_above,
	elements = {  400001 , 400004 , 400005, 400006, 400007, 400012, 400013},
	toggle = "on",
}
return  {
    elements = {
        -- Skulldozer by the gate (i love dozer wih the sniper SO!!!)
		restoration:gen_dummy(400001, "ship_gate_dozer_1", Vector3(-8680, 3500, 2.5), Rotation(0, 0, -0), optsBulldozer),
		restoration:gen_so(400002, "dozer_defend_so_1", Vector3(-8800, 4200, 2.500), Rotation(-97, 0, -0), optsDefend_SO),

		restoration:gen_toggleelement(400003, "ship_defense", opts_enabale_ship_defense),
		-- Shield blockade after the gate opens (happens during the ship was moving as well, same when the dozer is activated)
		restoration:gen_dummy(400004, "ship_blockade_01", Vector3(-7300, 11200, 2.500), Rotation(180, 0, -0), optsShield_01),
		restoration:gen_dummy(400005, "ship_blockade_02", Vector3(-7100, 11200, 2.500), Rotation(179, 0, -0), optsShield_02),
		restoration:gen_dummy(400006, "ship_blockade_03", Vector3(-6900, 11200, 2.500), Rotation(180, 0, -0), optsShield_03),
		restoration:gen_dummy(400007, "ship_blockade_04", Vector3(-6700, 11200, 2.500), Rotation(-180, 0, -0), optsShield_04),

		restoration:gen_so(400008, "shield_defend_so_1", Vector3(-7200, 7500, 2.500), Rotation( 95, -0, -0), optsDefend_SO),
		restoration:gen_so(400009, "shield_defend_so_2", Vector3(-7200, 7600, 2.500), Rotation( 96, -0, -0), optsDefend_SO),
		restoration:gen_so(400010, "shield_defend_so_3", Vector3(-7200, 7400, 2.500), Rotation( 85, -0, -0), optsDefend_SO),
		restoration:gen_so(400011, "shield_defend_so_4", Vector3(-7208.716, 7300.380 , 2.500), Rotation( 85, -0, -0), optsDefend_SO),
		-- Murky/OMNIA gunners with the dozer
		restoration:gen_dummy(400012,"ship_gate_gunner_1", Vector3(-8602, 3500, 2.5), Rotation(0, 0, -0), opts_gunner_1),
		restoration:gen_dummy(400013,"ship_gate_gunner_2", Vector3(-8768, 3500, 2.5), Rotation(0, 0, -0), opts_gunner_2),

		restoration:gen_so(400014,"gunner_defend_so_1", Vector3(-8811.09, 4109.68, 2.5), Rotation(-97, 0, -0), optsDefend_SO),
		restoration:gen_so(400015,"gunner_defend_so_2", Vector3(-8790.01, 4281.39, 2.5), Rotation(-97, 0, -0), optsDefend_SO),
    },
}