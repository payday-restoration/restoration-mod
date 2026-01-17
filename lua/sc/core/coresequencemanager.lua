
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