function CarryData:_chk_register_steal_SO()
	local body = self._unit:body("hinge_body_1") or self._unit:body(0)

	if not self._has_body_activation_clbk then
		self._has_body_activation_clbk = {
			[body:key()] = true
		}

		self._unit:add_body_activation_callback(callback(self, self, "clbk_body_active_state"))
		body:set_activate_tag(Idstring("bag_moving"))
		body:set_deactivate_tag(Idstring("bag_still"))
	end

	if not Network:is_server() or not managers.navigation:is_data_ready() then
		return
	end

	local tweak_info = tweak_data.carry[self._carry_id]
	local AI_carry = tweak_info.AI_carry

	if not AI_carry then
		return
	end

	if self._steal_SO_data then
		return
	end

	local is_body_active = body:active()

	if is_body_active then
		return
	end

	local SO_category = AI_carry.SO_category
	local SO_filter = managers.navigation:convert_SO_AI_group_to_access(SO_category)
	local tracker_pickup = managers.navigation:create_nav_tracker(self._unit:position(), false)
	local pickup_nav_seg = tracker_pickup:nav_segment()
	local pickup_pos = tracker_pickup:field_position()
	local pickup_area = managers.groupai:state():get_area_from_nav_seg_id(pickup_nav_seg)

	managers.navigation:destroy_nav_tracker(tracker_pickup)

	if pickup_area.enemy_loot_drop_points then
		return
	end

	local drop_pos, drop_nav_seg, drop_area = nil
	local drop_point = managers.groupai:state():get_safe_enemy_loot_drop_point(pickup_nav_seg)

	if drop_point then
		drop_pos = mvector3.copy(drop_point.pos)
		drop_nav_seg = drop_point.nav_seg
		drop_area = drop_point.area
	elseif not self._register_steal_SO_clbk_id then
		self._register_steal_SO_clbk_id = "CarryDataregiserSO" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._register_steal_SO_clbk_id, callback(self, self, "clbk_register_steal_SO"), TimerManager:game():time() + 10)

		return
	end

	local drop_objective = {
		type = "act",
		interrupt_health = 0.9,
		action_duration = 2,
		haste = "walk",
		pose = "crouch",
		interrupt_dis = 700,
		nav_seg = drop_nav_seg,
		pos = drop_pos,
		area = drop_area,
		fail_clbk = callback(self, self, "on_secure_SO_failed"),
		complete_clbk = callback(self, self, "on_secure_SO_completed"),
		action = {
			variant = "untie",
			align_sync = true,
			body_part = 1,
			type = "act"
		}
	}
	local pickup_objective = {
		destroy_clbk_key = false,
		type = "act",
		haste = "run",
		interrupt_health = 0.9,
		pose = "crouch",
		interrupt_dis = 700,
		nav_seg = pickup_nav_seg,
		area = pickup_area,
		pos = pickup_pos,
		chatter_type = "sabotagebags",
		fail_clbk = callback(self, self, "on_pickup_SO_failed"),
		complete_clbk = callback(self, self, "on_pickup_SO_completed"),
		action = {
			variant = "untie",
			align_sync = true,
			body_part = 1,
			type = "act"
		},
		action_duration = math.lerp(1, 2.5, math.random()),
		followup_objective = drop_objective
	}
	local so_descriptor = {
		interval = 0,
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = pickup_objective,
		search_pos = pickup_objective.pos,
		verification_clbk = callback(self, self, "clbk_pickup_SO_verification"),
		AI_group = AI_carry.SO_category,
		admin_clbk = callback(self, self, "on_pickup_SO_administered")
	}
	local so_id = "carrysteal" .. tostring(self._unit:key())
	self._steal_SO_data = {
		SO_registered = true,
		picked_up = false,
		SO_id = so_id,
		pickup_area = pickup_area,
		pickup_objective = pickup_objective
	}

	managers.groupai:state():add_special_objective(so_id, so_descriptor)
	managers.groupai:state():register_loot(self._unit, pickup_area)
end