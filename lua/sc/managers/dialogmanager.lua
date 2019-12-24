if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_queue_dialog = DialogManager.queue_dialog
	function DialogManager:queue_dialog(id, ...)
		local escape_time = 0
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		
		log("SC: Found Event! " .. id)
				
		if Global.game_settings and Global.game_settings.one_down then
		
			--Big Oil Day 1--
			if id == "pln_bo1_05" then
				if difficulty_index <= 2 then
					escape_time = 390
				elseif difficulty_index == 3 then
					escape_time = 360
				elseif difficulty_index == 4 then
					escape_time = 330
				elseif difficulty_index == 5 then
					escape_time = 300	
				elseif difficulty_index == 6 or difficulty_index == 7 then
					escape_time = 270						
				else
					escape_time = 240
				end	
			end	
		
			--Big Oil Day 2--
			if id == "pln_bo2_36" then
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
		
			--Bank Heist: Cash--
			if id == "Play_pln_branchbank_stage1_13" then
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
			
			--Hoxton Breakout Day 2--
			if id == "Play_pln_hb2_19" then
				if difficulty_index <= 2 then
					escape_time = 390
				elseif difficulty_index == 3 then
					escape_time = 360
				elseif difficulty_index == 4 then
					escape_time = 330
				elseif difficulty_index == 5 then
					escape_time = 300	
				elseif difficulty_index == 6 or difficulty_index == 7 then
					escape_time = 270						
				else
					escape_time = 240
				end			
			end		

			--Undercover--
			if id == "Play_pln_man_74" then
				if difficulty_index <= 2 then
					escape_time = 270
				elseif difficulty_index == 3 then
					escape_time = 240
				elseif difficulty_index == 4 then
					escape_time = 210
				elseif difficulty_index == 5 then
					escape_time = 180	
				elseif difficulty_index == 6 or difficulty_index == 7 then
					escape_time = 150					
				else
					escape_time = 120
				end			
			end				

			--First World Bank--
			if id == "Play_pln_fwb_62" then
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

			--Counterfeit--
			if id == "Play_pln_pal_77" then
				if difficulty_index <= 2 then
					escape_time = 270
				elseif difficulty_index == 3 then
					escape_time = 240
				elseif difficulty_index == 4 then
					escape_time = 210
				elseif difficulty_index == 5 then
					escape_time = 180	
				elseif difficulty_index == 6 or difficulty_index == 7 then
					escape_time = 150					
				else
					escape_time = 120
				end					
			end	

			--Slaughterhouse--
			if id == "Play_pln_dn1_25" then
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

end