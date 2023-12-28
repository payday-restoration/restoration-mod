MutatorEnemyHealth.reductions = {money = 0, exp = 0}
MutatorEnemyHealth.disables_achievements = false

--Lets you go below the base health values
function MutatorEnemyHealth:_min_health()
	return 0.1
end