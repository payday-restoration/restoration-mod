if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	if SystemFS:exists("mods/Better Bots/mod.txt") then
		return
	end

	function TeamAILogicAssault.find_enemy_to_mark(enemies)
		local best_nmy, best_nmy_wgt = nil

		for key, attention_info in pairs(enemies) do
			if attention_info.reaction and AIAttentionObject.REACT_COMBAT <= attention_info.reaction and attention_info.unit:contour() and attention_info.identified then
				if attention_info.verified or attention_info.nearly_visible then
					if attention_info.is_deployable or attention_info.is_person and attention_info.char_tweak and attention_info.char_tweak.priority_shout then
						if not attention_info.char_tweak or (not attention_info.char_tweak.priority_shout_max_dis or attention_info.dis < attention_info.char_tweak.priority_shout_max_dis) then
							local att_contour = attention_info.unit:contour()
							local mark = false

							if not att_contour._contour_list then
								mark = true
							else
								if attention_info.is_deployable then
									if not att_contour:has_id("mark_unit_dangerous") and not att_contour:has_id("mark_unit_dangerous_damage_bonus") and not att_contour:has_id("mark_unit_dangerous_damage_bonus_distance") then
										mark = true
									end
								else
									if not att_contour:has_id("mark_enemy") and not att_contour:has_id("mark_enemy_damage_bonus") and not att_contour:has_id("mark_enemy_damage_bonus_distance") then
										mark = true
									end
								end
							end

							if mark then
								if not best_nmy_wgt or attention_info.verified_dis < best_nmy_wgt then
									best_nmy_wgt = attention_info.verified_dis
									best_nmy = attention_info.unit
								end
							end
						end
					end
				end
			end
		end

		return best_nmy
	end

	function TeamAILogicAssault.mark_enemy(data, criminal, to_mark, play_sound, play_action)
		if play_sound then
			if to_mark:base().sentry_gun then
				criminal:sound():say("f44x_any", true)
			else
				criminal:sound():say(to_mark:base():char_tweak().bot_priority_shout, true)
			end
		end

		if play_action then
			local can_play_action = not criminal:movement():chk_action_forbidden("action") and not criminal:anim_data().reload and not data.internal_data.firing and not data.internal_data.shooting

			if can_play_action then
				local new_action = {
					type = "act",
					variant = "arrest",
					body_part = 3,
					align_sync = true
				}

				if criminal:brain():action_request(new_action) then
					data.internal_data.gesture_arrest = true
				end
			end
		end

		if to_mark:base().sentry_gun then
			to_mark:contour():add("mark_unit_dangerous", true)
		else
			to_mark:contour():add("mark_enemy", true)
		end
	end

end
