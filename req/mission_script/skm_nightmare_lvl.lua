local bulldozer_4 = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
local headless_dozer = {
	values = {
		enemy = bulldozer_4
	}
}

return {
	--Force White Titandozers to spawn
	[100105] = headless_dozer,
	[100051] = headless_dozer,
	[100053] = headless_dozer,
	[100054] = headless_dozer,
	[100103] = headless_dozer
}