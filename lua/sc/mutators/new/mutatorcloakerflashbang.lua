--Cloakers dropping flash grenades when they dodge--
MutatorCloakerFlashbang = MutatorCloakerFlashbang or class(BaseMutator)
MutatorCloakerFlashbang._type = "MutatorCloakerFlashbang"
MutatorCloakerFlashbang.name_id = "mutator_cloakerflashbang"
MutatorCloakerFlashbang.desc_id = "mutator_cloakerflashbang_desc"
MutatorCloakerFlashbang.reductions = {
	money = 0,
	exp = 0
}
MutatorCloakerFlashbang.disables_achievements = false
MutatorCloakerFlashbang.categories = {"crime_spree"}

MutatorCloakerFlashbang.icon_coords = {
	6,
	4
}

function MutatorCloakerFlashbang:setup(data)
	tweak_data.character.spooc.dodge_with_grenade = {
        flash = {duration = {
            12,
            12
        }},
        check = function (t, nr_grenades_used)
            local delay_till_next_use = 1
            local chance = 0.5

            if math.random() < chance then
                return true, t + delay_till_next_use
            end

            return false, t + delay_till_next_use
        end
    } 
end