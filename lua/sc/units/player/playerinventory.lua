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

--Fix PECM feedback not coming out in waves as described
function PlayerInventory:_do_feedback()
	local t = TimerManager:game():time()

	if not alive(self._unit) or not self._jammer_data or t > self._jammer_data.t - 0.1 then
		self:stop_feedback_effect()

	end

	ECMJammerBase._detect_and_give_dmg(self._unit:position(), nil, self._unit, 2500)

	if self._jammer_data.t - 0.1 > t + self._jammer_data.interval then
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), t + self._jammer_data.interval)
	else
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "stop_feedback_effect"), self._jammer_data.t)
	end
end