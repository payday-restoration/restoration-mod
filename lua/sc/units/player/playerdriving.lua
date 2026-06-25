-- Update nav tracker if the player is driving a vehicle
--[[
--Might not be needed now since- 
Hooks:OverrideFunction(PlayerDriving, "update", function (self, t, dt)
	if self._vehicle == nil or not self._vehicle:is_active() or self._controller == nil then
		return
	end

	self:_update_input(dt)

	local input = self:_get_input(t, dt)

	self:_calculate_standard_variables(t, dt)
	self:_update_ground_ray()
	self:_update_fwd_ray()
	self:_check_action_change_camera(t, input)
	self:_check_action_rear_cam(t, input)
	self:_update_hud(t, input)
	self:_update_action_timers(t, input)
	self:_check_action_exit_vehicle(t, input)

	if self._menu_closed_fire_cooldown > 0 then
		self._menu_closed_fire_cooldown = self._menu_closed_fire_cooldown - dt
	end

	if self._seat.driving then
		self:_update_check_actions_driver(t, dt, input)
	elseif self._seat.allow_shooting or self._stance == PlayerDriving.STANCE_SHOOTING then
		self:_update_check_actions_passenger(t, dt, input)
	else
		self:_update_check_actions_passenger_no_shoot(t, dt, input)
	end

	self:_upd_nav_data() -- -This is in the vanilla function now
	self:_upd_stance_switch_delay(t, dt)
end)
--]]

--[[
function PlayerDriving:_update_hud(t, dt)
	if self._vehicle_ext.respawn_available then
		if not self._respawn_hint_shown and self._seat.driving then
			local string_macros = {
				BTN_INTERACT = managers.localization:btn_macro("vehicle_exit") --Interact is the wrong key, or rather, this string hasn't been updated to account for the new keybind
			}

			local text = managers.localization:text("hud_int_press_respawn", string_macros)

			self._respawn_hint_shown = true

			managers.hud:show_hint({
				time = 30,
				text = text
			})
		end
	elseif self._respawn_hint_shown then
		managers.hud:stop_hint()

		self._respawn_hint_shown = false
	end
end
--]]

function PlayerDriving:_update_check_actions_passenger(t, dt, input)
	self:_update_check_actions(t, dt)
	self:_check_action_shooting_stance(t, input)
	self:_check_action_night_vision(t, input)
	self:_check_action_weapon_firemode(t, input) --added this to allow for chaning firemode
end

Hooks:PreHook(PlayerDriving, "update", "ResWeaponUpdate", function(self, t, dt)
	if alive(self._equipped_unit) then
		self:_update_burst_fire(t)
		self:_update_slide_locks()
		self:_shooting_move_speed_timer(t, dt)
		self:_last_shot_recoil_t(t, dt)
	end
	self:_update_js_t(t, dt)
	self:_update_d_scope_t(t, dt)
	self:_update_spread_stun_t(t, dt)
	self:_update_drain_stamina(t, dt)
	self:_is_overheating(t, dt)

	local weapon = alive(self._equipped_unit) and self._equipped_unit:base()
	if weapon and weapon:weapon_tweak_data().ads_spool then
		weapon:update_spin()
	end

	if self._queue_idle_interrupt_t and self._queue_idle_interrupt_t <= t then
		self._queue_idle_interrupt_t = nil
		self._ext_camera:play_redirect(self:get_animation("idle"))
	end
	local inventory = alive(self._unit) and self._unit:inventory()
	if inventory then
		for slot = 1, 2 do
			local weapon_slot = inventory:unit_by_selection(slot)
			if alive(weapon_slot) then
				local regen_weapon = weapon_slot:base()
				if regen_weapon and regen_weapon._starwars then
					self:_regen_ammo(t, dt, slot, regen_weapon)
				end
			end
		end
	end
	--Applying (and removing) the conditon for being fully ADS'd
	if self:full_steelsight() and not self._state_data.in_full_steelsight then
		self._state_data.in_full_steelsight = true
	end
	if self._state_data.in_full_steelsight and not self:in_steelsight() then
		self._state_data.in_full_steelsight = nil
	end
end)