local update_original = PlayerDriving.update
function PlayerDriving:update(t, dt)
	update_original(self, t, dt)
	self:_upd_nav_data()
end
