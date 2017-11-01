if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local job = Global.level_data and Global.level_data.level_id
	if job == "cage" then 
		function ElementFilter:_check_players()
			return true
		end
	end
	
end