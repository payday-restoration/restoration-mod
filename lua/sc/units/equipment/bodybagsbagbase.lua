function BodyBagsBagBase:take_bodybag(unit)
	if self._empty then
		return
	end

	local can_take_bodybag = self:_can_take_bodybag() and 1 or 0

	if can_take_bodybag == 1 then
		unit:sound():play("pickup_ammo")
		--Guarantees a fill up
		managers.player:add_body_bags_amount(21)
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)

		self._bodybag_amount = self._bodybag_amount - 1

		managers.mission:call_global_event("player_refill_bodybagsbag")
	end

	if self._bodybag_amount <= 0 then
		self:_set_empty()
	end

	self:_set_visual_stage()

	return can_take_bodybag
end