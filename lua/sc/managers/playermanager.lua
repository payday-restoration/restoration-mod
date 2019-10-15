if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local function make_double_hud_string(a, b)
		return string.format("%01d|%01d", a, b)
	end

	local function add_hud_item(amount, icon)
		if #amount > 1 then
			managers.hud:add_item_from_string({
				amount_str = make_double_hud_string(amount[1], amount[2]),
				amount = amount,
				icon = icon
			})
		else
			managers.hud:add_item({
				amount = amount[1],
				icon = icon
			})
		end
	end
			
	local player_movement_speed_multiplier_orig = PlayerManager.movement_speed_multiplier
	function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
		
		local multiplier = player_movement_speed_multiplier_orig(self, speed_state, bonus_multiplier, upgrade_level, health_ratio)
		
		if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
			--Apply Moving Target movement speed bonus (additively)
			multiplier = multiplier + self:detection_risk_movement_speed_bonus()
		end
		
		return multiplier
	end
	
	function PlayerManager:on_killshot(killed_unit, variant, headshot, weapon_id)
		local player_unit = self:player_unit()

		if not player_unit then
			return
		end

		if CopDamage.is_civilian(killed_unit:base()._tweak_table) then
			return
		end

		local weapon_melee = weapon_id and tweak_data.blackmarket and tweak_data.blackmarket.melee_weapons and tweak_data.blackmarket.melee_weapons[weapon_id] and true

		if killed_unit:brain().surrendered and killed_unit:brain():surrendered() and (variant == "melee" or weapon_melee) then
			managers.custom_safehouse:award("daily_honorable")
		end

		managers.modifiers:run_func("OnPlayerManagerKillshot", player_unit, killed_unit:base()._tweak_table, variant)

		local equipped_unit = self:get_current_state()._equipped_unit
		self._num_kills = self._num_kills + 1

		if self._num_kills % self._SHOCK_AND_AWE_TARGET_KILLS == 0 and self:has_category_upgrade("player", "automatic_faster_reload") then
			self:_on_enter_shock_and_awe_event()
		end

		self._message_system:notify(Message.OnEnemyKilled, nil, equipped_unit, variant, killed_unit)

		if self._saw_panic_when_kill and variant ~= "melee" then
			local equipped_unit = self:get_current_state()._equipped_unit:base()

			if equipped_unit:is_category("saw") or equipped_unit:is_category("grenade_launcher") or equipped_unit:is_category("bow") or equipped_unit:is_category("crossbow") then
				local pos = player_unit:position()
				local skill = self:upgrade_value("saw", "panic_when_kill")

				if skill and type(skill) ~= "number" then
					local area = skill.area
					local chance = skill.chance
					local amount = skill.amount
					local enemies = World:find_units_quick("sphere", pos, area, 12, 21)

					for i, unit in ipairs(enemies) do
						if unit:character_damage() then
							unit:character_damage():build_suppression(amount, chance)
						end
					end
				end
			end
		end

		local t = Application:time()
		local damage_ext = player_unit:character_damage()

		if self:has_category_upgrade("player", "kill_change_regenerate_speed") then
			local amount = self:body_armor_value("skill_kill_change_regenerate_speed", nil, 1)
			local multiplier = self:upgrade_value("player", "kill_change_regenerate_speed", 0)

			damage_ext:change_regenerate_speed(amount * multiplier, tweak_data.upgrades.kill_change_regenerate_speed_percentage)
		end

		local gain_throwable_per_kill = managers.player:upgrade_value("team", "crew_throwable_regen", 0)

		if gain_throwable_per_kill ~= 0 then
			self._throw_regen_kills = (self._throw_regen_kills or 0) + 1

			if gain_throwable_per_kill < self._throw_regen_kills then
				managers.player:add_grenade_amount(1, true)

				self._throw_regen_kills = 0
			end
		end

		if damage_ext:health_ratio() < 0.5 then
			if variant == "melee" and self:has_category_upgrade("player", "melee_kill_dodge_regen") then
				damage_ext:fill_dodge_meter_yakuza(self:upgrade_value("player", "melee_kill_dodge_regen") + self:upgrade_value("player", "kill_dodge_regen"))
			else
				damage_ext:fill_dodge_meter_yakuza(self:upgrade_value("player", "kill_dodge_regen"))
			end
		end

		if self._on_killshot_t and t < self._on_killshot_t then
			return
		end

		local regen_armor_bonus = self:upgrade_value("player", "killshot_regen_armor_bonus", 0)
		local dist_sq = mvector3.distance_sq(player_unit:movement():m_pos(), killed_unit:movement():m_pos())
		local close_combat_sq = tweak_data.upgrades.close_combat_distance * tweak_data.upgrades.close_combat_distance

		if dist_sq <= close_combat_sq then
			regen_armor_bonus = regen_armor_bonus + self:upgrade_value("player", "killshot_close_regen_armor_bonus", 0)
			local panic_chance = self:upgrade_value("player", "killshot_close_panic_chance", 0)
			panic_chance = managers.modifiers:modify_value("PlayerManager:GetKillshotPanicChance", panic_chance)

			if panic_chance > 0 or panic_chance == -1 then
				local slotmask = managers.slot:get_mask("enemies")
				local units = World:find_units_quick("sphere", player_unit:movement():m_pos(), tweak_data.upgrades.killshot_close_panic_range, slotmask)

				for e_key, unit in pairs(units) do
					if alive(unit) and unit:character_damage() and not unit:character_damage():dead() then
						unit:character_damage():build_suppression(0, panic_chance)
					end
				end
			end
		end

		if damage_ext and regen_armor_bonus > 0 then
			damage_ext:restore_armor(regen_armor_bonus)
		end

		local regen_health_bonus = 0

		if variant == "melee" then
			regen_health_bonus = regen_health_bonus + self:upgrade_value("player", "melee_kill_life_leech", 0)
		end

		if damage_ext and regen_health_bonus > 0 then
			damage_ext:restore_health(regen_health_bonus)
		end

		self._on_killshot_t = t + (tweak_data.upgrades.on_killshot_cooldown or 0)

		if _G.IS_VR then
			local steelsight_multiplier = equipped_unit:base():enter_steelsight_speed_multiplier()
			local stamina_percentage = (steelsight_multiplier - 1) * tweak_data.vr.steelsight_stamina_regen
			local stamina_regen = player_unit:movement():_max_stamina() * stamina_percentage

			player_unit:movement():add_stamina(stamina_regen)
		end
	end	
	
	function PlayerManager:_check_damage_to_hot(t, unit, damage_info)
		local player_unit = self:player_unit()

		if not self:has_category_upgrade("player", "damage_to_hot") and not self:has_category_upgrade("player", "heal_over_time") then
			return
		end
		
		if damage_info.attacker_unit:base() and damage_info.attacker_unit:base().sentry_gun then
			return
		end

		if not alive(player_unit) or player_unit:character_damage():need_revive() or player_unit:character_damage():dead() then
			return
		end

		if not alive(unit) or not unit:base() or not damage_info then
			return
		end

		if damage_info.is_fire_dot_damage then
			return
		end

		--Load alternate heal over time tweakdata if player is using Infiltrator.
		local data = tweak_data.upgrades.damage_to_hot_data
		if self:has_category_upgrade("player", "melee_to_heal") then --Load alternate heal over time tweakdata if player is using Infiltrator.
			data = tweak_data.upgrades.melee_to_hot_data
		elseif self:has_category_upgrade("player", "dodge_to_heal") then --Or Rogue
			data = tweak_data.upgrades.dodge_to_hot_data
		end

		if not data then
			return
		end

		if self._next_allowed_doh_t and t < self._next_allowed_doh_t then
			return
		end

		local add_stack_sources = data.add_stack_sources or {}

		if not add_stack_sources.swat_van and unit:base().sentry_gun then
			return
		elseif not add_stack_sources.civilian and CopDamage.is_civilian(unit:base()._tweak_table) then
			return
		end

		if not add_stack_sources[damage_info.variant] then
			return
		end

		if not unit:brain():is_hostile() then
			return
		end

		local player_armor = managers.blackmarket:equipped_armor(data.works_with_armor_kit, true)

		if not table.contains(data.armors_allowed or {}, player_armor) then
			return
		end

		player_unit:character_damage():add_damage_to_hot()

		self._next_allowed_doh_t = t + data.stacking_cooldown
	end	

	function PlayerManager:refill_messiah_charges()
		if self._max_messiah_charges then
			self._messiah_charges = self._max_messiah_charges
		end
	end

	function PlayerManager:detection_risk_movement_speed_bonus()
		local multiplier = 0
		local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
		multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed)
		return multiplier
	end
	
	function PlayerManager:_add_equipment(params)
		if self:has_equipment(params.equipment) then
			print("Allready have equipment", params.equipment)

			return
		end

		local equipment = params.equipment
		local tweak_data = tweak_data.equipments[equipment]
		local amount = {}
		local amount_digest = {}
		local quantity = tweak_data.quantity

		for i = 1, #quantity, 1 do
			local equipment_name = equipment

			if tweak_data.upgrade_name then
				equipment_name = tweak_data.upgrade_name[i]
			end

			local amt = (quantity[i] or 0) + self:equiptment_upgrade_value(equipment_name, "quantity")
			amt = managers.modifiers:modify_value("PlayerManager:GetEquipmentMaxAmount", amt, params)

			table.insert(amount, amt)
			table.insert(amount_digest, Application:digest_value(0, true))
		end

		local icon = params.icon or tweak_data and tweak_data.icon
		local use_function_name = params.use_function_name or tweak_data and tweak_data.use_function_name
		local use_function = use_function_name or nil

		if params.slot and params.slot > 1 then
			if self:has_category_upgrade("player", "second_deployable_full") then
				for i = 1, #quantity, 1 do
					amount[i] = amount[i]
				end			
			else
				for i = 1, #quantity, 1 do
					amount[i] = math.ceil(amount[i] / 2)
				end
			end
		end

		table.insert(self._equipment.selections, {
			equipment = equipment,
			amount = amount_digest,
			use_function = use_function,
			action_timer = tweak_data.action_timer,
			icon = icon,
			unit = tweak_data.unit,
			on_use_callback = tweak_data.on_use_callback
		})

		self._equipment.selected_index = self._equipment.selected_index or 1

		add_hud_item(amount, icon)

		for i = 1, #amount, 1 do
			self:add_equipment_amount(equipment, amount[i], i)
		end
	end
	
	function PlayerManager:_chk_fellow_crimin_proximity(unit)
		local players_nearby = 0
		
		local enemies = World:find_units_quick(unit, "sphere", unit:position(), 1500, managers.slot:get_mask("criminals_no_deployables"))

		for _, enemy in ipairs(enemies) do
			players_nearby = players_nearby + 1
		end
		
		if players_nearby <= 0 then
			--log("uhohstinky")
		end
		
		return players_nearby
	end
	
	function PlayerManager:damage_reduction_skill_multiplier(damage_type)
		local multiplier = 1
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered", 1)
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered_strong", 1)
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_close_contact", 1)
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "revived_damage_resist", 1)
		multiplier = multiplier * self:upgrade_value("player", "damage_dampener", 1)
		multiplier = multiplier * self:upgrade_value("player", "health_damage_reduction", 1)
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1)
		multiplier = multiplier * self:temporary_upgrade_value("temporary", "revive_damage_reduction", 1)
		multiplier = multiplier * self:get_hostage_bonus_multiplier("damage_dampener")
		multiplier = multiplier * self._properties:get_property("revive_damage_reduction", 1)
		multiplier = multiplier * self._temporary_properties:get_property("revived_damage_reduction", 1)
		local dmg_red_mul = self:team_upgrade_value("damage_dampener", "team_damage_reduction", 1)

		local health_ratio = self:player_unit():character_damage():health_ratio()
		local min_ratio = self:upgrade_value("player", "passive_damage_reduction")
		if health_ratio < min_ratio and self:has_category_upgrade("player", "passive_damage_reduction") then
			dmg_red_mul = dmg_red_mul - (1 - dmg_red_mul)
		end
		multiplier = multiplier * dmg_red_mul

		if self:is_damage_health_ratio_active(health_ratio) then
			multiplier = multiplier * (1 - managers.player:upgrade_value("player", "resistance_damage_health_ratio_multiplier", 0) * (1 - health_ratio))
		end

		if damage_type == "melee" then
			multiplier = multiplier * managers.player:upgrade_value("player", "melee_damage_dampener", 1)
		end

		local current_state = self:get_current_state()

		if current_state and current_state:_interacting() then
			multiplier = multiplier * managers.player:upgrade_value("player", "interacting_damage_multiplier", 1)
		end
		

		return multiplier
	end


	function PlayerManager:body_armor_regen_multiplier(moving, health_ratio)
		local multiplier = 1
		multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier_tier", 1)
		multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier", 1)
		multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier_passive", 1)
		multiplier = multiplier * self:team_upgrade_value("armor", "regen_time_multiplier", 1)
		multiplier = multiplier * self:team_upgrade_value("armor", "passive_regen_time_multiplier", 1)
		multiplier = multiplier * self:upgrade_value("player", "perk_armor_regen_timer_multiplier", 1)

		if not moving then
			multiplier = multiplier * managers.player:upgrade_value("player", "armor_regen_timer_stand_still_multiplier", 1)
		end

		return multiplier
	end

	--Leaving stance stuff in parameters for compatability.
	function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
		local chance = self:upgrade_value("player", "passive_dodge_chance", 0)
		
		chance = chance + self:upgrade_value("player", "tier_dodge_chance", 0)

		local detection_risk_add_dodge_chance = managers.player:upgrade_value("player", "detection_risk_add_dodge_chance")
		chance = chance + self:get_value_from_risk_upgrade(detection_risk_add_dodge_chance, detection_risk)
		chance = chance + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_dodge_addend", 0)
		chance = chance + self:upgrade_value("team", "crew_add_dodge", 0)

		return chance
	end

	function PlayerManager:is_damage_health_ratio_active(health_ratio)
		return self:has_category_upgrade("player", "melee_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "melee") > 0 or self:has_category_upgrade("player", "resistance_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "armor_regen") > 0 or self:has_category_upgrade("player", "damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "damage") > 0 or self:has_category_upgrade("player", "movement_speed_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "movement_speed") > 0
	end

	--function PlayerManager:speak(message, arg1, arg2)
	--	self:player_unit():sound():say(message, arg1, arg2)
	--end
		
end