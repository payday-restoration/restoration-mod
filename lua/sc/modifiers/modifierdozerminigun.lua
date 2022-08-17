ModifierDozerMinigun.default_value = "spawn_chance"

function ModifierDozerMinigun:init(data)
	ModifierDozerMinigun.super.init(self, data)
	
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	
	local mini_unit_name = Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	local classic_mini_unit_name = Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer")
	
	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_mini_unit_name)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, classic_mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"))
		table.insert(unit_types.nypd, classic_mini_unit_name)
		table.insert(unit_types.lapd, classic_mini_unit_name)		
	
		table.insert(unit_types_black.america, classic_mini_unit_name)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, classic_mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"))
		table.insert(unit_types_black.nypd, classic_mini_unit_name)
		table.insert(unit_types_black.lapd, classic_mini_unit_name)				
	else	
		table.insert(unit_types.america, mini_unit_name)
		table.insert(unit_types.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types.zombie, mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types.nypd, mini_unit_name)
		table.insert(unit_types.lapd, mini_unit_name)	
	
		table.insert(unit_types_black.america, mini_unit_name)
		table.insert(unit_types_black.russia, Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"))
		table.insert(unit_types_black.zombie, mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(unit_types_black.nypd, mini_unit_name)
		table.insert(unit_types_black.lapd, mini_unit_name)		
	end
end

function ModifierDozerMinigun:modify_value(id, value)
end