PlayerAction.AmmoEfficiency = {
	Priority = 1,
	Function = function (player_manager, target_headshots, bullet_refund, target_time)
		local co = coroutine.running()
		local time = Application:time()
		local headshots = 1
		local weapon_unit = player_manager:equipped_weapon_unit():base()
		local to_magazine = player_manager:upgrade_value("player", "head_shot_ammo_return", nil).to_magazine
		local hud_manager = managers.hud

		local function on_headshot(unit, attack_data)
			local attacker_unit = attack_data.attacker_unit
			local variant = attack_data.variant
			--Filter out melee attacks, along with any other niche things that might proc headshots. Require said attacks to be lethal to match skill description since onlethalheadshot doesn't work properly
			if attacker_unit == player_manager:player_unit() and variant == "bullet" and attack_data.result.type == "death" then
				headshots = headshots + 1
				hud_manager:remove_stack("ammo_efficiency")
				
				if headshots == target_headshots then
					--Amount of ammo to refund. bullet_refund corresponds to % of ammo to refund. If amount would be less than 1 bullet, clamp it to 1 bullet.
					local refund = math.floor(math.max(bullet_refund * weapon_unit:get_ammo_max(), 1))
					--Throw ammo into magazine if the player has the relevant upgrade.
					if to_magazine then
						weapon_unit:set_ammo_remaining_in_clip(math.min(weapon_unit:get_ammo_max_per_clip(), weapon_unit:get_ammo_remaining_in_clip() + refund))
					end
					--Add ammo to pool. Doing this before adding ammo to magazine leads to hud errors, since set_ammo_remaining_in_clip() doesn't care about total remaining ammo and doesn't update the hud.
					player_manager:on_ammo_increase(refund)
					time = target_time
				end
			end
		end

		--OnLethalHeadshot crashes because attack_data and unit somehow become null. Why? Damned if I know.
		player_manager:register_message(Message.OnHeadShot, co, on_headshot)
		hud_manager:add_skill("ammo_efficiency", target_time - time)
		hud_manager:set_stacks("ammo_efficiency", target_headshots - headshots)
		hud_manager:start_buff("ammo_efficiency")
		while time < target_time do
			time = Application:time()
			weapon_unit = player_manager:equipped_weapon_unit():base()

			if weapon_unit and (weapon_unit:fire_mode() ~= "single" or not weapon_unit:is_category("smg", "assault_rifle", "snp")) then
				break
			end

			coroutine.yield(co)
		end

		player_manager:unregister_message(Message.OnHeadShot, co)
	end
}