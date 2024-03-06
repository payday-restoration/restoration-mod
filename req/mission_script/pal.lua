local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local solo = Global.game_settings and Global.game_settings.single_player

	--PDTH's styled PONR, run faster
	if difficulty <= 5 then
		ponr_value = 90
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 70
	else
		ponr_value = 60
	end
	
	--PONR is less stricted in singleplayer
	if solo then
		ponr_value = ponr_value * 2 
	end

--If we're in Pro Job, do this shit below
if pro_job and difficulty >= 5 then
	--these shields are slow but will fuck a bit harder than regular shields once in position
	titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
end

return {
	--Pro Job PONR
	[102644] = {
		ponr = ponr_value
	},
	[102654] = {
		ponr = ponr_value
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
	--SWAT Van that crashes through Wilson's wall no longer deploys turret on higher diffs
	--Disables the turret
	[102821] = {
		values = {
			enabled = false
		}
	},
	[101965] = {
		values = {
			enabled = false
		}
	},
	--Disable the 2nd police crusier if the cops are already alerted
	[103034] = {
		on_executed = {
            {id = 400015, delay = 0}
		}
	},
	--Forces the reinforcments to spawn instead
	[102819] = {
		values = {
			difficulty_easy_wish = "true",
			difficulty_overkill_290 = "true",
			difficulty_sm_wish = "true"
		}
	},
	--delay the next anim by few more seconds to let the previous anim end
	[101647] = {
		on_executed = {
            {id = 101648, delay = 10.5}
		}
	},
	--same as the crash van
	[102506] = {
		values = {
			enabled = false
		}
	},
	[102382] = {
		values = {
			enabled = false
		}
	},
	--Forces the reinforcments to spawn instead
	[102383] = {
		values = {
			difficulty_easy_wish = "true",
			difficulty_overkill_290 = "true",
			difficulty_sm_wish = "true"
		}
	},
	--Disable this van
	[102197] = {
		values = {
			enabled = false
		}
	},
	--disable vanilla snipers
	[102941] = {
		values = {
			enabled = false
		}
	},
	--Warn about shields
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
			{id = 400016, delay = 7}
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
	[101735] = {
		values = {
            enemy = australian_sniper
		}
	},
	[101733] = {
		values = {
            enemy = australian_sniper
		}
	},
	--Replace shields that cover the manhole with titan counterparts on Overkill-DS PJ
	[100036] = {
		values = {
            enemy = titan_shield
		}
	},
	[100039] = {
		values = {
            enemy = titan_shield
		}
	},
	[100044] = {
		values = {
            enemy = titan_shield
		}
	},
	[101848] = {
		values = {
            enemy = titan_shield
		}
	},
	[101908] = {
		values = {
            enemy = titan_shield
		}
	},
	[101911] = {
		values = {
            enemy = titan_shield
		}
	},
	[100642] = {
		values = {
            enemy = titan_shield
		}
	},
	[100777] = {
		values = {
            enemy = titan_shield
		}
	},
	[100795] = {
		values = {
            enemy = titan_shield
		}
	},
	[101804] = {
		values = {
            enemy = titan_shield
		}
	},
	[101883] = {
		values = {
            enemy = titan_shield
		}
	},
	[102098] = {
		values = {
            enemy = titan_shield
		}
	}
}