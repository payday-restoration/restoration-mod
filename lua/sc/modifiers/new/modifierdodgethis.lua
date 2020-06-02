ModifierDodgeThis = ModifierDodgeThis or class(BaseModifier)
ModifierDodgeThis._type = "ModifierDodgeThis"
ModifierDodgeThis.name_id = "none"
ModifierDodgeThis.desc_id = "menu_cs_modifier_dodgethis"


function ModifierDodgeThis:modify_value(id, value)
    if id == "CopDamage:CheckingDodge" then
        --log("setting vet cop dodge to 100!")
		return 100
	end
	return value
end