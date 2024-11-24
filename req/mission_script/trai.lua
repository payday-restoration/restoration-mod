local bravo_guard_table = {
	"units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2",
	"units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"
}
local bravo_sniper = "units/pd2_mod_bravo/characters/ene_bravo_dmr_scripted/ene_bravo_dmr_scripted"
local swat_sniper = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"
local fbi_sniper = "units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
local gensec_sniper = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"
local zeal_sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
local bravo_snipers_swat = {swat_sniper, swat_sniper, swat_sniper, swat_sniper, bravo_sniper}
local bravo_snipers_swat_and_fbi = {swat_sniper, fbi_sniper, swat_sniper, fbi_sniper, bravo_sniper}
local bravo_snipers_fbi_and_gensec = {fbi_sniper, gensec_sniper, fbi_sniper, gensec_sniper, bravo_sniper}
local bravo_snipers_gensec = {gensec_sniper, gensec_sniper, gensec_sniper, gensec_sniper, bravo_sniper}
local bravo_snipers_zeal = {zeal_sniper, zeal_sniper, zeal_sniper, zeal_sniper, bravo_sniper}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local sniper = (difficulty == 8 and bravo_snipers_zeal or difficulty == 7 and bravo_snipers_gensec or difficulty == 6 and bravo_snipers_fbi_and_gensec or difficulty == 5 and bravo_snipers_swat_and_fbi or difficulty == 4 and bravo_snipers_swat) 
local sniper_trigger_times = {
	values = {
			enemy = sniper,
            trigger_times = 0
		}
}
local bravo_guards = {
	values = {
         enemy = bravo_guard_table
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
	--also adds bravo snipers replacing regulars on ovk+
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
	[100676] = bravo_guards,
	[100678] = bravo_guards,
	[100679] = bravo_guards,
	[102291] = bravo_guards,
	[100711] = bravo_guards,
	[101207] = bravo_guards,
	[101213] = bravo_guards,
	[101295] = bravo_guards,
	[101151] = bravo_guards,
	[101144] = bravo_guards,
	[101507] = bravo_guards,
	[101532] = bravo_guards,
	[101607] = bravo_guards,
	[101609] = bravo_guards,
	[101611] = bravo_guards,
	[101612] = bravo_guards,
	[101613] = bravo_guards,
	[101614] = bravo_guards,
	[101615] = bravo_guards,
	[101616] = bravo_guards,
	[101617] = bravo_guards,
	[101618] = bravo_guards,
	[101619] = bravo_guards,
	[101620] = bravo_guards,
	[101621] = bravo_guards,
	[101622] = bravo_guards,
	[101623] = bravo_guards,
	[101624] = bravo_guards,
	[101635] = bravo_guards,
	[101637] = bravo_guards,
	[101638] = bravo_guards,
	[101644] = bravo_guards,
	[101646] = bravo_guards,
	[101648] = bravo_guards,
	[101665] = bravo_guards,
	[101674] = bravo_guards,
	[101676] = bravo_guards,
	[101678] = bravo_guards,
	[101695] = bravo_guards,
	[101697] = bravo_guards,
	[101698] = bravo_guards,
	[101704] = bravo_guards,
	[101706] = bravo_guards,
	[101708] = bravo_guards,
	[101725] = bravo_guards,
	[101727] = bravo_guards,
	[101728] = bravo_guards,
	[101734] = bravo_guards,
	[101736] = bravo_guards,
	[101738] = bravo_guards,
	[103166] = bravo_guards,
	[103168] = bravo_guards,
	[103169] = bravo_guards,
	[103175] = bravo_guards,
	[103177] = bravo_guards,
	[103179] = bravo_guards,
	[103196] = bravo_guards,
	[103198] = bravo_guards,
	[103199] = bravo_guards,
	[103205] = bravo_guards,
	[103207] = bravo_guards,
	[103209] = bravo_guards,
	[103212] = bravo_guards,
	[103215] = bravo_guards,
	[103221] = bravo_guards,
	[103227] = bravo_guards,
	[103231] = bravo_guards,
	[103237] = bravo_guards,
	[103242] = bravo_guards,
	[103245] = bravo_guards,
	[103251] = bravo_guards,
	[103257] = bravo_guards,
	[103261] = bravo_guards,
	[103267] = bravo_guards,
	[103272] = bravo_guards,
	[103275] = bravo_guards,
	[103281] = bravo_guards,
	[103287] = bravo_guards,
	[103291] = bravo_guards,
	[103297] = bravo_guards,
	[103302] = bravo_guards,
	[103305] = bravo_guards,
	[103311] = bravo_guards,
	[103317] = bravo_guards,
	[103321] = bravo_guards,
	[103327] = bravo_guards
}