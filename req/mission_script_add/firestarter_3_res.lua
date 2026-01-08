local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc") or "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local death_wish_above = difficulty >= 7

local optsBulldozer = {
	enabled = false,
	enemy = tank_skull,
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}
local optsDefend_SO = {
	SO_access = "4096",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_enable_dozers = {
	enabled = death_wish_above,
	elements = { 400001, },
	toggle = "on",
}

return  {
    elements = {
        -- Skulldozer nearby the van (based on DW Trailer)
		restoration:gen_dummy(400001, "van_dozer_1", Vector3(-8305, -3511, 0), Rotation(-90, 0, -0), optsBulldozer),
		restoration:gen_so(400002, "dozer_defend_so_1", Vector3(-7273, -2895, -19.999), Rotation(0, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400003, "enable_dozers", opts_enable_dozers),
    },
}