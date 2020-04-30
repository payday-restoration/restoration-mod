RestorationCoreCallbacks = RestorationCoreCallbacks or {}
RestorationCoreCallbacks._value_changed_funcs = {}

--[[
--Save Force Restart
function RestorationCoreCallbacks:Restart(key, value)
	if restoration.Options:GetValue("SC/SC") == false then
		managers.menu:show_overhaul_dialog()
	elseif restoration.Options:GetValue("SC/SC") == true then
		managers.menu:enable_overhaul_dialog()
	end
	-- DelayedCalls:Add("SCRestartGame", 1, function()
	-- 	log("Game closing in 1 second[s]!")
	-- 	Application:close()
	-- end)
end
]]--

--Any function inside the table will be called, this way we can keep things like hud updated.
function RestorationCoreCallbacks:ValueChanged(key, value)
	for _, func in pairs(self._value_changed_funcs) do
		func()
	end
end

function RestorationCoreCallbacks:AddValueChangedFunc(func)
	table.insert(self._value_changed_funcs, func)
end
