if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local sc_pptd = PrePlanningTweakData.init

function PrePlanningTweakData:init(tweak_data)
	sc_pptd(self, tweak_data)

	--To hopefully make some crap on big bank more fruitful--
	self.types.spycam.budget_cost = 1
	self.types.escape_bus_loud.budget_cost = 6
	self.types.escape_c4_loud.budget_cost = 2
	self.types.escape_elevator_loud.budget_cost = 4
	self.types.vault_thermite.budget_cost = 6
	
	self.locations.branchbank.mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_branchbank"
end

end