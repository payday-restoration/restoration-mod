ModifierSniperAim = ModifierSniperAim or class(BaseModifier)
ModifierSniperAim._type = "ModifierSniperAim"
ModifierSniperAim.name_id = "none"
ModifierSniperAim.desc_id = "menu_cs_modifier_sniper_aim"
ModifierSniperAim.default_value = "speed"


function ModifierSniperAim:modify_value(id, value)
	log(tostring(value[1] / self:value()) .. tostring(value[2] / self:value()))
	return {value[1] / self:value(), value[2] / self:value()}
end