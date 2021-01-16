Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Осмотреть игрока",
		["menu_inspect_player_desc"] = "Осмотреть статистику игрока",
		["menu_toggle_one_down_lobbies"] = "Разрешить режим Pro-Job",
		
		--Holdout--
		["menu_cn_skirmish"] = "Скирмиш",
		["menu_skirmish"] = "Скирмиш - столкновение",
		["menu_skirmish_random"] = "Случайная локация",
		["menu_random_skirmish_subtitle"] = "Случайная стартовая локация.\n\nОтсутствую еженедельные награды и стартовые модификаторы.",
		["menu_weekly_skirmish"] = "Точная локация",
		["menu_weekly_skirmish_progress"] = "Пройденные волны, награды при полном прохождении",
		["menu_skirmish_random_briefing"] = "В этом режиме вы окажетесь в случайном СКИРМИШЕ.\n\nСлучайный СКИРМИШ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы получите большое количество денег и опыта за каждую волну, но поражение заберёт все наколпенные награды.\n\nВы проиграете, если вы или любой ваш соратник попадёте под стражу, или если заложник будет освобождён.",
		["menu_weekly_skirmish_desc"] = "В этом режиме вы окажетесь в подготовленном СКИРМИШЕ.\n\nЕженедельный СКИРМИШ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы получите еженедельные награды, а также большое количество денег, опыта и карточек за каждую волну, но поражение заберёт все наколпенные награды.\n\n##Вы проиграете, если вы или любой ваш соратник попадёте под стражу, или если заложник будет освобождён.##",
		["menu_weekly_skirmish_tab_description"] = "Обзор операции",
		["menu_weekly_skirmish_rewards"] = "Количество пройденных волн и награды",
		["hud_skirmish"] = "Скирмиш",
		["hud_weekly_skirmish"] = "Еженедельный скирмиш",
		["heist_contact_skirmish"] = "Скирмиш",
		["menu_skirmish_pick_heist"] = "Компания Джекела доверяет вам эту работу",
		["menu_skirmish_map_selection"] = "Локации",
		["menu_skirmish_selected_briefing"] = "В этом режиме вы можете выбрать любой СКРИМИШ.\n\nСКИРМИШ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы получите большое количество денег, опыта и карточек за каждую волну, но поражение заберёт все наколпенные награды.\n\nВы проиграете, если заложник будет освобождён.",
		["menu_skirmish_selected"] = "Скирмиш",

		--Skirmish Heists--
		["heist_skm_mallcrasher"] = "Торговый центр 'Щит'",
		["heist_skm_mallcrasher_h1"] = "Торговый центр 'Щит'",
		["heist_skm_arena"] = "Стадион 'Монарх'",
		["heist_skm_arena_h1"] = "Стадион 'Монарх'",
		["heist_skm_big2"] = "Банк 'Беневолент'",
		["heist_skm_big2_h1"] = "Банк 'Беневолент'",
		["heist_skm_watchdogs_stage2"] = "Склад 'Альмендия'",
		["heist_skm_watchdogs_stage2_h1"] = "Склад 'Альмендия'",
		["heist_skm_mus"] = "Музей 'Андерсониан'",
		["heist_skm_mus_h1"] = "Музей 'Андерсониан'",
		["heist_skm_run"] = "Жилой район - здание 'Инквелл'",
		["heist_skm_run_h1"] = "Жилой район - здание 'Инквелл'",


		--Heist Breifings--
		["heist_pines_briefing"] = "Место нахождения в такой дальней глуши, что вам надо поторопиться и бежать сломя голову. Найдите пилота. Он должен быть рядом с местом крушения. Мы отправим вертолёт, чтобы эвакуировать его. Пилот должен быть в полной безопасности до тех пор, пока не отправится к нам. И ещё кое-что: Влад говорит, что в самолёте был неплохой товар. Прочешите лес и утащите столько кокаина, сколько сможете. На Рождество деньги лишними не будут\n\nСООБЩЕНИЕ ОТ ДЖЕКЕЛА:\nШум от падения самолёта привлёк внимание находившихся неподалёку наёмников организации REAPER. Сражаться будете не с полицией.",

		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "Раскрытый приклад 'Muldon'",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Набор Bernetti 93t",
		["bm_wp_upg_i_93r_desc"] = "Открывает режим стрельбы очередями по 3 патрона, но увеличивает отдачу.", --still need to do the one for the primary bernetti--

		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Дробинки будут разлетаться горизонтально, а не распыляться.",
		["bm_wp_upg_a_slug_sc"] = "Бронебойная пуля",
		["bm_wp_upg_a_slug_sc_desc"] = "Точные бронебойные пули. Не обладают пробитием.", --Auto/Semi-Auto shotguns--
		["bm_wp_upg_a_slug_heavy_desc_sc"] = "Использует большие точные бронебойные пули, которые пробивают броню, врагов, щиты, титановые щиты и стены.", --For shotguns that can hit Heavy Sniper damage tier--
		["bm_wp_upg_a_explosive_desc_sc"] = "Взрывные пули, которые убивают или оглушают врагов. Не имеют попаданий в голову.",
		["bm_wp_upg_a_custom_desc"] = "Меньше дробинок большего размера, которые наносят повышенный урон, но обладают меньшими надёжностью и боезапасом.\n\nДайльнобойность уменьшена на 25%.",
                ["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Дробинки, прожигающие броню. Имеет шанс поджечь противников вблизи, что наносит 96 урона и может прервать врагов в течение трёх секунд.",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Дробинки, прожигающие броню. Имеет шанс поджечь противников вблизи, что наносит 120 урона и может прервать врагов в течение трёх секунд.",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Дробинки, прожигающие броню. Имеет шанс поджечь противников вблизи, что наносит 180 урона и может прервать врагов в течение трёх секунд.",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Дробинки, прожигающие броню. Имеет шанс поджечь противников вблизи, что наносит 240 урона и может прервать врагов в течение трёх секунд.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Бронебойные дротики, наносящие 96 урона кровотечением.\n\nДальнобойность увеличена на 25%.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "Бронебойные дротики, наносящие 120 урона кровотечением.\n\nДальнобойность увеличена на 25%.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "Бронебойные дротики, наносящие 180 урона кровотечением.\n\nДальнобойность увеличена на 25%.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Бронебойные дротики, наносящие 240 урона кровотечением.\n\nДальнобойность увеличена на 25%.",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "Рукоятка 'AFG'",
		["bm_wp_upg_vg_stubby"] = "Вертикальная рукоятка 'Стабби'",
		["bm_wp_upg_vg_tac"] = "Вертикальная рукоятка 'TAC'",

		["bm_wp_upg_vintage_sc"] = "Винтажный магазин",
		["bm_wp_upg_mil_sc"] = "Армейский магазин",
		["bm_wp_upg_tac_sc"] = "Тактический магазин",

		["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_wp_upg_vintage_desc"] = "",

		--Scorpion (get in-game-name later)--
		["bm_wp_scorpion_m_extended_sc"] = "Двойной магазин",
		["bm_sc_scorpion_double_mag"] = "", --Unsure what this one is?--

		--RPK--
		["bm_wp_rpk_m_ban_sc"] = "Банановый магазин",

		--Buzzsaw--
		["bm_wp_mg42_b_mg34_desc_sc"] = "Уменьшает Скорострельность до 800",

		--Saw--
		["bm_ap_saw_sc_desc"] = "ПРОРЕЗАЕТ БРОНЮ.",
		["bm_ap_saw_blade_sc_desc"] = "Лезвия становятся настолько острыми, что прорезают через броню.",
		["bm_fast_motor_sc_desc"] = "Увеличивает скорость ротации на 15%.",
		["bm_slow_motor_sc_desc"] = "Уменьшает скорость ротации на 15%.",

		--Weapon Sights--
		["bm_wp_upg_o_leupold_desc_sc"] = "Во время прицеливания автоматически помечает специальных противников, а также охранников в стелсе.", --I believe all sights/objects with this effect call this same line, rather than having a unique one. Will need to be decoupled later when we add zoom to all of the sight descriptions.

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_tiny"] = "УВЕЛИЧЕНИЕ 1.1x.",
		["bm_wp_upg_o_small"] = "УВЕЛИЧЕНИЕ 1.2x.",
		["bm_wp_upg_o_cs_desc"] = "УВЕЛИЧЕНИЕ 1.5x.",
		["bm_wp_upg_o_aim"] = "УВЕЛИЧЕНИЕ 2x.",
		["bm_wp_upg_o_med"] = "УВЕЛИЧЕНИЕ 3x.",
		["bm_wp_upg_o_large"] = "УВЕЛИЧЕНИЕ 4x .",
		["bm_wp_upg_o_huge"] = "УВЕЛИЧЕНИЕ 5x.",
		--;)
		["bm_wp_upg_o_overkill"] = "УВЕЛИЧЕНИЕ 6x.",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Выпускает заряд, который разносит огонь в точке поражения. Огонь наносит урон через время и имеет шанс останавливать врагов.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Слабая прожарка",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Удваивает время горения, но наполовину уменьшает его урон.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Уменьшает время горения наполовину, но удваивает урон от него.",
		["bm_ap_flamethrower_sc_desc"] = "Тысячи градусов чистой боли. Как до такого можно было додуматься?\nПРОЖИГАЕТ ЧЕРЕЗ БРОНЮ.", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Двойная порция", -- lol
		["bm_wp_m134_body_upper_light"] = "Лёгкий корпус",
		["bm_wp_upg_a_halfthatkit_desc"] = "Добавляет 10% штраф к скорости при ношении данного оружия.\n\nУвеличивает подбор патронов на 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Добавляет 25% штраф к скорости при ношении данного оружия.\n\nУвеличивает подбор патронов на 50%.",

		--Thanatos--
		["bm_thanatos_sc_desc"] = "Крупнокалиберная винтовка, обычно используется против небольшой техники. Использовать её против органических целей, вероятно, военное преступление.\n\nМОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ, ТИТАНОВЫЕ ЩИТЫ И ТОНКИЕ СТЕНЫ.",

		--Galant--
		["bm_galant_sc_desc"] = "Классическая винтовка времён Второй мировой. Надёжная, точная и быстро перезаряжается.\n\nПерезаряжается быстрее, если магазин пуст.",

		--Kobus 90--
		["bm_wp_p90_body_p90_tan"] = "Бежевый корпус",
		["bm_ap_weapon_mod_sc_desc"] = "ADDS BODY ARMOR PENETRATION, SHIELD PENETRATION, AND WALL PENETRATION.",
		["bm_wp_90_body_boxy"] = "Штурмовой корпус OMNIA",
		["bm_wp_90_body_boxy_desc"] = "Найденный на заброшенном складе корпорации OMNIA, этот корпус совершенно не влияет на функционал или удобность оружия, но его квадратный дизайн приятен глазу.",

		--Raze's Fury--
		["bm_wp_shatters_fury_desc"] = "Мощный револьвер калибра .500 с сильной отдачей. Любимое оружие Рейз.\nМОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ И НЕБОЛЬШИЕ СТЕНЫ.",

		--OICW--
		["bm_w_osipr_desc_pc"] = "Военная технология нового поколения. Снаряжён 20мм гранатомётом.\nНажмите $BTN_BIPOD, чтобы переключиться на гранатомёт.",
		["bm_w_osipr_desc"] = "Военная технология нового поколения. Снаряжён 20мм гранатомётом.\nУдерживайте $BTN_BIPOD, чтобы переключиться на гранатомёт.",

		--socom deez nuts--
		["bm_w_socom_desc"] = "Любимое оружие Джекела. Надёжный и мощный пистолет под .45ACP со стильным дизайном.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "Особенный АК, который продемонстрировал свою кровожадность как на войне, так и на ограблениях.",
		["bm_wskn_deagle_bling_desc_sc"] = "Вручную собранный Deagle, сделанный в дань уважения сумасшедшему стрелку, который тренировался в компьютерных играх.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "Нет модификатора",
		["bm_wp_upg_bonus_sc_none_desc"] = "ИСПОЛЬЗУЙТЕ, ЧТОБЫ УБРАТЬ БОНУСЫ, ПОЛУЧЕННЫЕ ОТ СКИНОВ.",

		--Little Friend--
		["bm_m203_weapon_sc_desc_pc"] = "Нажмите $BTN_BIPOD чтобы переключиться на подствольный гранатомёт.",
		["bm_m203_weapon_sc_desc"] = "Удерживайте $BTN_BIPOD чтобы переключиться на подствольный гранатомёт.",

		--Mosin--
		["bm_mosin_sc_desc"] = "Классическая мощная винтовка со скользящим затвором. Это оружие перезаряжается обоймами по 5 патронов.\n\nМОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ И ТОНКИЕ СТЕНЫ",

		--Broomstick--
		["bm_c96_sc_desc"] = "Инновационный немецкий автоматический пистолет. Может вести полностью автоматический огонь с бешеной скоростью, но очень быстро опустошит ваши запасы патронов.\nЭто оружие перезаряжается обоймами по 10 патронов.",

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_ap_weapon_sc_desc"] = "МОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ И ТОНКИЕ СТЕНЫ.",
		["bm_heavy_ap_weapon_sc_desc"] = "МОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ, ТИТАНОВЫЕ ЩИТЫ И ТОНКИЕ СТЕНЫ.",
		["bm_ap_2_weapon_sc_desc"] = "МОЖЕТ ПРОБИВАТЬ БРОНЮ. СТРЕЛЫ МОЖНО ПОДОБРАТЬ ДЛЯ ПОВТОРНОГО ИСПОЛЬЗОВАНИЯ. ЧЕМ ДОЛЬШЕ СТРЕЛА ЗАРЯЖАЕТСЯ, ТЕМ ВЫШЕ БУДЕТ ДАЛЬНОСТЬ.",
		["bm_ap_3_weapon_sc_desc"] = "МОЖЕТ ПРОБИВАТЬ БРОНЮ. СТРЕЛЫ МОЖНО ПОДОБРАТЬ ДЛЯ ПОВТОРНОГО ИСПОЛЬЗОВАНИЯ.",
		["bm_40mm_weapon_sc_desc"] = "Нажмите $BTN_GADGET чтобы воспользоваться прицелом.",
		["bm_rocket_launcher_sc_desc"] = "НОШЕНИЕ ЭТОГО ОРУЖИЯ ЗАМЕДЛИТ ВАШУ СКОРОСТЬ ПЕРЕДВИЖЕНИЯ НА 15%. РАКЕТЫ, ВЫПУЩЕННЫЕ ИЗ ЭТОГО ОРУЖИЯ, МГНОВЕННО УНИЧТОЖАЮТ ТУРЕЛИ.",
		["bm_quake_shotgun_sc_desc"] = "СТРЕЛЯЕТ СРАЗУ С ДВУХ СТВОЛОВ, УДВАИВАЯ КОЛИЧЕСТВО ДРОБИНОК.",
		["bm_hx25_buck_sc_desc"] = "ВЫСТРЕЛИВАЕТ 12 ДРОБИНОК С ШИРОКИМ РАЗБРОСОМ.\n\nРАСЦЕНИВАЕТСЯ НАВЫКАМИ КАК ГРАНАТОМЁТ.",
		["bm_auto_generated_sc_desc"] = "Характеристики этого оружия были сгенерированны автоматически и могут быть несбалансированны, или не отражать идею автора.",
		["bm_auto_generated_ap_sc_desc"] = "Характеристики этого оружия были сгенерированны автоматически и могут быть несбалансированны, или не отражать идею автора.\n\nМОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ И ТОНКИЕ СТЕНЫ.",
		["bm_auto_generated_sap_sc_desc"] = "Характеристики этого оружия были сгенерированны автоматически и могут быть несбалансированны, или не отражать идею автора.\n\nМОЖЕТ ПРОБИВАТЬ БРОНЮ, ЩИТЫ, ТИТАНОВЫЕ ЩИТЫ И ТОНКИЕ СТЕНЫ.",
		["bm_auto_generated_lmg_sc_desc"] = "Характеристики этого оружия были сгенерированны автоматически и могут быть несбалансированны, или не отражать идею автора.\n\nНОШЕНИЕ ЭТОГО ОРУЖИЯ ЗАМЕДЛИТ ВАШУ СКОРОСТЬ ПЕРЕДВИЖЕНИЯ ## на 25%.",
		["bm_auto_generated_mod_sc_desc"] = "Характеристики этого модуля были убраны, так как автоматическая генерация характеристик модулей на данный момент не реализована.",

		--Overhaul Content Indicators--
		["loot_sc"] = "Restoration",
		["loot_sc_desc"] = "ЭТО ПРЕДМЕТ ИЗ RESTORATION!",

		["menu_l_global_value_omnia"] = "OMNIA",
		["menu_l_global_value_omnia_desc"] = "ЭТО ПРЕДМЕТ OMNIA!",

		["menu_rifle"] = "ВИНТОВКИ",
		["menu_jowi"] = "Уик",
		["menu_moving_target_sc"] = "Subtle",

		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",

		["bm_hint_titan_60"] = "The Titandozer leaves in 60 seconds!",
		["bm_hint_titan_10"] = "The Titandozer leaves in 10 seconds!",
		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",

		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",
		["bm_menu_gadget_plural"] = "Гаджеты",
		["menu_pistol_carbine"] = "Pistol Carbine",
		["menu_battle_rifle"] = "Battle Rifle",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
		["bm_melee_katana_info"] = "При игре за Джиро, убийство Клокера полностью заряженной атакой вызовет особую анимацию.",
		["bm_melee_buck_info"] = "Удивительно эффективен против современного оружия.\n\nУменьшает получаемый урон на 10% во время зарядки.", --Buckler Shield
		["bm_melee_cs_info"] = "Рви их в клочья, пока не уничтожишь всех.\n\nНаносит 30 урона каждые 0.25 секунд тому, кто стоит впереди вас во время зарядки. Этот эффект можно улучшить навыками. Не парирует вражеские атаки.", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Вжуууууух.\n\nНаносит 18 урона каждые 0.25 секунд тому, кто стоит впереди вас во время зарядки. Этот эффект можно улучшить навыками. Не парирует вражеские атаки.", --Kazaguruma
		["bm_melee_wing_info"] = "Хорошо подходит к набору маскировки!\n\nНаносит четырёхкратный урон при атаке сзади.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Придуманный для насилия, смертельный как револьвер - это выкидной нож!\n\nНаносит двойной урон при атаке сзади.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Не думаю, что он подойдёт для мяса.\n\nПолностью заряженные удары разносят панику.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "Меч, собранный из кошмаров.\n\nПолностью заряженные удары разносят панику.", -- Headless Dozer Sword
		["bm_melee_nin_info"] = "Стреляет гвоздями, которые мгновенно летят на маленькое расстояние. Считается за оружие ближнего боя.", -- Pounder
		["bm_melee_iceaxe_info"] = "Наносит на 50% больше урона в голову.", -- Icepick
		["bm_melee_mining_pick_info"] = "Наносит на 50% больше урона в голову.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nУбийства, совершенные этим оружием, полностью восстановят выносливость.", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "Пусть копы побреются.\n\nНаносит 120 урона в течение трёх секунд.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "There's no afterlife waiting for my sorry ass... and I'm just here... talking to a fucking baseball bat!\n\nНаносит 120 урона в течение трёх секунд.", --Lucille Baseball Bat
		["bm_melee_cqc_info"] = "Содержит экзотический яд, который наносит 120 урона и имеет шанс прервать врага в течение трёх секунд.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Будь водой, друг мой.\n\nПарирование противника наносит ему 120 урона в ближем бою.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "Ты кто такой, чтобы это делать?\n\nИмеет шанс 5% нанести десятикратные урон и нокдаун.",
		["bm_melee_specialist_info"] = "Теперь в два раза больше лезвий.\n\nНаносит двойной урон после первого удара.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "Специальное оружие для вытаскивания кишок в течение десяти минут.\n\nНаносит на 50% меньше урона в голову, но эффективен для ударов по телу и конечностям.",

		--We assets now--
		["menu_asset_dinner_safe"] = "Сейф",
		["menu_asset_bomb_inside_info"] = "Информация от инсайдера",
		["menu_asset_mad_cyborg_test_subject"] = "Подопытный",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "Костюм-двойка",
		["bm_suit_two_piece_desc_sc"] = "Классический подход к ограблениям. Когда кричишь 'Упали вниз!', почему бы не выглядеть стильно?\n\nС этой опцией персонаж будет носить свой стандартый костюм вне зависимости от ограбления.",

		["bm_suit_loud_suit"] = "Боевой жилет",
		["bm_suit_loud_suit_desc"] = "Костюм для тех, кто не прочь вступить в схватку. Он создан для удобства и в нём легко передвигаться. Отличный выбор для резких набегов на местные ювелирные магазины или секретные базы наёмников.",

		["bm_suit_jackal_track"] = "Особый атрибут",
		["bm_suit_jackal_track_desc"] = "Костюм, сделанный по заказу, с логотипом Джекела и вариацией логотипа ВЕРИТАС.\n\nБадна получила их в немаркированных коробках. Джекет утверждает, что не посылал их, и никогда не видел их раньше.\nНеизвестно, откуда они взялись.\n\n\n\n...Внутри коробок была лишь записка:\n\n''##В ЗНАК БЛАГОДАРНОСТИ, ДЛЯ ТЕХ, КТО ВЕРЕН ДЕЛУ.\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "Утренний грабитель",
		["bm_suit_sunny_desc"] = "Иногда хочется просто закатать рукава и немножко пограбить.",

		["bm_suit_pool"] = "Bodhi's Pool Repair Uniform",
		["bm_suit_pool_desc"] = "Sharp threads for pool repair men...",

		["bm_suit_prison"] = "Тюремный костюм",
		["bm_suit_prison_desc"] = "Вас забрали под стражу!",

		["bm_suit_var_jumpsuit_flecktarn"] = "Флектарн",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "Классический камуфляж, использующийся в двух европейских странах. Известен тем, что позволяет легко слиться с лесным окружением. Точно не будет работать в городе, но в сельской местности может неплохо обмануть зрение.",

		["bm_suit_var_jumpsuit_flatgreen"] = "Вязко-зелёный",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "Этот костюм, по слухам, принадлежал одному из трёх членов банды психопатов и был найден в уничтоженном мусоровозе, который использовался в кровавом ограблении бронетранспорта GenSec, в ходе которого несколько членов SWAT были убиты и многие ранены. Личности этих бандитов до сих пор остаются в тайне, так как большинство улик было уничтожено вместе с мусоровозом - остался только этот костюм.",

		--New menu stats--
		["bm_menu_deflection"] = "Устой-вость",
		["bm_menu_regen_time"] = "Регенерация",
		["bm_menu_swap_speed"] = "Ск. смены",

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_armor_grinding_1"] = "Восстановление брони за раз: $passive_armor_regen",
		["bm_menu_armor_grinding_2"] = "Восстановление брони за раз:: $passive_armor_regen \nВосстановление брони при нанесении урона врагам: $active_armor_regen",

		["bm_menu_armor_max_health_store_1"] = "Максимальное количество запасного здоровья: $health_stored",
		["bm_menu_armor_max_health_store_2"] = "Максимальное количество запасного здоровья: $health_stored \nРегенерация брони при убийстве: $regen_bonus%",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Модификаторы",
		["steam_inventory_stat_boost"] = "Модификатор атрибутов",

		--Safe House--
		["dialog_safehouse_text"] = "Вы ещё не посещали убежище.\n\nСоветуем это сделать, ведь там вас ждёт кое-что новое.\n\nЖелаете туда перейти?",

		["bm_menu_custom_plural"] = "WEAPON ATTACHMENTS IN THE CUSTOM CATEGORY", --unused?--

		----Custom Weapon Mod Descriptions----

		--Is there a reason these have to be down here? If not, I'll move them up with the others (custom weapons in their own section dw)--

		--Triad Chi-Revolver [Custom]--
		["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "Why would you use outdated post-Collision ammunition with Chi-Revolvers? Why the fuck do dogs lick their balls?\nMin and max ammo pickup rate: 1.33x",
		["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "Assblast your enemies through walls, armor, and shields with these rounds.\nEnables armor, shield, and wall piercing at the cost of damage.",
		["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "Chi-fussed hollow rounds stolen from a place of unknown origin. The only thing you need to know is that this shit KICKS hard and the fact that anything on the other end of the barrel is practically vaporized after the gun kicks. Good shit, ain't it?\nThis ammunition is much harder to find in ammo drops.\nEverything else lowered in favor of damage, and pickup rate.\nMin and max ammo pickup rate: 0.33x",

		--DECK-ARD [Custom]--
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "Shoot them so dead they'll die in hell.\nMassive damage at the cost of everything else.\nCapable of piercing through armor, walls and shields.\nThis ammunition is much harder to find in ammo drops.\nMin and max ammo pickup rate: 0.33x",
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "Shoot them dead.\nThis ammunition is substantially easier to find in ammo drops.\nMin and max ammo pickup rate: 1.33x",

		--Unknown Weapon--
		["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "7.62mm Conversion Kit",
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Converts the weapon's caliber to 7.62mm, which slightly decreases firerate and stability in favor of increased damage and accuracy.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "An ammunition type that mimics medium tier rifles. Lowers ammo count and stability in trade for higher damage and accuracy.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "Magwell Grip",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "Extended Magazine",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "Extend-o Magazine",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Converts the Jackal into the Mastiff, something of the younger sister in the Jackal family. Not as stable as the Coyote, and not as deadly as the Jackal, but atleast it fires rounds that can penetrate both armor and walls.",

		--Unknown weapon--
		["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "Open-tipped rounds that, thanks to physics, create larger and more painful wound cavities in their enemies. Although HP rounds are harder to find on enemies and have more recoil, they are thankfully more effective against the head and somewhat more accurate than normal rounds.",
		--Unknown Weapon--
		["bm_menu_weirdmagthing"] = "Magwell Grip",

		--Gecko 7.62--
		["bm_wp_wpn_fps_ass_galil_m_drum"] = "75 Round Drum Magazine",

		--Cavity 9mm--
		["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "Converts to medium pistol tier.\nMin and Max pickup rate: 0.8x",

		--DP-28 [Custom]--
		["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "A tripod with additional ammo mounted on its side.\nReduces movement speed by 20% when equipped.",

		--Arbiter--
		["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "Experimental scope that provides airburst capabilites to the Arbiter.\nIncompatible with incendiary rounds.", --this weapon mod isn't vanilla though iirc--

		--Itachi [Custom]--
		["bm_wp_wpn_fps_upg_bajur_m_pants"] = "NO",
		["bm_wp_wpn_fps_upg_bajur_fg_dmr_desc"] = "Replaces the upper receiver of the Itachi with a .50 Beowulf variant, making the weapon kick a hell of a lot harder, but increasing the size of bulletholes made on law enforcers ten-fold.\n Reduces all stats, except for accuracy and power.",

		--Union 5.56--
		["bm_wp_corgi_b_short"] = "Ствол MSG",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Расставляются/убираются на кнопку $BTN_BIPOD, если место позволяет.\n\nУбирает отдачу.",
		["bm_sc_bipod_desc"] = "Расставляются/убираются на кнопку $BTN_BIPOD, если место позволяет.\n\nУбирает отдачу.",

		--String override for the stungun--
		["bm_melee_taser_info"] = "Устройство, которое бьёт током и оглушает цели при полном заряде.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

		["bm_wp_pis_usp_b_match"] = "Затвор Фримена",
		["bm_wp_1911_m_big"] = "Коробчатый магазин",
		["bm_wp_usp_m_big"] = "Коробчатый магазин",
		["bm_wp_upg_ass_ak_b_zastava"] = "Длинный ствол",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Ствол Вульфа",
		["bm_wp_p90_b_ninja"] = "Ниндзя-ствол",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_lemming"] = "Пистолет 5/7",

		["bm_w_x_judge"] = "Судья & Присяжный", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
		["bm_w_x_shrew"] = "Барри & Пол",
		["bm_w_x_1911"] = "Мустанг & Салли",
		["bm_w_tec9"] = "ПП 'T3K Urban'",
		["bm_w_x_tec9"] = "Парные ПП 'T3K Urban'",

		["bm_wp_mp5_fg_mp5sd"] = "Цевьё агента",
		["bm_wp_hs2000_sl_long"] = "Элитный затвор",
		["bm_wp_vhs_b_sniper"] = "Гипер-ствол",
		["bm_w_r0991"] = "AR-15 Varmint Pistol",
		["bm_wp_vhs_b_silenced"] = "Ствол 'Bad Dragan'",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Красный корпус",
		["bm_wp_g3_b_sniper"] = "Макро-ствол",
		["bm_wp_g3_b_short"] = "Микро-ствол",

		["bm_w_m590"] = "Дробовик Reinbeck 890",
		["bm_w_m590_desc"] = "Наследник самого популярного дробовика банды. От оригинального Reinbeck осталась убойная сила, но дизайн был немного изменён: Его легче заряжать, но он менее стабилен.",
		["bm_w_beck_desc"] = "Самый популярный дробовик в криминальном мире вернулся, чтобы вернуть былую славу. Он использовался в оригинальной волне преступности 2011-го года и доказал свою надёждность в практически любой близкой конфронтации.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Маленький бонус к Скрытности и штраф к Точности/Стабильности",
		["bm_menu_bonus_concealment_p1_mod"] = "Маленький модификатор Скрытности",
		["bm_menu_bonus_concealment_p2"] = "Большой бонус к Скрытности и штраф к Точности/Стабильности",
		["bm_menu_bonus_concealment_p2_mod"] = "Большой модификатор Скрытности",
		["bm_menu_bonus_concealment_p3"] = "Огромный бонус к Скрытности и штраф к Точности/Стабильности",
		["bm_menu_bonus_concealment_p3_mod"] = "Огромный модификатор Скрытности",
		["bm_menu_bonus_spread_p1"] = "Маленький бонус к Точности и штраф к Стабильности",
		["bm_menu_bonus_spread_p1_mod"] = "Маленький модификатор Точности",
		["bm_menu_bonus_spread_n1"] = "Огромный бонус к Стабильности и штраф к Точности",
		["bm_menu_bonus_recoil_p3_mod"] = "Огромный модификатор Стабильности",
		["bm_menu_bonus_recoil_p1"] = "Маленький бонус к Стабильности и штраф к Точности",
		["bm_menu_bonus_recoil_p1_mod"] = "Маленький модификатор Стабильности",
		["bm_menu_bonus_recoil_p2"] = "Большой бонус к Стабильности и штраф к Точности",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+5% опыта для вас и вашей команды, -10% денежной награды для вас и вашей команды",
		["bm_menu_spread"] = "Точность\n",
		["bm_menu_recoil"] = "Стабильность\n",
		["bm_menu_concealment"] = "Скрытность\n",
		["bm_menu_bonus_spread_p2_mod"] = "Большой модификатор скрытности",
		["bm_menu_bonus_spread_p3_mod"] = "Огромный модификатор скрытности",
		["bm_menu_bonus_recoil_p2_mod"] = "Большой модификатор стабильности",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Денежный бонус",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+10% к денежной награды для вас и команды, -5% опыта для вас и команды.",

		["bm_wp_upg_i_singlefire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО ОДИНОЧНУЮ СТРЕЛЬБУ.",
		["bm_wp_upg_i_autofire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО АВТОМАТИЧЕСКУЮ СТРЕЛЬБУ.",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Винтовка Para",
		["bm_w_akmsu"] = "Винтовка Krinkov",
		["bm_w_x_akmsu"] = "Парные винтовки Krinkov",
		["bm_w_hajk"] = "Винтовка CR 805B",

		["menu_akimbo_assault_rifle"] = "Парные винтовки",

		--Throwables--
		["bm_concussion_desc"] = "Количество: 3 \nДальность: 10м \nОглушает врагов на промежуток до 4 секунд \nТочность врагов уменьшается на 50% на 7 секунд \nОглушает всех врагов, кроме Титановых Щитов, Титановых Бульдозеров и Капитанов. \n \nЭто сногсшибательная штучка поразит всех и даст вам лишние секунды чтобы их убить.",
		["bm_grenade_smoke_screen_grenade_desc"] = "Дальность: 8м \nДлительность: 12 секунд \n \nИспользуйте, чтобы испариться в клубе дыма, через который врагам будет сложно попасть по вам.",
		["bm_grenade_frag_desc"] = "Количество: 3\nУрон: 800 \nДальность: 5м \n \nКлассическая осколочная граната. Не требует лишних слов.",
		["bm_dynamite_desc"] = "Количество: 3\nУрон: 800 \nДальность: 4м \nНе отскакивает и не катится после приземления, но наносит меньше урона от взрыва, чем другая взрывчата.\n\nПридуман, чтобы взрывать камень. Вполне подходит чтобы взрывать людей.",
		["bm_grenade_frag_com_desc"] = "Количество: 3 \nУрон: 800 \nДальность: 5м \n \nОбновлённая классическая граната, она придаст каждому взрыву стиль OVERKILL.",
		["bm_grenade_dada_com_desc"] = "Количество: 3 \nУрон: 800 \nДальность: 5м \n \nВнешний вид куклы скрывает её взрывоопасные внутренности. Дань Родине.",
		["bm_grenade_molotov_desc"] = "Количество: 3 \nУрон: 1200 в течение 10 секунд \nДальность: 3.75м \nДлительность: 10 секунд \nДетонирует при попадании \n \nБутылка с огнеопасной жидкостью и горящей тряпкой. Дешёво, просто и крайне эффективно. Спалите всё к чертям.",
		["bm_grenade_fir_com_desc"] = "Количество: 3 \nУрон: 1440 в течение 12 секунд \nДальность: 3.75м \nДлительность: 12 секунд \nВзрывается после 2.5 секунд \n \nСамоподжигающийся фосфорный контейнер. Идеален для отскакивания от стен за угол, к вашим противникам.",
		["bm_wpn_prj_ace_desc"] = "Количество: 9 \nУрон: 240 \n \nМетательные игральные карты с лезвием. Убийственная колода.",
		["bm_wpn_prj_four_desc"] = "Количество: 9 \nУрон: 200 (Попадание) \nУрон: 200 в течение 5 секунд (Яд) \nПрерывает действия противников \n \nУ метательной звезды богатая история, полная крови и битв. Эти смазанные ядом звёздочки несут угрозу всем, кто стоит у вас на пути.",
		["bm_wpn_prj_target_desc"] = "Количество: 9 \nУрон: 240 \n \nОтличный запасной план и надёжная тактика для точного, бесшумного убийства.",
		["bm_wpn_prj_jav_desc"] = "Количество: 6 \nУрон: 360 \n \nКопьё - простое оружие, придуманное ещё в доисторические времена. Простая палка с острым концом, которая испортит кому-нибудь день.",
		["bm_wpn_prj_hur_desc"] = "Количество: 6 \nУрон: 360 \n \nГоворят, заточенный топор никогда не ошибается. Метательный заточенный топор уж тем более.",

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

local r = tweak_data.levels.ai_groups.russia --LevelsTweakData.LevelType.Russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
local z = tweak_data.levels.ai_groups.zombie --LevelsTweakData.LevelType.Zombie
local f = tweak_data.levels.ai_groups.federales
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Идёт штурм наёмников",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЕMHИKOB"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Итдё Плоиецский Шрутм",
			["hud_assault_cover"] = "ОСТВЙТСЬ В УРКЫТИИ...МЯСО",
			["hud_assault_alpha"] = "ПЛОИЕЦСКИЙ ШРУТМ"
		})
	end)
elseif ai_type == f then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Asalto Federal En Marcha",
			["hud_assault_cover"] = "MANTENTE A CUBIERTO",
			["hud_assault_alpha"] = "ASALTO FEDERAL"
		})
	end)
elseif ai_type == m and difficulty_index <= 7 then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Идёт штурм Murkywater",
			["hud_assault_alpha"] = "ШТУРМ MURKYWATER"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Идёт рейд OMNIA",
			["hud_assault_alpha"] = "РЕЙД OMNIA"
		})
	end)
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater

	Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat", function(loc)
		loc:load_localization_file(ModPath .. "lua/sc/loc/hoplibkillfeedcompat.json")
	end)

	if ai_type == murkywetew then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_murkywetew", function(loc)
			-- log("awesome! loaded!")
			loc:load_localization_file(ModPath .. "lua/sc/loc/murkywetew.json")
		end)
	end
 end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "Pro-Job",
		["menu_one_down"] = "Pro-Job",
		["menu_es_pro_job_bonus"] = "Pro-Job",

		["menu_asset_lock_additional_assets_pro"] = "НЕДОСТУПНО В РЕЖИМЕ PRO-JOB!",

		["cn_menu_contract_daypay_header"] = "Дневная плата:",
		["cn_menu_contract_jobpay_header"] = "Плата за контракт:",
		["victory_stage_cash_summary_name_job"] = "Вы получили $stage_cash за прохождение дня, а также дополнительные $job_cash за прохождение контракта.",

		["debug_interact_grenade_crate_take_grenades"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕТАТЕЛЬНОЕ ОРУЖИЕ",
		["debug_interact_bodybags_bag_take_bodybag"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕШКИ ДЛЯ ТРУПОВ",

		["menu_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit"] = "Кейс с метательным оружием",
		["debug_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit_desc"] = "Чтобы использовать кейс с метательным оружием, вам нужно установить его, зажав $BTN_USE_ITEM. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием $BTN_INTERACT, чтобы восполнить запас метательного оружия. Он может быть использован три раза.\n\nВы можете увидеть, сколько ещё раз можно использовать кейс, посмотрев на него.\n\nКейс с метательным оружием это скрытная вещь, используемая солдатами и наёмниками для переноски особого оружия на тяжёлый случай.",

		["bm_equipment_ecm_jammer_desc"] = "Чтобы использовать генератор помех, вам нужно установить его, удерживая $BTN_USE_ITEM. После установки его нельзя переместить.\n\nВы можете переключить режим работы генератора помех при взаимодействии с ним. В этом случае, генератор помех будет оглушать врагов в радиусе 25 метров. Оглушение продолжается 20 секунд, и перезаряжается в течение 4 минут.\n\nГенераторы помех могут взламывать банкоматы и ненадолго отключать электронные устройства - телефоны, камеры и прочие системы безопасности.",
		["bm_equipment_first_aid_kit_desc"] = "Удерживайте кнопку $BTN_USE_ITEM, чтобы установить аптечку. Её нельзя переместить после установки, но можно использовать, зажав кнопку $BTN_INTERACT, чтобы восстановить 100 здоровья. Аптечку первой помощи можно использовать только один раз.\n\nАптечка первой помощи - небольшой ассортимент лечебных средств, используемый в экстренных ситуациях.",
		["bm_equipment_doctor_bag_desc"] = "Чтобы использовать медицинскую сумку, вам нужно установить её, используя $BTN_USE_ITEM. После установки её нельзя переместить, но можно использовать, удерживая $BTN_INTERACT, чтобы восстановить 20% максимального здоровья сразу и 4% максимального здоровья каждые 4 секунды в течение 3 минут. Медицинскую сумку можно использовать 2 раза.\n\nМедицинская сумка - портативный кейс, который используется профессиональными врачами для переноса медикаментов и лекарств.",
		["bm_equipment_sentry_gun_desc"] = "Чтобы использовать турель, вам нужно установить её, зажав $BTN_USE_ITEM. Вы используете 40% вашего запаса патронов на установку. При получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая $BTN_INTERACT. Взятие турели вернёт оставшиеся в ней патроны и починит её. Турели пугают гражданских, заставляя их оставаться на месте.\n\nТруель автоматически наводится и стрелят по целям, которые попадают под её сенсор. Она используется для отвлечения противников от вас и вашей команды.",
		["bm_equipment_sentry_gun_silent_desc"] = "Чтобы использовать турель, вам нужно установить её, зажав $BTN_USE_ITEM. Вы используете 40% вашего запаса патронов на установку. При получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая $BTN_INTERACT. Взятие турели вернёт оставшиеся в ней патроны и починит её.\n\nПриглушённая турель, в отличие от громкой обычной, используется для убйиства врагов, а не отвлечения.",

		["hud_int_hold_take_pardons"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ ПОМИЛОВАНИЕ",
		["debug_interact_gage_assignment_take"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ЗАБРАТЬ ПОСЫЛКУ ГЕЙДЖА",

		["far_repair_sentry_macro"] = "Турель критически повреждена - требуется ремонт.",
		["fixing_sentry_macro"] = "Прогресс ремонта: $AMMO_LEFT%",
		--Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
		["repair_sentry_macro"] = " чтобы начать авто-починку турели",
		["pickup_sentry_macro"] = " чтобы забрать турель.\n$AMMO_LEFT патронов осталось. ", --Gets % health remaining appended to the end.
		["firemode_sentry_macro"] = " чтобы сменить режим стрельбы.\n$AMMO_LEFT патронов осталось.",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", --$AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "Турель чинится...",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "ЖАЖДА СМЕРТИ. ДЛЯ ВАС ГЛАВНОЕ - ЭТО ЭФФЕКТНОСТЬ.",
		["menu_risk_sm_wish"] = "СМЕРТНЫЙ ПРИГОВОР. ПОКАЖИТЕ ИМ, ЧТО ВЫ НЕПОБЕДИМЫ.",

		--Loading Hints--
		--Restoration Gameplay Hints--
		["loading_gameplay_res_title"] = "Restoration - советы об игровом процессе",
		["loading_gameplay_res_1"] = "Клокеры издают сверчащий звук, когда готовятся атаковать. Используйте это для их обнаружения.",
		["loading_gameplay_res_2"] = "Клокеры больше не издают гудящий звук, когда сидят в засаде, а также скрежет при атаке. Обращайте внимание на обстановку - их линзы всегда подсвечены.",
		["loading_gameplay_res_3"] = "На Смертном приговоре, противники будут фокусировать вас, если вы начнёте перезаряжаться. Убедитесь, что вы в укрытии или далеко от врагов. В некоторых случаях лучше переключиться на второстепенное оружие, особенно если это пистолет.",
		["loading_gameplay_res_4"] = "Тазеры теперь не перезаряжают ваше оружие. Старайтесь по возможности держать магазины полностью заряженными, или переключайтесь на второстепенное оружие, если вас атакует Тазер.",
		["loading_gameplay_res_5"] = "Клокеры активно атакуют одиноких грабителей, поэтому держитесь вместе или будьте пойманы поодиночке.",
		["loading_gameplay_res_6"] = "Клокеры наносят урон напрямую здоровью, когда атакуют пинком. Этот урон можно уменьшить, используя Deflection или навык 'Контрудар'.",
		["loading_gameplay_res_7"] = "Зелёные Бульдозеры пытаются обойти игроков, чтобы забежать в тыл, атаковать, а затем убежать обратно. Не позволяйте им заставать вас врасплох.",
		["loading_gameplay_res_8"] = "Чёрные Бульдозеры (Бульдозеры с Сайгой) чрезвычайно агрессивны и будут идти напролом. Это делает их предсказуемыми, но крайне опасными, если вы неподготовлены.",
		["loading_gameplay_res_9"] = "Дозеры с пулемётами/Скаллдозеры в основном ведут огонь поддержки, но в определённых ситуациях могут пойти в атаку - остерегайтесь их очень высокого урона.",
		["loading_gameplay_res_10"] = "Дозеры с дробовиками Бенелли (Бенелли Дозеры) заменяют Дозеров с миниганами. Они появляются только в Серии ограблений, а также вместе с Капитаном Спрингом на Смертном приговоре. Они очень, очень опасны.",
		["loading_gameplay_res_11"] = "Все Дозеры фокусируют игроков, которые перезаряжаются.",
		["loading_gameplay_res_12"] = "На Смертном приговоре, Бульдозеры впадают в ярость, когда их стекло сломано, что увеличивает их урон на 15%.",
		["loading_gameplay_res_13"] = "Клокеры издают свой известный клич, если собираются произвести удар ногой в прыжке - отходите в сторону, если слышите его.",
		["loading_gameplay_res_14"] = "Удар ногой в прыжке от Клокеров закует вас в наручники вместо падения.",
		["loading_gameplay_res_15"] = "Светошумовые гранаты не могут быть сломаны на Смертном приговоре. Your opinion, my choice.",
		["loading_gameplay_res_16"] = "Атаки в ближнем бою можно парировать, если достать оружие ближнего боя. Навык 'Контрудар' также позволяет парировать Клокеров.",
		["loading_gameplay_res_17"] = "Атаки противников в ближнем бою гораздо более эффективны, чем раньше. Не ожидайте, что легко пробежите через толпу.",
		["loading_gameplay_res_18"] = "Что гораздо эффективнее, чем бить врагов бейсбольной битой? Бить их по голове для дополнительного урона.",
		["loading_gameplay_res_19"] = "Снайперу требуется короткий промежуток времени, чтобы прицелиться, прежде чем он выстрелит. Если звук приглушается - значит, в вас целятся.",
		["loading_gameplay_res_20"] = "Клокеры также могут атаковать ногой ваших Джокеров.",
		["loading_gameplay_res_21"] = "Обычные противники используют разнообразное вооружение. Определить, кто использует какое оружие, помогают детали на их униформах.",
		["loading_gameplay_res_22"] = "Противники с дробовиками смертоносны. Если у вас мало брони, они могут ликвидировать вас двумя выстрелами в упор. Однако у них крайне низкая дальнобойность.",
		["loading_gameplay_res_23"] = "На высоких сложностях, противники попытаются прятаться за Щитами.",
		["loading_gameplay_res_24"] = "На высоких сложностях, противники действуют хитрее и непредсказуемее.",
		["loading_gameplay_res_25"] = "'Смертный приговор' был полностью переработан по сравнению с ванильной игрой, чтобы сделать его сложным, но честным. Больше информации в Гайде.",
		["loading_gameplay_res_26"] = "Pro Job - режим, который запрещает покупать активы со снаряжением, включает огонь по своим и может вызвать Точку невозврата в финале ограбления, во время которой к врагам присоединятся усиленные отряды Браво.",
		["loading_gameplay_res_27"] = "В Restoration Mod присутствуют разные фракции врагов, например, наёмники Murkywater и полиция разных штатов. Они функционируют одинаково, но добавляют больше стиля ограблениям, которые происходят не в Вашингтоне.",
		["loading_gameplay_res_28"] = "Клокеры бросают дымовую завесу перед атакой. ",
		--New Units Hints
	        ["loading_new_units_res_title"] = "Restoration - советы о новых противниках",
		["loading_new_units_res_1"] = "Титановые HRT (агенты по спасению заложников) - сверхбыстрые противники, которые незаметно освобождают заложников и уносят сумки с добычей. При смерти они выронят гранату со слезоточивым газом, если убить их не в голову или не в ближнем бою.",
		["loading_new_units_res_2"] = "LPF получает больше урона от оружия ближнего боя.",
		["loading_new_units_res_3"] = "Слабые противники получают дополнительное здоровье от LPF. В этом случае они помечаются фиолетовым цветом. Они всегда переживут как минимум один выстрел.",
		["loading_new_units_res_4"] = "Титановые Клокеры обладают продвинутой экипировкой, которая делает их практически невидимыми, но издаёт такие же звуки, как экипировка стандартных Клокеров. Держите ухо востро.",
		["loading_new_units_res_5"] = "Титановые Дозеры избегают прямых конфронтаций и предпочитают вести огонь на подавление с безопасного расстояния.",
		["loading_new_units_res_6"] = "Титановые Снайперы не имеют высокого урона и пробития брони, как у их стандартных  соратников, зато могут передвигаться и обладают высокой скоростью стрельбы.",
		["loading_new_units_res_7"] = "Вместо лазеров, Титановые Снайперы используют фиолетовые трассеры.  Используйте их для обнаружения.",
		["loading_new_units_res_8"] = "Титановые щиты можно пробить только снайперской винтовкой Thanatos, пилой OVE9000 (с навыком 'Рвать и метать') и особыми бронебойными патронами у турелей.",
		["loading_new_units_res_9"] = "Капитан Спринг и Титановые Дозеры всегда получают дополнительный урон в голову.",
		["loading_new_units_res_10"] = "Титановые Тазеры используют электрические боеприпасы, которые ненадолго замедляют вас. Экран засветится синим, если он выстрелит в вас.",
		["loading_new_units_res_11"] = "Копы-ветераны обладают рефлексами, которые ограничивают количество урона, получаемое ими за один выстрел. Не ограничиваются ближний бой, огненное оружие и взрывчатка. Также можете использовать оружие с высокой скоростью стрельбы.",
		["loading_new_units_res_12"] = "Копы-ветераны много перекатываются и прыгают, чтобы по ним было сложнее попасть. Помимо этого, они часто используют дымовые завесы. ",
		["loading_new_units_res_13"] = "Титановый SWAT обладает небольшим сопротивлением к урону в ближнем бою, но он всё равно отлично подходит для добивания.",
		["loading_new_units_res_14"] = "Титановый SWAT нельзя взять в заложники или переманить на свою сторону. ",
		["loading_new_units_res_15"] = "Титановый SWAT используют пулемёты и автоматические дробовики. Они представляют серьёзную угрозу.",
		["loading_new_units_res_16"] = "Отряды Браво появляются только в режиме Pro Job, во время Точки невозврата. Это опасные противники, обладающие усиленными бронежилетами и более мощным оружием.",
		["loading_new_units_res_17"] = "Отряды Браво используют осколочные гранаты. Обращайте внимание на их уникальные звук и эффект.",
		["loading_new_units_res_18"] = "АКАН использует собственных Титановых юнитов, которые выглядят по-другому, но действуют также. Их расцветка и визуальные особенности остались такими же, поэтому отличить их несложно.",
		["loading_new_units_res_19"] = "Гренадёр использует гранаты со слезоточивым газом, которые наносят продолжительный урон игрокам, стоящим в облаке. На 'Смертном приговоре' он вооружён более смертоносным паралитическим газом, который также уменьшает выносливость.",
		--Captain Hints
		["loading_captains_res_title"] = "Restoration - советы о капитанах",
		["loading_captains_res_1"] = "Чтобы победить капитана Саммерса, нужно сначала обезвредить его команду, начиная с Дока. Саммерс будет неубиваем, пока вся его команда жива; остальные двое будут практически неуязвимы, пока жив Док.",
		["loading_captains_res_2"] = "Не лезьте обниматься с Капитаном Саммерсом. Его огнемёт уничтожит вас в считанные секунды; помимо этого, он может парализовать вас шокером.",		
		["loading_captains_res_3"] = "Капитан Спринг выдерживает много урона, но рано или поздно погибнет. Остерегайтесь его гранат и ведите его через карту, ведь он чрезвычайно медленный.",	
		["loading_captains_res_4"] = "Капитан Спринг периодически бросает кластерные осколочные гранаты. Не стойте возле него слишком долго.",
		["loading_captains_res_5"] = "Капитан Спринг может быть опасным, но это компенсируется его низкой скоростью и дальнобойностью.",
		["loading_captains_res_6"] = "Капитан Отем громко смеётся во время своих атак. Используйте это, чтобы обнаружить его.",
		["loading_captains_res_7"] = "В отличие от других капитанов, полиция не анонсирует появление капитана Отема, чтобы не испортить сюрприз.",
		["loading_captains_res_8"] = "Капитан Отем будет постепенно отключать ваше снаряжение, если дать ему оставаться незамеченным продолжительное время. Отключенное снаряжение помечено фиолетовым и будет восстановлено только после смерти Отема.",	
		["loading_captains_res_9"] = "Вряд ли у вас получится победить капитана Отема в кулачном бою. Не стоит пробовать.",	
		["loading_captains_res_10"] = "Капитан Винтерс практически неуязвим к взрывчатке и огню, обладает сильной защитой от пуль, но достаточно слаб в ближнем бою.",	
		["loading_captains_res_11"] = "Щит Капитана Винтерса совершенно невозможно пробить.",
		["loading_captains_res_12"] = "Капитан Винтерс был полностью переделан. Теперь он двигается по карте, подлечивая врагов в большом радиусе от себя и держась с игроками на расстоянии. Отступите, если он где-то спрятался.",
		--Stealth Hints
		["loading_stealth_res_title"] = "Restoration - советы о стелсе",
		["loading_stealth_res_1"] = "Охранники больше не будут сразу поднимать тревогу, если увидят сломанную камеру. Один из охранников придёт осмотреть сломанную камеру, позволяя использовать их в качестве приманки.",	
		["loading_stealth_res_2"] = "Убийство невстревоженных охранников в ближнем бою и доминирование больше не включают пейджер. Убийство охранника в ближнем бою менее чем за секунду после того, как он вас заметил, также не включит пейджер.",
		["loading_stealth_res_3"] = "Убийства охранников в ближнем бою и их доминации хоть и не включают пейджер, но спровоцируют вызов дополнительного отряда охранников и прочие специфические для ограбления события. ",	
		["loading_stealth_res_4"] = "Охранники, не имеющие пейджеров, не увеличивают шкалу подозрения при смерти.",	
		["loading_stealth_res_5"] = "Любое громкое оружие в стелсе имеет расстояние шума в 25 метров.",
		["loading_stealth_res_6"] = "Гражданские падают на землю, когда слышат стрельбу как при громком прохождении, так и стелсе.",	
		["loading_stealth_res_7"] = "Турели заставляют лежать всех гражданских в достаточно высоком радиусе.",
		["loading_stealth_res_8"] = "Когда вы несёте сумку, вас будут замечать с гораздо большей дистанции, а также гораздо быстрее, если вы стоите, бежите или прыгаете. Двигайтесь медленно и вприсядку.",
		["loading_stealth_res_9"] = "Вы можете брать до 4 Генераторов помех вместо 2 из ванильной игры, но их время действия сокращено в два раза. Используйте их для выполнения целей.",
		["loading_stealth_res_10"] = "Оружие с глушителем не издает никакого шума в стелсе.",
		["loading_stealth_res_11"] = "Вы можете взять в заложники до 4 охранников. Это не активирует их пейджеры и не повысит шкалу подозрения; но это произойдёт, если вы их убьёте после доминации.",	
		["loading_stealth_res_12"] = "Большинство событий, которые приводили к мгновенному провалу стелса (засечение камерой, или превышение лимита пейджеров), было убрано или ослаблено. Смотрите в Гайд для более детальной информации.",
		["loading_stealth_res_13"] = "Охранники больше не погибают мгновенно от любого урона, если они не встревожены. Цельтесь в голову или используйте оружие ближнего боя с высоким уроном.",
		["loading_stealth_res_14"] = "Когда шкала подозрения заполнится полностью, у вас будет 60 секунд, прежде чем включится тревога.",	
		["loading_stealth_res_15"] = "Чем выше шкала подозрения, тем быстрее вас замечают охранники. ",	
		["loading_stealth_res_16"] = "Вы можете использовать больше мешков для трупов, чем в ванильной игре, и ещё больше, если находитесь в одиночной игре.",	
		["loading_stealth_res_17"] = "В одиночной игре у вас будет больше стяжек, чтобы компенсировать недостающих игроков. Их количество будет также увеличено от соответствующих навыков.",
		["loading_stealth_res_18"] = "Охранники, убитые из огнестрельного оружия, включат пейджер. Включение пейджеров не увеличит шкалу подозрения, если, конечно, их не игнорировать",
		["loading_stealth_res_19"] = "На высоких сложностях, оператор пейджеров не такой доверчивый. Использование последнего пейджера обозначается особой фразой от оператора.",
		["loading_stealth_res_20"] = "Ответ на пейджер после того, как лимит исчерпан, очень сильно увеличит шкалу подозрения, но это всё равно лучше, чем сбросить или не отвечать вовсе.",
		["loading_stealth_res_21"] = "На высоких сложностях пейджеры требуют быстрой реакции и занимают больше времени на ответ.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "Restoration - советы о снаряжении и навыках",
		["loading_equip_skills_res_1"] = "Дальнобойность дробовиков зависит от Точности - экспериментируйте и выясняйте, что подходит именно вам! Будьте осторожны - низкая точность может оставить вас без возможности убивать Снайперов, попробуйте брать другой тип оружия в качестве вторичного.",
		["loading_equip_skills_res_2"] = "Пистолеты очень быстро достаются, обладают высокой точностью и стабильностью. Они хорошо работают в качестве оружия поддержки, если у вас нет специализации в другом оружии.",
		["loading_equip_skills_res_3"] = "Оружие в Restoration разделено на различные классы со своими плюсами и минусами. Оружие с большим уроном убивает врагов быстрее, но и опустошается так же быстро! ",
		["loading_equip_skills_res_4"] = "Оружие с высоким уроном, как правило, менее скрытно, если у него нет значительных минусов, таких как низкие Точность и Скорострельность. ",
		["loading_equip_skills_res_5"] = "Вульф прокачал Турели - теперь их можно ремонтировать прямо во время боя. Это занимает время, но зато процесс автоматический - вам нужно только запустить его.",	
		["loading_equip_skills_res_6"] = "Если у вас открыты бронебойные патроны для Турелей, вы можете выбрать стандартный тип патронов в меню снаряжения. ",	
		["loading_equip_skills_res_7"] = "Наборы перков предоставляют значительный бонус к урону, и многие из них обладают редкими и ценными лечебными навыками. Прокачивайте их, если собираетесь играть на высоких сложностях.",
		["loading_equip_skills_res_8"] = "Капо, Оружейник, Силовик, Аферист, Шулер и Байкер - это простые и поэтому надёжные наборы перков. Это отличный выбор для нового игрока.",
		["loading_equip_skills_res_9"] = "Киллер (Hitman) был переработан в набор перков, который обладает низкой выживаемостью и надёжностью, но взамен предоставляет возможность получить большое количество 'временного здоровья', чтобы пробиться через сложные ситуации.",
		["loading_equip_skills_res_10"] = "Капо (Crew Chief) - это командный набор перков, который предоставляет небольшие, но полезные бонусы для вас и ваших соратников, и ещё больше бонусов, если вы берёте заложников. Он хорошо сочетается с веткой Командира у Манипулятора.",
		["loading_equip_skills_res_11"] = "Шулер (Gambler) - это командный набор перков, который предоставляет немного здоровья вам и бонусные боеприпасы для ваших товарищей, когда вы подбираете патроны. Хорошо сочетается с навыками, которые дают дополнительные коробки патронов с врагов.",	
		["loading_equip_skills_res_12"] = "Маньяк (Maniac) - это агрессивный и командный набор перков, который понижает повреждения по вам и вашим соратникам, если вы безостановочно наносите урон. Хорошо сочетается с билдами, в которых есть высокий урон и сопротивление урону.",	
		["loading_equip_skills_res_13"] = "Карманный генератор помех Хакера (Hacker) предоставляет лечение и сдерживание толпы всей команде, но долго перезаряжается. Помимо этого, он эффективен в стелсе.",	
		["loading_equip_skills_res_14"] = "Взломщик (Burglar) - набор перков, которые предоставляет небольшие бонусы в стелсе, но в бою слабее, чем другие перки.",	
		["loading_equip_skills_res_15"] = "Вор в законе (Kingpin) - гибкий набор перков. Инъектор можно использовать для самолечения, защиты от большого урона, или отвлечения противников от вашей команды.",	
		["loading_equip_skills_res_16"] = "Убойный тандем (Tag Team) - командный набор перков, который позволяет предоставить большое количество лечения конкретному соратнику, при условии, что вы вдвоём устраняете врагов без остановки.",	
		["loading_equip_skills_res_17"] = "Бронебойные пули на полуавтоматических и автоматических дробовиках не пробивают броню, врагов, стены и щиты.",	
		["loading_equip_skills_res_18"] = "Револьверы Peacemaker и Phoenix .500 могут пробивать врагов, стены и щиты, как снайперские винтовки.",	
		["loading_equip_skills_res_19"] = "Если справа на экране отображается шкала синего цвета - у вас есть Уворот (Dodge). Когда он подсвечивается, вы увернётесь от следующей пули. Для более подробного объяснения механики уворота, используйте Гайд.",	
		["loading_equip_skills_res_20"] = "Чем выше Скрытность оружия, тем быстрее вы его достаёте и убираете.",	
		["loading_equip_skills_res_21"] = "Когда вы достаёте Бензопилу или Казагуруму, они наносят урон противникам впереди вас.",
		["loading_equip_skills_res_22"] = "Нож-бабочка и Выкидной нож наносят огромный урон при атаке со спины.",		
		["loading_equip_skills_res_23"] = "Ледоруб и Золотая лихорадка наносят дополнительный урон в голову, но обладают низкой скоростью атаки.",
		["loading_equip_skills_res_24"] = "Яд наносит небольшой урон, но вызывает рвоту, которая прерывает действия врагов.",
		["loading_equip_skills_res_25"] = "Оглушающие гранаты являются отличным инструментом отвлечения, даже против Бульдозеров.",
		["loading_equip_skills_res_26"] = "Прицеливание значительно увеличивает точность и уменьшает отдачу, даже у пулемётов.",	
		["loading_equip_skills_res_27"] = "Гвоздомёт - оружие ближнего боя с очень высокой дальнобойностью - он бьёт гораздо дальше, чем любое другое оружие ближнего боя.",	
		["loading_equip_skills_res_28"] = "Прокачивайте наборы перков, чтобы открыть Кейс с метательным оружием.",	
		["loading_equip_skills_res_29"] = "Одна коробочка из Кейса с метательным оружием теперь полностью восстанавливает ваш запас метательного оружия.",	
		["loading_equip_skills_res_30"] = "Берегите Пиковый навык Вдохновление (Inspire Ace) для действительно опасной ситуации, ведь он очень долго перезаряжается и требует прямую видимость.",	
		["loading_equip_skills_res_31"] = "Restoration Mod добавляет два дополнительных набора перков: Шаблонный предоставляет только базовые перки, а Пустой не предоставляет перков вообще. Их можно использовать для дополнительной сложности.",
		--Misc Hints
		["loading_misc_res_title"] = "Restoration - прочие подсказки",
		["loading_misc_res_1"] = "Попробуйте новые ограбления из Restoration! Вы можете найти их у заказчика 'Джекел и Рейз', а также ограбление 'Наркопритон' у Влада.",	
		["loading_misc_res_2"] = "У Restoration Mod есть гайд в Steam и на YouTube! В них содержится вся нужная информация о моде. Ссылка в главном меню.",	
		["loading_misc_res_3"] = "У русского сообщества Restoration Mod есть Дискорд-канал! Присоединяйтесь для обсуждений, технической помощи и нахождения игроков. Ссылка в главном меню.",	
		--Trivia Hints
		["loading_fluff_res_title"] = "Restoration - интересные факты",
		["loading_fluff_res_1"] = "OMNIA тратит капитал на восстановление неудачных военных проектов.",	
		["loading_fluff_res_2"] = "Для LPF пиво наливают бесплатно.",	
		["loading_fluff_res_3"] = "LPF и Титановый Снайпер - австралийцы.",	
		["loading_fluff_res_4"] = "Нью-Йоркский Бронко Коп обожает пончики.",	
		["loading_fluff_res_5"] = "Настоящее имя элитного ZEAL SWAT с UMP - Чад.",	
		["loading_fluff_res_6"] = "Глаза Титановых Дозеров светятся благодаря генетической инженерии, экспериментам и боевым наркотикам.",	
		["loading_fluff_res_7"] = "Капитан Спринг - не человек. Хотя говорят, что когда-то он им был.",	
		["loading_fluff_res_8"] = "В Restoration Mod играют только два человека - KLEITON и Tom Blaine.",	
		["loading_fluff_res_9"] = "OMNIA разрабатывала двери, способные выдержать атаку динозавров.",	
		["loading_fluff_res_10"] = "Гренадёр раньше работал в центре дезинфекции.",	
		["loading_fluff_res_11"] = "Вы никогда не видели Титанового Клокера.",
		["loading_fluff_res_12"] = "Omnia — музыкальная группа, сама определяющая свой стиль, как 'неокельтский языческий фолк', основана в Нидерландах и Бельгии. Неизвестно, есть ли у неё связь с организацией OMNIA.",	
		["loading_fluff_res_13"] = "Джекел отказывается рассказывать, из-за какого события он покинул GenSec и начал работать на CrimeNet. Он был крайне им возмущён.",
		["loading_fluff_res_14"] = "ХАХАХАХА.",
		["loading_fluff_res_15"] = "Капитан Саммерс и его команда были бандой из четырёх грабителей, прямо как банда Payday. Теперь они - нападающий отряд, работающий на OMNIA.",
		["loading_fluff_res_16"] = "По официальной версии, Капитан Саммерс и его команда погибли, когда на них обрушилась крыша банка во время ограбления. Это, конечно, утка.",
		["loading_fluff_res_17"] = "Капитан Отем тратит состояние на наручники. ",
		["loading_fluff_res_18"] = "Капитан Саммерс тратит состояние на газ, газ, газ.",
		["loading_fluff_res_19"] = "Капитан Спрингс тратит состояние на патроны и гранаты.",
		["loading_fluff_res_20"] = "Капитан Винтерс тратит состояние на щиты и изоленту.",
		["loading_fluff_res_21"] = "Дивизия Гренадёров тратит состояние на лечение химических ожогов из-за частых инцидентов с огнём по своим.",
		["loading_fluff_res_22"] = "Возможно вы встречались с Капитаном Саммерсом раньше. А возможно и нет.",
		["loading_fluff_res_23"] = "Мексиканская федеральная полиция имеет особый отряд по охоте на чупакабру.",
		["loading_fluff_res_24"] = "Капитаны не умирают, а отправляются под стражу.",
		["loading_fluff_res_25"] = "REAPER предложили 'быструю и жестокую расправу над картелями' по цене дешевле, чем OMNIA - поэтому мексиканская федеральная полиция пополнила состав русскими титановыми юнитами. На самом деле это уловка, чтобы подобраться ближе к операциям OMNIA в Мексике и США.",

		["menu_button_deploy_bipod"] = "СОШКИ/АЛЬТЕРНАТИВНЫЙ ОГОНЬ",
		["skill_stockholm_syndrome_trade"] = "Падение восстановлено!",
		["hint_short_max_pagers"] = "Игнорирование пейджеров сильно увеличит полоску подозрения.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "Вы новый член криминальной элиты, и первое, что вам нужно сделать - обзавестись вещами, которые подтверждают ваш статус.\n\nБОНУСЫ:\nШанс получить предмет с дурной репутацией увеличен с ##0.3%## до ##0.6%##\nПолучаемый опыт увеличен на ##5%##.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "Штурмовик",
		["st_menu_enforcer_armor"] = "Джаггернаут",
		["st_menu_enforcer_ammo"] = "Поддержка",
		["st_menu_technician_auto"] = "Боевой инженер",
		["st_menu_technician_breaching"] = "Перфоратор",
		["st_menu_technician_sentry"] = "Крепость",
		["hud_instruct_mask_on"] = "Нажмите $BTN_USE_ITEM чтобы надеть маску",
		["hud_instruct_mask_on_alpha"] = "Нажмите $BTN_USE_ITEM чтобы надеть маску",

		--Default Suit String
		["bm_suit_none_desc"] = "Это стандартый костюм грабителя с выбранной бронёй. Может измениться с костюма-двойки в зависимости от ограбления!",

		-- Ad Banner Change
		["menu_changelog"] = "Последний чейнджлог",
		["menu_discord"] = "Сервер в Discord",
		["menu_guide"] = "Гайд по моду",
		["menu_captains"] = "Информация о Капитанах",
		["menu_content_updates"] = "Гайд/Поддержка",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "Мутаторы, которые урезают Опыт и Деньги также не будут давать достижения, большинство трофеев и не считаются за прохождение ограбления!",
		["mutator_medidozer_longdesc"] = "Все обычные враги заменены на медиков, все специальные враги заменены на Бульдозеров.",
		["mutator_medicdozers"] = "Дозеры-медики",
		["mutator_medicdozers_desc"] = "Теперь появляются Дозеры-медики.",
		["mutator_medicdozers_longdesc"] = "Каждый раз, когда появляется Бульдозер, есть 50% шанс, что его заменит Бульдозер-медик.\n\nЕсли включен мутатор 'Бульдозеры с полуавтоматическими дробовиками', Бульдозеры-медики будут заменять Чёрныйх Бульдозеров с шансом 33.3%.",

		["mutator_notitans"] = "Сокращение бюджета",
		["mutator_notitans_desc"] = "Отключает Титановых юнитов.",
		["mutator_notitans_longdesc"] = "Любые появления Титановых юнитов отключены.",

		["mutator_mememanonly"] = "ХАХАХА, ОБМАНУЛ ВАС!",
		["mutator_mememanonly_desc"] = "СТРАДАЙ",
		["mutator_mememanonly_longdesc"] = "НЕУБЕЖАТЬНЕСПАСТИСЬПОМОГИТЕ\n\n ВНИМАНИЕ: Может вызвать вылет игры на некоторых картах.",

		["MutatorMoreDonutsPlus"] = "Больше пончиков+",
		["MutatorMoreDonutsPlus_desc"] = "Все обычные враги будут заменены на копа с револьверов Bronco, все особые враги будут заменены на OMNIA LPF.",
		["MutatorMoreDonutsPlus_longdesc"] = "Все обычные враги будут заменены на копа с револьверов Bronco, все особые враги будут заменены на OMNIA LPF. \n\nВНИМАНИЕ: Не стоит играть с этим отвратительным мутатором.",

		["MutatorJungleInferno"] = "Пламенные джунгли",
		["MutatorJungleInferno_desc"] = "Все враги заменены Капитаном Саммерсом.",
		["MutatorJungleInferno_longdesc"] = "Все незаскриптованные враги будут заменены клонами Капитана Саммерса.",

		["mutator_minidozers"] = "Бульдозеры с полуавтоматическими дробовиками",
		["mutator_minidozers_desc"] = "Теперь появляются Бульдозеры с полуавтоматическими дробовиками.",
		["mutator_minidozers_longdesc"] = "Каждый раз, когда появляется Чёрный Бульдозер, есть 50% шанс того, что его заметит Бульдозер с M1014.\n\nЕсли включен мутатор 'Дозеры-медики', Бульдозеры с M1014 будут заменять Чёрных Бульдозеров с шансом 33.3%.",

		["mutator_fatroll"] = "Fat Roll",
		["mutator_fatroll_desc"] = "Задержка на получение урона отключена.",
		["mutator_fatroll_longdesc"] = "Задержка на получение урона для игроков и ботов становится 0.",

		["mutator_zombie_outbreak"] = "Ходячие мертвецы",
		["mutator_zombie_outbreak_desc"] = "Все враги заменены зомби",
		["mutator_zombie_outbreak_longdesc"] = "Мертвые восстали! Заменяет всех врагов на зомби-юнитов.",

		["mutator_faction_override"] = "Enemy Faction Override",
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
		["cn_crime_spree_brief"] = "Серия преступлений - режим, в котором вас предстоит сыграть бесконечную серию ограблений, идущих подряд. С каждым пройденным ограблением, ваши Ранг и Награда буду повышаться! Каждый 20-й и 26-й ранг вам предстоит выбрать модификатор, а каждые 100 рангов повысится уровень риска, что сделает последующие ограбления сложнее. После 600 ранга, задержка на получение урона будет уменьшаться, и среди обычных врагов начнут появляться отряды Браво.\n\n##При игре с друзьями, не забудьте убедиться, что они начали свою Серию преступлений, или они не смогут получать Ранги и Награды.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "Теперь появляется на одного Бульдозера больше.",
		["menu_cs_modifier_medics"] = "Теперь появляется на одного Медика больше.",
		["menu_cs_modifier_no_hurt"] = "Враги на 50% устойчивее к падению.",
		["menu_cs_modifier_dozer_immune"] = "Бульдозеры получают на 50% меньше урона от взрывчатки.",
		["menu_cs_modifier_bravos"] = "Враги получают дополнительный шанс 6.667% стать Браво-юнитами.",
		["menu_cs_modifier_grace"] = "Ваш задержка на получение урона уменьшена на 1/60 секунды.",
		["menu_cs_modifier_letstrygas"] = "Дымовые завесы заменены на слезоточивый газ.",
		["menu_cs_modifier_boomboom"] = "Гренадёры взрываются при смерти.",
		["menu_cs_modifier_friendlyfire"] = "Союзники теперь получают 100% урона по своим.",
		["menu_cs_modifier_dodgethis"] = "Копы-ветераны теперь уворачиваются от всех пуль.",
		["menu_cs_modifier_sniper_aim"] = "Снайперы наводятся на 100% быстрее.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "Все члены SWAT со штурмовыми винтовками получают дополнительный 15% шанс стать элитным юнитом с UMP.",
		["menu_cs_modifier_heavy_sniper"] = "Титановые снайперы и снайперы Браво ведут автоматический огонь на близких расстояниях.",
		["menu_cs_modifier_dozer_medic"] = "Когда появляется Бульдозер, есть шанс, что его заменит Бульдозер-Медик. Бульдозер-Медик считается за Медика и Бульдозера одновременно .",
		["menu_cs_modifier_dozer_minigun"] = "Когда появляется Зелёный или Чёрный Бульдозер, есть шанс, что его заменит Бульдозер с М1014.",
		["menu_cs_modifier_shield_phalanx"] = "Все обычные Щиты получают дополнительный 15% шанс стать Титановыми щитами.",
		["menu_cs_modifier_taser_overcharge"] = "Падение от тазера теперь не имеет задержки.",
		["menu_cs_modifier_dozer_rage"] = "Когда стекло Бульдозера уничтожено, он войдёт в ярость, получая 10% к наносимому урону.",
		["menu_cs_modifier_medic_adrenaline"] = "Все Медики получают дополнительный 15% шанс стать OMNIA LPF.",
		["menu_cs_modifier_cloaker_arrest"] = "Атаки Клокеров в ближнем бою теперь заковывают игроков.",
		["menu_cs_modifier_cloaker_smoke"] = "Клокеры теперь имеют шанс 50% сбросить светошумовую гранату, когда уворачиваются от атак.",
		["menu_cs_modifier_cloaker_tear_gas"] = "Все агенты по спасению заложников получают дополнительный 15% шанс стать Титановыми агентами.",
		["menu_cs_modifier_dozer_lmg"] = "Когда появляется Зелёный или Чёрный Бульдозер, есть шанс, что его заменит Скаллдозер.",

		["bm_menu_skill"] = "Бонусы для команды",

		["menu_crew_interact"] = "Ловкий",
		["menu_crew_interact_desc"] = "Игроки взаимодействуют на 15% быстрее за каждого бота в команде.",

	["menu_crew_inspire"] = "Вдохновление",
        ["menu_crew_inspire_desc"] = "Боты с этим перком могут использовать на вас вдохновление.\n\nОни не могут его использовать чаще чем в 90 секунд. Перезарядка уменьшается на 15 секунд за каждого бота в команде.",

        ["menu_crew_scavenge"] = "Выносливый",
        ["menu_crew_scavenge_desc"] = "Игроки получают 1 падение после каждых трёх штурмов.\n\nЧисло необходимых штурмов убавляется на 1 за каждого бота.",

        ["menu_crew_ai_ap_ammo"] = "Пробитие",
        ["menu_crew_ai_ap_ammo_desc"] = "Ваши боты теперь могут пробивать броню и так же они наносят на 25% больше урона.\n\nЭто позволяет им простреливать через броню и щитов.",

        ["menu_crew_healthy"] = "Подготовка",
        ["menu_crew_healthy_desc"] = "Здоровье игроков увеличено на 30.",

        ["menu_crew_sturdy"] = "Защитник",
        ["menu_crew_sturdy_desc"] = "Броня игроков увеличена на 10%.",

        ["menu_crew_evasive"] = "Отвлекающий манёвр",
        ["menu_crew_evasive_desc"] = "Додж метр игроков заполняется на 3% от их максимального доджа.",

        ["menu_crew_motivated"] = "Тренер",
        ["menu_crew_motivated_desc"] = "Игроки получают на 15 больше выносливости.",

        ["menu_crew_regen"] = "Лекарь",
        ["menu_crew_regen_desc"] = "Игроки лечат 1 очко здоровья каждые 4 секунды.",

        ["menu_crew_quiet"] = "Скрытый",
        ["menu_crew_quiet_desc"] = "Игроки получают на 2 больше скрытности.",

        ["menu_crew_generous"] = "Подарочек",
        ["menu_crew_generous_desc"] = "Игроки получают дополнительное мететальное за каждые 70 убийств.",

        ["menu_crew_eager"] = "Адреналин",
        ["menu_crew_eager_desc"] = "Игроки перезаряжают оружие на 10% быстрее.",

--[[   SKILLTREES   ]]--
	--{

		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "Полевой медик",
			["menu_combat_medic_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете на ##10%## меньше урона во время поднятия напарника в течение ##5## секунд. Данный эффект работает и после помощи напарнику.\n\nПИКОВЫЙ: ##$pro##\nПоднятый Вами напарник получит на ##30%## больше здоровья.",

			--Quick Fix
			["menu_tea_time_beta_sc"] = "Скорая помощь",
			["menu_tea_time_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУвеличивает скорость для установки аптечек первой помощи и медицинских сумок на ##50%.##\n\nПИКОВЫЙ: ##$pro##\nЧлены команды, которые воспользовались вашими аптечками первой помощи, будут получать на  ##50%## меньше урона в течение ##5## секунд.",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "Обезбаливающие",
			["menu_fast_learner_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nНапарники, поднятые вами, получают на  ##25%## меньше урона в течение ##5## секунд.\n\nПИКОВЫЙ: ##$pro##\nНапарники, поднятые вами, получают ещё на ##25%##меньше урона",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "Колеса",
			["menu_tea_cookies_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##3## дополнительных Аптечки первой помощи.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ещё ##3## Аптечки первой помощи.\n\nВаши Аптечки первой помощи используются автоматически, если игрок упадёт в радиусе ##5## метров от аптечки.\n\nЭто может произойти только раз в ##30## секунд, индвивидуально для каждого игрока.\n\nНе работает при использовании Лебединой песни.",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "Боевой врач",
			["menu_medic_2x_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаши медицинские сумки получают ##1## дополнительный заряд.\n\nПИКОВЫЙ: ##$pro##\nТеперь вы можете ставить ##2## медицинские сумки вместо одной.",

			--Inspire
			["menu_inspire_beta_sc"] = "Вдохновление",
			["menu_inspire_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы подимаете напарников на ##50%## быстрее.\n\nКрик на них повысит их скорость перезарядки и передвижения на ##20%## на ##10## секунд.\n\nПИКОВЫЙ: ##$pro##\nВы можете поднять напарника, который находится ##в зоне видимости##, крича на него в радиусе ##9 метров##. Навык срабатывает раз в ##90## секунд.",


			--}

			--[[   CONTROLLER SUBTREE   ]]--
			--{

			--Cable Guy
			["menu_triathlete_beta_sc"] = "Навязанная дружба",
			["menu_triathlete_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКоличество переносимых кабельных стяжек увеличено на ##4##.\n\nПИКОВЫЙ: ##$pro##\nВаш шанс поднять стяжку из пачки патроново увеличен на ##30%.##\n\nКоличество переносимых кабельных стяжек увеличено на  ##3.##",

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "Боязнь клоунов",
			["menu_cable_guy_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nГражданские остаются в страхе на ##50%## дольше.\n\nПИКОВЫЙ: ##$pro##\nУбедительность и дальность вашего запугивания увеличена на ##50%.##",

			--Stockholm Syndrome
			["menu_joker_beta_sc"] = "Стокгольмский синдром",
			["menu_joker_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nГражданские, которых вы связали, теперь не убегают, если их освободили.\n\nПИКОВЫЙ: ##$pro##\nГражданские и джокеры поблизости могут возродить вас при взаимодействии с ними, они так же дадут вам патроны.",

			--Joker
			["menu_stockholm_syndrome_beta_sc"] = "Джокер",
			["menu_stockholm_syndrome_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы можете переманить обычного врага на вашу сторону. Для этого враг должен сдаться. Вы можете перевести только одного врага на свою сторону. Навык работает только после поднятия тревоги.\n\nПИКОВЫЙ: ##$pro##\nВраг, сражающийся на вашей стороне, наносит на ##45%## больше урона.\n\nТеперь вы можете перевести на свою сторону до ##2## полицеских одновременно.",

			--Partners in Crime
			["menu_control_freak_beta_sc"] = "Сообщник",
			["menu_control_freak_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКаждый переведённый на вашу сторону враг увеличивает вашу скорость передвижения на ##5%##.\n\nВраг, сражающийся на вашей стороне, получает на ##50%## меньше урона.\n\nПИКОВЫЙ: ##$pro##\nКаждый переведённый враг увеличивает ваше здоровье на ##15%##.\n\nПереведённый на вашу сторону враг получает ещё на ##30%## меньше урона.",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "Ситуация с заложниками",
			["menu_black_marketeer_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы восстанавливаете ##1## здоровья каждые ##4## секунды за каждого заложника вплоть до ##4##.\n\nПИКОВЫЙ: ##$pro##\nВосстановление здоровья увеличено на ##100%## когда у вас ##4## или более заложников.\n\nПолучаемый урон для вас и вашей команды понижен на ##1## за каждого заложника, до ##4## заложников.\n\nДанный навык не складывается.",


			--}

			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "Лидерство",
			["menu_stable_shot_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПистолеты-пулемёты и пулемёты получают ##4## стабильности.\n\nПИКОВЫЙ: ##$pro##\nВаша стабильность и стабильность вашей команды увеличена на ##4.##",

			--MG Handling
			["menu_scavenger_sc"] = "Пулеметная хватка",
			["menu_scavenger_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУвеличивает точность стрельбы из бедра пистолетов пулемётов и пулемётов на ##20%##\n\nПИКОВЫЙ: ##$pro##\nВы перезаряжаете пистолеты-пулемёты и пулемёты на ##25%## быстрее.",

			--MG Specialist
			["menu_sharpshooter_sc"] = "Пулеметчик",
			["menu_sharpshooter_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nШтраф точности при стрельбе во время движения уменьшен на ##60%## для пистолетов-пулемётов и пулемётов.\n\nУменьшения штрафа на точность зависит от стабильности.\n\nПИКОВЫЙ: ##$pro##\nПистолеты пулемёты и пулемёты стреляют на ##15%## быстрее.\n\nС каждой ##5-ой## пулей, выстреленной из пистолета-пулемёта или пулемёта, вы не теряете 1 патрон из вашего магазина.",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "Шок и трепет",
			["menu_spotter_teamwork_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nРазмеры магазинов вашего оружия увеличены на ##20%.##\n\nВнимание: Не работает на арбалеты, луки, гранатомёты и ракетомёты.\n\nПИКОВЫЙ: ##$pro##\nТеперь вы можете стрелять из бедра с помощью оружия во время спринта.\n\nРазмеры магазинов вашего оружия увеличены на ##30%.##",
			
			--Heavy Impact
			["menu_speedy_reload_sc"] = "Нокаутирующие пули",
			["menu_speedy_reload_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУ пулемётов есть ##40%## шанс сбить врага с ног при использовании сошек.\n\nЭффект не распространяется на капитанов, бульдозеров и щитов.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ##50%## меньше урона при использовании сошек.",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "Хирургическая точность",
			["menu_body_expertise_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаши пули теперь ##пробивают броню.##\n\nПистолеты-пулемёты и пулемёты в автоматическом режиме при попадании в тело наносят ##30%## множителя от попадания в голову.\n\nНе работает на бульдозеров.\n\nПИКОВЫЙ: ##$pro##\nЛюбое оружие в автоматическом режиме наносит по телу ##100%## множителя от попадания в голову.",

			--}
		--}

		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{

			--Underdog--
			["menu_underdog_beta_sc"] = "Шестерка",
			["menu_underdog_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКогда 3 или более врага находятся в ##18## метрах от вас, вы получаете ##10%## бонус к урону на ##7## секунд.\n\nПИКОВЫЙ: ##$pro##\nКогда 3 или более врага находятся в ##18## метрах от вас, вы также получаете на ##10%## меньше урона в течении ##7## секунд.",

			--Shotgun CQB
			["menu_shotgun_cqb_beta_sc"] = "Гладкоствольное искусство",
			["menu_shotgun_cqb_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы прицеливаетесь из дробовиков и огнемётов на ##75%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nДробовики и огнемёты перезаряжаются на ##25%## быстрее.",

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "Ружьевой импульс",
			["menu_shotgun_impact_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nДробовики и огнемёты получают ##4## стабильности.\n\nПИКОВЫЙ: ##$pro##\nДробивики получают ##3## дополнительные дробинки.\n\nНе работает на бронебойные и разрывные пули.",

			--Pigeon Shooting
			["menu_far_away_beta_sc"] = "Охотник на голубей",
			["menu_far_away_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nДробовики и огнемёты получают на ##40%## больше точности при прицеливании.\n\nБонусная точность не увеличивает дальнобойность дробовиков и огнемётов.\n\nПИКОВЫЙ: ##$pro##\nРасстояние стрельбы для дробовиков и огнемётов увеличенно на ##40%## при прицеливании.",

			--Gung Ho
			["menu_close_by_beta_sc"] = "Гунг Хо",
			["menu_close_by_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы можете стрелять из дробовиков и огнемётов от бедра во время бега.\n\nПИКОВЫЙ: ##$pro##\nВаша скорострельность увеличена на ##35%## при стрельбе от бедра из дробовиков с одиночным режимом стрельбы.",

			--Overkill
			["menu_overkill_sc"] = "OVERKILL",
			["menu_overkill_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПосле убийства из дробовика, огнемёта или пилы OVE9000 вы получаете ##50%## увеличение урона на ##2## секунды.\n\nПИКОВЫЙ: ##$pro##\nБонус к урону теперь применяется ко всему оружию и длится ##10## секунд. Навык должен быть активирован использованием дробовика, огнемёта или пилы OVE9000.\n\nНе работает на гранатомёты.\n\nУменьшает время переключения между оружием на ##50%##.",

			--}

			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "Несокрушимый",
			["menu_oppressor_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВражеские удары в ближнем бою отталкивают на ##0.25%## меньше за каждое очко брони.\n\nПИКОВЫЙ: ##$pro##\nУменьшает ослепление от светошумовых гранат на ##50%.##",

			--Die Hard
			["menu_show_of_force_sc"] = "Крепкий орешек",
			["menu_show_of_force_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##5## Устойчивости.\n\nКаждое очко Устойчивости заставляет вас получать на ##1%## меньше урона по здоровью и рассчитывается после всех остальных сопротивлений к урону.\n\nПИКОВЫЙ: ##$pro##\nВы получаете дополнительные ##5## Устойчивости.",

			--Transporter
			["menu_pack_mule_beta_sc"] = "Перевозчик",
			["menu_transporter_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nЗа каждый ##10## очков брони штраф на передвижение с сумкой уменьшается на ##0.5%##.\n\nПИКОВЫЙ: ##$pro##\nТеперь можно бегать с любой сумкой.\n\nШтраф на скорость передвижения с сумкой остаётся.",

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "Больше крови",
			["menu_iron_man_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете на ##15%## больше здоровья.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ещё ##25%## дополнительного здоровья.",

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "В яблочко",
			["menu_prison_wife_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВыстрелы в голову восстанавливают ##5## брони раз в ##3## секунды.\n\nПИКОВЫЙ: ##$pro##\nВыстрелы в голову восстанавливают ещё ##30## брони каждый ##3## секунды.",

			--Iron Man
			["menu_juggernaut_beta_sc"] = "Железный человек",
			["menu_juggernaut_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nОткрывает возможность носить Улучшенный комбинированный тактический бронежилет.\n\nПИКОВЫЙ: ##$pro##\nПри ударе Щитов в ближнем бою, они оттбрасываются от вашей силы.\n\nОгнестрельное оружие получает шанс отбросить Щиты при атаке. Шанс отбрасывания зависит от урона оружия.\n\nВаша броня восстанавливается на ##10%## быстрее.",


			--}

			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{

			--Scavenger
			["menu_scavenging_sc"] = "Мародер",
			["menu_scavenging_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУвеличивает расстояние подбора патронов на ##50%##.\n\nПИКОВЫЙ: ##$pro##\nС каждого ##5-ого## убитого противника выпадет дополнительная коробка патронов.",

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "Свинцовый ливень",
			["menu_ammo_reservoir_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nСумки с патронами дают возможность стрелять без потери патронов до ##5## секунд после использования сумки. Чем больше патронов восстановлено, тем дольше будет эффект.\n\nПИКОВЫЙ: ##$pro##\nДлительность способности увеличена до ##15## секунд.",

			--Specialist Equipment formally Rip and Tear
			["menu_portable_saw_beta_sc"] = "Спецоборудование",
			["menu_portable_saw_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУвеличевает прочность пилы OVE9000 на ##50%.##\n\nПИКОВЫЙ: ##$pro##\nПилы, арбалеты, гранатомёты и ракетомёты перезаряжаются на ##25%## быстрее.",

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "Больше свинца",
			["menu_ammo_2x_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКаждая сумка с патронами даёт на ##200%## больше амуниции.\n\nПИКОВЫЙ: ##$pro##\nВы можете ставить ##2## сумки с патронами вместо одной.",

			--Rip and Tear formally Carbon Blade
			["menu_carbon_blade_beta_sc"] = "Рвать и метать",
			["menu_carbon_blade_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПила OVE9000 теперь распиливает щиты.\n\nПИКОВЫЙ: ##$pro##\nУбийства пилой, арбалетами, луками, гранатомётами и ракетомётами имеют ##50%## шанс посеять панику среди врагов на расстоянии ##10## метров.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.",

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "Вооружен до зубов",
			["menu_bandoliers_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаш общий запас патронов увеличен на ##25%##.\n\nПИКОВЫЙ: ##$pro##\nВы подбираете на ##50%## больше патронов.\n\nВы получаете шанс ##5%## восстановить метательное оружие от коробки патронов. Шанс повышается на ##1%## каждый раз, когда вы подбираете патроны, но не получаете метательное оружие.",

			--}
		--}

		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{

			--Logistician
			["menu_defense_up_beta_sc"] = "Логист",
			["menu_defense_up_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы взаимодействуете с оборудованием на ##25%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nВы и ваша команда взаимодействуете и развёртываете оборудование на ##50%## быстрее.",

			--Nerves of Steel--
			["menu_fast_fire_beta_sc"] = "Стальные нервы",
			["menu_fast_fire_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете возможность ##прицеливаться во время падения.##\n\nПИКОВЫЙ: ##$pro##\nВы получаете на ##50%## меньше урона во время любого взаимодействия.",

			--Engineering
			["menu_eco_sentry_beta_sc"] = "Инженер",
			["menu_eco_sentry_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаши турели получают на ##40%## больше здоровья.\n\nПИКОВЫЙ: ##$pro##\nВаши турели получают на ##60%## больше здоровья.",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "Мастер на все руки",
			["menu_jack_of_all_trades_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы носите на ##50%## больше оборудования.\n\nПИКОВЫЙ: ##$pro##\nВы можете носить с собой второе оборудование. Нажмите клавишу ##'X'## чтобы переключиться между оборудованием.\n\nВторое оборудование содержит на ##50%## меньше использований.",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "Круговая оборона",
			["menu_tower_defense_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nТеперь можно использовать бронебойные патроны на турелях, которые уменьшают их скорострельность на ##66%## и позволяет им пробивать щиты.\n\nПИКОВЫЙ: ##$pro##\nВы можете ставить ##2## турели.\n\nТурели теперь отнимают ##35%## от вашего общего боезапаса при развёртывании.",

			--Bulletproof--
			["menu_iron_man_sc"] = "Пуленепробиваемый",
			["menu_iron_man_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВашу броню теперь нельзя прошить.\n\nПИКОВЫЙ: ##$pro##\nПока ваша броня полностью заполнена, любой полученный урон уменьшится на число, равное ##25%## от вашей максимальной брони.\n\nВаша броня восстанавливается на ##10%## быстрее.",

			--}

			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "Техэксперт",
			["menu_hardware_expert_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы чините дрели и пилы на ##20%## быстрее.\n\nВаша дрель издаёт на ##65%## меньше шума.\n\nПИКОВЫЙ: ##$pro##\nВы чините дрели и пилы на  ##30%## быстрее\n\nВаши дрели и пилы теперь бесшумны. Гражданским и охранникам нужно увидеть дрель или пилу, чтобы поднять тревогу.",

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "Смертельная близость",
			["menu_combat_engineering_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nРадиус взрыва мины увеличен на ##30%.##\n\nПИКОВЫЙ: ##$pro##\nВаши мины наносят на ##50%## больше урона.",

			--Drill Sawgeant
			["menu_drill_expert_beta_sc"] = "Капитан Дрель",
			["menu_drill_expert_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nЭффективность вашей дрели и пилы увеличена на ##10%.##\n\nПИКОВЫЙ: ##$pro##\nЭффективность вашей дрели и пилы увеличена на ещё ##20%.##",

			--Demoman--
			["menu_more_fire_power_sc"] = "Подрывник",
			["menu_more_fire_power_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы теперь носите ##6## кумулятивных зарядов и  ##6## мин.\n\nВы ставите мины и кумулятивные заряды на ##20%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nТеперь вы можете носить ##8## кумулятивных зарядов и ##10## мин.\n\nВы ставите кумулятивные заряди и мины на ##20%## быстрее.",

			--Kickstarter
			["menu_kick_starter_beta_sc"] = "С полпинка",
			["menu_kick_starter_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаши дрели и пилы получают ##30%## шанс автоматически починиться при поломке.\n\nПИКОВЫЙ: ##$pro##\nВы получаете возможность чинить дрели и пилы ударом оружия ближнего боя. У вас есть ##1## попытка сделать это при каждой поломке, с ##50%## шансом.",

			--Fire Trap
			["menu_fire_trap_beta_sc"] = "Огненная ловушка",
			["menu_fire_trap_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаши мины оставляют на месте взрыва огненную ловушку в течение ##10## секунд в радиусе ##7.5## метров.\n\nПИКОВЫЙ: ##$pro##\nДлительность огненной ловушки увеличена на ##20## секунд. Радиус поражения увеличен до ##11.25## метров.",


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

			--Shockproof
			["menu_insulation_beta_sc"] = "Заземленный",
			["menu_insulation_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nШоковая атака Тазера имеет ##15%## шанс отскочить от вас, оглушая Тазера.\n\nПИКОВЫЙ: ##$pro##\nВзаимодействие с вражеским Тазером в течение ##2## секунд после шоковой атаки контр-атакует его, нанося ##50%## урона его здоровью.",


			--}

			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind
			["menu_scavenger_beta_sc"] = "Второе дыхание",
			["menu_scavenger_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКогда ваша броня ломается, ваша скорость увеличивается на ##10%## в течение ##3## секунд.\n\nПИКОВЫЙ: ##$pro##\nКогда ваша броня полностью опустошена, первый выстрел огрушит противника.\n\nЭтот эффект остаётся на ##3## секунды после регенерации брони.",



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
			["menu_perseverance_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКогда ваше здоровье опускается до ##0##, вместо мгновенного падения, вы можете сражаться в течение ##3## секунд, с ##60%## штрафом к скорости.\n\nПИКОВЫЙ: ##$pro##\nВы можете сражаться ещё ##6## секунд.",



			--}

			--[[   BRAWLER SUBTREE   ]]--
			--{

		--Counter-Strike--
			["menu_drop_soap_beta_sc"] = "Контр-удар",
			["menu_drop_soap_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы можете парировать ближние атаки Клокеров, отталкивая их на землю.\n\nВы получаете на ##20%## меньше урона от ударов Клокеров и атак Тазеров.\n\nПИКОВЫЙ: ##$pro##\nДальнобойный урон по вам уменьшен на ##10%##, когда вы достаёте оружие ближнего боя.\n\nВы получаете ещё на ##30%## меньше урона от ударов Клокеров и атак Тазеров.",

			--Bloodthirst--
			["menu_bloodthirst_sc"] = "Кровожадность",
			["menu_bloodthirst_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКогда вы убиваете врага в ближнем бою, вы получаете ##25%## бонус к скорости перезарядки на ##10## секунд.\n\nПИКОВЫЙ: ##$pro##\nКаждое убйиство увеличивает урон следующей атаки в ближнем бою на ##25%##, до максимальных ##100%.##\n\nЭтот эффект обнуляется, когда вы наносите удар в ближнем бою.",


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "Широкие карманы",
		["menu_thick_skin_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУвеличевает скрытность оружия ближнего боя на ##2.##\n\nПИКОВЫЙ: ##$pro##\nУвеличивает броню у баллистических жилетов на ##20.##\n\nУвеличивает скрытность у баллистических жилетов на ##4.##",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "Пригнись и накройся",
		["menu_sprinter_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВаша выносливость восстанавливается на ##25%## раньше и на ##25%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nВаша полоска уворота заполняется на ##10%## вашего уворота каждую секунду, пока вы бежите.\n\nВаша полоска уворота заполняется на ##30%## вашего уворота каждую секунду, пока вы на зиплайне.",

		--Sneaky Bastard--
		["menu_jail_diet_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##1## очко уворота за каждые ##3## очка скрытности ниже ##35## (максимум - ##+10## уворота)\n\nПИКОВЫЙ: ##$pro##\nВы получаете ##1## очко уворота за каждые ##1## очко скрытности ниже ##35## (максимум - ##+10## уворота).\n\nКогда ваша броня ломается, уворот от атаки восстанавливает ##6%## вашего здоровья. Это может произойти только один раз, пока ваша броня снова не сломается.",

		--Sharpshooter--
		["menu_discipline_sc"] = "Меткий стрелок",
		["menu_discipline_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВинтовки получают ##4## стабильности.\n\nПИКОВЫЙ: ##$pro##\nУбийства в голову из винтовок в режиме одиночной стрельбы увеличивают вашу скорострельность на ##20%## в течение ##10## секунд.",

		--Kilmer--
		["menu_heavy_impact_beta_sc"] = "Килмер",
		["menu_heavy_impact_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВинтовки получают ##5## точности.\n\nПИКОВЫЙ: ##$pro##\nВинтовки перезаряжаются на ##25%## быстрее.",

		--Mind Blown, formerly Explosive Headshot--
		["menu_kilmer_sc"] = "Взрыв мозга",
		["menu_kilmer_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВыстрелы в голову из винтовок в режиме одиночной стрельбы наносят ##70%## урона ближайшему врагу в радиусе ##4## метров.\n\nЗа каждые ##7## метров, в которых вы находитесь от врага, эффект перебрасывается на ещё одного врага, до ##4## раз.\n\nПИКОВЫЙ: ##$pro##\nРадиус навыка увеличен на ##1## метр.\n\nЗа каждые ##7## метров, в которых вы находитесь от врага, эффект перебрасывания наносит на ##10%## больше урона, вплоть до ##110%## максимального урона.",

		--Ammo Efficiency--
	    ["menu_single_shot_ammo_return_sc"] = "Эффективный расход",
		["menu_single_shot_ammo_return_desc_sc"] = "БАЗОВЫЙ: ##$basic##\n##3## убийства в голову из винтовок в течение ##8## секунд восстановят ##1## патрон или ##3%## от вашего боезапаса.\n\nПИКОВЫЙ: ##$pro##\nНавык теперь срабатывает после ##2## убийств в голову, а патроны возвращаются прямо в магазин.",

		--Rifleman
		["menu_rifleman_sc"] = "Стрелок",
		["menu_rifleman_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы прицеливаетесь на ##50%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nТочность винтовок повышена на ##30%## во время прицеливания.",

		--Aggressive Reload
		["menu_engineering_beta_sc"] = "Агрессивная перезарядка",
		["menu_engineering_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУбийства в голову из винтовок в режиме одиночной стрельбы увеличивают скорость перезарядки на ##25%## в течение ##10## секунд.\n\nПИКОВЫЙ: ##$pro##\nСкорость перезарядки увеличена на ##50%##, и может быть получена в любом режиме стрельбы.",

		--Cleaner--
		["menu_jail_workout_sc"] = "Чистильщик",
		["menu_jail_workout_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##1## дополнительный мешок для трупов.\n\nВы наносите на ##5%## больше урона особым противникам.\n\nПИКОВЫЙ: ##$pro##\nВы получаете возможность ставить ##2## кейса с мешками для трупов.\n\nВы наносите ещё на ##10%## больше урона особым противникам.",

		--Nimble--
		["menu_cleaner_beta_sc"] = "Ловкач",
		["menu_cleaner_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы взламываете все замки и наручники на ##50%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nВы теперь можете ##бесшумно взламывать сейфы вручную.##",

		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "Шестое чувство",
		["menu_chameleon_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nЕсли вы стоите на месте ##3.5## секунды, все враги в радиусе ##10## метров автоматически отмечаются.\n\nПИКОВЫЙ: ##$pro##\nВы ##получаете доступ ко всем активам 'своего человека'.##",

		--Systems Specialist--
		["menu_second_chances_beta_sc"] = "Системный специалист",
		["menu_second_chances_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nДлительность зацикленных камер увеличена на ##20## секунд.\n\nВы взаимодействуете со всеми компьютерами, электронными замками, камерами и генераторами помех на ##25%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nУвеличивает длительность отметки врагов на ##100%##. Теперь вы можете отмечать особых врагов и охранников просто прицеливаясь на них.\n\nВы взаимодействуете со всеми компьютерами, электронными замками, камерами и генераторами помех ещё на ##50%## быстрее.",

		--ECM Specialist--
		["menu_ecm_booster_beta_sc"] = "Специалист помех",
		["menu_ecm_booster_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nТеперь вы можете использовать ##3## генератора помех вместо двух.\n\nПИКОВЫЙ: ##$pro##\nВы можете ставить ##4## генератора помех вместо трёх.",

		--ECM Overdrive--
		["menu_ecm_2x_beta_sc"] = "Усиленные помехи",
		["menu_ecm_2x_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nГенератор помех теперь ##можно использовать для взлома некоторых электронных замков.##\n\nВремя действия генератора помех увеличена на ##25%.##\n\nПИКОВЫЙ: ##$pro##\nВремя действия генератора помех увеличена на ещё ##25%##.\n\nГенератор помех теперь задерживает пейджеры.",

		--Evasion--
		["menu_awareness_beta_sc"] = "Изворотливый",
		["menu_awareness_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы двигаетесь на ##5%## быстрее.\n\nУрон от падений с высоты уменьшен на ##75%##.\n\nПИКОВЫЙ: ##$pro##\nВы можете перезаряжаться во время бега.",

		--Moving Target--
		["menu_dire_need_beta_sc"] = "Подвижная мишень",
		["menu_dire_need_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы двигаетесь на ##1.5%## быстрее за каждые ##3## очка скрытности ниже ##35##, до макисмальных ##15%## скорости.\n\nПИКОВЫЙ: ##$pro##\nВы двигаетесь на ##1.5%## быстрее за каждое ##1## очко скрытности ниже ##35##, до макисмальных ##15%## скорости.\n\nУбийства со спины восстанавливают ##75%## вашего уворота.",

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "Оптические иллюзии",
		["menu_optic_illusions_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nОружие с глушителем получает ##+1## очко скрытности.\n\nПИКОВЫЙ: ##$pro##\nОружие с глушителем получает ##1## дополнительное очко скрытности.\n\nВы достаёте и убираете оружие с глушителем на ##25%## быстрее.",

		--The Professional--
		["menu_silence_expert_beta_sc"] = "Профессионал",
		["menu_silence_expert_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##5## точности с оружием с глушителем.\n\nПИКОВЫЙ: ##$pro##\nОсобые враги, убитые оружием с глушителем, дают дополнительную коробочку патронов.",

		--Unseen Strike, formally Dire Need--
		["menu_backstab_beta_sc"] = "Удар исподтишка",
		["menu_backstab_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nЕсли вам не наносится урон в течение ##3## секунд, вы получите ##15%## шанс критического попадания, пока по вам не нанесут урон.\n\nКритические попадания наносят ##100%## дополнительного урона.\n\nПИКОВЫЙ: ##$pro##\nКритический шанс теперь остаётся на ##4## секунды после того, как вы получите урон.",

		--Spotter--
		["menu_hitman_beta_sc"] = "На шухере",
		["menu_hitman_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВраги, отмеченные вами, получают на ##15%## больше урона.\n\nПИКОВЫЙ: ##$pro##\nВраги получают на ##30%## больше урона, когда находятся на расстоянии более ##20## метров.",

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "Подлый прием",
		["menu_unseen_strike_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете ##3%## шанс критического попадания за каждые ##3## очка скрытности ниже ##35##, до максимального шанса ##30%.##\n\nКритические попадания наносят ##100%## дополнительного урона.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ##3%## шанс критического попадания за каждое ##1## очко скрытности ниже ##35##, до максимального шанса ##30%.##\n\nВаш шанс критического попадания увеличивается на ##50%## при атаках сзади.",

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "Эквилибриум",
		["menu_equilibrium_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nСтабильность питолетов для вас и вашей команды увеличена на ##4.##\n\nПИКОВЫЙ: ##$pro##\nВы убираете и достаёте пистолеты на ##100%## быстрее.",

		--Gun Nut--
		["menu_dance_instructor_sc"] = "Пистолетный маньяк",
		["menu_dance_instructor_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nСужает разлёт пуль при стрельбе от бедра из пистолетов на ##20%##.\n\nПИКОВЫЙ: ##$pro##\nПистолеты стреляют на ##15%## быстрее.\n\nПистолеты ##теперь пробивают броню.##",

		--Over Pressurized/Gunfighter--
		["menu_gun_fighter_sc"] = "Ковбой",
		["menu_gun_fighter_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПистолеты перезаряжаются на ##5%## быстрее.\n\nШтраф на точность во время стрельбы при передвижении у пистолетов уменьшена на ##40%##.\n\nШтраф на точность при передвижении зависит от стабильности.\n\nПИКОВЫЙ: ##$pro##\nПистолеты перезаряжаются на ##25%## быстрее.",

		--Akimbo--
		["menu_akimbo_skill_sc"] = "Акимбо",
		["menu_akimbo_skill_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПарное оружие получает ##8## стабильности.\n\nПИКОВЫЙ: ##$pro##\nАкимбо оружие получает дополнительные ##8## стабильности и на ##25%## больше запаса патронов.",

		--Desperado--
		["menu_expert_handling_sc"] = "Отчаянный",
		["menu_expert_handling_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКаждое убийство в голову из пистолета даёт ##10%## бонус к точности на ##5## секунд. Этот эффект накладывается до ##5## раз, а длительность обновляется при каждом выстреле в голову.\n\nБонусная точность не увеличивает дальнобойность дробовиков и огнемётов.\n\nПИКОВЫЙ: ##$pro##\nУвеличивает длительность бонуса к точности до ##10## секунд, и любые попадания из пистолета обновляют длительность.",

		--Trigger Happy--
		["menu_trigger_happy_beta_sc"] = "Неудержимый стрелок",
		["menu_trigger_happy_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nКаждый выстрел в голову из пистолета даёт дополнительные ##10%## урона на ##5## секунд. Этот эффект накладывается до ##5## раз, а длительность обновляется при каждом выстреле в голову.\n\nПИКОВЫЙ: ##$pro##\nУвеличивает длительность бонуса к урону до ##10## секунд, и любые попадания из пистолета обновляют длительность.",

		--Running From Death--
		["menu_nine_lives_beta_sc"] = "Бегущий от смерти",
		["menu_nine_lives_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы передвигаетесь на ##25%## быстрее в течение ##10## после поднятия.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ##20%## сопротивление урону на ##10## секунд после поднятия.\n\nВаше оружие автоматически перезаряжается после поднятия.",

		--Undying--
		["menu_running_from_death_beta_sc"] = "Неумирающий",
		["menu_running_from_death_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете на ##100%## больше здоровья при падении.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ещё ##100%## здоровья при падении.\n\nВы можете использовать основное оружие при падении.",

		--What Doesn't Kill You Only Makes You Stronger--
		["menu_what_doesnt_kill_beta_sc"] = "Что тебя не убивает",
		["menu_what_doesnt_kill_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПолучаемый урон уменьшается на ##1## за каждое падение, которое приближает вас к аресту. \n\nПИКОВЫЙ: ##$pro##\nПолучаемый урон уменьшается на ##3## дополнительных очка.",

		--Haunt--
		["menu_haunt_sc"] = "Пугало",
		["menu_haunt_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУбийство врагов ближе ##18## метров имеет ##5%## шанс посеять панику за каждое падение, которое приближает вас к аресту.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nПИКОВЫЙ: ##$pro##\nШанс паники увеличивается на ##15%##.",

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "Мессия",
		["menu_pistol_beta_messiah_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nПри падении, убийство врага позволит вам встать самостоятельно.\n\nУ вас есть только ##1## шанс сделать это, который восстановится при выходе из под ареста.\n\nВы можете упасть ещё ##1## раз прежде, чем попадёте под арест.\n\nПИКОВЫЙ: ##$pro##\nМессию теперь можно использовать сколько угодно раз, но с задержкой в ##120## секунд. Убийства во время падения уменьшают задержку на ##10## секунд.",

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "Боевые искусства",
		["menu_martial_arts_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы получаете на ##50%## меньше урона от всех атак в ближнем бою (из-за тренировок).\n\nПИКОВЫЙ: ##$pro##\nВы на ##50%## чаще оглушаете врагов в ближнем бою (из-за тренировок).",

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "Накачанный",
		["menu_steroids_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nВы атакуете и замахиваетесь оружием ближнего боя на ##20%## быстрее.\n\nПИКОВЫЙ: ##$pro##\nВы атакуете и замахиваетесь оружием ближнего боя ещё на ##30%## быстрее.",

		--Frenzy--
		["menu_wolverine_beta_sc"] = "Неистовый",
		["menu_wolverine_beta_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nУ вас остаётся только ##25%## от максимального здоровья.\n\nВы получаете ##20## Устойчивости но ##больше не можете лечиться##.\n\nКаждое очко Устойчивости заставляет вас получать на ##1%## меньше урона по здоровью и рассчитывается после всех остальных сопротивлений к урону.\n\nПИКОВЫЙ: ##$pro##\nВы получаете ##25## Устойчивости, и лечение уменьшено на ##75%##, а не отключено полностью.",

		--Berserker--
		["menu_frenzy_sc"] = "Берсерк",
		["menu_frenzy_desc_sc"] = "БАЗОВЫЙ: ##$basic##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье ниже ##50%##, вы будете наносить до ##150%## дополнительного урона пилой или оружием ближнего боя.\n\nПИКОВЫЙ: ##$pro##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье меньше ##50%##, вы будете наносить до ##75%## дополнительного урона огнестрельным оружием.",

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Уворот",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Увеличивает урон в голову на ##25%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_4_desc_sc"] = "Вы получаете ##+1## к скрытности.\n\nПри ношении брони ваша скорость штрафуется на ##15%## меньше.\n\nВы получаете на ##45%## больше опыта при выполнении ограблений.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_6_desc_sc"] = "Открывает Кейс с метательным оружием в качестве оборудования. Кейс с метательным оружием используется, чтобы восполнить запас метательного оружия во время ограбления.\n\nУвеличивает ваш подбор патронов до ##125%##.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_8_desc_sc"] = "Увеличивает скорость взаимодействия с сумкой с медикаментами на ##20%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",

		--Crook--
		["menu_deck6_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nПри ношении баллистических жилетов, ваша броня увеличена на ##15%##.",
		["menu_deck6_3_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck6_5_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена ещё на ##15%##.",
		["menu_deck6_7_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck6_9_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена ещё на ##20%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nВы переключаете оружие на ##30%## быстрее.",
		["menu_deck4_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck4_5_desc_sc"] = "Ваша полоска уворота будет заполнена на ##200%## после поднятия.",
		["menu_deck4_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck4_9_desc_sc"] = "Уворот от атаки восстанавливает ##1## очко здоровья каждые ##2## секунды в течение ##20## секунд. Этот эффект может складываться, но бонус потеряется, если вы получите урон по здоровью.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "Ган-фу",
		["menu_deck5_3_sc"] = "Тренированный убийца",
		["menu_deck5_5_sc"] = "Карандашом",
		["menu_deck5_7_sc"] = "Эксперт",

		["menu_deck5_1_desc_sc"] = "Убийство врагов огнестрельным оружием добавляет ##25## запасного здоровья. Вы можете получить до ##75## запасного здоровья.\n\nУбийство врага оружием ближнего боя превращает запасное здоровье во временное здоровье, которое утекает со скоростью ##5## в секунду.\n\nВременное здоровье может превышать ваше максимальное здоровье, но вы не можете иметь больше ##240## временного здоровья за раз.\n\nНавык 'Неистовый' сокращает временное здоровье на ##75%##.",
		["menu_deck5_3_desc_sc"] = "Ваша полоска уворота заполняется на ##100%## при восстановлении брони.\n\nВы получаете ##5## уворота.",
		["menu_deck5_5_desc_sc"] = "Вы можете получить на ##60%## больше запасного здоровья.",
		["menu_deck5_7_desc_sc"] = "Вы получаете ##120## временного здоровья при поднятии.\n\nВы получаете дополнительные ##5## очков уворота.",
		["menu_deck5_9_desc_sc"] = "Пока у вас есть временное здоровье, вы получаете ##20## устойчивости и ##20%## бонус к скорости передвижения.\n\nКаждое очко Устойчивости заставляет вас получать на ##1%## меньше урона по здоровью и рассчитывается после всех остальных сопротивлений к урону.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_deck2_1_desc_sc"] = "Ваше здоровье увеличено на ##10%##.",
		["menu_deck2_3_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.",
		["menu_deck2_5_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.",
		["menu_deck2_7_desc_sc"] = "Каждый выстрел из вашего оружия имеет ##5%## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.",
		["menu_deck2_9_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.\n\nВы получаете на ##25%## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_deck1_3_desc_sc"] = "Выносливость вас и вашей команды увеличена на ##50%##.\n\nРасстояние ваших криков увеличено на ##25%##.\n\nКомандные бонусы не складываются.",
		["menu_deck1_5_desc_sc"] = "Здоровье вас и вашей команды увеличено на ##5%##.\n\nКомандные бонусы не складываются.",
		["menu_deck1_7_desc_sc"] = "Ваша броня увеличена на ##15%##.\n\nБроня вашей команды увеличена на ##5%##.\n\nКомандные бонусы не складываются.",
		["menu_deck1_9_desc_sc"] = "Каждый заложник увеличивает здоровье на ##2.5%## и выносливость на ##10%## для вас и вашей команды, до 4 заложников.\n\nКомандные бонусы не складываются.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "Ваша броня увеличена на ##10%##.",
		["menu_deck3_3_desc_sc"] = "Ваша броня увеличена ещё на ##10%##.",
		["menu_deck3_5_desc_sc"] = "Ваша броня увеличена ещё на ##5%##.",
		["menu_deck3_7_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.",
		["menu_deck3_9_desc_sc"] = "Ваша броня восстанавливается быстрее ещё на ##10%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nВаша полоска уворота заполняется на ##5%## за каждую секунду в приседе.",
		["menu_deck7_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.\n\nВы используете мешки для трупов на ##20%## быстрее.",
		["menu_deck7_5_desc_sc"] = "Вы взламываете замки на ##20%## быстрее.\n\nВаша полоска уворота заполняется ещё на ##5%## за каждую секунду в приседе.",
		["menu_deck7_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.\n\nВы отвечаете на пейджеры на ##10%## быстрее.",
		["menu_deck7_9_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.\n\nВы двигаетесь на ##10%## быстрее в приседе.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Коробки с патронами также дают медикаменты, которые восстанавливают от ##4## до ##8## здоровья.\n\nЭффект происходит раз в ##10## секунд, но каждая подобранная коробка патронов уменьшает эту задержку на ##3##-##5## секунд.",
		["menu_deck10_3_desc_sc"] = "Когда вы лечитесь при помощи коробок с патронами, ваша команда также получает патроны.",
		["menu_deck10_5_desc_sc"] = "Здоровье, получаемое от коробок с патронами, увеличено ещё на ##2##.",
		["menu_deck10_7_desc_sc"] = "Когда вы лечитесь при помощи коробок с патронами, ваша команда также лечится на ##50%## от количества полученного здоровья.",
		["menu_deck10_9_desc_sc"] = "Здоровье, получаемое от коробок с патронами, увеличено ещё на ##2##.\n\nКогда вы лечитесь при помощи коробок с патронами, вы получаете ##30## брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "Когда вы находитель в ##12## метрах от врага, вы получаете на ##5%## меньше урона.",
		["menu_deck8_3_desc_sc"] = "Когда вы находитель в ##12## метрах от врага, вы получаете ещё на ##5%## меньше урона.",
		["menu_deck8_5_desc_sc"] = "Когда вы находитель в ##12## метрах от врага, вы получаете ещё на ##10%## меньше урона.\n\nКаждый успешный удар оружием ближнего боя даёт ##8%## бонус к урону оружия ближнего боя на ##10## секунд, который может складываться до ##5## раз.",
		["menu_deck8_7_desc_sc"] = "Каждый успешный удар оружием ближнего боя даёт ещё ##8%## урона оружию ближнего боя на ##10## секунд.",
		["menu_deck8_9_desc_sc"] = "Каждый успешный удар оружием ближнего боя восстанавливает ##1## очко здоровья каждые ##1.25## секунд на ##10## секунд, этот эффект может складываться до ##5## раз.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sociopath--
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "Когда 3 или более врага находятся в ##18## метрах от вас, вы получаете на ##5%## меньше урона.",
		["menu_deck9_3_desc_sc"] = "Убийство врага восстанавливает ##20## брони.\n\nЭто может происходить только раз в ##3## секунды.",
		["menu_deck9_5_desc_sc"] = "Убийство врага оружием ближнего боя восстанавливает ##5%## здоровья.\n\nЭто может происходить только раз в ##3## секунды.",
		["menu_deck9_7_desc_sc"] = "Убийство врага, находящегося в менее чем ##18## метров от вас, восстанавливает ##20## брони.\n\nЭто может происходить только раз в ##3## секунды.",
		["menu_deck9_9_desc_sc"] = "Убийство врага, находящегося в менее чем ##18## метров от вас, имеет ##25%## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nЭто может происходить только раз в ##2## секунды.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Нанесение урона врагу восстанавливает ##1## очко здоровья каждую секунду в течение ##3## секунд.\n\nЭтот эффект складывается до ##5## раз, но вы не чаще чем раз в ##0.5## секунд и только при ношении ##Противоосколочного жилета##. Нанесение урона при помощи турелей и временного урона (огня или яда) не вызывает эффект.\n\nВы теряете ##80## брони при ношении Противоосколочного жилета.",
		["menu_deck11_3_desc_sc"] = "Эффект теперь восстанавливает на ##1## очко здоровья больше каждую секунду.",
		["menu_deck11_5_desc_sc"] = "Эффект теперь длится ещё ##2## секунды.",
		["menu_deck11_7_desc_sc"] = "Эффект теперь восстанавливает на ##2## очка здоровья больше каждую секунду.",
		["menu_deck11_9_desc_sc"] = "Каждое срабатывание эффекта теперь увеличивает скорость передвижения на ##5%##, до максимальных ##25%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "Когда у вас полная броня, вы получаете ##4## очка запасного здоровья за каждого убитого врага.\n\nКогда ваша броня восстанавливается после полной потери, ваше запасное здоровье превращается в настоящее.\n\nМаксимальное количество запасного здоровья зависит от вашей брони - тяжёлая броня накапливает меньше запасного здоровья, чем лёгкая.",
		["menu_deck13_3_desc_sc"] = "Увеличивает количество накапливаемого здоровья на ##2##.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck13_5_desc_sc"] = "Вы можете накапливать на ##25%## больше здоровья.",
		["menu_deck13_7_desc_sc"] = "Увеличивает количество накапливаемого здоровья на ##2##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck13_9_desc_sc"] = "Убийство врага ускоряет восстановление брони, в зависимости от надетой брони. Тяжёлая броня получает меньший бонус, чем лёгкая. Этот бонус обнуляется при каждом восстановлении брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "Наносимый вами урон переводится в Истерию. Максимальное количество Истерии -  ##2400##.\n\nИстерия:\nПолучаемый урон для вас и вашей команды уменьшается на ##1## очко за каждые ##300## очков Истерии. Истерия уменьшается на ##300## каждые ##8## секунд.",
		["menu_deck14_5_desc_sc"] = "Истерия теперь уменьшается на ##240## каждые ##8## секунд.",
		["menu_deck14_7_desc_sc"] = "Получаемый урон теперь уменьшается на ##1## очко за каждые ##240## очков Истерии.",
		["menu_deck14_9_desc_sc"] = "Очки истерии теперь на ##50%## эффективнее для вас.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Anarchist--
		["menu_deck15_1_desc_sc"] = "Вместо восстановления брони вне боя, Анархист периодически восстанавливает броню с частотой ##8## очков брони в секунду. Тяжёлые бронежилеты восстанавливают больше брони за раз, но делают это реже.\n\nНавыки, увеличивающие скорость восстановления брони, отключены при использовании этого набора.",
		["menu_deck15_3_desc_sc"] = "##50%## вашего здоровья переводится в ##50%## брони.",
		["menu_deck15_5_desc_sc"] = "##50%## вашего здоровья переводится в ##100%## брони.",
		["menu_deck15_7_desc_sc"] = "##50%## вашего здоровья переводится в ##150%## брони.",
		["menu_deck15_9_desc_sc"] = "Нанесение урона восстановит вам часть брони - это может произойти только раз в ##3## секунды. Тяжёлые бронежилеты восстанавливают больше брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Теперь вы можете использовать Инъектор. Переключение на другой набор перков сделает Инъектор недоступным. Инъектор заменяет ваше метательное оружие.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы использовать его. Во время использование Инъектора, вы будете вылечены на ##30%## от любого полученного урона в течение ##4## секунд.\n\nИнъектор можно использовать раз в ##30## секунд.",
		["menu_deck17_3_desc_sc"] = "Ваша скорость увеличена на ##20%## пока действует Инъектор.",
		["menu_deck17_5_desc_sc"] = "Теперь вы будете вылечены на ##30%## от любого полученного урона в течение ##6## секунд после использования Инъектора.\n\nПока действует Инъектор, враги будут держать вас в приоритете.",
		["menu_deck17_7_desc_sc"] = "Количество восстанавливаемого Инъектором здоровья увеличено на ##60%## если у вас меньше ##25%## здоровья.",
		["menu_deck17_9_desc_sc"] = "Пока у вас полное здоровье, за каждые ##5## очков здоровья, полученные во время действия Инъектора, Инъектор восстановится на ##2## секунды быстрее.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nТеперь вы можете использовать ##Дымовую шашку.##\n\nПри броске, дымовая шашка создаёт дымовую завесу на ##12## секунд. Внутри завесы вы и ваша команда восстанавливают броню на ##100%## быстрее. Любые противники, стоящие в дымовой завесе, получает штраф ##75%## к точности.\n\nДымовую завесу можно использовать раз в ##40## секунд, но убийство врага сокращает эту задержку на ##1## секунду.",
		["menu_deck18_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck18_5_desc_sc"] = "Уворот атаки сократит задержку дымовой завесы на ##1## секунду.",
		["menu_deck18_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck18_9_desc_sc"] = "Полоска уворота будет заполняться на ##40%## каждую секунду, в течение которой вы находитесь внутри дымовой завесы.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Теперь вы можете использовать Фляжку.\n\n##30%## получаемого урона будет задержано на ##8## секунд.\n\nВы можете нажать на кнопку метательного оружия, чтобы использовать Фляжку и мгновенно отвергнуть задержанный урон.\n\nКогда вы отвергаете задержанный урон, ##250%## этого урона возвращается вам в качестве здоровья. Фляжку можно использовать раз в ##30## секунд.\n\nВся ваша ##броня превращается в 50% здоровья.##\n\n##Устойчивость отключена при использовании этого набора.##",
		["menu_deck19_3_desc_sc"] = "Задержка Фляжки сокращается на ##1## секунду за каждого убитого врага.",
		["menu_deck19_5_desc_sc"] = "Если вы не получаете урон в течение ##4## секунд, любой задержанный урон будет отвергнут.",
		["menu_deck19_7_desc_sc"] = "Когда у вас меньше ##50%## здоровья, задержка Фляжки сокращается на ##6## секунд за каждого убитого врага.",
		["menu_deck19_9_desc_sc"] = "Вы получаете на ##25%## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "Теперь вы можете использовать ##Парилку.##\n\nЧтобы активировать Парилку, вам нужно смотреть на союзника на расстоянии не более ##18## метров и нажать на кнопку метательного оружия, чтобы отметить его. Между вами и союзником не должно быть препятствий или стен.\n\nКаждый противник, убитый вами или выбранным союзником, восстановит ##15## здоровья вам и ##7.5## здоровья союзнику.\n\nКаждый убитый враг увеличит время эффекта на ##2## секунды.\n\nПарилка длится ##12## секунд и восстанавливается ##60## секунд.",
		["menu_deck20_3_desc_sc"] = "Каждый убитый вами враг сократит задержку Парилки на ##2## секунды.",
		["menu_deck20_5_desc_sc"] = "Каждый убитый вами или выбранным союзником враг уменьшает получаемый урон на ##0.5## очков, до максимальных ##20##.\n\nЭтот эффект продлится, пока Парилка не станет снова доступна для использования.",
		["menu_deck20_7_desc_sc"] = "Каждый убитый вами или выбранным союзником враг уменьшает получаемый урон на дополнительные ##0.5## очков, до максимальных ##20##.\n\nЭтот эффект продлится, пока Парилка не станет снова доступна для использования.",
		["menu_deck20_9_desc_sc"] = "Каждый враг, убитый выбранным союзником, сокращает задержку Парилки на ##2## секунды, пока она действует.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Biker--
		["menu_deck16_1_desc_sc"] = "Каждый раз, когда вы или ваша команда убивают врага, вы восстанавливаете ##2## очка здоровья. Это может произойти только раз в ##2## секунды.",
		["menu_deck16_3_desc_sc"] = "Вы восстанавливаете ##10## брони каждые ##3## секунды.",
		["menu_deck16_5_desc_sc"] = "Каждые потерянные ##25%## брони сокращают задержку на восстановление здоровья на ##0.5## секунд.",
		["menu_deck16_7_desc_sc"] = "Вы восстанавливаете ##20## брони каждые ##2.5## секунды.\n\nУбийство врага оружием ближнего боя мгновенно вызывает этот эффект и активирует следующее восстановление брони на ##1## секунду раньше.",
		["menu_deck16_9_desc_sc"] = "Каждые потерянные ##25%## брони увеличивают количество получаемого здоровья за убийства на ##2## очка.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Yakuza--
		["menu_deck12_1_desc_sc"] = "Чем меньше у вас здоровья, тем быстрее будет восстанавливаться полоска уворота. Когда у вас меньше ##50%## здоровья, полоска уворота будет восстанавливать до ##8%## уворота каждую секунду.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck12_3_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага. Когда у вас меньше ##50%## здоровья, вы получите до ##50%## уворота при убийстве врага.",
		["menu_deck12_5_desc_sc"] = "Чем меньше у вас здоровья, тем меньше урона вы получаете. Когда у вас меньше ##50%## здоровья, вы получаете до ##20%## меньше урона.",
		["menu_deck12_7_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага оружием ближнего боя. Когда у вас меньше ##50%## здоровья, вы получите до ##50%## уворота при убийстве врага.\n\nЭтот эффект сочетается с перком 'татуировка змеи'.",
		["menu_deck12_9_desc_sc"] = "Один раз за падение, если у вас закончится здоровье, вы выживите с ##1## здоровьем и восстановите ##50## брони.\n\nДанный перк не работает на удары Клокеров и шок Тазеров.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Hacker--
		["menu_deck21_1_desc_sc"] = "Теперь вы можете использовать ##Карманный генератор помех##.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы активировать его.\n\nАктивация Карманного генератора помех до тревоги отключит всю электронику и пейджеры на ##12## секунд.\n\nАктивация Карманного генератора помех после тревоги имеет шанс оглушать всех врагов на карте каждую секунду в течение ##12## секунд.\n\nКарманный генератор помех восстанавливается ##80## секунд, но каждое убийство сократит задержку на ##3## секунды.",
		["menu_deck21_3_desc_sc"] = "Ваш уворот увеличен на ##5## очков.",
		["menu_deck21_5_desc_sc"] = "Убийство врага, пока работает Карманный генератор помех восстановит ##20## здоровья.",
		["menu_deck21_7_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck21_9_desc_sc"] = "Союзники восстановят ##10## здоровья, если убьют врага пока работает Карманный генератор помех.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Пустой",
		["menu_st_spec_22"] = "Пустой",
		["menu_st_spec_0_desc"] = "Данный набор совсем не предоставляет перков. Испытайте себя!",
		["menu_st_spec_00"] = "Шаблонный",
		["menu_st_spec_23"] = "Шаблонный",
		["menu_st_spec_00_desc"] = "В этом наборе содержатся только общие перки. Испытайте себя!",
		["menu_deck0_1"] = "",
		["menu_deck0_1_desc"] = "",
	})
end)


-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "Лучшие",
		["menu_es_crew"] = "Командные",
		["menu_es_personal"] = "Личные",
		["menu_es_bad"] = "Плохие",
		["menu_es_other"] = "Прочие",
		["RestorationPDTHHudNeeded"] = "PD:TH HUD REBORN IS REQUIRED!",
		["menu_paygrade"] = "Степень оплаты: ",
		["menu_diffgrade"] = "Сложность: ",
		["menu_utility_radial_menu_name"] = "Utility Radial Menu",
		["menu_utility_radial_menu_desc"] = "Open the Utility Menu",

		["res_credits"] = "Титры Restoration Mod",
		["res_credits_help"] = "Посмотреть титры RESTORATION MOD.",

		["Warning_overhaul_title"] = "WARNING: Game closing to prevent save corruption.",
		["dialog_show_overhaul_dialog"] = "You are DISABLING the Complete Overhaul. It is typically NOT RECOMMENDED to do this, and you should instead REMOVE the mod from your mods folder if you intend not to use the Overhaul actively.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",
		["dialog_enable_overhaul_dialog"] = "You are ENABLING the Complete Overhaul. The Overhaul should typically remain ON at all times, and only be disabled by removing the mod from your mods folder.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",

		["res_saveboost"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ПРОКАЧАТЬСЯ ДО 100 УРОВНЯ",

		["RestorationModOptionsButtonTitleID"] = "Настройки Restoration Mod",
		["RestorationModOptionsButtonDescID"] = "Настройки для Restoration Mod.",
		["RestorationModHUDOptionsButtonTitleID"] = "Настройки интерфейса Restoration Mod",
		["RestorationModHUDOptionsButtonDescID"] = "Настройки интерфейса в Restoration Mod.",
		["RestorationModOTHEROptionsButtonTitleID"] = "Дополнительные настройки Restoration Mod",
		["RestorationModOTHEROptionsButtonDescID"] = "Дополнительные настройки Restoration Mod.",
		["RestorationModUIOptionsButtonTitleID"] = "Alpha UI",
		["RestorationModUIOptionsButtonDescID"] = "Опции Alpha UI.",
		["RestorationModTimeOfDayTitleID"] = "Новые и случайные времена суток",
		["RestorationModTimeOfDayDescID"] = "Позволяет настраивать время суток на некоторых ограблениях.",

		["restoration_level_data_unknown"] = "НЕИЗВЕСТНОЕ ВРЕМЯ, НЕИЗВЕСТНОЕ МЕСТО",
		["RestorationModEnv_BanksTitleID"] = "Ограбление банка",
		["RestorationModEnv_BanksDescID"] = "Выбрать погоду для ограбления банка.",
		["RestorationModEnv_RVD1TitleID"] = "Бешеные псы - день 1",
		["RestorationModEnv_RVD1DescID"] = "Выбрать погоду для ограбления Бешеные псы (день 1).",
		["RestorationModEnv_RVD2TitleID"] = "Бешеные псы - день 2",
		["RestorationModEnv_RVD2DescID"] = "Выбрать погоду для ограбления Бешеные псы (день 2).",
		["RestorationModEnv_FSD1TitleID"] = "Поджигатель - день 1",
		["RestorationModEnv_FSD1DescID"] = "Выбрать погоду для ограбления Поджигатель (день 1).",
		["RestorationModEnv_PBR2TitleID"] = "Рождение небес",
		["RestorationModEnv_PBR2DescID"] = "Выбрать погоду для ограбления Рождение небес.",
		["RestorationModEnv_CJ2TitleID"] = "Бомба: Доки",
		["RestorationModEnv_CJ2DescID"] = "Выбрать погоду для ограбления Бомба: Доки.",
		["RestorationModEnv_UnderPassTitleID"] = "Транспорт: Проезд",
		["RestorationModEnv_UnderPassDescID"] = "Выбрать погоду для ограбления Транспорт: Проезд.",
		["RestorationModEnv_MallCrasherTitleID"] = "Крушитель",
		["RestorationModEnv_MallCrasherDescID"] = "Выбрать погоду для ограбления Крушитель.",
		["RestorationModEnv_Mia_1TitleID"] = "Г.Л.Майами - день 1",
		["RestorationModEnv_Mia_1DescID"] = "Выбрать погоду для ограбления Горячая линия Майами (день 1).",
		["RestorationModEnv_FSD3TitleID"] = "Поджигатель - день 3",
		["RestorationModEnv_FSD3DescID"] = "Выбрать погоду для ограбления Поджигатель (день 3).",
		["RestorationModEnv_WDD1NTitleID"] = "Сторож. псы 1 (Ночь)",
		["RestorationModEnv_WDD1NDescID"] = "Выбрать погоду для ограбления Сторожевые псы (день 1 - ночной).",
		["RestorationModEnv_WDD1DTitleID"] = "Сторож. псы 1 (День)",
		["RestorationModEnv_WDD1DDescID"] = "Выбрать погоду для ограбления Сторожевые псы (день 1 - дневной).",
		["RestorationModEnv_WDD2DTitleID"] = "Сторож. псы 1 (День))",
		["RestorationModEnv_WDD2DDescID"] = "Выбрать погоду для ограбления Сторожевые псы (день  - дневной).",
		["RestorationModEnv_Alex3TitleID"] = "Крысы - день 3",
		["RestorationModEnv_Alex3DescID"] = "Выбрать погоду для ограбления Крысы (день 3).",
		["RestorationModEnv_BigTitleID"] = "Большой банк",
		["RestorationModEnv_BigDescID"] = "Выбрать погоду для ограбления Большой банк.",
		["RestorationModEnv_FSTitleID"] = "Четыре магазина",
		["RestorationModEnv_FSDescID"] = "Выбрать погоду для ограбления Четыре магазина.",
		["RestorationModEnv_UkraTitleID"] = "Украинское дело",
		["RestorationModEnv_UkraDescID"] = "Выбрать погоду для ограбления Украинское дело.",
		["RestorationModEnv_KosugiTitleID"] = "Теневой рейд",
		["RestorationModEnv_KosugiDescID"] = "Выбрать погоду для ограбления Теневой рейд.",
		["RestorationModEnv_PetaTitleID"] = "Симулятор козы - день 1",
		["RestorationModEnv_PetaDescID"] = "Выбрать погоду для ограбления Симулятор козы (день 1).",
		["RestorationModEnv_FRIENDTitleID"] = "Особняк",
		["RestorationModEnv_FRIENDDescID"] = "Выбрать погоду для ограбления Особняк Лица со шрамом.",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "Отображение иконок навыков (Buff Tracker)",
		["RestorationModINFOHUDOptionsButtonDescID"] = "Отображает иконки навыков, которые активны в данный момент, в левом верхнем углу экрана. Не требует включенного Alpha UI.",
		["RestorationModInfo_HudTitleID"] = "Включить иконки навыков",
		["RestorationModInfo_HudDescID"] = "Включает или выключает отображение иконок навыков.",
		["RestorationModInfo_SizeTitleID"] = "Размер иконок",
		["RestorationModInfo_SizeDescID"] = "Регулирует размер отображаемых иконок навыков.",
		["RestorationModInfo_CountTitleID"] = "Число рядов",
		["RestorationModInfo_CountDescID"] = "Регулирует количество рядов иконок навыков, которые будут отображаться, прежде чем добавится новый столбик.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "Агрессивная перезарядка",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "Эффективный расход",
		["RestorationModInfo_ammo_efficiencyDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "Кровожадность",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_bullet_stormTitleID"] = "Свинцовый ливень",
		["RestorationModInfo_bullet_stormDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "Полевой медик",
		["RestorationModInfo_revive_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_desperadoTitleID"] = "Отчаянный",
		["RestorationModInfo_desperadoDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_grinderTitleID"] = "Гистамин (Нападающий)",
		["RestorationModInfo_grinderDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_infiltratorTitleID"] = "Похититель жизней (Интервент)",
		["RestorationModInfo_infiltratorDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "Вдохновление",
		["RestorationModInfo_long_dis_reviveDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_messiahTitleID"] = "Мессия",
		["RestorationModInfo_messiahDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "Overkill",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "Колёса",
		["RestorationModInfo_revived_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "Скорая помощь",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_rogueTitleID"] = "Смертельный инстинкт (Шпион)",
		["RestorationModInfo_rogueDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "Бегущий от смерти",
		["RestorationModInfo_increased_movement_speedDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "Меткий стрелок",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_trigger_happyTitleID"] = "Неудержимый стрелок",
		["RestorationModInfo_trigger_happyDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "Шестёрка",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_unseen_strikeTitleID"] = "Удар исподтишка",
		["RestorationModInfo_unseen_strikeDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModAltLastDownColorTitleID"] = "Другой фильтр для последнего падения",
		["RestorationModAltLastDownColorDescID"] = "Переключает цветовой фильтр при последнем падении на color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Отключить наклон камеру при падении",
		["RestorationModNoBleedoutTiltDescID"] = "Отклчает наклон камеры, который происходит после падения.",
		["RestorationModClassicMoviesTitleID"] = "Классический фон подготовки",
		["RestorationModClassicMoviesDescID"] = "Включить или выключить фон экрана подготовки из PD:TH при игре на Классических ограблениях.",
		["RestorationModQuietRainTitleID"] = "Тихий дождь",
		["RestorationModQuietRainDescID"] = "Делает звуки дождя тише на дождливых ограблениях.",

        ["default"] = "Стандартная",
		["random"] = "Случайная",
		["mellowday"] = "Умеренный день",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "Улучшенная стандартная",
		["env_trailer_bank"] = "Банк - как в трейлере",
		["rvd1_alt1"] = "Ночная жизнь",
		["rvd1_alt2"] = "Розоватый туман",
		["rvd2_alt"] = "Пасмурная",
		["fsd1_eve"] = "Вечерняя",
		["bos_alt"] = "Розовое небо",
		["dockyard_alt"] = "Ночная смена",
		["underpass_foggyday"] = "Туманный день",
		["mall_alt"] = "Послеобеденный шоппинг",
		["hlm_morn"] = "Утренний звонок",
		["funny_and_epic_synthwave_very_eighties"] = "Ретро",
		["brightnight"] = "Белая ночь",
		["docks"] = "Порт",
		["bank_green"] = "Зеленоватый из беты",
		["cloudy_day"] = "Облачный день",
		["shadowraid_day"] = "Дневной рейд",
		["shadowraiud_darker"] = "Мрачный рейд",
		["friend_pink"] = "Розовый закат",
		["friend_night"] = "Ночь в Майами",
		["off"] = "Выключить",
		["windowofoppurtunity"] = "Window Of Opportunity",
		["wheresthevan"] = "Where's The Van",
		["menu_jukebox_heist_ponr"] = "Точка невозврата",
		["RestorationModPaintingsTitleID"] = "Вырезанные картины в Картинной галерее",
		["RestorationModPaintingsDescID"] = "Включает или выключает отображение вырезанных картин на ограблении “Картинная галерея”. Работает только для хоста.",
		["RestorationModMainHUDTitleID"] = "Alpha HUD - ВКЛ/ВЫКЛ",
		["RestorationModMainHUDDescID"] = "Полностью включает или выключает интерфейс из альфа-версии игры.",
		["RestorationModWaypointsTitleID"] = "Иконки целей из Альфы",
		["RestorationModWaypointsDescID"] = "Включить или выключить иконки, указывающие на текущую цель из альфа-версии игры.",
		["RestorationModAssaultPanelTitleID"] = "Лента штурма из Альфы",
		["RestorationModAssaultPanelDescID"] = "Включить или выключить ленту штурма из альфа-версии игры.",
		["RestorationModAltAssaultTitleID"] = "Индикатор штурма из ранней Альфы",
		["RestorationModAltAssaultDescID"] = "Включить или выключить индикатор штурма из ранней альфа-версии игры. Заменяет ленту штурма.",
		["RestorationModObjectivesPanelTitleID"] = "Панель задач из Альфы",
		["RestorationModObjectivesPanelDescID"] = "Включить или выключить панель задач из альфа-версии игры.",
		["RestorationModPresenterTitleID"] = "Презентер из Альфы",
		["RestorationModPresenterDescID"] = "Включить или выключить презентер из альфа-версии игры, которые используется при захвате добычи и для напоминания о задачах.",
		["RestorationModInteractionTitleID"] = "Шкала интеракции из Альфы",
		["RestorationModInteractionDescID"] = "Включить или выключить шкалу интеракции из альфа-версии игры.",
		["RestorationModStealthTitleID"] = "Индикатор скрытности из Альфы",
		["RestorationModStealthDescID"] = "Включить или выключить индикатор скрытности из Альфы. Используется при стелсе.",
		["RestorationModDownTitleID"] = "Таймер падения из Альфы",
		["RestorationModDownDescID"] = "Включить или выключить таймер падения из альфа-версии игры.",
		["RestorationModBagTitleID"] = "Панель сумок из Альфы",
		["RestorationModBagDescID"] = "Включить или выключить панель сумок из альфа-версии игры.",
		["RestorationModHostageTitleID"] = "Прятать панель заложников",
		["RestorationModHostageDescID"] = "Если включен, прячет панель заложников когда начинается штурм, при условии, что лента или индикатор штурма из Альфы включены.",
		["RestorationModDifficultyMarkersTitleID"] = "Иконки сложностей из пре-релиза",
		["RestorationModDifficultyMarkersDescID"] = "Включить или выключить иконки сложностей из пре-релиза игры.",
		["RestorationModStaminaIndicatorTitleID"] = "Дебаговая полоска выносливости",
		["RestorationModStaminaIndicatorDescID"] = "Включить или выключить дебаговую полоску выносливости.",
		["RestorationModBlackScreenTitleID"] = "Начало ограбления из Restoration",
		["RestorationModBlackScreenDescID"] = "Включить или выключить начальную заставку ограблений из Restoration.",
		["RestorationModLoadoutsTitleID"] = "Меню подготовки из Альфы",
		["RestorationModLoadoutsDescID"] = "Включить или выключить меню подготовки из альфа-версии игры.",
		["RestorationModDistrictTitleID"] = "Описания районов в CRIME.NET",
		["RestorationModDistrictDescID"] = "Включить или вылючить описания районов в CRIME.NET. Описания не соответствуют геймплею.",
		["RestorationModSCOptionsButtonTitleID"] = "Опции Restoration Overhaul",
		["RestorationModSCOptionsButtonDescID"] = "Опции Restoration Overhaul",
		["RestorationModSCTitleID"] = "Complete Overhaul (DEBUG)",
		["RestorationModSCDescID"] = "Enable or disable Restoration's complete game overhaul. Toggling this option will automatically exit your game to prevent save corruption.",
		["RestorationModHolidayTitleID"] = "Праздничные эффекты",
		["RestorationModHolidayDescID"] = "Включает или выключает праздничные эффекты в моде.",
		["RestorationModRestoreHitFlashTitleID"] = "Вспышка при уроне",
		["RestorationModRestoreHitFlashDescID"] = "Включить или выключить вспышку экрана при получении урона из старых версий игры.",	
		["RestorationModNotifyTitleID"] = "Уведомление",
		["RestorationModNotifyDescID"] = "Включить или выключить уведомления мода.",
		["RestorationModPauseTitleID"] = "Меню паузы из Альфы",
		["RestorationModPauseDescID"] = "Включить или выключить меню паузы из альфа-версии игры.",

		["menu_support"] = "Гайд/помощь по ребалансу",
		["menu_support_help"] = "Просмотреть гайд по ребалансу в Restoration Mod, получить помощь, найти других игроков.",
		["menu_manual_header"] = "Placeholder Text",
		["hud_assault_alpha"] = "ПОЛИЦЕЙСКИЙ ШТУРМ",
		["hud_loot_secured_title"] = "ДОБЫЧА ЗАХВАЧЕНА!",
		["debug_none"] = "ЗАДАЧА",

		["restoration_level_data_welcome_to_the_jungle_1"] = "18:24, база байкерской банды 'Overkill'",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "01:32, база байкерской банды 'Overkill'",
		["restoration_level_data_welcome_to_the_jungle_2"] = "18:00, Вилла Вивальди",
		["restoration_level_data_framing_frame_1"] = "23:30, Капитолийская картинная галерея",
		["restoration_level_data_framing_frame_2"] = "00:30, Заброшенный вокзал",
		["restoration_level_data_framing_frame_3"] = "02:20, Пентхаус 'Хайрайз'",
		["restoration_level_data_election_day_1"] = "12:37, Пирс 39",
		["restoration_level_data_election_day_2"] = "08:10, Склад",
		["restoration_level_data_election_day_3"] = "Hi! If you see this string during gameplay, report it to Restoration! Thank you!",
		["restoration_level_data_election_day_3_skip1"] = "16:25, Банк 'Капитолийский'",
		["restoration_level_data_election_day_3_skip2"] = "15:25, Банк 'Капитолийский'",
		["restoration_level_data_watchdogs_1"] = "16:10, Грузовик с мясом",
		["restoration_level_data_watchdogs_1_res"] = "21:10, Грузовик с мясом",
		["restoration_level_data_watchdogs_2"] = "00:25, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_2_res"] = "00:25, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_1_night"] = "23:10, Грузовик с мясом",
		["restoration_level_data_watchdogs_2_day"] = "18:05, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_3_res"] = "00:20 Мост 'Вашингтон Джастайс'",
		["restoration_level_data_alex_1"] = "03:30, Тихий холм",
		["restoration_level_data_alex_2"] = "05:55, Наркопритон",
		["restoration_level_data_alex_3"] = "07:20, Мост 'Вашингтон Джастайс'",
		["restoration_level_data_alex_1_res"] = "03:30, Тихий холм",
		["restoration_level_data_alex_2_res"] = "05:55, Наркопритон",
		["restoration_level_data_alex_3_res"] = "07:20, Мост 'Вашингтон Джастайс'",
		["restoration_level_data_firestarter_1"] = "09:25, Частный аэропорт",
		["restoration_level_data_firestarter_1_res"] = "09:25, Частный аэропорт",
		["restoration_level_data_firestarter_2"] = "22:05, Офис ФБР",
		["restoration_level_data_firestarter_2_res"] = "22:05, Офис ФБР",
		["restoration_level_data_firestarter_3"] = "12:15, банк 'Харвест & Трасти'",
		["restoration_level_data_firestarter_3_res"] = "12:15, банк 'Харвест & Трасти'",
		["restoration_level_data_ukrainian_job"] = "14:50, 'Прекрасные штучки'",
		["restoration_level_data_ukrainian_job_res"] = "14:50, 'Прекрасные штучки'",
		["restoration_level_data_jewelry_store"] = "14:50, 'Прекрасные штучки'",
		["restoration_level_data_four_stores"] = "13:20, Магазины",
		["restoration_level_data_mallcrasher"] = "12:50, ТЦ 'Щит'",
		["restoration_level_data_nightclub"] = "20:00, Ночной клуб 'Со вкусом'",
		["restoration_level_data_branchbank"] = "12:15, банк 'Харвест & Трасти'",
		["restoration_level_data_escape_cafe"] = "Скрывайтесь!",
		["restoration_level_data_escape_park"] = "Скрывайтесь!",
		["restoration_level_data_escape_cafe_day"] = "Скрывайтесь!",
		["restoration_level_data_escape_park_day"] = "Скрывайтесь!",
		["restoration_level_data_escape_street"] = "Скрывайтесь!",
		["restoration_level_data_escape_overpass"] = "Скрывайтесь!",
		["restoration_level_data_escape_garage"] = "Скрывайтесь!",
		["restoration_level_data_escape_overpass_night"] = "Скрывайтесь!",
		["restoration_level_data_safehouse"] = "12:00, Убежище",
		["restoration_level_data_arm_fac"] = "9:30, Гавань",
		["restoration_level_data_arm_par"] = "14:25, Центр города",
		["restoration_level_data_arm_hcm"] = "14:15, Центр города",
		["restoration_level_data_arm_cro"] = "12:55, Пересечение ул. МакКарти и ул. Джеймс",
		["restoration_level_data_arm_und"] = "20:15, Проезд",
		["restoration_level_data_arm_for"] = "12:25, Поезд 'Армадилло'",
		["restoration_level_data_family"] = "11:25 AM, Джойелли ди Фамилья",
		["restoration_level_data_family_res"] = "11:25 AM, Джойелли ди Фамилья",
		["restoration_level_data_big"] = "14:15, Банк 'Беневолент'",
		["restoration_level_data_big_res"] = "14:15, Банк 'Беневолент'",
		["restoration_level_data_roberts"] = "08:47, Банк 'Робертс'",
		["restoration_level_data_roberts_v2"] = "08:47, Банк 'Робертс'",
		["restoration_level_data_mia_1"] = "21:30, Мотель Комиссара",
		["restoration_level_data_mia_2"] = "11:45, Апартаменты Комиссара",
		["restoration_level_data_mia2_new"] = "11:45, Апартаменты Комиссара",
		["restoration_level_data_kosugi"] = "04:00, Склад 'Терминал'",
		["restoration_level_data_gallery"] = "23:45, Капитолийская картинная галерея",
		["restoration_level_data_hox_1"] = "10:30, Подземный переход здания суда",
		["restoration_level_data_hox_2"] = "16:10, Здание им. Джона Эдгарда Гувера",
		["restoration_level_data_pines"] = "17:52, В глубине леса",
		["restoration_level_data_mus"] = "20:15, Музей старинного искусства им. МакКендрика",
		["restoration_level_data_crojob2"] = "18:10, Вашингтонский порт",
		["restoration_level_data_crojob3"] = "15:35, Окраина леса",
		["restoration_level_data_crojob3_night"] = "20:35, Окраина леса",
		["restoration_level_data_cage"] = "19:55, 'Тойер Автос'",
		["restoration_level_data_hox_3"] = "23:55, Убежище ФБР",
		["restoration_level_data_rat"] = "19:55, Тихий холм",
		["restoration_level_data_shoutout_raid"] = "09:00, Склад 'Терминал'",
		["restoration_level_data_arena"] = "21:00, GENSEC-Арена",
		["restoration_level_data_kenaz"] = "20:00, Лас-Вегас-Стрип - Казино 'Голден Грин'",
		["restoration_level_data_jolly"] = "16:00, Лос-Анджелес - Зона катастрофы",
		["restoration_level_data_red2"] = "14:15, ЦЕНТР ГОРОДА - ПЕРВЫЙ ВСЕМИРНЫЙ БАНК",
		["restoration_level_data_dinner"] = "08:01, Район скотобойни - в засаде!",
		["restoration_level_data_nail"] = "00:00, Тихий холм",
		["restoration_level_data_haunted"] = "??:??, 'Убежище'",
		["restoration_level_data_pbr"] = "04:40, Невада - Исследовательский центр 'Блекридж'",
		["restoration_level_data_pbr2"] = "ВРЕМЯ НЕИЗВЕСТНО, Z-170 'ЗЕВС' - Грузовой самолёт Murkywater",
		["restoration_level_data_cane"] = "15:15, Мастерская Санты",
		["restoration_level_data_peta"] = "12:00, Район в центре города",
		["restoration_level_data_peta2"] = "17:43, Разрушенный амбар",
		["restoration_level_data_man"] = "18:00, Заброшенное здание",
		["restoration_level_data_pal"] = "12:00, Пригород - Ремонт сантехники 'Bodhi'",
		["restoration_level_data_short1_stage1"] = "ВРЕМЯ НЕИЗВЕСТНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short1_stage2"] = "ВРЕМЯ НЕИЗВЕСТНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage1"] = "ВРЕМЯ НЕИЗВЕСТНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage2"] = "ВРЕМЯ НЕИЗВЕСТНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage2b"] = "ВРЕМЯ НЕИЗВЕСТНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_dark"] = "02:21, Скрытый вокзал",
		["restoration_level_data_mad"] = "ВРЕМЯ НЕИЗВЕСТНО, Где-то в России...",
		["restoration_level_data_born"] = "10:15, Байкерский клуб OVERKILL",
		["restoration_level_data_chew"] = "17:25, за Вашингтоном - Идущий поезд!",
		["restoration_level_data_flat"] = "16:02, Неблагополучный район - Притон Чавеза",
		["restoration_level_data_chill"] = "13:00, Убежище",
		["restoration_level_data_chill_combat"] = "13:00, Убежище - рейд полиции!",
		["restoration_level_data_help"] = "DON'T TOUCH THAT DIAL, WE'RE JUST GETTING STARTED",
		["restoration_level_data_friend"] = "16:30, Майами - Особняк Эль Фурейдис",
		["restoration_level_data_fish"] = "19:30, Около Нью-Йорка - Яхта 'Лета'",
		["restoration_level_data_spa"] = "19:00, Ньй-Йорк - Засада!",
		["restoration_level_data_moon"] = "23:00, Торговый центр 'Murica'",
		["restoration_level_data_run"] = "11:00, Жилой квартал - Подстава!",
		["restoration_level_data_glace"] = "22:45, Мост Грин - южная сторона",
		["restoration_level_data_dah"] = "01:30, 22 этаж - Небоскрёб Гарнет Груп",
		["restoration_level_data_hvh"] = "ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК. ТИК-ТАК.",
		["restoration_level_data_wwh"] = "ВРЕМЯ НЕИЗВЕСТНО, Где-то на Аляске...",
		["restoration_level_data_rvd1"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_rvd2"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_brb"] = "18:53, Нью-Йорк, Бруклин - Банк 'Харвест & Трасти'",
		["restoration_level_data_des"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Невада - Скала Генри",
		["restoration_level_data_sah"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Массачусетс - Особняк Шэклторн",
		["restoration_level_data_tag"] = "00:43, Здание им. Джона Эдгарда Гувера",
		["restoration_level_data_bph"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Тюрьма 'Форт Клэтсоп'",
		["restoration_level_data_nmh"] = "20:24, Госпиталь 'Милосердие' - Изоляционная палата",
		["restoration_level_data_vit"] = "13:07, Вашингтон - Белый дом",
		["restoration_level_data_mex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, США - Южная граница",
		["restoration_level_data_mex_cooking"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - база Койопов",
		["restoration_level_data_bex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Банк Сан Мартин",
		["restoration_level_data_pex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Полицейский участок",
		["restoration_level_data_fex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Особняк Булука",
		["restoration_level_data_wetwork"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_junk"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_holly"] = "5:00 PM, Los Angeles - Lukas' Mansion",
		["restoration_level_data_lvl_friday"] = "17:00, Торговый центр 'Щит'",

		["heist_greattrain_name"] = "Time Window",
		["heist_easystore_name"] = "Twenty-Four Seven",
		["heist_sin_villa_name"] = "SCORE: Villa Vivaldi",
		["heist_dragon_name"] = "Stonefist",
		["heist_jkl_base_name"] = "Jackal's Safehouse",
		["heist_junger_name"] = "Distorted Angels",
		["heist_deep_name"] = "Deep Six",
		["heist_blood_name"] = "Body/Prison",
		["heist_crystal_name"] = "Slaves of Fear",
		["heist_gold_name"] = "Remains of Nothing",
		["heist_titanium_name"] = "Turf War",
		["heist_airport_name"] = "Dead Reckoning",
		["heist_platinum_name"] = "Surface Tension",
		["heist_cursed_name"] = "Green Harvest",
		["heist_holly_name"] = "Blockbuster Night",

		["heist_platinum_brief"] = "stir the boat",
		["heist_jackal_surface_tension_name"] = "OMNIA Research Vessel SN-XR-LETHE",
		["heist_jackal_surface_tension_brief"] = "PLACEHOLDER",

		["heist_vivinite_name"] = "Zero Day",

		["heist_contact_shatter"] = "Джекел и Рейз",
		["heist_contact_akashic"] = "Нико",

		["menu_contacts_shatter"] = "Союзники CRIMENET",
		["heist_contact_shatter_description"] = "Джекел и Рейз. Ответственны за активы и боевые силы CRIMENET. Испытывают отвращение к OMNIA и GenSec.",
		["heist_contact_jackal_description"] = "Джекел начал свою карьеру в GenSec, но уволился после инцидента, связанного с торговлей людьми, в котором были замешаны GenSec и OMNIA.\n\nТеперь он работает на CRIMENET, поставляя проблемы им прямо на дом.",
		["heist_contact_raze_description"] = "Рейз. Напарница Джекела и опытный боец.\n\nРодилась в 1995 и сбежала от семьи в 15 лет, начав криминальную карьеру и никогда не оглядываясь.",
		["heist_contact_akashic_description"] = "В прошлом - высокопоставленный агент Гектора Моралеса, Николас 'Нико' Рене теперь командует остатками Синалоанского картеля в США. \nИх численность мала, и более крупный Колумбийский картель не собирается ни предоставлять помощь, ни восстанавливать союз с CRIMENET. Нико объединяется с различными мелкими бандами на Восточном побережье, а также с CRIMENET - он предоставит свои ресурсы в обмен на услуги.",

		["bm_msk_shatter_true"] = "Рейз",
		["bm_msk_shatter_true_desc"] = "Маска Рейз, напарницы Джекела. Феникс символизирует перерождение. С каждой смертью начинается новая жизнь. Рейз верит, что её маска приносит удачу, и почти всегда работает в ней.",

		["menu_l_global_value_veritas"] = "Restoration Mod",
		["menu_l_global_value_veritas_desc"] = "Это предмет из Restoration Mod!",

		["menu_alex_1_zipline"] = "Зиплайн для сумок",

		["menu_asset_wet_intel"] = "Разведданные",
		["menu_asset_risk_murky"] = "Наёмники Murkywater",
		["menu_asset_risk_bexico"] = "Мексиканская федеральная полиция",
		["menu_asset_risk_zombie"] = "зОмбИ пОлиЦиЯ",
		["menu_asset_wet_boat"] = "Лодка",
		["menu_asset_wet_boat_desc"] = "Купить дополнительную точку сброса и побега",

		["bm_msk_canada"] = "Адский хоккей",
		["bm_msk_canada_desc"] = "Ничего не оставляйте позади - даже когда становится жарко, вы сражаетесь за что хотите, когда хотите (даже если это термобарическая бомба).",
		["bm_msk_jsr"] = "Миссис Граффити",
		["bm_msk_jsr_desc"] = "Создана настоящим художником. Стирать граффити - всё равно, что сжигать книги, не так ли?\n\nИскусство это искусство - его нужно уважать.",
		["bm_msk_jsrf"] = "Mистер Граффити",
		["bm_msk_jsrf_desc"] = "За каждым граффити стоит история. Быть художником в безликом городе может быть болезненно.\n\nГраффити - словно книга. Их нужно уметь читать.",
		["bm_msk_courier_stash"] = "Сумка для добычи",
		["bm_msk_courier_stash_desc"] = "Если нужно взять несколько лишних сотенных купюр, а в карманах уже не осталось места, эта маска вполне сойдёт.",

		["bm_msk_female_mask"] = "Стандартная маска (женская)",
		["bm_msk_female_mask_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.",
		["bm_msk_female_mask_blood"] = "Восстановленная маска (женская)",
		["bm_msk_female_mask_blood_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.\n\nЭта маска была обнаружена после неудачного ограбления склада OMNIA, среди кровавого побоища.\n\nПоследним посланием банды, прежде чем они пропали навсегда, было ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_female_mask_clown"] = "Рози",
		["bm_msk_female_mask_clown_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.\n\nЭту маску носила грабитель, известная как Рози, хотя теперь у неё новая маска.\n\nНа видеозаписи с ограбления было видно, как она обезвреживает целый отряд спецназа совершенно без оружия.",
		["bm_msk_male_mask"] = "Стандартная маска (мужская)",
		["bm_msk_male_mask_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.",
		["bm_msk_male_mask_blood"] = "Восстановленная маска (мужская)",
		["bm_msk_male_mask_blood_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.\n\nЭта маска была обнаружена после неудачного ограбления склада OMNIA, среди кровавого побоища.\n\nПоследним посланием банды, прежде чем они пропали навсегда, было ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_male_mask_clown"] = "Кросс",
		["bm_msk_male_mask_clown_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить её не так просто, зато она прочная.\n\nЭту маску носил грабитель, известный как Кросс, хотя теперь у него новая маска.\n\nКросс - талантливый стрелок, и однажды вывел из строя четыре бронегрузовика за пять секунд.",

		["bm_msk_twister_mask"] = "Человек-загадка",
		["bm_msk_twister_mask_desc"] = "Кто скрывается за этой маской - загадка.\n\nМожет, это какой-нибудь незнакомец, а может - кто-нибудь, кого вы знали всё это время.",
		["bm_msk_voodoo_mask"] = "Тёмная магия",
		["bm_msk_voodoo_mask_desc"] = "Эта маска была найдена в джунглях после бомбардировки - она смогла вынести последствия разрушений, и теперь считается предвестником беды.\n\nОна найдёт вас, когда вы будете нуждаться в ней больше всего и поможет пережить беду.\n\nВопрос лишь в том, какой ценой.",

		["bm_msk_f1"] = "Шлем X1",
		["bm_msk_f1_desc"] = "Не забывайте о защите, когда будете нестись по шоссе или проскальзывать через пробки.\n\nЭтот шлем защитит от жёсткого падения, но явно не от пуль.",
		["bm_msk_f1_b"] = "Шлем X1 (Чистый)",
		["bm_msk_f1_b_desc"] = "Не забывайте о защите, когда будете нестись по шоссе или проскальзывать через пробки.\n\nЭтот шлем защитит от жёсткого падения, но явно не от пуль.\n\nЭто дубликат шлема, без брендовых стикеров, который был найден в гараже с дорогими машинами.\n\nДержите этот шлем под рукой, и может быть однажды, вы поедете на одной из таких.",
		["bm_msk_sweettooth"] = "Сладкоежка",
		["bm_msk_sweettooth_desc"] = "Сладкоежка (настоящее имя - Маркус 'Нидлс' Кейн) - персонаж из серии игр Twisted Metal. Сладкоежка известен как клоун-убийца, который водит боевой фургончик с мороженым.\n\nГоворят, однажды он сбежал из психиатрической лечебницы. Теперь он ведёт криминальную жизнь.",

		["bm_msk_wolf_stone"] = "Вульф из Stonecold",
		["bm_msk_wolf_stone_desc"] = "Оригинальная маска Вульфа, которую он носил, когда впервые сошёл с ума и начал воплощать преступления из своих любимых игр. Считалось, что эта маска была утеряна во время ограбления, вдохновлённого игрой ‘Hyper Heisting’.\n\nВо время ранних ограблений банды, маска нашлась и была доставлена в убежище одним из сообщников Бейна.\n\nОригинальный узор маски со временем потускнел, совсем как психическая стабильность Вульфа.",

		["bm_msk_dallas_aged"] = "Древний Даллас",
		["bm_msk_dallas_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но её содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_chains_aged"] = "Древний Чейнс",
		["bm_msk_chains_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но её содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_hoxton_aged"] = "Древний Хокстон",
		["bm_msk_hoxton_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но её содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_wolf_aged"] = "Древний Вульф",
		["bm_msk_wolf_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но её содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",

		["bm_msk_beef_dallas"] = "Мясной Даллас",
		["bm_msk_beef_dallas_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nДаллас решил оставить дизайн своей полюбившейся маски.",
		["bm_msk_beef_chains"] = "Мясной Чейнс",
		["bm_msk_beef_chains_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nЧейнс, будучи силовиком, захотел в качестве дизайна устрашающее животное. Что может быть страшнее, чем чёртов динозавр?!",
		["bm_msk_beef_hoxton"] = "Мясной Хокстон",
		["bm_msk_beef_hoxton_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nХокстон оставил простой список пожеланий для своей маски:\n- Защищающая!\n- Эффективная!\n- Стильная!\n\nТак и получилась эта маска.",
		["bm_msk_beef_wolf"] = "Мясной Вульф",
		["bm_msk_beef_wolf_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nДизайн Вульфа был вдохновлён его любимым персонажем, которого он придумал, когда ещё разрабатывал игры.",

		["bm_msk_vyse_dallas"] = "Источник",
		["bm_msk_vyse_dallas_desc"] = "Vyse сразился лицом-к-лицу с самым дьявольским из дьяволов. Vyse выжил, а из костей дьявола сделали эту маску.",
		["bm_msk_vyse_chains"] = "Детская игра",
		["bm_msk_vyse_chains_desc"] = "Хоть Vyse и украл больше денег и золота, чем поместится в Форт-Нокс, у него хватает сердца, что бы поделиться частью добычи с больными детьми.\n\nОднажды, Бейн посетил этих детей - эта маска была их благодарностью для Vyse.",
		["bm_msk_vyse_hoxton"] = "Три балбеса",
		["bm_msk_vyse_hoxton_desc"] = "Говорят, если провалишься - нужно перетерпеть боль и попытаться снова. Vyse не был согласен. Каждый раз, когда он проигрывал, он шёл вперёд, не смотря ни на что. Даже Ларри, Кёрли и Мо не выдержали бы такого.",
		["bm_msk_vyse_wolf"] = "Беар Гриллс",
		["bm_msk_vyse_wolf_desc"] = "Vyse однажды вызвал Беара Гриллса на поединок по распитию урины... Vyse победил, и Мистер Гриллс использовал свои навыки выживания при создании этой маски.",

		["bm_msk_secret_old_hoxton"] = "Секретный Хокстон",
		["bm_msk_secret_old_hoxton_desc"] = "Хокстон покинул родной край ради больших денег. Когда Бейн рассказал ему о Секрете, ему понравилась идея искать древние артефакты - ведь они стоят дорого. Хокстону было совсем неважно, существует ли некая древняя сила или нет.",

		["bm_msk_secret_clover"] = "Секретная Кловер",
		["bm_msk_secret_clover_desc"] = "Когда Бейн рассказал Кловер о Секрете, она отнеслась скептически - ей всегда казалось, что легенды Бейна о древних артефактах с мифической силой были сильно преувеличены. Но когда она лично увидела сбор трёх шкатулок, ни о каких сомнениях больше не было и речи.",

		["bm_msk_secret_dragan"] = "Секретный Драган",
		["bm_msk_secret_dragan_desc"] = "Как бывший полицейский, Драган всегда хорошо умел искать улики, и когда Бейн показал ему своё расследование Секрета, он был готов к охоте за древними артефактами.",

		["bm_msk_secret_bonnie"] = "Секретная Бонни",
		["bm_msk_secret_bonnie_desc"] = "Бонни, услышав от Бейна о секрете, сделала большой глоток своего любимого виски и закричала о том, что готова 'набить рожу Катару'.",

		["bm_msk_secret_syndey"] = "Секретная Сидни",
		["bm_msk_secret_syndey_desc"] = "Когда Сидни услышала о секрете от Бейна, она не поверила в легенды о древней силе. Тем не менее, возможность сразиться с неизвестной, но крайне опасной организацией достаточно заинтересовала её.",

		["bm_msk_secret_richard"] = "Секретный Ричард",
		["bm_msk_secret_richard_desc"] = "По криминальному миру ходили слухи о киллере, которым вдохновлялся Джекет; киллер, который был ликвидирован неизвестной организацией. Когда Джекет услышал о секрете от Бейна, он вернулся с маской, похожей на ту, что носил его прародитель.",

		["bm_all_seeing"] = "Всевидящий якорь",
		["bm_all_seeing_desc"] = "Ужасающее видение, кошмарное зрелище.\n\nВысшие силы увидели вас, и решили наградить вас.",

		["bm_msk_classic_helmet"] = "Классический силовик",
		["bm_msk_classic_helmet_desc"] = "Подарок от бывшего спецназовца. Прежде чем уйти на пенсию, он вычислил Джекела... И подарил ему единственную экипировку, которая у него осталась, чтобы помочь работе Джекела.\n\nЭто странное событие именно причину: Он увидел своими глазами то, что OMNIA держала в тайне. Но он нестал копать эти тайны и вскоре покинул спецназ навсегда.\n\nДжекел прислал эти шлемы вам. Награда за вашу помощь.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Push the placeholder, we'll get around to it.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "Маска Джекела. Точнее, её копия.\n\nНастоящая маска слишком важна для Джекела, по слухам, в ней полно чувствительной электронники.\n\nВ этой копии система дисплея очень простая и служит просто чтобы быть похожей на оригинал.\n\nПодарок за ваши старания.",


		["bm_msk_finger"] = "Наглец",
		["bm_msk_finger_desc"] = "Наглец - мифическое существо, которое существовало в мире давным-давно. Существо гонялось и вредило обычным деревенским и городским жителям, охотясь на них различными способами. Наглецу нравилось это делать, и он был угрозой покою, пока он не был обнаружен и уничтожен людьми Короля.",

		["bm_msk_instinct"] = "Интуиция",
		["bm_msk_instinct_desc"] = "Эта маска принадлежала мифическому войну из далёких земель. Он путешествовал по всему миру, полагаясь на интуицию, и охотился на злые силы. Он прошёл через многие подземелья и победил тысячи злых существ на своём пути. В конце концов, он ушёл на покой, зная, что его дело продолжат будущие поколения.",

		["bm_msk_unforsaken"] = "Неупокоенный",
		["bm_msk_unforsaken_desc"] = "Эта легендарная маска - знак благодарности нашему сообществу за упорство и поддержку. От нас, команды OVERKILL - мы благодарны вам.\n\nЧерез огонь и медные трубы, пусть шлемы продолжают лететь.",

		["bm_msk_chains_halloween"] = "Разбитый щит",
		["bm_msk_chains_halloween_desc"] = "Будучи наёмником, приходится видеть большое количество боли и смерти. Даже если вам кажется что вы бессмертны и бесстрашны... Иногда, плохие воспоминания добираются до вас.\n\nВ светлый, снежный и прекрасный октябрьский день 2008-го года, Чейнс отсыпался. Недавно выполнив контракт на убийство от Murkywater, он получил деньги и неплохую комнату в отеле, где и спал.\n\nВпервые за много лет, ему приснился кошмар. Он не помнит его во всех подробностях, но он проснулся от паралича, и образ, напоминающий скелет, стоял над ним, пока он не мог пошевелиться.\n\nКаждый раз, когда он выполнял грязную работу, его последующие ночи были бессонными и ужасными.\n\nВ конце концов, ему пришлось сказать 'Хватит.', покинуть свою работу наёмником и обратиться к психотерапевту. Ему прописали лекарства. На год жизнь стала хорошей...\n\nРовно через год, 31 октября 2009-го, компания Murkywater решила, что уволившийся человек собирается раскрыть секреты организации. Для них это непозволительно.\n\nЧейнс бросился в криминальную жизнь, чтобы спасти себя, и снова стал солдатом.\n\nНо в этот раз всё было по-другому. Кошмары и паралич не вернулись. Он не собирался приносить страдания другим людям.\n\nВ этот раз, ему нужно было защитить себя.",

		["bm_msk_dallas_halloween"] = "Отражение монстра",
		["bm_msk_dallas_halloween_desc"] = "Тратя годы на выдумывание несуществующих личностей и историй, легко потерять настоящего себя.\n\nТы начинаешь перепрыгивать от личности к личности, подбирать черты своих друзей, любовниц и приятелей. Иногда они сливаются вместе, и ты начинаешь чувствовать себя невнятной смесью.\n\nДаллас проснулся октябрьским утром и взглянул в зеркало - его волосы были окрашены в дурацкий блондинистый цвет, а борода неровно побрита. На нём был безвкусный костюм, покрытый потом после жутких кошмаров. Его голова болела после выходных, проведённых на дне бутылки.\n\nВзглянул на себя, он подумал, что больше похож на монстра Франкенштейна, чем на человека: Просто сборные части, которые достаточно убедительны, чтобы презентовать себя в криминальной карьере.\n\nЭто утро было переломным моментом, но Далласу до сих пор иногда кажется, что не все его черты характера действительно принадлежат ему.",

		["bm_msk_hoxton_halloween"] = "Хеллоуинский сон",
		["bm_msk_hoxton_halloween_desc"] = "Одним из хеллоуинских воспоминаний Хокстона было посещение Нью-Йорка с дальними родственниками.\n\nЕму никогда не нравились конфеты, но он обожал тыквенный пирог, который подавали на вечеринке его родственника.\n\nКогда он вышел прогуляться с вечеринки, он увидел большую дверь хранилища, в которое завозили различные богатства.\n\nС тех пор он загорелся идеей ограблений во время праздников.",

		["bm_msk_wolf_halloween"] = "Плач дьявола",
		["bm_msk_wolf_halloween_desc"] = "Холодным октябрьским вечером 2010-го, Вульф до сих пор пытался выбраться из финансового кризиса после того, как его компания закрылась.\n\nОн лежал в гостинице, в полном одиночествеЮ и думал о своей семье, о том, что он их подвёл и может их больше не увидеть - отрезанный от них целым океаном.\n\nОн потратил последние сбережения на поездку в США, в попытке накопить достаточно денег, чтобы начать сначала в новом доме, но он провалился.\n\nНесколько недель спустя, бродя по домам друзей, гостиницам и убежищам, ему позвонила его любимая, впервые за долгое время.\n\nОтношениям конец. 'Не вижу, как это может хорошо закончиться.'\n\nМожет, это и был повод начать сначала.\n\nМожет, настало время попробовать новую карьеру.",


		["pattern_jkl_patt01_title"] = "Шакалы",
		["pattern_jkl_patt02_title"] = "Компания",
		["material_jkl_matt01_title"] = "Грозные перья",
		["material_jkl_matt02_title"] = "Золото Веритас",

		["menu_scores"] = "SCORES",

		["RestorationModColorOption"] = "Изменить цвет элемента интерфейса",
		["RestorationModColorsOptionsButtonTitleID"] = "Настройки цветов",
		["RestorationModColorsOptionsButtonDescID"] = "Изменить цвет различных элементов интерфейса.",
		["RestorationModObjectivesBGTitleID"] = "Задачи - задний план",
		["RestorationModObjectivesFGTitleID"] = "Задачи - передний план",
		["RestorationModAssaultBGTitleID"] = "Штурм - задний план",
		["RestorationModAssaultFGTitleID"] = "Штурм - передний план",
		["RestorationModNoReturnTitleID"] = "Текст Точки невозврата",
		["RestorationModTimerTextTitleID"] = "Таймер (время) ограбления",
		["RestorationModAssaultEndlessBGTitleID"] = "Штурм капитана",
		["RestorationModAssaultSurvivedBGTitleID"] = "Пережитый штурм",
		["RestorationModStaminaTitleID"] = "Выносливость",
		["RestorationModStaminaThresholdTitleID"] = "Порог выносливости",
		["RestorationModBagBitmapTitleID"] = "Сумка",
		["RestorationModBagTextTitleID"] = "Текст сумок",
		["RestorationModNoReturnTextTitleID"] = "Текст Точки невозврата",
		["RestorationModHostagesTextTitleID"] = "Текст заложников",
		["RestorationModHintTextTitleID"] = "Текст подсказок",
		["RestorationModMaskOnTextTitleID"] = "Текст надевания маски",
		["RestorationModStopAllBotsTitleID"] = "Останавливать всех ботов",
		["RestorationModStopAllBotsDescID"] = "Останавливать всех ботов, если удержана кнопка остановки бота.",
		["RestorationModPONRTrackTitleID"] = "Музыка во время Точки невозврата",
		["RestorationModPONRTrackDescID"] = "Изменяет музыку во время Точки невозврата в режиме Pro-Job.",
		["RestorationModPONRTracksTitleID"] = "Музыка во время Точки невозврата",
		["RestorationModPONRTracksDescID"] = "Выберите музыку, которая начнётся во время Точки невозврата в режиме Pro-Job.",
		["RestorationModMusicShuffleTitleID"] = "Перемешка музыки",
		["RestorationModMusicShuffleDescID"] = "Музыка будет меняться после конца каждого штурма.",
		["RestorationModScaleTitleID"] = "Размер интерфейса",
		["RestorationModScaleDescID"] = "Изменяет размер интерфейса. Может потребоваться перезапуск игры.",
		["RestorationModSizeOnScreenTitleID"] = "Размер интерфейса на экране",
		["RestorationModSizeOnScreenDescID"] = "Изменяет размер интерфейса на экране. Может потребоваться перезапуск игры.",
		["RestorationModTeammateTitleID"] = "Панель команды из Альфы",
		["RestorationModTeammateDescID"] = "Включает или выключает панель команды из альфа-версии игры, которая отображает статистику вас и вашей команды.",
		["RestorationModHeistTimerTitleID"] = "Время ограбления из Альфы",
		["RestorationModHeistTimerDescID"] = "Включает или выключает время (таймер) ограбления из альфа-версии игры.",
		["RestorationModMaskOnTitleID"] = "Текст надевания маски из Альфы",
		["RestorationModMaskOnDescID"] = "Включает или выключает текст надевания маски из альфа-версии игры.",
		["RestorationModNameLabelsTitleID"] = "Ники игроков из Альфы",
		["RestorationModNameLabelsDescID"] = "Включить или выключить ники игроков из альфа-версии игры.",
		["RestorationModHintTitleID"] = "Панель подсказок из Альфы",
		["RestorationModHintDescID"] = "Включить или выключит панель подсказок из альфа-версии игры.",
		["RestorationModExtraOptionsButtonTitleID"] = "Дополнительные опции интерфейса",
		["RestorationModExtraOptionsButtonDescID"] = "Ещё больше опций!",
		["RestorationModRealAmmoTitleID"] = "Действительный счётчик патронов",
		["RestorationModRealAmmoDescID"] = "Счётчик патронов в запасе будет игнорировать патроны, которые уже заряжены.",
		["RestorationModStealthOrigPosTitleID"] = "Стандартное расположение обнаружения",
		["RestorationModStealthOrigPosDescID"] = "Полоска обнаружения будет в том же месте, что и в ванильной игре.",
		["RestorationModLowerBagTitleID"] = "Понизить текст о подобранной сумке",
		["RestorationModLowerBagDescID"] = "Текст, который появляется, если подобрать сумку, будет расположен ниже.",
		["RestorationModAssaultStyleTitleID"] = "Стиль панели штурма",
		["RestorationModAssaultStyleDescID"] = "Позволяет выбрать стиль панели штурма.",
		["RestorationModCasingTickerTitleID"] = "Лента исследования из Альфы",
		["RestorationModCasingTickerDescID"] = "Включить или выключить ленту режима исследования из альфа-версии игры (Требует включенную ленту из Альфы).",
		["RestorationModCustodyTitleID"] = "Панель заключения под стражу из Альфы",
		["RestorationModCustodyDescID"] = "Включить или выключить панель заключения под стражу из альфа-версии игры.",
		["RestorationModCrimenetTitleID"] = "CRIMENET из Альфы",
		["RestorationModCrimenetDescID"] = "Включает или выключает CRIMENET из альфа-версии игры.",
		["RestorationModProfileTitleID"] = "Окно с профилями из Альфы",
		["RestorationModProfileDescID"] = "Включить или выключить окно с профилями из альфа-версии игры.",
		["RestorationModNewsfeedTitleID"] = "Лента новостей из Альфы",
		["RestorationModNewsfeedDescID"] = "Включить или выключить ленту новостей из альфа-версии игры.",
		["RestorationModUppercaseNamesTitleID"] = "Ники заглавными буквами",
		["RestorationModUppercaseNamesDescID"] = "Включить или выключить отображение ников игроков заглавными буквами.",
		["RestorationModPeerColorsTitleID"] = "Цвета товарищей из Альфы",
		["RestorationModPeerColorsDescID"] = "Включить или выключить цвета товарищей из альфа-версии игры.",
		["RestorationModPocoCrimenetAlignSortTitleID"] = "Подгонка и сортировка CRIMENET",
		["RestorationModPocoCrimenetAlignSortDescID"] = "Подгоняет и сортирует CRIMENET по сложности.",
		["RestorationModPocoCrimenetScaleTitleID"] = "Масштаб CRIMENET",
		["RestorationModPocoCrimenetScaleDescID"] = "Позволяет менять масштаб CRIMENET.",
		["RestorationModVoiceIconTitleID"] = "Voice Chat Icon",
	    ["RestorationModVoiceIconDescID"] = "Displays when a player is using voice chat in-game.",
		["alpha_assault"] = "Уголок",
		["beta_assault"] = "Лента",

		["menu_ingame_manual"] = "Гайд по Restoration",
		["menu_ingame_manual_help"] = "Просмотреть гайд по Restoration.",

		["menu_asset_wet_add_saw"] = "Дополнительная пила",
		["menu_asset_wet_add_saw_desc"] = "Закупить дополнительную пилу",
		["menu_rush_asset_sentrygun"] = "Турель",
		["menu_rush_asset_sentrygun_desc"] = "Закупить дополнительную турель",

		["heist_junker_name"] = "Наркопритон",
		["heist_junker_brief"] = "Это работа на Влада. После неудачной сделки его люди и товар оказались в тяжёлом положении - федералы уже близко. Мы подготовили транспорт, чтобы доставить вас к месту сделки, где вы будете обеспечивать прикрытие. Мы пришлём вертолёт и эвакуируем оттуда вас вместе с товаром.\n\nРабота не очень долгая, но не стоит недооценивать полицию. Экипируйтесь для боя.",
		["heist_junk_name"] = "Сторожи",
		["heist_junk_brief"] = "Стройплощадка уже близко. Копы ещё не прибыли, но будут на месте очень скоро. Ребята Влада обеспечат вам прикрытие, но скорее всего не смогут держаться долго.\n\nГоворят, на месте есть мет-лаборатория, поэтому можете попробовать сварить себе премию, если сможете одновременно уследить за товаром Влада.",
		["junk_01"] = "ЗАЩИЩАТЬ ДЕНЬГИ И НАРКОТИКИ",
		["junk_01_desc"] = "Держите копов подальше от товара! И кокаин, и деньги должны быть в безопасности.",
		["junk_02"] = "ПОСТАВИТЬ КАНИСТРЫ И ВЫСТРЕЛИТЬ В КАЖДУЮ ИЗ НИХ",
		["junk_02_desc"] = "Зажгите костёр, который оповестит пилота о вашей позиции.",
		["junk_03"] = "ЗАЩИЩАТЬ ДЕНЬГИ И НАРКОТИКИ",
		["junk_03_desc"] = "Не позволяйте копам уносить товар Влада! Если вы потеряете слишком много мешков, дело будет провалено!",
		["junk_04"] = "ЗАБРАТЬ ТОВАР ВЛАДА",
		["junk_04_desc"] = "Забрать кокаин Влада. Его собственные люди проследят, чтобы деньги были в безопасности.",
		["junk_05"] = "ДОСТУПНА ЭВАКУАЦИЯ",
		["junk_05_desc"] = "Эвакуируйтесь, как только будете довольны наградой.",

		["heist_int_dock_name"] = "Мокрое дело",
		["heist_int_dock_brief"] = "Этот склад принадлежит Murkywater Logistics, по крайней мере, на данный момент. Они использовали его для хранения добычи, но недавно мы заметили,  что туда было доставлено несколько серверов с засекреченной информацией. По нашим данным, там содержатся материалы о союзе между ними и OMNIA.\n\nТихо или громко, ваша единственная задача - захватить сервера и завладеть информацией. Ожидайте сопротивления, вне зависимости от метода.",
		["heist_wetwork_name"] = "Мокрое дело",
		["heist_wetwork_brief"] = "Этот склад принадлежит Murkywater Logistics, по крайней мере, на данный момент. Они использовали его для хранения добычи, но недавно мы заметили,  что туда было доставлено несколько серверов с засекреченной информацией. По нашим данным, там содержатся материалы о союзе между ними и OMNIA.\n\nТихо или громко, ваша единственная задача - захватить сервера и завладеть информацией. Ожидайте сопротивления, вне зависимости от метода.",
		["obj1_enterwarehouse"] = "ПРОНИКНУТЬ НА СКЛАД",
		["obj1_enterwarehouse_desc"] = "Проникните на склад.",
		["obj2_findsecuritydoor"] = "НАЙТИ СЕРВЕРНУЮ",
		["obj2_findsecuritydoor_desc"] = "Найдите серверную комнату. Она должна быть где-то на складе, вероятнее всего за закрытой дверью.",
		["obj3_getsecuritydooropen"] = "ОТКРЫТЬ ДВЕРЬ",
		["obj3_getsecuritydooropen_desc"] = "Найти способ открыть дверь.",
		["obj4_openseconddoor"] = "ВСКРЫТЬ СЕРВЕРНУЮ КОМНАТУ",
		["obj4_openseconddoor_desc"] = "Проникнуть в серверную комнату. Ключ-карта или дрель помогут в этом.",
		["obj5_hack"] = "ВЗЛОМАТЬ НОУТБУК",
		["obj5_hack_desc"] = "Взломать ноутбук, используя софт, предоставленный Джекелом.",
		["obj5b_explode"] = "ОБЕЗВРЕДИТЬ C4!",
		["obj5b_explode_desc"] = "Здесь C4! Обезвредьте его или убегайте!",
		["obj6_wait"] = "ОТПРАВИТЬ ДАННЫЕ",
		["obj6_wait_desc"] = "Взлом завершён. Отправьте данные Джекелу.",
		["obj7_escapeorloot"] = "ДОСТУПНА ЭВАКУАЦИЯ",
		["obj7_escapeorloot_desc"] = "Эвакуируйтесь, как только будете довольны наградой.",

		["heist_int_dock_burn_name"] = "Выгорание",
		["heist_int_dock_burn_brief"] = "Нет времени продумывать план, они собираются перевозить мастер-серверы.\nВодитель подвезёт грузовик с вооружёнными клоунами прямо к воротам.",
		["heist_wetwork_burn_name"] = "Выгорание",
		["heist_wetwork_burn_brief"] = "Итак, мы почти у места. Вы уже были здесь, но в этот раз мы вторгаемся с шумом.\nВозможно, тут ещё осталась добыча, но это не главное.\n\nИщите всё, что поможет вам узнать, что внутри закрытых контейнеров. Камеры, вещи вокруг контейнеров, надписи на досках и тому подобное.",
		["wwburn_01"] = "ПОДГОТОВИТЬСЯ",
		["wwburn_01_desc"] = "Мы у главных ворот, наёмники будут повсюду, поэтому готовьтесь к перестрелке.",
		["wwburn_02"] = "НАЙТИ СЕРВЕРЫ",
		["wwburn_02_desc"] = "Найдите три контейнера, в которых содержатся мастер-серверы.",
		["wwburn_03"] = "СЖЕЧЬ РЕЗЕРВНЫЕ КОПИИ",
		["wwburn_03_desc"] = "Сожгите резервные копии мастер-серверов, они будут в тех же контейнерах.",
		["wwburn_04"] = "ДОСТУПНА ЭВАКУАЦИЯ",
		["wwburn_04_desc"] = "Покиньте локацию, или найдите дополнительную добычу.",

		["wwburn_serverpku"] = "Secure",
		["wwburn_gaspku"] = "Collect",
		["wwburn_defend"] = "Defend",
		["wwburn_container"] = "Shipping Container",

		["menu_jukebox_resmusic_wetwork"] = "Spectre Shark",
		["menu_jukebox_screen_resmusic_wetwork"] = "Spectre Shark",
		["menu_jukebox_resmusic_bluewave"] = "Spectre Shark 2020",
		["menu_jukebox_screen_resmusic_bluewave"] = "Spectre Shark 2020",
		["menu_jukebox_resmusic_burnout"] = "Brute Force",
		["menu_jukebox_screen_resmusic_burnout"] = "Brute Force",
		["menu_jukebox_resmusic_doghouse"] = "Bleeding Edge",
		["menu_jukebox_screen_resmusic_doghouse"] = "Bleeding Edge",
		["menu_jukebox_resmusic_lethalforce"] = "Lethal Force",
		["menu_jukebox_screen_resmusic_lethalforce"] = "Lethal Force",
		["menu_jukebox_resmusic_redmarks"] = "Red Marks",
		["menu_jukebox_screen_resmusic_redmarks"] = "Red Marks",
		["menu_jukebox_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_screen_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_screen_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_screen_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_m1"] = "Criminal Intent (Old Version)",
		["menu_jukebox_screen_m2"] = "Preparations (Old Version)",
		["menu_jukebox_screen_m3"] = "Blueprints (Prototype Version)",
		["menu_jukebox_screen_m4"] = "Resistance",
		["menu_jukebox_screen_m5"] = "Fortress",
		["menu_jukebox_screen_m6"] = "Payday Royale Theme",
		["menu_jukebox_screen_m_holiday"] = "The Headless Bulldozer",

		["menu_color_plus"] = "E3 PAYDAY+",
		["menu_color_rvd1"] = "Inverted",
		["menu_color_e3nice"] = "E3 Nice",
		["menu_color_force"] = "E3 BHD",
		["menu_color_halloween"] = "Change",
		["menu_color_halloween2"] = "Pumpkin Spice",

		["color_plus"] = "E3 PAYDAY+",
		["color_rvd1"] = "Inverted",
		["color_e3nice"] = "E3 Nice",
		["color_force"] = "E3 BHD",
		["color_halloween"] = "Change",
		["color_halloween2"] = "Pumpkin Spice",

		["gm_gms_purchase"] = "Купить монетами Континенталь",
		["gm_gms_purchase_window_title"] = "Вы уверены?",
		["gm_gms_purchase_window_message"] = "Вы действительно хотите купить '{1}'?\n\nЭто будет стоить вам {2} {3}.",
		["gm_gms_purchase_failed"] = "Невозможно купить",
		["gm_gms_free_of_charge_message"] = "{1} бесплатен и может быть использован сколько угодно раз.",
		["gm_gms_cannot_afford_message"] = "Вы не можете купить {1}, так как у вас недостаточно {3}. Чтобы купить {1}, нужно {2} {3}",

		["bm_menu_amount_locked"] = "НЕТ В НАЛИЧИИ",

		["pdth_hud_challenges"] = "Испытания",
		["pdth_hud_challenges_hint"] = "Посмотреть выполненные и активные испытания.",
		["pdth_hud_active_challenges"] = "Активные испытания",
		["pdth_hud_active_challenges_hint"] = "Текущие и активные испытания.",
		["pdth_hud_completed_challenges"] = "Выполненные испытания",
		["pdth_hud_completed_challenges_hint"] = "Завершенные испытания.",

		["ch_vs_desc"] = "Используя $weapon, устраните $count $eneType. Убийства в ближнем бою не засчитываются для выполнения этого испытания.",
		["ch_vs_head_shots_desc"] = "Используя $weapon, устраните $count $eneType выстрелами в голову.",
		["ch_vs"] = "$weapon против $eneType $no",
		["ch_vs_head_shots"] = "$weapon против $eneType В ГОЛОВУ $no",

		["ene_law"] = "всех",
		["ene_law_desc"] = "врагов",

		["menu_me"] = "Грабитель",

		["RestorationModPDTHChallengesTitleID"] = "Отображать испытания из PDTH",
		["RestorationModPDTHChallengesDescID"] = "Включает отображение испытаний из PDTH в меню и на HUD.",

		["RestorationModRaidLockPickingTitleID"] = "Modify Lockpicks",
		["RestorationModRaidLockPickingDescID"] = "Should the mod modify lockpicks? This changes the gameplay revolving lockpicks",
		["RestorationModRaidLockPickingVOTitleID"] = "Play Voice Lines",
		["RestorationModRaidLockPickingVODescID"] = "Should the mod play voice lines when picking a lock?",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT Взломать",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT Убедить",
		["hud_legend_exit"] = "$BTN_CANCEL Выйти",
		["RestorationModArmorFixTitleID"] = "Фикс подсвечивания брони",
		["RestorationModArmorFixDescID"] = "Включить или выключить фикс подсвечивания брони.",

		-- /// Challenges Below ///

		["ch_deploy_ammobag_hl"] = "Last Bullet!",
		["ch_deploy_ammobag"] = "Разложить $count сумок с патронами.",
		["ch_plant_tripmine_hl"] = "Лазерное шоу",
		["ch_plant_tripmine"] = "Разложить $count мин.",
		["ch_deploy_medicbag_hl"] = "Медицинская страховка",
		["ch_deploy_medicbag"] = "Разложить $count сумок с медикаментами.",
		["ch_deploy_ecm_hl"] = "Враг системы",
		["ch_deploy_ecm"] = "Разложить $count генераторов помех.",
		["ch_deploy_fak_hl"] = "Линия жизни",
		["ch_deploy_fak"] = "Разложить $count аптечек первой помощи.",
		["ch_deploy_sentry_hl"] = "Любитель Уайт Месы",
		["ch_deploy_sentry"] = "Разложить $count турелей.",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "ТОЛСТАЯ БРОНЯ, БОЛЬШИЕ ПУШКИ",
		["ch_watchdogs_d1_heavy_wpn1"] = "Пройти первый день ограбления 'Сторожевые псы', используя только УКТЖ, миниганы, ракетомёты или снайперскую винтоку Thanatos, на уровни сложности OVERKILL или выше. Для выполнения этого испытания, ограбление нужно играть с самого начала.",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "Статус",
		["menu_state_filter"] = "Фильтр по статусу",
		["menu_state_filter_help"] = "Показывает статус лобби",
		["menu_state_lobby"] = "В лобби",
		["menu_state_loading"] = "Загружается",
		["menu_state_ingame"] = "В игре",
				
		-- ///Stuff ripped from the various locale files we had ///

		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "Меч Безголового Бульдозера",
		["menu_l_global_value_halloween_sword"] = "Это предмет из Хеллоуина 2013!",

		--S&W .500
		["bm_w_shatters_fury"] = "Феникс .500",

		["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "Ствол 'Горус'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "Ствол 'Шаттер'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "Ствол 'Хатхор'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "Ствол 'Фаерберд'",

		["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "Эргономичная рукоять",

		["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "Гладкий барабан",

		["menu_l_global_value_shatters_fury"] = "Это предмет ВЕРИТАС!",

		--MK-23
		--Semi-automatic pistol. Hold down ¦ to aim. Release to fire.
		["bm_w_socom"] = "Анубис .45",
		["bm_w_x_socom"] = "Парные Анубис .45",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Комбинированный модуль 'Ра'",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Включается на кнопку $BTN_GADGET.",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "Нет милосердию",
		["heist_no_mercy_ranted_brief"] = "Мы отправляется в госпиталь 'Милосердие' за кровью. У местного пациента обнаружили какой-то редкий вирус, образец которого нам нужно заполучить. Пусть вас ничего не останавливает, ибо платят очень хорошо. Конец света не наступит, если мы прольём немного крови за большие деньги, не так ли?",

		["heist_nmh_res_name"] = "Госпиталь 'Милосердие'",
		["heist_nmh_res_brief"] = "Нашему клиенту нужен образец крови пациента, находящегося в отделе интенсивной терапии в госпитале 'Милосердие'. Вам нужно будет войти туда, вырубить камеры, проконтролировать толпу и дать мне доступ в базу данных, чтобы я смог найти цель. Учитывая слабую охрану там, это должна быть чистая и красивая работа. Я заберу вас с крыши, когда вы закончите. Работа немного мутная, заказана через третьих лиц, у которых есть знакомые в военной сфере, но это стоит того. За работу мы получим кое-что, что нам пригодится в будущем, и довольно неплохие деньги.",

		["heist_nmh_new"] = "Возьмите и протестируйте кровь у пациента",
		["heist_nmh_new_desc"] = "Вам нужно найти центрифугу и проверить образцы крови.",

		["heist_nmh_new2"] = "Вызовите лифт",
		["heist_nmh_new2_desc"] = "Нажмите кнопку и ожидайте лифт",

		["heist_nmh_new3"] = "Вызовите лифт",
		["heist_nmh_new3_desc"] = "Нажмите кнопку и ожидайте лифт",	

		--OICW--
		["bm_w_osipr"] = "SABR",
		["bm_w_osipr_gl"] = "SABR - подствольный гранатомёт",

		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "Банк GO - Ремастер",

		["heist_gobank_v2_name"] = "Банк GO - Ремастер",
		["heist_gobank_v2_brief"] = "Классическое ограбление банка. Взломайте хранилище, опустошите клиентские ячейки и вынесите ценности. Бэйн говорит, что у этих банков самый низкий рейтинг ограблений в стране. Пора изменить это.\n\n» Найдите ключ-карты. Для хранилищна нужно две\n» Если не получится - используйте термобур\n» Взломайте клиентские ячейки\n» Соберите небесный крюк\n» Вытащите деньги",

		["heist_roberts_v2_name"] = "Банк Робертс",
		["heist_roberts_v2_brief"] = "У нас есть наводка на банк. Не самый большой, но есть информация, что в его хранилище временно хранится очень много наличных. Иностранная валюта для обмена.\n\nВ любом случае, вы знаете, как действовать: как вам захочется. Тихо прокрадитесь в банк или устройте пекло и погром. В любом случае, я знаю, как вытащить оттуда деньги. Вы узнаете, о чём я, когда увидите. Я думаю, вам это понравится.",

		["csgo_plane_timer_text"] = "Ожидайте самолет &&TIMER",
		["csgo_plane_timer_desc"] = "Ожидайте самолет &&TIMER",

		["hud_equipment_pickup_spraycan"] = "Нажмите $BTN_INTERACT чтобы подобрать краску",
		["hud_action_spraypaint"] = "Нажмите $BTN_INTERACT чтобы рисовать",
		["hud_action_spraypaint_none"] = "Необходима краска",
		["spraycan_obtained"] = "Краска получена",
		["hud_equipment_obtained_spraycan"] = "Краска получена",

		["trophy_csgo01"] = "Ящик с граффити",
		["trophy_csgo01_desc"] = "И за него даже не пришлось платить!",
		["trophy_csgo01_objective"] = "На ограблении Банк GO - Ремастер, найдите краску и нарисуйте граффити в хранилище.",

		["END"] = "КОНЕЦ",	

		--Whurr Heat Street Edit
		["heist_heat_street_new_name"] = "Схватка на улице (классика)",
		["heist_heat_street_new_brief"] = "Говорят, что ничего не бывает наверняка, но эта работа выглядит как нельзя проще: зайти, взять кейс, уйти. Ваш доверенный водитель Мэтт будет ждать вас в ближайшей аллее, и, если вы доберётесь до фургона, всё пройдёт как по маслу.",
		["heist_street_new_name"] = "Схватка на улице (классика)",
		["heist_street_new_brief"] = "Говорят, что ничего не бывает наверняка, но эта работа выглядит как нельзя проще: зайти, взять кейс, уйти. Ваш доверенный водитель Мэтт будет ждать вас в ближайшей аллее, и, если вы доберётесь до фургона, всё пройдёт как по маслу.",

		--Heat Street, Skirmish edition
		["heist_skm_heat_street_name"] = "Жилой район - здание 'Инквелл'",
		["heist_skm_heat_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",
		["heist_skm_street_name"] = "Скирмиш: Жилой район - здание 'Инквелл'",
		["heist_skm_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",	

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "Рождественское спасение Хокстона",
		["heist_xmn_hox1"] = "Рождественский побег",
		["heist_xmn_hox_1_brief"] = "Дантист организовал новое судебное разбирательство для Хокстона. Нет, не для тебя, Хокс. Я имел в виду... Для старого. Ладно, с кличками потом разберёмся. Суд пройдёт быстро. С его статьёй он всё равно не выйдет из тюрьмы. Мы должны перехватить Хокса, пока его ведут с заседания. Спасём Хокстона и покажем огромный средний палец судебной системе. Действуйте громко: взорвите стену в здании суда, хватайте Хокса и сваливайте.$NL;$NL;Улицы вокруг здания суда перекрыты. Они ожидают подвоха, так что готовьте пушки покрупнее и боеприпасов побольше.",
		["heist_xmn_hox2"] = "Рожденственские поиски",
		["heist_xmn_hox_2_brief"] = "Парни, спасибо за то, что вытащили меня. Только я уверен в том, что меня подставили. Я не должен был попасть в тюрьму. У федералов было на меня гораздо больше, чем эти сволочи смогли бы раскопать. Кто-то решил меня сдать. Я узнаю, кто это сделал.$NL;$NL;Это будет нелегко, так что мы не будем ходить вокруг да около, ладно? Никаких сделок или связей с контактами. Мы отправимся сразу к месту, где всё началось. В здание имени Эдгара Гувера, самый главный улей FBI. Мы выясним, кто попытался меня поиметь.",
		["heist_xmn_hox_brief"] = "Дантист сфальсифицировал новое судебное разбирательство для Хокстона. Мы должны перехватить его сразу после слушания. Действовать будете настолько громко, насколько это возможно: взрываете стену, хватаете Хокстона и сбегаете к чертям.$NL;$NL;» Освободите Хокстона$NL;» Проведите его до бронированного грузовика$NL;» Сопровождайте грузовик$NL;» Скройтесь с места преступления вместе с Хокстоном.",

		["heist_xmn_tag_name"] = "Проникновение на Рождество",
	})

	local job = Global.level_data and Global.level_data.level_id
	for _,j4 in ipairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == j4 then
			log("Spooky!")
			LocalizationManager:add_localized_strings({	
				["hud_assault_vip"] = "ПОБЕДИТЕ СТРАХ И ПРОСНИТЕСЬ",
			})
			break
		end
	end			
	
end)
