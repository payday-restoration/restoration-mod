local sc_cstd = CustomSafehouseTweakData.init
function CustomSafehouseTweakData:init(tweak_data)
	sc_cstd(self, tweak_data)

	--We gage coins now
	self.prices.weapon_mod = 6

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if Global.game_settings and Global.game_settings.one_down then
		if difficulty_index <= 2 then
			self.rewards.raid = 2
		elseif difficulty_index == 3 then
			self.rewards.raid = 3
		elseif difficulty_index == 4 then
			self.rewards.raid = 4
		elseif difficulty_index == 5 then
			self.rewards.raid = 5
		elseif difficulty_index == 6 then
			self.rewards.raid = 6
		elseif difficulty_index == 7 then
			self.rewards.raid = 7
		else
			self.rewards.raid = 8
		end	
	else
		if difficulty_index <= 2 then
			self.rewards.raid = 1
		elseif difficulty_index == 3 then
			self.rewards.raid = 2
		elseif difficulty_index == 4 then
			self.rewards.raid = 3
		elseif difficulty_index == 5 then
			self.rewards.raid = 4
		elseif difficulty_index == 6 then
			self.rewards.raid = 5
		elseif difficulty_index == 7 then
			self.rewards.raid = 6
		else
			self.rewards.raid = 7
		end		
	end

end
