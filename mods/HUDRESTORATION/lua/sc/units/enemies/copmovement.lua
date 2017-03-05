if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

require("lib/units/enemies/cop/actions/lower_body/CopActionIdle")
require("lib/units/enemies/cop/actions/lower_body/CopActionWalk")
require("lib/units/enemies/cop/actions/full_body/CopActionAct")
require("lib/units/enemies/cop/actions/lower_body/CopActionTurn")
require("lib/units/enemies/cop/actions/full_body/CopActionHurt")
require("lib/units/enemies/cop/actions/lower_body/CopActionStand")
require("lib/units/enemies/cop/actions/lower_body/CopActionCrouch")
require("lib/units/enemies/cop/actions/upper_body/CopActionShoot")
require("lib/units/enemies/cop/actions/upper_body/CopActionReload")
require("lib/units/enemies/cop/actions/upper_body/CopActionTase")
require("lib/units/enemies/cop/actions/full_body/CopActionDodge")
require("lib/units/enemies/cop/actions/full_body/CopActionWarp")
require("lib/units/enemies/spooc/actions/lower_body/ActionSpooc")
require("lib/units/civilians/actions/lower_body/CivilianActionWalk")
require("lib/units/civilians/actions/lower_body/EscortWithSuitcaseActionWalk")
require("lib/units/enemies/tank/actions/lower_body/TankCopActionWalk")
require("lib/units/player_team/actions/lower_body/CriminalActionWalk")
require("lib/units/enemies/cop/actions/upper_body/CopActionHealed")
require("lib/units/enemies/medic/actions/upper_body/MedicActionHeal")

local old_init = CopMovement.init
local action_variants = {
	security = {
		idle = CopActionIdle,
		act = CopActionAct,
		walk = CopActionWalk,
		turn = CopActionTurn,
		hurt = CopActionHurt,
		stand = CopActionStand,
		crouch = CopActionCrouch,
		shoot = CopActionShoot,
		reload = CopActionReload,
		spooc = ActionSpooc,
		tase = CopActionTase,
		dodge = CopActionDodge,
		warp = CopActionWarp,
		healed = CopActionHealed
	}
}
local security_variant = action_variants.security
function CopMovement:init(unit)
	old_init(self, unit)
	CopMovement._action_variants.fbi_swat_vet = security_variant
	CopMovement._action_variants.boom = security_variant
	CopMovement._action_variants.rboom = security_variant
	CopMovement._action_variants.fbi_vet = security_variant
	CopMovement._action_variants.spring = clone(security_variant)
	CopMovement._action_variants.spring.walk = TankCopActionWalk
	CopMovement._action_variants.tank_titan = clone(security_variant)
	CopMovement._action_variants.tank_titan.walk = TankCopActionWalk
end

function CopMovement:damage_clbk(my_unit, damage_info)
	local hurt_type = damage_info.result.type
	local roll = math.rand(1, 100)
	local chance_stun = 25
	if hurt_type == "knock_down" or hurt_type == "stagger" then
		if self._unit:base()._tweak_table == "tank" or self._unit:base()._tweak_table == "tank_hw" or self._unit:base()._tweak_table == "tank_titan" then
			if roll <= chance_stun then
				hurt_type = "expl_hurt"
			else
				hurt_type = "light_hurt"		
			end
		else
			hurt_type = "heavy_hurt"
		end		
	end
	local block_type = hurt_type
	if hurt_type == "expl_hurt" or hurt_type == "fire_hurt" or hurt_type == "poison_hurt" or hurt_type == "taser_tased" then
		block_type = "heavy_hurt"
	end
	if hurt_type == "death" and self._queued_actions then
		self._queued_actions = {}
	end
	if not hurt_type or Network:is_server() and self:chk_action_forbidden(block_type) then
		if hurt_type == "death" then
			debug_pause_unit(self._unit, "[CopMovement:damage_clbk] Death action skipped!!!", self._unit)
			Application:draw_cylinder(self._m_pos, self._m_pos + math.UP * 5000, 30, 1, 0, 0)
			for body_part, action in ipairs(self._active_actions) do
				if action then
					print(body_part, action:type(), inspect(action._blocks))
				end
			end
		end
		return
	end
	if damage_info.variant == "stun" then
		if alive(self._ext_inventory and self._ext_inventory._shield_unit) then
			hurt_type = "shield_knock"
			block_type = "shield_knock"
			damage_info.variant = "melee"
			damage_info.result = {
				type = "shield_knock",
				variant = "melee"
			}
			damage_info.shield_knock = true
		end
	end
	if hurt_type == "death" then
		if self._rope then
			self._rope:base():retract()
			self._rope = nil
			self._rope_death = true
			if self._unit:sound().anim_clbk_play_sound then
				self._unit:sound():anim_clbk_play_sound(self._unit, "repel_end")
			end
		end
		if Network:is_server() then
			self:set_attention()
		else
			self:synch_attention()
		end
	end
	local attack_dir = damage_info.col_ray and damage_info.col_ray.ray or damage_info.attack_dir
	local hit_pos = damage_info.col_ray and damage_info.col_ray.position or damage_info.pos
	local lgt_hurt = hurt_type == "light_hurt"
	local body_part = lgt_hurt and 4 or 1
	local blocks
	if not lgt_hurt then
		blocks = {
			walk = -1,
			action = -1,
			act = -1,
			aim = -1,
			tase = -1
		}
		if hurt_type == "bleedout" then
			blocks.bleedout = -1
			blocks.hurt = -1
			blocks.heavy_hurt = -1
			blocks.hurt_sick = -1
			blocks.concussion = -1
		end
	end
	if damage_info.variant == "tase" then
		block_type = "bleedout"
	elseif hurt_type == "expl_hurt" or hurt_type == "fire_hurt" or hurt_type == "poison_hurt" or hurt_type == "taser_tased" then
		block_type = "heavy_hurt"
	else
		block_type = hurt_type
	end
	local client_interrupt
	if Network:is_client() and (hurt_type == "light_hurt" or hurt_type == "hurt" and damage_info.variant ~= "tase" or hurt_type == "heavy_hurt" or hurt_type == "expl_hurt" or hurt_type == "shield_knock" or hurt_type == "counter_tased" or hurt_type == "taser_tased" or hurt_type == "counter_spooc" or hurt_type == "death" or hurt_type == "hurt_sick" or hurt_type == "fire_hurt" or hurt_type == "poison_hurt" or hurt_type == "concussion") then
		client_interrupt = true
	end
	local tweak = self._tweak_data
	local action_data
	if hurt_type == "healed" then
		if Network:is_client() then
			client_interrupt = true
		end
		action_data = {
			type = "healed",
			body_part = 3,
			client_interrupt = client_interrupt
		}
	else
		action_data = {
			type = "hurt",
			block_type = block_type,
			hurt_type = hurt_type,
			variant = damage_info.variant,
			direction_vec = attack_dir,
			hit_pos = hit_pos,
			body_part = body_part,
			blocks = blocks,
			client_interrupt = client_interrupt,
			attacker_unit = damage_info.attacker_unit,
			death_type = tweak.damage.death_severity and (damage_info.damage / tweak.HEALTH_INIT > tweak.damage.death_severity and "heavy" or "normal") or "normal",
			ignite_character = damage_info.ignite_character,
			start_dot_damage_roll = damage_info.start_dot_damage_roll,
			is_fire_dot_damage = damage_info.is_fire_dot_damage,
			fire_dot_data = damage_info.fire_dot_data
		}
	end
	if Network:is_server() or not self:chk_action_forbidden(action_data) then
		self:action_request(action_data)
		if hurt_type == "death" and self._queued_actions then
			self._queued_actions = {}
		end
	end
end

end