HUDMutator = HUDMutator or class()

function HUDMutator:init(hud)
	self._hud_reset = hud
	self._hud_panel = hud.panel

	self:setup_buff_panel(hud)
	self:setup_stage_transition_panel(hud)
end

function HUDMutator:setup_buff_panel(hud)
	self._buff_list = {}
	local max_buffs = 8

	if self._hud_panel:child("mutator_panel") then
		self._hud_panel:remove(self._hud_panel:child("mutator_panel"))
	end

	self._mutator_panel = self._hud_panel:panel({
		hlign = "right",
		name = "mutator_panel",
		visible = true,
		layer = 0,
		h = 20 * max_buffs + 2 * (max_buffs - 1)
	})

	self._mutator_panel:set_right(self._hud_panel:w())
	self._mutator_panel:set_center_y(self._hud_panel:h() / 2)
end

function HUDMutator:update(t, dt)
	for index, buff_element in pairs(self._buff_list) do
		if buff_element:get_time_left() <= 0 then
			self:remove_buff(buff_element.buff_id)
		else
			buff_element:update(dt)
		end
	end
end

function HUDMutator:add_buff(data)
	for index, buff_element in pairs(self._buff_list) do
		if buff_element.buff_id == data.buff_id then
			buff_element:set_time_left(data.time_left, true)

			return
		end
	end

	local empty_index = data.negative and -1 or 0

	while self._buff_list[empty_index] ~= nil do
		empty_index = empty_index + (data.negative and -1 or 1)
	end

	data.index = empty_index
	data.with_fade = false
	self._buff_list[empty_index] = MutatorBuffElement:new(self._mutator_panel, data)
end


function HUDMutator:remove_buff(buff_id)
	for index, buff_element in pairs(self._buff_list) do
		if buff_element.buff_id == buff_id then
			buff_element:remove()

			self._buff_list[index] = nil
		end
	end
end

function HUDMutator:reset()
	self:init(self._hud_reset)
end

MutatorBuffElement = MutatorBuffElement or class()
MutatorBuffElement.ACTIVE_FADE = 0.8
MutatorBuffElement.EXIT_FADE_START = 1
MutatorBuffElement.INITIAL_FADE = 2

function MutatorBuffElement:init(parent_panel, data)
	local size = tweak_data.mutators.piggybank.buff_font_size
	self._parent_panel = parent_panel
	self.buff_id = data.buff_id
	self._localized_name = managers.localization:to_upper_text(data.name_id)
	self._show_time_left = data.show_time_left or false
	self.with_fade = data.with_fade == nil and true or data.with_fade
	local y_pos = parent_panel:h() - (1 + data.index) * size
	self._buff_panel = parent_panel:panel({
		y = y_pos,
		h = size
	})

	if data.icon_texture then
		self._buff_icon = self._buff_panel:bitmap({
			valign = "center",
			layer = 15,
			align = "right",
			texture = data.icon_texture or nil,
			texture_rect = data.icon_texture_rect or {
				0,
				0,
				128,
				128
			},
			h = size - 5,
			w = size - 5,
			color = data.color or Color.white,
			rotation = data.negative and -360 or nil
		})
	else
		self._buff_icon = self._buff_panel:rect({
			layer = 1,
			align = "right",
			valign = "center",
			h = size - 5,
			w = size - 5,
			color = data.color or Color.white,
			rotation = data.negative and -360 or nil
		})
	end

	self._buff_icon:set_right(self._buff_panel:w())
	self._buff_icon:set_center_y(self._buff_panel:h() / 2)

	self._buff_text = self._buff_panel:text({
		word_wrap = false,
		name = "timer_text",
		wrap = false,
		align = "right",
		layer = 1,
		text = self._show_time_left and self._localized_name .. ": " .. tostring(math.ceil(data.time_left)) or self._localized_name,
		font_size = size,
		font = tweak_data.hud.medium_font_noshadow,
		color = data.color or Color.white,
		rotation = data.negative and -360 or nil
	})

	self._buff_text:set_right(self._buff_icon:left() - size / 2)
	self._buff_text:set_center_y(self._buff_panel:h() / 2)

	self.time_left = data.time_left
	self.start_time = MutatorBuffElement.INITIAL_FADE
end

function MutatorBuffElement:update(dt)
	if self._show_time_left then
		self._buff_text:set_text(self._localized_name .. ": " .. tostring(math.ceil(self.time_left)))
	end

	if self.time_left and not self.time_left == -1 then
		self.time_left = self.time_left - dt

		if self.time_left <= MutatorBuffElement.EXIT_FADE_START then
			self._buff_text:set_alpha(math.map_range(math.clamp(self.time_left, 0, MutatorBuffElement.EXIT_FADE_START), 0, 1, 0, MutatorBuffElement.ACTIVE_FADE))
			self._buff_icon:set_alpha(math.map_range(math.clamp(self.time_left, 0, MutatorBuffElement.EXIT_FADE_START), 0, 1, 0, MutatorBuffElement.ACTIVE_FADE))
		end
	end

	if self.with_fade and self.start_time > 0 then
		self.start_time = self.start_time - dt

		self._buff_text:set_alpha(math.map_range(math.clamp(self.start_time, 0, 1), 0, 1, MutatorBuffElement.ACTIVE_FADE, 1))
		self._buff_icon:set_alpha(math.map_range(math.clamp(self.start_time, 0, 1), 0, 1, MutatorBuffElement.ACTIVE_FADE, 1))
	end
end

function MutatorBuffElement:remove()
	self._parent_panel:remove(self._buff_panel)
end

function MutatorBuffElement:set_time_left(time_left, start_time)
	self.time_left = time_left
	self.start_time = start_time and 2
end

function MutatorBuffElement:get_time_left()
	return self.time_left and (self.time_left == -1 and 1 or self.time_left) or 0
end