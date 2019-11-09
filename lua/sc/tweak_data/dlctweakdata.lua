old_DLCTweakData_init = DLCTweakData.init
function DLCTweakData:init(...)
	old_DLCTweakData_init(self, ...)
	
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		self.rest = {
			content = {},
			free = true
		}
		self.rest.content.loot_drops = {}
		self.rest.content.upgrades = {}	
		self.wetwork_masks = {
			content = {},
			free = true
		}
		self.wetwork_masks.content.loot_global_value = "rest"
		self.wetwork_masks.content.loot_drops = {
			{
				type_items = "masks",
				item_entry = "shatter_true",
				amount = 1
			},		
			{
				type_items = "masks",
				item_entry = "canada",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "jsr",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "jsrf",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "courier_stash",
				amount = 1
			},		
			{
				type_items = "masks",
				item_entry = "female_mask",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "female_mask_blood",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "female_mask_clown",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "male_mask",
				amount = 1
			},		
			{
				type_items = "masks",
				item_entry = "male_mask_blood",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "male_mask_clown",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "twister_mask",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "voodoo_mask",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "f1",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "sweettooth",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "dallas_aged",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "chains_aged",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "hoxton_aged",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "wolf_aged",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "beef_dallas",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "beef_chains",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "beef_hoxton",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "beef_wolf",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "vyse_dallas",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "vyse_chains",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "vyse_hoxton",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "vyse_wolf",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "secret_old_hoxton",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "wolf_stone",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "jkl_matt01",
				amount = 1
			},
			{
				type_items = "materials",
				item_entry = "jkl_matt02",
				amount = 1
			},	
			{
				type_items = "textures",
				item_entry = "jkl_patt01",
				amount = 1
			},		
			{
				type_items = "textures",
				item_entry = "jkl_patt02",
				amount = 1
			}			
		}
	end
	
	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then
		self.sc = {}
		self.sc.free = true
		self.sc.content = {}
		self.sc.content.loot_global_value = "sc"
		self.sc.content.loot_drops = {
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_half_that",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_mag_msr",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_46custom",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_vg_ass_smg_verticalgrip",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_vg_ass_smg_stubby",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_vg_ass_smg_afg",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_m4_m_drum",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_upg_ak_m_drum",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_smg_mp5_m_drum",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_762_sterling",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_bonus_sc_none",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_upg_saiga_m_20rnd",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_p",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_ammo_40sw",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_smg_p90_body_p90_tan",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_extra_mp_unlock",
				amount = 3
			},
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_shot_r870_s_folding_ext",
				amount = 3
			},						
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_i_slower_rof",
				amount = 3
			},	
			{
				type_items = "weapon_mods",
				item_entry = "wpn_lmg_rpk_m_ban",
				amount = 3
			},				
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_i_93r",
				amount = 3
			},				
			{
				type_items = "weapon_mods",
				item_entry = "wpn_fps_upg_i_faster_rof",
				amount = 3
			}					
		}
	end
end