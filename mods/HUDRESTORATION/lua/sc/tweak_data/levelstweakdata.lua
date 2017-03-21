local old_ltd_init = LevelsTweakData.init
function LevelsTweakData:init()
   	old_ltd_init(self, tweak_data)
	if Global.load_level == true and not PackageManager:loaded("packages/job_nail") then
   		PackageManager:load("packages/job_nail")
    	end
	if Global.load_level == true and not PackageManager:loaded("packages/lvl_help") then
   		PackageManager:load("packages/lvl_help")
    	end
end