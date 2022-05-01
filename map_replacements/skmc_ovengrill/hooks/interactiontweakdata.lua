InteractionTweakData.prj_hotfix = InteractionTweakData.init;

function InteractionTweakData:init(...)
	
	InteractionTweakData:prj_hotfix(...)
	
	-- log("Encoding string...")
	-- log(tostring(Idstring("units/dev_tools/level_tools/dev_door_blocker/dev_door_blocker_1x5x3"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/dev_door_blocker/dev_door_blocker_1x1x3"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/dev_door_blocker/dev_door_blocker_1x2x3"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/dev_door_blocker/dev_door_blocker_1x4x3"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/dev_door_blocker/dev_door_blocker_3x4x3"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/door_blocker/door_blocker"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/door_blocker/door_blocker_1m"):key()))
	-- log(tostring(Idstring("units/dev_tools/level_tools/door_blocker/door_blocker_4x1m"):key()))
	
	self.money_single_cop = {}
	self.money_single_cop.icon = "interaction_money_wrap"
	self.money_single_cop.text_id = "money_single_cop_text"
	self.money_single_cop.start_active = false
	self.money_single_cop.interact_distance = 100	
	
	self.throw_hashlist_away = {}
	self.throw_hashlist_away.icon = "hud_int_take_harddrive"
	self.throw_hashlist_away.text_id = "throw_hashlist_away"
	self.throw_hashlist_away.equipment_text_id = "need_hashlist"
	self.throw_hashlist_away.interact_distance = 100
	self.throw_hashlist_away.timer = 1
	self.throw_hashlist_away.special_equipment = "harddrive"
	self.throw_hashlist_away.equipment_consume = true
	self.throw_hashlist_away.sound_start = "bar_shuffle_papers",
	self.throw_hashlist_away.sound_interupt = "bar_shuffle_papers_cancel",
	self.throw_hashlist_away.sound_done = "bar_shuffle_papers_finished"
	
end