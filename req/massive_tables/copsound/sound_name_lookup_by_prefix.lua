-- TODO: add new Eclipse line tweaks
local sound_name_lookup_by_prefix = {}

-- Yes, the prefixes need the _ on the end
-- This table is indexed by prefix as-is

-- Non-filtered cops
sound_name_lookup_by_prefix.l1n_ = {
	x02a_any_3p = "x01a_any_3p",
	x01a_any_3p = "x02a_any_3p",
}
sound_name_lookup_by_prefix.l2n_ = sound_name_lookup_by_prefix.l1n_
sound_name_lookup_by_prefix.l3n_ = sound_name_lookup_by_prefix.l1n_
sound_name_lookup_by_prefix.l4n_ = {
	x02a_any_3p = "x01a_any_3p",
}

-- Filtered cops
local lXd_tbl = {
	a05 = "clr",
	a06 = "clr",
}
sound_name_lookup_by_prefix.l1d_ = lXd_tbl
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
}

-- Gangsters
sound_name_lookup_by_prefix.lt1_ = {
	g90 = "c01",
}

return sound_name_lookup_by_prefix
