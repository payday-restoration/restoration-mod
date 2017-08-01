Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_suicidal_description"] =  "There's a crazy gang of Russian mercenaries who are out for blood, and not even the cops will touch them. But our business calls, and that business is picking up in this chaos.",
		["bm_menu_bain_sop"] =  "la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo ",
		["bm_menu_bain_akan"] =  "We are formless. We have no defined bodies or characteristics. We are the American way of life manifested as an influential power.",
		["bm_menu_bain_crazy"] =  "$preferredcharacter$ TURN OFF THE COMPUTER NOW",
		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%",
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",
		["menu_jowi"] = "Wick",
		["bm_wp_upg_a_slug_sc"] = "Slug",
		["bm_wp_upg_a_op_sc"] = "+P Rounds",
		["bm_sc_blank"] = "",
		["bm_wp_upg_a_slug_sc_desc"] = "Fires a single accurate shotgun slug.",
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Inspect Player",
		["menu_inspect_player_desc"] = "Inspect player's stats",
		["bm_wp_upg_vg_afg"] = "AFG",
		["bm_wp_upg_vg_stubby"] = "Stubby Vertical Grip",
		["bm_wp_upg_vg_tac"] = "TAC Vertical Grip",
		["bm_wp_upg_vintage_sc"] = "Vintage Mag",
		["bm_wp_upg_vintage_desc"] = "",
		["bm_sc_scorpion_double_mag"] = "",
		["bm_wp_scorpion_m_extended_sc"] = "Double Magazine",
		["bm_wp_upg_mil_sc"] = "Milspec Mag",
		["bm_wp_upg_tac_sc"] = "Tactical Mag",
		["bm_wp_upg_mil_desc"] = "",
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_ap_weapon_mod_sc_desc"] = "ADDS BODY ARMOR PENETRATION, SHIELD PENETRATION, AND WALL PENETRATION.",
		["bm_ap_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLs.",
		["bm_ap_2_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR.",
		["bm_ap_flamethrower_sc_desc"] = "BURNS THROUGH BODY ARMOR.",
		["bm_ap_saw_sc_desc"] = "",
		["bm_ap_saw_blade_sc_desc"] = "Adds the ability to cut through body armor.",
		["bm_fast_motor_sc_desc"] = "Increases Rotations Per Minute by 15%.",
		["menu_rifle"] = "RIFLES",
	--	["hud_instruct_mask_on"] = "[G] TO BECOME A SQUID NOW",
	--	["hud_casing_mode_ticker"] = "YOU ARE A KID NOW. BECOME A SQUID NOW TO START THE HEIST.",
	--	["hud_assault_end_line"] = "YOUREAKIDYOUREASQUIDYOUREAKIDYOUREASQUIDYOUREAKIDYOUREASQUID",
		["bm_wp_fla_mk2_mag_rare_sc"] = "Rare",
		["bm_wp_upg_a_custom_desc"] = "Bigger pellets that give more impact and increases damage.",
		["bm_wp_upg_a_piercing_desc"] = "Long range and tight pellet spread.",
		["menu_moving_target_sc"] = "Subtle",
		["bm_sc_silencers_med_desc"] = "SLOWS YOUR RATE OF FIRE BY 30%",
		["bm_sc_silencers_small_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%",
		["bm_sc_silencers_large_desc"] = "SLOWS YOUR RATE OF FIRE BY 45%",
		["bm_wp_upg_a_dragons_breath_desc_sc"] = "Fires pellets that go up in sparks and flames. Burns through body armor.",
		["menu_difficulty_suicidal"] = "Deathwish 145+",
		["bm_wp_upg_a_halfthatkit"] = "I'll Take Half That Kit",
		["bm_wp_upg_a_halfthatkit_desc"] = "REMOVES THE MOVEMENT SPEED PENALTY OF THE WEAPON",
		["loot_sc"] = "SC Mod",
		["loot_sc_desc"] = "THIS IS AN SC MOD ITEM!",
		["sc_menu"] = "SC's Mod",
		["sc_menu_desc"] = "Options for SC's mod.",
		["sc_deploy_title"] = "Deployable Changes",
		["sc_player_weapon_title"] = "Player Weapon Changes",
		["sc_ai_title"] = "SC's Mod Main Changes",
		["sc_classic_smoke_title"] = "Alternative Tear Gas Visuals",
		["sc_classic_smoke_desc"] = "Toggle the alternative Tear Gas visuals.",
		["sc_spawn_title"] = "Spawn Rate Changes",
		["sc_player_title"] = "Player/Skill changes",
		["sc_perk_title"] = "Perk Deck changes",
		["sc_sp_title"] = "Single Player changes",
		["sc_flash_title"] = "Flashbang Indicator",
		["sc_stealth_title"] = "Stealth Changes",
		["sc_deploy_desc"] = "Turn this off if you don't want deployable changes from SC's mod. This is useful if you're worried about the anti-cheat. (Requires restart)",
		["sc_player_weapon_desc"] = "Turn this off if you don't want player weapon changes from SC's mod, usually for when you want to use ANOTHER weapon overhaul. (Requires restart)",
		["sc_spawn_desc"] = "Turn this off if you don't want enemy spawn rate changes from SC's mod. (Requires restart)",
		["sc_sp_desc"] = "Turn this off if you don't want single player changes from SC's mod. (Requires restart)",
		["sc_ai_desc"] = "Toggle for SC's Mod Main changes. Useful for quickly toggling back to the vanilla game. Note: Having this on locks your online play to only other SC mod users. (Requires restart)",
		["sc_player_desc"] = "Turn this off if you don't want Player/Skill changes from SC's mod. (Requires restart)",
		["sc_perk_desc"] = "Turn this off if you don't want Perk Deck changes from SC's mod. (Requires restart)",
		["sc_flash_desc"] = "Turn this off if you don't want a flashbang HUD indicator... wait why wouldn't you? (Requires restart)",
		["sc_stealth_desc"] = "Turn this off if you don't want stealth changes from SC's mod.(Requires restart)",
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_sc_bipod_desc"] = "Deploy/Undeploy by pressing $BTN_BIPOD.",
		["bm_wp_upg_bonus_sc_none"] = "No Modifier",
		["bm_wskn_ak74_rodina_desc_sc"] = "A special-issue AK that - in war and crime - has demonstrated an unquenchable thirst for blood.",
		["bm_wskn_deagle_bling_desc_sc"] = "A hand-crafted Deagle built as testament to the finest gaming-trained crackshot in the world.",

		["bm_wp_upg_a_mag_msr"] = ".338 MAG rounds",
		["bm_wp_upg_a_mag_msr_desc"] = "",

		["bm_hint_titan_60"] = "The Titandozer leaves in 60 seconds!",
		["bm_hint_titan_10"] = "The Titandozer leaves in 10 seconds!",		
		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",

		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",
		["bm_menu_gadget_plural"] = "Gadgets",
		["menu_pistol_carbine"] = "Pistol Carbine",

		["bm_wp_upg_extra_mp_unlock"] = "MX4 Conversion Kit",
		["bm_wp_upg_extra_mp_unlock_desc"] = "Allows toggling fire modes and the installation of Cyclic mods at the cost of slightly more kick.",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "DEATH WISH. FOR YOU, ACTION IS THE JUICE.",
		["menu_risk_sm_wish"] = "ONE DOWN. NOW SHOW THEM THAT YOU CAN'T BE STOPPED.",

		--We assets now--
		["menu_asset_dinner_safe"] = "Safe",
		["menu_asset_bomb_inside_info"] = "Insider Info",
	})
end)

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Modifiers",
		--["menu_challenge_stat_boost"] = "Random Mod Kit",
		--["menu_challenge_monthly_reward"] = "Random Primary Weapon Mod Kit or Midas Touch Weapon Mod Kit.",
		["bm_menu_suppression"] = "Noise level",
		["steam_inventory_stat_boost"] = "Stat Modifier",
		--["dialog_new_tradable_item_bonus"] = "",
		--["steam_inventory_team_boost"] = "",
		--["steam_inventory_boost_xp_cash"] = "",
		["bm_wp_upg_a_slug_sc_fire"] = "Incendiary Slug",
		["bm_menu_sc_m4_desc"] = "Modern take on the M16 service rifle. Good rate of fire and decent damage, however plastic parts make for shoddy stability.",
		["bm_menu_sc_glock17_desc"] = "Easy to control recoil and reliable. The perfect sidearm to start a heisting career.",
		["bm_menu_sc_mp9_desc"] = "A firearm made popular by its insane rate of fire. With this you can invite everyone to a bullet party nearly instantly.",
		["bm_menu_sc_r870_desc"] = "",
		["bm_menu_sc_glock18c_desc"] = "",
		["bm_menu_sc_m16_desc"] = "Powerful, accurate, and with a crazy rate of fire. The drawback? The vintage 20 round magazines.",
		["bm_menu_sc_olympic_desc"] = "A grossly oversized pistol firing a rifle round in a fully automatic manner. This gun is an identity crisis that shoots bullets.",
		["bm_menu_sc_amcar_desc"] = "The most mass produced .223 rifle the world has ever seen. A great all-purpose rifle, just don't forget your cleaning kit.",
		["bm_menu_sc_ak74_desc"] = "This rifle will be a handy thing to have around when body armor starts getting popular in DC.",
		["bm_menu_sc_akm_desc"] = "",
		["bm_menu_sc_akm_gold_desc"] = "A blank slate.",
		["bm_menu_sc_m249_desc"] = "Firing 5.56 Surplus ammo at an extreme capacity! Reloading is a pain in the ass, but chances are that everybody will be dead before you even need to reload.",
		["bm_menu_sc_saiga_desc"] = "This high capacity, box magazine fed, fully automatic shotgun is perfect for those days you just don't feel like aiming.",
		["bm_menu_sc_spas12_desc"] = "Top of the line tactical shotgun. Perfect for clearing particularly busy rooms.",
		["bm_menu_sc_m45_desc"] = "Ergonomics was not the strong suit of this weapon's design, mind the heat coming off the barrel.",
		["bm_menu_sc_mp5_desc"] = "Made popular with the cops for one reason: It is very good at what it does.",
		["bm_menu_sc_asval_desc"] = "Tiny rifle bullets might do for your run of the mill gunfighter, but others might go for this gun. The ASVAL is both brutal and compact.",
		["bm_menu_sc_g36_desc"] = "Another top shelf contender for the 'best plastic rifle' award.",
		["bm_menu_sc_c96_desc"] = "The pistol that almost took over the world. Twice. This German artifact is sleek, accurate and unfortunately obsolete.",
		["bm_menu_sc_m79_desc"] = "This weapon will disperse the crowds with ease. Mind the range, however, these 'nades don't feature range safety.",
		["bm_menu_sc_mg42_desc"] = "Throw out your shoulder in style with this German made bullet hose. At 1200 RPM it's sure to clear a room fast, at least until you empty its vintage 50 round magazine.",
		["bm_wp_upg_a_slug_fire_desc"] = "Fires a single slug that goes up in sparks and flames. Burns through body armor, shields, and walls.",
		["bm_wp_upg_a_slug_fire_sc_desc"] = "Fires a single slug that goes up in sparks and flames.",
		["bm_wp_upg_a_46custom"] = ".460 Rowland",
		["bm_wp_upg_a_46custom_desc"] = "When .45acp isn't enough, reach for this custom 1911A1 chambered in the powerful .460 Rowland Magnum. Top shelf brutality.",
		["bm_wp_upg_a_762_sterling"] = "7.62mm Conversion Kit",
		["bm_wp_upg_a_762_sterling_desc"] =  "You asked me to cram 7.62 rounds into a 27-inch submachine gun, and I delivered. I don't know why, but I did. Say goodbye to your magazine size and recoil management and say hello to heavy-caliber lead projectile vomiting. I never asked for this, but you did, and I aim to please.",
		["bm_wp_upg_a_65grendel"] = "6.5mm Grendel",
		["bm_wp_upg_a_65grendel_desc"] = "Tiny rifle bullets might do for your run of the mill gunfighter, but others might go for this ammunition.",
		["bm_wp_upg_a_p"] = "+P Rounds",
		["bm_wp_upg_a_p_desc"] = "These rounds are designed to fire at a higher internal pressure than standard ammunition.",
		["bm_wp_upg_a_40sw"] = ".40S&W Conversion Kit",
		["bm_wp_upg_a_40sw_desc"] = "",
		--String override for the stungun--
		["bm_melee_taser_info"] = "Device that electrocutes and interrupts targets on touch when fully charged.",

		--Modifiers--
		["bm_menu_bonus_concealment_p1"] = "Small Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p1_mod"] = "Small Concealment Modifier",
		["bm_menu_bonus_concealment_p2"] = "Large Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p2_mod"] = "Large Concealment Modifier",
		["bm_menu_bonus_concealment_p3"] = "Massive Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p3_mod"] = "Massive Concealment Modifier",
		["bm_menu_bonus_spread_p1"] = "Small Accuracy bonus and Stability penalty",
		["bm_menu_bonus_spread_p1_mod"] = "Small Accuracy Modifier",
		["bm_menu_bonus_spread_n1"] = "Massive Stability bonus and Accuracy penalty",
		["bm_menu_bonus_spread_n1_mod"] = "Massive Stability Modifier",
		["bm_menu_bonus_recoil_p1"] = "Small Stability bonus and Accuracy penalty",
		["bm_menu_bonus_recoil_p1_mod"] = "Small Stability Modifier",
		["bm_menu_bonus_recoil_p2"] = "Large Stability bonus and Accuracy penalty",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+10% Experience reward for you and your crew, -10% Money reward for you and your crew.",	
		["bm_menu_spread"] = "Accuracy\n",
		["bm_menu_recoil"] = "Stability\n",	
		["bm_menu_concealment"] = "Concealment\n",
		["bm_menu_bonus_damage_p1_mod"] = "Small Damage Modifier",
		["bm_menu_bonus_damage_p2_mod"] = "Large Damage Modifier",
		["bm_menu_bonus_total_ammo_p1_mod"] = "Small Total Ammo Modifier",
		["bm_menu_bonus_total_ammo_p3_mod"] = "Massive Total Ammo Modifier",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Para Rifle",
		["bm_w_akmsu"] = "Krinkov Rifle",
		["bm_w_hajk"] = "CR 805B Rifle"
			
	})
end)

end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local r = LevelsTweakData.LevelType.Russia
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
	LocalizationManager:add_localized_strings({
		["hud_assault_assault"] = "Reaper Assault in Progress",
		["hud_assault_alpha"] = "REAPER ASSAULT"
	})
end)

end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		--Woo Hints--
		["loading_gameplay_101"] = "Flashbangs make an audible noise when deployed. They cannot be destroyed by gunfire or melee weapons, so it's best to simply look away.",
		["loading_gameplay_118"] = "Cable Ties are a finite resource, make the most of them.",
		["loading_gameplay_12"] = "Know your enemy. Cloakers have distinct green, glowing night vision goggles on, and are completely silent. Check your corners and maintain vigilance!",

		["skill_uppers_revive"] = "Downs restored!",
		["hud_ai_traded_in"] = "",
		["skill_stockholm_syndrome_trade"] = "Down Restored!",
		["hint_short_max_pagers"] = "Max number of pagers scales with difficulty. Be aware of the Pager operator's response.",

		--Nuking infamy shit because it's gay--
		["menu_infamy_desc_ghost"] = "Modern assassin that carries out death sentences - for the right price.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_enforcer"] = "Used in crimes that requires the Enforcer to get his hands dirty.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_technician"] = "Cold, calculating and a master of forced disappearances, dead or alive.\n\nBONUSES:\nExperience gained is increased by ##5%##.",
		["menu_infamy_desc_mastermind"] = "Known to cause moral chaos and sway even the most devoted lawman.\n\nBONUSES:\nExperience gained is increased by ##5%##.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "Assault",
		["st_menu_enforcer_armor"] = "Juggernaut",
		["st_menu_enforcer_ammo"] = "Support",
		["st_menu_technician_auto"] = "Combat Engineer",
		["st_menu_technician_sentry"] = "Fortress",
		["hud_instruct_mask_on"] = "Press $BTN_USE_ITEM To put on Mask",

		--Gensec replacer instead of heavies
		["menu_cs_modifier_heavies"] = "FBI SWATs with rifles are replaced with Gensec Elites.",

		["bm_menu_skill"] = "Crew Perks",

		["menu_crew_interact"] = "Fast Recovery",
		["menu_crew_interact_desc"] = "Bots equipped with this ability recover health 20% faster.",

		["menu_crew_inspire"] = "Inspiring Presence",
		["menu_crew_inspire_desc"] = "Bots equipped with this ability can now use the Inspire aced ability.\n\nThey cannot do this more than once every 30 seconds.",

		["menu_crew_scavenge"] = "Mag Plus",
		["menu_crew_scavenge_desc"] = "Bots equipped with this ability gain 50% larger magazines.",

		["menu_crew_ai_ap_ammo"] = "Specialized Killing",
		["menu_crew_ai_ap_ammo_desc"] = "Bots equipped with this ability deal 20% extra damage against special units.",

		["menu_crew_healthy"] = "The Muscle",
		["menu_crew_healthy_desc"] = "Bots equipped with this perk gain 50% increased health.",

		["menu_crew_sturdy"] = "Sturdy Recovery",
		["menu_crew_sturdy_desc"] = "Bots equipped with this perk recover health 20% faster.",

		["menu_crew_evasive"] = "Evasive",
		["menu_crew_evasive_desc"] = "Bots equipped with this perk gain 20% dodge chance.",

		["menu_crew_motivated"] = "Motivated",
		["menu_crew_evasive_desc"] = "Bots equipped with this perk gain 50% increased movement speed.",

		["menu_crew_regen"] = "Regeneration",
		["menu_crew_regen_desc"] = "Bots equipped with this perk gain health 50 health returned on damage dealt every 3 seconds.",

		["menu_crew_quiet"] = "The Mole",
		["menu_crew_quiet_desc"] = "Bots equipped with this perk gain 25% damage resistance when surrounded by 3 or more enemies within 18 meters.",

		["menu_crew_generous"] = "Mayhem Maker",
		["menu_crew_generous_desc"] = "Bots equipped with this perk gain 15% damage resistance when surrounded by 3 or more enemies within 18 meters.\n\nEnemies this bot kills in close quarters have a 50% chance to spread panic among enemies.\n\nThis cannot occur more than once every 2 seconds.",

		["menu_crew_eager"] = "Wolverine",
		["menu_crew_eager_desc"] = "Bots equipped with this perk gain increased movement speed and health regeneration as their health decreases.",

--[[   SKILLTREES   ]]--
	--{
	
		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "Combat Medic",
			["menu_combat_medic_beta_desc_sc"] = "BASIC: ##$basic##\nAfter you have revived a crew member, you receive a ##25%## damage bonus for ##10## seconds.\n\nACE: ##$pro##\nReviving a crew member gives them ##30%## more health.",
			
			--Quick Fix
			["menu_tea_time_beta_sc"] = "Quick Fix",
			["menu_tea_time_beta_desc_sc"] = "BASIC: ##$basic##\nDecreases your First Aid Kit and Doctor Bag deploy time by ##50%.##\n\nACE: ##$pro##\nCrew members that use your First Aid Kits or Doctor Bags take ##15%## less damage for ##20## seconds.",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "Painkillers",
			["menu_fast_learner_beta_desc_sc"] = "BASIC: ##$basic##\nCrew members you revive take ##25%## less damage for ##5## seconds.\n\nACE: ##$pro##\nThe damage reduction is increased by an additional ##25%.##",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "Uppers",
			["menu_tea_cookies_beta_desc_sc"] = "BASIC: ##$basic##\nAdds ##4## more First Aid Kits to your inventory.\n\nACE: ##$pro##\nAdds ##6## more First Aid Kits to your inventory.\n\nFirst Aid Kits now restore ##1## down on use.",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "Combat Doctor",
			["menu_medic_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYour doctor bags have ##2## more charges.\n\nACE: ##$pro##\nYou can now deploy ##2## Doctor Bags instead of just one.",																								

			--Inspire
			["menu_inspire_beta_sc"] = "Inspire",
			["menu_inspire_beta_desc_sc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster. Shouting at your teammates will increase their movement speed by ##20%## for ##10## seconds.\n\nACE: ##$pro##\nThere is a ##100%## chance that you can revive crew members at a distance by shouting at them. This cannot occur more than once every ##30## seconds.",																								


			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
	
			--Cable Guy
			["menu_triathlete_beta_sc"] = "Cable Guy",
			["menu_triathlete_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases your supply of cable ties by ##4.##\n\nYou can cable tie hostages ##75%## faster.\n\nACE: ##$pro##\nIncreases your stamina by ##150%## and your crew's stamina by ##50%.##",																								

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "Clowns are Scary",
			["menu_cable_guy_beta_desc_sc"] = "BASIC: ##$basic##\nThe power and range of your intimidation is increased by ##50%.##\n\nACE: ##$pro##\nYou can now have ##2## converted enemies at the same time.",																								

			--Joker
			["menu_joker_beta_sc"] = "Joker",
			["menu_joker_beta_desc_sc"] = "BASIC: ##$basic##\nYou can convert a non-special enemy to fight on your side. This can not be done during stealth and enemies must surrender before you can convert them. You can only convert one enemy at a time.\n\nACE: ##$pro##\nConverted enemies gain ##55%## more health and deal ##45%## more damage. The time to convert an enemy is reduced by ##65%.##",																								

			--Stockholm Syndrome	
			["menu_stockholm_syndrome_beta_sc"] = "Stockholm Syndrome",	
			["menu_stockholm_syndrome_beta_desc_sc"] = "BASIC: ##$basic##\nCivilians are intimidated by the noise you make and remain intimidated ##50%## longer.\n\nACE: ##$pro##\nYour hostages will not flee when they have been rescued by law enforcers.\n\nNearby civilians and jokers have a chance of reviving you if you interact with them, and have a chance of giving you ammo.",

			--Partners in Crime	
			["menu_control_freak_beta_sc"] = "Partners in Crime",	
			["menu_control_freak_beta_desc_sc"] = "BASIC: ##$basic##\nHaving a converted enemy increases your movement speed by ##10%.##\n\nACE: ##$pro##\nHaving a converted enemy increases your health by ##30%.##\n\nYour converted enemy takes ##45%## less damage.",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "Hostage Taker",	
			["menu_black_marketeer_beta_desc_sc"] = "BASIC: ##$basic##\nHaving at least one hostage or converted law enforcer makes you regenerate ##2.5%## health every ##5## seconds.\n\nACE: ##$pro##\nHaving at least one hostage or converted law enforcer makes you regenerate ##5%## health every ##5## seconds.",
		

			--}
			
			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "Leadership",	
			["menu_stable_shot_beta_desc_sc"] = "BASIC: ##$basic##\nYour stability rating for all SMGs and LMGs is increased by ##4.##\n\nACE: ##$pro##\nYou and your crew's stability rating for all weapons is increased by ##4.##",

			--MG Handling
			["menu_scavenger_sc"] = "MG Handling",	
			["menu_scavenger_desc_sc"] = "BASIC: ##$basic##\nTightens the hipfire accuracy of SMGs and LMGs by ##50%##\n\nACE: ##$pro##\nYou reload SMGs and LMGs ##25%## faster.",

			--MG Specialist
			["menu_sharpshooter_sc"] = "MG Specialist",	
			["menu_sharpshooter_desc_sc"] = "BASIC: ##$basic##\nIncreases the rate of fire of SMGs and LMGs by ##20%.##\n\nACE: ##$pro##\nYour SMGs and LMGs do ##15%## more damage.",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "Shock and Awe",
			["menu_spotter_teamwork_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapons' magazine sizes are increased by ##30%.##\n\nACE: ##$pro##\nYou can now hip-fire with your weapons while sprinting.\n\nYour weapons' magazine sizes are increased by an additional ##20%.##",

			--Heavy Impact
			["menu_speedy_reload_sc"] = "Heavy Impact",
			["menu_speedy_reload_desc_sc"] = "BASIC: ##$basic##\nSubmachine Guns, Light Machineguns or Rifles set on automatic fire mode have a ##10%## chance to knock down enemies.\n\nACE: ##$pro##\nYour shots now have a ##25%## chance to knock down enemies.\n\nNote: Stagger effects do not apply to Captains, Veteran Cops, Bulldozers, and Shields.",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "Body Expertise",
			["menu_body_expertise_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability to ##pierce body armor.##\n\n##30%## of the enemy's headshot multiplier is applied to the enemy's body.\n\nNote: This skill is only activated by Submachine Guns, Light Machineguns or Rifles fired in automatic mode and does not apply to Bulldozers.\n\nACE: ##$pro##\n##90%## of the enemy's headshot multiplier is applied to the enemy's body.",

			--}
		--}
		
		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{

			--Underdog--
			["menu_underdog_beta_sc"] = "Underdog",
			["menu_underdog_beta_desc_sc"] = "BASIC: ##$basic##\nWhen three or more enemies are within ##18## meters of you, you receive a ##10%## damage bonus that lasts for ##7## seconds.\n\nACE: ##$pro##\nWhen three or more enemies are within ##18## meters of you, you also receive a ##10%## damage reduction that lasts for ##7## seconds.",																								

			--Shotgun CQB	
			["menu_shotgun_cqb_beta_sc"] = "Shotgun CQB",
			["menu_shotgun_cqb_beta_desc_sc"] = "BASIC: ##$basic##\nYou ADS ##50%## faster when using shotguns.\n\nACE: ##$pro##\nYou reload Shotguns ##25%## faster.",																								

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "Shotgun Impact",
			["menu_shotgun_impact_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapon stability with all shotguns is increased by ##4.##\n\nACE: ##$pro##\nYou deal ##15%## more damage with shotguns.",																																																																																																																																																																																																

			--Pigeon Shooting	
			["menu_far_away_beta_sc"] = "Pigeon Shooter",
			["menu_far_away_beta_desc_sc"] = "BASIC: ##$basic##\nYour shotgun's accuracy increased by ##40%## when aiming down your sights.\n\nACE: ##$pro##\nYour shotgun's range increased by ##50%## when aiming down your sights.",																																																																																																																																																																																																

			--Gung Ho
			["menu_close_by_beta_sc"] = "Gung-Ho",
			["menu_close_by_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now hip-fire with shotguns while sprinting.\n\nACE: ##$pro##\nYour rate of fire is increased by ##35%## while hip-firing with shotguns.",

			--Overkill
			["menu_overkill_sc"] = "OVERKILL",
			["menu_overkill_desc_sc"] = "BASIC: ##$basic##\nWhen you kill an enemy using a shotgun or the OVE9000 portable saw, you receive a ##75%## damage boost for ##2## seconds.\n\nNote: Does not apply to grenade launchers.\n\nACE: ##$pro##\nThe damage bonus now applies to all weapons and lasts ##10## seconds. Skill must still be activated using a shotgun or the OVE9000 portable saw.\n\nDecreases the time it takes to pull and put away shotguns and the saw by ##80%##.",

			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "Stun Resistance",
			["menu_oppressor_beta_desc_sc"] = "BASIC: ##$basic##\nYour steadiness is increased by ##10.##\n\nACE: ##$pro##\nReduces the visual effect duration of Flashbangs by ##50%.##",

			--Die Hard
			["menu_show_of_force_sc"] = "Die Hard",
			["menu_show_of_force_desc_sc"] = "BASIC: ##$basic##\nYour armor recovers ##15%## faster.\n\nACE: ##$pro##\nYou can use your primary weapon in bleedout.",																																																																																																																																																																																																
			
			--Transporter
			["menu_pack_mule_beta_sc"] = "Transporter",
			["menu_transporter_beta_desc_sc"] = "BASIC: ##$basic##\nYou can throw bags ##50%## further.\n\nACE: ##$pro##\nYou can now sprint with any bag.\n\nNote: The movment penalty incited by the bag still applies.",																																																																																																																																																																																																

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "More Blood to Bleed",
			["menu_iron_man_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##25%## extra health.\n\nACE: ##$pro##\nYou gain an additional ##25%## extra health.",																								

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "Bullseye",
			["menu_prison_wife_beta_desc_sc"] = "BASIC: ##$basic##\nYou regenerate ##5## armor for each successful headshot. This effect cannot occur more than once every ##2## seconds.\n\nACE: ##$pro##\nYou regenerate an additional ##20## armor for each successful headshot.",																								

			--Iron Man
			["menu_juggernaut_beta_sc"] = "Iron Man",
			["menu_juggernaut_beta_desc_sc"] = "BASIC: ##$basic##\nUnlocks the ability to wear the Improved Combined Tactical Vest.\n\nACE: ##$pro##\nWhen you melee Shield enemies, they get knocked back by the sheer force.\n\nEnables your ranged weapons to have a chance to knock back Shield enemies when attacking them. Knock back chance is increased the higher the total damage of the weapon is.\n\nNote: Captains can only be stunned by melee attacks.",																																																																																																																																																																																																
		

			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
			
			--Scavenger
			["menu_scavenging_sc"] = "Scavenger",
			["menu_scavenging_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##50%## increased ammo box pick up range.\n\nACE: ##$pro##\nEvery ##10th## enemy you kill will drop an extra ammo box.",																																																																																																																																																																																																

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "Bulletstorm",
			["menu_ammo_reservoir_beta_desc_sc"] = "BASIC: ##$basic##\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##5## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.\n\nACE: ##$pro##\nIncreases the base duration of the effect by up to ##15## seconds.",																								

			--Rip and Tear
			["menu_portable_saw_beta_sc"] = "Rip and Tear",
			["menu_portable_saw_beta_desc_sc"] = "BASIC: ##$basic##\nYou reload Saws ##25%## faster.\n\nACE: ##$pro##\nYou deal ##15%## more damage with the Saw.",																																																																																																																																																																																																

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "Extra Lead",
			["menu_ammo_2x_beta_desc_sc"] = "BASIC: ##$basic##\nEach ammo bag contains additional ##200%## ammunition.\n\nACE: ##$pro##\nYou can now place ##2## ammo bags instead of just one.",																								

			--Carbon Blade
			["menu_carbon_blade_beta_sc"] = "Carbon Blades",
			["menu_carbon_blade_beta_desc_sc"] = "BASIC: ##$basic##\nReduces the wear down of the blades on enemies by ##50%.##\n\nACE: ##$pro##\nYou can now saw through shield enemies with your OVE9000 portable saw.\n\nWhen killing an enemy with the saw, you have a ##50%## chance to cause nearby enemies in a ##10## meter radius to panic. Panic will make enemies go into short bursts of uncontrollable fear.",																								

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "Fully Loaded",
			["menu_bandoliers_desc_sc"] = "BASIC: ##$basic##\nYour total ammo capacity is increased by ##25%##.\n\nACE: ##$pro##\nIncreases your ammo pickup to ##175%## of the normal rate.\n\nYou gain a ##2%## chance to get a throwable from an ammo box.",
									
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
	
			--Defense Up
			["menu_defense_up_beta_sc"] = "Third Law",
			["menu_defense_up_beta_desc_sc"] = "BASIC: ##$basic##\nYour sentry guns cost ##25%## less ammunition to deploy.\n\nACE: ##$pro##\nYour sentry guns gain a protective shield.",

			--Sentry Targeting Package
			["menu_sentry_targeting_package_beta_sc"] = "Sentry Targeting Package",
			["menu_sentry_targeting_package_beta_desc_sc"] = "BASIC: ##$basic##\nYour sentry guns have ##50%## less spread.\n\nACE: ##$pro##\nYour sentry guns rotation speed is increased by ##150%.## Your sentry guns also have ##50%## more ammunition.",

			--Eco Sentry
			["menu_eco_sentry_beta_sc"] = "Eco Sentry",
			["menu_eco_sentry_beta_desc_sc"] = "BASIC: ##$basic##\nYour sentry guns cost an additional ##25%## less ammunition to deploy.\n\nACE: ##$pro##\nYour sentry guns gain ##150%## increased health.",

			--Engineering
			["menu_engineering_beta_sc"] = "Engineering",
			["menu_engineering_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now select a less noisy version of the sentry guns, making them much less likely to be targeted by enemies.\n\nACE: ##$pro##\nYou can now toggle AP rounds on your sentry guns, lowering the rate of fire by ##75%##, but increasing damage by ##250%## and allowing it to pierce through enemies and shields.",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "Jack of All Trades",
			["menu_jack_of_all_trades_beta_desc_sc"] = "BASIC: ##$basic##\nYou deploy and interact with all deployables ##50%## faster.\n\nACE: ##$pro##\nYou can now equip a second deployable to bring with you. Pressing the ##$BTN_CHANGE_EQ## key will allow you to toggle between deployable.\n\nThe second deployable has ##50%## less uses than normal.",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "Tower Defense",	
			["menu_tower_defense_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now carry a maximum of ##2## sentry guns.\n\nACE: ##$pro##\nYou can now carry a maximum of ##3## sentry guns.",																								
			
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "Hardware Expert",
			["menu_hardware_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou fix drills and saws ##50%## faster.\n\nACE: ##$pro##\nYour drills are now silent, civilians and guards have to see the drills in order to get alerted.",																								

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "Danger Close",
			["menu_combat_engineering_desc_sc"] = "BASIC: ##$basic##\nThe radius of trip mine explosion is increased by ##30%.##\n\nACE: ##$pro##\nYour trip mine deals ##50%## more damage.",																								

			--More Firepower--
			["menu_more_fire_power_sc"] = "Demoman",
			["menu_more_fire_power_desc_sc"] = "BASIC: ##$basic##\nYou can now carry ##4## shaped charges and ##6## trip mines.\n\nACE: ##$pro##\nYou can now carry ##6## shaped charges and ##10## trip mines.",																								


			--Kickstarter
			["menu_kick_starter_beta_desc_sc"] = "BASIC: ##$basic##\nYour drills and saws gain a ##30%## chance to automatically restart after breaking.\n\nACE: ##$pro##\nYou gain the ability to restart a drill by hitting it with a melee attack. You get ##1## chance for each time it breaks with a ##50%## success rate.",


			--}
			
			--[[  BATTLE SAPPER  SUBTREE   ]]--
			--{
			
			
			--}
		--}
		
		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{


			--}
			
			--[[   COMMANDO SUBTREE   ]]--
			--{


			
			--}
			
			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind
			["menu_scavenger_beta_sc"] = "Second Wind",
			["menu_scavenger_beta_desc_sc"] = "BASIC: ##$basic##\nWhen your armor breaks you gain ##15%## speed for ##5## seconds.\n\nACE: ##$pro##\nWhen your armor breaks you gain ##30%## speed for ##8## seconds.",



			--}
		--}
		
		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{

		

			--}
			
			--[[   RELENTLESS SUBTREE   ]]--
			--{

			--Swan Song
			["menu_perseverance_desc_sc"] = "BASIC: ##$basic##\nWhen your health reaches ##0##, instead of instantly going down, you can fight for ##5## seconds with a ##60%## movement speed penalty.\n\nACE: ##$pro##\nYou can fight for an additional ##5## seconds.",



			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "Deep Pockets",
		["menu_thick_skin_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases the concealment of melee weapons by ##2.##\n\nACE: ##$pro##\n\Increases the armor of all ballistic vests by ##20.##\n\nIncreases the concealment of all ballistic vests by ##4.##",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "Duck and Cover",
		["menu_sprinter_beta_desc_sc"] = "BASIC: ##$basic##\nYour stamina starts regenerating ##25%## earlier and ##25%## faster.\n\nACE: ##$pro##\nYou have a ##10%## increased chance to dodge while sprinting.\n\nYou gain ##15%## chance to dodge while ziplining.",																								

		["menu_tower_defense_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now carry a maximum of ##2## sentry guns.\n\nACE: ##$pro##\nYou can now carry a maximum of ##3## sentry guns.",																								

		--Sharpshooter--
		["menu_discipline_sc"] = "Sharpshooter",
		["menu_discipline_desc_sc"] = "BASIC: ##$basic##\nYour weapon accuracy is increased with weapons set to semi-auto by ##5.##\n\nACE: ##$pro##\nYour weapon stability is increased with all rifles by ##4.##",

		--Kilmer--	
		["menu_heavy_impact_beta_sc"] = "Kilmer",
		["menu_heavy_impact_beta_desc_sc"] = "BASIC: ##$basic##\nYour ADS speed with rifles is ##50%## faster.\n\nACE: ##$pro##\nYou reload rifles ##25%## faster.",

		--Spotter--	
		["menu_fast_fire_beta_sc"] = "Spotter",
		["menu_fast_fire_beta_desc_sc"] = "BASIC: ##$basic##\nSpecial enemies marked by you take ##15%## more damage.\n\nACE: ##$pro##\nEnemies you mark take an additional ##25%## damage when further away than ##25## meters.",																																																																																																																																																																																																																									

		--Nerves of Steel--
		["menu_kilmer_sc"] = "Nerves of Steel",
		["menu_kilmer_desc_sc"] = "BASIC: ##$basic##\nYou take ##50%## less damage while interacting with objects.\n\nYou can now use steel sight while in bleedout.\n\nACE: ##$pro##\nYou can now reload your weapons while sprinting.\n\nYour weapon accuracy while moving with Assault Rifles and Sniper Rifles is increased by ##50%##",																																																																																																																																																																																																																									

		--Ammo Efficiency--
		["menu_single_shot_ammo_return_sc"] = "Ammo Efficiency",
		["menu_single_shot_ammo_return_desc_sc"] = "BASIC: ##$basic##\nGetting ##3## killing headshots in less than ##6## seconds will refund ##1## ammo pickup to your used weapon. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot mode.\n\nACE: ##$pro##\nGetting ##3## headshots in a row will refund ##1## ammo pickup for your used weapon. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot mode.",																																																																																																																																																																																																																									

		--Bulletproof--
		["menu_iron_man_sc"] = "Bulletproof",
		["menu_iron_man_desc_sc"] = "BASIC: ##$basic##\nYou gain ##35%## more armor.\n\nACE: ##$pro##\nYou gain ##15%## more armor.\n\nYour armor recovery rate is increased by ##20%.##",																																																																																																																																																																																																																									

		--Chameleon--
		["menu_jail_workout_sc"] = "Chameleon",
		["menu_jail_workout_desc_sc"] = "BASIC: ##$basic##\nIncreases the time until you start getting detected while in casing mode by ##25%.##\n\nYou can mark enemies and cameras while in casing mode.\n\nACE: ##$pro##\nYou can pick up items while in casing mode.\n\nYou gain ##30%## more value to items and cash that you pick up.",	

		--Cleaner--
		["menu_cleaner_beta_sc"] = "Cleaner",
		["menu_cleaner_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## additional body bag in your inventory.\n\nYour body bag inventory space is increased to ##3## from ##2.##\n\nACE: ##$pro##\nYou gain the ability to place ##2## body bag cases and you ##no longer have cleaner costs## when killing a civilian.\n\nYou deal ##5%## more damage against special enemies.",	
																																																																																																																																																																																																																								
		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "Sixth Sense",
		["menu_chameleon_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability to automatically mark enemies within a ##10## meter radius around you after standing still for ##3.5## seconds.\n\nACE: ##$pro##\nYou ##gain access to all insider assets.##",	

		--Nimble--
		["menu_second_chances_beta_sc"] = "Nimble",
		["menu_second_chances_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability disable ##1## camera from detecting you and your crew. Effect lasts for ##25## seconds.\n\nACE: ##$pro##\nYou lockpick ##75%## faster and now you can ##lockpick safes.##\n\nThe duration of marked enemies is increased by ##100%## and you can now mark specials by aiming at them with any weapon.",	

		--ECM Specialist--
		["menu_ecm_2x_beta_sc"] = "ECM Specialist",
		["menu_ecm_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now place ##2## ECM jammers instead of just one.\n\nACE: ##$pro##\nThe ECM jammer duration is increased by an additional ##25%## and the ECM feedback duration lasts ##25%## longer.\n\nPagers are delayed by the ECM jammer.",	
																																																																																																																																																																																																																																															
		--Evasion--
		["menu_awareness_beta_sc"] = "Evasion",
		["menu_awareness_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##10%## additional movement speed and ##20%## ladder climbing speed. \n\nACE: ##$pro##\nYour movement speed is ##unhindered while using steel sight.##\n\nYour fall damage is reduced by ##75%## and you only take armor damage from falling from non fatal heights.",																								

		--Moving Target--
		["menu_dire_need_beta_sc"] = "Moving Target",
		["menu_dire_need_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1%## extra movement speed for every ##3## points of concealment under ##35##, up to ##10%.##\n\nACE: ##$pro##\nYou gain ##1%## extra movement speed for every ##1## point of concealment under ##35##, up to ##10%.##",																								

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "Optical Illusions",
		["menu_optic_illusions_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## concealment for each suppressed weapon you equip.\n\nACE: ##$pro##\nReduces the concealment penalty of suppressors by ##2.##",																								

		--The Professional--
		["menu_silence_expert_beta_sc"] = "The Professional",
		["menu_silence_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##4## weapon stability with silenced weapons.\n\nACE: ##$pro##\nYou gain ##5## weapon accuracy and ##50%## snap to zoom speed increase with silenced weapons.",																								

		--Dire Need--
		["menu_backstab_beta_sc"] = "Dire Need",
		["menu_backstab_beta_desc_sc"] = "BASIC: ##$basic##\nWhen your armor is fully depleted, the first shot on every enemy will cause that enemy to stagger.\n\nThis effect ends when your armor regenerates.\n\nACE: ##$pro##\nThe effect persists for ##5## seconds after your armor has regenerated. ",																								

		--Subsonic rounds--
		["menu_hitman_beta_sc"] = "Subsonic Rounds",
		["menu_hitman_beta_desc_sc"] = "BASIC: ##$basic##\nYou deal ##7.5%## more damage with all suppressed weapons.\n\nACE: ##$pro##\nYou deal an additional ##7.5%## more damage with all suppressed weapons.",																								

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "Low Blow",
		["menu_unseen_strike_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##3%## critical hit chance for every ##3## points of concealment under ##35## up to a maximum of ##30%.##\n\nCritical hits have a damage multiplier of ##2##.\n\nACE: ##$pro##\nYou gain a ##3%## critical hit chance for every ##1## point of concealment under ##35## up to a maximum of ##30%.##",																								

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "Equilibrium",
		["menu_equilibrium_beta_desc_sc"] = "BASIC: ##$basic##\nDecreases the time it takes to draw and holster pistols by ##80%.##\n\nACE: ##$pro##\nYou and your crew's weapon stability with pistols is increased by ##4.##",																								

		--Gun Nut--
		["menu_dance_instructor_sc"] = "Gun Nut",
		["menu_dance_instructor_desc_sc"] = "BASIC: ##$basic##\nYou gain ##5## weapon accuracy with pistols.\n\nACE: ##$pro##\nYou gain a ##50%## increased rate of fire with pistols.",																								

		--Over Pressurized--
		["menu_gun_fighter_sc"] = "Over Pressurized",
		["menu_gun_fighter_desc_sc"] = "BASIC: ##$basic##\nYou reload pistols ##50%## faster.\n\nACE: ##$pro##\nYou deal ##15%## more damage with pistols.",																								

		--Akimbo--
		["menu_akimbo_skill_sc"] = "Akimbo",
		["menu_akimbo_skill_desc_sc"] = "BASIC: ##$basic##\nYour akimbo weapons' stability penalty is set to ##25%.##\n\nACE: ##$pro##\nYou no longer have a stability penalty with akimbo weapons and you also carry ##50%## more total ammo for them.",																																																																																																																																																																																																																																		

		--Desperado--
		["menu_expert_handling_sc"] = "Desperado",
		["menu_expert_handling_desc_sc"] = "BASIC: ##$basic##\nEach successful pistol hit gives you a ##10%## increased accuracy bonus for ##10## seconds and can stack ##4## times.\n\nACE: ##$pro##\nIncreases the accuracy boost duration to ##20## seconds.",																																																																																																																																																																																																																																		

		--Running From Death--
		["menu_nine_lives_beta_sc"] = "Running from Death",
		["menu_nine_lives_beta_desc_sc"] = "BASIC: ##$basic##\nYou move ##25%## faster for ##10## seconds after getting up.\n\nACE: ##$pro##\nYou reload and swap weapons ##25%## faster for ##10## seconds after getting up.",																																																																																																																																																																																																																																		

		--Nine Lives--
		["menu_running_from_death_beta_sc"] = "Nine Lives",
		["menu_running_from_death_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##100%## increase to bleedout health.\n\nACE: ##$pro##\nYou gain the ability to get downed ##1## more time before going into custody.",																																																																																																																																																																																																																																		

		--Undying--
		["menu_feign_death_sc"] = "Undying",
		["menu_feign_death_desc_sc"] = "BASIC: ##$basic##\nWhen you get downed, you have a ##25%## chance to instantly get revived.\n\nACE: ##$pro##\nThe chance to get revived is increased by an additional ##25%.##",																																																																																																																																																																																																																																		

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "Messiah",
		["menu_pistol_beta_messiah_desc_sc"] = "BASIC: ##$basic##\nWhile in bleedout, killing an enemy will allow you to revive yourself.\n\nYou only have ##1## charge which is replenished when leaving custody.\n\nACE: ##$pro##\nYou now have a total of ##3## charges which are replenished when leaving custody.",																																																																																																																																																																																																																																		

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "Martial Arts",
		["menu_martial_arts_beta_desc_sc"] = "BASIC: ##$basic##\nYou take ##50%## less damage from all melee attacks because of training.\n\nACE: ##$pro##\nYou are ##50%## more likely to knock down enemies with a melee strike because of training.",																																																																																																																																																																																																																																		

		--Bloodthirst--
		["menu_bloodthirst_sc"] = "Bloodthirst",
		["menu_bloodthirst_desc_sc"] = "BASIC: ##$basic##\nEvery kill you get will increase your next melee attack damage by ##25%##, up to a maximum of ##50%.##\n\nThis effect gets reset when striking an enemy with a melee attack.\n\nACE: ##$pro##\nWhenever you kill an enemy with a melee attack, you will gain a ##25%## increase in reload speed for ##10## seconds.",																																																																																																																																																																																																																																		

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "Pumping Iron",
		["menu_steroids_beta_desc_sc"] = "BASIC: ##$basic##\nYour melee attacks do ##25%## more damage.\n\nACE: ##$pro##\nYour melee attacks do an additional ##25%## more damage.",																																																																																																																																																																																																																																		

		--Frenzy--
		["menu_wolverine_beta_sc"] = "Frenzy",
		["menu_wolverine_beta_desc_sc"] = "BASIC: ##$basic##\nYou start with and cannot heal above ##20%## of your maximum health.\n\nYou take ##30%## less health damage and healing is reduced by ##75%.##\n\nACE: ##$pro##\nHealth damage taken is now reduced by ##50%## and healing is instead reduced by ##50%.##",																																																																																																																																																																																																																																		

		--Berserker--
		["menu_frenzy_sc"] = "Berserker",
		["menu_frenzy_desc_sc"] = "BASIC: ##$basic##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##25%##, you will do up to ##250%## more melee and saw damage.\n\nACE: ##$pro##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##25%##, you will do up to ##100%## more damage with firearms."																																																																																																																																																																																																																																	

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_deck6_1_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck6_3_desc_sc"] = "Your chance to dodge is increased by ##10%## for ballistic vests.",
		["menu_deck6_5_desc_sc"] = "Your chance to dodge is increased by ##10%## for ballistic vests.",
		["menu_deck6_7_desc_sc"] = "Your chance to dodge is increased by ##15%## for ballistic vests.",
		["menu_deck6_9_desc_sc"] = "Standing still and crouching increases your armor recovery rate by ##10%.##\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		["menu_deck4_1_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck4_3_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck4_5_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck4_7_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck5_1_desc_sc"] = "Your armor recovery rate is increased by ##10%##.",
		["menu_deck5_3_desc_sc"] = "Your akimbo weapons' stability penalty is set to ##25%.##",
		["menu_deck5_5_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.",
		["menu_deck5_7_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.",
		["menu_deck5_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.\n\n\You no longer have a stability penalty with Akimbo weapons.\n\n\Deck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%##.",
		["menu_deck2_1_desc_sc"] = "You gain ##10%## more health.",
		["menu_deck2_3_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_5_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_7_desc_sc"] = "You can now use light machine guns and submachine guns to spread panic among your enemies.\n\n\Panic will make enemies go into short bursts of uncontrollable fear.",
		["menu_deck2_9_desc_sc"] = "You gain an additional ##20%## more health.\n\n\You now ##always revive with maximum health##.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		["menu_deck1_3_desc_sc"] = "You and your crew's stamina is increased by ##50%##.\n\n\Increases your shout distance by ##25%##.\n\n\Note: Crew perks do not stack.",
		["menu_deck1_5_desc_sc"] = "You gain ##10%## more health.\n\nYour crew gains ##5%## more health.\n\n\Note: Crew perks do not stack.",
		["menu_deck1_7_desc_sc"] = "You gain ##15%## more armor.\n\nYour crew gains ##5%## more armor.\n\n\Note: Crew perks do not stack.",
		["menu_deck4_9_desc_sc"] = "The time between swapping weapons is reduced to for you by ##80%.##\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		["menu_deck1_9_desc_sc"] = "You and your crew gains ##5%## max health and ##10%## stamina for each hostage up to ##4## times.\n\n\Note: Crew perks do not stack.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "You gain an additional ##10%## more armor.",
		["menu_deck3_3_desc_sc"] = "You gain an additional ##10%## more armor.\n\n\Your armor is increased by ##10%## for ballistic vests.",
		["menu_deck3_5_desc_sc"] = "You gain an additional ##5%## more armor.\n\n\Your armor is increased by ##10%## for ballistic vests.",
		["menu_deck3_7_desc_sc"] = "Your armor recovery rate is increased by ##5%##.\n\n\Your armor is increased by ##20%## for ballistic vests.",
		["menu_deck3_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.\n\n\You are now ##immune to suppression.##\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Your chance to dodge is increased by ##10%##.",
		["menu_deck7_3_desc_sc"] = "Your chance to dodge is increased by ##5%##.\n\nYou bag corpses ##20%## faster.",
		["menu_deck7_5_desc_sc"] = "Your chance to dodge is increased by ##10%##.\n\nYou pick locks ##20%## faster.",
		["menu_deck7_7_desc_sc"] = "Your chance to dodge is increased by ##10%##.\n\nYou answer pagers ##10%## faster.",
		["menu_deck7_9_desc_sc"] = "Standing still and crouching increases your armor recovery rate by ##10%.##\n\nYou gain a ##10%## boost in your movement speed when crouching.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Ammo supplies you pick up also yield medical supplies and heals you for ##8## to ##12## health.\n\n\Cannot occur more than once every ##4## seconds.",
		["menu_deck10_7_desc_sc"] = "Increase health gained from ammo packs by an additional ##4##.",
		["menu_deck10_9_desc_sc"] = "Increase health gained from ammo packs by an additional ##4##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "When you are within medium range of an enemy, you receive ##10%## less damage from enemies.",
		["menu_deck8_3_desc_sc"] = "When you are within medium range of an enemy, you receive an additional ##5%## less damage from enemies.",
		["menu_deck8_5_desc_sc"] = "When you are within medium range of an enemy, you receive an additional ##5%## less damage from enemies.\n\nEach successful melee hit grants and additional ##10%## melee damage boost for ##7## seconds and can stack up to ##4## times.",
		["menu_deck8_7_desc_sc"] = "When you are surrounded by three enemies or more, you an additional ##5%## less damage from enemies.\n\nEach successful melee hit grants and additional ##10%## melee damage boost for ##7## seconds and can stack up to ##4## times.",
		["menu_deck8_9_desc_sc"] = "Striking an enemy with your melee weapon regenerates ##10%## of your health. This cannot occur more than once every ##10## seconds.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sociopath--
		["menu_deck9_3_desc_sc"] = "Killing an enemy regenerates ##25## armor.\n\nThis cannot occur more than once every ##2## seconds.",
		["menu_deck9_5_desc_sc"] = "Killing an enemy with a melee weapon regenerates ##10%## health.\n\nThis cannot occur more than once every ##2## seconds.",
		["menu_deck9_7_desc_sc"] = "Killing an enemy at medium range regenerates ##25## armor.\n\nThis cannot occur more than once every ##2## seconds.",
		["menu_deck9_9_desc_sc"] = "Killing an enemy at medium range has a ##25%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nThis cannot occur more than once every ##2## seconds.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Damaging an enemy heals ##1## life point every ##0.5## seconds for ##5## seconds.\n\n\This effect stacks but cannot occur more than once every ##1.5## seconds and only while wearing the ##Flak Jacket##.\n\n\You lose ##70## armor while wearing the Flak Jacket.",
		["menu_deck11_3_desc_sc"] = "Damaging an enemy now heals ##2## life points every ##0.5## seconds for ##5## seconds.\n\n\You gain ##20%## more health.",
		["menu_deck11_5_desc_sc"] = "Damaging an enemy now heals ##3## life points every ##0.5## seconds for ##5## seconds. ",
		["menu_deck11_7_desc_sc"] = "Damaging an enemy now heals ##4## life points every ##0.5## seconds for ##5## seconds.\n\n\You gain ##20%## more health.",
		["menu_deck11_9_desc_sc"] = "Damaging an enemy now heals ##4## life points every ##0.5## seconds for ##6## seconds.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Anarchist--
		["menu_deck15_3_desc_sc"] = "##50%## of your health is converted into ##50%## armor.",
		["menu_deck15_5_desc_sc"] = "##50%## of your health is converted into ##55%## armor.",
		["menu_deck15_7_desc_sc"] = "##50%## of your health is converted into ##60%## armor.",
		["menu_deck15_9_desc_sc"] = "Dealing damage will grant you ##10## armor - This can only occur once every ##2## seconds.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Unlocks and equips the Kingpin Injector. Changing to another perk deck will make the Injector unavailable again. The Injector replaces your current throwable, is equipped in your throwable slot and can be switched out if desired.\n\nWhile in game you can use the throwable key to activate the injector. Activating the injector will heal you with ##50%## of all damage taken for ##5## seconds.\n\nYou can still take damage during the effect. The Injector can only be used once every ##30## seconds.",
		["menu_deck17_3_desc_sc"] = "You gain ##5%## more armor.",
		["menu_deck17_5_desc_sc"] = "You gain ##5%## more armor.\n\nEnemies nearby will prefer targeting you, whenever possible, while the Injector is active.",
		["menu_deck17_7_desc_sc"] = "You gain ##5%## more armor.\n\nThe amount of health received during the Injector effect is increased by ##20%## while below ##25%## health.",
		["menu_deck17_9_desc_sc"] = "You gain ##10%## more health.\n\nFor every ##50## points of health gained during the injector effect while at maximum health, the recharge time of the injector is reduced by ##1## second.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "Your chance to dodge is increased by ##5%##.\n\nUnlocks and equips the throwable ##Smoke Bomb.##\n\nWhen deployed, the smoke bomb creates a smoke screen that lasts for ##12## seconds. While standing inside the smoke grenade, you and your allies automatically avoid ##10%## of all bullets. Any enemies that stand in the smoke will see their accuracy reduced by ##50%##.\n\nAfter the smoke dissipates, the Smoke Bomb is on a cooldown for ##30## seconds, but killing enemies will reduce this cooldown by ##1## second.",
		["menu_deck18_9_desc_sc"] = "Smoke Bomb effects are increased by ##50%## while you or your allies are standing in the smoke screen.\n\n\Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
	
	})
end)

end