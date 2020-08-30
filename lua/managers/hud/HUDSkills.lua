HUDSkill = HUDSkill or class()
local skill_atlas = 'guis/textures/pd2/skilltree/icons_atlas'
local perk_atlas = 'guis/textures/pd2/specialization/icons_atlas'

function HUDSkill:init(hud)
	self._hud_panel = hud.panel

	self._skill_panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel:panel({ --Parent panel to hold skills.
		name = "skill_panel",
		layer = 0,
		visible = true,
		color = Color(0, 0, 255),
		w = 1000,
		h = 1000,
		y = self._hud_panel:center_y() * 0.3
	})

	self._icon_size = math.floor(restoration.Options:GetValue("HUD/INFOHUD/Info_Size")) --The "step" field doesn't seem to work???
	self._row_count = math.floor(restoration.Options:GetValue("HUD/INFOHUD/Info_Count"))
	self._padding = 2
	self._active_skills = {}
	self._durations = {}
	self._start_times = {}
	self._stacks = {}
end

--Adds a new skill to the list.
function HUDSkill:add_skill(name)
	--Ignore skills already on the list.
	if self:_check_skill_active(name) then
		return
	end

	local y_offset = (self._icon_size + self._padding) * (#self._active_skills % self._row_count) --Shunt new icon downwards until it's no longer clipping with stuff.
	local x_offset = (self._icon_size + self._padding) * math.floor(#self._active_skills / self._row_count) --Overflow in case there are too many buffs to handle in 1 column.
	local skill_icon = self._skill_panel:bitmap({
		texture = "guis/textures/pd2/skilltree/info_" .. name,
		name = name .. "_icon",
		layer = 2,
		render_template = "VertexColorTexturedRadial",
		color = Color(0.8, 1, 1, 1),
		h = self._icon_size,
		w = self._icon_size,
		x = x_offset,
		y = y_offset --Move posit
	})
	local background = self._skill_panel:bitmap({
		texture = 'guis/textures/restoration/hud_radialbg',
		name = name .. "_back",
		layer = 1,
		render_template = "VertexColorTexturedRadial",
		color = Color(0.75, 1, 1, 1),
		w = self._icon_size,
		h = self._icon_size,
		x = x_offset,
		y = y_offset
	})
	local stacks = self._skill_panel:text({
		alpha = 1,
		name = name .. "_stacks",
		text = "",
		x = x_offset + (0.67 * self._icon_size), --Move text to corner of icon.
		y = y_offset - (0.1 * self._icon_size),
		layer = 3,
		color = Color.white,
		font = tweak_data.menu.default_font,
		font_size = self._icon_size * 0.6
	})

	--Insert information regarding skill to tables.
	table.insert(self._active_skills, name)
	self._durations[name] = 10 --Default duration, usually overwritten.
	self._start_times[name] = nil
	self._stacks[name] = 0
end

--Removes a skill from the list of active ones. If no skill is specified, removes everything.
function HUDSkill:destroy(name)
	for i, skill in pairs(self._active_skills) do
		if not name then
			table.remove(self._active_skills, i)
			self._skill_panel:remove(self._skill_panel:child(skill .. "_back"))
			self._skill_panel:remove(self._skill_panel:child(skill .. "_icon"))
			self._skill_panel:remove(self._skill_panel:child(skill .. "_stacks"))
		elseif skill == name then
			table.remove(self._active_skills, i)
			self._skill_panel:remove(self._skill_panel:child(skill .. "_back"))
			self._skill_panel:remove(self._skill_panel:child(skill .. "_icon"))
			self._skill_panel:remove(self._skill_panel:child(skill .. "_stacks"))
			self:_reshuffle_locations() --Fix positions to fill in hole.
			break
		end
	end
end

--Trigger the countdown for the skill. When it ends, remove it from the active table.
--If animation is already running, it resets progress.
function HUDSkill:trigger_buff(name, duration)
	if not duration or duration == 0 then
		return
	end
	if not self:_check_skill_active(name) then
		self:add_skill(name)
	end
	self._durations[name] = duration
	if self._start_times[name] then
		self._start_times[name] = Application:time()
	else
		self._skill_panel:animate(callback(self, self, "_drain"), name)
	end
end

--Trigger the cooldown visuals.
--If animation is already running, it resets progress.
function HUDSkill:trigger_cooldown(name, duration)
	if not duration or duration == 0 then
		return
	end
	if not self:_check_skill_active(name) then
		return
	end
	self._durations[name] = duration
	if self._start_times[name] then
		self._start_times[name] = Application:time()
	else
		self._skill_panel:animate(callback(self, self, "_fill"), name)
	end
end

--Can be used for cooldown reduction and such.
function HUDSkill:change_start_time(name, amount)
	if not self:_check_skill_active(name) then
		return
	end
	if self._start_times[name] then
		self._start_times[name] = self._start_times[name] + amount
	end
end

--Increases number next to skill icon. If it goes above 9, just displays an X to represent loads of fat staxx.
function HUDSkill:add_stack(name)
	if not self:_check_skill_active(name) then
		self:add_skill(name)
	end
	self._stacks[name] = self._stacks[name] + 1
	if self._stacks[name] < 10 then
		self._skill_panel:child(name .. "_stacks"):set_text(tostring(self._stacks[name]))
	else
		self._skill_panel:child(name .. "_stacks"):set_text("X")
	end
end

--Reduces number next to skill icon. If reduced to 0, the skill is removed from the list.
function HUDSkill:remove_stack(name)
	if not self:_check_skill_active(name) then
		return
	end
	self._stacks[name] = self._stacks[name] - 1
	if self._stacks[name] > 0 then
		self._skill_panel:child(name .. "_stacks"):set_text(tostring(self._stacks[name]))
	else
		self:destroy(name)
	end
end

--Sets number of stacks to a specific value.
function HUDSkill:set_stacks(name, stacks)
	if stacks <= 0 then
		self:destroy(name)
		return
	end
	if not self:_check_skill_active(name) then
		self:add_skill(name)
	end
	self._stacks[name] = stacks
	self._skill_panel:child(name .. "_stacks"):set_text(tostring(self._stacks[name]))
end

--Skill draining animation.
function HUDSkill:_drain(input_panel, name)
	self._start_times[name] = Application:time()
	while true do
		local ratio = (Application:time() - self._start_times[name]) / self._durations[name]
		input_panel:child(name .. "_icon"):set_color(Color(0.8, 1 - ratio, 1, 1))
		input_panel:child(name .. "_back"):set_color(Color(0.75, 1 - ratio, 1, 1))
		if ratio >= 1 then
			break
		end
		coroutine.yield()
	end
	self._start_times[name] = nil
	self._stacks[name] = 0
	self:destroy(name)
end

--Skill filling animation.
function HUDSkill:_fill(input_panel, name)
	self._start_times[name] = Application:time()
	while true do
		local ratio = (Application:time() - self._start_times[name]) / self._durations[name]
		input_panel:child(name .. "_icon"):set_color(Color(0.8, ratio, 1, 1))
		input_panel:child(name .. "_back"):set_color(Color(0.75, ratio, 1, 1))
		if ratio >= 1 then
			break
		end
		coroutine.yield()
	end
	self._start_times[name] = nil
end

function HUDSkill:_check_skill_active(name)
	for _, skill in pairs(self._active_skills) do
		if name == skill then
			return true
		end
	end
	return false
end

--Moves skills back into their proper positions if one is removed from the table.
function HUDSkill:_reshuffle_locations()
	for i, skill in pairs(self._active_skills) do
		local y_offset = (self._icon_size + self._padding) * ((i - 1) % self._row_count) --Shunt new icon downwards until it's no longer clipping with stuff.
		local x_offset = (self._icon_size + self._padding) * math.floor((i - 1) / self._row_count) --Overflow in case there are too many buffs to handle in 1 column.
		self._skill_panel:child(skill .. "_icon"):set_top(y_offset)
		self._skill_panel:child(skill .. "_icon"):set_left(x_offset)
		self._skill_panel:child(skill .. "_back"):set_top(y_offset)
		self._skill_panel:child(skill .. "_back"):set_left(x_offset)
		self._skill_panel:child(skill .. "_stacks"):set_top(y_offset - (0.1 * self._icon_size))
		self._skill_panel:child(skill .. "_stacks"):set_left(x_offset + (0.67 * self._icon_size))
	end
end