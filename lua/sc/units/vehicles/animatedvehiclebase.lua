Hooks:PostHook(AnimatedVehicleBase, "set_enabled", "woohoo_wow", function(self, state)
	--this is possibly really shit, but it does in fact work
	
	-- also yes, you can in fact do special textures for every vehicle in the game this way and make them difficulty, faction, and level dependent as long as you make a unique-
	-- sequence for material switches. neat stuff, isn't it?
	
	local level = Global.level_data and Global.level_data.level_id	
	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if self._unit:damage() and self._unit:damage():has_sequence("change_material_to_murkywater") and faction == "murkywater" then
		self._unit:damage():run_sequence_simple("change_material_to_murkywater")
	elseif self._unit:damage() and self._unit:damage():has_sequence("change_material_to_mexican") and faction == "federales"  then
		self._unit:damage():run_sequence_simple("change_material_to_mexican")	
	end
	
end)
