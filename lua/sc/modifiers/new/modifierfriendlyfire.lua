ModifierFriendlyFire = ModifierFriendlyFire or class(BaseModifier)
ModifierFriendlyFire._type = "ModifierFriendlyFire"
ModifierFriendlyFire.name_id = "none"
ModifierFriendlyFire.desc_id = "menu_cs_modifier_friendlyfire"

--pretty much a copy paste from mutator tbh
function ModifierFriendlyFire:modify_value(id, value)
	local dmg_mult = 0.5
	if id == "PlayerDamage:FriendlyFire" then
		return false
	elseif id == "HuskPlayerDamage:FriendlyFireDamageCS" then
		return value * dmg_mult * 0.25
	elseif id == "ProjectileBase:create_sweep_data:slot_mask" then
		return value + 3
	end
end