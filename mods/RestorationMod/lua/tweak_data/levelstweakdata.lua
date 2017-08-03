LevelsTweakData.oinit = LevelsTweakData.init

if restoration.Options:GetValue("OTHER/TimeOfDay") then
	function LevelsTweakData:init(...)
	
		LevelsTweakData:oinit(...)

		self.ukrainian_job.env_params = { color_grading = "color_nice" }
		
	end
end
