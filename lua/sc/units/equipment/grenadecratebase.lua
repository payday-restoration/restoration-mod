function GrenadeCrateBase:take_grenade(unit)
	if self._empty then
		return
	end

	local can_take_grenade = self:_can_take_grenade() and 1 or 0

	if can_take_grenade == 1 then
		unit:sound():play("pickup_ammo")
		--Guarantees a fill up
		managers.player:add_grenade_amount(21)
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)
		managers.player:register_grenade(managers.network:session():local_peer():id())

		self._grenade_amount = self._grenade_amount - 1

		print("Took " .. 1 .. " grenades, " .. self._grenade_amount .. " left")
	end

	if self._grenade_amount <= 0 then
		self:_set_empty()
	end

	self:_set_visual_stage()

	return can_take_grenade
end