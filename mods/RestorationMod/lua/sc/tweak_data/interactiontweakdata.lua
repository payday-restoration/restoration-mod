InteractionTweakData.restoration = InteractionTweakData.init

function InteractionTweakData:init(...)
	InteractionTweakData:restoration(...)

--Safehouse Boost for returning LVL100+ users	
	self.res_saveboost = {}
	self.res_saveboost.text_id = "res_saveboost"
	self.res_saveboost.action_text_id = "res_saveboost_action"
	self.res_saveboost.timer = 5
	
	--Levels--
	
--Dockyard
	self.res_lvl_wetwork = {}
	self.res_lvl_wetwork.text_id = "res_lvl_wetwork"
	self.res_lvl_wetwork.action_text_id = "res_lvl_wetwork_action"
	self.res_lvl_wetwork.timer = 3
	
--Surface Tension
	self.res_lvl_platinum = {}
	self.res_lvl_platinum.text_id = "res_lvl_platinum"
	self.res_lvl_platinum.action_text_id = "res_lvl_platinum_action"
	self.res_lvl_platinum.timer = 3

--Green Harvest
	self.res_lvl_greenharvest = {}
	self.res_lvl_greenharvest.text_id = "res_lvl_greenharvest"
	self.res_lvl_greenharvest.action_text_id = "res_lvl_greenharvest_action"
	self.res_lvl_greenharvest.timer = 3
	
--Capitol Savings
	self.res_lvl_capitol = {}
	self.res_lvl_capitol.text_id = "res_lvl_capitol"
	self.res_lvl_capitol.action_text_id = "res_lvl_capitol_action"
	self.res_lvl_capitol.timer = 3

--Convenience Store
	self.res_lvl_shop = {}
	self.res_lvl_shop.text_id = "res_lvl_shop"
	self.res_lvl_shop.action_text_id = "res_lvl_shop_action"
	self.res_lvl_shop.timer = 3
	
--Alaska
	self.res_lvl_alaska = {}
	self.res_lvl_alaska.text_id = "res_lvl_alaska"
	self.res_lvl_alaska.action_text_id = "res_lvl_alaska_action"
	self.res_lvl_alaska.timer = 3
	
--Departing
	self.res_lvl_departing = {}
	self.res_lvl_departing.text_id = "res_lvl_departing"
	self.res_lvl_departing.action_text_id = "res_lvl_departing_action"
	self.res_lvl_departing.timer = 3
	
--Jackal Mercenary Backup
	self.res_lvl_assault_merc = {}
	self.res_lvl_assault_merc.text_id = "res_lvl_assault_merc"
	self.res_lvl_assault_merc.action_text_id = "res_lvl_assault_merc_action"
	self.res_lvl_assault_merc.timer = 3
	
--Shatter Alias Backup
	self.res_lvl_assault_shatter = {}
	self.res_lvl_assault_shatter.text_id = "res_lvl_assault_shatter"
	self.res_lvl_assault_shatter.action_text_id = "res_lvl_assault_shatter_action"
	self.res_lvl_assault_shatter.timer = 3
	
	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		--Skill based shaped charges--
		self.shaped_sharge = {
			icon = "equipment_c4",
			text_id = "hud_int_equipment_shaped_charge",
			contour = "interactable_icon",
			required_deployable = "trip_mine",
			deployable_consume = true,
			timer = 2,
			sound_start = "bar_c4_apply",
			sound_interupt = "bar_c4_apply_cancel",
			sound_done = "bar_c4_apply_finished",
			upgrade_timer_multiplier = {
				upgrade = "trip_mine_deploy_time_multiplier",
				category = "player"
			},			
			action_text_id = "hud_action_placing_shaped_charge",
			slot = 2,
			blocked_hint = ""
		}	
		self.shaped_charge_single = deep_clone(self.shaped_sharge)
		self.shaped_charge_single.axis = "z"		
	end
end