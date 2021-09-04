function SideJobEventManager:is_event_active()
	--return true
	--Doing this for now, wouldn't mind keeping the event active at all times if we readd the Cash Blaster
	return self._global.event_stage < 5
end
