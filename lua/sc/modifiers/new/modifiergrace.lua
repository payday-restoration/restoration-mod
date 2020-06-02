ModifierGrace = ModifierGrace or class(BaseModifier)
ModifierGrace._type = "ModifierGrace"
ModifierGrace.name_id = "none"
ModifierGrace.desc_id = "menu_cs_modifier_grace"
ModifierGrace.default_value = "penalty"

function ModifierGrace:modify_value(id, value)
    if id == "PlayerDamage:CheckingGrace" then
        local penalty = self:value()
        local new_grace = math.max(value - penalty, 0)
        return new_grace
    end

    return value
end