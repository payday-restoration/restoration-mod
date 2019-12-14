if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

--[[

--this table is for humans. edit this one
--first item is the unit to be replaced, second is the replacement unit that should spawn instead. 
--also, no need to include Idstring here anymore
	local replacement_table = {
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

]]--	
	
end
