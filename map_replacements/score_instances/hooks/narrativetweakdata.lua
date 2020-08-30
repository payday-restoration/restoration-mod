Hooks:PostHook(NarrativeTweakData,"init","score_narrative_init",function(self)

--Score Contact + Unavaliable version
	self.contacts.score_contact = {
		name_id = "heist_contact_scores_name",
		description_id = "heist_contact_scores_desc",
		package = "packages/contact_bain",
		assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	}
	self.contacts.score_contact_unavaliable = deep_clone(self.contacts.score_contact)
	self.contacts.score_contact_unavaliable.hidden = true
	
end)