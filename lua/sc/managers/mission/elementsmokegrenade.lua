function ElementSmokeGrenade:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local detonate_pos = self._values.position
	local shooter_pos = self._values.position
	local duration = self._values.duration
	local ignore_control = self._values.ignore_control
	local flashbang = self._values.effect_type == "flash"

	managers.groupai:state():queue_smoke_grenade(self:id(), detonate_pos, shooter_pos, duration, ignore_control, flashbang)

	if self._values.immediate then
		if managers.groupai:state():get_assault_mode() or ignore_control then
			managers.groupai:state():detonate_world_smoke_grenade(self:id())
			managers.network:session():send_to_peers_synched("sync_smoke_grenade", detonate_pos, shooter_pos, duration, flashbang and true or false)
		end
	end

	ElementSmokeGrenade.super.on_executed(self, instigator)
end