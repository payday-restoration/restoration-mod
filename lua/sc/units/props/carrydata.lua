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

function CarryData:link_to(parent_unit, keep_collisions)
	if self._linked_to and managers.groupai:state():is_unit_team_AI(self._linked_to) then
		self._linked_to:movement():set_carrying_bag(nil)
	end

	call_on_next_update(function ()
		if not alive(self._unit) or not alive(parent_unit) then
			return
		end

		local body = self._unit:body("hinge_body_1") or self._unit:body(0)

		body:set_keyframed()

		local parent_obj_name = Idstring("Neck")

		parent_unit:link(parent_obj_name, self._unit)

		local parent_obj = parent_unit:get_object(parent_obj_name)
		local parent_obj_rot = parent_obj:rotation()
		local world_pos = parent_obj:position() - parent_obj_rot:z() * 30 - parent_obj_rot:y() * 10

		self._unit:set_position(world_pos)

		local world_rot = Rotation(parent_obj_rot:x(), -parent_obj_rot:z())

		self._unit:set_rotation(world_rot)
	end)

	self._disabled_collisions = {}
	local nr_bodies = self._unit:num_bodies()

	if keep_collisions then
		self._kept_collisions = true

		self._unit:set_body_collision_callback(function (tag, unit, colliding_body, other_unit, other_body, position, normal, velocity)
			if tag ~= Idstring("throw") then
				return
			end

			if other_unit:unit_data().only_visible_in_editor then -- dev units that don't show up ingame, invisible collision basically
				unit:carry_data():unlink()
			else
				unit:set_disable_collision_with_unit(other_unit)
			end
		end)
	else
		for i_body = 0, nr_bodies - 1 do
			local body = self._unit:body(i_body)

			if body:collisions_enabled() then
				table.insert(self._disabled_collisions, body)
				body:set_collisions_enabled(false)
			end
		end
	end

	if parent_unit:movement().set_carrying_bag then
		parent_unit:movement():set_carrying_bag(self._unit)
	end

	self._linked_to = parent_unit

	if Network:is_server() then
		managers.network:session():send_to_peers_synched("loot_link", self._unit, parent_unit)
	end
end
