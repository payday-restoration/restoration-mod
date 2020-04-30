InteractionTweakData.restoration = InteractionTweakData.init

function InteractionTweakData:init(...)
	InteractionTweakData:restoration(...)

	--Safehouse Boost for returning LVL100+ users	
	self.res_saveboost = {}
	self.res_saveboost.text_id = "res_saveboost"
	self.res_saveboost.action_text_id = "res_saveboost_action"
	self.res_saveboost.timer = 5
	
	--Levels--
	
	--Dockyard
	self.res_lvl_wetwork = {}
	self.res_lvl_wetwork.text_id = "res_lvl_wetwork"
	self.res_lvl_wetwork.action_text_id = "res_lvl_wetwork_action"
	self.res_lvl_wetwork.timer = 3
	
	--Surface Tension
	self.res_lvl_platinum = {}
	self.res_lvl_platinum.text_id = "res_lvl_platinum"
	self.res_lvl_platinum.action_text_id = "res_lvl_platinum_action"
	self.res_lvl_platinum.timer = 3

	--Green Harvest
	self.res_lvl_greenharvest = {}
	self.res_lvl_greenharvest.text_id = "res_lvl_greenharvest"
	self.res_lvl_greenharvest.action_text_id = "res_lvl_greenharvest_action"
	self.res_lvl_greenharvest.timer = 3
	
	--Capitol Savings
	self.res_lvl_capitol = {}
	self.res_lvl_capitol.text_id = "res_lvl_capitol"
	self.res_lvl_capitol.action_text_id = "res_lvl_capitol_action"
	self.res_lvl_capitol.timer = 3

	--Convenience Store
	self.res_lvl_shop = {}
	self.res_lvl_shop.text_id = "res_lvl_shop"
	self.res_lvl_shop.action_text_id = "res_lvl_shop_action"
	self.res_lvl_shop.timer = 3
	
	--Alaska
	self.res_lvl_alaska = {}
	self.res_lvl_alaska.text_id = "res_lvl_alaska"
	self.res_lvl_alaska.action_text_id = "res_lvl_alaska_action"
	self.res_lvl_alaska.timer = 3
	
	--Departing
	self.res_lvl_departing = {}
	self.res_lvl_departing.text_id = "res_lvl_departing"
	self.res_lvl_departing.action_text_id = "res_lvl_departing_action"
	self.res_lvl_departing.timer = 3
	
	--Jackal Mercenary Backup
	self.res_lvl_assault_merc = {}
	self.res_lvl_assault_merc.text_id = "res_lvl_assault_merc"
	self.res_lvl_assault_merc.action_text_id = "res_lvl_assault_merc_action"
	self.res_lvl_assault_merc.timer = 3
	
	--Shatter Alias Backup
	self.res_lvl_assault_shatter = {}
	self.res_lvl_assault_shatter.text_id = "res_lvl_assault_shatter"
	self.res_lvl_assault_shatter.action_text_id = "res_lvl_assault_shatter_action"
	self.res_lvl_assault_shatter.timer = 3
	
	
	self.start_sentrygun_repairmode = {
		icon = "icon_repair",
		timer = 5,
		text_id = "hud_repair_sentry",
		blocked_hint = "hint_repair_sentry",
		sound_start = "bar_turret_ammo",
		sound_interrupt = "bar_turret_ammo_cancel",
		sound_done = "bar_turret_ammo_finished",
		action_text_id = "hud_action_repair_sentry",
		interact_distance = 180,
--		max_interact_distance = 200,
		no_contour = true,
		blackout_vulnerable = true,
		verify_owner = true
	}	

	--Skill based shaped charges--
	self.shaped_sharge = {
		icon = "equipment_c4",
		text_id = "hud_int_equipment_shaped_charge",
		contour = "interactable_icon",
		required_deployable = "trip_mine",
		deployable_consume = true,
		timer = 2,
		sound_start = "bar_c4_apply",
		sound_interupt = "bar_c4_apply_cancel",
		sound_done = "bar_c4_apply_finished",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},
		action_text_id = "hud_action_placing_shaped_charge",
		slot = 2,
		blocked_hint = ""
	}	
	self.shaped_charge_single = deep_clone(self.shaped_sharge)
	self.shaped_charge_single.axis = "z"		
	
	--Mission C4
	self.c4 = {
		icon = "equipment_c4",
		text_id = "debug_interact_c4",
		timer = 2,
		sound_start = "bar_c4_apply",
		sound_interupt = "bar_c4_apply_cancel",
		sound_done = "bar_c4_apply_finished",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},					
		action_text_id = "hud_action_placing_c4"
	}	
	self.c4_mission_door = deep_clone(self.c4)
	self.c4_mission_door.special_equipment = "c4"
	self.c4_mission_door.equipment_text_id = "debug_interact_equipment_c4"
	self.c4_mission_door.equipment_consume = true		
	self.c4_special = {
		icon = "equipment_c4",
		text_id = "debug_interact_c4",
		equipment_text_id = "debug_interact_equipment_c4",
		equipment_consume = true,
		timer = 2,
		sound_start = "bar_c4_apply",
		sound_interupt = "bar_c4_apply_cancel",
		sound_done = "bar_c4_apply_finished",
		axis = "z",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},			
		action_text_id = "hud_action_placing_c4"
	}
	self.c4_bag = {
		text_id = "debug_interact_c4_bag",
		timer = 4,
		contour = "interactable",
		axis = "z",
		sound_start = "bar_bag_generic",
		sound_interupt = "bar_bag_generic_cancel",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},			
		sound_done = "bar_bag_generic_finished"
	}
	self.c4_x1_bag = {
		text_id = "debug_interact_c4_bag",
		timer = 4,
		contour = "interactable",
		sound_start = "bar_bag_generic",
		sound_interupt = "bar_bag_generic_cancel",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},					
		sound_done = "bar_bag_generic_finished"
	}		
	self.shape_charge_plantable = {
		text_id = "debug_interact_c4",
		action_text_id = "hud_action_placing_c4",
		equipment_text_id = "debug_interact_equipment_c4",
		special_equipment = "c4",
		equipment_consume = true,
		axis = "z",
		timer = 2,
		sound_start = "bar_c4_apply",
		sound_interupt = "bar_c4_apply_cancel",
		upgrade_timer_multiplier = {
			upgrade = "trip_mine_deploy_time_multiplier",
			category = "player"
		},			
		sound_done = "bar_c4_apply_finished"
	}		
	self.shape_charge_plantable_c4_1 = deep_clone(self.shape_charge_plantable)
	self.shape_charge_plantable_c4_1.special_equipment = "c4_1"
	self.shape_charge_plantable_c4_x1 = deep_clone(self.shape_charge_plantable)
	self.shape_charge_plantable_c4_x1.special_equipment = "c4_x1"
	self.shape_charge_plantable_c4_x1.interact_distance = 500	
	self.c4_x10 = deep_clone(self.c4_mission_door)
	self.c4_x10.special_equipment = "c4_x10"
	self.c4_x10.axis = "z"	
	self.c4_consume = deep_clone(self.c4_special)
	self.c4_consume.special_equipment = "c4"
	self.c4_consume.equipment_consume = true	
	self.c4_consume_x1 = deep_clone(self.c4_special)
	self.c4_consume_x1.special_equipment = "c4_x1"
	self.c4_consume_x1.equipment_consume = true		
	self.c4_consume_x3 = deep_clone(self.c4_special)
	self.c4_consume_x3.special_equipment = "c4_x3"
	self.c4_consume_x3.equipment_consume = true
	
	--Faster hacking--
	self.requires_ecm_jammer_double = {
		icon = "equipment_ecm_jammer",
		contour = "interactable_icon",
		text_id = "hud_int_use_ecm_jammer",
		required_deployable = "ecm_jammer",
		deployable_consume = true,
		timer = 4,
		sound_start = "bar_c4_apply",
		sound_interupt = "bar_c4_apply_cancel",
		sound_done = "bar_c4_apply_finished",
		action_text_id = "hud_action_placing_ecm_jammer",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		requires_upgrade = {
			upgrade = "can_open_sec_doors",
			category = "ecm_jammer"
		}
	}		
	self.requires_ecm_jammer = deep_clone(self.requires_ecm_jammer_double)
	self.requires_ecm_jammer.axis = "y"
	self.requires_ecm_jammer_atm = deep_clone(self.requires_ecm_jammer)
	self.requires_ecm_jammer_atm.timer = 8
	self.requires_ecm_jammer_atm.requires_upgrade = {
		upgrade = "affects_cameras",
		category = "ecm_jammer"
	}		
	
	self.hack_ipad = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_hack_ipad",
		timer = 3,
		sound_start = "bar_drill_apply",
		sound_interupt = "bar_drill_apply_cancel",
		sound_done = "bar_drill_apply_finished",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		axis = "x"
	}
	self.hack_ipad_jammed = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_hack_ipad_jammed",
		timer = 10,
		sound_start = "bar_drill_fix",
		sound_interupt = "bar_drill_fix_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		sound_done = "bar_drill_fix_finished"
	}
	self.hack_suburbia = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_hack_ipad",
		timer = 5,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		sound_done = "bar_keyboard_finished",
		axis = "y",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		contour = "contour_off"
	}
	self.hack_suburbia_outline = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_hack_ipad",
		timer = 5,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		sound_done = "bar_keyboard_finished",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		axis = "y"
	}		
	self.hack_suburbia_jammed = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_hack_ipad_jammed",
		timer = 5,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		sound_done = "bar_keyboard_finished"
	}
	self.hack_suburbia_jammed_y = deep_clone(self.hack_suburbia_jammed)
	self.hack_suburbia_jammed_y.axis = "y"
	self.hack_suburbia_jammed_axis = deep_clone(self.hack_suburbia_jammed)
	self.hack_suburbia_jammed_axis.axis = "y"
	self.hack_suburbia_axis = deep_clone(self.hack_suburbia)
	self.hack_suburbia_axis.axis = "y"
	self.security_station = {
		icon = "equipment_hack_ipad",
		text_id = "debug_interact_security_station",
		timer = 3,
		sound_start = "bar_drill_apply",
		sound_interupt = "bar_drill_apply_cancel",
		sound_done = "bar_drill_apply_finished",
		axis = "z",
		start_active = false,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_keyboard_finished"
	}
	self.security_station_keyboard = {
		icon = "interaction_keyboard",
		text_id = "debug_interact_security_station",
		timer = 6,
		axis = "z",
		start_active = false,
		interact_distance = 150,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_keyboard_finished"
	}
	self.big_computer_hackable = {
		icon = "interaction_keyboard",
		text_id = "hud_int_big_computer_hackable",
		timer = 6,
		start_active = false,
		interact_distance = 200,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_keyboard_finished"
	}
	self.big_computer_not_hackable = {
		icon = "interaction_keyboard",
		text_id = "hud_int_big_computer_hackable",
		timer = 6,
		start_active = false,
		interact_distance = 200,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		sound_done = "bar_keyboard_finished",
		equipment_text_id = "hud_int_big_computer_unhackable",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		special_equipment = "nothing"
	}
	self.big_computer_server = {
		icon = "interaction_keyboard",
		text_id = "hud_int_big_computer_server",
		timer = 6,
		start_active = false,
		interact_distance = 150,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_keyboard_finished"
	}
	self.security_station_jammed = {
		icon = "interaction_keyboard",
		text_id = "debug_interact_security_station_jammed",
		timer = 10,
		sound_start = "bar_drill_fix",
		sound_interupt = "bar_drill_fix_cancel",
		sound_done = "bar_drill_fix_finished",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		axis = "z"
	}	
	self.hack_numpad = {
		text_id = "hud_int_hold_hack_numpad",
		action_text_id = "hud_action_hacking_numpad",
		start_active = false,
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		timer = 15
	}		
	self.votingmachine2 = {
		text_id = "debug_interact_hack_ipad",
		timer = 5,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},					
		sound_done = "bar_keyboard_finished"
	}
	self.votingmachine2_jammed = {
		text_id = "debug_interact_hack_ipad_jammed",
		timer = 5,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},					
		sound_done = "bar_keyboard_finished"
	}	
	self.sc_tape_loop = {
		icon = "interaction_help",
		text_id = "hud_int_tape_loop",
		start_active = true,
		interact_distance = 300,
		no_contour = true,
		timer = 2,
		action_text_id = "hud_action_tape_looping",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		requires_upgrade = {
			upgrade = "tape_loop_duration",
			category = "player"
		}
	}
	self.hack_electric_box = {
		text_id = "hud_int_hack_box",
		action_text_id = "hud_action_hack_box",
		timer = 6,
		start_active = false,
		axis = "y",
		sound_start = "bar_hack_fuse_box",
		sound_interupt = "bar_hack_fuse_box_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},
		sound_done = "bar_hack_fuse_box_finished"
	}
	self.hack_ship_control = {
		icon = "interaction_keyboard",
		text_id = "hud_hack_ship_control",
		action_text_id = "hud_hacking_ship_control",
		timer = 6,
		axis = "z",
		start_active = false,
		interact_distance = 150,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		sound_done = "bar_keyboard_finished"
	}		
	self.timelock_hack = {
		text_id = "hud_int_hack_timelock",
		action_text_id = "hud_action_hack_timelock",
		timer = 6,
		start_active = false,
		axis = "y",
		sound_start = "bar_hack_fuse_box",
		sound_interupt = "bar_hack_fuse_box_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_hack_fuse_box_finished"
	}		
	self.mcm_laptop = {
		text_id = "hud_int_hack_laptop",
		action_text_id = "hud_action_hack_laptop",
		timer = 3,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},			
		sound_done = "bar_keyboard_finished"
	}		
	self.hack_skylight_barrier = {
		text_id = "hud_hack_skylight_barrier",
		action_text_id = "hud_action_hack_skylight_barrier",
		timer = 6,
		start_active = false,
		axis = "y",
		sound_start = "bar_hack_fuse_box",
		sound_interupt = "bar_hack_fuse_box_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_hack_fuse_box_finished"
	}		
	self.drk_hold_hack_computer = {
		text_id = "hud_int_big_computer_hackable",
		action_text_id = "hud_action_hacking_computer",
		timer = 10,
		axis = "y",
		start_active = false,
		sound_start = "bar_train_panel_hacking",
		sound_interupt = "bar_train_panel_hacking_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_train_panel_hacking_finished"
	}	
	self.hold_start_scan = {
		text_id = "hud_hold_start_scanning",
		action_text_id = "hud_action_start_scanning",
		interact_distance = 150,
		timer = 3,
		start_active = false,
		force_update_position = true,
		sound_start = "bar_train_panel_hacking",
		sound_interupt = "bar_train_panel_hacking_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},	
		sound_done = "bar_train_panel_hacking_finished"
	}	
	self.hold_new_hack = {
		text_id = "hud_int_hold_start_new_hack",
		action_text_id = "hud_action_starting_new_hack",
		start_active = false,
		timer = 3,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},				
		sound_done = "bar_keyboard_finished"
	}	
	self.hold_type_in_password = {
		text_id = "hud_int_type_in_password",
		action_text_id = "hud_action_typing_in_password",
		timer = 5,
		interact_distance = 200,
		start_active = false,
		sound_start = "bar_keyboard",
		sound_interupt = "bar_keyboard_cancel",
		upgrade_timer_multiplier = {
			upgrade = "hack_fix_interaction_speed_multiplier",
			category = "player"
		},					
		sound_done = "bar_keyboard_finished"
	}
	self.hold_hack_server_room = deep_clone(self.hold_type_in_password)
	self.hold_hack_server_room.text_id = "hud_int_hack_server_room"
	self.hold_hack_server_room.action_text_id = "hud_action_hacking_server_room"	
	
	--PEOC Pardons
	self.take_pardons.timer = 0
	
	 --these are for indicating that this interaction can be disabled by autumn; should only be used for equipment. (start_sentrygun_repairmode is already done, see above)
	self.sentry_gun.blackout_vulnerable = true
	self.sentry_gun_fire_mode.blackout_vulnerable = true
	self.ammo_bag.blackout_vulnerable = true
	self.doctor_bag.blackout_vulnerable = true
	self.first_aid_kit.blackout_vulnerable = true
	self.bodybags_bag.blackout_vulnerable = true
	self.ecm_jammer.blackout_vulnerable = true
	self.trip_mine.blackout_vulnerable = true
	self.grenade_briefcase.blackout_vulnerable = true
	--Grenade crate
	self.invisible_interaction_open_superfast = {
		icon = "develop",
		text_id = "hud_int_invisible_interaction_open",
		timer = 0
	}	
	self.grenade_briefcase = deep_clone(self.invisible_interaction_open_superfast)
	self.grenade_briefcase.contour = "deployable"
	
	--Gage package
	self.gage_assignment.timer = 0		
	self.gage_assignment.sound_start = "money_grab"	
	self.gage_assignment.sound_event = "money_grab"	
	self.gage_assignment.sound_done = "money_grab"	

end