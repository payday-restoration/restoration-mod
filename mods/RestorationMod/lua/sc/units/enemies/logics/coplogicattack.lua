if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
		local focus_enemy = data.attention_obj

		if shoot then
			if not my_data.firing then
				data.unit:movement():set_allow_fire(true)

				my_data.firing = true

				if not data.unit:in_slot(16) and data.char_tweak.chatter.aggressive then
					if data.unit:base()._tweak_table == "spring" then
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive_captain")
					else
						managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
					end	
				end
			end
		elseif my_data.firing then
			data.unit:movement():set_allow_fire(false)

			my_data.firing = nil
		end
	end

end