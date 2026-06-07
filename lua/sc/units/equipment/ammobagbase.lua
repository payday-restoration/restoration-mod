function AmmoBagBase:_take_ammo(unit)
	local taken = 0
	local bulletstorm_scale = 0
	local inventory = unit:inventory()

	if inventory then
		for _, weapon in pairs(inventory:available_selections()) do
			local took = self:round_value(weapon.unit:base():add_ammo_from_bag(self._ammo_amount))
			local ratio = weapon.unit:base()._ammo_ratio or 1

			taken = taken + took
			bulletstorm_scale = bulletstorm_scale + took / ratio

			self._ammo_amount = self:round_value(self._ammo_amount - took)

			if self._ammo_amount <= 0 then
				taken = 2

				self:_set_empty()

				return taken, bulletstorm_scale
			end
		end
	end

	return taken, bulletstorm_scale
end

function AmmoBagBase:take_ammo(unit)
	if self._empty then
		return false, false
	end

	local taken, bulletstorm_scale = self:_take_ammo(unit)

	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, taken)
	end

	if self._ammo_amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	local bullet_storm = false

	if self._bullet_storm_level and self._bullet_storm_level > 0 then
		bullet_storm = math.min(self._BULLET_STORM[self._bullet_storm_level] * bulletstorm_scale, self._BULLET_STORM[self._bullet_storm_level] * 2)
	end

	return taken > 0, bullet_storm
end