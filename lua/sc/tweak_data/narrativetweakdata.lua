Hooks:PostHook( NarrativeTweakData, "init", "SC_Narratives", function(self)	
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
end)