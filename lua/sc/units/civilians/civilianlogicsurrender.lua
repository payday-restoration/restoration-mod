--Makes Civs get down when sentries are nearby
--Thanks Rocker
Hooks:PostHook(CivilianLogicSurrender,"_update_enemy_detection","stc_upd_sentry_aura",function(data,my_data) --self? what's a "self"

	local civ_pos = data.unit:movement():m_head_pos()	
	local all_deployables = World:find_units_quick("all",25)
	local dis_sentry = 1400 --max distance that sentries can intimidate at; would be a good name for a disease
	for k,unit in pairs(all_deployables) do 
		if not (unit and alive(unit)) then return end
		local this_dis = mvector3.direction(Vector3(),unit:position(),civ_pos)
--		local this_dis = mvector3.distance_sq(unit:position(),civ_pos)

		if this_dis < dis_sentry then 
			my_data.inside_intimidate_aura = true
			my_data.submission_meter = my_data.submission_max
			break
		end
	end
	
end)

-- Fix civilians not following once they stopped
Hooks:PostHook(CivilianLogicSurrender, "enter", "sh_enter", function (data)
	if data.name == "surrender" and data.objective and data.objective.type == "follow" and not data.internal_data.surrender_clbk_registered then
		managers.groupai:state():add_to_surrendered(data.unit, callback(CivilianLogicSurrender, CivilianLogicSurrender, "queued_update", data))
		data.internal_data.surrender_clbk_registered = true
	end
end)

-- Make civilians get down more consistently
-- If we have shouted at them and that shout would intimidate but not make them drop, run the function again after a short delay
Hooks:PostHook(CivilianLogicSurrender, "_delayed_intimidate_clbk", "sh__delayed_intimidate_clbk", function (ignore_this, params)
	local data = params[1]
	if data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local anim_data = data.unit:anim_data()
	if anim_data.drop then
		return
	end

	-- Set amount to 0 for automatic consecutive calls
	params[2] = 0

	local my_data = data.internal_data
	my_data.delayed_intimidate_id = "intimidate" .. tostring(data.unit:key())
	CopLogicBase.add_delayed_clbk(my_data, my_data.delayed_intimidate_id, callback(CivilianLogicSurrender, CivilianLogicSurrender, "_delayed_intimidate_clbk", params), TimerManager:game():time() + 0.1 + math.random() * 0.4)
end)


-- Fix civs randomly popping up to standing position and rework scared screams
function CivilianLogicSurrender.on_alert(data, alert_data)
	local alert_type = alert_data[1]
	if alert_type ~= "aggression" and alert_type ~= "bullet" and alert_type ~= "explosion" then
		return
	end

	local aggressor = alert_data[5]
	if not data.is_tied and aggressor and aggressor:base() and CopLogicBase.is_alert_aggressive(alert_type) then
		local is_intimidation
		if aggressor:base().is_local_player then
			is_intimidation = managers.player:has_category_upgrade("player", "civ_calming_alerts")
		elseif aggressor:base().is_husk_player then
			is_intimidation = aggressor:base():upgrade_value("player", "civ_calming_alerts")
		end

		if is_intimidation then
			data.brain:on_intimidated(1, aggressor)
			return
		end
	end

	data.t = TimerManager:game():time()

	if not CopLogicBase.is_alert_dangerous(alert_type) then
		return
	end

	local my_data = data.internal_data
	local scare_modifier = data.char_tweak.scare_shot

	local anim_data = data.unit:anim_data()
	if anim_data.halt or anim_data.react or anim_data.stand then
		scare_modifier = scare_modifier * 4
	end

	my_data.scare_meter = math.min(my_data.scare_max, my_data.scare_meter + scare_modifier)

	if data.is_tied and anim_data.stand then
		data.unit:sound():say(math.random() < 0.5 and "a01x_any" or "a02x_any", true)
		data.brain:on_hostage_move_interaction(aggressor, "stay")
	elseif not my_data.scream_t or data.t < my_data.scream_t and not data.unit:sound():speaking(data.t) then
		local alert_dis_sq = mvector3.distance_sq(data.m_pos, alert_data[2])
		local max_scare_dis_sq = 4000000

		if alert_dis_sq < max_scare_dis_sq then
			local dis_mul = math.map_range(alert_dis_sq, 0, max_scare_dis_sq, 1, 0)
			local scare_mul = math.map_range(my_data.scare_meter, 0, my_data.scare_max, 0.5, 1)
			local time_mul = math.map_range_clamped(my_data.scream_t and data.t - my_data.scream_t or 0, 0, 8, 0.5, 1)

			if math.random() < dis_mul * scare_mul * time_mul then
				data.unit:sound():say(math.random() < 0.5 and "a01x_any" or "a02x_any", true)
				my_data.scream_t = data.t + 4
			end
		end
	end
end