--GAMMA...DELTA..ETA..OMEGA..GHOST
local eseries_table_mayhem_dw = {
	"units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
	"units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
	"units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2"
}
local eseries_table_ds = {
	"units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
	"units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
	"units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2",
	"units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local double_dozers_only = (difficulty >= 6 and false) or true
--Random titan unit for Mayhem+. Otherwise - vet cop
local eseries_elite_unit = (difficulty == 8 and eseries_table_ds or (difficulty == 7 or difficulty == 6) and eseries_table_mayhem_dw) or "units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1"
local epsilon_shield = ((pro_job and difficulty >= 6) and "units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
	
local tshield = {
	values = {
        enemy = epsilon_shield
	}
}	
local double_dozers = {
	values = {
        enabled = double_dozers_only
	}
}
return {
	--Pro Job PONR
	[100176] = {
		ponr = ponr_value
	},
	--fix hunt used by reaper sec in lab
	[100245] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "fbi"})
			end
		end
	},
	--trigger the elite spawn when enterning the lab
	[100335] = {
		on_executed = {
			{id = 101053, delay = 1}
		}
	},
	--use unused lab spawn as random elite unit
	[101053] = {
		values = {
            enemy = eseries_elite_unit,
			position = Vector3(1421.624, 2495.052, -800.000),
			rotation = Rotation(138.000, 0, -0)
		}
	},
	--Titan Shields for OVK+ (PJ only)
	[101860] = tshield,
	[101863] = tshield,
	[101864] = tshield,
	--Disable single dozer mission scripts on higher diffs
	[101733] = double_dozers,
	[101734] = double_dozers,
	[100854] = double_dozers,
	--fix this mission script not actually spawning skulldozers
	[101698] = {
		on_executed = {
			{id = 101691, delay = 0},
			{id = 101692, delay = 0}
		}
	},
	-- Disable instant difficulty increase
	[101980] = {
		values = {
			enabled = false
		}
	},
	[101596] = {
		difficulty = 0.5
	}
}