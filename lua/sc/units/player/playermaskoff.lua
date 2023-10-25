function PlayerMaskOff:mark_units(line, t, no_gesture, skip_alert)
	local mark_sec_camera = managers.player:has_category_upgrade("player", "sec_camera_highlight_mask_off")
	local mark_special_enemies = managers.player:has_category_upgrade("player", "special_enemy_highlight_mask_off")
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(mark_special_enemies, false, false, false, false)
	local interact_type, sound_name = nil

	if voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
		interact_type = "cmd_point"

		if voice_type == "mark_cop_quiet" then
			if tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
			end
		else
			if tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
			end
		end

		if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
			prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		end
	elseif voice_type == "mark_camera" and mark_sec_camera then
		sound_name = "f39_any"
		interact_type = "cmd_point"

		prime_target.unit:contour():add("mark_unit", true)
	end

	if interact_type then
		self:_do_action_intimidate(t, not no_gesture and interact_type or nil, sound_name, skip_alert)

		return true
	end

	return mark_sec_camera or mark_special_enemies
end