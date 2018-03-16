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
	CopBrain._logic_variants.city_swat_titan = security_variant
	CopBrain._logic_variants.city_swat_titan_assault = security_variant
	CopBrain._logic_variants.boom = security_variant
	CopBrain._logic_variants.boom_summers = security_variant
	CopBrain._logic_variants.taser_summers = clone(security_variant)
	CopBrain._logic_variants.medic_summers = security_variant
	CopBrain._logic_variants.rboom = security_variant
	CopBrain._logic_variants.fbi_vet = security_variant
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