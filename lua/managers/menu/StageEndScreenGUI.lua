if restoration.Options:GetValue("HUD/UI/Loadouts") then
function StatsTabItem:init(panel, tab_panel, text, i)
	self._main_panel = panel
	self._panel = self._main_panel:panel({
		h = self._main_panel:h() - 70
	})
	self._index = i
	local prev_item_title_text = tab_panel:child("tab_text_" .. tostring(i - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() or 0
	self._tab_text = tab_panel:text({
		name = "tab_text_" .. tostring(self._index),
		text = text,
		h = 32,
		x = offset + 5,
		align = "center",
		vertical = "center",
		font_size = 30,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_blue_selected,
		layer = 1--,
		--blend_mode = "add"
	})
	local x, y, w, h = self._tab_text:text_rect()
	self._tab_text:set_size(w + 10, h)
	self._select_rect = tab_panel:bitmap({
		name = "tab_select_rect_" .. tostring(self._index),
		texture = "guis/textures/pd2/shared_tab_box",
		layer = 0,
		color = tweak_data.screen_colors.text,
		visible = false
	})
	self._select_rect:set_shape(self._tab_text:shape())
	self._panel:set_top(self._tab_text:bottom() - 2)
	self._panel:grow(0, -self._panel:y())
	self:deselect()
end

function StatsTabItem:select()
	self:show()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_color_blue_selected)
		self._tab_text:set_blend_mode("normal")
	end
	self._selected = true
end
function StatsTabItem:deselect()
	self:hide()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_color_blue_noselected)
		--self._tab_text:set_blend_mode("add")
	end
	self._selected = false
end

function StatsTabItem:mouse_moved(x, y, mouse_over_scroll)
	if( self._tab_text:inside( x, y ) ) then
		self._tab_text:set_color( self._selected and tweak_data.screen_color_blue_selected or tweak_data.screen_color_blue_highlighted ) -- set_alpha( math.max( self._tab_text:alpha(), 0.75 ) )
	else
		self._tab_text:set_color( self._selected and tweak_data.screen_color_blue_selected or tweak_data.screen_color_blue_noselected ) -- set_alpha( self._selected and 1 or 0.5 )
	end
end

function StatsTabItem:set_stats(stats_data)
	self._stats = stats_data or {}
	local prev_stat_panel
	local widest_text = 0
	local create_gage_assignment = table.contains(stats_data, "gage_assignment_summary")
	if create_gage_assignment then
		do
			local assignment_list = {}
			local gage_tweak_data = tweak_data.gage_assignment
			for assignment, _ in pairs(gage_tweak_data:get_assignments()) do
				table.insert(assignment_list, assignment)
			end
			table.sort(assignment_list, function(x, y)
				return gage_tweak_data:get_value(x, "aquire") < gage_tweak_data:get_value(y, "aquire")
			end)
			local new_stat_panel = self._panel:panel({
				name = "title",
				h = tweak_data.menu.default_font,
				y = 10
			})
			local num_text
			local desc_text = new_stat_panel:text({
				name = "desc",
				text = managers.localization:to_upper_text("menu_es_gage_assignments_found"),
				font_size = tweak_data.menu.default_font_size,
				font = tweak_data.menu.default_font,
				color = tweak_data.screen_colors.text
			})
			local stat_text = new_stat_panel:text({
				name = "stat",
				text = managers.localization:to_upper_text("menu_es_gage_assignments_progress"),
				font_size = tweak_data.menu.default_font_size,
				font = tweak_data.menu.default_font,
				color = tweak_data.screen_colors.text
			})
			local reward_text, nx, ny, nw, nh
			local dx, dy, dw, dh = self:make_fine_text(desc_text)
			local sx, sy, sw, sh = self:make_fine_text(stat_text)
			local rx, ry, rw, rh
			new_stat_panel:set_h(math.max(dh, sh))
			desc_text:set_x(10)
			stat_text:set_center_x(self._panel:w() / 2)
			if prev_stat_panel then
				new_stat_panel:set_top(prev_stat_panel:bottom())
			end
			prev_stat_panel = new_stat_panel
			local title_desc = desc_text
			local title_stat = stat_text
			local num_string, desc_string, stat_string, reward_string, found, progress, completed, to_aquire, dlc, has_dlc, last_dlc
			for i, assignment in ipairs(assignment_list) do
				to_aquire = gage_tweak_data:get_value(assignment, "aquire")
				completed = managers.gage_assignment:get_latest_completed(assignment) or 0
				found = managers.gage_assignment:get_latest_progress(assignment) or 0
				progress = (managers.gage_assignment:get_assignment_progress(assignment) or 0) + completed * to_aquire
				dlc = gage_tweak_data:get_value(assignment, "dlc")
				has_dlc = not dlc or managers.dlc:is_dlc_unlocked(dlc)
				num_string = string.format("%0.2d", found) or 0
				desc_string = managers.localization:to_upper_text(gage_tweak_data:get_value(assignment, "name_id"))
				stat_string = string.format("%0.2d", progress) .. " / " .. string.format("%0.2d", to_aquire)
				if not (completed < 2) or not managers.localization:to_upper_text("menu_es_gage_assignment_reward") then
				end
				reward_string = " - " .. managers.localization:to_upper_text("menu_es_gage_assignment_reward_plural", {completed = completed})
				if not has_dlc then
					stat_string = ""
					if last_dlc ~= dlc then
						reward_string = managers.localization:to_upper_text(tweak_data:get_raw_value("lootdrop", "global_values", dlc, "unlock_id"))
					else
						reward_string = ""
					end
				end
				new_stat_panel = self._panel:panel({
					name = assignment,
					h = tweak_data.menu.pd2_medium_font_size,
					y = 10
				})
				num_text = new_stat_panel:text({
					name = "num",
					text = num_string,
					font_size = tweak_data.menu.default_font_size,
					font = tweak_data.menu.default_font,
					color = tweak_data.screen_colors.text
				})
				desc_text = new_stat_panel:text({
					name = "desc",
					text = desc_string,
					font_size = tweak_data.menu.default_font_size,
					font = tweak_data.menu.default_font,
					color = tweak_data.screen_colors.text
				})
				stat_text = new_stat_panel:text({
					name = "stat",
					text = stat_string,
					font_size = tweak_data.menu.default_font_size,
					font = tweak_data.menu.default_font,
					color = tweak_data.screen_colors.text
				})
				reward_text = new_stat_panel:text({
					name = "reward",
					text = reward_string,
					font_size = tweak_data.menu.default_font_size,
					font = tweak_data.menu.default_font,
					color = tweak_data.screen_colors.text
				})
				nx, ny, nw, nh = self:make_fine_text(num_text)
				dx, dy, dw, dh = self:make_fine_text(desc_text)
				sx, sy, sw, sh = self:make_fine_text(stat_text)
				rx, ry, rw, rh = self:make_fine_text(reward_text)
				new_stat_panel:set_h(math.max(nh, dh, sh, rh))
				num_text:set_alpha(found > 0 and 1 or 0.5)
				desc_text:set_alpha(found > 0 and 1 or 0.5)
				stat_text:set_alpha(progress > 0 and 1 or 0.5)
				reward_text:set_alpha(completed > 0 and 1 or 0)
				num_text:set_x(15)
				desc_text:set_x(num_text:right() + 5)
				stat_text:set_center_x(self._panel:w() / 2)
				reward_text:set_x(stat_text:right())
				if not has_dlc then
					stat_text:set_alpha(0)
					if last_dlc ~= dlc then
						reward_text:set_color(tweak_data.screen_colors.important_1)
						reward_text:set_alpha(1)
						reward_text:set_x(title_stat:x())
						if reward_text:right() > new_stat_panel:w() then
							reward_text:set_right(new_stat_panel:w())
						end
					else
						reward_text:set_alpha(0)
					end
					last_dlc = dlc
				end
				if prev_stat_panel then
					new_stat_panel:set_top(prev_stat_panel:bottom())
				end
				prev_stat_panel = new_stat_panel
			end
		end
	else
		for i, stat in ipairs(self._stats) do
			local new_stat_panel = self._panel:panel({
				name = tostring(stat),
				h = tweak_data.menu.pd2_medium_font_size,
				y = 10
			})
			local desc_text = new_stat_panel:text({
				name = "desc",
				text = managers.localization:to_upper_text("victory_" .. stat),
				font_size = tweak_data.menu.default_font_size,
				font = tweak_data.menu.default_font,
				color = tweak_data.screen_colors.text,
				align = "right",
				vertical = "top",
				w = math.round(self._panel:w() / 2) - 5 - 10,
				x = 10,
				wrap = true,
				word_wrap = true
			})
			local stat_text = new_stat_panel:text({
				name = "stat",
				text = "",
				font_size = tweak_data.menu.default_font_size,
				font = tweak_data.menu.default_font,
				color = tweak_data.screen_colors.text,
				align = "left",
				vertical = "top",
				w = math.round(self._panel:w() / 2) - 10,
				x = math.round(self._panel:w() / 2) + 5,
				wrap = true,
				word_wrap = true
			})
			local _, _, _, dh = desc_text:text_rect()
			local _, _, _, sh = stat_text:text_rect()
			local max_h = math.max(dh, sh)
			desc_text:set_h(max_h)
			stat_text:set_h(max_h)
			new_stat_panel:set_h(max_h)
			if prev_stat_panel then
				new_stat_panel:set_top(prev_stat_panel:bottom())
			end
			prev_stat_panel = new_stat_panel
		end
	end
end

function StageEndScreenGui:init(saferect_ws, fullrect_ws, statistics_data)
	self._safe_workspace = saferect_ws
	self._full_workspace = fullrect_ws
	self._fullscreen_panel = self._full_workspace:panel():panel({layer = 1})
	self._panel = self._safe_workspace:panel():panel({
		w = self._safe_workspace:panel():w() / 2 - 10,
		h = self._safe_workspace:panel():h() * 0.5 - 10,
		layer = 6
	})
	self._panel:set_right(self._safe_workspace:panel():w())
	self._panel:set_bottom(self._safe_workspace:panel():h())
	if managers.crime_spree:is_active() then
		self._panel:set_bottom(self._safe_workspace:panel():h() - (CrimeSpreeMissionsMenuComponent.get_height() + 10))
	else
		self._panel:set_bottom(self._safe_workspace:panel():h())
	end
	local continue_button = managers.menu:is_pc_controller() and "[ENTER]" or nil
	local continue_text = utf8.to_upper(managers.localization:text("menu_es_calculating_experience", {CONTINUE = continue_button}))
	if managers.crime_spree:is_active() then
		continue_text = ""
	end
	self._continue_button = self._panel:text({
		name = "ready_button",
		text = continue_text,
		h = 32,
		align = "right",
		vertical = "center",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_yellow,
		layer = 1
	})
	local _, _, w, h = self._continue_button:text_rect()
	self._continue_button:set_size(w, h)
	self._continue_button:set_bottom(self._panel:h())
	self._continue_button:set_right(self._panel:w())
	self._button_not_clickable = true
	--self._continue_button:set_color(tweak_data.screen_colors.item_stage_1)
	self._scroll_panel = self._panel:panel({
		name = "scroll_panel"
	})
	self._tab_panel = self._scroll_panel:panel({name = "tab_panel"})
	local big_text = self._fullscreen_panel:text({
		name = "continue_big_text",
		text = continue_text,
		h = 90,
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.eroded_font,
		color = tweak_data.screen_color_yellow,
		alpha = 0.4
	})
	local x, y = managers.gui_data:safe_to_full_16_9(self._continue_button:world_right(), self._continue_button:world_center_y())
	big_text:set_world_right(x)
	big_text:set_world_center_y(y)
	big_text:move(13, -9)
	if MenuBackdropGUI then
		MenuBackdropGUI.animate_bg_text(self, big_text)
	end
	self._items = {}
	local item
	local tab_height = 0
	local show_summary = true
	if managers.crime_spree:is_active() then
		show_summary = false
		item = CrimeSpreeResultTabItem:new(self._panel, self._tab_panel, utf8.to_upper(managers.localization:text("menu_es_crime_spree_summary")), 1)
		table.insert(self._items, item)
	end
	if show_summary then
		item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper(managers.localization:text("menu_es_summary")), 1)
		item:set_stats({
			"stage_cash_summary"
		})
		table.insert(self._items, item)
	end
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper( managers.localization:text( "menu_es_boost" ) ), 2)
	item:set_stats({
		"most_downs",
		-- "most_downs_score",
		
		"best_accuracy",
		-- "best_accuracy_score",
		
		"best_killer",
		-- "best_kills_score",
		
		"best_special"
		-- "best_special_kills_score",
	})
	table.insert(self._items, item)
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper( managers.localization:text( "menu_es_crew" ) ), 3)
	item:set_stats({
		"group_total_downed",
		"group_hit_accuracy",
		"criminals_finished"
	})
	table.insert(self._items, item)
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper(managers.localization:text("menu_es_personal")), 4)
	item:set_stats({
		"total_head_shots",
		"total_kills",
		"total_specials_kills",
		
		"hit_accuracy",
		"favourite_weapon"
	})
	table.insert(self._items, item)
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper( managers.localization:text( "menu_es_bad" ) ), 5)
	item:set_stats({
		"civilians_killed_penalty",
		"total_downed"
	})
	table.insert(self._items, item)
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper( managers.localization:text( "menu_es_other" ) ), 6)
	item:set_stats({
		"time_played",
		
		"completed_objectives",
		
		"last_completed_challenge",
		"stage_safehouse_summary"
	})
	table.insert(self._items, item)
	item = StatsTabItem:new(self._panel, self._tab_panel, utf8.to_upper(managers.localization:text("menu_es_stats_gage_assignment")), 7)
	item:set_stats({
		"gage_assignment_summary"
	})
	table.insert(self._items, item)
	local scroll_w = self._panel:w() - self._scroll_panel:x()
	local ix, iy, iw, ih = self._items[#self._items]:tab_text_shape()
	self._tab_panel:set_w(ix + iw + 5)
	self._tab_panel:set_h(ih)
	self._scroll_panel:set_w(scroll_w)
	self._scroll_panel:set_h(ih)
	if self._console_subtitle_string_id then
		self:console_subtitle_callback(self._console_subtitle_string_id)
	end
	self:select_tab(1, true)
	self._items[self._selected_item]:select()
	local box_panel = self._panel:panel()
	box_panel:set_shape(self._items[self._selected_item]._panel:shape())
	if statistics_data then
		self:feed_statistics(statistics_data)
	end
	self._enabled = true
	if managers.job:stage_success() then
		self._bain_debrief_t = TimerManager:main():time() + 2.5
	end
end

function StageEndScreenGui:feed_statistics(data)
	data = data or {}
	data.total_objectives = managers.objectives:total_objectives(Global.level_data and Global.level_data.level_id)
	data.completed_ratio = data.success and managers.statistics:started_session_from_beginning() and 100 or data.total_objectives ~= 0 and math.round(managers.statistics:completed_objectives() / data.total_objectives * 100)
	data.completed_objectives = managers.localization:text("menu_completed_objectives_of", {
		COMPLETED = managers.statistics:completed_objectives(),
		TOTAL = data.total_objectives,
		PERCENT = data.completed_ratio
	})
	data.time_played = managers.statistics:session_time_played()
	data.total_downed = managers.statistics:total_downed()
	data.favourite_weapon = managers.statistics:session_favourite_weapon()
	data.hit_accuracy = managers.statistics:session_hit_accuracy() .. "%"
	data.total_kills = managers.statistics:session_total_kills()
	data.total_specials_kills = managers.statistics:session_total_specials_kills()
	data.total_head_shots = managers.statistics:session_total_head_shots()
	data.civilians_killed_penalty = managers.statistics:session_total_civilian_kills()
	data.last_completed_challenge = (pdth_hud and managers.challenges:get_last_comleted_title_text() or managers.localization:text("RestorationPDTHHudNeeded") )
	self._data = data or {}
	for i, item in ipairs(self._items) do
		item:feed_statistics(data)
	end
end

function StageEndScreenGui:set_continue_button_text(text, not_clickable)
	self._continue_button:set_text(text)
	self._fullscreen_panel:child("continue_big_text"):set_text(text)
	self._button_not_clickable = not_clickable
	local _, _, w = self._continue_button:text_rect()
	self._continue_button:set_width(w)
	self._continue_button:set_bottom(self._panel:h())
	self._continue_button:set_right(self._panel:w())
	self._continue_button:set_color(self._button_not_clickable and tweak_data.screen_color_yellow_noselected or tweak_data.screen_color_yellow)
end

function StageEndScreenGui:mouse_moved(x, y)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false
	end
	local mouse_over_tab = false
	local mouse_over_scroll = self._scroll_panel:inside(x, y)
	for _, tab in ipairs(self._items) do
		local selected, highlighted = tab:mouse_moved(x, y, mouse_over_scroll)
		if highlighted and not selected then
			mouse_over_tab = true
		end
	end
	if mouse_over_tab then
		return true, "link"
	end
	if alive(self._prev_page) then
		if self._prev_page:visible() and self._prev_page:inside(x, y) then
			if not self._prev_page_highlighted then
				self._prev_page_highlighted = true
				self._prev_page:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return true, "link"
		elseif self._prev_page_highlighted then
			self._prev_page_highlighted = false
			self._prev_page:set_color(tweak_data.screen_colors.button_stage_3)
		end
	end
	if alive(self._next_page) then
		if self._next_page:visible() and self._next_page:inside(x, y) then
			if not self._next_page_highlighted then
				self._next_page_highlighted = true
				self._next_page:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
			return true, "link"
		elseif self._next_page_highlighted then
			self._next_page_highlighted = false
			self._next_page:set_color(tweak_data.screen_colors.button_stage_3)
		end
	end
	if self._button_not_clickable then
		self._continue_button:set_color(tweak_data.screen_color_yellow_noselected)
	elseif self._continue_button:inside(x, y) then
		if not self._continue_button_highlighted then
			self._continue_button_highlighted = true
			self._continue_button:set_color(tweak_data.screen_color_yellow_selected)
			managers.menu_component:post_event("highlight")
		end
		return true, "link"
	elseif self._continue_button_highlighted then
		self._continue_button_highlighted = false
		self._continue_button:set_color(tweak_data.screen_color_yellow)
		managers.menu_component:post_event("highlight")
	end
	if managers.hud._hud_stage_endscreen and managers.hud._hud_stage_endscreen._backdrop then
		managers.hud._hud_stage_endscreen._backdrop:mouse_moved(x, y)
	end
	return false, "arrow"
	end
end
