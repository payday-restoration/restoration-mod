local swat_overkill_table_pj = {
	"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local swat_normal = (pro_job and "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc")
local swat_hard = (pro_job and "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc")
local swat_overkill = (pro_job and swat_overkill_table_pj)
return {
	[100150] = {
		reinforce = {
			{
				name = "warehouse1",
				force = 2,
				position = Vector3(1800, 3135, 0),
			},
			{
				name = "warehouse2",
				force = 2,
				position = Vector3(540, -300, 0),
			},
		},
	},
	-- Harassers
	[104583] = swat_n,
	[104112] = swat_h,
	[104591] = swat_ovk,
	[104584] = swat_n,
	[103994] = swat_h,
	[104592] = swat_ovk,
	[104585] = swat_n,
	[103993] = swat_h,
	[104593] = swat_ovk,
	[104586] = swat_n,
	[104115] = swat_h,
	[104594] = swat_ovk,
	[104587] = swat_n,
	[104175] = swat_h,
	[104595] = swat_ovk,
	[104588] = swat_n,
	[104174] = swat_h,
	[104596] = swat_ovk,
	[104589] = swat_n,
	[104176] = swat_h,
	[104597] = swat_ovk,
	[104590] = swat_n,
	[104177] = swat_h,
	[104598] = swat_ovk
}
