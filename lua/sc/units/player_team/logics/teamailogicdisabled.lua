function TeamAILogicDisabled.enter(data, new_logic_name, enter_params)
	TeamAILogicBase.enter(data, new_logic_name, enter_params)
	data.unit:brain():cancel_all_pathing_searches()

	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.enemy_detect_slotmask = managers.slot:get_mask("enemies")

	if old_internal_data then
		CopLogicAttack._set_best_cover(data, my_data, old_internal_data.best_cover)
		CopLogicAttack._set_nearest_cover(my_data, old_internal_data.nearest_cover)

		my_data.attention_unit = old_internal_data.attention_unit
	end

	local key_str = tostring(data.key)
	my_data.detection_task_key = "TeamAILogicDisabled._upd_enemy_detection" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TeamAILogicDisabled._upd_enemy_detection, data, data.t)

	my_data.stay_cool = nil

	data.unit:brain():set_update_enabled_state(false)

	if not data.unit:character_damage():bleed_out() then
		my_data.invulnerable = true

		data.unit:character_damage():set_invulnerable(true)
	end

	if data.objective then
		data.objective_failed_clbk(data.unit, data.objective, true)
		data.unit:brain():set_objective(nil)
	end
end

function TeamAILogicDisabled._upd_enemy_detection(data)
	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(data, AIAttentionObject.REACT_SURPRISED, nil)
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data.detected_attention_objects, nil, data.cool)

	TeamAILogicBase._set_attention_obj(data, new_attention, new_reaction)
		
	if not my_data.retry_so_t or my_data.retry_so_t < data.t then --PRIORITIZE PLAYERS FIRST DICKHEADS
	
		local cannot_try_SO = nil
		
		for u_key, u_data in pairs(managers.groupai:state():all_player_criminals()) do
			if u_data.status and u_data.status ~= "electrified" then
				cannot_try_SO = true
				break
			end
		end
		
		if cannot_try_SO then
			--my_data.retry_so_t = data.t + 0.5
			if my_data.SO_id then
				TeamAILogicDisabled._unregister_revive_SO(my_data, true)
			end
		else
			if not my_data.SO_id and data.unit:character_damage():need_revive() then
				TeamAILogicDisabled._register_revive_SO(data, my_data, "revive")
			end
		end
	end
	
	TeamAILogicDisabled._upd_aim(data, my_data)

	if data.unit:character_damage():bleed_out() and not data.unit:character_damage():fatal() or data.unit:character_damage():arrested() then
		TeamAILogicIdle._upd_sneak_spotting(data, my_data)
	elseif data.unit:movement():tased() then
		if not data.unit:brain()._tase_mark_t or data.unit:brain()._tase_mark_t + 2 < data.t then
			for key, attention_info in pairs(data.detected_attention_objects) do
				if attention_info.identified and attention_info.is_person and attention_info.unit:contour() then
					if attention_info.unit:character_damage().dead and not attention_info.unit:character_damage():dead() then
						if attention_info.unit:brain() and attention_info.unit:brain()._logic_data and attention_info.unit:brain()._logic_data.internal_data then
							local tasing = attention_info.unit:brain()._logic_data.internal_data.tasing

							if tasing and tasing.target_u_key == data.key then
								data.unit:brain()._tase_mark_t = data.t
								data.unit:sound():say("s07x_sin", true)
								attention_info.unit:contour():add("mark_enemy", true)

								local skip_alert = managers.groupai:state():whisper_mode()

								if not skip_alert then
									local alert_rad = 500
									local alert = {
										"vo_cbt",
										data.unit:movement():m_head_pos(),
										alert_rad,
										data.SO_access,
										data.unit
									}

									managers.groupai:state():propagate_alert(alert)
								end

								break
							end
						end
					end
				end
			end
		end
	end

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TeamAILogicDisabled._upd_enemy_detection, data, data.t + delay)
end

function TeamAILogicDisabled._unregister_revive_SO(my_data, dont_remove_DG)
	if not dont_remove_DG then
		if my_data.deathguard_SO_id then
			PlayerBleedOut._unregister_deathguard_SO(my_data.deathguard_SO_id)

			my_data.deathguard_SO_id = nil
		end
	end

	if my_data.rescuer then
		local rescuer = my_data.rescuer
		my_data.rescuer = nil

		if rescuer:brain():objective() then
			managers.groupai:state():on_criminal_objective_failed(rescuer, rescuer:brain():objective())
		end
	elseif my_data.SO_id then
		managers.groupai:state():remove_special_objective(my_data.SO_id)

		my_data.SO_id = nil
	end
end

function TeamAILogicDisabled._register_revive_SO(data, my_data, rescue_type)
	local followup_objective = {
		scan = true,
		type = "act",
		action = {
			variant = "crouch",
			body_part = 1,
			type = "act",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				aim = -1,
				walk = -1
			}
		}
	}
	local objective = {
		type = "revive",
		called = true,
		scan = true,
		destroy_clbk_key = false,
		follow_unit = data.unit,
		nav_seg = data.unit:movement():nav_tracker():nav_segment(),
		fail_clbk = callback(TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_failed", data),
		action = {
			align_sync = true,
			type = "act",
			body_part = 1,
			variant = rescue_type,
			blocks = {
				light_hurt = -1,
				hurt = -1,
				action = -1,
				heavy_hurt = -1,
				aim = -1,
				walk = -1
			}
		},
		action_duration = tweak_data.interaction[data.name == "surrender" and "free" or "revive"].timer,
		followup_objective = followup_objective
	}
	local so_descriptor = {
		interval = 2,
		search_dis_sq = 9000000, --10 METERS. 10 FUCKING METERS. PLEASE.
		AI_group = "friendlies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective,
		search_pos = mvector3.copy(data.m_pos),
		admin_clbk = callback(TeamAILogicDisabled, TeamAILogicDisabled, "on_revive_SO_administered", data)
	}
	local so_id = "TeamAIrevive" .. tostring(data.key)
	my_data.SO_id = so_id

	managers.groupai:state():add_special_objective(so_id, so_descriptor)

	my_data.deathguard_SO_id = PlayerBleedOut._register_deathguard_SO(data.unit)
end