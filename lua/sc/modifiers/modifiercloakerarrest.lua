function ModifierCloakerArrest:modify_value(id, value)
	if id == "PlayerMovement:on_SPOOCed" then
		return "incapacitated"
	end

	return value
end