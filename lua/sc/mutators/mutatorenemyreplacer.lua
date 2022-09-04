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

MutatorEnemyReplacer = MutatorEnemyReplacer or class(BaseMutator)
MutatorEnemyReplacer._type = "MutatorEnemyReplacer"
MutatorEnemyReplacer.name_id = "mutator_specials_override"
MutatorEnemyReplacer.desc_id = "mutator_specials_override_desc"
MutatorEnemyReplacer.has_options = true
MutatorEnemyReplacer.reductions = {
	money = 0.35,
	exp = 0.35
}
MutatorEnemyReplacer.disables_achievements = true
MutatorEnemyReplacer.categories = {
	"enemies"
}
MutatorEnemyReplacer.incompatibility_tags = {
	"replaces_units"
}
MutatorEnemyReplacer.icon_coords = {
	6,
	1
}

if not PackageManager:loaded("packages/miscassetsmutators") then
		PackageManager:load("packages/miscassetsmutators")
	end
	
function MutatorEnemyReplacer:register_values(mutator_manager)
	self:register_value("override_enemy", self:default_override_enemy(), "oe")
end

function MutatorEnemyReplacer:setup()
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)
end

function MutatorEnemyReplacer:name(lobby_data)
	local name = MutatorEnemyReplacer.super.name(self)

	if self:_mutate_name("override_enemy") then
		return string.format("%s - %s", name, managers.localization:text("mutator_specials_override_" .. tostring(self:value("override_enemy"))))
	else
		return name
	end
end

function MutatorEnemyReplacer:get_override_enemy()
	return self:value("override_enemy")
end

function MutatorEnemyReplacer:default_override_enemy()
	return "tank"
end

function MutatorEnemyReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "enemy_selector_choice",
		text_id = "mutator_specials_override_select",
		filter = true,
		update_callback = callback(self, self, "_update_selected_enemy")
	} 
	local data_node = {  --could probably add the grenadier option too
		{
			value = "tank",
			text_id = "mutator_specials_override_tank",
			_meta = "option"
		},
		{
			value = "taser",
			text_id = "mutator_specials_override_taser",
			_meta = "option"
		},
		{
			value = "shield",
			text_id = "mutator_specials_override_shield",
			_meta = "option"
		},
		{
			value = "spooc",
			text_id = "mutator_specials_override_spooc",
			_meta = "option"
		},
		{
			value = "medic",
			text_id = "mutator_specials_override_medic",
			_meta = "option"
		},
		{
			value = "boom",
			text_id = "mutator_specials_override_boom",
			_meta = "option"
		},
		{
			value = "sniper",
			text_id = "mutator_specials_override_boom",
			_meta = "option"
		},		
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_override_enemy())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorEnemyReplacer:_update_selected_enemy(item)
	self:set_value("override_enemy", item:value())
end

function MutatorEnemyReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("enemy_selector_choice")

		if slider then
			slider:set_value(self:default_override_enemy())
		end
	end
end

local access_type_all = {
	acrobatic = true,
	walk = true
}

local ignored_groups = {
	"Phalanx_vip_new",
	"Phalanx_minion_new",
	"Phalanx_sniper",
	"Cap_Spring",
	"Tank_Ben",
	"Taser_Titan",
	"Cap_Summers",
	"medic_summers",
	"boom_summers",
	"taser_summers",
	"Cap_Autumn",
	"Autumn_Spooc",
	"Titan_Spooc",
	"HVH_Boss",
	"HVH_Boss_Headless",
	"HVH_Boss_Spooc"
}

function MutatorEnemyReplacer:modify_unit_categories(group_ai_tweak, difficulty_index)
	for key, value in pairs(group_ai_tweak.special_unit_spawn_limits) do
		if key == self:get_override_enemy() then
			group_ai_tweak.special_unit_spawn_limits[key] = math.huge
		end
	end

	local unit_group = self["_get_unit_group_" .. self:get_override_enemy()](self, difficulty_index)

	for group, units in pairs(group_ai_tweak.unit_categories) do
		if not table.contains(ignored_groups, group) then
			print("[Mutators] Replacing unit group:", group)

			group_ai_tweak.unit_categories[group] = unit_group
		else
			print("[Mutators] Ignoring unit group:", group)
		end
	end
end

function MutatorEnemyReplacer:_get_unit_group_tank(difficulty_index)
	if not self._groups.tank then
		--Greendozers only
		if difficulty_index <= 4 then
			self._groups.tank = {
				special_type = "tank",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1")	
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")	
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc")
					}
				},
				access = access_type_all
			}	
		--Greendozers + Blackdozers
		elseif difficulty_index == 5 then
			self._groups.tank = {
				special_type = "tank",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc")
					}
				},
				access = access_type_all
			}
		elseif difficulty_index == 6 or difficulty_index == 7 then
			self._groups.tank = {  --Introduce Titandozers and Benellidozers from now on 
				special_type = "tank",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"),
						Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
					},
					zombie = {
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
						Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					}
				},
				access = access_type_all
			}
		else
			self._groups.tank = { --DS introduces all types of dozers (including Medicdozers)
				special_type = "tank",
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini"),
						Idstring("units/pd2_mod_reapers/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
						Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"),
						Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"),
						Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_dlc_bex/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
						Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					},
					fbi = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"),
						Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
					}
				},
				access = access_type_all
			}
		end
	end

	return self._groups.tank
end

function MutatorEnemyReplacer:_get_unit_group_shield(difficulty_index)
	if not self._groups.shield then
		if difficulty_index < 4 then
			self._groups.shield = {
				special_type = "shield",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2")
					},
					murkywater = {  --this faction had duplicated same mp9 shields because Jules thought that they have c45 variant.
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow")
					},
					federales = { --this faction had DC Shields, thank you Denka :denkayes:
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield")
					},
					lapd = { 
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc")
					}
				},
				access = access_type_all
			}
		elseif difficulty_index <= 5 then  --Introduce Titan Shields from now on 
			self._groups.shield = {
				special_type = "shield",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					lapd = { 
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					}
				},
				access = access_type_all
		  }	
		elseif difficulty_index <= 6 then
			self._groups.shield = {
				special_type = "shield",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					lapd = { 
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					}
				},
				access = access_type_all
		  }		
		elseif difficulty_index <= 7 then
			self._groups.shield = {
				special_type = "shield",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					lapd = { 
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					fbi = {
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					}
				},
				access = access_type_all
		  }	
		else
			self._groups.shield = {
				special_type = "shield",
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
						
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
						Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
						
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
					fbi = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
					},
				},
				access = access_type_all
			}
		end
	end

	return self._groups.shield
end

function MutatorEnemyReplacer:_get_unit_group_taser(difficulty_index)
	if not self._groups.taser then
	if difficulty_index <= 7 then
			self._groups.taser = {  --Introduce Titan Tasers
				special_type = "taser",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
					},
					lapd = {
						Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"),
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
						Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
					}
				},
				access = access_type_all
			}
		else
		self._groups.taser = {
			special_type = "taser",
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				}
			},
			access = access_type_all
		}
	end
end
	return self._groups.taser
end

function MutatorEnemyReplacer:_get_unit_group_spooc(difficulty_index)
	if not self._groups.spooc then
		if difficulty_index <= 7 then
			self._groups.spooc = {
				special_type = "spooc",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
					},
					lapd = {
						Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
					}
				},
				access = access_type_all
			}
		else
			self._groups.spooc = {  --Introduce Titan Cloakers cuz why not?
				special_type = "spooc",
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					russia = {
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
						Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"),
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"),
						Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					lapd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					},
					fbi = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"),
						Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
					}
				},
				access = access_type_all
			}
		end
	end

	return self._groups.spooc
end

--Medic Shotgunners are absent in Resmod so only MP5+LPF/Reaper Flamermen will spawn in
function MutatorEnemyReplacer:_get_unit_group_medic(difficulty_index)  
	if not self._groups.medic then
		if difficulty_index <= 5 then  
			self._groups.medic = {
				special_type = "medic",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
					}
				},
				access = access_type_all
		  }	
		elseif difficulty_index <= 6 then
			self._groups.medic = {  --Introducing LPF/Flamermen with the most gayest jacket ever (if you get the refrence)
				special_type = "medic",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					}
				},
				access = access_type_all
		  }			
		elseif difficulty_index <= 7 then
			self._groups.medic = {
				special_type = "medic",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					nypd = {
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					}
				},
				access = access_type_all
		  }	
		else
		self._groups.medic = {
			special_type = "medic",
			unit_types = {
				america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"),
						Idstring("units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					lapd = { 
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					},
					fbi = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
						Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
					}
				},
				access = access_type_all
		  }
	end
end
	return self._groups.medic
end

function MutatorEnemyReplacer:_get_unit_group_boom(difficulty_index)  
	if not self._groups.boom then
		if difficulty_index <= 5 then  
			self._groups.boom = {
				special_type = "boom",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					}
				},
				access = access_type_all
		  }	
		elseif difficulty_index <= 6 then
			self._groups.boom = { 
				special_type = "boom",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					}
				},
				access = access_type_all
		  }			
		elseif difficulty_index <= 7 then
			self._groups.boom = {
				special_type = "boom",
				unit_types = {
					america = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
					},
					nypd = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					lapd = { 
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					},
					fbi = {
						Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
					}
				},
				access = access_type_all
		  }	
		else
		self._groups.boom = {
			special_type = "boom",
			unit_types = {
					america = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
					},
					murkywater = {
						Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
					},
					federales = {
						Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
					},
					nypd = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
					},
					lapd = { 
						Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
					},
					fbi = {
						Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
					}
				},
				access = access_type_all
		  }
	end
end
	return self._groups.boom
end

function MutatorEnemyReplacer:_get_unit_group_sniper(difficulty_index)  
	if not self._groups.sniper then
		if difficulty_index == 2 or difficulty_index == 3 then  
			self._groups.sniper = {
				special_type = "sniper",
				unit_types = {
					america = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					russia = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					zombie = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					murkywater = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					federales = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					nypd = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					lapd = { 
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					fbi = {
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					}
				},
				access = access_type_all
		  }	
		elseif difficulty_index <= 4 then  
			self._groups.sniper = {
				special_type = "sniper",
				unit_types = {
					america = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					russia = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					zombie = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					murkywater = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					federales = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					nypd = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					lapd = { 
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					},
					fbi = {
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")						
					}
				},
				access = access_type_all
		  }	
		else
		self._groups.sniper = {
			special_type = "sniper",
			unit_types = {
					america = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					russia = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					zombie = {
						Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					murkywater = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					federales = {
						Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					nypd = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					lapd = { 
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					},
					fbi = {
						Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
						Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
						Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
					}
				},
				access = access_type_all
		  }
	end
end
	return self._groups.sniper
end
