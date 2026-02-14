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

local function set_hud_item_amount(index, amount)
	if #amount > 1 then
		managers.hud:set_item_amount_from_string(index, make_double_hud_string(amount[1], amount[2]), amount)
	else
		managers.hud:set_item_amount(index, amount[1])
	end
end

Hooks:PostHook(PlayerManager, "_setup", "ResSetup", function(_)
	--- synced_carry_stacker is a table of tables, mapping peer IDs to a table of
	--- all the bags the given player is carrying, **OTHER THAN** the one stored in `synced_carry`.
	--- 
	--- The carry table is a FILO queue: First In Last Out.
	Global.player_manager.synced_carry_stacker = {}

	--- Represents any biker data needed to be synchronised over the net.
	--- @class SyncedBikerAuraData
	--- @field amount integer The amount of Cohesion stacks the current peer has.
	--- @field to_tend integer The amount of Cohesion stacks the current peer suggest other peers tend to.
	Global.player_manager.synced_cohesion_stacks = {}
end)

--- Vomits out all the carried items from the player that wasn't in synced_carry.
Hooks:PostHook(PlayerManager, "peer_dropped_out", "ResPeerDroppedOut", function(self, peer_id)
	if Network:is_server() then
		local synced_carry_stacker_data = self:get_synced_carry_stacker(peer_id)

		if synced_carry_stacker_data and #synced_carry_stacker_data > 0 then
			for _, carry in ipairs(synced_carry_stacker_data) do
				if not carry then
					return
				end

				local carry_id = carry.carry_id
				local carry_multiplier = carry.multiplier
				local dye_initiated = carry.dye_initiated
				local has_dye_pack = carry.has_dye_pack
				local dye_value_multiplier = carry.dye_value_multiplier
				local peer_unit = peer:unit()
				local position = Vector3()

				if alive(peer_unit) then
					if peer_unit:movement():zipline_unit() then
						position = peer_unit:movement():zipline_unit():position()
					else
						position = peer_unit:position()
					end
				end

				local dir = Vector3(0, 0, 0)

				self:server_drop_carry(carry_id, carry_multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, position, Rotation(), dir, 0, nil, peer)
			end
		end
	end

	Global.player_manager.synced_carry_stacker[peer_id] = nil
	Global.player_manager.synced_cohesion_stacks[peer_id] = nil
end)

function PlayerManager:get_synced_carry_stacker(peer_id)
	return self._global.synced_carry_stacker[peer_id]
end

function PlayerManager:get_all_synced_carry_stacker()
	return self._global.synced_carry_stacker
end

function PlayerManager:get_synced_cohesion_stacks(peer_id)
	return self._global.synced_cohesion_stacks[peer_id]
end

Hooks:PostHook(PlayerManager, "init", "ResInit", function(self)
	--Info for slow debuff, usually caused by Titan Tasers.
	self._slow_data = {
		duration = 0, --Amount of time the slow should decay over.
		power = 0, --% slow when first started.
		start_time = 0 --Time when slow was started.
	}

	if self:has_category_upgrade("player", "buildup_meter") then
		local buildup_max_mod = (self:has_category_upgrade("player", "buildup_meter_rick") and self:upgrade_value("player", "buildup_meter_rick", 0).combo_max_mod) or 0
		local buildup_max = self:upgrade_value("player", "buildup_meter", 0).combo_max + buildup_max_mod
		self._buildup_meter_max = buildup_max
		self._buildup_meter = 0
		self._buildup_meter_t = 0
	end
	
	if self:has_category_upgrade("smg", "automatic_kills_to_damage") then
		self._merciless_t = 0
		self._merciless_stacks = 0
	end

	-- A few HUDs such as PocoHUD use this value directly. With the changes to on_headshot_dealt where
	-- this wouldn't be created until it's relevant, these HUDs would cause the game to crash.
	self._on_headshot_dealt_t = 0
	
	--- Rather than constantly using the current weight for calculations 
	--- (and no doubt losing some speed to rounding, I'M SURE OF IT)
	--- Whenever the weight would change, we start out from this number.
	--- 
	--- For further details on weight, see self._weight below.
	self._default_weight = 1

	--- Represents how affected is the player's movement by the bags 
    --- they are carrying. If weight is 1, the player is not affected at all. 
	--- However, if weight is less than 1, the player's speed and jumping ability 
	--- will be reduced. Furthermore, the player will not be able to pick more 
	--- bags once a certain weight threshold is reached.
	self._weight = self._default_weight
end)

Hooks:PostHook(PlayerManager, "update", "ResPlayerManagerUpdate", function(self, t, dt)
	if self:has_category_upgrade("player", "buildup_meter") and self._buildup_meter_t then
		local groupai = managers.groupai and managers.groupai:state()
		local additional_players = ((groupai and math.min((groupai:num_alive_players() or 1) - 1, 3)) or 0) * tweak_data.upgrades.socio_affinity_bonus_steps
		if self._buildup_meter_t > 0 then
			self._buildup_meter_t = math.max(0, self._buildup_meter_t - dt)
		else
			local combo_t_mod = (self:has_category_upgrade("player", "buildup_meter_zack") and self:upgrade_value("player", "buildup_meter_zack", 0).combo_t_mod) or 0
			local combo_t = self:upgrade_value("player", "buildup_meter", 0).combo_t + additional_players + combo_t_mod
			local combo_decay_mod = (self:has_category_upgrade("player", "buildup_meter_zack") and self:upgrade_value("player", "buildup_meter_zack", 0).combo_decay_mod) or 0
			local combo_decay = self:upgrade_value("player", "buildup_meter", 0).combo_decay + combo_decay_mod
			self._buildup_meter_t = combo_t
			self._buildup_meter = math.max(0, (self._buildup_meter or 0) - combo_decay)
			if managers.hud then
				managers.hud:start_buff("sociopath", self._buildup_meter_t)
				managers.hud:set_stacks("sociopath", self._buildup_meter)
			end
		end
	end

	if self:has_category_upgrade("smg", "automatic_kills_to_damage") and self._merciless_t then
		if self._merciless_t > 0 then
			self._merciless_t = math.max(0, self._merciless_t - dt)
		else
			local max = self:upgrade_value("smg", "automatic_kills_to_damage")[1]
			local time = self:upgrade_value("smg", "automatic_kills_to_damage")[3]
			self._merciless_t = time
			self._merciless_stacks = math.max(0, (self._merciless_stacks or 0) - 1)
			if managers.hud then
				managers.hud:start_buff("body_expertise", self._merciless_t)
				managers.hud:set_stacks("body_expertise", self._merciless_stacks)
			end
		end
	end

	self:update_cohesion_stacks(t, dt)
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

	-- Biker armour increase.
	-- As the perk deck says, this should happen before any other multiplicating thing, so before Anarchist, but
	-- it's fine for it to happen after Grinder as the intention there is more changing how Flak Jacket is.
	if self:has_team_category_upgrade("player", "biker_additional_armour") then
		local cohesion_steps = self:get_cohesion_stacks_as_treated()
		local extra_armour_percent = self:team_upgrade_value("player", "biker_additional_armour", 0) * cohesion_steps
		addend = addend * extra_armour_percent
	end

	if self:has_category_upgrade("player", "armor_increase") then
		local health_multiplier = self:health_skill_multiplier()
		local max_health = (PlayerDamage._HEALTH_INIT + self:health_skill_addend()) * health_multiplier
		addend = addend + max_health * self:upgrade_value("player", "armor_increase", 1)
	end

	--Removed bot armor boost.

	return addend
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

	--New Socio armor regen bonus
	if self._buildup_meter and self:has_category_upgrade("player", "buildup_meter_mark") then
		local regen_stats = self:upgrade_value("player", "buildup_meter_mark", 0)
		multiplier = multiplier * (1 - math.min(regen_stats.effect_max, math.floor(self._buildup_meter / regen_stats.combo_steps) * regen_stats.effect))
	end

	if health_ratio then
		local damage_health_ratio = self:get_damage_health_ratio(health_ratio, "armor_regen")
		multiplier = multiplier * (1 - managers.player:upgrade_value("player", "armor_regen_damage_health_ratio_multiplier", 0) * damage_health_ratio)
	end

	local mutator = nil

	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)
	end

	if mutator and mutator.armor_regen_timer_multiplier then
		multiplier = multiplier * mutator:armor_regen_timer_multiplier()
	end

	return multiplier
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

	-- Biker
	if self:has_team_category_upgrade("player", "biker_crew_movespeed_bonus") then
		local potency_amount = self:get_cohesion_stacks_as_treated()
		local bonus = self:team_upgrade_value("player", "biker_crew_movespeed_bonus", 0) + self:team_upgrade_value("player", "biker_additional_move_reload_bonus", 0)

		multiplier = multiplier + bonus * potency_amount
	end

	--Bloodthirst
	if self:has_active_temporary_property("bloodthirst_reload_speed") then
		multiplier = multiplier + self:get_temporary_property("bloodthirst_reload_speed", 1) - 1
	end

	--Kingpin movespeed bonus.
	if self:has_activate_temporary_upgrade("temporary", "chico_injector") then
		multiplier = multiplier + self:upgrade_value("player", "chico_injector_speed", 1) - 1
	end

	--New Socio movement speed bonus
	if self._buildup_meter and self:has_category_upgrade("player", "buildup_meter_redline") then
		local speed_stats = self:upgrade_value("player", "buildup_meter_redline", 0)
		multiplier = multiplier * (1 + math.min(speed_stats.effect_max, math.floor(self._buildup_meter / speed_stats.combo_steps) * speed_stats.effect))
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

	local twb = tweak_data.blackmarket

	local weapon_melee = weapon_id and twb.melee_weapons and twb.melee_weapons[weapon_id] and true

	local weapon_proj = weapon_id and twb.projectiles and twb.projectiles[weapon_id]
	if weapon_proj and weapon_proj.count_as_melee and variant == "bullet" then
		variant = "melee"
	end

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
	local update_secondary_reload_primary = selection_index == 1 and self._has_secondary_reload_primary
	local update_primary_reload_secondary = selection_index == 2 and self._has_primary_reload_secondary
	local equipped_weapon_id = equipped_unit and equipped_unit:base() and equipped_unit:base():get_name_id()
	update_secondary_reload_primary = update_secondary_reload_primary and weapon_id == equipped_weapon_id
	update_primary_reload_secondary = update_primary_reload_secondary and weapon_id == equipped_weapon_id

	if update_secondary_reload_primary then
		local kills_to_reload = self:upgrade_value("player", "secondary_reload_primary", 10)
		local secondary_kills = self:get_property("secondary_reload_primary_kills", 0) + 1

		if kills_to_reload <= secondary_kills then
			local primary_unit = player_unit:inventory():unit_by_selection(2)
			local primary_base = alive(primary_unit) and primary_unit:base()
			local can_reload = primary_base and primary_base.can_reload and primary_base:can_reload()

			if can_reload then
				primary_base:on_reload(nil, true)
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(primary_base:selection_index(), primary_base:ammo_info())
				player_unit:sound():play("perkdeck_activate")
			end

			secondary_kills = 0
		end

		self:set_property("secondary_reload_primary_kills", secondary_kills)
	elseif update_primary_reload_secondary then
		local kills_to_reload = self:upgrade_value("player", "primary_reload_secondary", 10)
		local primary_kills = self:get_property("primary_reload_secondary_kills", 0) + 1

		if kills_to_reload <= primary_kills then
			local secondary_unit = player_unit:inventory():unit_by_selection(1)
			local secondary_base = alive(secondary_unit) and secondary_unit:base()
			local can_reload = secondary_base and secondary_base.can_reload and secondary_base:can_reload()

			if can_reload then
				secondary_base:on_reload(nil, true)
				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(secondary_base:selection_index(), secondary_base:ammo_info())
				player_unit:sound():play("perkdeck_activate")
			end

			primary_kills = 0
		end

		self:set_property("primary_reload_secondary_kills", primary_kills)
	end	

	self._message_system:notify(Message.OnEnemyKilled, nil, equipped_unit, variant, killed_unit)

	if self._saw_panic_when_kill and variant ~= "melee" then
		local equipped_unit = self:get_current_state()._equipped_unit:base()
		local check_id = equipped_unit and equipped_unit._name_id

		--Allow all special weapons to spread panic with skill.
		if weapon_id == check_id and 
			(equipped_unit:is_category("saw") or equipped_unit:is_category("grenade_launcher") or equipped_unit:is_category("bow") or equipped_unit:is_category("crossbow")) then
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
		local static_damage_segment_size = self:upgrade_value_nil("player", "copr_static_damage_ratio")
		local static_damage_ratio_mult = self:upgrade_value_nil("player", "copr_static_damage_ratio_mult") or 1
		static_damage_segment_size = static_damage_segment_size * static_damage_ratio_mult
		
		if kill_life_leech and static_damage_segment_size and damage_ext then
			self._copr_kill_life_leech_num = (self._copr_kill_life_leech_num or 0) + 1

			if kill_life_leech <= self._copr_kill_life_leech_num then
				self._copr_kill_life_leech_num = 0
				local current_health = damage_ext:get_real_health()
				local wanted_health = math.floor((current_health + 0.01 + static_damage_segment_size) / static_damage_segment_size) * static_damage_segment_size
				local health_regen = wanted_health - current_health

				if health_regen > 0 then
					damage_ext:restore_health(health_regen, true)
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
		--Leech Armor Regen (from old Biker)
		if self:has_category_upgrade("player", "biker_armor_regen") then
			damage_ext:tick_biker_armor_regen(self:upgrade_value("player", "biker_armor_regen")[3])
		end
		if weapon_melee then
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
	end

	local equipped_unit = self:get_current_state()._equipped_unit
	local weap_base = alive(equipped_unit) and equipped_unit.base and equipped_unit:base()
	if weap_base and variant == "bullet" then

		if self:has_category_upgrade("temporary", "single_shot_fast_reload") then
		if weap_base:is_category("assault_rifle", "snp") and (headshot or self:upgrade_value("temporary", "single_shot_fast_reload")[3] == true) then
				self:activate_temporary_upgrade("temporary", "single_shot_fast_reload")
			end
		end
	
		--for _, category in ipairs(weap_base:categories()) do
			if self:has_category_upgrade("smg", "automatic_kills_to_damage") and weap_base:fire_mode() == "auto" then
				local max = self:upgrade_value("smg", "automatic_kills_to_damage")[1]
				local time = self:upgrade_value("smg", "automatic_kills_to_damage")[3]
				self._merciless_t = time
				self._merciless_stacks = math.clamp((self._merciless_stacks or 0) + 1, 0, max)
				managers.hud:start_buff("body_expertise", self._merciless_t)
				managers.hud:set_stacks("body_expertise", self._merciless_stacks)
			end
		--end
	end

	--New Socio
	local new_socio_panic = 0
	if self:has_category_upgrade("player", "buildup_meter") and variant then
		new_socio_panic = self:_check_resmod_sociopath(player_unit, killed_unit, variant, headshot, weapon_id) or 0
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
		local panic_chance = new_socio_panic
			+ (socio_panic_available and (self:upgrade_value("player", "killshot_close_panic_chance", 0) * ((variant and variant == "melee" and 2) or 1)) or 0)
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

	--Crook (Formerly Sociopath) killshot cooldown and effects (THINGS NOT EXCLUSIVELY RELATED TO CROOK'S COOLDOWNS SHOULD NOT BE BELOW THIS)
	if self._on_killshot_t and t < self._on_killshot_t then
		if self:has_category_upgrade("player", "killshot_regen_armor_bonus") then
			self._on_killshot_t = self._on_killshot_t - killshot_cooldown_reduction
			managers.hud:change_cooldown("crook", -killshot_cooldown_reduction)
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
		player_unit:movement():add_stamina(player_unit:movement():_max_stamina() * self:upgrade_value("player", "melee_kill_stamina", 0))
	end

	if damage_ext and regen_health_bonus > 0 then
		damage_ext:restore_health(regen_health_bonus)
	end

	self._on_killshot_t = t + (tweak_data.upgrades.on_killshot_cooldown or 0)

	if self:has_category_upgrade("player", "killshot_regen_armor_bonus") then
		managers.hud:start_buff("crook", (tweak_data.upgrades.on_killshot_cooldown or 0))
	end

	if _G.IS_VR then
		local steelsight_multiplier = equipped_unit:base():enter_steelsight_speed_multiplier()
		local stamina_percentage = (steelsight_multiplier - 1) * tweak_data.vr.steelsight_stamina_regen
		local stamina_regen = player_unit:movement():_max_stamina() * stamina_percentage

		player_unit:movement():add_stamina(stamina_regen)
	end
end

function PlayerManager:_check_resmod_sociopath(player_unit, killed_unit, variant, headshot, weapon_id)
	if not player_unit then
		return 0
	end
	self._buildup_meter = self._buildup_meter or 0 --Glass earthing this; no clue why it's returning nil sometimes given its in the init
	local groupai = managers.groupai and managers.groupai:state()
	local additional_players = ((groupai and math.min((groupai:num_alive_players() or 1) - 1, 3)) or 0) * tweak_data.upgrades.socio_affinity_bonus_steps
	local damage_ext = player_unit:character_damage()
	local new_socio_panic = 0
	local buildup_stats = self:upgrade_value("player", "buildup_meter", 0)
	local buildup_meter_variant = (variant == "melee" and "melee") or ((variant == "bullet" or variant == "fire_bullet") and "bullet") or nil
	local direct_variant = variant == "bullet" or variant == "fire_bullet"

	local combo_t_mod = (self:has_category_upgrade("player", "buildup_meter_zack") and self:upgrade_value("player", "buildup_meter_zack", 0).combo_t_mod) or 0
	local combo_t = self:upgrade_value("player", "buildup_meter", 0).combo_t + additional_players + combo_t_mod

	local has_swan = self:has_category_upgrade("player", "buildup_meter_swan") 

	local has_aubrey = self:has_category_upgrade("player", "buildup_meter_aubrey")
	--local aubrey_refresh = has_aubrey and (self._buildup_meter_aubrey_kills and self._buildup_meter_aubrey_kills >= self:upgrade_value("player", "buildup_meter_aubrey", 0).non_melee_kills - 1)
	local can_refresh = self:has_category_upgrade("player", "buildup_meter_refresh")

	local function enemy_unit_mult()
		local ene_mult = nil
		if killed_unit.base and killed_unit:base() and killed_unit:base().has_tag then
			local check_order = deep_clone(self:upgrade_value("player", "buildup_meter", 0).combo_ene_mult)
			for i, priority in pairs(check_order) do
				for tag, v in pairs(priority) do
					if killed_unit:base():has_tag(tag) then
						ene_mult = self:upgrade_value("player", "buildup_meter", 0).combo_ene_mult[i][tag]
						break
					end
				end
				if ene_mult then
					break
				end
			end

			if self:has_category_upgrade("player", "buildup_meter_rick") then
				local ene_mult_mod = self:upgrade_value("player", "buildup_meter_rick", 0).ene_mult_mod or 1
				ene_mult = math.lerp(1, (ene_mult or 1), ene_mult_mod)
			end

			return ene_mult or 1
		end
		return 1
	end

	local buildup_add_mod = (self:has_category_upgrade("player", "buildup_meter_rick") and self:upgrade_value("player", "buildup_meter_rick", 0).combo_add_mod) or 0
	if self:has_category_upgrade("player", "buildup_meter_quickening") then
		local armor = tweak_data.player.damage.ARMOR_INIT + managers.player:body_armor_value("armor")
		buildup_add_mod = buildup_add_mod + ( math.floor( armor / self:upgrade_value("player", "buildup_meter_quickening", 0).armor_steps ) * self:upgrade_value("player", "buildup_meter_quickening", 0).combo_add_mod )
	end
	local buildup_add = math.floor((self:upgrade_value("player", "buildup_meter", 0).combo_add + buildup_add_mod + additional_players) * enemy_unit_mult()) 

	local function check_refresh(refresh, aubrey, time)
		if refresh then
			if aubrey then
				if self._buildup_meter and self._buildup_meter <= 0 then
					self._buildup_meter_t = time
					managers.hud:start_buff("sociopath", self._buildup_meter_t)
				else
					local combo_t_add = self:upgrade_value("player", "buildup_meter_aubrey", 0).combo_t_add
					local add_t = math.min(combo_t - self._buildup_meter_t, combo_t_add)
					self._buildup_meter_t = self._buildup_meter_t + add_t
					managers.hud:change_cooldown("sociopath", add_t)
				end
				buildup_add = math.floor((self:upgrade_value("player", "buildup_meter_aubrey", 0).combo_add + buildup_add_mod + additional_players) * enemy_unit_mult())
				self._buildup_meter = math.clamp((self._buildup_meter or 0) + buildup_add, 0, self._buildup_meter_max)
				managers.hud:set_stacks("sociopath", self._buildup_meter)
			else
				if self._buildup_meter and self._buildup_meter > 0 then
					self._buildup_meter_t = time
					managers.hud:start_buff("sociopath", self._buildup_meter_t)
				end
			end
		end
	end

	if has_swan then
		if buildup_meter_variant == "melee" or buildup_meter_variant == "bullet" then
			if not self._buildup_meter_last_kill or self._buildup_meter_last_kill ~= buildup_meter_variant then
				buildup_add = math.floor((self:upgrade_value("player", "buildup_meter_swan", 0).combo_add + buildup_add_mod + additional_players) * enemy_unit_mult())
				--log(tostring( buildup_add ))
				self._buildup_meter = math.clamp((self._buildup_meter or 0) + buildup_add, 0, self._buildup_meter_max)
				self._buildup_meter_t = combo_t
				managers.hud:start_buff("sociopath", self._buildup_meter_t)
				managers.hud:set_stacks("sociopath", self._buildup_meter)
			end
			check_refresh(can_refresh, nil, combo_t)
			self._buildup_meter_last_kill = buildup_meter_variant
		end
	else
		if variant == "melee" then
			self._buildup_meter = math.clamp((self._buildup_meter or 0) + buildup_add, 0, self._buildup_meter_max)
			self._buildup_meter_t = (self._buildup_meter > 0 and combo_t) or 0
			managers.hud:start_buff("sociopath", self._buildup_meter_t)
			managers.hud:set_stacks("sociopath", self._buildup_meter)
		else
			if has_aubrey and not direct_variant then
				can_refresh = nil
			end
			check_refresh(can_refresh, has_aubrey, combo_t)
		end
	end
	if direct_variant or variant == "melee" then
		if variant == "melee" then
			player_unit:movement():add_stamina(player_unit:movement():_max_stamina() * self:upgrade_value("player", "melee_kill_stamina", 0))
			if self:has_category_upgrade("player", "buildup_meter_hysteria") then
				local healing_stats = self:upgrade_value("player", "buildup_meter_hysteria", 0)
				damage_ext:restore_health(math.min(healing_stats.effect_max, math.floor(self._buildup_meter / healing_stats.combo_steps) * healing_stats.effect), true)
			end
		end
		if self:has_category_upgrade("player", "buildup_meter_terrify") then
			local panic_stats = self:upgrade_value("player", "buildup_meter_terrify", 0)
			new_socio_panic = (math.min(panic_stats.effect_max, math.floor(self._buildup_meter / panic_stats.combo_steps) * panic_stats.effect )) * ((variant == "melee" and panic_stats.melee_mult) or 1)
		end
		if self:has_category_upgrade("player", "buildup_meter_elude") and not self:has_category_upgrade("player", "buildup_meter_mark") then
			local dodge_stats = self:upgrade_value("player", "buildup_meter_elude", 0)
			local dodge_on_kill = (damage_ext:get_dodge_points() * math.min(dodge_stats.effect_max, math.floor(self._buildup_meter / dodge_stats.combo_steps) * dodge_stats.effect)) * ((variant == "melee" and dodge_stats.melee_mult) or 1)
			damage_ext:fill_dodge_meter(dodge_on_kill)
		end
	end
	return new_socio_panic
end

function PlayerManager:_check_damage_to_hot(t, unit, damage_info)
	local player_unit = self:player_unit()

	--Stuff to trigger Infiltrator HP regen for throwables that count as melee
	--This stuff is here as "_check_damage_to_hot" is basically an "on damage dealt" check and I don't want to modify a currently vanilla function to have this stuff in it
	local twb = tweak_data.blackmarket
	local weapon_id = damage_info and damage_info.weapon_unit and damage_info.weapon_unit.base and damage_info.weapon_unit:base()._tweak_projectile_entry
	local weapon_proj = weapon_id and twb and twb.projectiles and twb.projectiles[weapon_id]

	if weapon_proj and weapon_proj.count_as_melee and damage_info.variant == "bullet" then
		damage_info.variant = "melee"
		if self:has_category_upgrade("player", "buildup_meter") and self:has_category_upgrade("player", "buildup_meter_refresh") and self._buildup_meter and self._buildup_meter > 0 then
			local groupai = managers.groupai and managers.groupai:state()
			local additional_players = ((groupai and math.min((groupai:num_alive_players() or 1) - 1, 3)) or 0) * tweak_data.upgrades.socio_affinity_bonus_steps
			local combo_t_mod = (self:has_category_upgrade("player", "buildup_meter_zack") and self:upgrade_value("player", "buildup_meter_zack", 0).combo_t_mod) or 0
			local combo_t = self:upgrade_value("player", "buildup_meter", 0).combo_t + additional_players + combo_t_mod
			self._buildup_meter_t = combo_t
			managers.hud:start_buff("sociopath", managers.player._buildup_meter_t)
		end
	end

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

	-- Less ouchies when in a vehicle or on a zipline
	if self:current_state() == "driving" then
		multiplier = multiplier * 0.5
	elseif self:player_unit():movement():zipline_unit() then
		multiplier = multiplier * 0.75
	end

	--Removed vanilla crew chief team DR.
	if self._buildup_meter and self:has_category_upgrade("player", "buildup_meter_pacify") then
		local dr_stats = self:upgrade_value("player", "buildup_meter_pacify", 0)
		multiplier = multiplier * (1 - math.min(dr_stats.effect_max, math.floor(self._buildup_meter / dr_stats.combo_steps) * dr_stats.effect))
	end
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

	--[[
	if self:has_category_upgrade("temporary", "single_shot_fast_reload") then
		self._message_system:register(Message.OnEnemyKilled, "activate_aggressive_reload", callback(self, self, "_on_activate_aggressive_reload_event"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "activate_aggressive_reload")
	end
	]]

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
		self._message_system:register(Message.OnLethalHeadShot, "special_double_ammo_drop", callback(self, self, "_on_spawn_special_ammo_event"))
	else
		self._message_system:unregister(Message.OnLethalHeadShot, "special_double_ammo_drop")
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

	-- Biker: Earn Your Keep!
	if self:has_category_upgrade("player", "biker_personal_kill_stack_reward") then
		self._biker_personal_target_kills = self:upgrade_value("player", "biker_personal_kill_stack_reward").enemies
		self._biker_personal_target_rewards = self:upgrade_value("player", "biker_personal_kill_stack_reward").stacks

		self._message_system:register(Message.OnEnemyKilled, "biker_personal_give_nearby_crewmembers_stacks", callback(self, self, "_biker_on_personal_kill"))
	else
		self._biker_personal_target_kills = 0
		self._biker_personal_target_rewards = 0
		self._message_system:unregister(Message.OnEnemyKilled, "biker_personal_give_nearby_crewmembers_stacks")
	end

	-- Biker: Press The Advantage!
	if self:has_team_category_upgrade("player", "biker_crew_kill_stack_reward") then
		self._biker_crew_target_kills = self:team_upgrade_value("player", "biker_crew_kill_stack_reward").enemies
		self._biker_crew_target_rewards = self:team_upgrade_value("player", "biker_crew_kill_stack_reward").stacks

		self._message_system:register(Message.OnEnemyKilled, "biker_crew_give_nearby_crewmembers_stacks", callback(self, self, "_biker_on_crew_kill"))
	else
		self._biker_crew_target_kills = 0
		self._biker_crew_target_rewards = 0
		self._message_system:unregister(Message.OnEnemyKilled, "biker_crew_give_nearby_crewmembers_stacks")
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

	local damage_ext = player_unit:character_damage()

	local replenishable_armour = damage_ext:_max_armor() - damage_ext:get_real_armor()
	local replenishable_health = damage_ext:_max_health() - damage_ext:get_real_health()
	local regen_armor_bonus = managers.player:upgrade_value("player", "headshot_regen_armor_bonus", 0)
	local regen_health_bonus = managers.player:upgrade_value("player", "headshot_regen_health_bonus", 0)

	if (replenishable_armour <= 0 or regen_armor_bonus == 0) and (replenishable_health <= 0 or regen_health_bonus == 0) then
		-- Do not "waste" the Bullseye timer if we:
		-- - Don't have armour to recover with it or don't have Bullseye, and we
		-- - Don't have health to recover Head Games or we don't have that.
		return
	end

	self._on_headshot_dealt_t = t + (tweak_data.upgrades.on_headshot_dealt_cooldown or 0)
	managers.hud:start_buff("bullseye", tweak_data.upgrades.on_headshot_dealt_cooldown)

	if damage_ext and regen_armor_bonus > 0 then
		damage_ext:restore_armor(damage_ext:_max_armor() * regen_armor_bonus)
	end

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
		managers.hud:change_cooldown("bullseye", -regen_armor_bonus_cd_reduction)
	end
end

function PlayerManager:_on_expert_handling_event(unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local variant = attack_data.variant
	local is_bullet = variant and (variant == "bullet" or variant == "fire_bullet")

	if attacker_unit == self:player_unit() and self:is_current_weapon_of_category("pistol") and is_bullet and not self._coroutine_mgr:is_running(PlayerAction.ExpertHandling) then
		local data = self:upgrade_value("pistol", "stacked_accuracy_bonus", nil)

		if data and type(data) ~= "number" then
			self._coroutine_mgr:add_coroutine(PlayerAction.ExpertHandling, PlayerAction.ExpertHandling, self, data.accuracy_bonus, data.max_stacks, Application:time() + data.max_time)
		end
	end
end

function PlayerManager:_on_enter_trigger_happy_event(unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local variant = attack_data.variant
	local is_bullet = variant and (variant == "bullet" or variant == "fire_bullet")

	if attacker_unit == self:player_unit() and is_bullet and not self._coroutine_mgr:is_running("trigger_happy") and self:is_current_weapon_of_category("pistol") then
		local data = self:upgrade_value("pistol", "stacking_hit_damage_multiplier", 0)

		if data and type(data) ~= "number" then
			self._coroutine_mgr:add_coroutine("trigger_happy", PlayerAction.TriggerHappy, self, data.damage_bonus, data.max_stacks, Application:time() + data.max_time)
		end
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
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]
	local addend = 0

	local addend = 0

	addend = addend + self:upgrade_value("player", "deflection_addend", 0)
	--Grinder Flak Jacket deflection modifier
	if armor_data.upgrade_level == 5 then
		addend = addend + self:upgrade_value("player", "level_5_deflection_addend_grinder", 0)
	end

	if self:has_activate_temporary_upgrade("temporary", "doctor_bag_health_regen") then	
		addend = addend + tweak_data.upgrades.values.temporary.doctor_bag_health_regen_deflection_addend
	end

	return addend
end

function PlayerManager:get_max_grenades(grenade_id)
	grenade_id = grenade_id or managers.blackmarket:equipped_grenade()
	local max_amount = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "max_amount") or 0

	--Jack of all trades basic grenade count increase.
	--MAY be source of grenade syncing issues due to interaction with get_max_grenades_by_peer_id(). Is worth investigating some time.
	local is_cooldown = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown")
	local is_perk_throwable = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown") and not tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "base_cooldown_no_perk")
	local throwables_multiplier = (not is_cooldown and self:upgrade_value("player", "throwables_multiplier", 1.0)) or 1
	if max_amount and not is_perk_throwable then 
		max_amount = math.ceil(max_amount * throwables_multiplier)
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
	
	local is_cooldown = grenade.base_cooldown
	local is_perk_throwable = grenade.base_cooldown and not grenade.base_cooldown_no_perk
	local throwables_multiplier = (not is_cooldown and self:upgrade_value("player", "throwables_multiplier", 1)) or 1
	if amount and not is_perk_throwable then --*Should* stop perk deck actives from being increased.
		amount = managers.modifiers:modify_value("PlayerManager:GetThrowablesMaxAmount", amount) --Crime spree throwables mod.
		amount = math.ceil(amount * throwables_multiplier) --JOAT Basic
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
	local throw_tweak = tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()]
	local base_pickup_chance = (throw_tweak and throw_tweak.base_pickup_chance) or 0.01
	local skill_pickup_chance = self:upgrade_value("player", "regain_throwable_from_ammo", {chance = 0, chance_inc = 0})
	self._throwable_chance_data = {chance = base_pickup_chance + skill_pickup_chance.chance, chance_inc = 0 + skill_pickup_chance.chance_inc}
	self._throwable_chance = self._throwable_chance_data.chance

	--Reset when players are spawned, just in case.
	self._slow_data = {
		duration = 0,
		power = 0,
		start_time = 0
	}
	
	--Remove sticky buff trackers
	if not self._unseen_strike then
		managers.hud:remove_skill("unseen_strike")
	end

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
	local t = Application:time()
	local damage_ext = self:player_unit():character_damage()

	if self._dodge_heal_no_armor_t and self._dodge_heal_no_armor_t > t then
		if not (damage_ext:get_real_armor() > 0) then
			managers.hud:change_cooldown("sneaky_bastard", -tweak_data.upgrades.dodge_heal_no_armor_cooldown_rd)
			self._dodge_heal_no_armor_t = self._dodge_heal_no_armor_t - tweak_data.upgrades.dodge_heal_no_armor_cooldown_rd
		end
		return
	end

	if not (damage_ext:get_real_armor() > 0) --[[and damage_ext:can_dodge_heal()]] then
		damage_ext:restore_armor(damage_ext:get_dodge_points() * 10)
		damage_ext:restore_health(self:upgrade_value("player", "dodge_heal_no_armor"), false)
		self._dodge_heal_no_armor_t = t + (tweak_data.upgrades.dodge_heal_no_armor_cooldown or 0)
		managers.hud:start_buff("sneaky_bastard", (tweak_data.upgrades.dodge_heal_no_armor_cooldown or 0))
	end
end

--Boosts ROF on headshot gills with single fire guns.
function PlayerManager:_trigger_sharpshooter(unit, attack_data)
	local weapon_unit = self:equipped_weapon_unit()
	local attacker_unit = attack_data.attacker_unit
	local variant = attack_data.variant

	if attacker_unit == self:player_unit() and variant == "bullet" and weapon_unit --[[and weapon_unit:base():fire_mode() == "single"]] and weapon_unit:base():is_category("assault_rifle", "snp") and attack_data.result.type == "death" then
		self:activate_temporary_upgrade("temporary", "headshot_fire_rate_mult")
	end
end

--Unused
function PlayerManager:_on_activate_aggressive_reload_event(equipped_unit, variant, killed_unit)
	if CopDamage.is_civilian(killed_unit:base()._tweak_table) or variant ~= "bullet" then
		return
	end
	if equipped_unit then
		local weapon = equipped_unit:base()

		if weapon and (weapon:fire_mode() == "single" or self:upgrade_value("temporary", "single_shot_fast_reload")[3] == true) and weapon:is_category("assault_rifle", "snp") then
			self:activate_temporary_upgrade("temporary", "single_shot_fast_reload")
		end
	end
end

--[[
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
--]]

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
	health_regen = health_regen + self:get_hostage_bonus_addend("health_regen")
	local groupai = managers.groupai and managers.groupai:state()
	if self:has_category_upgrade("player", "hostage_health_regen_max_mult") and ((groupai and groupai:hostage_count() + (groupai:num_converted_police() or self:num_local_minions()) or self:num_local_minions() or 0) >= tweak_data:get_raw_value("upgrades", "hostage_max_num", "health_regen")) then
		health_regen = health_regen * self:upgrade_value("player", "hostage_health_regen_max_mult", 0)
	end
	
	-- Show HP regen on buff tracker in numbers
	if managers and managers.hud and health_regen then
		managers.hud:add_skill("hostage_taker")
		managers.hud:set_stacks("hostage_taker", health_regen * 10)
	end
	
	health_regen = health_regen + self:upgrade_value("team", "crew_health_regen", 0)
	
	return health_regen
end

--Slows the player by a % that decays linearly over a duration, along with a visual.
--Power should be between 1 and 0. Corresponds to % speed is slowed on start.
function PlayerManager:apply_slow_debuff(duration, power, was_from_enemy, ignore_hud)
	if power then
		power = math.clamp(power, 0, 1)
	end
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
			local effect_alpha = (restoration.Options:GetValue("HUD/Extra/ScreenEffectAlpha") or 1)
			managers.hud:activate_effect_screen(duration, Vector3(0.0, 0.2, power) * effect_alpha, "slow")
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

--Professional aced extra ammo when killing specials and elites with headshots.
function PlayerManager:_on_spawn_special_ammo_event(attack_data)
	local variant = attack_data.variant
	local killed_unit = attack_data.col_ray and attack_data.col_ray.unit
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
		
		if restoration.Options:GetValue("OTHER/DisableSoloBoons") then
			self._assaults_to_extra_revive = 2
		end
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
	hostages = hostages + (groupai and groupai:num_converted_police() or self:num_local_minions() or 0)
	local multiplier = 0
	local hostage_max_num = tweak_data:get_raw_value("upgrades", "hostage_max_num", category)

	if hostage_max_num then
		hostages = math.min(hostages, hostage_max_num)
	end
	
	local is_crew_chief_in_the_team = self:team_upgrade_value("health", "hostage_multiplier", 1) - 1
	if managers and managers.hud and is_crew_chief_in_the_team ~= 0 then
		managers.hud:add_skill("crew_chief")
		managers.hud:set_stacks("crew_chief", hostages)
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
	hostages = hostages + (groupai and groupai:num_converted_police() or self:num_local_minions() or 0)
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
	local throw_tweak = tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()]
	if throw_tweak and throw_tweak.pickup_cooldown_t then
		managers.player:speed_up_grenade_cooldown(throw_tweak.pickup_cooldown_t)
	else
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

-- While the ampoule is active, the old biker "gain HP on crew kill" effect is turned off.
Hooks:PreHook(PlayerManager, "chk_wild_kill_counter", "res_chk_wild_kill_counter", function(self, _, _)
	if self:has_activate_temporary_upgrade("temporary", "copr_ability") then
		return
	end
end)

-- Store the Leech user's armour when they activate the Ampoule, to the grant it back to them.
Hooks:PreHook(PlayerManager, "_attempt_copr_ability", "res_attempt_copr_ability_store_armour", function(self, _, _)
	if self:has_activate_temporary_upgrade("temporary", "copr_ability") then
		return false
	end

	local player_unit = self:player_unit()

	if alive(player_unit) then
		player_unit:character_damage():add_stored_armor(player_unit:character_damage():get_real_armor())
	end
end)

-- Store the Leech user's armour when they activate the Ampoule, to the grant it back to them.
Hooks:PostHook(PlayerManager, "_attempt_copr_ability", "res_attempt_copr_ability_fix_display", function(self, _, _)
	local result = Hooks:GetReturn()
	local character_damage = self:local_player():character_damage()
	if result and character_damage then
		-- Playing it safe with the potential division by 0 (even though I'm not sure if it could even happen).
		local static_damage_ratio = self:upgrade_value("player", "copr_static_damage_ratio", 0) / math.max(character_damage:_max_health(), 0.01)
		managers.hud:set_copr_indicator(true, static_damage_ratio)
	end
end)

-- Leech now uses fixed HP segment sizes instead of max HP percentages, and
-- when the Ampoule's effects end, it should consume any stored armour and give it to the player.
Hooks:OverrideFunction(PlayerManager, "clbk_copr_ability_ended", function(self)
	self:deactivate_temporary_upgrade("temporary", "copr_ability")

	local player_unit = self:local_player()
	local character_damage = alive(player_unit) and player_unit:character_damage()

	if character_damage then
		local static_damage_segment_size = self:upgrade_value("player", "copr_static_damage_ratio", 0) - 1e-08
		local out_of_health = character_damage:get_real_health() < static_damage_segment_size
		local risen_from_dead = self:get_property("copr_risen", false) == true

		character_damage:on_copr_ability_deactivated()

		if out_of_health or risen_from_dead then
			character_damage:force_into_bleedout(false, risen_from_dead)
		else
			character_damage:consume_stored_armor()
		end
	end

	self:set_property("copr_risen", nil)
	managers.hud:set_copr_indicator(false)
end)

--Accounts for max quantity changes when adding deployable equipment
function PlayerManager:add_deployable_equipment(equipment_id, amount)
	local equipment, index = self:equipment_data_by_name(equipment_id)

	if equipment then
		local max_amount = tweak_data.equipments[equipment.equipment].quantity[1]
		max_amount = max_amount + self:upgrade_value(equipment.equipment, "quantity")
		local current_amount = Application:digest_value(equipment.amount[1], false)
		local new_amount = math.min(current_amount + amount, max_amount)
		
		equipment.amount[1] = Application:digest_value(new_amount, true)
		set_hud_item_amount(index, get_as_digested(equipment.amount))
		self:update_deployable_equipment_amount_to_peers(equipment.equipment, new_amount)
	end
end

--- Reversed the order in which the `_damage_bonus_distance` and `_damage_bonus` contours are applied.
--- This needed to be done because unlike Vanilla's High Value Target, Spotter has logic based on distance
--- in the Basic version of the skill, not aced.
--- Leaving it unreversed would result in the Spotter Basic contour applying no matter if you had Basic or Aced.
--- 
--- Please note that the contours now handle distance differently! See contourext.lua for more info.
function PlayerManager:get_contour_for_marked_enemy(enemy_type)
	local contour_type = "mark_enemy"

	if enemy_type == "swat_turret" or enemy_type == "sentry_gun" then
		contour_type = "mark_unit_dangerous"

		if managers.player:has_category_upgrade("player", "marked_inc_dmg_distance") then
			contour_type = "mark_unit_dangerous_damage_bonus_distance"
		end

		if managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") then
			contour_type = "mark_unit_dangerous_damage_bonus"
		end
	else

		if managers.player:has_category_upgrade("player", "marked_inc_dmg_distance") then
			contour_type = "mark_enemy_damage_bonus_distance"
		end

		if managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") then
			contour_type = "mark_enemy_damage_bonus"
		end
	end

	return contour_type
end

-- Tag Team: tagged player will hear activation sound
Hooks:PostHook(PlayerManager, "sync_tag_team", "sync_tag_team_sound_effect", function(self, tagged, owner, end_time)
	if tagged == self:local_player() then
		self:local_player():sound():play(tweak_data.blackmarket.projectiles.tag_team.sounds.activate)
	end
end)

--- Packs a table of peer IDs into a comma-separated string.
--- @param peer_set table<integer, boolean> Set of peer IDs. Keys are IDs, values are true.
--- @return string packed_ids Comma-separated list of peer IDs.
function PlayerManager:pack_biker_affected_peer_set(peer_set)
    local ids = {}

    for peer_id, _ in pairs(peer_set) do
        ids[#ids + 1] = tostring(peer_id)
    end

    return table.concat(ids, ",")
end

--- Unpacks a table of peer IDs from a string.
--- @param str string See pack_biker_affected_peer_set().
--- @return table<integer, boolean> peer_set Set of peer IDs. Keys are IDs, values are true.
function PlayerManager:unpack_biker_affected_peer_set(str)
    local result = {}

    if str == nil or str == "" then
        return result
    end

    for id in string.gmatch(str, "([^,]+)") do
        local num_id = tonumber(id)
        if num_id then
            result[num_id] = true
        end
    end

    return result
end


--- For the purposes of effects, returns the amount of Cohesion stacks the local peer is treated as having (which may be different than how many it has), divided by the amount necessary for a "step" (typically 8).
---@return integer cohesion_stacks The actual Cohesion stacks, plus any "as treated" extras, divided by 8.
function PlayerManager:get_cohesion_stacks_as_treated()
	local local_peer = managers.network:session() and managers.network:session():local_peer()
	if not local_peer then
		return 0
	end

	local extra_amount = self:upgrade_value("player", "biker_treat_as_more_cohesion", 0)
	local cohesion_stacks = managers.player:get_synced_cohesion_stacks(local_peer:id())
	local all = (cohesion_stacks and cohesion_stacks.amount or 0) + extra_amount

	return self:get_cohesion_step(all)
end

--- Updates a given peer's biker-related data.
--- @param peer_id integer The source peer's ID, whose data needs to be updated.
--- @param data SyncedBikerAuraData Cohesion stack data for the selected peer.
--- @param change_tendency boolean If true, the `to_tend` the select peer's tendency will be changed on this side. How is determined by `is_affected`.
--- @param is_affected boolean Working in tandem with `change_tendency`, if true (and `change_tendency` is true), use the `to_tend` from the incoming data to set the matching peer's tendency. If false, but `change_tendency` is true, forcibly 0 the matching peer's tendency.
function PlayerManager:set_synced_cohesion_stacks(peer_id, data, is_affected, change_tendency)
	local received_to_tend = 0

	if change_tendency then
		if is_affected and data.to_tend ~= nil then
			received_to_tend = data.to_tend
		end
	else
		if self._global.synced_cohesion_stacks[peer_id] ~= nil and self._global.synced_cohesion_stacks[peer_id].to_tend ~= nil then
			received_to_tend = self._global.synced_cohesion_stacks[peer_id].to_tend
		end
	end

	self._global.synced_cohesion_stacks[peer_id] = {
		amount = data.amount,
		to_tend = received_to_tend
	}
end

---Iterates through all the synced biker data, and picks out the highest suggested Cohesion stack count to tend to.
---@return integer highest_to_tend The highest to_tend value in the synced Cohesion stack data.
function PlayerManager:get_highest_cohesion_tendency_target()
	local highest = 0
	for i, cohesion_data in ipairs(self._global.synced_cohesion_stacks) do
		highest = math.max(cohesion_data.to_tend, highest)
	end

	return highest
end

--- A simple function that just returns number / 8, rounded down. Used to determine Cohesion "steps", i.e., how much is that "for every X amount of stacks" amount. Primarily exists for if I ever decide to change the step amount.
---@param number integer The number to determine steps for, typically own Cohesion stack count (but not necessarily).
---@return integer Step count.
function PlayerManager:get_cohesion_step(number)
	return math.floor(number / tweak_data.upgrades.biker_per_crew_member)
end

--- Returns how much should the Cohesion stack amount be changed by.
--- Considers limits, how far away the current amount is from the goal, etc.
---@param current_amount integer The current amount of Cohesion stacks.
---@param goal integer The amount that the Cohesion stacks should approach.
---@return integer change A positive, negative, or 0 value.
function PlayerManager:get_cohesion_stack_change_amount(current_amount, goal)
	local change = 0
	local per_eight_goal = self:get_cohesion_step(goal) -- This represents the amount of "steps" (eight stacks) the goal has. Since only every 8 stack matters, this can be used to determine how far away the current is from the goal.
	local per_eight_current =  self:get_cohesion_step(current_amount) -- Similar to per_eight_goal.
	local step_difference = math.abs(per_eight_goal - per_eight_current)

	
	if current_amount < goal then
		local additional_gain = self:has_category_upgrade("player","biker_stack_change_adjustments") and self:upgrade_value("player", "biker_stack_change_adjustments").gain or 0
		change = math.min(goal - current_amount, ((tweak_data.upgrades.biker_cohesion_gain or 1) + additional_gain) * math.max(step_difference,1))
	elseif current_amount > goal then
		local additional_loss = self:has_category_upgrade("player","biker_stack_change_adjustments") and self:upgrade_value("player", "biker_stack_change_adjustments").loss or 0
		change = -math.min(current_amount - goal, ((tweak_data.upgrades.biker_cohesion_loss or 2) + additional_loss) * math.max(step_difference,1))
	end

	return change
end

--- Updates the current player's Cohesion stacks for all players, and updates the Cohesion tendency suggested by the current player based on the affected parameter.
--- @param data SyncedBikerAuraData See class for details.
--- @param affected boolean[] The table of peer IDs who are currently in the current player's biker aura. Used for determining whose tendency numbers should be changed. Values don't matter, only indices. Can be empty.
--- @param change_tendency boolean If true, tendency should be changed as well. If false, do not adjust it.
function PlayerManager:update_cohesion_stacks_for_peers(data, affected, change_tendency)
	local peer = managers.network:session():local_peer()
	local is_affected = false
	if peer then 
		is_affected = affected[peer:id()] ~= nil
	end

	local packedData = {
		amount = data.amount,
		to_tend = data.to_tend,
		affected = affected,
		change_tendency = change_tendency
	}

	-- Criminal.
	LuaNetworking:SendToPeers("biker_message_sync_cohesion_stacks", 
		tostring(packedData.amount)..
		';'..
		tostring(packedData.to_tend)..
		';'..
		tostring(self:pack_biker_affected_peer_set(packedData.affected))..
		';'..
		tostring(packedData.change_tendency)
	)

	self:set_synced_cohesion_stacks(peer:id(), data, is_affected, change_tendency)
end

--- A simplified function that simply just adds an amount to the Cohesion stacks. It then synchronises the changes to the other clients.
--- @param amount number The amount that should be added to the Cohesion stacks.
--- @param go_over_tendency boolean If true, the final Cohesion stack count can go over the tendency.
function PlayerManager:add_cohesion_stacks(amount, go_over_tendency)
	local local_peer_id = managers.network:session() and managers.network:session():local_peer():id()

	if not local_peer_id then
		return
	end

	local data = self:get_synced_cohesion_stacks(local_peer_id) or {amount = 0, to_tend = 0}
	local new_amount = data.amount + amount

	if not go_over_tendency then
		-- While I don't want it going over the tendency if the option is off, I DO want to keep any amount that already existed (in case you just ran out of a biker aura, for example).
		new_amount = math.max(math.min(new_amount, data.to_tend), data.amount)
	end

	if new_amount ~= data.amount then
		self:update_cohesion_stacks_for_peers({
			amount = new_amount,
			to_tend = nil
		}, {}, false)
	end
end

---  Calculates how many valid crew members are around a given position.
--- @param position Vector3 I'm not sure about this, but I also don't care, I'm just passing it along to World:find_units_quick().
--- @return table<integer,boolean> affected_players A table where all affected players' peer IDs are keys. Values are just true, but they shouldn't matter.
--- @return integer heister_count The amount of non-convert heisters.
--- @return integer convert_count The amount of converted enemies.
function PlayerManager:get_biker_aura_affected(position)
	local affected_players = {}
	local heister_count = 0
	local convert_count = 0
	local heisters = World:find_units_quick("sphere", position,
		tweak_data.upgrades.biker_proximity or 0, managers.slot:get_mask("all_criminals"))

	for i, unit in ipairs(heisters) do
		if unit:slot() == 16 and  managers.groupai and not managers.groupai:state():is_unit_team_AI(unit) then
			convert_count = convert_count + 1
		else
			heister_count = heister_count + 1
		end
		if managers.network:session():peer_by_unit(unit) then
			local tagged_id = managers.network:session():peer_by_unit(unit):id()
			affected_players[tagged_id] = true
		end
	end

	return affected_players, heister_count, convert_count
end

--- Handles manipulating the Cohesion stack count.
function PlayerManager:update_cohesion_stacks(t, dt)
	local local_peer_id = managers.network:session() and managers.network:session():local_peer():id()
	local player_unit = self:player_unit()
	self._prev_keep_track_of_cohesion = self._prev_keep_track_of_cohesion or false
	local keep_track_of_cohesion = self:has_team_category_upgrade("player", "biker_damage_to_lose")

	if not local_peer_id or not player_unit or not keep_track_of_cohesion then
		if managers.hud and self._prev_keep_track_of_cohesion then
			managers.hud:remove_skill("heisters_in_aura")
			managers.hud:remove_skill("cohesion")
		end
		return
	end
	self._prev_keep_track_of_cohesion = keep_track_of_cohesion

	self._cohesion_stack_t = self._cohesion_stack_t or t + (tweak_data.upgrades.biker_change_t or 1)
	local cohesion_stacks = self:get_synced_cohesion_stacks(local_peer_id)

	local amount = cohesion_stacks and cohesion_stacks.amount or 0
	local new_amount = amount

	local to_tend = cohesion_stacks and cohesion_stacks.to_tend or 0
	local new_to_tend = to_tend

	-- Handle the HUD update.
	self._cached_cohesion_amount = self._cached_cohesion_amount or 0
	if self._cached_cohesion_amount ~= new_amount and managers.hud then
		-- TODO BIKER
		--managers.hud:set_cohesion_value(new_amount, self:upgrade_value("player", "biker_treat_as_more_cohesion", 0))
		managers.hud:start_progress_representation(
			"cohesion",
			tweak_data.upgrades.biker_change_t or 1,
			new_amount,
			tweak_data.upgrades.biker_per_crew_member or 8
		)
		self._cached_cohesion_amount = new_amount
	end

	local affected_players = {}

	-- biker users get to update their "suggested" tendency.
	if self:upgrade_value("player", "biker_emit_aura", 0) ~= 0 then
		local heisters_affected = 0
		local converts_affected = 0
		affected_players, heisters_affected, converts_affected = self:get_biker_aura_affected(player_unit:position())

		if managers and managers.hud then
			managers.hud:add_skill("heisters_in_aura")
			managers.hud:set_stacks("heisters_in_aura", heisters_affected)
		end

		local tendency_from_proximity = math.min(heisters_affected + converts_affected / 2, tweak_data.upgrades.biker_hard_limit) * (tweak_data.upgrades.biker_per_crew_member or 0)

		local is_downed = game_state_machine:verify_game_state(GameStateFilters.downed)
		new_to_tend = is_downed and 0 or (tendency_from_proximity + self:team_upgrade_value("player", "biker_increase_default_tendency", 0))
	end

	if self._cohesion_stack_t <= t then
		self._cohesion_stack_t = t + (tweak_data.upgrades.biker_change_t or 1)

		-- I didn't originally plan for fractional Cohesion stack changes, guh!
		self._fractional_change_amount = (self._fractional_change_amount or 0.0) + self:get_cohesion_stack_change_amount(amount, self:get_highest_cohesion_tendency_target())
		local integer_change_amount = math.round(self._fractional_change_amount)
		self._fractional_change_amount = self._fractional_change_amount - integer_change_amount

		new_amount = new_amount + integer_change_amount
	end

	new_to_tend = math.clamp(math.floor(new_to_tend), 0, 256)
	new_amount = math.clamp(math.floor(new_amount), 0, 256)

	if new_amount ~= amount or new_to_tend ~= to_tend then
		self:update_cohesion_stacks_for_peers({
			amount = new_amount,
			to_tend = new_to_tend
		}, affected_players, true)
	end
end

LuaNetworking:AddReceiveHook("biker_message_sync_cohesion_stacks", "sync_stack_message", function(packed_data, sender)
	local local_peer = managers.network:session():local_peer()

	if not BaseNetworkHandler._verify_gamestate(BaseNetworkHandler._gamestate_filter.any_ingame) and not local_peer then 
		return
	end

    local deseralised_data = {}
    for part in string.gmatch(packed_data, "([^;]+)") do
        table.insert(deseralised_data, part)
    end

    if #deseralised_data ~= 4 then
        return
    end

    local checked_cohesion_data = {
        amount = tonumber(deseralised_data[1]) or 0,
        to_tend = tonumber(deseralised_data[2]) or 0
    }

	local affected_peers = managers.player:unpack_biker_affected_peer_set(deseralised_data[3])
    local is_affected = affected_peers[local_peer:id()] ~= nil
	local change_tendency = (deseralised_data[4] == "true")

	managers.player:set_synced_cohesion_stacks(sender, checked_cohesion_data, is_affected, change_tendency)
end)

LuaNetworking:AddReceiveHook("biker_message_add_cohesion_stacks", "add_stack_message", function(packed_data, sender)
	local local_peer = managers.network:session():local_peer()

	if not BaseNetworkHandler._verify_gamestate(BaseNetworkHandler._gamestate_filter.any_ingame) and not local_peer then 
		return
	end

    local deseralised_data = {}
    for part in string.gmatch(packed_data, "([^;]+)") do
        table.insert(deseralised_data, part)
    end

    if #deseralised_data ~= 3 then
        return
    end

    local checked_cohesion_data = {
        amount = tonumber(deseralised_data[1]) or 0,
        go_over_tendency = (deseralised_data[2] == "true")
    }

	local affected_peers = managers.player:unpack_biker_affected_peer_set(deseralised_data[3])
    local is_affected = affected_peers[local_peer:id()] ~= nil
	
	if  is_affected then
		managers.player:add_cohesion_stacks(checked_cohesion_data.amount, checked_cohesion_data.go_over_tendency)
	end
end)

-- Biker: add Cohesion stacks on kills
function PlayerManager:_biker_on_personal_kill(_, _, _)
	local player_unit = self:player_unit()
	if self._num_kills % self._biker_personal_target_kills == 0 and player_unit ~= nil then
		local affected_players = self:get_biker_aura_affected(player_unit:position())

		local packedData = {
			amount = self._biker_personal_target_rewards,
			go_over_tendency = false,
			affected = affected_players
		}

		-- Criminal.
		LuaNetworking:SendToPeers("biker_message_add_cohesion_stacks", 
			tostring(packedData.amount)..
			';'..
			tostring(packedData.go_over_tendency)..
			';'..
			tostring(self:pack_biker_affected_peer_set(packedData.affected))
		)

		managers.player:add_cohesion_stacks(self._biker_personal_target_rewards, false)
	end
end

function PlayerManager:_biker_on_crew_kill(_, _, _)
	local player_unit = self:player_unit()
	if self._num_kills % self._biker_crew_target_kills == 0 and player_unit ~= nil then
		local affected_players = self:get_biker_aura_affected(player_unit:position())

		local packedData = {
			amount = self._biker_crew_target_rewards,
			go_over_tendency = true,
			affected = affected_players
		}
		
		LuaNetworking:SendToPeers("biker_message_add_cohesion_stacks", 
			tostring(packedData.amount)..
			';'..
			tostring(packedData.go_over_tendency)..
			';'..
			tostring(self:pack_biker_affected_peer_set(packedData.affected))
		)

		managers.player:add_cohesion_stacks(self._biker_crew_target_rewards, true)
	end
end

-- Disables Bag Anti Cheat
-- I will end you
function PlayerManager:verify_carry(peer, carry_id)
	return true
end

function PlayerManager:register_carry(peer, carry_id)
	return true
end

-- Carry Stacker stuff inbound

--- Gets the carried items' data, and recalculates their modifiers on the carried weight.
--- 
--- Typically should be called whenever the carry data updates, but shouldn't cause any problems if called any other time.
function PlayerManager:recalculate_carried_weights()
	local peer_id = managers.network:session():local_peer():id()
	local cdata = self:get_my_carry_data()
	local remaining_cdata = self:get_synced_carry_stacker(peer_id)

    local all_weight_modifier = 1

	local function add_carry_weight(examined_carry)
		if examined_carry then
			local carry_type = tweak_data.carry[examined_carry.carry_id].type
			local movement_penalty = tweak_data.carry.types[carry_type].weight

			local this_weight_modifier = movement_penalty ~= nil 
				and ((100 -movement_penalty) / 100) 
				or 1

			all_weight_modifier = all_weight_modifier * this_weight_modifier
		end
	end

	add_carry_weight(cdata)
	if remaining_cdata then
		for i, carry_iter in ipairs(remaining_cdata) do
			add_carry_weight(carry_iter)
		end
	end
	
    self._weight = self._default_weight * all_weight_modifier
end

--- Adds a special loot icon to the player's HUD to represent how many extra loot they're carrying.
--- 
--- @param peer_id integer The Peer ID of the player whose HUD element needs to be updated.
function PlayerManager:update_carrystacker_hud(peer_id)
	if peer_id ~= managers.network:session():local_peer():id() then
		return
	end
	local carry_stacker_data = self:get_synced_carry_stacker(peer_id)
	local carry_data = self:get_my_carry_data()
	local bags = 0

	if carry_data then
		bags = bags + 1
	end

	if carry_stacker_data then
		bags = bags + #carry_stacker_data
	end

	managers.hud:remove_special_equipment("carrystacker")
	if bags > 0 then
		managers.hud:add_special_equipment({
			id = "carrystacker", 
			icon = "pd2_loot", 
			amount = bags
		})
	end
end

--- Effectively the update_removed_synced_carry_to_peers() equivalent for the carry stacker.
--- Used to delete the local peer's carry stacker data for others.
function PlayerManager:update_removed_synced_carry_stacker_to_peers()
	local peer = managers.network:session():local_peer()

	managers.network:session():send_to_peers_synched("sync_remove_carry_stacker")
	self:remove_synced_carry_stacker(peer)
	self:recalculate_carried_weights()
end

--- Clears the synced_carry_stacker table for a given peer.
--- @param peer Peer The peer whose table to clear.
function PlayerManager:remove_synced_carry_stacker(peer)
	local peer_id = peer:id()

	if not self._global.synced_carry_stacker[peer_id] then
		return
	end

	self._global.synced_carry_stacker[peer_id] = nil
	self:update_carrystacker_hud(peer_id)
end

--- This function will be called to check whether the player can carry a bag.
Hooks:PostHook(PlayerManager, "can_carry", "ResCarryStackerCanCarry", function(self, carry_id)
	if not Hooks:GetReturn() then
		-- I don't think it ever *can*, but if the original can_carry returns false,
		-- well, no point in looking further.
		return false
	end

	local carry_type = tweak_data.carry[carry_id].type
	local movement_penalty = nil
		
	movement_penalty = tweak_data.carry.types[carry_type].weight
	local carried_weight_modifier = movement_penalty ~= nil 
		and ((100 -movement_penalty) / 100) 
		or 1

    local check_weight = self._weight * carried_weight_modifier
	local max_weight = tweak_data.player.max_carry_weight
	
	if managers.player:has_category_upgrade("carry", "increased_carry_weight") then
		max_weight = max_weight - managers.player:upgrade_value("carry", "increased_carry_weight", 1)
	end

    return check_weight >= max_weight
end)

Hooks:PreHook(PlayerManager, "drop_carry", "ResCarryStackerPreDropCarry", function(self, _)
	self._player_state_before_drop = self._current_state
end)

--- Makes the timing before you can interact again consistent. That's it.
--- We DO base it on the synced_carry_stacker length rather than synced_carry, though this is
--- because of the code reorganisation that mandates we trust the host with dropping stuff.
Hooks:PostHook(PlayerManager, "drop_carry", "ResCarryStackerDropCarry", function(self, _)
	local peer_id = managers.network:session():local_peer():id()
	local remaining_cdata = self:get_synced_carry_stacker(peer_id)

	if remaining_cdata and #remaining_cdata > 0 then
		self._carry_blocked_cooldown_t = Application:time() + 0.5
	end

	self:update_carrystacker_hud(peer_id)
	self:recalculate_carried_weights()

	if not self._player_state_before_drop then
		return
	end
	if self._player_state_before_drop == "carry" then
		managers.player:set_player_state("standard")
	else
		managers.player:set_player_state(self._player_state_before_drop)
	end
end)

--- This is a bit delayed compared to the original CarryStacker implementation where this (or rather
--- a similar) logic was in drop_carry directly. However, I think it's fine mainly because that one
--- wasn't synchronised over the net. It's *probably* alright that we wait some barely perceptible
--- amount of time before "realising" we still have loot in synced_carry_stacker.
Hooks:PostHook(PlayerManager, "remove_synced_carry", "ResCarryStackerPostRemoveSyncedCarry", function(self, peer)
	local peer_id = peer:id()
	local local_peer_id = managers.network:session():local_peer():id()
	local remaining_cdata = self:get_synced_carry_stacker(peer_id)

	if remaining_cdata and #remaining_cdata > 0 then
		local next_carry = table.remove(remaining_cdata, #remaining_cdata)

		if peer_id == local_peer_id then
			self:set_carry(next_carry.carry_id, next_carry.multiplier, next_carry.dye_initiated, next_carry.has_dye_pack, next_carry.dye_value_multiplier)
		else
			self:recalculate_carried_weights()
			self:update_carrystacker_hud(peer_id)
		end
	end
end)

--- Since we're about to pick up a a new carryable item, we should push the current one (if there's one), to the synced_carry_stacker.
Hooks:PreHook(PlayerManager, "set_synced_carry", "ResCarryStackerPreSetSyncedCarry", function(self, peer, _, _, _, _, _)
	local peer_id = peer:id()
	local carry = self._global.synced_carry[peer_id]

	if carry then
		self._global.synced_carry_stacker[peer_id] = self._global.synced_carry_stacker[peer_id] or {}
		table.insert(self._global.synced_carry_stacker[peer_id], deep_clone(carry))
	end

	self:update_carrystacker_hud(peer_id)
end)

--- Adjust the player weight, and block interactions for a short bit.
Hooks:PostHook(PlayerManager, "set_carry", "ResCarryStackerPostSetCarry", function(self, _, _, _, _, _)
	local peer_id = managers.network:session():local_peer():id()
	self:update_carrystacker_hud(peer_id)
	self:recalculate_carried_weights()
	PlayerStandard:block_use_item()
end)

--- This should hopefully force the player to drop ALL their bags, not just the current one in `synced_carry`.
Hooks:PreHook(PlayerManager, "force_drop_carry", "ResCarryStackerPreForceDropCarry", function(self)
	local peer_id = managers.network:session():local_peer():id()
	local remaining_cdata = self:get_synced_carry_stacker(peer_id)

	if remaining_cdata == nil then
		return
	end

	local player = self:player_unit()
	if not alive(player) then
		print("COULDN'T FORCE DROP! DIDN'T HAVE A UNIT")
		return
	end

	-- I'm not overjoyed about all the code duplication, but what can you do.
	for _, carry in ipairs(remaining_cdata) do
		if not carry then
			-- HUH????
			return
		end

		local dye_initiated = carry.dye_initiated
		local has_dye_pack = carry.has_dye_pack
		local dye_value_multiplier = carry.dye_value_multiplier
		local camera_ext = player:camera()

		if Network:is_client() then
			managers.network:session():send_to_host("server_drop_carry", carry.carry_id, carry.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, camera_ext:position(), camera_ext:rotation(), Vector3(0, 0, 0), 0, nil)
		else
			self:server_drop_carry(carry.carry_id, carry.multiplier, dye_initiated, has_dye_pack, dye_value_multiplier, camera_ext:position(), camera_ext:rotation(), Vector3(0, 0, 0), 0, nil, managers.network:session():local_peer())
		end
	end

	self:update_removed_synced_carry_stacker_to_peers()
	self:recalculate_carried_weights()
	self:update_carrystacker_hud(peer_id)
end)

--- Banking all the carry stacker carries *before* the synced_carry one because I'm not entirely sure
--- how would the game behave because of the update_removed_synced_carry_to_peers() call in the original.
Hooks:PreHook(PlayerManager, "bank_carry", "ResCarryStackerPreBankCarry", function(self)
	local peer_id = managers.network:session() and managers.network:session():local_peer():id()

	local remaining_cdata = self:get_synced_carry_stacker(peer_id)

	if remaining_cdata == nil then
		return
	end

	for _, carry in ipairs(remaining_cdata) do
		if not carry then
			-- Not sure how this could happen, but Your Honour: PAYDAY 2.
			return
		end
		managers.loot:secure(carry.carry_id, carry.multiplier, nil, peer_id)
	end
	
	self:update_removed_synced_carry_stacker_to_peers()
end)

--- clear_carry seems "technical" enough that I think we should probably also clear our carry stacker table here.
Hooks:PreHook(PlayerManager, "clear_carry", "ResCarryStackerPreClearCarry", function(self, soft_reset)
	local peer_id = managers.network:session() and managers.network:session():local_peer():id()
	local carry_stacker_data = self:get_synced_carry_stacker(peer_id)

	if not carry_stacker_data then
		return
	end

	local player = self:player_unit()

	if not soft_reset and not alive(player) then
		print("COULDN'T FORCE DROP! DIDN'T HAVE A UNIT")
		return
	end

	self:update_removed_synced_carry_stacker_to_peers()
end)

Hooks:PostHook(PlayerManager, "sync_carry_data", "ResSyncCarryData", function(self, _, _, _, _, _, _, _, _, _, _, peer_id)
	self:recalculate_carried_weights()
	self:update_carrystacker_hud(peer_id)
end)