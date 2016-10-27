local sc_etd = EquipmentsTweakData.init
function EquipmentsTweakData:init()
	sc_etd(self, tweak_data)


	if restoration.Options:GetValue("SC/SC") then	
		--Because you're not getting 6 fucking sentries--
		self.sentry_gun.quantity = {1}
		self.trip_mine.quantity = {3, 3}
	end

	--Again just some quality of life stuff to make single player less awful--
    	if Global.game_settings and Global.game_settings.single_player then
		self.specials.acid.max_quantity=4
		self.specials.caustic_soda.max_quantity=4
		self.specials.hydrogen_chloride.max_quantity=4
		self.specials.boards.max_quantity=4
		self.specials.planks.max_quantity=4
		--self.specials.bank_manager_key.max_quantity=4
		self.specials.thermite_paste.max_quantity=4
		self.specials.acid.quantity=1
		self.specials.caustic_soda.quantity=1
		self.specials.hydrogen_chloride.quantity=1
		self.specials.boards.quantity=1
		self.specials.planks.quantity=1
		--self.specials.bank_manager_key.quantity = 0
		self.specials.thermite_paste.quantity=1
		self.specials.cable_tie.quantity=8
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
   	end
end