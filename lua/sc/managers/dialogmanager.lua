local old_queue_dialog = DialogManager.queue_dialog

function DialogManager:queue_dialog(id, ...)
	local escape_time = 0
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--log("SC: Found Event! " .. id)
			
	if Global.game_settings and Global.game_settings.one_down then		
		
		--Crime and Punishment (custom)--
        if id == "crime_escorttwo" then
            if difficulty_index <= 2 then
                escape_time = 750
            elseif difficulty_index == 3 then
                escape_time = 720
            elseif difficulty_index == 4 then
                escape_time = 690
            elseif difficulty_index == 5 then
                escape_time = 660    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 630                        
            else
                escape_time = 600
            end        
        end
        
        --Hunter and Hunted (custom) Day 1--
        if id == "hunt_roof" then
            if difficulty_index <= 2 then
                escape_time = 510
            elseif difficulty_index == 3 then
                escape_time = 480
            elseif difficulty_index == 4 then
                escape_time = 450
            elseif difficulty_index == 5 then
                escape_time = 420    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 390                        
            else
                escape_time = 360
            end        
        end

        --Hunter and Hunted (custom) Day 2--
        if id == "hunt_grabequip" then
            if difficulty_index <= 2 then
                escape_time = 510
            elseif difficulty_index == 3 then
                escape_time = 480
            elseif difficulty_index == 4 then
                escape_time = 450
            elseif difficulty_index == 5 then
                escape_time = 420    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 390                        
            else
                escape_time = 360
            end        
        end

        --Triad Takedown Remastered (custom)--
        if id == "ttr_finalhack" then
            if difficulty_index <= 2 then
                escape_time = 570
            elseif difficulty_index == 3 then
                escape_time = 540
            elseif difficulty_index == 4 then
                escape_time = 510
            elseif difficulty_index == 5 then
                escape_time = 480    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 450                        
            else
                escape_time = 420
            end        
        end

        --Harboring a Grudge (custom)--
        if id == "charbor_secure" then
            if difficulty_index <= 2 then
                escape_time = 870
            elseif difficulty_index == 3 then
                escape_time = 840
            elseif difficulty_index == 4 then
                escape_time = 810
            elseif difficulty_index == 5 then
                escape_time = 780    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 750                        
            else
                escape_time = 720
            end        
        end

        --End of an Era (custom)--
        if id == "cmex_masterpc" then
            if difficulty_index <= 2 then
                escape_time = 630
            elseif difficulty_index == 3 then
                escape_time = 600
            elseif difficulty_index == 4 then
                escape_time = 570
            elseif difficulty_index == 5 then
                escape_time = 540    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 510                        
            else
                escape_time = 480
            end        
        end
		
		--Scarlet Club (custom)--
        if id == "sch_escort" then
            if difficulty_index <= 2 then
                escape_time = 750
            elseif difficulty_index == 3 then
                escape_time = 720
            elseif difficulty_index == 4 then
                escape_time = 690
            elseif difficulty_index == 5 then
                escape_time = 660    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 630                        
            else
                escape_time = 600
            end        
        end

		--Constantine Scores: Gunrunner's Clubhouse (custom)--
        if id == "gunrunner_obj3" then
            if difficulty_index <= 2 then
                escape_time = 570
            elseif difficulty_index == 3 then
                escape_time = 540
            elseif difficulty_index == 4 then
                escape_time = 510
            elseif difficulty_index == 5 then
                escape_time = 480    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 450                        
            else
                escape_time = 420
            end        
        end
        
        	--Botched Bank (custom)--
        if id == "Play_clt_jambank_25" then
            if difficulty_index <= 2 then
                escape_time = 750
            elseif difficulty_index == 3 then
                escape_time = 720
            elseif difficulty_index == 4 then
                escape_time = 690
            elseif difficulty_index == 5 then
                escape_time = 660    
            elseif difficulty_index == 6 or difficulty_index == 7 then
                escape_time = 630                        
            else
                escape_time = 600
            end        
        end
		
		if escape_time > 0 then
			if managers.groupai:state():whisper_mode() then
				--Could try PONR stuff for stealth heists, we'll see
			else
				managers.groupai:state():set_point_of_no_return_timer(escape_time, 0)
			end
		end
	end	
			
	return old_queue_dialog(self, id, ...)
end
