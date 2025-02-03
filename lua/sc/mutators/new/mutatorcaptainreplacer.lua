MutatorCaptainReplacer = MutatorCaptainReplacer or class(BaseMutator)
MutatorCaptainReplacer._type = "MutatorCaptainReplacer"
MutatorCaptainReplacer.name_id = "mutator_captain_replace"
MutatorCaptainReplacer.desc_id = "mutator_captain_replace_desc"
MutatorCaptainReplacer.has_options = true
MutatorCaptainReplacer.reductions = {
	money = 0,
	exp = 0
}
MutatorCaptainReplacer.disables_achievements = false
MutatorCaptainReplacer.categories = {
	"enemies"
}
MutatorCaptainReplacer.icon_coords = {
	5,
	2
}

function MutatorCaptainReplacer:register_values(mutator_manager)
	self:register_value("captain_replace_1", "winter", "cr1")
	self:register_value("captain_replace_2", "winter", "cr2")
	self:register_value("captain_replace_3", "winter", "cr3")
	self:register_value("winter_blacklist", false, "cpt_bl1")
	self:register_value("spring_blacklist", false, "cpt_bl2")
	self:register_value("summer_blacklist", false, "cpt_bl3")
	self:register_value("autumn_blacklist", false, "cpt_bl4")
	self:register_value("hvh_blacklist", false, "cpt_bl5")
end

function MutatorCaptainReplacer:name(lobby_data)
	local name = MutatorCaptainReplacer.super.name(self)

	if self:_mutate_name("captain_replace_1") or self:_mutate_name("captain_replace_2") or self:_mutate_name("captain_replace_3") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_captain_replace_" .. tostring(self:get_captain_override())))
	else
		return name
	end
end

function MutatorCaptainReplacer:modify_value(id, value)
	if id == "HUDAssaultCorner:NewCaptainIcon" then
		local new_icon = self:get_captain_override()
			if new_icon == "captain_random" then
				new_icon = "guis/textures/pd2/hud_buff_generic"
			elseif new_icon == "winter" then
				new_icon = "guis/textures/pd2/hud_buff_shield"
			elseif new_icon == "spring" then
				new_icon = "guis/textures/pd2/hud_buff_skull"
			elseif new_icon == "hvh" then 
				new_icon = "guis/textures/pd2/hud_buff_halloween"
			elseif new_icon == "summer" then
				new_icon = "guis/textures/pd2/hud_buff_fire"
			elseif new_icon == "autumn" then
				new_icon = "guis/textures/pd2/hud_buff_spooc"
		end
		return new_icon
	end
	return value
end

function MutatorCaptainReplacer:setup()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local job = Global.level_data and Global.level_data.level_id
	local pro_job = Global.game_settings and Global.game_settings.one_down
	
	local winter_preset = nil
	local spring_preset = nil
	local summer_preset = nil
	local autumn_preset = nil
	local spooky_preset = nil
	local new_captain = self:get_captain_override()
	if new_captain ~= "no_captain_override" then
	if pro_job then
	--Winters
	if difficulty_index <= 5 then
		winter_preset = {
			amount = 6,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 5,
					amount_max = 5,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				}					
			}
		}	
	elseif difficulty_index == 6 then
		winter_preset = {
			amount = 9,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 6,
					amount_max = 6,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion_sniper,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		winter_preset = {
			amount = 10,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 6,
					amount_max = 6,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion_sniper,
					rank = 2
				}				
			}
		}
	else
		winter_preset = {
			amount = 13,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 6,
					amount_max = 6,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_dozer",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion_sniper,
					rank = 2
				}
			}
		}				
	end		
	
	--Captain Spring
	if difficulty_index <= 5 then
		spring_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "OMNIA_Tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				}
			}
		}	
	elseif difficulty_index == 6 then
		spring_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "OMNIA_Tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "OMNIA_Taser",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.CS_Tazer,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then	
		spring_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "Tank_Ben",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "Taser_Titan",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.CS_Tazer,
					rank = 2
				}
			}
		}
	else
		spring_preset = {
			amount = 8,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "Tank_Ben",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "Taser_Titan",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.CS_Tazer,
					rank = 2
				}					
			}
		}			
	end
	
	--HVH boss
	if difficulty_index <= 5 then
		spooky_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}	
	elseif difficulty_index == 6 then
		spooky_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc_Normal",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		spooky_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}	
	else
		spooky_preset = {
			amount = 8,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}					
			}
		}			
	end	
	
	--Captain Autumn 
	if difficulty_index <= 5 then
		autumn_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Autumn_Spooc",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 6 then
		autumn_preset = {
			amount = 4,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Autumn_Spooc",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}					
			}
		}	
	elseif difficulty_index == 7 then
		autumn_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Titan_Spooc",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}					
			}
		}	
	else
		autumn_preset = {
			amount = 6,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Titan_Spooc",
					freq = 1,
					amount_min = 5,
					amount_max = 5,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}				
			}
		}		
	end
else	
	--Winters 
	if difficulty_index <= 5 then
		winter_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				}					
			}
		}	
	elseif difficulty_index == 6 then
		winter_preset = {
			amount = 6,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 5,
					amount_max = 5,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				}				
			}
		}
	elseif difficulty_index == 7 then
		winter_preset = {
			amount = 8,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 5,
					amount_max = 5,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion_sniper,
					rank = 2
				}				
			}
		}
	else
		winter_preset = {
			amount = 9,
			force = true,
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 5,
					amount_max = 5,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.Cap_winters_minion_sniper,
					rank = 2
				}
			}
		}				
	end		
	
	--Captain Spring
	if difficulty_index <= 5 then
		spring_preset = {
			amount = 1,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		spring_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "OMNIA_Tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then	
		spring_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "OMNIA_Tank",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "OMNIA_Taser",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.CS_Tazer,
					rank = 2
				}
			}
		}
	else
		spring_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "Tank_Ben",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "Taser_Titan",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.CS_Tazer,
					rank = 2
				}					
			}
		}			
	end
	
	--HVH boss
	if difficulty_index <= 5 then
		spooky_preset = {
			amount = 1,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 then
		spooky_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}
	elseif difficulty_index == 7 then
		spooky_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc_Normal",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}
			}
		}	
	else
		spooky_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.HVH_boss,
					rank = 2
				}					
			}
		}			
	end	
	
	--Captain Autumn 
	if difficulty_index <= 5 then
		autumn_preset = {
			amount = 1,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 6 then
		autumn_preset = {
			amount = 3,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Autumn_Spooc",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}					
			}
		}	
	elseif difficulty_index == 7 then
		autumn_preset = {
			amount = 4,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Autumn_Spooc",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}					
			}
		}	
	else
		autumn_preset = {
			amount = 5,
			force = true,
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Titan_Spooc",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = tweak_data.group_ai._tactics.Cap_autumn,
					rank = 2
				}				
			}
		}		
	end
end	
	
	--Captain Summers 
	summer_preset = {
		amount = 4,
		force = true,
		spawn = {
			{
				unit = "Cap_Summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = tweak_data.group_ai._tactics.Cap_summers,
				rank = 4
			},
			{
				unit = "medic_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = tweak_data.group_ai._tactics.Cap_summers_minion,
				rank = 1
			},
			{
				unit = "boom_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = tweak_data.group_ai._tactics.Cap_summers_minion,
				rank = 1
			},
			{
				unit = "taser_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = tweak_data.group_ai._tactics.Cap_summers_minion,
				rank = 1
			}
		}
	}
	
	if new_captain == "captain_random" then
		local captain_table = {}
		local num_of_captains = 0
		if not self:winter_blacklist() then
			table.insert(captain_table, "winter")
			num_of_captains = num_of_captains + 1
		end
		if not self:spring_blacklist() then
			table.insert(captain_table, "spring")
			num_of_captains = num_of_captains + 1
		end
		if not self:summer_blacklist() then
			table.insert(captain_table, "summer")
			num_of_captains = num_of_captains + 1
		end
		if not self:autumn_blacklist() then
			table.insert(captain_table, "autumn")
			num_of_captains = num_of_captains + 1
		end
		if not self:hvh_blacklist() then
			table.insert(captain_table, "hvh")
			num_of_captains = num_of_captains + 1
		end
		--[[for i, value in ipairs(captain_table) do
			log("Captain Table "..tostring(i).." = "..tostring(value))
		end--]]
		
		-- If host excluded all captains - do nothing. It will be just usual behaviour (as without mutator)
		if num_of_captains > 0 then	
			local cpt_index = math.random(1, num_of_captains)
			new_captain = captain_table[cpt_index]
		end
	end
	
	if new_captain == "winter" then
		new_captain = winter_preset
	elseif new_captain == "spring" then
		new_captain = spring_preset
	elseif new_captain == "hvh" then 
		new_captain = spooky_preset
	elseif new_captain == "summer" then
		new_captain = summer_preset
	elseif new_captain == "autumn" then
		new_captain = autumn_preset
	end
	-- Exclude double captain groups
	local captain_type = restoration.captain_spawns[job]
	if table.contains(restoration.disable_natural_captain, job) then
	else
		if captain_type then
			tweak_data.group_ai.enemy_spawn_groups.Cap_Winters = new_captain
			tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = new_captain
			tweak_data.group_ai.enemy_spawn_groups.HVH_Boss = new_captain
			tweak_data.group_ai.enemy_spawn_groups.Cap_Autumn = new_captain
			tweak_data.group_ai.enemy_spawn_groups.Cap_Summers = new_captain
		else
			tweak_data.group_ai.enemy_spawn_groups.Fake_Captain = new_captain
			tweak_data.group_ai.besiege.assault.groups.Fake_Captain = {0, 0.2, 0.3}
			if new_captain == "autumn" then
				tweak_data.group_ai.besiege.group_constraints.Fake_Captain.cooldown = tweak_data.group_ai.besiege.group_constraints.Fake_Captain.cooldown / 2
			end
		end	
	end
	end
end

function MutatorCaptainReplacer:winter_blacklist()
	return self:value("winter_blacklist")
end

function MutatorCaptainReplacer:spring_blacklist()
	return self:value("spring_blacklist")
end

function MutatorCaptainReplacer:summer_blacklist()
	return self:value("summer_blacklist")
end

function MutatorCaptainReplacer:autumn_blacklist()
	return self:value("autumn_blacklist")
end

function MutatorCaptainReplacer:hvh_blacklist()
	return self:value("hvh_blacklist")
end

function MutatorCaptainReplacer:get_captain_override(specific_day)
--specific_day need only for settings
if specific_day == nil then
	local current_heist_stage = 1
	if #(managers.job:current_job_chain_data() or {}) > 1 then
		current_heist_stage = managers.job:current_stage() or 1
	end
	return self:value("captain_replace_"..tostring(current_heist_stage))
else
	return self:value("captain_replace_"..tostring(specific_day))
end
end

function MutatorCaptainReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "captain_selector_choice_1",
		text_id = "menu_mutator_captain_replace_1",
		filter = true,
		update_callback = callback(self, self, "_update_captain_override_1")
	}
	local data_node = {
		{
			value = "no_captain_override",
			text_id = "menu_mutator_captain_replace_no_captain_override",
			_meta = "option"
		},
		{
			value = "captain_random",
			text_id = "menu_mutator_captain_replace_captain_random",
			_meta = "option"
		},
		{
			value = "winter",
			text_id = "menu_mutator_captain_replace_winter",
			_meta = "option"
		},
		{
			value = "summer",
			text_id = "menu_mutator_captain_replace_summer",
			_meta = "option"
		},
		{
			value = "spring",
			text_id = "menu_mutator_captain_replace_spring",
			_meta = "option"
		},
		{
			value = "autumn",
			text_id = "menu_mutator_captain_replace_autumn",
			_meta = "option"
		},
		{
			value = "hvh",
			text_id = "menu_mutator_captain_replace_hvh",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_captain_override(1))
	node:add_item(new_item)
	
	local params = {
		callback = "_update_mutator_value",
		name = "captain_selector_choice_2",
		text_id = "menu_mutator_captain_replace_2",
		filter = true,
		update_callback = callback(self, self, "_update_captain_override_2")
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_captain_override(2))
	node:add_item(new_item)
	
	local params = {
		callback = "_update_mutator_value",
		name = "captain_selector_choice_3",
		text_id = "menu_mutator_captain_replace_3",
		filter = true,
		update_callback = callback(self, self, "_update_captain_override_3")
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_captain_override(3))
	node:add_item(new_item)
	
	local params = {
		name = "winter_blacklist_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_winter_blacklist_toggle",
		update_callback = callback(self, self, "_toggle_winter_blacklist")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:winter_blacklist() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "spring_blacklist_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_spring_blacklist_toggle",
		update_callback = callback(self, self, "_toggle_spring_blacklist")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:spring_blacklist() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "summer_blacklist_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_summer_blacklist_toggle",
		update_callback = callback(self, self, "_toggle_summer_blacklist")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:summer_blacklist() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "autumn_blacklist_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_autumn_blacklist_toggle",
		update_callback = callback(self, self, "_toggle_autumn_blacklist")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:autumn_blacklist() and "on" or "off")
	node:add_item(new_item)
	
	local params = {
		name = "hvh_blacklist_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_hvh_blacklist_toggle",
		update_callback = callback(self, self, "_toggle_hvh_blacklist")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:hvh_blacklist() and "on" or "off")
	node:add_item(new_item)
	
	self._node = node

	return new_item
end

function MutatorCaptainReplacer:_update_captain_override_1(item)
	self:set_value("captain_replace_1", item:value())
end

function MutatorCaptainReplacer:_update_captain_override_2(item)
	self:set_value("captain_replace_2", item:value())
end

function MutatorCaptainReplacer:_update_captain_override_3(item)
	self:set_value("captain_replace_3", item:value())
end

function MutatorCaptainReplacer:_toggle_winter_blacklist(item)
	self:set_value("winter_blacklist", item:value() == "on")
end

function MutatorCaptainReplacer:_toggle_spring_blacklist(item)
	self:set_value("spring_blacklist", item:value() == "on")
end

function MutatorCaptainReplacer:_toggle_summer_blacklist(item)
	self:set_value("summer_blacklist", item:value() == "on")
end

function MutatorCaptainReplacer:_toggle_autumn_blacklist(item)
	self:set_value("autumn_blacklist", item:value() == "on")
end

function MutatorCaptainReplacer:_toggle_hvh_blacklist(item)
	self:set_value("hvh_blacklist", item:value() == "on")
end

function MutatorCaptainReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("captain_selector_choice")

		if slider then
			slider:set_value(self:get_captain_override())
		end
		
		local toggle1 = self._node:item("winter_blacklist_toggle")

		if toggle1 then
			toggle1:set_value(self:winter_blacklist() and "on" or "off")
		end
		
		local toggle2 = self._node:item("spring_blacklist_toggle")

		if toggle2 then
			toggle2:set_value(self:spring_blacklist() and "on" or "off")
		end
		
		local toggle3 = self._node:item("summer_blacklist_toggle")

		if toggle3 then
			toggle3:set_value(self:summer_blacklist() and "on" or "off")
		end
		
		local toggle4 = self._node:item("autumn_blacklist_toggle")

		if toggle4 then
			toggle4:set_value(self:autumn_blacklist() and "on" or "off")
		end
		
		local toggle5 = self._node:item("hvh_blacklist_toggle")

		if toggle5 then
			toggle5:set_value(self:hvh_blacklist() and "on" or "off")
		end
	end
end
