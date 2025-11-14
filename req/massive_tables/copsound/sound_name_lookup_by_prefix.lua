-- TODO: add new Eclipse line tweaks
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
	ch1 = "hlp", -- Use suppressed lines for sentries, saws, intimidation, trip mines blowing up
	ch2 = "hlp",
	ch4 = "hlp",
	s01x = "hlp",
	d02 = "g90", -- Use regular taunt when deploying flashbangs
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
	ch1 = zXn_zombie_sounds_tbl,
	ch2 = zXn_zombie_sounds_tbl,
	ch3 = zXn_zombie_sounds_tbl,
	ch4 = zXn_zombie_sounds_tbl,
}
local mXn_tbl = {
	ch1 = "hlp", -- Use suppressed lines for sentries, saws, intimidation, trip mines blowing up
	ch2 = "hlp",
	ch4 = "hlp",
	s01x = "hlp",
	d02 = "g90", -- Use regular taunt when deploying flashbangs
}
sound_name_lookup_by_prefix.l1n_ = {
	e01 = lXn_sabotage_tbl,
	e02 = lXn_sabotage_tbl,
	e03 = lXn_sabotage_tbl,
	e04 = "g90",
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
	a05 = "clr",
	a06 = "clr",
}
sound_name_lookup_by_prefix.l1d_ = {
	a05 = "clr",
	a06 = "clr",
	e05 = "clr",
	e06 = "clr",
}
sound_name_lookup_by_prefix.l2d_ = lXd_tbl
sound_name_lookup_by_prefix.l3d_ = lXd_tbl
sound_name_lookup_by_prefix.l4d_ = lXd_tbl
sound_name_lookup_by_prefix.l5d_ = {
	c01 = "g90",
	att = "g90",
	rrl = "pus",
	t01 = "prm",
	h01 = "h10",
	a05 = "clr",
	a06 = "clr",
	e05 = "clr",
	e06 = "clr",
}

-- Gangsters
sound_name_lookup_by_prefix.lt1_ = {
	g90 = "c01",
}

-- Tasers
local tsr_tbl = {
	ch3 = "burndeath", -- Ears ouchies
}
sound_name_lookup_by_prefix.tsr_ = tsr_tbl
sound_name_lookup_by_prefix.rtsr_ = tsr_tbl
sound_name_lookup_by_prefix.mtsr_ = tsr_tbl

-- Medics
local mdc_tbl = {
	ch3 = "burndeath", -- Ears ouchies
}
sound_name_lookup_by_prefix.mdc_ = mdc_tbl
sound_name_lookup_by_prefix.rmdc_ = mdc_tbl
sound_name_lookup_by_prefix.mmdc_ = mdc_tbl

return sound_name_lookup_by_prefix
