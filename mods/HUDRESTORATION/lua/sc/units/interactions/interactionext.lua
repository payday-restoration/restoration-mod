if Global.game_settings and Global.game_settings.single_player then

	local can_select=BaseInteractionExt.can_select
	local can_interact=BaseInteractionExt.can_interact
	local can_interact_multi=MultipleChoiceInteractionExt.can_interact
	
	function can_pickup(player, item)
		return Network:is_server() and item
			and managers.player:player_unit()==player
			and managers.player:can_pickup_equipment(item)
		end

	function BaseInteractionExt:can_select(player)
		return can_select(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

	function BaseInteractionExt:can_interact(player)
		return can_interact(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

	function MultipleChoiceInteractionExt:can_interact(player)
		return can_interact_multi(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

end