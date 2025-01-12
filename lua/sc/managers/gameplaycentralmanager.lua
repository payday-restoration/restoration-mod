local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local tmp_vec4 = Vector3()
local mvec3_set = mvector3.set
local mvec3_mul = mvector3.multiply
local mvec3_add = mvector3.add
local mvec3_neg = mvector3.negate
local mvec3_lerp = mvector3.lerp
local mvec3_spread = mvector3.spread
local mvec3_dist_sq = mvector3.distance_sq
local mvec3_dist = mvector3.distance
local mvec3_dot = mvector3.dot

function GamePlayCentralManager:do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	if self:get_shotgun_push_range(attacker) < distance or tweak_data.disable_shotgun_push then
		return
	end

	if unit:id() ~= -1 then
		local sync_attacker = alive(attacker) and attacker:id() ~= -1 and attacker or nil

		managers.network:session():send_to_peers_synched("sync_shotgun_push", unit, hit_pos, dir, distance, sync_attacker)
	end

	self:_do_shotgun_push(unit, hit_pos, dir, distance, attacker)
end

function GamePlayCentralManager:_do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	if tweak_data.disable_shotgun_push then
		return
	end

	local mov_ext = unit:movement()
	local full_body_action = mov_ext and mov_ext:get_action(1)

	if full_body_action and full_body_action:type() == "hurt" then
		full_body_action:force_ragdoll(true)
	end

	local scale = math.clamp(1 - distance / self:get_shotgun_push_range(attacker), 0.5, 1)
	local rot_time = 0.5 --+ math.rand(2)
	local asm = unit:anim_state_machine()

	if asm and asm:get_global("tank") == 1 then
		scale = scale * 0.3
		rot_time = rot_time * 0.2
	end

	local push_vec = tmp_vec1

	mvector3.set_static(push_vec, dir.x, dir.y, dir.z + 0.5)
	mvec3_mul(push_vec, 600 * scale)

	local unit_pos = tmp_vec2

	unit:m_position(unit_pos)

	local height_sign = math.sign(mvec3_dist_sq(hit_pos, unit_pos) - 10000)
	local twist_dir = math.random(2) == 1 and 1 or -1
	local rot_acc = tmp_vec3

	mvec3_set(rot_acc, dir)
	mvector3.cross(rot_acc, rot_acc, math.UP)
	mvec3_set(tmp_vec4, math.UP)
	mvec3_mul(tmp_vec4, 0.5 * twist_dir)
	mvec3_add(rot_acc, tmp_vec4)
	mvec3_mul(rot_acc, -1000 * height_sign)

	local u_body = nil
	local i_u_body = 0
	local get_body_f = unit.body
	local nr_u_bodies = unit:num_bodies()
	local world = World
	local play_physic_effect_f = world.play_physic_effect
	local idstr_shotgun_push_effect = Idstring("physic_effects/shotgun_hit")

	for i = 0, unit:num_bodies() - 1 do
		u_body = get_body_f(unit, i)

		if u_body and u_body:enabled() and u_body:dynamic() then
			play_physic_effect_f(world, idstr_shotgun_push_effect, u_body, push_vec, 4 * u_body:mass() / math.random(2), rot_acc, rot_time)
		end
	end

	managers.mutators:notify(Message.OnShotgunPush, unit, hit_pos, dir, distance, attacker)
end

function GamePlayCentralManager:request_play_footstep( unit, m_pos )
	if self._camera_pos then
		local dis = mvector3.distance_sq( self._camera_pos, m_pos )
		if dis < 250000 then -- absolute max footstep distance -- 500*500
			if #self._footsteps < 3 then	-- max 3 queued footsteps
				table.insert( self._footsteps, { unit = unit, dis = dis } )
			end
		end
	end
end

function GamePlayCentralManager:set_flashlights_on(flashlights_on)
	if self._flashlights_on == flashlights_on then
		return
	end

	self._flashlights_on = flashlights_on
	local weapons = World:find_units_quick("all", 13)

	for _, weapon in ipairs(weapons) do
		if weapon:base().flashlight_state_changed then
			weapon:base():flashlight_state_changed()
		end
	end
end

-- This need for PJ outlines changes (for 6th sense skill)
Hooks:OverrideFunction(GamePlayCentralManager, "auto_highlight_enemy", function(self, unit, use_player_upgrades)
	self._auto_highlighted_enemies = self._auto_highlighted_enemies or {}

	if self._auto_highlighted_enemies[unit:key()] and Application:time() < self._auto_highlighted_enemies[unit:key()] then
		return false
	end

	self._auto_highlighted_enemies[unit:key()] = Application:time() + (managers.groupai:state():whisper_mode() and 9 or 4)

	if not unit:contour() then
		debug_pause_unit(unit, "[GamePlayCentralManager:auto_highlight_enemy]: Unit doesn't have Contour Extension")
	end

	local time_multiplier = 1
	local contour_type = "mark_enemy_sixth_sense" -- default outline for 6th sense

	if unit:base() and unit:base().is_security_camera then
		contour_type = "mark_unit"
		time_multiplier = managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1)
	elseif use_player_upgrades then
		-- Different check because `get_contour_for_marked_enemy` will return wrong outline otherwise
		if managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") then
			contour_type = "mark_enemy_damage_bonus"
		end

		if managers.player:has_category_upgrade("player", "marked_inc_dmg_distance") then
			contour_type = "mark_enemy_damage_bonus_distance"
		end
		
		time_multiplier = managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1)
	end

	unit:contour():add(contour_type, true, time_multiplier)

	return true
end)

function GamePlayCentralManager:play_impact_sound_and_effects(params)
	local effect_limit = (restoration.Options:GetValue("OTHER/Performance/QueuedImpactFXLimitEnabled") and restoration.Options:GetValue("OTHER/Performance/QueuedImpactFXLimit")) or math.huge
	local impact_effect_type = restoration.Options:GetValue("OTHER/Performance/QueuedImpactFXType") or 1
	if params then
		if impact_effect_type == 2 then
			params.immediate = true
		elseif impact_effect_type == 3 then
			params.immediate = nil
		end
	end

	if params.immediate then
		self:_play_bullet_hit(params)
	elseif effect_limit and #self._bullet_hits < effect_limit then
		table.insert(self._bullet_hits, params)
	end
end