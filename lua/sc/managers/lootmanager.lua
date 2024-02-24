function LootManager:show_small_loot_taken_hint(type, multiplier)
    local get_value = self:get_real_value(type, multiplier)
    local pro_job_bonus = managers.money:get_tweak_value("money_manager", "pro_job_new") or 1

    if pro_job_bonus > 1 then
        get_value = get_value * pro_job_bonus
    end

	managers.hint:show_hint("grabbed_small_loot", 2, nil, {
		MONEY = managers.experience:cash_string(get_value)
	})
end