local old_init_risk_assets = AssetsTweakData._init_risk_assets
function AssetsTweakData:_init_risk_assets(tweak_data)
	old_init_risk_assets(self, tweak_data)
	
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		self.risk_easy_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_4_sc"
		self.risk_death_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_5_sc"
	end

	--Slaughterhouse safe--
	self.dinner_safe = {}
	self.dinner_safe.name_id = "menu_asset_dinner_safe"
	self.dinner_safe.texture = "guis/textures/pd2/mission_briefing/assets/heist_vlad_asset04_df"
	self.dinner_safe.stages = {"dinner"}

	--Oh my god JC--
	self.bomb_loot = {}
	self.bomb_loot.name_id = "menu_asset_bomb_inside_info"
	self.bomb_loot.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_1/assets_crojob_insiderinfo_bomb"
	self.bomb_loot.stages = {"crojob2"}

	--wet floor--
	self.wet_intel = {}
	self.wet_intel.name_id = "menu_asset_wet_intel"
	self.wet_intel.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_intel"
	self.wet_intel.stages = {"wetwork"}	
	
	--Adding Bikers to Biker heist cause it makes sense--
	self.jungle_1_bikers.stages = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"born",
		"chew"
	}
end