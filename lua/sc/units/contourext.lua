ContourExt._types.medic_show = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = tweak_data.contour.character.dangerous_color
}
ContourExt._types.omnia_heal = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(128, 0, 128)
}
ContourExt._types.medic_buff = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
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

local tmp_vec = Vector3()
local mvec3_dis_sq = mvector3.distance_sq
local math_lerp = math.lerp
local tmp_vec1 = Vector3()

--[[
Hooks:PostHook(ContourExt, "init", "res_init", function(self)
	if self._contour_list and not next(self._contour_list) then
		self._contour_list = nil -- why define this as an empty table when every function checks it's not nil to figure out if there's a contour active...
	end
end)

function ContourExt:contour_list()
	return self._contour_list or {}
end

function ContourExt:add(type, sync, multiplier, override_color, is_element)
	self._contour_list = self._contour_list or {}
	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent and managers.groupai:state():whisper_mode() then
		fadeout = data.fadeout_silent
	end

	if fadeout and multiplier then
		fadeout = fadeout * multiplier
	end

	sync = sync and not self._is_child_contour or false

	if sync then
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_add", sync_unit, u_id, table.index_of(ContourExt.indexed_types, type), multiplier or 1)
		else
			sync = nil

			Application:error("[ContourExt:add] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	for _, setup in ipairs(self._contour_list) do
		if setup.type == type then
			if fadeout then
				setup.fadeout_t = TimerManager:game():time() + fadeout
			elseif not setup.data.unique then
				setup.ref_c = setup.ref_c + 1
			end

			if is_element then
				setup.ref_c_element = (setup.ref_c_element or 0) + 1
			end

			local old_color = setup.color or data.color
			setup.color = override_color or nil

			if old_color ~= override_color then
				self:_upd_color()
			end

			return setup
		end
	end

	local setup = {
		ref_c = 1,
		type = type,
		ref_c_element = is_element and 1 or nil,
		sync = sync,
		fadeout_t = fadeout and TimerManager:game():time() + fadeout or nil,
		color = override_color or nil,
		data = data
	}

	if data.ray_check then
		setup.upd_skip_count = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and mov_ext.m_com then
			setup.ray_pos = mov_ext:m_com()
		end
	end

	local i = 1
	local contour_list = self._contour_list
	local old_preset_type = contour_list[1] and contour_list[1].type

	while contour_list[i] and contour_list[i].data.priority <= data.priority do
		i = i + 1
	end

	table.insert(contour_list, i, setup)

	if not old_preset_type or i == 1 and old_preset_type ~= setup.type then
		self:_apply_top_preset()
	end

	if not self._update_enabled then
		self:_chk_update_state()
	end

	if data.damage_bonus or data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if data.trigger_marked_event then
		self:_chk_mission_marked_events(setup)
	end

	self:apply_to_linked("add", type, false, multiplier, override_color)

	return setup
end

function ContourExt:material_applied(material_was_swapped)
	if not self._contour_list then
		return
	end

	local setup = self._contour_list[1]
	local data = setup.data

	if material_was_swapped then
		managers.occlusion:remove_occlusion(self._unit)

		local base_ext = self._unit:base()

		if base_ext and base_ext.set_allow_invisible then
			base_ext:set_allow_invisible(false)
		end

		self:update_materials()
	else
		self._materials = nil

		self:_upd_color()

		if not data.ray_check then
			local opacity = self._last_opacity or 1
			self._last_opacity = nil

			self:_upd_opacity(opacity)
		end
	end
end

function ContourExt:_remove(index, sync, is_element)
	local setup = self._contour_list and self._contour_list[index]

	if not setup then
		return
	end

	if is_element and setup.ref_c_element then
		setup.ref_c_element = setup.ref_c_element - 1

		if setup.ref_c_element <= 0 then
			setup.ref_c_element = nil
		end
	end

	if setup.ref_c and setup.ref_c > 1 then
		setup.ref_c = setup.ref_c - 1

		return
	end

	if #self._contour_list == 1 then
		managers.occlusion:add_occlusion(self._unit)

		local was_swap = nil

		if setup.data.material_swap_required then
			local base_ext = self._unit:base()

			if base_ext and base_ext.set_material_state then
				was_swap = true

				base_ext:set_material_state(true)

				if base_ext.set_allow_invisible then
					base_ext:set_allow_invisible(true)
				end
			end
		end

		if not was_swap then
			for _, material in ipairs(self._materials) do
				material:set_variable(idstr_contour_opacity, 0)
			end
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
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_remove", sync_unit, u_id, table.index_of(ContourExt.indexed_types, setup.type))
		else
			Application:error("[ContourExt:_remove] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	if self._update_enabled then
		self:_chk_update_state()
	end

	if setup.data.damage_bonus or setup.data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if setup.data.trigger_marked_event then
		self:_chk_mission_marked_events()
	end
end

function ContourExt:update(unit, t, dt)
	self._materials = nil -- lod changes seem to break the material cache, so i'm just refreshing it every frame

	local index = 1
	local setup, cam_pos, is_current = nil
	local ray_check_slotmask = self._slotmask_world_geometry

	while self._contour_list and index <= #self._contour_list do
		setup = self._contour_list[index]
		is_current = index == 1

		if setup.fadeout_t and setup.fadeout_t < t then
			self:remove(setup.type, false, false)
		else
			local turn_off = nil

			if is_current and setup.data.ray_check then
				if setup.upd_skip_count > 0 then
					setup.upd_skip_count = setup.upd_skip_count - 1

					if self._last_opacity == 0 then
						turn_off = true
					else
						turn_off = false
					end
				else
					setup.upd_skip_count = ContourExt.raycast_update_skip_count
					local turn_on = false
					cam_pos = cam_pos or managers.viewport:get_current_camera_position()

					if cam_pos then
						local ray_pos = setup.ray_pos

						if not ray_pos then
							ray_pos = tmp_vec

							unit:m_position(ray_pos)
						end

						turn_on = mvec3_dis_sq(cam_pos, ray_pos) > 16000000 or unit:raycast("ray", cam_pos, ray_pos, "slot_mask", ray_check_slotmask, "report")
					end

					if setup.data.persistence then
						if turn_on then
							setup.last_turned_on_t = t
						else
							local last_t = setup.last_turned_on_t

							if not last_t or setup.data.persistence < t - last_t then
								turn_off = true
								setup.last_turned_on_t = nil
							end
						end
					else
						turn_off = not turn_on
					end
				end
			end

			if setup.flash_t then
				local flash = setup.flash_on

				if setup.flash_t < t then
					setup.flash_t = setup.flash_t + setup.flash_frequency
					flash = not flash
					setup.flash_on = flash
				end

				turn_off = turn_off or not flash
			elseif setup.fadeout_start_t and is_current then
				opacity = (t - setup.fadeout_start_t) / (setup.fadeout_t - setup.fadeout_start_t)
				opacity = 1 - math.max(opacity, 0)
			end

			if is_current then
				if turn_off then
					self:_upd_opacity(0)
				else
					self:_upd_opacity(self.mod_lerp_opacity and setup.fadeout_t and math_lerp(1, 0, t / setup.fadeout_t) or 1)
				end
			end

			index = index + 1
		end
	end
end

function ContourExt:_upd_opacity(opacity, is_retry, no_child_upd)
	if opacity == self._last_opacity then
		return
	end

	self._last_opacity = opacity
	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if not alive(material) then
			self:update_materials()

			if not is_retry then
				self:_upd_opacity(opacity, true, true)
			end

			break
		end

		material:set_variable(idstr_contour_opacity, opacity)
	end

	self._last_opacity = opacity
	self:_upd_color(opacity, is_retry) -- pass is_retry so it doesn't waste time invalidating the cache if it didn't fix itself here

	if not no_child_upd then
		self:apply_to_linked("_upd_opacity", opacity)
	end
end

function ContourExt:_upd_color(is_retry, no_child_upd)
	local setup = self._contour_list and self._contour_list[1]

	if not setup then
		return
	end

	local color = setup.color or setup.data.color

	if not color then
		return
	end

	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if not alive(material) then
			self:update_materials()

			if not is_retry then
				self:_upd_color(true, true)
			end

			break
		end

		material:set_variable(idstr_contour_color, color)
	end


	if not no_child_upd then
		self:apply_to_linked("_upd_color")
	end
end

function ContourExt:update_materials()
	if self._contour_list then
		self._materials = nil

		self:_upd_color()

		local opacity = self._last_opacity or 1
		self._last_opacity = nil

		self:_upd_opacity(opacity, true) -- opacity also updates colour
	end
end

--]]