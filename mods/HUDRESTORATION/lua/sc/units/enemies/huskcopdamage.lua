if restoration.Options:GetValue("SC/SC") then

local die_original = HuskCopDamage.die
function HuskCopDamage:die(...)
	local player = managers.player:player_unit()
	if alive(player) then
		player:movement():on_targetted_for_attack(false, self._unit)
	end
	
	return die_original(self, ...)
end

end