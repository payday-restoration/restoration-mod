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
			self._prefix = ("fl1n") .. "_"			
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
end