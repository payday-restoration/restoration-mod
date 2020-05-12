local mvec3_dot = mvector3.dot
local mvec3_dist_sq = mvector3.distance_sq
local mvec3_dist = mvector3.distance
local mvec3_norm = mvector3.normalize
local math_max = math.max
local math_min = math.min
local math_lerp = math.lerp
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()

local log_interval = 3 --How often the update function should ping.
local next_log = 0

function log_ai(data, ht)
	local timestamp = tostring(math.floor(ht / 60)) .. ":" .. tostring(math.floor(math.fmod(ht, 60))) .. " "
	local objective = data.objective

	if objective and objective.follow_unit and objective.follow_unit.base and objective.follow_unit:base().nick_name then
		log(timestamp .. data.unit:base():nick_name() .. " Objective- " .. objective.type .. " " .. objective.follow_unit:base():nick_name())
	elseif objective then
		log(timestamp .. data.unit:base():nick_name() .. " Objective- " .. objective.type)
	else
		log(timestamp .. data.unit:base():nick_name() .. " Objective- None")
	end

	next_log = ht + log_interval
end

--Here purely for logging purposes, don't want to create a whole posthook for this.
--Delete this later.
function TeamAILogicIdle.update(data)
	local my_data = data.internal_data
	local ht = math.abs(managers.game_play_central:get_heist_timer())

	CopLogicIdle._upd_pathing(data, my_data)
	CopLogicIdle._upd_scan(data, my_data)

	local objective = data.objective

	if objective then
		if not my_data.acting then
			if objective.type == "follow" then
				if TeamAILogicIdle._check_should_relocate(data, my_data, objective) and not data.unit:movement():chk_action_forbidden("walk") then
					objective.in_place = nil

					TeamAILogicBase._exit(data.unit, "travel")
				end
			elseif objective.type == "revive" then
				objective.in_place = nil

				TeamAILogicBase._exit(data.unit, "travel")
			end
		end
	elseif not data.path_fail_t or data.t - data.path_fail_t > 6 then
		managers.groupai:state():on_criminal_jobless(data.unit)
	end

	if ht > next_log then
		log_ai(data, ht)
	end
end


function TeamAILogicIdle.enter(data, new_logic_name, enter_params)
	TeamAILogicBase.enter(data, new_logic_name, enter_params)
	local ht = math.abs(managers.game_play_central:get_heist_timer())
	log_ai(data, ht)
	local my_data = {
		unit = data.unit,
		detection = data.char_tweak.detection.idle,
		enemy_detect_slotmask = managers.slot:get_mask("enemies")
	}
	local old_internal_data = data.internal_data

	if old_internal_data then
		if old_internal_data.best_cover then
			my_data.best_cover = old_internal_data.best_cover

			managers.navigation:reserve_cover(my_data.best_cover[1], data.pos_rsrv_id)
		end

		if old_internal_data.nearest_cover then
			my_data.nearest_cover = old_internal_data.nearest_cover

			managers.navigation:reserve_cover(my_data.nearest_cover[1], data.pos_rsrv_id)
		end

		my_data.attention_unit = old_internal_data.attention_unit
	end

	data.internal_data = my_data
	local key_str = tostring(data.key)
	my_data.detection_task_key = "TeamAILogicIdle._upd_enemy_detection" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TeamAILogicIdle._upd_enemy_detection, data, data.t)

	if my_data.nearest_cover or my_data.best_cover then
		my_data.cover_update_task_key = "CopLogicIdle._update_cover" .. key_str

		CopLogicBase.add_delayed_clbk(my_data, my_data.cover_update_task_key, callback(CopLogicTravel, CopLogicTravel, "_update_cover", data), data.t + 1)
	end

	my_data.stare_path_search_id = "stare" .. key_str
	my_data.relocate_chk_t = 0

	CopLogicBase._reset_attention(data)

	if data.unit:movement():stance_name() == "cbt" then
		data.unit:movement():set_stance("hos")
	end

	data.unit:movement():set_allow_fire(false)

	local objective = data.objective
	local entry_action = enter_params and enter_params.action

	if objective then
		if objective.type == "revive" then
			if objective.action_start_clbk then
				objective.action_start_clbk(data.unit)
			end

			local success = nil
			local revive_unit = objective.follow_unit

			if revive_unit:interaction() then
				if revive_unit:interaction():active() and data.unit:brain():action_request(objective.action) then
					revive_unit:interaction():interact_start(data.unit)

					success = true
				end
			elseif revive_unit:character_damage():arrested() then
				if data.unit:brain():action_request(objective.action) then
					revive_unit:character_damage():pause_arrested_timer()

					success = true
				end
			elseif revive_unit:character_damage():need_revive() and data.unit:brain():action_request(objective.action) then
				revive_unit:character_damage():pause_downed_timer()

				success = true
			end

			if success then
				my_data.performing_act_objective = objective
				my_data.reviving = revive_unit
				my_data.acting = true
				my_data.revive_complete_clbk_id = "TeamAILogicIdle_revive" .. tostring(data.key)
				local revive_t = TimerManager:game():time() + (objective.action_duration or 0)

				CopLogicBase.add_delayed_clbk(my_data, my_data.revive_complete_clbk_id, callback(TeamAILogicIdle, TeamAILogicIdle, "clbk_revive_complete", data), revive_t)

				local voiceline = "s09b" --usual bot revive line (should be used for players when they have 3/4 downs left)

				if revive_unit:base().is_local_player then
					if not revive_unit:character_damage():arrested() then
						if revive_unit:movement():current_state_name() == "incapacitated" then --tased/cloaked
							voiceline = "s08x_sin" --"let me help you up"
						else
							if revive_unit:character_damage():get_revives() == 2 then --2 downs left
								voiceline = "s09a" --"you're really fucked up"
							elseif revive_unit:character_damage():get_revives() == 1 then --1 down left
								voiceline = "s09c" --usual bot revive line + last down warning
							end
						end

						data.unit:sound():say(voiceline, true)
					end
				elseif revive_unit:base().is_husk_player then
					if not revive_unit:character_damage():arrested() then --can't check for lives in vanilla, add code for this if you want to
						if revive_unit:movement():current_state_name() == "incapacitated" then
							voiceline = "s08x_sin" --"let me help you up"
						end

						data.unit:sound():say(voiceline, true)
					end
				else
					if not revive_unit:character_damage():arrested() then
						data.unit:sound():say(voiceline, true) --doesn't really matter for bots, but some variation could be added if desired
					end
				end
			else
				data.unit:brain():set_objective()

				return
			end
		elseif objective.type == "throw_bag" then
			data.unit:movement():throw_bag(objective.unit)

			data._ignore_first_travel_order = true

			data.unit:brain():set_objective()
		else
			if objective.action_duration then
				my_data.action_timeout_clbk_id = "TeamAILogicIdle_action_timeout" .. key_str
				local action_timeout_t = data.t + objective.action_duration

				CopLogicBase.add_delayed_clbk(my_data, my_data.action_timeout_clbk_id, callback(CopLogicIdle, CopLogicIdle, "clbk_action_timeout", data), action_timeout_t)
			end

			if objective.type == "act" then
				if data.unit:brain():action_request(objective.action) then
					my_data.acting = true
				end

				my_data.performing_act_objective = objective

				if objective.action_start_clbk then
					objective.action_start_clbk(data.unit)
				end
			end
		end

		if objective.scan then
			my_data.scan = true

			if not my_data.acting then
				my_data.wall_stare_task_key = "CopLogicIdle._chk_stare_into_wall" .. tostring(data.key)

				CopLogicBase.queue_task(my_data, my_data.wall_stare_task_key, CopLogicIdle._chk_stare_into_wall_1, data, data.t)
			end
		end
	end
end

function TeamAILogicIdle.on_long_dis_interacted(data, other_unit, secondary)
	if data.objective and data.objective.type == "revive" then
		return
	end

	local objective_type, objective_action, interrupt = nil

	if other_unit:base().is_local_player then
		if not secondary then
			if other_unit:character_damage():need_revive() then
				objective_type = "revive"
				objective_action = "revive"
			elseif other_unit:character_damage():arrested() then
				objective_type = "revive"
				objective_action = "untie"
			else
				objective_type = "follow"
			end
		else
			objective_type = "stop"
		end
	elseif not secondary then
		if other_unit:movement():need_revive() then
			objective_type = "revive"

			if other_unit:movement():current_state_name() == "arrested" then
				objective_action = "untie"
			else
				objective_action = "revive"
			end
		else
			objective_type = "follow"
		end
	else
		objective_type = "stop"
	end

	local objective = nil
	local should_stay = false

	if objective_type == "follow" then
		if data.unit:movement():carrying_bag() and not data.unit:movement()._should_stay then
			local throw_distance = tweak_data.ai_carry.throw_distance * data.unit:movement():carry_tweak().throw_distance_multiplier
			local dist = data.unit:position() - other_unit:position()
			local throw_bag = mvector3.dot(dist, dist) < throw_distance * throw_distance

			if throw_bag then
				if other_unit == managers.player:player_unit() then
					if other_unit:movement():current_state_name() == "carry" then
						throw_bag = false
					end
				elseif other_unit:movement():carry_id() ~= nil then
					throw_bag = false
				end
			end

			if throw_bag then
				objective = {
					type = "throw_bag",
					unit = other_unit
				}
			end
		end

		if not objective then
			objective = {
				scan = true,
				destroy_clbk_key = false,
				called = true,
				type = objective_type,
				follow_unit = other_unit
			}

			data.unit:sound():say("r01x_sin", true)
		end
	elseif objective_type == "stop" then
		objective = {
			scan = true,
			destroy_clbk_key = false,
			type = "follow",
			called = true,
			follow_unit = other_unit
		}
		should_stay = true
	else
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
		objective = {
			type = "revive",
			called = true,
			scan = true,
			destroy_clbk_key = false,
			follow_unit = other_unit,
			nav_seg = other_unit:movement():nav_tracker():nav_segment(),
			action = {
				align_sync = true,
				type = "act",
				body_part = 1,
				variant = objective_action,
				blocks = {
					light_hurt = -1,
					hurt = -1,
					action = -1,
					heavy_hurt = -1,
					aim = -1,
					walk = -1
				}
			},
			action_duration = tweak_data.interaction[objective_action == "untie" and "free" or objective_action].timer,
			followup_objective = followup_objective
		}

		if objective_type == "revive" and not objective_action == "untie" then
			data.unit:sound():say("r02a_sin", true)
		end
	end

	if data.unit:movement():carrying_bag() and objective.type == "revive" then --carrying a bag and being called to revive a player
		if not data.unit:movement():carry_tweak().can_run then --slowed down by the bag
			local range_sq = 810000
			local my_pos = data.unit:position()
			local other_unit_pos = other_unit:position()
			local dist = mvec3_dist_sq(my_pos, other_unit_pos)
			local inspire_available = managers.player:is_custom_cooldown_not_active("team", "crew_inspire")

			if dist < range_sq then --within inspire range, taken from teamailogictravel as it's calculated with square distance
				if not inspire_available then --if inspire is on cooldown, throw the bag, otherwise, don't
					data.unit:movement():throw_bag()
				end
			else --not within inspire range, so throw the bag
				data.unit:movement():throw_bag()
			end
		end
	end

	data.unit:movement():set_should_stay(should_stay)

	if objective then
		data.unit:brain():set_objective(objective)
	end
end

function TeamAILogicIdle._ignore_shield(unit, attention)
	local weapon_base = unit:inventory() and unit:inventory():equipped_unit() and unit:inventory():equipped_unit():base()
	local has_ap_ammo = weapon_base and weapon_base._use_armor_piercing

	if has_ap_ammo then --this way Jokers can also easily check if they have AP ammo
		return false
	end

	local shoot_from_pos = unit:movement():m_head_pos()
	local target_pos = nil

	if attention.handler then
		target_pos = attention.handler:get_attention_m_pos()
	elseif attention.unit then
		if attention.unit:movement() and attention.unit:movement().m_head_pos then
			target_pos = attention.unit:movement():m_head_pos()
		elseif attention.unit:character_damage() and attention.unit:character_damage().shoot_pos_mid then
			target_pos = tmp_vec2

			attention.unit:character_damage():shoot_pos_mid(target_pos)
		end
	end

	if not target_pos then
		return false
	end

	if not TeamAILogicIdle._shield_check then
		TeamAILogicIdle._shield_check = managers.slot:get_mask("enemy_shield_check")
	end

	local hit_shield = nil

	if alive(unit:inventory() and unit:inventory()._shield_unit) then
		hit_shield = World:raycast("ray", shoot_from_pos, target_pos, "slot_mask", TeamAILogicIdle._shield_check, "ignore_unit", unit:inventory()._shield_unit, "report")
	else
		hit_shield = World:raycast("ray", shoot_from_pos, target_pos, "slot_mask", TeamAILogicIdle._shield_check, "report")
	end

	return not not hit_shield
end

function TeamAILogicIdle._get_priority_attention(data, attention_objects, reaction_func)
	if not TeamAILogicIdle._vis_check_slotmask then
		TeamAILogicIdle._vis_check_slotmask = managers.slot:get_mask("AI_visibility")
	end

	reaction_func = reaction_func or TeamAILogicBase._chk_reaction_to_attention_object
	local best_target, best_target_priority_slot, best_target_priority, best_target_reaction = nil

	for u_key, attention_data in pairs(attention_objects) do
		local att_unit = attention_data.unit

		attention_data.pause_expire_t = nil
		attention_data.stare_expire_t = nil
		attention_data.settings.pause = nil

		if attention_data.identified then
			local distance = mvector3.distance(data.m_pos, attention_data.m_pos)
			local reaction = reaction_func(data, attention_data, not CopLogicAttack._can_move(data))
			local reaction_too_mild = nil

			if not reaction or best_target_reaction and reaction < best_target_reaction then
				reaction_too_mild = true
			elseif distance < 150 and reaction <= AIAttentionObject.REACT_SURPRISED then
				reaction_too_mild = true
			end

			if not reaction_too_mild then
				local alert_dt = attention_data.alert_t and data.t - attention_data.alert_t or 10000
				local dmg_dt = attention_data.dmg_t and data.t - attention_data.dmg_t or 10000
				local too_close_threshold = 300
				local near_threshold = 800

				if data.attention_obj and data.attention_obj.u_key == u_key then
					alert_dt = alert_dt * 0.8
					dmg_dt = dmg_dt * 0.8
					distance = distance * 0.8
				end

				local visible = attention_data.verified
				local target_priority = distance
				local target_priority_slot = 0

				if visible then
					local att_base = att_unit:base()
					local is_shielded = TeamAILogicIdle._ignore_shield and TeamAILogicIdle._ignore_shield(data.unit, attention_data) or nil

					if is_shielded then
						local not_important = true

						if distance <= 150 and att_base.has_tag and att_base:has_tag("shield") then
							local can_be_knocked = att_base:char_tweak().damage.shield_knocked and not att_unit:character_damage():is_immune_to_shield_knockback()

							if can_be_knocked then
								target_priority_slot = 4
								not_important = nil
							end
						end

						if not_important then
							target_priority_slot = 14
						end
					else
						local aimed_at = TeamAILogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)
						attention_data.aimed_at = aimed_at

						local too_close = distance <= too_close_threshold
						local near = distance < near_threshold and distance > too_close_threshold
						local has_alerted = alert_dt < 5
						local has_damaged = dmg_dt < 2
						local is_marked = att_unit:contour() and att_unit:contour()._contour_list

						if att_base.sentry_gun then
							target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
						else
							local keep_checking = true

							if att_base.has_tag then
								if att_base:has_tag("spooc") then
									if att_base._tweak_table == "spooc_titan" then
										if att_unit:movement():is_uncloaked() then
											local trying_to_kick_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.spooc_attack

											if trying_to_kick_criminal then
												target_priority_slot = 1

												if trying_to_kick_criminal.target_u_key == data.key then
													target_priority = target_priority * 0.1
												end
											else
												target_priority_slot = too_close and 1 or near and 3 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
											end
										else
											target_priority_slot = 0
											reaction = AIAttentionObject.REACT_IDLE
										end
									else
										local trying_to_kick_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.spooc_attack

										if trying_to_kick_criminal then
											target_priority_slot = 1

											if trying_to_kick_criminal.target_u_key == data.key then
												target_priority = target_priority * 0.1
											end
										else
											target_priority_slot = too_close and 1 or near and 3 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
										end
									end

									keep_checking = nil
								elseif att_base:has_tag("taser") then
									if att_tweak_table == "taser_summers" then
										local trying_to_tase_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.tasing

										if trying_to_tase_criminal then
											target_priority_slot = 1

											if trying_to_tase_criminal.target_u_key == data.key then
												target_priority = target_priority * 0.1
											end
										else
											local att_weapon_usage = att_unit:inventory():equipped_unit() and att_unit:inventory():equipped_unit():base():weapon_tweak_data().usage
											local tase_distance = attention_data.char_tweak.weapon[att_weapon_usage].tase_distance or 1400

											if distance <= tase_distance then
												target_priority_slot = 3
											else
												target_priority_slot = is_marked and 4 or 5
											end
										end
									else
										local trying_to_tase_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.tasing

										if trying_to_tase_criminal then
											target_priority_slot = 1

											if trying_to_tase_criminal.target_u_key == data.key then
												target_priority = target_priority * 0.1
											end
										else
											target_priority_slot = too_close and 3 or near and 5 or is_marked and 7 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
										end
									end

									keep_checking = nil
								elseif att_base:has_tag("lpf") then
									target_priority_slot = too_close and 2 or near and 4 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									keep_checking = nil
								elseif att_base:has_tag("medic") then
									target_priority_slot = too_close and 2 or near and 4 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									keep_checking = nil
								elseif att_base:has_tag("tank") then
									target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									keep_checking = nil
								elseif att_base:has_tag("sniper") then
									target_priority_slot = too_close and 4 or near and 6 or is_marked and 7 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									keep_checking = nil
								elseif att_base:has_tag("shield") then
									if att_tweak_table == "phalanx_vip" then
										target_priority_slot = is_marked and 3 or 4
									else
										target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									end

									keep_checking = nil
								end
							end

							if keep_checking then
								local att_tweak_table = att_base._tweak_table

								if att_tweak_table == "fbi_vet" then
									target_priority_slot = 11
									keep_checking = nil
								elseif att_tweak_table == "boom" or att_tweak_table == "rboom" or att_tweak_table == "boom_titan" then
									target_priority_slot = too_close and 4 or near and 6 or is_marked and 7 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
									keep_checking = nil
								elseif att_tweak_table == "autumn" then
									if att_unit:movement():is_uncloaked() then
										local trying_to_kick_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.spooc_attack

										if trying_to_kick_criminal then
											target_priority_slot = 1
										else
											target_priority_slot = too_close and 1 or near and 3 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
										end
									else
										target_priority_slot = 0
										reaction = AIAttentionObject.REACT_IDLE
									end

									keep_checking = nil
								elseif att_tweak_table == "spring" then
									target_priority_slot = too_close and 4 or near and 5 or is_marked and 6 or 7
									keep_checking = nil
								elseif att_tweak_table == "summers" then
									local att_weapon_range = att_unit:inventory():equipped_unit() and att_unit:inventory():equipped_unit():base():weapon_tweak_data().range or 1400

									if distance <= att_weapon_range then
										local not_an_immediate_threat = att_unit:anim_data().reload or att_unit:anim_data().hurt

										if not_an_immediate_threat then
											target_priority_slot = 5
										else
											target_priority_slot = 2
										end
									else
										target_priority_slot = is_marked and 5 or 6
									end

									keep_checking = nil
								elseif att_tweak_table == "medic_summers" then
									target_priority_slot = is_marked and 2 or 3
									keep_checking = nil
								elseif att_tweak_table == "boom_summers" then
									target_priority_slot = is_marked and 4 or 5
									keep_checking = nil
								end

								if keep_checking then
									if has_damaged and has_alerted then
										target_priority_slot = too_close and 5 or near and 7 or 9
									elseif has_alerted then
										target_priority_slot = too_close and 6 or near and 8 or 10
									else
										target_priority_slot = too_close and 7 or near and 9 or 11
									end
								end
							end
						end

						local is_valid_combat_target = target_priority_slot ~= 0 and reaction >= AIAttentionObject.REACT_COMBAT
						local check_healing_sources = is_valid_combat_target and att_unit:character_damage().check_medic_heal

						if check_healing_sources and not table.contains(tweak_data.medic.disabled_units, att_base._tweak_table) then
							if not att_unit:anim_data() or not att_unit:anim_data().act then
								local team = att_unit:brain() and att_unit:brain()._logic_data and att_unit:brain()._logic_data.team
								local proceed = true

								if team and team.id ~= "law1" then
									if not team.friends or not team.friends.law1 then
										proceed = nil
									end
								end

								if proceed then
									local nearby_medic = managers.enemy:get_nearby_medic(att_unit)

									if nearby_medic then
										if not data.unit:raycast("ray", data.unit:movement():m_head_pos(), nearby_medic:movement():m_head_pos(), "slot_mask", TeamAILogicIdle._vis_check_slotmask, "ray_type", "ai_vision", "report") then
											target_priority_slot = 0
											check_healing_sources = nil
										end
									end
								end
							end
						end

						if check_healing_sources then
							local function get_nearby_lpf(unit)
								local enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.lpf_radius, managers.slot:get_mask("enemies"))

								for _, enemy in ipairs(enemies) do
									if enemy:base():has_tag("lpf") then
										return enemy
									end
								end

								return nil
							end

							local function get_nearby_medic_summers(unit)
								local enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.doc_radius, managers.slot:get_mask("enemies"))

								for _, enemy in ipairs(enemies) do
									if enemy:base():has_tag("medic_summers_special") then
										return enemy
									end
								end

								return nil
							end

							local summers_healing = {
								"taser_summers",
								"boom_summers",
								"summers"
							}

							local lpf_cops_to_heal = {
								"cop",
								"cop_scared",
								"cop_female",
								"fbi",
								"swat",
								"heavy_swat",
								"fbi_swat",
								"fbi_heavy_swat",
								"city_swat",
								"omnia",
								"sniper",
								"tank",
								"tank_hw",
								"tank_mini",
								"spooc",
								"shield",
								"taser",
								"boom",
								"rboom"
							}

							if table.contains(summers_healing, att_base._tweak_table) then
								local nearby_doc = get_nearby_medic_summers(att_unit)

								if nearby_doc then
									if not data.unit:raycast("ray", data.unit:movement():m_head_pos(), nearby_doc:movement():m_head_pos(), "slot_mask", TeamAILogicIdle._vis_check_slotmask, "ray_type", "ai_vision", "report") then
										if target_priority_slot == 1 then
											target_priority_slot = target_priority_slot + 1
										else
											target_priority_slot = target_priority_slot + 2
										end
									end
								end
							elseif table.contains(lpf_cops_to_heal, att_base._tweak_table) then
								local nearby_lpf = get_nearby_lpf(att_unit)

								if nearby_lpf then
									if not data.unit:raycast("ray", data.unit:movement():m_head_pos(), nearby_lpf:movement():m_head_pos(), "slot_mask", TeamAILogicIdle._vis_check_slotmask, "ray_type", "ai_vision", "report") then
										target_priority_slot = target_priority_slot + 1
									end
								end
							end
						end

						if is_valid_combat_target then
							local my_weapon_usage = data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage

							if my_weapon_usage == "is_shotgun_mag" or my_weapon_usage == "is_lmg" then
								local optimal_range = data.char_tweak.weapon[my_weapon_usage].range.optimal

								if distance >= optimal_range then
									target_priority_slot = target_priority_slot + 3
								end
							end
						end
					end
				else
					if alert_dt < 5 then
						target_priority_slot = 14
					else
						target_priority_slot = 15
					end
				end

				if reaction < AIAttentionObject.REACT_COMBAT then
					target_priority_slot = 15 + target_priority_slot + math.max(0, AIAttentionObject.REACT_COMBAT - reaction)
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

function TeamAILogicIdle._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local max_reaction = nil

	if data.cool then
		max_reaction = AIAttentionObject.REACT_SURPRISED
	end

	local delay = CopLogicBase._upd_attention_obj_detection(data, nil, max_reaction)
	local new_attention, new_prio_slot, new_reaction = TeamAILogicIdle._get_priority_attention(data, data.detected_attention_objects, nil)

	if not data.cool and not my_data.acting and not my_data._turning_to_intimidate then
		if not my_data._intimidate_chk_t or my_data._intimidate_chk_t + 0.5 < data.t then
			if not data.unit:brain()._intimidate_t or data.unit:brain()._intimidate_t + 2 < data.t then
				my_data._intimidate_chk_t = data.t

				local can_turn = nil

				if not new_prio_slot or new_prio_slot > 5 then
					if not data.unit:movement():chk_action_forbidden("turn") then
						can_turn = true
					end
				end

				local shout_angle = can_turn and 180 or 90
				local shout_distance = 1200
				local civ = TeamAILogicIdle.find_civilian_to_intimidate(data.unit, shout_angle, shout_distance)

				if civ then
					data.unit:brain()._intimidate_t = data.t

					if can_turn and CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, civ:movement():m_pos()) then
						my_data._turning_to_intimidate = true
						my_data._primary_intimidation_target = civ
					else
						TeamAILogicIdle.intimidate_civilians(data, data.unit, true, true)
					end
				end
			end
		end
	end

	TeamAILogicBase._set_attention_obj(data, new_attention, new_reaction)
	TeamAILogicIdle.check_idle_reload(data, new_reaction)

	if new_reaction and AIAttentionObject.REACT_SCARED <= new_reaction then
		local objective = data.objective
		local wanted_state = nil
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, new_attention)

		if allow_trans then
			wanted_state = TeamAILogicBase._get_logic_state_from_reaction(data, new_reaction)
			local objective = data.objective

			if objective and objective.type == "revive" then
				local revive_unit = objective.follow_unit
				local timer = nil

				if revive_unit:base().is_local_player then
					timer = revive_unit:character_damage()._downed_timer
				elseif revive_unit:interaction().get_waypoint_time then
					timer = revive_unit:interaction():get_waypoint_time()
				end

				if timer and timer <= 10 then
					wanted_state = nil
				end
			end
		end

		if wanted_state and wanted_state ~= data.name then
			if obj_failed then
				data.objective_failed_clbk(data.unit, data.objective)
			end

			if my_data == data.internal_data then
				CopLogicBase._exit(data.unit, wanted_state)
			end

			return
		end
	end

	TeamAILogicIdle._upd_sneak_spotting(data, my_data)
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, TeamAILogicIdle._upd_enemy_detection, data, data.t + delay)
end

function TeamAILogicIdle.check_idle_reload(data, reaction)
	local criminal_brain = data.unit:brain()

	if not reaction or reaction <= AIAttentionObject.REACT_AIM then
		criminal_brain._idle_reload_chk_t = criminal_brain._idle_reload_chk_t or data.t + 2

		if criminal_brain._idle_reload_chk_t and criminal_brain._idle_reload_chk_t < data.t then
			local criminal = data.unit
			local weapon_unit = criminal:inventory():equipped_unit()

			if weapon_unit and weapon_unit:base() then
				if not criminal:anim_data().reload and not criminal:movement():chk_action_forbidden("action") then
					local magazine_size, current_ammo_in_mag = weapon_unit:base():ammo_info()

					if current_ammo_in_mag <= magazine_size * 0.5 then
						local new_action = {
							body_part = 3,
							type = "reload",
							idle_reload = true
						}

						if criminal_brain:action_request(new_action) then
							criminal_brain._idle_reload_chk_t = nil
						end
					end
				end
			end
		end
	else
		criminal_brain._idle_reload_chk_t = nil
	end
end

function TeamAILogicIdle._find_intimidateable_civilians(criminal, use_default_shout_shape, max_angle, max_dis)
	local enemy_domination = "assist"
	local draw_civ_detection_lines = nil
	local head_pos = criminal:movement():m_head_pos()
	local look_vec = criminal:movement():m_rot():y()
	local close_dis = 400
	local intimidateable_civilians = {}
	local best_civ = nil
	local best_civ_wgt = false
	local highest_wgt = 1
	local t = TimerManager:game():time()
	local attention_objects = criminal:brain()._logic_data and criminal:brain()._logic_data.detected_attention_objects or {}

	for key, attention_info in pairs(attention_objects) do
		if attention_info.identified then
			if attention_info.verified or attention_info.nearly_visible then
				if attention_info.is_person and attention_info.char_tweak and not attention_info.unit:character_damage():dead() then
					local att_unit = attention_info.unit
					local att_char_tweak = attention_info.char_tweak
					local anim_data = att_unit:anim_data()
					local is_enemy = nil
					local is_escort = nil
					local is_civilian = nil

					if enemy_domination ~= nil then
						if not TeamAILogicIdle._intimidate_global_t or TeamAILogicIdle._intimidate_global_t + 2 < t then
							if not att_char_tweak.priority_shout and att_char_tweak.surrender and not att_char_tweak.surrender.special and not att_char_tweak.surrender.never and not anim_data.hands_tied then
								is_enemy = true
							end
						end
					end

					if not is_enemy and att_char_tweak.is_escort then
						if not TeamAILogicIdle._intimidate_global_t or TeamAILogicIdle._intimidate_global_t + 2 < t then
							is_escort = true
						end
					end

					if not is_escort and managers.enemy:is_civilian(att_unit) and att_char_tweak.intimidateable and not att_unit:brain():is_tied() then
						is_civilian = true
					end

					if is_enemy or is_escort or is_civilian then
						if not att_unit:movement():cool() and not att_unit:base().unintimidateable and not anim_data.unintimidateable and not anim_data.long_dis_interact_disabled and not att_unit:unit_data().disable_shout then
							local being_moved = is_civilian and att_unit:movement():stance_name() == "cbt" and anim_data.stand

							if not being_moved then
								local att_head_pos = attention_info.m_head_pos
								local vec = att_head_pos - head_pos
								local dis = mvec3_norm(vec)
								local angle = vec:angle(look_vec)

								if use_default_shout_shape then
									max_angle = math_max(8, math_lerp(90, 30, dis / 1200))

									if is_escort then
										max_dis = 600
									else
										max_dis = 1200
									end
								elseif is_escort then
									max_dis = math_min(600, max_dis)
								elseif is_enemy then
									max_angle = 180
								end

								if dis < close_dis or dis < max_dis and angle < max_angle then
									local valid_target = nil
									local inv_wgt = dis

									if is_enemy then
										local already_intimidated = att_unit:brain().surrendered and att_unit:brain():surrendered() or anim_data.surrender or anim_data.hands_back

										if already_intimidated then
											valid_target = true
											inv_wgt = inv_wgt * 0.01
										elseif enemy_domination ~= "assist" then
											if managers.groupai:state():has_room_for_police_hostage() then
												if att_char_tweak.surrender.base_chance >= 1 then
													valid_target = true
												else
													for reason, reason_data in pairs(att_char_tweak.surrender.reasons) do
														if reason == "pants_down" then
															if not managers.groupai:state():enemy_weapons_hot() then
																local not_cool_t = att_unit:movement():not_cool_t()

																if not not_cool_t or t - not_cool_t < 1.5 then
																	valid_target = true

																	break
																end
															end
														elseif reason == "weapon_down" then
															if anim_data.reload or anim_data.hurt or anim_data.tase or att_unit:movement():stance_name() == "ntl" then
																valid_target = true

																break
															else
																local equipped_weapon = att_unit:inventory() and att_unit:inventory():equipped_unit()
																local _, ammo = equipped_weapon and equipped_weapon:base() and equipped_weapon:base().ammo_info and equipped_weapon:base():ammo_info()

																if ammo == 0 then
																	valid_target = true

																	break
																end
															end
														elseif reason == "health" then
															local health_ratio = att_unit:character_damage():health_ratio()

															if health_ratio < 1 then
																local max_setting = nil

																for k, v in pairs(reason_data) do
																	if not max_setting or max_setting.k < k then
																		max_setting = {
																			k = k,
																			v = v
																		}
																	end
																end

																if health_ratio < max_setting.k then
																	valid_target = true

																	break
																end
															end
														end
													end
												end
											end
										end
									elseif is_escort then
										if not anim_data.move then
											valid_target = true
											inv_wgt = -1
										end
									else
										if not anim_data.drop then
											valid_target = true
											inv_wgt = inv_wgt * 0.001
										else
											local civ_internal_data = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data
											local will_get_up_soon = civ_internal_data and civ_internal_data.submission_meter and civ_internal_data.submission_meter < 10

											if will_get_up_soon then
												valid_target = true
												inv_wgt = inv_wgt * 0.01
											else
												local recently_shouted_down = criminal:brain()._shouted_down_civ_t and att_unit:brain()._stopped_civ_t and t < criminal:brain()._shouted_down_civ_t + 3 and t < att_unit:brain()._stopped_civ_t + 3

												if recently_shouted_down then
													valid_target = true
												end
											end
										end
									end

									if valid_target then
										if draw_civ_detection_lines then
											local draw_duration = 0.1
											local new_brush = Draw:brush(Color.blue:with_alpha(0.5), draw_duration)
											new_brush:cylinder(head_pos, att_head_pos, 0.5)
										end

										table.insert(intimidateable_civilians, {
											unit = att_unit,
											key = key,
											inv_wgt = inv_wgt
										})

										if not best_civ_wgt or inv_wgt < best_civ_wgt then
											best_civ_wgt = inv_wgt
											best_civ = att_unit
										end

										if highest_wgt < inv_wgt then
											highest_wgt = inv_wgt
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if draw_civ_detection_lines and best_civ then
		local draw_duration = 0.1
		local new_brush = Draw:brush(Color.yellow:with_alpha(0.5), draw_duration)
		new_brush:cylinder(head_pos, best_civ:movement():m_head_pos(), 0.5)
	end

	return best_civ, highest_wgt, intimidateable_civilians
end

function TeamAILogicIdle.intimidate_civilians(data, criminal, play_sound, play_action, primary_target)
	if alive(primary_target) and primary_target:unit_data().disable_shout then
		return false
	end

	if primary_target and not alive(primary_target) then
		primary_target = nil
	end

	local best_civ, highest_wgt, intimidateable_civilians = TeamAILogicIdle._find_intimidateable_civilians(criminal, true)
	local plural = false

	if #intimidateable_civilians > 1 then
		plural = true
	elseif #intimidateable_civilians <= 0 then
		return false
	end

	local criminal_brain = criminal:brain()
	local best_civ_brain = best_civ:brain()
	local best_civ_anim_data = best_civ:anim_data()

	local intimidate_enemy = best_civ:base():char_tweak().surrender
	local intimidate_escort = best_civ:base():char_tweak().is_escort
	local act_name, sound_name = nil
	local sound_suffix = plural and "plu" or "sin"

	if intimidate_enemy then
		if best_civ_anim_data.hands_back then --dropped weapon
			act_name = "cmd_down"
			sound_name = "l03x_sin" --put your cuffs on
		elseif best_civ_anim_data.surrender then --has hands in the air
			act_name = "cmd_down"
			sound_name = "l02x_sin" --on your knees
		else
			act_name = "cmd_stop"
			sound_name = "l01x_sin" --put your hands up/drop your weapon
		end
	elseif intimidate_escort then
		act_name = "cmd_gogo" --same as "cmd_point", but for the heck of consistency
		sound_name = "f40_any" --not using "get up" lines since they're mostly unfitting inspire ones (the "gogo" inspire ones are not so bad in comparison), or they're played at wrong times
	else
		if best_civ_anim_data.move then --civ is moving
			act_name = "cmd_stop"

			if criminal_brain._stopped_civ_t and data.t < criminal_brain._stopped_civ_t + 3 then --bot told someone to get on the ground in the last 3 seconds
				sound_name = "f02b_sin" --I SAID GET DOWN
			else
				sound_name = "f02x_" .. sound_suffix --get down people/on the ground

				best_civ_brain._stopped_civ_t = data.t
				criminal_brain._stopped_civ_t = data.t
			end
		elseif best_civ_anim_data.drop then --civ is on the ground
			act_name = "cmd_down"

			if criminal_brain._shouted_down_civ_t and data.t < criminal_brain._shouted_down_civ_t + 3 then --bot made someone get on the ground in the last 3 seconds
				sound_name = "f03b_any" --and stay put
			else
				sound_name = "f03a_" .. sound_suffix --stay down/nobody moves
			end
		else
			act_name = "cmd_down"

			if criminal_brain._stopped_civ_t and data.t < criminal_brain._stopped_civ_t + 3 then --bot told someone to get on the ground in the last 3 seconds
				sound_name = "f02b_sin" --I SAID GET DOWN
			else
				sound_name = "f02x_" .. sound_suffix --get down people/on the ground
			end

			best_civ_brain._stopped_civ_t = data.t
			criminal_brain._stopped_civ_t = data.t
			criminal_brain._shouted_down_civ_t = data.t
		end
	end

	if play_sound then
		criminal:sound():say(sound_name, true)
	end

	if play_action then
		local can_do_action = nil

		if not criminal:anim_data().reload then
			if intimidate_enemy then
				can_do_action = true
			else
				if not data.internal_data.firing and not data.internal_data.shooting then
					can_do_action = true
				end
			end
		end

		if can_do_action and not criminal:movement():chk_action_forbidden("action") then
			local new_action = {
				align_sync = true,
				body_part = 3,
				type = "act",
				variant = act_name
			}

			if criminal_brain:action_request(new_action) then
				data.internal_data.gesture_arrest = true
			end
		end
	end

	local intimidated_primary_target = false

	for _, civ in ipairs(intimidateable_civilians) do
		if primary_target == civ.unit then
			intimidated_primary_target = true
		end

		local dont_intimidate = nil

		if best_civ ~= civ.unit then
			if civ.unit:base():char_tweak().surrender or civ.unit:base():char_tweak().is_escort then
				dont_intimidate = true
			end
		end

		if not dont_intimidate then
			civ.unit:brain():on_intimidated(1, criminal)
		end
	end

	if not intimidated_primary_target and primary_target then
		primary_target:brain():on_intimidated(1, criminal)
	end

	if intimidate_enemy or intimidate_escort then
		TeamAILogicIdle._intimidate_global_t = data.t
	end

	local skip_alert = managers.groupai:state():whisper_mode()

	if not skip_alert then
		local alert_rad = 500
		local alert = {
			"vo_cbt",
			criminal:movement():m_head_pos(),
			alert_rad,
			data.SO_access,
			criminal
		}

		managers.groupai:state():propagate_alert(alert)
	end

	if not primary_target and best_civ and best_civ:unit_data().disable_shout then
		return false
	end

	return primary_target or best_civ
end

function TeamAILogicIdle._upd_sneak_spotting(data, my_data)
	if not my_data.acting then
		if not TeamAILogicAssault._mark_special_chk_t or TeamAILogicAssault._mark_special_chk_t + 0.75 < data.t then
			if not TeamAILogicAssault._mark_special_t or TeamAILogicAssault._mark_special_t + 3 < data.t then
				if not data.unit:sound():speaking() then
					TeamAILogicAssault._mark_special_chk_t = data.t
					local nmy = TeamAILogicAssault.find_enemy_to_mark(data.detected_attention_objects)

					if nmy then
						TeamAILogicAssault._mark_special_t = data.t
						TeamAILogicAssault.mark_enemy(data, data.unit, nmy, true, true)
					end
				end
			end
		end
	end
end