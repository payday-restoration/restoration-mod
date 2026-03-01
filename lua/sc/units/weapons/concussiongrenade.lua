ConcussionGrenade._PLAYER_FLASH_RANGE = 1000

--[[
function ConcussionGrenade:_flash_player()
	local detonate_pos = self._unit:position() + math.UP * 100
	local range = self._PLAYER_FLASH_RANGE
	local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range)
	local los = managers.environment_controller:test_line_of_sight_explosion(detonate_pos, range) or false

	if affected and los then
		managers.environment_controller:set_concussion_grenade(detonate_pos, line_of_sight, travel_dis, linear_dis, tweak_data.character.concussion_multiplier)

		local sound_eff_mul = math.clamp(1 - (travel_dis or linear_dis) / range, 0.3, 1)

		managers.player:player_unit():character_damage():on_concussion(sound_eff_mul)
	end
end
--]]