local is_overkill_plus = false
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if difficulty_index >= 5 then
	is_overkill_plus = true
end

return {
--Titan Sniper replace disabled sniper (escape section)
	[302631] = {
		values = {
			enabled = is_overkill_plus,
			enemy = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
		}
	},
	[302632] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	}
}