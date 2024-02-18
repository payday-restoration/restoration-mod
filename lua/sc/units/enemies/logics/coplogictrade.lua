-- Remove contour from traded hostages and make them invulnerable
Hooks:PostHook(CopLogicTrade, "on_trade", "sh_on_trade", function (data)
	if not data.internal_data.fleeing then
		return
	end

	data.unit:character_damage():set_invulnerable(true)
	data.unit:network():send("set_unit_invulnerable", true, data.unit:character_damage()._immortal)
	data.unit:contour():remove("hostage_trade", true)
	data.unit:contour():remove("friendly", true)
end)


-- Make traded enemies properly stand up to flee
function CopLogicTrade._chk_request_action_walk_to_flee_pos(data, my_data, end_rot)
	data.unit:brain():action_request({
		type = "stand",
		body_part = 4
	})

	my_data.walking_to_flee_pos = data.unit:brain():action_request({
		type = "walk",
		variant = "run",
		nav_path = my_data.flee_path,
		body_part = 2,
		blocks = {
			crouch = -1
		}
	})

	my_data.flee_path = nil
end