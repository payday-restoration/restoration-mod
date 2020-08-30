Hooks:PostHook(AssetsTweakData,"_init_assets","_init_assets_blue",function(self)

	self.wetworks_plan_a = {
		name_id = "menu_asset_wetworks_plan_a",
		texture = "units/pd2_mod_blue/guis/asset_wetworks_plan_a",
		visible_if_locked = true,
		no_mystery = true
	}
	self.wetworks_plan_b = {
		name_id = "menu_asset_wetworks_plan_b",
		texture = "units/pd2_mod_blue/guis/asset_wetworks_plan_b",
		visible_if_locked = true,
		no_mystery = true
	}
	self.wetworks_insider = {
		name_id = "menu_asset_wetworks_insider",
		unlock_desc_id = "menu_asset_wetworks_insider_desc",
		texture = "units/pd2_mod_blue/guis/asset_wetworks_insider",
		visible_if_locked = true,
		no_mystery = true,
		money_lock = 10000,
		upgrade_lock = {
			upgrade = "additional_assets",
			category = "player"
		}
	}
	self.wetworks_boat_escape = {
		name_id = "menu_asset_wetworks_boat_escape",
		unlock_desc_id = "menu_asset_wetworks_boat_escape_desc",
		texture = "units/pd2_mod_blue/guis/asset_wetworks_boat_escape",
		visible_if_locked = true,
		no_mystery = true,
		money_lock = 20000,
		upgrade_lock = {
			upgrade = "additional_assets",
			category = "player"
		}
	}
	self.burnout_plan_a = {
		name_id = "menu_asset_burnout_plan_a",
		texture = "units/pd2_mod_blue/guis/asset_burnout_plan_a",
		visible_if_locked = true,
		no_mystery = true
	}
	
end)