if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	local old_eco_init = EconomyTweakData.init
	function EconomyTweakData:init()
		old_eco_init(self)
		
		--Modifiers are neat I guess--
		self.bonuses.concealment_p1.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.concealment_p1.stats = {}
		self.bonuses.concealment_p1.exp_multiplier = 1.1
		self.bonuses.concealment_p1.money_multiplier = 0.9					
		
		self.bonuses.concealment_p2.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.concealment_p2.stats = {}
		self.bonuses.concealment_p2.exp_multiplier = 1.1
		self.bonuses.concealment_p2.money_multiplier = 0.9			
		
		self.bonuses.concealment_p3.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.concealment_p3.stats = {}
		self.bonuses.concealment_p3.exp_multiplier = 1.1
		self.bonuses.concealment_p3.money_multiplier = 0.9			
		
		self.bonuses.spread_p1.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.spread_p1.stats = {}
		self.bonuses.spread_p1.exp_multiplier = 1.1
		self.bonuses.spread_p1.money_multiplier = 0.9			
		
		self.bonuses.spread_n1.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.spread_n1.stats = {}
		self.bonuses.spread_n1.exp_multiplier = 1.1
		self.bonuses.spread_n1.money_multiplier = 0.9			
		
		self.bonuses.recoil_p1.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.recoil_p1.stats = {}
		self.bonuses.recoil_p1.exp_multiplier = 1.1
		self.bonuses.recoil_p1.money_multiplier = 0.9			
		
		self.bonuses.recoil_p2.name_id = "bm_wp_upg_bonus_team_exp_money_p3_desc"
		self.bonuses.recoil_p2.stats = {}
		self.bonuses.recoil_p2.exp_multiplier = 1.1
		self.bonuses.recoil_p2.money_multiplier = 0.9			

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
		self.bonuses.team_exp_money_p3.exp_multiplier = 1.1
		self.bonuses.team_exp_money_p3.money_multiplier = 0.9			
		
	end

end