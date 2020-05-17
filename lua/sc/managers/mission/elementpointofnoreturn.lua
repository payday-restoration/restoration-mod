function ElementPointOfNoReturn:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local diff = Global.game_settings and Global.game_settings.difficulty or "hard"
	local job = Global.level_data and Global.level_data.level_id
	
	for _,p in pairs(restoration.always_ponr) do
		if job == p then
			--For heists that we want to keep their normal PONRs regardless of pro job status
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_easy, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_normal, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_hard, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill_145, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_easy_wish, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill_290, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_sm_wish, self._id)
			end			
			break
		end
	end

	--One Down modifiers
	if Global.game_settings and Global.game_settings.one_down then
		if job == "cage" then 
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(420, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(390, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(360, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(330, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(300, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(270, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(270, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(240, self._id)
			end				
		elseif job == "tag" or job == "run" or job == "kosugi" or job == "dark" or job == "fish" then 	
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
		elseif job == "bph" then 
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(780, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(750, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(720, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(690, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(660, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(630, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(630, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(600, self._id)
			end	
		elseif job == "vit" then 
			--Disabled
			return
		else
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_easy, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_normal, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_hard, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill_145, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_easy_wish, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_overkill_290, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(self._values.time_sm_wish, self._id)
			end
		end
	--Everything else, when not on Pro Job	
	else
		if job == "cage" then 
			if diff == "easy" then
				managers.groupai:state():set_point_of_no_return_timer(420, self._id)
			elseif diff == "normal" then
				managers.groupai:state():set_point_of_no_return_timer(390, self._id)
			elseif diff == "hard" then
				managers.groupai:state():set_point_of_no_return_timer(360, self._id)
			elseif diff == "overkill" then
				managers.groupai:state():set_point_of_no_return_timer(330, self._id)
			elseif diff == "overkill_145" then
				managers.groupai:state():set_point_of_no_return_timer(300, self._id)
			elseif diff == "easy_wish" then
				managers.groupai:state():set_point_of_no_return_timer(270, self._id)
			elseif diff == "overkill_290" then
				managers.groupai:state():set_point_of_no_return_timer(270, self._id)
			elseif diff == "sm_wish" then
				managers.groupai:state():set_point_of_no_return_timer(240, self._id)
			end			
		elseif job == "tag" or job == "kosugi" or job == "dark" or job == "fish" then 
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
		else
			--Disabled	
			return
		end		
				
	end

	ElementPointOfNoReturn.super.on_executed(self, instigator)
end