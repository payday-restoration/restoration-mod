-- Remove contour from traded hostages and make them invulnerable
Hooks:PostHook(CopLogicTrade, "on_trade", "sh_on_trade", function (data)
	if not data.internal_data.fleeing then
		return
	end

	data.unit:character_damage():set_invulnerable(true)
	data.unit:network():send("set_unit_invulnerable", true, data.unit:character_damage()._immortal)
	data.unit:contour():remove("hostage_trade", true)
end)