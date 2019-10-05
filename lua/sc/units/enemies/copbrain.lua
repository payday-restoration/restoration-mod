if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_init = CopBrain.init
local old_update = CopBrain.update
local logic_variants = {
	security = {
		idle = CopLogicIdle,
		attack = CopLogicAttack,
		travel = CopLogicTravel,
		inactive = CopLogicInactive,
		intimidated = CopLogicIntimidated,
		arrest = CopLogicArrest,
		guard = CopLogicGuard,
		flee = CopLogicFlee,
		sniper = CopLogicSniper,
		trade = CopLogicTrade,
		phalanx = CopLogicPhalanxMinion
	}
}
local security_variant = logic_variants.security
function CopBrain:init(unit)
	old_init(self, unit)
	CopBrain._logic_variants.cop_civ = security_variant
	CopBrain._logic_variants.fbi_female = security_variant
	CopBrain._logic_variants.hrt = security_variant
	CopBrain._logic_variants.fbi_swat_vet = security_variant
	CopBrain._logic_variants.swat_titan = security_variant
	CopBrain._logic_variants.swat_assault = security_variant
	CopBrain._logic_variants.city_swat_titan = security_variant
	CopBrain._logic_variants.city_swat_titan_assault = security_variant
	CopBrain._logic_variants.skeleton_swat_titan = security_variant
	CopBrain._logic_variants.weekend = security_variant
	CopBrain._logic_variants.weekend_dmr = security_variant
	CopBrain._logic_variants.weekend_lmg = security_variant
	CopBrain._logic_variants.omnia = security_variant
	CopBrain._logic_variants.omnia_heavy = security_variant
	CopBrain._logic_variants.boom = security_variant
	CopBrain._logic_variants.boom_summers = security_variant
	CopBrain._logic_variants.taser_summers = clone(security_variant)
	CopBrain._logic_variants.medic_summers = security_variant
	CopBrain._logic_variants.rboom = security_variant
	CopBrain._logic_variants.fbi_vet = security_variant
	CopBrain._logic_variants.vetlod = security_variant	
	CopBrain._logic_variants.meme_man = security_variant	
	CopBrain._logic_variants.meme_man_shield = clone(security_variant)
	CopBrain._logic_variants.meme_man_shield.attack = ShieldLogicAttack
	CopBrain._logic_variants.meme_man_shield.intimidated = nil
	CopBrain._logic_variants.meme_man_shield.flee = nil	
	CopBrain._logic_variants.spring = clone(security_variant)
	CopBrain._logic_variants.spring.attack = TankCopLogicAttack
	CopBrain._logic_variants.summers = clone(security_variant)
	CopBrain._logic_variants.summers.attack = TankCopLogicAttack
	CopBrain._logic_variants.tank_titan = clone(security_variant)
	CopBrain._logic_variants.tank_titan.attack = TankCopLogicAttack
	CopBrain._logic_variants.tank_titan_assault = clone(security_variant)
	CopBrain._logic_variants.tank_titan_assault.attack = TankCopLogicAttack
	CopBrain._logic_variants.spring.phalanx = CopLogicPhalanxVip
	CopBrain._logic_variants.summers.phalanx = CopLogicPhalanxVip
	CopBrain._logic_variants.taser_summers.attack = TaserLogicAttack
	CopBrain._logic_variants.omnia_lpf = security_variant
	CopBrain._logic_variants.tank_biker = clone(security_variant)
	CopBrain._logic_variants.tank_biker.attack = TankCopLogicAttack
	CopBrain._logic_variants.biker_guard = security_variant
	CopBrain._logic_variants.phalanx_minion_assault = clone(security_variant)
	CopBrain._logic_variants.phalanx_minion_assault.attack = ShieldLogicAttack
	CopBrain._logic_variants.phalanx_minion_assault.intimidated = nil
	CopBrain._logic_variants.phalanx_minion_assault.flee = nil
	CopBrain._logic_variants.spooc_titan = clone(security_variant)
	CopBrain._logic_variants.spooc_titan.idle = SpoocLogicIdle
	CopBrain._logic_variants.spooc_titan.attack = SpoocLogicAttack
	CopBrain._logic_variants.taser_titan = clone(security_variant)
	CopBrain._logic_variants.autumn = clone(security_variant)
end

--Thanks Rokk--
Hooks:PostHook(CopBrain, "convert_to_criminal", "SCCopBrainDoConvert", function(self)
    
    self._unit:unit_data().is_convert = true
    
    --Ugly hack to be able to call converts
    --Kill me now
    if not SC._converts then
        SC._converts = {}
    end   
    table.insert(SC._converts, self._unit)
    
end)

	function CopBrain:convert_to_criminal(mastermind_criminal)
		self._logic_data.is_converted = true
		self._logic_data.group = nil
		local mover_col_body = self._unit:body("mover_blocker")

		mover_col_body:set_enabled(false)

		local attention_preset = PlayerMovement._create_attention_setting_from_descriptor(self, tweak_data.attention.settings.team_enemy_cbt, "team_enemy_cbt")

		self._attention_handler:override_attention("enemy_team_cbt", attention_preset)

		local health_multiplier = 1
		local damage_multiplier = 1

		if alive(mastermind_criminal) then
			--mastermind_criminal:sound():say("v21", false)
			health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_health_multiplier") or 1)
			health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_health_multiplier") or 1)
			damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_damage_multiplier") or 1)
			damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_damage_multiplier") or 1)
		else
			--managers.player:speak("v21", false, nil)
			health_multiplier = health_multiplier * managers.player:upgrade_value("player", "convert_enemies_health_multiplier", 1)
			health_multiplier = health_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_health_multiplier", 1)
			damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "convert_enemies_damage_multiplier", 1)
			damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_damage_multiplier", 1)
		end
		
		

		self._unit:character_damage():convert_to_criminal(health_multiplier)

		self._logic_data.attention_obj = nil

		CopLogicBase._destroy_all_detected_attention_object_data(self._logic_data)

		self._SO_access = managers.navigation:convert_access_flag(tweak_data.character.russian.access)
		self._logic_data.SO_access = self._SO_access
		self._logic_data.SO_access_str = tweak_data.character.russian.access
		self._slotmask_enemies = managers.slot:get_mask("enemies")
		self._logic_data.enemy_slotmask = self._slotmask_enemies
		local equipped_w_selection = self._unit:inventory():equipped_selection()

		if equipped_w_selection then
			self._unit:inventory():remove_selection(equipped_w_selection, true)
		end
		
		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/particles/impacts/money_impact_pd2"),
			position = self._unit:movement():m_pos()
		})

		local weap_name = self._unit:base():default_weapon_name()

		TeamAIInventory.add_unit_by_name(self._unit:inventory(), weap_name, true)

		local weapon_unit = self._unit:inventory():equipped_unit()

		weapon_unit:base():add_damage_multiplier(damage_multiplier)
		self:set_objective(nil)
		self:set_logic("idle", nil)

		self._logic_data.objective_complete_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_complete")
		self._logic_data.objective_failed_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_failed")

		managers.groupai:state():on_criminal_jobless(self._unit)
		self._unit:base():set_slot(self._unit, 16)
		self._unit:movement():set_stance("hos")

		local action_data = {
			clamp_to_graph = true,
			type = "act",
			body_part = 1,
			variant = "attached_collar_enter",
			blocks = {
				heavy_hurt = -1,
				hurt = -1,
				action = -1,
				light_hurt = -1,
				walk = -1
			}
		}

		self._unit:brain():action_request(action_data)
		self._unit:sound():say("cn1", true, nil)
		managers.network:session():send_to_peers_synched("sync_unit_converted", self._unit)
	end
	
	
function CopBrain:on_suppressed(state)
    self._logic_data.is_suppressed = state or nil

    if self._current_logic.on_suppressed_state then
        self._current_logic.on_suppressed_state(self._logic_data)

        if self._logic_data.char_tweak.chatter.suppress then 
		    if managers.groupai:state():chk_assault_active_atm()then
		    local roll = math.rand(1, 100)
			local chance_heeeeelpp = 50
				if roll <= chance_heeeeelpp then
                    self._unit:sound():say("hlp", true) 
					--log(" assault panic works")
				else --hopefully some variety here now
                    self._unit:sound():say("lk3a", true) 
					--log(" assault panic works")
			    end	
		    else		
               self._unit:sound():say("lk3b", true) --calmer lines for when the assault is off
			   --log("between assault panic works")
			end
        end
    end
end

end
