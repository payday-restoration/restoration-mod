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