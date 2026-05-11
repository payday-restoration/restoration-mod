-- Tweak spy camera marking
-- Now marks all hostages and enemies, not only guards and specials
-- Can now mark multiple units per update, and prioritize marking units with certain tags first
-- Marks with "trip mine" context so that marked units are always visible through walls on Pro Jobs
Hooks:OverrideFunction(SpyCameraBase, "update", function(self, unit, t, dt)
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

	local candidate_units = {
		hostages = {},
		hostiles = {},
	}
	local enemies_mask = managers.slot:get_mask("enemies")
	for _, found_unit in ipairs(found_units) do
		if alive(found_unit) and not found_unit:character_damage():dead() and found_unit:base()._tweak_table then
			local ray = self._unit:raycast("ray", found_unit:movement():m_head_pos(), position + forward * 2, "ray_type", "ai_vision", "slot_mask", self._slotmask, "report")

			if not ray then
				local category = found_unit:in_slot(enemies_mask) and "hostiles" or "hostages"
				table.insert(candidate_units[category], found_unit)
			end
		end
	end

	local spy_camera_tweak = tweak_data.equipments.spy_camera

	-- Don't worry about it giving a "trip mine" context, it doesn't matter that much.
	for i, unit in ipairs(candidate_units.hostages) do
		if i <= spy_camera_tweak.mark_limit_per_update.hostages then
			managers.game_play_central:auto_highlight_enemy(unit, true, "trip_mine")
		else
			break
		end
	end

	local marked_hostiles = 0
	local too_many_marked
	for _, tag in ipairs(spy_camera_tweak.ordered_mark_priority) do
		local i = 1
		while candidate_units.hostiles[i] do
			local unit = candidate_units.hostiles[i]
			local tags = unit:base().get_tags and unit:base():get_tags() or {}
			if tags[tag] and managers.game_play_central:auto_highlight_enemy(unit, true, "trip_mine") then
				marked_hostiles = marked_hostiles + 1
				table.remove(candidate_units.hostiles, i)
			else
				i = i + 1
			end
			too_many_marked = marked_hostiles >= spy_camera_tweak.mark_limit_per_update.hostiles
			if too_many_marked then
				break
			end
		end
		if too_many_marked then
			break
		end
	end

	if not too_many_marked then
		for _, unit in ipairs(candidate_units.hostiles) do
			if managers.game_play_central:auto_highlight_enemy(unit, true, "trip_mine") then
				marked_hostiles = marked_hostiles + 1
				if marked_hostiles >= spy_camera_tweak.mark_limit_per_update.hostiles then
					break
				end
			end
		end
	end
end)
