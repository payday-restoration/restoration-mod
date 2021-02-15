function DoctorBagBase:take(unit)
	if self._empty then
		return
	end
	
	--Remove first aid damage reduction.

	local taken = self:_take(unit)

	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_doctor_bag_taken", self._unit, taken)
		managers.mission:call_global_event("player_refill_doctorbag")
	end

	if self._amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	return taken > 0
end

--Make Doctor's Bags only have up to 3 blood bags.
function DoctorBagBase:_set_visual_stage()
	local percentage = self._amount / self._max_amount

	if self._unit:damage() then
		--*3 instead of *4
		local state = "state_" .. math.ceil(percentage * 3)

		if self._unit:damage():has_sequence(state) then
			self._unit:damage():run_sequence_simple(state)
		end
	end
end