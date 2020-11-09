--[[

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
	end

	CopLogicArrest._say_call_the_police(data, my_data)
end

]]--