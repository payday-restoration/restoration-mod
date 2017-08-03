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

end