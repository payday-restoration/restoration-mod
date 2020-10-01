function TipsTweakData:init()
	self.tips = {
		{
			cat_index = 1,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 2,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 3,
			image = "enemy_zeal",
			consoles = true,
			category = "gameplay_res"
		},
		{
			cat_index = 4,
			image = "enemy_tazer",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 5,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 6,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 7,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 8,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 9,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},
		{
			cat_index = 10,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},
		{
			cat_index = 11,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 12,
			image = "enemy_bulldozer",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 13,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 14,
			image = "enemy_cloaker",
			consoles = true,
			category = "gameplay_res"
		},		
		{
			cat_index = 15,
			image = "enemy_flashbang",
			consoles = true,
			category = "gameplay_res"
		},		
		{
			cat_index = 16,
			image = "weapon_melee",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 17,
			image = "general_difficulty",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 18,
			image = "weapon_melee",
			consoles = true,
			category = "gameplay_res"
		},		
		{
			cat_index = 19,
			image = "enemy_sniper",
			consoles = true,
			category = "gameplay_res"
		},		
		{
			cat_index = 20,
			image = "tactics_convert",
			consoles = true,
			category = "gameplay_res"
		},	
		{
			cat_index = 21,
			image = "enemy_gensec",
			consoles = true,
			category = "gameplay_res"
		},		
	}
	self.category_totals = {}

	for _, tip in ipairs(self.tips) do
		if not self.category_totals[tip.category] or self.category_totals[tip.category] < tip.cat_index then
			self.category_totals[tip.category] = tip.cat_index
		end
	end
end
