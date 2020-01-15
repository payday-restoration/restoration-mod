Hooks:PostHook(InteractionTweakData,"init","csgobank_interactiontweak_init",function(self)

	--Spraypaint
	self.csgo_spraypaint = {
		icon = "equipment_spraycan",
		text_id = "hud_action_spraypaint",
		special_equipment = "csgo_spraycan",
		equipment_consume = true,
		equipment_text_id = "hud_action_spraypaint_none",
		sound_done = "spray_can",
		interact_distance = 75,
		timer = 0.2,
		start_active = false
	}
	self.csgo_spraycan = {
		icon = "equipment_spraycan",
		text_id = "hud_equipment_pickup_spraycan",
		start_active = true
	}
	
	
end)