function MenuCallbackHandler:on_visit_res_guide()
	local english = Idstring("english"):key() == SystemInfo:language():key()
	local russian = Idstring("russian"):key() == SystemInfo:language():key()
	local korean = Idstring("korean"):key() == SystemInfo:language():key()
	if english then
		managers.network.account:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667")
	elseif russian then
		managers.network.account:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1923528592")
	elseif korean then
		managers.network.account:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=2927620125")
	else
		managers.network.account:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667")
	end
end

function MenuCallbackHandler:open_crew_management()
	managers.menu:open_node("crew_management")
end

function MenuCallbackHandler:open_side_jobs()
	managers.menu:open_node("side_jobs")
end

function MenuCallbackHandler:SCEnabled()
	return true
end

function MenuManager:keep_overhaul_on()
	local option = true

	managers.menu:post_event("menu_enter")
end

function MenuManager:keep_overhaul_off()
	local option = false
end

function MenuManager:close_game()
	managers.menu:post_event("menu_enter")
	Application:close()
end

function MenuManager:show_overhaul_dialog(func)
	local count = 60
	local dialog_data = {
		title = managers.localization:text("Warning_overhaul_title"),
		text = managers.localization:text("dialog_show_overhaul_dialog", {
			TIME = count
		}),
		id = "accept_changes"
	}
	-- local cancel_button = {
	-- 	text = managers.localization:text("dialog_cancel"),
	-- 	callback_func = callback(self, self, "keep_overhaul_on"),
	-- 	cancel_button = true
	-- }
	local ok_button = {
		text = managers.localization:text("dialog_ok"),
		callback_func = callback(self, self, "close_game")
	}
	dialog_data.button_list = {
		ok_button
	}
	dialog_data.counter = {
		1,
		function ()
			count = count - 1

			if count < 0 then
				self:close_game()
				managers.system_menu:close(dialog_data.id)
			else
				local dlg = managers.system_menu:get_dialog(dialog_data.id)

				if dlg then
					dlg:set_text(managers.localization:text("dialog_show_overhaul_dialog", {
						TIME = count
					}), true)
				end
			end
		end
	}

	managers.system_menu:show(dialog_data)
end

function MenuManager:enable_overhaul_dialog(func)
	local count = 60
	local dialog_data = {
		title = managers.localization:text("Warning_overhaul_title"),
		text = managers.localization:text("dialog_enable_overhaul_dialog", {
			TIME = count
		}),
		id = "accept_changes"
	}
	local ok_button = {
		text = managers.localization:text("dialog_ok"),
		callback_func = callback(self, self, "close_game")
	}
	dialog_data.button_list = {
		ok_button
	}
	dialog_data.counter = {
		1,
		function ()
			count = count - 1

			if count < 0 then
				self:close_game()
				managers.system_menu:close(dialog_data.id)
			else
				local dlg = managers.system_menu:get_dialog(dialog_data.id)

				if dlg then
					dlg:set_text(managers.localization:text("dialog_enable_overhaul_dialog", {
						TIME = count
					}), true)
				end
			end
		end
	}

	managers.system_menu:show(dialog_data)
end

PDTHHudChallenges = PDTHHudChallenges or class()
function PDTHHudChallenges:refresh_node(node, data)
	local selected_item = node:selected_item() and node:selected_item():name()
	node = self:modify_node(node, data)
	if selected_item then
		node:select_item(selected_item)
	end
	return node
end

PDTHHudCompletedChallenges = PDTHHudCompletedChallenges or class(PDTHHudChallenges)
function PDTHHudCompletedChallenges:modify_node(node, data)
	node:clean_items()
    for _,data in pairs(managers.challenges_res:get_completed()) do
        local params = {
                name = data.id,
                text_id	= string.upper(data.name),
                description_text = string.upper(data.description),
                localize = "false",
                challenge = data.id,
                awarded	= true
            }
        local new_item = node:create_item({type = "MenuItemChallenge"}, params)
        node:add_item(new_item)
    end
    managers.menu:add_back_button(node)
	return node
end

PDTHHudActiveChallenges = PDTHHudActiveChallenges or class(PDTHHudChallenges)
function PDTHHudActiveChallenges:modify_node(node, data)
	node:clean_items()
	for _,data in pairs(managers.challenges_res:get_near_completion()) do
		local title_text = managers.challenges_res:get_title_text(data.id)
		local description_text = managers.challenges_res:get_description_text(data.id)
		local params = {
			name = data.id,
			text_id	= string.upper(title_text),
			description_text = string.upper(description_text),
			localize = "false",
			challenge = data.id
		}
		local new_item = node:create_item({type = "MenuItemChallenge"}, params)
		node:add_item(new_item)
	end
	managers.menu:add_back_button(node)
	return node
end