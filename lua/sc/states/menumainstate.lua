--[[
-- Welcome message when you launch this mod 1st time
Hooks:PostHook(MenuMainState, "at_enter", "at_enter_resmod_1st_time", function (self,old_state)
-- Need add check that message will appear only once (aka setting value)
	local welcome_message = {
		focus_button = 1,
		texture = "guis/textures/menu_title_screen",
		title = "resmod_1st_time_title",
		text = "resmod_1st_time_desc"
	}

	local node1 = {
		text = managers.localization:text("resmod_1st_time_confirm")
	}
	
	welcome_message.button_list = {
		node1
	}

	managers.menu:show_video_message_dialog(welcome_message)
end)
--]]
