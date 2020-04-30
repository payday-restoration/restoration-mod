HuskCopBrain._NET_EVENTS = {
	cloak = 4,
	uncloak = 3,
	weapon_laser_off = 2,
	weapon_laser_on = 1
}

function HuskCopBrain:sync_surrender(surrendered)
	if surrendered then
		self._unit:base():set_slot(self._unit, 22)
	else
		self._unit:base():set_slot(self._unit, 12)
	end

	self._surrendered = surrendered
end

function HuskCopBrain:sync_net_event(event_id)
	if event_id == self._NET_EVENTS.cloak then
		if self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
			self._unit:damage():run_sequence_simple("cloak_engaged")

			local weapon_unit = self._unit:inventory():equipped_unit()

			if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
				weapon_unit:damage():run_sequence_simple("cloak_engaged")
			end
		end
	elseif event_id == self._NET_EVENTS.uncloak then
		if self._unit:damage() and self._unit:damage():has_sequence("decloak") then
			self._unit:damage():run_sequence_simple("decloak")

			local weapon_unit = self._unit:inventory():equipped_unit()

			if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("decloak") then
				weapon_unit:damage():run_sequence_simple("decloak")
			end
		end
	elseif event_id == self._NET_EVENTS.weapon_laser_on then
		self._add_laser_t = HuskCopBrain._ENABLE_LASER_TIME
	elseif event_id == self._NET_EVENTS.weapon_laser_off then
		self:disable_weapon_laser()
	end
end