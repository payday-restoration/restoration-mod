RestorationCoreCallbacks = RestorationCoreCallbacks or {}
RestorationCoreCallbacks._value_changed_funcs = {}

--Any function inside the table will be called, this way we can keep things like hud updated.
function RestorationCoreCallbacks:ValueChanged(key, value)
	for _, func in pairs(self._value_changed_funcs) do
		func()
	end
end

function RestorationCoreCallbacks:AddValueChangedFunc(func)
	table.insert(self._value_changed_funcs, func)
end
