Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_suicidal_description"] =  "There's a crazy gang of Russian mercenaries who are out for blood, and not even the cops will touch them. But our business calls, and that business is picking up in this chaos.",
		["bm_menu_bain_sop"] =  "la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo la li lu le lo ",
		["bm_menu_bain_akan"] =  "We are formless. We have no defined bodies or characteristics. We are the American way of life manifested as an influential power.",
		["bm_menu_bain_crazy"] =  "$preferredcharacter$ TURN OFF THE COMPUTER NOW",
		["bm_wp_r870_s_folding_ext"] = "Muldon Stock (Retracted)",	
		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%",
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",
		["bm_wp_upg_i_93r"] = "Bernetti 93t Kit",
		["bm_wp_upg_i_93r_desc"] = "Enables a 3 round burst firemode, at the cost of extra kick.",
		["menu_jowi"] = "Wick",
		["bm_wp_upg_a_slug_sc"] = "Slug",
		["bm_wp_upg_a_op_sc"] = "+P Rounds",
		["bm_sc_blank"] = "",
		["bm_wp_upg_a_slug_sc_desc"] = "Fires a single accurate shotgun slug.",
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Inspect Player",
		["menu_inspect_player_desc"] = "Inspect player's stats",
		["bm_wp_rpk_m_ban_sc"] = "Potassium Magazine",
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
		["bm_wp_mg42_b_mg34_desc_sc"] = "SLOWS YOUR RATE OF FIRE TO 800",
		["bm_ap_weapon_mod_sc_desc"] = "ADDS BODY ARMOR PENETRATION, SHIELD PENETRATION, AND WALL PENETRATION.",
		["bm_ap_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",
		["bm_heavy_ap_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",
		["bm_m203_weapon_sc_desc"] = "Press the [Bipod Key/Alt-Fire Key] to switch to the mounted Grenade Launcher.",
		["bm_40mm_weapon_sc_desc"] = "Press the [Gadget Key] to toggle Flip Up Sight.",
		["bm_ap_2_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, ARROWS CAN BE RESTORED BY PICKING THEM UP, AND RANGE INCREASES THE LONGER AN ARROW IS DRAWN.",
		["bm_ap_3_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR. ARROWS CAN BE RESTORED BY PICKING THEM UP.",
		["bm_ap_flamethrower_sc_desc"] = "BURNS THROUGH BODY ARMOR.",
		["bm_ap_saw_sc_desc"] = "",
		["bm_ap_saw_blade_sc_desc"] = "Adds the ability to cut through body armor.",
		["bm_wp_upg_a_explosive_desc_sc"] = "Fires one explosive charge that kills or stuns targets. Cannot headshot.",
		["bm_wp_ns_duck_desc_sc"] = "Causes pellets to spread horizontally.",
		["bm_wp_upg_o_leupold_desc_sc"] = "Automatically marks enemies while aiming.",
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Fires a round that causes a fire at point of impact. The fire deals damage over time and has a chance to interrupt enemies.",		
		["bm_fast_motor_sc_desc"] = "Increases Rotations Per Minute by 15%.",
		["menu_rifle"] = "RIFLES",
	--	["hud_instruct_mask_on"] = "[G] TO BECOME A SQUID NOW",
	--	["hud_casing_mode_ticker"] = "YOU ARE A KID NOW. BECOME A SQUID NOW TO START THE HEIST.",
	--	["hud_assault_end_line"] = "YOUREAKIDYOUREASQUIDYOUREAKIDYOUREASQUIDYOUREAKIDYOUREASQUID",
		["bm_wp_fla_mk2_mag_rare_sc"] = "Rare",
		["bm_wp_upg_a_custom_desc"] = "Fewer, bigger pellets that give more impact and increase damage.",
		["bm_wp_upg_a_piercing_desc"] = "Long range and tight pellet spread.",
		["menu_moving_target_sc"] = "Subtle",
		["bm_sc_silencers_med_desc"] = "SLOWS YOUR RATE OF FIRE BY 30%",
		["bm_sc_silencers_small_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%",
		["bm_wp_wpn_fps_upg_cbjms_ammo_cbj_desc"] = "Rechambers the CBJ-MS with 6.5x25mm CBJ ammunition, adding AP capability and increasing damage slightly. However, stability, total ammo, and concealment is reduced.",		
		["bm_sc_silencers_large_desc"] = "SLOWS YOUR RATE OF FIRE BY 45%",
		["bm_wp_upg_a_dragons_breath_desc_sc"] = "Fires pellets that go up in sparks and flames. The fire deals damage over time, has a chance to interrupt enemies, and burns through body armor.",
		["menu_difficulty_suicidal"] = "Deathwish 145+",
		["bm_wp_upg_a_halfthatkit"] = "I'll Take Double That Kit",
		["bm_wp_upg_a_halfthatkit_desc"] = "ADDS A 20% MOVEMENT SPEED PENALTY WHILE THE WEAPON IS EQUIPPED.",
		["loot_sc"] = "SC Mod",
		["loot_sc_desc"] = "THIS IS AN SC MOD ITEM!",
		["sc_menu"] = "SC's Mod",
		["sc_menu_desc"] = "Options for SC's mod.",
		["sc_deploy_title"] = "Deployable Changes",
		["sc_player_weapon_title"] = "Player Weapon Changes",
		["sc_ai_title"] = "SC's Mod Main Changes",
		["sc_classic_smoke_title"] = "Alternative Tear Gas Visuals",
		["sc_classic_smoke_desc"] = "Toggle the alternative Tear Gas visuals. This will provide a performance boost if the normal visuals cause performance issues.",
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
		["menu_asset_mad_cyborg_test_subject"] = "Test Subjects",				
		["heist_pines_briefing"] = "We need you there fast, because the explosion from that was surely enough to get the Reapers out of their base - and mobile. Anyway, it's really out in the sticks, so you're going in like the paras. Find the pilot - he's probably near the wreck, and then we'll send in a chopper to extract him. Stay with him til he's safely out, Also, Vlad says that plane was loaded with product, Search the forest and get as much out as you can. We could always use a little extra cash during Christmas.",		
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
		["menu_battle_rifle"] = "Battle Rifle",
		
		["bm_wp_upg_extra_mp_unlock"] = "MX4 Conversion Kit",
		["bm_wp_upg_extra_mp_unlock_desc"] = "Allows toggling fire modes and the installation of Cyclic mods at the cost of slightly more kick.",

		["bm_wp_p90_body_p90_tan"] = "Tan Body",
		
		["bm_melee_katana_info"] = "While playing as Jiro, killing a Cloaker with a charged attack triggers a special kill animation.",
		
		--We assets now--
		["menu_asset_dinner_safe"] = "Safe",
		["menu_asset_bomb_inside_info"] = "Insider Info",

		--Safe House Test
		--["dialog_safehouse_text"] = "You haven't visited the safe house yet. Would you like to go there now?",
		["dialog_safehouse_text"] = "You haven't visited the safe house yet. You should, as you might find something new.\nWould you like to go there now?",
		
	})
end)

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Modifiers",
		--["menu_challenge_stat_boost"] = "Random Mod Kit",
		--["menu_challenge_monthly_reward"] = "Random Primary Weapon Mod Kit or Midas Touch Weapon Mod Kit.",
		["bm_menu_suppression"] = "Noise Range(M)",
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
		["bm_wp_upg_a_storm_40acp"] = ".45ACP Conversion Kit",
		["bm_wp_upg_a_storm_40acp_desc"] = "",
		["bm_menu_custom_plural"] = "WEAPON ATTACHMENTS IN THE CUSTOM CATEGORY",
		["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "Why would you use outdated post-Collision ammunition with Chi-Revolvers? Why the fuck do dogs lick their balls?\nMin and max ammo pickup rate: 1.33x",		
		["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "Assblast your enemies through walls, armor, and shields with these rounds.\nEnables armor, shield, and wall piercing at the cost of damage.",
		["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "Chi-fussed hollow rounds stolen from a place of unknown origin. The only thing you need to know is that this shit KICKS hard and the fact that anything on the other end of the barrel is practically vaporized after the gun kicks. Good shit, ain't it?\nThis ammunition is much harder to find in ammo drops.\nEverything else lowered in favor of damage, and pickup rate.\nMin and max ammo pickup rate: 0.33x",		
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "Shoot them so dead they'll die in hell.\nMassive damage at the cost of everything else.\nCapable of piercing through armor, walls and shields.\nThis ammunition is much harder to find in ammo drops.\nMin and max ammo pickup rate: 0.33x",
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "Shoot them dead.\nThis ammunition is substantially easier to find in ammo drops.\nMin and max ammo pickup rate: 1.33x",		
		["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "7.62mm Conversion Kit",	
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "An ammunition type that mimics medium tier rifles. Lowers ammo count and stability in trade for higher damage and accuracy.",		
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Converts the weapon's caliber to 7.62mm, which slightly decreases firerate and stability in favor of increased damage and accuracy.",		
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "Extended Magazine",	
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Converts the Jackal into the Mastiff, something of the younger sister in the Jackal family. Not as stable as the Coyote, and not as deadly as the Jackal, but atleast it fires rounds that can penetrate both armor and walls.",		
		["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "Open-tipped rounds that, thanks to physics, create larger and more painful wound cavities in their enemies. Although HP rounds are harder to find on enemies and have more recoil, they are thankfully more effective against the head and somewhat more accurate than normal rounds.",								
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "Extend-o Magazine",	
		["bm_menu_weirdmagthing"] = "Magwell Grip",		
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "Magwell Grip",			
		["bm_wp_wpn_fps_ass_galil_m_drum"] = "75 Round Drum Magazine",
		["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "Converts to medium pistol tier.\nMin and Max pickup rate: 0.8x",
		["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "A tripod with additional ammo mounted on its side.\nReduces movement speed by 20% when equipped.",
		["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "Experimental scope that provides airburst capabilites to the Arbiter.\nIncompatible with incendiary rounds.",
		["bm_wp_upg_bp_lmg_lionbipod_desc"] = "Deploy/Undeploy by pressing the [Bipod Key/Alt-Fire Key]",
		--String override for the stungun--
		["bm_melee_taser_info"] = "Device that electrocutes and interrupts targets on touch when fully charged.",
		-- Renamed default weapons
		["bm_wp_corgi_b_short"] = "MSG Barrel",
		["menu_es_rep_upgrade"] = "",				
		["bm_wp_pis_usp_b_match"] = "Freeman Slide",		
		["bm_wp_1911_m_big"] = "Casket Magazine",		
		["bm_w_lemming"] = "5/7 Pistol",
		["bm_w_x_judge"] = "Judge & Jury", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
		["bm_w_x_shrew"] = "Barry & Paul",
		["bm_w_x_1911"] = "Mustang & Sally",
		["bm_w_tec9"] = "T3K Urban Submachine Gun",
		["bm_w_x_tec9"] = "Akimbo T3K Urban Submachine Guns",		
		["bm_wp_usp_m_big"] = "Casket Magazine",		
		["bm_wp_upg_ass_ak_b_zastava"] = "Long Barrel",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf Barrel",		
		["bm_wp_p90_b_ninja"] = "Ninja Barrel",		
		["bm_wp_90_body_boxy"] = "OMNIA Assault Frame",		
		["bm_wp_90_body_boxy_desc"] = "Recovered from the desolated remains of an old OMNIA warehouse, this frame makes no difference to the weapon's handling or its functionality whatsoever, but its block-like aesthetic surely makes it a nice thing to have.",				
		["bm_wp_mp5_fg_mp5sd"] = "SPOOC Foregrip",				
		["bm_wp_hs2000_sl_long"] = "Elite Slide",				
		["bm_wp_vhs_b_sniper"] = "Hyper Barrel",
		["bm_w_r0991"] = "AR-15 Varmint Pistol",
		["bm_wp_vhs_b_silenced"] = "Bad Dragan Barrel",
		["bm_wp_g3_b_sniper"] = "Macro Barrel",
		["bm_w_m590"] = "Reinbeck 890 Shotgun",
		["bm_w_m590_desc"] = "The criminal underworld's most popular shotgun is back and better than ever. With 8 rounds and nothing but raw power, the Reinbeck has finally returned to America's most infamous criminal crew.",		
		["bm_wp_g3_b_short"] = "Micro Barrel",								

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
		
		["bm_wp_upg_i_singlefire_desc"] = "LOCKS YOUR WEAPON TO SINGLE-FIRE MODE.",
		["bm_wp_upg_i_autofire_desc"] = "LOCKS YOUR WEAPON TO AUTO-FIRE MODE.",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Para Rifle",
		["bm_w_akmsu"] = "Krinkov Rifle",
		["bm_w_hajk"] = "CR 805B Rifle",
		
		["menu_akimbo_assault_rifle"] = "Akimbo Assault Rifle",
		
		["bm_wp_wpn_fps_upg_scar_m203_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_scar_m203_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",		

		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",				
	})
end)

end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local r = LevelsTweakData.LevelType.Russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = LevelsTweakData.LevelType.Murkywater
local z = LevelsTweakData.LevelType.Zombie
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Reaper Assault in Progress",
			["hud_assault_alpha"] = "REAPER ASSAULT"
		})
	end)
elseif ai_type == z then	
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Pciloe Asuaslt in Prergoss",
			["hud_assault_alpha"] = "PCILOE ASUASLT"
		})
	end)	
elseif ai_type == m and difficulty_index <= 7 then	
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Murkywater Assault in Progress",
			["hud_assault_alpha"] = "MURKYWATER ASSAULT"
		})
	end)	
elseif ai_type == m then	
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "OMNIA Assault in Progress",
			["hud_assault_alpha"] = "OMNIA ASSAULT"
		})
	end)		
end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "Pro-Job",
		["menu_one_down"] = "Pro-Job",
		["menu_es_extra_bonus"] = "Pro-Job Bonus",

		["cn_menu_contract_daypay_header"] = "Day Rate:",
		["cn_menu_contract_jobpay_header"] = "Contract Pay:",
		["victory_stage_cash_summary_name_job"] = "You earned $stage_cash on your contract day rate and an additional $job_cash for completing the contract.",
		
		["debug_interact_grenade_crate_take_grenades"] = "HOLD $BTN_INTERACT TO REFILL YOUR THROWABLES",
		
		["hud_repair_sentry"] = "$BTN_INTERACT $AMMO_LEFT",
		["repair_sentry_macro"] = "Hold $BTN_INTERACT to start sentry auto-repair sequence",
		["fixing_sentry_macro"] = "Repair progress: $AMMO_LEFT%",
		["pickup_sentry_macro"] = "Hold $BTN_INTERACT to retrieve sentry. $AMMO_LEFT ammo left.",
		["firemode_sentry_macro"] = "Hold $BTN_INTERACT to retrieve sentry. $AMMO_LEFT ammo left.",
		["hud_interact_sentry_gun_switch_fire_mode"] = "$BTN_INTERACT $AMMO_LEFT",
		["hud_action_repair_sentry"] = "Repairing sentry...",		
		
		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "DEATH WISH. FOR YOU, ACTION IS THE JUICE.",
		["menu_risk_sm_wish"] = "DEATH SENTENCE. NOW SHOW THEM THAT YOU CAN'T BE STOPPED.",		
	
		--Woo Hints--
		["loading_gameplay_118"] = "Cable Ties are a finite resource, make the most of them.",
		["loading_gameplay_12"] = "Know your enemy. Cloakers have distinct green, glowing night vision goggles on, and are completely silent. Check your corners and maintain vigilance!",
		
		["loading_sc_tip_title"] = "SC's Mod Tips",
		["loading_sc_tip_1"] = "Know your enemy. Grenadiers use tear gas grenades to flush heisters out of cover and are resistant to explosives themselves. Take them out quickly!",
		["loading_sc_tip_2"] = "Know your enemy. The Veteran Cop automatically dodges 50% of incoming gunfire. Try using damage types that he can't dodge like explosives, fire, or your melee weapon!",

		["menu_button_deploy_bipod"] = "BIPOD/ALT-FIRE",
		["skill_uppers_revive"] = "Downs restored!",
		--["hud_ai_traded_in"] = "",
		["skill_stockholm_syndrome_trade"] = "Down Restored!",
		--["hint_short_max_pagers"] = "Max number of pagers scales with difficulty. Be aware of the Pager operator's response.",

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
		["hud_instruct_mask_on_alpha"] = "Press $BTN_USE_ITEM to put on your mask",
				
		--Mutators
		["menu_mutators_achievement_disabled"] = "Mutators that reduce Experience and Money gained will also disable the earning of achievements, most trophies, and level completions!",
		["mutator_medidozer_longdesc"] = "All normal enemies during assault waves are replaced with Medics, and all special units are replaced with Bulldozers.",
		["mutator_medicdozers"] = "Medic Dozers",
		["mutator_medicdozers_desc"] = "Medic Dozers can now spawn.",
		["mutator_medicdozers_longdesc"] = "Whenever a Bulldozer of any variety spawns, there is a 50% chance that it will be replaced by a Medic Bulldozer. \n\nNote: If the Semi-Auto Shotgun Bulldozer mutator is enabled, then the Medic Dozer will have a 33.3% chance of replacing a Black Bulldozer.",

		["mutator_notitans"] = "Budget Cuts",
		["mutator_notitans_desc"] = "Disables Titan Units.",
		["mutator_notitans_longdesc"] = "All spawn instances of Titan Units are disabled.",

		["mutator_mememanonly"] = "HAHAHA, FOOLED YOU GUYS!",
		["mutator_mememanonly_desc"] = "SUFFERING",
		["mutator_mememanonly_longdesc"] = "CANTRUNNOESCAPEHELPHELPHELP\n\n WARNING: This mutator may cause crashes on some maps.",		

		["MutatorMoreDonutsPlus"] = "More Donuts+",
		["MutatorMoreDonutsPlus_desc"] = "All common enemies replaced by NYPD Bronco Cops, and all specials are replaced by OMNIA LPFs.",
		["MutatorMoreDonutsPlus_longdesc"] = "All common enemies are replaced by NYPD Bronco Cops, and all specials are replaced with OMNIA LPFs. \n\nWARNING: By enabling this mutator, you are committing an atrocity.",

		["MutatorJungleInferno"] = "Jungle Inferno",
		["MutatorJungleInferno_desc"] = "All enemies are replaced by Captain Summers.",
		["MutatorJungleInferno_longdesc"] = "All non-scripted spawn enemies are replaced by clones of Captain Summers.",						
		
		["mutator_minidozers"] = "Semi-Auto Shotgun Bulldozers",
		["mutator_minidozers_desc"] = "Semi-Auto Shotgun Bulldozers can now spawn.",
		["mutator_minidozers_longdesc"] = "Whenever a Black Bulldozer spawns, there is a 50% chance that it will be replaced by a Bulldozer wielding an M1014.\n\nNote: If the Medic Bulldozer mutator is enabled, then the Semi-Auto Shotgun Bulldozer will have a 33.3% chance of replacing a Black Bulldozer.",
		
		["mutator_fatroll"] = "Fat Roll",
		["mutator_fatroll_desc"] = "Damage Grace disabled.",
		["mutator_fatroll_longdesc"] = "Damage grace on players and AI crew members is set to 0, meaning that there is no delay on instances of damage.",

		["mutator_zombie_outbreak"] = "The Dead Walking",
		["mutator_zombie_outbreak_desc"] = "Replaces all enemies with Zombie units",
		["mutator_zombie_outbreak_longdesc"] = "The dead have risen! Replaces all enemies with Zombie units",

		["mutator_faction_override"] = "Enemy Factor Override",
		["mutator_faction_override_desc"] = "",
		["mutator_faction_override_longdesc"] = "",
		["mutator_faction_override_"] = "",
		["mutator_faction_override_select"] = "",
		["mutator_faction_override_america"] = "America",
		["mutator_faction_override_russia"] = "Russia",
		["mutator_faction_override_zombie"] = "Zombie",
		["mutator_faction_override_murkywater"] = "MurkyWater",
		["mutator_faction_override_nypd"] = "NYPD",
		["mutator_faction_override_lapd"] = "LAPD",
		["faction_selector_choice"] = "Faction: ",
				
		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "A Crime Spree is an endless series of randomly selected heists, executed in succession. With each heist you complete, your Rank and Reward will increase! Each 20th or 26th rank you will need to choose a modifier and each 100th rank there is an increase to the risk level, that will make the next heists harder to complete.\n\n##If you invite your crew, make sure they started their own Crime Spree before joining in order to gain ranks and Rewards as well.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_no_hurt"] = "Enemies are 50% resistant to knock down.",
		["menu_cs_modifier_enemy_health_damage"] = "Enemies deal an additional 15% more damage.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "All rifle SWAT units have an additional 15% chance to become an elite UMP unit.",
		["menu_cs_modifier_heavy_sniper"] = "All regular Heavy SWAT units have an additional 15% chance to become a Titan Shotgunner.",
		["menu_cs_modifier_dozer_medic"] = "All Veteran Agent units have an additional 15% chance to become a Veteran Cop.",
		["menu_cs_modifier_dozer_minigun"] = "All Bulldozer units have an additional 15% chance to become a Titan Bulldozer.",
		["menu_cs_modifier_shield_phalanx"] = "All regular Shield units have an additional 15% chance to become a Titan Shield.",
		["menu_cs_modifier_concealment"] = "Suspicion buildup is increased by 10%.",
		["menu_cs_modifier_cloaker_smoke"] = "Cloakers will drop a smokebomb when they kick a player.",
		["menu_cs_modifier_taser_overcharge"] = "All Taser units have an additional 15% chance to become a Titan Taser.",
		["menu_cs_modifier_dozer_rage"] = "When a Bulldozer's faceplate is destroyed, the Bulldozer enters a berserker rage, receiving a 10% increase to their base damage resistance.",
		["menu_cs_modifier_medic_adrenaline"] = "All Medic units have an additional 15% chance to become an Omnia LPF.",	
		["menu_cs_modifier_cloaker_arrest"] = "Cloakers executing a successful jump kick now downs the player instead of cuffing them.",
		["menu_cs_modifier_cloaker_smoke"] = "All Cloaker units have an additional 15% chance to become a Titan Cloaker.",
		["menu_cs_modifier_cloaker_tear_gas"] = "All HRT units have an additional 15% chance to become a Titan HRT.",
		["menu_cs_modifier_dozer_lmg"] = "Whenever a Green Bulldozer spawns, there is a chance that it will be replaced by a Bulldozer wielding an M1014, and whenever a Black Bulldozer spawns, there is a chance that it will be replaced by a Medic Bulldozer.",
		["menu_cs_modifier_pagers"] = "Pagers take 1 second longer to answer.",

		["bm_menu_skill"] = "Crew Boosts",

		["menu_crew_interact"] = "Quick",
		["menu_crew_interact_desc"] = "Players interact 15% faster.",

		["menu_crew_inspire"] = "Inspiring",
		["menu_crew_inspire_desc"] = "Bots equipped with this ability can now use the Inspire aced ability.\n\nThey cannot do this more than once every 60 seconds.",

		["menu_crew_scavenge"] = "Sharpeyed",
		["menu_crew_scavenge_desc"] = "Players pickup 25% more ammunition.",

		["menu_crew_ai_ap_ammo"] = "Piercing",
		["menu_crew_ai_ap_ammo_desc"] = "Your team AI will now use armor piercing rounds. This enables them to shoot through body armor.",

		["menu_crew_healthy"] = "Reinforcer",
		["menu_crew_healthy_desc"] = "Players' health is increased by 30.",

		["menu_crew_sturdy"] = "Protector",
		["menu_crew_sturdy_desc"] = "Players' armor is increased by 15.",

		["menu_crew_evasive"] = "Distractor",
		["menu_crew_evasive_desc"] = "Players' dodge is increased by 3.",

		["menu_crew_motivated"] = "Invigorator",
		["menu_crew_motivated_desc"] = "Players have 25 more stamina.",

		["menu_crew_regen"] = "Healer",
		["menu_crew_regen_desc"] = "Players heal 1.5 health every 5 seconds.",

		["menu_crew_quiet"] = "Concealer",
		["menu_crew_quiet_desc"] = "Players gain 1 more concealment.",

		["menu_crew_generous"] = "Stockpiler ",
		["menu_crew_generous_desc"] = "Players are granted an extra throwable for every 70 kills.",

		["menu_crew_eager"] = "Accelerator",
		["menu_crew_eager_desc"] = "Players reload 10% faster.",
		
		["bm_equipment_ecm_jammer_desc"] = "To use the ECM Jammer, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved and it will be active for 10 seconds.\n\nYou can toggle the ECM Jammer's feedback ability by interacting with it. The feedback will have a chance to incapacitate your enemies within a 25 meter radius. Feedback lasts for 20 seconds and will recharge after 4 minutes.\n\nECM jammers can open ATM machines and temporarily cancel out electronic devices such as cell phones, cameras, and other detection systems easing your way towards your goal.",
		
--[[   SKILLTREES   ]]--
	--{
	
		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "Combat Medic",
			["menu_combat_medic_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##10%## damage reduction for ##5## seconds both after and during reviving another player.\n\nACE: ##$pro##\nReviving a crew member gives them ##30%## more health.",
			
			--Quick Fix
			["menu_tea_time_beta_sc"] = "Quick Fix",
			["menu_tea_time_beta_desc_sc"] = "BASIC: ##$basic##\nDecreases your First Aid Kit and Doctor Bag deploy time by ##50%.##\n\nACE: ##$pro##\nCrew members that use your First Aid Kits or Doctor Bags take ##15%## less damage for ##20## seconds.",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "Painkillers",
			["menu_fast_learner_beta_desc_sc"] = "BASIC: ##$basic##\nCrew members you revive take ##25%## less damage for ##5## seconds.\n\nACE: ##$pro##\nThe damage reduction is increased by an additional ##25%.##",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "Uppers",
			["menu_tea_cookies_beta_desc_sc"] = "BASIC: ##$basic##\nAdds ##4## more First Aid Kits to your inventory.\n\nACE: ##$pro##\nAdds ##6## more First Aid Kits to your inventory.\n\nYour deployed first aid kits will be automatically used if a player would go down within a ##5## meter radius of the first aid kit.\n\nThis cannot occur more than once every ##60## seconds.\n\n Note: Does not apply to Swan Song.",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "Combat Doctor",
			["menu_medic_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYour doctor bags have ##1## more charge.\n\nACE: ##$pro##\nYou can now deploy ##2## Doctor Bags instead of just one.",																								

			--Inspire
			["menu_inspire_beta_sc"] = "Inspire",
			["menu_inspire_beta_desc_sc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster. Shouting at your teammates will increase their movement speed by ##20%## for ##10## seconds.\n\nACE: ##$pro##\nThere is a ##100%## chance that you can revive crew members at a distance of ##9 meters## by shouting at them. This cannot occur more than once every ##60## seconds.",																								


			--}
			
			--[[   CONTROLLER SUBTREE   ]]--
			--{
	
			--Cable Guy
			["menu_triathlete_beta_sc"] = "Cable Guy",
			["menu_triathlete_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases your supply of cable ties by ##4##.\n\nACE: ##$pro##\nYou gain a ##10%## chance to pick up cable ties from ammo boxes.\n\nIncreases your maximum cable ties by ##3.##",																								

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "Clowns are Scary",
			["menu_cable_guy_beta_desc_sc"] = "BASIC: ##$basic##\nThe power and range of your intimidation is increased by ##50%.##\n\nACE: ##$pro##\nCivilians are intimidated by the noise you make and remain intimidated ##50%## longer.",																								

			--Stockholm Syndrome	
			["menu_joker_beta_sc"] = "Stockholm Syndrome",
			["menu_joker_beta_desc_sc"] = "BASIC: ##$basic##\nYour hostages will not flee when they have been rescued by law enforcers.\n\nACE: ##$pro##\nNearby civilians and jokers have a chance of reviving you if you interact with them, and have a chance of giving you ammo.",																								

			--Joker	
			["menu_stockholm_syndrome_beta_sc"] = "Joker",	
			["menu_stockholm_syndrome_beta_desc_sc"] = "BASIC: ##$basic##\nYou can convert a non-special enemy to fight on your side. This can not be done during stealth and enemies must surrender before you can convert them. You can only convert one enemy at a time.\n\nACE: ##$pro##\nThe converted enemy deals ##45%## more damage.\n\nYou can now have ##2## converted enemies at the same time.",

			--Partners in Crime	
			["menu_control_freak_beta_sc"] = "Partners in Crime",	
			["menu_control_freak_beta_desc_sc"] = "BASIC: ##$basic##\nHaving a converted enemy increases your movement speed by ##10%.##\n\nYour converted enemy takes ##40%## less damage.\n\nACE: ##$pro##\nHaving a converted enemy increases your health by ##30%.##\n\nYour converted enemy takes an additional ##40%## less damage.",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "Hostage Taker",	
			["menu_black_marketeer_beta_desc_sc"] = "BASIC: ##$basic##\nHaving at least one hostage or converted law enforcer makes you regenerate ##1%## health every ##5## seconds.\n\nACE: ##$pro##\nHaving at least one hostage or converted law enforcer makes you regenerate ##2%## health every ##5## seconds.\n\nYou and your crew gain ##1## damage absorption for each hostage you have. This effect stacks with up to a maximum of ##4## hostages.\n\nNote: This skill does not stack.",
		

			--}
			
			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "Leadership",	
			["menu_stable_shot_beta_desc_sc"] = "BASIC: ##$basic##\nYour stability rating for all SMGs and LMGs is increased by ##4.##\n\nACE: ##$pro##\nYou and your crew's stability rating for all weapons is increased by ##4.##",

			--MG Handling
			["menu_scavenger_sc"] = "MG Handling",	
			["menu_scavenger_desc_sc"] = "BASIC: ##$basic##\nTightens the hipfire accuracy of SMGs, LMGs and Assault Rifles by ##50%##\n\nACE: ##$pro##\nYou reload SMGs and LMGs ##25%## faster.",

			--MG Specialist
			["menu_sharpshooter_sc"] = "MG Specialist",	
			["menu_sharpshooter_desc_sc"] = "BASIC: ##$basic##\nYour weapon accuracy while moving with SMGs, LMGs and Assault Rifles is increased by ##50%.##\n\nACE: ##$pro##\nIncreases the rate of fire of SMGs and LMGs by ##15%.##",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "Shock and Awe",
			["menu_spotter_teamwork_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapons' magazine sizes are increased by ##30%.##\n\nACE: ##$pro##\nYou can now hip-fire with your weapons while sprinting.\n\nYour weapons' magazine sizes are increased by an additional ##20%.##",

			--Heavy Impact
			["menu_speedy_reload_sc"] = "Heavy Impact",
			["menu_speedy_reload_desc_sc"] = "BASIC: ##$basic##\nSubmachine Guns, Light Machineguns or Rifles set on automatic fire mode have a ##10%## chance to knock down enemies.\n\nACE: ##$pro##\nYour shots now have a ##25%## chance to knock down enemies.\n\nNote: Stagger effects do not apply to Captains, Bulldozers, and Shields.",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "Body Expertise",
			["menu_body_expertise_beta_desc_sc"] = "BASIC: ##$basic##\nYour bullets can ##now pierce body armor.##\n\n##30%## of the enemy's headshot multiplier is applied to the enemy's body.\n\nNote: This skill is only activated by Submachine Guns, Light Machineguns or Rifles fired in automatic mode and does not apply to Bulldozers.\n\nACE: ##$pro##\n##100%## of the enemy's headshot multiplier is applied to the enemy's body.",

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
			["menu_shotgun_cqb_beta_desc_sc"] = "BASIC: ##$basic##\nYou aim down sights ##50%## faster with shotguns.\n\nACE: ##$pro##\nYou reload shotguns ##25%## faster.",																								

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "Shotgun Impact",
			["menu_shotgun_impact_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapon stability with all shotguns is increased by ##4.##\n\nACE: ##$pro##\nYou gain ##3## extra pellets with every shotgun shot.\n\nNote: Does not apply to slugs or explosive rounds.",																																																																																																																																																																																																

			--Pigeon Shooting	
			["menu_far_away_beta_sc"] = "Pigeon Shooter",
			["menu_far_away_beta_desc_sc"] = "BASIC: ##$basic##\nYour shotgun's accuracy is increased by ##40%## while aiming down sights.\n\nACE: ##$pro##\nYour shotgun's range is increased by ##50%## while aiming down sights.",																																																																																																																																																																																																

			--Gung Ho
			["menu_close_by_beta_sc"] = "Gung-Ho",
			["menu_close_by_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now hip-fire with shotguns while sprinting.\n\nACE: ##$pro##\nYour rate of fire is increased by ##35%## while hip-firing with shotguns.",

			--Overkill
			["menu_overkill_sc"] = "OVERKILL",
			["menu_overkill_desc_sc"] = "BASIC: ##$basic##\nWhen you kill an enemy using a shotgun or the OVE9000 portable saw, you receive a ##50%## damage boost for ##2## seconds.\n\nNote: Does not apply to grenade launchers.\n\nACE: ##$pro##\nThe damage bonus now applies to all weapons and lasts ##10## seconds. Skill must still be activated using a shotgun or the OVE9000 portable saw.\n\nDecreases the time it takes to pull and put away shotguns and the saw by ##80%##.",

			--}
			
			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "Stun Resistance",
			["menu_oppressor_beta_desc_sc"] = "BASIC: ##$basic##\nYour steadiness is increased by ##10.##\n\nACE: ##$pro##\nReduces the visual effect duration of Flashbangs by ##50%.##",

			--Die Hard
			["menu_show_of_force_sc"] = "Die Hard",
			["menu_show_of_force_desc_sc"] = "BASIC: ##$basic##\nYou can use your primary weapon in bleedout.\n\nACE: ##$pro##\nYour armor recovers ##10%## faster.",																																																																																																																																																																																																
			
			--Transporter
			["menu_pack_mule_beta_sc"] = "Transporter",
			["menu_transporter_beta_desc_sc"] = "BASIC: ##$basic##\nFor each ##10## armor points the bag movement penalty is reduced by ##0.5%##.\n\nACE: ##$pro##\nYou can now sprint with any bag.\n\nNote: The movement penalty from the bag still applies.",																																																																																																																																																																																																

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "More Blood to Bleed",
			["menu_iron_man_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##15%## extra health.\n\nACE: ##$pro##\nYou gain an additional ##25%## extra health.",																								

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "Bullseye",
			["menu_prison_wife_beta_desc_sc"] = "BASIC: ##$basic##\nYou regenerate ##5## armor for each successful headshot. This effect cannot occur more than once every ##3## seconds.\n\nACE: ##$pro##\nYou regenerate an additional ##30## armor for each successful headshot.",																								

			--Iron Man
			["menu_juggernaut_beta_sc"] = "Iron Man",
			["menu_juggernaut_beta_desc_sc"] = "BASIC: ##$basic##\nUnlocks the ability to wear the Improved Combined Tactical Vest.\n\nACE: ##$pro##\nWhen you melee Shield enemies, they get knocked back by the sheer force.\n\nEnables your ranged weapons to have a chance to knock back Shield enemies when attacking them. Knock back chance is increased the higher the total damage of the weapon is.\n\n##Note: Titanshields can only be knocked down by melee strikes.##",																																																																																																																																																																																																
		

			--}
			
			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{
			
			--Scavenger
			["menu_scavenging_sc"] = "Scavenger",
			["menu_scavenging_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##50%## increased ammo box pick up range.\n\nACE: ##$pro##\nEvery ##10th## enemy you kill will drop an extra ammo box.",																																																																																																																																																																																																

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "Bulletstorm",
			["menu_ammo_reservoir_beta_desc_sc"] = "BASIC: ##$basic##\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##5## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.\n\nACE: ##$pro##\nIncreases the base duration of the effect by up to ##15## seconds.",																								

			--Specialist Equipment formally Rip and Tear
			["menu_portable_saw_beta_sc"] = "Specialist Equipment",
			["menu_portable_saw_beta_desc_sc"] = "BASIC: ##$basic##\nReduces the wear down of saw blades by ##50%.##\n\nACE: ##$pro##\nYou reload Saws, Crossbows, Bows, Grenade Launchers, and Rocket Launchers ##25%## faster.",																																																																																																																																																																																																

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "Extra Lead",
			["menu_ammo_2x_beta_desc_sc"] = "BASIC: ##$basic##\nEach ammo bag contains additional ##200%## ammunition.\n\nACE: ##$pro##\nYou can now place ##2## ammo bags instead of just one.",																								

			--Rip and Tear formally Carbon Blade
			["menu_carbon_blade_beta_sc"] = "Rip and Tear",
			["menu_carbon_blade_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now saw through shield enemies with your OVE9000 portable saw.\n\nACE: ##$pro##\nWhen killing an enemy with the Saw, Crossbows, Bows, Grenade Launchers, or Rocket Launchers you have a ##50%## chance to cause nearby enemies in a ##10## meter radius to panic.\n\nPanic makes enemies go into short bursts of uncontrollable fear.",																								

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "Fully Loaded",
			["menu_bandoliers_desc_sc"] = "BASIC: ##$basic##\nYour total ammo capacity is increased by ##25%##.\n\nACE: ##$pro##\nIncreases your ammo pickup to ##175%## of the normal rate.\n\nYou gain a ##5%## chance to get a throwable from an ammo box.",
									
			--}
		--}
		
		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{
	
			--Logistician
			["menu_defense_up_beta_sc"] = "Logistician",
			["menu_defense_up_beta_desc_sc"] = "BASIC: ##$basic##\nYou deploy and interact with all deployables ##25%## faster.\n\nACE: ##$pro##\nYou and your crew deploy and interact with all deployables ##50%## faster.",

			--Nerves of Steel--	
			["menu_fast_fire_beta_sc"] = "Nerves of Steel",
			["menu_fast_fire_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now ##use steel sights while in bleedout.##\n\nACE: ##$pro##\nYou take ##50%## less damage while interacting with objects.",																																																																																																																																																																																																																									

			--Engineering
			["menu_eco_sentry_beta_sc"] = "Engineering",
			["menu_eco_sentry_beta_desc_sc"] = "BASIC: ##$basic##\nYour sentry guns gain ##150%## increased health.\n\nACE: ##$pro##\nYour sentry guns gain a protective shield.",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "Jack of All Trades",
			["menu_jack_of_all_trades_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now equip a second deployable to bring with you. Pressing the ##'X'## key will allow you to toggle between deployables.\n\nThe second deployable has ##50%## less uses than normal.\n\nACE: ##$pro##\nYour second deployable now has ##100%## of its normal uses.",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "Tower Defense",	
			["menu_tower_defense_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now carry a maximum of ##2## sentry guns.\n\nACE: ##$pro##\nYou can now toggle AP rounds on your sentry guns, lowering the rate of fire by ##75%##, increasing damage by ##50%## and allowing it to pierce through enemies and shields.",																								
			
			--Bulletproof--
			["menu_iron_man_sc"] = "Bulletproof",
			["menu_iron_man_desc_sc"] = "BASIC: ##$basic##\nYou gain ##20%## more armor.\n\nACE: ##$pro##\nYou gain ##30%## more armor.\n\nYour armor recovery rate is increased by ##5%.##",																																																																																																																																																																																																																									
					
			--}
			
			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "Hardware Expert",
			["menu_hardware_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou fix drills and saws ##50%## faster.\n\nACE: ##$pro##\nYour drills and saws are now silent. Civilians and guards have to see the drill or saw in order to get alerted.",																								

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "Danger Close",
			["menu_combat_engineering_desc_sc"] = "BASIC: ##$basic##\nThe radius of trip mine explosion is increased by ##30%.##\n\nACE: ##$pro##\nYour trip mine deals ##50%## more damage.",																								

			--More Firepower--
			["menu_more_fire_power_sc"] = "Demoman",
			["menu_more_fire_power_desc_sc"] = "BASIC: ##$basic##\nYou can now carry ##4## shaped charges and ##6## trip mines.\n\nYou deploy shaped charges and trip mines ##20%## faster.\n\nACE: ##$pro##\nYou can now carry ##6## shaped charges and ##10## trip mines.\n\nYou deploy shaped charges and trip mines an additional ##20%## faster.",																								


			--Kickstarter
			["menu_kick_starter_beta_desc_sc"] = "BASIC: ##$basic##\nYour drills and saws gain a ##30%## chance to automatically restart after breaking.\n\nACE: ##$pro##\nYou gain the ability to restart a drill by hitting it with a melee attack. You get ##1## chance for each time it breaks with a ##50%## success rate.",


			--}
			
			--[[  BATTLE SAPPER  SUBTREE   ]]--
			--{
			
			--Rifleman
			["menu_rifleman_sc"] = "Rifleman",
			["menu_rifleman_desc_sc"] = "BASIC: ##$basic##\nYour snap to zoom is ##25%## faster with all weapons.\n\nACE: ##$pro##\nYou gain a ##10%## accuracy bonus while aiming down sights with all SMG, Assault Rifles and Sniper Rifles fired in single shot mode.",		

			--Aggressive Reload
			["menu_engineering_beta_sc"] = "Aggressive Reload",
			["menu_engineering_beta_desc_sc"] = "BASIC: ##$basic##\nAny killing headshot will reduce your reload time by ##25%## for ##6## seconds. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot fire mode.\n\nACE: ##$pro##\nThe reload speed bonus increases to ##50%## and now lasts ##12## seconds.",					
			
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
			["menu_perseverance_desc_sc"] = "BASIC: ##$basic##\nWhen your health reaches ##0##, instead of instantly going down, you can fight for ##3## seconds with a ##60%## movement speed penalty.\n\nACE: ##$pro##\nYou can fight for an additional ##6## seconds.",



			--}
			
			--[[   BRAWLER SUBTREE   ]]--
			--{

			--Counter-Strike--
			["menu_drop_soap_beta_sc"] = "Counter Strike",
			["menu_drop_soap_beta_desc_sc"] = "BASIC: ##$basic##\nWhen charging your melee weapon you will counterattack enemies that try to strike you.\n\nACE: ##$pro##\nYou gain the ability to counter attack cloakers and their kicks, knocking them down.",																								

			--Bloodthirst--
			["menu_bloodthirst_sc"] = "Bloodthirst",
			["menu_bloodthirst_desc_sc"] = "BASIC: ##$basic##\nWhenever you kill an enemy with a melee attack, you will gain a ##25%## increase in reload speed for ##10## seconds.\n\nACE: ##$pro##\nEvery kill you get will increase your next melee attack damage by ##25%##, up to a maximum of ##100%.##\n\nThis effect gets reset when striking an enemy with a melee attack.",																																																																																																																																																																																																																																					


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "Deep Pockets",
		["menu_thick_skin_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases the concealment of melee weapons by ##2.##\n\nACE: ##$pro##\nIncreases the armor of all ballistic vests and the suit by ##20.##\n\nIncreases the concealment of all ballistic vests by ##4.##",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "Duck and Cover",
		["menu_sprinter_beta_desc_sc"] = "BASIC: ##$basic##\nYour stamina starts regenerating ##25%## earlier and ##25%## faster.\n\nACE: ##$pro##\nYour dodge meter fills up by ##10%## of your dodge every second while sprinting.\n\nYour dodge meter fills up by ##30%## of your dodge every second while on a zipline.",																								

		--Sneaky Bastard--
		["menu_jail_diet_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## point of dodge for every ##3## points of concealment under ##35## up to a maximum of ##10##\n\nACE: ##$pro##\nYou gain ##1## point of dodge for every ##1## point of concealment under ##35## up to a maximum of ##10##.",

		--Sharpshooter--
		["menu_discipline_sc"] = "Sharpshooter",
		["menu_discipline_desc_sc"] = "BASIC: ##$basic##\nYour weapon stability is increased with all rifles by ##4.##\n\nACE: ##$pro##\nYou gain ##5## weapon accuracy while standing still.",

		--Kilmer--	
		["menu_heavy_impact_beta_sc"] = "Kilmer",
		["menu_heavy_impact_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapon accuracy is increased with rifles and SMGs set to semi-auto by ##5.##\n\nACE: ##$pro##\nYou reload rifles ##25%## faster.",

		--Explosive Headshot--
		["menu_kilmer_sc"] = "Explosive Headshot",
		["menu_kilmer_desc_sc"] = "BASIC: ##$basic##\nSnipers that headshot their target deal ##30%## of the damage dealt in a ##3## meter radius around the bullet impact.\n\nACE: ##$pro##\nSnipers that headshot their target now deal ##60%## of the damage dealt in a ##5## meter radius around the bullet impact.",																																																																																																																																																																																																																									

		--Ammo Efficiency--
		["menu_single_shot_ammo_return_sc"] = "Ammo Efficiency",
		["menu_single_shot_ammo_return_desc_sc"] = "BASIC: ##$basic##\nGetting ##3## killing headshots in less than ##6## seconds will grant ##1## ammo pickup to your used weapon. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot mode.\n\nACE: ##$pro##\nGetting ##3## headshots in a row will grant ##1## ammo pickup for your used weapon. Can only be triggered by SMGs, Assault Rifles and Sniper Rifles fired in single shot mode.",																																																																																																																																																																																																																									

		--Cleaner--
		["menu_jail_workout_sc"] = "Cleaner",
		["menu_jail_workout_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## additional body bag in your inventory.\n\nACE: ##$pro##\nYou gain the ability to place ##2## body bag cases.\n\nYou deal ##10%## more damage against special enemies. ",	

		--Nimble--
		["menu_cleaner_beta_sc"] = "Nimble",
		["menu_cleaner_beta_desc_sc"] = "BASIC: ##$basic##\nYou pick all locks and handcuffs ##50%## faster.\n\nACE: ##$pro##\nYou can now ##silently crack safes by hand.##",	
																																																																																																																																																																																																																								
		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "Sixth Sense",
		["menu_chameleon_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability to automatically mark enemies within a ##10## meter radius around you after standing still for ##3.5## seconds.\n\nACE: ##$pro##\nYou ##gain access to all insider assets.##",	

		--Systems Specialist--
		["menu_second_chances_beta_sc"] = "Systems Specialist",
		["menu_second_chances_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability disable ##1## camera from detecting you and your crew. Effect lasts for ##30## seconds.\n\nYou interact with all computers, hacks, and ECMs ##25%## faster.\n\nACE: ##$pro##\nIncreases the duration of marked enemies by ##100%## and you can now mark specials and guards in stealth by aiming at them with any weapon.\n\nYou interact with all computers, hacks, and ECMs an additional ##50%## faster.",	
		
		--ECM Specialist--
		["menu_ecm_booster_beta_sc"] = "ECM Specialist",
		["menu_ecm_booster_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now place ##3## ECM jammers instead of just two.\n\nACE: ##$pro##\nYou can now place ##4## ECM jammers instead of just three.",	
		
		--ECM Overdrive--
		["menu_ecm_2x_beta_sc"] = "ECM Overdrive",
		["menu_ecm_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYour ECM jammer can ##now be used to open certain electronic doors.##\n\nYour ECM jammer and feedback duration is increased by ##25%.##\n\nACE: ##$pro##\nThe ECM jammer duration is increased by an additional ##25%## and the ECM feedback duration lasts ##25%## longer.\n\nPagers are delayed by the ECM jammer.",	
																																																																																																																																																																																																																																															
		--Evasion--
		["menu_awareness_beta_sc"] = "Evasion",
		["menu_awareness_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##5%## additional movement speed.\n\nYour fall damage is reduced by ##75%##.\n\nACE: ##$pro##\nRun and reload - you can reload your weapons while sprinting.",																								

		--Moving Target--
		["menu_dire_need_beta_sc"] = "Moving Target",
		["menu_dire_need_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1%## extra movement speed for every ##3## points of concealment under ##35##, up to ##15%.##\n\nACE: ##$pro##\nYou gain ##1%## extra movement speed for every ##1## point of concealment under ##35##, up to ##15%.##",																								

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "Optical Illusions",
		["menu_optic_illusions_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## concealment for each suppressed weapon you equip.\n\nACE: ##$pro##\nReduces the concealment penalty of suppressors by ##2.##",																								

		--The Professional--
		["menu_silence_expert_beta_sc"] = "The Professional",
		["menu_silence_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##4## weapon stability with silenced weapons.\n\nACE: ##$pro##\nYou gain ##5## weapon accuracy and ##50%## snap to zoom speed increase with silenced weapons.",																								

		--Dire Need--
		["menu_backstab_beta_sc"] = "Dire Need",
		["menu_backstab_beta_desc_sc"] = "BASIC: ##$basic##\nWhen your armor is fully depleted, the first shot on every enemy will cause that enemy to stagger.\n\nThis effect ends when your armor regenerates.\n\nACE: ##$pro##\nThe effect persists for ##5## seconds after your armor has regenerated. ",																								

		--Spotter--
		["menu_hitman_beta_sc"] = "Spotter",
		["menu_hitman_beta_desc_sc"] = "BASIC: ##$basic##\nEnemies you mark take ##15%## more damage.\n\nACE: ##$pro##\nEnemies you mark take an additional ##30%## damage when further than ##20## meters.",																								

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "Low Blow",
		["menu_unseen_strike_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##3%## critical hit chance for every ##3## points of concealment under ##35## up to a maximum of ##30%.##\n\nCritical hits have a damage multiplier of ##2##.\n\nACE: ##$pro##\nYou gain a ##3%## critical hit chance for every ##1## point of concealment under ##35## up to a maximum of ##30%.##",																								

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "Equilibrium",
		["menu_equilibrium_beta_desc_sc"] = "BASIC: ##$basic##\nDecreases the time it takes to draw and holster pistols by ##80%.##\n\nACE: ##$pro##\nYou and your crew's weapon stability with pistols is increased by ##4.##",																								

		--Gun Nut--
		["menu_dance_instructor_sc"] = "Gun Nut",
		["menu_dance_instructor_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##15%## increased rate of fire with pistols.\n\nACE: ##$pro##\nYou gain ##5## weapon accuracy with pistols.",																								

		--Over Pressurized/Gunfighter--
		["menu_gun_fighter_sc"] = "Gunfighter",
		["menu_gun_fighter_desc_sc"] = "BASIC: ##$basic##\nYou reload pistols ##25%## faster.\n\nACE: ##$pro##\nYou reload pistols an additional ##25%## faster.",																								

		--Akimbo--
		["menu_akimbo_skill_sc"] = "Akimbo",
		["menu_akimbo_skill_desc_sc"] = "BASIC: ##$basic##\nYour Akimbo weapons' stability penalty is reduced by ##8.##\n\nACE: ##$pro##\nYour Akimbo weapons' stability penalty is reduced by an additional ##12## and you also carry ##25%## more total ammo for them.",																																																																																																																																																																																																																																		

		--Desperado--
		["menu_expert_handling_sc"] = "Desperado",
		["menu_expert_handling_desc_sc"] = "BASIC: ##$basic##\nEach successful pistol hit gives you a ##10%## increased accuracy bonus for ##10## seconds and can stack ##4## times.\n\nACE: ##$pro##\nIncreases the accuracy boost duration to ##20## seconds.",																																																																																																																																																																																																																																		

		--Trigger Happy--
		["menu_trigger_happy_beta_sc"] = "Trigger Happy",
		["menu_trigger_happy_beta_desc_sc"] = "BASIC: ##$basic##\nEach successful pistol hit grants a ##15%## damage boost for ##10## seconds and can stack ##4## times.\n\nACE: ##$pro##\nIncreases the damage boost duration to ##20## seconds.",																								
				
		--Running From Death--
		["menu_nine_lives_beta_sc"] = "Running from Death",
		["menu_nine_lives_beta_desc_sc"] = "BASIC: ##$basic##\nYou move ##25%## faster for ##10## seconds after getting up.\n\nACE: ##$pro##\nYou reload and swap weapons ##25%## faster for ##10## seconds after getting up.",																																																																																																																																																																																																																																		

		--Nine Lives--
		["menu_running_from_death_beta_sc"] = "Nine Lives",
		["menu_running_from_death_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##100%## increase to bleedout health.\n\nACE: ##$pro##\nYou gain the ability to get downed ##1## more time before going into custody.",																																																																																																																																																																																																																																		

		--Undying--
		["menu_feign_death_sc"] = "Undying",
		["menu_feign_death_desc_sc"] = "BASIC: ##$basic##\nWhen you get downed, you have a ##20%## chance to instantly get revived.\n\nACE: ##$pro##\nThe chance to get revived is increased by an additional ##25%.##",																																																																																																																																																																																																																																		

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "Messiah",
		["menu_pistol_beta_messiah_desc_sc"] = "BASIC: ##$basic##\nWhile in bleedout, killing an enemy will allow you to revive yourself.\n\nYou only have ##1## charge which is replenished when leaving custody.\n\nACE: ##$pro##\nYou now have a total of ##3## charges which are replenished when leaving custody.",																																																																																																																																																																																																																																		

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "Martial Arts",
		["menu_martial_arts_beta_desc_sc"] = "BASIC: ##$basic##\nYou take ##50%## less damage from all melee attacks because of training.\n\nACE: ##$pro##\nYou are ##50%## more likely to knock down enemies with a melee strike because of training.",																																																																																																																																																																																																																																		

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "Pumping Iron",
		["menu_steroids_beta_desc_sc"] = "BASIC: ##$basic##\nYou swing melee weapons ##25%## faster.\n\nACE: ##$pro##\nYou swing melee weapons an additional ##25%## faster.",																																																																																																																																																																																																																																		

		--Frenzy--
		["menu_wolverine_beta_sc"] = "Frenzy",
		["menu_wolverine_beta_desc_sc"] = "BASIC: ##$basic##\nYou start with and cannot heal above ##25%## of your maximum health.\n\nYou take ##30%## less health damage and healing is reduced by ##75%.##\n\nACE: ##$pro##\nHealth damage taken is now reduced by ##60%## and healing is instead reduced by ##50%.##",																																																																																																																																																																																																																																		

		--Berserker--
		["menu_frenzy_sc"] = "Berserker",
		["menu_frenzy_desc_sc"] = "BASIC: ##$basic##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##50%##, you will do up to ##150%## more melee and saw damage.\n\nACE: ##$pro##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##50%##, you will do up to ##75%## more damage with firearms."																																																																																																																																																																																																																																	

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Dodge",
	
		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Increases your headshot damage by ##25%.##\n\nYou do ##5%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_4_desc_sc"] = "You gain ##+1## increased concealment.\n\nWhen wearing armor, your movement speed is ##15%## less affected.\n\nYou gain ##45%## more experience when you complete days and jobs.\n\nYou do ##5%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_6_desc_sc"] = "Unlocks an armor bag equipment for you to use. The armor bag can be used to change your armor during a heist.\n\nIncreases your ammo pickup to ##135%## of the normal rate.\n\nYou do ##5%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_8_desc_sc"] = "Increases your doctor bag interaction speed by ##20%.##\n\nYou do ##5%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
	
		--Crook--
		["menu_deck6_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour armor is increased by ##15%## for ballistic vests.",
		["menu_deck6_3_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_5_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.\n\nYour armor is increased by an additional ##15%## for ballistic vests.",
		["menu_deck6_7_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_9_desc_sc"] = "Your armor is increased by an additional ##20%## for ballistic vests.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYou swap between your weapons ##80%## faster.",
		["menu_deck4_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_5_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYour dodge meter will be filled to ##200%## of its normal maximum when you are revived.",
		["menu_deck4_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_9_desc_sc"] = "Dodging an attack causes you to regenerate ##1## life point every ##2## seconds for the next ##20## seconds. This effect can stack, but all stacks are lost whenever you take health damage.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Hitman--
		["menu_deck5_1_desc_sc"] = "Your armor recovery rate is increased by ##10%##.",
		["menu_deck5_3_desc_sc"] = "Your Akimbo weapons' stability penalty is reduced by ##8.##",
		["menu_deck5_5_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.",
		["menu_deck5_7_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.",
		["menu_deck5_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##5%##.\n\nYour Akimbo weapons' stability penalty is reduced by an additional ##12.##\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",
		
		["menu_deck2_1_desc_sc"] = "You gain ##10%## more health.",
		["menu_deck2_3_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_5_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_7_desc_sc"] = "You can now use light machine guns and submachine guns to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.",
		["menu_deck2_9_desc_sc"] = "You gain an additional ##10%## more health.\n\nYou gain ##25%## of your maximum health when getting up.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		["menu_deck1_3_desc_sc"] = "You and your crew's stamina is increased by ##50%##.\n\nIncreases your shout distance by ##25%##.\n\nNote: Crew perks do not stack.",
		["menu_deck1_5_desc_sc"] = "You gain ##10%## more health.\n\nYour crew gains ##5%## more health.\n\nNote: Crew perks do not stack.",
		["menu_deck1_7_desc_sc"] = "You gain ##15%## more armor.\n\nYour crew gains ##5%## more armor.\n\nNote: Crew perks do not stack.",
		["menu_deck1_9_desc_sc"] = "You gain ##5%## more health.\n\nYou and your crew gains ##2.5%## max health and ##10%## stamina for each hostage up to ##4## times.\n\nNote: Crew perks do not stack.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "You gain ##10%## more armor.",
		["menu_deck3_3_desc_sc"] = "You gain an additional ##10%## more armor.",
		["menu_deck3_5_desc_sc"] = "You gain an additional ##5%## more armor.",
		["menu_deck3_7_desc_sc"] = "Your armor recovery rate is increased by ##10%##.",
		["menu_deck3_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour dodge meter fills up by ##5%## of your dodge every second while crouching.",
		["menu_deck7_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYou bag corpses ##20%## faster.",
		["menu_deck7_5_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYou pick locks ##20%## faster.\n\nYour dodge meter fills up by an additional ##5%## of your dodge every second while crouching.",
		["menu_deck7_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYou answer pagers ##10%## faster.",
		["menu_deck7_9_desc_sc"] = "Your armor recovery rate is increased by ##10%##.\n\nYou gain a ##10%## boost in your movement speed when crouching.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Ammo supplies you pick up also yield medical supplies and heals you for ##6## to ##10## health.\n\nCannot occur more than once every ##5## seconds.",
		["menu_deck10_3_desc_sc"] = "When you pick up ammo, you trigger an ammo pickup for ##50%## of normal pickup to other players in your team.\n\nCannot occur more than once every ##5## seconds.",
		["menu_deck10_5_desc_sc"] = "When you get healed from picking up ammo packs, your teammates also get healed for ##50%## of the amount.",
		["menu_deck10_7_desc_sc"] = "Increase health gained from ammo packs by an additional ##2##.",
		["menu_deck10_9_desc_sc"] = "Increase health gained from ammo packs by an additional ##2##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "When you are within ##18## meters of an enemy, you receive ##5%## less damage from enemies.",
		["menu_deck8_3_desc_sc"] = "When you are within ##18## meters of an enemy, you receive an additional ##5%## less damage from enemies.",
		["menu_deck8_5_desc_sc"] = "When you are within ##18## meters of an enemy, you receive an additional ##10%## less damage from enemies.\n\nEach successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds and can stack up to ##5## times.",
		["menu_deck8_7_desc_sc"] = "Each successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds and can stack up to ##5## times.",
		["menu_deck8_9_desc_sc"] = "Each successful melee hit heals ##1## life point every ##1.25## seconds for ##10## seconds, this effect can stack up to ##5## times.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sociopath--
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "When you are surrounded by three enemies or more within ##18 meters##, you take ##5%## less damage from enemies.",
		["menu_deck9_3_desc_sc"] = "Killing an enemy regenerates ##25## armor.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_5_desc_sc"] = "Killing an enemy with a melee weapon regenerates ##2%## health.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_7_desc_sc"] = "Killing an enemy within ##18## meters regenerates ##25## armor.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_9_desc_sc"] = "Killing an enemy within ##18## meters has a ##25%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nThis cannot occur more than once every ##2## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Damaging an enemy heals ##1## life point every ##0.5## seconds for ##5## seconds.\n\nThis effect stacks but cannot occur more than once every ##1.5## seconds and only while wearing the ##Flak Jacket##.\n\nYou lose ##70## armor while wearing the Flak Jacket.\n\n##Armor Deflection is disabled while using this perk deck.##",
		["menu_deck11_3_desc_sc"] = "Damaging an enemy now heals ##2## life points every ##0.5## seconds for ##5## seconds.",
		["menu_deck11_5_desc_sc"] = "Damaging an enemy now heals ##3## life points every ##0.5## seconds for ##5## seconds.",
		["menu_deck11_7_desc_sc"] = "Damaging an enemy now heals ##4## life points every ##0.5## seconds for ##5## seconds.",
		["menu_deck11_9_desc_sc"] = "Damaging an enemy now heals ##4## life points every ##0.5## seconds for ##6## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		
		--Open your mind--	
		["menu_deck13_3_desc_sc"] = "Increases the amount of health stored from kills by ##4##.\n\nYour dodge is increased by ##5## points.",	
		["menu_deck13_5_desc_sc"] = "Increases the maximum health that can be stored by ##25%##.",			
		["menu_deck13_7_desc_sc"] = "Increases the amount of health stored from kills by ##4##.\n\nYour dodge is increased by ##5## points.",
		["menu_deck13_9_desc_sc"] = "Killing an enemy speeds up your armor recovery speed depending on your equipped armor. Heavier armors gain a smaller bonus than lighter armors. This bonus is reset whenever your armor recovers.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",	
		
		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "##100%## of damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##300##.\n\nHysteria Stacks:\nYou gain ##1## damage absorption for every ##30## stacks of Hysteria. Hysteria Stacks decay by ##5% + 10## every ##10## seconds.",	
		["menu_deck14_5_desc_sc"] = "Changes the decay of your Hysteria Stacks to ##5% + 5## every ##10## seconds.", 	
		["menu_deck14_7_desc_sc"] = "Changes the damage absorption of your Hysteria Stacks on you and your crew to ##1## damage absorption for every ##25## stacks of Hysteria.",	
		["menu_deck14_9_desc_sc"] = "Damage absorption from Hysteria Stacks on you is increased by ##25%.##\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",	

		--Anarchist--
		["menu_deck15_1_desc_sc"] = "Instead of fully regenerating armor when out of combat, The Anarchist will periodically regenerate armor at a rate equivalent to ##10## armor per second. Heavier armor regenerates more armor per tick, but has a longer delay between ticks.\n\nNote: Skills and perks that increases the armor recovery rate are disabled when using this perk deck.",
		["menu_deck15_3_desc_sc"] = "##50%## of your health is converted into ##45%## armor.",
		["menu_deck15_5_desc_sc"] = "##50%## of your health is converted into ##60%## armor.",
		["menu_deck15_7_desc_sc"] = "##50%## of your health is converted into ##75%## armor.",
		["menu_deck15_9_desc_sc"] = "Dealing damage will grant you armor - This can only occur once every ##3## seconds. Heavier armors are granted more armor.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Unlocks and equips the Kingpin Injector. Changing to another perk deck will make the Injector unavailable again. The Injector replaces your current throwable, is equipped in your throwable slot and can be switched out if desired.\n\nWhile in game you can use the throwable key to activate the injector. Activating the injector will heal you for ##50%## of all damage taken for ##4## seconds.\n\nYou can still take damage during the effect. The Injector can only be used once every ##30## seconds.",
		["menu_deck17_3_desc_sc"] = "You are now healed for ##50%## of all damage taken for ##5## seconds while the Kingpin Injector is active.",
		["menu_deck17_5_desc_sc"] = "You are now healed for ##50%## of all damage taken for ##6## seconds while the Kingpin Injector is active.\n\nEnemies nearby will prefer targeting you, whenever possible, while the Injector is active.",
		["menu_deck17_7_desc_sc"] = "The amount of health received during the Injector effect is increased by ##20%## while below ##25%## health.",
		["menu_deck17_9_desc_sc"] = "For every ##50## points of health gained during the injector effect while at maximum health, the recharge time of the injector is reduced by ##1## second.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nUnlocks and equips the throwable ##Smoke Bomb.##\n\nWhen deployed, the smoke bomb creates a smoke screen that lasts for ##12## seconds. While standing inside the smoke screen, you and your allies regenerate armor ##100%## faster. Any enemies that stand in the smoke will see their accuracy reduced by ##50%##.\n\nThe Smoke Bomb has a ##30## second cooldown, but killing enemies will reduce this cooldown by ##1## second.",
		["menu_deck18_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_5_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_9_desc_sc"] = "Your dodge meter fills up by ##35%## of your dodge every second while you are inside of your smoke screen.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Unlocks and equips the Stoic Hip Flask.\n\n##30%## of damage taken is applied over time (##16## seconds).\n\nYou can use the throwable key to activate the Stoic Hip Flask and immediately negate any damage-over-time.\n\n Whenever damage-over-time is negated, you heal for ##300%## of the remaining damage-over-time. The flask has a ##30## second cooldown.\n\nAll of your ##armor is converted to 40% health.##\n\n##Armor Deflection is disabled while using this perk deck.##",	
		["menu_deck19_3_desc_sc"] = "The cooldown of your flask will be reduced by ##1## second for each enemy you kill.",	
		["menu_deck19_5_desc_sc"] = "After not taking damage for ##5## seconds any remaining damage-over-time will be negated.",
		["menu_deck19_7_desc_sc"] = "When your health is below ##50%##, the cooldown of your flask will be reduced by ##6## seconds for each enemy you kill.",
		["menu_deck19_9_desc_sc"] = "You gain ##25%## of your maximum health when getting up.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "Unlocks and equips the ##Gas Dispenser.##\n\nTo activate the Gas Dispenser you need to look at another allied unit within a ##18## meter radius with clear line of sight and press the throwable key to tag them.\n\nEach enemy you or the tagged unit kills will now heal you for ##15## health and the tagged unit for ##7.5## health.\n\nEnemies you kill will extend the duration by ##2## seconds.\n\nThe effect will last for a duration of ##12## seconds and has a cooldown of ##60## seconds.",
		["menu_deck20_3_desc_sc"] = "Enemies you kill will now reduce the cooldown timer by ##2## seconds.",
		["menu_deck20_5_desc_sc"] = "Each enemy you or the tagged unit kills will now grant you ##0.5## absorption up to a maximum of ##20##.\n\nThis effect will last until the perk deck item goes out of cooldown.",		
		["menu_deck20_7_desc_sc"] = "Each enemy you or the tagged unit kills will now grant you ##1## absorption up to a maximum of ##20##.\n\nThis effect will last until the perk deck item goes out of cooldown.",	
		["menu_deck20_9_desc_sc"] = "Each enemy the tagged unit kills will now reduce your perk deck item cooldown timer by ##2## seconds until you are no longer paired.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		
		--Biker--
		["menu_deck16_1_desc_sc"] = "Every time you or your crew performs a kill you will gain ##1## health and ##1## armor. This cannot occur more than ##5## times every ##10## seconds.",				
		
		--Yakuza--
		["menu_deck12_1_desc_sc"] = "The lower your health, the faster your dodge meter will passively fill up. When your health is below ##50%##, your dodge meter fills by up to ##10%## of your dodge every second.",	
		["menu_deck12_3_desc_sc"] = "The lower your health the more your dodge meter is filled when you kill an enemy. When your health is below ##50%##, your meter fills by up to ##50%## of your dodge.\n\nYour dodge is increased by ##5## points.",
		["menu_deck12_5_desc_sc"] = "The lower your health, the less damage you take. When your health is below ##50%##, you will take up to ##15%## less damage.",
		["menu_deck12_7_desc_sc"] = "The lower your health the more your dodge meter is filled when you kill an enemy in melee. When your health is below ##50%##, your meter fills by up to an additional ##50%## of your dodge.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck12_9_desc_sc"] = "Once per down, if you would be downed, you survive with ##1## life point and you regain ##50## armor.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",	

		--Hacker--
		["menu_deck21_1_desc_sc"] = "Unlocks and equips the ##Pocket ECM Device##.\n\nWhile in game you can use the throwable key to activate the Pocket ECM Device.\n\nActivating the Pocket ECM Device before the alarm is raised will trigger the jamming effect, disabling all electronics and pagers for a ##12## second duration.\n\nActivating the Pocket ECM Device after the alarm is raised will trigger the feedback effect, granting a chance to stun enemies on the map every second for a ##12## second duration.\n\nThe Pocket ECM Device has ##1## charge with a ##80## second cooldown timer, but each kill you perform will shorten the cooldown timer by ##4## seconds.",
		["menu_deck21_3_desc_sc"] = "Your dodge is increased by ##5## points.",
		["menu_deck21_5_desc_sc"] = "Killing an enemy while the feedback effect is active will regenerate ##20## health.",
		["menu_deck21_7_desc_sc"] = "Your armor recovery rate is increased by ##10%##.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck21_9_desc_sc"] = "Crew members killing enemies while the feedback effect is active will regenerate ##10## health.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Blank Deck",
		["menu_st_spec_22"] = "Blank Deck",		
		["menu_st_spec_0_desc"] = "This deck has no benefits at all.",
		["menu_st_spec_00"] = "Wildcard Deck",
		["menu_st_spec_23"] = "Wildcard Deck",				
		["menu_st_spec_00_desc"] = "This deck only has the shared skills.",
		["menu_deck0_1"] = "",
		["menu_deck0_1_desc"] = "",		
	})
end)

end
