Modifier10SecondsResponseTime = Modifier10SecondsResponseTime or class(BaseModifier)
Modifier10SecondsResponseTime._type = "Modifier10SecondsResponseTime"
Modifier10SecondsResponseTime.name_id = "none"
Modifier10SecondsResponseTime.desc_id = "menu_cs_modifier_10secondsresponsetime"


function Modifier10SecondsResponseTime:modify_value(id, value)
    if id == "GroupAIStateBase:CheckingDiff" then
		return 1
	end
	return value
end