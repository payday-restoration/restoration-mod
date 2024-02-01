ContourExt._types.medic_show = {
	priority = 2,
	material_swap_required = true,
	fadeout = 2,
	color = tweak_data.contour.character.dangerous_color
}
ContourExt._types.omnia_heal = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(128, 0, 128)
}
ContourExt._types.medic_buff = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(255, 140, 0)
}
ContourExt._types.deployable_blackout = { --for autumn's deployable disabling ability
	priority = 1,
	color = Vector3(0.5,0,1)
}
--ContourExt._types.mark_enemy.ray_check_rev = true
Hooks:OverrideFunction(ContourExt, "add", function(self,type, sync, multiplier, override_color, is_element)
local disable_outlines = managers.mutators:modify_value("ContourExt:DisableOutlines", false)
local do_outline = true
local enemy_contours = {
	"friendly",
	"mark_enemy",
    "mark_enemy_damage_bonus",
    "mark_enemy_damage_bonus_distance",
    "mark_unit_dangerous",
    "mark_unit_dangerous_damage_bonus",
    "mark_unit_dangerous_damage_bonus_distance"
}
if disable_outlines then
	do_outline = false
	local disable_enemy_outlines = managers.mutators:modify_value("ContourExt:DisableEnemyOutlines", false)
	if disable_outlines and not disable_enemy_outlines then
		for _, enemy_contour in ipairs(enemy_contours) do
			if type == enemy_contour then
				do_outline = true
			end	
		end		
	end
end

if do_outline then
	self._contour_list = self._contour_list or {}
	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent and managers.groupai:state():whisper_mode() then
		fadeout = data.fadeout_silent
	end

	if fadeout and multiplier then
		fadeout = fadeout * multiplier
	end

	sync = sync and not self._is_child_contour or false

	if sync then
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_add", sync_unit, u_id, table.index_of(ContourExt.indexed_types, type), multiplier or 1)
		else
			sync = nil

			Application:error("[ContourExt:add] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	for _, setup in ipairs(self._contour_list) do
		if setup.type == type then
			if fadeout then
				setup.fadeout_t = TimerManager:game():time() + fadeout
			elseif not setup.data.unique then
				setup.ref_c = setup.ref_c + 1
			end

			if is_element then
				setup.ref_c_element = (setup.ref_c_element or 0) + 1
			end

			local old_color = setup.color or data.color
			setup.color = override_color or nil

			if old_color ~= override_color then
				self:_upd_color()
			end

			return setup
		end
	end

	if not self._removed_occlusion then
		self._removed_occlusion = true

		managers.occlusion:remove_occlusion(self._unit)
	end

	local setup = {
		ref_c = 1,
		type = type,
		ref_c_element = is_element and 1 or nil,
		sync = sync,
		fadeout_t = fadeout and TimerManager:game():time() + fadeout or nil,
		color = override_color or nil,
		data = data
	}

	if data.ray_check then
		setup.upd_skip_count = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and mov_ext.m_com then
			setup.ray_pos = mov_ext:m_com()
		end
	end
	
	if data.ray_check_rev then
		setup.upd_skip_count = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and not mov_ext.m_com then
			setup.ray_pos = mov_ext:m_com()
		end
	end

	local i = 1
	local contour_list = self._contour_list
	local old_preset_type = contour_list[1] and contour_list[1].type

	while contour_list[i] and contour_list[i].data.priority <= data.priority do
		i = i + 1
	end

	table.insert(contour_list, i, setup)

	if not old_preset_type or i == 1 and old_preset_type ~= setup.type then
		self:_apply_top_preset()
	end

	if not self._update_enabled then
		self:_chk_update_state()
	end

	if data.damage_bonus or data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if data.trigger_marked_event then
		self:_chk_mission_marked_events(setup)
	end
	
	--Compatibility for Smooth Contours
	if self.fadeout_start_percent ~= nil then
		local removed_occlusion = self._removed_occlusion
	
		if setup.fadeout_t then
			setup.fadeout_start_t = math.lerp(TimerManager:game():time(), setup.fadeout_t, self.fadeout_start_percent)
			setup.fadeout_length = setup.fadeout_t - setup.fadeout_start_t
		end

		if not removed_occlusion and self._removed_occlusion then
			self:_set_allow_occlusion(false)
		end
	end

	self:apply_to_linked("add", type, false, multiplier, override_color)

	return setup
end
end)