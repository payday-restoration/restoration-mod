local REACT_IDLE = AIAttentionObject.REACT_IDLE
local REACT_AIM = AIAttentionObject.REACT_AIM
local REACT_ARREST = AIAttentionObject.REACT_ARREST
local REACT_COMBAT = AIAttentionObject.REACT_COMBAT

-- Make cops react more aggressively when appropriate (less stare, more shoot)
local _chk_reaction_to_attention_object_original = CopLogicIdle._chk_reaction_to_attention_object
function CopLogicIdle._chk_reaction_to_attention_object(data, attention_data, ...)
	if data.cool then
		return _chk_reaction_to_attention_object_original(data, attention_data, ...)
	end

	local attention_reaction = attention_data.settings.reaction
	if attention_data.settings.relation ~= "foe" and attention_reaction <= REACT_AIM then
		return REACT_IDLE
	end

	local record = attention_data.criminal_record
	if not record or not attention_data.is_person then
		return REACT_COMBAT
	end

	if record.status == "dead" or record.being_arrested then
		return math.min(attention_reaction, REACT_AIM)
	end

	if record.status == "disabled" then
		if record.assault_t and record.assault_t - record.disabled_t > 0.6 or data.tactics and data.tactics.murder then
			return REACT_COMBAT
		end
		return math.min(attention_reaction, REACT_AIM)
	end

	local can_arrest = not record.status and record.arrest_timeout < data.t and CopLogicBase._can_arrest(data)
	if not can_arrest or record.assault_t and attention_data.unit:base():arrest_settings().aggression_timeout > data.t - record.assault_t then
		return REACT_COMBAT
	end

	for u_key, other_crim_rec in pairs(managers.groupai:state():all_criminals()) do
		local other_crim_attention_info = data.detected_attention_objects[u_key]
		if other_crim_attention_info and (other_crim_attention_info.is_deployable or other_crim_attention_info.verified and other_crim_rec.assault_t and data.t - other_crim_rec.assault_t < other_crim_rec.unit:base():arrest_settings().aggression_timeout) then
			return REACT_COMBAT
		end
	end

	if attention_data.dis > 2000 then
		return math.min(attention_reaction, REACT_AIM)
	end

	return math.min(attention_reaction, REACT_ARREST)
end

--Done just to add a safety check that (hopefully) fixes an upgrade_value crash
function CopLogicIdle.on_intimidated(data, amount, aggressor_unit)
	local surrender = false
	local my_data = data.internal_data
	data.t = TimerManager:game():time()

	if not aggressor_unit:movement():team().foes[data.unit:movement():team().id] then
		return
	end

	if managers.groupai:state():has_room_for_police_hostage() then
		local i_am_special = managers.groupai:state():is_enemy_special(data.unit)
		local required_skill = i_am_special and "intimidate_specials" or "intimidate_enemies"
		local aggressor_can_intimidate = nil
		local aggressor_intimidation_mul = 1

		--Here!
		if aggressor_unit:base().is_local_player then
			aggressor_can_intimidate = managers.player:has_category_upgrade("player", required_skill)
			aggressor_intimidation_mul = aggressor_intimidation_mul * managers.player:upgrade_value("player", "empowered_intimidation_mul", 1) * managers.player:upgrade_value("player", "intimidation_multiplier", 1)
		elseif aggressor_unit:base()._is_team_ai then
			aggressor_can_intimidate = true
		elseif aggressor_unit:base().upgrade_value then 
			aggressor_can_intimidate = aggressor_unit:base():upgrade_value("player", required_skill)
			aggressor_intimidation_mul = aggressor_intimidation_mul * (aggressor_unit:base():upgrade_value("player", "empowered_intimidation_mul") or 1) * (aggressor_unit:base():upgrade_value("player", "intimidation_multiplier") or 1)
		end

		if aggressor_can_intimidate then
			local hold_chance = CopLogicBase._evaluate_reason_to_surrender(data, my_data, aggressor_unit)

			if hold_chance then
				hold_chance = hold_chance^aggressor_intimidation_mul

				if hold_chance >= 1 then
					-- Nothing
				else
					local rand_nr = math.random()

					if hold_chance < rand_nr then
						surrender = true
					end
				end
			end
		end

		if surrender then
			CopLogicIdle._surrender(data, amount, aggressor_unit)
		else
			data.unit:brain():on_surrender_chance()
		end
	end

	CopLogicBase.identify_attention_obj_instant(data, aggressor_unit:key())
	managers.groupai:state():criminal_spotted(aggressor_unit)

	return surrender
end

-- Fix defend_area objectives being force relocated to areas with players in them
local _chk_relocate_original = CopLogicIdle._chk_relocate
function CopLogicIdle._chk_relocate(data, ...)
	local objective = data.objective
	local objective_type = objective and objective.type
	if objective_type == "follow" then
		return _chk_relocate_original(data, ...)
	elseif objective_type == "hunt" then
		local objective_area = objective.area
		if not objective_area or next(objective_area.criminal.units) then
			return
		end

		local found_areas = {
			[objective_area] = true
		}
		local areas_to_search = {
			objective_area
		}
		local target_area

		while next(areas_to_search) do
			local current_area = table.remove(areas_to_search, 1)

			if next(current_area.criminal.units) then
				target_area = current_area
				break
			end

			for _, n_area in pairs(current_area.neighbours) do
				if not found_areas[n_area] then
					found_areas[n_area] = true
					table.insert(areas_to_search, n_area)
				end
			end
		end

		if not target_area then
			return
		end

		objective.in_place = nil
		objective.path_data = nil
		objective.area = target_area
		objective.nav_seg = target_area.pos_nav_seg

		data.logic._exit(data.unit, "travel")

		return true
	end
end
