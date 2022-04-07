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