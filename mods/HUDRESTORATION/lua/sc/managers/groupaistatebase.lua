if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local sc_group_misc_data = GroupAIStateBase._init_misc_data
function GroupAIStateBase:_init_misc_data()
	sc_group_misc_data(self)
	self._special_unit_types = {
		tank = true,
		spooc = true,
		shield = true,
		taser = true,
		boom = true,
		medic = true,
		phalanx_minion = true,
		tank_titan = true,
		fbi_vet = true,
		spring = true
	}
end

local sc_group_base = GroupAIStateBase.on_simulation_started
function GroupAIStateBase:on_simulation_started()
	sc_group_base(self)
	self._special_unit_types = {
		tank = true,
		spooc = true,
		shield = true,
		taser = true,
		boom = true,
		medic = true,
		phalanx_minion = true,
		tank_titan = true,
		fbi_vet = true,
		spring = true
	}
end

function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers)
	local nr_players = 0
	local nr_bots = managers.criminals:nr_AI_criminals()
	for u_key, u_data in pairs(self:all_player_criminals()) do
		if not u_data.status then
			nr_players = nr_players + 1
		end
	end
	nr_players = math.clamp(nr_players, 1, 4)
	return balance_multipliers[nr_players + nr_bots]
end

function GroupAIStateBase:sync_smoke_grenade(detonate_pos, shooter_pos, duration, flashbang)
	local smoke_duration = duration == 0 and 15 or duration
	if flashbang then
		if Network:is_client() then
			return
		end
		local flashbang_unit = "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
		local pos = detonate_pos + Vector3(0, 0, 1)
		local rotation = Rotation(math.random() * 360, 0, 0)
		local flash_grenade = World:spawn_unit(Idstring(flashbang_unit), pos, rotation)
		flash_grenade:base():activate(shooter_pos or pos, duration)
	else
		self._smoke_grenade = World:spawn_unit(Idstring("units/weapons/smoke_grenade_quick/smoke_grenade_quick"), detonate_pos, Rotation())
		self._smoke_grenade:base():activate(shooter_pos or detonate_pos, smoke_duration)
		managers.groupai:state():teammate_comment(nil, "g40x_any", detonate_pos, true, 2000, false)
	end
	self._smoke_end_t = Application:time() + smoke_duration
	self._smoke_grenade_ignore_control = nil
end

function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 4
	for u_key, u_data in pairs(self._player_criminals) do
		if u_data.unit:base().is_local_player then
			if managers.player:has_category_upgrade("player", "intimidate_enemies") then
				if Global.game_settings.single_player then
					nr_hostages_allowed = 4
				else
					nr_hostages_allowed = 4
				end
			end
		elseif u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
			if Global.game_settings.single_player then
				nr_hostages_allowed = 4
			else
				nr_hostages_allowed = 4
			end
		end
	end
	return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
end

end