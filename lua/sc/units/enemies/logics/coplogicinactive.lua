-- Remove corpse attention settings on loud
function CopLogicInactive.on_enemy_weapons_hot(data)
	data.unit:brain():set_attention_settings(nil)

	if data.unit:interaction():active() then
		data.unit:interaction():set_active(false, true, true)
	end
end

function CopLogicInactive._register_attention(data)
	if data.unit:character_damage():dead() and not managers.groupai:state():enemy_weapons_hot() then
		data.unit:brain():set_attention_settings({ corpse_sneak = true })
	else
		data.unit:brain():set_attention_settings(nil)
	end
end
