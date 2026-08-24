if not CoreSequenceManager then return end

function CoreSequenceManager.UnitElement:save_by_unit(unit, data)
	local state = {}
	local changed = false

	for name, _ in pairs(self._bodies) do
		local body = unit.body and unit:body(name)
		if body and body:extension() and body:extension().damage then
			changed = body:extension().damage:save(state) or changed
		else
			--log("SOMETHING IS WRONG WITH BODY NAME: " .. tostring( name ))
			--log("FROM CHAR TWEAK UNIT: " .. tostring( unit and unit.base and unit:base()._tweak_table ))
		end
	end

	if changed then
		data.UnitElement = state
	end

	return changed
end

function CoreSequenceManager.UnitElement:load_by_unit(unit, data)
	local state = data.UnitElement

	if state then
		for name, _ in pairs(self._bodies) do
			local body = unit.body and unit:body(name)
			if body and body:extension() and body:extension().damage then
				body:extension().damage:load(state)
			end
		end
	end
end

-- 64-bit Update 247 compatibility:
-- ResetDamageElement can now invoke UnitElement:reset_damage() on sequence data
-- whose body list does not perfectly match the runtime unit. Vanilla assumes every
-- sequence-defined body exists and crashes when unit:body(name) returns nil.
-- Restoration already guards this mismatch in save_by_unit/load_by_unit; do the
-- same here and log the offending unit/body so the underlying asset can be fixed.
function CoreSequenceManager.UnitElement:reset_damage(unit)
	if not alive(unit) then
		return
	end

	for _, root_body in pairs(self._bodies) do
		local body_name = root_body._name
		local body = unit.body and unit:body(body_name)
		local body_extension = body and body:extension()
		local damage_extension = body_extension and body_extension.damage

		if damage_extension then
			for damage_type, endurance_element in pairs(root_body._first_endurance) do
				damage_extension._endurance[damage_type] = endurance_element
				damage_extension._damage[damage_type] = 0
			end
		else
			local unit_name = unit.name and tostring(unit:name()) or "[unknown unit]"
			local sequence_name = self._name and tostring(self._name) or "[unknown sequence unit]"
			local tweak_name
			if unit.base and unit:base() then
				tweak_name = unit:base()._tweak_table
			end

			log(string.format(
				"[Restoration][64-bit][Sequence] reset_damage skipped missing body '%s' | unit=%s | sequence_unit=%s | tweak=%s",
				tostring(body_name),
				unit_name,
				sequence_name,
				tostring(tweak_name)
			))
		end
	end

	local unit_damage = unit.damage and unit:damage()
	if unit_damage then
		unit_damage._damage = 0
	end
end

--log("CoreSequenceManager changes loaded!")
-- 64-bit Update 247 compatibility:
-- Some converted/custom character sequence managers (notably dozer damage/armor
-- sequences) can reference a Wwise sound source/object that does not exist on the
-- runtime unit. Vanilla WwiseElement has unsafe stop/set_switch paths which call
-- methods on a nil sound source. Keep valid sound behavior byte-for-byte equivalent;
-- only skip the invalid sound operation and log enough context to identify the asset.
local function resmod_sequence_sound_log(self, env, action, source, object, event)
	local unit = env and env.dest_unit
	local unit_name = unit and unit.name and tostring(unit:name()) or "[unknown unit]"
	local tweak_name

	if unit and unit.base and unit:base() then
		tweak_name = unit:base()._tweak_table
	end

	log(string.format(
		"[Restoration][64-bit][SequenceSound] skipped %s: missing sound source | unit=%s | tweak=%s | source=%s | object=%s | event=%s",
		tostring(action),
		unit_name,
		tostring(tweak_name),
		tostring(source),
		tostring(object),
		tostring(event)
	))
end

function CoreSequenceManager.WwiseElement:_get_sound_source(env)
	local unit = env and env.dest_unit

	if not alive(unit) then
		return nil
	end

	local source = self:run_parsed_func(env, self._source)
	local object = self:run_parsed_func(env, self._object)
	local sound_source

	if source then
		if source == "" then
			sound_source = unit:sound_source()
		else
			sound_source = unit:sound_source(Idstring(source))
		end

		if not sound_source then
			self:print_attribute_error("source", source, nil, true, env, nil)
		end
	elseif object then
		local damage_ext = unit.damage and unit:damage()
		sound_source = damage_ext and damage_ext:get_sound_source(object)

		if not sound_source then
			self:print_attribute_error("object", object, nil, true, env, nil)
		end
	end

	return sound_source
end

function CoreSequenceManager.WwiseElement:play(env)
	local unit = env and env.dest_unit

	if not alive(unit) then
		return
	end

	local source = self:run_parsed_func(env, self._source)
	local object = self:run_parsed_func(env, self._object)
	local event = self:run_parsed_func(env, self._event)
	local skip_save = self:run_parsed_func(env, self._skip_save)
	local switch = self:run_parsed_func(env, self._switch)
	local sound_source = self:_get_sound_source(env)

	if not event then
		self:print_attribute_error("event", event, nil, true, env, nil)
		return
	end

	if not sound_source then
		resmod_sequence_sound_log(self, env, "play", source, object, event)
		return
	end

	if switch then
		local switches = string.split(switch, " ")
		local i = 1

		while i < #switches do
			local switch_name = switches[i]
			local value = switches[i + 1]
			sound_source:set_switch(switch_name, value)
			i = i + 2
		end
	end

	sound_source:post_event(event)

	if self.SAVE_STATE and not skip_save and source then
		self:set_cat_state(unit, source, {
			"post_event",
			event
		})
	end
end

function CoreSequenceManager.WwiseElement:stop(env)
	local unit = env and env.dest_unit

	if not alive(unit) then
		return
	end

	local source = self:run_parsed_func(env, self._source)
	local object = self:run_parsed_func(env, self._object)
	local event = self:run_parsed_func(env, self._event)

	if not source then
		self:print_attribute_error("source", source, nil, true, env, nil)
	end

	if not event then
		self:print_attribute_error("event", event, nil, true, env, nil)
		return
	end

	local sound_source = unit:sound_source(source and Idstring(source))

	if not sound_source then
		resmod_sequence_sound_log(self, env, "stop", source, object, event)
		return
	end

	sound_source:stop()

	if self.SAVE_STATE then
		self:set_cat_state(unit, source, {
			"stop",
			event
		})
	end
end

function CoreSequenceManager.WwiseElement:set_switch(env)
	local unit = env and env.dest_unit

	if not alive(unit) then
		return
	end

	local source = self:run_parsed_func(env, self._source)
	local object = self:run_parsed_func(env, self._object)
	local event = self:run_parsed_func(env, self._event)
	local switch = self:run_parsed_func(env, self._switch)
	local sound_source = self:_get_sound_source(env)

	if not sound_source then
		resmod_sequence_sound_log(self, env, "set_switch", source, object, event)
		return
	end

	if switch then
		local switches = string.split(switch, " ")
		local i = 1

		while i < #switches do
			local switch_name = switches[i]
			local value = switches[i + 1]
			sound_source:set_switch(switch_name, value)
			i = i + 2
		end
	end
end
