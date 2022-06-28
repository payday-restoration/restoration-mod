--Simpler spread function. Determines area bullets can hit then converts that to the max degrees by which the rays can fire.
function PlayerTurretBase :_get_spread()
	local user_unit = self._setup.user_unit
	local current_state = user_unit:movement()._current_state
	
	if not current_state then
		return 0, 0
	end
	
	--Get spread area from accuracy stat.
	local spread_area = math.max(self._spread + 
		managers.blackmarket:accuracy_index_addend(self._name_id, self:categories(), self._silencer, current_state, self:fire_mode(), self._blueprint) * tweak_data.weapon.stat_info.spread_per_accuracy, 0.05)

	--Apply skill and stance multipliers to overall spread area.
	local multiplier = tweak_data.weapon.stat_info.stance_spread_mults[current_state:get_movement_state()] * self:conditional_accuracy_multiplier(current_state)

	if not current_state:full_steelsight() then
		local hipfire_spread_mult = 1
		for _, category in ipairs(self:weapon_tweak_data().categories) do
			local hip_mult = tweak_data[category] and tweak_data[category].hipfire_spread_mult or 1
			hipfire_spread_mult = hipfire_spread_mult * hip_mult
		end
		multiplier = multiplier * hipfire_spread_mult
	end

	spread_area = spread_area * multiplier

	--Convert spread area to degrees.
	local spread_x = math.sqrt((spread_area)/math.pi)
	local spread_y = spread_x
	
	if self._spread_multiplier then
		spread_x = spread_x * self._spread_multiplier[1]
		spread_y = spread_y * self._spread_multiplier[2]
	end

	return spread_x, spread_y
end