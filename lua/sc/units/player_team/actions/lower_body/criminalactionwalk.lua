if SystemFS:exists("mods/Better Bots/mod.txt") then
	return
end

function CriminalActionWalk:init(action_desc, common_data)
	if common_data.ext_movement:carrying_bag() then
		local can_run = true

		if not can_run and action_desc.variant == "run" then
			action_desc.variant = "walk"
		end
	end

	return CriminalActionWalk.super.init(self, action_desc, common_data)
end

function CriminalActionWalk:_get_max_walk_speed()
	local speed = deep_clone(CriminalActionWalk.super._get_max_walk_speed(self))
	
	if self._ext_movement:carrying_bag() then
		local carry_mod = tweak_data.carry.types[tweak_data.carry[self._ext_movement:carry_id()].type].move_speed_modifier
		local speed_modifier = (carry_mod * 1.5) > 1 and 1 or carry_mod
		for k = 1, #speed do
			local v = speed[k]
			v = v * speed_modifier
		end
	end
	
	return speed
end

function CriminalActionWalk:_get_current_max_walk_speed(move_dir)
	local speed = CriminalActionWalk.super._get_current_max_walk_speed(self, move_dir)
	
	if self._ext_movement:carrying_bag() then
		local carry_mod = tweak_data.carry.types[tweak_data.carry[self._ext_movement:carry_id()].type].move_speed_modifier
		local speed_modifier = (carry_mod * 1.5) > 1 and 1 or carry_mod
		speed = speed * speed_modifier
	end
	
	return speed
end