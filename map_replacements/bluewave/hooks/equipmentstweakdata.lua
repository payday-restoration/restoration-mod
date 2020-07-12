Hooks:PostHook(EquipmentsTweakData,"init","init_blue",function(self)

		self.specials.keycard_omnia = {
			sync_possession = true,
			action_message = "bank_manager_key_obtained",
			transfer_quantity = 4,
			text_id = "hud_int_equipment_pickup_keycard_omnia",
			icon = "equipment_keycard_omnia"
		}
	
end)