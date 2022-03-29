Hooks:PostHook(AnimatedVehicleBase, "set_enabled", "woohoo_wow", function(self, state)
	--this is possibly really shit, but it does in fact work
	-- also yes, you can in fact do special textures for every vehicle in the game this way and make them difficulty, faction, and level dependent as long as you make a unique-
	-- sequence for material switches. neat stuff, isn't it?
	
	local level = Global.level_data and Global.level_data.level_id	
	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
    local unit_name = self._unit:name()
    --local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"

    local str_vans = unit_name == Idstring("units/payday2/vehicles/str_vehicle_swat_van/str_vehicle_swat_van") 
    local anim_vans = unit_name == unit_name == Idstring("units/payday2/vehicles/bnk_vehicle_truck_police_anim_1/bnk_vehicle_truck_police_anim_1") or unit_name == Idstring("units/payday2/vehicles/bnk_vehicle_truck_police_anim_2/bnk_vehicle_truck_police_anim_2") 
    	
	--it seems to think the sequences dont exist?????????	
	
	--[[this is so gross
    if faction == "nypd" or faction == "america" or faction == "zombie" then	 
	    log("nypd/america/zombies")
        if self._unit:damage():has_sequence("mat_blueswat_str") and difficulty < 6 then
            self._unit:damage():run_sequence_simple("mat_blueswat_str")
        elseif self._unit:damage():has_sequence("mat_fbi_str") and difficulty == 6  then
            self._unit:damage():run_sequence_simple("mat_fbi_str")
        elseif self._unit:damage():has_sequence("mat_gensec_str") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_gensec_str")    
        elseif self._unit:damage():has_sequence("mat_zeal_str") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeal_str")    
        elseif self._unit:damage():has_sequence("mat_blueswat") and difficulty < 6 then
            self._unit:damage():run_sequence_simple("mat_blueswat")
        elseif self._unit:damage():has_sequence("mat_fbi") and difficulty == 6  then
            self._unit:damage():run_sequence_simple("mat_fbi")
        elseif self._unit:damage():has_sequence("mat_gensec") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_gensec")    
        elseif self._unit:damage():has_sequence("mat_zeal") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeal")    
        end 
	elseif faction == "lapd" then	 
	    log("lapd")
        if self._unit:damage():has_sequence("mat_blueswat_str") and difficulty < 6 then
            self._unit:damage():run_sequence_simple("mat_blueswat_str")
        elseif self._unit:damage():has_sequence("mat_fbi_str") and difficulty == 6  then
            self._unit:damage():run_sequence_simple("mat_fbi_str")
        elseif self._unit:damage():has_sequence("mat_fbi_str") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_fbi_str")    
        elseif self._unit:damage():has_sequence("mat_zeal_str") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeal_str")    
        elseif self._unit:damage():has_sequence("mat_blueswat") and difficulty < 6 then
            self._unit:damage():run_sequence_simple("mat_blueswat")
        elseif self._unit:damage():has_sequence("mat_fbi")and difficulty == 6  then
            self._unit:damage():run_sequence_simple("mat_fbi")
        elseif self._unit:damage():has_sequence("mat_fbi") and difficulty == 7  then
            self._unit:damage():run_sequence_simple("mat_fbi")    
        elseif self._unit:damage():has_sequence("mat_zeal") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_zeal")    
        end 
	elseif faction == "murkywater" then
	    log("murkies")
        if self._unit:damage():has_sequence("mat_murky_str") and difficulty < 8 then
            self._unit:damage():run_sequence_simple("mat_murky_str")
        elseif self._unit:damage():has_sequence("mat_omnia_str")  and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_omnia_str") 
        elseif self._unit:damage():has_sequence("mat_murky") and difficulty < 8 then
            self._unit:damage():run_sequence_simple("mat_murky")
        elseif self._unit:damage():has_sequence("mat_omnia") and difficulty == 8 then
            self._unit:damage():run_sequence_simple("mat_omnia") 
        end 
	elseif faction == "russia" then
	    log("reapers")
        if self._unit:damage():has_sequence("mat_reapers_str") then
            self._unit:damage():run_sequence_simple("mat_reapers_str")
        elseif self._unit:damage():has_sequence("mat_reapers") then
            self._unit:damage():run_sequence_simple("mat_reapers")
        end 
    end]]--
	
	if self._unit:damage() and self._unit:damage():has_sequence("change_material_to_murkywater") and faction == "murkywater" then
		self._unit:damage():run_sequence_simple("change_material_to_murkywater")
	elseif self._unit:damage() and self._unit:damage():has_sequence("change_material_to_mexican") and faction == "federales"  then
		self._unit:damage():run_sequence_simple("change_material_to_mexican")	
	end
	
end)