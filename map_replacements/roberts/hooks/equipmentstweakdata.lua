Hooks:PostHook(EquipmentsTweakData,"init","csgobank_equipmenttweak_init",function(self)

	--Spraycan
	self.specials.csgo_spraycan = {
		quantity = 1,
		action_message = "spraycan_obtained",
		transfer_quantity = 1,
		text_id = "hud_equipment_obtained_spraycan",
		sync_possession = true,
		icon = "equipment_spraycan"
	}
	
end)