function CopActionAct:on_exit()
	if self._unit:character_damage().set_mover_collision_state then
		self._unit:character_damage():set_mover_collision_state(true)
	end

	if self._changed_driving then
		self._unit:set_driving("script")

		self._changed_driving = nil

		self._ext_movement:set_m_rot(self._unit:rotation())
		self._ext_movement:set_m_pos(self._unit:position())
	end

	self._ext_movement:drop_held_items()

	if self._ext_anim.stop_talk_on_action_exit then
		self._unit:sound():stop()
	end

	if self._modifier_on then
		self._modifier_on = nil

		self._machine:forbid_modifier(self._modifier_name)
	end

	if self._expired then
		CopActionWalk._chk_correct_pose(self)
	end

	if Network:is_client() then
		if not self._ext_movement.m_pos or not self._ext_movement:m_pos() then
			if self._unit.name then
				log(self._unit:name())
			end
		else
			self._ext_movement:set_m_host_stop_pos(self._ext_movement:m_pos())
		end
	elseif not self._expired then
		self._common_data.ext_network:send("action_act_end")
	end
end
