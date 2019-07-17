--	//SCORE JOB CONTACT TWEAK

--	playedSafeHouseBefore (set job value as this if you dont want to mess with jov values)

	tweak_data.narrative.jobs.score_instances.contact = Global.mission_manager and Global.mission_manager.saved_job_values.playedSafeHouseBefore and "score_contact" or "score_contact_unavaliable"
	tweak_data.narrative.jobs.arm_cafe.contact = Global.mission_manager and Global.mission_manager.saved_job_values.playedSafeHouseBefore and "score_contact" or "score_contact_unavaliable"
	
-- Yes... its this simple.