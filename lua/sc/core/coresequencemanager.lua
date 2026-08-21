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