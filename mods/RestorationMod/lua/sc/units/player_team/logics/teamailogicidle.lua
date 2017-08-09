if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	if SystemFS:exists("mods/Better Bots/mod.txt") then
		return
	end

	function TeamAILogicIdle._get_priority_attention(data, attention_objects, reaction_func)
		reaction_func = reaction_func or TeamAILogicBase._chk_reaction_to_attention_object
		local best_target, best_target_priority_slot, best_target_priority, best_target_reaction
		for u_key, attention_data in pairs(attention_objects) do
			local att_unit = attention_data.unit
			local crim_record = attention_data.criminal_record
			if not attention_data.identified then
			elseif attention_data.pause_expire_t then
				if data.t > attention_data.pause_expire_t then
					attention_data.pause_expire_t = nil
				end
			elseif attention_data.stare_expire_t and data.t > attention_data.stare_expire_t then
				if attention_data.settings.pause then
					attention_data.stare_expire_t = nil
					attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
				end
			else
				local distance = mvector3.distance(data.m_pos, attention_data.m_pos)
				local reaction = reaction_func(data, attention_data, not CopLogicAttack._can_move(data))
				local aimed_at = TeamAILogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)
				attention_data.aimed_at = aimed_at
				local reaction_too_mild
				if not reaction or best_target_reaction and best_target_reaction > reaction then
					reaction_too_mild = true
				elseif distance < 150 and reaction <= AIAttentionObject.REACT_SURPRISED then
					reaction_too_mild = true
				end
				if not reaction_too_mild then
					local alert_dt = attention_data.alert_t and data.t - attention_data.alert_t or 10000
					local dmg_dt = attention_data.dmg_t and data.t - attention_data.dmg_t or 10000
					local mark_dt = attention_data.mark_t and data.t - attention_data.mark_t or 10000
					local near_threshold = 800
					if data.attention_obj and data.attention_obj.u_key == u_key then
						alert_dt = alert_dt * 0.8
						dmg_dt = dmg_dt * 0.8
						mark_dt = mark_dt * 0.8
						distance = distance * 0.8
					end
					local visible = attention_data.verified
					local near = near_threshold > distance
					local has_alerted = alert_dt < 5
					local has_damaged = dmg_dt < 2
					local been_marked = mark_dt < 8
					local dangerous_special = attention_data.is_very_dangerous
					local target_priority = distance
					local target_priority_slot = 0
					local enemy_type = att_unit:base()._tweak_table
					if visible then
						if enemy_type == "shield" then
							local target_vec = data.m_pos - att_unit:movement():m_pos()
							local spin = target_vec:to_polar_with_reference(att_unit:movement():m_rot():y(), math.UP).spin
							target_priority_slot = math.abs(spin) > 90 and 1 or 7
						else
							if enemy_type == "tank" and near then
								local target_vec = data.m_pos - att_unit:movement():m_pos()
								local spin = target_vec:to_polar_with_reference(att_unit:movement():m_rot():y(), math.UP).spin
								target_priority_slot = math.abs(spin) < 90 and 1 or 3
							elseif enemy_type == "sniper" or (enemy_type == "phalanx_minion" and near) then
								target_priority_slot = 1
							elseif (dangerous_special or been_marked) and distance < 1600 then
								target_priority_slot = 2
							elseif near and (has_alerted and has_damaged or been_marked) then
								target_priority_slot = 3
							elseif near and has_alerted then
								target_priority_slot = 4
							elseif has_alerted then
								target_priority_slot = 5
							else
								target_priority_slot = 6
							end
						end
					elseif has_alerted then
						target_priority_slot = 7
					else
						target_priority_slot = 8
					end
					if reaction < AIAttentionObject.REACT_COMBAT then
						target_priority_slot = 10 + target_priority_slot + math.max(0, AIAttentionObject.REACT_COMBAT - reaction)
					end
					if target_priority_slot ~= 0 then
						local best = false
						if not best_target then
							best = true
						elseif best_target_priority_slot > target_priority_slot then
							best = true
						elseif target_priority_slot == best_target_priority_slot and best_target_priority > target_priority then
							best = true
						end
						if best then
							best_target = attention_data
							best_target_priority_slot = target_priority_slot
							best_target_priority = target_priority
							best_target_reaction = reaction
						end
					end
				end
			end
		end
		return best_target, best_target_priority_slot, best_target_reaction
	end

end