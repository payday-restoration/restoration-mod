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
	self._intimidated_guards[guard_unit:id()] = {
		unit = guard_unit, -- Unit data.
		t = t, -- The time when the unit was intimidated.
		hints = { -- Used exclusively for the interaction text.
			time_left = 0, -- Time left before next check-in.
			sus_increase = 0 -- By how much will the next check-in increase suspicion.
		}
	}
end

function EnemyManager:unregister_intimidated_guard(guard_id)
	self._intimidated_guards[guard_id] = nil
end

--- Updates only the hints of the intimidated guard (hints being what are used to fill out the interaction text).
--- @param id UnitID The unit's ID, typically obtained with unit:id(). Used for index determination.
--- @param time_left number Seconds left before the next check-in.
--- @param sus_increase number Number between 0-1, the amount the suspicion meter will be increased by. Percentage of the suspicion meter, not related to the internal values -- so 0.5 will *always* mean 50% suspicion increase, no matter what difficulty.
function EnemyManager:update_intimidated_guard_hints(id, time_left, sus_increase)
	if self._intimidated_guards[id] then
		self._intimidated_guards[id].hints = {
			time_left = time_left,
			sus_increase = sus_increase
		}
	end
end

function EnemyManager:decode_intimidated_guard_units(unit_id, time)

	local units = World:find_units_quick("all", managers.slot:get_mask("hostages"))
	for _, unit in pairs(units) do
		if tonumber(unit:id()) == tonumber(unit_id) then
			self:register_intimidated_guard(unit, tonumber(time))
			return
		end
	end
end

function EnemyManager:update_intimidated_guard_data_to_peer(peer)
	if peer:ip_verified() then
		for unit_id, data in pairs(self._intimidated_guards) do
			if data.t and data.unit then
				LuaNetworking:SendToPeers("sync_intimidated_guard_data",data.unit:id(), tostring(data.t))
			end
		end
	end
end

Hooks:PreHook(EnemyManager, "on_enemy_destroyed", "ResOnEnemyDestroyed", function(self, enemy)
	self:unregister_intimidated_guard(enemy:id())
end)