if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	CopInventory.add_unit_by_factory_name = HuskPlayerInventory.add_unit_by_factory_name
	CopInventory.add_unit_by_factory_blueprint = HuskPlayerInventory.add_unit_by_factory_blueprint

end