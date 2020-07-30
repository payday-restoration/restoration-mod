Hooks:PostHook(Setup, "init_managers", "pdth_hud_define_challenges", function(ply)
    tweak_data.challenges_res = ChallengesTweakData:new()
    managers.challenges_res = ChallengesManagerRes:new()
end)