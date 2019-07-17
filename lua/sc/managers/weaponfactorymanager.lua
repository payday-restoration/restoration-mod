if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function WeaponFactoryManager:get_part_desc_by_part_id_from_weapon(part_id, factory_id, blueprint)
		local factory = tweak_data.weapon.factory
		local override = self:_get_override_parts(factory_id, blueprint)
		local part = self:_part_data(part_id, factory_id, override)
		local desc_id = part.desc_id or tweak_data.blackmarket.weapon_mods[part_id].desc_id
		local params = {
		BTN_GADGET = managers.localization:btn_macro("weapon_gadget", true),
		BTN_BIPOD = managers.localization:btn_macro("deploy_bipod", true)
		}

		if managers.menu:is_pc_controller() and managers.localization:exists(desc_id .. "_pc")then
				return managers.localization:text(desc_id .. "_pc", params)
			else
				return managers.localization:text(desc_id, params)
			end
		return Application:production_build() and "Add ##desc_id## to ##" .. part_id .. "## in tweak_data.blackmarket.weapon_mods" or ""
	end

	function WeaponFactoryManager:assemble_default(factory_id, p_unit, third_person, npc, done_cb, skip_queue)
		restoration.log_shit("SC: Assemble Default factory_id: " .. factory_id .. ", third_person: " .. tostring(third_person))
		local blueprint = clone(tweak_data.weapon.factory[factory_id].default_blueprint)
		if blueprint then
			restoration.log_shit("SC: Found Blueprint!")
		end
		return self:_assemble(factory_id, p_unit, blueprint, third_person, npc, done_cb, skip_queue), blueprint
	end
	
	function WeaponFactoryManager:assemble_from_blueprint(factory_id, p_unit, blueprint, third_person, npc, done_cb, skip_queue)
		restoration.log_shit("SC: Assemble Blueprint factory_id: " .. factory_id .. ", third_person: " .. tostring(third_person))
		return self:_assemble(factory_id, p_unit, blueprint, third_person, npc, done_cb, skip_queue)
	end
	
	function WeaponFactoryManager:_assemble(factory_id, p_unit, blueprint, third_person, npc, done_cb, skip_queue)
		restoration.log_shit("SC: Beginning _assemble! " .. factory_id .. ", third_person: " .. tostring(third_person))
		if not done_cb then
			Application:error("-----------------------------")
			Application:stack_dump()
		end
		restoration.log_shit("SC: Passed the callback check")
		local factory = tweak_data.weapon.factory
		local factory_weapon = factory[factory_id]
		restoration.log_shit("SC: Checking for Forbidden Parts")
		local forbidden = self:_get_forbidden_parts(factory_id, blueprint)
		restoration.log_shit("SC: Finished!")
		return self:_add_parts(p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person, npc, done_cb, skip_queue)
	end

	function WeaponFactoryManager:_add_parts(p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person, npc, done_cb, skip_queue)
		restoration.log_shit("SC: Beginning _add_parts! " .. factory_id .. ", third_person: " .. tostring(third_person))
		self._tasks = self._tasks or {}
		local parts = {}
		local need_parent = {}
		restoration.log_shit("SC: Getting override parts")
		local override = self:_get_override_parts(factory_id, blueprint)
		restoration.log_shit("SC: Finished!")
		if self._uses_tasks and not skip_queue then
			table.insert(self._tasks, {
				done_cb = done_cb,
				p_unit = p_unit,
				factory_id = factory_id,
				blueprint = blueprint,
				blueprint_i = 1,
				forbidden = forbidden,
				third_person = third_person,
				npc = npc,
				parts = parts,
				need_parent = need_parent,
				need_parent_i = 1,
				override = override
			})
		else
			local async_task_data
			if self._uses_streaming then
				async_task_data = {
					third_person = third_person,
					npc = npc,
					parts = parts,
					done_cb = done_cb,
					blueprint = blueprint,
					spawn = true
				}
				self._async_load_tasks = self._async_load_tasks or {}
				self._async_load_tasks[async_task_data] = true
			end
			for _, part_id in ipairs(blueprint) do
				restoration.log_shit("SC: Adding part: ".. part_id)
				self:_add_part(p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent, async_task_data)
				restoration.log_shit("SC: Finished!")
			end
			for _, part_id in ipairs(need_parent) do
				restoration.log_shit("SC: Adding need parent part: ".. part_id)
				self:_add_part(p_unit, factory_id, part_id, forbidden, override, parts, third_person, need_parent, async_task_data)
				restoration.log_shit("SC: Finished!")
			end
			if async_task_data then
				async_task_data.all_requests_sent = true
				self:clbk_part_unit_loaded(async_task_data, false, Idstring(), Idstring())
			else
				restoration.log_shit("SC: Done callback!")
				done_cb(parts, blueprint)
				restoration.log_shit("SC: Finished!")
			end
			restoration.log_shit("SC: Finished Load!")
		end
		return parts, blueprint
	end

end