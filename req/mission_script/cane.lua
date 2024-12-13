local female_bikers_table = {
		"units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1",
		"units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2",
		"units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
}
local fem_bikers = {
	values = {
        enemy = female_bikers_table
	}
}
return {
	--so mean elfs :<
	[102011] = fem_bikers,
	[102028] = fem_bikers,
	[102527] = fem_bikers,
	[102529] = fem_bikers,
	[102531] = fem_bikers,
	[102535] = fem_bikers
}