if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	Month = os.date("%m")

	LevelsTweakData.LevelType = {}
	LevelsTweakData.LevelType.America = "america"
	LevelsTweakData.LevelType.Russia = "russia"
	LevelsTweakData.LevelType.Zombie = "zombie"
	LevelsTweakData.LevelType.Murky = "murky"
	LevelsTweakData.LevelType.NYPD = "nypd"

	Hooks:PostHook( LevelsTweakData, "init", "SC_levels", function(self)
		
		local america = LevelsTweakData.LevelType.America
		local russia = LevelsTweakData.LevelType.Russia
		local zombie = LevelsTweakData.LevelType.Zombie
		local murky = LevelsTweakData.LevelType.Murky
		local nypd = LevelsTweakData.LevelType.NYPD
		self.ai_groups = {}
		self.ai_groups.default = america
		self.ai_groups.america = america
		self.ai_groups.russia = russia
		self.ai_groups.zombie  = zombie
		self.ai_groups.murky = murky
		self.ai_groups.nypd = nypd
		
		--Murky faction--
		self.shoutout_raid.ai_group_type = murky
		self.shoutout_raid.package = {"packages/vlad_shout", "levels/narratives/dentist/mia/stage1/world_sounds", "levels/narratives/h_alex_must_die/stage_2/world_sounds", "levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds"}
		
		self.pbr.ai_group_type = murky
		self.pbr.package = {"packages/narr_jerry1", "levels/narratives/dentist/mia/stage1/world_sounds", "levels/narratives/h_alex_must_die/stage_2/world_sounds", "levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds"}
				
		self.des.ai_group_type = murky 
		self.des.package = {"packages/job_des", "levels/narratives/dentist/mia/stage1/world_sounds", "levels/narratives/h_alex_must_die/stage_2/world_sounds", "levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds"}
		
		--NYPD--
		self.spa.ai_group_type = nypd
		self.brb.ai_group_type = nypd
		
		self.red2.ai_group_type = nypd
		self.run.ai_group_type = nypd
		self.flat.ai_group_type = nypd
		self.glace.ai_group_type = nypd
		self.dah.ai_group_type = nypd
		self.dinner.ai_group_type = nypd
		
		self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage1/world_sounds"}
		self.friend.package = {"packages/lvl_friend", "levels/narratives/h_alex_must_die/stage_1/world_sounds"}
		--Stuff for Summers below--
		self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage1/world_sounds", "levels/narratives/elephant/mad/world_sounds"}
		self.welcome_to_the_jungle_2.package = {"packages/narr_jungle2", "levels/narratives/elephant/mad/world_sounds"}
		self.gallery.package = {"packages/narr_framing_1", "levels/narratives/elephant/mad/world_sounds"}
		self.man.package = {"packages/narr_man", "levels/narratives/elephant/mad/world_sounds"}
		self.firestarter_3.package = {"packages/narr_firestarter3", "levels/narratives/elephant/mad/world_sounds"}
		self.jolly.package = {"packages/jolly", "levels/narratives/elephant/mad/world_sounds"}
		self.rvd1.package = {"packages/job_rvd", "levels/narratives/elephant/mad/world_sounds"}
		
		--Halloween enemies on halloween maps--
		self.haunted.package = {"packages/narr_haunted", "packages/narr_hvh"}
		self.nail.package = {"packages/job_nail", "packages/narr_hvh"}
		self.help.package = {"packages/lvl_help", "packages/narr_hvh"}
		if restoration and restoration.Options:GetValue("SC/Holiday") then
			self.haunted.ai_group_type = zombie		
			self.nail.ai_group_type = zombie
			self.help.ai_group_type = zombie
		end
		
		self.chill.ghost_bonus = nil
	end)
	
end