SkillTreeManager.VERSION = 69

-- all points spent in all tiers of specified tree
function SkillTreeManager:__rpd__get_specialization_tree_points(tree)
	return self:digest_value(self._global.specializations[tree].points_spent, false)
end

-- modeled after SkillTreeManager:_increase_specialization_tier
function SkillTreeManager:__rpd__reset_specialization(tree)
	-- we don't need to do anything if the tree doesn't have points
	local points_to_refund = self:__rpd__get_specialization_tree_points(tree)
	if points_to_refund < 1 then 
		return
	end

	local specialization_tweak = tweak_data.skilltree.specializations[tree]
	if not specialization_tweak then
		return
	end

	local tree_data = self._global.specializations[tree]
	if not tree_data or not tree_data.tiers then
		return
	end

	local tier_data = tree_data.tiers
	local current_tier = self:digest_value(tier_data.current_tier, false)

	-- remove all equipped tier upgrades, last to first
	if self:digest_value(self._global.specializations.current_specialization, false, 1) == tree then
		for i = current_tier, 1, -1 do
			local spec_data = specialization_tweak[i]
			if not spec_data then
				return
			end

			for _, upgrade in ipairs(spec_data.upgrades) do
				managers.upgrades:unaquire(upgrade, UpgradesManager.AQUIRE_STRINGS[3] .. tostring(tree))
			end
		end
	end

	-- set the current tier data back to unused
	tier_data.current_tier = self:digest_value(0, true)
	tier_data.next_tier_data = {
		current_points = self:digest_value(0, true),
		points = self:digest_value(specialization_tweak[1].cost, true)
	}

	-- refund all used points
	local points = self:digest_value(self._global.specializations.points, false)
	self._global.specializations.points = self:digest_value(points + points_to_refund, true)
	tree_data.points_spent = self:digest_value(0, true)

	self:_check_achievements()
	MenuCallbackHandler:_update_outfit_information()
end