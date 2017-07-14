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
	CopMovement._action_variants.city_swat_titan = security_variant
	CopMovement._action_variants.boom = security_variant
	CopMovement._action_variants.rboom = security_variant
	CopMovement._action_variants.fbi_vet = security_variant
	CopMovement._action_variants.spring = clone(security_variant)
	CopMovement._action_variants.spring.walk = TankCopActionWalk
	CopMovement._action_variants.tank_titan = clone(security_variant)
	CopMovement._action_variants.tank_titan.walk = TankCopActionWalk
end

function CopMovement:post_init()
	local unit = self._unit
	self._ext_brain = unit:brain()
	self._ext_network = unit:network()
	self._ext_anim = unit:anim_data()
	self._ext_base = unit:base()
	self._ext_damage = unit:character_damage()
	self._ext_inventory = unit:inventory()
	self._tweak_data = tweak_data.character[self._ext_base._tweak_table]
	tweak_data:add_reload_callback(self, self.tweak_data_clbk_reload)
	self._machine = self._unit:anim_state_machine()
	self._machine:set_callback_object(self)
	self._stance = {
		code = 1,
		name = "ntl",
		values = {
			1,
			0,
			0,
			0
		}
	}
	if managers.navigation:is_data_ready() then
		self._nav_tracker = managers.navigation:create_nav_tracker(self._m_pos)
		self._pos_rsrv_id = managers.navigation:get_pos_reservation_id()
	else
		Application:error("[CopMovement:post_init] Spawned AI unit with incomplete navigation data.")
		self._unit:set_extension_update(ids_movement, false)
	end
	self._unit:kill_mover()
	self._unit:set_driving("script")
	self._unit:unit_data().has_alarm_pager = self._tweak_data.has_alarm_pager
	local event_list = {
		"bleedout",
		"light_hurt",
		"heavy_hurt",
		"expl_hurt",
		"hurt",
		"hurt_sick",
		"shield_knock",
		"knock_down",
		"stagger",
		"counter_tased",
		"taser_tased",
		"death",
		"fatal",
		"fire_hurt",
		"poison_hurt",
		"concussion"
	}
	table.insert(event_list, "healed")
	self._unit:character_damage():add_listener("movement", event_list, callback(self, self, "damage_clbk"))
	self._unit:inventory():add_listener("movement", {"equip", "unequip"}, callback(self, self, "clbk_inventory"))
	log("SC: ADDING WEAPONS")
	self:add_weapons()
	log("SC: WEAPONS ADDED")
	if self._unit:inventory():is_selection_available(1) then
		self._unit:inventory():equip_selection(1, true)
	elseif self._unit:inventory():is_selection_available(2) then
		self._unit:inventory():equip_selection(2, true)
	end
	if self._ext_inventory:equipped_selection() == 2 and managers.groupai:state():whisper_mode() then
		log("SC: Stealth with secondary equipped, disabling weapon")
		self._ext_inventory:set_weapon_enabled(false)
		log("SC: Secondary disabled")
	end
	local weap_name = self._ext_base:default_weapon_name(managers.groupai:state():enemy_weapons_hot() and "primary" or "secondary")
	local fwd = self._m_rot:y()
	self._action_common_data = {
		stance = self._stance,
		pos = self._m_pos,
		rot = self._m_rot,
		fwd = fwd,
		right = self._m_rot:x(),
		unit = unit,
		machine = self._machine,
		ext_movement = self,
		ext_brain = self._ext_brain,
		ext_anim = self._ext_anim,
		ext_inventory = self._ext_inventory,
		ext_base = self._ext_base,
		ext_network = self._ext_network,
		ext_damage = self._ext_damage,
		char_tweak = self._tweak_data,
		nav_tracker = self._nav_tracker,
		active_actions = self._active_actions,
		queued_actions = self._queued_actions,
		look_vec = mvector3.copy(fwd)
	}
	self:upd_ground_ray()
	if self._gnd_ray then
		self:set_position(self._gnd_ray.position)
	end
	self:_post_init()
end

function CopMovement:add_weapons()
	if self._tweak_data.use_factory then
		local weapon_to_use = self._tweak_data.factory_weapon_id[ math.random( #self._tweak_data.factory_weapon_id ) ]
		log("SC: WEAPON TO USE " .. weapon_to_use)
		if weapon_to_use then
			self._unit:inventory():add_unit_by_factory_name(weapon_to_use, false, false, nil, "")
			log("SC: PRIMARY ADDED")
		end
	else
		local prim_weap_name = self._ext_base:default_weapon_name("primary")
		local sec_weap_name = self._ext_base:default_weapon_name("secondary")
		if prim_weap_name then
			self._unit:inventory():add_unit_by_name(prim_weap_name)
		end
		if sec_weap_name and sec_weap_name ~= prim_weap_name then
			self._unit:inventory():add_unit_by_name(sec_weap_name)
		end
	end
end

function CopMovement:_chk_play_equip_weapon()
	if self._stance.values[1] == 1 and not self._ext_anim.equip and not self._tweak_data.no_equip_anim and not self:chk_action_forbidden("action") then
		local redir_res = self:play_redirect("equip")
		if redir_res then
			local weapon_unit = self._ext_inventory:equipped_unit()
			if weapon_unit then
				local weap_tweak = weapon_unit:base():weapon_tweak_data()
				log("SC: Weapon tweak found! " .. weap_tweak.sounds.prefix)
				local weapon_hold = weap_tweak.hold
				if type(weap_tweak.hold) == "table" then
					local num = #weap_tweak.hold + 1
					for i, hold_type in ipairs(weap_tweak.hold) do
						self._machine:set_parameter(redir_res, "to_" .. hold_type, num - i)
					end
				else
					self._machine:set_parameter(redir_res, "to_" .. weap_tweak.hold, 1)
				end
			end
		end
	end
	self._ext_inventory:set_weapon_enabled(true)
end

end