if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function AmmoClip:_pickup(unit)
	if self._picked_up then
		return
	end
	local player_manager = managers.player
	local inventory = unit:inventory()
	if not unit:character_damage():dead() and inventory then
		local picked_up = false
		if self._projectile_id then
			if managers.blackmarket:equipped_projectile() == self._projectile_id and not player_manager:got_max_grenades() then
				player_manager:add_grenade_amount(self._ammo_count or 1)
				picked_up = true
			end
		else
			local available_selections = {}
			for i, weapon in pairs(inventory:available_selections()) do
				if inventory:is_equipped(i) then
					table.insert(available_selections, 1, weapon)
				else
					table.insert(available_selections, weapon)
				end
			end
			local success, add_amount
			for _, weapon in ipairs(available_selections) do
				if not self._weapon_category or self._weapon_category == weapon.unit:base():weapon_tweak_data().category then
					success, add_amount = weapon.unit:base():add_ammo(1, self._ammo_count)
					picked_up = success or picked_up
					if self._ammo_count then
						self._ammo_count = math.max(math.floor(self._ammo_count - add_amount), 0)
					end
					if picked_up and tweak_data.achievement.pickup_sticks and self._weapon_category == tweak_data.achievement.pickup_sticks.weapon_category then
						managers.achievment:award_progress(tweak_data.achievement.pickup_sticks.stat)
					end
				end
			end
		end
		if picked_up then
			self._picked_up = true
			if not self._projectile_id and not self._weapon_category then
				local restored_health
				if not unit:character_damage():is_downed() and player_manager:has_category_upgrade("temporary", "loose_ammo_restore_health") and not player_manager:has_activate_temporary_upgrade("temporary", "loose_ammo_restore_health") then
					player_manager:activate_temporary_upgrade("temporary", "loose_ammo_restore_health")
					local values = player_manager:temporary_upgrade_value("temporary", "loose_ammo_restore_health", 0)
					if values ~= 0 then
						local restore_value = math.random(values[1], values[2])
						local num_more_hp = 1
						if 0 < player_manager:num_connected_players() then
							num_more_hp = player_manager:num_players_with_more_health()
						end
						local base = tweak_data.upgrades.loose_ammo_restore_health_values.base
						local sync_value = math.round(math.clamp(restore_value - base, 0, 13))
						restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
						local percent_inc = player_manager:upgrade_value("player", "gain_life_per_players", 0) * num_more_hp + 1
						print("[AmmoClip:_pickup] Percent increase for health pickup is: ", percent_inc - 1)
						restore_value = restore_value * percent_inc
						local damage_ext = unit:character_damage()
						if not damage_ext:need_revive() and not damage_ext:dead() and not damage_ext:is_berserker() then
							damage_ext:restore_health(restore_value, true)
							unit:sound():play("pickup_ammo_health_boost", nil, true)
						end
						if player_manager:has_category_upgrade("player", "loose_ammo_restore_health_give_team") then
							managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", 2 + sync_value)
						end
					end
				end
				if player_manager:has_category_upgrade("temporary", "loose_ammo_give_team") and not player_manager:has_activate_temporary_upgrade("temporary", "loose_ammo_give_team") then
					player_manager:activate_temporary_upgrade("temporary", "loose_ammo_give_team")
					managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", AmmoClip.EVENT_IDS.bonnie_share_ammo)
				end
			elseif self._projectile_id then
				player_manager:register_grenade(managers.network:session():local_peer():id())
				managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", AmmoClip.EVENT_IDS.register_grenade)
			end
			if Network:is_client() then
				managers.network:session():send_to_host("sync_pickup", self._unit)
			end
			unit:sound():play(self._pickup_event or "pickup_ammo", nil, true)
			self:consume()
			player_manager:send_message(Message.OnAmmoPickup, nil, unit)
			return true
		end
	end
	return false
end

end