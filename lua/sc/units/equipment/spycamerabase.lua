function SpyCameraBase:update(unit, t, dt)
	if self._removed then
		return
	end

	if Network:is_server() then
		self:_check_body()
	end

	if not self._is_local_owner then
		return
	end

	if self._next_update_t and t < self._next_update_t then
		return
	end

	self._next_update_t = t + self._update_rate
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local forward = rotation:y()
	local found_units = World:find_units_quick("cone", position, position + forward * 3000, 2300, managers.slot:get_mask("trip_mine_targets"))

	if not found_units then
		return
	end

    for _, found_unit in ipairs(found_units) do
        if alive(found_unit) and not found_unit:character_damage():dead() and found_unit:base()._tweak_table then
            local ray = self._unit:raycast("ray", found_unit:movement():m_head_pos(), position + forward * 2, "ray_type", "ai_vision", "slot_mask", self._slotmask, "report")

            if not ray and managers.game_play_central:auto_highlight_enemy(found_unit, true, "trip_mine") then
                -- Don't worry about it giving a "trip mine" context, it doesn't matter that much.
                break
            end
        end
    end
end