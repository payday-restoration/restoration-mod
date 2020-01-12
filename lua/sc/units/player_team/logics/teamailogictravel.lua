function TeamAILogicTravel.check_inspire(data, attention)
	if not attention then
		return
	end

	local range_sq = 810000
	local pos = data.unit:position()
	local target = attention.unit:position()
	local dist = mvector3.distance_sq(pos, target)

	if dist < range_sq and not attention.unit:character_damage():arrested() then
		data.unit:brain():set_objective()
		data.unit:sound():say("f36x_any", true, false)

		local can_play_action = not data.unit:movement():chk_action_forbidden("action") and not data.unit:anim_data().reload and not data.internal_data.firing and not data.internal_data.shooting

		if can_play_action then
			local new_action = {
				variant = "cmd_get_up",
				align_sync = true,
				body_part = 3,
				type = "act"
			}

			if data.unit:brain():action_request(new_action) then
				data.internal_data.gesture_arrest = true
			end
		end

		local cooldown = managers.player:crew_ability_upgrade_value("crew_inspire", 360)

		managers.player:start_custom_cooldown("team", "crew_inspire", cooldown)
		TeamAILogicTravel.actually_revive(data, attention.unit, true)

		local skip_alert = managers.groupai:state():whisper_mode()

		if not skip_alert then
			local alert_rad = 500
			local new_alert = {
				"vo_cbt",
				data.unit:movement():m_head_pos(),
				alert_rad,
				data.SO_access,
				data.unit
			}

			managers.groupai:state():propagate_alert(new_alert)
		end
	end
end
