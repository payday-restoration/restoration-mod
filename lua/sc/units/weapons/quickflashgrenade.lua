-- Fix flash grenade timer
Hooks:PreHook(QuickFlashGrenade, "init", "sh_init", function ()
	QuickFlashGrenade.States[3][2] = QuickFlashGrenade.States[3][2] or tweak_data.group_ai.flash_grenade.timer
end)

-- Allow flashes through corpses and debris to make them more consistent
-- Also removes inconsistent flashes through random light bounces
Hooks:PostHook(QuickFlashGrenade, "init", "sh_init", function (self)
	self._slotmask = managers.slot:get_mask("bullet_impact_targets") - World:make_slot_mask(17)
end)

local offset_pos = Vector3()
function QuickFlashGrenade:_chk_dazzle_local_player(detonate_pos, range, ignore_units)
	local player = managers.player:player_unit()

	if not alive(player) then
		return
	end

	detonate_pos = detonate_pos or self._unit:position()

	local m_pl_head_pos = player:movement():m_head_pos()
	local linear_dis = mvector3.direction(offset_pos, detonate_pos, m_pl_head_pos)

	if linear_dis > range then
		return
	end

	mvector3.multiply(offset_pos, 50)
	mvector3.add(offset_pos, detonate_pos)

	if ignore_units then
		if not World:raycast("ray", m_pl_head_pos, offset_pos, "ignore_unit", ignore_units, "slot_mask", self._slotmask, "report") then
			return true, true, nil, linear_dis
		end
	elseif not World:raycast("ray", m_pl_head_pos, offset_pos, "slot_mask", self._slotmask, "report") then
		return true, true, nil, linear_dis
	end
end
