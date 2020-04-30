function GamePlayCentralManager:do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	--Disabled
	return
end

--Just in case
function GamePlayCentralManager:_do_shotgun_push(unit, hit_pos, dir, distance, attacker)
	--Disabled
	return
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