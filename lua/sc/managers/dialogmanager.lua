local old_queue_dialog = DialogManager.queue_dialog
function DialogManager:queue_dialog(id, ...)
	local escape_time = 0
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	log("SC: Found Event! " .. id)
			
	if Global.game_settings and Global.game_settings.one_down then
	
		--Train Heist--				
		if id == "Play_pln_tr1b_02" then
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
	
		--generic "that's enough but you can stay for more"--				
		if id == "play_pln_gen_bfr_06" then
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
		
		--Nightclub--
		if id == "pln_nightclub_stage1_10" then
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
		
		--Firestarter Day 1--
		if id == "pln_fs1_11" then
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
		
		--Firestarter Day 2--
		if id == "pln_fs2_20" then
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
	
		--Firestarter Day 3--
		if id == "pln_fs3_07" then
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
	
		--Highland Mortuary--		
		if id == "Play_loc_rvd_14" then
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
		
		--Beneath The Mountain--			
		if id == "Play_loc_jr1_49" then
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
	
		--Big Bank--			
		if id == "Play_pln_bb1_64" or id == "Play_pln_bb1_38" then
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
	
		--Boiling Point--
		if id == "Play_pln_mad_45" then
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
	
		--The Diamond--
		if id == "Play_pln_hd1_34" then
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
	
		--Watchdogs Day 1 IF twitch dies--
		--when bain says bile is coming
		if id == "pln_watchdogs_new_stage1_21" then
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
	
		--Watchdogs Day 2--
		if id == "pln_watchdogs_new_stage2_10" then
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
	
		--Bomb Forest--
		if id == "Play_pln_cr3_34" then
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
	
		--Scarface Mansion--
		if id == "Play_pln_fri_36" then
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
	
		--Bomb Dockyard--
		if id == "Play_pln_cr2_104 " then
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
		if id == "pln_bo2_36" or id == "pln_bo2_40" or id == "pln_bo2_39" then
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
		
		--Breaking Ballot--
		if id == "Play_pln_ed3_18" or id == "Play_pln_ed3_17" then
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
		
		--Swing Vote--
		if id == "Play_pln_ed2_14" then
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
	
		--H&T Bank Heist (all versions)--
		if id == "pln_branchbank_stage1_08" or id == "pln_branchbank_stage1_13" or id == "pln_branchbank_stage1_44" or id == "pln_branchbank_stage1_29" then
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
		
		--Hoxton Revenge--
		if id == "Play_pln_hb3_42" then
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
		if id == "Play_pln_man_74" or id == "Play_pln_man_73" then
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

		--Green Bridge--
		if id == "Play_pln_glace_29" then
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

		--Diamond Heist--
		if id == "Play_pln_dah_120" then
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
