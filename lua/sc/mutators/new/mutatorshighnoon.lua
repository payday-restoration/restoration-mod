--No modern guns allowed! Also enables Marshals to spawn at all times. This town ain't big enough for all of us
MutatorHighNoon = MutatorHighNoon or class(BaseMutator)
MutatorHighNoon._type = "MutatorHighNoon"
MutatorHighNoon.name_id = "mutator_high_noon"
MutatorHighNoon.desc_id = "mutator_high_noon_desc"
MutatorHighNoon.reductions = {
	money = 0,
	exp = 0
}
MutatorHighNoon.disables_achievements = false
MutatorHighNoon.categories = {"old_event"}
MutatorHighNoon.icon_coords = {
	5,
	5
}	
MutatorHighNoon.incompatibility_tags = {
	"replaces_gamemode",
	"replaces_units",
	"replaces_boss"
}

MutatorHighNoon.track_overrides = {
	lobby = "bsides_03_showdown"
}

function MutatorHighNoon:modify_value(id, value)
	if id == "HUDAssaultCorner:NewCaptainIcon" then
		local autumn = "guis/textures/pd2/hud_buff_spooc"
	
		return autumn
	end
	return value
end

function MutatorHighNoon:setup(data)

	if restoration then
		restoration.high_noon = true		
	end
	
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)	
	
	--Enemy changes	
	tweak_data.character.autumn.no_xmas_hat = false
	tweak_data.character.autumn.HEALTH_INIT = 120
	tweak_data.character.autumn.can_cloak = false
	tweak_data.character.autumn.can_deploy_tear_gas = false
	tweak_data.character.autumn.chance_use_gas = 0
	tweak_data.character.autumn.can_throw_frag = true	
	tweak_data.character.autumn.grenade_cooldown = 12
	tweak_data.character.autumn.grenade_toss_chance = 1	
	--To do: Make dynamite
	tweak_data.character.autumn.grenade_type = "cluster_fuck"
	
	--Autumn now spawns with his "deputies" on this gamemode
	
	--Marshals replace Titans/Spawn in special groups	
	if difficulty_index == 5 then
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.america[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.russia[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.zombie[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.murkywater[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.federales[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.nypd[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.lapd[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.fbi[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
	elseif difficulty_index == 6 then
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.america[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.russia[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.zombie[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.murkywater[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.federales[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.nypd[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.lapd[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.FBI_shield.unit_types.fbi[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
	elseif difficulty_index == 7 then
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.america[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.russia[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.zombie[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.murkywater[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.federales[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.nypd[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.lapd[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.fbi[10] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
	elseif difficulty_index == 8 then
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.america[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.america[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.america[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.russia[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.russia[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.russia[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.zombie[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.zombie[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.zombie[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.murkywater[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.murkywater[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.murkywater[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.federales[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.federales[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.federales[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.nypd[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.nypd[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.nypd[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.lapd[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.lapd[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.lapd[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"	
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.fbi[18] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.fbi[19] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"
		tweak_data.group_ai.unit_categories.GS_shield.unit_types.fbi[20] = "units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"		
	end
	
	tweak_data.group_ai.unit_categories.titan_sniper = deep_clone(tweak_data.group_ai.unit_categories.marshal_marksman)	

	local rootin_tootin = {
		"breech",
		"new_raging_bull",
		"chinchilla",
		"model3",
		"peacemaker",
		"coach",
		"m1911",
		"x_breech",
		"x_rage",
		"x_m1911",
		"x_chinchilla",
		"x_model3",
		"m1897",
		"boot",
		"huntsman",
		"b682",
		"winchester1874",
		"mosin",
		"bessy",
		"plainsrider",
		"frankish",
		"long",
		"arblast"
	}	
	for i, wep_id in ipairs(rootin_tootin) do
		tweak_data.weapon[wep_id].yeehaw = true
	end
	
	for id, weap in pairs(tweak_data.weapon) do
		if weap.categories and weap.stats and not weap.yeehaw then
			if weap.AMMO_MAX then
				weap.AMMO_MAX = 0
				weap.name_id = "bm_not_cowboy_sc"
				weap.desc_id = "bm_not_cowboy_sc_desc"
			end
		end
	end
end