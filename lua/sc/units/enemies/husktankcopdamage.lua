local ids_face_plate = Idstring("body_helmet_plate")
local ids_visor = Idstring("body_helmet_glass")

HuskTankCopDamage.IS_TANK = true

function HuskTankCopDamage:is_head(...)
	return TankCopDamage.is_head(self, ...)
end