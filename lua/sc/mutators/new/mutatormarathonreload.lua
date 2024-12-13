--PRESS R TO PAY RESPE- RELOAD
MutatorReloadMarathon = MutatorReloadMarathon or class(BaseMutator)
MutatorReloadMarathon._type = "MutatorReloadMarathon"
MutatorReloadMarathon.name_id = "mutator_thecandlesburnoutforyou"
MutatorReloadMarathon.desc_id = "mutator_thecandlesburnoutforyou_desc"
MutatorReloadMarathon.categories = {
	"gameplay"
}
MutatorReloadMarathon.icon_coords = {
	4,
	5
}

function MutatorReloadMarathon:setup(data)
	tweak_data.weapon.stat_info.reload_marathon = true
end