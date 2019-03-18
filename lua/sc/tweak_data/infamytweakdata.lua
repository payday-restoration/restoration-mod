local sc_itd = InfamyTweakData.init
function InfamyTweakData:init()
	sc_itd(self)

	if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
		self.items.infamy_mastermind.upgrades.skilltree.multiplier = 1
		self.items.infamy_enforcer.upgrades.skilltree.multiplier = 1
		self.items.infamy_technician.upgrades.skilltree.multiplier = 1
		self.items.infamy_ghost.upgrades.skilltree.multiplier = 1
	end
end