local sc_etd = EquipmentsTweakData.init
function EquipmentsTweakData:init()
	sc_etd(self, tweak_data)
	
	self.armor_kit = {
		icon = "equipment_armor_kit",
		use_function_name = "use_armor_kit",
		quantity = {1},
		text_id = "debug_equipment_armor_kit",
		description_id = "des_armor_kit",
		dummy_unit = "units/payday2/equipment/gen_equipment_grenade_crate/gen_equipment_grenade_crate_dummy_unit",	
		deploy_time = 2,
		visual_object = "g_armorbag"
	}	

	--Because you're not getting 6 fucking sentries--
	self.sentry_gun.quantity = {1}
	self.first_aid_kit.quantity = {3}
	self.trip_mine.quantity = {3, 3}
	self.ecm_jammer.quantity = {2}
	self.ecm_jammer.deploy_time = 1
	self.specials.cable_tie.max_quantity = 9
	
	self.sentry_gun.repair_time_init = 30
	self.sentry_gun.repair_time_min = 10
	self.sentry_gun.repair_blink_interval = 0.5
	
	self.max_amount = {
		trip_mine = 25,
		asset_sentry_gun = 4,
		ecm_jammer = 4,
		asset_doctor_bag = 3,
		ammo_bag = 2,
		grenades = 50,
		asset_ammo_bag = 4,
		asset_grenade_crate = 3,
		first_aid_kit = 9,
		asset_bodybags_bag = 4,
		bodybags_bag = 2,
		sentry_gun = -1,
		doctor_bag = 2
	}	

	--Again just some quality of life stuff to make single player less awful--
	if Global.game_settings and Global.game_settings.single_player then
		self.specials.acid.max_quantity=4
		self.specials.caustic_soda.max_quantity=4
		self.specials.hydrogen_chloride.max_quantity=4
		self.specials.boards.max_quantity=4
		self.specials.planks.max_quantity=4
		self.specials.thermite_paste.max_quantity=4
		self.specials.acid.quantity=1
		self.specials.caustic_soda.quantity=1
		self.specials.hydrogen_chloride.quantity=1
		self.specials.boards.quantity=1
		self.specials.planks.quantity=1
		self.specials.bank_manager_key.quantity = 1
		self.specials.bank_manager_key.max_quantity=4
		self.specials.thermite_paste.quantity=1
		self.specials.cable_tie.quantity=8
		self.specials.cable_tie.max_quantity = 36
		self.specials.gas.max_quantity=4
		self.specials.gas.quantity=1
		self.specials.harddrive.max_quantity=4
		self.specials.harddrive.quantity=1
		self.specials.c4.quantity=8
		self.specials.c4.max_quantity=8
		self.specials.printer_ink.quantity=1
		self.specials.printer_ink.max_quantity=4
		self.specials.paper_roll.quantity=1
		self.specials.paper_roll.max_quantity=4
		self.specials.crowbar.quantity=1
		self.specials.crowbar.max_quantity=4
		self.specials.crowbar_stack.quantity=1
		self.specials.crowbar_stack.max_quantity=4
		self.specials.liquid_nitrogen.quantity=1
		self.specials.liquid_nitrogen.max_quantity=4
		self.specials.thermite.quantity=1
		self.specials.thermite.max_quantity=4	
		self.specials.blood_sample.quantity=1
		self.specials.blood_sample.max_quantity=4		
		self.specials.blood_sample_verified.quantity=1
		self.specials.blood_sample_verified.max_quantity=4	
		self.specials.mayan_gold_bar.quantity=4
		self.specials.mayan_gold_bar.max_quantity=4		
		self.specials.lance_part.quantity=4
		self.specials.lance_part.max_quantity=4				
   	end
end