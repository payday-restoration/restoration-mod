--ATTACHMENT PRESETS

local sight_1_5x_offset = {
	sights = {
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1"
	},
	offset = Vector3(0,-8,0),
	exclude = {
		"wpn_fps_snp_mosin"
	}
}

--Barrels
local barrels = {
	--Short Barrel
	--barrels.short_b1_stats
	--barrels.short_b1_custom_stats
		short_b1_stats = {
			value = 2,
			spread = -1,
			concealment = 1
		},
		short_b1_custom_stats = {
			falloff_start_mult = 0.925,
			falloff_end_mult = 0.925,
			ads_speed_mult = 0.975
		},
	--Shorter Barrel
	--barrels.short_b2_stats
	--barrels.short_b2_custom_stats
		short_b2_stats = {
			value = 2,
			spread = -2,
			concealment = 2
		},
		short_b2_custom_stats = {
			falloff_start_mult = 0.85,
			falloff_end_mult = 0.85,
			ads_speed_mult = 0.95
		},
	--Shortest Barrel
	--barrels.short_b3_stats
	--barrels.short_b3_custom_stats
		short_b3_stats = {
			value = 2,
			spread = -3,
			concealment = 3
		},
		short_b3_custom_stats = {
			falloff_start_mult = 0.775,
			falloff_end_mult = 0.775,
			ads_speed_mult = 0.925
		},

	--Long Barrel
	--barrels.long_b1_stats
	--barrels.long_b1_custom_stats
		long_b1_stats = {
			value = 2,
			spread = 1,
			concealment = -1
		},
		long_b1_custom_stats = {
			falloff_start_mult = 1.075,
			falloff_end_mult = 1.075,
			ads_speed_mult = 1.025
		},
	--Longer Barrel
	--barrels.long_b2_stats
	--barrels.long_b2_custom_stats
		long_b2_stats = {
			value = 4,
			spread = 2,
			concealment = -2
		},
		long_b2_custom_stats = {
			falloff_start_mult = 1.15,
			falloff_end_mult = 1.15,
			ads_speed_mult = 1.05
		},
	--Longest Barrel
	--barrels.long_b3_stats
	--barrels.long_b3_custom_stats
		long_b3_stats = {
			value = 6,
			spread = 3,
			concealment = -3
		},
		long_b3_custom_stats = {
			falloff_start_mult = 1.225,
			falloff_end_mult = 1.225,
			ads_speed_mult = 1.075
		}
}

--Stocks
--PRIMARILY FOR GUNS THAT ARE COMPATIBLE WITH AR-15 STOCKS
local stocks = {
	--DEFAULT RETRACTABLE/UNDERFOLDER/WIRE STOCK
	--Retract > Thumbhole Stock -----Con ++Acc +++Stab
		--stocks.nocheeks_to_thumb_stats
		nocheeks_to_thumb_stats = {
			value = 7,
			spread = 2,
			recoil = 6,
			concealment = -5,
			ads_speed_mult = 1.125
		},
	--Retract > Fixed Stock ----Con ++Acc ++Stab
		--stocks.nocheeks_to_fixed_acc2_rec2_stats
		nocheeks_to_fixed_acc2_rec2_stats = {
			value = 6,
			spread = 2,
			recoil = 4,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--Retract > Fixed Stock ----Con +Acc +++Stab
		--stocks.nocheeks_to_fixed_rec3_stats
		nocheeks_to_fixed_rec3_stats = {
			value = 6,
			spread = 1,
			recoil = 6,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--Retract > Heavy Adjustable Stock ---Con ++Acc +Stab
		nocheeks_to_hvy_acc2_rec1_stats = {
			value = 5,
			recoil = 2,
			spread = 2,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Retract > Heavy Adjustable Stock ---Con +Acc ++Stab
		nocheeks_to_hvy_acc1_rec2_stats = {
			value = 5,
			recoil = 4,
			spread = 1,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Retract > Adjustable Stock --Con ++Acc
		--stocks.nocheeks_to_adj_acc_stats
		nocheeks_to_adj_acc_stats = {
			value = 4,
			spread = 2,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Retract > Adjustable Stock --Con +Acc +Stab
		--stocks.nocheeks_to_adj_dual_stats
		nocheeks_to_adj_dual_stats = {
			value = 4,
			spread = 1,
			recoil = 2,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Retract > Adjustable Stock --Con ++Stab
		--stocks.nocheeks_to_adj_rec_stats
		nocheeks_to_adj_rec_stats = {
			value = 4,
			recoil = 4,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Retract > SideFolder -Con +Acc
		--stocks.nocheeks_to_folder_stats
		nocheeks_to_folder_stats = {
			value = 4,
			spread = 1,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Retract > Retracted/Folded Stock +Con -Stab
		--stocks.fold_nocheeks_stats
		fold_nocheeks_stats = {
			value = 0,
			recoil = -2,
			concealment = 1,
			ads_speed_mult = 0.975
		},
	--Retract > No Stock ++Con -Acc -Stab
		--stocks.remove_nocheeks_stats
		remove_nocheeks_stats = {
			value = 3,
			spread = -1,
			recoil = -2,
			concealment = 2,
			ads_speed_mult = 0.95
		},


	--DEFAULT SIDEFOLDER STOCK
	--Folder > Thumbhole Stock ----Con +Acc ++++Stab
		--stocks.folder_to_thumb_stats
		folder_to_thumb_stats = {
			value = 7,
			spread = 1,
			recoil = 6,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--Folder > Fixed Stock ---Con +Acc ++Stab
		--stocks.folder_to_fixed_acc1_rec2_stats
		folder_to_fixed_acc1_rec2_stats = {
			value = 6,
			spread = 1,
			recoil = 4,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Folder > Fixed Stock ---Con +++Stab
		--stocks.folder_to_fixed_rec3_stats
		folder_to_fixed_rec3_stats = {
			value = 6,
			recoil = 6,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Folder > Heavy Adjustable Stock --Con ++Acc
		folder_to_hvy_acc2_stats = {
			value = 5,
			spread = 2,
			recoil = 0,
			concealment = -2,
			ads_speed_mult = 1.05
		},	
	--Folder > Heavy Adjustable Stock --Con ++Stab
		folder_to_hvy_rec2_stats = {
			value = 5,
			spread = 0,
			recoil = 4,
			concealment = -2,
			ads_speed_mult = 1.05
		},	
	--Folder > Adjustable Stock -Con -Stab ++Acc
		folder_to_adj_acc2_stats = {
			value = 4,
			spread = 2,
			recoil = -2,
			concealment = -1,
			ads_speed_mult = 1.025
		},	
	--Folder > Adjustable Stock -Con +Acc
		folder_to_adj_acc1_stats = {
			value = 4,
			spread = 1,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Folder > Adjustable Stock -Con +Stab
		folder_to_adj_rec_stats = {
			value = 4,
			recoil = 2,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Folder +Stab -Acc
		--stocks.folder_rec_stats
		folder_rec_stats = {
			value = 3,
			recoil = 2,
			spread = -1
		},
	--Folder +Acc -Stab
		--stocks.folder_acc_stats
		folder_acc_stats = {
			value = 3,
			recoil = -2,
			spread = 1
		},
	--Folder > Retractable/Underfolder/Wire +Con -Acc
		--stocks.folder_to_nocheeks_stats
		folder_to_nocheeks_stats = {
			value = 4,
			spread = -1,
			concealment = 1,
			ads_speed_mult = 0.975
		},
	--Folder > Folded Stock ++Con
		--stocks.fold_folder_stats
		fold_folder_stats = {
			value = 0,
			recoil = -4,
			concealment = 2,
			ads_speed_mult = 0.95
		},
	--Folder > No Stock +++Con
		--stocks.remove_folder_stats
		remove_folder_stats = {
			value = 5,
			spread = -1,
			recoil = -4,
			concealment = 3,
			ads_speed_mult = 0.925
		},


	--DEFAULT ADJUSTABLE STOCK (DEFAULT M4)
	--Adjustable > Fixed --Con ++Stab
		adj_to_fixed_acc_stats = {
			value = 5,
			recoil = 4,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Adjustable > Fixed --Con ++Stab
		adj_to_fixed_rec_stats = {
			value = 5,
			recoil = 4,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Adjustable > Heavy Adjustable -Con +Acc
		--stocks.adj_hvy_acc_stats
		adj_hvy_acc_stats = {
			value = 4,
			spread = 1,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Adjustable > Heavy Adjustable -Con +Stab
		--stocks.adj_hvy_rec_stats
		adj_hvy_rec_stats = {
			value = 4,
			recoil = 2,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Adjustable +Stab -Acc
		--stocks.adj_rec_stats
		adj_rec_stats = {
			value = 3,
			recoil = 2,
			spread = -1
		},
	--Adjustable +Acc -Stab
		--stocks.adj_acc_stats
		adj_acc_stats = {
			value = 3,
			recoil = -2,
			spread = 1
		},
	--Adjustable > Folder +Con -Stab
		adj_to_fold_stats = {
			value = 4,
			recoil = -2,
			concealment = 1,
			ads_speed_mult = 0.975
		},
	--Adjustable > Retractable/Underfolder/Wire ++Con -Acc -Stab
		--stocks.adj_to_nocheeks_stats
		adj_to_nocheeks_stats = {
			value = 4,
			spread = -1,
			recoil = -2,
			concealment = 2,
			ads_speed_mult = 0.95
		},
	--Adjustable > Folded/Retracted +++Con -Acc --Stab
		adj_to_folded_stats = {
			value = 4,
			spread = -1,
			recoil = -4,
			concealment = 3,
			ads_speed_mult = 0.925
		},
	--Adjustable > No Stock ++++Con --Acc --Stab
		remove_adj_stats = {
			value = 4,
			spread = -2,
			recoil = -4,
			concealment = 4,
			ads_speed_mult = 0.9
		},


	--DEFAULT FIXED STOCK (SELF EXPLANATORY)
	--Fixed > Thumbhole --Con +Acc +Stab
		--stocks.fixed_to_thumbhole_stats
		fixed_to_thumbhole_stats = {
			value = 6,
			spread = 1,
			recoil = 4,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Fixed +Stab -Acc
		fixed_rec_stats = {
			value = 4,
			spread = -1,
			recoil = 2
		},
	--Fixed +Acc -Stab
		fixed_acc_stats = {
			value = 4,
			spread = 1,
			recoil = -2
		},
	--Fixed > Heavy Adjustable +Con -Acc
		fixed_to_hvy_acc_stats = {
			value = 4,
			spread = -1,
			concealment = 1,
			ads_speed_mult = 0.975
		},
	--Fixed > Heavy Adjustable +Con -Stab
		fixed_to_hvy_rec_stats = {
			value = 4,
			recoil = -2,
			concealment = 1,
			ads_speed_mult = 0.975
		},
	--Fixed > Adjustable ++Con --Stab
		fixed_to_adj_acc_stats = {
			value = 3,
			recoil = -4,
			concealment = 2,
			ads_speed_mult = 0.95
		},
	--Fixed > Adjustable ++Con --Acc
		fixed_to_adj_rec_stats = {
			value = 3,
			spread = -2,
			concealment = 2,
			ads_speed_mult = 0.95
		},
	--Fixed > Adjustable ++Con -Acc -Stab
		fixed_to_adj_dual_stats = {
			value = 3,
			spread = -1,
			recoil = -2,
			concealment = 2,
			ads_speed_mult = 0.95
		},
	--Fixed > Sidefolder +++Con ---Stab
		--stocks.fixed_to_folder_stats
		fixed_to_folder_stats = {
			value = 4,
			spread = -1,
			recoil = -4,
			concealment = 3,
			ads_speed_mult = 0.925
		},
	--Fixed > Retractable/Underfolder/Wire ++++Con -Acc ---Stab
		--stocks.fixed_to_nocheeks_stats
		fixed_to_nocheeks_stats = {
			value = 4,
			spread = -2,
			recoil = -4,
			concealment = 4,
			ads_speed_mult = 0.9
		},
	--Fixed > Folded/Retracted +++++Con --Acc ---Stab
		--stocks.fixed_to_folded_stats
		fixed_to_folded_stats = {
			value = 4,
			spread = -2,
			recoil = -6,
			concealment = 5,
			ads_speed_mult = 0.875
		},
	--Fixed > No stock ++++++Con --Acc ----Stab
		--stocks.remove_fixed_stats
		remove_fixed_stats = {
			value = 5,
			spread = -2,
			recoil = -8,
			concealment = 6,
			ads_speed_mult = 0.85
		},


	--DEFAULT FOLDED/COLLAPSED STOCK
	--Folded > Fixed Stock -----Con ++Acc +++Stab
		--stocks.folded_to_fixed_stats
		folded_to_fixed_stats = {
			value = 7,
			spread = 2,
			recoil = 6,
			concealment = -5,
			ads_speed_mult = 1.125
		},
	--Folded > Heavy Adjustable ----Con +++Acc +Stab
		--stocks.folded_to_hvy_rec2
		folded_to_hvy_rec2 = {
			value = 5,
			recoil = 2,
			spread = 3,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--Folded > Heavy Adjustable ----Con ++Acc ++Stab
		--stocks.folded_to_hvy_rec3
		folded_to_hvy_rec3 = {
			value = 5,
			recoil = 4,
			spread = 2,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--Folded > Adjustable ---Con +++Acc
		--stocks.folded_to_adj_rec1
		folded_to_adj_rec1 = {
			value = 4,
			spread = 3,
			recoil = 0,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Folded > Adjustable ---Con ++Acc +Stab
		--stocks.folded_to_adj_rec2
		folded_to_adj_rec2 = {
			value = 4,
			spread = 2,
			recoil = 2,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Folded > Adjustable ---Con +Acc ++Stab
		--stocks.folded_to_adj_rec3
		folded_to_adj_rec3 = {
			value = 4,
			spread = 1,
			recoil = 4,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--Folded > Unfolded --Con +Acc +Stab
		--stocks.unfold_folded_stats
		unfold_folded_stats = {
			value = 3,
			spread = 1,
			recoil = 2,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--Folded > Uncollapsed -Con +Stab
		--stocks.unfold_nocheeks_stats
		unfold_nocheeks_stats = {
			value = 2,
			recoil = 2,
			concealment = -1,
			ads_speed_mult = 1.025
		},
	--Folded > No Stock +Con -Stab
		--stocks.remove_folded_stats
		remove_folded_stats = {
			value = 1,
			recoil = -2,
			concealment = 1,
			ads_speed_mult = 0.975
		},


	--DEFAULT NO STOCK
	--No Stock > Fixed ------Con ++Acc ++++Stab
		add_fixed_rec_stats = {
			value = 7,
			spread = 2,
			recoil = 8,
			concealment = -6,
			ads_speed_mult = 1.15
		},
	--No Stock > Fixed ------Con +++Acc +++Stab
		add_fixed_stats = {
			value = 7,
			spread = 3,
			recoil = 6,
			concealment = -6,
			ads_speed_mult = 1.15
		},
	--No Stock > Heavy Adjustable -----Con ++Acc +++Stab
		add_hvy_rec_stats = {
			value = 5,
			spread = 2,
			recoil = 6,
			concealment = -5,
			ads_speed_mult = 1.125
		},
	--No Stock > Heavy Adjustable -----Con +++Acc ++Stab
		add_hvy_acc_stats = {
			value = 5,
			spread = 3,
			recoil = 4,
			concealment = -5,
			ads_speed_mult = 1.125
		},
	--No Stock > Adjustable ----Con +++Acc +Stab
		add_adj_acc3_stats = {
			value = 5,
			spread = 3,
			recoil = 2,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--No Stock > Adjustable ----Con ++Acc ++Stab
		add_adj_acc2_stats = {
			value = 5,
			spread = 2,
			recoil = 4,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--No Stock > Adjustable ----Con +Acc +++Stab
		add_adj_stats = {
			value = 5,
			spread = 1,
			recoil = 6,
			concealment = -4,
			ads_speed_mult = 1.1
		},
	--No Stock > Folder (or just really lightweight stocks) ---Con  +++Stab
	--stocks.add_folder_stats
		add_folder_stats = {
			value = 4,
			recoil = 6,
			concealment = -3,
			ads_speed_mult = 1.075
		},
	--No Stock > Retractable/Wire
	--stocks.add_nocheeks_stats
		add_nocheeks_stats = {
			value = 2,
			recoil = 4,
			concealment = -2,
			ads_speed_mult = 1.05
		},
	--No Stock > Folded
	--stocks.add_folded_stats
		add_folded_stats = {
			value = 2,
			recoil = 2,
			concealment = -1,
			ads_speed_mult = 1.025
		}
}

--Muzzle device stats
local muzzle_device = {
	-- +Con -Acc/Range 
		muzzle_a_stats = {
			value = 3,
			spread = -1,
			concealment = 1
		},
		supp_a_stats = {
			suppression = 12,
			alert_size = -1,
			value = 3,
			spread = -1,
			concealment = 1
		},
		muzzle_a_custom_stats = {
			falloff_start_mult = 0.95,
			falloff_end_mult = 0.95
		},
	-- +Con -Stab 
		muzzle_a_alt_stats = {
			value = 3,
			recoil = -2,
			concealment = 1
		},
		supp_a_alt_stats = {
			suppression = 12,
			alert_size = -1,
			value = 3,
			recoil = -2,
			concealment = 1
		},


	-- +Stab -Acc/Range 
		muzzle_rec_stats = {
			value = 3,
			spread = -1,
			recoil = 2
		},
		supp_rec_stats = {
			suppression = 12,
			alert_size = -1,
			value = 3,
			spread = -1,
			recoil = 2
		},
		muzzle_rec_custom_stats = {
			falloff_start_mult = 0.95,
			falloff_end_mult = 0.95
		},
	-- +Acc/Range -Stab
		muzzle_acc_stats = {
			value = 3,
			spread = 1,
			recoil = -2
		},
		supp_acc_stats = {
			suppression = 12,
			alert_size = -1,
			value = 3,
			spread = 1,
			recoil = -2
		},
		muzzle_acc_custom_stats = {
			falloff_start_mult = 1.05,
			falloff_end_mult = 1.05
		},


	-- -Con +Stab
		muzzle_b_stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		},
		supp_b_stats = {
			suppression = 12,
			alert_size = -1,
			value = 2,
			recoil = 2,
			concealment = -1
		},
	-- -Con +Acc/Range
		muzzle_b_alt_stats = {
			value = 2,
			spread = 1,
			concealment = -1
		},
		supp_b_alt_stats = {
			suppression = 12,
			alert_size = -1,
			value = 2,
			spread = 1,
			concealment = -1
		},
		muzzle_b_alt_custom_stats = {
			falloff_start_mult = 1.05,
			falloff_end_mult = 1.05
		},


	-- --Con ++Acc/Range
		muzzle_c_stats = {
			value = 5,
			spread = 2,
			concealment = -2
		},
		supp_c_stats = {
			suppression = 12,
			alert_size = -1,
			value = 5,
			spread = 2,
			concealment = -2
		},
		muzzle_c_custom_stats = {
			falloff_start_mult = 1.1,
			falloff_end_mult = 1.1
		},
	-- --Con ++Stab
		muzzle_c_alt_stats = {
			value = 5,
			recoil = 4,
			concealment = -2
		},
		supp_c_alt_stats = {
			suppression = 12,
			alert_size = -1,
			value = 5,
			recoil = 4,
			concealment = -2
		},
	-- --Con +Stab +Acc/Range
		muzzle_c_duo_stats = {
			value = 5,
			spread = 1,
			recoil = 2,
			concealment = -2
		},
		supp_c_duo_stats = {
			suppression = 12,
			alert_size = -1,
			value = 5,
			spread = 1,
			recoil = 2,
			concealment = -2
		},
		muzzle_c_duo_custom_stats = {
			falloff_start_mult = 1.05,
			falloff_end_mult = 1.05,
			ads_speed_mult = 1.025
		},


	-- ++Stab --Acc/Range
		muzzle_rec2_stats = {
			value = 5,
			spread = -1,
			recoil = 4,
			concealment = -1
		},
		supp_rec2_stats = {
			suppression = 12,
			alert_size = -1,
			value = 5,
			spread = -1,
			recoil = 4,
			concealment = -1
		},
		muzzle_rec2_custom_stats = {
			falloff_start_mult = 0.9,
			falloff_end_mult = 0.9
		},	
	-- ++Acc --Stab
		muzzle_acc2_stats = {
			value = 5,
			spread = 2,
			recoil = -4
		},
		supp_acc2_stats = {
			suppression = 12,
			alert_size = -1,
			value = 5,
			spread = 2,
			recoil = -4
		},
		muzzle_acc2_custom_stats = {
			falloff_start_mult = 1.1,
			falloff_end_mult = 1.1
		},

	-- +++Acc ---Stab
		muzzle_acc3_stats = {
			value = 6,
			spread = 3,
			recoil = -6
		},
		supp_acc3_stats = {
			suppression = 12,
			alert_size = -1,
			value = 6,
			spread = 3,
			recoil = -6
		},
		muzzle_acc3_custom_stats = {
			falloff_start_mult = 1.15,
			falloff_end_mult = 1.15
		},

	-- ----Con ++Stab ++Acc/Range
		muzzle_rec2_acc2_stats = {
			value = 7,
			spread = 2,
			recoil = 4,
			concealment = -4
		},
		supp_rec2_acc2_stats = {
			suppression = 12,
			alert_size = -1,
			value = 7,
			spread = 2,
			recoil = 4,
			concealment = -4
		},
		muzzle_rec2_acc2_custom_stats = {
			falloff_start_mult = 1.1,
			falloff_end_mult = 1.1,
			ads_speed_mult = 1.05
		}
}

--SHOTGUN AMMO PRESETS
--Overrides for shotgun ammo types that vary per damage tier.
	--Indented to make for easy code folding in most editors.
	--@SC Feel free to define these for the other ammo types if you want, though it may require way more presets to be made since they also touch ammo count.

	--Flechettes
		local a_piercing_auto_override = {
			desc_id = "bm_wp_upg_a_piercing_auto_desc_sc",
			stats = {
				value = 9,
				damage = -6,
				spread = 5
			},
			custom_stats = {
				trail_effect = "_dmc/effects/nato_trail",
				falloff_start_mult = 1,
				falloff_end_mult = 1.25,
				damage_min_mult = 6,
				armor_piercing_add = 1,		
				rays = 12
				--[[
				bullet_class = "BleedBulletBase",
				dot_data = { 
					type = "bleed",
					custom_data = {
						dot_damage = 0.6,
						dot_length = 8.1,
						dot_tick_period = 0.5
					}
				}
				--]]
			}
		}
	
		local a_piercing_semi_override = {
			desc_id = "bm_wp_upg_a_piercing_semi_desc_sc",
			stats = {
				value = 9,
				damage = -15,
				spread = 5
			},
			custom_stats = {
				trail_effect = "_dmc/effects/nato_trail",
				falloff_start_mult = 1,
				falloff_end_mult = 1.25,
				damage_min_mult = 6.666666,
				armor_piercing_add = 1,
				rays = 12
				--[[
				bullet_class = "BleedBulletBase",
				dot_data = { 
					type = "bleed",
					custom_data = {
						dot_damage = 0.75,
						dot_length = 8.1,
						dot_tick_period = 0.5
					}
				}
				--]]
			}
		}
	
		local a_piercing_pump_override = {
			desc_id = "bm_wp_upg_a_piercing_pump_desc_sc",
			stats = {
				value = 9,
				damage = -15,
				spread = 5
			},
			custom_stats = {
				trail_effect = "_dmc/effects/nato_trail",
				falloff_start_mult = 1,
				falloff_end_mult = 1.25,
				damage_min_mult = 5.333333,
				armor_piercing_add = 1,
				rays = 12
				--[[
				bullet_class = "BleedBulletBase",
				dot_data = { 
					type = "bleed",
					custom_data = {
						dot_damage = 1.125,
						dot_length = 8.1,
						dot_tick_period = 0.5
					}
				}
				--]]
			}
		}
	
	--Poison
		local a_rip_auto_override = {
			desc_id = "bm_wp_upg_a_rip_auto_desc_sc",
			stats = {
				value = 9,
				damage = -6
			},
			custom_stats = {
				trail_effect = "_dmc/effects/warsaw_trail",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_rip",
				bullet_class = "PoisonBulletBase",
				dot_data = { 
					type = "poison",
					custom_data = {
						dot_damage = 1.5,
						dot_length = 1.1,
						dot_tick_period = 0.5,
						use_weapon_damage_falloff = true,
						hurt_animation_chance = 0.05
					}
				}
			}
		}
	
		local a_rip_semi_override = {
			desc_id = "bm_wp_upg_a_rip_semi_desc_sc",
			stats = {
				value = 9,
				damage = -15
			},
			custom_stats = {
				trail_effect = "_dmc/effects/warsaw_trail",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_rip",
				bullet_class = "PoisonBulletBase",
				dot_data = { 
					type = "poison",
					custom_data = {
						dot_damage = 1.5,
						dot_length = 4.1,
						dot_tick_period = 0.5,
						use_weapon_damage_falloff = true,
						duration_falloff_end_mult = 0.5,
						hurt_animation_chance = 0.1
					}
				}
			}
		}

		local a_rip_pump_override = {
			desc_id = "bm_wp_upg_a_rip_pump_desc_sc",
			stats = {
				value = 9,
				damage = -15
			},
			custom_stats = {
				trail_effect = "_dmc/effects/warsaw_trail",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_rip",
				bullet_class = "PoisonBulletBase",
				dot_data = { 
					type = "poison",
					custom_data = {
						dot_damage = 1.5,
						dot_length = 6.1,
						dot_tick_period = 0.5,
						use_weapon_damage_falloff = true,
						duration_falloff_end_mult = 0.5,
						hurt_animation_chance = 0.15
					}
				}
			}
		}

	--Dragon's Breath
		local a_dragons_breath_auto_override = {
			desc_id = "bm_wp_upg_a_dragons_breath_auto_desc_sc",
			stats = {
				value = 9,
				damage = -6
			},
			custom_stats = {
				rof_mult = 0.8,
				falloff_start_mult = 0.8,
				falloff_end_mult = 0.8,
				damage_min_mult = 0,
				ignore_statistic = true,
				bullet_class = "FlameBulletBase",
				armor_piercing_add = 0.01,								
				can_shoot_through_shield = false,
				rays = 16,
				trail_effect = "",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
				fire_dot_data = {
					dot_damage = 1.5,
					dot_trigger_chance = 20,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
			}
		}

		local a_dragons_breath_semi_override = {
			desc_id = "bm_wp_upg_a_dragons_breath_semi_desc_sc",
			stats = {
				value = 9,
				damage = -15
			},
			custom_stats = {
				rof_mult = 0.8,
				falloff_start_mult = 0.8,
				falloff_end_mult = 0.8,
				damage_min_mult = 0,
				ignore_statistic = true,
				bullet_class = "FlameBulletBase",
				armor_piercing_add = 0.01,								
				can_shoot_through_shield = false,
				rays = 16,
				trail_effect = "",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
				fire_dot_data = {
					dot_damage = 2,
					dot_trigger_chance = 25,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
			}
		}

		local a_dragons_breath_revo_override = {
			desc_id = "bm_wp_upg_a_dragons_breath_semi_desc_sc",
			stats = {
				value = 9,
				damage = -15
			},
			custom_stats = {
				falloff_start_mult = 0.8,
				falloff_end_mult = 0.8,
				damage_min_mult = 0,
				ignore_statistic = true,
				bullet_class = "FlameBulletBase",
				armor_piercing_add = 0.01,								
				can_shoot_through_shield = false,
				rays = 16,
				trail_effect = "",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
				fire_dot_data = {
					dot_damage = 2,
					dot_trigger_chance = 25,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
			}
		}

		local a_dragons_breath_pump_override = {
			desc_id = "bm_wp_upg_a_dragons_breath_pump_desc_sc",
			supported = true,
			stats = {
				value = 9,
				damage = -15
			},
			custom_stats = {
				falloff_start_mult = 0.8,
				falloff_end_mult = 0.8,
				damage_min_mult = 0,
				ignore_statistic = true,
				bullet_class = "FlameBulletBase",
				armor_piercing_add = 0.01,							
				can_shoot_through_shield = false,
				rays = 16,
				trail_effect = "",
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
				fire_dot_data = {
					dot_damage = 3,
					dot_trigger_chance = 35,
					dot_length = 3.1,
					dot_tick_period = 0.5
				}
			}
		}

	--00 Buck
		local a_custom_auto_override = {
			supported = true,
			stats = {
				value = 9,
				total_ammo_mod = -33,
				damage = 15
			},
			custom_stats = {
				falloff_end_mult = 0.8,
				damage_min_mult = 0.75,
				armor_piercing_add = 0.20,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				rays = 6
			}
		}

		local a_custom_semi_override = {
			supported = true,
			stats = {
				value = 9,
				spread = -5,
				total_ammo_mod = -25,
				damage = 15
			},
			custom_stats = {
				falloff_end_mult = 0.8,
				damage_min_mult = 0.75,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				rays = 6
			}
		}

		local a_custom_pump_override = {
			supported = true,
			stats = {
				value = 9,
				spread = -5,
				total_ammo_mod = -33,
				damage = 30
			},
			custom_stats = {
				falloff_end_mult = 0.8,
				damage_min_mult = 0.6666667,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				rays = 6
			}
		}

	--Slugs
		local a_slug_auto_override = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_spam_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -3,
				total_ammo_mod = -33,
				damage = 15,
				recoil = -20,
				spread = 12,
				spread_multi = {1, 1},	
				suppression = -1,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",														
				rays = 1,
				armor_piercing_add = 0.8,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				can_shoot_through_enemy = true,
				can_shoot_through_wall = true,
				falloff_start_mult = 1.25,
				falloff_end_mult = 2.0,
				ads_speed_mult = 1
			}
		}

		local a_slug_semi_override = {
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_spam_desc",
			supported = true,
			stats = {
				value = 10,
				concealment = -3,
				total_ammo_mod = -25,
				damage = 15,
				spread = 12,
				spread_multi = {1, 1},	
				recoil = -20,
				moving_spread = 0
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",													
				rays = 1,
				armor_piercing_add = 0.8,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				can_shoot_through_enemy = true,
				can_shoot_through_wall = true,
				falloff_start_mult = 1.25,
				falloff_end_mult = 2.0,
				ads_speed_mult = 1
			}
		}
	
		local a_slug_pump_override = {
			supported = true,
			name_id = "bm_wp_upg_a_slug",
			desc_id = "bm_wp_upg_a_slug_desc",
			stats = {
				value = 10,
				concealment = -3,
				total_ammo_mod = -33,
				damage = 30,
				recoil = -20,
				spread = 12,
				spread_multi = {1, 1},	
				moving_spread = 0,
				suppression = -1
			},
			custom_stats = {				
				muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",										
				rays = 1,
				armor_piercing_add = 1,
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				can_shoot_through_enemy = true,
				can_shoot_through_shield = true,
				can_shoot_through_wall = true,
				falloff_start_mult = 1.25,
				falloff_end_mult = 2.0,
				ads_speed_mult = 1
			}
		}

	--FRAG-12
		local a_explosive_semi_override = {
			supported = true,
			stats = {
				value = 10,
				recoil = -25,
				spread = 5,
				total_ammo_mod = -50,
				concealment = -5,
				spread_multi = {1, 1},	
				damage = 45
			},
			custom_stats = {
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				bullet_class = "InstantExplosiveBulletBase",
				sms = 0.85
			}
		}

		local a_explosive_pump_override = {
			desc_id = "bm_wp_upg_a_explosive_desc_sc",
			supported = true,
			stats = {
				value = 10,
				total_ammo_mod = -50,
				recoil = -25,
				spread = 5,
				spread_multi = {1, 1},	
				concealment = -5,
				damage = 60
			},
			custom_stats = {
				ammo_pickup_max_mul = 0.8,
				ammo_pickup_min_mul = 0.8,
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				bullet_class = "InstantExplosiveBulletBase",
				sms = 0.85
			}
		}


--Vanilla Silencers
Hooks:PostHook(WeaponFactoryTweakData, "_init_silencers", "resmod_silencers", function(self)

	--The Bigger the Better
	self.parts.wpn_fps_upg_ns_ass_smg_large.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_large.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_large.has_description = true
	self.parts.wpn_fps_upg_ns_ass_smg_large.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_ass_smg_large.stats = deep_clone(muzzle_device.supp_c_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_large.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_large.perks = {"silencer"}
	
	--Medium Suppressor
	self.parts.wpn_fps_upg_ns_ass_smg_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_medium.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_medium.has_description = true
	self.parts.wpn_fps_upg_ns_ass_smg_medium.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_ass_smg_medium.stats = deep_clone(muzzle_device.supp_b_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_medium.perks = {"silencer"}
	
	--Low Profile Suppressor
	self.parts.wpn_fps_upg_ns_ass_smg_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_small.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_small.has_description = true
	self.parts.wpn_fps_upg_ns_ass_smg_small.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_ass_smg_small.stats = deep_clone(muzzle_device.supp_a_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_small.custom_stats = deep_clone(muzzle_device.muzzle_a_custom_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_small.perks = {"silencer"}
	
	--Monolith Suppressor
	self.parts.wpn_fps_upg_ns_pis_large.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_large.supported = true
	self.parts.wpn_fps_upg_ns_pis_large.has_description = true
	self.parts.wpn_fps_upg_ns_pis_large.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_large.stats = deep_clone(muzzle_device.supp_c_stats)
	self.parts.wpn_fps_upg_ns_pis_large.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)
	self.parts.wpn_fps_upg_ns_pis_large.perks = {"silencer"}

	--Standard Issue Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_medium.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium.has_description = true
	self.parts.wpn_fps_upg_ns_pis_medium.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_medium.stats = deep_clone(muzzle_device.supp_b_stats)
	self.parts.wpn_fps_upg_ns_pis_medium.perks = {"silencer"}

	--Size Doesn't Matter
	self.parts.wpn_fps_upg_ns_pis_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_small.supported = true
	self.parts.wpn_fps_upg_ns_pis_small.has_description = true
	self.parts.wpn_fps_upg_ns_pis_small.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_small.stats = deep_clone(muzzle_device.supp_a_stats)
	self.parts.wpn_fps_upg_ns_pis_small.custom_stats = deep_clone(muzzle_device.muzzle_a_custom_stats)
	self.parts.wpn_fps_upg_ns_pis_small.perks = {"silencer"}
	
	--Silent Killer Suppressor
	self.parts.wpn_fps_upg_ns_shot_thick.pcs = {
		10,
		20,
		30,
		40
	}	
	self.parts.wpn_fps_upg_ns_shot_thick.supported = true	
	self.parts.wpn_fps_upg_ns_shot_thick.has_description = true
	self.parts.wpn_fps_upg_ns_shot_thick.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_shot_thick.stats = deep_clone(muzzle_device.supp_b_stats)
	self.parts.wpn_fps_upg_ns_shot_thick.custom_stats = {}		
	self.parts.wpn_fps_upg_ns_shot_thick.perks = {"silencer"}	
	self.parts.wpn_fps_upg_ns_shot_thick.forbids = {
		"wpn_fps_upg_a_explosive"
	}
	
end)

--Vanilla Barrel Extensions
Hooks:PostHook(WeaponFactoryTweakData, "_init_nozzles", "resmod_nozzles", function(self)

	--Fire Breather Nozzle
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats = deep_clone(muzzle_device.muzzle_b_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.custom_stats = {
		muzzleflash = "effects/payday2/particles/weapons/big_762_auto_fps"
	}
		
	--Stubby Compensator
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.desc_id = "bm_wp_upg_flash_hider"
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.has_description = true
	--self.parts.wpn_fps_upg_ns_ass_smg_stubby.perks = { "silencer" }
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats = deep_clone(muzzle_device.muzzle_a_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats.suppression = 12
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.custom_stats = deep_clone(muzzle_device.muzzle_a_custom_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.custom_stats.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
		
	--The Tank Compensator	
	self.parts.wpn_fps_upg_ns_ass_smg_tank.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_tank.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats = deep_clone(muzzle_device.muzzle_c_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_tank.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)
	--self.parts.wpn_fps_upg_ns_ass_smg_tank.custom_stats.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"

	--Shark Teeth
	self.parts.wpn_fps_upg_ns_shot_shark.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_shot_shark.supported = true
	self.parts.wpn_fps_upg_ns_shot_shark.stats = deep_clone(muzzle_device.muzzle_b_stats)
	self.parts.wpn_fps_upg_ns_shot_shark.custom_stats = {}			

end)

--Vanilla Gadgets
Hooks:PostHook(WeaponFactoryTweakData, "_init_gadgets", "resmod_gadgets", function(self)

	self.parts.wpn_fps_addon_ris.unit = "units/pd2_dlc_sawp/weapons/wpn_fps_ass_groza_pts/wpn_fps_ass_groza_fl_adapter"
	--"units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_fl_adapter"
	--"units/pd2_dlc_berry/weapons/wpn_fps_snp_model70_pts/wpn_fps_snp_model70_fl_rail"
	--"units/pd2_dlc_sawp/weapons/wpn_fps_ass_groza_pts/wpn_fps_ass_groza_fl_adapter"
	--"units/pd2_dlc_atw/weapons/wpn_fps_snp_r700_pts/wpn_fps_snp_r700_fl_rail"
	--"units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_gadget_rail"

	--Assault Light
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.supported = true
	self.parts.wpn_fps_upg_fl_ass_smg_sho_surefire.stats = {
		value = 3
	}

	--Tactical Laser Module
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.supported = true
	self.parts.wpn_fps_upg_fl_ass_smg_sho_peqbox.stats = {
		value = 4
	}

	--Pocket Laser
	self.parts.wpn_fps_upg_fl_pis_laser.pcs = {
		10,	
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_laser.supported = true
	self.parts.wpn_fps_upg_fl_pis_laser.stats = {
		value = 4
	}

	--Tactical Pistol Light
	self.parts.wpn_fps_upg_fl_pis_tlr1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_tlr1.supported = true
	self.parts.wpn_fps_upg_fl_pis_tlr1.stats = {
		value = 3
	}

end)

--Vanilla Vertical Grips
Hooks:PostHook(WeaponFactoryTweakData, "_init_vertical_grips", "resmod_vertical_grips", function(self)

	--Gonna keep these mostly as is, since these are mostly custom

	--TAC Vertical Grip
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		pcs = {},
		fps_animation_weight = "vertical_grip",
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_tac",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_verticalgrip",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_verticalgrip/wpn_fps_upg_vg_ass_smg_verticalgrip",
		supported = true,
		stats = {
			value = 1,
			recoil = 4,
			concealment = -2
		}
	}
	
	--Stubby Vertical Grip
	self.parts.wpn_fps_upg_vg_ass_smg_stubby = {
		pcs = {},
		fps_animation_weight = "vertical_grip",
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_stubby",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_stubby",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_stubby/wpn_fps_upg_vg_ass_smg_stubby",
		supported = true,
		stats = {
			value = 4,
			recoil = 2,
			concealment = -1
		}
	}
	
	--AFG
	self.parts.wpn_fps_upg_vg_ass_smg_afg = {
		pcs = {},
		type = "vertical_grip",
		name_id = "bm_wp_upg_vg_afg",
		a_obj = "a_vg",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_vg_ass_smg_afg",
		unit = "units/payday2/weapons/wpn_fps_upg_vg_ass_smg_afg/wpn_fps_upg_vg_ass_smg_afg",
		supported = true,
		stats = {
			value = 2,
			spread = 1,				
			concealment = -1
		}
	}
	
	--Vanilla 'statless' variants for weapons that have vertical grips baseline
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_verticalgrip/wpn_third_upg_vg_ass_smg_verticalgrip"
	self.parts.wpn_fps_upg_vg_ass_smg_stubby.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_stubby/wpn_third_upg_vg_ass_smg_stubby"
	self.parts.wpn_fps_upg_vg_ass_smg_afg.third_unit = "units/payday2/weapons/wpn_third_upg_vg_ass_smg_afg/wpn_third_upg_vg_ass_smg_afg"
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip)
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.fps_animation_weight = nil
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla.pcs = nil
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_afg)
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_afg_vanilla.pcs = nil
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_stubby)
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla.fps_animation_weight = nil
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla.stats = nil
	self.parts.wpn_fps_upg_vg_ass_smg_stubby_vanilla.pcs = nil

end)

--Vanilla Sights
Hooks:PostHook(WeaponFactoryTweakData, "_init_sights", "resmod_sights", function(self)

	--Milspec Scope
	self.parts.wpn_fps_upg_o_specter.pcs = {
		10, 
		20,
		30, 
		40
	}
	self.parts.wpn_fps_upg_o_specter.has_description = true
	self.parts.wpn_fps_upg_o_specter.desc_id = "bm_wp_upg_o_4"
	self.parts.wpn_fps_upg_o_specter.supported = true
	self.parts.wpn_fps_upg_o_specter.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_specter.perks = {"scope"}
	--STANCE MODS
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_amcar = {
			translation = Vector3(0, 9, -0.1)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_s552 = {
			translation = Vector3(-0.05, 8, -2.15)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g36 = {
			translation = Vector3(-0.02, 2.7, -2.97)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_vhs = {
			translation = Vector3(-0.0, 9.3, -1.19)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_olympic = {
			translation = Vector3(0, 9, -0.1)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_famas = {
			translation = Vector3(0, 2.1, -6.25)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m4 = {
			translation = Vector3(0, 13.2, -0.55)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ak5 = {
			translation = Vector3(0.015, 14.2, -3.52)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_corgi = {
			translation = Vector3(-0.003, 1, -2.28)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_aug = {
			translation = Vector3(-0.003, 8.9, -2.79)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_flint = {
			translation = Vector3(-0.012, -4.2, -2.69)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_74 = {
			translation = Vector3(-0.006, -2, -3.04)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_hajk = {
			translation = Vector3(0, 10.4, -0.48)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_komodo = {
			translation = Vector3(0, 15, 0.09)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m16 = {
			translation = Vector3(0, 9, -0.1)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_l85a2 = {
			translation = Vector3(-0.01, 18.3, 1.879)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm_gold = {
			translation = Vector3(-0.006, -2, -3.04)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm = {
			translation = Vector3(-0.006, -2, -3.04)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_groza = {
			translation = Vector3(0, 6.8, -5.05),
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_akmsu = {
			translation = Vector3(-0.006, 2, -3.01)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_asval = {
			translation = Vector3(0, 14, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_fal = {
			translation = Vector3(-0.005, 10.5, -3.52)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_galil = {
			translation = Vector3(-0.005, 9, -3.21)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_scar = {
			translation = Vector3(-0.005, 5.2, -0.3)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_contraband = {
			translation = Vector3(-0.005, 3.2, -1.69)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m14 = {
			translation = Vector3(-0.02, 2, -3.85)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ching = {
			translation = Vector3(0, -2, -2.77)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_g3 = {
			translation = Vector3(0.03, 0.5, -3.395)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_shak12 = {
			translation = Vector3(0, -1.5, 1.585),
			rotation = Rotation(0, -0.5, 0)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_tti = {
			translation = Vector3(0, 9, -0.1)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_qbu88 = {
			translation = Vector3(0, -7.2, 0.3)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_winchester = {
			translation = Vector3(-0.004, -3.8, -3.36)
		}	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_r700 = {
			translation = Vector3(0, -0.6, -3.785)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_msr = {
			translation = Vector3(0, -1.5, -3.54)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_scout = {
			translation = Vector3(-0.005, -19.2, 0.6),
			rotation = Rotation(0, 0, 0)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_wa2000 = {
			translation = Vector3(0, 4.3, 0.76)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_siltstone = {
			translation = Vector3(-0.005, 14.7, -4.01)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_sbl = {
			translation = Vector3(-0.012, -0.5, -3.81)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_model70 = {
			translation = Vector3(0, 0.5, -4.03)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin = {
			translation = Vector3(0, -0.8, -4.28)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_desertfox = {
			translation = Vector3(0, -6.9, -3.95)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_r93 = {
			translation = Vector3(-0.005, 2, -3.76)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m95 = {
			translation = Vector3(0, 9.4, -3.82)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_saiga = {
			translation = Vector3(0.06, -2, -2.97)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_sko12 = {
			translation = Vector3(0, 8.2, -2.81)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_aa12 = {
			translation = Vector3(0, 12.2, 0.11)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_spas12 = {
			translation = Vector3(-0.164, 9, -3.93)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ben = {
			translation = Vector3(-0.002, 0.8, -3.23)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ultima = {
			translation = Vector3(-0.064, 8.7, -2.755),
			rotation = Rotation(0, -0.5, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_rota = {
			translation = Vector3(0, 2.2, -0.415)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_basset = {
			translation = Vector3(0, 2.5, -0.68)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_striker = {
			translation = Vector3(0, 5.9, -2.8)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_ksg = {
			translation = Vector3(0, 5.3, -1.315)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870 = {
			translation = Vector3(0.005, 1.5, -3.27)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_sho_m590 = {
			translation = Vector3(-0.26, 10.7, -4.25),
			rotation = Rotation(0, -0.45, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_serbu = {
			translation = Vector3(0, 6.7, -3.26)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_m37 = {
			translation = Vector3(-0.005, 14.5, -3.67),
			rotation = Rotation(0, -0.5, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_judge = {
			translation = Vector3(0.04, -6.5, -5.325)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_sub2000 = {
			translation = Vector3(-0.005, -4.8, -0.025)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_korth = {
			translation = Vector3(0.056, 3, -3.38),
			rotation = Rotation(-0.07, 0, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_rsh12 = {
			translation = Vector3(0.043, -11.7, -3.44)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_shatters_fury = {
			translation = Vector3(-0.03, -6, -4.62)
		}	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_rage = {
			translation = Vector3(-0.03, -6, -4.62)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_pis_deagle = {
			translation = Vector3(0, -14, -4.23),
			rotation = Rotation(0, -0.5, 0)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_p90 = {
			translation = Vector3(-0.005, 1.6, -3.028)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp7 = {
			translation = Vector3(0, 7.5, -2.82)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp9 = {
			translation = Vector3(0, 11.6, -3.47)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_cobray = {
			translation = Vector3(0, 9.2, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9 = {
			translation = Vector3(0, 6, -5)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_sr2 = {
			translation = Vector3(0, 17.2, -4.57)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_vityaz = {
			translation = Vector3(0.01, 8.5, -3.321)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal = {
			translation = Vector3(0, 17.8, -4)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_shepheard = {
			translation = Vector3(0, -1.2, -0.41)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_scorpion = {
			translation = Vector3(-0.005, -0.8, -5.19)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mp5 = {
			translation = Vector3(0, 9.4, -2.92)
		}
		
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_erma = {
			translation = Vector3(0.005, 5, -4.152)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_schakal = {
			translation = Vector3(0, 7.15, -2.81)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_polymer = {
			translation = Vector3(0, 10.8, -0.65)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_m45 = {
			translation = Vector3(0, -2.4, -3.925)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_sterling = {
			translation = Vector3(0, -6.5, -3.61)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_mac10 = {
			translation = Vector3(0, -6.3, -3.1)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_thompson = {
			translation = Vector3(-0.005, -12.5, -4.2)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_uzi = {
			translation = Vector3(0, 4.7, -5.1)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_tecci = {
			translation = Vector3(-0.005, 13.2, -1.68)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m249 = {
			translation = Vector3(0.003, 9.6, -3.415),
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_rpk = {
			translation = Vector3(0.05, -1.5, -2.99),
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_mg42 = {
			translation = Vector3(0.07, 24.7, -2.78 ),
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk21 = {
			translation = Vector3(0.002, 3.5, -3.23),
			rotation = Rotation(-0.05, -0.2, 0)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_hk51b = {
			translation = Vector3(-0.025, 10.4, -2.827),
			rotation = Rotation(0.0, -0.1, -0.625)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_par = {
			translation = Vector3(0.05, 5, -3.05), --NEEDS ADJUSTMENT LATER, IRONS NEED FIXING
			rotation = Rotation(0.15, -0.1, 0.5)
		}
		if WeaponTweakData.SetupAttachmentPoint then
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m60 = {
				translation = Vector3(-0.006, 14, -1.952),
				rotation = Rotation(-0.062, 0.13, 0)
			}
		else
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_lmg_m60 = {
				translation = Vector3(-0.01, 3, -1.1), --CHECK WITHOUT CAP AT SOME POINT
				rotation = Rotation(-0.062, 0.13, 0)
			}
		end
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_bow_elastic = {
			translation = Vector3(-0.003, 16, -1.5)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_bow_ecp = {
			translation = Vector3(-0.001, -1, -3.325)
		}
	
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_gre_m32 = {
			translation = Vector3(0, 12.5, -3.475)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_rpg7 = {
			translation = Vector3(-0.005, 18.7, 0.046)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_gre_slap = {
			translation = Vector3(-0.02, 5.4, -1.85)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_gre_arbiter = {
			translation = Vector3(-0.01, 5.4, -0.402)
		}
		self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_gre_ms3gl = {
			translation = Vector3(0.018, 12, 2.465),
			rotation = Rotation(0, -6, 0)
		}
	
		--CUSTOM WEAPS
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_ar18 = {
				translation = Vector3(0.012, 5, -3.525)
			}
	
		--CUSTOM WEAPS THAT NEED REALIGNMENT
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_mcx_spear = {
				translation = Vector3(-0.0, -0.5, -0.2),
				rotation = Rotation(0.11, -0.09, 0)
			}
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_l115 = {
				translation = Vector3(-0.02, -3, -3.521)
			}
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m200 = {
				translation = Vector3(0.0, -1, -4.03)
			}
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_m107cq = {
				translation = Vector3(-0.02, 5, -4.02)
			}
			self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_musket = {
				translation = Vector3(0, -15, -4.34)
			}


	--Military Red Dot
	self.parts.wpn_fps_upg_o_aimpoint.pcs = {
		10, 
		20,
		30, 
		40	
	}
	self.parts.wpn_fps_upg_o_aimpoint.has_description = true
	self.parts.wpn_fps_upg_o_aimpoint.desc_id = "bm_wp_upg_o_1_8"		
	self.parts.wpn_fps_upg_o_aimpoint.supported = true		
	self.parts.wpn_fps_upg_o_aimpoint.stats = {
		value = 8,
		zoom = 8
	}
	self.parts.wpn_fps_upg_o_aimpoint.perks = {"scope"}
	self.parts.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
		--Preorder Military Red Dot
		self.parts.wpn_fps_upg_o_aimpoint_2.pcs = {
			10, 
			20,
			30, 
			40	
		}
		self.parts.wpn_fps_upg_o_aimpoint_2.has_description = true
		self.parts.wpn_fps_upg_o_aimpoint_2.desc_id = "bm_wp_upg_o_1_8"		
		self.parts.wpn_fps_upg_o_aimpoint_2.supported = true		
		self.parts.wpn_fps_upg_o_aimpoint_2.stats = {
			value = 8,
			zoom = 8
		}
		self.parts.wpn_fps_upg_o_aimpoint_2.perks = {"scope"}
		self.parts.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_aimpoint.stance_mod)
		--Compact Tactical/Tech Force 90
		self.parts.wpn_fps_upg_o_tf90.pcs = {
			10, 
			20,
			30, 
			40
		}
		self.parts.wpn_fps_upg_o_tf90.has_description = true
		self.parts.wpn_fps_upg_o_tf90.desc_id = "bm_wp_upg_o_1_2"
		self.parts.wpn_fps_upg_o_tf90.supported = true
		self.parts.wpn_fps_upg_o_tf90.stats = {
			value = 8,
			zoom = 2
		}
		self.parts.wpn_fps_upg_o_tf90.perks = {"scope"}	
		self.parts.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_aimpoint.stance_mod)

	--Surgeon Sight
	self.parts.wpn_fps_upg_o_docter.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_docter.has_description = true
	self.parts.wpn_fps_upg_o_docter.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_docter.supported = true
	self.parts.wpn_fps_upg_o_docter.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_docter.perks = {"scope"}
	self.parts.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

	--Owl Glass/BelOMO PO4x24P
	self.parts.wpn_fps_upg_o_poe.pcs = {
		10, 
		20,
		30, 
		40	
	}
	self.parts.wpn_fps_upg_o_poe.has_description = true
	self.parts.wpn_fps_upg_o_poe.desc_id = "bm_wp_upg_o_4"		
	self.parts.wpn_fps_upg_o_poe.supported = true		
	self.parts.wpn_fps_upg_o_poe.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_poe.perks = {"scope"}
	self.parts.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)	
	
	--Holographic Sight
	self.parts.wpn_fps_upg_o_eotech.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_eotech.has_description = true
	self.parts.wpn_fps_upg_o_eotech.desc_id = "bm_wp_upg_o_1_5"			
	self.parts.wpn_fps_upg_o_eotech.supported = true			
	self.parts.wpn_fps_upg_o_eotech.stats = {
		value = 3,
		zoom = 5
	}
	self.parts.wpn_fps_upg_o_eotech.perks = {"scope"}
	self.parts.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_eotech.stance_mod) do
		for k, wep_id in pairs(sight_1_5x_offset.exclude) do
			if weap and i ~= wep_id and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	--The Professional's Choice Sight
	self.parts.wpn_fps_upg_o_t1micro.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_t1micro.desc_id = "bm_wp_upg_o_1_2"
	self.parts.wpn_fps_upg_o_t1micro.has_description = true		
	self.parts.wpn_fps_upg_o_t1micro.supported = true		
	self.parts.wpn_fps_upg_o_t1micro.stats = {
		value = 5,
		zoom = 2
	}
	self.parts.wpn_fps_upg_o_t1micro.perks = {"scope"}
	self.parts.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Marksman Sight
	self.parts.wpn_upg_o_marksmansight_rear.pcs = {
			10,
			20,
			30,
			40
		}
	self.parts.wpn_upg_o_marksmansight_rear.supported = true
	self.parts.wpn_upg_o_marksmansight_rear.stats = {
			value = 1
		}
	self.parts.wpn_upg_o_marksmansight_rear.perks = {"scope"}

	--Angled Sight
	self.parts.wpn_fps_upg_o_45iron.pcs = {}
	self.parts.wpn_fps_upg_o_45iron.desc_id = "bm_wp_upg_o_angled_desc"
	self.parts.wpn_fps_upg_o_45iron.has_description = true
	self.parts.wpn_fps_upg_o_45iron.supported = true
	self.parts.wpn_fps_upg_o_45iron.stats = {value = 1, gadget_zoom = 1}
	self.parts.wpn_fps_upg_o_45iron.perks = {"gadget"}
	self.parts.wpn_fps_upg_o_45iron.is_a_unlockable = true
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm = {
		translation = Vector3(-3.4, 5, -13.5),
		rotation = Rotation(0, 0, -45)
	}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_akm_gold = {
		translation = Vector3(-3.4, 5, -13.5),
		rotation = Rotation(0, 0, -45)
	}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_snp_winchester = {
		translation = Vector3(-5.56, -5, -14.78),
		rotation = Rotation(0, 0, -45)
	}		
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_amcar = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_74 = { translation = Vector3(-3.4, 5, -13.5),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m4 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_aug = { translation = Vector3(-3.65, 5, -11.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g36 = { translation = Vector3(-0.775, 10, -12.05),rotation = Rotation( 0.45, -0.5, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m14 = { translation = Vector3(-2.05, 0, -13.85),rotation = Rotation(0.3 ,-0.3, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_ak5 = { translation = Vector3(-1.4, 14, -12.9),rotation = Rotation(0.9, -1, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_m16 = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_olympic = { translation = Vector3(-2.85, 14, -10.4),rotation = Rotation(0.1, 0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_smg_akmsu = { translation = Vector3(-3.15, 5, -13.4),rotation = Rotation(0.1, -0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_s552 = { translation = Vector3(-3.2, 8, -12.5),rotation = Rotation(0.5 ,-0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_scar = { translation = Vector3(-1.65, 8, -9.9),rotation = Rotation(0.8, -0.8, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_fal = { translation = Vector3(-2.45, 10, -13.4),rotation = Rotation(0.7 ,-0.75, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_famas = { translation = Vector3(2.35, 6, -17),rotation = Rotation(-0.6, 2.2, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_galil = { translation = Vector3( -2.25,5,-13.2 ),rotation = Rotation(0.275 ,-0.2, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_g3 = { translation = Vector3( -0.7,8,-12.4 ),rotation = Rotation(0.75 ,-0.7, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_asval = { translation = Vector3( -1.9,18,-9.48 ),rotation = Rotation(0, -0, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_vhs = { translation = Vector3(-2, 8, -9.7),rotation = Rotation(0.4, -0.4, -45) }
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_l85a2 = { translation = Vector3( -4.45, 15, -8 ),rotation = Rotation(0.1 ,0.0, -45)}
	self.parts.wpn_fps_upg_o_45iron.stance_mod.wpn_fps_ass_sub2000 = { translation = Vector3( -4.25,-2, -10.8 ),rotation = Rotation(0, 0.1, -45)}

	--Shortdot Sight (Base Sniper Scope)
	self.parts.wpn_fps_upg_o_shortdot.has_description = true
	self.parts.wpn_fps_upg_o_shortdot.supported = true
	self.parts.wpn_fps_upg_o_shortdot.stats = {value = 0, zoom = 40}
	self.parts.wpn_fps_upg_o_shortdot.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_shortdot.perks = {"scope"}
	self.parts.wpn_fps_upg_o_shortdot.reticle_obj = nil
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m95 = {
		translation = Vector3(-0.0, -13.5, -4.58)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_msr = {
		translation = Vector3(0, -24, -4.29)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_r93 = {
		translation = Vector3(0, -20.5, -4.52)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_sbl = {
		translation = Vector3(-0.01, -23.5, -4.577)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin = {
		translation = Vector3(0, -42, -5.04)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_wa2000 = {
		translation = Vector3(0, -18, 0)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_desertfox = {
		translation = Vector3(0, -29.5, -4.7)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_tti = {
		translation = Vector3(0, -13.5, -0.855)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_qbu88 = {
		translation = Vector3(0, -30, -0.45)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_siltstone = {
		translation = Vector3(0, -8, -4.77)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_model70 = {
		translation = Vector3(0, -22, -4.79)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_r700 = {
		translation = Vector3(0, -23, -4.54)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_scout = {
		translation = Vector3(-0.001, -31.5, -0.122)
	}

	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m200 = {
		translation = Vector3(0.005, -20, -4.792)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_m107cq = {
		translation = Vector3(-0.015, -10, -4.778)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_k31 = {
		translation = Vector3(-0.012, -18, -4.8)
	}
	self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_l115 = {
		translation = Vector3(-0.018, -22, -4.275)
	}


	
	--Vanilla Shortdot
	self.parts.wpn_fps_upg_o_shortdot_vanilla = deep_clone(self.parts.wpn_fps_upg_o_shortdot)
	self.parts.wpn_fps_upg_o_shortdot_vanilla.supported = true
	self.parts.wpn_fps_upg_o_shortdot_vanilla.stats = {value = 0, zoom = 40}
	self.parts.wpn_fps_upg_o_shortdot_vanilla.reticle_obj = nil
	self.parts.wpn_fps_upg_o_shortdot_vanilla.dlc = nil

	--Theia Magnified Scope
	self.parts.wpn_fps_upg_o_leupold.pcs = {}
	self.parts.wpn_fps_upg_o_leupold.desc_id = "bm_wp_upg_o_6_range"
	self.parts.wpn_fps_upg_o_leupold.has_description = true
	self.parts.wpn_fps_upg_o_leupold.reticle_obj = nil
	self.parts.wpn_fps_upg_o_leupold.supported = true
	self.parts.wpn_fps_upg_o_leupold.stats = {
		value = 8,
		zoom = 50
	}
	self.parts.wpn_fps_upg_o_leupold.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_leupold.perks = {"scope"}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_m95 = {
		translation = Vector3(-0.005, -17.5, -4.68)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_msr = {
		translation = Vector3(0, -28.6, -4.3951)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_r93 = {
		translation = Vector3(-0.002, -24.7, -4.618)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_sbl = {
		translation = Vector3(-0.007, -27.5, -4.685)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_mosin = {
		translation = Vector3(-0.001, -46.6, -5.135)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_wa2000 = {
		translation = Vector3(0, -22.6, -0.1)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_model70 = {
		translation = Vector3(0, -26.2, -4.895)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_r700 = {
		translation = Vector3(0, -27.2, -4.645)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_desertfox = {
		translation = Vector3(0, -33.7, -4.80)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_tti = {
		translation = Vector3(0, -18, -0.955)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_qbu88 = {
		translation = Vector3(-0, -34.1, -0.555)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_scout = {
		translation = Vector3(-0, -38, -0)
	}
	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_siltstone = {
		translation = Vector3(0, -12.1, -4.8745)
	}

	self.parts.wpn_fps_upg_o_leupold.stance_mod.wpn_fps_snp_m107cq = {
		translation = Vector3(-0.015, -14.2, -4.879)
	}

end)

--DLC1 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc1", "resmod_content_dlc1", function(self)

	--See More Sight
	self.parts.wpn_fps_upg_o_cmore.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_cmore.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_cmore.has_description = true
	self.parts.wpn_fps_upg_o_cmore.supported = true
	self.parts.wpn_fps_upg_o_cmore.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_cmore.perks = {"scope"}
	self.parts.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

end)

--DLC2 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc2", "resmod_content_dlc2", function(self)

	--Single Fire Lock
	self.parts.wpn_fps_upg_i_singlefire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_i_singlefire.has_description = true
	self.parts.wpn_fps_upg_i_singlefire.supported = true
	self.parts.wpn_fps_upg_i_singlefire.stats = {
		value = 5,
		spread = 10
	}
	self.parts.wpn_fps_upg_i_singlefire.custom_stats = {
		rof_mult = 0.85,
		falloff_start_mult = 1.15,
		falloff_end_mult = 1.15
	}
	self.parts.wpn_fps_upg_i_singlefire.perks = {
		"fire_mode_single"
	}		
	self.parts.wpn_fps_upg_i_singlefire.forbids = {
		"wpn_fps_upg_extra_mp_lock"
	}

	--Auto Fire Lock
	self.parts.wpn_fps_upg_i_autofire.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_i_autofire.has_description = true
	self.parts.wpn_fps_upg_i_autofire.supported = true
	self.parts.wpn_fps_upg_i_autofire.stats = {
		value = 5,
		spread = -3,
		recoil = 6
	}
	self.parts.wpn_fps_upg_i_autofire.custom_stats = {
		falloff_start_mult = 0.85,
		falloff_end_mult = 0.85
	}			
	self.parts.wpn_fps_upg_i_autofire.perks = {
		"fire_mode_auto"
	}				
	self.parts.wpn_fps_upg_i_autofire.forbids = {
		"wpn_fps_upg_extra_mp_lock"
	}

	--Rubber Grip
	self.parts.wpn_fps_upg_m4_g_hgrip.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.supported = true
	self.parts.wpn_fps_upg_m4_g_hgrip.stats = {
		value = 6,
		recoil = 2,
		concealment = -1
	}
	self.parts.wpn_fps_upg_m4_g_hgrip.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}

	--Vanilla Rubber Grip
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla = deep_clone(self.parts.wpn_fps_upg_m4_g_hgrip)
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.stats = nil
	self.parts.wpn_fps_upg_m4_g_hgrip_vanilla.pcs = nil

	--Straight Grip
	self.parts.wpn_fps_upg_m4_g_mgrip.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_mgrip.supported = true
	self.parts.wpn_fps_upg_m4_g_mgrip.custom_stats = {
		ads_speed_mult = 0.975
	}
	self.parts.wpn_fps_upg_m4_g_mgrip.stats = {
		value = 4,
		recoil = -2,
		concealment = 1
	}

end)

--DLC2Dec16 Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_dlc2_dec16", "resmod_content_dlc2_dec16", function(self)

	--Acough Optic Scope
	self.parts.wpn_fps_upg_o_acog.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_acog.reticle_obj = nil
	self.parts.wpn_fps_upg_o_acog.desc_id = "bm_wp_upg_o_4"
	self.parts.wpn_fps_upg_o_acog.has_description = true		
	self.parts.wpn_fps_upg_o_acog.supported = true		
	self.parts.wpn_fps_upg_o_acog.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_acog.perks = {"scope"}
	self.parts.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end

end)

--Gage Assignment Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_content_jobs", "resmod_content_jobs", function(self)

	--Bronco Scope Mount
	self.parts.wpn_fps_pis_rage_extra.pcs = {}
	self.parts.wpn_fps_pis_rage_extra.supported = true
	self.parts.wpn_fps_pis_rage_extra.stats = {value = 0}

	--Deagle Scope Mount
	self.parts.wpn_fps_pis_deagle_extra.pcs = {}
	self.parts.wpn_fps_pis_deagle_extra.supported = true
	self.parts.wpn_fps_pis_deagle_extra.stats = {value = 0}

	--Competition Foregrip
	self.parts.wpn_fps_upg_fg_jp.pcs = {}
	self.parts.wpn_fps_upg_fg_jp.adds = { "wpn_fps_m4_uupg_fg_rail_ext_dummy" }
	self.parts.wpn_fps_upg_fg_jp.supported = true
	self.parts.wpn_fps_upg_fg_jp.stats = {
		value = 5,
		spread = 1,
		recoil = -2
	}
	
	--Gazelle Rail
	self.parts.wpn_fps_upg_fg_smr.pcs = {}
	self.parts.wpn_fps_upg_fg_smr.adds = { "wpn_fps_m4_uupg_fg_rail_ext_dummy" }
	self.parts.wpn_fps_upg_fg_smr.supported = true
	self.parts.wpn_fps_upg_fg_smr.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}

	--CAR Quadstacked Mag
	self.parts.wpn_fps_upg_m4_m_quad.pcs = {}
	self.parts.wpn_fps_upg_m4_m_quad.supported = true
	self.parts.wpn_fps_upg_m4_m_quad.custom_stats = {
		ads_speed_mult = 1.1,
		sms = 0.9
	}
	self.parts.wpn_fps_upg_m4_m_quad.stats = {
		value = 3,
		concealment = -4,
		reload = -3,
		extra_ammo = 30
	}
	
	--Battleproven Handguard
	self.parts.wpn_fps_upg_ak_fg_tapco.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_tapco.supported = true
	self.parts.wpn_fps_upg_ak_fg_tapco.stats = {
		value = 5,
		recoil = 2,
		spread = -1
	}
	
	--Lightweight Rail
	self.parts.wpn_fps_upg_fg_midwest.pcs = {}
	self.parts.wpn_fps_upg_fg_midwest.supported = true
	self.parts.wpn_fps_upg_fg_midwest.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	--AK Slavic Dragon Barrel
	self.parts.wpn_fps_upg_ak_b_draco.pcs = {}
	self.parts.wpn_fps_upg_ak_b_draco.supported = true
	self.parts.wpn_fps_upg_ak_b_draco.stats = {
		value = 2,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_upg_ak_b_draco.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	
	--AK Quadstacked Mag
	self.parts.wpn_fps_upg_ak_m_quad.pcs = {}
	self.parts.wpn_fps_upg_ak_m_quad.supported = true
	self.parts.wpn_fps_upg_ak_m_quad.stats = {
		value = 3,
		concealment = -4,
		extra_ammo = 30,
		reload = -3
	}
	self.parts.wpn_fps_upg_ak_m_quad.custom_stats = {
		ads_speed_mult = 1.1,
		sms = 0.9
	}
	
	--AK Rubber Grip
	self.parts.wpn_fps_upg_ak_g_hgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_hgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_hgrip.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ak_g_hgrip.custom_stats = {}
	self.parts.wpn_fps_upg_ak_g_hgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}
	
	--AK Plastic Grip
	self.parts.wpn_fps_upg_ak_g_pgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_pgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_pgrip.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_upg_ak_g_pgrip.custom_stats = {
		ads_speed_mult = 0.975
	}		
	self.parts.wpn_fps_upg_ak_g_pgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}

	--AK Wood Grip
	self.parts.wpn_fps_upg_ak_g_wgrip.pcs = {}
	self.parts.wpn_fps_upg_ak_g_wgrip.supported = true
	self.parts.wpn_fps_upg_ak_g_wgrip.stats = {
		value = 2,
		spread = -1,
		recoil = 2
	}
	self.parts.wpn_fps_upg_ak_g_wgrip.custom_stats = {}		
	self.parts.wpn_fps_upg_ak_g_wgrip.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}

	--Competitor's Compensator
	self.parts.wpn_fps_upg_ass_ns_jprifles.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_jprifles.supported = true
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats = deep_clone(muzzle_device.muzzle_c_duo_stats)
	self.parts.wpn_fps_upg_ass_ns_jprifles.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)
	
	--Funnel of Fun Nozzle
	self.parts.wpn_fps_upg_ass_ns_linear.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_linear.supported = true
	self.parts.wpn_fps_upg_ass_ns_linear.stats = deep_clone(muzzle_device.muzzle_c_alt_stats)
	self.parts.wpn_fps_upg_ass_ns_linear.custom_stats = {
		--muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
	}

	--Tactical Compensator
	self.parts.wpn_fps_upg_ass_ns_surefire.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_surefire.supported = true
	self.parts.wpn_fps_upg_ass_ns_surefire.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_upg_ass_ns_surefire.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
	--Flash Hider
	self.parts.wpn_fps_upg_pis_ns_flash.pcs = {}
	self.parts.wpn_fps_upg_pis_ns_flash.supported = true
	self.parts.wpn_fps_upg_pis_ns_flash.has_description = true
	self.parts.wpn_fps_upg_pis_ns_flash.desc_id = "bm_wp_upg_flash_hider"
	--self.parts.wpn_fps_upg_pis_ns_flash.perks = { "silencer" }
	self.parts.wpn_fps_upg_pis_ns_flash.stats = deep_clone(muzzle_device.muzzle_a_stats)
	self.parts.wpn_fps_upg_pis_ns_flash.stats = deep_clone(muzzle_device.muzzle_a_stats)
	self.parts.wpn_fps_upg_pis_ns_flash.custom_stats = deep_clone(muzzle_device.muzzle_a_custom_stats)
	self.parts.wpn_fps_upg_pis_ns_flash.custom_stats.muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence_fps"
	
	--King's Crown Compensator
	self.parts.wpn_fps_upg_shot_ns_king.pcs = {}
	self.parts.wpn_fps_upg_shot_ns_king.supported = true
	self.parts.wpn_fps_upg_shot_ns_king.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_upg_shot_ns_king.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
		
	--Asepsis Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium_slim.pcs = {}
	self.parts.wpn_fps_upg_ns_pis_medium_slim.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium_slim.has_description = true
	self.parts.wpn_fps_upg_ns_pis_medium_slim.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_medium_slim.stats = deep_clone(muzzle_device.supp_b_alt_stats)
	self.parts.wpn_fps_upg_ns_pis_medium_slim.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	self.parts.wpn_fps_upg_ns_pis_medium_slim.perks = {"silencer"}
	
	--Military Laser Module
	self.parts.wpn_fps_upg_fl_ass_peq15.pcs = {}
	self.parts.wpn_fps_upg_fl_ass_peq15.supported = true
	self.parts.wpn_fps_upg_fl_ass_peq15.stats = {
		value = 5
	}
	self.parts.wpn_fps_upg_fl_ass_peq15.perks = {"gadget"}

	--Wide Stock
	self.parts.wpn_fps_upg_m4_s_crane.pcs = {}
	self.parts.wpn_fps_upg_m4_s_crane.supported = true
	self.parts.wpn_fps_upg_m4_s_crane.stats = deep_clone(stocks.adj_rec_stats)
	self.parts.wpn_fps_upg_m4_s_crane.custom_stats = deep_clone(stocks.adj_rec_stats)
	
	--War-Torn Stock
	self.parts.wpn_fps_upg_m4_s_mk46.pcs = {}
	self.parts.wpn_fps_upg_m4_s_mk46.supported = true
	self.parts.wpn_fps_upg_m4_s_mk46.stats = deep_clone(stocks.adj_rec_stats)
	self.parts.wpn_fps_upg_m4_s_mk46.custom_stats = deep_clone(stocks.adj_rec_stats)

	--Pistol Red Dot Sight
	self.parts.wpn_fps_upg_o_rmr.pcs = {}
	self.parts.wpn_fps_upg_o_rmr.has_description = true
	self.parts.wpn_fps_upg_o_rmr.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_rmr.supported = true
	self.parts.wpn_fps_upg_o_rmr.stats = {
		value = 6,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_rmr.custom_stats = {disable_steelsight_stance = true}
	self.parts.wpn_fps_upg_o_rmr.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rmr.stance_mod.wpn_fps_pis_shatters_fury = {
		translation = Vector3(0, 0, -0.45)
	}

	--Compact Holosight
	self.parts.wpn_fps_upg_o_eotech_xps.pcs = {}
	self.parts.wpn_fps_upg_o_eotech_xps.has_description = true
	self.parts.wpn_fps_upg_o_eotech_xps.desc_id = "bm_wp_upg_o_1_5"	
	self.parts.wpn_fps_upg_o_eotech_xps.supported = true	
	self.parts.wpn_fps_upg_o_eotech_xps.stats = {
		value = 5,
		zoom = 5
	}
	self.parts.wpn_fps_upg_o_eotech_xps.perks = {"scope"}
	self.parts.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_eotech.stance_mod)
	
	--Speculator Sight
	self.parts.wpn_fps_upg_o_reflex.pcs = {}
	self.parts.wpn_fps_upg_o_reflex.has_description = true
	self.parts.wpn_fps_upg_o_reflex.desc_id = "bm_wp_upg_o_1_1"			
	self.parts.wpn_fps_upg_o_reflex.supported = true			
	self.parts.wpn_fps_upg_o_reflex.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_reflex.perks = {"scope"}
	self.parts.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_docter.stance_mod)
	
	--Trigonom Sight
	self.parts.wpn_fps_upg_o_rx01.pcs = {}
	self.parts.wpn_fps_upg_o_rx01.has_description = true
	self.parts.wpn_fps_upg_o_rx01.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_rx01.supported = true
	self.parts.wpn_fps_upg_o_rx01.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_rx01.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_docter.stance_mod)
	
	--Solar Sight
	self.parts.wpn_fps_upg_o_rx30.pcs = {}
	self.parts.wpn_fps_upg_o_rx30.has_description = true
	self.parts.wpn_fps_upg_o_rx30.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_rx30.supported = true
	self.parts.wpn_fps_upg_o_rx30.stats = {
		value = 5,
		zoom = 1
	}
	self.parts.wpn_fps_upg_o_rx30.perks = {"scope"}
	self.parts.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_docter.stance_mod)
	
	--Combat Sight
	self.parts.wpn_fps_upg_o_cs.pcs = {}
	self.parts.wpn_fps_upg_o_cs.has_description = true
	self.parts.wpn_fps_upg_o_cs.desc_id = "bm_wp_upg_o_1_8"		
	self.parts.wpn_fps_upg_o_cs.reticle_obj = nil
	self.parts.wpn_fps_upg_o_cs.supported = true
	self.parts.wpn_fps_upg_o_cs.stats = {
		value = 3,
		zoom = 8
	}
	self.parts.wpn_fps_upg_o_cs.perks = {"scope"}
	self.parts.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_aimpoint.stance_mod)

end)

--CAR-4
Hooks:PostHook(WeaponFactoryTweakData, "_init_m4", "resmod_m4", function(self)

	--Exotique Receiver
	self.parts.wpn_fps_m4_upper_reciever_edge.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_upper_reciever_edge.supported = true
	self.parts.wpn_fps_m4_upper_reciever_edge.forbids = { "wpn_fps_m4_upper_reciever_round_vanilla" }
	self.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_amcar_uupg_body_upperreciever = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
		a_obj = "a_o"
	}
	self.parts.wpn_fps_m4_upper_reciever_edge.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
		
	--(CAR) Long Barrel
	self.parts.wpn_fps_m4_uupg_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_long.supported = true
	self.parts.wpn_fps_m4_uupg_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_m4_uupg_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--(CAR) Short Barrel
	self.parts.wpn_fps_m4_uupg_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_short.supported = true
	self.parts.wpn_fps_m4_uupg_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_m4_uupg_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

	--(CAR/Para) Medium Barrel
	self.parts.wpn_fps_m4_uupg_b_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_medium.supported = true
	self.parts.wpn_fps_m4_uupg_b_medium.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_m4_uupg_b_medium.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--(CAR) Stealth Barrel
	self.parts.wpn_fps_m4_uupg_b_sd.pcs = {
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_b_sd.supported = true
	self.parts.wpn_fps_m4_uupg_b_sd.has_description = true
	self.parts.wpn_fps_m4_uupg_b_sd.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_m4_uupg_b_sd.stats = {
		value = 3,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_m4_uupg_b_sd.perks = {"silencer"}

	table.insert(self.parts.wpn_fps_m4_uupg_b_sd.forbids, "wpn_fps_m4_uupg_fg_rail_ext_dummy")
	table.insert(self.parts.wpn_fps_m4_uupg_b_sd.forbids, "wpn_fps_m4_uupg_fg_rail_m4a1")
	
	
	--Aftermarket Special Handguard
	self.parts.wpn_fps_m4_uupg_fg_lr300.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_fg_lr300.supported = true
	self.parts.wpn_fps_m4_uupg_fg_lr300.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	--Milspec Mag.
	self.parts.wpn_fps_m4_uupg_m_std.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_m_std.name_id = "bm_wp_upg_mil_sc"
	self.parts.wpn_fps_m4_uupg_m_std.supported = true
	self.parts.wpn_fps_m4_uupg_m_std.stats = {
		value = 1,
		extra_ammo = 10,
		reload = -2,
		concealment = -1
	}
	
	--Folding Stock
	self.parts.wpn_fps_m4_uupg_s_fold.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m4_uupg_s_fold.supported = true
	self.parts.wpn_fps_m4_uupg_s_fold.stats = deep_clone(stocks.adj_to_fold_stats)
	self.parts.wpn_fps_m4_uupg_s_fold.custom_stats = deep_clone(stocks.adj_to_fold_stats)
	
	--(CAR) Ergo Grip
	self.parts.wpn_fps_upg_m4_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_ergo.supported = true
	self.parts.wpn_fps_upg_m4_g_ergo.stats = {
		value = 3,
		spread = 1,
		recoil = -2
	}
	self.parts.wpn_fps_upg_m4_g_ergo.custom_stats = {}	

	--(CAR) Pro Grip
	self.parts.wpn_fps_upg_m4_g_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_g_sniper.supported = true
	self.parts.wpn_fps_upg_m4_g_sniper.stats = {
		value = 6,
		spread = 1,
		recoil = 2,
		concealment = -2
	}
	self.parts.wpn_fps_upg_m4_g_sniper.custom_stats = {}
	
	--(CAR) Drum Magazine 
	self.parts.wpn_fps_upg_m4_m_drum = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 100},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_drum",
		dlc = "sc",
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum",
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 70,
			reload = -6,
			concealment = -5
		},
		custom_stats = {
			ads_speed_mult = 1.125,
			sms = 0.8
		}
	}
	self.parts.wpn_fps_upg_m4_m_drum.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_m_drum"
	
	--(CAR) Tactical Mag.
	self.parts.wpn_fps_upg_m4_m_pmag.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_m_pmag.supported = true
	self.parts.wpn_fps_upg_m4_m_pmag.stats = {
		value = 3,
		recoil = -1,
		extra_ammo = -5,
		concealment = 1
	}
	
	--Vintage Mag.
	self.parts.wpn_fps_upg_m4_m_straight.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_m_straight.name_id = "bm_wp_upg_vintage_sc"
	self.parts.wpn_fps_upg_m4_m_straight.supported = true
	self.parts.wpn_fps_upg_m4_m_straight.stats = {
		value = 2,
		concealment = 1,
		reload = 3,
		extra_ammo = -10
	}
	self.parts.wpn_fps_upg_m4_m_straight.custom_stats = { 
		ads_speed_mult = 0.975
	}
	
	--Standard Stock
	self.parts.wpn_fps_upg_m4_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_s_standard.supported = true
	self.parts.wpn_fps_upg_m4_s_standard.stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	self.parts.wpn_fps_upg_m4_s_standard.custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)

	--Tactical Stock
	self.parts.wpn_fps_upg_m4_s_pts.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_m4_s_pts.supported = true
	self.parts.wpn_fps_upg_m4_s_pts.stats = deep_clone(stocks.adj_acc_stats)
	self.parts.wpn_fps_upg_m4_s_pts.custom_stats = deep_clone(stocks.adj_acc_stats)
		
	--Longbore (Exclusive Set)
	self.parts.wpn_fps_m4_upg_fg_mk12.pcs = {}
	self.parts.wpn_fps_m4_upg_fg_mk12.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_m4_upg_fg_mk12.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_m4_upg_fg_mk12.adds = {
		"wpn_fps_m4_uupg_fg_rail_ext_mk12"
	}
	self.parts.wpn_fps_m4_upg_fg_mk12.sound_switch = nil
	self.parts.wpn_fps_m4_upg_fg_mk12.forbids = { "wpn_fps_addon_ris" }
	self.parts.wpn_fps_m4_upg_fg_mk12.supported = true
	self.parts.wpn_fps_m4_upg_fg_mk12.stats = {
		value = 0
	}	
	self.parts.wpn_fps_m4_upg_fg_mk12.perks = nil
	self.parts.wpn_fps_m4_upg_fg_mk12.override = {
		--Hiding Rail Extensions
		wpn_fps_m4_uupg_fg_rail_ext = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		--Overriding barrels for the unique FG model
		wpn_fps_m4_uupg_b_medium_vanilla = {
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long",
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long"
		},
		wpn_fps_m4_uupg_b_short = {
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long",
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long"
		},		
		wpn_fps_m4_uupg_b_sd = {
			adds = {
				"wpn_fps_m4_upg_ns_mk12"
			},
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long",
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long"
		},	
		wpn_fps_m4_uupg_b_long = {
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_long",
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_long"
		},			
		--Now foregrips
		wpn_fps_m4_uupg_fg_rail = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12",
			adds = {},
			override = {}
		},		
		wpn_fps_m4_uupg_fg_lr300 = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12"
		},
		wpn_fps_upg_fg_jp = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12"
		},	
		wpn_fps_upg_fg_smr = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12"
		},		
		wpn_fps_upg_ass_m4_fg_moe = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12"
		},	
		wpn_fps_upg_ass_m4_fg_lvoa = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_fg_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_fg_mk12"
		},		
		--Suppressors replaced by unique suppressor
		wpn_fps_upg_ns_ass_smg_large = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_ns_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_ns_mk12"
		},	
		wpn_fps_upg_ns_ass_smg_medium = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_ns_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_ns_mk12"
		},	
		wpn_fps_upg_ns_ass_smg_small = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_ns_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_ns_mk12"
		},		
		wpn_fps_ass_shak12_ns_suppressor = {
			third_unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_third_m4_upg_ns_mk12",
			unit = "units/pd2_dlc_ja22/weapons/wpn_fps_m4_upg_mk12_pts/wpn_fps_m4_upg_ns_mk12"
		},			
		--Slight change to optics just cause of how huge the FG is
		wpn_fps_upg_o_specter = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_aimpoint = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_docter = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_eotech = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_t1micro = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_cmore = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_acog = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_cs = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_eotech_xps = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_reflex = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_rx01 = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_rx30 = {
			a_obj = "a_o_2"
		},
		wpn_fps_m4_uupg_o_flipup = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_spot = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_bmg = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_fc1 = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_uh = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_tf90 = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_o_poe = {
			a_obj = "a_o_2"
		},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_ass_peq15 = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_ass_laser = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_ass_utg = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_o_45rds = {
			a_obj = "a_o_2",
			stance_mod = {
				wpn_fps_ass_m4 = {
					translation = Vector3(-5.2, -3, -1.5),
					rotation = Rotation(-0, -0, -10)
				}
			}
		},
		wpn_fps_upg_o_45rds_v2 = {
			a_obj = "a_o_2",
			stance_mod = {
				wpn_fps_ass_m4 = {
					translation = Vector3(-5.35, -3, -1.8),
					rotation = Rotation(-0, -0, -10)
				}
			}
		},
		wpn_fps_upg_o_45steel = {
			a_obj = "a_o_2",
			stance_mod = {
				wpn_fps_ass_m4 = {
					translation = Vector3(-5.35, -1, -1.8),
					rotation = Rotation(-0, -0, -10)
				}
			}
		}		
	}
	--Longbore Suppressor
	self.parts.wpn_fps_m4_upg_ns_mk12.pcs = nil
	self.parts.wpn_fps_m4_upg_ns_mk12.supported = true
	self.parts.wpn_fps_m4_upg_ns_mk12.stats = {
		value = 0
	}	

	--M4A1 sights set up
	self.parts.fake_a_os = {
		a_obj = "a_fg",
		type = "foregrip",
		name_id = "bm_wp_aug_b_medium",
		unit = "units/payday2/weapons/wpn_fps_ass_aug_pts/wpn_fps_aug_b_medium",
		third_unit = "units/payday2/weapons/wpn_third_ass_aug_pts/wpn_third_ass_aug_b_medium",
		stats = {
			value = 1
		},
		visibility = {
			{
				objects = {
					g_medium = false,
				}
			}
		},
		adds = {
			"wpn_fps_ass_m4_ns_frontsight"
		}
	}
	self.parts.wpn_fps_ass_m4_ns_frontsight = {
		a_obj = "a_ns",
		parent = "foregrip",
		type = "shitass",
		name_id = "bm_wp_m16_os_frontsight",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_os_frontsight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_os_frontsight",
		stats = {
			value = 1
		}
	}

	self.parts.wpn_fps_ass_m4_os_frontsight = {
		a_obj = "a_os",
		type = "sight_special",
		name_id = "bm_wp_m16_os_frontsight",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_os_frontsight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_os_frontsight",
		forbids = { "wpn_fps_m4_uupg_fg_rail_ext" },
		stats = {
			value = 1
		}
	}

	self.parts.wpn_fps_m4_uupg_fg_rail_ext_dummy = deep_clone(self.parts.wpn_fps_m4_uupg_fg_rail_ext)
	self.parts.wpn_fps_m4_uupg_fg_rail_ext_dummy.unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_b_standard"
	self.parts.wpn_fps_m4_uupg_fg_rail_ext_dummy.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_b_standard"
	self.parts.wpn_fps_m4_uupg_fg_rail_ext_dummy.visibility = {
		{
			objects = {
				g_barrel = false,
			}
		}
	}
	--CAR-4 Override Tables
	--[[
	self.wpn_fps_ass_m4.override.wpn_fps_upg_m4_s_standard_vanilla = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		stock_adapter = {}
	}
	--]]
	
	--CAR-4 Part Additions
	--Shorter Than Short stock
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_smg_olympic_s_short")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_smg_olympic_s_short")	
	
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_m16_s_fixed")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_ass_m16_s_fixed")		

	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_m4_uupg_fg_rail_m4a1")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_m4_uupg_fg_rail_m4a1")	

	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_i_m16a2")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_i_m16a2")	
	
	--Faster/Slower ROF mods (Unused)
	--[[
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_upg_i_faster_rof")	
	]]--

	self.wpn_fps_ass_m4_npc.override = deep_clone(self.wpn_fps_ass_m4.override)
	self.wpn_fps_ass_m4_npc.uses_parts = deep_clone(self.wpn_fps_ass_m4.uses_parts)

	self.wpn_fps_ass_m4_secondary = nil
	self.wpn_fps_ass_m4_secondary_npc = nil
end)

--STRYK 18c
Hooks:PostHook(WeaponFactoryTweakData, "_init_g18c", "resmod_g18c", function(self)

	--Ventilated Compensator
	self.parts.wpn_fps_pis_g18c_co_1.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_co_1.supported = true
	self.parts.wpn_fps_pis_g18c_co_1.stats = deep_clone(muzzle_device.muzzle_b_stats)
	
	--Velocity Compensator
	self.parts.wpn_fps_pis_g18c_co_comp_2.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_co_comp_2.supported = true
	self.parts.wpn_fps_pis_g18c_co_comp_2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_g18c_co_comp_2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
	--Default Mag.
	self.parts.wpn_fps_pis_g18c_m_mag_17rnd.bullet_objects = {
		amount = 1,
		prefix = "g_bullet_"
	}
	
	--(STRYK 18c) Extended Mag.
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 16,
		concealment = -2,
		reload = -3
	}
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.bullet_objects = {
		amount = 1,
		prefix = "g_bullet_"
	}
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.custom_stats = {
		ads_speed_mult = 1.05
	}

	--(STRYK 18c) Stock
	self.parts.wpn_fps_pis_g18c_s_stock.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_s_stock.supported = true
	self.parts.wpn_fps_pis_g18c_s_stock.stats = deep_clone(stocks.add_adj_stats)
	self.parts.wpn_fps_pis_g18c_s_stock.custom_stats = deep_clone(stocks.add_adj_stats)
	
	--(STRYK 18c) Ergo Grip
	self.parts.wpn_fps_pis_g18c_g_ergo.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_g18c_g_ergo.supported = true
	self.parts.wpn_fps_pis_g18c_g_ergo.stats = {
		value = 4,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_pis_g18c_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	self.parts.wpn_fps_pis_g18c_b_standard.animations.fire_steelsight = "recoil"

	
	--STRYK 18c Part Additions
	--Single/Autofire Locks
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_singlefire")	
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_autofire")		

	--Faster/Slower ROF mods (Unused)
	--[[
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_pis_g18c.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_pis_g18c_npc.uses_parts, "wpn_fps_upg_i_faster_rof")	
	]]--
	
	self.wpn_fps_pis_g18c_npc.uses_parts = deep_clone(self.wpn_fps_pis_g18c.uses_parts)

	self.wpn_fps_pis_g18c_primary = nil
	self.wpn_fps_pis_g18c_primary_npc = nil

end)

--AMCAR
Hooks:PostHook(WeaponFactoryTweakData, "_init_amcar", "resmod_amcar", function(self)

	self.parts.wpn_fps_amcar_uupg_body_upperreciever.stance_mod = {
		wpn_fps_ass_amcar = { translation = Vector3(0, -7, 0) }
	}

	--AMCAR Override Tables
	--[[
	self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_s_standard_vanilla = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid",
		stock_adapter = {}
	}
	--]]

	--AMCAR Add Tables
	self.wpn_fps_ass_amcar.adds.wpn_fps_m4_upper_reciever_edge = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_fg_rail_ext"
	}
	self.wpn_fps_ass_amcar.adds.wpn_fps_upg_ass_m4_upper_reciever_ballos = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_fg_rail_ext"
	}
	self.wpn_fps_ass_amcar.adds.wpn_fps_upg_ass_m4_upper_reciever_core = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_fg_rail_ext"
	}

	--AMCAR Default Blueprint, making it use the 30 rounder by default
	self.wpn_fps_ass_amcar.default_blueprint[5] = "wpn_fps_m4_uupg_m_std_vanilla"	
	
	--AMCAR Part Table
	self.wpn_fps_ass_amcar.uses_parts[49] = "wpn_fps_m4_uupg_m_std_vanilla"	
	self.wpn_fps_ass_amcar.uses_parts[50] = "wpn_fps_upg_m4_m_straight"
	
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_s_fold")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_m16_s_fixed")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_s_short")	
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_m_drum")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core")
	
	self.wpn_fps_ass_amcar_npc.default_blueprint = deep_clone(self.wpn_fps_ass_amcar.default_blueprint)	
	self.wpn_fps_ass_amcar_npc.uses_parts = deep_clone(self.wpn_fps_ass_amcar.uses_parts)	
end)

--AMR-16 
Hooks:PostHook(WeaponFactoryTweakData, "_init_m16", "resmod_m16", function(self)


	self.parts.wpn_fps_m16_fg_standard.adds = { "wpn_fps_ass_m4_os_frontsight" }

	--(AMR-16) Tactical Handguard
	self.parts.wpn_fps_m16_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m16_fg_railed.supported = true
	self.parts.wpn_fps_m16_fg_railed.adds = { "wpn_fps_ass_m4_os_frontsight" }
	self.parts.wpn_fps_m16_fg_railed.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}

	--Blast From the Past Handguard
	self.parts.wpn_fps_m16_fg_vietnam.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_m16_fg_vietnam.supported = true
	self.parts.wpn_fps_m16_fg_vietnam.adds = { "wpn_fps_ass_m4_os_frontsight" }
	self.parts.wpn_fps_m16_fg_vietnam.stats = {
		value = 3,
		recoil = -4,
		concealment = 2
	}

	self.parts.wpn_fps_ass_m16_o_handle_sight.stance_mod = {
		wpn_fps_ass_m16 = { translation = Vector3(0, -7, 0) },
		wpn_fps_ass_amcar = { translation = Vector3(0, -7, 0) },
		wpn_fps_smg_olympic = { translation = Vector3(0, -7, 0) }
	}

	--Overriding these
	self.wpn_fps_ass_m16.adds = {}
	self.wpn_fps_ass_m16.override = {}
		
	--M16 Default Blueprint, making it use the 30 rounder by default
	self.wpn_fps_ass_m16.default_blueprint[4] = "wpn_fps_m4_uupg_m_std_vanilla"	
	
	--M16 Part Table
	self.wpn_fps_ass_m16.uses_parts[11] = "wpn_fps_upg_m4_m_straight"
	self.wpn_fps_ass_m16.uses_parts[14] = "wpn_fps_m4_uupg_m_std_vanilla"

	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_m4_uupg_s_fold = {
		stats = deep_clone(stocks.fixed_to_folder_stats),
		custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_ass_contraband_s_tecci = {
		stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_smg_olympic_s_short = {
		stats = deep_clone(stocks.remove_fixed_stats),
		custom_stats = deep_clone(stocks.remove_fixed_stats)
	}
	self.wpn_fps_ass_m16.override.wpn_fps_ass_m16_s_op = {
		stats = deep_clone(stocks.fixed_acc_stats),
		custom_stats = deep_clone(stocks.fixed_acc_stats)
	}
	



	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_m4_uupg_s_fold")
	table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_m4_uupg_s_fold")		
	
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_upg_m4_s_standard")		
	
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_upg_m4_s_pts")	

	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_smg_olympic_s_short")
	table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_smg_olympic_s_short")			
	
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_i_m16a2")
	table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_upg_i_m16a2")	
	
	self.wpn_fps_ass_m16_npc.uses_parts = deep_clone(self.wpn_fps_ass_m16.uses_parts)


end)

--Para
Hooks:PostHook(WeaponFactoryTweakData, "_init_olympic", "resmod_olympic", function(self)

	--Default Handguard
	self.parts.wpn_fps_smg_olympic_fg_olympic.adds = {"wpn_fps_ass_m4_os_frontsight"}
	self.parts.wpn_fps_smg_olympic_fg_olympic.forbids = {"wpn_fps_ass_m16_os_frontsight"}

	--(Para) Railed Handguard
	self.parts.wpn_fps_smg_olympic_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_olympic_fg_railed.supported = true
	self.parts.wpn_fps_smg_olympic_fg_railed.adds = {"wpn_fps_ass_m4_os_frontsight"}
	self.parts.wpn_fps_smg_olympic_fg_railed.forbids = {"wpn_fps_ass_m16_os_frontsight"}
	self.parts.wpn_fps_smg_olympic_fg_railed.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--Shorter Than Short Stock
	self.parts.wpn_fps_smg_olympic_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_olympic_s_short.supported = true
	self.parts.wpn_fps_smg_olympic_s_short.stats = deep_clone(stocks.remove_adj_stats)
	self.parts.wpn_fps_smg_olympic_s_short.custom_stats = deep_clone(stocks.remove_adj_stats)

	self.wpn_fps_smg_olympic.override = self.wpn_fps_smg_olympic.override or {}

	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_m4_uupg_s_fold = {
		stats = deep_clone(stocks.nocheeks_to_folder_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_folder_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_smg_olympic_s_short = {
		stats = deep_clone(stocks.remove_nocheeks_stats),
		custom_stats = deep_clone(stocks.remove_nocheeks_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_ass_contraband_s_tecci = {
		stats = {},
		custom_stats = {}
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_ass_tecci_s_minicontra = {
		stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_ass_m16_s_fixed = {
		stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	}
	self.wpn_fps_smg_olympic.override.wpn_fps_ass_m16_s_op = {
		stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats)
	}

	self.wpn_fps_smg_olympic.override.wpn_fps_m4_uupg_b_medium.override = {
		wpn_fps_smg_olympic_fg_olympic = {
			unit = "units/payday2/weapons/wpn_fps_ass_amcar_pts/wpn_fps_amcar_uupg_fg_amcar",
			third_unit = "units/payday2/weapons/wpn_third_ass_amcar_pts/wpn_third_amcar_uupg_fg_amcar",
			adds = {"fake_a_os"},
			forbids = {"wpn_fps_ass_m16_os_frontsight"}
		},
		wpn_fps_smg_olympic_fg_railed = {
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
			adds = {"fake_a_os"},
			forbids = {"wpn_fps_ass_m16_os_frontsight"}
		},
		wpn_fps_upg_smg_olympic_fg_lr300 = {
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_lr300",
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_lr300",
			forbids = {"wpn_fps_ass_m16_os_frontsight"},
			override = {
				wpn_fps_ass_m16_o_handle_sight = {
					unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup",
					third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup",
					stance_mod = {
						wpn_fps_smg_olympic = {
							translation = Vector3(0,-4,0.44)
						}
					}
				}
			}
		}
	}
	

	--Para Default Blueprint, making it use the 30 rounder by default
	self.wpn_fps_smg_olympic.default_blueprint[3] = "wpn_fps_m4_uupg_m_std_vanilla"	
	
	--Para Part Table
	self.wpn_fps_smg_olympic.uses_parts[13] = "wpn_fps_upg_m4_m_straight"
	self.wpn_fps_smg_olympic.uses_parts[16] = "wpn_fps_m4_uupg_m_std_vanilla"
	
	table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_m4_uupg_s_fold")
	table.insert(self.wpn_fps_smg_olympic_npc.uses_parts, "wpn_fps_m4_uupg_s_fold")	
	table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_ass_m16_s_fixed")
	table.insert(self.wpn_fps_smg_olympic_npc.uses_parts, "wpn_fps_ass_m16_s_fixed")			
		
	self.wpn_fps_smg_olympic_npc.override = deep_clone(self.wpn_fps_smg_olympic.override)
	self.wpn_fps_smg_olympic_npc.uses_parts = deep_clone(self.wpn_fps_smg_olympic.uses_parts)

	self.wpn_fps_smg_olympic_primary = nil
	self.wpn_fps_smg_olympic_primary_npc = nil
end)

--Shared AK Parts
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak_parts", "resmod_ak_parts", function(self)

	--Default Handguard
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod = { 
		wpn_fps_ass_akm = {
			translation = Vector3(-0.006, -2, -3.145)
		},
		wpn_fps_ass_akm_gold = {
			translation = Vector3(-0.006, -2, -3.145)
		},
		wpn_fps_ass_74 = {
			translation = Vector3(-0.006, -2, -3.145)
		}
	}
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_upg_ak_fg_standard.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_upg_ak_fg_standard.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	--Railed Wooden Grip
	self.parts.wpn_upg_ak_fg_combo2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_fg_combo2.supported = true
	self.parts.wpn_upg_ak_fg_combo2.stats = {
		value = 3,
		concealment = -1,
		spread = 1
	}
	
	--The Tactical Russian Handguard
	self.parts.wpn_upg_ak_fg_combo3.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_fg_combo3.supported = true
	self.parts.wpn_upg_ak_fg_combo3.stats = {
		value = 5,
		spread = 1,
		recoil = 2,
		concealment = -2
	}
	
	--(AK) Drum Mag
	self.parts.wpn_upg_ak_m_drum = {
		pcs = {},
		fps_animation_weight = "drum_mag",
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_upg_ak_m_drum",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum",
		dlc = "sc",
		supported = true,
		stats = {
			value = 5,
			concealment = -5,
			extra_ammo = 45,
			reload = -6
		},
		custom_stats = {
			ads_speed_mult = 1.125,
			sms = 0.8
		}
	}
	self.parts.wpn_upg_ak_m_drum.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_drum"
	self.parts.wpn_upg_ak_m_drum_vanilla = deep_clone(self.parts.wpn_upg_ak_m_drum)
	self.parts.wpn_upg_ak_m_drum_vanilla.stats = nil
	self.parts.wpn_upg_ak_m_drum_vanilla.pcs = nil	
	
	--(AK) Folding Stock
	self.parts.wpn_upg_ak_s_folding.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_folding.supported = true
	self.parts.wpn_upg_ak_s_folding.stats = deep_clone(stocks.folder_to_nocheeks_stats)
	self.parts.wpn_upg_ak_s_folding.custom_stats = deep_clone(stocks.folder_to_nocheeks_stats)
	
	--Wooden Sniper Stock
	self.parts.wpn_upg_ak_s_psl.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_psl.supported = true
	self.parts.wpn_upg_ak_s_psl.stats = deep_clone(stocks.nocheeks_to_thumb_stats)
	self.parts.wpn_upg_ak_s_psl.custom_stats = deep_clone(stocks.nocheeks_to_thumb_stats)
	self.parts.wpn_upg_ak_s_psl.override = {
		wpn_fps_snp_flint_s_adapter = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		},
		wpn_fps_ass_flint_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		},	
		wpn_fps_smg_coal_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		}	
	}
	self.parts.wpn_upg_ak_s_psl.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_wgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_rk3"
	}
	
	--(AK) Folding Stock
	self.parts.wpn_upg_ak_s_skfoldable.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_upg_ak_s_skfoldable.supported = true
	self.parts.wpn_upg_ak_s_skfoldable.stats = deep_clone(stocks.nocheeks_to_folder_stats)
	self.parts.wpn_upg_ak_s_skfoldable.custom_stats = deep_clone(stocks.nocheeks_to_folder_stats)

end)

--AK
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak74", "resmod_ak74", function(self)

	--AK74 Overrides Table
	self.wpn_fps_ass_74.override = self.wpn_fps_ass_74.override or {}
	
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava = nil -- fuck

	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ak_s_solidstock = {
		stats = deep_clone(stocks.folder_to_fixed_rec3_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
	}
	self.wpn_fps_ass_74.override.wpn_upg_ak_s_psl = {
		stats = deep_clone(stocks.folder_to_thumb_stats),
		custom_stats = deep_clone(stocks.folder_to_thumb_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ak_s_empty = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}
	self.wpn_fps_ass_74.override.wpn_fps_upg_ak_s_polymerstock = {
		stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)
	}
	self.wpn_fps_ass_74.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}

	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_lmg_rpk_m_ban")

	--No Stock
	--table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_upg_ak_s_nostock")
	--table.insert(self.wpn_fps_ass_74_npc.uses_parts, "wpn_upg_ak_s_nostock")

	self.wpn_fps_ass_74_npc.uses_parts = deep_clone(self.wpn_fps_ass_74.uses_parts)	

	self.wpn_fps_ass_74_secondary = nil
	self.wpn_fps_ass_74_secondary_npc = nil
end)

--AK 7.62
Hooks:PostHook(WeaponFactoryTweakData, "_init_akm", "resmod_akm", function(self)

	--AKM Overrides Table
	self.wpn_fps_ass_akm.override = self.wpn_fps_ass_akm.override or {}

	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_ass_akm.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.wpn_fps_ass_akm.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}

	--Drum Mag
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_lmg_rpk_m_ban")
	
	--Plastic Stock
	table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	
	--No Stock
	--table.insert(self.wpn_fps_ass_akm.uses_parts, "wpn_upg_ak_s_nostock")
	--table.insert(self.wpn_fps_ass_akm_npc.uses_parts, "wpn_upg_ak_s_nostock")

	self.wpn_fps_ass_akm_npc.uses_parts = deep_clone(self.wpn_fps_ass_akm.uses_parts)
end)

--Gold AK 7.62)
Hooks:PostHook(WeaponFactoryTweakData, "_init_akm_gold", "resmod_akm_gold", function(self)

	self.parts.wpn_upg_ak_s_folding_vanilla_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding_gold_thq")
	self.parts.wpn_upg_ak_s_folding_vanilla_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_s_folding_gold")

	self.parts.wpn_fps_ak_bolt_gold = {
		name_id = "bm_wp_ak_s_skfoldable",
		--unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_fps_ak_bolt",
		unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_fps_ak_bolt_gold",
		a_obj = "a_bolt",
		type = "drag_handle"
	}
	self.parts.wpn_fps_ak_bolt_gold.thq_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold_thq")
	self.parts.wpn_fps_ak_bolt_gold.material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold")
	self.parts.wpn_fps_ak_bolt_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold_thq")
	self.parts.wpn_fps_ak_bolt_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold")

	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold.adds = {
		"wpn_fps_ak_bolt_gold"
	}
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold_thq")
	self.parts.wpn_fps_ass_ak_body_lowerreceiver_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_ak_body_lowerreceiver_gold")

	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_body_upperreceiver_gold_thq")
	self.parts.wpn_fps_ass_akm_body_upperreceiver_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_body_upperreceiver_gold")

	self.parts.wpn_upg_ak_m_akm_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold_thq")
	self.parts.wpn_upg_ak_m_akm_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm_gold")

	self.parts.wpn_upg_ak_fg_standard_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard_gold_thq")
	self.parts.wpn_upg_ak_fg_standard_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_fg_standard_gold")

	self.parts.wpn_fps_ass_akm_b_standard_gold.cc_thq_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_b_standard_gold_thq")
	self.parts.wpn_fps_ass_akm_b_standard_gold.cc_material_config = Idstring("units/payday2/weapons/wpn_fps_ass_akm_gold_pts/wpn_fps_ass_akm_b_standard_gold")

	--Gold AKM Overrides Table
	self.wpn_fps_ass_akm_gold.override = self.wpn_fps_ass_akm_gold.override or {}

	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_ass_akm_gold.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.wpn_fps_ass_akm_gold.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}
	--Drum Mag
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_lmg_rpk_m_ban")

	--Plastic Stock
	table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_akm_gold_npc.uses_parts, "wpn_fps_lmg_rpk_s_standard")	

	--No Stock
	--table.insert(self.wpn_fps_ass_akm_gold.uses_parts, "wpn_upg_ak_s_nostock")
	--table.insert(self.wpn_fps_ass_akm_gold_npc.uses_parts, "wpn_upg_ak_s_nostock")
	
	self.wpn_fps_ass_akm_gold_npc.uses_parts = deep_clone(self.wpn_fps_ass_akm_gold.uses_parts)

end)

--Krinkov
Hooks:PostHook(WeaponFactoryTweakData, "_init_akmsu", "resmod_akmsu", function(self)
	
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter = {
		a_obj = "a_of",
		stance_mod = { 
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.006, -1, -3.335)
			}
		}
	}
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_aimpoint = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_aimpoint_2 = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_docter = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_eotech = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_t1micro = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_cmore = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_cs = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_eotech_xps = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_reflex = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_rx01 = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_rx30 = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_acog = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_spot = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_bmg = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_uh = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_fc1 = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_tf90 = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_poe = deep_clone(self.parts.wpn_fps_smg_akmsu_fg_standard.override.wpn_fps_upg_o_specter)

	--Moscow Special Rail
	self.parts.wpn_fps_smg_akmsu_fg_rail.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_smg_akmsu_fg_rail.supported = true
	self.parts.wpn_fps_smg_akmsu_fg_rail.stats = {
		value = 5, 
		spread = 2, 
		concealment = -2
	}

	self.wpn_fps_smg_akmsu.override = self.wpn_fps_smg_akmsu.override or {}

	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_smg_akmsu.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}
	self.wpn_fps_smg_akmsu.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}

	--table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_upg_ak_s_nostock")
	--table.insert(self.wpn_fps_smg_akmsu_npc.uses_parts, "wpn_upg_ak_s_nostock")	

	table.insert(self.wpn_fps_smg_akmsu.uses_parts, "wpn_lmg_rpk_m_ban")

	self.wpn_fps_smg_akmsu_npc.override = deep_clone(self.wpn_fps_smg_akmsu.override)
	self.wpn_fps_smg_akmsu_npc.uses_parts = deep_clone(self.wpn_fps_smg_akmsu.uses_parts)

	self.wpn_fps_smg_akmsu_primary = nil
	self.wpn_fps_smg_akmsu_primary_npc = nil
end)

--Izhma 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_saiga", "resmod_saiga", function(self)

	--(Izhma) The Tactical Russian Rail
	self.parts.wpn_upg_saiga_fg_lowerrail.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_upg_saiga_fg_lowerrail.stats = {
		value = 5,
		spread = 1,
		recoil = 2,
		concealment = -2
	}

	self.parts.wpn_upg_saiga_fg_standard.override = {}

	self.parts.wpn_upg_saiga_fg_lowerrail.supported = true
	self.parts.wpn_upg_saiga_fg_lowerrail.stats = {
		value = 2,
		recoil = 4,
		concealment = -2
	}
	self.parts.wpn_upg_saiga_fg_lowerrail.custom_stats = nil
	
	--(Izhma) Drum Mag
	self.parts.wpn_upg_saiga_m_20rnd = {
		pcs = {},
		fps_animation_weight = "drum_mag",
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_upg_saiga_m_20rnd",
		unit = "units/payday2/weapons/wpn_fps_shot_saiga_pts/wpn_upg_saiga_m_20rnd",
		supported = true,
		stats = {
			value = 1, 
			extra_ammo = 15,
			reload = -6, 
			concealment = -5
		},
		custom_stats = {
			ads_speed_mult = 1.125,
			sms = 0.8
		}
	}
	self.parts.wpn_upg_saiga_m_20rnd.third_unit = "units/payday2/weapons/wpn_third_shot_saiga_pts/wpn_third_saiga_m_20rnd"
	
	--Izhma Override Table
	self.wpn_fps_shot_saiga.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {
			a_obj = "a_or",
			forbids = table.list_add(self.parts.wpn_upg_o_marksmansight_rear_vanilla.forbids, {"wpn_fps_upg_o_ak_scopemount"})
		},
		wpn_upg_o_marksmansight_front = {a_obj = "a_of"},
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,
		wpn_fps_upg_a_custom_free = a_custom_semi_override,
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override,
		wpn_fps_ass_akm_body_upperreceiver_vanilla = {
			unit = "units/payday2/weapons/wpn_fps_ass_74_pts/wpn_fps_ass_74_body_upperreceiver",
			third_unit = "units/payday2/weapons/wpn_third_ass_74_pts/wpn_third_ass_74_body_upperreceiver"
		}
	}

	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_shot_saiga.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats),
		adds = {
			"wpn_upg_ak_g_standard"
		}
	}

	--Izhma Part Additions
	--Drum Mag
	table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_saiga_m_20rnd")
	table.insert(self.wpn_fps_shot_saiga_npc.uses_parts, "wpn_upg_saiga_m_20rnd")	

	--table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_upg_ak_s_nostock")
	--table.insert(self.wpn_fps_shot_saiga_npc.uses_parts, "wpn_upg_ak_s_nostock")

	--table.insert(self.wpn_fps_shot_saiga.uses_parts, "wpn_fps_upg_ak_fg_tapco")
	--table.insert(self.wpn_fps_shot_saiga_npc.uses_parts, "wpn_fps_upg_ak_fg_tapco")	

	self.wpn_fps_shot_saiga_npc.override = deep_clone(self.wpn_fps_shot_saiga.override)
	self.wpn_fps_shot_saiga_npc.uses_parts = deep_clone(self.wpn_fps_shot_saiga.uses_parts)

end)

--AK5
Hooks:PostHook(WeaponFactoryTweakData, "_init_ak5", "resmod_ak5", function(self)

	--Karbin Ceres Handguard
	self.parts.wpn_fps_ass_ak5_fg_ak5c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_fg_ak5c.supported = true
	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats = {
		value = 2,
		concealment = -2,
		recoil = 4
	}
	
	--Belgian Heat Handguard
	self.parts.wpn_fps_ass_ak5_fg_fnc.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_fg_fnc.supported = true
	self.parts.wpn_fps_ass_ak5_fg_fnc.has_description = false
	self.parts.wpn_fps_ass_ak5_fg_fnc.custom_stats = { funco_chan = true }
	self.parts.wpn_fps_ass_ak5_fg_fnc.stats = {
		value = 3,
		spread = 1,
		recoil = -4,
		concealment = 1
	}

	--Bertil Stock
	self.parts.wpn_fps_ass_ak5_s_ak5b.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_s_ak5b.supported = true
	self.parts.wpn_fps_ass_ak5_s_ak5b.stance_mod = nil
	self.parts.wpn_fps_ass_ak5_s_ak5b.stats = {
		value = 2,
		spread = 1,
		recoil = -2
	}
	
	--Caesar Stock
	self.parts.wpn_fps_ass_ak5_s_ak5c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ak5_s_ak5c.supported = true
	self.parts.wpn_fps_ass_ak5_s_ak5c.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	self.wpn_fps_ass_ak5.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_ass_ak5_npc.stock_adapter = "wpn_upg_ak_s_adapter"

	if not self.wpn_fps_ass_ak5.override then
		self.wpn_fps_ass_ak5.override = {}
	end

	self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_ass_ak5.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}

	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_m4_s_mk46")	
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_ass_ak5.uses_parts, "wpn_fps_sho_sko12_stock")

	self.wpn_fps_ass_ak5_npc.uses_parts = deep_clone(self.wpn_fps_ass_ak5.uses_parts)
end)

--UAR
Hooks:PostHook(WeaponFactoryTweakData, "_init_aug", "resmod_aug", function(self)

	--(UAR) Long Barrel
	self.parts.wpn_fps_aug_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_b_long.supported = true
	self.parts.wpn_fps_aug_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_aug_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--(UAR) Short Barrel
	self.parts.wpn_fps_aug_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_b_short.supported = true
	self.parts.wpn_fps_aug_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_aug_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

	--A3 Tactical Foregrip
	self.parts.wpn_fps_aug_fg_a3.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_aug_fg_a3.supported = true
	self.parts.wpn_fps_aug_fg_a3.stats = {
		value = 2,
		spread = 1,
		recoil = 2,
		concealment = -2
	}

	self.wpn_fps_ass_aug.override = self.wpn_fps_ass_aug.override or {}

	self.wpn_fps_ass_aug.override.wpn_fps_upg_vg_ass_smg_stubby = {
		stats = {
			recoil = -2,
			concealment = 1
		}
	}
	self.wpn_fps_ass_aug.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			value = 0
		}
	}
	
	--UAR Default Blueprint, disabling Vertical Grips
	self.wpn_fps_ass_aug.default_blueprint[3] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"	
	
	self.wpn_fps_ass_aug.uses_parts[18] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"	
	--self.wpn_fps_ass_aug.uses_parts[19] = "wpn_fps_upg_vg_ass_smg_stubby_vanilla"	
	self.wpn_fps_ass_aug.uses_parts[20] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"	
	
	self.wpn_fps_ass_aug_npc.uses_parts = deep_clone(self.wpn_fps_ass_aug.uses_parts)

	self.wpn_fps_ass_aug_secondary = nil
	self.wpn_fps_ass_aug_secondary_npc = nil
end)

--JP36
Hooks:PostHook(WeaponFactoryTweakData, "_init_g36", "resmod_g36", function(self)

	--Compact Foregrip
	self.parts.wpn_fps_ass_g36_fg_c.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_fg_c.supported = true
	self.parts.wpn_fps_ass_g36_fg_c.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_ass_g36_fg_c.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}
	
	--Polizei Special Foregrip
	self.parts.wpn_fps_ass_g36_fg_ksk.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_fg_ksk.supported = true
	self.parts.wpn_fps_ass_g36_fg_ksk.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--(JP36) Solid Stock
	self.parts.wpn_fps_ass_g36_s_kv.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_s_kv.supported = true
	self.parts.wpn_fps_ass_g36_s_kv.stats = deep_clone(stocks.folder_to_adj_rec_stats)
	self.parts.wpn_fps_ass_g36_s_kv.custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	
	--(JP36) Sniper Stock
	self.parts.wpn_fps_ass_g36_s_sl8.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_g36_s_sl8.supported = true
	self.parts.wpn_fps_ass_g36_s_sl8.stats = deep_clone(stocks.folder_to_thumb_stats)
	self.parts.wpn_fps_ass_g36_s_sl8.custom_stats = deep_clone(stocks.folder_to_thumb_stats)

	self.wpn_fps_ass_g36.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_g36_npc.stock_adapter = "wpn_fps_upg_m4_s_adapter"

	self.wpn_fps_ass_g36.adds = self.wpn_fps_ass_g36.adds or {}
	self.wpn_fps_ass_g36.adds.wpn_fps_upg_m4_s_adapter = { 
		"wpn_fps_ass_g36_body_standard",
		"wpn_fps_ass_g36_g_standard"
	}
	
	self.wpn_fps_ass_g36.override = self.wpn_fps_ass_g36.override or {}
	self.wpn_fps_ass_g36.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_ass_g36.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}

	--table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_m_drum")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_snp_tti_s_vltor")

	self.wpn_fps_ass_g36_npc.uses_parts = deep_clone(self.wpn_fps_ass_g36.uses_parts)

end)

--Kobus 90
Hooks:PostHook(WeaponFactoryTweakData, "_init_p90", "resmod_p90", function(self)


	--Stop rail-on-rail action
	self.parts.wpn_fps_smg_p90_body_p90.forbids = { "wpn_fps_addon_ris" }

	--(Kobus 90) Long Barrel
	self.parts.wpn_fps_smg_p90_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_p90_b_long.supported = true
	self.parts.wpn_fps_smg_p90_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_smg_p90_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--(Kobus 90) Tan Body
	self.parts.wpn_fps_smg_p90_body_p90_tan = {
		pcs = {},
		type = "lower_reciever",
		name_id = "bm_wp_p90_body_p90_tan",
		a_obj = "a_body",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_p90_body_tan",
		unit = "units/payday2/weapons/wpn_fps_smg_p90_pts/wpn_fps_smg_p90_body_tan",
		supported = true,
		stats = {value = 0},
		animations = {
			reload = "reload",
			reload_not_empty = "reload_not_empty"
		},
		forbids = { "wpn_fps_addon_ris" }
	}
	self.parts.wpn_fps_smg_p90_body_p90_tan.third_unit = "units/payday2/weapons/wpn_third_smg_p90_pts/wpn_third_smg_p90_body_p90"
	
	--Kobus 90 Part Additions
	--Tan Body
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_smg_p90_body_p90_tan")
	table.insert(self.wpn_fps_smg_p90_npc.uses_parts, "wpn_fps_smg_p90_body_p90_tan")	
	
	self.wpn_fps_smg_p90_npc.uses_parts = deep_clone(self.wpn_fps_smg_p90.uses_parts)

end)

--M308
Hooks:PostHook(WeaponFactoryTweakData, "_init_m14", "resmod_m14", function(self)

	--Abraham Body
	self.parts.wpn_fps_ass_m14_body_ebr.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_ass_m14_body_ebr.supported = true
	self.parts.wpn_fps_ass_m14_body_ebr.stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	self.parts.wpn_fps_ass_m14_body_ebr.custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
		
	--Jaeger Body
	self.parts.wpn_fps_ass_m14_body_jae.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_ass_m14_body_jae.supported = true
	self.parts.wpn_fps_ass_m14_body_jae.stats = deep_clone(stocks.fixed_to_thumbhole_stats)
	self.parts.wpn_fps_ass_m14_body_jae.custom_stats = deep_clone(stocks.fixed_to_thumbhole_stats)
		
	--M308 Additional Parts	
	--Vertical Grips
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")	
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_vg_ass_smg_afg")		
	
	--ROF Mods (Unused)
	--[[
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_i_slower_rof")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_i_slower_rof")	
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_i_faster_rof")
	table.insert(self.wpn_fps_ass_m14_npc.uses_parts, "wpn_fps_upg_i_faster_rof")		
	]]--
	
	self.wpn_fps_ass_m14_npc.uses_parts = deep_clone(self.wpn_fps_ass_m14.uses_parts)
end)

--CMP
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp9", "resmod_mp9", function(self)

	--(CMP) Extended Mag
	self.parts.wpn_fps_smg_mp9_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp9_m_extended.supported = true
	self.parts.wpn_fps_smg_mp9_m_extended.stats = {
		value = 4,
		concealment = -1,
		reload = -1,
		extra_ammo = 10
	}
	self.parts.wpn_fps_smg_mp9_m_extended.custom_stats = {
		ads_speed_mult = 1.025
	}
	
	--(CMP) Skeletal Stock
	self.parts.wpn_fps_smg_mp9_s_skel.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp9_s_skel.supported = true
	self.parts.wpn_fps_smg_mp9_s_skel.stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
	self.parts.wpn_fps_smg_mp9_s_skel.custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)

	self.parts.wpn_fps_smg_mp9_body_mp9.adds = { "wpn_fps_upg_vg_ass_smg_stubby_vanilla" }
	self.parts.wpn_fps_smg_mp9_body_mp9.visibility = {
		{
			objects = {
				g_stubby_lod0 = false
			}
		}
	}

	if not self.wpn_fps_smg_mp9.override then
		self.wpn_fps_smg_mp9.override = {}
	end

	self.wpn_fps_smg_mp9.override.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		stats = {
			recoil = 2,
			concealment = -1
		},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
		}
	}
	self.wpn_fps_smg_mp9.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			recoil = 2,
			concealment = -1
		},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
		}
	}
	self.wpn_fps_smg_mp9.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}
	
	--CMP Part Table	
	self.wpn_fps_smg_mp9.uses_parts[38] = "wpn_fps_upg_vg_ass_smg_stubby_vanilla"

	table.insert(self.wpn_fps_smg_mp9.uses_parts, "wpn_fps_smg_mac10_s_no")
	table.insert(self.wpn_fps_smg_mp9.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_smg_mp9.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	
	self.wpn_fps_smg_mp9_npc.uses_parts = deep_clone(self.wpn_fps_smg_mp9.uses_parts)

end)

--Deagle
Hooks:PostHook(WeaponFactoryTweakData, "_init_deagle", "resmod_deagle", function(self)

	--(Deagle) Long Barrel
	self.parts.wpn_fps_pis_deagle_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_b_long.supported = true
	self.parts.wpn_fps_pis_deagle_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_deagle_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--OVERKILL Compensator
	self.parts.wpn_fps_pis_deagle_co_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_co_long.supported = true
	self.parts.wpn_fps_pis_deagle_co_long.stats = deep_clone(muzzle_device.muzzle_c_duo_stats)
	self.parts.wpn_fps_pis_deagle_co_long.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)
	
	--La Femme Compensator
	self.parts.wpn_fps_pis_deagle_co_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_co_short.supported = true
	self.parts.wpn_fps_pis_deagle_co_short.stats = deep_clone(muzzle_device.muzzle_b_stats)

	--(Deagle) Bling Grip
	self.parts.wpn_fps_pis_deagle_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_g_bling.supported = true
	self.parts.wpn_fps_pis_deagle_g_bling.stats = {
		value = 10,
		recoil = 2,
		concealment = -1
	}
	
	--(Deagle) Ergo Grip
	self.parts.wpn_fps_pis_deagle_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_g_ergo.supported = true
	self.parts.wpn_fps_pis_deagle_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	self.parts.wpn_fps_pis_deagle_g_ergo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	self.parts.wpn_fps_pis_deagle_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_deagle_m_extended.supported = true
	self.parts.wpn_fps_pis_deagle_m_extended.stats = {
		value = 5,
		concealment = -2,
		reload = -3,
		extra_ammo = 6
	}
	self.parts.wpn_fps_pis_deagle_m_extended.custom_stats = {
		ads_speed_mult = 1.05
	}
	
	--Deagle Additional Parts	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_deagle_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	
	self.wpn_fps_pis_deagle_npc.uses_parts = deep_clone(self.wpn_fps_pis_deagle.uses_parts)

	self.wpn_fps_pis_deagle_primary = nil
	self.wpn_fps_pis_deagle_primary_npc = nil
end)

--Compact-5
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp5", "resmod_mp5", function(self)

	--Sehr Kurze Barrel
	self.parts.wpn_fps_smg_mp5_fg_m5k.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_m5k.supported = true
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats.recoil = -4
	self.parts.wpn_fps_smg_mp5_fg_m5k.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	self.parts.wpn_fps_smg_mp5_fg_m5k.custom_stats.rof_mult = 1.125
	
	--Polizei Tactical Barrel
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.supported = true
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--The Ninja Barrel
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.supported = true
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.has_description = true
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.perks = {"silencer"}
	
	--(Compact-5) Drum Mag
	self.parts.wpn_fps_smg_mp5_m_drum = {
		pcs = {},
		fps_animation_weight = "drum_mag",
		type = "magazine",
		name_id = "bm_wp_aa12_mag_drum",
		a_obj = "a_m",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_mp5_m_drum",
		unit = "units/payday2/weapons/wpn_fps_smg_mp5_pts/wpn_fps_smg_mp5_m_drum",
		dlc = "sc",
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 40,
			concealment = -5,
			reload = -6
		},
		custom_stats = {
			ads_speed_mult = 1.125
		}
	}
	self.parts.wpn_fps_smg_mp5_m_drum.third_unit = "units/payday2/weapons/wpn_third_smg_mp5_pts/wpn_third_smg_mp5_m_drum"
	
	--(Compact-5) Adjustable Stock
	self.parts.wpn_fps_smg_mp5_s_adjust.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_s_adjust.supported = true
	self.parts.wpn_fps_smg_mp5_s_adjust.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	self.parts.wpn_fps_smg_mp5_s_adjust.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	
	--(Compact-5) Bare Essentials Stock
	self.parts.wpn_fps_smg_mp5_s_ring.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp5_s_ring.supported = true
	self.parts.wpn_fps_smg_mp5_s_ring.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_smg_mp5_s_ring.custom_stats = deep_clone(stocks.remove_fixed_stats)

	self.wpn_fps_smg_mp5.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_smg_mp5_npc.stock_adapter = "wpn_fps_upg_m4_s_adapter"

	self.wpn_fps_smg_mp5.override = self.wpn_fps_smg_mp5.override or {}

	self.wpn_fps_smg_mp5.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_smg_mp5.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			recoil = 4,
			concealment = -2
		},
		fps_animation_weight = "vertical_grip"
	}

	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_mp5.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	table.insert(self.wpn_fps_smg_mp5_npc.uses_parts, "wpn_fps_smg_schakal_vg_surefire")

	self.wpn_fps_smg_mp5_npc.uses_parts = deep_clone(self.wpn_fps_smg_mp5.uses_parts)

end)

--Crosskill
Hooks:PostHook(WeaponFactoryTweakData, "_init_colt_1911", "resmod_1911", function(self)

	--Long Vented Slide
	self.parts.wpn_fps_pis_1911_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_b_long.supported = true
	self.parts.wpn_fps_pis_1911_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_1911_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--Vented Slide
	self.parts.wpn_fps_pis_1911_b_vented.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_b_vented.supported = true
	self.parts.wpn_fps_pis_1911_b_vented.stats = {
		value = 3,
		spread = -1,
		recoil = 2
	}

	--Punisher Compensator
	self.parts.wpn_fps_pis_1911_co_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_co_1.supported = true
	self.parts.wpn_fps_pis_1911_co_1.stats = deep_clone(muzzle_device.muzzle_b_stats)
	
	--Aggressor Compensator
	self.parts.wpn_fps_pis_1911_co_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_co_2.supported = true
	self.parts.wpn_fps_pis_1911_co_2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_1911_co_2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
	--Bling Grip
	self.parts.wpn_fps_pis_1911_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_g_bling.supported = true
	self.parts.wpn_fps_pis_1911_g_bling.stats = {
		value = 10,
		recoil = 2,
		concealment = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_1911_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_g_ergo.supported = true
	self.parts.wpn_fps_pis_1911_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	self.parts.wpn_fps_pis_1911_g_ergo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	--12rnd Mag.
	self.parts.wpn_fps_pis_1911_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_1911_m_extended.supported = true
	self.parts.wpn_fps_pis_1911_m_extended.stats = {
		value = 3,
		concealment = -1,
		extra_ammo = 4,
		reload = -1
	}
	
	--fix for static ironsights while ADS
	self.wpn_fps_pis_1911.animations = {
		reload = "reload", 
		fire = "recoil", 
		fire_steelsight = "recoil", 
		magazine_empty = "last_recoil"
	}

	self.wpn_fps_pis_1911_primary = nil
	self.wpn_fps_pis_1911_primary_npc = nil
end)

--Mark 10
Hooks:PostHook(WeaponFactoryTweakData, "_init_mac10", "resmod_mac10", function(self)

	--Railed Handguard
	self.parts.wpn_fps_smg_mac10_body_ris.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_body_ris.supported = true
	self.parts.wpn_fps_smg_mac10_body_ris.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	table.insert(self.parts.wpn_fps_smg_mac10_body_ris.forbids, "wpn_fps_smg_pm9_fl_adapter")

	--Extended Mag.
	self.parts.wpn_fps_smg_mac10_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_m_extended.supported = true
	self.parts.wpn_fps_smg_mac10_m_extended.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 10,
		reload = -2
	}
	self.parts.wpn_fps_smg_mac10_m_extended.custom_stats = {
		ads_speed_mult = 1.05
	}

	--Skeletal Stock
	self.parts.wpn_fps_smg_mac10_s_skel.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mac10_s_skel.supported = true
	self.parts.wpn_fps_smg_mac10_s_skel.stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	self.parts.wpn_fps_smg_mac10_s_skel.custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)

	self.wpn_fps_smg_mac10.override = self.wpn_fps_smg_mac10.override or {}

	self.wpn_fps_smg_mac10.override.wpn_fps_smg_pm9_fl_adapter = { a_obj = "a_vg" }
	self.wpn_fps_smg_mac10.override.wpn_fps_smg_schakal_vg_surefire = { stats = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.stats) }

	self.wpn_fps_smg_mac10.adds = self.wpn_fps_smg_mac10.adds or {}

	self.wpn_fps_smg_mac10.adds.wpn_fps_upg_vg_ass_smg_stubby = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_mac10.adds.wpn_fps_upg_vg_ass_smg_verticalgrip = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_mac10.adds.wpn_fps_upg_vg_ass_smg_afg = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_mac10.adds.wpn_fps_smg_schakal_vg_surefire = { "wpn_fps_smg_pm9_fl_adapter" }

	
	table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_smg_mac10_s_no")
	table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	--table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_upg_i_eye")
	
	self.wpn_fps_smg_mac10_npc.adds = deep_clone(self.wpn_fps_smg_mac10.adds)	
	self.wpn_fps_smg_mac10_npc.override = deep_clone(self.wpn_fps_smg_mac10.override)	
	self.wpn_fps_smg_mac10_npc.uses_parts = deep_clone(self.wpn_fps_smg_mac10.uses_parts)	

	
end)

--Reinfeld 880
Hooks:PostHook(WeaponFactoryTweakData, "_init_r870", "resmod_r870", function(self)
	
	--Shell Rack
	self.parts.wpn_fps_shot_r870_body_rack.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_body_rack.supported = true
	self.parts.wpn_fps_shot_r870_body_rack.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	self.parts.wpn_fps_shot_r870_body_rack.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}	

	--Zombie Hunter Pump
	self.parts.wpn_fps_shot_r870_fg_wood.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_fg_wood.supported = true
	self.parts.wpn_fps_shot_r870_fg_wood.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}

	--Extended Mag.
	self.parts.wpn_fps_shot_r870_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_m_extended.supported = true
	self.parts.wpn_fps_shot_r870_m_extended.custom_stats = {
		ads_speed_mult = 1.025
	}
	self.parts.wpn_fps_shot_r870_m_extended.stats = {
		value = 7,
		concealment = -1,
		extra_ammo = 2
	}
	self.parts.wpn_fps_shot_r870_m_extended.custom_stats = {
		ads_speed_mult = 1.025
	}
	
	--Muldon Stock
	self.parts.wpn_fps_shot_r870_s_folding.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_folding.supported = true
	self.parts.wpn_fps_shot_r870_s_folding.stats = deep_clone(stocks.fixed_to_folded_stats)
	self.parts.wpn_fps_shot_r870_s_folding.custom_stats = deep_clone(stocks.fixed_to_folded_stats)
	
	--Short Enough Tactical Stock
	self.parts.wpn_fps_shot_r870_s_nostock_big.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_nostock_big.supported = true
	self.parts.wpn_fps_shot_r870_s_nostock_big.stats = {
		value = 5,
		spread = -3,
		recoil = -6,
		concealment = 6
	}
	self.parts.wpn_fps_shot_r870_s_nostock_big.custom_stats = deep_clone(stocks.remove_fixed_stats)

	--Short Enough Stock
	self.parts.wpn_fps_shot_r870_s_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_nostock.supported = true
	self.parts.wpn_fps_shot_r870_s_nostock.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_shot_r870_s_nostock.custom_stats = deep_clone(stocks.remove_fixed_stats)
	
	--Government Issue Tactical Stock
	self.parts.wpn_fps_shot_r870_s_solid_big.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_r870_s_solid_big.supported = true
	self.parts.wpn_fps_shot_r870_s_solid_big.stats = {
		value = 5,
		spread = -1,
		recoil = 2
	}
	
	--???
	self.parts.wpn_fps_shot_r870_s_solid_single.supported = true
	self.parts.wpn_fps_shot_r870_s_solid_single.stats = {
		value = 2,
		recoil = 4,
		concealment = -2
	}
	self.parts.wpn_fps_shot_r870_s_solid_single.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	
	--Override Table
	self.wpn_fps_shot_r870.override = {
		wpn_fps_upg_a_slug = a_slug_pump_override,
		wpn_fps_upg_a_custom = a_custom_pump_override,	
		wpn_fps_upg_a_custom_free = a_custom_pump_override,			
		wpn_fps_upg_a_explosive = a_explosive_pump_override,
		wpn_fps_upg_a_rip = a_rip_pump_override,
		wpn_fps_upg_a_piercing = a_piercing_pump_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
	}
	
	self.wpn_fps_shot_r870.uses_parts[18] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[19] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[43] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[44] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[45] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[53] = "resmod_dummy"
	self.wpn_fps_shot_r870.uses_parts[63] = "resmod_dummy"
		
	table.insert(self.wpn_fps_shot_r870.uses_parts, "wpn_fps_shot_r870_s_folding_ext")
	table.insert(self.wpn_fps_shot_r870_npc.uses_parts, "wpn_fps_shot_r870_s_folding_ext")		
	
	self.wpn_fps_shot_r870_npc.uses_parts = deep_clone(self.wpn_fps_shot_r870.uses_parts)

end)

--Locomotive 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_serbu", "resmod_serbu", function(self)
	
	--Extended Mag.
	self.parts.wpn_fps_shot_shorty_m_extended_short.pcs = {
		10,		
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_m_extended_short.supported = true
	self.parts.wpn_fps_shot_shorty_m_extended_short.stats = {
		value = 1, 
		extra_ammo = 2, 
		concealment = -1
	}
	self.parts.wpn_fps_shot_shorty_m_extended_short.custom_stats = {
		ads_speed_mult = 1.025
	}

	--Tactical Shorty Stock
	self.parts.wpn_fps_shot_shorty_s_nostock_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_s_nostock_short.supported = true
	self.parts.wpn_fps_shot_shorty_s_nostock_short.stats = {
		value = 3,
		spread = -1,
		recoil = 2
	}

	--Standard Stock
	--self.parts.wpn_fps_shot_r870_s_solid.pcs = {}
	self.parts.wpn_fps_shot_r870_s_solid.supported = true
	self.parts.wpn_fps_shot_r870_s_solid.stats = {
		value = 1
	}
	self.parts.wpn_fps_shot_r870_s_solid.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	
	--Police Shorty Stock
	self.parts.wpn_fps_shot_shorty_s_solid_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_shorty_s_solid_short.supported = true
	self.parts.wpn_fps_shot_shorty_s_solid_short.stats = deep_clone(stocks.add_fixed_rec_stats)
	self.parts.wpn_fps_shot_shorty_s_solid_short.custom_stats = deep_clone(stocks.add_fixed_rec_stats)
	
	--Vanilla No-stock
	--self.parts.wpn_fps_shot_r870_s_nostock_vanilla.unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_s_solid"
	--self.parts.wpn_fps_shot_r870_s_nostock_vanilla.third_unit = "units/payday2/weapons/wpn_third_shot_r870_pts/wpn_third_shot_r870_s_solid"

	--Locomotive 12g override table
	self.wpn_fps_shot_serbu.override = {
		wpn_fps_upg_a_slug = a_slug_pump_override,
		wpn_fps_upg_a_custom = a_custom_pump_override,	
		wpn_fps_upg_a_custom_free = a_custom_pump_override,			
		wpn_fps_upg_a_explosive = a_explosive_pump_override,
		wpn_fps_upg_a_rip = a_rip_pump_override,
		wpn_fps_upg_a_piercing = a_piercing_pump_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override			
	}

	self.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_s_solid = {
		stats = deep_clone(stocks.add_fixed_stats),
		custom_stats = deep_clone(stocks.add_fixed_stats)
	}
	self.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_s_folding_ext = {
		stats = deep_clone(stocks.add_nocheeks_stats),
		custom_stats = deep_clone(stocks.add_nocheeks_stats)
	}
	self.wpn_fps_shot_serbu.override.wpn_fps_shot_r870_s_folding = {
		stats = deep_clone(stocks.add_folded_stats),
		custom_stats = deep_clone(stocks.add_folded_stats)
	}
	
	self.wpn_fps_shot_serbu.uses_parts[17] = "resmod_dummy"
	self.wpn_fps_shot_serbu.uses_parts[18] = "resmod_dummy"
	--self.wpn_fps_shot_serbu.uses_parts[22] = "resmod_dummy"
	self.wpn_fps_shot_serbu.uses_parts[45] = "resmod_dummy"
	self.wpn_fps_shot_serbu.uses_parts[46] = "resmod_dummy"
	self.wpn_fps_shot_serbu.uses_parts[47] = "resmod_dummy"
	self.wpn_fps_shot_serbu.uses_parts[52] = "resmod_dummy"	
	self.wpn_fps_shot_serbu.uses_parts[62] = "resmod_dummy"	
		
	--table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_s_nostock")
	--table.insert(self.wpn_fps_shot_serbu_npc.uses_parts, "wpn_fps_shot_r870_s_nostock")		
	
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_shot_r870_s_folding_ext")
	table.insert(self.wpn_fps_shot_serbu_npc.uses_parts, "wpn_fps_shot_r870_s_folding_ext")		
	
	self.wpn_fps_shot_serbu_npc.uses_parts = deep_clone(self.wpn_fps_shot_serbu.uses_parts)

end)

--Chimano 88
Hooks:PostHook(WeaponFactoryTweakData, "_init_g17", "resmod_g17", function(self)
		
	--Chimano 88 Part Additions
	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_g_ergo")

	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	self.wpn_fps_pis_g17_npc.uses_parts = deep_clone(self.wpn_fps_pis_g17.uses_parts)
		
end)

--Bernetti 9
Hooks:PostHook(WeaponFactoryTweakData, "_init_b92fs", "resmod_b92fs", function(self)
		
	--The Professional Compensator
	self.parts.wpn_fps_pis_beretta_co_co1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_co_co1.supported = true
	self.parts.wpn_fps_pis_beretta_co_co1.stats = deep_clone(muzzle_device.muzzle_b_stats)
	
	--The Competitor Compensator
	self.parts.wpn_fps_pis_beretta_co_co2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_co_co2.supported = true
	self.parts.wpn_fps_pis_beretta_co_co2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_beretta_co_co2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
	--Ergo Grip
	self.parts.wpn_fps_pis_beretta_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_g_ergo.supported = true
	self.parts.wpn_fps_pis_beretta_g_ergo.stats = {
		value = 4,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_pis_beretta_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}

	--Extended Mag.
	self.parts.wpn_fps_pis_beretta_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_m_extended.supported = true
	self.parts.wpn_fps_pis_beretta_m_extended.custom_stats = {
		ads_speed_mult = 1.05
	}
	self.parts.wpn_fps_pis_beretta_m_extended.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 15,
		reload = -3
	}

	--The Elite Slide
	self.parts.wpn_fps_pis_beretta_sl_brigadier.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beretta_sl_brigadier.supported = true
	self.parts.wpn_fps_pis_beretta_sl_brigadier.stats = {
		value = 5,
		spread = 2,
		concealment = -2
	}
	
	--Bernetti 9 Part Additions
	table.insert(self.wpn_fps_pis_beretta.uses_parts, "wpn_fps_upg_i_93r")
	table.insert(self.wpn_fps_pis_beretta_npc.uses_parts, "wpn_fps_upg_i_93r")
	
	self.wpn_fps_pis_beretta_npc.uses_parts = deep_clone(self.wpn_fps_pis_beretta.uses_parts)
		
	self.wpn_fps_pis_beretta_primary = nil
	self.wpn_fps_pis_beretta_primary_npc = nil
end)

--Mosconi 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_huntsman", "resmod_huntsman", function(self)
	
	--Road Warrior Barrel
	self.parts.wpn_fps_shot_huntsman_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_huntsman_b_short.supported = true
	self.parts.wpn_fps_shot_huntsman_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_shot_huntsman_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Gangsta Special Stock
	self.parts.wpn_fps_shot_huntsman_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_huntsman_s_short.supported = true
	self.parts.wpn_fps_shot_huntsman_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_shot_huntsman_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)

	--Mosconi Override Table
	self.wpn_fps_shot_huntsman.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -25,
				spread = 5,
				concealment = -5,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				bullet_class = "InstantExplosiveBulletBase",
				sms = 0.85
			}
		}
	}
	
	self.wpn_fps_shot_huntsman_npc.uses_parts = deep_clone(self.wpn_fps_shot_huntsman.uses_parts)
	
end)

--Bronco .44
Hooks:PostHook(WeaponFactoryTweakData, "_init_raging_bull", "resmod_raging_bull", function(self)
	
	--Aggressor Barrel
	self.parts.wpn_fps_pis_rage_b_comp1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_comp1.supported = true
	self.parts.wpn_fps_pis_rage_b_comp1.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_rage_b_comp1.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
	--Ventilated Barrel
	self.parts.wpn_fps_pis_rage_b_comp2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_comp2.supported = true
	self.parts.wpn_fps_pis_rage_b_comp2.stats = deep_clone(muzzle_device.muzzle_b_stats)
	self.parts.wpn_fps_pis_rage_b_comp2.custom_stats = deep_clone(muzzle_device.supp_b_stats)

	--Overcompensating Barrel
	self.parts.wpn_fps_pis_rage_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_long.supported = true
	self.parts.wpn_fps_pis_rage_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_pis_rage_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Pocket Surprise Barrel
	self.parts.wpn_fps_pis_rage_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_b_short.supported = true
	self.parts.wpn_fps_pis_rage_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_pis_rage_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

	--Slimline Body
	self.parts.wpn_fps_pis_rage_body_smooth.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_body_smooth.supported = true
	self.parts.wpn_fps_pis_rage_body_smooth.stats = {
		value = 5,
		recoil = -2,
		concealment = 1
	}

	--Ergo Wooden Grip
	self.parts.wpn_fps_pis_rage_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rage_g_ergo.supported = true
	self.parts.wpn_fps_pis_rage_g_ergo.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}

	self.wpn_fps_pis_rage.override = self.wpn_fps_pis_rage.override or {}
	
	--Bronco .44 Part Additions
	table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_pis_g18c_co_1")
	
	--table.insert(self.wpn_fps_pis_rage.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")
	
	self.wpn_fps_pis_rage_npc.uses_parts = deep_clone(self.wpn_fps_pis_rage.uses_parts)	

	self.wpn_fps_pis_rage_primary = nil
	self.wpn_fps_pis_rage_primary_npc = nil
end)

--OVE9000 SAW
Hooks:PostHook(WeaponFactoryTweakData, "_init_saw", "resmod_saw", function(self)
	
	--Nothing for now
	
end)

--Interceptor .45
Hooks:PostHook(WeaponFactoryTweakData, "_init_usp", "resmod_usp", function(self)
	
	--Expert Slide
	self.parts.wpn_fps_pis_usp_b_expert.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_b_expert.supported = true
	self.parts.wpn_fps_pis_usp_b_expert.stats = deep_clone(barrels.long_b1_stats)
	self.parts.wpn_fps_pis_usp_b_expert.custom_stats = deep_clone(barrels.long_b1_custom_stats)
	
	--Match Slide
	self.parts.wpn_fps_pis_usp_b_match.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_b_match.supported = true
	self.parts.wpn_fps_pis_usp_b_match.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_usp_b_match.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--Extended Mag.
	self.parts.wpn_fps_pis_usp_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_m_extended.supported = true
	self.parts.wpn_fps_pis_usp_m_extended.stats = {
		value = 2,
		concealment = -1,
		extra_ammo = 8,
		reload = -2
	}
	self.parts.wpn_fps_pis_usp_m_extended.custom_stats = {
		ads_speed_mult = 1.025
	}
	
	--Ventilated .45
	self.parts.wpn_fps_pis_usp_co_comp_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_co_comp_1.supported = true
	self.parts.wpn_fps_pis_usp_co_comp_1.stats = deep_clone(muzzle_device.muzzle_b_stats)
	
	--Velocity .45
	self.parts.wpn_fps_pis_usp_co_comp_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_usp_co_comp_2.supported = true
	self.parts.wpn_fps_pis_usp_co_comp_2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_usp_co_comp_2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)

end)	

--Chimano Custom
Hooks:PostHook(WeaponFactoryTweakData, "_init_g22c", "resmod_g22c", function(self)
	
	--Long Slide
	self.parts.wpn_fps_pis_g22c_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g22c_b_long.supported = true
	self.parts.wpn_fps_pis_g22c_b_long.stats = {
		value = 5,
		spread = 2,
		concealment = -2
	}
	self.parts.wpn_fps_pis_g22c_b_long.custom_stats = {
		falloff_start_mult = 1.15,
		falloff_end_mult = 1.15,
		ads_speed_mult = 1.05
	}
	

	--Chimano Custom Overrides
	self.wpn_fps_pis_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 16,
			concealment = -2,
			reload = -3
		}
	}
	
	self.wpn_fps_pis_g22c_npc.uses_parts = deep_clone(self.wpn_fps_pis_g22c.uses_parts)	
	
end)

--The Judge
Hooks:PostHook(WeaponFactoryTweakData, "_init_judge", "resmod_judge", function(self)
	--Judge Override Table

	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_slug = a_slug_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom = a_custom_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_custom_free = a_custom_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = a_explosive_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_rip = a_rip_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
	
end)	

--Swedish K
Hooks:PostHook(WeaponFactoryTweakData, "_init_m45", "resmod_m45", function(self)
	
	--Extended Mag.
	self.parts.wpn_fps_smg_m45_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_m_extended.supported = true
	self.parts.wpn_fps_smg_m45_m_extended.stats = {
		value = 4,
		concealment = -3,
		reload = -4,
		extra_ammo = 14
	}
	self.parts.wpn_fps_smg_m45_m_extended.custom_stats = {
		ads_speed_mult = 1.075
	}
	
	--Swedish Barrel
	self.parts.wpn_fps_smg_m45_b_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_b_green.supported = true
	self.parts.wpn_fps_smg_m45_b_green.stats = {
		value = 5,
		recoil = 2,
		concealment = -1
	}
	
	--Grease Barrel
	self.parts.wpn_fps_smg_m45_b_small.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_b_small.supported = true
	self.parts.wpn_fps_smg_m45_b_small.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_smg_m45_b_small.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}
	
	--Swedish Body
	self.parts.wpn_fps_smg_m45_body_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_body_green.supported = true
	self.parts.wpn_fps_smg_m45_body_green.stats = {
		value = 2,
		spread = 1,
		recoil = 2,
		concealment = -2
	}

	--Folded Stock
	self.parts.wpn_fps_smg_m45_s_folded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_s_folded.supported = true
	self.parts.wpn_fps_smg_m45_s_folded.stats = deep_clone(stocks.fold_folder_stats)
	self.parts.wpn_fps_smg_m45_s_folded.stats.value = 0
	self.parts.wpn_fps_smg_m45_s_folded.custom_stats = deep_clone(stocks.fold_folder_stats)
	
	--Ergo Grip
	self.parts.wpn_fps_smg_m45_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_g_ergo.supported = true
	self.parts.wpn_fps_smg_m45_g_ergo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_smg_m45_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Bling Grip
	self.parts.wpn_fps_smg_m45_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_m45_g_bling.supported = true
	self.parts.wpn_fps_smg_m45_g_bling.stats = {
		value = 10,
		recoil = 4,
		concealment = -2
	}

	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_specter = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_docter = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_eotech = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_t1micro = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_cmore = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_acog = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_cs = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_reflex = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_rx01 = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_rx30 = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_spot = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_bmg = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_fc1 = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_uh = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_tf90 = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_poe = { "wpn_fps_smg_sr2_o_rail" }
	self.wpn_fps_smg_m45.adds.wpn_fps_upg_o_cqb = { "wpn_fps_smg_sr2_o_rail" }

	self.wpn_fps_smg_m45.override = self.wpn_fps_smg_m45.override or {}
	self.wpn_fps_smg_m45.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}

	table.insert(self.wpn_fps_smg_m45.uses_parts, "wpn_fps_smg_mac10_s_no")	
	
	self.wpn_fps_smg_m45_npc.override = deep_clone(self.wpn_fps_smg_m45.override)	
	self.wpn_fps_smg_m45_npc.uses_parts = deep_clone(self.wpn_fps_smg_m45.uses_parts)	
	
end)	

--Commando 553
Hooks:PostHook(WeaponFactoryTweakData, "_init_s552", "resmod_s552", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_ass_s552_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_b_long.supported = true
	self.parts.wpn_fps_ass_s552_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_ass_s552_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	--Heat Treated Body
	self.parts.wpn_fps_ass_s552_body_standard_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_body_standard_black.supported = true
	self.parts.wpn_fps_ass_s552_body_standard_black.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}

	--Enhanced Foregrip
	self.parts.wpn_fps_ass_s552_fg_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_fg_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats = {
		value = 3,
		recoil = 2,
		concealment = -1
	}
		
	--Railed Foregrip
	self.parts.wpn_fps_ass_s552_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_fg_railed.supported = true
	self.parts.wpn_fps_ass_s552_fg_railed.stats = {
		value = 5,
		recoil = -2,
		concealment = 1
	}

	--Enhanced Grip
	self.parts.wpn_fps_ass_s552_g_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_g_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_g_standard_green.stats = {
		value = 3,
		recoil = 2,
		concealment = -1
	}
	
	--Enhanced Stock
	self.parts.wpn_fps_ass_s552_s_standard_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_s552_s_standard_green.supported = true
	self.parts.wpn_fps_ass_s552_s_standard_green.stats = {
		value = 2,
		spread = 1,
		recoil = -2
	}

	self.wpn_fps_ass_s552.override = self.wpn_fps_ass_s552.override or {}

	self.wpn_fps_ass_s552.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_ass_s552.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}
	
	self.wpn_fps_ass_s552_secondary = nil
	self.wpn_fps_ass_s552_secondary_npc = nil
end)

--Gruber Kurz
Hooks:PostHook(WeaponFactoryTweakData, "_init_ppk", "resmod_ppk", function(self)
	
	--Long Slide
	self.parts.wpn_fps_pis_ppk_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_ppk_b_long.supported = true
	self.parts.wpn_fps_pis_ppk_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_pis_ppk_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	--Laser Grip
	self.parts.wpn_fps_pis_ppk_g_laser.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_ppk_g_laser.supported = true
	self.parts.wpn_fps_pis_ppk_g_laser.stats = {value = 1}
	self.parts.wpn_fps_pis_ppk_g_laser.perks = {"gadget"}
	
	--Gruber Kurz Part Additions
	table.insert(self.wpn_fps_pis_ppk.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_ppk_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
	
	table.insert(self.wpn_fps_pis_ppk.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_ppk_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_ppk_npc.uses_parts = deep_clone(self.wpn_fps_pis_ppk.uses_parts)		
	
end)

--SpecOps
Hooks:PostHook(WeaponFactoryTweakData, "_init_mp7", "resmod_mp7", function(self)

	--Extended Mag.
	self.parts.wpn_fps_smg_mp7_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_m_extended.supported = true
	self.parts.wpn_fps_smg_mp7_m_extended.custom_stats = {
		ads_speed_mult = 1.05

	}
	self.parts.wpn_fps_smg_mp7_m_extended.stats = {
		value = 2,
		concealment = -2,
		reload = -3,
		extra_ammo = 20
	}

	--Suppressed Barrel
	self.parts.wpn_fps_smg_mp7_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_b_suppressed.supported = true
	self.parts.wpn_fps_smg_mp7_b_suppressed.has_description = true
	self.parts.wpn_fps_smg_mp7_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats = {
		value = 3,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_mp7_b_suppressed.perks = {"silencer"}

	--Unfolded Stock
	self.parts.wpn_fps_smg_mp7_s_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_mp7_s_long.supported = true
	self.parts.wpn_fps_smg_mp7_s_long.stats = deep_clone(stocks.unfold_nocheeks_stats)
	self.parts.wpn_fps_smg_mp7_s_long.stats.value = 0
	self.parts.wpn_fps_smg_mp7_s_long.custom_stats = deep_clone(stocks.unfold_nocheeks_stats)

	self.parts.wpn_fps_smg_mp7_body_standard.adds = {
		"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
	}

	self.wpn_fps_smg_mp7.override = self.wpn_fps_smg_mp7.override or {}

	self.wpn_fps_smg_mp7.override.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		stats = {
			recoil = 2,
			concealment = -1
		},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
		}
	}
	self.wpn_fps_smg_mp7.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			recoil = 2,
			concealment = -1
		},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
		}
	}
	self.wpn_fps_smg_mp7.override.wpn_fps_ass_tecci_vg_ergo = {
		stats = {
			recoil = -2,
			concealment = 1
		},
		forbids = {
			"wpn_fps_upg_vg_ass_smg_stubby_vanilla"
		}
	}
	self.wpn_fps_smg_mp7.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}

	--Disabling default VFG stats
	self.wpn_fps_smg_mp7.uses_parts[8] = "wpn_fps_upg_vg_ass_smg_stubby_vanilla"

	table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_smg_mac10_s_no")
	self.wpn_fps_smg_mp7_npc.uses_parts = deep_clone(self.wpn_fps_smg_mp7.uses_parts)
	
end)

--Eagle Heavy
Hooks:PostHook(WeaponFactoryTweakData, "_init_scar", "resmod_scar", function(self)

	--Long Barrel
	self.parts.wpn_fps_ass_scar_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_b_long.supported = true
	self.parts.wpn_fps_ass_scar_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_ass_scar_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	--Short Barrel
	self.parts.wpn_fps_ass_scar_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_b_short.supported = true
	self.parts.wpn_fps_ass_scar_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_ass_scar_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)

	--Rail Extension
	self.parts.wpn_fps_ass_scar_fg_railext.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_fg_railext.supported = true
	self.parts.wpn_fps_ass_scar_fg_railext.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}

	--Sniper Stock
	self.parts.wpn_fps_ass_scar_s_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_scar_s_sniper.supported = true
	self.parts.wpn_fps_ass_scar_s_sniper.stats = deep_clone(stocks.adj_to_fixed_acc_stats)
	self.parts.wpn_fps_ass_scar_s_sniper.custom_stats = deep_clone(stocks.adj_to_fixed_acc_stats)
	
	--Disabling Vertical Grip Mods
	self.wpn_fps_ass_scar.default_blueprint[6] = "wpn_fps_upg_m4_g_standard"	
	self.wpn_fps_ass_scar.default_blueprint[7] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"	
	
	self.wpn_fps_ass_scar.uses_parts[13] = "wpn_fps_upg_m4_g_standard"	
	self.wpn_fps_ass_scar.uses_parts[17] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"	
	
	--SCAR Part mods
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_ass_scar_npc.uses_parts, "wpn_fps_upg_m4_g_hgrip")

	self.wpn_fps_ass_scar.stock_adapter = "wpn_fps_ass_s552_s_m4"
	self.wpn_fps_ass_scar_npc.stock_adapter = "wpn_fps_ass_s552_s_m4"
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_snp_tti_s_vltor")	
	table.insert(self.wpn_fps_ass_scar.uses_parts, "wpn_fps_sho_sko12_stock")

	self.wpn_fps_ass_scar.override = self.wpn_fps_ass_scar.overrides or {}
	self.wpn_fps_ass_scar.override.wpn_fps_upg_m4_s_standard = {
		stats = {},
		custom_stats = {}
	}
	
	self.wpn_fps_ass_scar_npc.override = deep_clone(self.wpn_fps_ass_scar.override)
	self.wpn_fps_ass_scar_npc.uses_parts = deep_clone(self.wpn_fps_ass_scar.uses_parts)
	
end)

--Signature .40
Hooks:PostHook(WeaponFactoryTweakData, "_init_p226", "resmod_p226", function(self)

	--Two Tone Slide
	self.parts.wpn_fps_pis_p226_b_equinox.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_b_equinox.supported = true
	self.parts.wpn_fps_pis_p226_b_equinox.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	
	--Long Slide
	self.parts.wpn_fps_pis_p226_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_b_long.supported = true
	self.parts.wpn_fps_pis_p226_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_pis_p226_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Ergo Grip
	self.parts.wpn_fps_pis_p226_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_g_ergo.supported = true
	self.parts.wpn_fps_pis_p226_g_ergo.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}

	--Extended Mag.
	self.parts.wpn_fps_pis_p226_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_m_extended.supported = true
	self.parts.wpn_fps_pis_p226_m_extended.stats = {
		value = 1,
		extra_ammo = 7,
		reload = -2,
		concealment = -1
	}

	--Ventilated .40
	self.parts.wpn_fps_pis_p226_co_comp_1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_co_comp_1.supported = true
	self.parts.wpn_fps_pis_p226_co_comp_1.stats = deep_clone(muzzle_device.muzzle_b_stats)
	
	--Velocity .40
	self.parts.wpn_fps_pis_p226_co_comp_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_p226_co_comp_2.supported = true
	self.parts.wpn_fps_pis_p226_co_comp_2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
	self.parts.wpn_fps_pis_p226_co_comp_2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	
end)

--Brenner-21
Hooks:PostHook(WeaponFactoryTweakData, "_init_hk21", "resmod_hk21", function(self)

	--Long Barrel
	self.parts.wpn_fps_lmg_hk21_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_b_long.supported = true
	self.parts.wpn_fps_lmg_hk21_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_lmg_hk21_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--Short Foregrip
	self.parts.wpn_fps_lmg_hk21_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_fg_short.supported = true
	self.parts.wpn_fps_lmg_hk21_fg_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_lmg_hk21_fg_short.stats.spread = -1
	self.parts.wpn_fps_lmg_hk21_fg_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	self.parts.wpn_fps_lmg_hk21_fg_short.custom_stats.falloff_start_mult = 0.5
	self.parts.wpn_fps_lmg_hk21_fg_short.custom_stats.rof_mult = 1.1875
	
	--Ergo Grip
	self.parts.wpn_fps_lmg_hk21_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk21_g_ergo.supported = true
	self.parts.wpn_fps_lmg_hk21_g_ergo.stats = {
		value = 2,
		concealment = 1,
		recoil = -2
	}
	self.parts.wpn_fps_lmg_hk21_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}

	--Adds Rails
	self.wpn_fps_lmg_hk21.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_45iron = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_leupold = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_bmg = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_uh = { "wpn_fps_ass_g3_body_rail" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_ass_g3_body_rail" },		
	}
		
	--HK21 Part Additions
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_s_sniper")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_ass_g3_s_wood")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_uh")		
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_smg_mp5_s_adjust")
	
	self.wpn_fps_lmg_hk21_npc.uses_parts = deep_clone(self.wpn_fps_lmg_hk21.uses_parts)	
		
end)

--KSP
Hooks:PostHook(WeaponFactoryTweakData, "_init_m249", "resmod_m249", function(self)

	--Long Barrel
	self.parts.wpn_fps_lmg_m249_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_b_long.supported = true
	self.parts.wpn_fps_lmg_m249_b_long.stats = {
		value = 5,
		spread = 2,
		concealment = -2
	}
	self.parts.wpn_fps_lmg_m249_b_long.custom_stats = {
		falloff_start_mult = 1.15,
		falloff_end_mult = 1.15,
		ads_speed_mult = 1.05
	}

	--Railed Foregrip
	self.parts.wpn_fps_lmg_m249_fg_mk46.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_fg_mk46.supported = true
	self.parts.wpn_fps_lmg_m249_fg_mk46.stats = {
		value = 2,
		recoil = 2,
		concealment = -1,
	}

	--Solid Stock
	self.parts.wpn_fps_lmg_m249_s_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m249_s_solid.supported = true
	self.parts.wpn_fps_lmg_m249_s_solid.stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
	self.parts.wpn_fps_lmg_m249_s_solid.custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)

	if not self.wpn_fps_lmg_m249.override then
		self.wpn_fps_lmg_m249.override = {}
	end
	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}

	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_specter = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_aimpoint = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_docter = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_eotech = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_t1micro = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_cmore = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_aimpoint_2 = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_cs = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_rx30 = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_rx01 = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_reflex = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_eotech_xps = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_sig = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_uh = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_fc1 = {
		parent = "upper_reciever"
	}
	
	--M249 Part Additions
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_uh")
	

	table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_m249_npc.uses_parts, "wpn_fps_upg_o_fc1")		
			
	self.wpn_fps_lmg_m249_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m249.uses_parts)			

end)

--RPK
Hooks:PostHook(WeaponFactoryTweakData, "_init_rpk", "resmod_rpk", function(self)

	--Tactical Foregrip
	self.parts.wpn_fps_lmg_rpk_fg_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_rpk_fg_standard.supported = true
	self.parts.wpn_fps_lmg_rpk_fg_standard.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_lmg_rpk_fg_standard.adds = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		"wpn_fps_addon_ris"
	}
	
	--Default Stock
	self.parts.wpn_fps_lmg_rpk_s_wood.adds = {
		"wpn_upg_ak_g_standard"
	}	
		
	--Plastic Stock
	self.parts.wpn_fps_lmg_rpk_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_rpk_s_standard.supported = true
	self.parts.wpn_fps_lmg_rpk_s_standard.stats = {
		value = 4,
		spread = 1,
		recoil = -2
	}
	
	self.wpn_fps_lmg_rpk.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_docter = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_acog = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_cs = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_45iron = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_leupold = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_sig = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_uh = { "wpn_fps_ak_extra_ris" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_ak_extra_ris" }
	}
	self.wpn_fps_lmg_rpk.override = {
		wpn_lmg_rpk_m_ban = {
				fps_animation_weight = "ban_mag",
				unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard",
				third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_lmg_rpk_pts/wpn_third_lmg_rpk_m_standard",
				supported = true,
				stats = {
					value = 5,
					concealment = 3,
					reload = 4,
					extra_ammo = -30,
				},
				custom_stats = {
					ads_speed_mult = 0.925
				}
		},
		wpn_fps_ass_74_body_upperreceiver = {
			unit = "units/payday2/weapons/wpn_fps_ass_akm_pts/wpn_fps_ass_akm_body_upperreceiver",
			third_unit = "units/payday2/weapons/wpn_third_ass_akm_pts/wpn_third_ass_akm_body_upperreceiver"
		}
	}

	self.wpn_fps_lmg_rpk.override.wpn_upg_ak_fg_combo3 = {
		adds = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
		}
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_fg_tapco = {
		adds = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
		}
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_fg_midwest = {
		adds = {
			"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
		}
	}

	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_skfoldable = {
		stats = deep_clone(stocks.fixed_to_folder_stats),
		custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_folding = {
		stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_s_empty = {
		stats = deep_clone(stocks.remove_fixed_stats),
		custom_stats = deep_clone(stocks.remove_fixed_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_upg_ak_s_psl = {
		stats = deep_clone(stocks.fixed_to_thumbhole_stats),
		custom_stats = deep_clone(stocks.fixed_to_thumbhole_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_s_solidstock = {
		stats = deep_clone(stocks.fixed_rec_stats),
		custom_stats = deep_clone(stocks.fixed_rec_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_s_polymerstock = {
		stats = deep_clone(stocks.fixed_acc_stats),
		custom_stats = deep_clone(stocks.fixed_acc_stats)
	}
	self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_m_quick = {
		fps_animation_weight = "ban_mag",
		stats = {
			value = 6,
			spread = -1,
			concealment = 4,
			reload = 6,
			extra_ammo = -45
		},
		custom_stats = {
			ads_speed_mult = 0.9
		}
	}
	if SystemFS:exists("assets/mod_overrides/AK Correct Magpul Assist Mags") then
		self.wpn_fps_lmg_rpk.override.wpn_fps_upg_ak_m_quick.unit = "units/mods/weapons/wpn_fps_ass_akm_m_magpul/wpn_fps_ass_akm_m_magpul"
	end

	--Disabling Vertical Grip Mods
	self.wpn_fps_lmg_rpk.uses_parts[25] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"		
	
	--RPK Part Additions
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_psl")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_lmg_rpk_m_ban")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_s_skfoldable")

	--table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_ak_scopemount") -- doesn't work, missing "a_o_sm"
	--table.insert(self.wpn_fps_lmg_rpk_npc.uses_parts, "wpn_fps_upg_o_ak_scopemount")	
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_upg_ak_fg_combo3")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_tapco")
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_fg_midwest")
	--table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_krebs") -- Don't fit right, missing their respective unique attachment points
	--table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_fg_trax")

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_ak_m_quick")			
			
	self.wpn_fps_lmg_rpk_npc.uses_parts = deep_clone(self.wpn_fps_lmg_rpk.uses_parts)		

end)


--Thanatos .50 cal 
Hooks:PostHook(WeaponFactoryTweakData, "_init_m95", "resmod_m95", function(self)

	--Tank Buster Barrel
	self.parts.wpn_fps_snp_m95_barrel_long.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_long.supported = true
	self.parts.wpn_fps_snp_m95_barrel_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_snp_m95_barrel_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--CQB Barrel
	self.parts.wpn_fps_snp_m95_barrel_short.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_short.supported = true
	self.parts.wpn_fps_snp_m95_barrel_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_snp_m95_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Suppressed Barrel
	self.parts.wpn_fps_snp_m95_barrel_suppressed.pcs = {}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.has_description = true
	self.parts.wpn_fps_snp_m95_barrel_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_m95_barrel_suppressed.supported = true
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_m95_barrel_suppressed.perks = {"silencer"}
		
	self.wpn_fps_snp_m95.override.wpn_fps_snp_model70_iron_sight = { 
		adds = {"wpn_fps_gre_arbiter_o_standard"}
	}
	
	table.insert(self.wpn_fps_snp_m95.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_m95_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_m95_npc.uses_parts = deep_clone(self.wpn_fps_snp_m95.uses_parts)		

end)
	
--Rattlesnake
Hooks:PostHook(WeaponFactoryTweakData, "_init_msr", "resmod_msr", function(self)

	--Long Barrel
	self.parts.wpn_fps_snp_msr_b_long.pcs = {}
	self.parts.wpn_fps_snp_msr_b_long.supported = true
	self.parts.wpn_fps_snp_msr_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_snp_msr_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Sniper Suppressor
	self.parts.wpn_fps_snp_msr_ns_suppressor.pcs = {}
	self.parts.wpn_fps_snp_msr_ns_suppressor.supported = true
	self.parts.wpn_fps_snp_msr_ns_suppressor.has_description = true
	self.parts.wpn_fps_snp_msr_ns_suppressor.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_msr_ns_suppressor.perks = {"silencer"}
	
	--Tactical Aluminium Body
	self.parts.wpn_fps_snp_msr_body_msr.pcs = {}
	self.parts.wpn_fps_snp_msr_body_msr.supported = true
	self.parts.wpn_fps_snp_msr_body_msr.stats = deep_clone(stocks.fixed_to_folder_stats)
	self.parts.wpn_fps_snp_msr_body_msr.custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	self.parts.wpn_fps_snp_msr_body_msr.override = {
		wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_smg_hajk_o_standard"}
		}
	}
	
	--Default Wood Body
	self.parts.wpn_fps_snp_msr_body_wood.override = {
		wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_gre_arbiter_o_standard"}
		}
	}

	self.wpn_fps_snp_msr.override = {}

	table.insert(self.wpn_fps_snp_msr.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_msr_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_msr_npc.override = deep_clone(self.wpn_fps_snp_msr.override)
	self.wpn_fps_snp_msr_npc.uses_parts = deep_clone(self.wpn_fps_snp_msr.uses_parts)

end)	

--R93
Hooks:PostHook(WeaponFactoryTweakData, "_init_r93", "resmod_r93", function(self)

	--Short Barrel
	self.parts.wpn_fps_snp_r93_b_short.pcs = {}
	self.parts.wpn_fps_snp_r93_b_short.supported = true
	self.parts.wpn_fps_snp_r93_b_short.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	self.parts.wpn_fps_snp_r93_b_short.stats = {
		value = 2,
		spread = -2,
		concealment = 2
	}
	
	--Compensated Suppressor
	self.parts.wpn_fps_snp_r93_b_suppressed.pcs = {}
	self.parts.wpn_fps_snp_r93_b_suppressed.supported = true
	self.parts.wpn_fps_snp_r93_b_suppressed.has_description = true
	self.parts.wpn_fps_snp_r93_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_r93_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_r93_b_suppressed.perks = {"silencer"}
	
	--Wooden Body
	self.parts.wpn_fps_snp_r93_body_wood.pcs = {}
	self.parts.wpn_fps_snp_r93_body_wood.supported = true
	self.parts.wpn_fps_snp_r93_body_wood.stats = {
		value = 2,
		concealment = -2,
		recoil = 4
	}
	
	--Override Table
	self.wpn_fps_snp_r93.override = {
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_gre_arbiter_o_standard"},
		}
	}

	table.insert(self.wpn_fps_snp_r93.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_r93_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
			
	self.wpn_fps_snp_r93_npc.uses_parts = deep_clone(self.wpn_fps_snp_r93.uses_parts)	

end)	

--Falcon
Hooks:PostHook(WeaponFactoryTweakData, "_init_fal", "resmod_fal", function(self)

	--CQB Foregrip
	self.parts.wpn_fps_ass_fal_fg_01.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_01.supported = true
	self.parts.wpn_fps_ass_fal_fg_01.stats = {
		value = 3,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_ass_fal_fg_01.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	
	--Retro Foregrip
	self.parts.wpn_fps_ass_fal_fg_03.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_03.supported = true
	self.parts.wpn_fps_ass_fal_fg_03.stats = {
		value = 2,
		recoil = -2,
		spread = 1
	}
	
	--Marksman Foregrip
	self.parts.wpn_fps_ass_fal_fg_04.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_04.supported = true
	self.parts.wpn_fps_ass_fal_fg_04.stats = {
		value = 4,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_ass_fal_fg_04.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}
	
	--Wooden Foregrip
	self.parts.wpn_fps_ass_fal_fg_wood.pcs = {}
	self.parts.wpn_fps_ass_fal_fg_wood.supported = true
	self.parts.wpn_fps_ass_fal_fg_wood.stats = {
		value = 2,
		recoil = 2,
		spread = -1
	}
	
	--Tactical Grip
	self.parts.wpn_fps_ass_fal_g_01.pcs = {}
	self.parts.wpn_fps_ass_fal_g_01.supported = true
	self.parts.wpn_fps_ass_fal_g_01.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_ass_fal_g_01.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Vintage Mag (Formerly Extended Magazine)
	self.parts.wpn_fps_ass_fal_m_01.pcs = {}
	self.parts.wpn_fps_ass_fal_m_01.name_id = "bm_wp_upg_vintage_sc"
	self.parts.wpn_fps_ass_fal_m_01.alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_straight"
	self.parts.wpn_fps_ass_fal_m_01.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_standard"
	self.parts.wpn_fps_ass_fal_m_01.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_standard"
	self.parts.wpn_fps_ass_fal_m_01.supported = true
	self.parts.wpn_fps_ass_fal_m_01.custom_stats = {
		ads_speed_mult = 0.95
	}
	self.parts.wpn_fps_ass_fal_m_01.stats = {
		value = 2,
		extra_ammo = -10,
		concealment = 2,
		reload = 2
	}
	
	--Standard Mag (Now Extended Magazine)
	self.parts.wpn_fps_ass_fal_m_standard.unit = "units/pd2_dlc_big/weapons/wpn_fps_ass_fal_pts/wpn_fps_ass_fal_m_01"
	self.parts.wpn_fps_ass_fal_m_standard.third_unit = "units/pd2_dlc_big/weapons/wpn_third_ass_fal_pts/wpn_third_ass_fal_m_01"
	
	--CQB Stock
	self.parts.wpn_fps_ass_fal_s_01.pcs = {}
	self.parts.wpn_fps_ass_fal_s_01.supported = true
	self.parts.wpn_fps_ass_fal_s_01.stats = deep_clone(stocks.fixed_to_folder_stats)
	self.parts.wpn_fps_ass_fal_s_01.custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	
	--Marksman Stock
	self.parts.wpn_fps_ass_fal_s_03.pcs = {}
	self.parts.wpn_fps_ass_fal_s_03.supported = true
	self.parts.wpn_fps_ass_fal_s_03.stats = {
		value = 5,
		spread = 1,
		recoil = -2
	}
	
	--Wooden Stock
	self.parts.wpn_fps_ass_fal_s_wood.pcs = {}
	self.parts.wpn_fps_ass_fal_s_wood.supported = true
	self.parts.wpn_fps_ass_fal_s_wood.stats = {
		value = 2,
		recoil = 4,
		spread = -2
	}


	self.wpn_fps_ass_fal.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_ass_fal_npc.stock_adapter = "wpn_upg_ak_s_adapter"

	if not self.wpn_fps_ass_fal.override then
		self.wpn_fps_ass_fal.override = {}
	end

	self.wpn_fps_ass_fal.override.wpn_upg_ak_s_adapter = {
		adds = {}
	}
	self.wpn_fps_ass_fal.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_ass_fal.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}

	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_upg_m4_s_pts")	
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_upg_m4_s_crane")	
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")	
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")	
	table.insert(self.wpn_fps_ass_fal.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_ass_fal_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")

	self.wpn_fps_ass_fal_npc.override = deep_clone(self.wpn_fps_ass_fal.override)
	self.wpn_fps_ass_fal_npc.uses_parts = deep_clone(self.wpn_fps_ass_fal.uses_parts)

end)	

--M1014
Hooks:PostHook(WeaponFactoryTweakData, "_init_ben", "resmod_ben", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_ben_b_long.pcs = {}
	self.parts.wpn_fps_sho_ben_b_long.supported = true
	self.parts.wpn_fps_sho_ben_b_long.stats = {
		value = 4,
		concealment = -1,
		spread = 1,
		extra_ammo = 2
	}
	self.parts.wpn_fps_sho_ben_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}

	--Short Barrel
	self.parts.wpn_fps_sho_ben_b_short.pcs = {}
	self.parts.wpn_fps_sho_ben_b_short.supported = true
	self.parts.wpn_fps_sho_ben_b_short.stats = {
		value = 3,
		concealment = 2,
		spread = -2,
		extra_ammo = -1
	}
	self.parts.wpn_fps_sho_ben_b_short.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	
	--Collapsed Stock
	self.parts.wpn_fps_sho_ben_s_collapsed.pcs = {}
	self.parts.wpn_fps_sho_ben_s_collapsed.supported = true
	self.parts.wpn_fps_sho_ben_s_collapsed.stats = deep_clone(stocks.adj_to_folded_stats)
	self.parts.wpn_fps_sho_ben_s_collapsed.stats.value = 0
	self.parts.wpn_fps_sho_ben_s_collapsed.custom_stats = deep_clone(stocks.adj_to_folded_stats)
	
	--Tactical Stock
	self.parts.wpn_fps_sho_ben_s_solid.pcs = {}
	self.parts.wpn_fps_sho_ben_s_solid.supported = true
	self.parts.wpn_fps_sho_ben_s_solid.stats = deep_clone(stocks.adj_to_fixed_rec_stats)
	self.parts.wpn_fps_sho_ben_s_solid.custom_stats = deep_clone(stocks.adj_to_fixed_rec_stats)

	--Override Table
	self.wpn_fps_sho_ben.override = {
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,
		wpn_fps_upg_a_custom_free = a_custom_semi_override,			
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override		
	}



end)	

--Street Sweeper
Hooks:PostHook(WeaponFactoryTweakData, "_init_striker", "resmod_striker", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_striker_b_long.pcs = {}
	self.parts.wpn_fps_sho_striker_b_long.supported = true
	self.parts.wpn_fps_sho_striker_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_sho_striker_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Suppressed Barrel
	self.parts.wpn_fps_sho_striker_b_suppressed.pcs = {}
	self.parts.wpn_fps_sho_striker_b_suppressed.supported = true
	self.parts.wpn_fps_sho_striker_b_suppressed.has_description = true
	self.parts.wpn_fps_sho_striker_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_sho_striker_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_sho_striker_b_suppressed.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	self.parts.wpn_fps_sho_striker_b_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_sho_striker_b_suppressed.forbids = {
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_a_dragons_breath",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_ns_duck"
	}
	
	--Override Table
	self.wpn_fps_sho_striker.override = {
		wpn_upg_o_marksmansight_rear_vanilla = {a_obj = "a_o_r"},
		wpn_upg_o_marksmansight_front = {a_obj = "a_o_f"},
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,	
		wpn_fps_upg_a_custom_free = a_custom_semi_override,				
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_revo_override	
	}

end)	

--Raven
Hooks:PostHook(WeaponFactoryTweakData, "_init_ksg", "resmod_ksg", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_ksg_b_long.pcs = {}
	self.parts.wpn_fps_sho_ksg_b_long.supported = true
	self.parts.wpn_fps_sho_ksg_b_long.stats = {
		value = 4,
		concealment = -2,
		extra_ammo = 2
	}
	self.parts.wpn_fps_sho_ksg_b_long.custom_stats = {
		falloff_start_mult = 1.15,
		falloff_end_mult = 1.15,
		ads_speed_mult = 1.05
	}

	--Short Barrel
	self.parts.wpn_fps_sho_ksg_b_short.pcs = {}
	self.parts.wpn_fps_sho_ksg_b_short.supported = true
	self.parts.wpn_fps_sho_ksg_b_short.stats = {
		value = 4,
		concealment = 2,
		extra_ammo = -2
	}
	self.parts.wpn_fps_sho_ksg_b_short.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	
	--Flip-up Sight
	self.parts.wpn_fps_upg_o_mbus_rear.pcs = {}
	self.parts.wpn_fps_upg_o_mbus_rear.supported = true
	self.parts.wpn_fps_upg_o_mbus_rear.stats = {value = 0}
	self.parts.wpn_fps_upg_o_mbus_rear.perks = {"scope"}
	self.parts.wpn_fps_upg_o_mbus_rear.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)

	--Ammunition Overrides
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_slug = a_slug_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom = a_custom_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom_free = a_custom_pump_override			
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive = a_explosive_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_rip = a_rip_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
end)	

--GL40
Hooks:PostHook(WeaponFactoryTweakData, "_init_gre_m79", "resmod_gre_m79", function(self)
	
	--Pirate Barrel
	self.parts.wpn_fps_gre_m79_barrel_short.pcs = {}
	self.parts.wpn_fps_gre_m79_barrel_short.supported = true
	self.parts.wpn_fps_gre_m79_barrel_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_gre_m79_barrel_short.adds = {
		"wpn_fps_gre_m79_sight_up"
	}
	self.parts.wpn_fps_gre_m79_barrel_short.forbids = {}
	self.parts.wpn_fps_gre_m79_barrel_short.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Sawed-off Stock
	self.parts.wpn_fps_gre_m79_stock_short.pcs = {}
	self.parts.wpn_fps_gre_m79_stock_short.supported = true
	self.parts.wpn_fps_gre_m79_stock_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_gre_m79_stock_short.custom_stats = deep_clone(stocks.remove_fixed_stats)

	self.parts.wpn_fps_gre_m79_sight_up.stance_mod = {
		wpn_fps_gre_m79 = {
			translation = Vector3(0, -8, 1),
			rotation = Rotation(0, -5, 0)
		},
		wpn_fps_gre_china = {
			translation = Vector3(0, -12, 1),
			rotation = Rotation(0, -5, 0)
		}
	}

end)	

--Gewehr 3
Hooks:PostHook(WeaponFactoryTweakData, "_init_g3", "resmod_g3", function(self)
	
	--DMR Kit
	self.parts.wpn_fps_ass_g3_b_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_b_sniper.supported = true
	self.parts.wpn_fps_ass_g3_b_sniper.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_ass_g3_b_sniper.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	self.parts.wpn_fps_ass_g3_b_sniper.override = {}
	self.parts.wpn_fps_ass_g3_b_sniper.adds = {}
	
	--Just in case
	self.parts.wpn_fps_ammo_type.supported = true
	self.parts.wpn_fps_ammo_type.cull = true
	self.parts.wpn_fps_ammo_type.stats = {value = 1}
	self.parts.wpn_fps_ammo_type.custom_stats = {}
	
	--Assault Kit
	self.parts.wpn_fps_ass_g3_b_short.pcs = {}
	self.parts.wpn_fps_ass_g3_b_short.supported = true
	self.parts.wpn_fps_ass_g3_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_ass_g3_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Precision Foregrip
	self.parts.wpn_fps_ass_g3_fg_psg.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_psg.supported = true
	self.parts.wpn_fps_ass_g3_fg_psg.stats = {
		value = 5,
		spread = 1,
		recoil = 2,
		concealment = -2
	}
	self.parts.wpn_fps_ass_g3_fg_psg.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}

	--Tactical Foregrip
	self.parts.wpn_fps_ass_g3_fg_railed.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_railed.supported = true
	self.parts.wpn_fps_ass_g3_fg_railed.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	
	--Wooden Foregrip
	self.parts.wpn_fps_ass_g3_fg_retro.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_retro.supported = true
	self.parts.wpn_fps_ass_g3_fg_retro.stats = {
		value = 2,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_ass_g3_fg_retro.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}
	
	--Plastic Foregrip
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.pcs = {}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.supported = true
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats = {
		value = 2,
		spread = -1,
		recoil = -2,
		concealment = 2
	}
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}
	
	--Retro Grip
	self.parts.wpn_fps_ass_g3_g_retro.pcs = {}
	self.parts.wpn_fps_ass_g3_g_retro.supported = true
	self.parts.wpn_fps_ass_g3_g_retro.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_ass_g3_g_retro.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Precision Grip
	self.parts.wpn_fps_ass_g3_g_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_g_sniper.supported = true
	self.parts.wpn_fps_ass_g3_g_sniper.stats = {
		value = 5,
		recoil = 4,
		concealment = -2
	}
	
	--Precision Stock
	self.parts.wpn_fps_ass_g3_s_sniper.pcs = {}
	self.parts.wpn_fps_ass_g3_s_sniper.has_description = true
	self.parts.wpn_fps_ass_g3_s_sniper.desc_id = "empty"
	self.parts.wpn_fps_ass_g3_s_sniper.supported = true
	self.parts.wpn_fps_ass_g3_s_sniper.stats = {
		value = 5,
		spread = 1,
		recoil = -2
	}
	
	--Wooden Stock
	self.parts.wpn_fps_ass_g3_s_wood.pcs = {}
	self.parts.wpn_fps_ass_g3_s_wood.has_description = true
	self.parts.wpn_fps_ass_g3_s_wood.desc_id = "empty"
	self.parts.wpn_fps_ass_g3_s_wood.supported = true
	self.parts.wpn_fps_ass_g3_s_wood.stats = {
		value = 4,
		recoil = 2,
		spread = -1
	}
	
	--PSG Magazine
	self.parts.wpn_fps_ass_g3_m_psg = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_g3_m_psg",
		a_obj = "a_m",
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_m4_m_straight",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg",
		supported = true,
		stats = {value = 2, extra_ammo = -5, reload = 2, concealment = 3},
		custom_stats = { ads_speed_mult = 0.925},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	self.parts.wpn_fps_ass_g3_m_psg.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_third_ass_g3_m_mag_psg"

	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_ass_g3_m_psg")
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust")

	self.wpn_fps_ass_g3_npc.uses_parts = deep_clone(self.wpn_fps_ass_g3.uses_parts)
	
end)	

--Gecko 7.62 
Hooks:PostHook(WeaponFactoryTweakData, "_init_galil", "resmod_galil", function(self)
	
	--Fabulous Foregrip
	self.parts.wpn_fps_ass_galil_fg_fab.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_fab.supported = true
	self.parts.wpn_fps_ass_galil_fg_fab.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod = { 
		wpn_fps_ass_galil = {
			translation = Vector3(-0.004, 4.1, -3.495)
		}
	}
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_ass_galil_fg_fab.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_ass_galil_fg_fab.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	
		
	--CQB Foregrip
	self.parts.wpn_fps_ass_galil_fg_mar.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_mar.supported = true
	self.parts.wpn_fps_ass_galil_fg_mar.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_ass_galil_fg_mar.stats.recoil = -2
	self.parts.wpn_fps_ass_galil_fg_mar.stats.concealment = 3
	self.parts.wpn_fps_ass_galil_fg_mar.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	self.parts.wpn_fps_ass_galil_fg_mar.forbids = {}
	self.parts.wpn_fps_ass_galil_fg_mar.override = {
		wpn_fps_upg_ass_ns_jprifles = {
			a_obj = "a_ns_s"
		},
		wpn_fps_upg_ass_ns_surefire = {
			a_obj = "a_ns_s"
		},
		wpn_fps_upg_ass_ns_battle = {
			a_obj = "a_ns_s"
		}
	}
	
	--Light Foregrip
	self.parts.wpn_fps_ass_galil_fg_sar.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_sar.supported = true
	self.parts.wpn_fps_ass_galil_fg_sar.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_ass_galil_fg_sar.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Sniper Foregrip
	self.parts.wpn_fps_ass_galil_fg_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_fg_sniper.supported = true
	self.parts.wpn_fps_ass_galil_fg_sniper.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_ass_galil_fg_sniper.stats.recoil = 2
	self.parts.wpn_fps_ass_galil_fg_sniper.stats.concealment = -3
	self.parts.wpn_fps_ass_galil_fg_sniper.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Sniper Grip
	self.parts.wpn_fps_ass_galil_g_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_g_sniper.supported = true
	self.parts.wpn_fps_ass_galil_g_sniper.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	
	--Skeletal Stock
	self.parts.wpn_fps_ass_galil_s_skeletal.pcs = {}
	self.parts.wpn_fps_ass_galil_s_skeletal.supported = true
	self.parts.wpn_fps_ass_galil_s_skeletal.stats = deep_clone(stocks.folder_to_nocheeks_stats)
	self.parts.wpn_fps_ass_galil_s_skeletal.custom_stats = deep_clone(stocks.folder_to_nocheeks_stats)
	--Plastic Stock
	self.parts.wpn_fps_ass_galil_s_plastic.pcs = {}
	self.parts.wpn_fps_ass_galil_s_plastic.supported = true
	self.parts.wpn_fps_ass_galil_s_plastic.stats = {
		value = 5,
		recoil = -2,
		spread = 1
	}
	--Wooden Stock
	self.parts.wpn_fps_ass_galil_s_wood.pcs = {}
	self.parts.wpn_fps_ass_galil_s_wood.supported = true
	self.parts.wpn_fps_ass_galil_s_wood.stats = {
		value = 3,
		recoil = 2,
		spread = -1
	}
	--Light Stock
	self.parts.wpn_fps_ass_galil_s_light.pcs = {}
	self.parts.wpn_fps_ass_galil_s_light.supported = true
	self.parts.wpn_fps_ass_galil_s_light.stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	self.parts.wpn_fps_ass_galil_s_light.custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	--Fabulous Stock
	self.parts.wpn_fps_ass_galil_s_fab.pcs = {}
	self.parts.wpn_fps_ass_galil_s_fab.supported = true
	self.parts.wpn_fps_ass_galil_s_fab.stats = deep_clone(stocks.folder_to_adj_rec_stats)
	self.parts.wpn_fps_ass_galil_s_fab.custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	--Sniper Stock
	self.parts.wpn_fps_ass_galil_s_sniper.pcs = {}
	self.parts.wpn_fps_ass_galil_s_sniper.supported = true
	self.parts.wpn_fps_ass_galil_s_sniper.stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)
	self.parts.wpn_fps_ass_galil_s_sniper.custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)


end)	

--Clarion 
Hooks:PostHook(WeaponFactoryTweakData, "_init_famas", "resmod_famas", function(self)

	--Long Barrel
	self.parts.wpn_fps_ass_famas_b_long.pcs = {}
	self.parts.wpn_fps_ass_famas_b_long.supported = true
	self.parts.wpn_fps_ass_famas_b_long.stats = deep_clone(barrels.long_b1_stats)
	self.parts.wpn_fps_ass_famas_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)
	
	--Short Barrel
	self.parts.wpn_fps_ass_famas_b_short.pcs = {}
	self.parts.wpn_fps_ass_famas_b_short.supported = true
	self.parts.wpn_fps_ass_famas_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_ass_famas_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Sniper Barrel
	self.parts.wpn_fps_ass_famas_b_sniper.pcs = {}
	self.parts.wpn_fps_ass_famas_b_sniper.supported = true
	self.parts.wpn_fps_ass_famas_b_sniper.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_ass_famas_b_sniper.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Suppressed Barrel
	self.parts.wpn_fps_ass_famas_b_suppressed.pcs = {}
	self.parts.wpn_fps_ass_famas_b_suppressed.supported = true
	self.parts.wpn_fps_ass_famas_b_suppressed.has_description = true
	self.parts.wpn_fps_ass_famas_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_ass_famas_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_ass_famas_b_suppressed.perks = {"silencer"}
	
	--G2 Grip
	self.parts.wpn_fps_ass_famas_g_retro.pcs = {}
	self.parts.wpn_fps_ass_famas_g_retro.supported = true
	self.parts.wpn_fps_ass_famas_g_retro.stats = {
		value = 2,
		concealment = -2,
		recoil = 4
	}

	self.wpn_fps_ass_famas.override = self.wpn_fps_ass_famas.override or {}
	self.wpn_fps_ass_famas.override.wpn_fps_snp_model70_iron_sight = { 
		adds = {"wpn_fps_gre_arbiter_o_standard", "wpn_fps_ass_groza_o_adapter"}
	}

	table.insert(self.wpn_fps_ass_famas.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_ass_famas_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")		

	self.wpn_fps_ass_famas_npc.override = deep_clone(self.wpn_fps_ass_famas.override)	
	self.wpn_fps_ass_famas_npc.uses_parts = deep_clone(self.wpn_fps_ass_famas.uses_parts)	
end)		

--Cobra 
Hooks:PostHook(WeaponFactoryTweakData, "_init_scorpion", "resmod_scorpion", function(self)

	--Suppressor
	self.parts.wpn_fps_smg_scorpion_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_scorpion_b_suppressed.supported = true
	self.parts.wpn_fps_smg_scorpion_b_suppressed.has_description = true
	self.parts.wpn_fps_smg_scorpion_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_scorpion_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_scorpion_b_suppressed.perks = {"silencer"}
	
	--Wooden Grip
	self.parts.wpn_fps_smg_scorpion_g_wood.pcs = {}
	self.parts.wpn_fps_smg_scorpion_g_wood.supported = true
	self.parts.wpn_fps_smg_scorpion_g_wood.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_smg_scorpion_g_ergo.pcs = {}
	self.parts.wpn_fps_smg_scorpion_g_ergo.supported = true
	self.parts.wpn_fps_smg_scorpion_g_ergo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_smg_scorpion_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Extended Mag (Fucking channelling the "extended" mag of the MP40 in CoD:WaW, lmao)
	self.parts.wpn_fps_smg_scorpion_m_extended.pcs = {}
	self.parts.wpn_fps_smg_scorpion_m_extended.supported = true
	self.parts.wpn_fps_smg_scorpion_m_extended.stats = {
		value = 3,
		concealment = -1,
		spread = -1,
		reload = 3
	}
	
	--No Stock
	self.parts.wpn_fps_smg_scorpion_s_nostock.pcs = {}
	self.parts.wpn_fps_smg_scorpion_s_nostock.supported = true
	self.parts.wpn_fps_smg_scorpion_s_nostock.stats = deep_clone(stocks.remove_folded_stats)
	self.parts.wpn_fps_smg_scorpion_s_nostock.stats.value = 0
	self.parts.wpn_fps_smg_scorpion_s_nostock.custom_stats = deep_clone(stocks.remove_folded_stats)

	--Unfolded Stock
	self.parts.wpn_fps_smg_scorpion_s_unfolded.pcs = {}
	self.parts.wpn_fps_smg_scorpion_s_unfolded.supported = true
	self.parts.wpn_fps_smg_scorpion_s_unfolded.stats = deep_clone(stocks.unfold_folded_stats)
	self.parts.wpn_fps_smg_scorpion_s_unfolded.stats.value = 0
	self.parts.wpn_fps_smg_scorpion_s_unfolded.custom_stats = deep_clone(stocks.unfold_folded_stats)

	self.parts.wpn_fps_smg_scorpion_body_standard_rail = deep_clone(self.parts.wpn_fps_smg_scorpion_body_standard)
	self.parts.wpn_fps_smg_scorpion_body_standard_rail.visibility = {
		{
			objects = {
				g_bolt_lod0 = false,
				g_body_lod0 = false
			}
		}
	}
	self.parts.wpn_fps_smg_scorpion_body_standard.visibility = {
		{
			objects = {
				g_rail_lod0 = false
			}
		}
	}

	--[
	self.wpn_fps_smg_scorpion.stock_adapter = "wpn_fps_gre_m32_stock_adapter"
	self.wpn_fps_smg_scorpion_npc.stock_adapter = "wpn_fps_gre_m32_stock_adapter"
	
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_smg_scorpion_s_nostock")	
	table.insert(self.wpn_fps_smg_scorpion.uses_parts, "wpn_fps_smg_scorpion_s_unfolded")	


	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_specter = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_aimpoint = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_aimpoint_2 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_docter = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_eotech = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_t1micro = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_cmore = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_acog = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_cs = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_eotech_xps = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_reflex = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_rx01 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_rx30 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_spot = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_bmg = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_uh = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_fc1 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_tf90 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_poe = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	-- VMP sight(s)
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_o_cqb = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }

	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folded_to_adj_rec2),
		custom_stats = deep_clone(stocks.folded_to_adj_rec2),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folded_to_hvy_rec3),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec3),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folded_to_hvy_rec2),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec2),
		adds = {"wpn_fps_smg_scorpion_extra_rail", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_scorpion.override.wpn_fps_gre_arbiter_o_standard_no_forbid = { 
		stance_mod = {
			wpn_fps_smg_scorpion = {
				translation = Vector3(-0.005, -5, -4.7)
			}
		}
	}

	self.wpn_fps_smg_scorpion_npc.override = deep_clone(self.wpn_fps_smg_scorpion.override)
	self.wpn_fps_smg_scorpion_npc.uses_parts = deep_clone(self.wpn_fps_smg_scorpion.uses_parts)
	--]]

end)

--Akimbo Cobra 
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_scorpion", "resmod_x_scorpion", function(self)

	self.wpn_fps_smg_x_scorpion.override = self.wpn_fps_smg_x_scorpion.override or {}
	self.wpn_fps_smg_x_scorpion.override.wpn_fps_smg_scorpion_m_extended = nil
	self.wpn_fps_smg_x_scorpion.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}
	
	self.wpn_fps_smg_x_scorpion.uses_parts[18] = "resmod_dummy"
	self.wpn_fps_smg_x_scorpion.uses_parts[19] = "resmod_dummy"
	self.wpn_fps_smg_x_scorpion.uses_parts[20] = "resmod_dummy"	
	table.insert(self.wpn_fps_smg_x_scorpion.uses_parts, "wpn_fps_smg_mac10_s_no")	

	self.wpn_fps_smg_x_scorpion_npc.override = deep_clone(self.wpn_fps_smg_x_scorpion.override)
	self.wpn_fps_smg_x_scorpion_npc.uses_parts = deep_clone(self.wpn_fps_smg_x_scorpion.uses_parts)

end)


Hooks:PostHook(WeaponFactoryTweakData, "init", "resmod_scorpion_rail", function(self)
	--Won't apply to all gadgets for some reason unless I hook into the main init func, whatever
	for i, part_id in pairs(self.wpn_fps_smg_scorpion.uses_parts) do
		if self.parts and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "gadget" and not self.parts[part_id].depends_on then
			if not self.wpn_fps_smg_scorpion.adds then
				self.wpn_fps_smg_scorpion.adds = {}
			end
			if not self.wpn_fps_smg_scorpion.adds[part_id] then
				self.wpn_fps_smg_scorpion.adds[part_id] = {}
			end
			table.insert(self.wpn_fps_smg_scorpion.adds[part_id], "wpn_fps_smg_scorpion_body_standard_rail")
		end
	end	
	self.wpn_fps_smg_scorpion_npc.override = deep_clone(self.wpn_fps_smg_scorpion.override)
	for i, part_id in pairs(self.wpn_fps_smg_x_scorpion.uses_parts) do
		if self.parts and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "gadget" and not self.parts[part_id].depends_on then
			if not self.wpn_fps_smg_x_scorpion.adds then
				self.wpn_fps_smg_x_scorpion.adds = {}
			end
			if not self.wpn_fps_smg_x_scorpion.adds[part_id] then
				self.wpn_fps_smg_x_scorpion.adds[part_id] = {}
			end
			table.insert(self.wpn_fps_smg_x_scorpion.adds[part_id], "wpn_fps_smg_scorpion_body_standard_rail")
		end
	end	
end)

--Blaster 9mm, now the T3K Urban
Hooks:PostHook(WeaponFactoryTweakData, "_init_tec9", "resmod_tec9", function(self)

	--Short Barrel
	self.parts.wpn_fps_smg_tec9_b_standard.pcs = {}
	self.parts.wpn_fps_smg_tec9_b_standard.supported = true
	self.parts.wpn_fps_smg_tec9_b_standard.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_smg_tec9_b_standard.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Ghetto Blaster
	self.parts.wpn_fps_smg_tec9_ns_ext.pcs = {}
	self.parts.wpn_fps_smg_tec9_ns_ext.supported = true
	self.parts.wpn_fps_smg_tec9_ns_ext.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_smg_tec9_ns_ext.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Extended Mag
	self.parts.wpn_fps_smg_tec9_m_extended.pcs = {}
	self.parts.wpn_fps_smg_tec9_m_extended.supported = true
	self.parts.wpn_fps_smg_tec9_m_extended.custom_stats = {
		ads_speed_mult = 1.075
	}
	self.parts.wpn_fps_smg_tec9_m_extended.stats = {
		value = 4,
		extra_ammo = 18,
		reload = -4,
		concealment = -3
	}
	
	--Just Bend It
	self.parts.wpn_fps_smg_tec9_s_unfolded.pcs = {}
	self.parts.wpn_fps_smg_tec9_s_unfolded.supported = true
	self.parts.wpn_fps_smg_tec9_s_unfolded.stats = deep_clone(stocks.add_nocheeks_stats)
	self.parts.wpn_fps_smg_tec9_s_unfolded.custom_stats = deep_clone(stocks.add_nocheeks_stats)

	--[
	self.wpn_fps_smg_tec9.stock_adapter = "wpn_fps_smg_shepheard_s_adapter"
	self.wpn_fps_smg_tec9_npc.stock_adapter = "wpn_fps_smg_shepheard_s_adapter"
	
	self.wpn_fps_smg_tec9.override = self.wpn_fps_smg_tec9.override or {}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_specter = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_aimpoint = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_aimpoint_2 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_docter = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_eotech = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_t1micro = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_cmore = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_acog = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_cs = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_eotech_xps = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_reflex = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_rx01 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_rx30 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_spot = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_bmg = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_uh = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_fc1 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_tf90 = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_poe = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }
	-- VMP sight
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_o_cqb = { forbids = {"wpn_fps_gre_arbiter_o_standard_no_forbid"} }

	self.wpn_fps_smg_tec9.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.add_adj_acc2_stats),
		custom_stats = deep_clone(stocks.add_adj_acc2_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.add_adj_acc3_stats),
		custom_stats = deep_clone(stocks.add_adj_acc3_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.add_adj_acc3_stats),
		custom_stats = deep_clone(stocks.add_adj_acc3_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.add_adj_stats),
		custom_stats = deep_clone(stocks.add_adj_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.add_adj_stats),
		custom_stats = deep_clone(stocks.add_adj_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.add_hvy_rec_stats),
		custom_stats = deep_clone(stocks.add_hvy_rec_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}
	self.wpn_fps_smg_tec9.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.add_hvy_acc_stats),
		custom_stats = deep_clone(stocks.add_hvy_acc_stats),
		adds = { "wpn_fps_shot_r870_ris_special", "wpn_fps_gre_arbiter_o_standard_no_forbid" },
		forbids = {}
	}	
	self.wpn_fps_smg_tec9.override.wpn_fps_gre_arbiter_o_standard_no_forbid = { 
		stance_mod = {
			wpn_fps_smg_tec9 = {
				translation = Vector3(0, -3, -4.6)
			}
		}
	}

	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_tec9.uses_parts, "wpn_fps_snp_tti_s_vltor")

	self.wpn_fps_smg_tec9_npc.override = deep_clone(self.wpn_fps_smg_tec9.override)
	self.wpn_fps_smg_tec9_npc.uses_parts = deep_clone(self.wpn_fps_smg_tec9.uses_parts)
	--]]

end)

--Uzi
Hooks:PostHook(WeaponFactoryTweakData, "_init_uzi", "resmod_uzi", function(self)

	--Silent Death
	self.parts.wpn_fps_smg_uzi_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_uzi_b_suppressed.supported = true
	self.parts.wpn_fps_smg_uzi_b_suppressed.has_description = true
	self.parts.wpn_fps_smg_uzi_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_uzi_b_suppressed.perks = {"silencer"}

	--Standard Foregrip
	self.parts.wpn_fps_smg_uzi_fg_standard.forbids = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla",
		"wpn_fps_smg_schakal_vg_surefire",
		"wpn_fps_upg_vg_ass_smg_stubby",
	}

	--Tactical Foregrip
	self.parts.wpn_fps_smg_uzi_fg_rail.pcs = {}
	self.parts.wpn_fps_smg_uzi_fg_rail.supported = true
	self.parts.wpn_fps_smg_uzi_fg_rail.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_smg_uzi_fg_rail.adds = {
		"wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
	}
	
	--Ergonomic Stock
	self.parts.wpn_fps_smg_uzi_s_leather.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_leather.supported = true
	self.parts.wpn_fps_smg_uzi_s_leather.stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats)
	self.parts.wpn_fps_smg_uzi_s_leather.custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats)
	
	--Solid Stock
	self.parts.wpn_fps_smg_uzi_s_solid.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_solid.supported = true
	self.parts.wpn_fps_smg_uzi_s_solid.stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	self.parts.wpn_fps_smg_uzi_s_solid.custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	
	--Folded Stock
	self.parts.wpn_fps_smg_uzi_s_standard.pcs = {}
	self.parts.wpn_fps_smg_uzi_s_standard.supported = true
	self.parts.wpn_fps_smg_uzi_s_standard.stats = deep_clone(stocks.fold_nocheeks_stats)
	self.parts.wpn_fps_smg_uzi_s_standard.stats.value = 0
	self.parts.wpn_fps_smg_uzi_s_standard.custom_stats = deep_clone(stocks.fold_nocheeks_stats)

	--Removes reciprocating charging handle upon shooting
	self.parts.wpn_fps_smg_uzi_body_standard.animations = {
		reload_not_empty = "reload_not_empty",
		reload = "reload"
	}	

	self.wpn_fps_smg_uzi.override = self.wpn_fps_smg_uzi.override or {}

	self.wpn_fps_smg_uzi.override.wpn_fps_upg_vg_ass_smg_stubby = {
		stats = {
			concealment = 1,
			recoil = -2
		},
		forbids = { "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla" }
	}
	self.wpn_fps_smg_uzi.override.wpn_fps_smg_schakal_vg_surefire = {
		forbids = { "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla" }
	}
	self.wpn_fps_smg_uzi.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_nocheeks_stats),
		custom_stats = deep_clone(stocks.remove_nocheeks_stats)
	}

	table.insert(self.wpn_fps_smg_uzi.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
	table.insert(self.wpn_fps_smg_uzi.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	table.insert(self.wpn_fps_smg_uzi.uses_parts, "wpn_fps_smg_mac10_s_no")

	self.wpn_fps_smg_uzi_npc.override = deep_clone(self.wpn_fps_smg_uzi.override)
	self.wpn_fps_smg_uzi_npc.uses_parts = deep_clone(self.wpn_fps_smg_uzi.uses_parts)
	
end)

--Skin Boosts
function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins)
	--Gotta keep the internal IDs intact to not anger remote JSONs and custom_xml. Using comments to note what is actually what.

	--Small Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p1_mod",
		a_obj = "a_body",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p1_sc",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1, concealment = 1, recoil = -2},
		custom_stats = { 
			empire = true,
			ads_speed_mult = 0.975
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--Large Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p2 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p2_mod",
		a_obj = "a_body",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2_sc",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1, concealment = 2, recoil = -4},
		custom_stats = { 
			empire = true,
			ads_speed_mult = 0.95
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--Massive Conceal
	self.parts.wpn_fps_upg_bonus_concealment_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_concealment_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p3_sc",
		supported = true,
		stats = {value = 1, concealment = 3, recoil = -6},
		custom_stats = { 
			empire = true,
			ads_speed_mult = 0.925
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}
	
	--This is where it gets messy
	--Small Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_damage_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p1_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_spread_p1_sc",
		supported = true,
		stats = {value = 1, spread = 1, concealment = -1},
		custom_stats = { 
			mandalorian = true,
			falloff_start_mult = 1.075,
			falloff_end_mult = 1.075,
			ads_speed_mult = 1.025
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}		
	
	--Large Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_damage_p2 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p2_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1_sc",
		supported = true,
		stats = {value = 1, spread = 2, concealment = -2},
		custom_stats = { 
			empire = true,
			mandalorian = true,
			falloff_start_mult = 1.15,
			falloff_end_mult = 1.15,
			ads_speed_mult = 1.05
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}		
	
	--Massive Accuracy Modifier
	self.parts.wpn_fps_upg_bonus_recoil_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_spread_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2_sc",
		supported = true,
		stats = {value = 1, spread = 3, concealment = -3},
		custom_stats = { 
			mandalorian = true,
			falloff_start_mult = 1.225,
			falloff_end_mult = 1.225,
			ads_speed_mult = 1.075
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Small Stability Modifier
	self.parts.wpn_fps_upg_bonus_spread_n1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p1_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_recoil_p1_sc",
		supported = true,
		stats = {value = 1, spread = -1, recoil = 2},
		custom_stats = {
			republic = true,
			falloff_start_mult = 0.925,
			falloff_end_mult = 0.925
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Large Stability Modifier		
	self.parts.wpn_fps_upg_bonus_spread_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p2_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_total_ammo_p1_sc",
		supported = true,
		stats = {value = 1, spread = -2, recoil = 4},
		custom_stats = {
			republic = true,
			falloff_start_mult = 0.85,
			falloff_end_mult = 0.85
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}

	--Massive Recoil Modifier
	self.parts.wpn_fps_upg_bonus_team_exp_money_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_menu_bonus_recoil_p3_mod",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_spread_n1_sc",
		supported = true,
		stats = {value = 1, spread = -3, recoil = 6},
		custom_stats = { 
			republic = true,
			falloff_start_mult = 0.775,
			falloff_end_mult = 0.775
		},
		internal_part = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats"
	}		
	
	--Team Boost
	self.parts.wpn_fps_upg_bonus_total_ammo_p3 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_team_exp_money_p3",
		desc_id = "bm_wp_upg_bonus_team_exp_money_p3_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 1},
		custom_stats = {exp_multiplier = 1.05, money_multiplier = 1, techno_union = true},
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_team_exp_money_p3_sc",
		internal_part = true,
		has_description = true,
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_team",
		exclude_from_challenge = true
	}		

	--Money Boost
	self.parts.wpn_fps_upg_bonus_total_ammo_p1 = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_team_money_exp_p1",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_total_ammo_p3_sc",
		supported = true,
		stats = {value = 1},
		internal_part = true,
		custom_stats = {money_multiplier = 1.05, exp_multiplier = 1, techno_union = true},
		perks = {"bonus"},
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_team",
		has_description = true,
		exclude_from_challenge = true
	}
	
	self.parts.wpn_fps_upg_bonus_sc_none = {
		pcs = {},
		type = "bonus",
		name_id = "bm_wp_upg_bonus_sc_none",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_sc_none",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		is_a_unlockable = true,
		dlc = "sc",
		perks = {"bonus"},
		has_description = true,
		texture_bundle_folder = "boost_in_lootdrop",
		sub_type = "bonus_stats",
		exclude_from_challenge = true
	}
	if weapon_skins then
			local uses_parts = {
				wpn_fps_upg_bonus_team_exp_money_p3 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_concealment_p1 = {
					exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_recoil_p1 = {
					exclude_category = {"saw", "bow"},
					exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_spread_p1 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_spread_n1 = {
			exclude_category = {"saw", "bow"}
		},
				wpn_fps_upg_bonus_damage_p1 = {
			exclude_category = {"saw", "bow"},
			exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_total_ammo_p1 = {
		},
				wpn_fps_upg_bonus_concealment_p2 = {
			exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_concealment_p3 = {
			exclude_category = {"saw"}
		},
				wpn_fps_upg_bonus_damage_p2 = {
			exclude_category = {"saw", "bow"},
			exclude_weapon = {"x_judge"}
		},
				wpn_fps_upg_bonus_total_ammo_p3 = {
		},
		wpn_fps_upg_bonus_sc_none = {}
			}
		local all_pass, weapon_pass, exclude_weapon_pass, category_pass, exclude_category_pass
		for id, data in pairs(tweak_data.upgrades.definitions) do
			local weapon_tweak = tweak_data.weapon[data.weapon_id]
			local primary_category = weapon_tweak and weapon_tweak.categories and weapon_tweak.categories[1]
			if data.weapon_id and weapon_tweak and data.factory_id and self[data.factory_id] then
				for part_id, params in pairs(uses_parts) do
					weapon_pass = not params.weapon or table.contains(params.weapon, data.weapon_id)
					exclude_weapon_pass = not params.exclude_weapon or not table.contains(params.exclude_weapon, data.weapon_id)
					category_pass = not params.category or table.contains(params.category, primary_category)
					exclude_category_pass = not params.exclude_category or not table.contains(params.exclude_category, primary_category)
					all_pass = weapon_pass and exclude_weapon_pass and category_pass and exclude_category_pass
					if all_pass then
						table.insert(self[data.factory_id].uses_parts, part_id)
						table.insert(self[data.factory_id .. "_npc"].uses_parts, part_id)
					end
				end
			end
		end
		end
end

--Ammunition
Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "resmod_create_ammunition", function(self)

	--Slugs
	self.parts.wpn_fps_upg_a_slug.pcs = {}
	self.parts.wpn_fps_upg_a_slug.name_id = "bm_wp_upg_a_slug_sc"
	self.parts.wpn_fps_upg_a_slug.desc_id = "bm_wp_upg_a_slug_desc"
	self.parts.wpn_fps_upg_a_slug.supported = true
	self.parts.wpn_fps_upg_a_slug.stats = {
		value = 10,
		concealment = -3,
		total_ammo_mod = -25,
		damage = 30,	
		recoil = -20,
		spread = 12,
		spread_multi = {1, 1},	
		suppression = -1,
		moving_spread = 0
	}
	self.parts.wpn_fps_upg_a_slug.custom_stats = {
		muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",												
		rays = 1,
		armor_piercing_add = 1,
		ammo_pickup_max_mul = 0.8,
		ammo_pickup_min_mul = 0.8,
		can_shoot_through_enemy = true,
		can_shoot_through_shield = true,
		can_shoot_through_wall = true,
		falloff_start_mult = 1.25,
		falloff_end_mult = 2.0,
		ads_speed_mult = 1.0
	}
	
	--000 Buck
	self.parts.wpn_fps_upg_a_custom.pcs = {}
	self.parts.wpn_fps_upg_a_custom.supported = true
	self.parts.wpn_fps_upg_a_custom.stats = {
		value = 9,
		spread = -5,
		total_ammo_mod = -25,
		damage = 30
	}
	self.parts.wpn_fps_upg_a_custom.custom_stats = {
		falloff_end_mult = 0.8,
		damage_min_mult = 0.75,
		ammo_pickup_max_mul = 0.8,
		ammo_pickup_min_mul = 0.8,
		rays = 6
	}
	
	--000 Buck (Free)
	self.parts.wpn_fps_upg_a_custom_free = deep_clone(self.parts.wpn_fps_upg_a_custom)
	self.parts.wpn_fps_upg_a_custom_free.dlc = nil
	self.parts.wpn_fps_upg_a_custom_free.is_a_unlockable = true
	self.parts.wpn_fps_upg_a_custom_free.alt_icon = "guis/dlcs/gage_pack_shotgun/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_a_custom"

	--HE Shells
	self.parts.wpn_fps_upg_a_explosive.pcs = {}
	self.parts.wpn_fps_upg_a_explosive.desc_id = "bm_wp_upg_a_explosive_desc_sc"
	self.parts.wpn_fps_upg_a_explosive.supported = true
	self.parts.wpn_fps_upg_a_explosive.stats = {
		value = 10,
		total_ammo_mod = -16,
		damage = 90,
		recoil = -25,
		spread = 5,
		spread_multi = {1, 1},	
		concealment = -5,
		moving_spread = 3
	}
	self.parts.wpn_fps_upg_a_explosive.custom_stats = {
		ammo_pickup_max_mul = 0.8,
		ammo_pickup_min_mul = 0.8,
		ignore_statistic = true,
		rays = 1,
		block_b_storm = true,	
		bullet_class = "InstantExplosiveBulletBase",
		sms = 0.85
	}
	
	--Flechettes
	--This part description covers heavy shotguns, other damage tiers are handled via overrides.
	self.parts.wpn_fps_upg_a_piercing.name_id = "bm_wp_upg_a_piercing"
	self.parts.wpn_fps_upg_a_piercing.desc_id = "bm_wp_upg_a_piercing_heavy_desc_sc"
	self.parts.wpn_fps_upg_a_piercing.pcs = {}
	self.parts.wpn_fps_upg_a_piercing.supported = true
	self.parts.wpn_fps_upg_a_piercing.stats = {
		value = 9,
		damage = -30,
		spread = 5
	}
	self.parts.wpn_fps_upg_a_piercing.custom_stats = {
		trail_effect = "_dmc/effects/nato_trail",
		falloff_start_mult = 1,
		falloff_end_mult = 1.25,
		damage_min_mult = 5,
		armor_piercing_add = 1,
		rays = 12,		
		--[[
		bullet_class = "BleedBulletBase",
		dot_data = { 
			type = "bleed",
			custom_data = {
				dot_damage = 1.5,
				dot_length = 8.1,
				dot_tick_period = 0.5
			}
		}
		--]]
	}

	--Dragon's Breath
	--This part description covers heavy shotguns, other damage tiers are handled via overrides.
	self.parts.wpn_fps_upg_a_dragons_breath.pcs = {}
	self.parts.wpn_fps_upg_a_dragons_breath.name_id = "bm_wp_upg_a_dragons_breath"
	self.parts.wpn_fps_upg_a_dragons_breath.desc_id = "bm_wp_upg_a_dragons_breath_heavy_desc_sc"
	self.parts.wpn_fps_upg_a_dragons_breath.supported = true
	self.parts.wpn_fps_upg_a_dragons_breath.stats = {
		value = 9,
		damage = -30
	}
	self.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
		falloff_start_mult = 0.8,
		falloff_end_mult = 0.8,
		damage_min_mult = 0,
		ignore_statistic = true,
		bullet_class = "FlameBulletBase",
		armor_piercing_add = 0.01,				
		can_shoot_through_shield = false,
		rays = 16,
		trail_effect = "",
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		fire_dot_data = {
			dot_damage = 4,
			dot_trigger_chance = 45,
			dot_length = 3.1,
			dot_tick_period = 0.5
		}
	}
	self.parts.wpn_fps_upg_a_dragons_breath.forbids = {
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_sho_aa12_barrel_silenced",
		"wpn_fps_sho_striker_b_suppressed"
	}

	--Tombstone Buck
	--This part description covers heavy shotguns, other damage tiers are handled via overrides.
	self.parts.wpn_fps_upg_a_rip.pcs = {}
	self.parts.wpn_fps_upg_a_rip.name_id = "bm_wp_upg_a_rip"
	self.parts.wpn_fps_upg_a_rip.desc_id = "bm_wp_upg_a_rip_heavy_desc_sc"
	self.parts.wpn_fps_upg_a_rip.supported = true
	self.parts.wpn_fps_upg_a_rip.stats = {
		value = 9,
		damage = -30
	}
	self.parts.wpn_fps_upg_a_rip.custom_stats = {
		trail_effect = "_dmc/effects/warsaw_trail",
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_rip",
		bullet_class = "PoisonBulletBase",
		dot_data = { 
			type = "poison",
			custom_data = {
				dot_damage = 1.5,
				dot_length = 8.1,
				dot_tick_period = 0.5,
				use_weapon_damage_falloff = true,
				duration_falloff_end_mult = 0.5,
				hurt_animation_chance = 0.20
			}
		}
	}

	--Frag Rounds (BYK-1)
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.pcs = {}
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.has_description = true
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.desc_id = "bm_wp_upg_a_grenade_launcher_frag_desc_sc"
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.supported = true
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.stats = {}
	self.parts.wpn_fps_upg_a_underbarrel_frag_groza.custom_stats = {
		launcher_grenade = "launcher_m203"
	}	
	--Underbarrel Electric Grenades
	self.parts.wpn_fps_upg_a_underbarrel_electric.pcs = {}
	self.parts.wpn_fps_upg_a_underbarrel_electric.has_description = true
	self.parts.wpn_fps_upg_a_underbarrel_electric.desc_id = "bm_wp_upg_a_grenade_launcher_electric_desc_sc"
	self.parts.wpn_fps_upg_a_underbarrel_electric.supported = true
	self.parts.wpn_fps_upg_a_underbarrel_electric.stats = {}
	self.parts.wpn_fps_upg_a_underbarrel_electric.custom_stats = {
		launcher_grenade = "underbarrel_electric"
	}		

	--Incendiary Round
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.name_id = "bm_wp_upg_a_grenade_launcher_incendiary"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.desc_id = "bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.stats = { damage = -60 }
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary.custom_stats = {
		launcher_grenade = "launcher_incendiary"
	}
	--Tactical ZAPpers (Normal GLs)
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.desc_id = "bm_wp_upg_a_grenade_launcher_electric_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.stats = { damage = -36 }
	self.parts.wpn_fps_upg_a_grenade_launcher_electric.custom_stats = {
		launcher_grenade = "launcher_electric"
	}			
	--Poison Gas (Normal GLs)
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.desc_id = "bm_wp_upg_a_grenade_launcher_poison_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.stats = { damage = -69 }
	self.parts.wpn_fps_upg_a_grenade_launcher_poison.custom_stats = {
		launcher_grenade = "launcher_poison"
	}
	
	
	--Incendiary Round (Arbiter)
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.desc_id = "bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.stats = { damage = -52 }
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_arbiter.custom_stats = {
		launcher_grenade = "launcher_incendiary_arbiter"
	}
	--Tactical ZAPpers (Arbiter)
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.desc_id = "bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.stats = { damage = -30 }
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_arbiter.custom_stats = {
		launcher_grenade = "launcher_electric_arbiter"
	}
	--Poison Gas (Arbiter)
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.desc_id = "bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.stats = { damage = -57 }
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_arbiter.custom_stats = {
		launcher_grenade = "launcher_poison_arbiter"
	}


	--3GL Ammo
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.desc_id = "bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.stats = { damage = -32 }
	self.parts.wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl.custom_stats = {
		launcher_grenade = "launcher_incendiary"
	}
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.desc_id = "bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.stats = { damage = -18 }
	self.parts.wpn_fps_upg_a_grenade_launcher_electric_ms3gl.custom_stats = {
		launcher_grenade = "launcher_electric"
	}
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.pcs = {}
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.has_description = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.desc_id = "bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.supported = true
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.stats = { damage = -33 }
	self.parts.wpn_fps_upg_a_grenade_launcher_poison_ms3gl.custom_stats = {
		launcher_grenade = "launcher_poison"
	}			
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.pcs = {}
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.has_description = true
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.desc_id = "bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.supported = true
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.stats = { damage = -33 }
	self.parts.wpn_fps_gre_ms3gl_conversion_grenade_poison.custom_stats = {
		launcher_grenade = "launcher_poison"
	}
	self.parts.wpn_fps_gre_ms3gl_conversion.forbids = {
		"wpn_fps_addon_ris"
	}
	self.parts.wpn_fps_gre_ms3gl_conversion.adds = {}

		
	-- [[
	--Underbarrel Slug Single Launcher (Temporarily disabled)
	self.parts.wpn_fps_pis_type54_underbarrel_slug.pcs = nil
	self.parts.wpn_fps_pis_type54_underbarrel_slug.supported = true
	self.parts.wpn_fps_pis_type54_underbarrel_slug.stats = {}	
	self.parts.wpn_fps_pis_type54_underbarrel_slug.custom_stats = {}	

	--Underbarrel Slug Double Launcher
	self.parts.wpn_fps_pis_x_type54_underbarrel_slug.pcs = nil
	self.parts.wpn_fps_pis_x_type54_underbarrel_slug.supported = true
	self.parts.wpn_fps_pis_x_type54_underbarrel_slug.stats = {}
	self.parts.wpn_fps_pis_x_type54_underbarrel_slug.custom_stats = {}
	
	--Underbarrel Slug Ammo
	self.parts.wpn_fps_upg_a_slug_underbarrel.pcs = nil
	self.parts.wpn_fps_upg_a_slug_underbarrel.supported = true
	self.parts.wpn_fps_upg_a_slug_underbarrel.stats = {}
	self.parts.wpn_fps_upg_a_slug_underbarrel.custom_stats = {}	
	
	--Underbarrel Flechettes (Ditto)
	self.parts.wpn_fps_pis_type54_underbarrel_piercing.pcs = nil
	self.parts.wpn_fps_pis_type54_underbarrel_piercing.supported = true
	self.parts.wpn_fps_pis_type54_underbarrel_piercing.stats = {}	
	self.parts.wpn_fps_pis_type54_underbarrel_piercing.custom_stats = {}	
	
	self.parts.wpn_fps_pis_x_type54_underbarrel_piercing.pcs = nil
	self.parts.wpn_fps_pis_x_type54_underbarrel_piercing.supported = true
	self.parts.wpn_fps_pis_x_type54_underbarrel_piercing.stats = {}	
	self.parts.wpn_fps_pis_x_type54_underbarrel_piercing.custom_stats = {}	
	
	--Underbarrel Flechettes Ammo
	self.parts.wpn_fps_upg_a_piercing_underbarrel.pcs = nil
	self.parts.wpn_fps_upg_a_piercing_underbarrel.supported = true
	self.parts.wpn_fps_upg_a_piercing_underbarrel.stats = {}
	self.parts.wpn_fps_upg_a_piercing_underbarrel.custom_stats = {}		
	--]]

	--You're pretty good
	self.parts.wpn_fps_upg_pis_adam = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_ricochet",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		texture_bundle_folder = "mmo",
		is_a_unlockable = true,
		supported = true,
		stats = {},
		custom_stats = {
			bullet_class = "InstantRicochetBulletBase"
		},
		internal_part = true,
		sub_type = "adam"
	}

end)

--Chimano Compact
Hooks:PostHook(WeaponFactoryTweakData, "_init_g26", "resmod_g26", function(self)

	self.parts.wpn_fps_pis_g26_b_standard.animations = {
		reload = "reload",
		fire = "recoil",
		fire_steelsight = "recoil",
		magazine_empty = "last_recoil"
	}
	
	--Striking Slide
	self.parts.wpn_fps_pis_g26_b_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_b_custom.supported = true
	self.parts.wpn_fps_pis_g26_b_custom.stats = {
		value = 5,
		spread = 1,
		recoil = -2
	}
	self.parts.wpn_fps_pis_g26_b_custom.animations = {
		reload = "reload",
		fire = "recoil",
		fire_steelsight = "recoil",
		magazine_empty = "last_recoil"
	}
	
	--Striking Body Kit
	self.parts.wpn_fps_pis_g26_body_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_body_custom.supported = true
	self.parts.wpn_fps_pis_g26_body_custom.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--Platypus Grip
	self.parts.wpn_fps_pis_g26_g_gripforce.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_g_gripforce.supported = true
	self.parts.wpn_fps_pis_g26_g_gripforce.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--Laser Grip
	self.parts.wpn_fps_pis_g26_g_laser.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_g_laser.supported = true
	self.parts.wpn_fps_pis_g26_g_laser.stats = {
		value = 4
	}
	self.parts.wpn_fps_pis_g26_g_laser.perks = {"gadget"}
	
	--Striking Mag
	self.parts.wpn_fps_pis_g26_m_contour.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_g26_m_contour.supported = true
	self.parts.wpn_fps_pis_g26_m_contour.stats = {
		value = 5,
		extra_ammo = 2,
		concealment = -1,
		reload = -1
	}
	
	--Micro Laser
	self.parts.wpn_fps_upg_fl_pis_crimson.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_crimson.supported = true
	self.parts.wpn_fps_upg_fl_pis_crimson.stats = {
		value = 4
	}
	
	--Combined Module
	self.parts.wpn_fps_upg_fl_pis_x400v.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_x400v.supported = true
	self.parts.wpn_fps_upg_fl_pis_x400v.stats = {
		value = 5
	}
	self.parts.wpn_fps_upg_fl_pis_x400v.perks = {"gadget"}
	
	--Champion's Suppressor
	self.parts.wpn_fps_upg_ns_pis_large_kac.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_large_kac.supported = true
	self.parts.wpn_fps_upg_ns_pis_large_kac.has_description = true
	self.parts.wpn_fps_upg_ns_pis_large_kac.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_large_kac.stats = deep_clone(muzzle_device.supp_c_alt_stats)
	self.parts.wpn_fps_upg_ns_pis_large_kac.perks = {"silencer"}
	
	--Roctec Suppressor
	self.parts.wpn_fps_upg_ns_pis_medium_gem.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_medium_gem.supported = true
	self.parts.wpn_fps_upg_ns_pis_medium_gem.has_description = true
	self.parts.wpn_fps_upg_ns_pis_medium_gem.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats = deep_clone(muzzle_device.supp_b_alt_stats)
	self.parts.wpn_fps_upg_ns_pis_medium_gem.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
	self.parts.wpn_fps_upg_ns_pis_medium_gem.perks = {"silencer"}
	
	--Facepunch Compensator
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.supported = true
	self.parts.wpn_fps_upg_ns_pis_meatgrinder.stats = deep_clone(muzzle_device.muzzle_c_alt_stats)
	
	--IPSC Compensator
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.supported = true
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.stats = deep_clone(muzzle_device.muzzle_c_stats)
	self.parts.wpn_fps_upg_ns_pis_ipsccomp.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)
	
	self.wpn_fps_pis_g26.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 23,
			concealment = -3,
			reload = -4
		}
	}
	
	--Parts
	self.wpn_fps_pis_g26.uses_parts[27] = "resmod_dummy"
	
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_g26_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_g26_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
	table.insert(self.wpn_fps_pis_g26.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")
	table.insert(self.wpn_fps_pis_g26_npc.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")		
	
	self.wpn_fps_pis_g26_npc.uses_parts = deep_clone(self.wpn_fps_pis_g26.uses_parts)	

end)

--Akimbo Chimano Compact
Hooks:PostHook(WeaponFactoryTweakData, "_init_jowi", "resmod_jowi", function(self)

	--Overrides
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_m_contour = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 5,
			extra_ammo = 4,
			concealment = -1,
			reload = -1
		}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 46,
			concealment = -3,
			reload = -4
		}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_b_standard = {
		animations = {
			reload = "reload_right", 
			reload_left = "reload_left", 
			fire = "recoil", 
			fire_steelsight = "recoil"}
	}
	self.wpn_fps_jowi.override.wpn_fps_pis_g26_b_custom = {
		animations = {
			reload = "reload_right", 
			reload_left = "reload_left", 
			fire = "recoil", 
			fire_steelsight = "recoil"}
	}
	
	--Parts
	self.wpn_fps_jowi.uses_parts[26] = "resmod_dummy"
	
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_jowi_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_jowi_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	
	table.insert(self.wpn_fps_jowi.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")
	table.insert(self.wpn_fps_jowi_npc.uses_parts, "wpn_fps_pis_g18c_m_mag_33rnd")		
	
	self.wpn_fps_jowi_npc.uses_parts = deep_clone(self.wpn_fps_jowi.uses_parts)	

end)

--Akimbo Crosskill .45s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_1911", "resmod_x_1911", function(self)

	--Overrides
	self.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 3,
			concealment = -1,
			extra_ammo = 8,
			reload = -1
		}
	}
	self.wpn_fps_x_1911.override.wpn_fps_pis_1911_m_big = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -2,
			extra_ammo = 12,		
			reload = -2
		}
	}

	self.wpn_fps_x_1911_npc.override = deep_clone(self.wpn_fps_x_1911.override)	
	self.wpn_fps_x_1911_npc.uses_parts = deep_clone(self.wpn_fps_x_1911.uses_parts)	
end)

--Akimbo Bernetti 9s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_b92fs", "resmod_x_b92fs", function(self)

	--Overrides
	self.wpn_fps_x_b92fs.override.wpn_fps_pis_beretta_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -1,
			extra_ammo = 28,
			reload = -2
		}
	}

	self.wpn_fps_x_b92fs_npc.override = deep_clone(self.wpn_fps_x_b92fs.override)	
	self.wpn_fps_x_b92fs_npc.uses_parts = deep_clone(self.wpn_fps_x_b92fs.uses_parts)	
end)

--Akimbo Deagles
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_deagle", "resmod_x_deagle", function(self)

	self.wpn_fps_x_deagle.override.wpn_fps_pis_deagle_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 5,
			concealment = -1,
			reload = -1,
			extra_ammo = 12
		}
	}
	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_x_deagle.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	
	self.wpn_fps_x_deagle_npc.override = deep_clone(self.wpn_fps_x_deagle.override)	
	self.wpn_fps_x_deagle_npc.uses_parts = deep_clone(self.wpn_fps_x_deagle.uses_parts)	
end)

--Predator 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_spas12", "resmod_spas12", function(self)

	--Extended Mag
	self.parts.wpn_fps_sho_b_spas12_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_b_spas12_long.supported = true
	self.parts.wpn_fps_sho_b_spas12_long.stats = {
		value = 1,
		concealment = -1,
		extra_ammo = 2
	}
	
	--Folded Stock
	self.parts.wpn_fps_sho_s_spas12_folded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_folded.supported = true
	self.parts.wpn_fps_sho_s_spas12_folded.stats = deep_clone(stocks.fold_nocheeks_stats)
	self.parts.wpn_fps_sho_s_spas12_folded.custom_stats = deep_clone(stocks.fold_nocheeks_stats)
	
	--No Stock
	self.parts.wpn_fps_sho_s_spas12_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_nostock.supported = true
	self.parts.wpn_fps_sho_s_spas12_nostock.stats = deep_clone(stocks.remove_nocheeks_stats)
	self.parts.wpn_fps_sho_s_spas12_nostock.custom_stats = deep_clone(stocks.remove_nocheeks_stats)
	
	--Solid Stock
	self.parts.wpn_fps_sho_s_spas12_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_s_spas12_solid.supported = true
	self.parts.wpn_fps_sho_s_spas12_solid.stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	self.parts.wpn_fps_sho_s_spas12_solid.custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	
	--Overrides
	self.wpn_fps_sho_spas12.override = self.wpn_fps_sho_spas12.override or {}

	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_slug = a_slug_semi_override
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_custom = a_custom_semi_override
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_custom_free = a_custom_semi_override		
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_explosive = a_explosive_semi_override
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_rip = a_rip_semi_override
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_piercing = a_piercing_semi_override
	self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
end)

--Buzzsaw 42
Hooks:PostHook(WeaponFactoryTweakData, "_init_mg42", "resmod_mg42", function(self)
	
	--Light Barrel
	self.parts.wpn_fps_lmg_mg42_b_mg34.pcs = {}
	self.parts.wpn_fps_lmg_mg42_b_mg34.supported = true
	self.parts.wpn_fps_lmg_mg42_b_mg34.stats = {
		value = 1,
		recoil = 6
	}
	self.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats = {rof_mult = 0.667}
	--self.parts.wpn_fps_lmg_mg42_b_mg34.has_description = true
	--self.parts.wpn_fps_lmg_mg42_b_mg34.desc_id = "bm_wp_mg42_b_mg34_desc_sc"
	
	--Heatsinked Suppressed Barrel
	self.parts.wpn_fps_lmg_mg42_b_vg38.pcs = {}
	self.parts.wpn_fps_lmg_mg42_b_vg38.supported = true
	self.parts.wpn_fps_lmg_mg42_b_vg38.has_description = true
	self.parts.wpn_fps_lmg_mg42_b_vg38.desc_id = "bm_wp_mg42_b_vg38_desc_sc"
	self.parts.wpn_fps_lmg_mg42_b_vg38.stats = {
		value = 10,
		recoil = 4,
		extra_ammo = -10
	}		
	self.parts.wpn_fps_lmg_mg42_b_vg38.custom_stats = {
		muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence_fps",
		starwars = true,
		regen_ammo_time = 2, 
		regen_rate = 9, 
		overheat_pen = 4, 
		regen_rate_overheat = 4.5, 
		rof_mult = 0.52083,
		armor_piercing_override = 0.2,
		falloff_start_mult = 1.25,
		falloff_end_mult = 1.25
	}
	table.insert(self.parts.wpn_fps_lmg_mg42_b_vg38.forbids, "wpn_fps_lmg_mg42_dummy_mag")
	table.insert(self.parts.wpn_fps_lmg_mg42_b_vg38.forbids, "wpn_fps_upg_ns_ass_filter")
	self.parts.wpn_fps_lmg_mg42_b_vg38.sub_type = nil
	self.parts.wpn_fps_lmg_mg42_b_vg38.perks = nil--{"silencer"}

	--Bringing back my old MG42 mag/belt fix method for more accurate looking DLT-19
	self.parts.wpn_fps_lmg_mg42_dummy_mag = deep_clone(self.parts.wpn_fps_lmg_mg42_reciever)	
	self.parts.wpn_fps_lmg_mg42_dummy_mag.type = "ammo"
	self.parts.wpn_fps_lmg_mg42_dummy_mag.adds = nil
	self.parts.wpn_fps_lmg_mg42_dummy_mag.bullet_objects = {
		prefix = "g_bullet_", 
		amount = 6
	}
	self.parts.wpn_fps_lmg_mg42_dummy_mag.visibility = {
		{
			objects = {
				g_handle = false,
				g_base = false,
				g_handle_loose = false,
				g_lid = false,
				g_lock = false,
			}
		}
	}

	--Unless you rebuy, changing/reverting the "type" of an attachment for a blueprint attached item leads to a freeze, so this is staying as such
	self.parts.wpn_fps_lmg_mg42_reciever.type = "magazine_extra"
	self.parts.wpn_fps_lmg_mg42_reciever.visibility = {
		{
			objects = {
				g_mag = false,
				g_mag_handle = false,
				g_bullet_1 = false,
				g_bullet_2 = false,
				g_bullet_3 = false,
				g_bullet_4 = false,
				g_bullet_5 = false,
				g_bullet_6 = false,
				g_band_1 = false,
				g_band_2 = false,
				g_band_3 = false,
				g_band_4 = false
			}
		}
	}
	self.parts.wpn_fps_lmg_mg42_reciever.adds = {"wpn_fps_lmg_mg42_dummy_mag"}

	self.wpn_fps_lmg_mg42.override = self.wpn_fps_lmg_mg42.override or {}

	self.wpn_fps_lmg_mg42.override.wpn_fps_snp_mosin_rail = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_specter = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_aimpoint = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_docter = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_eotech = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_t1micro = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_cmore = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_aimpoint_2 = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_cs = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_rx30 = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_rx01 = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_reflex = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_eotech_xps = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_sig = {
		parent = "magazine_extra"
	}	
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_uh = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_fc1 = {
		parent = "magazine_extra"
	}
	self.wpn_fps_lmg_mg42.override.wpn_fps_upg_ns_ass_filter = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	
	--Rails
	self.wpn_fps_lmg_mg42.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_docter = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cmore = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_acog = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_cs = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_reflex = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_45iron = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_leupold = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_sig = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_uh = { "wpn_fps_snp_mosin_rail" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_snp_mosin_rail" },
		shortdot_normal = { "wpn_fps_snp_mosin_rail" },
	}

	--Buzzsaw Part Additions
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_rx01")	
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_reflex")	
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_uh")	
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_ns_ass_filter")
			
	self.wpn_fps_lmg_mg42_npc.adds = deep_clone(self.wpn_fps_lmg_mg42.adds)			
	self.wpn_fps_lmg_mg42_npc.override = deep_clone(self.wpn_fps_lmg_mg42.override)			
	self.wpn_fps_lmg_mg42_npc.uses_parts = deep_clone(self.wpn_fps_lmg_mg42.uses_parts)			

end)

--Broomstick
Hooks:PostHook(WeaponFactoryTweakData, "_init_c96", "resmod_c96", function(self)
	
	--Precision Barrel
	self.parts.wpn_fps_pis_c96_b_long.pcs = {}
	self.parts.wpn_fps_pis_c96_b_long.supported = true
	self.parts.wpn_fps_pis_c96_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_c96_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Damper.L 44 Nozzle
	self.parts.wpn_fps_pis_c96_nozzle.pcs = {}
	self.parts.wpn_fps_pis_c96_nozzle.supported = true
	self.parts.wpn_fps_pis_c96_nozzle.has_description = true
	self.parts.wpn_fps_pis_c96_nozzle.desc_id = "bm_wp_c96_nozzle_desc_sc"
	self.parts.wpn_fps_pis_c96_nozzle.stats = {
		value = 6,
		recoil = 4,
		extra_ammo = 2
	}
	self.parts.wpn_fps_pis_c96_nozzle.custom_stats = { 
		muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence_fps",
		starwars = true,
		regen_ammo_time = 1.5, 
		regen_rate = 3,
		overheat_pen = 2, 
		regen_rate_overheat = 2,
		rof_mult = 0.35,
		falloff_start_mult = 1.25,
		falloff_end_mult = 1.25,
		armor_piercing_override = 0.8

	}
	self.parts.wpn_fps_pis_c96_nozzle.forbids = {"wpn_fps_pis_c96_m_extended"}
	self.parts.wpn_fps_pis_c96_nozzle.sub_type = nil--"silencer"
	self.parts.wpn_fps_pis_c96_nozzle.perks = { "fire_mode_single" }
	
	--Barrel Sight 44
	self.parts.wpn_fps_pis_c96_sight.pcs = {}
	self.parts.wpn_fps_pis_c96_sight.has_description = true
	self.parts.wpn_fps_pis_c96_sight.desc_id = "bm_wp_upg_o_5"
	self.parts.wpn_fps_pis_c96_sight.supported = true
	self.parts.wpn_fps_pis_c96_sight.custom_stats = { disable_steelsight_recoil_anim = true }
	self.parts.wpn_fps_pis_c96_sight.stats = {
		value = 1,
		zoom = 40
	}
	self.parts.wpn_fps_pis_c96_sight.perks = {"scope"}
	self.parts.wpn_fps_pis_c96_sight.reticle_obj = nil
	self.parts.wpn_fps_pis_c96_sight.stance_mod = {
		wpn_fps_pis_c96 = {
			translation = Vector3(-3.4055, -36, 0.923)
		}
	}

	--High Capacity Mag
	self.parts.wpn_fps_pis_c96_m_extended.pcs = {}
	self.parts.wpn_fps_pis_c96_m_extended.supported = true
	self.parts.wpn_fps_pis_c96_m_extended.stats = {
		value = 1,
		concealment = -1,
		extra_ammo = 10
	}

	--Holster Stock
	self.parts.wpn_fps_pis_c96_s_solid.pcs = {}
	self.parts.wpn_fps_pis_c96_s_solid.supported = true
	self.parts.wpn_fps_pis_c96_s_solid.stats = deep_clone(stocks.add_fixed_stats)
	self.parts.wpn_fps_pis_c96_s_solid.custom_stats = deep_clone(stocks.add_fixed_stats)
	
	--Extra Barrel Extensions
	table.insert(self.wpn_fps_pis_c96.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_c96_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_c96.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_c96_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_c96_npc.uses_parts = deep_clone(self.wpn_fps_pis_c96.uses_parts)		
	
end)

--Patchett L2A1
Hooks:PostHook(WeaponFactoryTweakData, "_init_sterling", "resmod_sterling", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_smg_sterling_b_long.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_long.supported = true
	self.parts.wpn_fps_smg_sterling_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_smg_sterling_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Short Barrel
	self.parts.wpn_fps_smg_sterling_b_short.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_short.supported = true
	self.parts.wpn_fps_smg_sterling_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_smg_sterling_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Suppressed Barrel
	self.parts.wpn_fps_smg_sterling_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_suppressed.supported = true
	self.parts.wpn_fps_smg_sterling_b_suppressed.has_description = true
	self.parts.wpn_fps_smg_sterling_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_sterling_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_sterling_b_suppressed.perks = {"silencer"}
	
	--Heatsinked Suppressed Barrel
	self.parts.wpn_fps_smg_sterling_b_e11.pcs = {}
	self.parts.wpn_fps_smg_sterling_b_e11.supported = true
	self.parts.wpn_fps_smg_sterling_b_e11.has_description = true
	self.parts.wpn_fps_smg_sterling_b_e11.desc_id = "bm_wp_sterling_b_e11_desc_sc"
	self.parts.wpn_fps_smg_sterling_b_e11.stats = {
		value = 2,
		recoil = 4,
		extra_ammo = 5
	}
	self.parts.wpn_fps_smg_sterling_b_e11.custom_stats = {
		muzzleflash = "effects/payday2/particles/weapons/9mm_auto_silence_fps",
		starwars = true,
		regen_ammo_time = 1, 
		regen_rate = 6, 
		overheat_pen = 2,
		regen_rate_overheat = 3,
		rof_mult = 0.7272727,
		falloff_start_mult = 1.25,
		falloff_end_mult = 1.25,
		armor_piercing_override = 0.5
	}	
	self.parts.wpn_fps_smg_sterling_b_e11.sub_type = nil
	self.parts.wpn_fps_smg_sterling_b_e11.perks = nil --{"silencer"}
	self.parts.wpn_fps_smg_sterling_b_e11.forbids = deep_clone(self.parts.wpn_fps_smg_sterling_b_suppressed.forbids)
	table.insert(self.parts.wpn_fps_smg_sterling_b_e11.forbids, "wpn_fps_smg_sterling_m_long")
	table.insert(self.parts.wpn_fps_smg_sterling_b_e11.forbids, "wpn_fps_smg_sterling_m_short")
	self.parts.wpn_fps_smg_sterling_b_e11.override = {
		wpn_fps_smg_sterling_m_medium = { unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_smg_sterling_pts/wpn_fps_smg_sterling_m_short" }
	}
	
	--Extended Mag
	self.parts.wpn_fps_smg_sterling_m_long.pcs = {}
	self.parts.wpn_fps_smg_sterling_m_long.supported = true
	self.parts.wpn_fps_smg_sterling_m_long.stats = {
		value = 1,
		extra_ammo = 14,
		reload = -2,
		concealment = -1
	}
	self.parts.wpn_fps_smg_sterling_m_long.custom_stats = {
		ads_speed_mult = 1.025
	}
	
	--Short Mag
	self.parts.wpn_fps_smg_sterling_m_short.pcs = {}
	self.parts.wpn_fps_smg_sterling_m_short.supported = true
	self.parts.wpn_fps_smg_sterling_m_short.stats = {
		value = 1,
		extra_ammo = -5,
		reload = 2,
		concealment = 1
	}
	self.parts.wpn_fps_smg_sterling_m_short.custom_stats = { 
		ads_speed_mult = 0.975
	}
	
	--Folded Stock
	self.parts.wpn_fps_smg_sterling_s_folded.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_folded.supported = true
	self.parts.wpn_fps_smg_sterling_s_folded.stats = deep_clone(stocks.fold_folder_stats)
	self.parts.wpn_fps_smg_sterling_s_folded.stats.value = 0
	self.parts.wpn_fps_smg_sterling_s_folded.custom_stats = deep_clone(stocks.fold_folder_stats)
	
	--No Stock
	self.parts.wpn_fps_smg_sterling_s_nostock.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_nostock.supported = true
	self.parts.wpn_fps_smg_sterling_s_nostock.stats = deep_clone(stocks.remove_folder_stats)
	self.parts.wpn_fps_smg_sterling_s_nostock.stats.value = 0
	self.parts.wpn_fps_smg_sterling_s_nostock.custom_stats = deep_clone(stocks.remove_folder_stats)
	
	--Solid Stock
	self.parts.wpn_fps_smg_sterling_s_solid.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_solid.supported = true
	self.parts.wpn_fps_smg_sterling_s_solid.stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
	self.parts.wpn_fps_smg_sterling_s_solid.custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)

	self.parts.wpn_fps_smg_sterling_s_nostock_dummy = deep_clone(self.parts.wpn_fps_smg_sterling_s_nostock)
	self.parts.wpn_fps_smg_sterling_s_nostock_dummy.pcs = {}
	self.parts.wpn_fps_smg_sterling_s_nostock_dummy.stats = { value = 1 }
	self.parts.wpn_fps_smg_sterling_s_nostock_dummy.custom_stats = nil


	--[
	self.wpn_fps_smg_sterling.stock_adapter = "wpn_fps_smg_shepheard_s_adapter"
	self.wpn_fps_smg_sterling_npc.stock_adapter = "wpn_fps_smg_shepheard_s_adapter"

	self.wpn_fps_smg_sterling.override = self.wpn_fps_smg_sterling.override or {}
	
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_specter = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_aimpoint = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_aimpoint_2 = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_docter = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_eotech = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_t1micro = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_cmore = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_acog = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_cs = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_eotech_xps = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_reflex = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_rx01 = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_rx30 = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_spot = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_bmg = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_uh = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_fc1 = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_tf90 = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_poe = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	-- VMP sight(s)
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_o_cqb = { forbids = {"wpn_fps_gre_arbiter_o_standard"} }
	
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		adds = {"wpn_fps_smg_sterling_s_nostock_dummy","wpn_fps_smg_sterling_o_adapter", "wpn_fps_gre_arbiter_o_standard" },
		forbids = {}
	}
	self.wpn_fps_smg_sterling.override.wpn_fps_gre_arbiter_o_standard = { 
		stance_mod = {
			wpn_fps_smg_sterling = {
				translation = Vector3(-0.005, -13, -3.2)
			}
		}
	}

	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_sterling_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")

	self.wpn_fps_smg_sterling_npc.uses_parts = deep_clone(self.wpn_fps_smg_sterling.uses_parts)

	--]]
	
end)	

--Nagant
Hooks:PostHook(WeaponFactoryTweakData, "_init_mosin", "resmod_mosin", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_snp_mosin_b_standard.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_standard.supported = true
	self.parts.wpn_fps_snp_mosin_b_standard.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_snp_mosin_b_standard.stats.bayonet_range = 50
	self.parts.wpn_fps_snp_mosin_b_standard.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Short Barrel
	self.parts.wpn_fps_snp_mosin_b_short.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_short.supported = true
	self.parts.wpn_fps_snp_mosin_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_snp_mosin_b_short.stats.bayonet_range = -20
	self.parts.wpn_fps_snp_mosin_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Silenced Barrel
	self.parts.wpn_fps_snp_mosin_b_sniper.pcs = {}
	self.parts.wpn_fps_snp_mosin_b_sniper.supported = true
	self.parts.wpn_fps_snp_mosin_b_sniper.has_description = true
	self.parts.wpn_fps_snp_mosin_b_sniper.forbids = {"wpn_fps_snp_mosin_ns_bayonet"}
	self.parts.wpn_fps_snp_mosin_b_sniper.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_mosin_b_sniper.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_mosin_b_sniper.perks = {"silencer"}
	
	--Discreet Stock
	self.parts.wpn_fps_snp_mosin_body_black.pcs = {}
	self.parts.wpn_fps_snp_mosin_body_black.supported = true
	self.parts.wpn_fps_snp_mosin_body_black.stats = {
		value = 1,
		concealment = 1,
		recoil = -2
	}
	
	--Nagant Bayonet
	self.parts.wpn_fps_snp_mosin_ns_bayonet.pcs = {}
	self.parts.wpn_fps_snp_mosin_ns_bayonet.supported = true
	self.parts.wpn_fps_snp_mosin_ns_bayonet.stats = {
		value = 5,
		concealment = -5,
		max_damage = 6,
		min_damage = 6,
		max_damage_effect = 1,
		min_damage_effect = 1,
		bayonet_range = 50
	}
	self.parts.wpn_fps_snp_mosin_ns_bayonet.custom_stats = {
		ads_speed_mult = 1.125
	}
		
	--Iron Sight
	self.parts.wpn_fps_snp_mosin_iron_sight.pcs = {}
	self.parts.wpn_fps_snp_mosin_iron_sight.supported = true
	self.parts.wpn_fps_snp_mosin_iron_sight.stats = {
		value = 0
	}
	
	--Tranq Rounds
	self.parts.wpn_fps_snp_mosin_a_tranq = {
		pcs = {},
		a_obj = "a_body",
		type = "ammo",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		internal_part = true,
		supported = true,
		name_id = "bm_wp_upg_a_tranq_mosin",
		desc_id = "bm_wp_upg_a_tranq_mosin_desc",
		has_description = true,
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 5,
			damage = -30
		},
		custom_stats = {
			trail_effect = "_dmc/effects/warsaw_trail",
			bullet_class = "PoisonBulletBase",
			dot_data = { 
				type = "poison",
				custom_data = {
					dot_damage = 1.5,
					dot_length = 6.1,
					dot_tick_period = 0.5,
					hurt_animation_chance = 0.75
				}
			}
		}
	}

	if not self.wpn_fps_snp_mosin.override then
		self.wpn_fps_snp_mosin.override = {}
	end

	self.wpn_fps_snp_mosin.override.wpn_fps_addon_ris = {
		unit = "units/pd2_dlc_pines/weapons/wpn_fps_smg_m1928_pts/wpn_fps_smg_thompson_fl_adapter"
	}

	
	table.insert(self.wpn_fps_snp_mosin.uses_parts, "wpn_fps_snp_mosin_a_tranq")
	table.insert(self.wpn_fps_snp_mosin_npc.uses_parts, "wpn_fps_snp_mosin_a_tranq")		
	
	self.wpn_fps_snp_mosin_npc.uses_parts = deep_clone(self.wpn_fps_snp_mosin.uses_parts)	
	
end)

--Chicago Typewriter
Hooks:PostHook(WeaponFactoryTweakData, "_init_m1928", "resmod_m1928", function(self)
	
	--Long Barrel
	self.parts.wpn_fps_smg_thompson_barrel_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_barrel_long.supported = true
	self.parts.wpn_fps_smg_thompson_barrel_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_smg_thompson_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Stubby Barrel
	self.parts.wpn_fps_smg_thompson_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_barrel_short.supported = true
	self.parts.wpn_fps_smg_thompson_barrel_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_smg_thompson_barrel_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)

	--Discrete Foregrip
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_foregrip_discrete.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--Discrete Grip
	self.parts.wpn_fps_smg_thompson_grip_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_grip_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_grip_discrete.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--Discrete Stock
	self.parts.wpn_fps_smg_thompson_stock_discrete.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_stock_discrete.supported = true
	self.parts.wpn_fps_smg_thompson_stock_discrete.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--QD Sling Stock
	self.parts.wpn_fps_smg_thompson_stock_nostock.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_thompson_stock_nostock.supported = true
	self.parts.wpn_fps_smg_thompson_stock_nostock.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_smg_thompson_stock_nostock.custom_stats = deep_clone(stocks.remove_fixed_stats)
	
end)

--Queen's Wrath
Hooks:PostHook(WeaponFactoryTweakData, "_init_l85a2", "resmod_l85a2", function(self)
	
	--Expert Mag
	self.parts.wpn_fps_ass_l85a2_m_emag.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_m_emag.supported = true
	self.parts.wpn_fps_ass_l85a2_m_emag.stats = {
		value = 0,
		extra_ammo = 0
	}
	
	--Versatile Foregrip
	self.parts.wpn_fps_ass_l85a2_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_fg_short.supported = true
	self.parts.wpn_fps_ass_l85a2_fg_short.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_fg_long" --better normal smoothing
	self.parts.wpn_fps_ass_l85a2_fg_short.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	
	--Prodigious Barrel
	self.parts.wpn_fps_ass_l85a2_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_b_long.supported = true
	self.parts.wpn_fps_ass_l85a2_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_ass_l85a2_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Diminutive Barrel
	self.parts.wpn_fps_ass_l85a2_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_b_short.supported = true
	self.parts.wpn_fps_ass_l85a2_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_ass_l85a2_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Delightful Grip
	self.parts.wpn_fps_ass_l85a2_g_worn.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_l85a2_g_worn.supported = true
	self.parts.wpn_fps_ass_l85a2_g_worn.stats = {
		value = 2, 
		recoil = 2, 
		concealment = -1
	}
		

end)

--Lion's Roar
Hooks:PostHook(WeaponFactoryTweakData, "_init_vhs", "resmod_vhs", function(self)
	
	--default mag
	self.parts.wpn_fps_ass_vhs_m.stats = { value = 0 }
	
	--CQB Barrel
	self.parts.wpn_fps_ass_vhs_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_short.supported = true
	self.parts.wpn_fps_ass_vhs_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_ass_vhs_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Silenced Barrel
	self.parts.wpn_fps_ass_vhs_b_silenced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_silenced.supported = true
	self.parts.wpn_fps_ass_vhs_b_silenced.has_description = true
	self.parts.wpn_fps_ass_vhs_b_silenced.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_ass_vhs_b_silenced.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_ass_vhs_b_silenced.perks = {"silencer"}
	
	--Precision Barrel
	self.parts.wpn_fps_ass_vhs_b_sniper.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_vhs_b_sniper.supported = true
	self.parts.wpn_fps_ass_vhs_b_sniper.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_ass_vhs_b_sniper.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
end)

--LEO
Hooks:PostHook(WeaponFactoryTweakData, "_init_hs2000", "resmod_hs2000", function(self)
	
	--Custom Slide
	self.parts.wpn_fps_pis_hs2000_sl_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_sl_custom.supported = true
	self.parts.wpn_fps_pis_hs2000_sl_custom.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_pis_hs2000_sl_custom.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Long Slide
	self.parts.wpn_fps_pis_hs2000_sl_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_sl_long.supported = true
	self.parts.wpn_fps_pis_hs2000_sl_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_pis_hs2000_sl_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Extended Mag
	self.parts.wpn_fps_pis_hs2000_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_hs2000_m_extended.supported = true
	self.parts.wpn_fps_pis_hs2000_m_extended.stats = {
		value = 1,
		extra_ammo = 12,
		reload = -2,
		concealment = -1
	}
	
	--Override Table
	self.wpn_fps_pis_hs2000.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_hs2000.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	
	table.insert(self.wpn_fps_pis_hs2000.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_hs2000_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
	table.insert(self.wpn_fps_pis_hs2000.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_hs2000_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_hs2000_npc.uses_parts = deep_clone(self.wpn_fps_pis_hs2000.uses_parts)		
	
end)

--M4/AK pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_modpack_m4_ak", "resmod_modpack_m4_ak", function(self)
	
	--DMR Kit
	self.parts.wpn_fps_upg_ass_ak_b_zastava.pcs = {}
	self.parts.wpn_fps_upg_ass_ak_b_zastava.supported = true
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats = deep_clone(barrels.long_b3_custom_stats)

	--Modern Barrel
	self.parts.wpn_fps_upg_ak_b_ak105.pcs = {}
	self.parts.wpn_fps_upg_ak_b_ak105.supported = true
	self.parts.wpn_fps_upg_ak_b_ak105.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_upg_ak_b_ak105.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Crabs Rail
	self.parts.wpn_fps_upg_ak_fg_krebs.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_krebs.supported = true
	self.parts.wpn_fps_upg_ak_fg_krebs.stats = {
		value = 3,
		recoil = 2,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod = { 
		wpn_fps_ass_akm = {
			translation = Vector3(-0.006, -2, -3.745)
		},
		wpn_fps_ass_akm_gold = {
			translation = Vector3(-0.006, -2, -3.745)
		},
		wpn_fps_ass_74 = {
			translation = Vector3(-0.006, -2, -3.745)
		}
	}
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_krebs.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_krebs.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end
	
	--Keymod Rail
	self.parts.wpn_fps_upg_ak_fg_trax.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_trax.supported = true
	self.parts.wpn_fps_upg_ak_fg_trax.stats = {
		value = 5,
		spread = -1,
		recoil = 4,
		concealment = -1
	}
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod = { 
		wpn_fps_ass_akm = {
			translation = Vector3(-0.006, -2, -3.745)
		},
		wpn_fps_ass_akm_gold = {
			translation = Vector3(-0.006, -2, -3.745)
		},
		wpn_fps_ass_74 = {
			translation = Vector3(-0.006, -2, -3.745)
		}
	}
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_trax.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_trax.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	--Aluminum Foregrip (AKMSU)
	self.parts.wpn_fps_upg_ak_fg_zenit.pcs = {}
	self.parts.wpn_fps_upg_ak_fg_zenit.supported = true
	self.parts.wpn_fps_upg_ak_fg_zenit.stats = {value = 1, spread = -1, concealment = 1}
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter = {
		a_obj = "a_o_zenit",
		stance_mod = { 
			wpn_fps_smg_akmsu = {
				translation = Vector3(-0.006, -1, -3.24)
			}
		}
	}
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_aimpoint = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_aimpoint_2 = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_docter = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_eotech = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_t1micro = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_cmore = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_cs = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_eotech_xps = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_reflex = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_rx01 = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_rx30 = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_acog = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_spot = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_bmg = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_uh = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_fc1 = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_tf90 = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_poe = deep_clone(self.parts.wpn_fps_upg_ak_fg_zenit.override.wpn_fps_upg_o_specter)
	
	--Aluminum Grip
	self.parts.wpn_fps_upg_ak_g_rk3.pcs = {}
	self.parts.wpn_fps_upg_ak_g_rk3.supported = true
	self.parts.wpn_fps_upg_ak_g_rk3.stats = {
		value = 4,
		recoil = -4,
		concealment = 2
	}
	self.parts.wpn_fps_upg_ak_g_rk3.custom_stats = {
		ads_speed_mult = 0.95
	}
	self.parts.wpn_fps_upg_ak_g_rk3.forbids = {
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_asval_g_standard"
	}
	
	--Low Drag Magazine
	self.parts.wpn_fps_upg_ak_m_uspalm.pcs = {}
	self.parts.wpn_fps_upg_ak_m_uspalm.supported = true
	self.parts.wpn_fps_upg_ak_m_uspalm.stats = {
		value = 1,
		recoil = -2,
		concealment = 1
	}
	
	--Classic Stock
	self.parts.wpn_fps_upg_ak_s_solidstock.pcs = {}
	self.parts.wpn_fps_upg_ak_s_solidstock.supported = true
	self.parts.wpn_fps_upg_ak_s_solidstock.stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	self.parts.wpn_fps_upg_ak_s_solidstock.custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
	
	--PBS Suppressor
	self.parts.wpn_fps_upg_ns_ass_pbs1.pcs = {}
	self.parts.wpn_fps_upg_ns_ass_pbs1.has_description = true
	self.parts.wpn_fps_upg_ns_ass_pbs1.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_ass_pbs1.supported = true
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_upg_ns_ass_pbs1.perks = {"silencer"}
	
	--Scope Mount
	self.parts.wpn_fps_upg_o_ak_scopemount.pcs = {}
	self.parts.wpn_fps_upg_o_ak_scopemount.supported = true
	self.parts.wpn_fps_upg_o_ak_scopemount.stats = {
		value = 0
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_74 = {
		translation = Vector3(-0.005, 15.5, -4.6)
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm = {
		translation = Vector3(-0.005, 15.5, -4.6)
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_akm_gold = {
		translation = Vector3(-0.005, 15.5, -4.6)
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_saiga = {
		translation = Vector3(0.06, 15.5, -4.54)
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_akmsu = {
		translation = Vector3(-0.005, 15.5, -4.34)
	}
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_upg_o_ak_scopemount.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)

	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	--OVAL Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.adds = { "wpn_fps_m4_uupg_fg_rail_ext_dummy" }	
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.forbids = { "wpn_fps_addon_ris" }	
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.supported = true
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats = {
		value = 5,
		concealment = -1,
		recoil = 2
	}
	
	--E.M.O. Foregrip
	self.parts.wpn_fps_upg_ass_m4_fg_moe.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.adds = { "wpn_fps_m4_uupg_fg_rail_ext_dummy" }	
	self.parts.wpn_fps_upg_ass_m4_fg_moe.forbids = { "wpn_fps_addon_ris" }	
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_m4_uupg_fg_rail_ext_dummy = {
		unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_standard",
		third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_standard"
	}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.supported = true
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats = {
		value = 5,
		spread = -1,
		recoil = 2
	}
	
	--Long Ergo Foregrip
	self.parts.wpn_fps_upg_ass_m16_fg_stag.pcs = {}
	self.parts.wpn_fps_upg_ass_m16_fg_stag.supported = true
	self.parts.wpn_fps_upg_ass_m16_fg_stag.adds = { "wpn_fps_ass_m4_os_frontsight" }
	self.parts.wpn_fps_upg_ass_m16_fg_stag.override.wpn_fps_ass_m4_os_frontsight = { a_obj = "a_os_stag" }
	self.parts.wpn_fps_upg_ass_m16_fg_stag.stats = {
		value = 5,
		recoil = -2,
		spread = 1
	}
	
	--Aftermarket Shorty
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.pcs = {}
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.supported = true
	self.parts.wpn_fps_upg_smg_olympic_fg_lr300.stats = {
		value = 5,
		recoil = -2,
		concealment = 1
	}
	
	--LW Upper Receiver
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.supported = true
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.forbids = { "wpn_fps_m4_upper_reciever_round_vanilla" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_amcar_uupg_body_upperreciever = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
		a_obj = "a_o"
	}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.stats = {
		value = 5,
		recoil = -2,
		spread = 1
	}
	
	--THRUST Upper Receiver
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.supported = true
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.forbids = { "wpn_fps_m4_upper_reciever_round_vanilla" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_amcar_uupg_body_upperreciever = {
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
		a_obj = "a_o"
	}
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.stats = {
		value = 1,
		recoil = 2,
		concealment = -1
	}
	
	--THRUST Lower Receiver
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.supported = true
	self.parts.wpn_fps_upg_ass_m4_lower_reciever_core.stats = {
		value = 3,
		recoil = -2,
		reload = 1
	}
	
	--L5 Magazine
	self.parts.wpn_fps_upg_m4_m_l5.pcs = {}
	self.parts.wpn_fps_upg_m4_m_l5.supported = true
	self.parts.wpn_fps_upg_m4_m_l5.stats = {
		value = 0
	}
	
	--2 Piece Stock
	self.parts.wpn_fps_upg_m4_s_ubr.pcs = {}
	self.parts.wpn_fps_upg_m4_s_ubr.supported = true
	self.parts.wpn_fps_upg_m4_s_ubr.stats = deep_clone(stocks.adj_hvy_rec_stats)
	self.parts.wpn_fps_upg_m4_s_ubr.custom_stats = deep_clone(stocks.adj_hvy_rec_stats)
	
	--DMR Kit
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.pcs = {}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.override = {
		wpn_fps_m4_uupg_fg_rail_ext_dummy = {
			unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_standard",
			third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_standard"
		}
	}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.supported = true
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.recoil = 8
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.concealment = -6
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ads_speed_mult = 1.15
	
end)

--Vulcan Minigun
Hooks:PostHook(WeaponFactoryTweakData, "_init_m134", "resmod_m134", function(self)
	
	--Light Body
	self.parts.wpn_fps_lmg_m134_body_upper_light.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_body_upper_light.supported = true
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats = {
		value = 1,
		concealment = 1,
		recoil = -2
	}
	self.parts.wpn_fps_lmg_m134_body_upper_light.custom_stats = {}
	
	--The Stump Barrel
	self.parts.wpn_fps_lmg_m134_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_barrel_short.supported = true
	self.parts.wpn_fps_lmg_m134_barrel_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_lmg_m134_barrel_short.stats.jab_range = -50
	self.parts.wpn_fps_lmg_m134_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

	--Aerial Assault Barrel
	self.parts.wpn_fps_lmg_m134_barrel_extreme.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m134_barrel_extreme.supported = true
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats.jab_range = 50
	self.parts.wpn_fps_lmg_m134_barrel_extreme.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Override
	self.wpn_fps_lmg_m134.override = {
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			stats = {
				value = 1,
				--total_ammo_mod = 20,
				--extra_ammo = 60,
				--concealment = -2
			},
			--custom_stats = {movement_speed = 0.9},	
		}
	}				
	
	--table.insert(self.wpn_fps_lmg_m134.uses_parts, "wpn_fps_upg_ammo_half_that")
	--table.insert(self.wpn_fps_lmg_m134_npc.uses_parts, "wpn_fps_upg_ammo_half_that")			
			
	self.wpn_fps_lmg_m134_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m134.uses_parts)			
	
end)

--HRL-7
Hooks:PostHook(WeaponFactoryTweakData, "_init_rpg7", "resmod_rpg7", function(self)
	--Default Body
	self.parts.wpn_fps_rpg7_body.custom_stats = {movement_speed = 0.85}
end)

--Commando 101
Hooks:PostHook(WeaponFactoryTweakData, "_init_ray", "resmod_ray", function(self)
	--Default Body
	self.parts.wpn_fps_gre_ray_body.custom_stats = {movement_speed = 0.85}
	
end)

--Jacket's Piece
Hooks:PostHook(WeaponFactoryTweakData, "_init_cobray", "resmod_cobray", function(self)
	
	--80's Calling
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.pcs = {}
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.supported = true
	self.parts.wpn_fps_smg_cobray_body_upper_jacket.stats = {
		value = 0
	}
	
	--Slotted Barrel Extension
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.supported = true
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_smg_cobray_ns_barrelextension.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Werbell's Suppressor
	self.parts.wpn_fps_smg_cobray_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_cobray_ns_silencer.supported = true
	self.parts.wpn_fps_smg_cobray_ns_silencer.has_description = true
	self.parts.wpn_fps_smg_cobray_ns_silencer.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_cobray_ns_silencer.stats = {
		value = 3,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_cobray_ns_silencer.perks = {"silencer"}

	if not self.wpn_fps_smg_cobray.override then
		self.wpn_fps_smg_cobray.override = {}
	end

	self.wpn_fps_smg_cobray.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	self.wpn_fps_smg_cobray.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_nocheeks_stats),
		custom_stats = deep_clone(stocks.remove_nocheeks_stats)
	}

	--Disabling Vertical Grip Mods
	self.wpn_fps_smg_cobray.uses_parts[25] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
	self.wpn_fps_smg_cobray.uses_parts[26] = "wpn_fps_upg_vg_ass_smg_stubby_vanilla"
	self.wpn_fps_smg_cobray.uses_parts[27] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"
	
	table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_fps_smg_mac10_s_skel")
	table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_fps_smg_mac10_s_no")	
		
	self.wpn_fps_smg_cobray_npc.uses_parts = deep_clone(self.wpn_fps_smg_cobray.uses_parts)		
	
end)

--Joceline
Hooks:PostHook(WeaponFactoryTweakData, "_init_b682", "resmod_b682", function(self)
	
	--Sawed Off Barrel
	self.parts.wpn_fps_shot_b682_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_b_short.supported = true
	self.parts.wpn_fps_shot_b682_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_shot_b682_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

	--Standard body
	self.parts.wpn_fps_shot_b682_body_standard.supported = true

	--Wrist Wrecker Stock
	self.parts.wpn_fps_shot_b682_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_s_short.supported = true
	self.parts.wpn_fps_shot_b682_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_shot_b682_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)
	
	--Luxurious Ammo Pouch
	self.parts.wpn_fps_shot_b682_s_ammopouch.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_b682_s_ammopouch.supported = true
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 4
	}
	self.parts.wpn_fps_shot_b682_s_ammopouch.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	
	--Override table
	self.wpn_fps_shot_b682.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -25,
				spread = 5,
				concealment = -5,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				bullet_class = "InstantExplosiveBulletBase",
				sms = 0.85
			}
		}
	}	
	
end)

--Butcher Mod Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_butchermodpack", "resmod_butchermodpack", function(self)

	--Silent Motor
	self.parts.wpn_fps_saw_body_silent.pcs = {}
	self.parts.wpn_fps_saw_body_silent.supported = true
	self.parts.wpn_fps_saw_body_silent.stats = {
		value = 5,
		concealment = 1,
		suppression = 20,
		alert_size = -1
	}
	self.parts.wpn_fps_saw_body_silent.custom_stats = {
		rof_mult = 0.85
	}
	self.parts.wpn_fps_saw_body_silent.perks = {"silencer"}	
	self.parts.wpn_fps_saw_body_silent.has_description = true
	self.parts.wpn_fps_saw_body_silent.desc_id = "bm_slow_motor_sc_desc"
	
	--Fast Motor
	self.parts.wpn_fps_saw_body_speed.pcs = {}
	self.parts.wpn_fps_saw_body_speed.supported = true
	self.parts.wpn_fps_saw_body_speed.stats = {
		value = 4,
		concealment = -1
	}
	self.parts.wpn_fps_saw_body_speed.custom_stats = {
		rof_mult = 1.15
	}
	self.parts.wpn_fps_saw_body_speed.has_description = true
	self.parts.wpn_fps_saw_body_speed.desc_id = "bm_fast_motor_sc_desc"
	
	--Durable Blade
	self.parts.wpn_fps_saw_m_blade_durable.pcs = {}
	self.parts.wpn_fps_saw_m_blade_durable.supported = true
	self.parts.wpn_fps_saw_m_blade_durable.keep_damage = true
	self.parts.wpn_fps_saw_m_blade_durable.stats = {
		value = 1,
		extra_ammo = 10,
		damage = -30,
		total_ammo_mod = 50
	}
	
	--Sharp Blade
	self.parts.wpn_fps_saw_m_blade_sharp.pcs = {}
	self.parts.wpn_fps_saw_m_blade_sharp.supported = true
	self.parts.wpn_fps_saw_m_blade_sharp.keep_damage = true
	self.parts.wpn_fps_saw_m_blade_sharp.stats = {
		value = 1,
		extra_ammo = -5,
		damage = 30,
		total_ammo_mod = -25
	}
	
	--Raptor Polymer Body/Thales F88/90 Stock
	self.parts.wpn_fps_aug_body_f90.pcs = {}
	self.parts.wpn_fps_aug_body_f90.supported = true
	self.parts.wpn_fps_aug_body_f90.stats = {
		value = 2,
		recoil = -6,
		concealment = -2
	}
	self.parts.wpn_fps_aug_body_f90.custom_stats = {
		rof_mult = 1.090277,
		ads_speed_mult = 1.05
	}
	self.parts.wpn_fps_aug_body_f90.adds = nil
	
	--CQB Barrel
	self.parts.wpn_fps_ass_ak5_b_short.pcs = {}
	self.parts.wpn_fps_ass_ak5_b_short.supported = true
	self.parts.wpn_fps_ass_ak5_b_short.stats = {
		value = 3,
		spread = -2,
		concealment = 2
	}
	self.parts.wpn_fps_ass_ak5_b_short.custom_stats = {
		falloff_start_mult = 0.9,
		falloff_end_mult = 0.9,
		ads_speed_mult = 0.95
	}
	
	--Straight Magazine
	self.parts.wpn_fps_smg_mp5_m_straight.pcs = {}
	self.parts.wpn_fps_smg_mp5_m_straight.supported = true
	self.parts.wpn_fps_smg_mp5_m_straight.stats = {
		value = 6,
		recoil = -2,
		spread = 1
	}
	
	--Tactical Suppressor
	self.parts.wpn_fps_smg_mp9_b_suppressed.pcs = {}
	self.parts.wpn_fps_smg_mp9_b_suppressed.supported = true
	self.parts.wpn_fps_smg_mp9_b_suppressed.has_description = true
	self.parts.wpn_fps_smg_mp9_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_mp9_b_suppressed.perks = {"silencer"}
	
	--Civilian Market Barrel
	self.parts.wpn_fps_smg_p90_b_civilian.pcs = {}
	self.parts.wpn_fps_smg_p90_b_civilian.supported = true
	self.parts.wpn_fps_smg_p90_b_civilian.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_smg_p90_b_civilian.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Mall Ninja Barrel
	self.parts.wpn_fps_smg_p90_b_ninja.pcs = {}
	self.parts.wpn_fps_smg_p90_b_ninja.supported = true
	self.parts.wpn_fps_smg_p90_b_ninja.has_description = true
	self.parts.wpn_fps_smg_p90_b_ninja.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_p90_b_ninja.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_p90_b_ninja.perks = {"silencer"}
	
	--Scope Mount
	self.parts.wpn_fps_upg_o_m14_scopemount.pcs = {}
	self.parts.wpn_fps_upg_o_m14_scopemount.supported = true
	self.parts.wpn_fps_upg_o_m14_scopemount.stats = {
		value = 0
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod.wpn_fps_ass_m14 = {
		translation = Vector3(-0.02, 5.4, -5.2)
	}
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_upg_o_m14_scopemount.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	
	--Engraved Crosskill Grips
	self.parts.wpn_fps_pis_1911_g_engraved.pcs = {}
	self.parts.wpn_fps_pis_1911_g_engraved.supported = true
	self.parts.wpn_fps_pis_1911_g_engraved.stats = {value = 4, recoil = -2, spread = 2, concealment = -1}
	
	--Engraved Bernetti Grips
	self.parts.wpn_fps_pis_beretta_g_engraved.pcs = {}
	self.parts.wpn_fps_pis_beretta_g_engraved.supported = true
	self.parts.wpn_fps_pis_beretta_g_engraved.stats = {value = 4, recoil = -2, spread = 2, concealment = -1}

	--LED Combo
	self.parts.wpn_fps_upg_fl_ass_utg.pcs = {}
	self.parts.wpn_fps_upg_fl_ass_utg.supported = true
	self.parts.wpn_fps_upg_fl_ass_utg.stats = {
		value = 5
	}
	self.parts.wpn_fps_upg_fl_ass_utg.perks = {"gadget"}
	
	--Polymer Flashlight
	self.parts.wpn_fps_upg_fl_pis_m3x.pcs = {}
	self.parts.wpn_fps_upg_fl_pis_m3x.supported = true
	self.parts.wpn_fps_upg_fl_pis_m3x.stats = {
		value = 3
	}
	
	--Ported Compensator
	self.parts.wpn_fps_upg_ass_ns_battle.pcs = {}
	self.parts.wpn_fps_upg_ass_ns_battle.supported = true
	self.parts.wpn_fps_upg_ass_ns_battle.stats = deep_clone(muzzle_device.muzzle_rec_stats)
	self.parts.wpn_fps_upg_ass_ns_battle.custom_stats = deep_clone(muzzle_device.muzzle_rec_custom_stats)
	
	--Budget Suppressor
	self.parts.wpn_fps_upg_ns_ass_filter.pcs = {}
	self.parts.wpn_fps_upg_ns_ass_filter.supported = true
	self.parts.wpn_fps_upg_ns_ass_filter.has_description = true
	self.parts.wpn_fps_upg_ns_ass_filter.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_ass_filter.stats = {
		value = 0,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_upg_ns_ass_filter.perks = {"silencer"}
	
	--Jungle Ninja Suppressor
	self.parts.wpn_fps_upg_ns_pis_jungle.pcs = {}
	self.parts.wpn_fps_upg_ns_pis_jungle.supported = true
	self.parts.wpn_fps_upg_ns_pis_jungle.has_description = true
	self.parts.wpn_fps_upg_ns_pis_jungle.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_jungle.stats = deep_clone(muzzle_device.supp_rec2_acc2_stats)
	self.parts.wpn_fps_upg_ns_pis_jungle.custom_stats= deep_clone(muzzle_device.muzzle_rec2_acc2_custom_stats)
	self.parts.wpn_fps_upg_ns_pis_jungle.perks = {"silencer"}
	
	--Shh!
	self.parts.wpn_fps_upg_ns_sho_salvo_large.pcs = {}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.supported = true
	self.parts.wpn_fps_upg_ns_sho_salvo_large.has_description = true
	self.parts.wpn_fps_upg_ns_sho_salvo_large.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_sho_salvo_large.stats = deep_clone(muzzle_device.supp_c_stats)
	self.parts.wpn_fps_upg_ns_sho_salvo_large.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)
	self.parts.wpn_fps_upg_ns_sho_salvo_large.perks = {"silencer"}
	self.parts.wpn_fps_upg_ns_sho_salvo_large.forbids = {
		"wpn_fps_upg_a_explosive"
	}

end)

--Akimbo G22c
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_g22c", "resmod_x_g22c", function(self)

	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.wpn_fps_pis_x_g22c.override.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 32,
		concealment = -2,
		reload = -3
	}

end)

--Akimbo G17s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_g17", "resmod_x_g17", function(self)

	self.wpn_fps_pis_x_g17.override.wpn_fps_pis_g18c_m_mag_33rnd.supported = true
	self.wpn_fps_pis_x_g17.override.wpn_fps_pis_g18c_m_mag_33rnd.stats = {
		value = 6,
		extra_ammo = 32,
		concealment = -2,
		reload = -3
	}
	
	--Chimano 88 Part Additions
	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_g_ergo")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_g_ergo")

	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_x_g17.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_g17_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	self.wpn_fps_pis_x_g17_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_g17.uses_parts)	
	
end)

--Akimbo Interceptor .45s
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_usp", "resmod_x_usp", function(self)
	
	--Override Tables
	self.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_extended = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 3,
			reload = -2,
			concealment = -1,
			extra_ammo = 16
		}
	}
	self.wpn_fps_pis_x_usp.override.wpn_fps_pis_usp_m_big = {
		animations = {
			reload = "reload_right",
			reload_not_empty = "reload_not_empty_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 2,
			concealment = -2,
			extra_ammo = 20,
			spread = -1,
			recoil = 1,
			reload = -2
		}
	}
		
end)

--Flamethrower
Hooks:PostHook(WeaponFactoryTweakData, "_init_flamethrower_mk2", "resmod_flamethrower_mk2", function(self)

	--Rare
	self.parts.wpn_fps_fla_mk2_mag_rare.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_mk2_mag_rare.name_id = "bm_wp_fla_mk2_mag_rare_sc"
	self.parts.wpn_fps_fla_mk2_mag_rare.desc_id = "bm_wp_fla_mk2_mag_rare_desc_sc"
	self.parts.wpn_fps_fla_mk2_mag_rare.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_rare.supported = true
	self.parts.wpn_fps_fla_mk2_mag_rare.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_mk2_mag_rare.custom_stats = {
		use_rare_dot = true
	}

	--Well Done
	self.parts.wpn_fps_fla_mk2_mag_welldone.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_mk2_mag_welldone.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_welldone.name_id = "bm_wp_fla_mk2_mag_welldone"
	self.parts.wpn_fps_fla_mk2_mag_welldone.desc_id = "bm_wp_fla_mk2_mag_well_desc_sc"
	self.parts.wpn_fps_fla_mk2_mag_welldone.supported = true
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_mk2_mag_welldone.custom_stats = {
		use_well_done_dot = true
	}
	
	--Part Additions
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")		
	
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")		

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_peq15")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_peq15")	

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_laser")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_laser")	

	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_fl_ass_utg")
	table.insert(self.wpn_fps_fla_mk2_npc.uses_parts, "wpn_fps_upg_fl_ass_utg")		
	
	self.wpn_fps_fla_mk2_npc.uses_parts = deep_clone(self.wpn_fps_fla_mk2.uses_parts)		

end)

--M32
Hooks:PostHook(WeaponFactoryTweakData, "_init_m32", "resmod_m32", function(self)

	--Short Barrel
	self.parts.wpn_fps_gre_m32_barrel_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_m32_barrel_short.supported = true
	self.parts.wpn_fps_gre_m32_barrel_short.custom_stats = {
		ads_speed_mult = 0.975
	}
	self.parts.wpn_fps_gre_m32_barrel_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}

	--No Stock
	self.parts.wpn_fps_gre_m32_no_stock.pcs = {}
	self.parts.wpn_fps_gre_m32_no_stock.supported = true
	self.parts.wpn_fps_gre_m32_no_stock.custom_stats = {
		ads_speed_mult = 0.925
	}
	self.parts.wpn_fps_gre_m32_no_stock.stats = {
		value = 0,
		concealment = 3,
		recoil = -6
	}
	
	table.insert(self.wpn_fps_gre_m32.uses_parts, "wpn_fps_upg_i_ghosts_mk32")
	table.insert(self.wpn_fps_gre_m32_npc.uses_parts, "wpn_fps_upg_i_ghosts_mk32")		

	self.wpn_fps_gre_m32_npc.uses_parts = deep_clone(self.wpn_fps_gre_m32.uses_parts)	

end)

--AA12
Hooks:PostHook(WeaponFactoryTweakData, "_init_aa12", "resmod_aa12", function(self)

	--Long Barrel
	self.parts.wpn_fps_sho_aa12_barrel_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_barrel_long.supported = true
	self.parts.wpn_fps_sho_aa12_barrel_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_sho_aa12_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	--Suppressed Barrel
	self.parts.wpn_fps_sho_aa12_barrel_silenced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.supported = true
	self.parts.wpn_fps_sho_aa12_barrel_silenced.has_description = true
	self.parts.wpn_fps_sho_aa12_barrel_silenced.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_sho_aa12_barrel_silenced.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.perks = {"silencer"}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.sound_switch = {
		suppressed = "suppressed_a"
	}
	self.parts.wpn_fps_sho_aa12_barrel_silenced.forbids = {
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_upg_ns_shot_thick",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_ns_sho_salvo_large",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_ns_duck"
	}

	--Drum Mag
	self.parts.wpn_fps_sho_aa12_mag_drum.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_aa12_mag_drum.supported = true
	self.parts.wpn_fps_sho_aa12_mag_drum.custom_stats = {
		ads_speed_mult = 1.125,
		sms = 0.8
	}
	self.parts.wpn_fps_sho_aa12_mag_drum.stats = {
		value = 1,
		extra_ammo = 12,
		reload = -6,
		concealment = -5
	}
	
	--Override tables
	self.wpn_fps_sho_aa12.override = {
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,
		wpn_fps_upg_a_custom_free = a_custom_semi_override,			
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
	}
end)

--Peacemaker
Hooks:PostHook(WeaponFactoryTweakData, "_init_peacemaker", "resmod_peacemaker", function(self)

	--Precision Barrel
	self.parts.wpn_fps_pis_peacemaker_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_b_long.supported = true
	self.parts.wpn_fps_pis_peacemaker_b_long.stats = {
		value = 5,
		spread = 3,
		concealment = -3
	}
	self.parts.wpn_fps_pis_peacemaker_b_long.custom_stats = {
		falloff_start_mult = 1.225,
		falloff_end_mult = 1.225,
		ads_speed_mult = 1.075
	}
	
	--Shootout Barrel
	self.parts.wpn_fps_pis_peacemaker_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_b_short.supported = true
	self.parts.wpn_fps_pis_peacemaker_b_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_pis_peacemaker_b_short.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}

	--Grand Grip
	self.parts.wpn_fps_pis_peacemaker_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_g_bling.supported = true
	self.parts.wpn_fps_pis_peacemaker_g_bling.stats = {
		value = 10,
		recoil = 2,
		concealment = -1
	}
	
	--Ol´ Ben's Stock
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.supported = true
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.fps_animation_weight = "stock"
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.stats = {
		value = 2,
		recoil = 6,
		concealment = -4
	}
	self.parts.wpn_fps_pis_peacemaker_s_skeletal.custom_stats = {
		ads_speed_mult = 1.1
	}

end)

--Repeater 1874
Hooks:PostHook(WeaponFactoryTweakData, "_init_winchester1874", "resmod_winchester1874", function(self)
	
	--Long Range Barrel
	self.parts.wpn_fps_snp_winchester_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_winchester_b_long.supported = true
	self.parts.wpn_fps_snp_winchester_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_snp_winchester_b_long.stats.concealment = -4
	self.parts.wpn_fps_snp_winchester_b_long.stats.extra_ammo = 5
	self.parts.wpn_fps_snp_winchester_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Outlaw's Silenced Barrel
	self.parts.wpn_fps_snp_winchester_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_winchester_b_suppressed.supported = true
	self.parts.wpn_fps_snp_winchester_b_suppressed.has_description = true
	self.parts.wpn_fps_snp_winchester_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_winchester_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_winchester_b_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_snp_winchester_b_suppressed.sound_switch = {
		suppressed = "suppressed_a"
	}
	
	--A5 Scope
	self.parts.wpn_fps_upg_winchester_o_classic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_winchester_o_classic.has_description = true
	self.parts.wpn_fps_upg_winchester_o_classic.desc_id = "bm_wp_upg_o_huge"
	self.parts.wpn_fps_upg_winchester_o_classic.supported = true
	self.parts.wpn_fps_upg_winchester_o_classic.stats = {
		value = 0,
		zoom = 40
	}
	self.parts.wpn_fps_upg_winchester_o_classic.reticle_obj = nil
	
	--Add Table for optic adapters
	self.wpn_fps_snp_winchester.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_45iron = { "wpn_fps_smg_thompson_o_adapter" },
		wpn_fps_upg_o_leupold = { "wpn_fps_smg_thompson_o_adapter" },
	}
		
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_specter")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_aimpoint")		

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_t1micro")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_rx30")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_reflex")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_cmore")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")		
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_acog")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_acog")	
	
	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_cs")	

	table.insert(self.wpn_fps_snp_winchester.uses_parts, "wpn_fps_upg_o_45iron")
	table.insert(self.wpn_fps_snp_winchester_npc.uses_parts, "wpn_fps_upg_o_45iron")		

	self.wpn_fps_snp_winchester_npc.uses_parts = deep_clone(self.wpn_fps_snp_winchester.uses_parts)		

end)

--Plainsrider
Hooks:PostHook(WeaponFactoryTweakData, "_init_plainsrider", "resmod_plainsrider", function(self)

	--Explosive Arrows
	self.parts.wpn_fps_upg_a_bow_explosion.pcs = {}
	self.parts.wpn_fps_upg_a_bow_explosion.supported = true
	self.parts.wpn_fps_upg_a_bow_explosion.stats = {damage = 60, total_ammo_mod = -50, spread = -6}
	self.parts.wpn_fps_upg_a_bow_explosion.custom_stats = {
		launcher_grenade = "west_arrow_exp",
		block_b_storm = true
	}
	
	--Poisoned Arrows
	self.parts.wpn_fps_upg_a_bow_poison.pcs = {}
	self.parts.wpn_fps_upg_a_bow_poison.supported = true
	self.parts.wpn_fps_upg_a_bow_poison.stats = {damage = -10, total_ammo_mod = 0}
	self.parts.wpn_fps_upg_a_bow_poison.custom_stats = {
		launcher_grenade = "bow_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}

end)

--Mateba
Hooks:PostHook(WeaponFactoryTweakData, "_init_mateba", "resmod_mateba", function(self)

	--Pesante Barrel
	self.parts.wpn_fps_pis_2006m_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_long.supported = true
	self.parts.wpn_fps_pis_2006m_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_pis_2006m_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Medio Barrel
	self.parts.wpn_fps_pis_2006m_b_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_medium.supported = true
	self.parts.wpn_fps_pis_2006m_b_medium.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_pis_2006m_b_medium.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Piccolo Barrel
	self.parts.wpn_fps_pis_2006m_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_b_short.supported = true
	self.parts.wpn_fps_pis_2006m_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_pis_2006m_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

	--Noir Grip
	self.parts.wpn_fps_pis_2006m_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_2006m_g_bling.supported = true
	self.parts.wpn_fps_pis_2006m_g_bling.stats = {value = 2, concealment = -2, recoil = 4}


	table.insert(self.wpn_fps_pis_2006m.uses_parts, "wpn_fps_upg_i_iw_hailstorm")
	table.insert(self.wpn_fps_pis_2006m_npc.uses_parts, "wpn_fps_upg_i_iw_hailstorm")	

end)

--ASVAL
Hooks:PostHook(WeaponFactoryTweakData, "_init_asval", "resmod_asval", function(self)

	--Prototype Barrel
	self.parts.wpn_fps_ass_asval_b_proto.pcs = {}
	self.parts.wpn_fps_ass_asval_b_proto.supported = true
	self.parts.wpn_fps_ass_asval_b_proto.stats = {
		value = 2,
		suppression = -13,
		alert_size = 1
	}
	self.parts.wpn_fps_ass_asval_b_proto.sound_switch = nil
	self.parts.wpn_fps_ass_asval_b_proto.perks = nil
	
	--Standard Barrel
	self.parts.wpn_fps_ass_asval_b_standard.supported = true
	self.parts.wpn_fps_ass_asval_b_standard.stats = {
		value = 1
	}
	self.parts.wpn_fps_ass_asval_b_standard.perks = {"silencer"}
	self.parts.wpn_fps_ass_asval_b_standard.forbids = {
		"wpn_fps_m4_uupg_fg_rail_ext",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_ass_shak12_ns_muzzle",
		"wpn_fps_ass_shak12_ns_suppressor"
	}
	self.parts.wpn_fps_ass_asval_b_standard.sound_switch = {
		suppressed = "suppressed_b"
	}
	--Solid Stock
	self.parts.wpn_fps_ass_asval_s_solid.pcs = {}
	self.parts.wpn_fps_ass_asval_s_solid.supported = true
	self.parts.wpn_fps_ass_asval_s_solid.stats = deep_clone(stocks.folder_to_thumb_stats)
	self.parts.wpn_fps_ass_asval_s_solid.custom_stats = deep_clone(stocks.folder_to_thumb_stats)
	self.parts.wpn_fps_ass_asval_s_solid.forbids = {
		"wpn_fps_ass_asval_g_standard",
		"wpn_fps_upg_ak_g_rk3",
		"wpn_fps_upg_ak_g_hgrip",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_g_wgrip"			
	}


	self.parts.wpn_fps_ass_asval_m_standard_dummy = deep_clone(self.parts.wpn_fps_ass_asval_m_standard)
	self.parts.wpn_fps_ass_asval_m_standard_dummy.visibility = {
		{
			objects = {
				g_mag = false,
				g_bullet_1 = false,
				g_bullet_2 = false,
				g_bullet_3 = false
			}
		}
	}
	self.parts.wpn_fps_ass_asval_body_standard.adds = {"wpn_fps_ass_asval_m_standard_dummy"}

	self.wpn_fps_ass_asval.stock_adapter = "wpn_upg_ak_s_adapter"	
	self.wpn_fps_ass_asval_npc.stock_adapter = "wpn_upg_ak_s_adapter"

	self.wpn_fps_ass_asval.override = {
		--Just in case
		wpn_upg_ak_g_standard = {
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_upg_ak_g_hgrip = {
			unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_g_hgrip",
			third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_g_hgrip"
		},
		wpn_fps_upg_ak_g_pgrip = {
			unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_g_pgrip",
			third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_ass_asval_pts/wpn_third_ass_asval_g_pgrip"
		},					
		wpn_upg_ak_s_folding = {
			adds = {
				"wpn_fps_ass_asval_g_standard"
			}
		}
	}

	self.wpn_fps_ass_asval.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_ak_s_solidstock = {
		stats = deep_clone(stocks.folder_to_fixed_rec3_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
	self.wpn_fps_ass_asval.override.wpn_fps_upg_ak_s_empty = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats),
		adds = { "wpn_fps_ass_asval_g_standard" }
	}
		
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_m4_uupg_fg_rail_ext")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_m4_uupg_fg_rail_ext")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_large")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_large")		

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_medium")

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_small")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_small")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_tank")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ns_ass_smg_tank")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_jprifles")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_jprifles")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_linear")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_linear")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_surefire")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_surefire")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_battle")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ass_ns_battle")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_pts")	

	--table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_psl")
	--table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_upg_ak_s_psl")			
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_crane")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")	
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_upg_ak_s_folding")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_upg_ak_s_folding")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_rk3")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_rk3")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_hgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_hgrip")		

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_pgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_pgrip")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_g_wgrip")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_g_wgrip")		
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_lmg_rpk_s_standard")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ak_s_solidstock")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_upg_ak_s_solidstock")

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_ass_shak12_ns_muzzle")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_ass_shak12_ns_muzzle")	
		
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_ass_shak12_ns_suppressor")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_ass_shak12_ns_suppressor")	

	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_ass_groza_m_speed")
	table.insert(self.wpn_fps_ass_asval_npc.uses_parts, "wpn_fps_ass_groza_m_speed")			

	self.wpn_fps_ass_asval_npc.override = deep_clone(self.wpn_fps_ass_asval.override)		
	self.wpn_fps_ass_asval_npc.uses_parts = deep_clone(self.wpn_fps_ass_asval.uses_parts)		
end)

--Sub2000
Hooks:PostHook(WeaponFactoryTweakData, "_init_sub2000", "resmod_sub2000", function(self)

	--Appalachian Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_gen2.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_gen2.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--Delabarre Foregrip
	self.parts.wpn_fps_ass_sub2000_fg_railed.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_railed.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_railed.stats = {
		value = 2,
		recoil = 4,
		concealment = -2
	}
	
	--Tooth Fairy Suppressor
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.pcs = {}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.supported = true
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.has_description = true
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.perks = {"silencer"}

	self.parts.wpn_fps_ass_sub2000_body_gen1.adds = {
		"wpn_fps_ass_sub2000_dh_standard",
		"wpn_fps_ass_sub2000_o_back"
	}
	self.parts.wpn_fps_ass_sub2000_body_gen2.adds = {
		"wpn_fps_ass_sub2000_dh_standard",
		"wpn_fps_ass_sub2000_o_back"
	}
	self.parts.wpn_fps_ass_sub2000_o_adapter.adds = { "wpn_fps_ass_sub2000_o_back_down" }
	for i, part_id in pairs(self.wpn_fps_ass_sub2000.uses_parts) do
		if part_id ~= "wpn_fps_ass_sub2000_o_back" and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "sight" then
			table.insert(self.parts[part_id].forbids, "wpn_fps_ass_sub2000_o_back")
		end
	end
	self.wpn_fps_ass_sub2000.override.wpn_fps_addon_ris = {
		parent = "foregrip"
	}


end)

--WA2000
Hooks:PostHook(WeaponFactoryTweakData, "_init_wa2000", "resmod_wa2000", function(self)

	--Long Barrel
	self.parts.wpn_fps_snp_wa2000_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_b_long.supported = true
	self.parts.wpn_fps_snp_wa2000_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_snp_wa2000_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Suppressed Barrel
	self.parts.wpn_fps_snp_wa2000_b_suppressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.supported = true
	self.parts.wpn_fps_snp_wa2000_b_suppressed.has_description = true
	self.parts.wpn_fps_snp_wa2000_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_wa2000_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_wa2000_b_suppressed.perks = {"silencer"}
	
	--Light Grip
	self.parts.wpn_fps_snp_wa2000_g_light.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_light.supported = true
	self.parts.wpn_fps_snp_wa2000_g_light.stats = {
		value = 5,
		spread = -1,
		recoil = -2,
		concealment = 2
	}
	self.parts.wpn_fps_snp_wa2000_g_light.custom_stats = {
		ads_speed_mult = 0.95
	}

	--Stealth Grip
	self.parts.wpn_fps_snp_wa2000_g_stealth.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_stealth.supported = true
	self.parts.wpn_fps_snp_wa2000_g_stealth.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_snp_wa2000_g_stealth.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Walnut Grip
	self.parts.wpn_fps_snp_wa2000_g_walnut.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_wa2000_g_walnut.supported = true
	self.parts.wpn_fps_snp_wa2000_g_walnut.stats = {
		value = 2,
		recoil = 4,
		concealment = -2
	}


	self.parts.wpn_fps_snp_wa2000_body_standard.visibility = {
		{
			objects = {
				g_bipod = false
			}
		}
	}
	self.wpn_fps_snp_wa2000.override = {	
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_gre_arbiter_o_standard"}
		}
	}	
	
	table.insert(self.wpn_fps_snp_wa2000.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_wa2000_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_wa2000.uses_parts, "wpn_fps_gre_arbiter_o_standard")
	table.insert(self.wpn_fps_snp_wa2000_npc.uses_parts, "wpn_fps_gre_arbiter_o_standard")

	self.wpn_fps_snp_wa2000_npc.override = deep_clone(self.wpn_fps_snp_wa2000.override)	
	self.wpn_fps_snp_wa2000_npc.uses_parts = deep_clone(self.wpn_fps_snp_wa2000.uses_parts)	

end)

--Kriss
Hooks:PostHook(WeaponFactoryTweakData, "_init_polymer", "resmod_polymer", function(self)
	
	--Precision Barrel
	self.parts.wpn_fps_smg_polymer_barrel_precision.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_polymer_barrel_precision.supported = true
	self.parts.wpn_fps_smg_polymer_barrel_precision.stats = {
		value = 5,
		spread = 2,
		concealment = -2
	}
	self.parts.wpn_fps_smg_polymer_barrel_precision.custom_stats = {
		falloff_start_mult = 1.15,
		falloff_end_mult = 1.15,
		ads_speed_mult = 1.05
	}
	
	--HPS Suppressor
	self.parts.wpn_fps_smg_polymer_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_polymer_ns_silencer.supported = true
	self.parts.wpn_fps_smg_polymer_ns_silencer.has_description = true
	self.parts.wpn_fps_smg_polymer_ns_silencer.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_polymer_ns_silencer.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_polymer_ns_silencer.perks = {"silencer"}

	--Fix for disappearing bolt
	self.parts.wpn_fps_smg_polymer_body_standard.adds = {"wpn_fps_smg_polymer_bolt_standard"}

	if not self.wpn_fps_smg_polymer.override then
		self.wpn_fps_smg_polymer.override = {}
	end

	self.wpn_fps_smg_polymer.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}
	self.wpn_fps_smg_polymer.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}

	--Disabling Vertical Grip mods (they don't fit)
	self.wpn_fps_smg_polymer.uses_parts[25] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"
	self.wpn_fps_smg_polymer.uses_parts[26] = "wpn_fps_upg_vg_ass_smg_stubby_vanilla"
	self.wpn_fps_smg_polymer.uses_parts[27] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"

	table.insert(self.wpn_fps_smg_polymer.uses_parts, "wpn_fps_smg_mac10_s_no")	

	self.wpn_fps_smg_polymer_npc.uses_parts = deep_clone(self.wpn_fps_smg_polymer.uses_parts)		

end)

--Pistol Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_hunter", "resmod_hunter", function(self)
	
	--Carbon Limb
	self.parts.wpn_fps_bow_hunter_b_carbon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_b_carbon.supported = true
	self.parts.wpn_fps_bow_hunter_b_carbon.stats = {value = 1, spread = 2, recoil = -2, concealment = -1}
	
	--Skeletal Limb
	self.parts.wpn_fps_bow_hunter_b_skeletal.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_b_skeletal.supported = true
	self.parts.wpn_fps_bow_hunter_b_skeletal.stats = {value = 3, spread = -1, concealment = 1}
	
	--Camo Grip
	self.parts.wpn_fps_bow_hunter_g_camo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_g_camo.supported = true
	self.parts.wpn_fps_bow_hunter_g_camo.stats = {value = 3, recoil = -2, concealment = 1}
	
	--Walnut Grip
	self.parts.wpn_fps_bow_hunter_g_walnut.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_hunter_g_walnut.supported = true
	self.parts.wpn_fps_bow_hunter_g_walnut.stats = {value = 2, recoil = 4, concealment = -2}

	--Poisoned Bolts
	self.parts.wpn_fps_upg_a_crossbow_poison.pcs = {}
	self.parts.wpn_fps_upg_a_crossbow_poison.supported = true
	self.parts.wpn_fps_upg_a_crossbow_poison.stats = {damage = -20, total_ammo_mod = 0}
	self.parts.wpn_fps_upg_a_crossbow_poison.is_a_unlockable = true
	self.parts.wpn_fps_upg_a_crossbow_poison.custom_stats = {
		launcher_grenade = "crossbow_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolts
	self.parts.wpn_fps_upg_a_crossbow_explosion.pcs = {}
	self.parts.wpn_fps_upg_a_crossbow_explosion.supported = true
	self.parts.wpn_fps_upg_a_crossbow_explosion.stats = {damage = 120, total_ammo_mod = -50, spread = -8, recoil = -4}
	self.parts.wpn_fps_upg_a_crossbow_explosion.custom_stats = {
		launcher_grenade = "crossbow_arrow_exp",
		block_b_storm = true
	}

end)

--Micro Uzi
Hooks:PostHook(WeaponFactoryTweakData, "_init_baka", "resmod_baka", function(self)
	
	--Custom Barrel
	self.parts.wpn_fps_smg_baka_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_comp.supported = true
	self.parts.wpn_fps_smg_baka_b_comp.stats = {
		value = 1,
		spread = -1,
		concealment = 1,
	}
	
	--Maki Suppressor
	self.parts.wpn_fps_smg_baka_b_midsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_midsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_midsupp.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	
	--Spring Suppressor
	self.parts.wpn_fps_smg_baka_b_smallsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_smallsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_smallsupp.stats = {
		value = 3,
		suppression = 12,
		alert_size = -1
	}
	
	--Futomaki Suppressor
	self.parts.wpn_fps_smg_baka_b_longsupp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_b_longsupp.supported = true
	self.parts.wpn_fps_smg_baka_b_longsupp.stats = {
		value = 5,
		suppression = 12,
		alert_size = -1
	}
	
	--No Stock
	self.parts.wpn_fps_smg_baka_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_s_standard.supported = true
	self.parts.wpn_fps_smg_baka_s_standard.stats = deep_clone(stocks.remove_folded_stats)
	self.parts.wpn_fps_smg_baka_s_standard.stats.value = 0
	self.parts.wpn_fps_smg_baka_s_standard.custom_stats = deep_clone(stocks.remove_folded_stats)
	
	--Unfolded Stock
	self.parts.wpn_fps_smg_baka_s_unfolded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_baka_s_unfolded.supported = true
	self.parts.wpn_fps_smg_baka_s_unfolded.stats = deep_clone(stocks.unfold_folded_stats)
	self.parts.wpn_fps_smg_baka_s_unfolded.stats.value = 0
	self.parts.wpn_fps_smg_baka_s_unfolded.custom_stats = deep_clone(stocks.unfold_folded_stats)

end)

--Heavy Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_arblast", "resmod_arblast", function(self)
	
	--Poison Bolt
	self.parts.wpn_fps_bow_arblast_m_poison.pcs = {}
	self.parts.wpn_fps_bow_arblast_m_poison.supported = true
	self.parts.wpn_fps_bow_arblast_m_poison.stats = {damage = -15}
	self.parts.wpn_fps_bow_arblast_m_poison.custom_stats = {
		launcher_grenade = "arblast_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolt
	self.parts.wpn_fps_bow_arblast_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_arblast_m_explosive.supported = true
	self.parts.wpn_fps_bow_arblast_m_explosive.stats = {damage = 60, total_ammo_mod = -40, spread = -3, recoil = -6}
	self.parts.wpn_fps_bow_arblast_m_explosive.custom_stats = {
		launcher_grenade = "arblast_arrow_exp",
		block_b_storm = true
	}

end)

--Light Crossbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_frankish", "resmod_frankish", function(self)
	
	--Poison Bolt
	self.parts.wpn_fps_bow_frankish_m_poison.pcs = {}
	self.parts.wpn_fps_bow_frankish_m_poison.supported = true
	self.parts.wpn_fps_bow_frankish_m_poison.stats = {damage = -10}
	self.parts.wpn_fps_bow_frankish_m_poison.custom_stats = {
		launcher_grenade = "frankish_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}
	
	--Explosive Bolt
	self.parts.wpn_fps_bow_frankish_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_frankish_m_explosive.supported = true
	self.parts.wpn_fps_bow_frankish_m_explosive.stats = {damage = 60, total_ammo_mod = -50, spread = -6, recoil = -6}
	self.parts.wpn_fps_bow_frankish_m_explosive.custom_stats = {
		launcher_grenade = "frankish_arrow_exp",
		block_b_storm = true
	}

end)	

--Longbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_long", "resmod_long", function(self)
	
	--Explosive Arrow
	self.parts.wpn_fps_bow_long_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_long_m_explosive.supported = true
	self.parts.wpn_fps_bow_long_m_explosive.stats = {damage = 60, total_ammo_mod = -40, spread = -3}
	self.parts.wpn_fps_bow_long_m_explosive.custom_stats = {
		launcher_grenade = "long_arrow_exp",
		block_b_storm = true
	}
	
	--Poison Arrow
	self.parts.wpn_fps_bow_long_m_poison.pcs = {}
	self.parts.wpn_fps_bow_long_m_poison.supported = true
	self.parts.wpn_fps_bow_long_m_poison.stats = {damage = -15}
	self.parts.wpn_fps_bow_long_m_poison.custom_stats = {
		launcher_grenade = "long_poison_arrow",
		dot_data = {
			type = "poison",
			custom_data = {dot_length = nil, hurt_animation_chance = nil}
		}
	}

end)



--KSP 58
Hooks:PostHook(WeaponFactoryTweakData, "_init_par", "resmod_par", function(self)

	--Short Barrel
	self.parts.wpn_fps_lmg_par_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_par_b_short.supported = true
	self.parts.wpn_fps_lmg_par_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_lmg_par_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Plastic Stock
	self.parts.wpn_fps_lmg_par_s_plastic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_par_s_plastic.supported = true
	self.parts.wpn_fps_lmg_par_s_plastic.stats = {
		value = 3,
		concealment = 1,
		recoil = -2
	}

	--Belt fix
	self.parts.wpn_fps_lmg_par_m_standard.bullet_objects = {
		prefix = "g_bullet_", 
		amount = 5
	}
	
	self.wpn_fps_lmg_par.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
	self.wpn_fps_lmg_par_npc.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"

	--sorry for the pasghetti! Fix my fucking coding mess!!!!
	--Hey, can't be any worse than mine :^)
	if not self.wpn_fps_lmg_par.override then
		self.wpn_fps_lmg_par.override = {}
	end
	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_specter = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_aimpoint = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_docter = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_eotech = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_t1micro = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_cmore = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_aimpoint_2 = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_cs = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_rx30 = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_rx01 = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_reflex = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_eotech_xps = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_sig = {
		parent = "upper_reciever"
	}	
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_uh = {
		parent = "upper_reciever"
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_o_fc1 = {
		parent = "upper_reciever"
	}

	self.wpn_fps_lmg_par.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_lmg_par.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_fixed_stats),
		custom_stats = deep_clone(stocks.remove_fixed_stats)
	}

	--M240 Part Additions	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_specter")	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech")	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_t1micro")		
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_reflex")	
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_fc1")

	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_snp_tti_s_vltor")
			
	self.wpn_fps_lmg_par_npc.uses_parts = deep_clone(self.wpn_fps_lmg_par.uses_parts)		
end)

--Bipods
Hooks:PostHook(WeaponFactoryTweakData, "_init_bipods", "resmod_bipods", function(self)

	--Lion's Bipod
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.desc_id = "bm_sc_bipod_desc"
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.supported = true
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.stats = {value = 5, zoom = 1, concealment = -2}
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.forbids = {} --g3 various attachments workaround
	self.parts.wpn_fps_upg_bp_lmg_lionbipod.perks = {"bipod"}

	--self.parts.wpn_fps_lmg_hk21_fg_short.forbids = {}
	
end)

--Baby Deagle
Hooks:PostHook(WeaponFactoryTweakData, "_init_sparrow", "resmod_sparrow", function(self)

	--Ported Barrel
	self.parts.wpn_fps_pis_sparrow_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_b_comp.supported = true
	self.parts.wpn_fps_pis_sparrow_b_comp.stats = {
		value = 5,
		recoil = 2, 
		concealment = -1
	}
	self.parts.wpn_fps_pis_sparrow_b_comp.forbids = {}

	--Threaded Barrel
	self.parts.wpn_fps_pis_sparrow_b_threaded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_b_threaded.supported = true
	self.parts.wpn_fps_pis_sparrow_b_threaded.stats = {value = 2, spread = 1, concealment = -1}
	
	--Spike Kit
	self.parts.wpn_fps_pis_sparrow_body_941.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_body_941.supported = true
	self.parts.wpn_fps_pis_sparrow_body_941.stats = {
		value = 3,
		concealment = 1,
		recoil = -2
	}
	
	--Spike Grip
	self.parts.wpn_fps_pis_sparrow_g_cowboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_sparrow_g_cowboy.supported = true
	self.parts.wpn_fps_pis_sparrow_g_cowboy.has_description = true
	self.parts.wpn_fps_pis_sparrow_g_cowboy.desc_id = "bm_w_sparrow_sc_g_cowboy_desc"
	self.parts.wpn_fps_pis_sparrow_g_cowboy.stats = {
		value = 5,
		concealment = -1,
		spread = 1
	}
	
	--Overrides for Glock comps
	self.wpn_fps_pis_sparrow.override.wpn_fps_pis_g18c_co_comp_2 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_sparrow.override.wpn_fps_pis_g18c_co_1 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
		
	table.insert(self.wpn_fps_pis_sparrow.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_sparrow_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_sparrow.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_sparrow_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_sparrow_npc.uses_parts = deep_clone(self.wpn_fps_pis_sparrow.uses_parts)	

end)

--Platypus 70
Hooks:PostHook(WeaponFactoryTweakData, "_init_model70", "resmod_model70", function(self)
	
	--Beak Suppressor
	self.parts.wpn_fps_snp_model70_ns_suppressor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_model70_ns_suppressor.supported = true
	self.parts.wpn_fps_snp_model70_ns_suppressor.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	
	--Iron Sight
	self.parts.wpn_fps_snp_model70_iron_sight.pcs = {}
	self.parts.wpn_fps_snp_model70_iron_sight.supported = true
	self.parts.wpn_fps_snp_model70_iron_sight.stats = {
		value = 0
	}
	self.parts.wpn_fps_snp_model70_iron_sight.stance_mod = {
		wpn_fps_snp_msr = {
			translation = Vector3(0, -3, -3.1)
		},
		wpn_fps_snp_desertfox = {
			translation = Vector3(0, -12, -3.48)
		},
		wpn_fps_snp_r93 = {
			translation = Vector3(0, 0, -3.22)
		},
		wpn_fps_snp_m95 = {
			translation = Vector3(0, 8, -3.3)
		},
		wpn_fps_snp_tti = {
			translation = Vector3(0, -2, 0.47)
		},
		wpn_fps_snp_r700 = {
			translation = Vector3(0, -2, -0.45)
		},
		wpn_fps_snp_wa2000 = {
			translation = Vector3(0, -4, 1.17)
		},
		wpn_fps_ass_famas = {
			translation = Vector3(0, -6, -5.8)
		},
		wpn_fps_hailstorm = {
			translation = Vector3(-0.07, 2, 2),
			rotation = Rotation(0, 1.2, 0)
		},

		wpn_fps_snp_musket = {
			translation = Vector3(0, -6, -3.9)
		}
	}

end)

--GSPS 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_m37", "resmod_m37", function(self)

	--Riot Barrel
	self.parts.wpn_fps_shot_m37_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m37_b_short.supported = true
	self.parts.wpn_fps_shot_m37_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_shot_m37_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Stakeout Stock
	self.parts.wpn_fps_shot_m37_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m37_s_short.supported = true
	self.parts.wpn_fps_shot_m37_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_shot_m37_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)
	
	--Ammo overrides
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_slug = a_slug_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom = a_custom_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom_free = a_custom_pump_override	
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_explosive = a_explosive_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_rip = a_rip_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_shot_m37.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_shot_m37.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_shot_m37_npc.uses_parts, "wpn_fps_upg_o_fc1")			
	
	self.wpn_fps_shot_m37_npc.uses_parts = deep_clone(self.wpn_fps_shot_m37.uses_parts)

end)

--China Puff
Hooks:PostHook(WeaponFactoryTweakData, "_init_china", "resmod_china", function(self)
	
	--Riot Stock
	self.parts.wpn_fps_gre_china_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_china_s_short.supported = true
	self.parts.wpn_fps_gre_china_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_gre_china_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)

end)

--Heather
Hooks:PostHook(WeaponFactoryTweakData, "_init_sr2", "resmod_sr2", function(self)
	
	--Unfolded Stock
	self.parts.wpn_fps_smg_sr2_s_unfolded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_sr2_s_unfolded.supported = true
	self.parts.wpn_fps_smg_sr2_s_unfolded.stats = deep_clone(stocks.unfold_nocheeks_stats)
	self.parts.wpn_fps_smg_sr2_s_unfolded.stats.value = 0
	self.parts.wpn_fps_smg_sr2_s_unfolded.custom_stats = deep_clone(stocks.unfold_nocheeks_stats)
	
	--Tishina Suppressor
	self.parts.wpn_fps_smg_sr2_ns_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_sr2_ns_silencer.supported = true
	self.parts.wpn_fps_smg_sr2_ns_silencer.has_description = true
	self.parts.wpn_fps_smg_sr2_ns_silencer.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_sr2_ns_silencer.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_sr2_ns_silencer.perks = {"silencer"}


	self.wpn_fps_smg_sr2.override = self.wpn_fps_smg_sr2.override or {}
	self.wpn_fps_smg_sr2.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}
	
	table.insert(self.wpn_fps_smg_sr2.uses_parts, "wpn_fps_smg_mac10_s_no")	

	self.wpn_fps_smg_sr2_npc.override = deep_clone(self.wpn_fps_smg_sr2.override)	
	self.wpn_fps_smg_sr2_npc.uses_parts = deep_clone(self.wpn_fps_smg_sr2.uses_parts)	
end)

--Akimbo Heather
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_sr2", "resmod_x_sr2", function(self)

	self.wpn_fps_smg_x_sr2.override = self.wpn_fps_smg_x_sr2.override or {}
	self.wpn_fps_smg_x_sr2.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}
	
	table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_smg_sr2_s_unfolded")	
	table.insert(self.wpn_fps_smg_x_sr2.uses_parts, "wpn_fps_smg_mac10_s_no")	
	
	self.wpn_fps_smg_x_sr2_npc.override = deep_clone(self.wpn_fps_smg_x_sr2.override)	
	self.wpn_fps_smg_x_sr2_npc.uses_parts = deep_clone(self.wpn_fps_smg_x_sr2.uses_parts)	

end)

--White Streak
Hooks:PostHook(WeaponFactoryTweakData, "_init_pl14", "resmod_pl14", function(self)

	--Prototype Barrel
	self.parts.wpn_fps_pis_pl14_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_pl14_b_comp.supported = true
	self.parts.wpn_fps_pis_pl14_b_comp.stats = {
		value = 5,
		spread = 3,
		concealment = -3
	}
	self.parts.wpn_fps_pis_pl14_b_comp.forbids = {}
	
	--Extended Magazine
	self.parts.wpn_fps_pis_pl14_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_pl14_m_extended.supported = true
	self.parts.wpn_fps_pis_pl14_m_extended.stats = {
		value = 1,
		extra_ammo = 2,
		concealment = -1
	}
	
	self.wpn_fps_pis_pl14.override.wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"}
	self.wpn_fps_pis_pl14.override.wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"}

	table.insert(self.wpn_fps_pis_pl14.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_pl14_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_pl14.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_pl14_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_pl14_npc.uses_parts = deep_clone(self.wpn_fps_pis_pl14.uses_parts)

end)

--Akimbo MP5
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_mp5", "resmod_x_mp5", function(self)

	--Mag adjustments
	self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_s_ring_vanilla = {
		supported = true,
		stats = {
			value = 0
		},
		custom_stats = {}
	}
	self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_drum = {
		supported = true,
		stats = {
			value = 9,
			extra_ammo = 80,
			reload = -6,
			concealment = -5
		},
	}
	self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_straight = {
		supported = true,
		stats = {
			value = 1,
			recoil = -4,
			spread = 2
		},
		animations = {}
	}

end)

--Akimbo AKMSU
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_akmsu", "resmod_x_akmsu", function(self)

	--Mag Adjustments
	self.wpn_fps_smg_x_akmsu.override = {
		wpn_fps_upg_ak_m_quad = {
			supported = true,
			stats = {
				value = 3,
				spread = -1,
				concealment = -4,
				extra_ammo = 60,
				reload = -3,
			}
		},
		wpn_fps_upg_ak_m_uspalm = {
			supported = true,
			stats = {
				value = 1,
				recoil = -1,
				concealment = 1
			}
		}
	}

end)

--Bootleg (HK416)
Hooks:PostHook(WeaponFactoryTweakData, "_init_tecci", "resmod_tecci", function(self)

	--Long Barrel
	self.parts.wpn_fps_ass_tecci_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_tecci_b_long.supported = true
	self.parts.wpn_fps_ass_tecci_b_long.stats = {
		value = 5,
		spread = 3,
		concealment = -3
	}
	self.parts.wpn_fps_ass_tecci_b_long.custom_stats = {
		falloff_start_mult = 1.225,
		falloff_end_mult = 1.225,
		ads_speed_mult = 1.075,
	}
	
	--Bootstrap Compensator
	self.parts.wpn_fps_ass_tecci_ns_special.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_tecci_ns_special.supported = true
	self.parts.wpn_fps_ass_tecci_ns_special.stats = deep_clone(muzzle_device.muzzle_rec_stats)
	self.parts.wpn_fps_ass_tecci_ns_special.custom_stats = deep_clone(muzzle_device.muzzle_rec_custom_stats)
	
	--Overrides
	self.wpn_fps_ass_tecci.override = {
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			desc_id = "bm_wp_upg_a_halfthatkit_tecci_desc",
			stats = {
				value = 1,
				--total_ammo_mod = 50,
				--concealment = -2
			},
			--custom_stats = {movement_speed = 0.75}	
		}	
	}

	self.wpn_fps_ass_tecci.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folded_to_adj_rec2),
		custom_stats = deep_clone(stocks.folded_to_adj_rec2)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folded_to_hvy_rec3),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec3)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folded_to_hvy_rec2),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec2)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_m4_uupg_s_fold = {
		stats = deep_clone(stocks.unfold_folded_stats),
		custom_stats = deep_clone(stocks.unfold_folded_stats)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_ass_contraband_s_tecci = {
		stats = deep_clone(stocks.unfold_nocheeks_stats),
		custom_stats = deep_clone(stocks.unfold_nocheeks_stats)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_smg_olympic_s_short = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}
	self.wpn_fps_ass_tecci.override.wpn_fps_ass_tecci_s_minicontra = {
		stats = deep_clone(stocks.folded_to_fixed_stats),
		custom_stats = deep_clone(stocks.folded_to_fixed_stats)
	}

	--New parts
	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_smg_olympic_s_short")
	--table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_ammo_half_that")
	
	self.wpn_fps_ass_tecci_npc.uses_parts = deep_clone(self.wpn_fps_ass_tecci.uses_parts)	

end)

--CR 805B
Hooks:PostHook(WeaponFactoryTweakData, "_init_hajk", "resmod_hajk", function(self)

	--Short Barrel
	self.parts.wpn_fps_smg_hajk_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_hajk_b_short.supported = true
	self.parts.wpn_fps_smg_hajk_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_smg_hajk_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Medium Barrel
	self.parts.wpn_fps_smg_hajk_b_medium.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_hajk_b_medium.supported = true
	self.parts.wpn_fps_smg_hajk_b_medium.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_smg_hajk_b_medium.custom_stats = deep_clone(barrels.short_b1_custom_stats)

	self.wpn_fps_smg_hajk.stock_adapter = "wpn_fps_ass_s552_s_m4"
	self.wpn_fps_smg_hajk_npc.stock_adapter = "wpn_fps_ass_s552_s_m4"

	self.wpn_fps_smg_hajk.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}

	self.wpn_fps_smg_hajk.override.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		stats = {
			recoil = 2,
			concealment = -1
		}
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			recoil = 2,
			concealment = -1
		}
	}
	self.wpn_fps_smg_hajk.override.wpn_fps_upg_vg_ass_smg_stubby = {
		stats = {
			value = 1
		}
	}

	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
	table.insert(self.wpn_fps_smg_hajk.uses_parts, "wpn_fps_smg_schakal_vg_surefire")

	self.wpn_fps_smg_hajk_npc.uses_parts = deep_clone(self.wpn_fps_smg_hajk.uses_parts)

end)

--Breaker 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_boot", "resmod_boot", function(self)

	--Short Barrel
	self.parts.wpn_fps_sho_boot_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_boot_b_short.supported = true
	self.parts.wpn_fps_sho_boot_b_short.stats = {
		value = 3,
		spread = -2,
		concealment = 2,
		extra_ammo = -2
	}
	self.parts.wpn_fps_sho_boot_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Long Barrel
	self.parts.wpn_fps_sho_boot_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_boot_b_long.supported = true
	self.parts.wpn_fps_sho_boot_b_long.stats = {
		value = 5,
		spread = 3,
		concealment = -3,
		extra_ammo = 1
	}
	self.parts.wpn_fps_sho_boot_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Long Stock
	self.parts.wpn_fps_sho_boot_s_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_boot_s_long.supported = true
	self.parts.wpn_fps_sho_boot_s_long.stats = deep_clone(stocks.add_fixed_stats)
	self.parts.wpn_fps_sho_boot_s_long.custom_stats = deep_clone(stocks.add_fixed_stats)

	--Treated Body
	self.parts.wpn_fps_sho_boot_body_exotic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_boot_body_exotic.supported = true
	self.parts.wpn_fps_sho_boot_body_exotic.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	
	--Override Table
	self.wpn_fps_sho_boot.override = {
		wpn_fps_upg_a_explosive = {
			supported = true,
			stats = {
				value = 10,
				recoil = -25,
				spread = 5,
				concealment = -5,
				spread_multi = {1, 1},	
				total_ammo_mod = -50,
				damage = 90
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 1,
				bullet_class = "InstantExplosiveBulletBase",
				sms = 0.85
			}
		}
	}	

end)

--Breaker 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_packrat", "resmod_packrat", function(self)

	--Extended Magazine
	self.parts.wpn_fps_pis_packrat_m_extended.pcs = {}
	self.parts.wpn_fps_pis_packrat_m_extended.supported = true
	self.parts.wpn_fps_pis_packrat_m_extended.stats = {
		value = 1,
		extra_ammo = 10,
		concealment = -1,
		reload = -2
	}
	
	--Contractor Compensator
	self.parts.wpn_fps_pis_packrat_ns_wick.pcs = {}
	self.parts.wpn_fps_pis_packrat_ns_wick.supported = true
	self.parts.wpn_fps_pis_packrat_ns_wick.stats = {
		value = 6,
		spread = 2,
		recoil = -2,
		concealment = -2
	}
	
	--Tritanium Sights
	self.parts.wpn_fps_pis_packrat_o_expert.pcs = {}
	self.parts.wpn_fps_pis_packrat_o_expert.supported = true
	self.parts.wpn_fps_pis_packrat_o_expert.stats = {value = 0}
	
	--Overrides
	self.wpn_fps_pis_packrat.override.wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"}
	self.wpn_fps_pis_packrat.override.wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"}

	--New Parts
	table.insert(self.wpn_fps_pis_packrat.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_packrat_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	table.insert(self.wpn_fps_pis_packrat.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_packrat_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	self.wpn_fps_pis_packrat_npc.uses_parts = deep_clone(self.wpn_fps_pis_packrat.uses_parts)

end)

--Jackal (UMP)
Hooks:PostHook(WeaponFactoryTweakData, "_init_schakal", "resmod_schakal", function(self)

	self.parts.wpn_fps_smg_schakal_b_civil.pcs = {}
	self.parts.wpn_fps_smg_schakal_b_civil.supported = true
	self.parts.wpn_fps_smg_schakal_b_civil.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_smg_schakal_b_civil.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Long Magazine
	self.parts.wpn_fps_smg_schakal_m_long.pcs = {}
	self.parts.wpn_fps_smg_schakal_m_long.supported = true
	self.parts.wpn_fps_smg_schakal_m_long.stats = {
		value = 1,
		extra_ammo = 20,
		reload = -3,
		concealment = -4
	}
	self.parts.wpn_fps_smg_schakal_m_long.custom_stats = {
		ads_speed_mult = 1.1
	}
	
	--Short Magazine
	self.parts.wpn_fps_smg_schakal_m_short.pcs = {}
	self.parts.wpn_fps_smg_schakal_m_short.supported = true
	self.parts.wpn_fps_smg_schakal_m_short.stats = {
		value = 1,
		extra_ammo = -10,
		reload = 3,
		concealment = 2,
	}
	self.parts.wpn_fps_smg_schakal_m_short.custom_stats = {
		ads_speed_mult = 0.95
	}
	
	--Silentgear Silencer
	self.parts.wpn_fps_smg_schakal_ns_silencer.pcs = {}
	self.parts.wpn_fps_smg_schakal_ns_silencer.supported = true
	self.parts.wpn_fps_smg_schakal_ns_silencer.has_description = true
	self.parts.wpn_fps_smg_schakal_ns_silencer.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_schakal_ns_silencer.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_schakal_ns_silencer.perks = {"silencer"}
	
	--Civilian Stock
	self.parts.wpn_fps_smg_schakal_s_civil.pcs = {}
	self.parts.wpn_fps_smg_schakal_s_civil.supported = true
	self.parts.wpn_fps_smg_schakal_s_civil.stats = deep_clone(stocks.folder_to_thumb_stats)
	self.parts.wpn_fps_smg_schakal_s_civil.custom_stats = deep_clone(stocks.folder_to_thumb_stats)
	
	--Folded Stock
	self.parts.wpn_fps_smg_schakal_s_folded.pcs = {}
	self.parts.wpn_fps_smg_schakal_s_folded.supported = true
	self.parts.wpn_fps_smg_schakal_s_folded.stats = deep_clone(stocks.fold_folder_stats)
	self.parts.wpn_fps_smg_schakal_s_folded.stats.value = 0
	self.parts.wpn_fps_smg_schakal_s_folded.custom_stats = deep_clone(stocks.fold_folder_stats)
	
	--Twinkle Grip
	self.parts.wpn_fps_smg_schakal_vg_surefire.pcs = {}
	self.parts.wpn_fps_smg_schakal_vg_surefire.supported = true
	self.parts.wpn_fps_smg_schakal_vg_surefire.stats = {
		value = 5
	}
	self.parts.wpn_fps_smg_schakal_vg_surefire.perks = {"gadget"}

	self.parts.wpn_fps_smg_schakal_body_lower.adds = {"wpn_fps_smg_schakal_bolt_standard"}

	self.wpn_fps_smg_schakal.override = self.wpn_fps_smg_schakal.override or {} 
	self.wpn_fps_smg_schakal.override.wpn_fps_upg_vg_ass_smg_stubby = {
		stats = {
			recoil = -2,
			concealment = 1
		}
	}
	self.wpn_fps_smg_schakal.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}
	
	self.wpn_fps_smg_schakal.default_blueprint[8] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"

	self.wpn_fps_smg_schakal.uses_parts[25] = "wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla"	
	--self.wpn_fps_smg_schakal.uses_parts[26] = "wpn_fps_upg_vg_ass_smg_stubby"	
	self.wpn_fps_smg_schakal.uses_parts[27] = "wpn_fps_upg_vg_ass_smg_afg_vanilla"	

	table.insert(self.wpn_fps_smg_schakal.uses_parts, "wpn_fps_smg_mac10_s_no")	
	
	self.wpn_fps_smg_schakal_npc.default_blueprint = deep_clone(self.wpn_fps_smg_schakal.default_blueprint)
	self.wpn_fps_smg_schakal_npc.override = deep_clone(self.wpn_fps_smg_schakal.override)
	self.wpn_fps_smg_schakal_npc.uses_parts = deep_clone(self.wpn_fps_smg_schakal.uses_parts)

end)

--Desertfox
Hooks:PostHook(WeaponFactoryTweakData, "_init_desertfox", "resmod_desertfox", function(self)
	
	--Default Barrel
	self.parts.wpn_fps_snp_desertfox_b_short.override = {
		wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_smg_shepheard_o_standard"}
		},
		wpn_fps_smg_shepheard_o_standard = {
			third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_short",
			unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_short"
		}
	}
	
	--Long Barrel
	self.parts.wpn_fps_snp_desertfox_b_long.pcs = {}
	self.parts.wpn_fps_snp_desertfox_b_long.supported = true
	self.parts.wpn_fps_snp_desertfox_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_snp_desertfox_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	self.parts.wpn_fps_snp_desertfox_b_long.override = {
		wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_smg_shepheard_o_standard"}
		}
	}
	
	--Suppressed Barrel
	self.parts.wpn_fps_snp_desertfox_b_silencer.pcs = {}
	self.parts.wpn_fps_snp_desertfox_b_silencer.supported = true
	self.parts.wpn_fps_snp_desertfox_b_silencer.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_desertfox_b_silencer.override = {
		wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_smg_shepheard_o_standard"}
		},
		wpn_fps_smg_shepheard_o_standard = {
			third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_short",
			unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_short"
		}
	}
	
	table.insert(self.wpn_fps_snp_desertfox.uses_parts, "wpn_fps_snp_model70_iron_sight")	
	
	self.wpn_fps_snp_desertfox_npc.uses_parts = deep_clone(self.wpn_fps_snp_desertfox.uses_parts)



end)

--Akimbo Contractors
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_packrat", "resmod_x_packrat", function(self)

	--Override Table
	self.wpn_fps_x_packrat.override.wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"}
	self.wpn_fps_x_packrat.override.wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"}		
	self.wpn_fps_x_packrat.override.wpn_fps_pis_packrat_m_extended = {
		supported = true,
		stats = {
			value = 1,
			extra_ammo = 20,
			concealment = -1,
			reload = -2
		}
	}
	
	--New Parts
	table.insert(self.wpn_fps_x_packrat.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_x_packrat_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	table.insert(self.wpn_fps_x_packrat.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_x_packrat_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	self.wpn_fps_x_packrat_npc.uses_parts = deep_clone(self.wpn_fps_x_packrat.uses_parts)	

end)

--Goliath 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_rota", "resmod_rota", function(self)

	--Short Barrel
	self.parts.wpn_fps_sho_rota_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_rota_b_short.supported = true
	self.parts.wpn_fps_sho_rota_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_sho_rota_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Silenced Barrel
	self.parts.wpn_fps_sho_rota_b_silencer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_rota_b_silencer.supported = true
	self.parts.wpn_fps_sho_rota_b_silencer.has_description = true
	self.parts.wpn_fps_sho_rota_b_silencer.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_sho_rota_b_silencer.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_sho_rota_b_silencer.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	self.parts.wpn_fps_sho_rota_b_silencer.perks = {"silencer"}
	
	self.wpn_fps_sho_rota.override = {
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,	
		wpn_fps_upg_a_custom_free = a_custom_semi_override,				
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_revo_override		
	}
	self.wpn_fps_sho_rota.override.wpn_fps_upg_vg_ass_smg_verticalgrip = {
		stats = {
			recoil = 2,
			concealment = -1
		}
	}
	self.wpn_fps_sho_rota.override.wpn_fps_smg_schakal_vg_surefire = {
		stats = {
			recoil = 2,
			concealment = -1
		}
	}
	self.wpn_fps_sho_rota.override.wpn_fps_upg_vg_ass_smg_stubby = {
		stats = {
			value = 1
		}
	}
	table.insert(self.wpn_fps_sho_rota.uses_parts, "wpn_fps_upg_vg_ass_smg_verticalgrip")
	table.insert(self.wpn_fps_sho_rota.uses_parts, "wpn_fps_upg_vg_ass_smg_stubby")
	table.insert(self.wpn_fps_sho_rota.uses_parts, "wpn_fps_smg_schakal_vg_surefire")

	self.wpn_fps_sho_rota_npc.override = deep_clone(self.wpn_fps_sho_rota.override)		
	self.wpn_fps_sho_rota_npc.uses_parts = deep_clone(self.wpn_fps_sho_rota.uses_parts)		

end)

--Spec Ops Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_tng", "resmod_tng", function(self)

	--Saiga Short Barrel
	self.parts.wpn_fps_sho_saiga_b_short.pcs = {}
	self.parts.wpn_fps_sho_saiga_b_short.supported = true
	self.parts.wpn_fps_sho_saiga_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_sho_saiga_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Hollow Handle
	self.parts.wpn_fps_sho_saiga_fg_holy.pcs = {}
	self.parts.wpn_fps_sho_saiga_fg_holy.supported = true
	self.parts.wpn_fps_sho_saiga_fg_holy.stats = {value = 3, recoil = -2, concealment = 1}
	
	--45 RDS
	self.parts.wpn_fps_upg_o_45rds.pcs = {}
	self.parts.wpn_fps_upg_o_45rds.desc_id = "bm_wp_upg_o_angled_1_1_desc"
	self.parts.wpn_fps_upg_o_45rds.has_description = true
	self.parts.wpn_fps_upg_o_45rds.supported = true
	self.parts.wpn_fps_upg_o_45rds.stats = {
		value = 1,
		gadget_zoom = 2
	}
	self.parts.wpn_fps_upg_o_45rds.perks = {"gadget"}

	self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_snp_m107cq = {
		translation = Vector3(-0.75, 0, -12.8),
		rotation = Rotation(0, 0, -45)
	}
	
	--Reconnaissance Sight/NcSTAR Advance Dual Optic
	self.parts.wpn_fps_upg_o_spot.pcs = {}
	self.parts.wpn_fps_upg_o_spot.has_description = true
	self.parts.wpn_fps_upg_o_spot.desc_id = "bm_wp_upg_o_3_range"	
	self.parts.wpn_fps_upg_o_spot.supported = true
	self.parts.wpn_fps_upg_o_spot.stats = {
		value = 8,
		zoom = 20
	}
	self.parts.wpn_fps_upg_o_spot.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_spot.perks = {"scope"}
	self.parts.wpn_fps_upg_o_spot.forbids = {
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_ass_m16_os_frontsight",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_sig",
		--"wpn_fps_ass_shak12_o_carry_dummy"
	}
	self.parts.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	
	--Box Buddy Sight/Pulsar Digisight LRF
	self.parts.wpn_fps_upg_o_box.pcs = {}
	self.parts.wpn_fps_upg_o_box.desc_id = "bm_wp_upg_o_4_range"
	self.parts.wpn_fps_upg_o_box.has_description = true
	self.parts.wpn_fps_upg_o_box.supported = true
	self.parts.wpn_fps_upg_o_box.stats = {
		value = 8,
		zoom = 30
	}
	self.parts.wpn_fps_upg_o_box.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_box.perks = {"scope"}
	self.parts.wpn_fps_upg_o_box.reticle_obj = nil
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_qbu88 = {
		translation = Vector3(-0, -32.5, -0.56),
		rotation = Rotation(0, 0, 0)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_tti = {
		translation = Vector3(0, -16.2, -0.955)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_r700 = {
		translation = Vector3(0, -25.8, -4.65)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_msr = {
		translation = Vector3(0, -27, -4.3951)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_siltstone = {
		translation = Vector3(0, -10.65, -4.872)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_wa2000 = {
		translation = Vector3(0, -21, -0.1)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_sbl = {
		translation = Vector3(-0.01, -25.9, -4.68)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_mosin = {
		translation = Vector3(-0.002, -45.1, -5.135)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_model70 = {
		translation = Vector3(0, -24.75, -4.89)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_desertfox = {
		translation = Vector3(0, -32.3, -4.8)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_r93 = {
		translation = Vector3(-0.002, -23.2, -4.622)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_m95 = {
		translation = Vector3(-0.001, -15.95, -4.68)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_scout = {
		translation = Vector3(-0.002, -35.1, -0.21),
		rotation = Rotation(0, 0, 0)
	}
	--Custom wep alignment
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_k31 = {
		translation = Vector3(-0.0125, -20.9, -4.899)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_l115 = {
		translation = Vector3(-0.0175, -26, -4.375)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_m200 = {
		translation = Vector3(0.0035, -23.3, -4.895)
	}
	self.parts.wpn_fps_upg_o_box.stance_mod.wpn_fps_snp_m107cq = {
		translation = Vector3(-0.016, -12.6, -4.882)
	}

	--Vintage Sight
	self.parts.wpn_fps_ass_g36_o_vintage.pcs = {}
	self.parts.wpn_fps_ass_g36_o_vintage.has_description = true
	self.parts.wpn_fps_ass_g36_o_vintage.desc_id = "bm_wp_upg_o_1_8"	
	self.parts.wpn_fps_ass_g36_o_vintage.reticle_obj = nil
	self.parts.wpn_fps_ass_g36_o_vintage.supported = true
	self.parts.wpn_fps_ass_g36_o_vintage.stance_mod = {
		wpn_fps_ass_g36 = {
			translation = Vector3(-0.02, 5, -2.35)
		}
	}
	self.parts.wpn_fps_ass_g36_o_vintage.custom_stats = { big_scope = true }
	self.parts.wpn_fps_ass_g36_o_vintage.stats = {
		value = 1,
		zoom = 8
	}
	self.parts.wpn_fps_ass_g36_o_vintage.perks = {"scope"}
	
	--JP36 Long Foregrip
	self.parts.wpn_fps_upg_g36_fg_long.pcs = {}
	self.parts.wpn_fps_upg_g36_fg_long.supported = true
	self.parts.wpn_fps_upg_g36_fg_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_upg_g36_fg_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Enlightened Foregrip
	self.parts.wpn_fps_smg_mp5_fg_flash.pcs = {}
	self.parts.wpn_fps_smg_mp5_fg_flash.supported = true
	self.parts.wpn_fps_smg_mp5_fg_flash.stats = {
		value = 8,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_smg_mp5_fg_flash.perks = {"gadget"}
	self.parts.wpn_fps_smg_mp5_fg_flash.sub_type = "flashlight"
	
	--Spartan Stock
	self.parts.wpn_fps_smg_mp5_s_folding.pcs = {}
	self.parts.wpn_fps_smg_mp5_s_folding.supported = true
	self.parts.wpn_fps_smg_mp5_s_folding.stats = deep_clone(stocks.fixed_to_folder_stats)
	self.parts.wpn_fps_smg_mp5_s_folding.custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	
	--Donald's Horizontal Leveller
	self.parts.wpn_fps_upg_ns_duck.pcs = {}
	self.parts.wpn_fps_upg_ns_duck.desc_id = "bm_wp_ns_duck_desc_sc"
	self.parts.wpn_fps_upg_ns_duck.has_description = true
	self.parts.wpn_fps_upg_ns_duck.supported = true
	self.parts.wpn_fps_upg_ns_duck.stats = {
		value = 5,
		spread_multi = {1.5, 0.5}
	}
	self.parts.wpn_fps_upg_ns_duck.custom_stats = {}
	
	self.parts.wpn_fps_pis_usp_m_big.pcs = {}
	self.parts.wpn_fps_pis_usp_m_big.supported = true
	self.parts.wpn_fps_pis_usp_m_big.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 10,
		recoil = 1,
		reload = -2
	}
	self.parts.wpn_fps_pis_usp_m_big.custom_stats = {
		ads_speed_mult = 1.05
	}
	
	self.parts.wpn_fps_pis_1911_m_big.pcs = {}
	self.parts.wpn_fps_pis_1911_m_big.supported = true
	self.parts.wpn_fps_pis_1911_m_big.stats = {
		value = 2,
		concealment = -2,
		extra_ammo = 6,	
		reload = -2
	}
	self.parts.wpn_fps_pis_1911_m_big.custom_stats = {
		ads_speed_mult = 1.05
	}
	
	self.parts.wpn_fps_smg_p90_m_strap.pcs = {}
	self.parts.wpn_fps_smg_p90_m_strap.supported = true
	self.parts.wpn_fps_smg_p90_m_strap.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_ass_aug_m_quick.pcs = {}
	self.parts.wpn_fps_ass_aug_m_quick.supported = true
	self.parts.wpn_fps_ass_aug_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_m4_upg_m_quick.pcs = {}
	self.parts.wpn_fps_m4_upg_m_quick.supported = true
	self.parts.wpn_fps_m4_upg_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_upg_ak_m_quick.pcs = {}
	self.parts.wpn_fps_upg_ak_m_quick.supported = true
	self.parts.wpn_fps_upg_ak_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_ass_g36_m_quick.pcs = {}
	self.parts.wpn_fps_ass_g36_m_quick.supported = true		
	self.parts.wpn_fps_ass_g36_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	self.parts.wpn_fps_smg_mac10_m_quick.pcs = {}
	self.parts.wpn_fps_smg_mac10_m_quick.supported = true
	self.parts.wpn_fps_smg_mac10_m_quick.stats = {
		value = 2,
		spread = -1,
		extra_ammo = 10,
		concealment = -2
	}
	self.parts.wpn_fps_smg_mac10_m_quick.custom_stats = {
		ads_speed_mult = 1.05
	}
	
	
	self.parts.wpn_fps_smg_sr2_m_quick.pcs = {}
	self.parts.wpn_fps_smg_sr2_m_quick.supported = true
	self.parts.wpn_fps_smg_sr2_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}

end)

--Arbiter
Hooks:PostHook(WeaponFactoryTweakData, "_init_arbiter", "resmod_arbiter", function(self)

	--Long Barrel
	self.parts.wpn_fps_gre_arbiter_b_long.pcs = {}
	self.parts.wpn_fps_gre_arbiter_b_long.supported = true
	self.parts.wpn_fps_gre_arbiter_b_long.stats = {
		value = 5,
		spread = 3,
		concealment = -3
	}
	self.parts.wpn_fps_gre_arbiter_b_long.custom_stats = {
		ads_speed_mult = 1.075
	}
	
	--Bombardier Barrel
	self.parts.wpn_fps_gre_arbiter_b_comp.pcs = {}
	self.parts.wpn_fps_gre_arbiter_b_comp.supported = true
	self.parts.wpn_fps_gre_arbiter_b_comp.stats = {
		value = 1,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_gre_arbiter_b_comp.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	-- For use as an "adds" attachment
	self.parts.wpn_fps_gre_arbiter_o_standard_no_forbid = deep_clone(self.parts.wpn_fps_gre_arbiter_o_standard)
	self.parts.wpn_fps_gre_arbiter_o_standard_no_forbid.type = "sight_extra"
	self.parts.wpn_fps_gre_arbiter_o_standard_no_forbid.forbids = nil
	
end)

--Contraband	
Hooks:PostHook(WeaponFactoryTweakData, "_init_contraband", "resmod_contraband", function(self)

	--Stock Adapter
	self.wpn_fps_ass_contraband.stock_adapter = "wpn_fps_upg_m4_s_adapter"
	self.wpn_fps_ass_contraband_npc.stock_adapter = "wpn_fps_upg_m4_s_adapter"

	if not self.wpn_fps_ass_contraband.override then
		self.wpn_fps_ass_contraband.override = {}
	end

	self.wpn_fps_ass_contraband.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_m4_uupg_s_fold = {
		stats = deep_clone(stocks.fixed_to_folder_stats),
		custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_ass_contraband_s_tecci = {
		stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	}
	self.wpn_fps_ass_contraband.override.wpn_fps_smg_olympic_s_short = {
		stats = deep_clone(stocks.remove_fixed_stats),
		custom_stats = deep_clone(stocks.remove_fixed_stats)
	}
	
	--So it has more than like 3 parts
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_g_ergo")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_g_ergo")
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_g_sniper")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_g_sniper")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_g_hgrip")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_g_mgrip")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_g_mgrip")
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_m4_uupg_s_fold")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_m4_uupg_s_fold")		
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_s_pts")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_s_crane")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")	
	table.insert(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_smg_olympic_s_short")
	table.insert(self.wpn_fps_ass_contraband_npc.uses_parts, "wpn_fps_smg_olympic_s_short")	
	
	self.wpn_fps_ass_contraband_npc.uses_parts = deep_clone(self.wpn_fps_ass_contraband.uses_parts)		

end)

--Contractor (Sniper)
Hooks:PostHook(WeaponFactoryTweakData, "_init_tti", "resmod_tti", function(self)

	--Contractor Stock
	self.parts.wpn_fps_snp_tti_s_vltor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_tti_s_vltor.supported = true
	self.parts.wpn_fps_snp_tti_s_vltor.stats = deep_clone(stocks.adj_hvy_acc_stats)
	self.parts.wpn_fps_snp_tti_s_vltor.custom_stats = deep_clone(stocks.adj_hvy_acc_stats)

	--Contractor Silencer
	self.parts.wpn_fps_snp_tti_ns_hex.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_tti_ns_hex.supported = true
	self.parts.wpn_fps_snp_tti_ns_hex.has_description = true
	self.parts.wpn_fps_snp_tti_ns_hex.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_tti_ns_hex.stats = {
		value = 3,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_tti_ns_hex.perks = {"silencer"}
	
	--Contractor Grip
	self.parts.wpn_fps_snp_tti_g_grippy.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_tti_g_grippy.supported = true
	self.parts.wpn_fps_snp_tti_g_grippy.stats = {
		value = 2, 
		concealment = -1, 
		spread = 1
	}

	--stop putting rails on rails dangit
	self.parts.wpn_fps_snp_tti_fg_standard.forbids = {"wpn_fps_addon_ris"}
	
	--Contractor Override
	self.wpn_fps_snp_tti.override = {	
		wpn_fps_snp_model70_iron_sight = { 
			adds = {"wpn_fps_m4_uupg_o_flipup"}
		},
		wpn_fps_m4_uupg_o_flipup = {
			third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup_emo",
			unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup_emo"
		}
	}	

	self.wpn_fps_snp_tti.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.fixed_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.fixed_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.fixed_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
		custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_m4_uupg_s_fold = {
		stats = deep_clone(stocks.fixed_to_folder_stats),
		custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_ass_contraband_s_tecci = {
		stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	}
	self.wpn_fps_snp_tti.override.wpn_fps_smg_olympic_s_short = {
		stats = {}, --deep_clone(stocks.remove_fixed_stats),
		custom_stats = {} --deep_clone(stocks.remove_fixed_stats)
	}

	--Contractor Custom parts
	table.insert(self.wpn_fps_snp_tti.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_tti_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")	
	table.insert(self.wpn_fps_snp_tti.uses_parts, "wpn_fps_m4_uupg_o_flipup")
	table.insert(self.wpn_fps_snp_tti_npc.uses_parts, "wpn_fps_m4_uupg_o_flipup")	
	table.insert(self.wpn_fps_snp_tti.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_snp_tti_npc.uses_parts, "wpn_fps_upg_m4_s_standard")		

	--table.insert(self.wpn_fps_snp_tti.uses_parts, "wpn_fps_smg_olympic_s_short")
	--table.insert(self.wpn_fps_snp_tti_npc.uses_parts, "wpn_fps_smg_olympic_s_short")
	
	self.wpn_fps_snp_tti_npc.override = deep_clone(self.wpn_fps_snp_tti.override)
	self.wpn_fps_snp_tti_npc.uses_parts = deep_clone(self.wpn_fps_snp_tti.uses_parts)
end)

--Grom
Hooks:PostHook(WeaponFactoryTweakData, "_init_siltstone", "resmod_siltstone", function(self)

	--Tikho Barrel
	self.parts.wpn_fps_snp_siltstone_b_silenced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_siltstone_b_silenced.supported = true
	self.parts.wpn_fps_snp_siltstone_b_silenced.has_description = true
	self.parts.wpn_fps_snp_siltstone_b_silenced.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_siltstone_b_silenced.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_siltstone_b_silenced.perks = {"silencer"}
	
	--Grievky Compensator
	self.parts.wpn_fps_snp_siltstone_ns_variation_b.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_siltstone_ns_variation_b.supported = true
	self.parts.wpn_fps_snp_siltstone_ns_variation_b.stats = {
		value = 5,			
		spread = 1,
		concealment = -3
	}
	
	--Lightweight Foregrip
	self.parts.wpn_fps_snp_siltstone_fg_polymer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_siltstone_fg_polymer.supported = true
	self.parts.wpn_fps_snp_siltstone_fg_polymer.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--Iron Sight
	self.parts.wpn_fps_snp_siltstone_iron_sight.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_siltstone_iron_sight.supported = true
	self.parts.wpn_fps_snp_siltstone_iron_sight.stats = {
		value = 0
	}
	
	--Lightweight Stock
	self.parts.wpn_fps_snp_siltstone_s_polymer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_siltstone_s_polymer.supported = true
	self.parts.wpn_fps_snp_siltstone_s_polymer.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
end)

--AK17
Hooks:PostHook(WeaponFactoryTweakData, "_init_flint", "resmod_flint", function(self)

	--AK17 Custom parts
	--table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_fps_upg_m4_s_standard")
	--table.insert(self.wpn_fps_ass_flint_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	
	self.wpn_fps_ass_flint.override = self.wpn_fps_ass_flint.override or {}

	self.wpn_fps_ass_flint.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}

	table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_fps_upg_ak_g_rk3")
	table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_flint.uses_parts, "wpn_lmg_rpk_m_ban")
		
	self.wpn_fps_ass_flint_npc.uses_parts = deep_clone(self.wpn_fps_ass_flint.uses_parts)	

end)

--Tatonka
Hooks:PostHook(WeaponFactoryTweakData, "_init_coal", "resmod_coal", function(self)

	--Stock Adapter
	self.wpn_fps_smg_coal.stock_adapter = "wpn_upg_ak_s_adapter"
	self.wpn_fps_smg_coal_npc.stock_adapter = "wpn_upg_ak_s_adapter"

	if not self.wpn_fps_smg_coal.override then
		self.wpn_fps_smg_coal.override = {}
	end

	self.wpn_fps_smg_coal.override.wpn_upg_ak_s_adapter = {
		adds = {}
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folder_to_adj_acc1_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folder_to_adj_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folder_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.folder_to_adj_rec_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
		custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_lmg_rpk_s_standard = {
		stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_ak_s_solidstock = {
		stats = deep_clone(stocks.folder_to_fixed_rec3_stats),
		custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats),
		adds = {}
	}
	self.wpn_fps_smg_coal.override.wpn_upg_ak_s_psl = {
		stats = deep_clone(stocks.folder_to_thumb_stats),
		custom_stats = deep_clone(stocks.folder_to_thumb_stats)
	}
	self.wpn_fps_smg_coal.override.wpn_fps_upg_ak_s_empty = {
		stats = deep_clone(stocks.remove_folder_stats),
		custom_stats = deep_clone(stocks.remove_folder_stats)
	}

	--New Parts
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_upg_ak_s_psl")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_upg_ak_s_psl")		
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_ak_g_rk3")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_ak_g_rk3")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_m4_s_ubr")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_m4_s_crane")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_m4_s_mk46")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_m4_s_standard")		
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_m4_s_pts")		
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_lmg_rpk_s_standard")
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_ak_s_solidstock")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_ak_s_solidstock")
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_i_singlefire")	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_i_autofire")	

	self.wpn_fps_smg_coal_npc.override = deep_clone(self.wpn_fps_smg_coal.override)	
	self.wpn_fps_smg_coal_npc.uses_parts = deep_clone(self.wpn_fps_smg_coal.uses_parts)	
	
end)

--Var Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_varmods", "resmod_varmods", function(self)

	--Riktpunkt Magnifier
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.supported = true
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.desc_id = "bm_wp_upg_o_magnifier_desc"
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.has_description = true
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.stats = {
		value = 1,
		gadget_zoom = 21
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.perks = {"gadget"}

	self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_snp_scout = {
		translation = Vector3(-0.005, -20, 0.6),
		rotation = Rotation(0, 0, 0)
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_pis_shatters_fury = {
		translation = Vector3(-0.035, -4, -4.57),
		rotation = Rotation(0, 0, 0)
	}
	self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_mcx_spear = {
		translation = Vector3(-0.0, -0.5, -0.2),
		rotation = Rotation(0.11, -0.09, 0)
	}
	
	--Angled Sight v2
	self.parts.wpn_fps_upg_o_45rds_v2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_45rds_v2.supported = true
	self.parts.wpn_fps_upg_o_45rds_v2.desc_id = "bm_wp_upg_o_angled_1_2_desc"
	self.parts.wpn_fps_upg_o_45rds_v2.has_description = true
	self.parts.wpn_fps_upg_o_45rds_v2.stats = {
		value = 1,
		gadget_zoom = 3
	}
	self.parts.wpn_fps_upg_o_45rds_v2.perks = {"gadget"}
	self.parts.wpn_fps_upg_o_45rds_v2.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod)

end)

--Var Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_lemming", "resmod_lemming", function(self)

	--TiN Treated Barrel
	self.parts.wpn_fps_pis_lemming_b_nitride.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_lemming_b_nitride.supported = true
	self.parts.wpn_fps_pis_lemming_b_nitride.stats = {
		value = 5,
		spread = 2,
		concealment = -2
	}
	
	--Extended Magazine
	self.parts.wpn_fps_pis_lemming_m_ext.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_lemming_m_ext.supported = true
	self.parts.wpn_fps_pis_lemming_m_ext.stats = {
		value = 1, 
		extra_ammo = 10,
		concealment = -1,
		reload = -2
	}
	self.parts.wpn_fps_pis_lemming_m_ext.custom_stats = {
		ads_speed_mult = 1.025
	}
	
	--Override Table
	self.wpn_fps_pis_lemming.override.wpn_fps_pis_g18c_co_comp_2 = {parent = "barrel", a_obj = "a_ns"}
	self.wpn_fps_pis_lemming.override.wpn_fps_pis_g18c_co_1 = {parent = "barrel", a_obj = "a_ns"}
	
	table.insert(self.wpn_fps_pis_lemming.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_lemming_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	
	table.insert(self.wpn_fps_pis_lemming.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_lemming_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		

	self.wpn_fps_pis_lemming_npc.uses_parts = deep_clone(self.wpn_fps_pis_lemming.uses_parts)		
	
end)

--Castigo .44
Hooks:PostHook(WeaponFactoryTweakData, "_init_chinchilla", "resmod_chinchilla", function(self)

	--Diablo Barrel
	self.parts.wpn_fps_pis_chinchilla_b_satan.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_chinchilla_b_satan.supported = true
	self.parts.wpn_fps_pis_chinchilla_b_satan.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_chinchilla_b_satan.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Carnival Grip
	self.parts.wpn_fps_pis_chinchilla_g_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_chinchilla_g_black.supported = true
	self.parts.wpn_fps_pis_chinchilla_g_black.stats = {
		value = 3, 
		recoil = -2, 
		concealment = 1
	}
	self.parts.wpn_fps_pis_chinchilla_g_black.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Cruz Grip
	self.parts.wpn_fps_pis_chinchilla_g_death.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_chinchilla_g_death.supported = true
	self.parts.wpn_fps_pis_chinchilla_g_death.stats = {
		value = 2, 
		recoil = 2, 
		concealment = -1
	}

end)

--Akimbo Castigo .44
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_chinchilla", "resmod_x_chinchilla", function(self)

	--Nothing yet

end)

--Parabellum
Hooks:PostHook(WeaponFactoryTweakData, "_init_breech", "resmod_breech", function(self)

	--Reinforced Barrel
	self.parts.wpn_fps_pis_breech_b_reinforced.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_breech_b_reinforced.supported = true
	self.parts.wpn_fps_pis_breech_b_reinforced.stats = {
		value = 5,
		recoil = 4,
		concealment = -2
	}

	--Short Barrel
	self.parts.wpn_fps_pis_breech_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_breech_b_short.supported = true
	self.parts.wpn_fps_pis_breech_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_pis_breech_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Engraved Grip
	self.parts.wpn_fps_pis_breech_g_custom.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_breech_g_custom.supported = true
	self.parts.wpn_fps_pis_breech_g_custom.stats = {
		value = 10,
		spread = 1,
		concealment = -1
	}

	if not self.wpn_fps_pis_breech.override then
		self.wpn_fps_pis_breech.override = {}
	end

	--[[
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_small = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_medium = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_medium_gem = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_medium_slim = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_large = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_large_kac = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	--]]
	self.wpn_fps_pis_breech.override.wpn_fps_upg_pis_ns_flash = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_breech.override.wpn_fps_upg_ns_pis_typhoon = {
		a_obj = "a_ns",
		parent = "barrel"
	}

	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_small")
	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_medium")
	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_medium_gem")
	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_medium_slim")
	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_large")
	--table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_large_kac")
	table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_pis_ns_flash")
	table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_breech.uses_parts, "wpn_fps_upg_ns_pis_typhoon")

	self.wpn_fps_pis_breech_npc.uses_parts = deep_clone(self.wpn_fps_pis_breech.uses_parts)	
	
end)

--Galant
Hooks:PostHook(WeaponFactoryTweakData, "_init_ching", "resmod_ching", function(self)

	--Tanker Barrel
	self.parts.wpn_fps_ass_ching_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ching_b_short.supported = true
	self.parts.wpn_fps_ass_ching_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_ass_ching_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Custom Foregrip
	self.parts.wpn_fps_ass_ching_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ching_fg_railed.supported = true
	self.parts.wpn_fps_ass_ching_fg_railed.stats = {
		value = 2, 
		recoil = 2, 
		concealment = -1
	}

	--Magpouch Stock
	self.parts.wpn_fps_ass_ching_s_pouch.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_ching_s_pouch.supported = true
	self.parts.wpn_fps_ass_ching_s_pouch.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 5
	}

end)

--MP40
Hooks:PostHook(WeaponFactoryTweakData, "_init_erma", "resmod_erma", function(self)

	--Folded Stock
	self.parts.wpn_fps_smg_erma_s_folded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_erma_s_folded.supported = true
	self.parts.wpn_fps_smg_erma_s_folded.stats = deep_clone(stocks.fold_nocheeks_stats)
	self.parts.wpn_fps_smg_erma_s_folded.stats.value = 0
	self.parts.wpn_fps_smg_erma_s_folded.custom_stats = deep_clone(stocks.fold_nocheeks_stats)
	
	--Fix for missing anims
	self.wpn_fps_smg_erma.animations = {
		reload_not_empty = "reload_not_empty",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload = "reload",
		magazine_empty = "last_recoil"
	}

	self.wpn_fps_smg_erma.override = self.wpn_fps_smg_erma.override or {} 
	self.wpn_fps_smg_erma.override.wpn_fps_smg_mac10_s_no = {
		stats = deep_clone(stocks.remove_nocheeks_stats),
		custom_stats = deep_clone(stocks.remove_nocheeks_stats)
	}

	table.insert(self.wpn_fps_smg_erma.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_smg_erma.uses_parts, "wpn_fps_upg_i_autofire")
	table.insert(self.wpn_fps_smg_erma.uses_parts, "wpn_fps_smg_mac10_s_no")

	self.wpn_fps_smg_erma_npc.uses_parts = deep_clone(self.wpn_fps_smg_erma.uses_parts)	

end)

--Airbow
Hooks:PostHook(WeaponFactoryTweakData, "_init_ecp", "resmod_ecp", function(self)

	self.parts.wpn_fps_bow_ecp_s_standard.a_obj = "a_g"
	self.parts.wpn_fps_bow_ecp_s_standard.forbids = {
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_upg_m4_g_sniper",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_snp_tti_g_grippy",
		"wpn_fps_upg_g_m4_surgeon"
	}


	self.parts.wpn_fps_bow_ecp_s_bare_grip = deep_clone(self.parts.wpn_fps_bow_ecp_s_bare)
	self.parts.wpn_fps_bow_ecp_s_bare_grip.pcs = nil
	self.parts.wpn_fps_bow_ecp_s_bare_grip.a_obj = "a_g"
	self.parts.wpn_fps_bow_ecp_s_bare_grip.supported = true
	self.parts.wpn_fps_bow_ecp_s_bare_grip.stats = { value = 1 }
	self.parts.wpn_fps_bow_ecp_s_bare_grip.visibility = {
		{
			objects = {
				g_stock_bare = false
			}
		}
	}

	--Light Stock
	self.parts.wpn_fps_bow_ecp_s_bare.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_ecp_s_bare.a_obj = "a_g"
	self.parts.wpn_fps_bow_ecp_s_bare.adds = { "wpn_fps_bow_ecp_s_bare_grip" }
	self.parts.wpn_fps_bow_ecp_s_bare.supported = true
	self.parts.wpn_fps_bow_ecp_s_bare.stats = {
		value = 3,
		spread = -1,
		recoil = -4,
		concealment = 3,
	}
	self.parts.wpn_fps_bow_ecp_s_bare.custom_stats = {
		ads_speed_mult = 0.925
	}
	self.parts.wpn_fps_bow_ecp_s_bare.visibility = {
		{
			objects = {
				g_grip = false
			}
		}
	}

	
	--Explosive Arrows
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.is_a_unlockable = true
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.pcs = {}
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.supported = true
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.stats = {
		damage = 45, 
		total_ammo_mod = -50, 
		spread = -3, 
		recoil = -6
	}
	self.parts.wpn_fps_bow_ecp_m_arrows_explosive.custom_stats = {
		launcher_grenade = "ecp_arrow_exp",
		block_b_storm = true
	}
	
	--Poison Arrow
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.is_a_unlockable = true
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.pcs = {}
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.supported = true
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.stats = {damage = -10}
	self.parts.wpn_fps_bow_ecp_m_arrows_poison.custom_stats = {
		launcher_grenade = "ecp_arrow_poison",
		dot_data = {
			type = "poison",
			custom_data = {}
		}
	}


	if not self.wpn_fps_bow_ecp.override then
		self.wpn_fps_bow_ecp.override = {}
	end

	self.wpn_fps_bow_ecp.override.wpn_fps_upg_m4_g_ergo = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_upg_m4_g_sniper = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_upg_m4_g_hgrip = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_upg_m4_g_mgrip = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_snp_tti_g_grippy = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_upg_g_m4_surgeon = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}
	self.wpn_fps_bow_ecp.override.wpn_fps_ass_m4_g_fancy = { 
		forbids = {
			"wpn_fps_upg_m4_g_standard_vanilla",
			"wpn_fps_bow_ecp_s_bare_grip"
		}
	}

	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_upg_m4_g_ergo")
	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_upg_m4_g_sniper")
	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_upg_m4_g_hgrip")
	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_upg_m4_g_mgrip")
	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_snp_tti_g_grippy")
	table.insert(self.wpn_fps_bow_ecp.uses_parts, "wpn_fps_upg_g_m4_surgeon")

	self.wpn_fps_bow_ecp_npc.uses_parts = deep_clone(self.wpn_fps_bow_ecp.uses_parts)	

end)

--Crosskill Guard
Hooks:PostHook(WeaponFactoryTweakData, "_init_shrew", "resmod_shrew", function(self)

	--Blinged Grip
	self.parts.wpn_fps_pis_shrew_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_shrew_g_bling.supported = true
	self.parts.wpn_fps_pis_shrew_g_bling.has_description = true
	self.parts.wpn_fps_pis_shrew_g_bling.desc_id = "bm_shrew_g_bling_sc_desc"	
	self.parts.wpn_fps_pis_shrew_g_bling.stats = {
		value = 5,
		concealment = -1,
		spread = 1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_shrew_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_shrew_g_ergo.supported = true
	self.parts.wpn_fps_pis_shrew_g_ergo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_pis_shrew_g_ergo.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Extended Magazine
	self.parts.wpn_fps_pis_shrew_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_shrew_m_extended.supported = true
	self.parts.wpn_fps_pis_shrew_m_extended.stats = {
		extra_ammo = 2,
		reload = -1,
		concealment = -1,
		value = 1
	}
	
	--Milled Slide
	self.parts.wpn_fps_pis_shrew_sl_milled.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_shrew_sl_milled.supported = true
	self.parts.wpn_fps_pis_shrew_sl_milled.stats = {
		value = 2,
		recoil = -2,
		concealment = 1
	}
	
	self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_1 = {parent = "barrel"}
	self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_2 = {parent = "barrel"}
	
	table.insert(self.wpn_fps_pis_shrew.uses_parts, "wpn_fps_pis_1911_co_1")
	table.insert(self.wpn_fps_pis_shrew_npc.uses_parts, "wpn_fps_pis_1911_co_1")		
	table.insert(self.wpn_fps_pis_shrew.uses_parts, "wpn_fps_pis_1911_co_2")
	table.insert(self.wpn_fps_pis_shrew_npc.uses_parts, "wpn_fps_pis_1911_co_2")	

	self.wpn_fps_pis_shrew_npc.uses_parts = deep_clone(self.wpn_fps_pis_shrew.uses_parts)		

end)

--Akimbo Crosskill Guards
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_shrew", "resmod_x_shrew", function(self)

	self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_1 = {parent = "barrel"}
	self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_2 = {parent = "barrel"}
	self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_shrew_m_extended = {
		supported = true,
		stats = {
			extra_ammo = 4,
			reload = -1,
			concealment = -1,
			value = 1
		}
	}
	
	table.insert(self.wpn_fps_pis_x_shrew.uses_parts, "wpn_fps_pis_1911_co_1")
	table.insert(self.wpn_fps_pis_x_shrew_npc.uses_parts, "wpn_fps_pis_1911_co_1")		
	table.insert(self.wpn_fps_pis_x_shrew.uses_parts, "wpn_fps_pis_1911_co_2")
	table.insert(self.wpn_fps_pis_x_shrew_npc.uses_parts, "wpn_fps_pis_1911_co_2")	

	self.wpn_fps_pis_x_shrew_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_shrew.uses_parts)	
	
end)

--Grimm 12g
Hooks:PostHook(WeaponFactoryTweakData, "_init_basset", "resmod_basset", function(self)
	
	--Little Brother Foregrip
	self.parts.wpn_fps_sho_basset_fg_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_basset_fg_short.supported = true
	self.parts.wpn_fps_sho_basset_fg_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_sho_basset_fg_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

	--Big Brother Magazine
	self.parts.wpn_fps_sho_basset_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_basset_m_extended.supported = true
	self.parts.wpn_fps_sho_basset_m_extended.custom_stats = {
		ads_speed_mult = 1.05
	}
	self.parts.wpn_fps_sho_basset_m_extended.stats = {
		value = 1, 
		extra_ammo = 5, 
		reload = -2, 
		concealment = -2
	}

	self.wpn_fps_sho_basset.override = {
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,
		wpn_fps_upg_a_custom_free = a_custom_semi_override,					
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
	}
	
	table.insert(self.wpn_fps_sho_basset.uses_parts, "wpn_upg_saiga_m_20rnd")
	table.insert(self.wpn_fps_sho_basset_npc.uses_parts, "wpn_upg_saiga_m_20rnd")	

	self.wpn_fps_sho_basset_npc.uses_parts = deep_clone(self.wpn_fps_sho_basset.uses_parts)

end)

--Promotional mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_icc", "resmod_icc", function(self)
	
	--OMNIA Assault Frame
	self.parts.wpn_fps_smg_p90_body_boxy.pcs = {}
	self.parts.wpn_fps_smg_p90_body_boxy.supported = true
	self.parts.wpn_fps_smg_p90_body_boxy.stats = {value = 0}
	self.parts.wpn_fps_smg_p90_body_boxy.forbids = { "wpn_fps_addon_ris" }
	
	--Custom Built Frame
	self.parts.wpn_fps_smg_mac10_body_modern.pcs = {}
	self.parts.wpn_fps_smg_mac10_body_modern.supported = true
	self.parts.wpn_fps_smg_mac10_body_modern.stats = {value = 0}
	
	--Custom Milled Barrel
	self.parts.wpn_fps_pis_deagle_b_modern.pcs = {}
	self.parts.wpn_fps_pis_deagle_b_modern.supported = true
	self.parts.wpn_fps_pis_deagle_b_modern.stats = deep_clone(muzzle_device.muzzle_rec_stats)
	self.parts.wpn_fps_pis_deagle_b_modern.custom_stats = deep_clone(muzzle_device.muzzle_rec_custom_stats)
	self.parts.wpn_fps_pis_deagle_b_modern.forbids = {}
	
	--Custom Titanium Frame
	self.parts.wpn_fps_pis_beretta_body_modern.pcs = {}
	self.parts.wpn_fps_pis_beretta_body_modern.supported = true
	self.parts.wpn_fps_pis_beretta_body_modern.stats = {value = 0}
	
	--Custom Reinforced Frame
	self.parts.wpn_fps_pis_judge_body_modern.pcs = {}
	self.parts.wpn_fps_pis_judge_body_modern.supported = true
	self.parts.wpn_fps_pis_judge_body_modern.stats = {value = 0}
	
end)	

--Union 5.56
Hooks:PostHook(WeaponFactoryTweakData, "_init_corgi", "resmod_corgi", function(self)
	
	--Dunes Tactical Receiver
	self.parts.wpn_fps_ass_corgi_body_lower_strap.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_corgi_body_lower_strap.supported = true
	self.parts.wpn_fps_ass_corgi_body_lower_strap.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}
	
	--MSG Barrel
	self.parts.wpn_fps_ass_corgi_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_corgi_b_short.supported = true
	self.parts.wpn_fps_ass_corgi_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_ass_corgi_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
end)	

--Compact 40mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_slap", "resmod_slap", function(self)
	
	--Nada!
	
end)

--Akimbo Micro Uzi
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_baka", "resmod_x_baka", function(self)
	
	table.insert(self.wpn_fps_smg_x_baka.uses_parts, "wpn_fps_smg_baka_s_standard")
	table.insert(self.wpn_fps_smg_x_baka.uses_parts, "wpn_fps_smg_baka_s_unfolded")
			
	self.wpn_fps_smg_x_baka_npc.uses_parts = deep_clone(self.wpn_fps_smg_x_baka.uses_parts)
end)	

--Akimbo Mark 10
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_mac10", "resmod_x_mac10", function(self)

	self.wpn_fps_smg_x_mac10.override.wpn_upg_o_marksmansight_rear_vanilla = {
		a_obj = "a_or"
	}
	self.wpn_fps_smg_x_mac10.override.wpn_upg_o_marksmansight_front_vanilla = {
		a_obj = "a_of"
	}
	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_mac10_m_extended = {
		supported = true,
		stats = {
			value = 2,
			concealment = -1,
			extra_ammo = 20,
			reload = -1
		}
	}
	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_mac10_m_quick = {
		supported = true,
		stats = {
			value = 2,
			spread = -1,
			reload = 2,
			extra_ammo = 20,
			concealment = -2
		}
	}
	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_pm9_fl_adapter = { a_obj = "a_vg" }
	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_schakal_vg_surefire = { stats = deep_clone(self.parts.wpn_fps_upg_vg_ass_smg_verticalgrip.stats) }
	
	self.wpn_fps_smg_x_mac10.adds = self.wpn_fps_smg_x_mac10.adds or {}

	self.wpn_fps_smg_x_mac10.adds.wpn_fps_upg_vg_ass_smg_stubby = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_x_mac10.adds.wpn_fps_upg_vg_ass_smg_verticalgrip = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_x_mac10.adds.wpn_fps_upg_vg_ass_smg_afg = { "wpn_fps_smg_pm9_fl_adapter" }
	self.wpn_fps_smg_x_mac10.adds.wpn_fps_smg_schakal_vg_surefire = { "wpn_fps_smg_pm9_fl_adapter" }

	table.insert(self.wpn_fps_smg_x_mac10.uses_parts, "wpn_fps_smg_schakal_vg_surefire")
	table.insert(self.wpn_fps_smg_x_mac10.uses_parts, "wpn_fps_smg_mac10_s_no")

	self.wpn_fps_smg_x_mac10_npc.adds = deep_clone(self.wpn_fps_smg_x_mac10.adds)	
	self.wpn_fps_smg_x_mac10_npc.override = deep_clone(self.wpn_fps_smg_x_mac10.override)	
	self.wpn_fps_smg_x_mac10_npc.uses_parts = deep_clone(self.wpn_fps_smg_x_mac10.uses_parts)	

end)	

--Akimbo Matever .357
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_2006m", "resmod_x_2006m", function(self)

	--Nada!

end)

--Akimbo Glock18cs
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_g18c", "resmod_x_g18c", function(self)

	self.wpn_fps_pis_x_g18c.override.wpn_fps_pis_g18c_m_mag_33rnd = {
		animations = {
			reload_not_empty = "reload_not_empty_right",
			reload = "reload_right",
			reload_left = "reload_left",
			reload_not_empty_left = "reload_not_empty_left"
		},
		supported = true,
		stats = {
			value = 6,
			extra_ammo = 32,
			concealment = -2,
			reload = -3
		}
	}
	
	self.wpn_fps_pis_x_g18c.override.wpn_fps_pis_g18c_b_standard.animations = {
		reload_left = "reload_left",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload_not_empty = "reload_not_empty_right",
		reload = "reload_right",
		reload_not_empty_left = "reload_not_empty_left",
		magazine_empty = "last_recoil"
	}

end)

--Akimbo Raging Bulls
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_rage", "resmod_x_rage", function(self)

	self.wpn_fps_pis_x_rage.animations = {
		reload_left = "reload",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload_not_empty_left = "reload",
		reload = "reload",
		reload_not_empty = "reload"
	}
	self.wpn_fps_pis_x_rage.override = {
		wpn_fps_pis_rage_body_standard = {
			animations = {		
				reload_left = "reload",
				fire = "recoil",
				fire_steelsight = "recoil",
				reload_not_empty_left = "reload",
				reload = "reload",
				reload_not_empty = "reload"
			}
		},
		wpn_fps_pis_rage_body_smooth = {
			animations = {
				reload_left = "reload",
				fire = "recoil",
				fire_steelsight = "recoil",
				reload_not_empty_left = "reload",
				reload = "reload",
				reload_not_empty = "reload"
			}
		}
	}
	table.insert(self.wpn_fps_pis_x_rage.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_rage_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	
	table.insert(self.wpn_fps_pis_x_rage.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_rage_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	table.insert(self.wpn_fps_pis_x_rage.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")
	table.insert(self.wpn_fps_pis_x_rage_npc.uses_parts, "wpn_fps_upg_ns_pis_meatgrinder")		
		
	self.wpn_fps_pis_x_rage_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_rage.uses_parts)

end)

--Akimbo Judge
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_judge", "resmod_x_judge", function(self)

	self.wpn_fps_pis_x_judge.animations = {
		reload_left = "reload",
		fire = "recoil",
		fire_steelsight = "recoil",
		reload_not_empty_left = "reload",
		reload = "reload",
		reload_not_empty = "reload"
	}

	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_slug = a_slug_pump_override
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_custom = a_custom_pump_override
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_custom_free = a_custom_pump_override	
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_explosive = a_explosive_pump_override
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_rip = a_rip_pump_override
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override			

	self.wpn_fps_pis_x_judge.override.wpn_fps_pis_judge_body_standard = {
		animations = {		
			reload_left = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty_left = "reload",
			reload = "reload",
			reload_not_empty = "reload"
		}
	}
	self.wpn_fps_pis_x_judge.override.wpn_fps_pis_judge_body_modern = {
		animations = {
			reload_left = "reload",
			fire = "recoil",
			fire_steelsight = "recoil",
			reload_not_empty_left = "reload",
			reload = "reload",
			reload_not_empty = "reload"
		}
	}
	

end)

--XL 5.56
Hooks:PostHook(WeaponFactoryTweakData, "_init_shuno", "resmod_shuno", function(self)

	--XS Barrel
	self.parts.wpn_fps_lmg_shuno_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_shuno_b_short.supported = true
	self.parts.wpn_fps_lmg_shuno_b_short.stats = {
		value = 4,
		spread = -1,
		recoil = -2,
		concealment = 2
	}
	self.parts.wpn_fps_lmg_shuno_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--XS Heat Sink Barrel
	self.parts.wpn_fps_lmg_shuno_b_heat_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_shuno_b_heat_short.supported = true
	self.parts.wpn_fps_lmg_shuno_b_heat_short.stats = {
		concealment = 1,
		spread = -1,
		value = 3
	}
	self.parts.wpn_fps_lmg_shuno_b_heat_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Heat Sink Barrel
	self.parts.wpn_fps_lmg_shuno_b_heat_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_shuno_b_heat_long.supported = true
	self.parts.wpn_fps_lmg_shuno_b_heat_long.stats = {
		value = 6,
		recoil = 2,
		concealment = -1
	}
	
	self.wpn_fps_lmg_shuno.override = {
		wpn_fps_upg_ammo_half_that = {
			supported = true,
			stats = {
				value = 1,
				--total_ammo_mod = 20,
				--extra_ammo = 60,
				--concealment = -2
			},
			--custom_stats = {movement_speed = 0.9},	
		}
	}	

	--table.insert(self.wpn_fps_lmg_shuno.uses_parts, "wpn_fps_upg_ammo_half_that")
	--table.insert(self.wpn_fps_lmg_shuno_npc.uses_parts, "wpn_fps_upg_ammo_half_that")		
		
	self.wpn_fps_lmg_shuno_npc.uses_parts = deep_clone(self.wpn_fps_lmg_shuno.uses_parts)	

end)

--MA-17 Flamethrower
Hooks:PostHook(WeaponFactoryTweakData, "_init_system", "resmod_system", function(self)

	--Merlin Barrel
	self.parts.wpn_fps_fla_system_b_wtf.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_system_b_wtf.supported = true
	self.parts.wpn_fps_fla_system_b_wtf.stats = {
		concealment = 1,
		spread = -1,
		value = 3
	}
	self.parts.wpn_fps_fla_system_b_wtf.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	
	--High Temperature Mixture
	self.parts.wpn_fps_fla_system_m_high.desc_id = "bm_wp_fla_mk2_mag_well_desc_sc"
	self.parts.wpn_fps_fla_system_m_high.has_description = true
	self.parts.wpn_fps_fla_system_m_high.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_system_m_high.supported = true
	self.parts.wpn_fps_fla_system_m_high.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_system_m_high.custom_stats = {
		use_well_done_dot = true
	}			

	--Low Temperature Mixture
	self.parts.wpn_fps_fla_system_m_low.desc_id = "bm_wp_fla_mk2_mag_rare_desc_sc"
	self.parts.wpn_fps_fla_system_m_low.has_description = true
	self.parts.wpn_fps_fla_system_m_low.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_fla_system_m_low.supported = true
	self.parts.wpn_fps_fla_system_m_low.stats = {
		value = 5
	}
	self.parts.wpn_fps_fla_system_m_low.custom_stats = {
		use_rare_dot = true
	}		
	
	table.insert(self.wpn_fps_fla_system.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
	table.insert(self.wpn_fps_fla_system_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")		
	table.insert(self.wpn_fps_fla_system.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
	table.insert(self.wpn_fps_fla_system_npc.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")	
	table.insert(self.wpn_fps_fla_system.uses_parts, "wpn_fps_upg_fl_ass_peq15")
	table.insert(self.wpn_fps_fla_system_npc.uses_parts, "wpn_fps_upg_fl_ass_peq15")	
	table.insert(self.wpn_fps_fla_system.uses_parts, "wpn_fps_upg_fl_ass_laser")
	table.insert(self.wpn_fps_fla_system_npc.uses_parts, "wpn_fps_upg_fl_ass_laser")	
	table.insert(self.wpn_fps_fla_system.uses_parts, "wpn_fps_upg_fl_ass_utg")
	table.insert(self.wpn_fps_fla_system_npc.uses_parts, "wpn_fps_upg_fl_ass_utg")	
		
	self.wpn_fps_fla_system_npc.uses_parts = deep_clone(self.wpn_fps_fla_system.uses_parts)	

end)

--Signature
Hooks:PostHook(WeaponFactoryTweakData, "_init_shepheard", "resmod_shepheard", function(self)

	--Short Foregrip
	self.parts.wpn_fps_smg_shepheard_body_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_shepheard_body_short.supported = true
	self.parts.wpn_fps_smg_shepheard_body_short.stats = {
		concealment = 1,
		recoil = -1,
		value = 2
	}
	
	--Standard Magazine Swap
	self.parts.wpn_fps_smg_shepheard_mag_standard.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_extended"
	self.parts.wpn_fps_smg_shepheard_mag_standard.bullet_objects = {
		amount = 30,
		prefix = "g_bullet_"
	}
	self.parts.wpn_fps_smg_shepheard_mag_standard.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_mag_extended"
	
	--Short Mag (Formerly Extended Magazine)
	self.parts.wpn_fps_smg_shepheard_mag_extended.name_id = "bm_wp_sterling_m_short"
	self.parts.wpn_fps_smg_shepheard_mag_extended.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_standard"
	self.parts.wpn_fps_smg_shepheard_mag_extended.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_mag_standard"
	self.parts.wpn_fps_smg_shepheard_mag_extended.bullet_objects = {
		amount = 20,
		prefix = "g_bullet_"
	}
	self.parts.wpn_fps_smg_shepheard_mag_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_shepheard_mag_extended.supported = true
	self.parts.wpn_fps_smg_shepheard_mag_extended.stats = {
		value = 1,
		extra_ammo = -10,
		reload = 2,
		concealment = 2
	}
	self.parts.wpn_fps_smg_shepheard_mag_extended.custom_stats = {
		ads_speed_mult = 0.95
	}
	
	--No Stock
	self.parts.wpn_fps_smg_shepheard_s_no.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_shepheard_s_no.supported = true
	self.parts.wpn_fps_smg_shepheard_s_no.stats = deep_clone(stocks.remove_nocheeks_stats)
	self.parts.wpn_fps_smg_shepheard_s_no.custom_stats = deep_clone(stocks.remove_nocheeks_stats)

	if not self.wpn_fps_smg_shepheard.override then
		self.wpn_fps_smg_shepheard.override = {}
	end

	self.wpn_fps_smg_shepheard.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
	}
	self.wpn_fps_smg_shepheard.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
		custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
	}
	
	table.insert(self.wpn_fps_smg_shepheard.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_smg_shepheard_npc.uses_parts, "wpn_fps_upg_m4_s_standard")	

	table.insert(self.wpn_fps_smg_shepheard.uses_parts, "wpn_fps_snp_tti_s_vltor")
	table.insert(self.wpn_fps_smg_shepheard_npc.uses_parts, "wpn_fps_snp_tti_s_vltor")

	self.wpn_fps_smg_shepheard_npc.uses_parts = deep_clone(self.wpn_fps_smg_shepheard.uses_parts)

end)

--Tempest 21
Hooks:PostHook(WeaponFactoryTweakData, "_init_komodo", "resmod_komodo", function(self)

	--Nada!

end)

--DECA Technologies Compound Bow
Hooks:PostHook(WeaponFactoryTweakData, "_init_elastic", "resmod_elastic", function(self)

	--Tactical Frame
	self.parts.wpn_fps_bow_elastic_body_tactic.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_elastic_body_tactic.supported = true
	self.parts.wpn_fps_bow_elastic_body_tactic.stats = {
		value = 3,
		concealment = 1,
		spread = -1
	}
	
	--Wood Grip
	self.parts.wpn_fps_bow_elastic_g_2.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_elastic_g_2.supported = true
	self.parts.wpn_fps_bow_elastic_g_2.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_bow_elastic_g_3.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_bow_elastic_g_3.supported = true
	self.parts.wpn_fps_bow_elastic_g_3.stats = {
		value = 3,
		concealment = 1,
		spread = -1
	}
	
	--Explosive Arrows
	self.parts.wpn_fps_bow_elastic_m_explosive.pcs = {}
	self.parts.wpn_fps_bow_elastic_m_explosive.supported = true
	self.parts.wpn_fps_bow_elastic_m_explosive.stats = {damage = 60, total_ammo_mod = -40, spread = -3}
	self.parts.wpn_fps_bow_elastic_m_explosive.custom_stats = {
		launcher_grenade = "elastic_arrow_exp"
	}
	
	--Poison Arrows
	self.parts.wpn_fps_bow_elastic_m_poison.pcs = {}
	self.parts.wpn_fps_bow_elastic_m_poison.supported = true
	self.parts.wpn_fps_bow_elastic_m_poison.stats = {damage = -15, total_ammo_mod = 0}
	self.parts.wpn_fps_bow_elastic_m_poison.custom_stats = {
		launcher_grenade = "elastic_arrow_poison",
		dot_data = {
			type = "poison",
			custom_data = {}
		}
	}

end)

--M13 9mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_legacy", "resmod_legacy", function(self)

	--Threaded Barrel
	self.parts.wpn_fps_pis_legacy_b_threaded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_legacy_b_threaded.supported = true
	self.parts.wpn_fps_pis_legacy_b_threaded.stats = deep_clone(barrels.long_b1_stats)
	self.parts.wpn_fps_pis_legacy_b_threaded.custom_stats = deep_clone(barrels.long_b1_custom_stats)

	--Wooden Grip
	self.parts.wpn_fps_pis_legacy_g_wood.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_legacy_g_wood.supported = true
	self.parts.wpn_fps_pis_legacy_g_wood.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	

	self.wpn_fps_pis_legacy.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_legacy.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}				
	
	table.insert(self.wpn_fps_pis_legacy.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_legacy_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	table.insert(self.wpn_fps_pis_legacy.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_legacy_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	self.wpn_fps_pis_legacy_npc.uses_parts = deep_clone(self.wpn_fps_pis_legacy.uses_parts)	

end)

--Claire 12G
Hooks:PostHook(WeaponFactoryTweakData, "_init_coach", "resmod_coach", function(self)

	--Sawed Off Barrel
	self.parts.wpn_fps_sho_coach_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_coach_b_short.supported = true
	self.parts.wpn_fps_sho_coach_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_sho_coach_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	
	--Deadman's Stock
	self.parts.wpn_fps_sho_coach_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_coach_s_short.supported = true
	self.parts.wpn_fps_sho_coach_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_sho_coach_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)
	
	--Override Table
	self.wpn_fps_sho_coach.override = {}	

end)
	
--Cartel Optics Pack
Hooks:PostHook(WeaponFactoryTweakData, "_init_mwm", "resmod_mwm", function(self)

	--Marmon Compensator
	self.parts.wpn_fps_upg_ns_ass_smg_v6.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_ass_smg_v6.supported = true
	self.parts.wpn_fps_upg_ns_ass_smg_v6.stats = deep_clone(muzzle_device.muzzle_rec2_stats)
	self.parts.wpn_fps_upg_ns_ass_smg_v6.custom_stats = deep_clone(muzzle_device.muzzle_rec2_custom_stats)
	
	--Titanuim Skeleton Grip
	self.parts.wpn_fps_upg_g_m4_surgeon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_g_m4_surgeon.supported = true
	self.parts.wpn_fps_upg_g_m4_surgeon.custom_stats = {
			ads_speed_mult = 0.95
		}
	self.parts.wpn_fps_upg_g_m4_surgeon.stats = {
		value = 4,
		recoil = -4,
		concealment = 2
	}
		
	--Magnifier
	self.parts.wpn_fps_upg_o_sig.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_sig.supported = true
	self.parts.wpn_fps_upg_o_sig.desc_id = "bm_wp_upg_o_magnifier_desc"
	self.parts.wpn_fps_upg_o_sig.has_description = true
	self.parts.wpn_fps_upg_o_sig.stats = {
		value = 2,
		gadget_zoom = 21
	}
	self.parts.wpn_fps_upg_o_sig.perks = {
		"gadget"
	}
	self.parts.wpn_fps_upg_o_sig.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod)
	
	--Advanced Combat/Trijicon ACOG 6x48
	self.parts.wpn_fps_upg_o_bmg.reticle_obj = nil
	self.parts.wpn_fps_upg_o_bmg.has_description = true
	self.parts.wpn_fps_upg_o_bmg.desc_id = "bm_wp_upg_o_6"
	self.parts.wpn_fps_upg_o_bmg.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_bmg.supported = true
	self.parts.wpn_fps_upg_o_bmg.stats = {
		zoom = 50,
		value = 6
	}
	self.parts.wpn_fps_upg_o_bmg.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end
	self.parts.wpn_fps_upg_o_bmg.perks = {"scope"}
	self.parts.wpn_fps_upg_o_bmg.forbids = {
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_ass_m16_os_frontsight",
		"wpn_fps_ass_scar_o_flipups_up",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_sig",
		--"wpn_fps_ass_shak12_o_carry_dummy"
	}
	
	self.parts.wpn_fps_upg_o_rms.has_description = true
	self.parts.wpn_fps_upg_o_rms.desc_id = "bm_wp_upg_o_1_1"
	self.parts.wpn_fps_upg_o_rms.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_rms.supported = true
	self.parts.wpn_fps_upg_o_rms.stats = {
		zoom = 1,
		value = 6
	}
	self.parts.wpn_fps_upg_o_rms.perks = {
		"scope"
	}
	
	self.parts.wpn_fps_upg_o_rikt.has_description = true
	self.parts.wpn_fps_upg_o_rikt.desc_id = "bm_wp_upg_o_1_2"
	self.parts.wpn_fps_upg_o_rikt.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_rikt.supported = true
	self.parts.wpn_fps_upg_o_rikt.stats = {
		zoom = 2,
		value = 6
	}
	self.parts.wpn_fps_upg_o_rikt.perks = {
		"scope"
	}
	--Maelstrom/Razor AMG UH-1
	self.parts.wpn_fps_upg_o_uh.has_description = true
	self.parts.wpn_fps_upg_o_uh.desc_id = "bm_wp_upg_o_1_5"
	self.parts.wpn_fps_upg_o_uh.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_uh.supported = true
	self.parts.wpn_fps_upg_o_uh.stats = {
		value = 3,
		zoom = 5
	}
	self.parts.wpn_fps_upg_o_uh.perks = {
		"scope"
	}
	self.parts.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_eotech.stance_mod)
	
	--Compact Profile/DI Optical FC1 Sight
	self.parts.wpn_fps_upg_o_fc1.has_description = true
	self.parts.wpn_fps_upg_o_fc1.desc_id = "bm_wp_upg_o_1_5_pris"
	self.parts.wpn_fps_upg_o_fc1.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_fc1.supported = true
	self.parts.wpn_fps_upg_o_fc1.stats = {
		value = 3,
		zoom = 4
	}
	self.parts.wpn_fps_upg_o_fc1.perks = {
		"scope"
	}
	self.parts.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_upg_o_eotech.stance_mod)
	
	self.parts.wpn_fps_upg_o_45steel.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_o_45steel.supported = true
	self.parts.wpn_fps_upg_o_45steel.desc_id = "bm_wp_upg_o_angled_desc"
	self.parts.wpn_fps_upg_o_45steel.has_description = true
	self.parts.wpn_fps_upg_o_45steel.stats = {
		value = 1,
		gadget_zoom = 2
	}
	self.parts.wpn_fps_upg_o_45steel.perks = {
		"gadget"
	}

	--Hurricane Comp.
	self.parts.wpn_fps_upg_ns_pis_typhoon.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_typhoon.supported = true
	self.parts.wpn_fps_upg_ns_pis_typhoon.stats = deep_clone(muzzle_device.muzzle_c_duo_stats)
	self.parts.wpn_fps_upg_ns_pis_typhoon.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)

end)

--Bernetti Auto
Hooks:PostHook(WeaponFactoryTweakData, "_init_beer", "resmod_beer", function(self)

	--Weller Barrel
	self.parts.wpn_fps_pis_beer_b_robo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beer_b_robo.supported = true
	self.parts.wpn_fps_pis_beer_b_robo.forbids = {
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_o_rms",
		"wpn_fps_upg_o_rikt"
	}	
	self.parts.wpn_fps_pis_beer_b_robo.custom_stats = {
		falloff_start_mult = 1.25,
		falloff_end_mult = 1.25,
		ads_speed_mult = 1.125
	}
	self.parts.wpn_fps_pis_beer_b_robo.stats = {
		spread = 3,
		recoil = 4,
		value = 6,
		concealment = -5
	}
	
	--Weller Grip
	self.parts.wpn_fps_pis_beer_g_robo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beer_g_robo.supported = true
	self.parts.wpn_fps_pis_beer_g_robo.custom_stats = {
		ads_speed_mult = 0.975
	}
	self.parts.wpn_fps_pis_beer_g_robo.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	
	--Cartel Grip
	self.parts.wpn_fps_pis_beer_g_lux.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beer_g_lux.supported = true
	self.parts.wpn_fps_pis_beer_g_lux.stats = {
		concealment = -2,
		value = 2,
		recoil = 4
	}
	
	--Extended Magazine
	self.parts.wpn_fps_pis_beer_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beer_m_extended.supported = true
	self.parts.wpn_fps_pis_beer_m_extended.custom_stats = {
		ads_speed_mult = 1.025
	}
	self.parts.wpn_fps_pis_beer_m_extended.stats = {
		extra_ammo = 5,
		value = 3,
		reload = -1,
		concealment = -1
	}
	
	--Federales Stock
	self.parts.wpn_fps_pis_beer_s_std.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_beer_s_std.supported = true
	self.parts.wpn_fps_pis_beer_s_std.stats = deep_clone(stocks.add_folder_stats)
	self.parts.wpn_fps_pis_beer_s_std.custom_stats = deep_clone(stocks.add_folder_stats)
	
	self.parts.wpn_fps_pis_beer_body_modern.unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_body_robo"
	
	--Overrides
	self.wpn_fps_pis_beer.override.wpn_fps_pis_beretta_co_co1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_beer.override.wpn_fps_pis_beretta_co_co2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}

	for i, part_id in pairs(self.wpn_fps_pis_beer.uses_parts) do
		if self.parts and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "gadget" then
			if not self.wpn_fps_pis_beer.override[part_id] then
				self.wpn_fps_pis_beer.override[part_id] = {}
			end
			if not self.wpn_fps_pis_beer.override[part_id].override then
				self.wpn_fps_pis_beer.override[part_id].override = {}
			end
			self.wpn_fps_pis_beer.override[part_id].override.wpn_fps_pis_beer_body_modern = {
				unit = "units/pd2_dlc_afp/weapons/wpn_fps_pis_beer_pts/wpn_fps_pis_beer_body_modern"
			}
		end
	end			
			
	table.insert(self.wpn_fps_pis_beer.uses_parts, "wpn_fps_pis_beretta_co_co1")
	table.insert(self.wpn_fps_pis_beer_npc.uses_parts, "wpn_fps_pis_beretta_co_co1")
	table.insert(self.wpn_fps_pis_beer.uses_parts, "wpn_fps_pis_beretta_co_co2")
	table.insert(self.wpn_fps_pis_beer_npc.uses_parts, "wpn_fps_pis_beretta_co_co2")		
	table.insert(self.wpn_fps_pis_beer.uses_parts, "wpn_fps_upg_i_b93o")
	table.insert(self.wpn_fps_pis_beer_npc.uses_parts, "wpn_fps_upg_i_b93o")
		
	self.wpn_fps_pis_beer_npc.override = deep_clone(self.wpn_fps_pis_beer.override)	
	self.wpn_fps_pis_beer_npc.uses_parts = deep_clone(self.wpn_fps_pis_beer.uses_parts)			

end)

--Czech 92
Hooks:PostHook(WeaponFactoryTweakData, "_init_czech", "resmod_czech", function(self)

	--Sicario Barrel
	self.parts.wpn_fps_pis_czech_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_czech_b_long.supported = true
	self.parts.wpn_fps_pis_czech_b_long.stats = deep_clone(barrels.long_b1_stats)
	self.parts.wpn_fps_pis_czech_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)
	
	--Sicario Grip
	self.parts.wpn_fps_pis_czech_g_sport.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_czech_g_sport.supported = true
	self.parts.wpn_fps_pis_czech_g_sport.stats = {
		reload = 2,
		value = 2,
		concealment = -2
	}
	
	--Cartel_Grip
	self.parts.wpn_fps_pis_czech_g_luxury.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_czech_g_luxury.supported = true
	self.parts.wpn_fps_pis_czech_g_luxury.stats = {
		value = 2,
		recoil = -2,
		spread = 1
	}
	
	--Extended Mag
	--CZECH EM
	self.parts.wpn_fps_pis_czech_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_czech_m_extended.supported = true
	self.parts.wpn_fps_pis_czech_m_extended.stats = {
		value = 1,
		reload = -2,
		extra_ammo = 7,
		concealment = -2
	}
	
	--Tirador Stock
	self.parts.wpn_fps_pis_czech_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_czech_s_standard.supported = true
	self.parts.wpn_fps_pis_czech_s_standard.stats = deep_clone(stocks.add_folder_stats)
	self.parts.wpn_fps_pis_czech_s_standard.custom_stats = deep_clone(stocks.add_folder_stats)
	
	--Overrides
	self.wpn_fps_pis_czech.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_czech.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}				

	table.insert(self.wpn_fps_pis_czech.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_czech_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	table.insert(self.wpn_fps_pis_czech.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_czech_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
		
	self.wpn_fps_pis_czech_npc.override = deep_clone(self.wpn_fps_pis_czech.override)	
	self.wpn_fps_pis_czech_npc.uses_parts = deep_clone(self.wpn_fps_pis_czech.uses_parts)	

end)

--Akimbo Czech 92
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_czech", "resmod_x_czech", function(self)

	self.wpn_fps_pis_x_czech.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_x_czech.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}			
	self.wpn_fps_pis_x_czech.override.wpn_fps_pis_czech_m_extended = {
		supported = true,
		stats = {
			value = 1,
			reload = -1,
			extra_ammo = 14,
			concealment = -2
		}
	}
	
	table.insert(self.wpn_fps_pis_x_czech.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_czech_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	table.insert(self.wpn_fps_pis_x_czech.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_czech_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
		
	self.wpn_fps_pis_x_czech_npc.override = deep_clone(self.wpn_fps_pis_x_czech.override)	
	self.wpn_fps_pis_x_czech_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_czech.uses_parts)		

end)

--Igor Automatik
Hooks:PostHook(WeaponFactoryTweakData, "_init_stech", "resmod_stech", function(self)

	--Tirador Barrel
	self.parts.wpn_fps_pis_stech_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_stech_b_long.supported = true
	self.parts.wpn_fps_pis_stech_b_long.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	self.parts.wpn_fps_pis_stech_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}	

	--Cartel Grip
	self.parts.wpn_fps_pis_stech_g_luxury.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_stech_g_luxury.supported = true
	self.parts.wpn_fps_pis_stech_g_luxury.stats = {
		recoil = 2,
		value = 2,
		concealment = -1
	}
	
	--Federales Grip
	self.parts.wpn_fps_pis_stech_g_tactical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_stech_g_tactical.supported = true
	self.parts.wpn_fps_pis_stech_g_tactical.stats = {
		value = 3,
		recoil = -2,
		concealment = 1
	}
	self.parts.wpn_fps_pis_stech_g_tactical.custom_stats = {
		ads_speed_mult = 0.975
	}	
	
	--Extended Mag
	self.parts.wpn_fps_pis_stech_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_stech_m_extended.supported = true
	self.parts.wpn_fps_pis_stech_m_extended.stats = {
		value = 5,
		reload = -2,
		extra_ammo = 10,
		concealment = -2
	}
	
	--Federales Stock
	self.parts.wpn_fps_pis_stech_s_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_stech_s_standard.supported = true
	self.parts.wpn_fps_pis_stech_s_standard.stats = deep_clone(stocks.add_fixed_stats)
	self.parts.wpn_fps_pis_stech_s_standard.custom_stats = deep_clone(stocks.add_fixed_stats)

	self.parts.wpn_fps_pis_stech_body_standard_rail = deep_clone(self.parts.wpn_fps_pis_stech_body_standard)
	self.parts.wpn_fps_pis_stech_body_standard_rail.visibility = {
		{
			objects = {
				g_body = false
			}
		}
	}
	self.parts.wpn_fps_pis_stech_body_standard.visibility = {
		{
			objects = {
				g_body_rail = false
			}
		}
	}

	self.wpn_fps_pis_stech.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_stech.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}		

	for i, part_id in pairs(self.wpn_fps_pis_stech.uses_parts) do
		if self.parts and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "gadget" then
			if not self.wpn_fps_pis_stech.adds then
				self.wpn_fps_pis_stech.adds = {}
			end
			if not self.wpn_fps_pis_stech.adds[part_id] then
				self.wpn_fps_pis_stech.adds[part_id] = {}
			end
			self.wpn_fps_pis_stech.adds[part_id] = {
				"wpn_fps_pis_stech_body_standard_rail"
			}
		end
	end	

	table.insert(self.wpn_fps_pis_stech.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_stech_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	table.insert(self.wpn_fps_pis_stech.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_stech_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
		
	self.wpn_fps_pis_stech_npc.override = deep_clone(self.wpn_fps_pis_stech.override)	
	self.wpn_fps_pis_stech_npc.uses_parts = deep_clone(self.wpn_fps_pis_stech.uses_parts)		

end)

--Akimbo Igor Automatik
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_stech", "resmod_x_stech", function(self)

	self.wpn_fps_pis_x_stech.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_x_stech.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}			
	self.wpn_fps_pis_x_stech.override.wpn_fps_pis_stech_m_extended = {
		supported = true,
		stats = {
			value = 5,
			reload = -2,
			extra_ammo = 20,
			concealment = -2
		}
	}
	for i, part_id in pairs(self.wpn_fps_pis_x_stech.uses_parts) do
		if self.parts and self.parts[part_id] and self.parts[part_id].type and self.parts[part_id].type == "gadget" then
			if not self.wpn_fps_pis_x_stech.adds then
				self.wpn_fps_pis_x_stech.adds = {}
			end
			if not self.wpn_fps_pis_x_stech.adds[part_id] then
				self.wpn_fps_pis_x_stech.adds[part_id] = {}
			end
			self.wpn_fps_pis_x_stech.adds[part_id] = {
				"wpn_fps_pis_stech_body_standard_rail"
			}
		end
	end	
	
	table.insert(self.wpn_fps_pis_x_stech.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_stech_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	table.insert(self.wpn_fps_pis_x_stech.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_stech_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")		
		
	self.wpn_fps_pis_x_stech_npc.override = deep_clone(self.wpn_fps_pis_x_stech.override)	
	self.wpn_fps_pis_x_stech_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_stech.uses_parts)		

end)

--Holt 9mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_holt", "resmod_holt", function(self)

	--Bling Grip
	self.parts.wpn_fps_pis_holt_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_g_bling.supported = true
	self.parts.wpn_fps_pis_holt_g_bling.stats = {
		value = 5,
		concealment = -1,
		spread = 1
	}
	
	--Ergo Grip
	self.parts.wpn_fps_pis_holt_g_ergo.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_g_ergo.supported = true
	self.parts.wpn_fps_pis_holt_g_ergo.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}
	
	--Extended Mag
	self.parts.wpn_fps_pis_holt_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_holt_m_extended.supported = true
	self.parts.wpn_fps_pis_holt_m_extended.stats = {
		extra_ammo = 5,
		value = 2,
		concealment = -1,
		reload = -1
	}
	
	--Override Table
	self.wpn_fps_pis_holt.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_holt.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}	

	table.insert(self.wpn_fps_pis_holt.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_holt.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	
	self.wpn_fps_pis_holt_npc.override = deep_clone(self.wpn_fps_pis_holt.override)	
	self.wpn_fps_pis_holt_npc.uses_parts = deep_clone(self.wpn_fps_pis_holt.uses_parts)			

end)

--Akimbo Holt 9mm
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_holt", "resmod_x_holt", function(self)
	
	--Override Table
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_holt_m_extended = {
		supported = true,
		stats = {
			extra_ammo = 10,
			value = 2,
			concealment = -1,
			reload = -1
		}
	}	
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_g18c_co_comp_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_x_holt.override.wpn_fps_pis_g18c_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}	

	table.insert(self.wpn_fps_pis_x_holt.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")	

	table.insert(self.wpn_fps_pis_x_holt.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_holt_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	
	
	self.wpn_fps_pis_x_holt_npc.override = deep_clone(self.wpn_fps_pis_x_holt.override)	
	self.wpn_fps_pis_x_holt_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_holt.uses_parts)			

end)

--ATW Mods
Hooks:PostHook(WeaponFactoryTweakData, "_init_atw_mod", "resmod_atw_mod", function(self)
	
	--B-Team Stock
	self.parts.wpn_fps_ass_m14_body_ruger.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_m14_body_ruger.supported = true
	self.parts.wpn_fps_ass_m14_body_ruger.stats = {
		concealment = 4,
		recoil = -6,
		spread = -1,
		value = 7
	}
	self.parts.wpn_fps_ass_m14_body_ruger.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.9
	}

end)


--M60
Hooks:PostHook(WeaponFactoryTweakData, "_init_m60", "resmod_m60", function(self)

	--Short Barrel
	self.parts.wpn_fps_lmg_m60_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_b_short.supported = true
	self.parts.wpn_fps_lmg_m60_b_short.stats = {
		spread = -1,
		concealment = 1,
		value = 3
	}
	self.parts.wpn_fps_lmg_m60_b_short.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}
	
	--Tactical Foregrip
	self.parts.wpn_fps_lmg_m60_fg_tactical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_tactical.supported = true
	self.parts.wpn_fps_lmg_m60_fg_tactical.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}
	
	--Tropical Foregrip
	self.parts.wpn_fps_lmg_m60_fg_tropical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_tropical.supported = true
	self.parts.wpn_fps_lmg_m60_fg_tropical.stats = {
		value = 3,
		concealment = 1,
		spread = -1
	}

	--Modern Foregrip
	self.parts.wpn_fps_lmg_m60_fg_keymod.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_m60_fg_keymod.supported = true
	self.parts.wpn_fps_lmg_m60_fg_keymod.stats = {
		spread = 1,
		concealment = -1,
		value = 5
	}


	self.parts.wpn_fps_lmg_m60_sight_standard = deep_clone(self.parts.wpn_fps_lmg_m60_body_standard)	
	self.parts.wpn_fps_lmg_m60_sight_standard.adds = nil
	self.parts.wpn_fps_lmg_m60_sight_standard.visibility = {
		{
			objects = {
				g_stock = false,
				g_grip = false,
				g_lower = false,
			}
		}
	}
	
	self.parts.wpn_fps_lmg_m60_body_standard.adds = { "wpn_fps_lmg_m60_sight_standard" }
	self.parts.wpn_fps_lmg_m60_body_standard.visibility = {
		{
			objects = {
				g_sight = false,
			}
		}
	}

	--M60 Part Additions
	self.wpn_fps_lmg_m60.adds = { 
		wpn_fps_upg_o_specter = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_aimpoint = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_docter = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_eotech = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_t1micro = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_cmore = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_acog = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_cs = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_eotech_xps = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_reflex = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_rx01 = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_rx30 = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_uh = { "wpn_fps_ass_groza_o_adapter" },
		wpn_fps_upg_o_fc1 = { "wpn_fps_ass_groza_o_adapter" }
	}

	self.wpn_fps_lmg_m60.override = {
		wpn_fps_upg_o_specter = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_sig" }
		},
		wpn_fps_upg_o_aimpoint = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_sig" }
		},
		wpn_fps_upg_o_docter = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_eotech = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_t1micro = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_cmore = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_aimpoint_2 = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_sig" }
		},
		wpn_fps_upg_o_cs = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_sig" }
		},
		wpn_fps_upg_o_rx30 = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_rx01 = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_reflex = {
			parent = "upper_reciever",				
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_eotech_xps = {
			parent = "upper_reciever",		
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_uh = {
			parent = "upper_reciever",		
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_upg_o_fc1 = {
			parent = "upper_reciever",
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		},
		wpn_fps_ass_groza_o_adapter = {
			parent = "upper_reciever",
			forbids = { "wpn_fps_lmg_m60_sight_standard" }
		}
	}
	
	--[
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_specter")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_specter")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_aimpoint")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_aimpoint")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_docter")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_docter")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_eotech")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_eotech")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_t1micro")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_t1micro")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_cmore")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_cmore")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_aimpoint_2")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_aimpoint_2")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_cs")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_cs")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_rx30")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_rx30")	

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_rx01")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_rx01")		
	
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_reflex")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_reflex")		
	
	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_eotech_xps")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_eotech_xps")

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_uh")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_uh")		

	table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_fc1")
	table.insert(self.wpn_fps_lmg_m60_npc.uses_parts, "wpn_fps_upg_o_fc1")		
	
	--]]
		
	self.wpn_fps_lmg_m60_npc.override = deep_clone(self.wpn_fps_lmg_m60.override)			
	self.wpn_fps_lmg_m60_npc.uses_parts = deep_clone(self.wpn_fps_lmg_m60.uses_parts)			

end)

--R700
Hooks:PostHook(WeaponFactoryTweakData, "_init_r700", "resmod_r700", function(self)

	--Short Barrel
	self.parts.wpn_fps_snp_r700_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_r700_b_short.supported = true
	self.parts.wpn_fps_snp_r700_b_short.stats = deep_clone(barrels.short_b3_stats)
	self.parts.wpn_fps_snp_r700_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

	--Sniper Suppressor
	self.parts.wpn_fps_snp_r700_b_medium.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_snp_r700_b_medium.supported = true
	self.parts.wpn_fps_snp_r700_b_medium.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_r700_b_medium.perks = {"silencer"}
	self.parts.wpn_fps_snp_r700_b_medium.has_description = true
	self.parts.wpn_fps_snp_r700_b_medium.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_r700_b_medium.override = {
		wpn_fps_bow_ecp_o_iron = {
			unit = "units/pd2_dlc_tng/weapons/wpn_fps_gre_arbiter_pts/wpn_fps_gre_arbiter_o_standard", 
			third_unit = "units/pd2_dlc_tng/weapons/wpn_third_gre_arbiter_pts/wpn_third_gre_arbiter_o_standard",
			stance_mod = {
				wpn_fps_snp_r700 = { translation = Vector3(0, -8, -2.9) }
			}
		}
	}

	--Tactical Body
	self.parts.wpn_fps_snp_r700_s_tactical.pcs = {
		10,
		20,
		30,
		40		
	}
	self.parts.wpn_fps_snp_r700_s_tactical.supported = true
	self.parts.wpn_fps_snp_r700_s_tactical.stats = {
		value = 2,
		recoil = 2,
		concealment = -1
	}
	self.parts.wpn_fps_snp_r700_s_tactical.override = {}
	self.parts.wpn_fps_snp_r700_s_tactical.override.wpn_fps_snp_model70_iron_sight = {
		adds = {"wpn_fps_m4_uupg_o_flipup"},
		stance_mod = {
			wpn_fps_snp_r700 = { translation = Vector3(0, -8, -3.22) }
		}
	}	
	
	--Military Stock
	self.parts.wpn_fps_snp_r700_s_military.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_r700_s_military.supported = true
	self.parts.wpn_fps_snp_r700_s_military.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 5
	}
	self.parts.wpn_fps_snp_r700_s_military.override = {}
	self.parts.wpn_fps_snp_r700_s_military.override.wpn_fps_snp_model70_iron_sight = {
		adds = {"wpn_fps_bow_ecp_o_iron"}
	}		
	
	--Default Wood Body
	self.parts.wpn_fps_snp_r700_s_standard.override = {}
	self.parts.wpn_fps_snp_r700_s_standard.override.wpn_fps_snp_model70_iron_sight = {
		adds = {"wpn_fps_bow_ecp_o_iron"}
	}
	
	--Override Table
	self.wpn_fps_snp_r700.override = {}
	self.wpn_fps_snp_r700.override.wpn_fps_upg_o_acog = {
		desc_id = "bm_wp_upg_o_4_cod",
		stats = {
			value = 8,
			zoom = 30,
			damage = 30,
			recoil = -6,
			concealment = -3,
			total_ammo_mod = -25,
			suppression = -1
		},
		custom_stats = {
			rof_mult = 0.7647058,
			ammo_pickup_max_mul = 0.675,
			ammo_pickup_min_mul = 0.675,
			alt_ammo_pickup_max_mul = 0.675,
			alt_ammo_pickup_min_mul = 0.675
		}
	}

	self.wpn_fps_snp_r700.adds.wpn_fps_snp_model70_iron_sight = {
		"wpn_fps_snp_r700_o_rail"
	}

	table.insert(self.wpn_fps_snp_r700.uses_parts, "wpn_fps_snp_model70_iron_sight")
	table.insert(self.wpn_fps_snp_r700_npc.uses_parts, "wpn_fps_snp_model70_iron_sight")			
	
	self.wpn_fps_snp_r700_npc.override = deep_clone(self.wpn_fps_snp_r700.override)	
	self.wpn_fps_snp_r700_npc.uses_parts = deep_clone(self.wpn_fps_snp_r700.uses_parts)		

end)


--Bernetti Rangerhitter
Hooks:PostHook(WeaponFactoryTweakData, "_init_sbl", "resmod_sbl", function(self)

	self.parts.wpn_fps_snp_sbl_body_standard.forbids = { "wpn_fps_addon_ris" }

	--BIG Barrel
	self.parts.wpn_fps_snp_sbl_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_sbl_b_long.supported = true
	self.parts.wpn_fps_snp_sbl_b_long.stats = {
		value = 5,
		extra_ammo = -1,
		spread = 1
	}
	self.parts.wpn_fps_snp_sbl_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075
	}		
	
	--Sniper Suppressor
	self.parts.wpn_fps_snp_sbl_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_snp_sbl_b_short.supported = true
	self.parts.wpn_fps_snp_sbl_b_short.has_description = true
	self.parts.wpn_fps_snp_sbl_b_short.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_sbl_b_short.stats = {
		value = 2,
		extra_ammo = -1,
		concealment = 1,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_sbl_b_short.perks = {"silencer"}
	
	--Club Stock
	self.parts.wpn_fps_snp_sbl_s_saddle.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_sbl_s_saddle.supported = true
	self.parts.wpn_fps_snp_sbl_s_saddle.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	--Iron Sights (Still basically the same as ours)
	self.parts.wpn_fps_snp_sbl_o_standard.supported = true
	self.parts.wpn_fps_snp_sbl_o_standard.stats = {
		value = 1
	}	
	
	--Override Table
	self.wpn_fps_snp_sbl.override = {}
	self.wpn_fps_snp_sbl.adds = {}
			
	self.wpn_fps_snp_sbl_npc.override = deep_clone(self.wpn_fps_snp_sbl.override)	
	self.wpn_fps_snp_sbl_npc.uses_parts = deep_clone(self.wpn_fps_snp_sbl.uses_parts)		

end)

--Frenchman Model 87
Hooks:PostHook(WeaponFactoryTweakData, "_init_model3", "resmod_model3", function(self)

	--Short Barrel
	self.parts.wpn_fps_pis_model3_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_pis_model3_b_short.supported = true
	self.parts.wpn_fps_pis_model3_b_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}
	self.parts.wpn_fps_pis_model3_b_short.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}		

	--Long barrel
	self.parts.wpn_fps_pis_model3_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_model3_b_long.supported = true
	self.parts.wpn_fps_pis_model3_b_long.stats = {
		value = 5,
		concealment = -1,
		spread = 1
	}
	self.parts.wpn_fps_pis_model3_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}	
		
	--Bling Grip
	self.parts.wpn_fps_pis_model3_g_bling.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_model3_g_bling.supported = true
	self.parts.wpn_fps_pis_model3_g_bling.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}
	
end)

--Akimbo Frenchman Model 87
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_model3", "resmod_x_model3", function(self)

--Nothing!

end)

--Reinfeld 88
Hooks:PostHook(WeaponFactoryTweakData, "_init_m1897", "resmod_m1897", function(self)

	--Short Barrel
	self.parts.wpn_fps_shot_m1897_b_short.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_shot_m1897_b_short.supported = true
	self.parts.wpn_fps_shot_m1897_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_shot_m1897_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
	
	--Long barrel
	self.parts.wpn_fps_shot_m1897_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m1897_b_long.supported = true
	self.parts.wpn_fps_shot_m1897_b_long.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_shot_m1897_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)
	
	--Short Stock
	self.parts.wpn_fps_shot_m1897_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_shot_m1897_s_short.supported = true
	self.parts.wpn_fps_shot_m1897_s_short.stats = deep_clone(stocks.remove_fixed_stats)
	self.parts.wpn_fps_shot_m1897_s_short.custom_stats = deep_clone(stocks.remove_fixed_stats)

	--Override Table
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_slug = a_slug_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_custom = a_custom_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_custom_free = a_custom_pump_override	
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_explosive = a_explosive_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_rip = a_rip_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_piercing = a_piercing_pump_override
	self.wpn_fps_shot_m1897.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override		

end)

--Crosskill Chunky Compact
--Totally not confusing
Hooks:PostHook(WeaponFactoryTweakData, "_init_m1911", "resmod_m1911", function(self)

	--Extended magazine
	self.parts.wpn_fps_pis_m1911_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_m1911_m_extended.supported = true
	self.parts.wpn_fps_pis_m1911_m_extended.stats = {
		value = 3,
		concealment = -1,
		extra_ammo = 3,
		reload = -1
	}
	self.parts.wpn_fps_pis_m1911_m_extended.custom_stats = {
		ads_speed_mult = 0.975
	}
	
	--Crosskill Platinum Bull Slide
	self.parts.wpn_fps_pis_m1911_sl_match.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_m1911_sl_match.supported = true
	self.parts.wpn_fps_pis_m1911_sl_match.stats = {
		value = 5,
		recoil = 2,
		concealment = -1
	}
	
	--Chunky Hunter Slide
	self.parts.wpn_fps_pis_m1911_sl_hardballer.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_m1911_sl_hardballer.supported = true
	self.parts.wpn_fps_pis_m1911_sl_hardballer.stats = deep_clone(barrels.long_b3_stats)
	self.parts.wpn_fps_pis_m1911_sl_hardballer.custom_stats = deep_clone(barrels.long_b3_custom_stats)		
	
	self.wpn_fps_pis_m1911.override.wpn_fps_pis_1911_co_1 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
	self.wpn_fps_pis_m1911.override.wpn_fps_pis_1911_co_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}
		
	table.insert(self.wpn_fps_pis_m1911.uses_parts, "wpn_fps_pis_1911_co_1")
	table.insert(self.wpn_fps_pis_m1911_npc.uses_parts, "wpn_fps_pis_1911_co_1")	

	table.insert(self.wpn_fps_pis_m1911.uses_parts, "wpn_fps_pis_1911_co_2")
	table.insert(self.wpn_fps_pis_m1911_npc.uses_parts, "wpn_fps_pis_1911_co_2")	

	self.wpn_fps_pis_m1911_npc.override = deep_clone(self.wpn_fps_pis_m1911.override)
	self.wpn_fps_pis_m1911_npc.uses_parts = deep_clone(self.wpn_fps_pis_m1911.uses_parts)	

end)

--Mosconi 12G Tactical Shotgun
Hooks:PostHook(WeaponFactoryTweakData, "_init_m590", "resmod_m590", function(self)

	--Suppressed Barrel
	self.parts.wpn_fps_sho_m590_b_suppressor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_m590_b_suppressor.supported = true
	self.parts.wpn_fps_sho_m590_b_suppressor.has_description = true
	self.parts.wpn_fps_sho_m590_b_suppressor.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_sho_m590_b_suppressor.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_sho_m590_b_suppressor.perks = {
		"silencer"
	}
	
	--Long Barrel
	self.parts.wpn_fps_sho_m590_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_m590_b_long.supported = true
	self.parts.wpn_fps_sho_m590_b_long.stats = {
		spread = 1,
		extra_ammo = 1,
		value = 6,
		concealment = -2
	}
	self.parts.wpn_fps_sho_m590_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.05,
	}
	
	--CE Rail Stabilizer
	self.parts.wpn_fps_sho_m590_body_rail.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_m590_body_rail.supported = true
	self.parts.wpn_fps_sho_m590_body_rail.stats = {
		recoil = 2,
		value = 2,
		concealment = -1
	}	
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod = { 
		wpn_fps_sho_m590 = {
			translation = Vector3(-0.156, 9.6, -4.42)
		}
	}
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_aimpoint.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_aimpoint_2.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_aimpoint.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_cs.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_aimpoint.stance_mod)

	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_docter.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_cmore.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_reflex.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_rx01.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_docter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_rx30.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_docter.stance_mod)

	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_t1micro.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_tf90.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_t1micro.stance_mod)

	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_eotech.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_eotech_xps.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_uh.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_eotech.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_fc1.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_eotech.stance_mod)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_sho_m590_body_rail.override[ part_id ].stance_mod) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_spot.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_poe.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_acog.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_acog.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_bmg.stance_mod = deep_clone(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_specter.stance_mod)
	for i, weap in pairs(self.parts.wpn_fps_sho_m590_body_rail.override.wpn_fps_upg_o_bmg.stance_mod) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end

	--Override Table
	self.wpn_fps_sho_m590.override = {
		wpn_fps_upg_a_slug = a_slug_pump_override,
		wpn_fps_upg_a_custom = a_custom_pump_override,	
		wpn_fps_upg_a_custom_free = a_custom_pump_override,			
		wpn_fps_upg_a_explosive = a_explosive_pump_override,
		wpn_fps_upg_a_rip = a_rip_pump_override,
		wpn_fps_upg_a_piercing = a_piercing_pump_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
	}

	self.wpn_fps_sho_m590.override.wpn_fps_addon_ris = {
		unit = "units/payday2/weapons/wpn_fps_shot_r870_pts/wpn_fps_shot_r870_gadget_rail"
	}

end)

--AK Gen 21 Tactical SMG
Hooks:PostHook(WeaponFactoryTweakData, "_init_vityaz", "resmod_vityaz", function(self)

	--Suppressed Barrel
	self.parts.wpn_fps_smg_vityaz_b_supressed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_vityaz_b_supressed.supported = true
	self.parts.wpn_fps_smg_vityaz_b_supressed.has_description = true
	self.parts.wpn_fps_smg_vityaz_b_supressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_smg_vityaz_b_supressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_smg_vityaz_b_supressed.perks = {
		"silencer"
	}
	table.insert(self.parts.wpn_fps_smg_vityaz_b_supressed.forbids, "wpn_fps_upg_ns_ass_pbs1")

	--Long Barrel
	self.parts.wpn_fps_smg_vityaz_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_vityaz_b_long.supported = true
	self.parts.wpn_fps_smg_vityaz_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_smg_vityaz_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
	
	--Short Stock
	self.parts.wpn_fps_smg_vityaz_s_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_vityaz_s_short.supported = true
	self.parts.wpn_fps_smg_vityaz_s_short.stats = deep_clone(stocks.remove_folder_stats)		
	self.parts.wpn_fps_smg_vityaz_s_short.custom_stats = deep_clone(stocks.remove_folder_stats)		
	
end)

--Miyaka 10
Hooks:PostHook(WeaponFactoryTweakData, "_init_pm9", "resmod_pm9", function(self)

	--Quick Pull
	self.parts.wpn_fps_smg_pm9_m_quick.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_pm9_m_quick.supported = true
	self.parts.wpn_fps_smg_pm9_m_quick.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	--Short Barrel
	self.parts.wpn_fps_smg_pm9_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_pm9_b_short.supported = true
	self.parts.wpn_fps_smg_pm9_b_short.stats = deep_clone(barrels.short_b1_stats)
	self.parts.wpn_fps_smg_pm9_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)		
	
	--Wood Grip
	self.parts.wpn_fps_smg_pm9_g_wood.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_pm9_g_wood.supported = true
	self.parts.wpn_fps_smg_pm9_g_wood.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}	
	
	--Tac Stock
	self.parts.wpn_fps_smg_pm9_s_tactical.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_pm9_s_tactical.supported = true
	self.parts.wpn_fps_smg_pm9_s_tactical.stats = deep_clone(stocks.add_fixed_stats)	
	self.parts.wpn_fps_smg_pm9_s_tactical.custom_stats = deep_clone(stocks.add_fixed_stats)	
		
end)

--Kang Arms X1
Hooks:PostHook(WeaponFactoryTweakData, "_init_qbu88", "resmod_qbu88", function(self)

	--Short Barrel
	self.parts.wpn_fps_snp_qbu88_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_qbu88_b_short.supported = true
	self.parts.wpn_fps_snp_qbu88_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_snp_qbu88_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
	
	--Long Barrel
	self.parts.wpn_fps_snp_qbu88_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_qbu88_b_long.supported = true
	self.parts.wpn_fps_snp_qbu88_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_snp_qbu88_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
		
	--Extended Mag
	self.parts.wpn_fps_snp_qbu88_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_qbu88_m_extended.supported = true
	self.parts.wpn_fps_snp_qbu88_m_extended.stats = {
		value = 2,
		extra_ammo = 10,
		reload = -4,
		concealment = -2
	}
	self.parts.wpn_fps_snp_qbu88_m_extended.custom_stats = {
		ads_speed_mult = 1.05
	}
	
	--Iron Sight
	self.parts.wpn_fps_snp_qbu88_o_standard.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_qbu88_o_standard.supported = true
	self.parts.wpn_fps_snp_qbu88_o_standard.stats = {
		value = 0
	}		

end)

--Byk-1 
Hooks:PostHook(WeaponFactoryTweakData, "_init_groza", "resmod_groza", function(self)

	--Suppressed Barrel
	self.parts.wpn_fps_ass_groza_b_supressor.pcs = {
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_groza_b_supressor.supported = true
	self.parts.wpn_fps_ass_groza_b_supressor.has_description = true
	self.parts.wpn_fps_ass_groza_b_supressor.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_ass_groza_b_supressor.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_ass_groza_b_supressor.perks = {"silencer"}
	
	--Quick Pull
	if SystemFS:exists("assets/mod_overrides/AK Correct Magpul Assist Mags") then
		self.parts.wpn_fps_ass_groza_m_speed.unit = "units/mods/weapons/wpn_fps_ass_akm_m_magpul/wpn_fps_ass_akm_m_magpul"
	else
		self.parts.wpn_fps_ass_groza_m_speed.unit = "units/pd2_dlc_tng/weapons/wpn_fps_ass_ak_m_quick/wpn_fps_upg_ak_m_quick"
	end
	self.parts.wpn_fps_ass_groza_m_speed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_groza_m_speed.supported = true
	self.parts.wpn_fps_ass_groza_m_speed.has_description = true
	self.parts.wpn_fps_ass_groza_m_speed.desc_id = "empty"
	self.parts.wpn_fps_ass_groza_m_speed.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	--Default Mag
	self.parts.wpn_fps_ass_groza_m_standard.unit = "units/payday2/weapons/wpn_fps_upg_ak_reusable/wpn_upg_ak_m_akm"

	self.wpn_fps_ass_groza.override = self.wpn_fps_ass_groza.override or {}

	self.wpn_fps_ass_groza.override.wpn_lmg_rpk_m_ban = {
		stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		},
		custom_stats = { ads_speed_mult = 1.05 }
	}

	table.insert(self.wpn_fps_ass_groza.uses_parts, "wpn_fps_upg_ak_m_uspalm")
	table.insert(self.wpn_fps_ass_groza.uses_parts, "wpn_fps_upg_ak_m_quad")
	table.insert(self.wpn_fps_ass_groza.uses_parts, "wpn_upg_ak_m_drum")
	table.insert(self.wpn_fps_ass_groza.uses_parts, "wpn_lmg_rpk_m_ban")
	
	self.wpn_fps_ass_groza_npc.uses_parts = deep_clone(self.wpn_fps_ass_groza.uses_parts)	
end)

--KS12 Urban 
Hooks:PostHook(WeaponFactoryTweakData, "_init_shak12", "resmod_shak12", function(self)

	--Reinforced Frame
	self.parts.wpn_fps_ass_shak12_body_vks.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_shak12_body_vks.supported = true
	self.parts.wpn_fps_ass_shak12_body_vks.has_description = true
	self.parts.wpn_fps_ass_shak12_body_vks.desc_id = "bm_wp_shak12_body_vks_ap_desc"
	self.parts.wpn_fps_ass_shak12_body_vks.stats = {
		value = 9,
		recoil = -14,
		reload = -2,
		concealment = -1,
	}
	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats = {
		armor_piercing_override = 1,
		can_shoot_through_shield = true,
		rof_mult = 0.666666,
		ads_speed_mult = 1.20,
		hip_mult = 1.666666,
		sms = 0.9,
		alt_desc = "bm_shak12_sc_oden_desc"
	}
	self.parts.wpn_fps_ass_shak12_body_vks.perks = nil
	
	--Carry Handle Sight
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.supported = true
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.forbids = nil
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.stats = {
		value = 0
	}
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter = {
		a_obj = "a_or",
		stance_mod = {
			wpn_fps_ass_shak12 = {
				translation = Vector3(0, -1.2, -3.2),
				rotation = Rotation(0, -0.5, 0)
			}
		}
	}
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_aimpoint = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_aimpoint_2 = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_aimpoint)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_cs = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_aimpoint)

	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_docter = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_cmore = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_docter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_reflex = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_docter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_rx01 = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_docter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_rx30 = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_docter)

	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_t1micro = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_tf90 = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_t1micro)

	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_eotech = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_eotech_xps = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_eotech)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_uh = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_eotech)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_fc1 = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_eotech)
	for i, part_id in ipairs(sight_1_5x_offset.sights) do
		for i, weap in pairs(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override[ part_id ]) do
			if weap and weap.translation then
				weap.translation = weap.translation + sight_1_5x_offset.offset
			end
		end
	end

	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_spot = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_poe = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_acog = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_acog) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,4,0)
		end
	end
	self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_bmg = deep_clone(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_specter)
	for i, weap in pairs(self.parts.wpn_fps_ass_shak12_o_carry_dummy.override.wpn_fps_upg_o_bmg) do
		if weap and weap.translation then
			weap.translation = weap.translation + Vector3(0,10,0)
		end
	end
	
	
	--Long Silencer
	self.parts.wpn_fps_ass_shak12_ns_suppressor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_shak12_ns_suppressor.supported = true
	self.parts.wpn_fps_ass_shak12_ns_suppressor.has_description = true
	self.parts.wpn_fps_ass_shak12_ns_suppressor.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_ass_shak12_ns_suppressor.stats = deep_clone(muzzle_device.supp_rec2_acc2_stats)
	self.parts.wpn_fps_ass_shak12_ns_suppressor.custom_stats= deep_clone(muzzle_device.muzzle_rec2_acc2_custom_stats)
	self.parts.wpn_fps_ass_shak12_ns_suppressor.perks = {"silencer"}

	--A Burst Muzzle
	self.parts.wpn_fps_ass_shak12_ns_muzzle.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_ass_shak12_ns_muzzle.supported = true
	self.parts.wpn_fps_ass_shak12_ns_muzzle.stats = deep_clone(muzzle_device.muzzle_rec2_acc2_stats)
	self.parts.wpn_fps_ass_shak12_ns_muzzle.custom_stats= deep_clone(muzzle_device.muzzle_rec2_acc2_custom_stats)
	--self.parts.wpn_fps_ass_shak12_ns_muzzle.custom_stats.muzzleflash = "effects/payday2/particles/weapons/50cal_auto"

	--self.parts.wpn_fps_ass_shak12_b_dummy.sound_switch = {suppressed = "regular_b"}

	self.wpn_fps_ass_shak12.override = self.wpn_fps_ass_shak12.override or {}
	self.wpn_fps_ass_shak12.forbids = {}

	table.insert(self.wpn_fps_ass_shak12.uses_parts, "wpn_fps_upg_i_singlefire")
	table.insert(self.wpn_fps_ass_shak12.uses_parts, "wpn_fps_upg_i_autofire")

	self.wpn_fps_ass_shak12_npc.forbids = deep_clone(self.wpn_fps_ass_shak12.forbids)	
	self.wpn_fps_ass_shak12_npc.uses_parts = deep_clone(self.wpn_fps_ass_shak12.uses_parts)	


end)

--Model 54
Hooks:PostHook(WeaponFactoryTweakData, "_init_type54", "resmod_type54", function(self)

	--Long Barrel
	self.parts.wpn_fps_pis_type54_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_type54_b_long.supported = true
	self.parts.wpn_fps_pis_type54_b_long.stats = {
		value = 5,
		spread = 1,
		concealment = -1
	}		
	self.parts.wpn_fps_pis_type54_b_long.custom_stats = {
		falloff_start_mult = 1.075,
		falloff_end_mult = 1.075,
		ads_speed_mult = 1.025
	}				
	
	--Extended magazine
	self.parts.wpn_fps_pis_type54_m_ext.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_type54_m_ext.supported = true
	self.parts.wpn_fps_pis_type54_m_ext.stats = {
		value = 2,
		extra_ammo = 5,
		reload = -2,
		spread = -1,
		concealment = -2
	}		
	self.parts.wpn_fps_pis_type54_m_ext.custom_stats = {
		ads_speed_mult = 1.05
	}	
	
	--Underbarrel Shotgun
	self.parts.wpn_fps_pis_type54_underbarrel.pcs = {}
	self.parts.wpn_fps_pis_type54_underbarrel.supported = true
	self.parts.wpn_fps_pis_type54_underbarrel.stats = {
		value = 8,
		total_ammo_mod = -25, 
		concealment = -4
	}		
	
	--Overrides for Glock comps
	self.wpn_fps_pis_type54.override.wpn_fps_pis_g18c_co_comp_2 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_type54.override.wpn_fps_pis_g18c_co_1 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
		
	table.insert(self.wpn_fps_pis_type54.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_type54_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_type54.uses_parts, "wpn_fps_pis_1911_co_1")
	table.insert(self.wpn_fps_pis_type54_npc.uses_parts, "wpn_fps_pis_1911_co_1")		
	
	self.wpn_fps_pis_type54_npc.override = deep_clone(self.wpn_fps_pis_type54.override)
	self.wpn_fps_pis_type54_npc.uses_parts = deep_clone(self.wpn_fps_pis_type54.uses_parts)		

end)

--Akimbo Model 54
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_type54", "resmod_x_type54", function(self)

	--Underbarrel Shotgun
	self.parts.wpn_fps_pis_x_type54_underbarrel.pcs = {}
	self.parts.wpn_fps_pis_x_type54_underbarrel.supported = true
	self.parts.wpn_fps_pis_x_type54_underbarrel.stats = {
		value = 8,
		total_ammo_mod = -25, 
		concealment = -4
	}	

	--Overrides for Glock comps
	self.wpn_fps_pis_x_type54.override.wpn_fps_pis_g18c_co_comp_2 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_x_type54.override.wpn_fps_pis_g18c_co_1 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_x_type54.override.wpn_fps_pis_type54_m_ext = {
		stats = {
			value = 2,
			extra_ammo = 10,
			reload = -2,
			spread = -1,
			concealment = -2
		},
		supported = true
	}	
		
	table.insert(self.wpn_fps_pis_x_type54.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_type54_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_x_type54.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_x_type54_npc.uses_parts, "wpn_fps_pis_g18c_co_1")		
	
	self.wpn_fps_pis_x_type54_npc.override = deep_clone(self.wpn_fps_pis_x_type54.override)	
	self.wpn_fps_pis_x_type54_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_type54.uses_parts)	

end)

--RUS-12 Angry Tiger
Hooks:PostHook(WeaponFactoryTweakData, "_init_rsh12", "resmod_rsh12", function(self)

	--Compensated Barrel
	self.parts.wpn_fps_pis_rsh12_b_comp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rsh12_b_comp.supported = true
	self.parts.wpn_fps_pis_rsh12_b_comp.stats = {
		value = 5,
		spread = 3,
		recoil = -2,
		concealment = -2
	}
	table.insert(self.parts.wpn_fps_pis_rsh12_b_comp.forbids, "wpn_fps_pis_g18c_co_1")
	table.insert(self.parts.wpn_fps_pis_rsh12_b_comp.forbids, "wpn_fps_pis_g18c_co_comp_2")
	
	--Short Barrel
	self.parts.wpn_fps_pis_rsh12_b_short.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rsh12_b_short.supported = true
	self.parts.wpn_fps_pis_rsh12_b_short.stats = {
		value = 3,
		spread = -1,
		concealment = 1
	}	
	self.parts.wpn_fps_pis_rsh12_b_short.custom_stats = {
		falloff_start_mult = 0.925,
		falloff_end_mult = 0.925,
		ads_speed_mult = 0.975
	}		
	
	--Wood Grip
	self.parts.wpn_fps_pis_rsh12_g_wood.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_rsh12_g_wood.supported = true
	self.parts.wpn_fps_pis_rsh12_g_wood.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}	
	
	--Overrides for Glock comps
	self.wpn_fps_pis_rsh12.override.wpn_fps_pis_g18c_co_comp_2 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}
	self.wpn_fps_pis_rsh12.override.wpn_fps_pis_g18c_co_1 = {
		parent = "barrel", 
		a_obj = "a_ns"
	}	
	self.wpn_fps_pis_rsh12.override.wpn_fps_upg_i_iw_hailstorm = {
		desc_id = "bm_wp_upg_i_iw_hailstorm_no_pen_desc",
		custom_stats = {
			hailstorm = true,
			falloff_start_mult = 0.2,
			falloff_end_mult = 0.4,
			rof_mult = 4.3,
			--disable_steelsight_recoil_anim = true
		},
		stats = {
			value = 10,
			reload = -4,
			spread = -4,
			recoil = -6,
			extra_ammo = 10
		}
	}	
	
	table.insert(self.wpn_fps_pis_rsh12.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_rsh12_npc.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	table.insert(self.wpn_fps_pis_rsh12.uses_parts, "wpn_fps_pis_g18c_co_1")
	table.insert(self.wpn_fps_pis_rsh12_npc.uses_parts, "wpn_fps_pis_g18c_co_1")	

	table.insert(self.wpn_fps_pis_rsh12.uses_parts, "wpn_fps_upg_i_iw_hailstorm")
	table.insert(self.wpn_fps_pis_rsh12_npc.uses_parts, "wpn_fps_upg_i_iw_hailstorm")		
	
	self.wpn_fps_pis_rsh12_npc.override = deep_clone(self.wpn_fps_pis_rsh12.override)
	self.wpn_fps_pis_rsh12_npc.uses_parts = deep_clone(self.wpn_fps_pis_rsh12.uses_parts)		

end)

--Gecko M2 (Maxim 9)
Hooks:PostHook(WeaponFactoryTweakData, "_init_maxim9", "resmod_maxim9", function(self)

	--Upshot Barrel
	self.parts.wpn_fps_pis_maxim9_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_maxim9_b_long.supported = true
	self.parts.wpn_fps_pis_maxim9_b_long.stats = deep_clone(muzzle_device.muzzle_c_duo_stats)
	self.parts.wpn_fps_pis_maxim9_b_long.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)		
	
	--Pinnacle Barrel
	self.parts.wpn_fps_pis_maxim9_b_marksman.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_pis_maxim9_b_marksman.supported = true
	self.parts.wpn_fps_pis_maxim9_b_marksman.stats = deep_clone(muzzle_device.muzzle_b_stats)

	--(Maxim-9) Extended Mag.
	self.parts.wpn_fps_pis_maxim9_m_ext.pcs = {
		10,
		20,
		30, 
		40
	}
	self.parts.wpn_fps_pis_maxim9_m_ext.supported = true
	self.parts.wpn_fps_pis_maxim9_m_ext.stats = {
		value = 6,
		extra_ammo = 15,
		concealment = -1,
		reload = -2
	}	
	self.parts.wpn_fps_pis_maxim9_m_ext.custom_stats = {
		ads_speed_mult = 1.05
	}		
	
	--Maxim Default body, added to add unique ammo type
	self.parts.wpn_fps_pis_maxim9_body_upper.adds = {
		"wpn_fps_pis_maxim9_a_tranq"
	}
	
	--Tranq Rounds
	self.parts.wpn_fps_pis_maxim9_a_tranq = {
		a_obj = "a_body",
		type = "ammo",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		internal_part = true,
		supported = true,
		name_id = "bm_wp_upg_a_tranq",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		stats = {
			value = 0
		},
		custom_stats = {
			bullet_class = "PoisonBulletBase",
			trail_effect = "_dmc/effects/warsaw_trail",
			dot_data = { 
				type = "poison",
				custom_data = {
					dot_damage = 1.5,
					dot_length = 2.1,
					dot_tick_period = 0.5,
					hurt_animation_chance = 0.2
				}
			}
		}
	}	
		
	self.wpn_fps_pis_maxim9.uses_parts[12] = "resmod_dummy"
	self.wpn_fps_pis_maxim9.uses_parts[15] = "resmod_dummy"
	self.wpn_fps_pis_maxim9.uses_parts[16] = "resmod_dummy"
	
	table.insert(self.wpn_fps_pis_maxim9.uses_parts, "wpn_fps_pis_maxim9_a_tranq")
	table.insert(self.wpn_fps_pis_maxim9_npc.uses_parts, "wpn_fps_pis_maxim9_a_tranq")		
	
	self.wpn_fps_pis_maxim9_npc.uses_parts = deep_clone(self.wpn_fps_pis_maxim9.uses_parts)
	
end)

--Akimbo Gecko M2 (Akimbo Maxim 9)
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_maxim9", "resmod_x_maxim9", function(self)

	--Override
	self.wpn_fps_pis_x_maxim9.override.wpn_fps_pis_maxim9_m_ext = {
		stats = {
			value = 6,
			extra_ammo = 30,
			concealment = -1,
			reload = -2
		}
	}
	
	self.wpn_fps_pis_x_maxim9.uses_parts[11] = "resmod_dummy"
	self.wpn_fps_pis_x_maxim9.uses_parts[14] = "resmod_dummy"
	self.wpn_fps_pis_x_maxim9.uses_parts[15] = "resmod_dummy"
	
	table.insert(self.wpn_fps_pis_x_maxim9.uses_parts, "wpn_fps_pis_maxim9_a_tranq")
	table.insert(self.wpn_fps_pis_x_maxim9_npc.uses_parts, "wpn_fps_pis_maxim9_a_tranq")			
	
	self.wpn_fps_pis_x_maxim9_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_maxim9.uses_parts)	

end)

--Argos III (Ultima)
Hooks:PostHook(WeaponFactoryTweakData, "_init_ultima", "resmod_ultima", function(self)

	--Try-Core Compensator
	self.parts.wpn_fps_sho_ultima_ns_comp.pcs = {
		10,
		20,
		30,
		40	
	}
	self.parts.wpn_fps_sho_ultima_ns_comp.desc_id = "bm_wp_ns_ultima_desc_sc"
	self.parts.wpn_fps_sho_ultima_ns_comp.has_description = true
	self.parts.wpn_fps_sho_ultima_ns_comp.supported = true
	self.parts.wpn_fps_sho_ultima_ns_comp.stats = {
		value = 5,
		spread_multi = {1.75, 1.75}
	}
	self.parts.wpn_fps_sho_ultima_ns_comp.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}
	
	--Flak Frame Null Stock
	self.parts.wpn_fps_sho_ultima_s_light.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_ultima_s_light.supported = true
	self.parts.wpn_fps_sho_ultima_s_light.stats = deep_clone(stocks.add_nocheeks_stats)
	self.parts.wpn_fps_sho_ultima_s_light.custom_stats = deep_clone(stocks.add_nocheeks_stats)
	
	--Shellswitch M8 (Quick Pull)
	self.parts.wpn_fps_sho_ultima_body_rack.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_ultima_body_rack.supported = true
	self.parts.wpn_fps_sho_ultima_body_rack.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	self.parts.wpn_fps_sho_ultima_body_rack.custom_stats = {
		falloff_start_mult = 1,
		falloff_end_mult = 1
	}	
	
	--Triple Tech Threat (Ultima Exclusive Kit)
	self.parts.wpn_fps_sho_ultima_body_kit.supported = true
	self.parts.wpn_fps_sho_ultima_body_kit.has_description = true
	self.parts.wpn_fps_sho_ultima_body_kit.desc_id = "bm_wp_upg_ultima_body_kit_desc_sc"
	self.parts.wpn_fps_sho_ultima_body_kit.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_sho_ultima_body_kit.stats = {
		value = 4
	}
	self.parts.wpn_fps_sho_ultima_body_kit.forbids = {
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_fl_ass_smg_sho_surefire",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_fl_ass_laser",
		"wpn_fps_upg_fl_ass_utg"
	}
	self.parts.wpn_fps_sho_ultima_body_kit.override = {
		wpn_fps_sho_ultima_body_rack = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		wpn_fps_sho_ultima_fg_standard = {
			third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_third_sho_ultima_fg_kit",
			unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_fps_sho_ultima_fg_kit"
		},
		wpn_fps_sho_ultima_body_standard = {
			third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_third_sho_ultima_body_kit",
			unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_fps_sho_ultima_body_kit"
		},
		wpn_fps_sho_ultima_b_standard = {
			third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_third_sho_ultima_b_kit",
			unit = "units/pd2_dlc_lawp/weapons/wpn_fps_shot_ultima_pts/wpn_fps_sho_ultima_b_kit"
		}
	}
	
	--Override Table
	self.wpn_fps_sho_ultima.override = {
		wpn_fps_upg_a_slug = a_slug_semi_override,
		wpn_fps_upg_a_custom = a_custom_semi_override,
		wpn_fps_upg_a_custom_free = a_custom_semi_override,			
		wpn_fps_upg_a_explosive = a_explosive_semi_override,
		wpn_fps_upg_a_rip = a_rip_semi_override,
		wpn_fps_upg_a_piercing = a_piercing_semi_override,
		wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override			
	}		

end)

--Wasp-DS (FMG-9)
Hooks:PostHook(WeaponFactoryTweakData, "_init_fmg9", "resmod_fmg9", function(self)

	--Rake Grip
	self.parts.wpn_fps_smg_fmg9_grip_tape.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_fmg9_grip_tape.supported = true
	self.parts.wpn_fps_smg_fmg9_grip_tape.stats = {
		value = 5,
		concealment = -1,
		spread = 1
	}
	
	--Bounce Slate RX Stock
	self.parts.wpn_fps_smg_fmg9_stock_padded.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_fmg9_stock_padded.supported = true
	self.parts.wpn_fps_smg_fmg9_stock_padded.stats = {
		value = 2,
		concealment = -1,
		recoil = 2
	}	
	
	--Celerity X9 Mag
	self.parts.wpn_fps_smg_fmg9_m_speed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_smg_fmg9_m_speed.supported = true
	self.parts.wpn_fps_smg_fmg9_m_speed.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}
	
	--Whisper 9 Silencer (Exclusive kit)
	self.parts.wpn_fps_smg_fmg9_conversion.pcs = {}
	self.parts.wpn_fps_smg_fmg9_conversion.has_description = true
	self.parts.wpn_fps_smg_fmg9_conversion.desc_id = "bm_wp_upg_fmg9_conversion_desc_sc"
	self.parts.wpn_fps_smg_fmg9_conversion.unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_fps_smg_fmg9_conversion"
	self.parts.wpn_fps_smg_fmg9_conversion.third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_third_smg_fmg9_conversion"
	self.parts.wpn_fps_smg_fmg9_conversion.adds = {
		"wpn_fps_smg_fmg9_conversion_display_dummy",
		"wpn_fps_smg_fmg9_conversion_laser_dummy",
		"wpn_fps_smg_fmg9_b_dummy"
	}
	self.parts.wpn_fps_smg_fmg9_conversion.sound_switch = nil
	self.parts.wpn_fps_smg_fmg9_conversion.forbids = {
		"wpn_fps_smg_fmg9_o_sight"
	}
	self.parts.wpn_fps_smg_fmg9_conversion.supported = true
	self.parts.wpn_fps_smg_fmg9_conversion.stats = {
		value = 4
	}	
	self.parts.wpn_fps_smg_fmg9_conversion.perks = nil
	self.parts.wpn_fps_smg_fmg9_conversion.override = {		
		--Hiding Barrel Extensions
		wpn_fps_upg_ns_ass_smg_small = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		wpn_fps_upg_ns_ass_smg_medium = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_upg_ns_ass_smg_large = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},	
		wpn_fps_upg_ns_ass_smg_stubby = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		wpn_fps_upg_ns_ass_smg_tank = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},	
		wpn_fps_upg_ns_ass_smg_firepig = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		wpn_fps_upg_ass_ns_surefire = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		wpn_fps_upg_ass_ns_jprifles = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},	
		wpn_fps_upg_ass_ns_linear = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},	
		wpn_fps_upg_ass_ns_battle = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},	
		wpn_fps_upg_ns_pis_putnik = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},		
		--Hiding Gadgets
		wpn_fps_upg_fl_pis_perst = {
			third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser",
			unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser"
		},	
		wpn_fps_upg_fl_pis_laser = {
			third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser",
			unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			third_unit = "units/payday2/weapons/wpn_third_upg_fl_pis_laser/wpn_third_upg_fl_pis_laser",
			unit = "units/payday2/weapons/wpn_fps_upg_fl_pis_laser/wpn_fps_upg_fl_pis_laser"
		},		
		--Body Replacements
		wpn_fps_smg_fmg9_body = {
			third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_third_smg_fmg9_body",
			unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_fps_smg_fmg9_body_conversion"
		},
		wpn_fps_smg_fmg9_dh = {
			third_unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_third_smg_fmg9_dh",
			unit = "units/pd2_dlc_lawp/weapons/wpn_fps_smg_fmg9_pts/wpn_fps_smg_fmg9_dh_conversion"
		}		
	}	
	
	--Medved R4 Suppressor, re-enabled :^)
	self.parts.wpn_fps_upg_ns_pis_putnik.desc_id = "bm_sc_blank"
	self.parts.wpn_fps_upg_ns_pis_putnik.pcs = {
		10,	
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_ns_pis_putnik.supported = true
	self.parts.wpn_fps_upg_ns_pis_putnik.has_description = true
	self.parts.wpn_fps_upg_ns_pis_putnik.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_upg_ns_pis_putnik.perks = {
		"silencer"
	}
	self.parts.wpn_fps_upg_ns_pis_putnik.stats = deep_clone(muzzle_device.supp_rec2_stats)
	self.parts.wpn_fps_upg_ns_pis_putnik.custom_stats = deep_clone(muzzle_device.muzzle_rec2_custom_stats)
		
	--Medved R4 Laser Sight
	self.parts.wpn_fps_upg_fl_pis_perst.pcs = {
		10,	
		20,
		30,
		40
	}
	self.parts.wpn_fps_upg_fl_pis_perst.supported = true
	self.parts.wpn_fps_upg_fl_pis_perst.stats = {
		value = 4
	}
	
end)

--Versteckt-51
Hooks:PostHook(WeaponFactoryTweakData, "_init_hk51b", "resmod_hk51b", function(self)

	--Kalt Barrel
	self.parts.wpn_fps_lmg_hk51b_b_fluted.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk51b_b_fluted.supported = true
	self.parts.wpn_fps_lmg_hk51b_b_fluted.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_lmg_hk51b_b_fluted.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	--Schatten Fartten
	self.parts.wpn_fps_lmg_hk51b_fg_railed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk51b_fg_railed.supported = true
	self.parts.wpn_fps_lmg_hk51b_fg_railed.stats = {
		value = 6,
		recoil = -2,
		concealment = 1
	}
	
	--Zittern Stock (what a fucking stupid name YOU'RE JUST EXTENDING THE FUCKING STOCK FOR FUCKS SAKE)
	self.parts.wpn_fps_lmg_hk51b_s_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk51b_s_extended.name_id = "bm_wp_mp7_s_long" --too lazy to go into loc
	self.parts.wpn_fps_lmg_hk51b_s_extended.supported = true
	self.parts.wpn_fps_lmg_hk51b_s_extended.stats = deep_clone(stocks.unfold_nocheeks_stats)
	self.parts.wpn_fps_lmg_hk51b_s_extended.stats.value = 0
	self.parts.wpn_fps_lmg_hk51b_s_extended.custom_stats = deep_clone(stocks.unfold_nocheeks_stats)
	
	--Verdunkeln Brake
	--Tank Comp clone
	self.parts.wpn_fps_lmg_hk51b_ns_jcomp.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_lmg_hk51b_ns_jcomp.supported = true
	self.parts.wpn_fps_lmg_hk51b_ns_jcomp.stats = deep_clone(muzzle_device.muzzle_c_stats)
	self.parts.wpn_fps_lmg_hk51b_ns_jcomp.custom_stats = deep_clone(muzzle_device.muzzle_c_custom_stats)

	self.wpn_fps_lmg_hk51b.stock_adapter = "wpn_fps_sho_sko12_s_adapter"
	self.wpn_fps_lmg_hk51b_npc.stock_adapter = "wpn_fps_sho_sko12_s_adapter"

	self.wpn_fps_lmg_hk51b.override = self.wpn_fps_lmg_hk51b.override or {}

	
	self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_m4_s_standard = {
		stats = deep_clone(stocks.folded_to_adj_rec2),
		custom_stats = deep_clone(stocks.folded_to_adj_rec2)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_m4_s_pts = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_sho_sko12_stock = {
		stats = deep_clone(stocks.folded_to_adj_rec1),
		custom_stats = deep_clone(stocks.folded_to_adj_rec1)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_m4_s_crane = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_m4_s_mk46 = {
		stats = deep_clone(stocks.folded_to_adj_rec3),
		custom_stats = deep_clone(stocks.folded_to_adj_rec3)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_m4_s_ubr = {
		stats = deep_clone(stocks.folded_to_hvy_rec3),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec3)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_snp_tti_s_vltor = {
		stats = deep_clone(stocks.folded_to_hvy_rec2),
		custom_stats = deep_clone(stocks.folded_to_hvy_rec2)
	}

	self.wpn_fps_lmg_hk51b.override.wpn_fps_smg_mp5_s_ring = {
		stats = deep_clone(stocks.remove_folded_stats),
		custom_stats = deep_clone(stocks.remove_folded_stats)
	}
	self.wpn_fps_lmg_hk51b.override.wpn_fps_smg_mp5_s_folding = {
		stats = deep_clone(stocks.unfold_folded_stats),
		custom_stats = deep_clone(stocks.unfold_folded_stats)
	}

	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_smg_mp5_s_ring")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_smg_mp5_s_folding")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_m4_s_standard")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_m4_s_crane")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_m4_s_mk46")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_m4_s_ubr")
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_snp_tti_s_vltor")	
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_sho_sko12_stock")
			
	self.wpn_fps_lmg_hk51b_npc.override = deep_clone(self.wpn_fps_lmg_hk51b.override)		
	self.wpn_fps_lmg_hk51b_npc.uses_parts = deep_clone(self.wpn_fps_lmg_hk51b.uses_parts)		

end)

--Pronghorn
Hooks:PostHook(WeaponFactoryTweakData, "_init_scout", "resmod_scout", function(self)

	--Speed Bolt
	self.parts.wpn_fps_snp_scout_bolt_speed.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_bolt_speed.supported = true
	self.parts.wpn_fps_snp_scout_bolt_speed.stats = {
		value = 5,
		recoil = -6,
		spread = -3
	}
	self.parts.wpn_fps_snp_scout_bolt_speed.custom_stats = deep_clone(barrels.short_b3_custom_stats)
	self.parts.wpn_fps_snp_scout_bolt_speed.custom_stats.ads_speed_mult = 1
	self.parts.wpn_fps_snp_scout_bolt_speed.custom_stats.rof_mult = 1.18181
	
	--Longshot Suppressor
	self.parts.wpn_fps_snp_scout_ns_suppressor.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_ns_suppressor.supported = true
	self.parts.wpn_fps_snp_scout_ns_suppressor.has_description = true
	self.parts.wpn_fps_snp_scout_ns_suppressor.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_snp_scout_ns_suppressor.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_snp_scout_ns_suppressor.perks = {"silencer"}

	--Iron Sights
	self.parts.wpn_fps_snp_scout_o_iron_up.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_o_iron_up.stats = {
		value = 0
	}

	--Open Range Set
	self.parts.wpn_fps_snp_scout_conversion.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_conversion.supported = true
	self.parts.wpn_fps_snp_scout_conversion.has_description = false
	self.parts.wpn_fps_snp_scout_conversion.stats = {
		value = 0
	}

	--"Extended" mag
	self.parts.wpn_fps_snp_scout_m_extended.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_m_extended.supported = true
	self.parts.wpn_fps_snp_scout_m_extended.stats = {
		value = 2,
		spread = -1,
		concealment = -1,
		reload = 3
	}		

	--Steakout Stock
	self.parts.wpn_fps_snp_scout_s_pads_none.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_s_pads_none.supported = true
	self.parts.wpn_fps_snp_scout_s_pads_none.stats = {
		value = 0,
		spread = -1,
		recoil = -2,
		concealment = 2
	}

	--Marksman Stock
	self.parts.wpn_fps_snp_scout_s_pads_one.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_snp_scout_s_pads_one.supported = true
	self.parts.wpn_fps_snp_scout_s_pads_one.stats = {
		value = 0,
		recoil = -2,
		concealment = 1
	}

	--Irons
	self.parts.wpn_fps_snp_scout_o_iron_up.stance_mod.wpn_fps_snp_scout = {
		translation = Vector3(0.01, -12, 2.55),
		rotation = Rotation(0.05, 0, 0)
	}

end)

--Basilisk 3V
Hooks:PostHook(WeaponFactoryTweakData, "_init_ms3gl", "resmod_ms3gl", function(self)

	--Fang Barrel
	self.parts.wpn_fps_gre_ms3gl_b_long.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_ms3gl_b_long.supported = true
	self.parts.wpn_fps_gre_ms3gl_b_long.stats = {
		value = 5,
		concealment = -2,
		spread = 2
	}	

	--Copperhead Stock
	self.parts.wpn_fps_gre_ms3gl_s_modern.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_ms3gl_s_modern.supported = true
	self.parts.wpn_fps_gre_ms3gl_s_modern.stats = deep_clone(stocks.adj_to_fold_stats)
	self.parts.wpn_fps_gre_ms3gl_s_modern.custom_stats = deep_clone(stocks.adj_to_fold_stats)

	--Serpent Body
	self.parts.wpn_fps_gre_ms3gl_body_modern.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_ms3gl_body_modern.supported = true
	self.parts.wpn_fps_gre_ms3gl_body_modern.stats = {
		value = 4,
		concealment = 1,
		recoil = -2,
	}


	--Venomous Mod Set
	self.parts.wpn_fps_gre_ms3gl_conversion.pcs = {
		10,
		20,
		30,
		40
	}
	self.parts.wpn_fps_gre_ms3gl_conversion.supported = true
	self.parts.wpn_fps_gre_ms3gl_conversion.has_description = false
	self.parts.wpn_fps_gre_ms3gl_conversion.stats = { value = 0 }
	self.parts.wpn_fps_gre_ms3gl_conversion.custom_stats = nil
	self.parts.wpn_fps_gre_ms3gl_conversion.adds = {}
	self.parts.wpn_fps_gre_ms3gl_conversion.forbids = {
		"wpn_fps_addon_ris"
	}
	self.parts.wpn_fps_gre_ms3gl_conversion.override = {
		wpn_fps_gre_ms3gl_upper_standard = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_upper_reciever_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_upper"
		},
		wpn_fps_gre_ms3gl_lower_standard = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_lower_reciever_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_lower"
		},
		wpn_fps_gre_ms3gl_s_standard = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_stock_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_stock"
		},
		wpn_fps_gre_ms3gl_s_modern = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_stock_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_stock"
		},
		wpn_fps_gre_ms3gl_b_standard = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_barrel_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_barrel_dummy"
		},
		wpn_fps_gre_ms3gl_b_long = {
			third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_barrel_conv",
			unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_barrel_dummy"
		},
		wpn_fps_gre_ms3gl_body_modern = {
			override = {
				wpn_fps_gre_ms3gl_upper_standard = {
					third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_upper_reciever_conv",
					unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_upper"
				},
				wpn_fps_gre_ms3gl_lower_standard = {
					third_unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_third_gre_3gl_lower_reciever_conv",
					unit = "units/pd2_dlc_pxp1/weapons/wpn_fps_gre_3gl_pts/wpn_fps_gre_3gl_venom_lower"
				}
			}
		}
	}

end)


--Hailstorm Mk 5
Hooks:PostHook(WeaponFactoryTweakData, "_init_hailstorm", "resmod_hailstorm", function(self)
	--Long Barrel
	self.parts.wpn_fps_hailstorm_b_extended.supported = true
	self.parts.wpn_fps_hailstorm_b_extended.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_hailstorm_b_extended.custom_stats = deep_clone(barrels.long_b2_custom_stats)
		
	--Suppressed Barrel
	self.parts.wpn_fps_hailstorm_b_suppressed.supported = true
	self.parts.wpn_fps_hailstorm_b_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_hailstorm_b_suppressed.has_description = true
	self.parts.wpn_fps_hailstorm_b_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_hailstorm_b_suppressed.stats = {
		value = 2,
		suppression = 12,
		alert_size = -1
	}
	self.parts.wpn_fps_hailstorm_b_suppressed.custom_stats = nil

	--Suppressed Long Barrel
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.supported = true
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.perks = {"silencer"}
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.has_description = true
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.desc_id = "bm_wp_upg_suppressor"
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.stats.suppression = 12
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.stats.alert_size = -1
	self.parts.wpn_fps_hailstorm_b_ext_suppressed.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	self.parts.wpn_fps_hailstorm_o_claymore.stats = { zoom = 5 }
	self.parts.wpn_fps_hailstorm_o_claymore.stance_mod = {
		wpn_fps_hailstorm = {
			translation = Vector3(0.02, 0, -0.05),
			rotation = Rotation(0, 0, 0)
		}
	}

	self.parts.wpn_fps_hailstorm_g_crystal.supported = true
	self.parts.wpn_fps_hailstorm_g_crystal.stats = { 
		value = 1,
		spread = 1,
		recoil = -2
	}
	self.parts.wpn_fps_hailstorm_g_crystal.custom_stats = nil

	self.parts.wpn_fps_hailstorm_g_bubble.supported = true
	self.parts.wpn_fps_hailstorm_g_bubble.stats = { 
		value = 1,
		spread = -1,
		recoil = 2
	}
	self.parts.wpn_fps_hailstorm_g_bubble.custom_stats = nil

	self.parts.wpn_fps_hailstorm_g_noise.supported = true
	self.parts.wpn_fps_hailstorm_g_noise.stats = { 
		value = 1,
		concealment = 1,
		recoil = -2
	}
	self.parts.wpn_fps_hailstorm_g_noise.custom_stats = {
		ads_speed_mult = 0.975
	}

	--Exclusive Set
	self.parts.wpn_fps_hailstorm_conversion.supported = true
	self.parts.wpn_fps_hailstorm_conversion.has_description = false
	self.parts.wpn_fps_hailstorm_conversion.stats = { value = 0 }
	self.parts.wpn_fps_hailstorm_conversion.custom_stats = nil
	self.parts.wpn_fps_hailstorm_conversion.forbids = {}
	self.parts.wpn_fps_hailstorm_conversion.override = {
		wpn_fps_hailstorm_body = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_body",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_body"
		},
		wpn_fps_hailstorm_b_ext_suppressed = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_b_std",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_b_std"
		},
		wpn_fps_hailstorm_b_suppressed = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_b_std",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_b_std"
		},
		wpn_fps_hailstorm_b_extended = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_b_std",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_b_std"
		},
		wpn_fps_hailstorm_b_std = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_b_std",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_b_std"
		},
		wpn_fps_hailstorm_g_crystal = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_hailstorm_g_noise = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_hailstorm_g_bubble = {
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		},
		wpn_fps_hailstorm_o_claymore = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_o_katabatic",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_o_katabatic",
			a_obj = "a_o_2",
			stance_mod = {
				wpn_fps_hailstorm = {
					translation = Vector3(0.005, -3, 1.26),
					rotation = Rotation(0, 1.05, 0)
				}
			}
		},
		wpn_fps_snp_model70_iron_sight = {
			stance_mod = {
				wpn_fps_hailstorm = {
					translation = Vector3(-0.07, 2, 2.8),
					rotation = Rotation(0, 1.2, 0)
				}
			}
		},
		wpn_fps_hailstorm_fl_flash = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_third_hailstorm_conv_fl",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_hailstorm_pts/wpn_fps_hailstorm_conv_fl"
		},
		wpn_fps_hailstorm_o_irons = {
			a_obj = "a_o_2"
		}
	}

	table.insert(self.wpn_fps_hailstorm.uses_parts, "wpn_fps_snp_model70_iron_sight")
			
	self.wpn_fps_hailstorm_npc.uses_parts = deep_clone(self.wpn_fps_hailstorm.uses_parts)	

end)

--VD-12
Hooks:PostHook(WeaponFactoryTweakData, "_init_sko12", "resmod_sko12", function(self)
	self.parts.wpn_fps_sho_sko12_b_long.supported = true
	self.parts.wpn_fps_sho_sko12_b_long.stats = deep_clone(barrels.long_b2_stats)
	self.parts.wpn_fps_sho_sko12_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

	self.parts.wpn_fps_sho_sko12_b_short.supported = true
	self.parts.wpn_fps_sho_sko12_b_short.stats = deep_clone(barrels.short_b2_stats)
	self.parts.wpn_fps_sho_sko12_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

	self.parts.wpn_fps_sho_sko12_fg_railed.supported = true
	self.parts.wpn_fps_sho_sko12_fg_railed.stats = {
		recoil = 2,
		concealment = -1
	}

	self.parts.wpn_fps_sho_sko12_body_grip.supported = true
	self.parts.wpn_fps_sho_sko12_body_grip.stats = {
		value = 3,
		spread = 1,
		recoil = -2
	}
	self.parts.wpn_fps_sho_sko12_body_grip.custom_stats = {}	

	self.parts.wpn_fps_sho_sko12_stock.supported = true
	self.parts.wpn_fps_sho_sko12_stock.stats = deep_clone(stocks.adj_acc_stats)
	self.parts.wpn_fps_sho_sko12_stock.custom_stats = deep_clone(stocks.adj_acc_stats)

	self.parts.wpn_fps_sho_sko12_stock_conversion.supported = true
	self.parts.wpn_fps_sho_sko12_stock_conversion.stats = { value = 0}

	self.parts.wpn_fps_sho_sko12_conversion.supported = true
	self.parts.wpn_fps_sho_sko12_conversion.forbids = {}
	self.parts.wpn_fps_sho_sko12_conversion.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_sho_sko12_conversion.stats = { value = 0 }

	self.wpn_fps_sho_sko12.override = self.wpn_fps_sho_sko12.override or {}
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_slug = a_slug_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_custom = a_custom_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_custom_free = a_custom_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_explosive = a_explosive_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_rip = a_rip_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_piercing = a_piercing_semi_override
	self.wpn_fps_sho_sko12.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override		
	self.wpn_fps_sho_sko12.override.wpn_fps_smg_mac10_s_no = {
		unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_sho_sko12_pts/wpn_fps_sho_sko12_s_adapter_short",
		third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_sho_sko12_pts/wpn_third_sho_sko12_s_adapter_short",
		stats = deep_clone(stocks.remove_adj_stats),
		custom_stats = deep_clone(stocks.remove_adj_stats)
	}		

	self.wpn_fps_sho_sko12.uses_parts[44] = "resmod_dummy"
	self.wpn_fps_sho_sko12.uses_parts[45] = "resmod_dummy"
	
	table.insert(self.wpn_fps_sho_sko12.uses_parts, "wpn_fps_smg_mac10_s_no")

	self.wpn_fps_sho_sko12_npc.uses_parts = deep_clone(self.wpn_fps_sho_sko12.uses_parts)
	self.wpn_fps_sho_sko12_npc.override = deep_clone(self.wpn_fps_sho_sko12.override)
end)

Hooks:PostHook(WeaponFactoryTweakData, "_init_x_sko12", "resmod_x_sko12", function(self)

	self.wpn_fps_sho_x_sko12.override = self.wpn_fps_sho_x_sko12.override or {}
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_slug = a_slug_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_custom = a_custom_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_custom_free = a_custom_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_explosive = a_explosive_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_rip = a_rip_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_piercing = a_piercing_semi_override
	self.wpn_fps_sho_x_sko12.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override		

	self.wpn_fps_sho_x_sko12.uses_parts[26] = "resmod_dummy"
	self.wpn_fps_sho_x_sko12.uses_parts[27] = "resmod_dummy"

	self.wpn_fps_sho_x_sko12_npc.uses_parts = deep_clone(self.wpn_fps_sho_x_sko12.uses_parts)
end)

--Kahn .357
Hooks:PostHook(WeaponFactoryTweakData, "_init_korth", "resmod_korth", function(self)
	--Railed Barrel
	self.parts.wpn_fps_pis_korth_b_railed.supported = true
	self.parts.wpn_fps_pis_korth_b_railed.stats = {
			value = 1,
			concealment = -2,
			spread = 1,
			recoil = 2
	}
	self.parts.wpn_fps_pis_korth_b_railed.stance_mod = {}
	self.parts.wpn_fps_pis_korth_b_railed.override = {
		wpn_fps_upg_fl_pis_m3x = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_pis_crimson = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_pis_x400v = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_pis_laser = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			a_obj = "a_fl_2"
		},
		wpn_fps_upg_fl_pis_perst = {
			a_obj = "a_fl_2"
		}
	}

	--Ergo Grip
	self.parts.wpn_fps_pis_korth_g_ergo.supported = true
	self.parts.wpn_fps_pis_korth_g_ergo.stats = {
		spread = 1,
		recoil = -2
	}
	--Overmould Grip
	self.parts.wpn_fps_pis_korth_g_houge.supported = true
	self.parts.wpn_fps_pis_korth_g_houge.stats = {
		concealment = 1,
		recoil = -2
	}
	self.parts.wpn_fps_pis_korth_g_houge.custom_stats = {
		ads_speed_mult = 0.975
	}

	--8-shot
	self.parts.wpn_fps_pis_korth_m_8_dummy = deep_clone(self.parts.wpn_fps_pis_korth_m_8)
	self.parts.wpn_fps_pis_korth_m_8_dummy.type = "magazine_extra"
	self.parts.wpn_fps_pis_korth_m_8_dummy.stats = {}
	self.parts.wpn_fps_pis_korth_m_8_dummy.custom_stats = {}
	self.parts.wpn_fps_pis_korth_m_8.supported = true
	self.parts.wpn_fps_pis_korth_m_8.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_pis_korth_m_8.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_pis_korth_m_8.adds = {"wpn_fps_pis_korth_m_8_dummy"}

	--6-shot
	self.parts.wpn_fps_pis_korth_m_6_dummy = deep_clone(self.parts.wpn_fps_pis_korth_m_6)
	self.parts.wpn_fps_pis_korth_m_6_dummy.type = "magazine_extra"
	self.parts.wpn_fps_pis_korth_m_6_dummy.stats = {}
	self.parts.wpn_fps_pis_korth_m_6_dummy.custom_stats = {}
	self.parts.wpn_fps_pis_korth_m_6.supported = true
	self.parts.wpn_fps_pis_korth_m_6.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_pis_korth_m_6.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	self.parts.wpn_fps_pis_korth_m_6.adds = {"wpn_fps_pis_korth_m_6_dummy"}
	self.parts.wpn_fps_pis_korth_m_6.stats = {
		extra_ammo = -2,
		concealment = 1,
		reload = 3
	}
	self.parts.wpn_fps_pis_korth_m_6.custom_stats = {
		ads_speed_mult = 0.975
	}

	--Exclusive Set
	self.parts.wpn_fps_pis_korth_conversionkit.supported = true
	self.parts.wpn_fps_pis_korth_conversionkit.stats = { value = 1 }
	self.parts.wpn_fps_pis_korth_conversionkit.custom_stats = {}
	self.parts.wpn_fps_pis_korth_conversionkit.forbids = {
		"wpn_fps_upg_fl_pis_m3x",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_fl_pis_x400v",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_upg_fl_pis_tlr1",
		"wpn_fps_upg_fl_pis_perst"
	}
	self.parts.wpn_fps_pis_korth_conversionkit.override = {
		wpn_fps_pis_korth_b_standard = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_conversionkit"
		},
		wpn_fps_pis_korth_b_railed = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_conversionkit"
		},
		wpn_fps_pis_korth_body = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_body_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_body_conversionkit"
		},
		wpn_fps_pis_korth_g_standard = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_g_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_g_conversionkit"
		},
		wpn_fps_pis_korth_g_houge = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_g_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_g_conversionkit"
		},
		wpn_fps_pis_korth_g_ergo = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_g_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_g_conversionkit"
		},
		wpn_fps_pis_korth_m_8_dummy = {
			third_unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_third_pis_korth_m_conversionkit",
			unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_pis_korth_pts/wpn_fps_pis_korth_m_conversionkit"
		}
	}

	table.insert(self.wpn_fps_pis_korth.uses_parts, "wpn_fps_upg_o_specter")

	self.wpn_fps_pis_korth_npc.uses_parts = deep_clone(self.wpn_fps_pis_korth.uses_parts)

end)
Hooks:PostHook(WeaponFactoryTweakData, "_init_x_korth", "resmod_x_korth", function(self)

	self.wpn_fps_pis_x_korth.override = self.wpn_fps_pis_x_korth.override or {}
	self.wpn_fps_pis_x_korth.override.wpn_fps_pis_korth_m_6 = {
		stats = {
			extra_ammo = -4,
			concealment = 1,
			reload = 3
		}
	}
end)


--Resmod Custom Content					
Hooks:PostHook( WeaponFactoryTweakData, "create_bonuses", "SC_mods", function(self)

	--Dummy weapon part
	self.parts.resmod_dummy = {
		type = "custom",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0
		},
		is_a_unlockable = true,
		internal_part = true,
		dlc = "sc"
	}


	self.parts.wpn_fps_upg_i_slower_rof = {
		type = "custom",
		--sub_type = "singlefire",
		name_id = "bm_wp_upg_i_singlefire_sc",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {rof_mult = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_singlefire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0,
			damage = 0,
			spread = 0,
			recoil = 0
		},
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_upg_extra_mp_lock"
		},
		internal_part = true,
		dlc = "sc"
	}
	self.parts.wpn_fps_upg_i_faster_rof = {
		type = "custom",
		--sub_type = "autofire",
		name_id = "bm_wp_upg_i_autofire_sc",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {rof_mult = 1},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0,
			damage = 0,
			spread = 0,
			recoil = 0,
			spread_moving = 0
		},
		is_a_unlockable = true,
		forbids = {
			"wpn_fps_upg_extra_mp_lock"
		},
		internal_part = true,
		dlc = "sc"
	}	
	
	self.parts.wpn_fps_upg_i_93r = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_93r",
		a_obj = "a_body",
		has_description = true,
		custom_stats = {
			beretta_burst = true,
			use_auto_kick = true
		},
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 5,
			spread = -5,
			recoil = -8			
		},
		internal_part = true,
		dlc = "sc"
	}	

	--B3 Kit (M16A2 kit)
	self.parts.wpn_fps_upg_i_m16a2 = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_m16a2",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		custom_stats = {
			m16_burst = true
		},
		stats = {
			value = 5,
			spread = 1
		},
		internal_part = true,
		dlc = "sc"
	}

	--Croon HS-10
	self.parts.wpn_fps_upg_i_eye = {
		pcs = nil,
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_eye",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		custom_stats = {
			--croon = true
		},
		stats = {
			value = 10,
		},
		internal_part = true,
		dlc = "sc"
	}

	--Default Sniper Scope
	self.parts.wpn_fps_upg_o_shortdot_dmc = deep_clone(self.parts.wpn_fps_upg_o_shortdot)
	self.parts.wpn_fps_upg_o_shortdot_dmc.pcs = {}
	self.parts.wpn_fps_upg_o_shortdot_dmc.stats = {value = 0, zoom = 40}
	self.parts.wpn_fps_upg_o_shortdot_dmc.custom_stats = { big_scope = true }
	self.parts.wpn_fps_upg_o_shortdot_dmc.perks = {"scope"}
	self.parts.wpn_fps_upg_o_shortdot_dmc.is_a_unlockable = true
	self.parts.wpn_fps_upg_o_shortdot_dmc.name_id = "bm_wp_upg_o_shortdot_dmc"
	self.parts.wpn_fps_upg_o_shortdot_dmc.desc_id = "bm_wp_upg_o_5_default"
	self.parts.wpn_fps_upg_o_shortdot_dmc.has_description = true
	self.parts.wpn_fps_upg_o_shortdot_dmc.alt_icon = "guis/dlcs/gage_pack_historical/textures/pd2/blackmarket/icons/mods/wpn_fps_pis_c96_sight"
	self.parts.wpn_fps_upg_o_shortdot_dmc.supported = true
	self.parts.wpn_fps_upg_o_shortdot_dmc.dlc = "sc"

	for factory_id, i in pairs(self) do
		if self[factory_id] then
			if self[factory_id].uses_parts and not table.contains(self[factory_id].uses_parts, "wpn_fps_upg_o_shortdot_dmc") and (table.contains(self[factory_id].uses_parts, "wpn_fps_upg_o_shortdot")	or table.contains(self[factory_id].uses_parts, "wpn_fps_upg_o_shortdot_vanilla")) then
				table.insert(self[factory_id].uses_parts, "wpn_fps_upg_o_shortdot_dmc")
				if self[factory_id].override and (self[factory_id].override.wpn_fps_upg_o_shortdot or self[factory_id].override.wpn_fps_upg_o_shortdot_vanilla) then
					self[factory_id].override.wpn_fps_upg_o_shortdot_dmc = deep_clone((self[factory_id].override.wpn_fps_upg_o_shortdot or self[factory_id].override.wpn_fps_upg_o_shortdot_vanilla))
				end
				if self[factory_id].adds and (self[factory_id].adds.wpn_fps_upg_o_shortdot or self[factory_id].adds.wpn_fps_upg_o_shortdot_vanilla) then
					self[factory_id].adds.wpn_fps_upg_o_shortdot_dmc = deep_clone((self[factory_id].adds.wpn_fps_upg_o_shortdot or self[factory_id].adds.wpn_fps_upg_o_shortdot_vanilla))
				end
			end
		end
	end

	--M4A1 Kit
	local m4a1_override = {
		unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail",
		third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail",
		override = {
			wpn_fps_m4_uupg_o_flipup = {
				unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
				third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_ass_m16_o_handle_sight",
				stance_mod = {
				wpn_fps_ass_m4 = {
						translation = Vector3(0, -3, -0.45)
					}
				}
			}
		},
		adds = {
			"fake_a_os"
		}
	}
	self.parts.wpn_fps_m4_uupg_fg_rail_m4a1 = {
		pcs = {},
		type = "exclusive_set",
		dlc = "sc",
		name_id = "bm_wp_upg_fg_m4a1",
		a_obj = "a_fg",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_m4_uupg_fg_rail_m4a1",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 0
		},
		override = { 
			wpn_fps_m4_uupg_fg_rail = m4a1_override,
			wpn_fps_m4_uupg_fg_lr300 = m4a1_override,
			wpn_fps_upg_fg_jp = m4a1_override,
			wpn_fps_upg_fg_smr = m4a1_override,
			wpn_fps_upg_ass_m4_fg_moe = m4a1_override,
			wpn_fps_upg_ass_m4_fg_lvoa = m4a1_override
		},
		forbids = {
			"wpn_fps_addon_ris"
		}
	}

	--Fixed Stock (AMR-16)
	self.parts.wpn_fps_ass_m16_s_fixed = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_upg_s_fixed",
		a_obj = "a_s",
		alt_icon = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
		unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_s_solid", 
		third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_s_solid", 
		supported = true,
		custom_stats = deep_clone(stocks.adj_to_fixed_acc_stats),
		stats = deep_clone(stocks.adj_to_fixed_acc_stats),
		dlc = "sc"
	}	
	
	--OVERKILL Kit (Bernetti Auto autofire)
	self.parts.wpn_fps_upg_i_b93o = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_b93o",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		custom_stats = {
			beer_burst = true
		},
		stats = {
			value = 5,
			recoil = -8
		},
		internal_part = true,
		dlc = "sc"
	}
	--Hailstorm Kit
	self.parts.wpn_fps_upg_i_iw_hailstorm = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_iw_hailstorm",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		custom_stats = {
			hailstorm = true,
			falloff_start_mult = 0.5,
			falloff_end_mult = 0.75,
			rof_mult = 3.50789,
			--disable_steelsight_recoil_anim = true
		},
		stats = {
			value = 10,
			spread = -4,
			recoil = -6,
			extra_ammo = 12
		},
		internal_part = true,
		dlc = "sc"
	}
	--Widowmaker
	self.parts.wpn_fps_upg_i_iw_widowmaker = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_iw_widowmaker",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {
			value = 10,
			extra_ammo = 3,
			reload = -2,
			spread = -4
		},
		custom_stats = {
			widowmaker = true,
			falloff_start_mult = 0.66666,
			falloff_end_mult = 0.025725
		},
		internal_part = true,
		dlc = "sc"
	}
	--MK32 Kit
	self.parts.wpn_fps_upg_i_ghosts_mk32 = {
		pcs = {},
		type = "custom",
		sub_type = "autofire",
		name_id = "bm_wp_upg_i_ghosts_mk32",
		a_obj = "a_body",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_i_autofire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		custom_stats = {
			mk32 = true,
			rof_mult = 3
		},
		stats = {
			value = 10,
			recoil = -8,
			concealment = -4
		},
		internal_part = true,
		dlc = "sc"
	}
	
	self.parts.wpn_fps_smg_mac10_s_no = {
		pcs = {},
		type = "stock",
		name_id = "bm_wp_shepheard_s_no",
		a_obj = "a_s",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_smg_mac10_s_no",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",			
		supported = true,			
		stats = {
			value = 0,
			spread = -1,
			recoil = -4,
			concealment = 3,
			ads_speed_mult = 0.925
		},		
		custom_stats = deep_clone(stocks.remove_folder_stats),		
		dlc = "sc"			
	}								
	self.parts.wpn_fps_shot_r870_s_folding_ext = { -- thanks jarey_!
		pcs = {},
		type = "stock",
		name_id = "bm_wp_r870_s_folding_ext",
		a_obj = "a_s",
		alt_icon = "guis/dlcs/mods/textures/pd2/blackmarket/icons/mods/wpn_fps_shot_r870_s_muldonunfolded",
		unit = "units/mods/weapons/wpn_fps_shot_r870_pts_mod/wpn_fps_shot_r870_s_muldonunfolded",
		third_unit = "units/mods/weapons/wpn_fps_shot_r870_pts_mod/wpn_third_shot_r870_s_muldonunfolded",			
		supported = true,			
		stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats),
		dlc = "sc"			
	}						
	--Vlad's Rodina--
	self.parts.wpn_fps_upg_vlad_rodina_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_ak",
		desc_id = "bm_wskn_ak74_rodina_desc_sc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p3",
		has_description = true,
		override = {
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_ns_ak105 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_b_ak105 = {
				override = nil,
				adds = nil,
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_upg_ak_b_draco = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_ass_74_b_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_fps_upg_ass_ak_b_zastava = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_fps_ass_74_b_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_ass_74_b_legend",
			},
			wpn_upg_ak_fg_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo2 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo3 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo1 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_fg_combo4 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_tapco = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_fg_midwest = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_krebs = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_fps_upg_ak_fg_trax = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_fg_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_fg_legend",
			},
			wpn_upg_ak_g_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_rk3 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_hgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_pgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_fps_upg_ak_g_wgrip = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_g_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_g_legend",
			},
			wpn_upg_ak_s_skfoldable_vanilla = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_upg_ak_s_folding = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_upg_ak_s_legend",
				third_unit = "units/payday2_cash/safes/sputnik/weapons/wpn_fps_ass_74_rodina_pts/wpn_third_upg_ak_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_74.uses_parts, "wpn_fps_upg_vlad_rodina_legend")

	--Midas Touch--
	self.parts.wpn_fps_upg_midas_touch_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_deagle",
		desc_id = "bm_wskn_deagle_bling_desc_sc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		has_description = true,
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2",
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_upg_o_marksmansight_front = {a_obj = "a_ol"},
			wpn_fps_pis_deagle_b_standard = {
				unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_fps_pis_deagle_b_legend",
				third_unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_third_pis_deagle_b_legend",
			},
			wpn_fps_pis_deagle_b_long = {
				unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_fps_pis_deagle_b_legend",
				third_unit = "units/payday2_cash/safes/cf15/weapons/wpn_fps_pis_deagle_bling_pts/wpn_third_pis_deagle_b_legend",
			}
		}
	}
	table.insert(self.wpn_fps_pis_deagle.uses_parts, "wpn_fps_upg_midas_touch_legend")

	--Dragon Lord--
	self.parts.wpn_fps_upg_dragon_lord_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_fla_mk2_body = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_fla_mk2_body_fierybeast_pts/wpn_fps_fla_mk2_body_fierybeast"
			}
		}
	}
	table.insert(self.wpn_fps_fla_mk2.uses_parts, "wpn_fps_upg_dragon_lord_legend")

	--Green Grin--
	self.parts.wpn_fps_upg_green_grin_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_rpg7_m_rocket = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_rpg7_m_grinclown/wpn_fps_rpg7_m_grinclown",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_rpg7_m_grinclown/wpn_third_rpg7_m_grinclown"		}
		}
	}
	table.insert(self.wpn_fps_rpg7.uses_parts, "wpn_fps_upg_green_grin_legend")

	--The Gimp--
	self.parts.wpn_fps_upg_the_gimp_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_lmg_m134_body_upper = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_body_upper_spikey",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_body_upper_spikey",
			},
			wpn_fps_lmg_m134_body_upper_light = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_body_upper_spikey",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_body_upper_spikey",
			},
			wpn_fps_lmg_m134_barrel = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			},
			wpn_fps_lmg_m134_barrel_short = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			},
			wpn_fps_lmg_m134_barrel_extreme = {
				unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_fps_lmg_m134_barrel_legendary",
				third_unit = "units/payday2_cash/safes/cop/weapons/wpn_fps_lmg_m134_legend_pts/wpn_third_lmg_m134_barrel_legendary",
			}
		}
	}

	--Dallas Sallad--
	self.parts.wpn_fps_upg_salad_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_smg_p90_b_short = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_long = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_civilian = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
			wpn_fps_smg_p90_b_ninja = {
				unit = "units/payday2_cash/safes/dallas/weapons/wpn_fps_smg_p90_b_legendary/wpn_fps_smg_p90_b_legend",
				third_unit = "units/payday2_cash/safes/dallas/weapons/wpn_third_smg_p90_b_legendary/wpn_third_smg_p90_b_legend"		
			},
		}
	}
	table.insert(self.wpn_fps_smg_p90.uses_parts, "wpn_fps_upg_salad_legend")

	--Big Kahuna--
	self.parts.wpn_fps_upg_the_big_kahuna = {
		type = "bonus",
		name_id = "bm_menu_sc_legendary_r870",
		desc_id = "bm_wskn_r870_waves_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_recoil_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_shot_r870_s_solid_vanilla = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_folding = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_m4 = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock_single = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_nostock = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_single = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_s_solid = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_s_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_s_legendary",
			},
			wpn_fps_shot_r870_fg_big = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_railed = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_wood = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_shot_r870_fg_wood = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_fps_shot_r870_fg_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_fg_legend/wpn_third_shot_r870_fg_legendary",
			},
			wpn_fps_upg_ns_shot_thick = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_shot_shark = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_shot_ns_king = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_sho_salvo_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_standard = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_ergo = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_sniper = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_hgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_mgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_shot_r870_m_extended = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_shot_r870_b_long = {
				unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_fps_shot_r870_b_legendary",
				third_unit = "units/payday2_cash/safes/surf/weapons/wpn_fps_shot_r870_b_legend/wpn_third_shot_r870_b_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_shot_r870.uses_parts, "wpn_fps_upg_the_big_kahuna")

	--Dallas Sallad--
	self.parts.wpn_fps_upg_santa_slayers_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_pis_1911_g_standard = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_bling = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_ergo = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_pis_1911_g_engraved = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_fps_pis_1911_g_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_g_legendary/wpn_third_pis_1911_g_legendary"		
			},
			wpn_fps_upg_fl_pis_laser = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_tlr1 = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_crimson = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_x400v = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
			wpn_fps_upg_fl_pis_m3x = {
				unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_fps_pis_1911_fl_legendary",
				third_unit = "units/payday2_cash/safes/flake/weapons/wpn_fps_pis_1911_fl_legendary/wpn_third_pis_1911_fl_legendary"		
			},
		}
	}
	table.insert(self.wpn_fps_x_1911.uses_parts, "wpn_fps_upg_santa_slayers_legend")

	--Pastrami--
	self.parts.wpn_fps_upg_baaah_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_flamethrower",
		desc_id = "bm_wskn_flamethrower_mk2_fire_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p1",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_snp_model70_b_standard = {
				unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_fps_snp_model70_b_legend",
				third_unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_third_snp_model70_b_legend"		
			},
			wpn_fps_snp_model70_s_standard = {
				unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_fps_snp_model70_s_legend",
				third_unit = "units/payday2_cash/safes/bah/weapons/wpn_fps_snp_model70_legendary_pts/wpn_third_snp_model70_s_legend"		
			}
		}
	}
	table.insert(self.wpn_fps_snp_model70.uses_parts, "wpn_fps_upg_baaah_legend")

	--Wolf's M240 thing--
	self.parts.wpn_fps_upg_par_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_lmg_par_b_short = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_fps_lmg_svinet_b_standard",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_third_lmg_svinet_b_legend",
			},
			wpn_fps_lmg_par_b_standard = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_fps_lmg_svinet_b_standard",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_b_legendary/wpn_third_lmg_svinet_b_legend",
			},
			wpn_fps_lmg_par_s_plastic = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_fps_lmg_svinet_s_legend",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_third_lmg_svinet_s_legend",
			},
			wpn_fps_lmg_par_s_standard = {
				unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_fps_lmg_svinet_s_legend",
				third_unit = "units/payday2_cash/safes/pack/weapons/wpn_fps_lmg_ksp58_s_legendary/wpn_third_lmg_svinet_s_legend",
			}
		}
	}
	table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_par_legend")

	--Cola--
	self.parts.wpn_fps_upg_cola_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_deagle",
		desc_id = "bm_wskn_deagle_bling_desc_sc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		supported = true,
		stats = {value = 0},
		internal_part = true,
		has_description = true,
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_concealment_p2",
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_upg_ns_ass_smg_firepig = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_stubby = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_tank = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_large = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_medium = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_smg_small = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_jprifles = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_linear = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_surefire = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ns_ass_pbs1 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ass_ns_battle = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_ak_ns_ak105 = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_m4_uupg_b_medium_vanilla = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_m4_uupg_b_long = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_upg_ass_m4_b_beowulf = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_b_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_b_legend",
			},
			wpn_fps_m16_fg_standard = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_fg_railed = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_fg_vietnam = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_upg_ass_m16_fg_stag = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_fg_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_fg_legend",
			},
			wpn_fps_m16_s_solid_vanilla = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_m4_uupg_s_fold = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
			wpn_fps_smg_olympic_s_short = {
				unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_fps_ass_m16_s_legend",
				third_unit = "units/payday2_cash/safes/cola/weapons/wpn_fps_ass_m16_legendary/wpn_third_ass_m16_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_upg_cola_legend")

	--I forgot about the bayonetta gun--
	self.parts.wpn_fps_upg_judge_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_pis_judge_b_standard = {
				unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_fps_pis_judge_b_legend",
				third_unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_b_legend/wpn_third_pis_judge_b_legend",
			},
			wpn_fps_pis_judge_g_standard = {
				unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_g_legend/wpn_fps_pis_judge_g_legend",
				third_unit = "units/payday2_cash/safes/burn/weapons/wpn_fps_pis_judge_g_legend/wpn_third_pis_judge_g_legend",
			}
		}
	}
	table.insert(self.wpn_fps_pis_judge.uses_parts, "wpn_fps_upg_judge_legend")

	--IN THE BOOT WITH YA!--
	self.parts.wpn_fps_upg_boot_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_sho_boot_b_standard = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_b_short = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_b_long = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_b_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_b_legendary",
			},
			wpn_fps_sho_boot_fg_standard = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_fg_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_fg_legendary",
			},
			wpn_fps_sho_boot_s_short = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_s_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_s_legendary",
			},
			wpn_fps_sho_boot_s_long = {
				unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_s_legendary",
				third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_s_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_boot_legend")

	--Wait, there's more?--
	self.parts.wpn_fps_upg_boot_legend_optic = {
		type = "sight",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_o",
		unit = "units/payday2_cash/safes/buck/weapons/wpn_fps_sho_boot_legendary/wpn_fps_sho_boot_o_legendary",
		third_unit = "units/payday2_cash/safes/buck/weapons/wpn_third_sho_boot_legendary/wpn_third_sho_boot_o_legendary",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		stance_mod = {
			wpn_fps_sho_boot = {
				translation = Vector3(0, -5, -1.5)
			}
		}
	}
	table.insert(self.wpn_fps_sho_boot.uses_parts, "wpn_fps_upg_boot_legend_optic")

	--Just like the real KSG, no one likes this skin--
	self.parts.wpn_fps_upg_ksg_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_sho_ksg_b_standard = {
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			},
			wpn_fps_sho_ksg_b_long = {
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			},
			wpn_fps_sho_ksg_b_short = {
				forbids = {"wpn_fps_sho_ksg_fg_short"},
				adds = {"wpn_fps_sho_ksg_fg_standard"},
				unit = "units/payday2_cash/safes/same/weapons/wpn_fps_sho_ksg_b_legendary/wpn_fps_sho_ksg_b_legendary",
				third_unit = "units/payday2_cash/safes/same/weapons/wpn_third_sho_ksg_b_legendary/wpn_third_sho_ksg_b_legendary",
			}
		}
	}
	table.insert(self.wpn_fps_sho_ksg.uses_parts, "wpn_fps_upg_ksg_legend")

	--The Not Patriot--
	self.parts.wpn_fps_upg_tecci_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_ass_tecci_b_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_b_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_b_legend",
			},
			wpn_fps_ass_tecci_b_long = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_b_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_b_legend",
			},
			wpn_fps_ass_tecci_fg_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_fg_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_fg_legend",
			},
			wpn_fps_ass_tecci_s_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_standard = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_crane = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_mk46 = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_ubr = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_m4_uupg_s_fold = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
			wpn_fps_upg_m4_s_pts = {
				unit = "units/payday2_cash/safes/grunt/weapons/wpn_fps_ass_tecci_legendary/wpn_fps_ass_tecci_s_legend",
				third_unit = "units/payday2_cash/safes/grunt/weapons/wpn_third_ass_tecci_legendary/wpn_third_ass_tecci_s_legend",
			},
		}
	}
	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_upg_tecci_legend")

	--Plush Phoenix--
	self.parts.wpn_fps_upg_m14_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_ass_m14_b_standard = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_b_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_b_legendary",
			},
			wpn_fps_ass_m14_body_dmr = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_ebr = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_jae = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",
			},
			wpn_fps_ass_m14_body_ruger = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_legendary",			
			},
			wpn_fps_ass_m14_body_upper = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_upper_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_third_ass_m14_body_upper_legendary",
			},
			wpn_fps_ass_m14_body_lower = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_lower_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_ass_m14_legendary_pts/wpn_fps_ass_m14_body_lower_legendary",
			},
		}
	}
	table.insert(self.wpn_fps_ass_m14.uses_parts, "wpn_fps_upg_m14_legend")

	--Demon--
	self.parts.wpn_fps_upg_serbu_legend = {
		type = "legendary",
		name_id = "bm_menu_sc_legendary_m134",
		desc_id = "bm_wskn_m134_bulletstorm_desc",
		is_a_unlockable = true,
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		alt_icon = "guis/dlcs/boost_in_lootdrop/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_bonus_damage_p2",
		supported = true,
		stats = {value = 0},
		internal_part = false,
		texture_bundle_folder = "boost_in_lootdrop",
		has_description = true,
		override = {
			wpn_fps_shot_r870_b_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_b_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_b_legendary",
			},
			wpn_fps_shot_r870_fg_small = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_fg_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_fg_legendary",
			},
			wpn_fps_upg_m4_g_standard = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},			
			wpn_fps_shot_shorty_m_extended_short = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_ergo = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_sniper = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_hgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_upg_m4_g_mgrip = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},
			wpn_fps_snp_tti_g_grippy = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},				
			wpn_fps_upg_g_m4_surgeon = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
				third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			},			
			wpn_fps_shot_r870_s_nostock_vanilla = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_r870_s_folding = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_shorty_s_nostock_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			},
			wpn_fps_shot_r870_s_solid = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_r870_s_solid_single = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
			},
			wpn_fps_shot_shorty_s_solid_short = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			},
			wpn_fps_shot_r870_s_folding_ext = {
				unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_fps_shot_shorty_s_legendary",
				third_unit = "units/payday2_cash/safes/lones/weapons/wpn_fps_shot_shorty_legendary_pts/wpn_third_shot_shorty_s_legendary",
				forbids = {}
			}			
		}
	}
	table.insert(self.wpn_fps_shot_serbu.uses_parts, "wpn_fps_upg_serbu_legend")


--Legendary shit above--

--Custom weapon shit here--

	--Striker mods--
	if self.parts.wpn_fps_sho_striker_s_folding then
		self.parts.wpn_fps_sho_striker_s_folding.supported = true
		self.parts.wpn_fps_sho_striker_s_folding.stats = {
				value = 0,
				recoil = 0,
				concealment = 0
			}
		end

	if SystemFS:exists("assets/mod_overrides/Classic Weapon Animations") then
		self.parts.wpn_fps_pis_g17_m_standard.unit = "units/payday2/weapons/wpn_fps_pis_g17_pts/wpn_fps_pis_g17_m_standard"
	end		

	if self.parts.wpn_fps_ass_ns_g_sup1 then -- Gambyt's Sneaky Suppressor Pack
		self.parts.wpn_fps_ass_ns_g_sup1.supported = true
		self.parts.wpn_fps_ass_ns_g_sup1.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}	
		self.parts.wpn_fps_ass_ns_g_sup2.supported = true	
		self.parts.wpn_fps_ass_ns_g_sup2.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}			
		self.parts.wpn_fps_ass_ns_g_sup3.supported = true			
		self.parts.wpn_fps_ass_ns_g_sup3.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}			
		self.parts.wpn_fps_ass_ns_g_sup4.supported = true			
		self.parts.wpn_fps_ass_ns_g_sup4.stats = { 
			value = 5,
			suppression = 12,
			alert_size = -1,
			spread = 2,
			recoil = -2,
			concealment = -2
		}		
		self.parts.wpn_fps_ass_ns_g_sup5.supported = true		
		self.parts.wpn_fps_ass_ns_g_sup5.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}		
		self.parts.wpn_fps_ass_ns_g_sup6.supported = true		
		self.parts.wpn_fps_ass_ns_g_sup6.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}							
		self.parts.wpn_fps_ass_ns_g_sup7.supported = true							
		self.parts.wpn_fps_ass_ns_g_sup7.stats = { 
			value = 10,
			suppression = 12,
			alert_size = -1,
			spread = -1,
			recoil = 1
		}
		self.parts.wpn_fps_ass_ns_g_sup8.supported = true
		self.parts.wpn_fps_ass_ns_g_sup8.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = -1,
			spread = 1,
			concealment = -1
		}
		self.parts.wpn_fps_ass_ns_g_sup9.supported = true
		self.parts.wpn_fps_ass_ns_g_sup9.stats = { 
			value = 10,
			suppression = 12,
			alert_size = -1,
			spread = 2,
			recoil = -2,
			concealment = -2
		}						
		table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1) --not a good way of fixing it, but it works, yeah?
		table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)
		table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)				
		table.remove(self.parts.wpn_fps_pis_pl14_b_comp.forbids, 1)				
	end				
					
	if self.parts.wpn_fps_rail_covers then 	--Kden and Silent Enforcer's Rail Covers
		self.parts.wpn_fps_rc_dd.supported = true
		self.parts.wpn_fps_rc_dd.stats = { 
				value = 0
			}			
		self.parts.wpn_fps_rail_covers.supported = true			
		self.parts.wpn_fps_rail_covers.stats = { 
				value = 0
			}	
	end

	if self.wpn_fps_pis_hpb then --Gambyt's Browning HP
		self.parts.wpn_fps_pis_hpb_g_white.supported = true
		self.parts.wpn_fps_pis_hpb_g_white.stats = { 
				value = 3, 
				spread = 1, 
				concealment = -1
			}
		self.parts.wpn_fps_pis_hpb_thread.supported = true
		self.parts.wpn_fps_pis_hpb_thread.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_pis_hpb_thread.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_pis_hpb_comp.supported = true
		self.parts.wpn_fps_pis_hpb_comp.stats = deep_clone(muzzle_device.muzzle_b_stats)

		self.parts.wpn_fps_pis_hpb_comp2.supported = true
		self.parts.wpn_fps_pis_hpb_comp2.stats = deep_clone(muzzle_device.muzzle_b_alt_stats)
		self.parts.wpn_fps_pis_hpb_comp2.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)
									
		self.parts.wpn_fps_pis_hpb_m_extended.supported = true								
		self.parts.wpn_fps_pis_hpb_m_extended.stats = { 
			value = 3,
			concealment = -2,
			extra_ammo = 16,
			reload = -3
		}		
		self.parts.wpn_fps_pis_hpb_m_extended.custom_stats = {
			ads_speed_mult = 1.05
		}
		
		self.parts.wpn_fps_pis_hpb_g_cherry.supported = true				
		self.parts.wpn_fps_pis_hpb_g_cherry.stats = { 
			value = 10,
			recoil = 2,
			spread = -1
		}				
		self.parts.wpn_fps_pis_hpb_g_black.supported = true				
		self.parts.wpn_fps_pis_hpb_g_black.stats = { 
			value = 2,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_pis_hpb_g_black.custom_stats = {
			ads_speed_mult = 0.975
		}				
		self.parts.wpn_fps_pis_hpb_a_c45.pcs = nil
	end					

	if self.wpn_fps_snp_moss464spx then -- Pawcio's SPX Centerfire
		self.parts.wpn_fps_snp_moss464spx_stock.stats = nil
		self.parts.wpn_fps_snp_moss464spx_stock.pcs = nil --already comes with this pre-attached, so it's disabled from being selectable in the stocks category.	
		self.parts.wpn_fps_upg_moss464spx_barrel_short.supported = true	
		self.parts.wpn_fps_upg_moss464spx_barrel_short.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_moss464spx_barrel_short.stats.extra_ammo = -1
		self.parts.wpn_fps_upg_moss464spx_barrel_short.stats.concealment = 2
		self.parts.wpn_fps_upg_moss464spx_barrel_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)	
		self.parts.wpn_fps_upg_moss464spx_barrel_short.override_weapon_add = nil

		self.parts.wpn_fps_snp_moss464spx_supp_maxim.supported = true
		self.parts.wpn_fps_snp_moss464spx_supp_maxim.stats = {
			value = 5,
			suppression = 12,
			alert_size = -1
		}				
		self.parts.wpn_fps_snp_moss464spx_supp_maxim.custom_stats = nil

		self.parts.wpn_fps_upg_moss464spx_stock_cheekpiece.supported = true
		self.parts.wpn_fps_upg_moss464spx_stock_cheekpiece.stats = deep_clone(stocks.adj_acc_stats)			

		if not self.wpn_fps_snp_moss464spx.override then
			self.wpn_fps_snp_moss464spx.override = {}
		end
		self.wpn_fps_snp_moss464spx.override.wpn_fps_upg_m4_s_standard = {
			stats = {},
			custom_stats = {}
		}
	end

	if self.wpn_fps_snp_m1894 then -- Pawcio's Marlin 1894
		self.parts.wpn_fps_snp_m1894_loading_spring.supported = true
		self.parts.wpn_fps_snp_m1894_loading_spring.adds = nil

		self.parts.wpn_fps_upg_m1894_supp_gemtech_gm45.supported = true
		self.parts.wpn_fps_upg_m1894_supp_gemtech_gm45.stats = {
			value = 5,
			suppression = 12,
			alert_size = -1
		}				
		self.parts.wpn_fps_upg_m1894_supp_gemtech_gm45.custom_stats = nil
		self.parts.wpn_fps_upg_m1894_supp_gemtech_gm45.sound_switch = {
			suppressed = "suppressed_a"
		}
	end	
	if self.wpn_fps_shot_quadbarrel then -- Pawcio's Doomstick
		self.parts.wpn_fps_upg_quadbarrel_barrel_short.supported = true
		self.parts.wpn_fps_upg_quadbarrel_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_quadbarrel_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_quadbarrel_stock_collapsed.supported = true
		self.parts.wpn_fps_upg_quadbarrel_stock_collapsed.stats = deep_clone(stocks.adj_to_folded_stats)
		self.parts.wpn_fps_upg_quadbarrel_stock_collapsed.custom_stats = deep_clone(stocks.adj_to_folded_stats)
		
		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_close.desc_id = "bm_wp_upg_a_custom_desc"
		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_close.stats = deep_clone(self.parts.wpn_fps_upg_a_custom.stats)
		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_close.custom_stats = deep_clone(self.parts.wpn_fps_upg_a_custom.custom_stats)

		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_med.desc_id = "bm_wp_upg_a_piercing_heavy_desc_sc"
		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_med.stats = deep_clone(self.parts.wpn_fps_upg_a_piercing.stats)
		self.parts.wpn_fps_upg_quadbarrel_ammo_buckshot_med.custom_stats = deep_clone(self.parts.wpn_fps_upg_a_piercing.custom_stats)

		self.parts.wpn_fps_upg_quadbarrel_ammo_slug.desc_id = "bm_wp_upg_a_slug_heavy_desc_sc"
		self.parts.wpn_fps_upg_quadbarrel_ammo_slug.stats = deep_clone(self.parts.wpn_fps_upg_a_slug.stats)
		self.parts.wpn_fps_upg_quadbarrel_ammo_slug.custom_stats = deep_clone(self.parts.wpn_fps_upg_a_slug.custom_stats)
	end	

	if self.wpn_fps_ass_tilt then -- Grocery's AN 92	
		self.parts.wpn_fps_ass_tilt_a_fuerte.pcs = nil		
		self.parts.wpn_fps_ass_tilt_mag_big.supported = true		
		self.parts.wpn_fps_ass_tilt_mag_big.stats = {
				value = 3,
				concealment = -3,
				extra_ammo = 30,
				reload = -3,
				spread = -1
			}	
		self.parts.wpn_fps_ass_tilt_mag_swift.supported = true	
		self.parts.wpn_fps_ass_tilt_mag_swift.stats = {
				value = 2,
				spread = -1,
				concealment = -1,
				reload = 3
			}						
		self.parts.wpn_fps_ass_tilt_mag_tactical.supported = true						
		self.parts.wpn_fps_ass_tilt_mag_tactical.stats = {
				value = 1,
				recoil = -2,
				concealment = 1
			}	
		self.parts.wpn_fps_ass_tilt_g_wood.supported = true	
		self.parts.wpn_fps_ass_tilt_g_wood.stats = {
				value = 2,
				spread = -1,
				recoil = 2
			}
		self.parts.wpn_fps_ass_tilt_g_wood.custom_stats = nil
		self.parts.wpn_fps_ass_tilt_stock_wood.supported = true
		self.parts.wpn_fps_ass_tilt_stock_wood.stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
		self.parts.wpn_fps_ass_tilt_stock_wood.custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)

		self.parts.wpn_fps_ass_tilt_stock_fold.supported = true
		self.parts.wpn_fps_ass_tilt_stock_fold.stats = deep_clone(stocks.fold_folder_stats)
		self.parts.wpn_fps_ass_tilt_stock_fold.custom_stats = deep_clone(stocks.fold_folder_stats)

		self.parts.wpn_fps_ass_tilt_stock_tactical.supported = true
		self.parts.wpn_fps_ass_tilt_stock_tactical.stats = deep_clone(stocks.folder_to_adj_acc2_stats)
		self.parts.wpn_fps_ass_tilt_stock_tactical.custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats)

		self.parts.wpn_fps_ass_tilt_stock_none.supported = true
		self.parts.wpn_fps_ass_tilt_stock_none.stats = deep_clone(stocks.remove_folder_stats)
		self.parts.wpn_fps_ass_tilt_stock_none.custom_stats = deep_clone(stocks.remove_folder_stats)
		end	
		
	if self.wpn_fps_shot_ks23 then 	-- Pawcio's KS-23	
		self.parts.wpn_fps_upg_ks23_ammo_slug.supported = true	
		self.parts.wpn_fps_upg_ks23_ammo_slug.desc_id = "bm_wp_upg_a_slug_heavy_desc_sc"
		self.parts.wpn_fps_upg_ks23_ammo_slug.stats = {
			value = 10,
			concealment = -3,
			total_ammo_mod = -25,
			damage = 30,	
			recoil = -20,
			spread = 12,
			spread_multi = {1, 1},	
			suppression = -1,
			moving_spread = 0
		}
		self.parts.wpn_fps_upg_ks23_ammo_slug.custom_stats = {
			muzzleflash = "effects/payday2/particles/weapons/762_auto_fps",																
			rays = 1,
			armor_piercing_add = 1,
			ammo_pickup_max_mul = 0.8,
			ammo_pickup_min_mul = 0.8,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			can_shoot_through_titan_shield = true,
			falloff_start_mult = 1.25,
			falloff_end_mult = 2.00,
			ads_speed_mult = 1.10
		}

		self.parts.wpn_fps_upg_ks23_barrel_short.supported = true
		self.parts.wpn_fps_upg_ks23_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_ks23_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_ks23_stock_pistolgrip.supported = true	
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip.stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip.custom_stats = deep_clone(stocks.remove_fixed_stats)

		self.parts.wpn_fps_upg_ks23_stock_pistolgrip_wire.supported = true
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip_wire.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_upg_ks23_stock_pistolgrip_wire.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)

		self.parts.wpn_fps_upg_ks23_ammo_buckshot_20pellet.pcs = nil
		self.parts.wpn_fps_upg_ks23_ammo_buckshot_8pellet.pcs = nil											
	end
		
	if self.parts.wpn_fps_upg_m4_m_x15drum then --Pawcio's M4 X 15 Drum Magazine
		self.parts.wpn_fps_upg_m4_m_x15drum.supported = true
		self.parts.wpn_fps_upg_m4_m_x15drum.stats = { 
			value = 3,
			concealment = -3,
			reload = -2,
			extra_ammo = 20
		}
		self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag20 = {
			supported = true,
			stats = {
				value = 3,
				concealment = -3,
				reload = -2,
				extra_ammo = 30
			}
		}				
	end	
		
	if self.wpn_fps_snp_winchester1894 then -- Pawcio's Winchester 1894				
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.has_description = false
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.supported = true
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.stats = {
				value = 2,
				spread = -1,
				concealment = -1,
				reload = 3
			}	
			self.parts.wpn_fps_upg_winchester1894_stock_shellholder.override_weapon_add = nil
	end										

	if self.wpn_fps_pis_amt then -- Matthelzor, Gambyt, >:3, and Alcat's Automag .44
			self.parts.wpn_fps_pis_amt_a_357.pcs = nil
			self.parts.wpn_fps_pis_amt_a_357.supported = true	
			self.parts.wpn_fps_pis_amt_a_357.stats = { value = 0 }
			self.parts.wpn_fps_pis_amt_a_357.custom_stats = nil

			self.parts.wpn_fps_pis_amt_a_44.pcs = nil
			self.parts.wpn_fps_pis_amt_a_44.supported = true	
			self.parts.wpn_fps_pis_amt_a_44.stats = { value = 0 }
			self.parts.wpn_fps_pis_amt_a_44.custom_stats = nil

			self.parts.wpn_fps_pis_amt_m_extended.supported = true		
			self.parts.wpn_fps_pis_amt_m_extended.stats = {
				value = 5,
				concealment = -3,
				reload = -4,
				extra_ammo = 6
			}
			self.parts.wpn_fps_pis_amt_m_extended.custom_stats = {
				ads_speed_mult = 1.075
			}	

			self.parts.wpn_fps_pis_amt_b_long.supported = true
			self.parts.wpn_fps_pis_amt_b_long.stats = deep_clone(barrels.long_b3_stats)
			self.parts.wpn_fps_pis_amt_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

			self.parts.wpn_fps_pis_amt_g_smooth.supported = true	
			self.parts.wpn_fps_pis_amt_g_smooth.stats = {
				value = 5,
				recoil = -2,
				concealment = 1
			}		
			self.parts.wpn_fps_pis_amt_g_smooth.custom_stats = {
				ads_speed_mult = 0.975
			}		

			self.parts.wpn_fps_pis_amt_g_rosewood.supported = true		
			self.parts.wpn_fps_pis_amt_g_rosewood.stats = {
				value = 10,
				recoil = 2,
				spread = -1
			}																					
	end

	--Gambyt's Toy M16
	if self.parts.wpn_fps_ass_toym16_b_standard then
		self.parts.wpn_fps_ass_toym16_b_standard.pcs = nil
	end

	--Gambyt's Vanilla Mod Pack
	if self.parts.wpn_fps_ass_flint_b_long then
		self.parts.wpn_fps_ass_s552_m_ak.supported = true
		self.parts.wpn_fps_ass_s552_m_ak.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_amcar.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_amcar.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_sg.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_sg.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick_heavy.supported = true
		self.parts.wpn_fps_ass_m4_m_stick_heavy.pcs = nil
		self.parts.wpn_fps_ass_m4_m_stick.supported = true
		self.parts.wpn_fps_ass_m4_m_stick.pcs = nil	--caliber conversions STINK	

		local foregrips = {
			"wpn_fps_vg_vmp_stubby",
			"wpn_fps_vg_vmp_stable",
			"wpn_fps_vg_vmp_medium",
			"wpn_fps_vg_vmp_cheems",
			"wpn_fps_vg_vmp_pod",
			"wpn_fps_vg_vmp_vert"
		}
		for i, part_id in ipairs(foregrips) do
			self.parts[ part_id ].supported = true
			self.parts[ part_id ].pcs = nil
			self.parts[ part_id ].stats = { value = 0 }
			self.parts[ part_id ].custom_stats = nil
		end

		table.insert(self.parts.wpn_upg_ak_s_psl.forbids, "wpn_fps_ass_flint_g_custom")			
		table.insert(self.wpn_fps_lmg_m60.uses_parts, "wpn_fps_upg_o_cqb")	
		self.wpn_fps_lmg_m60.override.wpn_fps_upg_o_cqb = {
			parent = "upper_reciever"
		}						
		table.insert(self.wpn_fps_lmg_par.uses_parts, "wpn_fps_upg_o_cqb")		
		self.wpn_fps_lmg_par.override.wpn_fps_upg_o_cqb = {
			parent = "upper_reciever"
		}				
		table.insert(self.wpn_fps_lmg_mg42.uses_parts, "wpn_fps_upg_o_cqb")		
		self.wpn_fps_lmg_mg42.override.wpn_fps_upg_o_cqb = {
			parent = "magazine_extra"
		}				
		table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_o_cqb")			
		table.insert(self.wpn_fps_lmg_m249.uses_parts, "wpn_fps_upg_o_cqb")		
		self.wpn_fps_lmg_m249.override.wpn_fps_upg_o_cqb = {
			parent = "upper_reciever"
		}		
		table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_o_cqb")						
		self.wpn_fps_lmg_rpk.adds.wpn_fps_upg_o_cqb = {"wpn_fps_ak_extra_ris"} --hk21 only meme is over
		self.wpn_fps_lmg_mg42.adds.wpn_fps_upg_o_cqb = {"wpn_fps_snp_mosin_rail"}
		self.wpn_fps_lmg_hk21.adds.wpn_fps_upg_o_cqb = {"wpn_fps_ass_g3_body_rail"}
		self.parts.wpn_fps_smg_mac10_fg_m4.supported = true
		self.parts.wpn_fps_pis_lebman_b_chrome_akimbo.supported = true
		
		--UAR Heavy Barrel
		self.parts.wpn_fps_aug_b_big.supported = true
		self.parts.wpn_fps_aug_b_big.pcs = {}
		self.parts.wpn_fps_aug_b_big.name_id = "bm_wp_upg_b_hbar"
		self.parts.wpn_fps_aug_b_big.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_aug_b_big.stats.recoil = 8
		self.parts.wpn_fps_aug_b_big.stats.concealment = -6
		self.parts.wpn_fps_aug_b_big.custom_stats = deep_clone(barrels.long_b2_custom_stats)
		self.parts.wpn_fps_aug_b_big.custom_stats.ads_speed_mult = 1.15

		--Theia Micro Sight
		self.parts.wpn_fps_upg_o_cqb.supported = true
		self.parts.wpn_fps_upg_o_cqb.desc_id = "bm_wp_upg_o_1_1"
		self.parts.wpn_fps_upg_o_cqb.stats = {
			value = 5,
			zoom = 1
		}

		--Karbin Stock
		self.parts.wpn_fps_ass_ak5_s_pts.pcs = nil
		self.parts.wpn_fps_ass_ak5_s_pts.supported = true
		self.parts.wpn_fps_ass_ak5_s_pts.stats = {
			--spread = 2,
			--recoil = -1,
			--concealment = -3,
			value = 0
		}

		--Stakeout Pump
		self.parts.wpn_fps_shot_beck_pump_custom.supported = true
		self.parts.wpn_fps_shot_beck_pump_custom.stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}

		--Classic Body
		self.parts.wpn_fps_ass_m14_body_old.supported = true
		self.parts.wpn_fps_ass_m14_body_old.stats = {
			value = 4,
			recoil = 2,
			spread = -1
		}

		--Desert Slide
		self.parts.wpn_fps_pis_beretta_sl_tan.supported = true
		self.parts.wpn_fps_pis_beretta_sl_tan.stats = {
			value = 3
		}

		--Aftermarket Stock
		self.parts.wpn_fps_pis_lebman_stock.supported = true
		self.parts.wpn_fps_pis_lebman_stock.stats = deep_clone(stocks.add_fixed_stats)
		self.parts.wpn_fps_pis_lebman_stock.custom_stats = deep_clone(stocks.add_fixed_stats)

		self.parts.wpn_fps_ass_aknato_b_long.supported = true
		self.parts.wpn_fps_ass_aknato_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_ass_aknato_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
		

		--Reaper Custom Frame (White Streak)
		self.parts.wpn_fps_pis_pl14_body_custom.supported = true
		self.parts.wpn_fps_pis_pl14_body_custom.stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}

		--(AK) Kalashnikov Ninja Stock
		self.parts.wpn_fps_upg_ak_s_polymerstock.pcs = {}
		self.parts.wpn_fps_upg_ak_s_polymerstock.supported = true
		self.parts.wpn_fps_upg_ak_s_polymerstock.stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats)
		self.parts.wpn_fps_upg_ak_s_polymerstock.custom_stats = deep_clone(stocks.nocheeks_to_fixed_acc2_rec2_stats)

		--(AK) Fugitive Foregrip
		self.parts.wpn_fps_ass_amcar_fg_covers_base.supported = true
		self.parts.wpn_fps_ass_amcar_fg_covers_base.stats = {
			recoil = -2,
			concealment = 1,
			value = 4
		}

		--(AK) Wrist Breaker Stock
		self.parts.wpn_fps_upg_ak_s_empty.supported = true
		self.parts.wpn_fps_upg_ak_s_empty.stats = deep_clone(stocks.remove_nocheeks_stats)
		self.parts.wpn_fps_upg_ak_s_empty.custom_stats = deep_clone(stocks.remove_nocheeks_stats)

		table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_ak_s_empty")
		table.insert(self.wpn_fps_smg_coal_npc.uses_parts, "wpn_fps_upg_ak_s_empty")		

		--(Reinbeck) SWAT Pump
		self.parts.wpn_fps_shot_beck_pump_swat.supported = true
		self.parts.wpn_fps_shot_beck_pump_swat.stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}

		--(Reinfeld) Swat Pump
		self.parts.wpn_fps_shot_r870_fg_swat.supported = true
		self.parts.wpn_fps_shot_r870_fg_swat.stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}		

		--Titanium Skeleton Grip
		self.parts.wpn_upg_ak_g_titanium.supported = true
		self.parts.wpn_upg_ak_g_titanium.custom_stats = {
			ads_speed_mult = 0.95
		}
		self.parts.wpn_upg_ak_g_titanium.stats = {
			spread = -1,
			recoil = -2,
			concealment = 2,
			value = 3
		}

		--(Crosskill Guard) Aftermarket Slide
		self.parts.wpn_fps_pis_shrew_sl_tt.supported = true
		self.parts.wpn_fps_pis_shrew_sl_tt.stats = {
			value = 1
		}

		--(Czech 92) Argent Slide
		self.parts.wpn_fps_pis_czech_sl_chrome.supported = true
		self.parts.wpn_fps_pis_czech_sl_chrome.stats = {
			value = 3
		}

		--(Vendetta .38) Extended Magazine
		--Visual agony
		self.parts.wpn_fps_pis_lebman_m_extended.supported = true
		self.parts.wpn_fps_pis_lebman_m_extended.stats = {
			value = 3,
			extra_ammo = 9,
			concealment = -1,
			reload = -3
		}

		--(Vendetta .38) Room Broom Kit
		self.parts.wpn_fps_pis_lebman_body_classic.supported = true
		self.parts.wpn_fps_pis_lebman_body_classic.stats = {
			value = 6,
			spread = -1,
			recoil = 2
		}

		--(Vendetta .38) Chrome Slide
		self.parts.wpn_fps_pis_lebman_b_chrome.supported = true
		self.parts.wpn_fps_pis_lebman_b_chrome.stats = {
			value = 3
		}

		--(Commando 553) Sniper Grip
		self.parts.wpn_fps_ass_s552_g_sniper.supported = true
		self.parts.wpn_fps_ass_s552_g_sniper.stats = {
			value = 2,
			spread = 1,
			recoil = 2,
			concealment = -2
		}

		--(Commando 553) Tactical Foregrip
		self.parts.wpn_fps_ass_s552_fg_tac.supported = true
		self.parts.wpn_fps_ass_s552_fg_tac.stats = {
			value = 7,
			spread = 1,
			concealment = -1
		}

		--(Commando 553) Sniper Stock		
		self.parts.wpn_fps_ass_s552_s_sniper.supported = true		
		self.parts.wpn_fps_ass_s552_s_sniper.stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)
		self.parts.wpn_fps_ass_s552_s_sniper.custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)


		--(Goliath 12G) Long Barrel
		self.parts.wpn_fps_sho_rota_b_longer.supported = true
		self.parts.wpn_fps_sho_rota_b_longer.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_sho_rota_b_longer.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Chimano 88) Bling Slide
		self.parts.wpn_fps_pis_g17_b_bling.supported = true
		self.parts.wpn_fps_pis_g17_b_bling.stats = {
			value = 1
		}

		--(IZHMA 12G) Smooth Receiver
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.supported = true
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.stats = {
			value = 1
		}			

		--(Microgun) Red Body
		self.parts.wpn_fps_lmg_shuno_body_red.supported = true
		self.parts.wpn_fps_lmg_shuno_body_red.stats = {
			value = 0
		}

		--Cylinder Foregrip
		self.parts.wpn_fps_ass_amcar_fg_cylinder.supported = true
		self.parts.wpn_fps_ass_amcar_fg_cylinder.stats = {
			value = 5,
			spread = 1,
			recoil = -2
		}

		--(Matever) Spiked Grip
		self.parts.wpn_fps_pis_2006m_g_pearl.supported = true
		self.parts.wpn_fps_pis_2006m_g_pearl.stats = {
			value = 2
		}

		--(Specops) Long Barrel
		self.parts.wpn_fps_smg_mp7_b_long.supported = true
		self.parts.wpn_fps_smg_mp7_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_mp7_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Uzi) Carbine Barrel
		self.parts.wpn_fps_smg_uzi_b_carbine.supported = true
		self.parts.wpn_fps_smg_uzi_b_carbine.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_uzi_b_carbine.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Jacket's Piece) Clean Hit Kit
		self.parts.wpn_fps_smg_cobray_body_upper_long.supported = true
		self.parts.wpn_fps_smg_cobray_body_upper_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_cobray_body_upper_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Leo Pistol) HS Convert Frame
		self.parts.wpn_fps_pis_hs2000_body_stealth.supported = true
		self.parts.wpn_fps_pis_hs2000_body_stealth.stats = {
			value = 1
		}

		--(Signature .40) Signature Chrome Frame
		self.parts.wpn_fps_pis_p226_body_silver.supported = true
		self.parts.wpn_fps_pis_p226_body_silver.stats = {
			value = 1
		}

		--(Jackal) Medium Barrel
		self.parts.wpn_fps_smg_schakal_b_uncivil.supported = true
		self.parts.wpn_fps_smg_schakal_b_uncivil.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_schakal_b_uncivil.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Kross Vertex) Long Barrel
		self.parts.wpn_fps_smg_polymer_barrel_long.supported = true
		self.parts.wpn_fps_smg_polymer_barrel_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_polymer_barrel_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Micro Uzi) Long Barrel
		self.parts.wpn_fps_smg_baka_b_long.supported = true
		self.parts.wpn_fps_smg_baka_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_baka_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--Heavy Compensator
		self.parts.wpn_fps_upg_ns_ass_smg_heavy.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_heavy.stats = deep_clone(muzzle_device.muzzle_acc2_stats)
		self.parts.wpn_fps_upg_ns_ass_smg_heavy.custom_stats = deep_clone(muzzle_device.muzzle_acc2_custom_stats)

		--(Claire 12G) Huntsman Barrel
		self.parts.wpn_fps_sho_coach_b_long.supported = true
		self.parts.wpn_fps_sho_coach_b_long.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_sho_coach_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		--(Lion's Roar) Urban Heat Kit
		self.parts.wpn_fps_ass_vhs_body_camo.supported = true
		self.parts.wpn_fps_ass_vhs_body_camo.stats = {
			value = 5,
			spread = 1,
			recoil = 2,
			concealment = -2
		}

		--HeistEye Target Marker
		self.parts.wpn_fps_upg_fl_ass_smg_sho_marker.supported = true
		self.parts.wpn_fps_upg_fl_ass_smg_sho_marker.stats = {
			value = 3,
			concealment = -2
		}

		--(Castigo) Smooth Cylinder
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.supported = true
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats = {
			value = 1				
		}

		--(M13) Chrome Slide
		self.parts.wpn_fps_pis_legacy_sl_chrome.supported = true
		self.parts.wpn_fps_pis_legacy_sl_chrome.stats = {
			value = 1
		}

		--(White Streak) Chrome Slide
		self.parts.wpn_fps_pis_pl14_sl_chrome.supported = true
		self.parts.wpn_fps_pis_pl14_sl_chrome.stats = {
			value = 1
		}

		--(Castigo) Largo Barrel
		self.parts.wpn_fps_pis_chinchilla_b_longboy.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_longboy.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_pis_chinchilla_b_longboy.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		--(CAR Family) Valkyrie Stock
		self.parts.wpn_fps_ass_m16_s_op.pcs = {}
		self.parts.wpn_fps_ass_m16_s_op.supported = true
		self.parts.wpn_fps_ass_m16_s_op.stats = deep_clone(stocks.adj_to_fixed_acc_stats)
		self.parts.wpn_fps_ass_m16_s_op.custom_stats = deep_clone(stocks.adj_to_fixed_acc_stats)

		--(Deagle) Steady Wooden Grip
		self.parts.wpn_fps_pis_deagle_g_wooden.supported = true
		self.parts.wpn_fps_pis_deagle_g_wooden.stats = deep_clone(stocks.add_fixed_stats)
		self.parts.wpn_fps_pis_deagle_g_wooden.custom_stats = deep_clone(stocks.add_fixed_stats)
		
		--(Peacemaker) Polymer Grip
		self.parts.wpn_fps_pis_peacemaker_g_black.supported = true
		self.parts.wpn_fps_pis_peacemaker_g_black.stats = {
			value = 1
		}

		--Rutted Receiver
		self.parts.wpn_fps_ass_74_upper_receiver_bump.supported = true
		self.parts.wpn_fps_ass_74_upper_receiver_bump.stats = {
			value = 1
		}

		--Plastic Handguard.
		self.parts.wpn_fps_ass_ak_fg_waffle.supported = true
		self.parts.wpn_fps_ass_ak_fg_waffle.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}

		--(Stryk) Striking Slide
		self.parts.wpn_fps_pis_g18c_b_long.supported = true
		self.parts.wpn_fps_pis_g18c_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_pis_g18c_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Bootleg) Anarchist Grip
		self.parts.wpn_fps_ass_tecci_vg_ergo.supported = true
		self.parts.wpn_fps_ass_tecci_vg_ergo.stats = {
			value = 1,
			spread = -1,
			concealment = 1
		}
		table.insert(self.wpn_fps_smg_mp7.uses_parts, "wpn_fps_ass_tecci_vg_ergo")
		table.insert(self.wpn_fps_smg_mp7_npc.uses_parts, "wpn_fps_ass_tecci_vg_ergo")	

		--(Loco) Railed Pump
		self.parts.wpn_fps_shot_shorty_fg_rail.supported = true
		self.parts.wpn_fps_shot_shorty_fg_rail.stats = {
			value = 1,
			recoil = -1,
			concealment = 1				
		}					

		--(Bootleg) SG Compact Stock
		--Repurposed to a fixed stock
		self.parts.wpn_fps_ass_tecci_s_minicontra.unit = "units/pd2_dlc_chico/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_s_standard"
		self.parts.wpn_fps_ass_tecci_s_minicontra.third_unit = "units/pd2_dlc_chico/weapons/wpn_third_ass_contraband_pts/wpn_third_ass_contraband_s_standard"
		self.parts.wpn_fps_ass_tecci_s_minicontra.name_id = "bm_wp_tecci_s_minicontra_alt"
		self.parts.wpn_fps_ass_tecci_s_minicontra.supported = true
		self.parts.wpn_fps_ass_tecci_s_minicontra.stats = deep_clone(stocks.adj_to_fixed_rec_stats)
		self.parts.wpn_fps_ass_tecci_s_minicontra.custom_stats = deep_clone(stocks.adj_to_fixed_rec_stats)

		table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_ass_tecci_s_minicontra")	
		table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_ass_amcar_npc.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_ass_sg416_npc.uses_parts, "wpn_fps_ass_tecci_s_minicontra")	
		table.insert(self.wpn_fps_smg_car9.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_smg_car9_npc.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_ass_tecci_s_minicontra")
		table.insert(self.wpn_fps_smg_olympic_npc.uses_parts, "wpn_fps_ass_tecci_s_minicontra")	

		--(AK17) Smooth Grip
		self.parts.wpn_fps_ass_flint_g_custom.supported = true
		self.parts.wpn_fps_ass_flint_g_custom.stats = {
			value = 2,
			recoil = -2,
			spread = 1
		}

		--Ratnik Stock
		--Disabled as I don't know how to make it not work on the 870s
		--Also I don't want to deal with another AR-15 buffer tube stock
		self.parts.wpn_fps_ass_m4_s_russian.pcs = nil
		self.parts.wpn_fps_ass_m4_s_russian.supported = true
		self.parts.wpn_fps_ass_m4_s_russian.stats = {}

		--(Castigo) Corto Barrel
		self.parts.wpn_fps_pis_chinchilla_b_short.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_pis_chinchilla_b_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)


		--(Castigo) Pearl Grip
		self.parts.wpn_fps_pis_chinchilla_g_pearl.supported = true
		self.parts.wpn_fps_pis_chinchilla_g_pearl.stats = {
			value = 1
		}

		--(Platypus) Discrete Stock
		self.parts.wpn_fps_snp_model70_s_discrete.supported = true
		self.parts.wpn_fps_snp_model70_s_discrete.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}

		--(Platypus) Scout Barrel
		self.parts.wpn_fps_snp_model70_b_smol.supported = true
		self.parts.wpn_fps_snp_model70_b_smol.stats = {
			value = 1,
			spread = -2,
			concealment = 2
		}

		--(Union 5.56) Medium Barrel
		self.parts.wpn_fps_ass_corgi_b_medium.supported = true
		self.parts.wpn_fps_ass_corgi_b_medium.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_ass_corgi_b_medium.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		--(Contractor) Long Barrel
		self.parts.wpn_fps_snp_tti_b_long.supported = true
		self.parts.wpn_fps_snp_tti_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_snp_tti_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Contractor) Shepheard Handguard
		self.parts.wpn_fps_snp_tti_fg_mpx.supported = true
		self.parts.wpn_fps_snp_tti_fg_mpx.stats = {
			recoil = 2,
			concealment = -1
		}



		--(Jacket's Piece) Overdose Magazine
		self.parts.wpn_fps_smg_cobray_m_extended.supported = true
		self.parts.wpn_fps_smg_cobray_m_extended.stats = {
			value = 2,
			extra_ammo = 12,
			concealment = -2,				
			reload = -3
		}
		self.parts.wpn_fps_smg_cobray_m_extended_akimbo.supported = true
		self.parts.wpn_fps_smg_cobray_m_extended_akimbo.stats = {
			value = 2,
			extra_ammo = 24,
			concealment = -2,				
			reload = -3
		}

		--(Eagle Heavy) Extended Magazine
		self.parts.wpn_fps_ass_scar_m_extended.supported = true
		self.parts.wpn_fps_ass_scar_m_extended.stats = {
			value = 2,
			extra_ammo = 10,
			concealment = -1,
			reload = -3
		}

		--(Broomstick) Snub Barrel
		--Doesn't actually seem to appear???
		self.parts.wpn_fps_pis_c96_b_short.supported = true
		self.parts.wpn_fps_pis_c96_b_short.stats = {
			value = 1,
			spread = -1,
			recoil = -2,
			concealment = 2
		}
		--self.parts.wpn_fps_pis_c96_b_short.custom_stats = nil -- just making sure these are removed.

		--(Chicago Typewriter) Refurbished Foregrip
		self.parts.wpn_fps_smg_thompson_fg_custom.supported = true
		self.parts.wpn_fps_smg_thompson_fg_custom.stats = {
			value = 1,
			recoil = 2,
			concealment = -1
		}

		--(Chicago Typewriter) Folding Stock
		self.parts.wpn_fps_smg_thompson_stock_fold.supported = true
		self.parts.wpn_fps_smg_thompson_stock_fold.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_smg_thompson_stock_fold.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)

		--(GSPS 12G) Ergo Stock
		self.parts.wpn_fps_shot_m37_s_ergo.supported = true
		self.parts.wpn_fps_shot_m37_s_ergo.stats = {
			spread = -1,
			value = 1,
			recoil = 2
		}

		--(GSPS 12G) Tactical Pump
		self.parts.wpn_fps_shot_m37_fg_tactical.supported = true
		self.parts.wpn_fps_shot_m37_fg_tactical.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}

		--(GSPS 12G) Combat Pump
		self.parts.wpn_fps_shot_m37_fg_long.supported = true
		self.parts.wpn_fps_shot_m37_fg_long.stats = {
			value = 1,
			recoil = 1,
			concealment = -2
		}

		--Schäfer Grip
		self.parts.wpn_fps_ass_m4_g_sg.supported = true
		self.parts.wpn_fps_ass_m4_g_sg.stats = {
			value = 2,
			concealment = -2,
			spread = 2
		}

		--(Nagant) Comfort Stock
		self.parts.wpn_fps_snp_mosin_body_grip.supported = true
		self.parts.wpn_fps_snp_mosin_body_grip.stats = {
			value = 1,
			recoil = 2,
			concealment = -1
		}

		--(Broomstick) Finned Barrel
		self.parts.wpn_fps_pis_c96_b_finned.supported = true
		self.parts.wpn_fps_pis_c96_b_finned.stats = {
			value = 2,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Peacemaker) Smooth Cylinder
		self.parts.wpn_fps_pis_peacemaker_m_smooth.supported = true
		self.parts.wpn_fps_pis_peacemaker_m_smooth.stats = {
			value = 2
		}

		--(Peacemaker) Lil' Yee-Haw
		if self.parts.wpn_fps_pis_peacemaker_hat then
			self.parts.wpn_fps_pis_peacemaker_hat.stance_mod = {
				wpn_fps_pis_peacemaker = {
					translation = Vector3(0, 0, -1.8)
				}
			}
		end

		--(Compact 5) Match Magazine
		self.parts.wpn_fps_smg_mp5_m_custom.supported = true
		self.parts.wpn_fps_smg_mp5_m_custom.stats = {
			value = 4,
			recoil = -2,
			concealment = 1
		}

		--Grievky Nozzle
		self.parts.wpn_fps_upg_ns_ass_smg_russian.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_russian.stats = deep_clone(muzzle_device.muzzle_rec2_stats)
		self.parts.wpn_fps_upg_ns_ass_smg_russian.custom_stats = deep_clone(muzzle_device.muzzle_rec2_custom_stats)

		--Assassin Suppressor
		self.parts.wpn_fps_upg_ns_pis_cloth.supported = true
		self.parts.wpn_fps_upg_ns_pis_cloth.stats = {
			value = 7,
			suppression = 12,
			alert_size = -1
		}

		--(Galant) Prototype Carbine Stock
		self.parts.wpn_fps_ass_ching_s_why.supported = true
		self.parts.wpn_fps_ass_ching_s_why.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_ass_ching_s_why.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)

		--(GSPS 12G) Hunting Barrel
		self.parts.wpn_fps_shot_m37_b_ridge.supported = true
		self.parts.wpn_fps_shot_m37_b_ridge.stats = {
			value = 1,
			spread = -1,
			recoil = 2
		}
		--(GSPS 12G) Folding Stock
		self.parts.wpn_fps_shot_m37_s_tactical.supported = true
		self.parts.wpn_fps_shot_m37_s_tactical.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_shot_m37_s_tactical.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_shot_m37_s_tactical_extra.stats = nil
		self.parts.wpn_fps_shot_m37_s_tactical_extra.custom_stats = nil

		--Trench Sweeper Nozzle
		self.parts.wpn_fps_upg_ns_shot_grinder.supported = true
		self.parts.wpn_fps_upg_ns_shot_grinder.stats = deep_clone(muzzle_device.muzzle_c_duo_stats)
		self.parts.wpn_fps_upg_ns_shot_grinder.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)

		--(Parabellum) Discrete Grip
		self.parts.wpn_fps_pis_breech_g_stealth.supported = true
		self.parts.wpn_fps_pis_breech_g_stealth.stats = {
			value = 2,
			concealment = 1,
			recoil = -2
		}

		--(Repeater 1874) Mare's Leg Barrel
		self.parts.wpn_fps_snp_winchester_b_short.supported = true
		self.parts.wpn_fps_snp_winchester_b_short.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_snp_winchester_b_short.stats.extra_ammo = -3
		self.parts.wpn_fps_snp_winchester_b_short.stats.concealment = 2
		self.parts.wpn_fps_snp_winchester_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
		self.parts.wpn_fps_snp_winchester_b_short.custom_stats.ads_speed_mult = 0.95

		--(Contractor) Bling Slide
		self.parts.wpn_fps_pis_packrat_sl_silver.supported = true
		self.parts.wpn_fps_pis_packrat_sl_silver.stats = {
			value = 6
		}

		--(AK17) Flint Magazine
		self.parts.wpn_fps_ass_flint_m_long.supported = true
		self.parts.wpn_fps_ass_flint_m_long.stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		}
		self.parts.wpn_fps_ass_flint_m_long.custom_stats = { ads_speed_mult = 1.05 }

		--(AK17) Short Barrel
		self.parts.wpn_fps_ass_flint_b_short.supported = true
		self.parts.wpn_fps_ass_flint_b_short.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_ass_flint_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)
		
		--(AK17) Long Barrel
		self.parts.wpn_fps_ass_flint_b_long.supported = true
		self.parts.wpn_fps_ass_flint_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_ass_flint_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)
		
		--(AK17) Marksman Stock
		self.parts.wpn_fps_ass_flint_s_solid.supported = true
		self.parts.wpn_fps_ass_flint_s_solid.stats = deep_clone(stocks.adj_to_fixed_rec_stats)
		self.parts.wpn_fps_ass_flint_s_solid.custom_stats = deep_clone(stocks.adj_to_fixed_rec_stats)

		--(Little Friend) Short Barrel
		self.parts.wpn_fps_ass_contraband_b_short.supported = true
		self.parts.wpn_fps_ass_contraband_b_short.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_ass_contraband_b_short.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		--(Little Friend) Long Barrel
		self.parts.wpn_fps_ass_contraband_b_long.supported = true
		self.parts.wpn_fps_ass_contraband_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_ass_contraband_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(Little Friend) Skeletal Stock
		self.parts.wpn_fps_ass_contraband_s_tecci.supported = true
		self.parts.wpn_fps_ass_contraband_s_tecci.stats = deep_clone(stocks.adj_to_nocheeks_stats)
		self.parts.wpn_fps_ass_contraband_s_tecci.custom_stats = deep_clone(stocks.adj_to_nocheeks_stats)
		self.parts.wpn_fps_ass_contraband_s_tecci.forbids = {"wpn_fps_upg_m4_s_adapter"}

		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_sg416_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_m4_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_m16_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_amcar_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_smg_olympic.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_smg_olympic_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_ass_tecci_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_smg_car9.uses_parts, "wpn_fps_ass_contraband_s_tecci")
		table.insert(self.wpn_fps_smg_car9_npc.uses_parts, "wpn_fps_ass_contraband_s_tecci")

		--(5/7 AP) Sport Barrel
		self.parts.wpn_fps_pis_lemming_b_long.supported = true
		self.parts.wpn_fps_pis_lemming_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_pis_lemming_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		--(5/7 AP) Striking Kit
		self.parts.wpn_fps_pis_lemming_body_silver.supported = true
		self.parts.wpn_fps_pis_lemming_body_silver.stats = {
			value = 4
		}


		--(Crosskill Classic) Wooden Grip
		self.parts.wpn_fps_pis_cold_g_wood.supported = true
		self.parts.wpn_fps_pis_cold_g_wood.stats = {
			value = 3
		}

		--(Crosskill Classic) Sneaky Frame
		self.parts.wpn_fps_pis_cold_body_custom.supported = true
		self.parts.wpn_fps_pis_cold_body_custom.stats = {
			value = 2,
			recoil = -2,
			concealment = 1
		}

		--(Crosskill Classic) Equalizer Compensator
		self.parts.wpn_fps_pis_cold_sl_comp1.supported = true
		self.parts.wpn_fps_pis_cold_sl_comp1.stats = {
			value = 7,
			spread = -2,
			recoil = 2
		}

		--(Crosskill Classic) Stonecold Compensator
		self.parts.wpn_fps_pis_cold_sl_comp2.supported = true
		self.parts.wpn_fps_pis_cold_sl_comp2.stats = {
			value = 4,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Crosskill Classic) Extended Magazine
		self.parts.wpn_fps_pis_cold_m_extended.supported = true
		self.parts.wpn_fps_pis_cold_m_extended.stats = {
			value = 2,
			concealment = -1,
			extra_ammo = 4,		
			reload = -2
		}

		--(Grom) Short Barrel
		self.parts.wpn_fps_snp_siltstone_b_short.supported = true
		self.parts.wpn_fps_snp_siltstone_b_short.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_snp_siltstone_b_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		--(Microgun) XL Barrel
		self.parts.wpn_fps_lmg_shuno_b_long.supported = true
		self.parts.wpn_fps_lmg_shuno_b_long.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_lmg_shuno_b_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		--(Signature) Long Foregrip
		self.parts.wpn_fps_smg_shepheard_body_long.supported = true
		self.parts.wpn_fps_smg_shepheard_body_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_shepheard_body_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Tempest 21) Long Barrel
		self.parts.wpn_fps_ass_komodo_b_long.supported = true
		self.parts.wpn_fps_ass_komodo_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_ass_komodo_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Crosskill) Classic Grip
		self.parts.wpn_fps_pis_1911_g_classic.supported = true
		self.parts.wpn_fps_pis_1911_g_classic.stats = {
			value = 2,
			spread = -1,
			recoil = 2	
		}

		--Sport Grip
		self.parts.wpn_fps_bow_ecp_s_bare.adds = { "wpn_fps_upg_m4_g_standard_vanilla" }
		self.parts.wpn_fps_ass_m4_g_fancy.supported = true
		self.parts.wpn_fps_ass_m4_g_fancy.unit = "units/pd2_dlc_ecp/weapons/wpn_fps_bow_ecp_pts/wpn_fps_bow_ecp_s_bare"
		self.parts.wpn_fps_ass_m4_g_fancy.visibility = {
			{
				objects = {
					g_stock_bare = false
				}
			}
		}
		self.parts.wpn_fps_ass_m4_g_fancy.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_ass_m4_g_fancy.custom_stats = {
			ads_speed_mult = 0.975
		}

		--(AMR-16) Aftermarket Marksman Foregrip
		self.parts.wpn_fps_ass_m16_fg_smooth.supported = true
		self.parts.wpn_fps_ass_m16_fg_smooth.adds = { "wpn_fps_ass_m4_os_frontsight" }
		self.parts.wpn_fps_ass_m16_fg_smooth.stats = {
			value = 5,
			concealment = 1,
			recoil = -2
		}

		--(GSPS 12G) Riot Sight 
		self.parts.wpn_fps_shot_m37_o_expert.supported = true 
		self.parts.wpn_fps_shot_m37_o_expert.stats = {
			value = 1
		}	

		--(Predator 12G) Short Barrel
		self.parts.wpn_fps_sho_b_spas12_small.supported = true
		self.parts.wpn_fps_sho_b_spas12_small.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_sho_b_spas12_small.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		--Modern Magazine
		self.parts.wpn_fps_ass_ak_m_proto.supported = true
		self.parts.wpn_fps_ass_ak_m_proto.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}

		--(AMR-12G) Big Brother Magazine
		self.parts.wpn_fps_shot_amr12_m_extended.supported = true
		self.parts.wpn_fps_shot_amr12_m_extended.stats = {
			value = 1, 
			extra_ammo = 5, 
			reload = -2, 
			concealment = -2
		}
		self.parts.wpn_fps_shot_amr12_m_extended.custom_stats = {
			ads_speed_mult = 1.05
		}
	
		--(AMR-12G) Wire Stock
		self.parts.wpn_fps_shot_amr12_s_wire.supported = true
		self.parts.wpn_fps_shot_amr12_s_wire.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_shot_amr12_s_wire.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)


		--(Spiker 7.62) Long Foregrip
		self.parts.wpn_fps_ass_spike_fg_long.supported = true
		self.parts.wpn_fps_ass_spike_fg_long.stats = {
			value = 5,
			recoil = 2,
			spread = -1
		}

		--(Spiker 7.62) Long Barrel 
		self.parts.wpn_fps_ass_spike_b_long.supported = true 
		self.parts.wpn_fps_ass_spike_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_ass_spike_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		if SystemFS:exists("assets/mod_overrides/AK Correct Magpul Assist Mags") then
			self.wpn_fps_ass_spike.override = self.wpn_fps_ass_spike.override or {}
			self.wpn_fps_ass_spike.override.wpn_fps_upg_ak_m_quick = self.wpn_fps_ass_spike.override.wpn_fps_upg_ak_m_quick or {}
			self.wpn_fps_ass_spike.override.wpn_fps_upg_ak_m_quick.unit = "units/mods/weapons/wpn_fps_ass_akm_m_magpul/wpn_fps_ass_akm_m_magpul"
		end


		--(SG-416) Long Barrel
		self.parts.wpn_fps_ass_sg416_b_long.supported = true
		self.parts.wpn_fps_ass_sg416_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_ass_sg416_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)
		self.parts.wpn_fps_ass_sg416_b_long.unit = "units/mods/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_b_long"
		self.parts.wpn_fps_ass_sg416_b_long.a_obj = "a_fg"

		--(SG 416) Schäfer Prototype Foregrip
		self.parts.wpn_fps_ass_sg416_fg_custom.supported = true
		self.parts.wpn_fps_ass_sg416_fg_custom.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}

		--SG416 default parts...
		self.parts.wpn_fps_ass_sg416_s_standard.supported = true
		self.parts.wpn_fps_ass_sg416_s_standard.stats = { value = 1 }
		self.parts.wpn_fps_ass_sg416_s_standard.unit = "units/payday2/weapons/wpn_fps_upg_m4_reusable/wpn_fps_upg_m4_s_standard"
		self.parts.wpn_fps_ass_sg416_s_standard.third_unit = "units/payday2/weapons/wpn_third_upg_m4_reusable/wpn_third_upg_m4_s_standard"

		self.parts.wpn_fps_ass_sg416_m_standard.supported = true
		self.parts.wpn_fps_ass_sg416_m_standard.stats = { value = 1 }
		self.parts.wpn_fps_ass_sg416_m_standard.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_m_std"
		self.parts.wpn_fps_ass_sg416_m_standard.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_m_std"
		self.parts.wpn_fps_ass_sg416_dh_custom.supported = true	
		self.parts.wpn_fps_ass_sg416_dh_custom.stats = { value = 0 }
		self.parts.wpn_fps_ass_sg416_o_standard.unit = "units/mods/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_long"
		self.parts.wpn_fps_ass_sg416_o_standard.stance_mod = {
			wpn_fps_ass_sg416 = {
				translation = Vector3(-0.08, 0, -0.35),
				rotation = Rotation(0.05, 0, 0)
			}
		}

		self.wpn_fps_ass_sg416.override.wpn_fps_upg_m4_g_standard_vanilla = {
			unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_g_standard",
			third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_g_standard"
		}
		self.wpn_fps_ass_sg416.override.wpn_fps_m4_uupg_b_medium_vanilla = {
			unit = "units/mods/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_b_short",
			a_obj = "a_fg"
		}
		self.wpn_fps_ass_sg416.override.wpn_fps_ass_contraband_b_short = {
			stats = deep_clone(barrels.short_b3_stats),
			custom_stats = deep_clone(barrels.short_b3_custom_stats),
			unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_standard",
			third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_standard",
			a_obj = "a_fg",
			forbids = {"wpn_fps_ass_sg416_fg_custom"},
			override = {
				wpn_fps_ass_sg416_fg_standard = {
					unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_fg_standard",
					third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_fg_standard"
				},
				wpn_fps_ass_sg416_o_standard = {
					unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_standard",
					third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_standard"
				}
			}
		}
		self.wpn_fps_ass_sg416.override.wpn_fps_ass_tecci_b_long = {
			stats = deep_clone(barrels.short_b1_stats),
			custom_stats = deep_clone(barrels.short_b1_custom_stats),
			unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_b_long",
			third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_b_long",
			a_obj = "a_fg",
			forbids = {"wpn_fps_ass_sg416_fg_custom"},
			override = {
				wpn_fps_ass_sg416_fg_standard = {
					unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_fg_standard",
					third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_third_ass_tecci_fg_standard"
				},
				wpn_fps_ass_sg416_o_standard = {
					unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_o_standard",
					third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_third_smg_shepheard_o_standard"
				}
			}
		}

		self.wpn_fps_ass_sg416.default_blueprint[9] = "wpn_fps_ass_contraband_ns_standard"
		self.wpn_fps_ass_sg416.uses_parts[18] = "wpn_fps_ass_contraband_ns_standard"

		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_m4_uupg_s_fold")
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_ass_m16_s_fixed")
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_upg_m4_m_drum")
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_ass_tecci_b_long")		
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_ass_contraband_b_short")		

		self.wpn_fps_ass_sg416_npc.override = deep_clone(self.wpn_fps_ass_sg416.override)	
		self.wpn_fps_ass_sg416_npc.uses_parts = deep_clone(self.wpn_fps_ass_sg416.uses_parts)	

		--[[
		table.insert(self.wpn_fps_ass_sg416.uses_parts, "wpn_fps_m4_uupg_m_std")
		self.wpn_fps_ass_sg416.override.wpn_fps_m4_uupg_m_std = {
			supported = true,
			stats = {
				value = 1
			}
		}
		--]]


		--(Automat-5) Long Barrel
		self.parts.wpn_fps_smg_ak5s_b_long.supported = true
		self.parts.wpn_fps_smg_ak5s_b_long.stats = {
			value = 3,
			spread = 1,
			recoil = -1,
			concealment = -1
		}

		--(Automat-5) Aftermarket Magazine
		self.parts.wpn_fps_smg_ak5s_m_new.supported = true
		self.parts.wpn_fps_smg_ak5s_m_new.stats = {
			value = 1,
			spread = 1,
			recoil = -2
		}

		--(Automat-5) Curved Magazine
		self.parts.wpn_fps_smg_ak5s_m_curve.supported = true
		self.parts.wpn_fps_smg_ak5s_m_curve.stats = {
			value = 2,
			reload = 3,
			spread = -1,
			concealment = -1
		}

		--(Automat-5) Match Magazine
		self.parts.wpn_fps_smg_ak5s_m_smol.supported = true
		self.parts.wpn_fps_smg_ak5s_m_smol.stats = {
			value = 1
		}
		
		--(Automat-5) Wrist Breaker Stock
		self.parts.wpn_fps_smg_ak5s_nostock.supported = true
		self.parts.wpn_fps_smg_ak5s_nostock.stats = deep_clone(stocks.remove_adj_stats)
		self.parts.wpn_fps_smg_ak5s_nostock.custom_stats = deep_clone(stocks.remove_adj_stats)


		--(Acar-9) Steel Barrel
		self.parts.wpn_fps_smg_car9_b_long.supported = true
		self.parts.wpn_fps_smg_car9_b_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_car9_b_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_smg_car9_b_standard.supported = true
		self.parts.wpn_fps_smg_car9_b_standard.stats = { value = 1 }

		--(ACAR-9) Extended Magazine
		self.parts.wpn_fps_smg_car9_m_extended.supported = true
		self.parts.wpn_fps_smg_car9_m_extended.stats = {
			value = 1,
			extra_ammo = 10,
			reload = -2,
			concealment = -1
		}

		--(ACAR-9) Hush Foregrip
		self.parts.wpn_fps_smg_car9_fg_rail.supported = true
		self.parts.wpn_fps_smg_car9_fg_rail.stats = {
			value = 2,
			recoil = -1,
			concealment = 1
		}

		--(Reinbeck) Classic Heat Barrel
		self.parts.wpn_fps_shot_beck_b_heat_dummy.supported = true
		self.parts.wpn_fps_shot_beck_b_heat_dummy.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}

		--(Reinbeck) Enforcer Stock
		self.parts.wpn_fps_shot_beck_s_tac.supported = true
		self.parts.wpn_fps_shot_beck_s_tac.stats = deep_clone(stocks.fixed_to_adj_dual_stats)
		self.parts.wpn_fps_shot_beck_s_tac.custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)

		--(Reinbeck) Ghost Stock
		self.parts.wpn_fps_shot_beck_s_wrist.supported = true
		self.parts.wpn_fps_shot_beck_s_wrist.stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_shot_beck_s_wrist.custom_stats = deep_clone(stocks.remove_fixed_stats)

		--(Reinbeck) Extended Tube
		self.parts.wpn_fps_shot_beck_ext.supported = true
		self.parts.wpn_fps_shot_beck_ext.stats = {
			value = 7,
			concealment = -1,
			extra_ammo = 2
		}

		--Continental Mag
		self.parts.wpn_fps_ass_m4_m_wick.supported = true
		self.parts.wpn_fps_ass_m4_m_wick.stats = {
			value = 2,
			concealment = 1,
			reload = 3,
			extra_ammo = -10
		}
		self.parts.wpn_fps_ass_m4_m_wick.custom_stats = { 
			ads_speed_mult = 0.975
		}

		--(Breaker 12G) Tactical Stock
		self.parts.wpn_fps_sho_boot_s_black.supported = true
		self.parts.wpn_fps_sho_boot_s_black.stats = deep_clone(stocks.add_nocheeks_stats)
		self.parts.wpn_fps_sho_boot_s_black.custom_stats = deep_clone(stocks.add_nocheeks_stats)

		--(JP36) Sniper Grip
		self.parts.wpn_fps_ass_g36_g_sniper.supported = true
		self.parts.wpn_fps_ass_g36_g_sniper.stats = {
			value = 2,
			spread = 1,
			concealment = -1
		}

		--(Bernetti 9) Desert Grip
		self.parts.wpn_fps_pis_beretta_g_tan.supported = true
		self.parts.wpn_fps_pis_beretta_g_tan.stats = {
			value = 4,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_pis_beretta_g_tan.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.parts.wpn_fps_ass_s552_o_custom.supported = true
		self.parts.wpn_fps_ass_s552_o_custom.stats = {
			value = 0
		}

		--(HRL-7) Very Subtble Grip
		self.parts.wpn_fps_rpg7_body_subtle.supported = true
		self.parts.wpn_fps_rpg7_body_subtle.stats = {
			value = 2,
			spread = -1,
			concealment = 1
		}
		self.parts.wpn_fps_rpg7_body_subtle.custom_stats = {
			movement_speed = 0.85
		}

		--(Eagle Heavy) Eagle Aftermarket Grip
		--Disabled
		self.parts.wpn_fps_ass_scar_g_tan.pcs = nil
		self.parts.wpn_fps_ass_scar_g_tan.supported = true
		self.parts.wpn_fps_ass_scar_g_tan.stats = {}			
		
		--Low Profile Compensator
		self.parts.wpn_fps_upg_pis_ns_edge.supported = true
		self.parts.wpn_fps_upg_pis_ns_edge.perks = nil
		self.parts.wpn_fps_upg_pis_ns_edge.desc_id = nil
		self.parts.wpn_fps_upg_pis_ns_edge.has_description = nil
		self.parts.wpn_fps_upg_pis_ns_edge.stats = deep_clone(muzzle_device.muzzle_b_stats)
		self.parts.wpn_fps_upg_pis_ns_edge.custom_stats = nil

		--(Reinbeck) Shell Rack
		self.parts.wpn_fps_shot_beck_shells.supported = true
		self.parts.wpn_fps_shot_beck_shells.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 1
		}

		--(Draco) Swift Magazine
		self.parts.wpn_fps_pis_smolak_m_custom.supported = true
		self.parts.wpn_fps_pis_smolak_m_custom.stats = {
			value = 1,
			spread = -1,
			concealment = -1,
			reload = 3
		}

		--(Guerilla .308) Sniper Stock
		self.parts.wpn_fps_snp_sgs_s_sniper.supported = true
		self.parts.wpn_fps_snp_sgs_s_sniper.stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)
		self.parts.wpn_fps_snp_sgs_s_sniper.custom_stats = deep_clone(stocks.folder_to_fixed_acc1_rec2_stats)

		--(Guerilla .308) Marksman Grip
		self.parts.wpn_fps_snp_sgs_g_black.supported = true
		self.parts.wpn_fps_snp_sgs_g_black.stats = { 
			value = 2,
			spread = 1,
			concealment = -1
		}

		--(Guerilla .308) Extended Barrel
		self.parts.wpn_fps_snp_sgs_b_long.supported = true
		self.parts.wpn_fps_snp_sgs_b_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_snp_sgs_b_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Guerilla .308) Suppressed Barrel
		self.parts.wpn_fps_snp_sgs_b_sil.supported = true
		self.parts.wpn_fps_snp_sgs_b_sil.stats = { 
			value = 5,
			suppression = 12,
			alert_size = -1
		}

		--(Guerilla .308) Scout foregrip
		self.parts.wpn_fps_snp_sgs_fg_rail.supported = true
		self.parts.wpn_fps_snp_sgs_fg_rail.stats = { 
			value = 4,
			concealment = 1,
			recoil = -2
		}

		--(Draco Pistol) Discreet Foregrip
		self.parts.wpn_fps_pis_smolak_fg_polymer.supported = true
		self.parts.wpn_fps_pis_smolak_fg_polymer.stats = {
			value = 1,
			concealment = 1,
			recoil = -2
		}

		--(AMR-12G) Enforcer Grip
		self.parts.wpn_fps_shot_amr12_fg_railed.supported = true
		self.parts.wpn_fps_shot_amr12_fg_railed.stats = {
			value = 7,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_shot_amr12_fg_railed.custom_stats = {}
		self.parts.wpn_fps_shot_amr12_fg_railed.adds = nil

		--(AMG-12G) Breacher Foregrip
		self.parts.wpn_fps_shot_amr12_fg_short.supported = true
		self.parts.wpn_fps_shot_amr12_fg_short.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_shot_amr12_fg_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)
		self.parts.wpn_fps_shot_amr12_fg_short.adds = nil

		self.parts.wpn_fps_shot_amr12_o_front.adds = nil
		self.parts.wpn_fps_shot_amr12_rail.adds = nil

		self.parts.wpn_fps_shot_amr12_b_standard.supported = true

		self.parts.wpn_fps_shot_amr12_b_standard.stats = {
			value = 1,
		}
		self.parts.wpn_fps_shot_amr12_b_standard.custom_stats = nil
		
		self.parts.wpn_fps_shot_amr12_o_front.stance_mod = {
			wpn_fps_shot_amr12 = {
				translation = Vector3(-0.1, -15, 0),
				rotation = Rotation(-0.1, 0.1, 0)
			}
		}

		self.wpn_fps_shot_amr12.override = {
			wpn_fps_upg_a_slug = a_slug_semi_override,
			wpn_fps_upg_a_custom = a_custom_semi_override,
			wpn_fps_upg_a_custom_free = a_custom_semi_override,			
			wpn_fps_upg_a_explosive = a_explosive_semi_override,
			wpn_fps_upg_a_rip = a_rip_semi_override,
			wpn_fps_upg_a_piercing = a_piercing_semi_override,
			wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_upg_m4_s_standard = {
			stats = deep_clone(stocks.fixed_to_adj_dual_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_m4_uupg_s_fold = {
			stats = deep_clone(stocks.fixed_to_folder_stats),
			custom_stats = deep_clone(stocks.fixed_to_folder_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_ass_contraband_s_tecci = {
			stats = deep_clone(stocks.fixed_to_nocheeks_stats),
			custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_smg_olympic_s_short = {
			stats = deep_clone(stocks.remove_fixed_stats),
			custom_stats = deep_clone(stocks.remove_fixed_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_ass_m16_s_op = {
			stats = deep_clone(stocks.fixed_acc_stats),
			custom_stats = deep_clone(stocks.fixed_acc_stats)
		}
		self.wpn_fps_shot_amr12.override.wpn_fps_m16_fg_standard = {
			adds = {}
		}

		table.insert(self.wpn_fps_shot_amr12.uses_parts, "wpn_fps_upg_i_singlefire")		
		table.insert(self.wpn_fps_shot_amr12.uses_parts, "wpn_fps_upg_i_autofire")		

		self.wpn_fps_shot_amr12_npc.override = deep_clone(self.wpn_fps_shot_amr12.override)	
		self.wpn_fps_shot_amr12_npc.uses_parts = deep_clone(self.wpn_fps_shot_amr12.uses_parts)	

		self.wpn_fps_shot_beck.override = {
			wpn_fps_upg_a_slug = a_slug_pump_override,
			wpn_fps_upg_a_custom = a_custom_pump_override,
			wpn_fps_upg_a_custom_free = a_custom_pump_override,			
			wpn_fps_upg_a_explosive = a_explosive_pump_override,
			wpn_fps_upg_a_rip = a_rip_pump_override,
			wpn_fps_upg_a_piercing = a_piercing_pump_override,
			wpn_fps_upg_a_dragons_breath = a_dragons_breath_pump_override
		}

		--(KSP 58) Aftermarket Rail
		self.parts.wpn_fps_lmg_par_rail.supported = true
		self.parts.wpn_fps_lmg_par_rail.stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}		
	end

	if self.wpn_fps_smg_owen then 	-- Silent Enforcer's Owen Gun		
			self.parts.wpn_fps_smg_owen_m_double.supported = true		
			self.parts.wpn_fps_smg_owen_m_double.stats = {
					value = 2,
					spread = -1,
					concealment = -1,
					reload = 3
				}														
			self.parts.wpn_fps_smg_owen_sling.supported = true														
			self.parts.wpn_fps_smg_owen_sling.stats = {
					value = 0
				}			
			self.parts.wpn_fps_smg_owen_s_wood.supported = true			
			self.parts.wpn_fps_smg_owen_s_wood.stats = {
					value = 2,
					recoil = 1,
					concealment = -1
				}
			self.parts.wpn_fps_smg_owen_s_no.supported = true
			self.parts.wpn_fps_smg_owen_s_no.stats = {
					value = 2,
					recoil = -2,
					concealment = 2
				}							
			self.parts.wpn_fps_smg_owen_low_window.supported = true							
			self.parts.wpn_fps_smg_owen_low_window.stats = {
					value = 1,
					spread = -1,
					concealment = 1						
				}															
			self.parts.wpn_fps_smg_owen_b_43.supported = true															
			self.parts.wpn_fps_smg_owen_b_43.stats = {
					value = 4,
					spread = -1,
					recoil = 1,
				}					
		end				

	if self.wpn_fps_ass_aek971 then -- Pawcio's AEK 971
		self.parts.wpn_fps_upg_aek971_stock_pad.supported = true
		self.parts.wpn_fps_upg_aek971_stock_pad.stats = {
			value = 1,				
			recoil = 1,
			spread = -1
		}
		self.parts.wpn_fps_upg_aek971_mag_rpk.supported = true
		self.parts.wpn_fps_upg_aek971_mag_rpk.stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -1
		}							
		self.parts.wpn_fps_upg_aek971_mag_magpul.supported = true							
		self.parts.wpn_fps_upg_aek971_mag_magpul.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 3
		}	
		self.parts.wpn_fps_upg_aek971_mag_magpul.has_description = false														
		self.parts.wpn_fps_upg_aek971_dtk1.supported = true														
		self.parts.wpn_fps_upg_aek971_dtk1.stats = {
			value = 5,
			suppression = -4,
			spread = -2,
			recoil = 2
		}	
		self.parts.wpn_fps_upg_aek971_supp_tgp_a.supported = true	
		self.parts.wpn_fps_upg_aek971_supp_tgp_a.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1,
			recoil = 1,
			concealment = -2
		}	
				
	end						

	if self.wpn_fps_smg_czevo then 	--Gambyt's Scorpion EVO
		self.parts.wpn_fps_smg_czevo_a_strong.pcs = nil
		self.parts.wpn_fps_smg_czevo_a_classic.pcs = nil	
		table.list_append(self.wpn_fps_smg_czevo.uses_parts, {
			"wpn_fps_upg_i_slower_rof"
		})
		table.list_append(self.wpn_fps_smg_czevo.uses_parts, {
			"wpn_fps_upg_i_faster_rof"
		})		
		self.parts.wpn_fps_smg_czevo_barrel_long.supported = true		
		self.parts.wpn_fps_smg_czevo_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_czevo_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_smg_czevo_vg_tti.supported = true	
		self.parts.wpn_fps_smg_czevo_vg_tti.stats = {
			value = 1,
			concealment = -2,
			recoil = 4,
		}					
		self.parts.wpn_fps_smg_czevo_vg_handstop.supported = true					
		self.parts.wpn_fps_smg_czevo_vg_handstop.stats = {
			value = 1,
			concealment = -1,
			recoil = 2,
		}		
		self.parts.wpn_fps_smg_czevo_vg_ptk.supported = true		
		self.parts.wpn_fps_smg_czevo_vg_ptk.stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}		
		self.parts.wpn_fps_smg_czevo_vg_angled.supported = true		
		self.parts.wpn_fps_smg_czevo_vg_angled.stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}																	
		self.parts.wpn_fps_smg_czevo_sight_troy.supported = true																	
		self.parts.wpn_fps_smg_czevo_sight_troy.stats = {
			value = 1
		}			
		self.parts.wpn_fps_smg_czevo_vg_cover.supported = true			
		self.parts.wpn_fps_smg_czevo_vg_cover.stats = {
			value = 1
		}					
		self.parts.wpn_fps_smg_czevo_mag_speed.pcs = nil
		self.parts.wpn_fps_smg_czevo_barrel_silenced.supported = true
		self.parts.wpn_fps_smg_czevo_barrel_silenced.stats = {
			value = 10,
			suppression = 12,
			alert_size = -1
		}
	end	

	if self.parts.wpn_fps_upg_o_prismatic then --Pawcio's SIGtac CP1
		self.parts.wpn_fps_upg_o_prismatic.supported = true
		self.parts.wpn_fps_upg_o_prismatic.stats = {
			concealment = -3,
			spread_moving = -3,
			zoom = 3,
			value = 5
		}
	end

	if self.parts.wpn_fps_upg_o_rmr_riser then --Pawcio's Trijicon RMR
		self.parts.wpn_fps_upg_o_rmr_riser.supported = true
		self.parts.wpn_fps_upg_o_rmr_riser.stats = {
			concealment = 0,
			zoom = 0,
			value = 0
		}
	end

	if self.parts.wpn_fps_upg_o_pkas then --Pawcio's PKA-S
		self.parts.wpn_fps_upg_o_pkas.supported = true
		self.parts.wpn_fps_upg_o_pkas.stats = {
			concealment = -1,
			spread_moving = -1,
			zoom = 1,
			value = 3
		}
	end

	if self.parts.wpn_fps_upg_o_m145 then --Pawcio's ELCAN C79
		self.parts.wpn_fps_upg_o_m145.supported = true
		self.parts.wpn_fps_upg_o_m145.stats = {
			concealment = -5,
			spread_moving = -5,
			zoom = 5,
			value = 8
		}
	end

	if self.parts.wpn_fps_upg_o_anpas13d then --Pawcio's ANPAS-13D Night Vision
		self.parts.wpn_fps_upg_o_anpas13d.supported = true
		self.parts.wpn_fps_upg_o_anpas13d.stats = {
			concealment = -3,
			spread_moving = -3,
			zoom = 3,
			value = 5
		}
	end

	if self.parts.wpn_fps_upg_o_pn23 then --Silent Enforcer's PN 23 Night
		self.parts.wpn_fps_upg_o_pn23.supported = true
		self.parts.wpn_fps_upg_o_pn23.stats = {
			concealment = -5,
			spread_moving = -5,
			zoom = 5,
			value = 8
		}
	end

	if self.parts.wpn_fps_gre_arbiter_o_smart then --Alcat's Arbiter Scope
		self.parts.wpn_fps_gre_arbiter_o_smart.supported = true
		self.parts.wpn_fps_gre_arbiter_o_smart.stats = {
			spread = 2,
			concealment = -4
		}
		self.parts.wpn_fps_gre_arbiter_o_smart.has_description = true
		self.parts.wpn_fps_gre_arbiter_o_smart.forbids = {"wpn_fps_upg_a_grenade_launcher_incendiary_arbiter"}
	end		

	if self.parts.wpn_fps_upg_o_compm4s then --Pawcio's Aimpoint Comp M4s Sight
		self.parts.wpn_fps_upg_o_compm4s.supported = true
		self.parts.wpn_fps_upg_o_compm4s.stats = {
				value = 3,
				zoom = 5
			}			
		end


	if self.parts.wpn_fps_ass_komodo_o_tele then --Alcat's F2000 Sight
		self.parts.wpn_fps_ass_komodo_o_tele.supported = true
		self.parts.wpn_fps_ass_komodo_o_tele.stats = {
			value = 1
			}			
		end	

	if self.parts.wpn_fps_upg_o_snp_m4flipup_rear then --Pawcio's Ironsights Pack
		self.parts.wpn_fps_upg_o_snp_m4flipup_rear.supported = true
		self.parts.wpn_fps_upg_o_snp_m4flipup_rear.stats = {
			value = 0
			}		
		self.parts.wpn_fps_upg_o_snp_mbus_rear.supported = true		
		self.parts.wpn_fps_upg_o_snp_mbus_rear.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_o_snp_troy_rear.supported = true
		self.parts.wpn_fps_upg_o_snp_troy_rear.stats = {
			value = 0
			}			
		self.parts.wpn_fps_upg_o_snp_troym4_rear.supported = true			
		self.parts.wpn_fps_upg_o_snp_troym4_rear.stats = {
			value = 0
			}								
		self.parts.wpn_fps_upg_o_snp_scorpionevo_rear.supported = true								
		self.parts.wpn_fps_upg_o_snp_scorpionevo_rear.stats = {
			value = 0
			}				
		self.parts.wpn_fps_upg_o_snp_kac_rear.supported = true				
		self.parts.wpn_fps_upg_o_snp_kac_rear.stats = {
			value = 0
			}				
		self.parts.wpn_fps_upg_o_snp_dd_a1_rear.supported = true				
		self.parts.wpn_fps_upg_o_snp_dd_a1_rear.stats = {
			value = 0
			}											
		end			
		
	if self.parts.wpn_fps_upg_1911_tritium then --Pawcio's Illuminated Ironsights Pack
		self.parts.wpn_fps_upg_b92fs_tritium.supported = true
		self.parts.wpn_fps_upg_b92fs_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_1911_tritium.supported = true	
		self.parts.wpn_fps_upg_1911_tritium.stats = {
			value = 0
			}		
		self.parts.wpn_fps_upg_beer_tritium.supported = true		
		self.parts.wpn_fps_upg_beer_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_czech_tritium.supported = true	
		self.parts.wpn_fps_upg_czech_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_deagle_tritium.supported = true	
		self.parts.wpn_fps_upg_deagle_tritium.stats = {
			value = 0
			}	
		self.parts.wpn_fps_upg_p226_tritium.supported = true	
		self.parts.wpn_fps_upg_p226_tritium.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_pl14_tritium.supported = true
		self.parts.wpn_fps_upg_pl14_tritium.stats = {
			value = 0
			}
		self.parts.wpn_fps_upg_shrew_tritium.supported = true
		self.parts.wpn_fps_upg_shrew_tritium.stats = {
			value = 0
			}																							
		self.parts.wpn_fps_upg_stech_tritium.supported = true																							
		self.parts.wpn_fps_upg_stech_tritium.stats = {
			value = 0
			}																											
		end
					
	if self.parts.wpn_fps_upg_o_compm2 then --Pawcio's Aimpoint Comp M2 Sight		
		self.parts.wpn_fps_upg_o_compm2.supported = true		
		self.parts.wpn_fps_upg_o_compm2.stats = {
				value = 3,
				zoom = 5
			}		
		end				

	if self.parts.wpn_fps_upg_o_okp7_dove then --Pawcio's Russian Sight Pack 
		self.parts.wpn_fps_upg_o_okp7_dove.supported = true 
		self.parts.wpn_fps_upg_o_okp7_dove.stats = {
			value = 3,
			zoom = 2	
			}	
		self.parts.wpn_fps_upg_o_pso1.supported = true	
		self.parts.wpn_fps_upg_o_pso1.stats = {
			value = 8,
			zoom = 40
			}				
		self.parts.wpn_fps_upg_o_pso1_rifle.supported = true				
		self.parts.wpn_fps_upg_o_pso1_rifle.stats = {
			value = 8,
			zoom = 40
			}	
		self.parts.wpn_fps_upg_o_1pn93.supported = true	
		self.parts.wpn_fps_upg_o_1pn93.stats = {
			value = 8,
			zoom = 30
			}	
		self.parts.wpn_fps_upg_o_ekp_1s_03.supported = true	
		self.parts.wpn_fps_upg_o_ekp_1s_03.stats = {
			value = 3,
			zoom = 2	
			}									
		self.parts.wpn_fps_upg_o_1p29.supported = true									
		self.parts.wpn_fps_upg_o_1p29.stats = {
			value = 8,
			zoom = 30
			}															
		end	

	--Silent Killer Pack Welrod
	if self.parts.wpn_fps_pis_welrod_a_ap then
		self.parts.wpn_fps_pis_welrod_a_ap.pcs = nil --Disable AP bullets.

		--Short barrel
		self.parts.wpn_fps_pis_welrod_b_short.supported = true
		self.parts.wpn_fps_pis_welrod_b_short.stats = {
			value = 3,
			suppression = -1,
			spread = -1,
			concealment = 1
		}
		self.parts.wpn_fps_pis_welrod_b_short.has_description = nil

		--Trigger Guard
		self.parts.wpn_fps_pis_welrod_trigger_guard.supported = true
		self.parts.wpn_fps_pis_welrod_trigger_guard.stats = {
			value = 1
		}

		--Illuminated Iron Sights
		self.parts.wpn_fps_pis_welrod_glow.supported = true
	end

	--Silent Killer Pack PB
	if self.parts.wpn_fps_pis_pb_ns_std then
		self.parts.wpn_fps_pis_pb_ns_std.supported = true
		self.parts.wpn_fps_pis_pb_ns_std.stats = {
			value = 4,
			suppression = 1,
			spread = 1,
			recoil = -1,
			concealment = -1
		}
	end

	--Silent Killer Pack Max9
	if self.parts.wpn_fps_pis_max9_b_short then
		self.parts.wpn_fps_pis_max9_b_short.supported = true
		self.parts.wpn_fps_pis_max9_b_short.stats = {
			value = 5,
			suppression = -1,
			recoil = -1,
			concealment = 1
		}
		self.parts.wpn_fps_pis_max9_b_short.has_description = nil

		self.parts.wpn_fps_pis_max9_b_nosup.supported = true
		self.parts.wpn_fps_pis_max9_b_nosup.stats = {
			value = 5,
			alert_size = 1,
			suppression = -12,
			recoil = -1,
			spread = -1,
			concealment = 2
		}
		self.parts.wpn_fps_pis_max9_b_nosup.has_description = nil
	end

	--Vanilla Mod Pack Volume 2 Support
	if self.parts.wpn_fps_smg_uzi_b_longue then
		--(Uzi) Striker Barrel
		self.parts.wpn_fps_smg_uzi_b_longue.supported = true
		self.parts.wpn_fps_smg_uzi_b_longue.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_uzi_b_longue.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(RPK) Lightweight combo Magazine
		self.parts.wpn_lmg_rpk_m_jungle.supported = true
		self.parts.wpn_lmg_rpk_m_jungle.stats = {
			value = 6,
			spread = -1,
			concealment = 4,
			reload = 6,
			extra_ammo = -45
		}
		self.parts.wpn_lmg_rpk_m_jungle.custom_stats = {
			ads_speed_mult = 0.9
		}

		--(Holt 9mm) Luxury Grip
		self.parts.wpn_fps_pis_holt_g_wrap.supported = true
		self.parts.wpn_fps_pis_holt_g_wrap.stats = {
			value = 6,
			recoil = 1,
			concealment = 1,
			spread = -2
		}

		--(R700) Hunting Stock
		self.parts.wpn_fps_snp_r700_s_redwood.supported = true
		self.parts.wpn_fps_snp_r700_s_redwood.stats = {
			value = 4,
			concealment = 1,
			spread = -1
		}
		self.parts.wpn_fps_snp_r700_s_redwood.override.wpn_fps_snp_model70_iron_sight = {
			adds = {"wpn_fps_bow_ecp_o_iron"}
		}		

		--(R700) Low Profile Iron Sight
		self.parts.wpn_fps_snp_r700_o_is.supported = true
		self.parts.wpn_fps_snp_r700_o_is.stats = {
			value = 1,
			zoom = 1
		}
		
		--(Bernetti Rangehitter) Mare's Leg Barrel
		self.parts.wpn_fps_snp_sbl_b_stub.supported = true
		self.parts.wpn_fps_snp_sbl_b_stub.stats = {
			value = 2,
			spread = -1,
			concealment = 2,
			extra_ammo = -1
		}		
		self.parts.wpn_fps_snp_sbl_b_stub.custom_stats = deep_clone(barrels.short_b1_custom_stats)
		self.parts.wpn_fps_snp_sbl_b_stub.custom_stats.ads_speed_mult = 0.95

		--(Czech 92) Angled Grip
		self.parts.wpn_fps_pis_czech_body_afg.pcs = nil
		self.parts.wpn_fps_pis_czech_body_afg.supported = true
		self.parts.wpn_fps_pis_czech_body_afg.stats = {
			value = 1
		}
		
		--(Cobra) Solid Wooden Stock
		self.parts.wpn_fps_smg_scorpion_s_wood.supported = true
		self.parts.wpn_fps_smg_scorpion_s_wood.stats = deep_clone(stocks.folded_to_fixed_stats)		
		self.parts.wpn_fps_smg_scorpion_s_wood.custom_stats = deep_clone(stocks.folded_to_fixed_stats)		

		--(Heather) Aftermarket Vertical Grip
		self.parts.wpn_fps_smg_sr2_vg_custom.supported = true
		self.parts.wpn_fps_smg_sr2_vg_custom.stats = {
			value = 3,
			spread = 1,
			recoil = -2
		}

		--(Compact 5) Combat Stock
		self.parts.wpn_fps_smg_mp5_s_m4.supported = true
		self.parts.wpn_fps_smg_mp5_s_m4.stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		self.parts.wpn_fps_smg_mp5_s_m4.custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)

		self.parts.wpn_fps_smg_mp5_s_m4_dummy = deep_clone(self.parts.wpn_fps_smg_mp5_s_m4)
		self.parts.wpn_fps_smg_mp5_s_m4_dummy.pcs = nil		
		self.parts.wpn_fps_smg_mp5_s_m4_dummy.stats = { value = 1 }
		self.parts.wpn_fps_smg_mp5_s_m4_dummy.custom_stats = nil
		self.parts.wpn_fps_smg_mp5_s_m4_dummy.adds = nil
		if not self.wpn_fps_smg_mp5.override then
			self.wpn_fps_smg_mp5.override = {}
		end
		self.wpn_fps_smg_mp5.stock_adapter = "wpn_upg_ak_s_adapter"
		self.wpn_fps_smg_mp5_npc.stock_adapter = "wpn_upg_ak_s_adapter"
		self.wpn_fps_smg_mp5.override.wpn_upg_ak_s_adapter = {
			adds = {"wpn_fps_smg_mp5_s_m4_dummy"}
		}
		self.wpn_fps_smg_mp5_npc.override = deep_clone(self.wpn_fps_smg_mp5.override)
		
		self.parts.wpn_fps_bdgr_covers.adds = {}

		--(Hornet .300) Bumblebee Foregrip
		self.parts.wpn_fps_bdgr_uupg_fg_railed.supported = true
		self.parts.wpn_fps_bdgr_uupg_fg_railed.adds = {"wpn_fps_bdgr_covers"}
		self.parts.wpn_fps_bdgr_uupg_fg_railed.override.wpn_fps_bdgr_b_sd = {
			unit = "units/mods/weapons/wpn_fps_ass_bdgr_pts/wpn_fps_bdgr_b_sd_railed",
			third_unit = "units/mods/weapons/wpn_third_ass_bdgr_pts/wpn_third_bdgr_b_sd_railed",
			a_obj = "a_fg"
		}
		self.parts.wpn_fps_bdgr_uupg_fg_railed.stats = {
			value = 4,
			recoil = 2,
			concealment = -1
		}
		--(Hornet .300) Wasp foregrip
		self.parts.wpn_fps_bdgr_uupg_fg_small.supported = true
		self.parts.wpn_fps_bdgr_uupg_fg_small.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_bdgr_uupg_fg_small.custom_stats = deep_clone(barrels.short_b2_custom_stats)
		self.parts.wpn_fps_bdgr_uupg_fg_small.unit = "units/payday2/weapons/wpn_fps_smg_olympic_pts/wpn_fps_smg_olympic_fg_railed"
		self.parts.wpn_fps_bdgr_uupg_fg_small.third_unit = "units/payday2/weapons/wpn_third_smg_olympic_pts/wpn_third_smg_olympic_fg_railed"
		self.parts.wpn_fps_bdgr_uupg_fg_small.override.wpn_fps_bdgr_b_sd = {
			unit = "units/mods/weapons/wpn_fps_ass_bdgr_pts/wpn_fps_bdgr_b_sd_small",
			third_unit = "units/mods/weapons/wpn_third_ass_bdgr_pts/wpn_third_bdgr_b_sd_small",
			a_obj = "a_fg"
		}

		self.parts.wpn_fps_bdgr_uupg_fg_std.unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_fg_rail"
		self.parts.wpn_fps_bdgr_uupg_fg_std.third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_fg_rail"
		self.parts.wpn_fps_bdgr_uupg_fg_std.override = {
			wpn_fps_bdgr_b_sd = {
				a_obj = "a_fg"
			}
		}

		self.wpn_fps_ass_bdgr.override = {
			wpn_fps_smg_olympic_s_adjust = {
				unit = "units/mods/weapons/wpn_fps_ass_contraband_pts/wpn_fps_ass_contraband_s_tecci"
			}
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_upg_m4_s_standard = {
			stats = deep_clone(stocks.nocheeks_to_adj_dual_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_adj_dual_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.nocheeks_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_adj_acc_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.nocheeks_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_adj_rec_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc1_rec2_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_hvy_acc2_rec1_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_m4_uupg_s_fold = {
			stats = deep_clone(stocks.nocheeks_to_folder_stats),
			custom_stats = deep_clone(stocks.nocheeks_to_folder_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_smg_olympic_s_short = {
			stats = deep_clone(stocks.remove_nocheeks_stats),
			custom_stats = deep_clone(stocks.remove_nocheeks_stats)
		}
		self.wpn_fps_ass_bdgr.override.wpn_fps_ass_contraband_s_tecci = {
			stats = {},
			custom_stats = {}
		}
		table.insert(self.wpn_fps_ass_bdgr.uses_parts, "wpn_fps_smg_olympic_s_short")
		table.insert(self.wpn_fps_ass_bdgr_npc.uses_parts, "wpn_fps_smg_olympic_s_short")
		table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_s_fold")
		table.insert(self.wpn_fps_ass_amcar_npc.uses_parts, "wpn_fps_m4_uupg_s_fold")	

		self.wpn_fps_ass_bdgr_npc.override = deep_clone(self.wpn_fps_ass_bdgr.override)
		self.wpn_fps_ass_bdgr_npc.uses_parts = deep_clone(self.wpn_fps_ass_bdgr.uses_parts)


		--(M60) Long Barrel
		self.parts.wpn_fps_lmg_m60_b_longer.supported = true
		self.parts.wpn_fps_lmg_m60_b_longer.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_lmg_m60_b_longer.custom_stats = deep_clone(barrels.long_b3_custom_stats)
		
		--Wrapped Grip
		self.parts.wpn_fps_m4_g_wrap.supported = true
		self.parts.wpn_fps_m4_g_wrap.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}

		--Polygonal Suppressor
		self.parts.wpn_fps_upg_ns_shot_flat.supported = true
		self.parts.wpn_fps_upg_ns_shot_flat.stats = deep_clone(muzzle_device.supp_b_alt_stats)
		self.parts.wpn_fps_upg_ns_shot_flat.custom_stats = deep_clone(muzzle_device.muzzle_b_alt_custom_stats)

		--Professional Suppressor
		self.parts.wpn_fps_upg_ns_ass_smg_pro.supported = true
		self.parts.wpn_fps_upg_ns_ass_smg_pro.stats = deep_clone(muzzle_device.supp_c_duo_stats)
		self.parts.wpn_fps_upg_ns_ass_smg_pro.custom_stats = deep_clone(muzzle_device.muzzle_c_duo_custom_stats)

		--(Jacket's Piece) Foldable Stock
		self.parts.wpn_fps_smg_cobray_s_custom.supported = true
		self.parts.wpn_fps_smg_cobray_s_custom.stats = {
			value = 0
		}

		--Modern Bolt
		self.parts.wpn_fps_ak_bolt_chrome.supported = true
		self.parts.wpn_fps_ak_bolt_chrome.stats = {
			value = 2,
			recoil = 1,
			concealment = -2
		}

		--(Patchett L2A1) Extended Barrel
		self.parts.wpn_fps_smg_sterling_b_poke.supported = true
		self.parts.wpn_fps_smg_sterling_b_poke.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_sterling_b_poke.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Parabellum) Langer Barrel
		self.parts.wpn_fps_pis_breech_b_length.supported = true
		self.parts.wpn_fps_pis_breech_b_length.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_pis_breech_b_length.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--Constrictor Nozzle
		self.parts.wpn_fps_upg_ns_shot_close.supported = true
		self.parts.wpn_fps_upg_ns_shot_close.stats = deep_clone(muzzle_device.muzzle_acc2_stats)
		self.parts.wpn_fps_upg_ns_shot_close.custom_stats = deep_clone(muzzle_device.muzzle_acc2_custom_stats)

		--(OVE9000 Saw) Ripper Blade
		self.parts.wpn_fps_saw_m_blade_scream.supported = true
		self.parts.wpn_fps_saw_m_blade_scream.keep_damage = true
		self.parts.wpn_fps_saw_m_blade_scream.stats = {
			value = 1,
			extra_ammo = -5,
			damage = 30,
			total_ammo_mod = -25
		}

		--(Compact-5) Package Deal Magazines
		self.parts.wpn_fps_smg_mp5_m_dos.supported = true
		self.parts.wpn_fps_smg_mp5_m_dos.stats = {
			value = 6,
			spread = -1,
			concealment = -1,
			reload = 3
		}

		self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_dos = {
			stats = {
				value = 6,
				spread = -1,
				concealment = -1,
				reload = 3
			}
		}

		--(GSPS 12G) High Capacity Barrel
		self.parts.wpn_fps_shot_m37_b_extend.supported = true
		self.parts.wpn_fps_shot_m37_b_extend.stats = {
			value = 7,
			extra_ammo = 2,
			concealment = -1
		}
		self.parts.wpn_fps_shot_m37_b_extend.custom_stats = {
			ads_speed_mult = 1.025
		}

		--(MP40) Langer Barrel
		self.parts.wpn_fps_smg_erma_b_langer.supported = true
		self.parts.wpn_fps_smg_erma_b_langer.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_smg_erma_b_langer.custom_stats = deep_clone(barrels.long_b1_custom_stats)


		--(MP40) Kurz Barrel
		self.parts.wpn_fps_smg_erma_b_kurz.supported = true
		self.parts.wpn_fps_smg_erma_b_kurz.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_smg_erma_b_kurz.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		--(Pistol Crossbow) Ergo Handle
		self.parts.wpn_fps_bow_hunter_body_swift.supported = true
		self.parts.wpn_fps_bow_hunter_body_swift.stats = {
			value = 5,
			reload = 1,
			concealment = -2
		}

		--(Repeater 1874) Outlaw Frame
		self.parts.wpn_fps_snp_winchester_body_bling.supported = true
		self.parts.wpn_fps_snp_winchester_body_bling.stats = {
			value = 2
		}

		--(Bernetti Auto) Expert Slide
		self.parts.wpn_fps_pis_beer_sl_expert.supported = true
		self.parts.wpn_fps_pis_beer_sl_expert.stats = {
			value = 2
		}

		--(Locomotive 12G) Trench Boom Barrel
		self.parts.wpn_fps_shot_r870_b_ithaca.supported = true
		self.parts.wpn_fps_shot_r870_b_ithaca.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_shot_r870_b_ithaca.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		--(Reinbeck Auto) Shell Rack
		self.parts.wpn_fps_shot_minibeck_shells.supported = true
		self.parts.wpn_fps_shot_minibeck_shells.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 2
		}

		--(Reinbeck Auto) Extended Tube
		self.parts.wpn_fps_shot_minibeck_ext.supported = true
		self.parts.wpn_fps_shot_minibeck_ext.stats = {
			value = 3,
			extra_ammo = 1,
			concealment = -1,
		}

		--(Reinbeck Auto) Solid Stock
		self.parts.wpn_fps_shot_minibeck_s_solid.supported = true
		self.parts.wpn_fps_shot_minibeck_s_solid.stats = deep_clone(stocks.add_fixed_stats)
		self.parts.wpn_fps_shot_minibeck_s_solid.custom_stats = deep_clone(stocks.add_fixed_stats)

		--(Holt 9mm) Silver Slide
		self.parts.wpn_fps_pis_holt_b_silver.supported = true
		self.parts.wpn_fps_pis_holt_b_silver.stats = {
			value = 7
		}

		--(Signature SMG) Ergo Grip
		self.parts.wpn_fps_smg_shepheard_g_ergo.supported = true
		self.parts.wpn_fps_smg_shepheard_g_ergo.stats = {
			value = 3,
			spread = 1,
			recoil = -2
		}

		--(Gruber Kurz) Expert Barrel
		self.parts.wpn_fps_pis_ppk_b_standard_expert.supported = true
		self.parts.wpn_fps_pis_ppk_b_standard_expert.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_pis_ppk_b_standard_expert.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Bronco .44) Arbitrator Grip
		self.parts.wpn_fps_pis_rage_g_fancy.supported = true
		self.parts.wpn_fps_pis_rage_g_fancy.stats = {
			value = 4,
			spread = 1,
			concealment = -1
		}

		--(Castigo .44) Feroz Barrel
		self.parts.wpn_fps_pis_chinchilla_b_rage.supported = true
		self.parts.wpn_fps_pis_chinchilla_b_rage.stats = {
			value = 4,
			recoil = 2,
			spread = -1
		}

		--(Piglet) Overcompensating Barrel
		self.parts.wpn_fps_gre_m32_barrel_extreme.supported = true
		self.parts.wpn_fps_gre_m32_barrel_extreme.stats = {
			value = 6,
			spread = 1,
			concealment = -3
		}

		--(Valkyria Rifle) Heatsinked Barrel
		self.parts.wpn_fps_ass_asval_b_heat.supported = true
		self.parts.wpn_fps_ass_asval_b_heat.stats = {
			value = 4,
			spread = -1,
			recoil = 2
		}

		--(M1014) Wrist Remover Grip
		self.parts.wpn_fps_sho_ben_s_fracture.supported = true
		self.parts.wpn_fps_sho_ben_s_fracture.stats = deep_clone(stocks.remove_adj_stats)
		self.parts.wpn_fps_sho_ben_s_fracture.custom_stats = deep_clone(stocks.remove_adj_stats)
		--Expanded Magazine
		self.parts.wpn_fps_m4_uupg_m_extend.supported = true
		self.parts.wpn_fps_m4_uupg_m_extend.stats = {
			extra_ammo = 10,
			concealment = -1,
			reload = -1
		}
		self.parts.wpn_fps_m4_uupg_m_extend.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_m4_uupg_m_extend_akimbo.supported = true
		self.parts.wpn_fps_m4_uupg_m_extend_akimbo.stats = {
			extra_ammo = 20,
			concealment = -1,
			spread = -1
		}

		self.parts.wpn_fps_ass_asval_o_oldrail.supported = true
		self.parts.wpn_fps_ass_asval_o_oldrail.stats = {
			value = 2
		}

		--Point Shoot Module
		self.parts.wpn_fps_upg_fl_ass_smg_sho_pointshoot.desc_id = "bm_wp_upg_o_angled_laser_desc"
		self.parts.wpn_fps_upg_fl_ass_smg_sho_pointshoot.has_description = true
		self.parts.wpn_fps_upg_fl_ass_smg_sho_pointshoot.supported = true
		self.parts.wpn_fps_upg_fl_ass_smg_sho_pointshoot.stats = {
			value = 5,
			gadget_zoom = 1
		}

		--(M308) Mini 308 Magazine
		self.parts.wpn_fps_ass_m14_m_curve.supported = true
		self.parts.wpn_fps_ass_m14_m_curve.stats = {
			value = 1
		}

		--(GSPS 12) Hunting Sight
		self.parts.wpn_fps_shot_m37_o_classic.supported = true
		self.parts.wpn_fps_shot_m37_o_classic.stats = {
			value = 1
		}

		--(GSPS 12) Long Range Sight
		self.parts.wpn_fps_shot_m37_o_circle.supported = true
		self.parts.wpn_fps_shot_m37_o_circle.stats = {
			value = 1,
			zoom = 1
		}

		--(Frenchman) Smooth Cylinder
		self.parts.wpn_fps_pis_model3_cylinder_smooth.supported = true

		--(Compact 5)
		self.parts.wpn_fps_smg_mp5_m_small.supported = true
		self.parts.wpn_fps_smg_mp5_m_small.stats = {
			value = 2,
			concealment = 1,
			reload = 3,
			extra_ammo = -10
		}
		self.parts.wpn_fps_smg_mp5_m_small.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_small = {
			stats = {
				value = 2,
				concealment = 1,
				reload = 3,
				extra_ammo = -20
			}
		}

		--(Compact 5) Adjusted Stock
		self.parts.wpn_fps_smg_mp5_s_adjusted.supported = true
		self.parts.wpn_fps_smg_mp5_s_adjusted.stats = deep_clone(stocks.fixed_to_folded_stats)
		self.parts.wpn_fps_smg_mp5_s_adjusted.custom_stats = deep_clone(stocks.fixed_to_folded_stats)

		table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjusted")
		table.insert(self.wpn_fps_ass_g3_npc.uses_parts, "wpn_fps_smg_mp5_s_adjusted")
		table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_smg_mp5_s_adjusted")
		table.insert(self.wpn_fps_lmg_hk21_npc.uses_parts, "wpn_fps_smg_mp5_s_adjusted")

		--(Compact 5) Marksman Foregrip
		self.parts.wpn_fps_smg_mp5_fg_long.supported = true
		self.parts.wpn_fps_smg_mp5_fg_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_smg_mp5_fg_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		--(Jackal) Solid Stock
		self.parts.wpn_fps_smg_schakal_s_solid.supported = true
		self.parts.wpn_fps_smg_schakal_s_solid.stats = deep_clone(stocks.folder_to_fixed_rec3_stats)
		self.parts.wpn_fps_smg_schakal_s_solid.custom_stats = deep_clone(stocks.folder_to_fixed_rec3_stats)

		--(Jackal) Lightweight Stock
		self.parts.wpn_fps_smg_schakal_s_hollow.supported = true
		self.parts.wpn_fps_smg_schakal_s_hollow.stats = deep_clone(stocks.folder_acc_stats)
		self.parts.wpn_fps_smg_schakal_s_hollow.custom_stats = deep_clone(stocks.folder_acc_stats)

		--(Jackal) Tactical Stock
		self.parts.wpn_fps_smg_schakal_s_recon.supported = true
		self.parts.wpn_fps_smg_schakal_s_recon.stats = deep_clone(stocks.folder_rec_stats)
		self.parts.wpn_fps_smg_schakal_s_recon.custom_stats = deep_clone(stocks.folder_rec_stats)

		self.wpn_fps_shot_minibeck.override = {
			wpn_fps_upg_a_slug = a_slug_semi_override,
			wpn_fps_upg_a_custom = a_custom_semi_override,
			wpn_fps_upg_a_custom_free = a_custom_semi_override,			
			wpn_fps_upg_a_explosive = a_explosive_semi_override,
			wpn_fps_upg_a_rip = a_rip_semi_override,
			wpn_fps_upg_a_piercing = a_piercing_semi_override,
			wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
		}
		
		--Hammer 23 short barrel
		self.parts.wpn_fps_shot_bs23_barrel_short.supported = true
		self.parts.wpn_fps_shot_bs23_barrel_short.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_shot_bs23_barrel_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		--Hammer 23 Sturdy Wooden Stock
		self.parts.wpn_fps_shot_bs23_stock_full.supported = true
		self.parts.wpn_fps_shot_bs23_stock_full.stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
		self.parts.wpn_fps_shot_bs23_stock_full.custom_stats = deep_clone(stocks.nocheeks_to_fixed_rec3_stats)
		
		--Hammer 23 Hazardous stock
		self.parts.wpn_fps_shot_bs23_stock_none.supported = true
		self.parts.wpn_fps_shot_bs23_stock_none.stats = deep_clone(stocks.remove_nocheeks_stats)
		self.parts.wpn_fps_shot_bs23_stock_none.custom_stats = deep_clone(stocks.remove_nocheeks_stats)
		
		self.parts.wpn_fps_shot_bs23_rec_sight_rear.stance_mod = {
			wpn_fps_shot_bs23 = {
				translation = Vector3(-0.05, -8, 0.5),
				rotation = Rotation(0, 2, 0)
			}
		}
		self.parts.wpn_fps_shot_bs23_rec_sight_rear.stats = {
			value = 1
		}		
		
		--Hammer 23 ammo stuff
		self.wpn_fps_shot_bs23.override = {
			wpn_fps_upg_a_explosive = {
				supported = true,
				stats = {
					value = 10,
					recoil = -25,
					spread = 5,
					concealment = -5,
					spread_multi = {1, 1},	
					total_ammo_mod = -50,
					damage = 90
				},
				custom_stats = {
					ignore_statistic = true,
					block_b_storm = true,
					rays = 1,
					bullet_class = "InstantExplosiveBulletBase",
					sms = 0.85
				}
			}
		}		
		
	end

	--HX25 Grenade Launcher
	if self.parts.wpn_fps_upg_hx25_sight_iron_il then
		self.parts.wpn_fps_upg_hx25_sight_iron_il.supported = true
		self.parts.wpn_fps_upg_hx25_sight_iron_il.stats = {
			value = 1
		}

		self.parts.wpn_fps_upg_hx25_buckshot_ammo.supported = true
		self.parts.wpn_fps_upg_hx25_buckshot_ammo.desc_id = "bm_hx25_buck_sc_desc"
		self.parts.wpn_fps_upg_hx25_buckshot_ammo.pcs = nil

		if not self.wpn_fps_gre_hx25.override then
			self.wpn_fps_gre_hx25.override = {}
		end

		self.wpn_fps_gre_hx25.override.wpn_fps_upg_hx25_buckshot_ammo = {
			supported = true,
			stats = {
				value = 10
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 7,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
		
		self.wpn_fps_gre_hx25.override.wpn_fps_gre_hx25_explosive_ammo = {
			supported = true,
			stats = {
				value = 10
			},
			custom_stats = {
				ignore_statistic = true,
				block_b_storm = true,
				rays = 7,
				bullet_class = "InstantExplosiveBulletBase"
			}
		}
	end

	--M41A Pulse Rifle
	if self.parts.wpn_fps_upg_xeno_stock_ext then
		self.parts.wpn_fps_upg_xeno_stock_ext.supported = true
		self.parts.wpn_fps_upg_xeno_stock_ext.stats = deep_clone(stocks.unfold_folded_stats)
		self.parts.wpn_fps_upg_xeno_stock_ext.custom_stats = deep_clone(stocks.unfold_folded_stats)

		self.parts.wpn_fps_ass_xeno_underbarrel_gl.supported = true
		--self.parts.wpn_fps_ass_xeno_underbarrel_gl.adds = {"wpn_fps_ass_xeno_underbarrel_gl_ammo"}

		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo = deep_clone(self.parts.wpn_fps_ass_contraband_g_standard)
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.pcs = nil
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.type = "underbarrel_ammo"
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.stats = { value = 0 }
		self.parts.wpn_fps_ass_xeno_underbarrel_gl_ammo.custom_stats = {
			launcher_grenade = "launcher_frag_arbiter"
		} 
	end

	--Pawcio's Mosin Obrez Parts
	if self.parts.wpn_fps_snp_mosin_body_obrez then
		self.parts.wpn_fps_snp_mosin_body_obrez.supported = true
		self.parts.wpn_fps_snp_mosin_body_obrez.stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_snp_mosin_body_obrez.custom_stats = deep_clone(stocks.remove_fixed_stats)

		self.parts.wpn_fps_snp_mosin_b_obrez.supported = true
		self.parts.wpn_fps_snp_mosin_b_obrez.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_snp_mosin_b_obrez.stats.bayonet_range = -50
		self.parts.wpn_fps_snp_mosin_b_obrez.custom_stats = deep_clone(barrels.short_b3_custom_stats)
		self.parts.wpn_fps_snp_mosin_b_obrez.custom_stats.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
	end

	--Rex's Bubba Mosin Parts
	if self.parts.wpn_fps_snp_mosin_barrel_bubba then
		self.parts.wpn_fps_snp_mosin_body_bubba.supported = true
		self.parts.wpn_fps_snp_mosin_body_bubba.stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_snp_mosin_body_bubba.stats.extra_ammo = 10
		self.parts.wpn_fps_snp_mosin_body_bubba.stats.concealment = 2
		self.parts.wpn_fps_snp_mosin_body_bubba.custom_stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_snp_mosin_body_bubba.custom_stats.ads_speed_mult = 0.95
		self.parts.wpn_fps_snp_mosin_body_bubba.custom_stats.sms = 0.8

		self.parts.wpn_fps_snp_mosin_bayonet_bubba.supported = true
		self.parts.wpn_fps_snp_mosin_bayonet_bubba.stats = {
			value = 5,
			concealment = -5,
			max_damage = 6,
			min_damage = 6,
			max_damage_effect = 1,
			min_damage_effect = 1,
			bayonet_range = 50
		}
		self.parts.wpn_fps_snp_mosin_bayonet_bubba.custom_stats = {
			ads_speed_mult = 1.125
		}

		self.parts.wpn_fps_snp_mosin_barrel_bubba.supported = true
		self.parts.wpn_fps_snp_mosin_barrel_bubba.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_snp_mosin_barrel_bubba.stats.bayonet_range = -50
		self.parts.wpn_fps_snp_mosin_barrel_bubba.custom_stats = deep_clone(barrels.short_b3_custom_stats)
		self.parts.wpn_fps_snp_mosin_barrel_bubba.custom_stats.muzzleflash = "effects/payday2/particles/weapons/big_51b_auto_fps"
	end

	--Pawcio's M200
	if self.parts.wpn_fps_snp_m200_barrel then
		self.parts.wpn_fps_upg_m200_barrel_med.supported = true
		self.parts.wpn_fps_upg_m200_barrel_med.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_m200_barrel_med.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		self.parts.wpn_fps_upg_m200_barrel_short.supported = true
		self.parts.wpn_fps_upg_m200_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_m200_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_m200_bipod.supported = true
		self.parts.wpn_fps_upg_m200_bipod.stats = { value = 0 }
		self.parts.wpn_fps_upg_m200_bipod.custom_stats = nil
		self.parts.wpn_fps_upg_m200_bipod_fold.supported = true
		self.parts.wpn_fps_upg_m200_bipod_fold.stats = { value = 0 }
		self.parts.wpn_fps_upg_m200_bipod_fold.custom_stats = nil

		self.parts.wpn_fps_upg_m200_supp.has_description = true
		self.parts.wpn_fps_upg_m200_supp.desc_id = "bm_wp_upg_suppressor"
		self.parts.wpn_fps_upg_m200_supp.supported = true
		self.parts.wpn_fps_upg_m200_supp.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_m200_supp.custom_stats = nil
		self.parts.wpn_fps_upg_m200_supp.perks = {"silencer"}
		
		table.insert(self.wpn_fps_snp_m200.uses_parts, "wpn_fps_upg_i_iw_widowmaker")	
		table.insert(self.wpn_fps_snp_m200_npc.uses_parts, "wpn_fps_upg_i_iw_widowmaker")	
	end

	--Pawcio's M107
	if self.parts.wpn_fps_upg_m107cq_ammo_416 then
		self.parts.wpn_fps_upg_m107cq_ammo_416.pcs = nil
		self.parts.wpn_fps_upg_m107cq_ammo_416.supported = true
		self.parts.wpn_fps_upg_m107cq_ammo_416.stats = { value = 0 }
		self.parts.wpn_fps_upg_m107cq_ammo_416.custom_stats = nil

		self.parts.wpn_fps_upg_m107cq_barrel_long.supported = true
		self.parts.wpn_fps_upg_m107cq_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_m107cq_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_upg_m107cq_barrel_supp.has_description = true
		self.parts.wpn_fps_upg_m107cq_barrel_supp.desc_id = "bm_wp_upg_suppressor"
		self.parts.wpn_fps_upg_m107cq_barrel_supp.supported = true
		self.parts.wpn_fps_upg_m107cq_barrel_supp.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_m107cq_barrel_supp.custom_stats = nil
		self.parts.wpn_fps_upg_m107cq_barrel_supp.perks = {"silencer"}

		self.parts.wpn_fps_upg_m107cq_bipod.supported = true
		self.parts.wpn_fps_upg_m107cq_bipod.stats = { value = 0}
		self.parts.wpn_fps_upg_m107cq_bipod.custom_stats = nil

		self.parts.wpn_fps_upg_m107cq_iron_sights.supported = true
		self.parts.wpn_fps_upg_m107cq_iron_sights.stats = { value = 0 }
		self.parts.wpn_fps_upg_m107cq_iron_sights.custom_stats = nil
	end

	--Pawcio's Musket
	if self.parts.wpn_fps_snp_musket_lead then
		self.parts.wpn_fps_snp_musket_lead.pcs = nil
		self.parts.wpn_fps_snp_musket_lead.supported = true
		self.parts.wpn_fps_snp_musket_lead.stats = { value = 0 }
		self.parts.wpn_fps_snp_musket_lead.custom_stats = nil

		self.wpn_fps_snp_musket.adds = { 
			wpn_fps_upg_o_specter = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_aimpoint = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_aimpoint_2 = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_docter = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_eotech = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_t1micro = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_cmore = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_acog = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_cs = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_eotech_xps = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_reflex = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_rx01 = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_rx30 = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_spot = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_bmg = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_uh = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_fc1 = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_tf90 = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_upg_o_poe = { "wpn_fps_snp_model70_o_rail" },
			wpn_fps_snp_model70_iron_sight = { "wpn_fps_snp_model70_o_rail", "wpn_fps_gre_arbiter_o_standard" }
		}
		self.wpn_fps_snp_musket_npc.adds = deep_clone(self.wpn_fps_snp_musket.adds)

		if not self.wpn_fps_snp_musket.override then
			self.wpn_fps_snp_musket.override = {}
		end
		self.wpn_fps_snp_musket.override.wpn_fps_snp_model70_iron_sight = {
			forbids = {}
		}


		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_snp_model70_iron_sight")	
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_specter")	
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_aimpoint")	
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_docter")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_eotech")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_t1micro")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_rx30")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_rx01")	
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_reflex")	
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_eotech_xps")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_cmore")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_aimpoint_2")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_acog")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_cs")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_spot")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_bmg")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_uh")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_fc1")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_tf90")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_o_poe")

		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_peqbox")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_smg_sho_surefire")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_utg")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_peq15")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_laser")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_fl_ass_laser")

		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ass_ns_battle")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ass_ns_jprifles")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ass_ns_linear")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ass_ns_surefire")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ns_ass_smg_tank")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_ass_shak12_ns_muzzle")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_upg_ns_ass_smg_v6")
		table.insert(self.wpn_fps_snp_musket.uses_parts, "wpn_fps_lmg_hk51b_ns_jcomp")

		self.wpn_fps_snp_musket_npc.uses_parts = deep_clone(self.wpn_fps_snp_musket.uses_parts)
	end

	if self.parts.wpn_fps_ass_xr2_grip then --KillerKrayola + Pawcio + splish's BO3 XR-2
		self.parts.wpn_fps_upg_xr2_barrel_01.supported = true
		self.parts.wpn_fps_upg_xr2_barrel_01.has_description = nil
		self.parts.wpn_fps_upg_xr2_barrel_01.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_xr2_barrel_01.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_upg_xr2_barrel_02.supported = true
		self.parts.wpn_fps_upg_xr2_barrel_02.has_description = nil
		self.parts.wpn_fps_upg_xr2_barrel_02.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_xr2_barrel_02.custom_stats = deep_clone(barrels.short_b2_custom_stats)


		self.parts.wpn_fps_upg_xr2_handguard_01.supported = true
		self.parts.wpn_fps_upg_xr2_handguard_01.stats = {
			value  = 2,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_xr2_handguard_02.supported = true
		self.parts.wpn_fps_upg_xr2_handguard_02.stats = {
			value  = 2,
			recoil = -2,
			concealment = 1
		}

		self.parts.wpn_fps_upg_xr2_ns_01.supported = true
		self.parts.wpn_fps_upg_xr2_ns_01.stats = {
			value  = 2,
			recoil = 2,
			spread = -1
		}
		self.parts.wpn_fps_upg_xr2_ns_02.supported = true
		self.parts.wpn_fps_upg_xr2_ns_02.stats = {
			value  = 2,
			recoil = -2,
			concealment = 1
		}

		self.parts.wpn_fps_upg_xr2_handle_01.supported = true
		self.parts.wpn_fps_upg_xr2_handle_01.name_id = "bm_wp_xr2_handle_01_sc"
		self.parts.wpn_fps_upg_xr2_handle_01.has_description = true
		self.parts.wpn_fps_upg_xr2_handle_01.desc_id = "bm_xr2_handle_01_sc_desc"
		self.parts.wpn_fps_upg_xr2_handle_01.stats = {
			value  = 2,
			recoil = 4
		}
		self.parts.wpn_fps_upg_xr2_handle_01.custom_stats = {
			xr2_auto = true
		}
		self.parts.wpn_fps_upg_xr2_handle_02.supported = true
		self.parts.wpn_fps_upg_xr2_handle_02.name_id = "bm_wp_xr2_handle_02_sc"
		self.parts.wpn_fps_upg_xr2_handle_02.has_description = true
		self.parts.wpn_fps_upg_xr2_handle_02.desc_id = "bm_xr2_handle_02_sc_desc"
		self.parts.wpn_fps_upg_xr2_handle_02.stats = {
			value  = 4
		}
		self.parts.wpn_fps_upg_xr2_handle_02.custom_stats = {
			xr2_rapidfire = true
		}

		self.parts.wpn_fps_upg_xr2_stock_01.supported = true
		self.parts.wpn_fps_upg_xr2_stock_01.stats = {
			value  = 3,
			recoil = -4,
			concealment = 2
		}

		self.parts.wpn_fps_upg_xr2_upperrec_01.supported = true
		self.parts.wpn_fps_upg_xr2_upperrec_01.has_description = nil
		self.parts.wpn_fps_upg_xr2_upperrec_01.stats = {
			value  = 3,
			recoil = -2,
			spread = 1
		}
		self.parts.wpn_fps_upg_xr2_upperrec_02.perks = nil

		self.parts.wpn_fps_upg_xr2_upperrec_02.supported = true
		self.parts.wpn_fps_upg_xr2_upperrec_02.has_description = nil
		self.parts.wpn_fps_upg_xr2_upperrec_02.stats = {
			value  = 3,
			recoil = 2,
			concealment= -1
		}
		self.parts.wpn_fps_upg_xr2_upperrec_02.perks = nil

		self.parts.wpn_fps_upg_xr2_grip_01.supported = true
		self.parts.wpn_fps_upg_xr2_grip_01.stats = {
			value  = 1,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_xr2_grip_02.supported = true
		self.parts.wpn_fps_upg_xr2_grip_02.stats = {
			value  = 1,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_xr2_grip_02.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.parts.wpn_fps_upg_xr2_mag_ext_01.supported = true
		self.parts.wpn_fps_upg_xr2_mag_ext_01.has_description = nil
		self.parts.wpn_fps_upg_xr2_mag_ext_01.stats = {
			value = 5,
			extra_ammo = 12,
			spread = -1,
			concealment = -2,
		}
		self.parts.wpn_fps_upg_xr2_mag_ext_01.custom_stats = {
			ads_speed_mult = 1.05
		}
		self.parts.wpn_fps_upg_xr2_mag_ext_02.supported = true
		self.parts.wpn_fps_upg_xr2_mag_ext_02.has_description = nil
		self.parts.wpn_fps_upg_xr2_mag_ext_02.stats = {
			value = 3,
			extra_ammo = 12,
			concealment = -1,
			reload = -3
		}
		self.parts.wpn_fps_upg_xr2_mag_ext_02.custom_stats = {
			ads_speed_mult = 1.025
		}
		self.parts.wpn_fps_upg_xr2_mag_fast_01.supported = true
		self.parts.wpn_fps_upg_xr2_mag_fast_01.has_description = nil
		self.parts.wpn_fps_upg_xr2_mag_fast_01.stats = {
			value = 1,
			spread = -1,
			concealment = -1,
			reload = 3
		}

		self.parts.wpn_fps_ass_xr2_vertgrip.supported = true
		self.parts.wpn_fps_ass_xr2_vertgrip.stats = { value = 0 }

		self.parts.wpn_fps_upg_xr2_vg_generic_01.supported = true
		self.parts.wpn_fps_upg_xr2_vg_generic_01.stats = {
			value = 1,
			reload = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_xr2_vg_xr2_02.supported = true
		self.parts.wpn_fps_upg_xr2_vg_xr2_02.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_xr2_vg_m8a7_02.supported = true
		self.parts.wpn_fps_upg_xr2_vg_m8a7_02.stats = {
			value = 3,
			recoil = 4,
			concealment = -2
		}

		if not self.wpn_fps_ass_xr2.override then
			self.wpn_fps_ass_xr2.override = {}
		end

		self.wpn_fps_ass_xr2.override.wpn_fps_upg_vg_ass_smg_verticalgrip = { 
			stats = {
				value = 2,
				recoil = 2,
				concealment = -1
			}
		}
		self.wpn_fps_ass_xr2.override.wpn_fps_upg_vg_ass_smg_stubby = { 
			stats = {
				value = 1,
				recoil = -2,
				concealment = 1
			}
		}
		self.wpn_fps_ass_xr2.override.wpn_fps_smg_schakal_vg_surefire = { 
			stats = {
				value = 5,
				recoil = 2,
				concealment = -1
			}
		}
	end

	if self.parts.wpn_fps_pis_coltds_b_std then --Mira's Colt Detective
		self.parts.wpn_fps_pis_coltds_b_ext.supported = true
		self.parts.wpn_fps_pis_coltds_b_ext.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_pis_coltds_b_ext.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_pis_coltds_b_police.supported = true
		self.parts.wpn_fps_pis_coltds_b_police.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_pis_coltds_b_police.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_pis_coltds_b_modern.supported = true
		self.parts.wpn_fps_pis_coltds_b_modern.stats = {
			value = 1,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_pis_coltds_b_modern.custom_stats = nil

		self.parts.wpn_fps_pis_coltds_o_marksman.supported = true
		self.parts.wpn_fps_pis_coltds_o_marksman.stats = {
			value = 1
		}
	end

	if self.parts.wpn_fps_gre_as24_barrel then  --Pawcio's A-24
		self.parts.wpn_fps_upg_as24_stock_ext.supported = true
		self.parts.wpn_fps_upg_as24_stock_ext.stats = deep_clone(stocks.folded_to_adj_rec1)
		self.parts.wpn_fps_upg_as24_stock_ext.custom_stats = deep_clone(stocks.folded_to_adj_rec1)

		self.parts.wpn_fps_upg_as24_stock_slinghook.supported = true
		self.parts.wpn_fps_upg_as24_stock_slinghook.stats = deep_clone(stocks.remove_folded_stats)
		self.parts.wpn_fps_upg_as24_stock_slinghook.custom_stats = deep_clone(stocks.remove_folded_stats)

		self.parts.wpn_fps_upg_as24_scope.supported = true
		self.parts.wpn_fps_upg_as24_scope.stats = {
			value = 8,
			zoom = 30
		}
		self.parts.wpn_fps_upg_as24_scope.custom_stats = { disable_steelsight_recoil_anim = true }
	end

	if self.parts.wpn_fps_shot_mp153_reciever then  --Pawcio's MP-153
		self.parts.wpn_fps_upg_mp153_barrel_short.supported = true
		self.parts.wpn_fps_upg_mp153_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_mp153_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)
		self.parts.wpn_fps_upg_mp153_barrel_short.forbids = {}

		self.parts.wpn_fps_upg_mp153_barrel_medium.supported = true
		self.parts.wpn_fps_upg_mp153_barrel_medium.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_mp153_barrel_medium.custom_stats = deep_clone(barrels.short_b1_custom_stats)
		self.parts.wpn_fps_upg_mp153_barrel_medium.forbids = {}

		self.parts.wpn_fps_shot_mp153_tube_cap.supported = true
		self.parts.wpn_fps_shot_mp153_tube_cap.stats = { value = 0 }

		self.parts.wpn_fps_upg_mp153_tube_ext_2.supported = true
		self.parts.wpn_fps_upg_mp153_tube_ext_2.has_description = nil
		--self.parts.wpn_fps_upg_mp153_tube_ext_2.adds = { "wpn_fps_upg_mp153_tube_forbid_2" }
		self.parts.wpn_fps_upg_mp153_tube_ext_2.stats = { 
			value = 2,
			extra_ammo = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_mp153_tube_ext_2.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_mp153_tube_ext_4.supported = true
		self.parts.wpn_fps_upg_mp153_tube_ext_4.has_description = nil
		self.parts.wpn_fps_upg_mp153_tube_ext_4.stats = { 
			value = 4,
			extra_ammo = 4,
			concealment = -2
		}
		self.parts.wpn_fps_upg_mp153_tube_ext_4.custom_stats = {
			ads_speed_mult = 1.05
		}

		self.parts.wpn_fps_upg_mp153_tube_ext_6.supported = true
		self.parts.wpn_fps_upg_mp153_tube_ext_6.has_description = nil
		self.parts.wpn_fps_upg_mp153_tube_ext_6.stats = { 
			value = 6,
			extra_ammo = 6,
			concealment = -3
		}
		self.parts.wpn_fps_upg_mp153_tube_ext_6.custom_stats = {
			ads_speed_mult = 1.075
		}

		self.parts.wpn_fps_upg_mp153_ammo_000_magnum.supported = true
		self.parts.wpn_fps_upg_mp153_ammo_000_magnum.desc_id = "bm_wp_upg_a_custom_desc"
		self.parts.wpn_fps_upg_mp153_ammo_000_magnum.stats = {
			value = 9,
			total_ammo_mod = -25,
			spread = -5,
			damage = 15
		}
		self.parts.wpn_fps_upg_mp153_ammo_000_magnum.custom_stats = {
			falloff_end_mult = 0.8,
			damage_min_mult = 0.6666667,
			ammo_pickup_max_mul = 0.8,
			ammo_pickup_min_mul = 0.8,
			rays = 6
		}
		self.wpn_fps_shot_mp153.override = {
			wpn_fps_upg_a_slug = a_slug_semi_override,
			wpn_fps_upg_a_custom = a_custom_semi_override,
			wpn_fps_upg_a_custom_free = a_custom_semi_override,			
			wpn_fps_upg_a_explosive = a_explosive_semi_override,
			wpn_fps_upg_a_rip = a_rip_semi_override,
			wpn_fps_upg_a_piercing = a_piercing_semi_override,
			wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override			
		}	
	end

	if self.parts.wpn_fps_upg_scarl_barrel_cqc then  --Pawcio's SCAR-L
		self.parts.wpn_fps_upg_scarl_barrel_cqc.supported = true
		self.parts.wpn_fps_upg_scarl_barrel_cqc.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_scarl_barrel_cqc.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		self.parts.wpn_fps_upg_scarl_barrel_long.supported = true
		self.parts.wpn_fps_upg_scarl_barrel_long.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_upg_scarl_barrel_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		self.parts.wpn_fps_upg_scarl_mag_pdw.supported = true
		self.parts.wpn_fps_upg_scarl_mag_pdw.has_description = false
		self.parts.wpn_fps_upg_scarl_mag_pdw.stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.stats)
		self.parts.wpn_fps_upg_scarl_mag_pdw.custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.custom_stats)

		self.parts.wpn_fps_upg_scarl_mag_pull_assist.supported = true
		self.parts.wpn_fps_upg_scarl_mag_pull_assist.has_description = false
		self.parts.wpn_fps_upg_scarl_mag_pull_assist.stats = deep_clone(self.parts.wpn_fps_m4_upg_m_quick.stats)
		self.parts.wpn_fps_upg_scarl_mag_pull_assist.custom_stats = nil


		self.parts.wpn_fps_upg_scarl_rail_midwest_ext.supported = true
		self.parts.wpn_fps_upg_scarl_rail_midwest_ext.stats = {
			value = 5,
			recoil = 4,
			concealment = -2
		}
		self.parts.wpn_fps_upg_scarl_rail_nitro_v.supported = true
		self.parts.wpn_fps_upg_scarl_rail_nitro_v.stats = {
			value = 5,
			recoil = 4,
			concealment = -2
		}
		self.parts.wpn_fps_upg_scarl_rail_kinetic_mrex.supported = true
		self.parts.wpn_fps_upg_scarl_rail_kinetic_mrex.stats = {
			value = 5,
			recoil = 4,
			concealment = -2
		}

		self.parts.wpn_fps_upg_scarl_rail_vltor_casv.supported = true
		self.parts.wpn_fps_upg_scarl_rail_vltor_casv.stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_scarl_rail_pws_srx.supported = true
		self.parts.wpn_fps_upg_scarl_rail_pws_srx.stats = {
			value = 3,
			recoil = 2,
			concealment = -1
		}


		self.parts.wpn_fps_upg_scarl_stock_cheek.supported = true
		self.parts.wpn_fps_upg_scarl_stock_cheek.stats = {
			value = 0,
			spread = 1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_scarl_stock_cheek.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_scarl_stock_collapsed.supported = true
		self.parts.wpn_fps_upg_scarl_stock_collapsed.stats = {
			value = 0,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_scarl_stock_collapsed.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.parts.wpn_fps_upg_scarl_stock_pdw.supported = true
		self.parts.wpn_fps_upg_scarl_stock_pdw.stats = deep_clone(stocks.fixed_to_folder_stats)
		self.parts.wpn_fps_upg_scarl_stock_pdw.custom_stats = deep_clone(stocks.fixed_to_folder_stats)

		self.parts.wpn_fps_upg_scarl_stock_pdw_collapsed.supported = true
		self.parts.wpn_fps_upg_scarl_stock_pdw_collapsed.stats = deep_clone(stocks.fixed_to_folded_stats)
		self.parts.wpn_fps_upg_scarl_stock_pdw_collapsed.custom_stats = deep_clone(stocks.fixed_to_folded_stats)

		self.wpn_fps_ass_scarl.override.wpn_fps_upg_m4_s_standard = {
			stats = deep_clone(stocks.fixed_to_adj_dual_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
		}
		self.wpn_fps_ass_scarl.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
		}

		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_upg_m4_m_straight")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_upg_m4_m_straight")
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_upg_m4_m_pmag")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_upg_m4_m_pmag")
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_ass_l85a2_m_emag")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_ass_l85a2_m_emag")
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_upg_m4_m_l5")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_upg_m4_m_l5")
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_upg_m4_m_quad")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_upg_m4_m_quad")
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_upg_m4_m_drum")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_upg_m4_m_drum")	
		table.insert(self.wpn_fps_ass_scarl.uses_parts, "wpn_fps_m4_upg_m_quick")	
		table.insert(self.wpn_fps_ass_scarl_npc.uses_parts, "wpn_fps_m4_upg_m_quick")	
	end

	if self.parts.wpn_fps_ass_tingledingle_b_standard then --Zdann's TPB
		self.parts.wpn_fps_ass_tingledingle_b_long.supported = true
		self.parts.wpn_fps_ass_tingledingle_b_long.stats = {
			value = 99,
			spread = 6,
			concealment = -6
		}
		self.parts.wpn_fps_ass_tingledingle_b_long.custom_stats = {
			falloff_start_mult = 1.45,
			falloff_end_mult = 1.45,
			ads_speed_mult = 1.15
		}
		self.parts.wpn_fps_ass_tingledingle_m_extended.supported = true
		self.parts.wpn_fps_ass_tingledingle_m_extended.stats = {
			value = 99,
			extra_ammo = 60,
			spread = -1,
			concealment = -5
		}
		self.parts.wpn_fps_ass_tingledingle_m_extended.custom_stats = {
			ads_speed_mult = 1.125
		}
	end

	if self.parts.wpn_fps_snp_l115_stock then --Pawcio's L115
		self.parts.wpn_fps_upg_l115_barrel_medsupp.supported = true
		self.parts.wpn_fps_upg_l115_barrel_medsupp.stats = {
			value = 3,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_l115_barrel_medsupp.custom_stats = nil
		self.parts.wpn_fps_upg_l115_barrel_medsupp.has_description = true
		self.parts.wpn_fps_upg_l115_barrel_medsupp.desc_id = "bm_wp_upg_suppressor"
		self.parts.wpn_fps_upg_l115_barrel_medsupp.perks = { "silencer" }

		self.parts.wpn_fps_upg_l115_barrel_short.supported = true
		self.parts.wpn_fps_upg_l115_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_l115_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_l115_barrel_med.supported = true
		self.parts.wpn_fps_upg_l115_barrel_med.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_l115_barrel_med.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		self.parts.wpn_fps_upg_l115_stock_aw.supported = true
		self.parts.wpn_fps_upg_l115_stock_aw.stats = {
			value = 2,
			recoil = 4,
			concealment = -2
		}
		self.parts.wpn_fps_upg_l115_stock_aw.custom_stats = {
			ads_speed_mult = 1.05
		}

		self.parts.wpn_fps_upg_l115_stock_awext.supported = true
		self.parts.wpn_fps_upg_l115_stock_awext.stats = {
			value = 2,
			spread = 1,
			recoil = 2,
			concealment = -2
		}
		self.parts.wpn_fps_upg_l115_stock_aw.custom_stats = {
			ads_speed_mult = 1.05
		}

		self.parts.wpn_fps_upg_l115_stock_awmext.supported = true
		self.parts.wpn_fps_upg_l115_stock_awmext.stats = {
			value = 0,
			spread = 1,
			recoil = -2
		}
		self.parts.wpn_fps_upg_l115_stock_awmext.custom_stats = nil

		self.parts.wpn_fps_upg_l115_stock_ax.supported = true
		self.parts.wpn_fps_upg_l115_stock_ax.stats = {
			value = 3,
			concealment = 2,
			recoil = -4
		}
		self.parts.wpn_fps_upg_l115_stock_ax.custom_stats = {
			ads_speed_mult = 0.95
		}
	end

	if self.parts.wpn_fps_shot_super_body then --Pawcio's Super Shotgun
		self.parts.wpn_fps_upg_super_meathook.supported = true
		self.parts.wpn_fps_upg_super_meathook.stats = {
			concealment = -5,
			max_damage = 6,
			min_damage = 6,
			max_damage_effect = 1,
			min_damage_effect = 1
		}
		self.parts.wpn_fps_upg_super_meathook.custom_stats = {
			ads_speed_mult = 1.125
		}

		self.parts.wpn_fps_shot_super_body.supported = true
		self.parts.wpn_fps_shot_super_body.stats = { 
			spread_multi = {2, 0.75}
		}

		self.parts.wpn_fps_upg_super_body_burst.pcs = nil
		self.parts.wpn_fps_upg_super_body_burst.supported = true
		self.parts.wpn_fps_upg_super_body_burst.stats = { value = 0 }
		self.parts.wpn_fps_upg_super_body_burst.custom_stats = nil
		self.parts.wpn_fps_upg_super_body_burst.perks = nil
	end

	--Predator Pack
	if self.parts.wpn_fps_ass_plasmaproto_mag then
		self.parts.wpn_fps_ass_plasmaproto_mag.supported = true
		self.parts.wpn_fps_ass_plasmaproto_mag.stats = { value = 0}
		self.parts.wpn_fps_ass_plasmaproto_mag.custom_stats = nil
	end
	if self.parts.wpn_fps_upg_owlfbullpup_mag_drum then
		self.parts.wpn_fps_upg_owlfbullpup_scope.supported = true
		self.parts.wpn_fps_upg_owlfbullpup_scope.desc_id = "bm_wp_upg_o_3"
		self.parts.wpn_fps_upg_owlfbullpup_scope.has_description = true
		self.parts.wpn_fps_upg_owlfbullpup_scope.stats = {
			value = 8,
			zoom = 20
		}
		self.parts.wpn_fps_upg_owlfbullpup_scope.perks = {"scope"}

		self.parts.wpn_fps_upg_owlfbullpup_barrel_med.supported = true
		self.parts.wpn_fps_upg_owlfbullpup_barrel_med.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_upg_owlfbullpup_barrel_med.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_upg_owlfbullpup_barrel_long.supported = true
		self.parts.wpn_fps_upg_owlfbullpup_barrel_long.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_upg_owlfbullpup_barrel_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		self.parts.wpn_fps_upg_owlfbullpup_mag_drum.supported = true
		self.parts.wpn_fps_upg_owlfbullpup_mag_drum.has_description = false
		self.parts.wpn_fps_upg_owlfbullpup_mag_drum.stats = {
			value = 9,
			extra_ammo = 30,
			concealment = -4,
			spread = -1,
			reload = -3
		}
		self.parts.wpn_fps_upg_owlfbullpup_mag_drum.custom_stats = {
			ads_speed_mult = 1.1,
			sms = 0.9
		}
	end

	if self.parts.wpn_fps_snp_k31_scope then --Pawcio's K31
		self.parts.wpn_fps_snp_k31_scope.supported = true
		self.parts.wpn_fps_snp_k31_scope.stats = { zoom = 15 }

		self.parts.wpn_fps_upg_k31_scope_zoom.supported = true
		self.parts.wpn_fps_upg_k31_scope_zoom.stats = { value = 0, zoom = 30 }

		self.parts.wpn_fps_upg_k31_rearsight.supported = true
		self.parts.wpn_fps_upg_k31_rearsight.stats = {
			value = 0
		}

		self.parts.wpn_fps_upg_k31_supp.has_description = true
		self.parts.wpn_fps_upg_k31_supp.desc_id = "bm_wp_upg_suppressor"
		self.parts.wpn_fps_upg_k31_supp.supported = true
		self.parts.wpn_fps_upg_k31_supp.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_k31_supp.perks = {"silencer"}

		self.parts.wpn_fps_upg_k31_bayonet.supported = true
		self.parts.wpn_fps_upg_k31_bayonet.stats = {
			value = 5,
			concealment = -5,
			max_damage = 6,
			min_damage = 6,
			max_damage_effect = 1,
			min_damage_effect = 1,
			bayonet_range = 50
		}
		self.parts.wpn_fps_upg_k31_bayonet.custom_stats = {
			ads_speed_mult = 1.125
		}

		self.parts.wpn_fps_upg_k31_stock_cheekpad.supported = true
		self.parts.wpn_fps_upg_k31_stock_cheekpad.stats = {
			value = 2,
			spread = -1,
			concealment = -1,
			reload = 5
		}
		self.parts.wpn_fps_upg_k31_stock_custom.supported = true
		self.parts.wpn_fps_upg_k31_stock_custom.stats = {
			value = 4,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_k31_stock_custom_cheekpad.supported = true
		self.parts.wpn_fps_upg_k31_stock_custom_cheekpad.stats = {
			value = 6,
			spread = -1,
			recoil = -2,
			reload = 5
		}
	end

	if self.parts.wpn_fps_upg_p99_sight_tritium then --Pawcio's P99
		--No
		self.parts.wpn_fps_upg_p99_ammo_40sw.supported = true
		self.parts.wpn_fps_upg_p99_ammo_40sw.pcs = nil
		self.parts.wpn_fps_upg_p99_ammo_40sw.stats = { value = 0 }
		self.parts.wpn_fps_upg_p99_ammo_40sw.custom_stats = nil

		--Ported Barrel
		self.parts.wpn_fps_upg_p99_barrel_ported.supported = true
		self.parts.wpn_fps_upg_p99_barrel_ported.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}
		--Threaded Barrel
		self.parts.wpn_fps_upg_p99_barrel_threaded.supported = true
		self.parts.wpn_fps_upg_p99_barrel_threaded.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_upg_p99_barrel_threaded.custom_stats = deep_clone(barrels.long_b1_custom_stats)
		
		--Extendo Clipazine
		self.parts.wpn_fps_upg_p99_mag_ext.supported = true
		self.parts.wpn_fps_upg_p99_mag_ext.stats = {
			value = 5,
			extra_ammo = 5,
			reload = -1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_p99_mag_ext.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_p99_sight_tritium.supported = true
		self.parts.wpn_fps_upg_p99_sight_tritium.stats = { value = 1 }

		self.parts.wpn_fps_upg_p99_sight_rail.supported = true
		self.parts.wpn_fps_upg_p99_sight_rail.stats = { value = 5 }
	end

	if self.parts.wpn_fps_upg_g3hk79_sight_rail_low then --Pawcio's G3 w/HK79
		self.parts.wpn_fps_upg_g3hk79_sight_rail_low.supported = true
		self.parts.wpn_fps_upg_g3hk79_sight_rail_low.stats = {
			value = 1
		}

		self.parts.wpn_fps_upg_g3hk79_triggergroup_navy.supported = true
		self.parts.wpn_fps_upg_g3hk79_triggergroup_navy.stats = {
			value = 5,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_g3hk79_triggergroup_navy.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.parts.wpn_fps_upg_g3hk79_barrel_long.supported = true
		self.parts.wpn_fps_upg_g3hk79_barrel_long.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_upg_g3hk79_barrel_long.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_upg_g3hk79_stock_sliding.supported = true
		self.parts.wpn_fps_upg_g3hk79_stock_sliding.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_upg_g3hk79_stock_sliding.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
	end

	if self.parts.wpn_fps_smg_crysis3_typhoon_body then --KillerKrayola + splish + RJC9000's Crysis 3 Typhoon
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[21] = "resmod_dummy"
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[22] = "resmod_dummy"
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[44] = "resmod_dummy"
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[45] = "resmod_dummy"
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[46] = "resmod_dummy"
		self.wpn_fps_smg_crysis3_typhoon.uses_parts[47] = "resmod_dummy"
	end

	if self.parts.wpn_fps_ass_g36k_stockadapter then --Pawcio's G36K
		self.parts.wpn_fps_upg_g36k_barrel_long.supported = true
		self.parts.wpn_fps_upg_g36k_barrel_long.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_upg_g36k_barrel_long.custom_stats = deep_clone(barrels.long_b3_custom_stats)

		self.parts.wpn_fps_upg_g36k_barrel_medium.supported = true
		self.parts.wpn_fps_upg_g36k_barrel_medium.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_upg_g36k_barrel_medium.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_upg_g36k_fg_hkg36c.supported = true
		self.parts.wpn_fps_upg_g36k_fg_hkg36c.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_g36k_fg_hkg36c.stats.value = nil
		self.parts.wpn_fps_upg_g36k_fg_hkg36c.custom_stats = deep_clone(barrels.short_b1_custom_stats)
		self.parts.wpn_fps_upg_g36k_fg_hkg36k.supported = true
		self.parts.wpn_fps_upg_g36k_fg_hkg36k.stats = { 
			spread = 1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g36k_fg_hkg36.supported = true
		self.parts.wpn_fps_upg_g36k_fg_hkg36.stats = { 
			spread = 2,
			concealment = -2
		}

		self.parts.wpn_fps_upg_g36k_fg_kacshort.supported = true
		self.parts.wpn_fps_upg_g36k_fg_kacshort.stats = { 
			concealment = 1,
			recoil = -2
		}
		self.parts.wpn_fps_upg_g36k_fg_kac.supported = true
		self.parts.wpn_fps_upg_g36k_fg_kac.stats = { 
			spread = -1,
			recoil = 2
		}
		self.parts.wpn_fps_upg_g36k_fg_kaclong.supported = true
		self.parts.wpn_fps_upg_g36k_fg_kaclong.stats = { 
			spread = -2,
			recoil = 4
		}
		
		self.parts.wpn_fps_upg_g36k_fg_hk243.supported = true
		self.parts.wpn_fps_upg_g36k_fg_hk243.stats = {
			spread = 1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g36k_fg_hk243long.supported = true
		self.parts.wpn_fps_upg_g36k_fg_hk243long.stats = { 
			spread = 2,
			concealment = -2
		}

		self.parts.wpn_fps_upg_g36k_fg_bt.supported = true
		self.parts.wpn_fps_upg_g36k_fg_bt.stats = {
			concealment = 1,
			recoil = -2
		}
		self.parts.wpn_fps_upg_g36k_fg_btlong.supported = true
		self.parts.wpn_fps_upg_g36k_fg_btlong.stats = { 
			recoil = 2,
			concealment = -1
		}

		self.parts.wpn_fps_upg_g36k_fg_quadshort.supported = true
		self.parts.wpn_fps_upg_g36k_fg_quadshort.stats = {
			concealment = 2,
			recoil = -4
		}
		self.parts.wpn_fps_upg_g36k_fg_quad.supported = true
		self.parts.wpn_fps_upg_g36k_fg_quad.stats = {
			concealment = 1,
			recoil = -2
		}

		self.parts.wpn_fps_upg_g36k_grip_rubber1.supported = true
		self.parts.wpn_fps_upg_g36k_grip_rubber1.stats = {
			spread = 1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g36k_grip_rubber2.supported = true
		self.parts.wpn_fps_upg_g36k_grip_rubber2.stats = {
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g36k_grip_rubber3.supported = true
		self.parts.wpn_fps_upg_g36k_grip_rubber3.stats = {
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_g36k_grip_rubber3.custom_stats = {
			ads_speed_mult = 0.975
		}

		self.parts.wpn_fps_upg_g36k_export_sight.supported = true
		self.parts.wpn_fps_upg_g36k_export_sight.desc_id = "bm_wp_upg_o_3_5"
		self.parts.wpn_fps_upg_g36k_export_sight.has_description = true
		self.parts.wpn_fps_upg_g36k_export_sight.stats = {
			value = 1,
			zoom = 25
		}
		self.parts.wpn_fps_upg_g36k_export_sight.stance_mod = {
			wpn_fps_ass_g36k = {
				translation = Vector3(0.01, -6, 0.37)
			}
		}

		self.parts.wpn_fps_upg_g36k_mag20.supported = true
		self.parts.wpn_fps_upg_g36k_mag20.has_description = nil
		self.parts.wpn_fps_upg_g36k_mag20.stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.stats)
		self.parts.wpn_fps_upg_g36k_mag20.custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.custom_stats)

		self.parts.wpn_fps_upg_g36k_mag20magpul.supported = true
		self.parts.wpn_fps_upg_g36k_mag20magpul.has_description = nil
		self.parts.wpn_fps_upg_g36k_mag20magpul.stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.stats)
		self.parts.wpn_fps_upg_g36k_mag20magpul.stats.reload = 6
		self.parts.wpn_fps_upg_g36k_mag20magpul.stats.spread = -1
		self.parts.wpn_fps_upg_g36k_mag20magpul.stats.concealment = nil
		self.parts.wpn_fps_upg_g36k_mag20magpul.custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.custom_stats)

		self.parts.wpn_fps_upg_g36k_mag30magpul.supported = true
		self.parts.wpn_fps_upg_g36k_mag30magpul.has_description = nil
		self.parts.wpn_fps_upg_g36k_mag30magpul.stats = {
			value = 3,
			concealment = -1,
			spread = -1,
			reload = 3
		}

		self.parts.wpn_fps_upg_g36k_mag_dual30.supported = true
		self.parts.wpn_fps_upg_g36k_mag_dual30.has_description = nil
		self.parts.wpn_fps_upg_g36k_mag_dual30.stats = {
			value = 3,
			concealment = -1,
			spread = -1,
			reload = 3
		}
		
		self.parts.wpn_fps_upg_g36k_mag_cmag.supported = true
		self.parts.wpn_fps_upg_g36k_mag_cmag.has_description = nil
		self.parts.wpn_fps_upg_g36k_mag_cmag.stats = deep_clone(self.parts.wpn_fps_upg_m4_m_drum.stats)
		self.parts.wpn_fps_upg_g36k_mag_cmag.custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_drum.custom_stats)

		self.parts.wpn_fps_upg_g36k_stock_classic.supported = true
		self.parts.wpn_fps_upg_g36k_stock_classic.stats = deep_clone(stocks.adj_to_fold_stats)
		self.parts.wpn_fps_upg_g36k_stock_classic.custom_stats = deep_clone(stocks.adj_to_fold_stats)

		self.parts.wpn_fps_upg_g36k_stock_sl8.supported = true
		self.parts.wpn_fps_upg_g36k_stock_sl8.stats = deep_clone(stocks.adj_to_fold_stats)
		self.parts.wpn_fps_upg_g36k_stock_sl8.custom_stats = deep_clone(stocks.adj_to_fold_stats)

		self.parts.wpn_fps_upg_g36k_stock_ext.supported = true
		self.parts.wpn_fps_upg_g36k_stock_ext.stats = deep_clone(stocks.adj_rec_stats)
		self.parts.wpn_fps_upg_g36k_stock_ext.custom_stats = deep_clone(stocks.adj_rec_stats)

		self.wpn_fps_ass_g36k.override = self.wpn_fps_ass_g36k.override or {}
		self.wpn_fps_ass_g36k.override.wpn_fps_upg_m4_s_standard = {
			stats = { value = 1 },
			custom_stats = {}
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.adj_acc_stats),
			custom_stats = deep_clone(stocks.adj_acc_stats)
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.adj_acc_stats),
			custom_stats = deep_clone(stocks.adj_acc_stats)
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.adj_rec_stats),
			custom_stats = deep_clone(stocks.adj_rec_stats)
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.adj_rec_stats),
			custom_stats = deep_clone(stocks.adj_rec_stats)
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.adj_hvy_rec_stats),
			custom_stats = deep_clone(stocks.adj_hvy_rec_stats)
		}
		self.wpn_fps_ass_g36k.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.adj_hvy_acc_stats),
			custom_stats = deep_clone(stocks.adj_hvy_acc_stats)
		}

		table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_g36k_mag20")	
		table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_g36k_mag20magpul")	
		table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_g36k_mag_dual30")	
		table.insert(self.wpn_fps_ass_g36.uses_parts, "wpn_fps_upg_g36k_mag_cmag")	
		self.wpn_fps_ass_g36_npc.uses_parts = deep_clone(self.wpn_fps_ass_g36.uses_parts)
	end

	if self.parts.wpn_fps_pis_fp45_barrel then
		--Pain :^)
		self.wpn_fps_pis_fp45.override.wpn_fps_upg_pis_ns_flash = {
			a_obj = "a_ns",
			parent = "barrel"
		}
		self.wpn_fps_pis_fp45.override.wpn_fps_pis_g18c_co_comp_2 = {
			a_obj = "a_ns",
			parent = "barrel"
		}
		self.wpn_fps_pis_fp45.override.wpn_fps_upg_ns_pis_typhoon = {
			a_obj = "a_ns",
			parent = "barrel"
		}
		table.insert(self.wpn_fps_pis_fp45.uses_parts, "wpn_fps_upg_pis_ns_flash")
		table.insert(self.wpn_fps_pis_fp45.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
		table.insert(self.wpn_fps_pis_fp45.uses_parts, "wpn_fps_upg_ns_pis_typhoon")
		self.wpn_fps_pis_fp45_npc.uses_parts = deep_clone(self.wpn_fps_pis_fp45.uses_parts)
	end

	if self.parts.wpn_fps_upg_ppsh_barrel_sawnoffcomp then
		self.parts.wpn_fps_upg_ppsh_barrel_sawnoffcomp.supported = true
		self.parts.wpn_fps_upg_ppsh_barrel_sawnoffcomp.stats = {
			value = 3,
			concealment = 1,
			recoil = -2,
		}
		self.parts.wpn_fps_upg_ppsh_barrel_sawnoffcomp.custom_stats = nil

		self.parts.wpn_fps_upg_ppsh_barrel_k50m.supported = true
		self.parts.wpn_fps_upg_ppsh_barrel_k50m.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_ppsh_barrel_k50m.custom_stats = deep_clone(barrels.short_b2_custom_stats)
		
		self.parts.wpn_fps_upg_ppsh_stock_k50m.supported = true
		self.parts.wpn_fps_upg_ppsh_stock_k50m.stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		self.parts.wpn_fps_upg_ppsh_stock_k50m.custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)		
	end

	if self.parts.wpn_fps_aug_body_aug_a1 then --Pawcio's AUG A1 Kit

		self.parts.wpn_fps_aug_body_aug_a1.supported = true
		self.parts.wpn_fps_aug_body_aug_a1.stats = {
			value = 1,
			concealment = 1,
			recoil = -2
		}
		self.parts.wpn_fps_aug_body_aug_a1.forbids = { "wpn_fps_upg_vg_ass_smg_stubby" }
		self.parts.wpn_fps_aug_body_aug_a1.override = { 
			wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			}
		}

		self.parts.wpn_fps_aug_body_aug_a3.supported = true
		self.parts.wpn_fps_aug_body_aug_a3.stats = {
			value = 1,
			concealment = 1,
			recoil = -2
		}
		self.parts.wpn_fps_aug_body_aug_a3.forbids = { "wpn_fps_upg_vg_ass_smg_stubby" }
		self.parts.wpn_fps_aug_body_aug_a3.override = { 
			wpn_fps_upg_vg_ass_smg_verticalgrip_vanilla = {
				unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
			}
		}

		self.parts.wpn_fps_aug_body_aug_a3vg.supported = true
		self.parts.wpn_fps_aug_body_aug_a3vg.stats = {
			value = 1
		}

		self.parts.wpn_fps_aug_m_a1_42.supported = true
		self.parts.wpn_fps_aug_m_a1_42.stats = {
			extra_ammo = 12,
			concealment = -1,
			reload = -2
		}
		self.parts.wpn_fps_aug_m_a1_42.custom_stats = {
			ads_speed_mult = 1.025
		}
		
		self.parts.wpn_fps_aug_o_scope_a1.supported = true
		self.parts.wpn_fps_aug_o_scope_a1.has_description = true
		self.parts.wpn_fps_aug_o_scope_a1.desc_id = "bm_wp_upg_o_1_5_scope"			
		self.parts.wpn_fps_aug_o_scope_a1.supported = true			
		self.parts.wpn_fps_aug_o_scope_a1.stats = {
			value = 3,
			zoom = 5
		}
	end

	if self.parts.wpn_fps_upg_vss_pso_alt then --Pawcio's VSS
		self.parts.wpn_fps_snp_vss_barrel.sound_switch = {
			suppressed = "suppressed_a"
		}
		self.parts.wpn_fps_snp_vss_pso.stats = { zoom = 30 }
		self.parts.wpn_fps_snp_vss_pso.stance_mod = {
			wpn_fps_snp_vss = {
				translation = Vector3(0.63, -25, 4.02)
			},
			wpn_fps_ass_asval = {
				translation = Vector3(0.63, -25, 4.02)
			}
		}
		self.parts.wpn_fps_upg_vss_pso_alt.stats = { zoom = 30 }
		self.parts.wpn_fps_upg_vss_pso_alt.stance_mod = deep_clone(self.parts.wpn_fps_snp_vss_pso.stance_mod)

		table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_vss_pso_alt")
		self.wpn_fps_ass_asval_npc.uses_parts = deep_clone(self.wpn_fps_ass_asval.uses_parts)

		self.parts.wpn_fps_upg_vss_irons.supported = true
		self.parts.wpn_fps_upg_vss_irons.stats = {
			value = 0
		}
		self.parts.wpn_fps_upg_vss_irons.stance_mod = {
			wpn_fps_snp_vss = {
				translation = Vector3(-0.022, -9, 6.6)
			}
		}

		self.parts.wpn_fps_upg_vss_irons_il.supported = true
		self.parts.wpn_fps_upg_vss_irons_il.stats = {
			value = 0
		}
		self.parts.wpn_fps_upg_vss_irons_il.stance_mod = {
			wpn_fps_snp_vss = {
				translation = Vector3(-0.022, -9, 6.6)
			}
		}

		self.parts.wpn_fps_upg_vss_mag_20rnd.supported = true
		self.parts.wpn_fps_upg_vss_mag_20rnd.stats = {
			value = 2,
			extra_ammo = 10,
			reload = -2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_vss_mag_20rnd.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_vss_stock_alt.supported = true
		self.parts.wpn_fps_upg_vss_stock_alt.stats = {
			concealment = 1,
			recoil = -2
		}

		self.parts.wpn_fps_upg_vss_stock_folding.supported = true
		self.parts.wpn_fps_upg_vss_stock_folding.stats = deep_clone(stocks.fixed_to_folder_stats)
		self.parts.wpn_fps_upg_vss_stock_folding.custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	end

	if self.parts.wpn_fps_snp_svd_magrelease then --Pawcio's SVD
		self.parts.wpn_fps_snp_svd_pso.stats = { zoom = 30 }
		self.parts.wpn_fps_snp_svd_pso.stance_mod.wpn_fps_snp_svd = {
			translation = Vector3(0.474, -17, -2.868)
		}
		self.parts.wpn_fps_snp_svd_pso.stance_mod.wpn_fps_snp_siltstone = {
			translation = Vector3(0.472, -17, -2.34)
		}

		self.parts.wpn_fps_upg_svd_irons.supported = true
		self.parts.wpn_fps_upg_svd_irons.stats = {
			value = 0
		}

		self.parts.wpn_fps_upg_svd_barrel_long.supported = true
		self.parts.wpn_fps_upg_svd_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_svd_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_upg_svd_barrel_short.supported = true
		self.parts.wpn_fps_upg_svd_barrel_short.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_svd_barrel_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		self.parts.wpn_fps_upg_svd_supp_pbs1.supported = true	
		self.parts.wpn_fps_upg_svd_supp_pbs1.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_svd_supp_pbs1.custom_stats = nil

		self.parts.wpn_fps_upg_svd_handguard_modern.supported = true
		self.parts.wpn_fps_upg_svd_handguard_modern.stats = {
			value = 3,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_svd_stock_modern.supported = true
		self.parts.wpn_fps_upg_svd_stock_modern.stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
		self.parts.wpn_fps_upg_svd_stock_modern.custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)

		self.parts.wpn_fps_upg_svd_stock_folding.supported = true
		self.parts.wpn_fps_upg_svd_stock_folding.stats = deep_clone(stocks.fixed_to_folder_stats)
		self.parts.wpn_fps_upg_svd_stock_folding.custom_stats = deep_clone(stocks.fixed_to_folder_stats)

		self.parts.wpn_fps_upg_svd_stock_solid.supported = true
		self.parts.wpn_fps_upg_svd_stock_solid.stats = deep_clone(stocks.fixed_to_thumbhole_stats)
		self.parts.wpn_fps_upg_svd_stock_solid.custom_stats = deep_clone(stocks.fixed_to_thumbhole_stats)

		--Stuff to allow the SVD's scope to be mounted on the vanilla SVD
		self.parts.wpn_fps_snp_svd_pso_grom = deep_clone(self.parts.wpn_fps_snp_svd_pso)
		self.parts.wpn_fps_snp_svd_pso_grom.pcs = {}
		self.parts.wpn_fps_snp_svd_pso_grom.name_id = "bm_wp_wpn_fps_snp_svd_pso"
		self.parts.wpn_fps_snp_svd_pso_grom.desc_id = "bm_wp_upg_o_4"
		self.parts.wpn_fps_snp_svd_pso_grom.has_description = true
		self.parts.wpn_fps_snp_svd_pso_grom.alt_icon = "guis/dlcs/mods/textures/pd2/blackmarket/icons/weapons/svd"
		self.parts.wpn_fps_snp_svd_pso_grom.stats = { value = 0, zoom = 30 }

		table.insert(self.wpn_fps_snp_siltstone.uses_parts, "wpn_fps_snp_svd_pso_grom")
		self.wpn_fps_snp_siltstone_npc.uses_parts = deep_clone(self.wpn_fps_snp_siltstone.uses_parts)
	end

	if self.parts.wpn_fps_upg_sks_mag_fixed10 then --Pawcio's SKS
		self.parts.wpn_fps_upg_sks_mag_fixed10.supported = true
		self.parts.wpn_fps_upg_sks_mag_fixed10.has_description = nil
		self.parts.wpn_fps_upg_sks_mag_fixed10.desc_id = "bm_wp_upg_m_sksclip"
		self.parts.wpn_fps_upg_sks_mag_fixed10.stats = { concealment = 1 }
		self.parts.wpn_fps_upg_sks_mag_fixed10.custom_stats = { sks_clip = true }

		self.parts.wpn_fps_upg_sks_mag_detach20.supported = true
		self.parts.wpn_fps_upg_sks_mag_detach20.stats = { extra_ammo = 10, reload = -2, concealment = -1 }
		self.parts.wpn_fps_upg_sks_mag_detach20.custom_stats = { ads_speed_mult = 1.025 }

		self.parts.wpn_fps_upg_sks_barrel_med.supported = true
		self.parts.wpn_fps_upg_sks_barrel_med.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_sks_barrel_med.stats.bayonet_range = -20
		self.parts.wpn_fps_upg_sks_barrel_med.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		self.parts.wpn_fps_upg_sks_barrel_short.supported = true
		self.parts.wpn_fps_upg_sks_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_sks_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_sks_o_pu.desc_id = "bm_wp_upg_o_3_5"
		self.parts.wpn_fps_upg_sks_o_pu.has_description = true
		self.parts.wpn_fps_upg_sks_o_pu.stats = { value = 0, zoom = 25 }

		self.parts.wpn_fps_upg_sks_bayonet.supported = true
		self.parts.wpn_fps_upg_sks_bayonet.stats = {
			value = 5,
			concealment = -5,
			max_damage = 6,
			min_damage = 6,
			max_damage_effect = 1,
			min_damage_effect = 1,
			bayonet_range = 50
		}
		self.parts.wpn_fps_upg_sks_bayonet.custom_stats = {
			ads_speed_mult = 1.125
		}
	end

	if self.parts.wpn_fps_upg_m_dura then --FrenchyAU Tacticool Magnation

		-- +45 mags
		mags = {
			'wpn_fps_upg_m_rpkd', --"95" drum (how the fuck does something modeled after a 75 drum hold 95 rounds???? Eat ass, Tarkov)
			'wpn_fps_upg_m_762rpk75',
			'wpn_fps_upg_m_promagd' --73 drum (Fuckin Promag unironically making 73 round drums. Couldn't do anything to get those extra 2 in?)
		}

		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].fps_animation_weight = "drum_mag"
			self.parts[part_id].stats = deep_clone(self.parts.wpn_upg_ak_m_drum.stats)
			self.parts[part_id].custom_stats = deep_clone(self.parts.wpn_upg_ak_m_drum.custom_stats)
		end
		self.parts.wpn_fps_upg_m_promagd.stats.extra_ammo = 43

		-- +30 mags
		mags = {
			'wpn_fps_upg_m_d60',
			'wpn_fps_upg_m_g36_d60'
		}

		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = deep_clone(self.parts.wpn_fps_upg_m4_m_quad.stats)
			self.parts[part_id].custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_quad.custom_stats)
		end

		-- +15 mags
		mags = {
			'wpn_fps_upg_m_rpk45',
			'wpn_fps_upg_m_45r'
		}

		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = {
				value = 4,
				extra_ammo = 15,
				reload = -2,
				concealment = -2
			}
			self.parts[part_id].custom_stats = { ads_speed_mult = 1.05 }
		end

		-- +10 mags
		mags = {
			'wpn_fps_upg_m_p40',
			'wpn_fps_upg_m_g36_p40',
			'wpn_fps_upg_m_rpk40',
			'wpn_fps_upg_m_rpkbake',
			'wpn_fps_upg_m_308dmmag',
			'wpn_fps_upg_m_mpxtti'
		}

		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = {
				extra_ammo = 10,
				concealment = -1,
				reload = -1
			}
			self.parts[part_id].custom_stats = {
				ads_speed_mult = 1.025
			}
		end

		-- Speed pulls
		mags = {
			'wpn_fps_upg_m_dmmag',
			'wpn_fps_upg_m_g36_dmmag',
			'wpn_fps_upg_m_54530s',
			'wpn_fps_upg_m_54530d',
		}

		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = deep_clone(self.parts.wpn_fps_m4_upg_m_quick.stats)
			self.parts[part_id].custom_stats = nil
		end
		
		-- Nothingburger
		local mags = {
			'wpn_fps_upg_m_dura',
			'wpn_fps_upg_m_p30',
			'wpn_fps_upg_m_p30w',
			'wpn_fps_upg_m_battle',
			'wpn_fps_upg_m_poly',
			'wpn_fps_upg_m_hksteel',
			'wpn_fps_upg_m_gen2',
			'wpn_fps_upg_m_plum',
			'wpn_fps_upg_m_6l10',
			'wpn_fps_upg_m_103',
			'wpn_fps_upg_m_762pmag',
			'wpn_fps_upg_m_palm',
			'wpn_fps_upg_m_308pmag',
			'wpn_fps_upg_m_kac20',
			'wpn_fps_upg_m_mpx30',
			'wpn_fps_upg_m_mk17',
			'wpn_fps_upg_m_lanc',
			'wpn_fps_upg_m_g36_dura',
			'wpn_fps_upg_m_g36_p30',
			'wpn_fps_upg_m_g36_p30w',
			'wpn_fps_upg_m_g36_battle',
			'wpn_fps_upg_m_g36_poly',
			'wpn_fps_upg_m_g36_hksteel',
			'wpn_fps_upg_m_g36_gen2',
			'wpn_fps_upg_m_g36_lanc',
			'wpn_fps_upg_m_puf30',
			'wpn_fps_upg_m_vityazpmag',
		}
		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = deep_clone(self.parts.wpn_fps_ass_l85a2_m_emag.stats)
			self.parts[part_id].custom_stats = nil
		end

		-- -10 mags
		mags = {
			'wpn_fps_upg_m_54520',
			'wpn_fps_upg_m_54520s',
			'wpn_fps_upg_m_54520d',
			'wpn_fps_upg_m_p20',
			'wpn_fps_upg_m_kac10',
			'wpn_fps_upg_m_puf20',
			'wpn_fps_upg_m_mpx20',
		}
		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.stats)
			self.parts[part_id].custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_straight.custom_stats)
		end
		self.parts.wpn_fps_upg_m_54520s.stats.reload = 5
		self.parts.wpn_fps_upg_m_54520s.stats.spread = -1
		self.parts.wpn_fps_upg_m_54520d.stats.reload = 5
		self.parts.wpn_fps_upg_m_54520d.stats.spread = -1

		-- -20 mags
		mags = {
			'wpn_fps_upg_m_p10',
			'wpn_fps_upg_m_54510s',
			'wpn_fps_upg_m_10rs',
			'wpn_fps_upg_m_cap10',
		}
		for i, part_id in ipairs(mags) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = {
				value = 2,
				concealment = 2,
				reload = 4,
				extra_ammo = -20
			}
			self.parts[part_id].custom_stats = { 
				ads_speed_mult = 0.95
			}
		end
		self.parts.wpn_fps_upg_m_54510s.stats.reload = 5
		self.parts.wpn_fps_upg_m_54510s.stats.spread = -1



		self.parts.wpn_fps_upg_m_d60boot.supported = true
		self.parts.wpn_fps_upg_m_d60boot.stats = {
			reload = 2,
			extra_ammo = -40,
			concealment = 3
		}
		self.parts.wpn_fps_upg_m_d60boot.custom_stats = {
			ads_speed_mult = 0.925
		}

		self.parts.wpn_fps_upg_m_x47.supported = true
		self.parts.wpn_fps_upg_m_x47.stats = deep_clone(self.parts.wpn_fps_upg_ak_m_quad.stats)
		self.parts.wpn_fps_upg_m_x47.stats.extra_ammo = 20
		self.parts.wpn_fps_upg_m_x47.stats.concealment = -3
		self.parts.wpn_fps_upg_m_x47.stats.reload = -3
		self.parts.wpn_fps_upg_m_x47.custom_stats = deep_clone(self.parts.wpn_fps_upg_ak_m_quad.custom_stats)
		self.parts.wpn_fps_upg_m_x47.custom_stats.ads_speed_mult = 1.075

		self.parts.wpn_fps_upg_m_max.supported = true
		self.parts.wpn_fps_upg_m_max.fps_animation_weight = "drum_mag"
		self.parts.wpn_fps_upg_m_max.stats = deep_clone(self.parts.wpn_upg_saiga_m_20rnd.stats)
		self.parts.wpn_fps_upg_m_max.custom_stats = deep_clone(self.parts.wpn_upg_saiga_m_20rnd.custom_stats)

		self.parts.wpn_fps_upg_m_pro.supported = true
		self.parts.wpn_fps_upg_m_pro.custom_stats = {
			ads_speed_mult = 1.075
		}
		self.parts.wpn_fps_upg_m_pro.stats = {
			value = 2, 
			extra_ammo = 7, 
			reload = -3, 
			concealment = -3
		}

		self.parts.wpn_fps_upg_m_mpxdrum.supported = true
		self.parts.wpn_fps_upg_m_mpxdrum.stats = deep_clone(self.parts.wpn_fps_upg_ak_m_quad.stats)
		self.parts.wpn_fps_upg_m_mpxdrum.stats.extra_ammo = 20
		self.parts.wpn_fps_upg_m_mpxdrum.stats.concealment = -3
		self.parts.wpn_fps_upg_m_mpxdrum.stats.reload = -3
		self.parts.wpn_fps_upg_m_mpxdrum.custom_stats = { ads_speed_mult = 1.075 }

		self.parts.wpn_fps_upg_m_celerity.supported = true
		self.parts.wpn_fps_upg_m_celerity.stats = deep_clone(self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats)
		self.parts.wpn_fps_upg_m_celerity.stats.concealment = -3
		self.parts.wpn_fps_upg_m_celerity.stats.spread = -1
		self.parts.wpn_fps_upg_m_celerity.stats.reload = -1
		self.parts.wpn_fps_upg_m_celerity.custom_stats = { ads_speed_mult = 1.05 }

		self.wpn_fps_pis_g26.override.wpn_fps_upg_m_celerity = {
			stats = {
				extra_ammo = 23,
				concealment = -3,
				spread = -1,
				reload = -1
			}
		}
		self.wpn_fps_pis_g22c.override.wpn_fps_upg_m_celerity = {
			stats = {
				extra_ammo = 16,
				concealment = -3,
				spread = -1,
				reload = -1
			}
		}
		self.wpn_fps_pis_x_g17.override.wpn_fps_upg_m_celerity = {
			stats = {
				extra_ammo = 32,
				concealment = -3,
				spread = -1,
				reload = -1
			}
		}
		self.wpn_fps_pis_x_g18c.override.wpn_fps_upg_m_celerity = {
			stats = {
				extra_ammo = 32,
				concealment = -3,
				spread = -1,
				reload = -1
			}
		}
		self.wpn_fps_jowi.override.wpn_fps_upg_m_celerity = {
			stats = {
				extra_ammo = 46,
				concealment = -3,
				spread = -1,
				reload = -1
			}
		}

		self.parts.wpn_fps_upg_m_sgmt.supported = true
		self.parts.wpn_fps_upg_m_sgmt.stats = deep_clone(self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats)
		self.parts.wpn_fps_upg_m_sgmt.stats.extra_ammo = 33
		self.parts.wpn_fps_upg_m_sgmt.stats.concealment = -4
		self.parts.wpn_fps_upg_m_sgmt.stats.reload = -3
		self.parts.wpn_fps_upg_m_sgmt.custom_stats = { ads_speed_mult = 1.1 }

		self.wpn_fps_pis_g26.override.wpn_fps_upg_m_sgmt = {
			stats = {
				extra_ammo = 40,
				concealment = -4,
				reload = -3
			}
		}
		self.wpn_fps_pis_g22c.override.wpn_fps_upg_m_sgmt = {
			stats = {
				extra_ammo = 35,
				concealment = -4,
				reload = -3
			}
		}
		self.wpn_fps_pis_x_g17.override.wpn_fps_upg_m_sgmt = {
			stats = {
				extra_ammo = 66,
				concealment = -4,
				reload = -3
			}
		}
		self.wpn_fps_pis_x_g18c.override.wpn_fps_upg_m_sgmt = {
			stats = {
				extra_ammo = 66,
				concealment = -4,
				reload = -3
			}
		}
		self.wpn_fps_jowi.override.wpn_fps_upg_m_sgmt = {
			stats = {
				extra_ammo = 80,
				concealment = -4,
				reload = -3
			}
		}

		self.parts.wpn_fps_upg_m_vecsgmt.supported = true
		self.parts.wpn_fps_upg_m_vecsgmt.stats = deep_clone(self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats)
		self.parts.wpn_fps_upg_m_vecsgmt.stats.extra_ammo = 21
		self.parts.wpn_fps_upg_m_vecsgmt.stats.concealment = -4
		self.parts.wpn_fps_upg_m_vecsgmt.stats.reload = -3
		self.parts.wpn_fps_upg_m_vecsgmt.custom_stats = { ads_speed_mult = 1.1 }

		self.parts.wpn_fps_upg_m_fmgdrum.supported = true
		self.parts.wpn_fps_upg_m_fmgdrum.stats = deep_clone(self.parts.wpn_fps_upg_ak_m_quad.stats)
		self.parts.wpn_fps_upg_m_fmgdrum.stats.extra_ammo = 17
		self.parts.wpn_fps_upg_m_fmgdrum.stats.concealment = -4
		self.parts.wpn_fps_upg_m_fmgdrum.stats.reload = -3
		self.parts.wpn_fps_upg_m_fmgdrum.custom_stats = { ads_speed_mult = 1.1 }

		self.parts.wpn_fps_upg_m_7drum.supported = true
		self.parts.wpn_fps_upg_m_7drum.stats = deep_clone(self.parts.wpn_fps_smg_mp7_m_extended.stats)
		self.parts.wpn_fps_upg_m_7drum.stats.extra_ammo = 40
		self.parts.wpn_fps_upg_m_7drum.stats.concealment = -3
		self.parts.wpn_fps_upg_m_7drum.stats.reload = -4
		self.parts.wpn_fps_upg_m_7drum.custom_stats = { ads_speed_mult = 1.075 }
	end

	if self.parts.wpn_fps_upg_fl_mawl then --FrenchyAU Gadgets/Tacticals
		local gadgets = {
			'wpn_fps_upg_fl_peq2',
			'wpn_fps_upg_fl_dbal',
			'wpn_fps_upg_fl_holo',
			'wpn_fps_upg_fl_ncs',
			'wpn_fps_upg_fl_peq15',
			'wpn_fps_upg_fl_2irs',
			'wpn_fps_upg_fl_mawl',
			'wpn_fps_upg_fl_pers',
			'wpn_fps_upg_fl_x400',
			'wpn_fps_upg_fl_la5',
			'wpn_fps_upg_fl_kleh',
			'wpn_fps_upg_fl_las',
			'wpn_fps_upg_fl_pis_ncs',
			'wpn_fps_upg_fl_pis_dbal',
			'wpn_fps_upg_fl_pis_gl21',
			'wpn_fps_upg_fl_pis_xc1',
			'wpn_fps_upg_fl_pis_2irs',
			'wpn_fps_upg_fl_pis_las',
		}
		for i, part_id in ipairs(gadgets) do
			self.parts[part_id].supported = true
			self.parts[part_id].stats = { value = 1 }
			self.parts[part_id].custom_stats = nil
		end
	end

	if self.parts.wpn_fps_pis_m6d_scope then --RJC9000 and Offyerrocker's M6D
		self.parts.wpn_fps_pis_m6d_scope.stats = { value = 0 }
		self.parts.wpn_fps_pis_m6d_scope.stance_mod = {
			wpn_fps_pis_m6d = {
				translation = Vector3(0.01, 0, -2.5)
			}
		}

		self.parts.wpn_fps_pis_m6d_scope_reticle = deep_clone(self.parts.wpn_fps_pis_m6d_scope)
		self.parts.wpn_fps_pis_m6d_scope_reticle.pcs = {}
		self.parts.wpn_fps_pis_m6d_scope_reticle.supported = true
		self.parts.wpn_fps_pis_m6d_scope_reticle.unit = "units/pd2_dlc_gage_snp/weapons/wpn_fps_upg_o_shortdot/wpn_fps_upg_o_shortdot"
		self.parts.wpn_fps_pis_m6d_scope_reticle.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
		self.parts.wpn_fps_pis_m6d_scope_reticle.name_id = "kfa_scope"
		self.parts.wpn_fps_pis_m6d_scope_reticle.has_description = true
		self.parts.wpn_fps_pis_m6d_scope_reticle.desc_id = "kfa_scope_desc"
		self.parts.wpn_fps_pis_m6d_scope_reticle.a_obj = "a_quite"
		self.parts.wpn_fps_pis_m6d_scope_reticle.perks = {"scope"}
		self.parts.wpn_fps_pis_m6d_scope_reticle.texture_switch = {
			channel = "diffuse_texture",
			material = {
				"gfx_reddot1",
				"screen"
			}
		}
		self.parts.wpn_fps_pis_m6d_scope_reticle.stats = { value = 0, zoom = 10 }
		self.parts.wpn_fps_pis_m6d_scope_reticle.custom_stats = { disable_steelsight_recoil_anim = true }
		self.parts.wpn_fps_pis_m6d_scope_reticle.alt_icon = "guis/dlcs/gage_pack_historical/textures/pd2/blackmarket/icons/mods/wpn_fps_pis_c96_sight"
		self.parts.wpn_fps_pis_m6d_scope_reticle.steelsight_visible = true
		self.parts.wpn_fps_pis_m6d_scope_reticle.stance_mod = {
			wpn_fps_pis_m6d = {
				translation = Vector3(0.01, -52, -5.58)
			}
		}
		self.parts.wpn_fps_pis_m6d_scope_reticle.visibility = {
			{
				objects = {
					g_shortdot = false,
					g_reticle = false,
					g_mullplan = false,
					g_gfx_lens_3 = false,
					g_gfx_lens_2 = false,
					g_gfx_lens = false
				}
			}
		}
		self.wpn_fps_pis_m6d.override = self.wpn_fps_pis_m6d.override or {}
		self.wpn_fps_pis_m6d.override.wpn_fps_upg_pis_ns_flash = {
			a_obj = "a_ns",
			parent = "barrel"
		}
		self.wpn_fps_pis_m6d.override.wpn_fps_pis_g18c_co_comp_2 = {
			a_obj = "a_ns",
			parent = "barrel"
		}
		self.wpn_fps_pis_m6d.override.wpn_fps_upg_ns_pis_typhoon = {
			a_obj = "a_ns",
			parent = "barrel"
		}

		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_pis_m6d_scope_reticle")

		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_upg_pis_ns_flash")
		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_pis_g18c_co_comp_2")
		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_upg_ns_pis_typhoon")

		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_upg_i_singlefire")
		table.insert(self.wpn_fps_pis_m6d.uses_parts, "wpn_fps_upg_i_autofire")

		self.wpn_fps_pis_m6d_npc.uses_parts = deep_clone(self.wpn_fps_pis_m6d.uses_parts)
	end

	if self.parts.wpn_fps_ass_ak12_bolt then --Pawcio's KF2 AK-12 (AK-200)
		self.parts.wpn_fps_ass_ak12_vertgrip.supported = true
		self.parts.wpn_fps_ass_ak12_vertgrip.stats = { value = 0 }

		self.parts.wpn_fps_upg_ak12_vertgrip_tact.supported = true
		self.parts.wpn_fps_upg_ak12_vertgrip_tact.stats = { value = 0 }

		self.parts.wpn_fps_upg_ak12_barrel_long.supported = true
		self.parts.wpn_fps_upg_ak12_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_ak12_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_upg_ak12_barrel_med.supported = true
		self.parts.wpn_fps_upg_ak12_barrel_med.stats = deep_clone(barrels.short_b1_stats)
		self.parts.wpn_fps_upg_ak12_barrel_med.custom_stats = deep_clone(barrels.short_b1_custom_stats)

		self.parts.wpn_fps_upg_ak12_barrel_short.supported = true
		self.parts.wpn_fps_upg_ak12_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_upg_ak12_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.parts.wpn_fps_upg_ak12_ns_kf2.supported = true
		self.parts.wpn_fps_upg_ak12_ns_kf2.stats = deep_clone(muzzle_device.muzzle_rec_stats)
		self.parts.wpn_fps_upg_ak12_ns_kf2.custom_stats = deep_clone(muzzle_device.muzzle_rec_custom_stats)

		self.parts.wpn_fps_upg_ak12_stock_ext.supported = true
		self.parts.wpn_fps_upg_ak12_stock_ext.stats = {
			value = 0,
			spread = 1,
			recoil = -2
		}

		self.parts.wpn_fps_upg_ak12_mag_assist.supported = true
		self.parts.wpn_fps_upg_ak12_mag_assist.stats = deep_clone(self.parts.wpn_fps_m4_upg_m_quick.stats)
		self.parts.wpn_fps_upg_ak12_mag_assist.custom_stats = nil

		self.parts.wpn_fps_upg_ak12_mag_ext.supported = true
		self.parts.wpn_fps_upg_ak12_mag_ext.stats = {
			value = 4,
			extra_ammo = 15,
			reload = -2,
			concealment = -2
		}
		self.parts.wpn_fps_upg_ak12_mag_ext.custom_stats = { ads_speed_mult = 1.05 }

		self.wpn_fps_ass_ak12.override = self.wpn_fps_ass_ak12.override or {}
		self.wpn_fps_ass_ak12.override.wpn_fps_upg_vg_ass_smg_verticalgrip = { 
			stats = {}
		}
		self.wpn_fps_ass_ak12.override.wpn_fps_upg_vg_ass_smg_stubby = { 
			stats = {
				value = 1,
				recoil = -2,
				concealment = 1
			}
		}
		self.wpn_fps_ass_ak12.override.wpn_fps_smg_schakal_vg_surefire = { 
			stats = {}
		}

		self.wpn_fps_ass_ak12_npc.override = deep_clone(self.wpn_fps_ass_ak12.override)

	end

	if self.parts.wpn_fps_hmcar_uupg_m_std then

		self.parts.wpn_fps_ass_tecci_bolt = deep_clone(self.parts.wpn_fps_ass_tecci_upper_reciever)
		self.parts.wpn_fps_ass_tecci_bolt.visibility = {
			{
				objects = {
					g_upper = false,
				}
			}
		}

		self.parts.wpn_fps_upg_o_hmscope_hd = deep_clone(self.parts.wpn_fps_upg_o_eotech)
		self.parts.wpn_fps_upg_o_hmscope_hd.visibility = {
			{
				objects = {
					g_mullplan = false,
					g_gfx_lens = false,
					g_testdot = false,
				}
			}
		}

		self.parts.wpn_fps_hmcar_uupg_m_hd = deep_clone(self.parts.wpn_fps_m4_uupg_m_std_vanilla)
		self.parts.wpn_fps_hmcar_uupg_m_hd.bullet_objects = nil
		self.parts.wpn_fps_hmcar_uupg_m_hd.visibility = {
			{
				objects = {
					g_bullet_1 = false,
					g_bullet_2 = false
				}
			}
		}

		self.parts.wpn_fps_hmcar_hd_kit = {
			pcs = {},
			type = "exclusive_set",
			dlc = "sc",
			name_id = "bm_wp_hmcar_hd_kit",
			a_obj = "a_fg",
			has_description = true,
			desc_id = "bm_wp_hmcar_hd_kit_desc",
			alt_icon = "guis/textures/overkill_df",
			unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
			supported = true,
			stats = {
				value = 0
			},
			override = { 
				wpn_fps_hmcar_lower_receiver = {
					unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_lower_reciever",
					third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_lower_reciever",
					adds = {
						"wpn_fps_m4_upper_reciever_round_vanilla",
						"wpn_fps_m4_uupg_draghandle",
						"wpn_fps_upg_m4_s_standard_vanilla",
						"wpn_fps_upg_m4_g_standard_vanilla",
						"wpn_fps_m4_uupg_fg_rail",
					}
				},
				wpn_fps_m4_uupg_fg_rail = {
					unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_m16_fg_railed",
					third_unit = "units/payday2/weapons/wpn_third_ass_m16_pts/wpn_third_m16_fg_railed",
					adds = {}
				},
				wpn_fps_m4_upper_reciever_round_vanilla = {
					unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_upper_reciever_edge",
					third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_upper_reciever_edge",
					adds = { "wpn_fps_ass_tecci_bolt" }
				},
				wpn_fps_hmcar_uupg_b_dummy = {
					unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_b_short",
					third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_b_short"
				},
				wpn_fps_hmcar_uupg_m_std = {
					unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
					third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
					adds = {
						"wpn_fps_hmcar_uupg_m_hd"
					}
				},
				wpn_fps_upg_goodlaser = {
					unit = "units/payday2/weapons/wpn_fps_upg_fl_ass_smg_sho_peqbox/wpn_fps_upg_fl_ass_smg_sho_peqbox",
					third_unit = "units/payday2/weapons/wpn_third_upg_fl_ass_smg_sho_peqbox/wpn_third_upg_fl_ass_smg_sho_peqbox"
				},
				wpn_fps_upg_o_hmscope = {
					unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
					third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
					adds = {
						"wpn_fps_upg_o_hmscope_hd"
					}
				},
			},
			forbids = {
				"wpn_fps_addon_ris"
			}
		}
		self.wpn_fps_ass_hmcar.stock_adapter = "wpn_fps_upg_m4_s_adapter"
		self.wpn_fps_ass_hmcar_npc.stock_adapter = "wpn_fps_upg_m4_s_adapter"

		table.insert(self.wpn_fps_ass_hmcar.uses_parts, "wpn_fps_hmcar_hd_kit")

		self.wpn_fps_ass_hmcar_npc.uses_parts = deep_clone(self.wpn_fps_ass_hmcar.uses_parts)
	end

	if self.parts.wpn_fps_snp_troglodyte_rec then --Leon and Mira's AWM-F

		self.parts.wpn_fps_snp_troglodyte_b_long.supported = true
		self.parts.wpn_fps_snp_troglodyte_b_long.stats = {}

		self.parts.wpn_fps_snp_troglodyte_thing.supported = true
		self.parts.wpn_fps_snp_troglodyte_thing.forbids = {
			"wpn_fps_snp_troglodyte_b_long",
			"wpn_fps_snp_troglodyte_ns_supp"
		}
		self.parts.wpn_fps_snp_troglodyte_thing.stats = {
			damage = 150,
			recoil = -18,
			concealment = -18,
			total_ammo_mod = -85,
			extra_ammo = -4,
			reload = 7
		}
		self.parts.wpn_fps_snp_troglodyte_thing.custom_stats = {
			alt_desc = "bm_heavy_ap_no_mult_weapon_sc_desc",
			muzzleflash = "effects/payday2/particles/weapons/hailstorm_volley_effect",
			trail_effect = "effects/particles/weapons/sniper_trail_sc",
			fire2 = "sniper_npc1c_1shot",
			stop_fire2 = "hailstorm_shotgun_fire_single",
			can_shoot_through_titan_shield = true,
			ads_speed_mult = 1.45,
			falloff_start_mult = 0.5,
			falloff_end_mult = 0.5,
			ammo_pickup_min_mul = 0.1,
			ammo_pickup_max_mul = 0.1,
			alt_ammo_pickup_min_mul = 0.1,
			alt_ammo_pickup_max_mul = 0.1,
			hip_mult = 10,
			rof_mult = 0.76923,
			block_b_storm = true,
			sms = 0.5,
			no_chamber = true
		}

		self.parts.wpn_fps_snp_troglodyte_s_full.supported = true
		self.parts.wpn_fps_snp_troglodyte_s_full.stats = deep_clone(stocks.add_fixed_stats)
		self.parts.wpn_fps_snp_troglodyte_s_full.custom_stats = deep_clone(stocks.add_fixed_stats)

	end

	if self.parts.wpn_fps_ass_mcx_spear_am_default then ---RJC9000 and PlayBONK's SIG MCX Spear

		--no
		self.parts.wpn_fps_ass_mcx_spear_am_default.supported = true
		self.parts.wpn_fps_ass_mcx_spear_am_default.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_am_default.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_am_default.custom_stats = nil
		self.parts.wpn_fps_ass_mcx_spear_am_creedmoor.supported = true
		self.parts.wpn_fps_ass_mcx_spear_am_creedmoor.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_am_creedmoor.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_am_creedmoor.custom_stats = nil
		self.parts.wpn_fps_ass_mcx_spear_am_762.supported = true
		self.parts.wpn_fps_ass_mcx_spear_am_762.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_am_762.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_am_762.custom_stats = nil

		--made to default option
		self.parts.wpn_fps_ass_mcx_spear_irons_rear.supported = true
		self.parts.wpn_fps_ass_mcx_spear_irons_rear.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_irons_rear.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_irons_rear.custom_stats = nil
		self.parts.wpn_fps_ass_mcx_spear_irons_rear.stance_mod = {
			wpn_fps_ass_mcx_spear = {
				translation = Vector3(-0.0, -10, 0.05),
				rotation = Rotation(0.1, -0.1, 0)
			}
		}
		--hidden for now
		self.parts.wpn_fps_ass_mcx_spear_irons_rear_folded.supported = true
		self.parts.wpn_fps_ass_mcx_spear_irons_rear_folded.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_irons_rear_folded.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_irons_rear_folded.custom_stats = nil

		--2042 Irons
		self.parts.wpn_fps_ass_2042_spear_irons_rear.supported = true
		self.parts.wpn_fps_ass_2042_spear_irons_rear.stats = { value = 0 }
		self.parts.wpn_fps_ass_2042_spear_irons_rear.custom_stats = nil
		self.parts.wpn_fps_ass_2042_spear_irons_rear.stance_mod = {
			wpn_fps_ass_mcx_spear = {
				translation = Vector3(-0.0, -10, -0.02),
				rotation = Rotation(0.1, -0.1, 0)
			}
		}
		--hidden for now
		self.parts.wpn_fps_ass_2042_spear_irons_rear_folded.supported = true
		self.parts.wpn_fps_ass_2042_spear_irons_rear_folded.pcs = nil
		self.parts.wpn_fps_ass_2042_spear_irons_rear_folded.stats = { value = 0 }
		self.parts.wpn_fps_ass_2042_spear_irons_rear_folded.custom_stats = nil

		--default stock
		self.parts.wpn_fps_ass_mcx_spear_stock.supported = true
		self.parts.wpn_fps_ass_mcx_spear_stock.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_stock.custom_stats = nil
		--2042 stock
		self.parts.wpn_fps_ass_2042_spear_stock.supported = true
		self.parts.wpn_fps_ass_2042_spear_stock.stats = { value = 0 }
		self.parts.wpn_fps_ass_2042_spear_stock.custom_stats = nil
		--folding stock
		self.parts.wpn_fps_ass_mcx_spear_stock_visor.supported = true
		self.parts.wpn_fps_ass_mcx_spear_stock_visor.stats = deep_clone(stocks.adj_to_fold_stats)
		self.parts.wpn_fps_ass_mcx_spear_stock_visor.custom_stats = deep_clone(stocks.adj_to_fold_stats)

		--hidden for now
		self.parts.wpn_fps_ass_mcx_spear_angled_irons_no.supported = true
		self.parts.wpn_fps_ass_mcx_spear_angled_irons_no.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_angled_irons_no.stats = { value = 0 }
		self.parts.wpn_fps_ass_mcx_spear_angled_irons_no.custom_stats = nil

		--Photoshop Mag
		self.parts.wpn_fps_ass_mcx_spear_magazine_meme.supported = true
		self.parts.wpn_fps_ass_mcx_spear_magazine_meme.stats = {}
		self.parts.wpn_fps_ass_mcx_spear_magazine_meme.custom_stats = nil

		--Lancer Mag
		self.parts.wpn_fps_ass_2042_spear_magazine_2.supported = true
		self.parts.wpn_fps_ass_2042_spear_magazine_2.stats = {
			extra_ammo = 10,
			concealment = -1,
			reload = -1
		}
		self.parts.wpn_fps_ass_2042_spear_magazine_2.custom_stats = {
			ads_speed_mult = 1.025
		}

		--MAWL Gadget
		self.parts.wpn_fps_ass_mcx_spear_mawl.supported = true
		self.parts.wpn_fps_ass_mcx_spear_mawl.stats = {}

		--DD Grip
		self.parts.wpn_fps_ass_mcx_spear_vg_bcm.supported = true
		self.parts.wpn_fps_ass_mcx_spear_vg_bcm.stats = {
			value = 0
		}
		--DD Grip
		self.parts.wpn_fps_ass_mcx_spear_vg_dd.supported = true
		self.parts.wpn_fps_ass_mcx_spear_vg_dd.stats = {
			value = 1,
			recoil = 2,
			concealment = -1
		}

		--Default Suppressor
		self.parts.wpn_fps_ass_mcx_spear_suppressor.supported = true
		self.parts.wpn_fps_ass_mcx_spear_suppressor.pcs = nil
		self.parts.wpn_fps_ass_mcx_spear_suppressor.stats = { 
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_ass_mcx_spear_suppressor.custom_stats = nil

		self.parts.wpn_fps_ass_mcx_spear_optic_ngsw.supported = true
		self.parts.wpn_fps_ass_mcx_spear_optic_ngsw.stats = {
			value = 0,
			zoom = 8
		}
		self.parts.wpn_fps_ass_mcx_spear_optic_ngsw.stance_mod = {
			wpn_fps_ass_mcx_spear = {
				translation = Vector3(-0.0, -10, 1.4),
				rotation = Rotation(0.1, -0.1, 0)
			}
		}

		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.supported = true
		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.stats = deep_clone(barrels.long_b3_stats)
		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.custom_stats = deep_clone(barrels.long_b3_custom_stats)
		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.has_description = false
		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.forbids = nil
		self.parts.wpn_fps_ass_mcx_spear_barrel_marksman.perks = nil

		self.wpn_fps_ass_mcx_spear.override = self.wpn_fps_ass_mcx_spear.override or {}
		self.wpn_fps_ass_mcx_spear.override.wpn_fps_smg_schakal_vg_surefire = {
			stats = {
				value = 1,
				recoil = 2,
				concealment = -1
			}
		}
		self.wpn_fps_ass_mcx_spear.override.wpn_fps_upg_m4_s_standard = {
			stats = {},
			custom_stats = {},
		}

		self.wpn_fps_ass_mcx_spear.default_blueprint[1] = "wpn_fps_ass_mcx_spear_handguard"
		self.wpn_fps_ass_mcx_spear.default_blueprint[2] = "wpn_fps_ass_mcx_spear_handguard"
		self.wpn_fps_ass_mcx_spear.default_blueprint[8] = "wpn_fps_ass_mcx_spear_irons_rear"

		table.insert(self.wpn_fps_ass_mcx_spear.uses_parts, "wpn_fps_sho_sko12_stock")

		self.wpn_fps_ass_mcx_spear_npc.default_blueprint = deep_clone(self.wpn_fps_ass_mcx_spear.default_blueprint)
		self.wpn_fps_ass_mcx_spear_npc.override = deep_clone(self.wpn_fps_ass_mcx_spear.override)
		self.wpn_fps_ass_mcx_spear_npc.uses_parts = deep_clone(self.wpn_fps_ass_mcx_spear.uses_parts)
	end

	if self.parts.wpn_fps_upg_jackhammer_i_autofire then --Pawcio's Jackhammer

		self.parts.wpn_fps_upg_jackhammer_i_autofire.supported = true
		self.parts.wpn_fps_upg_jackhammer_i_autofire.pcs = nil
		self.parts.wpn_fps_upg_jackhammer_i_autofire.stats = {}
		self.parts.wpn_fps_upg_jackhammer_i_autofire.custom_stats = nil

		self.parts.wpn_fps_upg_jackhammer_barrel_supp.supported = true
		self.parts.wpn_fps_upg_jackhammer_barrel_supp.stats = {
			value = 2,
			suppression = 12,
			alert_size = -1
		}
		self.parts.wpn_fps_upg_jackhammer_barrel_supp.custom_stats = nil
		
		self.parts.wpn_fps_upg_jackhammer_barrel_no_brake.supported = true
		self.parts.wpn_fps_upg_jackhammer_barrel_no_brake.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_jackhammer_barrel_no_brake.custom_stats = nil
		
		self.parts.wpn_fps_upg_jackhammer_barrel_long.supported = true
		self.parts.wpn_fps_upg_jackhammer_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_jackhammer_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.wpn_fps_shot_jackhammer.override = self.wpn_fps_shot_jackhammer.override or {}
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_slug = a_slug_semi_override
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_custom = a_custom_semi_override
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_custom_free = a_custom_semi_override	
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_explosive = a_explosive_semi_override
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_rip = a_rip_semi_override
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_piercing = a_piercing_semi_override
		self.wpn_fps_shot_jackhammer.override.wpn_fps_upg_a_dragons_breath = a_dragons_breath_semi_override
	end

	if self.parts.wpn_fps_ass_nova4_iw_reflex then --RJC9000 and Synd1cate's Infinite Warfare NV4

		self.parts.wpn_fps_ass_nova4_iw_reflex.supported = true
		self.parts.wpn_fps_ass_nova4_iw_reflex.desc_id = "bm_wp_upg_o_iwrds"
		self.parts.wpn_fps_ass_nova4_iw_reflex.stats = deep_clone(self.parts.wpn_fps_upg_o_eotech.stats)

		self.parts.wpn_fps_ass_nova4_iw_elo.supported = true
		self.parts.wpn_fps_ass_nova4_iw_elo.desc_id = "bm_wp_upg_o_iwelo"
		self.parts.wpn_fps_ass_nova4_iw_elo.stats = deep_clone(self.parts.wpn_fps_upg_o_docter.stats)

		self.parts.wpn_fps_ass_nova4_barrel_supp.supported = true
		self.parts.wpn_fps_ass_nova4_barrel_supp.stats = {
			value = 3,
			suppression = 12,
			alert_size = -1
		}

		self.parts.wpn_fps_ass_nova4_bolt.supported = true
		self.parts.wpn_fps_ass_nova4_bolt.custom_stats = {
			hip_mult = 4
		}

		self.parts.wpn_fps_ass_nova4_stock.supported = true
		self.parts.wpn_fps_ass_nova4_stock.stats = { value = 0 }
		self.parts.wpn_fps_ass_nova4_stock.custom_stats = nil

		self.parts.wpn_fps_ass_nova4_magazine.supported = true
		self.parts.wpn_fps_ass_nova4_magazine.stats = { value = 0 }
		self.parts.wpn_fps_ass_nova4_magazine.custom_stats = nil
		self.parts.wpn_fps_ass_nova4_magazine_rare.supported = true
		self.parts.wpn_fps_ass_nova4_magazine_rare.stats = { value = 0 }
		self.parts.wpn_fps_ass_nova4_magazine_rare.custom_stats = nil
		self.parts.wpn_fps_ass_nova4_magazine_legendary.supported = true
		self.parts.wpn_fps_ass_nova4_magazine_legendary.stats = { value = 0 }
		self.parts.wpn_fps_ass_nova4_magazine_legendary.custom_stats = nil

		self.parts.wpn_fps_ass_nova4_magazine_ext.supported = true
		self.parts.wpn_fps_ass_nova4_magazine_ext.stats = {
			value = 2,
			concealment = -2,
			reload = -2,
			extra_ammo = 15
		}

		self.parts.wpn_fps_ass_nova4_laser.supported = true
		self.parts.wpn_fps_ass_nova4_laser.stats = {}

		self.parts.wpn_fps_ass_nova4_receiver_upper_legendary.supported = true
		self.parts.wpn_fps_ass_nova4_receiver_upper_legendary.has_description = true
		self.parts.wpn_fps_ass_nova4_receiver_upper_legendary.desc_id = "bm_wp_wpn_fps_ass_nova4_flatline_desc"
		self.parts.wpn_fps_ass_nova4_receiver_upper_legendary.stats = {
			value = 10,
			spread = 1
		}
		self.parts.wpn_fps_ass_nova4_receiver_upper_legendary.custom_stats = {
			rof_mult = 0.933006,
			damage_min_mult = 2.4
		}
		
		self.parts.wpn_fps_ass_nova4_receiver_upper_rare.supported = true
		self.parts.wpn_fps_ass_nova4_receiver_upper_rare.has_description = true
		self.parts.wpn_fps_ass_nova4_receiver_upper_rare.desc_id = "bm_wp_wpn_fps_ass_nova4_chaos_desc"
		self.parts.wpn_fps_ass_nova4_receiver_upper_rare.stats = {
			value = 10
		}
		self.parts.wpn_fps_ass_nova4_receiver_upper_rare.custom_stats = {
			rof_mult = 1.166666,
			ads_rof_mult = 0.806722,
			hip_mult = 0.8
		}
		
		self.wpn_fps_ass_nova4.override = self.wpn_fps_ass_nova4.override or {}
		self.wpn_fps_ass_nova4.override.wpn_fps_upg_m4_s_standard = {
			stats = {},
			custom_stats = {},
		}

		self.wpn_fps_ass_nova4.default_blueprint[7] = "wpn_fps_ass_nova4_receiver_lower"

		self.wpn_fps_ass_nova4.uses_parts[59] = "wpn_fps_ass_nova4_receiver_lower"
		self.wpn_fps_ass_nova4.uses_parts[60] = "wpn_fps_ass_nova4_receiver_lower"

		table.insert(self.wpn_fps_ass_nova4.uses_parts, "wpn_fps_sho_sko12_stock")

		self.wpn_fps_ass_nova4_npc.default_blueprint = deep_clone(self.wpn_fps_ass_nova4.default_blueprint)
		self.wpn_fps_ass_nova4_npc.override = deep_clone(self.wpn_fps_ass_nova4.override)
		self.wpn_fps_ass_nova4_npc.uses_parts = deep_clone(self.wpn_fps_ass_nova4.uses_parts)
	end

	if self.parts.wpn_fps_rsass_handguard then --youngrich99 and FrenchyAU's Remington RSASS

		self.parts.wpn_fps_rsass_barrel_short.supported = true
		self.parts.wpn_fps_rsass_barrel_short.stats = deep_clone(barrels.short_b3_stats)
		self.parts.wpn_fps_rsass_barrel_short.custom_stats = deep_clone(barrels.short_b3_custom_stats)

		self.wpn_fps_ass_rsass.override = self.wpn_fps_ass_rsass.override or {}
	
		self.wpn_fps_ass_rsass.override.wpn_fps_upg_m4_s_standard = {
			stats = deep_clone(stocks.fixed_to_adj_dual_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_dual_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.fixed_to_adj_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_acc_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.fixed_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_adj_rec_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.fixed_to_hvy_acc_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_acc_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.fixed_to_hvy_rec_stats),
			custom_stats = deep_clone(stocks.fixed_to_hvy_rec_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_m4_uupg_s_fold = {
			stats = deep_clone(stocks.fixed_to_folder_stats),
			custom_stats = deep_clone(stocks.fixed_to_folder_stats)
		}
		self.wpn_fps_ass_rsass.override.wpn_fps_ass_contraband_s_tecci = {
			stats = deep_clone(stocks.fixed_to_nocheeks_stats),
			custom_stats = deep_clone(stocks.fixed_to_nocheeks_stats)
		}
		self.wpn_fps_ass_rsass_npc.override = deep_clone(self.wpn_fps_ass_rsass.override)
	end

	if self.parts.wpn_fps_upg_m_quad100 then
		self.parts.wpn_fps_upg_m_quad100.supported = true
		self.parts.wpn_fps_upg_m_quad100.stats = deep_clone(self.parts.wpn_fps_upg_m4_m_drum.stats)
		self.parts.wpn_fps_upg_m_quad100.custom_stats = deep_clone(self.parts.wpn_fps_upg_m4_m_drum.custom_stats)
	end

	if self.parts.wpn_fps_ass_ar18_barrel then

		self.parts.wpn_fps_upg_ar18_barrel_long.supported = true
		self.parts.wpn_fps_upg_ar18_barrel_long.stats = deep_clone(barrels.long_b2_stats)
		self.parts.wpn_fps_upg_ar18_barrel_long.custom_stats = deep_clone(barrels.long_b2_custom_stats)

		self.parts.wpn_fps_upg_ar18_barrel_short.supported = true
		self.parts.wpn_fps_upg_ar18_barrel_short.stats = deep_clone(barrels.short_b2_stats)
		self.parts.wpn_fps_upg_ar18_barrel_short.custom_stats = deep_clone(barrels.short_b2_custom_stats)

		self.parts.wpn_fps_upg_ar18_bolt_firerate.supported = true
		self.parts.wpn_fps_upg_ar18_bolt_firerate.pcs = nil
		self.parts.wpn_fps_upg_ar18_bolt_firerate.stats = { value = 0 }

		self.parts.wpn_fps_ass_ar18_mag.supported = true
		self.parts.wpn_fps_ass_ar18_mag.stats = { value = 0 }

		self.parts.wpn_fps_upg_ar18_mag_window.supported = true
		self.parts.wpn_fps_upg_ar18_mag_window.has_description = false
		self.parts.wpn_fps_upg_ar18_mag_window.stats = {
			value = 0
		}

		self.parts.wpn_fps_upg_ar18_mag_30.supported = true
		self.parts.wpn_fps_upg_ar18_mag_30.has_description = false
		self.parts.wpn_fps_upg_ar18_mag_30.stats = {
			value = 1,
			extra_ammo = 10,
			concealment = -1,
			reload = -1
		}
		self.parts.wpn_fps_upg_ar18_mag_30.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_ar18_mag_30_dual.supported = true
		self.parts.wpn_fps_upg_ar18_mag_30_dual.has_description = false
		self.parts.wpn_fps_upg_ar18_mag_30_dual.stats = {
			value = 2,
			extra_ammo = 10,
			spread = -1,
			concealment = -2,
			reload = 2
		}
		self.parts.wpn_fps_upg_ar18_mag_30_dual.custom_stats = {
			ads_speed_mult = 1.025
		}

		self.parts.wpn_fps_upg_ar18_scope.supported = true
		self.parts.wpn_fps_upg_ar18_scope.has_description = true
		self.parts.wpn_fps_upg_ar18_scope.desc_id = "bm_wp_upg_o_3"
		self.parts.wpn_fps_upg_ar18_scope.stats = {
			value = 2,
			zoom = 20
		}

		self.parts.wpn_fps_upg_ar18_stock_folded.supported = true
		self.parts.wpn_fps_upg_ar18_stock_folded.stats = deep_clone(stocks.fixed_to_folded_stats)
		self.parts.wpn_fps_upg_ar18_stock_folded.custom_stats = deep_clone(stocks.fixed_to_folded_stats)

		self.parts.wpn_fps_upg_ar18_stock_removed.supported = true
		self.parts.wpn_fps_upg_ar18_stock_removed.stats = deep_clone(stocks.remove_fixed_stats)
		self.parts.wpn_fps_upg_ar18_stock_removed.custom_stats = deep_clone(stocks.remove_fixed_stats)

		table.insert(self.wpn_fps_ass_ar18.uses_parts, "wpn_fps_ass_shak12_ns_muzzle")
		table.insert(self.wpn_fps_ass_ar18.uses_parts, "wpn_fps_ass_shak12_ns_suppressor")
		table.insert(self.wpn_fps_ass_ar18.uses_parts, "wpn_fps_lmg_hk51b_ns_jcomp")

		self.wpn_fps_ass_ar18_npc.uses_parts = deep_clone(self.wpn_fps_ass_ar18.uses_parts)
	end

	if self.parts.wpn_fps_upg_g19_fire_selector then

		self.parts.wpn_fps_upg_g19_grip_ctc.supported = true
		self.parts.wpn_fps_upg_g19_grip_ctc.stats = {
			value = 1
		}
		self.parts.wpn_fps_upg_g19_grip_force.supported = true
		self.parts.wpn_fps_upg_g19_grip_force.stats = {
			value = 1,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g19_grip_hogue.supported = true
		self.parts.wpn_fps_upg_g19_grip_hogue.stats = {
			value = 1,
			recoil = -2,
			concealment = 1
		}
		self.parts.wpn_fps_upg_g19_grip_hogue.custom_stats = {
			ads_speed_mult = 0.975
		}
		self.parts.wpn_fps_upg_g19_grip_pachymar.supported = true
		self.parts.wpn_fps_upg_g19_grip_pachymar.stats = {
			value = 1,
			spread = 1,
			concealment = -1
		}

		self.parts.wpn_fps_upg_g19_magwell.supported = true
		self.parts.wpn_fps_upg_g19_magwell.has_description = false
		self.parts.wpn_fps_upg_g19_magwell.stats = {
			value = 4,
			reload = 1,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g19_magwellcarver.supported = true
		self.parts.wpn_fps_upg_g19_magwellcarver.has_description = false
		self.parts.wpn_fps_upg_g19_magwellcarver.stats = {
			value = 6,
			reload = 1,
			recoil = 2,
			concealment = -2
		}

		self.parts.wpn_fps_upg_g19_slide_lightweight.supported = true
		self.parts.wpn_fps_upg_g19_slide_lightweight.stats = {
			value = 2,
			recoil = -2,
			concealment = 1
		}

		self.parts.wpn_fps_upg_g19_sight_gns01.supported = true
		self.parts.wpn_fps_upg_g19_sight_gns01.stats = {
			value = 1
		}
		self.parts.wpn_fps_upg_g19_sight_truglo.custom_stats = nil
		self.parts.wpn_fps_upg_g19_sight_truglo.supported = true
		self.parts.wpn_fps_upg_g19_sight_truglo.stats = {
			value = 1
		}
		self.parts.wpn_fps_upg_g19_sight_truglo.custom_stats = nil
		self.parts.wpn_fps_upg_g19_sight_mount.supported = true
		self.parts.wpn_fps_upg_g19_sight_mount.stats = {
			value = 1
		}
		self.parts.wpn_fps_upg_g19_sight_mount.custom_stats = nil

		self.parts.wpn_fps_upg_g19_mag17.supported = true
		self.parts.wpn_fps_upg_g19_mag17.has_description = false
		self.parts.wpn_fps_upg_g19_mag17.stats = {
			value = 1,
			extra_ammo = 2,
			reload = -1
		}
		self.parts.wpn_fps_upg_g19_mag32.supported = true
		self.parts.wpn_fps_upg_g19_mag32.has_description = false
		self.parts.wpn_fps_upg_g19_mag32.stats = {
			value = 6,
			extra_ammo = 16,
			concealment = -2,
			reload = -2
		}
		self.parts.wpn_fps_upg_g19_mag32.custom_stats = {
			ads_speed_mult = 1.05
		}
		self.parts.wpn_fps_upg_g19_mag33.supported = true
		self.parts.wpn_fps_upg_g19_mag33.has_description = false
		self.parts.wpn_fps_upg_g19_mag33.stats = {
			value = 6,
			extra_ammo = 18,
			concealment = -2,
			reload = -3
		}
		self.parts.wpn_fps_upg_g19_mag33.custom_stats = {
			ads_speed_mult = 1.05
		}

		self.parts.wpn_fps_upg_g19_barrel_threaded.supported = true
		self.parts.wpn_fps_upg_g19_barrel_threaded.stats = deep_clone(barrels.long_b1_stats)
		self.parts.wpn_fps_upg_g19_barrel_threaded.custom_stats = deep_clone(barrels.long_b1_custom_stats)

		self.parts.wpn_fps_upg_g19_barrel_ported.supported = true
		self.parts.wpn_fps_upg_g19_barrel_ported.stats = {
			value = 2,
			recoil = 2,
			concealment = -1
		}
		self.parts.wpn_fps_upg_g19_barrel_ported.custom_stats = nil

		--auto-sear
		self.parts.wpn_fps_upg_g19_fire_selector.supported = true
		self.parts.wpn_fps_upg_g19_fire_selector.stats = {
			value = 5,
			recoil = -4,
			spread = -1
		}
		self.parts.wpn_fps_upg_g19_fire_selector.custom_stats = {
			rof_mult = 1.05
		}

		self.wpn_fps_pis_g19.override = self.wpn_fps_pis_g19.override or {}

	end

	if self.parts.wpn_fps_upg_svd_b_draco then

		self.parts.wpn_fps_upg_svd_b_draco.supported = true
		self.parts.wpn_fps_upg_svd_b_draco.stats = {
			value = 5,
			spread = -6,
			recoil = -4,
			concealment = 8
		}
		self.parts.wpn_fps_upg_svd_b_draco.custom_stats = {
			falloff_start_mult = 0.55,
			falloff_end_mult = 0.55,
			ads_speed_mult = 0.85
		} 
		self.parts.wpn_fps_upg_svd_b_draco.forbids = { "wpn_fps_snp_siltstone_fg_polymer" }
		self.parts.wpn_fps_upg_svd_b_draco.override = { 
			wpn_fps_snp_siltstone_fg_wood = {
				unit = "units/mods/weapons/wpn_fps_svd_upg_fg_draco/wpn_fps_svd_upg_fg_draco"
			}
		}

		self.parts.wpn_fps_svd_upg_fg_draco.supported = true
		self.parts.wpn_fps_svd_upg_fg_draco.pcs = nil
		self.parts.wpn_fps_svd_upg_fg_draco.stats = { value = 0 }

		self.parts.wpn_fps_svd_upg_s_draco.supported = true
		self.parts.wpn_fps_svd_upg_s_draco.stats = deep_clone(stocks.fixed_to_folder_stats)
		self.parts.wpn_fps_svd_upg_s_draco.custom_stats = deep_clone(stocks.fixed_to_folder_stats)
	end

--Resmod Custom Weapon stuff

--Raze's Fury
if self.wpn_fps_pis_shatters_fury then
	self.wpn_fps_pis_shatters_fury.adds = {
		wpn_fps_upg_o_specter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_aimpoint_2 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_docter = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_t1micro = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cmore = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_acog = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_cs = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_eotech_xps = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_reflex = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx01 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_rx30 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_spot = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_bmg = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_fc1 = {
			"wpn_fps_pis_rage_o_adapter"
		},
		wpn_fps_upg_o_uh = {
			"wpn_fps_pis_rage_o_adapter"
		}			
	}
	self.wpn_fps_pis_shatters_fury.override = {
		wpn_fps_pis_rage_lock = { 
			forbids = {}
		}
	}	
	self.wpn_fps_pis_shatters_fury.uses_parts = {
		"wpn_fps_pis_shatters_fury_body_standard",
		"wpn_fps_pis_shatters_fury_body_smooth",
		"wpn_fps_pis_shatters_fury_b_standard",
		"wpn_fps_pis_shatters_fury_b_short",
		"wpn_fps_pis_shatters_fury_b_long",
		"wpn_fps_pis_shatters_fury_b_comp1",
		"wpn_fps_pis_shatters_fury_b_comp2",
		"wpn_fps_pis_shatters_fury_g_standard",
		"wpn_fps_pis_shatters_fury_g_ergo",
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_pis_rage_o_adapter",
		"wpn_fps_pis_rage_lock",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_xpsg33_magnifier",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		--Weapon Boosts
		"wpn_fps_upg_bonus_concealment_p1",
		"wpn_fps_upg_bonus_concealment_p2",
		"wpn_fps_upg_bonus_concealment_p3",
		"wpn_fps_upg_bonus_damage_p1",
		"wpn_fps_upg_bonus_damage_p2",
		"wpn_fps_upg_bonus_recoil_p1",
		"wpn_fps_upg_bonus_spread_n1",
		"wpn_fps_upg_bonus_spread_p1",
		"wpn_fps_upg_bonus_team_exp_money_p3",
		"wpn_fps_upg_bonus_total_ammo_p3",
		"wpn_fps_upg_bonus_total_ammo_p1",
		"wpn_fps_upg_bonus_sc_none"
	}
end

--OICW
if self.wpn_fps_ass_osipr then
	self.parts.wpn_fps_ass_osipr_scope.stance_mod.wpn_fps_ass_osipr.translation = Vector3(0.035, 0, -0.68)
	self.parts.wpn_fps_ass_osipr_scope.material_parameters = {
		gfx_reddot = {
			{
				id = Idstring("holo_reticle_scale"),
				value = Vector3(0.2, 1.5, 40),
				condition = function ()
					return not _G.IS_VR
				end
			},
			{
				id = Idstring("holo_reticle_scale"),
				value = Vector3(0.2, 1, 20),
				condition = function ()
					return _G.IS_VR
				end
			}
		}
	}
	self.parts.wpn_fps_ass_osipr_b_standard.custom = false
	self.parts.wpn_fps_ass_osipr_body.custom = false
	self.parts.wpn_fps_ass_osipr_bolt.custom = false
	self.parts.wpn_fps_ass_osipr_gl.custom = false
	self.parts.wpn_fps_ass_osipr_gl_incendiary.custom = false
	self.parts.wpn_fps_ass_osipr_scope.custom = false
	self.parts.wpn_fps_ass_osipr_m_gl.custom = false
	self.parts.wpn_fps_ass_osipr_m_gl_incendiary.custom = false
end

if self.wpn_fps_pis_socom then

	self.parts.wpn_fps_pis_socom_sight.pcs = nil
	self.parts.wpn_fps_pis_socom_sight.supported = true
	self.parts.wpn_fps_pis_socom_sight.stats = { value = 0 }

	self.parts.wpn_fps_upg_fl_pis_socomlam.supported = true
	self.parts.wpn_fps_upg_fl_pis_socomlam.stats = { value = 1 }
	--Part Additions
	table.insert(self.wpn_fps_pis_usp.uses_parts, "wpn_fps_upg_fl_pis_socomlam")
	table.insert(self.wpn_fps_pis_usp_npc.uses_parts, "wpn_fps_upg_fl_pis_socomlam")		

	self.wpn_fps_pis_usp_npc.uses_parts = deep_clone(self.wpn_fps_pis_usp.uses_parts)	

	table.insert(self.wpn_fps_pis_x_usp.uses_parts, "wpn_fps_upg_fl_pis_socomlam")
	table.insert(self.wpn_fps_pis_x_usp_npc.uses_parts, "wpn_fps_upg_fl_pis_socomlam")		

	self.wpn_fps_pis_x_usp_npc.uses_parts = deep_clone(self.wpn_fps_pis_x_usp.uses_parts)	
	
end


--Deal with legendary and semi-hidden mods so they don't waste time triggering custom mod stat generation.
--The game seems to ignore some of these because reasons???
self.parts.wpn_fps_shot_r870_s_nostock_single.supported = true
self.parts.wpn_fps_pis_1911_fl_legendary.supported = true
self.parts.wpn_fps_pis_deagle_b_long.supported = true
self.parts.wpn_fps_sho_boot_fg_legendary.supported = true
self.parts.wpn_fps_ass_74_b_legend.supported = true
self.parts.wpn_fps_shot_shorty_fg_legendary.supported = true
self.parts.wpn_fps_lmg_svinet_b_standard.supported = true
self.parts.wpn_fps_shot_huntsman_body_standard.supported = true
self.parts.wpn_fps_ass_vhs_m.supported = true
self.parts.wpn_fps_ass_m14_body_legendary.supported = true
self.parts.wpn_fps_snp_model70_s_standard.supported = true
self.parts.wpn_fps_ass_m16_b_legend.supported = true
self.parts.wpn_fps_sho_ksg_b_legendary.supported = true
self.parts.wpn_fps_sho_boot_b_legendary.supported = true
self.parts.wpn_fps_ass_m16_s_legend.supported = true
self.parts.wpn_fps_ass_tecci_b_legend.supported = true
self.parts.wpn_fps_shot_r870_b_legendary.supported = true
self.parts.wpn_fps_pis_judge_b_legend.supported = true
self.parts.wpn_fps_shot_shorty_b_legendary.supported = true
self.parts.wpn_fps_ass_m14_b_legendary.supported = true

local exclude = {
	"wpn_fps_pis_maxim9_a_tranq",
	"wpn_fps_snp_mosin_a_tranq",
	"wpn_fps_lmg_mg42_dummy_mag",
	"wpn_fps_upg_a_custom",
	"wpn_fps_upg_a_custom_free",
	"wpn_fps_upg_a_piercing",
	"wpn_fps_upg_a_slug",
	"wpn_fps_upg_a_explosive",
	"wpn_fps_upg_a_dragons_breath",
	"wpn_fps_upg_a_rip",
	"wpn_fps_bow_hunter_m_standard",
	"wpn_fps_upg_a_crossbow_explosion",
	"wpn_fps_upg_a_crossbow_poison",
	"wpn_fps_bow_frankish_m_standard",
	"wpn_fps_bow_frankish_m_poison",
	"wpn_fps_bow_frankish_m_explosive",
	"wpn_fps_bow_arblast_m_standard",
	"wpn_fps_bow_arblast_m_explosive",
	"wpn_fps_bow_arblast_m_poison",
	"wpn_fps_bow_ecp_m_arrows",
	"wpn_fps_bow_ecp_m_arrows_standard",
	"wpn_fps_bow_ecp_m_arrows_explosive",
	"wpn_fps_bow_ecp_m_arrows_poison",
	"wpn_fps_bow_plainsrider_m_standard",
	"wpn_fps_upg_a_bow_explosion",
	"wpn_fps_upg_a_bow_poison",
	"wpn_fps_bow_long_m_standard",
	"wpn_fps_bow_long_m_explosive",
	"wpn_fps_bow_long_m_poison",
	"wpn_fps_bow_elastic_m_standard",
	"wpn_fps_bow_elastic_m_explosive",
	"wpn_fps_bow_elastic_m_poison",
	"wpn_fps_upg_a_grenade_launcher_incendiary",
	"wpn_fps_upg_a_grenade_launcher_electric",
	"wpn_fps_upg_a_grenade_launcher_poison",
	"wpn_fps_upg_a_grenade_launcher_incendiary_arbiter",
	"wpn_fps_upg_a_grenade_launcher_electric_arbiter",
	"wpn_fps_upg_a_grenade_launcher_poison_arbiter",
	"wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl",
	"wpn_fps_upg_a_grenade_launcher_electric_ms3gl",
	"wpn_fps_upg_a_grenade_launcher_poison_ms3gl",
	"wpn_fps_gre_ms3gl_conversion_grenade_poison",
	"wpn_fps_ass_osipr_m_gl",
	"wpn_fps_ass_osipr_m_gl_incendiary",
	"wpn_fps_ass_osipr_m_gl_electric",
	"wpn_fps_ass_osipr_m_gl_poison",
}

for _, part in pairs(self.parts) do
	if not part.supported and part.stats then
		local cosmetic_part = true
		for name, stat in pairs(part.stats) do
			if name ~= "value" and name ~= "zoom" and name ~= "gadget_zoom" and name ~= "spread_moving" and stat ~= 0 then
				cosmetic_part = nil
			end
		end

		if not cosmetic_part then
			self:generate_custom_mod_stats(part)
		end
	end
	if part.type then
		for k, v in ipairs(exclude) do
			if part and not part.no_cull and _ == v then
				part.no_cull = true
				break
			end
		end
		if part.type == "ammo" then
			if part.cull or not part.no_cull then
				part.pcs = nil
				part.stats = { value = 0 }
				part.custom_stats = nil
			end
		else
			if not part.keep_damage and part.stats then
				part.stats.damage = nil
			end
		end
	end
end
	
--SC mod shit below--

	self.parts.wpn_fps_upg_a_slug_fire = {
		type = "ammo",
		name_id = "bm_wp_upg_a_slug_sc_fire",
		desc_id = "bm_wp_upg_a_slug_fire_desc",
		a_obj = "a_body",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_upg_a_slug_fire",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			concealment = -5,
			total_ammo_mod = -5,
			damage = 74,	
			recoil = -2,
			spread = 12,
			suppression = -1,
			moving_spread = 0
		},
		custom_stats = {
			falloff_start_mult = 1,
			falloff_end_mult = 1,
			rays = 1,
			armor_piercing_add = 1,
			can_shoot_through_enemy = true,
			can_shoot_through_shield = true,
			can_shoot_through_wall = true,
			bullet_class = "FlameBulletBase",
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
			fire_dot_data = {
				dot_damage = "0",
				dot_trigger_chance = "100",
				dot_length = "3",
				dot_tick_period = "0.5"
			}
		},
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		hit_effect = "dragonsbreath",
		internal_part = true,
		sub_type = "ammo_dragons_breath"
	}
	self.parts.wpn_fps_upg_ammo_half_that = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_halfthatkit",
		desc_id = "bm_wp_upg_a_halfthatkit_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {},
		custom_stats = {},
		internal_part = true
	}
	self.parts.wpn_lmg_rpk_m_ban = {
		pcs = {},
		type = "magazine",
		name_id = "bm_wp_rpk_m_ban_sc",
		a_obj = "a_m",
		bullet_objects = {prefix = "g_bullet_", amount = 1},
		dlc = "sc",
		alt_icon = "guis/textures/pd2/blackmarket/icons/mods/wpn_fps_lmg_rpk_m_standard",
		unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_fps_lmg_rpk_m_standard",
		supported = true,
		stats = {
			value = 5,
			concealment = 2,
			reload = 2,
			extra_ammo = -30,
		}
	}		
	self.parts.wpn_fps_upg_extra_mp_lock = {
		type = "extra",
		name_id = "bm_wp_upg_extra_mp_lock",
		desc_id = "bm_wp_upg_extra_mp_lock_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {value = 1},
		forbids = {
			"wpn_fps_upg_i_singlefire",
			"wpn_fps_upg_i_autofire"
		},
		perks = {
			"fire_mode_single"
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_extra_mp_unlock = {
		pcs = {},
		type = "extra",
		name_id = "bm_wp_upg_extra_mp_unlock",
		desc_id = "bm_wp_upg_extra_mp_unlock_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/dlcs/tng/textures/pd2/blackmarket/icons/side_job_rewards/gage_mod_rewards",
		dlc = "sc",
		supported = true,
		stats = {value = 1},
		custom_stats = {use_auto_kick = true},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_46custom = {
		type = "ammo",
		name_id = "bm_wp_upg_a_46custom",
		desc_id = "bm_wp_upg_a_46custom_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0,
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_65grendel = {
		type = "ammo",
		name_id = "bm_wp_upg_a_65grendel",
		desc_id = "bm_wp_upg_a_65grendel_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			damage = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_762_sterling = {
		type = "ammo",
		name_id = "bm_wp_upg_a_762_sterling",
		desc_id = "bm_wp_upg_a_762_sterling_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_p = {
		type = "ammo",
		name_id = "bm_wp_upg_a_p",
		desc_id = "bm_wp_upg_a_p_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 3,
			damage = 0
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_mag_msr = {
		type = "ammo",
		name_id = "bm_wp_upg_a_mag_msr",
		desc_id = "bm_wp_upg_a_mag_msr_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		is_a_unlockable = true,
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 0,
			total_ammo_mod = 0,
			damage = 0
		},		
		internal_part = true
	}
	self.parts.wpn_fps_upg_ammo_40sw = {
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_40sw",
		desc_id = "bm_wp_upg_a_40sw_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			suppression = -1,
			total_ammo_mod = -20,
			concealment = -2,
			recoil = -1,
			damage = 10
		},
		internal_part = true
	}
	self.parts.wpn_fps_upg_storm_ammo_45acp = { --mx4 storm 90 dmg conversion
		pcs = {},
		type = "ammo",
		name_id = "bm_wp_upg_a_storm_40acp",
		desc_id = "bm_wp_upg_a_storm_40acp_desc",
		a_obj = "a_body",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		has_description = true,
		alt_icon = "guis/textures/pd2/blackmarket/icons/deployables/ammo_bag",
		dlc = "sc",
		supported = true,
		stats = {
			value = 10,
			suppression = -2,
			total_ammo_mod = -46,
			concealment = -3,
			recoil = -2,
			damage = 35
		},
		internal_part = true,
		forbids = {"wpn_fps_upg_extra_mp_unlock"}
	}
	table.list_append(self.wpn_fps_lmg_hk21.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_m249.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_rpk.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_mg42.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_par.uses_parts, {
		"wpn_fps_upg_i_slower_rof"
	})
	table.list_append(self.wpn_fps_lmg_hk21.uses_parts, {
		"wpn_fps_upg_i_faster_rof"	
	})
	table.list_append(self.wpn_fps_lmg_m249.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_rpk.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_mg42.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})
	table.list_append(self.wpn_fps_lmg_par.uses_parts, {
		"wpn_fps_upg_i_faster_rof"
	})

	--Incendiary Slugs are awesome--

	local colt_weapons = {
		"wpn_fps_ass_m4",
		"wpn_fps_ass_amcar"
	}
	for _, factory_id in ipairs(colt_weapons) do
		if self[factory_id] and self[factory_id].uses_parts then
			table.insert(self[factory_id].uses_parts, "wpn_fps_upg_ammo_65grendel")
			table.insert(self[factory_id .. "_npc"].uses_parts, "wpn_fps_upg_ammo_65grendel")
		end
	end

	local weapons = {
		"wpn_fps_shot_saiga",
		"wpn_fps_shot_r870",
		"wpn_fps_shot_huntsman",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ben",
		"wpn_fps_sho_striker",
		"wpn_fps_sho_ksg",
		"wpn_fps_pis_judge",
		"wpn_fps_sho_spas12",
		"wpn_fps_shot_b682",
		"wpn_fps_sho_aa12",
		"wpn_fps_shot_m37",
		"wpn_fps_sho_boot"
	}
	--for _, factory_id in ipairs(weapons) do
		--if self[factory_id] and self[factory_id].uses_parts then
		--	table.insert(self[factory_id].uses_parts, "wpn_fps_upg_a_slug_fire")
		--	table.insert(self[factory_id .. "_npc"].uses_parts, "wpn_fps_upg_a_slug_fire")
		--end
	--end

end)


Hooks:PostHook( WeaponFactoryTweakData, "init", "resmod_cap", function(self)
	if WeaponTweakData.SetupAttachmentPoint then
		if not self.wpn_fps_lmg_hk21.override then
			self.wpn_fps_lmg_hk21.override = {}
		end
		self.wpn_fps_lmg_hk21.override.wpn_fps_ass_g3_s_sniper = { a_obj = "a_s_fix" } 
		self.wpn_fps_lmg_hk21.override.wpn_fps_ass_g3_s_wood = { a_obj = "a_s_fix" } 

		self.wpn_fps_ass_ak5.stock_adapter = "wpn_fps_ass_s552_s_m4"
		self.wpn_fps_ass_ak5_npc.stock_adapter = "wpn_fps_ass_s552_s_m4"
		self.wpn_fps_ass_ak5.override.wpn_fps_ass_s552_s_m4 = { a_obj = "a_s_fix" }
		self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_standard = {
			stats = deep_clone(stocks.folder_to_adj_acc1_stats),
			custom_stats = deep_clone(stocks.folder_to_adj_acc1_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_pts = {
			stats = deep_clone(stocks.folder_to_adj_acc2_stats),
			custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_sho_sko12_stock = {
			stats = deep_clone(stocks.folder_to_adj_acc2_stats),
			custom_stats = deep_clone(stocks.folder_to_adj_acc2_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_crane = {
			stats = deep_clone(stocks.folder_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_mk46 = {
			stats = deep_clone(stocks.folder_to_adj_rec_stats),
			custom_stats = deep_clone(stocks.folder_to_adj_rec_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_upg_m4_s_ubr = {
			stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
			custom_stats = deep_clone(stocks.folder_to_hvy_rec2_stats),
			a_obj = "a_s_fix"
		}
		self.wpn_fps_ass_ak5.override.wpn_fps_snp_tti_s_vltor = {
			stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
			custom_stats = deep_clone(stocks.folder_to_hvy_acc2_stats),
			a_obj = "a_s_fix"
		}
		self.parts.wpn_fps_ass_groza_m_standard.a_obj = "a_m_fix"
		self.parts.wpn_fps_ass_groza_m_speed.a_obj = "a_m_fix"
		if not self.wpn_fps_ass_groza.override then
			self.wpn_fps_ass_groza.override = {}
		end
		self.wpn_fps_ass_groza.override.wpn_upg_ak_m_drum = { a_obj = "a_m_fix" } 
		self.wpn_fps_ass_groza.override.wpn_fps_upg_ak_m_quad = { a_obj = "a_m_fix" } 
		self.wpn_fps_ass_groza.override.wpn_fps_upg_ak_m_uspalm = { a_obj = "a_m_fix" } 

		if not self.wpn_fps_ass_asval.override then
			self.wpn_fps_ass_asval.override = {}
		end
		self.wpn_fps_ass_asval.override.wpn_fps_ass_groza_m_speed = {
			unit = "units/pd2_dlc_sawp/weapons/wpn_fps_ass_groza_pts/wpn_fps_ass_groza_m_speed",
			a_obj = "a_m_fix"
		}
	else
		if not self.wpn_fps_lmg_hk21.override then
			self.wpn_fps_lmg_hk21.override = {}
		end
		self.wpn_fps_lmg_hk21.override.wpn_fps_ass_g3_s_sniper = {
			desc_id = "missing_cap",
			unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_s_standard",
			third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
		}
		self.wpn_fps_lmg_hk21.override.wpn_fps_ass_g3_s_wood = {
			desc_id = "missing_cap",
			unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_fps_lmg_hk21_s_standard",
			third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21_pts/wpn_third_lmg_hk21_s_standard"
		}

		if not self.wpn_fps_ass_asval.override then
			self.wpn_fps_ass_asval.override = {}
		end
		self.wpn_fps_ass_asval.override.wpn_fps_ass_groza_m_speed = {
			desc_id = "missing_cap",
			unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval_pts/wpn_fps_ass_asval_m_standard"
		}
	end
end)

-- [[ NPC weaps
Hooks:PostHook(WeaponFactoryTweakData, "init", "resmod_npc_weaps", function(self)

	self.wpn_fps_ass_shak12_supp = deep_clone(self.wpn_fps_ass_shak12)
	self.wpn_fps_ass_shak12_supp.real_factory_id = "wpn_fps_ass_shak12"
	self.wpn_fps_ass_shak12_supp.default_blueprint = {
		"wpn_fps_ass_shak12_body_lower",
		"wpn_fps_ass_shak12_body_upper",
		"wpn_fps_ass_shak12_b_dummy",
		"wpn_fps_ass_shak12_dh_vks",
		"wpn_fps_ass_shak12_fg_rail",
		"wpn_fps_ass_shak12_ejector_standard",
		"wpn_fps_ass_shak12_m_magazine25",
		"wpn_fps_ass_shak12_o_sight",
		"wpn_fps_ass_shak12_ns_suppressor",
		"wpn_fps_ass_shak12_o_carry_dummy",
		"wpn_fps_upg_o_poe"
	}
	self.wpn_fps_ass_shak12_supp_npc = deep_clone(self.wpn_fps_ass_shak12_supp)
	self.wpn_fps_ass_shak12_supp_npc.unit = "units/pd2_dlc_tawp/weapons/wpn_fps_ass_shak12/wpn_fps_ass_shak12_npc"
	
	self.wpn_fps_snp_desertfox_wick = deep_clone(self.wpn_fps_snp_desertfox)
	self.wpn_fps_snp_desertfox_wick.real_factory_id = "wpn_fps_snp_desertfox"
	self.wpn_fps_snp_desertfox_wick.default_blueprint = {
		"wpn_fps_snp_desertfox_b_long",
		"wpn_fps_snp_desertfox_body",
		"wpn_fps_snp_desertfox_dh_standard",
		"wpn_fps_snp_desertfox_mag",
		"wpn_fps_upg_o_shortdot"
	}
	self.wpn_fps_snp_desertfox_wick_npc = deep_clone(self.wpn_fps_snp_desertfox_wick)
	self.wpn_fps_snp_desertfox_wick_npc.unit = "units/pd2_dlc_pim/weapons/wpn_fps_snp_desertfox/wpn_fps_snp_desertfox_npc"

	self.wpn_fps_ass_asval_vss = deep_clone(self.wpn_fps_ass_asval)
	self.wpn_fps_ass_asval_vss.real_factory_id = "wpn_fps_ass_asval"
	self.wpn_fps_ass_asval_vss.default_blueprint = {
		"wpn_fps_ass_asval_b_standard",
		"wpn_fps_ass_asval_body_standard",
		"wpn_fps_ass_asval_fg_standard",
		"wpn_fps_ass_asval_m_standard",
		"wpn_fps_ass_asval_scopemount",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_ass_asval_s_solid"
	}
	self.wpn_fps_ass_asval_vss_npc = deep_clone(self.wpn_fps_ass_asval_vss)
	self.wpn_fps_ass_asval_vss_npc.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_ass_asval/wpn_fps_ass_asval_npc"

	self.wpn_fps_ass_l85a2_mil = deep_clone(self.wpn_fps_ass_l85a2)
	self.wpn_fps_ass_l85a2_mil.real_factory_id = "wpn_fps_ass_l85a2"
	self.wpn_fps_ass_l85a2_mil.default_blueprint = {
		"wpn_fps_ass_l85a2_body_standard",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_ass_l85a2_fg_short",
		"wpn_fps_ass_l85a2_b_medium",
		"wpn_fps_ass_l85a2_g_standard",
		"wpn_fps_ass_l85a2_ns_standard",
		"wpn_fps_upg_o_specter"
	}
	self.wpn_fps_ass_l85a2_mil_npc = deep_clone(self.wpn_fps_ass_l85a2_mil)
	self.wpn_fps_ass_l85a2_mil_npc.unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2/wpn_fps_ass_l85a2_npc"

	self.wpn_fps_sho_ben_jim = deep_clone(self.wpn_fps_sho_ben)
	self.wpn_fps_sho_ben_jim.real_factory_id = "wpn_fps_sho_ben"
	self.wpn_fps_sho_ben_jim.default_blueprint = {
		"wpn_fps_sho_ben_b_short",
		"wpn_fps_sho_ben_body_standard",
		"wpn_fps_sho_ben_fg_standard",
		"wpn_fps_sho_ben_s_collapsed"
	}
	self.wpn_fps_sho_ben_jim_npc = deep_clone(self.wpn_fps_sho_ben_jim)
	self.wpn_fps_sho_ben_jim_npc.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_sho_ben/wpn_fps_sho_ben_npc"

	self.wpn_fps_shot_r870_pdth = deep_clone(self.wpn_fps_shot_r870)
	self.wpn_fps_shot_r870_pdth.real_factory_id = "wpn_fps_shot_r870"
	self.wpn_fps_shot_r870_pdth.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_shot_r870_s_folding",
		"wpn_fps_upg_m4_g_standard"
	}
	self.wpn_fps_shot_r870_pdth_npc = deep_clone(self.wpn_fps_shot_r870_pdth)
	self.wpn_fps_shot_r870_pdth_npc.unit = "units/payday2/weapons/wpn_fps_shot_r870/wpn_fps_shot_r870_npc"

	self.wpn_fps_lmg_hk21_pdth = deep_clone(self.wpn_fps_lmg_hk21)
	self.wpn_fps_lmg_hk21_pdth.real_factory_id = "wpn_fps_lmg_hk21"
	self.wpn_fps_lmg_hk21_pdth.default_blueprint = {
		"wpn_fps_lmg_hk21_b_short",
		"wpn_fps_lmg_hk21_body_lower",
		"wpn_fps_lmg_hk21_body_upper",
		"wpn_fps_lmg_hk21_fg_short",
		"wpn_fps_lmg_hk21_g_standard",
		"wpn_fps_lmg_hk21_m_standard",
		"wpn_fps_lmg_hk21_s_standard",
		"wpn_fps_upg_bp_lmg_lionbipod",
		"wpn_fps_upg_o_docter"
	}
	self.wpn_fps_lmg_hk21_pdth_npc = deep_clone(self.wpn_fps_lmg_hk21_pdth)
	self.wpn_fps_lmg_hk21_pdth_npc.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_hk21/wpn_fps_lmg_hk21_npc"	

	self.wpn_fps_ass_amcar_idf = deep_clone(self.wpn_fps_ass_amcar)
	self.wpn_fps_ass_amcar_idf.real_factory_id = "wpn_fps_ass_amcar"
	self.wpn_fps_ass_amcar_idf.default_blueprint = {
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_upg_o_acog",
		"wpn_fps_ass_m4_os_frontsight",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_round_vanilla",
		"wpn_fps_amcar_uupg_fg_amcar",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_amcar_bolt_standard"
	}
	self.wpn_fps_ass_amcar_idf_npc = deep_clone(self.wpn_fps_ass_amcar_idf)
	self.wpn_fps_ass_amcar_idf_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"

	self.wpn_fps_ass_amcar_pdth = deep_clone(self.wpn_fps_ass_amcar)
	self.wpn_fps_ass_amcar_pdth.real_factory_id = "wpn_fps_ass_amcar"
	self.wpn_fps_ass_amcar_pdth.default_blueprint = {
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_ass_m4_os_frontsight",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_round_vanilla",
		"wpn_fps_m4_uupg_fg_rail",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_s_standard_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_amcar_bolt_standard"
	}
	self.wpn_fps_ass_amcar_pdth_npc = deep_clone(self.wpn_fps_ass_amcar_pdth)
	self.wpn_fps_ass_amcar_pdth_npc.unit = "units/payday2/weapons/wpn_fps_ass_amcar/wpn_fps_ass_amcar_npc"

	self.wpn_fps_ass_m16_a3 = deep_clone(self.wpn_fps_ass_m16)
	self.wpn_fps_ass_m16_a3.real_factory_id = "wpn_fps_ass_m16"
	self.wpn_fps_ass_m16_a3.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_amcar_bolt_standard"
	}
	self.wpn_fps_ass_m16_a3_npc = deep_clone(self.wpn_fps_ass_m16_a3)
	self.wpn_fps_ass_m16_a3_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"

	self.wpn_fps_ass_m16_a1 = deep_clone(self.wpn_fps_ass_m16)
	self.wpn_fps_ass_m16_a1.real_factory_id = "wpn_fps_ass_m16"
	self.wpn_fps_ass_m16_a1.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_upg_m4_m_straight",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m16_fg_vietnam",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_amcar_bolt_standard"
	}
	self.wpn_fps_ass_m16_a1_npc = deep_clone(self.wpn_fps_ass_m16_a1)
	self.wpn_fps_ass_m16_a1_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"

	self.wpn_fps_ass_m16_idf = deep_clone(self.wpn_fps_ass_m16)
	self.wpn_fps_ass_m16_idf.real_factory_id = "wpn_fps_ass_m16"
	self.wpn_fps_ass_m16_idf.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_amcar_uupg_body_upperreciever",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_ass_contraband_s_standard",
		"wpn_fps_amcar_bolt_standard"
	}
	self.wpn_fps_ass_m16_idf_npc = deep_clone(self.wpn_fps_ass_m16_idf)
	self.wpn_fps_ass_m16_idf_npc.unit = "units/payday2/weapons/wpn_fps_ass_m16/wpn_fps_ass_m16_npc"

	self.wpn_fps_ass_74_pdth = deep_clone(self.wpn_fps_ass_74)
	self.wpn_fps_ass_74_pdth.real_factory_id = "wpn_fps_ass_74"
	self.wpn_fps_ass_74_pdth.default_blueprint = {
		"wpn_fps_ass_74_b_standard",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_ass_74_m_standard",
		"wpn_upg_ak_fg_combo2",
		"wpn_upg_ak_s_skfoldable_vanilla",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_ak_scopemount"
	}
	self.wpn_fps_ass_74_pdth_npc = deep_clone(self.wpn_fps_ass_74_pdth)
	self.wpn_fps_ass_74_pdth_npc.unit = "units/payday2/weapons/wpn_fps_ass_74/wpn_fps_ass_74_npc"

	self.wpn_fps_ass_akm_solid = deep_clone(self.wpn_fps_ass_akm)
	self.wpn_fps_ass_akm_solid.real_factory_id = "wpn_fps_ass_akm"
	self.wpn_fps_ass_akm_solid.default_blueprint = {
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_upg_ak_fg_standard",
		"wpn_upg_ak_m_akm",
		"wpn_upg_ak_g_standard",
		"wpn_fps_ass_akm_b_standard",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_ass_ak_body_lowerreceiver"
	}
	self.wpn_fps_ass_akm_solid_npc = deep_clone(self.wpn_fps_ass_akm_solid)
	self.wpn_fps_ass_akm_solid_npc.unit = "units/payday2/weapons/wpn_fps_ass_akm/wpn_fps_ass_akm_npc"

	self.wpn_fps_ass_m14_pdth = deep_clone(self.wpn_fps_ass_m14)
	self.wpn_fps_ass_m14_pdth.real_factory_id = "wpn_fps_ass_m14"
	self.wpn_fps_ass_m14_pdth.default_blueprint = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_body_dmr",
		"wpn_fps_upg_o_m14_scopemount",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_ass_m14_m_standard"
	}
	self.wpn_fps_ass_m14_pdth_npc = deep_clone(self.wpn_fps_ass_m14_pdth)
	self.wpn_fps_ass_m14_pdth_npc.unit = "units/payday2/weapons/wpn_fps_ass_m14/wpn_fps_ass_m14_npc"

	self.wpn_fps_snp_tti_wick = deep_clone(self.wpn_fps_snp_tti)
	self.wpn_fps_snp_tti_wick.real_factory_id = "wpn_fps_snp_tti"
	self.wpn_fps_snp_tti_wick.default_blueprint = {
		"wpn_fps_smg_hajk_vg_moe",
		"wpn_fps_snp_tti_ns_standard",
		"wpn_fps_snp_tti_m_standard",
		"wpn_fps_snp_tti_fg_standard",
		"wpn_fps_snp_tti_dhs_switch",
		"wpn_fps_snp_tti_dh_standard",
		"wpn_fps_snp_tti_bolt_standard",
		"wpn_fps_snp_tti_body_receiverupper",
		"wpn_fps_snp_tti_body_receiverlower",
		"wpn_fps_snp_tti_b_standard",
		"wpn_fps_upg_o_shortdot",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_snp_tti_wick_npc = deep_clone(self.wpn_fps_snp_tti_wick)
	self.wpn_fps_snp_tti_wick_npc.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti/wpn_fps_snp_tti_npc"

	self.wpn_fps_snp_tti_wick_bubba = deep_clone(self.wpn_fps_snp_tti)
	self.wpn_fps_snp_tti_wick_bubba.real_factory_id = "wpn_fps_snp_tti"
	self.wpn_fps_snp_tti_wick_bubba.default_blueprint = {
		"wpn_fps_smg_schakal_vg_surefire",
		"wpn_fps_snp_tti_ns_standard",
		"wpn_fps_upg_m4_m_drum",
		"wpn_fps_upg_ass_m16_fg_stag",
		"wpn_fps_snp_tti_dhs_switch",
		"wpn_fps_snp_tti_dh_standard",
		"wpn_fps_snp_tti_bolt_standard",
		"wpn_fps_snp_tti_body_receiverupper",
		"wpn_fps_snp_tti_body_receiverlower",
		"wpn_fps_snp_tti_b_standard",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45rds",
		"wpn_fps_upg_m4_s_mk46",
		"wpn_fps_upg_fl_ass_utg",	
		"wpn_fps_ass_shak12_ns_muzzle",
		"wpn_fps_upg_m4_g_standard_vanilla"
	}
	self.wpn_fps_snp_tti_wick_bubba_npc = deep_clone(self.wpn_fps_snp_tti_wick_bubba)
	self.wpn_fps_snp_tti_wick_bubba_npc.unit = "units/pd2_dlc_spa/weapons/wpn_fps_snp_tti/wpn_fps_snp_tti_npc"

	self.wpn_fps_shot_b682_725 = deep_clone(self.wpn_fps_shot_b682)
	self.wpn_fps_shot_b682_725.real_factory_id = "wpn_fps_shot_b682"
	self.wpn_fps_shot_b682_725.default_blueprint = {
		"wpn_fps_shot_b682_body_standard",
		"wpn_fps_shot_b682_b_short",
		"wpn_fps_shot_b682_s_short"
	}
	self.wpn_fps_shot_b682_725_npc = deep_clone(self.wpn_fps_shot_b682_725)
	self.wpn_fps_shot_b682_725_npc.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_shot_b682/wpn_fps_shot_b682_npc"

	self.wpn_fps_ass_tecci_long = deep_clone(self.wpn_fps_ass_tecci)
	self.wpn_fps_ass_tecci_long.real_factory_id = "wpn_fps_ass_tecci"
	self.wpn_fps_ass_tecci_long.default_blueprint = {
		"wpn_fps_ass_contraband_b_standard",
		"wpn_fps_ass_tecci_dh_standard",
		"wpn_fps_ass_contraband_fg_standard",
		"wpn_fps_ass_tecci_g_standard",
		"wpn_fps_ass_tecci_lower_reciever",
		"wpn_fps_ass_tecci_m_drum",
		"wpn_fps_ass_contraband_ns_standard",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_ass_tecci_s_standard",
		"wpn_fps_ass_tecci_upper_reciever",
		"wpn_fps_ass_tecci_vg_standard"
	}
	self.wpn_fps_ass_tecci_long_npc = deep_clone(self.wpn_fps_ass_tecci_long)
	self.wpn_fps_ass_tecci_long_npc.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci/wpn_fps_ass_tecci_npc"
end)
--]]