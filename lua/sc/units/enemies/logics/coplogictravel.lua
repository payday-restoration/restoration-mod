if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

    function CopLogicTravel.queued_update(data)
    	local my_data = data.internal_data
    	data.t = TimerManager:game():time()
    	my_data.close_to_criminal = nil
    	local delay = CopLogicTravel._upd_enemy_detection(data)
    
    	if data.internal_data ~= my_data then
    		return
    	end
    
    	CopLogicTravel.upd_advance(data)
    
    	if data.internal_data ~= my_data then
    		return
    	end
    
    	if not delay then
    		debug_pause_unit(data.unit, "crap!!!", inspect(data))	
    
    		delay = 1
    	end
    	
    	if my_data.coarse_path then
    		if data.char_tweak.chatter.clear and data.unit:anim_data().idle and not ( data.attention_obj and data.attention_obj.reaction >= AIAttentionObject.REACT_COMBAT and data.attention_obj.verified_t and data.attention_obj.verified_t < 10 ) then
				if data.unit:movement():cool() then
					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear_whisper" )
				else
					managers.groupai:state():chk_say_enemy_chatter( data.unit, data.m_pos, "clear" )
				end
    		end
    	end		
    	  
    	CopLogicTravel.queue_update(data, data.internal_data, delay)
    end	
end

