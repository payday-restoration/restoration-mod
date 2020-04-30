function AttentionTweakData:_init_player()
	self.settings.pl_civilian = {
		max_range = 1,
		reaction = "REACT_IDLE",
		notice_delay_mul = 1,
		notice_requires_FOV = true,
		verification_interval = 4,
		release_delay = 1,
		filter = "none"
	}
	self.settings.pl_mask_off_friend_combatant = {
		max_range = 1000,
		reaction = "REACT_IDLE",
		notice_delay_mul = 1,
		relation = "friend",
		filter = "combatant",
		notice_requires_FOV = false,
		verification_interval = 4,
		release_delay = 3,
		duration = {
			2,
			5
		},
		pause = {
			15,
			25
		}
	}
	self.settings.pl_mask_off_foe_combatant = {
		max_range = 600,
		reaction = "REACT_SUSPICIOUS",
		notice_delay_mul = 0.3,
		suspicion_duration = 4,
		suspicion_range = 500,
		relation = "foe",
		filter = "combatant",
		uncover_range = 150,
		turn_around_range = 250,
		notice_requires_FOV = true,
		verification_interval = 0.02,
		release_delay = 2
	}
	self.settings.pl_mask_off_foe_non_combatant = {
		max_range = 600,
		reaction = "REACT_IDLE",
		notice_delay_mul = 0,
		notice_interval = 0.5,
		filter = "non_combatant",
		attract_chance = 0.5,
		notice_requires_FOV = true,
		verification_interval = 2,
		release_delay = 3,
		duration = {
			2,
			15
		},
		pause = {
			10,
			60
		}
	}
	self.settings.pl_mask_off_friend_non_combatant = {
		max_range = 600,
		reaction = "REACT_IDLE",
		notice_delay_mul = 0,
		notice_interval = 0.5,
		relation = "friend",
		filter = "non_combatant",
		attract_chance = 0.5,
		notice_requires_FOV = true,
		verification_interval = 2,
		release_delay = 3,
		duration = {
			2,
			15
		},
		pause = {
			10,
			60
		}
	}
	self.settings.pl_mask_on_friend_combatant_whisper_mode = {
		max_range = 2000,
		reaction = "REACT_CHECK",
		notice_delay_mul = 1,
		relation = "friend",
		filter = "combatant",
		notice_requires_FOV = true,
		verification_interval = 4,
		release_delay = 3,
		duration = {
			2,
			5
		},
		pause = {
			25,
			50
		}
	}
	self.settings.pl_mask_on_friend_non_combatant_whisper_mode = self.settings.pl_mask_off_friend_non_combatant
	self.settings.pl_mask_on_foe_combatant_whisper_mode_stand = {
		max_range = 2000,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 1.5,
		relation = "foe",
		filter = "combatant",
		uncover_range = 200,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 0.1,
		release_delay = 1
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_stand = {
		max_range = 2000,
		uncover_range = 200,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 1.5,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 0.1,
		release_delay = 1,
		filter = "non_combatant"
	}
	self.settings.pl_mask_on_foe_combatant_whisper_mode_crouch = {
		max_range = 1000,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 3,
		relation = "foe",
		filter = "combatant",
		uncover_range = 200,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 0.1,
		release_delay = 1
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_crouch = {
		max_range = 1000,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 3,
		filter = "non_combatant",
		uncover_range = 200,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 0.1,
		release_delay = 1
	}
	self.settings.pl_friend_combatant_cbt = {
		max_range = 3000,
		reaction = "REACT_CHECK",
		notice_delay_mul = 1,
		relation = "friend",
		filter = "combatant",
		notice_requires_FOV = false,
		verification_interval = 4,
		release_delay = 3,
		duration = {
			2,
			3
		},
		pause = {
			45,
			60
		}
	}
	self.settings.pl_friend_non_combatant_cbt = {
		uncover_range = 550,
		reaction = "REACT_SCARED",
		notice_delay_mul = 1.5,
		release_delay = 1,
		notice_requires_FOV = true,
		verification_interval = 0.1,
		relation = "friend",
		filter = "non_combatant"
	}
	self.settings.pl_foe_combatant_cbt_crouch = {
		uncover_range = 350,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 2,
		release_delay = 1,
		notice_requires_FOV = true,
		verification_interval = 0.1,
		relation = "foe",
		filter = "combatant"
	}
	self.settings.pl_foe_combatant_cbt_stand = {
		reaction = "REACT_COMBAT",
		notice_interval = 0.1,
		relation = "foe",
		filter = "combatant",
		uncover_range = 550,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 1,
		release_delay = 1
	}
	self.settings.pl_foe_non_combatant_cbt_crouch = {
		uncover_range = 200,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 2.5,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_sneak",
		verification_interval = 0.1,
		release_delay = 1,
		filter = "non_combatant"
	}
	self.settings.pl_foe_non_combatant_cbt_stand = deep_clone(self.settings.pl_foe_combatant_cbt_stand)
	self.settings.pl_foe_non_combatant_cbt_stand.filter = "non_combatant"
end

function AttentionTweakData:_init_drill()
	self.settings.drill_civ_ene_ntl = {
		suspicion_range = 1000,
		reaction = "REACT_SCARED",
		notice_requires_FOV = false,
		uncover_range = 200,
		max_range = 2000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "civilians_enemies"
	}
	self.settings.drill_silent_civ_ene_ntl = {
		suspicion_range = 1000,
		reaction = "REACT_SCARED",
		notice_requires_FOV = true,
		uncover_range = 200,
		max_range = 2000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "civilians_enemies"
	}
end	

function AttentionTweakData:_init_civilian()
	self.settings.civ_all_peaceful = {
		max_range = 2000,
		reaction = "REACT_IDLE",
		notice_requires_FOV = true,
		verification_interval = 3,
		release_delay = 2,
		filter = "all",
		duration = {
			1.5,
			6
		},
		pause = {
			35,
			60
		}
	}
	self.settings.civ_enemy_cbt = {
		max_range = 8000,
		reaction = "REACT_SCARED",
		notice_delay_mul = 1,
		filter = "all",
		uncover_range = 300,
		notice_requires_FOV = true,
		notice_clbk = "clbk_attention_notice_corpse",
		verification_interval = 0.1,
		release_delay = 6,
		duration = {
			3,
			6
		}
	}
	self.settings.civ_murderer_cbt = {
		max_range = 20000,
		reaction = "REACT_SHOOT",
		notice_interval = 1,
		relation = "foe",
		filter = "murderer",
		uncover_range = 300,
		notice_requires_FOV = true,
		verification_interval = 1.5,
		release_delay = 1,
		weight_mul = 0.75
	}
	self.settings.civ_enemy_corpse_sneak = {
		uncover_range = 200,
		reaction = "REACT_SCARED",
		notice_delay_mul = 1,
		max_range = 2500,
		notice_requires_FOV = true,
		verification_interval = 0.1,
		release_delay = 6,
		filter = "all"
	}
	self.settings.civ_civ_cbt = {
		max_range = 2000,
		uncover_range = 200,
		reaction = "REACT_SCARED",
		notice_delay_mul = 1.5,
		notice_requires_FOV = true,
		verification_interval = 0.1,
		release_delay = 6,
		filter = "all",
		duration = {
			3,
			6
		}
	}
end	

function AttentionTweakData:_init_enemy()
	self.settings.enemy_team_idle = {
		max_range = 2000,
		reaction = "REACT_IDLE",
		relation = "foe",
		filter = "combatant",
		notice_requires_FOV = false,
		verification_interval = 3,
		release_delay = 1,
		duration = {
			2,
			4
		},
		pause = {
			9,
			40
		}
	}
	self.settings.enemy_team_cbt = {
		max_range = 20000,
		reaction = "REACT_COMBAT",
		notice_delay_mul = 0,
		notice_interval = 0.2,
		relation = "foe",
		filter = "combatant",
		notice_requires_FOV = false,
		verification_interval = 0.75,
		release_delay = 2
	}
	self.settings.enemy_law_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_team_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_combatant_corpse_cbt = {
		max_range = 2500,
		reaction = "REACT_CHECK",
		notice_delay_mul = 1,
		notice_requires_FOV = true,
		verification_interval = 1.5,
		release_delay = 1,
		filter = "combatant",
		duration = {
			2,
			3
		}
	}
	self.settings.enemy_enemy_cbt = {
		max_range = 2000,
		reaction = "REACT_SCARED",
		notice_delay_mul = 0.5,
		relation = "friend",
		filter = "combatant",
		uncover_range = 300,
		notice_requires_FOV = true,
		verification_interval = 0.5,
		release_delay = 1
	}
	self.settings.enemy_civ_cbt = {
		max_range = 2000,
		reaction = "REACT_SCARED",
		notice_delay_mul = 0.2,
		filter = "non_combatant",
		uncover_range = 300,
		notice_requires_FOV = true,
		verification_interval = 0.5,
		release_delay = 6,
		duration = {
			1.5,
			3
		}
	}
end	

function AttentionTweakData:_init_prop()
	self.settings.prop_carry_bag = {
		max_range = 1000,
		reaction = "REACT_SCARED",
		notice_requires_FOV = true,
		uncover_range = 200,
		suspicion_range = 800,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.prop_carry_bodybag = {
		max_range = 1000,
		reaction = "REACT_SCARED",
		notice_requires_FOV = true,
		uncover_range = 200,
		suspicion_range = 800,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.prop_civ_ene_ntl = {
		uncover_range = 500,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "civilians_enemies"
	}
	self.settings.prop_ene_ntl_edaycrate = {
		uncover_range = 300,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 700,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "all_enemy"
	}
	self.settings.prop_ene_ntl = {
		uncover_range = 500,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "all_enemy"
	}
	self.settings.broken_cam_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_CURIOUS",
		notice_requires_FOV = true,
		max_range = 1200,
		suspicion_range = 1000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.prop_law_scary = {
		uncover_range = 300,
		reaction = "REACT_SCARED",
		notice_requires_FOV = true,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.prop_state_civ_ene_ntl = {
		uncover_range = 200,
		reaction = "REACT_CURIOUS",
		notice_requires_FOV = true,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "civilians_enemies"
	}
	self.settings.no_staff_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 1200,
		suspicion_range = 1000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.timelock_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 1200,
		suspicion_range = 1000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.open_security_gate_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 1200,
		suspicion_range = 1000,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.open_vault_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 600,
		suspicion_range = 500,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "law_enforcer"
	}
	self.settings.vehicle_enemy_cbt = {
		max_range = 20000,
		reaction = "REACT_SHOOT",
		notice_interval = 1,
		relation = "foe",
		filter = "all",
		uncover_range = 1200,
		notice_requires_FOV = true,
		verification_interval = 1.5,
		release_delay = 1,
		weight_mul = 0.4
	}
	self.settings.open_elevator_ene_ntl = {
		uncover_range = 800,
		reaction = "REACT_AIM",
		notice_requires_FOV = true,
		max_range = 1500,
		suspicion_range = 1200,
		verification_interval = 0.4,
		release_delay = 1,
		filter = "civilians_enemies"
	}
end	