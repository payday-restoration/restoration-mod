function CopLogicInactive.on_enemy_weapons_hot(data)
	if data.unit:interaction():active() then
		data.unit:interaction():set_active(false, true, true)
	end
end

function CopLogicInactive._register_attention(data, my_data)
	if data.unit:character_damage():dead() then
		data.unit:brain():set_attention_settings({
			corpse_sneak = true
		})

		if not managers.groupai:state():whisper_mode() then
			data.unit:brain():set_attention_settings(nil)
		end
	else
		data.unit:brain():set_attention_settings(nil)
	end
end