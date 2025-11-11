-- Go to restoration-mod/req/massive_tables/copsound for this stuff
CopSound.prefix_lookup_by_unit_name = restoration:require("massive_tables/copsound/prefix_lookup_by_unit_name") or {}
CopSound.sound_name_lookup_by_prefix = restoration:require("massive_tables/copsound/sound_name_lookup_by_prefix") or {}
CopSound.full_sound_lookup_by_prefix = restoration:require("massive_tables/copsound/full_sound_lookup_by_prefix") or {}

function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count and tostring(math.random(char_tweak.speech_prefix_count)) or ""
	local prefix_func = self.prefix_lookup_by_unit_name[unit:name():key()]
	self._prefix = prefix_func and prefix_func(self, nr_variations) or nil

	if not self._prefix then
		if char_tweak.speech_prefix_p1 == "l5d" then
			self._prefix = "l5d_"
		else
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. nr_variations .. (char_tweak.speech_prefix_p2 or "") .. "_"
		end
	end

	local spawn_sounds = restoration.Options:GetValue("OTHER/EnemySpawnSounds")
	if spawn_sounds then
		if not restoration.Voicelines:say(self._unit, "spawn") then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event, nil, nil)
		end

		--Mostly just here in the event we have a unit to have both an 'entrance' line *and* a global spawn in noise
		if self._unit:base():char_tweak().spawn_sound_event_2 then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_2, nil, nil)
		end

		--Use this only if an enemy has custom voice and is already using 2nd spawn sound
		if self._unit:base():char_tweak().spawn_sound_event_3 then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_3, nil, nil)
		end
	end

	unit:base():post_init()
end

-- Is this even used?
function CopSound:chk_voice_prefix()
	if self._prefix then
		return self._prefix
	end
end

function CopSound:say(sound_name, sync, skip_prefix, important, callback)
	if self._last_speech then
		self._last_speech:stop()
	end

	if restoration.Voicelines:say_id(self._unit, sound_name) then
		if sync then
			self._unit:network():send("say", SoundDevice:string_to_id(sound_name))
		end

		self._speak_expire_t = TimerManager:game():time() + 2
		return
	end

	-- Zombie cops have almost all lines replaced with g90, not included in the lookup tables (at least for now)
	local full_sound = nil
	if self._prefix == "z1n_" or self._prefix == "z2n_" or self._prefix == "z3n_" or self._prefix == "z4n_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l2n_x01a_any_3p"
		elseif sound_name == "x01a_any_3p" then
			full_sound = "l2n_x02a_any_3p"
		else
			sound_name = "g90"
		end
	else
		local full_sound_lookup = self.full_sound_lookup_by_prefix[self._prefix]
		full_sound = full_sound_lookup and full_sound_lookup[sound_name] or nil
		if type(full_sound) == "table" then
			full_sound = table.random(full_sound)
		elseif full_sound then
			-- Nothing
		elseif self.sound_name_lookup_by_prefix[self._prefix] then
			sound_name = self.sound_name_lookup_by_prefix[self._prefix][sound_name] or sound_name
			if type(sound_name) == "table" then
				sound_name = table.random(sound_name)
			end
		end
	end

	if not full_sound then
		if skip_prefix then
			full_sound = sound_name
		else
			full_sound = self._prefix .. sound_name
		end
	end

	local event_id = nil

	if type(full_sound) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		event_id = event_id or SoundDevice:string_to_id(full_sound)

		self._unit:network():send("say", event_id)
	end

	self._last_speech = self:_play(full_sound or event_id)

	if not self._last_speech then
		return
	end

	self._speak_expire_t = TimerManager:game():time() + 2
end
