function TeamAILogicIdle._ignore_shield(unit, attention)
	local weapon_base = unit:inventory() and unit:inventory():equipped_unit() and unit:inventory():equipped_unit():base()
	local has_ap_ammo = weapon_base and weapon_base._use_armor_piercing

	if has_ap_ammo then --this way Jokers can also easily check if they have AP ammo
		return false
	end

	if not TeamAILogicIdle._shield_check then
		TeamAILogicIdle._shield_check = managers.slot:get_mask("enemy_shield_check")
	end

	local head_pos = unit:movement():m_head_pos()
	local u_char_dmg = attention and attention.unit and attention.unit:character_damage()
	local u_shoot_pos = nil

	if u_char_dmg and u_char_dmg.shoot_pos_mid then
		u_shoot_pos = Vector3()

		u_char_dmg:shoot_pos_mid(u_shoot_pos)
	else
		return false
	end

	local hit_shield = nil

	if alive(unit:inventory() and unit:inventory()._shield_unit) then
		hit_shield = World:raycast("ray", head_pos, u_shoot_pos, "slot_mask", TeamAILogicIdle._shield_check, "ignore_unit", unit:inventory()._shield_unit, "report")
	else
		hit_shield = World:raycast("ray", head_pos, u_shoot_pos, "slot_mask", TeamAILogicIdle._shield_check, "report")
	end

	return not not hit_shield
end

function TeamAILogicIdle._get_priority_attention(data, attention_objects, reaction_func)
	reaction_func = reaction_func or TeamAILogicBase._chk_reaction_to_attention_object
	local best_target, best_target_priority_slot, best_target_priority, best_target_reaction = nil

	for u_key, attention_data in pairs(attention_objects) do
		local att_unit = attention_data.unit

		if attention_data.identified then
			if attention_data.pause_expire_t then
				if attention_data.pause_expire_t < data.t then
					attention_data.pause_expire_t = nil
				end
			elseif attention_data.stare_expire_t and attention_data.stare_expire_t < data.t then
				if attention_data.settings.pause then
					attention_data.stare_expire_t = nil
					attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
				end
			else
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
						local is_shielded = TeamAILogicIdle._ignore_shield and TeamAILogicIdle._ignore_shield(data.unit, attention_data) or nil

						if is_shielded then
							reaction = math.min(AIAttentionObject.REACT_AIM, reaction)
						else
							local aimed_at = TeamAILogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)
							attention_data.aimed_at = aimed_at

							local too_close = distance <= too_close_threshold
							local near = distance < near_threshold and distance > too_close_threshold
							local has_alerted = alert_dt < 5
							local has_damaged = dmg_dt < 2
							local is_spooc = att_unit:base().has_tag and att_unit:base():has_tag("spooc")
							local is_taser = att_unit:base().has_tag and att_unit:base():has_tag("taser")
							local is_medic = att_unit:base().has_tag and att_unit:base():has_tag("medic")
							local is_tank = att_unit:base().has_tag and att_unit:base():has_tag("tank") and not att_unit:base():has_tag("medic")
							local is_sniper = att_unit:base().has_tag and att_unit:base():has_tag("sniper")
							local is_shield = att_unit:base().has_tag and att_unit:base():has_tag("shield") and att_unit:base()._tweak_table ~= "phalanx_vip"
							local is_phalanx_captain = att_unit:base()._tweak_table == "phalanx_vip"
							local is_turret = att_unit:base().sentry_gun
							local is_marked = att_unit.contour and att_unit:contour() and att_unit:contour()._contour_list

							if is_spooc then
								local trying_to_kick_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.spooc_attack

								if trying_to_kick_criminal then
									target_priority_slot = 1
								else
									target_priority_slot = too_close and 1 or near and 3 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
								end
							elseif is_medic then
								target_priority_slot = too_close and 2 or near and 4 or is_marked and 6 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
							elseif is_taser then
								local trying_to_tase_criminal = att_unit:brain()._logic_data and att_unit:brain()._logic_data.internal_data and att_unit:brain()._logic_data.internal_data.tasing

								if trying_to_tase_criminal then
									target_priority_slot = 1
								else
									target_priority_slot = too_close and 3 or near and 5 or is_marked and 7 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
								end
							elseif is_sniper then
								target_priority_slot = too_close and 4 or near and 6 or is_marked and 7 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
							elseif is_tank then
								target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
							elseif is_shield then
								target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
							elseif is_turret then
								target_priority_slot = too_close and 4 or near and 6 or is_marked and 8 or has_damaged and has_alerted and 9 or has_alerted and 10 or 11
							elseif has_damaged and has_alerted then
								target_priority_slot = too_close and 5 or near and 7 or 9
							elseif has_alerted then
								target_priority_slot = too_close and 6 or near and 8 or 10
							else
								target_priority_slot = too_close and 7 or near and 9 or 11
							end

							if is_phalanx_captain then
								local active_phalanx = alive(managers.groupai:state():phalanx_vip())

								if active_phalanx then
									target_priority_slot = 4
								else
									target_priority_slot = 0 --to avoid calculating optimal distance with auto/semiauto shotguns and LMGs
									reaction = math.min(AIAttentionObject.REACT_AIM, reaction)
								end
							else
								if not is_medic and att_unit:character_damage().check_medic_heal and not table.contains(tweak_data.medic.disabled_units, att_unit:base()._tweak_table) then
									if not att_unit:anim_data() or not att_unit:anim_data().act then
										local team = att_unit:brain() and att_unit:brain()._logic_data and att_unit:brain()._logic_data.team

										if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
											--nothing
										else
											local medic = managers.enemy:get_nearby_medic(att_unit)

											if medic then
												if medic:character_damage().shoot_pos_mid then
													local medic_shoot_pos = Vector3()
													medic:character_damage():shoot_pos_mid(medic_shoot_pos)

													if not World:raycast("ray", data.unit:movement():m_head_pos(), medic_shoot_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision", "report") then
														target_priority_slot = 0
													end
												end
											end
										end
									end
								end
							end

							if target_priority_slot ~= 0 then
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
						local has_alerted = alert_dt < 5

						if has_alerted then
							target_priority_slot = 14
						else
							target_priority_slot = 15
						end

						reaction = math.min(AIAttentionObject.REACT_AIM, reaction)
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
	end

	return best_target, best_target_priority_slot, best_target_reaction
end
