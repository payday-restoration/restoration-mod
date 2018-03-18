if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function CrimeSpreeManager:_setup_global_from_mission_id(mission_id)
		local mission_data = self:get_mission(mission_id)
		if mission_data then
			--get cs level
			local crime_spree_level = 0
			if Network:is_server() or Global.game_settings.single_player then
				crime_spree_level = managers.crime_spree:spree_level()
			else
				crime_spree_level = managers.crime_spree:get_peer_spree_level(1)
			end
			--dynamic difficulty based on cs level
			if crime_spree_level > 299 then
				Global.game_settings.difficulty = "sm_wish"
			elseif crime_spree_level > 199 then
				Global.game_settings.difficulty = "overkill_290"
			elseif crime_spree_level > 99 then
				Global.game_settings.difficulty = "easy_wish"
			else
				Global.game_settings.difficulty = "overkill_145"
			end
			
			if crime_spree_level > 399 then
				Global.game_settings.one_down = true
			else
				Global.game_settings.one_down = false
			end
			Global.game_settings.level_id = mission_data.level.level_id
			Global.game_settings.mission = mission_data.mission or "none"
		end
	end
	
end