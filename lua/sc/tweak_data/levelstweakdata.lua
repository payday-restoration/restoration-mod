Month = os.date("%m")
--///LEVEL TYPES\\\--
LevelsTweakData.LevelType = {}
LevelsTweakData.LevelType.America = "america"
LevelsTweakData.LevelType.Russia = "russia"
LevelsTweakData.LevelType.Zombie = "zombie"
LevelsTweakData.LevelType.Murkywater = "murkywater"
LevelsTweakData.LevelType.Federales = "federales"
LevelsTweakData.LevelType.NYPD = "nypd"
LevelsTweakData.LevelType.LAPD = "lapd"
--///LEVELS\\\--
Hooks:PostHook( LevelsTweakData, "init", "SC_levels", function(self)
	
	local america = LevelsTweakData.LevelType.America
	local russia = LevelsTweakData.LevelType.Russia
	local zombie = LevelsTweakData.LevelType.Zombie
	local murkywater = LevelsTweakData.LevelType.Murkywater
	local nypd = LevelsTweakData.LevelType.NYPD
	local federales = LevelsTweakData.LevelType.Federales		
	local lapd = LevelsTweakData.LevelType.LAPD
	self.ai_groups = {}
	self.ai_groups.default = america
	self.ai_groups.america = america
	self.ai_groups.russia = russia
	self.ai_groups.zombie  = zombie
	self.ai_groups.murkywater = murkywater
	self.ai_groups.federales = federales
	self.ai_groups.nypd = nypd
	self.ai_groups.lapd = lapd
	
	--///MEXICAN LEVELS\\\--
	self.bex.package = {"packages/mexicoassets", "packages/job_bex"}
	
	self.skm_bex.package = {"packages/dlcs/skm/job_bex_skm", "packages/mexicoassets"}

	self.mex_cooking.package = {"packages/mexicoassets", "levels/narratives/h_alex_must_die/stage_1/world_sounds", "levels/narratives/vlad/bex/world_sounds", "packages/job_bex", "packages/job_mex2"}
	self.mex_cooking.ai_group_type = federales 
	self.mex_cooking.player_style = "suit_sunny"	
	
	--///MURKYWATER LEVELS\\\--
	self.shoutout_raid.package = {"packages/murkyassets", "packages/vlad_shout"}
	self.shoutout_raid.ai_group_type = murkywater
	self.shoutout_raid.player_style = "loud_suit" --using this until we sort out the coats
	
	self.pbr.package = {"packages/murkyassets", "packages/narr_jerry1"}
	self.pbr.ai_group_type = murkywater
	self.pbr.player_style = "loud_suit"
	
	self.des.package = {"packages/murkyassets", "packages/job_des"}
	self.des.ai_group_type = murkywater 
	self.des.player_style = "loud_suit"
	
	self.bph.package = {"packages/murkyassets", "packages/dlcs/bph/job_bph"}
	self.bph.ai_group_type = murkywater 
	self.bph.player_style = "loud_suit"
	
	self.vit.package = {"packages/murkyassets", "packages/dlcs/vit/job_vit"}
	self.vit.ai_group_type = murkywater 
	
	self.wwh.package = {"packages/murkyassets", "packages/lvl_wwh"}
	self.wwh.ai_group_type = murkywater 
	
	self.arm_for.package = {"packages/murkyassets", "packages/narr_arm_for", "packages/addbdu"}
	self.arm_for.ai_group_type = murkywater 
	self.arm_for.player_style = "sneak_suit"
	
	self.mex.package = {"packages/murkyassets", "levels/narratives/h_alex_must_die/stage_1/world_sounds", "packages/job_mex"}
	self.mex.ai_group_type = murkywater 
	self.mex.player_style = "suit_sunny"	

	self.crojob2.package = {"packages/dlcs/the_bomb/crojob_stage_2", "packages/addslaughter", "packages/murkyassets"}
	self.crojob2.ai_group_type = murkywater			
	self.crojob2.player_style = "slaughterhouse"	

	self.dark.package = {"packages/job_dark", "packages/addbdu", "packages/murkyassets"}
	self.dark.ai_group_type = murkywater	
	self.dark.player_style = "sneak_suit"
	
	self.kosugi.package = {"packages/kosugi", "packages/addbdu", "packages/murkyassets"}
	self.kosugi.ai_group_type = murkywater	
	self.kosugi.player_style = "sneak_suit"			
	
	--///NYPD LEVELS\\\--
	self.spa.ai_group_type = nypd
	self.spa.package = {"packages/job_spa", "packages/nypdassets", "packages/addslaughter", "levels/narratives/dentist/mia/stage2/world_sounds"}
	self.spa.player_style = "slaughterhouse"
	
	self.brb.ai_group_type = nypd
	self.brb.package = {"packages/lvl_brb", "packages/nypdassets", "packages/addsnow"}
	self.brb.player_style = "winter_suit"
	
	self.red2.ai_group_type = nypd
	self.red2.package = {"packages/narr_red2", "packages/nypdassets"}
	
	self.run.ai_group_type = nypd
	self.run.package = {"packages/narr_run", "packages/nypdassets"}
	
	self.flat.ai_group_type = nypd
	self.flat.package = {"packages/narr_flat", "packages/nypdassets"}
	
	self.glace.ai_group_type = nypd
	self.glace.package = {"packages/narr_glace", "packages/nypdassets"}
	
	self.dah.ai_group_type = nypd
	self.dah.package = {"packages/lvl_dah", "packages/nypdassets", "packages/addslaughter"}
	self.dah.player_style = "slaughterhouse"
	
	self.dinner.ai_group_type = nypd
	self.dinner.package = {"packages/narr_dinner", "packages/nypdassets", "packages/addslaughter"}
	self.dinner.player_style = "slaughterhouse"
	
	self.man.package = {"packages/narr_man", "packages/addslaughter"}
	self.man.player_style = "slaughterhouse"
	self.man.teams = {
		criminal1 = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {
				converted_enemy = true
			}
		},
		law1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true
			},
			friends = {
				mobster1 = true
			}
		},
		mobster1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true
			},
			friends = {
				law1 = true
			}
		},
		converted_enemy = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {
				criminal1 = true
			}
		},
		neutral1 = {
			foes = {},
			friends = {}
		},
		hacked_turret = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {}
		}
	}
	
	self.nmh.ai_group_type = nypd
	self.nmh.package = {"packages/dlcs/nmh/job_nmh", "packages/nypdassets"}
	self.nmh.ghost_bonus = nil
	
	self.skm_run.ai_group_type = nypd
	self.skm_run.package = {"packages/dlcs/skm/job_skm", "packages/nypdassets"}
	
	self.skm_red2.ai_group_type = nypd
	self.skm_red2.package = {"packages/dlcs/skm/job_skm", "packages/nypdassets"}
	
	--///LAPD LEVELS\\\--			
	self.jolly.ai_group_type = lapd
	self.jolly.package = {"packages/jolly", "packages/narr_rvd", "levels/narratives/dentist/mia/stage2/world_sounds", "packages/nypdassets"}
	self.jolly.player_style = "suit_sunny"
	
	self.pal.ai_group_type = lapd
	self.pal.package = {"packages/narr_pal", "packages/narr_rvd", "packages/nypdassets"}	
	
	self.friend.ai_group_type = lapd
	self.friend.package = {"levels/narratives/h_alex_must_die/stage_1/world_sounds", "packages/lvl_friend", "packages/nypdassets", "packages/narr_rvd"}
	self.friend.player_style = "suit_sunny"
	
	self.kenaz.ai_group_type = lapd
	self.kenaz.package = {"packages/kenaz", "packages/narr_rvd", "packages/nypdassets", "packages/addtux"}	
	self.kenaz.player_style = "tux"				
	
	self.rvd1.ai_group_type = lapd
	self.rvd1.package = {"packages/job_rvd", "packages/nypdassets"}	
	self.rvd1.player_style = "suit_sunny"		
	
	self.rvd2.ai_group_type = lapd
	self.rvd2.package = {"packages/job_rvd2", "packages/nypdassets"}
	self.rvd2.player_style = "suit_sunny"

	--///NEW OUTFITS\\\--
	
	self.fish.package = {"packages/lvl_fish", "packages/nypdassets", "packages/addtux"}
	self.fish.player_style = "tux"
	
	self.arm_cro.package = {"packages/narr_arm_cro", "packages/addslaughter"}
	self.arm_cro.player_style = "slaughterhouse"
	
	self.arm_hcm.package = {"packages/narr_arm_hcm", "packages/addslaughter"}
	self.arm_hcm.player_style = "slaughterhouse"	
	
	self.arm_fac.package = {"packages/narr_arm_fac", "packages/addslaughter"}
	self.arm_fac.player_style = "slaughterhouse"
	
	self.arm_par.package = {"packages/narr_arm_par", "packages/addslaughter"}
	self.arm_par.player_style = "slaughterhouse"		
	
	self.arm_und.package = {"packages/narr_arm_und", "packages/addscrubs"}
	self.arm_und.player_style = "scrub"
							
	self.hox_1.package = {"packages/narr_hox_1", "packages/addslaughter"}
	self.hox_1.player_style = "slaughterhouse"
	self.hox_2.package = {"packages/narr_hox_2", "packages/addslaughter"}
	self.hox_2.player_style = "slaughterhouse"
	self.hox_3.package = {"packages/narr_hox_3", "packages/addslaughter"}
	self.hox_3.player_style = "slaughterhouse"
	
	self.rat.player_style = "suit_sunny"
	
	self.election_day_1.package = {"packages/narr_election1", "packages/addbdu"}
	self.election_day_1.player_style = "sneak_suit"	
	self.election_day_2.package = {"packages/narr_election2", "packages/addbdu"}
	self.election_day_2.player_style = "sneak_suit"
	
	self.gallery.package = {"packages/narr_framing_1", "packages/addbdu"}
	self.gallery.player_style = "sneak_suit"
	self.framing_frame_1.player_style = "sneak_suit"
	self.framing_frame_1.package = {"packages/narr_framing_1", "packages/addbdu"}
	self.framing_frame_3.player_style = "sneak_suit"
	self.framing_frame_3.package = {"packages/narr_framing_3", "packages/addbdu"}
			
	self.alex_1.player_style = "suit_sunny"
	self.alex_2.player_style = "suit_sunny"
	self.alex_3.package = {"packages/narr_alex3", "packages/addslaughter"}
	self.alex_3.player_style = "slaughterhouse"
	
	self.welcome_to_the_jungle_1.player_style = "suit_sunny"
	self.welcome_to_the_jungle_1_night.player_style = "suit_sunny"
	
	self.welcome_to_the_jungle_2.package = {"packages/narr_jungle2", "packages/addbdu"}
	self.welcome_to_the_jungle_2.player_style = "sneak_suit"
	
	self.chew.player_style = "loud_suit"
	
	self.pbr2.player_style = "loud_suit"
	
	self.watchdogs_1.player_style = "suit_sunny"
	self.watchdogs_2.player_style = "loud_suit"
	
	self.watchdogs_1_night.player_style = "suit_sunny"
	self.watchdogs_2_day.player_style = "loud_suit"
	
	self.mia_1.player_style = "suit_sunny"
	self.mia_2.player_style = "suit_sunny"
	
	self.cane.package = {"packages/cane", "packages/addsnow", "levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds"}
	self.cane.player_style = "winter_suit"
							
	self.mus.package = {"packages/narr_mus", "packages/addbdu"}
	self.mus.player_style = "sneak_suit"
	
	--///GANGSTER VOICEOVER\\\--
	self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage2/world_sounds"}
	self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage2/world_sounds"}
	
	--///ZOMBIE LEVELS\\\--
	self.haunted.package = {"packages/zombieassets", "packages/narr_haunted", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
	self.nail.package = {"packages/zombieassets", "packages/job_nail", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
	self.help.package = {"packages/zombieassets", "packages/lvl_help", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds"}
	self.hvh.package = {"packages/zombieassets", "packages/narr_hvh"}
	
	self.haunted.ai_group_type = zombie		
	self.nail.ai_group_type = zombie
	self.help.ai_group_type = zombie
	
	self.hvh.player_style = "suit_prison"	
	self.haunted.player_style = "suit_prison"	
	self.nail.player_style = "suit_prison"
	self.help.player_style = "suit_prison"
	--///SAFEHOUSE\\\--
	self.chill.ghost_bonus = nil
	
	self.cage.ghost_bonus = nil
	
	self.mallcrasher.ghost_bonus = 0.05
	
	--///REAPER LEVELS\\\--
	self.mad.package = {"packages/akanassets", "packages/lvl_mad", "packages/addsnow"}
	self.mad.player_style = "winter_suit"
	--We're never actually told where the forest is ;)
	self.pines.package = {"packages/narr_pines", "packages/akanassets", "packages/lvl_mad",}
	self.pines.player_style = "loud_suit"
	self.pines.ai_group_type = russia	
	
	--Bomb: Forest--
	self.crojob3.package = {"packages/dlcs/the_bomb/crojob_stage_3", "packages/akanassets", "packages/lvl_mad",}
	self.crojob3.ai_group_type = russia			
	self.crojob3.player_style = "loud_suit"

	self.crojob3_night.package = {"packages/dlcs/the_bomb/crojob_stage_3_night", "packages/akanassets", "packages/lvl_mad",}
	self.crojob3_night.ai_group_type = russia				
	self.crojob3_night.player_style = "loud_suit"		
	
	--///BAG FIXES\\\--
	self.pbr2.max_bags = 20
	self.spa.max_bags = 8
	self.fish.max_bags = 20
	--White House Heist Stelf Bonus--		
	self.vit.ghost_bonus = 0.15
end)

function LevelsTweakData:get_ai_group_type()
	if managers.mutators and managers.mutators:is_mutator_active(MutatorFactionsReplacer) then
		local MutatorCheck = managers.mutators:get_mutator(MutatorFactionsReplacer) or nil
		if MutatorCheck and MutatorCheck:get_faction_override() and MutatorCheck:get_faction_override() == "america" then
			return self.ai_groups.america
		elseif MutatorCheck and MutatorCheck:get_faction_override() and MutatorCheck:get_faction_override() == "russia" then
			if not PackageManager:loaded("packages/akanassets") then
				PackageManager:load("packages/akanassets")
			end
			if not PackageManager:loaded("packages/akanassetsnew") then
				PackageManager:load("packages/akanassetsnew")
			end
			if not PackageManager:loaded("levels/narratives/elephant/mad/world_sounds") then
				PackageManager:load("levels/narratives/elephant/mad/world_sounds")
			end
			return self.ai_groups.russia
		elseif MutatorCheck and MutatorCheck:get_faction_override() and MutatorCheck:get_faction_override() == "murkywater" then
			if not PackageManager:loaded("packages/murkyassets") then
				PackageManager:load("packages/murkyassets")
			end
			if not PackageManager:loaded("levels/narratives/locke/bph/world_sounds") then
				PackageManager:load("levels/narratives/locke/bph/world_sounds")
			end
			return self.ai_groups.murkywater
		end
	else
		local level_data = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]

		if level_data then
			local ai_group_type = level_data.ai_group_type
			
			if ai_group_type then
				return ai_group_type
			end
		end
		return self.ai_groups.default
	end
end