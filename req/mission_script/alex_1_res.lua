local cloaker_ds_table = {
	"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local chopper_amount = (difficulty == 8 and 2) or 1
local cloaker = (difficulty == 8 and cloaker_ds_table) or "units/payday2/characters/ene_spook_1/ene_spook_1"
	
local access_fix = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
}
local cloaker_chopper =  {
	values = {
		enemy = cloaker
	},
	on_executed = {
		{id = 101636, delay = 0}
	}
}
return {
	--Replace Heavy SWATs that spawn from the chopper with cloakers
	[101571] = cloaker_chopper,
	[101572] = cloaker_chopper,
	--remove the line+trigger the loop here
	[100945] = {
		on_executed = {
			{id = 100946, remove = true},
			{id = 100965, delay = 180}
		}
	},
	--loop the choppa+2 chopper spawns on DW and DS (PJ only)
	[100966] = {
		values = {
            amount = chopper_amount
		},
		on_executed = {
			{id = 100965, delay = 300}
		}
	},
	--trigger_times to 0; making the loop possible
	[100953] = {
		values = {
            trigger_times = 0
		}
	},
	[100887] = {
		values = {
            trigger_times = 0
		}
	},
	--disable this just in case
	[101652] = {
		values = {
            enabled = false
		}
	},
	--allow fbi and spooc access to disable the power
	[101039] = access_fix,
	[101593] = access_fix,
	[101594] = access_fix,
	[101595] = access_fix,
	[101600] = access_fix,
	-- Reinforce next to cars
	[100941] = {
		reinforce = {
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(675, -1200, 875)
			}
		}
	}
}