--Sets Cloakers to cuff you on melee strikes, way scarier than it sounds
function ModifierCloakerArrest:init(data)
	tweak_data.character.spooc.cuff_on_melee = true
end

function ModifierCloakerArrest:modify_value(id, value)
end