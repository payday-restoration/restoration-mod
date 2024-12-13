--Miami Mutilator eat your heart out
MutatorMagazineMartyr = MutatorMagazineMartyr or class(BaseMutator)
MutatorMagazineMartyr._type = "MutatorMagazineMartyr"
MutatorMagazineMartyr.name_id = "mutator_letthesleepinggoddie"
MutatorMagazineMartyr.desc_id = "mutator_letthesleepinggoddie_desc"
MutatorMagazineMartyr.categories = {
	"gameplay"
}
MutatorMagazineMartyr.icon_coords = {
	3,
	5
}

function MutatorMagazineMartyr:setup(data)
	for id, weap in pairs(tweak_data.weapon) do
		if weap.categories and weap.stats then
			if weap.keep_ammo ~= 1 then
				weap.keep_ammo = 0
			end
		end
	end
end