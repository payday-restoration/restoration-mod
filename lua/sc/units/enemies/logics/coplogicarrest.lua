-- Stop shooting when entering arrest logic
Hooks:PostHook(CopLogicArrest, "enter", "sh_enter", function (data)
	data.unit:movement():set_allow_fire(false)
end)
