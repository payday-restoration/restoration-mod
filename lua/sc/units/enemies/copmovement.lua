

		variant = damage_info.variant,
		direction_vec = attack_dir,
		hit_pos = hit_pos,
		body_part = body_part,
		blocks = blocks,
		client_interrupt = client_interrupt,
		weapon_unit = damage_info.weapon_unit,
		attacker_unit = damage_info.attacker_unit,
		death_type = death_type,
		ignite_character = damage_info.ignite_character,
		start_dot_damage_roll = damage_info.start_dot_damage_roll,
		is_fire_dot_damage = damage_info.is_fire_dot_damage,
		fire_dot_data = damage_info.fire_dot_data,
		allow_network = true
	}


	if Network:is_server() or not self:chk_action_forbidden(action_data) then
		self:action_request(action_data)
	end
end


function CopMovement:anim_clbk_police_called(unit)
	local group_state = managers.groupai:state()
	local job = Global.level_data and Global.level_data.level_id


	if Network:is_server() then
		if not group_state:is_ecm_jammer_active("call") then
			local cop_type = tostring(group_state.blame_triggers[self._ext_base._tweak_table])


			group_state:on_criminal_suspicion_progress(nil, self._unit, "called")


			--Instant failure on the relevant tutorial heists
			if job == "short1_stage1" or job == "short1_stage2" then 
				group_state:on_police_called(self:coolness_giveaway())
			else
				if cop_type == "civ" then
					group_state._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 1
					group_state._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
					group_state._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
					group_state._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 1
					group_state:_delay_whisper_suspicion_mul_decay()		
				else
					group_state._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 1
					group_state._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
					group_state._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
					group_state._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 1
					group_state:_delay_whisper_suspicion_mul_decay()	
					
					--Maybe one day
					--self:set_cool(true, nil, false)
				end
			end
		else
			group_state:on_criminal_suspicion_progress(nil, self._unit, "call_interrupted")
		end
	end
end
