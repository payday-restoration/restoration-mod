CustomSafehouseTweakData._init_trophies_roberts_v2_1 = CustomSafehouseTweakData._init_trophies

function CustomSafehouseTweakData:_init_trophies(...)
	CustomSafehouseTweakData:_init_trophies_roberts_v2_1(...)
	
	table.insert(self.trophies, {
		name_id = "trophy_csgo01",
		image_id = "safehouse_trophies_preview_csgo01",
		objective_id = "trophy_csgo01_objective",
		id = "trophy_csgo01",
		desc_id = "trophy_csgo01_desc",
		objectives = {
			self:_progress("trophy_csgo01", 1)
		}
	})
end