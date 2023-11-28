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
	self:register_value("captain_replace", "winter", "cr")
end

function MutatorCaptainReplacer:name(lobby_data)
	local name = MutatorCaptainReplacer.super.name(self)

	if self:_mutate_name("captain_replace") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_captain_replace_" .. tostring(self:value("captain_replace"))))
	else
		return name
	end
end

function MutatorCaptainReplacer:modify_value(id, value)
	if id == "HUDAssaultCorner:NewCaptainIcon" then
		local new_icon = self:get_captain_override()
			if new_icon == "winter" then
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
	local winter_preset = nil
	local spring_preset = nil
	local summer_preset = nil
	local autumn_preset = nil
	local spooky_preset = nil
	local new_captain = self:get_captain_override()
	
	--Winters 
	if difficulty_index <= 5 then
		winter_preset = {
			amount = {5, 5},
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
			amount = {6, 6},
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
			amount = {8, 8},
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
			amount = {10, 10},
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
			amount = {1, 1},
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
			amount = {3, 3},
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
			amount = {5, 5},
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
			amount = {7, 7},
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
			amount = {1, 1},
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
			amount = {3, 3},
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
			amount = {5, 5},
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
			amount = {7, 7},
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
			amount = {1, 1},
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
		spooky_preset = {
			amount = {3, 3},
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
		spooky_preset = {
			amount = {4, 4},
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
		spooky_preset = {
			amount = {5, 5},
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
	
	--Captain Summers 
	summer_preset = {
		amount = {4, 4},
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
	
	tweak_data.group_ai.enemy_spawn_groups.Cap_Winters = new_captain
	tweak_data.group_ai.enemy_spawn_groups.Cap_Spring = new_captain
	tweak_data.group_ai.enemy_spawn_groups.HVH_Boss = new_captain
	tweak_data.group_ai.enemy_spawn_groups.Cap_Autumn = new_captain
	tweak_data.group_ai.enemy_spawn_groups.Cap_Summers = new_captain
end

function MutatorCaptainReplacer:get_captain_override()
	return self:value("captain_replace")
end

function MutatorCaptainReplacer:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "captain_selector_choice",
		text_id = "menu_mutator_captain_replace",
		filter = true,
		update_callback = callback(self, self, "_update_captain_override")
	}
	local data_node = {
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

	new_item:set_value(self:get_captain_override())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorCaptainReplacer:_update_captain_override(item)
	self:set_value("captain_replace", item:value())
end

function MutatorCaptainReplacer:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("captain_selector_choice")

		if slider then
			slider:set_value(self:get_captain_override())
		end
	end
end