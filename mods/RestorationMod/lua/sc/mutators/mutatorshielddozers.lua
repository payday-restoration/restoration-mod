if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	MutatorShieldDozers.reductions = {money = 0, exp = 0}
	MutatorShieldDozers.disables_achievements = false
	MutatorShieldDozers.allowed_tweak_datas = {"tank", "tank_hw", "tank_medic", "tank_mini"}

end