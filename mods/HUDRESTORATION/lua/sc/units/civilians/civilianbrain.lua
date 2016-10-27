if restoration.Options:GetValue("SC/SC") then

function CivilianBrain:on_intimidated(n, unit)
	CivilianBrain.super.on_intimidated(self, n, unit)
	if Network:is_server() then
		managers.groupai:state():propagate_alert({
			"vo_distress",
			unit:movement():m_head_pos(),
			600,
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			unit
		})
	end
end

end