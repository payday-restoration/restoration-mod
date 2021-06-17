Hooks:PostHook(CarryTweakData, "init", "res_carry", function(self, tweak_data)

	--Tweaking Bag Weights to be more consistent and less of a giant jump between tiers
	
	--Light (Jewelry, Coke) bags, no penalties and can still sprint just fine
	self.types.coke_light.move_speed_modifier = 0.95
	self.types.coke_light.jump_modifier = 0.95
	self.types.coke_light.can_run = true
	self.types.coke_light.throw_distance_multiplier = 1
	
	self.types.light.move_speed_modifier = 0.95
	self.types.light.jump_modifier = 0.95
	self.types.light.can_run = true
	self.types.light.throw_distance_multiplier = 1
	
	--Medium Bags (Cash bags, bodybags), slight penalties and you can't sprint anymore
	self.types.medium.move_speed_modifier = 0.8
	self.types.medium.jump_modifier = 0.8
	self.types.medium.can_run = false
	self.types.medium.throw_distance_multiplier = 0.85
	
	self.types.being.move_speed_modifier = 0.8
	self.types.being.jump_modifier = 0.8
	self.types.being.can_run = false
	self.types.being.throw_distance_multiplier = 0.85
	
	self.types.explosives.move_speed_modifier = 0.8
	self.types.explosives.jump_modifier = 0.8
	self.types.explosives.can_run = false
	self.types.explosives.throw_distance_multiplier = 0.85	
	
	self.types.cloaker_explosives.move_speed_modifier = 0.8
	self.types.cloaker_explosives.jump_modifier = 0.8
	self.types.cloaker_explosives.can_run = false
	self.types.cloaker_explosives.throw_distance_multiplier = 0.85	
	
	--Heavy Bags, gold and such
	self.types.slightly_heavy.move_speed_modifier = 0.65
	self.types.slightly_heavy.jump_modifier = 0.65
	self.types.slightly_heavy.can_run = false
	self.types.slightly_heavy.throw_distance_multiplier = 0.7

	self.types.heavy.move_speed_modifier = 0.65
	self.types.heavy.jump_modifier = 0.65
	self.types.heavy.can_run = false
	self.types.heavy.throw_distance_multiplier = 0.7
	
	--Very Heavy Bags (Safes)
	self.types.slightly_very_heavy.move_speed_modifier = 0.5
	self.types.slightly_very_heavy.jump_modifier = 0.5
	self.types.slightly_very_heavy.can_run = false
	self.types.slightly_very_heavy.throw_distance_multiplier = 0.55
	
	self.types.very_heavy.move_speed_modifier = 0.5
	self.types.very_heavy.jump_modifier = 0.5
	self.types.very_heavy.can_run = false
	self.types.very_heavy.throw_distance_multiplier = 0.55
	
	--Mega Heavy, Ancient babylonian crap
	self.types.mega_heavy.move_speed_modifier = 0.35
	self.types.mega_heavy.jump_modifier = 0.35
	self.types.mega_heavy.can_run = false
	self.types.mega_heavy.throw_distance_multiplier = 0.4	
	
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