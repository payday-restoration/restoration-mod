function MutatorPiggyRevenge:on_enemy_killed(dead_unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local weapon_unit = attack_data.weapon_unit

	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		attacker_unit = attacker_unit:base():thrower_unit()
		weapon_unit = attack_data.attacker_unit
	end

	local character_data = managers.criminals:has_character_by_unit(attacker_unit) and managers.criminals:character_data_by_unit(attacker_unit)
	local is_boss_kill = dead_unit:base():has_tag("eventboss")
	local is_sniper_kill = dead_unit:base():has_tag("sniper")
	local is_player_character = not character_data or not character_data.ai
	local weapon_id = alive(weapon_unit) and weapon_unit:base().name_id or attack_data.name_id or attack_data.weapon_id or false
	local feed_amount = is_player_character and (self._tweakdata.weapon_kill_points[weapon_id] or attack_data.headshot and self._tweakdata.headshot_kill_points or self._tweakdata.normal_kill_points) or 1

	if is_player_character then
		if attack_data.headshot then
			self:progress_dialog_count("headshot", 1)
		end

		if weapon_id == "money" or weapon_id == "money_crew" then
			self:progress_dialog_count("moneyshot", 1)
		end
	end

	if is_boss_kill then
		local selector = WeightedSelector:new()

		for _, data in ipairs(self._tweakdata.piggydozer_bag_drops) do
			selector:add(data.bags, data.weight)
		end

		local bag_spawn_amount = selector:select()
		local pos = dead_unit:position()
		local new_fountain = {
			next_spawn_t = 0.5,
			spawned_amount = 0,
			bag_spawn_amount = bag_spawn_amount,
			pos = pos
		}

		table.insert(self._boss_bag_fountains, new_fountain)
	else
		self._feed_drop_count = self._feed_drop_count + feed_amount

		if is_player_character and not is_sniper_kill and self._tweakdata.drop_count <= self._feed_drop_count then
			self._feed_drop_count = 0

			self:server_spawn_bag(dead_unit:position(), Rotation(), 200)
		end
	end
end