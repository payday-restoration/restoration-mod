if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local function add_hud_item(amount, icon)
		if #amount > 1 then
			managers.hud:add_item_from_string({
				amount_str = make_double_hud_string(amount[1], amount[2]),
				amount = amount,
				icon = icon
			})
		else
			managers.hud:add_item({
				amount = amount[1],
				icon = icon
			})
		end
	end
			
	local player_movement_speed_multiplier_orig = PlayerManager.movement_speed_multiplier
	function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
		
		local multiplier = player_movement_speed_multiplier_orig(self, speed_state, bonus_multiplier, upgrade_level, health_ratio)
		
		if self:has_category_upgrade("player", "detection_risk_add_movement_speed") then
			--Apply Moving Target movement speed bonus (additively)
			multiplier = multiplier + self:detection_risk_movement_speed_bonus()
		end
		
		return multiplier
	end

	function PlayerManager:fadjfbasjhas()
		if self._max_messiah_charges then
			self._messiah_charges = self._max_messiah_charges
		end
	end

	function PlayerManager:detection_risk_movement_speed_bonus()
		local multiplier = 0
		local detection_risk_add_movement_speed = managers.player:upgrade_value("player", "detection_risk_add_movement_speed")
		multiplier = multiplier + self:get_value_from_risk_upgrade(detection_risk_add_movement_speed)
		return multiplier
	end
	
	function PlayerManager:_add_equipment(params)
		if self:has_equipment(params.equipment) then
			print("Allready have equipment", params.equipment)

			return
		end

		local equipment = params.equipment
		local tweak_data = tweak_data.equipments[equipment]
		local amount = {}
		local amount_digest = {}
		local quantity = tweak_data.quantity

		for i = 1, #quantity, 1 do
			local equipment_name = equipment

			if tweak_data.upgrade_name then
				equipment_name = tweak_data.upgrade_name[i]
			end

			local amt = (quantity[i] or 0) + self:equiptment_upgrade_value(equipment_name, "quantity")
			amt = managers.modifiers:modify_value("PlayerManager:GetEquipmentMaxAmount", amt, params)

			table.insert(amount, amt)
			table.insert(amount_digest, Application:digest_value(0, true))
		end

		local icon = params.icon or tweak_data and tweak_data.icon
		local use_function_name = params.use_function_name or tweak_data and tweak_data.use_function_name
		local use_function = use_function_name or nil

		if params.slot and params.slot > 1 then
			if self:has_category_upgrade("player", "second_deployable_full") then
				for i = 1, #quantity, 1 do
					amount[i] = amount[i]
				end			
			else
				for i = 1, #quantity, 1 do
					amount[i] = math.ceil(amount[i] / 2)
				end
			end
		end

		table.insert(self._equipment.selections, {
			equipment = equipment,
			amount = amount_digest,
			use_function = use_function,
			action_timer = tweak_data.action_timer,
			icon = icon,
			unit = tweak_data.unit,
			on_use_callback = tweak_data.on_use_callback
		})

		self._equipment.selected_index = self._equipment.selected_index or 1

		add_hud_item(amount, icon)

		for i = 1, #amount, 1 do
			self:add_equipment_amount(equipment, amount[i], i)
		end
	end	
	
end