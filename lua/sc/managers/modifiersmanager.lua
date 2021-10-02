local r = tweak_data.levels.ai_groups.russia
local m = tweak_data.levels.ai_groups.murkywater
local b = tweak_data.levels.ai_groups.federales
local ai_type = tweak_data.levels:get_ai_group_type()

--this table is for humans. edit this one
--first item is the unit to be replaced, second is the replacement unit that should spawn instead. 
--also, no need to include Idstring here anymore
if ai_type == b then
	replacement_table = {
		--Federales FBI Rifle
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"] = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi",
		--Federales FBI Shotgun
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870",
		--Federales FBI Heavy Rifle
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36",
		--Federales FBI Heavy Shotgun
		["units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale_r870"] = "units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870",
		
		--Mex Bravo Rifle
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
		--Mex Bravo Shotgun
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		["units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
		--Mex Bravo LMG
		["units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_mex/ene_bravo_lmg_mex",	
		--Mex Bravo DMR
		["units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex"	
	}
elseif ai_type == r then
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
		["units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		--Murky FBI Shotgun
		["units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		--Murky FBI Heavy Rifle
		["units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		--Murky FBI Heavy Shotgun
		["units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		
		--Murky Bravo Rifle
		["units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		["units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
		--Murky Bravo Shotgun
		["units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
		["units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
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
		["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		--FBI Shotgun
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		--FBI Heavy Rifle
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		["units/pd2_mod_lapd/characters/ene_lapd_heavy_1/ene_lapd_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		--FBI Heavy Shotgun
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		["units/pd2_mod_lapd/characters/ene_lapd_heavy_2/ene_lapd_heavy_2"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		
		--Bravo Rifle
		["units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
		--Bravo Shotgun
		["units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
		["units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
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

--modify this function so that we can pass the bravo table to other files
function ModifiersManager:init()
	self._modifiers = {}
	self._unit_table = unit_table or {} --define this here so ModifierBravos can pull the same table. avoids having to remake the same table twice
end

local orig_modify = ModifiersManager.modify_value
function ModifiersManager:modify_value(id, value, ...)
	local result = orig_modify(self,id,value,...)
	value = tostring(value)
	if id == "GroupAIStateBesiege:SpawningUnit" and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then 
--			if unit_table[value] then 
--				log("ModifiersManagers: Replacing spawn " .. tostring(value) .. " ==> " .. tostring(unit_table[tostring(value)]))
--			else
--				log("Did not find " .. value,{color = Color(1,0.6,0.6)})
--			end
		return self._unit_table[value] or result 
	end
	return result
end