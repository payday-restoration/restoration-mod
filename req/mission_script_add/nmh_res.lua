local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull =  ((difficulty >= 8) and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc" or "units/pd2_mod_nypd/characters/ene_bulldozer_3/ene_bulldozer_3")
local green_dozer = ((difficulty >= 8) and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun" or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")
local death_wish_above = difficulty >= 7

local Smoke_bomb = {
	duration = 8
}
local optsDefend_SO = {
	SO_access = {
        "tank"
    },
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}
local optsBulldozer_01 = {
    spawn_action = "e_sp_kick_enter_bulldozer",
    enabled = false,
    enemy = tank_skull,
    on_executed = {
        { id = 400003, delay = 0}
    },
}
local optsBulldozer_02 = {
    spawn_action = "e_sp_kick_enter_bulldozer",
    enabled = false,
    enemy = green_dozer,
    on_executed = {
        { id = 400004, delay = 0}
    },
}
local opts_enable_dozers = {
	enabled = death_wish_above,
	elements = { 400001, 400002 },
	toggle = "on",
}
return {
    elements = {
        -- Nasty elevator surprise
        restoration:gen_dummy(400001, "access", Vector3(-2191, 2873, 0.382), Rotation(-88, 0, -0),  optsBulldozer_01),
        restoration:gen_dummy(400002, "denied", Vector3(-2187.72, 2779.06, 0.382),Rotation(-88, 0, -0), optsBulldozer_02 ),

        restoration:gen_so(400003, "dozer_blocker_01", Vector3(-2191, 2873, 0.382), Rotation(-88, 0, -0), optsDefend_SO),
        restoration:gen_so(400004, "dozer_blocker_02", Vector3(-2187.72, 2779.06, 0.382), Rotation(-88, 0, -0), optsDefend_SO),

        restoration:gen_toggleelement(400005, "enable_dozers", opts_enable_dozers),
        restoration:gen_smokeandnades(400006, "smoker", Vector3(-2209, 2823, 0.382), Rotation(0, 0, -0), Smoke_bomb)

    },
}