if restoration.Options:GetValue("SC/SC") then

if managers.job and (managers.job:current_job_id() == "short2_stage2b") then

CriminalsManager.MAX_NR_TEAM_AI = 2

else

CriminalsManager.MAX_NR_TEAM_AI = 3

end

end