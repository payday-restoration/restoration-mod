if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function HuskCopDamage:damage_bullet(attack_data)
		if self._dead or self._invulnerable then
			return
		end

		local attacker_unit = attack_data.attacker_unit
		local attacker_base = alive(attacker_unit) and attacker_unit.base and attacker_unit:base()
		if attacker_base.is_local_player then
			return HuskCopDamage.super.damage_bullet(self, attack_data)
		end

		return self:is_friendly_fire(attacker_unit) and 'friendly_fire' or nil
	end

	local old_death = HuskCopDamage.die
	function HuskCopDamage:die(variant)
		old_death(self, variant)
		if self._unit:base():char_tweak().ends_assault_on_death then
			managers.hud:set_buff_enabled("vip", false)
		end
		if self._unit:contour() then
			self._unit:contour():remove("omnia_heal", false)
			self._unit:contour():remove("medic_show", false)
		end 	
	
        --client husk checks
        --blues and omnia shield
        if self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield_husk") then	                
        	self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
        --nypd and lapd blues	
        elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2_husk") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2_husk") then           
        	self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
        --welcome to city swat hell lol
        --scripted softcap dude with no mask, murky elite shotgunner and elite reapers
        elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl_husk") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc_husk") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc_husk") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump_husk") then	                
        	self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)	
        --lots of murkies	
        elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2_husk") then	               			
            self._unit:sound_source(source):stop()
		    self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_3, nil, true)		
        --omnia	
        elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2_husk") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3_husk") then	               
           self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)		
        --fbi ready team
        elseif self._unit:name() == Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1_husk") or self._unit:name() == Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2_husk") then	               
           self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)	
        --gensec
           elseif self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3_husk") then	
            self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
        --zeal zombies
        elseif self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1_husk") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2_husk") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3_husk") then	                		
           self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)			
        --gensec zombies
           elseif  self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2_husk") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3_husk") then		                	
        	self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)
        --zeals
        elseif self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2_husk") or self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3_husk") then	                		
            self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
	   	end
	end

	function HuskCopDamage:heal_unit(...)
		return CopDamage.heal_unit(self, ...)
	end
end