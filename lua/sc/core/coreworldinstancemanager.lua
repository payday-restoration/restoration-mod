local standard_spawngroups = {
	["standard"] = {
		--All Blue units
		"CS_defend_a",
		"CS_defend_b",
		"CS_defend_c",
		"CS_cops",
		"CS_stealth_a",
		"CS_swats",
		"CS_heavys",
		"CS_shields",
		"CS_tazers",
		"CS_tanks",
		--All FBI tier units
		"FBI_Booms",
		"FBI_defend_a",
		"FBI_defend_b",
		"FBI_defend_c",
		"FBI_defend_d",
		"FBI_stealth_a",
		"FBI_stealth_a_boom",
		"FBI_stealth_b",
		"FBI_stealth_c",
		"FBI_swats",
		"FBI_heavys",
		"FBI_heavys_boom",
		"FBI_shields",
		"FBI_shields_boom",
		"GREEN_tanks",
		"BLACK_tanks",
		"SKULL_tanks",
		"TIT_tanks",
		--GenSec tier units
		"GS_defend_b",
		"GS_defend_c",
		"GS_defend_d",
		"GS_swats",
		"GS_Heavys",
		"GS_heavys_boom",
		"GS_shields",
		"GS_shields_boom",
		"GS_Booms",
		--Captains
		"Cap_Winters",
		"Cap_Spring",
		"HVH_Boss",
		"Cap_Autumn",
		"Cap_Summers",
		--Cloakers
		--"single_spooc",
		"FBI_spoocs"
	},
	["standard_with_single_spooc"] = {
		--All Blue units
		"CS_defend_a",
		"CS_defend_b",
		"CS_defend_c",
		"CS_cops",
		"CS_stealth_a",
		"CS_swats",
		"CS_heavys",
		"CS_shields",
		"CS_tazers",
		"CS_tanks",
		--All FBI tier units
		"FBI_Booms",
		"FBI_defend_a",
		"FBI_defend_b",
		"FBI_defend_c",
		"FBI_defend_d",
		"FBI_stealth_a",
		"FBI_stealth_a_boom",
		"FBI_stealth_b",
		"FBI_stealth_c",
		"FBI_swats",
		"FBI_heavys",
		"FBI_heavys_boom",
		"FBI_shields",
		"FBI_shields_boom",
		"GREEN_tanks",
		"BLACK_tanks",
		"SKULL_tanks",
		"TIT_tanks",
		--GenSec tier units
		"GS_defend_b",
		"GS_defend_c",
		"GS_defend_d",
		"GS_swats",
		"GS_Heavys",
		"GS_heavys_boom",
		"GS_shields",
		"GS_shields_boom",
		"GS_Booms",
		--Captains
		"Cap_Winters",
		"Cap_Spring",
		"HVH_Boss",
		"Cap_Autumn",
		"Cap_Summers",
		--Cloakers
		"single_spooc",
		"FBI_spoocs"
	},
	["proprietary_pbr"] = {
		"single_spooc",
		"CS_defend_c",
		"FBI_stealth_a",
		"FBI_stealth_a_boom",
		"FBI_defend_a",
		"FBI_stealth_b",
		"FBI_stealth_c",
		"CS_tazers",
		"FBI_Booms",
		"GS_Booms",
		"CS_defend_b",
		"FBI_defend_d",
		"GS_defend_d",
		"CS_defend_a",
		"FBI_defend_c",
		"GS_defend_c",
		"CS_swats",
		"CS_stealth_a",
		"CS_heavys",
		"FBI_defend_b",
		"GS_defend_b",
		"FBI_spoocs",
		"Cap_Winters",
		"Cap_Autumn",
		"Cap_Spring",
		"Cap_Summers",
		"HVH_Boss",
		"FBI_heavys",
		"FBI_heavys_boom",
		"GS_heavys",
		"GS_heavys_boom",
		"FBI_swats",
		"GS_swats"
	}
}

local spawnpoint_delays = {
	["levels/instances/unique/are_elevator/world/world"] = {
		[100013] = {
			interval = 20, -- same as modern
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		}
	},
	["levels/instances/unique/are_ps_double_doors/world/world"] = {
		[100013] = {
			interval = 10, -- same as modern
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		}
	},
	["levels/instances/unique/cane/cane_group_spawner/world/world"] = {
		[100008] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100033] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
	},
	["levels/instances/unique/chew/chew_heli_dropoff/world/world"] = {
		[100011] = {
			interval = 8,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/chew/chew_tall_train/world/world"] = {
		[100088] = {
			interval = 5,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100098] = {
			interval = 50,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/chew/chew_train_car/world/world"] = {
		[100598] = {
			interval = 7,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100599] = {
			interval = 7,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100600] = {
			interval = 7,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/hlm_smoke_suprise/world/world"] = {
		[100013] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100014] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[100015] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100016] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[100017] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[100018] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/holly_2/group_force_spawn/world/world"] = {
		[100008] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		},
		[100033] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/hox_breakout_elevator001/world/world"] = {
		[100013] = {
			interval = 45,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		}
	},
	["levels/instances/unique/hox_estate_heli_spawn/world/world"] = {
		[100012] = {
			interval = 15,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/hox_fbi_ceiling_breach/world/world"] = {
		[100012] = {
			interval = 15,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/kenaz/control_room/world/world"] = {
		[100605] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/kenaz/elevator_openable/world/world"] = {
		[100013] = {
			interval = 2,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/kenaz/security_room/world/world"] = {
		[100062] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard"]
		}
	},
	["levels/instances/unique/pbr/pbr_mountain_surface/world/world"] = {
		[101411] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[101412] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["proprietary_pbr"]
		},
		[101413] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[101414] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["proprietary_pbr"]
		},
		[101415] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["proprietary_pbr"]
		},
		[101418] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		},
		[101504] = {
			interval = 0,
			preferred_spawn_groups = standard_spawngroups["standard_with_single_spooc"]
		}
	}
}

local _get_instance_mission_data_orig = CoreWorldInstanceManager._get_instance_mission_data
function CoreWorldInstanceManager:_get_instance_mission_data(path)
	local result = _get_instance_mission_data_orig(self, path)
	local elements = spawnpoint_delays[path]
	if elements then
		for _, element in ipairs(result.default.elements) do
			if elements[element.id] then
				element.values.interval = elements[element.id].interval
				element.values.preferred_spawn_groups = elements[element.id].preferred_spawn_groups
			end
		end
	end

	return result
end