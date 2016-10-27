if restoration.Options:GetValue("SC/SC") then

function PlayerCarry:_perform_jump(jump_vec)
        mvector3.multiply(jump_vec, tweak_data.carry.types[self._tweak_data_name].jump_modifier)
	PlayerCarry.super._perform_jump(self, jump_vec)
end

function PlayerCarry:_get_max_walk_speed(...)
	local multiplier = tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
	if managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") then
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("carry", "movement_speed_multiplier", 1), 0, 1)
	else
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("carry", "movement_speed_multiplier", 1), 0, 1)
	end
	return PlayerCarry.super._get_max_walk_speed(self, ...) * multiplier
end

end