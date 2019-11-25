if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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
		elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield") then
			self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
		elseif self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2") or self._unit:name() == Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3") then
			self._prefix = ("fl1n") .. "_"				
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
			self._prefix = ("fl1n") .. "_"		
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
	function CopSound:chk_voice_prefix()
	if self._prefix then
		return self._prefix
	end
    end

    function CopSound:say(sound_name, sync, skip_prefix, important, callback)
    	if self._last_speech then
    		self._last_speech:stop()
    	end
    	
    	local full_sound = nil
    	
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
    			--log("help")
    			fixed_sound = true
    		elseif sound_name == "x01a_any_3p" and not fixed_sound and not self._prefix == "l4n_" then
    			sound_name = "x02a_any_3p"
    			--log("fuckinghell")
    		end
    	end
    	
    	local faction = tweak_data.levels:get_ai_group_type()
    	
    	if self._unit:base():has_tag("special") and not sound_name == "g90" and not sound_name == "c01" then
    	
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
    	
    	if self._prefix == "l3d_" then
    		if sound_name == "burnhurt" then
    			full_sound = "l1d_burnhurt"
    		end
    		if sound_name == "burndeath" then
    			full_sound = "l1d_burndeath"
    		end
    	end
    	
    	if self._prefix == "l2d_" then
    		if sound_name == "x02a_any_3p" then
    			full_sound = "l1d_x02a_any_3p"
    		end
    	end
    	
    	if self._prefix == "z1n_" or self._prefix == "z2n_" or self._prefix == "z3n_" or self._prefix == "z4n_" then
    		if sound_name == "x02a_any_3p" then
    			full_sound = "shd_x02a_any_3p_01"
    		end
    		
    		if sound_name == "x01a_any_3p" then
    			full_sound = "bdz_x01a_any_3p"
    		end
    		
    		if sound_name ~= "x01a_any_3p" and sound_name ~= "x02a_any_3p" then
    			sound_name = "g90"
    		end
    	end
    		
    	if self._prefix == "fl1n_" then
            if sound_name == "x02a_any_3p" then
                full_sound = "fl1n_x01a_any_3p_01"
            end
        end
            
        if self._prefix == "r1n_" or self._prefix == "r2n_" or self._prefix == "r3n_" or self._prefix == "r4n_" then
            if sound_name == "x02a_any_3p" then
                full_sound = "l1n_x01a_any_3p"
            elseif sound_name == "x01a_any_3p" then
    			full_sound = "l1n_x02a_any_3p"
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
	
end