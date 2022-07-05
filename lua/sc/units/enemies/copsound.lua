function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count
			
	if char_tweak.speech_prefix_p1 == "l5d" then
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"	
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1") or self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2") or self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_3/ene_city_guard_3") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2") then
		self._prefix = ("l5d") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870") then
		self._prefix = ("l5d") .. "_"	
	elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield") then
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
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1") then
		self._prefix = ("r") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	--Russian Mobster VO
	elseif self._unit:name() == Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1") or self._unit:name() == Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager")  or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager")  or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_5/ene_gang_mobster_5") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_6/ene_gang_mobster_6") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_7_pager/ene_gang_mobster_7_pager") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_armored/ene_gang_mobster_armored") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_armored_2/ene_gang_mobster_armored_2") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_clubowner/ene_gang_mobster_clubowner") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_1/ene_gang_mobster_vip_1") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_2/ene_gang_mobster_vip_2") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_clubsecurity/ene_gang_mobster_clubsecurity") then
		self._prefix = ("rt") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. "_"
	
	
	--husks		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"		
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_city_guard_3/ene_city_guard_3_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"		
	elseif self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"				
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"			
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("d") .. "_"					
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"		
	elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2_husk") then
		self._prefix = ("l") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1_husk") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2_husk") then
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
	elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1_husk") then
		self._prefix = ("r") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. ("n") .. "_"
	--Russian Mobster VO
	elseif self._unit:name() == Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1_husk") or self._unit:name() == Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager_husk")  or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager_husk")  or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_5/ene_gang_mobster_5_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_6/ene_gang_mobster_6_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_7_pager/ene_gang_mobster_7_pager_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_armored/ene_gang_mobster_armored_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_armored_2/ene_gang_mobster_armored_2_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_clubowner/ene_gang_mobster_clubowner_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_1/ene_gang_mobster_vip_1_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_vip_2/ene_gang_mobster_vip_2_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer_husk") or self._unit:name() == Idstring("units/pd2_mod_ttr/characters/ene_gang_mobster_clubsecurity/ene_gang_mobster_clubsecurity_husk") then
		self._prefix = ("rt") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. "_"	
	else
		self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end

 	if not restoration.Voicelines:say(self._unit, "spawn") then
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

	local line_array = {
	c01 =       {line = "contact"},
	c01x =      {line = "contact"},
	burnhurt =  {line = "burnhurt",  force = true},
	burndeath = {line = "burndeath", force = true},
	rrl =       {line = "reload"},
	gr1a =      {line = "spawn"},
	gr1b =      {line = "spawn"},
	gr1c =      {line = "spawn"},
	gr1d =      {line = "spawn"},
	gr2a =      {line = "spawn"},
	gr2b =      {line = "spawn"},
	gr2c =      {line = "spawn"},
	gr2d =      {line = "spawn"},
	a05 =       {line = "clear_stelf"},
	a06 =       {line = "clear_stelf"},
	e01 =       {line = "disabled_gear", force = true}, 
	e02 =       {line = "disabled_gear", force = true},
	e03 =       {line = "disabled_gear", force = true},
	e04 =       {line = "disabled_gear", force = true},
	e05 =       {line = "disabled_gear", force = true},
	e06 =       {line = "disabled_gear", force = true},
	i01 =       {line = "contact"},
	i02 =       {line = "gogo"},
	i03 =       {line = "kill"},
	lk3a =      {line = "buddy_died"},
	lk3b =      {line = "buddy_died"}, 
	mov =       {line = "gogo"},
	med =       {line = "buddy_died"},
	amm =       {line = "buddy_died"},
	ch1 =       {line = "buddy_died"},
	ch2 =       {line = "buddy_died"},
	ch3 =       {line = "burnhurt"}, --close enough just ignore that they sometimes scream fire
	ch4 =       {line = "buddy_died"},
	t01 =       {line = "flank"},
	pus =       {line = "gogo"},
	g90 =       {line = "buddy_died"},
	civ =       {line = "hostage"},
	bak =       {line = "ready"},
	p01 =       {line = "hostage"},
	p02 =       {line = "hostage"},
	p03 =       {line = "gogo"},
	m01 =       {line = "retreat"},
	h01 =       {line = "rescue_civ"},
	h10 =       {line = "rescue_civ"},
	cr1 =       {line = "hostage"},
	rdy =       {line = "ready"},
	r01 =       {line = "ready"},
	clr =       {line = "clear"},
	att =       {line = "gogo"},
	a08 =       {line = "gogo"},
	prm =       {line = "ready"},
	pos =       {line = "ready"},
	d01 =       {line = "ready"},
	d02 =       {line = "ready"},
	x01a_any_3p =    {line = "pain",  force = true},
	x01a_any_3p_01 = {line = "pain",  force = true},
	x01a_any_3p_02 = {line = "pain",  force = true},
	x02a_any_3p =    {line = "death", force = true},
	x02a_any_3p_01 = {line = "death", force = true},
	x02a_any_3p_02 = {line = "death", force = true},
	hlp =            {line = "buddy_died"},
	buddy_died =     {line = "buddy_died"},
	s01x =           {line = "surrender"},
	cn1 =            {line = "joker"},
	use_gas =        {line = "use_gas"},
	spawn =          {line = "spawn"},
	tasing =         {line = "tasing"},
	heal =           {line = "heal"},
	tsr_x02a_any_3p = {line = "death", force = true},
	tsr_x01a_any_3p = {line = "pain",  force = true},
	tsr_post_tasing_taunt = {line = "tasing"},
	post_tasing_taunt =     {line = "tasing"},
	tsr_g90 =               {line = "contact"},
	tsr_entrance =          {line = "gogo"},
	tsr_c01 =               {line = "contact"},
	bdz_c01 =               {line = "contact"},
	bdz_entrance =          {line = "spawn"},
	bdz_entrance_elite =    {line = "spawn"},
	bdz_g90 =               {line = "gogo"},
	bdz_post_kill_taunt =   {line = "gogo"},
	dz_visor_lost =         {line = "visor_lost"},
	visor_lost =            {line = "visor_lost"},
	cloaker_taunt_after_assault =  {line = "kill"},
	cloaker_taunt_during_assault = {line = "kill"},
	cpa_taunt_after_assault =      {line = "kill"},
	cpa_taunt_during_assault =     {line = "kill"},
	police_radio =                 {line = "radio"}, -- doesnt work :<
	clk_x02a_any_3p =              {line = "death", force = true}
    }


	local line_to_check = line_array[sound_name]
    if line_to_check and restoration.Voicelines:say(self._unit, line_to_check.line, line_to_check.force) then
		return
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
		
		if self._prefix == "l1n_" or self._prefix == "l2n_" or self._prefix == "l3n_" then
			if sound_name == "x02a_any_3p" then
				sound_name = "x01a_any_3p"
				fixed_sound = true
				--log("IM FUCKIN DEAD BRO")
			elseif sound_name == "x01a_any_3p" then
				sound_name = "x02a_any_3p"
				--log("OW MY BONES")
			end
		end
		
		if self._prefix == "l4n_" then
			if sound_name == "x02a_any_3p" then
				sound_name = "x01a_any_3p"
				fixed_sound = true
				--log("l4N IS FUCKIGN DEAD WTF NOOOO")
			elseif sound_name == "x01a_any_3p" then
				sound_name = "l1n_x02a_any_3p"
				--log("l4N BONE HURTY JUICE")
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
				
			if self._unit:base():has_tag("tank") then
			       if sound_name == "burndeath" then				
				    full_sound = "l1d_burndeath"
				end	
			end
			
			if self._unit:base():has_tag("tank") then
			       if sound_name == "burnhurt" then				
				    full_sound = "l1d_burnhurt"
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
			
		if self._prefix == "r1n_" or self._prefix == "r2n_" or self._prefix == "r3n_" or self._prefix == "r4n_" then
			if sound_name == "x02a_any_3p" then
				full_sound = "l2n_x01a_any_3p"
			elseif sound_name == "x01a_any_3p" then
				full_sound = "l2n_x02a_any_3p"
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