if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	Month = os.date("%m")

	LevelsTweakData.LevelType = {}
	LevelsTweakData.LevelType.America = "america"
	LevelsTweakData.LevelType.Russia = "russia"
	LevelsTweakData.LevelType.Zombie = "zombie"
	LevelsTweakData.LevelType.Murkywater = "murkywater"
	LevelsTweakData.LevelType.NYPD = "nypd"
	LevelsTweakData.LevelType.LAPD = "lapd"

	Hooks:PostHook( LevelsTweakData, "init", "SC_levels", function(self)
		
		local america = LevelsTweakData.LevelType.America
		local russia = LevelsTweakData.LevelType.Russia
		local zombie = LevelsTweakData.LevelType.Zombie
		local murkywater = LevelsTweakData.LevelType.Murkywater
		local nypd = LevelsTweakData.LevelType.NYPD
		local lapd = LevelsTweakData.LevelType.LAPD
		self.ai_groups = {}
		self.ai_groups.default = america
		self.ai_groups.america = america
		self.ai_groups.russia = russia
		self.ai_groups.zombie  = zombie
		self.ai_groups.murkywater = murkywater
		self.ai_groups.nypd = nypd
		self.ai_groups.lapd = lapd
		
		--Murkywater faction--
		self.shoutout_raid.ai_group_type = murkywater
		
		self.pbr.ai_group_type = murkywater
				
		self.des.ai_group_type = murkywater 
		
		self.bph.ai_group_type = murkywater 
		
		self.vit.ai_group_type = murkywater 
		
		self.wwh.ai_group_type = murkywater 
		
		self.arm_for.ai_group_type = murkywater 
		
		--NYPD--
		self.spa.ai_group_type = nypd
		self.brb.ai_group_type = nypd
		
		self.red2.ai_group_type = nypd
		self.run.ai_group_type = nypd
		self.flat.ai_group_type = nypd
		self.glace.ai_group_type = nypd
		
		self.dah.ai_group_type = nypd
		
		self.dinner.ai_group_type = nypd
		self.dinner.package = {"packages/narr_dinner", "packages/lvl_dah"}
		self.dinner.player_sequence = "spawn_prop_sneak_suit"
		
		self.man.package = {"packages/narr_man", "packages/lvl_dah"}	
		self.man.player_sequence = "spawn_prop_sneak_suit"
		
		self.nmh.ai_group_type = nypd
		
		self.skm_run.ai_group_type = nypd
		self.skm_red2.ai_group_type = nypd
		
		--LAPD--			
		self.jolly.ai_group_type = lapd
		self.jolly.package = {"packages/jolly", "packages/narr_rvd"}
		
		self.pal.ai_group_type = lapd
		self.pal.package = {"packages/narr_pal", "packages/narr_rvd"}		
		
		self.kenaz.ai_group_type = lapd
		self.kenaz.package = {"packages/kenaz", "packages/narr_rvd"}			
		
		self.rvd1.ai_group_type = lapd
		self.rvd2.ai_group_type = lapd
		
		
		--Gangster VO below--
		self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage2/world_sounds"}
		self.friend.package = {"packages/lvl_friend", "levels/narratives/h_alex_must_die/stage_1/world_sounds"}
		self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage2/world_sounds"}
		
		--Halloween enemies on halloween maps--
		self.haunted.package = {"packages/narr_haunted", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.nail.package = {"packages/job_nail", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.help.package = {"packages/lvl_help", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.haunted.ai_group_type = zombie		
		self.nail.ai_group_type = zombie
		self.help.ai_group_type = zombie
		
		self.chill.ghost_bonus = nil
		
		self.mad.package = {"packages/lvl_wwh"}
		self.mad.player_sequence = "spawn_prop_winter_suit"
	
	end)
	
end
