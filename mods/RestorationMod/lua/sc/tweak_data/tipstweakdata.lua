if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_tips_init = TipsTweakData.init
function TipsTweakData:init()
	old_tips_init(self)

	--[[
	Custom Hints maybe?

	local dicks = {	
		{ category = "sc_tip", cat_index = 1, image = "weapon_shotgun", force_image = true }		
	}
	for i, v in pairs(dicks) do
		table.insert(self.tips, dicks[i])
	end

	]]--
	
	self.category_totals = {}
	for _, tip in ipairs(self.tips) do
		if not self.category_totals[tip.category] or tip.cat_index > self.category_totals[tip.category] then
			self.category_totals[tip.category] = tip.cat_index
		end
	end

end

end