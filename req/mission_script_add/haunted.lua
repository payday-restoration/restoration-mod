local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local cloaker = (difficulty == 8 and "units/pd2_mod_halloween/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc") or "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
local diff_scaling = 0.085 * difficulty
local enabled_chance_cloakers = math.random() < diff_scaling
local hard_above = difficulty >= 3

	if pro_job and difficulty == 8 then
		cloaker = "units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1"
	end
	
local optsCloaker_1 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400041, delay = 0 } },
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsCloaker_2 = {
	enemy = cloaker,
	participate_to_group_ai = true,
	on_executed = { { id = 400042, delay = 0 } },
    enabled = (hard_above and enabled_chance_cloakers)
}
local optsCloaker_Hide_SO = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 2,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_idle_by_container"
}
local optsBesiegeDummy_1 = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_uno_ground"
}
local optsBesiegeDummy_2 = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_uno_wall"
}
local optsBesiegeDummy_3 = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_uno_jump_in"
}
local begin_the_nightmare = {
	enabled = true,
	on_executed = { 
		{ id = 400038, delay = 10 }
	}
}
local nightmare_spawngroups = {
	spawn_groups = {
		400032,
		400033,
		400034,
		400035,
		400036,
		400037
	}
}

return {
    elements = {
		restoration:gen_missionscript(
            400001,
            "hit_it",
            begin_the_nightmare
        ),
		--Spawngroups
		restoration:gen_dummy(
            400002,
            "enemy_dummy_1",
            Vector3(-285, 4518, -398.480),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_1
        ),
		restoration:gen_dummy(
            400003,
            "enemy_dummy_2",
            Vector3(-235, 4518, -398.480),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_1
        ),
		restoration:gen_dummy(
            400004,
            "enemy_dummy_3",
            Vector3(-184, 4518, -398.480),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_1
        ),
		restoration:gen_dummy(
            400005,
            "enemy_dummy_4",
            Vector3(-128, 4518, -398.480),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_1
        ),
		restoration:gen_dummy(
            400006,
            "enemy_dummy_5",
            Vector3(-73, 4518, -398.480),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_1
        ),
		restoration:gen_dummy(
            400007,
            "enemy_dummy_6",
            Vector3(-1655, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400008,
            "enemy_dummy_7",
            Vector3(-1710, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400009,
            "enemy_dummy_8",
            Vector3(-1773, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400010,
            "enemy_dummy_9",
            Vector3(-1827, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400011,
            "enemy_dummy_10",
            Vector3(-1884, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400012,
            "enemy_dummy_11",
            Vector3(68, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400013,
            "enemy_dummy_12",
            Vector3(18, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400014,
            "enemy_dummy_13",
            Vector3(-33, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400015,
            "enemy_dummy_14",
            Vector3(-84, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400016,
            "enemy_dummy_15",
            Vector3(-133, 3283, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400017,
            "enemy_dummy_16",
            Vector3(247, 4032, -398.479),
            Rotation(90, -0, -0),
            optsBesiegeDummy_3
        ),
		restoration:gen_dummy(
            400018,
            "enemy_dummy_17",
            Vector3(247, 3981, -398.479),
            Rotation(90, -0, -0),
            optsBesiegeDummy_3
        ),
		restoration:gen_dummy(
            400019,
            "enemy_dummy_18",
            Vector3(247, 3928, -398.479),
            Rotation(90, -0, -0),
            optsBesiegeDummy_3
        ),
		restoration:gen_dummy(
            400020,
            "enemy_dummy_19",
            Vector3(247, 3871, -398.479),
            Rotation(90, -0, -0),
            optsBesiegeDummy_3
        ),
		restoration:gen_dummy(
            400021,
            "enemy_dummy_20",
            Vector3(247, 3811, -398.479),
            Rotation(90, -0, -0),
            optsBesiegeDummy_3
        ),
		restoration:gen_dummy(
            400022,
            "enemy_dummy_21",
            Vector3(-567, 2756, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400023,
            "enemy_dummy_22",
            Vector3(-620, 2756, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400024,
            "enemy_dummy_23",
            Vector3(-674, 2756, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400025,
            "enemy_dummy_24",
            Vector3(-734, 2756, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400026,
            "enemy_dummy_25",
            Vector3(-800, 2756, -398.479),
            Rotation(0, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400027,
            "enemy_dummy_26",
            Vector3(-2184, 4791, -398.479),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400028,
            "enemy_dummy_27",
            Vector3(-2259, 4791, -398.479),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400029,
            "enemy_dummy_28",
            Vector3(-2330, 4791, -398.479),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400030,
            "enemy_dummy_29",
            Vector3(-2401, 4791, -398.479),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_dummy(
            400031,
            "enemy_dummy_30",
            Vector3(-2467, 4791, -398.479),
            Rotation(-180, 0, -0),
            optsBesiegeDummy_2
        ),
		restoration:gen_spawngroup(
			400032,
			"nightmare_besiege_01",
			{400002, 400003, 400004, 400005, 400006},
			5
		),
		restoration:gen_spawngroup(
			400033,
			"nightmare_besiege_02",
			{400007, 400008, 400009, 4000010, 400011},
			5
		),
		restoration:gen_spawngroup(
			400034,
			"nightmare_besiege_03",
			{400012, 400013, 400014, 400015, 400016},
			5
		),
		restoration:gen_spawngroup(
			400035,
			"nightmare_besiege_04",
			{400017, 400018, 400019, 400020, 400021},
			5
		),
		restoration:gen_spawngroup(
			400036,
			"nightmare_besiege_05",
			{400022, 400023, 400024, 400025, 400026},
			5
		),
		restoration:gen_spawngroup(
			400037,
			"nightmare_besiege_06",
			{400027, 400028, 400029, 400030, 400031},
			30
		),
		restoration:gen_preferedadd(
            400038,
            "start_spawn_the_undead",
            nightmare_spawngroups
        ),
		--Cloakers
		restoration:gen_dummy(
            400039,
            "cloaker_1",
            Vector3(-3148, 3007, 11.173),
            Rotation(180, 0, -0),
            optsCloaker_1
        ),
		restoration:gen_dummy(
            400040,
            "cloaker_2",
            Vector3(-2532, 2288, 0),
            Rotation(90, 0, -0),
            optsCloaker_2
        ),
		restoration:gen_so(
            400041,
            "cloaker_hide_so_1",
            Vector3(-2926, 2824, 0),
            Rotation(-180, 0, -0),
            optsCloaker_Hide_SO
        ),
		restoration:gen_so(
            400042,
            "cloaker_hide_so_2",
            Vector3(-2861, 2358, 0),
            Rotation(90, -0, -0),
            optsCloaker_Hide_SO
        )
    }
}