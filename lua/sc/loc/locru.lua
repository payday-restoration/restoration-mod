Month = os.date("%m")
Day = os.date("%d")
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")

-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "Лучшая",
		["menu_es_crew"] = "Командная",
		["menu_es_personal"] = "Личная",
		["menu_es_bad"] = "Плохая",
		["menu_es_other"] = "Прочая",
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
		["RestorationModWeaponHandlingOptionsButtonTitleID"] = "+++ Настройки оружия +++",
		["RestorationModWeaponHandlingOptionsButtonDescID"] = "Опции, связанные с оружием.",
		["RestorationModUIOptionsButtonTitleID"] = "Alpha UI",
		["RestorationModUIOptionsButtonDescID"] = "Опции Alpha UI.",
		["RestorationModTimeOfDayTitleID"] = "Новые и случайные времена суток",
		["RestorationModTimeOfDayDescID"] = "Позволяет настраивать время суток на некоторых ограблениях.",
		["RestorationModOtherModsTitleID"] = "=== Настройки для других модов ===",
		["RestorationModOtherModsDescID"] = "Дополнительные настройки для других модов",
		["RestorationModAdVMovResOptOptionsButtonTitleID"] = "Настройки \"Advanced Movement Standalone\"",
		["RestorationModAdVMovResOptOptionsButtonDescID"] = "Дополнительные настройки мода \"Advanced Movement Standalone\"  от Solo Queue Pixy's.",
		["RestorationModDisableAdvMovTFTitleID"] = "Отключить бег и прыжки по стенам",
		["RestorationModDisableAdvMovTFDescID"] = "Отключает бег и прыжки по стенам, которые являются частью Advanced Movement мода.",
		["RestorationModAdvMovMeleeTitleID"] = "Оружие ближ. боя",
		["RestorationModAdvMovMeleeDescID"] = "Меняет поведение оружия ближ. боя от мода Advanced Movement (прыжки/подкаты/рывки/удар с разбега).",
			["resmod_advmov_melee_on"] = "По умолчанию",
			["resmod_advmov_melee_loud_only"] = "Во время громкого подхода",
			["resmod_advmov_melee_off"] = "Выключено",


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
		["RestorationModInfo_revive_damage_reductionTitleID"] = "Анальгин",
		["RestorationModInfo_revive_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_desperadoTitleID"] = "Меткий стрелок",
		["RestorationModInfo_desperadoDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_grinderTitleID"] = "Гистамин (Нападающий)",
		["RestorationModInfo_grinderDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_infiltratorTitleID"] = "Похититель жизней (Интервент)",
		["RestorationModInfo_infiltratorDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_sociopathTitleID"] = "Tension и прочее. (Социопат)",
		["RestorationModInfo_sociopathDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_body_expertiseTitleID"] = "Свинцовый ад",
		["RestorationModInfo_body_expertiseDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "Вдохновление",
		["RestorationModInfo_long_dis_reviveDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_messiahTitleID"] = "Мессия",
		["RestorationModInfo_messiahDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "Overkill",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "Колеса",
		["RestorationModInfo_revived_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "Скорая помощь",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_rogueTitleID"] = "Смертельный инстинкт (Шпион)",
		["RestorationModInfo_rogueDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "Бегущий от смерти",
		["RestorationModInfo_increased_movement_speedDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "Крепкий хват",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_trigger_happyTitleID"] = "Неудержимый стрелок",
		["RestorationModInfo_trigger_happyDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "Давление",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_unseen_strikeTitleID"] = "Удар исподтишка",
		["RestorationModInfo_unseen_strikeDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_survive_one_hitTitleID"] = "Татуировка Они (Якудза)",
		["RestorationModInfo_survive_one_hitDescID"] = "Включает или выключает отображение иконки данного навыка.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "Лечение от Медицинских сумок",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "Включает или выключает отображение лечения от Медицинских сумок.",
		["RestorationModAltLastDownColorTitleID"] = "Другой фильтр для последнего падения",
		["RestorationModAltLastDownColorDescID"] = "Переключает цветовой фильтр при последнем падении на color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Отключить наклон камеры при падении",
		["RestorationModNoBleedoutTiltDescID"] = "Отключает наклон камеры, который происходит после падения.",
		["RestorationModGOTTAGETAGRIPTitleID"] = "Спрятать все рукоятки",
		["RestorationModGOTTAGETAGRIPDescID"] = "Прячет все вертикальные рукоятки в меню установки модификаций; не действует на оружие с предустановленной рукоятью. Требуется перезапуск.",
		["RestorationModADSTransitionStyleTitleID"] = "Стиль прицеливания",
		["RestorationModADSTransitionStyleDescID"] = "Выбор \"анимации\" прицеливания.",
		["RestorationModGCGPYPMMSACTitleID"] = "Сурьезный режим",
		["RestorationModGCGPYPMMSACDescID"] = "Отключает плазменные трассеры и регенерацию патронов от некоторых модулей. Требует перезапуска ограбления.",
		["RestorationModGCGPYPMMSACTextTitleID"] = "Сурьезный текст",
		["RestorationModGCGPYPMMSACTextDescID"] = "Выключает все текстовые пасхалки. Требует перезапуска ограбления.",
		["RestorationModForceEggsOptionsButtonTitleID"] = "",
		["RestorationModForceEggsOptionsButtonDescID"] = "",
		["RestorationModUpotteTitleID"] = "",
		["RestorationModUpotteDescID"] = "",
		["RestorationModCrabBattleTitleID"] = "",
		["RestorationModCrabBattleDescID"] = "",
		["RestorationModEmberMyBelovedTitleID"] = "",
		["RestorationModEmberMyBelovedDescID"] = "",
		["RestorationModBigManTitleID"] = "",
		["RestorationModBigManDescID"] = "",
		["RestorationModStaticAimTitleID"] = "Покачивание в прицеле",
		["RestorationModStaticAimDescID"] = "Включает визуальное покачивание во время прицеливания. Требуется перезапуск. ПРИ ОТКЛЮЧЕНИИ, НЕКОТОРУЮ ОПТИКУ БУДЕТ НЕВОЗМОЖНО ИСПОЛЬЗОВАТЬ.",
		["RestorationModViewmodelMovementTitleID"] = "Движение вьювмоделей",
		["RestorationModViewmodelMovementDescID"] = "Стиль движения моделей оружия при кручении камеры. Требует перезапуск.",
		["vm_vanilla"] = "Ванильное",
		["vm_drag"] = "Оружие отстает",
		["vm_lead"] = "Оружие опережает",
		["vm_static"] = "Без движения",
		["RestorationModCarpalTunnelTitleID"] = "Компенсация отдачи",
		["RestorationModCarpalTunnelDescID"] = "Оружие возвращается в изначальное положение, как в ванильной игре.",
		["rr_off"] = "Нет",
		["rr_per_weapon"] = "Частичная",
		["rr_full"] = "Полная",
		["RestorationModWpnCatTitleID"] = "Сортировка меню оружия",
		["RestorationModWpnCatDescID"] = "Изменить порядок оружия в меню покупки. Требуется перезапуск.",
		["RestorationModAutoDMRsTitleID"] = "Авто. марксманские винтовки",
		["RestorationModAutoDMRsDescID"] = "Марксманские винтовки будут сразу установлены в автоматический режим.",
		["RestorationModWpnFireDescopeTitleID"] = "Выход из прицеливания для некоторых оружий",
		["RestorationModWpnFireDescopeDescID"] = "Позволяет временно выйти из режима прицеливания во время стрельбы, чтобы не было ситуаций, когда руки во время анимации проходили через камеру игрока.\nНе работает для оружий, у которых в описании написано про выход из режима прицеливания.",
		["RestorationModSprintCancelTitleID"] = "'Изворотливый' отменяет перезарядку",
		["RestorationModSprintCancelDescID"] = "Пиковый навык \"Изворотливый\" отменит перезарядку при начале бега. Перезарядка во время бега не отменяется.",
		["RestorationModSevenHoldTitleID"] = "Липкие интеракции (Press2Hold)",
		["RestorationModSevenHoldDescID"] = "Для интеракций больше не требуется держать клавишу.",
		["RestorationModSevenHoldDeployCancelTitleID"] = "Снаряжение отменяет интеракцию",
		["RestorationModSevenHoldDeployCancelDescID"] = "Кнопка снаряжения будет отменять текущую интеракцию. Требует включения Липких интеракций.",
		["RestorationModQueuedShootingTitleID"] = "Очередь нажатий",
		["RestorationModQueuedShootingDescID"] = "Включить/выключить занос нажатия на курок в очередь для полуавтоматического оружия.\nПри использовании этой функции выключает оригинальную (ванильную) версию этой настройки.",
		["RestorationModQueuedShootingWindowTitleID"] = "Чувствительность очереди",
		["RestorationModQueuedShootingWindowDescID"] = "Время, которое ваши нажатия будут в очереди, в зависимости от задержки оружия. Чем выше, тем раньше нажатия попадут в очередь.",
		["RestorationModQueuedShootingExcludeTitleID"] = "Ограничение очереди",
		["RestorationModQueuedShootingExcludeDescID"] = "Ограничивает очередь для оружия, которое стреляет быстрее, чем указано в этой настройке.",
		["RestorationModQueuedShootingMidBurstTitleID"] = "Очередь нажатий во время стрельбы оружейной очередью",
		["RestorationModQueuedShootingMidBurstDescID"] = "Заносит нажатия на курок в очередь, если они были сделаны во время стрельбы оружейной очередью.",
		["RestorationModQueuedShootingBurstExcludeTitleID"] = "Ограничение для стрельбы очередями",
		["RestorationModQueuedShootingBurstExcludeDescID"] = "Ограничивает занесение нажатий в очередь, сделанных во время стрельбы очередью из огнестрела, для тех оружий, задержка которых ниже, чем выставленная этой настройкой.",
		["RestorationModNoADSRecoilAnimsTitleID"] = "Отключить отдачу в прицеле",
		["RestorationModNoADSRecoilAnimsDescID"] = "Отключает анимацию отдачи во время прицеливания. Опция не влияет на некоторое оружие (луки, огнеметы)",
		["RestorationModNoSwapOnReviveTitleID"] = "Отключить переключение оружия после поднятия",
		["RestorationModNoSwapOnReviveDescID"] = "Когда вас поднимут, оружие больше не будет переключаться с вторичного на основное.",
		["RestorationModManualReloadsTitleID"] = "Перезарядка вручную",
		["RestorationModManualReloadsDescID"] = "Выключает автоматическую перезарядку, когда магазин оружия пуст.",
		["RestorationModSecondSightSprintTitleID"] = "Кнопка спринта включает второй прицел",
		["RestorationModSecondSightSprintDescID"] = "Переключаться между прицелами с помощью кнопки спринта, а не гаджета. С этой настройкой нельзя использовать спринт во время прицеливания, а кнопка гаджета будет включать и выключать гаджеты даже во время прицеливания.",
		["RestorationModAimDeploysBipodTitleID"] = "Прицеливание с сошками",
		["RestorationModAimDeploysBipodDescID"] = "Кнопка прицеливания развернет сошки, если имеется такая возможность.",
		["RestorationModMoveCancelBipodTitleID"] = "Движение убирает сошки",
		["RestorationModMoveCancelBipodDescID"] = "Клавиши движения развернут сошки.",
		["RestorationModSeparateBowADSTitleID"] = "Прицеливание луков",
		["RestorationModSeparateBowADSDescID"] = "Отключает автоматическое прицеливание при стрельбе из лука. Клавиша перезарядки опускает заряженную стрелу.",
		["RestorationModPerPelletShotgunsTitleID"] = "Урон от дробовика за каждую дробинку (WIP)",
		["RestorationModPerPelletShotgunsDescID"] = "Урон от дробовика рассчитывается за каждую дробинку в отличие от стандартного \"1 дробинка = полный урон, приоритет отдается выстрелам в голову\". Урон от дробовика, наносимый обычной дробью, увеличен, чтобы компенсировать потерю урона при промахе дробинками. Требуется перезагрузка.",
		["RestorationModClassicMoviesTitleID"] = "Классический фон подготовки",
		["RestorationModClassicMoviesDescID"] = "Включить или выключить фон экрана подготовки из PD:TH при игре на Классических ограблениях.",

		["vanilla_on_rails"] = "Стандартный/рельсовый",
		["kf_mw_style"] = "Стиль KF1/CoD",
		["tilt_in"] = "Наклон",

		["base_wpn_cat"] = "Основной навык",
		["sub_wpn_cat"] = "Саб-категория и урон",

		["RestorationModWepNamesTitleID"] = "Названия оружия",
		["RestorationModWepNamesDescID"] = "Стиль названия оружия и модулей. Требуется перезапуск.",
		["resmod_res_names"] = "Кириллица",
		["resmod_no_nicknames"] = "Латиница",
		["dmcwo_reelnames"] = "Реальные (DMCWO)",
		["resmod_no_renames"] = "Ванильные",

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
		["RestorationModPresenterDescID"] = "Включить или выключить презентер из альфа-версии игры, который используется при захвате добычи и для напоминания о задачах.",
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
		["RestorationModDistrictDescID"] = "Включить или выключить описания районов в CRIME.NET. Описания не соответствуют геймплею.",
		["RestorationModSCOptionsButtonTitleID"] = "Опции Restoration Overhaul",
		["RestorationModSCOptionsButtonDescID"] = "Опции Restoration Overhaul",
		["RestorationModSCTitleID"] = "Complete Overhaul (DEBUG)",
		["RestorationModSCDescID"] = "Enable or disable Restoration's complete game overhaul. Toggling this option will automatically exit your game to prevent save corruption.",
		["RestorationModBotsNoDropTitleID"] = "Отключить сброс сумок у ботов",
		["RestorationModBotsNoDropDescID"] = "Боты больше не будут сбрасывать мешки.",
		["RestorationModCloakerTurnTitleID"] = "Пинок Клокера: Поворачивать камеру",
		["RestorationModCloakerTurnDescID"] = "Камера будет поворачиваться на Клокера, когда он вас пинает, как в ванилле.",
		["RestorationModDisableMutatorColorsTitleID"] = "Выключить смену цвета баннера штурма",
		["RestorationModDisableMutatorColorsDescID"] = "Выключает смену цвета баннера штурма, вызванное использованием мутаторов (работает только с обычным баннером).",
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
		["restoration_level_data_watchdogs_1_night"] = "1:10, Грузовик с мясом",
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
		["restoration_level_data_kenaz"] = "20:00, Лас-Вегас-Стрип-Казино 'Голден Грiн'",
		["restoration_level_data_jolly"] = "16:00, Лос-Анджелес - Зона катастрофы",
		["restoration_level_data_red2"] = "14:15, ЦЕНТР ГОРОДА - ПЕРВЫЙ ВСЕМИРНЫЙ БАНК",
		["restoration_level_data_dinner"] = "08:01, Район скотобойни - в засаде!",
		["restoration_level_data_nail"] = "00:00, Тихий холм",
		["restoration_level_data_haunted"] = "??:??, 'Убежище'",
		["restoration_level_data_pbr"] = "04:40, Невада - Исследовательский центр 'Блекридж'",
		["restoration_level_data_pbr2"] = "ВРЕМЯ НЕИЗВЕСТНО, Z-170 'ЗЕВС' - Грузовой самолет Murkywater",
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
		["restoration_level_data_dah"] = "01:30, 22 этаж - Небоскреб Гарнет Груп",
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
		["restoration_level_data_nmh_res"] = "20:24, Госпиталь 'Милосердие' - Изоляционная палата",
		["restoration_level_data_vit"] = "13:07, Вашингтон - Белый дом",
		["restoration_level_data_mex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, США - Южная граница",
		["restoration_level_data_mex_cooking"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - база Койопов",
		["restoration_level_data_bex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Банк Сан Мартин",
		["restoration_level_data_pex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Полицейский участок",
		["restoration_level_data_fex"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Мексика - Особняк Булука",
		["restoration_level_data_chas"] = "20:30, Сан Франциско - Чайнатаун",
		["restoration_level_data_sand"] = "22:30, Сан Франциско - Порт",
		["restoration_level_data_chca"] = "21:24, Залив Сан Франциско - Лайнер Black Cat",
		["restoration_level_data_pent"] = "23:30, Сан Франциско - Пентхаус Юфу Венга",
		["restoration_level_data_ranc"] = "18:24, Техас - Ранчо Мидленд",
		["restoration_level_data_trai"] = "19:40, Форт-Уэрт - Дэлтон Ярд",
		["restoration_level_data_corp"] = "8:35 PM, Даллас - Исследовательский центр корпорации SERA",
		["restoration_level_data_deep"] = "9:00 PM, Мексиканский залив - Нефтяная вышка корпорации SERA",
		["restoration_level_data_wetwork"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_junk"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, ЛОКАЦИЯ ЗАСЕКРЕЧЕНА",
		["restoration_level_data_holly"] = "5:00 PM, Los Angeles - Lukas' Mansion",
		["restoration_level_data_lvl_friday"] = "17:00, Торговый центр 'Щит'",
		["restoration_level_data_skm_nightmare_lvl"] = "Прачечная? Хочешь отмыть грехи?",
		["restoration_level_data_bluewave"] = "ВРЕМЯ ЗАСЕКРЕЧЕНО, Склад Aurelian",
		["restoration_level_data_secret_stash"] = "18:00, Заброшенное здание",
		["restoration_level_data_bridge"] = "22:45, Мост Грин - южная сторона",
		["restoration_level_data_four_stores_remixed"] = "13:20, Магазины",


         --custom heists
		["restoration_level_data_flatline_lvl"] = "10:26 PM, Больница им. Н.И. Пирогова", --Flatline
		["restoration_level_data_ahopl"] = "9:06 PM, Yuri's Private Club", --A House of Pleasure
		["restoration_level_data_atocl"] = "7:03 PM, Penthouse Party", --A Touch of Class
		["restoration_level_data_rusdl"] = "10:23 AM, Garnet Group Jewelery Store", --Cold Stones
		["restoration_level_data_crimepunishlvl"] = "1:19 PM, Correctional Facility Somewhere in Russia", --Crime and Punishment
		["restoration_level_data_deadcargol"] = "8:36 PM, Sewers Under The Depot", --Deadly Cargo
		["restoration_level_data_hunter_party"] = "3:56 PM, Nikolai's Penthouse", --Hunter and Hunted d1
		["restoration_level_data_hunter_departure"] = "10:13 PM, Aleksandr's Private Airport", --Hunger and Hunted d2
		["restoration_level_data_hunter_fall"] = "1:36 AM, Somewhere Over International Waters", --Hunter and Hunted d3
		["restoration_level_data_ruswl"] = "11:50 AM, Somewhere in Russia", --Scorched Earth

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

		["heist_contact_shatter"] = "Джекел",
		["heist_contact_akashic"] = "Нико",

		["menu_contacts_shatter"] = "Союзники CRIMENET",
		["heist_contact_jackal_description"] = "Джекел начал свою карьеру в GenSec, но уволился после инцидента, связанного с торговлей людьми, в котором были замешаны GenSec и OMNIA.\n\nТеперь он работает на CRIMENET, поставляя проблемы им прямо на дом.",
		["heist_contact_akashic_description"] = "В прошлом - высокопоставленный агент Гектора Моралеса, Николас 'Нико' Рене теперь командует остатками Синалоанского картеля в США. \nИх численность мала, и более крупный Колумбийский картель не собирается ни предоставлять помощь, ни восстанавливать союз с CRIMENET. Нико объединяется с различными мелкими бандами на Восточном побережье, а также с CRIMENET - он предоставит свои ресурсы в обмен на услуги.",


		["bm_msk_shatter_true"] = "Шаттер",
		["bm_msk_shatter_true_desc"] = "Легендарная маска, о которой говорят вполголоса.\n\nРазумеется, это просто дубликат.\n\nВ настоящей маске есть кое-что особенное, но думаю, вас устроит и копия.\n\nФеникс символизирует перерождение того, кто не может быть убит. Попробуй его уничтожить, и он лишь нанесет огненный контр-удар.",
		["menu_l_global_value_veritas"] = "Restoration Mod",
		["menu_l_global_value_veritas_desc"] = "Это предмет из Restoration Mod!",

		["menu_alex_1_zipline"] = "Зиплайн для сумок",

		["menu_asset_wet_intel"] = "Разведданные",
		["menu_asset_risk_murky"] = "Наемники Murkywater",
		["menu_asset_risk_bexico"] = "Мексиканская федеральная полиция",
		["menu_asset_risk_zombie"] = "зОмбИ пОлиЦиЯ",
		["menu_asset_wet_boat"] = "Лодка",
		["menu_asset_wet_boat_desc"] = "Купить дополнительную точку сброса и побега",

		["bm_msk_canada"] = "Адский хоккей",
		["bm_msk_canada_desc"] = "Ничего не оставляйте позади - даже когда становится жарко, вы сражаетесь за что хотите, когда хотите (даже если это термобарическая бомба).",
		["bm_msk_jsr"] = "Миссис Граффити",
		["bm_msk_jsr_desc"] = "Создана настоящим художником. Стирать граффити - все равно, что сжигать книги, не так ли?\n\nИскусство это искусство - его нужно уважать.",
		["bm_msk_jsrf"] = "Mистер Граффити",
		["bm_msk_jsrf_desc"] = "За каждым граффити стоит история. Быть художником в безликом городе может быть болезненно.\n\nГраффити - словно книга. Их нужно уметь читать.",
		["bm_msk_courier_stash"] = "Сумка для добычи",
		["bm_msk_courier_stash_desc"] = "Если нужно взять несколько лишних сотенных купюр, а в карманах уже не осталось места, эта маска вполне сойдет.",

		["bm_msk_female_mask"] = "Стандартная маска (женская)",
		["bm_msk_female_mask_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.",
		["bm_msk_female_mask_blood"] = "Восстановленная маска (женская)",
		["bm_msk_female_mask_blood_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.\n\nЭта маска была обнаружена после неудачного ограбления склада OMNIA, среди кровавого побоища.\n\nПоследним посланием банды, прежде чем они пропали навсегда, было ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_female_mask_clown"] = "Рози",
		["bm_msk_female_mask_clown_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.\n\nЭту маску носила грабитель, известная как Рози, хотя теперь у нее новая маска.\n\nНа видеозаписи с ограбления было видно, как она обезвреживает целый отряд спецназа совершенно без оружия.",
		["bm_msk_male_mask"] = "Стандартная маска (мужская)",
		["bm_msk_male_mask_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.",
		["bm_msk_male_mask_blood"] = "Восстановленная маска (мужская)",
		["bm_msk_male_mask_blood_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.\n\nЭта маска была обнаружена после неудачного ограбления склада OMNIA, среди кровавого побоища.\n\nПоследним посланием банды, прежде чем они пропали навсегда, было ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_male_mask_clown"] = "Кросс",
		["bm_msk_male_mask_clown_desc"] = "Стандартная маска, предоставляемая организацией CRIMENET.\n\nСделана из плотного материала, носить ее не так просто, зато она прочная.\n\nЭту маску носил грабитель, известный как Кросс, хотя теперь у него новая маска.\n\nКросс - талантливый стрелок, и однажды вывел из строя четыре бронегрузовика за пять секунд.",

		["bm_msk_twister_mask"] = "Человек-загадка",
		["bm_msk_twister_mask_desc"] = "Кто скрывается за этой маской - загадка.\n\nМожет, это какой-нибудь незнакомец, а может - кто-нибудь, кого вы знали все это время.",
		["bm_msk_voodoo_mask"] = "Темная магия",
		["bm_msk_voodoo_mask_desc"] = "Эта маска была найдена в джунглях после бомбардировки - она смогла вынести последствия разрушений, и теперь считается предвестником беды.\n\nОна найдет вас, когда вы будете нуждаться в ней больше всего и поможет пережить беду.\n\nВопрос лишь в том, какой ценой.",

		["bm_msk_f1"] = "Шлем X1",
		["bm_msk_f1_desc"] = "Не забывайте о защите, когда будете нестись по шоссе или проскальзывать через пробки.\n\nЭтот шлем защитит от жесткого падения, но явно не от пуль.",
		["bm_msk_f1_b"] = "Шлем X1 (Чистый)",
		["bm_msk_f1_b_desc"] = "Не забывайте о защите, когда будете нестись по шоссе или проскальзывать через пробки.\n\nЭтот шлем защитит от жесткого падения, но явно не от пуль.\n\nЭто дубликат шлема, без брендовых стикеров, который был найден в гараже с дорогими машинами.\n\nДержите этот шлем под рукой, и может быть однажды, вы поедете на одной из таких.",
		["bm_msk_sweettooth"] = "Сладкоежка",
		["bm_msk_sweettooth_desc"] = "Сладкоежка (настоящее имя - Маркус 'Нидлс' Кейн) - персонаж из серии игр Twisted Metal. Сладкоежка известен как клоун-убийца, который водит боевой фургончик с мороженым.\n\nГоворят, однажды он сбежал из психиатрической лечебницы. Теперь он ведет криминальную жизнь.",

		["bm_msk_wolf_stone"] = "Вульф из Stonecold",
		["bm_msk_wolf_stone_desc"] = "Оригинальная маска Вульфа, которую он носил, когда впервые сошел с ума и начал воплощать преступления из своих любимых игр. Считалось, что эта маска была утеряна во время ограбления, вдохновленного игрой ‘Hyper Heisting’.\n\nВо время ранних ограблений банды, маска нашлась и была доставлена в убежище одним из сообщников Бейна.\n\nОригинальный узор маски со временем потускнел, совсем как психическая стабильность Вульфа.",

		["bm_msk_thespian"] = "Thespian",
		["bm_msk_thespian_desc"] = "Thespian is a superhuman solider of fortune. In the future, space marines like Thespian protect the world of mankind and its space colonies from forces of evil\n\nHis helmet is a popular gift in the criminal underworld and is given to thieves, thugs and career criminals who show their loyalty and patience to the syndicate.",

		["bm_msk_dallas_aged"] = "Древний Даллас",
		["bm_msk_dallas_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но ее содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_chains_aged"] = "Древний Чейнс",
		["bm_msk_chains_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но ее содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_hoxton_aged"] = "Древний Хокстон",
		["bm_msk_hoxton_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но ее содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",
		["bm_msk_wolf_aged"] = "Древний Вульф",
		["bm_msk_wolf_aged_desc"] = "Вы с бандой обнаружили эти маски в странной египетской шкатулке, найденной в Скале Генри. Сама шкатулка оказалась утеряна при перевозке, но ее содержимое было передано вам.\n\nВ этих масках есть что-то необычное. Нет информации, откуда они могли появиться.\n\nДжекел считает, что они могли быть сделаны в качестве практичной шутки, чтобы напугать банду.\n\nОднако вы замечаете, что эти маски выглядят очень, очень старыми.",

		["bm_msk_beef_dallas"] = "Мясной Даллас",
		["bm_msk_beef_dallas_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nДаллас решил оставить дизайн своей полюбившейся маски.",
		["bm_msk_beef_chains"] = "Мясной Чейнс",
		["bm_msk_beef_chains_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nЧейнс, будучи силовиком, захотел в качестве дизайна устрашающее животное. Что может быть страшнее, чем чертов динозавр?!",
		["bm_msk_beef_hoxton"] = "Мясной Хокстон",
		["bm_msk_beef_hoxton_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nХокстон оставил простой список пожеланий для своей маски:\n- Защищающая!\n- Эффективная!\n- Стильная!\n\nТак и получилась эта маска.",
		["bm_msk_beef_wolf"] = "Мясной Вульф",
		["bm_msk_beef_wolf_desc"] = "Банда использовала эти маски во время ограбления 'Скотобойня'.\n\nДизайн Вульфа был вдохновлен его любимым персонажем, которого он придумал, когда еще разрабатывал игры.",

		["bm_msk_vyse_dallas"] = "Источник",
		["bm_msk_vyse_dallas_desc"] = "Vyse сразился лицом-к-лицу с самым дьявольским из дьяволов. Vyse выжил, а из костей дьявола сделали эту маску.",
		["bm_msk_vyse_chains"] = "Детская игра",
		["bm_msk_vyse_chains_desc"] = "Хоть Vyse и украл больше денег и золота, чем поместится в Форт-Нокс, у него хватает сердца, что бы поделиться частью добычи с больными детьми.\n\nОднажды, Бейн посетил этих детей - эта маска была их благодарностью для Vyse.",
		["bm_msk_vyse_hoxton"] = "Три балбеса",
		["bm_msk_vyse_hoxton_desc"] = "Говорят, если провалишься - нужно перетерпеть боль и попытаться снова. Vyse не был согласен. Каждый раз, когда он проигрывал, он шел вперед, не смотря ни на что. Даже Ларри, Керли и Мо не выдержали бы такого.",
		["bm_msk_vyse_wolf"] = "Беар Гриллс",
		["bm_msk_vyse_wolf_desc"] = "Vyse однажды вызвал Беара Гриллса на поединок по распитию урины... Vyse победил, и Мистер Гриллс использовал свои навыки выживания при создании этой маски.",

		["bm_msk_secret_old_hoxton"] = "Секретный Хокстон",
		["bm_msk_secret_old_hoxton_desc"] = "Хокстон покинул родной край ради больших денег. Когда Бейн рассказал ему о Секрете, ему понравилась идея искать древние артефакты - ведь они стоят дорого. Хокстону было совсем неважно, существует ли некая древняя сила или нет.",

		["bm_msk_secret_clover"] = "Секретная Кловер",
		["bm_msk_secret_clover_desc"] = "Когда Бейн рассказал Кловер о Секрете, она отнеслась скептически - ей всегда казалось, что легенды Бейна о древних артефактах с мифической силой были сильно преувеличены. Но когда она лично увидела сбор трех шкатулок, ни о каких сомнениях больше не было и речи.",

		["bm_msk_secret_dragan"] = "Секретный Драган",
		["bm_msk_secret_dragan_desc"] = "Как бывший полицейский, Драган всегда хорошо умел искать улики, и когда Бейн показал ему свое расследование Секрета, он был готов к охоте за древними артефактами.",

		["bm_msk_secret_bonnie"] = "Секретная Бонни",
		["bm_msk_secret_bonnie_desc"] = "Бонни, услышав от Бейна о секрете, сделала большой глоток своего любимого виски и закричала о том, что готова 'набить рожу Катару'.",

		["bm_msk_secret_sydney"] = "Секретная Сидни",
		["bm_msk_secret_sydney_desc"] = "Когда Сидни услышала о секрете от Бейна, она не поверила в легенды о древней силе. Тем не менее, возможность сразиться с неизвестной, но крайне опасной организацией достаточно заинтересовала ее.",

		["bm_msk_secret_richard"] = "Секретный Ричард",
		["bm_msk_secret_richard_desc"] = "По криминальному миру ходили слухи о киллере, которым вдохновлялся Джекет; киллер, который был ликвидирован неизвестной организацией. Когда Джекет услышал о секрете от Бейна, он вернулся с маской, похожей на ту, что носил его прародитель.",

		["bm_all_seeing"] = "Всевидящий якорь",
		["bm_all_seeing_desc"] = "Ужасающее видение, кошмарное зрелище.\n\nВысшие силы увидели вас и решили наградить.",

		["bm_msk_classic_helmet"] = "Классический силовик",
		["bm_msk_classic_helmet_desc"] = "Подарок от бывшего спецназовца. Прежде чем уйти на пенсию, он вычислил Джекела... И подарил ему единственную экипировку, которая у него осталась, чтобы помочь работе Джекела.\n\nЭто странное событие было не без причины: Он увидел своими глазами то, что OMNIA держала в тайне. Но он не стал копать эти тайны и вскоре покинул спецназ навсегда.\n\nДжекел прислал эти шлемы вам, в качестве награды за вашу помощь.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Push the placeholder, we'll get around to it.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "Маска Джекела. Точнее, ее копия.\n\nНастоящая маска слишком важна для Джекела, по слухам, в ней полно чувствительной электронники.\n\nВ этой копии система дисплея очень простая и служит просто чтобы быть похожей на оригинал.\n\nПодарок за ваши старания.",


		["bm_msk_finger"] = "Наглец",
		["bm_msk_finger_desc"] = "Наглец - мифическое существо, которое существовало в мире давным-давно. Существо гонялось и вредило обычным деревенским и городским жителям, охотясь на них различными способами. Наглецу нравилось это делать, и он был угрозой покою, пока он не был обнаружен и уничтожен людьми Короля.",

		["bm_msk_instinct"] = "Интуиция",
		["bm_msk_instinct_desc"] = "Эта маска принадлежала мифическому войну из далеких земель. Он путешествовал по всему миру, полагаясь на интуицию, и охотился на злые силы. Он прошел через многие подземелья и победил тысячи злых существ на своем пути. В конце концов, он ушел на покой, зная, что его дело продолжат будущие поколения.",

		["bm_msk_unforsaken"] = "Неупокоенный",
		["bm_msk_unforsaken_desc"] = "Эта легендарная маска - знак благодарности нашему сообществу за упорство и поддержку. От нас, команды OVERKILL - мы благодарны вам.\n\nЧерез огонь и медные трубы, пусть шлемы продолжают лететь.",

		["bm_msk_chains_halloween"] = "Разбитый щит",
		["bm_msk_chains_halloween_desc"] = "Будучи наемником, приходится видеть большое количество боли и смерти. Даже если вам кажется что вы бессмертны и бесстрашны... Иногда, плохие воспоминания добираются до вас.\n\nВ светлый, снежный и прекрасный октябрьский день 2008-го года, Чейнс отсыпался. Недавно выполнив контракт на убийство от Murkywater, он получил деньги и неплохую комнату в отеле, где и спал.\n\nВпервые за много лет, ему приснился кошмар. Он не помнит его во всех подробностях, но он проснулся от паралича, и образ, напоминающий скелет, стоял над ним, пока он не мог пошевелиться.\n\nКаждый раз, когда он выполнял грязную работу, его последующие ночи были бессонными и ужасными.\n\nВ конце концов, ему пришлось сказать 'Хватит.', покинуть свою работу наемником и обратиться к психотерапевту. Ему прописали лекарства. На год жизнь стала хорошей...\n\nРовно через год, 31 октября 2009-го, компания Murkywater решила, что уволившийся человек собирается раскрыть секреты организации. Для них это непозволительно.\n\nЧейнс бросился в криминальную жизнь, чтобы спасти себя, и снова стал солдатом.\n\nНо в этот раз все было по-другому. Кошмары и паралич не вернулись. Он не собирался приносить страдания другим людям.\n\nВ этот раз, ему нужно было защитить себя.",

		["bm_msk_dallas_halloween"] = "Отражение монстра",
		["bm_msk_dallas_halloween_desc"] = "Тратя годы на выдумывание несуществующих личностей и историй, легко потерять настоящего себя.\n\nТы начинаешь перепрыгивать от личности к личности, подбирать черты своих друзей, любовниц и приятелей. Иногда они сливаются вместе, и ты начинаешь чувствовать себя невнятной смесью.\n\nДаллас проснулся октябрьским утром и взглянул в зеркало - его волосы были окрашены в дурацкий блондинистый цвет, а борода неровно побрита. На нем был безвкусный костюм, покрытый потом после жутких кошмаров. Его голова болела после выходных, проведенных на дне бутылки.\n\nВзглянул на себя, он подумал, что больше похож на монстра Франкенштейна, чем на человека: Просто сборные части, которые достаточно убедительны, чтобы презентовать себя в криминальной карьере.\n\nЭто утро было переломным моментом, но Далласу до сих пор иногда кажется, что не все его черты характера действительно принадлежат ему.",

		["bm_msk_hoxton_halloween"] = "Хеллоуинский сон",
		["bm_msk_hoxton_halloween_desc"] = "Одним из хеллоуинских воспоминаний Хокстона было посещение Нью-Йорка с дальними родственниками.\n\nЕму никогда не нравились конфеты, но он обожал тыквенный пирог, который подавали на вечеринке его родственника.\n\nКогда он вышел прогуляться с вечеринки, он увидел большую дверь хранилища, в которое завозили различные богатства.\n\nС тех пор он загорелся идеей ограблений во время праздников.",

		["bm_msk_wolf_halloween"] = "Плач дьявола",
		["bm_msk_wolf_halloween_desc"] = "Холодным октябрьским вечером 2010-го, Вульф до сих пор пытался выбраться из финансового кризиса после того, как его компания закрылась.\n\nОн лежал в гостинице, в полном одиночествеЮ и думал о своей семье, о том, что он их подвел и может их больше не увидеть - отрезанный от них целым океаном.\n\nОн потратил последние сбережения на поездку в США, в попытке накопить достаточно денег, чтобы начать сначала в новом доме, но он провалился.\n\nНесколько недель спустя, бродя по домам друзей, гостиницам и убежищам, ему позвонила его любимая, впервые за долгое время.\n\nОтношениям конец. 'Не вижу, как это может хорошо закончиться.'\n\nМожет, это и был повод начать сначала.\n\nМожет, настало время попробовать новую карьеру.",


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
		["RestorationModDownsThreePlusTitleID"] = "Счетчик падений (при 3+ падений)",
		["RestorationModDownsTwoTitleID"] = "Счетчик падений (при 2 падениях)",
		["RestorationModDownsOneTitleID"] = "Счетчик падений (при 1 падении)",
		["RestorationModDownsZeroTitleID"] = "Счетчик падений (при 0 падений)",
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
		["RestorationModNewsFeedStyleTitleID"] = "Alpha Newsfeed Style",
		["RestorationModNewsFeedStyleDescID"] = "Allows you to choose to show both newsfeed and newheists box or just the newsfeed.",
		["alpha_assault"] = "Уголок",
		["beta_assault"] = "Лента",
		["show_both"] = "Default",
		["show_classic_newsfeed"] = "Classic",

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
		["heist_junker_brief"] = "Это работа на Влада. После неудачной сделки его люди и товар оказались в тяжелом положении - федералы уже близко. Мы подготовили транспорт, чтобы доставить вас к месту сделки, где вы будете обеспечивать прикрытие. Мы пришлем вертолет и эвакуируем оттуда вас вместе с товаром.\n\nРабота не очень долгая, но не стоит недооценивать полицию. Экипируйтесь для боя.",
		["heist_junk_name"] = "Сторожи",
		["heist_junk_brief"] = "Стройплощадка уже близко. Копы еще не прибыли, но будут на месте очень скоро. Ребята Влада обеспечат вам прикрытие, но скорее всего не смогут держаться долго.\n\nГоворят, на месте есть мет-лаборатория, поэтому можете попробовать сварить себе премию, если сможете одновременно уследить за товаром Влада.",
		["junk_01"] = "ЗАЩИЩАТЬ ДЕНЬГИ И НАРКОТИКИ",
		["junk_01_desc"] = "Держите копов подальше от товара! И кокаин, и деньги должны быть в безопасности.",
		["junk_02"] = "ПОСТАВИТЬ КАНИСТРЫ И ВЫСТРЕЛИТЬ В КАЖДУЮ ИЗ НИХ",
		["junk_02_desc"] = "Зажгите костер, который оповестит пилота о вашей позиции.",
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
		["obj6_wait_desc"] = "Взлом завершен. Отправьте данные Джекелу.",
		["obj7_escapeorloot"] = "ДОСТУПНА ЭВАКУАЦИЯ",
		["obj7_escapeorloot_desc"] = "Эвакуируйтесь, как только будете довольны наградой.",

		["heist_int_dock_burn_name"] = "Выгорание",
		["heist_int_dock_burn_brief"] = "Нет времени продумывать план, они собираются перевозить мастер-серверы.\nВодитель подвезет грузовик с вооруженными клоунами прямо к воротам.",
		["heist_wetwork_burn_name"] = "Выгорание",
		["heist_wetwork_burn_brief"] = "Итак, мы почти у места. Вы уже были здесь, но в этот раз мы вторгаемся с шумом.\nВозможно, тут еще осталась добыча, но это не главное.\n\nИщите все, что поможет вам узнать, что внутри закрытых контейнеров. Камеры, вещи вокруг контейнеров, надписи на досках и тому подобное.",
		["wwburn_01"] = "ПОДГОТОВИТЬСЯ",
		["wwburn_01_desc"] = "Мы у главных ворот, наемники будут повсюду, поэтому готовьтесь к перестрелке.",
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
		["menu_jukebox_screen_m7"] = "Pre-Planning",
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

		["resmod_challenges"] = "Испытания",
		["resmod_challenges_hint"] = "Посмотреть выполненные и активные испытания.",
		["resmod_active_challenges"] = "Активные испытания",
		["resmod_active_challenges_hint"] = "Текущие и активные испытания.",
		["resmod_completed_challenges"] = "Выполненные испытания",
		["resmod_completed_challenges_hint"] = "Завершенные испытания.",

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

		["ch_bridge_no_bleedouts_hl"] = "Зеленый Мост: непробиваемый",
		["ch_bridge_no_bleedouts"] = "Завершите контракт \"Зеленый мост\" на уровне сложности \"Сложно\", \"Очень Сложно\" или \"OVERKILL\", ни разу не упав",
		["ch_duck_hunting_hl"] = "Мост слишком далеко!",
		["ch_duck_hunting"] = "Завершите контракт \"Зеленый мост\" на уровне сложности \"Сложно\", \"Очень Сложно\" или \"OVERKILL\". Для выполнения необходимо играть контракт с самого начала",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "ТОЛСТАЯ БРОНЯ, БОЛЬШИЕ ПУШКИ",
		["ch_watchdogs_d1_heavy_wpn1"] = "Пройти первый день ограбления 'Сторожевые псы', используя только УКТЖ, миниганы, ракетометы или снайперскую винтовку Thanatos, на уровни сложности OVERKILL или выше. Для выполнения этого испытания, ограбление нужно играть с самого начала.",

		-- New challanges
		["ch_melee_test"] = "Босс качалки",
		["ch_melee_test_desc"] = "Убейте капитана Отема кулаками",
		["ch_pro_job_test"] = "Даже армия не остановит нас",
		["ch_pro_job_test_desc"] = "Завершите контракт \"Поджигатель\" с модификатором Pro Job на уровне сложности \"Хаос\" и выше            ",
		["ch_summers_test"] = "Да не горит у меня!!!",
		["ch_summers_test_desc"] = "Убейте капитана Саммерса огнеметом Mk.1",
		["ch_winters_test"] = "Торжество несправедливости",
		["ch_winters_test_desc"] = "Убейте капитана Винтерса ножом-бабочкой или выкидным ножом, пока он держит щит",
		["ch_spring_test"] = "У меня волына больше",
		["ch_spring_test_desc"] = "Убейте капитана Спринга миниганом Вулкан или микроганом XL 5.56",

		["ch_pdth_style_fwb"] = "Старая школа: Первый Всемирный Банк",
		["ch_pdth_style_fwb_desc"] = "Завершите контракт \"Первый Всемирный Банк\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_heat"] = "Старая школа: Схватка на улице",
		["ch_pdth_style_heat_desc"] = "Завершите контракт \"Схватка на улице\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_panic"] = "Старая школа: Комната паники",
		["ch_pdth_style_panic_desc"] = "Завершите контракт \"Комната паники\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_bridge"] = "Старая школа: Зеленый мост",
		["ch_pdth_style_bridge_desc"] = "Завершите контракт \"Зеленый мост\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_diamond"] = "Старая школа: Кража бриллиантов",
		["ch_pdth_style_diamond_desc"] = "Завершите контракт \"Кража бриллиантов\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_slaughterhouse"] = "Старая школа: Скотобойня",
		["ch_pdth_style_slaughterhouse_desc"] = "Завершите контракт \"Скотобойня\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_counterfeit"] = "Старая школа: Подделка",
		["ch_pdth_style_counterfeit_desc"] = "Завершите контракт \"Подделка\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_undercover"] = "Старая школа: Под прикрытием",
		["ch_pdth_style_undercover_desc"] = "Завершите контракт \"Под прикрытием\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",
		["ch_pdth_style_nomercy"] = "Старая школа: Нет милосердию",
		["ch_pdth_style_nomercy_desc"] = "Завершите контракт \"Нет милосердию\" на уровне сложности OVERKILL или выше, надев костюм-двойку или ЛББ, не потратив ни одного очка навыков в деревья навыков, используя набор перков Прирожденный или Перерожденный, приклад и оружия из PD:TH",

		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "Статус",
		["menu_state_filter"] = "Фильтр по статусу",
		["menu_state_filter_help"] = "Показывает статус лобби",
		["menu_state_lobby"] = "В лобби",
		["menu_state_loading"] = "Загружается",
		["menu_state_ingame"] = "В игре",


		["menu_description"] = "План",
		-- ///Stuff ripped from the various locale files we had ///

		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "Меч Безголового Бульдозера",
		["bm_melee_titham"] = "Молот Безголового Бульдозера",
		["menu_l_global_value_halloween_sword"] = "Это предмет из Хеллоуина 2013!",
		--Zweihander
		["bm_melee_zweihander"] = "Двуручник",
		["bm_melee_zweihander_info"] = "Огромный двуручный меч, который больше похож на алебарду, нежели чем меч.\n\nПарирование противника наносит ему #{skill_color}#180## урона в ближнем бою. Навыки позволяют увеличить этот урон.",
		["bm_melee_broad"] = "Длинный меч",
		["bm_melee_broad_info"] = "Самое знаковое оружие большинства рыцарей.",
		--Toasty
		["bm_melee_toast"] = "Тост Алмира",
		["bm_melee_toast_info"] = "Ты - не ты, когда голоден.\n\nУменьшает получаемый урон на #{skill_color}#10%## во время замаха.",

		--S&W .500
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
		["heist_no_mercy_ranted_brief"] = "Мы отправляется в госпиталь 'Милосердие' за кровью. У местного пациента обнаружили какой-то редкий вирус, образец которого нам нужно заполучить. Пусть вас ничего не останавливает, ибо платят очень хорошо. Конец света не наступит, если мы прольем немного крови за большие деньги, не так ли?",

		["heist_nmh_res_name"] = "Госпиталь 'Милосердие'",
		["heist_nmh_res_brief"] = "Нашему клиенту нужен образец крови пациента, находящегося в отделе интенсивной терапии в госпитале 'Милосердие'. Вам нужно будет войти туда, вырубить камеры, проконтролировать толпу и дать мне доступ в базу данных, чтобы я смог найти цель. Учитывая слабую охрану там, это должна быть чистая и красивая работа. Я заберу вас с крыши, когда вы закончите. Работа немного мутная, заказана через третьих лиц, у которых есть знакомые в военной сфере, но это стоит того. За работу мы получим кое-что, что нам пригодится в будущем, и довольно неплохие деньги.",

		["heist_nmh_new"] = "Возьмите и протестируйте кровь у пациента",
		["heist_nmh_new_desc"] = "Вам нужно найти центрифугу и проверить образцы крови.",

		["heist_nmh_new2"] = "Вызовите лифт",
		["heist_nmh_new2_desc"] = "Нажмите кнопку и ожидайте лифт",

		["heist_nmh_new3"] = "Вызовите лифт",
		["heist_nmh_new3_desc"] = "Нажмите кнопку и ожидайте лифт",

		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "Банк GO - Ремастер",

		["heist_gobank_v2_name"] = "Банк GO - Ремастер",
		["heist_gobank_v2_brief"] = "Классическое ограбление банка. Взломайте хранилище, опустошите клиентские ячейки и вынесите ценности. Бэйн говорит, что у этих банков самый низкий рейтинг ограблений в стране. Пора изменить это.\n\n» Найдите ключ-карты. Для хранилища нужно две\n» Если не получится - используйте термобур\n» Взломайте клиентские ячейки\n» Соберите небесный крюк\n» Вытащите деньги",

		["heist_roberts_v2_name"] = "Банк Робертс",
		["heist_roberts_v2_brief"] = "У нас есть наводка на банк. Не самый большой, но есть информация, что в его хранилище временно хранится очень много наличных. Иностранная валюта для обмена.\n\nВ любом случае, вы знаете, как действовать: как вам захочется. Тихо прокрадитесь в банк или устройте пекло и погром. В любом случае, я знаю, как вытащить оттуда деньги. Вы узнаете, о чем я, когда увидите. Я думаю, вам это понравится.",

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
		["heist_heat_street_new_brief"] = "Говорят, что ничего не бывает наверняка, но эта работа выглядит как нельзя проще: зайти, взять кейс, уйти. Ваш доверенный водитель Мэтт будет ждать вас в ближайшей аллее, и, если вы доберетесь до фургона, все пройдет как по маслу.",
		["heist_street_new_name"] = "Схватка на улице (классика)",
		["heist_street_new_brief"] = "Говорят, что ничего не бывает наверняка, но эта работа выглядит как нельзя проще: зайти, взять кейс, уйти. Ваш доверенный водитель Мэтт будет ждать вас в ближайшей аллее, и, если вы доберетесь до фургона, все пройдет как по маслу.",

		--Heat Street, Holdout edition
		["heist_skm_heat_street_name"] = "Жилой район - здание 'Инквелл'",
		["heist_skm_heat_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",
		["heist_skm_street_name"] = "Столкновение: Жилой район - здание 'Инквелл'",
		["heist_skm_street_brief"] = "Недавно копы допросили заключенного, который утверждает, что видел лицо Бейна и может его опознать. Разумеется, это неправда - но об этом не догадываются ни копы, ни наши враги, поэтому мы воспользуемся ситуацией, чтобы срубить немного денег. Перехватите заключенного, когда его будут перевозить около старой фабрики, где еще разбился тот идиот Мэтт, когда пытался убежать тот нас.",

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "Рождественское спасение Хокстона",
		["heist_xmn_hox1"] = "Рождественский побег",
		["heist_xmn_hox_1_brief"] = "Дантист организовал новое судебное разбирательство для Хокстона. Нет, не для тебя, Хокс. Я имел в виду... Для старого. Ладно, с кличками потом разберемся. Суд пройдет быстро. С его статьей он все равно не выйдет из тюрьмы. Мы должны перехватить Хокса, пока его ведут с заседания. Спасем Хокстона и покажем огромный средний палец судебной системе. Действуйте громко: взорвите стену в здании суда, хватайте Хокса и сваливайте.$NL;$NL;Улицы вокруг здания суда перекрыты. Они ожидают подвоха, так что готовьте пушки покрупнее и боеприпасов побольше.",
		["heist_xmn_hox2"] = "Рождественские поиски",
		["heist_xmn_hox_2_brief"] = "Парни, спасибо за то, что вытащили меня. Только я уверен в том, что меня подставили. Я не должен был попасть в тюрьму. У федералов было на меня гораздо больше, чем эти сволочи смогли бы раскопать. Кто-то решил меня сдать. Я узнаю, кто это сделал.$NL;$NL;Это будет нелегко, так что мы не будем ходить вокруг да около, ладно? Никаких сделок или связей с контактами. Мы отправимся сразу к месту, где все началось. В здание имени Эдгара Гувера, самый главный улей FBI. Мы выясним, кто попытался меня поиметь.",
		["heist_xmn_hox_brief"] = "Дантист сфальсифицировал новое судебное разбирательство для Хокстона. Мы должны перехватить его сразу после слушания. Действовать будете настолько громко, насколько это возможно: взрываете стену, хватаете Хокстона и сбегаете к чертям.$NL;$NL;» Освободите Хокстона$NL;» Проведите его до бронированного грузовика$NL;» Сопровождайте грузовик$NL;» Скройтесь с места преступления вместе с Хокстоном.",

		["heist_xmn_tag_name"] = "Проникновение на Рождество",

		--Rats Zipline
		["menu_alex_1_zipline_desc"] = "Лебедка для быстрого переноса сумок",

		--The Bomb: Forest Breifing
		["heist_crojob3_briefing"] = "Этим утром, взрывчатку погрузили на поезд, который двигается в Норфолк. Возможно, их собираются продать или списать - это неважно, ведь она туда не доедет. Поезд остановить нелегко, так что мы прибегнем к методам Дикого запада. Взорвете опоры моста - и поезд рухнет. План громкий и грязный, зато эффективный. Вагоны будут разбросаны повсюду. В одном из них наша взрывчатка - обыщите все вагоны, пока не найдете ее.\n\nЗАПИСКА ОТ ДЖЕКЕЛА:\nЯ получил информацию, что туда движутся наемники АКАНа - похоже, он захотел бомбу себе.",

		--Watchdogs Holdout
		["heist_skm_watchdogs_stage2_briefing"] = "Миа Калиенте — хорошая добыча, друзья. В течение многих лет она была мозгом операций Murkywater в Вашингтоне. Не так давно Murkywater заняли портовый склад, который они используют как дополнительную точку распределения. Наша цель находится там, проверяет какую-то добычу, недавно награбленную из-за границы. Мы проникнем туда и возьмем девку в заложники. Мурки не могут позволить себе потерять ее и они заплатят за ее освобождение, может быть даже вышеупомянутой и весьма ценной добычей. Что скажете, банда?",

		--Side Jobs
		["menu_challenge_menu_challenge_moon_6_obj"] = "Завершите контракт Скотобойня на уровне сложности OVERKILL или выше, не убивая капитана Спринга.",

		--Generic Captain Text
		["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",

		--Boiling Point RU text tweaks
		["mad_txt_005"] = "КОМНАТА МЕДОСМОТРА",
		["mad_txt_006"] = "ОПЕРАЦИОННАЯ"

	})

	-- maybe need change banner descriptions
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local job = Global.level_data and Global.level_data.level_id
	local captain_type = job and restoration.captain_spawns[job]
	if captain_type == restoration.captain_types.winter and job == "crojob3" or job == "crojob3_night" then
		LocalizationManager:add_localized_strings({
			["hud_assault_vip"] = "ГОСПОДА ГРАБИТЕЛИ, ВЫ ОКРУЖЕНЫ",
		})
	elseif captain_type == restoration.captain_types.winter then
		LocalizationManager:add_localized_strings({
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА ВИНТЕРСА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
		})
	elseif captain_type == restoration.captain_types.summer then
		LocalizationManager:add_localized_strings({
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА САММЕРСА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
		})
	elseif captain_type == restoration.captain_types.spring then
		LocalizationManager:add_localized_strings({
			["hud_assault_vip"] = "УБЕЙТЕ КАПИТАНА СПРИНГА ЧТОБЫ ЗАКОНЧИТЬ ШТУРМ",
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
		["menu_pda8_1_prog_obj_desc"] = "Найти 2 праздничные статуэтки в Ювелирном магазине, Четырех магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_2_prog_obj_desc"] = "Всем сообществом грабители должны потратить $5,000,000,000 на пенсию копов при помощи Бабломета, также вам нужно найти 3 разных праздничных статуэтки в Ювелирном магазине, Четырех магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_3_prog_obj_desc"] = "Всем сообществом грабители должны потратить $10,000,000,000 на пенсию копов при помощи Бабломета, также вам нужно найти 4 разных праздничных статуэтки в Ювелирном магазине, Четырех магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",
		["menu_pda8_item_1_desc"] = "Всем сообществом грабители должны потратить $15,000,000,000 на пенсию копов при помощи Бабломета, также вам нужно найти 3 разных праздничных статуэтки в Ювелирном магазине, Четырех магазинах, Ночном клубе, Ограблении банка или Крушителе. Для выполнения задания, ограбление нужно пройти до конца.",

		["menu_pda8_2_prog_obj"] = "Найти 3 праздничные статуэтки.",
		["menu_pda8_3_prog_obj"] = "Найти 4 праздничные статуэтки.",

		--Holdout--
		["menu_cn_skirmish"] = "Столкновение",
		["menu_skirmish"] = "Столкновение - оборона заложника",
		["menu_skirmish_random"] = "Случайная локация",
		["menu_random_skirmish_subtitle"] = "Случайная стартовая локация.\n\nОтсутствую еженедельные награды и стартовые модификаторы.",
		["menu_weekly_skirmish"] = "Точная локация",
		["menu_weekly_skirmish_progress"] = "Пройденные волны, награды при полном прохождении",
		["menu_skirmish_random_briefing"] = "В этом режиме вы окажетесь в случайном СТОЛКНОВЕНИИ.\n\nСлучайное СТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы будете получать больше денег и опыта с каждой волной, но поражение заберет все накопленные награды.\n\nВы проиграете, если вы или любой ваш соратник попадете под стражу, или если заложник будет освобожден.",
		["menu_weekly_skirmish_desc"] = "В этом режиме вы окажетесь в подготовленном СТОЛКНОВЕНИИ.\n\nЕженедельное СТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы получите еженедельные награды, а также большое количество денег, опыта и карточек за каждую волну, но поражение заберет все накопленные награды.\n\n##Вы проиграете, если вы или любой ваш соратник попадете под стражу, или если заложник будет освобожден.##",
		["menu_weekly_skirmish_tab_description"] = "Обзор операции",
		["menu_weekly_skirmish_rewards"] = "Количество пройденных волн и награды",
		["hud_skirmish"] = "Столкновение",
		["hud_weekly_skirmish"] = "Еженедельное столкновение",
		["heist_contact_skirmish"] = "Столкновение",
		["menu_skirmish_pick_heist"] = "Компания Джекела доверяет вам эту работу",
		["menu_skirmish_map_selection"] = "Локации",
		["menu_skirmish_selected_briefing"] = "В этом режиме вы можете выбрать любое СТОЛКНОВЕНИЕ.\n\nСТОЛКНОВЕНИЕ состоит из 9 волн. Каждая волна увеличивается в сложности.\n\nВы будете получать больше денег и опыта с каждой волной, но поражение заберет все накопленные награды.\n\nВы проиграете, если заложник будет освобожден.",
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
		["heist_pines_briefing"] = "Место нахождения в такой дальней глуши, что вам надо поторопиться и бежать сломя голову. Найдите пилота. Он должен быть рядом с местом крушения. Мы отправим вертолет, чтобы эвакуировать его. Пилот должен быть в полной безопасности до тех пор, пока не отправится к нам. И еще кое-что: Влад говорит, что в самолете был неплохой товар. Прочешите лес и утащите столько кокаина, сколько сможете. На Рождество деньги лишними не будут.\n\nСООБЩЕНИЕ ОТ ДЖЕКЕЛА:\nШум от падения самолета привлек внимание находившихся неподалеку наемников организации REAPER. Сражаться будете не с полицией.",

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
		["nightmare_7"] = "Ночь темна, но всегда настает утро", --translation note: quote from Lulu (Final Fantasy X)
		["nightmare_7_desc"] = "Начиная с первой волны, продержитесь семь волн в Старом Убежище.",
		["nightmare_7_obj"] = "Начиная с первой волны, продержитесь семь волн в Старом Убежище.",
		["nightmare_9"] = "Так проснитесь же, Мистер Стил", --translation note: quote from HL2 intro gman speech + Dallas' alias
		["nightmare_9_desc"] = "Начиная с первой волны, продержитесь девять волн в Старом Убежище.",
		["nightmare_9_obj"] = "Начиная с первой волны, продержитесь девять волн в Старом Убежище.",

		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "Раскрытый приклад 'Muldon'",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Набор Бернетти 93Т",
		["bm_wp_upg_i_93r_desc"] = "#{risk}#Добавляет выбор режимов огня##, позволяя стрелять #{skill_color}#очередями по три, со скоростью 1100##, но #{important_1}#увеличивает отдачу.##",

		--10-0
		["bm_wp_upg_i_tekna"] = "Набор 'Текна'",
		["bm_wp_upg_i_tekna_desc"] = "Оружие стреляет только #{risk}#очередями##.",
		["bm_wally_desc"] = "#{important_2}#Эй, малой...##",

		--AMR16--
		["bm_wp_upg_i_m16a2"] = "Набор АМР-16 B3",
		["bm_wp_upg_i_m16a2_desc"] = "Заменяет автоматический огонь на стрельбу #{skill_color}#очередями по три##. #{risk}#Очереди#{skill_color}# имеют повышенную скорость в #{skill_color}#950.##",

		--Bernetti Auto--
		["bm_wp_upg_i_b93o"] = "Набор Бернетти ОВЕРКИЛЛ",
		["bm_wp_upg_i_b93o_desc"] = "Заменяет стрельбу очередями на #{skill_color}#автоматическую##, но #{important_1}#увеличивает отдачу.##",

		--2006M Hailstorm
		["bm_w_hailstorm_2006m"] = "Хейлшторм-9",
		["bm_w_hailstorm_rsh12"] = "Хейлшторм-12",
		["bm_wp_upg_i_iw_hailstorm"] = "Набор Хейлшторм",
		["bm_wp_upg_i_iw_hailstorm_desc"] = "Позволяет стрелять особыми #{skill_color}#тройными боеприпасами.##",
		["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "Позволяет стрелять особыми #{skill_color}#тройными боеприпасами##, но #{important_1}#урон по броне уменьшается на 50% и отключается пробитие щитов.##",

		--M200 WIDOWMAKER
		["bm_w_m200_iw"] = "Вайдоумейкер",
		["bm_wp_upg_i_iw_widowmaker"] = "Набор Вайдоумейкер",
		["bm_wp_upg_i_iw_widowmaker_desc"] = "Позволяет стрелять особыми #{skill_color}#двойными боеприпасами.##",

		--M32 MK32 Kit
		["bm_wp_upg_i_ghosts_mk32"] = "Набор Марк 32",
		["bm_wp_upg_i_ghosts_mk32_desc"] = "Заменяет одиночную стрельбу на #{skill_color}#стрельбу очередями по два.##",

		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Дробь #{risk}#летит горизонтально##, а не распыляется.",
		["bm_wp_ns_ultima_desc_sc"] = "Увеличивает разброс дроби на 75%.",
		["bm_wp_upg_a_slug_sc"] = "Бронебойная пуля",
		["bm_wp_upg_a_slug_desc"] = "Свинцовая пуля, которая #{skill_color}#пробивает броню, врагов, щиты и тонкие стены.##",
		["bm_wp_upg_a_slug_spam_desc"] = "Свинцовая пуля, которая #{skill_color}#наносит 75% урона через броню, пробивает врагов и тонкие стены.##",
		["bm_wp_upg_a_slug_titan_desc"] = "Свинцовая пуля, которая #{skill_color}#пробивает броню, врагов, щиты, титан щиты и тонкие стены.##",
		["bm_wp_upg_a_explosive_desc_sc"] = "#{heat_warm_color}#Взрывная## пуля с радиусом взрыва #{skill_color}#2## метра.\n#{skill_color}#Не теряет урон с расстоянием##, но #{risk}#урон поделен поровну между пулей и взрывом.##",
		["bm_wp_upg_a_custom_desc"] = "#{important_1}#6## больших дробинок, которые #{skill_color}#увеличивают урон##",
		["bm_wp_upg_a_custom_4_desc"] = "#{important_1}#4## большие дробинки, которые #{skill_color}#увеличивают урон##",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Магниевые осколки обладают #{skill_color}#15%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#90## урона в течение #{skill_color}#2## секунд.\n\n#{risk}#Шанс уменьшается с расстоянием.##",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Магниевые осколки обладают #{skill_color}#40%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#120## урона в течение #{skill_color}#2## секунд.\n\n#{risk}#Шанс уменьшается с расстоянием.##",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Магниевые осколки обладают #{skill_color}#60%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#180## урона в течение #{skill_color}#2## секунд.\n\n#{risk}#Шанс уменьшается с расстоянием.##",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Магниевые осколки обладают #{skill_color}#80%## шансом #{heat_warm_color}#поджечь врагов##, прерывая и нанося #{heat_warm_color}#240## урона в течение #{skill_color}#2## секунд.\n\n#{risk}#Шанс уменьшается с расстоянием.##",
		["bm_wp_upg_a_rip"] = "Дробь 'Томбстоун'",
		["bm_wp_upg_a_rip_auto_desc_sc"] = "#{stats_positive}#Ядовитая## дробь, которая может оглушить врагов. Наносит #{stats_positive}#60## урона ядом в течение #{skill_color}#2## секунды.\n\n#{risk}#Время действия уменьшается с расстоянием.##",
		["bm_wp_upg_a_rip_semi_desc_sc"] = "#{stats_positive}#Ядовитая## дробь, которая может оглушить врагов. Наносит #{stats_positive}#120## урона ядом в течение #{skill_color}#4## секунд.\n\n#{risk}#Время действия уменьшается с расстоянием.##",
		["bm_wp_upg_a_rip_pump_desc_sc"] = "#{stats_positive}#Ядовитая## дробь, которая может оглушить врагов. Наносит #{stats_positive}#180## урона ядом в течение #{skill_color}#6## секунды.\n\n#{risk}#Время действия уменьшается с расстоянием.##",
		["bm_wp_upg_a_rip_heavy_desc_sc"] = "#{stats_positive}#Ядовитая## дробь, которая может оглушить врагов. Наносит #{stats_positive}#240## урона ядом в течение #{skill_color}#8## секунды.\n\n#{risk}#Время действия уменьшается с расстоянием.##",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "12 флешеттов, которые #{skill_color}#пробивают броню##.",
		["bm_wp_upg_a_piercing_9_auto_desc_sc"] = "9 флешетт, которые #{skill_color}#пробивают броню##.",
		["bm_wp_upg_a_piercing_auto_desc_per_pellet"] = "12 флешеттов, которые #{skill_color}#пробивают броню##. #{skill_color}#Урон в голову увеличен на 100%.##",
		["bm_wp_upg_a_piercing_9_auto_desc_per_pellet"] = "9 флешетт, которые #{skill_color}#пробивают броню##. #{skill_color}#Урон в голову увеличен на 100%.##",
		["bm_wp_upg_a_piercing_semi_desc_per_pellet"] = "12 флешеттов, которые #{skill_color}#пробивают броню##. #{skill_color}#Урон в голову увеличен на 100%.##",
		["bm_wp_upg_a_piercing_pump_desc_per_pellet"] = "12 флешеттов, которые #{skill_color}#пробивают броню##. #{skill_color}#Урон в голову увеличен на 100%.##",
		["bm_wp_upg_a_piercing_heavy_desc_per_pellet"] = "12 флешеттов, которые #{skill_color}#пробивают броню##. #{skill_color}#Урон в голову увеличен на 100%.##",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "Рукоятка 'AFG'",
		["bm_wp_upg_vg_stubby"] = "Вертикальная рукоятка 'Стабби'",
		["bm_wp_upg_vg_tac"] = "Вертикальная рукоятка 'TAC'",

		["fucktheatf"] = "Погодите, это реально?",

		["bm_wp_upg_ns_ass_smg_stubby"] = "Пламегаситель 'Стабби'",

		["bm_wp_upg_flash_hider"] = "#{skill_color}#Прячет пламя## и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##",
		["bm_wp_upg_suppressor"] = "#{skill_color}#Заглушает## оружие и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##",
		["bm_wp_upg_suppressor_boss"] = "\"What a thrill...\"\n\n#{skill_color}#Заглушает## оружие и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##",
		["bm_wp_upg_suppressor_warn"] = "#{skill_color}#Заглушает## оружие и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.##\n\n#{important_1}#Может мешать прицеливанию.##",

		["bm_wp_upg_s_saintvictor_hera"] = "Новомодный приклад",
		["bm_wp_upg_vintage_fal_sc"] = "Классический магазин",
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
		["bm_wp_ak_m_drum"] = "Барабанный магазин",
		["bm_wp_upg_i_rpk74"] = "Конверсия под 5.45",

		--Saw--
		["bm_ap_saw_sc_desc"] = "#{skill_color}#Прорезает броню.##",
		["bm_ap_saw_blade_sc_desc"] = "Лезвия становятся настолько острыми, что прорезают броню.",
		["bm_fast_motor_sc_desc"] = "Увеличивает скорость ротации на 15%.",
		["bm_slow_motor_sc_desc"] = "Уменьшает скорость ротации на 15%.",

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_1_1"] = "Отражательный прицел.\n#{risk}#Увеличение 1.1x.##",
		["bm_wp_upg_o_1_1_health"] = "Отражательный прицел,  #{skill_color}#который показывает здоровье противников при наведении##.\n#{risk}#Увеличение 1.1x.##",
		["bm_wp_upg_o_1_2"] = "Коллиматорный прицел.\n#{risk}#Увеличение 1.2x.##",
		["bm_wp_upg_o_1_5"] = "Голографический прицел.\n#{risk}#Увеличение 1.5x.##",
		["bm_wp_upg_o_1_5_pris"] = "Призматический прицел.\n#{risk}#Увеличение 1.5x##",
		["bm_wp_upg_o_1_5_scope"] = "Слабая оптика.\n#{risk}#Увеличение 1.5x.##",
		["bm_wp_upg_o_1_8"] = "Коллиматорный прицел.\n#{risk}#Увеличение 1.8.##",
		--["bm_wp_upg_o_1_8_irons"] = "Коллиматорный прицел с дополнительной мушкой.\n#{risk}#Увеличение 1-1.8x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		["bm_wp_upg_o_2"] = "Обычная оптика.\n#{risk}#Увеличение 2х.##",
		["bm_wp_upg_o_2_5"] = "Обычная оптика.\n#{risk}#Увеличение 2.5х.##",
		["bm_wp_upg_o_3"] = "Средняя оптика.\n#{risk}#Увеличение 3x##",
		["bm_wp_upg_o_3_range"] = "Средняя оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 3x.##",
		["bm_wp_upg_o_3_rds"] = "Средняя оптика с дополнительным отражательным прицелом.\n#{risk}#Увеличение 1-3x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		["bm_wp_upg_o_3_4"] = "Средняя оптика.\n#{risk}#Увеличение 3.4x.##",
		["bm_wp_upg_o_3_5"] = "Средняя оптика.\n#{risk}#Увеличение 3.5x.##",
		["bm_wp_upg_o_4"] = "Средняя оптика.\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_4_cod"] = "Средняя оптика.\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_4_default"] = "Стандартная оптика у этого оружия.\n#{risk}#Увеличение 4x.##\n\n#{item_stage_2}#Прицел нельзя убрать, но его можно заменить на другой.##",
		["bm_wp_upg_o_4_range"] = "Средняя оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 4x.##",
		["bm_wp_upg_o_4_irons"] = "Средняя оптика с дополнительной мушкой.\n#{risk}#Увеличение 1-4x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		["bm_wp_upg_o_4_rds"] = "Средняя оптика со встроенным прицелом.\n#{risk}#Увеличение 1.1-4x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		["bm_wp_upg_o_4_rds_mount"] = "Регулируемая оптика с дополнительным отражательным прицелом.\n#{risk}#Увеличение 1.1 + 2-4x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между кратностью увеличения и прицелами.",
		["bm_wp_upg_o_4_vari"] = "Оптика с настраиваемым прицелом.\n#{risk}#Увеличение 4-8x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		--Я отказываюсь это переводить --да и не надо - Марши
		["bm_wp_upg_o_4_valentine"] = "Оптика с настраиваемым прицелом.\n#{risk}#Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы переключится между прицелами.",
		["bm_wp_upg_o_4_valentine_x"] = "I don't give a shit, I don't give a fuck!\nI don't give a shit! I don't give a fuck!\nNow if I give a shit, I might just give a fuck!\nBut I don't give a shit, so I don't give a fuck!",
		["bm_wp_upg_o_5"] = "Дальнобойная оптика.\n#{risk}#Увеличение 5x.##",
		["bm_wp_upg_o_5_range"] = "Дальнобойная оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 5x.##",
		["bm_wp_upg_o_5_vari"] = "Регулируемая оптика.\n#{risk}#Увеличение 5-8x.##\n\nНажмите #{skill_color}#$BTN_GADGET## во время прицеливания, чтобы изменить кратность увеличения.",
		["bm_wp_upg_o_6"] = "Дальнобойная оптика.\n#{risk}#Увеличение 6x.##",
		["bm_wp_upg_o_6_range"] = "Дальнобойная оптика c #{skill_color}#дальномером.##\n#{risk}#Увеличение 6x.##",
		["bm_wp_upg_o_8"] = "Дальнобойная оптика.\n#{risk}#Увеличение 8x.##",
		["bm_wp_upg_o_8_range"] = "Дальнобойная оптика с #{skill_color}#дальномером.##\n#{risk}#Увеличение 8x.##",

		["bm_wp_upg_o_iwelo"] = "Оптика с подсвечиванием.\n#{risk}#Увеличение 1.1x.##",
		["bm_wp_upg_o_iwrds"] = "Коллиматорный прицел особой точности.\n#{risk}#Увеличение 1.5x.##",

		["bm_wpn_fps_upg_o_hamr"] = "Прицел Тригоном",

		["bm_wp_upg_o_shortdot_dmc"] = "Прицел Шортдот",
		["bm_wp_upg_o_5_default"] = "Дальнобойная оптика.\nИспользуйте, чтобы модифицировать перекрестие у стандартного прицела.\n#{risk}#Увеличение 5x.##",

		["bm_wp_upg_fl_flashlight"] = "Фонарик переключается на #{skill_color}#$BTN_GADGET##",
		["bm_wp_upg_fl_laser"] = "Лазер переключается на #{skill_color}#$BTN_GADGET##",
		["bm_wp_upg_fl_dual"] = "Переключение между лазером и фонариком на #{skill_color}#$BTN_GADGET##",
		["bm_wp_upg_fl_vmp_marker"] = "#{skill_color}#Автоматически помечает## охранников, особых и титановых врагов на расстоянии #{skill_color}#40## метров при прицеливании.\n\n#{risk}#Охранники помечаются только в стелсе.##",
		["bm_wp_upg_fl_second_sight_warning"] = "\n\n#{important_1}#ВО ВРЕМЯ ПРИЦЕЛИВАНИЯ НЕЛЬЗЯ ВКЛЮЧИТЬ ИЗ-ЗА ВТОРОСТЕПЕННОГО ПРИЦЕЛА.##",

		["bm_wp_upg_o_angled_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы переключиться между оптикой и угловым прицелом.",
		["bm_wp_upg_o_angled_1_1_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы переключиться между оптикой и угловым прицелом.\n#{skill_color}#Увеличение 1.1х.##",
		["bm_wp_upg_o_angled_1_2_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы переключиться между оптикой и угловым прицелом.\n#{skill_color}#Увеличение 1.2х.##",
		["bm_wp_upg_o_angled_laser_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы переключиться между оптикой или использовать лазер для прицеливания.\n\n#{risk}#Для эффективного использования необходимо установить лазер.##", --VMP Point Shoot Laser
		["bm_wp_upg_o_angled_aim_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы переключиться между обычным и наклонным прицеливанием.##", --VMP Point Shoot Laser

		["bm_wp_upg_o_magnifier_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## во время прицеливания чтобы использовать линзу.\n#{risk}#Увеличение 3x.##",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Снаряд создает #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#120 урона/сек## врагам, которые в нее попадают, что вызывает панику и наносит еще #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##",
		["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "Снаряд создает #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#80 урона/сек## врагам, которые в нее попадают, что вызывает панику и наносит еще #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##",
		["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "Снаряд создает #{heat_warm_color}#огненную лужу## на месте взрыва.\nЛужа обладает радиусом #{skill_color}#3.75м## и горит #{skill_color}#5 секунд##, нанося #{skill_color}#40 урона/сек## врагам, которые в нее попадают, что вызывает панику и наносит еще #{skill_color}#60 урона## в течение #{skill_color}#3 секунд.##.",
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "Снаряд #{risk}#взрывается## при попадании. Взрыв наносит #{skill_color}#720## урона и обладает радиусом #{skill_color}#5## метров.",
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#360## урона, имеет радиус #{skill_color}#5## метров и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#180## урона, имеет радиус #{skill_color}#5## метров и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "Снаряд производит #{ghost_color}#электроразряд## на месте взрыва. Разряд наносит #{skill_color}#300## урона, имеет радиус #{skill_color}#3## метра и обладает шансом #{ghost_color}#наэлектризовать врагов.##",
		["bm_wp_upg_a_grenade_launcher_poison"] = "Граната Manticore-6",
		["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#8## секунд, наносит #{skill_color}#240## урона в течение #{skill_color}#8## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",
		["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#6## секунд, наносит #{skill_color}#180## урона в течение #{skill_color}#6## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",
		["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "Снаряд производит #{stats_positive}#облако ядовитого газа## на месте взрыва.\nГаз имеет радиус #{skill_color}#6## метров, держится #{skill_color}#4## секунд, наносит #{skill_color}#120## урона в течение #{skill_color}#4## секунд и #{stats_positive}#отравляет## врагов, которые #{important_1}#впервые## попали в него.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Слабая прожарка",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Удваивает время горения, но наполовину уменьшает его урон.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Уменьшает время горения наполовину, но удваивает урон от него.",
		["bm_ap_flamethrower_sc_desc"] = "Тысячи градусов чистой боли. Кто мог придумать такое?\n#{heat_warm_color}#Прожигает через броню.##",
		["bm_ap_money_sc_desc"] = "Тысячи долларов чистого счастья. Поверните кран и выпускайте бабло.\n#{competitive_color}#Покупает через броню.##", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Двойная порция", -- lol
		["bm_wp_m134_body_upper_light"] = "Легкий корпус",
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
		["bm_stech_sc_desc"] = "Тяжелый и медленный автоматический пистолет, который потерял популярность из-за огромных габаритов. Его вес делает его стабильным, но не очень скрытным.",
		["bm_x_stech_sc_desc"] = "Тяжелый и медленный автоматический пистолет, который потерял популярность из-за огромных габаритов. Его вес делает его стабильным, но не очень скрытным.",
		--Chimano Compact
		["bm_jowi_sc_desc"] = "Пистолет 'Чимано' с максимальной скрытностью - за счет всего остального.\n\nГоворят, Уик его использовал, когда мстил русской мафии.",
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
		["bm_legacy_sc_desc"] = "Модель из Западной Германии, которая не потерпела конкуренции с Бернетти, но может постоять за себя.",
		["bm_x_legacy_sc_desc"] = "Два пистолета, забытых историей. Напомните об их существовании, залив комнату свинцом.",
		--Glock 17
		["bm_g17_sc_desc"] = "Надежный и легкий в обращении. Отличный выбор для начинающего грабителя.",
		["bm_x_g17_sc_desc"] = "Маленький калибр - не беда, когда стреляешь настолько быстро.\n\nИх использовал Хокстон во время освобождения.",
		--Bernetti 9
		["bm_b92fs_sc_desc"] = "Популярный пистолет благодаря впечатляющему магазину и неплохому урону. Подойдет, когда злодеи окружили вас.",
		["bm_x_b92fs_sc_desc"] = "Два веселее чем один. Превратите окружение в девятимиллиметровую вечеринку.",
		--White Streak
		["bm_pl14_sc_desc"] = "Современный российский пистолет, использующий пост-советские технологии из-за рубежа. Любим Риперами за надежность и футуристический дизайн.",
		["bm_x_pl14_sc_desc"] = "Современный российский пистолет, использующий пост-советские технологии из-за рубежа. Любим Риперами за надежность и футуристический дизайн.",
		--Holt 9mm
		["bm_holt_sc_desc"] = "Рабочий прототип пистолета, застрявшего в разработке. Инновационный дизайн, который помогает компенсировать отдачу.",
		["bm_x_holt_sc_desc"] = "Целых два пистолета, которые считаются потерянными.",
		--FMG-9
		["bm_fmg9_sc_desc"] = "Экспериментальное оружие, служащее продвинутым держателем для 'Стрика'. В комплекте футуристическая технология разворота!",
		--93R
		["bm_beer_sc_desc"] = "Практически фантастический пистолет с разными режимами огня. Живой или мертвый, ты пройдешь со мной.",
		--Contractor Pistols
		["bm_packrat_sc_desc"] = "Выбор Уика за свою надежность и простоту в использовании. Говорят, именно с ним он нанес визит в клуб The Red Circle.",
		["bm_x_packrat_sc_desc"] = "Выбор для тех, кому нужно зачистить клуб русской мафии ради кровавой мести.",
		--Breech (Luger)
		["bm_breech_sc_desc"] = "Пистолет, который почти захватил мир. Дважды. Этот немецкий артефакт стильный, точный и абсолютно устаревший.",
		--Chimano Custom
		["bm_g22c_sc_desc"] = "Комбинация высокой емкости и мощности. Один из лучших боевых пистолетов.",
		["bm_x_g22c_sc_desc"] = "Когда за голос дают один ствол, хочется обмануть систему и заполучить себе парочку.",
		--Signature .40
		["bm_p226_sc_desc"] = "Этот классический боец с законом проявит себя и в банке, и при ограблении транспорта.",
		--LEO
		["bm_hs2000_sc_desc"] = "Этот компактный пистолет приглянется агентам Интерпола, продажным хорватским копам и международным преступникам.",
		--5/7 pistol
		["bm_lemming_sc_desc"] = "Мощность и емкость в одном флаконе. Если кто-то не гибнет после 20 патронов, может, не стоит с ним сражаться?\n\n#{skill_color}#Наносит 75% урона через броню.##",
		--Baby Deagle--
		["bm_sparrow_sc_desc"] = "Ты что, ковбой?",
		["bm_w_sparrow_sc_g_cowboy_desc"] = "SEE YOU SPACE COWBOY...",
		--socom deez nuts--
		["bm_w_socom_desc"] = "Любимое оружие Джекела. Надежный и мощный пистолет под .45 ACP со стильным дизайном.",
		--Crosskill
		["bm_1911_sc_desc"] = "Когда 9мм кажется мало, возьмите этот модифицированный 1911А1, заряженный мощными .45ACP. Беспрецедентная жестокость.",
		["bm_x_1911_sc_desc"] = "Может они и не обладают демоническими силами, но то, что они после себя оставляют, способно напугать любого.",
		--Crosskill Chunky
		--["bm_w_m1911"] = "Кроскилл А1",
		--Crosskill Guard
		["bm_shrew_sc_desc"] = "Маленький и более компактный, чем модель А1. Увеличенная скрытность за счет уменьшения магазина и длины ствола.",
		["bm_x_shrew_sc_desc"] = "Выбор Ханаанитов - два пистолета под .45 помогут отбить любую атаку.",
		["bm_shrew_g_bling_sc_desc"] = "\"In a world filled with misery and uncertainty, it is a great comfort to know that, in the end, there is light in the darkness.\"",
		--USP
		["bm_usp_sc_desc"] = "Один из лучших пистолетов S&G преуспевает в уроне, емкости и дальнобойности.",
		["bm_x_usp_sc_desc"] = "Парочка пистолетов S&G, когда нужно дать о себе знать.",
		--Model 54
		["bm_type54_sc_desc"] = "Советский пистолет под тяжелый калибр 7.62×25мм, обладает подствольным дробовиком в качестве дополнительного способа избавиться от проблем.",
		["bm_x_type54_sc_desc"] = "Двух стволов мало? Попробуйте четыре.",
		--Broomstick--
		["bm_c96_sc_desc"] = "\"...Ваше слово, товарищ Маузер!\"\n\nИнновационный немецкий пистолет, который модифицировали под автоматический огонь.\n\n#{risk}#Это оружие перезаряжается обоймами по десять патронов.##",
		["bm_wp_c96_nozzle"] = "Насадка Бластер-44",
		["bm_wp_c96_nozzle_desc_sc"] = "#{skill_color}#Технология из далекой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#1.5 сек.##\nСкорость зарядки: #{skill_color}#3/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#2 сек.##",
		--Sub2000
		["bm_sub2000_sc_desc"] = "Пистолет сомнительного качества сборки. Слабые пистолетные пули становятся мощнее из-за длины ствола, а возможность свертки дает хорошую скрытность.",
		--Deagle
		["bm_deagle_sc_desc"] = "Оружие крутых парней на все времена. Главное не вывихнуть руку.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		["bm_x_deagle_sc_desc"] = "Нужно быть безумцем, чтобы додуматься взять на поле боя сразу два.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
	     --Kahn .357
		--["bm_w_korth"] = "Кан .357",
		--["bm_w_x_korth"] = "Парные Кан .357",
		--Matever 2006m
		["bm_2006m_sc_desc"] = "Очень редкий револьвер предоставляет дорогостоящую возможность пострелять девятимиллиметровками.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		["bm_wp_2006m_b_short"] = "Ствол 'Тачикома'",
		["bm_wp_2006m_b_medium"] = "Ствол 'Тогуса'",
		["bm_wp_2006m_b_long"] = "Ствол 'Кусанаги'",
		["bm_x_2006m_sc_desc"] = "Неудобность этой идеи компенсируется ее крутостью.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		--Frenchman Model 87
		["bm_model3_sc_desc"] = "Старомодный ответ на вопрос \"Что делать со всеми этими мудаками?\"\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		["bm_x_model3_sc_desc"] = "Копы не уважают правила дуэли, так что и тебе незачем.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		--Raging bull
		["bm_rage_sc_desc"] = "Мощная и недальнобойная пушка. Враги будут падать как кегли, если держать огонь ровно.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		["bm_x_rage_sc_desc"] = "Совсем неудобно и непрактично, но свидетели ограбления будут впечатлены.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		--Castigo
		["bm_chinchilla_sc_desc"] = "Мощный, точный, стильный. Подойдет против самых сильных вашингтонских копов.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		["bm_x_chinchilla_sc_desc"] = "Сикарио не дает своей жертве шанса выжить - помогают эти револьверы.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
		--RUS-12
		["bm_rsh12_sc_desc"] = "Больше не нужно меряться малокалиберными стволами.\n\n#{skill_color}#Может пробивать броню, врагов, щитов и тонкие стены.##",
		--Chunky 1911
		["bm_m1911_sc_desc"] = "Перевыпуск старенького Crosskill .45. Почти не отличается от оригинала.",
		--SAA/Peacemaker
		["bm_ap_weapon_peacemaker_sc_desc"] = "#{risk}#The greatest handgun ever made.##\nАльтернативный огонь выпускает боезапас #{skill_color}#с повышенной скоростью##, за счет #{important_1}#отдачи, точности и невозможности прицеливания.##\n\n##Может пробивать броню, врагов, щитов и тонкие стены.##",
		--CUSTOM HANDGUNS AND ATTACHMENTS
			--Browning Hi-Power
			--["bm_w_hpb"] = "Хай-Пауэр",
			--Walther P99
			--["bm_w_p99"] = "Грубер 99",
			--Derringer
			--["bm_w_derringer"] = "Деринжер",
			--Automag .44
			--["bm_w_amt"] = "Автомаг .44",
			--Zippy
			["bm_zippy_sc_desc"] = "Самое малогабаритное летальное оружие, которое придумало человечество. Правда не стоит ожидать, что оно будет работать без осечек. Вам повезет, если после пары выстрелов это оружие не взорвется в Вашей руке.",
			--Auto-9
			["bm_wp_rc_auto9_cartoon"] = "Мультяшные трейсеры",
			["bm_wp_rc_auto9_cartoon_desc"] = "Вечеринка прямо как в 1988!",
			--M2019 Blaster
			["thatgun_desc"] = "Вот это волына!\n\nИменно та самая!\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
			--Malorian 3516
			--Киберсрань
			["whydoyoucome"] = "Единственный в своем роде, сделанный специально для Джонни Сильверхенда.\n\n#{skill_color}#Может пробивать врагов и их броню.\nВо время стрельбы от бедра пули будут рикошетить от поверхностей. Пули пробивают стены, если стрелять в режиме прицеливания.\nУдар прикладом выпускает волну огня в небольшом радиусе.##",
			--Colt Detective
			--["bm_w_coltds"] = "Кросскилл Детектив",
			["bm_lemon_dmc_desc"] = "Мечтаете о скрытном и мощном револьвере? Мечты сбываются.\n\n#{skill_color}#Наносит двойной урон при атаке сзади.##",
			--SIG P320
			--["bm_w_papa320"] = "M19",
			["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "Магазин на 32",


		--CUSTOM WEAPON ATTACHMENTS
					--M6D
					["kfa_scope"] = "Прицел Смарт-Линк",
					["kfa_scope_desc"] = "Подключает вашу маску к системе #{skill_color}#Smart-Link##.\n#{risk}#Увеличение 2x.##",
					--M200 WIDOWMAKER
					["bm_wp_upg_i_iw_widowmaker"] = "Набор Овдовителя",
					["bm_wp_upg_i_iw_widowmaker_desc"] = "Прототип оружейного набора, изготовленного компанией Kendall Ballistics.\n\nМодифицирует оружие под использование особых #{skill_color}#боеприпасы с двойным штабелем.##",
					--NV4
					["bm_wp_upg_o_iwelo"] = "Оптический прицел с плавающей прицельной сеткой \n#{риск}#Увеличение 1.1х##",
					["bm_wp_upg_o_iwrds"] = "Высокоточный прицел с красной точкой.\n#{риск}#Увеличение 1.5х.",

					--Raygun
					["bm_wp_raygun_o_waw"] = "Старое прицеливание",
					["bm_wp_raygun_o_waw_desc"] = "Меняет выравнивание прицела так, как это было до Call of Duty: Black Ops II",

		--Kobus 90--
		["bm_p90_sc_desc"] = "ПП по схеме буллпап. Конкурент ПП 'SpecOps-7'. Ее часто называют футуристической космической пушкой.\n\n#{skill_color}#Наносит 75% урона через броню.##",
		["bm_wp_p90_body_p90_tan"] = "Бежевый приклад",
		["bm_wp_90_body_boxy"] = "Приклад OMNIA",
		["bm_wp_90_body_boxy_desc"] = "Найденный на заброшенном складе корпорации OMNIA, этот корпус совершенно не влияет на функционал или удобность оружия, но его квадратный дизайн приятен глазу.",
		--Spec Ops
		["bm_mp7_sc_desc"] = "Легкий ПП. Конкурент ПП Project-90. Оказывается, у него нет подствольного гранатомета.\n\n#{skill_color}#Наносит 75% урона через броню.##",
	    --Tec-9
		--["bm_w_tec9"] = "ТЕК",
		--["bm_w_x_tec9"] = "Парные ТЕК",
		--Heather
		["bm_sr2_sc_desc"] = "Разработанный под специализированный калибр 9×21мм, ''Пихта'' - российский аналог Проджект-90 и СпекОпс-7.\n\n#{skill_color}#Наносит 75% урона через броню.##",
		--CMP
		--["bm_w_mp9"] = "КМП 9",
		--Miyaka
		--["bm_w_pm9"] = "Мияка 9",
		--Micro Uzi
		--["bm_w_baka"] = "Микро Узи",
		--["bm_w_x_baka"] = "Парные Микро Узи",
		--Cobra/Skorpion
		["bm_wp_scorpion_m_extended"] = "Двойные магазины",
		--Tatonka
		--["bm_w_coal"] = "Татонка",
		--AK Gen
		--["bm_w_vityaz"] = "АК 21 Тактический",
		--Signature SMG
		--["bm_w_shepheard"] = "Сигнатур 10",
		--Compact-5/MP5
		["bm_mp5_sc_desc"] = "Младшая сестра Гевер-3.\nСкорострельная, точная и удобная, что еще можно желать от ПП?",
		--Swedish K
		--["bm_w_m45"] = "Карл M-45",
		--Pachett/Sterling
		["bm_wp_sterling_b_e11"] = "Глушитель Бластер-11",
		["bm_wp_sterling_b_e11_desc_sc"] = "#{skill_color}#Технология из далекой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#1 сек.##\nСкорость зарядки: #{skill_color}#6/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#2 сек.##",
		--Uzi
		["bm_uzi_sc_desc"] = "Несмотря на скорострельность, Узи - надежный и простой в обращении ПП, а переделка под калибр .41 AE прибавляет ему мощности.",
		--Chicago Typewriter
		["bm_thompson_sc_desc"] = "Снабженный барабанным магазином, этот ПП позволяет вспомнить деньки мафии, пока вы расстреливаете толпы врагов.",
		--Mark 10
		--["bm_w_mac10"] = "Марк 10",
		--["bm_w_x_mac10"] = "Парные Марк 10",
		--MP40
		["bm_erma_sc_desc"] = "Весьма надежный ПП, популярный у пехоты Второй мировой. Главное не использовать магазин как рукоять.",

		--Jackal
		--["bm_w_schakal"] = "Шакал",
		--Kross Vertex
		--["bm_w_polymer"] = "Кросс Вертекс",
		--CUSTOM SMGs
			--AR57
			["bm_w_alpha57_prim_desc"] = "Этот автомат жертвует дальнобойностью и мощностью ради большого запаса патронов и улучшенной стабильности.\n\n#{skill_color}#Наносит 75% урона через броню.##",
			--LWRC
			["bm_w_smg45_desc"] = "Американский клон ПП 'Шакал'.",
			--Typhoon
			["bm_w_crysis3_typhoon_desc"] = "\"Самая чистая форма самовыражения - и сейчас мне есть что сказать.\"\n\nЭтот десятиствольный пистолет-пулемет использует особую технологию зарядки, которая позволяет добиться чрезвычайно высокой скорости стрельбы за счет низкого урона.\n\nАльтернативный огонь выстреливает #{skill_color}#залп## из #{skill_color}#10## патронов разом.",
			--AR57
			["bm_w_fang45_desc"] = "Эффективное оружие для столкновений на короткой и средней дистанции.\n\n.#{skill_color}#Увеличенная скорострельность для первых 5-ти выстрелов. Перезарядка оружия обновляет эффект.##",
			--KSP 45
			["bm_w_ksp45_desc_sc"] = "Пистолет-пулемет стреляющий очередями по 3 патрона. Подходит для средних дистанций. Менее эффективен на дальней дистанции из-за разброса пуль.",
			--LC10
			["bm_w_lc10_desc_sc"] = "Автоматический пистолет-пулемет. Неплохая точность и скорострельность.",

		--Bootleg/HK416c
		["bm_w_tecci_desc_sc"] = "Винтовка с возвратной пружиной, переделанная под пулемет.",
		--KSP/M249
		["bm_m249_sc_desc"] = "Перезаряжать эту вещь трудно, но скорее всего к моменту перезарядки все уже будут мертвы.",
		--ChainSAW
		["bm_kacchainsaw_sc_desc"] = "Roaming frothing madness in a machine gun.\n\n#{skill_color}#Лучше стрелять от бедра.##",
		["bm_wp_upg_i_kacchainsaw_adverse"] = "Прямой отвод",
		--RPK
		["bm_rpk_sc_desc"] = "Отличный выбор, если любите точные (и восточные) пулеметы.",
		--Brenner 21/HK21
		["bm_hk21_sc_desc"] = "Большая младшая сестра винтовки Гевер-3. Увеличенная скорострельность отлично подходит для подавляющего огня.",
		--HCAR
		["bm_hcar_sc_desc"] = "Современная версия классического автомата Второй мировой.",
		--M60
		["bm_m60_sc_desc"] = "Так называемая 'Свинка' - тяжелая и пожирающая патроны. Вблизи никому не выжить.",
		--Ksp 58
		["bm_par_sc_desc"] = "Более тяжелый родственник КСП-90, который обычно ставят на технику. Меньше мобильность, больше пуля.",
		--Buzzsaw/Mg42
		["bm_wolf_brigade_sc_desc"] = "\"We are not men disguised as mere dogs.\nWe are #{important_1}#wolves## disguised as mere men.\"\n\n#{skill_color}#Лучше стрелять от бедра.##",
		["bm_wp_mg42_b_vg38"] = "Насадка Бластер-19",
		["bm_wp_mg42_b_vg38_desc_sc"] = "#{skill_color}#Технология из далекой галактики.## Оружие будет стрелять #{risk}#плазменными болтами## и #{skill_color}#автоматически заряжаться.##\n\nВремя зарядки: #{skill_color}#2 сек.##\nСкорость зарядки: #{skill_color}#9/сек## #{important_1}#(На 50% медленнее при перегреве)##\nПерегрев: #{important_1}#4 сек.##",
		--["bm_wp_mg42_b_mg34_desc_sc"] = "Slows your rate of fire to 800 RPM",
		--Versteckt-51/HK51B
		["bm_hk51b_sc_desc"] = "Подпольная модификация Бреннера, которая уменьшает его до размеров Компакт-5.",
		["bm_wp_hk51b_magazine_belt_60"] = "Лента на 60 патронов",
		["bm_wp_hk51b_magazine_belt_80"] = "Лента на 80 патронов",
		--M134
		["bm_m134_sc_desc"] = "\"Each step you take is paved with the corpses of your enemies...\"\n\n#{risk}#Раскручивается перед стрельбой, прицеливание продолжает раскрутку.\nТеряет точность при стрельбе от бедра.##",
		--Microgun
		["bm_shuno_sc_desc"] = "\"This is your road. When you come, you'll walk it alone.\"\n\n#{risk}#Раскручивается перед стрельбой, прицеливание продолжает раскрутку.\nТеряет точность при стрельбе от бедра.##",
		--Custom MGs
			--Madsen MG
		["bm_wp_wpn_fps_lmg_madsen_mg_xmag"] = "Магазин на 40 патронов",
			--Stoner 63 (LMG)
		["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_01"] = "Speed Tape",
		["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_01"] = "Dropshot Wrap",
		["bm_wp_wpn_fps_lmg_stoner63a_handle_01"] = "Field Tape",
		["bm_wp_wpn_fps_lmg_stoner63a_handle_02"] = "SASR Jungle Grip",
		["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_02"] = "Serpent Wrap",
		["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_02"] = "Airborne Elastic Wrap",
		["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_01"] = "100 Rnd",
		["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_02"] = "STANAG 125 Rnd",
		["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_01"] = "Fast Mag",
		["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_02"] = "Vandal Speed Loader",
			--TF2 Minigun
		["bm_wp_wpn_fps_lmg_sasha_body_desc"] = "",
		["bm_wp_wpn_fps_lmg_iron_curtain_body_desc"] = "",
		["bm_wp_wpn_fps_lmg_tomislav_body_desc"] = "#{skill_color}#Раскручивается на 20% быстрее.##",
		["bm_wp_wpn_fps_lmg_natascha_body_desc"] = "#{skill_color}#Попадания по противникам на расстоянии не более 9.75 метров сбивают их с ног.##\n\n#{important_1}#Раскручивается на 30% медленнее.##",
		["bm_wp_wpn_fps_lmg_gatling_gun_body_desc"] = "#{important_1}#Раскручивается на 50% медленнее.##",
		["bm_wp_wpn_fps_lmg_canton_body_desc"] = "#{skill_color}#80% шанс при попадании по врагу поджечь его, нанося## #{heat_warm_color}#60## #{skill_color}#урона в течение 4 секунд.##\n#{risk}#Шанс уменьшается с расстоянием.\nНаносит огненный урон.##",

         --Grimm
		--["bm_w_basset"] = "Гримм 12",
		--Saiga
		["bm_saiga_sc_desc"] = "Полностью автоматический дробовик для дней, когда вам лень целиться.",
		--AA12
		["bm_aa12_sc_desc"] = "Автоматический дробовик с коробчатым магазином. Оставит бурю эмоций.",
		--Spas12
		["bm_spas12_sc_desc"] = "Тяжелая и сложная альтернатива полуавтоматическим дробовикам. Обладает альтернативным режимом стрельбы, будто созданный пришельцами.",
		--Benelli
		["bm_benelli_sc_desc"] = "Тактический дробовик премиум-класса. Для зачистки особенно шумных комнат.",
		--Argos III
		["bm_ultima_sc_desc"] = "Нет ничего современнее пластика и алюминия. Тут даже есть слот для подзарядки телефона.\n\nПерезаряжает по #{skill_color}#2## патрона за раз.",
		--Street Sweeper
		--["bm_w_striker"] = "Чистильщик",
		--Goliath
		--["bm_w_rota"] = "Голиаф 12",
		--VD-12
		--["bm_w_sko12"] = "ВД 12",
		--["bm_w_x_sko12"] = "Парные ВД 12",
		--GSPS
		--["bm_w_m37"] = "ДжиЭс 12",
		--Supernova
		["bm_supernova_sc_desc"] = "Дробовик-монстр, способный переключаться между помповым и полуавтоматическим режимами.",
		--Loco
		["bm_serbu_sc_desc"] = "Уменьшенная подпольная версия Рейнфилда 880 для любителей скрытности и сломанных запястий.",
		--Reinfeld 88
		["bm_menu_sc_m1897_desc"] = "Этот исторический артефакт повидал как грязные траншеи, так и жаркие джунгли. Известен тем, что им легко развязать пожар.",
		--Mosconi 12g
		["bm_menu_sc_m590_desc"] = "Улучшенная версия классического ружья. Подходит для полиции, армии, гражданских и грабителей.",
		--R870
		["bm_menu_sc_r870_desc"] = "Длинная рука закона и свободы. Свободы, которая вооружена дробовиком!",
		--KSG
		["bm_menu_sc_ksg_desc"] = "В будущем все сделано из пластика! Буллпап-дробовик сомнительного качества сборки, им вооружают легкую пехоту.",
		--Breaker 10g
		["bm_menu_sc_boot_desc"] = "Старое ружье, обладающее мощным десятым калибром и еще более мощной аурой мачо. Иди со мной, если хочешь жить.",
		--Claire Angélique Florette du Bertrand
		--["bm_w_coach"] = "Клэр 12",
		--Mosconi
		["bm_menu_sc_huntsman_desc"] = "Два ствола, двойное удовольствие. Конечно, два патрона это мало, но это не так важно, если они выпущены одновременно и в упор.",
		--Judge
		["bm_x_judge_sc_desc"] = "Наконец-то на одной сцене.",
		--Joceline
		["bm_b682_sc_desc"] = "Спортивная горизонталка, которая скоро будет состязаться в ограблении банков.",
		--Custom Shotguns
		--Doomstick
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "Дробь, эффективная вблизи.\n#{skill_color}#Количество дроби увеличено до 10.##",
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "Дробь, эффективная на средних дистанциях.\n#{important_1}#Количество дроби уменьшено до 6.##",
		["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "Мощная стальная пуля, эффективная на дальних дистанциях.\nМожет пробивать#{skill_color}#броню, врагов, щиты, титановые щиты и стены.##",
		--MP153
		--["bm_w_mp153"] = "Аргос 1",

		--REBECCA CYBERPUNK
		["bm_w_rebecca_desc"] = "С помощью этого можно превратить все в кровавое месиво, хоть оружие порой ведет себя непредсказуемо.\n#{risk}#Выстрелы отбрасывают Вас назад и выбивают из режима прицеливания.##",
		--S552
		["bm_s552_sc_desc"] = "Элегантный выбор для любителей компактных винтовок под 5.56, ее предпочитает МНБ. Использует специальный швейцарский калибр 5.6мм для увеличенной дальнобойности.",
		--M733/AMCAR
		["bm_amcar_sc_desc"] = "Самая распространенная винтовка под .223. Подойдет для любых целей.",
		["bm_wp_upg_i_patriot"] = "Патриот",
		["bm_wp_upg_i_patriot_desc"] = "Штурмовой пистолет, созданный для #{important_1}#[ЗАСЕКРЕЧЕНО]##.\n\nМеханизм подачи внутри барабанного магазина напоминает #{important_1}#[ЗАСЕКРЕЧЕНО]##.",
		["bm_wp_upg_i_og_rof"] = "Ограничитель скорострельности",
		["bm_wp_upg_i_og_rof_desc"] = "Восстанавливает абсурдно низкую скорострельность, если Вы так сильно  хотите...",
		--G36
		["bm_g36_sc_desc"] = "Еще один претендент на звание 'лучшей пластиковой винтовки'.",
		["bm_wp_upg_i_m8a1"] = "Набор М8",
		["bm_wp_upg_i_m8a1_desc"] = "Оружие будет стрелять только #{risk}#очередями по 4##, взамен увеличивая скорость стрельбы и размер магазина",
		--VHS/Lion's Roar
		["bm_vhs_sc_desc"] = "Тяжелая в пользовании винтовка, способная на впечатляющий результат в руках умельца.\n\nВозможно, в ней боевой дух Драгана.",
		["bm_wp_upg_i_swordfish"] = "Набор 'Рыба-меч'",
		["bm_wp_upg_i_swordfish_desc"] = "Оружие будет стрелять только #{risk}#очередями по 5##, взамен увеличивая скорость стрельбы и размер магазин",
		--Olympic/Para
		["bm_menu_sc_olympic_desc"] = "Чудовищный пистолет-переросток, стреляющий винтовочными патронами в автоматическом режиме. Экзистенциальный кризис, из которого можно стрелять.",
		--TAR-21/Para
		["bm_menu_sc_komodo_desc"] = "Мощь в крайне компактной упаковке. Хорошо показывает себя и вблизи, и на расстоянии.",
		--Famas
		["bm_menu_sc_famas_desc"] = "Уменьшенный магазин взамен на точность и скорострельность. Подойдет, чтобы отстрелить яблоко с чьей-нибудь головы.",
        --OICW--
		["bm_w_osipr_desc_pc"] = "Военная технология нового поколения. Снаряжен #{skill_color}#20мм гранатометом.##\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомет.",
		["bm_w_osipr_desc"] = "Военная технология нового поколения. Снаряжен #{skill_color}#20мм гранатометом.##\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомет.",
		--M4/CAR-4
		["bm_m4_sc_desc"] = "Удобная, компактная, смертоносная. Популярная у современных армий винтовка под калибр 5.56.",
		["bm_wp_upg_fg_m4a1"] = "Набор 'Эмка'",
		["bm_wp_upg_fg_m4a1_desc"] = "Этот набор меняет прицелы с черного рынка на более традиционные. #{risk}#Перекрывает внешний вид ручки.##",
		["bm_wp_upg_s_fixed"] = "Фиксированный приклад",
		--AK5
		["bm_ak5_sc_desc"] = "Отличная винтовка, знаменитая использованием для ограблений банков, а также тем, что все путают, чем она стреляет.",
		["fnc_burst_desc"] = "Добавлять стрельбу очередями по три.",
		--Union 5.56
		["bm_corgi_sc_desc"] = "Несмотря на внешний вид, поплавать на этой винтовке не получится.",
        ["bm_wp_corgi_b_short"] = "Ствол MSG",
		--UAR
		["bm_aug_sc_desc"] = "Классический буллпап. Сделает решето из любого плохого парня.",
		["bm_wp_upg_b_hbar"] = "Тяжелый ствол",
		--AK17
		["bm_flint_sc_desc"] = "Современная версия классического АК. #{skill_color}#Умеет стрелять очередями по 2## и обладает кризисом личности.",
		--AK 5.45
		["bm_ak74_sc_desc"] = "Обладающая меньшим калибром, чем ее сестра под 7.62, эта винтовка не менее опасна.",
		--CR 805
		["bm_menu_sc_hajk_desc"] = "Молодой и современный кузен ПП Cobra. Поддерживает разные режимы стрельбы и конверсии под другие калибры. (Нет в наличии)",
		--AMR-16
		["bm_m16_sc_desc"] = "Классическая винтовка - предок CAR-4. Ее трудно спрятать, но зато она дальнобойная и мощная.",
		--Queen's Wrath
		["bm_l85a2_sc_desc"] = "Хоть ее репутация и была подпорчена ранними версиями, она является одной из самых точных винтовок в мире.\n\nНо она остается эргономическим кошмаром.",
		--AK 7.62
		["bm_akm_sc_desc"] = "Отличный выбор против возрастающей популярности брони в Вашингтоне.\n\nВыбор повстанцев и радикальных режимов всего мира.",
		["bm_akm_gold_sc_desc"] = "Что общего у грабителя, мексиканского наркобарона и диктатора? Любовь к позолоченным винтовкам, конечно же.",
		--Сталкер, вали отсюда--
		--Мы кого попало не пропускаем--
		--ты че
		--бычара????
		--Ех, вотева
		["bm_groza_sc_desc_pc"] = "Буллпап-родственник АК, любящий взрывы.\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_groza_sc_desc"] = "Буллпап-родственник АК, любящий взрывы.\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		--CHIKUBI
		["bm_wp_tkb_m_bakelite"] = "Сибирский магазин 15x3",
		--Krinkov
		["bm_akmsu_sc_desc"] = "Маленькая винтовка против больших людей. Подойдет для любого случая.",
		--Akimbo Krinkov
		["bm_x_akmsu_sc_desc"] = "Маленькие винтовки против больших людей. Подойдут для любого случая.",

		--CUSTOM ARs
			--QBZ-191
			["bm_qbz191_sc_desc"] = "Китайская штурмовая винтовка нового поколения, использующая калибр 5,8х42 мм.\n\n#{skill_color}#Наносит 25% урона через броню.##",
			--AN-94/92
			["bm_tilt_sc_desc"] = "#{risk}#Первые два выстрела## каждого нажатия на курок обладают #{skill_color}#тройной скорострельностью.##",
			--HK G36
			--["bm_w_g36k"] = "СГ 36K",
			--SCAR-L
			--["bm_w_scarl"] = "Игл Лайт",
			--Valmet Rk.62
			--["bm_w_rk62"] = "Вельмер",
			--NV4
			["bm_nova4_sc_desc"] = "Полностью автоматическая баллистическая винтовка. Восхитительная точность за счет уменьшенной скорострельности. Идеальна для перестрелок на средних и дальних дистанциях.",
			["bm_wp_wpn_fps_ass_nova4_flatline_desc"] = "#{skill_color}#Отсутствие штрафа на расстояние##, но #{important_1}#уменьшена скорострельность##.\n#{skill_color}#Увеличена точность##.",
			["bm_wp_wpn_fps_ass_nova4_chaos_desc"] = "#{skill_color}#Увеличена скорострельность от бедра##, #{important_1}#уменьшена скорострельность в прицеливании##.\n#{skill_color}#Уменьшена кучность от бедра##.",
			--VMP Honey Badger
			--["bm_w_bdgr_desc"] = "",
			--MW22 Honey Badger
			["bm_w_mcbravo_desc"] = "#{skill_color}#Встроенный глушитель## и дозвуковые патроны #{risk}#.300 BLK## делают Химеру идеальной для близких дистанций.",
			--BOCW CARV2
			["bm_wp_upg_i_g11"] = "Система К1",
			["bm_wp_upg_i_g11_desc"] = "Увеличивает скорострельность стрельбы очередью до #{skill_color}#2100## и #{skill_color}#дает возможность менять режим стрельбы.##",
			--AR-18
			--["bm_w_ar18"] = "КАР-18",


		--Galant--
		["bm_galant_sc_desc"] = "Классическая винтовка времен Второй мировой. Надежная, точная и  #{skill_color}#быстро перезаряжается при опустошении.##\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.##",
		--M308
		["bm_m14_sc_desc"] = "Довольно меткая винтовка, если следить за отдачей, особенно при автоматической стрельбе.\n\n#{skill_color}##{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.####",
		--FAL
		["bm_fal_sc_desc"] = "Правая рука свободного мира. Ваш выбор, если нужно пробить тяжелую броню.\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##",
		["bm_fal_ap25_sc_desc"] = "Правая рука свободного мира. Ваш выбор, если нужно пробить тяжелую броню.\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		--SCAR
		["bm_scar_sc_desc"] = "Боевая винтовка будущего. Совмещает удобность и урон, она стала популярной у морской пехоты и спецназа.\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##",
		["bm_scar_ap25_sc_desc"] = "Боевая винтовка будущего. Совмещает удобность и урон, она стала популярной у морской пехоты и спецназа.\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		["bm_scarl_sc_desc"] = "Боевая винтовка будущего... или нет. Она заслужила популярность на гражданском рынке, а вот армия не увидела нужды в еще одной винтовке под 5.56.",
		--G3
		["bm_g3_sc_desc"] = "Старшая сестра Компакт-5 и Бреннера-21, не уступает по точности снайперским винтовкам.\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		["bm_g3_ap25_sc_desc"] = "Старшая сестра Компакт-5 и Бреннера-21, не уступает по точности снайперским винтовкам.\n\n#{skill_color}#Наносит 75% урона через броню и может пробивать врагов.##",
		["bm_g3_sg1_sc_desc"] = "Старшая сестра Компакт-5 и Бреннера-21, не уступает по точности снайперским винтовкам.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--Little Friend
		["bm_m203_weapon_sc_desc_pc"] = "Старшая сестра личного АМР 16 Лица со шрамом.\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_m203_weapon_sc_desc"] = "Старшая сестра личного АМР 16 Лица со шрамом.\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		--VMP
		["bm_m203_vmp_sc_desc_pc"] = "Копия \"Маленького дружка\" Лица со шрамом.\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_m203_vmp_sc_desc"] = "Копия \"Маленького дружка\" Лица со шрамом.\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_mesa_vmp_sc_desc_pc"] = "Интересный продукт из украденного груза OMNIA.\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		["bm_mesa_vmp_sc_desc"] = "Интересный продукт из украденного груза OMNIA.\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
		--ASS VAL
		["bm_asval_sc_desc"] = "Обычным людям нравятся обычные винтовки, но кто-то хочет чего-то особенного.\n\nОбладает #{skill_color}#встроенным глушителем##, #{skill_color}#наносит 25% урона через броню и может пробивать врагов.##",
		--Galil
		["bm_galil_sc_desc"] = "Копия финского дизайна, который был скопирован с классического АК. Имитация? Нет, дань уважения!\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##",
		["bm_galil_ap25_sc_desc"] = "Копия финского дизайна, который был скопирован с классического АК. Имитация? Нет, дань уважения!\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		["bm_galil_556_sc_desc"] = "Копия финского дизайна, который был скопирован с классического АК. Имитация? Нет, дань уважения!",
		--KS12
		["bm_shak12_sc_desc"] = "Боевая винтовка по схеме буллпап с мощнейшим калибром 12.7x55мм. Дикая мощность в компактной упаковке.\n\n#{skill_color}##{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.####",
		["bm_shak12_sc_oden_desc"] = "Боевая винтовка по схеме буллпап с мощнейшим калибром 12.7x55мм. Дикая мощность в компактной упаковке.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--ShAK-12
		["bm_wp_shak12_body_vks"] = "Выхлопной приклад",
		["bm_wp_shak12_body_vks_ap_desc"] = "Предоставляет еще более мощный калибр, который позволяет #{skill_color}#пробивать броню и щиты.## Приклад и затвор укреплены тяжелым материалом, что #{important_1}#уменьшает скорострельность.##",

            --Custom DMRs
			--MCX Spear
			["bm_mcx_spear_sc_desc"] = "#{skill_color}#Наносит 75% урона через броню.##",
			["bm_ngsierra_sc_desc"] = "Использует уникальную систему уменьшения отдачи для контроля его пластикового картриджа TCVM.\n\n#{skill_color}#Наносит 75% урона через броню и может пробивать врагов.##",
			--["bm_w_xeno"] = "MA14 Surge Rifle",
			["bm_xeno_sc_desc_pc"] = "\"Armat\" предлагает странную винтовку будущего. #{skill_color}#Интегрирован гранатомет.##\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомет.",
			["bm_xeno_sc_desc"] = "\"Armat\" предлагает странную винтовку будущего. #{skill_color}#Интегрирован гранатомет.##\n\nУдерживайте #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомет",
			--VSS
			["bm_vss_sc_desc"] = "Вариант 'Валькирии' с превосходящими дальностью и точностью.\n\nОбладает #{skill_color}#встроенным глушителем## и #{skill_color}##{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.####",
			--G3 HK79
			["bm_g3hk79_sc_desc_pc"] = "Вариация Гевер 3 с #{skill_color}#подствольным гранатометом.## #{skill_color}##{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.####\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на гранатомет.",
			--BO3 XR2
			["bm_xr2_sc_desc"] = "XR-2 - инструмент, подходящий для самых напряженных боев, который оснащен особым спусковым крючком, который  #{skill_color}#скорострельность при стрельбе очередями.##\n\n#{skill_color}#Наносит 25% урона через броню и может пробивать врагов.##",
			["bm_wp_xr2_handle_01_sc"] = "Полная автоматика",
			["bm_xr2_handle_01_sc_desc"] = "Позволяет  #{skill_color}#полностью автоматический огонь##, но #{important_1}#убирает бонус за стрельбу очередями.##",
			["bm_wp_xr2_handle_02_sc"] = "Быстрые очереди",
			["bm_xr2_handle_02_sc_desc"] = "Увеличивает скорострельность до#{skill_color}#950##, но #{important_1}#увеличивает отдачу.\n\nНе влияет на одиночную стрельбу.##",
	        --SIERRA .458
			["bm_w_sierra458_sc_desc"] = "Собственная разработка Чейнса - мощная и скорострельная альтернатива винтовке 'Текки'.\n\n#{skill_color}#Наносит 50% урона через броню, может пробивать тонкие стены.##",
			["bm_w_sierra458_beo_desc"] = "Собственная разработка Чейнса - мощная и скорострельная альтернатива винтовке 'Текки'.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
			["bm_wp_wpn_fps_snp_sierra458_m_bush_desc"] = "Заменяет патроны .458 SOCOM на #{stats_positive}#ядовитые .450 Bushmaster## которые #{stats_positive}#наносят 30 урона в секунду и могут прерывать врагов.##\n\n#{important_1}#Теперь не может пробивать нескольких врагов.##",
			["bm_w_sierra458_ivy_desc"] = "Собственная разработка Чейнса - мощная и скорострельная альтернатива винтовке 'Текки'.\n\n#{skill_color}#Наносит 50% урона через броню, может пробивать тонкие стены## и #{stats_positive}#наносит урон через время ядом.##",
        --MSR
		["bm_msr_sc_desc"] = "Стандартная винтовка армии США. Хорошие точность, удобность и скрытность делают ее винтовкой на любой случай.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--R700
		["bm_r700_sc_desc"] = "Предок винтовки Раттлснейк. Хорошие точность и удобность, а еще превосходящая дальнобойность по сравнению с младшим братом. В чем подвох? Устаревшие магазины на пять патронов.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--QBU88
		["bm_qbu88_sc_desc"] = "Буллпап-винтовка с востока. Подходит, чтобы нагнетать свою волю на окружающих.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--Winchester 1874
		["bm_winchester1874_sc_desc"] = "Винтовка, покорившая запад. Священная реликвия среди оружия, она до сих пор остается мощной благодаря своему калибру .44-40.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##\n\nМожет #{skill_color}#быстро стрелять## за счет #{important_1}#повышенной отдачи и пониженной дальнобойности.##",
		--TTI(TTY)
		["bm_tti_sc_desc"] = "Личное оружие Уика. Говорят, где-то в интернете можно найти видео, где он выполняет контракт с этой винтовкой.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--Icky Vicky
		--["bm_victor_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, enemies, shields and thin walls.##",
		--Scunt
		--["bm_scout_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, enemies, shields and thin walls.##",
		["bm_wp_scout_m_extended"] = "Магазин дуэлянта",
		--AWP
		["bm_awp_sc_desc"] = "Винтовка, известная дальнобойностью и точностью. Кто бы мог подумать, что ее собрали три энтузиаста в сарае?\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		["bm_awp_cs_dragon"] = "АВП | Драгон Лор",
		["bm_awp_cs"] = "АВП",
		["bm_wp_upg_bazooka"] = "Беспонтовый Слонобой",
		["bm_wp_upg_bazooka_desc"] = "Высокий риск - высокая награда. 'Слонобой' известен правилом 'один выстрел - одно убийство'.\n\n#{skill_color}#Позволяет пробивать титановые щиты.##\n\n#{risk}#После выстрела Вы выходите из режима прицеливания.##",
		["bm_bazooka_sc_desc"] = "Высокий риск - высокая награда. 'Слонобой' известен правилом 'один выстрел - одно убийство'.\n\n#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##\n\n#{risk}#После выстрела Вы выходите из режима прицеливания.##",
        --WA2000
		["bm_wa2000_sc_desc"] = "Их существует всего несколько сотен. Винтовка для престижного хитмана.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--Rangerhitter
		["bm_sbl_sc_desc"] = "Рычажная винтовка двадцатого века, которая превосходит винтовки девятнадцатого века благодаря увеличенной пуле. Больше отдачи - больше смертоносности, когда на твоей стороне .45-70.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##\n\nМожет #{skill_color}#быстро стрелять## за счет #{important_1}#повышенной отдачи и пониженной дальнобойности.##",
		--Contender G2
		["bm_contender_sc_desc"] = "",
		--Model 70
		["bm_model70_sc_desc"] = "Ранняя болтовка, сделанная дизайнерами Репитера 1874.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--SVD
		["bm_siltstone_sc_desc"] = "Мощная полуавтоматическая винтовка из семейства AK. Как и у других членов семьи, ее репутация проверена временем.\n\n#{skill_color}#Может пробивать броню, врагов, щиты (до начала падения урона) и тонкие стены.##",
		--Mosin--
		["bm_mosin_sc_desc"] = "Не хватает даже на еду, но нужен ствол? Подойдет эта классическая мощная винтовка со скользящим затвором.\n\nПерезаряжается обоймами по 5 патронов и #{skill_color}#может пробивать броню, врагов, щиты и тонкие стены.##",
		["bm_wp_upg_a_tranq_mosin"] = "Транквилизаторы",
		["bm_wp_upg_a_tranq_mosin_desc"] = "For true oblivion, The End.\n\n#{stats_positive}#Транквилизаторы## наносят #{skill_color}#30 урона/сек в течение 6 секунд и могут прерывать врагов.##\n\n#{important_1}#Теперь не может пробивать нескольких врагов.##",
		["bm_mosin_tranq_desc"] = "Не хватает даже на еду, но нужен ствол? Подойдет эта классическая мощная винтовка со скользящим затвором.\n\nПерезаряжается обоймами по 5 патронов,\n\n#{stats_positive}#наносит урон через время транквилизаторами## и #{skill_color}#может пробивать броню, щиты и тонкие стены.##",
        --Desert Fox
		["bm_desertfox_sc_desc"] = "Компактная снайперская платформа, использовавшаяся Уиком при рейде на убежище русской мафии.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--R93
		["bm_r93_sc_desc"] = "Немецкая винтовка с большой пулей, которая остановит больших людей. Популярная винтовка среди полиции и контр-террористических подразделений мира.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		--Flinklock
		["bm_bessy_sc_desc"] = "Хорошо организованная милиция необходима для безопасности свободного государства, и право людей хранить и носить оружие не должно нарушаться.\n\n#{skill_color}#Наносит на 100% больше урона специальным и элитным врагам.\nМожет пробивать нескольких врагов, их броню, щиты, титан-щиты и тонкие стены.##",
		--Thanatos--
		["bm_m95_sc_desc"] = "Крупнокалиберная винтовка, обычно используется против небольшой техники. Использовать ее против органических целей, вероятно, военное преступление.\n\n#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		--Custom Snipers
			--Guerilla
			--["bm_w_sgs"] = "Партизан 553",
			--M107
			["bm_m107cq_sc_desc"] = "Не понравился Танатос? Морс .50 превращает врагов в красную пасту еще эффективнее.\n\n#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
			["bm_m200_sc_desc"] = "Для любителей 360 no-scope.\n\n#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
			--S7
			["bm_w_srs99_s7_desc"] = "I see headshots in your future, Spartan.\n\n#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
			["bm_w_srs99_s7_flexfire_desc"] = "I see headshots in your future, Spartan.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
			["flexfire_desc"] = "#{important_1}#Увеличение прицела будет равняться 3х\nНе может пробивать титановые щиты.##",
			["oracle_scope"] = "Прицел Oracle TechLink",
			["oracle_scope_desc"] = "Меняет точку прицела на #{skill_color}#Smart-Link##.\n#{risk}#Увеличение 5-10x.##",
		--Marlin 1894
		--["bm_w_m1894"] = "Mare's Leg",
		--SPX Centerfire
		--["bm_w_moss464spx"] = "Москони ЭсПиЭкс",
		--Winchester 1894
		--["bm_w_winchester1894"] = "Репитер 1894",
		--SVD
		["bm_wp_wpn_fps_snp_svd_pso"] = "Оптический прицел СВ-7",
		--L115
		--["bm_w_l115"] = "АИМ 90",
		--Highly Modified CAR-4
		["bm_hmcar_sc_desc"] = "Когда полиция избавлялась от этого оружия, вы решили прибрать его к себе.\n\nСтреляет #{stat_maxed}#патронами титанового снайпера##, которые #{skill_color}#пробивают врагов, броню, щиты (до начала падения урона) и тонкие стены##. Альтернативный огонь выстреливает #{event_color}#снайперский патрон максимальной мощности##, который #{skill_color}#тратит в два раза больше патронов##, но #{skill_color}#наносит в два раза больше урона и пробивает титановые щиты.##",
		["bm_wp_hmcar_hd_kit"] = "Набор 32bit 8K HD",
		["bm_wp_hmcar_hd_kit_desc"] = "Application has crashed: C++ exception\nCould not load texture because IDirect3D9::CreateTexture call failed.\nDirect3D could not allocate sufficient memory to complete the call.\n\n\n\n\n\n\n ",
		--ONE OF A KIND HOLY GRAIL
		["bm_w_holygrail"] = "СРАНЬ ГОСПОДНЯ",
		["menu_l_global_value_holygrailmod"] = "ЭТО ЧТО ВООБЩЕ ТАКОЕ???\n\n",

		--Light Crossbow
		["bm_w_frankish_avelyn"] = "Авелин",
		["bm_wp_avelyn"] = "Набор Авелин",
		["bm_wp_avelyn_desc"] = "Превращает арбалет в #{skill_color}#репитер##.\nПозволяет запускать очередь из #{skill_color}#3## болтов одним нажатием.",
		["bm_wp_avelyn_override_desc"] = "Очень редкий экземпляр скорострельного арбалета.\nПоследовательно стреляет #{skill_color}#3-мя## болтами.\n\n#{skill_color}#Может пробивать броню.##",
		--GL40
		["bm_w_gre_m79_sc_desc"] = "Стук - бум.\n\nНажмите #{skill_color}#$BTN_GADGET## чтобы поднять прицел.\n\nПрицел #{risk}#выверен на 30 метров.##",
		--3GL
		["bm_w_ms3gl"] = "Василиск",
		["bm_ms3gl_sc_desc"] = "Стреляет укомплектованными вместе 40мм гранатами, позволяя быстро выстреливать по несколько зарядов.\n\nАльтернативный огонь #{skill_color}#выстреливает три гранаты разом.##",
		--PIGLET/M32
		["bm_m32_sc_desc"] = "Никто не спасется от этого шестизарядного гранатомета... Пока вам не понадобится перезаряжаться.",
		--China Puff
		["bm_w_china_sc_desc"] = "Нажмите #{skill_color}#$BTN_GADGET## чтобы поднять прицел.\n\nПрицел #{risk}#выверен на 30 метров.##",
		--Compact 40mm
		--["bm_w_slap"] = "Компакт 40",
		--Arbiter
		--["bm_w_arbiter"] = "Арбитр",
		--RPG
		--["bm_w_rpg7"] = "РПГ",
		--COMMANDO 101/M202 FLASH
		--["bm_w_ray"] = "Коммандо 101",
		["bm_ray_sc_desc"] = "Ракеты создают #{heat_warm_color}#огненные лужи## и #{skill_color}#мгновенно уничтожают турели.##",

		--Всякое для русека
		["bm_w_hailstorm"] = "Хейлшторм Марк 5",
		["bm_w_saw"] = "Пила ОВЕ9000",
		["bm_w_plainsrider"] = "Лук Плейнсрайдер",
		["bm_w_elastic"] = "Лук ДЕКА",
		["bm_w_flamethrower_mk2"] = "Огнемет Марк 1",
		["bm_w_cobray"] = "Пушка Джакета",
		["bm_w_m134"] = "Вулкан",
		--Милишки
		["bm_melee_kabar_tanto"] = "Нож УРСА-Танто",
		["bm_melee_kabar_tanto"] = "Нож УРСА",
		["bm_melee_alien_maul"] = "Альфа-Молот",
		["bm_melee_spoon"] = "Смехотворно огромная ложка",
		["bm_melee_spoon_gold"] = "Смехотворно золотая ложка",
		["bm_melee_shovel"] = "Лопата КЛАСС",
		["bm_melee_oxide"] = "Резкий",
		["bm_melee_chac"] = "Эль Ритмо",
		["bm_melee_agave"] = "Эль Вердуго",
		["bm_melee_kampfmesser"] = "Нож Кригер",
		["bm_melee_cs"] = "Бензопила Ламбер Лайт Л2",
		["bm_melee_brick"] = "Хотлайн 8000",
		["bm_melee_boxing_gloves"] = "Боксерские перчатки ОВЕРКИЛЛ",
		["bm_melee_sandsteel"] = "Катана Шинсакуто",
		["bm_melee_gerber"] = "Боевой нож Бергер",
		["bm_melee_rambo"] = "Боевой нож Траутман",

		--Ванилька мод пак - адаптация под рулок рестора
	    ["bm_w_amr12"] = "АМР-12",
	    ["bm_w_ak5s"] = "Автомат-5",
	    ["bm_w_x_ak5s"] = "Парные Автомат-5",
	    ["bm_w_sg416"] = "СГ 416",
	    ["bm_w_beck"] = "Рейнбек M1",
	    ["bm_w_car9"] = "АКАР-9",
	    ["bm_w_smolak"] = "Дракон 5.45",
	    ["bm_w_spike"] = "Спайкер 7.62",
	    ["bm_w_cold"] = "Кросскилл Протектор",
	    ["bm_w_x_cold"] = "Парные Кросскилл Протектор",
	    ["bm_w_x_smolak"] = "Парные Драконы 5.45",
	    ["bm_w_x_car9"] = "Парные АКАР-9",
	    ["bm_w_sgs"] = "Партизан .308",
	    ["bm_w_lebman"] = "Вендетта .38",
	    ["bm_w_aknato"] = "Мамба 5.56",
	    ["bm_w_x_lebman"] = "Вендетта .38",
	    ["bm_w_bdgr"] = "Хорнет .300",
	    ["bm_w_minibeck"] = "Рейнбек Авто",
	    ["bm_w_bs23"] = "Молот 23",

	    --прочие моды на оружие
		["bm_w_hmcar"] = "Модифицированный КАР-4",
		["bm_wp_wpn_fps_upg_goodlaser"] = "Прицельный лазер",
        ["bm_wp_wpn_fps_upg_o_hmscope"] = "Дальнобойный прицел",

		["bm_w_super"] = "Супер двустволка",
	    ["bm_wp_wpn_fps_upg_super_body_burst"] = "Двойное веселье",
	    ["bm_wp_wpn_fps_upg_super_body_burst_desc"] = "Стреляет из двух стволов сразу.",
	    ["bm_wp_wpn_fps_upg_super_classic"] = "Старая школа",
	    ["bm_wp_wpn_fps_upg_super_meathook"] = "Крюк",

		["bm_w_czevo"] = "Кобра Марк 4",
        ["bm_w_ppsh"] = "ШПП-42",
        ["bm_w_ks23"] = "Молот 24",
        ["bm_w_nova4"] = "Нова 4",
        ["bm_w_owlfbullpup"] = "Питбуль 5.56",
        ["bm_w_xeno"] = "Пульсовая винтовка M41A",
        ["bm_w_plasmaproto"] = "Прототип плазморужья",
        ["bm_w_mcx_spear"] = "Пейпервейт",
        ["bm_w_rsass"] = "Рейнджхиттер 11",
        ["bm_w_troglodyte"] = "АВМ-Ф",
        ["bm_w_as24"] = "А24 Уничтожитель",
        ["bm_w_raygun"] = "Лучемет",
        ["bm_w_fp45"] = "Фридом .45",
        ["bm_w_m6d"] = "Чиф 12.7",
        ["bm_w_jackhammer"] = "Отбойник 12",
        ["bm_w_hx25"] = "КФ-25",

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_ene_hs_mult_sub"] = "Урон в голову уменьшен на ",
		["bm_menu_weapon_ene_hs_mult_add"] = "Урон в голову увеличен на ",
		["bm_menu_weapon_ene_hs_mult_end"] = ".",
		["bm_menu_weapon_multishot_1"] = "Урон поделен на",
		["bm_menu_weapon_multishot_2"] = "дробинок, каждая из которых наносит",
		["bm_menu_weapon_multishot_3"] = "урона.",
		["bm_menu_weapon_hs_mult_1"] = "Урон в голову увеличен на ",
		["bm_menu_weapon_hs_mult_2"] = " для всех противников, кроме капитанов.",
		["bm_menu_weapon_exp_no_hs_info"] = "\n#{risk}#Используются взрывные боеприпасы; Урон поделен поровну между пулей и взрывом.##",
		["bm_menu_weapon_movement_penalty_info"] = "Скорость передвижения уменьшена на ",
		["bm_menu_weapon_movement_bonus_info"] = "Скорость передвижения увеличена на ",
		["bm_menu_weapon_sms_bonus_info"] = "Скорость передвижения при стрельбе увеличена на ",
		["bm_menu_weapon_movement_penalty_info_2"] = " , когда оружие в руках",
		["bm_menu_sms_info_cont"] = "штраф увеличивается во время стрельбы.",
		["bm_menu_sms_info_cont_2"] = "штраф увеличивается во время стрельбы из-за установленных модулей.",
		["bm_menu_sms_info_2"] = " при стрельбе.",
		["bm_menu_stat_sms_info_2"] = " во время стрельбы из-за установленных модулей.",
		["bm_menu_weapon_slot_search_empty"] = "\n##НИЧЕГО НЕ НАЙДЕНО ПО ЗАПРОСУ## ##\"$search\"##",
		["bm_menu_weapon_slot_warning_1"] = "\n##//////////               НЕ ИСПОЛЬЗОВАТЬ               //////////\n",
		["bm_menu_weapon_slot_warning_2"] = "\n//////////               НЕ ИСПОЛЬЗОВАТЬ               //////////##",
		["bm_menu_weapon_slot_warning_primary"] = "ОРУЖИЕ БЫЛО ПЕРЕМЕЩЕНО В ОСНОВНОЙ СЛОТ\nПРИ ИСПОЛЬЗОВАНИИ ВО ВТОРОСТЕПЕННОМ СЛОТЕ ПРОИЗОЙДЕТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_secondary"] = "ОРУЖИЕ БЫЛО ПЕРЕМЕЩЕНО ВО ВТОРОСТЕПЕННЫЙ СЛОТ\nПРИ ИСПОЛЬЗОВАНИИ В ОСНОВНОМ СЛОТЕ ПРОИЗОЙДЕТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_disabled"] = "ОРУЖИЕ ОТКЛЮЧЕНО КАПИТАНОМ ОТЕМОМ\nПРИ ИСПОЛЬЗОВАНИИ ПРОИЗОЙДЕТ ВЫЛЕТ",
		["bm_menu_weapon_slot_warning_wtfdoido"] = "НЕ ИСПОЛЬЗОВАТЬ ЭТО ОРУЖИЕ.\n\nНА ДАННЫЙ МОМЕНТ НЕТ ВОЗМОЖНОСТИ ЕГО ЗАБАЛАНСИТЬ",
		["empty"] = "",
		["missing_cap"] = "#{risk}#Custom Attachment Points## #{important_1}#не установлен.##\n\nМодуль будет выглядеть как стандартный модуль слота.",
		["bm_slamfire_generic_desc"] = "Альтернативный огонь позволяет #{skill_color}#отстрелять боезапас в три раза быстрее## за счет #{important_1}#отдачи, точности и невозможности прицеливания.##",
		["bm_rapidfire_generic_desc"] = "Может #{skill_color}#быстро стрелять## за счет #{important_1}#повышенной отдачи и пониженной дальнобойности.##",
		["bm_ap_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
		["bm_ap_weapon_semi_sc_desc"] = "#{skill_color}#Может пробивать броню, нескольких врагов, щиты в пределах максимального расстояния и тонкие стены.##",
		["bm_ap_armor_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню.##",
		["bm_ap25_armor_weapon_sc_desc"] = "#{skill_color}#Позволяет дополнительно наносить 25% урона через броню.##",
		["bm_ap_armor_25_weapon_sc_desc"] = "#{skill_color}#Наносит 25% урона через броню.##",
		["bm_ap_armor_50_weapon_sc_desc"] = "#{skill_color}#Наносит 50% урона через броню и может пробивать врагов.##",
		["bm_ap_armor_75_weapon_sc_desc"] = "#{skill_color}#Наносит 75% урона через броню и может пробивать врагов.##",
		["bm_pdw_gen_sc_desc"] = "#{skill_color}#Наносит 75% урона через броню.##",
		["bm_heavy_ap_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		["bm_heavy_ap_no_mult_weapon_sc_desc"] = "#{skill_color}#Может пробивать броню, врагов, щиты, титановые щиты и тонкие стены.##",
		["bm_ap_2_weapon_sc_desc"] = "Стрелы можно подобрать обратно. Чем дольше держать тетиву, тем выше будет дальность.\n\n#{skill_color}#Может пробивать броню.##",
		["bm_ap_3_weapon_sc_desc"] = "Стрелы можно подобрать обратно.\n\n#{skill_color}#Может пробивать броню.##",
		["bm_bow_sc_desc"] = "Зажмите #{skill_color}#$BTN_FIRE## чтобы приготовить стрелу, отпустите для стрельбы.\nЧем сильнее стрела оттянута, тем выше будут урон и дальность.\n\nНажмите #{skill_color}#$BTN_AIM##, чтобы опустить стрелу.\n\nИспользованные стрелы можно забрать обратно.\n#{skill_color}#Пробивает броню.##",
		["bm_bow_exp_sc_desc"] = "Зажмите #{skill_color}#$BTN_FIRE## чтобы приготовить стрелу, отпустите для стрельбы.\nЧем сильнее стрела оттянута, тем выше будут урон и дальность.\n\nНажмите #{skill_color}#$BTN_AIM##, чтобы опустить стрелу.\n\n#{risk}#Стрелы взрываются при попадании. Урон поделен поровну между прямым попаданием стрелой и взрывом.##",
		["bm_w_bow_exp_desc"] = "Стрелы #{risk}#взрываются## при попадании с радиусом в #{skill_color}#2## метра.\n\n#{important_1}#Скорость полета стрел снижена и их нельзя подобрать.##",
		["bm_w_bow_light_poison_desc"] = "Стрелы обладают #{stats_positive}#ядом##, который оглушает врагов и наносит #{stats_positive}#180## урона ядом в течение #{skill_color}#6## секунд.\n\n#{important_1}#Скорость полета стрел слегка снижена.##",
		["bm_w_bow_heavy_poison_desc"] = "Стрелы обладают #{stats_positive}#ядом##, который оглушает врагов и наносит #{stats_positive}#240## урона ядом в течение #{skill_color}#8## секунд.\n\n#{important_1}#Скорость полета стрел слегка снижена.##",
		["bm_xbow_sc_desc"] = "Использованные болты можно забрать обратно.\n\n#{skill_color}#Пробивает броню.##",
		["bm_xbow_exp_sc_desc"] = "#{risk}#Болты взрываются при попадании. Урон поделен поровну между прямым попаданием болта и взрывом.##",
		["bm_w_xbow_exp_desc"] = "Болты #{risk}#взрываются## при попадании с радиусом в #{skill_color}#2## метра\n\n#{important_1}#Дальность болтов снижена и их нельзя подобрать.##",
		["bm_w_xbow_light_poison_desc"] = "Болты обладают #{stats_positive}#ядом##, который оглушает врагов и наносит #{stats_positive}#180## урона ядом в течение #{skill_color}#6## секунд.\n\n#{important_1}#Скорость полета болтов слегка снижена.##",
		["bm_w_xbow_heavy_poison_desc"] = "Болты обладают #{stats_positive}#ядом##, который оглушает врагов и наносит #{stats_positive}#240## урона ядом в течение #{skill_color}#8## секунд.\n\n#{important_1}#Скорость полета болтов слегка снижена.##",
		["bm_airbow_sc_desc"] = "Использованные стрелы можно забрать обратно.\n\n#{skill_color}#Пробивает броню.##",
		["bm_airbow_exp_sc_desc"] = "#{risk}#Стрелы взрываются при попадании. Урон поделен поровну между прямым попаданием стрелы и взрывом.##",
		["bm_w_airbow_poison_desc"] = "Стрелы обладают #{stats_positive}#ядом##, который оглушает врагов и наносит #{stats_positive}#120## урона ядом в течение #{skill_color}#4## секунд.\n\n#{important_1}#Скорость полета стрелы слегка снижена.##",
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
		["loot_sc_wcc_desc"] = "ЭТО ПРЕДМЕТ ИЗ RESTORATION! (Необходим WEAPON COLOR PACK 2)",
		["loot_sc_ocp_desc"] = "ЭТО ПРЕДМЕТ ИЗ RESTORATION! (Необходим WEAPON COLOR PACK 3)",
		["loot_sc_faco_desc"] = "ЭТО ПРЕДМЕТ ИЗ RESTORATION! (Необходим JIU FENG SMUGGLER PACK 1)",

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
		["bm_melee_pattern_knife"] = "Атакует быстрыми ударами. Заряженная атака (#{skill_color}#на 50% и более##) бьет с небольшим размахом.",

		["bm_melee_pattern_knife2"] = "Бьет с широким размахом. Движение в сторону влияет на направление атаки.", --Also works with "melee_clean" and "melee_grip"

		["bm_melee_pattern_ballistic"] = "Атакует быстрыми ударами. Заряженная атака (#{skill_color}#на 50% и более##) бьет размахом и сверху вниз. Движение в сторону влияет на направление атаки.",
		["bm_melee_pattern_poker"] = "Бьет атаками сверху вниз. Заряженная атака (#{skill_color}#на 50% и более##) бьет выпадом вперед.",

		["bm_melee_pattern_boxcutter"] = "Бьет с широким размахом.", --Also works with "melee_catch" and "melee_agave"

		["bm_melee_pattern_shield"] = "Атакует обычным ударом. Заряженная атака (#{skill_color}#на 50% и более##) бьет размахом.",

		["bm_melee_pattern_briefcsae"] = "Атакует обычным ударом. Заряженная атака (#{skill_color}#на 50% и более##) бьет размахом.",

		["bm_melee_pattern_blunt"] = "Бьет атаками сверху вниз. Заряженная атака (#{skill_color}#на 50% и более##) бьет размахом.", --Also works with "melee_brick", "melee_happy", "melee_cleaver", "melee_beardy"
		["bm_melee_pattern_blunt_90"] = "Бьет атаками сверху вниз. Заряженная атака (#{skill_color}#на 50% и более##) бьет широким размахом.",

		["bm_melee_pattern_beardy"] = "Бьет атаками сверху вниз. Заряженная атака (#{skill_color}#на 50% и более##) бьет размахом. Движение в сторону влияет на направление атаки.",

		["bm_melee_pattern_axe"] = "Бьет атаками сверху вниз.", --Also works with "melee_psycho" and "melee_pickaxe"

		["bm_melee_pattern_cutter"] = "Бьет атаками сверху вниз. Заряженная атака (#{skill_color}#на 50% и более##) бьет выпадом вперед.",

		["bm_melee_pattern_great"] = "Бьет атаками сверху вниз, а движения в сторону позволяют провести атаку с широким размахом. Заряженная атака (#{skill_color}#на 90% и более##) бьет выпадом вперед, увеличивая дальность атаки.",
		["bm_melee_pattern_great_no_stab"] = "Бьет атаками сверху вниз, а движения в сторону позволяют провести атаку с широким размахом.", -- Also works for "melee_cs"

		["bm_melee_pattern_katana"] = "Бьет по диагонали. Движения в сторону позволяют провести атаку с широким размахом.",

		["bm_melee_pattern_fist"] = "Атакует быстрыми ударами. Заряженная атака (#{skill_color}#на 50% и более##) позволяет прописать хук оппоненту. Движение в сторону влияет на направление атаки.",

		["bm_melee_pattern_boxing"] = "Атакует быстрыми ударами. Заряженная атака (#{skill_color}#на 50% и более##) позволяет прописать оппоненту хук с левой или апперкот с правой. Движение в сторону влияет на направление атаки.",

		["bm_melee_pattern_tiger"] = "Атакует быстрыми ударами. Заряженная атака (#{skill_color}#на 50% и более##) позволяет прописать оппоненту апперкот с левой или хук с правой. Движение в сторону влияет на направление атаки.",

		["bm_melee_pattern_jab"] = "Атакует быстрыми ударами.", --For anything that basically only has centered hitboxes like "melee_pitchfork", "melee_wing" and "melee_fight"

		["bm_melee_weapon_info"] = "Обычно жертв ограбления бьют прикладом, а не стреляют в них.\n\nСкорость удара зависит от Компактности оружия.",
		["bm_melee_katana_info"] = "Свежескованная катана, которая еще не пробовала кровь - она ждет своего владельца. Кажется, она его нашла.\n\nПолностью заряженные атаки бьют на #{skill_color}#50%## быстрее, позволяя быстро повторить атаку.\n\nПри игре за Джиро, убийство Клокера имеет особый визуальный эффект.",
		["bm_melee_raiden_info"] = "This is no \"tool of justice\" in your hands.\n\nПолностью заряженные атаки бьют на #{skill_color}#50%## быстрее, позволяя быстро повторить атаку.",
		["bm_melee_thejobissnotyours_info"] = "This isn't even your sword.\n\nПолностью заряженные атаки бьют на #{skill_color}#50%##быстрее, позволяя быстро повторить атаку.",
		["bm_melee_thebestweapon_info"] = "Лучшее оружие в игре.",
        ["bm_melee_2077tkata_info"] = "Катана из раскаленного нано-волокна.\nЧистая эссенция катаны - никаких примочек, лишь закаленная сталь.\n\nПолностью заряженные атаки поджигают врагов, нанося #{heat_warm_color}#120## огненного урона в течение #{skill_color}#3## секунд.",
		["bm_melee_buck_info"] = "Удивительно эффективен против современного оружия.\n\nУменьшает получаемый урон на #{skill_color}#10%## во время замаха.", --Buckler Shield
		["bm_melee_briefcase_info"] = "Что бы там внутри не было, оно довольно крепкое.\n\nУменьшает получаемый урон на #{skill_color}#10%## во время замаха.", --Briefcase
		["bm_melee_pitch_info"] = "Грабительская готика.\n\nБег запускает атаку, которая наносит #{skill_color}#45## секунд каждые #{skill_color}#0.4## секунды врагам, на которых вы бежите. Навыки позволяют увеличить этот урон.\n\nПопадание по врагу во время бега тратит #{important_1}#15% стамины##, убийство врага возвращает #{skill_color}#10%##.\n\n#{important_1}#Не позволяет парировать атаки.##", --Randal Pitchfork
		["bm_melee_charge_info"] = "Бег запускает атаку, которая наносит #{skill_color}#45## секунд каждые #{skill_color}#0.4## секунды врагам, на которых вы бежите. Навыки позволяют увеличить этот урон.\n\nПопадание по врагу во время бега тратит #{important_1}#15% стамины##, убийство врага возвращает #{skill_color}#10%##.\n\n#{important_1}#Не позволяет парировать атаки.##",
		["bm_melee_cs_info"] = "Рви их в клочья, пока не уничтожишь всех.\n\nНаносит #{skill_color}#30## урона каждые #{skill_color}#0.25## секунд тому, кто стоит впереди вас во время зарядки. Этот урон можно улучшить навыками.\n\n#{important_1}#Не позволяет парировать атаки.##", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Вжуууууух.\n\nНаносит #{skill_color}#18## урона каждые #{skill_color}#0.18## секунд тому, кто стоит впереди вас во время зарядки. Этот урон можно улучшить навыками.\n\n#{important_1}#Не позволяет парировать атаки.##", --Kazaguruma
		["bm_melee_wing_info"] = "Хорошо подходит к набору маскировки!\n\nНаносит #{skill_color}#четырехкратный## урон при атаке сзади.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Придуманный для насилия, смертельный как револьвер - это выкидной нож!\n\nНаносит #{skill_color}#двойной## урон при атаке сзади.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Не думаю, что он подойдет для мяса.\n\nПолностью заряженные удары разносят панику в радиусе #{skill_color}#12## метров от вас.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "Меч, собранный из кошмаров.\n\nПолностью заряженные удары разносят панику в радиусе #{skill_color}#12## метров от вас.", -- Headless Dozer Sword
		["bm_melee_titan_hammer_info"] = "Молот, собранный из кошмаров.\n\nПолностью заряженные удары разносят панику в радиусе #{skill_color}#12## метров от вас.",
		["bm_melee_goat_info"] = "Полностью заряженные удары разносят панику в радиусе #{skill_color}#12## метров от вас.", -- ай-яй-яй
		["bm_melee_great_info"] = "Меч, ставший знаменитым благодаря Уильяму Уоллесу. Шестифутовый клинок из острой как бритва стали отрубает любую конечность за один взмах.", -- Great Sword
		["bm_melee_jebus_info"] = "Свет и мрак.\n\nЧерное и белое.\n\nЖизнь и смерть.\n\nБинарный меч не знает середины, он отключает врагов.",
		["bm_melee_nin_info"] = "Стреляет гвоздями, которые мгновенно летят на маленькое расстояние. Считается за оружие ближнего боя.", -- Pounder
		["bm_melee_thebestweapon_info"] = "#{stats_positive}#Лучшее оружие в игре.##",
		["bm_melee_iceaxe_info"] = "Используется альпинистами для взбирания в гору. Что-то мне подсказывает, что вы не будете заниматься альпинизмом.\n\nНаносит на #{skill_color}#50%## больше урона в голову.", -- Icepick
		["bm_melee_iceaxe_gen_info"] = "Наносит на #{skill_color}#50%## больше урона в голову.",
		["bm_melee_mining_pick_info"] = "Эта кирка старого образца когда-то использовалась золотоискателями в надежде найти заветный куш. Время идет, а что-то все равно не меняется.\nНаносит на #{skill_color}#50%## больше урона в голову.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nУбийства, совершенные этим оружием, #{skill_color}#полностью восстановят выносливость.##", -- OVERKILL Boxing Gloves
		["bm_melee_freedom_info"] = "Тринадцать полос красного, чередующихся с белым, синий прямоугольник в кантоне, пятьдесят маленьких белых пятиконечных звезд, щепотка патриотизма, две чашки свободы и сломанный флагшток.\n\nВуаля - у тебя есть смертоносное оружие.",
		["bm_melee_clean_info"] = "Пусть копы побреются.\n\nНаносит #{skill_color}#120## урона в течение #{skill_color}#трех## секунд.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "Отличное оружие против ходячих мертвецов. Наносит #{skill_color}#120## урона в течение трех секунд.", --Lucille Baseball Bat
		["bm_melee_bleed_info"] = "Наносит #{skill_color}#120## урона в течение #{skill_color}#трех## секунд.",
		["bm_melee_inner_child_info"] = "Твой внутренний ребенок рвется наружу.\n\nНаносит 120 урона в течение трех секунд.",
		["bm_melee_spoon_gold_info"] = "Не бойся вилки, бойся ложки, один удар - и череп в крошки. \n\n#{skill_color}#50%## шанс нанести #{heat_warm_color}#120## огненного урона и прервать врага на #{skill_color}#3## секунды.", --Gold Spoon
		["bm_melee_fire_info"] = "#{skill_color}#50%## шанс нанести #{heat_warm_color}#120## огненного урона и прервать врага на #{skill_color}#3## секунды.",
		["bm_melee_cqc_info"] = "Даже самый сильный и могучий противник упадет, если его хоть раз коснется этот пропитанный ядом кунай.\n\nСодержит экзотический яд, который наносит #{stats_positive}#120## урона и имеет #{skill_color}#50%## шанс прервать врага раз в #{skill_color}#0.5## секунд, в течение #{skill_color}#четырех## секунд.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Будь водой, друг мой.\n\nПарирование противника наносит ему #{skill_color}#120## урона в ближнем бою. Навыки позволяют увеличить этот урон.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "Ты кто такой, чтобы это делать?\n\nИмеет #{skill_color}#5%## шанс нанести #{skill_color}#десятикратные## урон и нокдаун.",
		["bm_melee_specialist_info"] = "Теперь в два раза больше лезвий.\n\nНаносит #{skill_color}#двойной## урон после первого удара.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "Специальное оружие для вытаскивания кишок в течение десяти минут.\n\nНаносит на #{important_1}#50%## меньше урона в голову, но эффективен для ударов по телу и конечностям.",
		["bm_melee_meat_cleaver_info"] = "Специальное оружие Драгана, которое он использовал до вступления в банду PAYDAY для выполнения #{important_1}#\"очень грязной\"## работы.\n\nНаносит на #{important_1}#50%## меньше урона в голову, но эффективен для ударов по телу и конечностям.",
		["bm_melee_erica_info"] = "Адекватные люди бросают это во врагов.\n\nПолностью заряженные удары по врагам имеют #{skill_color}#5%## шанс взорваться, нанося #{risk}#720## урона в #{skill_color}#5## метровом радиусе.",
		["bm_melee_piggy_hammer_info"] = "Наносит на #{skill_color}#100%## больше урона особым и элитным врагам.\n\nИмеет шанс наложить один из #{risk}#эффектов## при успешном попадании:\n\n-#{skill_color}#12%## шанс вызвать #{important_1}#кровотечение##\n-#{skill_color}#7%## шанс ударить противника #{ghost_color}#током##\n-#{skill_color}#5%## шанс вызвать #{stats_positive}#отравление##\n-#{skill_color}#1%## шанс #{risk}#убить противника мгновенно##",
		["bm_melee_kabar_info"] = "Нож URSA - это износостойкий, неразрушимый боевой/хозяйственный нож, выпущенный в 1942 году.\n\nНастоящая классика среди ценителей ножей.",
		["bm_melee_kampfmesser_info"] = "Официальный боевой нож Вооруженных сил Германии Бундесвера. Ножи этой серии производятся в соответствии со строгими стандартами ISO с существенно улучшенной режущей способностью.\n\nОтличный выбор при схватке с врагом с глазу на глаз.",
		["bm_melee_gerber_info"] = "Боевой нож Berger - популярный тактический нож со складывающимся клинком. Компактный, легкий и изготовленный из высокотехнологичных материалов - это все, что нужно для хорошего ножа.",
		["bm_melee_rambo_info"] = "Нож для выживания с тяжелым лезвием типа \"Боуи\". Длина, пилообразный корешок и заостренный по центру наконечник одинаково хорошо подходят как в дикой местности, так и в ближнем бою.",
		["bm_melee_kabar_tanto_info"] = "Форма клинка Танто, характерная для ножей из Азии, имеет толстое заостренное лезвие и хорошую проникающую способность. Этот нож предназначен для самых сложных задач.",
		["bm_melee_tomahawk_info"] = "Когда вы находитесь в ситуации, когда время имеет решающее значение, вы не можете тратить время на размышления о том, есть ли у вас подходящий инструмент для ограбления. Независимо от того, что находится по ту сторону двери или хранилища, вам нужен инструмент с такой же целеустремленностью, как у грабителя, владеющего им.",
		["bm_melee_becker_info"] = "Специализированное мачете, которое может крушить, колотить, поддевать и резать.\nОдинаково эффективен для вскрытии дверей и окон, выбивании витрин, а также при перерезании полицейских стяжек.",
		["bm_melee_baton_info"] = "Самое тактически совершенное оружие, доступное для правоохранительных органов.\nПротестирован самыми элитными федералами. Зарекомендовал себя как практически несокрушимое оружие по наведению порядка.",
		["bm_melee_happy_info"] = "Личная телескопическая дубинка Джой для борьбы с не виртуальными противниками.",
		["bm_melee_shovel_info"] = "Лопата КЛАСС может использоваться для различных рекреационных целей. Ее также можно использовать как оружие - острыми краями можно резать плоть и кости, а плоской частью можно загнать какого-нибудь бедолагу в могилу.",
		["bm_melee_moneybundle_info"] = "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!",
		["bm_melee_fists_info"] = "Ты не боксер, но все равно можешь нанести довольно хороший удар.\nВсе, что требуется, - это немного силы, скорости и времени, и ты нанесешь сокрушительный удар в мгновение ока.",
		["bm_melee_brass_knuckles_info"] = "Кастеты использовались во всем мире на протяжении сотен лет.\nКастеты концентрируют силу удара, позволяя с легкостью нанести ушибы или даже переломать несколько костей оппоненту.",
		["bm_melee_bayonet_info"] = "Прочный штык, предназначенный для крепления на конце вашей винтовки и втыкания его в тела ваших врагов. Но ты ведь будешь пользоваться им как обычным ножом, не так ли?",
		["bm_melee_bullseye_info"] = "Самое известное оружие #{important_1}#Винницкого потрошителя##, который за маской аскетизма пытался скрывать свои самые бесчеловечные поступки.",
		["bm_melee_x46_info"] = "X-46 представляет собой цельный 6-дюймовый клинок из стали А2 с покрытием, выполненный в форме частично зазубренного клинка \"Боуи\" с ложной верхней кромкой. Также имеет наконечник для разбивания стекла. Универсальный полевой дизайн этого ножа делает его столь же полезным как на поле боя, так и в чрезвычайной ситуации..",
		["bm_melee_dingdong_info"] = "Три в одном:\n- Кувалда.\n- Таран.\n- Монтировка.\nЧто может быть лучше?",
		["bm_melee_bat_into"] = "Бейсбольная бита. Ни больше, ни меньше.\n\nПредназначенная для использования в спорте, но вы, конечно, будете использовать ее для чего-то гораздо более зловещего.",
		["bm_melee_machete_info"] = "Тебе нравится причинять боль людям, поэтому ты предпочитаешь пользоваться этим грязным старым мачете. Море крови, отрубленные конечности и крики твоих врагов только подстегивают тебя продолжать это делать. Поистине оружие для жестокого и бесчеловечного грабителя.",
		["bm_melee_fireaxe_info"] = "Вам нравится причинять боль другим людям?\n\nЕсли ваш ответ \"Да!\", то вам может подойти орудие, которое предназначено для спасения жизней! Покажите своим жертвам огонь в ваших глазах, когда вы спасаете их от самих себя одним быстрым рубящим ударом.",
		["bm_melee_toothbrush_info"] = "Маленькая пластиковая зубная щетка, превращенная в самодельную заточку, готова вонзиться в вашу следующую жертву.",
		["bm_melee_fairbair_info"] = "Этот траншейный нож - любимчик среди британских коммандосов. Отлично подходит для нанесения рубящих ударов. Очень популярный нож, который используется и производится по сей день.",
		["bm_melee_swagger_info"] = "Отдавайте приказы, улучшайте свой имидж в обществе или просто используйте его для применения телесных наказаний! Жезл - обязательный аксессуар для любого уважающего себя лидера.",
		["bm_melee_hammer_info"] = "\"Вдохновение плотника\" - любимый молоток Джекета. Наиболее распространенное применение молотков - забивать гвозди, подгонять детали, ковать металл и разбивать предметы на части. Джекет же предпочитает им избивать людей до смерти.",
		["bm_melee_shillelagh_info"] = "Трудно определить происхождение этой дубинки. Коллекционеры готовы отгрохать неплохую сумму за эту большую палку, но зачем ее продавать тому, у кого она просто будет пылиться? Лучше пойти и с ее помощью разломить несколько черепушек.",
		["bm_melee_poker_info"] = "Длинный кусок железа с заостренным концом - прекрасное орудие для тушения тлеющих углей, но это также идеальное орудие для причинения увечий и крайнего дискомфорта в пятой точке.",
		["bm_melee_tenderizer_info"] = "Хотя он был разработан в основном для размягчения и расплющивания жестких частей мяса, он также оказался полезным для размягчения и расплющивания черепов копов.",
		["bm_melee_fork_info"] = "Этой вилкой толчки не почистишь, но за то можно воткнуть ее кому-нибудь прямо в глаза.",
		["bm_melee_spatula_info"] = "Вы забрали эту лопатку у Митчелла и продолжили готовить стейки, пока взламываются щитки для доступа в подвал. Как оказалось, ей даже можно лупить копов.",
		["bm_melee_scalper_info"] = "Для победителя это символ войны, власти и доминирования.\n\nДля проигравшего это символ очень, очень плохой стрижки.",
		["bm_melee_bowie_info"] = "Девять дюймов закаленной стали. Его истоки уходят в эпоху классических пиратов, но широкую известность ему принесла знаменитая драка в округе Кэрролл (и дюжина окровавленных мужчин).",
		["bm_melee_branding_iron_info"] = "Возможно, он был разработан для маркировки крупного рогатого скота, но раскаленное на огне железо еще более эффективно для маркировки какого-нибудь депутата или маршала.",
		["bm_melee_microphone_info"] = "Незаменимая вещь для звезд шоу-бизнеса, стендаперов, публичных выступлений и т.д.\nВы, в каком-то смысле, тоже звезда.",
		["bm_melee_micstand_info"] = "Эта стойка позволяет спокойно поставить микрофон, но кто запрещал махаться ей во все стороны?.",
		["bm_melee_oldbaton_info"] = "#{stats_positive}#\"THE SAFEWORD IS 'POLICE BRUTALITY'!\"##",
		["bm_melee_detector_info"] = "Желательно, чтобы эта штука была выключена.",
		["bm_melee_croupier_rake_info"] = "Казино всегда в выигрыше.",
		["bm_melee_alien_maul_info"] = "Молоток, изготовленный в честь запуска Alienware Alpha.",
		["bm_melee_beardy_info"] = "Викинги вышли из темных лесов языческого Севера и оставили за собой лишь кровавый след и разрушения от Исландии до Стамбула. Их основным оружием был двуручный бородатый топор.",
		["bm_melee_morning_info"] = "Если глубокие проколы от шипов вас не убьют, то катастрофическая травма от удара тупым предметом по голове - безусловно отправит к праотцам.\n\nНаносит #{skill_color}#120## урона в течение #{skill_color}#трех## секунд.",
		["bm_melee_cutters_info"] = "Серийным убийцам нужно нечто большее, чем просто топор, нож или перчатка с острыми как бритва пальцами.\nИм нужны болторезы, чтобы незаметно проникнуть в те места, которые, как вы думали, были заперты. Там, где, как ты думал, ты был в безопасности...",
		["bm_melee_boxcutter_info"] = "Оказывается, им можно резать не только изоленту.",
		["bm_melee_selfie_info"] = "Как сказал Хокстон: \"Посмотри на этого гребаного олуха с селфи-палкой. Какой самовлюбленный. Держу пари, что он сильный. Знаешь, я должен отобрать это у него и дать ему по башке этой палкой. Сейчас верн...\"",
		["bm_melee_pugio_info"] = "Простой и эффективный в использовании. Независимо от того, перерезаете ли вы горло или освобождаете дельфинов из рыболовных сетей, это поможет выполнить работу на все сто.",
		["bm_melee_gator_info"] = "Говорят, человек может продержаться три недели без еды и три дня без воды, но во враждебной среде вы не продержитесь и трех часов без хорошего мачете под боком.",
		["bm_melee_scoutknife_info"] = "Не бойтесь использовать ржавый и изношенный нож. Нож всегда остается ножом - и некоторые говорят, что старый нож стареет так же, как хорошее вино (вероятно, никто никогда этого не говорил).",
		["bm_melee_shawn_info"] = "Вы знали, что стрижка овец считается спортом? Может быть, нам стоит изобрести новый вид спорта - стрижка полицейских?\nНет? Почему нет? Эх, ладно...",
		["bm_melee_stick_info"] = "Устали после долгого ограбления? Хотите выглядеть старым и мудрым? Может, разбить морду полицейскому? Пастушья трость может все.",
		["bm_melee_ballistic_info"] = "Джимми не из тех парней, которые думают, что меньше значит лучше. Поэтому он носит с собой двойной набор специальных ножей.\n\nНаносит #{skill_color}#двойной## урон после первого удара.",
		["bm_melee_tiger_info"] = "Изначально были разработаны для лазания по деревьям и стенам, но потом их стали использовать как полноценное оружие.\n\nНаносит #{skill_color}#двойной## урон после первого удара.",
		["bm_melee_whiskey_info"] = "Существует несколько правил и предписаний, которым должна соответствовать бутылка виски, чтобы называться шотландским виски. Наличие твердой бутылки не обязательно является одним из них, но это мало что значит для Бонни, которая считает пустую бутылку из-под \"Ривертаун Глен\" своим любимым оружием ближнего боя.",
		["bm_melee_road_info"] = "Цепь-кнут - любимое оружие Раста для ближнего боя, поскольку он поклонник олдскульных инструментов, которые могут причинить боль.\nСама цепь была куплена Растом в хозяйственном магазине.\nПомимо этого цепь издает свистящий звук, когда вы будете бить по лицу оппонента.",
		["bm_melee_shock_info"] = "\"Будь так любезен...\"",
		["bm_melee_brick_info"] = "Не ошибитесь - это не просто телефон. Это #{stat_maxed}#ХОТЛАЙН## #{skill_color}#8000##, пик общения в 80-х.\n\n- Привет, кто там?\n- Я позвонил, чтобы сказать...\n\n- Я ненавижу тебя.",
		["bm_melee_sword_info"] = "\"Джон - человек целеустремленный, обязательный, волевой... Тебе это все знакомо очень мало. Я видел однажды как он убил троих в баре...#{important_1}#карандашом##.\nОбычным. #{important_1}#Карандашом##.\"",
		["bm_melee_oxide_info"] = "Инновационный дизайн позволяет создать надежное оружие ближнего боя. Оно должно уметь работать как мачете в районах с густой растительностью, но быть по габаритам как нож.\nЭто оружие может быть использовано летчиками, полевыми солдатами и всеми остальными, кому нужен хороший полевой нож.",
		["bm_melee_agave_info"] = "Жизнь головореза это не только про убийства - это еще про запугивание. То, что оставляет отпечаток внутри тех, кто становится свидетелем этого беспредела. Тут-то и вступает в игру мачете Сангреса..\n\nСангрес назвал свое мачете \"Эль Вердуго\" - подходящее имя для такого грозного оружия.",
		["bm_melee_ohwell_info"] = "Наряду с катаной, танто было основным оружием всех самураев.\n\nЭто принадлежало Кенто, хотя неизвестно, где он его приобрел.",
		["bm_melee_spoon_info"] = "Только ложечку, верно?",
		["bm_melee_aziz_info"] = "Алан, проснись.",
		["bm_melee_chac_info"] = "Войди в ритм с этим маракасом и встряхни им несколько черепов, буквально.",
		["bm_melee_sap_info"] = "Кожаная дубинка - оружие джентльмена.\n\nПростое похлопывание по голове, и ваш враг падает. Дюк владеет кожаной дубинкой с такой грацией и жестокостью, которые иногда переходят все границы и удары наносят больше повреждений, чем необходимо.\n\nТак что действуйте осторожно - или нет.",
		["bm_melee_hockey_info"] = "Красиво обработанный и покрашенный кусок дерева. Идеально подходит для того, чтобы забрасывать шайбу в сетку и выбивать нахрен зубы.",
		["bm_melee_meter_info"] = "Главное, чтобы ваша вторая половинка не спросила за насечки на линейке.",
		["bm_melee_catch_info"] = "Крюч - надежный инструмент, и, честно говоря, довольно примитивный. Необработанная деревянная ручка с прочным металлическим крюком - это все, что нужно.\n\nКрюк гарантированно вызовет много беспорядка. Его использование ограничено только вашим собственным извращенным воображением о том, как зацепить ваших врагов. Вонзать его своим противникам в рот или в их тела?",
		["bm_melee_watson_info"] = "Укусит, как комарик.\n\nСодержит раствор неизвестного происхождения, который наносит #{stats_positive}#120## урона ядом и имеет #{skill_color}#50%## шанс прервать врага раз в #{skill_color}#0.5## секунды, в течение #{skill_color}#4## секунд.",



		--Melee Weapons
		["bm_melee_twins"] = "Sai", --Plural form is still "sai"
		["bm_melee_twins_info"] = "Позволяет обезоружить врага с острым оружием за считанные секунды.\n\nПарирование противника наносит ему #{skill_color}#60## урона в ближнем бою. Навыки позволяют увеличить этот урон.",

		--CUSTOM MELEE WEAPONS
		["bm_melee_revenant_heirloom"] = "Dead Man's Curve",
		["bm_melee_revenant_heirloom_info"] = "\"Это последнее, что ты увидишь, кожаный мешок\"",
		-- это пиздец
		["bm_melee_megumins_staff_info"] = "Кастует мощный взрыв, когда полностью заряжен!\nКаст заклинания производится на любую поверхность или существо на расстояние не более #{skill_color}#30## метров; #{risk}#нельзя кастовать в воздухе.##\n\n#{important_1}#Скорость зарядки не зависит от навыков.\nВо время зарядки у Вас затуманивается экран, тратится стамина и постепенно уменьшается скорость передвижения.\nВы мгновенно падаете после каста взрыва; навыки и перки, позволяющие спасти или отложить падение - не работают.##",

		["bm_menu_weapon_bayonet_header"] = "ХАР-КИ ОТ ОСНОВНОГО:",
		["bm_menu_weapon_bayonet_secondary_header"] = "ХАР-КИ ОТ ВТОРИЧНОГО:",
		["bm_menu_weapon_bayonet_damage"] = "\nДОП. УРОН: ##+",
		["bm_menu_weapon_bayonet_damage_base"] = "\n-БАЗОВЫЙ: ##",
		["bm_menu_weapon_bayonet_damage_skill"] = "\n-НАВЫКИ: ##+",
		["bm_menu_weapon_bayonet_range"] = "\nДОП. РАССТОЯНИЕ: ##+",

		--We assets now--
		["menu_asset_dinner_safe"] = "Сейф",
		["menu_asset_bomb_inside_info"] = "Информация от инсайдера",
		["menu_asset_mad_cyborg_test_subject"] = "Подопытный",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "Костюм-двойка",
		["bm_suit_two_piece_desc_sc"] = "Классический подход к ограблениям. Когда кричишь 'Упали вниз!', почему бы не выглядеть стильно?\n\nС этой опцией персонаж будет носить свой стандартный костюм вне зависимости от ограбления.",

		["bm_suit_loud_suit"] = "Боевой жилет",
		["bm_suit_loud_suit_desc"] = "Костюм для тех, кто не прочь вступить в схватку. Он создан для удобства и в нем легко передвигаться. Отличный выбор для резких набегов на местные ювелирные магазины или секретные базы наемников.",

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

		["bm_suit_var_jumpsuit_flatgreen"] = "Вязко-зеленый",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "Этот костюм, по слухам, принадлежал одному из трех членов банды психопатов и был найден в уничтоженном мусоровозе, который использовался в кровавом ограблении бронетранспорта GenSec, в ходе которого несколько членов SWAT были убиты и многие ранены. Личности этих бандитов до сих пор остаются в тайне, так как большинство улик было уничтожено вместе с мусоровозом - остался только этот костюм.",

		-- Color variations - Combat Harness
			["bm_suit_var_loud_suit_default"] = "Профессиональный черный",
			["bm_suit_var_loud_suit_default_desc"] = "Костюм-двойка стал частью бренда банды PAYDAY. Модный, стильный, позволяет легко затеряться в толпе - настоящая икона. 'Подождите ка! В какой, блядь, толпе?', спросил Чейнс, пока банда направлялась в очередной раз грабить склад Murkywater. И почему он не додумался раньше...",

			["bm_suit_var_loud_suit_white"] = "Морозный белый",
			["bm_suit_var_loud_suit_white_desc"] = "Этот костюм предоставил Джимми для 'Точки кипения'. Быстро выяснилось, что они не подходят для жестких морозов. А сам Джимми вообще предпочел остаться в своем рванном костюме-двойке.",

			["bm_suit_var_loud_suit_red"] = "Неясный красный",
			["bm_suit_var_loud_suit_red_desc"] = "Красный - интересный цвет на поле боя. Либо это медик, который пришел спасать товарищей, либо самый опасный ублюдок из всех. Тебе решать, кем ты будешь.",

			["bm_suit_var_loud_suit_green"] = "Ядовитый зеленый",
			["bm_suit_var_loud_suit_green_desc"] = "Хватит унижений от Гренадера. Джемма МакШай предоставила вам целый арсенал ядовитого оружия - теперь время показать, кто здесь на самом деле травит насекомых.",

			["bm_suit_var_loud_suit_blue"] = "Полицейский синий",
			["bm_suit_var_loud_suit_blue_desc"] = "А почему копы не используют УКТЖ?",

			["bm_suit_var_loud_suit_purple"] = "Модный фиолетовый",
			["bm_suit_var_loud_suit_purple_desc"] = "Спрячьте этот костюм под свой УКТЖ, чтобы добавить нотку моды в вашу тактическую чушь.",

			["bm_suit_var_loud_suit_brown"] = "Загородный коричневый",
			["bm_suit_var_loud_suit_brown_desc"] = "Хьюстон бы хотел остаться в городских джунглях, где ему комфортнее всего. Но увы, за городом слишком много прибыльных для банды дел.",

			["bm_suit_var_loud_suit_gorkagreen"] = "Тактический лесной",
			["bm_suit_var_loud_suit_gorkagreen_desc"] = "Хорошо маскирует в лесу, или среди всех украденных денег.",

			["bm_suit_var_loud_suit_gorkaearth"] = "Тактический наемник",
			["bm_suit_var_loud_suit_gorkaearth_desc"] = "Да сколько униформ производит Murkywater? Можно уже открывать собственную линию одежды.",

			["bm_suit_var_loud_suit_gorkagrey"] = "Тактический городской",
			["bm_suit_var_loud_suit_gorkagrey_desc"] = "Какой смысл надевать костюм-двойку, если все уже знают ваше лицо?",

			["bm_suit_var_loud_suit_gorkapurple"] = "Тактический фиолетовый",
			["bm_suit_var_loud_suit_gorkapurple_desc"] = "Никогда не знаешь, когда придется грабить в фиолетовых джунглях.",

			["bm_suit_var_loud_suit_gorkasea"] = "Тактический морской",
			["bm_suit_var_loud_suit_gorkasea_desc"] = "Вульф раздобыл их в 2011-ом, когда Бейн планировал ограбление яхты. Кто же знал, что этим костюмам придется собирать пыль почти шесть лет.",
			-- Color variations - Sunny Side
			["bm_suit_var_suit_sunny_default"] = "Повседневные дела",
			["bm_suit_var_suit_sunny_default_desc"] = "Будь героем боевиков 90-х, которым ты всегда хотел стать.",

			["bm_suit_var_suit_sunny_skull"] = "Смертоносные дела",
			["bm_suit_var_suit_sunny_skull_desc"] = "Этот символ подарил Скуллдозеру его страшное имя. Покажи, что для тебя он ничего не значит, сделав его просто украшением для одежды.",

			["bm_suit_var_suit_sunny_red"] = "Кровавые дела",
			["bm_suit_var_suit_sunny_red_desc"] = "Привязанный к стулу Клокер, Алабамская бритва, 'Troubles Always Inbound' по радио... Эта рубашка не останется чистой надолго.",

			["bm_suit_var_suit_sunny_blue"] = "Цифровые дела",
			["bm_suit_var_suit_sunny_blue_desc"] = "Хакеры - волшебники 21-го века, которые могут вытворять практически все что угодно... Но не останавливать пули. Для этого есть броня. Так что не будь слишком самоуверенным и носи защиту.",

			["bm_suit_var_suit_sunny_green"] = "Жадные дела",
			["bm_suit_var_suit_sunny_green_desc"] = "Вне зависимости от риска, ты уносишь всю добычу с любого ограбления. Дело даже не в деньгах: вычищенное хранилище - это твоя визитная карточка.",

			["bm_suit_var_suit_sunny_yellow"] = "Солнечные дела",
			["bm_suit_var_suit_sunny_yellow_desc"] = "Отличный костюм для романтичных поездок под солнцем.\nПод аккомпанемент полицейских сирен, разумеется.",

			["bm_suit_var_suit_sunny_pink"] = "Гладкие дела",
			["bm_suit_var_suit_sunny_pink_desc"] = "Мистеру Розовому повезло, что в банде Кабота нет цветного дресс-кода.",

			["bm_suit_var_suit_sunny_hawaii_black"] = "Отпуск в Майами",
			["bm_suit_var_suit_sunny_hawaii_black_desc"] = "Вульф купил эту стильную рубашку, когда узнал, что Дантист готовит работу под кодовым названием 'Горячая линия Майами'. Кто же знал, что они не поедут в Майами?",

			["bm_suit_var_suit_sunny_hawaii_blue"] = "Отпуск в видеоиграх",
			["bm_suit_var_suit_sunny_hawaii_blue_desc"] = "Джой относится к типу людей, которые уезжают в отпуск далеко-далеко чтобы просто играть там в видеоигры. 'Ну что за поколение', подумал Даллас, когда ему не удалось увлечь ее более консервативными развлечениями, такими как игрой в бильярд, наслаждением видами моря и распитием огромного количества скотча.",

			["bm_suit_var_suit_sunny_hawaii_cyan"] = "Отпуск в бассейне",
			["bm_suit_var_suit_sunny_hawaii_cyan_desc"] = "Сидни отличный пловец, и всегда хотела бассейн в убежище. Однако, Альдстоуну и так хватает хлопот, да и плавание - не самое любимое развлечение банды после дела на Мосте Грин.",

			["bm_suit_var_suit_sunny_hawaii_green"] = "Отпуск в притоне",
			["bm_suit_var_suit_sunny_hawaii_green_desc"] = "Влад отлично проводил время в Мексике. Новые земли - это новые возможности, и он расширял свой бизнес, пока однажды одну из его точек не атаковали. Федеральной полиции настучал Булук, который вскоре станет врагом Влада номер один. К счастью, банда PAYDAY всегда под рукой.",

			["bm_suit_var_suit_sunny_hawaii_orange"] = "Отпуск в оффшорах",
			["bm_suit_var_suit_sunny_hawaii_orange_desc"] = "Вот и все, вы справились. Белый дом ограблен, все злодеи побеждены, а ваш оффшор потрачен на крупную вечеринку. И куда двигаться теперь?\nЛадно, еще парочка ограблений банка не повредит.",

			["bm_suit_var_suit_sunny_hawaii_pink"] = "Отпуск на танцполе",
			["bm_suit_var_suit_sunny_hawaii_pink_desc"] = "Чейнс нечасто уходит в отпуск, но делает это с размахом. В 2016-ом, видео с его зажигательным танцем утекло в сеть. Ему пришлось просить Бейна стереть его оттуда.",

			["bm_suit_var_suit_sunny_hawaii_red"] = "Отпуск в архипелаге",
			["bm_suit_var_suit_sunny_hawaii_red_desc"] = "Джимми любит рассказывать, как его далекий отпуск прервала армия генно-модифицированных супер-солдат. Звучит как очередной кокаиновый бред, но после ограбления АКАНа... Кто знает?",

			["bm_suit_var_suit_sunny_payne"] = "Отпуск в нуаре",
			["bm_suit_var_suit_sunny_payne_desc"] = "Во время отпуска в Сан-Пауле, Вульф захотел купить эту рубашку, но получил ее бесплатно в знак благодарности за то что оказал отличную службу городу. \nВульф удивился, ведь он никогда не был там раньше.",

			["bm_suit_var_suit_sunny_vice"] = "Отпуск в пороках",
			["bm_suit_var_suit_sunny_vice_desc"] = "Сангреса нельзя заставить носить ничего, кроме ярких рубашек. Пока остальные гении преступного мира собираются в деловых костюмах, Сангрес врывается в потрепанной рубашке, которую он нашел на гаражной распродаже в городе порока. Выглядит так, будто ей уже больше сорока лет.",

			["bm_suit_var_suit_sunny_security_red"] = "Красный телохранитель",
			["bm_suit_var_suit_sunny_security_red_desc"] = "Элитный телохранитель Эрнеста Сосы. У Эрнеста Сосы было все. Большой особняк, надеждный бизнес и непробиваемая охрана. Мир принадлежит ему... Но как известно, история движется по спирали.",

			["bm_suit_var_suit_sunny_security_purple"] = "Фиолетовый телохранитель",
			["bm_suit_var_suit_sunny_security_purple_desc"] = "Элитный телохранитель Эрнеста Сосы. Постоянное наблюдение через дронов и организованная охрана. В особняк Сосы не пробраться. Вот бы еще кто-нибудь проверил последнюю партию кокаина...",

			["bm_suit_var_suit_sunny_soprano"] = "Мафиозные дела",
			["bm_suit_var_suit_sunny_soprano_desc"] = "Мафия не очень близка банде PAYDAY, но их стиль заслуживает уважения.",
		    -- Color variations - Prison Suit
			["bm_suit_var_suit_prison_default"] = "Беглец",
			["bm_suit_var_suit_prison_default_desc"] = "Роба, которая изменила Хокстона навсегда. Он был уверен, что сжег это напоминание о жутком прошлом вместе со старым убежищем, но каким-то мистическим образом оно оказалось в новом.",

			["bm_suit_var_suit_prison_repairman"] = "31-ый",
			["bm_suit_var_suit_prison_repairman_desc"] = "Знаете, кто расставляет шпионские камеры?\n\nЛичности вы никогда не узнаете, но хотя бы можно оценить его одежду.",

			["bm_suit_var_suit_prison_comedy"] = "Воришка",
			["bm_suit_var_suit_prison_comedy_desc"] = "Роба Ченса из банды PAYCHECK. Ему почти удалось сбежать с 225 долларами из кассы магазина Pear, но его взяли под стражу. К счастью, его соратники взяли в заложники ноутбук Pear и сумели обменять его на Чинса.",

			["bm_suit_var_suit_prison_vaultboy"] = "Выживший",
			["bm_suit_var_suit_prison_vaultboy_desc"] = "К удивлению, Бейн никогда не верил в теории о скором конце света. Но после того, как Влад попросил украсть ядерные боеголовки, он построил себе подземное убежище. Ну вы знаете. Война.",

			["bm_suit_var_suit_prison_janitor"] = "Уборщик",
			["bm_suit_var_suit_prison_janitor_desc"] = "Ходят слухи, что OMNIA проводит сверхсекретные испытания, да такие, что даже бы ученые с Утеса Генри позавидовали. Всем в OMNIA заставляют подписать контракт. Даже уборщиков держат под... контролем.",

			["bm_suit_var_suit_prison_subject"] = "Подопытный",
			["bm_suit_var_suit_prison_subject_desc"] = "Джимми снял этот костюм с подопытного во время побега из лаборатории АКАНа. Вдруг секрет их сверхъестественных способностей таится в этой робе?",


		--Weapon Colors
		["bm_wskn_resmod_blackgold"] = "Черное золото",
		["bm_wskn_resmod_cleangold"] = "Чистое золото",
		["bm_wskn_resmod_imissfauna"] = "Обработанное золото",
		["bm_wskn_resmod_imissfauna_desc"] = "",
		["bm_wskn_resmod_uuuuu"] = "Готическая Церера",
		["bm_wskn_resmod_uuuuu_desc"] = "",
		["bm_wskn_resmod_ownthiscity"] = "Царское золото",
		["bm_wskn_resmod_kindoffeel"] = "Абстрактно-темное золото",
		["bm_wskn_resmod_kindoffeel2"] = "Абстрактно-яркое золото",
		["bm_wskn_resmod_insubstantial"] = "Треснутое золото",
		["bm_wskn_resmod_palmtop"] = "Тигриное золото",
		["bm_wskn_resmod_palmtop_desc"] = "",
		["bm_wskn_resmod_blacktiger"] = "Золото черного тигра",
		["bm_wskn_resmod_joe"] = "Экзотическое золото",
		["bm_wskn_resmod_blackexotic"] = "Экзотическое золото (темное)",
		["bm_wskn_resmod_lildonnie"] = "Жемчужное золото",
		["bm_wskn_resmod_quacko"] = "Потемневшее золото",
		["bm_wskn_resmod_snake"] = "Расплавленное золото",
		["bm_wskn_resmod_camo"] = "Камуфляжное золото",
		["bm_wskn_resmod_camo2"] = "Затуманенное золото",
		["bm_wskn_resmod_digital"] = "Цифровое золото",
		["bm_wskn_resmod_splinter"] = "Составное золото",
		["bm_wskn_resmod_urban"] = "Поддельное золото",
		["bm_wskn_resmod_dioxide"] = "Углеродное золото",
		["bm_wskn_resmod_rat"] = "Воровское золото",
		["bm_wskn_resmod_ratdark"] = "Воровское золото (темное)",
		["bm_wskn_resmod_rocker"] = "Статичное золото",
		["bm_wskn_resmod_shocker"] = "Статичное золото (темное)",
		["bm_wskn_resmod_whitefire"] = "Пламенное золото",
		["bm_wskn_resmod_blackfire"] = "Пламенное золото (темное)",
		["bm_wskn_resmod_topography"] = "Топографическое золото",
		["bm_wskn_resmod_2019"] = "Закаленное золото",
		["bm_wskn_resmod_llenn"] = "Мистер Пинк",
		["bm_wskn_resmod_llenn_desc"] = "",
		["bm_wskn_resmod_sugarhoneyicetea"] = "Золото зебры",
		["bm_wskn_resmod_blackzebra"] = "Золото черной зебры",
		["bm_wskn_resmod_charlotte"] = "Паучье золото",
		["bm_wskn_resmod_joker"] = "Насмешка над золотом",
		["bm_wskn_resmod_jokerw"] = "Насмешка над обществом",

		["menu_weapon_color_index_11"] = "Металл + Прицел",
		["menu_weapon_color_index_12"] = "Металл + Магазин",
		["menu_weapon_color_index_13"] = "Металл + Прицел + Магазин",

		--Menu Buttons--
		["bm_menu_btn_sell"] = "ПРОДАТЬ ОРУЖИЕ ($price)",
		["bm_menu_btn_buy_selected_weapon"] = "КУПИТЬ ОРУЖИЕ ($price)",

		--New menu stats--
		["bm_menu_crit"] = "Шанс крита",
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

		["bm_menu_attack_speed"] = "Ск-сть атаки",
		["bm_menu_impact_delay"] = "Задержка",
		["bm_menu_cleave"] = "Прорубание",

		["bm_menu_stats_detection"] = "Нагрузка",
		["bm_menu_stats_min_detection"] = "Низкая нагрузка",
		["bm_menu_stats_max_detection"] = "Максимальная нагрузка",

		--Attachment type names--
		["bm_menu_barrel_ext"] = "Насадка",
		["bm_menu_barrel_ext_plural"] = "Насадки",
		["bm_menu_foregrip"] = "Цевье",
		["bm_menu_foregrip_plural"] = "Цевье",
		["bm_menu_vertical_grip"] = "Рукоятка",
		["bm_menu_vertical_grip_plural"] = "Рукоятки",
		["bm_menu_bayonet"] = "Штык",
		["bm_menu_bayonet_plural"] = "Штыки",
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

		["bm_menu_upotte_barrel"] = "Ствол",
		["bm_menu_upotte_foregrip"] = "Цевье",
		["bm_menu_upotte_stock"] = "Приклад",
		["bm_menu_upotte_grip"] = "Рукоятка",

		["bm_menu_ro_barrel"] = "Ствол",
		["bm_menu_ro_stock"] = "Приклад",
		["bm_menu_ro_modifier"] = "Модификаторы",
		["bm_menu_ro_charm"] = "Брелок",
		["bm_menu_ro_grip"] = "Рукоятка",

		--Weapon categories--
		["menu_pistol"] = "Пистолеты",
		["menu_pistol_single"] = "Пистолет",
			["menu_light_pis"] = "Легкие пистолеты",
			["menu_heavy_pis"] = "Тяжелые пистолеты",

		["menu_shotgun"] = "Дробовики",
		["menu_shotgun_single"] = "Дробовик",
			["menu_light_shot"] = "Авто. дробовики",
			["menu_heavy_shot"] = "Легкие дробовики",
			["menu_break_shot"] = "Тяжелые дробовики",

		["menu_smg"] = "Пулеметы",
		["menu_smg_single"] = "Пулемет",
		["menu_lmg"] = "Пулеметы",
		["menu_lmg_single"] = "Пулемет",
		["menu_minigun"] = "Миниганы",
		["menu_minigun_single"] = "Миниган",
			["menu_light_smg"] = "Легкие ПП",
			["menu_heavy_smg"] = "Тяжелые ПП",
			["menu_light_mg"] = "Легкие пулеметы",
			["menu_heavy_mg"] = "Тяжелые пулеметы",
			["menu_miniguns"] = "Миниганы",

		["menu_assault_rifle"] = "Винтовки",
		["menu_assault_rifle_single"] = "Винтовка",
		["menu_snp"] = "Винтовки",
		["menu_snp_single"] = "Винтовка",
			["menu_light_ar"] = "Легкие винтовки",
			["menu_heavy_ar"] = "Тяжелые винтовки",
			["menu_dmr_ar"] = "Марксманские винтовки",
			["menu_light_snp"] = "Легкие снайперские винтовки",
			["menu_heavy_snp"] = "Тяжелые снайперские винтовки",
			["menu_antim_snp"] = "Крупнокалиберные винтовки",

		["menu_wpn_special"] = "Особое",
			["menu_wpn_special_single"] = "Особое",

		["menu_flamethrower"] = "Огнеметы",
		["menu_flamethrower_single"] = "Огнемет",

		["menu_grenade_launcher"] = "Гранатометы",
		["menu_grenade_launcher_single"] = "Гранатомет",

		["menu_saw"] = "Пилы",
		["menu_saw_single"] = "Пила",

		["menu_bow"] = "Луки",
		["menu_bow_single"] = "Лук",
		["menu_crossbow"] = "Арбалеты",
		["menu_crossbow_single"] = "Арбалет",

		["menu_akimbo"] = "Парные+",

		["menu_unsupported"] = "Не поддерживается",

		["st_menu_value"] = "Стоимость:",

		["st_menu_skill_use"] = "ТИП НАВЫКА:",
		["st_wpn_akimbo"] = "Парные+",
		["st_wpn_assault_rifle"] = "Винтовка",
		["st_wpn_snp"] = "Винтовка",
		["st_wpn_pistol"] = "Пистолет",
		["st_wpn_shotgun"] = "Дробовик",
		["st_wpn_smg"] = "Пулемет",
		["st_wpn_lmg"] = "Пулемет",
		["st_wpn_minigun"] = "Пулемет",
		["st_wpn_crossbow"] = "Лук",
		["st_wpn_bow"] = "Арбалет",
		["st_wpn_saw"] = "Пила",
		["st_wpn_grenade_launcher"] = "Гранатомет",
		["st_wpn_wpn_special"] = "Особое",
		["st_wpn_flamethrower"] = "Огнемет",

		["st_menu_firemode"] = "РЕЖИМ ОГНЯ:",
		["st_menu_firemode_semi"] = "ПОЛУ",
		["st_menu_firemode_auto"] = "АВТО",
		["st_menu_firemode_burst"] = "ОЧЕРЕДЬ",
		["st_menu_firemode_volley"] = "ЗАЛП",
		["st_menu_firemode_burst_slamfire"] = "ТЕМПОВЫЙ",
		["st_menu_firemode_burst_fanning"] = "ФАННИНГ",
		["st_menu_firemode_burst_rapidfire"] = "СКОРОСТНОЙ",
		["st_menu_firemode_burst_autoburst"] = "АВТООЧЕРЕДЬ",

		["menu_reticle_dmc_eotech"] = "TECopt Full",
		["menu_reticle_dmc_eotech_moa"] = "TECopt MOA Dot",
		["menu_reticle_dmc_eotech_seggs"] = "TECopt Segmented",
		["menu_reticle_dmc_ebr_cqb"] = "EBR CQB",
		["menu_reticle_dmc_trijicon_chevron"] = "Chevron",
		["menu_reticle_dmc_ebr_cqb"] = "Maelstrom EBR-CQB",
		["menu_reticle_dmc_trijicon_chevron"] = "Trigonom Chevron",
		["menu_reticle_dmc_ncstar"] = "Reconnaissance Cross",
		["menu_reticle_dmc_lua"] = "Powered by Lua",
		["menu_reticle_dmc_dot_4x4"] = "Small Dot",
		["menu_reticle_dmc_dot_2x2"] = "Tiny Dot",
		["menu_reticle_dmc_cross_holotherm"] = "SZ Holotherm",


		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_append_milliseconds"] = " мс",
		["bm_menu_dodge_grace"] = "Увеличение длительности периода бессмертия при увороте: #{skill_color}#$grace_bonus##\n\nПериод бессмертия - время, во время которого вы не можете получить урон или потерять уворот.",
		["bm_menu_dodge_grace_cap"] = "Максимальное увеличение длительности периода бессмертия равно #{important_1}#$grace_bonus_cap##, потому что стоит ",
		["bm_menu_dodge_grace_jp_cap"] = "модификатор #{important_1}#Pro-Job##",
		["bm_menu_dodge_grace_both"] = " и ",
		["bm_menu_dodge_grace_diff_cap"] = "сложность #{risk}#$risk_level##",
		["bm_menu_armor_grinding_1"] = "Восстановление брони за раз: #{skill_color}#$passive_armor_regen##",
		["bm_menu_armor_grinding_2"] = "Восстановление брони за раз: #{skill_color}#$passive_armor_regen## \nВосстановление брони за нанесение урона: #{skill_color}#$active_armor_regen##",

		["bm_menu_armor_max_health_store_1"] = "Максимальное количество запасного здоровья: #{skill_color}#$health_stored##",
		["bm_menu_armor_max_health_store_2"] = "Максимальное количество запасного здоровья: #{skill_color}#$health_stored## \nВосстановление брони за убийство: #{skill_color}#$regen_bonus%##",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
	    ["bm_menu_bonus"] = "Модификаторы",
		["steam_inventory_stat_boost"] = "Модификатор атрибутов",

		--Safe House--
		["dialog_safehouse_text"] = "Вы еще не посещали убежище.\n\nСоветуем это сделать, ведь там ждет кое-что новое.\n\nПерейти туда сейчас?",

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


		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Расставляются при нажатии #{skill_color}#$BTN_BIPOD##, если позволяет место. Нажмите клавишу снова, чтобы убрать.\n\nУменьшают отдачу на #{skill_color}#60%## и увеличивают расстоянии #{skill_color}#30%## во время использования.\n\n#{item_stage_2}#Дополнительные настройки для сошек можно найти в настройках Restoration Mod.##",
		["bm_sc_bipod_desc"] = "Расставляются при удержании #{skill_color}#$BTN_BIPOD##, если позволяет место. Удержите кнопку снова, чтобы убрать.\n\nУменьшают отдачу на #{skill_color}#60%## и увеличивают расстоянии #{skill_color}#30%## во время использования.\n\n#{item_stage_2}#Дополнительные настройки для сошек можно найти в настройках Restoration Mod.##",
		["hud_hint_bipod_moving"] = "Нельзя развернуть во время ходьбы",
		["hud_hint_bipod_slide"] = "Нельзя развернуть во время переката",
		["hud_hint_bipod_air"] = "Нельзя развернуть в воздухе",
		["hud_hint_bipod_lean"] = "Нельзя развернуть при наклоне",
		["hud_hint_bipod_midstance"] = "Нельзя развернуть, пока вы приседаете/встаете",

		["hud_interact_autumn_disable"] = "Отключено Капитаном Отемом!",

		["hud_assault_restored_down"] = "Штурм пережит - восстановлено 1 падение",
		["hud_assault_remaining_single"] = "1 штурм до восстановления падения",
		["hud_assault_remaining_plural"] = " штурма до восстановления падения",

		--String override for the stungun--
		["bm_melee_zeus_info"] = "Электрические кастеты, которые бьют током и оглушают цель при полном заряде",
		["bm_melee_taser_info"] = "Устройство, которое бьет током и оглушает цель при полном заряде.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

	    ["bm_wp_pis_usp_b_match"] = "Затвор Фримена",
		["bm_wp_1911_m_big"] = "Коробчатый магазин",
		["bm_wp_usp_m_big"] = "Коробчатый магазин",
		["bm_wp_upg_ass_ak_b_zastava"] = "Длинный ствол",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Ствол Вульфа",
		["bm_wp_p90_b_ninja"] = "Ниндзя-ствол",
		["bm_wp_par_b_short"] = "Укороченный ствол",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_x_shrew"] = "Барри и Пол",
		["bm_w_x_1911"] = "Мустанг и Салли",

		["bm_wp_mp5_fg_mp5sd"] = "Цевье агента",
		["bm_wp_hs2000_sl_long"] = "Элитный затвор",
		["bm_wp_vhs_b_sniper"] = "Гипер-ствол",
		["bm_w_r0991"] = "Пистолет AR-15 Varmint",
		["bm_wp_vhs_b_silenced"] = "Ствол 'Bad Dragan'",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Красный корпус",
		["bm_wp_g3_b_sniper"] = "Макро-ствол",
		["bm_wp_g3_b_short"] = "Микро-ствол",
		["bm_wp_g3_m_psg"] = "Магазин 'Präzision'",
		["bm_wp_upg_i_g3sg1"] = "Система 'Präzision'",
		["bm_wp_upg_i_g3sg1_desc"] = "Позволяет использовать мощные боеприпасы, которые #{skill_color}#полностью пробивают броню и щиты.## Некоторые части оружия заменены на более тяжелые, что в итоге #{important_1}#уменьшает скорострельность## и позволяет вести огонь только #{risk}#очередью##.",

		--VMP HK416c Fixed Stock
		["bm_wp_tecci_s_minicontra_alt"] = "Укрепленный приклад SG",

		["bm_w_beck_desc"] = "Самый популярный дробовик в криминальном мире вернулся в погоне за былой славой. Он использовался в оригинальной волне преступности 2011-го года и доказал свою надеждность в практически любой близкой конфронтации.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Маленький бонус к Компактности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p1_mod"] = "Маленький модификатор Компактности",
		["bm_menu_bonus_concealment_p2"] = "Большой бонус к Компактности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p2_mod"] = "Большой модификатор Компактности",
		["bm_menu_bonus_concealment_p3"] = "Огромный бонус к Компактности и штраф к Стабильности",
		["bm_menu_bonus_concealment_p3_mod"] = "Огромный модификатор Компактности",
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
		["bm_menu_concealment"] = "Компактность\n",
		["bm_menu_bonus_spread_p2_mod"] = "Большой модификатор точности",
		["bm_menu_bonus_spread_p3_mod"] = "Огромный модификатор точности",
		["bm_menu_bonus_recoil_p2_mod"] = "Большой модификатор стабильности",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Денежный бонус",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+5% к денежной награде для вас и команды.",

		["bm_wp_upg_i_singlefire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО #{risk}#ОДИНОЧНУЮ СТРЕЛЬБУ##.",
		["bm_wp_upg_i_autofire_desc"] = "ОСТАВЛЯЕТ ТОЛЬКО #{risk}#АВТОМАТИЧЕСКУЮ СТРЕЛЬБУ##.",

		["menu_akimbo_assault_rifle"] = "Парные винтовки",

		--Throwables--
		["bm_concussion_desc"] = "Радиус: #{skill_color}#10 м## \nОглушает врагов на промежуток до #{skill_color}#4## секунд \nТочность врагов уменьшается на #{skill_color}#50%## на #{skill_color}#7## секунд \nОглушает всех врагов, кроме #{important_1}#Титановых Щитов, Титановых Бульдозеров и Капитанов.## \n\nЭто сногсшибательная штучка поразит всех и даст вам лишние секунды чтобы их убить.",
		["bm_grenade_smoke_screen_grenade_desc"] = "Радиус: #{skill_color}#6 м## \nДлительность: #{skill_color}#12 секунд## \nДетонация: #{skill_color}#1 сек после падения на землю## \n \nИспользуйте, чтобы испариться в клубе дыма, через который врагам будет сложно попасть по вам.",
		["bm_grenade_frag_desc"] = "Урон: #{skill_color}#800## \nРадиус: #{skill_color}#5 м## \nДетонация: #{skill_color}#3 сек#{skill_color}# \n \nКлассическая осколочная граната. Не требует лишних слов.",
		["bm_dynamite_desc"] = "Урон: #{skill_color}#800## \nРадиус: #{skill_color}#4м## \nДетонация: #{skill_color}#3 сек## \nНе отскакивает и не катится после приземления, но наносит меньше урона от взрыва, чем другая взрывчата.\n\nПридуман, чтобы взрывать камень. Вполне подходит чтобы взрывать людей.",
		["bm_grenade_frag_com_desc"] = "Урон: #{skill_color}#800## \nРадиус: #{skill_color}#5 м## \nДетонация: #{skill_color}#3 сек## \n \nОбновленная классическая граната, она придаст каждому взрыву стиль OVERKILL.",
		["bm_grenade_dada_com_desc"] = "Урон: #{skill_color}#800## \nРадиус: #{skill_color}#5 м## \nДетонация: #{skill_color}#3 сек## \nВнешний вид куклы скрывает ее взрывоопасные внутренности. Дань Родине.",
		["bm_grenade_molotov_desc"] = "Урон (Огненная лужа): #{heat_warm_color}#1200 в течение 10 сек.## \nУрон (Огонь): #{heat_warm_color}#60 в течение 3 сек.## \nУрон (Взрыв): #{heat_warm_color}#30## \nРадиус: #{skill_color}#3 м## \nДлительность (Огненная лужа): #{skill_color}#10 сек.## \nДетонирует при попадании\n#{skill_color}#50%## шанс поджечь врагов, заставляя остальных паниковать.\nРадиус: #{skill_color}#3.75м## \n\nБутылка с огнеопасной жидкостью и горящей тряпкой. Дешево, просто и крайне эффективно. Спалите все к чертям.",
		["bm_grenade_fir_com_desc"] = "Урон (Огненная лужа): #{heat_warm_color}#1440 в течение 12 сек.## \nУрон (Огонь): #{heat_warm_color}#60 в течение 3 сек.## \nУрон (Взрыв): #{heat_warm_color}#30## \nРадиус: #{skill_color}#3 м## \nДлительность (Огненная лужа): #{skill_color}#12 сек.## \nДетонация: #{skill_color}#2.5 сек.##\n#{skill_color}#50%## шанс поджечь врагов, заставляя остальных паниковать.\n\nСамоподжигающийся фосфорный контейнер. Идеален для отскакивания от стен за угол, к вашим противникам.",
		["bm_wpn_prj_ace_desc"] = "Урон: #{skill_color}#240## \n \nМетательные игральные карты с лезвием. Убийственная колода.",
		["bm_wpn_prj_four_desc"] = "Урон (Попадание): #{skill_color}#200## \nУрон (Яд): #{stats_positive}#120 в течение 4 секунд## \n#{skill_color}#50%## шанс прервать врага каждые 0.5 секунд. \nПрерывание не действует на Щитов, Бульдозеров, Гренадеров и Капитанов. \n \nУ метательной звезды богатая история, полная крови и битв. Эти смазанные ядом звездочки несут угрозу всем, кто стоит у вас на пути.",
		["bm_wpn_prj_target_desc"] = "Урон: #{skill_color}#240## \n \nОтличный запасной план и надежная тактика для точного, бесшумного убийства.",
		["bm_wpn_prj_jav_desc"] = "Урон: #{skill_color}#360## \n \nКопье - простое оружие, придуманное еще в доисторические времена. Простая палка с острым концом, которая испортит кому-нибудь день.",
		["bm_wpn_prj_hur_desc"] = "Урон: #{skill_color}#360## \n \nГоворят, заточенный топор никогда не ошибается. Метательный заточенный топор уж тем более.",
		["bm_grenade_electric_desc"] = "Урон: #{skill_color}#400## \nРадиус: #{skill_color}#5 м## \nДетонация: #{skill_color}#3 сек## \n \nОсколки - это неплохо, но иногда хочется кого-нибудь поджарить. Эта милая высоковольтная штучка отлично подойдет.",
		["bm_grenade_poison_gas_grenade"] = "Граната Manticore-6",
		["bm_grenade_poison_gas_grenade_desc"] = "Урон: #{stats_positive}#300 за 10 сек## \nРадиус: #{skill_color}#8 м## \nДлительность: #{skill_color}#12 сек## \nДетонация: #{skill_color}#1 сек после падения на землю## \nВраги могут отравиться каждым облаком только один раз\nЩиты, Гренадеры, Бульдозеры и Капитаны не прерываются.\n\nЭто экспериментальное био-оружие выпускает облако ядовитого газа, которое влияет только на особые гены - у банды полный иммунитет. Жертвы почувствуют сильный кашель, головокружение и рвоту. Опасно для всех, кроме самых бронированных врагов.\n\nОружие военного преступника.",
		["bm_grenade_sticky_grenade"] = "Граната 'Семтекс'",
		["bm_grenade_sticky_grenade_desc"] = "Урон: #{skill_color}#800## \nРадиус: #{skill_color}#4 м## \nДетонация: #{skill_color}#2.5 сек## \n\nВзрывчатое вещество, которое прилипает к любым поверхностям, включая людей!",
		["bm_grenade_xmas_snowball_desc"] = "Урон: #{skill_color}#180## \nРадиус: #{skill_color}#1 м## \nВремя восстановления: #{skill_color}#25 сек## \nДетонация: При попадании \n\nОпустите их в воду, засуньте в морозильник и вот у вас смертоносное оружие. Легко.",


		["bm_wp_wpn_fps_upg_scar_m203_buckshot"] = "Снаряды 40MM Buckshot",
		["bm_wp_wpn_fps_upg_scar_m203_buckshot_desc"] = "Снаряд заряжен 6-ю тяжелыми дробинками.\n\nБоезапас: 15\nУрон: 360\nТочность: 40\nЭффективная дистанция: 9м\nМаксимальная дистанция: 18м",
		["bm_wp_wpn_fps_upg_scar_m203_flechette"] = "Снаряды 40MM Flechette",
		["bm_wp_wpn_fps_upg_scar_m203_flechette_desc"] = "Снаряд заряжен 12 маленькими дальнобойными дротиками.\n\nБоезапас: 20\nУрон: 240\nТочность: 50\nЭффективная дистанция: 11м\nМаксимальная дистанция: 22м",

		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot"] = "Снаряды 40MM Buckshot",
		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot_desc"] = "Снаряд заряжен 6-ю тяжелыми дробинками.\n\nБоезапас: 15\nУрон: 360\nТочность: 40\nЭффективная дистанция: 9м\nМаксимальная дистанция: 18м",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette"] = "Снаряды 40MM Flechette",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette_desc"] = "Снаряд заряжен 12 маленькими дальнобойными дротиками.\n\nБоезапас: 20\nУрон: 240\nТочность: 50\nЭффективная дистанция: 11м\nМаксимальная дистанция: 22м",
	})


		local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
		--[[
		WepNames Options
		1 = Имена оружия на кириллице
		2 = Имена оружия на латинице
		3 = Имено оружия и атачментов от DMC
		4 = Ванильные
	]]


		if weapon_names then
			if weapon_names == 2 then -- Латиница
				LocalizationManager:add_localized_strings({
		["bm_w_maxim9"] = "Magnus 9",
		["bm_w_x_maxim9"] = "Парные Magnus 9",
		["bm_w_stech"] = "Igor Automatik",
		["bm_w_x_stech"] = "Парные Igor Automatik",
		["bm_wp_pis_g26"] = "Chimano 26 Compact",
		["bm_w_jowi"] = "Парные Chimano 26 Compact",
		["bm_w_glock_18c"] = "Chimano 18C",
		["bm_w_x_g18c"] = "Парные Chimano 18C",
		["bm_w_czech"] = "CR 92",
		["bm_w_x_czech"] = "Парные CR 92",
		["bm_w_ppk"] = "Gruber Kurz",
		["bm_w_x_ppk"] = "Парные Gruber Kurz",
		["bm_w_legacy"] = "M13",
		["bm_w_x_legacy"] = "Парные M13",
		["bm_w_glock_17"] = "Chimano 88",
		["bm_w_x_g17"] = "Парные Chimano 88",
		["bm_w_b92fs"] = "Bernetti 92",
		["bm_w_x_b92fs"] = "Парные Bernetti 92",
		["bm_w_pl14"] = "White Streak",
		["bm_w_x_pl14"] = "Парные White Streak",
		["bm_w_holt"] = "HOLT 9",
		["bm_w_x_holt"] = "Парные HOLT 9",
		["bm_w_fmg9"] = "Wasp DS-9",
		["bm_w_beer"] = "Bernetti 93R",
		["bm_w_packrat"] = "Contractor M30L",
		["bm_w_x_packrat"] = "Парные Contractor M30L",
		["bm_w_breech"] = "Parabellum-08",
		["bm_w_g22c"] = "Chimano Custom",
		["bm_w_x_g22c"] = "Парные Chimano Custom",
		["bm_w_p226"] = "Signature .40",
		["bm_w_hs2000"] = "LEO-40",
		["bm_w_lemming"] = "Acuto 5/7",
		["bm_w_sparrow"] = "Sparrow 941",
		["bm_w_x_sparrow"] = "Spike & Vicious",
		["bm_w_socom"] = "Anubis .45",
		["bm_w_x_socom"] = "Парные Anubis .45",
		["bm_w_colt_1911"] = "Crosskill Operator II",
		["bm_w_x_1911"] = "Mustang & Sally",
		["bm_w_m1911"] = "Crosskill A1",
		["bm_w_x_m1911"] = "Price & MacTavish",
		["bm_w_shrew"] = "Crosskill Guard",
		["bm_w_shrew_joshua"] = "A Light Shining in Darkness",
		["bm_w_x_shrew"] = "Barry & Paul",
		["bm_w_usp"] = "Interceptor-45",
		["bm_w_x_usp"] = "Парные Interceptor-45",
		["bm_w_type54"] = "CC-33",
		["bm_w_x_type54"] = "Парные CC-33",
		["bm_w_c96"] = "Broomstick",
		["bm_w_c96_dl44"] = "DL-44",
		["bm_wp_c96_nozzle"] = "Насадка BlasTech DL-44",
		["bm_w_sub2000"] = "Cavity .40",
		["bm_w_deagle"] = "Deagle",
		["bm_w_x_deagle"] = "Парные Deagle",
		["bm_w_korth"] = "Kahn .357",
		["bm_w_x_korth"] = "Парные Kahn .357",
		["bm_w_mateba"] = "Matever 9mm",
		["bm_w_x_2006m"] = "Парные Matever",
		["bm_w_model3"] = "Frenchman 87",
		["bm_w_x_model3"] = "Парные Frenchman 87",
		["bm_w_raging_bull"] = "Bronco .44",
		["bm_w_x_rage"] = "Парные Bronco .44",
		["bm_w_chinchilla"] = "Castigo .44",
		["bm_w_x_chinchilla"] = "Парные Castigo .44",
		["bm_w_rsh12"] = "RUS-12",
		["bm_w_shatters_fury"] = "Phoenix .500",
		["bm_w_peacemaker"] = "Peacemaker .45LC",
		["bm_w_hpb"] = "Hi-Power",
		["bm_w_p99"] = "Lakner G99",
		["bm_w_derringer"] = "Derringer",
		["bm_w_amt"] = "Automag .44",
		["bm_w_coltds"] = "Crosskill Investigator",
		["kfa_scope"] = "Прицел KFA-2 Smart-Link",
		["bm_w_px4"] = "Bernetti Hx4 Canaan",
		["bm_w_papa320"] = "M19",
		["bm_w_p90"] = "Project-90",
		["bm_w_x_p90"] = "Парные Project-90",
		["bm_w_mp7"] = "SpecOps-7",
		["bm_w_tec9"] = "T3K Urban",
		["bm_w_x_tec9"] = "Парные T3K Urban",
		["bm_w_sr2"] = "Heather-2M",
		["bm_w_x_sr2"] = "Парные Heather-2M",
		["bm_w_mp9"] = "CMP-9",
		["bm_w_pm9"] = "Miyaka 9 Special",
		["bm_w_baka"] = "Micro Uzi",
		["bm_w_x_baka"] = "Парные Micro Uzi",
		["bm_w_scorpion"] = "Cobra",
		["bm_w_x_scorpion"] = "Парные Cobra",
		["bm_w_coal"] = "Tatonka",
		["bm_w_vityaz"] = "AK Gen 21 Tactical",
		["bm_w_shepheard"] = "FIK PC9",
		["bm_w_mp5"] = "Compact-5",
		["bm_w_mp5sd"] = "Compact-5SD",
		["bm_w_mp5k"] = "Compact-5K",
		["bm_w_mp5k_pdw"] = "Compact-5K PDW",
		["bm_w_x_mp5"] = "Парные Compact-5",
		["bm_w_m45"] = "Swedish K",
		["bm_w_sterling"] = "Patchette L2A3",
		["bm_w_sterling_sd"] = "Patchette L34A1",
		["bm_w_sterling_pistol"] = "Patchette Mk. VII",
		["bm_w_sterling_e11"] = "E-11",
		["bm_wp_sterling_b_e11"] = "Ствол BlasTech E-11",
		["bm_w_uzi"] = "Uzi",
		["bm_w_m1928"] = "Chicago Typewriter",
		["bm_w_mac10"] = "Mark 10",
		["bm_w_x_mac10"] = "Парные Mark 10",
		["bm_w_erma"] = "MP 40",
		["bm_w_schakal"] = "Jackal",
		["bm_w_polymer"] = "Kross Vertex",
		["bm_w_alpha57_prim"] = "FSS Hurricane",
		["bm_w_smg45"] = "FT Striker .45",
		["bm_w_fang45"] = "Fang 45",
		["bm_w_crysis3_typhoon"] = "CRYNET Typhoon",
		["bm_w_m7caseless"] = "Misriah Armory M7",
		["bm_w_m7caseless_supp"] = "Misriah Armory M7S",
		["bm_w_x_m7caseless"] = "Парные M7",
		["bm_w_x_m7caseless_supp"] = "Парные M7S",
		["bm_w_tecci"] = "Bootlegger",
		["bm_w_m249"] = "KSP-90",
		["bm_w_rpk"] = "RPK",
		["bm_w_hk21"] = "Brenner-21",
		["bm_w_kacchainsaw"] = "Campbell 74",
		["bm_w_m60"] = "M60",
		["bm_w_par"] = "KSP-58B",
		["bm_w_mg42"] = "Buzzsaw-42",
		["bm_w_mg42_dlt19"] = "DLT-19",
		["bm_wp_mg42_b_vg38"] = "Ствол BlasTech DLT-19",
		["bm_w_hk51b"] = "Versteckt-51B",
		["bm_w_basset"] = "Grimm 12G",
		["bm_w_x_basset"] = "Brothers Grimm 12G",
		["bm_w_saiga"] = "IZHMA 12G",
		["bm_w_aa12"] = "Steakout 12G",
		["bm_w_spas12"] = "Predator 12G",
		["bm_w_benelli"] = "M1014 12G",
		["bm_w_ultima"] = "Argos III 12G",
		["bm_w_supernova"] = "Deimos 12G",
		["bm_w_striker"] = "Street Sweeper 12G",
		["bm_w_rota"] = "Goliath 12G",
		["bm_w_sko12"] = "VD-12G",
		["bm_w_x_sko12"] = "Парные VD-12G",
		["bm_w_m37"] = "GSPS 12G",
		["bm_w_serbu"] = "Locomotive 12G",
		["bm_w_m1897"] = "Repeater 1897 12G",
		["bm_w_m590"] = "Mosconi Tactical 12G",
		["bm_w_r870"] = "Reinfeld 880 12G",
		["bm_w_ksg"] = "Raven 12G",
		["bm_w_boot"] = "Breaker 10G",
		["bm_w_coach"] = "Claire S/S 12G",
		["bm_w_huntsman"] = "Mosconi S/S 12G",
		["bm_w_judge"] = "The Judge",
		["bm_w_x_judge"] = "Judge & Jury",
		["bm_w_b682"] = "Joceline O/U 12G",
		["bm_w_quadbarrel"] = "Doomstick",
		["bm_w_mp153"] = "Argos I",
		["bm_w_s552"] = "Commando 552",
		["bm_w_amcar"] = "AM-CAR",
		["bm_w_g36"] = "JP-36KV",
		["bm_w_g36_k"] = "JP-36K",
		["bm_w_g36_c"] = "JP-36C",
		["bm_w_g36_v"] = "JP-36V",
		["bm_w_g36_long"] = "JP-36",
		["bm_w_vhs"] = "Lion's Roar",
		["bm_w_olympic"] = "Para-23",
		["bm_w_x_olympic"] = "Парные Para-23",
		["bm_w_komodo"] = "Tempest-95",
		["bm_w_famas"] = "Clarion 5.56",
		["bm_w_osipr"] = "SABR",
		["bm_w_osipr_gl"] = "SABR - гранатомет",
		["bm_w_m4"] = "CAR-4",
		["bm_w_m4_mk12"] = "CAR-12 SPR",
		["bm_w_m4_lr300"] = "TR-300",
		["bm_wp_upg_fg_m4a1"] = "Em-Four Kit",
		["bm_w_ak5"] = "Ak 5",
		["bm_w_ak5b"] = "Ak 5B",
		["bm_w_ak5c"] = "Ak 5C",
		["bm_w_ak5_fnc"] = "VF Carabine",
		["bm_w_corgi"] = "Union 5.56",
		["bm_w_aug"] = "UAR A2",
		["bm_w_aug_a3"] = "UAR A3",
		["bm_w_aug_f90"] = "Raptor 90",
		["bm_w_ak12"] = "AK-17",
		["bm_w_ak74"] = "AK 5.45",
		["bm_w_hajk"] = "CR 805B",
		["bm_w_m16"] = "AMR-16",
		["bm_w_m16a1"] = "AMR-16A1",
		["bm_w_l85a2"] = "Queen's Wrath",
		["bm_w_akm"] = "AK 7.62",
		["bm_w_akm_gold"] = "Золотой AK 7.62",
		["bm_w_groza"] = "OB-14st Byk-1",
		["bm_w_tkb"] = "Rodion 3B",
		["bm_w_akmsu"] = "Krinkov",
		["bm_w_x_akmsu"] = "Парные Krinkov",
		["bm_w_tilt"] = "KVK-99",
		["bm_w_g36k"] = "JP36K",
		["bm_w_rk62"] = "Velmer",
		["bm_w_t9fastburst"] = "CARV.2",
		["bm_w_mcbravo"] = "Chimera",
		["bm_w_ar18"] = "CAR-18",
		["bm_w_contraband"] = "Bigger Friend 7.62",
		["bm_w_contraband_m16"] = "Little Friend 5.56",
		["bm_w_contraband_mpx"] = "OMNIA PC9 9mm",
		["bm_w_fal"] = "Falcon 58",
		["bm_w_fal_l1a1"] = "Falcon SLR",
		["bm_w_fal_sa58"] = "Falcon 58 OSW",
		["bm_w_fal_idf"] = "Falcon RMT",
		["bm_w_asval"] = "Valkyria",
		["bm_w_galil"] = "Gecko 7.62",
		["bm_w_galil_galatz"] = "Gekkota 7.62",
		["bm_w_galil_mar"] = "Micro Gecko 7.62",
		["bm_w_galil_556"] = "Gecko 5.56",
		["bm_w_galil_mar_556"] = "Micro Gecko 5.56",
		["bm_w_scar"] = "Eagle Heavy",
		["bm_w_scarl"] = "Eagle Light",
		["bm_w_scar_l"] = "Eagle Light",
		["bm_w_ching"] = "M1 Galant",
		["bm_w_m14"] = "M308",
		["bm_w_g3"] = "Gewehr-3",
		["bm_w_g3_sg1"] = "Gewehr-S1",
		["bm_w_g3_msg"] = "Gewehr-90",
		["bm_w_g3_psg"] = "Präzision Gewehr-1",
		["bm_w_g3_hk33"] = "SG-33",
		["bm_w_g3_hk33_fo3"] = "R91",
		["bm_w_shak12"] = "KS-12 Urban",
		["bm_wp_shak12_body_vks"] = "\"VISha\" Stock",
		["bm_w_hcar"] = "Akron HC",
		["bm_w_hcar_bar"] = "Akron HC",
		["bm_w_mcx_spear"] = "FIK M7",
		["bm_w_vss"] = "Viktoriya",
		["bm_w_g3hk79"] = "Gewehr-A3 w/ GL79",
		["bm_w_xr2"] = "XR-2",
		["bm_w_msr"] = "Rattlesnake",
		["bm_w_r700"] = "Reinfeld Model 700",
		["bm_w_qbu88"] = "Káng Arms X1",
		["bm_w_winchester1874"] = "Repeater 1874",
		["bm_w_tti"] = "Tecci Tactical .308",
		["bm_w_victor"] = "SA North Star",
		["bm_w_scout"] = "Pronghorn",
		["bm_w_wa2000"] = "Lebensauger .300",
		["bm_w_sbl"] = "Rangehitter Mk. 2", --It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
		["bm_w_contender"] = "Aran G2",
		["bm_w_model70"] = "Platypus 70",
		["bm_w_siltstone"] = "Grom",
		["bm_w_mosin"] = "Nagant",
		["bm_w_desertfox"] = "Desertfox",
		["bm_w_r93"] = "R93",
		["bm_w_awp"] = "Amaroq 900",
		["bm_w_bessy"] = "Flintlock Freddy",
		["bm_w_m95"] = "Thanatos .50 BMG",
		["bm_w_sgs"] = "Guerilla 542",
		["bm_w_m107cq"] = "Mors .50 BMG",
		["bm_w_m200"] = "TF-141",
		["oracle_scope"] = "Oracle TechLink Scope",
	    ["bm_w_m1894"] = "Mare's Leg",
		["bm_w_moss464spx"] = "Mosconi SPX",
		["bm_w_winchester1894"] = "Repeater 1894",
		["bm_w_svd"] = "SV7",
		["bm_w_l115"] = "AIM 90M",
		["bm_wp_hmcar_hd_kit"] = "32bit 8K HD Kit",
		["bm_wp_avelyn"] = "Avelyn Kit",
		["bm_w_gre_m79"] = "GL-40",
		["bm_w_ms3gl"] = "Basilisk 3GL",
		["bm_w_m32"] = "Piglet",
		["bm_w_china"] = "China Puff",
		["bm_w_slap"] = "Compact 40mm",
		["bm_w_arbiter"] = "Arbiter",
		["bm_w_rpg7"] = "HRL-7",
		["bm_w_ray"] = "Commando 101 FLASH",

				})
		elseif weapon_names == 1 then -- Кириллица
			LocalizationManager:add_localized_strings({

		["bm_w_shatters_fury"] = "Феникс .500",
		["bm_w_osipr"] = "САБР",
		["bm_w_osipr_gl"] = "САБР - подствольник",
		["bm_w_maxim9"] = "Магнус 9",
		["bm_w_x_maxim9"] = "Парные Магнус 9",
		["bm_w_stech"] = "Стычкин Автоматический",
		["bm_w_x_stech"] = "Парные Стычкины",
		["bm_wp_pis_g26"] = "Чимано 26 Компакт",
		["bm_w_jowi"] = "Парные Чимано 26 Компакт",
		["bm_w_glock_18c"] = "Чимано 18C",
		["bm_w_x_g18c"] = "Парные Чимано 18C",
		["bm_w_czech"] = "Чешка 92",
		["bm_w_x_czech"] = "Парные Чешки 92",
		["bm_w_ppk"] = "Грубер Курц",
		["bm_w_legacy"] = "M13",
		["bm_w_x_legacy"] = "Парные M13",
		["bm_w_glock_17"] = "Чимано 88",
		["bm_w_x_g17"] = "Парные Чимано 88",
		["bm_w_b92fs"] = "Бернетти 92",
		["bm_w_x_b92fs"] = "Парные Бернетти 92",
		["bm_w_pl14"] = "Гусев",
		["bm_w_x_pl14"] = "Парные Гусевы",
		["bm_w_holt"] = "ХОЛТ",
		["bm_w_x_holt"] = "Парные ХОЛТ",
		["bm_w_fmg9"] = "Васп ДиЭс-9",
		["bm_w_beer"] = "Бернетти 93",
		["bm_w_packrat"] = "Контрактор M30Л",
		["bm_w_x_packrat"] = "Парные Контракторы",
		["bm_w_breech"] = "Парабеллум-08",
		["bm_w_g22c"] = "Чимано Кастом",
		["bm_w_x_g22c"] = "Парные Чимано Кастом",
		["bm_w_p226"] = "Сигнатур .40",
		["bm_w_hs2000"] = "ЛЕО-40",
		["bm_w_lemming"] = "Акьюто 5/7",
		["bm_w_sparrow"] = "Спэрроу 941",
		["bm_w_x_sparrow"] = "Биба и Боба",
		["bm_w_socom"] = "Анубис .45",
		["bm_w_x_socom"] = "Парные Анубис .45",
		["bm_w_colt_1911"] = "Кросскилл Оператор II",
		["bm_w_x_1911"] = "Мустанг и Сэлли",
		["bm_w_m1911"] = "Кроскилл А1",
		["bm_w_x_m1911"] = "Прайс и МакТавиш",
		["bm_w_shrew"] = "Кроскилл Гард",
		["bm_w_shrew_joshua"] = "Свет, сияющий во тьме",
		["bm_w_x_shrew"] = "Барри и Пол",
		["bm_w_usp"] = "Интерсептор-45",
		["bm_w_x_usp"] = "Парные Интерспеторы-45",
		["bm_w_type54"] = "Токарь-33",
		["bm_w_x_type54"] = "Парные Токари-33",
		["bm_w_c96"] = "\"Метла\"",
		["bm_w_c96_dl44"] = "ДЛ-44",
		["bm_w_sub2000"] = "Кавити .40",
		["bm_w_deagle"] = "Дигл",
        ["bm_w_x_deagle"] = "Парные Диглы",
		["bm_w_korth"] = "Кан .357",
		["bm_w_x_korth"] = "Парные Кан .357",
		["bm_w_mateba"] = "Матевер 9мм",
		["bm_w_x_2006m"] = "Парные Матеверы",
		["bm_w_model3"] = "Френчман 87",
        ["bm_w_x_model3"] = "Парные Френчманы 87",
		["bm_w_raging_bull"] = "Бронко .44",
		["bm_w_x_rage"] = "Парные Бронко .44",
		["bm_w_chinchilla"] = "Кастиго .44",
        ["bm_w_x_chinchilla"] = "Парные Кастиго .44",
		["bm_w_rsh12"] = "РШУ-12",
		["bm_w_peacemaker"] = "Миротворец .45",
--CUSTOM HANDGUNS
			--ZiP 22
			["bm_w_zip22"] = "Зиппи 3000",
			--Px4
			["bm_w_px4"] = "Бернетти Нх4 Канан",
			--Browning Hi-Power
			["bm_w_hpb"] = "Хай-Пауэр",
			--Walther P99
			["bm_w_p99"] = "Лакнер Г99",
			--Derringer
			["bm_w_derringer"] = "Деринжер",
			--Automag .44
			["bm_w_amt"] = "Автомаг .44",
			--Colt Detective
			["bm_w_coltds"] = "Кросскилл Детектив",
			--SIG P320
			["bm_w_papa320"] = "М19",
		["bm_w_p90"] = "Проджект-90",
		["bm_w_x_p90"] = "Парные Проджект-90",
		["bm_w_mp7"] = "СпекОпс-7",
		["bm_w_tec9"] = "ТЕК",
		["bm_w_x_tec9"] = "Парные ТЕК",
		["bm_w_sr2"] = "Пихта С-2",
		["bm_w_x_sr2"] = "Парные Пихты С-2",
		["bm_w_mp9"] = "КМП 9",
		["bm_w_pm9"] = "Мияка 9",
		["bm_w_baka"] = "Микро Узи",
		["bm_w_x_baka"] = "Парные Микро Узи",
		["bm_w_scorpion"] = "Кобра",
		["bm_w_x_scorpion"] = "Парные Кобры",
		["bm_w_coal"] = "Татонка",
		["bm_w_vityaz"] = "АК 21 Тактический",
		["bm_w_shepheard"] = "ФИК ПС9",
		["bm_w_mp5"] = "Компакт-5",
		["bm_w_mp5sd"] = "Компакт-5СД",
		["bm_w_mp5k"] = "Компакт-5К",
		["bm_w_mp5k_pdw"] = "Компакт-5К ПДВ",
		["bm_w_x_mp5"] = "Парные Компакт-5",
		["bm_w_m45"] = "Карл M-45",
		["bm_w_sterling"] = "Патчетт Л2A3",
		["bm_w_sterling_sd"] = "Патчетт Л34А1",
		["bm_w_sterling_pistol"] = "Патчетт Мк. VII",
		["bm_w_sterling_e11"] = "Е-11",
		["bm_w_uzi"] = "Узи",
		["bm_w_m1928"] = "Чикагская машинка",
		["bm_w_mac10"] = "Марк 10",
		["bm_w_x_mac10"] = "Парные Марк 10",
		["bm_w_erma"] = "Шмайсер",
		["bm_w_schakal"] = "Шакал",
		["bm_w_polymer"] = "Кросс Вертекс",
--CUSTOM SMGs
			--AR57
			["bm_w_alpha57_prim"] = "Ураган",
			--LWRC
			["bm_w_smg45"] = "Страйкер .45",
			--LWRC
			["bm_w_fang45"] = "Фанг 45",
			--Typhoon
			["bm_w_crysis3_typhoon"] = "КРАЙНЕТ Тайфун",

			["bm_w_m7caseless"] = "Мисрих M7",
			["bm_w_m7caseless_supp"] = "Мисрих М7С",
			["bm_w_x_m7caseless"] = "Парные M7",
			["bm_w_x_m7caseless_supp"] = "Парные M7С",

			["bm_w_sig_xm250"] = "ФИК МГ277",
		["bm_w_tecci"] = "Контрабандист",
		["bm_w_m249"] = "КСП 90",
		["bm_w_kacchainsaw"] = "Кэмпбелл 74",
		["bm_w_rpk"] = "РПК",
		["bm_w_hk21"] = "Бреннер 21",
		["bm_w_hcar"] = "Акрон",
		["bm_w_hcar_bar"] = "Акрон",
		["bm_w_m60"] = "M60",
		["bm_w_par"] = "КСП 58",
		["bm_w_mg42"] = "Косторез 42",
		["bm_w_mg42_dlt19"] = "ДЛТ-19",
		["bm_w_hk51b"] = "Ферштект-51",
		["bm_w_basset"] = "Гримм 12",
		["bm_w_x_basset"] = "Братья Гримм 12",
		["bm_w_saiga"] = "Ижма 12",
		["bm_w_aa12"] = "Стейкаут 12",
	    ["bm_w_spas12"] = "Хищник 12",
		["bm_w_benelli"] = "M1014",
		["bm_w_ultima"] = "Аргос 3",
		["bm_w_striker"] = "Чистильщик",
		["bm_w_rota"] = "Голиаф 12",
		["bm_w_sko12"] = "ВД 12",
		["bm_w_x_sko12"] = "Парные ВД 12",
		["bm_w_m37"] = "ДжиЭс 12",
		["bm_w_supernova"] = "Деймос",
		["bm_w_serbu"] = "Локомотив 12",
		["bm_w_m1897"] = "Репитер 1897",
		["bm_w_m590"] = "Москони 12 Тактический",
		["bm_w_r870"] = "Рейнфилд 880",
		["bm_w_ksg"] = "Рейвен 12",
		["bm_menu_sc_boot"] = "Брейкер 10",
		["bm_w_boot"] = "Брейкер 10",
		["bm_w_coach"] = "Клэр 12",
		["bm_w_huntsman"] = "Москони 12",
		["bm_w_judge"] = "Судья",
		["bm_w_x_judge"] = "Жока и Бока", --вините клейтона.
		["bm_w_b682"] = "Джоселина 12",
		["bm_w_quadbarrel"] = "Думстик",
		["bm_w_mp153"] = "Аргос 1",
		["bm_w_s552"] = "Коммандо 552",
		["bm_w_amcar"] = "АМКАР",
		["bm_w_g36"] = "ДЖП 36КВ",
		["bm_w_g36_k"] = "ДЖП 36К",
		["bm_w_g36_c"] = "ДЖП 36С",
		["bm_w_g36_v"] = "ДЖП 36В",
		["bm_w_g36_long"] = "ДЖП 36",
		["bm_w_vhs"] = "Львиный оскал",
		["bm_w_olympic"] = "Пара 23",
		["bm_w_x_olympic"] = "Парные Пара 23",
		["bm_w_komodo"] = "Темпест 95",
		["bm_w_famas"] = "Клэрион 5.56",
		["bm_w_m4"] = "КАР-4",
		["bm_w_m4_mk12"] = "КАР-12 СПР",
		["bm_w_m4_lr300"] = "ТР-300",
		["bm_w_ak5"] = "АК 5",
		["bm_w_ak5b"] = "АК 5Б",
		["bm_w_ak5c"] = "АК 5С",
		["bm_w_ak5_fnc"] = "Карабин ВФ",
		["bm_w_corgi"] = "Юнион 5.56",
		["bm_w_aug"] = "ЮАР A2",
		["bm_w_aug_a3"] = "ЮАР А3",
		["bm_w_aug_f90"] = "Раптор 90",
		["bm_w_ak12"] = "АК 17",
		["bm_w_ak74"] = "АК 5.45",
		["bm_w_hajk"] = "КР 805",
		["bm_w_m16"] = "АМР 16",
		["bm_w_m16a1"] = "АМР-16А1",
		["bm_w_l85a2"] = "Ярость Королевы",
		["bm_w_akm"] = "АК 7.62",
		["bm_w_akm_gold"] = "Золотой АК 7.62",
		["bm_w_l85a2"] = "Ярость Королевы",
		["bm_w_groza"] = "ОБ14 Бык 1",
		["bm_w_tkb"] = "Трехствольник Родионова",
		["bm_w_akmsu"] = "Кринков",
		["bm_w_x_akmsu"] = "Парные Кринковы",
		--CUSTOM ARs
			--AN-94/92
			["bm_w_tilt"] = "КВК 99",
			["bm_w_g36k"] = "ДЖП 36K",
			["bm_w_scarl"] = "Игл Лайт",
			["bm_w_rk62"] = "Вельмер",
			["bm_w_mcbravo"] = "Химера",
			["bm_w_ar18"] = "КАР-18",
			["bm_w_pd3_qbz191"] = "Нортвест Б-9",
			["bm_w_t9fastburst"] = "КАРВ.2",
		["bm_w_ching"] = "M1 Галант",
		["bm_w_m14"] = "M308",
		["bm_w_fal"] = "Фалкон 58",
		["bm_w_fal_l1a1"] = "Фалкон СЛР",
		["bm_w_fal_sa58"] = "Фалкон 58 ОСВ",
		["bm_w_fal_idf"] = "Фалкон РМТ",
		["bm_w_scar"] = "Игл Хэви",
		["bm_w_scar_l"] = "Игл Лайт",
		["bm_w_g3"] = "Гевер 3",
		["bm_w_g3_sg1"] = "Гевер-С1",
		["bm_w_g3_msg"] = "Гевер-90",
		["bm_w_g3_psg"] = "Präzision Гевер-1",
		["bm_w_g3_hk33"] = "СГ-33",
		["bm_w_g3_hk33_fo3"] = "Р91",
		["bm_w_contraband"] = "Большой дружок 7.62",
		["bm_w_contraband_m16"] = "Маленький дружок 5.56",
		["bm_w_contraband_mpx"] = "ОМНИА ПС9 9мм",
		["bm_w_asval"] = "Валькирия",
		["bm_w_galil"] = "Гекко 7.62",
		["bm_w_galil_galatz"] = "Геккота 7.62",
		["bm_w_galil_mar"] = "Микро Гекко 7.62",
		["bm_w_galil_556"] = "Гекко 5.56",
		["bm_w_galil_mar_556"] = "Микро Гекко 5.56",
		["bm_w_shak12"] = "КС 12",
--Custom DMRs
			--MCX Spear
			["bm_w_mcx_spear"] = "ФИК M7",
			["bm_w_ngsierra"] = "Амикус 277",
			["bm_w_vss"] = "Виктория",
			["bm_w_g3hk79"] = "Гевер А3 с гранатометом",
			["bm_w_xr2"] = "Иксэр 2",
			["bm_w_sierra458"] = "Съерра .458",
		["bm_w_msr"] = "Раттлснейк",
		["bm_w_r700"] = "Рейнфилд Модель 700",
		["bm_w_qbu88"] = "Кэнг Икс 1",
		["bm_w_winchester1874"] = "Репитер 1874",
		["bm_w_tti"] = "Текки .308",
		["bm_w_victor"] = "Полярная звезда",
		["bm_w_scout"] = "Пронгхорн",
		["bm_w_awp"] = "Амарок 900",
		["bm_w_wa2000"] = "Лебензаугер .300",
		["bm_w_sbl"] = "Рейнджхитер Марк 2",
		["bm_w_contender"] = "Аран Джи 2",
		["bm_w_model70"] = "Платипус 70",
		["bm_w_siltstone"] = "Гром",
		["bm_w_mosin"] = "Нагант",
		["bm_w_desertfox"] = "Дезерт Фокс",
		["bm_w_r93"] = "Р93",
		["bm_w_bessy"] = "Флинтлок Фредди",
		["bm_w_m95"] = "Танатос .50",
--Custom Snipers
			--Guerilla
			["bm_w_sgs"] = "Партизан 553",
			["bm_w_m107cq"] = "Морс .50",
			["bm_w_m200"] = "ТФ 141",
			["bm_w_pd3_lynx"] = "ХЕТ-5 Ред Фокс",
			["bm_w_amr2"] = "Нортвест АМ-2",
		["bm_w_m1894"] = "Mare's Leg",
		["bm_w_moss464spx"] = "Москони ЭсПиЭкс",
		["bm_w_winchester1894"] = "Репитер 1894",
		["bm_w_svd"] = "СВ 7",
		["bm_w_l115"] = "АИМ 90",
		["bm_w_gre_m79"] = "ГЛ 40",
		["bm_w_m32"] = "Хрюндель",
		["bm_w_china"] = "Чайна Пафф",
		["bm_w_slap"] = "Компакт 40",
		["bm_w_arbiter"] = "Арбитр",
		["bm_w_rpg7"] = "РПГ",
		["bm_w_ray"] = "Коммандо 101",

		})

		elseif weapon_names == 3 then --DMCWO перевод
			LocalizationManager:add_localized_strings({
--[[PISTOLS]]
					--5/7
					["bm_w_lemming"] = "FN Five-seveN",
					--Gecko Pistol
					["bm_w_maxim9"] = "SilencerCo Maxim 9",
					["bm_w_x_maxim9"] = "Akimbo Maxim 9s",

					--Stryk 18
					["bm_w_glock_18c"] = "Glock 18C",
					["bm_w_x_g18c"] = "Akimbo Glock 18Cs",
					["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm",
					--CZ
					["bm_w_czech"] = "CZ AccuShadow 2",
					["bm_w_x_czech"] = "Akimbo AccuShadow 2s",

					--APS
					["bm_w_stech"] = "Stechkin APS",
					["bm_w_x_stech"] = "Akimbo Stechkins",
					--Gruber
					["bm_w_ppk"] = "Walther PPK/S",
					["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip",
					["bm_wp_pis_ppk_b_long"] = "PPKS Slide",
					--Chimano 88
					["bm_w_glock_17"] = "Glock 17",
					["bm_w_x_g17"] = "Akimbo Glock 17s",
					--Glock 26
					["bm_wp_pis_g26"] = "Glock 26",
					["bm_w_jowi"] = "Akimbo Glock 26s",
					["bm_wp_g26_body_salient"] = "Stipled Frame",
					["bm_wp_g26_b_custom"] = "Brushed Slide",
					["bm_wp_g26_m_custom"] = "G26 Stipled Magazine",
					--Luger
					["bm_w_breech"] = "Luger P08",
					--Bernetti 9
					["bm_w_b92fs"] = "Beretta 92FS",
					["bm_w_x_b92fs"] = "Akimbo 92FSs",
					["bm_wp_beretta_co_co1"] = "SGS Compensator", --Original name was a reference to the movie "The Professional"
					["bm_wp_beretta_co_co2"] = "Competition Compensator", --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models 	were based off of airsoft counterparts
					["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide",
					["bm_wp_beretta_g_ergo"] = "Wood Ergo Grips",
					["bm_wp_beretta_m_extended"] = "30rnd 92FS Magazine",
					["bm_wp_beretta_g_engraved"] = "Engraved 92FS Grips",
					--PL14
					["bm_w_pl14"] = "Kalashnikov Concern PL-14 \"Lebedev\"",
					["bm_wp_pl14_m_extended"] = "17rnd PL-14 Magazine",
					["bm_wp_pl14_b_comp"] = "PL-14 Compensator",
					--Wick
					["bm_w_packrat"] = "H&K P30L",
					["bm_w_x_packrat"] = "Akimbo P30Ls",
					--Hudson
					["bm_w_holt"] = "Hudson H9",
					["bm_w_x_holt"] = "Akimbo H9s",
					--93R
					["bm_w_beer"] = "Beretta 93R",
					--M13
					["bm_w_legacy"] = "H&K P7M13",

					--LEO-40
					["bm_w_hs2000"] = "Springfield Armory XD(M)-40",
					["bm_wp_hs2000_m_extended"] = "22rnd XD(M)-40 Magazine",
					["bm_wp_hs2000_sl_custom"] = "Compensated Slide",
					["bm_wp_hs2000_sl_long"] = "Custom Slide",
					--Signature 40
					["bm_w_p226"] = "SIG P226R",
					["bm_w_x_p226"] = "Akimbo P226Rs",
					["bm_wp_p226_co_comp_2"] = "SJC Compensator .40",
					["bm_wp_p226_m_extended"] = "22rnd P226 Magazine",
					["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide",
					["bm_wp_p226_b_long"] = "Brushed Long Slide",
					["bm_wp_p226_co_comp_2"] = "SJC Compensator .40",
					--Chimano Custom
					["bm_w_g22c"] = "Glock 22C",
					["bm_w_x_g22c"] = "Akimbo Glock 22Cs",
					["bm_wp_g22c_b_long"] = "Glock 35 Compensated Slide",
					--Bang...
					["bm_w_sparrow"] = "IWI Jericho 941 RPL",
					["bm_w_x_sparrow"] = "Akimbo 941s",
					["bm_wp_sparrow_body_941"] = "IWI Jericho 941F Kit",
					["bm_wp_sparrow_g_cowboy"] = "Weighted Grip",
					["bm_wp_sparrow_g_cowboy_desc"] = "YOU'RE GONNA CARRY THAT WEIGHT.",

					--SUB2000
					["bm_w_sub2000"] = "Kel-Tec SUB-2000",
					["bm_wp_sub2000_fg_gen2"] = "Gen2 Handguard",
					["bm_wp_sub2000_fg_railed"] = "Red Lion R6 Handguard",
					["bm_wp_sub2000_fg_suppressed"] = "Quad Rail Handguard w/Suppressor",
					--C96
					["bm_w_c96"] = "Mauser C96",
					["bm_w_c96_dl44"] = "BlasTech DL-44",
					["bm_wp_c96_b_long"] = "Carbine Barrel",
					["bm_wp_c96_nozzle"] = "DL-44 Muzzle",
					["bm_wp_c96_sight"] = "Schmidt & Bender 1-8x24 PM Short Dot",
					["bm_wp_c96_m_extended"] = "20rnd C96 Magazine",
					--Crosskill
					["bm_w_colt_1911"] = "Springfield Armory 1911 Operator",
					["bm_w_x_1911"] = "Akimbo 1911 Operators",
					["bm_wp_1911_co_2"] = "TCII Compensator", --Not 100% but seems to be based off of it
					["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster", --Not 100% but seems to be based off of it
					["bm_wp_1911_g_ergo"] = "Pachmayr 1911 Grip",
					["bm_wp_1911_g_bling"] = "Wood Grips",
					["bm_wp_1911_g_engraved"] = "Engraved 1911 Grips",
					["bm_wp_1911_b_long"] = "Compensated Long Slide",
					["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide",
					["bm_wp_1911_m_extended"] = "12rnd SA 1911 Magazine",
					--Crosskill Chunky
					["bm_w_m1911"] = "Colt 1911A1", --Not entirely but its the closest thing
					["bm_w_x_m1911"] = "Akimbo 1911A1s",
					--Crosskill Guard
					["bm_w_shrew"] = "Colt Defender",
					["bm_w_shrew_joshua"] = "A Light Shining in Darkness",
					["bm_w_x_shrew"] = "Akimbo Defenders",
					--Interceptor
					["bm_w_usp"] = "H&K USP Tactical",
					["bm_w_x_usp"] = "Akimbo USP Tacticals",
					["bm_wp_usp_co_comp_2"] = "SJC Compensator .45",
					["bm_wp_pis_usp_b_expert"] = "USP Expert Slide",
					["bm_wp_pis_usp_b_match"] = "USP Match Slide",
					["bm_wp_pis_usp_m_extended"] = "20rnd USP Magazine",
					--Anubis
					["bm_w_socom"] = "H&K Mk.23",
					["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Prototype Phase I LAM",
					["bm_w_x_socom"] = "Akimbo Mk.23s",
					--TT-33
					["bm_w_type54"] = "Tokarev TT-33",
					["bm_w_x_type54"] = "Akimbo TT-33s",

					--Kahn .357
					["bm_w_korth"] = "Korth NXA",
					["bm_w_x_korth"] = "Akimbo Korth NXAs",
					--Mateba
					["bm_w_mateba"] = "Mateba 2006M",
					["bm_w_x_2006m"] = "Akimbo 2006Ms",
					--Frenchman Model 87
					["bm_w_model3"] = "S&W Model 3",
					["bm_w_x_model3"] = "Akimbo Model 3s",
					--Shatter's Fury
					["bm_w_chinchilla"] = "S&W Model 29",
					["bm_w_x_chinchilla"] = "Akimbo Model 29s",
					--Bronco
					["bm_w_raging_bull"] = "Taurus Raging Bull",
					["bm_w_x_rage"] = "Akimbo Raging Bulls",
					["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount",
					["bm_wp_rage_b_comp1"] = "S&W V-Compensator",
					["bm_wp_rage_b_short"] = "Snub Nose Barrel",
					["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator",
					["bm_wp_rage_b_long"] = "Long Barrel",
					--Deagle
					["bm_w_deagle"] = "MRI Desert Eagle Mark XIX", --"IS THAT A M16?"
					["bm_w_x_deagle"] = "Akimbo Desert Eagles",
					["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake", --Original name was a reference to the 1990s film "La Femme Nikita" only for the gun's appearance in it, otherwise this is based on the real "DE50MB" Deagle muzzle brake
					["bm_wp_deagle_co_long"] = "Custom Barrel Weight", --Attachment is a reference to the Boondock Saints
					["bm_wp_deagle_g_ergo"] = "Pachmayr Grip", --Doesn't exist but it's the same model from the 1911 but enlarged so w/e
					["bm_wp_deagle_g_bling"] = "Pearl Grips",
					["bm_wp_deagle_m_extended"] = "12rnd Desert Eagle Magazine",
					["bm_wp_deagle_b_long"] = "10\" Long Barrel",
					--SAA
					["bm_w_peacemaker"] = "Colt Single Action Army",
					["bm_wp_peacemaker_barrel_long"] = "12\" Barrel",
					["bm_wp_peacemaker_barrel_short"] = "5.5\" Barrel",
					["bm_wp_peacemaker_handle_bling"] = "Engraved SAA Grips",
					["bm_wp_peacemaker_rifle_stock"] = "Skeletal Stock",
					--RUS-12
					["bm_w_rsh12"] = "KPB RSh-12",
					--Shatter's Fury
					["bm_w_shatters_fury"] = "S&W Model 500",

					--MODS
					["bm_w_papa320"] = "SIG P320",
					["bm_w_coltds"] = "Colt Detective",
					["bm_w_amt"] = ".44 Auto Mag",
					["bm_w_p99"] = "Walther P99",
					["bm_w_hpb"] = "Browning Hi-Power",

				--[[SMGs]]
					--P90
					["bm_w_p90"] = "FN P90 TR",
					["bm_w_x_p90"] = "Akimbo P90s",
					["bm_wp_p90_b_long"] = "PS90 Barrel",
					["bm_wp_p90_b_civilian"] = "Moerse Lekker Barrel Shroud",
					--MP7
					["bm_w_mp7"] = "H&K MP7A2", --PD2's version kinda existed before the real MP7A2 was a thing so there's still some MP7A1 bits on it but w/e
					["bm_wp_mp7_b_suppressed"] = "B&T Rotex-II Suppressor",
					["bm_wp_mp7_s_long"] = "Extended Stock",
					["bm_wp_mp7_m_extended"] = "MP7 40rnd Magazine",
					--CMP
					["bm_w_mp9"] = "B&T TP9SF",
					["bm_w_x_mp9"] = "Akimbo TP9SFs",
					["bm_wp_mp9_m_extended"] = "30rnd TP9 Magazine",
					["bm_wp_mp9_s_skel"] = "Steyr TMP Fixed Stock",
					["bm_wp_mp9_b_suppressed"] = "B&T MP9 QD Suppressor",
					--Micro Uzi
					["bm_w_baka"] = "IWI Micro Uzi",
					["bm_w_x_baka"] = "Akimbo Micro Uzis",
					--T3K
					["bm_w_tec9"] = "Intratec TEC-9",
					["bm_wp_tec9_b_standard"] = "AB-10 Barrel",
					["bm_wp_tec9_ns_ext"] = "Pseudo Barrel Extension",
					["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock",
					["bm_wp_tec9_m_extended"] = "50rnd TEC-9 Magazine",
					--Jacket's Piece
					["bm_w_cobray"] = "Cobray M11/9",
					["bm_wp_cobray_ns_barrelext"] = "MAC Barrel Extension",
					--SR-2M
					["bm_w_sr2"] = "TsNIITochMash SR-2M \"Veresk\"",
					["bm_w_x_sr2"] = "Akimbo SR-2Ms",
					--Miyaka 9
					["bm_w_pm9"] = "Minebea PM-9",
					--FMG9
					["bm_w_fmg9"] = "Magpul FDC-9",
					["bm_wp_fmg9_grip_tape"] = "Grip Tape",
					["bm_wp_fmg9_stock_pad"] = "Rubbber Butt-Pad",

					--Cobra
					["bm_w_scorpion"] = "CZ vz. 61 Skorpion",
					["bm_w_x_scorpion"] = "Akimbo Skorpions",
					["bm_wp_scorpion_m_extended"] = "Skorpion Dual Magazines",
					["bm_wp_scorpion_b_suppressed"] = "Skorpion Suppressor",
					--MP5
					["bm_w_mp5"] = "H&K MP5A2",
					["bm_w_mp5sd"] = "H&K MP5SD",
					["bm_w_mp5k"] = "H&K MP5K",
					["bm_w_mp5k_pdw"] = "H&K MP5K PDW",
					["bm_w_x_mp5"] = "Akimbo MP5A2s",
					["bm_wp_mp5_fg_m5k"] = "MP5k Tri-Rail Kit",
					["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard",
					["bm_wp_mp5_fg_mp5sd"] = "MP5SD Kit",
					["bm_wp_mp5_s_adjust"] = "H&K Retractable Stock",
					["bm_wp_mp5_s_ring"] = "No Stock",
					["bm_wp_mp5_s_folding"] = "Choate Folding Stock",
					["bm_wp_mp5_m_drum"] = "70rnd MP5 Drum",
					["bm_wp_mp5_m_straight"] = "30rnd MP5 40/10 Magazine",
					--MPX
					["bm_w_shepheard"] = "SIG MPX",
					--Vityaz
					["bm_w_vityaz"] = "Kalashnikov Concern PP-19 Vityaz-SN",
					--Bizon
					["bm_w_coal"] = "Kalashnikov Concern PP-19 Bizon-2",

					--Uzi
					["bm_w_uzi"] = "IWI Uzi",
					["bm_w_x_uzi"] = "Akimbo Uzi",
					["bm_wp_uzi_s_solid"] = "Wooden Stock",
					["bm_wp_uzi_fg_rail"] = "FAB Defense Uzi Tri-Rail System",
					["bm_wp_uzi_b_suppressed"] = "Two-Stage Suppressor",
					--Pachette
					["bm_w_sterling"] = "Sterling L2A1",
					["bm_w_sterling_e11"] = "BlasTech E-11",
					["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel",
					["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
					["bm_wp_sterling_m_short"] = "15rnd Magazine",
					["bm_wp_sterling_m_long"] = "34rnd Magazine",
					--
					["bm_w_mac10"] = "Ingram M10",
					["bm_w_x_mac10"] = "Akimbo M10s",
					["bm_wp_mac10_m_extended"] = "30rnd Magazine",
					["bm_wp_mac10_body_ris"] = "MAC Rail System", --I'm getting nothing but airsoft results so generic name
					["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock",
					--Thompson
					["bm_w_m1928"] = "Auto-Ordnance M1928",
					["bm_wp_m1928_b_short"] = "Short Barrel",
					["bm_wp_m1928_fg_discrete"] = "Polymer Foregrip",
					["bm_wp_m1928_g_discrete"] = "Polymer Pistol Grip",
					["bm_wp_m1928_s_discrete"] = "Polymer Stock",
					--MP 40
					["bm_w_erma"] = "Erma MP 40",
					--UMP
					["bm_w_schakal"] = "H&K UMP-45",
					["bm_wp_schakal_b_civil"] = "USC Barrel",
					["bm_wp_schakal_ns_silencer"] = "GemTech QD UMP Suppressor",
					["bm_wp_schakal_m_short"] = "15rnd Magazine",
					["bm_wp_schakal_m_long"] = "45rnd Magazine",
					--M45
					["bm_w_m45"] = "Carl Gustaf Kpist M/45",
					["bm_wp_smg_m45_m_extended"] = "50rnd M/45 Magazine",
					--Vector
					["bm_w_polymer"] = "KRISS Vector SMG",
					["bm_wp_polymer_barrel_precision"] = "CRB Barrel w/Shroud",
					["bm_wp_polymer_ns_silencer"] = "Defiance HPS 4GSK Suppressor",

				--[[MGs]]
					--416C
					["bm_w_tecci"] = "H&K HK416-C",
					["bm_wp_tecci_b_long"] = "Long Barrel",
					["bm_wp_tecci_ns_special"] = "JPE Recoil Eliminator Muzzle Brake",
					--Shuno what it is
					["bm_w_shuno"] = "Empty Shell XM556 Microgun",

					--SAW
					["bm_w_m249"] = "FN M249 Para",
					["bm_wp_m249_fg_mk46"] = "Mk 46 Handguard",
					["bm_wp_m249_s_solid"] = "M249 Fixed Stock",

					--ChainSAW
					["bm_w_kacchainsaw"] = "KAC ChainSAW",
					["bm_wp_kacchainsaw_barrel_short"] = "Short Barrel",
					["bm_wp_kacchainsaw_barrel_long"] = "Long Barrel",
					["bm_wp_kacchainsaw_mag_b"] = "100rnd Soft Ammo Pouch",
					["bm_wp_kacchainsaw_flamethrower"] = "Underbarrel Flamethrower",
					["bm_wp_kacchainsaw_sling"] = "ChainSAW Sling",

					--RPK
					["bm_w_rpk"] = "Kalashnikov Concern RPK",
					["bm_wp_rpk_fg_standard"] = "Polymer AK Handguard",
					["bm_wp_rpk_s_standard"] = "Polymer RPK Stock",
					["bm_wp_rpk_m_ban_sc"] = "45rnd Molot AK Magazine",

					--HK21
					["bm_w_hk21"] = "H&K HK21E",
					["bm_wp_hk21_fg_short"] = "Short HK21 Handguard",
					["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip",
					--MG42
					["bm_w_mg42"] = "Mauser Maschinengewehr 42",
					["bm_w_mg42_dlt19"] = "BlasTech DLT-19",
					["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel",
					["bm_wp_mg42_b_vg38"] = "BlasTech DLT-19 Barrel",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "Vollmer HK51-B",
					["bm_wp_hk51b_fg_railed"] = "Tri-Rail Handguard",
					["bm_wp_hk51b_b_fluted"] = "Fluted Long Barrel",

					--M240
					["bm_w_par"] = "FN M240B",
					["bm_wp_par_s_plastic"] = "M240B Stock",
					--M60
					["bm_w_m60"] = "Saco M60",
					["bm_wp_m60_fg_tactical"] = "MK43 RIS Handguard",
					["bm_wp_m60_fg_tropical"] = "Leaf Wrappings",
					["bm_wp_m60_fg_keymod"] = "Keymod Handguard",

					--M134
					["bm_w_m134"] = "General Electric M134",
					["bm_wp_m134_barrel_extreme"] = "Anti-Air Barrel",
					["bm_wp_m134_barrel_short"] = "Compact Barrel",

				--[[SHOTGUNS]]
					--Saiga
					["bm_w_basset"] = "Spike X1S Saiga",
					["bm_w_x_basset"] = "Akimbo Spike X1S Saiga",
					["bm_w_basset_m_extended"] = "10rnd AGP Arms Magazine",
					["bm_w_saiga"] = "Kalashnikov Concern Saiga-12K",
					["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System",
					["bm_wp_saiga_m_20rnd"] = "20rnd MD Arms Drum",
					["bm_wp_saiga_fg_holy"] = "Fuglystick Rail System",
					--AA12
					["bm_w_aa12"] = "MPS Auto Assault-12 CQB",
					["bm_wp_aa12_barrel_long"] = "Standard Barrel",
					["bm_wp_aa12_mag_drum"] = "20rnd Drum",
					--Six12
					["bm_w_rota"] = "Crye Precision SIX12",
					--M1014
					["bm_w_benelli"] = "Benelli M4 Super 90",
					["bm_wp_ben_b_long"] = "Long Barrel",
					["bm_wp_ben_b_short"] = "NFA Barrel",
					["bm_wp_ben_s_collapsed"] = "Collapsed Stock",
					["bm_wp_ben_fg_standard"] = "Tactical Stock",
					--SPAS-12
					["bm_w_spas12"] = "Franchi SPAS-12",
					["bm_wp_spas12_b_long"] = "8rnd Tube",
					--Striker
					["bm_w_striker"] = "Sentinel Arms Striker",
					--VD-12
					["bm_w_sko12"] = "Standard Manufacturing SKO-12",
					--Argos III
					["bm_w_ultima"] = "Baikal MP-155 Ultima",

					--870
					["bm_w_r870"] = "Remington Model 870",
					["bm_wp_r870_m_extended"] = "2rnd Tube Extension",
					["bm_wp_r870_fg_wood"] = "Wooden Pump",
					["bm_wp_r870_s_folding"] = "No Stock",
					["bm_wp_r870_s_folding_ext"] = "Remington Wingmaster Folding Stock",
					["bm_wp_r870_s_folding"] = "Remington Wingmaster Folded Stock",
					["bm_wp_r870_s_nostock_big"] = "No Stock w/Full Length Rail",
					["bm_wp_r870_s_solid_big"] = "Fixed Stock w/Full Length Rail",
					--Loco
					["bm_w_serbu"] = "Short Remington Model 870",
					["bm_wp_shorty_m_extended_short"] = "1rnd Tube Extension",
					["bm_wp_r870_s_solid"] = "Fixed Stock",
					["bm_wp_serbu_s_solid_short"] = "Fixed Stock w/Rail",
					["bm_wp_serbu_s_nostock_short"] = "No Stock w/Rail",
					--KSG
					["bm_w_ksg"] = "Kel-Tec KSG",
					["bm_wp_ksg_b_long"] = "Long Barrel w/2x 8-Shot Tubes",
					["bm_wp_ksg_b_short"] = "Patrol Barrel w/2x 6-Shot Tubes",
					--Judge
					["bm_w_judge"] = "Taurus 4510PLYFS",
					["bm_w_x_judge"] = "Akimbo Judges",
					--M37
					["bm_w_m37"] = "Ithaca Model 37",
					--NO SHOTGUNS IN THE TRENCHES
					["bm_w_m1897"] = "Winchester Model 1897",
					--M590
					["bm_w_m590"] = "Mossberg 590",
					["bm_wp_m590_body_rail"] = "Black Aces Tactical Quad Rail",
					--Supernova
					["bm_w_supernova"] = "Benelli Supernova",
					["bm_wp_supernova_g_adapter"] = "Benelli AR-15 Stock Adapter",
					["bm_wp_supernova_g_raven"] = "ATI Raven Grip",
					["bm_wp_supernova_g_stakeout"] = "Dickinson XX3 Grip",
					["bm_wp_supernova_s_collapsed"] = "Collapsed Stock",
					["bm_wp_supernova_s_Raven"] = "ATI Raven Stock",

					--Mosconi
					["bm_w_huntsman"] = "Mosconi Coach Gun",
					["bm_wp_huntsman_b_short"] = "Sawn-Off Barrel",
					["bm_wp_huntsman_s_short"] = "Sawn-Off Stock",
					--725
					["bm_w_b682"] = "Beretta 682", --funni hybrid 682, naming it after its internal name anyways
					["bm_wp_b682_b_short"] = "Sawn-Off Barrel",
					["bm_wp_b682_s_short"] = "Sawn-Off Stock",
					["bm_wp_b682_s_ammopouch"] = "Ammo Pouch",
					--1887
					["bm_w_boot"] = "Winchester Model 1887",
					["bm_wp_boot_body_exotic"] = "Case Hardened 1887 Reciever",
					--Claire 12G
					["bm_w_coach"] = "Remington Model 1889",

				--[[ARs]]
					--FAMAS
					["bm_w_famas"] = "Nexter FAMAS F1",
					["bm_wp_famas_b_sniper"] = "G2 Sniper Barrel",
					["bm_wp_famas_b_short"] = "G2 Commando Barrel",
					["bm_wp_famas_g_retro"] = "G1 Pistol Grip",
					--VHS
					["bm_w_vhs"] = "HS Produkt VHS-2",
					["bm_wp_vhs_b_short"] = "Short Barrel",
					["bm_wp_vhs_b_sniper"] = "Sniper Barrel",
					["bm_wp_vhs_b_silenced"] = "Suppressed Barrel",
					--JP36
					["bm_w_g36"] = "H&K G36KV",
					["bm_w_g36_k"] = "H&K G36K",
					["bm_w_g36_c"] = "H&K G36C",
					["bm_w_g36_v"] = "H&K G36V",
					["bm_w_g36_long"] = "H&K G36",
					["bm_wp_g36_fg_c"] = "G36C Handguard",
					["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard",
					["bm_wp_g36_s_kv"] = "G36KV Stock",
					["bm_wp_g36_s_sl8"] = "SL8 Stock",
					--S552
					["bm_w_s552"] = "SIG SG 552-2",
					["bm_wp_ass_s552_fg_standard_green"] = "OD Green Handguard",
					["bm_wp_ass_s552_g_standard_green"] = "OD Green Pistol Grip",
					["bm_wp_ass_s552_s_standard_green"] = "OD Green Stock",
					["bm_wp_ass_s552_fg_railed"] = "SIG Railed Handguard",
					["bm_wp_ass_s552_body_standard_black"] = "Black Receiver",
					--AMCAR
					["bm_w_amcar"] = "Colt M733 Commando",
					--BABBY AR
					["bm_w_olympic"] = "Olympic Arms K23B",
					["bm_w_x_olympic"] = "Akimbo K23Bs",

					--AUG
					["bm_w_aug"] = "Steyr AUG A2",
					["bm_w_aug_a3"] = "Steyr AUG A3",
					["bm_w_aug_f90"] = "Thales F90",
					["bm_wp_aug_fg_a3"] = "A3 Rail",
					["bm_wp_aug_body_f90"] = "Thales F90 Kit",
					--Boatgun
					["bm_w_corgi"] = "FN F2000 Tactical TR",
					--AK12
					["bm_w_ak12"] = "Kalashnikov Concern AK-12",
					--Ak5
					["bm_w_ak5"] = "Bofors Ak 5",
					["bm_w_ak5b"] = "Bofors Ak 5B",
					["bm_w_ak5c"] = "Bofors Ak 5C",
					["bm_w_ak5_fnc"] = "FN FNC",
					["bm_wp_ak5_fg_ak5c"] = "Ak 5C Handguard",
					["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard",
					["bm_wp_ak5_s_ak5b"] = "Ak 5B Stock",
					["bm_wp_ak5_s_ak5c"] = "Ak 5C Stock",
					--CAR-4
					["bm_w_m4"] = "Colt M4A1",
					["bm_w_m4_mk12"] = "Mk 12 SPR",
					["bm_w_m4_lr300"] = "ZM LR-30",
					--AK74
					["bm_w_ak74"] = "Kalashnikov Concern AKS-74",
					--805
					["bm_w_hajk"] = "CZ 805 BREN",
					["bm_wp_hajk_b_short"] = "A2 Barrel",
					--TAR-21
					["bm_w_komodo"] = "IWI X95",
					--OICW
					["bm_w_osipr"] = "XM29 OICW",

					--M16
					["bm_w_m16"] = "Colt M16A4",
					["bm_w_m16a1"] = "Colt M16A1",
					["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail",
					["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard",
					--["bm_wp_m16_s_solid"] = "M16 Stock",
					--L85
					["bm_w_l85a2"] = "BAE L85A2",
					["bm_wp_l85a2_b_long"] = "Long Barrel",
					["bm_wp_l85a2_b_short"] = "Short Barrel",
					["bm_wp_l85a2_g_worn"] = "Taped Pistol Grip",
					["bm_wp_l85a2_fg_short"] = "Daniel Defense L85 Quad Rail",
					--Krink
					["bm_w_akmsu"] = "AKMSU",
					["bm_w_x_akmsu"] = "Akimbo AKMSUs",
					["bm_wp_akmsu_fg_rail"] = "Samson K-Rail",
					--AKM
					["bm_w_akm"] = "Kalashnikov Concern AKMS",
					["bm_w_akm_gold"] = "Gold Plated AKMS",
					--Nipples
					["bm_w_tkb"] = "Tula Arms TKB-059",
					--Groza
					["bm_w_groza"] = "TsKIB SOO Groza-1",

				--[[DMRs]]
					--417
					["bm_w_contraband"] = "H&K HK417 w/ M203",
					["bm_w_contraband_m16"] = "Colt M16A1 w/ M203",
					["bm_w_contraband_mpx"] = "SIG MPX w/ M203",
					--SCAR
					["bm_w_scar"] = "FN Mk.17",
					["bm_w_scar_l"] = "FN Mk.16",
					["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension",
					["bm_wp_scar_s_sniper"] = "Mk.20 Stock",
					--FAL
					["bm_w_fal"] = "FN FAL",
					["bm_w_fal_l1a1"] = "FAL L1A1",
					["bm_w_fal_sa58"] = "DSA SA58 OSW",
					["bm_w_fal_idf"] = "IWI Romat",
					["bm_wp_fal_body_standard"] = "DSA SA58 Handguard",
					["bm_wp_fal_fg_wood"] = "Wooden FAL Handguard",
					["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard",
					["bm_wp_fal_fg_03"] = "IWI Romat Handguard",
					["bm_wp_fal_g_01"] = "Tapco FAL Pistol Grip",
					["bm_wp_fal_m_01"] = "20rnd FAL Magazine",
					["bm_wp_fal_s_01"] = "Sidefolding FAL Stock",
					["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock",
					["bm_wp_upg_vintage_fal_sc"] = "20rnd Magazine",
					--Galil
					["bm_w_galil"] = "IWI Galil ARM",
					["bm_w_galil_galatz"] = "IWI Galatz",
					["bm_w_galil_mar"] = "IWI Micro Galil",
					["bm_w_galil_556"] = "IWI Galil ARM",
					["bm_w_galil_mar_556"] = "IWI Micro Galil",
					["bm_wp_galil_fg_sniper"] = "IWI Galatz Handguard",
					["bm_wp_galil_fg_sar"] = "IWI Galil SAR Handguard",
					["bm_wp_galil_fg_mar"] = "IWI Galil MAR Handguard",
					["bm_wp_galil_fg_fab"] = "FAB Defense VFR GA Handguard",
					["bm_wp_galil_g_sniper"] = "IWI Galatz Pistol Grip",
					["bm_wp_galil_s_sniper"] = "IWI Galatz Wooden Stock",
					["bm_wp_galil_s_skeletal"] = "IWI Galil MAR Stock",
					["bm_wp_galil_s_light"] = "IWI Galatz Skeleton Stock",
					["bm_wp_galil_s_fab"] = "FAB Defense MG-CP Cheek Pad",
					--AS VAL
					["bm_w_asval"] = "Tula Arms AS \"Val\"",
					["bm_wp_asval_b_proto"] = "Prototype Barrel",
					["bm_wp_asval_s_solid"] = "VSS Stock",

					--Raifu
					["bm_w_g3"] = "H&K G3A3",
					["bm_w_g3_hk33"] = "H&K HK33",
					["bm_w_g3_sg1"] = "H&K G3SG1",
					["bm_w_g3_msg"] = "H&K MSG90",
					["bm_w_g3_psg"] = "H&K PSG-1",
					["bm_w_g3_fo3"] = "R91",
					["bm_wp_g3_b_short"] = "Short Barrel",
					["bm_wp_g3_b_sniper"] = "PSG-1 Barrel",
					["bm_wp_g3_fg_psg"] = "PSG-1 Handguard",
					["bm_wp_g3_fg_railed"] = "FAB Defense G3-RS Handguard",
					["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard",
					["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard",
					["bm_wp_g3_g_retro"] = "G3 Ergo Grip",
					["bm_wp_g3_g_sniper"] = "PSG-1 Wooden Pistol Grip",
					["bm_wp_g3_s_sniper"] = "PSG-1 Stock",
					--M308
					["bm_w_m14"] = "Springfield Armory M14 DMR",
					["bm_wp_m14_body_ebr"] = "Sage EBR Chassis",
					["bm_wp_m14_body_jae"] = "JAE 100 G3 Stock",
					["bm_wp_upg_o_m14_scopemount"] = "Sun Optics USA M14/M1A Scope Mount",
					--Shak12
					["bm_w_shak12"] = "Kalashnikov Concern ShAK-12",
					--HCAR
					["bm_w_hcar"] = "Ohio Ordnance HCAR",
					["bm_w_hcar_bar"] = "Browning BAR",
					--GARAND
					["bm_w_ching"] = "Springfield Armory M1 Garand",
					["bm_wp_ching_fg_railed"] = "Amega Mini-Scout-Mount",

				--[[SNIPERS]]
					--Titty
					["bm_w_tti"] = "Taran Tactical TR-1 AR-10",
					--QBU88
					["bm_w_qbu88"] = "Norinco QBU-88",
					--Icky Vicky
					["bm_w_victor"] = "SAINT Victor AR-15",

					--R700
					["bm_w_r700"] = "Remington Model 700P",
					--Repeater
					["bm_w_winchester1874"] = "Winchester Model 1873",
					["bm_wp_winchester_b_long"] = "Long Barrel",
					["bm_wp_winchester_b_suppressed"] = "Suppressor",
					--MSR
					["bm_w_msr"] = "Remington MSR",
					["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor",
					["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver",
					--Scunt
					["bm_w_scout"] = "Steyr Scout",
					--AWP
					["bm_w_awp"] = "Accuracy International AW-F",
					["bm_wp_awp_stock_lightweight"] = "AT308 Stock",

					--Drako
					["bm_w_siltstone"] = "Kalashnikov Concern SVD",
					--WA2000
					["bm_w_wa2000"] = "Walther WA2000",
					["bm_wp_wa2000_g_walnut"] = "Walnut Furniture",
					["bm_wp_wa2000_g_stealth"] = "Black Furniture",
					["bm_wp_wa2000_g_light"] = "Lightweight Furniture",

					--SBL
					["bm_w_sbl"] = "Marlin Model 1895SBL",
					--G2
					["bm_w_contender"] = "Thompson Center G2 Contender",
					["bm_wp_contender_grip_m4"] = "Choate M4 Adapter Grip",
					--Moist Nugget
					["bm_w_mosin"] = "Mosin Nagant M91/30",
					["bm_wp_mosin_b_sniper"] = "Nagant Suppressor",
					["bm_wp_mosin_body_conceal"] = "Black Polymer Stock",
					--Model 70
					["bm_w_model70"] = "Winchester Model 70",
					--R93
					["bm_w_r93"] = "Blaser R93 Tactical 2",
					["bm_wp_r93_b_suppressed"] = "SilencerCo Harvester 338 Suppressor",
					["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock",
					--SRS
					["bm_w_desertfox"] = "DTA Stealth Recon Scout",
					--Flintlock
					["bm_w_bessy"] = "Land Pattern Musket",

					--M95
					["bm_w_m95"] = "Barrett M95",
					["bm_wp_m95_b_barrel_long"] = "Long Barrel w/AW50F Muzzle Brake",

					--PD3 Lynx
					["bm_w_pd3_lynx"] = "SERO Gepard M6",

				--[[SPECIALS]]
					--GL40
					["bm_w_gre_m79"] = "Springfield Armory M79",
					--3GL
					["bm_w_ms3gl"] = "Metal Storm 3GL",
					--PIGLET/M32
					["bm_w_m32"] = "Milkor MGL",
					--China Puff
					["bm_w_china"] = "NAWS China Lake",
					--Compact 40mm
					["bm_w_slap"] = "H&K M320",
					--Arbiter
					["bm_w_arbiter"] = "ATK XM25",
					--Wat is flash haow do u do it? haow 2 flash cartoonz? ADOEB FLASH... adoeb falsh... CS... 6.... a dobe.... a dobe
					["bm_w_ray"] = "Northrop M202 FLASH",
					--RPG
					["bm_w_rpg7"] = "Bazalt RPG-7",

					["bm_w_arblast"] = "Arbalest",
					["bm_w_frankish"] = "Frankish Bow",
					["bm_w_hunter"] = "Avalanche CB1-50 Pistol Grip Crossbow",
					["bm_w_elastic"] = "Hoyt Carbon Spyder ZT 30 Bow",
					["bm_wp_elastic_body_tactic"] = "Hoyt Ignite Riser",

				--Attachments

					--Gadgets
						["bm_wp_upg_fl_pis_tlr1"] = "Streamlight TLR-1 Flashlight",
						["bm_wp_upg_fl_pis_laser"] = "Aim Sports LH002 Laser Sight",
						["bm_wp_upg_fl_x400v"] = "SureFire X400V-IRC Laser Light",
						["bm_wp_upg_fl_crimson"] = "Crimson Trace CMR-201 Laser Sight",
						["bm_wp_upg_fl_pis_m3x"] = "Insight Technology M3X Flashlight",
						["bm_wp_upg_fl_pis_perst"] = "ZenitCo Perst-4M Laser Sight",

						["bm_wp_upg_fl_ass_smg_sho_surefire"] = "SureFire Scout Flashlight",
						["bm_wp_upg_fl_ass_laser"] = "Offset Mount Laser Sight",
						["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "Insight Technology AN/PEQ-5 Laser Sight",
						["bm_wp_upg_fl_ass_utg"] = "UTG P38 Laser Light",
						["bm_wp_upg_fl_ass_peq15"] = "Insight Technology AN/PEQ-15 Laser Light",
						["bm_wp_upg_fl_dbal_laser"] = "Steiner DBAL-PL Laser Sight",

					--Muzzle Devices
						["bm_wp_upg_ns_meatgrinder"] = "Standoff Muzzle Device",
						["bm_wp_upg_ns_typhoon"] = "Omega Defense Muzzle Brake", --Internal name implies it's the Beretta TYPHOON but it resembles Omega Defense's more.
						["bm_wp_upg_pis_ns_flash"] = "CCF Titanium Flash Suppressor",

						["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor",
						["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor", --Close enough... it's sectioned similarly enough for me to just name it this
						["bm_wp_upg_ns_pis_large"] = "SilencerCo Osprey Suppressor",
						["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor",
						["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor",
						["bm_wp_upg_ns_pis_jungle"] = "FX-HND Suppressor",
						["bm_wp_upg_ns_pis_putnik"] = "RS Putnik Suppressor",
						["bm_wp_upg_ns_ass_filter"] = "Oil Filter",

						["bm_wp_upg_ns_ass_smg_small"] = "GemTech HALO Suppressor", --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
						["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor",
						["bm_wp_upg_ns_ass_smg_large"] = "GOV MOD 1 Suppressor", --Couldn't find an IRL equivalent, name is just what it says on the tin, literally
						["bm_wp_upg_ak_ns_tgp"] = "TGP-A Suppressor",
						["bm_wp_victor_ns_omega"] = "SilencerCo Omega 36M Suppressor",
						["bm_wp_kacchainsaw_suppressor"] = "KAC QDSS NT4 Suppressor",

						["bm_wp_ultima_ns_comp"] = "Hi-Tech Howitzer70 Muzzle Brake",
						["bm_wp_upg_ns_shot_shark"] = "Tromix Shark Breaching Brake",
						["bm_wp_upg_shot_ns_king"] = "King Armory KA-1212 Breaching Brake",
						["bm_wp_upg_ns_shot_thick"] = "Shotgun Suppressor",
						["bm_wp_upg_ns_sho_salvo_large"] = "SilencerCo Salvo 12 Suppressor",

						["bm_wp_upg_ns_ass_smg_stubby"] = "VFC BM4 Flash Hider", --airsoft part AFAIK, lol (VFC Baby M4)
						["bm_wp_upg_ns_ass_smg_tank"] = "G&P BM Compensator", --airsoft part AFAIK, lol (G&P Baby Monster) also the little "sight" post on it is actually for an AR15 gas tube, lmao
						["bm_wp_upg_ns_ass_smg_firepig"] = "Noveske KX3 Compensator",
						["bm_wp_upg_ass_ns_jprifles"] = "JPE Bennie Cooley Muzzle Brake",
						["bm_wp_upg_ass_ns_linear"] = "KIES Blast Master Linear Compensator",
						["bm_wp_upg_ass_ns_surefire"] = "SureFire MBK Muzzle Brake",
						["bm_wp_ns_battle"] = "Battlecomp 2.0 Compensator",
						["bm_wp_ak_upg_ns_zenitco"] = "ZenitCo DTK-1 Compensator",
						["bm_wp_upg_ns_ass_smg_v6"] = "Kel-Tec V6 Compensator",
						["bm_wp_kacchainsaw_muzzle"] = "KAC QDC MAMS Muzzle Brake",
						["bm_wp_hk51b_ns_jcomp"] = "JCOMP Gen2 Compensator",
						["bm_wp_awp_ns_muzzle"] = "Accuracy International Muzzle Brake",


					--Glock Parts
						["bm_wp_g18c_m_mag_33rnd"] = "Extended Glock Magazine",
						["bm_wp_g18c_g_ergo"] = "Hogue Handall Grip Sleeve",
						["bm_wp_pis_g_laser"] = "Crimson Trace Laser Grip",
						["bm_wp_pis_g_beavertail"] = "Beavertail Grip Extension",

					--AK parts
						["bm_wp_upg_ak_fg_krebs"] = "Krebs UFM Keymod System Handguard",
						["bm_wp_upg_ak_fg_trax"] = "Strike Industries TRAX Handguard",
						["bm_wp_upg_ak_g_rk3"] = "ZenitCo PK-3 Pistol Grip",
						["bm_wp_upg_ak_fg_zenit"] = "ZenitCo Handguard",
						["bm_wp_upg_o_ak_scopemount"] = "K-VAR KV-04S Optic Mount",
						["bm_wp_upg_ak_m_uspalm"] = "30rnd US PALM AK30 Magazine",
						["bm_wp_upg_ns_ass_pbs1"] = "PBS-1 Suppressor",
						["bm_wp_upg_ass_ak_b_zastava"] = "Zastava M76 Barrel",
						["bm_wp_upg_ak_b_draco"] = "Draco Pistol Barrel",
						["bm_wp_upg_ak_b_ak105"] = "AK-105 Barrel",
						["bm_wp_upg_ak_ns_jmac"] = "JMac Customs MTC-1",
						["bm_wp_upg_ak_m_quad"] = "60rnd KC Magazine",
						["bm_wp_ak_m_drum"] = "75rnd AK Drum",
						["bm_wp_ak_fg_combo2"] = "Ultimak AK Optic Mount",
						["bm_wp_ak_fg_combo3"] = "Ultimak AK Modular Rail Forend System",
						["bm_wp_upg_ak_fg_tapco"] = "Tapco Intrafuse Handguard",
						["bm_wp_upg_fg_midwest"] = "Midwest Industries Quad Rail",
						["bm_wp_upg_ak_g_hgrip"] = "Hogue OverMolded AK Pistol Grip",
						["bm_wp_upg_ak_g_pgrip"] = "US PALM Enhanced Pistol Grip",
						["bm_wp_ak_s_folding"] = "Underfolding AK Stock",
						["bm_wp_ak_s_skfoldable"] = "Sidefolding AK Stock",
						["bm_wp_ak_s_psl"] = "PSL Thumbhole Stock",
						["bm_wp_ak_upper_zenitco"] = "ZenitCo B-33 Dust Cover",
						["bm_wp_ak_upg_fg_zenitco"] = "ZenitCo Sport-1 Kit",
						["bm_wp_ak_upg_dh_zenitco"] = "ZenitCo RP-5 Charging Handle",
						["wpn_fps_upg_ak_g_gradus"] = "FAB Defense Gradus Ergo Grip",
						["wpn_fps_upg_ak_g_edg"] = "Evolution Defense Textured Grip",
						["wpn_fps_upg_ak_g_rk9"] = "ZenitCo RK-9 Grip",
						["bm_wp_ak_upg_s_zenitco"] = "ZenitCo PT-1 Telescopic Stock",

					--Sights
						["bm_wp_upg_o_marksmansight_rear_desc"] = "Meprolight Tru-Dot Adjustable Sight Set",
						["bm_wp_upg_o_rmr"] = "Trijicon RMR Reflex Sight",

						["bm_wp_upg_o_docter"] = "IRONDOT w/Docter Sight II Plus Reflex Sight",
						["bm_wp_upg_o_reflex"] = "Reflex Sight",
						["bm_wp_upg_o_cmore"] = "C-More Railway Reflex Sight",
						["bm_wp_upg_o_rx01"] = "Trijicon RX01 Reflex Sight",
						["bm_wp_upg_o_rx30"] = "Trijicon RX30 Reflex Sight",

						["bm_wp_upg_o_cs"] = "Aimpoint CS Red Dot Sight",
						["bm_wp_upg_o_aimpoint"] = "Aimpoint PRO Red Dot Sight",
						["bm_wp_upg_o_t1micro"] = "Aimpoint Micro T-1 Red Dot Sight",
						["bm_wp_upg_o_tf90"] = "Tech Force TF90 Red Dot Sight",

						["bm_wp_upg_o_fc1"] = "DI Optical FC1 Prismatic Red Dot Sight",
						["bm_wp_upg_o_eotech"] = "EOTech 553 Holographic Sight",
						["bm_wp_upg_o_eotech_xps"] = "EOTech EXPS3 Holographic Sight",
						["bm_wp_upg_o_uh"] = "AMG UH-1 Holographic Sight",

						["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope",
						["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope",
						["bm_wp_upg_o_poe"] = "BelOMO PO4x24P Scope",
						["bm_wp_upg_o_bmg"] = "Trijicon 6x48 Scope",

						["bm_wp_upg_o_spot"] = "NcStar ADO 3x42 Scope w/Rangefinder",

						["bm_wp_upg_o_atibal"] = "Atibal MROC 3x32 Scope  w/Micro Reflex",
						["bm_wpn_fps_upg_o_hamr"] = "Leupold Mk. 4 HAMR 4x24 Scope",

						--"Schmidt & Bender 1-8x24 PM Short Dot"
						["bm_wp_upg_o_shortdot"] = "Schmidt & Bender 1-8x24 PM Short Dot",
						["bm_wp_upg_o_shortdot_dmc"] = "Schmidt & Bender 1-8x24 PM Short Dot",

						["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 w/BORS",
						["bm_wp_upg_o_box"] = "Pulsar Digisight LRF N960 NV Scope",

						["bm_wp_upg_o_northtac"] = "Northtac Assault Optic 1-4x28 w/Micro Reflex",
						["bm_wp_uupg_o_schmidt"] = "Schmidt & Bender 5-45x56 PM II High Power",

						["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights",
						["bm_wpn_fps_upg_o_45rds"] = "Leupold Deltapoint Pro Angled RDS",
						["bm_wpn_fps_upg_o_45rds_v2"] = "Aimpoint Micro T-1 Red Dot Sight",

						["bm_wpn_fps_upg_o_xpsg33_magnifier"] = "Aimpoint 3XMag Magnifier",
						["bm_wpn_fps_upg_o_sig"] = "SIG Juliet3 Magnifier",

						["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights",

					--Vertical Grips
						["bm_wp_upg_vg_tac"] = "Knights Armament Co. VFG",
						["bm_wp_upg_vg_stubby"] = "Tango Down QD Stubby VFG",
						["bm_wp_upg_vg_afg"] = "Magpul AFG 2",

					--STANAG compatible mags
						["bm_wp_upg_vintage_sc"] = "20rnd STANAG Magazine",
						["bm_wp_m4_m_pmag"] = "30rnd Magpul PMAG GEN1 Magazine",
						["bm_wp_l85a2_m_emag"] = "30rnd Magpul EMAG Magazine",
						["bm_wp_upg_m4_m_quad"] = "60rnd SureFire Magazine",
						["bm_wp_m4_m_drum"] = "100rnd Beta-C Dual Drum",
						["bm_wp_upg_m4_m_l5"] = "30rnd Lancer Systems L5 AW Magazine",
						["bm_wp_m4_uupg_m_strike"] = "33rnd Strike Industries Magazine",
						["bm_wp_m4_m_quick"] = "Magpul Magazine Assist",

					--AR15 parts
						["bm_wp_m4_uupg_b_sd"] = "Suppressed Barrel",
						["bm_wp_upg_ass_m4_b_beowulf"] = "Heavy Barrel",

						["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver",
						["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "2A-Arm BALIOS Upper Receiver",
						["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 Upper Receiver",
						["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 Lower Receiver",
						["bm_wp_m4_upper_radian"] = "Radian Model 1 Upper Receiver",
						["bm_wp_m4_lower_radian"] = "Radian A-DAC 15 Lower Receiver",

						["bm_wp_m4_uupg_fg_radian"] = "Radian Model 1 Handguard",
						["bm_wp_upg_fg_jp"] = "JPE Modular Handguard",
						["bm_wp_m4_uupg_fg_lr300"] = "LR300 Handguard",
						["bm_wp_upg_fg_smr"] = "Geissele Super Modular Rail",
						["bm_wp_upg_smg_olympic_fg_lr300"] = "Short LR300 Handguard",
						["bm_wp_upg_ass_m16_fg_stag"] = "Stag Arms Model 8T Handguard",
						["bm_wp_upg_ass_m4_fg_moe"] = "Magpul MOE SL Handguard",
						["bm_wp_upg_ass_m4_fg_lvoa"] = "War Sport LVOA Handguard",

						["bm_wp_m4_s_standard"] = "Bushmaster LE Stock",
						["bm_wp_m4_s_pts"] = "Magpul PTS Stock",
						["bm_wp_m4_uupg_s_fold"] = "LR300 Folding Stock",
						["bm_wp_upg_m4_s_crane"] = "NSWC Crane Stock",
						["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/Cheek Pad",
						["bm_wp_upg_m4_s_ubr"] = "Magpul UBR Stock",
						["bm_wp_tti_s_vltor"] = "VLTOR E-MOD Stock",
						["bm_wp_victor_s_mod0"] = "BCM MOD 0 Stock",
						["bm_wp_sko12_stock"] = "Standard Mfg AR Stock",
						["bm_wp_m4_uupg_s_zulu"] = "ODIN Works Zulu 2.0 Stock",
						["bm_wp_olympic_s_short"] = "Rock River Arms Pistol Buffer Tube",

						["bm_wp_m4_g_ergo"] = "Command Arms UPG16 Pistol Grip",
						["bm_wp_m4_g_sniper"] = "PSG Style Pistol Grip",
						["bm_wp_upg_m4_g_hgrip"] = "Houge Rubber Ergo Grip",
						["bm_wp_upg_m4_g_mgrip"] = "Magpul MOE-K Pistol Grip",
						["bm_wp_tti_g_grippy"] = "Houge OverMolded Grip",
						["bm_wp_victor_g_mod3"] = "BCM MOD 3 Grip",
						["bm_wp_sko12_grip"] = "Standard Mfg AR Grip",
						["bm_wp_upg_g_m4_surgeon"] = "Tactical Dynamics Skeletonized Pistol Grip",
						["bm_wp_m4_g_billet"] = "JL Billet AR Grip",

					["bm_wp_upg_lmg_lionbipod"] = "Bipod",

				--[[MELEE]]
					["bm_melee_kabar"] = "USMC KA-BAR",
					["bm_melee_kampfmesser"] = "KM 2000",
					["bm_melee_gerber"] = "Gerber DMF Folder",
					["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk",
					["bm_melee_becker"] = "KA-BAR Becker Tac Tool",
					["bm_melee_baton"] = "ASP Friction Loc Baton",
					["bm_melee_shovel"] = "K.L.A.S.",
					["bm_melee_baseballbat"] = "\"Lucille\"",
					["bm_melee_bayonet"] = "AKM Type II Bayonet",
					["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet",
					["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife",
					["bm_melee_dingdong"] = "Gerber Ding Dong Breaching Tool",
					["bm_melee_cleaver"] = "Cleaver",
					["bm_melee_kabar_tanto"] = "KA-BAR Tanto",
					["bm_melee_chef"] = "Chef Knife",
					["bm_melee_fairbair"] = "Fairbairn-Sykes Fighting Knife",
					["bm_melee_model24"] = "Model 24 Stielhandgranate",
					["bm_melee_hammer"] = "Jacket's Hammer",
					["bm_melee_meat_cleaver"] = "Dragan's Cleaver",
					["bm_melee_poker"] = "Firewood Poker",
					["bm_melee_tenderizer"] = "Meat Tenderizer",
					["bm_melee_fork"] = "BBQ Fork",
					["bm_melee_mining_pick"] = "Pickaxe",
					["bm_melee_bowie"] = "Bowie Knife",
					["bm_melee_branding_iron"] = "Branding Iron",
					["bm_melee_oldbaton"] = "Nightstick",
					["bm_melee_detector"] = "Garrett Handheld Metal Detector",
					["bm_melee_taser"] = "ZAP Stun Baton",
					["bm_melee_cqc"] = "Kunai",
					["bm_melee_twins"] = "Sais",
					["bm_melee_tiger"] = "Tekko-Kagi",
					["bm_melee_pugio"] = "Extrema Ratio Pugio SE",
					["bm_melee_gator"] = "Gerber Gator Machete Pro",
					["bm_melee_scoutknife"] = "Morakniv Classic Scout 39",
					["bm_melee_shawn"] = "Antique Sheep Shears",
					["bm_melee_stick"] = "Shepherd's Crook",
					["bm_melee_nin"] = "Paslode IM90i Nailgun",
					["bm_melee_ballistic"] = "Ballistic Knives",
					["bm_melee_wing"] = "Benchmade Model 42 Balisong",
					["bm_melee_cs"] = "Homelite Super 2 Chainsaw",
					["bm_melee_brick"] = "Motorola DynaTAC 8000X",
					["bm_melee_sword"] = "Pencil",
					["bm_melee_oxide"] = "UVSR Taiga-1",
					["bm_melee_selfie"] = "PolarPro PowerPole GoPro Extension",
					["bm_melee_twins"] = "Shureido Sai",

				--[[THROWABLES]]
					["bm_grenade_frag"] = "M67 Fragmentation Grenade",
					["bm_grenade_frag_com"] = "M67 Fragmentation Grenade - OVERKILL Model",
					["bm_wpn_prj_hur"] = "Kit Rae Aircobra Throwing Axe",
					["bm_wpn_prj_target"] = "Blazing Arrow Ninja Throwing Knife",
			})
		end
	end
  if not easterless then
	local twirl = math.rand(1)
	local shalashaska = 0.06
	if Month == "4" and Day == "1" then
		shalashaska = 1
	end
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
			["bm_wp_upg_suppressor_boss"] = "\"CRAB BATTLE!!!\"\n\n#{skill_color}#Заглушает## оружие и #{risk}#уменьшает шанс того, что противники увернутся от вашего огня.####"
		})
	end

	 local stalker = math.rand(1)
	 local anekdot = 0.02
	 if Month == "4" and Day == "1" then
		anekdot = 1
	 end
	 if stalker <= anekdot then
		 LocalizationManager:add_localized_strings({
			-- Иди своей дорогой, сталкер
			["bm_w_striker"] = "Отбойник", -- Ну в параше не прям Protecta используется, но визуально похоже
			["bm_w_groza"] = "Гром С-14",
			  ["bm_groza_sc_desc_pc"] = "Автоматно-гранатометный комплекс — очень удачный в условиях Зоны вариант штурмовой винтовки: компактный, надежный, и в то же время универсальный и мощный. «Гром» очень любят военные сталкеры.\n\nНажмите #{skill_color}#$BTN_BIPOD## чтобы переключиться на подствольный гранатомет.",
			["bm_w_asval"] = "СА «ЛАВИНА»",
			  ["bm_asval_sc_desc"] = "Создан на базе бесшумной снайперской винтовки «Винторез», от которой отличается складным прикладом, возможностью вести огонь очередями, а также более емким магазином. Изначально предназначался для применения спецподразделениями в условиях атаки, требующей бесшумной и беспламенной стрельбы.\n\nОбладает #{skill_color}#встроенным глушителем##, #{skill_color}#наносит 25% урона через броню и может пробивать врагов.##",
			["bm_w_corgi"] = "ФТ-200М",
			["bm_w_g36"] = "ГП37",
			  ["bm_g36_sc_desc"] = "Штурмовая винтовка немецкого производства, представляющая собой первоклассный образец современного оружия — легкого, надежного и эргономичного.",
			["bm_w_p99"] = "Волкер-П9м",
			["bm_w_usp"] = "УДП «Компакт»",
			  ["bm_usp_sc_desc"] = "Солидный ствол. Немецкое качество и надежность. Компактное оружие ближнего боя. Пользуется особой популярностью среди ветеранов Зоны.",
			["bm_w_mp5"] = "Гадюка-5",
			  ["bm_mp5_sc_desc"] = "Одно из самых лучших в классе пистолетов-пулеметов оружие. В течение последних десятилетий XX века был принят на вооружение спецподразделений армии и полиции во многих странах мира. С началом постепенной его замены более современными моделями стал часто появляться на черном рынке, откуда массово попал и в Зону.",
			["bm_w_l85a2"] = "ИЛ86",
			  ["bm_l85a2_sc_desc"] = "После того, как в армии Соединенного Королевства эта винтовка была заменена на более современную, она в большом количестве всплыла на черном рынке, а затем и в Зоне. Главными достоинствами данного оружия являются штатный 4-кратный оптический прицел и высокая точность первого выстрела. При стрельбе очередями точность боя резко падает, а основные механизмы демонстрируют недостаточную надежность.",
			["bm_w_spas12"] = "СПСА-14",
			  ["bm_spas12_sc_desc"] = "Гладкоствольное ружье СПСА-14 было разработано в конце 1970-х в качестве универсального боевого оружия для полиции и штурмовых подразделений армии. Данное оружие отличают высокая надежность и гибкость применения; с другой стороны, оно довольно массивно, сложно в устройстве и дорого. Пожалуй, лучшего ствола для ближнего боя в Зоне не найти.",
			["bm_w_colt_1911"] = "Кора-919",
			  ["bm_1911_sc_desc"] = "Классический «Кольт», с честью прошедший все вооруженные конфликты XX века и уверенно вошедший в новое столетие. Невысокая емкость магазина в определенной степени компенсируется использованием мощного патрона.",
			["bm_w_m32"] = "Бульдог-6", -- да я знаю, что Бульдог-6 основан на РГ-6
			  ["bm_m32_sc_desc"] = "Гранатомет револьверного типа. Иногда просто незаменим, в частности при очистке больших площадей от мутантов, нападении на охраняемые стационарные объекты, в бою с особо живучими тварями.",
			["bm_w_b92fs"] = "Марта",
			  ["bm_b92fs_sc_desc"] = "Пистолеты этой серии имеют во всем мире репутацию надежного, хотя и несколько громоздкого оружия, и состоят на вооружении армейских и полицейских формирований многих стран. Не менее популярны и у преступников благодаря мощному патрону и емкому магазину. Как правило, в Зону попадают не самые новые модели.",
			["bm_w_ppk"] = "ПМм",
			  ["bm_ppk_sc_desc"] = "Наиболее распространенный в Зоне пистолет — наследие советской эпохи. Достаточно надежен и дешев, но отличается невысокой емкостью магазина при недостаточной мощности и неудовлетворительной кучности патрона. Основное оружие сталкера-новичка.",
			["bm_w_rpg7"] = "РПГ-7у",
			["bm_w_siltstone"] = "СВДм-2",
			  ["bm_siltstone_sc_desc"] = "Широко использовалась во всех боевых операциях, проводившихся советской армией с начала 1960-х. Зарекомендовала себя как исключительно надежное и удобное в обращении оружие.\n\n#{skill_color}#Может пробивать броню, врагов, щиты и тонкие стены.##",
			["bm_w_p226"] = "СИП-т М200",
			  ["bm_p226_sc_desc"] = "Модель, разработанная еще в 1975 году, но до сих пор популярная во всем мире. Магазин недостаточно емкий, зато механизм надежен, как швейцарские часы; вторым плюсом является использование мощного патрона.",
			["bm_w_hpb"] = "ХПСС-1м",
			["bm_w_b682"] = "Охотничье ружье",
			  ["bm_b682_sc_desc"] = "Широко распространенное охотничье ружье-«вертикалка» — благодаря достаточной точности и хорошему останавливающему действию — обеспечивает более надежную защиту от мутантов, чем пистолет. Очень дешево и доступно в сравнении с большинством видов оружия, поэтому активно применяется новичками и бандитами как на окраинах, так и в Центре Зоны.",
			["bm_w_deagle"] = "Черный ястреб",
			  ["bm_deagle_sc_desc"] = "Настоящая «карманная пушка» — большая, тяжелая и обладающая чрезвычайно высокой убойной силой. Из-за цены и габаритов особого распространения в Зоне не получила.\n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
			["bm_w_ak74"] = "АКМ-74/2",
			  ["bm_ak74_sc_desc"] = "Автомат складной, образца 1974 года под патрон 5,45 × 39. Представляет собой простое и надежное оружие, хотя дешевизна в производстве несколько сказалась на удобстве использования и точности боя. В Зоне это основное оружие военных, сталкеров и многих одиночек.",
			["bm_w_akmsu"] = "АКМ-74/2У",
			  ["bm_akmsu_sc_desc"] = "По своим габаритам и массе близок к пистолетам-пулеметам, однако устройство механизма почти полностью идентично АКМ-74/2. Малые габариты оружия позволяют успешно использовать его в условиях городской застройки и в стесненных условиях, а пробивающее действие пули довольно велико.",


			-- типо мемные
			["bm_w_saiga"] = "Сайга",
			  ["bm_saiga_sc_desc"] = " - Баффните #{stats_positive}#сайгу!## \n - Ты как #{stats_negative}#ижму## назвал?",
			["bm_w_m4"] = "Кар-карыч",
			["bm_w_ak12"] = "Калак-12",
			  ["bm_flint_sc_desc"] = "С затворной задержкой как у М-16. #{skill_color}#Умеет стрелять очередями по 2## и обладает кризисом личности.",
			["bm_w_p90"] = "Петух",
			["bm_w_sko12"] = "WD 40",
			["bm_w_x_akmsu"] = "KALAWIKI",
			  ["bm_x_akmsu_sc_desc"] = "После взятия иных в руки - у Вас резко появилось желание писать транслитом и поедать сумки с патронами, предварительно кинув под нее молотов.",
			["bm_w_ching"] = "\"Золотой\" Галант",
			  ["bm_galant_sc_desc"] = "Тот самый легендарный Галант прямиком из игры #{important_1}#RAID: WW2##\n\n#{skill_color}#Наносит 50% урона через броню и может пробивать врагов и тонкие стены.##",
			["bm_w_m60"] = "Свинка Пеппа",
			["bm_w_x_deagle"] = "Лупа и Пупа",
			  ["bm_x_deagle_sc_desc"] = "Все перепутали... \n\n#{skill_color}#Наносит 50% урона через броню и пробивает врагов.##",
			["bm_w_saw"] = "Болгарка",
			  ["bm_ap_saw_sc_desc"] = "Легендарный инструмент в узких кругах Crime.Net, благодаря которому было распилено не один десяток голов цивилов.\n\n#{skill_color}#Прорезает броню.##",
			["bm_w_x_basset"] = "Акимбо Грибы",
			-- Я НЕ СМОТРЮ АНИМЕ, У МЕНЯ ДЕД - МУСУЛЬМАНИН
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

		 })
	 end

	-- local big = math.rand(1)
	-- local pistol = 0.02
	-- if big <= pistol then
		-- LocalizationManager:add_localized_strings({
			-- ["bm_w_deagle"] = "Big Pistol",
			-- ["bm_w_m16"] = "is that a clarion",
			-- ["bm_m16_sc_desc"] = "I'll give you a clip so you can do some damage",
			-- ["bm_w_x_type54"] = "The twin crosskills",
		-- })
	--end
	end

end)


local r = tweak_data.levels.ai_groups.russia --LevelsTweakData.LevelType.Russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
local z = tweak_data.levels.ai_groups.zombie --LevelsTweakData.LevelType.Zombie
local f = tweak_data.levels.ai_groups.federales
local o = tweak_data.levels.ai_groups.omnia
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "ИДЕТ ШТУРМ НАЕМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЕMHИKOB"
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

		["menu_pro_warning"] = "Режим PRO JOB: При провале, контракт будет отменен.\nПод конец ограбления может начаться Точка Невозврата, во время которой появятся более опасные противники.\nПрохождение в режиме Pro Job дает 25% бонус к деньгам и опыту.",

		["menu_asset_lock_additional_assets_pro"] = "НЕДОСТУПНО В РЕЖИМЕ PRO-JOB!",
		["menu_asset_buy_all_req_skill"] = "##NOT AVAILABLE!##",

		["cn_menu_contract_daypay_header"] = "Дневная плата:",
		["cn_menu_contract_jobpay_header"] = "Плата за контракт:",
		["victory_stage_cash_summary_name_job"] = "Вы получили $stage_cash за прохождение дня, а также дополнительные $job_cash за прохождение контракта.",

		["debug_interact_grenade_crate_take_grenades"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕТАТЕЛЬНОЕ ОРУЖИЕ",
		["debug_interact_bodybags_bag_take_bodybag"] = "УДЕРЖИВАЙТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕШКИ ДЛЯ ТРУПОВ И СТЯЖКИ",

	    ["menu_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit"] = "Кейс с метательным оружием",
		["debug_equipment_armor_kit"] = "Кейс с метательным оружием",
		["bm_equipment_armor_kit_desc"] = "Чтобы использовать кейс с метательным оружием, вам нужно установить его, зажав #{skill_color}#$BTN_USE_ITEM.##. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием #{skill_color}#$BTN_INTERACT##, чтобы восполнить запас метательного оружия. Он может быть использован #{skill_color}#3## раза.\n\nВы можете увидеть, сколько еще раз можно использовать кейс, посмотрев на него.\n\nКейс с метательным оружием это скрытная вещь, используемая солдатами и наемниками для переноски особого оружия на тяжелый случай.",
		["bm_equipment_armor_kit_desc_short"] = "Чтобы использовать кейс с метательным оружием, вам нужно установить его, зажав #{skill_color}#$BTN_USE_ITEM.##. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием #{skill_color}#$BTN_INTERACT##, чтобы восполнить запас метательного оружия. Он может быть использован #{skill_color}#3## раза.\n\nВы можете увидеть, сколько еще раз можно использовать кейс, посмотрев на него.",
		--Ordanance Bag
		["bm_equipment_grenade_crate"] = "Сумка с гранатами",
		["bm_equipment_grenade_crate_desc"] = "Чтобы использовать сумку с гранатами, вам нужно установить ее, зажав $BTN_USE_ITEM. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием $BTN_INTERACT, чтобы восполнить #{skill_color}#25%## запаса патронов и #{skill_color}#1## метательное оружие. Она может быть использована #{skill_color}#4## раза.\n\nВы можете увидеть, сколько еще раз можно использовать сумку, посмотрев на нее.\n\nСумка с гранатами используется оперативниками для транспортировки взрывчатки на место боевых действий.",
		["bm_equipment_grenade_crate_desc_short"] = "Чтобы использовать сумку с гранатами, вам нужно установить ее, зажав $BTN_USE_ITEM. После установки его нельзя переместить, но можно использовать вам или вашим напарникам, нажатием $BTN_INTERACT, чтобы восполнить #{skill_color}#25%## запаса патронов и #{skill_color}#1## метательное оружие. Она может быть использована #{skill_color}#4## раза.\n\nВы можете увидеть, сколько еще раз можно использовать сумку, посмотрев на нее.",
		--Trip Mine
		["bm_equipment_trip_mine_desc"] = "Чтобы использовать мину, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.## Лазер можно переключать между режимами детонации и сенсора, нажав #{skill_color}#$BTN_INTERACT.##\n\nЧтобы использовать кумулятивные заряды, их нужно установить, используя #{skill_color}#$BTN_INTERACT.## Когда нужное количество зарядов установлено, они детонируют через несколько секунд.\n\nМины - это растяжки, которые уничтожат или нанесут существенный вред врагам, которые пересекут луч. Кумулятивные заряды используются для вскрытия дверей и сейфов. Оба - отличное дополнение при любой боевой ситуации.",
		["bm_equipment_trip_mine_desc_short"] = "Чтобы использовать мину, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.## Лазер можно переключать между режимами детонации и сенсора, нажав #{skill_color}#$BTN_INTERACT.##\n\nЧтобы использовать кумулятивные заряды, их нужно установить, используя #{skill_color}#$BTN_INTERACT.## Когда нужное количество зарядов установлено, они детонируют через несколько секунд.",
		--Ammo Bag
		["bm_equipment_ammo_bag_desc"] = "Чтобы использовать сумку с патронами, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.## После установки ее нельзя переместить, но можно использовать, удерживая $BTN_INTERACT, чтобы восполнить запас патронов.\n\nОна восстанавливает полный запас патронов #{skill_color}#$deployable_uses## раз(а); остаток запаса можно определить по виду сумки.\n\nСумка с патронами - портативная часть экипировки, позволяющая бойцам легко переносить большие запасы амуниции.",
		["bm_equipment_ammo_bag_desc_short"] = "Чтобы использовать сумку с патронами, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.## После установки ее нельзя переместить, но можно использовать, удерживая $BTN_INTERACT, чтобы восполнить запас патронов.\n\nОна восстанавливает полный запас патронов #{skill_color}#$deployable_uses## раз(а); остаток запаса можно определить по виду сумки.",
		--ECM Jammer
		["bm_equipment_ecm_jammer_desc"] = "Чтобы использовать генератор помех, вам нужно установить его, удерживая #{skill_color}#$BTN_USE_ITEM##. После установки его нельзя переместить. Он активируется на #{skill_color}#$deployable_uses## секунд.\n\nВы можете переключить режим работы генератора помех при взаимодействии с ним. В этом случае, генератор помех будет оглушать врагов в радиусе #{skill_color}#25## метров. Первые помехи имеют #{skill_color}#100%## шанс оглушить врага, затем каждые #{skill_color}#1.2## секунды помех имеют #{skill_color}#60%## шанс на оглушение. Помехи длятся #{skill_color}#$deployable_uses## секунд, и перезаряжаются через #{skill_color}#4## минуты.\n\nГенераторы помех могут взламывать банкоматы и ненадолго отключать электронные устройства - телефоны, камеры и прочие системы безопасности.",
		["bm_equipment_ecm_jammer_desc_short"] = "Чтобы использовать генератор помех, вам нужно установить его, удерживая #{skill_color}#$BTN_USE_ITEM##. После установки его нельзя переместить. Он активируется на #{skill_color}#$deployable_uses## секунд.\n\nВы можете переключить режим работы генератора помех при взаимодействии с ним. В этом случае, генератор помех будет оглушать врагов в радиусе #{skill_color}#25## метров. Первые помехи имеют #{skill_color}#100%## шанс оглушить врага, затем каждые #{skill_color}#1.2## секунды помех имеют #{skill_color}#60%## шанс на оглушение. Помехи длятся #{skill_color}#$deployable_uses## секунд, и перезаряжаются через #{skill_color}#4## минуты.",
		--FAQ U
		["bm_equipment_first_aid_kit_desc"] = "Удерживайте кнопку #{skill_color}#$BTN_USE_ITEM##, чтобы установить аптечку. Ее нельзя переместить после установки, но можно использовать, зажав кнопку #{skill_color}#$BTN_INTERACT##, чтобы восстановить #{skill_color}#150## здоровья. Аптечку первой помощи можно использовать только #{skill_color}#1## раз.\n\nАптечка первой помощи - небольшой ассортимент лечебных средств, используемый в экстренных ситуациях.",
        ["bm_equipment_first_aid_kit_desc_short"] = "Удерживайте кнопку #{skill_color}#$BTN_USE_ITEM##, чтобы установить аптечку. Ее нельзя переместить после установки, но можно использовать, зажав кнопку #{skill_color}#$BTN_INTERACT##, чтобы восстановить #{skill_color}#150## здоровья. Аптечку первой помощи можно использовать только #{skill_color}#1## раз.",
		--AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		["bm_equipment_doctor_bag_desc"] = "Чтобы использовать медицинскую сумку, вам нужно установить ее, используя #{skill_color}#$BTN_USE_ITEM##. После установки ее нельзя переместить, но можно использовать, удерживая #{skill_color}#$BTN_INTERACT##, чтобы восстановить #{skill_color}#20%## максимального здоровья сразу и #{skill_color}#4%## максимального здоровья каждые #{skill_color}#5## секунд в течение #{skill_color}#3## минут. Медицинскую сумку можно использовать #{skill_color}#$deployable_uses## раз(а).\n\nМедицинская сумка - портативный кейс, который используется профессиональными врачами для переноса медикаментов и лекарств.",
		["bm_equipment_doctor_bag_desc_short"] = "Чтобы использовать медицинскую сумку, вам нужно установить ее, используя #{skill_color}#$BTN_USE_ITEM##. После установки ее нельзя переместить, но можно использовать, удерживая #{skill_color}#$BTN_INTERACT##, чтобы восстановить #{skill_color}#20%## максимального здоровья сразу и #{skill_color}#4%## максимального здоровья каждые #{skill_color}#5## секунд в течение #{skill_color}#3## минут. Медицинскую сумку можно использовать #{skill_color}#$deployable_uses## раз(а).",
        --Sentry
		["bm_equipment_sentry_gun_desc"] = "Чтобы использовать турель, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.##. Вы используете #{skill_color}#$deployable_uses## вашего запаса патронов на установку. \n\nТурель можно забрать обратно, зажав #{skill_color}#$BTN_INTERACT## возле нее; это вернет вам остаток патронов и починит ее. \n\nПри получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая #{skill_color}#$BTN_INTERACT##. \n\nТурели пугают гражданских, заставляя их оставаться на месте.\n\nТурель автоматически наводится и стреляет по целям, которые попадают под ее сенсор. Она используется для отвлечения противников от вас и вашей команды.",
		["bm_equipment_sentry_gun_desc_short"] = "Чтобы использовать турель, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.##. Вы используете #{skill_color}#$deployable_uses## вашего запаса патронов на установку. \n\nТурель можно забрать обратно, зажав #{skill_color}#$BTN_INTERACT## возле нее; это вернет вам остаток патронов и починит ее. \n\nПри получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая #{skill_color}#$BTN_INTERACT##. \n\nТурели пугают гражданских, заставляя их оставаться на месте.",
		--Supp. Sentry
		["bm_equipment_sentry_gun_silent_desc"] = "Чтобы использовать приглушенную турель, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.##. Вы используете #{skill_color}#$deployable_uses## вашего запаса патронов на установку. \n\nТурель можно забрать обратно, зажав #{skill_color}#$BTN_INTERACT## возле нее; это вернет вам остаток патронов и починит ее. \n\nПри получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая #{skill_color}#$BTN_INTERACT##. \n\nТурели пугают гражданских, заставляя их оставаться на месте.\n\nПриглушенная турель, в отличие от громкой обычной, используется для убийства врагов, а не отвлечения.",
		["bm_equipment_sentry_gun_silent_desc_short"] = "Чтобы использовать приглушенную турель, вам нужно установить ее, зажав #{skill_color}#$BTN_USE_ITEM.##. Вы используете #{skill_color}#$deployable_uses## вашего запаса патронов на установку. \n\nТурель можно забрать обратно, зажав #{skill_color}#$BTN_INTERACT## возле нее; это вернет вам остаток патронов и починит ее. \n\nПри получении большого количества урона, турель отключится. Если это произошло, вы можете запустить режим починки, удерживая #{skill_color}#$BTN_INTERACT##. \n\nТурели пугают гражданских, заставляя их оставаться на месте.",
		--Body Bags
		["bm_equipment_bodybags_bag_desc"] = "Чтобы использовать кейс, вам нужно установить его, зажав #{skill_color}#$BTN_USE_ITEM##. После установки его нельзя переместить, но можно использовать, удерживая #{skill_color}#$BTN_INTERACT##, чтобы восстановить мешки для тел и стяжки.\n\nУ кейса ограниченный запас. По его виду можно понять, сколько сумок осталось. \n\nКейс позволяет восполнить мешки для тел и стяжки, использующиеся для транспортировки тел при скрытных операциях и контроле толп гражданских.",
		["bm_equipment_bodybags_bag_desc_short"] = "Чтобы использовать кейс, вам нужно установить его, зажав #{skill_color}#$BTN_USE_ITEM##. После установки его нельзя переместить, но можно использовать, удерживая #{skill_color}#$BTN_INTERACT##, чтобы восстановить мешки для тел и стяжки.\n\nУ кейса ограниченный запас. По его виду можно понять, сколько сумок осталось.",

		["hud_int_hold_take_pardons"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ ПОМИЛОВАНИЕ",
		["debug_interact_gage_assignment_take"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ЗАБРАТЬ ПОСЫЛКУ ГЕЙДЖА",

		["hint_ability_no_grenade_pickup"] = "У ВАС НЕТ МЕТАТЕЛЬНОГО ОРУЖИЯ",
		["hint_full_grenades"] = "У ВАС УЖЕ ПОЛНЫЙ ЗАПАС.",
		["debug_interact_ordnance_bag_take_grenades"] = "НАЖМИТЕ $BTN_INTERACT ЧТОБЫ ВЗЯТЬ МЕТАТЕЛЬНОЕ ОРУЖИЕ И НЕМНОГО ПАТРОНОВ",

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
		["loading_gameplay_res_7"] = "Зеленые Бульдозеры наносят много урона и могут пробить даже самую тяжелую броню с одного выстрела.",
		["loading_gameplay_res_8"] = "Черные Бульдозеры (Бульдозеры с Сайгой) обладают высокой скорострельностью и большим магазином. Помимо этого они бегают быстрее всех дозеров и могут быть оглушены взрывом.",
		["loading_gameplay_res_9"] = "Дозеры с пулеметами/Скаллдозеры ведут огонь на поражение и не останавливаются, пока не отстреляют всю ленту. Они передвигаются так же медленно, как и Титановые Дозеры.",
		["loading_gameplay_res_10"] = "Дозеры с дробовиками Бенелли (Бенелли Дозеры) заменяют Дозеров с миниганами - у них и высокий урон, и высокая скорость стрельбы. Они совмещают опасность Зеленого и скорость Черного Дозеров.",
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
		["loading_gameplay_res_27"] = "В Restoration Mod присутствуют разные фракции врагов, например, наемники Murkywater и полиция разных штатов.",
		["loading_gameplay_res_28"] = "На высоких сложностях, Клокеры бросают дымовую завесу при атаке.",
		--New Units Hints
	    ["loading_new_units_res_title"] = "Restoration - советы о новых противниках",
		["loading_new_units_res_1"] = "OMNIA ASU (агенты поддержки) усиливают урон товарищей при помощи желтых лазеров.",
		["loading_new_units_res_2"] = "LPF получает больше урона от оружия ближнего боя. Враги помечены фиолетовым цветом, когда их лечит LPF.",
		["loading_new_units_res_3"] = "Слабые противники получают дополнительное здоровье от LPF. В этом случае они помечаются фиолетовым цветом.",
		["loading_new_units_res_4"] = "Титановые Клокеры обладают продвинутой экипировкой, которая делает их практически невидимыми, но издает такие же звуки, как экипировка стандартных Клокеров.",
		["loading_new_units_res_5"] = "Титановые Дозеры предпочитают держать грабителей на расстоянии, чтобы выцелить их из своего Рельсотрона.",
		["loading_new_units_res_6"] = "Титановые Снайперы не имеют высокого урона и пробития брони, как у их стандартных  соратников, зато могут передвигаться и обладают высокой скоростью стрельбы.",
		["loading_new_units_res_7"] = "Вместо лазеров, Титановые Снайперы используют фиолетовые трассеры.",
		["loading_new_units_res_8"] = "Титановые щиты можно пробить только снайперской винтовкой Thanatos (и ее эквиваленты), пилой OVE9000 (с навыком 'Рвать и метать') и особыми бронебойными патронами у турелей. Однако, щит можно сбить, если вести по нему продолжительный огонь.",
		["loading_new_units_res_9"] = "Капитан Спринг и Титановые Дозеры всегда получают дополнительный урон в голову.",
		["loading_new_units_res_10"] = "Титановые Тазеры используют электрические боеприпасы, которые ненадолго замедляют вас. Экран засветится синим, если он выстрелит в вас.",
		["loading_new_units_res_11"] = "Копы-ветераны при смерти бросят слезоточивую гранату, если не убить их в голову.",
		["loading_new_units_res_12"] = "Копы-ветераны быстро передвигаются, из-за чего по ним трудно попасть.",
		["loading_new_units_res_13"] = "Титановый SWAT обладает броней, которая защищает их от холодного оружия.",
		["loading_new_units_res_14"] = "Титановый SWAT нельзя взять в заложники или переманить на свою сторону. ",
		["loading_new_units_res_15"] = "Титановый SWAT используют пулеметы и автоматические дробовики.",
		["loading_new_units_res_16"] = "Отряды Браво появляются только в режиме Pro Job, во время Точки невозврата. Это опасные противники, обладающие усиленными бронежилетами и более мощным оружием.",
		["loading_new_units_res_17"] = "Отряды Браво используют осколочные гранаты. Обращайте внимание на их уникальные звук и эффект.",
		["loading_new_units_res_18"] = "АКАН использует собственных Титановых юнитов - так называемая D-СЕРИЯ, разработанная корпорацией DRAK.",
		["loading_new_units_res_19"] = "Гренадер использует гранаты со слезоточивым газом, которые наносят продолжительный урон игрокам, стоящим в облаке. На 'Смертном приговоре' он вооружен более смертоносным паралитическим газом, который также уменьшает выносливость.",
		["loading_new_units_res_20"] = "Титановые щиты могут ослепить вас, используя свой щит. Следите за красными огнями и звуками, которые издают щиты во время подготовки к вспышке. Вы можете выстрелить в световую панель во время зарядки, чтобы оглушить противника.",
		--Captain Hints
		["loading_captains_res_title"] = "Restoration - советы о капитанах",
		["loading_captains_res_1"] = "Чтобы победить капитана Саммерса, нужно сначала обезвредить его команду, начиная с Дока. Саммерс будет неубиваем, пока вся его команда жива; остальные двое будут практически неуязвимы, пока жив Док.",
		["loading_captains_res_2"] = "Не жмитесь к Капитану Саммерсу, он быстро сожжет вас.",
		["loading_captains_res_3"] = "Капитан Спринг выдерживает много урона, но рано или поздно погибнет. Остерегайтесь его гранат и пользуйтесь его низкой скоростью.",
		["loading_captains_res_4"] = "Капитан Спринг периодически бросает кластерные осколочные гранаты. Не стойте возле него слишком долго.",
		["loading_captains_res_5"] = "Капитан Спринг может быть опасным, но это компенсируется его низкой скоростью и дальнобойностью.",
		["loading_captains_res_6"] = "Капитан Отем громко смеется во время своих атак.",
		["loading_captains_res_7"] = "В отличие от других капитанов, полиция не анонсирует появление капитана Отема, чтобы не испортить сюрприз.",
		["loading_captains_res_8"] = "Капитан Отем будет постепенно отключать ваше снаряжение, если дать ему оставаться незамеченным продолжительное время. Отключенное снаряжение помечено фиолетовым и будет восстановлено только после смерти Отема.",
		["loading_captains_res_9"] = "Вряд ли у вас получится победить капитана Отема в кулачном бою. Не стоит пробовать.",
		["loading_captains_res_10"] = "Капитан Винтерс практически неуязвим к взрывчатке и огню, обладает сильной защитой от пуль, но достаточно слаб в ближнем бою.",
		["loading_captains_res_11"] = "Щит Капитана Винтерса совершенно невозможно пробить, но вы можете попытаться выбить его из рук. Если будете вести продолжительный огонь по щиту, то Винтерс сбросит его и войдет в ярость.",
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
		["loading_stealth_res_8"] = "Когда вы несете сумку, вас будут замечать с гораздо большей дистанции, а также гораздо быстрее, если вы стоите, бежите или прыгаете. Двигайтесь медленно и вприсядку.",
		["loading_stealth_res_9"] = "Вы можете брать до 4 Генераторов помех вместо 2 из ванильной игры, но их время действия сокращено в два раза.",
		["loading_stealth_res_10"] = "Оружие с глушителем не издает никакого шума в стелсе.",
		["loading_stealth_res_11"] = "Вы можете взять в заложники до 4 охранников.",
		["loading_stealth_res_12"] = "Стелс теперь прощает ошибки, позволяя перестраивать планы на лету.",
		["loading_stealth_res_13"] = "Охранники больше не погибают мгновенно от любого урона, если они не встревожены. Цельтесь в голову или используйте оружие ближнего боя с высоким уроном.",
		["loading_stealth_res_14"] = "Когда шкала подозрения заполнится полностью, у вас будет 60 секунд, прежде чем включится тревога.",
		["loading_stealth_res_15"] = "Чем выше шкала подозрения, тем быстрее вас замечают охранники. ",
		["loading_stealth_res_16"] = "Вы можете использовать больше мешков для трупов, чем в ванильной игре, и еще больше, если находитесь в одиночной игре.",
		["loading_stealth_res_17"] = "В одиночной игре у вас будет больше стяжек, чтобы компенсировать недостающих игроков. Их количество будет также увеличено от соответствующих навыков.",
		["loading_stealth_res_18"] = "Охранники, убитые из огнестрельного оружия, включат пейджер. Включение пейджеров не увеличит шкалу подозрения, если, конечно, их не игнорировать",
		["loading_stealth_res_19"] = "На высоких сложностях, оператор пейджеров не такой доверчивый. Использование последнего пейджера обозначается особой фразой от оператора.",
		["loading_stealth_res_20"] = "Ответ на пейджер после того, как лимит исчерпан, очень сильно увеличит шкалу подозрения, но это все равно лучше, чем сбросить или не отвечать вовсе.",
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
		["loading_equip_skills_res_8"] = "Капо, Оружейник, Силовик, Аферист, Шулер и Байкер - это простые и поэтому надежные наборы перков.",
		["loading_equip_skills_res_9"] = "Киллер (Hitman) был переработан в набор перков, который обладает низкой выживаемостью и надежностью, но взамен предоставляет возможность получить большое количество 'временного здоровья', чтобы пробиться через сложные ситуации.",
		["loading_equip_skills_res_10"] = "Капо (Crew Chief) - это командный набор перков, который предоставляет небольшие, но полезные бонусы для вас и ваших соратников, и еще больше бонусов, если вы берете заложников. Он хорошо сочетается с веткой Командира у Манипулятора.",
		["loading_equip_skills_res_11"] = "Шулер (Gambler) - это командный набор перков, который предоставляет немного здоровья вам и бонусные боеприпасы для ваших товарищей, когда вы подбираете патроны. Хорошо сочетается с навыками, которые дают дополнительные коробки патронов с врагов.",
		["loading_equip_skills_res_12"] = "Маньяк (Maniac) - это агрессивный и командный набор перков, который понижает повреждения по вам и вашим соратникам, если вы безостановочно наносите урон. Хорошо сочетается с билдами, в которых есть высокий урон и сопротивление урону.",
		["loading_equip_skills_res_13"] = "Карманный генератор помех Хакера (Hacker) предоставляет лечение и сдерживание толпы всей команде, но долго перезаряжается. Помимо этого, он эффективен в стелсе.",
		["loading_equip_skills_res_14"] = "Взломщик (Burglar) - колода для уворота, которая награждает скрытность во время боя.",
		["loading_equip_skills_res_15"] = "Вор в законе (Kingpin) - гибкий набор перков. Инъектор можно использовать для самолечения, защиты от большого урона, или отвлечения противников от вашей команды.",
		["loading_equip_skills_res_16"] = "Тандем (Tag Team) - командный набор перков, который позволяет предоставить большое количество лечения конкретному соратнику, при условии, что вы вдвоем устраняете врагов без остановки.",
		["loading_equip_skills_res_17"] = "Бронебойные пули, пробившие щит, нанесут 50% урона.",
		["loading_equip_skills_res_18"] = "Револьверы Peacemaker и Phoenix .500 могут пробивать врагов, стены и щиты, как снайперские винтовки.",
		["loading_equip_skills_res_19"] = "Если справа на экране отображается шкала синего цвета - у вас есть Уворот (Dodge). Когда она подсвечивается, вы увернетесь от следующей пули. Для более подробного объяснения механики уворота, используйте Гайд.",
		["loading_equip_skills_res_20"] = "Чем выше Компактность оружия, тем быстрее вы его достаете и убираете.",
		["loading_equip_skills_res_21"] = "Когда вы достаете Бензопилу или Казагуруму, они наносят урон противникам впереди вас.",
		["loading_equip_skills_res_22"] = "Нож-бабочка и Выкидной нож наносят огромный урон при атаке со спины.",
		["loading_equip_skills_res_23"] = "Ледоруб и Золотая лихорадка наносят дополнительный урон в голову, но обладают низкой скоростью атаки.",
		["loading_equip_skills_res_24"] = "Яд наносит небольшой урон, но вызывает рвоту, которая прерывает действия врагов.",
		["loading_equip_skills_res_25"] = "Оглушающие гранаты являются отличным инструментом отвлечения, даже против Бульдозеров.",
		["loading_equip_skills_res_26"] = "Прицеливание значительно увеличивает точность и уменьшает отдачу, даже у пулеметов.",
		["loading_equip_skills_res_27"] = "Гвоздомет - оружие ближнего боя с очень высокой дальнобойностью - он бьет гораздо дальше, чем любое другое оружие ближнего боя.",
		["loading_equip_skills_res_28"] = "Прокачивайте наборы перков, чтобы открыть Кейс с метательным оружием.",
		["loading_equip_skills_res_29"] = "Одна коробочка из Кейса с метательным оружием теперь полностью восстанавливает ваш запас метательного оружия.",
		["loading_equip_skills_res_30"] = "Берегите Пиковый навык Мотивация (Inspire Ace) для действительно опасной ситуации, ведь он очень долго перезаряжается и требует прямую видимость.",
		["loading_equip_skills_res_31"] = "Restoration Mod добавляет два дополнительных набора перков, которые предоставляют больше денег и опыта, но отключают перки. Испытайте себя ради увеличенных наград!",
		["loading_equip_skills_res_32"] = "Чтобы получить бонус к прицеливанию, требуется дождаться конца анимации прицеливания. Следите за характеристикой \"Прицеливание\", когда настраиваете оружие.",
		["loading_equip_skills_res_33"] = "Длинные стволы, крупные приклады и большие магазины имеют хорошие преимущества, но вредят скорости переключения, перезарядки, прицеливания и задержку после бега. Если слишком увлечетесь ими, оружие станет слишком медленным для использования.",
		["loading_equip_skills_res_34"] = "Скорость удара прикладом зависит от Компактности вашего оружия.",
		["loading_equip_skills_res_35"] = "Характеристика \"Прицеливание\" влияет на задержку после бега, на время которой вы не можете стрелять.",
		["loading_equip_skills_res_36"] = "Глушители уменьшают шанс того, что враги увернутся от вашей атаки. Учтите, что вместо уворота они откроют по вам огонь.",
		["loading_equip_skills_res_37"] = "Чем выше показатель увеличения у прицела, тем меньше будет отдача во время стрельбы в режиме прицеливания.",
		["loading_equip_skills_res_38"] = "Характеристика \"Прорубание\" у оружия ближнего боя показывает, как много врагов Вы можете зацепить во время удара.",
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
		["loading_fluff_res_10"] = "Гренадер раньше работал в центре дезинфекции.",
		["loading_fluff_res_11"] = "Вы никогда не видели Титанового Клокера.",
		["loading_fluff_res_12"] = "Omnia — музыкальная группа, сама определяющая свой стиль, как 'неокельтский языческий фолк', основана в Нидерландах и Бельгии. Неизвестно, есть ли у нее связь с организацией OMNIA.",
		["loading_fluff_res_13"] = "Джекел отказывается рассказывать, из-за какого события он покинул GenSec и начал работать на CrimeNet. Он был крайне им возмущен.",
		["loading_fluff_res_14"] = "ХАХАХАХА.",
		["loading_fluff_res_15"] = "Капитан Саммерс и его команда были бандой из четырех грабителей, прямо как банда Payday. Теперь они - нападающий отряд, работающий на OMNIA.",
		["loading_fluff_res_16"] = "По официальной версии, Капитан Саммерс и его команда погибли, когда на них обрушилась крыша банка во время ограбления. Это, конечно, утка.",
		["loading_fluff_res_17"] = "Капитан Отем тратит состояние на наручники. ",
		["loading_fluff_res_18"] = "Капитан Саммерс тратит состояние на газ, газ, газ.",
		["loading_fluff_res_19"] = "Капитан Спрингс тратит состояние на патроны и гранаты.",
		["loading_fluff_res_20"] = "Капитан Винтерс тратит состояние на щиты и изоленту.",
		["loading_fluff_res_21"] = "Дивизия Гренадеров тратит состояние на лечение химических ожогов из-за частых инцидентов с огнем по своим.",
		["loading_fluff_res_22"] = "Возможно вы встречались с Капитаном Саммерсом раньше. А возможно и нет.",
		["loading_fluff_res_23"] = "Мексиканская федеральная полиция имеет особый отряд по охоте на чупакабру.",
		["loading_fluff_res_24"] = "Капитаны не умирают, а отправляются под стражу.",
		["loading_fluff_res_25"] = "АКАН предложил 'быструю и жестокую расправу над картелями' по цене дешевле, чем OMNIA - поэтому мексиканская федеральная полиция пополнила состав D-серией DRAK. На самом деле это уловка, чтобы подобраться ближе к операциям OMNIA в Мексике и США.",

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
		["st_menu_ghost_silencer"] = "Наемный убийца",
		["hud_instruct_mask_on"] = "Нажмите $BTN_USE_ITEM чтобы надеть маску",
		["hud_instruct_mask_on_alpha"] = "Нажмите $BTN_USE_ITEM чтобы надеть маску",

		--Default Suit String
		["bm_suit_none_desc"] = "Это стандартный костюм грабителя с выбранной броней. Может измениться с костюма-двойки в зависимости от ограбления!",

		-- Ad Banner Change
		["menu_changelog"] = "Последний чейнджлог",
		["menu_discord"] = "Сервер в Discord",
		["menu_guide"] = "Гайд по моду",
		["menu_captains"] = "Информация о Капитанах",
		["menu_content_updates"] = "Гайд/Поддержка",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "",
		["menu_mutators_category_holiday"] = "ПРАЗДНИКИ",
		["menu_mutators_category_old_event"] = "ИВЕНТЫ",
		["menu_mutators_category_crime_spree"] = "СЕРИЯ ОГРАБЛЕНИЙ",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "Гренадеры",
		["mutator_specials_override_sniper"] = "Снайперы",

		["mutator_titandozers_desc"] = "Хэллоуинские эффекты",
		["mutator_titandozers_longdesc"] = "Безголовый Бульдозер сбежал из кошмаров Вульфа в реальность! Обычные Бульдозеры заменены на Безголовых, а также включены особые хэллоуинские эффекты.",

		["mutator_medidozer_longdesc"] = "Все обычные враги заменены на медиков, все специальные враги заменены на Бульдозеров.",
		["mutator_medicdozers"] = "Дозеры-медики",
		["mutator_medicdozers_desc"] = "Теперь появляются Дозеры-медики.",
		["mutator_medicdozers_longdesc"] = "Каждый раз, когда появляется Бульдозер, есть 50% шанс, что его заменит Бульдозер-медик.\n\nЕсли включен мутатор 'Бульдозеры с полуавтоматическими дробовиками', Бульдозеры-медики будут заменять Черныйх Бульдозеров с шансом 33.3%.",

		--Alternative arsenal
		["mutator_enemy_damage_longdesc"] = "Игроки будут получать больше или меньше урона от противников, чем обычно.",

		--Because of Training
		["mutator_enemy_health_longdesc"] = "Противники будут появляться с большим или меньшим кол-вом здоровья, чем обычно.",

		["mutator_notitans"] = "Сокращение бюджета",
		["mutator_notitans_desc"] = "Отключает Титановых юнитов.",
		["mutator_notitans_longdesc"] = "Любые появления Титановых юнитов отключены.",

		["mutator_onlytitans"] = "Повышение бюджета",
		["mutator_onlytitans_desc"] = "Титановые юниты заменяют всех обычных юнитов.",
		["mutator_onlytitans_longdesc"] = "Вместо обычных юнитов будут появляться их Титановые версии.",

		["mutator_mememanonly"] = "ХАХАХА, ОБМАНУЛ ВАС!",
		["mutator_mememanonly_desc"] = "СТРАДАЙ",
		["mutator_mememanonly_longdesc"] = "НЕУБЕЖАТЬНЕСПАСТИСЬПОМОГИТЕ\n\n ВНИМАНИЕ: Может вызвать вылет игры на некоторых картах.",

		["MutatorMoreDonutsPlus"] = "Больше пончиков+",
		["MutatorMoreDonutsPlus_desc"] = "Все обычные враги будут заменены на копов с револьвером Bronco, все особые враги будут заменены на LPF.",
		["MutatorMoreDonutsPlus_longdesc"] = "Все обычные враги будут заменены на копов с револьвером Bronco, все особые враги будут заменены на LPF.\n\nВНИМАНИЕ: Не стоит играть с этим отвратительным мутатором.",

		["MutatorJungleInferno"] = "Диско Инферно",
		["MutatorJungleInferno_desc"] = "Все враги теперь бегают с огнеметами.",
		["MutatorJungleInferno_longdesc"] = "Оружие всех противников заменяется на огнемет. Не работает для щитов и снайперов.",

		["mutator_minidozers"] = "Бульдозеры с полуавтоматическими дробовиками",
		["mutator_minidozers_desc"] = "Теперь появляются Бульдозеры с полуавтоматическими дробовиками.",
		["mutator_minidozers_longdesc"] = "Каждый раз, когда появляется Черный Бульдозер, есть 50% шанс того, что его заметит Бульдозер с M1014.\n\nЕсли включен мутатор 'Дозеры-медики', Бульдозеры с M1014 будут заменять Черных Бульдозеров с шансом 33.3%.",

		["mutator_fatroll"] = "Лютый троллинг",
		["mutator_fatroll_desc"] = "Грейс период (в с)",
		["mutator_fatroll_longdesc"] = "Задержка на получение урона для игроков и ботов теперь зависит от этого значения. Минимум - 0 с, максимум - 0.25 с.",

		["mutator_overheal"] = "Эксперт сверхлечения",
		["menu_mutator_overheal_mult_override"] = "Множитель сверхлечения",
		["menu_mutator_overheal_mult_override_toggle"] = "Включить сверхлечение для капитанов",
		["mutator_overheal_desc"] = "LPF теперь может давать дополнительное здоровье почти всем противникам.",
		["mutator_overheal_longdesc"] = "LPF теперь может давать дополнительное здоровье всем противникам, кроме клокеров. \n\nПримечание:Мутатор не может перезаписать значение множителя для тех противников, множитель у которых выше, чем заданное Вами значение.",

		["mutator_asu_buff"] = "Мощь всех стволов",
		["menu_mutator_captain_asu_buff_toggle"] = "Включить усиления урона для капитанов",
		["mutator_asu_buff_desc"] = "ASU теперь может усиливать оружия особых противников.",
		["mutator_asu_buff_longdesc"] = "ASU теперь может усиливать оружия особых противников (кроме клокеров) и усиливает урон оружий как на сложности Смертный Приговор.",

		["mutator_bo_flashbang"] = "Your Opinion - My Choice",
		["menu_mutator_flashbang_cooking_time"] = "Время до срабатывания (в с)",
		["mutator_bo_flashbang_desc"] = "Светошумовые гранаты теперь нельзя сломать.",
		["mutator_bo_flashbang_longdesc"] = "Светошумовые гранаты теперь нельзя сломать.",

		["mutator_grenade_mayhem"] = "Тотальное побоище!",
		["menu_mutator_grenade_mayhem_usuals_toggle"] = "Гранаты для обычных и элитных врагов",
		["menu_mutator_grenade_mayhem_thugs_toggle"] = "Гранаты для бандитов",
		["menu_mutator_grenade_mayhem_specials_toggle"] = "Гранаты для особых врагов",
		["menu_mutator_grenade_mayhem_bosses_toggle"] = "Гранаты для боссов",
		["menu_mutator_grenade_mayhem_captains_toggle"] = "Гранаты для капитанов",
		--["menu_mutator_grenade_mayhem_sosa_cosplay_toggle"] = "Include Frag Underbarrels for Grenadiers",
		["mutator_grenade_mayhem_desc"] = "Позволяет кидать осколочные гранаты не только оперативникам Браво.",
		["mutator_grenade_mayhem_longdesc"] = "Позволяет кидать осколочные гранаты не только оперативникам Браво.\n\nПримечание: Враги с огнеметами будут кидать молотовы вместо осколочных; Клокеры будут кидать слезоточивый газ вместо осколочных.",

		["mutator_captain_replace"] = "Вечная непогода",
		["menu_mutator_captain_replace_1"] = "Капитан (день 1)",
		["menu_mutator_captain_replace_2"] = "Капитан (день 2)",
		["menu_mutator_captain_replace_3"] = "Капитан (день 3)",
		["menu_mutator_captain_replace_no_captain_override"] = "Без изменений",
		["menu_mutator_captain_replace_captain_random"] = "Случайный",
		["menu_mutator_captain_replace_winter"] = "Винтерс",
		["menu_mutator_captain_replace_autumn"] = "Отем",
		["menu_mutator_captain_replace_spring"] = "Спринг",
		["menu_mutator_captain_replace_summer"] = "Саммерс",
		["menu_mutator_captain_replace_hvh"] = "АТБГШИЛ",
		["menu_mutator_winter_blacklist_toggle"] = "Исключить Винтерса из случайного выбора",
		["menu_mutator_spring_blacklist_toggle"] = "Исключить Спринга из случайного выбора",
		["menu_mutator_summer_blacklist_toggle"] = "Исключить Саммерса из случайного выбора",
		["menu_mutator_autumn_blacklist_toggle"] = "Исключить Отема из случайного выбора",
		["menu_mutator_hvh_blacklist_toggle"] = "Исключить АТБГШИЛ из случайного выбора",
		["mutator_captain_replace_desc"] = "Позволяет менять капитана, который может появиться на ограблении.",
		["mutator_captain_replace_longdesc"] = "Позволяет менять капитана, который может появиться на ограблении.\n\nПримечание: Мутатор не может заменить капитанов, которые приходят по скрипту. Исключение всех капитанов из случайного выбора приведет к использованию настройки \"Без изменений\".",

		["mutator_no_outlines"] = "Эксперт Реализм",
		["mutator_no_outlines_desc"] = "Почти все контуры отключены.",
		["mutator_no_outlines_longdesc"] = "Почти все контуры отключены. Также отключены ники над ботами/игроками.",
		["menu_mutator_no_outlines_enemies_toggle"] = "Выключить контуры противников",
		["menu_mutator_no_outlines_enemies_toggle"] = "Выключить подсвечивающие контуры (кроме обводки для сопровождения цели)",

		["mutator_spawn_mult"] = "Увеличенные отряды",
		["menu_mutator_enemy_spawn"] = "МНОЖИТЕЛЬ СПАУНОВ",
		["mutator_spawn_mult_desc"] = "Спауны врагов увеличены.",
		["mutator_spawn_mult_longdesc"] = "Во время штурмов будет спаунится больше врагов. Почувствуйте себя Джулсом!",

		["mutator_birthday"] = "Гелиевая вечеринка",
		["mutator_birthday_desc"] = "Убийство особых врагов спаунит шарики, которые дают бонусы.",
		["mutator_birthday_longdesc"] = "Восьмилетие PAYDAY:\n\nУбийство особых врагов заспаунит шарики, которые можно прострелить чтобы получить бонусы для всей команды. Некоторые враги спаунят шарики чаще. Можно активировать несколько бонусов сразу.",

		["mutator_CG22"] = "Криминальные колядки",
		["mutator_CG22_desc"] = "На некоторых ограблениях появится елка, которая дает подарки.",
		["mutator_CG22_longdesc"] = "Рождество 2022:\n\nНа некоторых ограблениях появляются елки, которые дают подарки. Подарки можно уничтожить и получить временные бонусы, или отдать Хайрудину для бонусного опыта, денег и монет Континеталь. При использовании подарков может появиться Бульдозер-Снеговик.",

		["menu_cg22_post_objective_1_desc"] = "Убить 200 врагов из любой снайперской винтовки.",
		["menu_cg22_post_objective_2_desc"] = "Убить 15 Клокеров из винтовки 'Полярная Звезда' на сложности 'Очень Сложно' или выше.",
		["menu_cg22_post_objective_3_desc"] = "Сделать 50 двойных убийств из винтовки 'Полярная Звезда' на любой сложности.",
		["menu_cg22_post_objective_4_desc"] = "Украсть 10 сумок и успешно сбежать на любой сложности.",
		["menu_cg22_post_objective_5_desc"] = "Убить 10 Бульдозеров на сложности 'OVERKILL' или выше.",
		["menu_cg22_post_objective_6_desc"] = "Украсть 25 сумок и успешно сбежать на любой сложности.",
		["menu_cg22_post_objective_7_desc"] = "Украсть 50 сумок и успешно сбежать на любой сложности.",
		["menu_cg22_post_objective_8_desc"] = "Убить 20 Бульдозеров на сложности 'OVERKILL' или выше.",
		["menu_cg22_post_objective_9_desc"] = "Украсть 75 сумок и успешно сбежать на любой сложности.",

		["mutator_piggybank"] = "Покорми свинью",
		["mutator_piggybank_desc"] = "Убийство врагов дает свинобаксы, которыми можно покормить золотую свинью.",
		["mutator_piggybank_longdesc"] = "Девятилетие PAYDAY:\n\nУбитые враги роняют свинобаксы. Свинобаксы - временные сумки, которыми можно кормить Золотую Свинку. Чем больше Свинка растет, тем больше бонусного денег и опыта вы получите в конце ограбления.",

		["mutator_piggyrevenge"] = "Плохие свинки",
		["mutator_piggyrevenge_desc"] = "Убийство врагов дает свинобаксы, которыми можно покормить золотую свинью.",
		["mutator_piggyrevenge_longdesc"] = "Десятилетие PAYDAY:\n\nУбитые враги роняют свинобаксы. Свинобаксы - временные сумки, которыми можно кормить Золотую Свинку. Когда вы кормите свинью, есть шанс того, что появится дозер-кабан с огнеметом. Чем больше Свинка растет, тем больше бонусного денег и опыта вы получите в конце ограбления.",

		["menu_pda10_post_objective_3_desc"] = "Пройдите 25 ограблений на любой сложности",
		["menu_pda10_post_objective_5_desc"] = "Убейте 50 врагов, используя снайперские винтовки",
		["menu_pda10_post_objective_2_desc"] = "Украдите 50 сумок",
		["menu_pda10_post_objective_6_desc"] = "Убейте 50 врагов, используя оружие ближнего боя",
		["menu_pda10_post_objective_1_desc"] = "Убейте 50 бульдозеров",
		["menu_pda10_post_objective_4_desc"] = "Соберите 50 посылок Гейджа",

		["mutator_bravos_only"] = "Профессиональный день",
		["mutator_bravos_only_desc"] = "Враги заменены на свои PONR-варианты.",
		["mutator_bravos_only_longdesc"] = "Враги заменены на варианты, которые появляются при Точке Невозврата (PONR) в режиме Pro-Job. Синий спецназ заменен на спецназ ФБР, а спецназ ФБР заменен на отряды Браво.",
		["menu_bravo_replacement_choice"] = "Режим замены врагов",
		["menu_mutator_bravo_replacement_all"] = "Полная замена",
		["menu_mutator_bravo_replacement_random"] = "Случайная замена",
		["menu_mutator_bravo_replacement_slider"] = "Шанс замены (в %)",


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

		--Crime Spree mutators
		["mutator_cloakercuff"] = "Фокусник",
		["mutator_cloakercuff_desc"] = "Удары клокера в ближнем бою теперь заковывают Вас в наручники.",
		["mutator_cloakercuff_longdesc"] = "Удары клокера в ближнем бою теперь заковывают Вас в наручники.",

		["mutator_cloakerflashbang"] = "Ослепительный ниндзя",
		["mutator_cloakerflashbang_desc"] = "Клокеры могут выкинуть светошумовую гранату во время уворота.",
		["mutator_cloakerflashbang_longdesc"] = "Клокеры с шансом 50% могут выкинуть светошумовую гранату во время уворота.",

		["mutator_fartsmella"] = "Поставки с \"пестицидами\"",
		["mutator_fartsmella_desc"] = "Дымовые гранаты заменены на гранаты со слезоточивым газом.",
		["mutator_fartsmella_longdesc"] = "Дымовые гранаты заменены на гранаты со слезоточивым газом.\nНе работает на дымовые гранаты от мутатора \"Сделай мне больно\".",

		["mutator_kaboom"] = "Камикадзе",
		["mutator_kaboom_desc"] = "Гренадеры взрываются после смерти.",
		["mutator_kaboom_longdesc"] = "Гренадеры взрываются после смерти.",

		["mutator_fastresponse"] = "Оперативное реагирование",
		["mutator_fastresponse_desc"] = "Все полицейские штурмы теперь происходят с максимальной интенсивностью.",
		["mutator_fastresponse_longdesc"] = "Все полицейские штурмы теперь происходят с максимальной интенсивностью (сложность штурма начинается сразу с 1).",

		["mutator_fullautoinbuilding"] = "Бешеные стрелки",
		["mutator_fullautoinbuilding_desc"] = "Титановые снайперы и их эквиваленты теперь стреляют из своих винтовок в автоматическом режиме по игрокам, которые находятся близко к ним.",
		["mutator_fullautoinbuilding_longdesc"] = "Титановые снайперы и их эквиваленты теперь стреляют из своих винтовок в автоматическом режиме по игрокам, которые находятся на расстоянии не более 10 метров.",

		["mutator_crazytaser"] = "Шоковая терапия",
		["mutator_crazytaser_desc"] = "Тазеры теперь не имеют задержку перед применением удара электрошоком.",
		["mutator_crazytaser_longdesc"] = "Тазеры теперь не имеют задержку перед применением удара электрошоком.\n\nПримечание: Задержка для использования следующего удара шоком все еще есть.",

		["mutator_masterdodger"] = "Увернись от этого!",
		["mutator_masterdodger_desc"] = "Ветеран копы теперь уворачиваются от всех пуль.",
		["mutator_masterdodger_longdesc"] = "Ветеран копы теперь уворачиваются от всех пуль.",

		["mutator_quickscope360"] = "Орлиный глаз",
		["mutator_quickscope360_desc"] = "Снайперы теперь прицеливаются на 100% быстрее.",
		["mutator_quickscope360_longdesc"] = "Снайперы теперь прицеливаются на 100% быстрее.",

		["mutator_goldfarbdozers"] = "Двойные неприятности",
		["mutator_goldfarbdozers_desc"] = "Все бульдозеры теперь появляются парами.",
		["mutator_goldfarbdozers_longdesc"] = "Все бульдозеры теперь появляются парами. Не влияет на заскриптованных бульдозеров.",

		["mutator_spoocsquad"] = "Отряд ниндзя",
		["mutator_spoocsquad_desc"] = "Клокеры появляются группами.",
		["mutator_spoocsquad_longdesc"] = "Клокеры появляются группами.",

		["mutator_vanilla_police_call"] = "Посторонние на объекте",
		["mutator_vanilla_police_call_desc"] = "Возвращает обратно механики работы пейджеров, камер и звонков в полицию.",
		["mutator_vanilla_police_call_longdesc"] = "Возвращает обратно механики работы пейджеров, камер и звонков в полицию.",
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
		["menu_cs_modifier_boomboom"] = "Гренадеры взрываются при смерти.",
		["menu_cs_modifier_friendlyfire"] = "Союзники теперь получают 100% урона по своим.",
		["menu_cs_modifier_dodgethis"] = "Копы-ветераны теперь уворачиваются от всех пуль.",
		["menu_cs_modifier_sniper_aim"] = "Снайперы наводятся на 100% быстрее.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "SWAT с легкими винтовками получают на 100% больший шанс стать лидером отряда + в каждом отряде может быть на одного лидера больше.",
		["menu_cs_modifier_heavy_sniper"] = "Титановые снайперы и снайперы Браво ведут автоматический огонь на близких расстояниях.",
		["menu_cs_modifier_dozer_medic"] = "Когда появляется Бульдозер, есть шанс, что его заменит Бульдозер-Медик. Бульдозер-Медик считается за Медика и Бульдозера одновременно .",
		["menu_cs_modifier_dozer_minigun"] = "Когда появляется Зеленый или Черный Бульдозер, есть шанс, что его заменит Бульдозер с М1014.",
		["menu_cs_modifier_shield_phalanx"] = "Все обычные Щиты получают дополнительный 15% шанс стать Титановыми щитами.",
		["menu_cs_modifier_taser_overcharge"] = "Тазерам теперь не нужно целиться перед шоком. Задержка между попытками остается.",
		["menu_cs_modifier_dozer_rage"] = "Когда стекло Бульдозера уничтожено, он войдет в ярость, получая 10% к наносимому урону.",
		["menu_cs_modifier_medic_adrenaline"] = "Все Медики получают дополнительный 15% шанс стать OMNIA LPF или огнеметчиком DRAK, в зависимости от фракции.",
		["menu_cs_modifier_cloaker_arrest"] = "Атаки Клокеров в ближнем бою теперь заковывают игроков.",
		["menu_cs_modifier_cloaker_smoke"] = "Клокеры теперь имеют шанс 50% сбросить светошумовую гранату, когда уворачиваются от атак.",
		["menu_cs_modifier_cloaker_tear_gas"] = "Все агенты по спасению заложников получают дополнительный 15% шанс стать Титановыми агентами.",
		["menu_cs_modifier_dozer_lmg"] = "Когда появляется Зеленый или Черный Бульдозер, есть шанс, что его заменит Скаллдозер.",
		["menu_cs_modifier_10secondsresponsetime"] = "Полицейские штурмы сразу имеют максимальную интенсивность.",
		["menu_cs_modifier_dozerpairs"] = "Все бульдозеры теперь появляются парами.",
		["menu_cs_modifier_spoocsquad"] = "Клокеры стараются появляться группами.",

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

        ["menu_crew_evasive"] = "Отвлекающий маневр",
        ["menu_crew_evasive_desc"] = "Полоска уворота игроков заполняется на 3% от их максимального уворота.",

        ["menu_crew_motivated"] = "Тренер",
        ["menu_crew_motivated_desc"] = "Игроки получают на 15 больше выносливости.",

        ["menu_crew_regen"] = "Лекарь",
        ["menu_crew_regen_desc"] = "Игроки лечат 1 очко здоровья каждые 4 секунды.",

        ["menu_crew_quiet"] = "Компактный",
        ["menu_crew_quiet_desc"] = "Игроки получают на 2 единицы компактности больше.",

        ["menu_crew_generous"] = "Подарочек",
        ["menu_crew_generous_desc"] = "Игроки получают дополнительное мететальное за каждые 70 убийств.",

        ["menu_crew_eager"] = "Адреналин",
        ["menu_crew_eager_desc"] = "Игроки перезаряжают оружие на 10% быстрее.",

	--[[   SKILLTREES   ]]--

		--[[   MASTERMIND   ]]--

			--[[   MEDIC SUBTREE   ]]--
				--Combat Medic
				["menu_combat_medic_beta_sc"] = "Интерн",
				["menu_combat_medic_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#$skill_value_b1## меньше урона во время поднятия напарника, и на #{skill_color}#$skill_value_b2## секунд после.\n\nПИКОВЫЙ: #{owned}#$pro##\nПоднятый напарник получит на #{skill_color}#$skill_value_p1## больше здоровья.",

				--Quick Fix
				["menu_tea_time_beta_sc"] = "Скорая помощь",
				["menu_tea_time_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает скорость установки Аптечек первой помощи и Медицинских сумок на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nНапарники, которые воспользовались вашими аптечками первой помощи, будут получать на #{skill_color}#$skill_value_p1## меньше урона в течение #{skill_color}#$skill_value_p2## секунд.",

				--Pain Killers
				["menu_fast_learner_beta_sc"] = "Анальгин",
				["menu_fast_learner_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nНапарники, поднятые вами, получают на #{skill_color}#$skill_value_b1## меньше урона в течение #{skill_color}#$skill_value_b2## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nУрон уменьшен еще на #{skill_color}#$skill_value_p1.##",

				--Uppers
				["menu_tea_cookies_beta_sc"] = "Колеса",
				["menu_tea_cookies_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь вы можете носить #{skill_color}#$skill_value_b1## Аптечек первой помощи.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь вы можете носить #{skill_color}#$skill_value_p1## Аптечек первых помощи.\n\nВаши Аптечки первой помощи используются автоматически, если игрок упадет в радиусе #{skill_color}#5## метров от аптечки.\n\nЭто может произойти только раз в #{important_1}#$skill_value_p2## секунд, индивидуально для каждого игрока.\n\n#{risk}#Не работает при использовании Лебединой песни.##",

				--Combat Doctor
				["menu_medic_2x_beta_sc"] = "Военврач",
				["menu_medic_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши медицинские сумки получают #{skill_color}#$skill_value_b1## дополнительное использование.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить #{skill_color}#$skill_value_p1## медицинские сумки, а не одну.",

				--Inspire
				["menu_inspire_beta_sc"] = "Мотивация",
				["menu_inspire_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы поднимаете напарников на #{skill_color}#$skill_value_b1## быстрее.\n\nКрик на них повысит их скорость перезарядки и передвижения на #{skill_color}#$skill_value_b2## в течение #{skill_color}#$skill_value_b3## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш крик может поднять напарника #{skill_color}#в зоне вашей видимости## на расстоянии не более #{skill_color}#9 метров##. Навык перезаряжается #{important_1}#$skill_value_p1## секунд.",

			--[[   CONTROLLER SUBTREE   ]]--
				--Cable Guy
				["menu_triathlete_beta_sc"] = "Навязанная дружба",
				["menu_triathlete_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы носите на #{skill_color}#$skill_value_b1## кабельные стяжки больше.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш шанс поднять стяжку из пачки патронов увеличен на #{skill_color}#30%.##\n\nВы носите еще на #{skill_color}#$skill_value_p1## кабельные стяжки больше.",

				--Clowns are Scary
				["menu_cable_guy_beta_sc"] = "Боязнь клоунов",
				["menu_cable_guy_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГражданские находятся в страхе на #{skill_color}#$skill_value_b1## дольше.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбедительность и дальность вашего запугивания увеличена на #{skill_color}#$skill_value_p1## дольше.",

				--Stockholm Syndrome
				["menu_joker_beta_sc"] = "Стокгольмский синдром",
				["menu_joker_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГражданские и джокеры рядом #{skill_color}#поднимут вас, если вы их позовете##, а так же дадут вам пачку патронов.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы и ваша команда получаете #{skill_color}#+$skill_value_p1## сопротивление урону за каждого заложника, вплоть до #{skill_color}#$skill_value_p2## заложников.\n\n#{risk}#Эффекты от двух и более игроков не складываются.##",

				--Joker
				["menu_stockholm_syndrome_beta_sc"] = "Доминатор",
				["menu_stockholm_syndrome_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете переманить обычного врага на вашу сторону. Для этого враг должен сдаться. Вы можете перевести только одного врага на свою сторону. Навык работает только после поднятия тревоги.\n\nВраг, сражающийся на вашей стороне, получает на #{skill_color}#$skill_value_b1## меньше урона.\n\nВраги на вашей стороне считаются за заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь вы можете перевести на свою сторону до #{skill_color}#2## врагов одновременно.\n\nВраг, сражающийся на вашей стороне, получает еще на #{skill_color}#$skill_value_p1## меньше урона.",

				--Partners in Crime
				["menu_control_freak_beta_sc"] = "Сообщник",
				["menu_control_freak_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждый заложник увеличивает вашу скорость передвижения на #{skill_color}#$skill_value_b1##. Эффект складывается вплоть до #{skill_color}#4## заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nКаждый заложник увеличивает ваше здоровье на #{skill_color}#$skill_value_p1##. Эффект складывается вплоть до #{skill_color}#4## заложников.",

				--Hostage Taker
				["menu_black_marketeer_beta_sc"] = "Похититель",
				["menu_black_marketeer_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы восстанавливаете #{skill_color}#$skill_value_b1## здоровье каждые #{skill_color}#4## секунды за каждого заложника, вплоть до #{skill_color}#4## заложников.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши заложники #{skill_color}#не будут убегать## после освобождения.\n\nЕсли вы попадете под стражу, ваши заложники самостоятельно обменяют себя на вас. Это может произойти во время штурма, но только #{skill_color}#1## раз за ограбление.\n\nРегенерация здоровья от навыка увеличена на #{skill_color}#$skill_value_p1##, когда у вас #{skill_color}#4## или более заложника.",

			--[[   ASSAULT SUBTREE   ]]--
				--Leadership
				["menu_stable_shot_beta_sc"] = "Лидерство",
				["menu_stable_shot_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Пулеметы## получают #{skill_color}#$skill_value_b1## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nСтабильность у любого оружия у вас и вашей команды увеличена на #{skill_color}#$skill_value_p1.## \n\n#{risk}#Примечание: Командные навыки не складываются, если несколько игроков имеют этот навык.##",

				--MG Handling
				["menu_scavenger_sc"] = "Рэмбо",
				["menu_scavenger_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает точность стрельбы от бедра #{skill_color}#пистолетов-пулеметов и пулеметов## на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает точность стрельбы от бедра #{skill_color}#пистолетов-пулеметов и пулеметов## еще на #{skill_color}#$skill_value_p1.##\n\nВы перезаряжаете #{skill_color}#пулеметы## на #{skill_color}#$skill_value_p2## быстрее.",

				--MG Specialist
				["menu_sharpshooter_sc"] = "Пулеметчик",
				["menu_sharpshooter_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШтраф точности при стрельбе во время движения уменьшен на #{skill_color}#$skill_value_b1## для #{skill_color}#пистолетов-пулеметов и пулеметов.##\n\nУменьшение штрафа на точность зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Пулеметы## стреляют на #{skill_color}#$skill_value_p1## быстрее.\n\nКаждая #{skill_color}#$skill_value_p2 - ая## пуля, выпущенная из #{skill_color}#пистолета-пулемета или пулемета## при продолжительной стрельбе, не будет потрачена.",

				--Shock and Awe
				["menu_spotter_teamwork_beta_sc"] = "Перегрузка",
				["menu_spotter_teamwork_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nРазмеры магазинов #{skill_color}#всего## оружия увеличены на #{skill_color}#$skill_value_b1.##\n\n#{risk}#Не работает на арбалеты, луки, гранатометы и ракетометы.##\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь вы можете стрелять от бедра во время бега и не имеете задержки на стрельбу после бега.\n\nРазмеры магазинов вашего оружия увеличены еще на #{skill_color}#$skill_value_p1.##",

				--Heavy Impact
				["menu_speedy_reload_sc"] = "Шок и трепет",
				["menu_speedy_reload_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Пулеметы## получают #{skill_color}#$skill_value_b1## шанс сбить врага с ног.\n\nПри использования сошек, шанс повышается до #{skill_color}#$skill_value_b2##.\n\n#{risk}#Навык не действует на  капитанов, снайперов, бульдозеров и щитов.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете на #{skill_color}#$skill_value_p1## меньше урона в приседе.\n\nЭтот эффект повышается до #{skill_color}#$skill_value_p2## при использовании сошек.",

				--Body Expertise
				["menu_body_expertise_beta_sc"] = "Свинцовый ад",
				["menu_body_expertise_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Все оружие## наносит #{skill_color}#$skill_value_b1## урона через броню.\n\nЭтот эффект увеличивается до #{skill_color}#$skill_value_b2## для #{skill_color}#пулеметов.##\n\n#{risk}#Эффект складывается с бронебойностью вашего оружия, до максимальных 100%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийства из #{skill_color}#пулеметов## в течение одной очереди дольше #{skill_color}#$skill_value_p1## секунд увеличат урон на #{skill_color}#$skill_value_p2##; складывается до #{skill_color}#$skill_value_p3## раз.",


		--[[   ENFORCER   ]]--

			--[[   SHOTGUNNER SUBTREE   ]]--
				--Underdog--
				["menu_underdog_beta_sc"] = "Давление",
				["menu_underdog_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда #{skill_color}#3## или более врага находятся в #{skill_color}#18## метрах от вас, вы получаете #{skill_color}#$skill_value_b1## бонус к урону на #{skill_color}#$skill_value_b2## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nКогда #{skill_color}#3## или более врага находятся в #{skill_color}#18## метрах от вас, вы также получаете на #{skill_color}#$skill_value_p1## меньше урона в течении #{skill_color}#$skill_value_p2## секунд.",

				--Shotgun CQB
				["menu_shotgun_cqb_beta_sc"] = "Гладкоствольное искусство",
				["menu_shotgun_cqb_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы прицеливаетесь из #{skill_color}#дробовиков и огнеметов## на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Дробовики и огнеметы## перезаряжаются на #{skill_color}#$skill_value_p1## быстрее.",
				["menu_shotgun_cqb_per_pellet_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы прицеливаетесь из #{skill_color}#дробовиков и огнеметов## на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Дробовики и огнеметы## перезаряжаются на #{skill_color}#$skill_value_p1## быстрее.",


				--Shotgun Impact
				["menu_shotgun_impact_beta_sc"] = "Ружьевой импульс",
				["menu_shotgun_impact_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Дробовики и огнеметы## получают #{skill_color}#$skill_value_b1## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Дробовики## получают #{skill_color}#3## дополнительные дробинки.\n\n#{risk}#Не работает на бронебойные и разрывные пули.##",
				["menu_shotgun_impact_per_pellet_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Дробовики и огнеметы## получают #{skill_color}#$skill_value_b1## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nМинимальный урон #{skill_color}#дробовиков## увеличен на #{skill_color}#25%.##\n\n#{risk}#Не работает на бронебойные и разрывные пули.##",

				--Pigeon Shooting
				["menu_far_away_beta_sc"] = "Охотник на голубей",
				["menu_far_away_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь каждая дробинка может пройти насквозь через #{skill_color}#1## врага и наносит #{skill_color}#$skill_value_b1## урона через броню.\n\nПИКОВЫЙ: #{owned}#$pro##\nТочность и дальнобойность #{skill_color}#дробовиков и огнеметов## увеличена на #{skill_color}#$skill_value_p1## при прицеливании.",

				--Gung Ho
				["menu_close_by_beta_sc"] = "Беги и стреляй",
				["menu_close_by_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете стрелять из #{skill_color}#дробовиков и огнеметов## от бедра во время бега и не имеете задержки на стрельбу после бега.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаша скорострельность увеличена на #{skill_color}#$skill_value_p1## при стрельбе от бедра из #{skill_color}#дробовиков и огнеметов.##",

				--Overkill
				["menu_overkill_sc"] = "OVERKILL",
				["menu_overkill_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУбийство из #{skill_color}#дробовика, огнемета или пилы OVE9000## увеличивает их урон на #{skill_color}#$skill_value_b1## на #{skill_color}#$skill_value_b2## секунды, если они были выполнены до начала #{skill_color}#падения урона##.\n\n#{risk}#Навык не сработает, если противник был убит## #{important_1}#взрывом или уроном-через-время.##\n\nПИКОВЫЙ: #{owned}#$pro##\nБонус к урону теперь работает на все оружие и действует #{skill_color}#$skill_value_p1## секунд. Навык должен быть активирован убийством из #{skill_color}#дробовика, огнемета или пилы OVE9000.##\n\n#{risk}#Бонус не работает на гранатометы и ракетометы.##\n\nВы убираете и достаете #{skill_color}#дробовики, огнеметы и пилу## на #{skill_color}#$skill_value_p2## быстрее.",

			--[[   JUGGERNAUT SUBTREE   ]]--
				--Stun Resistance--
				["menu_oppressor_beta_sc"] = "Стойкий",
				["menu_oppressor_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВражеские удары в ближнем бою отталкивают на #{skill_color}#$skill_value_b1## меньше за каждое очко брони.\n\nПИКОВЫЙ: #{owned}#$pro##\nУменьшает ослепление от светошумовых гранат на #{skill_color}#$skill_value_p1.##",

				--Die Hard
				["menu_show_of_force_sc"] = "Крепкий орешек",
				["menu_show_of_force_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#$skill_value_b1## устойчивости.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных #{skill_color}#$deflection## и накладывается после всех остальных бонусов.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете еще #{skill_color}#$skill_value_p1## устойчивости.",

				--Transporter
				["menu_pack_mule_beta_sc"] = "Перевозчик",
				["menu_transporter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЗа каждые #{skill_color}#10## очков брони штраф на передвижение с сумкой уменьшается на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно бегать с любой сумкой.\n\n#{risk}#Штраф на скорость передвижения с сумкой остается.##",

				--More Blood to Bleed--
				["menu_iron_man_beta_sc"] = "Груда мышц",
				["menu_iron_man_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#$skill_value_b1## больше здоровья.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете еще на #{skill_color}#$skill_value_p1## больше здоровья.",

				--Bullseye--
				["menu_prison_wife_beta_sc"] = "В яблочко",
				["menu_prison_wife_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПопадания в голову восстанавливают #{skill_color}#$skill_value_b1## брони раз в #{important_1}#$skill_value_b2## секунд.\n\nУбийства в голову уменьшают перезарядку навыка на #{skill_color}#$skill_value_b3## секунды. $anarc_disable\n\n\nПИКОВЫЙ: #{owned}#$pro##\nПопадания в голову восстанавливают еще #{skill_color}#$skill_value_p1## брони каждые #{important_1}#$skill_value_b2## секунд.\n\nУбийства в голову уменьшают перезарядку навыка еще на #{skill_color}#$skill_value_p2## секунды. $anarc_disable\n",

				--Iron Man
				["menu_juggernaut_beta_sc"] = "Железный человек",
				["menu_juggernaut_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nОткрывает возможность носить #{skill_color}#Улучшенный комбинированный тактический бронежилет.##\n\nПри ударе Щитов оружием ближнего боя, они отбрасываются от вашей силы.\n#{risk}#Не работает против## #{important_1}#Титановых Щитов## #{risk}#и## #{important_1}#Капитана Винтерса.##\n\nПИКОВЫЙ: #{owned}#$pro##\nОгнестрельное оружие получает шанс отбросить Щиты. Шанс отбрасывания зависит от урона оружия.\n\nВаша броня восстанавливается на #{skill_color}#$skill_value_p1## быстрее. $anarc_disable",

			--[[   SUPPORT SUBTREE   ]]--
				--Scavenger
				["menu_scavenging_sc"] = "Мародер",
				["menu_scavenging_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает расстояние подбора патронов на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nС каждого #{skill_color}#$skill_value_p1 - го## убитого противника выпадет дополнительная коробка патронов.",

				--Bulletstorm--
				["menu_ammo_reservoir_beta_sc"] = "Свинцовый ливень",
				["menu_ammo_reservoir_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСумки с патронами дают возможность стрелять бесконечно до #{skill_color}#5## секунд после использования сумки.\n\nЧем больше патронов восстановлено, тем дольше будет эффект.\n\n#{risk}#Гранатометы, ракетометы и прочее взрывчатое оружие не получают эффекта.##\n\nПИКОВЫЙ: #{owned}#$pro##\nДлительность способности увеличена до #{skill_color}#15## секунд.",

				--Specialist Equipment formally Rip and Tear
				["menu_portable_saw_beta_sc"] = "Спецоборудование",
				["menu_portable_saw_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает прочность пилы OVE9000 на #{skill_color}#50%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nПилы, арбалеты, луки, гранатометы и ракетометы перезаряжаются на #{skill_color}#$skill_value_p1## быстрее.",

				--Extra Lead
				["menu_ammo_2x_beta_sc"] = "Поставщик боеприпасов",
				["menu_ammo_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nОбъем сумки с патронами увеличен на #{skill_color}#$skill_value_b1##.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить #{skill_color}#$skill_value_p1## сумки с патронами вместо одной.",

				--Rip and Tear formally Carbon Blade
				["menu_carbon_blade_beta_sc"] = "Рвать и метать",
				["menu_carbon_blade_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПила OVE9000 теперь распиливает щиты.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийства пилой, арбалетами, луками, гранатометами и ракетометами имеют #{skill_color}#$skill_value_p1## шанс посеять панику среди врагов на расстоянии #{skill_color}#$skill_value_p2## метров.\n\n#{risk}#Паника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.##",

				--Fully Loaded--
				["menu_bandoliers_beta_sc"] = "Вооружен до зубов",
				["menu_bandoliers_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаш общий запас патронов увеличен на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы подбираете на #{skill_color}#$skill_value_p1## больше патронов из коробочек.\n\nВаш шанс получить метательное оружие из коробочки патронов увеличено на #{skill_color}#$skill_value_p2##; шанс увеличивается еще на #{skill_color}#$skill_value_p3## за каждый подбор. Шанс обнуляется, когда вы получаете метательное оружие из коробочки.\n\n#{risk}#Не работает на метательное оружие из перков.##",

		--[[   TECHNICIAN   ]]--

			--[[   FORTRESS SUBTREE   ]]--
				--Logistician
				["menu_defense_up_beta_sc"] = "Логист",
				["menu_defense_up_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы взаимодействуете со снаряжением на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь Вы взаимодействуете и ставите снаряжение на #{skill_color}#$skill_value_p1## быстрее.\nВаши члены команды взаимодействуют и ставят снаряжение на #{skill_color}#$skill_value_p2## быстрее.\n\n#{risk}#Примечание: Командные навыки не складываются, если несколько игроков имеют этот навык.##",

				--Nerves of Steel--
				["menu_fast_fire_beta_sc"] = "Стальные нервы",
				["menu_fast_fire_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете возможность #{skill_color}#прицеливаться во время падения.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете на #{skill_color}#$skill_value_p1## меньше урона во время любого взаимодействия.",

				--Engineering
				["menu_eco_sentry_beta_sc"] = "Инженер",
				["menu_eco_sentry_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши турели наносят на #{skill_color}#$skill_value_b1## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши турели получают на #{skill_color}#$skill_value_p1## больше здоровья.",

				--Jack of all Trades
				["menu_jack_of_all_trades_beta_sc"] = "Мастер на все руки",
				["menu_jack_of_all_trades_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы носите на #{skill_color}#$skill_value_b1## больше метательного оружия.\n\nПИКОВЫЙ: #{owned}#$pro##\n##Вы можете носить с собой второе оборудование.## Нажмите клавишу #{skill_color}#$BTN_CHANGE_EQ## чтобы переключиться на другое оборудование.\n\nВторое оборудование содержит на #{important_1}#50%## меньше использований, минимум - #{skill_color}#1.##",

				--Sentry Tower Defense--
				["menu_tower_defense_beta_sc"] = "Круговая оборона",
				["menu_tower_defense_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно использовать бронебойные патроны на турелях, которые уменьшают их скорострельность на #{skill_color}#66%## и позволяют им пробивать врагов и щиты.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете ставить #{skill_color}#$skill_value_p1## турели.\n\nТурели теперь стоят #{skill_color}#35%## вашего боезапаса.",

				--Bulletproof--
				["menu_iron_man_sc"] = "Пуленепробиваемый",
				["menu_iron_man_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВашу броню теперь нельзя прошить.\n\nПИКОВЫЙ: #{owned}#$pro##\nПока ваша броня полностью заполнена, любой полученный урон уменьшится на число, равное #{skill_color}#$skill_value_p1## от вашей максимальной брони.\n\nВаша броня восстанавливается на #{skill_color}#$skill_value_p2## быстрее. $anarc_disable",

			--[[   BREACHER SUBTREE   ]]--
				--Silent Drilling--
				["menu_hardware_expert_beta_sc"] = "Бесшумная дрель",
				["menu_hardware_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши #{skill_color}#дрели и пилы теперь бесшумны##. Гражданским и охранникам нужно увидеть дрель или пилу, чтобы поднять тревогу.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы чините дрели и пилы на #{skill_color}#$skill_value_p1## быстрее.",

				--Demoman
				["menu_trip_mine_expert_beta_sc"] = "Подрывник",
				["menu_combat_engineering_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно ставить до #{skill_color}#6## кумулятивных зарядов.\n\nВы ставите кумулятивные заряды и мины на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно ставить до #{skill_color}#8## кумулятивных зарядов.\n\nРадиус взрыва ваших мин увеличен на #{skill_color}#$skill_value_p1.##",

				--Drill Sawgeant
				["menu_drill_expert_beta_sc"] = "Бурный взлом",
				["menu_drill_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЭффективность вашей дрели и пилы увеличена на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nЭффективность вашей дрели и пилы увеличена еще на #{skill_color}#$skill_value_p1.##",

				--Fire Trap--
				["menu_more_fire_power_sc"] = "Зажигательная ловушка",
				["menu_more_fire_power_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши мины оставляют на месте взрыва огненную лужу в течение #{skill_color}#10## секунд в радиусе #{skill_color}#7.5## метров.\n\nОгонь не наносит урона вам и команде.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно носить #{skill_color}#10## мин.\n\nВаши мины наносят на #{skill_color}#50%## больше урона.",

				--Expert Hardware
				["menu_kick_starter_beta_sc"] = "Техэксперт",
				["menu_kick_starter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВаши дрели и пилы получают #{skill_color}#$skill_value_b1## шанс на автоматическую починку.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаши дрели и пилы получают еще #{skill_color}#$skill_value_p1## к шансу на автоматическую починку.\n\nВраги, которые пытаются сломать вашу дрель, имеют #{skill_color}#$skill_value_p2## шанс получить электроразряд, останавливая их попытку.",

				--Kickstarter
				["menu_fire_trap_beta_sc"] = "С толкача",
				["menu_fire_trap_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете возможность чинить дрель или пилу ударом холодного оружия.\n\nУ вас #{skill_color}#1## попытка на каждую поломку с шансом #{skill_color}#75%.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы #{skill_color}#больше не убираете оружие при взаимодействии.##\n\nВы можете оглядываться, приседать, двигаться, целиться и использовать оружие, пока держите кнопку и остаетесь в зоне взаимодействия.",

			--[[   COMBAT ENGINEER SUBTREE   ]]--
				--Sharpshooter--
				["menu_discipline_sc"] = "Крепкий хват",
				["menu_discipline_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Винтовки## получают #{skill_color}#$skill_value_b1## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nУбийства в голову из #{skill_color}#винтовок## в режиме одиночной стрельбы или очередями увеличивают вашу скорострельность на #{skill_color}#$skill_value_p1## в течение #{skill_color}#$skill_value_p2## секунд.",

				--Rifleman
				["menu_rifleman_sc"] = "Пехотинец",
				["menu_rifleman_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Винтовки## получают на #{skill_color}#$skill_value_b1## больше точности и дальнобойности во время прицеливания.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Винтовки## получают еще на #{skill_color}#$skill_value_p1## больше точности и дальнобойности во время прицеливания.\n\nСкорость прицеливания и задержка после бега быстрее и меньше соответственно на #{skill_color}#$skill_value_p2##.",

				--Kilmer--
				["menu_heavy_impact_beta_sc"] = "Килмер",
				["menu_heavy_impact_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШтраф на точность во время передвижения для #{skill_color}#винтовок## уменьшен на #{skill_color}#$skill_value_b1##.\n\nШтраф на точность во время передвижения зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Винтовки## перезаряжаются на #{skill_color}#$skill_value_p1## быстрее.",

				--Ammo Efficiency--
				["menu_single_shot_ammo_return_sc"] = "Эффективный расход",
				["menu_single_shot_ammo_return_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#$skill_value_b1## убийства в голову из #{skill_color}#винтовок## в течение #{skill_color}#$skill_value_b2## секунд восстановят #{skill_color}#$skill_value_b3## от вашего боезапаса (минимум #{skill_color}#1## патрон).\n\nПИКОВЫЙ: #{owned}#$pro##\nНавык теперь срабатывает после #{skill_color}#$skill_value_p1## убийств в голову в течение #{skill_color}#$skill_value_p2## секунд.",

				--Aggressive Reload
				["menu_engineering_beta_sc"] = "Агрессивная перезарядка",
				["menu_engineering_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУбийства в голову из #{skill_color}#винтовок## в режиме одиночной стрельбы или очередями увеличивают скорость перезарядки на #{skill_color}#$skill_value_b1## в течение #{skill_color}#$skill_value_b2## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nБонус к скорости перезарядки увеличен до #{skill_color}#$skill_value_p1## и может быть получен в любом режиме стрельбы.",

				--Mind Blown, formerly Explosive Headshot--
				["menu_kilmer_sc"] = "Рикошет",
				["menu_kilmer_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПопадания в голову из #{skill_color}#винтовок## в режиме одиночной стрельбы или очередями наносят #{skill_color}#$skill_value_b1## урона ближайшему врагу в радиусе #{skill_color}#$skill_value_b2## метров.\n\nЗа каждые #{skill_color}#$skill_value_b3## метров, в которых вы находитесь от врага, эффект перебрасывается на еще одного врага, до #{skill_color}#$skill_value_b4## раз.\n\nПИКОВЫЙ: #{owned}#$pro##\nПопадания в голову из #{skill_color}#винтовок## в режиме одиночной стрельбы или очередями #{skill_color}#не теряют урон с расстоянием.## Радиус навыка увеличен на #{skill_color}#$skill_value_p1## метр.\n\nЗа каждые #{skill_color}#$skill_value_b3## метров от врага, эффект наносит дополнительные #{skill_color}#$skill_value_p2## урона; вплоть до #{skill_color}#$skill_value_p3## урона.",

		--[[   GHOST   ]]--

			--[[   SHINOBI SUBTREE   ]]--
				--Alert--
				["menu_jail_workout_sc"] = "Меченный",
				["menu_jail_workout_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВраги остаются помеченными на #{skill_color}#100%## дольше.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно #{skill_color}#автоматически помечать## охранников, особых и титановых врагов в #{skill_color}#40## метрах от вас с помощью прицеливания.\n\n#{risk}#Охранники помечаются только до тревоги.##",

				--Sixth Sense--
				["menu_chameleon_beta_sc"] = "Шестое чувство",
				["menu_chameleon_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы #{skill_color}#автоматически помечаете## всех врагов в радиусе #{skill_color}#10## метров, если стоите на месте в течение #{skill_color}#3.5## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#доступ ко всем инсайдерским активам.##",

				--ECM Overdrive--
				["menu_cleaner_beta_sc"] = "Электронный взломщик",
				["menu_cleaner_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nГенератор помех теперь #{skill_color}#может открывать некоторые электронные двери.##\n\nПИКОВЫЙ: #{owned}#$pro##\nДлительность генератора помех увеличена на #{skill_color}#25%.##\n\n##Пейджеры теперь удерживаются помехами.##",

				--Nimble--
				["menu_second_chances_beta_sc"] = "Шустрые пальцы",
				["menu_second_chances_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно #{skill_color}#бесшумно взламывать сейфы вручную.##\n\nВы взаимодействуете со всеми компьютерами, камерами и генераторами помех на #{skill_color}#30%## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы взламываете все замки на #{skill_color}#50%## быстрее.\n\nВы взаимодействуете со всеми компьютерами, камерами и генераторами помех еще на #{skill_color}#50%## быстрее.",

				--ECM Specialist--
				["menu_ecm_booster_beta_sc"] = "Специалист по помехам",
				["menu_ecm_booster_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nТеперь можно носить #{skill_color}#3## Генератора помех.\n\nПИКОВЫЙ: #{owned}#$pro##\nТеперь можно носить #{skill_color}#4## Генератора помех.",

				--Spotter--
				["menu_ecm_2x_beta_sc"] = "Шестерка",
				["menu_ecm_2x_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВраги, отмеченные вами, получают на #{skill_color}#$skill_value_b1## больше урона на расстоянии дальше #{skill_color}#$skill_value_b2## метров.\n\nПИКОВЫЙ: #{owned}#$pro##\nВраги, отмеченные вами, получают на #{skill_color}#35%## больше урона с любого расстояния, от любого оружия.",

			--[[   ARTFUL DODGER SUBTREE   ]]--
				--Duck and Cover--
				["menu_sprinter_beta_sc"] = "Пригнись и укройся",
				["menu_sprinter_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСтамина восстанавливается на #{skill_color}#$skill_value_b1## раньше и на #{skill_color}#$skill_value_b2## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВаш уворот заполняется на #{skill_color}#$skill_value_p1## за каждую секунду в приседе.\n\nВы двигаетесь на #{skill_color}#$skill_value_p2## быстрее в приседе.",

				--Evasion--
				["menu_awareness_beta_sc"] = "Атлет",
				["menu_awareness_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы двигаетесь на #{skill_color}#$skill_value_b1## быстрее.\n\nУрон от падений с высоты уменьшен на #{skill_color}#$skill_value_b2.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете перезаряжаться во время бега.\n\n#{item_stage_2}#Чтобы отменять перезарядку при помощи кнопки бега, включите соответствующую опцию в настройках Restoration Mod.##",

				--Deep Pockets--
				["menu_thick_skin_beta_sc"] = "Широкие карманы",
				["menu_thick_skin_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУвеличивает компактность оружия ближнего боя на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает компактность баллистических жилетов на #{skill_color}#$skill_value_p1##, а всей остальной брони на #{skill_color}#$skill_value_p2.##",

				--Moving Target--
				["menu_dire_need_beta_sc"] = "Подвижная мишень",
				["menu_dire_need_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы двигаетесь на #{skill_color}#$skill_value_b1## быстрее за каждые #{skill_color}#$skill_value_b2## очка нагрузки ниже #{skill_color}#$skill_value_b3##, до максимальных #{skill_color}#$skill_value_b4## скорости.\n\nВы передвигаетесь на #{skill_color}#$skill_value_b5## быстрее при прицеливании.\n#{risk}#Скорость передвижения в прицеливании не может превышать вашу максимальную.##\n\n\nПИКОВЫЙ: #{owned}#$pro##\nВы двигаетесь на #{skill_color}#$skill_value_p1## быстрее за каждое #{skill_color}#$skill_value_p2## очко нагрузки ниже #{skill_color}#$skill_value_p3##, до максимальных #{skill_color}#$skill_value_p4## скорости.\n\nВаш уворот заполняется на #{skill_color}#$skill_value_p5## за каждую секунду бега и на #{skill_color}#$skill_value_p6## за каждую секунду на зиплайне.",

				--Shockproof
				["menu_insulation_beta_sc"] = "Заземленный",
				["menu_insulation_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nШоковая атака Тазера больше не заставляет вас стрелять и имеет #{skill_color}#15%## шанс отскочить от вас, оглушая Тазера.\n\n#{risk}#Не отменяет штрафов на точность и урон во время шоковой атаки.##\n\nОтталкивание от попаданий по вам уменьшено на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВзаимодействие с вражеским Тазером в течение #{skill_color}#$skill_value_p1## секунд после шоковой атаки контр-атакует его, нанося #{skill_color}#$skill_value_p2## урона его здоровью.\n\nЗамедление от атак Титановых Тазеров уменьшено на #{skill_color}#50%.##",

				--Sneaky Bastard--
				["menu_jail_diet_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#$skill_value_b1## очко уворота за каждые #{skill_color}#$skill_value_b2## очка нагрузки ниже #{skill_color}#$skill_value_b3## до максимальных #{skill_color}#$skill_value_b4## уворота.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#$skill_value_b1## очко уворота за каждое #{skill_color}#$skill_value_p1## очко нагрузки ниже #{skill_color}#$skill_value_b3## до максимальных #{skill_color}#$skill_value_b4## уворота.\n\nКогда ваша броня ломается, уворот от атаки восстанавливает #{skill_color}#$skill_value_p2## вашего здоровья. Это может произойти только один раз, пока ваша броня снова не сломается.",

			--[[   SILENT KILLER SUBTREE   ]]--
				--Second Wind
				["menu_scavenger_beta_sc"] = "Второе дыхание",
				["menu_scavenger_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда ваша броня ломается, ваша скорость увеличивается на #{skill_color}#$skill_value_b1## на #{skill_color}#$skill_value_b2## секунды.\n\nПИКОВЫЙ: #{owned}#$pro##\nКогда ваша броня полностью сломана, первый выстрел оглушит противника.\n\nЭтот эффект остается на #{skill_color}#$skill_value_p1## секунды после регенерации брони.",

				--Optical Illusions--
				["menu_optic_illusions_sc"] = "Оптические иллюзии",
				["menu_optic_illusions_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы достаете и прячете оружие на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nКомпактность всего оружия увеличена на #{skill_color}#$skill_value_p1.##",

				--The Professional--
				["menu_silence_expert_beta_sc"] = "Профессионал",
				["menu_silence_expert_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы прицеливаетесь на #{skill_color}#$skill_value_b1## быстрее, а ваша задержка после бега уменьшена на #{skill_color}#$skill_value_b1##.\n\nПИКОВЫЙ: #{owned}#$pro##\nБонусы на прицеливание и задержку после бега увеличены еще на #{skill_color}#$skill_value_p1##.\n\nУбийство особых и титановых врагов огнестрельным оружием предоставляет дополнительную пачку патронов.",

				--Unseen Strike, formally Dire Need--
				["menu_backstab_beta_sc"] = "Удар исподтишка",
				["menu_backstab_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЕсли вам не наносится урон в течение #{skill_color}#$skill_value_b1## секунд, то вы получите #{skill_color}#$skill_value_b2## шанс критического попадания, пока по вам не нанесут урон.\n\nКритические попадания наносят на #{skill_color}#50%## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nКритический шанс теперь остается на #{skill_color}#$skill_value_p1## секунды после получения урона.",

				--Cleaner--
				["menu_hitman_beta_sc"] = "Чистильщик",
				["menu_hitman_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы наносите на #{skill_color}#$skill_value_b1## больше урона по особым и элитным врагам.\n\n#{risk}#Не действует на ракетометы и гранатометы.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы наносите еще #{skill_color}#$skill_value_p1## дополнительного урона по особым и элитным врагам.\n\nУбийство врага в голову заполнит вашу полоску уворота на #{skill_color}#$skill_value_p2##; убийство сзади заполнят ее на #{skill_color}#$skill_value_p3##; этот эффект складывается с убийством в голову.\n\n#{risk}#Убийства при помощи## #{important_1}#взрывов, огня и при нанесении урона через время## #{risk}#не считаются.##",

				--Low Blow--
				["menu_unseen_strike_beta_sc"] = "Подлый прием",
				["menu_unseen_strike_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете #{skill_color}#$skill_value_b1## шанс критического попадания за каждые #{skill_color}#$skill_value_b2## очка нагрузки ниже #{skill_color}#$skill_value_b3##, до максимального шанса #{skill_color}#$skill_value_b4.##\n\nКритические попадания наносят на #{skill_color}#50%## больше урона.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#$skill_value_p1## шанс критического попадания за каждое #{skill_color}#$skill_value_p2## очко нагрузки ниже #{skill_color}#$skill_value_p3##, до максимального шанса #{skill_color}#$skill_value_p4.##\n\nВаш шанс критического попадания увеличивается на #{skill_color}#$skill_value_p5## при атаках сзади.",

		--[[   FUGITIVE   ]]--

			--[[   GUNSLINGER SUBTREE   ]]--
				--Equilibrium--
				["menu_equilibrium_beta_sc"] = "Эквилибриум",
				["menu_equilibrium_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nСтабильность #{skill_color}#пистолетов## для вас и вашей команды увеличена на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\nВы достаете и прячете #{skill_color}#пистолеты## на #{skill_color}#$skill_value_p1## быстрее.",

				--Gun Nut--
				["menu_dance_instructor_sc"] = "Пистолетный маньяк",
				["menu_dance_instructor_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУменьшает разлет пуль при стрельбе от бедра из #{skill_color}#пистолетов## на #{skill_color}#$skill_value_b1.##\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Пистолеты## стреляют на #{skill_color}#$skill_value_p1## быстрее.\n\n#{skill_color}#Пистолеты## наносят #{skill_color}#$skill_value_p2## урона через броню.",

				--Over Pressurized/Gunfighter--
				["menu_gun_fighter_sc"] = "Ковбой",
				["menu_gun_fighter_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\n#{skill_color}#Пистолеты## перезаряжаются на #{skill_color}#$skill_value_b1## быстрее.\n\nШтраф к точности при стрельбе во время движения уменьшен на #{skill_color}#$skill_value_b2## для пистолетов.\n\nУменьшение штрафа на точность зависит от стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\n#{skill_color}#Пистолеты## перезаряжаются еще на #{skill_color}#$skill_value_p2## быстрее.",

				--Akimbo--
				["menu_akimbo_skill_sc"] = "Акимбо",
				["menu_akimbo_skill_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПарное оружие получает #{skill_color}#$skill_value_b1## стабильности.\n\nПИКОВЫЙ: #{owned}#$pro##\nПарное оружие получает #{skill_color}#$skill_value_p1## точности.",

				--Desperado--
				["menu_expert_handling_sc"] = "Меткий стрелок",
				["menu_expert_handling_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждое убийство в голову из #{skill_color}#пистолета## дает #{skill_color}#$skill_value_b1## бонус к точности и дальнобойности на #{skill_color}#$skill_value_b2## секунды. Этот эффект накладывается до #{skill_color}#$skill_value_b3## раз, а длительность обновляется при каждом выстреле в голову.\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает длительность бонуса к точности и дальнобойности до #{skill_color}#$skill_value_p1## секунд.",

				--Trigger Happy--
				["menu_trigger_happy_beta_sc"] = "Неудержимый стрелок",
				["menu_trigger_happy_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКаждый выстрел в голову из #{skill_color}#пистолета## дает дополнительные #{skill_color}#$skill_value_b1## урона на #{skill_color}#$skill_value_b2## секунды. Этот эффект накладывается до #{skill_color}#$skill_value_b3## раз, а длительность обновляется при каждом выстреле в голову.\n\nПИКОВЫЙ: #{owned}#$pro##\nУвеличивает длительность бонуса к урону до #{skill_color}#$skill_value_p1## секунд. Эффект теперь накладывается еще #{skill_color}#$skill_value_p2## раз.",

			--[[   REVENANT SUBTREE   ]]--
				--Running From Death--
				["menu_nine_lives_beta_sc"] = "Бегущий от смерти",
				["menu_nine_lives_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы передвигаетесь на #{skill_color}#$skill_value_b1## быстрее в течение #{skill_color}#$skill_value_b2## секунд после поднятия.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете #{skill_color}#$skill_value_p1## сопротивления урону на #{skill_color}#$skill_value_p2## секунд после поднятия.\n\nВаше оружие автоматически перезаряжается после поднятия.",

				--Undying--
				["menu_running_from_death_beta_sc"] = "Неумирающий",
				["menu_running_from_death_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#$skill_value_b1## больше здоровья при падении.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы получаете еще #{skill_color}#$skill_value_p1## здоровья при падении.\n\nВы можете использовать основное оружие при падении.",

				--What Doesn't Kill You Only Makes You Stronger--
				["menu_what_doesnt_kill_beta_sc"] = "Что тебя не убивает",
				["menu_what_doesnt_kill_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПолучаемый урон уменьшается на #{skill_color}#$skill_value_b1## очко за каждое падение, которое приближает вас к аресту. \n\nПИКОВЫЙ: #{owned}#$pro##\nПолучаемый урон всегда уменьшается на #{skill_color}#$skill_value_p1## очка.",

				--Swan Song
				["menu_perseverance_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда ваше здоровье опускается до #{important_1}#0##, вы не мгновенно падаете, а можете сражаться еще #{skill_color}#$skill_value_b1## секунды с #{important_1}#60%## штрафом на скорость.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы можете сражаться еще на #{skill_color}#$skill_value_p1## секунд дольше.",

				--Haunt--
				["menu_haunt_sc"] = "Пугало",
				["menu_haunt_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nУбийство врагов, находящихся на расстоянии ближе #{skill_color}#18## метров имеет #{skill_color}#$skill_value_b1## шанс посеять панику на #{skill_color}#12## метров вокруг Вас за каждое падение, которое приближает вас к аресту.\n\n#{risk}#Паника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.##\n\nПИКОВЫЙ: #{owned}#$pro##\nШанс паники всегда увеличен на #{skill_color}#$skill_value_p1##.",

				--Messiah--
				["menu_pistol_beta_messiah_sc"] = "Мессия",
				["menu_pistol_beta_messiah_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nПри падении, убийство врага позволит вам встать самостоятельно. У вас есть только #{skill_color}#1## шанс сделать это, который восстановится при выходе из под ареста.\n\nВы можете упасть еще #{skill_color}#1## раз прежде чем попадете под арест.\n\nПИКОВЫЙ: #{owned}#$pro##\nМессию теперь можно использовать сколько угодно раз, но с задержкой в #{skill_color}#120## секунд. Убийства во время падения уменьшают задержку на #{skill_color}#10## секунд.",

			--[[   BRAWLER SUBTREE   ]]--
				--Martial Arts--
				["menu_martial_arts_beta_sc"] = "Боевые искусства",
				["menu_martial_arts_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы получаете на #{skill_color}#$skill_value_b1## меньше урона от всех атак в ближнем бою (из-за тренировок).\n\nПИКОВЫЙ: #{owned}#$pro##\nНокдаун холодного оружия увеличен на #{skill_color}#$skill_value_p1## (из-за тренировок).\n\n#{risk}#Нокдаун определяет, с каким шансом вы оглушите врага, а также сколько урона вы наносите броне Бульдозера.##",

				--Counter-Strike--
				["menu_drop_soap_beta_sc"] = "Контр-удар",
				["menu_drop_soap_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы можете парировать прыжки Клокеров при помощи холодного оружия. Это столкнет их на землю.\n\nВы получаете на #{skill_color}#$skill_value_b1## меньше урона от ударов Клокеров и атак Тазеров.\n\nПИКОВЫЙ: #{owned}#$pro##\n\nТеперь вы можете парировать все особые атаки Клокеров при помощи холодного оружия.\nДальнобойный урон по вам уменьшен на #{skill_color}#$skill_value_p1## когда вы достаете оружие ближнего боя.\n\nВы получаете еще на #{skill_color}#$skill_value_p2## меньше урона от ударов Клокеров и атак Тазеров.",

				--Pumping Iron--
				["menu_steroids_beta_sc"] = "Накачанный",
				["menu_steroids_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nВы атакуете и замахиваетесь оружием ближнего боя на #{skill_color}#$skill_value_b1## быстрее.\n\nПИКОВЫЙ: #{owned}#$pro##\nВы атакуете и замахиваетесь оружием ближнего боя еще на #{skill_color}#$skill_value_p1## быстрее.",

				--Bloodthirst--
				["menu_bloodthirst_sc"] = "Кровожадность",
				["menu_bloodthirst_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nКогда вы убиваете врага в ближнем бою, вы получаете #{skill_color}#$skill_value_b1## бонус к скорости перезарядки на #{skill_color}#$skill_value_b2## секунд.\n\nПИКОВЫЙ: #{owned}#$pro##\nКаждое убйиство увеличивает урон следующей атаки в ближнем бою на #{skill_color}#25%##, до максимальных #{skill_color}#100%.##\n\nЭтот эффект обнуляется, когда вы наносите удар в ближнем бою.",

				--Frenzy--
				["menu_wolverine_beta_sc"] = "Неистовый",
				["menu_wolverine_beta_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЧем больше у вас здоровья, тем меньше вы восстанавливаете здоровья, до #{important_1}#30%## лечения.\n\nЧем меньше у вас здоровья, тем больше у вас устойчивости, до #{skill_color}#$skill_value_b1##.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных #{skill_color}#$deflection## и накладывается после всех остальных бонусов.\n\nПИКОВЫЙ: #{owned}#$pro##\nЛечение уменьшается до #{important_1}#75%##, а устойчивость увеличивается до #{skill_color}#$skill_value_p1.##",

				--Berserker--
				["menu_frenzy_sc"] = "Берсерк",
				["menu_frenzy_desc_sc"] = "БАЗОВЫЙ: #{owned}#$basic##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье ниже #{skill_color}#100%##, вы будете наносить до #{skill_color}#$skill_value_b1## дополнительного урона пилой и оружием ближнего боя.\n\nПИКОВЫЙ: #{owned}#$pro##\nЧем меньше у вас здоровья, тем больше урона вы наносите.\n\nКогда ваше здоровье ниже #{skill_color}#100%##, вы будете наносить до #{skill_color}#$skill_value_p1## дополнительного урона огнестрельным оружием.\n\n#{risk}#Не работает на гранатометы и ракетометы.##"

	})

	if not easterless then
	 local butt = math.rand(1)
	 local frame = 0.01
	 if Month == "4" and Day == "1" then
		frame = 1
	 end
	 if butt <= frame then
		 LocalizationManager:add_localized_strings({
			["menu_st_spec_23"] = "Полурак-полухуй",
			--["menu_st_spec_23_desc"] = "Who nurtures you in your times of rest? Who restores your battle-torn body, day after day after day? Whose milk enriches your kindred flesh with endless strength and vigor?\n\n\n#{important_1}#It can only be me.##",
			["menu_difficulty_sm_wish"] = "Залупа Иваныча", -- хз че придумать. Может ЗИ?
			["menu_risk_sm_wish"] = "Чувак. Ты думал что-то здесь будет? О, нет. От тебя ваниллой воняет, даже отсюда чувствую. Выходи, выходи с хаиста и иди нахуй. Друг крутой, а ты лоханулся."
		 })
	 end
	end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Уворот",
		["menu_st_category_all"] = "Все перки",
		["menu_st_category_offensive"] = "Нападение",
		["menu_st_category_defensive"] = "Защита",
		["menu_st_category_supportive"] = "Поддержка",
		["menu_st_category_favorites"] = "Избранные",
		["menu_specialization_tier"] = "Карта",
		["menu_specialization_key_but_deck"] = "Разблокировать",
		["menu_specialization_key_favorite"] = "В избранное",
		["menu_st_category_activated"] = "Включаемые",
		["menu_st_category_challenge"] = "Пустые",
		["menu_st_category_mod"] = "Моды",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Увеличивает урон в голову на ##25%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатометам и ракетометам.",
		["menu_deckall_4_desc_sc"] = "Вы получаете ##+1## к компактности.\n\nПри ношении брони ваша скорость штрафуется на ##15%## меньше.\n\nВы получаете на ##45%## больше опыта при выполнении ограблений.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатометам и ракетометам.",
		["menu_deckall_6_desc_sc"] = "Открывает Кейс с метательным оружием в качестве оборудования. Кейс с метательным оружием используется, чтобы восполнить запас метательного оружия во время ограбления.\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатометам и ракетометам.",
		["menu_deckall_8_desc_sc"] = "Увеличивает скорость взаимодействия с сумкой с медикаментами на ##20%.##\n\nВы наносите на ##25%## больше урона. Не относится к метательному оружию, гранатометам и ракетометам.",

		--Crook--
		["menu_deck6_1_desc_sc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.\n\nПри ношении баллистических жилетов, ваша броня увеличена на ##$perk_value_2##.",
		["menu_deck6_3_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck6_5_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена еще на ##$perk_value_1##.\n\nВы взламываете замки на ##$perk_value_2## быстрее.",
		["menu_deck6_7_desc_sc"] = "При ношении баллистических жилетов, ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck6_9_desc_sc"] = "При ношении баллистических жилетов, ваша броня увеличена еще на ##$perk_value_1##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.\n\nВы переключаете оружие на ##$perk_value_2## быстрее.",
		["menu_deck4_3_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck4_5_desc_sc"] = "Ваша полоска уворота будет заполнена на ##$perk_value_1## после поднятия.\n\nВы зацикливаете камеры на ##$perk_value_2## секунд дольше.",
		["menu_deck4_7_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck4_9_desc_sc"] = "Уворот от атаки восстанавливает ##$perk_value_1## очко здоровья каждую секунду в течение ##$perk_value_2## секунд. Этот эффект может складываться, но бонус потеряется, если вы получите урон по здоровью.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "Ган-фу",
		["menu_deck5_3_sc"] = "Тренированный убийца",
		["menu_deck5_5_sc"] = "Убийство карандашом",
		["menu_deck5_7_sc"] = "Эксперт",


		["menu_deck5_1_desc_sc"] = "Убийство врагов огнестрельным оружием добавляет ##$perk_value_1## запасного здоровья. Вы можете получить до ##$perk_value_2## запасного здоровья.\n\nУбийство врага оружием ближнего боя превращает запасное здоровье во временное здоровье, которое утекает со скоростью ##$perk_value_3## единиц в секунду.\n\nВременное здоровье может превышать ваше максимальное здоровье, но вы не можете иметь больше ##$perk_value_4## временного здоровья за раз.",
		["menu_deck5_3_desc_sc"] = "Ваша полоска уворота заполняется на ##$perk_value_1## при восстановлении брони.\n\nВы получаете ##5## уворота.",
		["menu_deck5_5_desc_sc"] = "Вы можете получить на ##$perk_value_1## больше запасного здоровья.\n\nВы носите на ##$perk_value_2## мешок для тел больше.",
		["menu_deck5_7_desc_sc"] = "Вы получаете ##$perk_value_1## временного здоровья при поднятии.\n\nВы получаете дополнительные ##$perk_value_2## очков уворота.",
		["menu_deck5_9_desc_sc"] = "Пока у вас есть временное здоровье, вы получаете ##$perk_value_1## устойчивости и ##$perk_value_2## бонус к скорости передвижения.\n\nУстойчивость уменьшает урон по вашему здоровью, до максимальных ##$perk_value_3## и накладывается после всех остальных бонусов.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Muscle
		["menu_deck2_1_desc_sc"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck2_3_desc_sc"] = "Ваше здоровье увеличено еще на ##$perk_value_1##.\n\nВаш уворот увеличен на ##$perk_value_2## очков.",
		["menu_deck2_5_desc_sc"] = "Ваше здоровье увеличено еще на ##$perk_value_1##.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_2## быстрее.",
		["menu_deck2_7_desc_sc"] = "Каждый выстрел из вашего оружия имеет ##$perk_value_1## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nВаш уворот увеличен еще на ##$perk_value_2## очков.",
		["menu_deck2_9_desc_sc"] = "Ваше здоровье увеличено еще на ##$perk_value_1##.\n\nВы получаете на ##$perk_value_2## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Crew Chief
		["menu_deck1_3_desc_sc"] = "Выносливость вас и вашей команды увеличена на ##$perk_value_1##.\n\nРасстояние ваших криков увеличено на ##$perk_value_2##.\n\nКомандные бонусы не складываются.\n\nВаш уворот увеличен на ##$perk_value_3## очков.",
		["menu_deck1_5_desc_sc"] = "Ваше здоровье увеличено на ##$perk_value_1##.\n\nЗдоровье вашей команды увеличено на ##$perk_value_2##.\n\nКомандные бонусы не складываются.\n\nВы отвечаете на пейджеры на ##$perk_value_3## быстрее.",
		["menu_deck1_7_desc_sc"] = "Ваша броня увеличена на ##$perk_value_1##.\n\nВаш уворот увеличен еще на ##$perk_value_2## очков.",
		["menu_deck1_9_desc_sc"] = "Каждый заложник увеличивает здоровье на ##$perk_value_1## и выносливость на ##$perk_value_2## для вас и вашей команды, до ##$perk_value_3## заложников.\n\nКомандные бонусы не складываются.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck3_3_desc_sc"] = "Ваша броня увеличена еще на ##$perk_value_1##.",
		["menu_deck3_5_desc_sc"] = "Ваша броня увеличена еще на ##$perk_value_1##.\n\nВы можете ставить ##$perk_value_2## кейса с мешками для тел.",
		["menu_deck3_7_desc_sc"] = "Ваша броня восстанавливается на ##$perk_value_1## быстрее.",
		["menu_deck3_9_desc_sc"] = "Ваша броня восстанавливается еще на ##$perk_value_1## быстрее.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.\n\nВаша полоска уворота заполняется на ##$perk_value_2## за каждую секунду в приседе.",
		["menu_deck7_3_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck7_5_desc_sc"] = "Ваша полоска уворота заполняется еще на ##$perk_value_1## за каждую секунду в приседе.\n\nВы двигаетесь на ##$perk_value_2## быстрее в приседе.",
		["menu_deck7_7_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck7_9_desc_sc"] = "Ваша броня восстанавливается быстрее на ##$perk_value_1##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Коробки с патронами также дают медикаменты, которые восстанавливают от ##$perk_value_1## до ##$perk_value_2## здоровья.\n\nЭффект происходит раз в ##$perk_value_3## секунд, но каждая подобранная коробка патронов уменьшает эту задержку на ##$perk_value_4##-##$perk_value_5## секунды.",
		["menu_deck10_3_desc_sc"] = "Когда вы подбираете патроны, ваша команда дополнительно получает ##$perk_value_1## патронов.\n\nВы получаете ##$perk_value_2## уворота.",
		["menu_deck10_5_desc_sc"] = "Коробки с патронами теперь восстанавливают от ##$perk_value_1## до ##$perk_value_2## очков здоровья.\n\nКаждый раз, когда вы лечитесь от подбора, ваша полоска уворота получает до ##$perk_value_3## от вашего Уворота.\n\nВы отвечаете на пейджеры на ##$perk_value_4## быстрее",
		["menu_deck10_7_desc_sc"] = "Когда вы лечитесь при помощи коробок с патронами, ваша команда также лечится на ##$perk_value_1## от количества полученного здоровья.\n\nВы получаете еще ##$perk_value_2## уворота.",
		["menu_deck10_9_desc_sc"] = "Коробки с патронами теперь восстанавливают от ##$perk_value_1## до ##$perk_value_2## очков здоровья.\n\nКогда вы лечитесь при помощи коробок с патронами, вы получаете ##$perk_value_3## брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_deck10_7"] = "Сомнительная медицина",
		["menu_deck10_9"] = "Народная медицина",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "Когда вы находитесь в ##$perk_value_1## метрах от врага, вы получаете на ##$perk_value_2## меньше урона.",
		["menu_deck8_3_desc_sc"] = "Когда вы находитесь в ##$perk_value_1## метрах от врага, вы получаете еще на ##$perk_value_2## меньше урона.\n\nВы получаете ##$perk_value_3## уворота.",
		["menu_deck8_5_desc_sc"] = "Когда вы находитесь в ##$perk_value_1## метрах от врага, вы получаете еще на ##$perk_value_2## меньше урона.\n\nКаждый успешный удар оружием ближнего боя дает ##$perk_value_3## бонус к урону оружия ближнего боя на ##$perk_value_4## секунд, который может складываться до ##$perk_value_5## раз. Эффект обнуляется при промахе.\n\nВы зацикливаете камеры на ##$perk_value_6## секунд дольше.",
		["menu_deck8_7_desc_sc"] = "Каждый успешный удар оружием ближнего боя дает еще ##$perk_value_1## урона оружию ближнего боя на ##$perk_value_2## секунд.\n\nВы получаете еще ##$perk_value_3## уворота.",
		["menu_deck8_9_desc_sc"] = "Каждый успешный удар оружием ближнего боя восстанавливает ##$perk_value_1## очко здоровья каждую секунду в течение ##$perk_value_2## секунд, этот эффект может складываться до ##$perk_value_3## раз.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sociopath--
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "Когда вы находитесь в ##$perk_value_1## метрах от 3-х и более врагов, вы получаете на ##$perk_value_2## меньше урона.",
		["menu_deck9_3_desc_sc"] = "Убийство врага восстанавливает ##$perk_value_1## брони.\n\nЭто может происходить только раз в ##$perk_value_2## секунд, но каждое убийство сокращает время на ##$perk_value_3## секунд, а убийство холодным оружием - еще на ##$perk_value_4## секунды.\n\nЕсли убийство сокращает время полностью, бонусы активируются и задержка начнется сначала.\n\nВы получаете ##$perk_value_5## уворота.",
		["menu_deck9_5_desc_sc"] = "Убийство врага оружием ближнего боя восстанавливает ##$perk_value_1## здоровья.\n\nЭффект активируется вместе с Tension (3-я карта).\n\nВы носите на ##$perk_value_2## мешок для тел больше.",
		["menu_deck9_7_desc_sc"] = "Убийство врага, находящегося в менее чем ##$perk_value_1## метров от вас, восстанавливает ##$perk_value_2## брони, а убийство холодным оружием - в два раза больше брони.\n\nЭффект активируется вместе с Tension (3-я карта).\n\nВы получаете еще ##$perk_value_3## уворота",
		["menu_deck9_9_desc_sc"] = "Убийство врага, находящегося в менее чем ##$perk_value_1## метров от вас, имеет ##$perk_value_2## шанс посеять панику среди врагов в радиусе ##$perk_value_3## метров от Вас, а убийство холодным оружием повышает этот шанс в два раза.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nЭффект активируется вместе с Tension (3-я карта).\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Нанесение урона врагу восстанавливает ##$perk_value_1## очка здоровья каждую секунду в течение ##$perk_value_2## секунд.\n\nЭтот эффект складывается до ##$perk_value_3## раз, но не чаще чем раз в ##$perk_value_4## секунд и только при ношении ##Противоосколочного жилета##. Нанесение урона при помощи турелей и урона через время (огня или яда) не вызывает эффект.\n\nВы теряете ##$perk_value_5## брони при ношении Противоосколочного жилета.\n\nКомпактность Противоосколочного жилета увеличена на ##$perk_value_6##.",
		["menu_deck11_3_desc_sc"] = "Эффект теперь восстанавливает на ##$perk_value_1## очко здоровья больше каждую секунду.",
		["menu_deck11_5_desc_sc"] = "Эффект теперь длится еще ##$perk_value_1## секунды.\n\nВы получаете возможность ставить ##$perk_value_2## кейса с мешками для трупов.",
		["menu_deck11_7_desc_sc"] = "Эффект теперь восстанавливает на ##$perk_value_1## очка здоровья больше каждую секунду.",
		["menu_deck11_9_desc_sc"] = "Каждое срабатывание эффекта теперь увеличивает скорость передвижения на ##$perk_value_1##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "Когда у вас полная броня, вы получаете ##$perk_value_1## очка запасного здоровья за каждого убитого врага.\n\nКогда ваша броня восстанавливается после полной потери, ваше запасное здоровье превращается в настоящее.\n\nМаксимальное количество запасного здоровья зависит от вашей брони - тяжелая броня накапливает меньше запасного здоровья, чем легкая.",
		["menu_deck13_3_desc_sc"] = "Увеличивает количество накапливаемого здоровья на убийства ##$perk_value_1##.\n\nВаш уворот увеличен на ##$perk_value_2## очков.",
		["menu_deck13_5_desc_sc"] = "Вы можете накапливать на ##$perk_value_1## больше здоровья.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_2## дольше.",
		["menu_deck13_7_desc_sc"] = "Увеличивает количество накапливаемого здоровья за убийства на ##$perk_value_1##.\n\nВаш уворот увеличен еще на ##$perk_value_2## очков.",
		["menu_deck13_9_desc_sc"] = "Убийство врага ускоряет восстановление брони, в зависимости от надетой брони. Тяжелая броня получает меньший бонус, чем легкая. Этот бонус обнуляется при каждом восстановлении брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "Наносимый вами урон переводится в Истерию. Максимальное количество Истерии - ##$perk_value_1##.\n\nИстерия:\nПолучаемый урон для вас и вашей команды уменьшается на ##$perk_value_2## очко за каждые ##$perk_value_3## очков Истерии. Истерия уменьшается на ##$perk_value_4## каждые ##$perk_value_5## секунд.",
		["menu_deck14_3_desc_sc"] = "Члены вашей команды получают бонус за Истерию.\n\nИстерия от разных членов команды не складывается - эффект имеет только истерия с самой большой защитой.\n\nВы получаете ##$perk_value_1## уворота.",
		["menu_deck14_5_desc_sc"] = "Истерия теперь уменьшается на ##$perk_value_1## каждые ##$perk_value_2## секунд.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_3## дольше.",
		["menu_deck14_7_desc_sc"] = "Получаемый урон теперь уменьшается еще на ##$perk_value_1## очко за каждые ##$perk_value_2## очков Истерии.\n\nВы получаете еще ##$perk_value_3## уворота.",
		["menu_deck14_9_desc_sc"] = "Очки истерии теперь на ##$perk_value_1## эффективнее для вас.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Anarchist--
		["menu_deck15_1_desc_sc"] = "Вместо полного восстановления брони вне боя, Анархист периодически восстанавливает часть брони. Тяжелые бронежилеты восстанавливают больше брони за раз, но делают это реже.\n\nНавыки, увеличивающие скорость восстановления брони, отключены при использовании этого набора.",
		["menu_deck15_3_desc_sc"] = "##$perk_value_1## вашего здоровья переводится в ##$perk_value_2## брони.",
		["menu_deck15_5_desc_sc"] = "##$perk_value_1## вашего здоровья переводится в ##$perk_value_2## брони.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_3## дольше.",
		["menu_deck15_7_desc_sc"] = "##$perk_value_1## вашего здоровья переводится в ##$perk_value_2## брони.",
		["menu_deck15_9_desc_sc"] = "Нанесение урона восстановит вам часть брони - это может произойти только раз в ##$perk_value_1## секунд. Тяжелые бронежилеты восстанавливают больше брони.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_anarc_disable"] = "#{important_1}#(Этот эффект не работает для набора перков Анархист)##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Теперь вы можете использовать Инъектор. Переключение на другой набор перков сделает Инъектор недоступным. Инъектор заменяет ваше метательное оружие.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы использовать его. Во время использование Инъектора, вы будете вылечены на ##$perk_value_1## от любого полученного урона в течение ##$perk_value_2## секунд.\n\nИнъектор можно использовать раз в ##$perk_value_3## секунд, но каждое убийство уменьшит задержку на ##$perk_value_4## секунду. ",
		["menu_deck17_3_desc_sc"] = "Ваша скорость увеличена на ##$perk_value_1## пока действует Инъектор.",
		["menu_deck17_5_desc_sc"] = "Теперь вы будете вылечены на ##$perk_value_1## от любого полученного урона в течение ##$perk_value_2## секунд после использования Инъектора.\n\nПока действует Инъектор, враги будут держать вас в приоритете.",
		["menu_deck17_7_desc_sc"] = "Количество восстанавливаемого Инъектором здоровья увеличено на ##$perk_value_1## если у вас меньше ##$perk_value_2## здоровья.",
		["menu_deck17_9_desc_sc"] = "Пока у вас полное здоровье, за каждые ##$perk_value_1## очков здоровья, полученные во время действия Инъектора, Инъектор восстановится на ##$perk_value_2## секунды быстрее.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--10 feet higher--
		["menu_st_spec_18"] = "Сикарио",
		["menu_deck18_1_desc_sc"] = "Теперь вы можете использовать ##Дымовую шашку.##\n\nПри броске, дымовая шашка создает дымовую завесу на ##$perk_value_1## секунд. Внутри завесы вы и ваша команда восстанавливают броню на ##$perk_value_2## быстрее. Любые противники, стоящие в дымовой завесе, получает штраф ##$perk_value_3## к точности.\n\nДымовую завесу можно использовать раз в ##$perk_value_4## секунд, но убийство врага сокращает эту задержку на ##$perk_value_5## секунды.\n\nВаш уворот увеличен на ##$perk_value_6## очков.",
		["menu_deck18_3_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck18_5_desc_sc"] = "Уворот от атаки сократит задержку дымовой завесы на ##$perk_value_1## секунду.\n\nВы носите на ##$perk_value_2## мешок для тел больше.",
		["menu_deck18_7_desc_sc"] = "Ваш уворот увеличен еще на ##$perk_value_1## очков.",
		["menu_deck18_9_desc_sc"] = "Полоска уворота будет заполняться на ##$perk_value_1## каждую секунду, в течение которой вы находитесь внутри дымовой завесы.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Теперь вы можете использовать Фляжку.\n\n##$perk_value_1## получаемого урона по здоровью будет задержано на ##$perk_value_2## секунд.\n\nВы можете нажать на кнопку метательного оружия, чтобы использовать Фляжку и мгновенно отвергнуть задержанный урон.\n\nКогда вы отвергаете задержанный урон, ##$perk_value_3## этого урона возвращается вам в качестве здоровья. Фляжку можно использовать раз в ##$perk_value_4## секунд.\n\n##$perk_value_5 вашей брони превращается в $perk_value_6 здоровья.##",
		["menu_deck19_3_desc_sc"] = "Задержка Фляжки сокращается на ##$perk_value_1## секунды за каждого убитого врага.",
		["menu_deck19_5_desc_sc"] = "Если вы не получаете урон в течение ##$perk_value_1## секунд, любой задержанный урон будет отвергнут.\n\nВы отвечаете на пейджеры на ##$perk_value_2## быстрее.",
		["menu_deck19_7_desc_sc"] = "Когда у вас меньше ##$perk_value_1## здоровья, задержка Фляжки сокращается на ##$perk_value_2## секунды за каждого убитого врага.",
		["menu_deck19_9_desc_sc"] = "Вы получаете на ##$perk_value_1## больше здоровья после поднятия.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--it's not a war crime if they're not people--
		["menu_st_spec_20"] = "Тандем",
		["menu_deck20_1_desc_sc"] = "Теперь вы можете использовать ##Парилку.##\n\nЧтобы активировать Парилку, вам нужно смотреть на союзника на расстоянии не более ##$perk_value_1## метров и нажать на кнопку метательного оружия, чтобы отметить его. Между вами и союзником не должно быть препятствий или стен.\n\nКаждый противник, убитый вами или выбранным союзником, восстановит ##$perk_value_2## здоровья вам и ##$perk_value_3## здоровья союзнику.\n\nПарилка длится ##$perk_value_4## секунд и восстанавливается ##$perk_value_5## секунд.",
		["menu_deck20_3_desc_sc"] = "Каждый убитый вами или выбранным союзником враг продлевает действие Парилки на ##$perk_value_1## секунды.\n\nЭтот эффект уменьшается на ##$perk_value_2## секунды с каждым убийством.",
		["menu_deck20_5_desc_sc"] = "Каждый убитый вами или выбранным союзником враг уменьшает получаемый урон на ##$perk_value_1## очков, до максимальных ##$perk_value_2##, пока Парилка не станет снова доступна для использования.\n\nВы зацикливаете камеры на ##$perk_value_3## секунд дольше.",
		["menu_deck20_7_desc_sc"] = "Лечение от Парилки увеличено на ##$perk_value_1##.",
		["menu_deck20_9_desc_sc"] = "Каждый враг, убитый вами, сокращает задержку Парилки на ##$perk_value_1## секунды.\n\nКаждый враг, убитый выбранным союзником, сокращает задержку Парилки на ##$perk_value_2## секунды, пока она действует.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Biker--
		["menu_deck16_1_desc_sc"] = "Каждый раз, когда вы или ваша команда убивают врага, вы восстанавливаете ##$perk_value_1## очка здоровья. Это может произойти только раз в ##$perk_value_2## секунд.",
		["menu_deck16_3_desc_sc"] = "Вы восстанавливаете ##$perk_value_1## брони каждые ##$perk_value_2## секунд.",
		["menu_deck16_5_desc_sc"] = "Каждые потерянные ##$perk_value_1## брони сокращают задержку на восстановление здоровья на ##$perk_value_2## секунд.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_3## быстрее.",
		["menu_deck16_7_desc_sc"] = "Вы восстанавливаете ##$perk_value_1## брони каждые ##$perk_value_2## секунд.\n\nУбийство врага оружием ближнего боя мгновенно вызывает этот эффект и активирует следующее восстановление брони на ##$perk_value_3## секунду раньше.",
		["menu_deck16_9_desc_sc"] = "Каждые потерянные ##$perk_value_1## брони увеличивают количество получаемого здоровья за убийства на ##$perk_value_2## очка.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--Yakuza--
		["menu_deck12_1_desc_sc"] = "Чем меньше у вас здоровья, тем быстрее будет восстанавливаться полоска уворота. Когда у вас меньше ##100%## здоровья, полоска уворота будет восстанавливать до ##$perk_value_1## уворота каждую секунду.\n\nВаш уворот увеличен на ##$perk_value_2## очков.",
		["menu_deck12_3_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага. Когда у вас меньше ##100%## здоровья, вы получите до ##$perk_value_1## уворота при убийстве врага.",
		["menu_deck12_5_desc_sc"] = "Чем меньше у вас здоровья, тем меньше урона вы получаете. Когда у вас меньше ##100%## здоровья, вы получаете до ##$perk_value_1## меньше урона.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_2## быстрее.",
		["menu_deck12_7_desc_sc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага оружием ближнего боя. Когда у вас меньше ##100%## здоровья, вы получите до ##$perk_value_1## уворота при убийстве врага, а также период бессмертия следующего уворота будет увеличен до ##$perk_value_2##, до максимальных ##$perk_value_3 мс##.\n\nВаш уворот увеличен еще на ##$perk_value_4## очков.",
		["menu_deck12_9_desc_sc"] = "Максимальное количество устойчивости увеличено до ##$perk_value_1.##\n\nОдин раз за падение, если у вас закончится здоровье, вы выживите с ##1## здоровьем и восстановите ##$perk_value_2## брони.\n\nДанный перк не работает на удары Клокеров и шок Тазеров.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_yakuza_deflection_add"] = "(Бонус Якудзы)",

		--Hacker--
		["menu_deck21_1_desc_sc"] = "Теперь вы можете использовать ##Карманный генератор помех##.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы активировать его.\n\nАктивация Карманного генератора помех до тревоги отключит всю электронику и пейджеры на ##$perk_value_1## секунд.\n\nАктивация Карманного генератора помех после тревоги будет оглушать врагов в радиусе ##$perk_value_2## метров. Первые помехи имеют ##$perk_value_3## шанс оглушить врага, затем каждые ##$perk_value_4## секунды помех имеют ##$perk_value_5## шанс на оглушение.\n\nКарманный генератор помех восстанавливается ##$perk_value_6## секунд, но каждое убийство сократит задержку на ##$perk_value_7## секунды.",
		["menu_deck21_3_desc_sc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.",
		["menu_deck21_5_desc_sc"] = "Убийство врага пока работает Карманный генератор помех восстановит ##$perk_value_1## здоровья.",
		["menu_deck21_7_desc_sc"] = "Ваша броня восстанавливается быстрее на ##$perk_value_1##.\n\nВаш уворот увеличен еще на ##$perk_value_2## очков.",
		["menu_deck21_9_desc_sc"] = "Союзники восстановят ##$perk_value_1## здоровья, если убьют врага пока работает Карманный генератор помех.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",



		--Leech
		["menu_deck22_1_desc_sc"] = "Теперь вы можете использовать ##Ампулу##.\n\nНажмите кнопку метательного оружия, чтобы активировать Ампулу. Она восстановит ##$perk_value_1## вашего здоровья и отключит броню на время своего действия.\n\nПока Ампула действует, ваше здоровье разделено на сегменты по ##$perk_value_3##, и любой полученный урон снимет один сегмент. Убийство ##$perk_value_4## врагов восстановит один сегмент и заблокирует получаемый урон на ##$perk_value_5## секунду.\n\nАмпула действует ##$perk_value_2## секунд и восстанавливается ##$perk_value_6## секунд.",
		["menu_deck22_3_desc_sc"] = "Пока действует Ампула, любое получение урона восстановит ##$perk_value_1## здоровья вашим союзникам.",
		["menu_deck22_5_desc_sc"] = "Длительность Ампулы увеличена до ##$perk_value_1## секунд.\n\nУбийство врага уменьшает задержку Ампулы на ##$perk_value_2## секунду.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_3## быстрее.",
		["menu_deck22_7_desc_sc"] = "Во время действия ампулы, ваше здоровье разделено на сегменты по ##$perk_value_1##.",
		["menu_deck22_9_desc_sc"] = "Теперь можно активировать Ампулу во время падения. Это поднимет вас до конца действия Ампулы.\n\nЭто добавит ##$perk_value_1## секунд к времени восстановления Ампулы.\n\nПолучение урона вылечит товарищей на ##$perk_value_2##.\n\nБонус полной колоды: Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		--CopyCat--
		["menu_st_spec_23"] = "Подражатель",
		["menu_st_spec_23_desc"] = "Подражатель - уникальный человек, обладающий фотографической памятью и молниеносными рефлексами. Вечное ожидание опасности сделало вас настолько ловким, что вы можете уворачиваться и даже отражать пули противника. Вы изучали своих товарищей и теперь можете имитировать их способности и формировать свой собственный уникальный стиль из них. И если кто-то скажет, что вы просто воришка, ответьте, что подражание - высшая форма похвалы.",
		["menu_deck23_1"] = "Тактическая перезарядка",
		["menu_deck23_3"] = "Головная боль",
		["menu_deck23_5"] = "Твоя пуля?",
		["menu_deck23_7"] = "Секунда славы",
		["menu_deck23_9"] = "Мимикрия",
		["menu_deck23_9_desc"] = "Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##10%.##",

		["menu_deck23_1_desc"] = "Убийство ##$perk_value_1## врагов перезарядит ваше спрятанное оружие.\n\nУбийства считаются отдельно для каждого оружия, счетчик обнуляется только при срабатывании эффекта.\n\nВы переключаете оружие на ##$perk_value_2## быстрее.",
		["menu_deck23_1_short"] = "Убийство ##$perk_value_1## врагов перезарядит ваше спрятанное оружие.\n\nВы переключаете оружие на ##$perk_value_2## быстрее.",
		["menu_deck23_1_1_desc"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_1_1_short"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_1_2_desc"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_1_2_short"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_1_3_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_1_3_short"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_1_4_desc"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_1_4_short"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_1_1"] = "Живчик",
		["menu_deck23_1_2"] = "Крепыш",
		["menu_deck23_1_3"] = "Ловкач",
		["menu_deck23_bonus_speed"] = "Проныра",

		["menu_deck23_3_desc"] = "Каждый выстрел в голову восстанавливает ##$perk_value_1## здоровья.\n\nЭто может произойти не чаще чем раз в ##$perk_value_2## секунд или при срабатывании навыка ##\"В яблочко\"##",
		["menu_deck23_3_short"] = "Каждый выстрел в голову восстанавливает ##$perk_value_1## здоровья.\n\nЭто может произойти не чаще чем раз в ##$perk_value_2## секунд или при срабатывании навыка ##\"В яблочко\"##.",
		["menu_deck23_3_1_desc"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_3_1_short"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_3_2_desc"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_3_2_short"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_3_3_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_3_3_short"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_3_4_desc"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_3_4_short"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_3_1"] = "Живчик",
		["menu_deck23_3_2"] = "Крепыш",
		["menu_deck23_3_3"] = "Ловкач",

		["menu_deck23_5_desc"] = "Пули, от которых вы увернулись, отлетят во врагов.\n\nПули, которые ломают вашу броню, отлетят обратно во врага и нанесут на ##$perk_value_1## больше урона.\n\nРикошеты от брони происходят не чаще чем раз в ##$perk_value_2## секунд.",
		["menu_deck23_5_short"] = "Пули, от которых вы увернулись, отлетят во врагов.\n\nПули, которые ломают вашу броню, отлетят обратно во врага и нанесут на ##$perk_value_1## больше урона.\n\nРикошеты от брони происходят не чаще чем раз в ##$perk_value_2## секунд.",
		["menu_deck23_5_1_desc"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_5_1_short"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_5_2_desc"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_5_2_short"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_5_3_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_5_3_short"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_5_4_desc"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_5_4_short"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_5_1"] = "Живчик",
		["menu_deck23_5_2"] = "Крепыш",
		["menu_deck23_5_3"] = "Ловкач",

		["menu_deck23_7_desc"] = "Когда ваше здоровье опускается ниже ##$perk_value_1##, вы получите иммунитет к урону на ##$perk_value_2## секунды.\n\nЭто может произойти не чаще чем раз в ##$perk_value_3## секунд.",
		["menu_deck23_7_short"] = "Когда ваше здоровье опускается ниже ##$perk_value_1##, вы получите иммунитет к урону на ##$perk_value_2## секунды.\n\nЭто может произойти не чаще чем раз в ##$perk_value_3## секунд.",
		["menu_deck23_7_1_desc"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_7_1_short"] = "Ваше здоровье увеличено на ##$perk_value_1##.",
		["menu_deck23_7_2_desc"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_7_2_short"] = "Ваша броня увеличена на ##$perk_value_1##.",
		["menu_deck23_7_3_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_7_3_short"] = "Ваш уворот увеличен на ##$perk_value_1## очка.",
		["menu_deck23_7_4_desc"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_7_4_short"] = "Скорость в приседе и с сумкой увеличена на ##$perk_value_1##.",
		["menu_deck23_7_1"] = "Живчик",
		["menu_deck23_7_2"] = "Крепыш",
		["menu_deck23_7_3"] = "Ловкач",
		--Final Card
			--Crew Chief
			["menu_deck1_mrwi_desc"] = "Выносливость вас и вашей команды увеличена на ##$perk_value_1##.\n\nРасстояние ваших криков увеличено на ##$perk_value_2##.\n\nКомандные бонусы не складываются.\n\nВы отвечаете на пейджеры на ##$perk_value_3## быстрее.",
			--Muscle
			["menu_deck2_mrwi_desc"] = "Каждый выстрел из вашего оружия имеет ##$perk_value_1## шанс посеять панику среди врагов.\n\nПаника заставляет врагов испытывать неконтролируемый страх на короткий промежуток времени.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_2## быстрее.",
			--Armorer
			["menu_deck3_mrwi_desc"] = "Ваша броня восстанавливается на ##$perk_value_1## быстрее.\n\nВы можете ставить ##$perk_value_2## кейса с мешками для тел.",
			--Rogue
			["menu_deck4_mrwi_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.\n\nВы переключаете оружие на ##$perk_value_2## быстрее.\n\nВы зацикливаете камеры на ##$perk_value_3## секунд дольше.",
			--Hitman
			["menu_deck5_mrwi_desc"] = "Убийство врагов огнестрельным оружием добавляет ##$perk_value_1## запасного здоровья. Вы можете получить до ##$perk_value_2## запасного здоровья.\n\nУбийство врага оружием ближнего боя превращает запасное здоровье во временное здоровье, которое утекает со скоростью ##$perk_value_3## единиц в секунду.\n\nВременное здоровье может превышать ваше максимальное здоровье, но вы не можете иметь больше ##$perk_value_4## временного здоровья за раз.\n\nВы носите на ##$perk_value_5## мешок для тел больше.",
			--Crook
			["menu_deck6_mrwi_desc"] = "При ношении баллистических жилетов, ваша броня увеличена еще на ##$perk_value_2##, а уворот - на ##$perk_value_1## очков.\n\nYВы взламываете замки на ##$perk_value_3## быстрее.",
			--Burglar
			["menu_deck7_mrwi_desc"] = "Ваш уворот увеличен на ##$perk_value_1## очков.\n\nВаша полоска уворота заполняется еще на ##$perk_value_2## за каждую секунду в приседе.\n\nВы двигаетесь на ##$perk_value_3## быстрее в приседе.",
			--Infiltrator
			["menu_deck8_mrwi_desc"] = "Когда вы находитесь в ##$perk_value_1## метрах от врага, вы получаете на ##$perk_value_2## меньше урона.\n\nКаждый удар в ближнем бою увеличивает урон холодного оружия на ##$perk_value_3##, этот эффект действует ##$perk_value_4## секунд и складывается до ##$perk_value_5## раз. Эффект обнуляется при промахе.\n\nВы зацикливаете камеры на ##$perk_value_6## секунд дольше.",
			--Sociopath
			["menu_deck9_mrwi_desc"] = "Убийство врага восстанавливает ##$perk_value_1## брони; убийство на расстоянии ближе ##$perk_value_2## метров восстанавливает дополнительно ##$perk_value_3## брони, убийство холодным оружием - в два раза больше.\n\nЭффект активируется раз в ##$perk_value_4## секунд, но каждое убийство сокращает время на ##$perk_value_5## секунд, а убийство холодным оружием - еще на ##$perk_value_6## секунды.\n\nЕсли убийство сокращает время полностью, бонусы активируются и задержка начнется сначала.\n\nВы носите на ##$perk_value_7## мешок для тел больше.",
			--Gambler
			["menu_deck10_mrwi_desc"] = "Патроны, которые вы подбираете, лечат членов команды от ##$perk_value_1 до $perk_value_2## очков здоровья.\n\nЛечение имеет задержку в ##$perk_value_3## секунд, но каждая подобранная коробочка патронов сокращает эту задержку на ##$perk_value_4 - $perk_value_5## секунды.\n\nКогда вы подбираете патроны, ваша команда дополнительно получает ##$perk_value_6## патронов.\n\nВы отвечаете на пейджеры на ##$perk_value_7## быстрее.",
			--Grinder
			["menu_deck11_mrwi_desc"] = "Нанесение урона врагу восстанавливает ##$perk_value_1## очка здоровья каждую секунду в течение ##$perk_value_2## секунд.\n\nЭтот эффект складывается до ##$perk_value_3## раз, но не чаще чем раз в ##$perk_value_4## секунд и только при ношении ##Противоосколочного жилета##. Нанесение урона при помощи турелей и урона через время (огня или яда) не вызывает эффект.\n\nВы теряете ##$perk_value_5## брони при ношении Противоосколочного жилета.\n\nКомпактность Противоосколочного жилета увеличена на ##$perk_value_6##.\n\nВы получаете возможность ставить ##$perk_value_7## кейса с мешками для трупов.",
			--Yakuza
			["menu_deck12_mrwi_desc"] = "Чем меньше у вас здоровья, тем больше вы будете получать уворота при убийстве врага. Когда у вас меньше ##100%## здоровья, вы получите до ##$perk_value_1## уворота при убийстве врага.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_2## быстрее.",
			--Ex-Pres
			["menu_deck13_mrwi_desc"] = "Когда у вас полная броня, вы получаете ##$perk_value_1## очка запасного здоровья за каждого убитого врага.\n\nКогда ваша броня восстанавливается после полной потери, ваше запасное здоровье превращается в настоящее.\n\nМаксимальное количество запасного здоровья зависит от вашей брони - тяжелая броня накапливает меньше запасного здоровья, чем легкая.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_2## дольше.",
			--Maniac
			["menu_deck14_mrwi_desc"] = "Наносимый вами урон переводится в Истерию. Максимальное количество Истерии - ##$perk_value_1##.\n\nИстерия:\nПолучаемый урон для вас и вашей команды уменьшается на ##$perk_value_2## очко за каждые ##$perk_value_3## очков Истерии. Истерия уменьшается на ##$perk_value_4## каждые ##$perk_value_5## секунд.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_6## дольше.",
			--Anarchist
			["menu_deck15_mrwi_desc"] = "Вместо восстановления брони вне боя, Анархист периодически восстанавливает броню с частотой ##8## очков брони в секунду. Тяжелые бронежилеты восстанавливают больше брони за раз, но делают это реже.\n\nНавыки, увеличивающие скорость восстановления брони, отключены при использовании этого набора.\n\nГражданские, напуганные вами и вашей бандой, остаются напуганными на ##$perk_value_1## дольше.",
			--Biker
			["menu_deck16_mrwi_desc"] = "Каждый раз, когда вы или ваша команда убивают врага, вы восстанавливаете ##$perk_value_1## очка здоровья. Это может произойти только раз в ##$perk_value_2## секунд.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_3## быстрее.",
			--Kingpin
			["menu_deck17_mrwi_desc"] = "Теперь вы можете использовать Инъектор. Инъектор заменяет ваше метательное оружие.\n\nВо время использования Инъектора, вы будете вылечены на ##$perk_value_1## от любого полученного урона в течение ##$perk_value_2## секунд.\n\nВаша скорость увеличена на ##$perk_value_3## пока действует Инъектор.\n\nИнъектор можно использовать раз в ##$perk_value_4## секунд, но каждое убийство уменьшит задержку на ##$perk_value_5## секунду.",
			--Sicario
			["menu_deck18_mrwi_desc"] = "Теперь вы можете использовать ##Дымовую шашку.##\n\nПри броске, дымовая шашка создает дымовую завесу на ##$perk_value_1## секунд. Внутри завесы вы и ваша команда восстанавливают броню на ##$perk_value_2## быстрее. Любые противники, стоящие в дымовой завесе, получает штраф ##$perk_value_3## к точности.\n\nДымовую завесу можно использовать раз в ##$perk_value_4## секунд, но убийство врага сокращает эту задержку на ##$perk_value_5## секунды.\n\nВаш уворот увеличен на ##$perk_value_6## очков.\n\nВы носите на ##$perk_value_7## мешок для тел больше.",
			--Stoic
			["menu_deck19_mrwi_desc"] = "Теперь вы можете использовать Фляжку.\n\n##$perk_value_1## получаемого урона по здоровью будет задержано на ##$perk_value_2## секунд.\n\nВы можете нажать на кнопку метательного оружия, чтобы использовать Фляжку и мгновенно отвергнуть задержанный урон.\n\nКогда вы отвергаете задержанный урон, ##$perk_value_3## этого урона возвращается вам в качестве здоровья. Фляжку можно использовать раз в ##$perk_value_4## секунд.\n\n##$perk_value_5 вашей брони превращается в $perk_value_6 здоровья.##\n\nВы отвечаете на пейджеры на ##$perk_value_7## быстрее.",
			--Tag Team
			["menu_deck20_mrwi_desc"] = "Теперь вы можете использовать ##Парилку.##\n\nЧтобы активировать Парилку, вам нужно смотреть на союзника на расстоянии не более ##$perk_value_1## метров и нажать на кнопку метательного оружия, чтобы отметить его. Между вами и союзником не должно быть препятствий или стен.\n\nКаждый противник, убитый вами или выбранным союзником, восстановит ##$perk_value_2## здоровья вам и ##$perk_value_3## здоровья союзнику.\n\nПарилка длится ##$perk_value_4## секунд и восстанавливается ##$perk_value_5## секунд.\n\nВы зацикливаете камеры на ##$perk_value_6## секунд дольше.",
			--Hacker
			["menu_deck21_mrwi_desc"] = "Теперь вы можете использовать ##Карманный генератор помех##.\n\nВо время ограбления нажмите кнопку метательного оружия, чтобы активировать его.\n\nАктивация Карманного генератора помех до тревоги отключит всю электронику и пейджеры на ##$perk_value_1## секунд.\n\nАктивация Карманного генератора помех после тревоги будет оглушать врагов в радиусе ##$perk_value_2## метров. Первые помехи имеют ##$perk_value_3## шанс оглушить врага, затем каждые ##$perk_value_4## секунды помех имеют ##$perk_value_5## шанс на оглушение.\n\nКарманный генератор помех восстанавливается ##$perk_value_6## секунд, но каждое убийство сократит задержку на ##$perk_value_7## секунды.",
			--Leech
			["menu_deck22_mrwi_desc"] = "Теперь вы можете использовать ##Ампулу##.\n\nНажмите кнопку метательного оружия, чтобы активировать Ампулу. Она восстановит ##$perk_value_1## вашего здоровья и отключит броню на время своего действия.\n\nПока Ампула действует, ваше здоровье разделено на сегменты по ##$perk_value_3##, и любой полученный урон снимет один сегмент. Убийство ##$perk_value_4## врагов восстановит один сегмент и заблокирует получаемый урон на ##$perk_value_5## секунду.\n\nАмпула действует ##$perk_value_2## секунд и восстанавливается ##$perk_value_6## секунд.\n\nВы используете сумки для тел и взаимодействуете с гражданскими на ##$perk_value_7## быстрее.",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Перерожденный",
		["menu_st_spec_0_desc"] = "Говорят, люди рождаются без каких-либо заложенных идей, мыслей и убеждений - они приобретаются исключительно из опыта. Для кого-то это усложняет жизнь, кто-то видит в этом возможности. Перерожденный - это грабитель, удача которого раскрывается не сразу. Его судьба полна как больших рисков, так и больших наград.",
		["menu_st_spec_0_desc_short"] = "Говорят, люди рождаются без каких-либо заложенных идей, мыслей и убеждений - они приобретаются исключительно из опыта. Для кого-то это усложняет жизнь, кто-то видит в этом возможности. Перерожденный - это грабитель, удача которого раскрывается не сразу. Его судьба полна как больших рисков, так и больших наград.",
		["menu_deck0_1"] = "Свой человек",
		["menu_deck0_1_desc"] = "Предметы на черном рынке и активы стоят на ##30%## меньше.",
		["menu_deck0_2"] = "Черный дилер",
		["menu_deck0_2_desc"] = "Предметы на черном рынке и активы стоят еще на ##30%## меньше.",
		["menu_deck0_3"] = "Мертвые президенты",
		["menu_deck0_3_desc"] = "Подбираемая добыча дает на ##15%## больше денег.",
		["menu_deck0_4"] = "День ветерана",
		["menu_deck0_4_desc"] = "Подбираемая добыча дает еще на ##30%## больше денег.",
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
		["menu_st_spec_00_desc"] = "Некоторые считают, что все необходимые навыки уже есть с рождения. Некоторые люди - прирожденные грабители: им не нужно тратить ресурсы на навыки. Возможно, их убеждения - просто упрямство. Действительно ли стоит отказываться приобретать новые навыки?",
		["menu_st_spec_00_desc_short"] = "Некоторые считают, что все необходимые навыки уже есть с рождения. Некоторые люди - прирожденные грабители: им не нужно тратить ресурсы на навыки. Возможно, их убеждения - просто упрямство. Действительно ли стоит отказываться приобретать новые навыки?",
		["menu_deck00_9_desc"] = "Шанс получения предмета высокого качества после прохождения ограбления увеличен на ##20%.##",

		["rpd_menu_button"] = "Обнулить перк",
		["rpd_menu_dialog_title"] = "Вы уверены?",
		["rpd_menu_dialog_text"] = "Если вы обнулите перк '$perk_deck_name', вы получите $points_to_refund очков.",

		--Strings for Lobby Player Info
		["menu_st_spec_24"] = "Перерожденный",
		["menu_st_spec_25"] = "Прирожденный",
		--MOD PERK DECKS
			--OFFYERROCKER'S MERCENARY PERK DECK
	["menu_deck_kmerc_title"] = "Наемник",
	["menu_deck_kmerc_desc"] = "Профессиональный Наемник прошел сотни тренировок, чтобы убивать и не быть убитым. Даже в самых жарких перестрелках, Наемник найдет дух, настойчивость и силу прорываться вперед. Выживание - правило номер один; ведь когда все кончится, оплату заберут лишь живые.",
	["menu_deck_kmerc_1"] = "Покрытый шрамами",
	["menu_deck_kmerc_1_desc_sc"] = "Урон от сильных атак снижен, ##вас не могут убить одной атакой##.\n\nВы получаете на ##5%## больше здоровья.",
	["menu_deck_kmerc_3"] = "Чрезмерная сила",
	["menu_deck_kmerc_3_desc_sc"] = "Вы получаете ##1%## бонус к скорости перезарядки и ##2%## бонус к скорости смены оружия за каждые ##4## единицы брони.\n\nВы получаете на ##5%## больше брони.",
	["menu_deck_kmerc_5"] = "Отстранись",
	["menu_deck_kmerc_5_desc_sc"] = "Когда ваше здоровья становится ##0##, оно становится ##1##, а вы получаете ##2## секунды неуязвимости.\nВо время неуязвимости нельзя бежать.\nЭтот эффект не может повториться, пока вы не вылечитесь до 100% здоровья.\n\nВы получаете на ##5%## больше здоровья.",
	["menu_deck_kmerc_7"] = "Лечебный слой",
	["menu_deck_kmerc_7_desc_sc"] = "Если ваша броня держится ##2 секунды##, вы лечитесь на число равное ##1%## вашей максимальной брони ##каждые 5 секунд##, пока у вас есть броня.",
	["menu_deck_kmerc_9"] = "Сильная сторона",
	["menu_deck_kmerc_9_desc_sc"] = "Когда вы получаете урон, который оставит вас с меньше чем ##30%## здоровья, вы ##восстанавливаете броню## на ##50%## от полученного урона.\nЭффект имеет задержку в ##1## секунду и не может сработать одновременно с неуязвимостью от перка 'Отстранись'.",

	--OFFYERROCKER'S LIBERATOR PERK DECK
	["bm_tachi"] = "Инъектор жизни Таки-2Б",
	["bm_tachi_desc"] = "В этих инъекторах содержатся сильные лекасртва и микроскопические роботы. При инъекции, эти роботы попадают в организм и быстро восстанавливают поврежденные ткани. Данный вариант инъектора так же содержит адреналин для ускорения действия роботов.",
	["menu_deck_liberator_title"] = "Либератор",
	["menu_deck_liberator_desc"] = "Либератор уже долгое время занимается восстановлением государственного и корпоративного имущества - в основном, цифровых документов. Отсутствие боевого опыта означает, что Либератору иногда приходится останавливаться и брать передышку, прежде чем возвращаться к борьбе со всякими тиранами, захватившими власть.",
	["menu_deck_liberator_1"] = "Любой ценой",
	["menu_deck_liberator_1_desc_sc"] = "Открывает Инъектор жизни. Использование Инъектора сразу восстановит ##15## стамины, а также будет восстанавливать ##0.5## здоровья каждую секунду в течение ##4## секунд, или пока игрок не получит урон.\nИнъектор жизни обладает ##1## использованием с задержкой в ##30## секунд. Каждое убийство уменьшит задержку на ##1## секунду.",
	["menu_deck_liberator_3"] = "На опережение",
	["menu_deck_liberator_3_desc_sc"] = "Регенерация здоровья от Инъектора теперь длится на ##2## секунды дольше.\n\nЕсли регенерация здоровья отменилась, вы получите ##10%## сопротивления урону на остаток времени.",
	["menu_deck_liberator_5"] = "Теоретические знания",
	["menu_deck_liberator_5_desc_sc"] = "Использование Инъектора теперь восстанавливает на ##15## стамины больше, а регенерация увеличена на ##0.5##.\n\nВаш уворот увеличен на ##5## очков.",
	["menu_deck_liberator_7"] = "Проблемная личность",
	["menu_deck_liberator_7_desc_sc"] = "Ваше здоровье увеличено на ##10%##.\n\nРегенерация здоровья от Инъектора теперь длится на ##2## секунды дольше.",
	["menu_deck_liberator_9"] = "Внезапная сила",
	["menu_deck_liberator_9_desc_sc"] = "Инъектор теперь восстанавливает дополнительно ##1## единицу здоровья каждую секунду.",

	})
end)
