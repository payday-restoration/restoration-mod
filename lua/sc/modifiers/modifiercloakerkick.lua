--Cloakers dropping flash grenades when they dodge
function ModifierCloakerKick:init(data)
	ModifierCloakerKick.super.init(self, data)

    tweak_data.character.spooc.dodge_with_grenade = {
        flash = {duration = {
            12,
            12
        }},
        check = function (t, nr_grenades_used)
            local delay_till_next_use = 30
            local chance = 0.5

            if math.random() < chance then
                return true, t + delay_till_next_use
            end

            return false, t + delay_till_next_use
        end
    } 	

end

function ModifierCloakerKick:OnPlayerCloakerKicked(cloaker_unit)
end