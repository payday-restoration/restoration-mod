if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

StatisticsManager.special_unit_ids = {
	"shield",
	"spooc",
	"tank",
	"tank_hw",
	"tank_green",
	"tank_black",
	"tank_skull",
	"taser",
	"boom",
	"rboom",
	"fbi_vet",
	"medic",
	"sniper",
	"phalanx_minion",
	"phalanx_vip",
	"swat_turret",
	"biker_boss",
	"chavez_boss",
	"mobster_boss",
	"hector_boss",
	"hector_boss_no_armor"
}

local old_stats = StatisticsManager.init
function StatisticsManager:init()
	old_stats(self)

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

end

end