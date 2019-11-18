if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--[[

	--examples: first item is the unit to be replaced, second is the replacement unit that should spawn instead
	local replacement_table = {
		--Bravo Rifle
		[Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
		[Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
		--Bravo Shotgun
		[Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
		[Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
		[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),		
		--Bravo LMG
		[Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"),	
		--Bravo DMR
		[Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")] = Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")					
	}

	local orig_modify = ModifiersManager.modify_value
	function ModifiersManager:modify_value(id, value, ...)
		local result = orig_modify(self,id,value,...)
		if id == "GroupAIStateBesiege:SpawningUnit" and managers.groupai:state()._ponr_is_on and Global.game_settings.one_down then 
			return replacement_table[tostring(id)] or result 
		end
		return result
	end
	
	]]--
	
end