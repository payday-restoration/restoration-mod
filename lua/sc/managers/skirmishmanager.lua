Hooks:PostHook(SkirmishManager, "init_finalize", "ResInitKillCounter", function(self)
	self._required_kills = 0 --Prevents potential nil crash.
	log("Finalizing")
end)

--Refresh kill count required to end new assault.
Hooks:PostHook(SkirmishManager, "on_start_assault", "ResUpdateKillCounter", function(self)
	self._captain_active = nil
	self._required_kills = managers.groupai:state():_get_balancing_multiplier(tweak_data.skirmish.required_kills_balance_mul) * managers.groupai:state():_get_difficulty_dependent_value(tweak_data.skirmish.required_kills)
end)

--Update kill counter, end assault if kills required reached.
function SkirmishManager:do_kill()
	local groupai = managers.groupai:state()
	if not self._captain_active and groupai:chk_assault_active_atm() then
		self._required_kills = self._required_kills - 1

		if self._required_kills <= 0 then
			if self:current_wave_number() == 9 then
				groupai:force_spawn_group_hard(tweak_data.skirmish.captain)
				self._captain_active = true
			else
				groupai:force_end_assault_phase(true)
			end
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