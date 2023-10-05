local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if difficulty_index == 5 or difficulty_index == 6 or difficulty_index == 7 or difficulty_index == 8 then
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
	end
end

return {
	 --flashlights, flashlights, flashlights!!!!!!!!!!
	[100756] = {
			flashlight = true
	},
	[101801] = {
			flashlight = false
	},
	--Titan Snipers replace some SWAT Harassers on Pro Jobs
	[103237] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103236] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103235] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103234] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103228] = {
		values = {
            enemy = australian_sniper
		}
	},
	[102097] = {
		values = {
            enemy = australian_sniper
		}
	},
	[102443] = {
		values = {
            enemy = australian_sniper
		}
	},
	[102446] = {
		values = {
            enemy = australian_sniper
		}
	},
	[102448] = {
		values = {
            enemy = australian_sniper
		}
	},
	[102450] = {
		values = {
            enemy = australian_sniper
		}
	}
}	