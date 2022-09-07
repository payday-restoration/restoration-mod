-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "Найкраща",
		["menu_es_crew"] = "Командна",
		["menu_es_personal"] = "Особиста",
		["menu_es_bad"] = "Погана",
		["menu_es_other"] = "iнше",
		["RestorationPDTHHudNeeded"] = "PD:TH HUD REBORN IS REQUIRED!",
		["menu_paygrade"] = "Ступiнь оплати: ",
		["menu_diffgrade"] = "Складнiсть: ",
		["menu_utility_radial_menu_name"] = "Utility Radial Menu",
		["menu_utility_radial_menu_desc"] = "Open the Utility Menu",

		["res_credits"] = "Титри Restoration Mod",
		["res_credits_help"] = "Подивитись титри RESTORATION MOD.",

		["Warning_overhaul_title"] = "WARNING: Game closing to prevent save corruption.",
		["dialog_show_overhaul_dialog"] = "You are DISABLING the Complete Overhaul. It is typically NOT RECOMMENDED to do this, and you should instead REMOVE the mod from your mods folder if you intend not to use the Overhaul actively.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",
		["dialog_enable_overhaul_dialog"] = "You are ENABLING the Complete Overhaul. The Overhaul should typically remain ON at all times, and only be disabled by removing the mod from your mods folder.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",

		["res_saveboost"] = "УТРИМАЙТЕ $BTN_INTERACT ЩОБИ ПРОКАЧАТИСЯ ДО 100 РiВНЯ",

		["RestorationModOptionsButtonTitleID"] = "Настройкi Restoration Mod",
		["RestorationModOptionsButtonDescID"] = "Настройкi для Restoration Mod.",
		["RestorationModHUDOptionsButtonTitleID"] = "Настройкi iнтерфейса Restoration Mod",
		["RestorationModHUDOptionsButtonDescID"] = "Настройкi iнтерфейса в Restoration Mod.",
		["RestorationModOTHEROptionsButtonTitleID"] = "Додатковi настройкi Restoration Mod",
		["RestorationModOTHEROptionsButtonDescID"] = "Додатковi настройкi Restoration Mod.",
		["RestorationModUIOptionsButtonTitleID"] = "Alpha UI",
		["RestorationModUIOptionsButtonDescID"] = "Опцii Alpha UI.",
		["RestorationModTimeOfDayTitleID"] = "Новi та случанi часи доби",
		["RestorationModTimeOfDayDescID"] = "Позволяе настраювати часи доби на дяких пограбуваннях.",

		["restoration_level_data_unknown"] = "НЕВiДОМИЙ ЧАС, НЕВiДОМЕ МiСТО",
		["RestorationModEnv_BanksTitleID"] = "Пограбування банку",
		["RestorationModEnv_BanksDescID"] = "Вибрати погоду для пограбування банку.",
		["RestorationModEnv_RVD1TitleID"] = "Скаженi пси - день 1",
		["RestorationModEnv_RVD1DescID"] = "Вибрати погоду для пограбування Скаженi пси (день 1).",
		["RestorationModEnv_RVD2TitleID"] = "Скаженi пси - день 2",
		["RestorationModEnv_RVD2DescID"] = "Вибрати погоду для пограбування Скаженi пси (день 2).",
		["RestorationModEnv_FSD1TitleID"] = "Пiдпалюватель - день 1",
		["RestorationModEnv_FSD1DescID"] = "Вибрати погоду для пограбування Пiдпалюватель (день 1).",
		["RestorationModEnv_PBR2TitleID"] = "Пташка у небi",
		["RestorationModEnv_PBR2DescID"] = "Вибрати погоду для пограбування Пташка у небi.",
		["RestorationModEnv_CJ2TitleID"] = "Бомба: Доки",
		["RestorationModEnv_CJ2DescID"] = "Вибрати погоду для пограбування Бомба: Доки.",
		["RestorationModEnv_UnderPassTitleID"] = "Транспорт: Проïзд",
		["RestorationModEnv_UnderPassDescID"] = "Вибрати погоду для пограбування Транспорт: Проïзд.",
		["RestorationModEnv_MallCrasherTitleID"] = "Руйнiвник",
		["RestorationModEnv_MallCrasherDescID"] = "Вибрати погоду для пограбування Руйнiвник.",
		["RestorationModEnv_Mia_1TitleID"] = "Г.Л.Майами - день 1",
		["RestorationModEnv_Mia_1DescID"] = "Вибрати погоду для пограбування Горяча лiнiя Майами (день 1).",
		["RestorationModEnv_FSD3TitleID"] = "Пiдпалюватель - день 3",
		["RestorationModEnv_FSD3DescID"] = "Вибрати погоду для пограбування Пiдпалюватель (день 3).",
		["RestorationModEnv_WDD1NTitleID"] = "Сторож. пси 1 (Ночь)",
		["RestorationModEnv_WDD1NDescID"] = "Вибрати погоду для пограбування Сторожовi пси (день 1 - нiчний).",
		["RestorationModEnv_WDD1DTitleID"] = "Сторож. пси 1 (День)",
		["RestorationModEnv_WDD1DDescID"] = "Вибрати погоду для пограбування Сторожовi пси (день 1 - днiвний).",
		["RestorationModEnv_WDD2DTitleID"] = "Сторож. пси 1 (День))",
		["RestorationModEnv_WDD2DDescID"] = "Вибрати погоду для пограбування Сторожовi пси (день  - днiвний).",
		["RestorationModEnv_Alex3TitleID"] = "Пацюки - день 3",
		["RestorationModEnv_Alex3DescID"] = "Вибрати погоду для пограбування Пацюки (день 3).",
		["RestorationModEnv_BigTitleID"] = "Великий банк",
		["RestorationModEnv_BigDescID"] = "Вибрати погоду для пограбування Великий банк.",
		["RestorationModEnv_FSTitleID"] = "Чотири крамницi",
		["RestorationModEnv_FSDescID"] = "Вибрати погоду для пограбування Чотири крамницi.",
		["RestorationModEnv_UkraTitleID"] = "Украïнська справа",
		["RestorationModEnv_UkraDescID"] = "Вибрати погоду для пограбування Украïнська справа.",
		["RestorationModEnv_KosugiTitleID"] = "Нiчний рейд",
		["RestorationModEnv_KosugiDescID"] = "Вибрати погоду для пограбування Нiчний рейд.",
		["RestorationModEnv_PetaTitleID"] = "Симулятор кози - день 1",
		["RestorationModEnv_PetaDescID"] = "Вибрати погоду для пограбування Симулятор кози (день 1).",
		["RestorationModEnv_FRIENDTitleID"] = "Хатина",
		["RestorationModEnv_FRIENDDescID"] = "Вибрати погоду для пограбування Хатина Обличчя зi шрамом.",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "Вiдображення iконок навичок (Buff Tracker)",
		["RestorationModINFOHUDOptionsButtonDescID"] = "Вiдображуе iконки навичок, якi активнi на даний момент, у лiвому верхньому кутку екрану. Не требуе вiмкнутого Alpha UI.",
		["RestorationModInfo_HudTitleID"] = "Увiмкнути iконки навичок",
		["RestorationModInfo_HudDescID"] = "Увiмкнути або вимкнути вiдображення iконки навичок.",
		["RestorationModInfo_SizeTitleID"] = "Розмiр iконок",
		["RestorationModInfo_SizeDescID"] = "Регулюе розмiр вiдобрадженних iконок навичок.",
		["RestorationModInfo_CountTitleID"] = "Число рядiв",
		["RestorationModInfo_CountDescID"] = "Регулюе кiлькiсть рядiв иконок навичок, якi будут вiдображенi, перш нiж додасться новий стовпчик.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "Агресивнè перезарядження",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "Ефективна витрата",
		["RestorationModInfo_ammo_efficiencyDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "Кровожерливiсть",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_bullet_stormTitleID"] = "Свинцевий зливень",
		["RestorationModInfo_bullet_stormDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "Польовий медик",
		["RestorationModInfo_revive_damage_reductionDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_desperadoTitleID"] = "Вiдчаяний",
		["RestorationModInfo_desperadoDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_grinderTitleID"] = "Гiстамiн (Нападник)",
		["RestorationModInfo_grinderDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_infiltratorTitleID"] = "Крадiй життя (iнтервент)",
		["RestorationModInfo_infiltratorDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "Натхнення",
		["RestorationModInfo_long_dis_reviveDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_messiahTitleID"] = "Месiя",
		["RestorationModInfo_messiahDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "Overkill",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "Колеса",
		["RestorationModInfo_revived_damage_reductionDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "Швидка допомога",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_rogueTitleID"] = "Смертельний iнстинкт (Шпигун)",
		["RestorationModInfo_rogueDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "Рухомий вiд смертi",
		["RestorationModInfo_increased_movement_speedDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "Влучний стрiлець",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_trigger_happyTitleID"] = "Невгамовний стрiлець",
		["RestorationModInfo_trigger_happyDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "Шiстка",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_unseen_strikeTitleID"] = "Удар исподтишка",
		["RestorationModInfo_unseen_strikeDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_survive_one_hitTitleID"] = "Татуювання Онi (Якудза)",
		["RestorationModInfo_survive_one_hitDescID"] = "Вiмкнути або вимкнути вiдображеня iконок даного навичка.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "Лiкування вiд Медичних сумок",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "Вiмкнути або вимкнути вiдображеня лiкування вiд Медичних сумок.",
		["RestorationModAltLastDownColorTitleID"] = "iнший фильтр для останнього паддiння",
		["RestorationModAltLastDownColorDescID"] = "Перемикаè колiрний фiльтр при останньому падiннi на color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Вiдключити нахил камеру при падiннi",
		["RestorationModNoBleedoutTiltDescID"] = "Вiдключаè нахил камери, який вiдбуваèться пiсля падiння.",
		["RestorationModADSTransitionStyleTitleID"] = "Стиль прицеливания",
		["RestorationModADSTransitionStyleDescID"] = "Выбор \"анимации\" прицеливания.",
		["RestorationModGCGPYPMMSACTitleID"] = "Сурьезный режим",
		["RestorationModGCGPYPMMSACDescID"] = "Отключает плазменные трассеры и регенерацию патронов от некоторых модулей. Требует перезапуска ограбления.",
		["RestorationModWpnCatTitleID"] = "Сортировка меню оружия",
		["RestorationModWpnCatDescID"] = "Изменить порядок оружия в меню покупки. Требуется перезапуск.",
		["RestorationModAutoDMRsTitleID"] = "Авто. марксманские винтовки",
		["RestorationModAutoDMRsDescID"] = "Марксманские винтовки будут сразу установлены в автоматический режим.",
		["RestorationModSprintCancelTitleID"] = "'Изворотливый' отменяет перезарядку",
		["RestorationModSprintCancelDescID"] = "Пиковый навык \"Изворотливый\" отменит перезарядку при начале бега. Перезарядка во время бега не отменяется.",
		["RestorationModSevenHoldTitleID"] = "Липкие интеракции (Press2Hold)",
		["RestorationModSevenHoldDescID"] = "Для интеракций больше не требуется держать клавишу.",
		["RestorationModSevenHoldDeployCancelTitleID"] = "Снаряжение отменяет интеракцию",
		["RestorationModSevenHoldDeployCancelDescID"] = "Кнопка снаряжения будет отменять текущую интеракцию. Требует включения Липких интеракций.",
		["RestorationModAimDeploysBipodTitleID"] = "Прицеливание с сошками",
		["RestorationModAimDeploysBipodDescID"] = "Кнопка прицеливания развернет сошки, если имеется такая возможность.",
		["RestorationModMoveCancelBipodTitleID"] = "Движение убирает сошки",
		["RestorationModMoveCancelBipodDescID"] = "Клавиши движения развернут сошки.",
		["RestorationModClassicMoviesTitleID"] = "Класичний фон пiдготовки",
		["RestorationModClassicMoviesDescID"] = "Включити або вимкнути фон екрану пiдготовки з PD: TH при грi на класичних пограбуваннях.",

		["vanilla_on_rails"] = "Стандартный/рельсовый",
		["kf_mw_style"] = "Стиль KF1/CoD",
		["tilt_in"] = "Наклон",
		
		["base_wpn_cat"] = "Сортировать по основным категориям",
		["sub_wpn_cat"] = "Сортировать по саб-категориям",

		["default"] = "Стандартна",
		["random"] = "Випадковий",
		["mellowday"] = "Помiрний день",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "Покращена стандартна",
		["env_trailer_bank"] = "Банк - як у трейлерi",
		["rvd1_alt1"] = "Нiчне життя",
		["rvd1_alt2"] = "Рожевий туман",
		["rvd2_alt"] = "Пасмурна",
		["fsd1_eve"] = "Вечiрня",
		["bos_alt"] = "Рожеве небо",
		["dockyard_alt"] = "Нiчна змiна",
		["underpass_foggyday"] = "Туманний день",
		["mall_alt"] = "Пiсляобiднiй Шопiнг",
		["hlm_morn"] = "Ранковий дзвiнок",
		["funny_and_epic_synthwave_very_eighties"] = "Ретро",
		["brightnight"] = "Бiла нiч",
		["docks"] = "Порт",
		["bank_green"] = "Зеленоватый з беты",
		["cloudy_day"] = "Хмарний день",
		["shadowraid_day"] = "Днiвний рейд",
		["shadowraiud_darker"] = "Похмурий рейд",
		["friend_pink"] = "Рожевий закат",
		["friend_night"] = "Нiч в Майами",
		["off"] = "Вимкнути",
		["windowofoppurtunity"] = "Window Of Opportunity",
		["wheresthevan"] = "Where's The Van",
		["menu_jukebox_heist_ponr"] = "Точка невозврата",
		["RestorationModPaintingsTitleID"] = "Вирiзанi картини в картиннiй галереï",
		["RestorationModPaintingsDescID"] = "Включаè або вимикаè вiдображення вирiзаних картин на пограбуваннi 'Картинна галерея'. Працюè тiльки для хоста.",
		["RestorationModMainHUDTitleID"] = "Alpha HUD - ВКЛ/ВИМК",
		["RestorationModMainHUDDescID"] = "Повнiстю включаè або вимикаè iнтерфейс з альфа-версiï гри.",
		["RestorationModWaypointsTitleID"] = "iконки цiлей з Альфи",
		["RestorationModWaypointsDescID"] = "Включити або вимкнути iконки, що вказують на поточну мету з альфа-версiï гри.",
		["RestorationModAssaultPanelTitleID"] = "Стрiчка штурму з Альфи",
		["RestorationModAssaultPanelDescID"] = "Включити або вимкнути стрiчку штурму з альфа-версiï гри.",
		["RestorationModAltAssaultTitleID"] = "iндикатор штурму з ранньоï Альфи",
		["RestorationModAltAssaultDescID"] = "Включити або вимкнути iндикатор штурму з ранньоï альфа-версiï гри. Замiнюè стрiчку штурму.",
		["RestorationModObjectivesPanelTitleID"] = "Панель завдань з Альфи",
		["RestorationModObjectivesPanelDescID"] = "Включити або вимкнути панель завдань з альфа-версiï гри.",
		["RestorationModPresenterTitleID"] = "Презентер з Альфи",
		["RestorationModPresenterDescID"] = "Включити або вимкнути презентер з альфа-версiï гри, якi використовуèться при захопленнi видобутку i для нагадування про завдання.",
		["RestorationModInteractionTitleID"] = "Шкала iнтеракцiï з Альфи",
		["RestorationModInteractionDescID"] = "Включити або вимкнути шкалу iнтеракцiï з альфа-версiï гри.",
		["RestorationModStealthTitleID"] = "iндикатор скритностi з Альфи",
		["RestorationModStealthDescID"] = "Включити або вимкнути iндикатор скритностi з Альфи. Використовуèться при Стелсi.",
		["RestorationModDownTitleID"] = "Таймер падiння з Альфи",
		["RestorationModDownDescID"] = "Включити або вимкнути таймер падiння з альфа-версiï гри.",
		["RestorationModBagTitleID"] = "Панель сумок з Альфи",
		["RestorationModBagDescID"] = "Включити або вимкнути панель сумок з альфа-версiï гри.",
		["RestorationModHostageTitleID"] = "Ховати панель заручникiв",
		["RestorationModHostageDescID"] = "Якщо включений, ховаè панель заручникiв коли починаèться штурм, за умови, що стрiчка або iндикатор штурму з Альфи включенi.",
		["RestorationModDifficultyMarkersTitleID"] = "iконки складнощiв з пре-релiзу",
		["RestorationModDifficultyMarkersDescID"] = "Включити або вимкнути iконки складнощiв з пре-релiзу гри.",
		["RestorationModStaminaIndicatorTitleID"] = "Дебаговая смужка витривалостi",
		["RestorationModStaminaIndicatorDescID"] = "Увiмкнути або вимкнути дебагову смужку витривалостi.",
		["RestorationModBlackScreenTitleID"] = "Початок пограбування з Restoration",
		["RestorationModBlackScreenDescID"] = "Включити або вимкнути початкову заставку пограбувань з Restoration.",
		["RestorationModLoadoutsTitleID"] = "Меню пiдготовки з Альфи",
		["RestorationModLoadoutsDescID"] = "Включити або вимкнути меню пiдготовки з альфа-версiï гри.",
		["RestorationModDistrictTitleID"] = "Описи районiв в CRIME.NET",
		["RestorationModDistrictDescID"] = "Включити або вилучити описи районiв у CRIME.NET. описи не вiдповiдають геймплею.",
		["RestorationModSCOptionsButtonTitleID"] = "Опцiï Restoration Overhaul",
		["RestorationModSCOptionsButtonDescID"] = "Опцiï Restoration Overhaul",
		["RestorationModSCTitleID"] = "Complete Overhaul (DEBUG)",
		["RestorationModSCDescID"] = "Enable or disable Restoration's complete game overhaul. Toggling this option will automatically exit your game to prevent save corruption.",
		["RestorationModHolidayTitleID"] = "Святковi ефекти",
		["RestorationModHolidayDescID"] = "Включаè або вимикаè святковi ефекти в модi.",
		["RestorationModRestoreHitFlashTitleID"] = "Спалах при отриманнi урону",
		["RestorationModRestoreHitFlashDescID"] = "Включити або вимкнути спалах екрану при отриманнi урону зi старих версiй гри.",	
		["RestorationModNotifyTitleID"] = "Увiдомлення",
		["RestorationModNotifyDescID"] = "Включити або вимкнути повiдомлення мода.",
		["RestorationModPauseTitleID"] = "Меню паузы з Альфы",
		["RestorationModPauseDescID"] = "Включити або вимкнути меню паузи з альфа-версiï гри.",

		["menu_support"] = "Гайд / Допомога по ребалансу",
		["menu_support_help"] = "Переглянути гайд по ребалансу в Restoration Mod, отримати допомогу, знайти iнших гравцiв.",
		["menu_manual_header"] = "Placeholder Text",
		["hud_assault_alpha"] = "ПОЛiЦЕЙСЬКИЙ ШТУРМ",
		["hud_loot_secured_title"] = "ВИДОБУТОК ЗАХОПЛЕНА!",
		["debug_none"] = "ЗАВДАННЯ",

		["restoration_level_data_welcome_to_the_jungle_1"] = "18:24, база байкерской банды 'Overkill'",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "01:32, база байкерськоï банди 'Overkill'",
		["restoration_level_data_welcome_to_the_jungle_2"] = "18:00, Вiлла Вiвальдi",
		["restoration_level_data_framing_frame_1"] = "23:30, Капiтолiйська картинна галерея",
		["restoration_level_data_framing_frame_2"] = "00:30, покинутий вокзал",
		["restoration_level_data_framing_frame_3"] = "02:20, Пентхаус 'Хайрайз'",
		["restoration_level_data_election_day_1"] = "12:37, Пiрс 39",
		["restoration_level_data_election_day_2"] = "08:10, Склад",
		["restoration_level_data_election_day_3"] = "Hi! If you see this string during gameplay, report it to Restoration! Thank you!",
		["restoration_level_data_election_day_3_skip1"] = "16:25, Банк 'Капiтолiйський'",
		["restoration_level_data_election_day_3_skip2"] = "15:25, Банк 'Капiтолiйський'",
		["restoration_level_data_watchdogs_1"] = "16:10, Грузовик с мясом",
		["restoration_level_data_watchdogs_1_res"] = "21:10, вантажiвка з м'ясом",
		["restoration_level_data_watchdogs_2"] = "00:25, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_2_res"] = "00:25, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_1_night"] = "1:10, вантажiвка з м'ясом",
		["restoration_level_data_watchdogs_2_day"] = "18:05, Порт 'Альмендия'",
		["restoration_level_data_watchdogs_3_res"] = "00: 20 Мiст 'Вашингтон Джастайс'",
		["restoration_level_data_alex_1"] = "03:30, Тихий пагорб",
		["restoration_level_data_alex_2"] = "05:55, Наркозховище",
		["restoration_level_data_alex_3"] = "07:20, Мiст 'Вашингтон Джастайс'",
		["restoration_level_data_alex_1_res"] = "03:30, Тихий холм",
		["restoration_level_data_alex_2_res"] = "05:55, Наркозховище",
		["restoration_level_data_alex_3_res"] = "07:20, Мiст 'Вашингтон Джастайс'",
		["restoration_level_data_firestarter_1"] = "09:25, Приватний аеропорт",
		["restoration_level_data_firestarter_1_res"] = "09:25, Приватний аеропорт",
		["restoration_level_data_firestarter_2"] = "22:05, Офiс ФБР",
		["restoration_level_data_firestarter_2_res"] = "22:05, Офiс ФБР",
		["restoration_level_data_firestarter_3"] = "12:15, банк 'Харвест & трастi'",
		["restoration_level_data_firestarter_3_res"] = "12:15, банк 'Харвест & трастi'",
		["restoration_level_data_ukrainian_job"] = "14:50, 'Прекраснi штучки'",
		["restoration_level_data_ukrainian_job_res"] = "14:50, 'Прекраснi штучки''",
		["restoration_level_data_jewelry_store"] = "14:50, 'Прекраснi штучки''",
		["restoration_level_data_four_stores"] = "13:20, Магазини",
		["restoration_level_data_mallcrasher"] = "12:50, ТЦ 'Щит'",
		["restoration_level_data_nightclub"] = "20:00, Нiчний клуб 'зi смаком'",
		["restoration_level_data_branchbank"] = "12:15, банк 'Харвест & трастi'",
		["restoration_level_data_escape_cafe"] = "Ховайтесь!",
		["restoration_level_data_escape_park"] = "Ховайтесь!",
		["restoration_level_data_escape_cafe_day"] = "Ховайтесь!",
		["restoration_level_data_escape_park_day"] = "Ховайтесь!",
		["restoration_level_data_escape_street"] = "Ховайтесь!",
		["restoration_level_data_escape_overpass"] = "Ховайтесь!",
		["restoration_level_data_escape_garage"] = "Ховайтесь!",
		["restoration_level_data_escape_overpass_night"] = "Ховайтесь!",
		["restoration_level_data_safehouse"] = "12:00, Притулок",
		["restoration_level_data_arm_fac"] = "9:30, Гавань",
		["restoration_level_data_arm_par"] = "14:25, Центр мiста",
		["restoration_level_data_arm_hcm"] = "14:15, Центр мiста",
		["restoration_level_data_arm_cro"] = "12:55, Пересечение ул. МакКарти и ул. Джеймс",
		["restoration_level_data_arm_und"] = "20:15, Проïзд",
		["restoration_level_data_arm_for"] = "12:25, Поïзд 'Армадiлло'",
		["restoration_level_data_family"] = "11:25 AM, Джойеллi дi Фамiлья",
		["restoration_level_data_family_res"] = "11:25 AM, Джойеллi дi Фамiлья",
		["restoration_level_data_big"] = "14:15, Банк 'Беневолент'",
		["restoration_level_data_big_res"] = "14:15, Банк 'Беневолент'",
		["restoration_level_data_roberts"] = "08:47, Банк 'Робèртс'",
		["restoration_level_data_roberts_v2"] = "08:47, Банк 'Робертс'",
		["restoration_level_data_mia_1"] = "21:30, Мотель Комiсара",
		["restoration_level_data_mia_2"] = "11:45, Апартаменти Комiсара",
		["restoration_level_data_mia2_new"] = "11:45, Апартаменти Комiсара",
		["restoration_level_data_kosugi"] = "04:00, Склад 'Термiнал'",
		["restoration_level_data_gallery"] = "23:45, Капiтолiйська картинна галерея",
		["restoration_level_data_hox_1"] = "10:30, Пiдземний перехiд Будiвлi суду",
		["restoration_level_data_hox_2"] = "16:10, Будiвля iм. Джона Едгарда Гувера",
		["restoration_level_data_pines"] = "17:52, В глибинi лiсу",
		["restoration_level_data_mus"] = "20:15, Музей старовинного мистецтва iм. МакКендрика",
		["restoration_level_data_crojob2"] = "18:10, Вашингтонський порт",
		["restoration_level_data_crojob3"] = "15:35, Околиця лiсу",
		["restoration_level_data_crojob3_night"] = "20:35, Околиця лiсу",
		["restoration_level_data_cage"] = "19:55, 'Тойер Автос'",
		["restoration_level_data_hox_3"] = "23:55, Притулок ФБР",
		["restoration_level_data_rat"] = "19:55, Тихий пагорб",
		["restoration_level_data_shoutout_raid"] = "09:00, Склад 'Термiнал'",
		["restoration_level_data_arena"] = "21:00, GENSEC-Арена",
		["restoration_level_data_kenaz"] = "20:00, Лас-Вегас-Стрип-Казино 'Голден Грiн'",
		["restoration_level_data_jolly"] = "16:00, Лос-Анджелес - Зона катастрофы",
		["restoration_level_data_red2"] = "14:15, ЦЕНТР МiСТА-ПЕРШИЙ СВiТОВИЙ БАНК",
		["restoration_level_data_dinner"] = "08:01, Район м'ясокомбiнату - в засiдцi!",
		["restoration_level_data_nail"] = "00:00, Тихий пагорб",
		["restoration_level_data_haunted"] = "??:??, 'Притулок'",
		["restoration_level_data_pbr"] = "04:40, Невада-дослiдницький центр 'Блекрiдж'",
		["restoration_level_data_pbr2"] = "ЧАС НЕВiДОМИЙ, Z-170 'Зевс' - вантажний лiтак Murkywater",
		["restoration_level_data_cane"] = "15:15, Майстерня Санти",
		["restoration_level_data_peta"] = "12:00, Район в центрi мiста",
		["restoration_level_data_peta2"] = "17:43, Зруйнований комору",
		["restoration_level_data_man"] = "18:00, Покинута будiвля",
		["restoration_level_data_pal"] = "12:00, Передмiстя-Ремонт сантехнiки 'Bodhi'",
		["restoration_level_data_short1_stage1"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short1_stage2"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage1"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage2"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_short2_stage2b"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_dark"] = "02:21, Прихований вокзал",
		["restoration_level_data_mad"] = "ЧАС НЕВiДОМИЙ, десь в Росiï...",
		["restoration_level_data_born"] = "10:15, Байкерський клуб OVERKILL",
		["restoration_level_data_chew"] = "17:25, за Вашингтоном-поïзд що йде!",
		["restoration_level_data_flat"] = "16:02, Неблагополучний район-Притон Чавеза",
		["restoration_level_data_chill"] = "13:00, Притулок",
		["restoration_level_data_chill_combat"] = "13:00, Притулок - рейд полiцii!",
		["restoration_level_data_help"] = "DON'T TOUCH THAT DIAL, WE'RE JUST GETTING STARTED",
		["restoration_level_data_friend"] = "16:30, Майамi-Особняк Ель Фурейдiс",
		["restoration_level_data_fish"] = "19:30, Бiля Нью-Йорка-Яхта 'Лiта'",
		["restoration_level_data_spa"] = "19:00, Ньй-Йорк - Засiдка!",
		["restoration_level_data_moon"] = "23:00, Торговий центр 'Murica'",
		["restoration_level_data_run"] = "11:00, Житловий квартал - пiдстава!",
		["restoration_level_data_glace"] = "22:45, Мiст Грiн - пiвденна сторона",
		["restoration_level_data_dah"] = "01:30, 22 поверх - Хмарочос Гарнет Груп",
		["restoration_level_data_hvh"] = "ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК. ТiК-ТАК.",
		["restoration_level_data_wwh"] = "ЧАС НЕВiДОМИЙ, десь на Алясцi...",
		["restoration_level_data_rvd1"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_rvd2"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_brb"] = "18:53, Нью-Йорк, Бруклiн-Банк 'Харвест & Трастi'",
		["restoration_level_data_des"] = "ЧАС НЕВiДОМИЙ, Невада - Скеля Генрi",
		["restoration_level_data_sah"] = "ЧАС НЕВiДОМИЙ, Массачусетс - Особняк Шеклторн",
		["restoration_level_data_tag"] = "00:43, Будiвля iм. Джона Едгарда Гувера",
		["restoration_level_data_bph"] = "ЧАС НЕВiДОМИЙ, В'язниця ' Форт Клетсоп'",
		["restoration_level_data_nmh"] = "20:24, Госпiталь 'Милосердя' - iзоляцiйна палата",
		["restoration_level_data_vit"] = "13:07, Вашингтон - Бiлий дiм",
		["restoration_level_data_mex"] = "ЧАС НЕВiДОМИЙ, США - Южная граница",
		["restoration_level_data_mex_cooking"] = "ЧАС НЕВiДОМИЙ, Мексика - база Койопов",
		["restoration_level_data_bex"] = "ЧАС НЕВiДОМИЙ, Мексика - Банк Сан Мартiн",
		["restoration_level_data_pex"] = "ЧАС НЕВiДОМИЙ, Мексика - Полiцейська дiльниця",
		["restoration_level_data_fex"] = "ЧАС НЕВiДОМИЙ, Мексика - Хатина Булука",
		["restoration_level_data_chas"] = "20:30, Сан Франциско - Чайнатаун",
		["restoration_level_data_sand"] = "22:30, Сан Франциско - Порт",		
		["restoration_level_data_chca"] = "21:24, Затока Сан Франциско - Лайнер Black Cat",
		["restoration_level_data_pent"] = "23:30, Сан Франциско - Пентхаус Юфу Венга",
		["restoration_level_data_ranc"] = "18:24, Техас - Ранчо Мидленд",
		["restoration_level_data_wetwork"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_junk"] = "ЧАС НЕВiДОМИЙ, ЛОКАЦiЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_holly"] = "5:00 PM, Los Angeles - Lukas' Mansion",
		["restoration_level_data_lvl_friday"] = "17:00, Торговий центр 'Щит'",
		["restoration_level_data_skm_nightmare_lvl"] = "Прачечная? Хочешь отмыть грехи?",

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

		["heist_contact_shatter"] = "Джекèл",
		["heist_contact_akashic"] = "Нiко",

		["menu_contacts_shatter"] = "Союзники CRIMENET",
		
		["heist_contact_jackal_description"] = "Джекел почав свою карьеру в GenSec, но звiльнився пiсля iнциденту, пов'язаного з торговлею людьми, у которому були замiшаннi GenSec и OMNIA.\n\nЗараз вiн працюè на CRIMENET, пiставляя халепу прямо iм на хату.",
		
		["heist_contact_akashic_description"] = "У прошлому - високопоставленный агент Гектора Моралеса, Нiколас 'Нiко' Рене зараз командуе залишками Синалоанского картеля в США. \niх чисельнiсть мала, i бiльший Колумбiйський картель не збираèться нi надавати допомогу, нi вiдновлювати союз з CRIMENET. Нiко об'èднуèться з рiзними дрiбними бандами на схiдному узбережжi, а також з CRIMENET - вiн надасть своï ресурси в обмiн на послуги.",

		["bm_msk_shatter_true"] = "Шаттер",
		["bm_msk_shatter_true_desc"] = "Легендарна маска, про яку говорять впiвголоса.\n\nРозумiется, цу просто дублiкат.\n\nУ справжнiй масцi è дещо особливе, але думаю, вас влаштуè i копiя.\n\nФенiкс символiзуè переродження того, хто не може бути убитий. Спробуй його знищити, i вiн лише завдасть вогненний контр-удар.",

		["menu_l_global_value_veritas"] = "Restoration Mod",
		["menu_l_global_value_veritas_desc"] = "Це предмет з Restoration Mod!",

		["menu_alex_1_zipline"] = "Зiплайн для сумок",

		["menu_asset_wet_intel"] = "Розвiдданi",
		["menu_asset_risk_murky"] = "Найманцi Murkywater",
		["menu_asset_risk_bexico"] = "Мексиканська федеральна полiцiя",
		["menu_asset_risk_zombie"] = "зОмбi пОлiЦiЯ",
		["menu_asset_wet_boat"] = "Човен",
		["menu_asset_wet_boat_desc"] = "Купити додаткову точку скидання i втечi",

		["bm_msk_canada"] = "Пекельний хокей",
		["bm_msk_canada_desc"] = "Нiчого не залишайте позаду - навiть коли стаè жарко, ви боретеся за що хочете, коли хочете (навiть якщо це термобарична бомба).",
		["bm_msk_jsr"] = "Мiсiс Графiтi",
		["bm_msk_jsr_desc"] = "Створена справжнiм художником. Стирати графiтi - все одно, що спалювати книги, чи не так?\n\nМистецтво це мистецтво - його потрiбно поважати.",
		["bm_msk_jsrf"] = "Miстер Графiтi",
		["bm_msk_jsrf_desc"] = "За кожним графiтi стоïть iсторiя. Бути художником у безликому мiстi може бути болiсно.\n\nГрафiтi-немов книга. ïх потрiбно вмiти читати.",
		["bm_msk_courier_stash"] = "Сумка для видобутку",
		["bm_msk_courier_stash_desc"] = "Якщо потрiбно взяти кiлька зайвих сотенних купюр, а в кишенях вже не залишилося мiсця, ця маска цiлком зiйде.",

		["bm_msk_female_mask"] = "Стандартна маска (жiноча)",
		["bm_msk_female_mask_desc"] = "Стандартна маска, надаèться органiзацièю CRIMENET.\n\nЗроблена з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.",
		["bm_msk_female_mask_blood"] = "Вiдновлена маска (жiноча)",
		["bm_msk_female_mask_blood_desc"] = "Стандартна маска, надаèться органiзацièю CRIMENET.\n\nЗроблена з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.\n\nЦя маска была знайдена пiсля неудачного ограбления склада OMNIA, среди кровавого побоища.\n\nОстаннiм посланням банди, перш нiж вони пропали назавжди, було ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_female_mask_clown"] = "Розi",
		["bm_msk_female_mask_clown_desc"] = "Стандартна маска, надаèться органiзацièю CRIMENET.\n\nЗроблена з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.\n\nЦю маску носила грабiжниця, вiдома як Розi, хоча тепер у неï нова маска.\n\nНа вiдеозаписi з пограбування було видно, як вона знешкоджуè цiлий загiн спецназу абсолютно без зброï.",
		["bm_msk_male_mask"] = "Стандартна маска (чоловiча)",
		["bm_msk_male_mask_desc"] = "Стандартна маска, надаèться органiзацièю CRIMENET.\n\nЗроблена з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.",
		["bm_msk_male_mask_blood"] = "Вiдновлена маска (чоловiча)",
		["bm_msk_male_mask_blood_desc"] = "Стандартна маска, надаèться органiзацièю CRIMENET.\n\nЗроблена з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.\n\nЦю маску носила грабiжниця, вiдома як Розi, хоча тепер у неï нова маска.\n\nНа вiдеозаписi з пограбування було видно, як вона знешкоджуè цiлий загiн спецназу абсолютно без зброï''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_male_mask_clown"] = "Кросс",
		["bm_msk_male_mask_clown_desc"] = "Стандартна маска, що надаèться органiзацièю CRIMENET.\n\nделана з щiльного матерiалу, носити ïï не так просто, зате вона мiцна.\n\nПету маску носив грабiжник, вiдомий як крос, хоча тепер у нього нова маска.\n\nКросс-талановитий Стрiлець, i одного разу вивiв з ладу чотири бронегрузовика за п'ять секунд.",

		["bm_msk_twister_mask"] = "Чоловiк-загадка",
		["bm_msk_twister_mask_desc"] = "Хто ховаèться за цièю маскою-загадка.\n\nМоже, це який-небудь незнайомець, а може-хто-небудь, кого ви знали весь цей час.",
		["bm_msk_voodoo_mask"] = "Тёмна магiя",
		["bm_msk_voodoo_mask_desc"] = "Ця маска була знайдена в джунглях пiсля бомбардування-вона змогла винести наслiдки руйнувань, i тепер вважаèться передвiсником бiди.\n\nВона знайде вас, коли ви будете мати потребу в нiй найбiльше i допоможе пережити бiду.\n\nПитання лише в тому, якою цiною.",

		["bm_msk_f1"] = "Шолом X1",
		["bm_msk_f1_desc"] = "Не забувайте про захист, коли будете нестися по шосе або прослизати через пробки.\n\nЦей шолом захистить вiд жорсткого падiння, але явно не вiд куль.",
		["bm_msk_f1_b"] = "Шолом X1 (Чистий)",
		["bm_msk_f1_b_desc"] = "Не забувайте про захист, коли будете нестися по шосе або прослизати через пробки.\n\nЦей шолом захистить вiд жорсткого падiння, але явно не вiд куль.\n\nЦе дублiкат шолома, без брендових стiкерiв, який був знайдений в гаражi з дорогими машинами.\n\nТримайте цей шолом пiд рукою, i може бути одного разу, ви поïдете на однiй з таких.",
		["bm_msk_sweettooth"] = "Ласун",
		["bm_msk_sweettooth_desc"] = "Ласун (справжнè iм'я - Маркус 'Нiдлс' Кейн) - персонаж iз серiï iгор Twisted Metal. Ласун вiдомий як клоун-вбивця, який водить бойовий фургончик з морозивом.\n\nКажуть, одного разу вiн втiк з психiатричноï лiкарнi. Тепер вiн веде кримiнальне життя.",

		["bm_msk_wolf_stone"] = "Вульф з Stonecold",
		["bm_msk_wolf_stone_desc"] = "Оригiнальна маска Вульфа, яку вiн носив, коли вперше зiйшов з розуму i почав втiлювати злочини зi своïх улюблених iгор. Вважалося, що ця маска була загублена пiд час пограбування, натхненного грою 'Hyper Heisting'.\n\n ПО час раннiх пограбувань банди, маска знайшлася i була доставлена в притулок одним зi спiльникiв Бейна.\n\n орiгiнальний вiзерунок маски з часом потьмянiв, зовсiм як психiчна стабiльнiсть Вульфа.",

		["bm_msk_dallas_aged"] = "Стародавнiй Даллас",
		["bm_msk_dallas_aged_desc"] = "Ви з бандою виявили цi маски в дивнiй èгипетськiй скриньцi, знайденоï в скелi Генрi. Сама скринька виявилася загублена при перевезеннi, але ïï вмiст було передано вам.\n\nВ цих масках è щось незвичайне. Немаè iнформацiï, звiдки вони могли з'явитися.\n\nДжекел вважаè, що вони могли бути зробленi в якостi практичноï жарти, щоб налякати банду.\n\nОднак ви помiчаèте, що цi маски виглядають дуже, дуже старими.",
		["bm_msk_chains_aged"] = "Стародавнiй Чейнс",
		["bm_msk_chains_aged_desc"] = "Ви з бандою виявили цi маски в дивнiй èгипетськiй скриньцi, знайденоï в скелi Генрi. Сама скринька виявилася загублена при перевезеннi, але ïï вмiст було передано вам.\n\nВ цих масках è щось незвичайне. Немаè iнформацiï, звiдки вони могли з'явитися.\n\nДжекел вважаè, що вони могли бути зробленi в якостi практичноï жарти, щоб налякати банду.\n\nОднак ви помiчаèте, що цi маски виглядають дуже, дуже старими.",
		["bm_msk_hoxton_aged"] = "Стародавнiй Хокстон",
		["bm_msk_hoxton_aged_desc"] = "Ви з бандою виявили цi маски в дивнiй èгипетськiй скриньцi, знайденоï в скелi Генрi. Сама скринька виявилася загублена при перевезеннi, але ïï вмiст було передано вам.\n\nВ цих масках è щось незвичайне. Немаè iнформацiï, звiдки вони могли з'явитися.\n\nДжекел вважаè, що вони могли бути зробленi в якостi практичноï жарти, щоб налякати банду.\n\nОднак ви помiчаèте, що цi маски виглядають дуже, дуже старими.",
		["bm_msk_wolf_aged"] = "Стародавнiй Вульф",
		["bm_msk_wolf_aged_desc"] = "Ви з бандою виявили цi маски в дивнiй èгипетськiй скриньцi, знайденоï в скелi Генрi. Сама скринька виявилася загублена при перевезеннi, але ïï вмiст було передано вам.\n\nВ цих масках è щось незвичайне. Немаè iнформацiï, звiдки вони могли з'явитися.\n\nДжекел вважаè, що вони могли бути зробленi в якостi практичноï жарти, щоб налякати банду.\n\nОднак ви помiчаèте, що цi маски виглядають дуже, дуже старими.",

		["bm_msk_beef_dallas"] = "М`ясний Даллас",
		["bm_msk_beef_dallas_desc"] = "Банда використовувала цi маски пiд час пограбування 'м'ясокомбiнат'.\n\nДаллас вирiшив залишити дизайн своèï улюбленоï маски.",
		["bm_msk_beef_chains"] = "М`ясний Чейнс",
		["bm_msk_beef_chains_desc"] = "Банда використовувала цi маски пiд час пограбування 'м'ясокомбiнат'.\n\nЧейнс, будучи силовиком, захотiв як дизайн страхiтливу тварину. Що може бути страшнiшим, нiж чортiв динозавр?!",
		["bm_msk_beef_hoxton"] = "М`ясний Хокстон",
		["bm_msk_beef_hoxton_desc"] = "Банда використовувала цi маски пiд час пограбування 'м'ясокомбiнат'.\n\nХокстон залишив простий список побажань для своèï маски:\n- Захiстна!\n- Ефективна!\n- Стильная!\n\nТак i вийшла ця маска.",
		["bm_msk_beef_wolf"] = "М`ясний Вульф",
		["bm_msk_beef_wolf_desc"] = "Банда використовувала цi маски пiд час пограбування 'м'ясокомбiнат'.\n\nДизайн Вульфа був натхненний його улюбленим персонажем, якого вiн вигадав, коли ще розробляв iгри.",

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

		["bm_msk_secret_sydney"] = "Секретная Сидни",
		["bm_msk_secret_sydney_desc"] = "Когда Сидни услышала о секрете от Бейна, она не поверила в легенды о древней силе. Тем не менее, возможность сразиться с неизвестной, но крайне опасной организацией достаточно заинтересовала её.",

		["bm_msk_secret_richard"] = "Секретный Ричард",
		["bm_msk_secret_richard_desc"] = "По криминальному миру ходили слухи о киллере, которым вдохновлялся Джекет; киллер, который был ликвидирован неизвестной организацией. Когда Джекет услышал о секрете от Бейна, он вернулся с маской, похожей на ту, что носил его прародитель.",

		["bm_all_seeing"] = "Всевидящий якорь",
		["bm_all_seeing_desc"] = "Ужасающее видение, кошмарное зрелище.\n\nВысшие силы увидели вас и решили наградить.",

		["bm_msk_classic_helmet"] = "Классический силовик",
		["bm_msk_classic_helmet_desc"] = "Подарок от бывшего спецназовца. Прежде чем уйти на пенсию, он вычислил Джекела... И подарил ему единственную экипировку, которая у него осталась, чтобы помочь работе Джекела.\n\nЭто странное событие было не без причины: Он увидел своими глазами то, что OMNIA держала в тайне. Но он не стал копать эти тайны и вскоре покинул спецназ навсегда.\n\nДжекел прислал эти шлемы вам, в качестве награды за вашу помощь.",

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
		["RestorationModPONRTracksDescID"] = "Выберите музыку, которая начнется во время Точки невозврата в режиме Pro-Job.",
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
		["RestorationModExtraOptionsButtonDescID"] = "Еще больше опций!",
		["RestorationModRealAmmoTitleID"] = "Действительный счетчик патронов",
		["RestorationModRealAmmoDescID"] = "Счетчик патронов в запасе будет игнорировать патроны, которые уже заряжены.",
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
		["RestorationModVoiceIconTitleID"] = "Голосовой чат",
	    ["RestorationModVoiceIconDescID"] = "Отображает иконку, когда игрок использует голосовой чат.",
		["alpha_assault"] = "Уголок",
		["beta_assault"] = "Лента",

		["RestorationModDodgeDisplayTitleID"] = "Цифра шкалы уворота",
		["RestorationModDodgeDisplayDescID"] = "Максимальное число, которое *отображает* шкала уворота. Требует перезапуска.",
		["dd_scale"] = "150 -Текущий уворот",
		["dd_150"] = "150",
		["dd_100"] = "100",

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
		["menu_jukebox_resmusic_ticktockalpha"] = "Tick Tock (Альфа)",
		["menu_jukebox_screen_resmusic_ticktockalpha"] = "Tick Tock (Альфа)",
		["menu_jukebox_resmusic_doublecrossbeta"] = "Double Cross (Бета)",
		["menu_jukebox_screen_resmusic_doublecrossbeta"] = "Double Cross (Бета)",
		["menu_jukebox_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Бета)",
		["menu_jukebox_screen_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Бета)",
		["menu_jukebox_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Старый)",
		["menu_jukebox_screen_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Старый)",
		["menu_jukebox_resmusic_razormindbeta"] = "Razormind (Бета)",
		["menu_jukebox_screen_resmusic_razormindbeta"] = "Razormind (Бета)",
		["menu_jukebox_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_screen_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_screen_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_screen_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_m1"] = "Criminal Intent (Старый)",
		["menu_jukebox_screen_m2"] = "Preparations (Старый)",
		["menu_jukebox_screen_m3"] = "Blueprints (Прототип)",
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
		["ch_watchdogs_d1_heavy_wpn1"] = "Пройти первый день ограбления 'Сторожевые псы', используя только УКТЖ, миниганы, ракетомёты или снайперскую винтовку Thanatos, на уровни сложности OVERKILL или выше. Для выполнения этого испытания, ограбление нужно играть с самого начала.",
		
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
        ["bm_w_shatters_fury"] = "Револьвер Phoenix .500",

		["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "Ствол 'Горус'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "Ствол 'Шаттер'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "Ствол 'Хатхор'",
		["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "Ствол 'Фаерберд'",

		["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "Эргономичная рукоять",

		["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "Гладкий барабан",

		["menu_l_global_value_shatters_fury"] = "Это предмет ВЕРИТАС!",
		
		--MK-23
		--Semi-automatic pistol. Hold down ■ to aim. Release to fire.
		["bm_w_socom"] = "Пистолет Anubis .45",
		["bm_w_x_socom"] = "Парные Anubis .45",
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
		["bm_w_osipr"] = "Винтовка SABR",
		["bm_w_osipr_gl"] = "SABR - подствольный гранатомёт",
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "Банк GO - Ремастер",

		["heist_gobank_v2_name"] = "Банк GO - Ремастер",
		["heist_gobank_v2_brief"] = "Классическое ограбление банка. Взломайте хранилище, опустошите клиентские ячейки и вынесите ценности. Бэйн говорит, что у этих банков самый низкий рейтинг ограблений в стране. Пора изменить это.\n\n» Найдите ключ-карты. Для хранилища нужно две\n» Если не получится - используйте термобур\n» Взломайте клиентские ячейки\n» Соберите небесный крюк\n» Вытащите деньги",

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

		--Heat Street, Holdout edition
		["heist_skm_heat_street_name"] = "Жилой район - здание 'Инквелл'",
		["heist_skm_heat_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",
		["heist_skm_street_name"] = "Столкновение: Жилой район - здание 'Инквелл'",
		["heist_skm_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",	

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "Рождественское спасение Хокстона",
		["heist_xmn_hox1"] = "Рождественский побег",
		["heist_xmn_hox_1_brief"] = "Дантист организовал новое судебное разбирательство для Хокстона. Нет, не для тебя, Хокс. Я имел в виду... Для старого. Ладно, с кличками потом разберёмся. Суд пройдёт быстро. С его статьёй он всё равно не выйдет из тюрьмы. Мы должны перехватить Хокса, пока его ведут с заседания. Спасём Хокстона и покажем огромный средний палец судебной системе. Действуйте громко: взорвите стену в здании суда, хватайте Хокса и сваливайте.$NL;$NL;Улицы вокруг здания суда перекрыты. Они ожидают подвоха, так что готовьте пушки покрупнее и боеприпасов побольше.",
		["heist_xmn_hox2"] = "Рождественские поиски",
		["heist_xmn_hox_2_brief"] = "Парни, спасибо за то, что вытащили меня. Только я уверен в том, что меня подставили. Я не должен был попасть в тюрьму. У федералов было на меня гораздо больше, чем эти сволочи смогли бы раскопать. Кто-то решил меня сдать. Я узнаю, кто это сделал.$NL;$NL;Это будет нелегко, так что мы не будем ходить вокруг да около, ладно? Никаких сделок или связей с контактами. Мы отправимся сразу к месту, где всё началось. В здание имени Эдгара Гувера, самый главный улей FBI. Мы выясним, кто попытался меня поиметь.",
		["heist_xmn_hox_brief"] = "Дантист сфальсифицировал новое судебное разбирательство для Хокстона. Мы должны перехватить его сразу после слушания. Действовать будете настолько громко, насколько это возможно: взрываете стену, хватаете Хокстона и сбегаете к чертям.$NL;$NL;» Освободите Хокстона$NL;» Проведите его до бронированного грузовика$NL;» Сопровождайте грузовик$NL;» Скройтесь с места преступления вместе с Хокстоном.",

		["heist_xmn_tag_name"] = "Проникновение на Рождество",
		
		--Rats Zipline
		["menu_alex_1_zipline_desc"] = "Лебедка для быстрого переноса сумок",
		
		--Watchdogs Early Boat Driver Restoration
		["bot_watchdogs_new_stage2_01_any_02"] = "Говорит водитель лодки. Вижу сигнал, скоро буду.",
		["bot_watchdogs_new_stage2_01_any_03"] = "Говорит водитель лодки. Сигнал замечен, я в пути.",
		
		["bot_watchdogs_new_stage2_05_any_02"] = "Я тут, бросайте сумки в лодку!",
		["bot_watchdogs_new_stage2_05_any_03"] = "Тащите долбанные сумки в лодку!",
		["bot_watchdogs_new_stage2_05_any_04"] = "Несите блядские сумки в лодку!",
		
		["bot_watchdogs_new_stage2_06_any_01"] = "Могу взять только четыре сумки за раз! Наполняйте бочки, я вернусь за остатком потом.",
		["bot_watchdogs_new_stage2_06_any_02"] = "Увы, только четыре за раз! За остальными вернусь потом.",
		["bot_watchdogs_new_stage2_06_any_03"] = "Только четыре за раз, за остальными я вернусь потом!",
		
		["bot_watchdogs_new_stage2_07_any_01"] = "Быстро, наполняем бочки!",
		["bot_watchdogs_new_stage2_07_any_02"] = "Наполняйте бочки! Резче!",
		["bot_watchdogs_new_stage2_07_any_03"] = "Наполняйте бочки, народ!",
		
		
		["bot_watchdogs_new_stage2_08_any_02"] = "Хорошо, есть четыре!",
		["bot_watchdogs_new_stage2_08_any_03"] = "Хорошо, четыре есть!", 
		
		["bot_watchdogs_new_stage2_09_any_01"] = "Я отвезу эту херню, а затем вернусь за остатком!",
		["bot_watchdogs_new_stage2_09_any_02"] = "Я отвожу товар, но я вернусь как только смогу, если захотите добыть остаток.",
		["bot_watchdogs_new_stage2_09_any_03"] = "Пока я увожу эти сумки, но не волнуйтесь, я вернусь за остатком.",
		
		["bot_watchdogs_new_stage2_10_any_01"] = "Всё разгружено. Скоро вернусь.",
		["bot_watchdogs_new_stage2_10_any_02"] = "Разгружено! Плыву назад.",
		["bot_watchdogs_new_stage2_10_any_03"] = "Держитесь... Скоро буду!",
		
		["bot_watchdogs_new_stage2_11_any_01"] = "Блин, я сказал в бочки, не в воду!",
		["bot_watchdogs_new_stage2_11_any_02"] = "Что я говорил?! КИДАЙТЕ В БОЧКИ!",
		["bot_watchdogs_new_stage2_11_any_03"] = "В бочку! Бросайте, блядь, в бочки!",
		
		["bot_watchdogs_new_stage2_12_any_01"] = "Принято! Буду возле Дока 7.",
		["bot_watchdogs_new_stage2_12_any_02"] = "Принято! Плыву на Док 7.",
		["bot_watchdogs_new_stage2_12_any_03"] = "Вас понял, подхожу к Доку 7!",
		
		["bot_watchdogs_new_stage2_13_any_01"] = "Принято! Буду возле Дока 8.",
		["bot_watchdogs_new_stage2_13_any_02"] = "Принято! Плыву на Док 8.",
		["bot_watchdogs_new_stage2_13_any_03"] = "Вас понял, подхожу к Доку 8!",
		
		["bot_watchdogs_new_stage2_14_any_01"] = "Принято! Буду возле Дока 9.",
		["bot_watchdogs_new_stage2_14_any_02"] = "Принято! Плыву на Док 9.",
		["bot_watchdogs_new_stage2_14_any_03"] = "Вас понял, подхожу к Доку 9!",
		
		--Watchdogs Holdout
		["heist_skm_watchdogs_stage2_briefing"] = "Миа Калиенте — хорошая добыча, друзья. В течение многих лет она была мозгом операций Murkywater в Вашингтоне. Не так давно Murkywater заняли портовый склад, который они используют как дополнительную точку распределения. Наша цель находится там, проверяет какую-то добычу, недавно награбленную из-за границы. Мы проникнем туда и возьмём девку в заложники. Мурки не могут позволить себе потерять её и они заплатят за её освобождение, может быть даже вышеупомянутой и весьма ценной добычей. Что скажете, банда?"
	})

	-- maybe need change banner descriptions
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)	
	local job = Global.level_data and Global.level_data.level_id
	local captain_type = job and restoration.captain_spawns[job]
	if captain_type == restoration.captain_types.winter then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА ВИНТЕРСА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
		})
	elseif captain_type == restoration.captain_types.summer then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "НАПРАВЛЯЕТСЯ КОМАНДА САММЕРСА",
		})
	elseif captain_type == restoration.captain_types.spring and difficulty_index <= 5 then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "НАПРАВЛЯЕТСЯ КАПИТАН СПРИНГ",
		})
	elseif captain_type == restoration.captain_types.spring then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА СПРИНГА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
		})		
	elseif captain_type == restoration.captain_types.autumn and difficulty_index <= 5 then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "НАПРАВЛЯЕТСЯ КАПИТАН ОТЕМ",
		})
	elseif captain_type == restoration.captain_types.autumn then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА ОТЕМА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
		})		
	elseif captain_type == restoration.captain_types.hvh then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "ПОБЕДИТЕ СТРАХ И ПРОСНИТЕСЬ",
		})
	end			
	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Осмотреть игрока",
		["menu_inspect_player_desc"] = "Осмотреть статистику игрока",
		["menu_toggle_one_down_lobbies"] = "Разрешить режим Pro-Job",
				
		["heist_safehouse"] = "Старое Убежище",
		
		--Events
		
		--Anniversary Event
		["menu_pda8_1_prog_obj_desc"] = "Найти 2 праздничные статуэтки в Ювелирном магазине, Четырёх магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_2_prog_obj_desc"] = "Всем сообществом грабители должны потратить $5,000,000,000 на пенсию копов при помощи Бабломёта, также вам нужно найти 3 разных праздничных статуэтки в Ювелирном магазине, Четырёх магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_3_prog_obj_desc"] = "Всем сообществом грабители должны потратить $10,000,000,000 на пенсию копов при помощи Бабломёта, также вам нужно найти 4 разных праздничных статуэтки в Ювелирном магазине, Четырёх магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_item_1_desc"] = "Всем сообществом грабители должны потратить $15,000,000,000 на пенсию копов при помощи Бабломёта, также вам нужно найти 3 разных праздничных статуэтки в Ювелирном магазине, Четырёх магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",

		["menu_pda8_2_prog_obj"] = "Найти 3 праздничные статуэтки.",
		["menu_pda8_3_prog_obj"] = "Найти 4 праздничные статуэтки.",
			
		--Holdout--
		["menu_cn_skirmish"] = "Столкновение",
		["menu_skirmish"] = "Столкновение - оборона заложника",
		["menu_skirmish_random"] = "Случайная локация",
		["menu_random_skirmish_subtitle"] = "Случайная стартовая локация.\n\nОтсутствую еженедельные награды и стартовые модификаторы.",
		["menu_weekly_skirmish"] = "Точная локация",
		["menu_weekly_skirmish_progress"] = "Пройденные волны, награды при полном прохождении",
		["menu_skirmish_random_briefing"] = "В этом режиме вы окажетесь в случайном СТОЛКНОВЕНИИ.\n\nСлучайное СТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы будете получать больше денег и опыта с каждой волной, но поражение заберёт все накопленные награды.\n\nВы проиграете, если вы или любой ваш соратник попадёте под стражу, или если заложник будет освобождён.",
		["menu_weekly_skirmish_desc"] = "В этом режиме вы окажетесь в подготовленном СТОЛКНОВЕНИИ.\n\nЕженедельное СТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы получите еженедельные награды, а также большое количество денег, опыта и карточек за каждую волну, но поражение заберёт все накопленные награды.\n\n##Вы проиграете, если вы или любой ваш соратник попадёте под стражу, или если заложник будет освобождён.##",
		["menu_weekly_skirmish_tab_description"] = "Обзор операции",
		["menu_weekly_skirmish_rewards"] = "Количество пройденных волн и награды",
		["hud_skirmish"] = "Столкновение",
		["hud_weekly_skirmish"] = "Еженедельное столкновение",
		["heist_contact_skirmish"] = "Столкновение",
		["menu_skirmish_pick_heist"] = "Компания Джекела доверяет вам эту работу",
		["menu_skirmish_map_selection"] = "Локации",
		["menu_skirmish_selected_briefing"] = "В этом режиме вы можете выбрать любое СТОЛКНОВЕНИЕ.\n\nСТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы будете получать больше денег и опыта с каждой волной, но поражение заберёт все накопленные награды.\n\nВы проиграете, если заложник будет освобождён.",
		["menu_skirmish_selected"] = "Столкновение",

		--Holdout Heists--
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
		["heist_skmc_fish_name"] = "Яхта 'Лета'",
		["heist_skmc_ovengrill_name"] = "Магазин Ovengrill",
		["heist_skmc_mad_name"] = "Лаборатория DRAK",
		["heist_skm_friend_name"] = "Особняк Эль-Фурейдис",
		["heist_skm_nightmare_name"] = "Старое убежище",
		["heist_skm_nightmare_lvl_name"] = "Убежище?",

		--Heist Breifings--
		["heist_pines_briefing"] = "Место нахождения в такой дальней глуши, что вам надо поторопиться и бежать сломя голову. Найдите пилота. Он должен быть рядом с местом крушения. Мы отправим вертолёт, чтобы эвакуировать его. Пилот должен быть в полной безопасности до тех пор, пока не отправится к нам. И ещё кое-что: Влад говорит, что в самолёте был неплохой товар. Прочешите лес и утащите столько кокаина, сколько сможете. На Рождество деньги лишними не будут.\n\nСООБЩЕНИЕ ОТ ДЖЕКЕЛА:\nШум от падения самолёта привлёк внимание находившихся неподалёку наёмников организации REAPER. Сражаться будете не с полицией.",

		----Custom Achievements----
				
		--Scarface Mansion--
		["skm_friend_name"] = "Столкновение: Особняк Эль-Фурейдис",
		["friend_3"] = "Вор в окопе",
		["friend_3_desc"] = "Начиная с первой волны, продержитесь три волны в Особняке Эль-Фурейдис.",
		["friend_3_obj"] = "Начиная с первой волны, продержитесь три волны в Особняке Эль-Фурейдис.",
		["friend_5"] = "Заложник у твоих ног",
		["friend_5_desc"] = "Начиная с первой волны, продержитесь пять волн в Особняке Эль-Фурейдис.",
		["friend_5_obj"] = "Начиная с первой волны, продержитесь пять волн в Особняке Эль-Фурейдис.",
		["friend_7"] = "Оборона Монтана",
		["friend_7_desc"] = "Начиная с первой волны, продержитесь семь волн в Особняке Эль-Фурейдис.",
		["friend_7_obj"] = "Начиная с первой волны, продержитесь семь волн в Особняке Эль-Фурейдис.",
		["friend_9"] = "Столкновение со шрамом",
		["friend_9_desc"] = "Начиная с первой волны, продержитесь девять волн в Особняке Эль-Фурейдис.",
		["friend_9_obj"] = "Начиная с первой волны, продержитесь девять волн в Особняке Эль-Фурейдис.",

		--Safehouse Nightmare--
		["skm_nightmare_name"] = "Столкновение: Старое убежище",
		["nightmare_3"] = "Неужели снова настало это самое время?", --translation note: quote from HL2 ending gman speech
		["nightmare_3_desc"] = "Начиная с первой волны, продержитесь три волны в Старом Убежище.",
		["nightmare_3_obj"] = "Начиная с первой волны, продержитесь три волны в Старом Убежище.",
		["nightmare_5"] = "Главное, что бы не произошло ничего неординарного", --translation note: quote from TF2 spy (Helltower event)
		["nightmare_5_desc"] = "Начиная с первой волны, продержитесь пять волн в Старом Убежище.",
		["nightmare_5_obj"] = "Начиная с первой волны, продержитесь пять волн в Старом Убежище.",
		["nightmare_7"] = "Ночь темна, но всегда настаёт утро", --translation note: quote from Lulu (Final Fantasy X)
		["nightmare_7_desc"] = "Начиная с первой волны, продержитесь семь волн в Старом Убежище.",
		["nightmare_7_obj"] = "Начиная с первой волны, продержитесь семь волн в Старом Убежище.",
		["nightmare_9"] = "Так проснитесь же, Мистер Стил", --translation note: quote from HL2 intro gman speech + Dallas' alias
		["nightmare_9_desc"] = "Начиная с первой волны, продержитесь девять волн в Старом Убежище.",
		["nightmare_9_obj"] = "Начиная с первой волны, продержитесь девять волн в Старом Убежище.",
				
		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "Раскрытый приклад 'Muldon'",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Набор Bernetti 93t",
		["bm_wp_upg_i_93r_desc"] = "#{risk}#Добавляет выбор режимов огня##, позволяя стрелять #{skill_color}#очередями по три, со скоростью 1100##, но #{important_1}#увеличивает отдачу.##", --still need to do the one for the primary bernetti--

		--AMR16--
		["bm_wp_upg_i_m16a2"] = "Набор AMR-16 B3",
		["bm_wp_upg_i_m16a2_desc"] = "Заменяет автоматический огонь на стрельбу #{skill_color}#очередями по три##. #{risk}#Очереди#{skill_color}# имеют повышенную скорость в #{skill_color}#950.##",
		
		--Bernetti Auto--
		["bm_wp_upg_i_b93o"] = "Набор Bernetti OVERKILL",
		["bm_wp_upg_i_b93o_desc"] = "Заменяет стрельбу очередями на #{skill_color}#автоматическую##, но #{important_1}#увеличивает отдачу.##",

		--2006M Hailstorm
		["bm_wp_upg_i_iw_hailstorm"] = "Набор Hailstorm",
		["bm_wp_upg_i_iw_hailstorm_desc"] = "Позволяет стрелять особыми #{skill_color}#тройными боеприпасами.##",
		["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "Позволяет стрелять особыми #{skill_color}#тройными боеприпасами##, но #{important_1}#урон по броне уменьшается на 50% и отключается пробитие щитов.##",

		--M200 WIDOWMAKER
		["bm_wp_upg_i_iw_widowmaker"] = "Набор Widowmaker",
		["bm_wp_upg_i_iw_widowmaker_desc"] = "Позволяет стрелять особыми #{skill_color}#двойными боеприпасами.##",

		--M32 MK32 Kit
		["bm_wp_upg_i_ghosts_mk32"] = "Набор MK32",
		["bm_wp_upg_i_ghosts_mk32_desc"] = "Заменяет одиночную стрельбу на #{skill_color}#стрельбу очередями по два.##",		
		
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Дробь #{risk}#летит горизонтально##, а не распыляется.",
		["bm_wp_ns_ultima_desc_sc"] = "Увеличивает разброс дроби на 75%.",
		["bm_wp_upg_a_slug_sc"] = "Бронебойная пуля",
		["bm_wp_upg_a_slug_desc"] = "Свинцовая пуля, которая #{skill_color}#пробиет броню, врагов, щиты и тонкие стены.##",
		["bm_wp_upg_a_slug_spam_desc"] = "Свинцовая пуля, которая #{skill_color}#наносит 80% урона через броню и пробивает врагов и тонкие стены.##",
		["bm_wp_upg_a_explosive_desc_sc"] = "#{heat_warm_color}#Взрывная## пуля радиусом #{skill_color}#1.5## метра.\n#{skill_color}#Не теряет урон с расстоянием##, но #{important_1}#не наносит дополнительный урон в голову.##",
		["bm_wp_upg_a_custom_desc"] = "Большие дробинки #{skill_color}#наносят увеличенный урон## за счёт #{important_1}#количества дробинок, эффективного расстояния, подбора и боезапаса.##",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Дробинки обладают #{skill_color}#60%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#96## урона в течение #{skill_color}#3## секунд.",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Дробинки обладают #{skill_color}#60%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#120## урона в течение #{skill_color}#3## секунд.",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Дробинки обладают #{skill_color}#60%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#180## урона в течение #{skill_color}#3## секунд.",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Дробинки обладают #{skill_color}#60%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#240## урона в течение #{skill_color}#3## секунд.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Флешетты #{skill_color}#пробивают броню## и наносят #{skill_color}#96## урона кровотечением в течение #{skill_color}#6## секунд.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Флешетты #{skill_color}#пробивают броню## и наносят #{skill_color}#120## урона кровотечением в течение #{skill_color}#6## секунд.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Флешетты #{skill_color}#пробивают броню## и наносят #{skill_color}#180## урона кровотечением в течение #{skill_color}#6## секунд.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Флешетты #{skill_color}#пробивают броню## и наносят #{skill_color}#240## урона кровотечением в течение #{skill_color}#6## секунд.",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "Рукоятка 'AFG'",
		["bm_wp_upg_vg_stubby"] = "Вертикальная рукоятка 'Стабби'",
		["bm_wp_upg_vg_tac"] = "Вертикальная рукоятка 'TAC'",

		["bm_wp_upg_ns_ass_smg_stubby"] = "Пламегаситель 'Стабби'",

		["bm_wp_upg_flash_hider"] = "#{skill_color}#Прячет пламя## и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##",
		["bm_wp_upg_suppressor"] = "#{skill_color}#Заглушает## оружие и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##",

		["bm_wp_upg_vintage_sc"] = "Винтажный магазин",
		["bm_wp_upg_mil_sc"] = "Армейский магазин",
		["bm_wp_upg_tac_sc"] = "Тактический магазин",

		["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_wp_upg_vintage_desc"] = "",

		--RPK--
		["bm_wp_rpk_m_ban_sc"] = "Банановый магазин",

		--Saw--
		["bm_ap_saw_sc_desc"] = "#{skill_color}#Прорезает броню.##",
		["bm_ap_saw_blade_sc_desc"] = "Лезвия становятся настолько острыми, что прорезают броню.",
		["bm_fast_motor_sc_desc"] = "Увеличивает скорость ротации на 15%.",
		["bm_slow_motor_sc_desc"] = "Уменьшает скорость ротации на 15%.",

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_1_1"] = "Отражательный прицел.\n#{risk}#Увеличение 1.1x.##",
		["bm_wp_upg_o_1_2"] = "Коллиматорный прицел.\n#{risk}#Увеличение 1.2x.##",
		["bm_wp_upg_o_1_5"] = "Голографический прицел.\n#{risk}#Увеличение 1.5x.##",
		["bm_wp_upg_o_1_5_pris"] = "Призматический прицел.\n#{risk}#Увеличение 1.5x##",
		["bm_wp_upg_o_1_5_scope"] = "Слабая оптика.\n#{risk}#Увеличение 1.5x.##",
		["bm_wp_upg_o_1_8"] = "Коллиматорный прицел.\n#{risk}#Увеличение 1.8.##",
		["bm_wp_upg_o_3"] = "Средняя оптика.\n#{risk}#Увеличение 3x##",
		["bm_wp_upg_o_3_range"] = "Средняя оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 3x.##",
		["bm_wp_upg_o_3_5"] = "Средняя оптика.\n#{risk}#Увеличение 3.5x.##",
		["bm_wp_upg_o_4"] = "Средняя оптика.\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_4_cod"] = "Средняя оптика.\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_4_default"] = "Стандартная оптика у этого оружия.\n#{risk}#Увеличение 4x.##\n\n#{item_stage_2}#Прицел нельзя убрать, но его можно заменить на другой.##",
		["bm_wp_upg_o_4_range"] = "Средняя оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_5"] = "Дальнобойная оптика.\n#{risk}#Увеличение 5x.##",
		["bm_wp_upg_o_5_range"] = "Дальнобойная оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 5x.##",
		["bm_wp_upg_o_6"] = "Дальнобойная оптика.\n#{risk}#Увеличение 6x.##",
		["bm_wp_upg_o_6_range"] = "Дальнобойная оптика c #{skill_color}#дальномером.##\n#{risk}#Увеличение 6x.##",
		["bm_wp_upg_o_8"] = "Дальнобойная оптика.\n#{risk}#Увеличение 8x.##",
		["bm_wp_upg_o_8_range"] = "Дальнобойная оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 8x.##",

		["bm_wp_upg_o_shortdot_dmc"] = "Прицел Shortdot",
		["bm_wp_upg_o_5_default"] = "Дальнобойная оптика.\nИспользуйте, чтобы модифицировать перекрестие у стандартного прицела.\n#{skill_color}#Увеличение 5x.##",

		["bm_wp_upg_o_angled_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы переключиться между оптикой и угловым прицелом.",
		["bm_wp_upg_o_angled_1_1_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы переключиться между оптикой и угловым прицелом.\n#{skill_color}#Увеличение 1.1х.##",
		["bm_wp_upg_o_angled_1_2_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы переключиться между оптикой и угловым прицелом.\n#{skill_color}#Увеличение 1.2х.##",
		["bm_wp_upg_o_angled_laser_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы переключиться между оптикой и лазерным прицелом.", --VMP Point Shoot Laser

		["bm_wp_upg_o_magnifier_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы использовать линзу.\n#{skill_color}#Увеличение 3x.##",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Снаряд создаёт #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#120 урона/сек## врагам, которые в неё попадают, что вызывает панику и наносит ещё #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##",
		["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "Снаряд создаёт #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#80 урона/сек## врагам, которые в неё попадают, что вызывает панику и наносит ещё #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##",
		["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "Снаряд создаёт #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#40 урона/сек## врагам, которые в неё попадают, что вызывает панику и наносит ещё #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##.",
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "Снаряд #{risk}#взрывается## при попадании. Взрыв наносит #{skill_color}#720## урона и обладает радиусом #{skill_color}#5## метров.",
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#360## урона, имеет радиус #{skill_color}#5## метров и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#180## урона, имеет радиус #{skill_color}#5## метров и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#300## урона, имеет радиус #{skill_color}#2.5## метров и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_poison"] = "Граната Manticore-6",
		["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#16## секунд, наносит #{skill_color}#240## урона в течение #{skill_color}#8## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",
		["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#12## секунд, наносит #{skill_color}#180## урона в течение #{skill_color}#6## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",
		["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#8## секунд, наносит #{skill_color}#120## урона в течение #{skill_color}#4## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Слабая прожарка",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Удваивает время горения, но наполовину уменьшает его урон.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Уменьшает время горения наполовину, но удваивает урон от него.",
		["bm_ap_flamethrower_sc_desc"] = "Тысячи градусов чистой боли. Кто мог придумать такое?\n#{heat_warm_color}#Прожигает через броню.##",
		["bm_ap_money_sc_desc"] = "Тысячи долларов чистого счастья. Поверните кран и выпускайте бабло.\n#{competitive_color}#Покупает через броню.##", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Двойная порция", -- lol
		["bm_wp_m134_body_upper_light"] = "Лёгкий корпус",
		["bm_wp_upg_a_halfthatkit_desc"] = "Добавляет 10% штраф к скорости при ношении данного оружия.\n\nУвеличивает подбор патронов на 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Добавляет 25% штраф к скорости при ношении данного оружия.\n\nУвеличивает подбор патронов на 50%.",

		--Phoenix .500--
		["bm_wp_shatters_fury_desc"] = "Массивный револьвер калибра .500 с дикой отдачей и мощностью. Любимое оружие Шаттера.\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "Особенный АК, который продемонстрировал свою кровожадность как на войне, так и на ограблениях.",
		["bm_wskn_deagle_bling_desc_sc"] = "Вручную собранный Deagle, сделанный в дань уважения сумасшедшему стрелку, который тренировался в компьютерных играх.",

		--Exclusive Sets--
		["bm_wp_upg_ultima_body_kit_desc_sc"] = "Этот набор добавляет уникальный #{risk}#тройной лазерный прицел##, несовместимый с другими устройствами.",
		["bm_wp_upg_fmg9_conversion_desc_sc"] = "Этот набор добавляет #{risk}#счетчик патронов и лазерный прицел##, несовместимые с другими устройствами.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "Нет модификатора",
		["bm_wp_upg_bonus_sc_none_desc"] = "ИСПОЛЬЗУЙТЕ, ЧТОБЫ УБРАТЬ БОНУСЫ, ПОЛУЧЕННЫЕ ОТ СКИНОВ.",

		--Gecko Pistol
		["bm_tranq_maxim_sc_desc"] = "Первый в мире пистолет со #{skill_color}#со встроенным глушителем##. Удобность и скрытность хорошо сочетаются с ослабляющими боеприпасами-транквилизаторами.\n\n#{stats_positive}#Транквилизатор - наносит урон через время.##",
		["bm_tranq_x_maxim_sc_desc"] = "Парочка первых в мире пистолетов со #{skill_color}#со встроенным глушителем##. Удобность и скрытность хорошо сочетаются с ослабляющими боеприпасами-транквилизаторами.\n\n#{stats_positive}#Транквилизатор - наносит урон через время.##",
		--Igor (APS)
		["bm_stech_sc_desc"] = "Тяжёлый и медленный автоматический пистолет, который потерял популярность из-за огромных габаритов. Его вес делает его стабильным, но не очень скрытным.",
		["bm_x_stech_sc_desc"] = "Тяжёлый и медленный автоматический пистолет, который потерял популярность из-за огромных габаритов. Его вес делает его стабильным, но не очень скрытным.",
		--Chimano Compact
		["bm_jowi_sc_desc"] = "Пистолет Chimano с максимальной скрытностью - за счёт всего остального.\n\nГоворят, Уик его использовал, когда мстил русской мафии.",
		["bm_x_jowi_sc_desc"] = "Раз они такие маленькие, почему бы не взять два? Эту парочку неверно приписывают Уику как его любимое оружие.",
		--Glock 18c
		["bm_g18c_sc_desc"] = "Полностью автоматический австрийский пистолет. Его трудно удержать, но вблизи он абсолютно смертоносен.",
		["bm_x_g18c_sc_desc"] = "Отдачи от одного тебе мало? Ну держи второй!",
		--CZ 75
		["bm_czech_sc_desc"] = "Один из пистолетов, которые предписывают к 'Wonder Nine', он обладает автоматической стрельбой и хорошей эргономикой. Используется контр-террористическими подразделениями всего мира.",
		["bm_x_czech_sc_desc"] = "Пример того, как не стоит использовать автоматические пистолеты. Ты как их перезаряжать будешь?",
		--PPK (Gruber)
		["bm_ppk_sc_desc"] = "Компактная альтернатива большим и опасным пушкам. Классическое оружие для классических целей.",
		["bm_x_ppk_sc_desc"] = "Когда ты уже не Бонд, а Кингсмэн.",		
		--M13
		["bm_legacy_sc_desc"] = "Модель из Западной Германии, которая не потерпела конкуренции с Bernetti, но может постоять за себя.",
		["bm_x_legacy_sc_desc"] = "Два пистолета, забытых историей. Напомните об их существовании, залив комнату свинцом.",		
		--Glock 17
		["bm_g17_sc_desc"] = "Надёжный и лёгкий в обращении. Отличный выбор для начинающего грабителя.",
		["bm_x_g17_sc_desc"] = "Маленький калибр - не беда, когда стреляешь настолько быстро.\n\nИх использовал Хокстон во время освобождения.",
		--Bernetti 9
		["bm_b92fs_sc_desc"] = "Популярный пистолет благодаря впечатляющему магазину и неплохому урону. Подойдёт, когда злодеи окружили вас.",
		["bm_x_b92fs_sc_desc"] = "Два веселее чем один. Превратите окружение в девятимиллиметровую вечеринку.",
		--White Streak
		["bm_pl14_sc_desc"] = "Современный российский пистолет, использующий пост-советские технологии из-за рубежа. Любим Риперами за надёжность и футуристический дизайн.",
		["bm_x_pl14_sc_desc"] = "Современный российский пистолет, использующий пост-советские технологии из-за рубежа. Любим Риперами за надёжность и футуристический дизайн.",
		--Holt 9mm
		["bm_holt_sc_desc"] = "Рабочий прототип пистолета, застрявшего в разработке. Инновационный дизайн, который помогает компенсировать отдачу.",
		["bm_x_holt_sc_desc"] = "Целых два пистолета, которые считаются потерянными.",		
		--FMG-9
		["bm_fmg9_sc_desc"] = "Экспериментальное оружие, служащее продвинутым держателем для вашего STRYK 18c. В комплекте футуристическая технология разворота!",
		--93R
		["bm_beer_sc_desc"] = "Практически фантастический пистолет с разными режимами огня. Живой или мёртвый, ты пройдёшь со мной.",
		--Contractor Pistols 
		["bm_packrat_sc_desc"] = "Выбор Уика за свою надёжность и простоту в использовании. Говорят, именно с ним он нанёс визит в клуб The Red Circle.",
		["bm_x_packrat_sc_desc"] = "Выбор для тех, кому нужно зачистить клуб русской мафии ради кровавой мести.",
		--Breech (Luger) 
		["bm_breech_sc_desc"] = "Пистолет, который почти захватил мир. Дважды. Этот немецкий артефакт стильный, точный и абсолютно устаревший.",
		--Chimano Custom
		["bm_g22c_sc_desc"] = "Комбинация высокой ёмкости и мощности. Один из лучших боевых пистолетов.",
		["bm_x_g22c_sc_desc"] = "Когда за голос дают один ствол, хочется обмануть систему и заполучить себе парочку.",
		--Baby Deagle
		["bm_sparrow_sc_desc"] = "\"You're gonna carry that weight.\"",
		--Signature .40
		["bm_p226_sc_desc"] = "Этот классический боец с законом проявит себя и в банке, и при ограблении транспорта.",
		--LEO
		["bm_hs2000_sc_desc"] = "Этот компактный пистолет приглянется агентам Интерпола, продажным хорватским копам и международным преступникам.",
		--5/7 pistol
		["bm_lemming_sc_desc"] = "Мощность и ёмкость в одном флаконе. Если кто-то не гибнет после 20 патронов, может, не стоит с ним сражаться?\n\n#{skill_color}#Наносит 80% урона через броню. Попадания в голову наносят 11% бонусного урона.##",
		--Baby Deagle--
		["bm_w_sparrow_sc_g_cowboy_desc"] = "\"You're gonna carry that weight.\"",
		--socom deez nuts--
		["bm_w_socom_desc"] = "Любимое оружие Джекела. Надёжный и мощный пистолет под .45 ACP со стильным дизайном.",
		--Crosskill
		["bm_w_colt_1911"] = "Пистолет Crosskill Operator",
		--Crosskill Chunky
		["bm_w_m1911"] = "Пистолет Crosskill A1",
		--Crosskill Guard
		["bm_shrew_sc_desc"] = "Маленький и более компактный, чем модель А1. Увеличенная скрытность за счёт уменьшения магазина и длины ствола.",
		["bm_x_shrew_sc_desc"] = "Выбор Ханаанитов - два пистолета под .45 помогут отбить любую атаку.",
		["bm_shrew_g_bling_sc_desc"] = "\"In a world filled with misery and uncertainty, it is a great comfort to know that, in the end, there is light in the darkness.\"",
		--USP 
		["bm_usp_sc_desc"] = "Один из лучших пистолетов S&G преуспевает в уроне, ёмкости и дальнобойности.",
		["bm_x_usp_sc_desc"] = "Парочка пистолетов S&G, когда нужно дать о себе знать.",
		--1911 
		["bm_1911_sc_desc"] = "Когда 9мм кажется мало, возьмите этот модифицированный 1911А1, заряженный мощными .45ACP. Беспрецедентная жестокость.",
		["bm_x_1911_sc_desc"] = "Может они и не обладают демоническими силами, но то, что они после себя оставляют, способно напугать любого.",	
		--Model 54 
		["bm_type54_sc_desc"] = "Этот китайский клон советского ТТ обладает подствольным дробовиком в качестве дополнительного способа избавиться от проблем.",
		["bm_x_type54_sc_desc"] = "Двух стволов мало? Попробуйте четыре.",		
		--Broomstick--
		["bm_c96_sc_desc"] = "\"...Ваше слово, товарищ Маузер!\"\n\nИнновационный немецкий пистолет, который модифицировали под автоматический огонь.\n\nЭто оружие перезаряжается обоймами по десять патронов.",
		["bm_wp_c96_nozzle"] = "Глушитель BlasTech DL-44",
		["bm_wp_c96_nozzle_desc_sc"] = "#{skill_color}#Технология из далёкой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#1.25 сек.##\nСкорость зарядки: #{skill_color}#4/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#2 сек.##",
		--Sub2000
		["bm_sub2000_sc_desc"] = "Пистолет сомнительного качества сборки. Слабые пистолетные пули становятся мощнее из-за длины ствола, а возможность свёртки даёт хорошую скрытность.",	
		--Deagle
		["bm_deagle_sc_desc"] = "Оружие крутых парней на все времена. Главное не вывихнуть руку.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		["bm_x_deagle_sc_desc"] = "Нужно быть безумцем, чтобы додуматься взять на поле боя сразу два.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		--Matever 2006m
		["bm_2006m_sc_desc"] = "Очень редкий револьвер предоставляет дорогостоящую возможность пострелять .38 калибром.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		["bm_x_2006m_sc_desc"] = "Неудобность этой идеи компенсируется её крутостью.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		--Frenchman Model 87
		["bm_model3_sc_desc"] = "Старомодный ответ на вопрос \"Что делать со всеми этими мудаками?\"\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		["bm_x_model3_sc_desc"] = "Копы не уважают правила дуэли, так что и тебе незачем.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		--Raging bull
		["bm_rage_sc_desc"] = "Мощная и недальнобойная пушка. Враги будут падать как кегли, если держать огонь ровно.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		["bm_x_rage_sc_desc"] = "Совсем неудобно и непрактично, но свидетели ограбления будут впечатлены.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		--Castigo
		["bm_chinchilla_sc_desc"] = "Мощный, точный, стильный. Подойдёт против самых сильных вашингтонских копов.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		["bm_x_chinchilla_sc_desc"] = "Сикарио не даёт своей жертве шанса выжить - помогают эти револьверы.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",	
		--RUS-12
		["bm_rsh12_sc_desc"] = "Больше не нужно меряться малокалиберными стволами.\n\n#{skill_color}#Может пробивать броню, врагов, щитов и тонкие стены.##",
		--Chunky 1911 
		["bm_m1911_sc_desc"] = "Перевыпуск старенького Crosskill .45. Почти не отличается от оригинала.",
		--FMG-9
		["bm_w_fmg9"] = "Автоматический пистолет Wasp-DS",
		--Sub 2000
		["bm_w_sub2000"] = "Пистолет-карабин Cavity 10mm",
		--SAA/Peacemaker
		["bm_ap_weapon_peacemaker_sc_desc"] = "#{risk}#The greatest handgun ever made.##\nАльтернативный огонь выпускает пули #{skill_color}#с повышенной скоростью.\n\nМожет пробивать броню, врагов, щитов и тонкие стены.##",
		--CUSTOM HANDGUNS
			--Browning Hi-Power
			["bm_w_hpb"] = "Пистолет VF Hi-Power",
			--Walther P99
			["bm_w_p99"] = "Пистолет Gruber 988",
			--Derringer
			["bm_w_derringer"] = "Пистолет Derringer",
			--Automag .44
			["bm_w_amt"] = "Пистолет Automag .44",
			--Colt Detective
			["bm_w_coltds"] = "Револьвер Crosskill Investigator",
			["bm_lemon_dmc_desc"] = "Мечтаете о скрытном и мощном револьвере? Мечты сбываются.\n\n#{skill_color}#Наносит двойной урон при атаке сзади.##",



		--Kobus 90--
		["bm_w_p90"] = "Пистолет пулемет Project-90",
		["bm_p90_sc_desc"] = "ПП по схеме буллпап. Конкурент ПП 'SpecOps-7'. Её часто называют футуристической космической пушкой.\n\n#{skill_color}#Наносит 80% урона через броню. Попадания в голову наносят 11% бонусного урона.##",
		["bm_wp_p90_body_p90_tan"] = "Бежевый корпус",
		["bm_wp_90_body_boxy"] = "Штурмовой корпус OMNIA",
		["bm_wp_90_body_boxy_desc"] = "Найденный на заброшенном складе корпорации OMNIA, этот корпус совершенно не влияет на функционал или удобность оружия, но его квадратный дизайн приятен глазу.",
		--Spec Ops
		["bm_w_mp7"] = "Пистолет пулемет SpecOps-7",
		["bm_mp7_sc_desc"] = "Лёгкий ПП. Конкурент ПП Project-90. Оказывается, у него нет подствольного гранатомёта.\n\n#{skill_color}#Наносит 80% урона через броню. Попадания в голову наносят 11% бонусного урона.##",
		--Cobra/Skorpion
		["bm_wp_scorpion_m_extended"] = "Двойные магазины",
		--Compact-5/MP5
		["bm_w_mp5"] = "Пистолет-пулемет Compact-5",	
		["bm_mp5_sc_desc"] = "Младшая сестра Gewehr-3.\nСкорострельная, точная и удобная, что ещё можно желать от ПП?",	
		--Pachett/Sterling
		["bm_wp_sterling_b_e11"] = "Глушитель BlasTech E-11",
		["bm_wp_sterling_b_e11_desc_sc"] = "#{skill_color}#Технология из далёкой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#1 сек.##\nСкорость зарядки: #{skill_color}#6/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#2 сек.##",
		--Uzi
		["bm_uzi_sc_desc"] = "Несмотря на скорострельность, Узи - надёжный и простой в обращении ПП, а переделка под калибр .41 AE прибавляет ему мощности.",
		--Chicago Typewriter
		["bm_thompson_sc_desc"] = "Снабжённый барабанным магазином, этот ПП позволяет вспомнить деньки мафии, пока вы расстреливаете толпы врагов.",
		--MP40
		["bm_erma_sc_desc"] = "Весьма надёжный ПП, популярный у пехоты Второй мировой. Главное не использовать магазин как рукоять.",
		
		--CUSTOM SMGs
			--Typhoon
			["bm_w_crysis3_typhoon"] = "Пистолет-пулемет Typhoon",
			["bm_w_crysis3_typhoon_desc"] = "\"It's the purest form of expression, and right now I've got a lot to say.\"\n\nЭтот десятиствольный пистолет-пулемёт использует особую технологию зарядки, которая позволяет добиться чрезвычайно высокой скорости стрельбы.",


		--Bootleg/HK416c
		["bm_w_tecci"] = "Пулемет Bootleg",
		["bm_w_tecci_desc_sc"] = "Винтовка с возвратной пружиной, переделанная под пулемёт.",
		--KSP/M249
		["bm_w_m249"] = "Пулемет KSP-90",
		["bm_m249_sc_desc"] = "Перезарядка - та ещё задача, но скорее всего к моменту перезарядки все уже будут мертвы.",
		--RPK
		["bm_w_rpk"] = "Пулемет РПК",
		["bm_rpk_sc_desc"] = "Отличный выбор, если любите точные (и восточные) пулемёты.",
		--Brenner 21/HK21
		["bm_w_hk21"] = "Пулемет Brenner-21",
		["bm_hk21_sc_desc"] = "Большая младшая сестра винтовки Gewehr-3. Увеличенная скорострельность отлично подходит для подавляющего огня.",	
		--M60
		["bm_w_m60"] = "Пулемет M60",
		["bm_m60_sc_desc"] = "Так называемая 'Свинка' - тяжёлая и пожирающая патроны. Вблизи никому не выжить.",	
		--Ksp 58
		["bm_w_par"] = "Пулемет KSP-58B",	
		["bm_par_sc_desc"] = "Более тяжёлый родственник KSP-90, который обычно ставят на технику. Меньше мобильность, больше пуля.",	
		--Buzzsaw/Mg42
		["bm_w_mg42"] = "Пулемет Buzzsaw-42",	
		["bm_wolf_brigade_sc_desc"] = "\"We are not men disguised as mere dogs.\nWe are #{important_1}#wolves## disguised as mere men.\"\n\n#{skill_color}#Отдача увеличена на 25% при стрельбе от бедра.##",
		["bm_wp_mg42_b_vg38"] = "Глушитель BlasTech DLT-19",
		["bm_wp_mg42_b_vg38_desc_sc"] = "#{skill_color}#Технология из далёкой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#2 сек.##\nСкорость зарядки: #{skill_color}#9/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#4 сек.##",
		--["bm_wp_mg42_b_mg34_desc_sc"] = "Slows your rate of fire to 800 RPM",
		--Versteckt-51/HK51B
		["bm_w_hk51b"] = "Пулемет Versteckt-51B",
		["bm_hk51b_sc_desc"] = "Подпольная модификация Brenner-21, которая уменьшает его до размеров Compact-5.\n\nТеряет точность при стрельбе от бедра.",	
		--M134
		["bm_m134_sc_desc"] = "\"Each step you take is paved with the corpses of your enemies...\"\n\n#{risk}#Раскручивается перед стрельбой, прицеливание продолжает раскрутку.\nТеряет точность при стрельбе от бедра.##",
		--Microgun
		["bm_shuno_sc_desc"] = "\"This is your road. When you come, you'll walk it alone.\"\n\n#{risk}#Раскручивается перед стрельбой, прицеливание продолжает раскрутку.\nТеряет точность при стрельбе от бедра.##",






		--AA12
		["bm_aa12_sc_desc"] = "Автоматический дробовик с коробчатым магазином. Оставит бурю эмоций.",
		--Saiga
		["bm_saiga_sc_desc"] = "Полностью автоматический дробовик для дней, когда вам лень целиться.",
		--Spas12
		["bm_spas12_sc_desc"] = "Тяжёлая и сложная альтернатива полуавтоматическим дробовикам. Обладает альтернативным режимом стрельбы, будто созданный пришельцами.",
		--Benelli
		["bm_benelli_sc_desc"] = "Тактический дробовик премиум-класса. Для зачистки особенно шумных комнат.",	
		--Argos III
		["bm_ultima_sc_desc"] = "Нет ничего современнее пластика и алюминия. Тут даже есть слот для подзарядки телефона.\n\nПерезаряжает по #{skill_color}#2## патрона за раз.",		
		--Loco
		["bm_serbu_sc_desc"] = "Уменьшенная подпольная версия Reinfeld 880 для любителей скрытности и сломанных запястий.",
		--Reinfeld 88
		["bm_w_m1897"] = "Дробовик Repeater 1897",
		["bm_menu_sc_m1897_desc"] = "Этот исторический артефакт повидал как грязные траншеи, так и жаркие джунгли. Известен тем, что им легко развязать пожар.\n\nАльтернативный огонь позволяет #{skill_color}#отстрелять боезапас в три раза быстрее## за счёт #{important_1}#отдачи, точности и невозможности прицеливания.##",
		--Mosconi 12g
		["bm_menu_sc_m590_desc"] = "Улучшенная версия классического ружья. Подходит для полиции, армии, гражданских и грабителей.",
		--R870
		["bm_menu_sc_r870_desc"] = "Длинная рука закона и свободы. Свободы, которая вооружена дробовиком!",		
		--KSG
		["bm_menu_sc_ksg_desc"] = "В будущем всё сделано из пластика! Буллпап-дробовик сомнительного качества сборки, им вооружают лёгкую пехоту.",		
		--Breaker 10g
		["bm_menu_sc_boot"] = "Дробовик Breaker 10G",		
		["bm_menu_sc_boot_desc"] = "Старое ружьё, обладающее мощным десятым калибром и ещё более мощной аурой мачо. Иди со мной, если хочешь жить.",	
		--Mosconi
		["bm_menu_sc_huntsman_desc"] = "Два ствола, двойное удовольствие. Конечно, два патрона это мало, но это не так важно, если они выпущены одновременно и в упор.",		
		--Akimbo Judge
		["bm_x_judge_sc_desc"] = "Наконец-то на одной сцене.",
		--Joceline
		["bm_b682_sc_desc"] = "Спортивная горизонталка, которая скоро будет состязаться в ограблении банков.",		
		--Custom Shotguns
		--Doomstick
		["bm_w_quadbarrel"] = "Дробовик Doomstick",
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "Дробь, эффективная вблизи.\n#{skill_color}#Количество дроби увеличено до 10.##",
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "Дробь, эффективная на средних дистанциях.\n#{important_1}#Количество дроби уменьшено до 6.##",
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "Мощная стальная пуля, эффективная на дальних дистанциях.\nМожет пробивать#{skill_color}#броню, врагов, щиты, титановые щиты и стены.##",
		--MP153
		["bm_w_mp153"] = "Дробовик Argos I",

			
		--S552
		["bm_s552_sc_desc"] = "Элегантный выбор для любителей компактных винтовок под 5.56, её предпочитает МНБ. Использует специальный швейцарский калибр 5.6мм для увеличенной дальнобойности.",				
		--M733/AMCAR
		["bm_amcar_sc_desc"] = "Самая распространённая винтовка под .223. Подойдёт для любых целей.",
		--G36
		["bm_g36_sc_desc"] = "Ещё один претендент на звание 'лучшей пластиковой винтовки'.",		
		--VHS/Lion's Roar
		["bm_vhs_sc_desc"] = "Тяжёлая в пользовании винтовка, способная на впечатляющий результат в руках умельца.\n\nВозможно, в ней боевой дух Драгана.",		
		--Olympic/Para
		["bm_menu_sc_olympic_desc"] = "Чудовищный пистолет-переросток, стреляющий винтовочными патронами в автоматическом режиме. Экзистенциальный кризис, из которого можно стрелять.",
		--TAR-21/Para
		["bm_menu_sc_komodo_desc"] = "Мощь в крайне компактной упаковке. Хорошо показывает себя и вблизи, и на расстоянии.",		
		--Famas
		["bm_menu_sc_famas_desc"] = "Уменьшенный магазин взамен на точность и скорострельность. Подойдёт, чтобы отстрелить яблоко с чьей-нибудь головы.",
        --OICW--
		["bm_w_osipr_desc_pc"] = "Военная технология нового поколения. Снаряжен #{skill_color}#20мм гранатомётом.##\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомёт.",
		["bm_w_osipr_desc"] = "Военная технология нового поколения. Снаряжен #{skill_color}#20мм гранатомётом.##\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомёт.",
		--M4/CAR-4
		["bm_m4_sc_desc"] = "Удобная, компактная, смертоносная. Популярная у современных армий винтовка под калибр 5.56.",
		["bm_wp_upg_fg_m4a1"] = "Набор 'Эмка'",
		["bm_wp_upg_fg_m4a1_desc"] = "Этот набор меняет прицелы с чёрного рынка на более традиционные. #{risk}#Перекрывает внешний вид ручки.##",
		["bm_wp_upg_s_fixed"] = "Фиксированный приклад",
		--AK5
		["bm_ak5_sc_desc"] = "Отличная винтовка, знаменитая использованием для ограблений банков, а также тем, что все путают, чем она стреляет.",
		--Union 5.56
		["bm_corgi_sc_desc"] = "Несмотря на внешний вид, поплавать на этой винтовке не получится.",		
		--UAR
		["bm_aug_sc_desc"] = "Классический буллпап. Сделает решето из любого плохого парня.",	
		--AK17
		["bm_flint_sc_desc"] = "Современная версия классического АК. #{skill_color}#Умеет стрелять очередями по 2## и обладает кризисом личности.",	
		--AK 5.45
		["bm_w_ak74"] = "Винтовка АК 5.45",
		["bm_ak74_sc_desc"] = "Обладающая меньшим калибром, чем её сестра под 7.62, эта винтовка не менее опасна.",
		--CR 805
		["bm_menu_sc_hajk_desc"] = "Молодой и современный кузен ПП Cobra. Поддерживает разные режимы стрельбы и конверсии под другие калибры. (Нет в наличии)",
		--AMR-16
		["bm_m16_sc_desc"] = "Классическая винтовка - предок CAR-4. Её трудно спрятать, но зато она дальнобойная и мощная.",
		--Queen's Wrath
		["bm_l85a2_sc_desc"] = "Хоть её репутация и была подпорчена ранними версиями, она является одной из самых точных винтовок в мире.\n\nНо она остаётся эргономическим кошмаром.",
		--AK 7.62
		["bm_w_akm"] = "Винтовка АК 7.62",
		["bm_akm_sc_desc"] = "Отличный выбор против возрастающей популярности брони в Вашингтоне.\n\nВыбор повстанцев и радикальных режимов всего мира.",
		["bm_w_akm_gold"] = "Золотой АК 7.62",
		["bm_akm_gold_sc_desc"] = "Что общего у грабителя, мексиканского наркобарона и диктатора? Любовь к позолоченным винтовкам, конечно же.",
		--Queen's Wrath
		["bm_l85a2_sc_desc"] = "Хоть её репутация и была подпорчена ранними версиями, она является одной из самых точных винтовок в мире.\n\nНо она остаётся эргономическим кошмаром.",
		--Сталкер, вали отсюда--
		--Мы кого попало не пропускаем--
		["bm_w_groza"] = "Винтовка ОБ-14 Бык-1", --жуть, но лучше кепчука
		--ты чё 
		--бычара????
		--Ех, вотева
		["bm_groza_sc_desc_pc"] = "Буллпап-родственник АК, любящий взрывы.\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_groza_sc_desc"] = "Буллпап-родственник АК, любящий взрывы.\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		--Krinkov
		["bm_akmsu_sc_desc"] = "Маленькая винтовка против больших людей. Подойдёт для любого случая.",
		--Akimbo Krinkov
		["bm_x_akmsu_sc_desc"] = "Маленькая винтовка против больших людей. Подойдёт для любого случая.",
		
		--CUSTOM ARs
			--AN-94/92
			["bm_w_tilt"] = "Винтовка КВК-99",
			["bm_tilt_sc_desc"] = "#{risk}#Первые два выстрела## каждого нажатия на курок обладают #{skill_color}#тройной скорострельностью.##",
			--HK G36
			["bm_w_g36k"] = "Винтовка SG36K",
			--SCAR-L
			["bm_w_scarl"] = "Винтовка VF 16S",
			--Valmet Rk.62
			["bm_w_rk62"] = "Винтовка Velmer",
			
			
		--Galant--
		["bm_galant_sc_desc"] = "Классическая винтовка времён Второй мировой. Надёжная, точная и  #{skill_color}#быстро перезаряжается при опустошении.\n\nНаносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
		--M308
		["bm_m14_sc_desc"] = "Довольно меткая винтовка, если следить за отдачей, особенно при автоматической стрельбе.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
		--FAL
		["bm_fal_sc_desc"] = "Правая рука свободного мира. Ваш выбор, если нужно пробить тяжёлую броню.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",	
		--SCAR
		["bm_scar_sc_desc"] = "Боевая винтовка будущего. Совмещает удобность и урон, она стала популярной у морской пехоты и спецназа.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",			
		--G3
		["bm_w_g3"] = "Винтовка Gewehr-3",
		["bm_g3_sc_desc"] = "Старшая сестра Compact-5 и Brenner-21, не уступает по точности снайперским винтовкам.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",	
		--Little Friend
		["bm_w_contraband"] = "Винтовка Bigger Friend 7.62",
		["bm_m203_weapon_sc_desc_pc"] = "Старшая сестра личного AMR-16 Лица со шрамом.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_m203_weapon_sc_desc"] = "Старшая сестра личного AMR-16 Лица со шрамом.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет",
		--ASS VAL
		["bm_w_asval"] = "Винтовка 'Валькирия'",
		["bm_asval_sc_desc"] = "Обычным людям нравятся обычные винтовки, но кто-то хочет чего-то особенного.\n\nОбладает #{skill_color}#встроенным глушителем## и #{skill_color}#наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
		--Galil
		["bm_w_galil"] = "Винтовка Defender 7.62",
		["bm_galil_sc_desc"] = "Копия финского дизайна, который был скопирован с классического АК. Имитация? Нет, дань уважения!\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
		--KS12
		["bm_shak12_sc_desc"] = "Боевая винтовка по схеме буллпап с мощнейшим калибром 12.7x55мм. Дикая мощность в компактной упаковке.\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",	
		--ShAK-12
		["bm_wp_shak12_body_vks"] = "Выхлопной приклад",		
		["bm_wp_shak12_body_vks_ap_desc"] = "Предоставляет ещё более мощный калибр, который позволяет #{skill_color}#пробивать броню и щиты.## Приклад и затвор укреплены тяжёлым материалом, что #{important_1}#уменьшает скорострельность.##",	

            --Custom DMRs
			--["bm_w_xeno"] = "MA14 Surge Rifle",	
			["bm_xeno_sc_desc_pc"] = "\"Armat\" предлагает странную винтовку будущего. #{skill_color}#Интегрирован гранатомёт.##\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомёт.",	
			["bm_xeno_sc_desc"] = "\"Armat\" предлагает странную винтовку будущего. #{skill_color}#Интегрирован гранатомёт.##\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомёт",
			--VSS
			["bm_w_vss"] = "Винтовка 'Виктория'",
			["bm_vss_sc_desc"] = "Вариант 'Валькирии' с превосходящими дальностью и точностью.\n\nОбладает #{skill_color}#встроенным глушителем## и #{skill_color}#наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
			--G3 HK79
			["bm_w_g3hk79"] = "Винтовка Gewehr-A3 GL79",
			["bm_g3hk79_sc_desc_pc"] = "Вариация Gewehr-3 с #{skill_color}#подствольным гранатомётом.##\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомёт.",	
			--BO3 XR2
			["bm_w_xr2"] = "Винтовка XR-2",
			["bm_xr2_sc_desc"] = "XR-2 - инструмент, подходящий для самых напряжённых боёв, который оснащён особым спусковым крючком, который  #{skill_color}#скорострельность при стрельбе очередями.##\n\n#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
			["bm_wp_xr2_handle_01_sc"] = "Полная автоматика",
			["bm_xr2_handle_01_sc_desc"] = "Позволяет  #{skill_color}#полностью автоматический огонь##, но #{important_1}#убирает бонус за стрельбу очередями.##",
			["bm_wp_xr2_handle_02_sc"] = "Быстрые очереди",
			["bm_xr2_handle_02_sc_desc"] = "Увеличивает скорострельность до#{skill_color}#950##, но #{important_1}#увеличивает отдачу.\n\nНе влияет на одиночную стрельбу.##",	

        --MSR
		["bm_msr_sc_desc"] = "Стандартная винтовка армии США. Хорошие точность, удобность и скрытность делают её винтовкой на любой случай.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",	
		--R700
		["bm_r700_sc_desc"] = "Предок винтовки Rattlesnake. Хорошие точность и удобность, а ещё превосходящая дальнобойность по сравнению с младшим братом. В чём подвох? Устаревшие магазины на пять патронов.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",	
		--QBU88
		["bm_qbu88_sc_desc"] = "Буллпап-винтовка с востока. Подходит, чтобы нагнетать свою волю на окружающих.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",	
		--Winchester 1874
		["bm_winchester1874_sc_desc"] = "Винтовка, покорившая запад. Священная реликвия среди оружия, она до сих пор остаётся мощная благодаря своему калибру .44-40.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",	
		--TTI(TTY)		
		["bm_w_tti"] = "Снайперская винтовка Tecci .308",
		["bm_tti_sc_desc"] = "Личное оружие Уика. Говорят, где-то в интернете можно найти видео, где он выполняет контракт с этой винтовкой.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--Scunt
		["bm_wp_scout_m_extended"] = "Магазин дуэлянта",	
        --WA2000
		["bm_w_wa2000"] = "Снайперская винтовка Lebensauger .300",
		["bm_wa2000_sc_desc"] = "Их существует всего несколько сотен. Винтовка для престижного хитмана.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--Rangerhitter
		["bm_w_sbl"] = "Снайперская винтовка Rangehitter MK2", --It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
		["bm_sbl_sc_desc"] = "Рычажная винтовка двадцатого века, которая превосходит винтовки девятнадцатого века благодаря увеличенной пуле. Больше отдачи - больше смертоносности, когда на твоей стороне .45-70.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",	
		--Model 70
		["bm_model70_sc_desc"] = "Ранняя болтовка, сделанная дизайнерами Repeater 1874.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",			
		--SVD
		["bm_siltstone_sc_desc"] = "Мощная полуавтоматическая винтовка из семейства AK. Как и у других членов семьи, её репутация проверена временем.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--Mosin--
		["bm_mosin_sc_desc"] = "Не хватает даже на еду, но нужен ствол? Подойдёт эта классическая мощная винтовка со скользящим затвором.\n\nПерезаряжается обоймами по 5 патронов и #{skill_color}#может пробивать броню, врагов, щиты и тонкие стены.##",
		["bm_wp_upg_a_tranq_mosin"] = "Транквилизаторы",
		["bm_wp_upg_a_tranq_mosin_desc"] = "For true oblivion, The End.\n\n#{stats_positive}#Транквилизаторы## наносят #{skill_color}#40 урона/сек в течение 3 секунд и могут прерывать врагов.##",	
        --Desert Fox
		["bm_desertfox_sc_desc"] = "Компактная снайперская платформа, использовавшаяся Уиком при рейде на убежище русской мафии.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",			
		--R93
		["bm_r93_sc_desc"] = "Немецкая винтовка с большой пулей, которая остановит больших людей. Популярная винтовка среди полиции и контр-террористических подразделений мира.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",			
		--Thanatos--
		["bm_w_m95"] = "Крупнокалиберная винтовка Thanatos .50 cal",
		["bm_m95_sc_desc"] = "Крупнокалиберная винтовка, обычно используется против небольшой техники. Использовать её против органических целей, вероятно, военное преступление.\n\n#{skill_color}#Попадания в голову наносят на 100% больше урона.\nМожет пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		--Custom Snipers
			["bm_w_m107cq"] = "Крупнокалиберная винтовка Mors .50 cal",
			["bm_m107cq_sc_desc"] = "Не понравился Thanatos? Mors .50 превращает врагов в красную пасту ещё эффективнее.\n\n#{skill_color}#Попадания в голову наносят на 100% больше урона.\nМожет пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
			["bm_w_m200"] = "Крупнокалиберная винтовка TF-141",
			["bm_m200_sc_desc"] = "Для любителей 360 no-scope.\n\n#{skill_color}#Попадания в голову наносят на 100% больше урона.\nМожет пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		--Marlin 1894
		["bm_w_m1894"] = "Снайперская винтовка Mare's Leg",
		--SPX Centerfire
		["bm_w_moss464spx"] = "Снайперская винтовка Mosconi SPX",
		--Winchester 1894
		["bm_w_winchester1894"] = "Снайперская винтовка Repeater 1894",		
		--SVD
		["bm_w_svd"] = "Снайперская винтовка SV7",
		["bm_wp_wpn_fps_snp_svd_pso"] = "Оптический прицел СВ-7",
		--L115
		["bm_w_l115"] = "Снайперская винтовка AIM 90M",
			
		--3GL
		["bm_ms3gl_sc_desc"] = "Стреляет укомплектованными вместе 40мм гранатами, позволяя быстро выстреливать по несколько зарядов.\n\nАльтернативный огонь #{skill_color}#выстреливает три гранаты разом.##",
		--PIGLET/M32
		["bm_m32_sc_desc"] = "Никто не спасётся от этого шестизарядного гранатомёта... Пока вам не понадобится перезаряжаться.",
		--COMMANDO 101/M202 FLASH
		["bm_ray_sc_desc"] = "Ракеты создают #{heat_warm_color}#огненные лужи## и #{skill_color}#мгновенно уничтожают турели.##",

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_movement_penalty_info"] = "Скорость передвижения уменьшена на ",
		["bm_menu_weapon_movement_bonus_info"] = "Скорость передвижения увеличена на ",
		["bm_menu_weapon_movement_penalty_info_2"] = " когда оружие в руках",
		["bm_menu_sms_info_cont"] = "штраф удваивается во время стрельбы.",
		["bm_menu_sms_info_2"] = " при стрельбе.",
		["bm_menu_stat_sms_info_2"] = " во время стрельбы из-за установленных модулей.",
		["bm_menu_weapon_slot_warning_1"] = "\n##//////////               НЕ ИСПОЛЬЗОВАТЬ               //////////\n",
		["bm_menu_weapon_slot_warning_2"] = "\n//////////               НЕ ИСПОЛЬЗОВАТЬ               //////////##",
		["bm_menu_weapon_slot_warning_primary"] = "ОРУЖИЕ БЫЛО ПЕРЕМЕЩЕНО В ОСНОВНОЙ СЛОТ\nПРИ ИСПОЛЬЗОВАНИИ ВО ВТОРОСТЕПЕННОМ СЛОТЕ ПРОИЗОЙДЕТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_secondary"] = "ОРУЖИЕ БЫЛО ПЕРЕМЕЩЕНО ВО ВТОРОСТЕПЕННЫЙ СЛОТ\nПРИ ИСПОЛЬЗОВАНИИ В ОСНОВНОМ СЛОТЕ ПРОИЗОЙДЁТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_disabled"] = "ОРУЖИЕ ОТКЛЮЧЕНО КАПИТАНОМ ОТЕМОМ\nПРИ ИСПОЛЬЗОВАНИИ ПРОИЗОЙДЁТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_wtfdoido"] = "НЕ ИСПОЛЬЗОВАТЬ ЭТО ОРУЖИЕ.\n\nНА ДАННЫЙ МОМЕНТ НЕ ВОЗМОЖНОСТИ ЕГО ЗАБАЛАНСИТЬ",
		["empty"] = "",
		["missing_cap"] = "#{risk}#Custom Attachment Points## #{important_1}#не установлен.##\n\nМодуль будет выглядеть как стандартный модуль слота.",
		["bm_slamfire_generic_desc"] = "Альтернативный огонь позволяет #{skill_color}#отстрелять боезапас в три раза быстрее## за счёт #{important_1}#отдачи, точности и невозможности прицеливания.##",
		["bm_ap_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		["bm_ap_armor_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню.##",
		["bm_ap_armor_20_weapon_sc_desc"] = "#{skill_color}#Наносит 20% урона через броню.##",
		["bm_ap_armor_50_weapon_sc_desc"] = "#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		["bm_ap_armor_80_weapon_sc_desc"] = "#{skill_color}#Наносит 80% урона через броню и может пробивать врагов и тонкие стены.##",
		["bm_pdw_gen_sc_desc"] = "#{skill_color}#Наносит 80% урона через броню. Попадания в голову наносят 11% бонусного урона.##",
		["bm_heavy_ap_weapon_sc_desc"] = "#{skill_color}#Попадания в голову наносят на 100% больше урона.\nМожет пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		["bm_ap_2_weapon_sc_desc"] = "Стрелы можно подобрать обратно. Чем дольше держать тетиву, тем выше будет дальность.\n\n#{skill_color}#Может пробивать броню.##",
		["bm_ap_3_weapon_sc_desc"] = "Стрелы можно подобрать обратно.\n\n#{skill_color}#Может пробивать броню.##",
		["bm_40mm_weapon_sc_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы поднять прицел.\n\nПрицел #{risk}#выверен на 30 метров.##",
		["bm_rocket_launcher_sc_desc"] = "#{skill_color}#Ракеты мгновенно уничтожают турели.##",
		["bm_quake_shotgun_sc_desc"] = "Стреляет из двух стволов сразу, удваивая количество дробинок.",
		["bm_hx25_buck_sc_desc"] = "Выстреливает 12 дробинок с большим разбросом.\n\nИспользует навыки гранатометов.",
		["bm_auto_generated_sc_desc"] = "Характеристики этого оружия сгенерированны автоматически и могут не соответствовать видению автора или балансу.",
		["bm_auto_generated_ap_sc_desc"] = "Характеристики этого оружия сгенерированны автоматически и могут не соответствовать видению автора или балансу.\n\n#{skill_color}#Может пробивать броню, щиты и тонкие стены.##",
		["bm_auto_generated_sap_sc_desc"] = "Характеристики этого оружия сгенерированны автоматически и могут не соответствовать видению автора или балансу.\n\n#{skill_color}#Может пробивать броню, щиты и тонкие стены.##",
		["bm_auto_generated_lmg_sc_desc"] = "Характеристики этого оружия сгенерированны автоматически и могут не соответствовать видению автора или балансу.",
		["bm_auto_generated_mod_sc_desc"] = "Характеристики этого модуля автоматически убраны, так как генерация характеристик для модулей пока не реализована.",

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
		["bm_melee_weapon_info"] = "Обычно жертв ограбления бьют прикладом, а не стреляют в них.\n\nСкорость удара зависит от Скрытности оружия.",
		["bm_melee_katana_info"] = "Полностью заряженные атаки бьют на 50% быстрее, позволяя быстро повторить атаку.",
		["bm_melee_thebestweapon_info"] = "Лучшее оружие в игре.",
		["bm_melee_thejobissnotyours_info"] = "Полностью заряженные атаки бьют на 50% быстрее, позволяя быстро повторить атаку.",
		["bm_melee_buck_info"] = "Удивительно эффективен против современного оружия.\n\nУменьшает получаемый урон на 10% во время зарядки.", --Buckler Shield
		["bm_melee_charge_info"] = "Грабительская готика.\n\nБег запускает атаку, которая наносит 45 секунд каждые 0.25 секунд врагам, на которых вы бежите. Может быть увеличено навыками.\n\nПопадание по врагу во время бега тратит 15% стамины, убийство врага возвращает 10%.\n\nНе позволяет парировать атаки.", -- Randal Pitchfork
		["bm_melee_cs_info"] = "Рви их в клочья, пока не уничтожишь всех.\n\nНаносит 30 урона каждые 0.25 секунд тому, кто стоит впереди вас во время зарядки. Этот эффект можно улучшить навыками. Не парирует вражеские атаки.", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Вжуууууух.\n\nНаносит 18 урона каждые 0.25 секунд тому, кто стоит впереди вас во время зарядки. Этот эффект можно улучшить навыками. Не парирует вражеские атаки.", --Kazaguruma
		["bm_melee_wing_info"] = "Хорошо подходит к набору маскировки!\n\nНаносит четырёхкратный урон при атаке сзади.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Придуманный для насилия, смертельный как револьвер - это выкидной нож!\n\nНаносит двойной урон при атаке сзади.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Не думаю, что он подойдёт для мяса.\n\nПолностью заряженные удары разносят панику.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "Меч, собранный из кошмаров.\n\nПолностью заряженные удары разносят панику.", -- Headless Dozer Sword
		["bm_melee_goat_info"] = "Полностью заряженные удары распространяют панику.", -- ай-яй-яй
		["bm_melee_great_info"] = "Заряженные на 90% и более удары увеличивают дальность на 1 метр.", -- Great Sword
		["bm_melee_nin_info"] = "Стреляет гвоздями, которые мгновенно летят на маленькое расстояние. Считается за оружие ближнего боя.", -- Pounder
		["bm_melee_iceaxe_info"] = "Наносит на 50% больше урона в голову.", -- Icepick
		["bm_melee_mining_pick_info"] = "Наносит на 50% больше урона в голову.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nУбийства, совершенные этим оружием, полностью восстановят выносливость.", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "Пусть копы побреются.\n\nНаносит 120 урона в течение трёх секунд.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "Наносит 120 урона в течение трёх секунд.", --Lucille Baseball Bat
		["bm_melee_inner_child_info"] = "Твой внутренний ребёнок рвётся наружу.\n\nНаносит 120 урона в течение трёх секунд.",
		["bm_melee_spoon_gold_info"] = "Не бойся вилки, бойся ложки, один удар - и череп в крошки. \n\n50% шанс нанести 120 огненного урона и прервать врага на 3 секунды.", --Gold Spoon
		["bm_melee_cqc_info"] = "Содержит экзотический яд, который наносит 120 урона и имеет 50% шанс прервать врага раз в 0.5 секунды, в течение четырёх секунд.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Будь водой, друг мой.\n\nПарирование противника наносит ему 120 урона в ближнем бою.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "Ты кто такой, чтобы это делать?\n\nИмеет шанс 5% нанести десятикратные урон и нокдаун.",
		["bm_melee_specialist_info"] = "Теперь в два раза больше лезвий.\n\nНаносит двойной урон после первого удара.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "Специальное оружие для вытаскивания кишок в течение десяти минут.\n\nНаносит на 50% меньше урона в голову, но эффективен для ударов по телу и конечностям.",

		--We assets now--
		["menu_asset_dinner_safe"] = "Сейф",
		["menu_asset_bomb_inside_info"] = "Информация от инсайдера",
		["menu_asset_mad_cyborg_test_subject"] = "Подопытный",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "Костюм-двойка",
		["bm_suit_two_piece_desc_sc"] = "Классический подход к ограблениям. Когда кричишь 'Упали вниз!', почему бы не выглядеть стильно?\n\nС этой опцией персонаж будет носить свой стандартный костюм вне зависимости от ограбления.",

		["bm_suit_loud_suit"] = "Боевой жилет",
		["bm_suit_loud_suit_desc"] = "Костюм для тех, кто не прочь вступить в схватку. Он создан для удобства и в нём легко передвигаться. Отличный выбор для резких набегов на местные ювелирные магазины или секретные базы наёмников.",

		["bm_suit_jackal_track"] = "Особый атрибут",
		["bm_suit_jackal_track_desc"] = "Костюм, сделанный по заказу, с логотипом Джекела и вариацией логотипа ВЕРИТАС.\n\nБадна получила их в немаркированных коробках. Джекел утверждает, что не посылал их, и никогда не видел их раньше.\nНеизвестно, откуда они взялись.\n\n\n\n...Внутри коробок была лишь записка:\n\n''##В ЗНАК БЛАГОДАРНОСТИ, ДЛЯ ТЕХ, КТО ВЕРЕН ДЕЛУ.\nXOXO\n--S.N.##''\n\n",

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
		["bm_menu_damage_shake"] = "Тряска",
		["bm_menu_deflection"] = "Устой-вость",
		["bm_menu_regen_time"] = "Регенерация",
		["bm_menu_swap_speed"] = "Ск. смены",
		["bm_menu_pickup"] = "Подбор",
		["bm_menu_ads_speed"] = "Прицеливание",
		["bm_menu_reload"] = "Перезарядка",
		["bm_menu_damage"] = "Урон", -- I gotta find out WHO KILLED MY DA- how to spoof the damage readout for melee ["bm_menu_damage"] = "Макс. урон",
		["bm_menu_standing_range"] = "Мин. падение",
		["bm_menu_damage_min"] = "Мин. урон",
		["bm_menu_moving_range"] = "Макс. падение",
		
		--Attachment type names--
		["bm_menu_barrel_ext"] = "Насадка",
		["bm_menu_barrel_ext_plural"] = "Насадки",
		["bm_menu_foregrip"] = "Цевье",
		["bm_menu_foregrip_plural"] = "Цевье",
		["bm_menu_vertical_grip"] = "Рукоятка",
		["bm_menu_vertical_grip_plural"] = "Рукоятки",
		--Spoof types--
		["bm_menu_frame"] = "Рама",
		["bm_menu_whole_receiver"] = "Затвор",
		["bm_menu_shell_rack"] = "Патронташ",
		["bm_menu_nozzle"] = "Насадка",
		["bm_menu_fuel"] = "Баллон",
		["bm_menu_cylinder"] = "Барабан",
		["bm_menu_model"] = "Модель",
		["bm_menu_forebarrelgrip"] = "Ствол и рукоятка",
		["bm_menu_riser"] = "Рельс",
		["bm_menu_pump"] = "Помпа",

		["bm_menu_ro_barrel"] = "Ствол",
		["bm_menu_ro_stock"] = "Приклад",
		["bm_menu_ro_modifier"] = "Модификаторы",
		["bm_menu_ro_charm"] = "Брелок",
		["bm_menu_ro_grip"] = "Рукоятка",
		
		--Weapon categories--
		["menu_pistol"] = "Пистолеты",
			["menu_light_pis"] = "Легкие пистолеты",
			["menu_heavy_pis"] = "Тяжелые пистолеты",
		
		["menu_shotgun"] = "Дробовики",
			["menu_light_shot"] = "Авто. дробовики",
			["menu_heavy_shot"] = "Легкие дробовики",
			["menu_break_shot"] = "Тяжелые дробовики",
		
		["menu_smg"] = "Пулеметы",
			["menu_light_smg"] = "Легкие ПП",
			["menu_heavy_smg"] = "Тяжелые ПП",
			["menu_light_mg"] = "Легкие пулеметы",
			["menu_heavy_mg"] = "Тяжелые пулеметы",
			["menu_miniguns"] = "Миниганы",

		["menu_assault_rifle"] = "Винтовки",
			["menu_light_ar"] = "Легкие винтовки",
			["menu_heavy_ar"] = "Тяжелые винтовки",
			["menu_dmr_ar"] = "Марксманские винтовки",
			["menu_light_snp"] = "Легкие снайперские винтовки",
			["menu_heavy_snp"] = "Тяжелые снайперские винтовки",
			["menu_antim_snp"] = "Крупнокалиберные винтовки",

		["menu_wpn_special"] = "Особое",
		
		
		

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_dodge_grace"] = "Уворот увеличивает длительность периода бессмертия на #{skill_color}#$grace_bonus%##, до максимальных #{skill_color}#300мс.##\n\nПериод бессмертия - время, во время которого вы не можете получить урон или потерять Уворот. Период бессмертия уменьшается на высоких сложностях.",

		["bm_menu_armor_grinding_1"] = "Восстановление брони за раз: #{skill_color}#$passive_armor_regen##",
		["bm_menu_armor_grinding_2"] = "Восстановление брони за раз: #{skill_color}#$passive_armor_regen## \nArmor regenerated when damaging enemies: #{skill_color}#$active_armor_regen##",

		["bm_menu_armor_max_health_store_1"] = "Максимальное количество запасного здоровья: #{skill_color}#$health_stored##",
		["bm_menu_armor_max_health_store_2"] = "Максимальное количество запасного здоровья: #{skill_color}#$health_stored## \nВосстановление брони за убийство: #{skill_color}#$regen_bonus%##",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
	    ["bm_menu_bonus"] = "Модификаторы",
		["steam_inventory_stat_boost"] = "Модификатор атрибутов",

		--Safe House--
		["dialog_safehouse_text"] = "Вы ещё не посещали убежище.\n\nСоветуем это сделать, ведь там ждёт кое-что новое.\n\nПерейти туда сейчас?",

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
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Converts the weapon's caliber to 7.62mm, which slightly decreases fire rate and stability in favor of increased damage and accuracy.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "An ammunition type that mimics medium tier rifles. Lowers ammo count and stability in trade for higher damage and accuracy.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "Magwell Grip",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "Extended Magazine",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "Extend-o Magazine",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Converts the Jackal into the Mastiff, something of the younger sister in the Jackal family. Not as stable as the Coyote, and not as deadly as the Jackal, but atleast it fires rounds that can pierce both armor and walls.",

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
		["bm_sc_bipod_desc_pc"] = "Расставляются при yf;fnbb #{skill_color}#$BTN_BIPOD##, если позволяет место. Нажмите клавишу снова, чтобы убрать.\n\nУменьшают отдачу на #{skill_color}#60%## и увеличивают расстоянии #{skill_color}#30%## во время использования.\n\n#{item_stage_2}#Дополнительные настройки для сошек можно найти в настройках Restoration Mod.##",
		["bm_sc_bipod_desc"] = "Расставляются при удержании #{skill_color}#$BTN_BIPOD##, если позволяет место. Удержите кнопку снова, чтобы убрать.\n\nУменьшают отдачу на #{skill_color}#60%## и увеличивают расстоянии #{skill_color}#30%## во время использования.\n\n#{item_stage_2}#Дополнительные настройки для сошек можно найти в настройках Restoration Mod.##",
		["hud_hint_bipod_moving"] = "Нельзя развернуть во время ходьбы",
		["hud_hint_bipod_slide"] = "Нельзя развернуть во время переката",
		["hud_hint_bipod_air"] = "Нельзя развернуть в воздухе",
		["hud_hint_bipod_lean"] = "Нельзя развернуть при наклоне",

		--String override for the stungun--
		["bm_melee_taser_info"] = "Устройство, которое бьёт током и оглушает цели при полном заряде.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

	    ["bm_wp_pis_usp_b_match"] = "Затвор Фримена",
		["bm_wp_1911_m_big"] = "Коробчатый магазин",
		["bm_wp_usp_m_big"] = "Коробчатый магазин",
		["bm_wp_upg_ass_ak_b_zastava"] = "Длинный ствол",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Ствол Вульфа",
		["bm_wp_p90_b_ninja"] = "Ниндзя-ствол",
		["bm_wp_par_b_short"] = "Укороченный ствол",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_lemming"] = "Пистолет 5/7",

		["bm_w_x_judge"] = "Жока и Бока", --вините клейтона.
		["bm_w_x_shrew"] = "Барри и Пол",
		["bm_w_x_1911"] = "Мустанг и Салли",
		["bm_w_tec9"] = "Пистолет-пулемет 'T3K Urban'",
		["bm_w_x_tec9"] = "Парные пистолеты-пулеметы 'T3K Urban'",

		["bm_wp_mp5_fg_mp5sd"] = "Цевьё агента",
		["bm_wp_hs2000_sl_long"] = "Элитный затвор",
		["bm_wp_vhs_b_sniper"] = "Гипер-ствол",
		["bm_w_r0991"] = "Пистолет AR-15 Varmint",
		["bm_wp_vhs_b_silenced"] = "Ствол 'Bad Dragan'",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Красный корпус",
		["bm_wp_g3_b_sniper"] = "Макро-ствол",
		["bm_wp_g3_b_short"] = "Микро-ствол",
		["bm_wp_g3_m_psg"] = "Магазин 'Präzision'",

		--VMP HK416c Fixed Stock
		["bm_wp_tecci_s_minicontra_alt"] = "Укрепленный приклад SG",

		["bm_w_beck_desc"] = "Самый популярный дробовик в криминальном мире вернулся в погоне за былой славой. Он использовался в оригинальной волне преступности 2011-го года и доказал свою надёждность в практически любой близкой конфронтации.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Маленький бонус к Скрытности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p1_mod"] = "Маленький модификатор Скрытности",
		["bm_menu_bonus_concealment_p2"] = "Большой бонус к Скрытности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p2_mod"] = "Большой модификатор Скрытности",
		["bm_menu_bonus_concealment_p3"] = "Огромный бонус к Скрытности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p3_mod"] = "Огромный модификатор Скрытности",
		["bm_menu_bonus_spread_p1"] = "Маленький бонус к Точности и штраф к Стабильности",
		["bm_menu_bonus_spread_p1_mod"] = "Маленький модификатор Точности",
		["bm_menu_bonus_spread_n1"] = "Огромный бонус к Стабильности и штраф к Точности",
		["bm_menu_bonus_recoil_p3_mod"] = "Огромный модификатор Стабильности",
		["bm_menu_bonus_recoil_p1"] = "Маленький бонус к Стабильности и штраф к Точности",
		["bm_menu_bonus_recoil_p1_mod"] = "Маленький модификатор Стабильности",
		["bm_menu_bonus_recoil_p2"] = "Большой бонус к Стабильности и штраф к Точности",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+5% опыта для вас и вашей команды.",
		["bm_menu_spread"] = "Точность\n",
		["bm_menu_recoil"] = "Стабильность\n",
		["bm_menu_concealment"] = "Скрытность\n",
		["bm_menu_bonus_spread_p2_mod"] = "Большой модификатор скрытности",
		["bm_menu_bonus_spread_p3_mod"] = "Огромный модификатор скрытности",
		["bm_menu_bonus_recoil_p2_mod"] = "Большой модификатор стабильности",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Денежный бонус",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+5% к денежной награде для вас и команды.",

		["bm_wp_upg_i_singlefire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО ОДИНОЧНУЮ СТРЕЛЬБУ.",
		["bm_wp_upg_i_autofire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО АВТОМАТИЧЕСКУЮ СТРЕЛЬБУ.",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Винтовка Para",
		["bm_w_akmsu"] = "Винтовка Krinkov",
		["bm_w_x_akmsu"] = "Парные винтовки Krinkov",
		["bm_w_hajk"] = "Винтовка CR 805B",
		
		["menu_akimbo_assault_rifle"] = "Парные винтовки",

		--Throwables--
		["bm_concussion_desc"] = "Радиус: 10м \nОглушает врагов на промежуток до 4 секунд \nТочность врагов уменьшается на 50% на 7 секунд \nОглушает всех врагов, кроме Титановых Щитов, Титановых Бульдозеров и Капитанов. \n \nЭто сногсшибательная штучка поразит всех и даст вам лишние секунды чтобы их убить.",
		["bm_grenade_smoke_screen_grenade_desc"] = "Дальность: 8м \nДлительность: 12 секунд \nДетонация: 1сек после падения \n \nИспользуйте, чтобы испариться в клубе дыма, через который врагам будет сложно попасть по вам.",
		["bm_grenade_frag_desc"] = "Урон: 800 \nРадиус: 5м \nДетонация: 3сек \n \nКлассическая осколочная граната. Не требует лишних слов.",
		["bm_dynamite_desc"] = "Урон: 800 \nРадиус: 4м \nДетонация: 3сек \nНе отскакивает и не катится после приземления, но наносит меньше урона от взрыва, чем другая взрывчата.\n\nПридуман, чтобы взрывать камень. Вполне подходит чтобы взрывать людей.",
		["bm_grenade_frag_com_desc"] = "Урон: 800 \nРадиус: 5м \nДетонация: 3сек \n \nОбновлённая классическая граната, она придаст каждому взрыву стиль OVERKILL.",
		["bm_grenade_dada_com_desc"] = "Урон: 800 \nРадиус: 5м \nДетонация: 3сек \nВнешний вид куклы скрывает её взрывоопасные внутренности. Дань Родине.",
		["bm_grenade_molotov_desc"] = "Урон (Огненная лужа): 1200 в течение 10 сек. \nУрон (Огонь): 60 в течение 3 сек. \nДлительность (Огненная лужа): 10 сек. \nДетонирует при попадании \n 50% шанс поджечь врагов, заставляя остальных паниковать.\nРадиус: 3.75м  \n \nБутылка с огнеопасной жидкостью и горящей тряпкой. Дешёво, просто и крайне эффективно. Спалите всё к чертям.",
		["bm_grenade_fir_com_desc"] = "Урон (Огненная лужа): 1440 в течение 12 сек. \nУрон (Огонь): 60 в течение 3 сек. \nРадиус: 3.75м \nДлительность (Огненная лужа): 12 сек. \nДетонация: 2.5 сек. \n 50% шанс поджечь врагов, заставляя остальных паниковать. \n \nСамоподжигающийся фосфорный контейнер. Идеален для отскакивания от стен за угол, к вашим противникам.",
		["bm_wpn_prj_ace_desc"] = "Урон: 240 \n \nМетательные игральные карты с лезвием. Убийственная колода.",
		["bm_wpn_prj_four_desc"] = "Урон (Попадание): 200 \nУрон (Яд): 120 в течение 4 секунд \n50% шанс прервать врага каждые 0.5 секунд. \n Прерывание не действует на Щитов, Бульдозеров, Гренадёров и Капитанов. \n \nУ метательной звезды богатая история, полная крови и битв. Эти смазанные ядом звёздочки несут угрозу всем, кто стоит у вас на пути.",
		["bm_wpn_prj_target_desc"] = "Урон: 240 \n \nОтличный запасной план и надёжная тактика для точного, бесшумного убийства.",
		["bm_wpn_prj_jav_desc"] = "Урон: 360 \n \nКопьё - простое оружие, придуманное ещё в доисторические времена. Простая палка с острым концом, которая испортит кому-нибудь день.",
		["bm_wpn_prj_hur_desc"] = "Урон: 360 \n \nГоворят, заточенный топор никогда не ошибается. Метательный заточенный топор уж тем более.",
		["bm_grenade_electric_desc"] = "Урон: 400 \nРадиус: 5м \nДетонация: 3сек \n \nОсколки - это неплохо, но иногда хочется кого-нибудь поджарить. Эта милая высоковольтная штучка отлично подойдёт.",
		["bm_grenade_poison_gas_grenade"] = "Граната Manticore-6",
		["bm_grenade_poison_gas_grenade_desc"] = "Урон: 900 за 30с \nРадиус: 8м \nДлительность: 20с \nДетонация: 1сек после падения \nВраги могут отравиться каждым облаком только один раз\nЩиты, Гренадёры, Бульдозеры и Капитаны не прерываются.\n\nЭто экспериментальное био-оружие выпускает облако ядовитого газа, которое влияет только на особые гены - у банды полный иммунитет. Жертвы почувствуют сильный кашель, головокружение и рвоту. Опасно для всех, кроме самых бронированных врагов.\n\nОружие военного преступника.",
		

		["bm_wp_wpn_fps_upg_scar_m203_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_scar_m203_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",

		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",
	})

	local twirl = math.rand(1)
	local shalashaska = 0.06
	if twirl <= shalashaska then
		LocalizationManager:add_localized_strings({	
			["bm_w_peacemaker"] = "Revolver Ocelot",
			["bm_w_peacemaker_desc"] = "Revolver Ocelot",
			["bm_ap_weapon_peacemaker_sc_desc"] = "Revolver Ocelot",
			["bm_wp_peacemaker_barrel_long"] = "Revolver Ocelot",
			["bm_wp_peacemaker_barrel_short"] = "Revolver Ocelot",
			["bm_wp_peacemaker_handle_bling"] = "Revolver Ocelot",
			["bm_wp_peacemaker_rifle_stock"] = "Revolver Ocelot",
			["bm_menu_ro_barrel"] = "Revolver Ocelot",
			["bm_menu_ro_stock"] = "Revolver Ocelot",
			["bm_menu_ro_modifier"] = "Revolver Ocelot",
			["bm_menu_ro_charm"] = "Revolver Ocelot",
			["bm_menu_ro_grip"] = "Revolver Ocelot",

			["bm_m134_sc_desc"] = "CRYPTIC METAPHOR...",
		})
	end

	-- local cute = math.rand(1)
	-- local funny = 0.02
	-- if cute <= funny then
		-- LocalizationManager:add_localized_strings({	
			-- --пожалуй, обойдёмся без этого.
			-- --SEISHOU ACADEMY
				-- --MIDDLE SCHOOLERS
					-- ["bm_w_m16"] = "Ichiroku",
						-- ["bm_m16_sc_desc"] = "\"I won't lose!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nThe energetic and foul-mouthed figurehead of the school.",
					-- ["bm_w_m4"] = "Em-Four",
						-- ["bm_m4_sc_desc"] = "\"Don't underestimate a service rifle!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nVice-president of the middleschool student council.",
					-- ["bm_w_aug"] = "AUG",
						-- ["bm_aug_sc_desc"] = "\"RUN AWAY! PLEAD FOR YOUR LIFE!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nPresident of the middleschool student council.",
					-- ["bm_wp_ak5_fg_fnc"] = "Funco Kit",
						-- ["bm_wp_ak5_fg_fnc_desc"] = "\"To respond to its master's wishes is a tool's joy.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nGives off a heavy \"main protagonist\" aura.",
					-- ["bm_w_s552"] = "Shigu",
						-- ["bm_s552_sc_desc"] = "\"Next shot, I'll take your ear off, bitch.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nAn honor student from a wealthy family who excels in both sports and studies.",
					-- ["bm_w_l85a2"] = "Eru",
						-- ["bm_l85a2_sc_desc"] = "\"...\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nShy and clumsy, she has an unreliable nature and the habit of breaking a lot.",
					-- ["bm_w_rk62"] = "Sako",
						-- ["bm_rk62_sc_desc"] = "\"#{stat_maxed}#What wonderful squeals!## You sound like you're about to #{stats_positive}#die!##\"\n\nA transfer student attending #{stats_positive}#Seishou Academy.##\nAn elf-eared sadist with a drive to be the \"alpha\" of any school she attends. Desires Funco.",
	
				-- --HIGH SCHOOLERS
					-- ["bm_w_fal"] = "Faru",
						-- ["bm_fal_sc_desc"] = "\"Your big sis arrived-!\"\n\nFunco's older sister.\nNot to be confused with Funco's other sister, L1A1.",
					-- ["bm_w_m14"] = "Ichiyon",
						-- ["bm_m14_sc_desc"] = "\"What are those westerners doin' copying AKs!? Buncha traitors!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nEasy-going and chalk-full of puns. Currently going through a fashion-sense crisis.",
					-- ["bm_w_g3"] = "Jiisuri",
						-- ["bm_g3_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's raifu.",

				-- --ELEMENTARY
					-- ["bm_w_mp5"] = "Empi",
						-- ["bm_mp5_sc_desc"] = "\"If that's your hobby...\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nOne of Jiisuri's many younger siblings and the student council president of the elementary division.",
					-- ["bm_w_uzi"] = "Uzi",
						-- ["bm_uzi_sc_desc"] = "\"Eat this!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nThe former self-declared leader of the elementary division, pushed out of the position by Empi when she arrived.",
					-- ["bm_w_mac10"] = "Ram",
						-- ["bm_mac10_sc_desc"] = "\"INGRAM!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nA machinegun with words. Also rather top-heavy.",
		
				-- --FACULTY
					-- ["bm_w_erma"] = "Erma-sensei",
						-- ["bm_erma_sc_desc"] = "\"Come in! Come in!\"\n\nAn elementary school dorm mom working at #{stats_positive}#Seishou Academy.##\nThe SMGs love her.",
					-- ["bm_w_m1928"] = "Thompson-sensei",
						-- ["bm_m1928_sc_desc"] = "\"It's common sense!\"\n\nAn elementary school teacher working at #{stats_positive}#Seishou Academy.##\nSpeaks with accented Japanese. A former member of the FBI.",
					-- ["bm_w_ching"] = "Garand",
						-- ["bm_galant_sc_desc"] = "\"ARE YOU TRYING TO PULL ONE OVER ON ME!?\"\n\nA drill instructor working at #{stats_positive}#Seishou Academy.##\nLooks over the middleschoolers.",
	
			-- --RED STEEL ACADEMY
				-- --THREE STRIPES
					-- ["bm_w_siltstone"] = "Drako",
						-- ["bm_siltstone_sc_desc"] = "\"Не поймите неправильно...\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nCalm, collected and speaks exclusively in Russian.", --sorry about the Google/MS translate
					-- ["bm_w_akm"] = "AKM",
						-- ["bm_akm_sc_desc"] = "\"DON'T FUCK WITH ME!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, menacing girl with the ears and tail of a fox. One of the few students capable of decieving AK47.",
					-- --["bm_w_rpk"] = "RPK",
						-- ["bm_rpk_sc_desc"] = "\"This is why men are such pigs!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, blonde girl with the ears and tail of a Siberian Tiger. Gets sniped frequently.",
				-- --TWO STRIPES
					-- ["bm_w_ak74"] = "Nanayon",
						-- ["bm_ak74_sc_desc"] = "\"If it's the Major's orders, anything goes-\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nA beautiful girl with not only the ears and tail of a fox but the cunning nature to match.",
					-- ["bm_w_saiga"] = "Saiga-chan",
						-- ["bm_saiga_sc_desc"] = "\"All of you are like mice in a trap, nya!\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nHaughty, overconfident, and expressive, Saiga is a loud and boisterous auto-shotgun.",
				-- --ONE STRIPE
					-- ["bm_w_coal"] = "Bizon",
						-- ["bm_coal_sc_desc"] = "\"You can count on me-!\"\n\nA one-stripe student attending #{stats_negative}#Red Steel Academy.##\nReally looks up to her seniors, quite literally, but takes special care when addressing SVD.",
				-- --FACULTY
					-- ["bm_w_mosin"] = "Mosin Nagant",
						-- ["bm_mosin_sc_desc"] = "\"To the self-reflection room it is...\"\n\nA faculty member of #{stats_negative}#Red Steel Academy.##\nThe absolute Tsarista born of the Russian Empire. An old friend of Thomspon-sensei.",
			
			-- --ENOSHIMA
				-- --MIDDLE SCHOOLERS
					-- ["bm_w_spas12"] = "Supasu",
						-- ["bm_spas12_sc_desc"] = "\"Idiot! You're completely exposed!\"\n\nA middleschooler attending a public school in Enoshima.",
					-- ["bm_w_benelli"] = "Beneri M4",
						-- ["bm_spas12_sc_desc"] = "\"There's a limit to not being able to read the mood!\"\n\nA middleschooler attending a public school in Enoshima.",
				
		-- })
	-- end
	
	-- local big = math.rand(1)
	-- local pistol = 0.02
	-- if big <= pistol then
		-- LocalizationManager:add_localized_strings({	
			-- ["bm_w_deagle"] = "Big Pistol",
			-- ["bm_w_m16"] = "is that a clarion",
			-- ["bm_m16_sc_desc"] = "I'll give you a clip so you can do some damage",
			-- ["bm_w_x_type54"] = "The twin crosskills",
		-- })
	-- end	
	
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
			["hud_assault_assault"] = "ИДЕТ ШТУРМ НАЁМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЁMHИKOB"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Итде Плоиецский Шрутм",
			["hud_assault_cover"] = "ОСТВЙТСЬ В УРКЫТИИ...МОЗГИИ",
			["hud_assault_alpha"] = "ПЛОИЕЦСКИЙ ШРУТМ"
		})
	end)
elseif ai_type == f then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Asalto En Marcha",
			["hud_assault_cover"] = "MANTENTE A CUBIERTO",
			["hud_assault_alpha"] = "ASALTO"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Идет операция Murkywater",
			["hud_assault_alpha"] = "ОПЕРАЦИЯ MURKYWATER"
		})
	end)
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
	local lapd = tweak_data.levels.ai_groups.lapd
	local mex = tweak_data.levels.ai_groups.federales
	local akan = tweak_data.levels.ai_groups.russia
	local nypd = tweak_data.levels.ai_groups.nypd
	local fbi = tweak_data.levels.ai_groups.fbi
	local breins = tweak_data.levels.ai_groups.zombie

	Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat", function(loc)
		loc:load_localization_file(ModPath .. "lua/sc/loc/hoplibkillfeedcompat.json")
	end)

	if ai_type == murkywetew then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_murkywetew", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/murkywetew.json")
		end)
	elseif ai_type == lapd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_LAPD", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/lapd.json")
		end)	
	elseif ai_type == mex then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_mex", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/mex.json")		
		end)
	elseif ai_type == akan then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_akan", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/akan.json")		
		end)
	elseif ai_type == nypd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_nypd", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/nypd.json")		
		end)
	elseif ai_type == fbi then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_fbi", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/fbi.json")		
		end)
	elseif ai_type == breins then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_breins", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/breins.json")		
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
		["debug_interact_bodybags_bag_take_bodybag"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕШКИ ДЛЯ ТРУПОВ И СТЯЖКИ",

	    ["menu_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit"] = "Кейс с метательным оружием",
		["debug_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit_desc"] = "Чтобы использовать кейс с метательным оружием, вам нужно установить его, зажав $BTN_USE_ITEM. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием $BTN_INTERACT, чтобы восполнить запас метательного оружия. Он может быть использован три раза.\n\nВы можете увидеть, сколько ещё раз можно использовать кейс, посмотрев на него.\n\nКейс с метательным оружием это скрытная вещь, используемая солдатами и наёмниками для переноски особого оружия на тяжёлый случай.",

		["bm_equipment_ecm_jammer_desc"] = "Чтобы использовать генератор помех, вам нужно установить его, удерживая $BTN_USE_ITEM. После установки его нельзя переместить. Он активируется на 10 секунд.\n\nВы можете переключить режим работы генератора помех при взаимодействии с ним. В этом случае, генератор помех будет оглушать врагов в радиусе 25 метров каждые 1.5 секунды. Оглушение длится 10 секунд, и перезаряжается через 4 минуты.\n\nГенераторы помех могут взламывать банкоматы и ненадолго отключать электронные устройства - телефоны, камеры и прочие системы безопасности.",
		["bm_equipment_first_aid_kit_desc"] = "Удерживайте кнопку $BTN_USE_ITEM, чтобы установить аптечку. Её нельзя переместить после установки, но можно использовать, зажав кнопку $BTN_INTERACT, чтобы восстановить 150 здоровья. Аптечку первой помощи можно использовать только один раз.\n\nАптечка первой помощи - небольшой ассортимент лечебных средств, используемый в экстренных ситуациях.",
		["bm_equipment_doctor_bag_desc"] = "Чтобы использовать медицинскую сумку, вам нужно установить её, используя $BTN_USE_ITEM. После установки её нельзя переместить, но можно использовать, удерживая $BTN_INTERACT, чтобы восстановить 20% максимального здоровья сразу и 4% максимального здоровья каждые 4 секунды в течение 3 минут. Медицинскую сумку можно использовать 2 раза.\n\nМедицинская сумка - портативный кейс, который используется профессиональными врачами для переноса медикаментов и лекарств.",
		["bm_equipment_sentry_gun_desc"] = "Чтобы использовать турель, вам нужно установить её, зажав $BTN_USE_ITEM. Вы используете 40% вашего запаса патронов на установку. При получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая $BTN_INTERACT. Взятие турели вернёт оставшиеся в ней патроны и починит её. Турели пугают гражданских, заставляя их оставаться на месте.\n\nТруель автоматически наводится и стреляет по целям, которые попадают под её сенсор. Она используется для отвлечения противников от вас и вашей команды.",
		["bm_equipment_sentry_gun_silent_desc"] = "Чтобы использовать турель, вам нужно установить её, зажав $BTN_USE_ITEM. Вы используете 40% вашего запаса патронов на установку. При получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая $BTN_INTERACT. Взятие турели вернёт оставшиеся в ней патроны и починит её.\n\nПриглушённая турель, в отличие от громкой обычной, используется для убийства врагов, а не отвлечения.",
		["bm_equipment_bodybags_bag_desc"] = "Чтобы использовать кейс, вам нужно установить его, зажав $BTN_USE_ITEM. После установки его нельзя переместить, но можно использовать, удерживая $BTN_INTERACT, чтобы восстановить мешки для тел и стяжки.\n\nУ кейса ограниченный запас. По его виду можно понять, сколько сумок осталось. Кейс позволяет восполнить мешки для тел и стяжки, использующиеся для транспортировки тел при скрытных операциях и контроле толп гражданских.",

		["hud_int_hold_take_pardons"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ ПОМИЛОВАНИЕ",
		["debug_interact_gage_assignment_take"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ЗАБРАТЬ ПОСЫЛКУ ГЕЙДЖА",

		["far_repair_sentry_macro"] = "Турель критически повреждена - требуется ремонт.",
		["fixing_sentry_macro"] = "Прогресс ремонта: $AMMO_LEFT",
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
		["loading_gameplay_res_2"] = "Клокеры больше не издают гудящий звук, когда сидят в засаде, а также скрежет при атаке.",
		["loading_gameplay_res_3"] = "Пистолеты идеально дополняют основное оружие с долгой скоростью переключения.",
		["loading_gameplay_res_4"] = "Тазеры теперь не перезаряжают ваше оружие.",
		["loading_gameplay_res_5"] = "Грабитель вдали от товарищей - идеальная цель для Клокеров.",
		["loading_gameplay_res_6"] = "Клокеры наносят урон напрямую здоровью, когда атакуют пинком. Этот урон можно уменьшить, используя Стойкость или навык 'Контрудар'.",
		["loading_gameplay_res_7"] = "Зелёные Бульдозеры наносят много урона и могут пробить даже самую тяжёлую броню с одного выстрела.",
		["loading_gameplay_res_8"] = "Чёрные Бульдозеры (Бульдозеры с Сайгой) обладают высокой скорострельностью и большим магазином.",
		["loading_gameplay_res_9"] = "Дозеры с пулемётами/Скаллдозеры ведут огонь на поражение и не останавливаются, пока не отстреляют всю ленту.",
		["loading_gameplay_res_10"] = "Дозеры с дробовиками Бенелли (Бенелли Дозеры) заменяют Дозеров с миниганами - у них и высокий урон, и высокая скорость стрельбы. Они совмещают опасность Зелёного и скорость Чёрного Дозеров.",
		["loading_gameplay_res_11"] = "Приоритет целей важен. Бульдозеру явно стоит уделить больше внимания, чем обычному спецназовцу.",
		["loading_gameplay_res_12"] = "На Смертном приговоре, Бульдозеры впадают в ярость, когда их стекло сломано, что увеличивает их урон на 10%.",
		["loading_gameplay_res_13"] = "Клокеры издают свой известный клич, если собираются произвести удар ногой в прыжке.",
		["loading_gameplay_res_14"] = "Удар ногой в прыжке от Клокеров закует вас в наручники вместо падения.",
		["loading_gameplay_res_15"] = "Светошумовые гранаты не могут быть сломаны на Смертном приговоре. Your opinion, my choice.",
		["loading_gameplay_res_16"] = "Атаки в ближнем бою можно парировать, если достать оружие ближнего боя. Навык 'Контрудар' также позволяет парировать Клокеров.",
		["loading_gameplay_res_17"] = "Атаки противников в ближнем бою гораздо более эффективны, чем раньше. Соблюдайте дистанцию.",
		["loading_gameplay_res_18"] = "Что гораздо эффективнее, чем бить врагов бейсбольной битой? Бить их по голове для дополнительного урона.",
		["loading_gameplay_res_19"] = "Снайперу требуется короткий промежуток времени, чтобы прицелиться, прежде чем он выстрелит. Обращайте внимание на лазер!",
		["loading_gameplay_res_20"] = "Клокеры также могут атаковать ногой ваших Джокеров.",
		["loading_gameplay_res_21"] = "Обычные противники обладают деталями на униформах, которые дадут понять, какое оружие они используют.",
		["loading_gameplay_res_22"] = "Противники с дробовиками очень опасны вблизи, но не вдалеке.",
		["loading_gameplay_res_23"] = "На высоких сложностях, противники стараются прятаться за Щитами.",
		["loading_gameplay_res_24"] = "На высоких сложностях, у противников появляются новые тактики.",
		["loading_gameplay_res_25"] = "'Смертный приговор' привносит много новых злобных фишек. Ожидайте худшего.",
		["loading_gameplay_res_26"] = "Pro Job - особо сложный режим, в котором у вас будет только одна попытка на прохождение. Остерегайтесь отряд Браво.",
		["loading_gameplay_res_27"] = "В Restoration Mod присутствуют разные фракции врагов, например, наёмники Murkywater и полиция разных штатов.",
		["loading_gameplay_res_28"] = "На высоких сложностях, Клокеры бросают дымовую завесу при атаке.",
		--New Units Hints
	    ["loading_new_units_res_title"] = "Restoration - советы о новых противниках",
		["loading_new_units_res_1"] = "OMNIA ASU (агенты поддержки) усиливают урон товарищей при помощи жёлтых лазеров.",
		["loading_new_units_res_2"] = "LPF получает больше урона от оружия ближнего боя.",
		["loading_new_units_res_3"] = "Слабые противники получают дополнительное здоровье от LPF. В этом случае они помечаются фиолетовым цветом.",
		["loading_new_units_res_4"] = "Титановые Клокеры обладают продвинутой экипировкой, которая делает их практически невидимыми, но издаёт такие же звуки, как экипировка стандартных Клокеров.",
		["loading_new_units_res_5"] = "Титановые Дозеры предпочитают держать грабителей на расстоянии, чтобы выцелить их из своего Рельсотрона.",
		["loading_new_units_res_6"] = "Титановые Снайперы не имеют высокого урона и пробития брони, как у их стандартных  соратников, зато могут передвигаться и обладают высокой скоростью стрельбы.",
		["loading_new_units_res_7"] = "Вместо лазеров, Титановые Снайперы используют фиолетовые трассеры.",
		["loading_new_units_res_8"] = "Титановые щиты можно пробить только снайперской винтовкой Thanatos, пилой OVE9000 (с навыком 'Рвать и метать') и особыми бронебойными патронами у турелей.",
		["loading_new_units_res_9"] = "Капитан Спринг и Титановые Дозеры всегда получают дополнительный урон в голову.",
		["loading_new_units_res_10"] = "Титановые Тазеры используют электрические боеприпасы, которые ненадолго замедляют вас. Экран засветится синим, если он выстрелит в вас.",
		["loading_new_units_res_11"] = "Копы-ветераны обладают рефлексами, которые позволяют им защищаться от медленного и мощного оружия. Против него идеальны огненное, взрывчатое или скорострельное оружие",
		["loading_new_units_res_12"] = "Копы-ветераны быстро передвигаются, из-за чего по ним трудно попасть.",
		["loading_new_units_res_13"] = "Титановый SWAT обладает бронёй, которая защищает их от холодного оружия.",
		["loading_new_units_res_14"] = "Титановый SWAT нельзя взять в заложники или переманить на свою сторону. ",
		["loading_new_units_res_15"] = "Титановый SWAT используют пулемёты и автоматические дробовики.",
		["loading_new_units_res_16"] = "Отряды Браво появляются только в режиме Pro Job, во время Точки невозврата. Это опасные противники, обладающие усиленными бронежилетами и более мощным оружием.",
		["loading_new_units_res_17"] = "Отряды Браво используют осколочные гранаты. Обращайте внимание на их уникальные звук и эффект.",
		["loading_new_units_res_18"] = "АКАН использует собственных Титановых юнитов, разработанные корпорацией DRAK.",
		["loading_new_units_res_19"] = "Гренадёр использует гранаты со слезоточивым газом, которые наносят продолжительный урон игрокам, стоящим в облаке. На 'Смертном приговоре' он вооружён более смертоносным паралитическим газом, который также уменьшает выносливость.",
		--Captain Hints
		["loading_captains_res_title"] = "Restoration - советы о капитанах",
		["loading_captains_res_1"] = "Чтобы победить капитана Саммерса, нужно сначала обезвредить его команду, начиная с Дока. Саммерс будет неубиваем, пока вся его команда жива; остальные двое будут практически неуязвимы, пока жив Док.",
		["loading_captains_res_2"] = "Не жмитесь к Капитану Саммерсу, он быстро сожжёт вас.",		
		["loading_captains_res_3"] = "Капитан Спринг выдерживает много урона, но рано или поздно погибнет. Остерегайтесь его гранат и пользуйтесь его низкой скоростью.",	
		["loading_captains_res_4"] = "Капитан Спринг периодически бросает кластерные осколочные гранаты. Не стойте возле него слишком долго.",
		["loading_captains_res_5"] = "Капитан Спринг может быть опасным, но это компенсируется его низкой скоростью и дальнобойностью.",
		["loading_captains_res_6"] = "Капитан Отем громко смеётся во время своих атак.",
		["loading_captains_res_7"] = "В отличие от других капитанов, полиция не анонсирует появление капитана Отема, чтобы не испортить сюрприз.",
		["loading_captains_res_8"] = "Капитан Отем будет постепенно отключать ваше снаряжение, если дать ему оставаться незамеченным продолжительное время. Отключенное снаряжение помечено фиолетовым и будет восстановлено только после смерти Отема.",	
		["loading_captains_res_9"] = "Вряд ли у вас получится победить капитана Отема в кулачном бою. Не стоит пробовать.",	
		["loading_captains_res_10"] = "Капитан Винтерс практически неуязвим к взрывчатке и огню, обладает сильной защитой от пуль, но достаточно слаб в ближнем бою.",	
		["loading_captains_res_11"] = "Щит Капитана Винтерса совершенно невозможно пробить.",
		["loading_captains_res_12"] = "Капитан Винтерс двигается по карте, постоянно подлечивая врагов.",
		--Stealth Hints
	    ["loading_stealth_res_title"] = "Restoration - советы о стелсе",
		["loading_stealth_res_1"] = "Оператор посылает охранников на осмотр сломанных камер, поэтому камеры можно использовать как приманку.",	
		["loading_stealth_res_2"] = "Если быстро убить охранника холодным оружием, то пейджер не сработает.",
		["loading_stealth_res_3"] = "Оператор может заметить убитых охранников и отправить замену.",	
		["loading_stealth_res_4"] = "Охранники, не имеющие пейджеров, не увеличивают шкалу подозрения при смерти.",	
		["loading_stealth_res_5"] = "Любое громкое оружие в стелсе имеет расстояние шума в 25 метров.",
		["loading_stealth_res_6"] = "Гражданские падают на землю, когда слышат стрельбу как при громком прохождении, так и стелсе.",	
		["loading_stealth_res_7"] = "Турели заставляют лежать всех гражданских в достаточно высоком радиусе.",
		["loading_stealth_res_8"] = "Когда вы несёте сумку, вас будут замечать с гораздо большей дистанции, а также гораздо быстрее, если вы стоите, бежите или прыгаете. Двигайтесь медленно и вприсядку.",
		["loading_stealth_res_9"] = "Вы можете брать до 4 Генераторов помех вместо 2 из ванильной игры, но их время действия сокращено в два раза.",
		["loading_stealth_res_10"] = "Оружие с глушителем не издает никакого шума в стелсе.",
		["loading_stealth_res_11"] = "Вы можете взять в заложники до 4 охранников.",	
		["loading_stealth_res_12"] = "Стелс теперь прощает ошибки, позволяя перестраивать планы на лету.",
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
		["loading_equip_skills_res_1"] = "Дробовики с низкой Точностью теряют эффективность на расстоянии, дробовики с высокой - теряют возможность поразить несколько целей. Экспериментируйте и выясняйте, что подходит именно вам!",
		["loading_equip_skills_res_2"] = "Пистолеты достаются быстрее всех остальных категорий оружия.",
		["loading_equip_skills_res_3"] = "Оружие в Restoration разделено на различные классы со своими плюсами и минусами. Оружие с большим уроном убивает врагов быстрее, но и опустошается так же быстро! ",
		["loading_equip_skills_res_4"] = "Оружие с высоким уроном, как правило, менее скрытно, если у него нет значительных минусов, таких как низкие Точность и Скорострельность. ",
		["loading_equip_skills_res_5"] = "Вульф прокачал Турели - теперь их можно ремонтировать прямо во время боя. Это занимает время, но зато процесс автоматический - вам нужно только запустить его.",	
		["loading_equip_skills_res_6"] = "Если у вас открыты бронебойные патроны для Турелей, вы можете выбрать стандартный тип патронов в меню снаряжения. ",	
		["loading_equip_skills_res_7"] = "Наборы перков предоставляют значительный бонус к урону, и многие из них обладают чрезвычайно нужными навыками лечения.",
		["loading_equip_skills_res_8"] = "Капо, Оружейник, Силовик, Аферист, Шулер и Байкер - это простые и поэтому надёжные наборы перков.",
		["loading_equip_skills_res_9"] = "Киллер (Hitman) был переработан в набор перков, который обладает низкой выживаемостью и надёжностью, но взамен предоставляет возможность получить большое количество 'временного здоровья', чтобы пробиться через сложные ситуации.",
		["loading_equip_skills_res_10"] = "Капо (Crew Chief) - это командный набор перков, который предоставляет небольшие, но полезные бонусы для вас и ваших соратников, и ещё больше бонусов, если вы берёте заложников. Он хорошо сочетается с веткой Командира у Манипулятора.",
		["loading_equip_skills_res_11"] = "Шулер (Gambler) - это командный набор перков, который предоставляет немного здоровья вам и бонусные боеприпасы для ваших товарищей, когда вы подбираете патроны. Хорошо сочетается с навыками, которые дают дополнительные коробки патронов с врагов.",	
		["loading_equip_skills_res_12"] = "Маньяк (Maniac) - это агрессивный и командный набор перков, который понижает повреждения по вам и вашим соратникам, если вы безостановочно наносите урон. Хорошо сочетается с билдами, в которых есть высокий урон и сопротивление урону.",	
		["loading_equip_skills_res_13"] = "Карманный генератор помех Хакера (Hacker) предоставляет лечение и сдерживание толпы всей команде, но долго перезаряжается. Помимо этого, он эффективен в стелсе.",	
		["loading_equip_skills_res_14"] = "Взломщик (Burglar) - набор перков, которые предоставляет небольшие бонусы в стелсе, но в бою слабее, чем другие перки.",	
		["loading_equip_skills_res_15"] = "Вор в законе (Kingpin) - гибкий набор перков. Инъектор можно использовать для самолечения, защиты от большого урона, или отвлечения противников от вашей команды.",	
		["loading_equip_skills_res_16"] = "Тандем (Tag Team) - командный набор перков, который позволяет предоставить большое количество лечения конкретному соратнику, при условии, что вы вдвоём устраняете врагов без остановки.",	
		["loading_equip_skills_res_17"] = "Бронебойные пули, пробившие щит, нанесут 50% урона.",	
		["loading_equip_skills_res_18"] = "Револьверы Peacemaker и Phoenix .500 могут пробивать врагов, стены и щиты, как снайперские винтовки.",	
		["loading_equip_skills_res_19"] = "Если справа на экране отображается шкала синего цвета - у вас есть Уворот (Dodge). Когда она подсвечивается, вы увернётесь от следующей пули. Для более подробного объяснения механики уворота, используйте Гайд.",	
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
		["loading_equip_skills_res_30"] = "Берегите Пиковый навык Мотивация (Inspire Ace) для действительно опасной ситуации, ведь он очень долго перезаряжается и требует прямую видимость.",	
		["loading_equip_skills_res_31"] = "Restoration Mod добавляет два дополнительных набора перков, которые предоставляют больше денег и опыта, но отключают перки. Испытайте себя ради увеличенных наград!",
		["loading_equip_skills_res_32"] = "Чтобы получить бонус к прицеливанию, требуется дождаться конца анимации прицеливания. Следите за характеристикой \"Прицеливание\", когда настраиваете оружие.",
		["loading_equip_skills_res_33"] = "Длинные стволы, крупные приклады и большие магазины имеют хорошие преимущества, но вредят скорости переключения, перезарядки, прицеливания и задержку после бега. Если слишком увлечётесь ими, оружие станет слишком медленным для использования.",
		["loading_equip_skills_res_34"] = "Скорость удара прикладом зависит от Скрытности вашего оружия.",
		["loading_equip_skills_res_35"] = "Характеристика \"Прицеливание\" влияет на задержку после бега, на время которой вы не можете стрелять.",
		["loading_equip_skills_res_36"] = "Глушители уменьшают шанс того, что враги увернутся от вашей атаки. Учтите, что вместо уворота они откроют по вам огонь.",
		--Misc Hints
		["loading_misc_res_title"] = "Restoration - прочие подсказки",
		["loading_misc_res_1"] = "Попробуйте новые ограбления из Restoration! Вы можете найти их у заказчика 'Джекел', а также ограбление 'Наркопритон' у Влада.",	
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
		["bm_suit_none_desc"] = "Это стандартный костюм грабителя с выбранной бронёй. Может измениться с костюма-двойки в зависимости от ограбления!",

		-- Ad Banner Change
		["menu_changelog"] = "Последний чейнджлог",
		["menu_discord"] = "Сервер в Discord",
		["menu_guide"] = "Гайд по моду",
		["menu_captains"] = "Информация о Капитанах",
		["menu_content_updates"] = "Гайд/Поддержка",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "Мутаторы, которые урезают Опыт и Деньги также не будут давать достижения, большинство трофеев и не считаются за прохождение ограбления!",
		["menu_mutators_category_holiday"] = "ПРАЗДНИКИ",
		["menu_mutators_category_old_event"] = "ИВЕНТЫ",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "Гренадёры",
		["mutator_specials_override_sniper"] = "Снайперы",
		
		["mutator_titandozers_desc"] = "Хэллоуинские эффекты",
		["mutator_titandozers_longdesc"] = "Безголовый Бульдозер сбежал из кошмаров Вульфа в реальность! Обычные Бульдозеры заменены на Безголовых, а также включены особые хэллоуинские эффекты.",

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

		["mutator_spawn_mult"] = "Увеличенные отряды",
		["menu_mutator_enemy_spawn"] = "МНОЖИТЕЛЬ СПАУНОВ",
		["mutator_spawn_mult_desc"] = "Спауны врагов увеличены.",
		["mutator_spawn_mult_longdesc"] = "Во время штурмов будет спаунится больше врагов. Почувствуйте себя Джулсом!",
		
		["mutator_birthday"] = "Гелиевая вечеринка",
		["mutator_birthday_desc"] = "Убийство особых врагов спаунит шарики, которые дают бонусы.",
		["mutator_birthday_longdesc"] = "Восьмилетие PAYDAY:\n\nУбийство особых врагов заспаунит шарики, которые можно прострелить чтобы получить бонусы для всей команды. Некоторые враги спаунят шарики чаще. Можно активировать несколько бонусов сразу.",		

		["mutator_piggybank"] = "Покорми свинью",
		["mutator_piggybank_desc"] = "Убийство врагов даёт свинобаксы, которыми можно покормить золотую свинью.",
		["mutator_piggybank_longdesc"] = "Девятилетие PAYDAY:\n\nУбитые враги роняют свинобаксы. Свинобаксы - временные сумки, которыми можно кормить Золотую Свинку. Чем больше Свинка растёт, тем больше бонусного денег и опыта вы получите в конце ограбления.",		
		
		["mutator_bravos_only"] = "Профессиональный день",
		["mutator_bravos_only_desc"] = "Все враги заменены на свои PONR-варианты.",
		["mutator_bravos_only_longdesc"] = "Все враги заменены на варианты, которые появляются при Точке Невозврата (PONR) в режиме Pro-Job. Синий спецназ заменён на спецназ ФБР, а спецназ ФБР заменён на отряды Браво.",		

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
		["menu_cs_modifier_grace"] = "Ваша задержка на получение урона уменьшена на 1/60 секунды.",
		["menu_cs_modifier_letstrygas"] = "Дымовые завесы заменены на слезоточивый газ.",
		["menu_cs_modifier_boomboom"] = "Гренадёры взрываются при смерти.",
		["menu_cs_modifier_friendlyfire"] = "Союзники теперь получают 100% урона по своим.",
		["menu_cs_modifier_dodgethis"] = "Копы-ветераны теперь уворачиваются от всех пуль.",
		["menu_cs_modifier_sniper_aim"] = "Снайперы наводятся на 100% быстрее.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "SWAT с лёгкими винтовками получают на 100% больший шанс стать лидером отряда + в каждом отряде может быть на одного лидера больше.",
		["menu_cs_modifier_heavy_sniper"] = "Титановые снайперы и снайперы Браво ведут автоматический огонь на близких расстояниях.",
		["menu_cs_modifier_dozer_medic"] = "Когда появляется Бульдозер, есть шанс, что его заменит Бульдозер-Медик. Бульдозер-Медик считается за Медика и Бульдозера одновременно .",
		["menu_cs_modifier_dozer_minigun"] = "Когда появляется Зелёный или Чёрный Бульдозер, есть шанс, что его заменит Бульдозер с М1014.",
		["menu_cs_modifier_shield_phalanx"] = "Все обычные Щиты получают дополнительный 15% шанс стать Титановыми щитами.",
		["menu_cs_modifier_taser_overcharge"] = "Тазерам теперь не нужно целиться перед шоком. Задержка между попытками остаётся.",
		["menu_cs_modifier_dozer_rage"] = "Когда стекло Бульдозера уничтожено, он войдёт в ярость, получая 10% к наносимому урону.",
		["menu_cs_modifier_medic_adrenaline"] = "Все Медики получают дополнительный 15% шанс стать OMNIA LPF.",
		["menu_cs_modifier_cloaker_arrest"] = "Атаки Клокеров в ближнем бою теперь заковывают игроков.",
		["menu_cs_modifier_cloaker_smoke"] = "Клокеры теперь имеют шанс 50% сбросить светошумовую гранату, когда уворачиваются от атак.",
		["menu_cs_modifier_cloaker_tear_gas"] = "Все агенты по спасению заложников получают дополнительный 15% шанс стать Титановыми агентами.",
		["menu_cs_modifier_dozer_lmg"] = "Когда появляется Зелёный или Чёрный Бульдозер, есть шанс, что его заменит Скаллдозер.",
		["menu_cs_modifier_10secondsresponsetime"] = "Полицейские штурмы сразу имеют максимальную интенсивность.",

		["bm_menu_skill"] = "Бонусы для команды",

		["menu_crew_interact"] = "Ловкий",
		["menu_crew_interact_desc"] = "Игроки взаимодействуют на 15% быстрее за каждого бота в команде.",

	    ["menu_crew_inspire"] = "Вдохновление",
        ["menu_crew_inspire_desc"] = "Боты с этим перком могут использовать на вас Вдохновление.\n\nОни не могут его использовать чаще чем в 90 секунд. Перезарядка уменьшается на 15 секунд за каждого бота в команде.",

        ["menu_crew_scavenge"] = "Острый глаз",
		["menu_crew_scavenge_desc"] = "Подбор патронов для игроков увеличен на 10% за каждого бота в команде.",

        ["menu_crew_ai_ap_ammo"] = "Пробитие",
        ["menu_crew_ai_ap_ammo_desc"] = "Ваши боты теперь могут пробивать броню и так же они наносят на 25% больше урона.\n\nЭто позволяет им простреливать через броню и щитов.",

        ["menu_crew_healthy"] = "Подготовка",
        ["menu_crew_healthy_desc"] = "Здоровье игроков увеличено на 30.",

        ["menu_crew_sturdy"] = "Защитник",
        ["menu_crew_sturdy_desc"] = "Броня игроков увеличена на 10%.",

        ["menu_crew_evasive"] = "Отвлекающий манёвр",
        ["menu_crew_evasive_desc"] = "Полоска уворота игроков заполняется на 3% от их максимального уворота.",

        ["menu_crew_motivated"] = "Тренер",
        ["menu_crew_motivated_desc"] = "Игроки получают на 15 больше выносливости.",

        ["menu_crew_regen"] = "Лекарь",
        ["menu_crew_regen_desc"] = "Игроки лечат 1 очко здоровья каждые 4 секунды.",

        ["menu_crew_quiet"] = "Скрытный",
        ["menu_crew_quiet_desc"] = "Игроки получают на 2 больше скрытности.",

        ["menu_crew_generous"] = "Подарочек",
        ["menu_crew_generous_desc"] = "Игроки получают дополнительное мететальное за каждые 70 убийств.",

        ["menu_crew_eager"] = "Адреналин",
        ["menu_crew_eager_desc"] = "Игроки перезаряжают оружие на 10% быстрее.",

	--[[   SKILLTREES   ]]--

		--[[   MASTERMIND   ]]--

			--[[   MEDIC SUBTREE   ]]--
				--Combat Medic
				["menu_combat_medic_beta_sc"] = "Лепила",
				["menu_combat_medic_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#10%## меньше урона во время поднятия напарника, и на #{skill_color}#5## секунд после.\n\nПИКОВЫЙ: #{owned}#$pro##\nПоднятый напарник получит на #{skill_color}#30%## больше здоровья.",

				--Quick Fix
				["menu_tea_time_beta_sc"] = "Скорая помощь",
				["menu_tea_time_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает скорость установки Аптечек первой помощи и Медицинских сумок на #{skill_color}#50%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nНапарники, которые воспользовались вашими аптечками первой помощи, будут получать на #{skill_color}#50%## меньше урона в течение #{skill_color}#5## секунд.",

				--Pain Killers
				["menu_fast_learner_beta_sc"] = "Обезбол",
				["menu_fast_learner_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nНапарники, поднятые вами, получают на #{skill_color}#25%## меньше урона в течение #{skill_color}#5## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nУрон уменьшен ещё на #{skill_color}#25%.##",

				--Uppers
				["menu_tea_cookies_beta_sc"] = "Колеса",
				["menu_tea_cookies_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#3## дополнительных Аптечки первой помощи.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете ещё #{skill_color}#3## Аптечки первых помощи.\n\nВаши Аптечки первой помощи используются автоматически, если игрок упадёт в радиусе #{skill_color}#5## метров от аптечки.\n\nЭто может произойти только раз в в #{skill_color}#60## секунд, индивидуально для каждого игрока.\n\n#{risk}#Не работает при использовании Лебединой песни.##",

				--Combat Doctor
				["menu_medic_2x_beta_sc"] = "Боевой док",
				["menu_medic_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши медицинские сумки получают #{skill_color}#1## дополнительное использование.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить #{skill_color}#2## Медицинские сумки, а не одну.",

				--Inspire
				["menu_inspire_beta_sc"] = "Мотивация",
				["menu_inspire_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы поднимаете напарников на #{skill_color}#50%## быстрее.\n\nКрик на них повысит их скорость перезарядки и передвижения на #{skill_color}#20%## в течение #{skill_color}#10## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш крик может поднять напарника #{skill_color}#в зоне вашей видимости## на расстоянии не более #{skill_color}#9 метров##. Навык перезаряжается #{skill_color}#90## секунд.",

			--[[   CONTROLLER SUBTREE   ]]--
				--Cable Guy
				["menu_triathlete_beta_sc"] = "Навязанная дружба",
				["menu_triathlete_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы носите на #{skill_color}#3## кабельные стяжки больше.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш шанс поднять стяжку из пачки патронов увеличен на #{skill_color}#30%.##\n\nВы носите ещё на #{skill_color}#3## кабельные стяжки больше.",

				--Clowns are Scary
				["menu_cable_guy_beta_sc"] = "Боязнь клоунов",
				["menu_cable_guy_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГражданские находятся в страхе на #{skill_color}#50%## дольше.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбедительность и дальность вашего запугивания увеличена на #{skill_color}#50%## дольше.",

				--Stockholm Syndrome
				["menu_joker_beta_sc"] = "Стокгольмский синдром",
				["menu_joker_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГражданские и джокеры рядом #{skill_color}#поднимут вас, если вы их позовёте##, а так же дадут вам пачку патронов.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы и ваша команда получаете #{skill_color}#+1## сопротивление урону за каждого заложника, до #{skill_color}#4## заложников.\n\n#{risk}#Эффекты от двух и более игроков не складываются.##",

				--Joker
				["menu_stockholm_syndrome_beta_sc"] = "Джокер",
				["menu_stockholm_syndrome_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете переманить обычного врага на вашу сторону. Для этого враг должен сдаться. Вы можете перевести только одного врага на свою сторону. Навык работает только после поднятия тревоги.\n\nВраг, сражающийся на вашей стороне, получает на #{skill_color}#60%## меньше урона.\n\nВраги на вашей стороне считаются за заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь вы можете перевести на свою сторону до #{skill_color}#2## врагов одновременно.\n\nВраг, сражающийся на вашей стороне, получает ещё на #{skill_color}#20%## меньше урона.",

				--Partners in Crime
				["menu_control_freak_beta_sc"] = "Сообщник",
				["menu_control_freak_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждый заложник увеличивает вашу скорость передвижения на #{skill_color}#3%##. Эффект распространяется только на #{skill_color}#4## заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nКаждый заложник увеличивает ваше здоровье на #{skill_color}#5%##. Эффект распространяется только на #{skill_color}#4## заложников.",

				--Hostage Taker
				["menu_black_marketeer_beta_sc"] = "Похититель",
				["menu_black_marketeer_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы восстанавливаете #{skill_color}#1## здоровье каждые #{skill_color}#4## секунды за каждого заложника, вплоть до #{skill_color}#4## заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши заложники #{skill_color}#не будут убегать## после освобождения.\n\nЕсли вы попадёте под стражу, ваши заложники самостоятельно обменяют себя на вас. Это может произойти во время штурма, но только #{skill_color}#1## раз за ограбление.\n\nРегенерация здоровья от навыка увеличена на #{skill_color}#50%## когда у вас #{skill_color}#4## или более заложника.",

			--[[   ASSAULT SUBTREE   ]]--
				--Leadership
				["menu_stable_shot_beta_sc"] = "Лидерство",
				["menu_stable_shot_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПистолеты-пулемёты и пулемёты получают #{skill_color}#2## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nСтабильность у любого оружия у вас и вашей команды увеличена на #{skill_color}#2.##",

				--MG Handling
				["menu_scavenger_sc"] = "Пулеметная хватка",
				["menu_scavenger_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает точность стрельбы от бедра пистолетов-пулемётов и пулемётов на #{skill_color}#20%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает точность стрельбы от бедра пистолетов-пулемётов и пулемётов ещё на #{skill_color}#30%.##\n\nВы перезаряжаете пистолеты-пулемёты и пулемёты на #{skill_color}#25%## быстрее.",

				--MG Specialist
				["menu_sharpshooter_sc"] = "Пулеметчик",
				["menu_sharpshooter_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШтраф точности при стрельбе во время движения уменьшен на #{skill_color}#60%## для пистолетов-пулемётов и пулемётов.\n\nУменьшение штрафа на точность зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nПистолеты-пулемёты и пулемёты стреляют на #{skill_color}#15%## быстрее.\n\nКаждая #{skill_color}#5-ая## пуля, выпущенная из пистолета-пулемёта и пулемёта при продолжительной стрельбе, не будет потрачена.",

				--Shock and Awe
				["menu_spotter_teamwork_beta_sc"] = "Шок и трепет",
				["menu_spotter_teamwork_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nРазмеры магазинов вашего оружия увеличены на #{skill_color}#20%.##\n\n#{risk}#Не работает на арбалеты, луки, гранатомёты и ракетомёты.##\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь вы можете стрелять от бедра во время бега и не имеете задержки на стрельбу после бега.\n\nРазмеры магазинов вашего оружия увеличены ещё на #{skill_color}#30%.##",

				--Heavy Impact
				["menu_speedy_reload_sc"] = "Нокаутирующие пули",
				["menu_speedy_reload_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПистолеты-пулемёты и пулемёты получают #{skill_color}#20%## шанс сбить врага с ног.\n\nПри использования сошек, шанс повышается до #{skill_color}#40%##.\n\n#{risk}#Навык не действует на  капитанов, снайперов, бульдозеров и щитов.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете на #{skill_color}#12.5%## меньше урона в приседе.\n\nЭтот эффект повышается до #{skill_color}#25%## при использовании сошек.",

				--Body Expertise
				["menu_body_expertise_beta_sc"] = "Хирургическая точность",
				["menu_body_expertise_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши пули теперь #{skill_color}#пробивают броню.##\n\nПистолеты-пулемёты и пулемёты в автоматическом режиме наносят #{skill_color}#30%## от множителя попадания в голову по телу.\n\n#{risk}#Не работает на бульдозеров.##\n\nПИКОВЫЙ: #{owned}#$pro##\nЛюбое оружие в автоматическом режиме наносит по телу #{skill_color}#60%## множителя от попадания в голову.",


		--[[   ENFORCER   ]]--

			--[[   SHOTGUNNER SUBTREE   ]]--
				--Underdog--
				["menu_underdog_beta_sc"] = "Шестерка",
				["menu_underdog_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда 3 или более врага находятся в #{skill_color}#18## метрах от вас, вы получаете #{skill_color}#10%## бонус к урону на #{skill_color}#7## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nКогда 3 или более врага находятся в #{skill_color}#18## метрах от вас, вы также получаете на #{skill_color}#10%## меньше урона в течении #{skill_color}#7## секунд.",

				--Shotgun CQB
				["menu_shotgun_cqb_beta_sc"] = "Гладкоствольное искусство",
				["menu_shotgun_cqb_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы прицеливаетесь из дробовиков и огнемётов на #{skill_color}#15%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nДробовики и огнемёты перезаряжаются на #{skill_color}#25%## быстрее.",

				--Shotgun Impact
				["menu_shotgun_impact_beta_sc"] = "Ружьевой импульс",
				["menu_shotgun_impact_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nДробовики и огнемёты получают #{skill_color}#2## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nДробовики получают #{skill_color}#3## дополнительные дробинки.\n\n#{risk}#Не работает на бронебойные и разрывные пули.##",

				--Pigeon Shooting
				["menu_far_away_beta_sc"] = "Охотник на голубей",
				["menu_far_away_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы передвигаетесь на #{skill_color}#60%## быстрее при прицеливании.\n\n#{risk}#Скорость не может превышать вашу максимальную.##\n\nПИКОВЫЙ: #{owned}#$pro##\nТочность и дальнобойность дробовиков и огнеметов увеличена на #{skill_color}#30%## при прицеливании.",

				--Gung Ho
				["menu_close_by_beta_sc"] = "Гунг Хо",
				["menu_close_by_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете стрелять из дробовиков и огнемётов от бедра во время бега и не имеете задержки на стрельбу после бега.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаша скорострельность увеличена на #{skill_color}#35%## при стрельбе от бедра из дробовиков и огнемётов.",

				--Overkill
				["menu_overkill_sc"] = "OVERKILL",
				["menu_overkill_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПосле убийства из дробовика, огнемёта или пилы OVE9000, они получают #{skill_color}#50%## бонус к урону на #{skill_color}#2## секунды.\n\nПИКОВЫЙ: #{owned}#$pro##\nБонус к урону теперь работает на всё оружие и действует #{skill_color}#10## секунд. Навык должен быть активирован убийством из дробовика, огнемёта или пилы OVE9000.\n\n#{risk}#Бонус не работает на гранатомёты.##\n\nВы убираете и достаёте дробовики и пилу на #{skill_color}#50%## быстрее.",

			--[[   JUGGERNAUT SUBTREE   ]]--
				--Stun Resistance--
				["menu_oppressor_beta_sc"] = "Несокрушимый",
				["menu_oppressor_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВражеские удары в ближнем бою отталкивают на #{skill_color}#0.25%## меньше за каждое очко брони.\n\nПИКОВЫЙ: #{owned}#$pro##\nУменьшает ослепление от светошумовых гранат на #{skill_color}#50%.##",

				--Die Hard
				["menu_show_of_force_sc"] = "Крепкий орешек",
				["menu_show_of_force_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#5%## устойчивости.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных #{skill_color}#$deflection## и накладывается после всех остальных бонусов.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете ещё #{skill_color}#5%## устойчивости.",

				--Transporter
				["menu_pack_mule_beta_sc"] = "Перевозчик",
				["menu_transporter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЗа каждые #{skill_color}#10## очков брони штраф на передвижение с сумкой уменьшается на #{skill_color}#0.5%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно бегать с любой сумкой.\n\n#{risk}#Штраф на скорость передвижения с сумкой остаётся.##",

				--More Blood to Bleed--
				["menu_iron_man_beta_sc"] = "Больше крови",
				["menu_iron_man_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#10%## больше здоровья.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете ещё на #{skill_color}#15%## больше здоровья.",

				--Bullseye--
				["menu_prison_wife_beta_sc"] = "В яблочко",
				["menu_prison_wife_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПопадания в голову восстанавливают #{skill_color}#5## брони раз в #{skill_color}#5## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nПопадания в голову восстанавливают ещё #{skill_color}#30## брони каждые #{skill_color}#5## секунд.",

				--Iron Man
				["menu_juggernaut_beta_sc"] = "Железный человек",
				["menu_juggernaut_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nОткрывает возможность носить Улучшенный комбинированный тактический бронежилет.\n\nПИКОВЫЙ: #{owned}#$pro##\nПри ударе Щитов оружием ближнего боя, они отбрасываются от вашей силы.\n\nОгнестрельное оружие получает шанс отбросить Щиты. Шанс отбрасывания зависит от урона оружия.\n\nВаша броня восстанавливается на #{skill_color}#10%## быстрее.",

			--[[   SUPPORT SUBTREE   ]]--
				--Scavenger
				["menu_scavenging_sc"] = "Мародер",
				["menu_scavenging_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает расстояние подбора патронов на #{skill_color}#50%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nС каждого #{skill_color}#5-го## убитого противника выпадет дополнительная коробка патронов.",

				--Bulletstorm--
				["menu_ammo_reservoir_beta_sc"] = "Свинцовый ливень",
				["menu_ammo_reservoir_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСумки с патронами дают возможность стрелять бесконечно до #{skill_color}#5## секунд после использования сумки.\n\nЧем больше патронов восстановлено, тем дольше будет эффект.\n\n#{risk}#Гранатомёты, ракетомёты и прочее взрывчатое оружие не получают эффекта.##\n\nПИКОВЫЙ: #{owned}#$pro##\nДлительность способности увеличена до #{skill_color}#15## секунд.",

				--Specialist Equipment formally Rip and Tear
				["menu_portable_saw_beta_sc"] = "Спецоборудование",
				["menu_portable_saw_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает прочность пилы OVE9000 на #{skill_color}#50%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nПилы, арбалеты, луки, гранатомёты и ракетомёты перезаряжаются на #{skill_color}#25%## быстрее.",

				--Extra Lead
				["menu_ammo_2x_beta_sc"] = "Больше свинца",
				["menu_ammo_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждая сумка с патронами даёт на #{skill_color}#200%## больше патронов.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить #{skill_color}#2## сумки с патронами вместо одной.",

				--Rip and Tear formally Carbon Blade
				["menu_carbon_blade_beta_sc"] = "Рвать и метать",
				["menu_carbon_blade_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПила OVE9000 теперь распиливает щиты.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийства пилой, арбалетами, луками, гранатомётами и ракетомётами имеют #{skill_color}#50%## шанс посеять панику среди врагов на расстоянии #{skill_color}#10## метров.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.",

				--Fully Loaded--
				["menu_bandoliers_beta_sc"] = "Вооружен до зубов",
				["menu_bandoliers_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаш общий запас патронов увеличен на #{skill_color}#25%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы подбираете на #{skill_color}#50%## больше патронов из коробочек.\n\nВаш шанс получить метательное оружие из коробочки патронов увеличено на #{skill_color}#5%##; шанс увеличивается ещё на #{skill_color}#1%## за каждый подбор. Шанс обнуляется, когда вы получаете метательное оружие из коробочки.\n\n#{risk}#Не работает на метательное оружие из перков.##",

		--[[   TECHNICIAN   ]]--

			--[[   FORTRESS SUBTREE   ]]--
				--Logistician
				["menu_defense_up_beta_sc"] = "Логист",
				["menu_defense_up_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы взаимодействуете с оборудованием на #{skill_color}#25%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы и ваша команда взаимодействуете и ставите оборудование на #{skill_color}#50%## быстрее.",
	
				--Nerves of Steel--
				["menu_fast_fire_beta_sc"] = "Стальные нервы",
				["menu_fast_fire_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете возможность #{skill_color}#прицеливаться во время падения.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете на #{skill_color}#50%## меньше урона во время любого взаимодействия.",
	
				--Engineering
				["menu_eco_sentry_beta_sc"] = "Инженер",
				["menu_eco_sentry_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши турели наносят на #{skill_color}#40%## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши турели получают на #{skill_color}#60%## больше здоровья.",
	
				--Jack of all Trades
				["menu_jack_of_all_trades_beta_sc"] = "Мастер на все руки",
				["menu_jack_of_all_trades_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы носите на #{skill_color}#50%## больше метательного оружия.\n\nПИКОВЫЙ: #{owned}#$pro##\n##Вы можете носить с собой второе оборудование.## Нажмите клавишу #{skill_color}#$BTN_CHANGE_EQ## чтобы переключиться на другое оборудование.\n\nВторое оборудование содержит на #{important_1}#50%## меньше использований, минимум - #{skill_color}#1.##",
	
				--Sentry Tower Defense--
				["menu_tower_defense_beta_sc"] = "Круговая оборона",
				["menu_tower_defense_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно использовать бронебойные патроны на турелях, которые уменьшают их скорострельность на #{skill_color}#66%## и позволяют им пробивать врагов и щиты.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете ставить #{skill_color}#2## турели.\n\nТурели теперь стоят #{skill_color}#35%## вашего боезапаса.",
	
				--Bulletproof--
				["menu_iron_man_sc"] = "Пуленепробиваемый",
				["menu_iron_man_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВашу броню теперь нельзя прошить.\n\nУвеличивает броню Противоосколочного жилета и Комбинированного тактического жилета на #{skill_color}#20.##\n\nПИКОВЫЙ: #{owned}#$pro##\nПока ваша броня полностью заполнена, любой полученный урон уменьшится на число, равное #{skill_color}#15%## от вашей максимальной брони.\n\nВаша броня восстанавливается на #{skill_color}#15%## быстрее.",

			--[[   BREACHER SUBTREE   ]]--
				--Silent Drilling--
				["menu_hardware_expert_beta_sc"] = "Бесшумная дрель",
				["menu_hardware_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши #{skill_color}#дрели и пилы теперь бесшумны##. Гражданским и охранникам нужно увидеть дрель или пилу, чтобы поднять тревогу.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы чините дрели и пилы на #{skill_color}#50%## быстрее.",
	
				--Demoman
				["menu_trip_mine_expert_beta_sc"] = "Подрывник",
				["menu_combat_engineering_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно ставить до #{skill_color}#6## кумулятивных зарядов.\n\nВы ставите кумулятивные заряды и мины на #{skill_color}#25%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить до #{skill_color}#8## кумулятивных зарядов.\n\nРадиус взрыва ваших мин увеличен на #{skill_color}#30%.##",
	
				--Drill Sawgeant
				["menu_drill_expert_beta_sc"] = "Бурный взлом",
				["menu_drill_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЭффективность вашей дрели и пилы увеличена на #{skill_color}#10%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nЭффективность вашей дрели и пилы увеличена ещё на #{skill_color}#20%.##",
	
				--Fire Trap--
				["menu_more_fire_power_sc"] = "Зажигательная ловушка",
				["menu_more_fire_power_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши мины оставляют на месте взрыва огненную лужу в течение #{skill_color}#10## секунд в радиусе #{skill_color}#7.5## метров.\n\nОгонь не наносит урона вам и команде.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно носить #{skill_color}#10## мин.\n\nВаши мины наносят на #{skill_color}#50%## больше урона.",
	
				--Expert Hardware
				["menu_kick_starter_beta_sc"] = "Техэксперт",
				["menu_kick_starter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши дрели и пилы получают #{skill_color}#10%## шанс на автоматическую починку.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши дрели и пилы получают ещё #{skill_color}#15%## к шансу на автоматическую починку.\n\nВраги, которые пытаются сломать вашу дрель, имеют #{skill_color}#50%## шанс получить электроразряд, останавливая их попытку.",
	
				--Kickstarter
				["menu_fire_trap_beta_sc"] = "С толкача",
				["menu_fire_trap_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете возможность чинить дрель ударом холодного оружия.\n\nУ вас #{skill_color}#1## попытка на каждую поломку с шансом #{skill_color}#75%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы #{skill_color}#больше не убираете оружие при взаимодействии.##\n\nВы можете оглядываться, приседать, двигаться, целиться и использовать оружие, пока держите кнопку и остаётесь в зоне взаимодействия.",

			--[[   COMBAT ENGINEER SUBTREE   ]]--
				--Sharpshooter--
				["menu_discipline_sc"] = "Меткий стрелок",
				["menu_discipline_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВинтовки получают #{skill_color}#2## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийства в голову из винтовок в режиме одиночной стрельбы или очередями увеличивают вашу скорострельность на #{skill_color}#20%## в течение #{skill_color}#10## секунд.",

				--Rifleman
				["menu_rifleman_sc"] = "Пехотинец",
				["menu_rifleman_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВинтовки получают на #{skill_color}#15%## больше точности и дальнобойности во время прицеливания.\n\nПИКОВЫЙ: #{owned}#$pro##\nВинтовки получают ещё на #{skill_color}#15%## больше точности и дальнобойности во время прицеливания.",

				--Kilmer--
				["menu_heavy_impact_beta_sc"] = "Килмер",
				["menu_heavy_impact_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШтраф на точность во время передвижения для винтовок уменьшен на #{skill_color}#60%##.\n\nШтраф на точность во время передвижения зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nВинтовки перезаряжаются на #{skill_color}#25%## быстрее.",

				--Ammo Efficiency--
				["menu_single_shot_ammo_return_sc"] = "Эффективный расход",
				["menu_single_shot_ammo_return_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#3## убийства в голову из винтовок в течение #{skill_color}#8## секунд восстановят #{skill_color}#1## патрон или #{skill_color}#3%## от вашего боезапаса.\n\nПИКОВЫЙ: #{owned}#$pro##\nНавык теперь срабатывает после #{skill_color}#2## убийств в голову, а патроны возвращаются прямо в магазин.",

				--Aggressive Reload
				["menu_engineering_beta_sc"] = "Агрессивная перезарядка",
				["menu_engineering_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУбийства в голову из винтовок в режиме одиночной стрельбы или очередями увеличивают скорость перезарядки на #{skill_color}#25%## в течение #{skill_color}#10## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nБонус к скорости перезарядки увеличен на #{skill_color}#50%## и может быть получен в любом режиме стрельбы.",

				--Mind Blown, formerly Explosive Headshot--
				["menu_kilmer_sc"] = "Взрыв мозга",
				["menu_kilmer_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПопадания в голову из винтовок в режиме одиночной стрельбы или очередями наносят #{skill_color}#70%## урона ближайшему врагу в радиусе #{skill_color}#4## метров.\n\nЗа каждые #{skill_color}#7## метров, в которых вы находитесь от врага, эффект перебрасывается на ещё одного врага, до #{skill_color}#4## раз.\n\nПИКОВЫЙ: #{owned}#$pro##\nПопадания в голову из винтовок в режиме одиночной стрельбы или очередями #{skill_color}#не теряют урон с расстоянием.## Радиус навыка увеличен на #{skill_color}#1## метр.\n\nЗа каждые #{skill_color}#7## метров от врага, эффект наносит дополнительные #{skill_color}#10%## урона; вплоть до #{skill_color}#110%## урона.",

		--[[   GHOST   ]]--

			--[[   SHINOBI SUBTREE   ]]--
				--Alert--
				["menu_jail_workout_sc"] = "Меченный",
				["menu_jail_workout_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВраги остаются помеченными на #{skill_color}#100%## дольше.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно #{skill_color}#автоматически помечать## охранников и особых врагов в #{skill_color}#40## метрах от вас с помощью прицеливания.\n\n#{risk}#Охранники помечаются только до тревоги.##",

				--Sixth Sense--
				["menu_chameleon_beta_sc"] = "Шестое чувство",
				["menu_chameleon_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы #{skill_color}#автоматически помечаете## всех врагов в радиусе #{skill_color}#10## метров, если стоите на месте в течение #{skill_color}#3.5## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#доступ ко всем инсайдерским активам.##",

				--ECM Overdrive--
				["menu_cleaner_beta_sc"] = "Электронный взломщик",
				["menu_cleaner_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГенератор помех теперь #{skill_color}#может открывать некоторые электронные двери.##\n\nПИКОВЫЙ: #{owned}#$pro##\nДлительность генератора помех увеличена на #{skill_color}#25%.##\n\n##Пейджеры теперь удерживаются помехами.##",

				--Nimble--
				["menu_second_chances_beta_sc"] = "Ловкач",
				["menu_second_chances_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно #{skill_color}#бесшумно взламывать сейфы вручную.##\n\nВы взаимодействуете со всеми компьютерами, камерами и генераторами помех на #{skill_color}#30%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы взламываете все замки на #{skill_color}#50%## быстрее.\n\nВы взаимодействуете со всеми компьютерами, камерами и генераторами помех ещё на #{skill_color}#50%## быстрее.",

				--ECM Specialist--
				["menu_ecm_booster_beta_sc"] = "Специалист по помехам",
				["menu_ecm_booster_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно носить #{skill_color}#3## Генератора помех.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно носить #{skill_color}#4## Генератора помех.",

				--Spotter--
				["menu_ecm_2x_beta_sc"] = "На шухере",
				["menu_ecm_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВраги, отмеченные вам, получают на #{skill_color}#25%## больше урона на расстоянии дальше #{skill_color}#20## метров.\n\nПИКОВЫЙ: #{owned}#$pro##\nВраги, отмеченные вами, получают на #{skill_color}#35%## больше урона с любого расстояния, от любого оружия.",

			--[[   ARTFUL DODGER SUBTREE   ]]--
				--Duck and Cover--
				["menu_sprinter_beta_sc"] = "Пригнись и накройся",
				["menu_sprinter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСтамина восстанавливается на #{skill_color}#25%## раньше и на #{skill_color}#25%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш уворот заполняется на #{skill_color}#6%## за каждую секунду в приседе.\n\nВы двигаетесь на #{skill_color}#10%## быстрее в приседе.",

				--Evasion--
				["menu_awareness_beta_sc"] = "Изворотливый",
				["menu_awareness_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы двигаетесь на #{skill_color}#5%## быстрее.\n\nУрон от падений с высоты уменьшен на #{skill_color}#75%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете перезаряжаться во время бега.\n\nЧтобы отменять перезарядку при помощи кнопки бега, включите соответствующую опцию в настройках Restoration Mod.",

				--Deep Pockets--
				["menu_thick_skin_beta_sc"] = "Широкие карманы",
				["menu_thick_skin_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает скрытность оружия ближнего боя на #{skill_color}#2.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает скрытность баллистических жилетов на #{skill_color}#4##, а всей остальной брони на #{skill_color}#2.##\n\nУвеличивает броню баллистических жилетов и костюма на #{skill_color}#20.##",

				--Moving Target--
				["menu_dire_need_beta_sc"] = "Подвижная мишень",
				["menu_dire_need_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы двигаетесь на #{skill_color}#1.5%## быстрее за каждые #{skill_color}#3## очка скрытности ниже #{skill_color}#35##, до максимальных #{skill_color}#15%## скорости.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы двигаетесь на #{skill_color}#1.5%## быстрее за каждое #{skill_color}#1## очко скрытности ниже #{skill_color}#35##, до максимальных #{skill_color}#15%## скорости.\n\nВаш уворот заполняется на #{skill_color}#12%## за каждую секунду бега и на #{skill_color}#30%## за каждую секунду на зиплайне.",

				--Shockproof
				["menu_insulation_beta_sc"] = "Заземленный",
				["menu_insulation_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШоковая атака Тазера имеет #{skill_color}#15%## шанс отскочить от вас, оглушая Тазера.\n\nПИКОВЫЙ: #{owned}#$pro##\nВзаимодействие с вражеским Тазером в течение #{skill_color}#2## секунд после шоковой атаки контр-атакует его, нанося #{skill_color}#50%## урона его здоровью.",

				--Sneaky Bastard--
				["menu_jail_diet_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#1## очко уворота за каждые #{skill_color}#3## очка скрытности ниже #{skill_color}#35## до максимальных #{skill_color}#10## уворота.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#1## очко уворота за каждое #{skill_color}#1## очко скрытности ниже #{skill_color}#35## до максимальных #{skill_color}#10## уворота.\n\nКогда ваша броня ломается, уворот от атаки восстанавливает #{skill_color}#2%## вашего здоровья. Это может произойти только один раз, пока ваша броня снова не сломается.",

			--[[   SILENT KILLER SUBTREE   ]]--
				--Second Wind
				["menu_scavenger_beta_sc"] = "Второе дыхание",
				["menu_scavenger_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда ваша броня ломается, ваша скорость увеличивается на #{skill_color}#10%## на #{skill_color}#3## секунды.\n\nПИКОВЫЙ: #{owned}#$pro##\nКогда ваша броня полностью опустошена, первый выстрел оглушит противника.\n\nЭтот эффект остаётся на #{skill_color}#3## секунды после регенерации брони.",

				--Optical Illusions--
				["menu_optic_illusions_sc"] = "Оптические иллюзии",
				["menu_optic_illusions_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы достаёте и прячете оружие на #{skill_color}#15%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nСкрытность всего оружия увеличена на #{skill_color}#2.##",

				--The Professional--
				["menu_silence_expert_beta_sc"] = "Профессионал",
				["menu_silence_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы прицеливаетесь на #{skill_color}#5%## быстрее, а ваша задержка после бега уменьшена на #{skill_color}#5%##.\n\nПИКОВЫЙ: #{owned}#$pro##\nБонусы на прицеливание и задержку после бега увеличены ещё на #{skill_color}#10%## быстрее.\n\nУбийство особых врагов огнестрельным оружием предоставляет дополнительную пачку патронов.",

				--Unseen Strike, formally Dire Need--
				["menu_backstab_beta_sc"] = "Удар исподтишка",
				["menu_backstab_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЕсли вам не наносится урон в течение #{skill_color}#3## секунд, вы получите #{skill_color}#15%## шанс критического попадания, пока по вам не нанесут урон.\n\nКритические попадания наносят на #{skill_color}#50%## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nКритический шанс теперь остаётся на #{skill_color}#4## секунды после получения урона.",

				--Cleaner--
				["menu_hitman_beta_sc"] = "Чистильщик",
				["menu_hitman_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы наносите на #{skill_color}#10%## больше урона по особым врагам.\n\n#{risk}#Не действует на ракетомёты и гранатомёты.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийство врага сзади заполняет ваш уворот на #{skill_color}#75%##.\n\nВы наносите ещё на #{skill_color}#15%## больше урона по особым врагам.",

				--Low Blow--
				["menu_unseen_strike_beta_sc"] = "Подлый прием",
				["menu_unseen_strike_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#3%## шанс критического попадания за каждые #{skill_color}#3## очка скрытности ниже #{skill_color}#35##, до максимального шанса #{skill_color}#30%.##\n\nКритические попадания наносят на #{skill_color}#50%## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#3%## шанс критического попадания за каждое #{skill_color}#1## очко скрытности ниже #{skill_color}#35##, до максимального шанса #{skill_color}#30%.##\n\nВаш шанс критического попадания увеличивается на #{skill_color}#50%## при атаках сзади.",

		--[[   FUGITIVE   ]]--

			--[[   GUNSLINGER SUBTREE   ]]--
				--Equilibrium--
				["menu_equilibrium_beta_sc"] = "Эквилибриум",
				["menu_equilibrium_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСтабильность пистолетов для вас и вашей команды увеличена на #{skill_color}#2.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы достаёте и прячете пистолеты на #{skill_color}#100%## быстрее.",

				--Gun Nut--
				["menu_dance_instructor_sc"] = "Пистолетный маньяк",
				["menu_dance_instructor_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУменьшает разлёт пуль при стрельбе от бедра из пистолетов на #{skill_color}#20%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nПистолеты стреляют на #{skill_color}#15%## быстрее.\n\nПистолеты #{skill_color}#пробивают броню.##",

				--Over Pressurized/Gunfighter--
				["menu_gun_fighter_sc"] = "Ковбой",
				["menu_gun_fighter_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПистолеты перезаряжаются на #{skill_color}#5%## быстрее.\n\nШтраф к точности при стрельбе во время движения уменьшен на #{skill_color}#40%## для пистолетов.\n\nУменьшение штрафа на точность зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nПистолеты перезаряжаются ещё на #{skill_color}#25%## быстрее.",

				--Akimbo--
				["menu_akimbo_skill_sc"] = "Акимбо",
				["menu_akimbo_skill_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПарное оружие получает #{skill_color}#10## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nПарное оружие получает на #{skill_color}#25%## больше запаса и подбора патронов.",

				--Desperado--
				["menu_expert_handling_sc"] = "Отчаянный",
				["menu_expert_handling_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждое убийство в голову из пистолета даёт #{skill_color}#8%## бонус к точности и дальнобойности на #{skill_color}#4## секунды. Этот эффект накладывается до #{skill_color}#5## раз, а длительность обновляется при каждом выстреле в голову.\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает длительность бонуса к точности и дальнобойности до #{skill_color}#10## секунд.",

				--Trigger Happy--
				["menu_trigger_happy_beta_sc"] = "Неудержимый стрелок",
				["menu_trigger_happy_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждый выстрел в голову из пистолета даёт дополнительные #{skill_color}#10%## урона на #{skill_color}#4## секунды. Этот эффект накладывается до #{skill_color}#5## раз, а длительность обновляется при каждом выстреле в голову.\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает длительность бонуса к урону до #{skill_color}#10## секунд.",

			--[[   REVENANT SUBTREE   ]]--
				--Running From Death--
				["menu_nine_lives_beta_sc"] = "Бегущий от смерти",
				["menu_nine_lives_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы передвигаетесь на #{skill_color}#25%## быстрее в течение #{skill_color}#10## секунд после поднятия.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#20%## сопротивления урону на #{skill_color}#10## секунд после поднятия.\n\nВаше оружие автоматически перезаряжается после поднятия.",

				--Undying--
				["menu_running_from_death_beta_sc"] = "Неумирающий",
				["menu_running_from_death_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#100%## больше здоровья при падении.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете ещё #{skill_color}#100%## здоровья при падении.\n\nВы можете использовать основное оружие при падении.",

				--What Doesn't Kill You Only Makes You Stronger--
				["menu_what_doesnt_kill_beta_sc"] = "Что тебя не убивает",
				["menu_what_doesnt_kill_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПолучаемый урон уменьшается на #{skill_color}#1## очко за каждое падение, которое приближает вас к аресту. \n\nПИКОВЫЙ: #{owned}#$pro##\nПолучаемый урон всегда уменьшается на #{skill_color}#3## очка.",

				--Swan Song
				["menu_perseverance_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда ваше здоровье опускается до #{skill_color}#0##, вы не мгновенно падаете, а можете сражаться ещё #{skill_color}#3## секунды с #{skill_color}#60%## штрафом на скорость.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете сражаться ещё на #{skill_color}#6## секунд дольше.",

				--Haunt--
				["menu_haunt_sc"] = "Пугало",
				["menu_haunt_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУбийство врагов ближе #{skill_color}#18## метров имеет #{skill_color}#5%## шанс посеять панику за каждое падение, которое приближает вас к аресту.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nПИКОВЫЙ: #{owned}#$pro##\nШанс паники всегда увеличен на #{skill_color}#15%##.",

				--Messiah--
				["menu_pistol_beta_messiah_sc"] = "Мессия",
				["menu_pistol_beta_messiah_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПри падении, убийство врага позволит вам встать самостоятельно. У вас есть только #{skill_color}#1## шанс сделать это, который восстановится при выходе из под ареста.\n\nВы можете упасть ещё #{skill_color}#1## раз прежде чем попадёте под арест.\n\nПИКОВЫЙ: #{owned}#$pro##\nМессию теперь можно использовать сколько угодно раз, но с задержкой в #{skill_color}#120## секунд. Убийства во время падения уменьшают задержку на #{skill_color}#10## секунд.",

			--[[   BRAWLER SUBTREE   ]]--
				--Martial Arts--
				["menu_martial_arts_beta_sc"] = "Боевые искусства",
				["menu_martial_arts_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#50%## меньше урона от всех атак в ближнем бою (из-за тренировок).\n\nПИКОВЫЙ: #{owned}#$pro##\nВы на #{skill_color}#100%## сильнее оглушаете врагов в ближнем бою (из-за тренировок).",

				--Counter-Strike--
				["menu_drop_soap_beta_sc"] = "Контр-удар",
				["menu_drop_soap_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете парировать ближние атаки Клокеров при помощи холодного оружия. Это столкнёт их на землю.\n\nВы получаете на #{skill_color}#20%## меньше урона от ударов Клокеров и атак Тазеров.\n\nПИКОВЫЙ: #{owned}#$pro##\nДальнобойный урон по вам уменьшен на #{skill_color}#10%## когда вы достаёте оружие ближнего боя.\n\nВы получаете ещё на #{skill_color}#30%## меньше урона от ударов Клокеров и атак Тазеров.",

				--Pumping Iron--
				["menu_steroids_beta_sc"] = "Накачанный",
				["menu_steroids_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы атакуете и замахиваетесь оружием ближнего боя на #{skill_color}#20%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы атакуете и замахиваетесь оружием ближнего боя ещё на #{skill_color}#30%## быстрее.",

				--Bloodthirst--
				["menu_bloodthirst_sc"] = "Кровожадность",
				["menu_bloodthirst_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда вы убиваете врага в ближнем бою, вы получаете #{skill_color}#25%## бонус к скорости перезарядки на #{skill_color}#10## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nКаждое убйиство увеличивает урон следующей атаки в ближнем бою на #{skill_color}#25%##, до максимальных #{skill_color}#100%.##\n\nЭтот эффект обнуляется, когда вы наносите удар в ближнем бою.",

				--Frenzy--
				["menu_wolverine_beta_sc"] = "Неистовый",
				["menu_wolverine_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЧем больше у вас здоровья, тем меньше вы восстанавливаете здоровья, до #{important_1}#30%## лечения.\n\nЧем меньше у вас здоровья, тем больше у вас устойчивости, до #{skill_color}#20%##.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных #{skill_color}#$deflection## и накладывается после всех остальных бонусов.\n\nПИКОВЫЙ: #{owned}#$pro##\nЛечение уменьшается до #{important_1}#75%##, а устойчивость увеличивается до #{skill_color}#50%.##",

				--Berserker--
				["menu_frenzy_sc"] = "Берсерк",
				["menu_frenzy_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье ниже #{skill_color}#100%##, вы будете наносить до #{skill_color}#100%## дополнительного урона пилой и оружием ближнего боя.\n\nПИКОВЫЙ: #{owned}#$pro##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье ниже #{skill_color}#100%##, вы будете наносить до #{skill_color}#50%## дополнительного урона огнестрельным оружием.\n\n#{risk}#Не работает на гранатомёты и ракетомёты.##"

	})

	-- local butt = math.rand(1)
	-- local frame = 0.01
	-- if butt <= frame then
		-- LocalizationManager:add_localized_strings({	
			-- ["menu_difficulty_sm_wish"] = "The Steel Path",
			-- ["menu_risk_sm_wish"] = "The Steel Path. For those who have mastered THE CONCLAVE and wish to seek a challenge."
		-- })
	-- end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Уворот",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Увеличивает урон в голову на ##25%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_4_desc_sc"] = "Вы получаете ##+1## к скрытности.\n\nПри ношении брони ваша скорость штрафуется на ##15%## меньше.\n\nВы получаете на ##45%## больше опыта при выполнении ограблений.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_6_desc_sc"] = "Открывает Кейс с метательным оружием в качестве оборудования. Кейс с метательным оружием используется, чтобы восполнить запас метательного оружия во время ограбления.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",
		["menu_deckall_8_desc_sc"] = "Увеличивает скорость взаимодействия с сумкой с медикаментами на ##20%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатомётам и ракетомётам.",

		--Crook--
		["menu_st_spec_6_desc_sc"] = "Аферист - специалист во многих областях. Это слово так же старо, как и первое в мире преступление.\n\nПодмастерье всех дел и мастер ни одного. Он ворует, наживается на обмане и выполняет любую нечистую и незаконную работу.\n\n\n\n\nБонусы полной колоды:\n##-##Ваш уворот увеличен на ##5## очков.\n##-##Ваш уворот увеличен ещё на ##10## при ношении баллистических жилетов.\n##-##Ваша броня увеличена на ##50%## при ношении баллистических жилетов.\n##-##Вы взламываете замки на ##20%## быстрее.",
		["menu_st_spec_6_desc_sc_short"] = "Аферист - специалист во многих областях. Это слово так же старо, как и первое в мире преступление.\n\nПодмастерье всех дел и мастер ни одного. Он ворует, наживается на обмане и выполняет любую нечистую и незаконную работу.",
		["menu_deck6_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nПри ношении баллистических жилетов, ваша броня увеличена на ##15%##.",
		["menu_deck6_3_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck6_5_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена ещё на ##15%##.\n##-##Вы взламываете замки на ##20%## быстрее.",
		["menu_deck6_7_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck6_9_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена ещё на ##20%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Rogue
		["menu_st_spec_4_desc_sc"] = "Мошенник - скрытный преступник, способный действовать тихо. Известен за гибкость и изворотливость. Его нанимают не только для совершения мелких краж, но и для более масштабных работ.\n\nВизитная карточка мошенника - подвижность. Недостаток в силе он компенсирует опытом.\n\n\n\n\nБонусы полной колоды:\n##-##Ваш уворот увеличен на ##15## очков.\n##-##Вы переключаете оружие на ##30%## быстрее.\n##-##Ваша полоска уворота будет заполнена на ##200%## после поднятия.\n##-##Уворот от атаки восстанавливает ##1## очко здоровья каждые ##2## секунды в течение ##10## секунд. Этот эффект может складываться, но бонус потеряется, если вы получите урон по здоровью.\n\nВы зацикливаете камеры на ##20## секунд дольше.",
		["menu_st_spec_4_desc_sc_short"] = "Мошенник - скрытный преступник, способный действовать тихо. Известен за гибкость и изворотливость. Его нанимают не только для совершения мелких краж, но и для более масштабных работ.\n\nВизитная карточка мошенника - подвижность. Недостаток в силе он компенсирует опытом.",	
		["menu_deck4_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nВы переключаете оружие на ##30%## быстрее.",
		["menu_deck4_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck4_5_desc_sc"] = "Ваша полоска уворота будет заполнена на ##200%## после поднятия.\n\nВы зацикливаете камеры на ##20## секунд дольше.",
		["menu_deck4_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck4_9_desc_sc"] = "Уворот от атаки восстанавливает ##1## очко здоровья каждые ##2## секунды в течение ##10## секунд. Этот эффект может складываться, но бонус потеряется, если вы получите урон по здоровью.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "Ган-фу",
		["menu_deck5_3_sc"] = "Тренированный убийца",
		["menu_deck5_5_sc"] = "Убийство карандашом",
		["menu_deck5_7_sc"] = "Эксперт",

		["menu_st_spec_5_desc_sc"] = "Киллер - профессионал из преступного мира, отлично сражающийся как на дальних, так и на близких дистанциях.\n\nКриминальные синдикаты пользуются услугами киллера как последним аргументом, чтобы показать свою силу, отомстить или расправиться с конкурентами.\n\n\n\n\n\nБонусы полной колоды:\n##-##Убийство врагов огнестрельным оружием добавляет ##25## запасного здоровья. Вы можете получить до ##120## запасного здоровья. Убийство врага оружием ближнего боя превращает запасное здоровье во временное здоровье, которое утекает со скоростью ##5## в секунду. Временное здоровье может превышать ваше максимальное здоровье, но вы не можете иметь больше ##240## временного здоровья за раз.\n##-##Ваша полоска уворота заполняется на ##100%## при восстановлении брони.\n##-##Вы получаете ##5## уворота.\n##-##Вы носите на ##1## мешок для тел больше.\n##-##Пока у вас есть временное здоровье, вы получаете ##10%## устойчивости и ##20%## бонус к скорости передвижения.",
		["menu_st_spec_5_desc_sc_short"] = "Киллер - профессионал из преступного мира, отлично сражающийся как на дальних, так и на близких дистанциях.\n\nКриминальные синдикаты пользуются услугами киллера как последним аргументом, чтобы показать свою силу, отомстить или расправиться с конкурентами.",
		["menu_deck5_1_desc_sc"] = "Убийство врагов огнестрельным оружием добавляет ##25## запасного здоровья. Вы можете получить до ##75## запасного здоровья.\n\nУбийство врага оружием ближнего боя превращает запасное здоровье во временное здоровье, которое утекает со скоростью ##5## в секунду.\n\nВременное здоровье может превышать ваше максимальное здоровье, но вы не можете иметь больше ##240## временного здоровья за раз.",
		["menu_deck5_3_desc_sc"] = "Ваша полоска уворота заполняется на ##100%## при восстановлении брони.\n\nВы получаете ##5## уворота.",
		["menu_deck5_5_desc_sc"] = "Вы можете получить на ##60%## больше запасного здоровья.\n\nВы носите на ##1## мешок для тел больше.",
		["menu_deck5_7_desc_sc"] = "Вы получаете ##120## временного здоровья при поднятии.\n\nВы получаете дополнительные ##5## очков уворота.",
		["menu_deck5_9_desc_sc"] = "Пока у вас есть временное здоровье, вы получаете ##10%## устойчивости и ##20%## бонус к скорости передвижения.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных ##60%## и накладывается после всех остальных бонусов.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Muscle
		["menu_st_spec_2_desc_sc"] = "Силовик - это тот, к кому обращается мафия, когда нужно насилие. Они - основа любой преступной организации.\n\nИх вызывают, если нужно кого-то избить, сломать ноги, проломить череп или просто напомнить, кто здесь босс.\n\n\n\nБонусы полной колоды:\n##-##Вы получаете на ##40%## больше здоровья.\n##-##Вы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.\n##-##Вы можете использовать свое оружие чтобы ##посеять панику среди врагов.\n##-##Ваш уворот увеличен на ##10## очков.##\n##-##Вы получаете на ##25%## больше здоровья после поднятия.",
		["menu_st_spec_2_desc_sc_short"] = "Силовик - это тот, к кому обращается мафия, когда нужно насилие. Они - основа любой преступной организации.\n\nИх вызывают, если нужно кого-то избить, сломать ноги, проломить череп или просто напомнить, кто здесь босс.",
		["menu_deck2_1_desc_sc"] = "Ваше здоровье увеличено на ##10%##.",
		["menu_deck2_3_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck2_5_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_deck2_7_desc_sc"] = "Каждый выстрел из вашего оружия имеет ##5%## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck2_9_desc_sc"] = "Ваше здоровье увеличено ещё на ##10%##.\n\nВы получаете на ##25%## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Crew Chief
		["menu_st_spec_1_desc_sc"] = "Капо, он же капореджиме - глава отряда организованного преступного синдиката. Командует группой бойцов и докладывает напрямую боссу мафии или его заместителю.\n\nЕсли мафии надо с чем-то разобраться - капо и бойцы делают своё дело.\n\n\n\nБонусы полной колоды:\n##-##Вы получаете на ##20%## больше здоровья.\n##-##Расстояние ваших криков увеличено на ##25%##.\n##-##Ваша броня увеличена на ##10%##.\n##-##Выносливость вас и вашей команды увеличена на ##50%##.\n##-##Ваш уворот увеличен на ##10## очков.\n##-##Ваша команда получает на ##5%## больше здоровья.\n##-##Вы отвечаете на пейджеры на ##25%## быстрее.\n##-##Каждый заложник увеличивает здоровье на ##5%## и выносливость на ##10%## для вас и вашей команды, до 4 заложников.",
		["menu_st_spec_1_desc_sc_short"] = "Капо, он же капореджиме - глава отряда организованного преступного синдиката. Командует группой бойцов и докладывает напрямую боссу мафии или его заместителю.\n\nЕсли мафии надо с чем-то разобраться - капо и бойцы делают своё дело.",			
		["menu_deck1_3_desc_sc"] = "Выносливость вас и вашей команды увеличена на ##50%##.\n\nРасстояние ваших криков увеличено на ##25%##.\n\nКомандные бонусы не складываются.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck1_5_desc_sc"] = "Ваше здоровье увеличено на ##10%##.\n\nЗдоровье вашей команды увеличено на ##5%##.\n\nКомандные бонусы не складываются.\n\nВы отвечаете на пейджеры на ##25%## быстрее.",
		["menu_deck1_7_desc_sc"] = "Ваша броня увеличена на ##10%##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck1_9_desc_sc"] = "Каждый заложник увеличивает здоровье на ##5%## и выносливость на ##10%## для вас и вашей команды, до ##4## заложников.\n\nКомандные бонусы не складываются.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_st_spec_3_desc_sc"] = "Раньше профессия оружейника считалась военной и заключалась в содержании, починке и улучшении брони и снаряжения.\n\nЛюбому чего-то стоящему синдикату нужен человек, способный предоставить бойцам достойную экипировку для работы.\n\n\n\n\nБонусы полной колоды:\n##-##Ваша броня увеличена на ##25%##.\n##-##Вы можете ставить ##2## кейса с мешками для тел.\n##-##Ваша броня восстанавливается быстрее на ##15%##.",
		["menu_st_spec_3_desc_sc_short"] = "Раньше профессия оружейника считалась военной и заключалась в содержании, починке и улучшении брони и снаряжения.\n\nЛюбому чего-то стоящему синдикату нужен человек, способный предоставить бойцам достойную экипировку для работы.",
		["menu_deck3_1_desc_sc"] = "Ваша броня увеличена на ##10%##.",
		["menu_deck3_3_desc_sc"] = "Ваша броня увеличена ещё на ##10%##.",
		["menu_deck3_5_desc_sc"] = "Ваша броня увеличена ещё на ##5%##.\n\nВы можете ставить ##2## кейса с мешками для тел.",
		["menu_deck3_7_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.",
		["menu_deck3_9_desc_sc"] = "Ваша броня восстанавливается быстрее ещё на ##5%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Burglar--
		["menu_st_spec_7_desc_sc"] = "Врождённая сноровка Взломщика выходит за рамки привычных взлома и проникновения. Чрезвычайная ловкость позволяет ему двигаться быстрее, оставаясь незаметным.\n\nПо ним очень трудно попасть. Они остаются живыми, оставясь в стороне.\n\n\nБонусы полной колоды:\n##-##Ваш уворот увеличен на ##15## очков.\n##-##Ваш уворот заполняется на ##10%## за каждую секунду в приседе.\n##-##Ваша броня восстанавливается быстрее на ##10%##.\n##-##Вы двигаетесь на ##20%## быстрее в приседе.",	
		["menu_st_spec_7_desc_sc_short"] = "Врождённая сноровка Взломщика выходит за рамки привычных взлома и проникновения. Чрезвычайная ловкость позволяет ему двигаться быстрее, оставаясь незаметным.\n\nПо ним очень трудно попасть. Они остаются живыми, оставясь в стороне.",		
		["menu_deck7_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nВаша полоска уворота заполняется на ##5%## за каждую секунду в приседе.",
		["menu_deck7_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck7_5_desc_sc"] = "Вы двигаетесь на ##20%## быстрее в приседе.\n\nВаша полоска уворота заполняется ещё на ##5%## за каждую секунду в приседе.",
		["menu_deck7_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck7_9_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Gambler--
		["menu_st_spec_10_desc_sc"] = "Удача обманчива. В древней Греции её считали даром Богов, но на самом деле это не так. Удача существует, но её надо заслужить. Чтобы достичь самой большой вероятности успеха, требуются подготовка и тщательное продумывание. Лучше следить за картами, чем надеяться на Фортуну.\n\nШулер - колода для поддержки команды. С любым напарником можно выиграть, но с Шулером можно выиграть по-крупному.\n\nБонусы полной колоды:\n##-##Вы отвечаете на пейджеры на ##25%## быстрее.\n##-##Вы получаете ##10## уворота.\n##-##Когда вы подбираете патроны, ваша команда дополнительно получает ##15%## патронов.\n##-##Коробки с патронами также дают медикаменты, которые восстанавливают от ##3## до ##5## здоровья. Эффект происходит раз в ##8## секунд, но каждая подобранная коробка патронов уменьшает эту задержку на ##1##-##3## секунды.\n##-Когда вы лечитесь при помощи коробок с патронами:##\nВаша команда лечится на ##50%## от количества полученного здоровья.\nВаша полоска уворота получает до ##100%## от вашего Уворота.\nВы получаете ##30## брони.",		
		["menu_st_spec_10_desc_sc_short"] = "Удача обманчива. В древней Греции её считали даром Богов, но на самом деле это не так. Удача существует, но её надо заслужить. Чтобы достичь самой большой вероятности успеха, требуются подготовка и тщательное продумывание. Лучше следить за картами, чем надеяться на Фортуну.\n\nШулер - колода для поддержки команды. С любым напарником можно выиграть, но с Шулером можно выиграть по-крупному.",	 			
		["menu_deck10_1_desc_sc"] = "Коробки с патронами также дают медикаменты, которые восстанавливают от ##3## до ##5## здоровья.\n\nЭффект происходит раз в ##8## секунд, но каждая подобранная коробка патронов уменьшает эту задержку на ##1##-##3## секунды.",
		["menu_deck10_3_desc_sc"] = "Когда вы подбираете патроны, ваша команда дополнительно получает ##15%## патронов.\n\nВы получаете ##5## уворота.",
		["menu_deck10_5_desc_sc"] = "Здоровье, получаемое от коробок с патронами, увеличено ещё на ##1## очко.\n\nКаждый раз, когда вы лечитесь от подбора, ваша полоска уворота получает до ##100%## от вашего Уворота.\n\nВы отвечаете на пейджеры на ##25%## быстрее",
		["menu_deck10_7_desc_sc"] = "Когда вы лечитесь при помощи коробок с патронами, ваша команда также лечится на ##50%## от количества полученного здоровья.\n\nВы получаете ##5## уворота.",
		["menu_deck10_9_desc_sc"] = "Здоровье, получаемое от коробок с патронами, увеличено ещё на ##1## очко.\n\nКогда вы лечитесь при помощи коробок с патронами, вы получаете ##30## брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_deck10_7"] = "Сомнительная медицина",
		["menu_deck10_9"] = "Народная медицина",

		--Infiltrator--
		["menu_st_spec_8_desc_sc"] = "Интервент - агент, нанимаемый государством или крупной криминальной организацией с целью добыть секретную информацию о врагах или корпорациях.\n\nИнтервент - специалист ближнего боя, который использует окружение, чтобы добиться превосходства.\n\n\nБонусы полной колоды:\n##-##Когда вы находитесь в ##12## метрах от врага, вы получаете на ##20%## меньше урона.\n##-##Каждый успешный удар оружием ближнего боя даёт ##16%## бонус к урону оружия ближнего боя на ##10## секунд, этот эффект складывается до ##5## раз.\n##-##Вы зацикливаете камеры на ##20## секунд дольше.\n##-##Каждый успешный удар оружием ближнего боя восстанавливает ##1## очко здоровья каждые ##2## секунды в течение ##10## секунд, эффект складывается до ##5## раз.",
		["menu_st_spec_8_desc_sc_short"] = "Интервент - агент, нанимаемый государством или крупной криминальной организацией с целью добыть секретную информацию о врагах или корпорациях.\n\nИнтервент - специалист ближнего боя, который использует окружение, чтобы добиться превосходства.",
		["menu_deck8_1_desc_sc"] = "Когда вы находитесь в ##12## метрах от врага, вы получаете на ##5%## меньше урона.",
		["menu_deck8_3_desc_sc"] = "Когда вы находитесь в ##12## метрах от врага, вы получаете ещё на ##5%## меньше урона.",
		["menu_deck8_5_desc_sc"] = "Когда вы находитесь в ##12## метрах от врага, вы получаете ещё на ##10%## меньше урона.\n\nКаждый успешный удар оружием ближнего боя даёт ##8%## бонус к урону оружия ближнего боя на ##10## секунд, который может складываться до ##5## раз.\n\nВы зацикливаете камеры на ##20## секунд дольше.",
		["menu_deck8_7_desc_sc"] = "Каждый успешный удар оружием ближнего боя даёт ещё ##8%## урона оружию ближнего боя на ##10## секунд.",
		["menu_deck8_9_desc_sc"] = "Каждый успешный удар оружием ближнего боя восстанавливает ##1## очко здоровья каждые ##2## секунды в течение ##10## секунд, этот эффект может складываться до ##5## раз.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sociopath--
		["menu_st_spec_9_desc_sc"] = "The Sociopath is known to be one of the most effective type of criminals. Where he is effective, he is also difficult to deal with, which is why larger organizations avoid him.\n\nBold, disinhibitted and mean, the Sociopath excels in the most violent of jobs. Unable to feel guilt for the crimes he commits, the Sociopath is a dangerous enemy.\n\nBenefits from a full perk deck:\n##-##When you are within ##18## meters of an enemy, you receive ##5%## less damage from enemies.\n##-##You carry ##1## additional body bag in your inventory.\n##-Activated upon killing an enemy with a 5 second cooldown:##\nYou regenerate ##20## armor.\nIf done using a melee weapon, regenerate ##2%## of your health.\nIf done within ##18## meters, you regenerate an additional ##20## armor and have a ##25%## chance to spread panic among your enemies.\n-Kills done during cooldown reduce it by ##0.5## seconds.\n##-##You gain ##10## dodge points.",
		["menu_st_spec_9_desc_sc"] = "Известно, что лучшими преступниками становятся социопаты. Хоть они и эффективны, но с ними трудно найти общий язык, поэтому крупные организации избегают их.\n\nНаглые, самоуверенные и жестокие, социопаты отлично справляются с жестокими поручениями. Они очень опасные противники, так как не чувствуют вины за совершённые преступления.\n\n\nБонусы полной колоды:\n##-##Когда вы в ##18## метров от врага, вы получаете на ##5%## меньше урона.\n##-##nВы носите на ##1## мешок для тел больше.\n##-При убийстве врага раз в 5 секунд:##\n Вы восстанавливаете ##20## брони.\nЕсли убийство было холодным оружием, вы восстанавливаете ##2%## здоровья.\nЕсли убийство было в менее чем ##18## метрах от вас, вы восстанавливаете ещё ##20## брони и имеете ##25%## шанс посеять панику среди врагов.\n-Убийства во время задержки эффекта сократят задержку на ##0.5## секунд.\n##-##Вы получаете ##10## уворота.",
		["menu_st_spec_9_desc_sc_short"] = "Известно, что лучшими преступниками становятся социопаты. Хоть они и эффективны, но с ними трудно найти общий язык, поэтому крупные организации избегают их.\n\nНаглые, самоуверенные и жестокие, социопаты отлично справляются с жестокими поручениями. Они очень опасные противники, так как не чувствуют вины за совершённые преступления.",
		["menu_deck9_1_sc"] = "No Talk",	
		["menu_deck9_3_desc_sc"] = "Убийство врага восстанавливает ##20## брони.\n\nЭто может происходить только раз в ##5## секунд, но каждое убийство сокращает время на ##0.5## секунд.\n\nВы получаете ##5## уворота.",
		["menu_deck9_5_desc_sc"] = "Убийство врага оружием ближнего боя восстанавливает ##2%## здоровья.\n\nЭффект активируется вместе с предыдущим перком раз в ##5## секунд, но каждое убийство сокращает время на ##0.5## секунд.\n\nВы носите на ##1## мешок для тел больше.",
		["menu_deck9_7_desc_sc"] = "Убийство врага, находящегося в менее чем ##18## метров от вас, восстанавливает ##20## брони.\n\nЭффект активируется вместе с предыдущим перком раз в ##5## секунд, но каждое убийство сокращает время на ##0.5## секунд.\n\nВы получаете ещё ##5## уворота",
		["menu_deck9_9_desc_sc"] = "Убийство врага, находящегося в менее чем ##18## метров от вас, имеет ##25%## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nЭффект активируется вместе с предыдущим перком раз в ##5## секунд, но каждое убийство сокращает время на ##0.5## секунд.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Grinder--
		["menu_st_spec_11_desc_sc"] = "Нападающий - трудяга, способный перевернуть самые сложные ситуации.\n\nНападающий должен быть всегда на линии огня, выживая за счёт нанесённого урона, вне зависимости от того, сколько урона он получит сам.\n\n\nБонусы полной колоды:\n##-##Нанесение урона врагу восстанавливает ##4## очка здоровья каждые ##5## секунд. Этот эффект складывается до ##5## раз, но не чаще чем раз в ##0.5## секунд и только при ношении Противоосколочного жилета. Нанесения урона турелями и уроном через время не вызывает эффект.\n##-##Вы теряете ##30## брони при ношении Противоосколочного жилета.\n##-##Вы получаете ##8## скрытности при ношении Противоосколочного жилета.\n##-##Каждое срабатывание эффекта увеличивает ваше здоровье на ##5%##.\n##-##Вы получаете возможность ставить ##2## кейса с мешками для трупов.",
		["menu_st_spec_11_desc_sc_short"] = "Нападающий - трудяга, способный перевернуть самые сложные ситуации.\n\nНападающий должен быть всегда на линии огня, выживая за счёт нанесённого урона, вне зависимости от того, сколько урона он получит сам.",
		["menu_deck11_1_desc_sc"] = "Нанесение урона врагу восстанавливает ##2## очка здоровья каждую секунду в течение ##3## секунд.\n\nЭтот эффект складывается до ##5## раз, но не чаще чем раз в ##0.5## секунд и только при ношении ##Противоосколочного жилета##. Нанесение урона при помощи турелей и урона через время (огня или яда) не вызывает эффект.\n\nВы теряете ##30## брони при ношении Противоосколочного жилета.\n\nВы получаете ##8## скрытности при ношении Противоосколочного жилета.",
		["menu_deck11_3_desc_sc"] = "Эффект теперь восстанавливает на ##1## очко здоровья больше каждую секунду.",
		["menu_deck11_5_desc_sc"] = "Эффект теперь длится ещё ##2## секунды.\n\nВы получаете возможность ставить ##2## кейса с мешками для трупов.",
		["menu_deck11_7_desc_sc"] = "Эффект теперь восстанавливает на ##2## очка здоровья больше каждую секунду.",
		["menu_deck11_9_desc_sc"] = "Каждое срабатывание эффекта теперь увеличивает скорость передвижения на ##5%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Open your mind--
		["menu_st_spec_13_desc_sc"] = "Экс-Президенты - одна из самых смелых банд грабителей. Эти братья по оружию любят риски. Они добились успеху благодаря отсутствию страха смерти.\n\nЭкс-Президент не следует правилам, лишь Восьмёрке Озаки: серии испытаний, которая заставляет раскрыть настоящего себя.\n\n\nБонусы полной колоды:\n##-##Когда у вас полная броня, вы получаете ##4## очка запасного здоровья за каждого убитого врага. Когда ваша броня восстанавливается после полной потери, ваше запасное здоровье превращается в настоящее. Максимальное количество запасного здоровья зависит от вашей брони.\n##-##Убийство врага ускоряет восстановление брони, в зависимости от надетой брони. Чем больше брони, тем меньше ускорение. Этот бонус обнуляется при каждом восстановлении брони.\n##-##Ваш уворот увеличен на ##10##.\n##-##Граждаские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_st_spec_13_desc_sc_short"] = "Экс-Президенты - одна из самых смелых банд грабителей. Эти братья по оружию любят риски. Они добились успеху благодаря отсутствию страха смерти.\n\nЭкс-Президент не следует правилам, лишь Восьмёрке Озаки: серии испытаний, которая заставляет раскрыть настоящего себя.",
		["menu_deck13_1_desc_sc"] = "Когда у вас полная броня, вы получаете ##4## очка запасного здоровья за каждого убитого врага.\n\nКогда ваша броня восстанавливается после полной потери, ваше запасное здоровье превращается в настоящее.\n\nМаксимальное количество запасного здоровья зависит от вашей брони - тяжёлая броня накапливает меньше запасного здоровья, чем лёгкая.",
		["menu_deck13_3_desc_sc"] = "Увеличивает количество накапливаемого здоровья на ##2##.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck13_5_desc_sc"] = "Вы можете накапливать на ##25%## больше здоровья.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_deck13_7_desc_sc"] = "Увеличивает количество накапливаемого здоровья на ##2##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck13_9_desc_sc"] = "Убийство врага ускоряет восстановление брони, в зависимости от надетой брони. Тяжёлая броня получает меньший бонус, чем лёгкая. Этот бонус обнуляется при каждом восстановлении брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--THIS IS WAR BABY--
        ["menu_st_spec_14_desc_sc"] = "Маньяк - воплощение безбашенства и непринятия неудач в сложных ситуациях. Когда вы наносите урон, ваша команда получит временный щит, который заставит почувствовать дух неуязвимости Джимми.\n\n\n\n\n\nБонусы полной колоды:\n##-##Наносимый вами урон переводится в Истерию. Максимальное количество Истерии - ##240##. Истерия: Получаемый урон для вас и вашей команды уменьшается на ##2## очка за каждые ##30## очков Истерии. Истерия уменьшается на ##30## очков каждые ##8## секунд.\n##-##Члены вашей команды также получают эффект Истерии.\n\n##-##Гражданские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_st_spec_14_desc_sc_short"] = "Маньяк - воплощение безбашенства и непринятия неудач в сложных ситуациях. Когда вы наносите урон, ваша команда получит временный щит, который заставит почувствовать дух неуязвимости Джимми.",		
		["menu_deck14_1_desc_sc"] = "Наносимый вами урон переводится в Истерию. Максимальное количество Истерии - ##240##.\n\nИстерия:\nПолучаемый урон для вас и вашей команды уменьшается на ##1## очко за каждые ##40## очков Истерии. Истерия уменьшается на ##40## каждые ##8## секунд.",
		["menu_deck14_3_desc_sc"] = "Члены вашей команды получают бонус за Истерию.\n\nИстерия от разных членов команды не складывается - эффект имеет только истерия с самой большой защитой.\n\nВы получаете ##5## уворота.",
		["menu_deck14_5_desc_sc"] = "Истерия теперь уменьшается на ##30## каждые ##8## секунд.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_deck14_7_desc_sc"] = "Получаемый урон теперь уменьшается ещё на ##1## очко за каждые ##30## очков Истерии.",
		["menu_deck14_9_desc_sc"] = "Очки истерии теперь на ##100%## эффективнее для вас.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Anarchist--
		["menu_st_spec_15_desc_sc"] = "Анархист отказывается от законов традиционного авторитета. Короли, королевы и президенты не имеют власти над Анархистом. Летай свободно и придумывай свои правила. Их отказ от общепринятых вещей позволяет Анархистам забираться туда, куда не могут другие - они используют необычные способы проскользнуть к на первый взгляд невозможным целям.\n\n\nБонусы полной колоды:\n##-##место восстановления брони вне боя, Анархист периодически восстанавливает броню с частотой ##8## очков брони в секунду. Тяжёлые бронежилеты восстанавливают больше брони за раз, но делают это реже.\n##-## ##50%## вашего здоровья переводится в ##150%## брони.\n##-##Нанесение урона восстановит вам часть брони - это может произойти только раз в ##5## секунд. Тяжёлые бронежилеты восстанавливают больше брони.\n##-##Гражданские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_st_spec_15_desc_sc_short"] = "Анархист отказывается от законов традиционного авторитета. Короли, королевы и президенты не имеют власти над Анархистом. Летай свободно и придумывай свои правила. Их отказ от общепринятых вещей позволяет Анархистам забираться туда, куда не могут другие - они используют необычные способы проскользнуть к на первый взгляд невозможным целям.",
		["menu_deck15_1_desc_sc"] = "Вместо восстановления брони вне боя, Анархист периодически восстанавливает броню с частотой ##8## очков брони в секунду. Тяжёлые бронежилеты восстанавливают больше брони за раз, но делают это реже.\n\nНавыки, увеличивающие скорость восстановления брони, отключены при использовании этого набора.",
		["menu_deck15_3_desc_sc"] = "##50%## вашего здоровья переводится в ##50%## брони.",
		["menu_deck15_5_desc_sc"] = "##50%## вашего здоровья переводится в ##100%## брони.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##25%## дольше.",
		["menu_deck15_7_desc_sc"] = "##50%## вашего здоровья переводится в ##150%## брони.",
		["menu_deck15_9_desc_sc"] = "Нанесение урона восстановит вам часть брони - это может произойти только раз в ##5## секунд. Тяжёлые бронежилеты восстанавливают больше брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Scarface--
	    ["menu_st_spec_17_desc_sc"] = "Вор в законе - властный босс, который требует полной лояльности. Но сначала нужны деньги. Когда получаешь деньги, получаешь власть. Помни, единственное, что имеет власть над миром - твой стальной характер.\n\n\n\n\n\nБонусы полной колоды:\n##-##Теперь вы можете использовать Инъектор.Во время использование Инъектора, вы будете вылечены на ##30%## от любого полученного урона в течение ##6## секунд. Инъектор можно использовать раз в ##30## секунд.\n##-##Ваша скорость увеличена на ##20%## пока действует Инъектор.\n##-##Пока действует Инъектор, враги будут держать вас в приоритете.\n##-##Количество восстанавливаемого Инъектором здоровья увеличено на ##60%## если у вас меньше ##25%## здоровья.\n##-##Пока у вас полное здоровье, за каждые ##5## очков здоровья, полученные во время действия Инъектора, Инъектор восстановится на ##2## секунды быстрее.",
		["menu_st_spec_17_desc_sc_short"] = "Вор в законе - властный босс, который требует полной лояльности. Но сначала нужны деньги. Когда получаешь деньги, получаешь власть. Помни, единственное, что имеет власть над миром - твой стальной характер.",
		["menu_deck17_1_desc_sc"] = "Теперь вы можете использовать Инъектор. Переключение на другой набор перков сделает Инъектор недоступным. Инъектор заменяет ваше метательное оружие.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы использовать его. Во время использование Инъектора, вы будете вылечены на ##30%## от любого полученного урона в течение ##4## секунд.\n\nИнъектор можно использовать раз в ##30## секунд.",
		["menu_deck17_3_desc_sc"] = "Ваша скорость увеличена на ##20%## пока действует Инъектор.",
		["menu_deck17_5_desc_sc"] = "Теперь вы будете вылечены на ##30%## от любого полученного урона в течение ##6## секунд после использования Инъектора.\n\nПока действует Инъектор, враги будут держать вас в приоритете.",
		["menu_deck17_7_desc_sc"] = "Количество восстанавливаемого Инъектором здоровья увеличено на ##60%## если у вас меньше ##25%## здоровья.",
		["menu_deck17_9_desc_sc"] = "Пока у вас полное здоровье, за каждые ##5## очков здоровья, полученные во время действия Инъектора, Инъектор восстановится на ##2## секунды быстрее.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--10 feet higher--
		["menu_st_spec_18"] = "Сикарио",
		["menu_st_spec_18_desc_sc"] = "Сикарио нужен в любом наркокартеле. Кто-то, кто решит любую проблему самым жестоким способом. Сикарио никогда не убегает от битвы и выполняет свою работу без страха и сомнения.\n\n\n\n\n\nБонусы полной колоды:\n##-##Теперь вы можете использовать ##Дымовую шашку.## При броске, дымовая шашка создаёт дымовую завесу на ##12## секунд. Внутри завесы вы и ваша команда восстанавливают броню на ##100%## быстрее. Любые противники, стоящие в дымовой завесе, получает штраф ##75%## к точности. Дымовую завесу можно использовать раз в ##40## секунд, но убийство врага сокращает эту задержку на ##1## секунду.\n##-## Уворот от атаки сократит задержку дымовой завесы на ##1## секунду. \n##-## Полоска уворота будет заполняться на ##40%## каждую секунду, в течение которой вы находитесь внутри дымовой завесы.\nВаш уворот увеличен на ##15## очков.\n##-##Вы носите на ##1## мешок для тел больше.",
		["menu_st_spec_18_desc_sc_short"] = "Сикарио нужен в любом наркокартеле. Кто-то, кто решит любую проблему самым жестоким способом. Сикарио никогда не убегает от битвы и выполняет свою работу без страха и сомнения.",
		["menu_deck18_1_desc_sc"] = "Ваш уворот увеличен на ##5## очков.\n\nТеперь вы можете использовать ##Дымовую шашку.##\n\nПри броске, дымовая шашка создаёт дымовую завесу на ##12## секунд. Внутри завесы вы и ваша команда восстанавливают броню на ##100%## быстрее. Любые противники, стоящие в дымовой завесе, получает штраф ##75%## к точности.\n\nДымовую завесу можно использовать раз в ##40## секунд, но убийство врага сокращает эту задержку на ##1## секунду.",
		["menu_deck18_3_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck18_5_desc_sc"] = "Уворот от атаки сократит задержку дымовой завесы на ##1## секунду.\n\nВы носите на ##1## мешок для тел больше.",
		["menu_deck18_7_desc_sc"] = "Ваш уворот увеличен ещё на ##5## очков.",
		["menu_deck18_9_desc_sc"] = "Полоска уворота будет заполняться на ##40%## каждую секунду, в течение которой вы находитесь внутри дымовой завесы.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sweet liquor eases the pain--
		["menu_st_spec_19_desc_sc"] = "Вы нерушимая стена рассудка и спокойствия. Дисциплина разума помогает Стоику пройти через ситуации, в которых другие бы впали в истерику. Контроль физической реакции, взятый у монахов-буддистов позволит вам продержаться ровно столько, сколько нужно для успешного ограбления.\n\n\n\nБонусы полной колоды:\n##-##UТеперь вы можете использовать Фляжку. ##30%## получаемого урона будет задержано на ##8## секунд. Использование Фляжки мгновенно отвергает задержанный урон. Когда вы отвергаете задержанный урон, ##300%## этого урона возвращается вам в качестве здоровья. Фляжку можно использовать раз в ##30## секунд.\n##-##50% вашей брони превращается в ##50%## здоровья.\n##-##Задержка Фляжки сокращается на ##1.5## секунды за каждого убитого врага.\n##-##Если вы не получаете урон в течение ##4## секунд, любой задержанный урон будет отвергнут.\n##-##Когда у вас меньше ##50%## здоровья, задержка Фляжки сокращается на ##6## секунд за каждого убитого врага.\n##-##Вы получаете на ##25%## больше здоровья после поднятия.\n##-##Вы отвечаете на пейджеры на ##25%## быстрее.",
		["menu_st_spec_19_desc_sc_short"] = "Вы нерушимая стена рассудка и спокойствия. Дисциплина разума помогает Стоику пройти через ситуации, в которых другие бы впали в истерику. Контроль физической реакции, взятый у монахов-буддистов позволит вам продержаться ровно столько, сколько нужно для успешного ограбления.",
		["menu_deck19_1_desc_sc"] = "Теперь вы можете использовать Фляжку.\n\n##30%## получаемого урона по здоровью будет задержано на ##8## секунд.\n\nВы можете нажать на кнопку метательного оружия, чтобы использовать Фляжку и мгновенно отвергнуть задержанный урон.\n\nКогда вы отвергаете задержанный урон, ##150%## этого урона возвращается вам в качестве здоровья. Фляжку можно использовать раз в ##30## секунд.\n\n##50% вашей брони превращается в 50% здоровья.##",
		["menu_deck19_3_desc_sc"] = "Задержка Фляжки сокращается на ##1.5## секунды за каждого убитого врага.",
		["menu_deck19_5_desc_sc"] = "Если вы не получаете урон в течение ##4## секунд, любой задержанный урон будет отвергнут.\n\nВы отвечаете на пейджеры на ##25%## быстрее.",
		["menu_deck19_7_desc_sc"] = "Когда у вас меньше ##50%## здоровья, задержка Фляжки сокращается на ##3## секунды за каждого убитого врага.",
		["menu_deck19_9_desc_sc"] = "Вы получаете на ##25%## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		
		--it's not a war crime if they're not people--
		["menu_st_spec_20"] = "Тандем",
		["menu_st_spec_20_desc_sc"] = "Некоторыми вещами лучше наслаждаться вместе, даже если это парилка с усиляющим веществом! Разделите её с вашим любимым грабителем, пока вы вместе грабите банки и сеете хаос.\n\n\n\n\n\nБонусы полной колоды:\n##-##Теперь вы можете использовать Парилку. тобы активировать Парилку, вам нужно смотреть на союзника на расстоянии не более ##18## метров и нажать на кнопку метательного оружия, чтобы отметить его. Каждый противник, убитый вами или выбранным союзником, восстановит ##4## здоровья вам и ##2## здоровья союзнику. Каждый убитый вами враг увеличит время эффекта на ##2## секунды. Парилка длится ##12## секунд и восстанавливается ##60## секунд.\n##-##Каждый убитый вами или выбранным союзником враг уменьшает получаемый урон на ##1## очко, до максимальных ##20##, пока Парилка не станет снова доступна для использования.\n##-##Каждый враг, убитый вами, сокращает задержку Парилки на ##2## секунды.\n##-##Каждый враг, убитый выбранным союзником, сокращает задержку Парилки на ##2## секунды, пока она действует.\n##-##Вы зацикливаете камеры на ##20## секунд дольше.",
		["menu_st_spec_20_desc_sc_short"] = "Некоторыми вещами лучше наслаждаться вместе, даже если это парилка с усиляющим веществом! Разделите её с вашим любимым грабителем, пока вы вместе грабите банки и сеете хаос.",
		["menu_deck20_1_desc_sc"] = "Теперь вы можете использовать ##Парилку.##\n\nЧтобы активировать Парилку, вам нужно смотреть на союзника на расстоянии не более ##18## метров и нажать на кнопку метательного оружия, чтобы отметить его. Между вами и союзником не должно быть препятствий или стен.\n\nКаждый противник, убитый вами или выбранным союзником, восстановит ##4## здоровья вам и ##2## здоровья союзнику.\n\nКаждый убитый враг увеличит время эффекта на ##2## секунды.\n\nПарилка длится ##11## секунд и восстанавливается ##80## секунд.",
		["menu_deck20_3_desc_sc"] = "Каждый убитый вами или выбранным союзником враг продлевает действие Парилки на ##2## секунды.\n\nЭтот эффект уменьшается на ##0.2## секунды с каждым убийством.",
		["menu_deck20_5_desc_sc"] = "Каждый убитый вами или выбранным союзником враг уменьшает получаемый урон на ##0.5## очков, до максимальных ##8##, пока Парилка не станет снова доступна для использования.\n\nВы зацикливаете камеры на ##20## секунд дольше.",
		["menu_deck20_7_desc_sc"] = "Лечение от Парилки увеличено на ##100%##.",
		["menu_deck20_9_desc_sc"] = "Каждый враг, убитый вами, сокращает задержку Парилки на ##2## секунды.\n\nКаждый враг, убитый выбранным союзником, сокращает задержку Парилки на ##2## секунды, пока она действует.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Biker--		
		["menu_st_spec_16_desc_sc"] = "Банды байкеров боятся по всему миру, а самые большие клубы получают всеобщую огласку. Чтобы стать байкером, нужно быть сильным и верным и помнить, что правила клуба превыше всего. Байкеры известны своей жестокостью и никогда не боятся пойти против тех, кто с ними не согласен.\n\n\n\nБонусы полной колоды:\n##-##Каждый раз, когда вы или ваша команда убивают врага, вы восстанавливаете ##2## очка здоровья. Это может произойти только раз в ##5## секунд.\n##-##Вы восстанавливаете ##10## брони каждые ##5## секунд.\n##-##Каждые потерянные ##25%## брони сокращают задержку на восстановление здоровья на ##0.5## секунд и увеличивают количество получаемого здоровья за убийства на ##2## очка.\n##-##Вы восстанавливаете ещё ##20## брони каждые ##5## секунды. Убийство врага оружием ближнего боя мгновенно вызывает этот эффект и активирует следующее восстановление брони на ##1## секунду раньше.\n##-##Вы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_st_spec_16_desc_sc_short"] = "Банды байкеров боятся по всему миру, а самые большие клубы получают всеобщую огласку. Чтобы стать байкером, нужно быть сильным и верным и помнить, что правила клуба превыше всего. Байкеры известны своей жестокостью и никогда не боятся пойти против тех, кто с ними не согласен.",
		["menu_deck16_1_desc_sc"] = "Каждый раз, когда вы или ваша команда убивают врага, вы восстанавливаете ##2## очка здоровья. Это может произойти только раз в ##5## секунд.",
		["menu_deck16_3_desc_sc"] = "Вы восстанавливаете ##10## брони каждые ##5## секунд.",
		["menu_deck16_5_desc_sc"] = "Каждые потерянные ##25%## брони сокращают задержку на восстановление здоровья на ##0.5## секунд.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_deck16_7_desc_sc"] = "Вы восстанавливаете ##20## брони каждые ##5## секунд.\n\nУбийство врага оружием ближнего боя мгновенно вызывает этот эффект и активирует следующее восстановление брони на ##1## секунду раньше.",
		["menu_deck16_9_desc_sc"] = "Каждые потерянные ##25%## брони увеличивают количество получаемого здоровья за убийства на ##2## очка.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		


		--Yakuza--
		["menu_st_spec_12_desc_sc"] = "Якудзу боятся по всему миру. Ей управляют нинкё, а правит оябун - Якудза известна строгими правилами, организованной структурой и татуировками, которые покрывают всё тело.\n\nОтстранённый от общества, якудза знает, как постоять за себя. Хоть он и выглядит вежливым, не стоит его недооценивать.\n\n\nБонусы полной колоды:\n##-##Вы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.\n##-##Один раз за падение, если у вас закончится здоровье, вы выживите с ##1## здоровьем и восстановите ##50## брони.\n##-##Ваш уворот увеличен на ##10## очков.\n##-##Максимальное количество устойчивости увеличено до ##80%.##\n##-Когда у вас меньше 100% здоровья:##\nУбийство холодным оружием заполняет до ##150%## вашего уворота.\nУбийство другими способами заполняет до ##50%## вашего уворота.\nУбийство холодным оружием увеличивает период бессмертия следующего уворота до ##300%##, до максимальных ##900мс##.\nВаш уворот заполняется на чило до ##10%## каждую секунду.\nВы получаете до ##20%## меньше урона.",
		["menu_st_spec_12_desc_sc_short"] = "Якудзу боятся по всему миру. Ей управляют нинкё, а правит оябун - Якудза известна строгими правилами, организованной структурой и татуировками, которые покрывают всё тело.\n\nОтстранённый от общества, якудза знает, как постоять за себя. Хоть он и выглядит вежливым, не стоит его недооценивать.",	
		["menu_deck12_1_desc_sc"] = "Чем меньше у вас здоровья, тем быстрее будет восстанавливаться полоска уворота. Когда у вас меньше ##100%## здоровья, полоска уворота будет восстанавливать до ##10%## уворота каждую секунду.\n\nВаш уворот увеличен на ##5## очков.",
		["menu_deck12_3_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага. Когда у вас меньше ##100%## здоровья, вы получите до ##50%## уворота при убийстве врага.",
		["menu_deck12_5_desc_sc"] = "Чем меньше у вас здоровья, тем меньше урона вы получаете. Когда у вас меньше ##100%## здоровья, вы получаете до ##20%## меньше урона.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_deck12_7_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага оружием ближнего боя. Когда у вас меньше ##100%## здоровья, вы получите до ##150%## уворота при убийстве врага, а также период бессмертия следующего уворота будет увеличен до ##300%##, до максимальных ##900мс##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck12_9_desc_sc"] = "Максимальное количество устойчивости увеличено до ##80%.##\n\nОдин раз за падение, если у вас закончится здоровье, вы выживите с ##1## здоровьем и восстановите ##50## брони.\n\nДанный перк не работает на удары Клокеров и шок Тазеров.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		
		["menu_yakuza_deflection_add"] = "(Бонус Якудзы)",

		--Hacker--
		["menu_st_spec_21_desc_sc"] = "Ваш ум и снаряжение позволяют справиться с любой системой безопасности одним нажатием кнопки. Вас никогда не застанут камера или охранник, но если все идет не по плану, вы в легкую проникните в радиоканал врагов и оставите слушателям неприятный сюрприз.\n\n\n\n\nБонусы полной колоды:\n##-##Теперь вы можете использовать Карманный генератор помех. Активация Карманного генератора помех до тревоги отключит всю электронику и пейджеры на ##10## секунд. Активация Карманного генератора помех после тревоги будет оглушать врагов в радиусе ##15## метров каждые ##1.5## секунды в течение ##10## секунд. Карманный генератор помех восстанавливается ##80## секунд, но каждое убийство сократит задержку на ##2## секунды..\n##-##Пока работает генератор помех:\nУбийство врага восстановит ##5## здоровья.\nУбийство врага союзниками восстановит им ##2.5## здоровья.\n##-##Ваша броня восстанавливается быстрее ##10%.##\n##-##Ваш уворот увеличен на ##10## очков.",
		["menu_st_spec_21_desc_sc_short"] = "Ваш ум и снаряжение позволяют справиться с любой системой безопасности одним нажатием кнопки. Вас никогда не застанут камера или охранник, но если все идет не по плану, вы в легкую проникните в радиоканал врагов и оставите слушателям неприятный сюрприз.",
		["menu_deck21_1_desc_sc"] = "Теперь вы можете использовать ##Карманный генератор помех##.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы активировать его.\n\nАктивация Карманного генератора помех до тревоги отключит всю электронику и пейджеры на ##10## секунд.\n\nАктивация Карманного генератора помех после тревоги будет оглушать врагов в радиусе ##15## метров каждые ##1.5## секунды в течение ##10## секунд.\n\nКарманный генератор помех восстанавливается ##80## секунд, но каждое убийство сократит задержку на ##2## секунды.",
		["menu_deck21_3_desc_sc"] = "Ваш уворот увеличен на ##5## очков.",
		["menu_deck21_5_desc_sc"] = "Убийство врага пока работает Карманный генератор помех восстановит ##5## здоровья.",
		["menu_deck21_7_desc_sc"] = "Ваша броня восстанавливается быстрее на ##10%##.\n\nВаш уворот увеличен ещё на ##5## очков.",
		["menu_deck21_9_desc_sc"] = "Союзники восстановят ##2.5## здоровья, если убьют врага пока работает Карманный генератор помех.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		
		

		--Leech
		["menu_st_spec_22_desc_sc"] = "В бою вы - паразит, который выкачивает силу из врагов, чтобы усилить себя и союзников. Вы не стена для битья. Вы несёте боль и используете её, чтобы помочь своей команде.\n\n\n\n\n\nБонусы полной колоды:\n##-##Теперь вы можете использовать Ампулу, которая действует ##10## секунд и имеет задержку ##40## секунд, убийство врагов уменьшает задержку на ##1## секунду. При активации, Ампула восстанавливает ##10%## максимального здоровья и отключает броню на время своего действия. Она так же разделяет ваше здоровье в сегменты по ##5%##, любой полученный урон убирает один сегмент, который можно восстановить, убив ##3## врагов, что так же заблокирует урон по вам на ##1## секунду. Любой урон восстановит ##2%## здоровья вашим союзникам.\n##-##Вы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_st_spec_22_desc_sc_short"] = "В бою вы - паразит, который выкачивает силу из врагов, чтобы усилить себя и союзников. Вы не стена для битья. Вы несёте боль и используете её, чтобы помочь своей команде.",
		["menu_deck22_1_desc_sc"] = "Теперь вы можете использовать ##Ампулу##.\n\nНажмите кнопку метательного оружия, чтобы активировать Ампулу. Она восстановит 10% вашего здоровья и отключит броню на время своего действия.\n\nПока Ампула действует, ваше здоровье разделено на сегменты по ##10%##, и любой полученный урон снимет один сегмент. Убийство ##3## врагов восстановит один сегмент и заблокирует получаемый урон на ##1## секунду.\n\nАмпула действует ##6## секунд и восстанавливается ##40## секунд.",
		["menu_deck22_3_desc_sc"] = "Пока действует Ампула, любое получение урона восстановит ##1%## здоровья вашим союзникам.",
		["menu_deck22_5_desc_sc"] = "Длительность Ампулы увеличена до ##10## секунд.\n\nУбийство врага уменьшает задержку Ампулы на ##1## секунду.\n\nПолучение урона лечит союзников на ##4%## здоровья.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##75%## быстрее.",
		["menu_deck22_7_desc_sc"] = "Во время действия ампулы, ваше здоровье разделено на сегменты по ##5%##.",
		["menu_deck22_9_desc_sc"] = "Теперь можно активировать Ампулу во время падения. Это поднимет вас до конца действия Ампулы.\n\nЭто добавит ##30## секунд к времени восстановления Ампулы.\n\nПолучение урона вылечит товарищей на ##2%##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Перерожденный",
		["menu_st_spec_0_desc"] = "Говорят, люди рождаются без каких-либо заложенных идей, мыслей и убеждений - они приобретаются исключительно из опыта. Для кого-то это усложняет жизнь, кто-то видит в этом возможности. Перерожденный - это грабитель, удача которого раскрывается не сразу. Его судьба полна как больших рисков, так и больших наград.\n\n\n\n\n\nБонусы полной колоды:\n##-##Предметы на черном рынке и активы стоят на ##60%## меньше.\n##-##Подбираемая добыча дает на ##30%## больше денег.\n##-##Вы получаете на ##135%## больше опыта.\n##-##Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##30%.##",
		["menu_st_spec_0_desc_short"] = "Говорят, люди рождаются без каких-либо заложенных идей, мыслей и убеждений - они приобретаются исключительно из опыта. Для кого-то это усложняет жизнь, кто-то видит в этом возможности. Перерожденный - это грабитель, удача которого раскрывается не сразу. Его судьба полна как больших рисков, так и больших наград.",
		["menu_deck0_1"] = "Свой человек",
		["menu_deck0_1_desc"] = "Предметы на черном рынке и активы стоят на ##30%## меньше.",		
		["menu_deck0_2"] = "Черный дилер",
		["menu_deck0_2_desc"] = "Предметы на черном рынке и активы стоят еще на ##30%## меньше.",				
		["menu_deck0_3"] = "Мертвые президенты",
		["menu_deck0_3_desc"] = "Подбираемая добыча дает на ##15%## больше денег.",		
		["menu_deck0_4"] = "День ветерана",
		["menu_deck0_4_desc"] = "Подбираемая добыча дает ещё на ##30%## больше денег.",	
		["menu_deck0_5"] = "Нуболюб",
		["menu_deck0_5_desc"] = "Вы получаете на ##45%## больше опыта.",	
		["menu_deck0_6"] = "Способный ученик",
		["menu_deck0_6_desc"] = "Вы получаете на ##45%## больше опыта.",		
		["menu_deck0_7"] = "Мистер Профессор Фантастик",
		["menu_deck0_7_desc"] = "Вы получаете на ##45%## больше опыта.",			
		["menu_deck0_8"] = "Четырехлистный клевер",
		["menu_deck0_8_desc"] = "Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		["menu_deck0_9"] = "Талисман удачи",
		["menu_deck0_9_desc"] = "Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##20%.##",		

		["menu_st_spec_00"] = "Прирожденный",
		["menu_st_spec_00_desc"] = "Некоторые считают, что все необходимые навыки уже есть у вас при рождении. Некоторые люди - прирождённые грабители - ему не нужно тратить ресурсы на навыки. Возможно, его убеждения - просто упрямство. Действительно ли стоит отказываться приобретать новые навыки?\n\n\n\n\n\nБонусы полной колоды:\n##-##Предметы на черном рынке и активы стоят на ##30%## меньше.\n##-##Подбираемая добыча дает на ##15%## больше денег.\n##-##Вы получаете на ##90%## больше опыта.\n##-##Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##20%.##",
		["menu_st_spec_00_desc_short"] = "Некоторые считают, что все необходимые навыки уже есть у вас при рождении. Некоторые люди - прирождённые грабители - ему не нужно тратить ресурсы на навыки. Возможно, его убеждения - просто упрямство. Действительно ли стоит отказываться приобретать новые навыки?",
		["menu_deck00_9_desc"] = "Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##20%.##",

		["rpd_menu_button"] = "Обнулить перк",
		["rpd_menu_dialog_title"] = "Вы уверены?",
		["rpd_menu_dialog_text"] = "Если вы обнулите перк '$perk_deck_name', вы получите $points_to_refund очков."	
	})
end)