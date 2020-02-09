

function HUDStageEndScreen:level_up(level)
	local function level_text_func(o, ding_scale, level)
		local center_x, center_y = o:center()
		local size = tweak_data.menu.pd2_massive_font_size
		local ding_size = size * (1 + ding_scale)

		wait(0.1)
		o:set_text(tostring(level))
		self:give_skill_points(1)
	end

	local function text_ding_func(o)
		local TOTAL_T = 0.4
		local t = TOTAL_T
		local mul = 1
		local size = o:font_size()

		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			local ratio = math.max(t / TOTAL_T, 0)
			mul = mul + dt * 4

			o:set_font_size(size * mul)
			o:set_alpha(ratio)
			o:set_color(math.lerp(Color.white, tweak_data.screen_colors.button_stage_2, 1 - ratio))
		end

		o:parent():remove(o)
	end

	local function circle_ding_func(o)
		wait(0.15)

		local TOTAL_T = 0.6
		local t = TOTAL_T
		local mul = 1
		local c_x, c_y = o:center()
		local size = o:w()

		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			local ratio = math.max(t / TOTAL_T, 0)
			mul = mul + dt * 0.75

			o:set_size(size * mul, size * mul)
			o:set_center(c_x, c_y)
			o:set_alpha(ratio)
			o:set_color(math.lerp(Color.white, tweak_data.screen_colors.button_stage_2, 1 - ratio))
		end

		o:parent():remove(o)
	end

	local function package_func(o, data)
		local start_alpha = o:alpha()

		for _, item in pairs(self._package_items) do
			item:close()
		end

		self._package_items = {}

		wait(0.6)

		local new_items = {}

		if data.announcements then
			for i, announcement in ipairs(data.announcements) do
				table.insert(new_items, {
					announcement = announcement
				})
			end
		end

		if data.upgrades then
			for i, upgrade in ipairs(data.upgrades) do
				if not managers.upgrades:is_upgrade_locked(upgrade) then
					table.insert(new_items, {
						upgrade = upgrade
					})
				end
			end
		end

		self._package_forepanel:child("title_text"):set_text(managers.localization:to_upper_text("menu_es_package_unlocked_" .. (#new_items == 1 and "singular" or "plural")))

		if HUDPackageUnlockedItem.MAX_DISPLAYED < #new_items then
			Application:error(string.format("HUDStageEndScreen: Please, max %i announcements+upgrades per level in tweak_data.level_tree, rest will not be shown in gui!", HUDPackageUnlockedItem.MAX_DISPLAYED))
		end

		over(0.42, function (p)
			o:set_alpha(math.cos(652 * p) * math.rand(0.4, 0.8))
		end)
		over(0.04, function (p)
			o:set_alpha(math.step(o:alpha(), 1, p))
		end)
		o:set_alpha(1)

		local row = nil

		for i, item in ipairs(new_items) do
			row = i % HUDPackageUnlockedItem.MAX_DISPLAYED

			if self._package_items[row] then
				wait(0.23)
				self._package_items[row]:close()

				self._package_items[row] = nil

				wait(0.33)
			end

			item.unlocks = #new_items
			self._package_items[row] = HUDPackageUnlockedItem:new(o, math.clamp(item.unlocks, HUDPackageUnlockedItem.MIN_DISPLAYED, HUDPackageUnlockedItem.MAX_DISPLAYED) - row, item, self)

			wait(0.27)
		end
	end

	managers.menu_component:post_event("stinger_levelup")

	local ding_circle = self._lp_backpanel:bitmap({
		texture = "guis/textures/pd2/endscreen/exp_ring",
		rotation = 360,
		blend_mode = "add",
		layer = 0,
		w = self._lp_circle:w(),
		h = self._lp_circle:h(),
		x = self._lp_circle:x(),
		y = self._lp_circle:y(),
		color = tweak_data.screen_color_yellow
	})

	ding_circle:animate(circle_ding_func)

	local ding_text = self._lp_forepanel:text({
		vertical = "center",
		align = "center",
		rotation = 360,
		blend_mode = "add",
		layer = 0,
		w = self._lp_text:w(),
		h = self._lp_text:h(),
		x = self._lp_text:x(),
		y = self._lp_text:y(),
		color = tweak_data.screen_color_yellow,
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		text = self._lp_text:text()
	})

	ding_text:animate(text_ding_func)
	self._lp_circle:set_color(Color(level == managers.experience:level_cap() and 1 or 0, 1, 1))
	self._lp_text:stop()
	self._lp_text:animate(level_text_func, 1, tostring(level))

	local package_unlocked = tweak_data.upgrades.level_tree[level]

	if package_unlocked then
		self._package_forepanel:stop()
		self._package_forepanel:animate(package_func, package_unlocked)
	end

	return package_unlocked
end

function HUDStageEndScreen:set_statistics( criminals_completed, success )
	print( "HUDStageEndScreen:set_statistics( criminals_completed, success )", criminals_completed, success )
	self._criminals_completed = criminals_completed
	self._success = success
	
	local stage_status = success and utf8.to_upper( managers.localization:text("menu_success" ) ) or utf8.to_upper( managers.localization:text("menu_failed" ) )
	self._foreground_layer_safe:child("stage_text"):set_text( self._stage_name .. ": " .. stage_status )
	self._background_layer_full:child("stage_text"):set_text( self._stage_name .. ": " .. stage_status )

	-- print( total_xp_bonus )
	-- self._end_xp = total_xp_bonus
	
	--[[
	time_played:set_text( string.upper( managers.statistics:session_time_played().." (H:M:S)" ) )
	completed_objectives:set_text( string.upper( "" ..comp_obj.. "%" ) )
	last_completed_challenge:set_text( string.upper( managers.challenges:get_last_comleted_title_text() ) )
	total_downed:set_text( string.upper( managers.statistics:total_downed() ) )
	favourite_weapon:set_text( string.upper(""..managers.statistics:session_favourite_weapon() ) )
	hit_accuracy:set_text( string.upper(managers.statistics:session_hit_accuracy().."%" ) )
	total_kills:set_text( string.upper( ""..managers.statistics:session_total_kills() ) )
	total_specials_kills:set_text( string.upper( ""..managers.statistics:session_total_specials_kills() ) )
	total_head_shots:set_text( string.upper(""..managers.statistics:session_total_head_shots() ) )
	completion_criminals_finished:set_text( string.upper(""..criminals_completed ) )
	completed_objectives_bonus:set_text( string.upper( "" ..comp_obj.. "%" ) )
	completed_civilians_killed_penalty:set_text( string.upper(""..total_civilian_kills ) )
	completion_criminals_finished_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	completed_objectives_bonus_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	completed_civilians_killed_penalty_xp:set_color( total_civilian_kills == 0 and Color.white or Color.red )
	completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( 0 ).._xp_postfix )
	
	
	
	total_completion_bonus:set_text( managers.experience:cash_string( 0 ) .. xp_postfix )
	]]
end

--[[
function present_completion_bonus( o, cb )
	local t = (10/30)
	
	local xp_postfix = _xp_postfix
	
	-------
	wait( 0.5 )
	-------
	
	local total_xp_bonus = 0
	local criminals_bonus_xp_counter = 0
	while criminals_bonus_xp_counter < _criminals_bonus_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_criminals_bonus_xp - criminals_bonus_xp_counter)/8 )
		criminals_bonus_xp_counter = criminals_bonus_xp_counter + add_val
		completion_criminals_finished_xp:set_text( managers.experience:cash_string( math.round(criminals_bonus_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus + add_val
		total_completion_bonus:set_text( managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completion_criminals_finished_xp:set_text( managers.experience:cash_string( _criminals_bonus_xp ).._xp_postfix )
	
	-------
	wait( 0.5 )
	-------
	
	local objectives_bonus_xp_counter = 0
	while objectives_bonus_xp_counter < _objectives_bonus_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_objectives_bonus_xp - objectives_bonus_xp_counter)/8 )
		objectives_bonus_xp_counter = objectives_bonus_xp_counter + add_val
		completed_objectives_bonus_xp:set_text( managers.experience:cash_string( math.round(objectives_bonus_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus + add_val
		total_completion_bonus:set_text(managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completed_objectives_bonus_xp:set_text( managers.experience:cash_string( _objectives_bonus_xp ).._xp_postfix )
	
	-------
	wait( 0.5 )
	-------
	
	local civilians_penalty_xp_counter = 0
	while civilians_penalty_xp_counter < _civilians_penalty_xp do
		local dt = coroutine.yield()
		local add_val = dt * 15 * math.max( 1, (_civilians_penalty_xp - civilians_penalty_xp_counter)/8 )
		civilians_penalty_xp_counter = civilians_penalty_xp_counter + add_val
		completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( - math.round(civilians_penalty_xp_counter) ).._xp_postfix )
		total_xp_bonus = total_xp_bonus - add_val
		total_completion_bonus:set_text( managers.experience:cash_string( math.round(total_xp_bonus) )..xp_postfix )
	end
	completed_civilians_killed_penalty_xp:set_text( managers.experience:cash_string( - _civilians_penalty_xp ).._xp_postfix )
	total_completion_bonus:set_text( managers.experience:cash_string( _total_xp_bonus )..xp_postfix )
	
	-------
	wait( 0.1 )
	-------
	
	cb( _total_xp_bonus )
end
]]