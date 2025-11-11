-- TODO: add new Eclipse line tweaks
local full_sound_lookup_by_prefix = {}

-- Yes, the prefixes need the _ on the end
-- This table is indexed by prefix as-is

-- Non-filtered cops
local rXn_tbl = {
	x02a_any_3p = "l2n_x01_any_3p",
	x01a_any_3p = "l2n_x02_any_3p",
}
full_sound_lookup_by_prefix.l4n_ = {
	x01a_any_3p = "l1n_x02a_any_3p",
}
full_sound_lookup_by_prefix.r1n_ = rXn_tbl
full_sound_lookup_by_prefix.r2n_ = rXn_tbl
full_sound_lookup_by_prefix.r3n_ = rXn_tbl
full_sound_lookup_by_prefix.r4n_ = rXn_tbl

-- Female cops
full_sound_lookup_by_prefix.fl1n_ = {
	burnhurt = "cf2_burnhurt",
	burndeath = "cf2_burndeath",
}

-- Filtered cops
full_sound_lookup_by_prefix.l2d_ = {
	x02a_any_3p = "l1d_x02_any_3p",
}
full_sound_lookup_by_prefix.l3d_ = {
	burnhurt = "l1d_burnhurt",
	burndeath = "l1d_burndeath",
}

-- Tasers
local tsr_tbl = {
	x02a_any_3p = "tsr_x02_any_3p",
	x01a_any_3p = "tsr_x01_any_3p",
}
full_sound_lookup_by_prefix.tsr_ = tsr_tbl
full_sound_lookup_by_prefix.rtsr_ = {
	x02a_any_3p = "rtsr_x02_any_3p",
	x01a_any_3p = "rtsr_x01_any_3p",
}
full_sound_lookup_by_prefix.mtsr_ = tsr_tbl

-- Bulldozers
local bdz_tbl = {
	burndeath = "l1d_burndeath",
	burnhurt = "l1d_burnhurt",
	x02a_any_3p = "bdz_x02a_any_3p",
	x01a_any_3p = "bdz_x01a_any_3p",
}
full_sound_lookup_by_prefix.bdz_ = bdz_tbl
full_sound_lookup_by_prefix.rbdz_ = bdz_tbl
full_sound_lookup_by_prefix.mbdz_ = bdz_tbl

-- Cloakers
local clk_tbl = {
	x02a_any_3p = "clk_x02a_any_3p",
}
full_sound_lookup_by_prefix.clk_ = clk_tbl
full_sound_lookup_by_prefix.rclk_ = {
	x02a_any_3p = "rclk_x02a_any_3p",
	x01a_any_3p = "rclk_x01a_any_3p",
}
full_sound_lookup_by_prefix.mclk_ = clk_tbl

-- Medics
local mdc_tbl = {
	x02a_any_3p = "mdc_x02_any_3p",
	x01a_any_3p = "mdc_x01_any_3p",
}
full_sound_lookup_by_prefix.mdc_ = mdc_tbl
full_sound_lookup_by_prefix.rmdc_ = mdc_tbl
full_sound_lookup_by_prefix.mmdc_ = mdc_tbl

-- Gangsters not having any pain burn lines
local gangsters_tbl = {
	burnhurt = "l2n_burnhurt",
	burndeath = "l2n_burndeath",
}
full_sound_lookup_by_prefix.ict1_ = gangsters_tbl
full_sound_lookup_by_prefix.ict2_ = gangsters_tbl
full_sound_lookup_by_prefix.bik1_ = gangsters_tbl
full_sound_lookup_by_prefix.bik2_ = gangsters_tbl
full_sound_lookup_by_prefix.lt1_ = gangsters_tbl
full_sound_lookup_by_prefix.lt2_ = gangsters_tbl
full_sound_lookup_by_prefix.rt1_ = gangsters_tbl
full_sound_lookup_by_prefix.rt2_ = gangsters_tbl

-- l5n voiceset restoration below, credit goes to SonicSoapyBoi for figuring out the line IDs
local l5n_contact_tbl = {
	"Play_l5n_i01_con",
	"Play_l5n_g90",
}
local l5n_alert_tbl = {
	"Play_l5n_lk3_con",
	"l5n_a08",
}
local l5n_police_calls_tbl = {
	"l5n_a09",
	"l5n_a23",
}
full_sound_lookup_by_prefix.l5n_ = {
	c01 = l5n_contact_tbl,
	att = l5n_contact_tbl,

	a07a = l5n_alert_tbl,
	a07b = l5n_alert_tbl,

	a10 = l5n_police_calls_tbl,
	a11 = l5n_police_calls_tbl,
	a12 = l5n_police_calls_tbl,

	rdy = "Play_l5n_rdy",

	-- Contact line is actually a rescue line
	h01 = "Play_l5n_c01a",

	cn1 = "Play_l5n_cn1_con",

	civ = "Play_l5n_civ_con",

	cr1 = "Play_l5n_cr1_con",

	clr = "Play_l5n_clr_con",

	g90 = "Play_l5n_g90",

	d01 = "Play_l5n_d01_con",
	d02 = "Play_l5n_d02_con",

	ch1 = "Play_l5n_ch1_con",
	ch2 = "Play_l5n_ch2_con",
	ch3 = "Play_l5n_ch3_con",
	ch4 = "Play_l5n_ch4_con",

	gr1a = "Play_l5n_gr1a_con",
	gr1b = "Play_l5n_gr1b_con",
	gr1c = "Play_l5n_gr1c_con",
	gr1d = "Play_l5n_gr1d_con",

	gr2a = "Play_l5n_gr2a_con",
	gr2b = "Play_l5n_gr2b_con",
	gr2c = "Play_l5n_gr2c_con",
	gr2d = "Play_l5n_gr2d_con",

	med = "Play_l5n_med_con",

	m01 = "Play_l5n_m01_any",

	mov = "Play_l5n_mov_ass",

	p01 = "Play_l5n_p01_ass",
	p02 = "Play_l5n_p02_ass",
	p03 = "Play_l5n_p03_ass",

	pos = "Play_l5n_pos_con",

	pus = "Play_l5n_pus_con",
	rrl = "Play_l5n_pus_con",

	r01 = "Play_l5n_r01_con",

	s01x = "Play_l5n_s01x_con",

	i01 = "Play_l5n_i01_con",
	i02 = "Play_l5n_i02_con",
	i03 = "Play_l5n_i03_con__________________MISSING_i03c",

	l01 = "Play_l5n_l01_con__________________MISSING_l01b",

	lk3a = "Play_l5n_lk3_ass",
	lk3b = "Play_l5n_lk3_con",

	hlp = "Play_l5n_hlp_con",

	x02a_any_3p = "l1n_x01a_any_3p",
	x01a_any_3p = "l1n_x02a_any_3p",
}

return full_sound_lookup_by_prefix
