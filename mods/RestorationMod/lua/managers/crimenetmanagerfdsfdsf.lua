require "lib/managers/menu/WalletGuiObject"
CrimeNetManager = CrimeNetManager or class()

function CrimeNetManager:init()
	self._tweak_data = tweak_data.gui.crime_net
	
	-- self:_setup()
	self._active = false
	self._active_jobs = {}
	self:_setup_vars()
end

function CrimeNetManager:_setup_vars()
	self._active_job_time = self._tweak_data.job_vars.active_job_time -- 25
	self._NEW_JOB_MIN_TIME = self._tweak_data.job_vars.new_job_min_time -- 3.5 -- 7
	self._NEW_JOB_MAX_TIME = self._tweak_data.job_vars.new_job_max_time -- 3.5 -- 7
	self._next_job_timer = (self._NEW_JOB_MIN_TIME + self._NEW_JOB_MAX_TIME) / 2
	self._MAX_ACTIVE_JOBS = self._tweak_data.job_vars.max_active_jobs -- 10 -- 6

	self._refresh_server_t = 0
	self._REFRESH_SERVERS_TIME = self._tweak_data.job_vars.refresh_servers_time -- 5
	
	if Application:production_build() then
		self._debug_mass_spawning = tweak_data.gui.crime_net.debug_options.mass_spawn or false
	end
	
	self._active_server_jobs = {}
end

function CrimeNetManager:_get_jobs_by_jc()
	local t = {}
	tweak_data.narrative:get_jobs_index()
	-- for job_id,job_data in pairs( tweak_data.narrative.jobs ) do
	for _,job_id in ipairs( tweak_data.narrative:get_jobs_index() ) do
		if managers.job:check_ok_with_cooldown( job_id ) then
			local job_data = tweak_data.narrative.jobs[ job_id ]
			for i = (job_data.professional and 1 or 0), 3 do
				t[ job_data.jc + i * 10 ] = t[ job_data.jc + i * 10 ] or {}
				local difficulty_id = (2 + i)
				local difficulty = tweak_data:index_to_difficulty( difficulty_id )
				table.insert( t[ job_data.jc + i * 10 ], { job_id = job_id, difficulty_id = difficulty_id, difficulty = difficulty } )
			end
		else
			print( "SKIP DUE TO COOLDOWN", job_id )
		end
	end
	return t
end

function CrimeNetManager:_setup()
	if self._presets then
		return
	end
	self._presets = {}
		
	local plvl = managers.experience:current_level()
	
	-- Add 1 to plvl to give new jobs at lvl 10, 20, 30 etc
	local player_stars = math.clamp( math.ceil( (plvl+1) / 10 ), 1, 10 )
	local stars = player_stars
	-- print( "stars", stars )
	
	local jc = math.lerp( 0, 100, stars/10 )
	-- print( "jc", jc )
	
	local jcs = tweak_data.narrative.STARS[ stars ].jcs
	-- print( "num of jcs", #jcs )
	
	local no_jcs = #jcs
	local chance_curve = tweak_data.narrative.STARS_CURVES[player_stars]
	local start_chance = tweak_data.narrative.JC_CHANCE
	local jobs_by_jc = self:_get_jobs_by_jc()
	local no_picks = (self._debug_mass_spawning and tweak_data.gui.crime_net.debug_options.mass_spawn_limit) or tweak_data.narrative.JC_PICKS
	local j = 0
	local tests = 0
	while j < no_picks do
		for i = 1, no_jcs do
			local chance 
			if no_jcs-1 == 0 then
				chance = 1
			else
				-- chance = math.lerp( start_chance, 1, (i-1)/(no_jcs-1) )
				chance = math.lerp( start_chance, 1, math.pow((i-1)/(no_jcs-1), chance_curve) )
			end
			
			-- print( "chance for", i, jcs[i], "is", chance )
			local roll = math.rand(1)
			-- print( " roll,", roll )
			if roll <= chance then
				-- if not debug then print( " got it at", i, pcs[i] ) end
				if not jobs_by_jc[ jcs[i] ] then
					-- print( "Didn't have anything in jc", jcs[i] )
				elseif #jobs_by_jc[ jcs[i] ] == 0 then
					-- print( "Jc", jcs[i], "is empty" )
				else
					-- print( "this is what we have", inspect( jobs_by_jc[ jcs[i] ] ) )
					local job_data
					if self._debug_mass_spawning then
						job_data = jobs_by_jc[ jcs[i] ][ math.random( #jobs_by_jc[ jcs[i] ] ) ]
					else
						job_data = table.remove( jobs_by_jc[ jcs[i] ], math.random( #jobs_by_jc[ jcs[i] ] ) )
					end
					
					-- print( "get a job from jc", jcs[i] )
					-- for i=1, 100 do
						table.insert( self._presets, job_data )
					-- end
					j = j + 1
					break
				end
			end
		end
		
		
		tests = tests + 1
		if self._debug_mass_spawning then
			if tests >= tweak_data.gui.crime_net.debug_options.mass_spawn_limit then
				break
			end
		elseif tests >= 25 then
			-- print( "ABORT" )
			break
		end
		
	end
	
	print( "Jobs:", inspect( self._presets ) )
			
	-- self._global = Global.crimenet_manager
end

function CrimeNetManager:reset_seed()
	self._presets = nil
end

function CrimeNetManager:update( t, dt )
	if not self._active then
		return
	end
	
	for id,job in pairs( self._active_jobs ) do
		if not job.added then
			job.added = true
			-- print( "ADD" )
			-- managers.menu:active_menu().renderer:add_crimenet_gui_preset_job( id )
			managers.menu_component:add_crimenet_gui_preset_job( id )
		end
		job.active_timer = job.active_timer - dt
		-- self:_crimenet_gui():update_job( id, t, dt )
		managers.menu_component:update_crimenet_job( id, t, dt )
		-- self:_crimenet_gui():feed_timer( id, job.active_timer, self._active_job_time )
		managers.menu_component:feed_crimenet_job_timer( id, job.active_timer, self._active_job_time )
		if job.active_timer < 0 then
			-- print ("REMOVE" )
			-- managers.menu:active_menu().renderer:remove_crimenet_gui_job( id )
			managers.menu_component:remove_crimenet_gui_job( id )
			self._active_jobs[ id ] = nil
		end
	end
	
	local max_active_jobs = math.min( self._MAX_ACTIVE_JOBS, #self._presets )
	if self._debug_mass_spawning then
		max_active_jobs = math.min( tweak_data.gui.crime_net.debug_options.mass_spawn_limit, #self._presets )
	end
	
	if table.size( self._active_jobs ) < max_active_jobs and (table.size( self._active_jobs ) + table.size( self._active_server_jobs )) < tweak_data.gui.crime_net.job_vars.total_active_jobs then
		self._next_job_timer = self._next_job_timer - dt
		if self._next_job_timer < 0 then
			self._next_job_timer = math.rand( self._NEW_JOB_MIN_TIME, self._NEW_JOB_MAX_TIME ) -- math.random( 3 )
			self:activate_job()	
			if self._debug_mass_spawning then
				self._next_job_timer = tweak_data.gui.crime_net.debug_options.mass_spawn_timer
			end
		end
	end
		
	for id,job in pairs( self._active_server_jobs ) do
		job.alive_time = job.alive_time + dt
		-- self:_crimenet_gui():update_job( id, t, dt )
		managers.menu_component:update_crimenet_job( id, t, dt )
		managers.menu_component:feed_crimenet_server_timer( id, job.alive_time )
		-- self:_crimenet_gui():feed_server_timer( id, job.alive_time )
	end
	
	managers.menu_component:update_crimenet_gui( t, dt )
	
	if not self._skip_servers then
		if self._refresh_server_t < Application:time() then
			self:find_online_games( Global.game_settings.search_friends_only )
			-- managers.menu:active_menu().renderer._friends_gui:update_friends()
			-- managers.menu:active_menu().renderer:update_friends_gui()
			-- managers.menu_component:update_friends_gui()
			-- managers.menu:active_menu().logic:refresh_node( "crimenet" )
			self._refresh_server_t = Application:time() + self._REFRESH_SERVERS_TIME
		end
	else
		if self._refresh_server_t < Application:time() then
			self._refresh_server_t = Application:time() + self._REFRESH_SERVERS_TIME
		end
	end
end

function CrimeNetManager:start_no_servers()
	self:start( true )
end

function CrimeNetManager:start( skip_servers )
	self:_setup()
	self._active_jobs = {}
	
	self._active = true
	self._active_server_jobs = {}
	self._refresh_server_t = 0
	self._skip_servers = skip_servers
	-- self._REFRESH_SERVERS_TIME
	if #self._active_jobs == 0 then
		self._next_job_timer = 1
		-- self:activate_job()
		-- self:activate_job()
	end
end

function CrimeNetManager:stop()
	self._active = false
	for _,data in pairs( self._active_jobs ) do
		data.added = false
	end
end

function CrimeNetManager:deactivate()
	self._active = false
end

function CrimeNetManager:activate()
	self._active = true
	self._refresh_server_t = 0
end

function CrimeNetManager:activate_job()
	local i = math.random( #self._presets )
	while i ~= (i - 1) do
		if not self._active_jobs[ i ] and i ~= 0 then
			self._active_jobs[ i ] = { added = false, active_timer = self._active_job_time + math.random( 5 ) }
			return
		end
		i = 1 + math.mod( i, #self._presets )
	end
end


function CrimeNetManager:preset( id )
	return self._presets[ id ]
end

function CrimeNetManager:find_online_games( friends_only )
	self:_find_online_games( friends_only )
end

function CrimeNetManager:_crimenet_gui()
	return managers.menu_component._crimenet_gui
end


local is_win32 = SystemInfo:platform() == Idstring( "WIN32" )
local is_ps3 = SystemInfo:platform() == Idstring( "PS3" )
local is_x360 = SystemInfo:platform() == Idstring( "X360" )
function CrimeNetManager:_find_online_games( friends_only )
	if is_win32 then
		self:_find_online_games_win32( friends_only )
	elseif is_ps3 then
		self:_find_online_games_ps3( friends_only )
	elseif is_x360 then
		self:_find_online_games_xbox360( friends_only )
	else
		Application:error( "[CrimeNetManager] Unknown gaming platform trying to access Crime.net!" )
	end
end

function CrimeNetManager:_find_online_games_xbox360( friends_only )
	-- print( "TODO: CrimeNetManager:_find_online_games_xbox360" )
	local f = function( info )
		-- print( "info in function" )
		-- print( inspect( info ) )
		-- print( inspect( info.room_list ) )
		local friends = managers.network.friends:get_friends_by_name()
		
		managers.network.matchmake:search_lobby_done()
		
		local room_list = info.room_list
		local attribute_list = info.attribute_list
		
		local dead_list = {}
		for id,_ in pairs( self._active_server_jobs ) do
			dead_list[ id ] = true
		end	
		
		for i,room in ipairs( room_list ) do
			local name_str = tostring( room.owner_name )
			local attributes_numbers = attribute_list[ i ].numbers
			-- print( "managers.network.matchmake:is_server_ok", managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) )
			if managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) then
				-- print( "room.room_id", type( room.room_id ) ) 
				dead_list[ room.room_id ] = nil
				local host_name = name_str
				-- print( "attributes_numbers[ 1 ]", attributes_numbers[ 1 ] )
				
				local level_id = tweak_data.levels:get_level_name_from_index( attributes_numbers[ 1 ]%1000 )
				local name_id = level_id and tweak_data.levels[ level_id ] and tweak_data.levels[ level_id ].name_id
				local level_name = name_id and managers.localization:text( name_id ) or "LEVEL NAME ERROR"
				local difficulty_id = attributes_numbers[2]
				local difficulty = tweak_data:index_to_difficulty( difficulty_id )
				local job_id = tweak_data.narrative:get_job_name_from_index( math.floor(attributes_numbers[1]/1000) )
				
				local state_string_id = tweak_data:index_to_server_state( attributes_numbers[4] )
				local state_name = state_string_id and managers.localization:text( "menu_lobby_server_state_"..state_string_id ) or "blah"
				local state = attributes_numbers[4]
				local num_plrs = attributes_numbers[5]
								
				local is_friend = friends[ host_name ] and true or false
				
				if name_id then -- Check that the tweak data for the level exists
					if not self._active_server_jobs[ room.room_id ] then
						if (table.size( self._active_jobs ) + table.size( self._active_server_jobs )) < tweak_data.gui.crime_net.job_vars.total_active_jobs then
							self._active_server_jobs[ room.room_id ] =  { added = false, alive_time = 0 }
							-- print( "ADD", name_str )
							-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
							-- self:_crimenet_gui():add_server_job( { id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name } )
							managers.menu_component:add_crimenet_server_job( { room_id = room.room_id, info = room.info, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						end
					else
						managers.menu_component:update_crimenet_server_job( { room_id = room.room_id, info = room.info, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						-- print( "Found same, need update", name_str )
						-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
					end
				end
		
					
			end
		end
	
		for id,_ in pairs( dead_list ) do
			-- print( "Remove a dead", id )
			self._active_server_jobs[ id ] = nil
			-- self:_crimenet_gui():remove_job( id )
			managers.menu_component:remove_crimenet_gui_job( id )
		end
		
		-- print( "After update", inspect( self._active_server_jobs ) )
		-- self._active_server_jobs
		-- managers.menu:active_menu().logic:refresh_node( "play_online", true, info, friends_only )
	end
	
	managers.network.matchmake:register_callback( "search_lobby", f )
	managers.network.matchmake:search_lobby( friends_only )
end

function CrimeNetManager:_find_online_games_ps3( friends_only )
	local f = function( info_list )
		managers.network.matchmake:search_lobby_done()
		
		local dead_list = {}
		for id,_ in pairs( self._active_server_jobs ) do
			dead_list[ id ] = true
		end
		
		local friend_names = managers.network.friends:get_names_friends_list()
			
		for _, info in ipairs( info_list ) do
			local room_list = info.room_list
			local attribute_list = info.attribute_list
			
			for i, room in ipairs( room_list ) do
				local name_str = tostring( room.owner_id )
				local friend_str = room.friend_id and tostring( room.friend_id )
				local attributes_numbers = attribute_list[ i ].numbers
				
				if managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) then
					dead_list[ name_str ] = nil
					local host_name = name_str
					
					local level_id = tweak_data.levels:get_level_name_from_index( attributes_numbers[ 1 ]%1000 )
					local name_id = level_id and tweak_data.levels[ level_id ] and tweak_data.levels[ level_id ].name_id
					local level_name = name_id and managers.localization:text( name_id ) or "LEVEL NAME ERROR"
					local difficulty_id = attributes_numbers[2]
					local difficulty = tweak_data:index_to_difficulty( difficulty_id )
					local job_id = tweak_data.narrative:get_job_name_from_index( math.floor(attributes_numbers[1]/1000) )
					
					local state_string_id = tweak_data:index_to_server_state( attributes_numbers[4] )
					local state_name = state_string_id and managers.localization:text( "menu_lobby_server_state_"..state_string_id ) or "blah"
					local state = attributes_numbers[4]
					local num_plrs = attributes_numbers[8]
					
					local is_friend = friend_names[ host_name ] and true or false
					
					if name_id then -- Check that the tweak data for the level exists
						if not self._active_server_jobs[ name_str ] then
							if (table.size( self._active_jobs ) + table.size( self._active_server_jobs )) < tweak_data.gui.crime_net.job_vars.total_active_jobs then
								self._active_server_jobs[ name_str ] = { added = false, alive_time = 0 }
								managers.menu_component:add_crimenet_server_job( { room_id = room.room_id, id = name_str, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
							end
						else
							managers.menu_component:update_crimenet_server_job( { room_id = room.room_id, id = name_str, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						end
					end
				end
			end
		
			for id,_ in pairs( dead_list ) do
				self._active_server_jobs[ id ] = nil
				managers.menu_component:remove_crimenet_gui_job( id )
			end
		end
	end
	
	if #PSN:get_world_list() == 0 then
		return
	end
	
	managers.network.matchmake:register_callback( "search_lobby", f )
	managers.network.matchmake:start_search_lobbys( friends_only )
end

function CrimeNetManager:_find_online_games_win32( friends_only )
	local f = function( info )
		-- print( "info in function" )
		-- print( inspect( info ) )
		-- print( inspect( info.room_list ) )
		managers.network.matchmake:search_lobby_done()
		
		local room_list = info.room_list
		local attribute_list = info.attribute_list
		
		local dead_list = {}
		for id,_ in pairs( self._active_server_jobs ) do
			dead_list[ id ] = true
		end	
		
		for i,room in ipairs( room_list ) do
			local name_str = tostring( room.owner_name )
			local attributes_numbers = attribute_list[ i ].numbers
			-- print( "managers.network.matchmake:is_server_ok", managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) )
			if managers.network.matchmake:is_server_ok( friends_only, room.owner_id, attributes_numbers ) then
				-- print( "room.room_id", type( room.room_id ) ) 
				dead_list[ room.room_id ] = nil
				local host_name = name_str
				-- print( "attributes_numbers[ 1 ]", attributes_numbers[ 1 ] )
				
				local level_id = tweak_data.levels:get_level_name_from_index( attributes_numbers[ 1 ]%1000 )
				local name_id = level_id and tweak_data.levels[ level_id ] and tweak_data.levels[ level_id ].name_id
				local level_name = name_id and managers.localization:text( name_id ) or "LEVEL NAME ERROR"
				local difficulty_id = attributes_numbers[2]
				local difficulty = tweak_data:index_to_difficulty( difficulty_id )
				local job_id = tweak_data.narrative:get_job_name_from_index( math.floor(attributes_numbers[1]/1000) )
				
				local state_string_id = tweak_data:index_to_server_state( attributes_numbers[4] )
				local state_name = state_string_id and managers.localization:text( "menu_lobby_server_state_"..state_string_id ) or "blah"
				local state = attributes_numbers[4]
				local num_plrs = attributes_numbers[5]
				
				
				local is_friend = false
				
				if Steam:logged_on() and Steam:friends() then
					for _, friend in ipairs( Steam:friends() ) do
						if friend:id() == room.owner_id then
							is_friend = true
							break
						end
					end
				end
				
				if name_id then -- Check that the tweak data for the level exists
					if not self._active_server_jobs[ room.room_id ] then
						if (table.size( self._active_jobs ) + table.size( self._active_server_jobs )) < tweak_data.gui.crime_net.job_vars.total_active_jobs then
							self._active_server_jobs[ room.room_id ] =  { added = false, alive_time = 0 }
							-- print( "ADD", name_str )
							-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
							-- self:_crimenet_gui():add_server_job( { id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name } )
							managers.menu_component:add_crimenet_server_job( { room_id = room.room_id, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						end
					else
						managers.menu_component:update_crimenet_server_job( { room_id = room.room_id, id = room.room_id, level_id = level_id, difficulty = difficulty, difficulty_id = difficulty_id, num_plrs = num_plrs, host_name = host_name, state_name = state_name, state = state, level_name = level_name, job_id = job_id, is_friend = is_friend } )
						-- print( "Found same, need update", name_str )
						-- print( "   ", host_name, level_id, name_id, level_name, difficulty, state_string_id, state_name, state, num_plrs )
					end
				end
		
						--[[local item = new_node:item( room.room_id )
						if not item then -- ..i ) then
							print( "ADD", name_str )
							local params = 
							{
								name		= room.room_id, --..i,
								text_id		= name_str,
								room_id		= room.room_id,
								-- columns		= { "" .. j, host_data.host_name, level_name, state_name }, -- host_rpc:to_string() },
								columns		= { string.upper( host_name ), string.upper( level_name ), string.upper( state_name ), tostring( num_plrs ) .. "/4 " },
								-- rpc			= host_rpc,
								level_name  = level_id, -- host_data.level_name,
								real_level_name = level_name,
								level_id	= level_id,
								state_name	= state_name,
								difficulty	= difficulty,
								host_name	= host_name,
								state		= state,
								num_plrs	= num_plrs,
								callback	= "connect_to_lobby",
								localize	= "false"
							}
							
							local new_item = new_node:create_item( { type = "ItemServerColumn" }, params )
							new_node:add_item( new_item )
						else
							if item:parameters().real_level_name ~= level_name then
								item:parameters().columns[2] = string.upper( level_name )
								item:parameters().level_name = level_id
								item:parameters().real_level_name = level_name
							end
							
							if item:parameters().state ~= state then
								item:parameters().columns[3] = state_name
								item:parameters().state = state
								item:parameters().state_name = state_name
							end
							
							if item:parameters().difficulty ~= difficulty then
								item:parameters().difficulty = difficulty
							end
							
							if item:parameters().room_id ~= room.room_id then
								item:parameters().room_id = room.room_id
							end
							
							if item:parameters().num_plrs ~= num_plrs then
								item:parameters().num_plrs = num_plrs
								item:parameters().columns[4] = tostring( num_plrs ) .. "/4 "
							end
						end]]
			end
		end
	
		for id,_ in pairs( dead_list ) do
			-- print( "Remove a dead", id )
			self._active_server_jobs[ id ] = nil
			-- self:_crimenet_gui():remove_job( id )
			managers.menu_component:remove_crimenet_gui_job( id )
		end
		
		-- print( "After update", inspect( self._active_server_jobs ) )
		-- self._active_server_jobs
		-- managers.menu:active_menu().logic:refresh_node( "play_online", true, info, friends_only )
	end
	
	managers.network.matchmake:register_callback( "search_lobby", f )
	managers.network.matchmake:search_lobby( friends_only )

	local usrs_f = function( success, amount )
		print( "usrs_f", success, amount )
		
		if success then
			managers.menu_component:set_crimenet_players_online( amount )
		end
	end
	
	Steam:sa_handler():concurrent_users_callback( usrs_f )
	Steam:sa_handler():get_concurrent_users()
end

-- NOT CALLED YET
function CrimeNetManager:save( data )
	data.crimenet = self._global
end

-- NOT CALLED YET
function CrimeNetManager:load( data )
	self._global = data.crimenet
end

---------------------------------------------------------------------

CrimeNetGui = CrimeNetGui or class()

function CrimeNetGui:init( ws, fullscreeen_ws, node )
	managers.menu_component:test_camera_shutter_tech()
	self._tweak_data = tweak_data.gui.crime_net
	self._crimenet_enabled = true
	
	managers.menu_component:post_event( "crime_net_startup" )
	-- self._crimenet_ambience = managers.menu_component:post_event( "crimenet_ambience" )
	
	managers.menu_component:close_contract_gui()
	local no_servers = node:parameters().no_servers
	if no_servers then
		managers.crimenet:start_no_servers()
	else
		managers.crimenet:start()
	end
	
	managers.menu:active_menu().renderer.ws:hide()
	local safe_scaled_size = managers.gui_data:safe_scaled_size()
	self._ws = ws
	self._fullscreen_ws = fullscreeen_ws
	self._fullscreen_panel = self._fullscreen_ws:panel():panel( { name = "fullscreen" } )
	self._panel = self._ws:panel():panel( { name="main" } ) -- self._fullscreen_panel:panel( { name = "main", w=safe_scaled_size.w, h=safe_scaled_size.h } )
	-- self._panel:set_center( self._fullscreen_panel:w() * 0.5, self._fullscreen_panel:h() * 0.5 )
	
	do
		self._blackborder_workspace = managers.gui_data:create_fullscreen_workspace()
		
		self._blackborder_workspace:panel():rect( { name="top_border", layer=1000, color=Color.black } )
		self._blackborder_workspace:panel():rect( { name="bottom_border", layer=1000, color=Color.black } )		-- tab (stats) menu at layer 50-51
		
		-- local manager = managers.gui_data
		-- manager:layout_fullscreen_workspace( self._blackborder_workspace )
		
		local top_border = self._blackborder_workspace:panel():child("top_border")
		local bottom_border = self._blackborder_workspace:panel():child("bottom_border")
		local border_w = self._blackborder_workspace:panel():w()
		local border_h = (self._blackborder_workspace:panel():h() - 720) / 2
		
		top_border:set_position( 0, 0 )
		top_border:set_size( border_w, border_h )
		
		bottom_border:set_position( 0, 720 + border_h )
		bottom_border:set_size( border_w, border_h )
	end
	
	local full_16_9 = managers.gui_data:full_16_9_size()
	self._fullscreen_panel:bitmap( { name="blur_top", 		texture="guis/textures/test_blur_df", w=self._fullscreen_ws:panel():w(), h=full_16_9.convert_y, x=0, y=0, render_template="VertexColorTexturedBlur3D", layer=26  } )
	self._fullscreen_panel:bitmap( { name="blur_right", 	texture="guis/textures/test_blur_df", w=full_16_9.convert_x, h=self._fullscreen_ws:panel():h(), x=self._fullscreen_ws:panel():w()-full_16_9.convert_x, y=0, render_template="VertexColorTexturedBlur3D", layer=26  } )
	self._fullscreen_panel:bitmap( { name="blur_bottom",	texture="guis/textures/test_blur_df", w=self._fullscreen_ws:panel():w(), h=full_16_9.convert_y, x=0, y=self._fullscreen_ws:panel():h()-full_16_9.convert_y, render_template="VertexColorTexturedBlur3D", layer=26  } )
	self._fullscreen_panel:bitmap( { name="blur_left",		texture="guis/textures/test_blur_df", w=full_16_9.convert_x, h=self._fullscreen_ws:panel():h(), x=0, y=0, render_template="VertexColorTexturedBlur3D", layer=26  } )
	
	self._panel:rect( { w=self._panel:w(), h=2, x=0, y=0, layer=2, color=tweak_data.screen_colors.crimenet_lines, blend_mode="add" } )
	self._panel:rect( { w=self._panel:w(), h=2, x=0, y=0, layer=2, color=tweak_data.screen_colors.crimenet_lines, blend_mode="add" } ):set_bottom( self._panel:h() )
	self._panel:rect( { w=2, h=self._panel:h(), x=0, y=0, layer=2, color=tweak_data.screen_colors.crimenet_lines, blend_mode="add" } ):set_right( self._panel:w() )
	self._panel:rect( { w=2, h=self._panel:h(), x=0, y=0, layer=2, color=tweak_data.screen_colors.crimenet_lines, blend_mode="add" } )
	
	self._rasteroverlay = self._fullscreen_panel:bitmap( { name="rasteroverlay", texture = "guis/textures/crimenet_map_rasteroverlay", texture_rect = { 0, 0, 32, 256 }, wrap_mode="wrap", blend_mode="mul", layer = 3, color = Color( 1.0, 1, 1, 1 ), w = self._fullscreen_panel:w(), h = self._fullscreen_panel:h() } )
	self._fullscreen_panel:bitmap( { name="vignette", texture = "guis/textures/crimenet_map_vignette", layer = 2, color = Color( 1, 1, 1, 1 ), blend_mode="mul", w = self._fullscreen_panel:w(), h = self._fullscreen_panel:h() } )
	
	local bd_light = self._fullscreen_panel:bitmap( { name = "bd_light", texture = "guis/textures/pd2/menu_backdrop/bd_light", layer=4 } )
	bd_light:set_size( self._fullscreen_panel:size() )
	bd_light:set_alpha(0)
	bd_light:set_blend_mode( "add" )
	
	local light_flicker_animation = function( o )
		local alpha = 0
		local acceleration = 0
		
		local wanted_alpha = math.rand(1) * 0.3
		local flicker_up = true
		
		while( true ) do
			wait( 0.009, self._fixed_dt )
			over( 0.045, function(p) o:set_alpha( math.lerp( alpha, wanted_alpha, p ) ) end, self._fixed_dt )
			
			flicker_up = not flicker_up
			alpha = o:alpha()
			wanted_alpha = math.rand( flicker_up and alpha or 0.2, not flicker_up and alpha or 0.3 )
		end
	end
	bd_light:animate( light_flicker_animation )
	
	local back_button = self._panel:text( { name="back_button", text=managers.localization:to_upper_text("menu_back"), align="right", vertical="bottom", font_size=tweak_data.menu.pd2_large_font_size, font=tweak_data.menu.pd2_large_font, color=tweak_data.screen_colors.button_stage_3, layer=40, blend_mode="add" } )
	self:make_fine_text( back_button )
	back_button:set_right( self._panel:w() - 10 )
	back_button:set_bottom( self._panel:h() - 10 )
	back_button:set_visible( managers.menu:is_pc_controller() )
	
	if true then
		local blur_object = self._panel:bitmap( { name="controller_legend_blur", texture="guis/textures/test_blur_df", render_template="VertexColorTexturedBlur3D", layer=back_button:layer()-1 } )
		blur_object:set_shape( back_button:shape() )
		if not managers.menu:is_pc_controller() then
			blur_object:set_size( self._panel:w()*0.5, tweak_data.menu.pd2_medium_font_size )
			blur_object:set_rightbottom( self._panel:w()-2, self._panel:h()-2 )
		end
	end
	
	WalletGuiObject.set_wallet( self._panel )
	WalletGuiObject.set_layer( 30 )
	WalletGuiObject.move_wallet( 10, -10 )
	--[[
	local back_button_bg = self._panel:rect( { blend_mode="add", h=back_button:h() * 2, w = back_button:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	back_button_bg:set_right( back_button:right()+5 )
	back_button_bg:set_bottom( back_button:bottom()+5 )
	]]
	
	--[[
	local map_coord_text = self._panel:text( { name="map_coord_text", text=utf8.to_upper( managers.localization:text("cn_menu_mapcoords", {zoom=1, x="000.00", y="000.00"}) ), align="left", vertical="bottom", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=28 } )
	self:make_fine_text( map_coord_text )
	map_coord_text:set_left( 15 )
	map_coord_text:set_bottom( self._panel:h() - 15 )
	]]
	--[[
	local map_coord_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = map_coord_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	map_coord_text_bg:set_left( map_coord_text:left()-5 )
	map_coord_text_bg:set_bottom( map_coord_text:bottom()+5 )
	
	map_coord_text:set_w( map_coord_text_bg:w() )
	]]
	
	--[[
	local num_contracts_text = self._panel:text( { name="num_contracts_text", text=managers.localization:text("cn_menu_num_contracts", {contracts="000", friends="000"}), align="left", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=28 } )
	self:make_fine_text( num_contracts_text )
	num_contracts_text:set_left( 15 )
	num_contracts_text:set_top( 15 )
	
	local num_contracts_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = num_contracts_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	num_contracts_text_bg:set_left( num_contracts_text:left()-5 )
	num_contracts_text_bg:set_top( num_contracts_text:top()-5 )
	
	num_contracts_text:set_w( num_contracts_text_bg:w() )
	]]
	local text_id = Global.game_settings.single_player and "menu_crimenet_offline" or "cn_menu_num_players_offline"
	local num_players_text = self._panel:text( { name="num_players_text", text=managers.localization:to_upper_text( text_id, {amount="1"}), align="left", vertical="top", font_size=tweak_data.menu.pd2_small_font_size, font=tweak_data.menu.pd2_small_font, color=tweak_data.screen_colors.text, layer=40 } )
	self:make_fine_text( num_players_text )
	num_players_text:set_left( 10 )
	num_players_text:set_top( 10 )
	
	if true then
		local blur_object = self._panel:bitmap( { name="num_players_blur", texture="guis/textures/test_blur_df", render_template="VertexColorTexturedBlur3D", layer=num_players_text:layer()-1 } )
		blur_object:set_shape( num_players_text:shape() )
	end
	
	local legends_button = self._panel:text( { name="legends_button", text=managers.localization:to_upper_text("menu_cn_legend_show", {BTN_X=managers.localization:btn_macro("menu_toggle_legends")}), font_size=tweak_data.menu.pd2_medium_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=40, blend_mode="add" } )
	self:make_fine_text( legends_button )
	legends_button:set_left( num_players_text:left() )
	legends_button:set_top( num_players_text:bottom() )
	if true then
		local blur_object = self._panel:bitmap( { name="legends_button_blur", texture="guis/textures/test_blur_df", render_template="VertexColorTexturedBlur3D", layer=legends_button:layer()-1 } )
		blur_object:set_shape( legends_button:shape() )
	end
	if managers.menu:is_pc_controller() then
		legends_button:set_color( tweak_data.screen_colors.button_stage_3 )
	end
	
	do
		local w, h
		local mw, mh = 0
		local legend_panel = self._panel:panel( { name="legend_panel", layer=40, visible=false, x=10, y=legends_button:bottom()+4 } )
		local host_icon = legend_panel:bitmap( { texture="guis/textures/pd2/crimenet_legend_host", x=10, y=10 } )
		local host_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_icon:right()+2, y=host_icon:top(), text=managers.localization:to_upper_text( "menu_cn_legend_host" ), blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( host_text ) )
		-- self:make_color_text( host_text, tweak_data.screen_colors.text )
		
		
		local join_icon = legend_panel:bitmap( { texture="guis/textures/pd2/crimenet_legend_join", x=10, y=host_text:bottom() } )
		local join_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_text:left(), y=join_icon:top(), text=managers.localization:to_upper_text( "menu_cn_legend_join" ), blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( join_text ) )
		self:make_color_text( join_text, tweak_data.screen_colors.regular_color )
		
		
		local friends_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_text:left(), y=join_text:bottom(), text=managers.localization:to_upper_text( "menu_cn_legend_friends" ), blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( friends_text ) )
		self:make_color_text( friends_text, tweak_data.screen_colors.friend_color )
		
		
		local pc_icon = legend_panel:bitmap( { texture="guis/textures/pd2/crimenet_legend_payclass", x=10, y=friends_text:bottom() } )
		local pc_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_text:left(), y=pc_icon:top(), text=managers.localization:to_upper_text( "menu_cn_legend_pc" ), color=tweak_data.screen_colors.text, blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( pc_text ) )
		
		
		local risk_icon = legend_panel:bitmap( { texture="guis/textures/pd2/crimenet_legend_risklevel", x=10, y=pc_text:bottom() } )
		local risk_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_text:left(), y=risk_icon:top(), text=managers.localization:to_upper_text( "menu_cn_legend_risk" ), color=tweak_data.screen_colors.risk, blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( risk_text ) )
		
		
		local pro_text = legend_panel:text( { font=tweak_data.menu.pd2_small_font, font_size=tweak_data.menu.pd2_small_font_size, x=host_text:left(), y=risk_text:bottom(), text=managers.localization:to_upper_text( "menu_cn_legend_pro" ), color=tweak_data.screen_colors.pro_color, blend_mode="add" } )
		mw = math.max( mw, self:make_fine_text( pro_text ) )
		
		
		legend_panel:set_size( host_text:left() + mw + 10, pro_text:bottom() + 10 )
		legend_panel:rect( { color=Color.black, alpha=0.4, layer=-1 } )
		
		BoxGuiObject:new( legend_panel, { sides = { 1, 1, 1, 1 } } )
	
		legend_panel:bitmap( { texture="guis/textures/test_blur_df", w=legend_panel:w(), h=legend_panel:h(), render_template="VertexColorTexturedBlur3D", layer=-1 } )
	end
	
	if not no_servers then
		local id = is_x360 and "menu_cn_friends" or "menu_cn_filter"
		local filter_button = self._panel:text( { name="filter_button", text=managers.localization:to_upper_text( id, {BTN_Y=managers.localization:btn_macro("menu_toggle_filters")}), font_size=tweak_data.menu.pd2_medium_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=40, blend_mode="add" } )
		self:make_fine_text( filter_button )
		filter_button:set_right( self._panel:w() - 10 )
		filter_button:set_top( 10 )
		
		if true then
			local blur_object = self._panel:bitmap( { name="filter_button_blur", texture="guis/textures/test_blur_df", render_template="VertexColorTexturedBlur3D", layer=filter_button:layer()-1 } )
			blur_object:set_shape( filter_button:shape() )
		end
		
		if managers.menu:is_pc_controller() then
			filter_button:set_color( tweak_data.screen_colors.button_stage_3 )
		end
		
		if is_ps3 then
			local invites_button = self._panel:text( { name="invites_button", text= managers.localization:get_default_macro("BTN_BACK") .. " " .. managers.localization:to_upper_text( "menu_view_invites" ), font_size=tweak_data.menu.pd2_medium_font_size, font=tweak_data.menu.pd2_medium_font, color=tweak_data.screen_colors.text, layer=40, blend_mode="add" } )
			self:make_fine_text( invites_button )
			invites_button:set_right( filter_button:right() )
			invites_button:set_top( filter_button:bottom() )
			
			if true then
				local blur_object = self._panel:bitmap( { name="invites_button_blur", texture="guis/textures/test_blur_df", render_template="VertexColorTexturedBlur3D", layer=filter_button:layer()-1 } )
				blur_object:set_shape( invites_button:shape() )
			end
			
			if not self._ps3_invites_controller then
				local invites_cb = callback( self, self, "ps3_invites_callback" )
				self._ps3_invites_controller = managers.controller:create_controller( "ps3_invites_controller", managers.controller:get_default_wrapper_index(), false )
				self._ps3_invites_controller:add_trigger( "back", invites_cb )
			end
			self._ps3_invites_controller:set_enabled( true )
		end
	end
	
	--[[
	local crime_net_text = self._panel:text( { name="crime_net_text", text=managers.localization:text("menu_crimenet"), align="right", vertical="top", h=tweak_data.menu.pd2_small_font_size ,font_size=tweak_data.menu.pd2_large_font_size, font=tweak_data.menu.pd2_large_font, color=tweak_data.screen_colors.text, layer=28 } )
	self:make_fine_text( crime_net_text )
	crime_net_text:set_right( self._panel:w() - 15 )
	crime_net_text:set_top( 15 )]]
	--[[
	local crime_net_text_bg = self._panel:rect( { blend_mode="add", h=back_button_bg:h(), w = crime_net_text:w() * 2, layer=27, color=tweak_data.screen_colors.button_stage_3, alpha=0.4 } )
	crime_net_text_bg:set_right( crime_net_text:right()+5 )
	crime_net_text_bg:set_top( crime_net_text:top()-5 )
	]]
	
	
	self._map_size_w = 2048
	self._map_size_h = 1024
	
	local aspect = 1280 / 720
	
	local sw = math.min( self._map_size_w, self._map_size_h * aspect )
	local sh = math.min( self._map_size_h, self._map_size_w / aspect )
	
	local dw = self._map_size_w / sw
	local dh = self._map_size_h / sh
	
	self._map_size_w = dw * 1280
	self._map_size_h = dh * 720
	
	local pw, ph = self._map_size_w, self._map_size_h
	
	self._pan_panel_border = 25 / 9
	self._pan_panel_job_border_x = full_16_9.convert_x + self._pan_panel_border * 2
	self._pan_panel_job_border_y = full_16_9.convert_y + self._pan_panel_border * 2
	
	self._pan_panel = self._panel:panel( { name = "pan", w = pw, h = ph, layer=0 } )
	self._pan_panel:set_center( self._fullscreen_panel:w()/2, self._fullscreen_panel:h()/2 )
	self._jobs = {}
	
	self._map_panel = self._fullscreen_panel:panel( { name="map", w = pw, h = ph } )
	
	self._map_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map", layer = 0, w = pw, h = ph } )
	self._map_panel:child("map"):set_halign( "scale" )
	self._map_panel:child("map"):set_valign( "scale" )
	
	self._map_panel:set_shape( self._pan_panel:shape() )
	
	self._map_x, self._map_y = self._map_panel:position()
	
	-- self:_set_map_position( 0, 0 )
	
	if not managers.menu:is_pc_controller() then
		managers.mouse_pointer:confine_mouse_pointer( self._panel )
		managers.menu:active_menu().input:activate_controller_mouse()
		managers.mouse_pointer:set_mouse_world_position( managers.gui_data:safe_to_full( self._panel:world_center() ) )
	end

	self.MIN_ZOOM = 1
	self.MAX_ZOOM = 9
	self._zoom = 1 -- (self.MIN_ZOOM + self.MAX_ZOOM) / 2
	
	local cross_indicator_h1 = self._fullscreen_panel:bitmap( { name="cross_indicator_h1", texture="guis/textures/pd2/skilltree/dottedline", w=self._fullscreen_panel:w(), h=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1, wrap_mode="wrap" } )
	local cross_indicator_h2 = self._fullscreen_panel:bitmap( { name="cross_indicator_h2", texture="guis/textures/pd2/skilltree/dottedline", w=self._fullscreen_panel:w(), h=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1, wrap_mode="wrap" } )
	local cross_indicator_v1 = self._fullscreen_panel:bitmap( { name="cross_indicator_v1", texture="guis/textures/pd2/skilltree/dottedline", h=self._fullscreen_panel:h(), w=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1, wrap_mode="wrap" } )
	local cross_indicator_v2 = self._fullscreen_panel:bitmap( { name="cross_indicator_v2", texture="guis/textures/pd2/skilltree/dottedline", h=self._fullscreen_panel:h(), w=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1, wrap_mode="wrap" } )
	
	local line_indicator_h1 = self._fullscreen_panel:rect( { name="line_indicator_h1", w=0, h=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1 } )
	local line_indicator_h2 = self._fullscreen_panel:rect( { name="line_indicator_h2", w=0, h=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1 } )
	local line_indicator_v1 = self._fullscreen_panel:rect( { name="line_indicator_v1", h=0, w=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1 } )
	local line_indicator_v2 = self._fullscreen_panel:rect( { name="line_indicator_v2", h=0, w=2, blend_mode="add", layer=17, color=tweak_data.screen_colors.crimenet_lines, alpha=0.1 } )
	
	
	local fw = self._fullscreen_panel:w()
	local fh = self._fullscreen_panel:h()
	
	cross_indicator_h1:set_texture_coordinates( Vector3( 0, 0, 0 ), Vector3( fw, 0, 0 ), Vector3( 0, 2, 0 ), Vector3( fw, 2, 0 ) )
	cross_indicator_h2:set_texture_coordinates( Vector3( 0, 0, 0 ), Vector3( fw, 0, 0 ), Vector3( 0, 2, 0 ), Vector3( fw, 2, 0 ) )
	
	cross_indicator_v1:set_texture_coordinates( Vector3( 0, 2, 0 ), Vector3( 0, 0, 0 ), Vector3( fh, 2, 0 ), Vector3( fh, 0, 0 ) )
	cross_indicator_v2:set_texture_coordinates( Vector3( 0, 2, 0 ), Vector3( 0, 0, 0 ), Vector3( fh, 2, 0 ), Vector3( fh, 0, 0 ) )
	
	self:_create_locations()
	
	self._num_layer_jobs = 0
	
	local player_level = managers.experience:current_level()
	local positions_tweak_data = tweak_data.gui.crime_net.map_start_positions
	
	local start_position
	for _, position in ipairs( positions_tweak_data ) do
		if position.max_level >= player_level then
			start_position = position
			break
		end
	end
	
	if start_position then
		self._zoom = 0.9 + 0.1 * start_position.zoom
		self:_set_zoom( "in", fw*0.5, fh*0.5 )
		self:_goto_map_position( start_position.x, start_position.y )
	end
	
	--[[
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	self:_set_zoom( "in", fw*0.5, fh*0.5 )
	]]
	
	do return end
	--[[
	self._panel:text( { name = "cyber_text", text = "92839429043203489320489541458861681864561321638433203489320489023489023480915134789321321864891392392839429043203489320489023489029283942904320348932048902341651861681890234809239283942904320348932048902348902348092392839429043203489320489023489023480923348092348902928394290432034893204890234890234809239283942904320348932048902348902348092392839429043203489323489023480923",
							wrap = true, x = 20, y = 20, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, color = Color.white:with_alpha( 0.2 ), layer = 1, visible = true, w = 60 } )
	local _,_,_,h = self._panel:child( "cyber_text" ):text_rect()
	self._panel:child( "cyber_text" ):set_h( h )
	
	self._panel:text( { name = "text_indicator1", text = "LT: 100.566", x = 0, y = 0, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	self._panel:text( { name = "text_indicator2", text = "LT: 100.566", x = 0, y = 0, align="right", halign="right", vertical="top", hvertical="top",
							font = tweak_data.menu.small_font, font_size = 14, kern = -1, layer = 1, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	
	self._panel:bitmap( { name="cross_indicator1", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ) } )
	self._panel:bitmap( { name="cross_indicator2", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 90 } )
	self._panel:bitmap( { name="cross_indicator3", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 180 } )
	self._panel:bitmap( { name="cross_indicator4", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, 16, 16 }, w = 16, h = 16, blend_mode="normal", layer = 5, color = Color( 1, 1, 1, 1 ), rotation = 270 } )
	
	self._panel:rect( { name="v_rect", color = Color.white:with_alpha( 0.05 ), w = 100, h = self._panel:h() - 16, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator2", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = 8, layer = 5 } ):hide()
	self._panel:rect( { name="v_indicator", color = Color.white:with_alpha( 0.5 ), w = 100, h = 2, x = 0, y = self._panel:h() - 2 - 8, layer = 5 } ):hide()
	self._panel:rect( { name="h_rect", color = Color.white:with_alpha( 0.05 ), w = self._panel:w() - 16, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator2", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = 8, y = 0, layer = 5 } ):hide()
	self._panel:rect( { name="h_indicator", color = Color.white:with_alpha( 0.5 ), w = 2, h = 100, x = self._panel:w() - 2 - 8, y = 0, layer = 5 } ):hide()
	
	-- self._panel:rect( { color = Color.red, w = 5, h = 5, x = self._panel:w()/2, y = self._panel:h()/2, layer = 10 } )
	
	self.MIN_ZOOM = 0.65
	self.MAX_ZOOM = 3
	self._zoom = 1
	local pw, ph = 2048 * 1.5, 1024 * 1.1
	self._pan_grid = self._fullscreen_panel:bitmap( { name="pan_grid", texture = "guis/textures/crimenet_map_smallgrid", texture_rect = { 0, 0, pw, ph }, blend_mode="normal", layer = 2, color = Color( 1, 1, 1, 1 ), wrap_mode="wrap", w = pw, h = ph } )
	self._pan_cross = self._fullscreen_panel:bitmap( { name="pan_cross", texture = "guis/textures/crimenet_map_biggrid", texture_rect = { 0, 0, pw, ph }, blend_mode="normal", layer = 3, color = Color( 1, 1, 1, 1 ), wrap_mode="wrap", w = pw, h = ph } )
	self._fullscreen_panel:bitmap( { name="vignette", texture = "guis/textures/crimenet_map_vignette", layer = 4, color = Color( 1, 1, 1, 1 ), blend_mode="mul", w = self._fullscreen_panel:w(), h = self._fullscreen_panel:h() } )
	
	local os = 0
	self._map2 = self._fullscreen_panel:bitmap( { visible=true, name="map_2", texture = "guis/textures/crimenet_map", layer = 2, blend_mode="normal", color = Color.red:with_alpha( 0.2 ), w = pw + os, h = ph + os } )
	self._map3 = self._fullscreen_panel:bitmap( { visible=true, name="map_3", texture = "guis/textures/crimenet_map", layer = 3, blend_mode="normal", color = Color.green:with_alpha( 0.2 ), w = pw - os, h = ph - os } )
	
	self._pan_panel_border = 100
	self._pan_panel_job_border = 250
	self._pan_panel = self._fullscreen_panel:panel( { name = "pan", x = -self._pan_panel_border, y = -self._pan_panel_border, w = pw, h = ph } )
	-- self._panel:bitmap( { name="bg", texture = "guis/textures/textboxbg", layer = 0, color = Color.white, w = self._panel:w(), h = self._panel:h() } )
	self._pan_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map", layer = 0, color = Color( 0.8, 0.8, 1 ), w = pw, h = ph } )
	self._pan_panel:child("map"):set_halign( "scale" )
	self._pan_panel:child("map"):set_valign( "scale" )
	-- self._pan_panel:set_debug( true )
	
	self:_create_locations()
	
	-- self._pan_panel:rect( { name="test", color = Color.red, w = 5, h = 5, x = self._panel:w()/2, y = self._panel:h()/2, layer = 10 } )
	
	-- self._panel:set_debug( true )
	local stats_list = { 	{ type = "bar", text = "DAMAGE: 32(+6)", current = 32, total = 50 } }
	self._text_box = TextBoxGui:new( self._ws, "NONE", "NONE", { stats_list = stats_list }, { no_close_legend = false, w = 200, h = 200, x = 0, y = 0 } )
	self._text_box:set_visible( false )
	self._jobs = {}
	
	self:_set_map_position( 0, 0 )
	
	if managers.controller:get_default_wrapper_type() ~= "pc" then
		managers.mouse_pointer:confine_mouse_pointer( self._panel )
		managers.mouse_pointer:set_mouse_world_position( managers.gui_data:safe_to_full( self._panel:world_center() ) )
	end
	]]
end

function CrimeNetGui:make_fine_text( text )
	local x,y,w,h = text:text_rect()
	text:set_size( w, h )
	text:set_position( math.round( text:x() ), math.round( text:y() ) )
	
	return w, h
	-- text:set_position( math.round( x ), math.round( y ) )
end

function CrimeNetGui:make_color_text( text_object, color )
	local text = text_object:text()
	local text_dissected = utf8.characters( text )
	local idsp = Idstring("#")
	
	local start_ci = {}
	local end_ci = {}
	local first_ci = true
	for i, c in ipairs( text_dissected ) do
		if Idstring( c ) == idsp then
			local next_c = text_dissected[i+1]
			
			if next_c and Idstring(next_c) == idsp then
				if first_ci then
					table.insert( start_ci, i )
				else
					table.insert( end_ci, i )
				end
				first_ci = not first_ci
			end
		end
	end
	
	if #start_ci ~= # end_ci then
	else
		for i=1, #start_ci do
			start_ci[i] = start_ci[i] - ( (i - 1) * 4 + 1 )
			end_ci[i] = end_ci[i] - ( i * 4 - 1 )
		end
	end
	text = string.gsub( text, "##", "" )
	
	text_object:set_text( text )
	text_object:clear_range_color( 1, utf8.len(text) )
	
	if #start_ci ~= # end_ci then
		Application:error( "CrimeNetGui:make_color_text: Not even amount of ##'s in text", #start_ci, #end_ci )
	else
		for i=1, #start_ci do
			text_object:set_range_color( start_ci[i], end_ci[i], color or tweak_data.screen_colors.resource )
		end
	end
end

function CrimeNetGui:_create_polylines()
	local regions = tweak_data.gui.crime_net.regions
	
	if alive( self._region_panel ) then
		self._map_panel:remove( self._region_panel )
		self._region_panel = nil
	end
	self._region_panel = self._map_panel:panel( { halign="scale", valign="scale" } )
	self._region_locations = {}
	
	local xs
	local ys
	
	local num
	local vectors
	
	local my_polyline
	local tw = math.max( self._map_panel:child("map"):texture_width(), 1 )
	local th = math.max( self._map_panel:child("map"):texture_height(), 1 )
	
	local region_text_data
	local region_text
	local x, y
	for _, region in ipairs( regions ) do
		xs = region[1]
		ys = region[2]
		num = math.min( #xs, #ys )
		
		
		vectors = {}
		my_polyline = self._region_panel:polyline( { line_width=2, alpha=0.6, layer=1, closed=region.closed, blend_mode="add", halign="scale", valign="scale", color=tweak_data.screen_colors.crimenet_lines } )
		for i=1, num do
			table.insert( vectors, Vector3( (xs[i]) / tw * self._map_size_w * self._zoom, (ys[i]) / th * self._map_size_h * self._zoom, 0 ) )
		end
		my_polyline:set_points( vectors )
		
		vectors = {}
		my_polyline = self._region_panel:polyline( { line_width=5, alpha=0.2, layer=1, closed=region.closed, blend_mode="add", halign="scale", valign="scale", color=tweak_data.screen_colors.crimenet_lines } )
		for i=1, num do
			table.insert( vectors, Vector3( (xs[i]) / tw * self._map_size_w * self._zoom, (ys[i]) / th * self._map_size_h * self._zoom, 0 ) )
		end
		my_polyline:set_points( vectors )
		
		
		region_text_data = region.text
		if region_text_data then
			x = region_text_data.x / tw * self._map_size_w * self._zoom
			y = region_text_data.y / th * self._map_size_h * self._zoom
			
			if region_text_data.title_id then
				region_text = self._region_panel:text( { font = tweak_data.menu.pd2_large_font, font_size = tweak_data.menu.pd2_large_font_size, text = managers.localization:to_upper_text(region_text_data.title_id), layer = 1, alpha = 0.6, blend_mode = "add", halign = "scale", valign = "scale", rotation=0 } )
				local _, _, w, h = region_text:text_rect()
				region_text:set_size( w, h )
				region_text:set_center( x, y )
				table.insert( self._region_locations, { object=region_text, size=region_text:font_size() } )
			end
			
			if region_text_data.sub_id then
				region_text = self._region_panel:text( { font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = managers.localization:to_upper_text(region_text_data.sub_id), align = "center", vertical = "center", layer = 1, alpha = 0.6, blend_mode = "add", halign = "scale", valign = "scale", rotation=0 } )
				local _, _, w, h = region_text:text_rect()
				region_text:set_size( w, h )
				
				if region_text_data.title_id then
					region_text:set_position( self._region_locations[ #self._region_locations ].object:left(), self._region_locations[ #self._region_locations ].object:bottom() - 5 )
				else
					region_text:set_center( x, y )
				end
				
				table.insert( self._region_locations, { object=region_text, size=region_text:font_size() } )
			end
		end
	end
	
	if Application:production_build() and tweak_data.gui.crime_net.debug_options.regions then
		for _, data in ipairs( tweak_data.gui.crime_net.locations ) do
			local location = data[1]
			if location and location.dots then
				for _, dot in ipairs( location.dots ) do
					self._region_panel:rect( { w=1, h=1, color=Color.red, x=dot[1] / tw * self._map_size_w * self._zoom, y=dot[2] / th * self._map_size_h * self._zoom, halign="scale", valign="scale", layer=1000 } )
				end
			end
		end
	end
	
	--[[
	if Application:production_build() and tweak_data.gui.crime_net.debug_options.regions then
		regions = tweak_data.gui.crime_net.locations
		for _, region_data in ipairs( regions ) do
			local region = region_data[1]
			xs = region[1]
			ys = region[2]
			num = math.min( #xs, #ys )
			
			vectors = {}
			my_polyline = self._region_panel:polyline( { line_width=2, alpha=0.5, layer=2, closed=true, blend_mode="add", halign="scale", valign="scale", color=Color.red } )
			for i=1, num do
				table.insert( vectors, Vector3( xs[i] / tw * self._map_size_w * self._zoom, ys[i] / th * self._map_size_h * self._zoom, 0 ) )
			end
			my_polyline:set_points( vectors )
		end
	end]]
end

function CrimeNetGui:set_players_online( players )
	local players_string = managers.money:add_decimal_marks_to_string( string.format( "%.3d", players ) )
	local num_players_text = self._panel:child("num_players_text")
	
	num_players_text:set_text( managers.localization:to_upper_text("cn_menu_num_players_online", {amount=players_string}) )
	self:make_fine_text( num_players_text )
	
	self._panel:child( "num_players_blur" ):set_shape( num_players_text:shape() )
end

function CrimeNetGui:_create_locations()
	self._locations = deep_clone( self._tweak_data.locations ) or {}
	tweak_data.gui:create_narrative_locations( self._locations )
	self:_create_polylines()
	--[[
	self:_add_location( "vlad", { x=359, y=711, radius=60, type="circle" } )
	-- self:_add_location( "vlad", { x=1039, y=777, w=162, h=116, type="box" } )
	
	
	self:_add_location( "the_elephant", { x=930, y=271, radius=20, type="circle" } )
	self:_add_location( "the_elephant", { x=1313, y=271, radius=20, type="circle" } )
	self:_add_location( "the_elephant", { x=1120, y=355, radius=10, type="circle" } )
	self:_add_location( "the_elephant", { x=745, y=524, radius=13, type="circle" } )
	
	
	self:_add_location( "hector", { x=1545, y=51, w=358, h=354, type="box" } )
	self:_add_location( "hector", { x=255, y=63, w=397, h=270, type="box" } )
	-- self:_add_location( { text = "DOWNTOWN", x = 1300/(2048*1.5)*self._map_size_w, y = 450/(1024*1.1)*self._map_size_h } )
	-- self:_add_location( { text = "THE WHITEHOUSE", x = 1550/(2048*1.5)*self._map_size_w, y = 940/(1024*1.1)*self._map_size_h } )
	-- self:_add_location( { text = "UNION STATION", x = 2100/(2048*1.5)*self._map_size_w, y = 600/(1024*1.1)*self._map_size_h } )
	]]
end

function CrimeNetGui:_add_location( contact, data )
	do return end
	self._locations[contact] = self._locations[contact] or {}
	table.insert( self._locations[contact], data ) 
end

function CrimeNetGui:_get_contact_locations( job_data, difficulty_id )
	local difficulties = { [2]="normal", [3]="hard", [4]="overkill", [5]="overkill_145" }
	return self._locations[ job_data.region or "street" ][ job_data.contact ][ difficulties[difficulty_id or 2] ]
end

function CrimeNetGui:_get_random_location()
	return (self._pan_panel_job_border_x + math.random( self._map_size_w - 2*self._pan_panel_job_border_x )), (self._pan_panel_job_border_y + math.random( self._map_size_h - 2*self._pan_panel_job_border_y ))
end

function CrimeNetGui:_get_job_location( data )
	local job_data = tweak_data.narrative.jobs[ data.job_id ]
	if not job_data then
		Application:error( "CrimeNetGui: Job not in NarrativeTweakData", data.job_id )
		return self:_get_random_location()
	end
	
	local locations = self:_get_contact_locations( job_data, data.difficulty_id )
	if locations and #locations > 0 then
		local found_point = false
		local x
		local y
		local randomized_location
		
		local total_weight = 0
		for i, location in ipairs( locations ) do
			total_weight = total_weight + ( location.weight or 1 )
		end
		
		local break_limit = 100
		while not found_point do
			-- local variant = math.random( #locations )
			
			local weight_variant = math.random( total_weight )
			local variant = 1
			for i, location in ipairs( locations ) do
				weight_variant = weight_variant - ( location.weight or 1 )
				
				if weight_variant <= 0 then
					variant = i
					break
				end
			end
			
			randomized_location = locations[variant]
			variant = math.random( #randomized_location.dots )
			
			randomized_location = randomized_location.dots[variant]
			if randomized_location and not randomized_location[3] then
				x = randomized_location[1]
				y = randomized_location[2]
			end
			
			if x and y then
				found_point = true
			end
			break_limit = break_limit - 1
			if break_limit <= 0 then
				break
			end
		end
		--[[
		
		local total_weight = 0
		for i, location in ipairs( locations ) do
			total_weight = total_weight + ( location.weight or 1 )
		end
		local weight_variant = math.random( total_weight )
		
		local variant = 1
		for i, location in ipairs( locations ) do
			weight_variant = weight_variant - ( location.weight or 1 )
			
			if weight_variant <= 0 then
				variant = i
				break
			end
		end
		
		-- local variant = math.random( #locations )
		local randomized_location = locations[variant]
		
		local bounding_box = randomized_location.bounding_box
		local x, y, j, c
		local vx = randomized_location[1]
		local vy = randomized_location[2]
		
		local break_limit = 100
		while not found_point do
			x = math.rand( bounding_box[1], bounding_box[2] )
			y = math.rand( bounding_box[3], bounding_box[4] )
			
			j = #vx
			for i=1, #vx do
				if ( (vy[i]>y) ~= (vy[j]>y) ) and
					 ( x < (vx[j]-vx[i]) * (y-vy[i]) / (vy[j]-vy[i]) + vx[i] ) then
					found_point = not found_point
				end
				j = i
			end
			
			break_limit = break_limit - 1
			if break_limit < 0 then
				Application:error( "[CrimeNetGui:_get_job_location] get point reached break limit!" )
				break
			end
			
		end
		]]
		
		--[[
		local box = randomized_location.box
		local circle = randomized_location.circle
		
		if box and circle and math.rand(1)>0.5 then
			box = nil
		end
			
		if box then
			x = math.random( box.w or 0 ) + (box.x or 0)
			y = math.random( box.h or 0 ) + (box.y or 0)
		elseif circle then
			local angle = math.rand( 360 )
			local distance = math.rand( circle.radius or 0 )
			
			x = math.cos( angle ) * distance + (circle.x or 0)
			y = math.sin( angle ) * distance + (circle.y or 0)
		end
		
		]]
		--[[
		if randomized_location.type == "box" then
			x = math.random( randomized_location.w or 0 ) + (randomized_location.x or 0)
			y = math.random( randomized_location.h or 0 ) + (randomized_location.y or 0)
		elseif randomized_location.type == "circle" then
			local angle = math.rand( 360 )
			local distance = math.rand( randomized_location.radius or 0 )
			
			x = math.cos( angle ) * distance + (randomized_location.x or 0)
			y = math.sin( angle ) * distance + (randomized_location.y or 0)
		end]]
		
		if x and y then
			local tw = math.max( self._map_panel:child("map"):texture_width(), 1 )
			local th = math.max( self._map_panel:child("map"):texture_height(), 1 )
			
			x = math.round( x / tw * self._map_size_w )
			y = math.round( y / th * self._map_size_h )
			
			return x, y, randomized_location
		end
	end
	
	return self:_get_random_location()
end

--[[
function CrimeNetGui:_add_location( data )
	local location = self._map_panel:text( { text = data.text, x = data.x, y = data.y, align="left", halign="left", vertical="top", hvertical="top",
							font = tweak_data.menu.default_font, font_scale = self._zoom * 2, font_size = nil, layer = 2, visible = true, color = Color.white:with_alpha( 0.5 ) } )
	location:set_halign( "scale" )
	location:set_valign( "scale" )
	
	table.insert( self._locations, location ) 
end]]

function CrimeNetGui:add_preset_job( preset_id )
	self:remove_job( preset_id )
	local preset = managers.crimenet:preset( preset_id )
	-- local data = { job_id = preset }
	-- local gui_data = self:_create_job_gui( data, "preset" )
	local gui_data = self:_create_job_gui( preset, "preset" )
	gui_data.preset_id = preset_id
	self._jobs[ preset_id ] = gui_data
end

	-- add_crimenet_server_job
function CrimeNetGui:add_server_job( data )
	-- print( "add_server_job", inspect( data ) )
	local gui_data = self:_create_job_gui( data, "server" )
	gui_data.server = true
	gui_data.host_name = data.host_name
	self._jobs[ data.id ] = gui_data
end

function CrimeNetGui:_create_job_gui( data, type, fixed_x, fixed_y )
	local level_id = data.level_id
	local level_data = tweak_data.levels[ level_id ]
	local narrative_data = data.job_id and tweak_data.narrative.jobs[ data.job_id ]
	
	local is_server = type == "server"
	local is_professional = narrative_data and narrative_data.professional
	
	local x = fixed_x
	local y = fixed_y
	local location = nil
	
	if not x and not y then
		x, y, location = self:_get_job_location( data )
	end
	
	--[[
	local x = fixed_x or (self._pan_panel_job_border_x + math.random( self._map_size_w - 2*self._pan_panel_job_border_x ))
	local y = fixed_y or (self._pan_panel_job_border_y + math.random( self._map_size_h - 2*self._pan_panel_job_border_y ))
	]]
	
	local color = Color.white
	local friend_color = tweak_data.screen_colors.friend_color
	local regular_color = tweak_data.screen_colors.regular_color
	local pro_color = tweak_data.screen_colors.pro_color
	
	local side_panel = self._pan_panel:panel( { layer=26, alpha=0 } )
	
	
	local stars_panel = side_panel:panel( { name="stars_panel", layer = -1, visible = true, w = 100 } )
	local num_stars = 0
	local star_size = 8
	
	local job_num = 0
	local job_cash = 0
	
	if data.job_id then
		local x = 0
		local y = 0
		local job_stars = math.ceil( tweak_data.narrative.jobs[ data.job_id ].jc/10 )
		local difficulty_stars = data.difficulty_id-2
		for i = 1, 10 do -- job_stars + difficulty_stars
			stars_panel:bitmap( { texture = "guis/textures/pd2/crimenet_paygrade_marker", x = x, y = y, blend_mode="normal", layer = 0, color=((i>job_stars + difficulty_stars) and Color.black) or ((i>job_stars) and tweak_data.screen_colors.risk) or color  } )
			x = x + star_size
			
			num_stars = num_stars + 1
		end
		local money_multiplier = managers.money:get_contract_difficulty_multiplier( difficulty_stars )
		local money_stage_stars = managers.money:get_stage_payout_by_stars( job_stars )
		local money_job_stars = managers.money:get_job_payout_by_stars( job_stars )
		
		job_num = #tweak_data.narrative.jobs[ data.job_id ].chain
		job_cash = managers.experience:cash_string( math.round( money_job_stars + money_job_stars * money_multiplier + (money_stage_stars + money_stage_stars * money_multiplier) * (#tweak_data.narrative.jobs[ data.job_id ].chain) ) )
	end
	
	local host_string = data.host_name or ( is_professional and managers.localization:to_upper_text( "cn_menu_pro_job" ) ) or " "
	local job_string = data.job_id and managers.localization:to_upper_text( tweak_data.narrative.jobs[ data.job_id ].name_id ) or data.level_name or "NO JOB"
	local contact_string = utf8.to_upper( data.job_id and managers.localization:text( tweak_data.narrative.contacts[ tweak_data.narrative.jobs[ data.job_id ].contact ].name_id ) )
												or "BAIN"
	contact_string = contact_string .. ": "
	
	local info_string = managers.localization:to_upper_text( "cn_menu_contract_short_" .. (job_num>1 and "plural" or "singular"), {days=job_num, money=job_cash} )
	
	
	local host_name = side_panel:text( { name="host_name", text = host_string, vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color=(data.is_friend and friend_color) or (is_server and regular_color) or pro_color, blend_mode="add", layer=0 } )
	local job_name = side_panel:text( { name="job_name", text = job_string, vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color=color,blend_mode="add", layer=0 } )
	local contact_name = side_panel:text( { name="contact_name", text = contact_string, vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color=color, blend_mode="add", layer=0 } )
	local info_name = side_panel:text( { name="info_name", text = info_string, vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color=color, blend_mode="add", layer=0 } )
	
	
	
	
	
--[[
	local job_name = text_panel:text( { name="job_name", text = job_string, x = x + 32, y = y, align="left", vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, layer = 1, visible = true, color=color, alpha=0, blend_mode="add" } )
	local host_name = text_panel:text( { name="host_name", text = text_string, x = x + 32, y = y, align="left", vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, layer = 1, visible = true, color=(data.is_friend and friend_color) or (is_server and regular_color) or pro_color, alpha=0, blend_mode="add" } )
]]

--[[
	local info_string = contact_name .. "\n" .. 
					( data.job_id and (
					utf8.to_upper( managers.localization:text( tweak_data.narrative.jobs[ data.job_id ].name_id ) ) .. "\n" .. 
					utf8.to_upper( managers.localization:text( "cn_menu_num_stages", {stages=#tweak_data.narrative.jobs[ data.job_id ].chain or 1} ) )
					) or "NO JOB DATA" )
			
	local info_text = self._pan_panel:text( { text = info_string, x = x + 46, y = y, align="left", vertical="center",
							font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, layer = 1, visible = true, color=color, alpha=0 } )
	]]
	
		--[[
		for i = 1, data.difficulty_id-2 do
			stars_panel:bitmap( { texture = "guis/textures/pd2/crimenet_star", x = x, y = y, blend_mode="add", layer = 0, color = Color.red } )
			x = x + star_size
			num_stars = num_stars + 1
		end
		]]
	stars_panel:set_w( star_size * math.min( 10, #stars_panel:children() ) )
	stars_panel:set_h( star_size )
	-- stars_panel:set_halign( "scale" )
	-- stars_panel:set_valign( "scale" )
	-- stars_panel:set_debug( true )
	
	local focus = self._pan_panel:bitmap( { name="focus", texture = "guis/textures/crimenet_map_circle", layer = 10, color = color:with_alpha(0.6), blend_mode = "add" } )
	
	do
		local _, _, w, h = host_name:text_rect()
		host_name:set_size( w, h )
		host_name:set_position( 0, 0 )
	end
	
	do
		local _, _, w, h = job_name:text_rect()
		job_name:set_size( w, h )
		job_name:set_position( 0, host_name:bottom() )
	end
	
	do
		local _, _, w, h = contact_name:text_rect()
		contact_name:set_size( w, h )
		contact_name:set_top( job_name:top() )
		contact_name:set_right( 0 )
	end
	
	do
		local _, _, w, h = info_name:text_rect()
		info_name:set_size( w, h )
		info_name:set_top( contact_name:bottom() )
		info_name:set_right( 0 )
	end
	
	
	stars_panel:set_position( 0, job_name:bottom() )
	side_panel:set_h( stars_panel:bottom() )
	side_panel:set_w( 300 )
	
	
	-- host_name:set_halign( "scale" )
	-- host_name:set_valign( "scale" )
	
	self._num_layer_jobs = ( self._num_layer_jobs + 1 ) % 1	-- layer 11 - 16		-- layer  11 - 49 
	
	local marker_panel = self._pan_panel:panel( { w = 36, h = 66, layer = 11 + self._num_layer_jobs*3, alpha=0 } )
	local select_panel = marker_panel:panel( { name="select_panel", w=36, h=38, x=-2, y=0  } )
	
	local glow_panel = self._pan_panel:panel( { w=64*15, h=192, layer=10, alpha=0 } )
	local glow_center = glow_panel:bitmap( { texture="guis/textures/pd2/crimenet_marker_glow", w=192, h=192, blend_mode="add", alpha=0.55, color=is_professional and pro_color or regular_color } )
	local glow_stretch = glow_panel:bitmap( { texture="guis/textures/pd2/crimenet_marker_glow", w=64*15, h=50, blend_mode="add", alpha=0.55, color=is_professional and pro_color or regular_color } )
	local glow_center_dark = glow_panel:bitmap( { texture="guis/textures/pd2/crimenet_marker_glow", w=150, h=150, blend_mode="normal", alpha=0.7, color=Color.black, layer=-1 } )
	local glow_stretch_dark = glow_panel:bitmap( { texture="guis/textures/pd2/crimenet_marker_glow", w=66*15, h=55, blend_mode="normal", alpha=0.7, color=Color.black, layer=-1 } ) -- , render_template="VertexColorTexturedBlur3D" } )
	glow_center:set_center( glow_panel:w()/2, glow_panel:h()/2 )
	glow_stretch:set_center( glow_panel:w()/2, glow_panel:h()/2 )
	glow_center_dark:set_center( glow_panel:w()/2, glow_panel:h()/2 )
	glow_stretch_dark:set_center( glow_panel:w()/2, glow_panel:h()/2 )
	
	
	-- marker_panel:set_halign( "scale" )	
	-- marker_panel:set_valign( "scale" )
	
	-- local marker_rect = marker_panel:rect( { color = (is_server and Color( 0.8, 0.8, 0.5) or Color( 0.5, 0.5, 0.8)):with_alpha( 0.5 ) } )
	-- local marker_rect = marker_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map_dot", color = (is_server and Color( 1, 1, 0.2) or Color( 0.2, 0.2, 1)):with_alpha( 0.5 ), w = 40, h = 40, x = -4, y = -4 } )
	-- local timer_rect = marker_panel:rect( { color = Color.green:with_alpha( 0.5 ) } )
	-- local timer_rect = marker_panel:bitmap( { name="map", texture = "guis/textures/crimenet_map_dot", color = Color.green:with_alpha( 0.5 ), w = 40, h = 40, x = -4, y = -4 } )
	
	-- local marker_rect = marker_panel:bitmap( { name="marker_rect", texture = "guis/textures/pd2/crimenet_marker", color=color:with_alpha(0.5), w=64, h=64 } )
	local marker_dot = marker_panel:bitmap( { name="marker_dot", texture = "guis/textures/pd2/crimenet_marker_".. (is_server and "join" or "host") .. (is_professional and "_pro" or ""), color=color, w=32, h=64, x=2, y=2, layer=1 } )
	
	if is_professional then
		marker_panel:bitmap( { name="marker_pro_outline", texture="guis/textures/pd2/crimenet_marker_pro_outline", w=64, h=64, x=0, y=0, rotation=0, layer=0, alpha=1, blend_mode="add" } )
	end
	
	-- local text = data.host_name or ( data.job_id and tweak_data.narrative.jobs[ data.job_id ].professional and managers.localization:to_upper_text( "cn_menu_pro_job" ) )
	-- local job_name = data.job_id and managers.localization:to_upper_text( tweak_data.narrative.jobs[ data.job_id ].name_id ) or data.level_name or "NO JOB"
	
	-- marker_panel:set_alpha(0.8)
	-- stars_panel:set_alpha(0.8)
	
	
	local timer_rect = nil
	local peers_panel = nil
	
	if( is_server ) then
		peers_panel = self._pan_panel:panel( { layer = 11 + self._num_layer_jobs*3, visible = true, w = 32, h = 62, alpha=0 } )
		-- peers_panel:set_alpha(0.8)
		
		local cx = 0
		local cy = 0
		
		for i = 1, 4 do
			-- cx = peers_panel:center_x() - 23 * math.cos( 48 + 12 - i * 24 )
			-- cy = peers_panel:center_y() - 23 * math.sin( 48 + 12 - i * 24 )
			cx = 3 + (6 *(i-1))
			cy = 8
			
			local player_marker = peers_panel:bitmap( { name=tostring(i), texture="guis/textures/pd2/crimenet_marker_peerflag", w=8, h=16, color=color, layer=2, blend_mode="normal", visible=(i<=data.num_plrs) } )
			-- player_marker:set_center( cx, cy )
			player_marker:set_position( cx, cy )
		end
	else
		timer_rect = marker_panel:bitmap( { name="timer_rect", texture = "guis/textures/pd2/crimenet_timer", color=Color.white, w=32, h=32, x=1, y=2, render_template="VertexColorTexturedRadial", layer=2 } )
		timer_rect:set_texture_rect( 32,0,-32,32)
	end
	-- local x = marker_panel:x() + marker_panel:w()/2
	-- local y = marker_panel:y() + marker_panel:h()-2
	-- local info_panel = self._panel:panel( { w = 200, h = 200, x = x, y = y, visible = false, layer = 2 } )
	-- local info_rect = info_panel:rect( { color = Color.blue:with_alpha( 0.5 ), layer = 0 } )
	-- local name = info_panel:text( { text = managers.localization:text( level_data.name_id ), align="left", halign="left", vertical="top", hvertical="top",
	-- 					font = tweak_data.menu.default_font, font_size = 24, layer = 1 } )
	
	
	marker_panel:set_center( x * self._zoom, y * self._zoom )
	focus:set_center( marker_panel:center() )
	
	glow_panel:set_world_center( marker_panel:child("select_panel"):world_center() )
	
	-- job_name:set_left( marker_panel:right() )
	-- job_name:set_center_y( marker_panel:top() + 29 )
	
	local text_on_right = x < (self._map_size_w-200)
	
	if text_on_right then
		side_panel:set_left( marker_panel:right() )
	else
		job_name:set_text( contact_name:text() .. job_name:text() ) 
		contact_name:set_text( "" )
		contact_name:set_w(0)
		local _, _, w, h = job_name:text_rect()
		job_name:set_size( w, h )
		
		host_name:set_right( side_panel:w() )
		job_name:set_right( side_panel:w() )
		contact_name:set_left( side_panel:w() )
		info_name:set_left( side_panel:w() )
		stars_panel:set_right( side_panel:w() )
		
		side_panel:set_right( marker_panel:left() )
	end
	side_panel:set_center_y( marker_panel:top() + 11 )
	-- host_name:set_left( job_name:left() )
	-- host_name:set_bottom( job_name:top() )
	
	-- info_text:set_left( job_name:left() )
	-- info_text:set_center_y( job_name:center_y() )
	
	-- stars_panel:set_left( job_name:left() )
	-- stars_panel:set_top( job_name:bottom() )
	
	if( peers_panel ) then
		peers_panel:set_center_x( marker_panel:center_x() )
		peers_panel:set_center_y( marker_panel:center_y() )
	end
	
	if Application:production_build() then
		-- host_name:set_debug( true )
		-- marker_panel:set_debug( true )
		-- stars_panel:set_debug( true )
		
		-- side_panel:set_debug(true)
		if peers_panel then
			-- peers_panel:set_debug(true)
		end
	end
	
	local callout
	if narrative_data and narrative_data.crimenet_callouts and #narrative_data.crimenet_callouts > 0 then
		local variant = math.random( #narrative_data.crimenet_callouts )
		
		callout = narrative_data.crimenet_callouts[ variant ]
	end
	
	if location then
		location[3] = true
	end
	
	managers.menu:post_event( "job_appear" )
	
	local job = { room_id = data.room_id, job_id = data.job_id, level_id = level_id, level_data = level_data, marker_panel = marker_panel, peers_panel = peers_panel,
				--[[marker_rect = marker_rect,]] timer_rect = timer_rect, side_panel = side_panel, --[[host_name = host_name, info_text = info_text, job_name = job_name, stars_panel = stars_panel, ]]focus = focus,
				difficulty = data.difficulty, difficulty_id = data.difficulty_id, num_plrs = data.num_plrs, job_x=x, job_y=y, state=data.state, layer=11 + self._num_layer_jobs*3, glow_panel = glow_panel, callout = callout, text_on_right = text_on_right, location=location }
				
	self:update_job_gui( job, 3 )
	return job
end

function CrimeNetGui:remove_job( id )
	local data = self._jobs[ id ]
	if not data then
		return
	end
	if not alive( self._panel ) then
		return
	end
	
	self._pan_panel:remove( data.marker_panel )
	self._pan_panel:remove( data.glow_panel )
	-- self._pan_panel:remove( data.job_name )
	-- self._pan_panel:remove( data.host_name )
	-- self._pan_panel:remove( data.info_text )
	self._pan_panel:remove( data.side_panel )
	self._pan_panel:remove( data.focus )
	-- self._pan_panel:remove( data.stars_panel )
	
	if data.location then
		data.location[3]=nil
	end
	
	if( data.peers_panel ) then
		self._pan_panel:remove( data.peers_panel )
	end
	if data.expanded then
		-- self._text_box:set_visible( false )
	end
	self._jobs[ id ] = nil
end

	-- update_crimenet_server_job
function CrimeNetGui:update_server_job( data )
	local job = self._jobs[ data.id ]
	if not job then
		return
	end
	
	local level_id = data.level_id
	local level_data = tweak_data.levels[ level_id ]
	
	local recreate_job = false
	recreate_job = recreate_job or self:_update_job_variable( data.id, "room_id", data.room_id )
	recreate_job = recreate_job or self:_update_job_variable( data.id, "job_id", data.job_id )
	recreate_job = recreate_job or self:_update_job_variable( data.id, "level_id", level_id )
	recreate_job = recreate_job or self:_update_job_variable( data.id, "level_data", level_data )
	recreate_job = recreate_job or self:_update_job_variable( data.id, "difficulty", data.difficulty )
	recreate_job = recreate_job or self:_update_job_variable( data.id, "difficulty_id", data.difficulty_id )
	-- recreate_job = recreate_job or self:_update_job_variable( data.id, "state", data.state )
	-- recreate_job = recreate_job or self:_update_job_variable( data.id, "num_plrs", data.num_plrs )
	self:_update_job_variable( data.id, "state", data.state )
	if self:_update_job_variable( data.id, "num_plrs", data.num_plrs ) then
		if( job.peers_panel ) then
			for i, peer_icon in ipairs( job.peers_panel:children() ) do
				peer_icon:set_visible( i<=job.num_plrs )
				-- peer_icon:set_texture_rect ( (i>job.num_plrs) and 0 or 8, 0, 8, 8 )
			end
		end
	end
	
	
	if recreate_job then
		print( "[CrimeNetGui] update_server_job", "data.id", data.id )
		local x = job.job_x
		local y = job.job_y
		self:remove_job( data.id )
		
		local gui_data = self:_create_job_gui( data, "server", x, y )
		gui_data.server = true
		self._jobs[ data.id ] = gui_data
	end
end

function CrimeNetGui:_update_job_variable( id, variable, value )
	local data = self._jobs[ id ]
	if not data then
		return
	end
	
	local updated = ( data[variable] ~= value )
	data[variable] = value
	
	return updated
end


function CrimeNetGui:update_job( id, t, dt )
	local data = self._jobs[ id ]
	if not data then
		return
	end
	
	data.focus:set_alpha( data.focus:alpha() - dt/2 )
	-- data.focus:set_color( data.focus:color():with_alpha( (  ) ) )
	data.focus:set_size( data.focus:w() + dt * 200, data.focus:h() + dt * 200 )
	data.focus:set_center( data.marker_panel:center() )
end

function CrimeNetGui:feed_timer( id, t, max_t )
	local data = self._jobs[ id ]
	if not data then
		return
	end
	
	if( not data.timer_rect ) then
		return
	end
	data.timer_rect:set_color( Color( t/max_t, 1, 1 ) )
	if (max_t - t) < 4 then -- 4 first seconds
	-- 	data.timer_rect:set_color( Color.green:with_alpha( 0.0 + (math.sin( t*750 )+1)/4 ) )
	elseif (t) < 4 then -- 4 last seconds
	-- 	data.timer_rect:set_visible( true )
	-- 	data.timer_rect:set_color( Color.red:with_alpha( 0.0 + (math.sin( t*750 )+1)/4 ) )
	else
	-- 	data.timer_rect:set_visible( false )
	end
end

function CrimeNetGui:update( t, dt )

	--[[if self._closing then
		self._panel:set_alpha( math.max( self._panel:alpha() - dt, 0 ) )
		return
	end
	self._panel:set_alpha( math.min( self._panel:alpha() + dt, 1 ) )]] 
	--[[
	local x = (self._fullscreen_panel:child( "cross_indicator_v1" ):x() + self._fullscreen_panel:child( "cross_indicator_v2" ):x()) / 2
	local y = (self._fullscreen_panel:child( "cross_indicator_h1" ):y() + self._fullscreen_panel:child( "cross_indicator_h2" ):y()) / 2
	
	x = string.format( "%.1f", x )
	y = string.format( "%.1f", y )
	local zoom_string = string.format( "%.2f", self._zoom )
	self._panel:child("map_coord_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_mapcoords", {zoom=zoom_string, x=x, y=y} ) ) )
	
	local num_jobs = 0
	
	for i, d in pairs( self._jobs ) do
		num_jobs = num_jobs + 1
	end
	
	
	
	local friends = (is_win32 and Steam:logged_on() and Steam:friends()) or {}				-- TODO: need to get friends for all platforms
	local num_friends_playing = 0
	
	for _, friend in ipairs( friends ) do
		if( friend:playing_this() ) then
			num_friends_playing = num_friends_playing + 1
		end
	end
	
	local num_jobs_string = string.format( "%03d", num_jobs )
	local num_friends_playing_string = string.format( "%03d", num_friends_playing )
	self._panel:child("num_contracts_text"):set_text( utf8.to_upper( managers.localization:text( "cn_menu_num_contracts", {contracts=num_jobs_string, friends=num_friends_playing_string} ) ) )
	]]
	
	--[[
	self._panel:child( "text_indicator1" ):set_text( string.format( "%.2f", self._panel:child( "v_indicator" ):x() + self._panel:child( "h_indicator" ):y() ) )
	self._panel:child( "text_indicator2" ):set_text( string.format( "%.2f", self._panel:child( "v_indicator" ):x() / self._panel:child( "h_indicator" ):y() ) )
	
	self._panel:child( "cyber_text" ):set_y( 200 - math.mod( math.floor( Application:time() )*20, self._panel:child( "cyber_text" ):line_height() * 10 ) )
]]
	self._rasteroverlay:set_texture_rect( 0, -math.mod( Application:time()*5, 32 ), 32, 512+128 )
	
	if self._released_map then		
		self._released_map.dx = math.lerp( self._released_map.dx, 0, dt*2 )
		self._released_map.dy = math.lerp( self._released_map.dy, 0, dt*2 )
		self:_set_map_position( self._released_map.dx, self._released_map.dy )
		
		if self._map_panel:x() >= -5 or (self._fullscreen_panel:w() - self._map_panel:right() ) >=-5 then
			self._released_map.dx = 0
		end
		if self._map_panel:y() >= -5 or  (self._fullscreen_panel:h() - self._map_panel:bottom() ) >=-5 then
			self._released_map.dy = 0
		end
		
		self._released_map.t = self._released_map.t - dt
		if self._released_map.t < 0 then
			self._released_map = nil
		end
	end
	
	
	if not self._grabbed_map then
		local speed = 5
		
		if self._map_panel:x() > -self:_get_pan_panel_border() then
			local mx = math.lerp( 0, -self:_get_pan_panel_border() - self._map_panel:x(), dt * speed )
			self:_set_map_position( mx, 0 )
		end
		if self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			local mx = math.lerp( 0, self:_get_pan_panel_border() - (self._map_panel:right()-self._fullscreen_panel:w()), dt * speed )
			self:_set_map_position( mx, 0 )
		end
		if self._map_panel:y() > -self:_get_pan_panel_border() then
			local my = math.lerp( 0, -self:_get_pan_panel_border() - self._map_panel:y(), dt * speed )
			self:_set_map_position( 0, my )
		end
		if self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			local my = math.lerp( 0, self:_get_pan_panel_border() - (self._map_panel:bottom()-self._fullscreen_panel:h()), dt * speed )
			self:_set_map_position( 0, my )
		end
	end
	
		
	if( not managers.menu:is_pc_controller() and managers.mouse_pointer:mouse_move_x() == 0 and managers.mouse_pointer:mouse_move_y() == 0 ) then
		local closest_job = nil
		local closest_dist = 100000000
		local closest_job_x, closest_job_y = 0, 0
		
		local mouse_pos_x, mouse_pos_y = managers.mouse_pointer:modified_mouse_pos()
		local job_x, job_y
		local dist = 0
		
		local x, y			-- temp math variables
		
		for id, job in pairs( self._jobs ) do
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
			
			x = job_x - mouse_pos_x
			y = job_y - mouse_pos_y
			
			dist = x * x + y * y		-- skipping math.sqrt, just checking relative distance		-- math.pow() is crazy expensive, compared to x*x (like times 10)
			
			if( dist < closest_dist ) then
				closest_job = job
				closest_dist = dist
				
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
		if( closest_job ) then 
			closest_dist = math.sqrt( closest_dist )		-- now we want actual distance
			if( closest_dist < self._tweak_data.controller.snap_distance ) then
				managers.mouse_pointer:force_move_mouse_pointer( math.lerp( mouse_pos_x, closest_job_x, dt * self._tweak_data.controller.snap_speed ) - mouse_pos_x, math.lerp( mouse_pos_y, closest_job_y, dt * self._tweak_data.controller.snap_speed ) - mouse_pos_y )
			end
		end
	end
end

function CrimeNetGui:feed_server_timer( id, t )
	local data = self._jobs[ id ]
	if not data then
		return
	end

	if( not data.timer_rect ) then
		return
	end
	if (t) < 4 then -- 4 first seconds
		data.timer_rect:set_visible( true )
		data.timer_rect:set_color( Color( math.sin( t*750 ),1, 1 ) ) -- Color.green:with_alpha( 0.0 + (math.sin( t*750 )+1)/4 ) )
	else
		data.timer_rect:set_visible( false )
	end

end

function CrimeNetGui:toggle_legend()
	managers.menu_component:post_event( "menu_enter" )
	self._panel:child("legend_panel"):set_visible( not self._panel:child("legend_panel"):visible() )
	self._panel:child("legends_button"):set_text( managers.localization:to_upper_text( self._panel:child("legend_panel"):visible() and "menu_cn_legend_hide" or "menu_cn_legend_show", {BTN_X=managers.localization:btn_macro("menu_toggle_legends")} ) )
	self:make_fine_text( self._panel:child("legends_button") )
	self._panel:child("legends_button_blur"):set_shape( self._panel:child("legends_button"):shape() )
end

function CrimeNetGui:mouse_button_click( button )
	return button == Idstring( "0" )
	
	--[[
	if managers.menu:is_pc_controller() then
		
	else
		return button == Idstring( "a" )
	end
	return nil
	]]
end

function CrimeNetGui:button_wheel_scroll_up( button )
	return button == Idstring( "mouse wheel up" )
--[[
	if managers.menu:is_pc_controller() then
		return button == Idstring( "mouse wheel up" )
	else
		return button == Idstring( "right_shoulder" )
	end
	return nil
	]]
end

function CrimeNetGui:button_wheel_scroll_down( button )
	return button == Idstring( "mouse wheel down" )
--[[
	if managers.menu:is_pc_controller() then
		return button == Idstring( "mouse wheel down" )
	else
		return button == Idstring( "left_shoulder" )
	end
	return nil
	]]
end

function CrimeNetGui:confirm_pressed()
	if( not self._crimenet_enabled ) then
		return false
	end
	
	return self:check_job_pressed( managers.mouse_pointer:modified_mouse_pos() )
end

function CrimeNetGui:special_btn_pressed( button )
	if( not self._crimenet_enabled ) then
		return false
	end
	
	if button == Idstring( "menu_toggle_legends" ) then
		self:toggle_legend()
		return true
	end
	
	if self._panel:child("filter_button") then
		if button == Idstring( "menu_toggle_filters" ) then
			managers.menu_component:post_event( "menu_enter" )
			if is_x360 then
				XboxLive:show_friends_ui( managers.user:get_platform_id() )
			else
				managers.menu:open_node( "crimenet_filters", {} )
			end
			return true
		end
	end
	
	return false
end

function CrimeNetGui:previous_page()
	if( not self._crimenet_enabled ) then
		return
	end
	self:_set_zoom( "out", managers.mouse_pointer:modified_mouse_pos() )
	
	return true
end

function CrimeNetGui:next_page()
	if( not self._crimenet_enabled ) then
		return
	end
	self:_set_zoom( "in", managers.mouse_pointer:modified_mouse_pos() )
	
	return true
end

function CrimeNetGui:input_focus()
	return self._crimenet_enabled and 1
end


function CrimeNetGui:check_job_mouse_over( x, y )

end

function CrimeNetGui:check_job_pressed( x, y )
	for id,job in pairs( self._jobs ) do
		if job.mouse_over == 1 then
			job.expanded = not job.expanded
			-- local x = job.marker_panel:x() + job.marker_panel:w()/2
			-- local y = job.marker_panel:y() + job.marker_panel:h()-2
			
			-- self:_goto_map_position( x, y )
			
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
			}
			managers.menu_component:post_event( "menu_enter" )
			managers.menu:open_node( Global.game_settings.single_player and "crimenet_contract_singleplayer" or (job.server and "crimenet_contract_join") or "crimenet_contract_host", { data } )
			
			--[[
			local data = {}
			local yes_button = {}
			yes_button.text = managers.localization:text( "dialog_accept" )
			-- yes_button.callback_func = params.yes_func
			local no_button = {}
			-- no_button.text = managers.localization:text( "dialog_no" )
			data.button_list = { yes_button }
			data.focus_button = 1
			
			data.stats_list = { { type = "bar", text = managers.localization:text( "menu_difficulty_"..job.difficulty ), current = job.difficulty_id, total = 4 }, 
								{ type = "bar", text = managers.localization:text( "menu_players_online", { COUNT = job.num_plrs or 0 } ) , current = job.num_plrs or 0, total = 4 }
								}
			data.stats_text = ""
			
			local job_data = job.job_id
			if not job_data then
				data.title = managers.localization:text( job.level_data.name_id )
				data.desc = managers.localization:text( job.level_data.briefing_id )
			else
				job_data = tweak_data.narrative.jobs[ job.job_id ]
				data.title = managers.localization:text( job_data.name_id )
				data.desc = managers.localization:text( job_data.briefing_id )
			end
			
			-- if( managers.controller:get_default_wrapper_type() == "pc" ) then
				-- self._text_box:recreate_text_box( self._ws, data.title, data.desc, data, { no_close_legend = false, w = 500, h = 200, x = 16, y = 48 } )
				-- self._text_box:set_layer( 6 )
				-- self._text_box:set_visible( job.expanded )
			-- else
				data.yes_func = callback( self, self, "start_job" )
				data.player_text = managers.localization:text( "menu_players_online", { COUNT = job.num_plrs or 0 } )
				managers.menu:show_accept_crime_net_job( data )
				]]
			-- end
			-- job.info_panel:set_visible( job.expanded )
			if job.expanded then
				for id2,job2 in pairs( self._jobs ) do
					if job2 ~= job then
						job2.expanded = false
					end
				end
			end
			return true
		end
		
		--[[
		if job.expanded and job.mouse_over_info then
			if job.preset_id then
				-- MenuCallbackHandler:start_crimenet_job( job.preset_id )
				-- self:remove_job( job.preset_id )
				-- return true
			end
		end
		]]
	end
end
	
function CrimeNetGui:mouse_pressed( o, button, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	
	-- if not self._panel:inside( x, y ) then
	-- 	return
	-- end
	--[[
	if self._text_box and self._text_box:visible() then
		if self:mouse_button_click( button ) then
			for i,panel in ipairs( self._text_box._text_box_buttons_panel:children() ) do
				if panel.child and panel:inside( x, y ) then
					if self._text_box:get_focus_button() == 1 then
						self:start_job()
					end
					return true
				end
			end
			
			if self._text_box:check_close( x, y ) then
				self._text_box:set_visible( false )
				for id,job in pairs( self._jobs ) do
					job.expanded = false
				end
				return true
			end
			if self._text_box:check_grab_scroll_bar( x, y ) then
				return true
			end
		elseif self:button_wheel_scroll_down( button ) then
			if self._text_box:mouse_wheel_down( x, y ) then
				return true
			end
		elseif self:button_wheel_scroll_up( button ) then
			if self._text_box:mouse_wheel_up( x, y ) then
				return true
			end
		end
	end
	]]
	
	if self:mouse_button_click( button ) then
		if( self._panel:child("back_button"):inside( x, y ) ) then
			managers.menu:back()
			return
		end
		if( self._panel:child("legends_button"):inside( x, y ) ) then
			self:toggle_legend()
			return
		end
		if self._panel:child("filter_button") and self._panel:child("filter_button"):inside( x, y ) then
			managers.menu_component:post_event( "menu_enter" )
			managers.menu:open_node( "crimenet_filters", {} )
			return
		end
		
		if self:check_job_pressed( x, y ) then
			return true
		end
		
		
		if self._panel:inside( x, y ) then
			self._released_map = nil
			-- self._grabbed_map = { x = x - self._pan_panel:x(), y = y - self._pan_panel:y() } 
			-- self._grabbed_map = { x = -self._panel:x() + x, y = -self._panel:y() + y }
			self._grabbed_map = { x = x, y = y, dirs = {} }
		end
		
	elseif self:button_wheel_scroll_down( button ) then
		if( self._one_scroll_out_delay ) then
			self._one_scroll_out_delay = nil
			-- return true		-- disabling for now
		end
		self:_set_zoom( "out", x, y )
		return true
	elseif self:button_wheel_scroll_up( button ) then
		if( self._one_scroll_in_delay ) then
			self._one_scroll_in_delay = nil
			-- return true		-- disabling for now
		end
		self:_set_zoom( "in", x, y )
		return true
	end
	
	return true
end

function CrimeNetGui:start_job()
	for id,job in pairs( self._jobs ) do
		if job.expanded then
			if job.preset_id then
				-- MenuCallbackHandler:start_job( job.job_id )
				MenuCallbackHandler:start_job( job )
				self:remove_job( job.preset_id )
				return true
			else
				print( "Is a server, don't want to join", id, job.side_panel:child("host_name"):text() == "WWWWWWWWWWWWµQQW" )
				-- if job.host_name:text() == "WWWWWWWWWWWWµQQW" or job.host_name:text() == "Gaspode" then
					managers.network.matchmake:join_server_with_check( id )
				-- end
				return
			end
		end
	end
end

function CrimeNetGui:mouse_released( o, button, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	if( not self:mouse_button_click( button ) ) then
		return
	end

	if self._grabbed_map and #self._grabbed_map.dirs > 0 then
		local dx, dy = 0, 0
		for _,values in ipairs( self._grabbed_map.dirs ) do
			dx = dx + values[1]
			dy = dy + values[2]
		end
		dx = dx/#self._grabbed_map.dirs
		dy = dy/#self._grabbed_map.dirs
				
		self._released_map = { t = 2, dx = dx, dy = dy }
		self._grabbed_map = nil
	end 
		
	-- return self._text_box:release_scroll_bar()
end

function CrimeNetGui:_get_pan_panel_border()
	return self._pan_panel_border * self._zoom
end

function CrimeNetGui:_set_map_position( mx, my )
	--[[
	local x = math.clamp( self._map_panel:x() + mx, self._fullscreen_panel:w() - self._map_panel:w(), 0 ) 
	local y = math.clamp( self._map_panel:y() + my, self._fullscreen_panel:h() - self._map_panel:h(), 0 )
	
	self._pan_panel:set_position( x, y )]]
	
	-- local x = self._map_panel:x() + mx
	-- local y = self._map_panel:y() + my
	
	local x = self._map_x + mx
	local y = self._map_y + my
	
	self._pan_panel:set_position( x, y )
	if self._pan_panel:left() > 0 then
		self._pan_panel:set_left( 0 )
	end
	
	if self._pan_panel:right() < self._fullscreen_panel:w() then
		self._pan_panel:set_right( self._fullscreen_panel:w() )
	end
	
	if self._pan_panel:top() > 0 then
		self._pan_panel:set_top( 0 )
	end
	
	if self._pan_panel:bottom() < self._fullscreen_panel:h() then
		self._pan_panel:set_bottom( self._fullscreen_panel:h() )
	end
	self._map_x, self._map_y = self._pan_panel:position()
	
	self._pan_panel:set_position( math.round(self._map_x), math.round(self._map_y) )
	x, y = self._map_x, self._map_y
	
	self._map_panel:set_shape( self._pan_panel:shape() )
	self._pan_panel:set_position( managers.gui_data:full_16_9_to_safe( x, y ) )
	
	
	local full_16_9 = managers.gui_data:full_16_9_size()
	
	local w_ratio = self._fullscreen_panel:w() / self._map_panel:w()
	local h_ratio = self._fullscreen_panel:h() / self._map_panel:h()
	local panel_x = -(self._map_panel:x() / self._fullscreen_panel:w()) * w_ratio
	local panel_y = -(self._map_panel:y() / self._fullscreen_panel:h()) * h_ratio
	
	
	local cross_indicator_h1 = self._fullscreen_panel:child( "cross_indicator_h1" )
	local cross_indicator_h2 = self._fullscreen_panel:child( "cross_indicator_h2" )
	local cross_indicator_v1 = self._fullscreen_panel:child( "cross_indicator_v1" )
	local cross_indicator_v2 = self._fullscreen_panel:child( "cross_indicator_v2" )
	
	local line_indicator_h1 = self._fullscreen_panel:child( "line_indicator_h1" )
	local line_indicator_h2 = self._fullscreen_panel:child( "line_indicator_h2" )
	local line_indicator_v1 = self._fullscreen_panel:child( "line_indicator_v1" )
	local line_indicator_v2 = self._fullscreen_panel:child( "line_indicator_v2" )
		
	cross_indicator_h1:set_y( full_16_9.convert_y + (self._panel:h() * panel_y) )
	cross_indicator_h2:set_bottom( self._fullscreen_panel:child( "cross_indicator_h1" ):y() + (self._panel:h() * h_ratio) )
	cross_indicator_v1:set_x( full_16_9.convert_x + (self._panel:w() * panel_x) )
	cross_indicator_v2:set_right( self._fullscreen_panel:child( "cross_indicator_v1" ):x() + (self._panel:w() * w_ratio) )
	
	line_indicator_h1:set_position( cross_indicator_v1:x(), cross_indicator_h1:y() )
	line_indicator_h2:set_position( cross_indicator_v1:x(), cross_indicator_h2:y() )
	line_indicator_v1:set_position( cross_indicator_v1:x(), cross_indicator_h1:y() )
	line_indicator_v2:set_position( cross_indicator_v2:x(), cross_indicator_h1:y() )
	
	line_indicator_h1:set_w( cross_indicator_v2:x() - cross_indicator_v1:x() )
	line_indicator_h2:set_w( cross_indicator_v2:x() - cross_indicator_v1:x() )
	line_indicator_v1:set_h( cross_indicator_h2:y() - cross_indicator_h1:y() )
	line_indicator_v2:set_h( cross_indicator_h2:y() - cross_indicator_h1:y() )
end

function CrimeNetGui:goto_lobby( lobby )
	print( lobby:id() )
	local job = self._jobs[ lobby:id() ]
	if job then
		local x = job.marker_panel:child("select_panel"):center_x() + job.marker_panel:w()/2
		local y = job.marker_panel:child("select_panel"):center_y() + job.marker_panel:h()-2
		job.focus:set_size( job.focus:texture_width(), job.focus:texture_height() )
		job.focus:set_color( job.focus:color():with_alpha( 1 ) )
		self:_goto_map_position( x, y )
	end
end

function CrimeNetGui:goto_bain()
	for _,job in pairs( self._jobs ) do
		
	end
end

function CrimeNetGui:_goto_map_position( x, y )
	local tw = math.max( self._map_panel:child("map"):texture_width(), 1 )
	local th = math.max( self._map_panel:child("map"):texture_height(), 1 )
	
	local mx = self._map_panel:x() + (x / tw * self._map_size_w * self._zoom) - self._fullscreen_panel:w()*0.5
	local my = self._map_panel:y() + (y / th * self._map_size_h * self._zoom) - self._fullscreen_panel:h()*0.5
	
	self:_set_map_position( -mx, -my )
end

function CrimeNetGui:_set_zoom( zoom, x, y )
	local w1, h1 = self._pan_panel:size()
		
		-- local wx1 = (-self._pan_panel:x() + (self._panel:w()/2)) / self._pan_panel:w()
		-- local wy1 = (-self._pan_panel:y() + (self._panel:h()/2)) / self._pan_panel:h()
	local wx1 = (-self._fullscreen_panel:x() - self._pan_panel:x() + x) / self._pan_panel:w()
	local wy1 = (-self._fullscreen_panel:y() - self._pan_panel:y() + y) / self._pan_panel:h()
	
	local prev_zoom = self._zoom
	if zoom == "in" then
		local new_zoom = math.clamp( self._zoom*1.1, self.MIN_ZOOM, self.MAX_ZOOM )
		if new_zoom ~= self._zoom then	
			managers.menu_component:post_event( "zoom_in" )
		end
		self._zoom = new_zoom
	else
		local new_zoom = math.clamp( self._zoom/1.1, self.MIN_ZOOM, self.MAX_ZOOM )
		if new_zoom ~= self._zoom then	
			managers.menu_component:post_event( "zoom_out" )
		end
		self._zoom = new_zoom
	end
	
	self._pan_panel_border = 25 / 4 * self._zoom
	
	if( prev_zoom == self._zoom ) then
		if( zoom == "in" ) then
			self._one_scroll_out_delay = true
		else
			self._one_scroll_in_delay = true
		end
	end
	
	local cx, cy = self._pan_panel:center()
	self._pan_panel:set_size( self._map_size_w * self._zoom, self._map_size_h * self._zoom )
	self._pan_panel:set_center( cx, cy )
	
	-- self._map2:set_size( self._pan_panel:size() )
	-- self._map3:set_size( self._pan_panel:size() )
	-- self._pan_grid:set_size( self._pan_panel:size() )
	-- self._pan_cross:set_size( self._pan_panel:size() )
	
	-- self._map2:set_size( self._pan_panel:size() )
		
	local w2, h2 = self._pan_panel:size()
	self:_set_map_position( (w1 - w2) * wx1, (h1 - h2) * wy1 )
	
	
	for id,job in pairs( self._jobs ) do
		job.marker_panel:set_center( job.job_x * self._zoom, job.job_y * self._zoom )
		job.glow_panel:set_world_center( job.marker_panel:child("select_panel"):world_center() )
		
		job.focus:set_center( job.marker_panel:center() )
		
		-- job.job_name:set_left( job.marker_panel:right() )
		-- job.job_name:set_center_y( job.marker_panel:top() + 29 )
		
		-- job.host_name:set_left( job.job_name:left() )
		-- job.host_name:set_bottom( job.job_name:top() )
		
		-- job.info_text:set_left( job.job_name:left() )
		-- job.info_text:set_center_y( job.job_name:center_y() )
		
		-- job.stars_panel:set_left( job.job_name:left() )
		-- job.stars_panel:set_top( job.job_name:bottom() )
	
		if job.text_on_right then
			job.side_panel:set_left( job.marker_panel:right() )
		else
			job.side_panel:set_right( job.marker_panel:left() )
		end
		job.side_panel:set_center_y( job.marker_panel:top() + 11 )
		-- job.side_panel:set_world_position( math.round(job.side_panel:world_x()), math.round(job.side_panel:world_y()) )
		
		-- job.side_panel:set_left( job.marker_panel:right() )
		-- job.side_panel:set_center_y( job.marker_panel:top() + 11 )
		
		if( job.peers_panel ) then
			job.peers_panel:set_center_x( job.marker_panel:center_x() )
			job.peers_panel:set_center_y( job.marker_panel:center_y() )
		end
	end
	
	for _, region_location in ipairs( self._region_locations ) do
		region_location.object:set_font_size( self._zoom * region_location.size )
	end
	
	--[[
	for id,job in pairs( self._jobs ) do
		-- job.marker_panel:set_size( 32 * self._zoom, 32 * self._zoom )
		-- job.marker_panel:set_size( 32, 32 )
		-- job.stars_panel:set_size( 17 * #job.stars_panel:children(), 17 )
		-- job.stars_panel:set_y( job.marker_panel:center_y() + 20 )
		-- job.stars_panel:set_center_x( job.marker_panel:center_x() )
		
		local _,_,w,h = job.host_name:text_rect()
		job.host_name:set_size( w,h )
		job.host_name:set_x( job.marker_panel:center_x() + 20 )
		job.host_name:set_center_y( job.marker_panel:center_y() )
		if job.host_name:right() > self._pan_panel:w() then
		 	job.host_name:set_right( job.marker_panel:center_x() - 20 )
		end
		
		job.focus:set_center( job.marker_panel:center() )
		
		-- print( job.marker_panel:size() )
	end]]
	--[[
	]]
end

function CrimeNetGui:update_job_gui( job, inside )
	if job.mouse_over ~= inside then
		job.mouse_over = inside
		
		local animate_alpha = function( o, objects, job, alphas, inside )
			local wanted_alpha = alphas[1]
			local wanted_text_alpha = alphas[2]
			
			local start_h = job.side_panel:h()
			local h = start_h
			
			local host_name = job.side_panel:child("host_name")
			local job_name = job.side_panel:child("job_name")
			local contact_name = job.side_panel:child("contact_name")
			local info_name = job.side_panel:child("info_name")
			local stars_panel = job.side_panel:child("stars_panel")
			
			-- job_name:set_blend_mode( "add" )
			-- contact_name:set_blend_mode( "add" )
			-- info_name:set_blend_mode( "add" )
							
			local base_h = math.round( host_name:h() + job_name:h() + stars_panel:h() )
			local expand_h = math.round( base_h + info_name:h() )
			
			local start_x = 0
			local max_x = math.round( math.max( contact_name:w(), info_name:w() ) )
			if job.text_on_right then
				-- start_x = math.round( job_name:left() )
				start_x = math.round( math.min( contact_name:right(), info_name:right() ) )
			else
				start_x = math.round( job.side_panel:w() - math.min( contact_name:left(), info_name:left() ) )
			end
			local x = start_x
			
			-- local object_start_alpha = {}
			local object_alpha = {}
			local text_alpha = job.side_panel:alpha()
			
			local alpha_met = false
			local glow_met = false
			local expand_met = false
			local pushout_met = ((x == 0)) -- (x == max_x) or 
			local dt
			
			while( not alpha_met or not glow_met or not expand_met or not pushout_met ) do
				dt = coroutine.yield()
				
				if not alpha_met then
					alpha_met = true
					for i, object in ipairs( objects ) do
						if( object and alive( object ) ) then
							object_alpha[i] = object_alpha[i] or object:alpha()
							object_alpha[i] = math.step( object_alpha[i], wanted_alpha, dt )
							
							object:set_alpha( object_alpha[i] )
							
							alpha_met = alpha_met and (object_alpha[i] == wanted_alpha)
						end
					end
					text_alpha = math.step( text_alpha, wanted_text_alpha, dt*2 )
					job.side_panel:set_alpha( text_alpha )
					alpha_met = alpha_met and (text_alpha == wanted_text_alpha)
					
					if alpha_met and inside then
					end
				end
				
				if not glow_met then
					job.glow_panel:set_alpha( math.step( job.glow_panel:alpha(), inside and 0.2 or 0, dt * 5 ) )
					glow_met = job.glow_panel:alpha() == (inside and 0.2 or 0)
					
					if glow_met and inside then
						local animate_pulse = function( o )
							while true do
								over( 1, function( p ) o:set_alpha( math.sin( p * 180 ) * 0.4 + 0.2 ) end )
							end
						end
						
						job.glow_panel:animate( animate_pulse )
					end
				end
				
				if not expand_met and pushout_met then
					h = math.step( h, inside and expand_h or base_h, (inside and expand_h or base_h) * dt * 4 )
					
					job.side_panel:set_h( h )
					job.side_panel:set_center_y( o:top() + 11 )
					job.side_panel:set_world_position( math.round(job.side_panel:world_x()), math.round(job.side_panel:world_y()) )
					stars_panel:set_bottom( job.side_panel:h() )
					
					expand_met = h == (inside and expand_h or base_h)
					
					if expand_met then
						pushout_met = x == (inside and max_x or 0)
					end
				end
				
				if not pushout_met then
					x = math.step( x, inside and max_x or 0, max_x * dt * 4 )
					
					if job.text_on_right then
						job_name:set_left( math.round( math.min( x, contact_name:w() ) ) )
						contact_name:set_left( math.round( math.min( x - contact_name:w(), 0 ) ) )
						info_name:set_left( math.round( math.min( x - info_name:w(), 0 ) ) )
					else
						job_name:set_right( math.round( job.side_panel:w() - math.min( x, contact_name:w() ) ) )
						contact_name:set_right( math.round( job.side_panel:w() - math.min( x - contact_name:w(), 0 ) ) )
						info_name:set_right( math.round( job.side_panel:w() - math.min( x - info_name:w(), 0 ) ) )
					end
					pushout_met = x == (inside and max_x or 0)
				end
			end
			
			if inside and job.callout and self._crimenet_enabled then
				Application:debug( job.callout )
				managers.menu_component:post_event( job.callout, true )
			end
						--[[
			over( 0.4, function( p )
				local a_lerp = 0
				for i, object in ipairs( objects ) do
					if( object and alive( object ) ) then
						object_start_alpha[i] = object_start_alpha[i] or object:alpha()
						a_lerp = math.lerp( object_start_alpha[i], wanted_alpha, p )
						object:set_alpha( a_lerp )
					end
				end
				
				local host_name = side_panel:child("host_name")
				local job_name = side_panel:child("job_name")
				local contact_name = side_panel:child("contact_name")
				local info_name = side_panel:child("info_name")
				local stars_panel = side_panel:child("stars_panel")
				
				local base_h = host_name:h() + job_name:h() + stars_panel:h()
				local expand_h = base_h + info_name:h()
				
				if side_panel:h() == expand_h then
					info_name:set_x( math.lerp( math.min( p*2, 1 ) ) )
				end
				
				side_panel:set_h( math.lerp( start_h, inside and expand_h or base_h, math.min( p*2, 1 ) ) )
				side_panel:set_center_y( o:top() + 11 )
				stars_panel:set_bottom( side_panel:h() )
				
				if side_panel:h() == base_h then
					
				end
				
			end )]]
			
		end
		
		local text_alpha = ( inside == 1 and 1 ) or ( inside == 2 and 0.0 ) or 1 -- (self._zoom > 1.5 and 1 or 0)
		local object_alpha = ( inside == 1 and 1 ) or ( inside == 2 and 0.3 ) or 1
		local alphas = { object_alpha, text_alpha }
		
		local objects = { job.marker_panel, job.peers_panel }
		-- local inverted_objects = {}
		
		--[[
		if inside == 1 then
			table.insert( objects, job.info_text )
			table.insert( inverted_objects, job.job_name )
			table.insert( inverted_objects, job.host_name )
		else
			table.insert( objects, job.job_name )
			table.insert( objects, job.host_name )
			table.insert( inverted_objects, job.info_text )
		end]]
		
		job.glow_panel:stop()
		if inside == 1 then
			managers.menu_component:post_event( "highlight" )
			
			job.side_panel:child("job_name"):set_blend_mode( "normal" )
			job.side_panel:child("contact_name"):set_blend_mode( "normal" )
			job.side_panel:child("info_name"):set_blend_mode( "normal" )
		else
			job.side_panel:child("job_name"):set_blend_mode( "add" )
			job.side_panel:child("contact_name"):set_blend_mode( "add" )
			job.side_panel:child("info_name"):set_blend_mode( "add" )
		end
		
		job.marker_panel:stop()
		if job.peers_panel then
			job.peers_panel:set_layer( inside == 1 and 20 or job.layer )
		end
		job.marker_panel:set_layer( inside == 1 and 20 or job.layer )
		job.glow_panel:set_layer( job.marker_panel:layer()-1 )
		
		
		job.marker_panel:animate( animate_alpha, objects, job, alphas, inside == 1 )
	end
end

function CrimeNetGui:mouse_moved( o, x, y )
	if( not self._crimenet_enabled ) then
		return
	end
	-- self._pan_panel:child( "test" ):set_position( -self._panel:x() - self._pan_panel:x() + x, -self._panel:y() - self._pan_panel:y() + y )
	
	if managers.menu:is_pc_controller() then
		if( self._panel:child("back_button"):inside( x, y ) ) then
			if not self._back_highlighted then
				self._back_highlighted = true
				self._panel:child("back_button"):set_color( tweak_data.screen_colors.button_stage_2 )
				managers.menu_component:post_event( "highlight" )
			end
			return false, "arrow"
		elseif self._back_highlighted then
			self._back_highlighted = false
			self._panel:child("back_button"):set_color( tweak_data.screen_colors.button_stage_3 )
		end
		
		if( self._panel:child("legends_button"):inside( x, y ) ) then
			if not self._legend_highlighted then
				self._legend_highlighted = true
				self._panel:child("legends_button"):set_color( tweak_data.screen_colors.button_stage_2 )
				managers.menu_component:post_event( "highlight" )
			end
			return false, "arrow"
		elseif self._legend_highlighted then
			self._legend_highlighted = false
			self._panel:child("legends_button"):set_color( tweak_data.screen_colors.button_stage_3 )
		end
		
		if self._panel:child("filter_button") then
			if self._panel:child("filter_button"):inside( x, y ) then
				if not self._filter_highlighted then
					self._filter_highlighted = true
					self._panel:child("filter_button"):set_color( tweak_data.screen_colors.button_stage_2 )
					managers.menu_component:post_event( "highlight" )
				end
				return false, "arrow"
			elseif self._filter_highlighted then
				self._filter_highlighted = false
				self._panel:child("filter_button"):set_color( tweak_data.screen_colors.button_stage_3 )
			end
		end
	end
	
	if self._grabbed_map then
		local left = x > self._grabbed_map.x
		local right = not left
		local up = y > self._grabbed_map.y
		local down = not up
		local mx = x - self._grabbed_map.x
		local my = y - self._grabbed_map.y
		
		if left and self._map_panel:x() > -self:_get_pan_panel_border() then
			mx = math.lerp( mx, 0, 1 - self._map_panel:x()/-self:_get_pan_panel_border() )
		end
		if right and self._fullscreen_panel:w() - self._map_panel:right() > -self:_get_pan_panel_border() then
			mx = math.lerp( mx, 0, 1 - (self._fullscreen_panel:w() - self._map_panel:right())/-self:_get_pan_panel_border() )
		end
		if up and self._map_panel:y() > -self:_get_pan_panel_border() then
			my = math.lerp( my, 0, 1 - self._map_panel:y()/-self:_get_pan_panel_border() )
		end
		if down and self._fullscreen_panel:h() - self._map_panel:bottom() > -self:_get_pan_panel_border() then
			my = math.lerp( my, 0, 1 - (self._fullscreen_panel:h() - self._map_panel:bottom())/-self:_get_pan_panel_border() )
		end
		
		table.insert( self._grabbed_map.dirs, 1, { mx, my } )
		self._grabbed_map.dirs[ 10 ] = nil
		
		self:_set_map_position( mx, my )
				
		self._grabbed_map.x = x
		self._grabbed_map.y = y
		return true, "grab"
	end
	
	-- if self._text_box:moved_scroll_bar( x, y ) then
	-- 	return true
	-- end
	
	-- for i,panel in ipairs( self._text_box._text_box_buttons_panel:children() ) do
	-- 	if panel.child and panel:inside( x, y ) then -- CHILD CHECK IS BAD
	-- 		self._text_box:set_focus_button( i )
	-- 	end
	-- end
	
	--[[if not self._panel:inside( x, y ) then
		return
	end]]
	local closest_job = nil
	local closest_dist = 100000000
	local closest_job_x, closest_job_y = 0, 0
	
	local job_x, job_y
	local dist = 0
	
	local inside_any_job = false
	local math_x, math_y
	
	for id, job in pairs( self._jobs ) do
		local inside = (job.marker_panel:child("select_panel"):inside( x, y ) and self._panel:inside( x, y ))
		inside_any_job = inside_any_job or inside
		
		if( inside ) then
			job_x, job_y = job.marker_panel:child("select_panel"):world_center()
		
			math_x = job_x - x
			math_y = job_y - y
			
			dist = math_x * math_x + math_y * math_y
			
			if( dist < closest_dist ) then
				closest_job = job
				closest_dist = dist
				
				closest_job_x = job_x
				closest_job_y = job_y
			end
		end
	end
	
	for id,job in pairs( self._jobs ) do
		local inside = ((job == closest_job) and 1) or (inside_any_job and 2) or 3
		
		self:update_job_gui( job, inside )
	end
	-- local inside_any_job = self:check_job_mouse_over( x, y )
	
	--[[
	local inside_any_job = false
	for id,job in pairs( self._jobs ) do
		local inside = (job.marker_panel:inside( x, y ) and self._panel:inside( x, y ))
		inside_any_job = inside_any_job or inside
		if job.mouse_over ~= inside then
			job.mouse_over = inside
			job.marker_panel:set_alpha(job.mouse_over and 1 or 0.8 )
			job.stars_panel:set_alpha( job.mouse_over and 1 or 0.8 )
			
			if( job.peers_panel ) then
				job.peers_panel:set_alpha( job.mouse_over and 1 or 0.8 )
			end
			
			local animate_show = function( o )
				local start_alpha = o:alpha()
				
				over( 0.3 * (1-start_alpha), function(p) o:set_alpha( math.lerp( start_alpha, 1, p ) ) end )
			end
			local animate_hide = function( o )
				local start_alpha = o:alpha()
				
				over( 0.3 * (start_alpha), function(p) o:set_alpha( math.lerp( start_alpha, 0, p ) ) end )
			end
			job.host_name:stop()
			job.info_text:stop()
			job.host_name:animate( job.mouse_over and animate_hide or animate_show )
			job.info_text:animate( job.mouse_over and animate_show or animate_hide )
			
			
			-- job.marker_rect:set_color( job.marker_rect:color():with_alpha( job.mouse_over and 0.9 or 0.5 ) )
			-- job.host_name:set_visible( job.mouse_over )
			-- job.stars_panel:set_visible( job.mouse_over  )
			-- job.info_panel:set_visible( job.mouse_over )
		end
		if job.expanded then
			-- if job.mouse_over_info ~= job.info_panel:inside( x, y ) then
				-- job.mouse_over_info = job.info_panel:inside( x, y )
				-- job.info_rect:set_color( Color.blue:with_alpha( job.mouse_over_info and 0.9 or 0.5 ) )
					-- job.info_panel:set_visible( job.mouse_over )
			-- end
		end
	end
	]]
	-- print( "CrimeNetGui:mouse_moved" )
	
	if not managers.menu:is_pc_controller() then		
		local to_left 	= x
		local to_right 	= self._panel:w() - x - 19
		local to_top 		= y
		local to_bottom	= self._panel:h() - y - 23
		
		local panel_border = self._pan_panel_border
		to_left 	= 1 - math.clamp( to_left   / panel_border, 0, 1 )
		to_right 	= 1 - math.clamp( to_right  / panel_border, 0, 1 )
		to_top 		= 1 - math.clamp( to_top    / panel_border, 0, 1 )
		to_bottom	= 1 - math.clamp( to_bottom / panel_border, 0, 1 )
		
		-- print( "to_left", to_left, "to_right", to_right, "to_top", to_top, "to_bottom", to_bottom )
		-- print( managers.mouse_pointer:mouse_move_x(), managers.mouse_pointer:mouse_move_y() )
		
		local mouse_pointer_move_x = managers.mouse_pointer:mouse_move_x()
		local mouse_pointer_move_y = managers.mouse_pointer:mouse_move_y()
		
		local mp_left 	= -math.min( 0, mouse_pointer_move_x )
		local mp_right 	= -math.max( 0, mouse_pointer_move_x )
		local mp_top 		= -math.min( 0, mouse_pointer_move_y )
		local mp_bottom = -math.max( 0, mouse_pointer_move_y )
		
		local push_x = mp_left * to_left + mp_right * to_right
		local push_y = mp_top * to_top + mp_bottom * to_bottom
		
		if( push_x ~= 0 or push_y ~= 0 ) then
			self:_set_map_position( push_x, push_y )
		end
		
		--[[
		if self._panel:world_left() - x > -self._pan_panel_border then
			local mx = math.lerp( 0, 1 - (x - self._panel:world_left()) / self._pan_panel_border, speed )
			self:_set_map_position( mx, 0 )
		end
		if self._panel:world_right() - x < self._pan_panel_border then
			local mx = math.lerp( 0, 1 - (self._panel:world_right() - x) / self._pan_panel_border, speed )
			self:_set_map_position( -mx, 0 )
		end
		if self._panel:world_top() - y > -self._pan_panel_border then
			local my = math.lerp( 0, 1 - (y - self._panel:world_top()) / self._pan_panel_border, speed )
			self:_set_map_position( 0, my )
		end
		if self._panel:world_bottom() - y < self._pan_panel_border then
			local my = math.lerp( 0, 1 - (self._panel:world_bottom() - y) / self._pan_panel_border, speed )
			self:_set_map_position( 0, -my )
		end]]
		
	end
	
	if inside_any_job then
		return false, "arrow"
	end
	
	if self._panel:inside( x, y ) then		
		return false, "hand"
	end
end

function CrimeNetGui:ps3_invites_callback()
	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		return true
	end
	MenuCallbackHandler:view_invites()
end
	
function CrimeNetGui:enable_crimenet()
	self._crimenet_enabled = true
	managers.crimenet:activate()
	
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled( true )
	end
	-- managers.menu:active_menu().renderer.ws:hide()
end

function CrimeNetGui:disable_crimenet()
	self._crimenet_enabled = false
	managers.crimenet:deactivate()
	
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled( false )
	end
	-- managers.menu:active_menu().renderer.ws:show()
end


function CrimeNetGui:close()
	-- print( "CrimeNetGui:close()" )
	managers.crimenet:stop()
	
	if self._crimenet_ambience then
		self._crimenet_ambience:stop()
		self._crimenet_ambience = nil
	end
	managers.menu_component:stop_event()
	managers.menu:active_menu().renderer.ws:show()
	self._ws:panel():remove( self._panel )
	self._fullscreen_ws:panel():remove( self._fullscreen_panel )
	
	Overlay:gui():destroy_workspace( self._blackborder_workspace )
	self._blackborder_workspace = nil
	
	if managers.controller:get_default_wrapper_type() ~= "pc" then
		managers.menu:active_menu().input:deactivate_controller_mouse()
		managers.mouse_pointer:release_mouse_pointer()
	end
	
	if self._ps3_invites_controller then
		self._ps3_invites_controller:set_enabled( false )
		self._ps3_invites_controller:destroy()
		self._ps3_invites_controller = nil
	end
end
