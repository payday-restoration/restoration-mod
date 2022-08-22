ContourExt._types.medic_show = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = tweak_data.contour.character.dangerous_color
}
ContourExt._types.omnia_heal = {
	priority = 1,
	material_swap_required = true,
	fadeout = 300000,
	color = Vector3(128, 0, 128)
}
ContourExt._types.medic_buff = {
	priority = 1,
	material_swap_required = true,
	fadeout = 300000,
	color = Vector3(255, 140, 0)
}
ContourExt._types.deployable_blackout = { --for autumn's deployable disabling ability
	priority = 1,
	color = Vector3(0.5,0,1)
}

ContourExt._types.mark_unit_dangerous.priority = 5
ContourExt._types.mark_unit_dangerous_damage_bonus.color = tweak_data.contour.character.more_dangerous_color
ContourExt._types.mark_unit_dangerous_damage_bonus_distance.color = tweak_data.contour.character.more_dangerous_color

local idstr_contour = Idstring("contour")
local idstr_material = Idstring("material")
local idstr_contour_color = Idstring("contour_color")
local idstr_contour_opacity = Idstring("contour_opacity")

local tmp_vec1 = Vector3()

Hooks:PostHook(ContourExt, "init", "res_init", function(self)
	if self._contour_list and not next(self._contour_list) then
		self._contour_list = nil -- why define this as an empty table when every function checks it's not nil to figure out if there's a contour active...
	end
end)

function ContourExt:contour_list()
	return self._contour_list or {}
end

function ContourExt:add(type, sync, multiplier, override_color, add_as_child)
	if Global.debug_contour_enabled then
		return
	end

	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent and managers.groupai:state():whisper_mode() and self._unit:base():char_tweak().silent_priority_shout then
		fadeout = data.fadeout_silent
	end

	if multiplier and multiplier > 1 then
		fadeout = fadeout * multiplier
	end

	self._contour_list = self._contour_list or {}
	self._is_child_contour = add_as_child and true or false

	if sync then
		local u_id = self._unit:id()

		if u_id == -1 then
			u_id = managers.enemy:get_corpse_unit_data_from_key(self._unit:key()).u_id
		end

		managers.network:session():send_to_peers_synched("sync_contour_state", self._unit, u_id, table.index_of(ContourExt.indexed_types, type), true, multiplier or 1)
	end

	local should_trigger_marked_event = data.trigger_marked_event
	local damage_bonus = data.damage_bonus
	local damage_bonus_dis = data.damage_bonus_distance

	for _, setup in ipairs(self._contour_list) do
		if not damage_bonus then
			damage_bonus = self._types[setup.type].damage_bonus
		end

		if not damage_bonus_dis then
			damage_bonus_dis = self._types[setup.type].damage_bonus_distance
		end

		if setup.type == type then
			if fadeout then
				setup.fadeout_t = TimerManager:game():time() + fadeout
				setup.fadeout_start_t = TimerManager:game():time() + fadeout * 0.8
			elseif not self._types[setup.type].unique then
				setup.ref_c = (setup.ref_c or 0) + 1
			end
			
			setup.color = override_color or setup.color

			if damage_bonus then
				self._unit:character_damage():on_marked_state(damage_bonus, damage_bonus_dis)
			end

			return setup
		end

		if self._types[setup.type].trigger_marked_event then
			should_trigger_marked_event = false
		end
	end

	if damage_bonus then
		self._unit:character_damage():on_marked_state(damage_bonus, damage_bonus_dis)
	end

	local setup = {
		ref_c = 1,
		type = type,
		fadeout_t = fadeout and TimerManager:game():time() + fadeout or nil,
		fadeout_start_t = fadeout and TimerManager:game():time() + fadeout * 0.8 or nil,
		sync = sync,
		color = override_color
	}
	local old_preset_type = self._contour_list[1] and self._contour_list[1].type
	local i = 1

	while self._contour_list[i] and self._types[self._contour_list[i].type].priority <= data.priority do
		i = i + 1
	end

	table.insert(self._contour_list, i, setup)

	if old_preset_type ~= setup.type then
		self:_apply_top_preset()
	end

	if not self._update_enabled then
		self:_chk_update_state()
	end

	self:apply_to_linked("add", type, sync, multiplier)

	if should_trigger_marked_event and self._unit:unit_data().mission_element then
		self._unit:unit_data().mission_element:event("marked", self._unit)
	end

	return setup
end

function ContourExt:material_applied(material_was_swapped)
	if not self._contour_list then
		return
	end

	local setup = self._contour_list[1]
	local data = self._types[setup.type]

	if material_was_swapped then
		managers.occlusion:remove_occlusion(self._unit)
		self._unit:base():set_allow_invisible(false)
		self:update_materials()
	else
		self._materials = nil

		self:_upd_color()

		if not data.ray_check then
			self:_upd_opacity(1)
		end
	end
end

function ContourExt:_remove(index, sync)
	local setup = self._contour_list and self._contour_list[index]

	if not setup then
		return
	end

	local contour_type = setup.type
	local data = self._types[setup.type]
	local should_disable_damage_bonus = data.damage_bonus
	local keep_damage_bonus_dis = nil

	if should_disable_damage_bonus then
		for _, setup in ipairs(self._contour_list) do
			if should_disable_damage_bonus and self._types[setup.type].damage_bonus then
				should_disable_damage_bonus = nil
			end

			keep_damage_bonus_dis = keep_damage_bonus_dis or self._types[setup.type].damage_bonus_distance
		end

		local dmg_bonus_state = keep_damage_bonus_dis and true or should_disable_damage_bonus and false or true

		self._unit:character_damage():on_marked_state(dmg_bonus_state, keep_damage_bonus_dis)
	end

	if setup.ref_c and setup.ref_c > 1 then
		setup.ref_c = setup.ref_c - 1

		return
	end

	if #self._contour_list == 1 then
		managers.occlusion:add_occlusion(self._unit)

		if data.material_swap_required then
			self._unit:base():set_material_state(true)
			self._unit:base():set_allow_invisible(true)
		else
			self:_upd_opacity(0)
		end
	end

	self._last_opacity = nil

	table.remove(self._contour_list, index)

	if #self._contour_list == 0 then
		self:_clear()
	elseif index == 1 then
		self:_apply_top_preset()
	end

	if sync then
		local u_id = self._unit:id()

		if u_id == -1 then
			u_id = managers.enemy:get_corpse_unit_data_from_key(self._unit:key()).u_id
		end

		managers.network:session():send_to_peers_synched("sync_contour_state", self._unit, u_id, table.index_of(ContourExt.indexed_types, contour_type), false, 1)
	end

	if data.trigger_marked_event then
		local should_trigger_unmarked_event = true

		for _, setup in ipairs(self._contour_list or {}) do
			if self._types[setup.type].trigger_marked_event then
				should_trigger_unmarked_event = false

				break
			end
		end

		if should_trigger_unmarked_event and self._unit:unit_data().mission_element then
			self._unit:unit_data().mission_element:event("unmarked", self._unit)
		end
	end
end

function ContourExt:update(unit, t, dt)
	self._materials = nil -- lod changes seem to break the material cache, so i'm just refreshing it every frame

	local index = 1
	while self._contour_list and index <= #self._contour_list do
		local setup = self._contour_list[index]
		if setup.fadeout_t and setup.fadeout_t < t then
			self:_remove(index)
			self:_chk_update_state()
		else
			local data = self._types[setup.type]
			local is_current = index == 1
			if data.ray_check and unit:movement() and is_current then
				local turn_on = nil
				local cam_pos = managers.viewport:get_current_camera_position()
				if cam_pos then
					turn_on = mvector3.distance_sq(cam_pos, unit:movement():m_com()) > 16000000 or unit:raycast("ray", unit:movement():m_com(), cam_pos, "slot_mask", self._slotmask_world_geometry, "report")
				end

				local target_opacity = turn_on and 1 or 0
				if self._last_opacity ~= target_opacity then
					local opacity = math.step(self._last_opacity or 0, target_opacity, dt / data.persistence)

					self:_upd_opacity(opacity)
				end
			end

			if setup.flash_t then
				if setup.flash_t < t then
					setup.flash_t = t + setup.flash_frequency
					setup.flash_on = not setup.flash_on
				end

				if is_current then
					local opacity = (setup.flash_t - t) / setup.flash_frequency
					opacity = setup.flash_on and opacity or 1 - opacity

					self:_upd_opacity(opacity)
				end
			elseif setup.fadeout_start_t and is_current then
				local opacity = (t - setup.fadeout_start_t) / (setup.fadeout_t - setup.fadeout_start_t)
				opacity = 1 - math.max(opacity, 0)

				if self._last_opacity ~= opacity then
					self:_upd_opacity(opacity)
				end
			end

			index = index + 1
		end
	end
end

function ContourExt:_upd_opacity(opacity, is_retry)
	if opacity == self._last_opacity then
		return
	end

	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if alive(material) then
			material:set_variable(idstr_contour_opacity, opacity)
		elseif not is_retry then
			self._last_opacity = opacity
			return self:update_materials()
		end
	end

	self._last_opacity = opacity
	self:_upd_color(opacity, is_retry) -- pass is_retry so it doesn't waste time invalidating the cache if it didn't fix itself here

	self:apply_to_linked("_upd_opacity", opacity)
end

function ContourExt:_upd_color(opacity, is_retry)
	if not self._contour_list then
		return
	end

	local contour_color = self._contour_list[1].color or self._types[self._contour_list[1].type].color
	if not contour_color then
		return
	end

	opacity = opacity or 1
	local color = tmp_vec1

	mvector3.set(color, contour_color)
	mvector3.multiply(color, opacity)

	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if alive(material) then
			material:set_variable(idstr_contour_color, color)
		elseif not is_retry then
			return self:update_materials()
		end
	end

	self:apply_to_linked("_upd_color", opacity)
end

function ContourExt:update_materials()
	if self._contour_list then
		self._materials = nil

		local opacity = self._last_opacity or 1
		self._last_opacity = nil

		self:_upd_opacity(opacity, true) -- opacity also updates colour
	end
end
