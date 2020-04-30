old_DLCTweakData_init = DLCTweakData.init
function DLCTweakData:init(...)
	old_DLCTweakData_init(self, ...)
			
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
	
	self.sc = {}
	self.sc.free = true
	self.sc.content = {}
	self.sc.content.loot_global_value = "sc"
	self.sc.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_bonus_sc_none",
			amount = 1
		}				
	}	
	
	if Steam:is_user_in_source(Steam:userid(), "103582791466033055") then
		self.omnia = {
			content = {},
			free = true
		}
		self.omnia.content.loot_global_value = "rest_omnia"
		self.omnia.content.loot_drops = {
			{
				type_items = "masks",
				item_entry = "all_seeing",
				amount = 1
			},
			{
				type_items = "masks",
				item_entry = "classic_helmet",
				amount = 1
			}				
		}	
	end
	if Steam:is_user_in_source(Steam:userid(), "103582791465743585") then
		self.omnia_2 = {
			content = {},
			free = true
		}
		self.omnia_2.content.loot_global_value = "rest_omnia"
		self.omnia_2.content.loot_drops = {
			{
				type_items = "masks",
				item_entry = "cube",
				amount = 1
			}			
		}	
	end			
		
end