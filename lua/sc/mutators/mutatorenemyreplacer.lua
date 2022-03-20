--Minigun Dozers--
MutatorMinidozers = MutatorMinidozers or class(BaseMutator)
MutatorMinidozers._type = "MutatorMinidozers"
MutatorMinidozers.name_id = "mutator_minidozers"
MutatorMinidozers.desc_id = "mutator_minidozers_desc"
MutatorMinidozers.reductions = {
	money = 0,
	exp = 0
}
MutatorMinidozers.disables_achievements = false
MutatorMinidozers.categories = {"enemies"}
MutatorMinidozers.icon_coords = {
	6,
	1
}

function MutatorMinidozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	
	local mini_unit_name = Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	local classic_mini_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
	
	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_mini_unit_name)
		table.insert(unit_types.russia, classic_mini_unit_name)
		table.insert(unit_types.zombie, classic_mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types.murkywater, classic_medic_unit_name)
		table.insert(unit_types.nypd, classic_mini_unit_name)
		table.insert(unit_types.lapd, classic_mini_unit_name)		
	
		table.insert(unit_types_black.america, classic_mini_unit_name)
		table.insert(unit_types_black.russia, classic_mini_unit_name)
		table.insert(unit_types_black.zombie, classic_mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))
		table.insert(unit_types_black.murkywater, classic_medic_unit_name)
		table.insert(unit_types_black.nypd, classic_mini_unit_name)
		table.insert(unit_types_black.lapd, classic_mini_unit_name)				
	else	
		table.insert(unit_types.america, mini_unit_name)
		table.insert(unit_types.russia, mini_unit_name)
		table.insert(unit_types.zombie, mini_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))		
		table.insert(unit_types.murkywater, mini_unit_name)
		table.insert(unit_types.nypd, mini_unit_name)
		table.insert(unit_types.lapd, mini_unit_name)	
	
		table.insert(unit_types_black.america, mini_unit_name)
		table.insert(unit_types_black.russia, mini_unit_name)
		table.insert(unit_types_black.zombie, mini_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))		
		table.insert(unit_types_black.murkywater, mini_unit_name)
		table.insert(unit_types_black.nypd, mini_unit_name)
		table.insert(unit_types_black.lapd, mini_unit_name)		
	end
end	

--Medic Dozers--
MutatorMedicdozers = MutatorMedicdozers or class(BaseMutator)
MutatorMedicdozers._type = "MutatorMedicdozers"
MutatorMedicdozers.name_id = "mutator_medicdozers"
MutatorMedicdozers.desc_id = "mutator_medicdozers_desc"
MutatorMedicdozers.reductions = {
	money = 0,
	exp = 0
}
MutatorMedicdozers.disables_achievements = false
MutatorMedicdozers.categories = {"enemies"}
MutatorMedicdozers.icon_coords = {
	6,
	1
}

function MutatorMedicdozers:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	local unit_types = tweak_data.group_ai.unit_categories.FBI_tank.unit_types
	local unit_types_black = tweak_data.group_ai.unit_categories.BLACK_tank.unit_types
	local unit_types_skull = tweak_data.group_ai.unit_categories.SKULL_tank.unit_types
	
	local medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
	local classic_medic_unit_name = Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic")

	if difficulty_index <= 7 then 
		table.insert(unit_types.america, classic_medic_unit_name)
		table.insert(unit_types.russia, classic_medic_unit_name)
		table.insert(unit_types.zombie, classic_medic_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, classic_medic_unit_name)
		table.insert(unit_types.lapd, classic_medic_unit_name)
		
		table.insert(unit_types_black.america, classic_medic_unit_name)
		table.insert(unit_types_black.russia, classic_medic_unit_name)
		table.insert(unit_types_black.zombie, classic_medic_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, classic_medic_unit_name)
		table.insert(unit_types_black.lapd, classic_medic_unit_name)

		table.insert(unit_types_skull.america, classic_medic_unit_name)
		table.insert(unit_types_skull.russia, classic_medic_unit_name)
		table.insert(unit_types_skull.zombie, classic_medic_unit_name)
		table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, classic_medic_unit_name)
		table.insert(unit_types_skull.lapd, classic_medic_unit_name)			
	else
		table.insert(unit_types.america, medic_unit_name)
		table.insert(unit_types.russia, medic_unit_name)
		table.insert(unit_types.zombie, medic_unit_name)
		table.insert(unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types.nypd, medic_unit_name)
		table.insert(unit_types.lapd, medic_unit_name)
		
		table.insert(unit_types_black.america, medic_unit_name)
		table.insert(unit_types_black.russia, medic_unit_name)
		table.insert(unit_types_black.zombie, medic_unit_name)
		table.insert(unit_types_black.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_black.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_black.nypd, medic_unit_name)
		table.insert(unit_types_black.lapd, medic_unit_name)

		table.insert(unit_types_skull.america, medic_unit_name)
		table.insert(unit_types_skull.russia, medic_unit_name)
		table.insert(unit_types_skull.zombie, medic_unit_name)
		table.insert(unit_types_skull.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))
		table.insert(unit_types_skull.murkywater, Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"))
		table.insert(unit_types_skull.nypd, medic_unit_name)
		table.insert(unit_types_skull.lapd, medic_unit_name)					
	end		
end

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
	6,
	1
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
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
	
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

MutatorMoreDonutsPlus = MutatorMoreDonutsPlus or class(BaseMutator)
MutatorMoreDonutsPlus._type = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.name_id = "MutatorMoreDonutsPlus"
MutatorMoreDonutsPlus.desc_id = "MutatorMoreDonutsPlus_desc"
MutatorMoreDonutsPlus.reductions = {
	money = 0.5, --Because you're essentially committing a major atrocity by enabling this mutator.
	exp = 0.5
}
MutatorMoreDonutsPlus.disables_achievements = true
MutatorMoreDonutsPlus.categories = {"enemies"}
MutatorMoreDonutsPlus.incompatibility_tags = {
	"replaces_units"
}
MutatorMoreDonutsPlus.icon_coords = {
	6,
	1
}	

function MutatorMoreDonutsPlus:setup(data)
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)	
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
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
	
	else
		for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")					
			}		
			end		
		end
	end
end		

MutatorJungleInferno = MutatorJungleInferno or class(BaseMutator)
MutatorJungleInferno._type = "MutatorJungleInferno"
MutatorJungleInferno.name_id = "MutatorJungleInferno"
MutatorJungleInferno.desc_id = "MutatorJungleInferno_desc"
MutatorJungleInferno.reductions = {
	money = 0,
	exp = 0
}
MutatorJungleInferno.incompatibility_tags = {
	"replaces_units"
}		
MutatorJungleInferno.disables_achievements = true
MutatorJungleInferno.categories = {"enemies"}
MutatorJungleInferno.icon_coords = {
	6,
	1
}	

function MutatorJungleInferno:setup(data)
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)
	tweak_data.character.summers.announce_incomming = nil
	tweak_data.character.summers.ends_assault_on_death = false --never ending assaults ;^)
	tweak_data.character.summers.spawn_sound_event = "cloaker_spawn"		
end

function MutatorJungleInferno:modify_unit_categories(group_ai_tweak, difficulty_index)	
	group_ai_tweak.special_unit_spawn_limits = {
	tank = 0,
	taser = 0,
	spooc = 0,
	shield = 0,
	medic = 0,
	summers = 24
}
for group, units_data in pairs(group_ai_tweak.unit_categories) do
	if group == "Phalanx_minion" or group == "Phalanx_vip" or group == "Cap_Summers" or group == "Cap_Autumn" or units_data.is_captain then
	
	else
		for group_sub, units_data_sub in pairs(group_ai_tweak.unit_categories[group].unit_types) do
			group_ai_tweak.unit_categories[group].unit_types[group_sub] = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")					
			}		
			end		
		end
	end
end		

MutatorZombieOutbreak = MutatorZombieOutbreak or class(BaseMutator)
MutatorZombieOutbreak._type = "MutatorZombieOutbreak"
MutatorZombieOutbreak.name_id = "mutator_zombie_outbreak"
MutatorZombieOutbreak.desc_id = "mutator_zombie_outbreak_desc"
MutatorZombieOutbreak.has_options = false
MutatorZombieOutbreak.reductions = {
	money = 0.35,
	exp = 0.35
}
MutatorZombieOutbreak.disables_achievements = false
MutatorZombieOutbreak.categories = {
	"enemies"
}
MutatorZombieOutbreak.incompatibility_tags = {
	"replaces_units"
}
MutatorZombieOutbreak.icon_coords = {
	6,
	1
}

function MutatorZombieOutbreak:setup()
	if not PackageManager:loaded("packages/zombieassets") then
		PackageManager:load("packages/zombieassets")
	end
	if not PackageManager:loaded("packages/zombieassetsnew") then
		PackageManager:load("packages/zombieassetsnew")
	end
	if not PackageManager:loaded("levels/narratives/bain/hvh/world_sounds") then
		PackageManager:load("levels/narratives/bain/hvh/world_sounds")
	end
	local group_ai_tweak = tweak_data.group_ai
	for k, v in pairs(group_ai_tweak.unit_categories or {}) do
		if v.unit_types and v.unit_types.zombie then
			group_ai_tweak.unit_categories[k].unit_types.america = {}
			group_ai_tweak.unit_categories[k].unit_types.russia = {}
			-- group_ai_tweak.unit_categories[k].unit_types.zombie = {}
			group_ai_tweak.unit_categories[k].unit_types.murkywater = {}
			group_ai_tweak.unit_categories[k].unit_types.nypd = {}
			group_ai_tweak.unit_categories[k].unit_types.lapd = {}

			group_ai_tweak.unit_categories[k].unit_types.america = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.russia = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.zombie = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.murkywater = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.nypd = deep_clone(v.unit_types.zombie)
			group_ai_tweak.unit_categories[k].unit_types.lapd = deep_clone(v.unit_types.zombie)
		end
	end
end

MutatorFactionsReplacer = MutatorFactionsReplacer or class(BaseMutator)
MutatorFactionsReplacer._type = "MutatorFactionsReplacer"
MutatorFactionsReplacer.name_id = "mutator_faction_override"
MutatorFactionsReplacer.desc_id = "mutator_faction_override_desc"
MutatorFactionsReplacer.has_options = true
MutatorFactionsReplacer.reductions = {
	money = 0.35,
	exp = 0.35
}
MutatorFactionsReplacer.disables_achievements = false
MutatorFactionsReplacer.categories = {
	"enemies"
}
MutatorFactionsReplacer.incompatibility_tags = {
	"replaces_units"
}
MutatorFactionsReplacer.icon_coords = {
	6,
	1
}

function MutatorFactionsReplacer:register_values(mutator_manager)
	self:register_value("faction_override", self:default_faction_override(), "oe")
end

function MutatorFactionsReplacer:name(lobby_data)
	local name = MutatorFactionsReplacer.super.name(self)

	if self:_mutate_name("faction_override") then
		return string.format("%s - %s", name, managers.localization:text("mutator_faction_override_" .. tostring(self:value("faction_override"))))
	else
		return name
	end
end

function MutatorFactionsReplacer:get_faction_override()
	return self:value("faction_override")
end

-- Lines 54-56
function MutatorFactionsReplacer:default_faction_override()
	return "america"
end

function MutatorFactionsReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "faction_selector_choice",
		text_id = "mutator_faction_override_select",
		filter = true,
		update_callback = callback(self, self, "_update_selected_faction")
	}

	local data_node = {
		{
			value = "america",
			text_id = "mutator_faction_override_america",
			_meta = "option"
		},
		{
			value = "russia",
			text_id = "mutator_faction_override_russia",
			_meta = "option"
		},
		{
			value = "zombie",
			text_id = "mutator_faction_override_zombie",
			_meta = "option"
		},
		{
			value = "murkywater",
			text_id = "mutator_faction_override_murkywater",
			_meta = "option"
		},
		{
			value = "nypd",
			text_id = "mutator_faction_override_nypd",
			_meta = "option"
		},
		{
			value = "lapd",
			text_id = "mutator_faction_override_lapd",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_faction_override())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorFactionsReplacer:_update_selected_faction(item)
	self:set_value("faction_override", item:value())
end

function MutatorFactionsReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("faction_selector_choice")

		if slider then
			slider:set_value(self:default_faction_override())
		end
	end
end