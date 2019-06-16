if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
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
end
