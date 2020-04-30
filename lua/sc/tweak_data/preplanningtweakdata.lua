local sc_pptd = PrePlanningTweakData.init

function PrePlanningTweakData:init(tweak_data)
	sc_pptd(self, tweak_data)

	--To hopefully make some crap on big bank more fruitful--
	self.types.spycam.budget_cost = 1
	self.types.spycam.total = 4
	self.types.escape_bus_loud.budget_cost = 6
	self.types.escape_c4_loud.budget_cost = 2
	self.types.escape_elevator_loud.budget_cost = 4
	self.types.vault_thermite.budget_cost = 6
	
	self.locations.branchbank.mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_branchbank"
	
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