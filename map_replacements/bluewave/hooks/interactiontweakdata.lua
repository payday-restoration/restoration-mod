Hooks:PostHook(InteractionTweakData,"init","init_blue",function(self)

	self.blu_keycard_omnia = {
		text_id = "hud_int_equipment_keycard_omnia",
		equipment_text_id = "hud_int_equipment_no_keycard_omnia",
		special_equipment = "keycard_omnia",
		equipment_consume = true,
		start_active = false
	}
	self.gen_pku_hellfire = deep_clone(self.gen_pku_warhead)
	self.gen_pku_hellfire.text_id = "hud_int_hold_take_hellfire"
	self.gen_pku_hellfire.action_text_id = "hud_action_taking_hellfire"
	self.gen_pku_hellfire.sound_start = "bar_bag_generic"
	self.gen_pku_hellfire.sound_interupt = "bar_bag_generic_cancel"
	self.gen_pku_hellfire.sound_done = "bar_bag_generic_finished"
	
end)