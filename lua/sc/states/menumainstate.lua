--[[
local resmod_message_table = { first_launch = true }

function MenuMainState:resmod_message_load()
	local file = io.open(SavePath .. "ResMessageSave.json", "r")
	
	if not file then 
		self:resmod_message_save()
	end
	
	if file then
		for k, v in pairs(json.decode(file:read("*all")) or {}) do
			resmod_message_table[k] = v
		end
		file:close()
	end
end

function MenuMainState:resmod_message_save()
	local file = io.open(SavePath .. "ResMessageSave.json", "w+")
	
	if not file then 
		return false 
	end
	
	file:write(json.encode(resmod_message_table))
	file:close()	
end

Hooks:PreHook(MenuMainState, "init", "init_resmod_message", function (self, game_state_machine)
	self:resmod_message_load()
end)

-- Welcome message when you launch this mod 1st time
Hooks:PostHook(MenuMainState, "at_enter", "at_enter_resmod_1st_time", function (self,old_state)
	if resmod_message_table.first_launch then
		local welcome_message = {
			focus_button = 1,
			texture = "guis/textures/menu_title_screen",
			title = "resmod_1st_time_title",
			text = "resmod_1st_time_desc"
		}

		local node1 = {
			text = managers.localization:text("resmod_message_confirm")
		}
	
		welcome_message.button_list = {
			node1
		}

		managers.menu:show_video_message_dialog(welcome_message)
		resmod_message_table.first_launch = false
		self:resmod_message_save()
	end
end)
--]]