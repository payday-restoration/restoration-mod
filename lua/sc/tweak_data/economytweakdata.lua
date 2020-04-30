local old_eco_init = EconomyTweakData.init
function EconomyTweakData:init()
	old_eco_init(self)

	--Modifiers are neat I guess--
	self.bonuses.concealment_p1.name_id = "bm_menu_bonus_concealment_p1"
	self.bonuses.concealment_p1.stats = {concealment = 1, spread = -1}
	self.bonuses.concealment_p1.damage_near_mul = -100
	self.bonuses.concealment_p1.damage_far_mul = -200
	self.bonuses.concealment_p2.name_id = "bm_menu_bonus_concealment_p2"
	self.bonuses.concealment_p2.stats = {concealment = 2, spread = -2}
	self.bonuses.concealment_p2.damage_near_mul = -200
	self.bonuses.concealment_p2.damage_far_mul = -400
	self.bonuses.concealment_p3.name_id = "bm_menu_bonus_concealment_p3"
	self.bonuses.concealment_p3.stats = {concealment = 3, spread = -3}
	self.bonuses.concealment_p3.damage_near_mul = -300
	self.bonuses.concealment_p3.damage_far_mul = -600
	self.bonuses.spread_p1.name_id = "bm_menu_bonus_spread_p1"
	self.bonuses.spread_p1.stats = {spread = 1, recoil = -1}
	self.bonuses.spread_p1.damage_near_mul = 100
	self.bonuses.spread_p1.damage_far_mul = 200
	self.bonuses.spread_n1.name_id = "bm_menu_bonus_spread_n1"
	self.bonuses.spread_n1.stats = {spread = -3, recoil = 3}
	self.bonuses.spread_n1.damage_near_mul = -300
	self.bonuses.spread_n1.damage_far_mul = -600
	self.bonuses.recoil_p1.name_id = "bm_menu_bonus_recoil_p1"
	self.bonuses.recoil_p1.stats = {spread = -1, recoil = 1}
	self.bonuses.recoil_p1.damage_near_mul = -100
	self.bonuses.recoil_p1.damage_far_mul = -200
	self.bonuses.recoil_p2.name_id = "bm_menu_bonus_recoil_p2"
	self.bonuses.recoil_p2.stats = {spread = -2, recoil = 2}
	self.bonuses.recoil_p2.damage_near_mul = -200
	self.bonuses.recoil_p2.damage_far_mul = -400

	--Essentially disabling these for the time being because they're kinda gay--
	self.bonuses.damage_p1 = deep_clone(self.bonuses.concealment_p1)
	self.bonuses.damage_p2 = deep_clone(self.bonuses.concealment_p2)
	self.bonuses.total_ammo_p1 = deep_clone(self.bonuses.concealment_p3)
	self.bonuses.total_ammo_p3 = deep_clone(self.bonuses.spread_p1)

	--Changing up the completely Overkill shit because let's be honest a stat boost AND XP bonus is gay as fuck--
	self.bonuses.concealment_p1_tem_p1 = deep_clone(self.bonuses.concealment_p1)
	self.bonuses.concealment_p2_tem_p1 = deep_clone(self.bonuses.concealment_p2)
	self.bonuses.concealment_p3_tem_p1 = deep_clone(self.bonuses.concealment_p3)
	self.bonuses.spread_p1_tem_p1 = deep_clone(self.bonuses.spread_p1)
	self.bonuses.spread_n1_tem_p1 = deep_clone(self.bonuses.spread_n1)
	self.bonuses.recoil_p1_tem_p1 = deep_clone(self.bonuses.recoil_p1)
	self.bonuses.recoil_p2_tem_p1 = deep_clone(self.bonuses.recoil_p2)
	self.bonuses.damage_p1_tem_p1 = deep_clone(self.bonuses.concealment_p1)
	self.bonuses.damage_p2_tem_p1 = deep_clone(self.bonuses.concealment_p2)
	self.bonuses.total_ammo_p1_tem_p1 = deep_clone(self.bonuses.concealment_p3)
	self.bonuses.total_ammo_p3_tem_p1 = deep_clone(self.bonuses.spread_p1)
	self.bonuses.team_exp_money_p3.exp_multiplier = 1.05
	self.bonuses.team_exp_money_p3.money_multiplier = 0.9
end