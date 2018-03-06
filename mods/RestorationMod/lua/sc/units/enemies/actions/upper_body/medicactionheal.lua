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
		
		if self._unit:contour() then
			self._unit:contour():add("medic_show", true)
			self._unit:contour():flash("medic_show", 0.2)
		end
		
		if self._unit:base():char_tweak().custom_voicework then
			local voicelines = _G.restoration.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
			if voicelines and voicelines["heal"] then
				local line_to_use = voicelines.heal[math.random(#voicelines.heal)]
				self._unit:base():play_voiceline(line_to_use)
			end
		else
			self._unit:sound():say("heal", true)
		end
		
		self._done = false

		self:check_achievements()

		return true
	end

end