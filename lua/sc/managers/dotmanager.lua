local table_insert = table.insert
local table_remove = table.remove

function DOTManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]

		if dot_info.dot_counter >= 0.5 then
			self:_damage_dot(dot_info)

			dot_info.dot_counter = 0
		end

		if t > dot_info.dot_damage_received_time + dot_info.dot_length then
			table_remove(self._doted_enemies, index)
		else
			dot_info.dot_counter = dot_info.dot_counter + dt
		end
	end
end

function DOTManager:check_achievemnts(unit, t)
	if not unit and not alive(unit) then
		return
	end

	if not unit:base() or not unit:base()._tweak_table then
		return
	end

	if CopDamage.is_civilian(unit:base()._tweak_table) then
		return
	end

	if tweak_data.achievement.dot_achievements then
		local dotted_enemies_by_variant = {}

		for _, dot_info in ipairs(self._doted_enemies) do
			dotted_enemies_by_variant[dot_info.variant] = dotted_enemies_by_variant[dot_info.variant] or {}

			if dot_info.user_unit and dot_info.user_unit == managers.player:player_unit() then
				table_insert(dotted_enemies_by_variant[dot_info.variant], dot_info)
			end
		end

		local variant_count_pass, all_pass = nil

		for achievement, achievement_data in pairs(tweak_data.achievement.dot_achievements) do
			variant_count_pass = not achievement_data.count or achievement_data.variant and dotted_enemies_by_variant[achievement_data.variant] and achievement_data.count <= #dotted_enemies_by_variant[achievement_data.variant]
			all_pass = variant_count_pass

			if all_pass and not managers.achievment:award_data(achievement_data) then
				Application:debug("[DOTManager] dot_achievements:", achievement)
			end
		end
	end
end

function DOTManager:add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation, variant, weapon_id)
	local dot_info = self:_add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation, variant, weapon_id, managers.player:player_unit()) --add proper user_unit in raycastweaponbase

	local weapon = weapon_unit

	if variant == "poison" then
		variant = 1
	elseif variant == "dot" then
		variant = 2
	else
		variant = nil
	end

	if weapon_id ~= nil then
		weapon = managers.player:player_unit()
	end

	managers.network:session():send_to_peers_synched("sync_add_doted_enemy", enemy_unit, variant, weapon, dot_length, dot_damage, managers.player:player_unit(), hurt_animation)
end

function DOTManager:sync_add_dot_damage(enemy_unit, variant, weapon_unit, dot_length, dot_damage, user_unit, hurt_animation, variant, weapon_id)
	if enemy_unit then
		local t = TimerManager:game():time()

		self:_add_doted_enemy(enemy_unit, t, weapon_unit, dot_length, dot_damage, hurt_animation, variant, weapon_id, user_unit)
	end
end

function DOTManager:_add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, hurt_animation, variant, weapon_id, user_unit)
	local contains = false

	if self._doted_enemies then
		for _, dot_info in ipairs(self._doted_enemies) do
			if dot_info.enemy_unit == enemy_unit then
				if dot_info.dot_damage_received_time + dot_info.dot_length < dot_damage_received_time + dot_length then
					dot_info.dot_damage_received_time = dot_damage_received_time
					dot_info.dot_length = dot_length
					dot_info.dot_damage = dot_damage
				else
					if dot_info.dot_damage < dot_damage then
						dot_info.dot_damage_received_time = dot_damage_received_time
						dot_info.dot_length = dot_length
						dot_info.dot_damage = dot_damage
					end
				end

				dot_info.weapon_unit = weapon_unit
				dot_info.hurt_animation = dot_info.hurt_animation or hurt_animation
				dot_info.variant = variant
				dot_info.weapon_id = weapon_id
				dot_info.user_unit = user_unit
				contains = true
			end
		end

		if not contains then
			local dot_info = {
				dot_counter = 0,
				enemy_unit = enemy_unit,
				dot_damage_received_time = dot_damage_received_time,
				weapon_unit = weapon_unit,
				dot_length = dot_length,
				dot_damage = dot_damage,
				hurt_animation = hurt_animation,
				variant = variant,
				weapon_id = weapon_id,
				user_unit = user_unit
			}

			table_insert(self._doted_enemies, dot_info)
			self:check_achievemnts(enemy_unit, dot_damage_received_time)
		end
	end
end

function DOTManager:_damage_dot(dot_info)
	if dot_info.user_unit and dot_info.user_unit == managers.player:player_unit() or not dot_info.user_unit and Network:is_server() then
		local attacker_unit = managers.player:player_unit()
		local col_ray = {
			unit = dot_info.enemy_unit
		}
		local damage = dot_info.dot_damage
		local ignite_character = false
		local weapon_unit = dot_info.weapon_unit
		local weapon_id = dot_info.weapon_id

		if dot_info.variant and dot_info.variant == "poison" then
			PoisonBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, dot_info.hurt_animation, weapon_id)
		end
	end
end