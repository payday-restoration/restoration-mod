--Local functions requested elsewhere. These are vanilla code.
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

local function get_as_digested(amount)
	local list = {}

	for i = 1, #amount do
		table.insert(list, Application:digest_value(amount[i], false))
	end

	return list
end

function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
	local multiplier = 1
	local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1))
	multiplier = multiplier + armor_penalty - 1

	if bonus_multiplier then
		multiplier = multiplier + bonus_multiplier - 1
	end

	if speed_state then
		multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier", 1) - 1
	end

	multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
	multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1

	--Make movespeed bonus from converts vary based on number of converts.
	multiplier = multiplier + self:num_local_minions() * (self:upgrade_value("player", "minion_master_speed_multiplier", 1) - 1)

	--Kingpin movespeed bonus.
	if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") then
		multiplier = multiplier + self:upgrade_value("player", "chico_injector_speed", 1) - 1
	end

	--Moving Target movespeed bonus
	if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
		multiplier = multiplier + self:detection_risk_movement_speed_bonus()
	end

	--Removed unused "secured_bags_multiplier" nonsense.

	--Second Wind
	local damage_speed_multiplier = managers.player:temporary_upgrade_value("temporary", "damage_speed_multiplier", 1)
	multiplier = multiplier + damage_speed_multiplier - 1

	if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then	
		multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)	
	end

	--Removed unused Yakuza nonsense.

	--Titan Taser Slow
	if self:_is_titan_tased() then
		multiplier = multiplier * self:_titan_tase_speed_mult()
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

		--Allow all special weapons to spread panic with skill.
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

	if self._on_killshot_t and t < self._on_killshot_t then
		return
	end

	local regen_armor_bonus = self:upgrade_value("player", "killshot_regen_armor_bonus", 0)
	local dist_sq = mvector3.distance_sq(player_unit:movement():m_pos(), killed_unit:movement():m_pos())
	local close_combat_sq = tweak_data.upgrades.close_combat_distance * tweak_data.upgrades.close_combat_distance

	if dist_sq <= close_combat_sq then
		regen_armor_bonus = regen_armor_bonus + self:upgrade_value("player", "killshot_close_regen_armor_bonus", 0)
		local panic_chance = self:upgrade_value("player", "killshot_close_panic_chance", 0)
			+ self:upgrade_value("player", "killshot_extra_spooky_panic_chance", 0) --Add Haunt skill to panic chance.
			+ self:upgrade_value("player", "killshot_spooky_panic_chance", 0) * self:player_unit():character_damage():get_missing_revives()
		panic_chance = managers.modifiers:modify_value("PlayerManager:GetKillshotPanicChance", panic_chance)

		if panic_chance > 0 or panic_chance == -1 then
			local slotmask = managers.slot:get_mask("enemies")
			local units = World:find_units_quick("sphere", player_unit:movement():m_pos(), tweak_data.upgrades.killshot_close_panic_range, slotmask)

			for e_key, unit in pairs(units) do
				if alive(unit) and unit:character_damage() and not unit:character_damage():dead() then
					unit:character_damage():build_suppression(200, panic_chance)
				end
			end
		end
	end

	if damage_ext and regen_armor_bonus > 0 then
		damage_ext:restore_armor(regen_armor_bonus)
	end

	local regen_health_bonus = 0

	--Yakuza dodge meter generation.
	if damage_ext:health_ratio() < 0.5 then
		if variant == "melee" then
			damage_ext:fill_dodge_meter_yakuza(self:upgrade_value("player", "melee_kill_dodge_regen", 0) + self:upgrade_value("player", "kill_dodge_regen"))
		else
			damage_ext:fill_dodge_meter_yakuza(self:upgrade_value("player", "kill_dodge_regen"))
		end
	end


	if variant == "melee" then
		--Biker Armor Regen
		if self:has_category_upgrade("player", "biker_armor_regen") then
			damage_ext:tick_biker_armor_regen(self:upgrade_value("player", "biker_armor_regen")[3])
		end
		--Boxing Glove Stamina Restore
		local melee_weapon = tweak_data.blackmarket.melee_weapons[managers.blackmarket:equipped_melee_weapon()]
		if melee_weapon.special_weapon and melee_weapon.special_weapon == "stamina_restore" then
			player_unit:movement():add_stamina(player_unit:movement():_max_stamina())
		end

		--Sociopath regen.
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

	--Allow healing over time to be applied to select non-grinder perks using dummy heal_over_time upgrade.
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

	--Load alternate heal over time tweakdata if player is using Infiltrator or Rogue.
	local data = tweak_data.upgrades.damage_to_hot_data
	if self:has_category_upgrade("player", "melee_stacking_heal") then
		data = tweak_data.upgrades.melee_to_hot_data
	elseif self:has_category_upgrade("player", "dodge_stacking_heal") then
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

--Messiah functions updated to work indefinitely but with an increasing number of required kills.
function PlayerManager:refill_messiah_charges()
	if self._max_messiah_charges then --Refill charges.
		self._messiah_charges = self._max_messiah_charges
	end

	self._messiah_kills_required = 1 --Reset number of kills needed.
end

--Called when people jump to get up.
function PlayerManager:use_messiah_charge()
	if self:has_category_upgrade("player", "infinite_messiah") then --If player has infinite messiah, increase kills required and reset counter.
		self._messiah_kills_required = self._messiah_kills_required + 2
		self._messiah_kills = 0
		log("Kills required to messiah = " .. tostring(self._messiah_kills_required))
	elseif self._messiah_charges then --Eat a messiah charge if not infinite.
		self._messiah_charges = math.max(self._messiah_charges - 1, 0)
	end
end

--Called when players get kills while downed.
function PlayerManager:_on_messiah_event()
	if self._current_state == "bleed_out" and not self._coroutine_mgr:is_running("get_up_messiah") then
		self._messiah_kills = self._messiah_kills + 1
		if self._messiah_charges > 0 and self._messiah_kills >= self._messiah_kills_required then
			self._coroutine_mgr:add_coroutine("get_up_messiah", PlayerAction.MessiahGetUp, self)
		end
	end
end

--Calculates bonus from Moving Target.
function PlayerManager:detection_risk_movement_speed_bonus()
	local multiplier = 0
	local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed)
	return multiplier
end

--Used in some sort of groupai state besiege nonsense. Probably not a good idea and also undocumented
--Probs best to nuke this in the future.
function PlayerManager:_chk_fellow_crimin_proximity(unit)
	local players_nearby = 0
	
	local enemies = World:find_units_quick(unit, "sphere", unit:position(), 1500, managers.slot:get_mask("criminals_no_deployables"))

	for _, enemy in ipairs(enemies) do
		players_nearby = players_nearby + 1
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
	--Frenzy now grants deflection instead of damage reduction.
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "revive_damage_reduction", 1)
	multiplier = multiplier * self:get_hostage_bonus_multiplier("damage_dampener") --Might be unused.
	multiplier = multiplier * self._properties:get_property("revive_damage_reduction", 1)
	multiplier = multiplier * self._temporary_properties:get_property("revived_damage_reduction", 1)
	--Removed vanilla crew chief team DR.

	--Yakuza DR.
	if self:is_damage_health_ratio_active(health_ratio) then
		multiplier = multiplier * (1 - self:upgrade_value("player", "resistance_damage_health_ratio_multiplier", 0) * (1 - health_ratio))
	end

	--Removed vanilla crew chief self DR.

	if damage_type == "melee" then
		multiplier = multiplier * self:upgrade_value("player", "melee_damage_dampener", 1)
	end

	local current_state = self:get_current_state()

	if current_state and current_state:_interacting() then
		multiplier = multiplier * self:upgrade_value("player", "interacting_damage_multiplier", 1)
	end
	

	if current_state and current_state:in_melee() then
		local melee_name_id = managers.blackmarket:equipped_melee_weapon()
		if damage_type == "bullet" then --Counter Strike
			multiplier = multiplier * self:upgrade_value("player", "deflect_ranged", 1)
		end

		if tweak_data.blackmarket.melee_weapons[melee_name_id].block then --Buck shield.
			multiplier = multiplier * tweak_data.blackmarket.melee_weapons[melee_name_id].block
		end
	end

	return multiplier
end

--Removed a number of situational buffs in vanilla that might result in dodge points being set wrong.
--Leaving stance stuff in parameters for compatability.
function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
	local chance = self:upgrade_value("player", "passive_dodge_chance", 0)
	
	chance = chance + self:upgrade_value("player", "tier_dodge_chance", 0)

	local detection_risk_add_dodge_chance = self:upgrade_value("player", "detection_risk_add_dodge_chance")
	chance = chance + self:get_value_from_risk_upgrade(detection_risk_add_dodge_chance, detection_risk)
	chance = chance + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_dodge_addend", 0)

	return chance
end

--Now can also trigger from Yakuza DR.
function PlayerManager:is_damage_health_ratio_active(health_ratio)
	return self:has_category_upgrade("player", "melee_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "melee") > 0 or self:has_category_upgrade("player", "resistance_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "armor_regen") > 0 or self:has_category_upgrade("player", "damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "damage") > 0 or self:has_category_upgrade("player", "movement_speed_damage_health_ratio_multiplier") and self:get_damage_health_ratio(health_ratio, "movement_speed") > 0
end

function PlayerManager:health_skill_multiplier()
	local multiplier = 1
	multiplier = multiplier + self:upgrade_value("player", "health_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_health_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("health", "passive_multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("health") - 1
	--Now scales off of number of converts.
	multiplier = multiplier + self:num_local_minions() * (self:upgrade_value("player", "minion_master_health_multiplier", 1) - 1)
	multiplier = multiplier * self:upgrade_value("player", "health_decrease", 1.0) --Anarchist reduces health by expected amount.
	
	return multiplier
end

function PlayerManager:check_skills()
	self:send_message_now("check_skills")
	self._coroutine_mgr:clear()

	self._saw_panic_when_kill = self:has_category_upgrade("saw", "panic_when_kill")
	self._unseen_strike = self:has_category_upgrade("player", "unseen_increased_crit_chance")

	--Make Trigger Happy and Desperado stack off of headshots.
	if self:has_category_upgrade("pistol", "stacked_accuracy_bonus") then
		self._message_system:register(Message.OnHeadShot, self, callback(self, self, "_on_expert_handling_event"))
	else
		self._message_system:unregister(Message.OnHeadShot, self)
	end

	if self:has_category_upgrade("pistol", "stacking_hit_damage_multiplier") then
		self._message_system:register(Message.OnHeadShot, "trigger_happy", callback(self, self, "_on_enter_trigger_happy_event"))
	else
		self._message_system:unregister(Message.OnHeadShot, "trigger_happy")
	end

	if self:has_category_upgrade("player", "melee_damage_stacking") then
		local function start_bloodthirst_base(weapon_unit, variant)
			if variant ~= "melee" and not self._coroutine_mgr:is_running(PlayerAction.BloodthirstBase) then
				local data = self:upgrade_value("player", "melee_damage_stacking", nil)

				if data and type(data) ~= "number" then
					self._coroutine_mgr:add_coroutine(PlayerAction.BloodthirstBase, PlayerAction.BloodthirstBase, self, data.melee_multiplier, data.max_multiplier)
				end
			end
		end

		self._message_system:register(Message.OnEnemyKilled, "bloodthirst_base", start_bloodthirst_base)
	else
		self._message_system:unregister(Message.OnEnemyKilled, "bloodthirst_base")
	end


	if self:has_category_upgrade("player", "messiah_revive_from_bleed_out") then
		self._messiah_charges = self:upgrade_value("player", "messiah_revive_from_bleed_out", 0)
		self._messiah_charges = 0	--Messiah init stuff to handle how the skill was changed.
		self._messiah_kills_required = 1
		self._messiah_kills = 0
		self._max_messiah_charges = self._messiah_charges
		self._message_system:register(Message.OnEnemyKilled, "messiah_revive_from_bleed_out", callback(self, self, "_on_messiah_event"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "messiah_revive_from_bleed_out")
	end

	if self:has_category_upgrade("player", "recharge_messiah") then
		self._message_system:register(Message.OnDoctorBagUsed, "recharge_messiah", callback(self, self, "_on_messiah_recharge_event"))
	else
		self._message_system:unregister(Message.OnDoctorBagUsed, "recharge_messiah")
	end

	if self:has_category_upgrade("player", "double_drop") then
		self._target_kills = self:upgrade_value("player", "double_drop", 0)

		self._message_system:register(Message.OnEnemyKilled, "double_ammo_drop", callback(self, self, "_on_spawn_extra_ammo_event"))
	else
		self._target_kills = 0

		self._message_system:unregister(Message.OnEnemyKilled, "double_ammo_drop")
	end

	if self:has_category_upgrade("temporary", "single_shot_fast_reload") then
		self._message_system:register(Message.OnLethalHeadShot, "activate_aggressive_reload", callback(self, self, "_on_activate_aggressive_reload_event"))
	else
		self._message_system:unregister(Message.OnLethalHeadShot, "activate_aggressive_reload")
	end

	if self:has_category_upgrade("player", "head_shot_ammo_return") then
		self._ammo_efficiency = self:upgrade_value("player", "head_shot_ammo_return", nil)

		self._message_system:register(Message.OnHeadShot, "ammo_efficiency", callback(self, self, "_on_enter_ammo_efficiency_event"))
	else
		self._ammo_efficiency = nil

		self._message_system:unregister(Message.OnHeadShot, "ammo_efficiency")
	end

	if self:has_category_upgrade("player", "melee_kill_increase_reload_speed") then
		self._message_system:register(Message.OnEnemyKilled, "bloodthirst_reload_speed", callback(self, self, "_on_enemy_killed_bloodthirst"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "bloodthirst_reload_speed")
	end

	if self:has_category_upgrade("player", "super_syndrome") then
		self._super_syndrome_count = self:upgrade_value("player", "super_syndrome")
	else
		self._super_syndrome_count = 0
	end

	--New resmod skills for dodge.
	if self:has_category_upgrade("player", "dodge_stacking_heal") then
		self:register_message(Message.OnPlayerDodge, "dodge_stack_health_regen", callback(self, self, "_dodge_stack_health_regen"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_stack_health_regen")
	end

	if self:has_category_upgrade("player", "bomb_cooldown_reduction") then
		self:register_message(Message.OnPlayerDodge, "dodge_smokebomb_cdr", callback(self, self, "_dodge_smokebomb_cdr"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_smokebomb_cdr")
	end

	if self:has_category_upgrade("player", "dodge_heal_no_armor") then
		self:register_message(Message.OnPlayerDodge, "dodge_healing_no_armor", callback(self, self, "_dodge_healing_no_armor"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_healing_no_armor")
	end

	if managers.blackmarket:equipped_grenade() == "smoke_screen_grenade" then
		local function speed_up_on_kill()
			if #managers.player:smoke_screens() == 0 then
				managers.player:speed_up_grenade_cooldown(1)
			end
		end

		self:register_message(Message.OnEnemyKilled, "speed_up_smoke_grenade", speed_up_on_kill)
	else
		self:unregister_message(Message.OnEnemyKilled, "speed_up_smoke_grenade")
	end

	self:add_coroutine("damage_control", PlayerAction.DamageControl)

	if self:has_category_upgrade("snp", "graze_damage") then
		self:register_message(Message.OnWeaponFired, "graze_damage", callback(SniperGrazeDamage, SniperGrazeDamage, "on_weapon_fired"))
	else
		self:unregister_message(Message.OnWeaponFired, "graze_damage")
	end
end

--The OnHeadShot message must now pass in attack data and unit info to let certains skills work as expected.
--IE: Ammo Efficiency not proccing off of melee headshots.
function PlayerManager:on_headshot_dealt(unit, attack_data)
	local player_unit = self:player_unit()

	if not player_unit then
		return
	end

	self._message_system:notify(Message.OnHeadShot, nil, unit, attack_data)

	local t = Application:time()

	if self._on_headshot_dealt_t and t < self._on_headshot_dealt_t then
		return
	end

	self._on_headshot_dealt_t = t + (tweak_data.upgrades.on_headshot_dealt_cooldown or 0)
	local damage_ext = player_unit:character_damage()
	local regen_armor_bonus = managers.player:upgrade_value("player", "headshot_regen_armor_bonus", 0)

	if damage_ext and regen_armor_bonus > 0 then
		damage_ext:restore_armor(regen_armor_bonus)
	end
end

--Add extra checks to make sure that it only looks for killing headshots done with valid guns.
function PlayerManager:_on_enter_ammo_efficiency_event(unit, attack_data)
	if not self._coroutine_mgr:is_running("ammo_efficiency") then
		local weapon_unit = self:equipped_weapon_unit()
		local attacker_unit = attack_data.attacker_unit
		local variant = attack_data.variant

		if attacker_unit == self:player_unit() and variant == "bullet" and weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("smg", "assault_rifle", "snp") and attack_data.result.type == "death" then
			self._coroutine_mgr:add_coroutine("ammo_efficiency", PlayerAction.AmmoEfficiency, self, self._ammo_efficiency.headshots, self._ammo_efficiency.ammo, Application:time() + self._ammo_efficiency.time)
		end
	end
end

--Get health damage reduction gained via skills.
function PlayerManager:get_deflection_from_skills()
	--"""Upgrade"""
	if self:has_category_upgrade("player", "no_deflection") then
		return -self:body_armor_value("deflection", nil, 0)
	end

	return 
		  self:upgrade_value("player", "deflection_addend", 0)
		+ self:upgrade_value("player", "frenzy_deflection", 0)
end

function PlayerManager:get_max_grenades(grenade_id)
	grenade_id = grenade_id or managers.blackmarket:equipped_grenade()
	local max_amount = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "max_amount") or 0

	--Jack of all trades basic grenade count increase.
	--MAY be source of grenade syncing issues due to interaction with get_max_grenades_by_peer_id(). Is worth investigating some time.
	if max_amount and not tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown") then
		max_amount = math.ceil(max_amount * self:upgrade_value("player", "throwables_multiplier", 1.0))
	end
	max_amount = managers.modifiers:modify_value("PlayerManager:GetThrowablesMaxAmount", max_amount)

	return max_amount
end

function PlayerManager:_internal_load()
	local player = self:player_unit()

	if not player then
		return
	end

	local default_weapon_selection = 1
	local secondary = managers.blackmarket:equipped_secondary()
	local secondary_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
	local texture_switches = managers.blackmarket:get_weapon_texture_switches("secondaries", secondary_slot, secondary)

	player:inventory():add_unit_by_factory_name(secondary.factory_id, default_weapon_selection == 1, false, secondary.blueprint, secondary.cosmetics, texture_switches)

	local primary = managers.blackmarket:equipped_primary()

	if primary then
		local primary_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		local texture_switches = managers.blackmarket:get_weapon_texture_switches("primaries", primary_slot, primary)

		player:inventory():add_unit_by_factory_name(primary.factory_id, default_weapon_selection == 2, false, primary.blueprint, primary.cosmetics, texture_switches)
	end

	player:inventory():set_melee_weapon(managers.blackmarket:equipped_melee_weapon())

	local peer_id = managers.network:session():local_peer():id()
	local grenade, amount = managers.blackmarket:equipped_grenade()

	if self:has_grenade(peer_id) then
		amount = self:get_grenade_amount(peer_id) or amount
	end

	if amount and not grenade.base_cooldown then --*Should* stop perk deck actives from being increased.
		amount = managers.modifiers:modify_value("PlayerManager:GetThrowablesMaxAmount", amount) --Crime spree throwables mod.
		amount = math.ceil(amount * self:upgrade_value("player", "throwables_multiplier", 1.0)) --JOAT Basic
	end

	self:_set_grenade({
		grenade = grenade,
		amount = math.min(amount, self:get_max_grenades())
	})
	self:_set_body_bags_amount(self._local_player_body_bags or self:total_body_bags())

	if not self._respawn then
		self:_add_level_equipment(player)
		self._down_time = tweak_data.player.damage.DOWNED_TIME --Tracks down time for custody purposes.
		for i, name in ipairs(self._global.default_kit.special_equipment_slots) do
			local ok_name = self._global.equipment[name] and name

			if ok_name then
				local upgrade = tweak_data.upgrades.definitions[ok_name]

				if upgrade and (upgrade.slot and upgrade.slot < 2 or not upgrade.slot) then
					self:add_equipment({
						silent = true,
						equipment = upgrade.equipment_id
					})
				end
			end
		end

		local slot = 2

		if self:has_category_upgrade("player", "second_deployable") then
			slot = 3
		else
			self:set_equipment_in_slot(nil, 2)
		end

		local equipment_list = self:equipment_slots()

		for i, name in ipairs(equipment_list) do
			local ok_name = self._global.equipment[name] and name or self:equipment_in_slot(i)

			if ok_name then
				local upgrade = tweak_data.upgrades.definitions[ok_name]

				if upgrade and (upgrade.slot and upgrade.slot < slot or not upgrade.slot) then
					self:add_equipment({
						silent = true,
						equipment = upgrade.equipment_id,
						slot = i
					})
				end
			end
		end

		self:update_deployable_selection_to_peers()
	else --If someone is respawning from custody, apply relevant penalties.
		for id, weapon in pairs(player:inventory():available_selections()) do
			if alive(weapon.unit) then
				weapon.unit:base():remove_ammo(tweak_data.player.damage.custody_ammo_kept)
				managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
			end
		end
		self._down_time = self._down_time - tweak_data.player.damage.DOWNED_TIME_DEC
		player:character_damage():exit_custody(math.max(tweak_data.player.damage.DOWNED_TIME_MIN, self._down_time))
	end

	if self:has_category_upgrade("player", "cocaine_stacking") then
		self:update_synced_cocaine_stacks_to_peers(0, self:upgrade_value("player", "sync_cocaine_upgrade_level", 1), self:upgrade_level("player", "cocaine_stack_absorption_multiplier", 0))
		managers.hud:set_info_meter(nil, {
			icon = "guis/dlcs/coco/textures/pd2/hud_absorb_stack_icon_01",
			max = 1,
			current = self:get_local_cocaine_damage_absorption_ratio(),
			total = self:get_local_cocaine_damage_absorption_max_ratio()
		})
	end

	self:update_cocaine_hud()

	local equipment = self:selected_equipment()

	if equipment then
		add_hud_item(get_as_digested(equipment.amount), equipment.icon)
	end

	--Removed armor kit weirdness.
end

--Adds rogue health regen stack on dodge.
function PlayerManager:_dodge_stack_health_regen()
	self:player_unit():character_damage():add_damage_to_hot()
end

--Cuts Sicario smock bomb cooldown on dodge.
function PlayerManager:_dodge_smokebomb_cdr()
	self:speed_up_grenade_cooldown(tweak_data.upgrades.values.player.bomb_cooldown_reduction[1])
end

--Fills dodge meter when backstab kills are done.
function PlayerManager:add_backstab_dodge()
	if self.player_unit then
		local damage_ext = self:player_unit():character_damage()
		damage_ext:fill_dodge_meter(damage_ext:get_dodge_points() * self:upgrade_value("player", "backstab_dodge", 0))
	end
end

--Sneaky Bastard Aced healing stuff.
function PlayerManager:_dodge_healing_no_armor()
	local damage_ext = self:player_unit():character_damage()
	if not (damage_ext:get_real_armor() > 0) then
		damage_ext:restore_health(self:upgrade_value("player", "dodge_heal_no_armor"), false)
	end
end

--Adds doctor bag health regen.
function PlayerManager:health_regen()
	local health_regen = tweak_data.player.damage.HEALTH_REGEN
	health_regen = health_regen + self:temporary_upgrade_value("temporary", "wolverine_health_regen", 0)
	health_regen = health_regen + self:upgrade_value("player", "passive_health_regen", 0)

	if self:is_db_regen_active() then
		health_regen = health_regen + tweak_data.upgrades.values.doctor_bag.passive_regen
	end

	return health_regen
end

--Move hostage taker to flat # regen from % regen.
function PlayerManager:fixed_health_regen()
	local health_regen = 0
	health_regen = health_regen + self:upgrade_value("team", "crew_health_regen", 0)
	health_regen = health_regen + self:get_hostage_bonus_addend("health_regen")

	return health_regen
end

--DB management.
function PlayerManager:activate_db_regen()
	self._db_regen_endtime = Application:time() + tweak_data.upgrades.values.doctor_bag.passive_regen_duration
end

function PlayerManager:deactivate_db_regen()
	self._db_regen_endtime = nil
end

function PlayerManager:is_db_regen_active()
	if self._db_regen_endtime and Application:time() < self._db_regen_endtime then
		return true
	end
	return false
end

--Titan taser effect, will make more generic later when needed.
function PlayerManager:activate_titan_tased()
	self._titan_tase_time = 3 + Application:time()
	managers.hud:activate_effect_screen(3, {0.0, 0.2, 1})
end

function PlayerManager:_is_titan_tased()
	if self._titan_tase_time and self._titan_tase_time > Application:time() then
		return true
	end 
	return false
end

function PlayerManager:_titan_tase_speed_mult()
	return 1 / (self._titan_tase_time - Application:time() + 1)
end

--Called when psychoknife kills are performed.
function PlayerManager:spread_psycho_knife_panic()
	local pos = self:player_unit():position()
	local area = 1000
	local chance = 1
	local amount = 200
	local enemies = World:find_units_quick("sphere", pos, area, 12, 21)

	for i, unit in ipairs(enemies) do
		if unit:character_damage() then
			unit:character_damage():build_suppression(amount, chance)
		end
	end
end

--Should help stop Trip Mines and ECMs from becoming embeded in the floor.
function PlayerManager:check_selected_equipment_placement_valid(player)
	local equipment_data = managers.player:selected_equipment()
	if not equipment_data then
		return false
	end
	
	if equipment_data.equipment == "trip_mine" or equipment_data.equipment == "ecm_jammer" then
		return player:equipment():valid_look_at_placement(tweak_data.equipments[equipment_data.equipment]) and true or false
	else
		return player:equipment():valid_shape_placement(equipment_data.equipment, tweak_data.equipments[equipment_data.equipment]) and true or false
	end
end
