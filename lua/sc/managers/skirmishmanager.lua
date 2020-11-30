Hooks:PostHook(SkirmishManager, "init_finalize", "ResInitKillCounter", function(self)
	self._required_kills = 0 --Prevents potential nil crash.
end)

--Refresh kill count required to end new assault.
Hooks:PostHook(SkirmishManager, "on_start_assault", "ResUpdateKillCounter", function(self)
	self._required_kills = managers.groupai:state():_get_balancing_multiplier(tweak_data.skirmish.required_kills_balance_mul) * managers.groupai:state():_get_difficulty_dependent_value(tweak_data.skirmish.required_kills)

	--Lazy way to set difficulty to DS, SC probs knows a better one though.
	if not self._first_assault then
		--Shamelessly stolen from Crackdown code.
		local job_id_index = tweak_data.narrative:get_index_from_job_id(managers.job:current_job_id())
		local level_id_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
		local difficulty_index = tweak_data:difficulty_to_index("sm_wish")	
		Global.game_settings.difficulty = "sm_wish"

		if managers.network then
			managers.network:session():send_to_peers("sync_game_settings", job_id_index, level_id_index, difficulty_index, one_down)
		end

		self._first_assault = true
	end
end)

--Update kill counter, end assault if kills required reached.
function SkirmishManager:do_kill()
	if managers.groupai:state():chk_assault_active_atm() then
		self._required_kills = self._required_kills - 1
		log(self._required_kills)
		if self._required_kills <= 0 then
			managers.groupai:state():force_end_assault_phase(true)
		end
	end
end

--Prevents a nil return that's really dumb and causes crashes.
function SkirmishManager:current_wave_number()
	if Network:is_server() then
		return managers.groupai and managers.groupai:state():get_assault_number() or 0
	else
		return self._synced_wave_number or 0
	end
end

--Fuck off
function SkirmishManager:_has_players_in_custody()
	return false
end