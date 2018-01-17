if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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

		if not self._unit:base():char_tweak().ignore_medic_revive_animation then
			self._ext_movement:play_redirect("use_syringe")
		end
		if not self._unit:base():char_tweak().disable_medic_heal_voice then
			self._unit:sound():say("hr01")
		end

		self._healed = false

		if self._unit:contour() then
			self._unit:contour():add("medic_heal", true)
			self._unit:contour():flash("medic_heal", 0.2)
		end

		return true
	end


end