local old_PlayerInventory = PlayerInventory.add_unit_by_factory_name

function PlayerInventory:add_unit_by_factory_name(...)
	old_PlayerInventory(self, ...)
	if cosmetics then
		for _,v in pairs(cosmetics) do
			restoration.log_shit("SC: cosmetic string: " .. _ .. " " .. tostring(v))
		end
		restoration.log_shit("SC: cosmetic string: " .. tostring(cosmetics))
	end
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = true
	setup_data.autoaim = true
	setup_data.alert_AI = true
	setup_data.alert_filter = self._unit:movement():SO_access()
	setup_data.timer = managers.player:player_timer()
end

-- probably not needed but better safe than sorry
local equip_selection_orig = PlayerInventory.equip_selection
function PlayerInventory:equip_selection(...)
	local result = equip_selection_orig(self, ...)
	if result and self._unit:movement().cool and self._unit:movement():cool() then
		self:equipped_unit():base():set_flashlight_enabled(false) -- disable the flashlight if we equip something while cool
	end

	return result
end

-- hide masks upon the unit going invisible, if the unit has one
Hooks:PostHook(PlayerInventory, "set_visibility_state", "res_set_visibility_state", function(self, state)
	if alive(self._mask_unit) then
		self._mask_unit:set_visible(state)

		for _, linked_unit in ipairs(self._mask_unit:children()) do
			linked_unit:set_visible(state)
		end
	end
end)
