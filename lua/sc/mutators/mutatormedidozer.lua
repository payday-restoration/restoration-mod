--BFFs, normals all replaced with medics and all specials replaced with dozers
MutatorMediDozer = MutatorMediDozer or class(BaseMutator)
MutatorMediDozer._type = "MutatorMediDozer"
MutatorMediDozer.name_id = "mutator_medidozer"
MutatorMediDozer.desc_id = "mutator_medidozer_desc"
MutatorMediDozer.reductions = {
	money = 0,
	exp = 0
}
MutatorMediDozer.disables_achievements = false
MutatorMediDozer.categories = {
	"enemies"
}
MutatorMediDozer.incompatibility_tags = {
	"replaces_units"
}
MutatorMediDozer.icon_coords = {
	8,
	1
}

function MutatorMediDozer:setup()
	self._groups = self._groups or {}
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self:modify_unit_categories(tweak_data.group_ai, difficulty_index)
end

local access_type_all = {
	acrobatic = true,
	walk = true
}

local ignored_groups = {}

function MutatorMediDozer:modify_unit_categories(group_ai_tweak, difficulty_index)
	group_ai_tweak.special_unit_spawn_limits = {
		tank = math.huge,
		taser = 0,
		boom = 0,
		spooc = 0,
		shield = 0,
		medic = math.huge,
		phalanx_vip = 0,
		spring = 0,
		headless_hatman = 0,
		autumn = 0,
		summers = 0
	}
	if difficulty_index <= 6 then
		group_ai_tweak.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_bob/ene_akan_medic_bob")
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
				},
				omnia = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic")
				}				
			},
			access = access_type_all,
			special_type = "medic"
		}		
	elseif difficulty_index == 7 then 
		group_ai_tweak.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_akan_medic_zdann/ene_akan_medic_zdann")
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
				},
				omnia = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic")
				}				
			},
			access = access_type_all,
			special_type = "medic"
		}							
	else
		group_ai_tweak.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				russia = {
					Idstring("units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic")							
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5")						
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				fbi = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic")
				},
				omnia = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic")
				}			
			},
			access = access_type_all,
			special_type = "medic"
		}		
	end

	for group, units_data in pairs(group_ai_tweak.unit_categories) do
		if not table.contains(ignored_groups, group) then
			if units_data.special_type then
				if units_data.special_type ~= "tank" and units_data.special_type ~= "medic" then
					group_ai_tweak.unit_categories[group] = group_ai_tweak.unit_categories.FBI_tank
				end
			else
				group_ai_tweak.unit_categories[group] = group_ai_tweak.unit_categories.medic_M4
			end
		end
	end
end