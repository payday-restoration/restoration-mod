if restoration.Options:GetValue("OTHER/TimeOfDay") then
	RestorationCoreHooks:Post(LevelsTweakData, "init", function(self)
		self.ukrainian_job.env_params = {color_grading = "color_nice"}
	end)
end
