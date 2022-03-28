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
		[101400] = {
			reinforce = {
				{ name = "auction_room", force = 5, position = Vector3(0, 2000, -100) }
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
			enabled = false -- Sosa retreat spot SO selection
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