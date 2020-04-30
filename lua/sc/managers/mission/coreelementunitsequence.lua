core:module("CoreElementUnitSequence")
core:import("CoreMissionScriptElement")
core:import("CoreCode")
core:import("CoreUnit")

ElementUnitSequence = ElementUnitSequence or class(CoreMissionScriptElement.MissionScriptElement)

local orig_ElementUnitSequence_on_executed = ElementUnitSequence.on_executed
function ElementUnitSequence:on_executed(...)

	if self._values.enabled and Global.game_settings and not Network:is_client() then
		local level_id = Global.game_settings.level_id
		if level_id == "big" then
			if self._id == 106265 then
				return
			end
		elseif level_id == "four_stores" then
			if self._id == 103683 then
				return
			end
		elseif level_id == "welcome_to_the_jungle_1" or level_id == "welcome_to_the_jungle_1_night" then
			if self._id == 101301 then
				return
			end
		elseif level_id == "family" then
			if self._id == 102211 then
				return
			end
		end
	end
	
	orig_ElementUnitSequence_on_executed(self, ...)
end