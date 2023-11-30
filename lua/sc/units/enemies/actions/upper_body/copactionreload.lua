-- Make reload action use proper reload speed and sync it to clients
Hooks:PostHook(CopActionReload, "init", "sh_init", function (self)
	-- Don't expire the action based on some arbitrary number, we'll expire based on the actual reload animation
	self._reload_t = math.huge
end)

function CopActionReload:expired()
	return not self._ext_anim.reload
end

function CopActionReload:_play_reload()
	local redir_res = self._ext_movement:play_redirect("reload")
	if redir_res then
		if not self._reload_speed then
			local weapon = self._ext_inventory:equipped_unit()
			local usage = weapon and weapon:base():weapon_tweak_data().usage
			local usage_tweak = self._common_data.char_tweak.weapon[usage]
			self._reload_speed = usage_tweak and usage_tweak.RELOAD_SPEED or 1
		end

		self._machine:set_speed(redir_res, self._reload_speed)

		if Network:is_server() then
			managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
		end

		return redir_res
	end
end