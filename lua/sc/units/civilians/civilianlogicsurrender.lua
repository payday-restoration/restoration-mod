--Thanks Rocker
Hooks:PostHook(CivilianLogicSurrender,"_update_enemy_detection","stc_upd_sentry_aura",function(data,my_data) --self? what's a "self"

	local civ_pos = data.unit:movement():m_head_pos()	
	local all_deployables = World:find_units_quick("all",25)
	local dis_sentry = 1400 --max distance that sentries can intimidate at; would be a good name for a disease
	for k,unit in pairs(all_deployables) do 
		if not (unit and alive(unit)) then return end
		local this_dis = mvector3.direction(Vector3(),unit:position(),civ_pos)
--		local this_dis = mvector3.distance_sq(unit:position(),civ_pos)

		if this_dis < dis_sentry then 
			my_data.inside_intimidate_aura = true
			my_data.submission_meter = my_data.submission_max
			break
		end
	end
	
end)