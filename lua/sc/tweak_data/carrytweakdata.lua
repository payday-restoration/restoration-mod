Hooks:PostHook(CarryTweakData, "init", "res_carry", function(self, tweak_data)

	--Overriding so cops won't try to snatch up the goats
	self.goat = {
		type = "medium",
		name_id = "hud_carry_goat",
		unit = "units/pd2_dlc_peta/pickups/pta_pku_goatbag/pta_pku_goatbag",
		visual_unit_name = "units/pd2_dlc_peta/characters/npc_acc_goat_bag_1/npc_acc_goat_bag_1"
	}
	
	--Ditto
	self.nail_muriatic_acid = {
		type = "light",
		name_id = "hud_int_equipment_acid",
		skip_exit_secure = true,
		unit = "units/payday2/pickups/gen_pku_toolbag/gen_pku_toolbag",
		visual_unit_name = "units/payday2/characters/npc_acc_tools_bag_1/npc_acc_tools_bag_1"
	}
	self.nail_caustic_soda = {
		type = "light",
		name_id = "hud_int_equipment_caustic_soda",
		skip_exit_secure = true,
		unit = "units/payday2/pickups/gen_pku_toolbag_large/gen_pku_toolbag_large",
		visual_unit_name = "units/payday2/characters/npc_acc_tools_bag_large_1/npc_acc_tools_bag_large_1"
	}
	self.nail_hydrogen_chloride = {
		type = "light",
		name_id = "hud_int_equipment_hydrogen_chloride",
		skip_exit_secure = true,
		unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag",
		visual_unit_name = "units/payday2/characters/npc_acc_cage_bag_1/npc_acc_cage_bag_1"
	}
	self.nail_euphadrine_pills = {
		type = "light",
		name_id = "hud_carry_euphadrine_pills",
		skip_exit_secure = true,
		visual_unit_name = "units/payday2/characters/npc_acc_loot_bag_1/npc_acc_loot_bag_1"
	}	

end)