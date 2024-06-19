local bravo_guard_table = {
	bravo_guard_1 = "units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1",
	bravo_guard_2 = "units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2",
	bravo_guard_3 = "units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"
}
local sniper_trigger_times = {
	values = {
            trigger_times = 0
		}
}
local bravo_1 = {
	values = {
         enemy = bravo_guard_table.bravo_guard_1
	}
}
local bravo_2 = {
	values = {
         enemy = bravo_guard_table.bravo_guard_2
	}
}
local bravo_3 = {
	values = {
         enemy = bravo_guard_table.bravo_guard_3
	}
}
return {
	--Call Bravos on startup
	[100017] = {
		spawn_bravos = true
	},
	--Trigger Hunt (Endless Assault)
	[103743] = {
		hunt = true
	},
	--Reinforce Spots
	[102477] = {
		reinforce = {
			{
				name = "traincar1",
				force = 3,
				position = Vector3(-6220, 5800, 450)
			},
			{
				name = "traincar2",
				force = 3,
				position = Vector3(-3220, 4790, 450)
			},
			{
				name = "traincar3",
				force = 3,
				position = Vector3(2090, 5770, 450)
			}
		}
	},
	--Fixed snipers being able to spawn only once
	[100368] = sniper_trigger_times,
	[100369] = sniper_trigger_times,
	[100370] = sniper_trigger_times,
	[100371] = sniper_trigger_times,
	[100372] = sniper_trigger_times,
	--Don't disable office doors if alarm is triggered
	[104178] = {
		values = {
            enabled = false
		}
	},
	--Bravo Guards
	[100676] = bravo_1,
	[100678] = bravo_1,
	[100679] = bravo_2,
	[102291] = bravo_2,
	[100711] = bravo_3,
	[101207] = bravo_2,
	[101213] = bravo_1,
	[101295] = bravo_3,
	[101151] = bravo_1,
	[101144] = bravo_1,
	[101507] = bravo_3,
	[101532] = bravo_2,
	[101607] = bravo_2,
	[101609] = bravo_3,
	[101611] = bravo_2,
	[101612] = bravo_1,
	[101613] = bravo_2,
	[101614] = bravo_1,
	[101615] = bravo_3,
	[101616] = bravo_1,
	[101617] = bravo_1,
	[101618] = bravo_2,
	[101619] = bravo_1,
	[101620] = bravo_1,
	[101621] = bravo_2,
	[101622] = bravo_2,
	[101623] = bravo_2,
	[101624] = bravo_1,
	[101635] = bravo_1,
	[101637] = bravo_1,
	[101638] = bravo_2,
	[101644] = bravo_2,
	[101646] = bravo_1,
	[101648] = bravo_1,
	[101665] = bravo_2,
	[101674] = bravo_2,
	[101676] = bravo_1,
	[101678] = bravo_2,
	[101695] = bravo_2,
	[101697] = bravo_3,
	[101698] = bravo_1,
	[101704] = bravo_1,
	[101706] = bravo_3,
	[101708] = bravo_3,
	[101725] = bravo_2,
	[101727] = bravo_3,
	[101728] = bravo_1,
	[101734] = bravo_1,
	[101736] = bravo_1,
	[101738] = bravo_3,
	[103166] = bravo_1,
	[103168] = bravo_1,
	[103169] = bravo_1,
	[103175] = bravo_1,
	[103177] = bravo_1,
	[103179] = bravo_2,
	[103196] = bravo_2,
	[103198] = bravo_2,
	[103199] = bravo_1,
	[103205] = bravo_1,
	[103207] = bravo_1,
	[103209] = bravo_2,
	[103212] = bravo_1,
	[103215] = bravo_2,
	[103221] = bravo_2,
	[103227] = bravo_2,
	[103231] = bravo_3,
	[103237] = bravo_3,
	[103242] = bravo_3,
	[103245] = bravo_1,
	[103251] = bravo_1,
	[103257] = bravo_2,
	[103261] = bravo_2,
	[103267] = bravo_2,
	[103272] = bravo_1,
	[103275] = bravo_3,
	[103281] = bravo_2,
	[103287] = bravo_1,
	[103291] = bravo_1,
	[103297] = bravo_1,
	[103302] = bravo_1,
	[103305] = bravo_1,
	[103311] = bravo_2,
	[103317] = bravo_1,
	[103321] = bravo_1,
	[103327] = bravo_3
}