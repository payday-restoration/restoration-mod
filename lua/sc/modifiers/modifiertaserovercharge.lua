ModifierTaserOvercharge = ModifierTaserOvercharge or class(BaseModifier)
ModifierTaserOvercharge._type = "ModifierTaserOvercharge"
ModifierTaserOvercharge.name_id = "none"
ModifierTaserOvercharge.desc_id = "menu_cs_modifier_taser_overcharge"
ModifierTaserOvercharge.default_value = "speed"

--Disable Tase delays on Tasers
function ModifierTaserOvercharge:init(data)
	ModifierTaserOvercharge.super.init(data)
	
	tweak_data.character.taser.weapon.is_rifle.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.normal.is_rifle.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.good.is_rifle.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.expert.is_rifle.aim_delay_tase = {0, 0}
	tweak_data.character.presets.weapon.deathwish.is_rifle.aim_delay_tase = {0, 0}
end

--Killing this function, just in case
function ModifierTaserOvercharge:modify_value(id, value)
end