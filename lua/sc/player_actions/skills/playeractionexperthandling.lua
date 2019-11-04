PlayerAction.ExpertHandling = {
	Priority = 1,
	Function = function (player_manager, accuracy_bonus, max_stacks, max_time, add_time)
		local co = coroutine.running()
		local current_time = Application:time()
		local current_stacks = 1

		local function on_headshot(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant

			if attacker_unit == player_manager:player_unit() and variant == "bullet" then
				current_stacks = current_stacks + 1

				if current_stacks <= max_stacks then
					player_manager:mul_to_property("desperado", accuracy_bonus)
				end
			end

			max_time = current_time + add_time
		end

		local function on_hit(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant

			if attacker_unit == player_manager:player_unit() and variant == "bullet" then
				max_time = current_time + add_time
			end
		end

		player_manager:mul_to_property("desperado", accuracy_bonus)
		player_manager:register_message(Message.OnHeadShot, co, on_headshot)
		if player_manager:has_category_upgrade("player", "desperado_bodyshot_refresh") then
			player_manager:register_message(Message.OnEnemyShot, co, on_hit)
		end

		while current_time < max_time do
			current_time = Application:time()

			if not player_manager:is_current_weapon_of_category("pistol") then
				break
			end

			coroutine.yield(co)
		end

		player_manager:remove_property("desperado")
		player_manager:unregister_message(Message.OnHeadShot, co)
		if player_manager:has_category_upgrade("player", "desperado_bodyshot_refresh") then
			player_manager:unregister_message(Message.OnEnemyShot, co)
		end
	end
}
