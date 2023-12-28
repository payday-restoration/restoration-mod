MutatorEnemyDamage.reductions = {money = 0, exp = 0}
MutatorEnemyDamage.disables_achievements = false

--Lets you go below the base damage values
function MutatorEnemyDamage:_min_damage()
	return 0.1
end
