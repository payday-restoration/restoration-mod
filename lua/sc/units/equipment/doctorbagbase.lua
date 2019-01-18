if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function DoctorBagBase:_set_visual_stage()
		local percentage = self._amount / self._max_amount

		if self._unit:damage() then
			local state = "state_" .. math.ceil(percentage * 3)

			if self._unit:damage():has_sequence(state) then
				self._unit:damage():run_sequence_simple(state)
			end
		end
	end

end