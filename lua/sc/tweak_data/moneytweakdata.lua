if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_init = MoneyTweakData.init
	function MoneyTweakData:init(tweak_data, presets)
		old_init(self, tweak_data)
		--if one down, give 20% more cash/exp
		--really bad way of doing it but eh, these are never touched anyway
		if Global.load_level then
			if Global.game_settings.one_down then
				self.difficulty_multiplier = self._create_value_table(3.0, self.cut_difficulty, 7, false, 1)
			end
		end
		self.difficulty_multiplier = self._create_value_table(2.5, self.cut_difficulty, 7, false, 1)
		local smallest_cashout = (self.stage_completion[1] + self.job_completion[1]) * self.offshore_rate
		local biggest_weapon_mod_cost = math.round(self.biggest_cashout * 0.5)
		local smallest_weapon_mod_cost = math.round(smallest_cashout * 3)
		self.modify_weapon_cost = self._create_value_table(smallest_weapon_mod_cost, biggest_weapon_mod_cost, 10, true, 1.2)
	end

end