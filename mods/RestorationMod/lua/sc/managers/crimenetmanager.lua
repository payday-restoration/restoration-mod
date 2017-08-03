function CrimeNetManager:_find_online_games_win32(friends_only)
	local function f(info)
		managers.network.matchmake:search_lobby_done()
		local room_list = info.room_list
		local attribute_list = info.attribute_list
		local dead_list = {}
		for id, _ in pairs(self._active_server_jobs) do
			dead_list[id] = true
		end
		for i, room in ipairs(room_list) do
			local name_str = tostring(room.owner_name)
			local attributes_numbers = attribute_list[i].numbers
			local attributes_mutators = attribute_list[i].mutators
			if managers.network.matchmake:is_server_ok(friends_only, room.owner_id, attributes_numbers, nil, attributes_mutators) then
				dead_list[room.room_id] = nil
				local host_name = name_str
				local level_id = tweak_data.levels:get_level_name_from_index(attributes_numbers[1] % 1000)
				local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
				local level_name = name_id and managers.localization:text(name_id) or "LEVEL NAME ERROR"
				local difficulty_id = attributes_numbers[2]
				local difficulty = tweak_data:index_to_difficulty(difficulty_id)
				local job_id = tweak_data.narrative:get_job_name_from_index(math.floor(attributes_numbers[1] / 1000))
				local kick_option = attributes_numbers[8]
				local job_plan = attributes_numbers[10]
				local drop_in = attributes_numbers[6]
				local permission = attributes_numbers[3]
				local min_level = attributes_numbers[7]
				local state_string_id = tweak_data:index_to_server_state(attributes_numbers[4])
				local state_name = state_string_id and managers.localization:text("menu_lobby_server_state_" .. state_string_id) or "UNKNOWN"
				local state = attributes_numbers[4]
				local num_plrs = attributes_numbers[5]
				local is_friend = false
				if Steam:logged_on() and Steam:friends() then
					for _, friend in ipairs(Steam:friends()) do
						if friend:id() == room.owner_id then
							is_friend = true
						else
						end
					end
				end
				if name_id then
					if not self._active_server_jobs[room.room_id] then
						if table.size(self._active_jobs) + table.size(self._active_server_jobs) < tweak_data.gui.crime_net.job_vars.total_active_jobs and table.size(self._active_server_jobs) < self._max_active_server_jobs then
							self._active_server_jobs[room.room_id] = {added = false, alive_time = 0}
							managers.menu_component:add_crimenet_server_job({
								room_id = room.room_id,
								id = room.room_id,
								level_id = level_id,
								difficulty = difficulty,
								difficulty_id = difficulty_id,
								num_plrs = num_plrs,
								host_name = host_name,
								state_name = state_name,
								state = state,
								level_name = level_name,
								job_id = job_id,
								is_friend = is_friend,
								kick_option = kick_option,
								job_plan = job_plan,
								mutators = attribute_list[i].mutators,
								is_crime_spree = attribute_list[i].crime_spree and 0 <= attribute_list[i].crime_spree,
								crime_spree = attribute_list[i].crime_spree,
								crime_spree_mission = attribute_list[i].crime_spree_mission,
								is_heist_war = attribute_list[i].is_heist_war,
								drop_in = drop_in,
								permission = permission,
								min_level = min_level
							})
						end
					else
						managers.menu_component:update_crimenet_server_job({
							room_id = room.room_id,
							id = room.room_id,
							level_id = level_id,
							difficulty = difficulty,
							difficulty_id = difficulty_id,
							num_plrs = num_plrs,
							host_name = host_name,
							state_name = state_name,
							state = state,
							level_name = level_name,
							job_id = job_id,
							is_friend = is_friend,
							kick_option = kick_option,
							job_plan = job_plan,
							mutators = attribute_list[i].mutators,
							is_crime_spree = attribute_list[i].crime_spree and 0 <= attribute_list[i].crime_spree,
							crime_spree = attribute_list[i].crime_spree,
							crime_spree_mission = attribute_list[i].crime_spree_mission,
							is_heist_war = attribute_list[i].is_heist_war,
							drop_in = drop_in,
							permission = permission,
							min_level = min_level
						})
					end
				end
			end
		end
		for id, _ in pairs(dead_list) do
			self._active_server_jobs[id] = nil
			managers.menu_component:remove_crimenet_gui_job(id)
		end
	end
	managers.network.matchmake:register_callback("search_lobby", f)
	managers.network.matchmake:search_lobby(friends_only)
	local usrs_f = function(success, amount)
		if success then
			managers.menu_component:set_crimenet_players_online(amount)
		end
	end
	Steam:sa_handler():concurrent_users_callback(usrs_f)
	Steam:sa_handler():get_concurrent_users()
end

function CrimeNetGui:_create_job_gui(data, type, fixed_x, fixed_y, fixed_location)
	local level_id = data.level_id
	local level_data = tweak_data.levels[level_id]
	local narrative_data = data.job_id and tweak_data.narrative:job_data(data.job_id)
	local is_special = type == "special" or type == "crime_spree"
	local is_server = type == "server"
	local is_crime_spree = type == "crime_spree"
	local is_heist_war = type == "heist_war"
	local is_professional = narrative_data and narrative_data.professional
	local got_job = data.job_id and true or false
	local x = fixed_x
	local y = fixed_y
	local location = fixed_location
	if is_special then
		x = data.x
		y = data.y
		if x and y then
			local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
			local th = math.max(self._map_panel:child("map"):texture_height(), 1)
			x = math.round(x / tw * self._map_size_w)
			y = math.round(y / th * self._map_size_h)
		end
	end
	if not x and not y then
		x, y, location = self:_get_job_location(data)
	end
	if location and location[3] then
		Application:error("[CrimeNetGui:_create_job_gui] Location already taken!", x, y)
	end
	local color = Color.white
	local friend_color = tweak_data.screen_colors.friend_color
	local regular_color = tweak_data.screen_colors.regular_color
	local pro_color = tweak_data.screen_colors.pro_color
	local side_panel = self._pan_panel:panel({layer = 26, alpha = 0})
	local heat_glow
	local stars_panel = side_panel:panel({
		name = "stars_panel",
		layer = -1,
		visible = true,
		w = 100
	})
	local num_stars = 0
	local star_size = 16
	local job_num = 0
	local job_cash = 0
	local difficulty_name = side_panel:text({
		name = "difficulty_name",
		text = "",
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local heat_name = side_panel:text({
		name = "heat_name",
		text = "",
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "add",
		layer = 0
	})
	local got_heat = false
	local range_colors = {}
	local text_string = managers.localization:to_upper_text("menu_exp_short")
	local mul_to_procent_string = function(multiplier)
		local pro = math.round(multiplier * 100)
		local procent_string
		if pro == 0 and multiplier ~= 0 then
			procent_string = string.format("%0.2f", math.abs(multiplier * 100))
		else
			procent_string = tostring(math.abs(pro))
		end
		return (multiplier < 0 and " -" or " +") .. procent_string .. "%"
	end
	local got_heat_text = false
	local has_ghost_bonus = managers.job:has_ghost_bonus()
	if has_ghost_bonus then
		do
			local ghost_bonus_mul = managers.job:get_ghost_bonus()
			local job_ghost_string = mul_to_procent_string(ghost_bonus_mul)
			local s = utf8.len(text_string)
			text_string = text_string .. job_ghost_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.ghost_color
			})
			got_heat_text = true
		end
		local skill_bonus = managers.player:get_skill_exp_multiplier()
		skill_bonus = skill_bonus - 1
		if skill_bonus > 0 then
			local s = utf8.len(text_string)
			local skill_string = mul_to_procent_string(skill_bonus)
			text_string = text_string .. skill_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.skill_color
			})
			got_heat_text = true
		end
		local infamy_bonus = managers.player:get_infamy_exp_multiplier()
		infamy_bonus = infamy_bonus - 1
		if infamy_bonus > 0 then
			local s = utf8.len(text_string)
			local infamy_string = mul_to_procent_string(infamy_bonus)
			text_string = text_string .. infamy_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.lootdrop.global_values.infamy.color
			})
			got_heat_text = true
		end
		local limited_bonus = tweak_data:get_value("experience_manager", "limited_bonus_multiplier") or 1
		limited_bonus = limited_bonus - 1
		if limited_bonus > 0 then
			local s = utf8.len(text_string)
			local limited_string = mul_to_procent_string(limited_bonus)
			text_string = text_string .. limited_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				tweak_data.screen_colors.button_stage_2
			})
			got_heat_text = true
		end
	end
	local job_heat = managers.job:get_job_heat(data.job_id) or 0
	local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1
	if data.job_id then
		local x = 0
		local y = 0
		local job_stars = math.ceil(tweak_data.narrative:job_data(data.job_id).jc / 10)
		local difficulty_stars = data.difficulty_id - 2
		local job_and_difficulty_stars = job_stars + difficulty_stars
		local start_difficulty = 1
		local num_difficulties = Global.SKIP_OVERKILL_290 and 5 or 6
		for i = start_difficulty, num_difficulties do
			stars_panel:bitmap({
				texture = "guis/textures/pd2/cn_miniskull",
				x = x,
				y = y,
				w = 12,
				h = 16,
				texture_rect = {
					0,
					0,
					12,
					16
				},
				alpha = i > difficulty_stars and 0.5 or 1,
				blend_mode = i > difficulty_stars and "normal" or "add",
				layer = 0,
				color = i > difficulty_stars and Color.black or tweak_data.screen_colors.risk
			})
			x = x + 11
			num_stars = num_stars + 1
		end
		job_num = #tweak_data.narrative:job_chain(data.job_id)
		local total_payout, base_payout, risk_payout = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, job_num, data.job_id)
		job_cash = managers.experience:cash_string(math.round(total_payout))
		local difficulty_string = managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty_id]])
		difficulty_name:set_text(difficulty_string)
		difficulty_name:set_color(difficulty_stars > 0 and tweak_data.screen_colors.risk or tweak_data.screen_colors.text)
		local heat_alpha = math.abs(job_heat) / 100
		local heat_size = 1
		local heat_color = managers.job:get_job_heat_color(data.job_id)
		heat_glow = self._pan_panel:bitmap({
			texture = "guis/textures/pd2/hot_cold_glow",
			layer = 11,
			w = 256 * heat_size,
			h = 256 * heat_size,
			blend_mode = "add",
			color = heat_color,
			alpha = 0
		})
		if job_heat_mul ~= 0 then
			local s = utf8.len(text_string)
			local heat_string = mul_to_procent_string(job_heat_mul)
			text_string = text_string .. heat_string
			table.insert(range_colors, {
				s,
				utf8.len(text_string),
				heat_color
			})
			got_heat = true
			got_heat_text = true
			heat_glow:set_alpha(heat_alpha)
		end
	end
	heat_name:set_text(text_string)
	for i, range in ipairs(range_colors) do
		if i == 1 then
			local s, e, c = unpack(range)
			heat_name:set_range_color(0, e, c)
		else
			heat_name:set_range_color(unpack(range))
		end
	end
	local job_tweak = tweak_data.narrative:job_data(data.job_id)
	local host_string = data.host_name or is_professional and managers.localization:to_upper_text("cn_menu_pro_job") or " "
	local job_string = data.job_id and managers.localization:to_upper_text(job_tweak.name_id) or data.level_name or "NO JOB"
	local contact_string = utf8.to_upper(data.job_id and managers.localization:text(tweak_data.narrative.contacts[job_tweak.contact].name_id)) or "BAIN"
	contact_string = contact_string .. ": "
	local info_string = managers.localization:to_upper_text("cn_menu_contract_short_" .. (job_num > 1 and "plural" or "singular"), {days = job_num, money = job_cash})
	info_string = info_string .. (data.state_name and " / " .. data.state_name or "")
	if is_special then
		job_string = data.name_id and managers.localization:to_upper_text(data.name_id) or ""
		info_string = data.desc_id and managers.localization:to_upper_text(data.desc_id) or ""
		if is_crime_spree then
			info_string = managers.crime_spree:in_progress() and "cn_crime_spree_help_continue" or "cn_crime_spree_help_start"
			info_string = managers.localization:to_upper_text(info_string) or ""
		end
	end
	local job_plan_icon
	if is_server and data.job_plan and data.job_plan ~= -1 then
		local texture = data.job_plan == 1 and "guis/textures/pd2/cn_playstyle_loud" or "guis/textures/pd2/cn_playstyle_stealth"
		job_plan_icon = side_panel:bitmap({
			name = "job_plan_icon",
			texture = texture,
			x = 0,
			y = 2,
			w = 16,
			h = 16,
			alpha = 1,
			blend_mode = "normal",
			layer = 0,
			color = Color.white
		})
	end
	local host_name = side_panel:text({
		name = "host_name",
		text = host_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = data.is_friend and friend_color or is_server and regular_color or pro_color,
		blend_mode = "add"
	})
	local job_name = side_panel:text({
		name = "job_name",
		text = job_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "normal",
		layer = 0
	})
	local contact_name = side_panel:text({
		name = "contact_name",
		text = contact_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "normal",
		layer = 0
	})
	local info_name = side_panel:text({
		name = "info_name",
		text = info_string,
		vertical = "center",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = color,
		blend_mode = "normal",
		layer = 0
	})
	if data.mutators then
		job_name:set_color(tweak_data.screen_colors.mutators_color_text)
		contact_name:set_color(tweak_data.screen_colors.mutators_color_text)
		info_name:set_color(tweak_data.screen_colors.mutators_color_text)
	end
	if is_crime_spree or data.is_crime_spree then
		job_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		contact_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		info_name:set_color(tweak_data.screen_colors.crime_spree_risk)
		if is_crime_spree then
			stars_panel:text({
				name = "spree_level",
				text = managers.localization:to_upper_text("menu_cs_level", {
					level = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
				}),
				vertical = "center",
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.crime_spree_risk,
				blend_mode = "normal",
				layer = 0
			})
		end
	end
	if is_heist_war or data.is_heist_war then
		job_name:set_color(tweak_data.screen_colors.pro_color)
		contact_name:set_color(tweak_data.screen_colors.pro_color)
		info_name:set_color(tweak_data.screen_colors.pro_color)
	end
	stars_panel:set_w(star_size * math.min(11, #stars_panel:children()))
	stars_panel:set_h(star_size)
	local focus = self._pan_panel:bitmap({
		name = "focus",
		texture = "guis/textures/crimenet_map_circle",
		layer = 10,
		color = color:with_alpha(0.6),
		blend_mode = "add"
	})
	do
		local x = job_plan_icon and job_plan_icon:right() + 2 or 0
		local _, _, w, h = host_name:text_rect()
		host_name:set_size(w, h)
		host_name:set_position(x, 0)
		if not is_server then
		end
	end
	do
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom() - 2)
	end
	do
		local _, _, w, h = contact_name:text_rect()
		contact_name:set_size(w, h)
		contact_name:set_top(job_name:top())
		contact_name:set_right(0)
	end
	do
		local _, _, w, h = info_name:text_rect()
		info_name:set_size(w, h - 3)
		info_name:set_top(contact_name:bottom() - 3)
		info_name:set_right(0)
	end
	do
		local _, _, w, h = difficulty_name:text_rect()
		difficulty_name:set_size(w, h)
		difficulty_name:set_top(info_name:bottom() - 3)
		difficulty_name:set_right(0)
	end
	do
		local _, _, w, h = heat_name:text_rect()
		heat_name:set_size(w, h - 4)
		heat_name:set_top(difficulty_name:bottom() - 3)
		heat_name:set_right(0)
	end
	if not got_heat_text then
		heat_name:set_text(" ")
		heat_name:set_w(1)
		heat_name:set_position(0, host_name:bottom() - 3)
	end
	if is_special then
		contact_name:set_text(" ")
		contact_name:set_size(0, 0)
		contact_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif data.is_crime_spree then
		local text = ""
		if data.state == 2 or data.state == 3 then
			local mission_data = managers.crime_spree:get_mission(data.crime_spree_mission)
			if mission_data then
				local tweak = tweak_data.levels[mission_data.level.level_id]
				text = managers.localization:text(tweak and tweak.name_id or "No level")
			else
				text = "No mission ID"
			end
		else
			text = managers.localization:text("menu_lobby_server_state_in_lobby")
		end
		job_name:set_text(utf8.to_upper(text))
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	elseif not got_job then
		job_name:set_text(data.state_name or managers.localization:to_upper_text("menu_lobby_server_state_in_lobby"))
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		job_name:set_position(0, host_name:bottom())
		contact_name:set_text(" ")
		contact_name:set_w(0, 0)
		contact_name:set_position(0, host_name:bottom())
		info_name:set_text(" ")
		info_name:set_size(0, 0)
		info_name:set_position(0, host_name:bottom())
		difficulty_name:set_text(" ")
		difficulty_name:set_w(0, 0)
		difficulty_name:set_position(0, host_name:bottom())
		heat_name:set_text(" ")
		heat_name:set_w(0, 0)
		heat_name:set_position(0, host_name:bottom())
	end
	stars_panel:set_position(0, job_name:bottom())
	side_panel:set_h(math.round(host_name:h() + job_name:h() + stars_panel:h()))
	side_panel:set_w(300)
	self._num_layer_jobs = (self._num_layer_jobs + 1) % 1
	local marker_panel = self._pan_panel:panel({
		w = 36,
		h = 66,
		layer = 11 + self._num_layer_jobs * 3,
		alpha = 0
	})
	local select_panel = marker_panel:panel({
		name = "select_panel",
		w = 36,
		h = 38,
		x = -2,
		y = 0
	})
	local glow_panel = self._pan_panel:panel({
		w = 960,
		h = 192,
		layer = 10,
		alpha = 0
	})
	local glow_center = glow_panel:bitmap({
		name = "glow_center",
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 192,
		h = 192,
		blend_mode = "add",
		alpha = 0.55,
		color = data.pulse_color or (is_heist_war or data.is_heist_war) and pro_color or regular_color
	})
	local glow_stretch = glow_panel:bitmap({
		name = "glow_stretch",
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 960,
		h = 75,
		blend_mode = "add",
		alpha = 0.55,
		color = data.pulse_color or (is_heist_war or data.is_heist_war) and pro_color or regular_color
	})
	local glow_center_dark = glow_panel:bitmap({
		name = "glow_center_dark",
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 175,
		h = 175,
		blend_mode = "normal",
		alpha = 0.7,
		color = Color.black,
		layer = -1
	})
	local glow_stretch_dark = glow_panel:bitmap({
		name = "glow_stretch_dark",
		texture = "guis/textures/pd2/crimenet_marker_glow",
		w = 990,
		h = 75,
		blend_mode = "normal",
		alpha = 0.75,
		color = Color.black,
		layer = -1
	})
	glow_center:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_center_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	glow_stretch_dark:set_center(glow_panel:w() / 2, glow_panel:h() / 2)
	if not is_special or not data.icon then
	end
	local marker_dot_texture = ("guis/textures/pd2/crimenet_marker_" .. (is_server and "join" or "host")) .. (is_professional and "_pro" or "")
	local marker_dot = marker_panel:bitmap({
		name = "marker_dot",
		texture = marker_dot_texture,
		color = data.marker_dot_color or color,
		w = 32,
		h = 64,
		x = 2,
		y = 2,
		layer = 1
	})
	if is_heist_war then
		marker_panel:bitmap({
			name = "marker_pro_outline",
			texture = "guis/textures/pd2/crimenet_marker_pro_outline",
			w = 64,
			h = 64,
			x = 0,
			y = 0,
			rotation = 0,
			layer = 0,
			alpha = 1,
			blend_mode = "add"
		})
	end
	if data.mutators then
		marker_dot:set_color(tweak_data.screen_colors.mutators_color)
	end
	if data.is_crime_spree then
		marker_dot:set_color(tweak_data.screen_colors.crime_spree_risk)
	end
	if data.is_heist_war then
		marker_dot:set_color(tweak_data.screen_colors.pro_color)
	end
	local timer_rect, peers_panel
	local icon_panel = self._pan_panel:panel({
		layer = 26,
		alpha = 1,
		h = 64,
		w = 18
	})
	if data.job_id and managers.job:is_job_ghostable(data.job_id) then
		local ghost_icon = icon_panel:bitmap({
			name = "ghost_icon",
			texture = "guis/textures/pd2/cn_minighost",
			blend_mode = "add",
			color = tweak_data.screen_colors.ghost_color
		})
		local y = 0
		for i = 1, #icon_panel:children() - 1 do
			y = math.max(y, icon_panel:children()[i]:bottom())
		end
		ghost_icon:set_y(y)
	end
	if is_server then
		peers_panel = self._pan_panel:panel({
			layer = 11 + self._num_layer_jobs * 3,
			visible = true,
			w = 32,
			h = 62,
			alpha = 0
		})
		local cx = 0
		local cy = 0
		for i = 1, 4 do
			cx = 3 + 6 * (i - 1)
			cy = 8
			local player_marker = peers_panel:bitmap({
				name = tostring(i),
				texture = "guis/textures/pd2/crimenet_marker_peerflag",
				w = 8,
				h = 16,
				color = color,
				layer = 2,
				blend_mode = "normal",
				visible = i <= data.num_plrs
			})
			player_marker:set_position(cx, cy)
			if data.mutators then
				player_marker:set_color(tweak_data.screen_colors.mutators_color)
			end
			if data.is_crime_spree then
				player_marker:set_color(tweak_data.screen_colors.crime_spree_risk)
			end
			if data.is_heist_war then
				player_marker:set_color(tweak_data.screen_colors.pro_color)
			end
		end
		local kick_none_icon = icon_panel:bitmap({
			name = "kick_none_icon",
			texture = "guis/textures/pd2/cn_kick_marker",
			blend_mode = "add",
			alpha = 0
		})
		local kick_vote_icon = icon_panel:bitmap({
			name = "kick_vote_icon",
			texture = "guis/textures/pd2/cn_votekick_marker",
			blend_mode = "add",
			alpha = 0
		})
		local y = 0
		for i = 1, #icon_panel:children() - 1 do
			y = math.max(y, icon_panel:children()[i]:bottom())
		end
		kick_none_icon:set_y(y)
		kick_vote_icon:set_y(y)
	elseif not is_special then
		timer_rect = marker_panel:bitmap({
			name = "timer_rect",
			texture = "guis/textures/pd2/crimenet_timer",
			color = Color.white,
			w = 32,
			h = 32,
			x = 1,
			y = 2,
			render_template = "VertexColorTexturedRadial",
			layer = 2
		})
		timer_rect:set_texture_rect(32, 0, -32, 32)
	end
	marker_panel:set_center(x * self._zoom, y * self._zoom)
	focus:set_center(marker_panel:center())
	glow_panel:set_world_center(marker_panel:child("select_panel"):world_center())
	if heat_glow then
		heat_glow:set_world_center(marker_panel:child("select_panel"):world_center())
	end
	local num_containers = managers.job:get_num_containers()
	local middle_container = math.ceil(num_containers / 2)
	local job_container_index = managers.job:get_job_container_index(data.job_id) or middle_container
	local diff_containers = job_container_index - middle_container
	if diff_containers == 0 then
		if job_heat_mul < 0 then
			diff_containers = -1
		elseif job_heat_mul > 0 then
			diff_containers = 1
		end
	end
	local container_panel
	if diff_containers ~= 0 and job_heat_mul ~= 0 then
		container_panel = self._pan_panel:panel({
			layer = 11 + self._num_layer_jobs * 3,
			alpha = 0
		})
		container_panel:set_w(math.abs(num_containers - middle_container) * 10 + 6)
		container_panel:set_h(8)
		container_panel:set_center_x(marker_panel:center_x())
		container_panel:set_bottom(marker_panel:top())
		container_panel:set_x(math.round(container_panel:x()))
		local texture = "guis/textures/pd2/blackmarket/stat_plusminus"
		if not (diff_containers > 0) or not {
			0,
			0,
			8,
			8
		} then
			local texture_rect = {
				8,
				0,
				8,
				8
			}
		end
		for i = 1, math.abs(diff_containers) do
			container_panel:bitmap({
				texture = texture,
				texture_rect = texture_rect,
				x = (i - 1) * 10 + 3
			})
		end
	end
	local text_on_right = x < self._map_size_w - 200
	if text_on_right then
		side_panel:set_left(marker_panel:right())
	else
		job_name:set_text(contact_name:text() .. job_name:text())
		contact_name:set_text("")
		contact_name:set_w(0)
		local _, _, w, h = job_name:text_rect()
		job_name:set_size(w, h)
		host_name:set_right(side_panel:w())
		job_name:set_right(side_panel:w())
		contact_name:set_left(side_panel:w())
		info_name:set_left(side_panel:w())
		difficulty_name:set_left(side_panel:w())
		heat_name:set_left(side_panel:w())
		stars_panel:set_right(side_panel:w())
		side_panel:set_right(marker_panel:left())
	end
	side_panel:set_top(marker_panel:top() - job_name:top() + 1)
	if icon_panel then
		if text_on_right then
			icon_panel:set_right(marker_panel:left() + 2)
		else
			icon_panel:set_left(marker_panel:right() - 2)
		end
		icon_panel:set_top(math.round(marker_panel:top() + 1))
	end
	if peers_panel then
		peers_panel:set_center_x(marker_panel:center_x())
		peers_panel:set_center_y(marker_panel:center_y())
	end
	local callout
	if narrative_data and narrative_data.crimenet_callouts and 0 < #narrative_data.crimenet_callouts then
		local variant = math.random(#narrative_data.crimenet_callouts)
		callout = narrative_data.crimenet_callouts[variant]
	end
	if location then
		location[3] = true
	end
	managers.menu:post_event("job_appear")
	local job = {
		room_id = data.room_id,
		info = data.info,
		job_id = data.job_id,
		level_id = level_id,
		level_data = level_data,
		marker_panel = marker_panel,
		peers_panel = peers_panel,
		kick_option = data.kick_option,
		job_plan = data.job_plan,
		container_panel = container_panel,
		is_friend = data.is_friend,
		marker_dot = marker_dot,
		timer_rect = timer_rect,
		side_panel = side_panel,
		icon_panel = icon_panel,
		focus = focus,
		difficulty = data.difficulty,
		difficulty_id = data.difficulty_id,
		num_plrs = data.num_plrs,
		job_x = x,
		job_y = y,
		state = data.state,
		layer = 11 + self._num_layer_jobs * 3,
		glow_panel = glow_panel,
		callout = callout,
		text_on_right = text_on_right,
		location = location,
		heat_glow = heat_glow,
		mutators = data.mutators,
		is_crime_spree = data.crime_spree and data.crime_spree >= 0,
		crime_spree = data.crime_spree,
		crime_spree_mission = data.crime_spree_mission,
		is_heist_war = data.is_heist_war,
		color_lerp = data.color_lerp,
		server_data = data
	}
	if is_crime_spree or data.is_crime_spree then
		stars_panel:set_visible(false)
		local spree_panel = side_panel:panel({
			name = "spree_panel",
			layer = -1,
			visible = true,
			h = tweak_data.menu.pd2_small_font_size
		})
		spree_panel:set_bottom(side_panel:h())
		local level = is_crime_spree and managers.crime_spree:spree_level() or tonumber(data.crime_spree)
		if level >= 0 then
			local spree_level = spree_panel:text({
				text = managers.experience:cash_string(level or 0, "") .. managers.localization:get_default_macro("BTN_SPREE_TICKET"),
				valign = "center",
				vertical = "center",
				align = "left",
				halign = "left",
				layer = 1,
				x = 0,
				y = 0,
				color = tweak_data.screen_colors.crime_spree_risk,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
		end
	end
	if is_heist_war or data.is_heist_war then
		local heist_war_panel = side_panel:panel({
			name = "heist_war_panel",
			layer = -1,
			visible = true,
			h = tweak_data.menu.pd2_small_font_size
		})
		heist_war_panel:set_bottom(side_panel:h())
		local level = is_crime_spree and managers.crime_spree:spree_level() or tonumber(data.crime_spree)
		if level >= 0 then
			local heist_war_text = heist_war_panel:text({
				text = "HEIST WAR!",
				valign = "center",
				vertical = "center",
				align = "left",
				halign = "left",
				layer = 1,
				x = 0,
				y = 0,
				color = tweak_data.screen_colors.pro_color,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size
			})
		end
	end
	self:update_job_gui(job, 3)
	return job
end
function CrimeNetGui:check_job_pressed(x, y)
	for id, job in pairs(self._jobs) do
		if job.mouse_over == 1 then
			job.expanded = not job.expanded
			local job_data = tweak_data.narrative:job_data(job.job_id)
			local data = {
				difficulty = job.difficulty,
				difficulty_id = job.difficulty_id,
				job_id = job.job_id,
				level_id = job.level_id,
				id = id,
				room_id = job.room_id,
				server = job.server or false,
				num_plrs = job.num_plrs or 0,
				state = job.state,
				host_name = job.host_name,
				special_node = job.special_node,
				dlc = job.dlc,
				contract_visuals = job_data and job_data.contract_visuals,
				info = job.info,
				mutators = job.mutators,
				is_crime_spree = job.crime_spree and 0 <= job.crime_spree,
				crime_spree = job.crime_spree,
				crime_spree_mission = job.crime_spree_mission,
				is_heist_war = job.is_heist_war,
				server_data = job.server_data
			}
			managers.menu_component:post_event("menu_enter")
			if not data.dlc or managers.dlc:is_dlc_unlocked(data.dlc) then
				local node = job.special_node
				if not node then
					if Global.game_settings.single_player then
						node = "crimenet_contract_singleplayer"
					elseif job.server then
						if job.is_crime_spree then
							node = "crimenet_contract_crime_spree_join"
						elseif job.is_heist_war then
							node = "crimenet_contract_heist_war_join"
						else
							node = "crimenet_contract_join"
						end
					else
						node = "crimenet_contract_host"
					end
				end
				managers.menu:open_node(node, {data})
			elseif is_win32 then
				local dlc_data = Global.dlc_manager.all_dlc_data[data.dlc]
				local app_id = dlc_data and dlc_data.app_id
				if app_id and SystemInfo:distribution() == Idstring("STEAM") then
					Steam:overlay_activate("store", 218620)
				end
			end
			if job.expanded then
				for id2, job2 in pairs(self._jobs) do
					if job2 ~= job then
						job2.expanded = false
					end
				end
			end
			return true
		end
	end
end
function CrimeNetGui:mouse_pressed(o, button, x, y)
	if not self._crimenet_enabled then
		return
	end
	if self._getting_hacked then
		return
	end
	if self:mouse_button_click(button) then
		if self._panel:child("back_button"):inside(x, y) then
			managers.menu:back()
			return
		end
		if self._panel:child("legends_button"):inside(x, y) then
			self:toggle_legend()
			return
		end
		if self._panel:child("filter_button") and self._panel:child("filter_button"):inside(x, y) then
			managers.menu_component:post_event("menu_enter")
			managers.menu:open_node("crimenet_filters", {})
			return
		end
		if self:check_job_pressed(x, y) then
			return true
		end
		if self._panel:inside(x, y) then
			self._released_map = nil
			self._grabbed_map = {
				x = x,
				y = y,
				dirs = {}
			}
		end
	elseif self:button_wheel_scroll_down(button) then
		if self._one_scroll_out_delay then
			self._one_scroll_out_delay = nil
		end
		self:_set_zoom("out", x, y)
		return true
	elseif self:button_wheel_scroll_up(button) then
		if self._one_scroll_in_delay then
			self._one_scroll_in_delay = nil
		end
		self:_set_zoom("in", x, y)
		return true
	end
	return true
end
function CrimeNetGui:start_job()
	for id, job in pairs(self._jobs) do
		if job.expanded then
			if job.preset_id then
				MenuCallbackHandler:start_job(job)
				self:remove_job(job.preset_id)
				return true
			else
				print("Is a server, don't want to join", id, job.side_panel:child("host_name"):text() == "WWWWWWWWWWWW\194\181QQW")
				managers.network.matchmake:join_server_with_check(id)
				return
			end
		end
	end
end
function CrimeNetGui:mouse_released(o, button, x, y)
	if not self._crimenet_enabled then
		return
	end
	if not self:mouse_button_click(button) then
		return
	end
	if self._getting_hacked then
		return
	end
	if self._grabbed_map and #self._grabbed_map.dirs > 0 then
		local dx, dy = 0, 0
		for _, values in ipairs(self._grabbed_map.dirs) do
			dx = dx + values[1]
			dy = dy + values[2]
		end
		dx = dx / #self._grabbed_map.dirs
		dy = dy / #self._grabbed_map.dirs
		self._released_map = {
			t = 2,
			dx = dx,
			dy = dy
		}
		self._grabbed_map = nil
	end
end
function CrimeNetGui:_get_pan_panel_border()
	return self._pan_panel_border * self._zoom
end
function CrimeNetGui:_set_map_position(mx, my)
	local x = self._map_x + mx
	local y = self._map_y + my
	self._pan_panel:set_position(x, y)
	if self._pan_panel:left() > 0 then
		self._pan_panel:set_left(0)
	end
	if self._pan_panel:right() < self._fullscreen_panel:w() then
		self._pan_panel:set_right(self._fullscreen_panel:w())
	end
	if 0 < self._pan_panel:top() then
		self._pan_panel:set_top(0)
	end
	if self._pan_panel:bottom() < self._fullscreen_panel:h() then
		self._pan_panel:set_bottom(self._fullscreen_panel:h())
	end
	self._map_x, self._map_y = self._pan_panel:position()
	self._pan_panel:set_position(math.round(self._map_x), math.round(self._map_y))
	x, y = self._map_x, self._map_y
	self._map_panel:set_shape(self._pan_panel:shape())
	self._pan_panel:set_position(managers.gui_data:full_16_9_to_safe(x, y))
	local full_16_9 = managers.gui_data:full_16_9_size()
	local w_ratio = self._fullscreen_panel:w() / self._map_panel:w()
	local h_ratio = self._fullscreen_panel:h() / self._map_panel:h()
	local panel_x = -(self._map_panel:x() / self._fullscreen_panel:w()) * w_ratio
	local panel_y = -(self._map_panel:y() / self._fullscreen_panel:h()) * h_ratio
	local cross_indicator_h1 = self._fullscreen_panel:child("cross_indicator_h1")
	local cross_indicator_h2 = self._fullscreen_panel:child("cross_indicator_h2")
	local cross_indicator_v1 = self._fullscreen_panel:child("cross_indicator_v1")
	local cross_indicator_v2 = self._fullscreen_panel:child("cross_indicator_v2")
	local line_indicator_h1 = self._fullscreen_panel:child("line_indicator_h1")
	local line_indicator_h2 = self._fullscreen_panel:child("line_indicator_h2")
	local line_indicator_v1 = self._fullscreen_panel:child("line_indicator_v1")
	local line_indicator_v2 = self._fullscreen_panel:child("line_indicator_v2")
	cross_indicator_h1:set_y(full_16_9.convert_y + self._panel:h() * panel_y)
	cross_indicator_h2:set_bottom(self._fullscreen_panel:child("cross_indicator_h1"):y() + self._panel:h() * h_ratio)
	cross_indicator_v1:set_x(full_16_9.convert_x + self._panel:w() * panel_x)
	cross_indicator_v2:set_right(self._fullscreen_panel:child("cross_indicator_v1"):x() + self._panel:w() * w_ratio)
	line_indicator_h1:set_position(cross_indicator_v1:x(), cross_indicator_h1:y())
	line_indicator_h2:set_position(cross_indicator_v1:x(), cross_indicator_h2:y())
	line_indicator_v1:set_position(cross_indicator_v1:x(), cross_indicator_h1:y())
	line_indicator_v2:set_position(cross_indicator_v2:x(), cross_indicator_h1:y())
	line_indicator_h1:set_w(cross_indicator_v2:x() - cross_indicator_v1:x())
	line_indicator_h2:set_w(cross_indicator_v2:x() - cross_indicator_v1:x())
	line_indicator_v1:set_h(cross_indicator_h2:y() - cross_indicator_h1:y())
	line_indicator_v2:set_h(cross_indicator_h2:y() - cross_indicator_h1:y())
end
function CrimeNetGui:goto_lobby(lobby)
	print(lobby:id())
	local job = self._jobs[lobby:id()]
	if job then
		local x = job.marker_panel:child("select_panel"):center_x() + job.marker_panel:w() / 2
		local y = job.marker_panel:child("select_panel"):center_y() + job.marker_panel:h() - 2
		job.focus:set_size(job.focus:texture_width(), job.focus:texture_height())
		job.focus:set_color(job.focus:color():with_alpha(1))
		self:_goto_map_position(x, y)
	end
end
function CrimeNetGui:goto_bain()
	for _, job in pairs(self._jobs) do
	end
end
function CrimeNetGui:_goto_map_position(x, y)
	local tw = math.max(self._map_panel:child("map"):texture_width(), 1)
	local th = math.max(self._map_panel:child("map"):texture_height(), 1)
	local mx = self._map_panel:x() + x / tw * self._map_size_w * self._zoom - self._fullscreen_panel:w() * 0.5
	local my = self._map_panel:y() + y / th * self._map_size_h * self._zoom - self._fullscreen_panel:h() * 0.5
	self:_set_map_position(-mx, -my)
end
function CrimeNetGui:_set_zoom(zoom, x, y)
	local w1, h1 = self._pan_panel:size()
	local wx1 = (-self._fullscreen_panel:x() - self._pan_panel:x() + x) / self._pan_panel:w()
	local wy1 = (-self._fullscreen_panel:y() - self._pan_panel:y() + y) / self._pan_panel:h()
	local prev_zoom = self._zoom
	if zoom == "in" then
		local new_zoom = math.clamp(self._zoom * 1.1, self.MIN_ZOOM, self.MAX_ZOOM)
		if new_zoom ~= self._zoom then
			managers.menu_component:post_event("zoom_in")
		end
		self._zoom = new_zoom
	else
		local new_zoom = math.clamp(self._zoom / 1.1, self.MIN_ZOOM, self.MAX_ZOOM)
		if new_zoom ~= self._zoom then
			managers.menu_component:post_event("zoom_out")
		end
		self._zoom = new_zoom
	end
	self._pan_panel_border = 6.25 * self._zoom
	if prev_zoom == self._zoom then
		if zoom == "in" then
			self._one_scroll_out_delay = true
		else
			self._one_scroll_in_delay = true
		end
	end
	local cx, cy = self._pan_panel:center()
	self._pan_panel:set_size(self._map_size_w * self._zoom, self._map_size_h * self._zoom)
	self._pan_panel:set_center(cx, cy)
	local w2, h2 = self._pan_panel:size()
	self:_set_map_position((w1 - w2) * wx1, (h1 - h2) * wy1)
	local all_jobs = {}
	for i, data in pairs(self._jobs) do
		all_jobs[i] = data
	end
	for i, data in pairs(self._deleting_jobs) do
		all_jobs[i] = data
	end
	for id, job in pairs(all_jobs) do
		job.marker_panel:set_center(job.job_x * self._zoom, job.job_y * self._zoom)
		job.glow_panel:set_world_center(job.marker_panel:child("select_panel"):world_center())
		if job.heat_glow then
			job.heat_glow:set_world_center(job.marker_panel:child("select_panel"):world_center())
		end
		job.focus:set_center(job.marker_panel:center())
		if job.container_panel then
			job.container_panel:set_center_x(job.marker_panel:center_x())
			job.container_panel:set_bottom(job.marker_panel:top())
			job.container_panel:set_x(math.round(job.container_panel:x()))
		end
		if job.text_on_right then
			job.side_panel:set_left(job.marker_panel:right())
		else
			job.side_panel:set_right(job.marker_panel:left())
		end
		job.side_panel:set_top(job.marker_panel:top() - job.side_panel:child("job_name"):top() + 1)
		if job.icon_panel then
			if job.text_on_right then
				job.icon_panel:set_right(job.marker_panel:left() + 2)
			else
				job.icon_panel:set_left(job.marker_panel:right() - 2)
			end
			job.icon_panel:set_top(math.round(job.marker_panel:top() + 1))
		end
		if job.peers_panel then
			job.peers_panel:set_center_x(job.marker_panel:center_x())
			job.peers_panel:set_center_y(job.marker_panel:center_y())
		end
	end
	for _, region_location in ipairs(self._region_locations) do
		region_location.object:set_font_size(self._zoom * region_location.size)
	end
end
function CrimeNetGui:update_job_gui(job, inside)
	if job.mouse_over ~= inside then
		job.mouse_over = inside
		local function animate_alpha(o, objects, job, alphas, inside)
			local wanted_alpha = alphas[1]
			local wanted_text_alpha = alphas[2]
			local wanted_icon_alpha = inside and (job.kick_option ~= 1 and 1 or 0) or 0
			local kick_icon = job.kick_option == 0 and "kick_none_icon" or "kick_vote_icon"
			local start_h = job.side_panel:h()
			local h = start_h
			local custom_name = job.side_panel:child("custom_name")
			local host_name = job.side_panel:child("host_name")
			local job_name = job.side_panel:child("job_name")
			local contact_name = job.side_panel:child("contact_name")
			local info_name = job.side_panel:child("info_name")
			local difficulty_name = job.side_panel:child("difficulty_name")
			local heat_name = job.side_panel:child("heat_name")
			local stars_panel = job.side_panel:child("stars_panel")
			local spree_panel = job.side_panel:child("spree_panel")
			local heist_war_panel = job.side_panel:child("heist_war_panel")
			local base_h = math.round(host_name:h() + job_name:h() + stars_panel:h())
			local expand_h = math.round(base_h + info_name:h() + difficulty_name:h() + heat_name:h() + math.max(contact_name:h() - job_name:h(), 0))
			local start_x = 0
			local max_x = math.round(math.max(contact_name:w(), info_name:w(), difficulty_name:w(), heat_name:w()))
			if job.text_on_right then
				start_x = math.round(math.max(contact_name:right(), info_name:right(), difficulty_name:right(), heat_name:right()))
			else
				start_x = math.round(job.side_panel:w() - math.min(contact_name:left(), info_name:left(), difficulty_name:left(), heat_name:left()))
			end
			local x = start_x
			local object_alpha = {}
			local text_alpha = job.side_panel:alpha()
			local icon_alpha = (not job.icon_panel or not job.icon_panel:child(kick_icon) or not job.icon_panel:child(kick_icon):alpha()) and 0
			local alpha_met = false
			local glow_met = false
			local expand_met = false
			local pushout_met = x == 0
			local dt
			if inside and job.callout and self._crimenet_enabled then
				Application:debug(job.callout)
				managers.menu_component:post_event(job.callout, true)
			end
			while not alpha_met or not glow_met or not expand_met or not pushout_met do
				dt = coroutine.yield()
				if not alpha_met then
					alpha_met = true
					for i, object in ipairs(objects) do
						if object and alive(object) then
							object_alpha[i] = object_alpha[i] or object:alpha()
							object_alpha[i] = math.step(object_alpha[i], wanted_alpha, dt)
							object:set_alpha(object_alpha[i])
							alpha_met = alpha_met and object_alpha[i] == wanted_alpha
						end
					end
					text_alpha = math.step(text_alpha, wanted_text_alpha, dt * 2)
					job.side_panel:set_alpha(text_alpha)
					if job.icon_panel then
						job.icon_panel:set_alpha(text_alpha)
					end
					if job.icon_panel and job.icon_panel:child(kick_icon) then
						icon_alpha = math.step(icon_alpha, wanted_icon_alpha, dt * 2)
						job.icon_panel:child(kick_icon):set_alpha(icon_alpha)
					else
						icon_alpha = wanted_icon_alpha
					end
					alpha_met = alpha_met and text_alpha == wanted_text_alpha and icon_alpha == wanted_icon_alpha
					if not alpha_met or inside then
					end
				end
				if not glow_met then
					job.glow_panel:set_alpha(math.step(job.glow_panel:alpha(), inside and 0.2 or 0, dt * 5))
					glow_met = job.glow_panel:alpha() == (inside and 0.2 or 0)
					if glow_met and inside then
						local animate_pulse = function(o)
							while true do
								over(1, function(p)
									o:set_alpha(math.sin(p * 180) * 0.4 + 0.2)
								end)
							end
						end
						job.glow_panel:animate(animate_pulse)
					end
				end
				if not expand_met and pushout_met then
					h = math.step(h, inside and expand_h or base_h, (inside and expand_h or base_h) * dt * 4)
					job.side_panel:set_h(h)
					job.side_panel:set_top(o:top() - job_name:top() + 1)
					stars_panel:set_bottom(job.side_panel:h())
					expand_met = h == (inside and expand_h or base_h)
					if expand_met then
						pushout_met = x == (inside and max_x or 0)
					end
				end
				if not pushout_met then
					x = math.step(x, inside and max_x or 0, max_x * dt * 4)
					stars_panel:set_alpha(1 - x / math.min(max_x, 1))
					if alive(spree_panel) then
						spree_panel:set_top(job_name:bottom() - 2 + x / max_x * tweak_data.menu.pd2_small_font_size)
					end
					if job.text_on_right then
						job_name:set_left(math.round(math.min(x, contact_name:w())))
						contact_name:set_left(math.round(math.min(x - contact_name:w(), 0)))
						info_name:set_left(math.round(math.min(x - info_name:w(), 0)))
						difficulty_name:set_left(math.round(math.min(x - difficulty_name:w(), 0)))
						heat_name:set_left(math.round(math.min(x - heat_name:w(), 0)))
					else
						job_name:set_right(math.round(job.side_panel:w() - math.min(x, contact_name:w())))
						contact_name:set_right(math.round(job.side_panel:w() - math.min(x - contact_name:w(), 0)))
						info_name:set_right(math.round(job.side_panel:w() - math.min(x - info_name:w(), 0)))
						difficulty_name:set_right(math.round(job.side_panel:w() - math.min(x - difficulty_name:w(), 0)))
						heat_name:set_right(math.round(job.side_panel:w() - math.min(x - heat_name:w(), 0)))
					end
					pushout_met = x == (inside and max_x or 0)
				end
			end
		end
		local text_alpha = inside == 1 and 1 or inside == 2 and 0 or 1
		local object_alpha = inside == 1 and 1 or inside == 2 and 0.3 or 1
		local alphas = {object_alpha, text_alpha}
		local objects = {
			job.marker_panel,
			job.peers_panel
		}
		if job.container_panel then
			table.insert(objects, job.container_panel)
		end
		if not job.pulse then
			job.glow_panel:stop()
		end
		if inside == 1 then
			managers.menu_component:post_event("highlight")
			job.side_panel:child("job_name"):set_blend_mode("add")
			job.side_panel:child("contact_name"):set_blend_mode("add")
			job.side_panel:child("info_name"):set_blend_mode("add")
			job.side_panel:child("difficulty_name"):set_blend_mode("add")
			job.side_panel:child("heat_name"):set_blend_mode("add")
		else
			job.side_panel:child("job_name"):set_blend_mode("add")
			job.side_panel:child("contact_name"):set_blend_mode("add")
			job.side_panel:child("info_name"):set_blend_mode("add")
			job.side_panel:child("difficulty_name"):set_blend_mode("add")
			job.side_panel:child("heat_name"):set_blend_mode("add")
		end
		job.marker_panel:stop()
		if job.peers_panel then
			job.peers_panel:set_layer(inside == 1 and 20 or job.layer)
		end
		job.marker_panel:set_layer(inside == 1 and 20 or job.layer)
		job.glow_panel:set_layer(job.marker_panel:layer() - 1)
		if job.container_panel then
			job.container_panel:set_layer(inside == 1 and 20 or job.layer)
		end
		job.marker_panel:animate(animate_alpha, objects, job, alphas, inside == 1)
	end
end
