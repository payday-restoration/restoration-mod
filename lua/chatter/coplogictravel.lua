local killdapowa = {
	['e_so_pull_lever'] = true,
	['e_so_pull_lever_var2'] = true
}
local math_random = math.random
local react_aim = AIAttentionObject.REACT_AIM

Hooks:PostHook(CopLogicTravel, "upd_advance", "RR_upd_advance", function(data)
	local my_data = data.internal_data
	local chatter = data.char_tweak.chatter
	local focus_enemy = data.attention_obj
	if chatter and not data.is_converted and not data.unit:sound():speaking(data.t) and my_data.coarse_path and not my_data.warp_pos and not my_data.advancing and (not focus_enemy or react_aim > focus_enemy.reaction or not focus_enemy.verified_t or data.t - focus_enemy.verified_t > 5) then -- we're not speaking, not currently going to move anywhere and don't see any criminals
		local objective = data.objective
		if data.cool then -- don't try and play approachingspecial or clear lines if we're cool
			if chatter.clear_whisper then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "clear_whisper_1" or "clear_whisper_2") -- report in saying everything is good
			end
		elseif objective and objective.grp_objective and objective.grp_objective.type == "recon_area" then -- we want after the loot or the hostages
			local hostage_count = managers.groupai:state():hostage_count()
			if hostage_count > 0 then
				if hostage_count > 3 then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic2")
				elseif managers.groupai:state():chk_has_civilian_hostages() then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "civilianpanic")
				else
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic1")
				end
			elseif managers.groupai:state():chk_had_hostages() then
				managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "hostagepanic3")
			end
		elseif chatter.approachingspecial then -- else we're going after the criminals, not the loot or hostages
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "approachingspecial") -- announce ourself to the criminals
		elseif chatter.clear then -- might be a good idea to also check whether there's a criminal in our current (maybe neighbours too) navsegment
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "clear") -- no criminals, clear!
			--log("clear!!")
		end
	end
end)

-- to ensure they play these lines as they start moving towards their final destination, to free a hostage for example
Hooks:PostHook(CopLogicTravel, "_chk_request_action_walk_to_advance_pos", "RR_chk_request_action_walk_to_advance_pos", function(data, my_data)
	local objective = data.objective
	if objective and not data.is_converted and not data.cool and not data.unit:sound():speaking(data.t) and not managers.skirmish:is_skirmish() and my_data.advancing and my_data.coarse_path and my_data.coarse_path_index and my_data.coarse_path_index >= #my_data.coarse_path - 1 then
		local chatter = data.char_tweak.chatter
		local grp_objective = objective.grp_objective
		if objective.chatter_type and chatter[objective.chatter_type] then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, objective.chatter_type)
		elseif grp_objective and grp_objective.chatter_type and chatter[grp_objective.chatter_type] then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, grp_objective.chatter_type)
		elseif objective.action and killdapowa[objective.action.variant] and chatter.sabotagepower then -- best way i can think of implementing this at the moment
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "sabotagepower")
		end
	end
end)

Hooks:PreHook(CopLogicTravel, "_on_destination_reached", "RR_on_destination_reached", function(data)
	local objective = data.objective
	local chatter = data.char_tweak.chatter
	if objective.type ~= "flee" and (not objective.grp_objective or objective.grp_objective.type ~= "retire") and chatter and (chatter.inpos or chatter.ready) and not data.is_converted and not data.cool and not data.unit:sound():speaking(data.t) then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "ready" or "inpos") -- Ready! / I'm in position!
	end
end)