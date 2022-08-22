function AmmoBagBase:take_ammo(unit)
	if self._empty then
		return false, false
	end

	local taken = self:_take_ammo(unit)

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
		bullet_storm = math.min(self._BULLET_STORM[self._bullet_storm_level] * taken, self._BULLET_STORM[self._bullet_storm_level] * 2)
	end

	return taken > 0, bullet_storm
end