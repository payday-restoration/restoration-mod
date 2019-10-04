if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	function MoneyManager:get_contract_money_by_stars(job_stars, risk_stars, job_days, job_id, level_id, extra_params)
		local job_and_difficulty_stars = job_stars + risk_stars
		local job_stars = job_stars
		local difficulty_stars = risk_stars
		local player_stars = managers.experience:level_to_stars()
		local params = {
			job_id = job_id,
			level_id = level_id,
			job_stars = job_stars,
			difficulty_stars = difficulty_stars,
			success = true,
			num_winners = 1,
			on_last_stage = true,
			player_stars = player_stars,
			bonus_bags_value = extra_params and extra_params.bonus_bags_value or 0,
			mandatory_bags_value = extra_params and extra_params.mandatory_bags_value or 0,
			small_value = extra_params and extra_params.small_value or 0,
			vehicle_value = extra_params and extra_params.vehicle_value or 0
		}
		local stage_value, job_value, bag_value, vehicle_value, small_value, crew_value, total_payout, risk_table, job_table = self:get_money_by_params(params)
		local stage_risk_value = risk_table.stage_risk
		local job_risk_value = risk_table.job_risk
		local total_stage_value = 0
		local total_stage_risk_value = 0
		for i = 1, job_days do
			total_stage_value = total_stage_value + stage_value
			total_stage_risk_value = total_stage_risk_value + stage_risk_value
		end
		local total_job_value = job_value
		local total_job_risk_value = job_risk_value
		total_payout = total_stage_value + total_stage_risk_value + total_job_value + total_job_risk_value
		return total_payout, {
			stage_value,
			total_stage_value,
			stage_risk_value,
			total_stage_risk_value
		}, {
			job_value,
			total_job_value,
			job_risk_value,
			total_job_risk_value
		}
	end
	function MoneyManager:get_money_by_params(params)
		local job_id = params.job_id
		local job_stars = params.job_stars or 0
		local difficulty_stars = params.difficulty_stars or params.risk_stars or 0
		local job_and_difficulty_stars = job_stars + difficulty_stars
		local success = params.success
		local num_winners = params.num_winners or 1
		local on_last_stage = params.on_last_stage
		local current_job_stage = params.current_stage or 1
		local total_stages = job_id and #tweak_data.narrative:job_chain(job_id) or 1
		local player_stars = params.player_stars or managers.experience:level_to_stars() or 0
		local total_stars = math.min(job_stars, player_stars)
		local total_difficulty_stars = difficulty_stars
		local money_multiplier = self:get_contract_difficulty_multiplier(total_difficulty_stars)
		local contract_money_multiplier = 1 + money_multiplier / 10
		local small_loot_multiplier = managers.money:get_small_loot_difficulty_multiplier(total_difficulty_stars) or 0
		local cash_skill_bonus, bag_skill_bonus = managers.player:get_skill_money_multiplier(managers.groupai and managers.groupai:state():whisper_mode())
		local bonus_bags = params.bonus_bags_value or managers.loot:get_secured_bonus_bags_value(params.level_id)
		local mandatory_bags = params.mandatory_bags_value or managers.loot:get_secured_mandatory_bags_value()
		local real_small_value = params.small_value or math.round(managers.loot:get_real_total_small_loot_value())
		local bonus_vehicles = params.vehicle_value or math.round(managers.loot:get_secured_bonus_bags_value(nil, true))
		local offshore_rate = self:get_tweak_value("money_manager", "offshore_rate")
		local stage_value = self:get_stage_payout_by_stars(total_stars) or 0
		local job_value = 0
		local bag_value = 0
		local vehicle_value = 0
		local small_value = real_small_value + managers.loot:get_real_total_postponed_small_loot_value()
		local crew_value = 0
		local stage_risk = 0
		local job_risk = 0
		local bag_risk = 0
		local vehicle_risk = 0
		local small_risk = 0
		local total_payout = 0
		local mandatory_bag_value = 0
		local bonus_bag_value = 0
		
		if tweak_data:get_value("money_manager", "max_small_loot_value") < small_value then
			print("[MoneyManager:get_money_by_params] - Small Loot drop was too much", small_value, tweak_data.carry.max_small_loot_value)

			small_value = tweak_data:get_value("money_manager", "max_small_loot_value")
		end
		
		if managers.skirmish:is_skirmish() then
			local skirmish_payout = managers.skirmish:current_ransom_amount()
			total_payout = math.max(0, math.round(total_payout + skirmish_payout))
		end
		
		if on_last_stage then
			bag_value = bonus_bags
			bag_risk = math.round(bag_value * money_multiplier * bag_skill_bonus)
			bag_value = (bag_value + mandatory_bags) * bag_skill_bonus
			vehicle_value = bonus_vehicles
			vehicle_risk = math.round(vehicle_value * money_multiplier)
			total_payout = math.max(0, math.round((bag_value + bag_risk + vehicle_value + vehicle_risk) / offshore_rate + small_value))
			bag_value = math.max(0, math.round(bag_value / offshore_rate))
			bag_risk = math.max(0, math.round(bag_risk / offshore_rate))
			vehicle_value = math.max(0, math.round(vehicle_value / offshore_rate))
			vehicle_risk = math.max(0, math.round(vehicle_risk / offshore_rate))
			crew_value = total_payout
			total_payout = math.max(0, math.round(total_payout * self:get_tweak_value("money_manager", "alive_humans_multiplier", num_winners)))
			crew_value = total_payout - crew_value
		end

		if on_last_stage then
			job_value = self:get_job_payout_by_stars(total_stars) or 0
			bonus_bag_value = bonus_bags
			mandatory_bag_value = mandatory_bags
		end
		
		local is_level_limited = player_stars < job_stars

		if is_level_limited and stage_value > 0 then
			local unlimited_stage_value = self:get_stage_payout_by_stars(job_stars) or 0
			local unlimited_job_value = 0
			local unlimited_bonus_bag_value = 0
			local unlimited_mandatory_bag_value = 0
			local unlimited_small_value = real_small_value

			if managers.job:on_last_stage() then
				unlimited_job_value = self:get_job_payout_by_stars(job_stars) or 0
				unlimited_bonus_bag_value = bonus_bags * self:get_tweak_value("money_manager", "bag_value_multiplier", job_stars)
				unlimited_mandatory_bag_value = mandatory_bags
			end

			local unlimited_payout = unlimited_stage_value + unlimited_job_value + unlimited_bonus_bag_value + unlimited_mandatory_bag_value + unlimited_small_value
			total_payout = math.round(stage_value + job_value + bonus_bag_value + mandatory_bag_value + small_value)
			local diff_in_money = unlimited_payout - total_payout
			local diff_in_stars = job_stars - player_stars
			local tweak_multiplier = self:get_tweak_value("money_manager", "level_limit", "pc_difference_multipliers", diff_in_stars) or 0
			local new_total_payout = total_payout + math.round(diff_in_money * tweak_multiplier)
			local stage_ratio = stage_value / total_payout
			local small_ratio = small_value / total_payout
			local bonus_bag_ratio = bonus_bag_value / total_payout
			local mandatory_bag_ratio = mandatory_bag_value / total_payout
			local job_ratio = job_value / total_payout
			stage_value = math.round(new_total_payout * stage_ratio)
			small_value = math.round(new_total_payout * small_ratio)
			bonus_bag_value = math.round(new_total_payout * bonus_bag_ratio * bag_skill_bonus)
			mandatory_bag_value = math.round(new_total_payout * mandatory_bag_ratio * bag_skill_bonus)
			job_value = math.round(new_total_payout * job_ratio)
			local rounding_error = new_total_payout - (stage_value + small_value + bonus_bag_value + mandatory_bag_value + job_value)
			job_value = job_value + rounding_error
		end
		
		local stage_risk = math.round(stage_value * money_multiplier)
		local job_risk = math.round(job_value * money_multiplier)
		local bag_risk = math.round(bag_value * money_multiplier)
		local small_risk = math.round(small_value * small_loot_multiplier)
		total_payout = stage_value + job_value + bonus_bag_value + mandatory_bag_value + small_value
		total_payout = total_payout + stage_risk + job_risk + bag_risk + small_risk
		total_payout = math.round(total_payout)
		crew_value = total_payout
		total_payout = math.round(total_payout * (tweak_data:get_value("money_manager", "alive_humans_multiplier", num_winners) or 1))
		crew_value = math.round(total_payout - crew_value)
		total_payout = total_payout + tweak_data:get_value("money_manager", "flat_stage_completion")
		stage_value = stage_value + tweak_data:get_value("money_manager", "flat_stage_completion")

		if on_last_stage then
			total_payout = total_payout + tweak_data:get_value("money_manager", "flat_job_completion")
			job_value = job_value + tweak_data:get_value("money_manager", "flat_job_completion")
		end
		
		local bag_value = math.round((bonus_bag_value + mandatory_bag_value) / offshore_rate)
		bag_risk = math.round(bag_risk / offshore_rate)

		local mutators_multiplier = managers.mutators:get_cash_multiplier()
		local original_total_payout = total_payout
		total_payout = total_payout * mutators_multiplier
		stage_value = stage_value * mutators_multiplier
		job_value = job_value * mutators_multiplier
		bag_value = bag_value * mutators_multiplier
		vehicle_value = vehicle_value * mutators_multiplier
		small_value = small_value * mutators_multiplier
		crew_value = crew_value * mutators_multiplier
		stage_risk = stage_risk * mutators_multiplier
		job_risk = job_risk * mutators_multiplier
		bag_risk = bag_risk * mutators_multiplier
		vehicle_risk = vehicle_risk * mutators_multiplier
		small_risk = small_risk * mutators_multiplier
		local mutators_reduction = original_total_payout - total_payout
		
		return stage_value, job_value, bag_value, vehicle_value, small_value, crew_value, total_payout, {
			stage_risk = stage_risk,
			job_risk = job_risk,
			bag_risk = bag_risk,
			vehicle_risk = vehicle_risk,
			small_risk = small_risk
		}
	end
end

