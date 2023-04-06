local old_queue_dialog = DialogManager.queue_dialog

function DialogManager:queue_dialog(id, ...)
	local escape_time = 0
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--log("SC: Found Event! " .. id)
			
	if Global.game_settings and Global.game_settings.one_down then
	
		--Dragon Heist--				
		if id == "Play_loc_chas_89" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end		
		end	
	
		--Buluc's Mansion--				
		if id == "Play_loc_fex_58a" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end		
		end
	
		--Alaskan Deal--				
		if id == "Play_cpt_wwh_16" then
			if difficulty_index <= 2 then
				escape_time = 1050
			elseif difficulty_index == 3 then
				escape_time = 1020
			elseif difficulty_index == 4 then
				escape_time = 990
			elseif difficulty_index == 5 then
				escape_time = 960	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 930					
			else
				escape_time = 900
			end		
		end	
	
		--The Alesso Heist--				
		if id == "Play_pln_al1_49" then
			if difficulty_index <= 2 then
				escape_time = 1050
			elseif difficulty_index == 3 then
				escape_time = 1020
			elseif difficulty_index == 4 then
				escape_time = 990
			elseif difficulty_index == 5 then
				escape_time = 960	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 930					
			else
				escape_time = 900
			end		
		end
	
		--Brook 10-10 on crackhead mode? This brings new insanity--				
		if id == "Play_cha_spa_14" then
			if difficulty_index <= 2 then
				escape_time = 450 
			elseif difficulty_index == 3 then
				escape_time = 420
			elseif difficulty_index == 4 then
				escape_time = 390
			elseif difficulty_index == 5 then
				escape_time = 360	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 330						
			else
				escape_time = 300
			end
		end
	
		--White House--				
		if id == "Play_loc_vit_137" then
			if difficulty_index <= 2 then
				escape_time = 1050
			elseif difficulty_index == 3 then
				escape_time = 1020
			elseif difficulty_index == 4 then
				escape_time = 990
			elseif difficulty_index == 5 then
				escape_time = 960	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 930					
			else
				escape_time = 900
			end		
		end
	
		--Golden Grin Casino--		
		if id == "Play_pln_ca1_158" then
			if difficulty_index <= 2 then
				escape_time = 1200 
			elseif difficulty_index == 3 then
				escape_time = 1170
			elseif difficulty_index == 4 then
				escape_time = 1140
			elseif difficulty_index == 5 then
				escape_time = 1080	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1080						
			else
				escape_time = 1050
			end
		end
	
		--Shacklethorne Auction--		
		if id == "Play_loc_sah_85" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end
		end
	
		--San Martin Bank--
		if id == "Play_loc_bex_108" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end
		end	
	
		--Breakfast In Tijuana--
		if id == "Play_loc_pex_101" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end
		end	
	
		--Henry's Rock--
		if id == "Play_loc_des_84" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end
		end			

		--Aftershock--
		if id == "Play_plt_as1_01" then
			if difficulty_index <= 2 then
				escape_time = 510
			elseif difficulty_index == 3 then
				escape_time = 480
			elseif difficulty_index == 4 then
				escape_time = 540
			elseif difficulty_index == 5 then
				escape_time = 420	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 390					
			else
				escape_time = 360
			end			
		end	

		--Counterfeit--
		--Escaping
		if id == "Play_pln_pal_59" or id == "Play_pln_pal_76" then
			if difficulty_index <= 2 then
				escape_time = 330
			elseif difficulty_index == 3 then
				escape_time = 300
			elseif difficulty_index == 4 then
				escape_time = 270
			elseif difficulty_index == 5 then
				escape_time = 240	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 210				
			else
				escape_time = 180
			end						
		end	
		
		--Printing whenever the printer starts a little awkward because restarting the power also resets this
		if id == "Play_pln_pal_71" then
			if difficulty_index <= 2 then
				escape_time = 690
			elseif difficulty_index == 3 then
				escape_time = 660
			elseif difficulty_index == 4 then
				escape_time = 630
			elseif difficulty_index == 5 then
				escape_time = 600	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 570						
			else
				escape_time = 540
			end					
		end			
		
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
