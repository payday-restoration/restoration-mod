local pro_job_ponr = {
	on_executed = {
		{ id = 400002, delay = 0, },
	},
}
return {
	-- Pro Job PONR
	-- Triggers once both A) whisper state is off (on alarm), and B) the required $15 000 has been collected
	[101566] = pro_job_ponr,
	[100938] = pro_job_ponr,
}
