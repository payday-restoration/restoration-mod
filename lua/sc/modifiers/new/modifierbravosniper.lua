--Used just for Skirmish, force Titan Snipers to be replaced by Bravo Snipers after a certain point
ModifierBravoSniper = ModifierBravoSniper or class(BaseModifier)
ModifierBravoSniper._type = "ModifierBravoSniper"
ModifierBravoSniper.name_id = "none"
ModifierBravoSniper.desc_id = "menu_cs_modifier_bravos_sniper"
ModifierBravoSniper.default_value = "spawn_chance"

ModifierBravoSniper.omnia_titans = {
	Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
	Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
}	

ModifierBravoSniper.murky_titans = {
	Idstring("units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper")
}	

ModifierBravoSniper.drak_titans = {
	Idstring("units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper")
}	

local r = tweak_data.levels.ai_groups.russia
local m = tweak_data.levels.ai_groups.murkywater
local b = tweak_data.levels.ai_groups.federales
local z = tweak_data.levels.ai_groups.zombie
local oom = tweak_data.levels.ai_groups.omnia
local ny = tweak_data.levels.ai_groups.nypd
local ai_type = tweak_data.levels:get_ai_group_type()

function ModifierBravoSniper:modify_value(id, value)
	if id == "GroupAIStateBesiege:SpawningUnit" then
		local is_omnia = table.contains(ModifierBravoSniper.omnia_titans, value)
		local is_murky = table.contains(ModifierBravoSniper.murky_titans, value)
		local is_drak = table.contains(ModifierBravoSniper.drak_titans, value)			
		if is_omnia then
			return Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")	
		elseif is_murky then
			return Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky")	
		elseif is_drak then
			if ai_type == b then
				return Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex")	
			elseif ai_type == r then
				return Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru")
			end
		end
	end
	return value
end