
LevelsTweakData.oinit = LevelsTweakData.init

function LevelsTweakData:init(...)
	
		LevelsTweakData:oinit(...)

		self.ukrainian_job.env_params = { color_grading = "color_nice" }
		
		-------GREEN HARVEST
		self.greenharvest_stage1 = {}
		self.greenharvest_stage1.name_id = "heist_greenhrv_stage1"
		self.greenharvest_stage1.briefing_id = "restoration_brief_data_greenhrv1_briefing"
		self.greenharvest_stage1.briefing_dialog = "Play_plt_watchdogs_stage1_02"
		self.greenharvest_stage1.world_name = "narratives/h_firestarter/stage_3"
		self.greenharvest_stage1.intro_event = {
		""
		}
		self.greenharvest_stage1.outro_event = "Play_plt_watchdogs_stage1_04"
		self.greenharvest_stage1.ghost_bonus = 0.1
		self.greenharvest_stage1.max_bags = 54
		self.greenharvest_stage1.music = "heist"
		self.greenharvest_stage1.package = "packages/narr_firestarter3"
		self.greenharvest_stage1.cube = "cube_apply_heist_bank"
		self.greenharvest_stage1.ai_group_type = america
		self.greenharvest_stage1.env_params = { color_grading = "color_nice" }
		self.greenharvest_stage1.mission_data = {
		{mission = "standalone"}
		}
		
		self.escape_garage_ghrv = {}
		self.escape_garage_ghrv.name_id = "heist_escape_garage_hl"
		self.escape_garage_ghrv.briefing_id = "heist_escape_garage_briefing"
		self.escape_garage_ghrv.briefing_dialog = "nothing"
		self.escape_garage_ghrv.world_name = "narratives/escapes/escape_garage"
		self.escape_garage_ghrv.intro_event = "Play_dr1_a01"
		self.escape_garage_ghrv.outro_event = "nothing"
		self.escape_garage_ghrv.music = "heist"
		self.escape_garage_ghrv.package = "packages/escape_garage"
		self.escape_garage_ghrv.cube = "cube_apply_heist_bank"
		self.escape_garage_ghrv.env_params = { color_grading = "color_nice" }
		
		self.escape_overpass_ghrv = {}
		self.escape_overpass_ghrv.name_id = "heist_escape_overpass_hl"
		self.escape_overpass_ghrv.briefing_id = "heist_escape_overpass_briefing"
		self.escape_overpass_ghrv.briefing_dialog = "nothing"
		self.escape_overpass_ghrv.world_name = "narratives/escapes/escape_overpass"
		self.escape_overpass_ghrv.intro_event = "Play_dr1_a01"
		self.escape_overpass_ghrv.outro_event = "nothing"
		self.escape_overpass_ghrv.music = "heist"
		self.escape_overpass_ghrv.package = "packages/escape_overpass"
		self.escape_overpass_ghrv.cube = "cube_apply_heist_bank"
		self.escape_overpass_ghrv.env_params = { color_grading = "color_nice" }
		
		
		
		
end
