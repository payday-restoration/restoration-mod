if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function EnemyManager:add_magazine(magazine, collision)
		self._magazines = self._magazines or {}
		table.insert(self._magazines, {magazine, collision})
	end

	function EnemyManager:shield_limit()
		return self:corpse_limit()
	end

	function EnemyManager:get_nearby_medic(unit)
		if self:is_civilian(unit) then
			return nil
		end
		local enemies
		if unit:base()._tweak_table == "taser_summers" or unit:base()._tweak_table == "boom_summers" then
			enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.radius_summers, managers.slot:get_mask("enemies"))
			for _, enemy in ipairs(enemies) do
				if enemy:base():has_tag("medic_summers_special") and enemy:base():has_tag("custom") then
					return enemy
				end
			end
		elseif unit:base()._tweak_table == "summers" then
			enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.radius_summers, managers.slot:get_mask("enemies"))
			for _, enemy in ipairs(enemies) do
				if enemy:base():has_tag("medic_summers") and enemy:base():has_tag("custom") then
					return enemy
				end
			end
		elseif unit:base()._tweak_table ~= "medic_summers" then
			enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))
			for _, enemy in ipairs(enemies) do
				if enemy:base():has_tag("medic")then
					return enemy
				end
			end
		end
		return nil
	end
	
	--for internal testing only
	function EnemyManager:start_autumn_blackout()
		local all_eq = World:find_units_quick("all",14,25,26)
		for k,unit in pairs(all_eq) do 
			if unit:base() then 
				unit:base().blackout_active = true
			end
			if unit.contour and unit:contour() then 
				unit:contour():add("deployable_blackout")
			end
		end
	end
	
	--lol idk where to put this so i guess it goes in enemymanager
	--this function is called on autumn's death, and removes the un-interactable blackout effect on all deployables
	function EnemyManager:end_autumn_blackout()
		local all_eq = World:find_units_quick("all",14,25,26)
		for k,unit in pairs(all_eq) do 
			if unit:base() then 
				unit:base().blackout_active = false
			end
			if unit.contour and unit:contour() then 
				unit:contour():remove("deployable_blackout")
			end
		end
	end
	
end
