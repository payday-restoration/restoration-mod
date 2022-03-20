local mvec3_dist = mvector3.distance

function GamePlayCentralManager:do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	if self:get_shotgun_push_range() < distance or tweak_data.disable_shotgun_push then
		return
	end

	if unit:id() > 0 then
		managers.network:session():send_to_peers_synched("sync_shotgun_push", unit, hit_pos, dir, distance, attacker)
	end

	self:_do_shotgun_push(unit, hit_pos, dir, distance, attacker)
end

function GamePlayCentralManager:_do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	if tweak_data.disable_shotgun_push then
		return
	end

	if unit:movement()._active_actions[1] and unit:movement()._active_actions[1]:type() == "hurt" then
		unit:movement()._active_actions[1]:force_ragdoll(true)
	end

	local scale = math.clamp(1 - distance / self:get_shotgun_push_range(), 0.5, 1)
	local height = mvec3_dist(hit_pos, unit:position()) - 100
	local twist_dir = math.random(2) == 1 and 1 or -1
	local rot_acc = (dir:cross(math.UP) + math.UP * 0.5 * twist_dir) * -1000 * math.sign(height)
	local rot_time = 1 + math.rand(2)
	local nr_u_bodies = unit:num_bodies()
	local i_u_body = 0

	while nr_u_bodies > i_u_body do
		local u_body = unit:body(i_u_body)

		if u_body:enabled() and u_body:dynamic() then
			local body_mass = u_body:mass()

			World:play_physic_effect(Idstring("physic_effects/shotgun_hit"), u_body, Vector3(dir.x, dir.y, dir.z + 0.5) * 600 * scale, 4 * body_mass / math.random(2), rot_acc, rot_time)
			managers.mutators:notify(Message.OnShotgunPush, unit, hit_pos, dir, distance, attacker)
		end

		i_u_body = i_u_body + 1
	end
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