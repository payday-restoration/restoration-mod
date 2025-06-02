local patches = {
	mus_helicopter = {
		bag_counter = 100038,
		bag_counter_set = 100040,
	},
}

return {
	["levels/instances/unique/mus_helicopter/world/world"] = function(result)
		-- local pro_job = Global.game_settings and Global.game_settings.one_down
		-- local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
		local bags_amount = 8
		local mus_helicopter = patches.mus_helicopter

		for _, element in pairs(result.default.elements) do
			local id = element.id
			if id == mus_helicopter.bag_counter then
				element.values.counter_target = bags_amount
			elseif id == mus_helicopter.bag_counter_set then
				element.values.amount = bags_amount
			end
		end
	end,
}
