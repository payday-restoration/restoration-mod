function ElectricGrenade:_tase_player()
	local player = managers.player:player_unit()

	if alive(player) and player == self:thrower_unit() and player:character_damage().on_self_tased then
		local detonate_pos = self._unit:position() + math.UP * 100
		local range = self._range
		local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range)
		local los = managers.environment_controller:test_line_of_sight(detonate_pos + Vector3(0, 0, 150), 200, range / 3, range) or 0

		if affected and los > 0 then
			player:character_damage():on_self_tased(0.5)
		end
	end
end