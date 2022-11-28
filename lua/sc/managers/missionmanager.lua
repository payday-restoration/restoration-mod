local level_id = Global.game_settings and Global.game_settings.level_id
if Global.editor_mode then
	return
end

-- Add custom mission script changes and triggers for specific levels
-- Execution of mission scripts can trigger reinforce locations (trigger that has just a name disables previously enabled reinforcement with that id)
-- Mission script elements can be disabled or enabled
-- From Streamlined Heisting
local level_mission_script_elements = {
	des = {
		[100304] = {
			reinforce = {
				{ name = "main_hall", force = 9, position = Vector3(-120, -2400, 100) }
			}
		},
		[100286] = {
			reinforce = {
				{ name = "main_hall" }
			}
		}
	},
	sah = {
		-- Disable instant difficulty increase
		[100122] = {
			values = {
				enabled = false
			}
		},
		[101400] = {
			difficulty = 0.5,
			reinforce = {
				{
					name = "auction_room",
					force = 5,
					position = Vector3(0, 2000, -100)
				}
			}
		}
	},
	chas = {
		[101190] = {
			reinforce = {
				{ name = "store_front1", force = 3, position = Vector3(-2000, 300, -10) },
				{ name = "store_front2", force = 3, position = Vector3(-1000, 300, -10) }
			}
		},
		[101647] = {
			reinforce = {
				{ name = "store_front2" },
				{ name = "back_alley", force = 3, position = Vector3(-1400, 4900, 540) }
			}
		}
	},
	
	friend = {
		[101612] = {
			values = {
				enabled = false -- Sosa retreat spot SO selection
			}
		},
		--forcing boat escape
		[100213] = {
			values = {
				enabled = false
			}
		},
		[100214] = {
			values = {
				enabled = false
			}
		},
		[103446] = {
			values = {
				enabled = false --don't even try.....
			}
		},
		--You're Sosa's men, not undercover cops
		[100852] = { 
			values = {
				team = "mobster1"
			}
		},
		[100854] = { 
			values = {
				team = "mobster1"
			}
		},
		[100855] = { 
			values = {
				team = "mobster1"
			}
		},
		[100856] = { 
			values = {
				team = "mobster1"
			}
		},
		[100857] = { 
			values = {
				team = "mobster1"
			}
		},
		[100858] = { 
			values = {
				team = "mobster1"
			}
		},
		[100858] = { 
			values = {
				team = "mobster1"
			}
		},
		[100859] = { 
			values = {
				team = "mobster1"
			}
		},
		[100860] = { 
			values = {
				team = "mobster1"
			}
		},
		[100861] = { 
			values = {
				team = "mobster1"
			}
		},
		[100862] = { 
			values = {
				team = "mobster1"
			}
		},
		[100863] = { 
			values = {
				team = "mobster1"
			}
		},
		[101185] = { 
			values = {
				team = "mobster1"
			}
		},
		[101185] = { 
			values = {
				team = "mobster1"
			}
		},
		[101189] = { 
			values = {
				team = "mobster1"
			}
		},
		[101771] = { 
			values = {
				team = "mobster1"
			}
		},
		[102301] = { 
			values = {
				team = "mobster1"
			}
		},
		[102395] = { 
			values = {
				team = "mobster1"
			}
		},
		[102399] = { 
			values = {
				team = "mobster1"
			}
		},
		[102404] = { 
			values = {
				team = "mobster1"
			}
		},
		[102408] = { 
			values = {
				team = "mobster1"
			}
		},
		[102419] = { 
			values = {
				team = "mobster1"
			}
		},
		[102421] = { 
			values = {
				team = "mobster1"
			}
		},
		[102532] = { 
			values = {
				team = "mobster1"
			}
		},
		[102535] = { 
			values = {
				team = "mobster1"
			}
		},
		[102538] = { 
			values = {
				team = "mobster1"
			}
		},
		[102540] = { 
			values = {
				team = "mobster1"
			}
		},
		[102542] = { 
			values = {
				team = "mobster1"
			}
		},
		[102544] = { 
			values = {
				team = "mobster1"
			}
		},
		[102546] = { 
			values = {
				team = "mobster1"
			}
		},
		[102548] = { 
			values = {
				team = "mobster1"
			}
		},
		[102550] = { 
			values = {
				team = "mobster1"
			}
		},
		[102553] = { 
			values = {
				team = "mobster1"
			}
		},
		[102557] = { 
			values = {
				team = "mobster1"
			}
		},
		[102559] = { 
			values = {
				team = "mobster1"
			}
		},
		[102562] = { 
			values = {
				team = "mobster1"
			}
		},
		[102565] = { 
			values = {
				team = "mobster1"
			}
		},
		[102569] = { 
			values = {
				team = "mobster1"
			}
		},
		[102572] = { 
			values = {
				team = "mobster1"
			}
		},
		[102576] = { 
			values = {
				team = "mobster1"
			}
		},
		[102578] = { 
			values = {
				team = "mobster1"
			}
		},
		[102581] = { 
			values = {
				team = "mobster1"
			}
		},
		[102583] = { 
			values = {
				team = "mobster1"
			}
		}
	},
	mus = {
		[102232] = {
			values = {
				enabled = false
			}
		},
		[102233] = {
			values = {
				enabled = false
			}
		},
		[102234] = {
			values = {
				enabled = false 
			}
		},
		[102235] = {
			values = {
				enabled = false 
			}
		},
		[102236] = {
			values = {
				enabled = false 
			}
		},
		[102237] = {
			values = {
				enabled = false 
			}
		},
		[102238] = {
			values = {
				enabled = false 
			}
		},
		[102239] = {
			values = {
				enabled = false 
			}
		}
	},
	ranc = {
		--fixes some spawn typos
		[100683] = {
			values = {
				spawn_action = "e_sp_over_3m"
			}
		},
		[100684] = {
			values = {
				spawn_action = "e_sp_over_3m"
			}
		},
		[100789] = {
			values = {
				spawn_action = "e_sp_over_3m"
			}
		},
		[100790] = {
			values = {
				spawn_action = "e_sp_over_3m"
			}
		},
		[100791] = {
			values = {
				spawn_action = "e_sp_over_3m"
			}
		}
	},
	help = {
		[100347] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100348] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100349] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100351] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100352] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100353] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100354] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100355] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		},
		[100360] = {
			values = {
				so_action = "e_nl_down_9_3m_rappel"
			}
		}
	},
	pent = {
		[103595] = {
			reinforce = {
				{
					name = "main_room",
					force = 3,
					position = Vector3(300, -1600, 12100)
				}
			}
		},
		[103831] = {
			reinforce = {
				{
					name = "main_room"
				},
				{
					name = "helipad",
					force = 3,
					position = Vector3(1600, -1600, 13100)
				}
			}
		}
	},
	rvd2 = {
		-- Reduce amount of ambush bulldozers
		[101557] = {
			values = {
				enabled = false
			}
		},
		[100567] = {
			values = {
				enabled = false
			}
		},
		[101575] = {
			values = {
				enabled = false
			}
		}
	}
}	
local mission_script_elements = level_mission_script_elements[level_id]
if not mission_script_elements then
	return
end

Hooks:PostHook(MissionManager, "_activate_mission", "sh__activate_mission", function (self)
	for element_id, data in pairs(mission_script_elements) do
		local element = self:get_element_by_id(element_id)
		if not element then
		else
			-- Check if this element is supposed to trigger reinforce points
			if data.reinforce then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_" .. element_id, function ()
					for _, v in pairs(data.reinforce) do
						managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
					end
				end)
			end

			-- Check if this element is supposed to be turned on or off
			if data.enabled ~= nil then
				element:set_enabled(data.enabled)
			end
		end
	end
end)