ModifierDodgeThis = ModifierDodgeThis or class(BaseModifier)
ModifierDodgeThis._type = "ModifierDodgeThis"
ModifierDodgeThis.name_id = "none"
ModifierDodgeThis.desc_id = "menu_cs_modifier_dodgethis"


function ModifierDodgeThis:init(data)
	tweak_data.character.fbi_vet.damage.bullet_dodge_chance = 100
end