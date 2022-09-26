-- Show pickup message and hide the unit instantly instead of waiting for response from host
function GageAssignmentBase:sync_pickup(peer)
	if self._picked_up then
		return -- client picked it up but just after someone else did so it got synced back
	end

	self._picked_up = true

	if not managers.gage_assignment:is_unit_an_assignment(self._unit) then
		return self:consume()
	end

	managers.gage_assignment:on_unit_interact(self._unit, self._assignment)
	self:show_pickup_msg(peer)

	if Network:is_server() then
		local peer_id = peer and peer:id() or 1
		managers.network:session():send_to_peers_synched_except(peer_id, "sync_unit_event_id_16", self._unit, "base", peer_id) -- don't sync back to the peer that picked it up since they've already handled it on their end
	end

	self:consume()
end

function GageAssignmentBase:_pickup(unit)
	if self._picked_up then
		return
	end

	self:sync_pickup(managers.network:session():local_peer())

	if Network:is_client() then
		managers.network:session():send_to_host("sync_pickup", self._unit)
	end

	return true
end

function GageAssignmentBase:show_pickup_msg(peer)
	if peer then
		managers.gage_assignment:present_progress(self._assignment, peer:name())
	end
end

function GageAssignmentBase:sync_net_event(event_id)
	if Network:is_client() then
		self:sync_pickup(managers.network:session():peer(event_id))
	end
end
