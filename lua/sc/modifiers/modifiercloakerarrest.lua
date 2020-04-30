function ModifierCloakerArrest:modify_value(id, value)
	if id == "PlayerMovement:OnJumpSpooked" then
		return "incapacitated"
	end

	return value
end