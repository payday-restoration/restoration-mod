local patches = {
	brb = {
		disable_the_turret = table.set(100005),
	},
}

["levels/instances/unique/brb/police_intro/world/world"] = function(result)
	local brb_turret = patches.brb

	for _, element in pairs(result.default.elements) do
		local id = element.id

		if brb_turret.disable_the_turret[id] then
			element.values.enabled = false
		end
	end
end