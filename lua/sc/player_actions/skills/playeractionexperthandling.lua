PlayerAction.ExpertHandling = {
	Priority = 1,
	Function = function (player_manager, accuracy_bonus, max_stacks, max_time)
		local co = coroutine.running()
		local current_time = Application:time()
		local current_stacks = 1
		local add_time = player_manager:upgrade_value("pistol", "stacked_accuracy_bonus", nil).max_time
		local hud_manager = managers.hud

		--Headshot stacking + refresh
		local function on_headshot(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant
			
			--Extra checks that you're actually *shooting* enemies with your *pistol*
			if attacker_unit == player_manager:player_unit() and variant == "bullet" and player_manager:is_current_weapon_of_category("pistol") then
				current_stacks = current_stacks + 1

				if current_stacks <= max_stacks then
					player_manager:mul_to_property("desperado", accuracy_bonus)
					hud_manager:add_stack("desperado")
				end
				max_time = current_time + add_time
				hud_manager:start_buff("desperado", add_time)
			end

		end
		
		hud_manager:start_buff("desperado", add_time)
		hud_manager:add_stack("desperado")

		player_manager:mul_to_property("desperado", accuracy_bonus)
		player_manager:register_message(Message.OnHeadShot, co, on_headshot)

		while current_time < max_time do
			current_time = Application:time()
			--Keep effect active while pistol isn't equipped.
			coroutine.yield(co)
		end

		--Cleanup
		player_manager:remove_property("desperado")
		player_manager:unregister_message(Message.OnHeadShot, co)
		if player_manager:has_category_upgrade("player", "desperado_bodyshot_refresh") then
			player_manager:unregister_message(Message.OnEnemyShot, co)
		end
	end
}