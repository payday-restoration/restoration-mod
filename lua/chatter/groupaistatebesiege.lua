local math_random = math.random

function GroupAIStateBesiege:chk_has_civilian_hostages()
	return self._hostage_headcount - self._police_hostage_headcount > 0
end

function GroupAIStateBesiege:chk_had_hostages()
	return self._had_hostages
end

function GroupAIStateBesiege:chk_assault_active_atm()
	local assault_task = self._task_data.assault
	return assault_task and (assault_task.phase == "build" or assault_task.phase == "sustain" or assault_task.phase == "fade")
end
	
-- Assault/Rescue team going in lines
function GroupAIStateBesiege:_voice_groupentry(group, recon)
	local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
	if group_leader_u_data and group_leader_u_data.char_tweak.chatter.entry then
		self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, recon and "hrt" .. math_random(1, 4) or "cs" .. math_random(1, 4))
	end
end

Hooks:PreHook(GroupAIStateBesiege, "_set_objective_to_enemy_group", "RR_set_objective_to_enemy_group", function(self, group, grp_objective)
	if grp_objective.type == "recon_area" then
		local target_area = grp_objective.target_area or grp_objective.area
		grp_objective.chatter_type = target_area and (target_area.loot and "sabotagebags" or target_area.hostages and "sabotagehostages")
	end
end)

Hooks:PostHook(GroupAIStateBesiege, "_perform_group_spawning", "RR_perform_group_spawning", function(self, spawn_task)
	if spawn_task.group.has_spawned then
		self:_voice_groupentry(spawn_task.group, spawn_task.group.objective.type == "recon_area") -- so it doesn't depend on setting this up in groupaitweakdata anymore as well as being more accurate to the group's actual intent
	end
end)

Hooks:PostHook(GroupAIStateBesiege, "_end_regroup_task", "RR_end_regroup_task", function(self)
	self._had_hostages = self._hostage_headcount > 3
end)

Hooks:PreHook(GroupAIStateBesiege, "_assign_group_to_retire", "RR_assign_group_to_retire", function(self, group)
	if group.objective.type == "assault_area" then
		local group_leader_u_key, group_leader_u_data = self._determine_group_leader(group.units)
		if group_leader_u_data and group_leader_u_data.char_tweak.chatter.retreat then
			self:chk_say_enemy_chatter(group_leader_u_data.unit, group_leader_u_data.m_pos, "retreat")
		end
	end
end)