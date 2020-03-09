function CopActionHealed:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._attention = common_data.attention
	self._action_desc = action_desc

	self._healed = false

	if self._ext_movement:play_redirect("use_syringe") then
		self._ext_movement:spawn_wanted_items()
		self._unit:sound():say("hr01")
	end

	return true
end

function CopActionHealed:on_exit()
	self._ext_movement:drop_held_items()
end

function CopActionHealed:update(t)
	if not self._unit:anim_data().heal then
		self._healed = true
		self._expired = true
	end
end
