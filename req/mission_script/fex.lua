local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 540) or 480

return {
	-- Pro Job PONR 
	[102921] = {
		ponr = ponr_value
	},
	-- Don't kill off enemies in courtyard/patio
	[102903] = {
		values = {
			enabled = false
		},
	},
	[102904] = {
		values = {
			enabled = false
		},
	},
	-- Replace American Secret Service
	[102750] = {
		values = {
			enemy = "units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3",
		},
	},
	-- reeeinforrrcee 
	[100109] = {
		reinforce = {
			{
				name = "front_door",
				force = 2,
				position = Vector3(230, 427, 0),
			},
			{
				name = "sitting_area",
				force = 2,
				position = Vector3(-2001, 47, 0),
			},
			{
				name =  "party_zone", 
				force = 3, 
				position = Vector3(100, 2928, -11.607),
			},
			{
				name = "front_gate", 
				force = 3, 
				position = Vector3(-10, -1760, -198.465),
			},
			{
				name = "i_wonder_whats_for_dinner",
				force = 2, 
				position = Vector3(1589, 2511, 0),
			},
			{
				name = "chica_in_fnaf_1_be_like",
				force = 2,
				position = Vector3(1788, 569, 0),
			},
		},
	},
}