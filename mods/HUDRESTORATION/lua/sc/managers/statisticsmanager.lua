if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_killed = StatisticsManager.killed
function StatisticsManager:killed(data)
	old_killed(self, data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local kill_limit = 8
	if difficulty_index <= 2 then
		kill_limit = 10
	elseif difficulty_index == 3 then
		kill_limit = 8
	elseif difficulty_index == 4 then
		kill_limit = 6
	elseif difficulty_index == 5 then
		kill_limit = 4
	elseif difficulty_index == 6 then
		kill_limit = 2
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
	"rboom",
	"fbi_vet",
	"medic",
	"sniper",
	"phalanx_minion",
	"phalanx_vip",
	"tank_titan",
	"spring",
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
	self._defaults.killed.tank_titan = {
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