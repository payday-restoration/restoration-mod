local job = Global.level_data and Global.level_data.level_id
if job == "cage" then 
	function ElementFilter:_check_players()
		return true
	end
end