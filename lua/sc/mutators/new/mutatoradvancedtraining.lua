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
MutatorAdvancedTraining.categories = {"enemies"}

MutatorAdvancedTraining.icon_coords = {
	8,
	5
}

-- You're getting the function in here, because that's how much I hate it
-- Probably could've just done the math on _multiply_all_hp in charactertweakdata, but it sure as shit doesn't like calling it from inside a mutator like this
function MutatorAdvancedTraining:setup(data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	local hp_mul = 1
	local hs_mul = 1
	-- If DS difficulty - do nothing
	-- Have it actually do nothing on DS
	if difficulty_index == 8 then
		-- Oh my gawdo, empty space desu
		-- Yoru No Hajimara-sa, empty space
	else
		-- Multiplication is funny
		if difficulty_index == 2 then
			hp_mul = 0.75
			hs_mul = 1
		elseif difficulty_index == 6 then
			hp_mul = 1.5
			hs_mul = 1
		elseif difficulty_index == 7 then
			hp_mul = 1.75
			hs_mul = 0.801
		end
	end
		
	for _, enemy_tweak in ipairs(tweak_data.character._enemy_list) do
		if tweak_data.character[enemy_tweak] then
			tweak_data.character[enemy_tweak].HEALTH_INIT = tweak_data.character[enemy_tweak].HEALTH_INIT / hp_mul
			if tweak_data.character[enemy_tweak].headshot_dmg_mul then
				tweak_data.character[enemy_tweak].headshot_dmg_mul = tweak_data.character[enemy_tweak].headshot_dmg_mul / hs_mul
			end
		end
	end
		
	-- Adjust hp and hs multiplier values for SWAT and Heavy SWAT units that spawn on low diffs
	tweak_data.character.swat.HEALTH_INIT = 15
	tweak_data.character.swat.headshot_dmg_mul = 3
	tweak_data.character.heavy_swat.HEALTH_INIT = 20
	tweak_data.character.heavy_swat.headshot_dmg_mul = 2
	-- Init DS presets
	tweak_data.character:_set_sm_wish()
	tweak_data.weapon:_set_sm_wish()	
end