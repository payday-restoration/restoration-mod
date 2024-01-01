--Remove ASU Laser when they surrender
Hooks:PostHook(CopLogicIntimidated, "enter", "fuck_enter", function(data, new_logic_name, enter_params)
	data.unit:base():disable_asu_laser(true)
end)

--Remove OMNIA buffs/no pager on tie down
function CopLogicIntimidated._do_tied(data, aggressor_unit)
	local my_data = data.internal_data
	aggressor_unit = alive(aggressor_unit) and aggressor_unit

	if managers.groupai:state():rescue_state() then
		CopLogicIntimidated._add_delayed_rescue_SO(data, my_data)
	end

	if my_data.surrender_clbk_registered then
		managers.groupai:state():remove_from_surrendered(data.unit)

		my_data.surrender_clbk_registered = nil
	end

	my_data.tied = true

	data.unit:inventory():destroy_all_items()
	data.unit:brain():set_update_enabled_state(false)

	if my_data.update_task_key then
		managers.enemy:unqueue_task(my_data.update_task_key)

		my_data.update_task_key = nil
	end

	data.brain:rem_pos_rsrv("stand")
	managers.groupai:state():on_enemy_tied(data.unit:key())
	data.unit:base():set_slot(data.unit, 22)
	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", data.unit, "brain", HuskCopBrain._NET_EVENTS.surrender_cop_tied)
	data.unit:movement():remove_giveaway()

	if not data.brain:is_pager_started() then
		data.unit:interaction():set_tweak_data("hostage_convert")
		data.unit:interaction():set_active(true, true, false)
	end

	if data.unit:unit_data().mission_element then
		data.unit:unit_data().mission_element:event("tied", data.unit)
	end
	
	if data.unit:contour() then
		data.unit:contour():remove("omnia_heal", true)
		data.unit:contour():remove("medic_buff", true)
	end			

	if aggressor_unit then
		data.unit:character_damage():drop_pickup()
		data.unit:character_damage():set_pickup(nil)

		if aggressor_unit == managers.player:player_unit() then
			managers.statistics:tied({
				name = data.unit:base()._tweak_table
			})
		elseif aggressor_unit:base() and aggressor_unit:base().is_husk_player then
			aggressor_unit:network():send_to_unit({
				"statistics_tied",
				data.unit:base()._tweak_table
			})
		end
	end

	managers.groupai:state():on_criminal_suspicion_progress(nil, data.unit, nil)
end

-- Tweak hostage rescue conditions
function CopLogicIntimidated.rescue_SO_verification(ignore_this, data, unit, ...)
	if unit:movement():cool() then
		return false
	end

	if not unit:base():char_tweak().rescue_hostages then
		return false
	end

	if data.team.foes[unit:movement():team().id] then
		return false
	end

	local objective = unit:brain():objective()
	if not objective or objective.type == "free" or not objective.area then
		return true
	end

	local nav_seg = unit:movement():nav_tracker():nav_segment()
	local hostage_nav_seg = data.unit:movement():nav_tracker():nav_segment()
	if objective.area.nav_segs[hostage_nav_seg] or hostage_nav_seg == nav_seg then
		return objective.area.nav_segs[nav_seg] or managers.groupai:state()._rescue_allowed
	end
end