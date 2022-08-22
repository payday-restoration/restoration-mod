--[[

ZombieLogicAttack = ZombieLogicAttack or class(TankCopLogicAttack)

CopBrain._logic_variants.zombie_light = clone(CopBrain._logic_variants.security)
CopBrain._logic_variants.zombie_light.attack = ZombieLogicAttack

function ZombieLogicAttack.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)

	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat

	if old_internal_data then
		my_data.turning = old_internal_data.turning
		my_data.firing = old_internal_data.firing
		my_data.shooting = old_internal_data.shooting
		my_data.attention_unit = old_internal_data.attention_unit
	end

	local key_str = tostring(data.key)
	my_data.detection_task_key = "ZombieLogicAttack._upd_enemy_detection" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, ZombieLogicAttack._upd_enemy_detection, data)
	CopLogicIdle._chk_has_old_action(data, my_data)

	my_data.attitude = "engage"
	my_data.weapon_range = { close = 0, optimal = 50, far = 100 }

	data.unit:brain():set_update_enabled_state(false)

	my_data.update_queue_id = "ZombieLogicAttack.queued_update" .. key_str

	ZombieLogicAttack.queue_update(data, my_data)
	data.unit:movement():set_cool(false)

	if my_data ~= data.internal_data then
		return
	end

	data.unit:brain():set_attention_settings({ cbt = true })
end

function ZombieLogicAttack._upd_aim(data, my_data)
	local focus_enemy = data.attention_obj
	if focus_enemy and AIAttentionObject.REACT_AIM <= focus_enemy.reaction and focus_enemy.dis < 1000 then
		if my_data.attention_unit ~= focus_enemy.u_key then
			CopLogicBase._set_attention(data, focus_enemy)
			my_data.attention_unit = focus_enemy.u_key
		end

		if not my_data.shooting and not data.unit:movement():chk_action_forbidden("action") then
			my_data.shooting = data.unit:brain():action_request({
				body_part = 3,
				type = "shoot"
			})
		end

		CopLogicAttack.aim_allow_fire(focus_enemy.verified, true, data, my_data)
	else
		if my_data.shooting then
			my_data.shooting = not data.unit:brain():action_request({
				body_part = 3,
				type = "idle"
			})
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)
			my_data.attention_unit = nil
		end

		CopLogicAttack.aim_allow_fire(false, false, data, my_data)
	end
end

function ZombieLogicAttack.is_available_for_assignment(data, new_objective, ...)
	local interrupt_dis = new_objective and new_objective.interrupt_dis
	if interrupt_dis and interrupt_dis > 0 then
		new_objective.interrupt_dis = new_objective.interrupt_dis * 10
	end
	local available = ZombieLogicAttack.super.is_available_for_assignment(data, new_objective, ...)
	if interrupt_dis then
		new_objective.interrupt_dis = interrupt_dis
	end
	return available
end

function ZombieLogicAttack.queued_update(data)
	local my_data = data.internal_data
	my_data.update_queued = false
	data.t = TimerManager:game():time()

	ZombieLogicAttack.update(data)

	if my_data == data.internal_data then
		ZombieLogicAttack.queue_update(data, data.internal_data)
	end
end

function ZombieLogicAttack.queue_update(data, my_data)
	my_data.update_queued = true
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, ZombieLogicAttack.queued_update, data, data.t + 1, data.important)
end

function ZombieLogicAttack.update(data)
	local unit = data.unit
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)
		return
	end

	if CopLogicIdle._chk_relocate(data) then
		return
	end

	local focus_enemy = data.attention_obj
	if not focus_enemy or focus_enemy.reaction <= AIAttentionObject.REACT_AIM then
		ZombieLogicAttack._upd_enemy_detection(data, true)
		if my_data ~= data.internal_data or not focus_enemy or focus_enemy.reaction <= AIAttentionObject.REACT_AIM then
			return
		end
	end

	ZombieLogicAttack._process_pathing_results(data, my_data)

	if unit:movement():chk_action_forbidden("walk") then
		return
	end

	if unit:anim_data().crouch then
		ZombieLogicAttack._chk_request_action_stand(data)
	end

	if AIAttentionObject.REACT_COMBAT <= focus_enemy.reaction then
		if my_data.walking_to_chase_pos then
			local path = my_data.walking_to_chase_pos._nav_path
			if path and mvector3.distance_sq(path[#path], focus_enemy.m_pos) > 1000000 then
				ZombieLogicAttack._cancel_chase_attempt(data, my_data)
			end
		end

		if my_data.walking_to_chase_pos or my_data.pathing_to_chase_pos then
			return
		elseif not my_data.chase_path then
			if not my_data.chase_pos and focus_enemy.nav_tracker then
				my_data.chase_pos = ZombieLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker, 100)
			end

			if my_data.chase_pos then
				local from_pos = unit:movement():nav_tracker():field_position()
				local to_pos = my_data.chase_pos

				my_data.chase_pos = nil

				if math.abs(from_pos.z - to_pos.z) < 100 and not managers.navigation:raycast({allow_entry = false, pos_from = from_pos, pos_to = to_pos}) then
					my_data.chase_path = {
						mvector3.copy(from_pos),
						to_pos
					}
				else
					my_data.chase_path_search_id = tostring(unit:key()) .. "chase"
					my_data.pathing_to_chase_pos = true
					data.brain:add_pos_rsrv("path", {
						radius = 30,
						position = mvector3.copy(to_pos)
					})
					unit:brain():search_for_path(my_data.chase_path_search_id, to_pos)
				end
			end
		end

		if my_data.chase_path then
			ZombieLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, "run")
		end
	else
		ZombieLogicAttack._cancel_chase_attempt(data, my_data)
	end
end

-- Make zombie logic react more aggressively
local _chk_reaction_to_attention_object_original = CopLogicIdle._chk_reaction_to_attention_object
function CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, ...)
	if data.unit:brain()._logics.attack ~= ZombieLogicAttack or data.unit:movement():cool() then
		return _chk_reaction_to_attention_object_original(data, attention_data, ...)
	end

	local settings = attention_data.settings
	return (settings.relation == "foe" or settings.reaction > AIAttentionObject.REACT_AIM) and AIAttentionObject.REACT_COMBAT or AIAttentionObject.REACT_IDLE
end

-- Increase objective interruption distance for zombie logic so they switch to attack logic earlier
Hooks:PostHook(CopLogicBase, "on_new_objective", "on_new_objective_zombies", function (data)
	if not data.objective or data.unit:movement():cool() then
		return
	end

	if data.brain._logics.attack ~= ZombieLogicAttack and not data.unit:movement()._actions.shoot ~= ZombieActionShoot then
		return
	end

	local objective = data.objective
	objective.pose = "stand"
	objective.haste = "run"
	if objective.interrupt_dis and objective.interrupt_dis > 0 then
		objective.interrupt_dis = objective.interrupt_dis * 10
	end
end)

]]--