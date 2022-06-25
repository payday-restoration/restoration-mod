ModifierHeavies.default_value = "spawn_chance"
--just to make sure the original doesn't do anything
ModifierHeavies.unit_swaps = {}

function ModifierHeavies:init(data)
	ModifierHeavies.super.init(self, data)
	
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 6 then
		tweak_data.group_ai.enemy_spawn_groups.FBI_swats.spawn[3].amount_max = 2
		tweak_data.group_ai.enemy_spawn_groups.FBI_swats.spawn[3].freq = 2
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[3].amount_max = 2
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[3].freq = 2
	elseif difficulty_index == 7 then
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[4].amount_max = 2
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[4].freq = 2
	else
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[4].amount_max = 3
		tweak_data.group_ai.enemy_spawn_groups.GS_swats.spawn[4].freq = 2		
	end
	
end

function ModifierHeavies:modify_value(id, value)
end