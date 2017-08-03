local old_ltd_init = LevelsTweakData.init
function LevelsTweakData:init()
   	old_ltd_init(self, tweak_data)
	if Global.load_level == true and not PackageManager:loaded("packages/job_nail") then
   		PackageManager:load("packages/job_nail")
   	end
	if Global.load_level == true and not PackageManager:loaded("packages/lvl_help") then
   		PackageManager:load("packages/lvl_help")
    	end
	if Global.load_level == true and not PackageManager:loaded("packages/lvl_mad") then
   		PackageManager:load("packages/lvl_mad")
    	end
	self.nightclub.package = {"packages/vlad_nightclub", "levels/narratives/dentist/mia/stage1/world_sounds"}
	self.short2_stage1.package = {"packages/job_short2_stage1", "levels/narratives/dentist/mia/stage1/world_sounds"}
	self.friend.package = {"packages/lvl_friend", "levels/narratives/h_alex_must_die/stage_1/world_sounds"}
	--Stuff for Summers below--
	self.pal.package = {"packages/narr_pal", "levels/narratives/elephant/mad/world_sounds"}
	self.run.package = {"packages/narr_run", "levels/narratives/elephant/mad/world_sounds"}
	self.firestarter_3.package = {"packages/narr_firestarter3", "levels/narratives/elephant/mad/world_sounds"}
	self.jolly.package = {"packages/jolly", "levels/narratives/elephant/mad/world_sounds"}
end