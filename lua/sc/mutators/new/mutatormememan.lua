MutatorMememanOnly = MutatorMememanOnly or class(BaseMutator)
MutatorMememanOnly._type = "MutatorMememanOnly"
MutatorMememanOnly.name_id = "mutator_mememanonly"
MutatorMememanOnly.desc_id = "mutator_mememanonly_desc"
MutatorMememanOnly.reductions = {
	money = 0,
	exp = 0
}
MutatorMememanOnly.incompatibility_tags = {
	"replaces_units"
}	
MutatorMememanOnly.disables_achievements = true
MutatorMememanOnly.categories = {"enemies"}
MutatorMememanOnly.icon_coords = {
	8,
	3
}	

function MutatorMememanOnly:setup(data)
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)	
end

function MutatorMememanOnly:modify_unit_categories(group_ai_tweak, difficulty_index)	
	group_ai_tweak.special_unit_spawn_limits = {
	tank = math.huge,
	taser = 0,
	spooc = 0,
	shield = 0,
	medic = 0
}
for group, units_data in pairs(group_ai_tweak.unit_categories) do
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or group == "HVH_Boss" or units_data.ignore_spawn_cap then
	
	else
		for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_mod_dave/characters/ene_big_dave/ene_big_dave"),
				Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
				Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2"),
				Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
				Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2")					
			}		
			end		
		end
	end
end	