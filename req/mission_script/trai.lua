local bravo_guard_table = {
	bravo_guard_1 = "units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1",
	bravo_guard_2 = "units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2",
	bravo_guard_3 = "units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"
}
return {
	--Trigger Hunt (Endless Assault)
	[103743] = {
		hunt = true
	},
	--Fixed snipers being able to spawn only once
	[100368] = {
		values = {
            trigger_times = 0
		}
	},
	[100369] = {
		values = {
            trigger_times = 0
		}
	},
	[100370] = {
		values = {
            trigger_times = 0
		}
	},
	[100371] = {
		values = {
            trigger_times = 0
		}
	},
	[100372] = {
		values = {
            trigger_times = 0
		}
	},
	--Don't disable office doors if alarm is triggered
	[104178] = {
		values = {
            enabled = false
		}
	},
	--Bravo Guards, if we're robbing the Army why there's no Bravo guards?
	[100676] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[100678] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[100679] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[102291] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[100711] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101207] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101213] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101295] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101151] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101144] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101507] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101532] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101607] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101609] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101611] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101612] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101613] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101614] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101615] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101616] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101617] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101618] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101619] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101620] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101621] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101622] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101623] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101624] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101635] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101637] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101638] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101644] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101646] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101648] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101665] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101674] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101676] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101678] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101695] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101697] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101698] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101704] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101706] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101708] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101725] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[101727] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[101728] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101734] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101736] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[101738] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103166] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103168] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103169] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103175] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103177] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103179] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103196] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103198] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103199] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103205] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103207] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103209] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103212] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103215] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103221] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103227] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103231] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103237] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103242] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103245] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103251] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103257] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103261] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103267] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103272] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103275] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103281] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	},
	[103287] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103291] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103297] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103302] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103305] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103311] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_2
		}
	},
	[103317] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103321] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_1
		}
	},
	[103327] = {
		values = {
            enemy = bravo_guard_table.bravo_guard_3
		}
	}
}