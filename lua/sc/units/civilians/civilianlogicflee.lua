function CivilianLogicFlee.register_rescue_SO(ignore_this, data)
	local my_data = data.internal_data

	CopLogicBase.on_delayed_clbk(my_data, my_data.delayed_rescue_SO_id)

	my_data.delayed_rescue_SO_id = nil

	if data.unit:anim_data().dont_flee then
		return
	end

	local my_tracker = data.unit:movement():nav_tracker()
	local objective_pos = my_tracker:field_position()
	local side = data.unit:movement():m_rot():x()

	mvector3.multiply(side, 65)

	local test_pos = mvector3.copy(objective_pos)

	mvector3.add(test_pos, side)

	local so_pos, so_rot = nil
	local ray_params = {
		allow_entry = false,
		trace = true,
		tracker_from = data.unit:movement():nav_tracker(),
		pos_to = test_pos
	}

	if not managers.navigation:raycast(ray_params) then
		so_pos = test_pos
		so_rot = Rotation(-side, math.UP)
	else
		test_pos = mvector3.copy(objective_pos)

		mvector3.subtract(test_pos, side)

		ray_params.pos_to = test_pos

		if not managers.navigation:raycast(ray_params) then
			so_pos = test_pos
			so_rot = Rotation(side, math.UP)
		else
			so_pos = mvector3.copy(objective_pos)
			so_rot = nil
		end
	end

	local objective = {
		type = "act",
		interrupt_health = 0.75,
		destroy_clbk_key = false,
		stance = "hos",
		scan = true,
		chatter_type = "sabotagehostages",
		interrupt_dis = 700,
		follow_unit = data.unit,
		pos = so_pos,
		rot = so_rot,
		nav_seg = data.unit:movement():nav_tracker():nav_segment(),
		fail_clbk = callback(CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_failed", data),
		complete_clbk = callback(CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_completed", data),
		action = {
			variant = "untie",
			body_part = 1,
			type = "act",
			blocks = {
				action = -1,
				walk = -1
			}
		},
		action_duration = tweak_data.interaction.free.timer
	}
	local receiver_areas = managers.groupai:state():get_areas_from_nav_seg_id(objective.nav_seg)
	local so_descriptor = {
		interval = 10,
		search_dis_sq = 25000000,
		AI_group = "enemies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = objective,
		search_pos = mvector3.copy(data.m_pos),
		admin_clbk = callback(CivilianLogicFlee, CivilianLogicFlee, "on_rescue_SO_administered", data),
		verification_clbk = callback(CivilianLogicFlee, CivilianLogicFlee, "rescue_SO_verification", {
			logic_data = data,
			areas = receiver_areas
		})
	}
	local so_id = "rescue" .. tostring(data.key)
	my_data.rescue_SO_id = so_id

	managers.groupai:state():add_special_objective(so_id, so_descriptor)
	managers.groupai:state():register_rescueable_hostage(data.unit, nil)
end

-- Only allow hostage rescue if it's part of our tactics (or if we don't have any tactics to allow scripted cop/security spawns to rescue hostages)
local rescue_SO_verification_original = CivilianLogicFlee.rescue_SO_verification
function CivilianLogicFlee.rescue_SO_verification(ignore_this, params, unit, ...)
	local logic_data = unit:brain()._logic_data
	if not logic_data or not logic_data.tactics or logic_data.tactics.rescue_hostages or logic_data.objective and logic_data.objective.grp_objective == "recon_area" then
		return rescue_SO_verification_original(ignore_this, params, unit, ...)
	end
end