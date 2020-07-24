Hooks:PreHook(FirstAidKitBase, "take", "ResQuickFixHud", function(self, unit)
	if not self._empty and self._damage_reduction_upgrade then
		managers.hud:start_buff("quick_fix", tweak_data.upgrades.values.temporary.first_aid_damage_reduction[1][2])
	end
end)