local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local get_hiding_cloaker_so_opts = restoration.get_hiding_cloaker_so_opts

local optsBesiegeDummyCloaker_1 = { -- (beseiege stuff)
	trigger_times = 0,
	enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_climb_over_2m",
	enabled = true,
}
local optsBesiegeDummyCloaker_2 = { -- (beseiege stuff)
	trigger_times = 0,
	enemy = cloaker,
	participate_to_group_ai = true,
	enabled = true,
}
local optsPreferedCloakerAdd = {
	spawn_groups = { 400016, 400017, 400018 , 400019 , 400020 , 400021  , 400022}, -- spawngroup 
	on_executed = {
		{ id = 400024, delay = 0 }, -- so group 
	},
	enabled = true,
}
local optsAddCloakerHideGroup = { -- needed for mission script 
	enabled = true,
	on_executed = {
		{ id = 400023, delay = 0 }, -- preferedadd 
	},
}
local optsCloakerHideGroup = { -- hide SOs
	followup_elements = {
		400001,
		400002,
		400003,
		400004,
		400005,
		400006,
		400007,
	},
}
-- Sneaky bastards
local hide_so_search_pos = Vector3(1189, -1632, -300)
local optsCloaker_Hide_SpotSO_1 = get_hiding_cloaker_so_opts("e_so_sneak_wait_stand", hide_so_search_pos)
local optsCloaker_Hide_SpotSO_2 = get_hiding_cloaker_so_opts("e_so_hide_behind_door_enter", hide_so_search_pos)
local optsCloaker_Hide_SpotSO_3 = get_hiding_cloaker_so_opts("e_so_sneak_wait_crh_var3", hide_so_search_pos)
local optsCloaker_Hide_SpotSO_4 = get_hiding_cloaker_so_opts("e_so_hide_under_car_enter", hide_so_search_pos)

return {
	elements = {
		-- Cloaker hiders
		-- hiders 
		restoration:gen_so(400001, "cloaker_so_1", Vector3(-1526, 770, 1000), Rotation(98, -0, -0),  optsCloaker_Hide_SpotSO_4),
		restoration:gen_so(400002, "claoker_so_2", Vector3(-683, 1217, 1000), Rotation(137, 0, -0),  optsCloaker_Hide_SpotSO_4),
		restoration:gen_so(400003, "cloaker_so_3", Vector3(2300.4, -1338.28, 400), Rotation(76, -0, -0), optsCloaker_Hide_SpotSO_3),

		restoration:gen_so(400004, "cloaker_so_4",  Vector3(-634.587, 2215.35, 400), Rotation(-145, 0, -0), optsCloaker_Hide_SpotSO_2),
		restoration:gen_so(400005, "cloaker_so_5",  Vector3(-1387, -2291, 0), Rotation(-89, 0, -0), optsCloaker_Hide_SpotSO_2),
		restoration:gen_so(400006, "cloaker_so_6", Vector3(-2324.56, -1219.02, 0), Rotation(-176, 0, -0),  optsCloaker_Hide_SpotSO_1),
        restoration:gen_so(400007, "cloaker_so_7", Vector3(552.545, 2434.98, 1000), Rotation(134, 0, -0), optsCloaker_Hide_SpotSO_3),
		-- the spooks themselves
		restoration:gen_dummy(400009, "spook_01", Vector3(-2185, -311, 1000), Rotation(0, 0, -0),  optsBesiegeDummyCloaker_1),
		restoration:gen_dummy(400010, "spook_02", Vector3(-1880.79, 1163.1, 1100), Rotation(176, 0, -0), optsBesiegeDummyCloaker_1),

		restoration:gen_dummy(400011, "spook_03", Vector3(1697, -1951, 1475), Rotation(84, -0, -0),  optsBesiegeDummyCloaker_2),
		restoration:gen_dummy(400012, "spook_04", Vector3(-638, -2260, 1556.21), Rotation(-88, 0, -0), optsBesiegeDummyCloaker_2),
		
		restoration:gen_dummy(400013, "spook_05", Vector3(1088, -3835, 3.5), Rotation(87, -0, -0),  optsBesiegeDummyCloaker_2),
		restoration:gen_dummy(400014, "spook_06",  Vector3(-508, -3989, 3.5), Rotation(-96, 0, -0), optsBesiegeDummyCloaker_2),
		restoration:gen_dummy(400015, "spook_07",  Vector3(-3896, -659, 4.5), Rotation(10, -0, -0), optsBesiegeDummyCloaker_2),
		-- spawwngroups 
		restoration:gen_spawngroup(400016, "moon_spook_spawngroup_01", {400009}, 0), -- ones in yellow are dummies 
		restoration:gen_spawngroup(400017, "moon_spook_spawngroup_02", {400010}, 0),

		restoration:gen_spawngroup(400018, "moon_spook_spawngroup_03", {400011}, 0),
		restoration:gen_spawngroup(400019, "moon_spook_spawngroup_04", {400012}, 0),

		restoration:gen_spawngroup(400020, "moon_spook_spawngroup_05", {400013}, 0),
		restoration:gen_spawngroup(400021, "moon_spook_spawngroup_06", {400014}, 0),
		restoration:gen_spawngroup(400022, "moon_spook_spawngroup_07", {400015}, 0),
		-- the hider system 
		restoration:gen_preferedadd(400023, "moon_spook_spawns", optsPreferedCloakerAdd),
		restoration:gen_sogroup(400024, "moon_spook_spawngroup", hide_so_search_pos, Rotation(0, 0, 0), optsCloakerHideGroup),
		restoration:gen_missionscript(400025, "moon_spook_spawn_global", optsAddCloakerHideGroup),
	},
}