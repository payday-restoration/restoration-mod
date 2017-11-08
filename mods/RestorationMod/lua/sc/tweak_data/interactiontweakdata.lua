InteractionTweakData.safehouse = InteractionTweakData.init

function InteractionTweakData:init(...)
	InteractionTweakData:safehouse(...)
	
	self.res_saveboost = {}
	self.res_saveboost.text_id = "res_saveboost"
	self.res_saveboost.action_text_id = "res_saveboost_action"
	self.res_saveboost.timer = 5
end
