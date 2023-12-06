Hooks:PostHook(BlackMarketTweakData, "_init_gloves", "ResGloves", function(self, tweak_data)
	table.insert(self.glove_adapter.player_style_exclude_list, "two_piece_suit")
	table.insert(self.glove_adapter.player_style_exclude_list, "loud_suit")
	table.insert(self.glove_adapter.player_style_exclude_list, "suit_sunny")
	table.insert(self.glove_adapter.player_style_exclude_list, "suit_prison")
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
	if SystemInfo:distribution() == Idstring("STEAM") then
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
	end

	--All Seeing Anchor		
	self.masks.all_seeing = {}
	self.masks.all_seeing.unit = "units/pd2_mod_fucking_masks/msk_eye/msk_eye"
	if SystemInfo:distribution() == Idstring("STEAM") then
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
	end

	--devmask.model		
	self.masks.cube = {}
	self.masks.cube.unit = "units/pd2_mod_fucking_masks/msk_cube/msk_cube"
	if SystemInfo:distribution() == Idstring("STEAM") then
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
	if SystemInfo:distribution() == Idstring("STEAM") then
	if Steam:is_user_in_source(Steam:userid(), "103582791466033055") then
		self.player_styles.poggers.global_value = "rest_omnia"
		self.player_styles.poggers.unlocked = true
	end
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
		characters = {},
		material_variations = {}
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
	
-- Color variations
	self.player_styles.loud_suit.material_variations.default = {
		name_id = "bm_suit_var_loud_suit_default",
		desc_id = "bm_suit_var_loud_suit_default_desc"
	}
	
	self.player_styles.loud_suit.material_variations.blue = {
		name_id = "bm_suit_var_loud_suit_blue",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_blue_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue",
	}
	
	self.player_styles.loud_suit.material_variations.brown = {
		name_id = "bm_suit_var_loud_suit_brown",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_brown_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown",
	}
	
	self.player_styles.loud_suit.material_variations.gorkaearth = {
		name_id = "bm_suit_var_loud_suit_gorkaearth",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_gorkaearth_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth",
	}
	
	self.player_styles.loud_suit.material_variations.gorkagreen = {
		name_id = "bm_suit_var_loud_suit_gorkagreen",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_gorkagreen_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen",
	}
	
	self.player_styles.loud_suit.material_variations.gorkagrey = {
		name_id = "bm_suit_var_loud_suit_gorkagrey",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_gorkagrey_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey",
	}
	
	self.player_styles.loud_suit.material_variations.gorkapurple = {
		name_id = "bm_suit_var_loud_suit_gorkapurple",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_gorkapurple_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple",
	}
	
	self.player_styles.loud_suit.material_variations.gorkasea = {
		name_id = "bm_suit_var_loud_suit_gorkasea",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_gorkasea_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea",
	}
	
	self.player_styles.loud_suit.material_variations.green = {
		name_id = "bm_suit_var_loud_suit_green",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_green_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green",
	}
	
	self.player_styles.loud_suit.material_variations.purple = {
		name_id = "bm_suit_var_loud_suit_purple",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_purple_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple",
	}
	
	self.player_styles.loud_suit.material_variations.red = {
		name_id = "bm_suit_var_loud_suit_red",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_red_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red",
	}
	
	self.player_styles.loud_suit.material_variations.white = {
		name_id = "bm_suit_var_loud_suit_white",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_loud_suit_white_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white",
	}
	
	
	self.player_styles.loud_suit.characters.chains.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_chains"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_chains"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_chains"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_chains"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_chains"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_chains"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_chains"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_chains"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_chains"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_chains"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_chains",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_chains"
	}
	}
	
	self.player_styles.loud_suit.characters.bodhi.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_bodhi"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_bodhi"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_bodhi"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_bodhi"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_bodhi"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_bodhi"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_bodhi"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_bodhi"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_bodhi"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_bodhi"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_bodhi",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_bodhi"
	}
	}
	
	self.player_styles.loud_suit.characters.max.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_sangres"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_sangres"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_sangres"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_sangres"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_sangres"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_sangres"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_sangres"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_sangres"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_sangres"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_sangres"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_sangres",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_sangres"
	}
	}
	
	self.player_styles.loud_suit.characters.chico.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_02"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_02"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_02"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_02"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_02"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_02"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_02"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_02"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_02"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_02"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_02"
	}
	}
	
	self.player_styles.loud_suit.characters.dragon.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_02"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_02"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_02"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_02"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_02"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_02"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_02"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_02"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_02"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_02"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_02",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_02"
	}
	}
	
	self.player_styles.loud_suit.characters.joy.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_joy"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_joy"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_joy"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_joy"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_joy"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_joy"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_joy"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_joy"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_joy"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_joy"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_joy",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_joy"
	}
	}
	
	self.player_styles.loud_suit.characters.sydney.material_variations = {
	blue = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_blue_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_blue_sydney"
    },
	brown = {
        third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_brown_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_brown_sydney"
    },
	gorkaearth = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkaearth_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkaearth_sydney"
	},
	gorkagreen = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagreen_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagreen_sydney"
	},
	gorkagrey = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkagrey_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkagrey_sydney"
	},
	gorkapurple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkapurple_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkapurple_sydney"
	},
	gorkasea = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_gorkasea_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_gorkasea_sydney"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_green_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_green_sydney"
	},
	purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_purple_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_purple_sydney"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_red_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_red_sydney"
	},
	white = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_loud_suit_white_sydney",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_loud_suit_white_sydney"
	}
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
		characters = {},
		material_variations = {}
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
	
	-- Color variations
	self.player_styles.suit_sunny.material_variations.default = {
		name_id = "bm_suit_var_suit_sunny_default",
		desc_id = "bm_suit_var_suit_sunny_default_desc"
	}
	
	self.player_styles.suit_sunny.material_variations.red = {
		name_id = "bm_suit_var_suit_sunny_red",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_red_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red",
	}
	
	self.player_styles.suit_sunny.material_variations.blue = {
		name_id = "bm_suit_var_suit_sunny_blue",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_blue_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue",
	}
	
	self.player_styles.suit_sunny.material_variations.yellow = {
		name_id = "bm_suit_var_suit_sunny_yellow",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_yellow_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow",
	}
	
	self.player_styles.suit_sunny.material_variations.green = {
		name_id = "bm_suit_var_suit_sunny_green",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_green_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green",
	}
	
	self.player_styles.suit_sunny.material_variations.pink = {
		name_id = "bm_suit_var_suit_sunny_pink",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_pink_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink",
	}
	
	self.player_styles.suit_sunny.material_variations.skull = {
		name_id = "bm_suit_var_suit_sunny_skull",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_skull_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_black = {
		name_id = "bm_suit_var_suit_sunny_hawaii_black",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_black_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_blue = {
		name_id = "bm_suit_var_suit_sunny_hawaii_blue",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_blue_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_red = {
		name_id = "bm_suit_var_suit_sunny_hawaii_red",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_red_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_green = {
		name_id = "bm_suit_var_suit_sunny_hawaii_green",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_green_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_orange = {
		name_id = "bm_suit_var_suit_sunny_hawaii_orange",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_orange_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_pink = {
		name_id = "bm_suit_var_suit_sunny_hawaii_pink",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_pink_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink",
	}
	
	self.player_styles.suit_sunny.material_variations.hawaii_cyan = {
		name_id = "bm_suit_var_suit_sunny_hawaii_cyan",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_hawaii_cyan_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan",
	}
	
	self.player_styles.suit_sunny.material_variations.payne = {
		name_id = "bm_suit_var_suit_sunny_payne",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_payne_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne",
	}
	
	self.player_styles.suit_sunny.material_variations.vice = {
		name_id = "bm_suit_var_suit_sunny_vice",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_vice_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice",
	}
	
	self.player_styles.suit_sunny.material_variations.security_red = {
		name_id = "bm_suit_var_suit_sunny_security_red",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_security_red_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red",
	}
	
	self.player_styles.suit_sunny.material_variations.security_purple = {
		name_id = "bm_suit_var_suit_sunny_security_purple",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_security_purple_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple",
	}
	
	self.player_styles.suit_sunny.material_variations.soprano_green = {
		name_id = "bm_suit_var_suit_sunny_soprano",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_soprano_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green",
	}
	
	self.player_styles.suit_sunny.material_variations.soprano_blue = {
		name_id = "bm_suit_var_suit_sunny_soprano",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_sunny_soprano_desc",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue",
	}
	
	--self.player_styles.suit_sunny.material_variations.neonred = {
		--name_id = "bm_suit_var_suit_sunny_neonred",
	--	unlocked = true,
	--	custom = true,
	--	texture_bundle_folder = "mods",
	--	desc_id = "bm_suit_var_suit_sunny_neonred_desc",
	--	material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse",
	--	third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_neonred",
	--}
	
	self.player_styles.suit_sunny.characters.chains.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_chains",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_chains"
	}
	}
	
	self.player_styles.suit_sunny.characters.bodhi.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_bodhi",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_bodhi"
	}
	}
	
	self.player_styles.suit_sunny.characters.max.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_sangres",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_sangres"
	}
	}
	
	self.player_styles.suit_sunny.characters.dragon.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	}
	}
	
	self.player_styles.suit_sunny.characters.chico.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_dragon",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_02"
	}
	}
	
	self.player_styles.suit_sunny.characters.joy.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_joy",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_joy"
	}
	}
	
	self.player_styles.suit_sunny.characters.sydney.material_variations = {
	skull = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_skull_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_red_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_blue_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	yellow = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_yellow_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_green_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_pink_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_black = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_black_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_cyan = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_cyan_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_pink = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_pink_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_blue_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_red_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_green_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	hawaii_orange = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_hawaii_orange_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	payne = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_payne_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	vice = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_vice_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	security_red = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_red_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	security_purple = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_security_purple_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	soprano_blue = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_blue_syndey",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_sydney"
	},
	soprano_green = {
	    third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_suit_sunny_soprano_green_sydney",
		material = "units/pd2_dlc_sus/characters/sus_acc_slaughterhouse/sus_acc_fps_slaughterhouse/sus_acc_fps_slaughterhouse_female_syndey"
	}
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
		characters = {},
		material_variations = {}
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
	
	self.player_styles.suit_prison.material_variations.default = {
		name_id = "bm_suit_var_suit_prison_default",
		desc_id = "bm_suit_var_suit_prison_default_desc"
	}
	
	self.player_styles.suit_prison.material_variations.repairman = {
		name_id = "bm_suit_var_suit_prison_repairman",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_prison_repairman_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_prison_suit_repairman",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_prison_suit_repairman",
	}
	
	self.player_styles.suit_prison.material_variations.comedy = {
		name_id = "bm_suit_var_suit_prison_comedy",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_prison_comedy_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_prison_suit_comedy",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_prison_suit_comedy",
	}
	
	self.player_styles.suit_prison.material_variations.janitor = {
		name_id = "bm_suit_var_suit_prison_janitor",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_prison_janitor_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_prison_suit_janitor",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_prison_suit_janitor",
	}
	
	self.player_styles.suit_prison.material_variations.subject = {
		name_id = "bm_suit_var_suit_prison_subject",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_prison_subject_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_prison_suit_subject",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_prison_suit_subject",
	}
	
	self.player_styles.suit_prison.material_variations.vaultboy = {
		name_id = "bm_suit_var_suit_prison_vaultboy",
		unlocked = true,
		custom = true,
		texture_bundle_folder = "mods",
		desc_id = "bm_suit_var_suit_prison_vaultboy_desc",
		material = "units/pd2_mod_suits/characters/shared_materials/res_acc_fps_prison_suit_vaultboy",
		third_material = "units/pd2_mod_suits/characters/shared_materials/res_acc_prison_suit_vaultboy",
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

	self._projectiles_index = {
		"frag",
		"launcher_frag",
		"rocket_frag",
		"molotov",
		"launcher_incendiary",
		"launcher_frag_m32",
		"west_arrow",
		"west_arrow_exp",
		"dynamite",
		"bow_poison_arrow",
		"crossbow_arrow",
		"crossbow_poison_arrow",
		"crossbow_arrow_exp",
		"wpn_prj_four",
		"wpn_prj_ace",
		"wpn_prj_jav",
		"arblast_arrow",
		"arblast_poison_arrow",
		"arblast_arrow_exp",
		"frankish_arrow",
		"frankish_poison_arrow",
		"frankish_arrow_exp",
		"long_arrow",
		"long_poison_arrow",
		"long_arrow_exp",
		"launcher_incendiary_m32",
		"launcher_frag_china",
		"launcher_incendiary_china",
		"wpn_prj_hur",
		"wpn_prj_target",
		"frag_com",
		"concussion",
		"launcher_frag_arbiter",
		"launcher_incendiary_arbiter",
		"chico_injector",
		"launcher_m203",
		"rocket_ray_frag",
		"fir_com",
		"smoke_screen_grenade",
		"dada_com",
		"tag_team",
		"ecp_arrow",
		"ecp_arrow_exp",
		"ecp_arrow_poison",
		"pocket_ecm_jammer",
		"launcher_frag_slap",
		"launcher_incendiary_slap",
		"elastic_arrow",
		"elastic_arrow_poison",
		"elastic_arrow_exp",
		"wpn_gre_electric",
		"launcher_electric",
		"launcher_electric_m32",
		"launcher_electric_china",
		"launcher_electric_slap",
		"launcher_electric_arbiter",
		"underbarrel_electric",
		"underbarrel_electric_groza",
		"underbarrel_m203_groza",
		"copr_ability",
		"xmas_snowball",
		"poison_gas_grenade",
		"launcher_poison",
		"launcher_poison_ms3gl_conversion",
		"launcher_poison_gre_m79",
		"launcher_poison_m32",
		"launcher_poison_groza",
		"launcher_poison_china",
		"launcher_poison_arbiter",
		"launcher_poison_slap",
		"launcher_poison_contraband",
		"launcher_frag_ms3gl",
		"launcher_incendiary_ms3gl",
		"launcher_electric_ms3gl",
		"sticky_grenade",
		"bravo_frag",
		"cluster_fuck",
		"child_grenade",
		"hatman_molotov",
		"launcher_frag_osipr",
		"launcher_incendiary_osipr",
		"launcher_electric_osipr",
		"launcher_poison_osipr",
		--Mod things
		"tachi"
	}

	--Throwables--
	--Shuriken
	self.projectiles.wpn_prj_four.max_amount = 9
	self.projectiles.wpn_prj_four.throw_allowed_expire_t = 0.05
	self.projectiles.wpn_prj_four.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_four.expire_t = 0.6
	--Throwing Cards
	self.projectiles.wpn_prj_ace.throw_allowed_expire_t = 0.05
	self.projectiles.wpn_prj_ace.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_ace.expire_t = 0.6
	self.projectiles.wpn_prj_ace.max_amount = 9
	--Throwing Knife
	self.projectiles.wpn_prj_target.throw_allowed_expire_t = 0.12
	self.projectiles.wpn_prj_target.repeat_expire_t = 0.625
	self.projectiles.wpn_prj_target.expire_t = 0.65
	self.projectiles.wpn_prj_target.max_amount = 9
	--Throwing Axe
	self.projectiles.wpn_prj_hur.throw_allowed_expire_t = 0.35
	self.projectiles.wpn_prj_hur.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_hur.expire_t = 0.6
	self.projectiles.wpn_prj_hur.max_amount = 6
	--Javelin
	self.projectiles.wpn_prj_jav.throw_allowed_expire_t = 0.75
	self.projectiles.wpn_prj_jav.repeat_expire_t = 0.8
	self.projectiles.wpn_prj_jav.expire_t = 0.9
	self.projectiles.wpn_prj_jav.max_amount = 6
	self.projectiles.fir_com.max_amount = 3
	self.projectiles.smoke_screen_grenade.base_cooldown = 35
	self.projectiles.damage_control.base_cooldown = 30
	self.projectiles.tag_team.base_cooldown = 80
	self.projectiles.concussion.max_amount = 3
	self.projectiles.wpn_gre_electric.max_amount = 3
	self.projectiles.poison_gas_grenade.max_amount = 3

	self.projectiles.sticky_grenade.throw_shout = nil

	if self.projectiles.xmas_snowball then
		self.projectiles.xmas_snowball.max_amount = 3
		self.projectiles.xmas_snowball.base_cooldown_no_perk = true --flag to allow JOAT calcs
		self.projectiles.xmas_snowball.base_cooldown = 25
		self.projectiles.xmas_snowball.throw_shout = true --DISABLES the throw callout, totally not confusing at all
	end

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
	self.projectiles.sticky_grenade.no_cheat_count = true

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
	self.projectiles.hatman_molotov.range = 300
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
		unit = "units/mods/weapons/wpn_osipr_frag_poison_grenade/wpn_osipr_frag_poison_grenade",
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
		"wpn_fps_amcar_bolt_standard",
		"wpn_fps_upg_cola_legend"
	}
	self.weapon_skins.m16_cola.types = {
		foregrip = {
			sticker = Idstring("units/payday2_cash/safes/cola/sticker/sticker_markings_19_df"),
			pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_004_df"),
			pattern_tweak = Vector3(0.438899, 1.5859, 1),
			pattern_pos = Vector3(-0.006, -0.991229, 0),
			uv_scale = Vector3(20, 3.64958, 0),
			uv_offset_rot = Vector3(-0.203673, 0.979251, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/cola/pattern_gradient/gradient_cola_002_df")
		},
		stock = {
			sticker = Idstring("units/payday2_cash/safes/cola/sticker/sticker_markings_1_df"),
			pattern = Idstring("units/payday2_cash/safes/cola/pattern/cola_pattern_017_df"),
			base_gradient = Idstring("units/payday2_cash/safes/bah/base_gradient/base_bah_002_df"),
			uv_offset_rot = Vector3(0.244694, 0.941092, 0),
			pattern_pos = Vector3(1.08311, 0.916694, 0),
			uv_scale = Vector3(8.5104, 4.69642, 1),
			pattern_tweak = Vector3(0.854187, 1.5709, 1),
			pattern_gradient = Idstring("units/payday2_cash/safes/cola/pattern_gradient/gradient_cola_007_df")
		},
		barrel = {
			sticker = Idstring("units/payday2_cash/safes/cola/sticker/sticker_markings_15_df"),
			uv_scale = Vector3(6.69876, 9.36854, 0),
			uv_offset_rot = Vector3(0.325011, 0.915013, 0)
		},
		grip = {
			base_gradient = Idstring("units/payday2_cash/safes/cola/base_gradient/base_cola_008_df"),
			uv_offset_rot = Vector3(0.079979, 0.935553, 4.70975),
			pattern_pos = Vector3(1.2062, 0.866315, 0),
			uv_scale = Vector3(14.2314, 14.4697, 1),
			sticker = Idstring("units/payday2_cash/safes/cola/sticker/sticker_markings_14_df"),
			pattern_tweak = Vector3(1, 2.82166, 1)
		},
		upper_reciever = {
			base_gradient = Idstring("units/payday2_cash/safes/cola/base_gradient/base_cola_017_df")
		},
		lower_reciever = {
			base_gradient = Idstring("units/payday2_cash/safes/cola/base_gradient/base_cola_017_df")
		}
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

	self.weapon_skins.serbu_dallas.parts = {
		wpn_fps_shot_r870_fg_big = {
			[Idstring("big_pump"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
				uv_scale = Vector3(0.596401, 0.69175, 0),
				uv_offset_rot = Vector3(-0.00333858, 1.01741, 0)
			}
		},
		wpn_fps_shot_r870_fg_wood = {
			[Idstring("wood_pump"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
				uv_scale = Vector3(0.596401, 0.69175, 0),
				uv_offset_rot = Vector3(-0.00333858, 1.01741, 0)
			}
		},
		wpn_fps_shot_r870_fg_small = {
			[Idstring("short_pump"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
				uv_scale = Vector3(0.596401, 0.69175, 0),
				uv_offset_rot = Vector3(-0.00333858, 1.01741, 0)
			}
		}
	}
	
end

--Adds a couple of alternative paint schemes
function WeaponColorTemplates.setup_weapon_color_templates(tweak_data)
	local weapon_color_templates = {
		color_variation = WeaponColorTemplates._setup_color_variation_template(tweak_data),
		color_skin = WeaponColorTemplates._setup_color_skin_template(tweak_data)
	}

	-- Metal+
		-- Sights
		table.insert(weapon_color_templates.color_variation, 
			{
				--base_sights = "base_variation",
				gradient_default = "gradient_default",
				pattern_default = "pattern_default",
				base_default = "base_metal",
				base_gadget = "base_variation",
				base_magazine = "base_variation"
			}
		)
		-- Magazine
		table.insert(weapon_color_templates.color_variation, 
			{
				base_sights = "base_variation",
				gradient_default = "gradient_default",
				pattern_default = "pattern_default",
				base_default = "base_metal",
				base_gadget = "base_variation",
				--base_magazine = "base_variation"
			}
		)
		-- Sights + Magazine
		table.insert(weapon_color_templates.color_variation, 
			{
				--base_sights = "base_variation",
				gradient_default = "gradient_default",
				pattern_default = "pattern_default",
				base_default = "base_metal",
				base_gadget = "base_variation",
				--base_magazine = "base_variation"
			}
		)

	return weapon_color_templates
end



function BlackMarketTweakData:_piggy_hammer()
   	self.melee_weapons.piggy_hammer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.piggy_hammer.name_id = "bm_melee_piggy_hammer"
	self.melee_weapons.piggy_hammer.info_id = "bm_melee_piggy_hammer_info"
	self.melee_weapons.piggy_hammer.anim_global_param = "melee_baseballbat"
	self.melee_weapons.piggy_hammer.type = "axe"
	self.melee_weapons.piggy_hammer.texture_bundle_folder = "pda10"
	self.melee_weapons.piggy_hammer.dlc = "pda10"
	self.melee_weapons.piggy_hammer.locks = {
		func = "has_unlocked_piggy_hammer"
	}
	self.melee_weapons.piggy_hammer.free = nil
	self.melee_weapons.piggy_hammer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.piggy_hammer.unit = "units/pd2_dlc_pda10/weapons/wpn_fps_mel_piggy_hammer_pts/wpn_fps_mel_piggy_hammer"
	self.melee_weapons.piggy_hammer.third_unit = "units/pd2_dlc_pda10/weapons/wpn_fps_mel_piggy_hammer_pts/wpn_third_mel_piggy_hammer"
	self.melee_weapons.piggy_hammer.stats.weapon_type = "blunt"
	self.melee_weapons.piggy_hammer.stats.min_damage = 2
	self.melee_weapons.piggy_hammer.stats.max_damage = 4
	self.melee_weapons.piggy_hammer.stats.min_damage_effect = 10
	self.melee_weapons.piggy_hammer.stats.max_damage_effect = 10
	self.melee_weapons.piggy_hammer.stats.special_damage_multiplier = 1.5
	self.melee_weapons.piggy_hammer.stats.charge_time = 3
	self.melee_weapons.piggy_hammer.stats.range = 275
	self.melee_weapons.piggy_hammer.stats.weapon_type = "blunt"
	self.melee_weapons.piggy_hammer.sounds = {}
	self.melee_weapons.piggy_hammer.repeat_expire_t = 0.9
	self.melee_weapons.piggy_hammer.expire_t = 1.2
	self.melee_weapons.piggy_hammer.sounds.equip = "piggy_equip"
	self.melee_weapons.piggy_hammer.sounds.hit_air = "piggy_hit_air"
	self.melee_weapons.piggy_hammer.sounds.hit_gen = "piggy_hit_gen"
	self.melee_weapons.piggy_hammer.sounds.hit_body = "piggy_hit_body"
	self.melee_weapons.piggy_hammer.sounds.charge = "piggy_charge"
	self.melee_weapons.piggy_hammer.melee_damage_delay = 0.2
	self.melee_weapons.piggy_hammer.stats.concealment = 27
	self.melee_weapons.piggy_hammer.anims = {
		charge = {
			loop = true,
			anim = "Idle"
		}
	}
	self.melee_weapons.piggy_hammer.menu_scene_anim = "Idle"
	self.melee_weapons.piggy_hammer.menu_scene_params = {
		loop = true
	}
	self.melee_weapons.piggy_hammer.random_special_effects = {
		{
			weight = 45,
			tase_data = {
				tase_strength = "light"
			}
		},
		{
			weight = 40,
			dot_data_name = "melee_fear"
		},
		{
			weight = 15,
			instant_kill = true
		}
	}
end

local melee_weapons_old = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(tweak_data)
   	melee_weapons_old(self, tweak_data)	
   	self:_piggy_hammer()

	local melee_anim = {}
		
		--melee_nin
		melee_anim = {
			'nin'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_nin_res"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.0
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].can_melee_miss = true
			self.melee_weapons[melee_id].miss_repeat_expire_t = 0.005
			self.melee_weapons[melee_id].miss_expire_t = 0.45
			self.melee_weapons[melee_id].miss_anim_speed_mult = nil
			self.melee_weapons[melee_id].melee_damage_delay = 0.015
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
			self.melee_weapons[melee_id].sphere_cast_radius_add = -10
			self.melee_weapons[melee_id].melee_charge_shaker = ""
			self.melee_weapons[melee_id].no_hit_shaker = true
			self.melee_weapons[melee_id].sounds.hit_air = "secondary_dryfire"
			self.melee_weapons[melee_id].sounds.charge = ""
			self.melee_weapons[melee_id].make_effect = true
			self.melee_weapons[melee_id].make_decal = true 
		end
	
		--melee_cs
		melee_anim = {
			'cs'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cs"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var3"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].timing_fix = {"var1"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.2
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.45
			self.melee_weapons[melee_id].anim_speed_mult = 0.9
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = 8
			self.melee_weapons[melee_id].melee_charge_shaker = ""
		end
		
		--melee_great
		--It's basically "melee_baseballbat" but with more windup
		melee_anim = {
			'great','meter'
		}
		--unsure if this'll work, hope it does
		if self.melee_weapons.halloween_sword then
			table.insert(melee_anim, "halloween_sword")
		end
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_great"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var1"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.20
			self.melee_weapons[melee_id].melee_damage_delay = 0.6
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = 16
		end
		
		--melee_hockey
		--Bad anim set, makes anything using it look like it doesn't have the range its given. Moved weapons out of here into "melee_baseballbat"
		melee_anim = {
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_hockey"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].timing_fix = {"var4"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.58
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
		end
		
		--melee_briefcase
		melee_anim = {
			'briefcase'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_briefcase"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.2
			self.melee_weapons[melee_id].repeat_expire_t = 1
			self.melee_weapons[melee_id].melee_damage_delay = 0.3
			self.melee_weapons[melee_id].anim_speed_mult = 1.4
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
		end
		
		--melee_fear
		melee_anim = {
			'fear'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fear"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_speed_mult = 1.4
		end
		
		--melee_baseballbat
		melee_anim = {
			'stick','spoon','spoon_gold','hockey',
			'freedom'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_baseballbat"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"} --No more stabbing with blunt objects
			self.melee_weapons[melee_id].expire_t = 1.025
			self.melee_weapons[melee_id].repeat_expire_t = 0.9
			self.melee_weapons[melee_id].melee_damage_delay = 0.275
			self.melee_weapons[melee_id].anim_speed_mult = 0.9473
			self.melee_weapons[melee_id].sphere_cast_radius_add = 12
		end
		
		--melee_beardy
		melee_anim = {
			'beardy','baseballbat','barbedwire','dingdong','alien_maul','piggy_hammer'
		}
		for i, melee_id in ipairs(melee_anim) do
			if self.melee_weapons[melee_id] then
				self.melee_weapons[melee_id].anim_global_param = "melee_beardy"
				self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
				self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
				self.melee_weapons[melee_id].expire_t = 1.45
				self.melee_weapons[melee_id].repeat_expire_t = 1.2
				self.melee_weapons[melee_id].melee_damage_delay = 0.65
				self.melee_weapons[melee_id].anim_speed_mult = 1.2631
				self.melee_weapons[melee_id].sphere_cast_radius_add = 16
			end
		end

		--melee_cutters
		melee_anim = {
			'cutters'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cutters"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"} --Downward swings on uncharged attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var4"} --Jab on charged attacks
			self.melee_weapons[melee_id].expire_t = 1.15
			self.melee_weapons[melee_id].repeat_expire_t = 0.95
			self.melee_weapons[melee_id].melee_damage_delay = 0.3
			self.melee_weapons[melee_id].anim_speed_mult = 1
		end
		
		--melee_knife
		melee_anim = {
			'kabartanto','kabar','rambo','bowie'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_knife"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1", "var3", "var4"}
			self.melee_weapons[melee_id].expire_t = 1.1
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1.14285
		end	
		self.melee_weapons.bowie.anim_attack_vars = {"var1","var2"} --Removes the awkward blunt side strike attack variants
		
		--melee_knife2
		melee_anim = {
			'x46','kampfmesser','model24','microphone'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_knife2"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.475
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.7307
		end
		
		--melee_sandsteel
		melee_anim = {
			'sandsteel'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_sandsteel"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].timing_fix = {"var3"} --What attack varants are subject to "timing_fix_speed_mult"
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.75 --Applies a speed mult to attack variants in "timing_fix". Has no bearing on other timers like repeat, expire, delay
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.75
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
			self.melee_weapons[melee_id].anim_speed_mult = 1
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = 12
		end	
		
		--melee_boxcutter
		melee_anim = {
			'boxcutter','switchblade'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_boxcutter"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}	
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"}
			self.melee_weapons[melee_id].expire_t = 0.45
			self.melee_weapons[melee_id].repeat_expire_t = 0.35
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 0.875
		end
		
		--melee_boxing
		melee_anim = {
			'boxing_gloves'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_boxing"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3"} --Jabs on uncharged melee attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var4"} --Hook/uppercut on charged melee attacks
			self.melee_weapons[melee_id].timing_fix = {"var2","var4"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.15
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.425
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 0.85
		end
		
		--melee_catch
		melee_anim = {
			'catch'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_catch"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2",}
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.525
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.675
		end	
		
		--melee_happy
		melee_anim = {
			'happy'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_happy"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].expire_t = 0.625
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
			self.melee_weapons[melee_id].anim_speed_mult = 0.74
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
			self.melee_weapons[melee_id].force_play_charge = nil
			self.melee_weapons[melee_id].anims = {
				var1_attack = {
					anim = "var2"
				},		
				var2_attack = {
					anim = "var2"
				},		
				var3_attack = {
					anim = "var2"
				},
				var4_attack = {
					anim = "var2"
				},
				charge = {
					anim = "charge"
				}
			}
		end
		
		--melee_blunt
		melee_anim = {
			'baton','oldbaton','detector','shovel','shillelagh','whiskey','morning','branding_iron','slot_lever','hammer','tenderizer','croupier_rake','shock',
			'spatula','swagger','selfie','chac',
			'iceaxe'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
		end	

		--melee_brick
		--Pretty much a clone of melee_blunt but the hand hold is wider
		melee_anim = {
			'brick'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_brick"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
		end
		
		--melee_axe
		melee_anim = {
			'moneybundle','tomahawk','scalper','becker','gator','oxide','machete','bullseye','sap'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_axe"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.85
			self.melee_weapons[melee_id].repeat_expire_t = 0.7
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
		end
		
		--melee_pitchfork
		melee_anim = {
			'pitchfork'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_pitchfork"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.675
			self.melee_weapons[melee_id].melee_damage_delay = 0.325
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
		end
		
		--melee_clean
		melee_anim = {
			'clean'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_clean"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 0.25
			self.melee_weapons[melee_id].repeat_expire_t = 0.2
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.6
		end
		
		--melee_pickaxe
		melee_anim = {
			'mining_pick','fireaxe','micstand'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_pickaxe"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.1
			self.melee_weapons[melee_id].repeat_expire_t = 0.95
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.975
		end
		
		
		--melee_freedom
		--Moved 'freedom' to "melee_baseballbat" :^)
		melee_anim = {}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_freedom"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.25
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
		end
	
		--melee_fight
		melee_anim = {
			'fight'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fight"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var3"}
			self.melee_weapons[melee_id].timing_fix = {"var4","var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 1.2
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.35
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
		end
		
		--melee_twins
		melee_anim = {
			'twins'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_twins"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"} --Removes the weird pommel strike attack variant
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2"} --Charged melee attacks guarantee usage of the stab attack variant (cosmetic)
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
		end
		
		--melee_grip
		melee_anim = {
			'grip'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_grip"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.4
			self.melee_weapons[melee_id].repeat_expire_t = 0.3
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.5 --Still a bit faster than it was originally, even with this heavy of a slowdown
		end
		
		--melee_psycho
		melee_anim = {
			'chef','shawn','aziz'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_psycho"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var4"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
		end
		
		--melee_fist
		melee_anim = {
			'fists','brass_knuckles','zeus','push'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_fist"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"} --Perform jab for uncharged melee attacks
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var2","var3"} --Perform hook for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
		
		--melee_tiger
		--Slightly different attack variants compared to "melee_fist"
		melee_anim = {
			'tiger'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_tiger"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"} --Perform uppercut for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
		
		--melee_wing
		melee_anim = {
			'wing'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_wing"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.675
			self.melee_weapons[melee_id].repeat_expire_t = 0.5
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].force_play_charge = true --flag to force animated melee weapons to replay their charge anim after successive attacks without having to redraw the weapon
		end
		
		--melee_road
		melee_anim = {
			'road'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_road"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = { "var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.35
			self.melee_weapons[melee_id].force_play_charge = true
			self.melee_weapons[melee_id].anim_speed_mult = 0.85714
		end
		
		--melee_cleaver
		melee_anim = {
			'cleaver','meat_cleaver'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_cleaver"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].timing_fix = {"var2","var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.97
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.875
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
			self.melee_weapons[melee_id].anim_speed_mult = 1.25
		end
		
		--melee_ballistic
		melee_anim = {
			'ballistic','poker'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_ballistic"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right","a_weapon_left"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.775
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.125
		end
		
		--melee_stab
		melee_anim = {
			'toothbrush','cqc','fork','pugio','fairbair','bayonet','sword','gerber','scoutknife'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_stab"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].expire_t = 0.825
			self.melee_weapons[melee_id].repeat_expire_t = 0.5
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1.2
		end
	
		--melee_taser
		melee_anim = {
			'taser'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_taser"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.7
			self.melee_weapons[melee_id].repeat_expire_t = 0.6
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
		end
		
		--melee_agave
		melee_anim = {
			'agave'
		}
		for i, melee_id in ipairs(melee_anim) do
			self.melee_weapons[melee_id].anim_global_param = "melee_agave"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3","var4"}
			self.melee_weapons[melee_id].expire_t = 0.675
			self.melee_weapons[melee_id].repeat_expire_t = 0.575
			self.melee_weapons[melee_id].melee_damage_delay = 0.175
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
			self.melee_weapons[melee_id].sphere_cast_radius_add = 4
		end

	--Weapon butt--
	self.melee_weapons.weapon.info_id = "bm_melee_weapon_info"
	self.melee_weapons.weapon.stats.min_damage = 4.5
	self.melee_weapons.weapon.stats.max_damage = 4.5
	self.melee_weapons.weapon.stats.min_damage_effect = 4.5
	self.melee_weapons.weapon.stats.max_damage_effect = 4.5
	self.melee_weapons.weapon.can_melee_miss = true
	self.melee_weapons.weapon.expire_t = 0.65
	self.melee_weapons.weapon.miss_expire_t = 0.75
	self.melee_weapons.weapon.repeat_expire_t = 0.5
	self.melee_weapons.weapon.miss_repeat_expire_t = 0.55
	self.melee_weapons.weapon.stats.range = 140
	self.melee_weapons.weapon.stats.concealment = 30
	--Remember the basics of CQC Snake--
	self.melee_weapons.fists.stats.min_damage = 2.4
	self.melee_weapons.fists.stats.max_damage = 4.501
	self.melee_weapons.fists.stats.min_damage_effect = 4.5
	self.melee_weapons.fists.stats.max_damage_effect = 9.0
	self.melee_weapons.fists.stats.charge_time = 0.5
	self.melee_weapons.fists.stats.range = 150
	self.melee_weapons.fists.stats.concealment = 30

	--[[     BLUNT     ]]
		--Tough love, tooth shot--
		self.melee_weapons.brass_knuckles.stats.min_damage = 3
		self.melee_weapons.brass_knuckles.stats.max_damage = 6.001
		self.melee_weapons.brass_knuckles.stats.min_damage_effect = 6.0
		self.melee_weapons.brass_knuckles.stats.max_damage_effect = 12.0
		self.melee_weapons.brass_knuckles.stats.charge_time = 1.1
		self.melee_weapons.brass_knuckles.stats.range = 155
		self.melee_weapons.brass_knuckles.stats.concealment = 30
		--Thanks Boss--	
		self.melee_weapons.fight.stats.min_damage = 1.2
		self.melee_weapons.fight.stats.max_damage = 2.401
		self.melee_weapons.fight.stats.min_damage_effect = 9.0
		self.melee_weapons.fight.stats.max_damage_effect = 18.0
		self.melee_weapons.fight.stats.charge_time = 0.9
		self.melee_weapons.fight.stats.range = 160
		self.melee_weapons.fight.stats.concealment = 30
		self.melee_weapons.fight.counter_damage = 12
		self.melee_weapons.fight.info_id = "bm_melee_fight_info"
		--Ding Ding--
		self.melee_weapons.boxing_gloves.info_id = "bm_melee_boxing_gloves_info"
		self.melee_weapons.boxing_gloves.stats.min_damage = 1.8
		self.melee_weapons.boxing_gloves.stats.max_damage = 3.001
		self.melee_weapons.boxing_gloves.stats.min_damage_effect = 9.0
		self.melee_weapons.boxing_gloves.stats.max_damage_effect = 18.0
		self.melee_weapons.boxing_gloves.stats.charge_time = 1.1
		self.melee_weapons.boxing_gloves.stats.range = 160
		self.melee_weapons.boxing_gloves.stats.concealment = 29
		self.melee_weapons.boxing_gloves.special_weapon = "stamina_restore"

		--Fleshlight--
		self.melee_weapons.aziz.stats.min_damage = 2.4
		self.melee_weapons.aziz.stats.max_damage = 4.501
		self.melee_weapons.aziz.stats.min_damage_effect = 4.5
		self.melee_weapons.aziz.stats.max_damage_effect = 9.0
		self.melee_weapons.aziz.stats.charge_time = 1.0
		self.melee_weapons.aziz.stats.range = 150
		self.melee_weapons.aziz.stats.concealment = 30

		--woo free tasers--
		self.melee_weapons.zeus.tase_data = nil
		self.melee_weapons.zeus.special_weapon = "taser"
		self.melee_weapons.zeus.info_id = "bm_melee_taser_info"
		self.melee_weapons.zeus.stats.min_damage = 1.2
		self.melee_weapons.zeus.stats.max_damage = 2.401
		self.melee_weapons.zeus.stats.min_damage_effect = 0.6
		self.melee_weapons.zeus.stats.max_damage_effect = 1.2
		self.melee_weapons.zeus.stats.charge_time = 0.75
		self.melee_weapons.zeus.stats.range = 155
		self.melee_weapons.zeus.stats.concealment = 29
			--RIP Buzzer meta--
			self.melee_weapons.taser.tase_data = nil
			self.melee_weapons.taser.special_weapon = "taser"	
			self.melee_weapons.taser.stats.min_damage = 1.2
			self.melee_weapons.taser.stats.max_damage = 2.401
			self.melee_weapons.taser.stats.min_damage_effect = 0.6
			self.melee_weapons.taser.stats.max_damage_effect = 1.2
			self.melee_weapons.taser.stats.charge_time = 0.75
			self.melee_weapons.taser.stats.range = 155
			self.melee_weapons.taser.stats.concealment = 29

		--Money money money--
		self.melee_weapons.moneybundle.speed_mult = 1.45
		self.melee_weapons.moneybundle.stats.min_damage = 2.4
		self.melee_weapons.moneybundle.stats.max_damage = 4.501
		self.melee_weapons.moneybundle.stats.min_damage_effect = 6.0
		self.melee_weapons.moneybundle.stats.max_damage_effect = 12.0
		self.melee_weapons.moneybundle.stats.charge_time = 0.8
		self.melee_weapons.moneybundle.stats.range = 150
		self.melee_weapons.moneybundle.stats.concealment = 30
			--For that you get the belt--
			--Fitting name, because if you actually like Duke you're a sap
			self.melee_weapons.sap.speed_mult = 1.45
			self.melee_weapons.sap.stats.min_damage = 2.4
			self.melee_weapons.sap.stats.max_damage = 4.501
			self.melee_weapons.sap.stats.min_damage_effect = 6.0
			self.melee_weapons.sap.stats.max_damage_effect = 12.0
			self.melee_weapons.sap.stats.charge_time = 0.8
			self.melee_weapons.sap.stats.range = 150
			self.melee_weapons.sap.stats.concealment = 30

		--Le Spatula--	
		self.melee_weapons.spatula.speed_mult = 1.3
		self.melee_weapons.spatula.stats.min_damage = 2.4
		self.melee_weapons.spatula.stats.max_damage = 4.501
		self.melee_weapons.spatula.stats.min_damage_effect = 6.0
		self.melee_weapons.spatula.stats.max_damage_effect = 12.0
		self.melee_weapons.spatula.stats.charge_time = 0.6
		self.melee_weapons.spatula.stats.range = 160
		self.melee_weapons.spatula.stats.concealment = 30
			--Ay, qué lindo carnaval--	
			self.melee_weapons.chac.speed_mult = 1.3
			self.melee_weapons.chac.stats.min_damage = 2.4
			self.melee_weapons.chac.stats.max_damage = 4.501
			self.melee_weapons.chac.stats.min_damage_effect = 6.0
			self.melee_weapons.chac.stats.max_damage_effect = 12.0
			self.melee_weapons.chac.stats.charge_time = 0.6
			self.melee_weapons.chac.stats.range = 160
			self.melee_weapons.chac.stats.concealment = 30

		--It's da hotline--
		self.melee_weapons.brick.special_weapon = "talk"
		self.melee_weapons.brick.stats.min_damage = 4.5
		self.melee_weapons.brick.stats.max_damage = 9.001
		self.melee_weapons.brick.stats.min_damage_effect = 6.0
		self.melee_weapons.brick.stats.max_damage_effect = 12.0
		self.melee_weapons.brick.stats.charge_time = 1.2
		self.melee_weapons.brick.stats.range = 160
		self.melee_weapons.brick.stats.concealment = 29
			--BOOP BOOP--
			self.melee_weapons.detector.stats.min_damage = 4.5
			self.melee_weapons.detector.stats.max_damage = 9.001
			self.melee_weapons.detector.stats.min_damage_effect = 6.0
			self.melee_weapons.detector.stats.max_damage_effect = 12.0
			self.melee_weapons.detector.stats.charge_time = 1.2
			self.melee_weapons.detector.stats.range = 160
			self.melee_weapons.detector.attack_allowed_expire_t = 0.1
			self.melee_weapons.detector.stats.concealment = 29
			--Cheers mate!--
			self.melee_weapons.whiskey.stats.min_damage = 4.5
			self.melee_weapons.whiskey.stats.max_damage = 9.001
			self.melee_weapons.whiskey.stats.min_damage_effect = 6.0
			self.melee_weapons.whiskey.stats.max_damage_effect = 12.0
			self.melee_weapons.whiskey.stats.charge_time = 1.1
			self.melee_weapons.whiskey.stats.range = 160
			self.melee_weapons.whiskey.stats.concealment = 29
		--It's a 1% chance to win the slots asshats keep an eye on the fucking BFD--
		self.melee_weapons.slot_lever.info_id = "bm_melee_slot_lever_info"
		self.melee_weapons.slot_lever.special_weapon = "hyper_crit"
		self.melee_weapons.slot_lever.stats.min_damage = 4.5
		self.melee_weapons.slot_lever.stats.max_damage = 9.001
		self.melee_weapons.slot_lever.stats.min_damage_effect = 6.0
		self.melee_weapons.slot_lever.stats.max_damage_effect = 12.0
		self.melee_weapons.slot_lever.stats.charge_time = 1.2
		self.melee_weapons.slot_lever.stats.range = 160
		self.melee_weapons.slot_lever.stats.concealment = 28

		--Selfies are probably one of the most obnoxious things to come with the new millennials--
		self.melee_weapons.selfie.stats.min_damage = 3
		self.melee_weapons.selfie.stats.max_damage = 6.001
		self.melee_weapons.selfie.stats.min_damage_effect = 6.0
		self.melee_weapons.selfie.stats.max_damage_effect = 12.0
		self.melee_weapons.selfie.stats.charge_time = 1.3
		self.melee_weapons.selfie.stats.range = 170
		self.melee_weapons.selfie.stats.concealment = 29
			--I don't even know what the fuck the swagger stick is supposed to be--
			self.melee_weapons.swagger.stats.min_damage = 3
			self.melee_weapons.swagger.stats.max_damage = 6.001
			self.melee_weapons.swagger.stats.min_damage_effect = 6.0
			self.melee_weapons.swagger.stats.max_damage_effect = 12.0
			self.melee_weapons.swagger.stats.charge_time = 1.3
			self.melee_weapons.swagger.stats.range = 170
			self.melee_weapons.swagger.stats.concealment = 29
			--The safeword is police brutality--
			self.melee_weapons.oldbaton.stats.min_damage = 3
			self.melee_weapons.oldbaton.stats.max_damage = 6.001
			self.melee_weapons.oldbaton.stats.min_damage_effect = 6.0
			self.melee_weapons.oldbaton.stats.max_damage_effect = 12.0
			self.melee_weapons.oldbaton.stats.charge_time = 1.3
			self.melee_weapons.oldbaton.stats.range = 170
			self.melee_weapons.oldbaton.stats.concealment = 29
			--HAHAHA EBIN CODE JOEK :DDDDDD--
			self.melee_weapons.happy.stats.min_damage = 3
			self.melee_weapons.happy.stats.max_damage = 6.001
			self.melee_weapons.happy.stats.min_damage_effect = 6.0
			self.melee_weapons.happy.stats.max_damage_effect = 12.0
			self.melee_weapons.happy.stats.charge_time = 1.3
			self.melee_weapons.happy.stats.range = 170
			self.melee_weapons.happy.stats.concealment = 29
			--STOP RESISTING ARRREST MOTHERFUCKER--
			self.melee_weapons.baton.stats.min_damage = 3
			self.melee_weapons.baton.stats.max_damage = 6.001
			self.melee_weapons.baton.stats.min_damage_effect = 6.0
			self.melee_weapons.baton.stats.max_damage_effect = 12.0
			self.melee_weapons.baton.stats.charge_time = 1.3
			self.melee_weapons.baton.stats.range = 170
			self.melee_weapons.baton.stats.concealment = 29
			--Another baton reskin, thanks Overkill--
			self.melee_weapons.croupier_rake.stats.min_damage = 3
			self.melee_weapons.croupier_rake.stats.max_damage = 6.001
			self.melee_weapons.croupier_rake.stats.min_damage_effect = 6.0
			self.melee_weapons.croupier_rake.stats.max_damage_effect = 12.0
			self.melee_weapons.croupier_rake.stats.charge_time = 1.3
			self.melee_weapons.croupier_rake.stats.range = 170
			self.melee_weapons.croupier_rake.stats.concealment = 29

		--shillelelelelelagh--	
		self.melee_weapons.shillelagh.stats.min_damage = 4.5
		self.melee_weapons.shillelagh.stats.max_damage = 9.001
		self.melee_weapons.shillelagh.stats.min_damage_effect = 9.0
		self.melee_weapons.shillelagh.stats.max_damage_effect = 18.0
		self.melee_weapons.shillelagh.stats.charge_time = 1.4
		self.melee_weapons.shillelagh.stats.range = 160
		self.melee_weapons.shillelagh.attack_allowed_expire_t = 0.1
		self.melee_weapons.shillelagh.stats.concealment = 28
			-- https://i.imgur.com/8IJSRPZ.jpg --
			self.melee_weapons.shock.stats.min_damage = 4.5
			self.melee_weapons.shock.stats.max_damage = 9.001
			self.melee_weapons.shock.stats.min_damage_effect = 9.0
			self.melee_weapons.shock.stats.max_damage_effect = 18.0
			self.melee_weapons.shock.stats.charge_time = 1.4
			self.melee_weapons.shock.stats.range = 160
			self.melee_weapons.shock.attack_allowed_expire_t = 0.1
			self.melee_weapons.shock.stats.concealment = 28
			--Hammer Hammer Toilet Slammer--
			self.melee_weapons.hammer.stats.min_damage = 4.5
			self.melee_weapons.hammer.stats.max_damage = 9.001
			self.melee_weapons.hammer.stats.min_damage_effect = 9.0
			self.melee_weapons.hammer.stats.max_damage_effect = 18.0
			self.melee_weapons.hammer.stats.charge_time = 1.4
			self.melee_weapons.hammer.stats.range = 160
			self.melee_weapons.hammer.stats.concealment = 28
			--Tenderizing meat is my fetish--	
			self.melee_weapons.tenderizer.stats.min_damage = 4.5
			self.melee_weapons.tenderizer.stats.max_damage = 9.001
			self.melee_weapons.tenderizer.stats.min_damage_effect = 9.0
			self.melee_weapons.tenderizer.stats.max_damage_effect = 18.0
			self.melee_weapons.tenderizer.stats.charge_time = 1.4
			self.melee_weapons.tenderizer.stats.range = 160
			self.melee_weapons.tenderizer.stats.concealment = 28

		--I'M GOIN'TA LIQUIFY YA!--
		self.melee_weapons.model24.info_id = "bm_melee_erica_info"
		self.melee_weapons.model24.special_weapon = "caber"
		self.melee_weapons.model24.explosion_chance = 0.05
		self.melee_weapons.model24.explosion_curve_pow = 0.5
		self.melee_weapons.model24.explosion_damage = 60
		self.melee_weapons.model24.explosion_range = 500
		self.melee_weapons.model24.speed_mult = 1.18
		self.melee_weapons.model24.stats.max_damage = 9.001
		self.melee_weapons.model24.stats.min_damage = 4.5
		self.melee_weapons.model24.stats.min_damage_effect = 9.0
		self.melee_weapons.model24.stats.max_damage_effect = 18.0
		self.melee_weapons.model24.stats.charge_time = 1.8
		self.melee_weapons.model24.stats.range = 170
		self.melee_weapons.model24.stats.concealment = 26

		--Who's up for rockin the mic?--	
		self.melee_weapons.microphone.special_weapon = "talk"
		self.melee_weapons.microphone.speed_mult = 1.18
		self.melee_weapons.microphone.stats.min_damage = 2.4
		self.melee_weapons.microphone.stats.max_damage = 4.501
		self.melee_weapons.microphone.stats.min_damage_effect = 6.0
		self.melee_weapons.microphone.stats.max_damage_effect = 12.0
		self.melee_weapons.microphone.stats.charge_time = 0.6
		self.melee_weapons.microphone.stats.range = 160
		self.melee_weapons.microphone.stats.concealment = 30

		--Angry Shovel Noises--
		self.melee_weapons.shovel.stats.min_damage = 4.5
		self.melee_weapons.shovel.stats.max_damage = 9.001
		self.melee_weapons.shovel.stats.min_damage_effect = 9.0
		self.melee_weapons.shovel.stats.max_damage_effect = 18.0
		self.melee_weapons.shovel.stats.charge_time = 1.8
		self.melee_weapons.shovel.stats.range = 180
		self.melee_weapons.shovel.attack_allowed_expire_t = 0.1
		self.melee_weapons.shovel.stats.concealment = 27
		--Slutshaming--	
		self.melee_weapons.branding_iron.stats.min_damage = 4.5
		self.melee_weapons.branding_iron.stats.max_damage = 9.001
		self.melee_weapons.branding_iron.stats.min_damage_effect = 9.0
		self.melee_weapons.branding_iron.stats.max_damage_effect = 18.0
		self.melee_weapons.branding_iron.stats.charge_time = 1.8
		self.melee_weapons.branding_iron.stats.range = 180
		self.melee_weapons.branding_iron.stats.concealment = 27
		--YEAH YEAH YEAH YEAH--
		self.melee_weapons.road.stats.min_damage = 4.5
		self.melee_weapons.road.stats.max_damage = 9.001
		self.melee_weapons.road.stats.min_damage_effect = 9.0
		self.melee_weapons.road.stats.max_damage_effect = 18.0
		self.melee_weapons.road.stats.charge_time = 1.8
		self.melee_weapons.road.stats.range = 180
		self.melee_weapons.road.stats.concealment = 27

		--Mic stand--
		self.melee_weapons.micstand.speed_mult = 1.3
		self.melee_weapons.micstand.stats.min_damage = 4.5
		self.melee_weapons.micstand.stats.max_damage = 6.001
		self.melee_weapons.micstand.stats.min_damage_effect = 6.0
		self.melee_weapons.micstand.stats.max_damage_effect = 12.0
		self.melee_weapons.micstand.stats.charge_time = 2
		self.melee_weapons.micstand.stats.range = 200
		self.melee_weapons.micstand.stats.concealment = 27
			--We'll put you in the hospital for free eh?--
			self.melee_weapons.hockey.stats.min_damage = 4.5
			self.melee_weapons.hockey.stats.max_damage = 6.001
			self.melee_weapons.hockey.stats.min_damage_effect = 6.0
			self.melee_weapons.hockey.stats.max_damage_effect = 12.0
			self.melee_weapons.hockey.stats.charge_time = 2
			self.melee_weapons.hockey.stats.range = 200
			self.melee_weapons.hockey.stats.concealment = 27
			--Binary Ruler--
			self.melee_weapons.meter.anim_attack_charged_vars = nil
			self.melee_weapons.meter.stats.min_damage = 4.5
			self.melee_weapons.meter.stats.max_damage = 6.001
			self.melee_weapons.meter.stats.min_damage_effect = 6.0
			self.melee_weapons.meter.stats.max_damage_effect = 12.0
			self.melee_weapons.meter.stats.charge_time = 2
			self.melee_weapons.meter.stats.range = 200
			self.melee_weapons.meter.stats.concealment = 27

		--Payday DLC? Nah it's a walking dead game you cunts.--
		self.melee_weapons.barbedwire.type = "axe"
		self.melee_weapons.barbedwire.dot_data_name = "melee_bleed"
		self.melee_weapons.barbedwire.info_id = "bm_melee_barbedwire_info"
		self.melee_weapons.barbedwire.stats.min_damage = 6
		self.melee_weapons.barbedwire.stats.max_damage = 12.001
		self.melee_weapons.barbedwire.stats.min_damage_effect = 6.0
		self.melee_weapons.barbedwire.stats.max_damage_effect = 12.0
		self.melee_weapons.barbedwire.stats.charge_time = 2.4
		self.melee_weapons.barbedwire.stats.range = 200
		self.melee_weapons.barbedwire.stats.concealment = 25
		--I get it, it's the hotline--
		self.melee_weapons.baseballbat.stats.min_damage = 6
		self.melee_weapons.baseballbat.stats.max_damage = 12.001
		self.melee_weapons.baseballbat.stats.min_damage_effect = 9.0
		self.melee_weapons.baseballbat.stats.max_damage_effect = 18.0
		self.melee_weapons.baseballbat.stats.charge_time = 2.3
		self.melee_weapons.baseballbat.stats.range = 200
		self.melee_weapons.baseballbat.stats.concealment = 26
			--Shephard's cane--
			self.melee_weapons.stick.type = "axe"
			self.melee_weapons.stick.stats.min_damage = 6
			self.melee_weapons.stick.stats.max_damage = 12.001
			self.melee_weapons.stick.stats.min_damage_effect = 9.0
			self.melee_weapons.stick.stats.max_damage_effect = 18.0
			self.melee_weapons.stick.stats.charge_time = 2.3
			self.melee_weapons.stick.stats.range = 200
			self.melee_weapons.stick.stats.concealment = 26

		--BIRE xddddddd--
		self.melee_weapons.spoon_gold.type = "axe"
		self.melee_weapons.spoon_gold.dot_data_name = "melee_spoon_gold"
		self.melee_weapons.spoon_gold.info_id = "bm_melee_spoon_gold_info"
		self.melee_weapons.spoon_gold.stats.min_damage = 6
		self.melee_weapons.spoon_gold.stats.max_damage = 12.001
		self.melee_weapons.spoon_gold.stats.min_damage_effect = 6.0
		self.melee_weapons.spoon_gold.stats.max_damage_effect = 12.0
		self.melee_weapons.spoon_gold.stats.charge_time = 2.5
		self.melee_weapons.spoon_gold.stats.range = 210
		self.melee_weapons.spoon_gold.stats.concealment = 24
		--B-Oink
		if self.melee_weapons.piggy_hammer then
			self.melee_weapons.piggy_hammer.info_id = "bm_melee_piggy_hammer_info"
			self.melee_weapons.piggy_hammer.speed_mult = 1.15
			self.melee_weapons.piggy_hammer.stats.min_damage = 4.5
			self.melee_weapons.piggy_hammer.stats.max_damage = 12.001
			self.melee_weapons.piggy_hammer.stats.min_damage_effect = 6.0
			self.melee_weapons.piggy_hammer.stats.max_damage_effect = 24.0
			self.melee_weapons.piggy_hammer.stats.special_damage_multiplier = 2
			self.melee_weapons.piggy_hammer.stats.charge_time = 2.5
			self.melee_weapons.piggy_hammer.stats.range = 200
			self.melee_weapons.piggy_hammer.stats.concealment = 23
			self.melee_weapons.piggy_hammer.random_special_effects = {
				{
					weight = 75,
					--do nothing lmao
				},
				{
					weight = 12,
					dot_data_name = "melee_bleed"
				},
				{
					weight = 7,
					tase_data = {
						tase_strength = "light"
					}
				},
				{
					weight = 5,
					dot_data_name = "melee_piggy_hammer"
				},
				{
					weight = 1,
					instant_kill = true
				}
			}
		end
		--It has a crowbar we can't use--
		self.melee_weapons.dingdong.stats.min_damage = 6
		self.melee_weapons.dingdong.stats.max_damage = 12.001
		self.melee_weapons.dingdong.stats.min_damage_effect = 9.0
		self.melee_weapons.dingdong.stats.max_damage_effect = 24.0
		self.melee_weapons.dingdong.stats.charge_time = 2.5
		self.melee_weapons.dingdong.stats.range = 210
		self.melee_weapons.dingdong.stats.concealment = 24
			--Ayy Hammer--
			self.melee_weapons.alien_maul.type = "axe"
			self.melee_weapons.alien_maul.stats.min_damage = 6
			self.melee_weapons.alien_maul.stats.max_damage = 12.001
			self.melee_weapons.alien_maul.stats.min_damage_effect = 9.0
			self.melee_weapons.alien_maul.stats.max_damage_effect = 24.0
			self.melee_weapons.alien_maul.stats.charge_time = 2.5
			self.melee_weapons.alien_maul.stats.range = 210
			self.melee_weapons.alien_maul.stats.concealment = 24
			--WHAT IB WE JUZ USED A SPUUUN :DDDDD--
			self.melee_weapons.spoon.stats.min_damage = 6
			self.melee_weapons.spoon.stats.max_damage = 12.001
			self.melee_weapons.spoon.stats.min_damage_effect = 9.0
			self.melee_weapons.spoon.stats.max_damage_effect = 24.0
			self.melee_weapons.spoon.stats.charge_time = 2.5
			self.melee_weapons.spoon.stats.range = 210
			self.melee_weapons.spoon.stats.concealment = 24
		--we postal now--
		self.melee_weapons.cutters.stats.min_damage = 6
		self.melee_weapons.cutters.stats.max_damage = 12.001
		self.melee_weapons.cutters.stats.min_damage_effect = 6.0
		self.melee_weapons.cutters.stats.max_damage_effect = 24.0
		self.melee_weapons.cutters.stats.charge_time = 2.5
		self.melee_weapons.cutters.stats.range = 170
		self.melee_weapons.cutters.stats.concealment = 26

		--I'm a little annoyed that we can't actually use it like a shield--
		--NOW WE CAN--
		self.melee_weapons.buck.info_id = "bm_melee_buck_info"	
		self.melee_weapons.buck.stats.min_damage = 3
		self.melee_weapons.buck.stats.max_damage = 6.001
		self.melee_weapons.buck.stats.min_damage_effect = 6.0
		self.melee_weapons.buck.stats.max_damage_effect = 12.0
		self.melee_weapons.buck.stats.charge_time = 1.5
		self.melee_weapons.buck.stats.range = 165
		self.melee_weapons.buck.stats.concealment = 28
		self.melee_weapons.buck.block = 0.9
		self.melee_weapons.buck.sphere_cast_radius_add = 8
			--The target is a briefcase. Discretion is of the essence.--
			self.melee_weapons.briefcase.info_id = "bm_melee_briefcase_info"	
			self.melee_weapons.briefcase.stats.min_damage = 2.4
			self.melee_weapons.briefcase.stats.max_damage = 4.501
			self.melee_weapons.briefcase.stats.min_damage_effect = 6.0
			self.melee_weapons.briefcase.stats.max_damage_effect = 12.0
			self.melee_weapons.briefcase.stats.charge_time = 1.5
			self.melee_weapons.briefcase.stats.range = 155
			self.melee_weapons.briefcase.stats.concealment = 29
			self.melee_weapons.briefcase.block = 0.9




	--[[     SHARP     ]]
	
		--Basically just a really short knife--	
		self.melee_weapons.tiger.info_id = "bm_melee_specialist_info"
		self.melee_weapons.tiger.special_weapon = "repeat_hitter"
		self.melee_weapons.tiger.stats.min_damage = 3
		self.melee_weapons.tiger.stats.max_damage = 6.001
		self.melee_weapons.tiger.stats.min_damage_effect = 4.0
		self.melee_weapons.tiger.stats.max_damage_effect = 8.0
		self.melee_weapons.tiger.stats.charge_time = 0.65
		self.melee_weapons.tiger.stats.range = 150
		self.melee_weapons.tiger.stats.concealment = 30
		--Not one but TWO pokers--
		self.melee_weapons.push.info_id = "bm_melee_specialist_info"
		self.melee_weapons.push.special_weapon = "repeat_hitter"
		self.melee_weapons.push.stats.min_damage = 4.5
		self.melee_weapons.push.stats.max_damage = 9.001
		self.melee_weapons.push.stats.min_damage_effect = 1.0
		self.melee_weapons.push.stats.max_damage_effect = 2.0
		self.melee_weapons.push.stats.charge_time = 1.05
		self.melee_weapons.push.stats.range = 160
		self.melee_weapons.push.stats.concealment = 29
		--A ballistic knife we can't even fire--
		self.melee_weapons.ballistic.info_id = "bm_melee_specialist_info"
		self.melee_weapons.ballistic.special_weapon = "repeat_hitter"
		self.melee_weapons.ballistic.sounds.equip = "knife_equip"
		self.melee_weapons.ballistic.sounds.hit_air = "knife_hit_air"
		self.melee_weapons.ballistic.sounds.hit_gen = "knife_hit_gen"
		self.melee_weapons.ballistic.sounds.hit_body = "knife_hit_body"
		self.melee_weapons.ballistic.sounds.charge = "knife_charge"
		self.melee_weapons.ballistic.stats.min_damage = 4.5
		self.melee_weapons.ballistic.stats.max_damage = 9.001
		self.melee_weapons.ballistic.stats.min_damage_effect = 1.0
		self.melee_weapons.ballistic.stats.max_damage_effect = 2.0
		self.melee_weapons.ballistic.stats.charge_time = 1.05
		self.melee_weapons.ballistic.stats.range = 160
		self.melee_weapons.ballistic.stats.concealment = 29
		--Unlike Sonic I don't chuckle
		self.melee_weapons.grip.info_id = "bm_melee_specialist_info"
		self.melee_weapons.grip.special_weapon = "repeat_hitter"
		self.melee_weapons.grip.stats.min_damage = 4.5
		self.melee_weapons.grip.stats.max_damage = 9.001
		self.melee_weapons.grip.stats.min_damage_effect = 1.0
		self.melee_weapons.grip.stats.max_damage_effect = 2.0
		self.melee_weapons.grip.stats.charge_time = 1.05
		self.melee_weapons.grip.stats.range = 160
		self.melee_weapons.grip.stats.concealment = 29
		--Can't fight nature jack--	
		self.melee_weapons.twins.stats.min_damage = 4.5
		self.melee_weapons.twins.stats.max_damage = 9.001
		self.melee_weapons.twins.stats.min_damage_effect = 3.0
		self.melee_weapons.twins.stats.max_damage_effect = 6.0
		self.melee_weapons.twins.stats.charge_time = 1.15
		self.melee_weapons.twins.stats.range = 170
		self.melee_weapons.twins.stats.concealment = 29


		--memed hard enough into the game--
		self.melee_weapons.sword.stats.min_damage = 3
		self.melee_weapons.sword.stats.max_damage = 6.001
		self.melee_weapons.sword.stats.min_damage_effect = 0.6
		self.melee_weapons.sword.stats.max_damage_effect = 1.2
		self.melee_weapons.sword.stats.charge_time = 0.25
		self.melee_weapons.sword.stats.range = 150
		self.melee_weapons.sword.stats.concealment = 30
			--That's a big ass toothbrush--
			self.melee_weapons.toothbrush.stats.min_damage = 3
			self.melee_weapons.toothbrush.stats.max_damage = 6.001
			self.melee_weapons.toothbrush.stats.min_damage_effect = 0.6
			self.melee_weapons.toothbrush.stats.max_damage_effect = 1.2
			self.melee_weapons.toothbrush.stats.charge_time = 0.25
			self.melee_weapons.toothbrush.stats.range = 150
			self.melee_weapons.toothbrush.stats.concealment = 30
		--This looks like a boxcutter too, but whatever--
		self.melee_weapons.gerber.stats.min_damage = 4.5
		self.melee_weapons.gerber.stats.max_damage = 9.001
		self.melee_weapons.gerber.stats.min_damage_effect = 0.6
		self.melee_weapons.gerber.stats.max_damage_effect = 1.2
		self.melee_weapons.gerber.stats.charge_time = 0.9
		self.melee_weapons.gerber.stats.range = 155
		self.melee_weapons.gerber.stats.concealment = 30
			--Scout Knife--
			self.melee_weapons.scoutknife.stats.min_damage = 4.5
			self.melee_weapons.scoutknife.stats.max_damage = 9.001
			self.melee_weapons.scoutknife.stats.min_damage_effect = 0.6
			self.melee_weapons.scoutknife.stats.max_damage_effect = 1.2
			self.melee_weapons.scoutknife.stats.charge_time = 0.9
			self.melee_weapons.scoutknife.stats.range = 155
			self.melee_weapons.scoutknife.stats.concealment = 30
		
		--REMEMBER THE BASICS OF--
		self.melee_weapons.cqc.dot_data_name = "melee_cqc"
		self.melee_weapons.cqc.stats.min_damage = 1.2
		self.melee_weapons.cqc.stats.max_damage = 2.401
		self.melee_weapons.cqc.stats.min_damage_effect = 0.5
		self.melee_weapons.cqc.stats.max_damage_effect = 1.0
		self.melee_weapons.cqc.stats.charge_time = 0.25
		self.melee_weapons.cqc.stats.range = 150
		self.melee_weapons.cqc.stats.concealment = 30
			--LET'S GO PRACTICE MEDICINE--
			self.melee_weapons.fear.dot_data_name = "melee_fear"
			self.melee_weapons.fear.stats.min_damage = 1.2
			self.melee_weapons.fear.stats.max_damage = 2.401
			self.melee_weapons.fear.stats.min_damage_effect = 0.5
			self.melee_weapons.fear.stats.max_damage_effect = 1.0
			self.melee_weapons.fear.stats.charge_time = 0.25
			self.melee_weapons.fear.stats.range = 150
			self.melee_weapons.fear.stats.concealment = 30
			self.melee_weapons.fear.info_id = "bm_melee_cqc_info"

		--you got blood on my suit--
		self.melee_weapons.wing.info_id = "bm_melee_wing_info"	
		self.melee_weapons.wing.stats.min_damage = 2.4
		self.melee_weapons.wing.stats.max_damage = 4.501
		self.melee_weapons.wing.stats.min_damage_effect = 0.5
		self.melee_weapons.wing.stats.max_damage_effect = 1.0
		self.melee_weapons.wing.stats.charge_time = 0.75
		self.melee_weapons.wing.stats.range = 160
		self.melee_weapons.wing.stats.concealment = 30
		self.melee_weapons.wing.backstab_damage_multiplier = 4
		--About time--
		self.melee_weapons.chef.info_id = "bm_melee_chef_info"
		self.melee_weapons.chef.stats.min_damage = 0.65
		self.melee_weapons.chef.stats.max_damage = 33.3
		self.melee_weapons.chef.stats.min_damage_effect = 1.0
		self.melee_weapons.chef.stats.max_damage_effect = 2.0
		self.melee_weapons.chef.stats.charge_time = 7
		self.melee_weapons.chef.stats.range = 160
		self.melee_weapons.chef.stats.concealment = 29
		self.melee_weapons.chef.special_weapon = "panic"
		--I wonder how many people caught that this is a Shawn the Sheep reference--
		self.melee_weapons.shawn.stats.min_damage = 4.5
		self.melee_weapons.shawn.stats.max_damage = 9.001
		self.melee_weapons.shawn.stats.min_damage_effect = 0.5
		self.melee_weapons.shawn.stats.max_damage_effect = 1.0
		self.melee_weapons.shawn.stats.charge_time = 0.7
		self.melee_weapons.shawn.stats.range = 150
		self.melee_weapons.shawn.stats.concealment = 29

		--MotherFUCKER--	
		self.melee_weapons.fork.stats.min_damage = 2.0
		self.melee_weapons.fork.stats.max_damage = 6.001
		self.melee_weapons.fork.stats.min_damage_effect = 0.5
		self.melee_weapons.fork.stats.max_damage_effect = 1.0
		self.melee_weapons.fork.stats.charge_time = 0.75
		self.melee_weapons.fork.stats.range = 170
		self.melee_weapons.fork.stats.concealment = 30

		--Affix bayonets guardsmen, be ready for blood!--
		self.melee_weapons.bayonet.stats.min_damage = 3
		self.melee_weapons.bayonet.stats.max_damage = 6.001
		self.melee_weapons.bayonet.stats.min_damage_effect = 0.6
		self.melee_weapons.bayonet.stats.max_damage_effect = 1.2
		self.melee_weapons.bayonet.stats.charge_time = 0.4
		self.melee_weapons.bayonet.stats.range = 155
		self.melee_weapons.bayonet.stats.concealment = 29
			--Even more pokey knives--
			self.melee_weapons.pugio.stats.min_damage = 3
			self.melee_weapons.pugio.stats.max_damage = 6.001
			self.melee_weapons.pugio.stats.min_damage_effect = 0.6
			self.melee_weapons.pugio.stats.max_damage_effect = 1.2
			self.melee_weapons.pugio.stats.charge_time = 0.4
			self.melee_weapons.pugio.stats.range = 155
			self.melee_weapons.pugio.stats.concealment = 29

		--Trench Knife use to be the Fugitive meta--
		self.melee_weapons.fairbair.stats.min_damage = 3
		self.melee_weapons.fairbair.stats.max_damage = 6.001
		self.melee_weapons.fairbair.stats.min_damage_effect = 0.6
		self.melee_weapons.fairbair.stats.max_damage_effect = 1.2
		self.melee_weapons.fairbair.stats.charge_time = 0.6
		self.melee_weapons.fairbair.stats.range = 165
		self.melee_weapons.fairbair.stats.concealment = 29

		--I'm really annoyed that we don't actually poke with it--
		--We do now :^)
		self.melee_weapons.poker.align_objects = {"a_weapon_right"}
		self.melee_weapons.poker.anim_attack_vars = {"var1"}
		self.melee_weapons.poker.anim_attack_charged_vars = {"var2"}
		self.melee_weapons.poker.speed_mult = 0.8
		self.melee_weapons.poker.stats.min_damage = 6
		self.melee_weapons.poker.stats.max_damage = 12.001
		self.melee_weapons.poker.stats.min_damage_effect = 1.0
		self.melee_weapons.poker.stats.max_damage_effect = 2.0
		self.melee_weapons.poker.stats.charge_time = 1.5
		self.melee_weapons.poker.stats.range = 180
		self.melee_weapons.poker.stats.concealment = 28

		--Clowns to the left of me, jokers to the right--
		self.melee_weapons.clean.dot_data_name = "melee_bleed"
		self.melee_weapons.clean.info_id = "bm_melee_clean_info"
		self.melee_weapons.clean.stats.weapon_type = "sharp"
		self.melee_weapons.clean.stats.min_damage = 3
		self.melee_weapons.clean.stats.max_damage = 3
		self.melee_weapons.clean.stats.min_damage_effect = 0.6
		self.melee_weapons.clean.stats.max_damage_effect = 0.6
		self.melee_weapons.clean.stats.charge_time = 0.00001
		self.melee_weapons.clean.stats.range = 150
		self.melee_weapons.clean.stats.concealment = 30
		self.melee_weapons.clean.no_hit_shaker = true
		self.melee_weapons.clean.melee_charge_shaker = ""
		--Nyeh hey there's the high roller--
		self.melee_weapons.switchblade.info_id = "bm_melee_switchblade_info"	
		self.melee_weapons.switchblade.stats.min_damage = 3
		self.melee_weapons.switchblade.stats.max_damage = 6.001
		self.melee_weapons.switchblade.stats.min_damage_effect = 0.5
		self.melee_weapons.switchblade.stats.max_damage_effect = 1.0
		self.melee_weapons.switchblade.stats.charge_time = 0.6
		self.melee_weapons.switchblade.stats.range = 155
		self.melee_weapons.switchblade.stats.concealment = 30
		self.melee_weapons.switchblade.backstab_damage_multiplier = 2
		--Nevada--
		--This is a fucking boxcutter, seriously these things can barely cut through cardboard and we're supposed to kill cops with it?--
		self.melee_weapons.boxcutter.stats.weapon_type = "sharp"
		self.melee_weapons.boxcutter.stats.min_damage = 3
		self.melee_weapons.boxcutter.stats.max_damage = 6.001
		self.melee_weapons.boxcutter.stats.min_damage_effect = 0.5
		self.melee_weapons.boxcutter.stats.max_damage_effect = 1.0
		self.melee_weapons.boxcutter.stats.charge_time = 0.35
		self.melee_weapons.boxcutter.stats.range = 150
		self.melee_weapons.boxcutter.stats.concealment = 30
		--Tacticool Knife--
		self.melee_weapons.x46.stats.min_damage = 4.5
		self.melee_weapons.x46.stats.max_damage = 9.001
		self.melee_weapons.x46.stats.min_damage_effect = 1.5
		self.melee_weapons.x46.stats.max_damage_effect = 3.0
		self.melee_weapons.x46.stats.charge_time = 0.9
		self.melee_weapons.x46.stats.range = 175
		self.melee_weapons.x46.stats.concealment = 29
			--German Steel--
			self.melee_weapons.kampfmesser.stats.min_damage = 4.5
			self.melee_weapons.kampfmesser.stats.max_damage = 9.001
			self.melee_weapons.kampfmesser.stats.min_damage_effect = 1.5
			self.melee_weapons.kampfmesser.stats.max_damage_effect = 3.0
			self.melee_weapons.kampfmesser.stats.charge_time = 0.9
			self.melee_weapons.kampfmesser.stats.range = 175
			self.melee_weapons.kampfmesser.stats.concealment = 29

		--and anotha tanto--
		self.melee_weapons.hauteur.stats.min_damage = 4.0
		self.melee_weapons.hauteur.stats.max_damage = 9.001
		self.melee_weapons.hauteur.stats.min_damage_effect = 1.0
		self.melee_weapons.hauteur.stats.max_damage_effect = 2.0
		self.melee_weapons.hauteur.stats.charge_time = 0.8
		self.melee_weapons.hauteur.stats.range = 160
		self.melee_weapons.hauteur.stats.concealment = 30
		--OG Kabar Knife--
		self.melee_weapons.kabar.stats.min_damage = 4.5
		self.melee_weapons.kabar.stats.max_damage = 9.001
		self.melee_weapons.kabar.stats.min_damage_effect = 1.2
		self.melee_weapons.kabar.stats.max_damage_effect = 2.4
		self.melee_weapons.kabar.stats.charge_time = 0.9
		self.melee_weapons.kabar.stats.range = 160
		self.melee_weapons.kabar.stats.concealment = 29
			--ONE Knife--
			self.melee_weapons.kabartanto.stats.min_damage = 4.5
			self.melee_weapons.kabartanto.stats.max_damage = 9.001
			self.melee_weapons.kabartanto.stats.min_damage_effect = 1.2
			self.melee_weapons.kabartanto.stats.max_damage_effect = 2.4
			self.melee_weapons.kabartanto.stats.charge_time = 0.9
			self.melee_weapons.kabartanto.stats.range = 160
			self.melee_weapons.kabartanto.stats.concealment = 29
		--Now THIS is a knife.--
		self.melee_weapons.rambo.stats.min_damage = 6
		self.melee_weapons.rambo.stats.max_damage = 12.001
		self.melee_weapons.rambo.stats.min_damage_effect = 1.5
		self.melee_weapons.rambo.stats.max_damage_effect = 3.0
		self.melee_weapons.rambo.stats.charge_time = 1.1
		self.melee_weapons.rambo.stats.range = 165
		self.melee_weapons.rambo.stats.concealment = 28
		--I'm david bowie--	
		self.melee_weapons.bowie.stats.min_damage = 6
		self.melee_weapons.bowie.stats.max_damage = 12.001
		self.melee_weapons.bowie.stats.min_damage_effect = 1.5
		self.melee_weapons.bowie.stats.max_damage_effect = 3.0
		self.melee_weapons.bowie.stats.charge_time = 1.1
		self.melee_weapons.bowie.stats.range = 165
		self.melee_weapons.bowie.stats.concealment = 28
	
		--Its' another god damn machete--
		self.melee_weapons.becker.stats.min_damage = 4.5
		self.melee_weapons.becker.stats.max_damage = 9.001
		self.melee_weapons.becker.stats.min_damage_effect = 1.8
		self.melee_weapons.becker.stats.max_damage_effect = 3.6
		self.melee_weapons.becker.stats.charge_time = 0.9
		self.melee_weapons.becker.stats.range = 170
		self.melee_weapons.becker.stats.concealment = 29
			--another machete--
			self.melee_weapons.oxide.stats.min_damage = 4.5
			self.melee_weapons.oxide.stats.max_damage = 9.001
			self.melee_weapons.oxide.stats.min_damage_effect = 1.8
			self.melee_weapons.oxide.stats.max_damage_effect = 3.6
			self.melee_weapons.oxide.stats.charge_time = 0.9
			self.melee_weapons.oxide.stats.range = 170
			self.melee_weapons.oxide.stats.concealment = 29
		--More Gore--
		self.melee_weapons.gator.stats.min_damage = 6
		self.melee_weapons.gator.stats.max_damage = 12.001
		self.melee_weapons.gator.stats.min_damage_effect = 2.4
		self.melee_weapons.gator.stats.max_damage_effect = 4.5
		self.melee_weapons.gator.stats.charge_time = 1.35
		self.melee_weapons.gator.stats.range = 180
		self.melee_weapons.gator.stats.concealment = 28
			--Because we didn't have enough fucking machetes--
			self.melee_weapons.machete.stats.min_damage = 6
			self.melee_weapons.machete.stats.max_damage = 12.001
			self.melee_weapons.machete.stats.min_damage_effect = 2.4
			self.melee_weapons.machete.stats.max_damage_effect = 4.5
			self.melee_weapons.machete.stats.charge_time = 1.35
			self.melee_weapons.machete.stats.range = 180
			self.melee_weapons.machete.stats.concealment = 28
		--asdf--
		self.melee_weapons.agave.stats.min_damage = 6
		self.melee_weapons.agave.stats.max_damage = 12.001
		self.melee_weapons.agave.stats.min_damage_effect = 2.4
		self.melee_weapons.agave.stats.max_damage_effect = 4.5
		self.melee_weapons.agave.stats.charge_time = 1.45
		self.melee_weapons.agave.stats.range = 195
		self.melee_weapons.agave.attack_allowed_expire_t = 0.1
		self.melee_weapons.agave.stats.concealment = 27
	
		--Dragan's Meat...Cleaver--
		self.melee_weapons.meat_cleaver.info_id = "bm_melee_cleaver_info"
		self.melee_weapons.meat_cleaver.stats.min_damage = 6
		self.melee_weapons.meat_cleaver.stats.max_damage = 12.001
		self.melee_weapons.meat_cleaver.stats.min_damage_effect = 1.8
		self.melee_weapons.meat_cleaver.stats.max_damage_effect = 3.6
		self.melee_weapons.meat_cleaver.stats.charge_time = 0.8
		self.melee_weapons.meat_cleaver.stats.range = 160
		self.melee_weapons.meat_cleaver.stats.concealment = 29
		self.melee_weapons.meat_cleaver.headshot_damage_multiplier = 0.5
			--Throwing knives when?--
			self.melee_weapons.cleaver.info_id = "bm_melee_cleaver_info"
			self.melee_weapons.cleaver.stats.min_damage = 6
			self.melee_weapons.cleaver.stats.max_damage = 12.001
			self.melee_weapons.cleaver.stats.min_damage_effect = 1.8
			self.melee_weapons.cleaver.stats.max_damage_effect = 3.6
			self.melee_weapons.cleaver.stats.charge_time = 0.8
			self.melee_weapons.cleaver.stats.range = 160
			self.melee_weapons.cleaver.stats.concealment = 29
			self.melee_weapons.cleaver.headshot_damage_multiplier = 0.5
		--It's a hatchet--
		self.melee_weapons.bullseye.stats.min_damage = 6
		self.melee_weapons.bullseye.stats.max_damage = 12.001
		self.melee_weapons.bullseye.stats.min_damage_effect = 2.0
		self.melee_weapons.bullseye.stats.max_damage_effect = 4.0
		self.melee_weapons.bullseye.stats.charge_time = 1.3
		self.melee_weapons.bullseye.stats.range = 170
		self.melee_weapons.bullseye.stats.concealment = 28
		--Just like the injuns--
		self.melee_weapons.tomahawk.stats.min_damage = 6
		self.melee_weapons.tomahawk.stats.max_damage = 12.001
		self.melee_weapons.tomahawk.stats.min_damage_effect = 3.0
		self.melee_weapons.tomahawk.stats.max_damage_effect = 6.0
		self.melee_weapons.tomahawk.stats.charge_time = 1.45
		self.melee_weapons.tomahawk.stats.range = 175
		self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
		self.melee_weapons.tomahawk.stats.concealment = 27
			--another injun tomahawk	
			self.melee_weapons.scalper.stats.min_damage = 6
			self.melee_weapons.scalper.stats.max_damage = 12.001
			self.melee_weapons.scalper.stats.min_damage_effect = 3.0
			self.melee_weapons.scalper.stats.max_damage_effect = 6.0
			self.melee_weapons.scalper.stats.charge_time = 1.45
			self.melee_weapons.scalper.stats.range = 175
			self.melee_weapons.scalper.attack_allowed_expire_t = 0.1
			self.melee_weapons.scalper.stats.concealment = 27
		--Reminds me of how HL2 was gonna have an ice axe--
		self.melee_weapons.iceaxe.info_id = "bm_melee_iceaxe_info"
		self.melee_weapons.iceaxe.speed_mult = 0.95
		self.melee_weapons.iceaxe.anim_attack_vars = {"var1"}
		self.melee_weapons.iceaxe.make_decal = true
		self.melee_weapons.iceaxe.make_effect = true
		self.melee_weapons.iceaxe.stats.min_damage = 6
		self.melee_weapons.iceaxe.stats.max_damage = 12.001
		self.melee_weapons.iceaxe.stats.min_damage_effect = 1.5
		self.melee_weapons.iceaxe.stats.max_damage_effect = 3.0
		self.melee_weapons.iceaxe.stats.charge_time = 1.55
		self.melee_weapons.iceaxe.stats.range = 180
		self.melee_weapons.iceaxe.stats.concealment = 28
		self.melee_weapons.iceaxe.headshot_damage_multiplier = 1.5
		--Whose plumes are gay now Carl? Whose plumes are gay now?--
		self.melee_weapons.morning.stats.min_damage = 6
		self.melee_weapons.morning.stats.max_damage = 12.001
		self.melee_weapons.morning.stats.min_damage_effect = 4.5
		self.melee_weapons.morning.stats.max_damage_effect = 12.0
		self.melee_weapons.morning.stats.charge_time = 1.8
		self.melee_weapons.morning.stats.range = 180
		self.melee_weapons.morning.stats.concealment = 25

		--FREEEEEEEDOM--
		self.melee_weapons.freedom.info_id = "bm_melee_freedom_info"
		self.melee_weapons.freedom.anim_attack_vars = {"var1","var2","var4"}
		self.melee_weapons.freedom.anim_attack_charged_vars = {"var3"} --This however, is not blunt and very capable of stabbing :^)
		self.melee_weapons.freedom.speed_mult = 0.85
		self.melee_weapons.freedom.stats.min_damage = 6
		self.melee_weapons.freedom.stats.max_damage = 12.001
		self.melee_weapons.freedom.stats.min_damage_effect = 4.5
		self.melee_weapons.freedom.stats.max_damage_effect = 9.0
		self.melee_weapons.freedom.stats.charge_time = 2.2
		self.melee_weapons.freedom.stats.range = 220
		self.melee_weapons.freedom.stats.charge_bonus_start = 0.9
		self.melee_weapons.freedom.stats.charge_bonus_range = 50
		self.melee_weapons.freedom.stats.concealment = 25
		--Pitchfork--
		self.melee_weapons.pitchfork.info_id = "bm_melee_pitch_info" 
		self.melee_weapons.pitchfork.special_weapon = "charger"
		self.melee_weapons.pitchfork.chainsaw = {
			tick_damage = 4.5,
			tick_delay = 0.4,
			start_delay = 0.8
		}
		self.melee_weapons.pitchfork.stats.min_damage = 6
		self.melee_weapons.pitchfork.stats.max_damage = 12.001
		self.melee_weapons.pitchfork.stats.min_damage_effect = 3.0
		self.melee_weapons.pitchfork.stats.max_damage_effect = 9.0
		self.melee_weapons.pitchfork.stats.charge_time = 2.1
		self.melee_weapons.pitchfork.stats.range = 175
		self.melee_weapons.pitchfork.stats.concealment = 25
		--Manly Miner Men--
		self.melee_weapons.mining_pick.info_id = "bm_melee_mining_pick_info"
		self.melee_weapons.mining_pick.make_decal = true
		self.melee_weapons.mining_pick.make_effect = true
		self.melee_weapons.mining_pick.stats.min_damage = 6
		self.melee_weapons.mining_pick.stats.max_damage = 12.001
		self.melee_weapons.mining_pick.stats.min_damage_effect = 3.0
		self.melee_weapons.mining_pick.stats.max_damage_effect = 6.0
		self.melee_weapons.mining_pick.stats.charge_time = 1.8
		self.melee_weapons.mining_pick.stats.range = 180
		self.melee_weapons.mining_pick.stats.concealment = 26
		self.melee_weapons.mining_pick.headshot_damage_multiplier = 1.5
		--Fear the beard--	
		self.melee_weapons.beardy.stats.min_damage = 9
		self.melee_weapons.beardy.stats.max_damage = 18.001
		self.melee_weapons.beardy.stats.min_damage_effect = 3.0
		self.melee_weapons.beardy.stats.max_damage_effect = 9.0
		self.melee_weapons.beardy.stats.charge_time = 2.1
		self.melee_weapons.beardy.stats.range = 220
		self.melee_weapons.beardy.stats.concealment = 25
		--For the longest time the Fireaxe was the most satisfying melee weapon to use, seriously sucks they killed its swing animation--
		self.melee_weapons.fireaxe.stats.min_damage = 9
		self.melee_weapons.fireaxe.stats.max_damage = 18.001
		self.melee_weapons.fireaxe.stats.min_damage_effect = 3.0
		self.melee_weapons.fireaxe.stats.max_damage_effect = 9.0
		self.melee_weapons.fireaxe.stats.charge_time = 1.9
		self.melee_weapons.fireaxe.stats.range = 200
		self.melee_weapons.fireaxe.stats.concealment = 26

		--YOOOOOOOOOOOOOOOOOOOOOOOOOOO--
		self.melee_weapons.sandsteel.info_id = "bm_melee_katana_info"	
		self.melee_weapons.sandsteel.stats.min_damage = 6
		self.melee_weapons.sandsteel.stats.max_damage = 12.001
		self.melee_weapons.sandsteel.stats.min_damage_effect = 1.5
		self.melee_weapons.sandsteel.stats.max_damage_effect = 4.5
		self.melee_weapons.sandsteel.stats.charge_time = 1.7
		self.melee_weapons.sandsteel.stats.charge_bonus_start = 0.9
		self.melee_weapons.sandsteel.stats.charge_bonus_speed = 1.75
		self.melee_weapons.sandsteel.stats.range = 190
		self.melee_weapons.sandsteel.attack_allowed_expire_t = 0.1
		self.melee_weapons.sandsteel.stats.concealment = 26
		--C/C quality master race--
		self.melee_weapons.great.info_id = "bm_melee_great_info"
		self.melee_weapons.great.stats.min_damage = 9
		self.melee_weapons.great.stats.max_damage = 18.001
		self.melee_weapons.great.stats.min_damage_effect = 2.4
		self.melee_weapons.great.stats.max_damage_effect = 6.0
		self.melee_weapons.great.stats.charge_time = 2.1
		self.melee_weapons.great.stats.range = 200
		self.melee_weapons.great.stats.charge_bonus_start = 0.9
		self.melee_weapons.great.stats.charge_bonus_range = 50
		self.melee_weapons.great.stats.concealment = 26
	
		--Fires actual nails when--
		self.melee_weapons.nin.info_id = "bm_melee_nin_info" 
		self.melee_weapons.nin.stats.min_damage = 6
		self.melee_weapons.nin.stats.max_damage = 6
		self.melee_weapons.nin.stats.min_damage_effect = 1.8
		self.melee_weapons.nin.stats.max_damage_effect = 1.8
		self.melee_weapons.nin.stats.charge_time = 0.00001
		self.melee_weapons.nin.stats.range = 500
		self.melee_weapons.nin.stats.concealment = 26
		self.melee_weapons.nin.melee_charge_shaker = ""
		self.melee_weapons.nin.no_hit_shaker = true
	
		--Chainsaw + Gun--
		self.melee_weapons.cs.info_id = "bm_melee_cs_info"
		self.melee_weapons.cs.make_saw = true
		self.melee_weapons.cs.chainsaw = {
			tick_damage = 3,
			tick_delay = 0.25,
			start_delay = 0.8
		}
		self.melee_weapons.cs.stats.min_damage = 9
		self.melee_weapons.cs.stats.max_damage = 9
		self.melee_weapons.cs.stats.min_damage_effect = 3.0
		self.melee_weapons.cs.stats.max_damage_effect = 3.0
		self.melee_weapons.cs.stats.charge_time = 0.00001
		self.melee_weapons.cs.stats.range = 180
		self.melee_weapons.cs.stats.concealment = 23
		--how does this spin when it has a handle--
		self.melee_weapons.ostry.info_id = "bm_melee_ostry_info"
		self.melee_weapons.ostry.melee_charge_shaker = ""
		self.melee_weapons.ostry.chainsaw = {
			tick_damage = 1.8,
			tick_delay = 0.18,
			start_delay = 0.8
		}
		self.melee_weapons.ostry.stats.min_damage = 6
		self.melee_weapons.ostry.stats.max_damage = 6
		self.melee_weapons.ostry.stats.min_damage_effect = 1.2
		self.melee_weapons.ostry.stats.max_damage_effect = 1.2
		self.melee_weapons.ostry.stats.charge_time = 0.00001
		self.melee_weapons.ostry.stats.range = 155
		self.melee_weapons.ostry.stats.concealment = 27
	
		--Pooper scooper--
		self.melee_weapons.catch.stats.min_damage = 6
		self.melee_weapons.catch.stats.max_damage = 12.001
		self.melee_weapons.catch.stats.min_damage_effect = 4.5
		self.melee_weapons.catch.stats.max_damage_effect = 9.0
		self.melee_weapons.catch.stats.charge_time = 1.25
		self.melee_weapons.catch.stats.range = 160
		self.melee_weapons.catch.stats.concealment = 28
	
	-- Workaround for custom melee bug
	--[[
	self.melee_weapons.halloween_sword = deep_clone(self.melee_weapons.great)
	self.melee_weapons.halloween_sword.name_id = "bm_melee_halloween_sword"
	self.melee_weapons.halloween_sword.info_id = "bm_melee_headless_sword_info"
	self.melee_weapons.halloween_sword.special_weapon = "panic"
	self.melee_weapons.halloween_sword.unit = "units/mods/weapons/wpn_mel_halloween_sword/wpn_fps_mel_halloween_sword"
	self.melee_weapons.halloween_sword.third_unit = "units/mods/weapons/wpn_mel_halloween_sword/wpn_third_halloween_sword"
	self.melee_weapons.halloween_sword.texture_bundle_folder = "mods"
	self.melee_weapons.halloween_sword.sounds = {
		equip = "great_equip",
		hit_air = "morning_hit_air",
		hit_gen = "great_hit_gen",
		hit_body = "great_hit_body",
		charge = "great_charge"
	}
	self.melee_weapons.halloween_sword.dlc = "rest"
	self.melee_weapons.halloween_sword.stats.concealment = 24
	self.melee_weapons.halloween_sword.stats.charge_time = 5
	self.melee_weapons.halloween_sword.free = true
	self.melee_weapons.halloween_sword.stats.custom = true
	]]--

end

Hooks:PostHook(BlackMarketTweakData, "init", "CustomMelee", function(self, tweak_data)	

	for melee_id, i in pairs (self.melee_weapons) do
		if self.melee_weapons[melee_id] and self.melee_weapons[melee_id].custom and self.melee_weapons[melee_id].based_on then
			self.melee_weapons[melee_id].stats = deep_clone(self.melee_weapons[self.melee_weapons[melee_id].based_on].stats)
		end
	end

	if self.melee_weapons.halloween_sword then
		self.melee_weapons.halloween_sword.stats.min_damage_effect = 4.5
		self.melee_weapons.halloween_sword.stats.max_damage_effect = 9.0
	end

	local melee_anim = {}
	
	--melee_sandsteel
	melee_anim = {
		'hfblade','murasama','pkat','therkatana'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_sandsteel"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].timing_fix = {"var3"}
			self.melee_weapons[melee_id].timing_fix_speed_mult = 0.75
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 0.9
			self.melee_weapons[melee_id].repeat_expire_t = 0.75
			self.melee_weapons[melee_id].melee_damage_delay = 0.215
			self.melee_weapons[melee_id].anim_speed_mult = 1
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = 12
		end
	end	

	melee_anim = {
		'invincible','psick','pclub'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_blunt"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2"}
			self.melee_weapons[melee_id].expire_t = 1.05
			self.melee_weapons[melee_id].repeat_expire_t = 0.8
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 1
			self.melee_weapons[melee_id].sphere_cast_radius_add = 8
		end
	end

	melee_anim = {
		'pspear'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_pitchfork"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
			self.melee_weapons[melee_id].expire_t = 0.8
			self.melee_weapons[melee_id].repeat_expire_t = 0.675
			self.melee_weapons[melee_id].melee_damage_delay = 0.325
			self.melee_weapons[melee_id].anim_speed_mult = 0.95
		end
	end

	melee_anim = {
		'dragon_slayer','peld','Binary_Blade'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_great"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"}
			self.melee_weapons[melee_id].anim_attack_left_vars = {"var1"}
			self.melee_weapons[melee_id].anim_attack_right_vars = {"var2"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.20
			self.melee_weapons[melee_id].melee_damage_delay = 0.6
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = 16
		end
	end

	melee_anim = {
		'pbaxe'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_beardy"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var3"}
			self.melee_weapons[melee_id].expire_t = 1.45
			self.melee_weapons[melee_id].repeat_expire_t = 1.2
			self.melee_weapons[melee_id].melee_damage_delay = 0.65
			self.melee_weapons[melee_id].anim_speed_mult = 1.2631
			self.melee_weapons[melee_id].sphere_cast_radius_add = 16
		end
	end

	melee_anim = {
		'melee_g36'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_nin_res"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1"}
			self.melee_weapons[melee_id].expire_t = 1.0
			self.melee_weapons[melee_id].repeat_expire_t = 0.65
			self.melee_weapons[melee_id].can_melee_miss = true
			self.melee_weapons[melee_id].miss_repeat_expire_t = 0.005
			self.melee_weapons[melee_id].miss_expire_t = 0.45
			self.melee_weapons[melee_id].miss_anim_speed_mult = nil
			self.melee_weapons[melee_id].melee_damage_delay = 0.015
			self.melee_weapons[melee_id].anim_speed_mult = 0.8
			self.melee_weapons[melee_id].sphere_cast_radius_add = -10
			self.melee_weapons[melee_id].melee_charge_shaker = ""
			self.melee_weapons[melee_id].no_hit_shaker = true
			self.melee_weapons[melee_id].sounds.hit_air = ""
			self.melee_weapons[melee_id].sounds.charge = ""
			self.melee_weapons[melee_id].make_effect = true
			self.melee_weapons[melee_id].make_decal = true 
		end
	end


	melee_anim = {
		'revenant_heirloom'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "revenant_heirloom"
			self.melee_weapons[melee_id].anim_attack_vars = {"var3"}
			self.melee_weapons[melee_id].anim_attack_charged_start = 0.25
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var1","var2","var4","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_left_vars = {"var1"}
			self.melee_weapons[melee_id].anim_attack_charged_right_vars = {"var2"}
			self.melee_weapons[melee_id].expire_t = 0.65
			self.melee_weapons[melee_id].repeat_expire_t = 0.5
			self.melee_weapons[melee_id].melee_damage_delay = 0.1
			self.melee_weapons[melee_id].anim_speed_mult = 0.625
			self.melee_weapons[melee_id].sphere_cast_radius_add = nil
			self.melee_weapons[melee_id].sphere_cast_radius_add_h = nil
			self.melee_weapons[melee_id].sphere_cast_radius_add_charged_h = 12
			self.melee_weapons[melee_id].make_effect = true
			self.melee_weapons[melee_id].make_decal = nil
		end
	end


	melee_anim = {
		'predator_wristblades'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
			self.melee_weapons[melee_id].anim_global_param = "melee_tiger"
			self.melee_weapons[melee_id].align_objects = {"a_weapon_left","a_weapon_right"}
			self.melee_weapons[melee_id].anim_attack_vars = {"var1","var4"}
			self.melee_weapons[melee_id].anim_attack_charged_vars = {"var3"} --Perform uppercut for charged melee attacks
			self.melee_weapons[melee_id].expire_t = 0.75
			self.melee_weapons[melee_id].repeat_expire_t = 0.55
			self.melee_weapons[melee_id].melee_damage_delay = 0.15
		end
	end

	--melee_knife
	melee_anim = {
		'toyknife'
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
		self.melee_weapons[melee_id].anim_global_param = "melee_knife"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_left"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1", "var3", "var4"}
		self.melee_weapons[melee_id].expire_t = 1.1
		self.melee_weapons[melee_id].repeat_expire_t = 0.8
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
		self.melee_weapons[melee_id].anim_speed_mult = 1.2307
		end
	end	
	--melee_stab
	melee_anim = {
		"tridagger"
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
		self.melee_weapons[melee_id].anim_global_param = "melee_stab"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].expire_t = 0.825
		self.melee_weapons[melee_id].repeat_expire_t = 0.5
		self.melee_weapons[melee_id].melee_damage_delay = 0.1
		self.melee_weapons[melee_id].anim_speed_mult = 1.2
		end
	end
	--melee_baseballbat
	melee_anim = {
		"megumins_staff"
	}
	for i, melee_id in ipairs(melee_anim) do
		if self.melee_weapons[melee_id] then
		self.melee_weapons[melee_id].anim_global_param = "melee_baseballbat"
		self.melee_weapons[melee_id].align_objects = {"a_weapon_right"}
		self.melee_weapons[melee_id].anim_attack_vars = {"var1","var2","var4"} --No more stabbing with blunt objects
		self.melee_weapons[melee_id].expire_t = 1.025
		self.melee_weapons[melee_id].repeat_expire_t = 0.9
		self.melee_weapons[melee_id].melee_damage_delay = 0.275
		self.melee_weapons[melee_id].anim_speed_mult = 0.9473
		self.melee_weapons[melee_id].sphere_cast_radius_add = 12
		end
	end

	if self.melee_weapons.megumins_staff then --Hoppip's Megumin Staff
		self.melee_weapons.megumins_staff.stats = deep_clone(self.melee_weapons.stick.stats)
		self.melee_weapons.megumins_staff.stats.charge_bonus_start = 0.99
		self.melee_weapons.megumins_staff.stats.charge_bonus_range = 2800
		self.melee_weapons.megumins_staff.stats.concealment = 22
		self.melee_weapons.megumins_staff.stats.charge_time = 55
		self.melee_weapons.megumins_staff.ignore_charge_speed = true
		self.melee_weapons.megumins_staff.special_weapon = "megumin"
		self.melee_weapons.megumins_staff.explosion_range = 2000
		self.melee_weapons.megumins_staff.explosion_damage = 5000
		self.melee_weapons.megumins_staff.sphere_cast_radius_add = nil
	end

	if self.melee_weapons.tridagger then --NotSoIrish's Jagdkommando Tri-Dagger
		self.melee_weapons.tridagger.stats = deep_clone(self.melee_weapons.gerber.stats)
		self.melee_weapons.tridagger.stats.charge_time = 1.2
		self.melee_weapons.tridagger.stats.concealment = 27
		self.melee_weapons.tridagger.stats.range = 160
		self.melee_weapons.tridagger.dot_data_name = "melee_bleed"
		self.melee_weapons.tridagger.info_id = "bm_melee_bleed_info"
		self.melee_weapons.tridagger.sounds.equip = "knife_equip"
		self.melee_weapons.tridagger.sounds.hit_air = "knife_hit_air"
		self.melee_weapons.tridagger.sounds.hit_gen = "knife_hit_gen"
		self.melee_weapons.tridagger.sounds.hit_body = "knife_hit_body"
		self.melee_weapons.tridagger.sounds.charge = "knife_charge"
		self.melee_weapons.tridagger.anim_speed_mult = 1
	end

	if self.melee_weapons.toyknife then
		self.melee_weapons.toyknife.anim_attack_vars = {"var1","var2"} --Removes the awkward blunt side strike attack variants
		self.melee_weapons.toyknife.stats.min_damage = 0.5
		self.melee_weapons.toyknife.stats.max_damage = 1.0
		self.melee_weapons.toyknife.stats.min_damage_effect = 0.3
		self.melee_weapons.toyknife.stats.max_damage_effect = 0.6
	end

	if self.melee_weapons.therkatana then --Hybrids' Cyberpunk 2077 Thermal Katana
		self.melee_weapons.therkatana.info_id = "bm_melee_2077tkata_info"	
		self.melee_weapons.therkatana.stats = deep_clone(self.melee_weapons.sandsteel.stats)
		self.melee_weapons.therkatana.stats.min_damage = 6
		self.melee_weapons.therkatana.stats.max_damage = 9.001
		self.melee_weapons.therkatana.stats.min_damage_effect = 1.2
		self.melee_weapons.therkatana.stats.max_damage_effect = 2.4
		self.melee_weapons.therkatana.stats.charge_time = 1.5
		self.melee_weapons.therkatana.stats.charge_bonus_start = 0.9
		self.melee_weapons.therkatana.stats.charge_bonus_speed = nil
		self.melee_weapons.therkatana.stats.charge_bonus_fire = true
		self.melee_weapons.therkatana.stats.range = 180
		self.melee_weapons.therkatana.dot_data_name = "melee_therkatana"
	end

	if self.melee_weapons.hfblade then --Rikerus's HF Blade (Katana 1.8x speed, 1/2 damage)
		self.melee_weapons.hfblade.info_id = "bm_melee_raiden_info"	
		self.melee_weapons.hfblade.stats = deep_clone(self.melee_weapons.sandsteel.stats)
		self.melee_weapons.hfblade.stats.min_damage = self.melee_weapons.hfblade.stats.min_damage / 2
		self.melee_weapons.hfblade.stats.max_damage = self.melee_weapons.hfblade.stats.max_damage / 2
		self.melee_weapons.hfblade.anim_speed_mult = self.melee_weapons.hfblade.anim_speed_mult * 1.85
	end

	if self.melee_weapons.murasama then --Rikerus's HF Murasama (Katana 1.8x speed, 1/2 damage)
		self.melee_weapons.murasama.info_id = "bm_melee_thejobissnotyours_info"	
		self.melee_weapons.murasama.stats = deep_clone(self.melee_weapons.sandsteel.stats)
		self.melee_weapons.murasama.stats.min_damage = self.melee_weapons.murasama.stats.min_damage / 2
		self.melee_weapons.murasama.stats.max_damage = self.melee_weapons.murasama.stats.max_damage / 2
		self.melee_weapons.murasama.anim_speed_mult = self.melee_weapons.murasama.anim_speed_mult * 1.85
	end

	if self.melee_weapons.invincible then --Rikerus's Pincer Blades (Lucille Bat)
		self.melee_weapons.invincible.info_id = "bm_melee_inner_child_info"
		self.melee_weapons.invincible.stats = deep_clone(self.melee_weapons.barbedwire.stats)
		self.melee_weapons.invincible.dot_data_name = "melee_bleed"
		self.melee_weapons.invincible.anim_speed_mult = 0.8695
	end

	if self.melee_weapons.dragon_slayer then --Silent Enforcer's Dragon Slayer (Halloween Dozer Sword)
		self.melee_weapons.dragon_slayer.info_id = "bm_melee_goat_info"
		self.melee_weapons.dragon_slayer.special_weapon = "panic"
		self.melee_weapons.dragon_slayer.stats = deep_clone(self.melee_weapons.halloween_sword.stats)
		self.melee_weapons.dragon_slayer.sounds = deep_clone(self.melee_weapons.halloween_sword.sounds)
		self.melee_weapons.dragon_slayer.sounds.hit_body = "cash_loot_drop_reveal"
		self.melee_weapons.dragon_slayer.sounds.hit_gen = "cash_loot_drop_reveal"
	end

	if self.melee_weapons.Binary_Blade then --Kalidor's Binary Blade (Greatsword)
		self.melee_weapons.Binary_Blade.stats = deep_clone(self.melee_weapons.great.stats)
		self.melee_weapons.Binary_Blade.info_id = "bm_melee_jebus_info"
	end

	if self.melee_weapons.peld then --Predator Pack Elder Sword (Greatsword)
		self.melee_weapons.peld.stats = deep_clone(self.melee_weapons.great.stats)
	end

	if self.melee_weapons.pbaxe then --Predator Pack Axe (Bearded Axe)
		self.melee_weapons.pbaxe.stats = deep_clone(self.melee_weapons.beardy.stats)
	end

	if self.melee_weapons.pdutchknife then --Predator Pack Axe (Tanto)
		self.melee_weapons.pdutchknife.stats = deep_clone(self.melee_weapons.kabartanto.stats)
		self.melee_weapons.pdutchknife.dot_data = nil
	end
	if self.melee_weapons.pspear then --Predator Pack CombiStick (Pitchfork)
		self.melee_weapons.pspear.info_id = "bm_melee_charge_info" 
		self.melee_weapons.pspear.special_weapon = "charger"
		self.melee_weapons.pspear.chainsaw = {
			tick_damage = 4.5,
			tick_delay = 0.4,
			start_delay = 0.8
		}
		self.melee_weapons.pspear.stats = deep_clone(self.melee_weapons.pitchfork.stats)
	end

	if self.melee_weapons.pkat then --Predator Pack Katana (Golden Spoon)
		self.melee_weapons.pkat.info_id = "bm_melee_fire_info"	
		self.melee_weapons.pkat.dot_data_name = "melee_spoon_gold"
		self.melee_weapons.pkat.stats = deep_clone(self.melee_weapons.spoon_gold.stats)
		self.melee_weapons.pkat.anim_speed_mult = 0.75
	end

	if self.melee_weapons.pclub then --Predator Pack War Club (Icepick)
		self.melee_weapons.pclub.anim_attack_vars = {"var1"}
		self.melee_weapons.pclub.make_decal = true
		self.melee_weapons.pclub.make_effect = true
		self.melee_weapons.pclub.info_id = "bm_melee_iceaxe_info"
		self.melee_weapons.pclub.stats = deep_clone(self.melee_weapons.iceaxe.stats)
		self.melee_weapons.pclub.headshot_damage_multiplier = 1.5
	end

	if self.melee_weapons.psick then --Predator Pack Alpha Sickle (Morning Star)
		self.melee_weapons.psick.stats = deep_clone(self.melee_weapons.morning.stats)
		self.melee_weapons.psick.dot_data = nil
	end
	
	if self.melee_weapons.predator_wristblades then --Predator Pack Wristblades (Lucille Bat)
		self.melee_weapons.predator_wristblades.info_id = "bm_melee_bleed_info"
		self.melee_weapons.predator_wristblades.dot_data_name = "melee_bleed"
		self.melee_weapons.predator_wristblades.stats = deep_clone(self.melee_weapons.barbedwire.stats)
		self.melee_weapons.predator_wristblades.anim_speed_mult = 0.6
	end

	if self.melee_weapons.revenant_heirloom then --PlayBONK, Masavik and Ommfe's Revenant Heirloom Scythe
		self.melee_weapons.revenant_heirloom.info_id = "bm_melee_revenant_heirloom_info"
		self.melee_weapons.revenant_heirloom.stats.min_damage = 6
		self.melee_weapons.revenant_heirloom.stats.max_damage = 18.001
		self.melee_weapons.revenant_heirloom.stats.min_damage_effect = 2.4
		self.melee_weapons.revenant_heirloom.stats.max_damage_effect = 6.0
		self.melee_weapons.revenant_heirloom.stats.charge_time = 2
		self.melee_weapons.revenant_heirloom.stats.range = 200
		self.melee_weapons.revenant_heirloom.stats.concealment = 24
		self.melee_weapons.revenant_heirloom.stats.charge_bonus_start = 0.25
		self.melee_weapons.revenant_heirloom.stats.charge_bonus_range = 0
		self.melee_weapons.revenant_heirloom.headshot_damage_multiplier = nil
	end

	if self.melee_weapons.melee_g36 then --Zdann's G36 (Nailgun but with the G36's max damage profile + range)
		self.melee_weapons.melee_g36.info_id = "bm_melee_thebestweapon_info"	
		self.melee_weapons.melee_g36.hit_pre_calculation = true
		self.melee_weapons.melee_g36.stats = deep_clone(self.melee_weapons.nin.stats)
		self.melee_weapons.melee_g36.stats.min_damage = 2
		self.melee_weapons.melee_g36.stats.max_damage = 2
		self.melee_weapons.melee_g36.stats.range = 2800
		self.melee_weapons.melee_g36.sounds = deep_clone(self.melee_weapons.nin.sounds)
		self.melee_weapons.melee_g36.sounds.hit_body = "g36_fire_single"
		self.melee_weapons.melee_g36.sounds.hit_gen = "g36_fire_single"
		self.melee_weapons.melee_g36.sounds.hit_air = "primary_dryfire"
	end

	if self.melee_weapons.zd_poke then --Zdann's Poke of Death
		self.melee_weapons.zd_poke.anim_attack_vars = {"var1"}
		self.melee_weapons.zd_poke.info_id = ""
		self.melee_weapons.zd_poke.expire_t = 33.4
		self.melee_weapons.zd_poke.repeat_expire_t = 29.5
		self.melee_weapons.zd_poke.melee_damage_delay = 28.3
		self.melee_weapons.zd_poke.stats.min_damage = 10000
		self.melee_weapons.zd_poke.stats.max_damage = 30000
		self.melee_weapons.zd_poke.stats.min_damage_effect = 10000
		self.melee_weapons.zd_poke.stats.max_damage_effect = 30000
		self.melee_weapons.zd_poke.stats.charge_time = 3
		self.melee_weapons.zd_poke.stats.range = 200
		self.melee_weapons.zd_poke.stats.concealment = 30
	end



	local blanket_speed_mult = 1.1
	for melee_id, _ in pairs(self.melee_weapons) do
		if self.melee_weapons[melee_id] then
			if not self.melee_weapons[melee_id].instant then
				self.melee_weapons[melee_id].anim_speed_mult = (self.melee_weapons[melee_id].anim_speed_mult or 1) * blanket_speed_mult
			end
			if not self.melee_weapons[melee_id].melee_charge_shaker or self.melee_weapons[melee_id].melee_charge_shaker == "player_melee_charge_fist" then
				self.melee_weapons[melee_id].melee_charge_shaker = "player_melee_charge_wing"
			end
			if self.melee_weapons[melee_id].stats then
				self.melee_weapons[melee_id].stats.min_damage_effect = self.melee_weapons[melee_id].stats.min_damage_effect / self.melee_weapons[melee_id].stats.min_damage
				self.melee_weapons[melee_id].stats.max_damage_effect = self.melee_weapons[melee_id].stats.max_damage_effect / self.melee_weapons[melee_id].stats.max_damage
			end
		end
	end

end)