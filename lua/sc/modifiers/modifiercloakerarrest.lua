if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function ModifierCloakerArrest:modify_value(id, value)
		if id == "PlayerMovement:OnJumpSpooked" then
			return "incapacitated"
		end

		return value
	end

end