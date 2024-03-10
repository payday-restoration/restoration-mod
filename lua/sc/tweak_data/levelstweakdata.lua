Month = os.date("%m")
Day = os.date("%d")	

--///LEVEL TYPES\\\--
LevelsTweakData.LevelType = {}
LevelsTweakData.LevelType.America = "america"
LevelsTweakData.LevelType.Russia = "russia"
LevelsTweakData.LevelType.Zombie = "zombie"
LevelsTweakData.LevelType.Murkywater = "murkywater"
LevelsTweakData.LevelType.Federales = "federales"
LevelsTweakData.LevelType.NYPD = "nypd"
LevelsTweakData.LevelType.LAPD = "lapd"
LevelsTweakData.LevelType.FBI = "fbi"
--///LEVELS\\\--
Hooks:PostHook( LevelsTweakData, "init", "SC_levels", function(self)
	
	local america = LevelsTweakData.LevelType.America
	local russia = LevelsTweakData.LevelType.Russia
	local zombie = LevelsTweakData.LevelType.Zombie
	local murkywater = LevelsTweakData.LevelType.Murkywater
	local nypd = LevelsTweakData.LevelType.NYPD
	local federales = LevelsTweakData.LevelType.Federales		
	local lapd = LevelsTweakData.LevelType.LAPD
	local fbi = LevelsTweakData.LevelType.FBI
	self.ai_groups = {}
	self.ai_groups.default = america
	self.ai_groups.america = america
	self.ai_groups.russia = russia
	self.ai_groups.zombie  = zombie
	self.ai_groups.murkywater = murkywater
	self.ai_groups.federales = federales
	self.ai_groups.nypd = nypd
	self.ai_groups.lapd = lapd
	self.ai_groups.fbi = fbi
	
	--Christmas Dozer/Cloaker jingle bells
	if restoration and restoration.Options:GetValue("OTHER/Holiday") then
		if Month == 12 then
			if not PackageManager:loaded("packages/event_xmas") then
				PackageManager:load("packages/event_xmas")
			end		
			
			for lvl_id, lvl_data in pairs(self) do
				if type(lvl_data) == "table" and lvl_data.name_id then
					self[lvl_id].is_christmas_heist = true
				end
			end					
		end
	end
	
	--///MEXICAN LEVELS\\\--
	self.mex_cooking.ai_group_type = federales 
	self.mex_cooking.player_style = "suit_sunny"	
	
	self.pex.player_style = "slaughterhouse"
	
	self.fex.player_style = "suit_sunny"
	
	
	--///MURKYWATER LEVELS\\\--
	self.shoutout_raid.ai_group_type = murkywater
	self.shoutout_raid.player_style = "raincoat" --actually years late on setting this back to the raincoat :)))--
	
	self.pbr.ai_group_type = murkywater
	self.pbr.player_style = "loud_suit"
	
	self.des.ai_group_type = murkywater 
	self.des.player_style = "loud_suit"
	
	self.bph.ai_group_type = murkywater 
	self.bph.player_style = "loud_suit"
	
	self.vit.ai_group_type = murkywater 
	
	self.wwh.ai_group_type = murkywater 
	
	self.arm_for.ai_group_type = murkywater 
	self.arm_for.player_style = "sneak_suit"
	
	self.mex.package = {"packages/miscassets", "packages/job_mex"}
	self.mex.ai_group_type = murkywater 
	self.mex.player_style = "suit_sunny"

	self.welcome_to_the_jungle_1.package = {"packages/narr_jungle1", "packages/miscassets"}
	self.welcome_to_the_jungle_1_night.package = {"packages/narr_jungle1_night", "packages/miscassets"} 
	self.welcome_to_the_jungle_2.ai_group_type = murkywater
	self.welcome_to_the_jungle_2.player_style = "sneak_suit"	

	self.crojob2.ai_group_type = murkywater			
	self.crojob2.player_style = "slaughterhouse"	

	self.dark.ai_group_type = murkywater	
	self.dark.player_style = "sneak_suit"
	
	self.kosugi.ai_group_type = murkywater	
	self.kosugi.player_style = "sneak_suit"
	
	self.deep.ai_group_type = murkywater
	
	--///FBI LEVELS\\\--
	self.hox_2.player_style = "slaughterhouse"
	self.hox_2.ai_group_type = fbi
	
	self.hox_3.player_style = "sneak_suit"
	self.hox_3.ai_group_type = fbi
	
	self.watchdogs_1.player_style = "suit_sunny"
	self.watchdogs_1.ai_group_type = fbi

	self.watchdogs_2.player_style = "loud_suit"
	self.watchdogs_2.flashlights_on = true --i think this is the night version
	self.watchdogs_2.ai_group_type = fbi
	
	self.watchdogs_1_night.player_style = "suit_sunny"
	self.watchdogs_1_night.flashlights_on = true
	self.watchdogs_1_night.ai_group_type = fbi
	
	self.watchdogs_2_day.player_style = "loud_suit"
	self.watchdogs_2_day.ai_group_type = fbi
	
	self.alex_1.player_style = "suit_sunny"
	self.alex_1.ai_group_type = fbi
	
	self.alex_2.player_style = "suit_sunny"
	self.alex_2.ai_group_type = fbi
	
	self.alex_3.player_style = "slaughterhouse"
	self.alex_3.ai_group_type = fbi
	
	self.framing_frame_3.player_style = "sneak_suit"
	self.framing_frame_3.flashlights_on = false
	self.framing_frame_3.ai_group_type = fbi
	
	self.firestarter_1.ai_group_type = fbi
	self.firestarter_1.player_style = "loud_suit"
	
	self.firestarter_2.ai_group_type = fbi
	self.firestarter_2.player_style = "sneak_suit"
	
	self.firestarter_3.ai_group_type = fbi
	
	self.rat.player_style = "suit_sunny"
	self.rat.ai_group_type = fbi
	
	self.chill_combat.ai_group_type = fbi
	
	self.peta.ai_group_type = fbi
	self.peta2.ai_group_type = fbi
	
	self.sah.ai_group_type = fbi
	self.sah.flashlights_on = true
	
	self.tag.ai_group_type = fbi
	
	self.man.package = {"packages/narr_man", "packages/secret_stash"}
	self.man.player_style = "slaughterhouse"
	self.man.ai_group_type = fbi
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
				criminal1 = true,
				hacked_turret = true
			},
			friends = {
				mobster1 = true
			}
		},
		mobster1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true
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
	
	--///NYPD LEVELS\\\--
	self.spa.ai_group_type = nypd
	self.spa.package = {"packages/job_spa", "levels/narratives/h_watchdogs/stage_1/world/world"}
	self.spa.player_style = "slaughterhouse"
	self.spa.flashlights_on = true
	
	self.fish.ai_group_type = nypd
	self.fish.player_style = "tux"
	
	self.brb.ai_group_type = nypd
	self.brb.package = {"packages/lvl_brb", "packages/murkywatermisc"}
	self.brb.player_style = "peacoat"
	
	self.red2.ai_group_type = nypd
	
	self.run.ai_group_type = nypd
	
	self.flat.ai_group_type = nypd
	self.flat.package = {"packages/miscassets", "packages/narr_flat"}
	
	self.glace.ai_group_type = nypd
	self.glace.flashlights_on = true
	
	self.dah.ai_group_type = nypd
	self.dah.player_style = "slaughterhouse"
	self.dah.flashlights_on = true
	
	self.dinner.ai_group_type = nypd
	self.dinner.package = {"packages/narr_dinner", "packages/murkywatermisc"}
	self.dinner.player_style = "slaughterhouse"

    self.trai.ai_group_type = nypd
    self.trai.player_style = "railroad"
	
	self.corp.ai_group_type = nypd
	
	self.nmh.ai_group_type = nypd
	self.nmh.ghost_bonus = nil
	
	--///LAPD LEVELS\\\--			
	self.jolly.ai_group_type = lapd
	self.jolly.player_style = "suit_sunny"
	
	self.pal.ai_group_type = lapd
	
	self.friend.ai_group_type = lapd
	self.friend.package = {"packages/lvl_friend", "packages/miscassets"}
	self.friend.player_style = "suit_sunny"
	
	self.kenaz.ai_group_type = lapd
	self.kenaz.package = {"packages/kenaz", "packages/rex_gold"}	
	self.kenaz.player_style = "continental"		

	self.rvd1.ai_group_type = lapd
	self.rvd1.player_style = "suit_sunny"
	
	self.rvd2.ai_group_type = lapd
	self.rvd2.player_style = "suit_sunny"
	
	
	self.chas.ai_group_type = lapd
	self.chas.player_style = "suit_sunny"
	
	self.sand.ai_group_type = lapd
	self.sand.player_style = "highinttech"

	self.chca.ai_group_type = lapd
	self.chca.player_style = "continental"

	self.pent.ai_group_type = lapd
	self.pent.package = {"packages/job_pent", "packages/miscassets", "levels/instances/unique/sah/sah_office/world/world"}
	self.pent.player_style = "enforcer"
	self.pent.max_bags = 17
		
	self.ranc.ai_group_type = lapd
	self.ranc.player_style = "fighterpilot"
	
	--//GENSEC STUFF\\--
	self.arm_cro.package = {"packages/narr_arm_cro", "packages/gensecmisc"}
	self.arm_fac.package = {"packages/narr_arm_fac", "packages/gensecmisc"}
	self.arm_hcm.package = {"packages/narr_arm_hcm", "packages/gensecmisc"}
	self.arm_par.package = {"packages/narr_arm_par", "packages/gensecmisc"}
	self.arm_und.package = {"packages/narr_arm_und", "packages/gensecmisc"}
	
	--///NEW OUTFITS\\\--
	
	self.nightclub.flashlights_on = true
	
	self.escape_cafe.flashlights_on = true
    self.escape_park.flashlights_on = true
    self.escape_overpass.flashlights_on = true
    self.escape_overpass_night.flashlights_on = true
    self.escape_garage.flashlights_on = true
	
	self.arena.player_style = "hiphop"

	self.born.package = {"packages/narr_born_1", "packages/miscassets"}	
	self.born.player_style = "punk"
	
	
	self.arm_cro.player_style = "jumpsuit"
	
	
	self.arm_hcm.player_style = "jumpsuit"	
	
	
	self.arm_fac.player_style = "jumpsuit"
	self.arm_fac.flashlights_on = true
	
	
	self.arm_par.player_style = "jumpsuit"		
	
	
	self.arm_und.player_style = "scrub"
	self.arm_und.flashlights_on = true
							
	
	self.hox_1.player_style = "slaughterhouse"
	
	
	self.election_day_1.player_style = "sneak_suit"	
	
	self.election_day_2.player_style = "sneak_suit"
	
	
	self.gallery.player_style = "sneak_suit"
	self.gallery.flashlights_on = true
	self.framing_frame_1.player_style = "sneak_suit"
	
	self.welcome_to_the_jungle_1.player_style = "suit_sunny"
	self.welcome_to_the_jungle_1_night.player_style = "suit_sunny"
	self.welcome_to_the_jungle_1_night.flashlights_on = true
	
	
	self.chew.player_style = "loud_suit"
	
	self.pbr2.package = {"packages/narr_jerry2", "packages/murkywatermisc"}
	self.pbr2.player_style = "loud_suit"
	
	self.mia_1.player_style = "miami"
	self.mia_2.package = {"packages/narr_mia_2", "packages/miscassets"}		
	self.mia_2.player_style = "miami"

	self.mia_2.teams = {
		criminal1 = {
			foes = {
				mobster_boss = true,
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
				criminal1 = true,
				mobster1 = true,
				hacked_turret = true
			},
			friends = {}
		},
		mobster1 = {
			foes = {
				converted_enemy = true,
				law1 = true,
				criminal1 = true,
				hacked_turret = true
			},
			friends = {}
		},
		mobster_boss = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true
			},
			friends = {}
		},
		converted_enemy = {
			foes = {
				mobster_boss = true,
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
				mobster1 = true,
				mobster_boss = true
			},
			friends = {}
		}
	}

	self.mia2_new.teams = self.mia_2.teams

	self.cane.package = {"packages/cane", "packages/miscassets"}
	self.cane.player_style = "winter_suit"
							
	self.mus.package = {"packages/narr_mus"}
	self.mus.player_style = "sneak_suit"
	
	--//CHRISTMAS HEISTS\\--
	
	--hoxton breakout xmas day 1
	table.insert(self._level_index, "xmn_hox1")
	
	self.xmn_hox1 = {
		name_id = "heist_xmn_hox1",
		briefing_id = "heist_hox_1_briefing",
		briefing_dialog = "Play_pln_hb1_brf_01",
		world_name = "narratives/dentist/hox/stage_1_xmn",
		intro_event = "Play_pln_hb1_intro_01",
		outro_event = {
			"Play_pln_hb1_end_01"
		},
		music = "heist",
		package = "packages/narr_hox_1",
		cube = "cube_apply_heist_bank",
		block_AIs = {
			old_hoxton = true
		},
		ai_group_type = america,
		player_style = "xmas_tuxedo",
		load_screen = "guis/dlcs/xmn/textures/loading/job_hox_1_xmn_df"
	}

	--hoxton breakout xmas day 2
	table.insert(self._level_index, "xmn_hox2")

	self.xmn_hox2 = {
		name_id = "heist_xmn_hox2",
		briefing_id = "heist_hox_2_briefing",
		briefing_dialog = "Play_rb5_hb2_brf_01",
		world_name = "narratives/dentist/hox/stage_2_xmn",
		intro_event = "Play_rb5_hb2_intro_01",
		outro_event = {
			"Play_rb5_hb2_end_01"
		},
		music = "heist",
		package = "packages/narr_hox_2",
		cube = "cube_apply_heist_bank",
		block_AIs = {
			old_hoxton = true
		},
		ai_group_type = fbi,
		player_style = "xmas_tuxedo",
		load_screen = "guis/dlcs/xmn/textures/loading/job_hox_2_xmn_df"
	}
	
	--breakin' feds xmas
	table.insert(self._level_index, "xmn_tag")
	self.xmn_tag = deep_clone(self.tag)
	self.xmn_tag.name_id = "heist_xmn_tag_name"
	self.xmn_tag.world_name = "narratives/locke/tag_xmn"
	self.xmn_tag.player_style = "xmas_tuxedo"
	self.xmn_tag.load_screen = "guis/dlcs/xmn/textures/loading/job_tag_xmn_df"
		
	--[[
	
	--Zombies on H&T for the holidays--
	if Month == "10" and restoration.Options:GetValue("OTHER/Holiday") then
		self.branchbank.package = {"packages/zombieassets", "packages/narr_hvh", "levels/narratives/bain/hvh/world_sounds", "packages/narr_firestarter3"}
		self.branchbank.ai_group_type = zombie
	end
	
	]]--
	
	self.haunted.ai_group_type = zombie		
	self.nail.ai_group_type = zombie
	self.help.ai_group_type = zombie
	
	self.hvh.player_style = "suit_prison"	
	self.haunted.player_style = "suit_prison"	
	self.nail.player_style = "suit_prison"
	self.help.player_style = "suit_prison"
	--///SAFEHOUSE\\\--
	self.chill.ghost_bonus = nil
	self.chill_combat.disable_mutators = false
	
	self.cage.ghost_bonus = nil
	
	self.mallcrasher.ghost_bonus = 0.05
	
	--///REAPER LEVELS\\\--
	self.mad.player_style = "winter_suit"
	--We're never actually told where the forest is ;)
	self.pines.player_style = "loud_suit"
	self.pines.ai_group_type = russia	
	self.pines.flashlights_on = true
	
	--Bomb: Forest--
	self.crojob3.ai_group_type = russia			
	self.crojob3.player_style = "loud_suit"
	self.crojob3.package = {"packages/dlcs/the_bomb/crojob_stage_3", "packages/murkywatermisc"}

	self.crojob3_night.ai_group_type = russia				
	self.crojob3_night.player_style = "loud_suit"		
	self.crojob3_night.flashlights_on = true
	self.crojob3_night.package = {"packages/dlcs/the_bomb/crojob_stage_3_night", "packages/murkywatermisc"}
	
	--///BAG FIXES\\\--
	self.pbr2.max_bags = 20
	self.spa.max_bags = 8
	self.fish.max_bags = 20
	--Increased Stelf Bonus in some heists--	
	--Bain's Heists goes here--
	self.arena.ghost_bonus = 0.20
	self.dah.ghost_bonus = 0.15
	self.arm_for.ghost_bonus = 0.15
	self.kosugi.ghost_bonus = 0.10
	--Locke's Heists goes here--
	self.mex.ghost_bonus = 0.25
	self.vit.ghost_bonus = 0.15
	--The Dentist's Heists goes here--
	self.big.ghost_bonus = 0.20
	self.kenaz.ghost_bonus = 0.25
	--Vlad's Heists goes here--
	self.chca.ghost_bonus = 0.30
	--The Butcher's Heists goes here--
	self.friend.ghost_bonus = 0.20
	self.crojob2.ghost_bonus = 0.20
	--Gemma McShay's Heists goes here--
	self.ranc.ghost_bonus = 0.20
	self.trai.ghost_bonus = 0.25
	--Blaine's Heists goes here--
	self.corp.ghost_bonus = 0.20
	self.deep.ghost_bonus = 0.20
	
	--///SKIRMISH shit\\\--
	self.skm_cas.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_lapd"}
	self.skm_cas.ai_group_type = lapd
	self.skm_cas.player_style = "continental"		

	self.skm_bex.package = {"packages/skm_sc_federales", "packages/dlcs/skm/job_bex_skm"}

	self.skm_run.ai_group_type = nypd
	self.skm_run.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_nypd"}
	
	self.skm_red2.ai_group_type = nypd
	self.skm_red2.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_nypd"}
		
	self.skm_mus.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_america"}
	self.skm_mus.player_style = "sneak_suit"
	
	self.skm_watchdogs_stage2.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_murkywater"}
	self.skm_watchdogs_stage2.player_style = "loud_suit"
	self.skm_watchdogs_stage2.ai_group_type = murkywater
	
	self.skm_mallcrasher.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_america"}
	self.skm_mallcrasher.player_style = "suit_sunny"
	
	self.skm_arena.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_america"}
	self.skm_arena.player_style = "hiphop"
		
	self.skm_big2.package = {"packages/dlcs/skm/job_skm", "packages/skm_sc_america"}
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

function LevelsTweakData:get_team_setup()
	local lvl_tweak = nil

	if not Application:editor() or not managers.editor or self[managers.editor:layer("Level Settings"):get_setting("simulation_level_id")] then
		if Global.level_data and Global.level_data.level_id then
			lvl_tweak = self[Global.level_data.level_id]
		end
	end

	local teams = lvl_tweak and lvl_tweak.teams

	if teams then
		teams = deep_clone(teams)
	else
		teams = {
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
					criminal1 = true,
					mobster1 = true,
					hacked_turret = true
				},
				friends = {}
			},
			mobster1 = {
				foes = {
					converted_enemy = true,
					law1 = true,
					criminal1 = true,
					hacked_turret = true
				},
				friends = {}
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

		for id, team in pairs(teams) do
			team.id = id
		end
	end

	if managers.mutators:is_mutator_active(MutatorCG22) then
		local team_ids = {}
	
		for team_id, team_data in pairs(teams) do
			team_data.friends = team_data.friends or {}
			team_data.friends.cg22 = true
	
			table.insert(team_ids, team_id)
		end
	
		teams.cg22 = {
			foes = {},
			friends = {}
		}
	
		for _, team_id in ipairs(team_ids) do
			teams.cg22.friends[team_id] = true
		end
	end

	return teams
end
