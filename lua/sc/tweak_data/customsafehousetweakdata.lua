local sc_cstd = CustomSafehouseTweakData.init
function CustomSafehouseTweakData:init(tweak_data)
	sc_cstd(self, tweak_data)

	--We gage coins now
	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then
		self.prices.weapon_mod = 6
	end

	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		if difficulty_index <= 2 then
			self.rewards.raid = 2
		elseif difficulty_index == 3 then
			self.rewards.raid = 4
		elseif difficulty_index == 4 then
			self.rewards.raid = 6
		elseif difficulty_index == 5 then
			self.rewards.raid = 8
		elseif difficulty_index == 6 then
			self.rewards.raid = 10
		elseif difficulty_index == 7 then
			self.rewards.raid = 12
		else
			self.rewards.raid = 14
		end		

	end

end
