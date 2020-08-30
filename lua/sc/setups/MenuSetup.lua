Hooks:PostHook(MenuSetup, "init_managers", "pdth_hud_define_challenges_menu", function(ply)
    tweak_data.challenges_res = ChallengesTweakDataRes:new()
    managers.challenges_res = ChallengesManagerRes:new()
end)