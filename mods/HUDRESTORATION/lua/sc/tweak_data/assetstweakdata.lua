if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_init_risk_assets = AssetsTweakData._init_risk_assets
function AssetsTweakData:_init_risk_assets(tweak_data)
	old_init_risk_assets(self, tweak_data)
	self.risk_easy_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_4_sc"
	self.risk_death_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_5_sc"
end

end