Hooks:PostHook(CarryTweakData, "init", "res_carry", function(self, tweak_data)

	--Overriding so cops won't try to snatch up the goats
	self.goat = {
		type = "medium",
		name_id = "hud_carry_goat",
		unit = "units/pd2_dlc_peta/pickups/pta_pku_goatbag/pta_pku_goatbag",
		visual_unit_name = "units/pd2_dlc_peta/characters/npc_acc_goat_bag_1/npc_acc_goat_bag_1",
	}

end)