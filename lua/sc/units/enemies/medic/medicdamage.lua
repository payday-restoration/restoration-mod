--Change cooldowns based on unit healed
function MedicDamage:heal_unit(unit)
	if self._unit:movement():chk_action_forbidden("action") then
		return false
	end
	
	local my_tweak_data = self._unit:base()._tweak_table
	local target_tweak_table = unit:base()._tweak_table
	local target_char_tweak = tweak_data.character[target_tweak_table]
	local cooldown = target_char_tweak.heal_cooldown or 10
	
	cooldown = managers.modifiers:modify_value("MedicDamage:CooldownTime", cooldown)
		
	self._heal_cooldown_t = TimerManager:game():time() + self._heal_cooldown + cooldown
		
	unit:character_damage():do_medic_heal()
				
	--Reveal the Medic that did it! Seriously, fuck that guy!
	if not self._unit:character_damage():dead() then
		if self._unit:contour() then
			self._unit:contour():add("medic_show", false)
			self._unit:contour():flash("medic_show", 0.2)
		end
	end

	local action_data = {
		client_interrupt = true,
		body_part = 3,
		type = "heal",
		blocks = {
			action = -1
		}
	}
	
	--To do: make this actually sync correctly, since Overkill likely never will
	if Global.game_settings.difficulty == "sm_wish" then
		if my_tweak_data == "medic" or my_tweak_data == "tank_medic" then
			unit:base():add_buff("base_damage", 15 * 0.01)

			unit:base():enable_asu_laser(true)
		end
	end	

	self._unit:movement():action_request(action_data)
	self._unit:sound():say("heal", true)
	managers.network:session():send_to_peers_synched("sync_medic_heal", self._unit:id() ~= -1 and self._unit or nil)
	MedicActionHeal.check_achievements()

	return true
end

function MedicDamage:sync_heal_action()
	self._heal_cooldown_t = TimerManager:game():time() + self._heal_cooldown
	local action_data = nil

	if Network:is_server() then
		if not self._unit:anim_data().act then
			action_data = {
				body_part = 3,
				type = "heal",
				blocks = {
					action = -1
				}
			}
		end
	else
		action_data = {
			block_type = "action",
			type = "heal",
			body_part = 3,
			client_interrupt = not self._unit:anim_data().act,
			blocks = {
				action = -1
			}
		}
	end
	
	--Reveal the Medic that did it! Seriously, fuck that guy!
	if not self._unit:character_damage():dead() then
		if self._unit:contour() then
			self._unit:contour():add("medic_show", false)
			self._unit:contour():flash("medic_show", 0.2)
		end
	end	

	if action_data then
		self._unit:movement():action_request(action_data)
	end

	if self._unit:sound() then
		self._unit:sound():say("heal")
	end
end

-- Make medics require line of sight to heal
local verify_heal_requesting_unit_original = MedicDamage.verify_heal_requesting_unit
function MedicDamage:verify_heal_requesting_unit(requesting_unit, ...)
	if not verify_heal_requesting_unit_original(self, requesting_unit, ...) then
		return false
	end

	local unit_pos = requesting_unit:movement():m_head_pos()
	local medic_pos = self._unit:movement():m_head_pos()
	return not World:raycast("ray", unit_pos, medic_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "report")
end