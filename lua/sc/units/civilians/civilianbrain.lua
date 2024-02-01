--Add more alert types to Civilians
function CivilianBrain:on_cool_state_changed(state)
	if self._logic_data then
		self._logic_data.cool = state
	end

	if self._alert_listen_key then
		managers.groupai:state():remove_alert_listener(self._alert_listen_key)
	else
		self._alert_listen_key = "CopBrain" .. tostring(self._unit:key())
	end

	local alert_listen_filter, alert_types = nil

	if state then
		alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminals_enemies_civilians")
		alert_types = {
			vo_distress = true,
			fire = true,
			bullet = true,
			vo_intimidate = true,
			explosion = true,
			footstep = true,
			aggression = true,
			vo_cbt = true
		}
	else
		alert_listen_filter = managers.groupai:state():get_unit_type_filter("criminal")
		alert_types = {
			explosion = true,
			fire = true,
			aggression = true,
			bullet = true
		}
	end

	managers.groupai:state():add_alert_listener(self._alert_listen_key, callback(self, self, "on_alert"), alert_listen_filter, alert_types, self._unit:movement():m_head_pos())
end

Hooks:PostHook(CivilianBrain, "on_hostage_move_interaction", "on_hostage_move_interaction_mutator_no_outlines", function (self,interacting_unit, command)
	local disable_outlines = managers.mutators:modify_value("CivilianBrain:DisableOutlines", false)
	if disable_outlines then
		self._unit:contour():remove("friendly", true)
	end
end)