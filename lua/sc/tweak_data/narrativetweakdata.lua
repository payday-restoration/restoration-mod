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
	
	--Heat multipliers, set to be consistent with each other
	self.HEATED_MAX_XP_MUL = 1.3
	self.FREEZING_MAX_XP_MUL = 0.7	
	
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
	
	--Dragon Heist
	self.jobs.chas.payout = {			
		62500,
		100000,
		200000,
		250000,
		300000,
		300000,
		300000
	}
	self.jobs.chas.contract_cost = {			
		100000,
		200000,
		400000,
		600000,
		800000,
		800000,
		800000
	}
	
	--Vlad Breakout
	self.jobs.sand.payout = {			
		55000,
		100000,
		200000,
		400000,
		400000,
		400000,
		400000
	}
	self.jobs.sand.contract_cost = {			
		100000,
		200000,
		480000,
		650000,
		850000,
		850000,
		850000
	}
	
	--Mountain Master
	self.jobs.pent.payout = {			
		68000,
		100000,
		200000,
		400000,
		400000,
		400000,
		400000
	}
	self.jobs.pent.contract_cost = {			
		182000,
		308000,
		500000,
		600000,
		870000,
		870000,
		870000
	}
	
	--White House
	self.jobs.vit.payout = {			
		220000,
		350000,
		450000,
		650000,
		1000000,
		1000000,
		1000000
	}
	
	self.jobs.vit.contract_cost = {			
		750000,
		950000,
		1000000,
		1250000,
		1800000,
		1800000,
		1800000
	}
	
	--Undercover
	self.jobs.man.payout = {			
		286000,
		399990,
		550000,
		650000,
		1000000,
		1000000,
		1000000
	}
	
	self.jobs.man.contract_cost = {			
		800000,
		950000,
		1000000,
		1250000,
		1600000,
		1600000,
		1600000
	}
	
	--Midland Ranch
	self.jobs.ranc.payout = {			
		79000,
		200000,
		500000,
		1000000,
		1100000,
		1100000,
		1100000
	}
	self.jobs.ranc.contract_cost = {
		30000,
		100000,
		350000,
		550000,
		800000,
		800000,
		800000
	}
	
	--Lost In Transit
	self.jobs.trai.payout = {			
		95000,
		200000,
		700000,
		1000000,
		1100000,
		1100000,
		1100000
	}
	self.jobs.trai.contract_cost = {
		80000,
		400000,
		500000,
		600000,
		670000,
		670000,
		670000
	}
	
end)

--[[
Crashes the filter on Crime.net online for some reason, fix later

local create_job_name=NarrativeTweakData.create_job_name
function NarrativeTweakData:create_job_name(job_id, ...)
	local text_string, color_ranges=create_job_name(self, job_id, ...)
	local job_heat_mul=managers.job:heat_to_experience_multiplier(
		managers.job:get_job_heat(job_id)
		)*20-20
	if job_heat_mul~=0 then
		local prev_len=utf8.len(text_string)
		text_string=text_string.." "..(
			job_heat_mul>0 and ("+"):rep(math.ceil(job_heat_mul)) or ("-"):rep(-math.floor(job_heat_mul))
			)
		table.insert(color_ranges, {
			start=prev_len,
			stop=utf8.len(text_string),
			color=managers.job:get_job_heat_color(job_id)
			})
		end
	return text_string, color_ranges
end
]]--