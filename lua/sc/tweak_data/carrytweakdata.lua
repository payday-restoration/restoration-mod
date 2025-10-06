Hooks:PostHook(CarryTweakData, "init", "res_carry", function(self, tweak_data)

	-- Solo boon stuff
	local solo_boon = 1
	
	if Global.game_settings and Global.game_settings.single_player then
		if not restoration.Options:GetValue("OTHER/DisableSoloBoons") then
			solo_boon = 0.5
		end
	end

	-- Tweaking Bag Weights to be more consistent and less of a giant jump between tiers	
	self.weight_class = {
		light = 10 * solo_boon,
		medium = 20 * solo_boon,
		heavy = 35 * solo_boon,
		very_heavy = 50 * solo_boon,
		mega_heavy = 60 * solo_boon
	}
	
	-- Light (Jewelry, Coke) bags, no penalties and can still sprint just fine
	self.types.coke_light.move_speed_modifier = 0.95
	self.types.coke_light.jump_modifier = 0.95
	self.types.coke_light.can_run = true
	self.types.coke_light.throw_distance_multiplier = 1
	self.types.coke_light.weight = self.weight_class.light
	
	self.types.light.move_speed_modifier = 0.95
	self.types.light.jump_modifier = 0.95
	self.types.light.can_run = true
	self.types.light.throw_distance_multiplier = 1
	self.types.light.weight = self.weight_class.light
	
	-- Medium Bags (Cash bags, bodybags), slight penalties and you can't sprint anymore
	self.types.medium.move_speed_modifier = 0.8
	self.types.medium.jump_modifier = 0.8
	self.types.medium.can_run = false
	self.types.medium.throw_distance_multiplier = 0.85
	self.types.medium.weight = self.weight_class.medium
	
	self.types.being.move_speed_modifier = 0.8
	self.types.being.jump_modifier = 0.8
	self.types.being.can_run = false
	self.types.being.throw_distance_multiplier = 0.85
	self.types.being.weight = self.weight_class.medium
	
	self.types.explosives.move_speed_modifier = 0.8
	self.types.explosives.jump_modifier = 0.8
	self.types.explosives.can_run = false
	self.types.explosives.throw_distance_multiplier = 0.85
	self.types.explosives.weight = self.weight_class.medium
	
	self.types.cloaker_explosives.move_speed_modifier = 0.8
	self.types.cloaker_explosives.jump_modifier = 0.8
	self.types.cloaker_explosives.can_run = false
	self.types.cloaker_explosives.throw_distance_multiplier = 0.85
	self.types.cloaker_explosives.weight = self.weight_class.medium
	
	-- Heavy Bags, gold and such
	self.types.slightly_heavy.move_speed_modifier = 0.65
	self.types.slightly_heavy.jump_modifier = 0.65
	self.types.slightly_heavy.can_run = false
	self.types.slightly_heavy.throw_distance_multiplier = 0.7
	self.types.explosives.weight = self.weight_class.heavy

	self.types.heavy.move_speed_modifier = 0.65
	self.types.heavy.jump_modifier = 0.65
	self.types.heavy.can_run = false
	self.types.heavy.throw_distance_multiplier = 0.7
	self.types.heavy.weight = self.weight_class.heavy
	
	-- Very Heavy Bags (Safes)
	self.types.slightly_very_heavy.move_speed_modifier = 0.5
	self.types.slightly_very_heavy.jump_modifier = 0.5
	self.types.slightly_very_heavy.can_run = false
	self.types.slightly_very_heavy.throw_distance_multiplier = 0.55
	self.types.slightly_very_heavy.weight = self.weight_class.very_heavy
	
	self.types.very_heavy.move_speed_modifier = 0.5
	self.types.very_heavy.jump_modifier = 0.5
	self.types.very_heavy.can_run = false
	self.types.very_heavy.throw_distance_multiplier = 0.55
	self.types.very_heavy.weight = self.weight_class.very_heavy
	
	-- Mega Heavy, Ancient babylonian crap
	self.types.mega_heavy.move_speed_modifier = 0.35
	self.types.mega_heavy.jump_modifier = 0.35
	self.types.mega_heavy.can_run = false
	self.types.mega_heavy.throw_distance_multiplier = 0.4	
	self.types.mega_heavy.weight = self.weight_class.mega_heavy
	
	-- Light bags that poof
	self.types.cloaker_explosives_light = deep_clone(self.types.coke_light)
	self.types.cloaker_explosives_light.can_poof = true	
	
	-- Cloaker Cocaine
	self.cloaker_cocaine = {
		type = "cloaker_explosives_light",
		name_id = "hud_carry_cloaker_cocaine",
		bag_value = "cloaker_cocaine",
		unit = "units/pd2_dlc_help/pickups/gen_pku_spooky_bag/gen_pku_spooky_bag",
		visual_unit_name = "units/pd2_dlc_help/characters/npc_acc_spooky_bag/npc_acc_spooky_bag",
		AI_carry = {
			SO_category = "enemies"
		}
	}	
	-- made Train Heist ammo explode on huge impact again :')
	-- Disabled due to stack overflow crash
	--[[
	self.ammo = {
		type = "explosives",
		name_id = "hud_carry_ammo",
		bag_value = "shells",
		unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag",
		visual_unit_name = "units/payday2/characters/npc_acc_explosives_bag_1/npc_acc_explosives_bag_1",
		AI_carry = {
			SO_category = "enemies"
		}
	}
	--]]
	-- Overriding so cops won't try to snatch up the goats
	-- also made them light because I fucking hate this heist
	self.goat.AI_carry = nil
	self.goat.type = "light"

	-- Ditto
	self.nail_muriatic_acid.AI_carry = nil
	self.nail_caustic_soda.AI_carry = nil
	self.nail_hydrogen_chloride.AI_carry = nil
	self.nail_euphadrine_pills.AI_carry = nil
	
	-- CG22 event stuff
	self.types.cg22_light = deep_clone(self.types.light)	
	self.types.cg22_heavy = deep_clone(self.types.heavy)		
		
end)
