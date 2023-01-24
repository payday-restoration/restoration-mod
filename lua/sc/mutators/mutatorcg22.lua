MutatorCG22.categories = {
	"old_event"
}

MutatorCG22.icon_coords = {
	5,
	4
}
MutatorCG22.incompatibility_tags = {
	"replaces_gamemode"
}

MutatorCG22.snowman = "units/pd2_dlc_cg22/characters/ene_bulldozer_snowman/ene_bulldozer_snowman"

function MutatorCG22:on_snowman_killed(unit, damage_info)
	managers.event_jobs:award("cg22_snowman_objective")

	if Network:is_server() and damage_info then
		Telemetry:send_on_game_event_snoman_death({
			weapon_id = alive(damage_info.weapon_unit) and damage_info.weapon_unit:base().name_id or ""
		})
	end
end

