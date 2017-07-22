if restoration and restoration.Options:GetValue("SC/SCSkills") then

local init_original = PlayerMovement.init
function PlayerMovement:init(...)
	init_original(self, ...)
	
	self._underdog_skill_data.has_dmg_dampener = self._underdog_skill_data.has_dmg_dampener or 
		managers.player:has_category_upgrade("temporary", "dmg_dampener_close_contact")
		
	self._underdog_skill_data.chk_interval_active = 1 --temp test
end

end