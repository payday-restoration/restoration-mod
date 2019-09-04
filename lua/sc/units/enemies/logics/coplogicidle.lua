if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    --harass enemy priority changes
    function CopLogicIdle._get_priority_attention(data, attention_objects, reaction_func)
      reaction_func = reaction_func or CopLogicIdle._chk_reaction_to_attention_object
      local best_target, best_target_priority_slot, best_target_priority, best_target_reaction = nil
      local forced_attention_data = managers.groupai:state():force_attention_data(data.unit)

      if forced_attention_data then
        if data.attention_obj and data.attention_obj.unit == forced_attention_data.unit then
          return data.attention_obj, 1, AIAttentionObject.REACT_SHOOT
        end

        local forced_attention_object = managers.groupai:state():get_AI_attention_object_by_unit(forced_attention_data.unit)

        if forced_attention_object then
          for u_key, attention_info in pairs(forced_attention_object) do
            if forced_attention_data.ignore_vis_blockers then
              local vis_ray = World:raycast("ray", data.unit:movement():m_head_pos(), attention_info.handler:get_detection_m_pos(), "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

              if not vis_ray or vis_ray.unit:key() == u_key or not vis_ray.unit:visible() then
                best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
                best_target.verified = true
              end
            else
              best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
            end
          end
        else
          Application:error("[CopLogicIdle._get_priority_attention] No attention object available for unit", inspect(forced_attention_data))
        end

        if best_target then
          return best_target, 1, AIAttentionObject.REACT_SHOOT
        end
      end

      local near_threshold = data.internal_data.weapon_range.optimal
      local too_close_threshold = data.internal_data.weapon_range.close

      for u_key, attention_data in pairs(attention_objects) do
        local att_unit = attention_data.unit
        local crim_record = attention_data.criminal_record

        if not attention_data.identified then
          -- Nothing
        elseif attention_data.pause_expire_t then
          if attention_data.pause_expire_t < data.t then
            if not attention_data.settings.attract_chance or math.random() < attention_data.settings.attract_chance then
              attention_data.pause_expire_t = nil
            else
              debug_pause_unit(data.unit, "[ CopLogicIdle._get_priority_attention] skipping attraction")

              attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
            end
          end
        elseif attention_data.stare_expire_t and attention_data.stare_expire_t < data.t then
          if attention_data.settings.pause then
            attention_data.stare_expire_t = nil
            attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
          end
        else
          local distance = attention_data.dis
          local reaction = reaction_func(data, attention_data, not CopLogicAttack._can_move(data))

          if data.cool and AIAttentionObject.REACT_SCARED <= reaction then
            data.unit:movement():set_cool(false, managers.groupai:state().analyse_giveaway(data.unit:base()._tweak_table, att_unit))
          end

          local reaction_too_mild = nil

          if not reaction or best_target_reaction and reaction < best_target_reaction then
            reaction_too_mild = true
          elseif distance < 150 and reaction == AIAttentionObject.REACT_IDLE then
            reaction_too_mild = true
          end

          if not reaction_too_mild then
            local aimed_at = CopLogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)
            attention_data.aimed_at = aimed_at
            local alert_dt = attention_data.alert_t and data.t - attention_data.alert_t or 10000
            local dmg_dt = attention_data.dmg_t and data.t - attention_data.dmg_t or 10000
            local status = crim_record and crim_record.status
            local nr_enemies = crim_record and crim_record.engaged_force
            local old_enemy = false

            if data.attention_obj and data.attention_obj.u_key == u_key and data.t - attention_data.acquire_t < 4 then
              old_enemy = true
            end

            local weight_mul = attention_data.settings.weight_mul

            if attention_data.is_local_player then
              if not att_unit:movement():current_state()._moving and att_unit:movement():current_state():ducking() then
                weight_mul = (weight_mul or 1) * managers.player:upgrade_value("player", "stand_still_crouch_camouflage_bonus", 1)
              end

              if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") and managers.player:upgrade_value("player", "chico_preferred_target", false) then
                weight_mul = (weight_mul or 1) * 1000
              end

              if _G.IS_VR and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
                local mul = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1
                weight_mul = (weight_mul or 1) * mul
              end
            elseif att_unit:base() and att_unit:base().upgrade_value then
              if att_unit:movement() and not att_unit:movement()._move_data and att_unit:movement()._pose_code and att_unit:movement()._pose_code == 2 then
                weight_mul = (weight_mul or 1) * (att_unit:base():upgrade_value("player", "stand_still_crouch_camouflage_bonus") or 1)
              end

              if att_unit:base().has_activate_temporary_upgrade and att_unit:base():has_activate_temporary_upgrade("temporary", "chico_injector") and att_unit:base():upgrade_value("player", "chico_preferred_target") then
                weight_mul = (weight_mul or 1) * 1000
              end

              if att_unit:movement().is_vr and att_unit:movement():is_vr() and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
                local mul = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1
                weight_mul = (weight_mul or 1) * mul
              end
            end

            if weight_mul and weight_mul ~= 1 then
              weight_mul = 1 / weight_mul
              alert_dt = alert_dt and alert_dt * weight_mul
              dmg_dt = dmg_dt and dmg_dt * weight_mul
              distance = distance * weight_mul
            end

            local assault_reaction = reaction == AIAttentionObject.REACT_SPECIAL_ATTACK
            local visible = attention_data.verified
            local near = distance < near_threshold
            local too_near = distance < too_close_threshold and math.abs(attention_data.m_pos.z - data.m_pos.z) < 250
            local free_status = status == nil
            local has_alerted = alert_dt < 3.5
            local has_damaged = dmg_dt < 5
            local reviving = nil
            local focus_enemy = attention_data

            if not data.unit:in_slot(16) and focus_enemy and (focus_enemy.is_local_player or focus_enemy.is_husk_player) then
              if focus_enemy.is_local_player then
                local e_movement_state = att_unit:movement():current_state()

                if e_movement_state:_is_reloading() or e_movement_state:_interacting() or e_movement_state:is_equipping() then
                  pantsdownchk = true
                end
              else
                local e_anim_data = att_unit:anim_data()

                if not (e_anim_data.move or e_anim_data.idle) or e_anim_data.reload then
                  pantsdownchk = true
                end
              end
            end

            if attention_data.is_local_player then
              local iparams = att_unit:movement():current_state()._interact_params

              if iparams and managers.criminals:character_name_by_unit(iparams.object) ~= nil then
                reviving = true
              end
            else
              reviving = att_unit:anim_data() and att_unit:anim_data().revive
            end

            local target_priority = distance
            local target_priority_slot = 0

            if visible and (not pantsdownchk or data.tactics and data.tactics.harass) then
              if distance < 500 then
                target_priority_slot = 2
              elseif distance < 1500 then
                target_priority_slot = 4
              else
                target_priority_slot = 6
              end

              if has_damaged then
                target_priority_slot = target_priority_slot - 2
              elseif has_alerted then
                target_priority_slot = target_priority_slot - 1
              elseif data.tactics and data.tactics.harass and pantsdownchk then
                target_priority_slot = 1
              elseif free_status and assault_reaction then
                target_priority_slot = 5
              end

              if old_enemy then
                target_priority_slot = target_priority_slot - 3
              end

              target_priority_slot = math.clamp(target_priority_slot, 1, 10)
            elseif free_status or pantsdownchk and not (data.tactics and data.tactics.harass) then
              target_priority_slot = 7
            end

            if reaction < AIAttentionObject.REACT_COMBAT then
              target_priority_slot = 10 + target_priority_slot + math.max(0, AIAttentionObject.REACT_COMBAT - reaction)
            end

            if target_priority_slot ~= 0 then
              local best = false

              if not best_target then
                best = true
              elseif target_priority_slot < best_target_priority_slot then
                best = true
              elseif target_priority_slot == best_target_priority_slot and target_priority < best_target_priority then
                best = true
              end

              if best then
                best_target = attention_data
                best_target_reaction = reaction
                best_target_priority_slot = target_priority_slot
                best_target_priority = target_priority
              end
            end
          end
        end
      end

      return best_target, best_target_priority_slot, best_target_reaction
  end

	function CopLogicIdle.find_civilian_to_intimidate(data)
		local best_civ = CopLogicIdle._find_intimidateable_civilians(data)

		return best_civ
	end

	function CopLogicIdle._find_intimidateable_civilians(data)
		local head_pos = data.unit:movement():m_head_pos()
		local look_vec = data.unit:movement():m_rot():y()
		local close_dis = 400
		local intimidateable_civilians = {}
		local best_civ = nil
		local best_civ_wgt = false
		local best_civ_angle = nil
		local highest_wgt = 1
		local my_tracker = data.unit:movement():nav_tracker()
		local chk_vis_func = my_tracker.check_visibility
		local my_unit = data.unit

		for key, unit in pairs(managers.groupai:state():fleeing_civilians()) do
			if chk_vis_func(my_tracker, unit:movement():nav_tracker()) and tweak_data.character[unit:base()._tweak_table].intimidateable and not unit:base().unintimidateable and not unit:anim_data().unintimidateable and not unit:brain():is_tied() and not unit:unit_data().disable_shout then
				local u_head_pos = unit:movement():m_head_pos() + math.UP * 30
				local vec = u_head_pos - head_pos
				local dis = mvector3.normalize(vec)
				local angle = vec:angle(look_vec)

				max_angle = math.max(8, math.lerp(90, 30, dis / 1200))
				max_dis = 1200

				if dis < close_dis or dis < max_dis and angle < max_angle then
					local slotmask = managers.slot:get_mask("AI_visibility")
					local ray = World:raycast("ray", head_pos, u_head_pos, "slot_mask", slotmask, "ray_type", "ai_vision")

					if not ray then
						local inv_wgt = dis * dis * (1 - vec:dot(look_vec))

						table.insert(intimidateable_civilians, {
							unit = unit,
							key = key,
							inv_wgt = inv_wgt
						})

						if not best_civ_wgt or inv_wgt < best_civ_wgt then
							best_civ_wgt = inv_wgt
							best_civ = unit
							best_civ_angle = angle
						end

						if highest_wgt < inv_wgt then
							highest_wgt = inv_wgt
						end
					end
				end
			end
		end

		return best_civ, highest_wgt, intimidateable_civilians
	end

	function CopLogicIdle.intimidate_civilians(data)
		local my_unit = data.unit
		if alive(primary_target) and primary_target:unit_data().disable_shout then
			return false
		end

		if primary_target and (not alive(primary_target) or not managers.groupai:state():fleeing_civilians()[primary_target:key()]) then
			primary_target = nil
		end

		local best_civ, highest_wgt, intimidateable_civilians = CopLogicIdle._find_intimidateable_civilians(data)
		local plural = false

		if #intimidateable_civilians > 1 then
			plural = true
		elseif #intimidateable_civilians <= 0 then
			return false
		end
		
		data.unit:sound():say("cr1", true)

		if not data.unit:movement():chk_action_forbidden("action") and data.unit:base():has_tag("law") and not data.unit:base():has_tag("shield") then
			data.unit:movement():play_redirect("arrest")
		end

		local intimidated_primary_target = false

		for _, civ in ipairs(intimidateable_civilians) do
			local amount = civ.inv_wgt / highest_wgt

			if best_civ == civ.unit then
				amount = 1
			end

			if primary_target == civ.unit then
				intimidated_primary_target = true
				amount = 1
			end

			civ.unit:brain():on_intimidated(amount, my_unit)
		end

		if not intimidated_primary_target and primary_target then
			primary_target:brain():on_intimidated(1, my_unit)
		end

		if not managers.groupai:state():enemy_weapons_hot() then
			local alert = {
				"vo_intimidate",
				data.m_pos,
				800,
				data.SO_access,
				data.unit
			}

			managers.groupai:state():propagate_alert(alert)
		end

		if not primary_target and best_civ and best_civ:unit_data().disable_shout then
			return false
		end

		return primary_target or best_civ
	end
	
	function CopLogicIdle._upd_enemy_detection(data)
		managers.groupai:state():on_unit_detection_updated(data.unit)

		data.t = TimerManager:game():time()
		local my_data = data.internal_data
		local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
		local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects)

		CopLogicBase._set_attention_obj(data, new_attention, new_reaction)

		if new_reaction and AIAttentionObject.REACT_SUSPICIOUS < new_reaction then
			local objective = data.objective
			local wanted_state = nil
			local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, new_attention)

			if allow_trans then
				wanted_state = CopLogicBase._get_logic_state_from_reaction(data)
			end

			if wanted_state and wanted_state ~= data.name then
				if obj_failed then
					data.objective_failed_clbk(data.unit, data.objective)
				end

				if my_data == data.internal_data then
					CopLogicBase._exit(data.unit, wanted_state)
				end
			end
		end
		
		if (not my_data._intimidate_t or my_data._intimidate_t + 2 < data.t) and not data.cool and not my_data._turning_to_intimidate and not my_data.acting and (not new_attention or AIAttentionObject.REACT_SCARED > new_reaction) and managers.groupai:state():chk_assault_active_atm() then
			local can_turn = not data.unit:movement():chk_action_forbidden("turn")
			local civ = CopLogicIdle.find_civilian_to_intimidate(data)

			if civ then
				my_data._intimidate_t = data.t
				new_attention, new_prio_slot, new_reaction = nil

				if can_turn and CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, civ:movement():m_pos()) then
					my_data._turning_to_intimidate = true
					my_data._primary_intimidation_target = civ
				else
					CopLogicIdle.intimidate_civilians(data)
				end
			end
		end
		
		if my_data == data.internal_data then
			CopLogicBase._chk_call_the_police(data)

			if my_data ~= data.internal_data then
				return delay
			end
		end

		return delay
	end
	
end
