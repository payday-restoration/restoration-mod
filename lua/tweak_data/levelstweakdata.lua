if restoration.Options:GetValue("OTHER/TimeOfDay") then
	RestorationCoreHooks:Post(LevelsTweakData, "init", function(self)
		self.ukrainian_job.env_params = {color_grading = "color_nice"}
	end)
end

local get_music_event_original_res = LevelsTweakData.get_music_event
function LevelsTweakData:get_music_event(stage)
    local result = get_music_event_original_res(self, stage)
    if result and stage == "control" and restoration.Options:GetValue("OTHER/MusicShuffle") and not restoration.Options:GetValue("OTHER/PONRTrack") then
        if self.can_change_music then
            managers.music:check_music_switch()
        else
            self.can_change_music = true
        end
    end
    return result
end 
