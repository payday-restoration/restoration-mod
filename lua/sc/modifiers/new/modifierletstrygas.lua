ModifierLetsTryGas = ModifierLetsTryGas or class(BaseModifier)
ModifierLetsTryGas._type = "ModifierLetsTryGas"
ModifierLetsTryGas.name_id = "none"
ModifierLetsTryGas.desc_id = "menu_cs_modifier_letstrygas"

function ModifierLetsTryGas:modify_value(id, value)
    if id == "GroupAIStateBase:SpawningSmoke" then
        return Idstring("units/weapons/cs_grenade_quick/cs_grenade_quick")
    elseif id == "GroupAIStateBase:CheckingVoiceLine" then
        return "g42x_any"
    end
    return value
end