restorationVoiceline = restorationVoiceline or blt_class()
function restorationVoiceline:init()
	blt.xaudio.setup() --Must be called at least once for custom audio to be loaded.
	self._custom_voice_path = Application:nice_path("./" .. ModPath .. "assets/oggs/voiceover", true)
	self._active_sources = {} --Active sound sources. Get cleaned up via unit destroy_listeners.
	self._loaded = {} --Currently loaded buffers. All of them need to be close(true)'d at heist exit or you'll leak memory.
	self._load_queue = {} --Queue of unit lists to load voicelines for.
	self._load_coroutine = nil --The current loading coroutine. Usually nil except for heist start.
end

--Attempts to 'make a given unit say' a voice line.
--Check and see if you can use CopSound:say first, before calling this directly!
--If a line is missing from there, check and see if it can be added to the line_array table.
--If the desired line has not been loaded yet, then no audio is output. Usually only happens during the first few seconds of a heist.
--Likewise, if a unit is currently saying another line, they will not respond to the newest call unless the force parameter is set to true.
--Returns whether or not the unit has custom voicelines.
function restorationVoiceline:say(unit, line, force)
	local custom_voicework = unit:base():char_tweak().custom_voicework
	if not custom_voicework then
		return false
	end

	local unit_line_table = self._loaded[custom_voicework]
	local unit_key = unit:key()
	local existing_source = self._active_sources[unit_key]
	if unit_line_table and (not existing_source or existing_source:is_closed() or force) then
		local line_type = unit_line_table[line]
		if line_type and #line_type > 0 then
			local buffer = line_type[math.random(#line_type)]
			if buffer then
				if not existing_source then
					--Ensure that the audio source reference for this unit gets cleaned up when they're cleaned up.
					unit:base():add_destroy_listener("restorationRemoveAudioSource", function()
						self._active_sources[unit_key] = nil
					end)
				elseif force and not existing_source:is_closed() then
					existing_source:stop()
					existing_source:close()
				end

				self._active_sources[unit_key] = XAudio.UnitSource:new(unit, buffer)
			end
		end
	end
	
	return true
end

--Enqueues the voice lines related to a list of units to be loaded.
--If no list is provided, instead loads all available voicelines.
function restorationVoiceline:load(units_to_load)
	if not units_to_load then --If no units supplied, LOAD EVERYTHING. Very slow and memory inefficient, you have been warned!
		log("restoration VOICELINE: Loading all voicelines!")
		units_to_load = file.GetDirectories(Application:nice_path(self._custom_voice_path))
	else 
		log("restoration VOICELINE: Loading voicelines for " .. tostring(#units_to_load) .. " selected units.")
	end

	self._load_queue[#self._load_queue + 1] = units_to_load
end

--This needs to be called to load additional buffers with audio.
--Pass lines_loaded into the function to load more than one buffer at a time.
local TARGET_FRAMERATE = 60
local TARGET_BUFFERS_PER_FRAME = 4
local MENU_TARGET_BUFFERS_PER_FRAME = 12
function restorationVoiceline:update(dt, in_menu)
	if #self._load_queue > 0 then
		local loading_status = self._load_coroutine and coroutine.status(self._load_coroutine) or "dead"
		if loading_status == "dead" then
			self._load_coroutine = coroutine.create(self._load)
		end

		--Dynamically adjust buffers loaded per frame based on framerate. Speed things up by 3 if the user is in a menu.
		self._buffers_per_frame = math.ceil((1/dt)*((in_menu and MENU_TARGET_BUFFERS_PER_FRAME or TARGET_BUFFERS_PER_FRAME)/TARGET_FRAMERATE))

		local result, error = coroutine.resume(self._load_coroutine, self)
		if not result then
			log("HEAD VOICELINE: Unable to resume loading coroutine. Message - " .. tostring(error))
		end
	end
end

--Unloads all loaded voice lines.
--Should ideally be called just prior to leaving a level.
function restorationVoiceline:unload()
	log("restoration VOICELINE: UNLOADING")

	--Clear active loading attempts.
	self._load_coroutine = nil
	self._load_queue = {}

	--Clear any active sources.
	for _, source in pairs(self._active_sources) do
		source:stop()
		source:close()
	end 
	self._active_sources = {}

	--Clear all existing buffers.
	local counter = 0
	for unit_type, unit_table in pairs(self._loaded) do
		for line_type, line_table in pairs(unit_table) do
			for i = 1, #line_table do
				line_table[i]:close(true)
				counter = counter + 1
			end
		end
	end

	--Reset both to be empty tables.
	self._loaded = {}

	log("restoration VOICELINE: Unloaded " .. tostring(counter) .. " voicelines.")
end

--Internal loading thread. Consumes the topmost item in the load queue then pops it.
--Consumed items are appended as xaudio buffers to the _loaded table, organized by unit and line type.
--Loads a number of buffers equal to self._buffers_per_frame before yielding.
function restorationVoiceline:_load()
	log("restoration VOICELINE: Initiated load.")
	for i = 1, #self._load_queue[#self._load_queue] do
		local unit_type = self._load_queue[#self._load_queue][i]
		if not self._loaded[unit_type] then
			log("restoration VOICELINE: Loading " .. unit_type)
			self._loaded[unit_type] = {}
			local unit_dir = self._custom_voice_path .. "\\" .. unit_type
			for _, line_type in pairs(file.GetDirectories(unit_dir)) do
				if not self._loaded[line_type] then
					local line_dir = unit_dir .. "\\" .. line_type
					local buffers_this_frame = 0
					self._loaded[unit_type][line_type] = {}
					for _, line in pairs(file.GetFiles(line_dir)) do
						local path = line_dir .. "\\" .. line
						if io.file_is_readable(path) then
							local loaded_audio = self._loaded[unit_type][line_type]
							loaded_audio[#loaded_audio + 1] = XAudio.Buffer:new(path)
							buffers_this_frame = buffers_this_frame + 1
						end

						if buffers_this_frame >= self._buffers_per_frame then
							coroutine.yield()
							buffers_this_frame = 0
						end
					end
				end
			end
		end
	end

	log("restoration VOICELINE: Load complete.")
	self._load_queue[#self._load_queue] = nil
end

restoration = restoration or {}
restoration.Voicelines = restoration.Voicelines or restorationVoiceline:new()

--Update hooks to ensure that buffers get loaded.
local orig_update = GameStateMachine.update
function GameStateMachine:update(t, dt)
	orig_update(self, t, dt)
	restoration.Voicelines:update(dt, not GameStateFilters.any_ingame_playing[self._current_state:name()]) --Load lines faster while not actually playing.
end

--Load stuff more aggressively while the game is paused.
local orig_paused_update = GameStateMachine.paused_update
function GameStateMachine:paused_update(t, dt)
	orig_paused_update(self, t, dt)
	restoration.Voicelines:update(dt, true)
end