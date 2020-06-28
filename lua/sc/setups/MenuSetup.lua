if not restoration.Options:GetValue("OTHER/PDTHChallenges") then return end

Hooks:PostHook(MenuSetup, "init_managers", "pdth_hud_define_challenges_menu", function(ply)
    tweak_data.challenges = ChallengesTweakData:new()
    managers.challenges = ChallengesManager:new()
end)