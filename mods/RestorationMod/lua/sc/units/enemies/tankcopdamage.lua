if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	local ids_face_plate = Idstring("body_helmet_plate")
	local ids_visor = Idstring("body_helmet_glass")

	function TankCopDamage:is_head(body)
		return body and (body:name() == ids_face_plate or body:name() == ids_visor or TankCopDamage.super.is_head(self, body))
	end

end