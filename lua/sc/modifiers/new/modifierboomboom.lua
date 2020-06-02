ModifierBoomBoom = ModifierBoomBoom or class(BaseModifier)
ModifierBoomBoom._type = "ModifierBoomBoom"
ModifierBoomBoom.name_id = "none"
ModifierBoomBoom.desc_id = "menu_cs_modifier_boomboom"



function ModifierBoomBoom:modify_value(id, value)
    if id == "CopDamage:CanBoomBoom" then
        return true
	end
	return value
end