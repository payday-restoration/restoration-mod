if Network:is_client() then
	local old_sentrygunweapon_applydmgmul = SentryGunWeapon._apply_dmg_mul
	local old_sentrygunbrain_updatesoaccess = SentryGunBrain._update_SO_access
	function SentryGunBrain:_update_SO_access()
		old_sentrygunbrain_updatesoaccess(self)
		local team_data = self._unit:movement():team()
		if team_data.foes[tweak_data.levels:get_default_team_ID('player')] then
			self._apply_dmg_mul = function(self, damage, col_ray, from_pos)
				if alive(col_ray.unit) and col_ray.unit:base().is_local_player then
					return old_sentrygunweapon_applydmgmul(self, damage, col_ray, from_pos)
				end
				return 0
			end
		else
			self._apply_dmg_mul = function()
				return 0
			end
		end
	end
end	