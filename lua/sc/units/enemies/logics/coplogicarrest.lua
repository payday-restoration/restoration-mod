-- Stop shooting when entering arrest logic
Hooks:PostHook(CopLogicArrest, "enter", "sh_enter", function (data)
	data.unit:movement():set_allow_fire(false)
end)

--[[
function CopLogicArrest._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
	local all_attention_objects = data.detected_attention_objects
	local arrest_targets = my_data.arrest_targets

	CopLogicArrest._verify_arrest_targets(data, my_data)

	local new_attention, new_prio_slot, new_reaction = CopLogicArrest._get_priority_attention(data, data.detected_attention_objects)
	local old_att_obj = data.attention_obj

	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)

	local should_arrest = new_reaction == AIAttentionObject.REACT_ARREST
	local should_stand_close = new_reaction == AIAttentionObject.REACT_SCARED or new_attention and new_attention.criminal_record and new_attention.criminal_record.status

	if should_arrest ~= my_data.should_arrest or should_stand_close ~= my_data.should_stand_close then
		my_data.should_arrest = should_arrest
		my_data.should_stand_close = should_stand_close

		CopLogicArrest._cancel_advance(data, my_data)
	end

	if should_arrest and not my_data.arrest_targets[new_attention.u_key] then
		my_data.arrest_targets[new_attention.u_key] = {
			attention_obj = new_attention
		}

		managers.groupai:state():on_arrest_start(data.key, new_attention.u_key)
	end

	CopLogicArrest._mark_call_in_event(data, my_data, new_attention)
	CopLogicArrest._chk_say_discovery(data, my_data, new_attention)

	if not my_data.should_arrest and not my_data.should_stand_close then
		my_data.in_position = true
	end

	local current_attention = data.unit:movement():attention()

	if new_attention and not current_attention or current_attention and not new_attention or new_attention and current_attention.u_key ~= new_attention.u_key then
		if new_attention then
			CopLogicBase._set_attention(data, new_attention)
		else
			CopLogicBase._reset_attention(data)
		end
	end

	if new_reaction ~= AIAttentionObject.REACT_ARREST then
		if (not new_reaction or new_reaction < AIAttentionObject.REACT_SHOOT or not new_attention.verified or new_attention.dis >= 1500) and (my_data.in_position or not my_data.should_arrest and not my_data.should_stand_close) then
			if data.char_tweak.calls_in and my_data.next_action_delay_t < data.t and not managers.groupai:state():is_police_called() and not my_data.calling_the_police and not my_data.turning and not data.unit:sound():speaking(data.t) and not data.unit:unit_data().has_called_police then --Added a check for has_called_police so they don't bother trying to call in again if help is on the way
				CopLogicArrest._call_the_police(data, my_data, true)

				return
			end

			if (managers.groupai:state():is_police_called() or managers.groupai:state():chk_enemy_calling_in_area(managers.groupai:state():get_area_from_nav_seg_id(data.unit:movement():nav_tracker():nav_segment()), data.key)) and not my_data.calling_the_police then
				local wanted_state = CopLogicBase._get_logic_state_from_reaction(data) or "idle"

				CopLogicBase._exit(data.unit, wanted_state)
				CopLogicBase._report_detections(data.detected_attention_objects)

				return
			end
		else
			local wanted_state = CopLogicBase._get_logic_state_from_reaction(data)

			if wanted_state and wanted_state ~= data.name then
				if my_data.calling_the_police then
					local action_data = {
						body_part = 3,
						type = "idle"
					}

					data.unit:brain():action_request(action_data)
				end

				CopLogicBase._exit(data.unit, wanted_state)
				CopLogicBase._report_detections(data.detected_attention_objects)

				return
			end
		end
	end
end

function CopLogicArrest._call_the_police(data, my_data, paniced)
	local action = {
		variant = "arrest_call",
		body_part = 1,
		type = "act",
		blocks = {
			aim = -1,
			action = -1,
			walk = -1
		}
	}
	my_data.calling_the_police = data.unit:movement():action_request(action)
	
	if my_data.calling_the_police then
		managers.groupai:state():on_criminal_suspicion_progress(nil, data.unit, "calling")
		
		if my_data.calling_the_police and data.char_tweak.has_alarm_pager then
			data.unit:unit_data().has_alarm_pager = true
		end		
	end

	CopLogicArrest._say_call_the_police(data, my_data)	
end
]]--