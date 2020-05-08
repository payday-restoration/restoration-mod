local r = tweak_data.levels.ai_groups.russia
local m = tweak_data.levels.ai_groups.murkywater
local ai_type = tweak_data.levels:get_ai_group_type()

--this table is for humans. edit this one
--first item is the unit to be replaced, second is the replacement unit that should spawn instead. 
--also, no need to include Idstring here anymore
if ai_type == r then
	replacement_table = {
		--Reaper FBI Rifle
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass",
		--Reaper FBI Shotgun
		["units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870",
		--Reaper FBI Heavy Rifle
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36",
		--Reaper FBI Heavy Shotgun
		["units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"] = "units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870",
		
		--Reaper Bravo Rifle
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
		--Reaper Bravo Shotgun
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
		["units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
		--Reaper Bravo LMG
		["units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_ru/ene_bravo_lmg_ru",	
		--Reaper Bravo DMR
		["units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru"	
	}
elseif ai_type == m then
	replacement_table = {
		--Murky FBI Rifle
		["units/pd2_mod_sharks/characters/ene_murkywater_light/ene_murkywater_light"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4",
		--Murky FBI Shotgun
		["units/pd2_mod_sharks/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870",
		--Murky FBI Heavy Rifle
		["units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",
		--Murky FBI Heavy Shotgun
		["units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",
		
		--Murky Bravo Rifle
		["units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		--Murky Bravo Shotgun
		["units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
		["units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
		["units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",		
		--Murky Bravo LMG
		["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky",	
		--Murky Bravo DMR
		["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky"	
	}
else
	replacement_table = {
		--FBI Rifle
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1"] = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		--FBI Shotgun
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		--FBI Heavy Rifle
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		--FBI Heavy Shotgun
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--Bravo Rifle
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		--Bravo Shotgun
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",		
		--Bravo LMG
		["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",	
		--Bravo DMR
		["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"	
	}	
end
--this table is for robots. don't edit this one
local unit_table = {}

for k,v in pairs(replacement_table) do 
	unit_table[tostring(Idstring(k))] = Idstring(v)
	--convert key string to Idstring and then back into string type key
	--userdata type keys make me feel icky
end
replacement_table = nil --not exactly resource intensive but not like we need it anymore

local orig_modify = ModifiersManager.modify_value
function ModifiersManager:modify_value(id, value, ...)
		--get cs level
		local crime_spree_level = 0
		if Network:is_server() or Global.game_settings.single_player then
			crime_spree_level = managers.crime_spree:spree_level()
		else
			crime_spree_level = managers.crime_spree:get_peer_spree_level(1)
		end
			
		--calculate bravo chance
		local crime_spree_bravo_chance = (math.floor(crime_spree_level / 100) or 0) * 5
	local result = orig_modify(self,id,value,...)
	value = tostring(value)
	if id == "GroupAIStateBesiege:SpawningUnit" and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then 
--			if unit_table[value] then 
--				log("ModifiersManagers: Replacing spawn " .. tostring(value) .. " ==> " .. tostring(unit_table[tostring(value)]))
--			else
--				log("Did not find " .. value,{color = Color(1,0.6,0.6)})
--			end
		return unit_table[value] or result 
	elseif id == "GroupAIStateBesiege:SpawningUnit" and (Global.game_settings and Global.game_settings.incsmission) and math.random(0,100) < crime_spree_bravo_chance then
		--log("chance successful!! replacing unit with bravo")
		--log("the chance of replacement was:" .. crime_spree_bravo_chance .. ".")
		return unit_table[value] or result
	end
	return result
end