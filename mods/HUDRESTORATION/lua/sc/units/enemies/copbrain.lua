if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

require("lib/units/enemies/cop/logics/CopLogicBase")
require("lib/units/enemies/cop/logics/CopLogicInactive")
require("lib/units/enemies/cop/logics/CopLogicIdle")
require("lib/units/enemies/cop/logics/CopLogicAttack")
require("lib/units/enemies/cop/logics/CopLogicIntimidated")
require("lib/units/enemies/cop/logics/CopLogicTravel")
require("lib/units/enemies/cop/logics/CopLogicArrest")
require("lib/units/enemies/cop/logics/CopLogicGuard")
require("lib/units/enemies/cop/logics/CopLogicFlee")
require("lib/units/enemies/cop/logics/CopLogicSniper")
require("lib/units/enemies/cop/logics/CopLogicTrade")
require("lib/units/enemies/cop/logics/CopLogicPhalanxMinion")
require("lib/units/enemies/cop/logics/CopLogicPhalanxVip")
require("lib/units/enemies/tank/logics/TankCopLogicAttack")
require("lib/units/enemies/shield/logics/ShieldLogicAttack")
require("lib/units/enemies/spooc/logics/SpoocLogicIdle")
require("lib/units/enemies/spooc/logics/SpoocLogicAttack")
require("lib/units/enemies/taser/logics/TaserLogicAttack")
local old_init = CopBrain.init
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
	CopBrain._logic_variants.fbi_swat_vet = security_variant
	CopBrain._logic_variants.boom = security_variant
	CopBrain._logic_variants.rboom = security_variant
	CopBrain._logic_variants.fbi_vet = security_variant
	CopBrain._logic_variants.spring = clone(security_variant)
	CopBrain._logic_variants.spring.attack = TankCopLogicAttack
	CopBrain._logic_variants.tank_titan = clone(security_variant)
	CopBrain._logic_variants.tank_titan.attack = TankCopLogicAttack
	CopBrain._logic_variants.spring.phalanx = CopLogicPhalanxVip
end

function CopBrain:_chk_use_cover_grenade(unit)
	if not Network:is_server() or not self._logic_data.char_tweak.dodge_with_grenade or not self._logic_data.attention_obj then
		return
	end
	local check_f = self._logic_data.char_tweak.dodge_with_grenade.check
	local t = TimerManager:game():time()
	if check_f and (not self._flashbang_cover_expire_t or t > self._next_cover_grenade_chk_t) then
		local result, next_t = check_f(t, self._nr_flashbang_covers_used or 0)
		self._next_cover_grenade_chk_t = next_t
		if not result then
			return
		end
	end
	local grenade_was_used
	if self._logic_data.attention_obj.dis > 1000 or not self._logic_data.char_tweak.dodge_with_grenade.flash then
		if self._logic_data.char_tweak.dodge_with_grenade.smoke then
			local duration = self._logic_data.char_tweak.dodge_with_grenade.smoke.duration
			managers.groupai:state():detonate_smoke_grenade(self._logic_data.m_pos + math.UP * 10, self._unit:movement():m_head_pos(), math.lerp(duration[1], duration[2], math.random()), false)
			grenade_was_used = true
		end
	elseif self._logic_data.char_tweak.dodge_with_grenade.flash then
		local duration = self._logic_data.char_tweak.dodge_with_grenade.flash.duration
		managers.groupai:state():detonate_smoke_grenade(self._logic_data.m_pos + math.UP * 10, self._unit:movement():m_head_pos(), math.lerp(duration[1], duration[2], math.random()), true)
		grenade_was_used = true
	end
	if grenade_was_used then
		self._nr_flashbang_covers_used = (self._nr_flashbang_covers_used or 0) + 1
	end
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

end