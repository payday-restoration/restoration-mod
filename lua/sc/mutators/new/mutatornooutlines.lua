MutatorNoOutlines = MutatorNoOutlines or class(BaseMutator)
MutatorNoOutlines._type = "MutatorNoOutlines"
MutatorNoOutlines.name_id = "mutator_no_outlines"
MutatorNoOutlines.desc_id = "mutator_no_outlines_desc"
--MutatorNoOutlines.has_options = true
MutatorNoOutlines.reductions = {
	money = 0,
	exp = 0
}
MutatorNoOutlines.disables_achievements = false
MutatorNoOutlines.categories = {"gameplay"}
MutatorNoOutlines.icon_coords = {
	2,
	1
}

--[[function MutatorNoOutlines:register_values(mutator_manager)
	self:register_value("grenade_mayhem_usuals", true, "gmu")
	self:register_value("grenade_mayhem_thugs", false, "gmt")
	self:register_value("grenade_mayhem_specials", false, "gms")
	self:register_value("grenade_mayhem_bosses", false, "gmb")
	self:register_value("grenade_mayhem_captains", false, "gmc")
	--self:register_value("grenade_mayhem_sosa_cosplay", false, "gmsc")
end
--]]
function MutatorNoOutlines:modify_value(id, value)
	--Need clean-up this crap later
	if id == "HuskPlayerMovement:DisableOutlines" or id == "CopMovement:DisableOutlines" or id == "MedicDamage:DisableOutlines" or id == "TripMineBase:DisableOutlines" or id == "ECMJammerBase:DisableOutlines" or id == "CivilianBrain:DisableOutlines" or id == "HUDManager:DisableOutlines" or id == "AmmoClip:DisableOutlines" or id == "ArrowBase:DisableOutlines" or id == "SentryGunContour:DisableOutlines" then
		return true
	end	
	return value
end

function MutatorNoOutlines:setup(data)
	--Maybe it's possible to make jokers and enemies outlines show up in LoS
	local no_outline = Vector3(0,0,0)
	
	tweak_data.interaction.revive.contour_preset = disable_outline
	--tweak_data.interaction.revive.contour_preset_selected = disable_outline
	
	tweak_data.contour.interactable.standard_color = no_outline
	tweak_data.contour.character.downed_color = no_outline
	tweak_data.contour.character.friendly_color = no_outline
	tweak_data.contour.character_interactable.standard_color = no_outline
	tweak_data.contour.character_interactable.selected_color = no_outline
	tweak_data.contour.character.dangerous_color = no_outline
	tweak_data.contour.character.more_dangerous_color = no_outline
	tweak_data.contour.deployable.standard_color = no_outline
	tweak_data.contour.deployable.selected_color = no_outline
	tweak_data.contour.deployable.disabled_color = no_outline
	tweak_data.contour.deployable.active_color = no_outline
	tweak_data.contour.deployable.interact_color = no_outline
	tweak_data.contour.upgradable.standard_color = no_outline
	tweak_data.contour.upgradable.selected_color = no_outline
	tweak_data.contour.character.heal_color = no_outline
	tweak_data.contour.character.tmp_invulnerable_color = no_outline
	tweak_data.contour.character.vulnerable_color = no_outline
end