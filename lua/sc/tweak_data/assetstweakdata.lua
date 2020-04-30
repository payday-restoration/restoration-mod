local old_init_risk_assets = AssetsTweakData._init_risk_assets
function AssetsTweakData:_init_risk_assets(tweak_data)
	old_init_risk_assets(self, tweak_data)
		
	--LES VAMOS A CORTAR LAS VERGAS!!--
	self.risk_bexico = {}
	self.risk_bexico.name_id = "menu_asset_risk_bexico"
	self.risk_bexico.texture = "guis/textures/pd2/mission_briefing/assets/risk_bexico"	
	--Blood's in the water--
	self.risk_murky = {}
	self.risk_murky.name_id = "menu_asset_risk_murky"
	self.risk_murky.texture = "guis/textures/pd2/mission_briefing/assets/risk_murky"	
	--BRaIiinsSSSss--
	self.risk_zombie = {}
	self.risk_zombie.name_id = "menu_asset_risk_zombie"
	self.risk_zombie.texture = "guis/textures/pd2/mission_briefing/assets/risk_zombie"	

	--Kills PD risk level for Murky and Zombie levels--
	table.insert(self.risk_pd.exclude_stages, "shoutout_raid")
	table.insert(self.risk_pd.exclude_stages, "pbr")
	table.insert(self.risk_pd.exclude_stages, "wetwork")
	table.insert(self.risk_pd.exclude_stages, "des")
	table.insert(self.risk_pd.exclude_stages, "bph")
	table.insert(self.risk_pd.exclude_stages, "vit")
	table.insert(self.risk_pd.exclude_stages, "pines")		
	table.insert(self.risk_pd.exclude_stages, "wwh")
	table.insert(self.risk_pd.exclude_stages, "arm_for")
	table.insert(self.risk_pd.exclude_stages, "haunted")
	table.insert(self.risk_pd.exclude_stages, "nail")
	table.insert(self.risk_pd.exclude_stages, "help")
	table.insert(self.risk_pd.exclude_stages, "mex")
	table.insert(self.risk_pd.exclude_stages, "crojob2")
	table.insert(self.risk_pd.exclude_stages, "crojob3")
	table.insert(self.risk_pd.exclude_stages, "crojob3_night")				
	table.insert(self.risk_pd.exclude_stages, "bex")				
	table.insert(self.risk_pd.exclude_stages, "mex_cooking")				

	--SWAT--		
	table.insert(self.risk_swat.exclude_stages, "shoutout_raid")
	table.insert(self.risk_swat.exclude_stages, "pbr")
	table.insert(self.risk_swat.exclude_stages, "wetwork")
	table.insert(self.risk_swat.exclude_stages, "des")	
	table.insert(self.risk_swat.exclude_stages, "bph")	
	table.insert(self.risk_swat.exclude_stages, "pines")				
	table.insert(self.risk_swat.exclude_stages, "vit")	
	table.insert(self.risk_swat.exclude_stages, "wwh")
	table.insert(self.risk_swat.exclude_stages, "arm_for")
	table.insert(self.risk_swat.exclude_stages, "haunted")
	table.insert(self.risk_swat.exclude_stages, "nail")
	table.insert(self.risk_swat.exclude_stages, "help")
	table.insert(self.risk_swat.exclude_stages, "hvh")
	table.insert(self.risk_swat.exclude_stages, "mex")
	table.insert(self.risk_swat.exclude_stages, "crojob2")
	table.insert(self.risk_swat.exclude_stages, "crojob3")
	table.insert(self.risk_swat.exclude_stages, "crojob3_night")				
	table.insert(self.risk_swat.exclude_stages, "bex")				
	table.insert(self.risk_swat.exclude_stages, "mex_cooking")				
	
	--FBI--		
	table.insert(self.risk_fbi.exclude_stages, "shoutout_raid")
	table.insert(self.risk_fbi.exclude_stages, "pbr")
	table.insert(self.risk_fbi.exclude_stages, "wetwork")
	table.insert(self.risk_fbi.exclude_stages, "des")
	table.insert(self.risk_fbi.exclude_stages, "bph")
	table.insert(self.risk_fbi.exclude_stages, "vit")
	table.insert(self.risk_fbi.exclude_stages, "pines")						
	table.insert(self.risk_fbi.exclude_stages, "wwh")
	table.insert(self.risk_fbi.exclude_stages, "arm_for")
	table.insert(self.risk_fbi.exclude_stages, "haunted")
	table.insert(self.risk_fbi.exclude_stages, "nail")
	table.insert(self.risk_fbi.exclude_stages, "help")
	table.insert(self.risk_fbi.exclude_stages, "hvh")
	table.insert(self.risk_fbi.exclude_stages, "mex")
	table.insert(self.risk_fbi.exclude_stages, "crojob2")
	table.insert(self.risk_fbi.exclude_stages, "crojob3")
	table.insert(self.risk_fbi.exclude_stages, "crojob3_night")				
	table.insert(self.risk_fbi.exclude_stages, "bex")				
	table.insert(self.risk_fbi.exclude_stages, "mex_cooking")			

	--Overkill--		
	table.insert(self.risk_death_squad.exclude_stages, "shoutout_raid")
	table.insert(self.risk_death_squad.exclude_stages, "pbr")
	table.insert(self.risk_death_squad.exclude_stages, "wetwork")	
	table.insert(self.risk_death_squad.exclude_stages, "des")
	table.insert(self.risk_death_squad.exclude_stages, "pines")								
	table.insert(self.risk_death_squad.exclude_stages, "bph")
	table.insert(self.risk_death_squad.exclude_stages, "vit")
	table.insert(self.risk_death_squad.exclude_stages, "wwh")
	table.insert(self.risk_death_squad.exclude_stages, "arm_for")
	table.insert(self.risk_death_squad.exclude_stages, "haunted")
	table.insert(self.risk_death_squad.exclude_stages, "nail")
	table.insert(self.risk_death_squad.exclude_stages, "help")
	table.insert(self.risk_death_squad.exclude_stages, "hvh")
	table.insert(self.risk_death_squad.exclude_stages, "mex")	
	table.insert(self.risk_death_squad.exclude_stages, "crojob2")
	table.insert(self.risk_death_squad.exclude_stages, "crojob3")
	table.insert(self.risk_death_squad.exclude_stages, "crojob3_night")				
	table.insert(self.risk_death_squad.exclude_stages, "bex")				
	table.insert(self.risk_death_squad.exclude_stages, "mex_cooking")				

	--Mayhem--		
	table.insert(self.risk_easy_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_easy_wish.exclude_stages, "pbr")
	table.insert(self.risk_easy_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_easy_wish.exclude_stages, "des")
	table.insert(self.risk_easy_wish.exclude_stages, "bph")
	table.insert(self.risk_easy_wish.exclude_stages, "vit")
	table.insert(self.risk_easy_wish.exclude_stages, "pines")										
	table.insert(self.risk_easy_wish.exclude_stages, "wwh")
	table.insert(self.risk_easy_wish.exclude_stages, "arm_for")
	table.insert(self.risk_easy_wish.exclude_stages, "haunted")
	table.insert(self.risk_easy_wish.exclude_stages, "nail")
	table.insert(self.risk_easy_wish.exclude_stages, "help")
	table.insert(self.risk_easy_wish.exclude_stages, "hvh")
	table.insert(self.risk_easy_wish.exclude_stages, "mex")
	table.insert(self.risk_easy_wish.exclude_stages, "crojob2")		
	table.insert(self.risk_easy_wish.exclude_stages, "crojob3")
	table.insert(self.risk_easy_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_easy_wish.exclude_stages, "bex")				
	table.insert(self.risk_easy_wish.exclude_stages, "mex_cooking")			

	--Deathwish--		
	table.insert(self.risk_death_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_death_wish.exclude_stages, "pbr")
	table.insert(self.risk_death_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_death_wish.exclude_stages, "des")
	table.insert(self.risk_death_wish.exclude_stages, "bph")
	table.insert(self.risk_death_wish.exclude_stages, "vit")
	table.insert(self.risk_death_wish.exclude_stages, "wwh")
	table.insert(self.risk_death_wish.exclude_stages, "pines")												
	table.insert(self.risk_death_wish.exclude_stages, "arm_for")
	table.insert(self.risk_death_wish.exclude_stages, "haunted")
	table.insert(self.risk_death_wish.exclude_stages, "nail")
	table.insert(self.risk_death_wish.exclude_stages, "help")
	table.insert(self.risk_death_wish.exclude_stages, "hvh")
	table.insert(self.risk_death_wish.exclude_stages, "mex")
	table.insert(self.risk_death_wish.exclude_stages, "crojob2")		
	table.insert(self.risk_death_wish.exclude_stages, "crojob3")
	table.insert(self.risk_death_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_death_wish.exclude_stages, "bex")				
	table.insert(self.risk_death_wish.exclude_stages, "mex_cooking")			
	
	--One Down--		
	table.insert(self.risk_sm_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_sm_wish.exclude_stages, "pbr")
	table.insert(self.risk_sm_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_sm_wish.exclude_stages, "des")
	table.insert(self.risk_sm_wish.exclude_stages, "bph")
	table.insert(self.risk_sm_wish.exclude_stages, "pines")														
	table.insert(self.risk_sm_wish.exclude_stages, "vit")
	table.insert(self.risk_sm_wish.exclude_stages, "wwh")
	table.insert(self.risk_sm_wish.exclude_stages, "arm_for")
	table.insert(self.risk_sm_wish.exclude_stages, "haunted")
	table.insert(self.risk_sm_wish.exclude_stages, "nail")
	table.insert(self.risk_sm_wish.exclude_stages, "help")
	table.insert(self.risk_sm_wish.exclude_stages, "hvh")
	table.insert(self.risk_sm_wish.exclude_stages, "mex")	
	table.insert(self.risk_sm_wish.exclude_stages, "crojob2")	
	table.insert(self.risk_sm_wish.exclude_stages, "crojob3")
	table.insert(self.risk_sm_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_sm_wish.exclude_stages, "bex")				
	table.insert(self.risk_sm_wish.exclude_stages, "mex_cooking")			
	
	-- Reaper Risk Asset
	table.insert(self.mad_russian_merc_cameras.stages, "pines")
	table.insert(self.mad_russian_merc_cameras.stages, "crojob3")
	table.insert(self.mad_russian_merc_cameras.stages, "crojob3_night")
	
	self.risk_easy_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_4_sc"
	self.risk_death_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_5_sc"
	self.risk_sm_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_6_sc"
	self.risk_murky.stages = {
		"shoutout_raid",
		"pbr",
		"wetwork",
		"des",
		"bph",
		"vit",
		"arm_for",
		"crojob2",
		"mex"
		--"wwh" Intended as we weren't expecting a fight at all on Alaskan Deal
	}		
	self.risk_zombie.stages = {
		"haunted",
		"nail",
		"help",
		"hvh"
	}		
	self.risk_bexico.stages = {
		"mex_cooking",
		"bex"
	}			

	--Adding Bikers to Biker heist cause it makes sense--
	self.jungle_1_bikers.stages = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"born",
		"chew"
	}
	
	--Alex 1 Zipline
	self.alex_1_zipline = {}
	self.alex_1_zipline.name_id = "menu_alex_1_zipline"
	self.alex_1_zipline.texture = "guis/textures/pd2/mission_briefing/assets/alex_1_zipline"
	self.alex_1_zipline.visible_if_locked = true
	self.alex_1_zipline.no_mystery = true
	self.alex_1_zipline.unlock_desc_id = "menu_alex_1_zipline_desc"
	self.alex_1_zipline.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)		
	self.alex_1_zipline.stages = {
		"alex_1_res",
	}				
		
	--Slaughterhouse safe--
	self.dinner_safe = {}
	self.dinner_safe.name_id = "menu_asset_dinner_safe"
	self.dinner_safe.texture = "guis/textures/pd2/mission_briefing/assets/heist_vlad_asset04_df"
	self.dinner_safe.stages = {"dinner"}
	
	--Boiling Point Test Subjects--
	self.mad_cyborg_test_subject = {}		
	self.mad_cyborg_test_subject.name_id = "menu_asset_mad_cyborg_test_subject"
	self.mad_cyborg_test_subject.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/mad_cyborg_test_subject"
	self.mad_cyborg_test_subject.stages = {"mad"}

	--Oh my god JC--
	self.bomb_loot = {}
	self.bomb_loot.name_id = "menu_asset_bomb_inside_info"
	self.bomb_loot.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_1/assets_crojob_insiderinfo_bomb"
	self.bomb_loot.stages = {"crojob2"}
	
	--UK Job, Resmod edit
	table.insert(self.safe_escape.stages, "ukrainian_job_res")
	table.insert(self.bodybags_bag.stages, "ukrainian_job_res")
	table.insert(self.sniper_spot_jewelery.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_tiara.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_front.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_cam.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_metal_detector.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_shutter.stages, "ukrainian_job_res")
	table.insert(self.security_safe_05x05.stages, "ukrainian_job_res")
	
	--FS Day 1, Resmod edit
	table.insert(self.grenade_crate.stages, "firestarter_1_res")
	table.insert(self.sniper_spot_firestarter1.stages, "firestarter_1_res")
	table.insert(self.firestarter_1_ammo.stages, "firestarter_1_res")
	table.insert(self.firestarter_1_health.stages, "firestarter_1_res")
	
	--FS Day 2, Resmod edit
	table.insert(self.bodybags_bag.stages, "firestarter_2_res")
	table.insert(self.spotter.stages, "firestarter_2_res")
	table.insert(self.grenade_crate.stages, "firestarter_2_res")
	table.insert(self.firestarter_2_cam.stages, "firestarter_2_res")	

	--Diamond Store, Resmod Edit
	table.insert(self.safe_escape.stages, "family_res")
	table.insert(self.bodybags_bag.stages, "family_res")
	
	--Rats Day 1, Resmod Edit
	table.insert(self.grenade_crate.stages, "alex_1_res")		
	table.insert(self.sniper_spot_rats1.stages, "alex_1_res")
	table.insert(self.rat_1_ammo.stages, "alex_1_res")
	table.insert(self.rat_1_health.stages, "alex_1_res")
	table.insert(self.rat_1_lights.stages, "alex_1_res")
	
	--Rats Day 2, Resmod Edit
	--Nothing!
	
	--Rats Day 3, Resmod Edit
	table.insert(self.sniper_spot_rats3.stages, "alex_3_res")		
	table.insert(self.rat_3_pilot.stages, "alex_3_res")
	
	--Pro Job changes--
	if Global.game_settings and Global.game_settings.one_down then
	
		--Generic Ammo asset
		self.ammo_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}
		
		--Generic Doctor asset
		self.health_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}

		--Generic BodyBag asset
		self.bodybags_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Generic Grenade Crate asset
		self.grenade_crate.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Watchdogs D1 Bags
		self.watchdogs_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.watchdogs_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Watchdogs D2 Bags
		self.watchdogs_2_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.watchdogs_2_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Firestarter D1 Bags
		self.firestarter_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.firestarter_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		
		--Big Oil Day 2 Ammo
		self.jungle_2_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}				

		--Rats D1 Bags
		self.rat_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.rat_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Mallcrasher bags
		self.mallcrasher_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.mallcrasher_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Nightclub bags
		self.nightclub_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.nightclub_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}				
	
		--Armored Transport Heists Bags
		self.arm_for_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.arm_for_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}		
	
	end

	--Restoration Heist assets--
	--wet floor--
	self.wet_intel = {}
	self.wet_intel.name_id = "menu_asset_wet_intel"
	self.wet_intel.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_intel"	
	
	self.wet_boat = {}
	self.wet_boat.name_id = "menu_asset_wet_boat"
	self.wet_boat.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_boat"
	self.wet_boat.visible_if_locked = true
	self.wet_boat.no_mystery = true
	self.wet_boat.unlock_desc_id = "menu_asset_wet_boat_desc"
	self.wet_boat.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.wet_boat.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}
	
	--Burning Floor--
	self.wetwork_burn_add_saw = {}
	self.wetwork_burn_add_saw.name_id = "menu_asset_wet_add_saw"
	self.wetwork_burn_add_saw.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_burn_add_saw"
	self.wetwork_burn_add_saw.visible_if_locked = true
	self.wetwork_burn_add_saw.no_mystery = true
	self.wetwork_burn_add_saw.unlock_desc_id = "menu_asset_wet_add_saw_desc"
	self.wetwork_burn_add_saw.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.wetwork_burn_add_saw.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
	
	--Rush--
	self.rush_asset_sentrygun = {}
	self.rush_asset_sentrygun.name_id = "menu_rush_asset_sentrygun"
	self.rush_asset_sentrygun.texture = "guis/textures/pd2/mission_briefing/assets/rush_asset_sentrygun"
	self.rush_asset_sentrygun.visible_if_locked = true
	self.rush_asset_sentrygun.no_mystery = true
	self.rush_asset_sentrygun.unlock_desc_id = "menu_rush_asset_sentrygun_desc"
	self.rush_asset_sentrygun.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.rush_asset_sentrygun.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
end

Hooks:PostHook( AssetsTweakData, "_init_gage_assets", "SC_GageAssetFix", function(self, tweak_data)	
	table.insert(self.gage_assignment.exclude_stages, "hvh")
end)