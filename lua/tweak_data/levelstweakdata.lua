if restoration.Options:GetValue("OTHER/TimeOfDay") then
	RestorationCoreHooks:Post(LevelsTweakData, "init", function(self)
		self.ukrainian_job.env_params = {color_grading = "color_nice"}
	end)
end

RestorationCoreHooks:Post(LevelsTweakData, "get_music_event", function(stage)
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music_id = level_data and level_data.music or "default"
    if stage == "control" then
		if not music_id == "no_music" or not music_id == "default" or not managers.groupai:state()._ponr_is_on and Global.game_settings.one_down or not managers.music.attempt_play then
			managers.music:check_music_switch()
		end
	end
end)
