if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	if SystemFS:exists("mods/Better Bots/mod.txt") then
		return
	end

	function TeamAILogicAssault.mark_enemy(data, criminal, to_mark, play_sound, play_action)
		if play_sound then
			criminal:sound():say(to_mark:base():char_tweak().bot_priority_shout, true)
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

		to_mark:contour():add("mark_enemy", true)
	end

end
