

--[[
When you start your objective timer, call 
	managers.hud._hud_objectives:_set_mission_timer(objective_id,end_t,text)
with these arguments:

[objective_id]: string. the id of the current objective. if this objective_id does not match the current mission, the timer will deactivate.
[end_t]: number. The time shown on the mission clock, at which point this timer will reach 0.
[text]: string. Any words or objective descriptions that should appear.
	The timer will replace "&&TIMER" in this string, so that you can format it however you please.

Example:
	managers.hud._hud_objectives:_set_mission_timer("heist_man1",Application:time() + 30,"Get to the choppa in &&TIMER or else you're a furry!")

Side note: "heist_man1" is the first, "stealth" stage of Undercover
--]]

function HUDObjectives:_set_mission_timer(objective_id,end_t,text)
	self._current_timer_data = {
		id = objective_id,
		end_t = end_t,
		text = text
	}
	
--Resize the panel according to the largest time possible (timer start) so that text doesn't overflow off of the screen
	local objective_text = self._hud_panel:child("objectives_panel"):child("objective_text")
	objective_text:set_text(string.gsub(utf8.to_upper(text),"&&TIMER",end_t - Application:time()))
	local _, _, w, _ = objective_text:text_rect()	
	self._bg_box:stop()
	self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_right"), 0.66, w + 16, callback(self, self, "open_right_done", false))	
	
	managers.hud:add_updator(objective_id .. "_timer",callback(self,self,"update_objective_timer")) --add updator
end

function HUDObjectives:update_objective_timer(t,dt) 
	local data = self._current_timer_data
	
	if data and (data.id == self._active_objective_id) then
		local time_string = ""
		if data.end_t then
			local time_left = data.end_t - t
			local minutes = time_left / 60
			local seconds = time_left % 60
			if time_left < 0 then 
				minutes = 0
				seconds = 0
			end
			time_string = string.format("%02i:%02i",minutes,seconds)
		end
		
--		local objectives_panel = self._hud_panel:child("objectives_panel")
--		local objective_text = objectives_panel:child("objective_text")
		self._hud_panel:child("objectives_panel"):child("objective_text"):set_text(utf8.to_upper(string.gsub(data.text,"&&TIMER",time_string)))
--		objective_text:set_text(utf8.to_upper(string.gsub(data.text,"&&TIMER",time_string)))
	elseif data then 
--remove updator when objective changes
		managers.hud:remove_updator(data.id .. "_timer")
		self._current_timer_data = nil
	end
end
