local sound_name_lookup_by_prefix = {}

-- Yes, the prefixes need the _ on the end
-- This table is indexed by prefix as-is

-- Non-filtered cops
-- lXn gets sabotage lines
-- Pure zombie sounds for zXn
-- Tweaks for rXn and mXn
local lXn_sabotage_tbl = {
	"prm",
	"r01",
}
local lXn_tbl = {
	e01 = lXn_sabotage_tbl,
	e02 = lXn_sabotage_tbl,
	e03 = lXn_sabotage_tbl,
	e04 = "g90",
	e05 = "clr",
	e06 = "clr",
	x02a_any_3p = "x01a_any_3p",
	x01a_any_3p = "x02a_any_3p",
	lk3a = "lk3b",
	lk3b = "lk3a",
}
local rXn_tbl = {
	a07b = "a07a",
	gr1a = "rdy",
	gr1b = "rdy",
	gr1c = "rdy",
	gr1d = "rdy",
	gr2a = "rdy",
	gr2b = "rdy",
	gr2c = "rdy",
	gr2d = "rdy",
	ch1 = "hlp", -- Use suppressed lines for sentries, saws, intimidation, trip mines blowing up
	ch2 = "hlp",
	ch4 = "hlp",
	s01x = "hlp",
	lk3a = "hlp",
	lk3b = "hlp",
	ch3 = "burndeath", -- Ears ouchies
	d02 = "g90", -- Use regular taunt when deploying flashbangs
	rrl = "g90",
	pus = "g90",
	t01 = "rdy",
	i02 = "i01",
	i03 = "g90",
	p02 = "p01",
	p03 = "rdy",
	clr = "mov",
}
local zXn_zombie_sounds_tbl = {
	"g90",
	"mov",
	"rdy",
	"c01",
	"d01",
}
local zXn_tbl = {
	x01a_any_3p = zXn_zombie_sounds_tbl,
	x02a_any_3p = zXn_zombie_sounds_tbl,
	burndeath = zXn_zombie_sounds_tbl,
	burnhurt = zXn_zombie_sounds_tbl,
	a07b = zXn_zombie_sounds_tbl,
	gr1a = zXn_zombie_sounds_tbl,
	gr1b = zXn_zombie_sounds_tbl,
	gr1c = zXn_zombie_sounds_tbl,
	gr1d = zXn_zombie_sounds_tbl,
	gr2a = zXn_zombie_sounds_tbl,
	gr2b = zXn_zombie_sounds_tbl,
	gr2c = zXn_zombie_sounds_tbl,
	gr2d = zXn_zombie_sounds_tbl,
	ch1 = zXn_zombie_sounds_tbl,
	ch2 = zXn_zombie_sounds_tbl,
	ch3 = zXn_zombie_sounds_tbl,
	ch4 = zXn_zombie_sounds_tbl,
	s01x = zXn_zombie_sounds_tbl,
	lk3a = zXn_zombie_sounds_tbl,
	lk3b = zXn_zombie_sounds_tbl,
	d02 = zXn_zombie_sounds_tbl,
	rrl = zXn_zombie_sounds_tbl,
	pus = zXn_zombie_sounds_tbl,
	t01 = zXn_zombie_sounds_tbl,
	i02 = zXn_zombie_sounds_tbl,
	i03 = zXn_zombie_sounds_tbl,
	p02 = zXn_zombie_sounds_tbl,
	p03 = zXn_zombie_sounds_tbl,
	clr = zXn_zombie_sounds_tbl,
}
local mXn_tbl = {
	a07b = "a07a",
	gr1a = "rdy",
	gr1b = "rdy",
	gr1c = "rdy",
	gr1d = "rdy",
	gr2a = "rdy",
	gr2b = "rdy",
	gr2c = "rdy",
	gr2d = "rdy",
	ch1 = "hlp", -- Use suppressed lines for sentries, saws, intimidation, trip mines blowing up
	ch2 = "hlp",
	ch4 = "hlp",
	s01x = "hlp",
	lk3a = "hlp",
	lk3b = "hlp",
	ch3 = "burndeath", -- Ears ouchies
	d02 = "g90", -- Use regular taunt when deploying flashbangs
	rrl = "g90",
	pus = "g90",
	t01 = "rdy",
	i02 = "i01",
	i03 = "g90",
	p02 = "p01",
	p03 = "rdy",
	clr = "mov",
}
sound_name_lookup_by_prefix.l1n_ = {
	e01 = lXn_sabotage_tbl,
	e02 = lXn_sabotage_tbl,
	e03 = lXn_sabotage_tbl,
	amm = "lk3b", -- l1n doesn't have medic/ammo bag spot lines for some reason
	med = "lk3b",
	e05 = "clr",
	e06 = "clr",
	x02a_any_3p = "x01a_any_3p",
	x01a_any_3p = "x02a_any_3p",
}
sound_name_lookup_by_prefix.l2n_ = lXn_tbl
sound_name_lookup_by_prefix.l3n_ = lXn_tbl
sound_name_lookup_by_prefix.l4n_ = {
	e01 = lXn_sabotage_tbl,
	e02 = lXn_sabotage_tbl,
	e03 = lXn_sabotage_tbl,
	e04 = "g90",
	e05 = "clr",
	e06 = "clr",
	x02a_any_3p = "x01a_any_3p",
}
sound_name_lookup_by_prefix.r1n_ = rXn_tbl
sound_name_lookup_by_prefix.r2n_ = rXn_tbl
sound_name_lookup_by_prefix.r3n_ = rXn_tbl
sound_name_lookup_by_prefix.r4n_ = rXn_tbl
sound_name_lookup_by_prefix.z1n_ = zXn_tbl
sound_name_lookup_by_prefix.z2n_ = zXn_tbl
sound_name_lookup_by_prefix.z3n_ = zXn_tbl
sound_name_lookup_by_prefix.z4n_ = zXn_tbl
sound_name_lookup_by_prefix.m1n_ = mXn_tbl
sound_name_lookup_by_prefix.m2n_ = mXn_tbl
sound_name_lookup_by_prefix.m3n_ = mXn_tbl
sound_name_lookup_by_prefix.m4n_ = mXn_tbl

-- Filtered cops
-- l5d is very brokey, the others just need something for stealth lines
local lXd_tbl = {
	amm = "e04",
	med = "e04",
	a05 = "clr",
	a06 = "clr",
}
local l5d_contact_tbl = {
	"i01",
	"g90",
}
sound_name_lookup_by_prefix.l1d_ = {
	amm = "e04",
	med = "e04",
	a05 = "clr",
	a06 = "clr",
	e05 = "clr",
	e06 = "clr",
	i02 = "i01", -- l1d doesn't have i02 lines for some reason (use i01 instead)
}
sound_name_lookup_by_prefix.l2d_ = lXd_tbl
sound_name_lookup_by_prefix.l3d_ = lXd_tbl
sound_name_lookup_by_prefix.l4d_ = lXd_tbl
sound_name_lookup_by_prefix.l5d_ = {
	amm = "e04",
	med = "e04",
	c01 = l5d_contact_tbl,
	att = l5d_contact_tbl,
	rrl = "pus",
	t01 = "prm",
	h01 = "h10",
	a05 = "clr",
	a06 = "clr",
}

-- Gangsters
local gangsters_tbl = {
	i01 = "aes",
	i02 = "c01",
	i03 = "g90",
}
sound_name_lookup_by_prefix.lt1_ = {
	g90 = "c01",
	i01 = "aes",
	i02 = "c01",
	--i03 = "g90",
}
sound_name_lookup_by_prefix.lt2_ = gangsters_tbl
sound_name_lookup_by_prefix.ict1_ = gangsters_tbl
sound_name_lookup_by_prefix.ict2_ = gangsters_tbl
sound_name_lookup_by_prefix.bik1_ = gangsters_tbl
sound_name_lookup_by_prefix.bik2_ = gangsters_tbl
sound_name_lookup_by_prefix.rt1_ = gangsters_tbl
sound_name_lookup_by_prefix.rt2_ = gangsters_tbl

-- Bulldozers
local bdz_tbl = {
	d01 = "g90",
	d02 = "g90",
}
sound_name_lookup_by_prefix.bdz_ = bdz_tbl
sound_name_lookup_by_prefix.rbdz_ = bdz_tbl
sound_name_lookup_by_prefix.mbdz_ = bdz_tbl

-- Tasers
local tsr_tbl = {
	ch3 = "burndeath", -- Ears ouchies
	d01 = "g90",
	d02 = "g90",
}
sound_name_lookup_by_prefix.tsr_ = tsr_tbl
sound_name_lookup_by_prefix.rtsr_ = tsr_tbl
sound_name_lookup_by_prefix.mtsr_ = tsr_tbl

-- Medics
local mdc_tbl = {
	ch3 = "burndeath", -- Ears ouchies
	e05 = "g90",
	e06 = "g90",
}
sound_name_lookup_by_prefix.mdc_ = mdc_tbl
sound_name_lookup_by_prefix.rmdc_ = mdc_tbl
sound_name_lookup_by_prefix.mmdc_ = mdc_tbl

return sound_name_lookup_by_prefix
