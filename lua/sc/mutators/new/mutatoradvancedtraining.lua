--Force enemy HP and DMG values from DS difficulty for any diff
MutatorAdvancedTraining = MutatorAdvancedTraining or class(BaseMutator)
MutatorAdvancedTraining._type = "MutatorAdvancedTraining"
MutatorAdvancedTraining.name_id = "mutator_advancedtraining"
MutatorAdvancedTraining.desc_id = "mutator_advancedtraining_desc"
MutatorAdvancedTraining.reductions = {
	money = 0,
	exp = 0
}
MutatorAdvancedTraining.disables_achievements = false
MutatorAdvancedTraining.categories = {"gameplay"}

MutatorAdvancedTraining.icon_coords = {
	8,
	5
}

function MutatorAdvancedTraining:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	-- If DS difficulty - do nothing
	if difficulty_index == 7 then
	else
		-- Multiplication is funny
		if difficulty_index == 1 then
			tweak_data.character._unmultiply_all_hp(0.75, 1)
		elseif difficulty_index == 5 then
			tweak_data.character._unmultiply_all_hp(1.5, 1)
		elseif difficulty_index == 6 then
			tweak_data.character._unmultiply_all_hp(1.75, 0.801)
		end
	--Adjust hp and hs multiplier values for SWAT and Heavy SWAT units that spawn on low diffs
		tweak_data.character.swat.HEALTH_INIT = 15
		tweak_data.character.swat.headshot_dmg_mul = 3
		tweak_data.character.heavy_swat.HEALTH_INIT = 20
		tweak_data.character.heavy_swat.headshot_dmg_mul = 2
	--Init DS presets
		tweak_data.character:_set_sm_wish()
		tweak_data.weapon:_set_sm_wish()	
	end
end