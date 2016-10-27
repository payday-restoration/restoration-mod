if restoration.Options:GetValue("SC/SC") then

function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 4
	for u_key, u_data in pairs(self._player_criminals) do
		if u_data.unit:base().is_local_player then
			if managers.player:has_category_upgrade("player", "intimidate_enemies") then
				if Global.game_settings.single_player then
					nr_hostages_allowed = 4
				else
					nr_hostages_allowed = 4
				end
			end
		elseif u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
			if Global.game_settings.single_player then
				nr_hostages_allowed = 4
			else
				nr_hostages_allowed = 4
			end
		end
	end
	return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
end

end