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

		if allow_network then
			local params = {
				CopActionHurt.hurt_type_to_idx(action_desc.type),
				action_desc.body_part,
				CopActionHurt.death_type_to_idx("normal"),
				CopActionHurt.type_to_idx(action_desc.type),
				CopActionHurt.variant_to_idx("healed"),
				Vector3(),
				Vector3()
			}

			common_data.ext_network:send("action_hurt_start", unpack(params))
		end

		return true
	end
end

function CopActionHealed:on_exit()
	self._ext_movement:drop_held_items()
end

function CopActionHealed:update(t)
	if not self._unit:anim_data().heal then
		self._healed = true
		self._expired = true
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end