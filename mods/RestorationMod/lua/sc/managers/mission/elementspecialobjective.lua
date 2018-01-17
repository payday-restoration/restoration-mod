if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function ElementSpecialObjective:on_executed(instigator)
	if not self._values.enabled or Network:is_client() then
		return
	end

	if not managers.groupai:state():is_AI_enabled() and not Application:editor() then
		-- Nothing
	elseif self._values.spawn_instigator_ids then
		local chosen_units, objectives = self:_select_units_from_spawners()

		if chosen_units then
			for i, chosen_unit in ipairs(chosen_units) do
				self:_administer_objective(chosen_unit, objectives[i])
			end
		end
	elseif self._values.use_instigator then
		if self:_is_nav_link() then
			Application:error("[ElementSpecialObjective:on_executed] Ambiguous nav_link/SO. Element id:", self._id)
		elseif type_name(instigator) == "Unit" and alive(instigator) then
			if instigator:brain() then
				if (not instigator:character_damage() or not instigator:character_damage():dead()) and not instigator:brain().SO_access then
					debug_pause_unit(instigator, "Unit does not have an SO_access function in it's brain!")
					ElementSpecialObjective.super.on_executed(self, instigator)

					return
				end

				if (not instigator:character_damage() or not instigator:character_damage():dead()) then
					local objective = self:get_objective(instigator)

					if objective then
						self:_administer_objective(instigator, objective)
					end
				end
			else
				Application:error("[ElementSpecialObjective:on_executed] Special Objective instigator is not an AI unit. Possibly improper \"use instigator\" flag use. Element id:", self._id)
			end
		elseif not instigator then
			Application:error("[ElementSpecialObjective:on_executed] Special Objective missing instigator. Possibly improper \"use instigator\" flag use. Element id:", self._id)
		end
	elseif self:_is_nav_link() then
		if self._values.so_action then
			managers.navigation:register_anim_nav_link(self)
		else
			Application:error("[ElementSpecialObjective:on_executed] Nav link without animation specified. Element id:", self._id)
		end
	else
		local objective = self:get_objective(instigator)

		if objective then
			local search_dis_sq = self._values.search_distance
			search_dis_sq = search_dis_sq and search_dis_sq * search_dis_sq or nil
			local so_descriptor = {
				objective = objective,
				base_chance = self:_get_default_value_if_nil("base_chance"),
				chance_inc = self:_get_default_value_if_nil("chance_inc"),
				interval = self._values.interval,
				search_dis_sq = search_dis_sq,
				search_pos = self._values.search_position,
				usage_amount = self._values.trigger_times,
				AI_group = self._AI_GROUPS[self:_get_default_value_if_nil("ai_group")],
				access = tonumber(self._values.SO_access),
				repeatable = self._values.repeatable,
				admin_clbk = callback(self, self, "clbk_objective_administered")
			}

			managers.groupai:state():add_special_objective(self._id, so_descriptor)
		end
	end

	ElementSpecialObjective.super.on_executed(self, instigator)
end


function ElementSpecialObjective:_select_units_from_spawners()
	local candidates = {}
	local objectives = {}

	for _, element_id in ipairs(self._values.spawn_instigator_ids) do
		local spawn_element = managers.mission:get_element_by_id(element_id)

		for _, unit in ipairs(spawn_element:units()) do
			if alive(unit) and (not unit:character_damage() or not unit:character_damage():dead()) then
				local objective = self:get_objective(unit)

				if objective and (self._values.forced or unit:brain():is_available_for_assignment(objective)) then
					table.insert(candidates, unit)
					table.insert(objectives, objective)
				end
			end
		end
	end

	local wanted_nr_units = nil

	if self._values.trigger_times and self._values.trigger_times > 0 then
		wanted_nr_units = self._values.trigger_times
	else
		return candidates, objectives
	end

	wanted_nr_units = math.min(wanted_nr_units, #candidates)
	local chosen_units = {}
	local chosen_objectives = {}

	for i = 1, wanted_nr_units, 1 do
		local i_unit = math.random(#candidates)
		local chosen_unit = table.remove(candidates, i_unit)

		table.insert(chosen_units, chosen_unit)
		table.insert(chosen_objectives, table.remove(objectives, i_unit))
	end

	return chosen_units, chosen_objectives
end

function ElementSpecialObjective:choose_followup_SO(unit, skip_element_ids)
	if not self._values.followup_elements then
		return
	end

	if skip_element_ids == nil then
		skip_element_ids = self._values.allow_followup_self and self:enabled() and {} or {[self._id] = true}
	end

	local total_weight = 0
	local pool = {}

	for _, followup_element_id in ipairs(self._values.followup_elements) do
		local weight = nil
		local followup_element = managers.mission:get_element_by_id(followup_element_id)

		if followup_element:enabled() then
			followup_element, weight = followup_element:get_as_followup(unit, skip_element_ids)

			if followup_element and followup_element:enabled() and weight > 0 then
				table.insert(pool, {
					element = followup_element,
					weight = weight
				})

				total_weight = total_weight + weight
			end
		end
	end

	if not next(pool) or total_weight <= 0 then
		return
	end

	local lucky_w = math.random() * total_weight
	local accumulated_w = 0

	for i, followup_data in ipairs(pool) do
		accumulated_w = accumulated_w + followup_data.weight

		if lucky_w <= accumulated_w then
			return pool[i].element
		end
	end
end

function ElementSpecialObjective:get_as_followup(unit, skip_element_ids)
	if (not unit or self:clbk_verify_administration(unit)) and not skip_element_ids[self._id] then
		return self, self:_get_default_value_if_nil("base_chance")
	end

	self:event("admin_fail", unit)
end

end