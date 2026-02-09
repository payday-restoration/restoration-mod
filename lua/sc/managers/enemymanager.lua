function EnemyManager:start_autumn_blackout()
	--deprecated
	restoration.log_shit("SC: HEY YOU!!!!!!!!!!!! YOU CALLED EnemyManager:start_autumn_blackout(), DON'T DO THAT!! use groupaistate:do_blackout(true) or related functions instead!")
end

function EnemyManager:end_autumn_blackout()
	--deprecated
	restoration.log_shit("SC: HEY YOU!!!!!!!!!!!! YOU CALLED EnemyManager:end_autumn_blackout(), DON'T DO THAT!! use groupaistate:do_blackout(false) or related functions instead!")
end

--Stuff for mutators
Hooks:PostHook(EnemyManager, "on_enemy_died", "ResOnEnemyDied", function(self, dead_unit, damage_info)
	if Network:is_server() and managers.mutators:is_mutator_active(MutatorBirthday) and dead_unit:base():has_tag("special") and managers.mutators:is_mutator_active(MutatorBirthday) then
		local birthday_mutator = managers.mutators:get_mutator(MutatorBirthday)

		birthday_mutator:on_special_killed(dead_unit)
	end
	
	if managers.mutators:is_mutator_active(MutatorCG22) and dead_unit:base():has_tag("snowman") then
		local cg22_mutator = managers.mutators:get_mutator(MutatorCG22)

		cg22_mutator:on_snowman_killed(dead_unit, damage_info)
	end
	
	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		local piggyrevenge_mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)

		if Network:is_server() and piggyrevenge_mutator:can_spawn_bag() then
			piggyrevenge_mutator:on_enemy_killed(dead_unit, damage_info)
		end

		if dead_unit:base():has_tag("eventboss") then
			piggyrevenge_mutator:on_boss_killed(dead_unit, damage_info)
		end
	end
	
end)

-- For intimidated guards checking in with the pager operators.

Hooks:PostHook(EnemyManager, "_init_enemy_data", "res_init_enemy_data", function(self)
	--- Contains the actual data about intimidated guards.
	self._intimidated_guards = {}
end)

function EnemyManager:all_intimidated_guards()
	return self._intimidated_guards
end

function EnemyManager:register_intimidated_guard(guard_unit, t)
	self._intimidated_guards[guard_unit:key()] = {
		unit = guard_unit, -- Unit data.
		t = t, -- The time when the unit was intimidated.
		hints = { -- Used exclusively for the interaction text.
			time_left = 0, -- Time left before next check-in.
			sus_increase = 0 -- By how much will the next check-in increase suspicion.
		}
	}
end

function EnemyManager:unregister_intimidated_guard(guard_unit)
	self._intimidated_guards[guard_unit:key()] = nil
end

--- Updates only the hints of the intimidated guard (hints being what are used to fill out the interaction text).
--- @param key Key The unit's key, typically obtained with unit:key(). Used for index determination.
--- @param time_left number Seconds left before the next check-in.
--- @param sus_increase number Number between 0-1, the amount the suspicion meter will be increased by. Percentage of the suspicion meter, not related to the internal values -- so 0.5 will *always* mean 50% suspicion increase, no matter what difficulty.
function EnemyManager:update_intimidated_guard_hints(key, time_left, sus_increase)
	if self._intimidated_guards[key] then
		self._intimidated_guards[key].hints = {
			time_left = time_left,
			sus_increase = sus_increase
		}
	end
end