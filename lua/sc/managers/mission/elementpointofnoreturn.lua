if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	local job = Global.level_data and Global.level_data.level_id
	if job == "cage" then 
		function ElementPointOfNoReturn:on_executed(instigator)
			if not self._values.enabled then
				return
			end
			local diff = Global.game_settings and Global.game_settings.difficulty or "hard"
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(320, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(300, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(280, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(260, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(240, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(220, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(200, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(180, self._id)
			end
			ElementPointOfNoReturn.super.on_executed(self, instigator)
		end
	elseif job == "tag" or job == "run" then 	
		function ElementPointOfNoReturn:on_executed(instigator)
			if not self._values.enabled then
				return
			end
			local diff = Global.game_settings and Global.game_settings.difficulty or "hard"
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(60, self._id)
			end
			ElementPointOfNoReturn.super.on_executed(self, instigator)
		end	
	elseif job == "bph" then 	
		function ElementPointOfNoReturn:on_executed(instigator)
			if not self._values.enabled then
				return
			end
			local diff = Global.game_settings and Global.game_settings.difficulty or "hard"
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			end
			ElementPointOfNoReturn.super.on_executed(self, instigator)
		end	
	end	
end