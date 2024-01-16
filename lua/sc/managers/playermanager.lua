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

Hooks:PostHook(PlayerManager, "init", "ResInit", function(self)
	--Info for slow debuff, usually caused by Titan Tasers.
	self._slow_data = {
		duration = 0, --Amount of time the slow should decay over.
		power = 0, --% slow when first started.
		start_time = 0 --Time when slow was started.
	}
end)

--Had to do this cause Bodybag base was being a bastard
function PlayerManager:has_max_body_bags()
	return false
end

--Make armor bot boost increase armor by % instead of adding.
function PlayerManager:body_armor_skill_multiplier(override_armor)
	local multiplier = 1
	multiplier = multiplier + self:upgrade_value("player", "tier_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "armor_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("armor", "multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("armor") - 1
	multiplier = multiplier + self:upgrade_value("player", "perk_armor_loss_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "chico_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "mrwi_armor_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("team", "crew_add_armor", 1) - 1 --Added bot armor boost.

	return multiplier
end

function PlayerManager:body_armor_skill_addend(override_armor)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]
	local addend = 0
	addend = addend + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_armor_addend", 0)

	--Grinder Flak Jacket armor modifier
	if armor_data.upgrade_level == 5 then
		addend = addend + self:upgrade_value("player", "level_5_armor_addend_grinder", 0)
	end

	if self:has_category_upgrade("player", "armor_increase") then
		local health_multiplier = self:health_skill_multiplier()
		local max_health = (PlayerDamage._HEALTH_INIT + self:health_skill_addend()) * health_multiplier
		addend = addend + max_health * self:upgrade_value("player", "armor_increase", 1)
	end

	--Removed bot armor boost.

	return addend
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
		multiplier = multiplier + self:upgrade_value("player", "mrwi_" .. speed_state .. "_speed_multiplier", 1) - 1
		
		--Burglar
		multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier_burglar", 1) - 1
	end
		
	multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
	multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1

	--Kingpin movespeed bonus.
	if self:has_activate_temporary_upgrade("temporary", "chico_injector") then
		multiplier = multiplier + self:upgrade_value("player", "chico_injector_speed", 1) - 1
	end

	--Moving Target movespeed bonus
	if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
		multiplier = multiplier + self:detection_risk_movement_speed_bonus()
	end

	--Grinder and hitman speed bonuses.
	local player_unit = self:player_unit()
	if alive(player_unit) then
		local hot_stacks = player_unit:character_damage()._damage_to_hot_stack
		multiplier = multiplier + self:upgrade_value("player", "hot_speed_bonus", 0) * #hot_stacks or 0

		--Hitman movespeed bonus
		if player_unit:character_damage():has_temp_health() then
			multiplier = multiplier + self:upgrade_value("player", "temp_health_speed", 1) - 1
		end
	end

	--Removed unused "secured_bags_multiplier" nonsense.

	--Second Wind
	local damage_speed_multiplier = managers.player:temporary_upgrade_value("temporary", "damage_speed_multiplier", 1)
	multiplier = multiplier + damage_speed_multiplier - 1

	if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then	
		multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)	
	end

	--Removed unused Yakuza nonsense.

	--Apply any slowing debuffs.
	multiplier = multiplier * self:_slow_debuff_mult()
	
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
	
	local selection_index = equipped_unit and equipped_unit:base() and equipped_unit:base():selection_index() or 0

	if selection_index == 1 and self._has_secondary_reload_primary then
		local kills_to_reload = self:upgrade_value("player", "secondary_reload_primary", 10)
		local secondary_kills = self:get_property("secondary_reload_primary_kills", 0) + 1

		if kills_to_reload <= secondary_kills then
			local primary_unit = player_unit:inventory():unit_by_selection(2)
			local primary_base = alive(primary_unit) and primary_unit:base()
			local can_reload = primary_base and primary_base.can_reload and primary_base:can_reload()

			if can_reload then
				primary_base:on_reload()
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(primary_base:selection_index(), primary_base:ammo_info())
			end

			secondary_kills = 0
		end

		self:set_property("secondary_reload_primary_kills", secondary_kills)
	elseif selection_index == 2 and self._has_primary_reload_secondary then
		local kills_to_reload = self:upgrade_value("player", "primary_reload_secondary", 10)
		local primary_kills = self:get_property("primary_reload_secondary_kills", 0) + 1

		if kills_to_reload <= primary_kills then
			local secondary_unit = player_unit:inventory():unit_by_selection(1)
			local secondary_base = alive(secondary_unit) and secondary_unit:base()
			local can_reload = secondary_base and secondary_base.can_reload and secondary_base:can_reload()

			if can_reload then
				secondary_base:on_reload()
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(secondary_base:selection_index(), secondary_base:ammo_info())
			end

			primary_kills = 0
		end

		self:set_property("primary_reload_secondary_kills", primary_kills)
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
	
	--Leech stuff
	if self:has_activate_temporary_upgrade("temporary", "copr_ability") then
		local kill_life_leech = self:upgrade_value_nil("player", "copr_kill_life_leech")
		local static_damage_ratio = self:upgrade_value_nil("player", "copr_static_damage_ratio")

		if kill_life_leech and static_damage_ratio and damage_ext then
			self._copr_kill_life_leech_num = (self._copr_kill_life_leech_num or 0) + 1

			if kill_life_leech <= self._copr_kill_life_leech_num then
				self._copr_kill_life_leech_num = 0
				local current_health_ratio = damage_ext:health_ratio()
				local wanted_health_ratio = math.floor((current_health_ratio + 0.01 + static_damage_ratio) / static_damage_ratio) * static_damage_ratio
				local health_regen = wanted_health_ratio - current_health_ratio

				if health_regen > 0 then
					damage_ext:restore_health(health_regen)
					damage_ext:on_copr_killshot()
				end
			end
		end
	end	

	--Yakuza dodge meter generation.
	if damage_ext:health_ratio() < 1 then
		if variant == "melee" then
			damage_ext:fill_dodge_meter_yakuza(self:upgrade_value("player", "melee_kill_dodge_regen", 0) + self:upgrade_value("player", "kill_dodge_regen"))
			damage_ext:give_yakuza_bonus_grace()
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
		if melee_weapon.special_weapon and melee_weapon.special_weapon == "charger" then
			local current_state = self:get_current_state()
			if current_state and current_state._state_data and current_state._state_data._charger_melee_active then
				player_unit:movement():add_stamina(player_unit:movement():_max_stamina() * 0.1)
			end
		end
	end

	local killshot_cooldown_reduction = (variant and variant == "melee" and tweak_data.upgrades.on_killshot_cooldown_reduction_melee) or tweak_data.upgrades.on_killshot_cooldown_reduction or 0

	local regen_armor_bonus = self:upgrade_value("player", "killshot_regen_armor_bonus", 0)
	local dist_sq = mvector3.distance_sq(player_unit:movement():m_pos(), killed_unit:movement():m_pos())
	local close_combat_sq = tweak_data.upgrades.close_combat_distance * tweak_data.upgrades.close_combat_distance
	
	if dist_sq <= close_combat_sq then
		if self:has_category_upgrade("player", "killshot_close_regen_armor_bonus") then
			local killshot_close_regen_armor_bonus = self:upgrade_value("player", "killshot_close_regen_armor_bonus", 0)[1] * ((variant and variant == "melee" and self:upgrade_value("player", "killshot_close_regen_armor_bonus", 0)[2]) or 1)
			regen_armor_bonus = regen_armor_bonus + killshot_close_regen_armor_bonus
		end
		local socio_panic_available = self._on_killshot_t and t > (self._on_killshot_t - killshot_cooldown_reduction) and self:has_category_upgrade("player", "killshot_close_panic_chance")
		local panic_chance = (socio_panic_available and (self:upgrade_value("player", "killshot_close_panic_chance", 0) * ((variant and variant == "melee" and 2) or 1)) or 0)
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

	--Sociopath killshot cooldown and effects (THINGS NOT EXCLUSIVELY RELATED TO SOCIOPATH'S COOLDOWNS SHOULD NOT BE BELOW THIS)
	if self._on_killshot_t and t < self._on_killshot_t then
		if self:has_category_upgrade("player", "killshot_regen_armor_bonus") then
			self._on_killshot_t = self._on_killshot_t - killshot_cooldown_reduction
			managers.hud:change_cooldown("sociopath", -killshot_cooldown_reduction)
		end
		if self._on_killshot_t > t then
			return
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

	if self:has_category_upgrade("player", "killshot_regen_armor_bonus") then
		managers.hud:start_buff("sociopath", (tweak_data.upgrades.on_killshot_cooldown or 0))
	end

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

	if damage_info.is_fire_dot_damage or damage_info.is_fire_pool_damage then
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

--Messiah functions updated to work indefinitely but with a cooldown.
function PlayerManager:refill_messiah_charges()
	if self._max_messiah_charges then --Refill charges.
		self._messiah_charges = self._max_messiah_charges
	end

	self._messiah_cooldown = 0
end

--Called when people jump to get up.
function PlayerManager:use_messiah_charge()
	if self:has_category_upgrade("player", "infinite_messiah") then --If player has infinite messiah, set the cooldown timer.
		self._messiah_cooldown = Application:time() + 120 --Replace with tweakdata once we settle on something.
		managers.hud:start_cooldown("messiah", 120)
	elseif self._messiah_charges then --Eat a messiah charge if not infinite.
		self._messiah_charges = math.max(self._messiah_charges - 1, 0)
		managers.hud:remove_skill("messiah")
	end
end

--Called when players get kills while downed.
function PlayerManager:_on_messiah_event()
	if self._current_state == "bleed_out" and not self._coroutine_mgr:is_running("get_up_messiah") then
		self._messiah_cooldown = self._messiah_cooldown - 10 --Downed kill CDR.
		managers.hud:change_cooldown("messiah", -10)
		if self._messiah_charges > 0 and self._messiah_cooldown < Application:time() then
			self._coroutine_mgr:add_coroutine("get_up_messiah", PlayerAction.MessiahGetUp, self)
		end
	end
end

--Calculates bonus from Moving Target.
function PlayerManager:detection_risk_movement_speed_bonus()
	local multiplier = 0
	local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed, self._detection_risk)
	return multiplier
end

--Remove some unused skills, and make use of cached detection risk value.
function PlayerManager:critical_hit_chance(detection_risk)
	local multiplier = 0
	multiplier = multiplier + self:upgrade_value("player", "critical_hit_chance", 0)
	multiplier = multiplier + self:upgrade_value("weapon", "critical_hit_chance", 0)
	multiplier = multiplier + managers.player:temporary_upgrade_value("temporary", "unseen_strike", 1) - 1
	multiplier = multiplier + self._crit_mul - 1
	local detection_risk_add_crit_chance = managers.player:upgrade_value("player", "detection_risk_add_crit_chance")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_crit_chance, self._detection_risk)
	local mutator = nil

	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)
	end

	if mutator and mutator.additional_critical_chance then
		multiplier = multiplier + mutator:additional_critical_chance()
	end	

	--OFFYERROCKER'S MERC PERK DECK
	--[ [
		if self:has_category_upgrade("player","kmerc_crit_chance_per_max_armor") then
			local upgrade_data = self:upgrade_value("player","kmerc_crit_chance_per_max_armor")
			local player_unit = self:local_player()
			if alive(player_unit) then
				local rate_crit = upgrade_data.crit_chance
				local rate_armor = upgrade_data.armor_points
				local dmg_ext = player_unit:character_damage()
				local max_armor = dmg_ext:_max_armor()
				
				local bonus = math.floor(max_armor / rate_armor) * rate_crit
				multiplier = multiplier + bonus
			end
		end
	--]]

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

	--OFFYERROCKER'S LIB PERK DECK
	--[ [
		if self:has_category_upgrade("player","tachi_hot_cancelled_damage_resistance_consolation") then 
			multiplier = multiplier * (1 - self:get_property("tachi_damage_resistance",0))
		end
	--]]

	--Yakuza DR.
	local health_ratio = self:player_unit():character_damage():health_ratio()
	if self:is_damage_health_ratio_active(health_ratio) then
		multiplier = multiplier * (1 - self:upgrade_value("player", "resistance_damage_health_ratio_multiplier", 0) * (1 - health_ratio))
	end

	--Removed vanilla crew chief self DR.

	if damage_type == "melee" then
		multiplier = multiplier * self:upgrade_value("player", "melee_damage_dampener", 1)
	elseif damage_type == "kick_or_shock" then --Cloaker kicks/taser shocks
		multiplier = multiplier * self:upgrade_value("player", "spooc_damage_resist", 1.0)
	end

	local current_state = self:get_current_state()

	if current_state then
		if current_state:_interacting() then
			multiplier = multiplier * self:upgrade_value("player", "interacting_damage_multiplier", 1)
		elseif current_state:in_melee() then
			local melee_name_id = managers.blackmarket:equipped_melee_weapon()
			if damage_type == "bullet" then --Counter Strike
				multiplier = multiplier * self:upgrade_value("player", "deflect_ranged", 1)
			end

			if tweak_data.blackmarket.melee_weapons[melee_name_id].block then --Buck shield.
				multiplier = multiplier * tweak_data.blackmarket.melee_weapons[melee_name_id].block
			end
		end
	end
	
	if self._current_state == "bipod" then
		multiplier = multiplier * self:upgrade_value("player", "bipod_damage_reduction", 1)	
	elseif current_state and current_state._state_data.ducking then
		multiplier = multiplier * self:upgrade_value("player", "crouching_damage_reduction", 1)
	end

	return multiplier
end

--Removed a number of situational buffs in vanilla that might result in dodge points being set wrong.
--Leaving stance stuff in parameters for compatability.
function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
	local chance = self:upgrade_value("player", "passive_dodge_chance", 0)
	chance = chance + self:upgrade_value("player", "mrwi_dodge_chance", 0)
	
	chance = chance + self:upgrade_value("player", "tier_dodge_chance", 0)

	local detection_risk_add_dodge_chance = self:upgrade_value("player", "detection_risk_add_dodge_chance")
	chance = chance + self:get_value_from_risk_upgrade(detection_risk_add_dodge_chance, self._detection_risk)
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
	multiplier = multiplier * self:upgrade_value("player", "health_decrease", 1.0) --Anarchist reduces health by expected amount.
	multiplier = multiplier + self:upgrade_value("player", "mrwi_health_multiplier", 1) - 1

	--OFFYERROCKER'S MERC PERK DECK
		multiplier = multiplier + self:upgrade_value("player","kmerc_passive_health_multiplier", 1) - 1
	
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
		self._max_messiah_charges = self._messiah_charges
		self._messiah_cooldown = 0
		self._message_system:register(Message.OnEnemyKilled, "messiah_revive_from_bleed_out", callback(self, self, "_on_messiah_event"))
	else
		self._messiah_charges = 0	--Messiah init stuff to handle how the skill was changed.
		self._max_messiah_charges = self._messiah_charges
		self._messiah_cooldown = 0
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
	
	if managers.mutators:is_mutator_active(MutatorPiggyBank) then
		self._message_system:register(Message.OnLethalHeadShot, "play_pda9_headshot", callback(self, self, "_play_pda9_headshot_event"))
	elseif managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		self._message_system:register(Message.OnLethalHeadShot, "play_pda9_headshot", callback(self, self, "_play_pda9_headshot_event"))
	else
		self._message_system:unregister(Message.OnLethalHeadShot, "play_pda9_headshot")
	end
	
	self._has_primary_reload_secondary = self:has_category_upgrade("player", "primary_reload_secondary")
	self._has_secondary_reload_primary = self:has_category_upgrade("player", "secondary_reload_primary")

	self:set_property("primary_reload_secondary_kills", 0)
	self:set_property("secondary_reload_primary_kills", 0)
	
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
				managers.player:speed_up_grenade_cooldown(2)
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

	if self:has_category_upgrade("player", "special_double_drop") then
		self._message_system:register(Message.OnEnemyKilled, "special_double_ammo_drop", callback(self, self, "_on_spawn_special_ammo_event"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "special_double_ammo_drop")
	end

	if self:has_category_upgrade("temporary", "headshot_fire_rate_mult") then
		self._message_system:register(Message.OnHeadShot, "sharpshooter", callback(self, self, "_trigger_sharpshooter"))
	else
		self._message_system:unregister(Message.OnHeadShot, "sharpshooter")
	end

	if self:has_category_upgrade("player", "store_temp_health") then
		self._message_system:register(Message.OnEnemyKilled, "hitman_temp_health", callback(self, self, "_trigger_hitman")) --Triggers include killing his dog and stealing his car.
	else
		self._message_system:unregister(Message.OnEnemyKilled, "hitman_temp_health")
	end

	if self:has_category_upgrade("player", "armor_health_store_amount") then
		self._message_system:register(Message.OnEnemyKilled, "expres_store_health", callback(self, self, "_trigger_expres"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "expres_store_health")
	end

	--OFFYERROCKER'S MERC PERK DECK
	--[ [
		if self:has_category_upgrade("player","kmerc_fatal_triggers_invuln") then
			self:set_property("kmerc_invuln_ready",true)
		else
			self:remove_property("kmerc_invuln_ready")
		end
	--]]
	--OFFYERROCKER'S LIB PERK DECK
	--[ [
		if self:has_category_upgrade("player","tachi_base") then 
			local base_upgrade_data = self:upgrade_value("player","tachi_base")
			local cooldown_drain = base_upgrade_data.cooldown_drain_per_kill
			
			self:register_message(Message.OnEnemyKilled,"tachi_syringe_cooldown_drain_on_kill",
				function(equipped_unit,variant,killed_unit)
					local player = self:local_player()
					if alive(player) then
						managers.player:speed_up_grenade_cooldown(cooldown_drain)
					end
				end
			)
			
		else
			self:unregister_message(Message.OnEnemyKilled,"tachi_syringe_cooldown_drain_on_kill")
		end
	--]]
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

	local regen_health_bonus = managers.player:upgrade_value("player", "headshot_regen_health_bonus", 0)

	if damage_ext and regen_health_bonus > 0 then
		damage_ext:restore_health(regen_health_bonus, true)
	end
end

function PlayerManager:on_lethal_headshot_dealt(attacker_unit, attack_data)
	if not self:player_unit() or attacker_unit ~= self:player_unit() then
		return
	end

	self._message_system:notify(Message.OnLethalHeadShot, nil, attack_data)

	local regen_armor_bonus_cd_reduction = managers.player:upgrade_value("player", "headshot_regen_armor_bonus_cd_reduction", 0)
	local anarchist = managers.player:has_category_upgrade("player", "armor_grinding")
	if self._on_headshot_dealt_t and not anarchist then
		self._on_headshot_dealt_t = self._on_headshot_dealt_t - regen_armor_bonus_cd_reduction
	end
end

--Add extra checks to make sure that it only looks for killing headshots done with valid guns.
function PlayerManager:_on_enter_ammo_efficiency_event(unit, attack_data)
	if not self._coroutine_mgr:is_running("ammo_efficiency") then
		local weapon_unit = self:equipped_weapon_unit()
		local attacker_unit = attack_data.attacker_unit
		local variant = attack_data.variant

		if self._ammo_efficiency and attacker_unit == self:player_unit() and variant == "bullet" and weapon_unit and weapon_unit:base():is_category("assault_rifle", "snp") and attack_data.result.type == "death" then
			self._coroutine_mgr:add_coroutine("ammo_efficiency", PlayerAction.AmmoEfficiency, self, self._ammo_efficiency.headshots, self._ammo_efficiency.ammo, Application:time() + self._ammo_efficiency.time)
		end
	end
end

--Get health damage reduction gained via skills.
--Crashes mentioning this function mean that there is a syntax error in the file.
function PlayerManager:get_deflection_from_skills()
	return self:upgrade_value("player", "deflection_addend", 0)
end

function PlayerManager:get_max_grenades(grenade_id)
	grenade_id = grenade_id or managers.blackmarket:equipped_grenade()
	local max_amount = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "max_amount") or 0

	--Jack of all trades basic grenade count increase.
	--MAY be source of grenade syncing issues due to interaction with get_max_grenades_by_peer_id(). Is worth investigating some time.
	local is_perk_throwable = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown") and not tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown_no_perk")
	if max_amount and not is_perk_throwable then
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

	player:inventory():hide_equipped_unit()
	player:inventory():set_melee_weapon(managers.blackmarket:equipped_melee_weapon())

	local peer_id = managers.network:session():local_peer():id()
	local grenade, amount = managers.blackmarket:equipped_grenade()

	if self:has_grenade(peer_id) then
		amount = self:get_grenade_amount(peer_id) or amount
	end
	
	local is_perk_throwable = grenade.base_cooldown and not grenade.base_cooldown_no_perk
	if amount and not is_perk_throwable then --*Should* stop perk deck actives from being increased.
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
				weapon.unit:base():remove_ammo(tweak_data.player.damage.custody_ammo_drained)
				managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
			end
		end
		self._down_time = self._down_time - tweak_data.player.damage.DOWNED_TIME_DEC
		player:character_damage():exit_custody(math.max(tweak_data.player.damage.DOWNED_TIME_MIN, self._down_time))
	end

	if self:has_category_upgrade("player", "messiah_revive_from_bleed_out") then
		managers.hud:add_skill("messiah")
	end

	if self:has_category_upgrade("cooldown", "long_dis_revive") then
		managers.hud:add_skill("long_dis_revive")
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

	--Fully loaded aced checks
	self._throwable_chance_data = self:upgrade_value("player", "regain_throwable_from_ammo", {chance = 0.01, chance_inc = 0})
	self._throwable_chance = self._throwable_chance_data.chance

	--Reset when players are spawned, just in case.
	self._slow_data = {
		duration = 0,
		power = 0,
		start_time = 0
	}

	--Precache detection risk, so that the value does not need to be recalculated every frame (very slow).
	self._detection_risk = math.round(managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75) * 100)
end

--Adds rogue health regen stack on dodge.
function PlayerManager:_dodge_stack_health_regen()
	self:player_unit():character_damage():add_damage_to_hot()
end

--Cuts Sicario smock bomb cooldown on dodge.
function PlayerManager:_dodge_smokebomb_cdr()
	self:speed_up_grenade_cooldown(tweak_data.upgrades.values.player.bomb_cooldown_reduction[1])
end

--Fills dodge meter when headshot and/or backstab kills are done.
function PlayerManager:add_backstab_dodge(was_backstab, was_headshot)
	if self:has_category_upgrade("player", "backstab_dodge") then
		local headshot_add = (was_headshot and self:upgrade_value("player", "backstab_dodge", 0)[1]) or 0
		local backstab_add = (was_backstab and self:upgrade_value("player", "backstab_dodge", 0)[2]) or 0
		if self.player_unit then
			local damage_ext = self:player_unit():character_damage()
			damage_ext:fill_dodge_meter(damage_ext:get_dodge_points() * (backstab_add + headshot_add))
		end
	end
end

--Sneaky Bastard Aced healing stuff.
function PlayerManager:_dodge_healing_no_armor()
	local damage_ext = self:player_unit():character_damage()
	if not (damage_ext:get_real_armor() > 0) and damage_ext:can_dodge_heal() then
		damage_ext:restore_health(self:upgrade_value("player", "dodge_heal_no_armor"), false)
	end
end

--Boosts ROF on headshot gills with single fire guns.
function PlayerManager:_trigger_sharpshooter(unit, attack_data)
	local weapon_unit = self:equipped_weapon_unit()
	local attacker_unit = attack_data.attacker_unit
	local variant = attack_data.variant

	if attacker_unit == self:player_unit() and variant == "bullet" and weapon_unit and weapon_unit:base():fire_mode() == "single" and weapon_unit:base():is_category("assault_rifle", "snp") and attack_data.result.type == "death" then
		self:activate_temporary_upgrade("temporary", "headshot_fire_rate_mult")
	end
end

function PlayerManager:_on_activate_aggressive_reload_event(attack_data)
	if attack_data and attack_data.variant ~= "projectile" then
		local weapon_unit = self:equipped_weapon_unit()

		if weapon_unit then
			local weapon = weapon_unit:base()

			if weapon and (weapon:fire_mode() == "single" or self:upgrade_value("temporary", "single_shot_fast_reload")[3] == true) and weapon:is_category("assault_rifle", "snp") then
				self:activate_temporary_upgrade("temporary", "single_shot_fast_reload")
			end
		end
	end
end

--Adds doctor bag health regen.
function PlayerManager:health_regen()
	local health_regen = tweak_data.player.damage.HEALTH_REGEN
	health_regen = health_regen + self:temporary_upgrade_value("temporary", "wolverine_health_regen", 0)
	health_regen = health_regen + self:upgrade_value("player", "passive_health_regen", 0)
	health_regen = health_regen + self:temporary_upgrade_value("temporary", "doctor_bag_health_regen", 0)

	return health_regen
end

--Move hostage taker to flat # regen from % regen. Add max hostage regen bonus.
function PlayerManager:fixed_health_regen()
	local health_regen = 0
	health_regen = health_regen + self:upgrade_value("team", "crew_health_regen", 0)
	health_regen = health_regen + self:get_hostage_bonus_addend("health_regen")
	local groupai = managers.groupai and managers.groupai:state()
	if (groupai and groupai:hostage_count() + (groupai._num_converted_police or self:num_local_minions()) or self:num_local_minions() or 0) >= tweak_data:get_raw_value("upgrades", "hostage_max_num", "health_regen") then
		health_regen = health_regen + self:get_hostage_bonus_addend("health_regen") * self:upgrade_value("player", "hostage_health_regen_max_mult", 0)
	end
	
	return health_regen
end

--Slows the player by a % that decays linearly over a duration, along with a visual.
--Power should be between 1 and 0. Corresponds to % speed is slowed on start.
function PlayerManager:apply_slow_debuff(duration, power, was_from_enemy, ignore_hud)
	if was_from_enemy and self:has_category_upgrade("player", "slowing_bullet_resistance") then
		duration = duration * (self:upgrade_value("player", "slowing_bullet_resistance", 0).duration)
		power = (1 + power) * (self:upgrade_value("player", "slowing_bullet_resistance", 0).power)
	end
	if power > 1 - self:_slow_debuff_mult() then
		self._slow_data = {
			duration = duration,
			power = power,
			start_time = Application:time()
		}
		if not ignore_hud then
			managers.hud:activate_effect_screen(duration, {0.0, 0.2, power})
		end
	end
end

function PlayerManager:_slow_debuff_mult()
	local time = Application:time()
	
	if self._slow_data.start_time + self._slow_data.duration < time then
		return 1 --no slow
	end

	return math.clamp(1 - self._slow_data.power * (1 - ((time - self._slow_data.start_time) / self._slow_data.duration)), 0, 1)
end

--Called when psychoknife kills are performed.
function PlayerManager:spread_psycho_knife_panic()
	local pos = self:player_unit():position()
	local area = 1200
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

--Professional aced extra ammo when killing specials and elites.
function PlayerManager:_on_spawn_special_ammo_event(equipped_unit, variant, killed_unit)
	if killed_unit.base and tweak_data.character[killed_unit:base()._tweak_table].priority_shout and variant and variant == "bullet" then
		local tracker = killed_unit.movement and killed_unit:movement():nav_tracker()
	    local position = tracker and tracker:lost() and tracker:field_position() or tracker:position()
	    local rotation = killed_unit:rotation()
		if Network:is_client() then
			managers.network:session():send_to_host("sync_spawn_extra_ammo", position, rotation)
		else
			self:spawn_extra_ammo(position, rotation)
		end
	end
end

function PlayerManager:_on_spawn_extra_ammo_event(equipped_unit, variant, killed_unit)
	if self._num_kills % self._target_kills == 0 then
		local tracker = killed_unit:movement():nav_tracker()
	    local position = tracker:lost() and tracker:field_position() or tracker:position()
	    local rotation = killed_unit:rotation()
		if Network:is_client() then
			managers.network:session():send_to_host("sync_spawn_extra_ammo", position, rotation)
		else
			self:spawn_extra_ammo(position, rotation)
		end
	end
end

function PlayerManager:spawn_extra_ammo(position, rotation)
	local mvec_1 = Vector3()
	local mvec_2 = Vector3()
	mvector3.set(mvec_1, position)
    mvector3.set_static(mvec_2, math.random(20, 50) * (math.random(1, 2) * 2 - 3), math.random(20, 50) * (math.random(1, 2) * 2 - 3), 0)
    mvector3.add(mvec_1, mvec_2)

    managers.game_play_central:spawn_pickup({
        name = "ammo",
        position = mvec_1,
        rotation = rotation
    })
end

function PlayerManager:_trigger_expres(equipped_unit, variant, killed_unit)
	if CopDamage.is_civilian(killed_unit:base()._tweak_table) then
		return
	end

	local player_unit = self:player_unit()

	if alive(player_unit) then
		player_unit:character_damage():add_armor_stored_health(self:upgrade_value("player", "armor_health_store_amount", 0))
	end
end

function PlayerManager:_trigger_hitman(equipped_unit, variant, killed_unit)
	if CopDamage.is_civilian(killed_unit:base()._tweak_table) then
		return
	end
	
	local player_unit = self:player_unit()

	if alive(player_unit) then
		if variant == "melee" then
			player_unit:character_damage():consume_temp_stored_health()
		else
			player_unit:character_damage():add_armor_stored_health(self:upgrade_value("player", "store_temp_health", {0, 0})[2])
		end
	end
end

--The vanilla version of this function is actually nonfunctional. No wonder it's never used.
--This fixes it to fulfill its intended purpose of letting active temporary upgrade durations be changed.
function PlayerManager:extend_temporary_upgrade(category, upgrade, time)
	local upgrade_value = self:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return
	end

	self._temporary_upgrades[category][upgrade].expire_time = self._temporary_upgrades[category][upgrade].expire_time + time
end

--Restores 1 down when enough assaults have passed. Counter is paused when player is in custody or has max revives
function PlayerManager:check_enduring()
	if not self._assaults_to_extra_revive then
		self._assaults_to_extra_revive = Global.game_settings.single_player and 1 or 2
	end

	if self._assaults_to_extra_revive and alive(self:player_unit()) then
		local damage_ext = self:player_unit():character_damage()
		if damage_ext:get_missing_revives() > 0 then
			self._assaults_to_extra_revive = math.max(self._assaults_to_extra_revive - 1, 0)
			if self._assaults_to_extra_revive == 0 then
				damage_ext:add_revive()
				managers.hud:show_hint( { text = managers.localization:text("hud_assault_restored_down") } )
				self._assaults_to_extra_revive = Global.game_settings.single_player and 1 or 2
			elseif self._assaults_to_extra_revive == 1 then
				managers.hud:show_hint( { text = managers.localization:text("hud_assault_remaining_single") } )
			else
				managers.hud:show_hint( { text = tostring(self._assaults_to_extra_revive) .. managers.localization:text("hud_assault_remaining_plural") } )
			end
		end
	end
end

--Makes *all* converts contribute to hostage skills, rather than just local converts.
function PlayerManager:get_hostage_bonus_multiplier(category)
	local groupai = managers.groupai and managers.groupai:state()
	local hostages = groupai and groupai:hostage_count() or 0
	hostages = hostages + (groupai and groupai._num_converted_police or self:num_local_minions() or 0)
	local multiplier = 0
	local hostage_max_num = tweak_data:get_raw_value("upgrades", "hostage_max_num", category)

	if hostage_max_num then
		hostages = math.min(hostages, hostage_max_num)
	end

	multiplier = multiplier + self:team_upgrade_value(category, "hostage_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value(category, "passive_hostage_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "hostage_" .. category .. "_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_hostage_" .. category .. "_multiplier", 1) - 1
	--Removed useless local_player call.

	--No close to hostage boosts.

	return 1 + multiplier * hostages
end

--Makes *all* converts contribute to hostage skills, rather than just local converts.
function PlayerManager:get_hostage_bonus_addend(category)
	local groupai = managers.groupai and managers.groupai:state()
	local hostages = groupai and groupai:hostage_count() or 0
	hostages = hostages + (groupai and groupai._num_converted_police or self:num_local_minions() or 0)
	local addend = 0
	local hostage_max_num = tweak_data:get_raw_value("upgrades", "hostage_max_num", category)

	if hostage_max_num then
		hostages = math.min(hostages, hostage_max_num)
	end

	addend = addend + self:team_upgrade_value(category, "hostage_addend", 0)
	addend = addend + self:team_upgrade_value(category, "passive_hostage_addend", 0)
	addend = addend + self:upgrade_value("player", "hostage_" .. category .. "_addend", 0)
	addend = addend + self:upgrade_value("player", "passive_hostage_" .. category .. "_addend", 0)
	--Removed useless local_player call.

	--No close to hostage boosts.

	return addend * hostages
end

--Instantly reloads all equipped weapons. Used by Running from Death Ace.
function PlayerManager:reload_weapons(bypass_purse)
	local weapons = {
		self:player_unit():inventory():unit_by_selection(1), --Secondary
		self:player_unit():inventory():unit_by_selection(2), --Primary
		self:player_unit():inventory():unit_by_selection(3) --Underbarrels
	}

	for _, weapon in pairs(weapons) do
		if weapon and weapon.base then
			local weapon_base = weapon:base()
			weapon_base:on_reload(nil, bypass_purse)
			managers.statistics:reloaded()
			managers.hud:set_ammo_amount(weapon_base:selection_index(), weapon_base:ammo_info())
		end
	end
end

--Replacement for vanilla fully loaded throwable coroutine. The vanilla code has 0 benefits from being a coroutine, and it seems to have issues resetting the chance or firing at all.
function PlayerManager:regain_throwable_from_ammo()
	local roll = math.random()
	
	if self._throwable_chance then --Fixes bizzare startup crash
		if roll < self._throwable_chance then
			self._throwable_chance = self._throwable_chance_data.chance
			self:add_grenade_amount(1, true)
		else
			self._throwable_chance = self._throwable_chance + self._throwable_chance_data.chance_inc
		end
	end
end

--Better rounding behavior on DA. Add 1 to deal with some weird rounding edge cases.
function PlayerManager:_get_cocaine_damage_absorption_from_data(data)
	local amount = data.amount or 0
	local upgrade_level = data.upgrade_level or 1

	if amount == 0 then
		return 0
	end
	
	return math.floor((amount + 1) / (tweak_data.upgrades.cocaine_stacks_convert_levels and tweak_data.upgrades.cocaine_stacks_convert_levels[upgrade_level] or 20)) * (tweak_data.upgrades.cocaine_stacks_dmg_absorption_value or 0.1)
end

--Adds buff tracker call.
function PlayerManager:disable_cooldown_upgrade(category, upgrade)
	local upgrade_value = self:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return
	end

	local time = upgrade_value[2]
	self._global.cooldown_upgrades[category] = self._global.cooldown_upgrades[category] or {}
	self._global.cooldown_upgrades[category][upgrade] = {
		cooldown_time = Application:time() + time
	}
	managers.hud:start_cooldown(upgrade, time)
end

--Adds buff tracker call.
function PlayerManager:activate_temporary_upgrade(category, upgrade)
	local upgrade_value = self:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return
	end

	local time = upgrade_value[2]
	self._temporary_upgrades[category] = self._temporary_upgrades[category] or {}
	self._temporary_upgrades[category][upgrade] = {
		expire_time = Application:time() + time
	}

	if self:is_upgrade_synced(category, upgrade) then
		managers.network:session():send_to_peers("sync_temporary_upgrade_activated", self:temporary_upgrade_index(category, upgrade))
	end
	managers.hud:start_buff(upgrade, time)
end

--Activates a temporary upgrade 'forever' until otherwise noted.
--Currently only used for unseen strike, so syncing support isn't implemented.
function PlayerManager:activate_temporary_upgrade_indefinitely(category, upgrade)
	local upgrade_value = self:upgrade_value(category, upgrade)

	if upgrade_value == 0 then
		return
	end

	self._temporary_upgrades[category] = self._temporary_upgrades[category] or {}
	self._temporary_upgrades[category][upgrade] = {
		expire_time = math.huge
	}
	managers.hud:remove_skill(upgrade)
	managers.hud:add_skill(upgrade)
end

--Use the old version of this function prior to Overkill's update because they don't invalidate the cached value properly in menus.
function PlayerManager:get_value_from_risk_upgrade(risk_upgrade, detection_risk)
    local risk_value = 0

    if not detection_risk then
        detection_risk = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
        detection_risk = math.round(detection_risk * 100)
    end

    if risk_upgrade and type(risk_upgrade) == "table" then
        local value = risk_upgrade[1]
        local step = risk_upgrade[2]
        local operator = risk_upgrade[3]
        local threshold = risk_upgrade[4]
        local cap = risk_upgrade[5]
        local num_steps = 0

        if operator == "above" then
            num_steps = math.max(math.floor((detection_risk - threshold) / step), 0)
        elseif operator == "below" then
            num_steps = math.max(math.floor((threshold - detection_risk) / step), 0)
        end

        risk_value = num_steps * value

        if cap then
            risk_value = math.min(cap, risk_value) or risk_value
        end
    end

    return risk_value
end

--Changed so cable tie max quantity properly scales
function PlayerManager:add_cable_ties(amount)
	local name = "cable_tie"
	local equipment = tweak_data.equipments.specials[name]
	local special_equipment = self._equipment.specials[name]
	local new_amount = 0
	local max_cable_ties = equipment.max_quantity
	
	--So this is properly taken into account
	max_cable_ties = max_cable_ties + self:upgrade_value(name, "quantity_1") + self:upgrade_value(name, "quantity_2")

	if special_equipment then
		local current_amount = Application:digest_value(special_equipment.amount, false)
		new_amount = math.min(current_amount + amount, max_cable_ties)

		managers.hud:set_cable_ties_amount(HUDManager.PLAYER_PANEL, new_amount)

		special_equipment.amount = Application:digest_value(new_amount, true)
	else
		new_amount = math.min(amount, max_cable_ties)
		self._equipment.specials[name] = {
			is_cable_tie = true,
			amount = new_amount and Application:digest_value(new_amount, true) or nil
		}

		managers.hud:set_cable_tie(HUDManager.PLAYER_PANEL, {
			icon = equipment.icon,
			amount = new_amount
		})
	end

	self:update_synced_cable_ties_to_peers(new_amount)
end