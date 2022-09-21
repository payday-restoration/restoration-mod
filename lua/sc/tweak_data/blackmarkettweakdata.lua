Hooks:PostHook(BlackMarketTweakData, "_init_gloves", "ResGloves", function(self, tweak_data)
	table.insert(self.glove_adapter.player_style_exclude_list, "two_piece_suit")
	table.insert(self.glove_adapter.player_style_exclude_list, "loud_suit")
	table.insert(self.glove_adapter.player_style_exclude_list, "suit_sunny")
	self.suit_default_gloves.suit_sunny = "heist_default"
	self.suit_default_gloves.loud_suit = "heist_default"
	self.suit_default_gloves.poggers = "esport"
	self.suit_default_gloves.suit_prison = "heist_default"
end)

Hooks:PostHook(BlackMarketTweakData, "_init_masks", "ResMaskFixes", function(self, tweak_data)	
	self.masks.almirs_beard.offsets = {
		female_1 = {
			Vector3(0.1, 0, -1.2),
			Rotation(0, 0, 2)
		},
		jowi = {
			Vector3(-0.1, 1, -0.8),
			Rotation(1, 6, 2)
		},
		dallas = {
			Vector3(-0.2, -0.4, -0.8),
			Rotation(1, -1, 2)
		},
		wolf = {
			Vector3(-0.1, -0.4, -0.1),
			Rotation(0.9, -1, 2)
		},
		chains = {
			Vector3(-0.1, -0.2, -0.8),
			Rotation(0.4, -1, 2)
		},
		hoxton = {
			Vector3(-0.1, -0.2, -0.8),
			Rotation(0.4, -1, 2)
		},
		old_hoxton = {
			Vector3(-0.1, -0.7, -0.8),
			Rotation(0, -1, 2)
		},
		bodhi = {
			Vector3(-0.2, 0.4, -0.9),
			Rotation(0, 2, 2)
		},
		jimmy = {
			Vector3(-0.2, -0, -0.9),
			Rotation(0, 0, 2)
		},
		sokol = {
			Vector3(-0.2, -0.2, -0.4),
			Rotation(0, 0, 2)
		},
		sydney = {
			Vector3(-0.2, -0.4, -0.4),
			Rotation(0, 0, 2)
		},
		dragan = {
			Vector3(-0.2, 0.2, -0.8),
			Rotation(0, 0, 2)
		},
		wild = {
			Vector3(-0.4, 0.1, -0.5),
			Rotation(-0.8, 2, 3)
		},
		chico = {
			Vector3(-0.2, 0.9, -1),
			Rotation(0.7, 6, 3)
		},
		dragon = {
			Vector3(-0.2, 0.7, -0.9),
			Rotation(0.7, 0, 3)
		},
		max = {
			Vector3(-0.2, -0.3, -1),
			Rotation(0.7, 0, 3)
		},
		joy = {
			Vector3(-0.2, -0.3, -0.7),
			Rotation(0.2, 0, 3)
		},
		myh = {
			Vector3(-0.2, -0.3, -1.2),
			Rotation(0.2, 0, 3)
		},
		ecp_male = {
			Vector3(-0.2, -0.7, -0.8),
			Rotation(0, 0, 2)
		},
		jacket = {
			Vector3(-0.2, 0, -0.3),
			Rotation(0, 0, 2)
		},
		bonnie = {
			Vector3(-0.2, 1, -0.3),
			Rotation(0, 0, 2)
		}
	}

end)



--This is a helmet, not a mask--
Hooks:PostHook(BlackMarketTweakData, "_init_masks", "ResMasks", function(self, tweak_data)	
	--Classic Helmet
	self.masks.classic_helmet = {}
	self.masks.classic_helmet.unit = "units/pd2_mod_fucking_masks/msk_classic_helmet/msk_classic_helmet"		
	if Steam:is_user_in_source(Steam:userid(), "103582791466033055") then
		self.masks.classic_helmet = {
			unit = "units/pd2_mod_fucking_masks/msk_classic_helmet/msk_classic_helmet",
			name_id = "bm_msk_classic_helmet",
			desc_id = "bm_msk_classic_helmet_desc",
			value = 0,
			type = "helmet",			
			global_value = "rest_omnia",
			texture_bundle_folder = "mods"
		}
	end

	--All Seeing Anchor		
	self.masks.all_seeing = {}
	self.masks.all_seeing.unit = "units/pd2_mod_fucking_masks/msk_eye/msk_eye"			
	if Steam:is_user_in_source(Steam:userid(), "103582791466033055") then
		self.masks.all_seeing = {
			unit = "units/pd2_mod_fucking_masks/msk_eye/msk_eye",
			name_id = "bm_all_seeing",
			desc_id = "bm_all_seeing_desc",
			value = 0,
			type = "helmet",
			global_value = "rest_omnia",
			texture_bundle_folder = "mods"
		}		
	end

	--devmask.model		
	self.masks.cube = {}
	self.masks.cube.unit = "units/pd2_mod_fucking_masks/msk_cube/msk_cube"	
	if Steam:is_user_in_source(Steam:userid(), "103582791465743585") then
		self.masks.cube = {
			unit = "units/pd2_mod_fucking_masks/msk_cube/msk_cube",
			name_id = "bm_cube",
			desc_id = "bm_cube_desc",
			value = 0,
			type = "helmet",
			global_value = "rest_omnia",
			texture_bundle_folder = "mods"
		}		
	end
end)

--we all know alligator skin's the best material right--
local old_mat = BlackMarketTweakData._init_materials
function BlackMarketTweakData:_init_materials(tweak_data)
	old_mat(self, tweak_data)
	
	self.materials.jkl_matt01 = {
		name_id = "material_jkl_matt01_title",
		pcs = {},
		texture = "units/pd2_mod_jack/matcaps/jkl_matt01",
		value = 0,
		global_value = "rest"
	}
	self.materials.jkl_matt02 = {
		name_id = "material_jkl_matt02_title",
		pcs = {},
		texture = "units/pd2_mod_jack/matcaps/jkl_matt02",
		value = 0,
		global_value = "rest"
	}		
			
end	

--for when you want to put something stupid on your face--
local old_text = BlackMarketTweakData._init_textures
function BlackMarketTweakData:_init_textures(tweak_data)
	old_text(self, tweak_data)
	
	self.textures.jkl_patt01 = {
		name_id = "pattern_jkl_patt01_title",
		pcs = {},
		texture = "patterns/jkl_patt01",
		value = 0,
		global_value = "rest"
	}

	self.textures.jkl_patt02 = {
		name_id = "pattern_jkl_patt02_title",
		pcs = {},
		texture = "patterns/jkl_patt02",
		value = 0,
		global_value = "rest"
	}			
			
end

Hooks:PostHook(BlackMarketTweakData, "_init_player_styles", "ResPlayerStyles", function(self, tweak_data)
	local characters_female, characters_female_big, characters_male, characters_male_big = self:_get_character_groups()
	local characters_all = table.list_union(characters_female, characters_male, characters_female_big, characters_male_big)
	local body_replacement_standard = {
		head = false,
		armor = true,
		body = true,
		hands = true,
		vest = true,
		arms = true
	}

	local function set_characters_data(player_style, characters, data)
		self.player_styles[player_style].characters = self.player_styles[player_style].characters or {}

		for _, key in ipairs(characters) do
			self.player_styles[player_style].characters[key] = data
		end
	end
	
	--Two Piece Suit
	self.player_styles.two_piece_suit = {
		name_id = "bm_suit_two_piece_sc",
		desc_id = "bm_suit_two_piece_desc_sc",
		unlocked = true,
		texture_bundle_folder = "mods",
		global_value = "sc"
	}
	
	--Jackal Track Suit
	self.player_styles.poggers = {
		name_id = "bm_suit_jackal_track",
		desc_id = "bm_suit_jackal_track_desc",
		texture_bundle_folder = "mods",	
		global_value = "rest_omnia_fake",
		body_replacement = body_replacement_standard,
		third_body_replacement = body_replacement_standard,
		unit = self.player_styles.esport.unit,
		material_variations = {
			default = {
				material = "units/pd2_mod_suits/characters/ess_acc_esportgamer/ess_acc_fps_esport/ess_acc_fps_esport_rhynne",
				third_material = "units/pd2_mod_suits/characters/ess_acc_esportgamer/shared_materials/ess_acc_esport_rhynne"
			}
		},
		characters = {}
	}
	local poggers_characters_male = {
		third_unit = "units/pd2_dlc_ess/characters/ess_acc_esportgamer/ess_acc_esport_male_average/ess_acc_esport_male_average"
	}
	set_characters_data("poggers", characters_male, poggers_characters_male)
	
	local poggers_characters_male_big = {
		third_unit = "units/pd2_dlc_ess/characters/ess_acc_esportgamer/ess_acc_esport_male_big/ess_acc_esport_male_big"
	}
	set_characters_data("poggers", characters_male_big, poggers_characters_male_big)
	
	local poggers_characters_female = {
		third_unit = "units/pd2_dlc_ess/characters/ess_acc_esportgamer/ess_acc_esport_female_average/ess_acc_esport_female_average"
	}
	set_characters_data("poggers", characters_female, poggers_characters_female)

	local poggers_characters_female_big = {
		third_unit = "units/pd2_dlc_ess/characters/ess_acc_esportgamer/ess_acc_esport_female_big/ess_acc_esport_female_big"
	}
	set_characters_data("poggers", characters_female_big, poggers_characters_female_big)
	
	self.player_styles.poggers.characters.ecp_male = {
		third_unit = "units/pd2_dlc_ess/characters/ess_acc_esportgamer/ess_acc_esport_male_fat/ess_acc_esport_male_fat"
	}
	
	if Steam:is_user_in_source(Steam:userid(), "103582791466033055") then
		self.player_styles.poggers.global_value = "rest_omnia"
		self.player_styles.poggers.unlocked = true
	end
	
	-- Flecktarn Jumpsuit 
	self.player_styles.jumpsuit.material_variations.flecktarn = {
		name_id = "bm_suit_var_jumpsuit_flecktarn",
		unlocked = true,
		global_value = "sc",
		material = "units/pd2_mod_suits/characters/trd_acc_jumpsuits/trd_acc_fps_jumpsuit/trd_acc_fps_jumpsuit_flecktarn",	
		third_material = "units/pd2_mod_suits/characters/trd_acc_jumpsuits/trd_acc_jumpsuit_male_average/trd_acc_jumpsuit_male_average_flecktarn",	
		desc_id = "bm_suit_var_jumpsuit_flecktarn_desc"
	}
	
	-- FLAT GREEN JUMPSUIT
	self.player_styles.jumpsuit.material_variations.flatgreen = {
		name_id = "bm_suit_var_jumpsuit_flatgreen",
		unlocked = true,
		global_value = "sc",
		material = "units/pd2_mod_suits/characters/trd_acc_jumpsuits/trd_acc_fps_jumpsuit/trd_acc_fps_jumpsuit_flatgreen",
		third_material = "units/pd2_mod_suits/characters/trd_acc_jumpsuits/trd_acc_jumpsuit_male_average/trd_acc_jumpsuit_male_average_flatgreen",
		desc_id = "bm_suit_var_jumpsuit_flatgreen_desc"
	}

	--Fixed Raincoat
	self.player_styles.raincoat.third_body_replacement = {
		arms = true,
		head = false,
		armor = true,
		body = false,
		hands = false,
		vest = true
	}
	set_characters_data("raincoat", characters_all, {
		third_unit = "units/pd2_dlc_glace/characters/glc_acc_raincoat/glc_acc_raincoat"
	})
	set_characters_data("raincoat", characters_female_big, {
		third_unit = "units/pd2_dlc_glace/characters/glc_acc_raincoat_bonnie_sc/glc_acc_raincoat_bonnie_sc"
	})
	self.player_styles.raincoat.characters.ecp_male = {
		third_unit = "units/pd2_dlc_glace/characters/glc_acc_raincoat_ethan/glc_acc_raincoat_ethan"
	}
	
	--Resmod Loud Suit
	self.player_styles.loud_suit = {
		name_id = "bm_suit_loud_suit",
		desc_id = "bm_suit_loud_suit_desc",
		texture_bundle_folder = "mods",
		unlocked = true,
		global_value = "sc",
		body_replacement = {
			arms = false,
			head = true,
			armor = true,
			body = true,
			hands = false,
			vest = true
		},
		third_body_replacement = {
			arms = true,
			head = false,
			armor = false,
			body = true,
			hands = true,
			vest = true
		},
		unit = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit",
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit",
		characters = {}
	}
	set_characters_data("loud_suit", characters_male_big, {
		unit = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit"
	})
	set_characters_data("loud_suit", characters_female, {
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_female/res_acc_loud_suit_female",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_female"
	})
	set_characters_data("loud_suit", characters_female_big, {
		unit = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit",
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_big/res_acc_loud_suit_female_big"
	})
	self.player_styles.loud_suit.characters.chains = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit_chains",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_chains"
	}
	self.player_styles.loud_suit.characters.bodhi = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit_bodhi",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_bodhi"
	}	
	self.player_styles.loud_suit.characters.dragon = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit_02",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_02"
	}	
	self.player_styles.loud_suit.characters.chico = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit_02",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_02"
	}
	self.player_styles.loud_suit.characters.max = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit/res_acc_loud_suit_sangres",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_sangres"
	}	
	self.player_styles.loud_suit.characters.ecp_male = {
		third_body_replacement = body_replacement_standard,
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_male_big/res_acc_loud_suit_male_big"
	}
	self.player_styles.loud_suit.characters.sydney = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_thin/res_acc_loud_suit_female_thin_sydney",
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_thin/res_acc_loud_suit_female_thin",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_sydney"
	}
	self.player_styles.loud_suit.characters.joy = {
		third_material = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_thin/res_acc_loud_suit_female_thin_joy",
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_thin/res_acc_loud_suit_female_thin",
		material = "units/pd2_mod_suits/characters/res_acc_fps_loud_suit/res_acc_fps_loud_suit_joy"
	}
	self.player_styles.loud_suit.characters.ecp_female = {
		third_unit = "units/pd2_mod_suits/characters/res_acc_loud_suit_female_very_thin/res_acc_loud_suit_female_very_thin"
	
	}
	
	--Resmod Sunny-Side Robber
	self.player_styles.suit_sunny = {
		name_id = "bm_suit_sunny",
		desc_id = "bm_suit_sunny_desc",
		texture_bundle_folder = "mods",
		unlocked = true,
		global_value = "sc",
		body_replacement = body_replacement_standard,
		third_body_replacement = body_replacement_standard,
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit/res_acc_sunny_suit",
		characters = {}
	}
	set_characters_data("suit_sunny", characters_female_big, {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female",
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit_big/res_acc_sunny_suit_big"
	})
	self.player_styles.suit_sunny.characters.ecp_male = {
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit_big/res_acc_sunny_suit_big"
	}
	
	set_characters_data("suit_sunny", characters_female, {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female",
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit_female/res_acc_sunny_suit_female"
	})
	
	self.player_styles.suit_sunny.characters.sydney = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney",
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit_female/res_acc_sunny_suit_female",		
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit_female/sydney/res_acc_sunny_suit_female_sydney"
	}
	self.player_styles.suit_sunny.characters.joy = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy",
		third_unit = "units/pd2_mod_suits/characters/res_acc_sunny_suit_female/res_acc_sunny_suit_female",				
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit_female/joy/res_acc_sunny_suit_female_joy"
	}
	
	self.player_styles.suit_sunny.characters.dragon = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02",
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit/dragon/res_acc_sunny_suit_dragon"		
	}	
	self.player_styles.suit_sunny.characters.chico = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02",
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit/dragon/res_acc_sunny_suit_dragon"		
	}	
	self.player_styles.suit_sunny.characters.chains = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains",
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit/chains/res_acc_sunny_suit_chains",	
	}
	self.player_styles.suit_sunny.characters.max = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres",
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit/sangres/res_acc_sunny_suit_sangres"
	}
	self.player_styles.suit_sunny.characters.bodhi = {
		unit = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi",
		third_material = "units/pd2_mod_suits/characters/res_acc_sunny_suit/bodhi/res_acc_sunny_suit_bodhi",	
	}

	--Resmod Prison Suit
	self.player_styles.suit_prison = {
		name_id = "bm_suit_prison",
		desc_id = "bm_suit_prison_desc",
		texture_bundle_folder = "mods",
		unlocked = true,
		global_value = "sc",
		body_replacement = {
			arms = false,
			head = true,
			armor = true,
			body = true,
			hands = false,
			vest = true
		},
		third_body_replacement = {
			arms = true,
			head = false,
			armor = false,
			body = true,
			hands = true,
			vest = true
		},
		unit = "units/pd2_mod_suits/characters/res_acc_fps_prison_suit/res_acc_fps_prison_suit",
		third_unit = "units/pd2_mod_suits/characters/res_acc_prison_suit/res_acc_prison_suit",
		characters = {}
	}
	set_characters_data("suit_prison", characters_male_big, {
		third_unit = "units/pd2_mod_suits/characters/res_acc_prison_suit_big/res_acc_prison_suit_big"
	})
	set_characters_data("suit_prison", characters_female, {
		third_unit = "units/pd2_mod_suits/characters/res_acc_prison_suit_female/res_acc_prison_suit_female"
	})
	set_characters_data("suit_prison", characters_female_big, {
		third_unit = "units/pd2_mod_suits/characters/res_acc_prison_suit_big/res_acc_prison_suit_big"
	})
	self.player_styles.suit_prison.characters.max = {
		third_material = "units/pd2_mod_suits/characters/res_acc_prison_suit/res_acc_prison_suit_sangres"
	}	
	self.player_styles.suit_prison.characters.jacket = {
		third_material = "units/pd2_mod_suits/characters/res_acc_prison_suit/res_acc_prison_suit_jacket"
	}	
end)


local old_projectiles = BlackMarketTweakData._init_projectiles
function BlackMarketTweakData:_init_projectiles(tweak_data)
   	old_projectiles(self, tweak_data)	
	--[[
	self.projectiles.fir_com = {
		name_id = "bm_grenade_fir_com",
		desc_id = "bm_grenade_fir_com_desc",
		unit = "units/pd2_dlc_fir/weapons/wpn_fps_gre_white/wpn_third_gre_white",
		unit_dummy = "units/pd2_dlc_fir/weapons/wpn_fps_gre_white/wpn_fps_gre_white_husk",
		icon = "fir_grenade",
		dlc = "pd2_clan",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1,
		throwable = true,
		max_amount = 3,
		texture_bundle_folder = "fir",
		physic_effect = Idstring("physic_effects/molotov_throw"),
		animation = "throw_concussion",
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.3,
		repeat_expire_t = 1.5,
		is_a_grenade = true
	}
	]]--

	table.insert(self._projectiles_index, "bravo_frag")
	table.insert(self._projectiles_index, "cluster_fuck")
	table.insert(self._projectiles_index, "child_grenade")
	table.insert(self._projectiles_index, "hatman_molotov")
	table.insert(self._projectiles_index, "launcher_frag_osipr")
	table.insert(self._projectiles_index, "launcher_incendiary_osipr")
	table.insert(self._projectiles_index, "launcher_electric_osipr")
	table.insert(self._projectiles_index, "launcher_poison_osipr")

	--Throwables--
	self.projectiles.wpn_prj_four.max_amount = 9
	self.projectiles.wpn_prj_four.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_ace.max_amount = 9
	self.projectiles.wpn_prj_ace.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_target.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_target.throw_allowed_expire_t = 0.15
	self.projectiles.wpn_prj_target.max_amount = 9
	self.projectiles.wpn_prj_jav.max_amount = 6
	self.projectiles.wpn_prj_hur.max_amount = 6
	self.projectiles.fir_com.max_amount = 3
	self.projectiles.smoke_screen_grenade.base_cooldown = 40
	self.projectiles.damage_control.base_cooldown = 30
	self.projectiles.tag_team.base_cooldown = 80
	self.projectiles.concussion.max_amount = 3
	self.projectiles.wpn_gre_electric.max_amount = 3
	self.projectiles.poison_gas_grenade.max_amount = 3
	
	self.projectiles.pocket_ecm_jammer.max_amount = 1
	self.projectiles.pocket_ecm_jammer.base_cooldown = 80
	
	--Fuck off
	self.projectiles.frag.no_cheat_count = true
	self.projectiles.concussion.no_cheat_count = true
	self.projectiles.dynamite.no_cheat_count = true
	self.projectiles.molotov.no_cheat_count = true
	self.projectiles.wpn_prj_four.no_cheat_count = true
	self.projectiles.wpn_prj_ace.no_cheat_count = true
	self.projectiles.wpn_prj_jav.no_cheat_count = true
	self.projectiles.wpn_prj_hur.no_cheat_count = true
	self.projectiles.wpn_prj_target.no_cheat_count = true
	self.projectiles.frag_com.no_cheat_count = true
	self.projectiles.fir_com.no_cheat_count = true
	self.projectiles.dada_com.no_cheat_count = true
	self.projectiles.wpn_gre_electric.no_cheat_count = true
	self.projectiles.poison_gas_grenade.no_cheat_count = true

	--Animation overrides for grenades so they aren't shitty. Like seriously, Javelin throw for grenades..?	
	--HE
	self.projectiles.frag.animation = "throw_grenade_com"							--throw_grenade (Comments are original lines for ref sake)
	self.projectiles.frag.anim_global_param = "projectile_frag_com"					--projectile_frag
	--HEF OVK
	--self.projectiles.frag_com.animation = "throw_grenade_com"						--throw_grenade_com
	--self.projectiles.frag_com.anim_global_param = "projectile_frag_com"			--projectile_frag_com
	--Matyroshka
	--self.projectiles.dada_com.animation = "throw_dada"							--throw_dada
	--self.projectiles.dada_com.anim_global_param = "projectile_dada"				--projectile_dada 
	--Dynamite
	--self.projectiles.dynamite.animation = "throw_dynamite"						--throw_dynamite
	--self.projectiles.dynamite.anim_global_param = "projectile_dynamite"			--projectile_dynamite
	--Molotov
	self.projectiles.molotov.animation = "throw_dynamite"							--throw_molotov
	self.projectiles.molotov.anim_global_param = "projectile_dynamite"				--projectile_molotov
	--Incendiary  
	self.projectiles.fir_com.animation = "throw_grenade_com"						--throw_concussion
	self.projectiles.fir_com.anim_global_param = "projectile_frag_com"				--projectile_frag  
	--Concussion  
	self.projectiles.concussion.animation = "throw_grenade_com"						--throw_concussion
	self.projectiles.concussion.anim_global_param = "projectile_frag_com"			--projectile_frag   
	--Sicaro Smoke 
	--self.projectiles.smoke_screen_grenade.animation = "throw_grenade_com"					--throw_grenade_com
	--self.projectiles.smoke_screen_grenade.anim_global_param = "projectile_frag_com"		--projectile_frag_com
	--Viper Gas
	--self.projectiles.poison_gas_grenade.animation = "throw_grenade_com"				--throw_grenade_com
	--self.projectiles.poison_gas_grenade.anim_global_param = "projectile_frag_com"		--projectile_frag_com	
	
	if SystemFS:exists("assets/mod_overrides/CoD Inspired Flashbang Animation") then
		self.projectiles.concussion.animation = "throw_concussion"
		self.projectiles.concussion.anim_global_param = "projectile_frag"
		self.projectiles.fir_com.animation = "throw_concussion"
		self.projectiles.fir_com.anim_global_param = "projectile_frag"
		self.projectiles.smoke_screen_grenade.animation = "throw_concussion"
		self.projectiles.smoke_screen_grenade.anim_global_param = "projectile_frag"
		self.projectiles.poison_gas_grenade.animation = "throw_concussion"
		self.projectiles.poison_gas_grenade.anim_global_param = "projectile_frag"
	end	

	self.projectiles.bravo_frag = {}
	self.projectiles.bravo_frag.damage = 12 --120 damage at point blank.
	self.projectiles.bravo_frag.player_damage = 12
	self.projectiles.bravo_frag.curve_pow = 0.1
	self.projectiles.bravo_frag.range = 500
	self.projectiles.bravo_frag.name_id = "bm_bravo_frag"
	self.projectiles.bravo_frag.unit = "units/payday2/weapons/wpn_npc_bravo_frag/wpn_npc_bravo_frag"
	self.projectiles.bravo_frag.unit_dummy = "units/payday2/weapons/wpn_npc_bravo_frag/wpn_npc_bravo_frag_husk"
	self.projectiles.bravo_frag.throwable = false
	self.projectiles.bravo_frag.is_a_grenade = true
	self.projectiles.bravo_frag.is_explosive = true
	self.projectiles.bravo_frag.add_trail_effect = true

	self.projectiles.cluster_fuck = {}
	self.projectiles.cluster_fuck.damage = 12 --120 damage at point blank.
	self.projectiles.cluster_fuck.player_damage = 12
	self.projectiles.cluster_fuck.curve_pow = 0.1
	self.projectiles.cluster_fuck.range = 500
	self.projectiles.cluster_fuck.name_id = "bm_cluster_fuck"
	self.projectiles.cluster_fuck.unit = "units/payday2/weapons/wpn_npc_cluster_fuck/wpn_npc_cluster_fuck"
	self.projectiles.cluster_fuck.unit_dummy = "units/payday2/weapons/wpn_npc_cluster_fuck/wpn_npc_cluster_fuck_husk"
	self.projectiles.cluster_fuck.throwable = false
	self.projectiles.cluster_fuck.is_a_grenade = true
	self.projectiles.cluster_fuck.is_explosive = true
	self.projectiles.cluster_fuck.add_trail_effect = true

	self.projectiles.child_grenade = {}
	self.projectiles.child_grenade.damage = 10 --100 damage at point blank.
	self.projectiles.child_grenade.player_damage = 10
	self.projectiles.child_grenade.curve_pow = 0.1
	self.projectiles.child_grenade.init_timer = 1.0
	self.projectiles.child_grenade.range = 500
	self.projectiles.child_grenade.name_id = "bm_child_grenade"
	self.projectiles.child_grenade.unit = "units/payday2/weapons/wpn_npc_child_grenade/wpn_npc_child_grenade"
	self.projectiles.child_grenade.unit_dummy = "units/payday2/weapons/wpn_npc_child_grenade/wpn_npc_child_grenade"
	self.projectiles.child_grenade.throwable = false
	self.projectiles.child_grenade.is_a_grenade = true
	self.projectiles.child_grenade.is_explosive = true
	self.projectiles.child_grenade.add_trail_effect = true
	
	self.projectiles.hatman_molotov = {}
	self.projectiles.hatman_molotov.unit = "units/pd2_mod_halloween/weapons/wpn_npc_hatman_molotov/wpn_npc_hatman_molotov"
	self.projectiles.hatman_molotov.unit_dummy = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_husk"
	self.projectiles.hatman_molotov.physic_effect = Idstring("physic_effects/molotov_throw")
	self.projectiles.hatman_molotov.throwable = false
	self.projectiles.hatman_molotov.is_a_grenade = true
	self.projectiles.hatman_molotov.add_trail_effect = true
	self.projectiles.hatman_molotov.impact_detonation = true

--SABR Grenade Launcher.
	self.projectiles.launcher_frag_osipr = {
		name_id = "bm_launcher_frag",
		unit = "units/mods/weapons/wpn_osipr_frag_grenade/wpn_osipr_frag_grenade",
		weapon_id = "osipr_gl",
		no_cheat_count = true,
		impact_detonation = true,
		is_explosive = true,
		time_cheat = 0,
		adjust_z = 0
	}
	self.projectiles.launcher_incendiary_osipr = {
		name_id = "bm_launcher_incendiary",
		unit = "units/mods/weapons/wpn_osipr_frag_incendiary_grenade/wpn_osipr_frag_incendiary_grenade",
		weapon_id = "osipr_gl",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 0,
		adjust_z = 0
	}
	self.projectiles.launcher_electric_osipr = {
		name_id = "bm_launcher_electric",
		unit = "units/mods/weapons/wpn_osipr_frag_electric_grenade/wpn_osipr_frag_electric_grenade",
		weapon_id = "osipr_gl",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 0,
		adjust_z = 0
	}
	self.projectiles.launcher_poison_osipr = {
		name_id = "bm_launcher_poison",
		unit = "units/mods/weapons/wpn_osipr_frag_electric_grenade/wpn_osipr_frag_electric_grenade",
		weapon_id = "osipr_gl",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 0,
		adjust_z = 0
	}

	self.projectiles.rocket_ray_frag.physic_effect = nil --Idstring("physic_effects/molotov_throw")
	self.projectiles.rocket_frag.physic_effect = nil --Idstring("physic_effects/molotov_throw")

	local give_trails = {
		'launcher_frag','launcher_incendiary','launcher_electric','launcher_poison_gre_m79',
		'launcher_frag_china','launcher_incendiary_china','launcher_electric_china','launcher_poison_china',
		'launcher_frag_m32','launcher_incendiary_m32','launcher_electric_m32','launcher_poison_m32',
		'launcher_m203','underbarrel_electric','launcher_poison_contraband',
		'underbarrel_m203_groza','underbarrel_electric_groza','launcher_poison_groza',
		'launcher_frag_slap','launcher_incendiary_slap','launcher_electric_slap','launcher_poison_slap',
		'launcher_frag_arbiter','launcher_incendiary_arbiter','launcher_electric_arbiter','launcher_poison_arbiter',
		'launcher_frag_osipr','launcher_incendiary_osipr','launcher_electric_osipr',
		'launcher_frag_ms3gl','launcher_incendiary_ms3gl','launcher_electric_ms3gl','launcher_poison','launcher_poison_ms3gl_conversion'
	}
	for i, proj_id in ipairs(give_trails) do
		self.projectiles[proj_id].add_trail_effect = true
	end
end

--Overrides this function to allow abominations on Gold AKs
function BlackMarketTweakData:create_new_color_skin(name, data, color_skin_data)
	data.name_id = "bm_wskn_" .. name
	data.rarity = "common"
	data.weapon_ids = {}

	table.insert(data.weapon_ids, "money")

	data.use_blacklist = true
	data.is_a_unlockable = true
	data.is_a_color_skin = true
	data.group_id = data.global_value_category or data.global_value or data.dlc or "normal"
	data.color_skin_data = color_skin_data

	if not table.contains(self.weapon_color_groups, data.group_id) then
		table.insert(self.weapon_color_groups, data.group_id)
	end

	self.weapon_skins[name] = data

	table.insert(self.weapon_colors, name)
end

local old_weapon_skins = BlackMarketTweakData._init_weapon_skins
function BlackMarketTweakData:_init_weapon_skins(tweak_data)
	old_weapon_skins(self, tweak_data)
	for weapon, data in pairs(self.weapon_skins) do
		self.weapon_skins[weapon].locked = nil
	end
	self.weapon_skins.ak74_rodina.desc_id = "bm_wskn_ak74_rodina_desc_sc"
	self.weapon_skins.ak74_rodina.default_blueprint = {
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_ass_74_b_standard",
		"wpn_fps_upg_ak_m_uspalm",
		"wpn_upg_ak_s_skfoldable_vanilla",
		"wpn_upg_ak_fg_standard",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_ak_scopemount",
		"wpn_fps_upg_vlad_rodina_legend"
	}
	self.weapon_skins.deagle_bling.desc_id = "bm_wskn_deagle_bling_desc_sc"
	self.weapon_skins.deagle_bling.default_blueprint = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_m_standard",
		"wpn_fps_pis_deagle_b_standard",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_midas_touch_legend"
	}
	self.weapon_skins.deagle_bling.default_blueprint = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_m_standard",
		"wpn_fps_pis_deagle_b_standard",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_upg_midas_touch_legend"
	}
	self.weapon_skins.flamethrower_mk2_fire.parts = {
		wpn_fps_fla_mk2_body_fierybeast = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/dragons_df"),
				uv_offset_rot = Vector3(0.101598, 0.998331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_overkill_logo_df"),
				uv_scale = Vector3(2.78944, 2.78944, 0.401383),
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df"),
				pattern_tweak = Vector3(10.2218, 4.66481, 1)
			},
			[Idstring("mtr_head"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_fla_mk2_body = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/dragons_df"),
				uv_offset_rot = Vector3(0.101598, 0.998331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_overkill_logo_df"),
				uv_scale = Vector3(2.78944, 2.78944, 0.401383),
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df"),
				pattern_tweak = Vector3(10.2218, 4.66481, 1)
			},
			[Idstring("mtr_head"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_fla_mk2_mag = {
			[Idstring("flame_fuel_can"):key()] = {
				cubemap_pattern_control = Vector3(0.1772, 0.444312, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dragon_scales_df")
			}
		},
		wpn_fps_fla_mk2_mag_rare = {
			[Idstring("flame_fuel_can"):key()] = {
				cubemap_pattern_control = Vector3(0.1772, 0.444312, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dragon_scales_df")
			}
		},
		wpn_fps_fla_mk2_mag_welldone = {
			[Idstring("flame_fuel_can"):key()] = {
				cubemap_pattern_control = Vector3(0.1772, 0.444312, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dragon_scales_df")
			}
		}
	}
	self.weapon_skins.flamethrower_mk2_fire.default_blueprint = {
		"wpn_fps_fla_mk2_empty",
		"wpn_fps_fla_mk2_body",
		"wpn_fps_fla_mk2_mag",
		"wpn_fps_upg_dragon_lord_legend"
	}
	self.weapon_skins.rpg7_boom.parts = {
		wpn_fps_rpg7_m_rocket = {
			[Idstring("mtr_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_006_df")
			},
			[Idstring("mtr_custom_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
			}
		},
		wpn_fps_upg_o_rx30 = {
			[Idstring("rx30"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_rpg7_m_grinclown = {
			[Idstring("mtr_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_006_df")
			},
			[Idstring("mtr_custom_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
			}
		},
		wpn_fps_rpg7_sight = {
			[Idstring("mtr_sights"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_rpg7_body = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/golden_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dollar_bling_df"),
				cubemap_pattern_control = Vector3(0.484856, 0.0555689, 0),
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df"),
				uv_offset_rot = Vector3(0.312392, 0.964172, 0),
				uv_scale = Vector3(2.21734, 4.02898, 0),
				pattern_tweak = Vector3(11.1281, 0.169331, 0.780587),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
			}
		}
	}
	self.weapon_skins.rpg7_boom.default_blueprint = {
		"wpn_fps_rpg7_body",
		"wpn_fps_rpg7_m_rocket",
		"wpn_fps_rpg7_barrel",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_green_grin_legend"
	}
	self.weapon_skins.m134_bulletstorm.parts = {
		wpn_fps_lmg_m134_body_upper_spikey = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_handle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_overkill_df"),
				uv_offset_rot = Vector3(0.403869, 1.06965, 4.72475),
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df"),
				uv_scale = Vector3(11.7046, 11.5616, 1),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(4.35488, 1.7877, 1)
			}
		},
		wpn_fps_lmg_m134_body_upper_light = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_handle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_overkill_df"),
				uv_offset_rot = Vector3(0.403869, 1.06965, 4.72475),
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df"),
				uv_scale = Vector3(11.7046, 11.5616, 1),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(4.35488, 1.7877, 1)
			}
		},
		wpn_fps_lmg_m134_body_upper = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_handle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_overkill_df"),
				uv_offset_rot = Vector3(0.403869, 1.06965, 4.72475),
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df"),
				uv_scale = Vector3(11.7046, 11.5616, 1),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(4.35488, 1.7877, 1)
			}
		},
		wpn_fps_lmg_m134_barrel_legendary = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bdsm_df"),
				uv_offset_rot = Vector3(-0.30007, 1.43362, 3.12136),
				pattern_pos = Vector3(0, 0.00620103, 0),
				uv_scale = Vector3(6.98481, 6.98481, 1),
				pattern_tweak = Vector3(16.4703, 0, 1)
			}
		},
		wpn_fps_lmg_m134_barrel = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bdsm_df"),
				uv_offset_rot = Vector3(-0.30007, 1.43362, 3.12136),
				pattern_pos = Vector3(0, 0.00620103, 0),
				uv_scale = Vector3(6.98481, 6.98481, 1),
				pattern_tweak = Vector3(16.4703, 0, 1)
			}
		},
		wpn_fps_lmg_m134_barrel_extreme = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bdsm_df"),
				uv_offset_rot = Vector3(-0.30007, 1.43362, 3.12136),
				pattern_pos = Vector3(0, 0.00620103, 0),
				uv_scale = Vector3(6.98481, 6.98481, 1),
				pattern_tweak = Vector3(16.4703, 0, 1)
			}
		},
		wpn_fps_lmg_m134_barrel_short = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bdsm_df"),
				uv_offset_rot = Vector3(-0.30007, 1.43362, 3.12136),
				pattern_pos = Vector3(0, 0.00620103, 0),
				uv_scale = Vector3(6.98481, 6.98481, 1),
				pattern_tweak = Vector3(16.4703, 0, 1)
			}
		},
		wpn_fps_lmg_m134_body = {
			[Idstring("mtr_body"):key()] = {
				uv_offset_rot = Vector3(0.196995, 1.22728, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(7.55068, 1.71278, 1)
			}
		}
	}
	self.weapon_skins.m134_bulletstorm.default_blueprint = {
		"wpn_fps_lmg_m134_body",
		"wpn_fps_lmg_m134_m_standard",
		"wpn_fps_lmg_m134_barrel_extreme",
		"wpn_fps_lmg_m134_body_upper",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_the_gimp_legend"
	}
	self.weapon_skins.r870_waves.parts = {
		wpn_fps_shot_r870_body_standard = {
			[Idstring("receiver"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_scale = Vector3(0.78745, 0.787775, 1),
				uv_offset_rot = Vector3(-0.132736, 1.12235, 0)
			}
		},
		wpn_fps_shot_r870_b_legendary = {
			[Idstring("long_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_scale = Vector3(0.834774, 0.930124, 1),
				uv_offset_rot = Vector3(-0.165514, 1.10327, 3.15133)
			},
			[Idstring("mtr_legendary_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_offset_rot = Vector3(0.184614, 1.15697, 1.61487),
				uv_scale = Vector3(2.79044, 2.59874, 1),
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
			}
		},
		wpn_fps_shot_r870_b_long = {
			[Idstring("long_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_scale = Vector3(0.834774, 0.930124, 1),
				uv_offset_rot = Vector3(-0.165514, 1.10327, 3.15133)
			},
			[Idstring("mtr_legendary_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_offset_rot = Vector3(0.184614, 1.15697, 1.61487),
				uv_scale = Vector3(2.79044, 2.59874, 1),
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
			}
		}
	}
	self.weapon_skins.r870_waves.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_long",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_shot_r870_fg_wood",
		"wpn_fps_shot_r870_s_nostock",
		"wpn_fps_upg_the_big_kahuna"
	}
	self.weapon_skins.p90_dallas_sallad.default_blueprint = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_m_std",
		"wpn_fps_smg_p90_b_long",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_salad_legend"
	}
	self.weapon_skins.x_1911_ginger.parts = {
		wpn_fps_pis_1911_o_long = {
			[Idstring("sights"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_b_standard = {
			[Idstring("slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				uv_offset_rot = Vector3(-0.146434, 1.01741, 0),
				pattern_pos = Vector3(0.301932, 0, 0),
				uv_scale = Vector3(1.78827, 2.88479, 1),
				pattern_tweak = Vector3(1.06368, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			},
			[Idstring("barrel_vented"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_b_long = {
			[Idstring("slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				uv_offset_rot = Vector3(-0.146434, 1.01741, 0),
				pattern_pos = Vector3(0.301932, 0, 0),
				uv_scale = Vector3(1.78827, 2.88479, 1),
				pattern_tweak = Vector3(1.06368, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			},
			[Idstring("barrel_vented"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_b_vented = {
			[Idstring("slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				uv_offset_rot = Vector3(-0.146434, 1.01741, 0),
				pattern_pos = Vector3(0.301932, 0, 0),
				uv_scale = Vector3(1.78827, 2.88479, 1),
				pattern_tweak = Vector3(1.06368, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			},
			[Idstring("barrel_vented"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_fl_legendary = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_upg_fl_pis_laser = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_upg_fl_pis_tlr1 = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_upg_fl_pis_crimson = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_upg_fl_pis_x400v = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_upg_fl_pis_m3x = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_pis_1911_g_legendary = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		},
		wpn_fps_pis_1911_g_standard = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		},
		wpn_fps_pis_1911_g_bling = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		},
		wpn_fps_pis_1911_g_ergo = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		},
		wpn_fps_pis_1911_g_engraved = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		}
	}
	self.weapon_skins.x_1911_ginger.default_blueprint = {
		"wpn_fps_pis_1911_g_standard",
		"wpn_fps_upg_fl_pis_laser",
		"wpn_fps_pis_1911_body_standard",
		"wpn_fps_pis_1911_b_long",
		"wpn_fps_pis_1911_m_standard",
		"wpn_fps_upg_santa_slayers_legend"
	}
	self.weapon_skins.model70_baaah.parts = {
		wpn_fps_snp_model70_b_legend = {
			[Idstring("mtr_skull"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
			}
		},
		wpn_fps_snp_model70_s_legend = {
			[Idstring("mtr_legend"):key()] = {
				uv_scale = Vector3(4.5534, 4.02898, 0),
				uv_offset_rot = Vector3(-0.308609, 1.01741, 0.513984)
			},
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/bah/sticker/sticker_bah_005_df"),
				uv_offset_rot = Vector3(-0.0188784, 0.924013, 0.469029),
				pattern_gradient = Idstring("units/payday2_cash/safes/bah/pattern_gradient/gradient_bah_002_df"),
				pattern_pos = Vector3(-0.140053, 0.322472, 0),
				uv_scale = Vector3(3.12316, 4.79177, 0),
				pattern = Idstring("units/payday2_cash/safes/bah/pattern/bah_pattern_007_df"),
				pattern_tweak = Vector3(6.21612, 0.012, 1)
			}
		},
		wpn_fps_snp_model70_s_standard = {
			[Idstring("mtr_legend"):key()] = {
				uv_scale = Vector3(4.5534, 4.02898, 0),
				uv_offset_rot = Vector3(-0.308609, 1.01741, 0.513984)
			},
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/bah/sticker/sticker_bah_005_df"),
				uv_offset_rot = Vector3(-0.0188784, 0.924013, 0.469029),
				pattern_gradient = Idstring("units/payday2_cash/safes/bah/pattern_gradient/gradient_bah_002_df"),
				pattern_pos = Vector3(-0.140053, 0.322472, 0),
				uv_scale = Vector3(3.12316, 4.79177, 0),
				pattern = Idstring("units/payday2_cash/safes/bah/pattern/bah_pattern_007_df"),
				pattern_tweak = Vector3(6.21612, 0.012, 1)
			}
		},
		wpn_fps_upg_o_leupold = {
			[Idstring("leupold"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/bah/sticker/sticker_bah_002b_df"),
				pattern = Idstring("units/payday2_cash/safes/bah/pattern/bah_pattern_001_df"),
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df"),
				uv_offset_rot = Vector3(0.36663, 0.969712, 6.28319),
				pattern_pos = Vector3(-0.037418, 0.807537, 0),
				uv_scale = Vector3(3.21851, 11.8953, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/bah/pattern_gradient/gradient_bah_009_df"),
				pattern_tweak = Vector3(0.532996, 0, 0)
			}
		},
		wpn_fps_snp_model70_body_standard = {
			[Idstring("mtr_receiver"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/bah/sticker/sticker_bah_005_df"),
				uv_scale = Vector3(1.50222, 1.1685, 0),
				uv_offset_rot = Vector3(0.222376, 1.08273, 5.22823)
			}
		}
	}
	--Legendary part additions
	self.weapon_skins.model70_baaah.default_blueprint = {
		"wpn_fps_snp_model70_b_standard",
		"wpn_fps_snp_model70_body_standard",
		"wpn_fps_snp_model70_s_standard",
		"wpn_fps_snp_model70_m_standard",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_fl_ass_peq15",
		"wpn_fps_upg_baaah_legend"
	}
	self.weapon_skins.par_wolf.default_blueprint = {
		"wpn_fps_lmg_par_b_short",
		"wpn_fps_lmg_par_body_standard",
		"wpn_fps_lmg_par_m_standard",
		"wpn_fps_lmg_par_s_plastic",
		"wpn_fps_lmg_par_upper_reciever",
		"wpn_fps_upg_bp_lmg_lionbipod",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_par_legend"
	}
	self.weapon_skins.m16_cola.default_blueprint = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_upg_m4_m_pmag",
		"wpn_fps_upg_o_acog",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m16_s_solid_vanilla",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		"wpn_fps_upg_ass_m4_upper_reciever_core",
		"wpn_fps_upg_cola_legend"
	}
	self.weapon_skins.boot_buck.default_blueprint = {
		"wpn_fps_sho_boot_b_standard",
		"wpn_fps_sho_boot_fg_standard",
		"wpn_fps_sho_boot_s_short",
		"wpn_fps_sho_boot_body_standard",
		"wpn_fps_sho_boot_em_extra",
		"wpn_fps_sho_boot_m_standard",
		"wpn_fps_upg_boot_legend_optic",
		"wpn_fps_upg_boot_legend"
	}
	self.weapon_skins.boot_buck.parts = {
		wpn_fps_sho_boot_fg_legendary = {
			[Idstring("mtr_fg_legend"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_018_df"),
				uv_offset_rot = Vector3(-0.013418, 0.889093, 6.28319),
				uv_scale = Vector3(2.24234, 4.59908, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_fg_standard = {
			[Idstring("mtr_fg_legend"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_018_df"),
				uv_offset_rot = Vector3(-0.013418, 0.889093, 6.28319),
				uv_scale = Vector3(2.24234, 4.59908, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_body_standard = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_017_df"),
				uv_offset_rot = Vector3(0.027582, 0.99787, 6.28319),
				uv_scale = Vector3(2.83711, 2.83711, 0),
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df")
			},
			[Idstring("mtr_mech"):key()] = {
				uv_scale = Vector3(4.7441, 6.60341, 1),
				uv_offset_rot = Vector3(0, 1.19866, 1.57791)
			}
		},
		wpn_fps_sho_boot_body_exotic = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_017_df"),
				uv_offset_rot = Vector3(0.027582, 0.99787, 6.28319),
				uv_scale = Vector3(2.83711, 2.83711, 0),
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df")
			},
			[Idstring("mtr_mech"):key()] = {
				uv_scale = Vector3(4.7441, 6.60341, 1),
				uv_offset_rot = Vector3(0, 1.19866, 1.57791)
			}
		},
		wpn_fps_sho_boot_b_legendary = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_b_df"),
				uv_offset_rot = Vector3(0.35517, 0.950632, 1.56293),
				pattern_pos = Vector3(0.645361, 0.473647, 0),
				uv_scale = Vector3(3.9813, 0.01, 1),
				pattern_tweak = Vector3(15.1347, 0.0794209, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			},
			[Idstring("mtr_axe"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_c_df"),
				uv_offset_rot = Vector3(0.257393, 0.823076, 3.12136),
				pattern_pos = Vector3(0.387789, -0.404006, 0),
				uv_scale = Vector3(2.27501, 3.40989, 0),
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_020_df"),
				pattern_tweak = Vector3(5.49964, 1.60788, 1)
			},
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df"),
				uv_offset_rot = Vector3(0.149297, 0.998331, 0),
				pattern_pos = Vector3(0, 0.206535, 0),
				uv_scale = Vector3(4.172, 5.84062, 0.150966),
				pattern_tweak = Vector3(7.26449, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_b_standard = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_b_df"),
				uv_offset_rot = Vector3(0.35517, 0.950632, 1.56293),
				pattern_pos = Vector3(0.645361, 0.473647, 0),
				uv_scale = Vector3(3.9813, 0.01, 1),
				pattern_tweak = Vector3(15.1347, 0.0794209, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			},
			[Idstring("mtr_axe"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_c_df"),
				uv_offset_rot = Vector3(0.257393, 0.823076, 3.12136),
				pattern_pos = Vector3(0.387789, -0.404006, 0),
				uv_scale = Vector3(2.27501, 3.40989, 0),
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_020_df"),
				pattern_tweak = Vector3(5.49964, 1.60788, 1)
			},
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df"),
				uv_offset_rot = Vector3(0.149297, 0.998331, 0),
				pattern_pos = Vector3(0, 0.206535, 0),
				uv_scale = Vector3(4.172, 5.84062, 0.150966),
				pattern_tweak = Vector3(7.26449, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_b_short = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_b_df"),
				uv_offset_rot = Vector3(0.35517, 0.950632, 1.56293),
				pattern_pos = Vector3(0.645361, 0.473647, 0),
				uv_scale = Vector3(3.9813, 0.01, 1),
				pattern_tweak = Vector3(15.1347, 0.0794209, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			},
			[Idstring("mtr_axe"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_c_df"),
				uv_offset_rot = Vector3(0.257393, 0.823076, 3.12136),
				pattern_pos = Vector3(0.387789, -0.404006, 0),
				uv_scale = Vector3(2.27501, 3.40989, 0),
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_020_df"),
				pattern_tweak = Vector3(5.49964, 1.60788, 1)
			},
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df"),
				uv_offset_rot = Vector3(0.149297, 0.998331, 0),
				pattern_pos = Vector3(0, 0.206535, 0),
				uv_scale = Vector3(4.172, 5.84062, 0.150966),
				pattern_tweak = Vector3(7.26449, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_b_long = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_b_df"),
				uv_offset_rot = Vector3(0.35517, 0.950632, 1.56293),
				pattern_pos = Vector3(0.645361, 0.473647, 0),
				uv_scale = Vector3(3.9813, 0.01, 1),
				pattern_tweak = Vector3(15.1347, 0.0794209, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			},
			[Idstring("mtr_axe"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_016_c_df"),
				uv_offset_rot = Vector3(0.257393, 0.823076, 3.12136),
				pattern_pos = Vector3(0.387789, -0.404006, 0),
				uv_scale = Vector3(2.27501, 3.40989, 0),
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_020_df"),
				pattern_tweak = Vector3(5.49964, 1.60788, 1)
			},
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_007_df"),
				uv_offset_rot = Vector3(0.149297, 0.998331, 0),
				pattern_pos = Vector3(0, 0.206535, 0),
				uv_scale = Vector3(4.172, 5.84062, 0.150966),
				pattern_tweak = Vector3(7.26449, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df")
			}
		},
		wpn_fps_sho_boot_s_legendary = {
			[Idstring("mtr_s_legend"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/buck/pattern/buck_pattern_006_df"),
				pattern_pos = Vector3(-0.184593, 0.7056, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df"),
				pattern_tweak = Vector3(2.30384, 0, 1)
			}
		},
		wpn_fps_sho_boot_s_short = {
			[Idstring("mtr_s_legend"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/buck/pattern/buck_pattern_006_df"),
				pattern_pos = Vector3(-0.184593, 0.7056, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df"),
				pattern_tweak = Vector3(2.30384, 0, 1)
			}
		},
		wpn_fps_sho_boot_s_long = {
			[Idstring("mtr_s_legend"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/buck/pattern/buck_pattern_006_df"),
				pattern_pos = Vector3(-0.184593, 0.7056, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_013_df"),
				pattern_tweak = Vector3(2.30384, 0, 1)
			}
		},
		wpn_fps_sho_boot_o_legendary = {
			[Idstring("mtr_sight_legend"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_001_df"),
				uv_scale = Vector3(7.22318, 12.2767, 0.179585),
				uv_offset_rot = Vector3(-0.0841165, 1.05303, 1.56293)
			}
		},
		wpn_fps_upg_boot_legend_optic = {
			[Idstring("mtr_sight_legend"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/buck/sticker/buck_sticker_001_df"),
				uv_scale = Vector3(7.22318, 12.2767, 0.179585),
				uv_offset_rot = Vector3(-0.0841165, 1.05303, 1.56293)
			}
		},
	}
	
	--BAYONETTA GUN--
	self.weapon_skins.judge_burn.default_blueprint = {
		"wpn_fps_pis_judge_body_standard",
		"wpn_fps_pis_judge_b_standard",
		"wpn_fps_pis_judge_g_standard",
		"wpn_fps_upg_judge_legend",
		"wpn_fps_upg_a_custom"
	}
	self.weapon_skins.judge_burn.parts = {
		wpn_fps_pis_judge_g_legend = {
			[Idstring("mtr_grip_legendary"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/burn/sticker/burn_sticker_025_df"),
				uv_scale = Vector3(2.16967, 2.40804, 0.310756),
				uv_offset_rot = Vector3(-0.195752, 1.00125, 4.7108)
			}
		},
		wpn_fps_pis_judge_g_standard = {
			[Idstring("mtr_grip_legendary"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/burn/sticker/burn_sticker_025_df"),
				uv_scale = Vector3(2.16967, 2.40804, 0.310756),
				uv_offset_rot = Vector3(-0.195752, 1.00125, 4.7108)
			}
		},
		wpn_fps_pis_judge_b_legend = {
			[Idstring("mtr_b_legendary"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/burn/base_gradient/base_burn_016_c_df"),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_001_df"),
				uv_offset_rot = Vector3(0.184455, 1.00579, 6.28319),
				pattern_pos = Vector3(0, 0.130217, 0),
				uv_scale = Vector3(2.40804, 2.50439, 1),
				sticker = Idstring("units/payday2_cash/safes/burn/sticker/burn_sticker_024_df"),
				pattern_tweak = Vector3(10.6034, 0.798698, 1)
			}
		},
		wpn_fps_pis_judge_b_standard = {
			[Idstring("mtr_b_legendary"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/burn/base_gradient/base_burn_016_c_df"),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_001_df"),
				uv_offset_rot = Vector3(0.184455, 1.00579, 6.28319),
				pattern_pos = Vector3(0, 0.130217, 0),
				uv_scale = Vector3(2.40804, 2.50439, 1),
				sticker = Idstring("units/payday2_cash/safes/burn/sticker/burn_sticker_024_df"),
				pattern_tweak = Vector3(10.6034, 0.798698, 1)
			}
		},
		wpn_fps_pis_judge_body_standard = {
			[Idstring("mtr_buckshot"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_003_df")
			},
			[Idstring("mtr_mech"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/burn/base_gradient/base_burn_016_b_df")
			},
			[Idstring("mtr_cylinder"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_020_df"),
				pattern_pos = Vector3(0, 0.626822, 0),
				uv_scale = Vector3(1, 0.01, 1),
				pattern_tweak = Vector3(1.34987, 4.71775, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/burn/pattern_gradient/gradient_burn_006_df")
			},
			[Idstring("mtr_frame"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/burn/sticker/burn_sticker_026_df"),
				uv_offset_rot = Vector3(-0.0329577, 0.881854, 1.57491),
				uv_scale = Vector3(1.69292, 1.88362, 1),
				pattern_tweak = Vector3(0.920584, 0, 1)
			}
		}
	}

	--KSG legendary--
	self.weapon_skins.ksg_same.default_blueprint = {
		"wpn_fps_sho_ksg_body_standard",
		"wpn_fps_sho_ksg_b_long",
		"wpn_fps_sho_ksg_fg_standard",
		"wpn_fps_upg_o_dd_rear",
		"wpn_fps_upg_ksg_legend",
		"wpn_fps_upg_a_custom_free"
	}
	self.weapon_skins.ksg_same.parts = {
		wpn_fps_sho_ksg_fg_standard = {
			[Idstring("mat_pump"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_d_df"),
				uv_offset_rot = Vector3(-0.308609, 0.740759, 4.14034),
				uv_scale = Vector3(0.01, 0.601377, 0),
				sticker = "units/payday2_cash/safes/same/sticker/sticker_same_015_e_df"
			}
		},
		wpn_fps_upg_o_dd_rear = {
			[Idstring("mtr_dd"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_d_df")
			}
		},
		wpn_fps_upg_o_dd_front = {
			[Idstring("mtr_dd"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_d_df")
			}
		},
		wpn_fps_sho_ksg_b_legendary = {
			[Idstring("mat_body"):key()] = {
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_c_df"
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_b_df",
				sticker = Idstring("units/payday2_cash/safes/same/sticker/sticker_same_015_b_df"),
				uv_scale = Vector3(5.22085, 5.22085, 0.053184),
				uv_offset_rot = Vector3(-0.00333852, 0.993331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern = Idstring("units/payday2_cash/safes/same/pattern/same_pattern_016_df")
			}
		},
		wpn_fps_sho_ksg_b_long = {
			[Idstring("mat_body"):key()] = {
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_c_df"
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_b_df",
				sticker = Idstring("units/payday2_cash/safes/same/sticker/sticker_same_015_b_df"),
				uv_scale = Vector3(5.22085, 5.22085, 0.053184),
				uv_offset_rot = Vector3(-0.00333852, 0.993331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern = Idstring("units/payday2_cash/safes/same/pattern/same_pattern_016_df")
			}
		},
		wpn_fps_sho_ksg_b_standard = {
			[Idstring("mat_body"):key()] = {
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_c_df"
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_b_df",
				sticker = Idstring("units/payday2_cash/safes/same/sticker/sticker_same_015_b_df"),
				uv_scale = Vector3(5.22085, 5.22085, 0.053184),
				uv_offset_rot = Vector3(-0.00333852, 0.993331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern = Idstring("units/payday2_cash/safes/same/pattern/same_pattern_016_df")
			}
		},
		wpn_fps_sho_ksg_b_short = {
			[Idstring("mat_body"):key()] = {
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_c_df"
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				base_gradient = "units/payday2_cash/safes/same/base_gradient/base_gradient_same_015_b_df",
				sticker = Idstring("units/payday2_cash/safes/same/sticker/sticker_same_015_b_df"),
				uv_scale = Vector3(5.22085, 5.22085, 0.053184),
				uv_offset_rot = Vector3(-0.00333852, 0.993331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern = Idstring("units/payday2_cash/safes/same/pattern/same_pattern_016_df")
			}
		},
		wpn_fps_sho_ksg_body_standard = {
			[Idstring("mat_body"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/same/pattern_gradient/gradient_same_016_df"),
				pattern_tweak = Vector3(0.983, 3.15932, 1),
				uv_offset_rot = Vector3(-0.093196, 1.00787, 6.28319),
				uv_scale = Vector3(3.12316, 3.07549, 0),
				pattern_pos = Vector3(1.10057, 1.2172, 0),
				sticker = "units/payday2_cash/safes/same/sticker/sticker_same_015_df",
				pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_010_df")
			}
		}
	}

	--The Not Patriot--
	self.weapon_skins.tecci_grunt.default_blueprint = {
		"wpn_fps_ass_tecci_dh_standard",
		"wpn_fps_ass_tecci_lower_reciever",
		"wpn_fps_ass_tecci_m_drum",
		"wpn_fps_ass_tecci_upper_reciever",
		"wpn_fps_ass_tecci_vg_standard",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_ass_tecci_b_standard",
		"wpn_fps_ass_tecci_fg_standard",
		"wpn_fps_m4_uupg_s_fold",
		"wpn_fps_upg_tecci_legend"
	}
	self.weapon_skins.tecci_grunt.parts = {
		wpn_fps_ass_tecci_lower_reciever = {
			[Idstring("mtr_lower"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_002_df"),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_024_df"),
				uv_scale = Vector3(14.1837, 14.279, 0),
				uv_offset_rot = Vector3(0.12736, 0.674981, 6.28319)
			}
		},
		wpn_fps_ass_tecci_b_legend = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df"),
				pattern_tweak = Vector3(0, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df")
			}
		},
		wpn_fps_ass_tecci_b_standard = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df"),
				pattern_tweak = Vector3(0, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df")
			}
		},
		wpn_fps_ass_tecci_b_long = {
			[Idstring("mtr_b_legend"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df"),
				pattern_tweak = Vector3(0, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df")
			}
		},
		wpn_fps_ass_tecci_dh_standard = {
			[Idstring("mtr_drag"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_001_df"),
				pattern_tweak = Vector3(0, 0, 1)
			}
		},
		wpn_fps_upg_o_eotech = {
			[Idstring("mtr_eotech"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/grunt/base_gradient/base_grunt_007_df"),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_021_df"),
				uv_scale = Vector3(6.55574, 6.93714, 1),
				uv_offset_rot = Vector3(-7.98811E-4, 0.788918, 0),
				pattern = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_001_df")
			}
		},
		wpn_fps_ass_tecci_upper_reciever = {
			[Idstring("mtr_upper"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_023_df"),
				uv_scale = Vector3(4.5534, 4.3627, 1),
				uv_offset_rot = Vector3(-0.0594179, 0.913934, 0),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df")
			}
		},
		wpn_fps_ass_tecci_vg_standard = {
			[Idstring("mtr_vg"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_019_df"),
				uv_scale = Vector3(2.69409, 3.12316, 0.263058),
				pattern_pos = Vector3(0.225614, 0.0825189, 0),
				uv_offset_rot = Vector3(0.0709791, 0.669981, 1.60788)
			}
		},
		wpn_fps_ass_tecci_s_legend = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_ass_tecci_s_standard = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_upg_m4_s_standard = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_upg_m4_s_crane = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_upg_m4_s_mk46 = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_upg_m4_s_ubr = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_m4_uupg_s_fold = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_upg_m4_s_pts = {
			[Idstring("mtr_s_legend"):key()] = {
				uv_offset_rot = Vector3(-0.271371, 1.00925, 6.28319),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_026_df"),
				uv_scale = Vector3(4.45805, 2.78944, 0)
			}
		},
		wpn_fps_ass_tecci_fg_legend = {
			[Idstring("mtr_fg_legend"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				uv_offset_rot = Vector3(0.248614, 0.952632, 6.28319),
				uv_scale = Vector3(11.9907, 14.6128, 0),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_025_df"),
				pattern = Idstring("units/payday2_cash/safes/bah/pattern/bah_pattern_006_df")
			}
		},
		wpn_fps_ass_tecci_fg_standard = {
			[Idstring("mtr_fg_legend"):key()] = {
				pattern_tweak = Vector3(0, 0, 1),
				uv_offset_rot = Vector3(0.248614, 0.952632, 6.28319),
				uv_scale = Vector3(11.9907, 14.6128, 0),
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_025_df"),
				pattern = Idstring("units/payday2_cash/safes/bah/pattern/bah_pattern_006_df")
			}
		}
	}
	--Plush Phoenix--
	self.weapon_skins.new_m14_lones.default_blueprint = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_m_standard",
		"wpn_fps_ass_m14_body_ebr",
		"wpn_fps_upg_o_m14_scopemount",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_m14_legend",
		"wpn_fps_upg_ns_ass_smg_medium"
	}
	self.weapon_skins.new_m14_lones.parts = {
		wpn_fps_ass_m14_body_legendary = {
			[Idstring("mtr_body"):key()] = {
				pattern_tweak = Vector3(0.72979, 6.28319, 1),
				uv_offset_rot = Vector3(0.0495189, 1.01641, 6.23823),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_021_df"),
				uv_scale = Vector3(1.26385, 3.74293, 1),
				pattern_pos = Vector3(-0.165514, -0.117815, 0),
				cubemap_pattern_control = Vector3(0.382304, 0.456237, 0),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_020_df")
			},
			[Idstring("mtr_stock"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df")
			}
		},
		wpn_fps_ass_m14_body_dmr = {
			[Idstring("mtr_body"):key()] = {
				pattern_tweak = Vector3(0.72979, 6.28319, 1),
				uv_offset_rot = Vector3(0.0495189, 1.01641, 6.23823),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_021_df"),
				uv_scale = Vector3(1.26385, 3.74293, 1),
				pattern_pos = Vector3(-0.165514, -0.117815, 0),
				cubemap_pattern_control = Vector3(0.382304, 0.456237, 0),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_020_df")
			},
			[Idstring("mtr_stock"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df")
			}
		},
		wpn_fps_ass_m14_body_ebr = {
			[Idstring("mtr_body"):key()] = {
				pattern_tweak = Vector3(0.72979, 6.28319, 1),
				uv_offset_rot = Vector3(0.0495189, 1.01641, 6.23823),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_021_df"),
				uv_scale = Vector3(1.26385, 3.74293, 1),
				pattern_pos = Vector3(-0.165514, -0.117815, 0),
				cubemap_pattern_control = Vector3(0.382304, 0.456237, 0),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_020_df")
			},
			[Idstring("mtr_stock"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df")
			}
		},
		wpn_fps_ass_m14_body_jae = {
			[Idstring("mtr_body"):key()] = {
				pattern_tweak = Vector3(0.72979, 6.28319, 1),
				uv_offset_rot = Vector3(0.0495189, 1.01641, 6.23823),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_021_df"),
				uv_scale = Vector3(1.26385, 3.74293, 1),
				pattern_pos = Vector3(-0.165514, -0.117815, 0),
				cubemap_pattern_control = Vector3(0.382304, 0.456237, 0),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_020_df")
			},
			[Idstring("mtr_stock"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df")
			}
		},
		wpn_fps_upg_o_eotech = {
			[Idstring("mtr_eotech"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_011_df"),
				uv_offset_rot = Vector3(0.117678, 0.796918, 3.15133),
				uv_scale = Vector3(6.55574, 5.03015, 0.150966)
			}
		},
		wpn_fps_ass_m14_b_legendary = {
			[Idstring("mtr_barrel"):key()] = {
				pattern_tweak = Vector3(1.20678, 0.184315, 1),
				uv_offset_rot = Vector3(0.0192806, 1.06157, 3.13635),
				pattern_pos = Vector3(-0.519483, -0.169974, 0),
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df"),
				cubemap_pattern_control = Vector3(0, 0.001, 0),
				uv_scale = Vector3(11.4186, 10.179, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_022_df"),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_017_df")
			}
		},
		wpn_fps_ass_m14_b_standard = {
			[Idstring("mtr_barrel"):key()] = {
				pattern_tweak = Vector3(1.20678, 0.184315, 1),
				uv_offset_rot = Vector3(0.0192806, 1.06157, 3.13635),
				pattern_pos = Vector3(-0.519483, -0.169974, 0),
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_009_c_df"),
				cubemap_pattern_control = Vector3(0, 0.001, 0),
				uv_scale = Vector3(11.4186, 10.179, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_022_df"),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_017_df")
			}
		},
		wpn_fps_upg_o_acog = {
			[Idstring("mtr_acog"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_001_b_df"),
				uv_offset_rot = Vector3(0.150837, 1.04087, 0),
				uv_scale = Vector3(3.69526, 2.83711, 0.899833),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_023_df")
			}
		},
		wpn_fps_upg_o_m14_scopemount = {
			[Idstring("mtr_mount"):key()] = {
				uv_offset_rot = Vector3(0.008, 0.71214, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_026_df"),
				uv_scale = Vector3(2.21734, 2.64641, 1)
			}
		},
		wpn_fps_ass_m14_body_upper_legendary = {
			[Idstring("base"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_001_b_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_003_df"),
				pattern_pos = Vector3(0.0729792, -0.0224179, 0),
				pattern_tweak = Vector3(0.872886, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_017_df")
			}
		},
		wpn_fps_ass_m14_body_upper = {
			[Idstring("base"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/lones/base_gradient/base_lones_001_b_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/buck/pattern_gradient/gradient_buck_003_df"),
				pattern_pos = Vector3(0.0729792, -0.0224179, 0),
				pattern_tweak = Vector3(0.872886, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_017_df")
			}
		},
		wpn_fps_ass_m14_m_standard = {
			[Idstring("mag"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_020_df"),
				uv_scale = Vector3(2.26502, 1.07315, 1),
				cubemap_pattern_control = Vector3(0, 0.804436, 0),
				uv_offset_rot = Vector3(0.0227409, 0.999251, 0.0194812)
			}
		},
		wpn_fps_ass_m14_body_lower_legendary = {
			[Idstring("lower1"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/gradient_france_df"),
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_014_df")
			}
		},
		wpn_fps_ass_m14_body_lower = {
			[Idstring("lower1"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/gradient_france_df"),
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_014_df")
			}
		},
		wpn_fps_upg_ns_ass_smg_medium = {
			[Idstring("medium"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df"),
				uv_offset_rot = Vector3(0.002, 1.01741, 1.60788),
				uv_scale = Vector3(1.69292, 0.977799, 1),
				pattern_pos = Vector3(0.750298, 1.22728, 0),
				pattern_tweak = Vector3(0.3959, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/burn/pattern/burn_pattern_018_df")
			}
		}
	}
--Demon--
	self.weapon_skins.serbu_lones.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_shot_r870_s_nostock_vanilla",
		"wpn_fps_upg_serbu_legend",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_a_custom_free",
		"wpn_fps_upg_o_reflex"
	}
	self.weapon_skins.serbu_lones.parts = {
		wpn_fps_shot_shorty_s_legendary = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_r870_s_nostock_vanilla = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_r870_s_folding = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_shorty_s_nostock_short = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_r870_s_solid = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_r870_s_solid_single = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_shorty_s_solid_short = {
			[Idstring("mtr_grip"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				uv_offset_rot = Vector3(-0.224672, 0.998331, 6.27319),
				uv_scale = Vector3(10.6558, 1.69292, 0),
				pattern_tweak = Vector3(0, 0, 1),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_024_df")
			}
		},
		wpn_fps_shot_shorty_b_legendary = {
			[Idstring("short_barrel"):key()] = {
				pattern_tweak = Vector3(8.12306, 0, 1),
				cubemap_pattern_control = Vector3(0.325066, 0.468161, 0),
				uv_scale = Vector3(5.45922, 5.45922, 1),
				uv_offset_rot = Vector3(2, 1.3513, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_004_df")
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_025_df"),
				uv_scale = Vector3(2.45571, 3.07549, 1),
				uv_offset_rot = Vector3(-0.0335768, 0.808537, 0),
				pattern_tweak = Vector3(1.58836, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_005_df")
			}
		},
		wpn_fps_shot_r870_b_short = {
			[Idstring("short_barrel"):key()] = {
				pattern_tweak = Vector3(8.12306, 0, 1),
				cubemap_pattern_control = Vector3(0.325066, 0.468161, 0),
				uv_scale = Vector3(5.45922, 5.45922, 1),
				uv_offset_rot = Vector3(2, 1.3513, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_004_df")
			},
			[Idstring("mtr_comp"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/lones/pattern_gradient/gradient_lones_005_df"),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_025_df"),
				uv_scale = Vector3(2.45571, 3.07549, 1),
				uv_offset_rot = Vector3(-0.0335768, 0.808537, 0),
				pattern_tweak = Vector3(1.58836, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_005_df")
			}
		},
		wpn_fps_shot_r870_body_standard = {
			[Idstring("receiver"):key()] = {
				pattern_tweak = Vector3(3.21011, 0, 1),
				cubemap_pattern_control = Vector3(1, 1, 0),
				uv_scale = Vector3(3.79061, 2.74176, 1),
				uv_offset_rot = Vector3(0.198995, 0.825235, 0),
				sticker = Idstring("units/payday2_cash/safes/lones/sticker/lones_sticker_019_df"),
				pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_005_df")
			}
		},
		wpn_fps_shot_shorty_fg_legendary = {
			[Idstring("mtr_fg"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_015_df")
			}
		},
		wpn_fps_shot_r870_fg_small = {
			[Idstring("mtr_fg"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/buck/base_gradient/base_buck_015_df")
			}
		},
		wpn_fps_upg_o_reflex = {
			[Idstring("reflex"):key()] = {
				pattern_tweak = Vector3(1.58836, 0, 1)
			}
		}
	}
	self.weapon_skins.ching_wwt = {
		name_id = "bm_wskn_ching_wwt",
		desc_id = "bm_wskn_ching_wwt_desc",
		weapon_id = "ching",
		rarity = "rare",
		bonus = "spread_p1",
		reserve_quality = true,
		texture_bundle_folder = "cash/safes/wwt",
		base_gradient = Idstring("units/payday2_cash/safes/wwt/base_gradient/base_wwt_008_df"),
		pattern_gradient = Idstring("units/payday2_cash/safes/ast/pattern_gradient/gradient_ast_001_df"),
		pattern = Idstring("units/payday2_cash/safes/smosh/pattern/smosh_pattern_021_b_df"),
		default_blueprint = {
			"wpn_fps_ass_ching_body_standard",
			"wpn_fps_ass_ching_bolt_standard",
			"wpn_fps_ass_ching_dh_standard",
			"wpn_fps_ass_ching_extra_swiwel",
			"wpn_fps_ass_ching_extra1_swiwel",
			"wpn_fps_ass_ching_m_standard",
			"wpn_fps_ass_ching_s_standard",
			"wpn_fps_ass_ching_s_pouch",
			"wpn_fps_upg_o_acog",
			"wpn_fps_upg_fl_ass_smg_sho_peqbox",
			"wpn_fps_ass_ching_b_standard",
			"wpn_fps_ass_ching_fg_railed"
		},
		parts = {
			wpn_fps_ass_ching_b_standard = {[Idstring("mat_ching_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/grunt/sticker/grunt_sticker_011_df"),
				uv_offset_rot = Vector3(0.406869, 1.37038, 1.60788),
				uv_scale = Vector3(3.59991, 1.64524, 1)
			}},
			wpn_fps_ass_ching_s_standard = {[Idstring("mat_ching_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/wwt/sticker/wwt_sticker_004_b_df"),
				uv_offset_rot = Vector3(-0.035, 0.881156, 0),
				uv_scale = Vector3(1.02547, 1.40687, 1)
			}},
			wpn_fps_ass_ching_fg_standard = {[Idstring("mat_ching_body"):key()] = {pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")}},
			wpn_fps_ass_ching_body_standard = {[Idstring("mat_ching_receiver"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/wac/base_gradient/base_wac_006_b_df"),
				uv_offset_rot = Vector3(0, 0, 3.09139),
				uv_scale = Vector3(1, 1, 0.215359),
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
			}},
			wpn_fps_ass_ching_bolt_standard = {[Idstring("mat_ching_body"):key()] = {pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")}},
			wpn_fps_ass_ching_s_pouch = {
				[Idstring("mtr_pouch"):key()] = {
					base_gradient = Idstring("units/payday2_cash/safes/wac/base_gradient/base_wac_018_df"),
					sticker = Idstring("units/payday2_cash/safes/wwt/sticker/wwt_sticker_004_df"),
					uv_scale = Vector3(1.21217, 1.1685, 1),
					uv_offset_rot = Vector3(0.330551, 1.07465, 4.72475),
					pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
				},
				[Idstring("mat_ching_body"):key()] = {
					uv_offset_rot = Vector3(-0.0381166, 0.880473, 0),
					sticker = Idstring("units/payday2_cash/safes/wwt/sticker/wwt_sticker_004_b_df"),
					uv_scale = Vector3(1.01782, 1.4152, 1)
				}
			},
			wpn_fps_upg_o_acog = {[Idstring("mtr_acog"):key()] = {base_gradient = Idstring("units/payday2_cash/safes/wwt/base_gradient/base_wwt_006_df")}}
		},
		types = {sight = {
			pattern_gradient = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df"),
			base_gradient = Idstring("units/payday2_cash/safes/cola/base_gradient/base_cola_005_df"),
			pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
		}}
	}	
		
	--Croupier blueprint/sticker fix
	self.weapon_skins.m16_ait.default_blueprint = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_upg_fl_ass_smg_sho_peqbox",
		"wpn_fps_upg_ass_m4_lower_reciever_core",
		"wpn_fps_upg_ass_m4_upper_reciever_core",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_snp_tti_s_vltor",
		"wpn_fps_upg_m4_g_mgrip",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_o_cmore"
	}
	self.weapon_skins.m16_ait.parts.wpn_fps_m4_uupg_m_std_vanilla = {
		[Idstring("m4_mag_std"):key()] = {
			pattern = "units/payday2_cash/safes/ait/pattern/ait_pattern_024_g_df",
			pattern_gradient = "units/payday2_cash/safes/ait/pattern_gradient/gradient_ait_024_b_df"
		}
	}
	
	--Born to steal fix
	self.weapon_skins.m16_cs4.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_upper_reciever_round",
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_m4_uupg_m_std_vanilla",
		"wpn_fps_upg_m4_g_standard_vanilla",
		"wpn_fps_m16_fg_standard",
		"wpn_fps_m4_uupg_b_medium_vanilla",
		"wpn_fps_ass_m16_o_handle_sight",
		"wpn_fps_m16_s_solid_vanilla"
	}
	
end

