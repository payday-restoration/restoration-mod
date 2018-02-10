if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	local ids_face_plate = Idstring("body_helmet_plate")
	local ids_visor = Idstring("body_helmet_glass")

	function HuskTankCopDamage:is_head(...)
		return TankCopDamage.is_head(self, ...)
	end

end