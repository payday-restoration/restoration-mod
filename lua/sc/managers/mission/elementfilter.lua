--Thanks Zdann!
function ElementFilter:_check_difficulty()
	local diff = Global.game_settings and Global.game_settings.difficulty or "hard"

	if self._values.difficulty_easy and diff == "easy" then
		return true
	end

	if self._values.difficulty_normal and diff == "normal" then
		return true
	end

	if self._values.difficulty_hard and diff == "hard" then
		return true
	end

	if self._values.difficulty_overkill and diff == "overkill" then
		return true
	end

	if self._values.difficulty_overkill_145 and diff == "overkill_145" then
		return true
	end
	
	--Mayhem fallback
	local is_difficulty_easy_wish = self._values.difficulty_easy_wish == nil and self._values.difficulty_overkill_290 or self._values.difficulty_easy_wish

	if is_difficulty_easy_wish and diff == "easy_wish" then
		return true
	end

	local is_difficulty_overkill_290 = self._values.difficulty_overkill_290 == nil and self._values.difficulty_overkill_145 or self._values.difficulty_overkill_290

	if is_difficulty_overkill_290 and diff == "overkill_290" then
		return true
	end
	
	--Death Sentence fallback
	local is_difficulty_sm_wish = self._values.difficulty_sm_wish == nil and self._values.difficulty_overkill_290 or self._values.difficulty_sm_wish

	if is_difficulty_sm_wish and diff == "sm_wish" then
		return true
	end

	return false
	
	if self._values.one_down and Global.game_settings.one_down then
            return true
        end
	
end

	

local job = Global.level_data and Global.level_data.level_id
if job == "cage" then 
	function ElementFilter:_check_players()
		return true
	end
end