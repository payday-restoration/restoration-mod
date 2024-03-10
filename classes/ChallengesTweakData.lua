ChallengesTweakData = ChallengesTweakData or class()

local tiny_xp = 800
local small_xp = 1000
local mid_xp = 1400
local large_xp = 2400
local huge_xp = 3600
local gigantic_xp = 5000

local simple_cc = 3

local ten_steps = { "size08", "size10", "size12", "size12", "size14", "size16", "size18", "size20", "size20", "size20" }
local five_steps = { "size12", "size14", "size16", "size18", "size20" }

local normal_and_above = {
    "normal",
    "hard",
    "overkill",
    "overkill_145",
    "easy_wish",
    "overkill_290",
    "sm_wish"
}
local hard_and_above = {
    "hard",
    "overkill",
    "overkill_145",
    "easy_wish",
    "overkill_290",
    "sm_wish"
}
local veryhard_and_above = {
    "overkill",
    "overkill_145",
    "easy_wish",
    "overkill_290",
    "sm_wish"
}
local overkill_and_above = {
    "overkill_145",
    "easy_wish",
    "overkill_290",
    "sm_wish"
}
local easywish_and_above = {
    "easy_wish",
    "overkill_290",
    "sm_wish"
}
local deathwish_and_above = {
    "overkill_290",
    "sm_wish"
}
local sm_wish_and_above = {
    "sm_wish"
}

function ChallengesTweakData:init()
	--self.categories	= {}
	self.character = {}
	self.character.deploy_ammobag = {
		title_id = "ch_deploy_ammobag_hl",
		description_id = "ch_deploy_ammobag",
		counter_id = "deploy_ammobag",
		unlock_level = 0,
		count = 100,
		--No visible counter?
		xp = mid_xp,
	}
	self.character.deploy_medicbag = {
		title_id = "ch_deploy_medicbag_hl",
		description_id = "ch_deploy_medicbag",
		counter_id = "deploy_medicbag",
		unlock_level = 0,
		count = 100,
		--No visible counter?
		xp = mid_xp,
	}
	self.character.deploy_ecm = {
		title_id = "ch_deploy_ecm_hl",
		description_id = "ch_deploy_ecm",
		counter_id = "deploy_ecm",
		unlock_level = 0,
		count = 100,
		--No visible counter?
		xp = mid_xp,
	}
	self.character.deploy_fak = {
		title_id = "ch_deploy_fak_hl",
		description_id = "ch_deploy_fak",
		counter_id = "deploy_fak",
		unlock_level = 0,
		count = 100,
		--No visible counter?
		xp = mid_xp,
	}
	self.character.deploy_sentry = {
		title_id = "ch_deploy_sentry_hl",
		description_id = "ch_deploy_sentry",
		counter_id = "deploy_sentry",
		unlock_level = 0,
		count = 100,
		--No visible counter?
		xp = mid_xp,
    }

    self.session = {}
--[[
    self.session.testing1 = {
		title_id = "ch_branch_bank_sm_wish_hl",
		description_id = "ch_branch_bank_sm_wish",
		xp = gigantic_xp,
		cc = simple_cc,
		level_id = {
            "four_stores_remixed",
            "rat",
            "ukrainian_job_res"
        },
		difficulty = "easy_wish",
		session_stopped = {
			callback = "level_success"
		}
    }
]]
    self.session.bridge_no_bleedouts_hard = {
		title_id = "ch_bridge_no_bleedouts_hl",
		description_id = "ch_bridge_no_bleedouts",
		xp = huge_xp,
        cc = 1,
		level_id = "glace",
		difficulty = {
			"hard",
			"overkill",
			"overkill_145"
		},
		session_stopped = {
			callback = "never_bleedout"
		}
    }
    self.session.watchdogs_d1_heavy_wpn1 = {
		title_id = "ch_watchdogs_d1_heavy_wpn1_hl",
		description_id = "ch_watchdogs_d1_heavy_wpn1",
		xp = gigantic_xp,
		level_id =  {
            "watchdogs_1",
            "watchdogs_1_night"
        },
        difficulty = overkill_and_above,
		depends_on = {
			primaries = {"m134","m95"},
			secondaries = {"rpg7"},
			armors = {"level_7"}
		},
		session_stopped = {
			callback = "level_success"
		}
    }
    self.session.pro_job_test = {
        title_id = "ch_pro_job_test",
        description_id = "ch_pro_job_test_desc",
        difficulty = easywish_and_above,
        job_id = {
            "firestarter"
        },
        cc = 6,
        session_stopped = {
            callback = "pro_job_success"
        }
    }
	
	self.session.pdth_style_fwb = {
        title_id = "ch_pdth_style_fwb",
        description_id = "ch_pdth_style_fwb_desc",
        difficulty = overkill_and_above,
        level_id = {
            "red2"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_heat = {
        title_id = "ch_pdth_style_heat",
        description_id = "ch_pdth_style_heat_desc",
        difficulty = overkill_and_above,
        level_id = {
            "run_res"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_panic = {
        title_id = "ch_pdth_style_panic",
        description_id = "ch_pdth_style_panic_desc",
        difficulty = overkill_and_above,
        level_id = {
            "flat"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_bridge = {
        title_id = "ch_pdth_style_bridge",
        description_id = "ch_pdth_style_bridge_desc",
        difficulty = overkill_and_above,
        level_id = {
            "glace"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_diamond = {
        title_id = "ch_pdth_style_diamond",
        description_id = "ch_pdth_style_diamond_desc",
        difficulty = overkill_and_above,
        level_id = {
            "dah"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_slaughterhouse = {
        title_id = "ch_pdth_style_slaughterhouse",
        description_id = "ch_pdth_style_slaughterhouse_desc",
        difficulty = overkill_and_above,
        level_id = {
            "dinner"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_counterfeit = {
        title_id = "ch_pdth_style_counterfeit",
        description_id = "ch_pdth_style_counterfeit_desc",
        difficulty = overkill_and_above,
        level_id = {
            "pal"
        },
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
		xp = huge_xp,
        cc = 6,
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_undercover = {
        title_id = "ch_pdth_style_undercover",
        description_id = "ch_pdth_style_undercover_desc",
        difficulty = overkill_and_above,
        level_id = {
            "man"
        },
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
		xp = huge_xp,
        cc = 6,
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	self.session.pdth_style_nomercy = {
        title_id = "ch_pdth_style_nomercy",
        description_id = "ch_pdth_style_nomercy_desc",
        difficulty = overkill_and_above,
        level_id = {
            "nmh_res"
        },
		xp = huge_xp,
        cc = 6,
		depends_on = {
			primaries = {"amcar","new_m14","ak74", "akm","r870","hk21", "gre_m79"},
			secondaries = {"b92fs","mac10", "glock_18c", "new_raging_bull", "colt_1911", "new_mp5","serbu"},
			melee_weapons = {"weapon"},
			armors = {"level_1", "level_2"}
		},
        session_stopped = {
            callback = "pdth_style_success"
        }
    }
	
    self.achievment = {}
    self.achievment.duck_hunting = {
		title_id = "ch_duck_hunting_hl",
		description_id = "ch_duck_hunting",
		flag_id = "duck_hunting",
		level_id = "glace",
		xp = small_xp,
		awards_achievment = "duck_hunting"
	}

    self.new_challenges = {}
    self.new_challenges.melee_test = {
        title_id = "ch_melee_test",
        description_id = "ch_melee_test_desc",
        xp = gigantic_xp,
        flag_id = "melee_test",
    }
    self.new_challenges.summers_test = {
        title_id = "ch_summers_test",
        description_id = "ch_summers_test_desc",
        xp = gigantic_xp,
        flag_id = "summers_test",
    }
	
	self.new_challenges.winters_test = {
        title_id = "ch_winters_test",
        description_id = "ch_winters_test_desc",
        xp = gigantic_xp,
        flag_id = "winters_test",
    }
	
	self.new_challenges.spring_test = {
        title_id = "ch_spring_test",
        description_id = "ch_spring_test_desc",
        xp = gigantic_xp,
        flag_id = "spring_test",
    }

	self.weapon = {}


    self:weapon_challenges()
end

function ChallengesTweakData:GetCategories()
    local categories = {}
    for id, weap in pairs(tweak_data.weapon) do
        local cat = tweak_data.gui.buy_weapon_category_aliases[weap.category] and tweak_data.gui.buy_weapon_category_aliases[weap.category] or weap.category

        if not table.contains(categories, cat) then
            table.insert(categories, cat)
        end
    end

    return categories
end

function ChallengesTweakData:weapon_challenges()
    local createVS = function(i, id, eneType, count, xp)
        local name = id .. "_vs_" .. eneType .. "_" .. i
        local challenges = { (i - 1) > 0 and id .. "_vs_" .. eneType .. "_" .. (i - 1) or nil }
        local depends_on = { challenges = challenges }
        self.weapon[ name ] = {
            title_id = "ch_vs",
            description_id = "ch_vs_desc",
            counter_id = id .. "_" .. eneType .. "_kill",
            unlock_level = 0,
            count = count,
            xp = xp,
            depends_on = depends_on,
            weapName = id,
            i = i,
            ene = eneType
        }
    end

    local createVSHS = function(i, id, eneType, count, xp)
        local name = id .. "_vs_head_shot_" .. eneType .. "_" .. i
        local challenges = { (i - 1) > 0 and id .. "_vs_head_shot_" .. eneType .. "_" .. (i - 1) or id .. "_vs_" .. eneType ..  "_3" or nil }
        local depends_on = { challenges = challenges }
        self.weapon[ name ] = {
            title_id = "ch_vs_head_shots",
            description_id = "ch_vs_head_shots_desc",
            counter_id = id .. "_" .. eneType .. "_head_shot",
            unlock_level = 0,
            count = count,
            xp = xp,
            depends_on = depends_on,
            weapName = id,
            i = i,
            ene = eneType
        }
    end

    local definition = {}
    definition.law = {}
	definition.law.vs = {
		{ count = 150, xp = tiny_xp },
		{ count = 300, xp = small_xp },
		{ count = 500, xp = mid_xp },
		{ count = 700, xp = large_xp },
		{ count = 900, xp = large_xp },
		{ count = 1100, xp = large_xp },
		{ count = 2100, xp = large_xp },
		{ count = 5100, xp = large_xp },
		{ count = 10100, xp = large_xp },
	}
	definition.law.head_shots = {
		{ count = 75, xp = small_xp },
		{ count = 200, xp = mid_xp },
		{ count = 350, xp = large_xp },
		{ count = 500, xp = large_xp },
		{ count = 1000, xp = large_xp },
		{ count = 5000, xp = large_xp },
	}

    for _, category in pairs(self:GetCategories()) do
        for ene, ch_groups in pairs(definition) do
            if ch_groups.vs then
                for i, def in pairs(ch_groups.vs) do
                    createVS(i, category, ene, def.count, def.xp)
                end
            end
            if ch_groups.head_shots then
                for i, def in pairs(ch_groups.head_shots) do
                    createVSHS(i, category, ene, def.count, def.xp)
                end
            end
        end
        if definition[category] then
            for ene, ch_groups in pairs(definition[category]) do
                if ch_groups.vs then
                    for i, def in pairs(ch_groups.vs) do
                        createVS(i, category, ene, def.count, def.xp)
                    end
                end
                if ch_groups.head_shots then
                    for i, def in pairs(ch_groups.head_shots) do
                        createVSHS(i, category, ene, def.count, def.xp)
                    end
                end
            end
        end
    end

    definition.law = {}
	definition.law.vs = {
		{ count = 50, xp = tiny_xp },
		{ count = 200, xp = small_xp },
		{ count = 400, xp = mid_xp },
		{ count = 600, xp = large_xp },
		{ count = 800, xp = large_xp },
		{ count = 1000, xp = large_xp },
	}
	definition.law.head_shots = {
		{ count = 75, xp = small_xp },
		{ count = 200, xp = mid_xp },
		{ count = 350, xp = large_xp },
		{ count = 500, xp = large_xp },
	}

    -- for id, weap in pairs(tweak_data.weapon) do
    --     if weap.category then
    --         for ene, ch_groups in pairs(definition) do
    --             if ch_groups.vs then
    --                 for i, def in pairs(ch_groups.vs) do
    --                     createVS(i, id, ene, def.count, def.xp)
    --                 end
    --             end
    --             if ch_groups.head_shots then
    --                 for i, def in pairs(ch_groups.head_shots) do
    --                     createVSHS(i, id, ene, def.count, def.xp)
    --                 end
    --             end
    --         end
    --         if definition[id] then
    --             for ene, ch_groups in pairs(definition[id]) do
    --                 if ch_groups.vs then
    --                     for i, def in pairs(ch_groups.vs) do
    --                         createVS(i, id, ene, def.count, def.xp)
    --                     end
    --                 end
    --                 if ch_groups.head_shots then
    --                     for i, def in pairs(ch_groups.head_shots) do
    --                         createVSHS(i, id, ene, def.count, def.xp)
    --                     end
    --                 end
    --             end
    --         end
    --     end
    -- end
end
