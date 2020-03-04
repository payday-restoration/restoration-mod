if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	PlayerAction.AmmoEfficiency = {
		Priority = 1,
		Function = function (player_manager, target_headshots, bullet_refund, target_time)
			local co = coroutine.running()
			local time = Application:time()
			local headshots = 1
			local weapon_unit = player_manager:equipped_weapon_unit():base()
			local to_magazine = player_manager:upgrade_value("player", "head_shot_ammo_return", nil).to_magazine

			local function on_headshot(unit, attack_data)
				local attacker_unit = attack_data.attacker_unit
				local variant = attack_data.variant

				if attacker_unit == player_manager:player_unit() and variant == "bullet" then
					headshots = headshots + 1

					if headshots == target_headshots then
						local refund = math.ceil(0.02 * weapon_unit:get_ammo_max(), 1)
						if to_magazine then
							weapon_unit:set_ammo_remaining_in_clip(math.min(weapon_unit:get_ammo_max_per_clip(), weapon_unit:get_ammo_remaining_in_clip() + refund))
						end
						player_manager:on_ammo_increase(refund)
						time = target_time
					end
				end
			end

			player_manager:register_message(Message.OnHeadShot, co, on_headshot)

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
end