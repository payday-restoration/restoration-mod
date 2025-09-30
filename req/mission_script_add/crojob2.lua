local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = ((difficulty >= 8 and pro_job) and "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3 " or "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")
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
	SO_access = "4096",
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
return  {
    elements = {
        -- Skulldozer by the gate (i love dozer wih the ai SO!!!)
		restoration:gen_dummy(400001, "boat_gate_dozer_1", Vector3(-8700, 3500, 2.500), Rotation(0, 0, -0), optsBulldozer),
		restoration:gen_so(400002, "dozer_defend_so_1", Vector3(-8800, 4200, 2.500), Rotation(-97, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400003, "enable_dozer", opts_enable_dozer),
    },
}