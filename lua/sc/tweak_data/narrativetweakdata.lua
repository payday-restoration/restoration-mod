Hooks:PostHook( NarrativeTweakData, "init", "SC_Narratives", function(self)
	--how the fuck does this wanna be set up
	--self.jobs.man.contract_visuals.preview_image = {icon = "guis/textures/restoration/cni/secret_stash"}
	self.jobs.mex.jc = 60
	self.jobs.mex_cooking.jc = 60
	self.jobs.kenaz.payout = {			
		250000,
		300000,
		450000,
		550000,
		850000,
		850000,
		850000
		}
	self.jobs.kenaz.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
		}	
		
	self.stages = {
		firestarter_1_res = {
			type = "d",
			type_id = "heist_type_hijack",
			level_id = "firestarter_1_res"
		},
		firestarter_2_res = {
			type = "d",
			type_id = "heist_type_stealth",
			level_id = "firestarter_2_res"
		},
		firestarter_3_res = {
			type = "d",
			level_id = "firestarter_3_res",
			type_id = "heist_type_knockover",
			mission = "default",
			mission_filter = {
				5
			}
		}
	}
	self.jobs.firestarter.chain = {
		self.stages.firestarter_1_res,
		self.stages.firestarter_2_res,
		self.stages.firestarter_3_res
		}
end)