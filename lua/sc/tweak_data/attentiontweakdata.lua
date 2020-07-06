Hooks:PostHook(AttentionTweakData, "_init_drill", "resmod_drill", function(self)

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

end)

--Allows civilians to trigger hud updates when detecting players with bags.
Hooks:PostHook(AttentionTweakData, "_init_player", "resmod_civilian", function(self)
	self.settings.pl_foe_non_combatant_cbt_stand.relation = nil
end)

Hooks:PostHook(AttentionTweakData, "_init_civilian", "resmod_civilian", function(self)

	self.settings.civ_enemy_cbt = {
		max_range = 2000,
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

end)

--Tweaks to enemy detections, mostly lowering their ranges to decrease chances of giant chain reactions
Hooks:PostHook(AttentionTweakData, "_init_enemy", "resmod_enemy", function(self)

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

end)

--Tweaks to certain prop reactions
Hooks:PostHook(AttentionTweakData, "_init_prop", "resmod_prop", function(self)

	--Regular bag I'm guessing
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
	
	--Bodybag?
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
	
	--Busted Camera
	self.settings.broken_cam_ene_ntl = {
		uncover_range = 100,
		reaction = "REACT_CURIOUS",
		notice_requires_FOV = true,
		max_range = 100,
		suspicion_range = 100,
		verification_interval = 0.4,
		release_delay = 5,
		filter = "law_enforcer"
	}	

end)