Hooks:PostHook(PrePlanningTweakData,"init","init_blue",function(self)

	self:_create_locations(tweak_data)

	self.types.bw_van_escape = {
		name_id = "menu_pp_van_escape_name",
		desc_id = "menu_pp_van_escape_desc",
		plan = "escape_plan",
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 23,
		total = 1,
		cost = 0,
		budget_cost = 0
	}
	self.types.bw_boat_escape = {
		name_id = "menu_pp_boat_escape_name",
		desc_id = "menu_pp_boat_escape_desc",
		plan = "escape_plan",
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 94,
		total = 1,
		cost = 0,
		budget_cost = 8
	}
	self.types.bw_train_escape = {
		name_id = "menu_pp_train_escape_name",
		desc_id = "menu_pp_train_escape_desc",
		plan = "escape_plan",
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 23,
		total = 1,
		cost = 0,
		budget_cost = 3
	}
	self.types.bw_helicopter_escape = {
		name_id = "menu_pp_helicopter_escape_name",
		desc_id = "menu_pp_helicopter_escape_desc",
		plan = "escape_plan",
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 73,
		total = 1,
		cost = 0,
		budget_cost = 3	
	}
	self.types.bw_stealth_default = {
		name_id = "menu_pp_stealth_default_name",
		desc_id = "menu_pp_stealth_default_desc",
		plan = "entry_plan",
		category = "entry_plan",
		post_event = "preplan_17",
		pos_not_important = true,
		prio = 1,
		icon = 94,
		total = 1,
		cost = 0,
		budget_cost = 0
	}
	self.types.bw_loud_default = {
		name_id = "menu_pp_loud_default_name",
		desc_id = "menu_pp_loud_default_desc",
		plan = "entry_plan",
		category = "entry_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 95,
		total = 1,
		cost = 0,
		budget_cost = 14
	}
	self.types.bw_lancebag_free = {
		name_id = "menu_pp_lancebag_free",
		desc_id = "menu_pp_lancebag_free_desc",
		plan = "vault_plan",
		category = "vault_plan",
		post_event = "preplan_17",
		icon = 12,
		total = 1,
		cost = 0,
		budget_cost = 0,
		pos_not_important = true,
		prio = 5
	}
	self.types.bw_lancebag_cost = {
		name_id = "menu_pp_lancebag_cost",
		desc_id = "menu_pp_lancebag_cost_desc",
		plan = "vault_plan",
		category = "vault_plan",
		icon = 12,
		total = 1,
		cost = 0,
		budget_cost = 3,
		post_event = "preplan_17",
		prio = 5
	}
	self.types.bw_zipline = {
		name_id = "menu_pp_zipline_name",
		desc_id = "menu_pp_zipline_desc",
		category = "mission_equipment",
		pos_not_important = true,
		icon = 62,
		total = 1,
		cost = 0,
		budget_cost = 3,
		post_event = "preplan_17",
		prio = 5
	}
	self.types.bw_dumpster = {
		name_id = "menu_pp_dumpster_name",
		desc_id = "menu_pp_dumpster_desc",
		category = "hired_help",
		icon = 34,
		total = 1,
		cost = 0,
		budget_cost = 2,
		total = 2,
		post_event = "preplan_17",
		prio = 5
	}
	self.types.bw_manifest = {
		name_id = "menu_pp_manifest_name",
		desc_id = "menu_pp_manifest_desc",
		category = "data_hacking",
		pos_not_important = true,
		icon = 71,
		total = 1,
		cost = 0,
		budget_cost = 1,
		post_event = "preplan_17",
		prio = 5
	}
	self.types.bw_timelock_shorter1 = {
		name_id = "menu_pp_timelock_shorter1_name",
		desc_id = "menu_pp_timelock_shorter1_desc",
		category = "data_hacking",
		pos_not_important = true,
		icon = 15,
		total = 1,
		cost = 0,
		budget_cost = 2,
		post_event = "preplan_17",
		prio = 5
	}
	self.types.bw_timelock_shorter2 = {
		name_id = "menu_pp_timelock_shorter2_name",
		desc_id = "menu_pp_timelock_shorter2_desc",
		category = "data_hacking",
		pos_not_important = true,
		icon = 93,
		total = 1,
		cost = 0,
		budget_cost = 4,
		post_event = "preplan_17",
		prio = 5
	}
	
end)

Hooks:PostHook(PrePlanningTweakData,"_create_locations","_create_locations_blue",function(self)

	self.locations.bluewave = {
		{
			--LOCATION A
			name_id = "menu_pp_blue_loc_a",
			texture = "units/pd2_mod_blue/guis/preplanning/pp_blu_01",
			x1 = -8000,
			x2 = 8000,
			y1 = -1600,
			y2 = 14400,
			rotation = 0,
			map_width = 1.1,
			map_height = 1.1,
			map_x = 0,
			map_y = 0,
			custom_points = {
				{
					text_id = "menu_pp_info_kenaz_reception",
					rotation = -90,
					y = 1181,
					to_upper = true,
					icon = 45,
					x = 544,
					post_event = "Play_pln_ca1_140"
				}
			}
		},
		{
			--LOCATION B
			name_id = "menu_pp_blue_loc_b",
			texture = "units/pd2_mod_blue/guis/preplanning/pp_blu_02",
			x1 = -8000,
			x2 = 8000,
			y1 = -1600,
			y2 = 14400,
			rotation = 0,
			map_x = 0.85,
			map_y = 0.3,
			map_width = 0.5,
			map_height = 0.5
		},
		{
			--LOCATION C
			name_id = "menu_pp_blue_loc_c",
			texture = "units/pd2_mod_blue/guis/preplanning/pp_blu_03",
			x1 = -8000,
			x2 = 8000,
			y1 = -1600,
			y2 = 14400,
			rotation = 0,
			map_x = 0.85,
			map_y = -0.3,
			map_width = 0.5,
			map_height = 0.5
		},
		mission_briefing_texture = "units/pd2_mod_blue/guis/preplanning/pp_blu_01",
		total_budget = 14,
		default_plans = {
			vault_plan = "bw_lancebag_free",
			entry_plan = "bw_stealth_default",
			escape_plan = "bw_van_escape"
		},
		start_location = {
			group = "a",
			zoom = 1,
			x = 2049,
			y = 3072
		}
	}
	
end)