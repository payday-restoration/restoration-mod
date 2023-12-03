local REACT_IDLE = AIAttentionObject.REACT_IDLE
local REACT_AIM = AIAttentionObject.REACT_AIM
local REACT_ARREST = AIAttentionObject.REACT_ARREST
local REACT_COMBAT = AIAttentionObject.REACT_COMBAT

-- Make cops react more aggressively when appropriate (less stare, more shoot)
local _chk_reaction_to_attention_object_original = CopLogicIdle._chk_reaction_to_attention_object
function CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, ...)
	if data.cool then
		return _chk_reaction_to_attention_object_original(data, attention_data, ...)
	end

	local attention_reaction = attention_data.settings.reaction
	if attention_data.settings.relation ~= "foe" and attention_reaction <= REACT_AIM then
		return REACT_IDLE
	end

	local record = attention_data.criminal_record
	if not record or not attention_data.is_person then
		return attention_reaction
	end

	if record.status == "dead" or record.being_arrested then
		return math.min(attention_reaction, REACT_AIM)
	end

	if record.status == "disabled" then
		if record.assault_t and record.assault_t - record.disabled_t > 0.6 or data.tactics and data.tactics.murder then
			return REACT_COMBAT
		end
		return math.min(attention_reaction, REACT_AIM)
	end

	local can_arrest = not record.status and record.arrest_timeout < data.t and CopLogicBase._can_arrest(data)
	if not can_arrest or record.assault_t and attention_data.unit:base():arrest_settings().aggression_timeout > data.t - record.assault_t then
		return attention_data.verified and REACT_COMBAT or attention_reaction
	end

	for u_key, other_crim_rec in pairs(managers.groupai:state():all_criminals()) do
		local other_crim_attention_info = data.detected_attention_objects[u_key]
		if other_crim_attention_info and (other_crim_attention_info.is_deployable or other_crim_attention_info.verified and other_crim_rec.assault_t and data.t - other_crim_rec.assault_t < other_crim_rec.unit:base():arrest_settings().aggression_timeout) then
			return attention_data.verified and REACT_COMBAT or attention_reaction
		end
	end

	if attention_data.dis > 2000 then
		return math.min(attention_reaction, REACT_AIM)
	end

	return math.min(attention_reaction, REACT_ARREST)
end

-- Fix defend_area objectives being force relocated to areas with players in them
-- Fix lost follow objectives not refreshing for criminals in idle logic and Jokers in attack logic
-- Use the old defend_area behavior for the hunt objective for which it makes much more sense
function CopLogicIdle._chk_relocate(data)
	local my_data = data.internal_data
	local objective = data.objective
	local objective_type = objective and objective.type

	if objective_type == "follow" then
		local follow_unit = objective.follow_unit
		local unit_pos = follow_unit:movement().get_walk_to_pos and follow_unit:movement():get_walk_to_pos() or follow_unit:movement():m_pos()
		local dis_sq = mvector3.distance_sq(data.m_pos, unit_pos)

		if data.is_tied and objective.lose_track_dis and dis_sq > objective.lose_track_dis ^ 2 then
			data.brain:set_objective(nil)
			return true
		end

		local relocated_dis_sq = data.is_tied and my_data.advancing and objective.distance and (objective.distance * 0.5) ^ 2 or 100
		if objective.relocated_to and mvector3.distance_sq(objective.relocated_to, unit_pos) < relocated_dis_sq then
			return
		elseif data.is_converted then
			if not TeamAILogicIdle._check_should_relocate(data, data.internal_data, objective) then
				return
			end
		elseif math.abs(unit_pos.z - data.m_pos.z) > 200 or objective.distance and dis_sq > objective.distance ^ 2 then
		elseif managers.navigation:raycast({ pos_from = data.m_pos, pos_to = unit_pos }) then
		elseif objective.shield_cover_unit and data.attention_obj and data.attention_obj.verified and data.attention_obj.reaction >= AIAttentionObject.REACT_AIM then
			if mvector3.distance_sq(objective.relocated_to or data.m_pos, data.attention_obj.m_pos) > mvector3.distance_sq(unit_pos, data.attention_obj.m_pos) then
				return
			end
		else
			return
		end

		objective.in_place = nil
		objective.path_data = nil
		objective.nav_seg = follow_unit:movement():nav_tracker():nav_segment()
		objective.relocated_to = mvector3.copy(unit_pos)

		data.logic._exit(data.unit, "travel")

		return true
	elseif objective_type == "hunt" then
		local objective_area = objective.area or managers.groupai:state():get_area_from_nav_seg_id(objective.nav_seg or data.unit:movement():nav_tracker():nav_segment())
		if not objective_area or next(objective_area.criminal.units) then
			return
		end

		local found_areas = {
			[objective_area] = true
		}
		local areas_to_search = {
			objective_area
		}
		local target_area

		while next(areas_to_search) do
			local current_area = table.remove(areas_to_search, 1)

			if next(current_area.criminal.units) then
				target_area = current_area
				break
			end

			for _, n_area in pairs(current_area.neighbours) do
				if not found_areas[n_area] then
					found_areas[n_area] = true
					table.insert(areas_to_search, n_area)
				end
			end
		end

		if not target_area then
			return
		end

		objective.in_place = nil
		objective.path_data = nil
		objective.area = target_area
		objective.nav_seg = target_area.pos_nav_seg

		data.logic._exit(data.unit, "travel")

		return true
	elseif objective_type == "free" or not objective then
		if data.cool or not data.is_converted and data.team.id ~= "criminal1" or data.path_fail_t and data.t - data.path_fail_t < 5 then
			return
		end

		managers.groupai:state():on_criminal_jobless(data.unit)

		return my_data ~= data.internal_data
	end
end

--Done just to add a safety check that (hopefully) fixes an upgrade_value crash
function CopLogicIdle.on_intimidated(data, amount, aggressor_unit)
	local surrender = false
	local my_data = data.internal_data
	data.t = TimerManager:game():time()

	if not aggressor_unit:movement():team().foes[data.unit:movement():team().id] then
		return
	end

	if managers.groupai:state():has_room_for_police_hostage() then
		local i_am_special = managers.groupai:state():is_enemy_special(data.unit)
		local required_skill = i_am_special and "intimidate_specials" or "intimidate_enemies"
		local aggressor_can_intimidate = nil
		local aggressor_intimidation_mul = 1

		--Here!
		if aggressor_unit:base().is_local_player then
			aggressor_can_intimidate = managers.player:has_category_upgrade("player", required_skill)
			aggressor_intimidation_mul = aggressor_intimidation_mul * managers.player:upgrade_value("player", "empowered_intimidation_mul", 1) * managers.player:upgrade_value("player", "intimidation_multiplier", 1)
		elseif aggressor_unit:base()._is_team_ai then
			aggressor_can_intimidate = true
		elseif aggressor_unit:base().upgrade_value then 
			aggressor_can_intimidate = aggressor_unit:base():upgrade_value("player", required_skill)
			aggressor_intimidation_mul = aggressor_intimidation_mul * (aggressor_unit:base():upgrade_value("player", "empowered_intimidation_mul") or 1) * (aggressor_unit:base():upgrade_value("player", "intimidation_multiplier") or 1)
		end

		if aggressor_can_intimidate then
			local hold_chance = CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit)

			if hold_chance then
				hold_chance = hold_chance^aggressor_intimidation_mul

				if hold_chance >= 1 then
					-- Nothing
				else
					local rand_nr = math.random()

					if hold_chance < rand_nr then
						surrender = true
					end
				end
			end
		end

		if surrender then
			CopLogicIdle._surrender(data, amount, aggressor_unit)
		else
			data.unit:brain():on_surrender_chance()
		end
	end

	CopLogicBase.identify_attention_obj_instant(data, aggressor_unit:key())
	managers.groupai:state():criminal_spotted(aggressor_unit)

	return surrender
end

-- Improve and simplify attention handling
-- Moved certain checks into their own functions for easier adjustments and improved target priority calculation
-- Enemies no longer put low priority on reviving players and will prefer keeping their current target if there's a priority tie
function CopLogicIdle._get_priority_attention(data, attention_objects, reaction_func)
	local best_target_distance
	local best_target, best_target_priority_slot, best_target_reaction = CopLogicIdle._get_forced_attention(data)
	if best_target then
		return best_target, best_target_priority_slot, best_target_reaction
	end

	reaction_func = reaction_func or CopLogicIdle._chk_reaction_to_attention_object

	local weapon_range = data.internal_data.weapon_range or { optimal = 1500, far = 3000, close = 750 }
	local far_range = weapon_range.far
	local optimal_range = weapon_range.optimal
	local close_range = weapon_range.close
	local murder = data.tactics and data.tactics.murder

	for u_key, attention_data in pairs(attention_objects) do
		local att_unit = attention_data.unit
		local crim_record = attention_data.criminal_record

		if not attention_data.identified then
		elseif attention_data.pause_expire_t then
			if attention_data.pause_expire_t < data.t then
				if not attention_data.settings.attract_chance or math.random() < attention_data.settings.attract_chance then
					attention_data.pause_expire_t = nil
				else
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

			if reaction and reaction > AIAttentionObject.REACT_IDLE and (not best_target_reaction or reaction >= best_target_reaction) then
				attention_data.aimed_at = CopLogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)

				local status = crim_record and crim_record.status
				local weight_mul = CopLogicIdle._get_attention_weight(attention_data, att_unit, distance)
				local alert_dt = attention_data.alert_t and (data.t - attention_data.alert_t) * weight_mul or 10000
				local dmg_dt = attention_data.dmg_t and (data.t - attention_data.dmg_t) * weight_mul or 10000
				distance = distance * weight_mul

				local target_priority_slot
				if attention_data.verified then
					target_priority_slot = distance < close_range and 2 or distance < optimal_range and 4 or distance < far_range and 6 or 8

					if dmg_dt < 4 then
						target_priority_slot = target_priority_slot - 2
					elseif alert_dt < 3 then
						target_priority_slot = target_priority_slot - 1
					end

					-- Prefer keeping current target (this was also in vanilla code but the priority slot was clamped so in close range it was mostly ignored)
					if data.attention_obj and data.attention_obj.u_key == u_key and data.t - attention_data.acquire_t < 4 then
						target_priority_slot = target_priority_slot - 1
					end

					-- Focus on kingpin injector user
					if weight_mul < 0.01 then
						target_priority_slot = target_priority_slot - 1
					end

					-- If we have murder tactic and criminal is downed or tased, focus on them
					if murder and reaction ~= AIAttentionObject.REACT_SPECIAL_ATTACK and (status == "electrified" or status == "disabled") then
						target_priority_slot = target_priority_slot - 1
					end
				elseif not status then
					target_priority_slot = 9
				end

				if target_priority_slot then
					if reaction < AIAttentionObject.REACT_COMBAT then
						target_priority_slot = 9 + math.max(0, AIAttentionObject.REACT_COMBAT - reaction)
					end

					if not best_target or target_priority_slot < best_target_priority_slot or target_priority_slot == best_target_priority_slot and distance < best_target_distance then
						best_target = attention_data
						best_target_reaction = reaction
						best_target_priority_slot = target_priority_slot
						best_target_distance = distance
					end
				end
			end
		end
	end

	return best_target, best_target_priority_slot, best_target_reaction
end

-- Helper functions to reuse in _get_priority_attention
function CopLogicIdle._get_forced_attention(data)
	local forced_attention_data = managers.groupai:state():force_attention_data(data.unit)
	if not forced_attention_data then
		return
	end

	if data.attention_obj and data.attention_obj.unit == forced_attention_data.unit then
		return data.attention_obj, 1, AIAttentionObject.REACT_SHOOT
	end

	local forced_attention_object = managers.groupai:state():get_AI_attention_object_by_unit(forced_attention_data.unit)
	if not forced_attention_object then
		return
	end

	for u_key, attention_info in pairs(forced_attention_object) do
		if forced_attention_data.ignore_vis_blockers then
			local vis_ray = World:raycast("ray", data.unit:movement():m_head_pos(), attention_info.handler:get_detection_m_pos(), "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

			if not vis_ray or vis_ray.unit:key() == u_key or not vis_ray.unit:visible() then
				local best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
				best_target.verified = true
				return best_target, 1, AIAttentionObject.REACT_SHOOT
			end
		else
			local best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
			return best_target, 1, AIAttentionObject.REACT_SHOOT
		end
	end
end

function CopLogicIdle._get_attention_weight(attention_data, att_unit, distance)
	local weight_mul = attention_data.settings.weight_mul or 1
	if attention_data.is_local_player then
		local current_state = att_unit:movement():current_state()

		if not current_state._moving and current_state:ducking() then
			weight_mul = weight_mul * managers.player:upgrade_value("player", "stand_still_crouch_camouflage_bonus", 1)
		end

		if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") and managers.player:upgrade_value("player", "chico_preferred_target", false) then
			weight_mul = weight_mul * 1000
		end

		if _G.IS_VR and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
			weight_mul = weight_mul * (math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1)
		end
	elseif attention_data.is_husk_player then
		local base = att_unit:base()
		local movement = att_unit:movement()

		if not movement._move_data and movement._pose_code == 2 then
			weight_mul = weight_mul * (base:upgrade_value("player", "stand_still_crouch_camouflage_bonus") or 1)
		end

		if base:has_activate_temporary_upgrade("temporary", "chico_injector") and base:upgrade_value("player", "chico_preferred_target") then
			weight_mul = weight_mul * 1000
		end

		if movement:is_vr() and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
			weight_mul = weight_mul * (math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1)
		end
	end
	return 1 / weight_mul
end

-- Show hint to player when surrender is impossible
local on_intimidated_original = CopLogicIdle.on_intimidated
function CopLogicIdle.on_intimidated(data, amount, aggressor_unit, ...)
	local surrender = on_intimidated_original(data, amount, aggressor_unit, ...)
	if surrender or data.char_tweak.priority_shout or not data.team.foes.criminal1 or data.char_tweak.surrender == tweak_data.character.presets.surrender.special then
		data._skip_surrender_hints = nil
		return surrender
	end

	local surrender_window_expired = data.surrender_window and data.surrender_window.window_expire_t < data.t
	local too_many_hostages = not managers.groupai:state():has_room_for_police_hostage()
	if not data.char_tweak.surrender or surrender_window_expired or too_many_hostages then
		local peer = managers.network:session():peer_by_unit(aggressor_unit)
		if not peer then
			return
		end

		if not data._skip_surrender_hints then
			data._skip_surrender_hints = surrender_window_expired and 0 or 1
		end

		if data._skip_surrender_hints <= 0 then
			if peer:id() == managers.network:session():local_peer():id() then
				managers.hint:show_hint("convert_enemy_failed")
			else
				managers.network:session():send_to_peer(peer, "sync_show_hint", "convert_enemy_failed")
			end
			data._skip_surrender_hints = 3
		else
			data._skip_surrender_hints = data._skip_surrender_hints - 1
		end
	end
end