--Loads any custom voicelines that have a chance of being used.
--Only loads bravo lines if pro job is enabled.
--Only loads a captain's lines if the current map spawns that captain.
--bravo dmr not included because marshals use it 
local projob_only_voicelines = {
	bravowo = true,
	bravowo_elite = true,
	bravowo_mex = true,
	bravowo_elite_mex = true,
	bravowo_murky = true,
	bravowo_elite_murky = true
}
Hooks:PostHook(Setup, "load_packages", "restorationVoicelineLoad", function (self)
	local job = Global.level_data and Global.level_data.level_id
	if job then
		local map_captain = restoration.captain_spawns[job]
		local load_list = {}
		for unit, data in pairs(tweak_data.character) do
			if type(data) == "table" and data.custom_voicework then
				if data.captain_type then
					if data.captain_type == map_captain then
						load_list[#load_list + 1] = data.custom_voicework					
					end
				elseif not projob_only_voicelines[data.custom_voicework] then
					load_list[#load_list + 1] = data.custom_voicework
				 elseif Global.game_settings and Global.game_settings.one_down or managers.skirmish and managers.skirmish:is_skirmish() then 
					load_list[#load_list + 1] = data.custom_voicework
				end
			end
		end

		restoration.Voicelines:load(load_list)
	end
end)

--Trigger an unload for all loaded voicelines.
--Maximizing cross mod compatitibility is pretty important here, so use a posthook.
Hooks:PostHook(Setup, "unload_packages", "RestorationVoicelineUnload", function(self)
	restoration.Voicelines:unload()
end)