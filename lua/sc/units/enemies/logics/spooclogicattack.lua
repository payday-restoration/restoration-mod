if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function SpoocLogicAttack._is_last_standing_criminal(focus_enemy)
		local all_criminals = managers.groupai:state():all_char_criminals()

		for u_key, u_data in pairs(all_criminals) do
			if not u_data.status and focus_enemy.u_key ~= u_key then
				return
			end
		end

		return true
	end

end