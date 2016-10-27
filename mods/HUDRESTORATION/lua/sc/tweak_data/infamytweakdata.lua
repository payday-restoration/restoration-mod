local sc_itd = InfamyTweakData.init
function InfamyTweakData:init()
	sc_itd(self)

	if restoration.Options:GetValue("SC/SC") then	
		--oh fugg :DDDDDD--
		self.items.infamy_mastermind.upgrades.skilltree.multiplier = 1
		self.items.infamy_enforcer.upgrades.skilltree.multiplier = 1
		self.items.infamy_technician.upgrades.skilltree.multiplier = 1
		self.items.infamy_ghost.upgrades.skilltree.multiplier = 1
	end
end