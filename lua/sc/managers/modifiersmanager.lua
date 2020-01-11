if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local r = tweak_data.levels.ai_groups.russia
	local m = tweak_data.levels.ai_groups.murkywater
	local ai_type = tweak_data.levels:get_ai_group_type()

	--this table is for humans. edit this one
	--first item is the unit to be replaced, second is the replacement unit that should spawn instead. 
	--also, no need to include Idstring here anymore
	if ai_type == r then
		replacement_table = {
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
			--Murky Bravo Rifle
			["units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
			["units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
			["units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
			--Murky Bravo Shotgun
			["units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
			["units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
			["units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",		
			--Murky Bravo LMG
			["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",	
			--Murky Bravo DMR
			["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"	
		}
	else
		replacement_table = {
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
		local result = orig_modify(self,id,value,...)
		value = tostring(value)
		if id == "GroupAIStateBesiege:SpawningUnit" and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then 
--			if unit_table[value] then 
--				log("ModifiersManagers: Replacing spawn " .. tostring(value) .. " ==> " .. tostring(unit_table[tostring(value)]))
--			else
--				log("Did not find " .. value,{color = Color(1,0.6,0.6)})
--			end
			return unit_table[value] or result 
		end
		return result
	end
	
end