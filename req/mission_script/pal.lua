local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local cop_sg = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4"

	--PDTH's styled PONR, run faster
	if difficulty <= 5 then
		ponr_value = 120
	else
		ponr_value = 90
	end

--If we're in Pro Job, do this stuff below
if pro_job and difficulty >= 5 then
	titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
end

local tshield = {
	values = {
        enemy = titan_shield
	}
}
local tsniper = {
	values = {
        enemy = australian_sniper
	}
}
local disabled = {
	values = {
        enabled = false
	}
}
local mayhem_above_filter = {
	values = {
		difficulty_easy_wish = "true",
		difficulty_overkill_290 = "true",
		difficulty_sm_wish = "true"
	}
}

return {
	--Pro Job PONR
	[102644] = {
		ponr = ponr_value
	},
	[102654] = {
		ponr = ponr_value
	},
	--Reinforce Spots
	[100031] = {
		reinforce = {
			{
				name = "protect_the_BBQ",
				force = 3,
				position = Vector3(-3680, 1926, 26.700)
			},
			{
				name = "Mitchell_house_1",
				force = 3,
				position = Vector3(-2286, 2640, 78.789)
			},
			{
				name = "Mitchell_house_2",
				force = 3,
				position = Vector3(-2556, 3836, 75.500)
			},
			{
				name = "Wilson_house_1",
				force = 3,
				position = Vector3(-2080, 39, 28.970)
			},
			{
				name = "Wilson_house_2",
				force = 3,
				position = Vector3(-2980, 1441, -324.500)
			}
		}
	},
	--Additional Reinforce Spots
	[101219] = {
		reinforce = {
			{
				name = "protect_the_valveHQ_1",
				force = 3,
				position = Vector3(-6624, 1545, 21.141)
			}
		}
	},
	[101218] = {
		reinforce = {
			{
				name = "protect_the_valveHQ_2",
				force = 3,
				position = Vector3(-2402, -1326, 17.788)
			}
		}
	},
	[101220] = {
		reinforce = {
			{
				name = "protect_the_valveHQ_3",
				force = 3,
				position = Vector3(-340, 2438, 26.700)
			}
		}
	},
	--Water fills the safe much slower (like in PDTH)
	[101229] = {
		values = {
            timer = 240
		}
	},
	[101237] = {
		values = {
            time = 200
		}
	},
	[101236] = {
		values = {
            time = 140
		}
	},
	[101235] = {
		values = {
            time = 60
		}
	},
	[100897] = {
		values = {
            time = 30
		}
	},
	--Trigger Hunt (Endless Assault)
	[102642] = {
		hunt = true
	},
	--Disable PONR if you somehow want to print money, re-trigger again if you done with it
    [102551] = {
        ponr_end = true
    },
	--Bain no longer will remind to find Mitchell when players masked up
	[102410] = {
		on_executed = {
            {id = 100096, delay = 0}
		}
	},
	--Drill is already set up, not need the drill reminder dialogue to play
	[100574] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(103297)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
	},
	--Disable Grenadiers on startup
	[100023] = {
		on_executed = {
            {id = 400030, delay = 3}
		}
	},
	--Enable Grenadiers if Mitchell has been killed
	[102351] = {
		on_executed = {
            {id = 400029, delay = 0}
		}
	},
	--Disable the 2nd police crusier if the cops are already alerted
	[103034] = {
		on_executed = {
            {id = 400015, delay = 0}
		}
	},
	--Replace 2nd bronco cop with shotgun cop (to match with PDTH)
	[100725] = {
		values = {
            enemy = cop_sg
		}
	},
	--Disable vanilla's reinforce points
	[100218] = disabled,
	[101635] = disabled,
	[101636] = disabled,
	--SWAT Van that crashes through Wilson's wall no longer deploys turret on higher diffs
	--Disables the turret
	[102821] = disabled,
	[101965] = disabled,
	--Forces the reinforcments to spawn instead
	[102819] = mayhem_above_filter,
	--delay the next anim by few more seconds to let the previous anim end
	[101647] = {
		on_executed = {
            {id = 101648, delay = 10.5}
		}
	},
	--same as 2nd van near Mitchell's house
	[102506] = disabled,
	[102382] = disabled,
	--Forces the reinforcments to spawn instead
	[102383] = mayhem_above_filter,
	--Disable this van (it's redunant)
	[102197] = disabled,
	--disable vanilla snipers
	[102941] = disabled,
	--Warn about shields (and grenadiers if it's Death Wish above)
	[101469] = {
		on_executed = {
            {id = 400018, delay = 0}
		}
	},
	--Spawn Grenadiers at the start of 1st assault if Mitchell has been killed
	--Bain warns about them
	[102081] = {
		on_executed = {
            {id = 400019, delay = 5}
		}
	},
	--Spawn custom PDTH styled snipers at the start of 2nd assault
	--Bain warns about them
	[102082] = {
		on_executed = {
            {id = 400001, delay = 5},
			{id = 400002, delay = 5},
			{id = 400003, delay = 5},
			{id = 400004, delay = 5},
			{id = 400005, delay = 5},
			{id = 400016, delay = 3.5}
		}
	},
	--Spawn two extra grenadiers on Death Wish above
	[103336] = {
		on_executed = {
            {id = 400031, delay = 0},
			{id = 400032, delay = 0}
		}
	},
	[101929] = {
		on_executed = {
            {id = 400031, delay = 0},
			{id = 400032, delay = 0}
		}
	},
	[101803] = {
		on_executed = {
            {id = 400033, delay = 0},
			{id = 400034, delay = 0}
		}
	},
	[101930] = {
		on_executed = {
            {id = 400033, delay = 0},
			{id = 400034, delay = 0}
		}
	},
	--Add the missing sniper access
	[102399] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "sniper", "spooc"})
			end
		end
	},
	--Replace some Rooftop SWATs with Titan Snipers on Overkill-DS PJ
	[101735] = tsniper,
	[101733] = tsniper,
	--Replace shields that cover the manhole with titan counterparts on Overkill-DS PJ
	[100036] = tshield,
	[100039] = tshield,
	[100044] = tshield,
	[101848] = tshield,
	[101908] = tshield,
	[101911] = tshield,
	[100642] = tshield,
	[100777] = tshield,
	[100795] = tshield,
	[101804] = tshield,
	[101883] = tshield,
	[102098] = tshield
}