function WeaponFactoryTweakData:generate_custom_mod_stats(mod)
	if mod.name_id then
		log("Removing stats from: " .. mod.name_id)
	else
		log("Removing stats from: Unknown Mod")
	end

	mod.stats = {
		value = mod.stats.value
	}
	mod.custom_stats = nil
	mod.desc_id = "bm_auto_generated_mod_sc_desc"
	mod.has_description = true
end