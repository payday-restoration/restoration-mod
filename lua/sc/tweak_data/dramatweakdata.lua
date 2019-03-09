if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function DramaTweakData:init()
	self:_create_table_structure()
	self.drama_actions = {
		criminal_dead = 0.2,
		criminal_disabled = 0.1,
		criminal_hurt = 0.5
	}
	self.decay_period = 30
	self.max_dis = 6000
	self.max_dis_mul = 0.5
	self.low = 0.1
	self.peak = 0.95
	self.assault_fade_end = 1
end

end