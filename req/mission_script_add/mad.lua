local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local shields =  ((difficulty >= 8 and pro_job) and "units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield")
local sniper = ((difficulty >= 8 and pro_job) and "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper" or "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3")
local death_wish_above = difficulty >= 7

local optsDefend_SO = {
	SO_access = tostring (2048 + 512),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local optsSniper_01 = {
    enemy = sniper,
    enabled = false,
    on_executed = {
		{id = 400001, delay = 0,},
	},
}
local optsSniper_02 = {
    enemy = sniper,
    enabled = false,
    on_executed = {
		{id = 400002, delay = 0,},
	},
}
local optsShield_01 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400004,  delay = 0, },
	},
}
local optsShield_02 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400005,  delay = 0, },
	},
}
local optsShield_03 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400006,  delay = 0, },
	},
}
local optsShield_04 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400007,  delay = 0, },
	},
}
local optsShield_05 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400008,  delay = 0, }, -- self note (and you future mission scripter), these numbers on almost all the "false" locals are SO ids.
	},
}
local optsShield_06 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400009,  delay = 0, },
	},
}
local opts_enabale_shields = {
	enabled = death_wish_above and pro_job,
	elements = {400011, 400012 , 400013, 400014, 400015, 400016 }, -- put enemy dummy ids here
	toggle = "on",
}
local opts_enabale_snipers = {
	enabled = death_wish_above and pro_job,
	elements = {400017, 400018 },
	toggle = "on",
}

return {
	elements = {
		-- Addtional enemmy defenses once you picked up the server (as if two dozers by the fence door isn't enough)
		-- More shield blockades (on all exit points of the factory)
		restoration:gen_dummy(400011, "factory_exit_blockade_01", Vector3(4847, 3153.897 , 0), Rotation(0, 0, -0), optsShield_01),
		restoration:gen_dummy(400012, "factory_exit_blockade_02", Vector3(4706.487, 3152.418 ,0), Rotation(0, 0, -0), optsShield_02),
		restoration:gen_dummy(400013, "factory_exit_blockade_03", Vector3(4564.857, 3152.706 , 0 ), Rotation(0, 0, -0), optsShield_03),
		restoration:gen_dummy(400014, "factory_exit_blockade_04", Vector3(4160.235, 1860.318, 400), Rotation(99, 0, -0), optsShield_04),
		restoration:gen_dummy(400015, "factory_exit_blockade_05", Vector3(4163.343, 1705.922 , 400 ), Rotation(99, 0, -0), optsShield_05),
		restoration:gen_dummy(400016, "factory_exit_blockade_06", Vector3(5025.856,  2735.531, 400), Rotation(4, 0, -0), optsShield_06),
		restoration:gen_so(400004, "shield_defend_so_1", Vector3(4844.976, 3174.149, 0), Rotation( 0, -0, -0), optsDefend_SO),
		restoration:gen_so(400005, "shield_defend_so_2", Vector3( 4702.804 , 3173.313 , 0), Rotation(0, -0, -0), optsDefend_SO),
		restoration:gen_so(400006, "shield_defend_so_3", Vector3(4564.873, 3176.482 ,0), Rotation(0, -0, -0), optsDefend_SO),
		restoration:gen_so(400007, "shield_defend_so_4", Vector3(3922.61, 1832.43, 400), Rotation( 91, -0, -0), optsDefend_SO),
		restoration:gen_so(400008, "shield_defend_so_5", Vector3(3927.5, 1709.71, 400), Rotation(90 , -0, -0), optsDefend_SO),
		restoration:gen_so(400009, "shield_defend_so_6", Vector3(5028.75, 2903.36, 400), Rotation(-2 , -0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400010, "enable_shields", opts_enabale_shields),
		-- Some Snipers 
		restoration:gen_so(400001, "sniper_defend_so_1", Vector3(3262.032, 3805.700 ,400), Rotation(147 , -0, -0), optsDefend_SO),
		restoration:gen_so(400002, "sniper_defend_so_2", Vector3(3484.377, 2954.574, 800 ), Rotation(91 , -0, -0), optsDefend_SO),
		restoration:gen_dummy(400017, "sniper_exit_blockade_01", Vector3(3904.702, 3782.157 ,400 ), Rotation(86, 0, -0), optsSniper_01),
		restoration:gen_dummy(400018, "sniper_exit_blockade_02", Vector3(3598.874, 2965.011 ,800 ), Rotation(100, 0, -0), optsSniper_02),
		restoration:gen_toggleelement(400020, "enabale_snipers", opts_enabale_snipers),

	},
}