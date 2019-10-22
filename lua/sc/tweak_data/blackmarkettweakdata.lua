if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--This is a helmet, not a mask--
	local old_masks = BlackMarketTweakData._init_masks
	function BlackMarketTweakData:_init_masks(tweak_data)
		old_masks(self, tweak_data)
		
		--Shatter
		self.masks.shatter_true = {
			unit = "units/mods/masks/msk_shatter_true/msk_shatter_true",
			name_id = "bm_msk_shatter_true",
			desc_id = "bm_msk_shatter_true_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		
		
		--Hockey Hell
		self.masks.canada = {
			unit = "units/pd2_mod_sharks/masks/msk_hockey_sc/msk_hockey_sc",
			name_id = "bm_msk_canada",
			desc_id = "bm_msk_canada_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}

		--Mrs. Graffiti
		self.masks.jsr = {
			unit = "units/pd2_mod_sharks/masks/msk_rubber_female_sc/msk_rubber_female_sc",
			name_id = "bm_msk_jsr",
			desc_id = "bm_msk_jsr_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		
		
		--Mr. Graffiti
		self.masks.jsrf = {
			unit = "units/pd2_mod_sharks/masks/msk_rubber_male_sc/msk_rubber_male_sc",
			name_id = "bm_msk_jsrf",
			desc_id = "bm_msk_jsrf_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}

		--The Lootbag
		self.masks.courier_stash = {
			unit = "units/pd2_mod_sharks/masks/msk_zipper_sc/msk_zipper_sc",
			name_id = "bm_msk_courier_stash",
			desc_id = "bm_msk_courier_stash_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		
		
		--Beta Female Mask
		self.masks.female_mask = {
			unit = "units/pd2_mod_beta/msk_female_mask/msk_female_mask",
			name_id = "bm_msk_female_mask",
			desc_id = "bm_msk_female_mask_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Female Blood Mask
		self.masks.female_mask_blood = {
			unit = "units/pd2_mod_beta/msk_female_mask_blood/msk_female_mask_blood",
			name_id = "bm_msk_female_mask_blood",
			desc_id = "bm_msk_female_mask_blood_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Female Clown Mask
		self.masks.female_mask_clown = {
			unit = "units/pd2_mod_beta/msk_female_mask_clown/msk_female_mask_clown",
			name_id = "bm_msk_female_mask_clown",
			desc_id = "bm_msk_female_mask_clown_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Male Mask
		self.masks.male_mask = {
			unit = "units/pd2_mod_beta/msk_male_mask/msk_male_mask",
			name_id = "bm_msk_male_mask",
			desc_id = "bm_msk_male_mask_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Male Blood Mask
		self.masks.male_mask_blood = {
			unit = "units/pd2_mod_beta/msk_male_mask_blood/msk_male_mask_blood",
			name_id = "bm_msk_male_mask_blood",
			desc_id = "bm_msk_male_mask_blood_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Male Clown Mask
		self.masks.male_mask_clown = {
			unit = "units/pd2_mod_beta/msk_male_mask_clown/msk_male_mask_clown",
			name_id = "bm_msk_male_mask_clown",
			desc_id = "bm_msk_male_mask_clown_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Twister Mask
		self.masks.twister_mask = {
			unit = "units/pd2_mod_beta/msk_twister/msk_twister",
			name_id = "bm_msk_twister_mask",
			desc_id = "bm_msk_twister_mask_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}		

		--Beta Voodoo Mask
		self.masks.voodoo_mask = {
			unit = "units/pd2_mod_beta/msk_voodoo/msk_voodoo",
			name_id = "bm_msk_voodoo_mask",
			desc_id = "bm_msk_voodoo_mask_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}	
		
		--Unused F1 Mask
		self.masks.f1 = {
			unit = "units/pd2_dlc_cage/masks/f1/msk_f1_mask",
			name_id = "bm_msk_f1",
			desc_id = "bm_msk_f1_desc",
			pcs = {},
			type = "helmet",
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}

		--PS3 Sweet Tooth Mask
		self.masks.sweettooth = {
			unit = "units/pd2_mod_beta/msk_sweettooth/msk_sweettooth",
			name_id = "bm_msk_sweettooth",
			desc_id = "bm_msk_sweettooth_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}	
		
		--Stonecold Wolf
		self.masks.wolf_stone = {
			unit = "units/mods/masks/msk_wolf_stone/msk_wolf_stone",
			name_id = "bm_msk_wolf_stone",
			desc_id = "bm_msk_wolf_stone_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}	
		
		--Aged Dallas
		self.masks.dallas_aged = {
			unit = "units/mods/masks/msk_dallas_aged/msk_dallas_aged",
			name_id = "bm_msk_dallas_aged",
			desc_id = "bm_msk_dallas_aged_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Aged Chains
		self.masks.chains_aged = {
			unit = "units/mods/masks/msk_chains_aged/msk_chains_aged",
			name_id = "bm_msk_chains_aged",
			desc_id = "bm_msk_chains_aged_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Aged Hoxton
		self.masks.hoxton_aged = {
			unit = "units/mods/masks/msk_hoxton_aged/msk_hoxton_aged",
			name_id = "bm_msk_hoxton_aged",
			desc_id = "bm_msk_hoxton_aged_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Aged Wolf
		self.masks.wolf_aged = {
			unit = "units/mods/masks/msk_wolf_aged/msk_wolf_aged",
			name_id = "bm_msk_wolf_aged",
			desc_id = "bm_msk_wolf_aged_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Beeef Dallas
		self.masks.beef_dallas = {
			unit = "units/pd2_mod_fucking_masks/msk_beef_dallas/msk_beef_dallas",
			name_id = "bm_msk_beef_dallas",
			desc_id = "bm_msk_beef_dallas_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Beeef Chains
		self.masks.beef_chains = {
			unit = "units/pd2_mod_fucking_masks/msk_beef_chains/msk_beef_chains",
			name_id = "bm_msk_beef_chains",
			desc_id = "bm_msk_beef_chains_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Beeef Hoxton
		self.masks.beef_hoxton = {
			unit = "units/pd2_mod_fucking_masks/msk_beef_hoxton/msk_beef_hoxton",
			name_id = "bm_msk_beef_hoxton",
			desc_id = "bm_msk_beef_hoxton_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Beeef Wolf
		self.masks.beef_wolf = {
			unit = "units/pd2_mod_fucking_masks/msk_beef_wolf/msk_beef_wolf",
			name_id = "bm_msk_beef_wolf",
			desc_id = "bm_msk_beef_wolf_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Vyse Dallas
		self.masks.vyse_dallas = {
			unit = "units/pd2_mod_fucking_masks/msk_vyse_dallas/msk_vyse_dallas",
			name_id = "bm_msk_vyse_dallas",
			desc_id = "bm_msk_vyse_dallas_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Vyse Chains
		self.masks.vyse_chains = {
			unit = "units/pd2_mod_fucking_masks/msk_vyse_chains/msk_vyse_chains",
			name_id = "bm_msk_vyse_chains",
			desc_id = "bm_msk_vyse_chains_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Vyse Hoxton
		self.masks.vyse_hoxton = {
			unit = "units/pd2_mod_fucking_masks/msk_vyse_hoxton/msk_vyse_hoxton",
			name_id = "bm_msk_vyse_hoxton",
			desc_id = "bm_msk_vyse_hoxton_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Vyse Wolf
		self.masks.vyse_wolf = {
			unit = "units/pd2_mod_fucking_masks/msk_vyse_wolf/msk_vyse_wolf",
			name_id = "bm_msk_vyse_wolf",
			desc_id = "bm_msk_vyse_wolf_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
		
		--Secret Hoxton Reborn
		self.masks.secret_old_hoxton = {
			unit = "units/pd2_mod_fucking_masks/msk_hoxton_secret_reborn/msk_hoxton_secret_reborn",
			name_id = "bm_msk_secret_old_hoxton",
			desc_id = "bm_msk_secret_old_hoxton_desc",
			pcs = {},
			value = 0,
			global_value = "rest",
			texture_bundle_folder = "mods"
		}
	end
	
	--we all know alligator skin's the best material right--
	local old_mat = BlackMarketTweakData._init_materials
	function BlackMarketTweakData:_init_materials(tweak_data)
		old_mat(self, tweak_data)
		
		self.materials.jkl_matt01 = {
			name_id = "material_jkl_matt01_title",
			pcs = {},
			texture = "units/pd2_mod_jack/matcaps/jkl_matt01",
			material_amount = 0,
			value = 0,
			dlc = "rest"
		}
		self.materials.jkl_matt02 = {
			name_id = "material_jkl_matt02_title",
			pcs = {},
			texture = "units/pd2_mod_jack/matcaps/jkl_matt02",
			value = 0,
			dlc = "rest"
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
			dlc = "rest"
		}

		self.textures.jkl_patt02 = {
			name_id = "pattern_jkl_patt02_title",
			pcs = {},
			texture = "patterns/jkl_patt02",
			value = 0,
			dlc = "rest"
		}			
				
	end		

end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

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
	self.projectiles.smoke_screen_grenade.base_cooldown = 30
	self.projectiles.damage_control.base_cooldown = 30
	self.projectiles.concussion.max_amount = 3
	
	self.projectiles.pocket_ecm_jammer.max_amount = 1
	self.projectiles.pocket_ecm_jammer.base_cooldown = 80
	
	--Fuck off
	self.projectiles.frag.no_cheat_count = true
	self.projectiles.concussion.no_cheat_count = true
	self.projectiles.molotov.no_cheat_count = true
	self.projectiles.wpn_prj_four.no_cheat_count = true
	self.projectiles.wpn_prj_ace.no_cheat_count = true
	self.projectiles.wpn_prj_jav.no_cheat_count = true
	self.projectiles.wpn_prj_hur.no_cheat_count = true
	self.projectiles.wpn_prj_target.no_cheat_count = true
	self.projectiles.frag_com.no_cheat_count = true
	self.projectiles.fir_com.no_cheat_count = true
	self.projectiles.dada_com.no_cheat_count = true
end

local old_weapon_skins = BlackMarketTweakData._init_weapon_skins
function BlackMarketTweakData:_init_weapon_skins()
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
end

local melee_weapons_old = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(...)
   	melee_weapons_old(self, ...)

	--Weapon butt--
	self.melee_weapons.weapon.stats.min_damage = 5
	self.melee_weapons.weapon.stats.max_damage = 5
	self.melee_weapons.weapon.stats.min_damage_effect = 2
	self.melee_weapons.weapon.stats.max_damage_effect = 2
	self.melee_weapons.weapon.stats.range = 120
	self.melee_weapons.weapon.repeat_expire_t = 0.55
	self.melee_weapons.weapon.stats.concealment = 30

	--Remember the basics of CQC Snake--
	self.melee_weapons.fists.speed_mult = 1.6
	self.melee_weapons.fists.stats.min_damage = 2
	self.melee_weapons.fists.stats.max_damage = 4.4
	self.melee_weapons.fists.stats.min_damage_effect = 3
	self.melee_weapons.fists.stats.max_damage_effect = 4
	self.melee_weapons.fists.stats.charge_time = 0.5
	self.melee_weapons.fists.stats.range = 120
	self.melee_weapons.fists.repeat_expire_t = 0.5
	self.melee_weapons.fists.melee_damage_delay = 0.2
	self.melee_weapons.fists.stats.concealment = 30

	--Tough love, tooth shot--
	self.melee_weapons.brass_knuckles.speed_mult = 1.4
	self.melee_weapons.brass_knuckles.stats.min_damage = 3.2
	self.melee_weapons.brass_knuckles.stats.max_damage = 6.3
	self.melee_weapons.brass_knuckles.stats.min_damage_effect = 2.5
	self.melee_weapons.brass_knuckles.stats.max_damage_effect = 5
	self.melee_weapons.brass_knuckles.stats.charge_time = 0.6
	self.melee_weapons.brass_knuckles.stats.range = 120
	self.melee_weapons.brass_knuckles.stats.concealment = 30
	self.melee_weapons.brass_knuckles.melee_damage_delay = 0.2

	--ONE Knife--
	self.melee_weapons.kabartanto.speed_mult = 1.1
	self.melee_weapons.kabartanto.stats.min_damage = 5
	self.melee_weapons.kabartanto.stats.max_damage = 11
	self.melee_weapons.kabartanto.stats.min_damage_effect = 0.3
	self.melee_weapons.kabartanto.stats.max_damage_effect = 0.5
	self.melee_weapons.kabartanto.stats.charge_time = 1.5
	self.melee_weapons.kabartanto.stats.range = 150
	self.melee_weapons.kabartanto.stats.concealment = 29
	self.melee_weapons.kabartanto.repeat_expire_t = 0.75
	self.melee_weapons.kabartanto.melee_damage_delay = 0.1
	self.melee_weapons.kabartanto.anim_global_param = "melee_knife"
	self.melee_weapons.kabartanto.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}

	--That's a big ass toothbrush--
	self.melee_weapons.toothbrush.speed_mult = 1.7
	self.melee_weapons.toothbrush.stats.min_damage = 1.3
	self.melee_weapons.toothbrush.stats.max_damage = 11
	self.melee_weapons.toothbrush.stats.min_damage_effect = 0.1
	self.melee_weapons.toothbrush.stats.max_damage_effect = 0.1
	self.melee_weapons.toothbrush.stats.charge_time = 1.5
	self.melee_weapons.toothbrush.stats.range = 125
	self.melee_weapons.toothbrush.repeat_expire_t = 0.5
	self.melee_weapons.toothbrush.stats.concealment = 30

	--Money money money--
	self.melee_weapons.moneybundle.speed_mult = 1.65
	self.melee_weapons.moneybundle.stats.min_damage = 0.5
	self.melee_weapons.moneybundle.stats.max_damage = 1
	self.melee_weapons.moneybundle.stats.min_damage_effect = 5
	self.melee_weapons.moneybundle.stats.max_damage_effect = 20
	self.melee_weapons.moneybundle.stats.charge_time = 0.8
	self.melee_weapons.moneybundle.repeat_expire_t = 0.6
	self.melee_weapons.moneybundle.stats.range = 125
	self.melee_weapons.moneybundle.stats.concealment = 30
	self.melee_weapons.moneybundle.melee_damage_delay = 0.1

	--About time--
	self.melee_weapons.chef.speed_mult = 0.9
	self.melee_weapons.chef.stats.min_damage = 0.6
	self.melee_weapons.chef.stats.max_damage = 66.6
	self.melee_weapons.chef.stats.min_damage_effect = 0.6
	self.melee_weapons.chef.stats.max_damage_effect = 0.6
	self.melee_weapons.chef.stats.charge_time = 13
	self.melee_weapons.chef.stats.range = 135
	self.melee_weapons.chef.repeat_expire_t = 0.4
	self.melee_weapons.chef.stats.concealment = 28
	self.melee_weapons.chef.melee_damage_delay = 0.1

	--Payday DLC? Nah it's a walking dead game you cunts.--
	self.melee_weapons.barbedwire.speed_mult = 1
	self.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat"
	self.melee_weapons.barbedwire.type = "axe"
	self.melee_weapons.barbedwire.align_objects = {"a_weapon_right"}
	self.melee_weapons.barbedwire.anim_attack_vars = {"var1","var2"}
	self.melee_weapons.barbedwire.stats.min_damage = 7.5
	self.melee_weapons.barbedwire.stats.max_damage = 15
	self.melee_weapons.barbedwire.stats.min_damage_effect = 2
	self.melee_weapons.barbedwire.stats.max_damage_effect = 3
	self.melee_weapons.barbedwire.stats.charge_time = 2
	self.melee_weapons.barbedwire.stats.range = 210
	self.melee_weapons.barbedwire.repeat_expire_t = 0.9
	self.melee_weapons.barbedwire.melee_damage_delay = 0.275
	self.melee_weapons.barbedwire.stats.concealment = 26

	--Cheers mate!--
	self.melee_weapons.whiskey.speed_mult = 1.05
	self.melee_weapons.whiskey.stats.min_damage = 2.5
	self.melee_weapons.whiskey.stats.max_damage = 4.4
	self.melee_weapons.whiskey.stats.min_damage_effect = 2
	self.melee_weapons.whiskey.stats.max_damage_effect = 3
	self.melee_weapons.whiskey.stats.charge_time = 1
	self.melee_weapons.whiskey.stats.range = 140
	self.melee_weapons.whiskey.repeat_expire_t = 0.8
	self.melee_weapons.whiskey.stats.concealment = 30

	--we postal now--
	self.melee_weapons.cutters.speed_mult = 1.1
	self.melee_weapons.cutters.stats.min_damage = 2.5
	self.melee_weapons.cutters.stats.max_damage = 8.1
	self.melee_weapons.cutters.stats.min_damage_effect = 2
	self.melee_weapons.cutters.stats.max_damage_effect = 4
	self.melee_weapons.cutters.stats.charge_time = 1.45
	self.melee_weapons.cutters.stats.range = 150
	self.melee_weapons.cutters.stats.concealment = 27
	self.melee_weapons.cutters.stats.remove_weapon_movement_penalty = false
	self.melee_weapons.cutters.repeat_expire_t = 0.8
	self.melee_weapons.cutters.melee_damage_delay = 0.3

	--This is a fucking boxcutter, seriously these things can barely cut through cardboard and we're supposed to kill cops with it?--
	self.melee_weapons.boxcutter.speed_mult = 1
	self.melee_weapons.boxcutter.stats.weapon_type = "sharp"
	self.melee_weapons.boxcutter.stats.min_damage = 2
	self.melee_weapons.boxcutter.stats.max_damage = 7.5
	self.melee_weapons.boxcutter.stats.min_damage_effect = 0.1
	self.melee_weapons.boxcutter.stats.max_damage_effect = 0.2
	self.melee_weapons.boxcutter.stats.charge_time = 1.1
	self.melee_weapons.boxcutter.stats.range = 120
	self.melee_weapons.boxcutter.stats.concealment = 30
	self.melee_weapons.boxcutter.repeat_expire_t = 0.325
	self.melee_weapons.boxcutter.melee_damage_delay = 0.15
	
	--Ding Ding--
	self.melee_weapons.boxing_gloves.speed_mult = 1
	self.melee_weapons.boxing_gloves.stats.min_damage = 2
	self.melee_weapons.boxing_gloves.stats.max_damage = 5
	self.melee_weapons.boxing_gloves.stats.min_damage_effect = 4
	self.melee_weapons.boxing_gloves.stats.max_damage_effect = 8
	self.melee_weapons.boxing_gloves.stats.charge_time = 2.5
	self.melee_weapons.boxing_gloves.stats.range = 120
	self.melee_weapons.boxing_gloves.stats.concealment = 30
	self.melee_weapons.boxing_gloves.repeat_expire_t = 0.5
	self.melee_weapons.boxing_gloves.melee_damage_delay = 0.15

	--Ayy Hammer--
	self.melee_weapons.alien_maul.speed_mult = 0.9
	self.melee_weapons.alien_maul.anim_global_param = "melee_baseballbat"
	self.melee_weapons.alien_maul.type = "axe"
	self.melee_weapons.alien_maul.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.alien_maul.stats.min_damage = 10
	self.melee_weapons.alien_maul.stats.max_damage = 20
	self.melee_weapons.alien_maul.stats.min_damage_effect = 2
	self.melee_weapons.alien_maul.stats.max_damage_effect = 3
	self.melee_weapons.alien_maul.stats.charge_time = 4
	self.melee_weapons.alien_maul.stats.range = 240
	self.melee_weapons.alien_maul.repeat_expire_t = 0.9
	self.melee_weapons.alien_maul.melee_damage_delay = 0.275
	self.melee_weapons.alien_maul.stats.concealment = 25

	--OG Kabar Knife--
	self.melee_weapons.kabar.speed_mult = 1.1
	self.melee_weapons.kabar.stats.min_damage = 5
	self.melee_weapons.kabar.stats.max_damage = 11
	self.melee_weapons.kabar.stats.min_damage_effect = 0.3
	self.melee_weapons.kabar.stats.max_damage_effect = 0.5
	self.melee_weapons.kabar.stats.charge_time = 1.5
	self.melee_weapons.kabar.stats.range = 150
	self.melee_weapons.kabar.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.kabar.anim_global_param = "melee_knife"
	self.melee_weapons.kabar.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.kabar.repeat_expire_t = 0.75
	self.melee_weapons.kabar.melee_damage_delay = 0.1
	self.melee_weapons.kabar.stats.concealment = 29

	--German Steel--
	self.melee_weapons.kampfmesser.speed_mult = 1.1
	self.melee_weapons.kampfmesser.stats.min_damage = 5
	self.melee_weapons.kampfmesser.stats.max_damage = 11
	self.melee_weapons.kampfmesser.stats.min_damage_effect = 0.4
	self.melee_weapons.kampfmesser.stats.max_damage_effect = 0.6
	self.melee_weapons.kampfmesser.stats.charge_time = 1.3
	self.melee_weapons.kampfmesser.stats.range = 140
	self.melee_weapons.kampfmesser.stats.concealment = 29
	self.melee_weapons.kampfmesser.anim_global_param = "melee_knife2"
	self.melee_weapons.kampfmesser.repeat_expire_t = 0.75
	self.melee_weapons.kampfmesser.melee_damage_delay = 0.1

	--This looks like a boxcutter too, but whatever--
	self.melee_weapons.gerber.speed_mult = 1.5
	self.melee_weapons.gerber.anim_global_param = "melee_stab"
	self.melee_weapons.gerber.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.gerber.repeat_expire_t = 0.5
	self.melee_weapons.gerber.stats.min_damage = 2.5
	self.melee_weapons.gerber.stats.max_damage = 11
	self.melee_weapons.gerber.stats.min_damage_effect = 0.4
	self.melee_weapons.gerber.stats.max_damage_effect = 0.6
	self.melee_weapons.gerber.stats.charge_time = 1.5
	self.melee_weapons.gerber.stats.range = 130
	self.melee_weapons.gerber.stats.concealment = 30

	--Now THIS is a knife.--
	self.melee_weapons.rambo.speed_mult = 0.9
	self.melee_weapons.rambo.stats.min_damage = 5
	self.melee_weapons.rambo.stats.max_damage = 11
	self.melee_weapons.rambo.stats.min_damage_effect = 0.25
	self.melee_weapons.rambo.stats.max_damage_effect = 0.25
	self.melee_weapons.rambo.anim_global_param = "melee_knife"
	self.melee_weapons.rambo.repeat_expire_t = 0.75
	self.melee_weapons.rambo.expire_t = 1.2
	self.melee_weapons.rambo.stats.charge_time = 1.6
	self.melee_weapons.rambo.stats.range = 160
	self.melee_weapons.rambo.stats.concealment = 29

	--Angry Shovel Noises--
	self.melee_weapons.shovel.speed_mult = 0.875
	self.melee_weapons.shovel.stats.min_damage = 3.2
	self.melee_weapons.shovel.stats.max_damage = 7.5
	self.melee_weapons.shovel.stats.min_damage_effect = 2
	self.melee_weapons.shovel.stats.max_damage_effect = 5
	self.melee_weapons.shovel.stats.charge_time = 1.85
	self.melee_weapons.shovel.stats.range = 170
	self.melee_weapons.shovel.repeat_expire_t = 0.8
	self.melee_weapons.shovel.attack_allowed_expire_t = 0.1
	self.melee_weapons.shovel.stats.concealment = 27
	self.melee_weapons.shovel.melee_damage_delay = 0.1

	--STOP RESISTING ARRREST MOTHERFUCKER--
	self.melee_weapons.baton.speed_mult = 1.15
	self.melee_weapons.baton.stats.min_damage = 2
	self.melee_weapons.baton.stats.max_damage = 5
	self.melee_weapons.baton.stats.min_damage_effect = 2.5
	self.melee_weapons.baton.stats.max_damage_effect = 4
	self.melee_weapons.baton.stats.charge_time = 1.1
	self.melee_weapons.baton.stats.range = 155
	self.melee_weapons.baton.stats.concealment = 30
	self.melee_weapons.baton.repeat_expire_t = 0.8
	self.melee_weapons.baton.melee_damage_delay = 0.1

	--Just like the injuns--
	self.melee_weapons.tomahawk.speed_mult = 0.8
	self.melee_weapons.tomahawk.stats.min_damage = 10
	self.melee_weapons.tomahawk.stats.max_damage = 15
	self.melee_weapons.tomahawk.stats.min_damage_effect = 0.8
	self.melee_weapons.tomahawk.stats.max_damage_effect = 1.2
	self.melee_weapons.tomahawk.stats.charge_time = 2.1
	self.melee_weapons.tomahawk.stats.range = 175
	self.melee_weapons.tomahawk.repeat_expire_t = 0.6
	self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
	self.melee_weapons.tomahawk.stats.concealment = 27

	--Its' another god damn machete--
	self.melee_weapons.becker.speed_mult = 0.9
	self.melee_weapons.becker.anim_global_param = "melee_axe"
	self.melee_weapons.becker.stats.min_damage = 7.5
	self.melee_weapons.becker.stats.max_damage = 11
	self.melee_weapons.becker.stats.min_damage_effect = 0.6
	self.melee_weapons.becker.stats.max_damage_effect = 0.8
	self.melee_weapons.becker.stats.charge_time = 1.8
	self.melee_weapons.becker.stats.range = 170
	self.melee_weapons.becker.repeat_expire_t = 0.6
	self.melee_weapons.becker.stats.concealment = 28
	self.melee_weapons.becker.align_objects = {"a_weapon_right"}
	self.melee_weapons.becker.anim_attack_vars = {"var1","var3","var4"}

	--Affix bayonets guardsmen, be ready for blood!--
	self.melee_weapons.bayonet.speed_mult = 1.1
	self.melee_weapons.bayonet.anim_global_param = "melee_stab"
	self.melee_weapons.bayonet.align_objects = {"a_weapon_right"}
	self.melee_weapons.bayonet.repeat_expire_t = 0.5
	self.melee_weapons.bayonet.stats.min_damage = 5
	self.melee_weapons.bayonet.stats.max_damage = 7.5
	self.melee_weapons.bayonet.stats.min_damage_effect = 0.5
	self.melee_weapons.bayonet.stats.max_damage_effect = 0.5
	self.melee_weapons.bayonet.stats.charge_time = 0.6
	self.melee_weapons.bayonet.stats.range = 140
	self.melee_weapons.bayonet.stats.concealment = 30

	--It's a hatchet--
	self.melee_weapons.bullseye.speed_mult = 0.95
	self.melee_weapons.bullseye.stats.min_damage = 5
	self.melee_weapons.bullseye.stats.max_damage = 11
	self.melee_weapons.bullseye.stats.min_damage_effect = 0.8
	self.melee_weapons.bullseye.stats.max_damage_effect = 1.2
	self.melee_weapons.bullseye.stats.charge_time = 1.5
	self.melee_weapons.bullseye.stats.range = 155
	self.melee_weapons.bullseye.repeat_expire_t = 0.6
	self.melee_weapons.bullseye.stats.concealment = 28

	--Tacticool Knife--
	self.melee_weapons.x46.speed_mult = 1.2
	self.melee_weapons.x46.stats.min_damage = 6.3
	self.melee_weapons.x46.stats.max_damage = 7.5
	self.melee_weapons.x46.stats.min_damage_effect = 0.4
	self.melee_weapons.x46.stats.max_damage_effect = 0.6
	self.melee_weapons.x46.stats.charge_time = 0.9
	self.melee_weapons.x46.stats.range = 135
	self.melee_weapons.x46.repeat_expire_t = 0.75
	self.melee_weapons.x46.stats.concealment = 30

	--It has a crowbar we can't use--
	self.melee_weapons.dingdong.speed_mult = 0.95
	self.melee_weapons.dingdong.stats.min_damage = 8.8
	self.melee_weapons.dingdong.stats.max_damage = 17.5
	self.melee_weapons.dingdong.stats.min_damage_effect = 3
	self.melee_weapons.dingdong.stats.max_damage_effect = 3
	self.melee_weapons.dingdong.stats.charge_time = 2.4
	self.melee_weapons.dingdong.stats.range = 230
	self.melee_weapons.dingdong.repeat_expire_t = 0.8
	self.melee_weapons.dingdong.melee_damage_delay = 0.1
	self.melee_weapons.dingdong.stats.concealment = 25

	--I get it, it's the hotline--
	self.melee_weapons.baseballbat.speed_mult = 1.1
	self.melee_weapons.baseballbat.stats.min_damage = 6.3
	self.melee_weapons.baseballbat.stats.max_damage = 12.5
	self.melee_weapons.baseballbat.stats.min_damage_effect = 2
	self.melee_weapons.baseballbat.stats.max_damage_effect = 3
	self.melee_weapons.baseballbat.stats.charge_time = 1.8
	self.melee_weapons.baseballbat.stats.range = 210
	self.melee_weapons.baseballbat.stats.concealment = 27
	self.melee_weapons.baseballbat.repeat_expire_t = 0.9
	self.melee_weapons.baseballbat.melee_damage_delay = 0.275

	--Throwing knives when?--
	self.melee_weapons.cleaver.speed_mult = 1.075
	self.melee_weapons.cleaver.stats.min_damage = 5
	self.melee_weapons.cleaver.stats.max_damage = 7.5
	self.melee_weapons.cleaver.stats.min_damage_effect = 0.7
	self.melee_weapons.cleaver.stats.max_damage_effect = 0.9
	self.melee_weapons.cleaver.stats.charge_time = 1.15
	self.melee_weapons.cleaver.repeat_expire_t = 0.65
	self.melee_weapons.cleaver.stats.range = 140
	self.melee_weapons.cleaver.stats.concealment = 29
	self.melee_weapons.cleaver.melee_damage_delay = 0.15

	--Because we didn't have enough fucking machetes--
	self.melee_weapons.machete.speed_mult = 0.85
	self.melee_weapons.machete.stats.min_damage = 7.5
	self.melee_weapons.machete.stats.max_damage = 15
	self.melee_weapons.machete.stats.min_damage_effect = 0.6
	self.melee_weapons.machete.stats.max_damage_effect = 0.8
	self.melee_weapons.machete.stats.charge_time = 2
	self.melee_weapons.machete.stats.range = 190
	self.melee_weapons.machete.repeat_expire_t = 0.6
	self.melee_weapons.machete.stats.concealment = 27
	self.melee_weapons.machete.melee_damage_delay = 0.1

	--For the longest time the Fireaxe was the most satisfying melee weapon to use, seriously sucks they killed its swing animation--
	self.melee_weapons.fireaxe.anim_global_param = "melee_baseballbat"
	self.melee_weapons.fireaxe.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fireaxe.speed_mult = 0.85
	self.melee_weapons.fireaxe.stats.min_damage = 12.5
	self.melee_weapons.fireaxe.stats.max_damage = 22.5
	self.melee_weapons.fireaxe.stats.min_damage_effect = 1.1
	self.melee_weapons.fireaxe.stats.max_damage_effect = 1.3
	self.melee_weapons.fireaxe.stats.charge_time = 2.5
	self.melee_weapons.fireaxe.stats.range = 255
	self.melee_weapons.fireaxe.stats.concealment = 23
	self.melee_weapons.fireaxe.repeat_expire_t = 0.9
	self.melee_weapons.fireaxe.melee_damage_delay = 0.275

	--The target is a briefcase. Discretion is of the essence.--
	self.melee_weapons.briefcase.speed_mult = 1.1
	self.melee_weapons.briefcase.stats.min_damage = 2
	self.melee_weapons.briefcase.stats.max_damage = 4.4
	self.melee_weapons.briefcase.stats.min_damage_effect = 2
	self.melee_weapons.briefcase.stats.max_damage_effect = 5
	self.melee_weapons.briefcase.stats.charge_time = 1.5
	self.melee_weapons.briefcase.stats.range = 130
	self.melee_weapons.briefcase.stats.concealment = 30
	self.melee_weapons.briefcase.repeat_expire_t = 1
	self.melee_weapons.briefcase.melee_damage_delay = 0.3

	--I don't even know what the fuck the swagger stick is supposed to be--
	self.melee_weapons.swagger.speed_mult = 1.1
	self.melee_weapons.swagger.stats.min_damage = 3.2
	self.melee_weapons.swagger.stats.max_damage = 7.5
	self.melee_weapons.swagger.stats.min_damage_effect = 1.2
	self.melee_weapons.swagger.stats.max_damage_effect = 2.4
	self.melee_weapons.swagger.stats.charge_time = 1.3
	self.melee_weapons.swagger.stats.range = 225
	self.melee_weapons.swagger.repeat_expire_t = 0.6
	self.melee_weapons.swagger.stats.concealment = 28
	self.melee_weapons.swagger.melee_damage_delay = 0.1

	--I'M GOIN'TA LIQUIFY YA!--
	self.melee_weapons.model24.speed_mult = 1.025
	self.melee_weapons.model24.stats.min_damage = 2.5
	self.melee_weapons.model24.stats.max_damage = 5
	self.melee_weapons.model24.stats.min_damage_effect = 1.5
	self.melee_weapons.model24.stats.max_damage_effect = 2
	self.melee_weapons.model24.stats.charge_time = 0.65
	self.melee_weapons.model24.stats.range = 140
	self.melee_weapons.model24.repeat_expire_t = 0.825
	self.melee_weapons.model24.stats.concealment = 28
	self.melee_weapons.model24.melee_damage_delay = 0.175

	--Trench Knife use to be the Fugitive meta--
	self.melee_weapons.fairbair.speed_mult = 0.85
	self.melee_weapons.fairbair.stats.min_damage = 5
	self.melee_weapons.fairbair.stats.max_damage = 7.5
	self.melee_weapons.fairbair.stats.min_damage_effect = 0.75
	self.melee_weapons.fairbair.stats.max_damage_effect = 0.75
	self.melee_weapons.fairbair.stats.charge_time = 0.75
	self.melee_weapons.fairbair.stats.range = 150
	self.melee_weapons.fairbair.repeat_expire_t = 0.5
	self.melee_weapons.fairbair.stats.concealment = 29
	self.melee_weapons.fairbair.melee_damage_delay = 0.1

	--FREEEEEEEDOM--
	self.melee_weapons.freedom.anim_global_param = "melee_freedom"
	self.melee_weapons.freedom.align_objects = {"a_weapon_left"}
	self.melee_weapons.freedom.anim_attack_vars = {"var1","var2","var3","var4"}
	self.melee_weapons.freedom.speed_mult = 0.85
	self.melee_weapons.freedom.stats.min_damage = 5
	self.melee_weapons.freedom.stats.max_damage = 10
	self.melee_weapons.freedom.stats.min_damage_effect = 0.8
	self.melee_weapons.freedom.stats.max_damage_effect = 1.2
	self.melee_weapons.freedom.stats.charge_time = 2
	self.melee_weapons.freedom.stats.range = 290
	self.melee_weapons.freedom.repeat_expire_t = 0.9
	self.melee_weapons.freedom.stats.concealment = 22
	self.melee_weapons.freedom.melee_damage_delay = 0.275

	--Hammer Hammer Toilet Slammer--
	self.melee_weapons.hammer.speed_mult = 1.1
	self.melee_weapons.hammer.stats.min_damage = 3.2
	self.melee_weapons.hammer.stats.max_damage = 10
	self.melee_weapons.hammer.stats.min_damage_effect = 1.5
	self.melee_weapons.hammer.stats.max_damage_effect = 2
	self.melee_weapons.hammer.stats.charge_time = 1.1
	self.melee_weapons.hammer.stats.range = 130
	self.melee_weapons.hammer.repeat_expire_t = 0.6
	self.melee_weapons.hammer.stats.concealment = 28
	self.melee_weapons.hammer.melee_damage_delay = 0.1

	--shillelelelelelagh--
	self.melee_weapons.shillelagh.speed_mult = 1.1
	self.melee_weapons.shillelagh.stats.min_damage = 2.5
	self.melee_weapons.shillelagh.stats.max_damage = 7.5
	self.melee_weapons.shillelagh.stats.min_damage_effect = 1.5
	self.melee_weapons.shillelagh.stats.max_damage_effect = 3
	self.melee_weapons.shillelagh.stats.charge_time = 1.2
	self.melee_weapons.shillelagh.stats.range = 145
	self.melee_weapons.shillelagh.repeat_expire_t = 0.8
	self.melee_weapons.shillelagh.stats.concealment = 27
	self.melee_weapons.shillelagh.melee_damage_delay = 0.1

	--Dragan's Meat...Cleaver--
	self.melee_weapons.meat_cleaver.speed_mult = 1
	self.melee_weapons.meat_cleaver.stats.min_damage = 6.3
	self.melee_weapons.meat_cleaver.stats.max_damage = 8.8
	self.melee_weapons.meat_cleaver.stats.min_damage_effect = 0.7
	self.melee_weapons.meat_cleaver.stats.max_damage_effect = 0.9
	self.melee_weapons.meat_cleaver.stats.charge_time = 1
	self.melee_weapons.meat_cleaver.stats.range = 140
	self.melee_weapons.meat_cleaver.repeat_expire_t = 0.65
	self.melee_weapons.meat_cleaver.melee_damage_delay = 0.15

	--MotherFUCKER--
	self.melee_weapons.fork.speed_mult = 1.45
	self.melee_weapons.fork.stats.min_damage = 2.5
	self.melee_weapons.fork.stats.max_damage = 7.5
	self.melee_weapons.fork.stats.min_damage_effect = 0.1
	self.melee_weapons.fork.stats.max_damage_effect = 0.2
	self.melee_weapons.fork.stats.charge_time = 1
	self.melee_weapons.fork.stats.range = 135
	self.melee_weapons.fork.repeat_expire_t = 0.5
	self.melee_weapons.fork.stats.concealment = 28
	self.melee_weapons.fork.melee_damage_delay = 0.1

	--Le Spatula--
	self.melee_weapons.spatula.speed_mult = 1.2
	self.melee_weapons.spatula.stats.min_damage = 0.6
	self.melee_weapons.spatula.stats.max_damage = 2
	self.melee_weapons.spatula.stats.min_damage_effect = 3
	self.melee_weapons.spatula.stats.max_damage_effect = 5
	self.melee_weapons.spatula.stats.charge_time = 0.2
	self.melee_weapons.spatula.stats.range = 125
	self.melee_weapons.spatula.repeat_expire_t = 0.65
	self.melee_weapons.spatula.melee_damage_delay = 0.15
	self.melee_weapons.spatula.stats.concealment = 30

	--I'm really annoyed that we don't actually poke with it--
	self.melee_weapons.poker.speed_mult = 0.85
	self.melee_weapons.poker.stats.min_damage = 4.4
	self.melee_weapons.poker.stats.max_damage = 11
	self.melee_weapons.poker.stats.min_damage_effect = 0.8
	self.melee_weapons.poker.stats.max_damage_effect = 1.2
	self.melee_weapons.poker.stats.charge_time = 2
	self.melee_weapons.poker.stats.range = 175
	self.melee_weapons.poker.stats.concealment = 28
	self.melee_weapons.poker.repeat_expire_t = 0.6
	self.melee_weapons.poker.melee_damage_delay = 0.1

	--Tenderizing meat is my fetish--
	self.melee_weapons.tenderizer.speed_mult = 1.25
	self.melee_weapons.tenderizer.stats.min_damage = 2.5
	self.melee_weapons.tenderizer.stats.max_damage = 7.5
	self.melee_weapons.tenderizer.stats.min_damage_effect = 1
	self.melee_weapons.tenderizer.stats.max_damage_effect = 1.5
	self.melee_weapons.tenderizer.stats.charge_time = 0.8
	self.melee_weapons.tenderizer.stats.range = 130
	self.melee_weapons.tenderizer.repeat_expire_t = 0.6
	self.melee_weapons.tenderizer.melee_damage_delay = 0.1
	self.melee_weapons.tenderizer.stats.concealment = 28

	--Slutshaming--
	self.melee_weapons.branding_iron.speed_mult = 0.8
	self.melee_weapons.branding_iron.stats.min_damage = 5
	self.melee_weapons.branding_iron.stats.max_damage = 11
	self.melee_weapons.branding_iron.stats.min_damage_effect = 2
	self.melee_weapons.branding_iron.stats.max_damage_effect = 4
	self.melee_weapons.branding_iron.stats.charge_time = 1.9
	self.melee_weapons.branding_iron.stats.range = 190
	self.melee_weapons.branding_iron.repeat_expire_t = 0.8
	self.melee_weapons.branding_iron.attack_allowed_expire_t = 0
	self.melee_weapons.branding_iron.stats.concealment = 27
	self.melee_weapons.branding_iron.melee_damage_delay = 0.1

	--another injun tomahawk
	self.melee_weapons.scalper.speed_mult = 1
	self.melee_weapons.scalper.stats.min_damage = 7.5
	self.melee_weapons.scalper.stats.max_damage = 10
	self.melee_weapons.scalper.stats.min_damage_effect = 0.8
	self.melee_weapons.scalper.stats.max_damage_effect = 1.2
	self.melee_weapons.scalper.stats.charge_time = 1.15
	self.melee_weapons.scalper.stats.range = 165
	self.melee_weapons.scalper.repeat_expire_t = 0.6
	self.melee_weapons.scalper.attack_allowed_expire_t = 0.1
	self.melee_weapons.scalper.stats.concealment = 28
	self.melee_weapons.scalper.melee_damage_delay = 0.1

	--I'm david bowie--
	self.melee_weapons.bowie.speed_mult = 0.85
	self.melee_weapons.bowie.stats.min_damage = 7.5
	self.melee_weapons.bowie.stats.max_damage = 15
	self.melee_weapons.bowie.stats.min_damage_effect = 0.3
	self.melee_weapons.bowie.stats.max_damage_effect = 0.5
	self.melee_weapons.bowie.stats.charge_time = 1.8
	self.melee_weapons.bowie.stats.range = 170
	self.melee_weapons.bowie.repeat_expire_t = 0.75
	self.melee_weapons.bowie.attack_allowed_expire_t = 0.1
	self.melee_weapons.bowie.stats.concealment = 28
	self.melee_weapons.bowie.melee_damage_delay = 0.1

	--Manly Miner Men--
	self.melee_weapons.mining_pick.make_decal = true
	self.melee_weapons.mining_pick.make_effect = true
	self.melee_weapons.mining_pick.speed_mult = 0.95
	self.melee_weapons.mining_pick.stats.min_damage = 7.5
	self.melee_weapons.mining_pick.stats.max_damage = 15
	self.melee_weapons.mining_pick.stats.min_damage_effect = 1
	self.melee_weapons.mining_pick.stats.max_damage_effect = 1.2
	self.melee_weapons.mining_pick.stats.charge_time = 2
	self.melee_weapons.mining_pick.stats.range = 240
	self.melee_weapons.mining_pick.repeat_expire_t = 0.85
	self.melee_weapons.mining_pick.attack_allowed_expire_t = 0.1
	self.melee_weapons.mining_pick.stats.concealment = 23
	self.melee_weapons.mining_pick.melee_damage_delay = 0.175

	--Who's up for rockin the mic?--
	self.melee_weapons.microphone.speed_mult = 1.075
	self.melee_weapons.microphone.stats.min_damage = 1.3
	self.melee_weapons.microphone.stats.max_damage = 3.8
	self.melee_weapons.microphone.stats.min_damage_effect = 2
	self.melee_weapons.microphone.stats.max_damage_effect = 6
	self.melee_weapons.microphone.stats.charge_time = 0.4
	self.melee_weapons.microphone.stats.range = 125
	self.melee_weapons.microphone.repeat_expire_t = 0.6
	self.melee_weapons.microphone.attack_allowed_expire_t = 0.1
	self.melee_weapons.microphone.melee_damage_delay = 0.175
	self.melee_weapons.microphone.stats.concealment = 30

	--The safeword is police brutality--
	self.melee_weapons.oldbaton.speed_mult = 1.05
	self.melee_weapons.oldbaton.stats.min_damage = 3.1
	self.melee_weapons.oldbaton.stats.max_damage = 7.5
	self.melee_weapons.oldbaton.stats.min_damage_effect = 3
	self.melee_weapons.oldbaton.stats.max_damage_effect = 4.5
	self.melee_weapons.oldbaton.stats.charge_time = 1.45
	self.melee_weapons.oldbaton.stats.range = 165
	self.melee_weapons.oldbaton.repeat_expire_t = 0.8
	self.melee_weapons.oldbaton.attack_allowed_expire_t = 0.1
	self.melee_weapons.oldbaton.stats.concealment = 28
	self.melee_weapons.oldbaton.melee_damage_delay = 0.1

	--BOOP BOOP--
	self.melee_weapons.detector.speed_mult = 1.25
	self.melee_weapons.detector.stats.min_damage = 1.3
	self.melee_weapons.detector.stats.max_damage = 2.5
	self.melee_weapons.detector.stats.min_damage_effect = 2.8
	self.melee_weapons.detector.stats.max_damage_effect = 4
	self.melee_weapons.detector.stats.charge_time = 0.95
	self.melee_weapons.detector.stats.range = 140
	self.melee_weapons.detector.repeat_expire_t = 0.8
	self.melee_weapons.detector.attack_allowed_expire_t = 0.1
	self.melee_weapons.detector.melee_damage_delay = 0.1
	self.melee_weapons.detector.stats.concealment = 29

	--Mic stand--
	self.melee_weapons.micstand.speed_mult = 1.3
	self.melee_weapons.micstand.stats.min_damage = 1.3
	self.melee_weapons.micstand.stats.max_damage = 3.8
	self.melee_weapons.micstand.stats.min_damage_effect = 4
	self.melee_weapons.micstand.stats.max_damage_effect = 6
	self.melee_weapons.micstand.stats.charge_time = 1.55
	self.melee_weapons.micstand.stats.range = 275
	self.melee_weapons.micstand.repeat_expire_t = 0.85
	self.melee_weapons.micstand.attack_allowed_expire_t = 0.1
	self.melee_weapons.micstand.stats.concealment = 27
	self.melee_weapons.micstand.melee_damage_delay = 0.175

	--We'll put you in the hospital for free eh?--
	self.melee_weapons.hockey.speed_mult = 1.25
	self.melee_weapons.hockey.stats.min_damage = 4.4
	self.melee_weapons.hockey.stats.max_damage = 10
	self.melee_weapons.hockey.stats.min_damage_effect = 1
	self.melee_weapons.hockey.stats.max_damage_effect = 3
	self.melee_weapons.hockey.stats.charge_time = 1.7
	self.melee_weapons.hockey.stats.range = 250
	self.melee_weapons.hockey.repeat_expire_t = 0.75
	self.melee_weapons.hockey.stats.concealment = 27
	self.melee_weapons.hockey.melee_damage_delay = 0.215

	--It's a 1% chance to win the slots asshats keep an eye on the fucking BFD--
	self.melee_weapons.slot_lever.speed_mult = 1.05
	self.melee_weapons.slot_lever.stats.min_damage = 3.8
	self.melee_weapons.slot_lever.stats.max_damage = 7.5
	self.melee_weapons.slot_lever.stats.min_damage_effect = 2
	self.melee_weapons.slot_lever.stats.max_damage_effect = 4
	self.melee_weapons.slot_lever.stats.charge_time = 1.6
	self.melee_weapons.slot_lever.stats.range = 175
	self.melee_weapons.slot_lever.stats.concealment = 28
	self.melee_weapons.slot_lever.repeat_expire_t = 0.8
	self.melee_weapons.slot_lever.melee_damage_delay = 0.1

	--Another baton reskin, thanks Overkill--
	self.melee_weapons.croupier_rake.speed_mult = 0.9
	self.melee_weapons.croupier_rake.stats.min_damage = 3.2
	self.melee_weapons.croupier_rake.stats.max_damage = 7.5
	self.melee_weapons.croupier_rake.stats.min_damage_effect = 1.5
	self.melee_weapons.croupier_rake.stats.max_damage_effect = 3
	self.melee_weapons.croupier_rake.stats.charge_time = 1.4
	self.melee_weapons.croupier_rake.stats.range = 160
	self.melee_weapons.croupier_rake.stats.concealment = 28
	self.melee_weapons.croupier_rake.repeat_expire_t = 0.6
	self.melee_weapons.croupier_rake.melee_damage_delay = 0.1

	--Nyeh hey there's the high roller--
	self.melee_weapons.switchblade.speed_mult = 0.875
	self.melee_weapons.switchblade.anim_global_param = "melee_boxcutter"
	self.melee_weapons.switchblade.align_objects = {"a_weapon_right"}	
	self.melee_weapons.switchblade.anim_attack_vars = {"var1","var3"}
	self.melee_weapons.switchblade.stats.min_damage = 2.5
	self.melee_weapons.switchblade.stats.max_damage = 7.5
	self.melee_weapons.switchblade.stats.min_damage_effect = 0.2
	self.melee_weapons.switchblade.stats.max_damage_effect = 0.4
	self.melee_weapons.switchblade.stats.charge_time = 1.3
	self.melee_weapons.switchblade.stats.range = 125
	self.melee_weapons.switchblade.stats.concealment = 30
	self.melee_weapons.switchblade.repeat_expire_t = 0.325
	self.melee_weapons.switchblade.melee_damage_delay = 0.15

	--RIP Buzzer meta--
	self.melee_weapons.taser.speed_mult = 0.8
	self.melee_weapons.taser.stats.min_damage = 0.6
	self.melee_weapons.taser.stats.max_damage = 3.8
	self.melee_weapons.taser.stats.min_damage_effect = 0
	self.melee_weapons.taser.stats.max_damage_effect = 0
	self.melee_weapons.taser.stats.charge_time = 1.6
	self.melee_weapons.taser.stats.range = 140
	self.melee_weapons.taser.stats.concealment = 30
	self.melee_weapons.taser.repeat_expire_t = 0.6
	self.melee_weapons.taser.melee_damage_delay = 0.1
	
	--Thanks Boss--
	self.melee_weapons.fight.speed_mult = 2.15
	self.melee_weapons.fight.stats.min_damage = 1.3
	self.melee_weapons.fight.stats.max_damage = 7.5
	self.melee_weapons.fight.stats.min_damage_effect = 0.5
	self.melee_weapons.fight.stats.max_damage_effect = 4
	self.melee_weapons.fight.stats.charge_time = 1.8
	self.melee_weapons.fight.stats.range = 110
	self.melee_weapons.fight.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fight.repeat_expire_t = 0.5
	self.melee_weapons.fight.melee_damage_delay = 0.125
	self.melee_weapons.fight.stats.concealment = 30

	--Can't fight nature jack--
	self.melee_weapons.twins.stats.min_damage = 3.8
	self.melee_weapons.twins.stats.max_damage = 10
	self.melee_weapons.twins.stats.min_damage_effect = 1
	self.melee_weapons.twins.stats.max_damage_effect = 1
	self.melee_weapons.twins.stats.charge_time = 1.4
	self.melee_weapons.twins.stats.range = 200
	self.melee_weapons.twins.stats.concealment = 29
	self.melee_weapons.twins.melee_damage_delay = 0.1

	--Basically just a really short knife--
	self.melee_weapons.tiger.speed_mult = 0.9
	self.melee_weapons.tiger.stats.min_damage = 3.8
	self.melee_weapons.tiger.stats.max_damage = 7.5
	self.melee_weapons.tiger.stats.min_damage_effect = 2
	self.melee_weapons.tiger.stats.max_damage_effect = 3
	self.melee_weapons.tiger.stats.charge_time = 1.35
	self.melee_weapons.tiger.stats.range = 120
	self.melee_weapons.tiger.melee_damage_delay = 0.15
	self.melee_weapons.tiger.stats.concealment = 30
	self.melee_weapons.tiger.repeat_expire_t = 0.6

	--REMEMBER THE BASICS OF--
	self.melee_weapons.cqc.dot_data = {
		type = "poison",
		custom_data = {dot_length = 1, hurt_animation_chance = 0.75}
	}
	self.melee_weapons.cqc.speed_mult = 1
	self.melee_weapons.cqc.stats.min_damage = 2.5
	self.melee_weapons.cqc.stats.max_damage = 5
	self.melee_weapons.cqc.stats.min_damage_effect = 0.3
	self.melee_weapons.cqc.stats.max_damage_effect = 0.3
	self.melee_weapons.cqc.stats.charge_time = 1.6
	self.melee_weapons.cqc.stats.range = 125
	self.melee_weapons.cqc.repeat_expire_t = 0.5
	self.melee_weapons.cqc.melee_damage_delay = 0.1
	self.melee_weapons.cqc.stats.concealment = 30

	--YOOOOOOOOOOOOOOOOOOOOOOOOOOO--
	self.melee_weapons.sandsteel.info_id = "bm_melee_katana_info"
	self.melee_weapons.sandsteel.speed_mult = 1.05
	self.melee_weapons.sandsteel.stats.min_damage = 10
	self.melee_weapons.sandsteel.stats.max_damage = 22.5
	self.melee_weapons.sandsteel.stats.min_damage_effect = 0.5
	self.melee_weapons.sandsteel.stats.max_damage_effect = 0.65
	self.melee_weapons.sandsteel.stats.charge_time = 2.5
	self.melee_weapons.sandsteel.stats.range = 240
	self.melee_weapons.sandsteel.stats.concealment = 23
	self.melee_weapons.sandsteel.repeat_expire_t = 0.75
	self.melee_weapons.sandsteel.melee_damage_delay = 0.215

	--I'm a little annoyed that we can't actually use it like a shield--
	self.melee_weapons.buck.stats.min_damage = 3.8
	self.melee_weapons.buck.stats.max_damage = 10
	self.melee_weapons.buck.stats.min_damage_effect = 4
	self.melee_weapons.buck.stats.max_damage_effect = 6
	self.melee_weapons.buck.stats.charge_time = 2.4
	self.melee_weapons.buck.stats.range = 175
	self.melee_weapons.buck.stats.concealment = 28
	self.melee_weapons.buck.repeat_expire_t = 0.9
	self.melee_weapons.buck.melee_damage_delay = 0.4

	--Fear the beard--
	self.melee_weapons.beardy.speed_mult = 0.95
	self.melee_weapons.beardy.stats.min_damage = 15
	self.melee_weapons.beardy.stats.max_damage = 25
	self.melee_weapons.beardy.stats.min_damage_effect = 1
	self.melee_weapons.beardy.stats.max_damage_effect = 1.2
	self.melee_weapons.beardy.stats.charge_time = 3.2
	self.melee_weapons.beardy.stats.range = 240
	self.melee_weapons.beardy.stats.concealment = 21
	self.melee_weapons.beardy.repeat_expire_t = 1.2
	self.melee_weapons.beardy.melee_damage_delay = 0.65

	--Whose plumes are gay now Carl? Whose plumes are gay now?--
	self.melee_weapons.morning.speed_mult = 0.725
	self.melee_weapons.morning.stats.min_damage = 8.1
	self.melee_weapons.morning.stats.max_damage = 16.3
	self.melee_weapons.morning.stats.min_damage_effect = 2
	self.melee_weapons.morning.stats.max_damage_effect = 3
	self.melee_weapons.morning.stats.charge_time = 3
	self.melee_weapons.morning.stats.range = 195
	self.melee_weapons.morning.stats.concealment = 26
	self.melee_weapons.morning.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.morning.repeat_expire_t = 0.8
	self.melee_weapons.morning.melee_damage_delay = 0.1
	
	--C/C quality master race--
	self.melee_weapons.great.speed_mult = 0.95
	self.melee_weapons.great.stats.min_damage = 12.5
	self.melee_weapons.great.stats.max_damage = 31.3
	self.melee_weapons.great.stats.min_damage_effect = 0.6
	self.melee_weapons.great.stats.max_damage_effect = 0.8
	self.melee_weapons.great.stats.charge_time = 2.9
	self.melee_weapons.great.stats.range = 265
	self.melee_weapons.great.stats.concealment = 21
	self.melee_weapons.great.repeat_expire_t = 1.25
	self.melee_weapons.great.melee_damage_delay = 0.6
	self.melee_weapons.great.stats.remove_weapon_movement_penalty = true

	--Selfies are probably one of the most obnoxious things to come with the new millennials--
	self.melee_weapons.selfie.speed_mult = 1.2
	self.melee_weapons.selfie.stats.min_damage = 1.3
	self.melee_weapons.selfie.stats.max_damage = 4.4
	self.melee_weapons.selfie.stats.min_damage_effect = 0.5
	self.melee_weapons.selfie.stats.max_damage_effect = 1
	self.melee_weapons.selfie.stats.charge_time = 0.9
	self.melee_weapons.selfie.stats.range = 250
	self.melee_weapons.selfie.stats.concealment = 30
	self.melee_weapons.selfie.repeat_expire_t = 0.6
	self.melee_weapons.selfie.melee_damage_delay = 0.1

	--More Gore--
	self.melee_weapons.gator.speed_mult = 0.8
	self.melee_weapons.gator.stats.min_damage = 7.5
	self.melee_weapons.gator.stats.max_damage = 16.3
	self.melee_weapons.gator.stats.min_damage_effect = 0.6
	self.melee_weapons.gator.stats.max_damage_effect = 0.8
	self.melee_weapons.gator.stats.charge_time = 2.3
	self.melee_weapons.gator.stats.range = 210
	self.melee_weapons.gator.repeat_expire_t = 0.6
	self.melee_weapons.gator.melee_damage_delay = 0.1
	self.melee_weapons.gator.stats.concealment = 27

	--Reminds me of how HL2 was gonna have an ice axe--
	self.melee_weapons.iceaxe.speed_mult = 0.85
	self.melee_weapons.iceaxe.stats.min_damage = 8.8
	self.melee_weapons.iceaxe.stats.max_damage = 11
	self.melee_weapons.iceaxe.stats.min_damage_effect = 0.9
	self.melee_weapons.iceaxe.stats.max_damage_effect = 1.1
	self.melee_weapons.iceaxe.stats.charge_time = 1.7
	self.melee_weapons.iceaxe.stats.range = 165
	self.melee_weapons.iceaxe.stats.concealment = 28
	self.melee_weapons.iceaxe.repeat_expire_t = 0.8
	self.melee_weapons.iceaxe.melee_damage_delay = 0.1

	--Even more pokey knives--
	self.melee_weapons.pugio.speed_mult = 1.25
	self.melee_weapons.pugio.stats.min_damage = 3.8
	self.melee_weapons.pugio.stats.max_damage = 8.8
	self.melee_weapons.pugio.stats.min_damage_effect = 0.4
	self.melee_weapons.pugio.stats.max_damage_effect = 0.4
	self.melee_weapons.pugio.stats.charge_time = 0.45
	self.melee_weapons.pugio.stats.range = 150
	self.melee_weapons.pugio.stats.concealment = 28
	self.melee_weapons.pugio.repeat_expire_t = 0.5
	self.melee_weapons.pugio.melee_damage_delay = 0.1
	
	--I wonder how many people caught that this is a Shawn the Sheep reference--
	self.melee_weapons.shawn.speed_mult = 1.2
	self.melee_weapons.shawn.stats.min_damage = 3.2
	self.melee_weapons.shawn.stats.max_damage = 5
	self.melee_weapons.shawn.stats.min_damage_effect = 0.5
	self.melee_weapons.shawn.stats.max_damage_effect = 1
	self.melee_weapons.shawn.stats.charge_time = 0.85
	self.melee_weapons.shawn.stats.range = 125
	self.melee_weapons.shawn.stats.concealment = 29
	self.melee_weapons.shawn.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.shawn.repeat_expire_t = 0.4
	self.melee_weapons.shawn.melee_damage_delay = 0.1

	--Pitchfork--
	self.melee_weapons.pitchfork.speed_mult = 0.9
	self.melee_weapons.pitchfork.stats.min_damage = 4.4
	self.melee_weapons.pitchfork.stats.max_damage = 11
	self.melee_weapons.pitchfork.stats.min_damage_effect = 0.5
	self.melee_weapons.pitchfork.stats.max_damage_effect = 1
	self.melee_weapons.pitchfork.stats.charge_time = 1.7
	self.melee_weapons.pitchfork.stats.range = 240
	self.melee_weapons.pitchfork.stats.concealment = 27
	self.melee_weapons.pitchfork.repeat_expire_t = 0.7
	self.melee_weapons.pitchfork.melee_damage_delay = 0.325

	--Shephard's cane--
	self.melee_weapons.stick.speed_mult = 1.175
	self.melee_weapons.stick.stats.min_damage = 3.8
	self.melee_weapons.stick.stats.max_damage = 7.5
	self.melee_weapons.stick.stats.min_damage_effect = 1
	self.melee_weapons.stick.stats.max_damage_effect = 1.5
	self.melee_weapons.stick.stats.charge_time = 1.55
	self.melee_weapons.stick.stats.range = 260
	self.melee_weapons.stick.stats.concealment = 27
	self.melee_weapons.stick.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.stick.repeat_expire_t = 0.7
	self.melee_weapons.stick.melee_damage_delay = 0.175

	--Scout Knife--
	self.melee_weapons.scoutknife.speed_mult = 1.35
	self.melee_weapons.scoutknife.stats.min_damage = 3.8
	self.melee_weapons.scoutknife.stats.max_damage = 5
	self.melee_weapons.scoutknife.stats.min_damage_effect = 0.4
	self.melee_weapons.scoutknife.stats.max_damage_effect = 0.6
	self.melee_weapons.scoutknife.stats.charge_time = 0.6
	self.melee_weapons.scoutknife.stats.range = 125
	self.melee_weapons.scoutknife.stats.concealment = 30
	self.melee_weapons.scoutknife.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.scoutknife.repeat_expire_t = 0.75

	--It's kinda cool I guess, but it just ended up to be a katana reskin--
	self.melee_weapons.nin.make_effect = true
	self.melee_weapons.nin.make_decal = true
	self.melee_weapons.nin.speed_mult = 1.1
	self.melee_weapons.nin.stats.min_damage = 10
	self.melee_weapons.nin.stats.max_damage = 10
	self.melee_weapons.nin.stats.min_damage_effect = 0.8
	self.melee_weapons.nin.stats.max_damage_effect = 0.8
	self.melee_weapons.nin.stats.charge_time = 0.00001
	self.melee_weapons.nin.stats.range = 600
	self.melee_weapons.nin.stats.concealment = 27
	self.melee_weapons.nin.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.nin.repeat_expire_t = 0.9
	self.melee_weapons.nin.melee_damage_delay = 0.15

	--A ballistic knife we can't even fire--
	self.melee_weapons.ballistic.sounds.equip = "knife_equip"
	self.melee_weapons.ballistic.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.ballistic.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.ballistic.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.ballistic.sounds.charge = "knife_charge"
	self.melee_weapons.ballistic.speed_mult = 1.2
	self.melee_weapons.ballistic.repeat_expire_t = 0.6
	self.melee_weapons.ballistic.melee_damage_delay = 0.125
	self.melee_weapons.ballistic.stats.min_damage = 7.5
	self.melee_weapons.ballistic.stats.max_damage = 11
	self.melee_weapons.ballistic.stats.min_damage_effect = 0.3
	self.melee_weapons.ballistic.stats.max_damage_effect = 0.5
	self.melee_weapons.ballistic.stats.charge_time = 1.2
	self.melee_weapons.ballistic.stats.range = 140
	self.melee_weapons.ballistic.stats.concealment = 29

	--woo free tasers--
	self.melee_weapons.zeus.special_weapon = "taser"
	self.melee_weapons.zeus.info_id = "bm_melee_taser_info"
	self.melee_weapons.zeus.speed_mult = 1.15
	self.melee_weapons.zeus.stats.min_damage = 2.5
	self.melee_weapons.zeus.stats.max_damage = 5
	self.melee_weapons.zeus.stats.min_damage_effect = 0
	self.melee_weapons.zeus.stats.max_damage_effect = 0
	self.melee_weapons.zeus.stats.charge_time = 2.2
	self.melee_weapons.zeus.stats.range = 130
	self.melee_weapons.zeus.stats.concealment = 30
	self.melee_weapons.zeus.repeat_expire_t = 0.5
	self.melee_weapons.zeus.melee_damage_delay = 0.2

	--you got blood on my suit--
	self.melee_weapons.wing.speed_mult = 1.25
	self.melee_weapons.wing.stats.min_damage = 3.8
	self.melee_weapons.wing.stats.max_damage = 10
	self.melee_weapons.wing.stats.min_damage_effect = 0.1
	self.melee_weapons.wing.stats.max_damage_effect = 0.4
	self.melee_weapons.wing.stats.charge_time = 1.7
	self.melee_weapons.wing.stats.range = 130
	self.melee_weapons.wing.stats.concealment = 30
	self.melee_weapons.wing.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.wing.repeat_expire_t = 0.75
	self.melee_weapons.wing.melee_damage_delay = 0.1

	--YEAH YEAH YEAH YEAH--
	self.melee_weapons.road.speed_mult = 0.8
	self.melee_weapons.road.stats.min_damage = 11
	self.melee_weapons.road.stats.max_damage = 20
	self.melee_weapons.road.stats.min_damage_effect = 0.8
	self.melee_weapons.road.stats.max_damage_effect = 2
	self.melee_weapons.road.stats.charge_time = 3
	self.melee_weapons.road.stats.range = 190
	self.melee_weapons.road.stats.concealment = 26
	self.melee_weapons.road.repeat_expire_t = 0.8
	self.melee_weapons.road.melee_damage_delay = 0.375

	--Chainsaw + Gun--
	self.melee_weapons.cs.stats.min_damage = 15
	self.melee_weapons.cs.stats.max_damage = 15
	self.melee_weapons.cs.stats.min_damage_effect = 0.1
	self.melee_weapons.cs.stats.max_damage_effect = 0.1
	self.melee_weapons.cs.speed_mult = 1
	self.melee_weapons.cs.stats.charge_time = 0.00001
	self.melee_weapons.cs.stats.range = 200
	self.melee_weapons.cs.stats.concealment = 21
	self.melee_weapons.cs.repeat_expire_t = 1.6

	--It's da hotline--
	self.melee_weapons.brick.speed_mult = 1.15
	self.melee_weapons.brick.stats.min_damage = 2
	self.melee_weapons.brick.stats.max_damage = 5
	self.melee_weapons.brick.stats.min_damage_effect = 2.5
	self.melee_weapons.brick.stats.max_damage_effect = 4
	self.melee_weapons.brick.stats.charge_time = 1.1
	self.melee_weapons.brick.stats.range = 155
	self.melee_weapons.brick.stats.concealment = 30
	self.melee_weapons.brick.repeat_expire_t = 0.8
	self.melee_weapons.brick.melee_damage_delay = 0.1

	--how does this spin when it has a handle--
	self.melee_weapons.ostry.stats.min_damage = 3.8
	self.melee_weapons.ostry.stats.max_damage = 10
	self.melee_weapons.ostry.stats.min_damage_effect = 1
	self.melee_weapons.ostry.stats.max_damage_effect = 1
	self.melee_weapons.ostry.stats.charge_time = 1.4
	self.melee_weapons.ostry.stats.range = 200
	self.melee_weapons.ostry.stats.concealment = 29
	self.melee_weapons.ostry.melee_damage_delay = 0.1
	self.melee_weapons.ostry.repeat_expire_t = 0.6

	--Pooper scooper--
	self.melee_weapons.catch.speed_mult = 1.1
	self.melee_weapons.catch.stats.min_damage = 5
	self.melee_weapons.catch.stats.max_damage = 11
	self.melee_weapons.catch.stats.min_damage_effect = 0.3
	self.melee_weapons.catch.stats.max_damage_effect = 0.5
	self.melee_weapons.catch.stats.charge_time = 1.5
	self.melee_weapons.catch.stats.range = 150
	self.melee_weapons.catch.stats.concealment = 29
	self.melee_weapons.catch.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.catch.repeat_expire_t = 0.75
	self.melee_weapons.catch.melee_damage_delay = 0.1

	--another machete--
	self.melee_weapons.oxide.speed_mult = 0.85
	self.melee_weapons.oxide.stats.min_damage = 7.5
	self.melee_weapons.oxide.stats.max_damage = 15
	self.melee_weapons.oxide.stats.min_damage_effect = 0.6
	self.melee_weapons.oxide.stats.max_damage_effect = 0.8
	self.melee_weapons.oxide.stats.charge_time = 2
	self.melee_weapons.oxide.stats.range = 190
	self.melee_weapons.oxide.repeat_expire_t = 0.6
	self.melee_weapons.oxide.stats.concealment = 27
	self.melee_weapons.oxide.melee_damage_delay = 0.1

	--memed hard enough into the game--
	self.melee_weapons.sword.speed_mult = 1.7
	self.melee_weapons.sword.stats.min_damage = 1.3
	self.melee_weapons.sword.stats.max_damage = 11
	self.melee_weapons.sword.stats.min_damage_effect = 0.1
	self.melee_weapons.sword.stats.max_damage_effect = 0.1
	self.melee_weapons.sword.stats.charge_time = 1.5
	self.melee_weapons.sword.stats.range = 125
	self.melee_weapons.sword.repeat_expire_t = 0.5
	self.melee_weapons.sword.stats.concealment = 30

	--asdf--
	self.melee_weapons.agave.speed_mult = 0.85
	self.melee_weapons.agave.stats.min_damage = 7.5
	self.melee_weapons.agave.stats.max_damage = 15
	self.melee_weapons.agave.stats.min_damage_effect = 0.6
	self.melee_weapons.agave.stats.max_damage_effect = 0.8
	self.melee_weapons.agave.stats.charge_time = 2
	self.melee_weapons.agave.stats.range = 190
	self.melee_weapons.agave.repeat_expire_t = 0.6
	self.melee_weapons.agave.stats.concealment = 27
	self.melee_weapons.agave.melee_damage_delay = 0.1

	--Not one but TWO pokers--
	self.melee_weapons.push.speed_mult = 1.2
	self.melee_weapons.push.repeat_expire_t = 0.6
	self.melee_weapons.push.melee_damage_delay = 0.125
	self.melee_weapons.push.stats.min_damage = 7.5
	self.melee_weapons.push.stats.max_damage = 11
	self.melee_weapons.push.stats.min_damage_effect = 0.3
	self.melee_weapons.push.stats.max_damage_effect = 0.5
	self.melee_weapons.push.stats.charge_time = 1.2
	self.melee_weapons.push.stats.range = 140
	self.melee_weapons.push.stats.concealment = 29

	self.melee_weapons.grip.speed_mult = 1.2
	self.melee_weapons.grip.repeat_expire_t = 0.6
	self.melee_weapons.grip.melee_damage_delay = 0.125
	self.melee_weapons.grip.stats.min_damage = 7.5
	self.melee_weapons.grip.stats.max_damage = 11
	self.melee_weapons.grip.stats.min_damage_effect = 0.3
	self.melee_weapons.grip.stats.max_damage_effect = 0.5
	self.melee_weapons.grip.stats.charge_time = 1.2
	self.melee_weapons.grip.stats.range = 140
	self.melee_weapons.grip.stats.concealment = 29		
	
	--For that you get the belt--
	self.melee_weapons.sap.speed_mult = 1.65
	self.melee_weapons.sap.stats.min_damage = 0.5
	self.melee_weapons.sap.stats.max_damage = 1
	self.melee_weapons.sap.stats.min_damage_effect = 5
	self.melee_weapons.sap.stats.max_damage_effect = 20
	self.melee_weapons.sap.stats.charge_time = 0.8
	self.melee_weapons.sap.repeat_expire_t = 0.6
	self.melee_weapons.sap.stats.range = 125
	self.melee_weapons.sap.stats.concealment = 30
	self.melee_weapons.sap.melee_damage_delay = 0.1	
	
	--Binary Ruler--
	self.melee_weapons.meter.speed_mult = 0.95
	self.melee_weapons.meter.stats.min_damage = 12.5
	self.melee_weapons.meter.stats.max_damage = 31.3
	self.melee_weapons.meter.stats.min_damage_effect = 0.6
	self.melee_weapons.meter.stats.max_damage_effect = 0.8
	self.melee_weapons.meter.stats.charge_time = 2.9
	self.melee_weapons.meter.stats.range = 265
	self.melee_weapons.meter.stats.concealment = 21
	self.melee_weapons.meter.repeat_expire_t = 1.25
	self.melee_weapons.meter.melee_damage_delay = 0.6
	self.melee_weapons.meter.stats.remove_weapon_movement_penalty = true	
	
	--Clowns to the left of me, jokers to the right--
	self.melee_weapons.clean.speed_mult = 1
	self.melee_weapons.clean.stats.weapon_type = "sharp"
	self.melee_weapons.clean.stats.min_damage = 2
	self.melee_weapons.clean.stats.max_damage = 7.5
	self.melee_weapons.clean.stats.min_damage_effect = 0.1
	self.melee_weapons.clean.stats.max_damage_effect = 0.2
	self.melee_weapons.clean.stats.charge_time = 1.1
	self.melee_weapons.clean.stats.range = 120
	self.melee_weapons.clean.stats.concealment = 30
	self.melee_weapons.clean.repeat_expire_t = 0.325
	self.melee_weapons.clean.melee_damage_delay = 0.15	
	
	--Fleshlight--
	self.melee_weapons.aziz.speed_mult = 1.025
	self.melee_weapons.aziz.stats.min_damage = 2.5
	self.melee_weapons.aziz.stats.max_damage = 5
	self.melee_weapons.aziz.stats.min_damage_effect = 1.5
	self.melee_weapons.aziz.stats.max_damage_effect = 2
	self.melee_weapons.aziz.stats.charge_time = 0.65
	self.melee_weapons.aziz.stats.range = 140
	self.melee_weapons.aziz.repeat_expire_t = 0.825
	self.melee_weapons.aziz.stats.concealment = 28
	self.melee_weapons.aziz.melee_damage_delay = 0.175
	
	--HAHAHA EBIN CODE JOEK :DDDDDD--
	self.melee_weapons.happy.speed_mult = 1.15
	self.melee_weapons.happy.stats.min_damage = 2
	self.melee_weapons.happy.stats.max_damage = 5
	self.melee_weapons.happy.stats.min_damage_effect = 2.5
	self.melee_weapons.happy.stats.max_damage_effect = 4
	self.melee_weapons.happy.stats.charge_time = 1.1
	self.melee_weapons.happy.stats.range = 155
	self.melee_weapons.happy.stats.concealment = 30
	self.melee_weapons.happy.repeat_expire_t = 0.8
	self.melee_weapons.happy.melee_damage_delay = 0.1	
	
	-- https://i.imgur.com/8IJSRPZ.jpg --
	self.melee_weapons.shock.speed_mult = 0.875
	self.melee_weapons.shock.stats.min_damage = 3.2
	self.melee_weapons.shock.stats.max_damage = 7.5
	self.melee_weapons.shock.stats.min_damage_effect = 2
	self.melee_weapons.shock.stats.max_damage_effect = 5
	self.melee_weapons.shock.stats.charge_time = 1.85
	self.melee_weapons.shock.stats.range = 170
	self.melee_weapons.shock.repeat_expire_t = 0.8
	self.melee_weapons.shock.attack_allowed_expire_t = 0.1
	self.melee_weapons.shock.stats.concealment = 27
	self.melee_weapons.shock.melee_damage_delay = 0.1
	
	--and anotha tanto--
	self.melee_weapons.hauteur.speed_mult = 1.1
	self.melee_weapons.hauteur.stats.min_damage = 5
	self.melee_weapons.hauteur.stats.max_damage = 11
	self.melee_weapons.hauteur.stats.min_damage_effect = 0.3
	self.melee_weapons.hauteur.stats.max_damage_effect = 0.5
	self.melee_weapons.hauteur.stats.charge_time = 1.5
	self.melee_weapons.hauteur.stats.range = 150
	self.melee_weapons.hauteur.stats.concealment = 29
	self.melee_weapons.hauteur.repeat_expire_t = 0.75
	self.melee_weapons.hauteur.melee_damage_delay = 0.1

	--LET'S GO PRACTICE MEDICINE--
	self.melee_weapons.fear.dot_data = {
		type = "poison",
		custom_data = {dot_length = 1, hurt_animation_chance = 0.75}
	}
	self.melee_weapons.fear.speed_mult = 1
	self.melee_weapons.fear.hit_pre_calculation = false
	self.melee_weapons.fear.stats.min_damage = 2.5
	self.melee_weapons.fear.stats.max_damage = 5
	self.melee_weapons.fear.stats.min_damage_effect = 0.3
	self.melee_weapons.fear.stats.max_damage_effect = 0.3
	self.melee_weapons.fear.stats.charge_time = 1.6
	self.melee_weapons.fear.stats.range = 125
	self.melee_weapons.fear.repeat_expire_t = 0.5
	self.melee_weapons.fear.melee_damage_delay = 0.1
	self.melee_weapons.fear.stats.concealment = 30	
	self.melee_weapons.fear.info_id = "bm_melee_cqc_info"
end	

end