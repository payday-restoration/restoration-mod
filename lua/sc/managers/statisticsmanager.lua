StatisticsManager.special_unit_ids = {
	"shield",
	"spooc",
	"tank",
	"tank_biker",
	"tank_hw",
	"tank_green",
	"tank_black",
	"tank_skull",
	"taser",
	"boom",
	"boom_summers",
	"taser_summers",
	"medic_summers",
	"rboom",
	"medic",
	"sniper",
	"phalanx_minion",
	"phalanx_vip",
	"heavy_swat_sniper",
	"weekend_dmr",
	"tank_titan",
	"tank_titan_assault",
	"spring",
	"summers",
	"omnia_lpf",
	"swat_turret",
	"biker_boss",
	"chavez_boss",
	"mobster_boss",
	"hector_boss",
	"hector_boss_no_armor",
	"tank_medic",
	"tank_mini",
	"phalanx_minion_assault",
	"spooc_titan",
	"taser_titan",
	"autumn"
}

local old_stats = StatisticsManager.init
function StatisticsManager:init()
	old_stats(self)
	self._defaults.killed.omnia_lpf = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.taser_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.boom_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.medic_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.boom = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.rboom = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_titan_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_medic = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_mini = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.spring = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.fbi_vet = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.fbi_swat_vet = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.hrt = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.fbi_female = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.city_swat_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.city_swat_titan_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.skeleton_swat_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}				
	self._defaults.killed.heavy_swat_sniper = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_biker = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.biker_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.phalanx_minion_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.spooc_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.taser_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.omnia = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}			
	self._defaults.killed.omnia_heavy = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.autumn = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.swat_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
		
	--Weekend	
	self._defaults.killed.weekend_dmr = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.weekend = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.weekend_lmg = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}				
		
end
