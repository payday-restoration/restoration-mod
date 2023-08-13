local orig_init_finalize = SkirmishManager.init_finalize
function SkirmishManager:init_finalize()
	orig_init_finalize(self)
	if self:is_skirmish() then
		self._required_kills = 0 --Prevents potential nil crash.

		local load_list = {}
		for unit, data in pairs(tweak_data.character) do
			if type(data) == "table" and data.custom_voicework then
				if restoration.projob_only_voicelines[data.custom_voicework] then
					load_list[#load_list + 1] = data.custom_voicework
				end
				--Just load every captain since the selected one is not synced!
			end
		end

		restoration.Voicelines:load(load_list)
	end
end

--Refresh kill count required to end new assault.
Hooks:PostHook(SkirmishManager, "on_start_assault", "ResUpdateKillCounter", function(self)
	local map_scale_factor = 1
	
	local skirmish_job_id = Global.level_data.level_id

	for _,vl in pairs(restoration.very_large_levels) do
		if skirmish_job_id == vl then
			map_scale_factor = 1.3
		end
	end		
	for _,l in pairs(restoration.large_levels) do
		if skirmish_job_id == l then
			map_scale_factor = 1.15
		end
	end	
	for _,t in pairs(restoration.tiny_levels) do
		if skirmish_job_id == t then
			map_scale_factor = 0.85
		end
	end
	for _,vt in pairs(restoration.very_tiny_levels) do
		if skirmish_job_id == vt then
			map_scale_factor = 0.75
		end
	end
	for _,et in pairs(restoration.extremely_tiny_levels) do
		
		if skirmish_job_id == et then
			map_scale_factor = 0.55
		end
	end
	--Reduced spawns and kill requirment if playing in Solo offline
	if Global and Global.game_settings and Global.game_settings.single_player then
		map_scale_factor = map_scale_factor * 0.75
	end	
	
	self._required_kills = managers.groupai:state():_get_balancing_multiplier(tweak_data.skirmish.required_kills_balance_mul) * map_scale_factor * managers.groupai:state():_get_difficulty_dependent_value(tweak_data.skirmish.required_kills)
end)

Hooks:PostHook(SkirmishManager, "on_end_assault", "ResSkmEndAssault", function(self)
	--Just to be safe, better to have it in here rather than assault start
	self._captain_active = nil
end)

function SkirmishManager:set_captain_active()
	self._captain_active = true
end

--Update kill counter, end assault if kills required reached.
function SkirmishManager:do_kill()
	local groupai = managers.groupai:state()
	if not self._captain_active and groupai:chk_assault_active_atm() then
		self._required_kills = self._required_kills - 1

		if self._required_kills <= 0 then
			groupai:force_end_assault_phase(true)
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