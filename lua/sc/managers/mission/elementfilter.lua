--Thanks Zdann!
Hooks:PostHook(ElementFilter, "_check_difficulty", "ResDifficultyFallbackFix", function(self)
	local diff = Global.game_settings and Global.game_settings.difficulty or "hard"
	--Death Sentence fallback
	local is_difficulty_sm_wish = self._values.difficulty_sm_wish == nil and self._values.difficulty_overkill_290 or self._values.difficulty_sm_wish

	if is_difficulty_sm_wish and diff == "sm_wish" then
		return true
	end
	
	--Mayhem fallback
	local is_difficulty_easy_wish = self._values.difficulty_easy_wish == nil and self._values.difficulty_overkill_290 or self._values.difficulty_easy_wish

	if is_difficulty_easy_wish and diff == "easy_wish" then
		return true
	end
end)

local job = Global.level_data and Global.level_data.level_id
if job == "cage" then 
	function ElementFilter:_check_players()
		return true
	end
end