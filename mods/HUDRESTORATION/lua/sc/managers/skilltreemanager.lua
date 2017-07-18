if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	SkillTreeManager.VERSION = 69

end

function SkillTreeManager:load(data, version)
	local state = data.SkillTreeManager
	local allow_reset = false
	local game_updated_call_the_police = false -- we are the police
	the_skilltree = {}
	if SkillTreeManager.VERSION ~= 9 and SkillTreeManager.VERSION ~= 69 then
		game_updated_call_the_police = true
		RestorationCore.log_shit("SC: GAME UPDATE SEND IN THE CAPTAIN")
	end
	if (SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC")) and not game_updated_call_the_police then
		if state.VERSION ~= 69 then
			RestorationCore.log_shit("SC: Enabled, incorrect version! Trying to load save file.")
			RestorationCore.log_shit("SC: Enabled, version is " .. state.VERSION)
			if SystemFS:exists("mods/saves/SCSkillTree.json") then
				RestorationCore.log_shit("SC: Enabled, Found save file! Loading.")
				dont_reset = true
				local sc_save = io.open(SavePath .. "SCSkillTree.json", "r")
				the_skilltree = json.decode(sc_save:read())
				sc_save:close()
				RestorationCore.log_shit("SC: Enabled, New save file is " .. the_skilltree.VERSION)
				local vanilla_save = io.open(SavePath .. "VanillaSkillTree.json", "w+")
				vanilla_save:write(json.encode(data.SkillTreeManager))
				vanilla_save:close()
				if the_skilltree.VERSION ~= 69 then
					RestorationCore.log_shit("SC: Enabled, SAVE FILE IS INCORRECT VERSION!!! Resetting!")
					allow_reset = true
				else
					state = the_skilltree
				end
			else
				RestorationCore.log_shit("SC: Enabled, Couldn't find save file! Resetting.")
				allow_reset = true
			end
		end
	elseif not game_updated_call_the_police then
		if state.VERSION ~= 9 then
			RestorationCore.log_shit("SC: Disabled, incorrect version! Trying to load save file.")
			RestorationCore.log_shit("SC: Disabled, version is " .. state.VERSION)
			if SystemFS:exists("mods/saves/VanillaSkillTree.json") then
				RestorationCore.log_shit("SC: Disabled, Found save file! Loading.")
				dont_reset = true
				local vanilla_save = io.open(SavePath .. "VanillaSkillTree.json", "r")
				the_skilltree = json.decode(vanilla_save:read())
				vanilla_save:close()
				RestorationCore.log_shit("SC: Disabled, New save file is " .. the_skilltree.VERSION)
				local sc_save = io.open(SavePath .. "SCSkillTree.json", "w+")
				sc_save:write(json.encode(data.SkillTreeManager))
				sc_save:close()
				if the_skilltree.VERSION ~= 9 then
					RestorationCore.log_shit("SC: Disabled, SAVE FILE IS INCORRECT VERSION!!! Resetting!")
					allow_reset = true
				else
					state = the_skilltree
				end
			else
				RestorationCore.log_shit("SC: Disabled, Couldn't find save file! Resetting.")
				allow_reset = true
			end
		end
	end

	local points_aquired_during_load = self:points()
	if state then
		if state.specializations then
			state.specializations = data.SkillTreeManager.specializations -- jesus christ
			self._global.specializations.total_points = state.specializations.total_points or self._global.specializations.total_points
			self._global.specializations.points = state.specializations.points or self._global.specializations.points
			self._global.specializations.points_present = state.specializations.points_present or self._global.specializations.points_present
			self._global.specializations.xp_present = state.specializations.xp_present or self._global.specializations.xp_present
			self._global.specializations.xp_leftover = state.specializations.xp_leftover or self._global.specializations.xp_leftover
			self._global.specializations.current_specialization = state.specializations.current_specialization or self._global.specializations.current_specialization
			for tree, data in ipairs(state.specializations) do
				if self._global.specializations[tree] then
					self._global.specializations[tree].points_spent = data.points_spent or self._global.specializations[tree].points_spent
				end
			end
		end
		if state.skill_switches then
			self._global.selected_skill_switch = state.selected_skill_switch or 1
			for i, data in pairs(state.skill_switches) do
				if self._global.skill_switches[i] then
					self._global.skill_switches[i].unlocked = data.unlocked
					self._global.skill_switches[i].name = data.name or self._global.skill_switches[i].name
					self._global.skill_switches[i].points = data.points or self._global.skill_switches[i].points
					self._global.skill_switches[i].specialization = data.unlocked and (data.specialization or self._global.specializations.current_specialization) or false
					for tree_id, tree_data in pairs(data.trees) do
						self._global.skill_switches[i].trees[tree_id] = tree_data
					end
					for skill_id, skill_data in pairs(data.skills) do
						if self._global.skill_switches[i].skills[skill_id] then
							self._global.skill_switches[i].skills[skill_id].unlocked = skill_data.unlocked
						end
					end
				end
			end
		else
			self._global.selected_skill_switch = 1
			self._global.skill_switches[1].points = state.points
			self._global.skill_switches[1].specialization = data.unlocked and self._global.specializations.current_specialization or false
			for tree_id, tree_data in pairs(state.trees) do
				self._global.skill_switches[1].trees[tree_id] = tree_data
			end
			for skill_id, skill_data in pairs(state.skills) do
				if self._global.skill_switches[1].skills[skill_id] then
					self._global.skill_switches[1].skills[skill_id].unlocked = skill_data.unlocked
				end
			end
		end
		self:_verify_loaded_data(points_aquired_during_load)
		self._global.VERSION = state.VERSION
		self._global.reset_message = state.reset_message
		self._global.times_respeced = state.times_respeced
		if (not self._global.VERSION or self._global.VERSION ~= SkillTreeManager.VERSION) and allow_reset or game_updated_call_the_police then
			managers.savefile:add_load_done_callback(callback(self, self, "version_reset_skilltrees", points_aquired_during_load))
		end
	end
end
function SkillTreeManager:version_reset_skilltrees(points_aquired_during_load)
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		RestorationCore.log_shit("SC: Enabled, Saving Disabled skills before reset.")
		local vanilla_save = io.open(SavePath .. "VanillaSkillTree.json", "w+")
		vanilla_save:write(json.encode(self._global))
		vanilla_save:close()
	else
		RestorationCore.log_shit("SC: Disabled, Saving Enabled skills before reset.")
		local sc_save = io.open(SavePath .. "SCSkillTree.json", "w+")
		sc_save:write(json.encode(self._global))
		sc_save:close()
	end
	self:reset_skilltrees()
	self:_verify_loaded_data(points_aquired_during_load)
	self._global.VERSION = SkillTreeManager.VERSION
	self._global.reset_message = true
	self._global.times_respeced = 1
	if SystemInfo:distribution() == Idstring("STEAM") then
		managers.statistics:publish_skills_to_steam()
	end
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		RestorationCore.log_shit("SC: Enabled, saving skills.")
		local sc_save = io.open(SavePath .. "SCSkillTree.json", "w+")
		sc_save:write(json.encode(self._global))
		sc_save:close()
	else
		RestorationCore.log_shit("SC: Disabled, saving skills.")
		local vanilla_save = io.open(SavePath .. "VanillaSkillTree.json", "w+")
		vanilla_save:write(json.encode(self._global))
		vanilla_save:close()
	end
end