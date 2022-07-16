MutatorShieldDozers.reductions = {money = 0, exp = 0}
MutatorShieldDozers.disables_achievements = false
MutatorShieldDozers.allowed_tweak_datas = {"tank", "tank_hw_black", "tank_medic", "tank_mini"}

function MutatorShieldDozers:setup(data)	
	--Because they're shield enemies now, no more weapon mutators for them
	for i, char_id in ipairs(self.allowed_tweak_datas) do
		tweak_data.character[char_id].no_mutator_weapon_override = true
	end	
end