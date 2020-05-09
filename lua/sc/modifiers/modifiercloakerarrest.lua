function ModifierCloakerArrest:modify_value(id, value)
	if id == "PlayerMovement:OnSpooked" then
		return "incapacitated"
	end

	return value
end