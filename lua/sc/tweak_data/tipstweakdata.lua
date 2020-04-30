local old_tips_init = TipsTweakData.init
function TipsTweakData:init()
	old_tips_init(self)

	--[[
	local hints = {	
		{ category = "sc_tip", cat_index = 1, image = "grenadier_load", force_image = true },	
		{ category = "sc_tip", cat_index = 2, image = "vet_cop_loading", force_image = true }		
	}
	for i, v in pairs(hints) do
		table.insert(self.tips, hints[i])
	end
	
	self.category_totals = {}
	for _, tip in ipairs(self.tips) do
		if not self.category_totals[tip.category] or tip.cat_index > self.category_totals[tip.category] then
			self.category_totals[tip.category] = tip.cat_index
		end
	end
	]]--

end