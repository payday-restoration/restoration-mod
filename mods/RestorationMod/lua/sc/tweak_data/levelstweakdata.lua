if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	LevelsTweakData.LevelType.Murky = "murky"

	local old_ltd_init = LevelsTweakData.init
	function LevelsTweakData:init()
		old_ltd_init(self, tweak_data)
		
		local america = LevelsTweakData.LevelType.America
		local russia = LevelsTweakData.LevelType.Russia
		local murky = LevelsTweakData.LevelType.Murky
		self.ai_groups = {}
		self.ai_groups.default = america
		self.ai_groups.america = america
		self.ai_groups.russia = russia
		self.ai_groups.murky = murky
		
		--Murky test--
		--self.shoutout_raid.ai_group_type = murky
		--self.pbr.ai_group_type = murky
		
		if Global.load_level == true and not PackageManager:loaded("packages/job_nail") then
			PackageManager:load("packages/job_nail")
		end
		if Global.load_level == true and not PackageManager:loaded("packages/lvl_help") then
			PackageManager:load("packages/lvl_help")
			end
		if Global.load_level == true and not PackageManager:loaded("packages/lvl_mad") then
			PackageManager:load("packages/lvl_mad")
		end
		self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage1/world_sounds"}
		self.friend.package = {"packages/lvl_friend", "levels/narratives/h_alex_must_die/stage_1/world_sounds"}
		--Stuff for Summers below--
		self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage1/world_sounds", "levels/narratives/elephant/mad/world_sounds"}
		self.welcome_to_the_jungle_2.package = {"packages/narr_jungle2", "levels/narratives/elephant/mad/world_sounds"}
		self.gallery.package = {"packages/narr_framing_1", "levels/narratives/elephant/mad/world_sounds"}
		self.pal.package = {"packages/narr_pal", "levels/narratives/elephant/mad/world_sounds"}
		self.mia_2.package = {"packages/narr_mia_2", "levels/narratives/elephant/mad/world_sounds"}
		self.firestarter_3.package = {"packages/narr_firestarter3", "levels/narratives/elephant/mad/world_sounds"}
		self.jolly.package = {"packages/jolly", "levels/narratives/elephant/mad/world_sounds"}
		self.peta.package = {"packages/narr_peta", "levels/narratives/elephant/mad/world_sounds"}
	end

end