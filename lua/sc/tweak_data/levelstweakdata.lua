if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	Month = os.date("%m")
	--///LEVEL TYPES\\\--
	LevelsTweakData.LevelType = {}
	LevelsTweakData.LevelType.America = "america"
	LevelsTweakData.LevelType.Russia = "russia"
	LevelsTweakData.LevelType.Zombie = "zombie"
	LevelsTweakData.LevelType.Murkywater = "murkywater"
	LevelsTweakData.LevelType.NYPD = "nypd"
	LevelsTweakData.LevelType.LAPD = "lapd"
	--///LEVELS\\\--
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
		
		--///MURKYWATER LEVELS\\\--
		self.shoutout_raid.package = {"packages/murkyassets", "packages/outfitassets", "packages/vlad_shout"}
		self.shoutout_raid.ai_group_type = murkywater
		self.shoutout_raid.player_sequence = "spawn_prop_raincoat"
		
		self.pbr.package = {"packages/murkyassets", "packages/outfitassets", "packages/narr_jerry1"}
		self.pbr.ai_group_type = murkywater
		self.pbr.player_sequence = "spawn_prop_loud_suit"
		
		self.des.package = {"packages/murkyassets", "packages/job_des"}
		self.des.ai_group_type = murkywater 
		
		self.bph.package = {"packages/murkyassets", "packages/dlcs/bph/job_bph"}
		self.bph.ai_group_type = murkywater 
		
		self.vit.package = {"packages/murkyassets", "packages/dlcs/vit/job_vit"}
		self.vit.ai_group_type = murkywater 
		
		self.wwh.package = {"packages/murkyassets", "packages/lvl_wwh"}
		self.wwh.ai_group_type = murkywater 
		
		self.arm_for.package = {"packages/murkyassets", "packages/outfitassets", "packages/narr_arm_for"}
		self.arm_for.ai_group_type = murkywater 
		self.arm_for.player_sequence = "spawn_prop_sneak_suit"
		
		--///NYPD LEVELS\\\--
		self.spa.ai_group_type = nypd
		self.spa.package = {"packages/job_spa", "packages/nypdassets", "levels/narratives/dentist/mia/stage2/world_sounds"}
		
		self.brb.ai_group_type = nypd
		self.brb.package = {"packages/lvl_brb", "packages/nypdassets"}
		
		self.red2.ai_group_type = nypd
		self.red2.package = {"packages/narr_red2", "packages/nypdassets"}
		
		self.run.ai_group_type = nypd
		self.run.package = {"packages/narr_run", "packages/nypdassets"}
		
		self.flat.ai_group_type = nypd
		self.flat.package = {"packages/narr_flat", "packages/nypdassets"}
		
		self.glace.ai_group_type = nypd
		self.glace.package = {"packages/narr_glace", "packages/nypdassets"}
		
		self.dah.ai_group_type = nypd
		self.dah.package = {"packages/lvl_dah", "packages/nypdassets"}
		
		self.dinner.ai_group_type = nypd
		self.dinner.package = {"packages/narr_dinner", "packages/outfitassets", "packages/nypdassets"}
		self.dinner.player_sequence = "spawn_prop_loud_suit"
		
		self.man.package = {"packages/narr_man", "packages/outfitassets"}
		self.man.player_sequence = "spawn_prop_loud_suit"
		
		self.nmh.ai_group_type = nypd
		self.nmh.package = {"packages/dlcs/nmh/job_nmh", "packages/nypdassets"}
		
		self.skm_run.ai_group_type = nypd
		self.skm_run.package = {"packages/dlcs/skm/job_skm", "packages/nypdassets"}
		
		self.skm_red2.ai_group_type = nypd
		self.skm_red2.package = {"packages/dlcs/skm/job_skm", "packages/nypdassets"}
		
		--///LAPD LEVELS\\\--			
		self.jolly.ai_group_type = lapd
		self.jolly.package = {"packages/jolly", "packages/narr_rvd", "levels/narratives/dentist/mia/stage2/world_sounds", "packages/nypdassets"}
		
		self.pal.ai_group_type = lapd
		self.pal.package = {"packages/narr_pal", "packages/narr_rvd", "packages/nypdassets"}		
		
		self.kenaz.ai_group_type = lapd
		self.kenaz.package = {"packages/kenaz", "packages/narr_rvd", "packages/nypdassets"}			
		
		self.rvd1.ai_group_type = lapd
		self.rvd1.package = {"packages/job_rvd", "packages/nypdassets"}			
		
		self.rvd2.ai_group_type = lapd
		self.rvd2.package = {"packages/job_rvd2", "packages/nypdassets"}

        --///NEW OUTFITS\\\--
		
		self.arm_cro.package = {"packages/outfitassets", "packages/narr_arm_cro"}
		self.arm_cro.player_sequence = "spawn_prop_loud_suit"	
		
		self.arm_hcm.package = {"packages/outfitassets", "packages/narr_arm_hcm"}
		self.arm_hcm.player_sequence = "spawn_prop_loud_suit"		
		
		self.arm_fac.package = {"packages/outfitassets", "packages/narr_arm_fac"}
		self.arm_fac.player_sequence = "spawn_prop_loud_suit"	
		
		self.arm_par.package = {"packages/outfitassets", "packages/narr_arm_par"}
		self.arm_par.player_sequence = "spawn_prop_loud_suit"			
		
		self.arm_und.package = {"packages/outfitassets", "packages/narr_arm_und"}
		self.arm_und.player_sequence = "spawn_prop_loud_suit"	
		
		self.arm_und.package = {"packages/outfitassets", "packages/narr_arm_und"}
		self.arm_und.player_sequence = "spawn_prop_loud_suit"	
		
		--[[self.crojob2.package = {"packages/outfitassets", "narr goes here"}
		self.crojob2.player_sequence = "spawn_prop_sneak_suit"	
		
		self.crojob3.package = {"packages/outfitassets", "narr goes here"}
		self.crojob3.player_sequence = "spawn_prop_loud_suit"]]--
        --commented out becuase i really dont know how to find the correct narr package		
		
		--///GANGSTER VOICEOVER\\\--
		self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage2/world_sounds"}
		self.friend.package = {"packages/lvl_friend", "levels/narratives/h_alex_must_die/stage_1/world_sounds"}
		self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage2/world_sounds"}
		
		--///ZOMBIE LEVELS\\\--
		self.haunted.package = {"packages/zombieassets", "packages/narr_haunted", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.nail.package = {"packages/zombieassets", "packages/job_nail", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.help.package = {"packages/zombieassets", "packages/lvl_help", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
		self.hvh.package = {"packages/zombieassets", "packages/narr_hvh"}
		self.haunted.ai_group_type = zombie		
		self.nail.ai_group_type = zombie
		self.help.ai_group_type = zombie
		--///SAFEHOUSE\\\--
		self.chill.ghost_bonus = nil
		
		--///REAPER LEVELS\\\--
		self.mad.package = {"packages/akanassets", "packages/lvl_mad", "packages/outfitassets"}
		self.mad.player_sequence = "spawn_prop_winter_suit"
	
	end)
	
end
