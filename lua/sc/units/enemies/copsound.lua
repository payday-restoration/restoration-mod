function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count
			
	if char_tweak.speech_prefix_p1 == "l5d" then
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"	
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2") then
		self._prefix = ("l5d") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870") then
		self._prefix = ("l5d") .. "_"	
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3") then
		self._prefix = ("fl1n") .. "_"				
	--DRAK Titans
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser") then
		self._prefix = ("rtsr") .. "_"	
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1") then
		self._prefix = ("rclk") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf") then
		self._prefix = ("rmdc") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault") then
		self._prefix = ("r1n") .. "_"
	
	
	--husks		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2_husk") then
		self._prefix = ("l5d") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870_husk") then
		self._prefix = ("l5d") .. "_"	
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2_husk") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3_husk") then
		self._prefix = ("f1n") .. "_"			
	--DRAK Titans husks
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser_husk") then
		self._prefix = ("rtsr") .. "_"	
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1_husk") then
		self._prefix = ("rclk") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf_husk") then
		self._prefix = ("rmdc") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault_husk") then
		self._prefix = ("r1n") .. "_"	
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end

	if self._unit:base():char_tweak()["custom_voicework"] then
		local voicelines = _G.voiceline_framework.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
		if voicelines and voicelines["spawn"] then
			local line_to_use = voicelines.spawn[math.random(#voicelines.spawn)]
			self._unit:base():play_voiceline(line_to_use, true)
		end
	elseif self._unit:base():char_tweak().spawn_sound_event then
		self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event, nil, nil)
	end
	
	--Mostly just here in the event we have a unit to have both an 'entrance' line *and* a global spawn in noise
	if self._unit:base():char_tweak().spawn_sound_event_2 then
		self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_2, nil, nil)
	end		

	unit:base():post_init()
end

function CopSound:say(sound_name, sync, skip_prefix, important, callback)
	local line_array = { c01 = "contact",
		c01x = "contact",
		rrl = "gogo",
		gr1a = "spawn",
		gr1b = "spawn",
		gr1c = "spawn",
		gr1d = "spawn",
		gr2a = "spawn",
		gr2b = "spawn",
		gr2c = "spawn",
		gr2d = "spawn",
		a05 = "clear_stelf",
		a06 = "clear_stelf",
		e01 = "disabled_gear", --look into restoring this chatter in general
		e02 = "disabled_gear",
		e03 = "disabled_gear",
		e04 = "disabled_gear",
		e05 = "disabled_gear",
		e06 = "disabled_gear",
		i01 = "contact",
		i02 = "gogo",
		i03 = "kill",
		lk3a = "buddy_died",  
		lk3b = "cover_me",  --could use this to add calmer panic between assaults
		mov = "gogo",
		med = "buddy_died",
		amm = "buddy_died",
		ch1 = "trip_mines",--
		ch2 = "sentry",--
		ch3 = "ecm", --
		ch4 = "saw", -- could add these lines to our units
		t01 = "gogo", -- could add flank lines to all our units
		pus = "gogo",
		g90 = "contact",
		civ = "hostage",
		bak = "ready",
		p01 = "hostage",
		p02 = "hostage",
		p03 = "gogo",
		m01 = "retreat",
		h01 = "rescue_civ",
		cr1 = "rescue_civ",
		rdy = "ready",
		r01 = "ready",
		clr = "clear",
		att = "gogo",
		a08 = "gogo",
		prm = "ready",
		pos = "ready",
		d01 = "ready",
		d02 = "ready",
		x01a_any_3p = "pain",
		x01a_any_3p_01 = "pain",
		x01a_any_3p_02 = "pain",
		x02a_any_3p = "death",
		x02a_any_3p_01 = "death",
		x02a_any_3p_02 = "death",
		hlp = "buddy_died",
		buddy_died = "buddy_died",
		s01x = "surrender",
		use_gas = "use_gas",
		spawn = "spawn",
		tasing = "tasing",
		heal = "heal",
		tsr_x02a_any_3p = "death",
		tsr_x01a_any_3p = "pain",
		tsr_post_tasing_taunt = "tasing",
		tsr_g90 = "contact",
		tsr_entrance = "gogo",
		tsr_c01 = "contact",
		bdz_c01 = "contact",
		bdz_entrance = "spawn",
		bdz_entrance_elite = "spawn",
		bdz_g90 = "gogo",
		bdz_post_kill_taunt = "gogo",
		bdz_visor_lost = "gogo",
		cloaker_taunt_after_assault = "kill",
		cloaker_taunt_during_assault = "kill",
		cpa_taunt_after_assault = "kill",
		cpa_taunt_during_assault = "kill",
		police_radio = "radio", -- doesnt work :<
		clk_x02a_any_3p = "death"
	}
	local line_to_check = line_array[sound_name]
	if self._unit:base():char_tweak()["custom_voicework"] then
		if line_to_check then
			local voicelines = _G.voiceline_framework.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
			if voicelines and voicelines[line_to_check] then
				local line_to_use = voicelines[line_to_check][math.random(#voicelines[line_to_check])]
				self._unit:base():play_voiceline(line_to_use, important)
				return
			end
		end
	end
	
	if self._last_speech then
		self._last_speech:stop()
	end
	
	local full_sound = nil
	
	if not self._unit:base():char_tweak()["custom_voicework"] then
		if self._prefix == "l5d_" then
			if sound_name == "c01" or sound_name == "att" then
				sound_name = "g90"
			elseif sound_name == "rrl" then
				sound_name = "pus"
			elseif sound_name == "t01" then
				sound_name = "prm"
			elseif sound_name == "h01" then
				sound_name = "h10"
			end
		end
		
		local fixed_sound = nil
		
		if self._prefix == "l1n_" or self._prefix == "l2n_" or self._prefix == "l3n_" or self._prefix == "l4n_" then
			if sound_name == "x02a_any_3p" then
				sound_name = "x01a_any_3p"
				--log("IM FUCKIN DEAD BRO")
				fixed_sound = true
			elseif sound_name == "x01a_any_3p" and not fixed_sound and not self._prefix == "l4n_" then
				sound_name = "x02a_any_3p"
				--log("OW MY BONES")
			end
		end
		
		if self._prefix == "l1d_" or self._prefix == "l2d_" or self._prefix == "l3d_" or self._prefix == "l4d_" or self._prefix == "l5d_" then
			if sound_name == "a05" or sound_name == "a06" then
				sound_name = "clr"
				--log("CLEAR!!!")
			end
		end
		
		local faction = tweak_data.levels:get_ai_group_type()
		
		if self._unit:base():has_tag("special") and not sound_name == "g90" and not sound_name == "c01" then --just making sure
		
			if sound_name == "x02a_any_3p" then
				if self._unit:base():has_tag("spooc") then
					if faction == "russia" then
						full_sound = "rclk_x02a_any_3p"
					else
						full_sound = "clk_x02a_any_3p"
					end
				end
				
				if self._unit:base():has_tag("taser") then
					if faction == "russia" then
						full_sound = "rtsr_x02a_any_3p"
					else
						full_sound = "tsr_x02a_any_3p"
					end
				end
				
				if self._unit:base():has_tag("tank") then
					full_sound = "bdz_x02a_any_3p"
				end
				
				if self._unit:base():has_tag("medic") then
					full_sound = "mdc_x02a_any_3p"
				end
			end
			
			if sound_name == "x01a_any_3p" then
				if self._unit:base():has_tag("spooc") then
					if faction == "russia" then
						full_sound = "rclk_x01a_any_3p" --weird he has hurt noises but the regular cloaker doesnt
					else
						full_sound = full_sound
					end
				end
				if self._unit:base():has_tag("taser") then
					if faction == "russia" then
						full_sound = "rtsr_x01a_any_3p"
					else
						full_sound = "tsr_x01a_any_3p"
					end
				end
				if self._unit:base():has_tag("tank") then
					full_sound = "bdz_x01a_any_3p"
				end
				if self._unit:base():has_tag("medic") then
					full_sound = "mdc_x01a_any_3p"
				end
			end
		end
		
		if self._prefix == "l2d_" then
			if sound_name == "x02a_any_3p" then
				full_sound = "l1d_x02a_any_3p"
			end
		end
		
		if self._prefix == "l3d_" then
			if sound_name == "burnhurt" then
				full_sound = "l1d_burnhurt"
			end
			if sound_name == "burndeath" then
				full_sound = "l1d_burndeath"
			end
		end
		
		if self._prefix == "z1n_" or self._prefix == "z2n_" or self._prefix == "z3n_" or self._prefix == "z4n_" then
			if sound_name == "x02a_any_3p" then
				full_sound = "l2n_x01a_any_3p"
			end
			
			if sound_name == "x01a_any_3p" then
				full_sound = "l2n_x02a_any_3p"
			end
			
			if sound_name ~= "x01a_any_3p" and sound_name ~= "x02a_any_3p" then
				sound_name = "g90"
			end
		end
			
		if self._prefix == "f1n_" then
			if sound_name == "x02a_any_3p" then
				full_sound = "f1n_x01a_any_3p_01"
			end
		end
			
		if self._prefix == "r1n_" or self._prefix == "r2n_" or self._prefix == "r3n_" or self._prefix == "r4n_" then
			if sound_name == "x02a_any_3p" then
				full_sound = "l2n_x01a_any_3p"
			elseif sound_name == "x01a_any_3p" then
				full_sound = "l2n_x02a_any_3p"
			end
		end
		
		if faction == "classic" then --crackdown-only
			if self._prefix == "l1d_" or self._prefix == "l2d_" or self._prefix == "l3d_" or self._prefix == "l4d_" or self._prefix == "l5d_" then
				if sound_name == "x02a_any_3p" then
					full_sound = "shd_x02a_any_3p_01"
				end
					
				if sound_name == "x01a_any_3p" then
					full_sound = "bdz_x01a_any_3p"
				end
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