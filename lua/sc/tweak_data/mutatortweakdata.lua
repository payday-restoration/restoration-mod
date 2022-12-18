Hooks:PostHook(MutatorTweakData, "init", "res_mutatorstweakdata", function(self, tweak_data)
	self:init_birthday(tweak_data)
end)

function MutatorTweakData:init_birthday(tweak_data)
	self.birthday = {
		event_track = "its_clown_time",
		special_unit_rules_data = {
			taser = {
				buff_id = 1,
				spawn_rate = 3
			},
			medic = {
				buff_id = 2,
				spawn_rate = 1
			},
			shield = {
				buff_id = 3,
				spawn_rate = 2
			},
			tank = {
				buff_id = 4,
				spawn_rate = 1
			},
			spooc = {
				buff_id = 5,
				spawn_rate = 3
			},
			sniper = {
				buff_id = 6,
				spawn_rate = 1
			},
			custom = {
				buff_id = 3,
				spawn_rate = 2
			}
		},
		buffs = {
			ammo_refresh = {
				buff_id = 1,
				color = Color.white
			},
			health_refresh = {
				buff_id = 2,
				amount = 10,
				color = Color.white
			},
			shield_refresh = {
				buff_id = 3,
				color = Color.white
			},
			god_mode = {
				buff_id = 4,
				duration = 15,
				color = Color.yellow
			},
			double_damage = {
				buff_id = 5,
				duration = 20,
				color = Color.yellow
			},
			inf_ammo = {
				buff_id = 6,
				duration = 15,
				color = Color.yellow
			}
		}
	}
end

function MutatorTweakData:get_birthday_buff_name_from_id(buff_id)
	for buff_name, buff_data in pairs(self.birthday.buffs) do
		if buff_id == buff_data.buff_id then
			return buff_name
		end
	end
	return "buff_name_error"
end

function MutatorTweakData:get_birthday_unit_from_id(buff_id)
	for unit_name, unit_data in pairs(self.birthday.special_unit_rules_data) do
		if buff_id == unit_data.buff_id then
			return unit_name
		end
	end
	return "unit_name_error"
end

function MutatorTweakData:init_piggybank(tweak_data)
	self.piggybank = {
		drop_count = 5,
		normal_kill_points = 1,
		special_kill_points = 2,
		progress_range = 1000,
		pig_levels = {
			{
				range = 200,
				sequre_zone_index = 1,
				piggy_unit_index = 1,
				bag_requirement = 0,
				dialogs = {},
				sequences = {
					grow = "anim_pig_idle"
				}
			},
			{
				range = 200,
				sequre_zone_index = 1,
				piggy_unit_index = 1,
				bag_requirement = 1,
				dialogs = {
					explode = "Play_alm_pda9_12",
					show = "Play_alm_pda9_05"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "anim_pig_idle"
				}
			},
			{
				range = 300,
				sequre_zone_index = 2,
				piggy_unit_index = 2,
				bag_requirement = 10,
				dialogs = {
					explode = "Play_alm_pda9_13",
					show = "Play_alm_pda9_07"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 400,
				sequre_zone_index = 3,
				piggy_unit_index = 3,
				bag_requirement = 20,
				dialogs = {
					explode = "Play_alm_pda9_14",
					show = "Play_alm_pda9_08"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 500,
				sequre_zone_index = 4,
				piggy_unit_index = 4,
				bag_requirement = 40,
				dialogs = {
					explode = "Play_alm_pda9_15",
					show = "Play_alm_pda9_09"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 0,
				piggy_unit_index = 4,
				bag_requirement = 80,
				dialogs = {
					explode = "Play_alm_pda9_16",
					show = "Play_alm_pda9_10"
				},
				sequences = {
					explode = "anim_pig_explode",
					show = "show_eyes"
				}
			}
		},
		level_coordinates = {
			firestarter_1_res = {
				position = Vector3(-848.169, -1484.02, -5.18241),
				rotation = Rotation(-1.16773, 0, 0)
			},
			firestarter_2_res = {
				position = Vector3(-2125.22, 2789.92, -24.3859),
				rotation = Rotation(-89.9757, 0, 0)
			},
			firestarter_3_res = {
				position = Vector3(-403, 4507, 0),
				rotation = Rotation(-180, 0, -0)
			},
			jewelry_store = {
				position = Vector3(-20.6412, 3653.49, 19.8175),
				rotation = Rotation(179.94, 0, -0)
			},
			branchbank = {
				position = Vector3(-3965.54, 3311.53, -5.18584),
				rotation = Rotation(-177.786, 0, -0)
			},
			friend = {
				position = Vector3(5946.33, -2580.53, -706.687),
				rotation = Rotation(180, 0, 0)
			},
			mallcrasher = {
				position = Vector3(910.249, 2821.75, -405.186),
				rotation = Rotation(91.0357, 0, 0)
			},
			four_stores = {
				position = Vector3(2871.21, -3397.01, -0.183399),
				rotation = Rotation(90.0561, 0, 0)
			},
			red2 = {
				position = Vector3(-3453.65, 26.286, -0.182674),
				rotation = Rotation(91.5345, 0, 0)
			},
			pal = {
				position = Vector3(-7405.17, -1171.12, 12.0178),
				rotation = Rotation(-75.7504, 0, 0)
			},
			chas = {
				position = Vector3(-2064.14, 71.772, -25.187),
				rotation = Rotation(89.9898, 0, 0)
			},
			sand = {
				position = Vector3(17287.9, -5197.53, -33.264),
				rotation = Rotation(90.5937, 0, 0)
			},
			chca = {
				position = Vector3(-9286.68, 15719.9, -5.18678),
				rotation = Rotation(-179.139, 0, -0)
			},
			pent = {
				position = Vector3(266.625, -1042.33, 12894.8),
				rotation = Rotation(-176.891, 0, -0)
			},
			ranc = {
				position = Vector3(4668.93, 1418.8, 394.821),
				rotation = Rotation(-90.2844, 0, -0)
			},
			pex = {
				position = Vector3(587.78, -1303.05, -30.0338),
				rotation = Rotation(87.9926, 0, 0)
			},
			roberts_v2 = {
				position = Vector3(1862.43, -341.785, -76.7702),
				rotation = Rotation(122.244, 0, -0)
			},
			rvd1 = {
				position = Vector3(-2175.52, -2698.72, -25.186),
				rotation = Rotation(-86.9155, 0, 0)
			},
			rvd2 = {
				position = Vector3(-26.96, 1537.23, -5.18682),
				rotation = Rotation(-88.8213, 0, 0)
			},
			run_res = {
				position = Vector3(-2829.11, -9281.92, 2044.81),
				rotation = Rotation(173.33, 0, -0)
			},
			mad = {
				position = Vector3(6250.55, 3727.1, 3.74605),
				rotation = Rotation(177.542, 0, -0)
			},
			wwh = {
				position = Vector3(2879.52, -177.076, 1144.81),
				rotation = Rotation(-48.4087, 0, 0)
			},
			sah = {
				position = Vector3(0, 2050, -100),
				rotation = Rotation(180, 0, 0)
			},
			brb = {
				position = Vector3(-2959.35, -2782.98, -22.9985),
				rotation = Rotation(-89.5724, 0, 0)
			},
			crojob2 = {
				position = Vector3(2931.11, 1758.48, -2.65967),
				rotation = Rotation(171.697, 0, -0)
			},
			mus = {
				position = Vector3(-5826.79, 1504.41, -1004.54),
				rotation = Rotation(-160.412, 0, -0)
			},
			big = {
				position = Vector3(4283.11, -362.942, -605.189),
				rotation = Rotation(88.2822, 0, 0)
			},
			hox_3 = {
				position = Vector3(-2993.59, -796.747, -10.7954),
				rotation = Rotation(-9.33604, 0, 0)
			},
			fex = {
				position = Vector3(-11.9599, 3013.34, -2.68673),
				rotation = Rotation(0, 0, 0)
			},
			gallery = {
				position = Vector3(3238.55, -1577.97, -124.998),
				rotation = Rotation(-13.4452, 0, 0)
			},
			jolly = {
				position = Vector3(11228.9, 1337.76, -5.18679),
				rotation = Rotation(-1.50457, 0, 0)
			},
			nightclub = {
				position = Vector3(2425.23, -5667.32, -80.1866),
				rotation = Rotation(87.6614, 0, 0)
			},
			ukrainian_job_res = {
				position = Vector3(-20.6412, 3653.49, 19.8175),
				rotation = Rotation(179.94, 0, -0)
			},			
			mex = {
				position = Vector3(3804.28, -9322.23, -3205.19),
				rotation = Rotation(-165.413, 0, -0)
			},
			des = {
				position = Vector3(-180, -2700, 100),
				rotation = Rotation(0, 0, 0)
			},
			rat = {
				position = Vector3(3329, -713, 872),
				rotation = Rotation(90, -0, -0)
			},
			family = {
				position = Vector3(3821, -2167, -25),
				rotation = Rotation(90, 0, 0)
			},
			chill_combat = {
				position = Vector3(-934, 1149, 0),
				rotation = Rotation(-69, 0, 0)
			},
			arena = {
				position = Vector3(-300, 550, 0),
				rotation = Rotation(0, 0, -0)
			},
			arm_cro = {
				position = Vector3(-2064, 1391, 400),
				rotation = Rotation(180, 0, -0)
			},
			arm_hcm = {
				position = Vector3(2761, 5842, 1425),
				rotation = Rotation(90, 0, 0)
			},
			arm_fac = {
				position = Vector3(-1753, -2004, 210),
				rotation = Rotation(0, 0, -0)
			},
			arm_par = {
				position = Vector3(1023, 500, -400),
				rotation = Rotation(-180, 0, -0)
			},
			arm_for = {
				position = Vector3(2954, 2763, 449),
				rotation = Rotation(-135, 0, -0)
			},
			arm_und = {
				position = Vector3(-5194, -1455, 374),
				rotation = Rotation(-90, 0, -0)
			},
			dah = {
				position = Vector3(-5147, -4493, 449),
				rotation = Rotation(-90, 0, -0)
			},
			glace = {
				position = Vector3(-931, -24726, 5759),
				rotation = Rotation(90, -0, -0)
			},
			flat = {
				position = Vector3(-128, 1097, 1892),
				rotation = Rotation(90, 16, -0)
			},
			dinner = {
				position = Vector3(-17385, 8228, -69),
				rotation = Rotation(120, 0, -0)
			},
			man = {
				position = Vector3(-768, -772, 1708),
				rotation = Rotation(-90, 0, -0)
			},
			cane = {
				position = Vector3(4616, 55, -20),
				rotation = Rotation(90, 0, 0)
			},
			xmn_hox1 = {
				position = Vector3(10185, 7877, -2252),
				rotation = Rotation(-90, 6, -4.26887e-007)
			},
			xmn_hox2 = {
				position = Vector3(-189, 3191, -500),
				rotation = Rotation(0, 0, -0)
			},
			nail = {
				position = Vector3(2039, 834, 6),
				rotation = Rotation(-180, 0, -0)
			},
			help = {
				position = Vector3(428, 600, -100),
				rotation = Rotation(180, 0, -0)
			},
			alex_1_res = {
				position = Vector3(2423, -1421, 875),
				rotation = Rotation(119, 0, 0)
			},
			alex_2_res = {
				position = Vector3(-277, 3728, -600),
				rotation = Rotation(-90, 0, -0)
			},
			alex_3_res = {
				position = Vector3(10179, 24575, 1917),
				rotation = Rotation(-91, 0, -0)
			},
			watchdogs_1 = {
				position = Vector3(-2046, 1566, -20),
				rotation = Rotation(-180, 0, -0)
			},
			watchdogs_2 = {
				position = Vector3(-1042, 3328, 0),
				rotation = Rotation(100, 0, 0)
			},
			wetwork = {
				position = Vector3(937, 1831, 0),
				rotation = Rotation(-180, 0, -0)
			},
			pbr = {
				position = Vector3(-8588, -1147, -900),
				rotation = Rotation(90, 0, 0)
			},
			pbr2 = {
				position = Vector3(-56, 1515, 5),
				rotation = Rotation(143, 0, -0)
			},
			mex_cooking = {
				position = Vector3(3804.28, -9322.23, -3205.19),
				rotation = Rotation(-165.413, 0, -0)
			},
			vit = {
				position = Vector3(-9, 636, 3),
				rotation = Rotation(180, 0, -0)
			},
			moon = {
				position = Vector3(-2974, 248, 1),
				rotation = Rotation(-90, 0, -0)
			},
			pines = {
				position = Vector3(-8032, 11960, 4086),
				rotation = Rotation(-89, 1.06868e-007, 3)
			},
			crojob3 = {
				position = Vector3(7984, -8343, 575),
				rotation = Rotation(0, 0, -0)
			},
			crojob3_night = {
				position = Vector3(7984, -8343, 575),
				rotation = Rotation(0, 0, -0)
			},
			spa = {
				position = Vector3(7791, 3934, 100),
				rotation = Rotation(90, 0, 0)
			},
			kenaz = {
				position = Vector3(-1, -6498, 0),
				rotation = Rotation(-180, 0, -0)
			},
			mia_1 = {
				position = Vector3(1721, 278, -20),
				rotation = Rotation(180, 0, -0)
			},
			mia_2 = {
				position = Vector3(163, -168, -4),
				rotation = Rotation(48, 0, 0)
			},
			hox_1 = {
				position = Vector3(10185, 7877, -2252),
				rotation = Rotation(-90, 6, -4.26887e-007)
			},
			hox_2 = {
				position = Vector3(-189, 3191, -500),
				rotation = Rotation(0, 0, -0)
			},
			welcome_to_the_jungle_1 = {
				position = Vector3(5959, -3502, -17),
				rotation = Rotation(90, 0, 0)
			},
			welcome_to_the_jungle_1_night = {
				position = Vector3(5959, -3502, -17),
				rotation = Rotation(90, 0, 0)
			},
			welcome_to_the_jungle_2 = {
				position = Vector3(-1600, 2900, -2),
				rotation = Rotation(180, 0, -0)
			},
			election_day_1 = {
				position = Vector3(2742, 1120, 272),
				rotation = Rotation(90, 0, 0)
			},
			election_day_2 = {
				position = Vector3(516, -435, 0),
				rotation = Rotation(0, 0, -0)
			},
			election_day_3 = {
				position = Vector3(-434, -2347, 0),
				rotation = Rotation(0, 0, -0)
			},
			election_day_3_skip1 = {
				position = Vector3(-434, -2347, 0),
				rotation = Rotation(0, 0, -0)
			},
			election_day_3_skip2 = {
				position = Vector3(-434, -2347, 0),
				rotation = Rotation(0, 0, -0)
			},
			framing_frame_1 = {
				position = Vector3(3238.55, -1577.97, -124.998),
				rotation = Rotation(-13.4452, 0, 0)
			},
			framing_frame_2 = {
				position = Vector3(5793, 58, -22),
				rotation = Rotation(90, -0, -0)
			},
			framing_frame_3 = {
				position = Vector3(-4107, 1303, 3000),
				rotation = Rotation(0, 0, -0)
			},
			junk = {
				position = Vector3(-678, -1950, 3),
				rotation = Rotation(0, 0, -0)
			},
			peta = {
				position = Vector3(455, 258, 274),
				rotation = Rotation(-90, 0, -0)
			},
			peta2 = {
				position = Vector3(13453, -18628, -11),
				rotation = Rotation(-132, 0, -0)
			},
			shoutout_raid = {
				position = Vector3(-2619, -2508, 975),
				rotation = Rotation(-90, 0, -0)
			},
			bex = {
				position = Vector3(-8, 3144, -13),
				rotation = Rotation(-180, 0, -0)
			},
			trai = {
				position = Vector3(-3042.98, 5799.85, 120.418),
				rotation = Rotation(-90.0341, 0, -0)
			}
		},
		event_jobs_from_level = {}
	}
	local event_levels = table.map_keys(self.piggybank.level_coordinates)

	for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local job_tweak = tweak_data.narrative.jobs[job_id]
		local job_in_event = #job_tweak.chain > 0

		for _, stage in ipairs(job_tweak.chain) do
			if not table.contains(event_levels, stage.level_id) then
				job_in_event = false

				break
			end
		end

		if job_in_event then
			table.insert(self.piggybank.event_jobs_from_level, job_id)
		end
	end

	self.piggybank.rewards = {
		default = 1000,
		overkill = 2000,
		overkill_145 = 2500,
		hard = 1500,
		easy_wish = 3000,
		overkill_290 = 3500,
		sm_wish = 4000,
		normal = 1000
	}
end

function MutatorTweakData:init_cg22(tweak_data)
	self.cg22 = {
		initial_tree_shake_timer = 60,
		tree_shake_timer = 60,
		snowman_spawn_per_bag = 5,
		default_bag_pool = {
			{
				bag_id = "cg22_bag",
				bag_type = "xp",
				amount = 10
			},
			{
				bag_id = "cg22_bag_green",
				bag_type = "money",
				amount = 10
			},
			{
				bag_id = "cg22_bag_yellow",
				bag_type = "continental",
				amount = 10
			}
		},
		bag_value = {
			cg22_bag_green = 45000,
			cg22_bag_yellow = 1,
			cg22_bag = 20000
		},
		bag_multiplier = 0.005,
		diff_reward_multiplier = {
			default = 1,
			overkill = 2,
			overkill_145 = 3,
			hard = 1.5,
			easy_wish = 3.5,
			overkill_290 = 4,
			sm_wish = 5,
			normal = 1
		},
		enemy_buff_values = {
			--Blue, gives cops DR
			cg22_bag = {
				scale = 0.005,
				max_multiplier = 0.9
			},
			--Green, increases cop damage
			cg22_bag_green = {
				scale = 0.01,
				max_multiplier = 1.2
			},
			--Yellow, increases movement speed
			cg22_bag_yellow = {
				scale = 0.01,
				max_multiplier = 1.2
			}
		},
		enemy_buff_exceptions = {
			blue = {
				"snowman_boss"
			},
			green = {
				"snowman_boss"
			},
			yellow = {}
		}
	}

	for k, v in pairs(self.cg22.enemy_buff_exceptions) do
		self.cg22.enemy_buff_exceptions[k] = table.list_to_set(v)
	end

	self.cg22.buffs = {
		cg22_bag = {
			{
				hud_string_id = "hud_buff_birthday_recover_health",
				func_name = "health_refresh",
				amount = 50,
				color = Color.white
			}
		},
		cg22_bag_green = {
			{
				hud_string_id = "hud_buff_birthday_ammo_refresh",
				func_name = "ammo_refresh",
				color = Color.white
			}
		},
		cg22_bag_yellow = {
			{
				max_multiplier = 6.5,
				hud_string_id = "hud_buff_bag_speed_increase",
				func_name = "bag_speed_increase",
				scale = 0.05,
				color = Color.white
			},
			--[[
			Disabled until DMC can unfuck this
			
			{
				hud_string_id = "hud_buff_ammo_types",
				func_name = "ammo_types",
				duration = 30,
				color = Color.white
			}
			]]--
		}
	}
	--[[
	self.cg22.buffs.cg22_bag_yellow[2].ammo_types = {
		"explosive"
	}
	]]--
	self.cg22.voice_line_amount_triggers = {
		spawn_present_enemy_buff = {
			initial = false,
			trigger_amount = 5,
			voice_line_id = "Play_alm_xmas22_08"
		}
	}
	self.cg22.voice_line_timers = {
		reminder_tree = {
			voice_line_id = "Play_alm_xmas22_02",
			timer = 30
		},
		reminder_snowman_weakpoint = {
			voice_line_id = "Play_alm_xmas22_10",
			timer = 30
		}
	}
	self.cg22.vo_find_tree_range = 500
	self.cg22.vo_find_sled_with_carry_range = 500
	self.cg22.sled_level_coordinates = {
		gallery = {
			position = Vector3(2144.28, 1837.37, -105.187),
			rotation = Rotation(219.5849, 0, 0)
		},
		branchbank = {
			position = Vector3(-3965.54, 3311.53, -5.18584),
			rotation = Rotation(-180, 0, -0)
		},
		roberts_v2 = {
			position = Vector3(-2557.15, -2403.91, -86.3682),
			rotation = Rotation(292.4, 0, 0)
		},
		jewelry_store = {
			position = Vector3(1298.31, -2312.71, 19.8131),
			rotation = Rotation(-325.744, 0, -0)
		},
		rvd1 = {
			position = Vector3(557.663, 158.102, -5.18309),
			rotation = Rotation(-212.3105, 0, 0)
		},
		rvd2 = {
			position = Vector3(2084.84, 2340.95, 44.7551),
			rotation = Rotation(-197.3547, 0, 0)
		},
		pal = {
			position = Vector3(-4750, 1225, 21.0132),
			rotation = Rotation(300, 0, -0)
		},
		red2 = {
			position = Vector3(-1537.23, -2278.96, -40.1852),
			rotation = Rotation(0, 0, 0)
		},
		run = {
			position = Vector3(-5670, -11500, 2044.81),
			rotation = Rotation(315, 0, 0)
		},
		mad = {
			position = Vector3(4201.99, 143.822, 3.74604),
			rotation = Rotation(329.113, 0, -0)
		},
		chas = {
			position = Vector3(906.821, 872.57, -5.18711),
			rotation = Rotation(-257.3024, 0, 0)
		},
		sand = {
			position = Vector3(14961.5, -1898.93, -305.123),
			rotation = Rotation(215.4539, 0, 0)
		},
		chca = {
			position = Vector3(-7808.91, 9727.92, -3.94468),
			rotation = Rotation(-226.1201, 0, 0)
		},
		pent = {
			position = Vector3(-1625, -900, 12995.2),
			rotation = Rotation(-135, 0, -0)
		},
		ranc = {
			position = Vector3(8678.89, 3753.26, 394.815),
			rotation = Rotation(-276.6959, 0, -0)
		},
		trai = {
			position = Vector3(-2900, 5800, 120.418),
			rotation = Rotation(-270, 0, -0)
		},
		firestarter_1_res = {
			position = Vector3(212.975, 3323.35, -6.77108),
			rotation = Rotation(-231.772, 0, 0)
		},
		firestarter_2_res = {
			position = Vector3(1744.88, 3801.91, -5.18631),
			rotation = Rotation(-206.7212, 0, 0)
		},
		firestarter_3_res = {
			position = Vector3(-3965.54, 3311.53, -5.18584),
			rotation = Rotation(-180, 0, -0)
		},
		jolly = {
			position = Vector3(11096.5, 7067.25, -5.1868),
			rotation = Rotation(219.9896, 0, 0)
		},
		four_stores = {
			position = Vector3(1271.37, -4841.79, -30.1868),
			rotation = Rotation(346.706, 0, -0)
		},
		mallcrasher = {
			position = Vector3(-863.425, -2867.4, -5.1868),
			rotation = Rotation(337.295, 0, -0)
		},
		nightclub = {
			position = Vector3(1815, -6200, -30.187),
			rotation = Rotation(0, 0, -0)
		},
		ukrainian_job = {
			position = Vector3(1166.53, -2331.11, 19.8132),
			rotation = Rotation(-329.695, 0, -0)
		},
		fex = {
			position = Vector3(4.26639, 3609.74, -16.7938),
			rotation = Rotation(180, 0, 0)
		},
		hox_3 = {
			position = Vector3(2831.92, -311.787, -5.72567),
			rotation = Rotation(-270, 0, 0)
		},
		big = {
			position = Vector3(2433.17, -1077.08, -605.169),
			rotation = Rotation(305.393, 0, -0)
		},
		mus = {
			position = Vector3(-600, 200, -368.945),
			rotation = Rotation(-90, 0, -0)
		},
		friend = {
			position = Vector3(-2611.58, -44.3966, 46.2507),
			rotation = Rotation(-230, 0, 0)
		},
		crojob2 = {
			position = Vector3(4455.84, -2530.48, -2.68682),
			rotation = Rotation(-314.739, 0, -0)
		},
		wwh = {
			position = Vector3(4829.79, 3244.4, 944.81),
			rotation = Rotation(-187.8137, 0, 0)
		},
		brb = {
			position = Vector3(1217.89, -579.974, -5.18523),
			rotation = Rotation(-271.4455, 0, -0)
		},
		des = {
			position = Vector3(372.035, -256.79, -5.13924),
			rotation = Rotation(-205.054, 0, 0)
		},
		sah = {
			position = Vector3(-675.274, -1663.86, -4.68653),
			rotation = Rotation(274.98, 0, 0)
		},
		mex = {
			position = Vector3(994.206, -8552.75, -3104.69),
			rotation = Rotation(270, 0, 0)
		}
	}
	self.cg22.tree_coordinates = {
		branchbank = {
			position = Vector3(-435, -42.8406, -5.18508),
			rotation = Rotation(-255, 0, 0)
		},
		roberts_v2 = {
			position = Vector3(2062.43, -341.785, -76.7702),
			rotation = Rotation(122.244, 0, -0)
		},
		jewelry_store = {
			position = Vector3(-25, 3100, 19.8175),
			rotation = Rotation(180, 0, -0)
		},
		pal = {
			position = Vector3(-1367.19, 2018.56, 17.4758),
			rotation = Rotation(-270, 0, -0)
		},
		red2 = {
			position = Vector3(-1470.31, 27.2905, -30.1862),
			rotation = Rotation(-270, 0, 0)
		},
		sand = {
			position = Vector3(16423.4, -4646.6, -305.178),
			rotation = Rotation(300, 0, -0)
		},
		chca = {
			position = Vector3(-9308.42, 8625.17, -5.18704),
			rotation = Rotation(180, 0, 0)
		},
		pent = {
			position = Vector3(1500, -3450, 12894.8),
			rotation = Rotation(66.9601, 0, 0)
		},
		trai = {
			position = Vector3(-4447.38, 7876.41, -2.55677),
			rotation = Rotation(0, 0, 0)
		},
		firestarter_2_res = {
			position = Vector3(-790, 1060, 3.32865),
			rotation = Rotation(0, 0, -0)
		},
		firestarter_3_res = {
			position = Vector3(-435, -42.8406, -5.18508),
			rotation = Rotation(-255, 0, 0)
		},
		mallcrasher = {
			position = Vector3(-420, 1300, -405.182),
			rotation = Rotation(180, 0, 0)
		},
		nightclub = {
			position = Vector3(1181.33, -3775.13, -0.183231),
			rotation = Rotation(290, 0, 0)
		},
		ukrainian_job = {
			position = Vector3(-25, 3100, 19.8175),
			rotation = Rotation(180, 0, -0)
		},
		fex = {
			position = Vector3(650, 3700, -405.187),
			rotation = Rotation(-270, 0, 0)
		},
		hox_3 = {
			position = Vector3(450, 0, 45.335),
			rotation = Rotation(-270, 0, 0)
		},
		big = {
			position = Vector3(3000, 0, -1005.19),
			rotation = Rotation(90, 0, 0)
		},
		crojob2 = {
			position = Vector3(2931.11, 2000, -2.65967),
			rotation = Rotation(180, 0, -0)
		},
		mus = {
			position = Vector3(4120, 194.059, -552.039),
			rotation = Rotation(270, 0, 0)
		},
		friend = {
			position = Vector3(-3600, -2075, -56.6644),
			rotation = Rotation(-90, 0, 0)
		},
		wwh = {
			position = Vector3(2679.52, 0, 1144.81),
			rotation = Rotation(-90, 0, 0)
		},
		sah = {
			position = Vector3(0, 2250, -100),
			rotation = Rotation(180, 0, 0)
		},
		mex = {
			position = Vector3(2361.43, -10837.8, -3205.19),
			rotation = Rotation(127.946, 0, -0)
		}
	}
	self.cg22.shredder_generic_offset = Vector3(-600, 0, 0)
	self.cg22.shredder_level_offsets = {
		branchbank = {
			position = Vector3(-375, 0, 0)
		},
		roberts_v2 = {
			position = Vector3(0, 400, 0)
		},
		jewelry_store = {
			position = Vector3(900, 550, 0)
		},
		rvd1 = {
			position = Vector3(-250, -500, 0)
		},
		rvd2 = {
			position = Vector3(-75, 500, 0)
		},
		pal = {
			position = Vector3(400, 525, 0)
		},
		red2 = {
			position = Vector3(-425, -200, 0)
		},
		run = {
			position = Vector3(800, -400, 0)
		},
		mad = {
			position = Vector3(-600, 100, 0)
		},
		chas = {
			position = Vector3(-600, 0, 0)
		},
		sand = {
			position = Vector3(300, -500, 0)
		},
		chca = {
			position = Vector3(-700, -50, 0)
		},
		pent = {
			position = Vector3(150, -500, 0)
		},
		ranc = {
			position = Vector3(-600, 300, 0)
		},
		trai = {
			position = Vector3(700, 900, 0)
		},
		firestarter_1_res = {
			position = Vector3(-600, 100, 0)
		},
		firestarter_2_res = {
			position = Vector3(-450, 0, 0)
		},
		firestarter_3_res = {
			position = Vector3(-375, 0, 0)
		},
		jolly = {
			position = Vector3(500, 500, 0)
		},
		four_stores = {
			position = Vector3(-500, -250, 0)
		},
		mallcrasher = {
			position = Vector3(-500, -200, 0)
		},
		nightclub = {
			position = Vector3(150, 550, 0)
		},
		ukrainian_job = {
			position = Vector3(900, 550, 0)
		},
		fex = {
			position = Vector3(-1100, 0, 0)
		},
		hox_3 = {
			position = Vector3(-600, -175, 0)
		},
		big = {
			position = Vector3(350, 900, 0)
		},
		mus = {
			position = Vector3(375, 0, 0)
		},
		friend = {
			position = Vector3(0, -1200, 0)
		},
		crojob2 = {
			position = Vector3(600, -400, 0)
		},
		wwh = {
			position = Vector3(500, -650, 0)
		},
		brb = {
			position = Vector3(0, -560, 0)
		},
		des = {
			position = Vector3(0, -475, 0)
		},
		sah = {
			position = Vector3(-600, -200, 0)
		},
		mex = {
			position = Vector3(-500, -600, 0)
		}
	}
end

function MutatorTweakData:get_cg22_tree_coordinates()
	local coordinates = self.piggybank.level_coordinates

	for id, item in pairs(self.cg22.tree_coordinates) do
		coordinates[id] = item
	end

	return coordinates
end

function MutatorTweakData:get_cg22_sled_coordinates()
	return self.cg22.sled_level_coordinates
end

function MutatorTweakData:get_cg22_shredder_offsets()
	return self.cg22.shredder_level_offsets
end