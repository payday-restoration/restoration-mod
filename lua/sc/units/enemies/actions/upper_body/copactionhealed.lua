function CopActionHealed:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._action_desc = action_desc

	if self._ext_anim.upper_body_active and not self._ext_anim.upper_body_empty then
		self._ext_movement:play_redirect("up_idle")
	end

	if not self._ext_movement:play_redirect("use_syringe", action_desc.start_anim_time) then
		return
	end
	
	--Fancy effect when these guys enter the heal state
	if self._unit:contour() then
		local crackhead = Idstring("Head")
		local attach_to_unit = self._unit:get_object(crackhead)
		if not attach_to_unit then
			return
		end
		
		World:effect_manager():spawn({
			effect = Idstring("effects/pd2_mod_omnia/particles/character/overkillpack/mega_rad_mutant_smoke_puff_no_random"),
			parent = attach_to_unit
		})	
		--self._unit:contour():add("medic_heal", true)
		--self._unit:contour():flash("medic_heal", 0.2)
	end

	self._unit:sound():say("hr01")
	CopActionAct._create_blocks_table(self, action_desc.blocks)
	self._ext_movement:enable_update()

	return true
end

