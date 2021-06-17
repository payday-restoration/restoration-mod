-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "最佳数据",
		["menu_es_crew"] = "全队数据",
		["menu_es_personal"] = "个人数据",
		["menu_es_bad"] = "不良数据",
		["menu_es_other"] = "其他数据",
		["RestorationPDTHHudNeeded"] = "需要先使用PD:TH HUD REBORN！",
		["menu_paygrade"] = "薪酬等级：",
		["menu_diffgrade"] = "难度等级：",
		["menu_utility_radial_menu_name"] = "多功能菜单",
		["menu_utility_radial_menu_desc"] = "打开多功能菜单",

		["res_credits"] = "恢复MOD制作人员表",
		["res_credits_help"] = "查看恢复MOD的制作人员",

		["Warning_overhaul_title"] = "警告: 游戏正在关闭以保存数据",
		["dialog_show_overhaul_dialog"] = "你正在关闭恢复MOD。 一般不推荐这样做，如果你不想继续体验大修，正确的做法是把恢复MOD移出你的mods文件夹。\n\n你的游戏将会在 $TIME 秒后自动关闭，或在你点击\"确认\"时关闭。",
		["dialog_enable_overhaul_dialog"] = "你正在启用恢复MOD。 恢复MOD在安装后通常是永远启用的，它只能通过被移除你的mods文件夹来关闭。\n\n你的游戏将会在 $TIME 秒后自动关闭，或在你点击\"确认\"时关闭。",

		["res_saveboost"] = "按住 $BTN_INTERACT 以一键升到100级",

		["RestorationModOptionsButtonTitleID"] = "恢复MOD设置",
		["RestorationModOptionsButtonDescID"] = "恢复MOD的设置",
		["RestorationModHUDOptionsButtonTitleID"] = "恢复HUD和UI设置",
		["RestorationModHUDOptionsButtonDescID"] = "设置恢复MOD的HUD和UI界面",
		["RestorationModOTHEROptionsButtonTitleID"] = "其它设置",
		["RestorationModOTHEROptionsButtonDescID"] = "设置额外的功能",
		["RestorationModUIOptionsButtonTitleID"] = "Alpha UI",
		["RestorationModUIOptionsButtonDescID"] = "Alpha UI的设置",
		["RestorationModTimeOfDayTitleID"] = "自定义劫案时间",
		["RestorationModTimeOfDayDescID"] = "你可以自定义劫案一天的时间，该项也添加了新的劫案时间",

		["restoration_level_data_unknown"] = "时间未知，地点未知",
		["RestorationModEnv_BanksTitleID"] = "丰信银行",
		["RestorationModEnv_BanksDescID"] = "为 银行劫案 选择一种环境",
		["RestorationModEnv_RVD1TitleID"] = "落水狗劫案 Day 1",
		["RestorationModEnv_RVD1DescID"] = "为 落水狗劫案 第一天 选择一种环境",
		["RestorationModEnv_RVD2TitleID"] = "落水狗劫案 Day 2",
		["RestorationModEnv_RVD2DescID"] = "为 落水狗劫案 第二天 选择一种环境",
		["RestorationModEnv_FSD1TitleID"] = "纵火者 Day 1",
		["RestorationModEnv_FSD1DescID"] = "为 纵火者 第一天 选择一种环境",
		["RestorationModEnv_PBR2TitleID"] = "天之诞辰",
		["RestorationModEnv_PBR2DescID"] = "为 天之诞辰 选择一种环境",
		["RestorationModEnv_CJ2TitleID"] = "炸弹劫案: 船坞",
		["RestorationModEnv_CJ2DescID"] = "为 炸弹劫案: 船坞 选择一种环境",
		["RestorationModEnv_UnderPassTitleID"] = "武装押运: 地下通道",
		["RestorationModEnv_UnderPassDescID"] = "为 武装押运: 地下通道 选择一种环境",
		["RestorationModEnv_MallCrasherTitleID"] = "商城拆迁队",
		["RestorationModEnv_MallCrasherDescID"] = "为 商城拆迁队 选择一种环境",
		["RestorationModEnv_Mia_1TitleID"] = "火线迈阿密 Day 1",
		["RestorationModEnv_Mia_1DescID"] = "为 迈阿密热线 第一天 选择一种环境",
		["RestorationModEnv_FSD3TitleID"] = "纵火者 Day 3",
		["RestorationModEnv_FSD3DescID"] = "为 纵火者 第三天 选择一种环境",
		["RestorationModEnv_WDD1NTitleID"] = "看门狗 Day 1 (夜晚)",
		["RestorationModEnv_WDD1NDescID"] = "为 看门狗 第一天 (夜晚) 选择一种环境",
		["RestorationModEnv_WDD1DTitleID"] = "看门狗 Day 1 (白天)",
		["RestorationModEnv_WDD1DDescID"] = "为 看门狗 第一天 (白天) 选择一种环境",
		["RestorationModEnv_WDD2DTitleID"] = "看门狗 Day 2 (白天)",
		["RestorationModEnv_WDD2DDescID"] = "为 看门狗 第二天 (白天) 选择一种环境",
		["RestorationModEnv_Alex3TitleID"] = "鼠辈 Day 3",
		["RestorationModEnv_Alex3DescID"] = "为 鼠辈 第三天 选择一种环境",
		["RestorationModEnv_BigTitleID"] = "大银行",
		["RestorationModEnv_BigDescID"] = "为 大银行 选择一种环境",
		["RestorationModEnv_FSTitleID"] = "四家商店",
		["RestorationModEnv_FSDescID"] = "为 四家商店 选择一种环境",
		["RestorationModEnv_UkraTitleID"] = "乌克兰劫案",
		["RestorationModEnv_UkraDescID"] = "为 乌克兰劫案 选择一种环境",
		["RestorationModEnv_KosugiTitleID"] = "暗影突袭",
		["RestorationModEnv_KosugiDescID"] = "为 暗影突袭 选择一种环境",
		["RestorationModEnv_PetaTitleID"] = "模拟山羊 Day 1",
		["RestorationModEnv_PetaDescID"] = "为 模拟山羊 第一天 选择一种环境",
		["RestorationModEnv_FRIENDTitleID"] = "疤面山庄",
		["RestorationModEnv_FRIENDDescID"] = "为 疤面山庄 选择一种环境",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "Buff追踪器",
		["RestorationModINFOHUDOptionsButtonDescID"] = "在屏幕左侧显示当前技能及其具体信息数据。 不需要启用 Alpha UI。",
		["RestorationModInfo_HudTitleID"] = "启用 Buff追踪器",
		["RestorationModInfo_HudDescID"] = "启用或停用 Buff追踪器 的UI界面",
		["RestorationModInfo_SizeTitleID"] = "图标大小",
		["RestorationModInfo_SizeDescID"] = "控制 Buff追踪器 图标的大小",
		["RestorationModInfo_CountTitleID"] = "每行技能数量",
		["RestorationModInfo_CountDescID"] = "控制每行显示多少个技能及其图标",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "迅猛装填",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "弹无虚发",
		["RestorationModInfo_ammo_efficiencyDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "血之渴望",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_bullet_stormTitleID"] = "子弹风暴",
		["RestorationModInfo_bullet_stormDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "医疗士兵",
		["RestorationModInfo_revive_damage_reductionDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_desperadoTitleID"] = "亡命之徒",
		["RestorationModInfo_desperadoDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_grinderTitleID"] = "组织胺 (冰球手)",
		["RestorationModInfo_grinderDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_infiltratorTitleID"] = "生命汲取 (渗透者)",
		["RestorationModInfo_infiltratorDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_long_dis_reviveTitleID"] = "领袖鼓舞",
		["RestorationModInfo_long_dis_reviveDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_messiahTitleID"] = "弥赛亚",
		["RestorationModInfo_messiahDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "疯狂杀戮",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "止疼药",
		["RestorationModInfo_revived_damage_reductionDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "快速包扎",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_rogueTitleID"] = "杀手本能 (浪人)",
		["RestorationModInfo_rogueDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_increased_movement_speedTitleID"] = "死里逃生",
		["RestorationModInfo_increased_movement_speedDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "神枪手",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_trigger_happyTitleID"] = "乱枪狂人",
		["RestorationModInfo_trigger_happyDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "落水狗",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModInfo_unseen_strikeTitleID"] = "掩其无备",
		["RestorationModInfo_unseen_strikeDescID"] = "开启或关闭对此技能的追踪",
		["RestorationModAltLastDownColorTitleID"] = "更改被逮捕前最后一次倒地的颜色",
		["RestorationModAltLastDownColorDescID"] = "将被逮捕前最后一次倒地时角色边框的颜色设置为 color_sin_classic*.",
		["RestorationModNoBleedoutTiltTitleID"] = "取消倒地视角的倾斜",
		["RestorationModNoBleedoutTiltDescID"] = "倒地后玩家的视角将不再倾斜",
		["RestorationModClassicMoviesTitleID"] = "PD:TH经典界面",
		["RestorationModClassicMoviesDescID"] = "选择是否在任务简报界面采用PD:TH的经典页面(仅适用于经典劫案)",
		["RestorationModQuietRainTitleID"] = "减轻雨声",
		["RestorationModQuietRainDescID"] = "在下雨的劫案中雨声不会那么嘈杂",

		["default"] = "默认",
		["random"] = "随机",
		["mellowday"] = "晴天",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "默认加强版",
		["env_trailer_bank"] = "预告片",
		["rvd1_alt1"] = "清晨",
		["rvd1_alt2"] = "粉色烟幕",
		["rvd2_alt"] = "朦胧黄昏",
		["fsd1_eve"] = "傍晚",
		["bos_alt"] = "战争时代",
		["dockyard_alt"] = "网抑云时刻",
		["underpass_foggyday"] = "迷雾重重",
		["mall_alt"] = "午后享购",
		["hlm_morn"] = "凌晨",
		["funny_and_epic_synthwave_very_eighties"] = "理查德回归",
		["brightnight"] = "月圆之夜",
		["docks"] = "大海的阴郁",
		["bank_green"] = "清新淡绿",
		["cloudy_day"] = "多云",
		["shadowraid_day"] = "暗影突袭白天",
		["shadowraiud_darker"] = "暗影突袭黑夜",
		["friend_pink"] = "绚丽彩霞",
		["friend_night"] = "迈阿密之夜",
		["off"] = "Off",
		["windowofoppurtunity"] = "Window Of Opportunity",
		["wheresthevan"] = "Where's The Van",
		["menu_jukebox_heist_ponr"] = "Point Of No Return",
		["RestorationModPaintingsTitleID"] = "生成未被使用的画",
		["RestorationModPaintingsDescID"] = "允许或禁止在 美术馆-画廊 中生成原版未被使用的画作。 仅作为房主时有效。",
		["RestorationModMainHUDTitleID"] = "启用 Alpha HUD",
		["RestorationModMainHUDDescID"] = "完全启用或停用 Alpha HUD",
		["RestorationModWaypointsTitleID"] = "Alpha路径点",
		["RestorationModWaypointsDescID"] = "启用或停用 Alpha路径点",
		["RestorationModAssaultPanelTitleID"] = "Alpha突击横幅",
		["RestorationModAssaultPanelDescID"] = "启用或停用贴条形的 Alpha突击横幅",
		["RestorationModAltAssaultTitleID"] = "早期Alpha突击指示器",
		["RestorationModAltAssaultDescID"] = "启用或停用早期的 \"Alpha突击指示器\" 以替换 \"突击横幅\"",
		["RestorationModObjectivesPanelTitleID"] = "Alpha 任务指示器",
		["RestorationModObjectivesPanelDescID"] = "启用或停用 Alpha任务指示器",
		["RestorationModPresenterTitleID"] = "Alpha 提示框",
		["RestorationModPresenterDescID"] = "启用或停用 Alpha提示框，提示框用于显示新的任务目标和劫获的战利品",
		["RestorationModInteractionTitleID"] = "Alpha 互动圈",
		["RestorationModInteractionDescID"] = "启用或停用 Alpha互动圈",
		["RestorationModStealthTitleID"] = "Alpha 警戒条",
		["RestorationModStealthDescID"] = "启用或停用 Alpha潜入警戒条",
		["RestorationModDownTitleID"] = "Alpha 倒地计时器",
		["RestorationModDownDescID"] = "启用或停用 Alpha倒地计时器",
		["RestorationModBagTitleID"] = "Alpha 战利品面板",
		["RestorationModBagDescID"] = "启用或停用 Alpha战利品面板",
		["RestorationModHostageTitleID"] = "隐藏人质面板",
		["RestorationModHostageDescID"] = "如果选中，人质面板会在警方突击开始时被隐藏，只在选中突击横幅或突击指示器时有效",
		["RestorationModDifficultyMarkersTitleID"] = "测试版难度指示器",
		["RestorationModDifficultyMarkersDescID"] = "启用或停用 测试版难度指示器",
		["RestorationModStaminaIndicatorTitleID"] = "Debug耐力指示器",
		["RestorationModStaminaIndicatorDescID"] = "启用或禁用 Debug耐力指示器",
		["RestorationModBlackScreenTitleID"] = "恢复Mod黑屏界面",
		["RestorationModBlackScreenDescID"] = "启用或禁用 恢复Mod黑屏界面",
		["RestorationModLoadoutsTitleID"] = "Alpha 简报界面",
		["RestorationModLoadoutsDescID"] = "启用或停用 Alpha简报界面",
		["RestorationModDistrictTitleID"] = "CRIME.NET地区详情",
		["RestorationModDistrictDescID"] = "启用或禁用 CRIME.NET上地区的详情。也许与游戏描述不相符。",
		["RestorationModSCOptionsButtonTitleID"] = "恢复大修设置",
		["RestorationModSCOptionsButtonDescID"] = "恢复MOD的大修的设置",
		["RestorationModSCTitleID"] = "完全大修(DEBUG)",
		["RestorationModSCDescID"] = "启用或禁用恢复mod的完全游戏更改。切换此选项将自动退出游戏，以防止存档损坏。 ",
		["RestorationModHolidayTitleID"] = "节日活动",
		["RestorationModHolidayDescID"] = "开启或关闭 节日活动 对大修的影响",
		["RestorationModRestoreHitFlashTitleID"] = "恢复Mod受击闪屏",
		["RestorationModRestoreHitFlashDescID"] = "启用或禁用恢复Mod的受击闪屏",	
		["RestorationModNotifyTitleID"] = "功能及特色提示",
		["RestorationModNotifyDescID"] = "启用或禁用对模组特色的通知和提示",
		["RestorationModPauseTitleID"] = "Alpha 暂停菜单",
		["RestorationModPauseDescID"] = "启用或停用 Alpha暂停菜单",

		["menu_support"] = "恢复MOD大修指南",
		["menu_support_help"] = "查看恢复MOD的大修指南，获取帮助，寻找同好。",
		["menu_manual_header"] = "占位符文本",
		["hud_assault_alpha"] = "警方突击",
		["hud_loot_secured_title"] = "劫获战利品！",
		["debug_none"] = "目标",

		["restoration_level_data_welcome_to_the_jungle_1"] = "傍晚6:24, 'Overkill MC' 飞车党总部",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "凌晨1:32, 'Overkill MC' 飞车党总部",
		["restoration_level_data_welcome_to_the_jungle_2"] = "傍晚6:00, 维瓦尔第别墅",
		["restoration_level_data_framing_frame_1"] = "晚上11:30 , 国家级美术馆",
		["restoration_level_data_framing_frame_2"] = "中午12:30 , 废弃的火车场",
		["restoration_level_data_framing_frame_3"] = "凌晨2:20 , 高层公寓",
		["restoration_level_data_election_day_1"] = "中午12:37 , 39号码头",
		["restoration_level_data_election_day_2"] = "早晨8:10 , 仓库",
		["restoration_level_data_election_day_3"] = "嘿! 如果你在正常游戏时见到这行文字, 反馈给Restoration官方! 谢谢你!",
		["restoration_level_data_election_day_3_skip1"] = "下午4:25 , 国家储蓄银行",
		["restoration_level_data_election_day_3_skip2"] = "下午3:25 , 国家储蓄银行",
		["restoration_level_data_watchdogs_1"] = "下午4:10 , 运肉车",
		["restoration_level_data_watchdogs_1_res"] = "傍晚9:10 , 运肉车",
		["restoration_level_data_watchdogs_2"] = "凌晨12:25 , 阿尔门迪亚船坞",
		["restoration_level_data_watchdogs_2_res"] = "凌晨12:25 , 阿尔门迪亚船坞",
		["restoration_level_data_watchdogs_1_night"] = "晚上11:10 , 运肉车",
		["restoration_level_data_watchdogs_2_day"] = "傍晚6:05 , 阿尔门迪亚船坞",
		["restoration_level_data_watchdogs_3_res"] = "凌晨12:20 , 华盛顿正义大桥",
		["restoration_level_data_alex_1"] = "凌晨3:30 , 寂静岭",
		["restoration_level_data_alex_2"] = "清晨5:55 , 计策",
		["restoration_level_data_alex_3"] = "清晨7:20 , 华盛顿正义大桥",
		["restoration_level_data_alex_1_res"] = "凌晨3:30 , 寂静岭",
		["restoration_level_data_alex_2_res"] = "清晨5:55 , 项目",
		["restoration_level_data_alex_3_res"] = "清晨7:20 , 华盛顿正义大桥",
		["restoration_level_data_firestarter_1"] = "早晨9:25 , 私人机场",
		["restoration_level_data_firestarter_1_res"] = "早晨9:25 , 私人机场",
		["restoration_level_data_firestarter_2"] = "上午10:05 , 联邦调查局分局",
		["restoration_level_data_firestarter_2_res"] = "上午10:05 , 联邦调查局分局",
		["restoration_level_data_firestarter_3"] = "中午12:15 , 丰信银行",
		["restoration_level_data_firestarter_3_res"] = "中午12:15 , 丰信银行",
		["restoration_level_data_ukrainian_job"] = "下午2:50 , 珍贵往事",
		["restoration_level_data_ukrainian_job_res"] = "下午2:50 , 珍贵往事",
		["restoration_level_data_jewelry_store"] = "下午2:50 , 珍贵往事",
		["restoration_level_data_four_stores"] = "下午1:20 , 店面",
		["restoration_level_data_mallcrasher"] = "中午12:50 , 购物中心",
		["restoration_level_data_nightclub"] = "晚上8:00 , 极具雅致的俱乐部",
		["restoration_level_data_branchbank"] = "中午12:15 , 丰信银行",
		["restoration_level_data_escape_cafe"] = "撤离！",
		["restoration_level_data_escape_park"] = "撤离！",
		["restoration_level_data_escape_cafe_day"] = "撤离！",
		["restoration_level_data_escape_park_day"] = "撤离！",
		["restoration_level_data_escape_street"] = "撤离！",
		["restoration_level_data_escape_overpass"] = "撤离！",
		["restoration_level_data_escape_garage"] = "撤离！",
		["restoration_level_data_escape_overpass_night"] = "撤离！",
		["restoration_level_data_safehouse"] = "中午12:00 , 安全屋",
		["restoration_level_data_arm_fac"] = "早晨9:30 , 港口",
		["restoration_level_data_arm_par"] = "下午2:25 , 市中心",
		["restoration_level_data_arm_hcm"] = "下午2:15 , 市中心",
		["restoration_level_data_arm_cro"] = "中午12:55 , 麦卡丝街与詹姆斯街的交叉口",
		["restoration_level_data_arm_und"] = "晚上8:15 , 地下通道",
		["restoration_level_data_arm_for"] = "中午12:25 , 穿山甲列车",
		["restoration_level_data_family"] = "上午11:25 , 一家欢乐颂",
		["restoration_level_data_family_res"] = "上午11:25 , 一家欢乐颂",
		["restoration_level_data_big"] = "下午2:15 , 大银行",
		["restoration_level_data_big_res"] = "下午2:15 , 大银行",
		["restoration_level_data_roberts"] = "早晨8:47 , 罗伯特的储蓄银行",
		["restoration_level_data_roberts_v2"] = "早晨8:47 , 罗伯特的储蓄银行",
		["restoration_level_data_mia_1"] = "晚上9:30 , 政委的汽车旅馆",
		["restoration_level_data_mia_2"] = "中午11:45 , 政委的公寓迷宫",
		["restoration_level_data_mia2_new"] = "中午11:45 , 政委的公寓迷宫",
		["restoration_level_data_kosugi"] = "凌晨4:00 , 码头边的仓库",
		["restoration_level_data_gallery"] = "晚上11:45 , 国家级美术馆",
		["restoration_level_data_hox_1"] = "上午10:30 , 地下执法通道",
		["restoration_level_data_hox_2"] = "下午4:10 , J. Edgar Hoover的大厦",
		["restoration_level_data_pines"] = "傍晚5:52 , 森林深处...",
		["restoration_level_data_mus"] = "晚上8:15 , McKendrick的古代艺术博物馆",
		["restoration_level_data_crojob2"] = "傍晚6:10 , 华盛顿港口",
		["restoration_level_data_crojob3"] = "下午3:35 , 丛林郊区",
		["restoration_level_data_crojob3_night"] = "晚上8:35 , 丛林郊区",
		["restoration_level_data_cage"] = "晚上7:55 , Teuer4S店",
		["restoration_level_data_hox_3"] = "晚上11:55 , FBI安全屋",
		["restoration_level_data_rat"] = "晚上7:55 , 寂静岭",
		["restoration_level_data_shoutout_raid"] = "早晨9:00 , 码头仓库",
		["restoration_level_data_arena"] = "晚上9:00 , GENSEC活动广场",
		["restoration_level_data_kenaz"] = "晚上8:00 , 拉斯维加斯大道-金牙大赌场",
		["restoration_level_data_jolly"] = "下午4:00 , 洛杉矶-灾区",
		["restoration_level_data_red2"] = "下午2:15 , 市中心-第一世界银行",
		["restoration_level_data_dinner"] = "早晨8:01 , 屠宰场-埋伏！",
		["restoration_level_data_nail"] = "0:00 , 寂静岭",
		["restoration_level_data_haunted"] = "??:?? , 不安全屋",
		["restoration_level_data_pbr"] = "凌晨4:40 , 内华达-黑山岭设施",
		["restoration_level_data_pbr2"] = "未知时间, Z-170型'宙斯'-黑水货运飞机",
		["restoration_level_data_cane"] = "下午3:15 , 圣诞老人的工坊",
		["restoration_level_data_peta"] = "中午12:00 , 市中心",
		["restoration_level_data_peta2"] = "清晨5:43 , 事发突然-谷仓",
		["restoration_level_data_man"] = "清晨6:00 , 废弃的建筑区",
		["restoration_level_data_pal"] = "中午12:00 , 郊区-博迪的水管维修计划",
		["restoration_level_data_short1_stage1"] = "未知时间，秘密地点",
		["restoration_level_data_short1_stage2"] = "未知时间，秘密地点",
		["restoration_level_data_short2_stage1"] = "未知时间，秘密地点",
		["restoration_level_data_short2_stage2"] = "未知时间，秘密地点",
		["restoration_level_data_short2_stage2b"] = "未知时间，秘密地点",
		["restoration_level_data_dark"] = "凌晨2:21 , 隐蔽的列车场",
		["restoration_level_data_mad"] = "未知时间，俄罗斯某地...",
		["restoration_level_data_born"] = "上午10:15 , OVERKILL MC 俱乐部 & 吧台",
		["restoration_level_data_chew"] = "下午5:25 , 华盛顿外围-正在行进中的火车！",
		["restoration_level_data_flat"] = "下午4:02 , 计划-查韦斯的据点",
		["restoration_level_data_chill"] = "下午1:00 , 安全屋",
		["restoration_level_data_chill_combat"] = "下午1:00 , 安全屋-警方突袭！",
		["restoration_level_data_help"] = "别 碰 那 个 表 盘 ， 我 们 才 刚 刚 开 始 呢 ！",
		["restoration_level_data_friend"] = "下午4:30 , 迈阿密-El Fureidis庄园",
		["restoration_level_data_fish"] = "傍晚7:30 , 纽约市外围-'Lethe'游艇",
		["restoration_level_data_spa"] = "傍晚7:00 , 纽约市-埋伏！",
		["restoration_level_data_moon"] = "晚上11:00 , 穆里卡购物中心",
		["restoration_level_data_run"] = "上午11:00 , 住宅区-双交叉口",
		["restoration_level_data_glace"] = "晚上10:45 , 格林大桥-南桥",
		["restoration_level_data_dah"] = "凌晨1:30 , 22楼-加内特所处的摩天大楼",
		["restoration_level_data_hvh"] = "叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。叮，咚。",
		["restoration_level_data_wwh"] = "未知时间, 阿拉斯加某处...",
		["restoration_level_data_rvd1"] = "秘密的时间，秘密的地点",
		["restoration_level_data_rvd2"] = "秘密的时间，秘密的地点",
		["restoration_level_data_brb"] = "傍晚6:53 , 纽约, 布鲁克林-丰信银行",
		["restoration_level_data_des"] = "秘密的时间, 内华达州-亨利之石",
		["restoration_level_data_sah"] = "秘密的时间, 马萨诸塞州-沙克索恩拍卖园",
		["restoration_level_data_tag"] = "凌晨12:43 , J. Edgar Hoover的大厦",
		["restoration_level_data_bph"] = "秘密的时间, 克拉索普堡监狱",
		["restoration_level_data_nmh"] = "晚上8:24 , 仁慈医院-隔离病房区",
		["restoration_level_data_vit"] = "下午1:07 , 华盛顿哥伦比亚特区-白宫",
		["restoration_level_data_mex"] = "秘密的时间, 美国-南部边界",
		["restoration_level_data_mex_cooking"] = "秘密的时间, 墨西哥-Coyopa复合物",
		["restoration_level_data_bex"] = "秘密的时间, 墨西哥-圣马丁银行",
		["restoration_level_data_pex"] = "秘密的时间, 墨西哥-警察局",
		["restoration_level_data_fex"] = "秘密的时间, 墨西哥-布鲁克庄园",
		["restoration_level_data_wetwork"] = "秘密的时间, 秘密的地点",
		["restoration_level_data_junk"] = "秘密的时间, 秘密的地点",
		["restoration_level_data_holly"] = "下午5:00 , 洛杉矶-卢卡斯的庄园",
		["restoration_level_data_lvl_friday"] = "下午5:00 , 大型购物中心",

		["heist_greattrain_name"] = "Time Window",
		["heist_easystore_name"] = "全年无休",
		["heist_sin_villa_name"] = "SCORE: Villa Vivaldi",
		["heist_dragon_name"] = "铁拳",
		["heist_jkl_base_name"] = "胡狼的安全屋",
		["heist_junger_name"] = "扭曲天使",
		["heist_deep_name"] = "置之不理",
		["heist_blood_name"] = "\"尸山\"",
		["heist_crystal_name"] = "恐惧之奴",
		["heist_gold_name"] = "Remains of Nothing",
		["heist_titanium_name"] = "主权之争",
		["heist_airport_name"] = "航位推测",
		["heist_platinum_name"] = "表面张力",
		["heist_cursed_name"] = "大丰收",
		["heist_holly_name"] = "成名之夜",

		["heist_platinum_brief"] = "船上闹翻天",
		["heist_jackal_surface_tension_name"] = "OMNIA研究船，型号SN-XR-LETHE",
		["heist_jackal_surface_tension_brief"] = "占位符",

		["heist_vivinite_name"] = "原爆日",

		["heist_contact_shatter"] = "胡狼与雷蛇",
		["heist_contact_akashic"] = "尼可",

		["menu_contacts_shatter"] = "CRIMENET成员",
		["heist_contact_shatter_description"] = "胡狼与雷蛇，CRIMENET骨干与战斗部队管理者。他们对OMNIA技术公司和Gensec恨之入骨。",
		["heist_contact_jackal_description"] = "胡狼起初为Gensec工作，但很快在一次牵扯到Gensec和OMNIA的人口贩卖事件后辞职。\n\n现在他为CRIMENET效力，将战斗带到它们的地盘上。",
		["heist_contact_raze_description"] = "雷蛇，一个技巧娴熟的战士，胡狼的犯罪搭档。\n\n1995年生人，于15岁时离家出走，从此开始了犯罪生活并一去不复返。",
		["heist_contact_akashic_description"] = "曾在赫克特·莫拉莱斯手下工作的高级中尉，尼古拉斯·\"尼可\"·雷内现在指挥着锡那罗亚贩毒集团在美国的残部。\n他们数量较少，因此规模更大的哥伦比亚贩毒集团不愿帮助他们，也不愿改善同CRIMNET的关系。\n\n于是尼可拉拢了在东海岸活动的各种小规模帮派并同CRIMENET结盟，他会提供他的资源以换取CRIME.NET的服务。",

		["bm_msk_shatter_true"] = "雷蛇",
		["bm_msk_shatter_true_desc"] = "胡狼的犯罪同伙，雷蛇的面具。凤凰代表着重生。每次死亡都会带来新生命。雷蛇相信这个面具是她的\"护身符\"，没有它雷蛇无法干到现在。",

		["menu_l_global_value_veritas"] = "恢复MOD",
		["menu_l_global_value_veritas_desc"] = "这是一件恢复MOD物品！",

		["menu_alex_1_zipline"] = "运包滑索",

		["menu_asset_wet_intel"] = "情报",
		["menu_asset_risk_murky"] = "黑水雇佣兵",
		["menu_asset_risk_bexico"] = "联邦警察",
		["menu_asset_risk_zombie"] = "僵尸部队",
		["menu_asset_wet_boat"] = "快艇",
		["menu_asset_wet_boat_desc"] = "购买一个额外的运包与撤离快艇",

		["bm_msk_canada"] = "冰球炼狱",
		["bm_msk_canada_desc"] = "不要留下任何东西——即使大军压境了也不行！当你对此有所追求的时候，你必须为之而战。（即便条子的进攻如温压炸药一般势不可挡）",
		["bm_msk_jsr"] = "涂鸦女士",
		["bm_msk_jsr_desc"] = "由一位真正的艺术家制作。清理涂鸦就像烧掉一本书，对吧？\n\n艺术就是艺术，尊重它。",
		["bm_msk_jsrf"] = "涂鸦先生",
		["bm_msk_jsrf_desc"] = "涂鸦生涯就是一种传说。在冷酷的城市中做一名艺术家是一个痛苦的故事。\n\n涂鸦就像书一样讲述着这些传说。你最好读一读它们。",
		["bm_msk_courier_stash"] = "战利品",
		["bm_msk_courier_stash_desc"] = "万一你想多带几百美元，而你口袋里又没有地儿，这个面具就派上用场了。",

		["bm_msk_female_mask"] = "标准分发面具（女性）",
		["bm_msk_female_mask_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。",
		["bm_msk_female_mask_blood"] = "补好的面具（女性）",
		["bm_msk_female_mask_blood_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。\n\n这是在对OMNIA仓库一次血肉横飞的拙劣抢劫后发现的面具。\n\n保安在失联前留下的最后一条消息是\"紧急警报\"。",
		["bm_msk_female_mask_clown"] = "罗茜",
		["bm_msk_female_mask_clown_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。\n\n这个面具曾由一个绰号叫罗茜的劫匪佩戴，虽然她这几天戴上新的面具了...\n\n监控录像显示，她手无寸铁地撂倒了一队特警。",
		["bm_msk_male_mask"] = "标准分发面具（男性）",
		["bm_msk_male_mask_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。",
		["bm_msk_male_mask_blood"] = "补好的面具（男性）",
		["bm_msk_male_mask_blood_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。\n\n这是在对OMNIA仓库一次只剩尸体和血迹的拙劣抢劫后发现的面具。\n\n船员在失联前留下的最后一条消息是\"紧急警报\"。",
		["bm_msk_male_mask_clown"] = "克罗斯",
		["bm_msk_male_mask_clown_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。\n\n这个面具曾由一个绰号叫克罗斯的劫匪佩戴，虽然他这几天戴上新的面具了...\n\n一个天赋异禀的神枪手，他曾在五秒内干掉了四个装甲运钞车司机。",

		["bm_msk_twister_mask"] = "神秘人",
		["bm_msk_twister_mask_desc"] = "这个面具背后的人是个谜。\n\n他可能是素昧相识的人，也可能是天天与你说笑的好朋友。",
		["bm_msk_voodoo_mask"] = "黑魔法",
		["bm_msk_voodoo_mask_desc"] = "这个面具于遭受过轰炸的丛林废墟中找到，它经受住了大屠杀和自然界的考验，现在它以预兆为人所知。\n\n在你最需要它的时候它很可能找到你，给你带来好运以度过灾厄。不过，仔细想想——代价是什么呢？",

		["bm_msk_f1"] = "X1头盔",
		["bm_msk_f1_desc"] = "当沿着高速公路与拥挤街道疾驰而过时，确保你做好了防护。\n\n它可能保护你免于严重摔伤——但肯定不是子弹。",
		["bm_msk_f1_b"] = "X1头盔（纯净版）",
		["bm_msk_f1_b_desc"] = "当沿着高速公路与拥挤街道疾驰而过时，确保你做好了防护。\n\n它可能保护你免于严重摔伤——但肯定不是子弹。\n\n这是一个和一堆花哨摩托一起在扣留所被发现的，没有那些品牌贴纸贴着的头盔的复制品。\n\n把这个放在手边，你有可能会自己骑摩托。",
		["bm_msk_sweettooth"] = "甜蜜之牙",
		["bm_msk_sweettooth_desc"] = "蜜牙，真名马库斯·\"尖针\"·凯恩，一个来自变态金属电子游戏系列的角色。蜜牙因做一个驾驶冰淇凌战斗卡车的杀手小丑而出名。\n\n据说他曾从一个精神病院逃出来。现在他过着犯罪的生活。",

		["bm_msk_wolf_stone"] = "铁心沃尔夫",
		["bm_msk_wolf_stone_desc"] = "沃尔夫最初的面具源自于他第一次犯罪时实施他最喜欢的媒体上的犯罪行为。这个灵感来源于电子游戏\"急速劫掠\"的面具被认为在一次抢劫中丢失。\n\n在团伙早期干了一些合约后，这个面具再次出现并被贝恩的一个联系人带到了安全屋。\n\n这个面具原本的图案已经随着时间部分磨损，也许反映了沃尔夫精神稳定的下降。",

		["bm_msk_dallas_aged"] = "远古达拉斯",
		["bm_msk_dallas_aged_desc"] = "你和你的团队在猎宝奇兵的诡异埃及宝箱中找到的这些面具。宝箱在随后的运输中被截获，里面剩下的东西被交给你们。\n\n关于这些面具的事情…很不寻常。没有关于它们来自哪里的情报。\n\n胡狼推测这可能就是个笑话，或者是某种吓跑四人组的尝试。\n\n不过你又能知道啥呢？它们看起来非常，非常古老。",
		["bm_msk_chains_aged"] = "远古钱恩斯",
		["bm_msk_chains_aged_desc"] = "你和你的团队在猎宝奇兵的诡异埃及宝箱中找到的这些面具。宝箱在随后的运输中被截获，里面剩下的东西被交给你们。\n\n关于这些面具的事情…很不寻常。没有关于它们来自哪里的情报。\n\n胡狼推测这可能就是个笑话，或者是某种吓跑四人组的尝试。\n\n不过你又能知道啥呢？它们看起来非常，非常古老。",
		["bm_msk_hoxton_aged"] = "远古霍斯顿",
		["bm_msk_hoxton_aged_desc"] = "你和你的团队在猎宝奇兵的诡异埃及宝箱中找到的这些面具。宝箱在随后的运输中被截获，里面剩下的东西被交给你们。\n\n关于这些面具的事情…很不寻常。没有关于它们来自哪里的情报。\n\n胡狼推测这可能就是个笑话，或者是某种吓跑四人组的尝试。\n\n不过你又能知道啥呢？它们看起来非常，非常古老。",
		["bm_msk_wolf_aged"] = "远古沃尔夫",
		["bm_msk_wolf_aged_desc"] = "你和你的团队在猎宝奇兵的诡异埃及宝箱中找到的这些面具。宝箱在随后的运输中被截获，里面剩下的东西被交给你们。\n\n关于这些面具的事情…很不寻常。没有关于它们来自哪里的情报。\n\n胡狼推测这可能就是个笑话，或者是某种吓跑四人组的尝试。\n\n不过你又能知道啥呢？它们看起来非常，非常古老。",

		["bm_msk_beef_dallas"] = "牛肉达拉斯",
		["bm_msk_beef_dallas_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n达拉斯选择继续保持他那标志性的小丑面具设计。",
		["bm_msk_beef_chains"] = "牛肉钱恩斯",
		["bm_msk_beef_chains_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n作为暴徒的钱恩斯想要一种骇人的动物作为自己的面具设计。还有什么会比一只该死的恐龙更骇人呢？",
		["bm_msk_beef_hoxton"] = "牛肉霍斯顿",
		["bm_msk_beef_hoxton_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n霍斯顿对于他的面具设计要求简单明了：\n-有保护！\n-很高效！\n-够时髦！\n\n于是，这个面具诞生了。",
		["bm_msk_beef_wolf"] = "牛肉沃尔夫",
		["bm_msk_beef_wolf_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n沃尔夫的面具设计灵感源于他在游戏开发时期所喜欢的角色设计之一。",

		["bm_msk_vyse_dallas"] = "起源",
		["bm_msk_vyse_dallas_desc"] = "维斯与胡椒魔鬼相视而立并活了下来，这个面具就是用那个魔鬼的骨头做的。",
		["bm_msk_vyse_chains"] = "天真童稚",
		["bm_msk_vyse_chains_desc"] = "尽管维斯偷了诺克斯堡都装不下的钱和黄金，他仍有资助患病的孩子们的高尚行为。\n\n据说贝恩见了一些受资助的孩子们，这个面具就是他们对维斯的谢礼。",
		["bm_msk_vyse_hoxton"] = "活宝三人组",
		["bm_msk_vyse_hoxton_desc"] = "他们说当你搞砸了的时候，你应该直面苦难并再次尝试。但维斯不是这样。每次搞砸他就会被前军人掌挝，然后继续干。即使是拉里、柯利和莫也受不了这样的毒打。",
		["bm_msk_vyse_wolf"] = "贝尔·格里尔斯",
		["bm_msk_vyse_wolf_desc"] = "维斯向贝尔·格里尔斯挑战喝尿比赛…维斯赢了，然后格里尔斯先生用他的生存技能帮忙制作这个面具。",

		["bm_msk_secret_old_hoxton"] = "惊世之秘 涅槃霍斯顿",
		["bm_msk_secret_old_hoxton_desc"] = "霍斯顿离开故土前往他乡加入PAYDAY。当贝恩第一次告诉他惊世之秘的时候，他畅想于为了远古之物的潜在价值而追寻，一点也不在乎贝恩所谈论的传说之力真实与否。",

		["bm_msk_secret_clover"] = "惊世之秘 克洛芙",
		["bm_msk_secret_clover_desc"] = "当贝恩告诉克洛芙惊世之秘的时候，她对此很怀疑；贝恩对有着神秘力量的远古之物的谈论在她看来总是无稽之谈，但是当她面对着由三个秘宝里的物品所组装的东西时，心头的疑惑便烟消云散了。",

		["bm_msk_secret_dragan"] = "惊世之秘 德拉甘",
		["bm_msk_secret_dragan_desc"] = "作为一名前警察，德拉甘有着对证据的鉴别能力。当贝恩向他展示了他关于惊世之秘的研究时，他已经做好了寻找有着神秘力量的远古之物了。",

		["bm_msk_secret_bonnie"] = "惊世之秘 邦妮",
		["bm_msk_secret_bonnie_desc"] = "邦妮在贝恩告诉她惊世之秘后，立马灌了一大口她最爱的威士忌，并急不可耐地要去干翻\"共盟会\"了。",

		["bm_msk_secret_syndey"] = "惊世之秘 希妮",
		["bm_msk_secret_syndey_desc"] = "当贝恩告诉她惊世之秘的时候，希妮不信远古力量的传说。但就算有机会挑战未知，能骑在当权者的头上也足以让她入伙了。",

		["bm_msk_secret_richard"] = "惊世之秘 理查德",
		["bm_msk_secret_richard_desc"] = "在犯罪地下世界流传着关于启发了夹克男的杀手的传言：一个有着出自未知组织之手的阴暗结局的杀手。当贝恩告诉夹克男惊世之秘后，他随即戴着那个似乎灵感源自于那个杀手的面具出现了。",

		["bm_all_seeing"] = "全视之锚",
		["bm_all_seeing_desc"] = "骇人之景，梦魇之象。\n\n存在之力已注视着你，确保你的付出有所回报。",

		["bm_msk_classic_helmet"] = "经典执法者",
		["bm_msk_classic_helmet_desc"] = "一个前特警执法者赠送的礼物。在他退休前他找到了胡狼…并只提供了他能搞到的装备来助胡狼一臂之力。\n\n他那令人好奇的帮助只因一个理由：他亲眼看到了OMNIA的暗中所为。可是他拒绝透露那些秘密并随后快速离开，自此之后再也没看见过他。\n\n胡狼把这些头盔送了出去。这是对你所做贡献的奖励。",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "打个占位符，我们会抽出时间做这个的。",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "胡狼的面具，或者说是个重制品。\n\n真的那个面具对胡狼来说很重要，有些人说那个正品有敏感数据。\n\n但是这个运行显示器的重制品的系统非常简陋，仅仅是想复制那个正品。\n\n为你的努力所给的礼物。",


		["bm_msk_finger"] = "格里弗",
		["bm_msk_finger_desc"] = "格里弗是神话中很久以前就在这个世界上的野兽。它会故意追逐并骚扰城镇与乡村的平民百姓，用意想不到的方式猎杀他们。格里弗以这些行为取乐并威胁到了和平，最终国王的手下找到并消灭了它。",

		["bm_msk_instinct"] = "直觉",
		["bm_msk_instinct_desc"] = "这个面具属于一个来自遥远地方的神秘战士。他行走于世，在直觉引导下在世界各地猎捕邪恶势力。最终，他归于宁静，因为他知道他的事业后继有人。",

		["bm_msk_unforsaken"] = "矢志不渝",
		["bm_msk_unforsaken_desc"] = "这个传奇面具象征着我们对社区的奉献、理解和始终支持的赞赏。来自我们在OVERKILL的组员——我们向您致敬。\n\n风雨同舟，打爆条子狗头。",

		["bm_msk_chains_halloween"] = "破裂之盾",
		["bm_msk_chains_halloween_desc"] = "作为一名雇佣兵，你会见到许多痛苦，以及死亡。即使你觉得自己刀枪不入、无人能挡…有时它也会挥之不去地缠着你。\n\n在2008年10月的一个明朗愉快的雪天下午，钱恩斯正在睡懒觉。他刚刚为黑水完成了一项暗杀工作，干了难活、拿了报酬、开了个舒适的酒店房间来睡觉。\n\n这么多年来他第一次做了噩梦，他想不起来是什么了，但他记得他半睡半醒鬼压床，一个更似骷髅而非人类的人影紧盯着他，可他却动弹不得。\n\n自那天之后，每次当他举枪杀人，接下来的那个夜晚就会躁动不安、糟糕可怕。\n\n最后，他不得不说：\"够了。\"他金盆洗手，看心理医生，吃药来治疗。那一年的生活是那么的美好…\n\n就在一年后的2009年10月31日，黑水确信那个不干了去修复自己生活的人会泄密、试图中伤公司，他们不能让那发生。\n\n钱恩斯被逼开始犯罪生活以保护自己，再一次成为一个斗士。\n\n但是这一次呢？和之前完全不同。噩梦和睡眠瘫痪没有再找上门。他不是为了伤害他人而伤害他人。\n\n这次，他是为了保护自己。",

		["bm_msk_dallas_halloween"] = "怪物倒影",
		["bm_msk_dallas_halloween_desc"] = "花了这么多年伪造身份、编织谎言、虚构故事，你开始失去真实的自己。\n\n你开始不断切换身份，从你的朋友、爱人和炮友那里学来特点和怪癖。也许它们开始融合在一起，你感觉自己就是个缝合怪。\n\n达拉斯在十月的一个清晨醒来，走向镜子——染成了丑陋的金色的头发和胡乱刮的胡子、一套沾了不安噩梦的汗水的俗气西装、在周末喝了一顿又一顿酒后的头痛欲裂。\n\n他凝视着镜中的自己，感觉自己更像是弗兰肯斯坦的怪物而非一个人：就是一堆零七碎八足以在犯罪道路上进一步发展的拼凑起来的东西。\n\n那是一个转折点，但是有时他仍止不住地感觉到部分灵魂本不属于他。",

		["bm_msk_hoxton_halloween"] = "万圣节之梦",
		["bm_msk_hoxton_halloween_desc"] = "霍斯顿的万圣节记忆之一是十月份和他的亲戚去美国旅行，把去纽约看作一种特殊的短途旅行。\n\n他从来不是狂热的糖果爱好者，但他却酷爱亲戚家派对上的南瓜派。\n\n当他在聚会大厅外的门厅闲逛时，他看到了一个巨大的金库大门，各种珠宝财富正在被推进去。\n\n自此，他总是热衷于在假日里席卷各地。",

		["bm_msk_wolf_halloween"] = "恶魔尖啸",
		["bm_msk_wolf_halloween_desc"] = "在2010年一个寒冷的10月夜晚，沃尔夫还在从公司倒闭的财政余波中恢复过来。\n\n他独自躺在汽车旅馆里，想起了他的家人，想起了他如何辜负了他们，以及怎么再也见不到他们——在他最后的生命之柱离他而去后全世界抛弃了他。\n\n为了筹到足够的钱重新开始成家立业而花光了所有积蓄前往美国后，他被现实所击垮。\n\n来往奔波于朋友、汽车旅馆和收容所几周后，他收到了几个星期以来第一个重要的电话。\n\n合作关系结束了，\"我不再看好这件事了。\"\n\n也许有一个崭新的开始。\n\n也许有一个新的职业来追求。",


		["pattern_jkl_patt01_title"] = "豺狼",
		["pattern_jkl_patt02_title"] = "陪伴",
		["material_jkl_matt01_title"] = "战斗之羽",
		["material_jkl_matt02_title"] = "真理之金",

		["menu_scores"] = "得分",

		["RestorationModColorOption"] = "根据您的偏好设置HUD各对象的颜色",
		["RestorationModColorsOptionsButtonTitleID"] = "颜色设置",
		["RestorationModColorsOptionsButtonDescID"] = "设置HUD各对象的颜色",
		["RestorationModObjectivesBGTitleID"] = "任务指示器背景颜色",
		["RestorationModObjectivesFGTitleID"] = "任务指示器字体颜色",
		["RestorationModAssaultBGTitleID"] = "突击横幅背景颜色",
		["RestorationModAssaultFGTitleID"] = "突击横幅字体颜色",
		["RestorationModNoReturnTitleID"] = "任务即将失败字体颜色",
		["RestorationModTimerTextTitleID"] = "劫案计时器字体颜色",
		["RestorationModAssaultEndlessBGTitleID"] = "队长突击横幅背景颜色",
		["RestorationModAssaultSurvivedBGTitleID"] = "突击存活横幅背景颜色",
		["RestorationModStaminaTitleID"] = "耐力指示器颜色",
		["RestorationModStaminaThresholdTitleID"] = "奔跑耐力下限",
		["RestorationModBagBitmapTitleID"] = "包图形颜色",
		["RestorationModBagTextTitleID"] = "包字体颜色",
		["RestorationModNoReturnTextTitleID"] = "任务即将失败字体颜色",
		["RestorationModHostagesTextTitleID"] = "人质数量颜色",
		["RestorationModHintTextTitleID"] = "提示字体颜色",
		["RestorationModMaskOnTextTitleID"] = "佩戴面具字体颜色",
		["RestorationModStopAllBotsTitleID"] = "停下全部AI",
		["RestorationModStopAllBotsDescID"] = "长按AI停止键以停下全部AI。",
		["RestorationModPONRTrackTitleID"] = "任务即将失败音乐",
		["RestorationModPONRTrackDescID"] = "改变当任务即将失败开始时专业劫案的音乐。",
		["RestorationModPONRTracksTitleID"] = "任务即将失败音乐",
		["RestorationModPONRTracksDescID"] = "选择当任务即将失败开始时专业劫案的音乐。",
		["RestorationModMusicShuffleTitleID"] = "音乐切换",
		["RestorationModMusicShuffleDescID"] = "突击结束后切换音乐。",
		["RestorationModScaleTitleID"] = "HUD缩放",
		["RestorationModScaleDescID"] = "调整HUD缩放。可能需要重新开始劫案才能生效。",
		["RestorationModSizeOnScreenTitleID"] = "HUD屏幕中大小",
		["RestorationModSizeOnScreenDescID"] = "调整HUD于屏幕中大小。可能需要重新开始劫案才能生效。",
		["RestorationModTeammateTitleID"] = "alpha队友面板",
		["RestorationModTeammateDescID"] = "开启或关闭显示你与你的小队的统计数据的alpha队友面板。",
		["RestorationModHeistTimerTitleID"] = "alpha劫案计时器",
		["RestorationModHeistTimerDescID"] = "开启或关闭alpha劫案计时器。",
		["RestorationModMaskOnTitleID"] = "alpha佩戴面具文字",
		["RestorationModMaskOnDescID"] = "开启或关闭alpha佩戴面具文字。",
		["RestorationModNameLabelsTitleID"] = "alpha姓名标签",
		["RestorationModNameLabelsDescID"] = "开启或关闭alpha姓名标签。",
		["RestorationModHintTitleID"] = "alpha提示框",
		["RestorationModHintDescID"] = "开启或关闭alpha提示框。",
		["RestorationModExtraOptionsButtonTitleID"] = "更多HUD选项",
		["RestorationModExtraOptionsButtonDescID"] = "甚至更多选项！",
		["RestorationModRealAmmoTitleID"] = "真实弹药数量",
		["RestorationModRealAmmoDescID"] = "总弹药计数忽略当前武器中弹药。",
		["RestorationModStealthOrigPosTitleID"] = "原版警觉度指示器位置",
		["RestorationModStealthOrigPosDescID"] = "将警觉度指示器设置于原版位置。",
		["RestorationModLowerBagTitleID"] = "降低背包弹出栏",
		["RestorationModLowerBagDescID"] = "降低背起包时弹出框位置。",
		["RestorationModAssaultStyleTitleID"] = "突击横幅风格",
		["RestorationModAssaultStyleDescID"] = "允许您选择一种您想用的突击横幅风格。",
		["RestorationModCasingTickerTitleID"] = "Alpha踩点类型",
		["RestorationModCasingTickerDescID"] = "开启或关闭Alpha踩点类型（需要Alpha类型风格）。",
		["RestorationModCustodyTitleID"] = "Alpha拘留",
		["RestorationModCustodyDescID"] = "开启或关闭Alpha拘留面板。",
		["RestorationModCrimenetTitleID"] = "Alpha CRIMENET (WIP)",
		["RestorationModCrimenetDescID"] = "开启或关闭Alpha CRIMENET。",
		["RestorationModProfileTitleID"] = "Alpha个人资料栏",
		["RestorationModProfileDescID"] = "开启或关闭Alpha个人资料栏。",
		["RestorationModNewsfeedTitleID"] = "Alpha新闻速览",
		["RestorationModNewsfeedDescID"] = "开启或关闭Alpha新闻速览。",
		["RestorationModUppercaseNamesTitleID"] = "姓名大写",
		["RestorationModUppercaseNamesDescID"] = "开启或关闭姓名大写。",
		["RestorationModPeerColorsTitleID"] = "Alpha同伴颜色",
		["RestorationModPeerColorsDescID"] = "开启或关闭Alpha同伴颜色。",
		["RestorationModPocoCrimenetAlignSortTitleID"] = "Poco对齐排序CRIMENET",
		["RestorationModPocoCrimenetAlignSortDescID"] = "按照难度对齐排序CRIMENET。",
		["RestorationModPocoCrimenetScaleTitleID"] = "Poco CRIMENET尺寸",
		["RestorationModPocoCrimenetScaleDescID"] = "允许您设置CRIMENET尺寸。",
		["RestorationModVoiceIconTitleID"] = "语音聊天图标",
	    ["RestorationModVoiceIconDescID"] = "当玩家使用游戏内语音聊天时显示。",
		["alpha_assault"] = "早期Alpha角",
		["beta_assault"] = "Alpha类型",

		["menu_ingame_manual"] = "大修指南",
		["menu_ingame_manual_help"] = "阅览关于Restoration大修的指南。",

		["menu_asset_wet_add_saw"] = "额外电锯",
		["menu_asset_wet_add_saw_desc"] = "购买一个额外电锯",
		["menu_rush_asset_sentrygun"] = "哨戒机枪包",
		["menu_rush_asset_sentrygun_desc"] = "购买一个哨戒机枪包",

		["heist_junker_name"] = "不速之客",
		["heist_junker_brief"] = "这是为弗拉德干的活。很显然，一次拙劣的交易让他的手下和他们带的货陷入了糟糕境地——联邦警察正在赶来的路上。我们准备好了一辆车送你去交易地点，接下来你可以给他们提供支援。我们会通过直升机把你和那堆东西带走。\n\n这应该很快就能完，但不要小看了条子。带上你的战斗装备。",
		["heist_junk_name"] = "警惕守卫",
		["heist_junk_brief"] = "建筑工地就在前头，条子们虽然还没到但是也快了。弗拉德的人能给你些支援但他们恐怕也撑不了那么久。\n\n汇报显示现场显然有一个冰毒实验室，所以如果你能保证弗拉德的东西安然无恙的话可以随便搞点额外小钱。",
		["junk_01"] = "守住钱和毒品",
		["junk_01_desc"] = "让那些条子离东西远点！冰毒和钱都要守住了。",
		["junk_02"] = "放置并射击点燃每一个汽油桶",
		["junk_02_desc"] = "生个火，这会让飞行员注意到你的位置。",
		["junk_03"] = "守住钱和毒品",
		["junk_03_desc"] = "别让条子拿走弗拉德任何的货！如果丢了太多包那么行动就失败了！",
		["junk_04"] = "运走弗拉德的货",
		["junk_04_desc"] = "运走弗拉德的可卡因。他的人会把钱运走的。",
		["junk_05"] = "可以撤离",
		["junk_05_desc"] = "拿够了战利品就可以撤。",

		["heist_int_dock_name"] = "虎口拔牙",
		["heist_int_dock_brief"] = "这个仓库由黑水后勤所有，至少说，是现在。他们已经用这个地方当作物品收留所一段时间了，但是最近发现他们在运送一些\"机密\"服务器。情报显示它们有一些关于他们和OMNIA的联盟的信息。\n\n不论强袭或潜入，找到并带走那些数据是唯一的目标。无论采用何种方式，做好对方抵抗的准备。",
		["heist_wetwork_name"] = "虎口拔牙",
		["heist_wetwork_brief"] = "这个仓库由黑水后勤所有，至少说，是现在。他们已经用这个地方当作物品收留所一段时间了，但是最近发现他们在运送一些\"机密\"服务器。情报显示它们有一些关于他们和OMNIA的联盟的信息。\n\n不论强袭或潜入，找到并带走那些数据是唯一的目标。无论采用何种方式，做好对方抵抗的准备。",
		["obj1_enterwarehouse"] = "进入仓库",
		["obj1_enterwarehouse_desc"] = "进入仓库。",
		["obj2_findsecuritydoor"] = "找到服务器机房",
		["obj2_findsecuritydoor_desc"] = "找到服务器机房，它应该在仓库里某扇上锁的门后。",
		["obj3_getsecuritydooropen"] = "打开门",
		["obj3_getsecuritydooropen_desc"] = "想办法打开门。",
		["obj4_openseconddoor"] = "进入服务器机房",
		["obj4_openseconddoor_desc"] = "进入服务器机房，钥匙卡或者钻机可能排得上用场。",
		["obj5_hack"] = "骇入笔记本",
		["obj5_hack_desc"] = "胡狼提供的软件骇入笔记本。",
		["obj5b_explode"] = "拆除C4！",
		["obj5b_explode_desc"] = "C4！拆除它们或者赶快跑！",
		["obj6_wait"] = "发送数据",
		["obj6_wait_desc"] = "骇入完成，将数据发送给胡狼。",
		["obj7_escapeorloot"] = "可以撤离",
		["obj7_escapeorloot_desc"] = "拿够了战利品就离开这里。",

		["heist_int_dock_burn_name"] = "火上眉梢",
		["heist_int_dock_burn_brief"] = "没时间详细计划了，他们要把额外的主服务器运走了。\n司机会把一辆载着全副武装的小丑的卡车停到他们的门口。",
		["heist_wetwork_burn_name"] = "火上眉梢",
		["heist_wetwork_burn_brief"] = "好了，我们就要到现场了。你曾经来过这里，但这次我们要一路杀进去。\n也许还有些值钱的东西留在附近，但那是次要的。\n\n留意任何能帮你知道那些关着的集装箱里有什么的东西，摄像头、集装箱边上的东西、白板等等。",
		["wwburn_01"] = "做好准备",
		["wwburn_01_desc"] = "一旦到了仓库前门，黑水会到处都是，所以准备好你的枪。",
		["wwburn_02"] = "找到服务器",
		["wwburn_02_desc"] = "找到三个装有主服务器的集装箱。",
		["wwburn_03"] = "烧掉备份",
		["wwburn_03_desc"] = "烧掉和主服务器在同一个集装箱的主服务器备份。",
		["wwburn_04"] = "可以撤离",
		["wwburn_04_desc"] = "撤离，或者运走更多的战利品。",

		["wwburn_serverpku"] = "运走",
		["wwburn_gaspku"] = "搜集",
		["wwburn_defend"] = "守卫",
		["wwburn_container"] = "集装箱",

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

		["gm_gms_purchase"] = "通过大陆币购买",
		["gm_gms_purchase_window_title"] = "你确定？",
		["gm_gms_purchase_window_message"] = "你真的要购买'{1}'？\n\n这会花费{2} {3}。",
		["gm_gms_purchase_failed"] = "无法购买",
		["gm_gms_free_of_charge_message"] = "{1}免费且不限数量。",
		["gm_gms_cannot_afford_message"] = "由于您没有足够的{3}，因此您无法购买{1}。您需要{2} {3}以购买{1}。",

		["bm_menu_amount_locked"] = "库存不足",

		["pdth_hud_challenges"] = "挑战",
		["pdth_hud_challenges_hint"] = "查看已完成与已激活的挑战。",
		["pdth_hud_active_challenges"] = "已激活的挑战",
		["pdth_hud_active_challenges_hint"] = "当前已激活的挑战。",
		["pdth_hud_completed_challenges"] = "已完成的挑战",
		["pdth_hud_completed_challenges_hint"] = "已领取奖励的已完成挑战。",

		["ch_vs_desc"] = "使用$weapon消灭$count $eneType。使用近战攻击消灭的敌人不计入此挑战。",
		["ch_vs_head_shots_desc"] = "使用$weapon爆头消灭$count $eneType。",
		["ch_vs"] = "$weapons VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon VS. $eneType 爆头$no",

		["ene_law"] = "警察世界",
		["ene_law_desc"] = "敌对单位",

		["menu_me"] = "劫匪",

		["RestorationModPDTHChallengesTitleID"] = "显示 收获日：掠夺 挑战",
		["RestorationModPDTHChallengesDescID"] = "设置 收获日：掠夺 挑战在菜单与HUD上是否可见",

		["RestorationModRaidLockPickingTitleID"] = "撬锁调整",
		["RestorationModRaidLockPickingDescID"] = "模组应该调整撬锁？这会改变与撬锁有关的游戏玩法",
		["RestorationModRaidLockPickingVOTitleID"] = "播放语音",
		["RestorationModRaidLockPickingVODescID"] = "模组应该在撬锁时播放语音？",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT撬锁",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT说服",
		["hud_legend_exit"] = "$BTN_CANCEL退出",
		["RestorationModArmorFixTitleID"] = "护甲闪烁修复",
		["RestorationModArmorFixDescID"] = "开启或关闭护甲闪烁修复。",

		-- /// Challenges Below ///

		["ch_deploy_ammobag_hl"] = "最后一发！",
		["ch_deploy_ammobag"] = "部署$count个弹药包。",
		["ch_plant_tripmine_hl"] = "激光秀",
		["ch_plant_tripmine"] = "部署$count个诡雷。",
		["ch_deploy_medicbag_hl"] = "保险福利",
		["ch_deploy_medicbag"] = "部署$count个医疗箱。",
		["ch_deploy_ecm_hl"] = "系统摧毁者",
		["ch_deploy_ecm"] = "部署$count个电子干扰器。",
		["ch_deploy_fak_hl"] = "生命线",
		["ch_deploy_fak"] = "部署$count个急救包。",
		["ch_deploy_sentry_hl"] = "白山基地爱好者",
		["ch_deploy_sentry"] = "部署$count个哨戒机枪。",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "重甲配大枪",
		["ch_watchdogs_d1_heavy_wpn1"] = "身穿改良型复合战术背心，仅使用Vulcan转轮机枪、Thanatos.50 cal狙击步枪或HRL-7火箭发射器完成\"看门狗\"任务第一天，难度为枪林弹雨或以上。要完成此挑战，你必须从头开始劫案。",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "状态",
		["menu_state_filter"] = "状态筛选",
		["menu_state_filter_help"] = "显示房间状态",
		["menu_state_lobby"] = "大厅中",
		["menu_state_loading"] = "加载中",
		["menu_state_ingame"] = "游戏中",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "无头熊之剑",
		["menu_l_global_value_halloween_sword"] = "这是一件Halloween 2013物品！",
		
		--S&W .500
		["bm_w_shatters_fury"] = "Phoenix .500左轮手枪",
		
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "荷鲁斯枪管",
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "粉碎枪管",
		["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "哈索尔枪管",
		["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "火鸟枪管",
		
		["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "人体工学握把",
		
		["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "丝滑弹巢",

		["menu_l_global_value_shatters_fury"] = "这是一件VERITAS物品！",
		
		--MK-23
		--Semi-automatic pistol. Hold down ■ to aim. Release to fire.
		["bm_w_socom"] = "Anubis .45手枪",
		["bm_w_x_socom"] = "双持Anubis .45手枪",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra复合模块",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "按$BTN_GADGET开启/关闭。",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "冷血无情",
		["heist_no_mercy_ranted_brief"] = "我们要去仁慈医院抢血样。有个患者携带有某种罕见病毒而我们要从他身上弄出来。什么也不会阻止咱们因为这单报酬给的实在是太多了。为了这么多钱去抽点血可不会是世界末日。",

		["heist_nmh_res_name"] = "仁慈医院",
		["heist_nmh_res_brief"] = "我们的客户要一个在仁慈医院隔离病房的患者的血样。你进到医院，弄掉监控、控制平民，然后把我接到患者数据库这样我就能找到这个人。就这个地方的安保水平而言，这会是一次干净利落的工作。等你们干完我就从屋顶把你们弄走。这一票有点可疑，经过一些有较重军事企业影子公司味道的第三方斡旋，但这值得冒险。报酬是我们将来需要的东西，再加上一笔可观的酬金。",
		
		["heist_nmh_new"] = "抽取并化验患者血液",
		["heist_nmh_new_desc"] = "你需要找到一台离心机来化验血液样本。",
		
		["heist_nmh_new2"] = "呼叫电梯",
		["heist_nmh_new2_desc"] = "按下按钮，等待电梯",
		
		["heist_nmh_new3"] = "呼叫电梯",
		["heist_nmh_new3_desc"] = "按下按钮，等待电梯",	
		
		--OICW--
		["bm_w_osipr"] = "SABR",
		["bm_w_osipr_gl"] = "SABR榴弹发射器",
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "GO银行重制版",
		
		["heist_gobank_v2_name"] = "GO银行重制版",
		["heist_gobank_v2_brief"] = "这算是场经典银行劫案。流程跟以往基本一致：设法弄开金库大门，撬开或锯开保险箱，然后拿东西走人。简直不能再简单。从贝恩所获取的情报来看，这家分行的被劫率为全国最低，现在轮到你们来打脸了。\n\n»寻找钥匙卡，需要两张卡来打开金库大门\n»如不慎触发警报，就使用钻机钻开大门\n»撬开或锯开保险箱\n»组装好笼子和钩索\n»拿钱走人",
		
		["heist_roberts_v2_name"] = "罗伯特银行",
		["heist_roberts_v2_brief"] = "这里有家银行。并不算太大，不过我听说这的金库里存有大量现金，国际外汇什么的。\n\n总之你们知道该怎么做——看你们了。悄悄溜进去，或者大闹一通。不管哪种方法，我都有办法把钱运走。你们到时候就会明白了，你们绝对会为我的机智所折服。",

		["csgo_plane_timer_text"] = "等待飞机&&TIMER",
		["csgo_plane_timer_desc"] = "等待飞机&&TIMER",
		
		["hud_equipment_pickup_spraycan"] = "按$BTN_INTERACT捡起喷罐",
		["hud_action_spraypaint"] = "按$BTN_INTERACT喷涂",
		["hud_action_spraypaint_none"] = "需要喷罐",
		["spraycan_obtained"] = "已取得喷罐",
		["hud_equipment_obtained_spraycan"] = "已取得喷罐",
		
		["trophy_csgo01"] = "涂鸦盒",
		["trophy_csgo01_desc"] = "你甚至不需要买这个",
		["trophy_csgo01_objective"] = "找到喷罐并在\"GO银行重制版\"的金库里喷涂鸦。",

		["END"] = "END",	
		
		--Whurr Heat Street Edit
		["heist_heat_street_new_name"] = "热火街头经典·真",
		["heist_heat_street_new_brief"] = "有人说世事无常，但这一单看起来真的很容易：进去，拿公文包，出来。你可靠的司机马特会在小巷里等你而且只要你到了撤离车你就不可能失败。可能失败吗？",
		["heist_street_new_name"] = "热火街头：掠夺",
		["heist_street_new_brief"] = "有人说世事无常，但这一单看起来真的很容易：进去，拿公文包，出来。你可靠的司机马特会在小巷里等你而且只要你到了撤离车你就不可能失败。可能失败吗？",

		--Heat Street, Skirmish edition
		["heist_skm_heat_street_name"] = "住宅区-英克韦尔工业区",
		["heist_skm_heat_street_brief"] = "条子最近审问了一个声称曾看见过贝恩的脸而且可以认出他的囚犯。我们知道这不是真的，但条子们不知道，我们的对手也不知道，所以我们就用这个机会捞些钱。在警察转移他到靠近那个想逃走的傻逼马特撞了他的车的旧工厂仓库区的证人保护屋时，拦下他们。",
		["heist_skm_street_name"] = "遭遇战：住宅区-英克韦尔工业区",
		["heist_skm_street_brief"] = "条子最近审问了一个声称曾看见过贝恩的脸而且可以认出他的囚犯。我们知道这不是真的，但条子们不知道，我们的对手也不知道，所以我们就用这个机会捞些钱。在警察转移他到靠近那个想逃走的傻逼马特撞了他的车的旧工厂仓库区的证人保护屋时，拦下他们。",	

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "霍斯顿越狱记圣诞版",
		["heist_xmn_hox1"] = "越狱圣诞版",
		["heist_xmn_hox_1_brief"] = "牙医为霍斯顿安排了一次重新审判。呃，不是你，小霍，我是说老的那个……嗯，名字的事以后再说。审判会很快的。按他的犯罪记录来看他就甭想再出来了，不过这不是关键。关键是他现在要被转监，而我们可以在听证会结束之后的半路上把他救出来，就当是对联邦法律系统说句小小的\"去你妈的\"。 $NL;$NL;计划听起来就很火爆：我们把法院的墙炸开，带上老霍撤退。$NL;$NL;整个区域都被封锁了。他们肯定知道事情会有变故。都给我备好家伙，再另外多带点弹药。",
		["heist_xmn_hox2"] = "证物搜寻圣诞版",
		["heist_xmn_hox_2_brief"] = "好啊，姑娘小伙们，感谢你们把爷从那救出来，但打一开始老子就不该进去。是有人下了套，我非常肯定。他们不应该会了解那么多，傻帽条子做事不可能有那么精明。我们中有内鬼，有人想搞死我。而我一定要找出来是谁。这可不是简单的活，但不入虎穴焉得虎子对吧？别跟我说什么要靠秘密交易或者合约之类的废话，我们要直捣黄龙，去联邦干预局最大的安乐窝。老子要看看到底是谁搞的我。",
		["heist_xmn_hox_brief"] = "牙医为霍斯顿安排了一次重新审判，而我们可以在听证会结束之后的半路上把他救出来。计划听起来就很火爆：我们把法院的墙炸开，带上老霍撤退。$NL;$NL;»救出霍斯顿$NL;$NL;»将霍斯顿带上武装卡车$NL;$NL;»护送武装卡车前进$NL;$NL;»与霍斯顿一同撤离",
		
		["heist_xmn_tag_name"] = "虎口夺食圣诞版"
	})

	local job = Global.level_data and Global.level_data.level_id
	for _,j4 in ipairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == j4 then
			log("Spooky!")
			LocalizationManager:add_localized_strings({	
				["hud_assault_vip"] = "FACE YOUR NIGHTMARES AND WAKE UP",
			})
			break
		end
	end			
	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "查看玩家",
		["menu_inspect_player_desc"] = "查看玩家信息",
		["menu_toggle_one_down_lobbies"] = "允许检索\"专家模式\"房间",
		
		--Holdout--
		["menu_cn_skirmish"] = "遭遇战",
		["menu_skirmish"] = "遭遇战——狭路相逢",
		["menu_skirmish_random"] = "随机地点",
		["menu_random_skirmish_subtitle"] = "随机作战地点\n\n无每周奖励，无初始难度因子",
		["menu_weekly_skirmish"] = "指定地点",
		["menu_weekly_skirmish_progress"] = "本波结束，可获取的总收益已提高",
		["menu_skirmish_random_briefing"] = "在此选项中，你被放置到随机的遭遇战地图进行作战\n\n遭遇战将最多持续9波，难度将随波数增加而上升。\n\n每波结束都将使你获得极大的金钱和经验奖励，但失败会使你丢失所有已获得的奖励\n\n##一旦你或你的队友被逮捕入狱，遭遇战将在本波完成后强制结束##\n##当所有劫匪倒下或人质被救走时，遭遇战就会失败##",
		["menu_weekly_skirmish_desc"] = "在此选项中，你被放置到指定的遭遇战地图进行作战\n\n遭遇战将最多持续9波，有额外的调节器，难度将随波数增加而上升。\n\n完成所有的波数会使你获得额外的每周奖励和更多的金钱\n\n##一旦你或你的队友被逮捕入狱，遭遇战将在本波完成后强制结束##\n##当所有劫匪倒下或人质被救走时，遭遇战就会失败##",
		["menu_weekly_skirmish_tab_description"] = "行动描述",
		["menu_weekly_skirmish_rewards"] = "完成的总波数 & 获得的奖励",
		["hud_skirmish"] = "遭遇战",
		["hud_weekly_skirmish"] = "每周遭遇战",
		["heist_contact_skirmish"] = "遭遇战",
		["menu_skirmish_pick_heist"] = "胡狼公司委托你完成这项任务",
		["menu_skirmish_map_selection"] = "目标地点",
		["menu_skirmish_selected_briefing"] = "在此选项中，你和你队友可以选择任何遭遇战地图进行作战\n\n遭遇战将最多持续9波，难度将随波数增加而上升。\n\n每波结束都将使你获得极大的金钱和经验奖励，但失败会使你丢失所有已获得的奖励\n\n##一旦你或你的队友被逮捕入狱，遭遇战将在本波完成后强制结束##\n##当所有劫匪倒下或人质被救走时，遭遇战就会失败##",
		["menu_skirmish_selected"] = "遭遇战",

		--Skirmish Heists--
		["heist_skm_mallcrasher"] = "商城拆迁队",
		["heist_skm_mallcrasher_h1"] = "商城拆迁队",
		["heist_skm_arena"] = "Monarch Stadium",
		["heist_skm_arena_h1"] = "Monarch Stadium",
		["heist_skm_big2"] = "大银行",
		["heist_skm_big2_h1"] = "大银行",
		["heist_skm_watchdogs_stage2"] = "快艇装载",
		["heist_skm_watchdogs_stage2_h1"] = "快艇装载",
		["heist_skm_mus"] = "钻石魅影",
		["heist_skm_mus_h1"] = "钻石魅影",
		["heist_skm_run"] = "Uptown - Inkwell Industrial",
		["heist_skm_run_h1"] = "Uptown - Inkwell Industrial",


		--Heist Breifings--
		["heist_pines_briefing"] = "你们得赶紧过去，不过那地方根本没法着陆，所以你们得空降下去。找到坠机的飞行员————可能就在坠机地点附近————然后我们会派一架直升机过去接他。待在他身边保护他的安全，直到他被护送离开。此外，弗拉德还说飞机上装满了货物。在森林里找找，能拿多少拿多少，圣诞节总是要挣点零花钱的。\n\n胡狼的提示：\n坠机引起的爆炸引来了附近的收割者小组，别指望着警察对此作出回应了。",

		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "Extended Muldon Stock",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Bernetti 93t套件",
		["bm_wp_upg_i_93r_desc"] = "Enables a 3 round burst firemode, at the cost of extra kick.", --still need to do the one for the primary bernetti--

		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Causes pellets to spread horizontally instead of clustering.",
		["bm_wp_upg_a_slug_sc"] = "AP Slug",
		["bm_wp_upg_a_slug_sc_desc"] = "射出一发较为精准的弹头，不能穿透护甲。", --Auto/Semi-Auto shotguns--
		["bm_wp_upg_a_slug_heavy_desc_sc"] = "Fires a single accurate lead slug that penetrates body armor, enemies, shields, titan shields, and walls.", --For shotguns that can hit Heavy Sniper damage tier--
		["bm_wp_upg_a_explosive_desc_sc"] = "高爆弹。射出一发能使人眩晕的致命性爆炸弹头，不能触发爆头。",
		["bm_wp_upg_a_custom_desc"] = "Fewer, bigger pellets that increase damage at the cost of some consistency and ammo.\n\n25% reduced range.",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 96 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 120 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 180 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 240 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Fires armor piercing flechettes that inflict 96 bleed damage over three seconds.\n\n25% increased range.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "Fires armor piercing flechettes that inflict 120 bleed damage over three seconds.\n\n25% increased range.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "Fires armor piercing flechettes that inflict 180 bleed damage over three seconds.\n\n25% increased range.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Fires armor piercing flechettes that inflict 240 bleed damage over three seconds.\n\n25% increased range.",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "AFG",
		["bm_wp_upg_vg_stubby"] = "Stubby Vertical Grip",
		["bm_wp_upg_vg_tac"] = "TAC Vertical Grip",

		["bm_wp_upg_vintage_sc"] = "Vintage Mag",
		["bm_wp_upg_mil_sc"] = "Milspec Mag",
		["bm_wp_upg_tac_sc"] = "Tactical Mag",

		["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_wp_upg_vintage_desc"] = "",

		--Scorpion (get in-game-name later)--
		["bm_wp_scorpion_m_extended_sc"] = "双层弹夹",
		["bm_sc_scorpion_double_mag"] = "", --Unsure what this one is?--

		--RPK--
		["bm_wp_rpk_m_ban_sc"] = "特制弹\"钾\"",

		--Buzzsaw--
		["bm_wp_mg42_b_mg34_desc_sc"] = "将你的射速降至800",

		--Saw--
		["bm_ap_saw_sc_desc"] = "切穿敌人护甲。",
		["bm_ap_saw_blade_sc_desc"] = "Sharpens the blade enough to cut through body armor.",
		["bm_fast_motor_sc_desc"] = "Increases Rotations Per Minute by 15%.",
		["bm_slow_motor_sc_desc"] = "Decreases Rotations Per Minute by 15%.",

		--Weapon Sights--
		["bm_wp_upg_o_leupold_desc_sc"] = "Automatically marks special enemies, as well as guards in Stealth, while aiming.", --I believe all sights/objects with this effect call this same line, rather than having a unique one. Will need to be decoupled later when we add zoom to all of the sight descriptions.

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_tiny"] = "1.1x MAGNIFICATION.",
		["bm_wp_upg_o_small"] = "1.2x MAGNIFICATION.",
		["bm_wp_upg_o_cs_desc"] = "1.5x MAGNIFICATION.",
		["bm_wp_upg_o_aim"] = "2x MAGNIFICATION.",
		["bm_wp_upg_o_med"] = "3x MAGNIFICATION.",
		["bm_wp_upg_o_large"] = "4x MAGNIFICATION.",
		["bm_wp_upg_o_huge"] = "5x MAGNIFICATION.",
		--;)
		["bm_wp_upg_o_overkill"] = "6x MAGNIFICATION.",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Fires a round that causes a fire at point of impact. The fire deals damage over time and has a chance to interrupt enemies.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Rare",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Doubles the burn duration on ignited enemies, but halves damage over time.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Halves the burn duration on ignited enemies, but doubles damage over time.",
		["bm_ap_flamethrower_sc_desc"] = "Thousands of degrees of pure pain. How did it come to this?\nBURNS THROUGH BODY ARMOR.", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Super Size Me!", -- lol
		["bm_wp_m134_body_upper_light"] = "Light Body",
		["bm_wp_upg_a_halfthatkit_desc"] = "Adds a 10% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Adds a 25% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 50%.",

		--Thanatos--
		["bm_thanatos_sc_desc"] = "Anti-materiel rifle used to combat small vehicles. Using this on organic targets is probably a war crime.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",

		--Galant--
		["bm_galant_sc_desc"] = "A classic WW2 battle rifle. Reliable, accurate, and quick to reload.\n\nReloads faster when the magazine is empty.",

		--Kobus 90--
		["bm_wp_p90_body_p90_tan"] = "Tan Body",
		["bm_ap_weapon_mod_sc_desc"] = "ADDS BODY ARMOR PENETRATION, SHIELD PENETRATION, AND WALL PENETRATION.",
		["bm_wp_90_body_boxy"] = "OMNIA Assault Frame",
		["bm_wp_90_body_boxy_desc"] = "Recovered from the desolated remains of an old OMNIA warehouse, this frame makes no difference to the weapon's handling or its functionality whatsoever, but its block-like aesthetic surely makes it a nice thing to have.",

		--Raze's Fury--
		["bm_wp_shatters_fury_desc"] = "A massive .500 caliber revolver with insane kick and stopping power. Raze's weapon of choice.\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",

		--OICW--
		["bm_w_osipr_desc_pc"] = "X-Generation weapon technology. Equipped with 20mm airburst grenade launcher.\nPress $BTN_BIPOD to switch to the Grenade Launcher.",
		["bm_w_osipr_desc"] = "X-Generation weapon technology. Equipped with 20mm airburst grenade launcher.\nHold $BTN_BIPOD to switch to the Grenade Launcher.",

		--socom deez nuts--
		["bm_w_socom_desc"] = "Jackal's sidearm of choice. A reliable and powerful .45ACP handgun with a stylish design.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "A special-issue AK that - in war and crime - has demonstrated an unquenchable thirst for blood.",
		["bm_wskn_deagle_bling_desc_sc"] = "A hand-crafted Deagle built as testament to the finest gaming-trained crackshot in the world.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "No Modifier",
		["bm_wp_upg_bonus_sc_none_desc"] = "USE THIS TO DISABLE BOOSTS FROM WEAPON SKINS.",

		--Little Friend--
		["bm_m203_weapon_sc_desc_pc"] = "Press $BTN_BIPOD to switch to the mounted Grenade Launcher.",
		["bm_m203_weapon_sc_desc"] = "Hold $BTN_BIPOD to switch to the mounted Grenade Launcher.",

		--Mosin--
		["bm_mosin_sc_desc"] = "Classic, Powerful bolt-action rifle. This weapon reloads in clips of 5 bullets at a time.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",

		--Broomstick--
		["bm_c96_sc_desc"] = "Revolutionary German machine pistol. Capable of firing in full-auto at an insane rate, but will decimate your ammo reserves.\nThis weapon reloads in clips of 10 bullets at a time.",

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_ap_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",
		["bm_heavy_ap_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",
		["bm_ap_2_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR. ARROWS CAN BE RESTORED BY PICKING THEM UP, AND RANGE INCREASES THE LONGER AN ARROW IS DRAWN.",
		["bm_ap_3_weapon_sc_desc"] = "CAN PENETRATE BODY ARMOR. ARROWS CAN BE RESTORED BY PICKING THEM UP.",
		["bm_40mm_weapon_sc_desc"] = "Press $BTN_GADGET to toggle Flip Up Sight.",
		["bm_rocket_launcher_sc_desc"] = "WHILE EQUIPPED, THIS WEAPON WILL REDUCE YOUR MOVEMENT SPEED BY 15%. ROCKETS FIRED BY THIS WEAPON INSTANTLY DESTROY TURRETS.",
		["bm_quake_shotgun_sc_desc"] = "FIRES BOTH BARRELS AT ONCE, DOUBLING THE NUMBER OF PELLETS.",
		["bm_hx25_buck_sc_desc"] = "FIRES 12 PELLETS IN A WIDE SPREAD.\n\nSTILL TREATED AS A GRENADE LAUNCHER BY SKILLS.",
		["bm_auto_generated_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.",
		["bm_auto_generated_ap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",
		["bm_auto_generated_sap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",
		["bm_auto_generated_lmg_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nWHILE EQUIPPED, THIS WEAPON WILL REDUCE YOUR MOVEMENT SPEED## BY 25%.",
		["bm_auto_generated_mod_sc_desc"] = "The stats on this attachment have been removed until automatic custom attachment stat generation is finished.",

		--Overhaul Content Indicators--
		["loot_sc"] = "Restoration Overhaul",
		["loot_sc_desc"] = "这是一件RESTORATION大修的物品!",

		["menu_l_global_value_omnia"] = "OMNIA",
		["menu_l_global_value_omnia_desc"] = "这是一件OMNIA的物品!",

		["menu_rifle"] = "步枪",
		["menu_jowi"] = "威克",
		["menu_moving_target_sc"] = "Subtle",

		["bm_wp_upg_i_singlefire_sc"] = "慢循环机",
		["bm_wp_upg_i_singlefire_sc_desc"] = "将你的射速减慢15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "快循环机",
		["bm_wp_upg_i_autofire_sc_desc"] = "将你的射速增加15%",

		["bm_hint_titan_60"] = "泰坦重型特警将在60秒后离开！",
		["bm_hint_titan_10"] = "泰坦重型特警将在10秒后离开！",
		["bm_hint_titan_end"] = "泰坦重型特警去其它世界寻找猎物了！",

		["bm_hint_titan_end"] = "泰坦重型特警去其它世界寻找猎物了！",
		["bm_menu_gadget_plural"] = "Gadgets",
		["menu_pistol_carbine"] = "卡宾手枪",
		["menu_battle_rifle"] = "战斗步枪",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
		["bm_melee_katana_info"] = "While playing as Jiro, killing a Cloaker with a charged attack triggers a special kill animation.",
		["bm_melee_buck_info"] = "Surprisingly effective against modern weapons too.\n\nReduces incoming ranged damage by 10% while charging.", --Buckler Shield
		["bm_melee_cs_info"] = "Rip and Tear, until it is done.\n\nDeals 30 damage every 0.25 seconds to targets in front of you while charging. This can be increased with skills. Cannot parry enemy attacks.", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Spiiiiiiiiiin.\n\nDeals 18 damage every 0.25 seconds to targets in front of you while charging. This can be increased with skills. Cannot parry enemy attacks.", --Kazaguruma
		["bm_melee_wing_info"] = "Goes great with a disguise kit!\n\nDeals quadruple damage when attacking enemies from behind.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Designed for violence, deadly as a revolver - that's the switchblade!\n\nDeals double damage when attacking enemies from behind.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Not sure if this was used for chopping meat from the supermarket.\n\nFully charged hits spread panic.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "A sword forged from nightmares.\n\nFully charged hits spread panic.", -- Headless Dozer Sword
		["bm_melee_nin_info"] = "Fires nails which have a short effective range and instant travel. Still counts as a melee kill.", -- Pounder
		["bm_melee_iceaxe_info"] = "Deals 50% more headshot damage.", -- Icepick
		["bm_melee_mining_pick_info"] = "Deals 50% more headshot damage.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nKills performed with the OVERKILL Boxing Gloves instantly refill your stamina.", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "Give the cops that extra clean shave they need.\n\nDeals 120 bleed damage over three seconds.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "There's no afterlife waiting for my sorry ass... and I'm just here... talking to a fucking baseball bat!\n\nDeals 120 bleed damage over three seconds.", --Lucille Baseball Bat
		["bm_melee_cqc_info"] = "Contains an exotic poison that deals 120 extra damage and carries a chance to interrupt over three seconds.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Be water, my friend.\n\nParrying an enemy attack deals 120 melee damage to them. This can be increased with skills.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "GIMME A JACKPOT!\n\nHas a 5% chance to deal ten times the damage and knockdown.",
		["bm_melee_specialist_info"] = "Twice the blades, twice the fun.\n\nMelee attacks deal double damage every hit after the first while drawn.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "He's whacking and hacking and slashing.\n\nDeals 50% less headshot damage in exchange for increased overall effectiveness against the body and limbs.",

		--We assets now--
		["menu_asset_dinner_safe"] = "保险箱",
		["menu_asset_bomb_inside_info"] = "内应信息",
		["menu_asset_mad_cyborg_test_subject"] = "实验对象",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "两件套西装",
		["bm_suit_two_piece_desc_sc"] = "经典而又优雅的一次抢劫。它丝毫不会影响你持械大喊\"趴在地上别动！\"时的犀利。\n\n若选择两件套西装，无论当前地图的默认时装是什么，你都会在进行劫案时身着两件套西装。",

		["bm_suit_loud_suit"] = "战斗套装",
		["bm_suit_loud_suit_desc"] = "这是一套会让你热的汗流浃背的战斗用套装。它非常轻便，能让你快速行动，且有着极高的实用性。是居家旅行、砸店抢劫、设施渗透的最佳选择。",

		["bm_suit_jackal_track"] = "特别的礼物",
		["bm_suit_jackal_track_desc"] = "一件特制的运动服，上面有胡狼的标志，还有一个VERITAS的变体标志。\n\n劫匪们收到了许多没有任何标记的盒子，盒子里都装着这件别致的运动服，但是胡狼非常肯定地表示他从未寄过甚至从未见过这些东西。\n我们无从得知这些东西从何而来。\n\n\n\n...但包裹里有张纸条：\n\n''##对那些富有奉献精神的人表示感谢。\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "阳光劫匪",
		["bm_suit_sunny_desc"] = "有时候你只是想撸起袖子大干一场",

		["bm_suit_pool"] = "博迪的破烂修理工制服",
		["bm_suit_pool_desc"] = "一身破烂着装的修理工们眼里露出令人胆寒的目光......",

		["bm_suit_prison"] = "囚服",
		["bm_suit_prison_desc"] = "你已被逮捕入狱！",

		["bm_suit_var_jumpsuit_flecktarn"] = "Flecktarn Camo",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "A classic camo used by two European countries, proven battle-effective by its ability to blend into forested environments easily. It sure as hell doesn't work in urban areas, but in rural ones it does wonders to trick people's eyes.",

		["bm_suit_var_jumpsuit_flatgreen"] = "Gooey Green",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "This suit was rumored to have belonged to one member of a trio of psychotic criminals, having been recovered near a destroyed garbage truck that was presumed to have been involved in a bloody heist on a GenSec armored car, which left numerous SWAT members dead and quite a few wounded. The identity of these criminals are still shrouded in mystery, as most evidence was destroyed with the Garbage Truck, only leaving this jumpsuit.",

		--New menu stats--
		["bm_menu_deflection"] = "血量减伤分数",
		["bm_menu_regen_time"] = "回复所需时间",
		["bm_menu_swap_speed"] = "切枪时间",

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_armor_grinding_1"] = "无政府主义者每次回复的护甲值: $passive_armor_regen",
		["bm_menu_armor_grinding_2"] = "无政府主义者每次回复的护甲值: $passive_armor_regen \n无政府主义者每次击中敌人回复的护甲值: $active_armor_regen",

		["bm_menu_armor_max_health_store_1"] = "Max health stored: $health_stored",
		["bm_menu_armor_max_health_store_2"] = "Max health stored: $health_stored \nArmor regen bonus on kill: $regen_bonus%",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Modifiers",
		["steam_inventory_stat_boost"] = "Stat Modifier",

		--Safe House--
		["dialog_safehouse_text"] = "你还没参观过安全屋\n\n不妨去看看，你可能会发现一些新东西！\n\n你现在想去看看吗？",

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
		["bm_wp_corgi_b_short"] = "MSG Barrel",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Deploy/Undeploy by pressing $BTN_BIPOD on a valid surface.\n\nDramatically reduces recoil while deployed.",
		["bm_sc_bipod_desc"] = "Deploy/Undeploy by holding $BTN_BIPOD on a valid surface.\n\nDramatically reduces recoil while deployed.",

		--String override for the stungun--
		["bm_melee_taser_info"] = "Device that electrocutes and interrupts targets on touch when fully charged.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

		["bm_wp_pis_usp_b_match"] = "Freeman Slide",
		["bm_wp_1911_m_big"] = "Casket Magazine",
		["bm_wp_usp_m_big"] = "Casket Magazine",
		["bm_wp_upg_ass_ak_b_zastava"] = "Long Barrel",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf Barrel",
		["bm_wp_p90_b_ninja"] = "Ninja Barrel",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_lemming"] = "5/7 AP手枪",

		["bm_w_x_judge"] = "Judge & Jury", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
		["bm_w_x_shrew"] = "Barry & Paul",
		["bm_w_x_1911"] = "Mustang & Sally",
		["bm_w_tec9"] = "T3K Urban Submachine Gun",
		["bm_w_x_tec9"] = "Akimbo T3K Urban Submachine Guns",

		["bm_wp_mp5_fg_mp5sd"] = "SPOOC Foregrip",
		["bm_wp_hs2000_sl_long"] = "Elite Slide",
		["bm_wp_vhs_b_sniper"] = "Hyper Barrel",
		["bm_w_r0991"] = "AR-15 Varmint Pistol",
		["bm_wp_vhs_b_silenced"] = "Bad Dragan Barrel",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Red Body",
		["bm_wp_g3_b_sniper"] = "Macro Barrel",
		["bm_wp_g3_b_short"] = "Micro Barrel",
		["bm_wp_g3_m_psg"] = "Präzision Magazine",

		["bm_w_m590"] = "Reinbeck 890 Shotgun",
		["bm_w_m590_desc"] = "The spiritual successor to the criminal syndicate's most popular shotgun has arrived. Although it retains the power of the original Reinbeck, it makes a few small deviations from the original design, making it easier to pump but less stable.",
		["bm_w_beck_desc"] = "The criminal underworld's most popular shotgun has returned from its grave to reclaim its rightful place in the shotgun hierarchy. Originally used in the 2011 Crimewave, this shotgun has been proven extremely reliable in just about any close range situation.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Small Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p1_mod"] = "Small Concealment Modifier",
		["bm_menu_bonus_concealment_p2"] = "Large Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p2_mod"] = "Large Concealment Modifier",
		["bm_menu_bonus_concealment_p3"] = "Massive Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p3_mod"] = "Massive Concealment Modifier",
		["bm_menu_bonus_spread_p1"] = "Small Accuracy bonus and Stability penalty",
		["bm_menu_bonus_spread_p1_mod"] = "Small Accuracy Modifier",
		["bm_menu_bonus_spread_n1"] = "Massive Stability bonus and Accuracy penalty",
		["bm_menu_bonus_recoil_p3_mod"] = "Massive Stability Modifier",
		["bm_menu_bonus_recoil_p1"] = "Small Stability bonus and Accuracy penalty",
		["bm_menu_bonus_recoil_p1_mod"] = "Small Stability Modifier",
		["bm_menu_bonus_recoil_p2"] = "Large Stability bonus and Accuracy penalty",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+5% Experience reward for you and your crew, -10% Money reward for you and your crew",
		["bm_menu_spread"] = "精准度\n",
		["bm_menu_recoil"] = "稳定性\n",	
		["bm_menu_concealment"] = "隐匿度\n",
		["bm_menu_bonus_spread_p2_mod"] = "Large Accuracy Modifier",
		["bm_menu_bonus_spread_p3_mod"] = "Massive Accuracy Modifier",
		["bm_menu_bonus_recoil_p2_mod"] = "Large Stability Modifier",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Money Boost",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+10% Money reward for you and your crew, -5% Experience reward for you and your crew.",

		["bm_wp_upg_i_singlefire_desc"] = "锁定你的武器为\"单发模式\"",
		["bm_wp_upg_i_autofire_desc"] = "锁定你的武器为\"连发模式\"",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Para步枪",
		["bm_w_akmsu"] = "Krinkov步枪",
		["bm_w_x_akmsu"] = "双持Krinkov步枪",
		["bm_w_hajk"] = "CR 805B步枪",
		
		["menu_akimbo_assault_rifle"] = "双持突击步枪",

		--Throwables--
		["bm_concussion_desc"] = "Capacity: 3 \nRange: 10m \nStuns enemy for up to 4s \nEnemy accuracy reduced by 50% for 7s \nStuns all enemies, excluding Titan-Shields, Titan-Bulldozers and Captains \n \nThis stunning little beauty will take everyone's breath away, giving you that extra moment to kill them.",
		["bm_grenade_smoke_screen_grenade_desc"] = "Range: 8m \nDuration: 12s \n \nDrop one of these and you'll vanish in a cloud of smoke, leaving your enemies struggling to take aim at you.",
		["bm_grenade_frag_desc"] = "Capacity: 3\nDamage: 800 \nRange: 5m \n \nThe classic explosive hand grenade. Is there any more to say?",
		["bm_dynamite_desc"] = "Capacity: 3\nDamage: 800 \nRange: 4m \nDoes not bounce or roll from impact point, but deals less splash damage than similar explosives.\n\nDesigned to effectively blast through rock. Even more effective at blasting through people.",
		["bm_grenade_frag_com_desc"] = "Capacity: 3 \nDamage: 800 \nRange: 5m \n \nA sleek new look to the classic hand grenade, sure to provide that OVERKILL touch to each blast.",
		["bm_grenade_dada_com_desc"] = "Capacity: 3 \nDamage: 800 \nRange: 5m \n \nThe doll's outer layers hides its explosive inner workings. A tribute to the Motherland.",
		["bm_grenade_molotov_desc"] = "Capacity: 3 \nDamage: 1200 per pool over 10s \nRange: 3.75m \nDuration: 10s \nDetonates on impact \n \nA breakable bottle of flammable liquid with a burning rag. It is cheap, simple and highly effective. Burn it all down.",
		["bm_grenade_fir_com_desc"] = "Capacity: 3 \nDamage: 1440 per pool over 12s \nRange: 3.75m \nDuration: 12s \nDetonates after 2.5s \n \nA self igniting phosphorus container. Perfect for bouncing off walls and around corners towards your enemies.",
		["bm_wpn_prj_ace_desc"] = "Capacity: 9 \nDamage: 240 \n \nThrowing cards with added weight and a razor edge. A real killer hand of cards.",
		["bm_wpn_prj_four_desc"] = "Capacity: 9 \nDamage: 200 (Impact) \nDamage: 200 over 5s (Poison) \nInterrupts enemy actions \n \nThe throwing star has a long history filled with blood and battle. These poison coated stainless steel stars will pose a lethal threat to anyone in your way.",
		["bm_wpn_prj_target_desc"] = "Capacity: 9 \nDamage: 240 \n \nA solid backup plan and a reliable tactic for a precise and silent kill.",
		["bm_wpn_prj_jav_desc"] = "Capacity: 6 \nDamage: 360 \n \nWith its origins lost in cloudy pre-history, the javelin is a simple weapon. After all, it's a thrown stick with a pointy end that ruins someone's day.",
		["bm_wpn_prj_hur_desc"] = "Capacity: 6 \nDamage: 360 \n \nThey say a sharp axe is never wrong. A thrown sharp axe couldn't be any more right.",

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
			["hud_assault_assault"] = "ИДЁТ ЩТУРМ НАЁМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ЩTУPM HAЁMHИKOB"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Pciloe Asuaslt in Prergoss",
			["hud_assault_cover"] = "STYA IN COVRE...FLESH",
			["hud_assault_alpha"] = "PCILOE ASUASLT"
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
			["hud_assault_assault"] = "Murkywater Assault in Progress",
			["hud_assault_alpha"] = "MURKYWATER ASSAULT"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "OMNIA Incursion Underway",
			["hud_assault_alpha"] = "OMNIA INCURSION"
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
		["menu_toggle_one_down"] = "专家模式",
		["menu_one_down"] = "专家模式",
		["menu_es_pro_job_bonus"] = "专家模式奖励",
		
		["menu_asset_lock_additional_assets_pro"] = "专家模式下不可用！",

		["cn_menu_contract_daypay_header"] = "Day Rate:",
		["cn_menu_contract_jobpay_header"] = "Contract Pay:",
		["victory_stage_cash_summary_name_job"] = "You earned $stage_cash on your contract day rate and an additional $job_cash for completing the contract.",

		["debug_interact_grenade_crate_take_grenades"] = "按住 $BTN_INTERACT 来拾取一个投掷物",
		["debug_interact_bodybags_bag_take_bodybag"] = "按住 $BTN_INTERACT 来拾取一个尸体袋",
		
		["menu_equipment_armor_kit"] = "手雷箱",
		["bm_equipment_armor_kit"] = "手雷箱",
		["debug_equipment_armor_kit"] = "手雷箱",
		["bm_equipment_armor_kit_desc"] = "要使用手雷箱，你必须先按住 $BTN_USE_ITEM 将其放下。 手雷箱一旦被放下就不能被移动，但是你和你的队友可以按住 $BTN_INTERACT 来补充投掷物。 手雷箱只能被使用三次。\n\n你可以通过看手雷箱里还剩多少个盒子来判断剩余使用次数。\n\nThe Throwable Case is a concealable case, usually used by a soldier or mercenary to carry specialized weaponry when the heat comes.",

		["bm_equipment_ecm_jammer_desc"] = "要使用ECM干扰器，你需要按住 $BTN_USE_ITEM 将其部署下来。一旦部署后就无法移动，它可以生效10秒。\n\n你可以与其互动以启用ECM干扰器的反馈功能，反馈有几率使半径25米内的敌人失去行动能力，反馈持续20秒且可以在4的充能后重新使用。\n\nECM干扰器可以用于打开ATM机且可以暂时使电子设备失效，如干扰手机报警、摄像头与其它探测系统的电子设备，让你更轻松地实现目标。",
		["bm_equipment_first_aid_kit_desc"] = "To use the first aid kit, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved, but it can be used by you and your crew by holding $BTN_INTERACT to regain 100 health. First aid kits can only be used once.\n\nThe first aid kit is a collection of supplies and equipment for use in rapidly giving first aid in emergency situations.",
		["bm_equipment_doctor_bag_desc"] = "To use the doctor bag, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved, but it can be used by you and your crew by holding $BTN_INTERACT to regain 20% of their maximum health and 4% maximum health every 4 seconds for 3 minutes. Doctor bags can be used twice.\n\nThe doctor dag is a portable bag, usually used by a physician or other medical professional to transport medical supplies and medicine.",
		["bm_equipment_sentry_gun_desc"] = "To use the sentry gun, you need to place it by holding $BTN_USE_ITEM. Upon deployment it will use 40% of your maximum ammo. Upon taking too much damage, it will shut off. While in this state, interacting with it by holding $BTN_INTERACT will place it into an automatic repair mode. Picking up sentries will refund their remaining ammo and repair them. Sentry guns terrify civilians, forcing them to the ground.\n\nThe Sentry Gun automatically aims and fires at targets that are detected by its sensors. It's commonly used as a distraction, drawing attention away from you and your team.",
		["bm_equipment_sentry_gun_silent_desc"] = "To use the sentry gun, you need to place it by holding $BTN_USE_ITEM. Upon deployment it will use 40% of your maximum ammo. Upon taking too much damage, it will shut off. While in this state, interacting with it by holding $BTN_INTERACT will place it into an automatic repair mode. Picking up sentries will refund their remaining ammo and repair them. Sentry guns terrify civilians, forcing them to the ground.\n\nThe Suppressed Sentry Gun is the counterpart to the regular, louder Sentry Gun as it's more used to take out enemies than a classic distraction.",

		["hud_int_hold_take_pardons"] = "按下 $BTN_INTERACT 拿走特赦令",
		["debug_interact_gage_assignment_take"] = "按下 $BTN_INTERACT 捡起盖奇包裹",

		["far_repair_sentry_macro"] = "Sentry critically damaged, repairs needed.",
		["fixing_sentry_macro"] = "Repair progress: $AMMO_LEFT%",
		--Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
		["repair_sentry_macro"] = " to start sentry auto-repair sequence",
		["pickup_sentry_macro"] = " to retrieve sentry.\n$AMMO_LEFT ammo left. ", --Gets % health remaining appended to the end.
		["firemode_sentry_macro"] = " to change fire modes.\n$AMMO_LEFT ammo left.",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", --$AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "Repairing sentry...",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "DEATH WISH. FOR YOU, ACTION IS THE JUICE.",
		["menu_risk_sm_wish"] = "DEATH SENTENCE. NOW SHOW THEM THAT YOU CAN'T BE STOPPED.",

		--Loading Hints--
		--Restoration Gameplay Hints--
		["loading_gameplay_res_title"] = "恢复MOD劫匪小贴士(强攻)",
		["loading_gameplay_res_1"] = "幻影特工在要飞踢劫匪时会发出\"Wulululululu\"的声音，用这个来找到他们的位置。",
		["loading_gameplay_res_2"] = "幻影特工在普通和充能状态不再发出\"嗞嗞\"的声音了。注意你的周围，因为他们的夜视镜灯现在变的很亮。",
		["loading_gameplay_res_3"] = "在\"死刑宣判\"难度下，如果你在换子弹，敌人会更优先地跑过来和攻击你。确保你在换弹的时候远离敌人或处于掩体之后。有时候切换为副武器可能是一个更好的选择，尤其是你的副武器装备了手枪时。It might be better to swap weapons sometimes, especially if using a pistol as your secondary.",
		["loading_gameplay_res_4"] = "泰瑟警察在电击你时你的子弹不会回满了。试着让自己的弹药保持充足，或在被电击前切换为副武器。",
		["loading_gameplay_res_5"] = "幻影特工喜欢跟着那些落单的劫匪，与你的队友待在一起，否则就等着进局子喝茶吧。",
		["loading_gameplay_res_6"] = "幻影特工在飞踢你后会对你的血量造成直接的伤害。此伤害可以被\"血量减伤分数\"或逃犯格斗系二阶的\"反\'控\'精英\"技能减少。",
		["loading_gameplay_res_7"] = "绿熊会尝试突然从侧翼突入，打空子弹，然后逃走。你作为一个69岁的老劫匪要小心不要大意了，没有闪，然后就被偷袭了。",
		["loading_gameplay_res_8"] = "使用伊孜玛霰弹枪的黑熊极具进攻性并会直接从正面冲向劫匪。这使得他们会很容易被发现，但如果你还没做好准备，他们会变得极具威胁性。",
		["loading_gameplay_res_9"] = "使用轻机枪的骷髅熊会给其它单位提供火力掩护，同时也会在各种情况下准备好突入，你需要小心他们极高的输出能力。",
		["loading_gameplay_res_10"] = "Benelli霰弹枪熊取代了加特林熊。他们只出现在罪无止境和死刑宣判难度下的春季送暖队长中。他们真的，真的，真的很他妈的难打。",
		["loading_gameplay_res_11"] = "所有的熊都会优先攻击正在换子弹的劫匪。",
		["loading_gameplay_res_12"] = "在\"死刑宣判\"难度下，熊会在面甲破碎后进入狂暴模式，狂暴模式下他们的伤害会提高10%。",
		["loading_gameplay_res_13"] = "幻影特工在冲向你时会发出\"Wulululululu\"的声音，听到后立即闪到一边回头射击。",
		["loading_gameplay_res_14"] = "幻影特工的飞踢只会把你拷住，不算倒地次数。",
		["loading_gameplay_res_15"] = "在\"死刑宣判\"难度下，警察的闪光弹无法被打掉。我不要你觉得，我要我觉得，我的模组我做主(竖中指)。",
		["loading_gameplay_res_16"] = "你可以通过近战蓄力来招架住敌人的近战攻击。使用\"反\'控\'精英\"技能可以让其招架住幻影特工的飞踢。",
		["loading_gameplay_res_17"] = "敌人的近战攻击比原版更具有威胁性。别傻傻逼逼想着从警察堆里冲过去，这么做你只会被警察的一套连击打出十割。",
		["loading_gameplay_res_18"] = "有什么比用棒球棍猛打敌人更好的事情呢？用棒球棒爆他们的头！",
		["loading_gameplay_res_19"] = "狙击手在射击前需要一点时间集中注意力。如果你被狙击手盯上了，你会发觉你听到的声音正在逐渐淡出。你可以通过狙击镜的反光找到狙击手的位置。",
		["loading_gameplay_res_20"] = "你转化的变节警察也会被幻影特工飞踢。",
		["loading_gameplay_res_21"] = "不同种类的警察携带不同的武器。你可以通过观察他们的制服来判断他们使用的武器是什么。",
		["loading_gameplay_res_22"] = "使用霰弹枪的警察极具威胁性。在近距离，如果你的护甲不够厚实的话，他们甚至可以两枪把你击倒。然而，霰弹枪的射程十分短，谁也没法用一把霰弹枪八百米开外一枪爆鬼子的头。",
		["loading_gameplay_res_23"] = "高难度下，敌人会依靠在一个持盾警察的后面向前推进。",
		["loading_gameplay_res_24"] = "高难度下，敌人会更加聪明，行动更难以预测且更具战术性。",
		["loading_gameplay_res_25"] = "\"死刑宣判\"难度在此模组下已被重做。该难度在本模组的条件下难度更高，但恒河里。去看看恢复MOD引导以了解其变化。",
		["loading_gameplay_res_26"] = "在\"专家模式\"下，你无法购买一般的有利条件(比如医疗箱、弹药袋和尸体袋)，启用了友军伤害(即使是对你的AI队友)，并且在任务的最后阶段可能会触发\"有去无回\"，此时会刷出具有高威胁性的Bravo部队。",
		["loading_gameplay_res_27"] = "恢复MOD添加了不同的敌人单位和各种模型，比如新的黑水雇佣兵和其它国家的敌人种类等。一些单位可能与原版无异，但是给游玩带来了独特的感觉。尤其是那些华盛顿特区以外的敌人和劫案。",
		["loading_gameplay_res_28"] = "幻影特工在冲向你前会先扔一颗烟雾弹。",
		--New Units Hints
		["loading_new_units_res_title"] = "恢复MOD劫匪小贴士(敌对单位)",
		["loading_new_units_res_1"] = "泰坦人质救援队的行动非常迅速，他们的主要目标是在不被你发现的前提下营救人质和抢走战利品。此外，如果你没有使用近战或爆头击杀他们，他们会在死亡时扔出一颗催泪瓦斯对你造成伤害。",
		["loading_new_units_res_2"] = "爱国战线部队非常害怕近战攻击。",
		["loading_new_units_res_3"] = "轻型部队可以被身边人质救援队超量治疗。受到超量治疗的敌人以紫色标记，他们受到的第一枪射击不能致命。",
		["loading_new_units_res_4"] = "泰坦幻影特工使用了先进了装备以致于他们几乎是隐身的，但他们会发出\"嗞嗞\"的声音。戴上你的耳机，聆听他们发出的声音，找出他们的位置，一枪爆他们的狗头！",
		["loading_new_units_res_5"] = "泰坦熊会尽可能避免与你正面作战，他们会试图保持安全距离并对你进行火力压制。",
		["loading_new_units_res_6"] = "泰坦狙击手以降低伤害和不能穿甲为代价换取了更高的射速和移动射击的能力。",
		["loading_new_units_res_7"] = "泰坦狙击手在瞄准时没有红色的镭射，但它们射击后会留下子弹轨迹。看准轨迹找到它们的位置。",
		["loading_new_units_res_8"] = "泰坦盾兵的盾牌只能被Thanatos狙击步枪，\"锯刃轰鸣\"基础技能下的OVE9000电锯，以及使用AP弹的哨戒机枪穿透。",
		["loading_new_units_res_9"] = "春季送暖队长和泰坦熊会受到额外的爆头伤害。",
		["loading_new_units_res_10"] = "泰坦泰瑟会使用电击枪限制你的移动。当你被电击枪射中时，你的屏幕周边会出现一圈蓝色的光作为指示。",
		["loading_new_units_res_11"] = "反恐老兵中枪时能快速反应避开要害以限制你每发子弹对其造成的伤害。他们无法避开近战、火焰和爆炸伤害。此外，你还可以选择一把低伤害但高射速的武器针对他们。",
		["loading_new_units_res_12"] = "反恐老兵会空翻躲避子弹，他们还会频繁地投掷烟雾弹扰(jiang)乱(di)劫匪的视(zhen)野(shu)。",
		["loading_new_units_res_13"] = "泰坦特警对近战伤害有些许的抗性，但这点抗性在高额近战伤害下并没有什么卵用。",
		["loading_new_units_res_14"] = "泰坦特警不会投降，也不能被转化为变节警察为你作战。",
		["loading_new_units_res_15"] = "泰坦特警装备了轻机枪和全自动霰弹枪，这使得他们对你极具威胁性。",
		["loading_new_units_res_16"] = "触发\"有去无回\"时，Bravo部队会参与镇压劫匪。他们拥有更高级的护甲和更强力的武器，他们可不想跟你多逼逼。",
		["loading_new_units_res_17"] = "Bravo部队会投掷破片手榴弹。注意地上正在发出\"哔哔\"声并且闪着光的投掷物。",
		["loading_new_units_res_18"] = "阿肯拥有他自己的泰坦部队。他们看起来不同但实际属性是相同的。他们的整体视觉效果和穿着特征也是基本一致的，因此你可以轻易地认出不同的兵种。",
		["loading_new_units_res_19"] = "掷弹兵的武器有能发射催泪瓦斯的下挂件，站在瓦斯中的玩家会持续受到伤害。在\"死刑宣判\"难度下，他装备了更致命的、伤血更快的毒气弹。",
		--Captain Hints
		["loading_captains_res_title"] = "恢复MOD劫匪小贴士(四季队长)",
		["loading_captains_res_1"] = "要击败夏日炎炎队长，要先从他的医疗单位入手。夏日队长的队员死亡前，队长本身是无敌的。而他的左右护法在医疗兵还活着时几乎是无懈可击的。",		
		["loading_captains_res_2"] = "不要靠近夏日炎炎队长，否则他会使用他的喷火器迅速把你燃烧殆尽。夏日队长还装备了一把电击枪以拖慢你的移动。",		
		["loading_captains_res_3"] = "春季送暖队长可以承受成吨的伤害，但他并不是不死的。注意他扔出的手雷，试着放他风筝，他的行动比乌龟还慢。",	
		["loading_captains_res_4"] = "春季送暖队长时不时会扔出一颗高爆手雷。不要长时间靠他太近。",	
		["loading_captains_res_5"] = "春季送暖队长也许具有高威胁性，但他的输出范围实在是太有限了，而且他走的是真的很——慢——。",	
		["loading_captains_res_6"] = "秋风萧瑟队长在他攻击你时会大声地嘲讽你，利用这一点来确定他的位置。",	
		["loading_captains_res_7"] = "不像其他队长，警方不会扛着个大喇叭告诉你秋风萧瑟队长来了，这是为了给你一个\"惊喜\"。",	
		["loading_captains_res_8"] = "秋风萧瑟队长在未被发现的情况下存活一段时间后会逐渐破坏你部署的随身装备。被破坏的随身装备会变为紫色，只有在队长被击败时才能重新使用。",	
		["loading_captains_res_9"] = "你也许未能在第一次与秋风萧瑟队长的交战中就击败他......不，想都别想。",	
		["loading_captains_res_10"] = "凛冬队长对爆炸和火焰几乎免疫，并且有很强的抗子弹能力，但很容易受到近战伤害。",	
		["loading_captains_res_11"] = "凛冬队长的盾牌是无法穿透的。",	
		["loading_captains_res_12"] = "凛冬队长的行动模式和能力已被重做。他现在会在整个移动游走，并恢复他周围大片区域警察的血量。同时他还会找机会带领他的队友们冲锋陷阵。",	
		--Stealth Hints
		["loading_stealth_res_title"] = "恢复MOD劫匪小贴士(潜入)",
		["loading_stealth_res_1"] = "Guards will no longer be instantly alerted by seeing broken cameras. A specific guard will be made to inspect the camera, allowing it to be used as a lure.",	
		["loading_stealth_res_2"] = "Killing unalerted guards with melee or taking them hostage will not set off a pager. Melee killing a guard a split second after he was alerted will still prevent the pager from being set off.",	
		["loading_stealth_res_3"] = "Melee killing unalerted guards or taking them hostage will still trigger guard replacements and map events.",	
		["loading_stealth_res_4"] = "Guards with no pagers do not increase suspicion when killed.",	
		["loading_stealth_res_5"] = "所有不带消音的武器在潜入中会固定发出半径为25米的声音。",	
		["loading_stealth_res_6"] = "Civilians will get down in response to gunfire in both loud and stealth. ",	
		["loading_stealth_res_7"] = "Sentry Guns will pacify any civilians in a notable radius around them.",	
		["loading_stealth_res_8"] = "While carrying any bag, you can be seen from much farther away, and will also be detected much faster while standing, sprinting, or jumping. Stay low and slow.",	
		["loading_stealth_res_9"] = "You get up to 4 ECMs instead of 2 like in vanilla, but they have half duration. Make sure to use them for objectives.",	
		["loading_stealth_res_10"] = "消音武器在潜入中不会发出任何声音",	
		["loading_stealth_res_11"] = "无论是潜入还是强攻，你都只能吼住4名保安或警察作为人质。潜入中吼住一名保安不需要回答对讲机也不会增加可疑度，但如果你稍后杀了他，那么依然会触发对讲机并增加可疑度。",	
		["loading_stealth_res_12"] = "Most instant fail states for stealth (such as alerted cameras, or exceeding the maximum level of pagers) have been removed or severely toned down. Check the Guide for more detailed information.",	
		["loading_stealth_res_13"] = "Guards will no longer instantly die from any source of damage while unalerted. Aim for the head, and bring something more damaging than your fists.",	
		["loading_stealth_res_14"] = "When the suspicion meter is full, you have 60 seconds to finish up what you started before the alarm is raised.",	
		["loading_stealth_res_15"] = "The higher the suspicion meter is, the easier it is to be detected by guards.",	
		["loading_stealth_res_16"] = "恢复MOD中，你可以携带更多的尸体袋。如果你玩的是单潜，你可以携带的尸体袋要更多。",	
		["loading_stealth_res_17"] = "In Crime.net Offline Mode, you will be given extra cable ties to make up for missing players. The amount still increases if you have the right skills.",	
		["loading_stealth_res_18"] = "Guards killed by gunfire will set off their pagers. While pagers going off doesn't increase suspicion, ignoring them certainly will.",	
		["loading_stealth_res_19"] = "Pager operators are less lenient on higher difficulties. Your last pager is indicated by the use of a special voice line.",	
		["loading_stealth_res_20"] = "Answering pagers beyond your allowed limit massively increases suspicion, but not as much as dropping or not answering.",	
		["loading_stealth_res_21"] = "Pagers take longer to answer and expire faster on the ground on higher difficulties.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "恢复MOD劫匪小贴士(装备/技能)",
		["loading_equip_skills_res_1"] = "Shotguns lose range as their accuracy gets lower, experiment and see what works best! Be careful not to leave yourself unable to deal with snipers, though; consider a non-shotgun secondary.",	
		["loading_equip_skills_res_2"] = "Pistols are very fast to swap to and are generally accurate and stable. They work very well as backup weapons if you aren't specialized in something else.",	
		["loading_equip_skills_res_3"] = "Weapons in Restoration fall under a variety of classes with different pros and cons. Higher damage weapons may kill enemies faster, but they may run dry on you before you know it!",	
		["loading_equip_skills_res_4"] = "Higher-damage weapons are generally less concealable unless they have significant downsides, such as Accuracy or Rate of Fire.",	
		["loading_equip_skills_res_5"] = "Wolf has upgraded our Sentry Guns to allow field repairs. It takes some time, but they will automatically repair once you initiate it.",	
		["loading_equip_skills_res_6"] = "If you have Sentry AP rounds unlocked, you can choose your default ammo type in the Equipment menu.",	
		["loading_equip_skills_res_7"] = "Perk Decks give significant damage bonuses and many of them provide rare and precious healing abilities. Make sure not to neglect upgrading them if you want to play higher difficulties.",	
		["loading_equip_skills_res_8"] = "Crew Chief, Armorer, Muscle, Crook, Gambler, and Biker are basic but consistent perk decks. They're great first choices for a perk deck to build into.",	
		["loading_equip_skills_res_9"] = "Hitman has been reworked into a low long-term survivability and consistency perk deck, but in exchange allows you to gain huge stores of 'Temporary HP' to power through tough spots.",	
		["loading_equip_skills_res_10"] = "Crew Chief is a team-focused perk deck that grants small but useful buffs to you and your teammates and more buffs if you have multiple hostages. It pairs well with The Controller tree in Mastermind.",	
		["loading_equip_skills_res_11"] = "Gambler is a team-focused perk deck that grants a little HP and bonus ammo to teammates when you pick ammo up. Pairs well with skills that grant extra ammo drops.",	
		["loading_equip_skills_res_12"] = "Maniac is a fast team-focused perk deck that reduces incoming damage for you and teammates as long as you keep up consistent killing. Pairs well with high-damage-output builds and builds with Damage Resist.",	
		["loading_equip_skills_res_13"] = "Hacker's Pocket ECM provides team wide healing and powerful crowd control, but takes a long time to recharge. It is also effective in stealth.",	
		["loading_equip_skills_res_14"] = "Burglar is a perk deck that provides small bonuses to Stealth in exchange for being a bit weaker than other decks in Loud.",	
		["loading_equip_skills_res_15"] = "Kingpin is a versatile perk deck. The injector can be used for self sustain, surviving heavy damage, or drawing fire away from your team.",	
		["loading_equip_skills_res_16"] = "Tag Team is a team-focused perk deck that allows you to provide a lot of healing to a specific teammate as long as the two of you keep up consistent killing.",	
		["loading_equip_skills_res_17"] = "穿过盾牌的子弹伤害减半。",	
		["loading_equip_skills_res_18"] = "The Peacemaker and Phoenix .500 Revolvers are able to pierce like a sniper rifle.",
		["loading_equip_skills_res_19"] = "If you have a blue meter on the side of your screen, then you have dodge. When it's flashing, you will dodge the next bullet. Please refer to the Guide for an in-depth explanation of our dodge rework.",	
		["loading_equip_skills_res_20"] = "The higher a weapon's concealment is, the faster you can draw and holster it.",	
		["loading_equip_skills_res_21"] = "The Chainsaw and Kazaguruma deal damage to enemies in front of you while held.",	
		["loading_equip_skills_res_22"] = "The Butterfly Knife and Switchblade deal massive damage when stabbing enemies in the back.",	
		["loading_equip_skills_res_23"] = "The Icepick and Gold Fever do increased headshot damage in exchange for poor speed.",	
		["loading_equip_skills_res_24"] = "Poison deals only moderate damage, but induces vomiting which interrupts other actions.",	
		["loading_equip_skills_res_25"] = "Stun Grenades provide very potent disruption, even against bulldozers.",	
		["loading_equip_skills_res_26"] = "Aiming down sights grants significantly increased accuracy and reduced recoil, even with LMGs.",	
		["loading_equip_skills_res_27"] = "The Pounder Nailgun melee weapon has an incredibly long range, far longer than any other melee weapon.",	
		["loading_equip_skills_res_28"] = "Leveling up perk decks unlocks the Throwables Case.",
		["loading_equip_skills_res_29"] = "Replenishing your throwables in the Equipment Case now refills your entire stock with each use.",	
		["loading_equip_skills_res_30"] = "Save Inspire ace for when things have really gone sideways, it has a very long cooldown and requires line of sight.",	
		["loading_equip_skills_res_31"] = "Restoration Mod adds two new Perk Decks (Wildcard and Blank) which provide only the common perks and no perks whatsoever, respectively. They are meant for self-imposed challenges.",
		--Misc Hints
		["loading_misc_res_title"] = "Restoration Miscellaneous Tips",
		["loading_misc_res_1"] = "Try our Custom Heists as well! You can find most of them under the 'Jackal and Raze' Contractor, as well as 'Doghouse' under Vlad.",	
		["loading_misc_res_2"] = "Restoration Mod has a Steam Guide! This should be your resource for more detailed information. Check the Main Menu.",	
		["loading_misc_res_3"] = "Restoration Mod has a Discord server! Join for discussion, balance feedback, and matchmaking! Check the Main Menu.",	
		--Trivia Hints
		["loading_fluff_res_title"] = "Restoration Trivia",
		["loading_fluff_res_1"] = "OMNIA spends a fortune reviving failed weapon projects.",	
		["loading_fluff_res_2"] = "The LPF is owed a lot of beers.",	
		["loading_fluff_res_3"] = "The LPF and Titan Sniper are Australian.",	
		["loading_fluff_res_4"] = "The NYPD Bronco Cop loves donuts.",	
		["loading_fluff_res_5"] = "The ZEAL UMP Elite SWAT's name is Chad.",	
		["loading_fluff_res_6"] = "Titan Dozers have glowing eyes thanks to extensive genetic engineering, human experiments, and combat drugs.",	
		["loading_fluff_res_7"] = "Captain Spring is not human. He might have been, once upon a time.",	
		["loading_fluff_res_8"] = "Restoration Mod is often nicknamed 'resmod', 'SCmod', 'furry mod' and 'mememod', by various members of the community and the dev team.",	
		["loading_fluff_res_9"] = "OMNIA has been developing reinforced security doors to protect against dinosaur attacks.",	
		["loading_fluff_res_10"] = "The Grenadier used to work in pest control.",	
		["loading_fluff_res_11"] = "You have never seen a Titan Cloaker.",
		["loading_fluff_res_12"] = "Omnia is a self-described 'neoceltic pagan folk' band based in the Netherlands and whose members have had Irish, Dutch, Cornish, Belgian, Indonesian and Persian backgrounds. Connection to the organization OMNIA unconfirmed.",	
		["loading_fluff_res_13"] = "Whatever happened that caused Jackal to get involved with Crime.Net and leave GenSec, he refuses to talk about it. He seems to have been 'disturbed' by the event.",	
		["loading_fluff_res_14"] = "HAHAHAHAHA.",
		["loading_fluff_res_15"] = "Captain Summers and his crew used to be a crew of four heisters, much like a multinational equivalent of the Payday Crew. They are now a strike team for OMNIA.",
		["loading_fluff_res_16"] = "Captain Summers and his crew officially died in a building collapse while trying to rob a bank. This was a ruse.",
		["loading_fluff_res_17"] = "Captain Autumn spends a fortune on handcuffs.",
		["loading_fluff_res_18"] = "Captain Summers spends a fortune on gas gas gas.",
		["loading_fluff_res_19"] = "Captain Spring spends a fortune on bullets and grenades.",
		["loading_fluff_res_20"] = "Captain Winters spends a fortune on shields and duct tape.",
		["loading_fluff_res_21"] = "The Grenadier division spends a fortune on Diphoterine due to several friendly fire incidents.",
		["loading_fluff_res_22"] = "You may or may not have met Captain Summers before.",
		["loading_fluff_res_23"] = "The Policía Federal has a special chupacabra hunting division.",
		["loading_fluff_res_24"] = "Captains don't die, they go into custody.",
		["loading_fluff_res_25"] = "REAPER offered a 'quick and brutal crackdown on cartels' at a price cheaper than OMNIA, which led to the Policía Federal adopting their version of TITAN units. This was a ploy to get their forces closer to OMNIA and Murky operations both in Mexico and the US.",

		["menu_button_deploy_bipod"] = "BIPOD/ALT-FIRE",
		["skill_stockholm_syndrome_trade"] = "Down Restored!",
		["hint_short_max_pagers"] = "Neglecting pagers will significantly increase guard suspicion.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "As a new arrival to the criminal elite, the first order of business is for you to get gear and fanfare befitting someone of your status.\n\nBONUSES:\nYour infamous base drop rate is increased from ##0.3%## to ##0.6%##\nExperience gained is increased by ##5%##.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "突击系",
		["st_menu_enforcer_armor"] = "坦克系",
		["st_menu_enforcer_ammo"] = "支援系",
		["st_menu_technician_auto"] = "佣兵系",
		["st_menu_technician_sentry"] = "堡垒系",
		["hud_instruct_mask_on"] = "按下 $BTN_USE_ITEM 戴上面具",
		["hud_instruct_mask_on_alpha"] = "按下 $BTN_USE_ITEM 戴上面具",

		--Default Suit String
		["bm_suit_none_desc"] = "This is the heister's default outfit with the selected armor. Will automatically change from the Two-piece Suit depending on the selected heist!",

		-- Ad Banner Change
		["menu_changelog"] = "Latest Changelog",
		["menu_discord"] = "Discord Server",
		["menu_guide"] = "Overhaul Guide",
		["menu_captains"] = "Information on Captains",
		["menu_content_updates"] = "Guide/Support",
		["menu_content_updates_previous"] = "",

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

		["mutator_faction_override"] = "Enemy Faction Override",
		["mutator_faction_override_desc"] = "",
		["mutator_faction_override_longdesc"] = "",
		["mutator_faction_override_"] = "",
		["mutator_faction_override_select"] = "",
		["mutator_faction_override_america"] = "美国",
		["mutator_faction_override_russia"] = "俄罗斯",
		["mutator_faction_override_zombie"] = "丧尸",
		["mutator_faction_override_murkywater"] = "黑水",
		["mutator_faction_override_nypd"] = "纽约市警察局",
		["mutator_faction_override_lapd"] = "洛杉矶警察局",
		["faction_selector_choice"] = "Faction: ",

		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "A Crime Spree is an endless series of randomly selected heists, executed in succession. With each heist you complete, your Rank and Reward will increase! Each 20th or 26th rank you will need to choose a modifier and each 100th rank there is an increase to the risk level, that will make the next heists harder to complete. After risk level 600, the amount of i-frames that player have starts to decrease and bravo units begin to spawn normally.\n\n##If you invite your crew, make sure they started their own Crime Spree before joining in order to gain ranks and Rewards as well.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "One additional Bulldozer is allowed into the level.",
		["menu_cs_modifier_medics"] = "One additional Medic is allowed into the level.",
		["menu_cs_modifier_no_hurt"] = "Enemies are 50% resistant to knock down.",
		["menu_cs_modifier_dozer_immune"] = "Bulldozers take 50% less explosive damage.",
		["menu_cs_modifier_bravos"] = "Enemies have an additional 6.667% chance to become Bravo Units.",
		["menu_cs_modifier_grace"] = "Your damage grace period is reduced by a 60th of a second.",
		["menu_cs_modifier_letstrygas"] = "Smoke Grenades are now replaced with Tear Gas.",
		["menu_cs_modifier_boomboom"] = "Grenadiers now explode on death.",
		["menu_cs_modifier_friendlyfire"] = "Teammates now take 100% friendly fire damage.",
		["menu_cs_modifier_dodgethis"] = "Veteran Cops now dodge all bullets.",
		["menu_cs_modifier_sniper_aim"] = "Snipers now aim their rifles 100% faster.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "All rifle SWAT units have an additional 15% chance to become an elite UMP unit.",
		["menu_cs_modifier_heavy_sniper"] = "Titan Snipers and Bravo Sharpshooters will now fire their rifles on full auto at close range.",
		["menu_cs_modifier_dozer_medic"] = "Whenever a Bulldozer spawns, there is a chance that it will be a Medic Bulldozer. A Medic Bulldozer counts as both a Medic and a Bulldozer.",
		["menu_cs_modifier_dozer_minigun"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Bulldozer wielding an M1014.",
		["menu_cs_modifier_shield_phalanx"] = "All regular Shield units have an additional 15% chance to become a Titan Shield.",
		["menu_cs_modifier_taser_overcharge"] = "The tasing knockout effect of the Taser is no longer delayed.",
		["menu_cs_modifier_dozer_rage"] = "When a Bulldozer's faceplate is destroyed, the Bulldozer enters a berserker rage, receiving a 10% increase to their base damage output.",
		["menu_cs_modifier_medic_adrenaline"] = "All Medic units have an additional 15% chance to become an OMNIA LPF.",
		["menu_cs_modifier_cloaker_arrest"] = "Cloaker melee strikes will now cuff players.",
		["menu_cs_modifier_cloaker_smoke"] = "Cloakers will now have a 50% chance to drop a flashbang when they dodge.",
		["menu_cs_modifier_cloaker_tear_gas"] = "All HRT units have an additional 15% chance to become a Titan HRT.",
		["menu_cs_modifier_dozer_lmg"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Skulldozer.",

		["bm_menu_skill"] = "小队加成",

		["menu_crew_interact"] = "身手敏捷",
		["menu_crew_interact_desc"] = "每个AI队友将使你的互动速度加快15%",

		["menu_crew_inspire"] = "鼓舞士气",
		["menu_crew_inspire_desc"] = "AI队友可以使用\"领袖鼓舞\"技能\n\n冷却时间为90秒，每名AI队友将使冷却时间减少15秒",

		["menu_crew_scavenge"] = "经久不衰",
		["menu_crew_scavenge_desc"] = "每3波突袭结束会使玩家的倒地次数恢复1次\n\n每名AI队友将减少1波所需突袭波数，最多减少至每波恢复1次",

		["menu_crew_ai_ap_ammo"] = "穿甲弹",
		["menu_crew_ai_ap_ammo_desc"] = "AI队友的武器伤害增加25%\n\nAI队友现在能射穿敌人护甲，且它们射击盾牌将使盾兵被击晕",

		["menu_crew_healthy"] = "铜浇铁铸",
		["menu_crew_healthy_desc"] = "所有玩家的血量增加30",

		["menu_crew_sturdy"] = "稳固防线",
		["menu_crew_sturdy_desc"] = "所有玩家的护甲值增加10%",

		["menu_crew_evasive"] = "掩人耳目",
		["menu_crew_evasive_desc"] = "所有玩家的闪避条每秒增加3%",

		["menu_crew_motivated"] = "精力充沛",
		["menu_crew_motivated_desc"] = "所有玩家的耐力增加15",

		["menu_crew_regen"] = "平复如故",
		["menu_crew_regen_desc"] = "所有玩家的血量每4秒回复1点",

		["menu_crew_quiet"] = "无影无踪",
		["menu_crew_quiet_desc"] = "所有玩家的隐匿度增加2",

		["menu_crew_generous"] = "有备无患",
		["menu_crew_generous_desc"] = "所有玩家每击杀70名敌人将获得1个投掷物补充",

		["menu_crew_eager"] = "灵敏快手",
		["menu_crew_eager_desc"] = "所有玩家的换弹速度加快10%",

--[[   SKILLTREES   ]]--
	--{

		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "医疗士兵",
			["menu_combat_medic_beta_desc_sc"] = "掌握: ##$basic##\n你在\"救人时\"获得##10%##的伤害减免\n\n你在\"救人后\"获得##10%##的伤害减免，持续##5##秒\n\n\n专精: ##$pro##\n救起一个队友将多给予他##30%##的血量。",
			
			--Quick Fix
			["menu_tea_time_beta_sc"] = "快速包扎",
			["menu_tea_time_beta_desc_sc"] = "掌握: ##$basic##\n减少##50%##你放置 急救包 和 医疗箱 所需的时间\n\n专精: ##$pro##\n使用你 急救包 的任何玩家将会在##5##秒内获得50%的伤害减免。",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "止疼药",
			["menu_fast_learner_beta_desc_sc"] = "掌握: ##$basic##\n你救起的队友将在##5##秒内获得##25%##的伤害减免\n\n专精: ##$pro##\n你救起的队友再额外获得##25%##的伤害减免。",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "兴奋剂",
			["menu_tea_cookies_beta_desc_sc"] = "掌握: ##$basic##\n你可以多携带##3##个 急救包\n\n专精: ##$pro##\n你可以再多携带##3##个 急救包\n\n你放置的 急救包 将会自动被##5##米范围内受到致命伤害的玩家使用\n\n每位玩家在##30##秒内只能触发一次。\n\n提示：进入 天鹅绝唱 时不可用",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "战地医师",
			["menu_medic_2x_beta_desc_sc"] = "掌握: ##$basic##\n你的 医疗箱 可额外使用##1##次\n\n专精: ##$pro##\n你可以携带##2##个 医疗箱。",																								

			--Inspire
			["menu_inspire_beta_sc"] = "领袖鼓舞",
			["menu_inspire_beta_desc_sc"] = "掌握: ##$basic##\n你的救人速度加快##50%##\n\n呼喊你的队友会在##10##秒内提升他们##20%##的 移动速度 和 换弹速度\n\n专精: ##$pro##\n你可以通过呼喊半径##9米##范围内的倒地队友将他们救起，冷却时间##90##秒。\n提示：队友必须在你视野范围内才可用，不能隔墙吼人",																								


			--}

			--[[   CONTROLLER SUBTREE   ]]--
			--{

			--Cable Guy
			["menu_triathlete_beta_sc"] = "捆绑大师",
			["menu_triathlete_beta_desc_sc"] = "掌握: ##$basic##\n增加##4##根初始可携带的绑带数量\n\n专精: ##$pro##\n你从警察死亡掉落的弹药盒中捡到绑带的概率增加到##30%##\n\n增加你最大绑带数##3##根",																								

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "恐怖小丑",
			["menu_cable_guy_beta_desc_sc"] = "掌握: ##$basic##\n平民被控制趴下的时间延长##50%##\n\n专精: ##$pro##\n你的威慑强度和范围提高##50%##",																								

			--Stockholm Syndrome	
			["menu_joker_beta_sc"] = "人质综合征",
			["menu_joker_beta_desc_sc"] = "掌握: ##$basic##\n人质被救后不会立刻逃跑\n\n专精: ##$pro##\n如果你呼喊附近的平民或转化的警察，他们可能会给你弹药或在你倒地时救你",																								

			--Joker	
			["menu_stockholm_syndrome_beta_sc"] = "背盟败约",	
			["menu_stockholm_syndrome_beta_desc_sc"] = "掌握: ##$basic##\n你可以转化一名普通警察为你作战，该技能不能在潜入时使用，你必须先制服一名警察才能转化它\n\n你同时只能拥有一名转化的警察。\n被转化的警察会被视为人质，可以用于技能加成或换出监狱里的队友。\n\n你转化的警察受到的伤害减少##60%##。\n\n专精: ##$pro##\n转化的警察造成的伤害提高##45%##\n\n你能同时拥有##2##名转化的警察。",

			--Partners in Crime	
			["menu_control_freak_beta_sc"] = "犯罪同伙",	
			["menu_control_freak_beta_desc_sc"] = "掌握: ##$basic##\n每名人质将增加你##3%##的移动速度，可叠加##4##次。\n\n专精: ##$pro##\n每名人质将提高你##10%##的血量，可叠加##4##次",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "人质猎手",	
			["menu_black_marketeer_beta_desc_sc"] = "掌握: ##$basic##\n每名人质将为你提供 \"每##4##秒回复##1##点血量\" 的BUFF，该效果上限##4##名人质\n\n专精: ##$pro##\n当你有##4##名或以上的人质时，回血效果变为原来的##2##倍\n\n每名人质能减少你和队友受到的伤害##1##点，该效果上限##4##名人质\n\n提示：该效果不能与其它玩家叠加",


			--}

			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "领队",	
			["menu_stable_shot_beta_desc_sc"] = "掌握: ##$basic##\n冲锋枪和轻机枪的稳定性增加##4##\n\n专精: ##$pro##\n该效果也适用于你的队友",

			--MG Handling
			["menu_scavenger_sc"] = "新兵上手",	
			["menu_scavenger_desc_sc"] = "掌握: ##$basic##\n冲锋枪和轻机枪的腰射精准度提高##20%##\n\n专精: ##$pro##\n冲锋枪和轻机枪的换弹速度提高##25%##",

			--MG Specialist
			["menu_sharpshooter_sc"] = "机枪专家",	
			["menu_sharpshooter_desc_sc"] = "掌握: ##$basic##\n在移动时，冲锋枪和轻机枪受到的精准度惩罚减少##60%##\n\n移动时的精准度惩罚程度取决于稳定性\n\n专精: ##$pro##\n冲锋枪和轻机枪增加##15%##的射速\n\n冲锋枪和轻机枪不松扳机连续射击每五发中的##第五发##不会消耗弹药",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "威慑弹鼓",
			["menu_spotter_teamwork_beta_desc_sc"] = "掌握: ##$basic##\n武器弹匣容量增加##20%##\n\n提示：该效果不适用于弓、弩、榴弹发射器和火箭筒\n\n专精: ##$pro##\n你可以在冲刺时使用武器腰射\n\n武器弹匣容量额外增加##30%##",

			--Heavy Impact
			["menu_speedy_reload_sc"] = "沉重打击",
			["menu_speedy_reload_desc_sc"] = "掌握: ##$basic##\n轻机枪使用脚架时有##40%##的概率击倒敌人\n\n提示：该效果不适用于队长、熊和盾兵\n\n专精: ##$pro##\n你使用轻机枪的脚架时获得##50%##的伤害减免",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "人体解剖",
			["menu_body_expertise_beta_desc_sc"] = "掌握: ##$basic##\n你的子弹可以##射穿敌人的护甲##\n\n射击敌人的身体能造成原定爆头所造成的伤害的##30%##\n\n提示：该效果只能被##连发模式##的冲锋枪和轻机枪触发\n\n##该技能不适用于熊##\n\n专精: ##$pro##\n射击敌人的身体能造成原定爆头所造成伤害的##100%##。\n该效果现在##适用于所有武器##",

			--}
		--}

		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{

			--Underdog--
			["menu_underdog_beta_sc"] = "落水狗",
			["menu_underdog_beta_desc_sc"] = "掌握: ##$basic##\n在半径##18##米范围内有3个或以上的敌人时，你将在##7##秒内获得##10%##的伤害加成\n\n专精: ##$pro##\n在半径##18##米范围内有3个或以上的敌人时，你还能在##7##秒内获得##10%##的伤害减免",																								

			--Shotgun CQB	
			["menu_shotgun_cqb_beta_sc"] = "巷斗战术",
			["menu_shotgun_cqb_beta_desc_sc"] = "掌握: ##$basic##\n霰弹枪和火焰喷射器的开镜速度加快##75%##\n\n专精: ##$pro##\n霰弹枪和火焰喷射器的换弹速度加快##25%##",																								

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "强力冲击",
			["menu_shotgun_impact_beta_desc_sc"] = "掌握: ##$basic##\n霰弹枪和火焰喷射器的稳定性增加##4##\n\n专精: ##$pro##\n霰弹枪每发多射出##3##颗弹丸\n\n提示：该效果不适用于霰弹枪的穿甲弹和高爆弹",																																																																																																																																																																																																

			--Pigeon Shooting	
			["menu_far_away_beta_sc"] = "白鸽射手",
			["menu_far_away_beta_desc_sc"] = "掌握: ##$basic##\n霰弹枪和火焰喷射器开镜瞄准时增加##40%##的精准度\n\n提示：该效果不影响霰弹枪和火焰喷射器的射程\n\n专精: ##$pro##\n霰弹枪和火焰喷射器开镜瞄准时增加##40%##的射程",																																																																																																																																																																																																

			--Gung Ho
			["menu_close_by_beta_sc"] = "激情四\"射\"",
			["menu_close_by_beta_desc_sc"] = "掌握: ##$basic##\n你可以在冲刺时使用霰弹枪或火焰喷射器腰射\n\n专精: ##$pro##\n霰弹枪和火焰喷射器腰射时的射速提高##35%##",

			--Overkill
			["menu_overkill_sc"] = "疯狂杀戮",
			["menu_overkill_desc_sc"] = "掌握: ##$basic##\n使用霰弹枪、火焰喷射器或OVE9000电锯完成杀敌会在##2##秒内提高这些武器##50%##的伤害\n\n专精: ##$pro##\n减少霰弹枪、火焰喷射器和OVE9000电锯的切枪速度##50%##\n\n伤害加成的持续时间提高至##10##秒且伤害加成可适用于所有武器\n\n提示：\n1.该效果不适用于榴弹发射器\n2.火焰喷射器的余火烧死敌人不能触发伤害加成\n3.专精后你仍需要使用霰弹枪、火焰发射器或OVE9000电锯完成杀敌触发伤害加成",

			--}

			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "顽强抵抗",
			["menu_oppressor_beta_desc_sc"] = "掌握: ##$basic##\n每一点护甲值将减少你受到警察近战击退效果的##0.25%##\n\n专精: ##$pro##\n减少##50%##闪光弹致盲效果的持续时间",

			--Die Hard
			["menu_show_of_force_sc"] = "不死小强",
			["menu_show_of_force_desc_sc"] = "掌握: ##$basic##\n你受到对##血量##的伤害减少##5%##\n\n提示：该效果会在其它减伤计算完后再进行计算\n\n专精: ##$pro##\n你受到对##血量##的伤害额外减少##5%##",																																																																																																																																																																																																
			
			--Transporter
			["menu_pack_mule_beta_sc"] = "运输者",
			["menu_transporter_beta_desc_sc"] = "掌握: ##$basic##\n每##10##点护甲值会减少携带战利品袋对移动速度的惩罚##0.5%##\n\n专精: ##$pro##\n你现在可以##背着包跑步##了\n\n提示：背包带来的移动速度惩罚依然存在",																																																																																																																																																																																																

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "血流成河",
			["menu_iron_man_beta_desc_sc"] = "掌握: ##$basic##\n你的血量上限提高##15%##\n\n专精: ##$pro##\n你的血量上限额外提高##25%##",																								

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "正中靶心",
			["menu_prison_wife_beta_desc_sc"] = "掌握: ##$basic##\n完成爆头击杀会恢复你##5##点护甲值，冷却时间##3##秒\n\n专精: ##$pro##\n完成爆头击杀恢复的护甲值增加##30##",																								

			--Iron Man
			["menu_juggernaut_beta_sc"] = "铁人",
			["menu_juggernaut_beta_desc_sc"] = "掌握: ##$basic##\n解锁 ##改良型复合战术背心## 以供你使用\n\n专精: ##$pro##\n近战或射击有几率##击退或推倒盾兵##\n\n近战武器的击倒概率为##100%##，远程武器的击倒概率取决于武器伤害\n\n护甲恢复速度加快##10%##",																																																																																																																																																																																																
		

			--}

			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{

			--Scavenger
			["menu_scavenging_sc"] = "拾荒者",
			["menu_scavenging_desc_sc"] = "掌握: ##$basic##\n你拾取弹药盒的范围增加##50%##\n\n专精: ##$pro##\n每击杀##5##名敌人，第五名被击杀的敌人会额外掉落一个弹药盒",																																																																																																																																																																																																

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "子弹风暴",
			["menu_ammo_reservoir_beta_desc_sc"] = "掌握: ##$basic##\n任何玩家使用你放置的弹药袋将获得##无限弹药##的增益，持续时间取决于补充的弹药数量，最多持续##5##秒\n\n专精: ##$pro##\n最多持续时间提高至##15##秒",																								

			--Specialist Equipment formally Rip and Tear
			["menu_portable_saw_beta_sc"] = "专业配备",
			["menu_portable_saw_beta_desc_sc"] = "掌握: ##$basic##\n电锯锯片的磨损速度减缓##50%##\n\n专精: ##$pro##\n电锯、弓、弩、榴弹发射器或火箭筒的换弹速度加快##25%##",																																																																																																																																																																																																

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "储备充足",
			["menu_ammo_2x_beta_desc_sc"] = "掌握: ##$basic##\n你放置的弹药袋的弹药容量额外增加##200%##\n\n专精: ##$pro##\n你现在可以放置##2##个弹药袋",																								

			--Rip and Tear formally Carbon Blade
			["menu_carbon_blade_beta_sc"] = "锯刃轰鸣",
			["menu_carbon_blade_beta_desc_sc"] = "掌握: ##$basic##\n你现在可以用电锯锯盾对盾兵造成伤害\n\n专精: ##$pro##\n你使用电锯、弓、弩、榴弹发射器或火箭筒击杀敌人有##50%##的几率在半径##10##米内的敌人中##散播恐慌##\n\n恐慌会使敌人短暂地失去行动能力",																								

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "全副武装",
			["menu_bandoliers_desc_sc"] = "掌握: ##$basic##\n你武器携带的总弹量增加##25%##\n\n专精: ##$pro##\n你武器从每个弹药盒中获取的弹药量增加##50%##\n\n你有##5%##的几率从一个弹药盒中获得一个投掷物\n\n若你没有从一个弹药盒中成功获取投掷物，那么该几率将提升##1%##，成功获取投掷物后该几率将被重置",
		
			--}
		--}

		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{

			--Logistician
			["menu_defense_up_beta_sc"] = "后勤干员",
			["menu_defense_up_beta_desc_sc"] = "掌握: ##$basic##\n你放置和使用随身装备的速度加快##25%##\n\n专精: ##$pro##\n你和你队友的放置和使用随身装备的速度都加快##50%##\n\n提示：\n1.不是\"额外\"加快，因此总共加快50%\n2.该效果不能重叠",

			--Nerves of Steel--	
			["menu_fast_fire_beta_sc"] = "钢铁意志",
			["menu_fast_fire_beta_desc_sc"] = "掌握: ##$basic##\n你现在可以##在倒地时使用机瞄##\n\n专精: ##$pro##\n你在互动时受到的伤害减少##50%##",																																																																																																																																																																																																																									

			--Engineering
			["menu_eco_sentry_beta_sc"] = "工程师",
			["menu_eco_sentry_beta_desc_sc"] = "掌握: ##$basic##\n你的哨戒机枪血量上限增加##40%##\n\n专精: ##$pro##\n你的哨戒机枪血量上限额外增加##60%##",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "万事通",
			["menu_jack_of_all_trades_beta_desc_sc"] = "掌握: ##$basic##\n你携带投掷物的量提高为原来的##150%##\n\n专精: ##$pro##\n你现在可以携带两个随身装备，按\"##X##\"来在两个随身装备之间切换\n\n副随身装备的携带量只有原来的##一半##",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "塔防机枪",	
			["menu_tower_defense_beta_desc_sc"] = "掌握: ##$basic##\n你的哨戒机枪现在可以使用AP穿甲弹，使用这种弹药后哨戒机枪的射速减缓##66%##并且其射出的子弹可以##穿透敌人的护甲和盾牌##\n\n专精: ##$pro##\n你现在最多可以携带##2##个哨戒机枪\n\n放置哨戒机枪消耗的总弹量降低至##35%##\n(主副武器各17.5%)",																								
			
			--Bulletproof--
			["menu_iron_man_sc"] = "刀枪不入",
			["menu_iron_man_desc_sc"] = "掌握: ##$basic##\n你的护甲现在##不能被穿透##\n\n专精: ##$pro##\n当你的护甲值为满时，你将获得减伤，减伤的量等于你护甲值上限的##30%##\n\n你的护甲恢复速度加快##15%##",																																																																																																																																																																																																																									

			--}

			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "硬件专家",
			["menu_hardware_expert_beta_desc_sc"] = "掌握: ##$basic##\n你修理电锯和钻机的速度加快##20%##\n\n你的电锯和钻机产生的噪音降低##65%##\n\n专精: ##$pro##\n你修理电锯和钻机的速度额外加快##30%##\n\n你的电锯和钻机现在##完全静音##，平民和保安必须看到电锯或钻机才能警戒并报警",

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "危险勿近",
			["menu_combat_engineering_desc_sc"] = "掌握: ##$basic##\n诡雷的爆炸范围增加##30%##\n\n专精: ##$pro##\n诡雷的伤害提高##50%##",																								

			--Drill Sawgeant
			["menu_drill_expert_beta_sc"] = "钻锯技工",
			["menu_drill_expert_beta_desc_sc"] = "掌握: ##$basic##\n你的电锯和钻机工作所需时间减少##10%##\n\n专精: ##$pro##\n你的电锯和钻机工作所需时间额外减少##20%##",

			--Demoman--
			["menu_more_fire_power_sc"] = "恐怖分子",
			["menu_more_fire_power_desc_sc"] = "掌握: ##$basic##\n你现在可以携带##6##个聚能炸药和##6##个诡雷\n\n你放置聚能炸药和诡雷的速度加快##20%##\n\n专精: ##$pro##\n你现在可以携带##8##个聚能炸药和##10##个诡雷\n\n你放置聚能炸药和诡雷的速度额外加快##20%##",																								


			--Kickstarter
			["menu_kick_starter_beta_sc"] = "物理修复",
			["menu_kick_starter_beta_desc_sc"] = "掌握: ##$basic##\n你的电锯和钻机在损坏后有##30%##的概率自动修复\n\n专精: ##$pro##\n钻机损坏后，近战武器有##50%##的概率在攻击钻机后将其修复\n\n提示：每次损坏只有一次机会，若近战武器攻击修复失败一次则无法再使用近战武器修复",

            --Fire Trap
			["menu_fire_trap_beta_sc"] = "火焰陷阱",
			["menu_fire_trap_beta_desc_sc"] = "掌握: ##$basic##\n你的诡雷在爆炸后将释放一个持续##10##秒，半径##7.5##米的火焰。\n\n专精: ##$pro##\n你的诡雷释放的火焰持续时间增加至##20##秒，半径增加至##11.25##米。",


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
			["menu_insulation_beta_sc"] = "绝缘装甲",
			["menu_insulation_beta_desc_sc"] = "掌握: ##$basic##\n被泰瑟警察电击时，你有##15%##的几率反火并击晕电击你的泰瑟警察\n\n专精: ##$pro##\n被泰瑟警察电击后的##2##秒内按[互动键]可以立即对电击你的泰瑟警察造成一次反火，并对其造成其血量##50%##的伤害",


			--}

			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind
			["menu_scavenger_beta_sc"] = "卷土重来",
			["menu_scavenger_beta_desc_sc"] = "掌握: ##$basic##\n护甲被破坏后你将在##3##秒内获得##10%##的移动速度加成\n\n专精: ##$pro##\n护甲被破坏后，你射出的第一发子弹将必定击倒敌人\n\n该效果在你护甲恢复后##3##秒内仍然有效",



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
			["menu_perseverance_desc_sc"] = "掌握: ##$basic##\n你的血量为##0##时不会立刻倒地，你能在##3##秒内获得无敌并持续战斗，但此时的移动速度减少##60%##，3秒结束后进入倒地状态\n\n专精: ##$pro##\n倒地前持续战斗的时间额外增加##6##秒",



			--}

			--[[   BRAWLER SUBTREE   ]]--
			--{

			--Counter-Strike--
			["menu_drop_soap_beta_sc"] = "反\"控\"精英",
			["menu_drop_soap_beta_desc_sc"] = "掌握: ##$basic##\n你现在能通过按住##[近战键]##在近战武器蓄力时反击幻影特工的飞踢并将其击倒\n\n幻影特工的飞踢和泰瑟警察的电击使你倒地造成的伤害减少##20%##\n\n专精: ##$pro##\n你手持近战武器时受到来自远程武器的伤害减少##10%##\n\n幻影特工的飞踢和泰瑟警察的电击使你倒地造成的伤害额外减少##30%##",																						

			--Bloodthirst--
			["menu_bloodthirst_sc"] = "血之渴望",
			["menu_bloodthirst_desc_sc"] = "掌握: ##$basic##\n使用近战武器击杀敌人将在##10##秒内获得##25%##的换弹速度加成\n\n专精: ##$pro##\n每击杀一个敌人会提高##25%##你下一次使用近战武器攻击的伤害，伤害增益上限为##100%##\n\n该效果将在使用近战武器成功击中敌人后重置",																																																																																																																																																																																																																																					


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "深层口袋",
		["menu_thick_skin_beta_desc_sc"] = "掌握: ##$basic##\n近战武器的隐匿度增加##2##\n\n专精: ##$pro##\n所有防弹背心的护甲值增加##20##\n\n所有防弹背心的隐匿度增加##4##",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "蹲防战术",
		["menu_sprinter_beta_desc_sc"] = "掌握: ##$basic##\n你的耐力将提前##25%##的时间进行恢复且恢复速度加快##25%##\n\n专精: ##$pro##\n每次在冲刺时闪避将增加你闪避条的##10%##\n\n每次在滑索上闪避将增加你闪避条的##30%##",																								

		--Sneaky Bastard--
		["menu_jail_diet_beta_desc_sc"] = "掌握: ##$basic##\n当你的暴露度低于##35##时，每降低##3##点暴露度都将获得##1##点闪避点数，最多增加##10##点\n\n专精: ##$pro##\n当你的暴露度低于##35##时，每降低##1##点暴露度都将获得##1##点闪避点数，最多增加##10##点\n\n你的护甲被破坏时，每次闪避成功都将恢复你血量上限##6%##的血量",

		--Sharpshooter--
		["menu_discipline_sc"] = "神枪手",
		["menu_discipline_desc_sc"] = "掌握: ##$basic##\n突击步枪和狙击步枪的稳定性增加##4##\n\n专精: ##$pro##\n完成爆头击杀将在##10##秒内使你的开火速率增加##20%##，该效果只能由##单发模式##的突击步枪和狙击步枪触发",

		--Kilmer--	
		["menu_heavy_impact_beta_sc"] = "基尔默",
		["menu_heavy_impact_beta_desc_sc"] = "掌握: ##$basic##\n突击步枪和狙击步枪的精准度增加##5##\n\n专精: ##$pro##\n突击步枪和狙击步枪的换弹速度加快##25%##",

		--Mind Blown, formerly Explosive Headshot--
		["menu_kilmer_sc"] = "脑\"洞\"大开",
		["menu_kilmer_desc_sc"] = "掌握: ##$basic##\n完成爆头的同时，被爆头的敌人半径##4##米内最近的敌人会受到你刚刚爆头伤害##70%##的擦伤，该效果只能由##单发模式##的突击步枪和狙击步枪触发\n\n被爆头的警察每离你##7##米远，就会有一个额外的警察受到该擦伤效果，最多同时擦伤##5##名敌人\n\n专精: ##$pro##\n可被擦伤的距离增加##1##米\n\n被爆头的警察每离你##7##米远，擦伤的伤害就额外增加##10%##，最多额外增加##110%##",

		--Ammo Efficiency--
		["menu_single_shot_ammo_return_sc"] = "弹无虚发",
		["menu_single_shot_ammo_return_desc_sc"] = "掌握: ##$basic##\n在##8##秒内完成##3##次爆头击杀会额外给予你##1##发子弹或武器总弹量##3%##的子弹，哪种情况给予的子弹更多取决于你使用的武器备弹量\n该效果只能被##单发模式##的步枪触发\n\n专精: ##$pro##\n现在只需要##2##次爆头就能触发技能，子弹会在你弹匣不满时##直接加进弹匣中##",

		--Rifleman
		["menu_rifleman_sc"] = "步枪精通",
		["menu_rifleman_desc_sc"] = "掌握: ##$basic##\n所有武器使用机瞄的速度加快##50%##\n\n专精: ##$pro##\n突击步枪和狙击步枪使用机瞄时的精准度增加##30%##",		

			--Aggressive Reload
		["menu_engineering_beta_sc"] = "迅猛装填",
		["menu_engineering_beta_desc_sc"] = "掌握: ##$basic##\n完成爆头击杀会在##10##秒内减少你##25%##的换弹速度，该效果只能由##单发模式##的突击步枪和狙击步枪触发\n\n专精: ##$pro##\n换弹速度增益提升至##50%##且可以由##连发模式##的突击步枪和狙击步枪触发",					
			
		--Cleaner--
		["menu_jail_workout_sc"] = "清道夫",
		["menu_jail_workout_desc_sc"] = "掌握: ##$basic##\n额外增加##1##个初始携带的尸体袋\n\n你对特殊敌人造成的伤害增加##5%##\n\n专精: ##$pro##\n你现在可以放置##2##个尸体袋箱了\n\n你对特殊敌人造成的伤害额外增加##10%##",	

		--Nimble--
		["menu_cleaner_beta_sc"] = "心灵手巧",
		["menu_cleaner_beta_desc_sc"] = "掌握: ##$basic##\n你撬锁和解开手铐的速度加快##50%##\n\n专精: ##$pro##\n你现在可以##通过撬锁打开部分保险箱##了",	
																																																																																																																																																																																																																								
		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "第六感",
		["menu_chameleon_beta_desc_sc"] = "掌握: ##$basic##\n原地不动##3.5##秒后，你会自动标记半径##10##米内的所有单位\n\n专精: ##$pro##\n你现在可以##解锁所有有利条件##了",	

		--Systems Specialist--
		["menu_second_chances_beta_sc"] = "系统专家",
		["menu_second_chances_beta_desc_sc"] = "掌握: ##$basic##\n你的摄像头回路持续时间增加##20##秒\n\n你对计算机、骇入、摄像头和ECM干扰器的互动所需时间减少##25%##\n\n专精: ##$pro##\n被你标记的警察的高亮时间延长##100%##，你现在可以使用机瞄来在潜入中标记保安和在强袭中标记特殊敌人了\n\n你对计算机、骇入、摄像头和ECM干扰器的互动所需时间额外减少##50%##",	
		
		--ECM Specialist--
		["menu_ecm_booster_beta_sc"] = "ECM专精",
		["menu_ecm_booster_beta_desc_sc"] = "掌握: ##$basic##\n你现在可以放置##3##个ECM干扰器了\n\n专精: ##$pro##\n你现在可以放置##4##个ECM干扰器了",	

		--ECM Overdrive--
		["menu_ecm_2x_beta_sc"] = "ECM过载",
		["menu_ecm_2x_beta_desc_sc"] = "掌握: ##$basic##\n你的ECM干扰器现在能用于##打开部分电子门##\n\nECM干扰器的干扰与反馈的持续时间提高##25%##\n\n专精: ##$pro##\nECM干扰器的干扰与反馈的持续时间额外提高##25%##，ECM反馈的持续时间再额外提高##25%##\n\n这种ECM干扰器可以##推迟对讲机应答##",	
																																																																																																																																																																																																																																															
		--Evasion--
		["menu_awareness_beta_sc"] = "紧急回避",
		["menu_awareness_beta_desc_sc"] = "掌握: ##$basic##\n你的移动速度加快##5%##\n\n你受到的摔落伤害减少##75%##\n\n专精: ##$pro##\n##跑步换弹##——你现在可以在冲刺时换弹",																								

		--Moving Target--
		["menu_dire_need_beta_sc"] = "移动目标",
		["menu_dire_need_beta_desc_sc"] = "掌握: ##$basic##\n当你的暴露度低于##35##时，每降低##3##点暴露度都将获得##1.5%##的移动速度加成，最多加快##15%##\n\n专精: ##$pro##\n当你的暴露度低于##35##时，每降低##1##点暴露度都将获得##1.5%##的移动速度加成，最多加快##15%##\n\n使用枪械或近战武器从背后击杀敌人将使你增加##75%##的闪避条",																								

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "光学幻象",
		["menu_optic_illusions_desc_sc"] = "掌握: ##$basic##\n消音武器的隐匿度增加##1##\n\n专精: ##$pro##\n消音武器的隐匿度额外增加##1##\n\n消音武器的切枪速度加快##25%##",																								

		--The Professional--
		["menu_silence_expert_beta_sc"] = "职业杀手",
		["menu_silence_expert_beta_desc_sc"] = "掌握: ##$basic##\n消音武器的精准度增加##5##\n\n专精: ##$pro##\n使用消音武器击杀特殊敌人将会额外掉落一个弹药盒",																								

		--Unseen Strike, formally Dire Need--
		["menu_backstab_beta_sc"] = "掩其无备",
		["menu_backstab_beta_desc_sc"] = "掌握: ##$basic##\n如果你在##3##秒内没有受到任何伤害，你将内获得##15%##的暴击率加成直到你受到伤害为止\n\n暴击成功将使你造成的伤害增加##100%##\n\n提示：\n1.杀手技能的虚血衰减不算受到伤害\n2.虚血因非衰减因素降低都算受到伤害\n\n专精: ##$pro##\n受到伤害后，暴击率加成扔将持续##4##秒",																								

		--Spotter--
		["menu_hitman_beta_sc"] = "侦察先锋",
		["menu_hitman_beta_desc_sc"] = "掌握: ##$basic##\n你标记的敌人受到的伤害增加##15%##\n\n专精: ##$pro##\n你标记的敌人在##20##米外受到的伤害额外增加##30%##",																								

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "下作手段",
		["menu_unseen_strike_beta_desc_sc"] = "掌握: ##$basic##\n当你的暴露度低于##35##时，每降低##3##点暴露度都将获得##3%##的暴击率，最多增加##30%##\n\n暴击伤害额外增加##100%##\n\n专精: ##$pro##\n当你的暴露度低于##35##时，每降低##1##点暴露度都将获得##3%##的暴击率，最多增加##30%##\n\n你攻击敌人背面时的暴击率额外增加##50%##",																								

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "沉着冷静",
		["menu_equilibrium_beta_desc_sc"] = "掌握: ##$basic##\n你与你队友的手枪稳定性增加##4##\n\n专精: ##$pro##\n手枪的切枪速度加快##100%##",																								

		--Gun Nut--
		["menu_dance_instructor_sc"] = "手枪狂徒",
		["menu_dance_instructor_desc_sc"] = "掌握: ##$basic##\n腰射时，手枪的精准度增加##20%##\n\n专精: ##$pro##\n手枪的射速增加##15%##\n\n你的手枪可以##射穿敌人的护甲##",																								

		--Over Pressurized/Gunfighter--
		["menu_gun_fighter_sc"] = "手枪斗士",
		["menu_gun_fighter_desc_sc"] = "掌握: ##$basic##\n手枪的换弹速度加快##5%##\n\n在移动时，手枪受到的精准度惩罚减少##40%##\n\n移动时的精准度惩罚程度取决于稳定性\n\n专精: ##$pro##\n手枪的换弹速度额外加快##25%##",																								

		--Akimbo--
		["menu_akimbo_skill_sc"] = "孤岛飞鹰",
		["menu_akimbo_skill_desc_sc"] = "掌握: ##$basic##\n双持武器的稳定性增加##8##\n\n专精: ##$pro##\n双持武器的稳定性额外增加8，双持武器的总弹量增加25%",																																																																																																																																																																																																																																		

		--Desperado--
		["menu_expert_handling_sc"] = "亡命之徒",
		["menu_expert_handling_desc_sc"] = "掌握: ##$basic##\n使用手枪完成爆头击杀会在##5##秒内提高 武器##10%## 的精准度，可叠加##5##次，每次使用手枪##爆头##可以使效果持续时间重置为五秒\n\n提示：该技能的精准度增加不适用于霰弹枪和火焰喷射器\n\n专精: ##$pro##\n该效果的持续时间延长至##10##秒，现在只需要手枪##命中##敌人就可以重置持续时间至十秒",																																																																																																																																																																																																																																		

		--Trigger Happy--
		["menu_trigger_happy_beta_sc"] = "乱枪狂人",
		["menu_trigger_happy_beta_desc_sc"] = "掌握: ##$basic##\n使用手枪完成爆头击杀会在##5##秒内提高 手枪##10%## 的伤害，可叠加##5##次，每次使用手枪##爆头##可以使效果持续时间重置为五秒\n\n专精: ##$pro##\n该效果的持续时间延长至##10##秒，现在只需要手枪##命中##敌人就可以重置持续时间至十秒",																								

		--Running From Death--
		["menu_nine_lives_beta_sc"] = "死里逃生",
		["menu_nine_lives_beta_desc_sc"] = "掌握: ##$basic##\n你倒地起身后在##10##秒内移动速度加快##25%##\n\n专精: ##$pro##\n你倒地起身后在##10##秒内受到的伤害减少##20%##，且起身后你的##武器会立即装填完毕##",																																																																																																																																																																																																																																		

		--Undying--
		["menu_running_from_death_beta_sc"] = "苟延残喘",
		["menu_running_from_death_beta_desc_sc"] = "掌握: ##$basic##\n你倒地时的血量增加##100%##\n\n专精: ##$pro##\n你倒地时的血量额外增加##100%##\n\n你现在可以##在倒地时使用主武器##",																																																																																																																																																																																																																																		

		--What Doesn't Kill You Only Makes You Stronger--
		["menu_what_doesnt_kill_beta_sc"] = "越挫越勇",
		["menu_what_doesnt_kill_beta_desc_sc"] = "掌握: ##$basic##\n每次倒地将使你获得##1##点伤害吸收，该效果可以持续累计且会在每次被逮捕后从监狱出来时被重置\n\n专精: ##$pro##\n每次倒地额外获得##3##点伤害吸收",

		--Haunt--
		["menu_haunt_sc"] = "恐惧弥漫",
		["menu_haunt_desc_sc"] = "掌握: ##$basic##\n击杀一名半径##18##米内的敌人有概率在敌人中##散播恐慌##，初始概率为##5%##，每次倒地会提升该效果触发概率的##5%##\n\n恐慌会使敌人短暂地失去行动能力\n\n专精: ##$pro##\n初始概率提高至##20%##，每次倒地提升的概率额外增加##15%##",																																																																																																																																																																																																																																		

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "弥赛亚",
		["menu_pistol_beta_messiah_desc_sc"] = "掌握: ##$basic##\n倒地时，击杀一名敌人可以让你自起。\n\n你只有##1##次机会，每次从监狱复活出来会让你恢复这次机会。\n\n你第一次进监狱前可以多倒地##1##次。\n\n专精: ##$pro##\n你的可倒地次数增加##1##\n\n你现在有##无限##的自起次数，自起冷却时间为##120##秒，倒地击杀敌人可以减少当前剩余冷却时间##10##秒",																																																																																																																																																																																																																																		

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "武者",
		["menu_martial_arts_beta_desc_sc"] = "掌握: ##$basic##\n你受到来源于近战武器的伤害减少##50%##\n\n专精: ##$pro##\n你使用近战武器击倒敌人的概率增加##50%##",																																																																																																																																																																																																																																		

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "铁拳无敌",
		["menu_steroids_beta_desc_sc"] = "掌握: ##$basic##\n你近战武器的蓄力速度和攻击速度都增快##20%##\n\n专精: ##$pro##\n你近战武器的蓄力速度和攻击速度都额外增快##30%##",																																																																																																																																																																																																																																		

		--Frenzy--
		["menu_wolverine_beta_sc"] = "狂乱",
		["menu_wolverine_beta_desc_sc"] = "掌握: ##$basic##\n你的最大血量将被锁定为##25%##\n\n你受到的对##血量##的伤害减少##20%##，但你##无法恢复血量##\n\n对血量的减伤会在其他减伤计算完后再进行计算\n\n专精: ##$pro##\n你受到的对##血量##的伤害额外减少##25##，你现在可以回复血量了，但你受到的血量回复效果只有##75%##",																																																																																																																																																																																																																																		

		--Berserker--
		["menu_frenzy_sc"] = "狂战士",
		["menu_frenzy_desc_sc"] = "掌握: ##$basic##\n你的血量越少，伤害就越高\n\n你的血量低于##50%##时，你将会获得最高##150%##的##近战武器和电锯##伤害加成\n\n专精: ##$pro##\n你的血量越少，伤害就越高\n\n你的血量低于##50%##时，你将获得最高##75%##的##枪械武器##伤害加成"																																																																																																																																																																																																																																	

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "闪避点数",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "你的爆头伤害增加##25%##\n\n你造成的伤害增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒",
		["menu_deckall_4_desc_sc"] = "你的隐匿度增加##1##\n\n防弹背心带来的移动速度惩罚减少##15%##\n\n你完成单日劫案和整个合约后获得的经验值增加##45%##\n\n你造成的伤害额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒",
		["menu_deckall_6_desc_sc"] = "##解锁手雷箱##以供你使用\n\n你的捡弹率增加##25%##\n\n你造成的伤害再额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒",
		["menu_deckall_8_desc_sc"] = "你使用医疗箱的速度加快##20%##\n\n你造成的伤害再次额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒",
	
		--Crook--
		["menu_deck6_1_desc_sc"] = "你的闪避点数增加##5##\n\n防弹背心的护甲值提高##15%##",
		["menu_deck6_3_desc_sc"] = "防弹背心的闪避点数增加##5##",
		["menu_deck6_5_desc_sc"] = "防弹背心的护甲值额外提高##15%##",
		["menu_deck6_7_desc_sc"] = "防弹背心的闪避点数额外增加##5##",
		["menu_deck6_9_desc_sc"] = "防弹背心的护甲值再额外提高##20%##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "你的闪避点数增加##5##\n\n你的切枪速度加快##30%##",
		["menu_deck4_3_desc_sc"] = "你的闪避点数额外增加##5##",
		["menu_deck4_5_desc_sc"] = "倒地起身后，你的闪避条增加至其正常状态上限的##200%##",
		["menu_deck4_7_desc_sc"] = "你的闪避点数再额外增加##5##",
		["menu_deck4_9_desc_sc"] = "完成一次闪避后的##20##秒内，你的血量每##2##秒将增加##1##点；该效果可以叠加，但一旦你受到了对血量的伤害，所有叠加的这种增益都会失效\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Hitman--
		["menu_deck5_1_sc"] = "刀枪并进",
		["menu_deck5_3_sc"] = "进阶杀手",
		["menu_deck5_5_sc"] = "铅笔杀神",
		["menu_deck5_7_sc"] = "终极杀手",

		["menu_deck5_1_desc_sc"] = "使用非近战武器击杀敌人将为你储存##25##点血量，储存的血量上限为##75##点\n\n使用近战武器击杀敌人将使储存的血量转为临时虚血，临时虚血会以每秒##5##点的速度减少\n\n临时虚血可以超出你的血量上限，你最多能拥有##240##点临时虚血\n\n提示：狂乱技能会减少临时虚血上限的##75%##",
		["menu_deck5_3_desc_sc"] = "你的护甲恢复后，闪避条将会增加##100%##\n\n你的闪避点数增加##5##",
		["menu_deck5_5_desc_sc"] = "你现在可以多储存##60%##的血量",
		["menu_deck5_7_desc_sc"] = "你倒地起身后获得##120##的临时虚血\n\n你的闪避点数额外增加##5##",
		["menu_deck5_9_desc_sc"] = "当你有临时虚血时，你受到的对##血量##的伤害减少##20%##且你的移动速度额外增加##20%##\n\n对血量的减伤会在其他减伤计算完后再进行计算\n\n赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
		
		["menu_deck2_1_desc_sc"] = "你的血量上限增加##10%##",
		["menu_deck2_3_desc_sc"] = "你的血量上限额外增加##10%##",
		["menu_deck2_5_desc_sc"] = "你的血量上限再额外增加##10%##",
		["menu_deck2_7_desc_sc"] = "每次的开火射击有##5%##的几率在敌人中##散播恐慌##\n\n恐慌会使敌人短暂地失去行动能力",
		["menu_deck2_9_desc_sc"] = "你的血量上限再次额外增加##10%##\n\n你倒地起身后的血量恢复##25%##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		["menu_deck1_3_desc_sc"] = "你和队友奔跑的耐力提高##50%##\n\n你呼喊的距离增加##25%##\n\n提示：该效果不能由多个使用领队天赋的玩家叠加",
		["menu_deck1_5_desc_sc"] = "你和队友的血量上限增加##5%##\n\n提示：该效果不能由多个使用领队天赋的玩家叠加",
		["menu_deck1_7_desc_sc"] = "你的护甲值提高##10%##。\n\n提示：该效果不能由多个使用领队天赋的玩家叠加",
		["menu_deck1_9_desc_sc"] = "每位人质会为你和队友增加##5%##的血量上限和##10%##的耐力，最多叠加##4##次\n\n提示：该效果不能由多个使用领队天赋的玩家叠加\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "你的护甲值增加##10%##",
		["menu_deck3_3_desc_sc"] = "你的护甲值额外增加##10%##",
		["menu_deck3_5_desc_sc"] = "你的护甲值再额外增加##5%##",
		["menu_deck3_7_desc_sc"] = "你的护甲恢复速度加快##10%##",
		["menu_deck3_9_desc_sc"] = "你的护甲恢复速度额外加快##10%##.\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "你的闪避点数增加##5##\n\n蹲伏时，你的闪避条每##1##秒增加##5%##",
		["menu_deck7_3_desc_sc"] = "你的闪避点数额外增加##5##\n\n你打包尸体的速度加快##20%##",
		["menu_deck7_5_desc_sc"] = "你撬锁的速度加快##20%##\n\n蹲伏时，你的闪避条每##1##秒额外增加##5%##",
		["menu_deck7_7_desc_sc"] = "你的闪避点数再额外增加##5##\n\n你回答对讲机的速度加快##10%##",
		["menu_deck7_9_desc_sc"] = "你的护甲恢复速率增加##10%##\n\n你蹲伏时的移动速度加快##10%##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "你捡起一个弹药盒会回复##4~8##点血量\n\n冷却时间为##10##秒，每捡起一个弹药盒会减少冷却时间##3~5##秒",
		["menu_deck10_3_desc_sc"] = "当你触发捡弹回血时，你的队友也获得捡起一个弹药盒所获得的弹药量",
		["menu_deck10_5_desc_sc"] = "你捡起一个弹药盒回复的血量额外增加##2##",
		["menu_deck10_7_desc_sc"] = "当你触发捡弹回血时，你的队友也回复你回血量##50%##的血量",
		["menu_deck10_9_desc_sc"] = "你捡起一个弹药盒回复的血量再额外增加##2##\n\n当你触发捡弹回血时，你的护甲值也回复##30##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害减少##5%##",
		["menu_deck8_3_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害额外减少##5%##",
		["menu_deck8_5_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害再额外减少##10%##\n\n每次使用近战武器成功击中敌人都将在##10##秒内使你的近战武器伤害增加##8%##，该效果可以叠加且最多叠加##5##次",
		["menu_deck8_7_desc_sc"] = "近战武器击中敌人后的近战武器伤害加成额外增加##8%##",
		["menu_deck8_9_desc_sc"] = "每次使用近战武器成功击中敌人都将在##10##秒内使你的血量每##1.25##秒回复##1##点，该效果可以叠加且最多叠加##5##次\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Sociopath--
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "当你被##18##米内至少##3##名敌人包围时，你受到来自敌人的伤害减少##5%##",
		["menu_deck9_3_desc_sc"] = "击杀一名敌人将为你回复##20##点护甲值\n\n该效果的冷却时间为##3##秒",
		["menu_deck9_5_desc_sc"] = "使用近战武器击杀一名敌人将为你回复##5%##点血量\n\n该效果的冷却时间为##3##秒",
		["menu_deck9_7_desc_sc"] = "击杀一名距你##18##米内的敌人将为你额外回复##20##点护甲值\n\n该效果的冷却时间为##3##秒",
		["menu_deck9_9_desc_sc"] = "击杀一名距你##18##米内的敌人将有##25%##的几率在敌人中##散播恐慌##\n\n恐慌会使敌人短暂地失去行动能力\n\n该效果的冷却时间为##2##秒\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "成功伤害到敌人将使你在##3##秒内每秒回复##1##点血量\n\n该效果可以被叠加，但每##0.5##秒只能叠加一层，最高叠加##5##层，while wearing the ##Flak Jacket##. Damaging enemies with sentries, fire, or poison does not grant stacks.\n\nYou lose ##70## armor while wearing the Flak Jacket.",
		["menu_deck11_3_desc_sc"] = "每层增益中每秒回复的血量额外增加##1##点",
		["menu_deck11_5_desc_sc"] = "每层增益的持续时间额外增加##2##秒",
		["menu_deck11_7_desc_sc"] = "每层增益中每秒回复的血量再额外增加##1##点",
		["menu_deck11_9_desc_sc"] = "每层增益将使你的移动速度加快##5%##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "While your armor is up, you will store ##4## health for every enemy you kill.\n\nWhen your armor starts to regenerate after being completely depleted, you will gain health equal to the stored health amount.\n\nMaximum amount of stored health depends on your equipped armor, with heavier armors being able to store less health than lighter armors.",
		["menu_deck13_3_desc_sc"] = "Increases the amount of health stored from kills by ##2##.\n\nYour dodge is increased by ##5## points.",
		["menu_deck13_5_desc_sc"] = "Increases the maximum health that can be stored by ##25%##.",
		["menu_deck13_7_desc_sc"] = "Increases the amount of health stored from kills by ##2##.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck13_9_desc_sc"] = "Killing an enemy speeds up your armor recovery speed depending on your equipped armor. Heavier armors gain a smaller bonus than lighter armors. This bonus is reset whenever your armor recovers.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "Damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##2400##.\n\nHysteria Stacks:\nIncoming damage is reduced by ##1## point for every ##400## stacks of Hysteria. Hysteria Stacks decay by ##400## every ##8## seconds.",
		["menu_deck14_5_desc_sc"] = "Changes the decay of your Hysteria Stacks to ##300## every ##8## seconds.",
		["menu_deck14_7_desc_sc"] = "Incoming damage is now reduced by ##1## point for every ##300## stacks of Hysteria.",
		["menu_deck14_9_desc_sc"] = "Hysteria stacks are ##100%## more potent for you.\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Anarchist--
		["menu_deck15_1_desc_sc"] = "你的护甲不再是一次性回满，而是每段时间回复一次。 回复量取决于积累的量，每秒会积累##8##点护甲值；两次回复的时间间隔取决于你穿的护甲，更厚重的防弹背心回复间隔更长。\n\n提示：加快护甲回复速率的技能效果将对此天赋无效",
		["menu_deck15_3_desc_sc"] = "你##50%##的血量转化为##50%##的护甲值",
		["menu_deck15_5_desc_sc"] = "你##50%##的血量转化为##100%##的护甲值",
		["menu_deck15_7_desc_sc"] = "你##50%##的血量转化为##150%##的护甲值",
		["menu_deck15_9_desc_sc"] = "造成伤害会为你回复护甲值——该效果的冷却时间为##3##秒，穿越重型的防弹背心就能回复越多的护甲\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "解锁首脑##注射器##以供你使用。注射器会使用你的投掷物栏。\n\n游戏中你可以按[使用投掷物]键激活注射器，激活注射器会在##4##秒内使你在受到伤害后回复所受到伤害##30%##的血量。\n\n注射器的冷却时间为##30##秒\n\n提示：=注射器效果总结=\n1.有护甲时，受击回血；\n2.无护甲时，受击减伤。",
		["menu_deck17_3_desc_sc"] = "注射器生效期间，你的移动速度加快##20%##",
		["menu_deck17_5_desc_sc"] = "注射器的持续时间增加至##6##秒\n\n注射器生效期间，你获得##嘲讽##——一旦你进入敌人的射击范围内，无论周围是什么情况敌人都会优先射击你",
		["menu_deck17_7_desc_sc"] = "你的血量低于##25%##时，注射器生效期间的回血量额外增加##60%##",
		["menu_deck17_9_desc_sc"] = "注射器生效期间，每获得##5##点血量的过量治疗将减少注射器冷却时间##2##秒\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "你的闪避点数增加##5##\n\n解锁投掷物——##烟雾弹##以供你使用\n\n烟雾弹扔出后，它会制造一片持续##12##秒的烟幕。 处于烟幕中的你和你队友回复护甲的速度加快##100%##。 烟幕中的敌人精准度降低##75%##.\n\n烟雾弹的冷却时间为##40##秒，击杀一名敌人将使冷却时间减少##1##",
		["menu_deck18_3_desc_sc"] = "你的闪避点数额外增加##5##",
		["menu_deck18_5_desc_sc"] = "成功闪避一次敌人的攻击将减少烟雾弹的冷却时间##1##秒",
		["menu_deck18_7_desc_sc"] = "你的闪避点数再额外增加##5##",
		["menu_deck18_9_desc_sc"] = "当你在烟雾弹产生的烟幕中时，你的闪避条每秒增加##40%##\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Unlocks and equips the Stoic Hip Flask.\n\n##30%## of damage taken is applied over time (##8## seconds).\n\nYou can use the throwable key to activate the Stoic Hip Flask and immediately negate any damage-over-time.\n\nWhenever damage-over-time is negated, you heal for ##250%## of the remaining damage-over-time. The flask has a ##30## second cooldown.\n\nAll of your ##armor is converted to 50% health.##\n\n##Deflection is disabled while using this perk deck.##",
		["menu_deck19_3_desc_sc"] = "The cooldown of your flask will be reduced by ##1## second for each enemy you kill.",
		["menu_deck19_5_desc_sc"] = "After not taking damage for ##4## seconds any remaining damage-over-time will be negated.",
		["menu_deck19_7_desc_sc"] = "When your health is below ##50%##, the cooldown of your flask will be reduced by ##6## seconds for each enemy you kill.",
		["menu_deck19_9_desc_sc"] = "You gain ##25%## of your maximum health after reviving.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "解锁##电子烟##以供你使用\n\nTo activate the Gas Dispenser you need to look at another allied unit within a ##18## meter radius with clear line of sight and press the throwable key to tag them.\n\nKills you or the tagged unit make heal you for ##8## health and the tagged unit for ##5## health.\n\nThe effect lasts for ##11## seconds, and has a cooldown of ##80## seconds.",
		["menu_deck20_3_desc_sc"] = "Enemies you or the tagged unit kill extend the duration of the gas dispenser by ##2## seconds. This increase is reduced by ##0.2## seconds each time it happens.",
		["menu_deck20_5_desc_sc"] = "Each enemy you or the tagged unit kills reduces damage you take by ##0.5## points up to a maximum of ##8## until the Gas Dispenser's effect and cooldown ends.",
		["menu_deck20_7_desc_sc"] = "Healing from the Gas Dispenser is increased by ##100%##.",
		["menu_deck20_9_desc_sc"] = "Each enemy you kill will reduce the cooldown of the Gas Dispenser by ##2## seconds.\n\nEach enemy the tagged unit kills will reduce the cooldown of the Gas Dispenser by ##2## seconds until you are no longer paired.\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
		
		--Biker--
		["menu_deck16_1_desc_sc"] = "每当你或你队友击杀一名敌人时，你获得##2##点血量。冷却时间为##2##秒。",
		["menu_deck16_3_desc_sc"] = "你每##3##秒恢复##10##点护甲值",
		["menu_deck16_5_desc_sc"] = "每减少##25%##的护甲值都将减少杀敌加血冷却时间##0.5##秒",
		["menu_deck16_7_desc_sc"] = "你现在每##2.5##秒恢复##20##点护甲值\n\n使用近战武器击杀敌人将立即为你回复##20##点护甲值并使该效果下一次提前##1##秒触发",
		["menu_deck16_9_desc_sc"] = "每减少##25%##的护甲值都将使杀敌回血量增加##2##点\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
		
		--Yakuza--
		["menu_deck12_1_desc_sc"] = "你的血量低于##50%##时，血量越少，你的闪避条被动增长的速度越快，最快可以达到每秒增加##8%##\n\n你的闪避点数增加##5##",	
		["menu_deck12_3_desc_sc"] = "你的血量低于##50%##时，血量越少，你杀敌增加的闪避条越多，最多可以达到每击杀一个敌人增加##50%##",
		["menu_deck12_5_desc_sc"] = "你的血量低于##50%##时，血量越少，你受到的伤害越少，最多可以获得##20%##的伤害减免",
		["menu_deck12_7_desc_sc"] = "你的血量低于##50%##时，血量越少，你使用近战武器杀敌增加的闪避条越多，最多可以达到每用近战武器击杀一个敌人增加##50%##\n\n该效果可以和\"蛇之刺青\"(第三个牌组)叠加",
		["menu_deck12_9_desc_sc"] = "受到致命伤害时，你不会倒地，你的血量会变为##1##并获得##50##点护甲值，该效果只能触发一次，每次倒地起身后重置使用次数\n\n提示：该效果不适用于也不能被幻影特工飞踢或泰瑟警察电击造成的倒地刷新\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",	

		--Hacker--
		["menu_deck21_1_desc_sc"] = "解锁##便携式ECM干扰器##以供你使用\n\n游戏中你可以按[使用投掷物]键激活便携式ECM干扰器\n\n警报响起前使用便携式ECM干扰器会带来电子干扰的效果，所有电子设备都将失效，对讲机也会被延迟，持续##12##秒\n\n警报响起后使用便携式ECM干扰器会带来反馈效果，附近的警察将可能受到眩晕效果，持续##12##秒\n\n便携式ECM干扰器每##80##秒的冷却时间可以充能一次，击杀一名敌人将使冷却时间减少##3##秒",
		["menu_deck21_3_desc_sc"] = "你的闪避点数增加##5##",
		["menu_deck21_5_desc_sc"] = "便携式ECM干扰器的反馈生效时，击杀一名敌人将为你回复##20##点血量",
		["menu_deck21_7_desc_sc"] = "你的护甲回复速率增加##10%##\n\n你的闪避点数额外增加##5##",
		["menu_deck21_9_desc_sc"] = "你的队友击杀一名敌人也能回复##10##点血量\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "空白天赋",
		["menu_st_spec_22"] = "空白天赋",		
		["menu_st_spec_0_desc"] = "这个天赋没有任何增益",
		["menu_st_spec_00"] = "通用天赋",
		["menu_st_spec_23"] = "通用天赋",				
		["menu_st_spec_00_desc"] = "这个天赋只有所有天赋共同拥有的牌组的效果",
		["menu_deck0_1"] = "",
		["menu_deck0_1_desc"] = "",		
	})
end)


