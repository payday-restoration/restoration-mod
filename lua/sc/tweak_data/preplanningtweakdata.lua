local sc_pptd = PrePlanningTweakData.init

function PrePlanningTweakData:init(tweak_data)
	sc_pptd(self, tweak_data)

	--You can set up up to 4 spycams (each cost 1 favor)--
	self.types.spycam.budget_cost = 1
	self.types.spycam.total = 4
		
	--Big Bank's release version favors amount--
	self.types.escape_bus_loud.budget_cost = 10
	self.types.escape_c4_loud.budget_cost = 5
	self.types.escape_elevator_loud.budget_cost = 6
	self.types.vault_thermite.budget_cost = 6
	
	self.locations.branchbank.mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_branchbank"
	
	--Sniper, now requires Insider assets
	self.types.sniper.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}
	
	self.types.crojob3_sniper.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
	
	--Bank Heist vault keys, now requires Inside Man
	self.types.branchbank_vault_key.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}
	self.types.branchbank_vault_key.category = "insider_help"
	
	--Safe escape, doesn't need upgrades anymore
	self.types.safe_escape.upgrade_lock = nil
	self.types.safe_escape.category = "hired_help"
	
	--Bodybag case, no upgrade lock on non-pro jobs now
	self.types.bodybags_bag.upgrade_lock = nil
	
	--Making vantage point only one favor because god damn it's worthless
	self.types.sniper_spot.budget_cost = 1
	
	--Pro Job Changes
	
	if Global.game_settings and Global.game_settings.one_down then
	
		--Generic Ammo Bag Asset
		self.types.ammo_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}
		
		--Generic Medic Bag Asset
		self.types.health_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}

		--Generic Bodybag Asset
		self.types.bodybags_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Generic Grenade Crate Asset
		self.types.grenade_crate.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}			
		
	end

end