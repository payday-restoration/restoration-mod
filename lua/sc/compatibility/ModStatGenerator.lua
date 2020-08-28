function WeaponFactoryTweakData:generate_custom_mod_stats(mod)
	log("Removing stats from: " .. mod.name_id)
	mod.stats = {
		value = mod.stats.value
	}
	mod.custom_stats = nil
end