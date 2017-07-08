if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

-- Tracks the cooldowns of each group type, will be populated by the GroupAIStateBesiege:_spawn_in_group() hook 
local group_timestamps = {}

-- Example contents with haphazardly chosen cooldowns, add more group types and adjust as desired
local group_cooldowns = {
	Cap_Spring = 1500
}
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
if difficulty_index == 4 then
	group_cooldowns = {
		Cap_Spring = 1800
	}
elseif difficulty_index == 5 then
	group_cooldowns = {
		Cap_Spring = 1500
	}
elseif difficulty_index == 6 then
	group_cooldowns = {
		Cap_Spring = 1200
	}
elseif difficulty_index == 7 then
	group_cooldowns = {
		Cap_Spring = 900
	}
elseif difficulty_index == 8 then
	group_cooldowns = {
		Cap_Spring = 600
	}
else
	group_cooldowns = {
		Cap_Spring = 1800
	}
end
-- Ditto, adjust as desired. Affects all groups not listed in group_cooldowns above
local default_cooldown = 0

local _choose_best_groups_actual = GroupAIStateBesiege._choose_best_groups
function GroupAIStateBesiege:_choose_best_groups(best_groups, group, group_types, allowed_groups, weight, ...)
	local new_allowed_groups = {}
	local currenttime = Application:time()
	-- Remember not to modify allowed_groups nor its subtables, otherwise you'll unknowingly be altering
	-- tweak_data.group_ai.besiege.recon.groups instead
	for group_type, cat_weights in pairs(allowed_groups) do
		local previoustimestamp = group_timestamps[group_type]
		local cooldown = group_cooldowns[group_type] or default_cooldown
			if previoustimestamp == nil or (currenttime - previoustimestamp) > cooldown then
			-- Cooldown has expired for this group type, copy the subtable reference to the new_allowed_groups table (the same
			-- rule applies - do not modify the subtable or you'll be affecting global state, which will make debugging the cause
			-- a nightmare)
			new_allowed_groups[group_type] = cat_weights
        	end
    	end

	-- Call the original function with the manipulated list
	return _choose_best_groups_actual(self, best_groups, group, group_types, new_allowed_groups, weight, ...)
end

-- Simple wrapper function to identify the winning candidate group that was actually selected and spawned in, and when they were
-- spawned in
local _spawn_in_group_actual = GroupAIStateBesiege._spawn_in_group
function GroupAIStateBesiege:_spawn_in_group(spawn_group, spawn_group_type, ...)
	group_timestamps[spawn_group_type] = Application:time()

	return _spawn_in_group_actual(self, spawn_group, spawn_group_type, ...)
end

function GroupAIStateBesiege:_check_spawn_phalanx()
	if self._task_data and self._task_data.assault.active and self._phalanx_center_pos and not self._phalanx_spawn_group then
		if self._task_data.assault.phase == "build" or self._task_data.assault.phase == "sustain" then
		local now = TimerManager:game():time()
		local respawn_delay = tweak_data.group_ai.phalanx.spawn_chance.respawn_delay
		if not self._phalanx_despawn_time or now >= self._phalanx_despawn_time + respawn_delay then
			local spawn_chance_start = tweak_data.group_ai.phalanx.spawn_chance.start
			self._phalanx_current_spawn_chance = self._phalanx_current_spawn_chance or spawn_chance_start
			self._phalanx_last_spawn_check = self._phalanx_last_spawn_check or now
			self._phalanx_last_chance_increase = self._phalanx_last_chance_increase or now
			local spawn_chance_increase = tweak_data.group_ai.phalanx.spawn_chance.increase
			local spawn_chance_max = tweak_data.group_ai.phalanx.spawn_chance.max
			if spawn_chance_max > self._phalanx_current_spawn_chance and spawn_chance_increase > 0 then
				local chance_increase_intervall = tweak_data.group_ai.phalanx.chance_increase_intervall
				if now >= self._phalanx_last_chance_increase + chance_increase_intervall then
					self._phalanx_last_chance_increase = now
					self._phalanx_current_spawn_chance = math.min(spawn_chance_max, self._phalanx_current_spawn_chance + spawn_chance_increase)
					print("Phalanx spawn chance increased to ", self._phalanx_current_spawn_chance)
				end
			else
			end
			if self._phalanx_current_spawn_chance > 0 then
				local check_spawn_intervall = tweak_data.group_ai.phalanx.check_spawn_intervall
				if now >= self._phalanx_last_spawn_check + check_spawn_intervall then
					self._phalanx_last_spawn_check = now
					print("Spawn chance roll...")
					if math.random() <= self._phalanx_current_spawn_chance then
						self:_spawn_phalanx()
					else
						print("Spawn chance roll failed!")
					end
				end
			end
		end
	end
	else
	end
end

end