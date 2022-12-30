local old_queue_dialog = DialogManager.queue_dialog

function DialogManager:queue_narrator_dialog(id, params)
	return self:queue_dialog(self._narrator_prefix .. id, params)
end

function DialogManager:queue_dialog(id, ...)
	local escape_time = 0
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--log("SC: Found Event! " .. id)
			
	if Global.game_settings and Global.game_settings.one_down then
	
		--Ranch--				
		if id == "Play_loc_ranc_62" then
			if difficulty_index <= 2 then
				escape_time = 1650
			elseif difficulty_index == 3 then
				escape_time = 1620
			elseif difficulty_index == 4 then
				escape_time = 1590
			elseif difficulty_index == 5 then
				escape_time = 1560	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1530					
			else
				escape_time = 1500
			end			
		end			

        --also ranch jsut in case the no weapons shit happens again	
		if id == "Play_loc_ranc_66" then
			if difficulty_index <= 2 then
				escape_time = 1650
			elseif difficulty_index == 3 then
				escape_time = 1620
			elseif difficulty_index == 4 then
				escape_time = 1590
			elseif difficulty_index == 5 then
				escape_time = 1560	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1530					
			else
				escape_time = 1500
			end			
		end	
	
		--Mountain Master--				
		if id == "Play_loc_pent_65" then
			if difficulty_index <= 2 then
				escape_time = 1250
			elseif difficulty_index == 3 then
				escape_time = 1220
			elseif difficulty_index == 4 then
				escape_time = 1290
			elseif difficulty_index == 5 then
				escape_time = 1260	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1230					
			else
				escape_time = 1200
			end			
		end	
		
		--Prison Nightmare--				
		if id == "Play_pln_hlp_35" then
				escape_time = 300	
		end
		
		--Black Cat Fun Method--				
		if id == "Play_loc_chca_79" then
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
	
		--Black Cat C4--				
		if id == "Play_loc_chca_105" then
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
	
		--Framing Frame Day 1--				
		if id == "pln_framing_stage1_09" then
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
	
		--Framing Frame Day 2--				
		if id == "pln_framing_stage2_13" then
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
	
		--Framing Frame Day 3--				
		if id == "pln_framing_stage3_43" then
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
	
		--Metldown--				
		if id == "Play_vld_ko1b_03" then
			if difficulty_index <= 2 then
				escape_time = 1650 
			elseif difficulty_index == 3 then
				escape_time = 1620
			elseif difficulty_index == 4 then
				escape_time = 1590
			elseif difficulty_index == 5 then
				escape_time = 1560	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1530					
			else
				escape_time = 1500
			end		
		end	
	
		--Border Crossing--				
		if id == "Play_loc_mex_66" then
			if difficulty_index <= 2 then
				escape_time = 1650 
			elseif difficulty_index == 3 then
				escape_time = 1620
			elseif difficulty_index == 4 then
				escape_time = 1590
			elseif difficulty_index == 5 then
				escape_time = 1560	
			elseif difficulty_index == 6 or difficulty_index == 7 then
				escape_time = 1530					
			else
				escape_time = 1500
			end		
		end	
	
		--Biker Heist Day 1--				
		if id == "Play_pln_brn_11" then
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
	
		--Biker Heist Day 2--				
		if id == "Play_pln_chw_01" then
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
	
		--Hotline Miami Day 1--				
		if id == "Play_pln_hm1_52" then
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
	
		--Hotline Miami Day 2--				
		if id == "Play_pln_hm2_15" then
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
	
		--Four Stores--				
		if id == "pln_fost_vh_01" then
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
	
		--Brooklyn Bank--				
		if id == "Play_loc_brb_53" then
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
	
		--Jewelery Store & Ukrainian Job--				
		if id == "Play_pln_ukranian_stage1_28" then
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
	
		--Diamond Store--				
		if id == "Play_pln_fj1_07" then
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
	
		--Mallcrasher--				
		if id == "pln_mallcrash_stage1_14" then
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
		if id == "pln_fs1_09" then
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
	
		--Goat Simulator Day 1--		
		if id == "Play_vld_pt1_05b" then
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
	
		--Goat Simulator Day 2--		
		if id == "Play_pln_pt2_16" then
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
	
		--Garnet Group Boutique--		
		if id == "Play_pln_rvd_48a" then
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
		
		--Birth of Sky--			
		if id == "Play_loc_jr2_27" then
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
		--PLEASE WORK ALL THE TIME NOW
		if id == "Play_pln_cr2_35" or id == "Play_pln_cr2_104" then
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
		
		--White Xmas
		if id == "Play_vld_cp1_03" or id == "Play_pln_cp1_08" then
			if difficulty_index <= 2 then
				escape_time = 660
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
		
		--Stealing Xmas--
		if id == "Play_pln_moon_27" then
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
