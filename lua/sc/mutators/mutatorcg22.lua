function MutatorCG22:setup(mutator_manager)
	print("MutatorCG22:setup")

	self._tweakdata = tweak_data.mutators.cg22
	local spawn_data = tweak_data.mutators:get_cg22_tree_coordinates()[Global.level_data.level_id]
	self._position = spawn_data and spawn_data.position or Vector3()
	self._rotation = spawn_data and spawn_data.rotation or Rotation()
	local sled_data = tweak_data.mutators:get_cg22_sled_coordinates()[Global.level_data.level_id]
	self._sled_position = sled_data and sled_data.position + Vector3(0, 0, 10) or self._position + Vector3(600, 0, 0)
	self._sled_rotation = sled_data and Rotation(sled_data.rotation:yaw() + 180, sled_data.rotation:pitch(), sled_data.rotation:roll()) or Rotation()
	local shredder_data = tweak_data.mutators:get_cg22_shredder_offsets()[Global.level_data.level_id]
	self._shredder_position = self._position + (shredder_data and shredder_data.position or self._tweakdata.shredder_generic_offset)
	local look_rot = Rotation:look_at(self._shredder_position, self._position, Vector3(0, 0, 1))
	self._shredder_rotation = Rotation(look_rot:yaw() - 90, 0, 0)
	self._shredder_direction = Vector3(math.cos(self._shredder_rotation:yaw()), math.sin(self._shredder_rotation:yaw()), 0)
	self._sled_sound_source = SoundDevice:create_source("CG22Sled")

	self._sled_sound_source:set_position(self._sled_position)

	self._shredder_sound_source = SoundDevice:create_source("CG22Shredder")

	self._shredder_sound_source:set_position(self._shredder_position)

	self._sled_bag_check_t = 0
	self._shredder_bag_check_t = 0
	self._tree_area_check_t = 0
	self._bag_slotmask = World:make_slot_mask(14)
	self._player_slotmask = World:make_slot_mask(2, 3, 4, 5)
	self._event_started = false
	self._tree_shake_timer = false
	
	--log("SC: Snowman spawns!")
	--Setting up Snowmen to be repeating spawns, because we need more of him
    tweak_data.group_ai.enemy_spawn_groups.snowman_boss.max_nr_simultaneous_groups = 1
    tweak_data.group_ai.enemy_spawn_groups.snowman_boss.spawn_cooldown = 120
    tweak_data.group_ai.enemy_spawn_groups.snowman_boss.initial_spawn_delay = 90
    tweak_data.group_ai.enemy_spawn_groups.snowman_boss.spawn.respawn_cooldown = 120
end

function MutatorCG22:on_snowman_killed(unit, damage_info)
	managers.event_jobs:award("cg22_snowman_objective")

	if Network:is_server() and damage_info then
		Telemetry:send_on_game_event_snoman_death({
			weapon_id = alive(damage_info.weapon_unit) and damage_info.weapon_unit:base().name_id or ""
		})
	end
end

