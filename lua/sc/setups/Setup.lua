Hooks:PostHook(Setup, "init_managers", "pdth_hud_define_challenges", function(ply)
    tweak_data.challenges = ChallengesTweakData:new()
    managers.challenges = ChallengesManager:new()
end)