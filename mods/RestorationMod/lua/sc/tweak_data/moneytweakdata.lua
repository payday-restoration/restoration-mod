if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	if Global.load_level then
		local old_init = MoneyTweakData.init
		function MoneyTweakData:init(tweak_data, presets)
			old_init(self, tweak_data)
			--if one down, give 20% more cash/exp
			--really bad way of doing it but eh, these are never touched anyway
			if Global.game_settings.one_down then
				self.difficulty_multiplier = {
					4.8,
					10.8,
					14.4,
					24,
					42,
					48,
					54
				}
				self.difficulty_multiplier_payout = {
					1.2,
					2.4,
					6,
					12,
					13.2,
					15.6,
					16.8
				}
			end
		end
	end

end