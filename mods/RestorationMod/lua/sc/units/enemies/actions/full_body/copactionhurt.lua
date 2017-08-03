if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function CopActionHurt:clbk_shooting_hurt()
	self._delayed_shooting_hurt_clbk_id = nil
	if not alive(self._weapon_unit) then
		return
	end
	local fire_obj = self._weapon_unit:get_object(Idstring("fire"))
	if fire_obj then
		self._weapon_unit:base():singleshot(fire_obj:position(), fire_obj:rotation(), 1, false, nil, nil, nil, nil)
	end
end

end