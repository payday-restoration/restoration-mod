if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ConcussionGrenade._PLAYER_FLASH_RANGE = 1000


	function ConcussionGrenade:_flash_player()
		local detonate_pos = self._unit:position() + math.UP * 100
		local range = self._PLAYER_FLASH_RANGE
		local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range)

		if affected then
			log("Pos: " .. detonate_pos .. "LinearDist" .. linear_dis)
			managers.environment_controller:set_concussion_grenade(detonate_pos, line_of_sight, travel_dis, linear_dis, tweak_data.character.concussion_multiplier)

			local sound_eff_mul = math.clamp(1 - (travel_dis or linear_dis) / range, 0.3, 1)

			managers.player:player_unit():character_damage():on_concussion(sound_eff_mul)
		end
	end
end