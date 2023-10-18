-- Update nav tracker if the player is driving a vehicle
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

	self:_upd_nav_data()
	self:_upd_stance_switch_delay(t, dt)
end)