
function PlayerIncapacitated:_check_action_interact(t, input)
	if input.btn_interact_press then
		if _G.IS_VR then
			self._interact_hand = input.btn_interact_left_press and PlayerHand.LEFT or PlayerHand.RIGHT
		end

		if not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t then
			self._intimidate_t = t

			PlayerArrested.call_teammate(self, "f11", t, true)
		end
	end
end