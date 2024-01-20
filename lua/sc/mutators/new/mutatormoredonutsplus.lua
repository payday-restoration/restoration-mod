local faction = tweak_data.levels:get_ai_group_type()
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
MutatorMoreDonutsPlus = MutatorMoreDonutsPlus or class(BaseMutator)
MutatorMoreDonutsPlus._type = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.name_id = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.desc_id = "MutatorMoreDonutsPlus_desc"
MutatorMoreDonutsPlus.reductions = {
	money = 0, --Because you're essentially committing a major atrocity by enabling this mutator.
	exp = 0
}
MutatorMoreDonutsPlus.disables_achievements = true
MutatorMoreDonutsPlus.categories = {"enemies"}
MutatorMoreDonutsPlus.incompatibility_tags = {
	"replaces_units"
}
MutatorMoreDonutsPlus.icon_coords = {
	1,
	4
}	

function MutatorMoreDonutsPlus:setup(data)
	self._groups = self._groups or {}

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)	
	
	if not PackageManager:loaded("packages/miscassetsmutators") then
		PackageManager:load("packages/miscassetsmutators")
	end
end
function MutatorMoreDonutsPlus:modify_unit_categories(group_ai_tweak, difficulty_index)	
	group_ai_tweak.special_unit_spawn_limits = {
	tank = 0,
	taser = 0,
	spooc = 0,
	shield = 0,
	medic = math.huge
}
for group, units_data in pairs(group_ai_tweak.unit_categories) do
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or group == "HVH_Boss" or units_data.ignore_spawn_cap then
	
	else
	for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
	if faction == "russia" or faction == "federales" then	
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_mod_reapers/characters/ene_akan_lpf/ene_akan_lpf"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")					
			}	
	elseif faction == "zombie" then
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")					
			}
	else
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")					
			}
				end		
			end
		end
	end
end