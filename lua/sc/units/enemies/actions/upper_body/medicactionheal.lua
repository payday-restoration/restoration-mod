if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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

		self._ext_movement:play_redirect("heal")
		self._unit:sound():say("heal", true)
		
		if self._unit:contour() then
			self._unit:contour():add("medic_show", false)
			self._unit:contour():flash("medic_show", 0.2)
		end
		
		self._done = false

		self:check_achievements()

		return true
	end

end