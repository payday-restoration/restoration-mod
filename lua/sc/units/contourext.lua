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

function ContourExt:add(type, sync, multiplier, override_color)
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