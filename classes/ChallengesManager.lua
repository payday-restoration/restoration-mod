ChallengesManagerRes = ChallengesManagerRes or class()

function ChallengesManagerRes:init()
	self:_setup()
	tweak_data:add_reload_callback( self, callback( self, self, "reloaded" ) )
end

function ChallengesManagerRes:reloaded()
	self:_setup()
end

function ChallengesManagerRes:reset_challenges()
	self:_setup( true )
end

function ChallengesManagerRes:_setup( reset )
	self._counter_map = {}
	self._flag_map = {}
	self._challenges_map_res = {}
	self._reset_map = {}
	self._session_stopped_map = {}
	for category,challenges in pairs( tweak_data.challenges_res ) do
		for name,challenge in pairs( challenges ) do
			--if managers.dlc:has_full_game() or (not challenge.awards_achievment and challenge.in_trial) then
				self._challenges_map_res[ name ] = challenge

				if challenge.counter_id then
					self._counter_map[ challenge.counter_id ] = self._counter_map[ challenge.counter_id ] or {}
					table.insert( self._counter_map[ challenge.counter_id ], name )
				end
				if challenge.flag_id then
					self._flag_map[ challenge.flag_id ] = self._flag_map[ challenge.flag_id ] or {}
					table.insert( self._flag_map[ challenge.flag_id ], name )
				end
				if challenge.reset_criterias then
					for _,criteria in ipairs( challenge.reset_criterias ) do
						self._reset_map[ criteria ] = self._reset_map[ criteria ] or {}
						table.insert( self._reset_map[ criteria ], name )
					end
				end
				if challenge.session_stopped then
					-- self._session_stopped_map[ challenge.flag_id ] = self._flag_map[ challenge.flag_id ] or {}
					table.insert( self._session_stopped_map, name )
				end
			--end
		end
	end
	if not Global.challenges_manager_res or reset then
		Global.challenges_manager_res = {}
		Global.challenges_manager_res.active = {}
		Global.challenges_manager_res.completed = {}
		self._global = Global.challenges_manager_res
		self:check_active_challenges()
	end
	self._global = Global.challenges_manager_res
end

function ChallengesManagerRes:challenge( name )
	return self._challenges_map_res[ name ]
end

function ChallengesManagerRes:active_challenge( name )
	return self._global.active[ name ]
end

function ChallengesManagerRes:add_already_awarded_challenge( name )
	local challenge = self._challenges_map_res[ name ]
	if challenge and not self._global.active[ name ] then
		-- if managers.experience:current_level() >= challenge.unlock_level then
			if self:_check_depends_on( name ) then
				local t = {}
				if challenge.counter_id then
					t.amount = 0
				end
				if challenge.flag_id then
					t.flag = false
				end

				t.already_awarded = true
				self._global.active[ name ] = t


				if challenge.counter_id then
					for _, sub_challenge in ipairs( managers.challenges:get_completed() ) do
						if self._challenges_map_res[ sub_challenge.id ].increment_counter == challenge.counter_id then
							self:add_already_awarded_challenge( sub_challenge.id )
						end
					end
				end
			end
		-- end
	end
end

function ChallengesManagerRes:check_active_challenges()
	local added = false
	local current_level = managers.experience:current_level()

	for name,challenge in pairs( self._challenges_map_res ) do
		if not self._global.active[ name ] and not self._global.completed[ name ] then -- If not completed or activated
			-- if current_level >= challenge.unlock_level then
				if self:_check_depends_on( name ) then
					local t = {}
					if challenge.counter_id then
						t.amount = 0
					end
					if challenge.flag_id then
						t.flag = false
					end
					self._global.active[ name ] = t
					added = true
				end
			-- end
		end
	end

	if added then
		if managers.hud then
		--	managers.hud:present_mid_text( { text = "NEW CHALLENGES AVAILABLE", time = 4, icon = nil, event = "stinger_levelup" } )
		end
	end
end

function ChallengesManagerRes:_check_depends_on( name )
	if not self._challenges_map_res[ name ].depends_on then
		return true
	end
	if self._challenges_map_res[ name ].depends_on.challenges then
		for _,challenge in ipairs( self._challenges_map_res[ name ].depends_on.challenges ) do
			if not self._global.completed[ challenge ] then
				return false
			end
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.equipment then
		local correct_equipment = false
		for _,equipment in ipairs( self._challenges_map_res[ name ].depends_on.equipment ) do
			if managers.blackmarket:equipped_deployable(1) == equipment or managers.blackmarket:equipped_deployable(2) == equipment then
				correct_equipment = true
			end
		end
		if not correct_equipment then
			return false
		end
	end
	

	if self._challenges_map_res[ name ].depends_on.primaries then
		local correct_primary = false
		local current_primary = managers.blackmarket:equipped_primary()
		current_primary = managers.weapon_factory:get_weapon_id_by_factory_id(current_primary.factory_id)
		for _, primary in ipairs(self._challenges_map_res[ name ].depends_on.primaries) do
			if primary == current_primary then
				correct_primary = true
			end
		end
		if not correct_primary then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.secondaries then
		local correct_secondary = false
		local current_secondary = managers.blackmarket:equipped_secondary()
		current_secondary = managers.weapon_factory:get_weapon_id_by_factory_id(current_secondary.factory_id)
		for _, secondary in ipairs(self._challenges_map_res[ name ].depends_on.secondaries) do
			if secondary == current_secondary then
				correct_secondary = true
			end
		end
		if not correct_secondary then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.masks then
		local correct_mask = false
		local equipped_mask = managers.blackmarket:equipped_mask()
		local current_mask = managers.blackmarket:get_real_mask_id(equipped_mask.mask_id)
		for _, mask in ipairs( self._challenges_map_res[ name ].depends_on.masks ) do
			if mask == current_mask then
				correct_mask = true
			end
		end
		if not correct_mask then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.character then
		local correct_character = false
		local current_character = managers.blackmarket:get_real_character()
		for _, character in ipairs( self._challenges_map_res[ name ].depends_on.character ) do
			if character == current_character then
				correct_character = true
			end
		end
		if not correct_character then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.armors then
		local correct_armor = false
		for _, armor in ipairs( self._challenges_map_res[ name ].depends_on.armors ) do
			if managers.blackmarket:equipped_armor() == armor then
				correct_armor = true
			end
		end
		if not correct_armor then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.melee_weapons then
		local correct_melee = false
		for _, melee_weapon in ipairs( self._challenges_map_res[ name ].depends_on.melee_weapons ) do
			if managers.blackmarket:equipped_melee_weapon() == melee_weapon then
				correct_melee = true
			end
		end
		if not correct_melee then
			return false
		end
	end
	
	if self._challenges_map_res[ name ].depends_on.grenades then
		local correct_grenade = false
		for _, grenade in ipairs( self._challenges_map_res[ name ].depends_on.grenades ) do
			if not managers.blackmarket:equipped_grenade() == grenade then
				correct_grenade = true
			end
		end
		if not correct_grenade then
			return false
		end
	end

	return true
end

function ChallengesManagerRes:add_by_name( name )
	if not self._challenges_map_res[ name ] then
		Application:error( "No challenges named", name )
		return
	end

	if self._global.active[ name ] then
		self._global.active[ name ].amount = self._global.active[ name ].amount + 1
		self:_check_completed( name )
	end
end

function ChallengesManagerRes:count_up( counter_id )
	if not self._counter_map[ counter_id ] then
		-- Application:error( "No counter id named", counter_id )
		return
	end
	local actives = clone( self._global.active )
	for _,name in ipairs( self._counter_map[ counter_id ] ) do
		if actives[ name ] and (not self._global.completed[ name ] or actives[ name ].already_awarded) then
			self._global.active[ name ].amount = self._global.active[ name ].amount + 1
			self:_check_completed( name )
		end
	end
end

function ChallengesManagerRes:reset_counter( counter_id )
	if	not self._counter_map[ counter_id ] then
		-- Application:error( "No counter id named", counter_id )
		return
	end
	local actives = clone( self._global.active )
	for _,name in ipairs( self._counter_map[ counter_id ] ) do
		if actives[ name ] and (not self._global.completed[ name ] or actives[ name ].already_awarded) then
			self._global.active[ name ].amount = 0
		end
	end
end


function ChallengesManagerRes:set_flag( flag_id )
	if not self._flag_map[ flag_id ] then
		Application:error( "No flag id named", flag_id )
		return
	end

	for _,name in ipairs( self._flag_map[ flag_id ] ) do
		if self._global.active[ name ] and (not self._global.completed[ name ] or self._global.active[ name ].already_awarded) then
			self._global.active[ name ].flag = true
			self:_check_completed( name )
		end
	end
end

function ChallengesManagerRes:session_stopped( ... )
	local actives = clone( self._global.active )
	for _,name in ipairs( self._session_stopped_map ) do
		if actives[ name ] and (not self._global.completed[ name ] or actives[ name ].already_awarded) then
			local function_name = self._challenges_map_res[ name ].session_stopped.callback
			if self[ function_name ]( self, name, ...  ) then
				self:_completed_challenge( name )
			end
		end
	end
end

function ChallengesManagerRes:_check_completed( name )
	local counter_ok = (not self._global.active[ name ].amount) or self._global.active[ name ].amount >= self._challenges_map_res[ name ].count
	local flag_ok = self._global.active[ name ].flag == nil or self._global.active[ name ].flag

	if counter_ok and flag_ok then
		self:_completed_challenge( name )
	end
end

function ChallengesManagerRes:_completed_challenge( name )
	local already_awarded = self._global.active[ name ].already_awarded
	self._global.completed[ name ] = true
	self._global.active[ name ] = nil

	if not already_awarded then
		self._global.last_completed = name

		if managers.hud then
			local title = managers.localization:text( "present_challenge_completed_title" )
			local text = self:get_title_text( name )
			managers.hud:present_mid_text( { title = title, text = text, time = 4, icon = nil, event = "stinger_objectivecomplete", type = "challenge" } )
		end

		-- local cc_reward = self._challenges_map_res[ name ].cc
		-- if cc_reward then
		-- 	managers.custom_safehouse:add_coins( cc_reward, true )
		-- else
		-- 	return
		-- end
		-- managers.experience:add_points( self._challenges_map_res[ name ].xp, true )
		if self._challenges_map_res[ name ].cc then
			managers.custom_safehouse:add_coins( self._challenges_map_res[ name ].cc )
		end
	end


	if self._challenges_map_res[ name ].increment_counter then
		self:count_up( self._challenges_map_res[ name ].increment_counter )
	end

	--local achievement = self:get_awarded_achievment( name )
	--if achievement then
	--	managers.achievment:award( achievement )
	--end

	self:check_active_challenges()
end

function ChallengesManagerRes:reset( criteria )
	if not self._reset_map[ criteria ] then
		return
	end

	for _,name in ipairs( self._reset_map[ criteria ] ) do
		if self._global.active[ name ] then
			if self._global.active[ name ].amount then
				self._global.active[ name ].amount = 0
			end
			if self._global.active[ name ].flag ~= nil then
				self._global.active[ name ].flag = false
			end
		end
	end
end

function ChallengesManagerRes:get_near_completion()
	self:check_active_challenges()
	local t = {}
	for id, data in pairs( self._global.active ) do
		if self._challenges_map_res[ id ] and not data.already_awarded then
			local progress, count, amount
			if data.amount then
				progress = data.amount / self._challenges_map_res[ id ].count
				count = self._challenges_map_res[ id ].count
				amount = data.amount
			else
				progress = 0
				count = 1
				amount = 0
			end

			local name = self:get_title_text( id )
			local description = self:get_description_text( id )
			if not string.match(name, "_npc") and not string.match(name, "_crew") then
				table.insert( t, { id = id, progress = progress, count = count, amount = amount, name = name, description = description } )
			end
		end
	end

	local sort_func = function( data1, data2 )
		if data1.progress == data2.progress then
			return data1.id < data2.id
		end

		return data1.progress > data2.progress
	end
	table.sort( t, sort_func )

	return t
end

function ChallengesManagerRes:is_completed( id )
	return self._global.completed[ id ]
end

function ChallengesManagerRes:get_completed()
	local t = {}
	for id,data in pairs( self._global.completed ) do
		if self._challenges_map_res[ id ] then
			local name = self:get_title_text( id )
			local description = self:get_description_text( id )
			table.insert( t, { id = id, name = name, description = description } )
		end
	end

	local sort_func = function( data1, data2 )
		return data1.id < data2.id
	end
	table.sort( t, sort_func )

	return t
end


function ChallengesManagerRes:get_last_comleted_title_text()
	if not self._global.last_completed or not self._challenges_map_res[ self._global.last_completed ] then
		return ""
	end
	return self:get_title_text( self._global.last_completed )
end

function ChallengesManagerRes:get_last_comleted_description_text()
	if not self._global.last_completed or not self._challenges_map_res[ self._global.last_completed ] then
		return ""
	end
	return self:get_description_text( self._global.last_completed, true )
end

function ChallengesManagerRes:get_title_text( name )
    local ch_data = self._challenges_map_res[ name ]
 	if ch_data.title_id and ch_data.weapName then
 		return managers.localization:text(ch_data.title_id, {
            weapon = managers.localization:text(tweak_data.weapon[ch_data.weapName] and tweak_data.weapon[ch_data.weapName].name_id or "menu_" .. ch_data.weapName),
            no = self:NumberToNumeral(ch_data.i),
            eneType = managers.localization:text("ene_" .. ch_data.ene)
        })
 	elseif ch_data.title_id then
        return managers.localization:text(ch_data.title_id)
    else
 		return name
 	end
end

function ChallengesManagerRes:NumberToNumeral(no)
	if not no or no <= 0 then
		return ""
	end
	local numbers = { 1, 5, 10, 50, 100, 500, 1000 	}
	local chars = { "I", "V", "X", "L", "C", "D", "M" }
	local roman = ""
	for i = #numbers, 1, -1 do
		local num = numbers[i]
		while no - num >= 0 and no > 0 do
			roman = roman .. chars[i]
			no = no - num
		end
		for j = 1, i - 1 do
			local num2 = numbers[j]
			if no - (num - num2) >= 0 and num > no and no > 0 and num - num2 ~= num2 then
				roman = roman .. chars[j] .. chars[i]
				no = no - (num - num2)
				break
			end
		end
	end
	return roman
end

function ChallengesManagerRes:get_description_text( name )
 	local ch_data = self._challenges_map_res[ name ]
 	if ch_data.description_id then
 		return managers.localization:text(ch_data.description_id, {
            weapon = ch_data.weapName and managers.localization:text(tweak_data.weapon[ch_data.weapName] and tweak_data.weapon[ch_data.weapName].name_id or "menu_" .. ch_data.weapName) or nil,
            count = ch_data.count,
            eneType = managers.localization:text("ene_" .. tostring(ch_data.ene) .. "_desc")
        })
    else
 		return name
 	end
end

function ChallengesManagerRes:get_awarded_achievment( name )
	local achievment = self._challenges_map_res[ name ].awards_achievment

	if managers.achievment:exists( achievment ) then
		return achievment
	end

 	return nil
end

function ChallengesManagerRes:check_text()
	for name,_ in pairs( self._challenges_map_res ) do
		print( self:get_title_text( name ) )
		print( self:get_description_text( name ).."\n" )
	end
end

----------------------------------------------------

function ChallengesManagerRes:amount_of_challenges()
	local i = 0
	for _,_ in pairs( self._challenges_map_res ) do
		i = i + 1
	end
	return i
end

function ChallengesManagerRes:amount_of_completed_challenges()
	local i = 0

	for id,_ in pairs( self._global.completed ) do
		if self._challenges_map_res[ id ] then
			i = i + 1
		end
	end
	return i
end

----------------------------------------------------


-- Session stopped callback functions -------------

function ChallengesManagerRes:_check_level_completed( data )
	if not data.success then
		return false
	end
	if not data.from_beginning then
		return false
	end
	return true
end

function ChallengesManagerRes:_correct_level( level_id )
	-- if not (Global.level_data and Global.level_data.level_id) then
	-- 	return false
	-- end
	-- return Global.level_data.level_id == level_id

	if not Global.load_level then
		return
	end

	local current_level = managers.job:current_level_id()
	if type( level_id ) == "table" then
		for _, level in ipairs( level_id ) do
			if level == current_level then
				return true
			end
		end

		return false
	end

	if level_id ~= current_level then
		return false
	end

	return true
end

function ChallengesManagerRes:_correct_job( job_id )
	if not Global.job_manager.current_job then
		return
	end

	local current_job = managers.job:current_real_job_id()
	if type( job_id ) == "table" then
		for _, job in ipairs( job_id ) do
			if job == current_job then
				return true
			end
		end

		return false
	end

	if job_id ~= current_job then
		return false
	end

	return true
end

function ChallengesManagerRes:_correct_difficulty( difficulty )
	local curr_diff = Global.game_settings.difficulty
	if type( difficulty ) == "table" then
		for _, diff in ipairs( difficulty ) do
			if diff == curr_diff then
				return true
			end
		end

		return false
	end

	if difficulty ~= curr_diff then
		return false
	end

	return true
end


function ChallengesManagerRes:never_downed( name, data )
	if not self:_check_level_completed( data ) then
		return
	end
	if data.last_session.downed.bleed_out > 0 then
		return
	end
	return true
end

function ChallengesManagerRes:aquired_money()
	local ach_name
	for name,challenge in pairs( self._challenges_map_res ) do
		if challenge.id == "aquired_money" and self._global.active[ name ] then
			ach_name = name
			break
		end
	end

	if not ach_name then
		return
	end
	local money = managers.money:offshore()
	--log(money)
	if money < self._challenges_map_res[ ach_name ].amount then
		return
	end

	self:_completed_challenge( ach_name )
end

function ChallengesManagerRes:no_civilians_killed( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end
	if managers.statistics:session_total_civilian_kills() > 0 then
		return
	end
	return true
end
function ChallengesManagerRes:no_kills( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end
	if managers.statistics:session_total_kills() > 0 then
		return
	end
	if managers.statistics:started_session_from_beginning() then
		return
	end
	return
end

function ChallengesManagerRes:never_died( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end
	if data.last_session.downed.death > 0 then
		return
	end
	return true
end

function ChallengesManagerRes:never_bleedout( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end
	if data.last_session.downed.bleed_out > 0 then
		return
	end
	return true
end


function ChallengesManagerRes:level_success( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_depends_on(name) then
		return false
	end

	return true
end


function ChallengesManagerRes:overkill_no_trade( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if managers.trade._num_trades > 0 then
		return
	end

	return true
end

function ChallengesManagerRes:job_success( name, data )
	if not self:_correct_job( self._challenges_map_res[ name ].job_id ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_depends_on(name) then
		return false
	end

	if not managers.job:on_last_stage() then
		return false
	end

	return true
end

function ChallengesManagerRes:pro_job_success( name, data )
	if not self:_correct_job( self._challenges_map_res[ name ].job_id ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end

	if not self:_check_depends_on(name) then
		return false
	end

	if not Global.game_settings.one_down then
		return false
	end

	if not managers.job:on_last_stage() then
		return false
	end

	return true
end

function ChallengesManagerRes:pdth_style_success( name, data )
	if not self:_correct_level( self._challenges_map_res[ name ].level_id ) then
		return
	end

	if not self:_check_level_completed( data ) then
		return
	end

	if not self:_correct_difficulty( self._challenges_map_res[ name ].difficulty ) then
		return
	end
	
	if not self:_check_depends_on(name) then
		return false
	end	

	local blank_perkdeck = false
	local no_skills = false
	
	if managers.skilltree:points() == 100 then
		no_skills = true
	end
	
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	if current_specialization == 24 or current_specialization == 25 then
		blank_perkdeck = true
	end

	
	if blank_perkdeck and no_skills then
		return true
	else
		return false
	end
end


---------------------------------------------------

function ChallengesManagerRes:check_still_active_available()
	local actives = clone( self._global.active )
	for name,data in pairs( actives ) do
		if not self._challenges_map_res[ name ] then
			self._global.active[ name ] = nil
		end
	end
end

---------------------------------------------------

function ChallengesManagerRes:save( data )
	--log("save called")
	local active = {}
	for i, k in pairs( self._global.active ) do
		if not k.already_awarded then
			active[i] = k
		end
	end

	local state = {
		active = active,
		completed = self._global.completed,
		last_completed = self._global.last_completed
	}
	data.blackmarket.ChallengesManagerRes = state
end

function ChallengesManagerRes:load( data )
	--log("load called")
	if data.blackmarket then
		local state = data.blackmarket.ChallengesManagerRes
		if state then
			self._global.active = state.active
			self._global.completed = state.completed
			self._global.last_completed = state.last_completed
			self:check_active_challenges()
			self:check_still_active_available()
		end

		managers.network.account:challenges_loaded()
	end
end

--------------------------------------- Debug -----------------------------------------
function ChallengesManagerRes:debug_set_amount( name, amount )
	if not self._global.active[ name ] then
		return
	end

	self._global.active[ name ].amount = amount
end
