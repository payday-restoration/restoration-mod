local old_PlayerInventory = PlayerInventory.add_unit_by_factory_name

function PlayerInventory:add_unit_by_factory_name(...)
	old_PlayerInventory(self, ...)
	if cosmetics then
		for _,v in pairs(cosmetics) do
			restoration.log_shit("SC: cosmetic string: " .. _ .. " " .. tostring(v))
		end
		restoration.log_shit("SC: cosmetic string: " .. tostring(cosmetics))
	end
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = true
	setup_data.autoaim = true
	setup_data.alert_AI = true
	setup_data.alert_filter = self._unit:movement():SO_access()
	setup_data.timer = managers.player:player_timer()
end

--Animation weight stuff. 
--TODO: Hopefully someone smarter than me will actually cache the weights instead of iterating through every part on swap.
local weapon_anim_weights = {}

-- probably not needed but better safe than sorry
local equip_selection_orig = PlayerInventory.equip_selection
function PlayerInventory:equip_selection(...)
	local result = equip_selection_orig(self, ...)
	if result then
		if self._unit:movement().cool and self._unit:movement():cool() then
			self:equipped_unit():base():set_flashlight_enabled(false) -- disable the flashlight if we equip something while cool
		end
		
		local is_player = managers.player:player_unit() == self._unit
		if is_player then
			--Remove previous weapon weights
			for _, weights in pairs(weapon_anim_weights) do
				self._unit:camera()._camera_unit:anim_state_machine():set_global(weights, 0)
			end
			
			if self:equipped_unit():base()._blueprint then
				weapon_anim_weights = managers.weapon_factory:get_animation_weights_from_weapon(self:equipped_unit():base()._factory_id, self:equipped_unit():base()._blueprint)
				--And apply the current weapon weights
				for _, weights in pairs(weapon_anim_weights) do
					self._unit:camera()._camera_unit:anim_state_machine():set_global(weights, 1)
				end
			end
		end
	end

	return result
end

local unequip_selection_orig = PlayerInventory.unequip_selection_orig
function PlayerInventory:unequip_selection_orig(...)
	local result = unequip_selection_orig(self, ...)
	
	if result and managers.player:player_unit() == self._unit and self:equipped_unit():base()._blueprint then
		weapon_anim_weights = managers.weapon_factory:get_animation_weights_from_weapon(self:equipped_unit():base()._factory_id, self:equipped_unit():base()._blueprint)
	end

	return result
end

-- hide masks upon the unit going invisible, if the unit has one
Hooks:PostHook(PlayerInventory, "set_visibility_state", "res_set_visibility_state", function(self, state)
	if alive(self._mask_unit) then
		self._mask_unit:set_visible(state)

		for _, linked_unit in ipairs(self._mask_unit:children()) do
			linked_unit:set_visible(state)
		end
	end
end)



function PlayerInventory:_start_feedback_effect(end_time, interval, range)
	end_time = end_time or self:get_jammer_time() + TimerManager:game():time()
	self._jammer_data = {
		effect = "feedback",
		t = end_time + 0.3,
		interval = interval or 1.5,
		range = range or 1500,
		sound = self._unit:sound_source():post_event("ecm_jammer_puke_signal")
	}
	local is_player = managers.player:player_unit() == self._unit
	local dodge = is_player and self._unit:base():upgrade_value("temporary", "pocket_ecm_kill_dodge")
	local heal = is_player and self._unit:base():upgrade_value("player", "pocket_ecm_heal_on_kill") or self._unit:base():upgrade_value("team", "pocket_ecm_heal_on_kill")

	if heal then
		self._jammer_data.heal = heal
		self._jammer_data.heal_listener_key = "feedback_heal" .. tostring(self._unit:key())

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.heal_listener_key, callback(self, self, "_feedback_heal_on_kill"))
	end

	if dodge then
		self._jammer_data.dodge_kills = dodge[3]
		self._jammer_data.dodge_listener_key = "jamming_dodge" .. tostring(self._unit:key())

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.dodge_listener_key, callback(self, self, "_jamming_kill_dodge"))
	end

	if Network:is_server() then
		self._jammer_data.feedback_callback_key = "feedback" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), TimerManager:game():time() + 0.25)
	end
end

--Fix PECM feedback not coming out in waves as described
function PlayerInventory:_do_feedback()
	local t = TimerManager:game():time()

	if not alive(self._unit) or not self._jammer_data or t > self._jammer_data.t then
		self:stop_feedback_effect()

		return
	end

	local activation = self._jammer_data.t - t > self:get_jammer_time() * 0.975
	ECMJammerBase._detect_and_give_dmg(self._unit:position(), nil, self._unit, self._jammer_data.range, activation)

	if self._jammer_data.t > t + self._jammer_data.interval then
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), t + self._jammer_data.interval)
	else
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "stop_feedback_effect"), self._jammer_data.t)
	end
end

function PlayerInventory:_feedback_heal_on_kill()
	local unit = managers.player:player_unit()
	local is_downed = game_state_machine:verify_game_state(GameStateFilters.downed)
	local swan_song_active = managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier")

	if is_downed or swan_song_active then
		return
	end

	if alive(self._unit) and unit and self._jammer_data then
		local heal = self._jammer_data.heal * managers.player:upgrade_value("player", "healing_reduction", 1)
		unit:character_damage():change_health(self._jammer_data.heal)
	end
end

--Dangerous territory
--[[
function PlayerInventory._get_weapon_sync_index(wanted_weap_name)
	local function get_weapon_index(wanted_weap_name)
		if type_name(wanted_weap_name) == "Idstring" then
			for i, test_weap_name in ipairs(tweak_data.character.weap_unit_names) do
				if test_weap_name == wanted_weap_name then
					return i
				end
			end
		end
	
		PlayerInventory._chk_create_w_factory_indexes()
	
		local start_index = #tweak_data.character.weap_unit_names_orig
		for i, factory_id in ipairs(PlayerInventory._weapon_factory_indexed) do
			if wanted_weap_name == factory_id then
				return start_index + i
			end
		end
	end

	return get_weapon_index(wanted_weap_name) or -1
end
--]]