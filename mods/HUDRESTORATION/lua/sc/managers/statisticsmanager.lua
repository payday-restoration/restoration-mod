if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_killed = StatisticsManager.killed
function StatisticsManager:killed(data)
	old_killed(self, data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local kill_limit = 8
	if difficulty_index <= 2 then
		kill_limit = 999
	elseif difficulty_index == 3 then
		kill_limit = 999
	elseif difficulty_index == 4 then
		kill_limit = 999
	elseif difficulty_index == 5 then
		kill_limit = 999
	elseif difficulty_index == 6 then
		kill_limit = 999
	elseif difficulty_index == 7 then
		kill_limit = 0
	else
		kill_limit = 0
	end
	if Network:is_server() and managers.groupai:state():whisper_mode() then
		local civ_deaths = self:session_total_civilian_kills()
		if managers.groupai:state():whisper_mode() and civ_deaths > kill_limit then
			managers.groupai._state:on_police_called("sys_police_alerted")
		end
	end
end

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
	"boom_summers",
	"taser_summers",
	"medic_summers",
	"rboom",
	"fbi_vet",
	"medic",
	"sniper",
	"phalanx_minion",
	"phalanx_vip",
	"city_swat_titan",
	"heavy_swat_sniper",
	"tank_titan",
	"spring",
	"summers",
	"swat_turret",
	"biker_boss",
	"chavez_boss",
	"mobster_boss",
	"hector_boss",
	"hector_boss_no_armor",
	"tank_medic",
	"tank_mini"
}

local old_stats = StatisticsManager.init
function StatisticsManager:init()
	old_stats(self)

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
	self._defaults.killed.heavy_swat_sniper = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}

end

end