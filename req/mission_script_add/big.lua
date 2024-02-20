local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun") or "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
local cloaker = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/payday2/characters/ene_spook_1/ene_spook_1"
local rouge = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
local pro_job = Global.game_settings and Global.game_settings.one_down
local overkill_above = difficulty >= 5
local death_sentence = difficulty == 8
local diff_scaling = 0.065 * difficulty
local diff_scaling_2 = 0.085 * difficulty
local enabled_chance_cloakers = math.random() < diff_scaling
local enabled_chance_cloakers_2 = math.random() < diff_scaling_2

if pro_job and difficulty == 8 then
	cloaker = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
end	

local optsBulldozer = {
    enemy = tank,
    on_executed = { { id = 400003, delay = 0 } },
    enabled = overkill_above
}
local optsCloaker_1 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400009, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400010, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_3 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400011, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsCloaker_4 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400012, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers_2)
}
local optsCloaker_5 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400013, delay = 0 } },
    enabled = (overkill_above and enabled_chance_cloakers)
}
local optsTitanCloaker_1 = {
	enemy = rouge,
	participate_to_group_ai = true,
	on_executed = { { id = 400016, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsTitanCloaker_2 = {
	enemy = rouge,
	participate_to_group_ai = true,
	on_executed = { { id = 400017, delay = 0 } },
    enabled = (death_sentence and pro_job)
}
local optsBulldozer_SO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interval = 2,
    so_action = "e_so_sneak_wait_crh"
}
local optsCloaker_Hide_SO_2 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interval = 2,
    so_action = "e_so_sneak_wait_stand"
}

return {
    elements = {
        -- Bulldozers that spawn after cops arrive (20 seconds after)
        restoration:gen_dummy(
            400001,
            "fwb_dozer_1",
            Vector3(3960, 2480, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer
        ),
        restoration:gen_dummy(
            400002,
            "fwb_dozer_2",
            Vector3(3911, 2473, -1200),
            Rotation(-90, -0, -0),
            optsBulldozer
        ),
        restoration:gen_so(
            400003,
            "dozer_hunt_so",
            Vector3(3600, 2473, -1200),
            Rotation(0, 0, 0),
            optsBulldozer_SO
        ),
		--Cloakers, spawn as ambush in vault hallway (similiar to First World Bank)
		restoration:gen_dummy(
            400004,
            "cloaker_1",
            Vector3(-2864, 746, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_1
        ),
		restoration:gen_dummy(
            400005,
            "cloaker_2",
            Vector3(-2864, -1449, -599),
            Rotation(0, 0, -0),
            optsCloaker_2
        ),
		restoration:gen_dummy(
            400006,
            "cloaker_3",
            Vector3(-2098, 416, -998),
            Rotation(-177, 0, -0),
            optsCloaker_3
        ),
		restoration:gen_dummy(
            400007,
            "cloaker_4",
            Vector3(-2135.105, 1124.028, -998),
            Rotation(90, -0, -0),
            optsCloaker_4
        ),
		restoration:gen_dummy(
            400008,
            "cloaker_5",
            Vector3(-2690, 1478, -599),
            Rotation(-180, -0, -0),
            optsCloaker_5
        ),
		restoration:gen_so(
            400009,
            "cloaker_hide_so_1",
            Vector3(-2830, 375, -1000),
            Rotation(-180, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400010,
            "cloaker_hide_so_2",
            Vector3(-2854, -1158, -597),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        ),
		restoration:gen_so(
            400011,
            "cloaker_hide_so_3",
            Vector3(-2104.004, 52.529, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400012,
            "cloaker_hide_so_4",
            Vector3(-2858.536, 1231.877, -1000),
            Rotation(89, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400013,
            "cloaker_hide_so_5",
            Vector3(-2475, 1258, -599),
            Rotation(-180, 0, 0),
            optsCloaker_Hide_SO_1
        ),
		--C4 spawns (Pro Job only)
		restoration:gen_dummy(
            400014,
            "rouge_c4_1",
            Vector3(-4649, 1877, -599),
            Rotation(-90, -0, -0),
            optsTitanCloaker_1
        ),
		restoration:gen_dummy(
            400015,
            "rouge_c4_2",
            Vector3(-6634, 1349, -599),
            Rotation(-0, 0, -0),
            optsTitanCloaker_2
        ),
		restoration:gen_so(
            400016,
            "rouge_hide_so_1",
            Vector3(-4253.838, 1914.332, -598),
            Rotation(90, -0, -0),
            optsCloaker_Hide_SO_2
        ),
		restoration:gen_so(
            400017,
            "rouge_hide_so_2",
            Vector3(-6642, 1505, -599),
            Rotation(0, 0, -0),
            optsCloaker_Hide_SO_1
        )
    }
}