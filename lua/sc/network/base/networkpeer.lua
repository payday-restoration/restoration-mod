function NetworkPeer:_update_equipped_armor()
	if not alive(self._unit) then
		return
	end

	local new_armor_id = self:armor_id(true) or self:armor_id()

	print("[NetworkPeer:update_equipped_armor]", "equipped_armor", self._equipped_armor_id, "new_armor", new_armor_id)

	if self._equipped_armor_id ~= new_armor_id then
		self._equipped_armor_id = new_armor_id
		
		--[[
		
		local armor_sequence = tweak_data.blackmarket.armors[new_armor_id].sequence
		local job = Global.level_data and Global.level_data.level_id

		for _,v in pairs(restoration.custom_suit_heists) do
			if job == v then
				armor_sequence = nil
			break
			end
		end

		if armor_sequence and self._unit:damage() and self._unit:damage():has_sequence(armor_sequence) then
			self._unit:damage():run_sequence_simple(armor_sequence)
		end

		if self._unit:base() and self._unit:base().set_armor_id then
			self._unit:base():set_armor_id(new_armor_id)
		end

		if self._unit:armor_skin() and self._unit:armor_skin().set_armor_id then
			self._unit:armor_skin():set_armor_id(new_armor_id)
		end
		
		]]--

		local con_mul, index = managers.blackmarket:get_concealment_of_peer(self)

		self._unit:base():set_suspicion_multiplier("equipment", 1 / con_mul)
		self._unit:base():set_detection_multiplier("equipment", 1 / con_mul)
		self._unit:base():setup_hud_offset(self)
	end
end

function NetworkPeer:mark_cheater(reason, auto_kick)
	--fuck
	return
end

-- Hooks:PostHook( NetworkPeer, "send", "SC_Network", function(self, func_name, ...)
-- 	-- In SC mode if the func is matched, call the prefixed version instead
-- 	if restoration.network_handler_funcs[func_name] then
-- 		func_name = 'RestorationMod__' .. func_name
-- 	end
-- end)