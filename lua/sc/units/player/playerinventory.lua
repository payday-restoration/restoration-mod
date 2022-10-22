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

function PlayerInventory:_start_jammer_effect_drop_in_load(jammer_data)
	self:_start_jammer_effect(jammer_data.t)
end

function PlayerInventory:_start_feedback_effect_drop_in_load(jammer_data)
	self:_start_feedback_effect(jammer_data.t)
end

function PlayerInventory:_start_feedback_effect(end_time)
	if self._jammer_data then
		self:_chk_queue_jammer_effect("feedback")
		return
	end

	end_time = end_time or self:get_jammer_time()

	if end_time == 0 then
		return false
	end

	local interval, range, nr_ticks = nil

	if Network:is_server() then
		interval, range = self:get_feedback_values()

		if interval == 0 or range == 0 then
			return false
		end

		nr_ticks = math.max(1, math.floor(end_time / interval))
	end

	local t = TimerManager:game():time()
	local key_str = tostring(self._unit:key())
	end_time = t + end_time
	self._jammer_data = {
		effect = "feedback",
		t = end_time,
		interval = interval,
		range = range,
		sound = self._unit:sound_source():post_event("ecm_jammer_puke_signal"),
		feedback_callback_key = "PocketECMFeedback" .. key_str,
		nr_ticks = nr_ticks,
		first_tick = true
	}

	if Network:is_server() then
		local interval_t = t + interval

		if nr_ticks == 1 and end_time < interval_t then
			interval_t = end_time or interval_t
		end

		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), t + 0.05)
	else
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_clbk_stop_feedback_effect"), end_time)
	end

	local local_player = managers.player:player_unit()
	local user_is_local_player = local_player and local_player:key() == self._unit:key()
	local dodge = user_is_local_player and self._unit:base():upgrade_value("temporary", "pocket_ecm_kill_dodge")
	local heal = user_is_local_player and self._unit:base():upgrade_value("player", "pocket_ecm_heal_on_kill") or self._unit:base():upgrade_value("team", "pocket_ecm_heal_on_kill")

	if dodge then
		self._jammer_data.dodge_kills = dodge[3]
		self._jammer_data.dodge_listener_key = "PocketECMFeedbackDodge" .. key_str

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.dodge_listener_key, callback(self, self, "_jamming_kill_dodge"))
	end

	if heal then
		self._jammer_data.heal = heal
		self._jammer_data.heal_listener_key = "PocketECMFeedbackHeal" .. key_str

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.heal_listener_key, callback(self, self, "_feedback_heal_on_kill"))
	end
	
	return true
end

--Fix PECM feedback not coming out in waves as described
function PlayerInventory:_do_feedback()
	if not alive(self._unit) then
		self:_chk_remove_queued_jammer_effects()
		self:_clbk_stop_feedback_effect()

		return
	end

	local jammer_data = self._jammer_data

	if not jammer_data then
		self:_clbk_stop_feedback_effect()

		return
	end

	local activation = jammer_data.first_tick
	ECMJammerBase._detect_and_give_dmg(self._unit:position(), nil, self._unit, self._jammer_data.range, activation)

	jammer_data.nr_ticks = jammer_data.nr_ticks - 1
	jammer_data.first_tick = nil
	local t = TimerManager:game():time()
	local end_time = jammer_data.t

	if jammer_data.nr_ticks == 0 then
		if t < end_time then
			managers.enemy:add_delayed_clbk(jammer_data.feedback_callback_key, callback(self, self, "_clbk_stop_feedback_effect"), end_time)
		else
			self:_clbk_stop_feedback_effect()
		end

		return
	end

	local interval_t = t + jammer_data.interval

	if jammer_data.nr_ticks == 1 and end_time < interval_t then
		interval_t = end_time or interval_t
	end

	managers.enemy:add_delayed_clbk(jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), interval_t)
end
