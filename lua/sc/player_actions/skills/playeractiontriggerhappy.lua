PlayerAction.TriggerHappy = {
	Priority = 1,
	Function = function (player_manager, damage_bonus, max_stacks, max_time)
		local co = coroutine.running()
		local current_time = Application:time()
		local current_stacks = 1
		local pistol_unequipped = false
		local add_time = player_manager:upgrade_value("pistol", "stacking_hit_damage_multiplier", nil).max_time
		
		local function on_headshot(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant

			if attacker_unit == player_manager:player_unit() and variant == "bullet" and not pistol_unequipped then
				current_stacks = current_stacks + 1

				if current_stacks <= max_stacks then
					player_manager:mul_to_property("trigger_happy", damage_bonus)
				end
				max_time = current_time + add_time
			end
		end

		local function on_hit(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant

			if attacker_unit == player_manager:player_unit() and variant == "bullet" and not pistol_unequipped then
				max_time = current_time + add_time
			end
		end

		player_manager:mul_to_property("trigger_happy", damage_bonus)
		player_manager:register_message(Message.OnHeadShot, co, on_headshot)
		if player_manager:has_category_upgrade("player", "trigger_happy_bodyshot_refresh") then
			player_manager:register_message(Message.OnEnemyShot, co, on_hit)
		end

		while current_time < max_time do
			current_time = Application:time()

			if not player_manager:is_current_weapon_of_category("pistol") then
				player_manager:remove_property("trigger_happy") --Remove damage bonus when pistol is not equipped.
				pistol_unequipped = true
			elseif pistol_unequipped then
				pistol_unequipped = false
				player_manager:mul_to_property("trigger_happy", damage_bonus ^ math.min(current_stacks, max_stacks)) --Restore damage bonus when pistol is re-equipped.
			end

			coroutine.yield(co)
		end

		player_manager:remove_property("trigger_happy")
		player_manager:unregister_message(Message.OnHeadShot, co)
		if player_manager:has_category_upgrade("player", "trigger_happy_bodyshot_refresh") then
			player_manager:unregister_message(Message.OnEnemyShot, co)
		end
	end
}