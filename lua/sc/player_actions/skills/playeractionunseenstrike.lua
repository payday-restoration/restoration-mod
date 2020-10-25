PlayerAction.UnseenStrike = {
	Priority = 1,
	Function = function (player_manager, min_time, max_duration, crit_chance)
		local co = coroutine.running()
		local target_time = Application:time() + min_time
		--Start off with buff active.
		local is_active = true
		managers.player:activate_temporary_upgrade_indefinitely("temporary", "unseen_strike")

		local function on_damage_taken()
			if is_active then
				player_manager:activate_temporary_upgrade("temporary", "unseen_strike")
				is_active = nil
			end
			target_time = Application:time() + min_time
		end

		player_manager:register_message(Message.OnPlayerDamage, co, on_damage_taken)

		while true do
			--Reapply buff after not taking damage for a long enough time.
			--Have it last 'forever' until damage is taken.
			if target_time <= Application:time() then
				managers.player:activate_temporary_upgrade_indefinitely("temporary", "unseen_strike")
				is_active = true
			end

			coroutine.yield(co)
		end

		player_manager:unregister_message(Message.OnPlayerDamage, co)
	end
}
