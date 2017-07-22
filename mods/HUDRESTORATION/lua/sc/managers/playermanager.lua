if restoration and restoration.Options:GetValue("SC/SCSkills") then

local player_movement_speed_multiplier_orig = PlayerManager.movement_speed_multiplier
function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
    
    local multiplier = player_movement_speed_multiplier_orig(self, speed_state, bonus_multiplier, upgrade_level, health_ratio)
    
    if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
        --Apply Moving Target movement speed bonus (additively)
        multiplier = multiplier + self:detection_risk_movement_speed_bonus()
    end
    
	return multiplier
end

function PlayerManager:fadjfbasjhas()
    if self._max_messiah_charges then
        self._messiah_charges = self._max_messiah_charges
    end
end

function PlayerManager:detection_risk_movement_speed_bonus()
	local multiplier = 0
	local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
	multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed)
	return multiplier
end

end