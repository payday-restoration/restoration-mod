--Used just for Skirmish, LPFs/Winters overheal shield units after a certain point
ModifierUberChargeShields = ModifierUberChargeShields or class(BaseModifier)
ModifierUberChargeShields._type = "ModifierUberChargeShields"
ModifierUberChargeShields.name_id = "none"
ModifierUberChargeShields.desc_id = "menu_cs_modifier_uberchargeshields"


function ModifierUberChargeShields:init(data)
	tweak_data.character.shield.overheal_mult = 2
	tweak_data.character.phalanx_minion.overheal_mult = 2
	tweak_data.character.phalanx_minion_assault.overheal_mult = 2
	tweak_data.character.marshal_shield.overheal_mult = 2
end