local mvec3_n_equal = mvector3.not_equal
local mvec3_set = mvector3.set
local mvec3_set_st = mvector3.set_static
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_div = mvector3.divide
local mvec3_lerp = mvector3.lerp
local mvec3_cpy = mvector3.copy
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_dis = mvector3.distance
local mvec3_rot = mvector3.rotate_with
local math_abs = math.abs
local math_max = math.max
local math_clamp = math.clamp
local math_ceil = math.ceil
local math_floor = math.floor
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
NavigationManager = NavigationManager or class()
NavigationManager.nav_states = {
	"allow_access",
	"forbid_access",
	"forbid_custom"
}
NavigationManager.nav_meta_operations = {
	"force_civ_submission",
	"relieve_forced_civ_submission"
}
NavigationManager.COVER_RESERVED = 4
NavigationManager.COVER_RESERVATION = 5
NavigationManager.ACCESS_FLAGS_VERSION = 1
NavigationManager.ACCESS_FLAGS = {
	"civ_male",
	"civ_female",
	"gangster",
	"security",
	"security_patrol",
	"cop",
	"fbi",
	"swat",
	"murky",
	"sniper",
	"spooc",
	"shield",
	"tank",
	"taser",
	"teamAI1",
	"teamAI2",
	"teamAI3",
	"teamAI4",
	"SO_ID1",
	"SO_ID2",
	"SO_ID3",
	"pistol",
	"rifle",
	"ntl",
	"hos",
	"run",
	"fumble",
	"sprint",
	"crawl",
	"climb"
}
NavigationManager.ACCESS_FLAGS_OLD = {}

function NavigationManager:find_cover_from_threat_2(nav_seg_id, optimal_threat_dis, near_pos, threat_pos, search_start_pos, max_distance, cone_base, cone_angle, rsrv_filter)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		cone_base = cone_base,
		cone_angle = cone_angle,
		max_distance = max_distance,
		near_pos = near_pos,
		threat_pos = threat_pos,
		rsrv_filter = rsrv_filter,
		search_start_pos = search_start_pos,
		in_nav_seg = nav_seg_id,
		optimal_threat_dis = optimal_threat_dis
	}

	return self._quad_field:find_cover(search_params)
end
