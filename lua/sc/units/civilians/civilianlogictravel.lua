if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_exact = CivilianLogicTravel._determine_exact_destination
	function CivilianLogicTravel._determine_exact_destination(data, objective, ...)
		if objective then
			if objective.type == "follow" then
				local follow_unit = objective.follow_unit
				if follow_unit then
					local to_pos = follow_unit:movement():nav_tracker():field_position()
					return to_pos
				end
			end
		end
		return old_exact(data, objective, ...)
	end	

end