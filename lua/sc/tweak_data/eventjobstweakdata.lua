--Killing the ones you just genuinely *cannot* get in resmod
Hooks:PostHook( EventJobsTweakData, "init", "SC_eventstweak_init", function(self)

	self.collective_stats.pda8_collective = {
		found = {},
		all = {
			"pda8_item_1",
			"pda8_item_3",
			"pda8_item_4",
			"pda8_item_7",
			"pda8_item_8"
		}
	}

end)

function EventJobsTweakData:_init_pda8_challenges(tweak_data)
	table.insert(self.challenges, {
		reward_id = "menu_pda8_2_reward",
		global_value = "pda8",
		name_id = "menu_pda8_2",
		desc_id = "menu_pda8_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_2",
		id = "pda8_2",
		objectives = {
			self:_collective("pda8_collective", 3, {
				name_id = "menu_pda8_2_prog_obj",
				desc_id = "menu_pda8_2_prog_obj_desc"
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_2_track_obj",
				desc_id = "",
				stages = {
					2,
					3,
					4,
					5
				}
			})
		},
		rewards = {
			{
				item_entry = "jesterstripe",
				type_items = "gloves"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_pda8_3_reward",
		global_value = "pda8",
		name_id = "menu_pda8_3",
		desc_id = "menu_pda8_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_3",
		id = "pda8_3",
		objectives = {
			self:_collective("pda8_collective", 4, {
				name_id = "menu_pda8_3_prog_obj",
				desc_id = "menu_pda8_3_prog_obj_desc"
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_3_track_obj",
				desc_id = "",
				stages = {
					3,
					4,
					5
				}
			})
		},
		rewards = {
			{
				item_entry = "baron",
				type_items = "player_styles"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_pda8_4_reward",
		global_value = "pda8",
		name_id = "menu_pda8_4",
		desc_id = "menu_pda8_4_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_4",
		id = "pda8_4",
		objectives = {
			tweak_data.safehouse:_progress("pda8_item_1", 1, {
				name_id = "menu_pda8_item_1",
				desc_id = "menu_pda8_item_1_desc"
			}),
			tweak_data.safehouse:_progress("pda8_item_3", 1, {
				name_id = "menu_pda8_item_3",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_4", 1, {
				name_id = "menu_pda8_item_4",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_7", 1, {
				name_id = "menu_pda8_item_7",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_8", 1, {
				name_id = "menu_pda8_item_8",
				desc_id = ""
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_4_track_obj",
				desc_id = "",
				stages = {
					4,
					5
				}
			})
		},
		rewards = {
			{
				type_items = "masks",
				item_entry = "eighthgrin",
				amount = 1
			}
		}
	})
end
function EventJobsTweakData:_init_cg22_challenges(tweak_data)
	table.insert(self.challenges, {
		reward_id = "menu_cg22_1_reward",
		locked_id = "bm_menu_locked_cg22_1",
		id = "cg22_1",
		name_id = "menu_cg22_1",
		desc_id = "menu_cg22_1_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_1", 100, {
					name_id = "menu_cg22_personal_1",
					desc_id = "menu_cg22_personal_1_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_1", 200, {
					name_id = "menu_cg22_post_objective_1",
					desc_id = "menu_cg22_post_objective_1_desc"
				})
			}, 1, {
				name_id = "menu_cg22_1_choice_obj",
				choice_id = "cg22_personal_1",
				desc_id = "menu_cg22_post_objective_1_desc"
			})
		},
		rewards = {
			{
				item_entry = "victor",
				type_items = "upgrades"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_2_reward",
		locked_id = "bm_menu_locked_cg22_2",
		id = "cg22_2",
		name_id = "menu_cg22_2",
		desc_id = "menu_cg22_2_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_2", 250, {
					name_id = "menu_cg22_personal_2",
					desc_id = "menu_cg22_personal_2_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_2", 15, {
					name_id = "menu_cg22_post_objective_2",
					desc_id = "menu_cg22_post_objective_2_desc"
				})
			}, 1, {
				name_id = "menu_cg22_2_choice_obj",
				choice_id = "cg22_personal_2",
				desc_id = "menu_cg22_post_objective_2_desc"
			})
		},
		rewards = {
			{
				item_entry = "wpn_fps_m4_uupg_s_zulu",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_s_mod0",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_g_mod3",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_o_standard",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_3_reward",
		locked_id = "bm_menu_locked_cg22_3",
		id = "cg22_3",
		name_id = "menu_cg22_3",
		desc_id = "menu_cg22_3_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_3", 75, {
					name_id = "menu_cg22_personal_3",
					desc_id = "menu_cg22_personal_3_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_3", 50, {
					name_id = "menu_cg22_post_objective_3",
					desc_id = "menu_cg22_post_objective_3_desc"
				})
			}, 1, {
				name_id = "menu_cg22_3_choice_obj",
				choice_id = "cg22_personal_3",
				desc_id = "menu_cg22_post_objective_3_desc"
			})
		},
		rewards = {
			{
				item_entry = "wpn_fps_snp_victor_sbr_kit",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_ns_omega",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_1_reward",
		locked_id = "bm_menu_locked_cg22_community_1",
		id = "cg22_community_1",
		name_id = "menu_cg22_community_1",
		desc_id = "menu_cg22_community_1_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_secure_objective", 3, {
					name_id = "menu_cg22_item_1",
					desc_id = "menu_cg22_item_1_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 10, {
					name_id = "menu_cg22_post_objective_4",
					desc_id = "menu_cg22_post_objective_4_desc"
				})
			}, 1, {
				name_id = "menu_cg22_4_choice_obj",
				choice_id = "cg22_community_1",
				desc_id = "menu_cg22_post_objective_4_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_1_track_obj",
				desc_id = "menu_cg22_community_item_1_desc",
				stages = {
					2,
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "elfsuit",
				type_items = "player_styles"
			},
			{
				item_entry = "wpn_fps_upg_charm_teddymoo",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_2_reward",
		locked_id = "bm_menu_locked_cg22_community_2",
		id = "cg22_community_2",
		name_id = "menu_cg22_community_2",
		desc_id = "menu_cg22_community_2_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_sacrifice_objective", 3, {
					name_id = "menu_cg22_item_2",
					desc_id = "menu_cg22_item_2_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_5", 10, {
					name_id = "menu_cg22_post_objective_5",
					desc_id = "menu_cg22_post_objective_5_desc"
				})
			}, 1, {
				name_id = "menu_cg22_5_choice_obj",
				choice_id = "cg22_community_2",
				desc_id = "menu_cg22_post_objective_5_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_2_track_obj",
				desc_id = "menu_cg22_community_item_2_desc",
				stages = {
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"red"
				}
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_3_reward",
		locked_id = "bm_menu_locked_cg22_community_3",
		id = "cg22_community_3",
		name_id = "menu_cg22_community_3",
		desc_id = "menu_cg22_community_3_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_snowman_objective", 1, {
					name_id = "menu_cg22_item_3",
					desc_id = "menu_cg22_item_3_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 25, {
					name_id = "menu_cg22_post_objective_6",
					desc_id = "menu_cg22_post_objective_6_desc"
				})
			}, 1, {
				name_id = "menu_cg22_6_choice_obj",
				choice_id = "cg22_community_3",
				desc_id = "menu_cg22_post_objective_6_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_3_track_obj",
				desc_id = "menu_cg22_community_item_3_desc",
				stages = {
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"violet"
				}
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_4_reward",
		locked_id = "bm_menu_locked_cg22_community_4",
		id = "cg22_community_4",
		name_id = "menu_cg22_community_4",
		desc_id = "menu_cg22_community_4_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_sacrifice_objective", 30, {
					name_id = "menu_cg22_item_2",
					desc_id = "menu_cg22_item_2_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 50, {
					name_id = "menu_cg22_post_objective_7",
					desc_id = "menu_cg22_post_objective_7_desc"
				})
			}, 1, {
				name_id = "menu_cg22_7_choice_obj",
				choice_id = "cg22_community_4",
				desc_id = "menu_cg22_post_objective_7_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_4_track_obj",
				desc_id = "menu_cg22_community_item_4_desc",
				stages = {
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = 23,
				type_items = "perkdeck"
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_5_reward",
		locked_id = "bm_menu_locked_cg22_community_5",
		id = "cg22_community_5",
		name_id = "menu_cg22_community_5",
		desc_id = "menu_cg22_community_5_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_snowman_objective", 10, {
					name_id = "menu_cg22_item_3",
					desc_id = "menu_cg22_item_3_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_5", 20, {
					name_id = "menu_cg22_post_objective_8",
					desc_id = "menu_cg22_post_objective_8_desc"
				})
			}, 1, {
				name_id = "menu_cg22_8_choice_obj",
				choice_id = "cg22_community_5",
				desc_id = "menu_cg22_post_objective_8_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_5_track_obj",
				desc_id = "menu_cg22_community_item_5_desc",
				stages = {
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"yellow"
				}
			}
		}
	})
	table.insert(self.challenges, {
		reward_id = "menu_cg22_community_6_reward",
		locked_id = "bm_menu_locked_cg22_community_6",
		id = "cg22_community_6",
		name_id = "menu_cg22_community_6",
		desc_id = "menu_cg22_community_6_desc",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_secure_objective", 30, {
					name_id = "menu_cg22_item_1",
					desc_id = "menu_cg22_item_1_desc"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 75, {
					name_id = "menu_cg22_post_objective_9",
					desc_id = "menu_cg22_post_objective_9_desc"
				})
			}, 1, {
				name_id = "menu_cg22_9_choice_obj",
				choice_id = "cg22_community_6",
				desc_id = "menu_cg22_post_objective_9_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_6_track_obj",
				desc_id = "menu_cg22_community_item_6_desc",
				stages = {
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "elfhat",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_red",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_yellow",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_violet",
				type_items = "masks"
			}
		}
	})
end