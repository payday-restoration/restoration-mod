Hooks:PostHook( NarrativeTweakData, "init", "SC_Narratives", function(self)
	self.tutorials = {
		{job = "safehouse"},
		{job = "short1"},
		{job = "short2"}
	}

	--how the fuck does this wanna be set up
	--self.jobs.man.contract_visuals.preview_image = {icon = "guis/textures/restoration/cni/secret_stash"}
	self.jobs.mex.jc = 60
	self.jobs.mex_cooking.jc = 60
	
	--Golden Grin Casino
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
	
	--Black Cat
	self.jobs.chca.payout = {			
		100000,
		200000,
		500000,
		1000000,
		1300000,
		1300000,
		1300000
	}
	self.jobs.chca.contract_cost = {
		105000,
		150000,
		550000,
		800000,
		1000000,
		1000000,
		1000000
	}	
	self.jobs.chca.contract_visuals.min_mission_xp = {
		39250,
		39250,
		39250,
		39250,
		39250,
		39250,
		39250
	}
	self.jobs.chca.contract_visuals.max_mission_xp = {
		67500,
		67500,
		67500,
		67500,
		67500,
		67500,
		67500
	}	
	
	--Border Crystals (it's basically Cook Off but in Mexico)
	self.jobs.mex_cooking.payout = {			
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.mex_cooking.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}	
	self.jobs.mex_cooking.contract_visuals.min_mission_xp = {
		16000,
		16000,
		16000,
		16000,
		16000,
		16000,
		16000
	}
	self.jobs.mex_cooking.contract_visuals.max_mission_xp = {
		9600000,
		9600000,
		9600000,
		9600000,
		9600000,
		9600000,
		9600000
	}
	
	--Border Crossing
	self.jobs.mex.payout = {			
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.mex.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}	
	self.jobs.mex.contract_visuals.min_mission_xp = {
		64000,
		64000,
		64000,
		64000,
		64000,
		64000,
		64000
	}
	self.jobs.mex.contract_visuals.max_mission_xp = {
		96000,
		96000,
		96000,
		96000,
		96000,
		96000,
		96000
	}
	
	--San Martin Bank
	self.jobs.bex.payout = {			
		60000,
		150000,
		300000,
		600000,
		750000,
		750000,
		750000
	}
	self.jobs.bex.contract_cost = {			
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}
	self.jobs.bex.contract_visuals.min_mission_xp = {
		28000,
		28000,
		28000,
		28000,
		28000,
		28000,
		28000
	}
	self.jobs.bex.contract_visuals.max_mission_xp = {
		40100,
		40100,
		40100,
		40100,
		40100,
		40100,
		40100
	}
end)