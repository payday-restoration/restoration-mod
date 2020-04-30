function MedicActionHeal:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._attention = common_data.attention
	self._action_desc = action_desc
	self._done = false

	if self._ext_movement:play_redirect("heal") then
		self._unit:sound():say("heal")

		return true
	end
end

function MedicActionHeal:update(t)
	if not self._unit:anim_data().healing then
		self._done = true
		self._expired = true
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function MedicActionHeal:on_exit()
end