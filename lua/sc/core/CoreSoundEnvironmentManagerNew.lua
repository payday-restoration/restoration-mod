-- if something something, later!

-- Handles objects that are used to check what kind of sound environment and ambiences should
-- be used in certain locations.

-- Object or listeners can be added using the add_check_object and add_listener function
-- They both take tables as data. The table should contain
-- listener or object, depending on how you want to add it
-- active, true or false, if it should be active at creation
-- primary, true or false, if this is the one to use when changing environment

-- Set if am object should be active or not by calling set_check_object_active with
-- id as first param and active boolean as second

-- Remove an object by calling remove_check_object with the returned id as param

core:import('CoreShapeManager')

CoreSoundEnvironmentManager = CoreSoundEnvironmentManager or class()
	
function CoreSoundEnvironmentManager:init()	
	self._areas = {}
	self._areas_per_frame = 1
	self._check_objects = {}
	self._check_object_id = 0
	
	self._emitters = {}
	self._area_emitters = {}
	
	self._ambience_changed_callback = {}
	self._ambience_changed_callbacks = {}
	self._environment_changed_callback = {}
		
	self.GAME_DEFAULT_ENVIRONMENT = "padded_cell"
	self._default_environment = self.GAME_DEFAULT_ENVIRONMENT
	self._current_environment = self.GAME_DEFAULT_ENVIRONMENT
	self:_set_environment( self.GAME_DEFAULT_ENVIRONMENT )
	
	local in_editor = Application:editor()
	if in_editor then
		self._environments					= self:_environment_effects()
		self.GAME_DEFAULT_ENVIRONMENT 		= self._environments[ 1 ] or nil
		self._default_environment			= self.GAME_DEFAULT_ENVIRONMENT
		self._current_environment 			= self.GAME_DEFAULT_ENVIRONMENT
		self:_set_environment( self.GAME_DEFAULT_ENVIRONMENT )
	else
		self:_set_environment( self.GAME_DEFAULT_ENVIRONMENT )
	end
	
	-- self._environments					= self:_environments()
	
	if in_editor then
		self:_find_emitter_events()
		self:_find_ambience_events()
		self:_find_scene_events()
		self:_find_occasional_events()
		
		self.GAME_DEFAULT_EMITTER_PATH 		= self._emitter.paths[ 1 ]
		self.GAME_DEFAULT_AMBIENCE 			= self._ambience.events[ 1 ]
		self._default_ambience 				= self.GAME_DEFAULT_AMBIENCE
		self.GAME_DEFAULT_OCCASIONAL		= self._occasional.events[ 1 ]
		self._default_occasional			= self.GAME_DEFAULT_OCCASIONAL
		self.GAME_DEFAULT_SCENE_PATH 		= self._scene.paths[ 1 ]
	end
	
	
		
	self._ambience_enabled = false
	self._occasional_blocked_by_platform = SystemInfo:platform() == Idstring( "X360" )
	self._ambience_sources_count = SystemInfo:platform() == Idstring( "X360" ) and 1 or 4
	
	self.POSITION_OFFSET = 50 -- This is used to move the sampling camera position into the view.
	
	self._active_ambience_soundbanks = {}
	self._occasional_sound_source = SoundDevice:create_source( "occasional" )
end

function CoreSoundEnvironmentManager:_find_emitter_events()
	self._emitter = { events = {}, paths = {}, soundbanks = {} }
	for _,soundbank in ipairs( SoundDevice:sound_banks() ) do
		for event,data in pairs( SoundDevice:events( soundbank ) ) do
			if string.match( event, "emitter" ) then
				if not table.contains( self._emitter.paths, data.path ) then
					table.insert( self._emitter.paths, data.path )
				end
				self._emitter.events[ data.path ] = self._emitter.events[ data.path ] or {}
				table.insert( self._emitter.events[ data.path ], event )
				self._emitter.soundbanks[ event ] = soundbank
			end
		end
	end
	table.sort( self._emitter.paths )
end

function CoreSoundEnvironmentManager:_find_ambience_events()
	self._ambience = { events = {}, soundbanks = {} }
	for _,soundbank in ipairs( SoundDevice:sound_banks() ) do
		for event,data in pairs( SoundDevice:events( soundbank ) ) do
			if string.match( event, "ambience" ) then
				table.insert( self._ambience.events, event )
				self._ambience.soundbanks[ event ] = soundbank
			end
		end
	end
	table.sort( self._ambience.events )
end

function CoreSoundEnvironmentManager:_find_scene_events()
	self._scene = { events = {}, paths = {}, soundbanks = {} }
	for _,soundbank in ipairs( SoundDevice:sound_banks() ) do
		for event,data in pairs( SoundDevice:events( soundbank ) ) do
			-- if string.match( event, "emitter" ) then
				if not table.contains( self._scene.paths, data.path ) then
					table.insert( self._scene.paths, data.path )
				end
				self._scene.events[ data.path ] = self._scene.events[ data.path ] or {}
				table.insert( self._scene.events[ data.path ], event )
				self._scene.soundbanks[ event ] = soundbank
			-- end
		end
	end
	table.sort( self._scene.paths )
end

function CoreSoundEnvironmentManager:_find_occasional_events()
	self._occasional = { events = {}, soundbanks = {} }
	for _,soundbank in ipairs( SoundDevice:sound_banks() ) do
		for event,data in pairs( SoundDevice:events( soundbank ) ) do
			if string.match( event, "occasional" ) then
				table.insert( self._occasional.events, event )
				self._occasional.soundbanks[ event ] = soundbank
			end
		end
	end
	table.sort( self._occasional.events )
end

function CoreSoundEnvironmentManager:areas()
	return self._areas
end

function CoreSoundEnvironmentManager:game_default_ambience()
	return self.GAME_DEFAULT_AMBIENCE
end

function CoreSoundEnvironmentManager:game_default_occasional()
	return self.GAME_DEFAULT_OCCASIONAL
end

-- Returns the game default emitter path (category)
function CoreSoundEnvironmentManager:game_default_emitter_path()
	return self.GAME_DEFAULT_EMITTER_PATH
end

-- Returns the ipairs table with all paths (categories)
function CoreSoundEnvironmentManager:emitter_paths()
	return self._emitter.paths
end

-- Return all events belonging to a path (category)
function CoreSoundEnvironmentManager:emitter_events( path )
	return path and self._emitter.events[ path ] or self._emitter.events
end

-- Returns the soundbank for an event
function CoreSoundEnvironmentManager:emitter_soundbank( event )
	if not self._emitter then
		return
	end
	return self._emitter.soundbanks[ event ]
end

-- Returns the table with all emitters and which soundbanks the belong to
function CoreSoundEnvironmentManager:emitter_soundbanks()
	if not self._emitter then
		return
	end
	return self._emitter.soundbanks
end

-- Returns the ambience events table
function CoreSoundEnvironmentManager:ambience_events()
	return self._ambience.events
end

-- Returns the soundbank for an ambience event
function CoreSoundEnvironmentManager:ambience_soundbank( event )
	if not self._ambience then
		return
	end
	return self._ambience.soundbanks[ event ]
end

-- Returns the ambience events soundbanks table
function CoreSoundEnvironmentManager:ambience_soundbanks()
	if not self._ambience then
		return
	end
	return self._ambience.soundbanks
end

-- Returns the occasional events table
function CoreSoundEnvironmentManager:occasional_events()
	if not self._occasional then
		return
	end
	return self._occasional.events
end

-- Returns the soundbank for an occasional event
function CoreSoundEnvironmentManager:occasional_soundbank( event )
	if not self._occasional then
		return
	end
	return self._occasional.soundbanks[ event ]
end

-- Returns the occasional events soundbanks table
function CoreSoundEnvironmentManager:occasional_soundbanks()
	if not self._occasional then
		return
	end
	return self._occasional.soundbanks
end

-- Returns the game default scene path (category)
function CoreSoundEnvironmentManager:game_default_scene_path()
	return self.GAME_DEFAULT_SCENE_PATH
end

-- Returns the ipairs table with all paths (categories)
function CoreSoundEnvironmentManager:scene_paths()
	return self._scene.paths
end

-- Return all events belonging to a path (category)
function CoreSoundEnvironmentManager:scene_events( path )
	return path and self._scene.events[ path ] or self._scene.events
end

-- Returns the soundbank for an event
function CoreSoundEnvironmentManager:scene_soundbank( event )
	return self._scene.soundbanks[ event ]
end

-- Returns the table with all scenes and which soundbanks the belong to
function CoreSoundEnvironmentManager:scene_soundbanks()
	return self._scene.soundbanks
end

-- Returns the path a scene event belong to
function CoreSoundEnvironmentManager:scene_path( event )
	for path,events in pairs( self._scene.events ) do
		if table.contains( events, event ) then
			return path
		end
	end
end

-- Returns the emitters table
function CoreSoundEnvironmentManager:emitters()
	return self._emitters
end

-- Returns the area emitters table
function CoreSoundEnvironmentManager:area_emitters()
	return self._area_emitters
end

-- Creates and returns a sorted table with all availible environments
function CoreSoundEnvironmentManager:_environment_effects()
	local effects = {}
	for name,_ in pairs( SoundDevice:effects() ) do 
		table.insert( effects, name )
	end
	table.sort( effects )
	return effects
end

-- Returns the sorted environments table
function CoreSoundEnvironmentManager:environments()
	return self._environments
end

function CoreSoundEnvironmentManager:game_default_environment()
	return self.GAME_DEFAULT_ENVIRONMENT
end

function CoreSoundEnvironmentManager:default_environment()
	return self._default_environment 
end

function CoreSoundEnvironmentManager:set_default_environment( environment )
	self._default_environment = environment
	self:_set_environment( self._default_environment )
	self:_change_acoustic( self._default_environment )
end

function CoreSoundEnvironmentManager:_set_environment( environment )
	for _,func in ipairs( self._environment_changed_callback ) do
		func( environment )
	end
	self._current_environment = environment
	SoundDevice:set_default_environment( { effect = environment, gain = 1 } )
	-- Sound:blend_environment( Idstring(environment), 1.0 )
end

function CoreSoundEnvironmentManager:current_environment()
	return self._current_environment
end

function CoreSoundEnvironmentManager:set_default_ambience( ambience_event )
	if not ambience_event then
		return
	end

	self._default_ambience = ambience_event
	if Application:editor() then
		self:add_soundbank( self:ambience_soundbank( self._default_ambience ) )
	end
	for id,data in pairs( self._check_objects ) do
		self:_change_ambience( data )
	end
end

function CoreSoundEnvironmentManager:default_ambience()
	return self._default_ambience
end

function CoreSoundEnvironmentManager:set_default_occasional( occasional_event )
	if not occasional_event then
		return
	end
	
	if occasional_event and Application:editor() and not table.contains( managers.sound_environment:occasional_events(), occasional_event ) then
		if managers.editor then
			managers.editor:output_error( "Default occasional event "..occasional_event.." no longer exits. Falls back on default." )
		end
		occasional_event = managers.sound_environment:game_default_occasional()
	end

	self._default_occasional = occasional_event
	if Application:editor() then
		self:add_soundbank( self:occasional_soundbank( self._default_occasional ) )
	end
end

function CoreSoundEnvironmentManager:default_occasional()
	return self._default_occasional
end

function CoreSoundEnvironmentManager:add_soundbank( soundbank )
	if not soundbank then
		Application:error( 'Cant load nil soundbank')
		return
	end

	if Application:editor() then
		CoreEngineAccess._editor_load( ( "bnk" ):id(), soundbank:id() )
	end
end

-- Sets all data back to default, used by editor when creating a new level for example
function CoreSoundEnvironmentManager:set_to_default()
	self:set_default_environment( self.GAME_DEFAULT_ENVIRONMENT )
	self:set_default_ambience( self.GAME_DEFAULT_AMBIENCE )
	self:set_default_occasional( self.GAME_DEFAULT_OCCASIONAL )
	self:set_ambience_enabled( false )
end

function CoreSoundEnvironmentManager:add_area( area_params )
	local area = SoundEnvironmentArea:new( area_params )
	table.insert( self._areas, area )
	return area
end

function CoreSoundEnvironmentManager:remove_area( area )
	area:remove()
	for _,data in pairs( self._check_objects ) do
		if area == data.area then
			data.area = nil
			self:_change_ambience( data )
		end
		data.sound_area_counter = 1
	end
	table.delete( self._areas, area )
end

function CoreSoundEnvironmentManager:add_emitter( emitter_params )
	local emitter = SoundEnvironmentEmitter:new( emitter_params )
	table.insert( self._emitters, emitter )
	return emitter
end

function CoreSoundEnvironmentManager:remove_emitter( emitter )
	emitter:destroy()
	table.delete( self._emitters, emitter )
end

function CoreSoundEnvironmentManager:add_area_emitter( emitter_params )
	local emitter = SoundEnvironmentAreaEmitter:new( emitter_params )
	table.insert( self._area_emitters, emitter )
	return emitter
end

function CoreSoundEnvironmentManager:remove_area_emitter( emitter )
	emitter:destroy()
	table.delete( self._area_emitters, emitter )
end

-- Adds a listener as check object
-- data = { listener = number, active = boolean, primary = boolean }
-- Returns the check object id
function CoreSoundEnvironmentManager:add_listener( data )
	Application:throw_exception( "add_listener function is no longer working because of new sound implementation. Use add_check_object instead.")
	local distance, orientation, occlusion = Sound:listener( data.listener )
	data.object = distance
	return self:add_check_object( data )
end

-- Adds an object as check object
-- data = { object = Object3D, active = boolean, primary = boolean }
-- Returns the check object id
function CoreSoundEnvironmentManager:add_check_object( data )
	if not data.object then
		Application:error( 'Must use an Object3D when adding check objects to sound environment manager.' )
		return nil
	end
	self:_disable_fallback()

	self._check_object_id = self._check_object_id + 1
	local soundsource = SoundDevice:create_source( "ambience_source" )
	soundsource:enable_env( false )
	local surround = {}
	for i = 1, self._ambience_sources_count do
		local source = SoundDevice:create_source( "ambience_surround_"..i )
		source:enable_env( false )
		local distance = 15000
		local x = (i == 1  or i == 4) and -distance or distance
		local y = (i == 1  or i == 2) and distance or -distance
		local offset = Vector3( x, y, 0 )
		source:set_position( data.object:position() + offset )
		table.insert( surround, { source = source, offset = offset } )
	end
	
	local t = { object 				= data.object, 
				area 				= nil, 
				soundsource 		= soundsource, 
				surround 			= surround, 
				surround_iterator 	= surround and 0 or nil, 
				active 				= data.active, 
				listener 			= data.listener, 
				primary 			= data.primary, 
				id 					= self._check_object_id,
				next_occasional		= self:_next_occasional(), 
				sound_area_counter 	= 1 }
	self:_change_ambience( t )
	self._check_objects[ self._check_object_id ] = t
	return self._check_object_id
end

-- Removes a check object, using the returned id from creation
function CoreSoundEnvironmentManager:remove_check_object( id )
	local remove_object = self._check_objects[ id ]
	remove_object.soundsource:stop()
	if remove_object.surround then
		for _,surround_data in ipairs( remove_object.surround ) do
			surround_data.source:stop()
		end
	end
	self._check_objects[ id ] = nil
	self:_enable_fallback()
end

-- Sets the active state of a check object, using the returned id from creation and boolean
function CoreSoundEnvironmentManager:set_check_object_active( id, active )
	local object = self._check_objects[ id ]
	if object.active == active then
		return
	end
	
	object.active = active
	if not active then
		object.soundsource:stop()
		if object.surround then
			for _,surround_data in ipairs( object.surround ) do
				surround_data.source:stop()
			end
		end
	else
		self:_check_inside( object )
		if not object.area then
			--[[if object.primary then
				self:_set_environment( self._default_environment )
			end]]
			self:_change_ambience( object, 1 )
		end
	end
end

function CoreSoundEnvironmentManager:obj_alive( id )
	local data = self._check_objects[ id ]
	return data and alive(data.object)
end

-- Returns a check object
function CoreSoundEnvironmentManager:check_object( id )
	return self._check_objects[ id ]
end

-- Fallback function
function CoreSoundEnvironmentManager:_disable_fallback()
	local fallback = self._check_objects[ self._fallback_id ]
	if fallback then
		self:set_check_object_active( self._fallback_id, false )
	end
end

-- Fallback function
function CoreSoundEnvironmentManager:_enable_fallback()
	local fallback = self._check_objects[ self._fallback_id ]
	if fallback and not fallback.active then
		for id,object in pairs( self._check_objects ) do
			if object ~= fallback then
				return
			end
		end
		self:set_check_object_active( self._fallback_id, true )
	end
end

function CoreSoundEnvironmentManager:_next_occasional()
	return Application:time() + (6 + math.rand( 4 ))
end