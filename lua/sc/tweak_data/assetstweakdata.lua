Month = os.date("%m")
Day = os.date("%d")	

local old_init_risk_assets = AssetsTweakData._init_risk_assets
function AssetsTweakData:_init_risk_assets(tweak_data)
	old_init_risk_assets(self, tweak_data)
		
	--LES VAMOS A CORTAR LAS VERGAS!!--
	self.risk_bexico = {}
	self.risk_bexico.name_id = "menu_asset_risk_bexico"
	self.risk_bexico.texture = "guis/textures/pd2/mission_briefing/assets/risk_bexico"	
	--Blood's in the water--
	self.risk_murky = {}
	self.risk_murky.name_id = "menu_asset_risk_murky"
	self.risk_murky.texture = "guis/textures/pd2/mission_briefing/assets/risk_murky"	
	--BRaIiinsSSSss--
	self.risk_zombie = {}
	self.risk_zombie.name_id = "menu_asset_risk_zombie"
	self.risk_zombie.texture = "guis/textures/pd2/mission_briefing/assets/risk_zombie"	

	--Kills PD risk level for Murky and Zombie levels--
	table.insert(self.risk_pd.exclude_stages, "shoutout_raid")
	table.insert(self.risk_pd.exclude_stages, "pbr")
	table.insert(self.risk_pd.exclude_stages, "wetwork")
	table.insert(self.risk_pd.exclude_stages, "des")
	table.insert(self.risk_pd.exclude_stages, "bph")
	table.insert(self.risk_pd.exclude_stages, "vit")
	table.insert(self.risk_pd.exclude_stages, "pines")		
	table.insert(self.risk_pd.exclude_stages, "wwh")
	table.insert(self.risk_pd.exclude_stages, "arm_for")
	table.insert(self.risk_pd.exclude_stages, "haunted")
	table.insert(self.risk_pd.exclude_stages, "nail")
	table.insert(self.risk_pd.exclude_stages, "help")
	table.insert(self.risk_pd.exclude_stages, "mex")
	table.insert(self.risk_pd.exclude_stages, "crojob2")
	table.insert(self.risk_pd.exclude_stages, "crojob3")
	table.insert(self.risk_pd.exclude_stages, "crojob3_night")				
	table.insert(self.risk_pd.exclude_stages, "bex")				
	table.insert(self.risk_pd.exclude_stages, "mex_cooking")
	table.insert(self.risk_pd.exclude_stages, "welcome_to_the_jungle_2")	
	table.insert(self.risk_pd.exclude_stages, "pex")	
	table.insert(self.risk_pd.exclude_stages, "fex")
	table.insert(self.risk_pd.exclude_stages, "deep")
	table.insert(self.risk_pd.exclude_stages, "junk")
	table.insert(self.risk_pd.exclude_stages, "ahopl")
	table.insert(self.risk_pd.exclude_stages, "ascension_III")
	table.insert(self.risk_pd.exclude_stages, "hwu")
	table.insert(self.risk_pd.exclude_stages, "rusdl")
	table.insert(self.risk_pd.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_pd.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_pd.exclude_stages, "the_factory")
	table.insert(self.risk_pd.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_pd.exclude_stages, "flatline_lvl")
	table.insert(self.risk_pd.exclude_stages, "daymare")
	table.insert(self.risk_pd.exclude_stages, "hidden_vault")
	table.insert(self.risk_pd.exclude_stages, "hunter_party")
	table.insert(self.risk_pd.exclude_stages, "hunter_departure")
	table.insert(self.risk_pd.exclude_stages, "finsternis")
	table.insert(self.risk_pd.exclude_stages, "ruswl")
	table.insert(self.risk_pd.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_pd.exclude_stages, "Tonis2")
	table.insert(self.risk_pd.exclude_stages, "trop")
	table.insert(self.risk_pd.exclude_stages, "funbank")
	table.insert(self.risk_pd.exclude_stages, "Xanax")
	table.insert(self.risk_pd.exclude_stages, "btms")
	table.insert(self.risk_pd.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_pd.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_pd.exclude_stages, "wetwork_burn")

	--SWAT--		
	table.insert(self.risk_swat.exclude_stages, "shoutout_raid")
	table.insert(self.risk_swat.exclude_stages, "pbr")
	table.insert(self.risk_swat.exclude_stages, "wetwork")
	table.insert(self.risk_swat.exclude_stages, "des")	
	table.insert(self.risk_swat.exclude_stages, "bph")	
	table.insert(self.risk_swat.exclude_stages, "pines")				
	table.insert(self.risk_swat.exclude_stages, "vit")	
	table.insert(self.risk_swat.exclude_stages, "wwh")
	table.insert(self.risk_swat.exclude_stages, "arm_for")
	table.insert(self.risk_swat.exclude_stages, "haunted")
	table.insert(self.risk_swat.exclude_stages, "nail")
	table.insert(self.risk_swat.exclude_stages, "help")
	table.insert(self.risk_swat.exclude_stages, "hvh")
	table.insert(self.risk_swat.exclude_stages, "mex")
	table.insert(self.risk_swat.exclude_stages, "crojob2")
	table.insert(self.risk_swat.exclude_stages, "crojob3")
	table.insert(self.risk_swat.exclude_stages, "crojob3_night")				
	table.insert(self.risk_swat.exclude_stages, "bex")				
	table.insert(self.risk_swat.exclude_stages, "mex_cooking")		
	table.insert(self.risk_swat.exclude_stages, "welcome_to_the_jungle_2")	
	table.insert(self.risk_swat.exclude_stages, "pex")
	table.insert(self.risk_swat.exclude_stages, "fex")
	table.insert(self.risk_swat.exclude_stages, "deep")
	table.insert(self.risk_swat.exclude_stages, "junk")
	table.insert(self.risk_swat.exclude_stages, "ahopl")
	table.insert(self.risk_swat.exclude_stages, "ascension_III")
	table.insert(self.risk_swat.exclude_stages, "hwu")
	table.insert(self.risk_swat.exclude_stages, "rusdl")
	table.insert(self.risk_swat.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_swat.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_swat.exclude_stages, "the_factory")
	table.insert(self.risk_swat.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_swat.exclude_stages, "flatline_lvl")
	table.insert(self.risk_swat.exclude_stages, "daymare")
	table.insert(self.risk_swat.exclude_stages, "hidden_vault")
	table.insert(self.risk_swat.exclude_stages, "hunter_party")
	table.insert(self.risk_swat.exclude_stages, "hunter_departure")
	table.insert(self.risk_swat.exclude_stages, "finsternis")
	table.insert(self.risk_swat.exclude_stages, "ruswl")
	table.insert(self.risk_swat.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_swat.exclude_stages, "Tonis2")
	table.insert(self.risk_swat.exclude_stages, "trop")
	table.insert(self.risk_swat.exclude_stages, "funbank")
	table.insert(self.risk_swat.exclude_stages, "Xanax")
	table.insert(self.risk_swat.exclude_stages, "btms")
	table.insert(self.risk_swat.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_swat.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_swat.exclude_stages, "wetwork_burn")

	
	--FBI--		
	table.insert(self.risk_fbi.exclude_stages, "shoutout_raid")
	table.insert(self.risk_fbi.exclude_stages, "pbr")
	table.insert(self.risk_fbi.exclude_stages, "wetwork")
	table.insert(self.risk_fbi.exclude_stages, "des")
	table.insert(self.risk_fbi.exclude_stages, "bph")
	table.insert(self.risk_fbi.exclude_stages, "vit")
	table.insert(self.risk_fbi.exclude_stages, "pines")						
	table.insert(self.risk_fbi.exclude_stages, "wwh")
	table.insert(self.risk_fbi.exclude_stages, "arm_for")
	table.insert(self.risk_fbi.exclude_stages, "haunted")
	table.insert(self.risk_fbi.exclude_stages, "nail")
	table.insert(self.risk_fbi.exclude_stages, "help")
	table.insert(self.risk_fbi.exclude_stages, "hvh")
	table.insert(self.risk_fbi.exclude_stages, "mex")
	table.insert(self.risk_fbi.exclude_stages, "crojob2")
	table.insert(self.risk_fbi.exclude_stages, "crojob3")
	table.insert(self.risk_fbi.exclude_stages, "crojob3_night")				
	table.insert(self.risk_fbi.exclude_stages, "bex")				
	table.insert(self.risk_fbi.exclude_stages, "mex_cooking")	
	table.insert(self.risk_fbi.exclude_stages, "welcome_to_the_jungle_2")	
	table.insert(self.risk_fbi.exclude_stages, "pex")
	table.insert(self.risk_fbi.exclude_stages, "fex")
	table.insert(self.risk_fbi.exclude_stages, "deep")
	table.insert(self.risk_fbi.exclude_stages, "junk")
	table.insert(self.risk_fbi.exclude_stages, "ahopl")
	table.insert(self.risk_fbi.exclude_stages, "ascension_III")
	table.insert(self.risk_fbi.exclude_stages, "hwu")
	table.insert(self.risk_fbi.exclude_stages, "rusdl")
	table.insert(self.risk_fbi.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_fbi.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_fbi.exclude_stages, "the_factory")
	table.insert(self.risk_fbi.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_fbi.exclude_stages, "flatline_lvl")
	table.insert(self.risk_fbi.exclude_stages, "daymare")
	table.insert(self.risk_fbi.exclude_stages, "hidden_vault")
	table.insert(self.risk_fbi.exclude_stages, "hunter_party")
	table.insert(self.risk_fbi.exclude_stages, "hunter_departure")
	table.insert(self.risk_fbi.exclude_stages, "finsternis")
	table.insert(self.risk_fbi.exclude_stages, "ruswl")
	table.insert(self.risk_fbi.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_fbi.exclude_stages, "Tonis2")
	table.insert(self.risk_fbi.exclude_stages, "trop")
	table.insert(self.risk_fbi.exclude_stages, "funbank")
	table.insert(self.risk_fbi.exclude_stages, "Xanax")
	table.insert(self.risk_fbi.exclude_stages, "btms")
	table.insert(self.risk_fbi.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_fbi.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_fbi.exclude_stages, "wetwork_burn")

	--Overkill--		
	table.insert(self.risk_death_squad.exclude_stages, "shoutout_raid")
	table.insert(self.risk_death_squad.exclude_stages, "pbr")
	table.insert(self.risk_death_squad.exclude_stages, "wetwork")	
	table.insert(self.risk_death_squad.exclude_stages, "des")
	table.insert(self.risk_death_squad.exclude_stages, "pines")								
	table.insert(self.risk_death_squad.exclude_stages, "bph")
	table.insert(self.risk_death_squad.exclude_stages, "vit")
	table.insert(self.risk_death_squad.exclude_stages, "wwh")
	table.insert(self.risk_death_squad.exclude_stages, "arm_for")
	table.insert(self.risk_death_squad.exclude_stages, "haunted")
	table.insert(self.risk_death_squad.exclude_stages, "nail")
	table.insert(self.risk_death_squad.exclude_stages, "help")
	table.insert(self.risk_death_squad.exclude_stages, "hvh")
	table.insert(self.risk_death_squad.exclude_stages, "mex")	
	table.insert(self.risk_death_squad.exclude_stages, "crojob2")
	table.insert(self.risk_death_squad.exclude_stages, "crojob3")
	table.insert(self.risk_death_squad.exclude_stages, "crojob3_night")				
	table.insert(self.risk_death_squad.exclude_stages, "bex")				
	table.insert(self.risk_death_squad.exclude_stages, "mex_cooking")
	table.insert(self.risk_death_squad.exclude_stages, "welcome_to_the_jungle_2")
	table.insert(self.risk_death_squad.exclude_stages, "pex")
	table.insert(self.risk_death_squad.exclude_stages, "fex")
	table.insert(self.risk_death_squad.exclude_stages, "deep")
	table.insert(self.risk_death_squad.exclude_stages, "junk")
	table.insert(self.risk_death_squad.exclude_stages, "ahopl")
	table.insert(self.risk_death_squad.exclude_stages, "ascension_III")
	table.insert(self.risk_death_squad.exclude_stages, "hwu")
	table.insert(self.risk_death_squad.exclude_stages, "rusdl")
	table.insert(self.risk_death_squad.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_death_squad.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_death_squad.exclude_stages, "the_factory")
	table.insert(self.risk_death_squad.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_death_squad.exclude_stages, "flatline_lvl")
	table.insert(self.risk_death_squad.exclude_stages, "daymare")
	table.insert(self.risk_death_squad.exclude_stages, "hidden_vault")
	table.insert(self.risk_death_squad.exclude_stages, "hunter_party")
	table.insert(self.risk_death_squad.exclude_stages, "hunter_departure")
	table.insert(self.risk_death_squad.exclude_stages, "finsternis")
	table.insert(self.risk_death_squad.exclude_stages, "ruswl")
	table.insert(self.risk_death_squad.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_death_squad.exclude_stages, "Tonis2")
	table.insert(self.risk_death_squad.exclude_stages, "trop")
	table.insert(self.risk_death_squad.exclude_stages, "funbank")
	table.insert(self.risk_death_squad.exclude_stages, "Xanax")
	table.insert(self.risk_death_squad.exclude_stages, "btms")
	table.insert(self.risk_death_squad.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_death_squad.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_death_squad.exclude_stages, "wetwork_burn")

	--Mayhem--		
	table.insert(self.risk_easy_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_easy_wish.exclude_stages, "pbr")
	table.insert(self.risk_easy_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_easy_wish.exclude_stages, "des")
	table.insert(self.risk_easy_wish.exclude_stages, "bph")
	table.insert(self.risk_easy_wish.exclude_stages, "vit")
	table.insert(self.risk_easy_wish.exclude_stages, "pines")										
	table.insert(self.risk_easy_wish.exclude_stages, "wwh")
	table.insert(self.risk_easy_wish.exclude_stages, "arm_for")
	table.insert(self.risk_easy_wish.exclude_stages, "haunted")
	table.insert(self.risk_easy_wish.exclude_stages, "nail")
	table.insert(self.risk_easy_wish.exclude_stages, "help")
	table.insert(self.risk_easy_wish.exclude_stages, "hvh")
	table.insert(self.risk_easy_wish.exclude_stages, "mex")
	table.insert(self.risk_easy_wish.exclude_stages, "crojob2")		
	table.insert(self.risk_easy_wish.exclude_stages, "crojob3")
	table.insert(self.risk_easy_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_easy_wish.exclude_stages, "bex")				
	table.insert(self.risk_easy_wish.exclude_stages, "mex_cooking")	
	table.insert(self.risk_easy_wish.exclude_stages, "welcome_to_the_jungle_2")
	table.insert(self.risk_easy_wish.exclude_stages, "pex")
	table.insert(self.risk_easy_wish.exclude_stages, "fex")
	table.insert(self.risk_easy_wish.exclude_stages, "deep")
	table.insert(self.risk_easy_wish.exclude_stages, "junk")
	table.insert(self.risk_easy_wish.exclude_stages, "ahopl")
	table.insert(self.risk_easy_wish.exclude_stages, "ascension_III")
	table.insert(self.risk_easy_wish.exclude_stages, "hwu")
	table.insert(self.risk_easy_wish.exclude_stages, "rusdl")
	table.insert(self.risk_easy_wish.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_easy_wish.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_easy_wish.exclude_stages, "the_factory")
	table.insert(self.risk_easy_wish.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_easy_wish.exclude_stages, "flatline_lvl")
	table.insert(self.risk_easy_wish.exclude_stages, "daymare")
	table.insert(self.risk_easy_wish.exclude_stages, "hidden_vault")
	table.insert(self.risk_easy_wish.exclude_stages, "hunter_party")
	table.insert(self.risk_easy_wish.exclude_stages, "hunter_departure")
	table.insert(self.risk_easy_wish.exclude_stages, "finsternis")
	table.insert(self.risk_easy_wish.exclude_stages, "ruswl")
	table.insert(self.risk_easy_wish.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_easy_wish.exclude_stages, "Tonis2")
	table.insert(self.risk_easy_wish.exclude_stages, "trop")
	table.insert(self.risk_easy_wish.exclude_stages, "funbank")
	table.insert(self.risk_easy_wish.exclude_stages, "Xanax")
	table.insert(self.risk_easy_wish.exclude_stages, "btms")
	table.insert(self.risk_easy_wish.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_easy_wish.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_easy_wish.exclude_stages, "wetwork_burn")

	--Deathwish--		
	table.insert(self.risk_death_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_death_wish.exclude_stages, "pbr")
	table.insert(self.risk_death_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_death_wish.exclude_stages, "des")
	table.insert(self.risk_death_wish.exclude_stages, "bph")
	table.insert(self.risk_death_wish.exclude_stages, "vit")
	table.insert(self.risk_death_wish.exclude_stages, "wwh")
	table.insert(self.risk_death_wish.exclude_stages, "pines")												
	table.insert(self.risk_death_wish.exclude_stages, "arm_for")
	table.insert(self.risk_death_wish.exclude_stages, "haunted")
	table.insert(self.risk_death_wish.exclude_stages, "nail")
	table.insert(self.risk_death_wish.exclude_stages, "help")
	table.insert(self.risk_death_wish.exclude_stages, "hvh")
	table.insert(self.risk_death_wish.exclude_stages, "mex")
	table.insert(self.risk_death_wish.exclude_stages, "crojob2")		
	table.insert(self.risk_death_wish.exclude_stages, "crojob3")
	table.insert(self.risk_death_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_death_wish.exclude_stages, "bex")				
	table.insert(self.risk_death_wish.exclude_stages, "mex_cooking")
	table.insert(self.risk_death_wish.exclude_stages, "welcome_to_the_jungle_2")
	table.insert(self.risk_death_wish.exclude_stages, "pex")
	table.insert(self.risk_death_wish.exclude_stages, "fex")
	table.insert(self.risk_death_wish.exclude_stages, "deep")
	table.insert(self.risk_death_wish.exclude_stages, "junk")
	table.insert(self.risk_death_wish.exclude_stages, "ahopl")
	table.insert(self.risk_death_wish.exclude_stages, "ascension_III")
	table.insert(self.risk_death_wish.exclude_stages, "hwu")
	table.insert(self.risk_death_wish.exclude_stages, "rusdl")
	table.insert(self.risk_death_wish.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_death_wish.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_death_wish.exclude_stages, "the_factory")
	table.insert(self.risk_death_wish.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_death_wish.exclude_stages, "flatline_lvl")
	table.insert(self.risk_death_wish.exclude_stages, "daymare")
	table.insert(self.risk_death_wish.exclude_stages, "hidden_vault")
	table.insert(self.risk_death_wish.exclude_stages, "hunter_party")
	table.insert(self.risk_death_wish.exclude_stages, "hunter_departure")
	table.insert(self.risk_death_wish.exclude_stages, "finsternis")
	table.insert(self.risk_death_wish.exclude_stages, "ruswl")
	table.insert(self.risk_death_wish.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_death_wish.exclude_stages, "Tonis2")
	table.insert(self.risk_death_wish.exclude_stages, "trop")
	table.insert(self.risk_death_wish.exclude_stages, "funbank")
	table.insert(self.risk_death_wish.exclude_stages, "Xanax")
	table.insert(self.risk_death_wish.exclude_stages, "btms")
	table.insert(self.risk_death_wish.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_death_wish.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_death_wish.exclude_stages, "wetwork_burn")
	
	--Death Sentence--		
	table.insert(self.risk_sm_wish.exclude_stages, "shoutout_raid")
	table.insert(self.risk_sm_wish.exclude_stages, "pbr")
	table.insert(self.risk_sm_wish.exclude_stages, "wetwork")	
	table.insert(self.risk_sm_wish.exclude_stages, "des")
	table.insert(self.risk_sm_wish.exclude_stages, "bph")
	table.insert(self.risk_sm_wish.exclude_stages, "pines")														
	table.insert(self.risk_sm_wish.exclude_stages, "vit")
	table.insert(self.risk_sm_wish.exclude_stages, "wwh")
	table.insert(self.risk_sm_wish.exclude_stages, "arm_for")
	table.insert(self.risk_sm_wish.exclude_stages, "haunted")
	table.insert(self.risk_sm_wish.exclude_stages, "nail")
	table.insert(self.risk_sm_wish.exclude_stages, "help")
	table.insert(self.risk_sm_wish.exclude_stages, "hvh")
	table.insert(self.risk_sm_wish.exclude_stages, "mex")	
	table.insert(self.risk_sm_wish.exclude_stages, "crojob2")	
	table.insert(self.risk_sm_wish.exclude_stages, "crojob3")
	table.insert(self.risk_sm_wish.exclude_stages, "crojob3_night")				
	table.insert(self.risk_sm_wish.exclude_stages, "bex")				
	table.insert(self.risk_sm_wish.exclude_stages, "mex_cooking")		
	table.insert(self.risk_sm_wish.exclude_stages, "welcome_to_the_jungle_2")
	table.insert(self.risk_sm_wish.exclude_stages, "pex")
	table.insert(self.risk_sm_wish.exclude_stages, "fex")
	table.insert(self.risk_sm_wish.exclude_stages, "deep")
	table.insert(self.risk_sm_wish.exclude_stages, "junk")
	table.insert(self.risk_sm_wish.exclude_stages, "ahopl")
	table.insert(self.risk_sm_wish.exclude_stages, "ascension_III")
	table.insert(self.risk_sm_wish.exclude_stages, "hwu")
	table.insert(self.risk_sm_wish.exclude_stages, "rusdl")
	table.insert(self.risk_sm_wish.exclude_stages, "constantine_gunrunnerclubhouse_lvl")
	table.insert(self.risk_sm_wish.exclude_stages, "crimepunishlvl")
	table.insert(self.risk_sm_wish.exclude_stages, "the_factory")
	table.insert(self.risk_sm_wish.exclude_stages, "constantine_mex_level")
	table.insert(self.risk_sm_wish.exclude_stages, "flatline_lvl")
	table.insert(self.risk_sm_wish.exclude_stages, "daymare")
	table.insert(self.risk_sm_wish.exclude_stages, "hidden_vault")
	table.insert(self.risk_sm_wish.exclude_stages, "hunter_party")
	table.insert(self.risk_sm_wish.exclude_stages, "hunter_departure")
	table.insert(self.risk_sm_wish.exclude_stages, "finsternis")
	table.insert(self.risk_sm_wish.exclude_stages, "ruswl")
	table.insert(self.risk_sm_wish.exclude_stages, "ttr_yct_lvl")
	table.insert(self.risk_sm_wish.exclude_stages, "Tonis2")
	table.insert(self.risk_sm_wish.exclude_stages, "trop")
	table.insert(self.risk_sm_wish.exclude_stages, "funbank")
	table.insert(self.risk_sm_wish.exclude_stages, "Xanax")
	table.insert(self.risk_sm_wish.exclude_stages, "btms")
	table.insert(self.risk_sm_wish.exclude_stages, "constantine_wintersniper_lvl")
	table.insert(self.risk_sm_wish.exclude_stages, "constantine_murkyairport_lvl")
	table.insert(self.risk_sm_wish.exclude_stages, "wetwork_burn")
	
	-- Reaper Risk Asset
	table.insert(self.mad_russian_merc_cameras.stages, "pines")
	table.insert(self.mad_russian_merc_cameras.stages, "crojob3")
	table.insert(self.mad_russian_merc_cameras.stages, "crojob3_night")
	table.insert(self.mad_russian_merc_cameras.stages, "ahopl")
	table.insert(self.mad_russian_merc_cameras.stages, "rusdl")
	table.insert(self.mad_russian_merc_cameras.stages, "crimepunishlvl")
	table.insert(self.mad_russian_merc_cameras.stages, "the_factory")
	table.insert(self.mad_russian_merc_cameras.stages, "flatline_lvl")
	table.insert(self.mad_russian_merc_cameras.stages, "hunter_party")
	table.insert(self.mad_russian_merc_cameras.stages, "hunter_departure")
	table.insert(self.mad_russian_merc_cameras.stages, "finsternis")
	table.insert(self.mad_russian_merc_cameras.stages, "ruswl")

	self.risk_death_squad.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_3_sc"
	self.risk_easy_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_4_sc"
	self.risk_death_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_5_sc"
	self.risk_sm_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_6_sc"
	self.risk_murky.stages = {
		"shoutout_raid",
		"pbr",
		"welcome_to_the_jungle_2",
		"wetwork",
		"des",
		"bph",
		"vit",
		"arm_for",
		"crojob2",
		"mex",
		"deep",
		"hwu",
		"constantine_gunrunnerclubhouse_lvl",
		"constantine_wintersniper_lvl",
		"constantine_murkyairport_lvl",
		"hidden_vault",
		"ttr_yct_lvl",
		"Tonis2",
		"trop",
		"Xanax",
		"btms",
		"wetwork_burn"
		--"wwh" Intended as we weren't expecting a fight at all on Alaskan Deal
	}		
	self.risk_zombie.stages = {
		"haunted",
		"nail",
		"help",
		"hvh",
		"ascension_III",
		"daymare",
		"funbank"
	}		
	self.risk_bexico.stages = {
		"bex",
		"pex",
		"fex",
		"mex_cooking",
		"constantine_mex_level",
		"junk"
	}			
	
	--[[
	
	--Holiday Exclusive Stuff--
	if Month == "10" and restoration.Options:GetValue("OTHER/Holiday") then

		--Zombies on Bank Heist (H&T)
		table.insert(self.risk_pd.exclude_stages, "branchbank")
		table.insert(self.risk_swat.exclude_stages, "branchbank")
		table.insert(self.risk_fbi.exclude_stages, "branchbank")
		table.insert(self.risk_death_squad.exclude_stages, "branchbank")
		table.insert(self.risk_easy_wish.exclude_stages, "branchbank")
		table.insert(self.risk_death_wish.exclude_stages, "branchbank")
		table.insert(self.risk_sm_wish.exclude_stages, "branchbank")
		
		table.insert(self.risk_zombie.stages, "branchbank")
	
	end	
	
	]]--

	--Adding Bikers to Biker heist cause it makes sense--
	self.jungle_1_bikers.stages = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"born",
		"chew"
	}
	
	--Bodybag Case, removing Insider asset requirement
	self.bodybags_bag.upgrade_lock = nil
	
	--Expert Driver, ditto. Idea is that now you can opt to have escapes for extra day rate + XP, but more to lose if you screw up.
	self.safe_escape.upgrade_lock = nil
	
	--Sniper asset, adding Insider requirement because of how good this bastard is.
	self.watchdogs_2_sniper.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
	
	self.framing_frame_2_sniper.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}		
	
	--Alex 1 Zipline
	self.alex_1_zipline = {}
	self.alex_1_zipline.name_id = "menu_alex_1_zipline"
	self.alex_1_zipline.texture = "guis/textures/pd2/mission_briefing/assets/alex_1_zipline"
	self.alex_1_zipline.visible_if_locked = true
	self.alex_1_zipline.no_mystery = true
	self.alex_1_zipline.unlock_desc_id = "menu_alex_1_zipline_desc"
	self.alex_1_zipline.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)		
	self.alex_1_zipline.stages = {
		"alex_1_res",
	}				
		
	--Slaughterhouse safe--
	self.dinner_safe = {}
	self.dinner_safe.name_id = "menu_asset_dinner_safe"
	self.dinner_safe.texture = "guis/textures/pd2/mission_briefing/assets/heist_vlad_asset04_df"
	self.dinner_safe.stages = {"dinner"}
	
	--Boiling Point Test Subjects--
	self.mad_cyborg_test_subject = {}		
	self.mad_cyborg_test_subject.name_id = "menu_asset_mad_cyborg_test_subject"
	self.mad_cyborg_test_subject.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/mad_cyborg_test_subject"
	self.mad_cyborg_test_subject.stages = {"mad"}

	--Oh my god JC--
	self.bomb_loot = {}
	self.bomb_loot.name_id = "menu_asset_bomb_inside_info"
	self.bomb_loot.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_1/assets_crojob_insiderinfo_bomb"
	self.bomb_loot.stages = {"crojob2"}
	
	--UK Job, Resmod edit
	table.insert(self.safe_escape.stages, "ukrainian_job_res")
	table.insert(self.bodybags_bag.stages, "ukrainian_job_res")
	table.insert(self.sniper_spot_jewelery.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_tiara.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_front.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_cam.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_metal_detector.stages, "ukrainian_job_res")
	table.insert(self.ukrainian_job_shutter.stages, "ukrainian_job_res")
	table.insert(self.security_safe_05x05.stages, "ukrainian_job_res")
	
	--FS Day 1, Resmod edit
	table.insert(self.grenade_crate.stages, "firestarter_1_res")
	table.insert(self.sniper_spot_firestarter1.stages, "firestarter_1_res")
	table.insert(self.firestarter_1_ammo.stages, "firestarter_1_res")
	table.insert(self.firestarter_1_health.stages, "firestarter_1_res")
	
	--FS Day 2, Resmod edit
	table.insert(self.bodybags_bag.stages, "firestarter_2_res")
	table.insert(self.spotter.stages, "firestarter_2_res")
	table.insert(self.grenade_crate.stages, "firestarter_2_res")
	table.insert(self.firestarter_2_cam.stages, "firestarter_2_res")	

	--Diamond Store, Resmod Edit
	table.insert(self.safe_escape.stages, "family_res")
	table.insert(self.bodybags_bag.stages, "family_res")
	
	--Rats Day 1, Resmod Edit
	table.insert(self.grenade_crate.stages, "alex_1_res")		
	table.insert(self.sniper_spot_rats1.stages, "alex_1_res")
	table.insert(self.rat_1_ammo.stages, "alex_1_res")
	table.insert(self.rat_1_health.stages, "alex_1_res")
	table.insert(self.rat_1_lights.stages, "alex_1_res")
	
	--Rats Day 2, Resmod Edit
	--Nothing!
	
	--Rats Day 3, Resmod Edit
	table.insert(self.sniper_spot_rats3.stages, "alex_3_res")		
	table.insert(self.rat_3_pilot.stages, "alex_3_res")
	
	--Xmas FBI heist assets
	table.insert(self.hox_1.stages, "xmn_hox_1")
	table.insert(self.hox_2.stages, "xmn_hox_2")
	table.insert(self.bodybags_bag.stages, "xmn_tag")
	
	--Pro Job changes--
	if Global.game_settings and Global.game_settings.one_down then
	
		--Generic Ammo asset
		self.ammo_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}
		
		--Generic Doctor asset
		self.health_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}

		--Generic BodyBag asset
		self.bodybags_bag.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Generic Grenade Crate asset
		self.grenade_crate.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Watchdogs D1 Bags
		self.watchdogs_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.watchdogs_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Watchdogs D2 Bags
		self.watchdogs_2_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.watchdogs_2_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Firestarter D1 Bags
		self.firestarter_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.firestarter_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		
		--Big Oil Day 2 Ammo
		self.jungle_2_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}				

		--Rats D1 Bags
		self.rat_1_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.rat_1_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Mallcrasher bags
		self.mallcrasher_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.mallcrasher_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	

		--Nightclub bags
		self.nightclub_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.nightclub_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}				
	
		--Armored Transport Heists Bags
		self.arm_for_ammo.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}	
		self.arm_for_health.upgrade_lock = {
			upgrade = "additional_assets_pro",
			category = "player"
		}		
	
	end

	--Restoration Heist assets--
	--wet floor--
	self.wet_intel = {}
	self.wet_intel.name_id = "menu_asset_wet_intel"
	self.wet_intel.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_intel"	
	
	self.wet_boat = {}
	self.wet_boat.name_id = "menu_asset_wet_boat"
	self.wet_boat.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_boat"
	self.wet_boat.visible_if_locked = true
	self.wet_boat.no_mystery = true
	self.wet_boat.unlock_desc_id = "menu_asset_wet_boat_desc"
	self.wet_boat.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.wet_boat.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}
	
	--Burning Floor--
	self.wetwork_burn_add_saw = {}
	self.wetwork_burn_add_saw.name_id = "menu_asset_wet_add_saw"
	self.wetwork_burn_add_saw.texture = "guis/textures/pd2/mission_briefing/assets/wetwork_burn_add_saw"
	self.wetwork_burn_add_saw.visible_if_locked = true
	self.wetwork_burn_add_saw.no_mystery = true
	self.wetwork_burn_add_saw.unlock_desc_id = "menu_asset_wet_add_saw_desc"
	self.wetwork_burn_add_saw.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.wetwork_burn_add_saw.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
	
	--Rush--
	self.rush_asset_sentrygun = {}
	self.rush_asset_sentrygun.name_id = "menu_rush_asset_sentrygun"
	self.rush_asset_sentrygun.texture = "guis/textures/pd2/mission_briefing/assets/rush_asset_sentrygun"
	self.rush_asset_sentrygun.visible_if_locked = true
	self.rush_asset_sentrygun.no_mystery = true
	self.rush_asset_sentrygun.unlock_desc_id = "menu_rush_asset_sentrygun_desc"
	self.rush_asset_sentrygun.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.rush_asset_sentrygun.upgrade_lock = {
		upgrade = "additional_assets",
		category = "player"
	}	
end

Hooks:PostHook( AssetsTweakData, "_init_gage_assets", "SC_GageAssetFix", function(self, tweak_data)	
	table.insert(self.gage_assignment.exclude_stages, "hvh")
end)
