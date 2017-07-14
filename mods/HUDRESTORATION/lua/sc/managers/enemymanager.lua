if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function EnemyManager:add_magazine(magazine, collision)
	self._magazines = self._magazines or {}
	table.insert(self._magazines, {magazine, collision})
end

function EnemyManager:shield_limit()
	return self:corpse_limit()
end

end