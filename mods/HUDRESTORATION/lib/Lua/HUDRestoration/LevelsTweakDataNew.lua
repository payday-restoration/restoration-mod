--color_nice  is yellow
--color_heat  is normal blue
--color_matrix  is deep blue, menu, BROKEN DON'T USE PLEASE
--color_xgen  is alpha grading
--color_xxxgen  is red tinting
--color_payday  is normal grading
--color_sin  is camera
--color_bhd  is extreme blue


LevelsTweakData.oinit = LevelsTweakData.init

function LevelsTweakData:init(...)
	
		LevelsTweakData:oinit(...)

self.jewelry_store.env_params = { color_grading = "color_payday" }

self.branchbank.env_params = { color_grading = "color_payday" }

self.ukrainian_job.env_params = { color_grading = "color_nice" }

self.watchdogs_2.env_params = { color_grading = "color_heat" }

self.watchdogs_2_day.env_params = { color_grading = "color_xxxgen", environment = "environments/pd2_env_wd2_evening/pd2_env_wd2_evening" }

self.watchdogs_1.env_params = { color_grading = "color_xgen" }

self.watchdogs_1_night.env_params = { color_grading = "color_heat", environment = "environments/pd2_env_night/pd2_env_night" }

self.firestarter_1.env_params = { color_grading = "color_xgen" }

self.firestarter_2.env_params = { color_grading = "color_heat" }

self.firestarter_3.env_params = { color_grading = "color_xgen" }

self.nightclub.env_params = { color_grading = "color_xgen" }

self.welcome_to_the_jungle_2.env_params = { color_grading = "color_xxxgen" }

self.crojob2.env_params = { color_grading = "color_xxxgen" }

self.crojob3.env_params = { color_grading = "color_xxxgen" }


end