--Set up flying strike variations for SPOOC damage
function TeamAIMovement:on_SPOOCed(enemy_unit, flying_strike)
	if self._unit:character_damage()._god_mode then
		return
	end

	if flying_strike then
		self._unit:brain():set_logic("surrender")
		self._unit:network():send("arrested")
		self._unit:character_damage():on_arrested()	
	else
		self._unit:character_damage():on_incapacitated()
	end

	return true
end

Hooks:PostHook(TeamAIMovement, "set_cool", "res_set_cool", function(self, state)
	if self._ext_inventory:equipped_unit() then
		self._ext_inventory:equipped_unit():base():set_flashlight_enabled(not state) -- enable the flashlight when we become uncool, or disable if we become cool again
	end
end)

local old_throw = TeamAIMovement.throw_bag
function TeamAIMovement:throw_bag(...)
	local data = self._ext_brain._logic_data
	if data then
		local objective = data.objective
		if objective then
			if objective.type == "revive" then
				if managers.player:is_custom_cooldown_not_active("team", "crew_inspire") or restoration and restoration.Options:GetValue("OTHER/BotsNoDrop") then
					return
				end
			end
		end
	end
	return old_throw(self, ...)
end

--Can't really find anything that'd make bots use their secondary beyond the off chance they spawn in steath with their pistol or something
--[[  
function TeamAIMovement:add_weapons()
	if Network:is_server() then
		local char_name = self._ext_base._tweak_table
		local loadout = managers.criminals:get_loadout_for(char_name)
		local crafted = managers.blackmarket:get_crafted_category_slot("primaries", loadout.primary_slot)

		if crafted then
			self._unit:inventory():add_unit_by_factory_blueprint(loadout.primary, false, false, crafted.blueprint, crafted.cosmetics)
		elseif loadout.primary then
			self._unit:inventory():add_unit_by_factory_name(loadout.primary, false, false, nil, "")
		else
			local weapon = self._ext_base:default_weapon_name("primary")
			local _ = weapon and self._unit:inventory():add_unit_by_factory_name(weapon, false, false, nil, "")
		end

		local sec_weap_name = self._ext_base:default_weapon_name("secondary")
		local is_factory_id = tweak_data.weapon.factory[sec_weap_name]
		local _ = sec_weap_name and (is_factory_id and self._unit:inventory():add_unit_by_factory_name(sec_weap_name, false, false, nil, "") or self._unit:inventory():add_unit_by_name(sec_weap_name))
	else
		TeamAIMovement.super.add_weapons(self)
	end
end
]]