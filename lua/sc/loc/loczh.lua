--[[
This code is to detect one of my mods, which helps me keep up the translation of restoration mod when I'm not able to pull a request on github.
Or The update is so less that I should not bother you guys in that case.
I tried to make my mod have a lower priorty, but it didn't work, so I can only do something here.
THIS CAN RLY MAKES MY WORK MUCH MORE CONVENIENT, so PLZ don't delete it since it only affects Chinese.  --]]
if ChinStringFixes and ChinStringFixes.settings and ChinStringFixes.settings.Mod_Support and ChinStringFixes.settings.Mod_Support.Resmod and ChinStringFixes.settings.Mod_Support.Resmod.Resmod_Compat and ChinStringFixes.settings.Mod_Support.Resmod.Resmod_Compat ~= 1 and ChinStringFixes.settings.Enable_String then
	return
end

local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
local eggplant = restoration and restoration.Options:GetValue("OTHER/ForceEggs/Upotte")
local bobcat = restoration and restoration.Options:GetValue("OTHER/ForceEggs/CrabBattle")
local shitpost = restoration and restoration.Options:GetValue("OTHER/ForceEggs/BigMan")
local registeredloser = restoration and restoration.Options:GetValue("OTHER/ForceEggs/EmberMyBeloved")

-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
    LocalizationManager:add_localized_strings({
        -- some vanilla and mod stuff
        ["bm_wp_upg_a_crossbow_explosion_desc"] = "带有爆炸效果的弩箭，接触目标时爆炸。\n\n爆炸伤害不受任何衰减影响。",
        ["achievement_frog_1"] = "返璞归真（Tabula Rasa）",
        ["achievement_trai_10_desc"] = "全队成员在无任何技能，身穿两件套西装，携带Castigo_.44左轮手枪和Mosconi_21G霰弹枪的情况下以强袭途径完成\"迷途纵横\"任务，难度为枪林弹雨或以上。",
        ["sm_17_obj"] = "完成\"石油大亨\"任务，难度为非常困难或以上。\n要完成此任务，你必须从头开始劫案。\n完成后要领取奖励，请使用鼠标滑轮滑下去点击奖励图标。\n\n注意事项：你将需要在第二天的豪宅中找到并收集正确的引擎。\n判断正确引擎的方法：（您可以使用截图或拍照记下该方法和需要搜集的线索）\n1.首先，搜集我们需要的线索。\n在豪宅中找到2个写有可识别英文字母的纸质笔记本，并在地下室楼梯前的墙上找到一块写有三个等于号的白板，以及在地下室的房间中找到一台写有5783psi或5812psi的计算机电脑。\n2.然后，分析辨别我们需要的线索。\n记住白板等于号左边的三个单词，检查笔记本和电脑，其中一个笔记本上写有三个单词中的一个，对应的是白板上等于号右边英文描述的颜色；另一个笔记本上写有H,2xH或3xH；电脑的数字左边会写有大于等于或小于等于的符号。\n3.再来，我们了解引擎的构成。\n引擎由1个斜着放的不同颜色的管子、1个正着放的大蓝管和1个气压表组成。\n4.最后，我们找出正确的引擎。\n单词和白板对应的颜色是斜管的颜色；H,2xH,3xH分别代表正大蓝管的顶部接着1,2,3条线；大于等于和小于等于分别代表气压大于等于或小于等于表上的红色线值。\n若有气压远大于或远小于红线的，那就一定不可能是气压接近红线的引擎。",
        ["dialog_err_failed_joining_lobby"] = "加入游戏失败。\n\n可能的原因：\n——您未能连接上房主的网络或房间不存在\n——您的恢复MOD版本与对方不同",
        ["dialog_remove_dead_peer"] = "与一位或多位玩家的网络连接无法建立。\n\n可能的原因：\n——您未能连接上房主或房间内其它玩家的网络",
        ["dialog_authentication_fail"] = "Steam无法验证你的Steam ID。\n\n可能的原因：\n——您连接到Steam服务器的网络异常",
        ["bm_menu_dlc_locked"] = "无法获取，或连接到STEAM的网络异常",
        ["menu_infamy_go_infamous"] = "选择恶名晋级的方式 ",
        ["menu_infamy_go_infamous_error_crime_spree"] = "罪无止境生效时无法晋升，请先结束或获取奖励",
        ["menu_infamy_go_inf_rep"] = "使用声望（晋升至下一转的0级）",
        ["menu_infamy_go_inf_prestige"] = "使用恶名池（晋升至下一转的100级）",
        ["menu_st_spec_23"] = "模仿者",
        ["menu_st_spec_24"] = "白板",
        ["menu_st_spec_25"] = "天赋异禀",
        ["bm_menu_drag_handle"] = "拉机柄",
        ["bm_wp_upg_a_grenade_launcher_hornet"] = "蜂巢榴弹",
        ["bm_menu_gadget_placement"] = "附件位置",
        ["bm_wp_wpn_fps_upg_xr2_fl_lr"] = "左侧",
        ["bm_wp_wpn_fps_upg_xr2_fl_rr"] = "右侧",
        ["bm_w_car9"] = "ACAR-9冲锋枪",
        ["bm_w_ak5s"] = "Automat-5冲锋枪",
        ["bm_w_bs23"] = "Hammer 23霰弹枪",
        ["bm_w_amr12"] = "AMR-12G霰弹枪",
        ["bm_w_beck"] = "Reinbeck M1霰弹枪",
        ["bm_w_minibeck"] = "雷因贝克自动霰弹枪",
        ["bm_w_g36k"] = "JP36K步枪",
        ["bm_w_xeno"] = "M41A Pulse步枪",
        ["bm_w_sg416"] = "SG-416步枪",
        ["bm_w_bdgr"] = "Hornet .300步枪",
        ["bm_w_spike"] = "Spiker 7.62步枪",
        ["bm_w_sgs"] = "Guerilla .308狙击步枪",
        ["bm_w_hmcar"] = "魔改CAR4步枪",
        ["hud_h_watchdogs_stage2_mission6_hl"] = "挺过突袭", -- vanilla game wrong string fix

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
        ["dialog_show_overhaul_dialog"] = "你正在关闭恢复MOD。一般不推荐这样做，如果你不想继续体验大修，正确的做法是把恢复MOD移出你的mods文件夹。\n\n你的游戏将会在 $TIME 秒后自动关闭，或在你点击\"确认\"时关闭。",
        ["dialog_enable_overhaul_dialog"] = "你正在启用恢复MOD。恢复MOD在安装后通常是永远启用的，它只能通过被移除你的mods文件夹来关闭。\n\n你的游戏将会在 $TIME 秒后自动关闭，或在你点击\"确认\"时关闭。",

        ["res_saveboost"] = "按住 $BTN_INTERACT 以一键升到100级",

        ["RestorationModOptionsButtonTitleID"] = "恢复MOD设置",
        ["RestorationModOptionsButtonDescID"] = "恢复MOD的设置",
        ["RestorationModHUDOptionsButtonTitleID"] = "恢复HUD和UI设置",
        ["RestorationModHUDOptionsButtonDescID"] = "设置恢复MOD的HUD和UI界面",
        ["RestorationModOTHEROptionsButtonTitleID"] = "其它设置",
        ["RestorationModOTHEROptionsButtonDescID"] = "设置额外的功能",
        ["RestorationModWeaponHandlingOptionsButtonTitleID"] = "(+) 武器使用习惯设置",
        ["RestorationModWeaponHandlingOptionsButtonDescID"] = "内含有关你武器使用习惯的设置。\n包含瞄准习惯、操作习惯等。",
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
        ["RestorationModINFOHUDOptionsButtonDescID"] = "在屏幕左侧显示当前技能及其具体信息数据。不需要启用 Alpha UI。",
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
        ["RestorationModInfo_revive_damage_reductionTitleID"] = "医疗兵",
        ["RestorationModInfo_revive_damage_reductionDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_desperadoTitleID"] = "亡命之徒",
        ["RestorationModInfo_desperadoDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_grinderTitleID"] = "组织胺 (冰球手)",
        ["RestorationModInfo_grinderDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_infiltratorTitleID"] = "生命汲取 (渗透者)",
        ["RestorationModInfo_infiltratorDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_sociopathTitleID"] = "危急情形 (反社会者)",
        ["RestorationModInfo_sociopathDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_body_expertiseTitleID"] = "血花四溅", --人体解析
        ["RestorationModInfo_body_expertiseDescID"] = "开启或关闭对此技能的追踪",
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
        ["RestorationModInfo_survive_one_hitTitleID"] = "鬼之刺青 (极道)",
        ["RestorationModInfo_survive_one_hitDescID"] = "开启或关闭对此技能的追踪",
        ["RestorationModInfo_doctor_bag_health_regenTitleID"] = "医疗箱血量恢复",
        ["RestorationModInfo_doctor_bag_health_regenDescID"] = "开启或关闭对医疗箱血量恢复剩余时间的追踪",
        ["RestorationModAltLastDownColorTitleID"] = "更改被逮捕前最后一次倒地的颜色",
        ["RestorationModAltLastDownColorDescID"] = "将被逮捕前最后一次倒地时角色边框的颜色设置为 color_sin_classic*.",
        ["RestorationModNoBleedoutTiltTitleID"] = "取消倒地视角的倾斜",
        ["RestorationModNoBleedoutTiltDescID"] = "倒地后玩家的视角将不再倾斜",
        ["RestorationModADSTransitionStyleTitleID"] = "瞄准风格",
        ["RestorationModADSTransitionStyleDescID"] = "改变你使用瞄准的动作风格。",
        ["RestorationModGCGPYPMMSACTitleID"] = "禁用星战武器", -- may need improved
        ["RestorationModGCGPYPMMSACDescID"] = "关闭来自遥远银河系的武器配件及其机制。\n重启劫案生效。", -- may need improved
        ["RestorationModGCGPYPMMSACTextTitleID"] = "禁用彩蛋文本",
        ["RestorationModGCGPYPMMSACTextDescID"] = "关闭极低概率出现的彩蛋文本。\n重启劫案生效。",
        ["RestorationModForceEggsOptionsButtonTitleID"] = "强制使用彩蛋文本",
        ["RestorationModForceEggsOptionsButtonDescID"] = "无视禁用，强制显示彩蛋文本。\n重启劫案生效。",
            ["RestorationModUpotteTitleID"] = "游戏的梗",  --eggplant
            ["RestorationModUpotteDescID"] = "原友觉醒！\n有关三国杀、守望先锋、战地、原神、CF、CSGO、Apex等游戏的梗。",
            ["RestorationModCrabBattleTitleID"] = "国外的梗",  --bobcat
            ["RestorationModCrabBattleDescID"] = "左轮山猫",
            ["RestorationModEmberMyBelovedTitleID"] = "鹰姐的梗",  --registeredloser
            ["RestorationModEmberMyBelovedDescID"] = "鹰姐自己写的一些难登大雅之堂但是似乎有趣甚至是有用的梗。",
            ["RestorationModBigManTitleID"] = "其它梗:^)",  --shitpost
            ["RestorationModBigManDescID"] = "其它难以分类的梗。",
        ["RestorationModStaticAimTitleID"] = "瞄准时武器无变向",
        ["RestorationModStaticAimDescID"] = "勾选以关闭你在瞄准时，武器会随着你屏幕的移动而变向的效果，参考PDTH。会替换Viewmodel Movement的效果。\n重启以生效。警告：取消勾选将导致某些选项不可用。",
        ["RestorationModViewmodelMovementTitleID"] = "武器模型运动效果", -- tra
        ["RestorationModViewmodelMovementDescID"] = "在此设置你的武器模型在你视角移动时如何运动。\n瞄准时的效果会被\"瞄准时武器无变向\"设置覆盖。重启以生效。",
        ["vm_vanilla"] = "同原版",
        ["vm_drag"] = "武器延后移动",
        ["vm_lead"] = "武器先于移动",
        ["vm_static"] = "静止（无动作）",
        ["RestorationModCarpalTunnelTitleID"] = "自动压枪",
        ["RestorationModCarpalTunnelDescID"] = "选择原版中自动压枪机制的效果程度。\n即在完成射击后，准星会自动下移一部分后坐力抬升的角度。",
        ["RestorationModWpnCatTitleID"] = "购买菜单分类方式",
        ["RestorationModWpnCatDescID"] = "改变武器在购买菜单的分类方式。重启游戏生效。",
        ["RestorationModAutoDMRsTitleID"] = "DMR步枪全自动模式开局",
        ["RestorationModAutoDMRsDescID"] = "选择是否让所有可调节射击模式的精确射手步枪以全自动射击模式开局。",
        ["RestorationModSprintCancelTitleID"] = "紧急回避专精起跑打断换弹",
        ["RestorationModSprintCancelDescID"] = "选择在你专精了\"紧急回避\"技能后，跑步是否会打断换弹。\n勾选以打断换弹来应对按R召唤敌人的情况。",
        ["RestorationModSevenHoldTitleID"] = "轻按互动切换 (Press2Hold)",
        ["RestorationModSevenHoldDescID"] = "只需要按一下互动键，就会自动保持互动。\n再按一次互动键取消互动。",
        ["RestorationModSevenHoldDeployCancelTitleID"] = "用放置随身装备键取消互动",
        ["RestorationModSevenHoldDeployCancelDescID"] = "勾选以使用放置随身装备的按键取消互动。需要先开启轻按互动切换。",
        ["RestorationModQueuedShootingTitleID"] = "连点射击辅助输入",
        ["RestorationModQueuedShootingDescID"] = "半自动武器在连续点鼠标两下时，可能因为射击间隔还没到，第二发没射出来。\n勾选此选项帮助你在射击间隔期间按鼠标也会等待间隔结束自动帮你开火。",
        ["RestorationModQueuedShootingWindowTitleID"] = "辅助输入的灵敏度",
        ["RestorationModQueuedShootingWindowDescID"] = "以百分比决定你在间隔达到之前什么时候点鼠标可以让下一发射出来，值高意味着更早。\n例：3秒间隔+0.2值=射击后等2.4秒再点鼠标就会让第二发在又0.6秒后自动射出来",
        ["RestorationModQueuedShootingExcludeTitleID"] = "辅助输入的武器限制",
        ["RestorationModQueuedShootingExcludeDescID"] = "只为高于此选项所设射速(RPM)的武器启用辅助输入。",
        ["RestorationModNoADSRecoilAnimsTitleID"] = "取消瞄准后坐力动作",
        ["RestorationModNoADSRecoilAnimsDescID"] = "勾选以取消你在瞄准时射击产生的后坐力动画。\n有些武器不受此选项影响（换言之即手动操作的枪械，弓弩，火焰喷射器）",
        ["RestorationModNoSwapOnReviveTitleID"] = "被救起时不强制切换武器",
        ["RestorationModNoSwapOnReviveDescID"] = "勾选以避免在“苟延残喘”技能未专精且使用主武器倒地时，\n被救起后强行切换出主武器。",
        ["RestorationModSecondSightSprintTitleID"] = "使用冲刺按键切换次要瞄具",
        ["RestorationModSecondSightSprintDescID"] = "使用冲刺按键而不是附件按键来在瞄准时切换为次要瞄具。\n这将导致你无法在瞄准时即刻切换为奔跑状态。", -- try
        ["RestorationModAimDeploysBipodTitleID"] = "瞄准时自动用脚架",
        ["RestorationModAimDeploysBipodDescID"] = "勾选以在一个可用平面瞄准时自动架起脚架。",
        ["RestorationModMoveCancelBipodTitleID"] = "移动时自动收脚架",
        ["RestorationModMoveCancelBipodDescID"] = "勾选以在你移动时自动收起脚架。",
        ["RestorationModSeparateBowADSTitleID"] = "分离弓的瞄准",
        ["RestorationModSeparateBowADSDescID"] = "勾选以关闭拉弓时强制进入瞄准状态。\n启用后，你的换弹按键将用于停止拉弓。",
        ["RestorationModClassicMoviesTitleID"] = "PD:TH经典界面",
        ["RestorationModClassicMoviesDescID"] = "选择是否在任务简报界面采用PD:TH的经典页面(仅适用于经典劫案)",
        ["RestorationModPerPelletShotgunsTitleID"] = "Per-Pellet Shotgun Damage (WIP)", -- tra
        ["RestorationModPerPelletShotgunsDescID"] = "Shotgun damage is calculated per pellet as opposed to the standard \"1 pellet = full damage, headshots prioritized\". Non-slug shotgun damage is increased to compesate for lower consistency. Requires restart.",

        -- not anymore?(non-note)
        ["RestorationModQuietRainTitleID"] = "减轻雨声",
        ["RestorationModQuietRainDescID"] = "在下雨的劫案中雨声不会那么嘈杂",

        ["rr_off"] = "关闭",
        ["rr_per_weapon"] = "依武器而定",
        ["rr_full"] = "全额",

        ["vanilla_on_rails"] = "默认/原版",
        ["kf_mw_style"] = "杀戮间1/使命召唤",
        ["tilt_in"] = "Tilted体感控制器",

        ["base_wpn_cat"] = "基本分类方式",
        ["sub_wpn_cat"] = "细节分类方式",

        ["RestorationModWepNamesTitleID"] = "武器名称显示方式",
        ["RestorationModWepNamesDescID"] = "改变武器名字的显示风格。\n重启以生效。",
        ["resmod_res_names"] = "原名（默认）",
        ["resmod_no_nicknames"] = "恢复Mod原来的游戏名称显示",
        ["dmcwo_reelnames"] = "真实武器名（DMCWO Port - WIP）",
        ["resmod_no_renames"] = "现实中的武器名字（或使用你自己的武器重命名Mod）\n注意：本项自带内容没有汉化",

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
        ["RestorationModPaintingsDescID"] = "允许或禁止在 美术馆-画廊 中生成原版未被使用的画作。仅作为房主时有效。",
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
        ["RestorationModSCDescID"] = "启用或禁用恢复mod的完全游戏更改。切换此选项将自动退出游戏，以防止存档损坏。",
        ["RestorationModHolidayTitleID"] = "节日活动",
        ["RestorationModHolidayDescID"] = "开启或关闭 节日活动 对大修的影响",
        ["RestorationModCloakerTurnTitleID"] = "幻影特工飞踢时视角转向",
		["RestorationModDisableMutatorColorsTitleID"] = "Disable Mutator Assault Banner Colors",
		["RestorationModDisableMutatorColorsDescID"] = "Disable the color change to the Assault Banner when using mutators (Vanilla HUD only).",			
        ["RestorationModCloakerTurnDescID"] = "开启或关闭幻影特工飞踢你时，你的视角自动转向它的效果。",
        ["RestorationModRestoreHitFlashTitleID"] = "恢复Mod受击闪屏",
        ["RestorationModRestoreHitFlashDescID"] = "启用或禁用恢复Mod的受击闪屏",
        ["RestorationModBotsNoDropTitleID"] = "禁用Bot队友丢包",
        ["RestorationModBotsNoDropDescID"] = "勾选以禁止AI队友在任何情况下丢掉身上的包",
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

        -- These should not be used until Chinese font is supported.
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
        ["restoration_level_data_firestarter_1"] = "傍晚7:25 , 私人机场",
        ["restoration_level_data_firestarter_1_res"] = "傍晚7:25 , 私人机场",
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
        ["restoration_level_data_roberts"] = "早晨8:47 , 罗伯特储蓄银行",
        ["restoration_level_data_roberts_v2"] = "早晨8:47 , 罗伯特储蓄银行",
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
        ["restoration_level_data_friend"] = "下午4:30 , 迈阿密-疤面庄园",
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
        ["restoration_level_data_nmh_res"] = "晚上8:24 , 仁慈医院-隔离病房区",
        ["restoration_level_data_vit"] = "下午1:07 , 华盛顿哥伦比亚特区-白宫",
        ["restoration_level_data_mex"] = "秘密的时间, 美国-南部边界",
        ["restoration_level_data_mex_cooking"] = "秘密的时间, 墨西哥-Coyopa复合物",
        ["restoration_level_data_bex"] = "秘密的时间, 墨西哥-圣马丁银行",
        ["restoration_level_data_pex"] = "秘密的时间, 墨西哥-警察局",
        ["restoration_level_data_fex"] = "秘密的时间, 墨西哥-布鲁克庄园",
        ["restoration_level_data_chas"] = "下午8:30, 旧金山-唐人街",
        ["restoration_level_data_sand"] = "下午10:30, 旧金山-船坞",
        ["restoration_level_data_chca"] = "下午9:24, 圣弗朗西斯海湾-黑猫号",
        ["restoration_level_data_pent"] = "夜晚11:30, 旧金山 - 渔夫王的顶楼",
        ["restoration_level_data_ranc"] = "傍晚6:24, 德克萨斯 - 米德兰牧场",
        ["restoration_level_data_trai"] = "傍晚7:40, 沃斯堡 - 道尔顿庭院",
        ["restoration_level_data_corp"] = "傍晚8:35, 达拉斯 - SERA研究所",
        ["restoration_level_data_deep"] = "9:00 PM, Gulf of Mexico - SERA's Oil Rig Tanker", -- tra
        ["restoration_level_data_wetwork"] = "秘密的时间, 秘密的地点",
        ["restoration_level_data_junk"] = "秘密的时间, 秘密的地点",
        ["restoration_level_data_holly"] = "下午5:00 , 洛杉矶-卢卡斯的庄园",
        ["restoration_level_data_lvl_friday"] = "下午5:00 , 大型购物中心",
        ["restoration_level_data_skm_nightmare_lvl"] = "一家洗衣店？你是来洗脱你的罪恶的吗？",

        -- custom heists
        ["restoration_level_data_flatline_lvl"] = "10:26 PM, Больница им. Н.И. Пирогова",
        ["restoration_level_data_flatline_lvl"] = "10:26 PM, Больница им. Н.И. Пирогова", -- Flatline
        ["restoration_level_data_ahopl"] = "9:06 PM, Yuri's Private Club", -- A House of Pleasure
        ["restoration_level_data_atocl"] = "7:03 PM, Penthouse Party", -- A Touch of Class
        ["restoration_level_data_rusdl"] = "10:23 AM, Garnet Group Jewelery Store", -- Cold Stones
        ["restoration_level_data_crimepunishlvl"] = "1:19 PM, Correctional Facility Somewhere in Russia", -- Crime and Punishment
        ["restoration_level_data_deadcargol"] = "8:36 PM, Sewers Under The Depot", -- Deadly Cargo
        ["restoration_level_data_hunter_party"] = "3:56 PM, Nikolai's Penthouse", -- Hunter and Hunted d1
        ["restoration_level_data_hunter_departure"] = "10:13 PM, Aleksandr's Private Airport", -- Hunger and Hunted d2
        ["restoration_level_data_hunter_fall"] = "1:36 AM, Somewhere Over International Waters", -- Hunter and Hunted d3
        ["restoration_level_data_ruswl"] = "11:50 AM, Somewhere in Russia", -- Scorched Earth
        ["restoration_level_data_jambank"] = "11:59 AM, Harvest & Trustee Bank", -- Botched Bank
        ["restoration_level_data_2Fort"] = "Overime, Somewhere in Teufort", -- 2fort
        ["restoration_level_data_anlh"] = "2:35 PM, Jian Liang's Villa", -- An End to Liang
        ["restoration_level_data_lvl_fourmorestores"] = "3:12 PM, Storefronts", -- Four More Stores
        ["restoration_level_data_TonCont"] = "11:01 AM, Atrium", -- AT: Atrium
        ["restoration_level_data_amsdeal1"] = "9:49 PM, Alleyways", -- Armsdeal Alleyway
        ["restoration_level_data_ascension_III"] = "10:53 PM, Eclipse Research Facility", -- Ascension
        ["restoration_level_data_hwu"] = "11:03 PM, Avalon Logistics Safehouse", -- Avalon's Shadow
        ["restoration_level_data_vrc1"] = "2:35 PM, Downtown District", -- A Very Richie Christmas d1
        ["restoration_level_data_vrc2"] = "6:46 PM, Storage Warehouse", -- A Very Richie Christmas d2
        ["restoration_level_data_vrc3"] = "11:04 PM, GenSec Tower", -- A Very Richie Christmas d3
        ["restoration_level_data_btms"] = "4:40 AM, Nevada - Black Ridge Facility", -- Blackridge Facility
        ["restoration_level_data_BloodMoney"] = "8:00 PM, Downtime Offices", -- Blood Money
        ["restoration_level_data_brb_rant"] = "6:53 PM, New York, BROOKLYN - Harvest & Trustee Branch Bank", -- Brooklyn Bank Ranted
        ["restoration_level_data_lit1"] = "4:20 PM, California Green Store", -- California Heat
        ["restoration_level_data_lit2"] = "4:20 PM, Almir's Games Store", -- California Heat - Almir's Games
        ["restoration_level_data_dwn1"] = "7:12 PM, California Green depot", -- Deep Inside
        ["restoration_level_data_the_factory"] = "9:37 PM, Eclipse Research Facility", -- Eclipse Research Facility
        ["restoration_level_data_Election_Funds"] = "10:29 PM, Electoral Headquarter", -- Election Funds
        ["restoration_level_data_constantine_mex_level"] = "3:46 PM, Somewhere in Mexico", -- End of an Era
        ["restoration_level_data_battlearena"] = "11:14 PM, Georgetown", -- FiveG
        ["restoration_level_data_funbank"] = "Something doesn't look right...", -- Funbank
        ["restoration_level_data_RogueCompany"] = "8:20 PM, Jackals Territory", -- Rogue Company
        ["restoration_level_data_bnktower"] = "TIME CLASSIFIED, GenSec H.I.V.E.", -- GenSec HIVE
        ["restoration_level_data_glb"] = "11:19 AM, Golden Lotus Bank", -- Golden Lotus Bank
        ["restoration_level_data_constantine_harbor_lvl"] = "9:12 PM, Dockyard Warehouses", -- Harboring a Grudge
        ["restoration_level_data_tonmapjam22l"] = "4:49 PM, Harvest & Trustee Bank", -- Hard Cash
        ["restoration_level_data_hardware_store"] = "7:36 PM, Hardware Store", -- Hardware Store
        ["restoration_level_data_tj_htsb"] = "1:10 PM, Harvest & Trustee Bank", -- H&T Southern Branch
        ["restoration_level_data_tj_htsb_escape_level"] = "Escape!", -- H&T Southern Branch escape day? probably unused, dunno
        ["restoration_level_data_hntn"] = "9:16 AM, Harvest & Trustee Bank", -- H&T Northern Branch
        ["restoration_level_data_hidden_vault"] = "11:08 PM, Kranich facility downtown", -- Hidden Vault
        ["restoration_level_data_crumch_returns"] = "12:50 PM, Shield Mall", -- Mallcrasher Ranted
        ["restoration_level_data_mansion_stage1"] = "2:13 AM, Sir Elmsworth's Mansion", -- Elmsworth Mansion
        ["restoration_level_data_skm_nmh"] = "9:12 PM, Mercy Hospital - Roof", -- No Mercy SKM
        ["restoration_level_data_office_strike"] = "1:57 PM, Downtown FBI Offices", -- Office Strike 
        ["restoration_level_data_highrise_stage1"] = "1:03 AM, Tremblay's Apartment", -- Out of Frame
        ["restoration_level_data_constantine_bank_lvl"] = "12:00 PM, Pacific Bank", -- Pacific Bank
        ["restoration_level_data_sh_raiders"] = "5:16 PM, Outskirts Warehouse", -- Safehouse Raiders
        ["restoration_level_data_santas_hardware_store"] = "3:47 PM, Hardware Store", -- Santa's Hardware Store
        ["restoration_level_data_schl"] = "9:57 PM, The Scarlet Club", -- Scarlet Club
        ["restoration_level_data_skm_wd2_x"] = "6:09 PM, Almendia Logistics Dockyard", -- Watchdogs d2 SKM revamp
        ["restoration_level_data_Skyscraper"] = "2:13 AM, GenSec Corporate Headquarters", -- Skyscraper Heist
        ["restoration_level_data_tonisl1"] = "3:31 PM, Harvest & Trustee Bank", -- Grand Harvest
        ["restoration_level_data_ttr_yct_lvl"] = "2:19 PM, Wei Cheng's Yacht", -- Triad Takedown Remastered
        ["restoration_level_data_Tonis2"] = "1:31 PM, Harbor Warehouses", -- Triple Threat
        ["restoration_level_data_trop"] = "11:48 AM, Somewhere Over International Waters", -- Tropical Treasure
        ["restoration_level_data_Gambling_room"] = "9:29 PM, Twenty Four Seven Store", -- Underground Bargains
        ["restoration_level_data_finsternis"] = "5:24 PM, Germany - Schwarzwald", -- Projekt Finsternis

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

        ["heist_contact_shatter"] = "胡狼",
        ["heist_contact_akashic"] = "尼可",

        ["menu_contacts_shatter"] = "CRIMENET成员",

        ["heist_contact_jackal_description"] = "胡狼起初为Gensec工作，但很快在一次牵扯到Gensec和OMNIA的人口贩卖事件后辞职。\n\n现在他为CRIMENET效力，将战斗带到它们的地盘上。",

        ["heist_contact_akashic_description"] = "曾在赫克特·莫拉莱斯手下工作的高级中尉，尼古拉斯·\"尼可\"·雷内现在指挥着锡那罗亚贩毒集团在美国的残部。\n他们数量较少，因此规模更大的哥伦比亚贩毒集团不愿帮助他们，也不愿改善同CRIMNET的关系。\n\n于是尼可拉拢了在东海岸活动的各种小规模帮派并同CRIMENET结盟，他会提供他的资源以换取CRIME.NET的服务。",

        ["bm_msk_shatter_true"] = "刺眼火花",
        ["bm_msk_shatter_true_desc"] = "只被人们隐晦提及的传奇面具。\n\n当然了，这只是件复制品。\n\n原品实在是过于珍贵，以至于我认为这件复制品就足以满足你的收藏欲望。\n\n凤凰，重生的象征，无法真正死亡的永生之物。若是将其抹杀，它将火光与烈焰中给予反击。",

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
        ["bm_msk_canada_desc"] = "不要留下任何东西——即使大军压境了也不行！当你对此有所追求的时候，你必须为之而战。（即便条子的进攻如铝热炸弹一般势不可挡）",
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
        ["bm_msk_male_mask_blood_desc"] = "一个由CRIMENET提供的标准分发面具。\n\n由致密材料制成，不容易坏，但是也没那么容易戴上。\n\n这是在对OMNIA仓库一次血肉横飞的拙劣抢劫后发现的面具。\n\n船员在失联前留下的最后一条消息是\"紧急警报\"。",
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

        ["bm_msk_beef_dallas"] = "怨念达拉斯",
        ["bm_msk_beef_dallas_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n达拉斯选择继续保持他那标志性的小丑面具设计。",
        ["bm_msk_beef_chains"] = "怨念钱恩斯",
        ["bm_msk_beef_chains_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n作为暴徒的钱恩斯想要一种骇人的动物作为自己的面具设计。还有什么会比一只该死的恐龙更骇人呢？",
        ["bm_msk_beef_hoxton"] = "怨念霍斯顿",
        ["bm_msk_beef_hoxton_desc"] = "四人组在大闹屠宰场时戴的就是这些面具。\n\n霍斯顿对于他的面具设计要求简单明了：\n-有保护！\n-很高效！\n-够时髦！\n\n于是，这个面具诞生了。",
        ["bm_msk_beef_wolf"] = "怨念沃尔夫",
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

        ["bm_msk_secret_sydney"] = "惊世之秘 希妮",
        ["bm_msk_secret_sydney_desc"] = "当贝恩告诉她惊世之秘的时候，希妮不信远古力量的传说。但就算有机会挑战未知，能骑在当权者的头上也足以让她入伙了。",

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
        ["bm_msk_chains_halloween_desc"] = "作为一名雇佣兵，你会见到许多痛苦，以及死亡。即使你觉得自己刀枪不入、无人能挡…有时它也会挥之不去地缠着你。\n\n在2008年10月的一个明朗愉快的雪天下午，钱恩斯正在睡懒觉。他刚刚为黑水完成了一项暗杀工作，干了难活、拿了报酬、开了个舒适的酒店房间来睡觉。\n\n这么多年来他第一次做了噩梦，他想不起来是什么了，但他记得他半睡半醒鬼压床，一个更似骷髅而非人类的人影紧盯着他，可他却动弹不得。\n\n自那天之后，每次当他举枪杀人，接下来的那个夜晚就会躁动不安、糟糕可怕。\n\n最后，他不得不说：\"够了。\"他金盆洗手，看心理医生，吃药来治疗。那一年的生活是那么的美好…\n\n就在一年后的2009年10月31日，黑水确信那个不干了去修复自己生活的人会泄密、试图重伤公司，他们不能让那发生。\n\n钱恩斯被逼开始犯罪生活以保护自己，再一次成为一个斗士。\n\n但是这一次呢？和之前完全不同。噩梦和睡眠瘫痪没有再找上门。他不是为了伤害他人而伤害他人。\n\n这次，他是为了保护自己。",

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
        ["alpha_assault"] = "早期Alpha类型",
        ["beta_assault"] = "Alpha类型",

        ["RestorationModDodgeDisplayTitleID"] = "闪避条显示方式",
        ["RestorationModDodgeDisplayDescID"] = "选择显示闪避条的最大上限为多少。重启劫案以应用更改。",
        ["dd_scale"] = "150 -闪避等级",
        ["dd_150"] = "150",
        ["dd_100"] = "100",

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
        ["menu_jukebox_resmusic_ticktockalpha"] = "Tick Tock (Alpha Version)",
        ["menu_jukebox_screen_resmusic_ticktockalpha"] = "Tick Tock (Alpha Version)",
        ["menu_jukebox_resmusic_doublecrossbeta"] = "Double Cross (Beta Version)",
        ["menu_jukebox_screen_resmusic_doublecrossbeta"] = "Double Cross (Beta Version)",
        ["menu_jukebox_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Beta Version)",
        ["menu_jukebox_screen_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Beta Version)",
        ["menu_jukebox_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Old Version)",
        ["menu_jukebox_screen_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Old Version)",
        ["menu_jukebox_resmusic_razormindbeta"] = "Razormind (Beta Version)",
        ["menu_jukebox_screen_resmusic_razormindbeta"] = "Razormind (Beta Version)",
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

        ["gm_gms_purchase"] = "通过大陆币购买",
        ["gm_gms_purchase_window_title"] = "你确定？",
        ["gm_gms_purchase_window_message"] = "你真的要购买'{1}'？\n\n这会花费{2} {3}。",
        ["gm_gms_purchase_failed"] = "无法购买",
        ["gm_gms_free_of_charge_message"] = "{1}免费且不限数量。",
        ["gm_gms_cannot_afford_message"] = "由于您没有足够的{3}，因此您无法购买{1}。您需要{2} {3}以购买{1}。",

        ["bm_menu_amount_locked"] = "库存不足",

        -- These won't be used until Chinese font is supported. Will there be? Maybe(laugh).
        ["resmod_challenges"] = "挑战",
        ["resmod_challenges_hint"] = "查看已完成与已激活的挑战。",
        ["resmod_active_challenges"] = "已激活的挑战",
        ["resmod_active_challenges_hint"] = "当前已激活的挑战。",
        ["resmod_completed_challenges"] = "已完成的挑战",
        ["resmod_completed_challenges_hint"] = "已领取奖励的已完成挑战。",

        -- ["ch_vs_desc"] = "Using $weapon s, defeat $count $eneType. Using melee does not contribute to this challenge.",
        -- ["ch_vs_head_shots_desc"] = "Using the $weapon s, defeat $count $eneType with Headshots.",
        -- ["ch_vs"] = "$weapon s VS. $eneType $no",
        -- ["ch_vs_head_shots"] = "$weapon s VS. $eneType HEADSHOTS $no",

        -- ["ene_law"] = "执法人员",
        -- ["ene_law_desc"] = "敌对单位",

        ["ch_vs_desc"] = "使用指定的$weapon 击杀 $count 个 $eneType。使用近战武器不计入在内。",
        ["ch_vs_head_shots_desc"] = "使用指定的 $weapon 爆头击杀 $count 个 $eneType。",
        ["ch_vs"] = "$weapon VS. $eneType $no",
        ["ch_vs_head_shots"] = "$weapon VS. $eneType 爆头 $no",

        ["ene_law"] = "THE WORLD",
        ["ene_law_desc"] = "敌方单位",

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

        -- no font again lol
        -- ["ch_deploy_ammobag_hl"] = "最后一发！",
        -- ["ch_deploy_ammobag"] = "部署$count个弹药包。",
        -- ["ch_plant_tripmine_hl"] = "激光秀",
        -- ["ch_plant_tripmine"] = "部署$count个诡雷。",
        -- ["ch_deploy_medicbag_hl"] = "保险福利",
        -- ["ch_deploy_medicbag"] = "部署$count个医疗箱。",
        -- ["ch_deploy_ecm_hl"] = "系统摧毁者",
        -- ["ch_deploy_ecm"] = "部署$count个电子干扰器。",
        -- ["ch_deploy_fak_hl"] = "生命线",
        -- ["ch_deploy_fak"] = "部署$count个急救包。",
        -- ["ch_deploy_sentry_hl"] = "白山基地爱好者",
        -- ["ch_deploy_sentry"] = "部署$count个哨戒机枪。",

        -- ["ch_watchdogs_d1_heavy_wpn1_hl"] = "重甲配大枪",
        -- ["ch_watchdogs_d1_heavy_wpn1"] = "身穿改良型复合战术背心，仅使用Vulcan转轮机枪、Thanatos.50 cal狙击步枪或HRL-7火箭筒完成\"看门狗\"任务第一天，难度为枪林弹雨或以上。要完成此挑战，你必须从头开始劫案。",

        ["ch_deploy_ammobag_hl"] = "最后一颗子弹！",
        ["ch_deploy_ammobag"] = "部署$count个弹药包。",
        ["ch_plant_tripmine_hl"] = "激光秀",
        ["ch_plant_tripmine"] = "部署$count个诡雷。",
        ["ch_deploy_medicbag_hl"] = "保险红利",
        ["ch_deploy_medicbag"] = "部署$count个医疗箱。",
        ["ch_deploy_ecm_hl"] = "系统崩盘王",
        ["ch_deploy_ecm"] = "部署$count个电子干扰器。",
        ["ch_deploy_fak_hl"] = "生命线",
        ["ch_deploy_fak"] = "部署$count个急救包。",
        ["ch_deploy_sentry_hl"] = "白山狂热者",
        ["ch_deploy_sentry"] = "部署$count个哨戒机枪。",

        ["ch_watchdogs_d1_heavy_wpn1_hl"] = "更厚的甲，更猛的枪",
        ["ch_watchdogs_d1_heavy_wpn1"] = "完成看门狗劫案的第一天，装备改良型联合战术防弹衣，同时使用加特林机枪、Thanatos狙击步枪或者RPG。要求OVERKILL难度及以上。要完成此挑战你必须从头开始进行劫案。",

        ["test_net"] = "Fast.Net",
        ["menu_test"] = "",
        ["state_filter"] = "状态",
        ["menu_state_filter"] = "状态筛选",
        ["menu_state_filter_help"] = "显示房间状态",
        ["menu_state_lobby"] = "大厅中",
        ["menu_state_loading"] = "加载中",
        ["menu_state_ingame"] = "游戏中",

        -- ///Stuff ripped from the various locale files we had ///

        -- Halloween Dozer Sword
        ["bm_melee_halloween_sword"] = "无头熊之剑",
        ["menu_l_global_value_halloween_sword"] = "这是一件Halloween 2013物品！",

        -- S&W .500
        ["bm_w_shatters_fury"] = "Phoenix .500左轮手枪",

        ["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "荷鲁斯枪管",
        ["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "粉碎枪管",
        ["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "哈索尔枪管",
        ["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "火鸟枪管",

        ["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "人体工学握把",

        ["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "丝滑弹巢",

        ["menu_l_global_value_shatters_fury"] = "这是一件VERITAS物品！",

        -- MK-23
        -- Semi-automatic pistol. Hold down ■ to aim. Release to fire.
        ["bm_w_socom"] = "Anubis .45手枪",
        ["bm_w_x_socom"] = "双持Anubis .45手枪",
        ["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra复合模块",
        ["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "按$BTN_GADGET开启/关闭。",

        -- Ranted NMH
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

        -- OICW--
        ["bm_w_osipr"] = "SABR步枪",
        ["bm_w_osipr_gl"] = "SABR榴弹发射器",

        -- GO Bank remastered
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

        -- Whurr Heat Street Edit
        ["heist_heat_street_new_name"] = "热火街头经典·真",
        ["heist_heat_street_new_brief"] = "有人说世事无常，但这一单看起来真的很容易：进去，拿公文包，出来。你可靠的司机马特会在小巷里等你而且只要你到了撤离车你就不可能失败。可能失败吗？",
        ["heist_street_new_name"] = "热火街头：掠夺",
        ["heist_street_new_brief"] = "有人说世事无常，但这一单看起来真的很容易：进去，拿公文包，出来。你可靠的司机马特会在小巷里等你而且只要你到了撤离车你就不可能失败。可能失败吗？",

        -- Heat Street, Skirmish edition
        ["heist_skm_heat_street_name"] = "住宅区-英克韦尔工业区",
        ["heist_skm_heat_street_brief"] = "条子最近审问了一个声称曾看见过贝恩的脸而且可以认出他的囚犯。我们知道这不是真的，但条子们不知道，我们的对手也不知道，所以我们就用这个机会捞些钱。在警察转移他到靠近那个想逃走的傻逼马特撞了他的车的旧工厂仓库区的证人保护屋时，拦下他们。",
        ["heist_skm_street_name"] = "遭遇战：住宅区-英克韦尔工业区",
        ["heist_skm_street_brief"] = "条子最近审问了一个声称曾看见过贝恩的脸而且可以认出他的囚犯。我们知道这不是真的，但条子们不知道，我们的对手也不知道，所以我们就用这个机会捞些钱。在警察转移他到靠近那个想逃走的傻逼马特撞了他的车的旧工厂仓库区的证人保护屋时，拦下他们。",

        -- Xmas Hoxout and Breaking Feds
        ["heist_xmn_hox"] = "霍斯顿越狱记圣诞版",
        ["heist_xmn_hox1"] = "越狱圣诞版",
        ["heist_xmn_hox_1_brief"] = "牙医为霍斯顿安排了一次重新审判。呃，不是你，小霍，我是说老的那个……嗯，名字的事以后再说。审判会很快的。按他的犯罪记录来看他就甭想再出来了，不过这不是关键。关键是他现在要被转监，而我们可以在听证会结束之后的半路上把他救出来，就当是对联邦法律系统说句小小的\"去你妈的\"。$NL;$NL;计划听起来就很火爆：我们把法院的墙炸开，带上老霍撤退。$NL;$NL;整个区域都被封锁了。他们肯定知道事情会有变故。都给我备好家伙，再另外多带点弹药。",
        ["heist_xmn_hox2"] = "证物搜寻圣诞版",
        ["heist_xmn_hox_2_brief"] = "好啊，姑娘小伙们，感谢你们把爷从那救出来，但打一开始老子就不该进去。是有人下了套，我非常肯定。他们不应该会了解那么多，傻帽条子做事不可能有那么精明。我们中有内鬼，有人想搞死我。而我一定要找出来是谁。这可不是简单的活，但不入虎穴焉得虎子对吧？别跟我说什么要靠秘密交易或者合约之类的废话，我们要直捣黄龙，去联邦干预局最大的安乐窝。老子要看看到底是谁搞的我。",
        ["heist_xmn_hox_brief"] = "牙医为霍斯顿安排了一次重新审判，而我们可以在听证会结束之后的半路上把他救出来。计划听起来就很火爆：我们把法院的墙炸开，带上老霍撤退。$NL;$NL;»救出霍斯顿$NL;$NL;»将霍斯顿带上武装卡车$NL;$NL;»护送武装卡车前进$NL;$NL;»与霍斯顿一同撤离",

        ["heist_xmn_tag_name"] = "虎口夺食圣诞版",

        -- Rats Zipline
        ["menu_alex_1_zipline_desc"] = "用于快速运包的滑索",

        -- Watchdogs Holdout
        ["heist_skm_watchdogs_stage2_briefing"] = "劫持Mia Calienté是个真正的活，朋友。她已经在幕后主使黑水在特区的行动好几年了。就在不久之前，黑水接管了码头的一个仓库作为额外的分配点。我们的目标正在那里清点从船上刚掠夺不久的货。我们将突入这里，抓住这小崽子作为人质。黑水的人无法接受失去她，他们将会愿意去花钱赎人，没准在上述条件下我们还能要价更高，伙计们你们觉得呢？",
		
		--Side Jobs
		["menu_challenge_menu_challenge_moon_6_obj"] = "Complete the Slaughterhouse job on the OVERKILL difficulty or above without killing Captain Spring."
		
    })

    local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
    local difficulty_index = tweak_data:difficulty_to_index(difficulty)
    local job = Global.level_data and Global.level_data.level_id
    local captain_type = job and restoration.captain_spawns[job]
    local random_captain = math.rand(1)
	if captain_type == restoration.captain_types.winter and job == "crojob3" or job == "crojob3_night" then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "HAVE NO FEAR, CAPTAIN WINTERS IS HERE!!",
		})
    elseif captain_type == restoration.captain_types.winter then
        LocalizationManager:add_localized_strings({
            ["hud_assault_vip"] = "凛冬盾阵来袭"
        })
    elseif captain_type == restoration.captain_types.summer then
        LocalizationManager:add_localized_strings({
            ["hud_assault_vip"] = "夏日小队来袭"
        })
    elseif captain_type == restoration.captain_types.spring and difficulty_index <= 5 then
        LocalizationManager:add_localized_strings({
            ["hud_assault_vip"] = "春日队长来袭"
        })
    elseif captain_type == restoration.captain_types.spring then
        if random_captain < 0.05 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "勃勃生机，万物竞发！"
            })
        elseif random_captain < 0.1 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "春日行刑队来袭"
            })
        else
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "惊蛰战术攻坚小组来袭"
            })
        end
    elseif captain_type == restoration.captain_types.autumn and difficulty_index <= 5 then
        LocalizationManager:add_localized_strings({
            ["hud_assault_vip"] = "秋日队长来袭"
        })
    elseif captain_type == restoration.captain_types.autumn then
        if random_captain < 0.25 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "秋天悄然而至......"
            })
        elseif random_captain < 0.5 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "你感到后背一阵凉意......"
            })
        elseif random_captain < 0.75 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "阵阵袭来的寒意......"
            })
        else
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "秋风萧瑟，万物凋零"
            })
        end
    elseif captain_type == restoration.captain_types.hvh then
        if random_captain < 0.25 then
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "地狱呼唤着你......"
            })
        else
            LocalizationManager:add_localized_strings({
                ["hud_assault_vip"] = "直面你的噩梦......快醒来......"
            })
        end
    end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
    LocalizationManager:add_localized_strings({
        ["bm_sc_blank"] = "", -- assumedly this is a debug thing, but I'm not going to touch it--

        -- Menu Stuff--
        ["menu_hud_cheater"] = "",
        ["menu_inspect_player"] = "查看玩家",
        ["menu_inspect_player_desc"] = "查看玩家信息",
        ["menu_toggle_one_down_lobbies"] = "允许检索\"专家模式\"房间",

        ["heist_safehouse"] = "安全屋——基础",

        -- Events

        -- Anniversary Event
        ["menu_pda8_1_prog_obj_desc"] = "在珠宝店，四商店，夜总会，银行劫案和商场拆迁队当中找到并拾获2座不同的周年庆雕像。必须完成劫案后雕像才会计入统计。",
        ["menu_pda8_2_prog_obj_desc"] = "社区全体玩家共同使用喷钱枪累计喷射 $5,000,000,000 来贿赂（消灭）敌人，并且在珠宝店，四商店，夜总会，银行劫案和商场拆迁队当中找到并拾获3座不同的周年庆雕像。必须完成劫案后雕像才会计入统计。",
        ["menu_pda8_3_prog_obj_desc"] = "社区全体玩家共同使用喷钱枪累计喷射 $10,000,000,000 来贿赂（消灭）敌人，并且在珠宝店，四商店，夜总会，银行劫案和商场拆迁队当中找到并拾获4座不同的周年庆雕像。必须完成劫案后雕像才会计入统计。",
        ["menu_pda8_item_1_desc"] = "社区全体玩家共同使用喷钱枪累计喷射 $15,000,000,000 来贿赂（消灭）敌人，并且在珠宝店，四商店，夜总会，银行劫案和商场拆迁队当中找到并拾获5座不同的周年庆雕像。必须完成劫案后雕像才会计入统计",

        ["menu_pda8_2_prog_obj"] = "找到并拾获3座不同的周年庆雕像。",
        ["menu_pda8_3_prog_obj"] = "找到并拾获4座不同的周年庆雕像。",

        -- Holdout--
        ["menu_cn_skirmish"] = "遭遇战",
        ["menu_skirmish"] = "遭遇战——狭路相逢",
        ["menu_skirmish_random"] = "随机地点",
        ["menu_random_skirmish_subtitle"] = "随机作战地点\n\n无每周奖励，无初始难度因子",
        ["menu_weekly_skirmish"] = "指定地点",
        ["menu_weekly_skirmish_progress"] = "本波结束，可获取的总收益已提高",
        ["menu_skirmish_random_briefing"] = "在此选项中，你被放置到随机的遭遇战地图进行作战\n\n遭遇战将最多持续9波，难度将随波数增加而上升。\n\n每波结束都将使你获得极大的金钱和经验奖励，但失败会使你丢失所有已获得的奖励\n\n##一旦你或你的队友被逮捕入狱，你们将无法被换出来。##\n##当所有劫匪倒下或人质被救走时，遭遇战就会失败##",
        ["menu_weekly_skirmish_desc"] = "在此选项中，你被放置到指定的遭遇战地图进行作战\n\n遭遇战将最多持续9波，有额外的调节器，难度将随波数增加而上升。\n\n完成所有的波数会使你获得额外的每周奖励和更多的金钱\n\n##一旦你或你的队友被逮捕入狱，你们将无法被换出来。##\n##当所有劫匪倒下或人质被救走时，遭遇战就会失败##",
        ["menu_weekly_skirmish_tab_description"] = "行动描述",
        ["menu_weekly_skirmish_rewards"] = "完成的总波数 & 获得的奖励",
        ["hud_skirmish"] = "遭遇战",
        ["hud_weekly_skirmish"] = "每周遭遇战",
        ["heist_contact_skirmish"] = "遭遇战",
        ["menu_skirmish_pick_heist"] = "胡狼公司委托你完成这项任务",
        ["menu_skirmish_map_selection"] = "目标地点",
        ["menu_skirmish_selected_briefing"] = "在此选项中，你和你队友可以选择任何遭遇战地图进行作战\n\n遭遇战将最多持续9波，难度将随波数增加而上升。\n\n每波结束都将使你获得极大的金钱和经验奖励，但失败会使你丢失所有已获得的奖励\n\n一旦你或你的队友被逮捕入狱，你们将无法被换出来。\n当所有劫匪倒下或人质被救走时，遭遇战就会失败",
        ["menu_skirmish_selected"] = "遭遇战",

        -- Skirmish Heists--
        ["heist_skm_mallcrasher"] = "商城拆迁队",
        ["heist_skm_mallcrasher_h1"] = "商城拆迁队",
        ["heist_skm_arena"] = "Alesso音乐劫",
        ["heist_skm_arena_h1"] = "Alesso音乐劫",
        ["heist_skm_big2"] = "大银行",
        ["heist_skm_big2_h1"] = "大银行",
        ["heist_skm_watchdogs_stage2"] = "快艇装载",
        ["heist_skm_watchdogs_stage2_h1"] = "快艇装载",
        ["heist_skm_mus"] = "钻石魅影",
        ["heist_skm_mus_h1"] = "钻石魅影",
        ["heist_skm_run"] = "热火街头",
        ["heist_skm_run_h1"] = "热火街头",
        ["heist_skmc_fish_name"] = "游艇劫案",
        ["heist_skmc_ovengrill_name"] = "Ovengrill硬件公司",
        ["heist_skmc_mad_name"] = "DRAK R&D实验室",
        ["heist_skm_friend_name"] = "疤面庄园",
        ["heist_skm_nightmare_name"] = "安全屋梦魇",
        ["heist_skm_nightmare_lvl_name"] = "我们的安全屋？",

        -- Heist Breifings--
        ["heist_pines_briefing"] = "你们得赶紧过去，不过那地方根本没法着陆，所以你们得空降下去。找到坠机的飞行员————可能就在坠机地点附近————然后我们会派一架直升机过去接他。待在他身边保护他的安全，直到他被护送离开。此外，弗拉德还说飞机上装满了货物。在森林里找找，能拿多少拿多少，圣诞节总是要挣点零花钱的。\n\n胡狼的提示：\n坠机引起的爆炸引来了附近的收割者小队，他们贿赂了当地的治安部门，别指望着警察对此作出回应了。",
        -- The Bomb: Forest Breifing
        ["heist_crojob3_briefing"] = "一批温压炸弹今晨被装上列车并启运。其目的地为诺福克。在那里它们将会被出售或销毁——这无关紧要，它们注定无法抵达那儿。要想截停一辆行进中的列车，一般方式是行不通的。这时候，传统的西部方式就派上了用场——在列车经过时将一段铁路桥炸毁，然后整辆列车就会从桥上顺势滚下。虽然简单粗暴，但却不失为最有效的方式。爆炸产生的冲击波将会冲散车厢，同时也会把不该来的人招来。因此，行动要迅速。\n\n胡狼的提示：\n看样子阿肯也想就此事掺一脚，他贿赂了当地的治安部门，并派遣了一批收割者小队，别指望着警察来解决这件事了。",

        ----Custom Achievements----

        -- Scarface Mansion--
        ["skm_friend_name"] = "坚守模式：疤面庄园",
        ["friend_3"] = "来碰硬骨头",
        ["friend_3_desc"] = "从第1波开始，完成坚守模式疤面庄园的第3波。",
        ["friend_3_obj"] = "从第1波开始，完成坚守模式疤面庄园的第3波。",
        ["friend_5"] = "人质属于你",
        ["friend_5_desc"] = "从第1波开始，完成坚守模式疤面庄园的第5波。",
        ["friend_5_obj"] = "从第1波开始，完成坚守模式疤面庄园的第5波。",
        ["friend_7"] = "区区子弹焉能伤我？",
        ["friend_7_desc"] = "从第1波开始，完成坚守模式疤面庄园的第7波。",
        ["friend_7_obj"] = "从第1波开始，完成坚守模式疤面庄园的第7波。",
        ["friend_9"] = "看他们抱头鼠窜！",
        ["friend_9_desc"] = "从第1波开始，完成坚守模式疤面庄园的第9波。",
        ["friend_9_obj"] = "从第1波开始，完成坚守模式疤面庄园的第9波。",

        -- Safehouse Nightmare--
        ["skm_nightmare_name"] = "坚守模式：安全屋梦魇",
        ["nightmare_3"] = "我否认一切虚幻物",
        ["nightmare_3_desc"] = "从第1波开始，完成坚守模式安全屋梦魇的第3波。",
        ["nightmare_3_obj"] = "从第1波开始，完成坚守模式安全屋梦魇的第3波。",
        ["nightmare_5"] = "我置信龙诗与神话",
        ["nightmare_5_desc"] = "从第1波开始，完成坚守模式安全屋梦魇的第5波。",
        ["nightmare_5_obj"] = "从第1波开始，完成坚守模式安全屋梦魇的第5波。",
        ["nightmare_7"] = "我深信所思即所在",
        ["nightmare_7_desc"] = "从第1波开始，完成坚守模式安全屋梦魇的第7波。",
        ["nightmare_7_obj"] = "从第1波开始，完成坚守模式安全屋梦魇的第7波。",
        ["nightmare_9"] = "梦境噩梦，此刻谁言无妄？",
        ["nightmare_9_desc"] = "从第1波开始，完成坚守模式安全屋梦魇的第9波。",
        ["nightmare_9_obj"] = "从第1波开始，完成坚守模式安全屋梦魇的第9波。",

        ----Weapons + Mods Descriptions/names----

        -- Reinfield--
        ["bm_wp_r870_s_folding_ext"] = "折叠枪托(展开)",

        -- Bernetti--
        ["bm_wp_upg_i_93r"] = "Bernetti 93R改装套件",
        ["bm_wp_upg_i_93r_desc"] = "为武器增加射速为每分钟1100发的#{risk}#三连发速射模式##，以更高后坐力为代价换取更高输出。",

        -- 10-0
        ["bm_wp_upg_i_tekna"] = "Tekna速射改装套件",
        ["bm_wp_upg_i_tekna_desc"] = "锁定武器的射击模式为#{risk}#三连发速射模式##，也许与#{skill_color}#长戟##搭配更加？", -- ?

        -- AMR16--
        ["bm_wp_upg_i_m16a2"] = "AMR-16 A4型改装套件",
        ["bm_wp_upg_i_m16a2_desc"] = "A4型改装将使枪械的理论射速提高至每分钟950发，但相对应的，枪械只能使用半自动与#{risk}#三连发速射模式##。",

        -- Bernetti Auto--
        ["bm_wp_upg_i_b93o"] = "Bernetti OVERKILL改装套件",
        ["bm_wp_upg_i_b93o_desc"] = "在93R改装基础上增加了全自动射击模式，代价是后坐力的进一步增大。",

        -- 2006M Hailstorm
        ["bm_wp_upg_i_iw_hailstorm"] = "Hailstorm改装套件",
        ["bm_wp_upg_i_iw_hailstorm_desc"] = "一个由Fujiwara重工制造的原型武器套件。\n\n将该枪改装为特殊的三重堆叠弹药。",
        ["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "由Fujiwara重工打造的原型武器套件。\n\n将该武器改为装载特殊的#{risk}#三重堆叠##弹药以#{skill_color}#一枪连续射出三发子弹##但是#{important_1}#穿透护甲只能造成50%的伤害且不能穿盾##。",

        -- M200 WIDOWMAKER
        ["bm_wp_upg_i_iw_widowmaker"] = "Widowmaker改装套件",
        ["bm_wp_upg_i_iw_widowmaker_desc"] = "一个由Kendall兵工厂制造的原型武器套件。\n\n将该枪改装为特殊的#{risk}#双重堆叠##弹药以#{skill_color}#一枪连续射出两发子弹##。",

        -- M32 MK32 Kit
        ["bm_wp_upg_i_ghosts_mk32"] = "MK32改装套件",
        ["bm_wp_upg_i_ghosts_mk32_desc"] = "一个来自特遣部队：鬼魂的原型武器套件。\n\n启用并锁定武器为二连发速射模式。",

        -- Shotgun Generic Mods--
        ["bm_wp_ns_duck_desc_sc"] = "使弹丸散布面呈横向扩散，而非缩小散布。",
        ["bm_wp_ns_ultima_desc_sc"] = "增加75%的弹丸扩散。",
        ["bm_wp_upg_a_slug_sc"] = "独头弹",
        ["bm_wp_upg_a_slug_desc"] = "射出一发精准的弹头，可以#{skill_color}#穿透护甲、敌人、盾牌和薄墙壁##。\n对敌人的基础爆头倍率减少至#{important_1}#50%##。",
        ["bm_wp_upg_a_slug_spam_desc"] = "射出一发精准的弹头，可以#{skill_color}#穿透护甲、敌人和薄墙壁##，但穿透护甲时仅造成#{skill_color}#80%##的伤害。",
        ["bm_wp_upg_a_explosive_desc_sc"] = "射出一发能使人眩晕的爆炸半径为#{skill_color}#1.5米##的致命性爆炸弹头，#{skill_color}#不受任何衰减##，但也#{important_1}#不能触发爆头##。\n",
        ["bm_wp_upg_a_custom_desc"] = "发射更少量但更大号的共#{important_1}#6##发自制弹丸以牺牲#{important_1}#弹丸密度、有效射程、弹药量和捡弹量##来换取#{skill_color}#高伤害输出##。",
        ["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "发射一些用镁片制成的燃烧弹丸，可以#{skill_color}#烧穿敌人护甲##，并有最高#{skill_color}#15%##的概率#{heat_warm_color}#点燃敌人##，在#{skill_color}#2##秒内造成#{skill_color}#90##点伤害，并有几率晕眩敌人。\n#{risk}#点燃几率随距离增加而减小且只能点燃衰减末距内的敌人##。",
        ["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "发射一些用镁片制成的燃烧弹丸，可以#{skill_color}#烧穿敌人护甲##，并有最高#{skill_color}#40%##的概率#{heat_warm_color}#点燃敌人##，在#{skill_color}#2##秒内造成#{skill_color}#120##点伤害，并有几率晕眩敌人。\n#{risk}#点燃几率随距离增加而减小且只能点燃衰减末距内的敌人##。\n\n#{important_1}#任何攻击都不再被计为一般实弹的攻击##",
        ["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "发射一些用镁片制成的燃烧弹丸，可以#{skill_color}#烧穿敌人护甲##，并有最高#{skill_color}#60%##的概率#{heat_warm_color}#点燃敌人##，在#{skill_color}#2##秒内造成#{skill_color}#180##点伤害，并有几率晕眩敌人。\n#{risk}#点燃几率随距离增加而减小且只能点燃衰减末距内的敌人##。\n\n#{important_1}#任何攻击都不再被计为一般实弹的攻击##",
        ["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "发射一些用镁片制成的燃烧弹丸，可以#{skill_color}#烧穿敌人护甲##，并有最高#{skill_color}#80%##的概率#{heat_warm_color}#点燃敌人##，在#{skill_color}#2##秒内造成#{skill_color}#240##点伤害，并有几率晕眩敌人。\n#{risk}#点燃几率随距离增加而减小且只能点燃衰减末距内的敌人##。\n\n#{important_1}#任何攻击都不再被计为一般实弹的攻击##",
        ["bm_wp_upg_a_rip_auto_desc_sc"] = "发射一些#{stats_positive}#剧毒的##铅弹，在#{skill_color}#2##秒内造成#{stats_positive}#60##点伤害，并有几率眩晕敌人。\n\n#{risk}#毒弹的效果随距离减小##。",
        ["bm_wp_upg_a_rip_semi_desc_sc"] = "发射一些#{stats_positive}#剧毒的##铅弹，在#{skill_color}#4##秒内造成#{stats_positive}#120##点伤害，并有几率眩晕敌人。\n\n#{risk}#毒弹的效果随距离减小##。",
        ["bm_wp_upg_a_rip_pump_desc_sc"] = "发射一些#{stats_positive}#剧毒的##铅弹，在#{skill_color}#6##秒内造成#{stats_positive}#180##点伤害，并有几率眩晕敌人。\n\n#{risk}#毒弹的效果随距离减小##。",
        ["bm_wp_upg_a_rip_heavy_desc_sc"] = "发射一些#{stats_positive}#剧毒的##铅弹，在#{skill_color}#8##秒内造成#{stats_positive}#240##点伤害，并有几率眩晕敌人。\n\n#{risk}#毒弹的效果随距离减小##。",
        ["bm_wp_upg_a_rip"] = "墓石大铅弹",
        --[[
        ["bm_wp_upg_a_piercing_auto_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，#{skill_color}#8##秒内对敌人造成#{skill_color}#96##点流血伤害。",
        ["bm_wp_upg_a_piercing_semi_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，#{skill_color}#8##秒内对敌人造成#{skill_color}#120##点流血伤害。",
        ["bm_wp_upg_a_piercing_pump_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，#{skill_color}#8##秒内对敌人造成#{skill_color}#180##点流血伤害。",
        ["bm_wp_upg_a_piercing_heavy_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，#{skill_color}#8##秒内对敌人造成#{skill_color}#240##点流血伤害。",
        --]]
        ["bm_wp_upg_a_piercing_auto_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲。",
        ["bm_wp_upg_a_piercing_semi_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲。",
        ["bm_wp_upg_a_piercing_pump_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲。",
        ["bm_wp_upg_a_piercing_heavy_desc_sc"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲。",
        ["bm_wp_upg_a_piercing_auto_desc_per_pellet"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，爆头造成的伤害额外增加#{skill_color}#50%##且对敌人的基础爆头倍率没有减少。",
        ["bm_wp_upg_a_piercing_semi_desc_per_pellet"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，爆头造成的伤害额外增加#{skill_color}#50%##且对敌人的基础爆头倍率没有减少。",
        ["bm_wp_upg_a_piercing_pump_desc_per_pellet"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，爆头造成的伤害额外增加#{skill_color}#50%##且对敌人的基础爆头倍率没有减少。",
        ["bm_wp_upg_a_piercing_heavy_desc_per_pellet"] = "发射#{skill_color}#12##发箭形弹，可以击穿敌人护甲，爆头造成的伤害额外增加#{skill_color}#50%##且对敌人的基础爆头倍率没有减少。",

        -- Generic Mods--
        ["bm_wp_upg_vg_afg"] = "水平前握把",
        ["bm_wp_upg_vg_stubby"] = "短型垂直握把",
        ["bm_wp_upg_vg_tac"] = "TAC 战术前握把",

        ["fucktheatf"] = "That's a felon.", -- tra check

        ["bm_wp_upg_ns_ass_smg_stubby"] = "短粗枪火消除器",
        ["bm_wp_upg_flash_hider"] = "#{skill_color}#消除枪口火焰##并#{risk}#降低敌人在被你瞄准时进行躲避的概率##。",
        ["bm_wp_upg_suppressor"] = "使你的武器#{skill_color}#消音##并#{risk}#降低敌人在被你瞄准时进行躲避的概率##。",
        ["bm_wp_upg_suppressor_warn"] = "使你的武器#{skill_color}#消音##并#{risk}#降低敌人在被你瞄准时进行躲避的概率##。\n\n#{important_1}#可能会阻挡瞄具的视野##",

        ["bm_wp_upg_vintage_sc"] = "复古弹匣",
        ["bm_wp_upg_mil_sc"] = "军标弹匣",
        ["bm_wp_upg_tac_sc"] = "战术弹匣",

        ["bm_wp_upg_mil_desc"] = "", -- These didn't do anything when edited, maybe they aren't actually called?--
        ["bm_wp_upg_drum_desc"] = "",
        ["bm_wp_upg_drum2_desc"] = "",
        ["bm_wp_upg_quad_desc"] = "",
        ["bm_wp_upg_quad2_desc"] = "",
        ["bm_wp_upg_vintage_desc"] = "",

        -- Scorpion (get in-game-name later)--
        ["bm_wp_scorpion_m_extended_sc"] = "并联弹匣",
        ["bm_sc_scorpion_double_mag"] = "", -- Unsure what this one is?--

        -- RPK--
        ["bm_wp_rpk_m_ban_sc"] = "特制弹\"钾\"",

        -- Saw--
        ["bm_ap_saw_sc_desc"] = "#{skill_color}#破甲锯##。",
        ["bm_ap_saw_blade_sc_desc"] = "更锋利的锯片足以锯开敌人护甲。",
        ["bm_fast_motor_sc_desc"] = "增加 #{skill_color}#15%## 电锯转速。",
        ["bm_slow_motor_sc_desc"] = "#{important_1}#减少## #{skill_color}#15%## 电锯转速。",

        -- Weapon Sights--  not anymore?
        -- ["bm_wp_upg_o_leupold_desc_sc"] = "开镜时自动标记特殊敌人，潜入时则会标记警卫。", --I believe all sights/objects with this effect call this same line, rather than having a unique one. Will need to be decoupled later when we add zoom to all of the sight descriptions.

        -- Generic Optic Zoom Descriptions--
        ["bm_wp_upg_o_1_1"] = "反射式瞄具。\n#{risk}#1.1倍放大倍率##",
        ["bm_wp_upg_o_1_1_health"] = "此反射式瞄具能#{skill_color}#显示被瞄准的敌人的血量##。\n#{risk}#1.1倍放大倍率##",
        ["bm_wp_upg_o_1_2"] = "红点瞄准镜。\n#{risk}#1.2倍放大倍率##",
        ["bm_wp_upg_o_1_5"] = "全息瞄准镜。\n#{risk}#1.5倍放大倍率##",
        ["bm_wp_upg_o_1_5_pris"] = "棱镜瞄准具\n#{risk}#1.5倍放大倍率##",
        ["bm_wp_upg_o_1_5_scope"] = "低功率瞄准仪.\n#{risk}#1.5倍放大倍率##",
        ["bm_wp_upg_o_1_8"] = "红点瞄准镜。\n#{risk}#1.8倍放大倍率##",
        -- ["bm_wp_upg_o_1_8_irons"] = "带有次要铁瞄镜的红点瞄准具。\n#{risk}#1-1.8倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_2"] = "低功率瞄准仪。\n#{risk}#2倍放大倍率##",
        ["bm_wp_upg_o_3"] = "中距瞄准仪。\n#{risk}#3倍放大倍率##",
        ["bm_wp_upg_o_3_range"] = "内置#{skill_color}#测距仪##的中距瞄准器。\n#{risk}#3倍放大倍率##",
        ["bm_wp_upg_o_3_rds"] = "顶部装有反射次瞄具的中距瞄准仪。\n#{risk}#1.1-3倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_3_4"] = "中距瞄准仪。\n#{risk}#3.4倍放大倍率##",
        ["bm_wp_upg_o_3_5"] = "中距瞄准仪。\n#{risk}#3.5倍放大倍率##",
        ["bm_wp_upg_o_4"] = "中距瞄准仪。\n#{risk}#4倍放大倍率##",
        ["bm_wp_upg_o_4_cod"] = "中距瞄准仪。\n#{skill_color}#停止力##去哪儿？\n#{risk}#4倍放大倍率##",
        -- ["bm_wp_upg_o_4_default"] = "该武器的默认瞄镜。\n#{risk}#4倍放大倍率##\n\n#{item_stage_2}#这个瞄准镜不能被移除，但可以被其它瞄准镜替换##。",
        ["bm_wp_upg_o_4_range"] = "内置#{skill_color}#测距仪##的中距瞄准器。\n#{risk}#4倍放大倍率##",
        ["bm_wp_upg_o_4_irons"] = "带有次要铁瞄镜的红点瞄准具。\n#{risk}#1-4倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_4_rds"] = "带有整合型反射次瞄具的中距瞄准仪。\n#{risk}#1.1-4倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_4_rds_mount"] = "顶部装有反射次瞄具的中距瞄准仪。\n#{risk}#1.1-4倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_4_vari"] = "变焦瞄准镜。\n#{risk}#4-8倍放大倍率##\n\n瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和次要瞄具之间切换。",
        ["bm_wp_upg_o_5"] = "长距瞄准仪。\n#{risk}#5倍放大倍率##",
        ["bm_wp_upg_o_5_range"] = "内置#{skill_color}#测距仪##的长距瞄准器。\n#{risk}#5倍放大倍率##",
        ["bm_wp_upg_o_6"] = "长距瞄准仪。\n#{risk}#6倍放大倍率##",
        ["bm_wp_upg_o_6_range"] = "内置#{skill_color}#测距仪##的长距瞄准器。\n#{risk}#6倍放大倍率##",
        ["bm_wp_upg_o_8"] = "长距瞄准仪。\n#{risk}#8倍放大倍率##",
        ["bm_wp_upg_o_8_range"] = "内置#{skill_color}#测距仪##的长距瞄准器。\n#{risk}#8倍放大倍率##",

        ["bm_wp_upg_o_iwelo"] = "光明浮动十字瞄具。\n#{risk}#1.1倍放大倍率##",
        ["bm_wp_upg_o_iwrds"] = "精准红点瞄准镜。\n#{risk}#1.5倍放大倍率##",

        ["bm_wpn_fps_upg_o_hamr"] = "Trigonom SCRW瞄具", -- try Trigonom SCRW Scope

        ["bm_wp_upg_o_shortdot_dmc"] = "短点瞄具",
        ["bm_wp_upg_o_5_default"] = "长距瞄准仪。\n这就是默认的狙击镜，装备后可修改准星样式。\n#{skill_color}#5倍放大倍率##",

        ["bm_wp_upg_fl_flashlight"] = "按下#{skill_color}#$BTN_GADGET##以开关手电筒。",
        ["bm_wp_upg_fl_laser"] = "按下#{skill_color}#$BTN_GADGET##以开关镭射。",
        ["bm_wp_upg_fl_dual"] = "按下#{skill_color}#$BTN_GADGET##以在镭射和手电筒之间切换或开关它们。",
        ["bm_wp_upg_fl_vmp_marker"] = "瞄准时#{skill_color}#自动标记##距你#{skill_color}#40##米以内的保安和特殊敌人。\n\n#{risk}#提示：保安只能在潜入中被标记##。",
        ["bm_wp_upg_fl_second_sight_warning"] = "\n\n#{important_1}#装备次要瞄具后，你不能在瞄准时开关此附件。##",

        ["bm_wp_upg_o_angled_desc"] = "瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和斜角铁瞄之间切换。",
        ["bm_wp_upg_o_angled_1_1_desc"] = "瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和斜角反射瞄具之间切换。\n#{skill_color}#1.1倍放大倍率##",
        ["bm_wp_upg_o_angled_1_2_desc"] = "瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和斜角红点瞄具之间切换。\n#{skill_color}#1.2倍放大倍率##",
        ["bm_wp_upg_o_angled_laser_desc"] = "瞄准时按下 #{skill_color}#$BTN_GADGET## 在主瞄具和斜角激光瞄准之间切换。\n\n#{risk}#非常建议使用一个镭射配件##", -- VMP Point Shoot Laser

        ["bm_wp_upg_o_magnifier_desc"] = "瞄准时按下 #{skill_color}#$BTN_GADGET## 来升起/放下瞄具放大镜。\n#{risk}#3倍放大倍率##",

        -- 'Nade Launchers--
        ["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "受到撞击时释放半径为#{skill_color}#3.75米##的#{heat_warm_color}#火焰##，持续#{skill_color}#5##秒。火焰上的敌人每秒受到#{skill_color}#120##点伤害，且有几率被点燃。被点燃的敌人会陷入硬直并在#{skill_color}#3##秒内受到额外#{skill_color}#60##点伤害。",
        ["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "受到撞击时释放半径为#{skill_color}#3.75米##的#{heat_warm_color}#火焰##，持续#{skill_color}#5##秒。火焰上的敌人每秒受到#{skill_color}#80##点伤害，且有几率被点燃。被点燃的敌人会陷入硬直并在#{skill_color}#3##秒内受到额外#{skill_color}#60##点伤害。",
        ["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "受到撞击时释放半径为#{skill_color}#3.75米##的#{heat_warm_color}#火焰##，持续#{skill_color}#5##秒。火焰上的敌人每秒受到#{skill_color}#40##点伤害，且有几率被点燃。被点燃的敌人会陷入硬直并在#{skill_color}#3##秒内受到额外#{skill_color}#60##点伤害。",
        ["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "受到撞击时产生半径为5米的#{risk}#爆炸##，对敌人造成#{skill_color}#720##点伤害。",
        ["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "受到撞击时释放#{ghost_color}#高压电流##，爆炸半径#{skill_color}#5米##，电流会造成#{skill_color}#180##点伤害并有几率#{ghost_color}#电击敌人##。",
        ["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "受到撞击时释放#{ghost_color}#高压电流##，爆炸半径#{skill_color}#5米##，电流会造成#{skill_color}#360##点伤害并有几率#{ghost_color}#电击敌人##。",
        ["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "受到撞击时释放#{ghost_color}#高压电流##，爆炸半径#{skill_color}#2.5米##，电流会造成#{skill_color}#300##点伤害并有几率#{ghost_color}#电击敌人##。",
        ["bm_wp_upg_a_grenade_launcher_poison"] = "Manticore-6毒气弹",
        ["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "受到撞击时释放一团#{stats_positive}#有毒气体##，蔓延半径#{skill_color}#6米##，持续#{skill_color}#10##秒，#{skill_color}#8##秒内造成总计#{skill_color}#240##点伤害，并且会#{stats_positive}#硬直一次##大部分踏进去的敌人。",
        ["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "受到撞击时释放一团#{stats_positive}#有毒气体##，蔓延半径#{skill_color}#6米##，持续#{skill_color}#8##秒，#{skill_color}#8##秒内造成总计#{skill_color}#240##点伤害，并且会#{stats_positive}#硬直一次##大部分踏进去的敌人。",
        ["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "受到撞击时释放一团#{stats_positive}#有毒气体##，蔓延半径#{skill_color}#6米##，持续#{skill_color}#6##秒，#{skill_color}#4##秒内造成总计#{skill_color}#120##点伤害，并且会#{stats_positive}#硬直一次##大部分踏进去的敌人。",

        -- Flamethrowers--
        ["bm_wp_fla_mk2_mag_rare_sc"] = "稀有",
        ["bm_wp_fla_mk2_mag_rare_desc_sc"] = "燃烧时间#{skill_color}#翻倍##，燃烧持续伤害#{important_1}#减半##。",
        ["bm_wp_fla_mk2_mag_well_desc_sc"] = "燃烧时间#{important_1}#减半##，燃烧持续伤害#{skill_color}#翻倍##。",
        ["bm_ap_flamethrower_sc_desc"] = "五十度灰，二百度黑，三千度焦？\n喷火器可以#{skill_color}#烧穿敌人的护甲##但对熊的面甲和炮塔的装甲#{important_1}#收效甚微##。", -- used by both flamethrowers, decouple later?--
        ["bm_ap_money_sc_desc"] = "只需轻轻打开阀门，成千上万白花花的票子就喷涌而出。\n票子不光可以打通关节，也可以#{skill_color}#打穿护甲##。", -- used by both flamethrowers, decouple later?--

        -- LMGs/Miniguns--
        ["bm_wp_upg_a_halfthatkit"] = "巨无霸套餐", -- lol
        ["bm_wp_m134_body_upper_light"] = "轻量化枪身",
        ["bm_wp_upg_a_halfthatkit_desc"] = "装备此武器改装时移速惩罚增加10%。\n捡弹量增加20%。",
        ["bm_wp_upg_a_halfthatkit_tecci_desc"] = "装备此武器改装时移速惩罚增加25%\n捡弹量增加50%。",

        -- Phoenix .500--
        ["bm_wp_shatters_fury_desc"] = "一把.500超大号口径，同时拥有超强后坐力和停止力的左轮手枪，Shatter的最爱。\n可以#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",

        -- OICW--
        -- ["bm_w_osipr_desc_pc"] = "次世代高科技武器，配备20毫米空爆榴弹发射器。\n按下 $BTN_BIPOD 切换榴弹发射器。",
        -- ["bm_w_osipr_desc"] = "次世代高科技武器，配备20毫米空爆榴弹发射器。\n按住 $BTN_BIPOD 切换榴弹发射器。",

        -- socom deez nuts--
        -- ["bm_w_socom_desc"] = "Jackal的专属武器，经典.45 ACP口径与时尚设计的完美结合。",  

        -- Legendary Skins--
        ["bm_menu_sc_legendary_ak"] = "弗拉德的母国",
        ["bm_menu_sc_legendary_flamethrower"] = "龙之领主",
        ["bm_menu_sc_legendary_deagle"] = "生财之道",
        ["bm_menu_sc_legendary_m134"] = "半缺不残",
        ["bm_menu_sc_legendary_r870"] = "大巫师",
        ["bm_wskn_ak74_rodina_desc_sc"] = "无论是战争还是犯罪，这把特种AK都充满了对血的渴望。",
        ["bm_wskn_deagle_bling_desc_sc"] = "这把手工打造的工艺品手枪是所有游戏界的头号玩家梦寐以求的武器。",

        -- Exclusive Sets--
        ["bm_wp_upg_ultima_body_kit_desc_sc"] = "这个专有装置添加了一个独特的\"三重威胁\"镭射附件，与其它配件冲突。",
        ["bm_wp_upg_fmg9_conversion_desc_sc"] = "这个专有装置添加了一个高科技弹药计数器和一个镭射附件，与其它配件冲突。",

        -- Modifiers--
        ["bm_wp_upg_bonus_sc_none"] = "无增强",
        ["bm_wp_upg_bonus_sc_none_desc"] = "用于禁用皮肤的增强属性",

        -- Little Friend--
        -- ["bm_m203_weapon_sc_desc_pc"] = "按下 $BTN_BIPOD 切换到榴弹发射器。",
        -- ["bm_m203_weapon_sc_desc"] = "按住 $BTN_BIPOD 切换到榴弹发射器。",

        -- Gecko Pistol
        ["bm_tranq_maxim_sc_desc"] = "世界上第一把一体化消音手枪,其易操作性与高隐蔽性正适合打出镇静弹虚弱目标。\n\n这把枪使用#{skill_color}#镇静弹##在短时间内造成#{skill_color}#持续伤害##。",
        ["bm_tranq_x_maxim_sc_desc"] = "世界上第一把一体化消音手枪,其易操作性与高隐蔽性正适合打出镇静弹虚弱目标。\n\n这把枪使用#{skill_color}#镇静弹##在短时间内造成#{skill_color}#持续伤害##。",
        -- Igor (APS)
        ["bm_stech_sc_desc"] = "由于这款冲锋手枪相对更重，射速也更慢使其不幸失宠。它的笨重使其以隐蔽性为代价换来了更好的可控性。",
        ["bm_x_stech_sc_desc"] = "由于这款冲锋手枪相对更重，射速也更慢使其不幸失宠。它们的笨重使其以隐蔽性为代价换来了更好的可控性。",
        -- Chimano Compact
        ["bm_jowi_sc_desc"] = "一款为了极致的隐蔽性几乎牺牲了其余一切性能的芝加哥手枪。\n\n有传言道威克曾手持这把枪向俄罗斯黑帮寻仇。",
        ["bm_x_jowi_sc_desc"] = "既然都这么小只了，为什么不干脆双持呢？虽然双持是种致敬威克个人偏好的错误选择。",
        -- Glock 18c
        ["bm_g18c_sc_desc"] = "全自动澳洲滋水枪。虽然难于操控，但在近距离作战极具杀伤力。",
        ["bm_x_g18c_sc_desc"] = "单持火力爽，双持火葬场。小心后坐力！",
        -- CZ 75
        ["bm_czech_sc_desc"] = "曾被誉为“奇迹之九”，一种有着优秀的人体工程学设计与良好手感的手枪。广泛应用于世界各大反恐组织。",
        ["bm_x_czech_sc_desc"] = "又一个劝退冲锋手枪的例子。你怎么可能轻松给这俩玩意换弹？",
        -- PPK (Gruber)
        ["bm_ppk_sc_desc"] = "更大，更危险的袖珍武器替代品，经典武器，经典用法。",
        ["bm_x_ppk_sc_desc"] = "如果你想比特工看起来更像个绅士就用它。",
        -- M13
        ["bm_legacy_sc_desc"] = "西德人的设计最终被Bernetti否决，但在一场战斗中，它仍能发挥出自己的力量。",
        ["bm_x_legacy_sc_desc"] = "两支被历史遗忘的手枪，将使你所及之屋留遍子弹。",
        -- Glock 17
        ["bm_g17_sc_desc"] = "拥有易于掌控的后坐力且十分可靠。是能助你踏上劫匪生涯的完美配枪。",
        ["bm_x_g17_sc_desc"] = "以绝对的数量来弥补9毫米的弱小火力，并且依然占有低后坐力的优势\n\n在我们捞霍斯顿出来那段时间里是他的爱枪。",
        -- Bernetti 9
        ["bm_b92fs_sc_desc"] = "一款因其弹容出色且伤害像样而流行的武器。尤其在与众多敌人对峙时十分便利。",
        ["bm_x_b92fs_sc_desc"] = "两把总比一把强。以一种不同的方式将战斗化为9毫米手枪的派对。",
        -- White Streak
        ["bm_pl14_sc_desc"] = "使用西方后苏联技术的现代俄罗斯手枪。\n因其可靠性和未来风格而深受收割者的欢迎。",
        ["bm_x_pl14_sc_desc"] = "使用西方后苏联技术的现代俄罗斯手枪。\n因其可靠性和未来风格而深受收割者的欢迎。",
        -- Holt 9mm
        ["bm_holt_sc_desc"] = "一款陷入研发困境中的原型枪，采用了创新设计，有助于减少后坐力。",
        ["bm_x_holt_sc_desc"] = "不是一个，而是两个被遗忘的艺术品组成的原型枪。",
        -- FMG-9
        ["bm_fmg9_sc_desc"] = "可作为STRYK-18c的载体的武器平台，采用未来折叠技术的原型枪。",
        -- 93R
        ["bm_beer_sc_desc"] = "一块临界于幻想之间的爆发速射武器，使得它的子弹们争先恐后地从枪口里爬出来去寻找它们的目标。是死是活，你我来定。",
        ["bm_beer_auto_desc"] = "一块临界于幻想之间的全自动武器，使得它的子弹们争先恐后地从枪口里爬出来去寻找它们的目标。是死是活，你我来定。",
        -- Contractor Pistols 
        ["bm_packrat_sc_desc"] = "威克之所以选择它，是因为它的可靠性和综合易用性，据说他在他位临红圈时使用的就是这把枪。",
        ["bm_x_packrat_sc_desc"] = "当你想用血腥和复仇来净空俄罗斯人拥有的夜总会时，就带上它吧。",
        -- Breech (Luger) 
        ["bm_breech_sc_desc"] = "几乎两次主宰世界的手枪。这把德国工艺品优雅、精致，遗憾的是过时了。",
        -- Chimano Custom
        ["bm_g22c_sc_desc"] = "在最好的战术手枪中，这把武器是高容量和高威力的代名词。",
        ["bm_x_g22c_sc_desc"] = "如果一张选票是免费的枪支，那么当你能得到两把这样的便携式防身武器时，投票欺诈似乎很有吸引力.",
        -- Baby Deagle
        ["bm_sparrow_sc_desc"] = "\n后会有期，星际牛仔......",
        ["bm_w_sparrow_sc_g_cowboy_desc"] = "\n“#{heat_warm_color}#欲擎此枪必承其重##”",
        -- Signature .40
        ["bm_p226_sc_desc"] = "无论是截停武装押运还是银行抢劫，这个经典的警察杀手都永远不会让人失望。",
        -- LEO
        ["bm_hs2000_sc_desc"] = "国际刑警组织特工、狡猾的克罗地亚警察和国际犯罪分子都发现这种袖珍爆破手十分有效。",
        -- 5/7 pistol
        ["bm_lemming_sc_desc"] = "高威力与大容量的结合。如果有人能吃了20枪没事，你可能不应该向他射击。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#33%##的伤害。",
        -- socom deez nuts--
        ["bm_w_socom_desc"] = "豺狼的配枪选择。一款设计新潮，使用.45ACP子弹的可靠、强力的手枪。",
        -- Crosskill
        ["bm_w_colt_1911"] = "Crosskill II 干员手枪", -- Springfield Armory 1911 Operator  --checkout
        -- Crosskill Chunky
        ["bm_w_m1911"] = "Crosskill A1手枪",
        -- Crosskill Guard
        ["bm_shrew_sc_desc"] = "比它的经典铝制小侄子更小更紧凑。用弹夹容量和枪管长度换来了进一步的隐蔽能力。",
        ["bm_x_shrew_sc_desc"] = "迦南人的处事方式，极小枪身双持的.45麻烦解决者定叫那入侵者抱头鼠窜。",
        ["bm_shrew_g_bling_sc_desc"] = "在充满苦难与动荡的世界里，使我无比宽慰的是，黑暗里终有一线光明。",
        -- USP 
        ["bm_usp_sc_desc"] = "S&G中表现超乎寻常的一种枪，专长在于其伤害，弹容和射程。",
        ["bm_x_usp_sc_desc"] = "一对S&G手枪正适用于你实在需要发表死亡宣告的时候。",
        -- 1911 
        ["bm_1911_sc_desc"] = "当9mm子弹不够用时，去取得这把装着强力.45ACP子弹的1911A1吧。顶级暴力架子。",
        ["bm_x_1911_sc_desc"] = "即便它没有恶魔之力，它带来的大屠杀一样能使得天下哀嚎遍野。",
        -- Model 54 
        ["bm_type54_sc_desc"] = "苏联设计Tokarev的中国复制款，以独特的下挂霰弹枪为特征来给出解决坏蛋的额外手段。",
        ["bm_x_type54_sc_desc"] = "双拳难敌？四管相迎！",
        -- Broomstick--
        ["bm_c96_sc_desc"] = "\"#{heat_warm_color}#……然后狼吃掉了小红帽##\"\n\n具有革命性的德国手枪，尤其这一款被改装成了全自动开火模式。\n\n这把枪一次装填#{skill_color}#10##颗子弹。",
        ["bm_wp_c96_nozzle"] = "DL-44爆能枪口", -- Suppressor into Muzzle --checkout
        ["bm_wp_c96_nozzle_desc_sc"] = "来自遥远银河的科技将这把枪转化为发射等离子光束以及使用充能弹夹。\n\n充能冷却: #{item_stage_2}#2##秒\n充能速率: #{skill_color}#3##发/秒 (过热时减半)\n过热惩罚: #{item_stage_2}#2##秒",
        -- Sub2000
        ["bm_sub2000_sc_desc"] = "制造质量存疑的卡宾手枪。小巧的手枪子弹从长枪管射出时打身上加倍的疼，并且折叠能力使其隐蔽性首屈一指。",
        -- Deagle
        ["bm_deagle_sc_desc"] = "还有什么拿着这个半自动法杖需要说的吗？只需要挥向坏蛋们大喊：\"崩！沙卡拉卡！\"\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        ["bm_x_deagle_sc_desc"] = "实实在在地把这双持手腕毁灭者带进战场的人是十足的疯子。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        -- Matever 2006m
        ["bm_2006m_sc_desc"] = "小批生产的稀少设计型。一种射程内花式打出.38子弹的方式。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        ["bm_x_2006m_sc_desc"] = "双持这俩枪体现的纯正坏蛋因子要远远超过为了双持要做的准备工作。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        -- Frenchman Model 87
        ["bm_model3_sc_desc"] = "对于一个终身问题的经典答案：\"我要怎么对付这些跳脸的混球？\"\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        ["bm_x_model3_sc_desc"] = "引出你内心深处的牛仔品质并拿这两把左轮在午夜向条子发起决斗挑战。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        -- Raging bull
        ["bm_rage_sc_desc"] = "威力十足的短距离手炮。\n对面排排站，嘎嘎吃子弹。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        ["bm_x_rage_sc_desc"] = "既不好用也不实用，但你就是忍不住想在抢银行的时候掏这俩枪出来干条子。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        -- Castigo
        ["bm_chinchilla_sc_desc"] = "强大，精准，有型。便于突破特区里更持久的敌人。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        ["bm_x_chinchilla_sc_desc"] = "一个刺客需要确保它的目标能够毙命，两把这枪能够保证这点。\n\n可#{skill_color}#穿透护甲和敌人##造成#{skill_color}#50%##的伤害。",
        -- RUS-12
        ["bm_rsh12_sc_desc"] = "单持口径口水战中毋庸置疑的终结语。\n\"汝等舌战可休矣！\"\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- Chunky 1911 
        ["bm_m1911_sc_desc"] = "Crosskill.45的经典重制版。尽管挂着这个名字，并没有比自定义款的枪更厚实。",
        -- FMG-9
        ["bm_w_fmg9"] = "Wasp-DS自动手枪",
        -- Sub 2000
        ["bm_w_sub2000"] = "龋齿10mm手枪口径卡宾枪",
        -- SAA/Peacemaker
        ["bm_ap_weapon_peacemaker_sc_desc"] = "史上最伟大的手枪之一。\n辅助开火可以通过快速煽动击锤以#{important_1}#更高的后坐力、更低的有效射程和无法机瞄##为代价#{skill_color}#提高射速##进行速射。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- CUSTOM HANDGUNS
        -- Browning Hi-Power
        ["bm_w_hpb"] = "VF大威力手枪",
        -- Walther P99
        ["bm_w_p99"] = "Gruber 988手枪",
        -- Derringer
        ["bm_w_derringer"] = "Derringer手枪",
        -- Automag .44
        ["bm_w_amt"] = "Automag.44手枪",
        -- Colt Detective
        ["bm_w_coltds"] = "Crosskill Investigator左轮手枪",
        ["bm_lemon_dmc_desc"] = "假如你有一把隐蔽的高威力左轮。现在不用假如了，调查员左轮如你所想。\n\n从背后攻击敌人造成2倍伤害。",

        -- M6D
        ["kfa_scope"] = "KFA-2 智联瞄具",
        ["kfa_scope_desc"] = "使你能够对接面具和装配的#{skill_color}#智联##瞄具。\n#{risk}#2x放大倍率。##",
        -- SIG P320
        -- ["bm_w_papa320"] = "M19", --not sure what it is
        ["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "32发装弹匣", -- tra

        -- Kobus 90--
        ["bm_w_p90"] = "Project-90冲锋枪",
        ["bm_p90_sc_desc"] = "又称斗牛犬冲锋枪，同时是SpecOps-7冲锋枪的竞争对手，由于外形经常被评价为未来感十足的空间枪。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#33%##的伤害。",
        ["bm_wp_p90_body_p90_tan"] = "棕褐枪身",
        ["bm_wp_90_body_boxy"] = "OMNIA突击框架",
        ["bm_wp_90_body_boxy_desc"] = "从一个老旧的OMNIA仓库废址里找回的，这个框架无论对性能还是手感都没有影响，不过它体现的块状美使得它适合被拥有。",
        -- Spec Ops
        ["bm_w_mp7"] = "SpecOps-7冲锋枪",
        ["bm_mp7_sc_desc"] = "一款轻型冲锋枪，同时是Project-90冲锋枪的竞争对手。并不像某些人期待的那样具备下挂榴弹。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#33%##的伤害。",
        -- Compact-5/MP5
        ["bm_w_mp5"] = "Compact-5冲锋枪",
        ["bm_mp5_sc_desc"] = "Gewehr-3的小妹妹。\n射击快速，精准同时操控简单，你还指望冲锋枪能比这更好吗？",
        -- Pachett/Sterling
        ["bm_wp_sterling_b_e11"] = "爆能E-11枪管",
        ["bm_wp_sterling_b_e11_desc_sc"] = "来自遥远银河的科技将这把枪转化为发射等离子光束以及使用充能弹夹。\n\n充能冷却: #{item_stage_2}#1.4##秒\n充能速率: #{skill_color}#6##发/秒 (过热时减半)\n过热惩罚: #{item_stage_2}#2##秒",
        -- Uzi
        ["bm_uzi_sc_desc"] = "慢下来开火的时候，Uzi是一款可靠，操控简单的冲锋枪，使得它依然能拿来碰一碰，尤其是能将它转变为.41 AE时。",
        -- Heather
        ["bm_sr2_sc_desc"] = "使用一种专门的9×21mm子弹，Heather冲锋枪是俄罗斯对Project-90冲锋枪和SpecOps-7冲锋枪的回应。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#50%##的伤害。",
        -- Chicago Typewriter
        ["bm_thompson_sc_desc"] = "堂堂正正大弹鼓，即便是你也能撂倒敌人时一展雄风。",
        -- MP40
        ["bm_erma_sc_desc"] = "一把在二战期间广泛应用于步兵的相当可靠的冲锋枪，别把弹夹当握把咯。",

        -- CUSTOM SMGs
        -- AR57
        ["bm_w_alpha57_prim"] = "FSS飓风冲锋枪",
        ["bm_w_alpha57_prim_desc"] = "FSS飓风以有效射程和停止力的牺牲为代价换取了高强的弹容量和稳定性。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#33%##的伤害。",
        -- LWRC
        ["bm_w_smg45"] = "FT Striker .45冲锋枪",
        ["bm_w_smg45_desc"] = "\"Jackal\" AMP-45冲锋枪的美式复制品。",
        -- Typhoon
        ["bm_w_crysis3_typhoon"] = "CRYNET Typhoon 冲锋枪",
        ["bm_w_crysis3_typhoon_desc"] = "\"#{heat_warm_color}#至简至纯，思言万千。##\"\n\n运用#{risk}#枪管叠载##技术，这个十管冲锋枪以伤害为代价换取了惊人的速度倾泻子弹。\n\n辅助射击以进入#{skill_color}#齐射模式##一次发射#{skill_color}#10##发子弹。",

        -- AA12
        ["bm_aa12_sc_desc"] = "全自动弹鼓供弹霰弹枪。适合给人留下持久印象。",
        -- Saiga
        ["bm_saiga_sc_desc"] = "这把全自动霰弹枪正适合你懒得去瞄准的时候用。",
        -- Spas12
        ["bm_spas12_sc_desc"] = "更重且更复杂的另类半自动霰弹枪，具有一种几乎异类的射击模式。",
        -- Benelli
        ["bm_benelli_sc_desc"] = "顶级战术霰弹枪。适合用来清理人堆。",
        -- Argos III
        ["bm_ultima_sc_desc"] = "没有什么更能比铝和塑料更能表达现代的，这枪甚至有个给你手机充电的USB口。\n\n一次装填#{skill_color}#2##发子弹。",
        -- Loco
        ["bm_serbu_sc_desc"] = "缩小后的售后市场版Reinfeld-880；给那些想要隐蔽性和渴望搞残手腕的人。",
        -- Reinfeld 88
        ["bm_w_m1897"] = "Repeater 1897霰弹枪",
        ["bm_menu_sc_m1897_desc"] = "这件标志性的历史名枪见证了太平洋岛屿上从泥沟到茂密丛林的几乎一切战斗，也因其火力汹涌而久誉恶名。",--\n\n辅助射击允许快速连点以用#{skill_color}#更快的射速##进行速射，代价是#{important_1}#后坐力和子弹散射更大##并且#{important_1}#无法右键瞄准##。",
        -- Mosconi 12g
        ["bm_menu_sc_m590_desc"] = "老式经典升级款。是敢死队，士兵们，公民以及银行劫匪这类人好选择。",
        -- R870
        ["bm_menu_sc_r870_desc"] = "法律与自由的有力手。此刻自由就是以你为名的霰弹枪和弹丸。",
        -- KSG
        ["bm_menu_sc_ksg_desc"] = "未来全都是塑料做的！做工别有用心的无托霰弹枪，一款LWI特产。",
        -- Supernova
        ["bm_supernova_sc_desc"] = "一款被改造成能在泵动和半自动之间切换的霰弹枪。",
        -- Breaker 10g
        ["bm_menu_sc_boot"] = "Breaker 10g霰弹枪",
        ["bm_menu_sc_boot_desc"] = "一款古董霰弹枪用着强到夸张的10号铅弹以及更强大的坏蛋因子。想活命就跟我走。",
        -- Mosconi
        ["bm_menu_sc_huntsman_desc"] = "双重枪管，双倍快乐。即便弹夹尺寸受限，双板机的设计也能让你对同一屋的倒霉蛋施放毁灭铅弹打击。",
        -- Akimbo Judge
        ["bm_x_judge_sc_desc"] = "判官和陪审团，再有这两把便携的清场工具，你就是刽子手。",
        -- Joceline
        ["bm_b682_sc_desc"] = "通常是一种用在运动场合的竞技性上下排列式双管霰弹枪，除非你不是拿来射爆飞盘而是拿来射爆头盔。",
        -- Custom Shotguns
        -- Doomstick
        ["bm_w_quadbarrel"] = "Doomstick霰弹枪",
        ["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "适合近距离的弹种。\n单发弹丸数量提升至10颗。",
        ["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "适合中距离的弹种。\n单发弹丸数量降低至6颗。",
        ["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "强力的钢弹头，长距离作战十分有效\n能够穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁。",
        -- MP153
        ["bm_w_mp153"] = "Argos I 霰弹枪",
        -- Widowmaker TX
        ["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "加大弹匣",
        ["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "爆炸开火系统",
        ["bm_wp_wpn_fps_upg_wmtx_gastube_burst_desc"] = "为武器添加##{skill_color}#2连发速射##开火模式。",

        -- S552
        ["bm_s552_sc_desc"] = "相较其他紧凑型5.56mm步枪更优雅的变种，是国土安全局的多数选择。使用瑞士特制5.6mm子弹以提供更佳的射程。",
        -- M733/AMCAR
        ["bm_amcar_sc_desc"] = "世界上量产最多的.223步枪。良好的全用途步枪。",
        -- G36
        ["bm_g36_sc_desc"] = "“最佳塑料制步枪奖”的又一竞争选手。",
        -- VHS/Lion's Roar
        ["bm_vhs_sc_desc"] = "宣称在适合的人手上表现优异，因而难于操控。\n\n据说在战斗中寄宿着龙吼的力量。",
        -- Olympic/Para
        ["bm_w_olympic"] = "Para-23步枪",
        ["bm_menu_sc_olympic_desc"] = "大到离谱以至于以全自动方式射出步枪弹的手枪。这把枪因其打子弹方式这点存在生存危机。",
        -- TAR-21/Para
        ["bm_menu_sc_komodo_desc"] = "极其紧凑的包装充满杀伤力。适用于CQB或者远距离冲突。",
        -- Famas
        ["bm_menu_sc_famas_desc"] = "这把武器牺牲了弹容量换来了射速和精准度的提升。是个射掉人脑袋上的苹果的趁手工具。",
        -- Custom 40 damage ARs
        -- ["bm_w_xeno"] = "MA14 Surge Rifle",  
        ["bm_xeno_sc_desc_pc"] = "从\"Armat\"变为了具备异常先进的科技的奇怪玩意。配备有下挂榴弹发射器。\n\n按下 $BTN_BIPOD 切换到榴弹发射器。",
        ["bm_xeno_sc_desc"] = "从\"Armat\"变为了具备异常先进的科技的奇怪玩意。配备有下挂榴弹发射器\n\n按住 $BTN_BIPOD 切换到榴弹发射器。",
        -- VSS
        ["bm_w_vss"] = "Viktoriya步枪",
        ["bm_vss_sc_desc"] = "Valkyria枪系的变体，拥有更好的射程和精准度。\n\n#{skill_color}#完全消音##并且#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",

        -- OICW--
        ["bm_w_osipr_desc_pc"] = "X-世代武器科技。配备有20mm空爆榴弹发射器。\n按下 $BTN_BIPOD 切换到榴弹发射器。",
        ["bm_w_osipr_desc"] = "X-世代武器科技。配备有20mm空爆榴弹发射器。\n按住 $BTN_BIPOD 切换到榴弹发射器。",
        -- M4/CAR-4
        ["bm_m4_sc_desc"] = "可靠，紧凑，致命。由AMCAR发展而来，拥有更可控的火力。在现代部队中流行的5.56mm步枪。",
        ["bm_wp_upg_fg_m4a1"] = "Em-Four套件",
        ["bm_wp_upg_fg_m4a1_desc"] = "这个专用配置调掉了市面上的折叠瞄具，换成了更传统的设置。覆盖护木外观。",
        ["bm_wp_upg_s_fixed"] = "CAR 固定枪托",
        -- AK5
        ["bm_ak5_sc_desc"] = "因各大银行劫案和有关它的子弹尺寸这点迷惑了那些不了解的人而出名的全用途步枪。",
        ["fnc_burst_desc"] = "添加#{skill_color}#三连发速射模式##。",
        -- Union 5.56
        ["bm_corgi_sc_desc"] = "尽管声名远扬，这把小无托也不适合远航。",
        -- UAR
        ["bm_w_aug"] = "UAR A2步枪",
        ["bm_aug_sc_desc"] = "经典无托式步枪。非常适合用来打坏蛋。",
        ["bm_wp_upg_b_hbar"] = "重型枪管",
        -- AK17
        ["bm_flint_sc_desc"] = "经典AK的现代理解版。因其强力的二连发速射模式一度被怀疑其ak身份。",
        -- AK 5.45
        ["bm_w_ak74"] = "AK 5.45步枪",
        ["bm_ak74_sc_desc"] = "和它那些打7.62子弹的集美不同，这把枪在致命性上毫不逊色。",
        -- CR 805
        ["bm_menu_sc_hajk_desc"] = "经典眼镜蛇枪管的枪中更年轻，现代化的小侄子。这一款有着更多开火模式，甚至有更多弹种选择……可没说你能得到这些。",
        -- CUSTOM 48 DAMAGE ARs
        -- AN-94/92
        ["bm_w_tilt"] = "KVK-99步枪",
        ["bm_tilt_sc_desc"] = "扣板机打出的前两发子弹是三倍射速。",
        -- HK G36
        ["bm_w_hkg36"] = "SG36K步枪",

        -- AMR-16
        ["bm_m16_sc_desc"] = "作为AMCAR前身的经典步枪。通过更强的火力弥补其隐蔽和距离上的不足。",
        -- AK 7.62
        ["bm_w_akm"] = "AK 7.62步枪",
        ["bm_akm_sc_desc"] = "当防弹衣在特区开始逐渐流行时，这把枪将是个随身携带的好东西。\n\n是世界各地叛军和疯狂政府的首选。",
        ["bm_w_akm_gold"] = "黄金AK 7.62步枪",
        ["bm_akm_gold_sc_desc"] = "什么是劫匪，墨西哥毒枭和自大的独裁者的共同点呢？当然是对镀金ak的迷恋。\n\n真金制作，价格不菲，收藏佳品。 ",
        -- Queen's Wrath
        ["bm_l85a2_sc_desc"] = "即便这枪晚节不保，这把枪依然以其精准度在所有自动步枪中脱颖而出。\n\n依旧是人体工程学噩梦。",
        -- KETCHUPKNOB--
        -- ASPIRING POKEMON TRAINER, ASH KETCHNOV--
        ["bm_w_groza"] = "OB-14st Byk-1 步枪", -- Hopefully less silly than its Ketchup name
        -- "OB-14st" being an awful combo of "Oblast" (a word for region/zone/area, as well as literally having BLAST in the name) and the "14" in "OTs-14"
        -- Although, a Russian word for "region/zone/area" followed up with a Polish word...
        -- Eh, whatever
        ["bm_groza_sc_desc_pc"] = "AK家族的无托小妹，专为那些想搞大动静的人配备。\n\n按下#{skill_color}#$BTN_BIPOD##切换到下挂榴弹发射器。",
        ["bm_groza_sc_desc"] = "AK家族的无托小妹，专为那些想搞大动静的人配备。\n\n按住#{skill_color}#$BTN_BIPOD##切换到下挂榴弹发射器。",
        -- CHIKUBI
        ["bm_w_tkb"] = "Rodion 3B步枪",
        ["bm_wp_tkb_m_bakelite"] = "西伯利亚款15x3弹匣",
        -- Krinkov
        ["bm_akmsu_sc_desc"] = "专门撂倒大个的小不点。无论什么方案都固执己见使这把枪不可被低估。",
        -- Akimbo Krinkov
        ["bm_w_x_akmsu"] = "双持Krinkov步枪",
        ["bm_x_akmsu_sc_desc"] = "专门撂倒大个的小不点。无论什么方案都固执己见使这把枪不可被低估。",
        -- CUSTOM 60 DAMAGE ARs
        -- SCAR-L
        ["bm_w_scarl"] = "Eagle步枪",
        -- Valmet Rk.62
        ["bm_w_rk62"] = "Velmer步枪",
        -- NV4
        ["bm_nova4_sc_desc"] = "一款全自动步枪。中等射速增加了稳定来提供一流的精准。适合中长距离打击。",
        ["bm_wp_wpn_fps_ass_nova4_flatline_desc"] = "获得以下加成：\n#{heat_warm_color}#精确##：\n#{skill_color}#无伤害衰减##但#{important_1}#降低射速##。\n#{item_stage_2}#专注##：\n#{skill_color}#提高##精准度。",
        ["bm_wp_wpn_fps_ass_nova4_chaos_desc"] = "获得以下加成：\n#{heat_warm_color}#迅捷##：\n#{skill_color}#提高腰射射速##但#{important_1}#降低瞄准射速##。\n#{item_stage_2}#稳固##：\n#{skill_color}#提高##腰射精准度。",

        -- VMP Honey Badger
        -- ["bm_w_bdgr_desc"] = "",
        -- MW22 Honey Badger
        ["bm_w_mcbravo"] = "Chimera", -- tra
        ["bm_w_mcbravo_desc"] = "With an #{skill_color}#integrated suppressor## and slow, high-energy subsonic #{risk}#.300 BLK## rounds, the Chimera is adept at close-quarters combat.",
        -- AR-18
        ["bm_w_ar18"] = "CAR-18",

        -- Bootleg/HK416c
        ["bm_w_tecci"] = "Bootleg轻机枪",
        ["bm_w_tecci_desc_sc"] = "一款活塞操作被指出像步枪的轻机枪，能相对精准地倾泻子弹。",
        -- KSP/M249
        ["bm_w_m249"] = "KSP-90轻机枪",
        ["bm_m249_sc_desc"] = "换弹十分蛋疼，但只要在换弹前把人杀干净就好了。",
        -- ChainSAW
        ["bm_w_kacchainsaw"] = "Campbell 74轻机枪",
        ["bm_kacchainsaw_sc_desc"] = "驭魂于枪，漫游疯狂。\n\n#{skill_color}#这把武器的腰射比一般武器表现更好：\n精准+##", -- tra chack 腰射散布更小
        ["bm_wp_upg_i_kacchainsaw_adverse"] = "有害气体系统组件",
        -- RPK
        ["bm_rpk_sc_desc"] = "这把枪是你想要枪管既达标又更显苏系的好选择。",

        -- Brenner 21/HK21
        ["bm_w_hk21"] = "Brenner-21重机枪",
        ["bm_hk21_sc_desc"] = "Gewehr-3家族的大妹。更高的射速带来了更大的压制力。",
        -- M60
        ["bm_w_m60"] = "M60重机枪",
        ["bm_m60_sc_desc"] = "因为对子弹十分饥渴并且极其笨重，所以有个绰号'小猪'。期待任何顺向子弹的人都会变成一口封闭的棺材。\n\n#{skill_color}#这把武器的腰射比一般武器表现更好：\n精准+##",
        -- Ksp 58
        ["bm_w_par"] = "KSP-58B重机枪",
        ["bm_par_sc_desc"] = "相对KSP-90更重，通常架设在载具上的机枪弟妹。用机动性换来了更大的口径。",

        ["bm_hk51b_sc_desc"] = "Aftermarket conversion of the Brenner-21, shrinking this MG down to Compact-5 sizes and increasing its rate of fire even further.",  --tra
        
        -- Buzzsaw/Mg42
        ["bm_w_mg42"] = "Buzzsaw-42重机枪",
        ["bm_wolf_brigade_sc_desc"] = "#{heat_warm_color}#我们不是人模狗样，\n我们是人中之狼。##\n\n#{skill_color}#这把武器的腰射比一般武器表现更好：\n精准+\n稳定+##",
        ["bm_wp_mg42_b_vg38"] = "爆能科技 DLT-19抑制器", -- Suppressed Barrel into Barrel  --checkout
        ["bm_wp_mg42_b_vg38_desc_sc"] = "来自遥远银河的科技将这把枪转化为发射等离子光束以及使用充能弹夹。\n\n充能冷却: #{item_stage_2}#3##秒\n充能速率: #{skill_color}#9##发/秒 (过热时减半)\n过热惩罚: #{item_stage_2}#4##秒",
        -- ["bm_wp_mg42_b_mg34_desc_sc"] = "将你的理论射速降至每分钟#{skill_color}#800##发",
        -- Versteckt-51/HK51B
        ["bm_w_hk51b"] = "Versteckt-51B重机枪",
        ["bm_hk51b_sc_desc"] = "Brenner-21的售后版本，这把机枪缩小到了Compact-5的大小并且拥有更快的射速。",

        -- M134
        ["bm_m134_sc_desc"] = "\"#{heat_warm_color}#你走的每一步都在踏过敌人的尸体……##\"\n\n开火前有预转前摇；瞄准时保持旋转。",
        -- Microgun
        ["bm_shuno_sc_desc"] = "\"#{heat_warm_color}#这是你的道路。当你到来，你将以孤独为伴。##\"\n\n开火前有预转前摇；瞄准时保持旋转。",

        -- Custom MGs
        -- TF2 Minigun
        ["bm_wp_wpn_fps_lmg_sasha_body_desc"] = "", -- tra
        ["bm_wp_wpn_fps_lmg_iron_curtain_body_desc"] = "",
        ["bm_wp_wpn_fps_lmg_tomislav_body_desc"] = "#{skill_color}#Speeds up spin-up time by 20%.##",
        ["bm_wp_wpn_fps_lmg_natascha_body_desc"] = "#{skill_color}#Staggers enemies up to 9.75 meters away.##\n#{risk}#(Stagger range cannot be modified)##\n#{important_1}#Slows spin-up time by 30%.##",
        ["bm_wp_wpn_fps_lmg_gatling_gun_body_desc"] = "#{important_1}#Slows spin-up time by 50%.##",
        ["bm_wp_wpn_fps_lmg_canton_body_desc"] = "#{skill_color}#80% chance to set enemies on fire, dealing## #{heat_warm_color}#60## #{skill_color}#damage over 4 seconds.##\n#{risk}#Chance is reduced over range and only stuns enemies before damage falloff starts.\nDeals fire damage instead of bullet damage.##",

        -- Galant--
        ["bm_galant_sc_desc"] = "经典二战作战步枪。可靠，精准，换弹迅速。\n\n空仓换弹速度更快并且可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        -- M308
        ["bm_m14_sc_desc"] = "快速且精准，只要确保控制住后坐力，尤其是全自动开火的时候。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        -- FAL
        ["bm_w_fal"] = "Falcon 58步枪",
        ["bm_fal_sc_desc"] = "自由世界的正当武装。当你不得不干掉一些重甲混蛋的时候，你求助于这把枪。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        -- SCAR
        ["bm_scar_sc_desc"] = "未来的战斗步枪。依托着在手感和弹道伤害上有着良好的平衡，在美国海军陆战队和特种力量中应用广泛。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        ["bm_scarl_sc_desc"] = "未来的战斗步枪......不，虽然它在民用市场很受欢迎，但军队认为他们不需要另一把5.56步枪。",
        -- G3
        ["bm_w_g3"] = "Gewehr-3步枪",
        ["bm_g3_sc_desc"] = "作为Compact-5和Brenner-21的大姐头，这把枪的精准度可与狙击枪一较高下。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        -- Little Friend
        ["bm_w_contraband"] = "Bigger Friend 7.62步枪",
        ["bm_m203_weapon_sc_desc_pc"] = "疤面煞星私人款\"小伙伴\"AMR-16的大姐头。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。\n按下 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        ["bm_m203_weapon_sc_desc"] = "疤面煞星私人款\"小伙伴\"AMR-16的大姐头。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。\n按住 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        -- VMP
        ["bm_m203_vmp_sc_desc_pc"] = "疤面煞星私人款“小伙伴”AMR-16步枪的仿制品。\n\n按下 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        ["bm_m203_vmp_sc_desc"] = "疤面煞星私人款“小伙伴”AMR-16步枪的仿制品。\n\n按住 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        ["bm_mesa_vmp_sc_desc_pc"] = "OMNIA被盗货品中的一件好玩儿的东西。\n\n按下 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        ["bm_mesa_vmp_sc_desc"] = "OMNIA被盗货品中的一件好玩儿的东西。\n\n按住 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
        -- ASS VAL
        -- ["bm_w_asval"] = "Valkyria",
        ["bm_asval_sc_desc"] = "选择小型步枪弹也许会让你在枪手中沦为泛泛之众，或者说你选这把枪。\n\n#{skill_color}#完全消音##并且#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        -- Galil
        ["bm_w_galil"] = "Defender 7.62步枪",
        ["bm_galil_sc_desc"] = "一款在芬兰设计的基础上模仿来的步枪，并且本身也是经典款AK的衍生品。模仿是最真诚的恭维。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        -- KS12
        ["bm_shak12_sc_desc"] = "一款故意凸显其强大无比的12.7x55mm弹筒的无托式设计战斗步枪。极其紧凑的包装蕴含极其凶残的屠杀。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        ["bm_shak12_sc_oden_desc"] = "一款故意凸显其强大无比的12.7x55mm弹筒的无托式设计战斗步枪。极其紧凑的包装蕴含极其凶残的屠杀。\n\n可#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- ShAK-12
        ["bm_wp_shak12_body_vks"] = "\"VISha\"枪托",
        ["bm_wp_shak12_body_vks_ap_desc"] = "装载大威力弹#{skill_color}#允许达到全面护甲穿透和穿盾能力##。 枪托和枪闩用了更敦实的材料加固使 #{important_1}#射速降低##。",
        -- HCAR
        ["bm_w_hcar"] = "Akron HC步枪",
        ["bm_hcar_sc_desc"] = "一把经典二战机枪的现代版本。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",

        -- Custom DMRs
        -- MCX Spear
        ["bm_w_mcx_spear"] = "Signature M7步枪",
        ["bm_mcx_spear_sc_desc"] = "可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#33%##的伤害。",
        ["bm_w_g3hk79"] = "Gewehr-A3 GL79步枪",
        ["bm_g3hk79_sc_desc_pc"] = "Gewehr-3步枪的改版，可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。\n\n装有#{skill_color}#下挂榴弹发射器##，按#{skill_color}#$BTN_BIPOD##切换到下挂榴弹发射器。",
        -- ["bm_g3hk79_sc_desc"] = "Gewehr-3步枪的改版，装有#{skill_color}#下挂榴弹发射器##。\n\n按#{skill_color}#$BTN_BIPOD##切换到下挂榴弹发射器。",
        -- BO3 XR2
        ["bm_w_xr2"] = "XR-2步枪",
        ["bm_xr2_sc_desc"] = "这把XR-2是个被设计来应对极其多变的战斗环境的多功能步枪。有着能#{skill_color}#提升射速##的独特#{skill_color}#三连发速射模式##。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        ["bm_wp_xr2_handle_01_sc"] = "全自动枪闩",
        ["bm_xr2_handle_01_sc_desc"] = "以#{important_1}#失去射速提高##为代价，将三连发速射模式改为#{skill_color}#连发模式##。",
        ["bm_wp_xr2_handle_02_sc"] = "快速开火枪闩",
        ["bm_xr2_handle_02_sc_desc"] = "以#{important_1}#提高后坐力##为代价将三连发速射模式的射速提升到#{skill_color}#950RPM##。\n\n三连发射击间隔时间和半自动射击射速不受影响。",
        -- SIERRA .458
        ["bm_w_sierra458"] = "Sierra .458步枪",
        ["bm_w_sierra458_sc_desc"] = "钱恩斯作为团队中的武器大师，研发了一种高伤害高射速的Tecci战术步枪替代品，以应对紧急情况。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        ["bm_w_sierra458_beo_desc"] = "钱恩斯作为团队中的武器大师，研发了一种高伤害高射速的Tecci战术步枪替代品，以应对紧急情况。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        ["bm_wp_wpn_fps_snp_sierra458_m_bush_desc"] = "将.458 SOCOM子弹换成#{stats_positive}#沾染毒药##的.450 Bushmaster子弹，命中时#{skill_color}#眩晕敌人##并在#{skill_color}#4##秒内造成#{stats_positive}#120##点伤害。\n\n但#{important_1}#不再能穿透敌人##",
        ["bm_w_sierra458_ivy_desc"] = "钱恩斯作为团队中的武器大师，研发了一种高伤害高射速的Tecci战术步枪替代品，以应对紧急情况。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透薄墙壁##。\n命中后使敌人#{stats_positive}#中毒##。", -- tra fix

        -- MSR
        ["bm_msr_sc_desc"] = "美国军方钦定的狙击枪。良好的精准度，操控性，甚至隐蔽性使得它成为令人满意的多用途狙击步枪。\n\n能够#{skill_colo穿透敌人，护甲，盾牌以及薄墙壁r}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- R700
        ["bm_r700_sc_desc"] = "响尾蛇的老前任。良好的精准度，操控性，甚至有着比他后辈更远的射程。缺点呢？稀烂的五发弹夹。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- QBU88
        ["bm_qbu88_sc_desc"] = "从东欧集团得到灵感而做出的无托狙击枪，和大多数一样，适合用来强加你的意志给别人。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- Winchester 1874
        ["bm_winchester1874_sc_desc"] = "打下了美国西部的枪。热兵器中的圣遗物，但并不意味着其致死性不足，只因它强力的.44-40供弹。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。\n辅助射击允许以#{important_1}#更高的后坐力##和#{important_1}#更短的有效射程##为代价进行#{skill_color}#射速更高##的速射。",
        -- TTI(TTY)
        ["bm_w_tti"] = "Tecci .308狙击步枪",
        ["bm_tti_sc_desc"] = "威克的私人武器之一。据说网上有个地方有他练习这把枪莫桑比克射击法的片段。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- Icky Vicky
        ["bm_w_victor"] = "SA北极星狙击步枪",
        -- ["bm_victor_sc_desc"] = "\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- Scunt
        ["bm_wp_scout_m_extended"] = "神射手快换弹夹",
        -- AWP
        ["bm_w_awp"] = "Amaroq 900狙击步枪",
        ["bm_awp_sc_desc"] = "一支以其卓越的射程和精度而闻名于世的狙击步枪。谁能想到最初的模型是由三个躲在棚子里的人创造的呢？\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        ["bm_wp_upg_bazooka"] = "巨龙传说原皮套件",
        ["bm_wp_upg_bazooka_desc"] = "高风险，高回报！这款驰名天下的狙击步枪以其标志性的枪鸣和一击必杀的能力而闻名。\n\n使用后能够#{skill_color}#穿透泰坦盾牌##。",
        ["bm_bazooka_sc_desc"] = "高风险，高回报！这款驰名天下的狙击步枪以其标志性的枪鸣和一击必杀的能力而闻名。\n\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        -- WA2000
        ["bm_w_wa2000"] = "Lebensauger .300狙击步枪",
        ["bm_wa2000_sc_desc"] = "这个最负盛名的枪世上只做了几百把；一把专适合顶尖杀手的狙击步枪。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- Rangerhitter
        ["bm_w_sbl"] = "Rangehitter MK2狙击步枪", -- It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
        ["bm_sbl_sc_desc"] = "二十世纪的杠杆设计使其相对十九世纪能供应更大号的枪弹。期待你这边的.45-70子弹带来额外的乐趣和额外的死仔吧。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。\n辅助射击允许以#{important_1}#更高的后坐力##和#{important_1}#更短的有效射程##为代价进行#{skill_color}#射速更高##的速射。",
        -- Contender G2
        ["bm_w_contender"] = "Aran G2狙击步枪",
        ["bm_contender_sc_desc"] = "",
        -- Model 70
        ["bm_model70_sc_desc"] = "神枪手的神枪。早期由Repeater-1874的同一批设计师手下做出的栓动式设计。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- SVD
        ["bm_siltstone_sc_desc"] = "AK家族的高威力半自动狙击步枪。像许多东方武器一样声名显赫。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",

        -- Mosin--
        ["bm_mosin_sc_desc"] = "当你食不果腹而仍需一把枪时，这把廉价又经典的栓动式步枪便应召而来。\n\n这把枪一次装填#{skill_color}#5##颗子弹，并且能够#{skill_color}#穿透敌人、护甲、盾牌以及薄墙壁##。",
        ["bm_wp_upg_a_tranq_mosin"] = "镇静弹",
        ["bm_wp_upg_a_tranq_mosin_desc"] = "#{ghost_color}#忘却##，#{item_stage_2}#结束##。\n\n发射#{important_1}#伤害更低##的#{stats_positive}#镇静弹##，命中敌人时能在#{skill_color}#6##秒内每秒造成#{skill_color}#30##点伤害并且能够#{stats_positive}#硬直敌人##。\n\n但使用后#{important_1}#无法再穿透敌人##。",
        ["bm_mosin_tranq_desc"] = "当你食不果腹而仍需一把枪时，这把廉价又经典的栓动式步枪便应召而来。\n\n这把枪使用#{skill_color}#镇静弹##在短时间内造成#{skill_color}#持续伤害##且一次装填#{skill_color}#5##颗子弹，能够#{skill_color}#穿透护甲、盾牌以及薄墙壁##。",
        -- Desert Fox
        ["bm_desertfox_sc_desc"] = "威克突击俄罗斯黑帮安全屋时用的紧凑型无托狙击步枪。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        -- R93
        ["bm_r93_sc_desc"] = "大口径德国狙击步枪，为停阻大家伙而准备。是全球警察和反恐准军事力量的首选狙击枪。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        --Flintlock--
        ["bm_bessy_sc_desc"] = "一支拥有良好组织性的民兵对于自由国家的安全保障是必不可少的。因此，人民拥有和携带武器的权利不可侵犯。\n\n对特殊敌人造成的伤害额外增加#{skill_color}#100%##。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        -- Thanatos--
        ["bm_w_m95"] = "Thanatos .50 cal 反器材狙击步枪",
        ["bm_m95_sc_desc"] = "被用于对小型载具作战的反器材步枪。把它用到生物目标的人几乎是战争犯。\n\n爆头额外造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        -- Custom Snipers
        ["bm_w_m107cq"] = "Mors .50 cal反器材狙击步枪",
        ["bm_m107cq_sc_desc"] = "如果Thanatos跟不上进度，那么Mors能如你所愿让他们死无全尸。\n\n爆头额外造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        ["bm_w_m200"] = "TF-141反器材狙击步枪",
        ["bm_m200_sc_desc"] = "为那些想要愉悦的做到楼梯间360度不开镜单杀的人设计。\n\n爆头额外造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        -- S7
        ["bm_w_srs99_s7_desc"] = "我在你的未来预见了爆头，斯巴达！\n\n爆头额外造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        ["bm_w_srs99_s7_flexfire_desc"] = "我在你的未来预见了爆头，斯巴达！\n\n爆头额外造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌和薄墙壁##。",
        ["flexfire_desc"] = "#{important_1}#无法再穿透泰坦盾牌##。",
        ["oracle_scope"] = "神谕-科技连结瞄准镜",
        ["oracle_scope_desc"] = "用于更改默认#{skill_color}#全知全智##瞄镜的准星。\n#{risk}#5倍放大倍率##",
        -- Marlin 1894
        ["bm_w_m1894"] = "Mare's Leg 狙击步枪",
        -- SPX Centerfire
        ["bm_w_moss464spx"] = "Mosconi SPX 狙击步枪",
        -- Winchester 1894
        ["bm_w_winchester1894"] = "Repeater 1894 狙击步枪",
        -- SVD
        ["bm_w_svd"] = "SV7狙击步枪",
        ["bm_wp_wpn_fps_snp_svd_pso"] = "SV7瞄准镜",
        -- L115
        ["bm_w_l115"] = "AIM 90M狙击步枪",
        -- Highly Modified CAR-4
        ["bm_hmcar_sc_desc"] = "在被执法人员逐步淘汰掉之前，你成功地偷到了装满这些套件的箱子。\n\n发射能够#{skill_color}#穿透敌人，护甲，盾牌和薄墙壁##的#{stat_maxed}#泰坦狙击弹##；辅助射击能够改为#{skill_color}#双倍弹药消耗和威力##的同时提供#{skill_color}#穿透泰坦盾##能力的#{event_color}#全火力狙击弹##。\n\n#{important_1}#该武器无法触发脑洞大开（擦伤）技能##",
        ["bm_wp_hmcar_hd_kit"] = "32位-8K超高清套件",
        ["bm_wp_hmcar_hd_kit_desc"] = "Application has crashed: C++ exception\nCould not load texture because IDirect3D9::CreateTexture call failed.\nDirect3D could not allocate sufficient memory to complete the call.\n\n\n\n\n\n\n ",

        -- Light Crossbow       
        ["bm_wp_avelyn"] = "“万箭齐发”套件",
        ["bm_wp_avelyn_desc"] = "一种真正的#{skill_color}#齐射##套件。\n让你可以一次射出#{skill_color}#3##发箭矢。",

        -- GL40     
        ["bm_w_gre_m79_sc_desc"] = "咚了个砰！\n\n按下 #{skill_color}#$BTN_GADGET## 切换到折叠瞄具。\n\n该瞄具视野限制在#{skill_color}#30m##内。",
        -- 3GL
        ["bm_ms3gl_sc_desc"] = "发射通过黑科技自制的集束40mm榴弹，可以造成快速后续冲击伤害。\n\n辅助射击允许一次性#{skill_color}#射出三发榴弹##。",
        -- ["bm_ms3gl_sc_desc"] = "Fires custom 40mm rounds superposed in a single chamber. Uses electric primers to fire, allowing for rapid follow-ups in a compact package.\n\nAlt-fire #{skill_color}#fires a burst of 3 grenades.##",
        -- PIGLET/M32
        ["bm_m32_sc_desc"] = "变身成为一个\"#{risk}#战斗机器##\"，告诉你的敌人们，没有魔法少女会来保护他们和他们的队友免受这个6发转轮榴弹的伤害。",
        -- China Puff
        ["bm_w_china_sc_desc"] = "\"哇哦，这儿可真是个可怕的地方！\"\n\n按下 #{skill_color}#$BTN_GADGET## 切换到折叠瞄具。\n\n该瞄具视野限制在#{skill_color}#30m##内。",
        -- COMMANDO 101/M202 FLASH
        ["bm_ray_sc_desc"] = "这个四联装#{heat_warm_color}#燃烧火箭##使你成为\"#{risk}#死神##\"。\n\n火箭爆炸后#{heat_warm_color}#留下持续地火##，并且直接爆炸伤害可以#{skill_color}#秒杀敌人炮塔##。",

        -- M4/CAR-4
        ["bm_menu_sc_m4_desc"] = "可靠，紧凑，且致命。在现代部队广泛使用的5.56mm步枪。",

        -- Generic weapon descriptions (Keep for custom weapon purposes)--
        ["bm_menu_weapon_multishot_1"] = "总伤害共由",
        ["bm_menu_weapon_multishot_2"] = "颗弹丸造成，每颗造成",
        ["bm_menu_weapon_multishot_3"] = "点伤害。",
        ["bm_menu_weapon_ene_hs_mult_sub"] = "对敌人的基础爆头倍率减少至 ",
        ["bm_menu_weapon_ene_hs_mult_add"] = "对敌人的基础爆头倍率增加至 ",
        ["bm_menu_weapon_hs_mult_1"] = "爆头非队长敌人会额外造成",
        ["bm_menu_weapon_hs_mult_2"] = "点伤害。",
        ["bm_menu_weapon_ene_hs_mult_end"] = "",
        ["bm_menu_weapon_exp_no_hs_info"] = "#{risk}#使用了高爆弹药##，#{important_1}#无法造成爆头##。",
        ["bm_menu_weapon_movement_penalty_info"] = "移动速度降低 ",
        ["bm_menu_weapon_movement_bonus_info"] = "移动速度提升 ",
        ["bm_menu_sms_info_cont"] = "射击时惩罚翻倍。",
        ["bm_menu_sms_info_cont_2"] = "受配件影响，射击时惩罚翻倍。",
        ["bm_menu_sms_info_2"] = "  ，在你射击时。",
        ["bm_menu_stat_sms_info_2"] = " ，在你射击时。\n该惩罚受当前配件影响。",
        ["bm_menu_weapon_movement_penalty_info_2"] = "，在你手持时",
        ["bm_menu_weapon_slot_warning_1"] = "\n##//////////             无 法 使 用             //////////\n",
        ["bm_menu_weapon_slot_warning_2"] = "\n//////////             无 法 使 用             //////////##",
        ["bm_menu_weapon_slot_warning_primary"] = "该武器已被移动到主武器栏\n在劫案内以副手使用将会崩溃",
        ["bm_menu_weapon_slot_warning_secondary"] = "该武器已被移动到副武器栏\n在劫案内以主手使用将会崩溃",
        ["bm_menu_weapon_slot_warning_disabled"] = "武器已被秋日队长禁用\n在劫案内使用将导致崩溃",
        ["bm_menu_weapon_slot_warning_wtfdoido"] = "如果物品栏还有这把枪务必不要使用。\n\n目前依然没有平衡方式。",
        ["empty"] = "",
        ["missing_cap"] = "#{risk}#自定义附件##-#{important_1}#未安装##\n\n附件将使用该栏默认外观。",
        ["bm_slamfire_generic_desc"] = "辅助射击允许快速连点以用#{skill_color}#更快的射速##进行速射，代价是#{important_1}#后坐力和子弹散射更大##并且#{important_1}#无法右键瞄准##。",
        ["bm_rapidfire_generic_desc"] = "Can be #{skill_color}#rapid-fired for an increased fire rate## at the cost of #{important_1}#more recoil and reduced effective range.##", -- tra
        ["bm_ap_weapon_sc_desc"] = "能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。",
        ["bm_ap_armor_weapon_sc_desc"] = "能够#{skill_color}#穿透护甲##。",
        ["bm_ap_armor_20_weapon_sc_desc"] = "可#{skill_color}#穿透护甲##造成#{skill_color}#20%##的伤害。",
        ["bm_ap_armor_50_weapon_sc_desc"] = "可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。",
        ["bm_ap_armor_80_weapon_sc_desc"] = "可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害并可#{skill_color}#穿透敌人和薄墙壁##。",
        ["bm_pdw_gen_sc_desc"] = "可#{skill_color}#穿透护甲##造成#{skill_color}#80%##的伤害且爆头非队长单位可额外造成#{skill_color}#66%##的伤害。",
        ["bm_heavy_ap_weapon_sc_desc"] = "爆头多造成#{skill_color}#100%##伤害。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
        ["bm_heavy_ap_no_mult_weapon_sc_desc"] = "能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",

        ["bm_bow_sc_desc"] = "轻按#{skill_color}#$BTN_FIRE##以快速射击，但#{important_1}#伤害减半##且#{important_1}#下垂更快##。\n按住#{skill_color}#$BTN_FIRE##以拉弓，然后松开以射击。\n弓拉的越满，伤害和箭的飞行速度越高。\n\n按下#{skill_color}#$BTN_AIM##停止拉弓。\n\n箭矢可以#{skill_color}#捡起回收##。\n能够#{skill_color}#穿透护甲##。",
        ["bm_bow_exp_sc_desc"] = "轻按#{skill_color}#$BTN_FIRE##以快速射击，但#{important_1}#伤害减半##且#{important_1}#下垂更快##。\n按住#{skill_color}#$BTN_FIRE##以拉弓，然后松开以射击。\n弓拉的越满，箭的飞行速度越高。\n\n按下#{skill_color}#$BTN_AIM##停止拉弓。\n\n箭矢在#{skill_color}#撞击时爆炸##，#{important_1}#无法造成爆头##。",
        ["bm_w_bow_exp_desc"] = "发射在撞击时#{risk}#爆炸##伤害半径#{skill_color}#2##米内所有敌人的箭矢。\n\n#{important_1}#箭矢的飞行速度降低，且无法爆头和回收##",
        ["bm_w_bow_light_poison_desc"] = "发射沾有#{stats_positive}#剧毒##的箭矢，在#{skill_color}#6##秒内造成#{stats_positive}#180##点伤害并有概率眩晕敌人。\n\n#{important_1}#箭矢的飞行速度略微降低##",
        ["bm_w_bow_heavy_poison_desc"] = "发射沾有#{stats_positive}#剧毒##的箭矢，在#{skill_color}#8##秒内造成#{stats_positive}#240##点伤害并有概率眩晕敌人。\n\n#{important_1}#箭矢的飞行速度略微降低##",

        ["bm_xbow_sc_desc"] = "弩箭可以#{skill_color}#捡起回收##。\n\n能够#{skill_color}#穿透护甲##。",
        ["bm_xbow_exp_sc_desc"] = "弩箭在#{skill_color}#撞击时爆炸##，#{important_1}#无法造成爆头##。",
        ["bm_w_xbow_exp_desc"] = "发射在撞击时#{risk}#爆炸##伤害半径#{skill_color}#2##米内所有敌人的弩箭。\n\n#{important_1}#弩箭的飞行速度降低，且无法爆头和回收##",
        ["bm_w_xbow_light_poison_desc"] = "发射沾有#{stats_positive}#剧毒##的弩箭，在#{skill_color}#6##秒内造成#{stats_positive}#180##点伤害并有概率眩晕敌人。\n\n#{important_1}#弩箭的飞行速度略微降低##",
        ["bm_w_xbow_heavy_poison_desc"] = "发射沾有#{stats_positive}#剧毒##的弩箭，在#{skill_color}#8##秒内造成#{stats_positive}#240##点伤害并有概率眩晕敌人。\n\n#{important_1}#弩箭的飞行速度略微降低##",

        ["bm_airbow_sc_desc"] = "箭矢可以#{skill_color}#捡起回收##。\n\n能够#{skill_color}#穿透护甲##。",
        ["bm_airbow_exp_sc_desc"] = "箭矢在#{skill_color}#撞击时爆炸##，#{important_1}#无法造成爆头##。",
        ["bm_w_airbow_poison_desc"] = "发射沾有#{stats_positive}#剧毒##的弩箭，在#{skill_color}#4##秒内造成#{stats_positive}#120##点伤害并有概率眩晕敌人。\n\n#{important_1}#弩箭的飞行速度略微降低##",

        ["bm_40mm_weapon_sc_desc"] = "按下 $BTN_GADGET 切换到折叠瞄具。\n\n该瞄具视野限制在30m内。",
        ["bm_rocket_launcher_sc_desc"] = "该武器造成的爆炸伤害能够#{skill_color}#秒杀敌人炮塔##。",
        ["bm_quake_shotgun_sc_desc"] = "一次射击两个枪管，弹丸数量也翻倍。",
        ["bm_hx25_buck_sc_desc"] = "发射散布广的12颗弹丸。\n\n只受榴弹相关技能加成。",
        ["bm_auto_generated_sc_desc"] = "该武器属性为随机生成，可能无法被改装到一个完美平衡的状态。",
        ["bm_auto_generated_ap_sc_desc"] = "该武器属性为随机生成，可能无法被改装到一个完美平衡的状态。\n\n可以#{skill_color}#穿透护甲，盾牌以及薄墙壁##。",
        ["bm_auto_generated_sap_sc_desc"] = "该武器属性为随机生成，可能无法被改装到一个完美平衡的状态。\n\n可以#{skill_color}#穿透护甲，盾牌，泰坦盾牌及薄墙壁##。",
        ["bm_auto_generated_lmg_sc_desc"] = "该武器属性为随机生成，可能无法被改装到一个完美平衡的状态。\n\n装备该武器时，你的移速会减慢##25%##。",
        ["bm_auto_generated_mod_sc_desc"] = "该配件的属性将暂时被移除，直至自制配件的属性生成完毕。", -- The stats on this attachment have been removed until automatic custom attachment stat generation is finished.
        -- ["bm_tranq_maxim_sc_desc"] = "使用镇静子弹随时间对敌人造成伤害并且是消音的。",

        -- Overhaul Content Indicators--
        ["loot_sc"] = "Restoration Overhaul",
        ["loot_sc_desc"] = "这是一件RESTORATION大修的物品!",

        ["menu_l_global_value_omnia"] = "OMNIA",
        ["menu_l_global_value_omnia_desc"] = "这是一件OMNIA的物品!",

        ["menu_rifle"] = "步枪",
        ["menu_jowi"] = "威克",
        ["menu_moving_target_sc"] = "Subtle",

        ["bm_wp_upg_i_singlefire_sc"] = "慢循环机",
        ["bm_wp_upg_i_singlefire_sc_desc"] = "将你的射速减慢15%", -- RIP RoF mods
        ["bm_wp_upg_i_autofire_sc"] = "快循环机",
        ["bm_wp_upg_i_autofire_sc_desc"] = "将你的射速增加15%",

        ["bm_hint_titan_60"] = "泰坦重型特警将在60秒后离开！",
        ["bm_hint_titan_10"] = "泰坦重型特警将在10秒后离开！",
        ["bm_hint_titan_end"] = "泰坦重型特警去其它世界寻找猎物了！",

        ["bm_menu_gadget_plural"] = "配件",
        ["menu_pistol_carbine"] = "卡宾手枪",
        ["menu_battle_rifle"] = "战斗步枪",

        -- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
        ["bm_melee_swing_arc_1"] = "有#{skill_color}#较宽##的攻击范围。",
        ["bm_melee_swing_arc_2"] = "有#{skill_color}#很宽##的攻击范围。",
        ["bm_melee_swing_arc_3"] = "有#{skill_color}#宽广##的攻击范围。",
        ["bm_melee_swing_arc_4"] = "有#{skill_color}#非常宽广##的攻击范围。", -- tra
        ["bm_melee_swing_arc_h_1"] = "Has a #{skill_color}#wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_h_2"] = "Has a #{skill_color}#very wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_h_3"] = "Has a #{skill_color}#very, very wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_h_4"] = "Has a #{skill_color}#massive## swing radius when moving sideways.",
        ["bm_melee_swing_arc_charge_h_1"] = "Charged attacks have a #{skill_color}#wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_charge_h_2"] = "Charged attacks have a #{skill_color}#very wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_charge_h_3"] = "Charged attacks have a #{skill_color}#very, very wide## swing radius when moving sideways.",
        ["bm_melee_swing_arc_charge_h_4"] = "Charged attacks have a #{skill_color}#massive## swing radius when moving sideways.",
        ["bm_melee_weapon_info"] = "在武装抢劫中，用枪托殴打受害者通常比直接开枪射击或利器刺击他们更常见。\n\n#{skill_color}#枪托的最高攻击频率显著受到所用武器的隐匿度影响##",
        ["bm_melee_katana_info"] = "新作武士刀是一款艺术品，且为全新锻造款。它未曾饱尝鲜血，也未曾留名青史。它只是在等待一个主上来开创这些。\n\n完全蓄力时出刀速度加快#{skill_color}#50%##，允许快速进行后续挥砍。\n\n当扮演治郎时，用此武器蓄力击杀幻影特工可以触发一个独特动画效果。",
        ["bm_melee_raiden_info"] = "你的手中并无\"#{risk}#正义之器##\"。\n\n完全蓄力时出刀速度加快#{skill_color}#50%##，允许快速进行后续挥砍。",
        ["bm_melee_thejobissnotyours_info"] = "这甚至不是你的剑。\n\n完全蓄力时出刀速度加快#{skill_color}#50%##，允许快速进行后续挥砍。",
        ["bm_melee_2077tkata_info"] = "这是一把纳米高热刀，其极致精髓体现了传统日本刀剑的威力，没有任何附加功能，也未做任何修改，唯有灼热的钢铁之力。\n\n完全蓄力后攻击可点燃敌人，在#{skill_color}#3##秒内造成#{heat_warm_color}#120##点火焰伤害。",
        ["bm_melee_buck_info"] = "对抗现代武器仍然十分有效。\n蓄力时减少#{skill_color}#10%##的远程伤害。", -- Buckler Shield
        ["bm_melee_briefcase_info"] = "不管里面装的什么，手提箱自身有着惊人的弹性。\n\n蓄力时减少#{skill_color}#10%##的远程伤害。", -- Briefcase
        ["bm_melee_pitch_info"] = "用力叉，再用力叉！\n\n蓄力向前冲锋对前方目标造成每#{skill_color}#0.4##秒#{skill_color}#45##点伤害。此属性受到相关技能影响。\n\n冲锋击中敌人时消耗#{important_1}#15%##的耐力；致命一击只消耗#{ghost_color}#10%##。\n\n#{important_1}#任何时候都无法格挡敌人攻击##", -- Randal Pitchfork
        ["bm_melee_charge_info"] = "蓄力向前冲锋对前方目标造成每#{skill_color}#0.4##秒#{skill_color}#45##点伤害。此属性受到相关技能影响。\n\n冲锋击中敌人时消耗#{important_1}#15%##的耐力；致命一击只消耗#{ghost_color}#10%##。\n\n#{important_1}#任何时候都无法格挡敌人攻击##",
        ["bm_melee_cs_info"] = "#{heat_warm_color}#撕裂吧！毁灭吧！##\n\n蓄力时对你面前的敌人每#{skill_color}#0.25##秒造成#{skill_color}#30##点伤害。此属性受到相关技能影响。\n\n#{important_1}#任何时候都无法格挡敌人攻击##", -- ROAMING FR-
        ["bm_melee_ostry_info"] = "#{heat_warm_color}#车专 口阿 车专 口阿 车专##\n\n蓄力时对你面前的敌人每#{skill_color}#0.18##秒造成#{skill_color}#18##点伤害。此属性受到相关技能影响。\n\n#{important_1}#任何时候都无法格挡敌人攻击##", -- Kazaguruma
        ["bm_melee_wing_info"] = "配合伪装一起使用效果更佳。\n从背后攻击敌人造成#{skill_color}#4##倍伤害。", -- Wing Butterfly Knife
        ["bm_melee_switchblade_info"] = "暴力与致命是我的信条。\n从背后攻击敌人造成#{skill_color}#2##倍伤害。", -- Switchblade Knife
        ["bm_melee_chef_info"] = "不太确定能不能用来切超市的肉。\n完全蓄力时命中敌人会在附近#{skill_color}#12##米内#{skill_color}#散播恐慌##。", -- Psycho Knife
        ["bm_melee_headless_sword_info"] = "梦魇打造的剑。\n完全蓄力时命中敌人会在附近#{skill_color}#12##米内#{skill_color}#散播恐慌##。", -- Headless Dozer Sword
        ["bm_melee_goat_info"] = "\"它太大了，以至于不能称之为剑。巨大、厚实、沉重而又粗野。的确，它就好像一堆生铁。\"\n\n完全蓄力时命中敌人会在附近#{skill_color}#12##米内#{skill_color}#散播恐慌##。", -- im not gaj
        ["bm_melee_great_info"] = "试着去刺击，但穿了个洞。\n\n蓄力达到至少#{skill_color}#90%##时进行刺击，使攻击距离提高#{skill_color}#0.5m##。", -- Great Sword
        ["bm_melee_freedom_info"] = "十三条红白相间的条纹，一个蓝色的长方形，五十颗白色五角星，一捻爱国主义，两杯自由，以及一根断掉的旗杆。#{heat_warm_color}#看啊——你有一把致命的武器##。\n\n蓄力达到至少#{skill_color}#90%##时进行刺击，使攻击距离提高#{skill_color}#0.5m##", -- Great Sword
        ["bm_melee_jebus_info"] = "#{risk}#明暗双生，黑白两道，生死分明！##\n\n这把双刃无容于中庸，必能令敌手唯恐避之不及。\n\n蓄力达到至少#{skill_color}#90%##时进行刺击，使攻击距离提高#{skill_color}#0.5m##。",
        ["bm_melee_nin_info"] = "#{skill_color}#发射距离很短但几乎立刻命中的钉子##，击杀仍然计入近战击杀数。", -- Pounder
        ["bm_melee_thebestweapon_info"] = "##{heat_warm_color}##游戏中最好的武器##，没有之一。",
        ["bm_melee_iceaxe_info"] = "爆头伤害增加#{skill_color}#50%##。", -- Icepick
        ["bm_melee_mining_pick_info"] = "爆头伤害增加#{skill_color}#50%##。", -- Gold Fever (Pickaxe)
        ["bm_melee_boxing_gloves_info"] = "丧钟为你而鸣。\n用该武器击杀敌人#{skill_color}#立刻恢复你的耐力##。", -- OVERKILL Boxing Gloves
        ["bm_melee_clean_info"] = "条子们该刮胡子了。\n#{skill_color}#3##秒内造成#{skill_color}#120##点流血伤害。", -- Alabama Razor
        ["bm_melee_barbedwire_info"] = "我不奢求来生怎样，现在我就坐在这，跟一个TMD棒球棍聊天！\n#{skill_color}#3##秒内造成#{skill_color}#120##点流血伤害。", -- Lucille Baseball Bat
        ["bm_melee_bleed_info"] = "#{skill_color}#3##秒内造成#{skill_color}#120##点流血伤害。",
        ["bm_melee_inner_child_info"] = "唤起你的童心。\n\n#{skill_color}#3##秒内造成#{skill_color}#120##点流血伤害。",
        ["bm_melee_spoon_gold_info"] = "吃光抹净，再来一碗！ \n有#{skill_color}#50%##的几率造成#{heat_warm_color}#120##点燃烧伤害并干扰敌人#{skill_color}#3##秒。", -- Gold Spoon
        ["bm_melee_fire_info"] = "有#{skill_color}#50%##的几率造成#{heat_warm_color}#120##点燃烧伤害并干扰敌人#{skill_color}#3##秒。",
        ["bm_melee_cqc_info"] = "毒素会在#{skill_color}#3##秒内造成#{skill_color}#120##点伤害并在#{skill_color}#4##秒内每半秒都有#{skill_color}#50%##的概率干扰敌人。", -- Kunai, Syringe
        ["bm_melee_fight_info"] = "形意如水，朋友。\n格挡敌人攻击时可以造成#{skill_color}#120##点伤害。此属性受到相关技能影响。", -- Empty Palm Kata
        ["bm_melee_slot_lever_info"] = "中头彩！\n#{skill_color}#5%##的几率造成#{skill_color}#10##倍伤害并击倒敌人。",
        ["bm_melee_specialist_info"] = "双份匕首，双倍快乐。\n连续攻击时，第一次攻击之后的每次攻击都是#{skill_color}#双倍伤害##。\n", -- Specialist Knives, Talons, Knuckle Daggers, Push Daggers
        ["bm_melee_cleaver_info"] = "上砍雪花盖顶，下砍老树盘根。\n爆头伤害减少#{skill_color}#50%##，对身体和其他部分的伤害增加#{skill_color}#50%##。",
        ["bm_melee_erica_info"] = "A sane person would throw this.\n\nFully charged hits against living enemies have a #{skill_color}#5%## chance to explode dealing #{risk}#720## damage in a #{skill_color}#5## meter radius from the point of impact.",
        -- tra       
        -- Melee Weapons
        ["bm_melee_twins"] = "Sai", -- Plural form is still "sai"  --tra what is this

        -- CUSTOM MELEE WEAPONS
        ["bm_melee_revenant_heirloom"] = "Dead Man's Curve", -- tra
        ["bm_melee_revenant_heirloom_info"] = "Attacking with a low charge performs a quick jab with end of the weapon.\n\nAttacking with at least a #{skill_color}#25%## charge performs a sweeping slash.",
        ["bm_melee_megumins_staff_info"] = "Cast a powerful explosion when fully charged!\nCan be cast as far as #{skill_color}#30## meters on any surface or being; #{risk}#it cannot be cast into the air.##\n\n#{important_1}#Charge speed is unaffected by skills.\nCharging distorts vision, drains stamina and progressively slows down your movement.\nYou are instantly downed upon successfully casting an explosion; skills and perks that delay or save you from going down are ignored.##",

        ["bm_menu_weapon_bayonet_header"] = "刺刀加成：", -- waiting for tra
        ["bm_menu_weapon_bayonet_damage"] = "\n  额外伤害：##+",
        ["bm_menu_weapon_bayonet_damage_base"] = "\n  —基础加成：##",
        ["bm_menu_weapon_bayonet_damage_skill"] = "\n  —技能加成：##+",
        ["bm_menu_weapon_bayonet_range"] = "\n  额外距离：##+",

        -- We assets now--
        ["menu_asset_dinner_safe"] = "保险箱",
        ["menu_asset_bomb_inside_info"] = "内应信息",
        ["menu_asset_mad_cyborg_test_subject"] = "实验对象",

        -- Player Outfits--
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

        ["bm_suit_var_jumpsuit_flecktarn"] = "斑点迷彩服",
        ["bm_suit_var_jumpsuit_flecktarn_desc"] = "两个欧洲国家都在使用的经典迷彩服，它能轻松融入森林环境的能力增强了其在乡村地带的作战能力，但在城市地区这肯定是行不通的。",

        ["bm_suit_var_jumpsuit_flatgreen"] = "软黏绿",
        ["bm_suit_var_jumpsuit_flatgreen_desc"] = "据说这套衣服曾属于一个三人精神病罪犯组中的一员，是在一辆破损垃圾车旁找到的。据推测，这辆垃圾车被三人用于进行一场对GenSec运钞车的劫案，本次劫案中有多名SWAT死亡，还有许多人员受伤。而这些罪犯的身份依然是个谜。大多数证据都随着垃圾车的损坏被摧毁了，现场只留下了这件连身衣。",

        -- Color variations - Combat Harness  --tra
        ["bm_suit_var_loud_suit_default"] = "Professional Black",
        ["bm_suit_var_loud_suit_default_desc"] = "The two-piece has become somewhat of a brand recognition for the PAYDAY gang. Sharp, fashionable, allows you to blend in with the crowd. Simply iconic. 'Wait the fuck up! What fucking crowd?!', Chains exclaims as the gang drives to hit Murkywater's warehouse once more. He wishes he could have figured it out sooner.",

        ["bm_suit_var_loud_suit_white"] = "Frosty White",
        ["bm_suit_var_loud_suit_white_desc"] = "Provided by Jimmy for the Boiling Point job, these quickly proved out to be ineffective against harsh conditions of the job. It's not like Jimmy needed one, as he preferred rocking his two-piece anyway.",

        ["bm_suit_var_loud_suit_red"] = "Uncertain Red",
        ["bm_suit_var_loud_suit_red_desc"] = "Red is an interesting color to see on the battlefield. Either it's a medic, coming to save their teammates' lives, or the most dangerous bastard around. You decide who you'd be.",

        ["bm_suit_var_loud_suit_green"] = "Poison Green",
        ["bm_suit_var_loud_suit_green_desc"] = "Enough with the Grenadier bullying you. Gemma McShay provided you with a whole arsenal of poison-flavored armaments, so it's time to show these pigs who's the real pest control.",

        ["bm_suit_var_loud_suit_blue"] = "Police Blue",
        ["bm_suit_var_loud_suit_blue_desc"] = "Why aren't the cops rocking the ICTV, anyway?",

        ["bm_suit_var_loud_suit_purple"] = "Fashionable Purple",
        ["bm_suit_var_loud_suit_purple_desc"] = "Hide that one under your ICTV for a subtle touch of fashion in all your tactical nonsense.",

        ["bm_suit_var_loud_suit_brown"] = "Outdoor Brown",
        ["bm_suit_var_loud_suit_brown_desc"] = "Houston really wishes the gang could have stayed in a cozy urban jungle where he is at his best. But alas, there's too much money to be made in the country.",

        ["bm_suit_var_loud_suit_gorkagreen"] = "Forest Tactical",
        ["bm_suit_var_loud_suit_gorkagreen_desc"] = "Hides you well in the forest, or among all the money you're moving.",

        ["bm_suit_var_loud_suit_gorkaearth"] = "Murky Tactical",
        ["bm_suit_var_loud_suit_gorkaearth_desc"] = "Just how many uniforms does Murkywater produce? Could start their own fashion line at this point.",

        ["bm_suit_var_loud_suit_gorkagrey"] = "Urban Tactical",
        ["bm_suit_var_loud_suit_gorkagrey_desc"] = "No reason to don a suit when you walk into a bank now. Your face is all over the news anyway.",

        ["bm_suit_var_loud_suit_gorkapurple"] = "Purple Tactical",
        ["bm_suit_var_loud_suit_gorkapurple_desc"] = "You never know when you're going to stage a robbery in a purple jungle.",

        ["bm_suit_var_loud_suit_gorkasea"] = "Navy Tactical",
        ["bm_suit_var_loud_suit_gorkasea_desc"] = "Wolf got these back in 2011, when Bain proposed a yacht robbery. Unfortunately, they had to collect dust for almost six years.",
        -- Color variations - Sunny Side
        ["bm_suit_var_suit_sunny_default"] = "Casual Business",
        ["bm_suit_var_suit_sunny_default_desc"] = "Be the cheesy 90's action movie hero you've always aspired to be.",

        ["bm_suit_var_suit_sunny_skull"] = "Deadly Business",
        ["bm_suit_var_suit_sunny_skull_desc"] = "This little paintjob is what earned the Skulldozer his fearsome name. Show that it means nothing to you by reducing it to a simple decoration for your attire.",

        ["bm_suit_var_suit_sunny_red"] = "Bloody Business",
        ["bm_suit_var_suit_sunny_red_desc"] = "A Cloaker tied to a chair, the Alabama Razor, 'Troubles Always Inbound' playing... This shirt won't stay clean for long.",

        ["bm_suit_var_suit_sunny_blue"] = "Digital Business",
        ["bm_suit_var_suit_sunny_blue_desc"] = "Hackers are modern day wizards, able to do unimaginable things thanks to their sharp skills...  But hacks don't stop bullets. Ballistic vests do. So don't get too cocky and remember to protect yourself.",

        ["bm_suit_var_suit_sunny_green"] = "Greedy Business",
        ["bm_suit_var_suit_sunny_green_desc"] = "No matter the risk, you sweep the place clean out of all the loot. It's not even about money at that point, it's about staying true to yourself.",

        ["bm_suit_var_suit_sunny_yellow"] = "Sunshine Business",
        ["bm_suit_var_suit_sunny_yellow_desc"] = "Perfect for a romantic drive under the sun.\nWhile being chased by a dozen of police cars, of course.",

        ["bm_suit_var_suit_sunny_pink"] = "Smooth Business",
        ["bm_suit_var_suit_sunny_pink_desc"] = "Mr. Pink got lucky that Cabot's gang doesn't have color-coded attire.",

        ["bm_suit_var_suit_sunny_hawaii_black"] = "Miami Vacation",
        ["bm_suit_var_suit_sunny_hawaii_black_desc"] = "Wolf bought this stylish shirt way back when he heard that the Dentist is setting the gang up for the 'Hotline Miami' job. Who could have known that it would have nothing to do with Miami?",

        ["bm_suit_var_suit_sunny_hawaii_blue"] = "Cyber Vacation",
        ["bm_suit_var_suit_sunny_hawaii_blue_desc"] = "Joy is the kind of a person who would go far away for a vacation and just spend all of it playing videogames. 'Kids these days', Dallas thought, as he couldn't get her to enjoy playing pool, gazing at the sea, drinking unhealthy amounts of scotch and other old-fashioned vacation activities.",

        ["bm_suit_var_suit_sunny_hawaii_cyan"] = "Swimming Vacation",
        ["bm_suit_var_suit_sunny_hawaii_cyan_desc"] = "Sydney is an avid swimmer and has always been wondering why the Safehouse doesn't have a pool installed. Well, besides Aldstone having enough duties as is, swimming is not the most cherished hobby of the PAYDAY gang after the Green Bridge.",

        ["bm_suit_var_suit_sunny_hawaii_green"] = "Doghouse Vacation",
        ["bm_suit_var_suit_sunny_hawaii_green_desc"] = "Vlad enjoyed his time in Mexico greatly. New lands provided new opportunities, and he managed to expand fairly quickly, until one of his drug operations was hit all of sudden. The Federales were tipped by no one other than Buluc, who would become Vlad's main rival for a while. Good thing the PAYDAY gang is always on call.",

        ["bm_suit_var_suit_sunny_hawaii_orange"] = "Offshore Vacation",
        ["bm_suit_var_suit_sunny_hawaii_orange_desc"] = "That's it, you've made it. The White House job completed, all bad guys defeated, and your offshore spent on the greatest party ever. Where can we even go from here? \nEh, another bank heist won't hurt.",

        ["bm_suit_var_suit_sunny_hawaii_pink"] = "Dancing Vacation",
        ["bm_suit_var_suit_sunny_hawaii_pink_desc"] = "Chains doesn't often go on a vacation, but when he does, he lets himself all out. During his vacation around 2016, a video of his sleek dance moves went viral. He had to contact Bain in order to get it erased from the Internet forever.",

        ["bm_suit_var_suit_sunny_hawaii_red"] = "Far Vacation",
        ["bm_suit_var_suit_sunny_hawaii_red_desc"] = "Jimmy loves to tell a story of his nice tropical vacation interrupted by an army of genetically enhanced super soldiers. Sounds like one of his coke-induced fairy tales, but after the AKAN heist... Who even knows?",

        ["bm_suit_var_suit_sunny_payne"] = "Painless Vacation",
        ["bm_suit_var_suit_sunny_payne_desc"] = "During his vacation to Sao Paulo, Wolf decided to buy this shirt, but was given it for free instead, apparently as a sign of gratitude for what he had done for the city.\nWolf was confused because he had never been to Brazil.",

        ["bm_suit_var_suit_sunny_vice"] = "Viceless Vacation",
        ["bm_suit_var_suit_sunny_vice_desc"] = "You can't make Sangres wear anything but a flashy shirt no matter the occasion. As the most dangerous criminals gather round, all sharply dressed, Sangres comes in an old, worn out shirt he got on a garage sale in the city of Vice.",

        ["bm_suit_var_suit_sunny_security_red"] = "Red Bodyguard",
        ["bm_suit_var_suit_sunny_security_red_desc"] = "An elite member of Sosa's security. Ernesto Sosa thought he had it all. A big mansion, a reliable business and a robust security ensuring his safety. The world is his... Yet, the history is bound to repeat itself.",

        ["bm_suit_var_suit_sunny_security_purple"] = "Purple Bodyguard",
        ["bm_suit_var_suit_sunny_security_purple_desc"] = "An elite member of Sosa's security. 24/7 surveillance by drones and well coordinated guard shifts. Sosa's mansion is impenetrable. If only someone bothered to check the latest batch of yayo...",

        ["bm_suit_var_suit_sunny_soprano"] = "Mafia Business",
        ["bm_suit_var_suit_sunny_soprano_desc"] = "Although the mafia is not even close to the PAYDAY gang, but it is worth paying tribute to them - their style is excellent even in everyday life.",
        -- Color variations - Prison Suit
        ["bm_suit_var_suit_prison_default"] = "The Fugitive",
        ["bm_suit_var_suit_prison_default_desc"] = "The robes that have changed Hoxton forever. He was sure he burned this relic of the grim past along with the old safehouse, but somehow it found its way to the new one.",

        ["bm_suit_var_suit_prison_repairman"] = "The 31st",
        ["bm_suit_var_suit_prison_repairman_desc"] = "Ever wondered whose been setting up your spy cameras?\n\nWell, you can keep wondering, but at least you'll know what they're wearing.",

        ["bm_suit_var_suit_prison_comedy"] = "The Felon",
        ["bm_suit_var_suit_prison_comedy_desc"] = "The robes of Chins of the Paycheck Crew (in)fame. He almost made off with $225 from the Pear Store cash register, but was caught and sent to the custody. Thankfully, Chin's crewmates took one of the PearBooks hostage and managed to trade it for him.",

        ["bm_suit_var_suit_prison_vaultboy"] = "The Dweller",
        ["bm_suit_var_suit_prison_vaultboy_desc"] = "Surprisingly, Bain has never been into 'end of the world' conspiracies, but after the Meltdown heist he started building a small underground bomb shelter. Because you know. War.",

        ["bm_suit_var_suit_prison_janitor"] = "The Janitor",
        ["bm_suit_var_suit_prison_janitor_desc"] = "There are rumors going around the criminal underworld that OMNIA is conducting some top secret experiments. Stuff that would surpass even the likes of the legendary Henry's Rock. Even OMNIA's janitors have to sign a contract and be kept under control.",

        ["bm_suit_var_suit_prison_subject"] = "The Subject",
        ["bm_suit_var_suit_prison_subject_desc"] = "Jimmy got these off the test subjects before escaping from the AKAN's lab. Just in case those fatigues were the secret behind their outstanding abilities. Let's find out.",

        -- Weapon Colors
        ["bm_wskn_resmod_blackgold"] = "Black Gold",
        ["bm_wskn_resmod_cleangold"] = "Clean Gold",
        ["bm_wskn_resmod_imissfauna"] = "Ceres Gold",
        ["bm_wskn_resmod_imissfauna_desc"] = "Mother Nature would never betray you... right?",
        ["bm_wskn_resmod_ownthiscity"] = "Fleur Gold",
        ["bm_wskn_resmod_ownthiscity_desc"] = "It's our time now! Let's get this shit started!",
        ["bm_wskn_resmod_kindoffeel"] = "Abstract Dark Gold",
        ["bm_wskn_resmod_kindoffeel2"] = "Abstract Light Gold",
        ["bm_wskn_resmod_insubstantial"] = "Phased Gold",
        ["bm_wskn_resmod_palmtop"] = "Tiger Gold",
        ["bm_wskn_resmod_palmtop_desc"] = "The thing you wish for the most, is something you'll never get.",
        ["bm_wskn_resmod_lildonnie"] = "Pearl Gold",
        ["bm_wskn_resmod_quacko"] = "Blue Gold",
        ["bm_wskn_resmod_snake"] = "Liquid Gold",
        ["bm_wskn_resmod_camo"] = "Camo Gold",
        ["bm_wskn_resmod_camo2"] = "Haze Gold",
        ["bm_wskn_resmod_digital"] = "Digital Gold",
        ["bm_wskn_resmod_splinter"] = "Splinter Gold",
        ["bm_wskn_resmod_urban"] = "Urban Gold",
        ["bm_wskn_resmod_dioxide"] = "Carbon Gold",
        ["bm_wskn_resmod_topography"] = "Topography Gold",
        ["bm_wskn_resmod_2019"] = "Warfare Gold",
        ["bm_wskn_resmod_llenn"] = "Pink Devil",
        ["bm_wskn_resmod_llenn_desc"] = "This isn't exactly what I had in mind, but pink is pink.",

        ["menu_weapon_color_index_11"] = "Metal + Sights",
        ["menu_weapon_color_index_12"] = "Metal + Magazine",
        ["menu_weapon_color_index_13"] = "Metal + Sights + Magazine",

        -- Menu Buttons--
        ["bm_menu_btn_sell"] = "售出武器 ($price)",
        ["bm_menu_btn_buy_selected_weapon"] = "购买武器 ($price)",

        -- New menu stats--
        ["bm_menu_damage_shake"] = "抖动百分比",
        ["bm_menu_deflection"] = "血量减伤分数",
        ["bm_menu_regen_time"] = "回复所需时间",
        ["bm_menu_swap_speed"] = "切枪时间",
        ["bm_menu_standing_range"] = "衰减始距",
        ["bm_menu_moving_range"] = "衰减末距",

        ["bm_menu_attack_speed"] = "攻击间隔",
        ["bm_menu_impact_delay"] = "攻击前摇",
		
		["bm_menu_stats_detection"] = "Encumbrance",
		["bm_menu_stats_min_detection"] = "Encumbrance",
		["bm_menu_stats_max_detection"] = "Encumbrance",		

        ["bm_menu_pickup"] = "捡弹量",
        ["bm_menu_ads_speed"] = "瞄准时间",
        ["bm_menu_reload"] = "换弹时间",
        ["bm_menu_damage"] = "伤害", -- I gotta find out WHO KILLED MY DA- how to spoof the damage readout for melee ["bm_menu_damage"] = "Damage Max",
        ["bm_menu_damage_min"] = "最小伤害",

        -- Attachment type names--
        ["bm_menu_barrel_ext"] = "枪口",
        ["bm_menu_barrel_ext_plural"] = "枪口",
        ["bm_menu_foregrip"] = "护木",
        ["bm_menu_foregrip_plural"] = "护木",
        ["bm_menu_vertical_grip"] = "前握把",
        ["bm_menu_vertical_grip_plural"] = "前握把",
        ["bm_menu_bayonet"] = "刺刀",
        ["bm_menu_bayonet_plural"] = "刺刀",
        -- Spoof types--
        ["bm_menu_frame"] = "框架",
        ["bm_menu_whole_receiver"] = "机匣",
        ["bm_menu_shell_rack"] = "外壳机架",
        ["bm_menu_nozzle"] = "枪口",
        ["bm_menu_fuel"] = "燃料罐",
        ["bm_menu_cylinder"] = "弹筒",
        ["bm_menu_model"] = "样式",
        ["bm_menu_forebarrelgrip"] = "枪管&护木",
        ["bm_menu_riser"] = "镜桥",
        ["bm_menu_pump"] = "泵",

        ["bm_menu_upotte_barrel"] = "枪管",
        ["bm_menu_upotte_foregrip"] = "护木",
        ["bm_menu_upotte_stock"] = "枪托",
        ["bm_menu_jiisuri_stock"] = "枪托",
        ["bm_menu_upotte_grip"] = "握把",

        ["bm_menu_ro_barrel"] = "枪管",
        ["bm_menu_ro_stock"] = "枪托",
        ["bm_menu_ro_modifier"] = "改件",
        ["bm_menu_ro_charm"] = "挂件",
        ["bm_menu_ro_grip"] = "握把",

        -- Weapon categories--
        ["menu_pistol"] = "手枪",
        ["menu_akimbo_pistol"] = "双持手枪",
        --
        ["menu_light_pis"] = "轻型手枪",
        ["menu_heavy_pis"] = "重型手枪",

        ["menu_shotgun"] = "霰弹枪",
        ["menu_akimbo_shotgun"] = "双持霰弹枪",
        --
        ["menu_light_shot"] = "自动霰弹枪",
        ["menu_heavy_shot"] = "轻型霰弹枪",
        ["menu_break_shot"] = "重型霰弹枪",

        ["menu_smg"] = "冲锋枪",
        ["menu_lmg"] = "机枪", -- s
        ["menu_minigun"] = "加特林", -- s
        ["menu_akimbo_smg"] = "双持冲锋枪",
        --
        ["menu_light_smg"] = "轻型冲锋枪",
        ["menu_heavy_smg"] = "重型冲锋枪",

        ["menu_assault_rifle"] = "突击步枪",
        ["menu_snp"] = "狙击步枪",
        ["menu_akimbo_assault_rifle"] = "双持突击步枪",
        --
        ["menu_light_ar"] = "轻型突击步枪",
        ["menu_heavy_ar"] = "重型突击步枪",
        ["menu_dmr_ar"] = "神枪手突击步枪",

        --
        ["menu_light_mg"] = "轻机枪",
        ["menu_heavy_mg"] = "重机枪",
        ["menu_miniguns"] = "加特林机枪",

        --
        ["menu_light_snp"] = "轻型狙击步枪",
        ["menu_heavy_snp"] = "重型狙击步枪",
        ["menu_antim_snp"] = "反器材狙击步枪",

        ["menu_wpn_special"] = "特殊武器",

        ["menu_flamethrower"] = "火焰喷射器",

        ["menu_grenade_launcher"] = "火箭筒/榴弹",

        ["menu_saw"] = "电锯",

        ["menu_bow"] = "弓",
        ["menu_crossbow"] = "弩",

        ["menu_unsupported"] = "未受支持",

        ["st_menu_value"] = "卖出可得：",

        ["st_menu_skill_use"] = "技能归属：",
        ["st_wpn_akimbo"] = "双持+",
        ["st_wpn_assault_rifle"] = "突击步枪",
        ["st_wpn_snp"] = "狙击步枪",
        ["st_wpn_pistol"] = "手枪",
        ["st_wpn_shotgun"] = "霰弹枪",
        ["st_wpn_smg"] = "冲锋枪",
        ["st_wpn_lmg"] = "机枪",
        ["st_wpn_minigun"] = "冲锋枪", -- check
        ["st_wpn_crossbow"] = "弩",
        ["st_wpn_bow"] = "弓",
        ["st_wpn_saw"] = "电锯",
        ["st_wpn_grenade_launcher"] = "火箭筒/榴弹",
        ["st_wpn_wpn_special"] = "特殊武器",
        ["st_wpn_flamethrower"] = "喷火器",

        ["st_menu_firemode"] = "开火模式：", -- tra consider
        ["st_menu_firemode_semi"] = "单发",
        ["st_menu_firemode_auto"] = "连发",
        ["st_menu_firemode_burst"] = "速射",
        ["st_menu_firemode_burst_slamfire"] = "SLAMFIRE", -- tra SLAMFIRE 左轮撞击
        ["st_menu_firemode_burst_fanning"] = "FANNING", -- tra FANNING
        ["st_menu_firemode_burst_rapidfire"] = "RAPIDFIRE", -- tra RAPIDFIRE
        ["st_menu_firemode_burst_autoburst"] = "AUTOBURST", -- tra AUTOBURST
        ["st_menu_firemode_volley"] = "齐射",

        ["menu_reticle_dmc_eotech"] = "TECopt 圆准星",
        ["menu_reticle_dmc_eotech_moa"] = "TECopt MOA瞄点",
        ["menu_reticle_dmc_eotech_seggs"] = "TECopt分段准星",
        ["menu_reticle_dmc_ebr_cqb"] = "旋涡EBR-CQB准星",
        ["menu_reticle_dmc_trijicon_chevron"] = "三角V型准星",
        ["menu_reticle_dmc_ncstar"] = "侦查十字准星",
        ["menu_reticle_dmc_lua"] = "Lua制造!",
        ["menu_reticle_dmc_dot_4x4"] = "小型瞄点",
        ["menu_reticle_dmc_dot_2x2"] = "小巧瞄点",

        -- Blackmarket gui per-armor skill descriptions.
        ["bm_menu_armor_grinding_1"] = "无政府主义者每次回复的护甲值: #{skill_color}#$passive_armor_regen##",
        ["bm_menu_armor_grinding_2"] = "无政府主义者每次回复的护甲值: #{skill_color}#$passive_armor_regen## \n无政府主义者每次击中敌人回复的护甲值: #{skill_color}#$active_armor_regen##",
        ["bm_menu_dodge_grace"] = "成功闪避将使你获得#{skill_color}#$grace_bonus%##的无敌时间，最多#{skill_color}#300ms##。\n\n难度越高，受击无敌时间越短。", -- Bonus damage grace on dodge

        ["bm_menu_armor_max_health_store_1"] = "前总统存储血量上限: #{skill_color}#$health_stored##",
        ["bm_menu_armor_max_health_store_2"] = "前总统存储血量上限: #{skill_color}#$health_stored## \n前总统杀敌护甲回复速度加成: #{skill_color}#$regen_bonus%##"
    })
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
    LocalizationManager:add_localized_strings({
        ["bm_menu_bonus"] = "属性加成",
        ["steam_inventory_stat_boost"] = "属性加成",

        -- Safe House--
        ["dialog_safehouse_text"] = "你还没参观过安全屋\n\n不妨去看看，你可能会发现一些新东西！\n\n你现在想去看看吗？",

        ["bm_menu_custom_plural"] = "WEAPON ATTACHMENTS IN THE CUSTOM CATEGORY", -- unused?--

        ----Custom Weapon Mod Descriptions----

        -- Is there a reason these have to be down here? If not, I'll move them up with the others (custom weapons in their own section dw)--

        -- Triad Chi-Revolver [Custom]--
        ["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "为什么你要用过时的普通弹药来装备真气左轮枪？\n弹药拾取量变为133%。",
        ["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "用真气来炸穿护甲，盾牌与墙壁的感觉，真爽。\n以减少伤害为代价来获取穿甲，穿盾及穿墙的能力。",
        ["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "从未知来源获取的真气空尖弹。你唯一要知道的是这种弹药让你的后座力大增，然而基本上神挡杀神佛挡杀佛。\n该弹药类型极难通过捡弹补充。\n提高伤害，降低所有其他属性。\n弹药拾取量变为33%。",

        -- DECK-ARD [Custom]--
        ["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "射击他们直到死透为止。\n最大化伤害的同时降低所有其他属性。\n可以击穿护甲，盾牌与墙壁。\n该弹药类型极难通过捡弹补充。\n弹药拾取量变为33%。",
        ["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "射死他们。\n弹药拾取量变为133%。",

        -- Unknown Weapon--
        ["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "7.62毫米口径改装套件",
        ["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] = "武器口径改装为7.62毫米，增加伤害和精准度的同时减少稳定性和射速。",

        -- MK18 Specialist [Custom]--
        ["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "使用先进的弹药，以牺牲弹量和稳定性来获得更高的伤害和精准度。",
        ["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "马戈维尔握把",

        -- Unknown Weapon--
        ["bm_wp_wpn_fps_pis_noodle_m_8"] = "扩容弹匣",
        ["bm_wp_wpn_fps_pis_noodle_m_10"] = "扩容容弹匣",

        -- Jackal SMG(these are unused though)--
        ["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "把JACKAL冲锋枪改装成MASTIFF冲锋枪, 稳定性不如COYOTE冲锋枪，伤害不如JACKAL冲锋枪，但是它的子弹可以穿透盾牌和墙壁。",

        -- Unknown weapon--
        ["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "空尖弹在理论和实际上都可以对你的敌人造成巨大的伤口（伤害）。尽管空尖弹更难通过捡弹来获得，但是它们比普通弹药更精准，爆头伤害更高。",
        -- Unknown Weapon--
        ["bm_menu_weirdmagthing"] = "马戈维尔握把",

        -- Gecko 7.62--
        ["bm_wp_wpn_fps_ass_galil_m_drum"] = "75发弹鼓",

        -- Cavity 9mm--
        ["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "改装成中等威力手枪。\n弹药拾取量变为80%",

        -- DP-28 [Custom]--
        ["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "一个挂载弹药箱的三脚架。\n装备后移速减慢20%。",

        -- Arbiter--
        ["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "提供空爆功能的实验型瞄具。\n与燃烧弹药不兼容。", -- this weapon mod isn't vanilla though iirc--

        -- Itachi [Custom]--
        ["bm_wp_wpn_fps_upg_bajur_m_pants"] = "否",
        ["bm_wp_wpn_fps_upg_bajur_fg_dmr_desc"] = "将Itachi的上机匣改为.50 Beowulf变种，使得武器伤害极大提升，打在警察身上的弹孔也十倍大。\n降低精准度和威力以外的所有属性。",

        -- Union 5.56--
        ["bm_wp_corgi_b_short"] = "MSG枪管",

        -- Bipod--
        ["bm_sc_bipod_desc_pc"] = "在可用平面按 #{skill_color}#$BTN_BIPOD## 键放置/取消放置。\n放置后减小#{skill_color}#50%##的垂直后座力和#{skill_color}#75%##的水平后坐力并增加#{skill_color}#30%##的有效射程。\n\n额外选项可在恢复MOD#{item_stage_2}#其它设置##菜单中找到。",
        ["bm_sc_bipod_desc"] = "在可用平面按 #{skill_color}#$BTN_BIPOD## 键放置/取消放置。\n放置后减小#{skill_color}#50%##的垂直后座力和#{skill_color}#75%##的水平后坐力并增加#{skill_color}#30%##的有效射程。\n\n额外选项可在恢复MOD#{item_stage_2}#其它设置##菜单中找到。",
        ["hud_hint_bipod_moving"] = "移动时无法放置",
        ["hud_hint_bipod_slide"] = "滑行时无法放置",
        ["hud_hint_bipod_air"] = "在空中无法放置",
        ["hud_hint_bipod_lean"] = "探头时无法放置",

        ["hud_interact_autumn_disable"] = "已被 秋日队长 禁用！",

        ["hud_assault_restored_down"] = "本波突击存活，恢复 1 倒地次数",
        ["hud_assault_remaining_single"] = "距恢复倒地次数还剩 1 波突击",
        ["hud_assault_remaining_plural"] = " 波突击后恢复倒地次数",

        -- String override for the stungun--
        ["bm_melee_taser_info"] = "完全蓄力后可以释放高压电击晕敌人。",

        -- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

        ["bm_wp_pis_usp_b_match"] = "弗里曼套筒",
        ["bm_wp_1911_m_big"] = "骨灰盒弹匣",
        ["bm_wp_usp_m_big"] = "骨灰盒弹匣",
        ["bm_wp_upg_ass_ak_b_zastava"] = "长枪管",
        ["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf枪管",
        ["bm_wp_p90_b_ninja"] = "忍者枪管",
        ["bm_wp_par_b_short"] = "压缩枪管", -- Comped Barrel

        ["menu_es_rep_upgrade"] = "", -- ???--

        ["bm_w_lemming"] = "5/7 AP手枪",

        ["bm_w_x_judge"] = "Judge & Jury", -- really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
        ["bm_w_x_shrew"] = "Barry & Paul",
        ["bm_w_x_1911"] = "Mustang & Sally", -- 这是COD7的双持柯尔特1911的名字，雕在套筒上的
        ["bm_w_tec9"] = "T3K城市作战冲锋枪",
        ["bm_w_x_tec9"] = "双持T3K城市作战冲锋枪",

        ["bm_wp_mp5_fg_mp5sd"] = "SPOOC护木",
        ["bm_wp_hs2000_sl_long"] = "精英套筒",
        ["bm_wp_vhs_b_sniper"] = "亢奋枪管",
        ["bm_w_r0991"] = "AR-15猎兔步枪", -- KILLING FLOOR2的突击兵开局武器
        ["bm_wp_vhs_b_silenced"] = "恶棍德拉甘枪管",
        ["bm_wp_wpn_fps_lmg_shuno_body_red"] = "红色枪身",
        ["bm_wp_g3_b_sniper"] = "狙击枪管",
        ["bm_wp_g3_b_short"] = "短枪管",
        ["bm_wp_g3_m_psg"] = "狙击弹匣",
        ["bm_wp_g36_o_vintage_desc"] = "G36标配瞄具",
        -- ["bm_wp_shak12_body_vks"] = "加固枪身",

        ["bm_w_m590"] = "雷恩贝克890霰弹枪",
        ["bm_w_m590_desc"] = "在犯罪世界里最流行的霰弹枪的精神继承者又回来了！在保持了原版雷恩贝克霰弹枪的高伤害的同时，做了一些细节上的修改而使它的射速更快但是稳定性更差。",

        -- VMP HK416c Fixed Stock
        ["bm_wp_tecci_s_minicontra_alt"] = "SG固定枪托",

        ["bm_w_beck_desc"] = "在犯罪世界里最流行的霰弹枪又回来了，仍然在霰弹枪世界里拥有一席之地！最早在2011年的犯罪狂潮当中出现，这把霰弹枪被证明在近距离情况下非常可靠。",

        -- Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
        ["bm_menu_bonus_concealment_p1"] = "少量隐匿度加成，少量稳定性减少",
        ["bm_menu_bonus_concealment_p1_mod"] = "少量隐匿度加成",
        ["bm_menu_bonus_concealment_p2"] = "大量隐匿度加成，大量稳定性减少",
        ["bm_menu_bonus_concealment_p2_mod"] = "大量隐匿度加成",
        ["bm_menu_bonus_concealment_p3"] = "极大量隐匿度加成，极大量稳定性减少",
        ["bm_menu_bonus_concealment_p3_mod"] = "极大量隐匿度加成",
        ["bm_menu_bonus_spread_p1"] = "少量精准度加成，少量稳定性减少",
        ["bm_menu_bonus_spread_p1_mod"] = "少量精准度加成",
        ["bm_menu_bonus_spread_n1"] = "极大量稳定性加成，极大量精准度减少",
        ["bm_menu_bonus_recoil_p3_mod"] = "极大量稳定性加成",
        ["bm_menu_bonus_recoil_p1"] = "少量稳定性加成，少量精准度减少",
        ["bm_menu_bonus_recoil_p1_mod"] = "少量稳定性加成",
        ["bm_menu_bonus_recoil_p2"] = "大量稳定性加成，大量精准度减少",
        ["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "你和你的队友获得5%的额外经验。",
        ["bm_menu_spread"] = "精准度\n",
        ["bm_menu_recoil"] = "稳定性\n",
        ["bm_menu_concealment"] = "隐匿度\n",
        ["bm_menu_bonus_spread_p2_mod"] = "大量精准度加成",
        ["bm_menu_bonus_spread_p3_mod"] = "极大量精准度加成",
        ["bm_menu_bonus_recoil_p2_mod"] = "大量稳定性加成",
        ["bm_wp_upg_bonus_team_money_exp_p1"] = "金钱奖励加成",
        ["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "你和你的队友获得5%的额外金钱奖励。",

        ["bm_wp_upg_i_singlefire_desc"] = "锁定你的武器为\"单发射击\"",
        ["bm_wp_upg_i_autofire_desc"] = "锁定你的武器为\"连发射击\"",

        -- Fixed names for SMGS to ARs--
        ["bm_w_olympic"] = "Para步枪",
        ["bm_w_akmsu"] = "Krinkov步枪",
        ["bm_w_x_akmsu"] = "双持Krinkov步枪",
        ["bm_w_hajk"] = "CR 805B步枪",

        ["menu_akimbo_assault_rifle"] = "双持突击步枪",

        -- Perk Deck Throwables
        ["bm_grenade_copr_ability"] = "水蛭安瓿瓶",
        ["bm_grenade_damage_control"] = "修士酒壶",
        ["bm_grenade_smoke_screen_grenade_desc"] = "爆炸半径：#{skill_color}#4##米 \n持续时间：#{skill_color}#12##秒 \n引爆：静止#{skill_color}#1##秒后 \n\n扔一颗烟雾弹，消失在烟幕中，让你的敌人更难瞄准你。",

        -- Throwables--
        ["bm_grenade_xmas_snowball_desc"] = "伤害：#{risk}#240## \n爆炸半径：#{skill_color}#1##米 \n恢复速度：每#{skill_color}#25##秒一个 \n\n沉进水里，再丢进冰箱，你就拥有了一件致命的投掷武器。就那么简单。",
        ["bm_concussion_desc"] = "爆炸半径：#{skill_color}#10##米 \n晕眩敌人最长#{skill_color}#4##秒 \n#{skill_color}#7##秒内敌人精准度减少#{skill_color}#50%## \n#{skill_color}#晕眩##所有范围内的敌人，#{important_1}#泰坦盾兵、泰坦熊和队长##除外。\n\n这个可爱的小玩意可以震瞎附近所有人的狗眼，给你额外的时间击杀他们。",
        ["bm_grenade_frag_desc"] = "伤害：#{risk}#800## \n爆炸半径：#{skill_color}#5##米 \n引爆：#{skill_color}#3##秒后 \n\n就是一颗高爆手榴弹，还有什么好说的？",
        ["bm_dynamite_desc"] = "伤害：#{risk}#800## \n爆炸半径：#{skill_color}#4##米 \n引爆：#{skill_color}#3##秒后 \n\n不会到处滚动或弹跳，但是爆炸半径略低一点。\n设计是用来炸石头的，当然也可以用来炸人。",
        ["bm_grenade_frag_com_desc"] = "伤害：#{risk}#800## \n爆炸半径：#{skill_color}#5##米 \n引爆：#{skill_color}#3##秒后 \n\n就是一颗换了皮的高爆手榴弹，OVERKILL那性子没什么好说的。",
        ["bm_grenade_dada_com_desc"] = "伤害：#{risk}#800## \n爆炸半径：#{skill_color}#5##米 \n引爆：#{skill_color}#3##秒后 \n\n娃娃的外表炸弹的心，来自祖国母亲的爱。",
        ["bm_grenade_molotov_desc"] = "伤害（火焰）：#{skill_color}#10##秒内造成#{heat_warm_color}#1200##点伤害 \n伤害（点燃）：#{skill_color}#3##秒内造成#{heat_warm_color}#60##点伤害 \n火焰半径：#{skill_color}#3.75##米 \n持续时间（火焰）：#{skill_color}#10##秒\n引爆：#{skill_color}#撞击物体##时 \n有#{skill_color}#50%##的概率点燃敌人并使其陷入硬直。\n\n玻璃瓶、可燃液体与一块碎布的完美结合，简单而有效。",
        ["bm_grenade_fir_com_desc"] = "伤害（火焰）：#{skill_color}#12##秒内造成#{heat_warm_color}#1440##点伤害 \n伤害（点燃）：#{skill_color}#3##秒内造成#{heat_warm_color}#60##点伤害 \n火焰半径：#{skill_color}#3.75##米 \n持续时间（火焰）：#{skill_color}#12##秒 \n引爆：#{skill_color}#2.5##秒后 \n有#{skill_color}#50%##的概率点燃敌人并使其陷入硬直。\n\n白磷手榴弹，适合反弹到敌人那边点燃他们。",
        ["bm_wpn_prj_ace_desc"] = "伤害：#{skill_color}#240## \n\n拥有锋利边缘的加重纸牌，金牌杀手口袋里的必备物品。",
        ["bm_wpn_prj_four_desc"] = "伤害（击中）：#{skill_color}#200## \n伤害（毒素）： #{skill_color}#4##秒内造成#{stats_positive}#120##点伤害 \n每#{skill_color}#0.5##秒有#{skill_color}#50%##的几率干扰敌人 \n\n流星镖拥有悠久的充满血腥的历史，纯钢打造的淬毒武器是你面对的敌人最可怕的噩梦。",
        ["bm_wpn_prj_target_desc"] = "伤害：#{skill_color}#240## \n\n精准而有效的无声杀人武器。兜里揣两把，干啥都不怕。",
        ["bm_wpn_prj_jav_desc"] = "伤害：#{skill_color}#360## \n\n从远古时期开始，标枪就被证明是非常有效的武器，尽管它只是由一根木棍和一个尖头组成的。",
        ["bm_wpn_prj_hur_desc"] = "伤害：#{skill_color}#360## \n\n他们说锋利的斧头永远是对的，所以一把飞斧当然不会错。",
        ["bm_grenade_electric_desc"] = "伤害：#{ghost_color}#400## \n爆炸半径：#{skill_color}#5##米 \n引爆：#{skill_color}#3##秒后 \n\n比起普通的高爆手雷，电击手雷加了一点点调味料。雷电法王的珍藏。",
        ["bm_grenade_poison_gas_grenade"] = "蝰蛇-6 手雷",
        ["bm_grenade_poison_gas_grenade_desc"] = "伤害：#{skill_color}#10##秒内造成#{stats_positive}#300##点伤害 \n爆炸半径：#{skill_color}#6##米 \n持续时间（毒雾）：#{skill_color}#12##秒 \n引爆：静止#{skill_color}#1##秒后 \n\n-有#{skill_color}#100%##的几率使范围内敌人中毒陷入硬直，但敌人不会反复中同一片毒雾的硬直\n-#{important_1}#盾兵、熊、掷弹兵和队长对毒雾带来的硬直效果免疫##\n\n这个实验性的生物武器只会释放针对特定基因型的大范围有毒气体，因此对你和你的队员无效。中毒的受害者会出现剧烈的咳嗽、恶心、呕吐等症状，甚至可以致命！除了那些最坚强的佼佼者......\n\n是老道劫匪的理想武器之一喵。",
        ["bm_grenade_poison_gas_grenade_desc_short"] = "伤害：#{skill_color}#10##秒内造成#{stats_positive}#300##点伤害 \n爆炸半径：#{skill_color}#6##米 \n持续时间（毒雾）：#{skill_color}#12##秒 \n引爆：静止#{skill_color}#1##秒后 \n\n-有#{skill_color}#100%##的几率使范围内敌人中毒陷入硬直，但敌人不会反复中同一片毒雾的硬直\n-#{important_1}#盾兵、熊、掷弹兵和队长对毒雾带来的硬直效果免疫##",
        ["bm_grenade_sticky_grenade"] = "粘性手雷",
        ["bm_grenade_sticky_grenade_desc"] = "伤害：#{risk}#800## \n爆炸半径：#{skill_color}#4##米 \n引爆：#{skill_color}#2.5##秒后\n\n可粘附在敌人身上或物体表面的投掷爆炸物。",

        ["bm_wp_wpn_fps_upg_scar_m203_buckshot"] = "40MM鹿弹",
        ["bm_wp_wpn_fps_upg_scar_m203_buckshot_desc"] = "每颗榴弹内装6颗超大号弹丸。\n总弹量：15\n伤害：360\n精准度：40\n有效射程：9米\n最大射程：18米",
        ["bm_wp_wpn_fps_upg_scar_m203_flechette"] = "40MM箭弹",
        ["bm_wp_wpn_fps_upg_scar_m203_flechette_desc"] = "每颗榴弹内装12枚箭弹。\n总弹量：20\n伤害：240\n精准度：50\n有效距离：11米\n最大射程：22米",

        ["bm_wp_wpn_fps_upg_g3m203_gre_buckshot"] = "40MM鹿弹",
        ["bm_wp_wpn_fps_upg_g3m203_gre_buckshot_desc"] = "每颗榴弹内装6颗超大号弹丸。\n总弹量：15\n伤害：360\n精准度：40\n有效射程：9米\n最大射程：18米",
        ["bm_wp_wpn_fps_upg_g3m203_gre_flechette"] = "40MM箭弹",
        ["bm_wp_wpn_fps_upg_g3m203_gre_flechette_desc"] = "每颗榴弹内装12枚箭弹。\n总弹量：20\n伤害：240\n精准度：50\n有效距离：11米\n最大射程：22米"
    })

    
        --[[ 
            WepNames Options
            1 = do nothing, use resmod default/in-universe names (i.e. Crosskill Operator, Bootleg)
            2 = same as 1, but no nicknames (i.e. Bootleg > SG 416c)
            3 = real names (i.e. SA 1911 Operator, HK 416c)
        ]]
        if weapon_names then
        if weapon_names <= 2 then --Resmod names
            LocalizationManager:add_localized_strings({ 
                --[[ PISTOLS ]]
                    --Gecko Pistol
                    ["bm_w_maxim9"] = "Gecko M2",
                    ["bm_w_x_maxim9"] = "Akimbo Gecko M2s",
                    --Igor (APS)
                    ["bm_w_stech"] = "Igor Automatik",
                    ["bm_w_x_stech"] = "Akimbo Igor Automatiks",
                    --Chimano Compact
                    ["bm_wp_pis_g26"] = "Chimano 26 Compact",
                    ["bm_w_jowi"] = "Akimbo Chimano 26 Compacts",
                    --Glock 18c
                    ["bm_w_glock_18c"] = "Chimano 18C",
                    ["bm_w_x_g18c"] = "Akimbo Chimano 18Cs",
                    --CZ 75
                    ["bm_w_czech"] = "Czech 92",
                    ["bm_w_x_czech"] = "Akimbo Czech 92s",
                    --PPK (Gruber)
                    ["bm_w_ppk"] = "Gruber Kurz",
                    ["bm_w_x_ppk"] = "Akimbo Gruber Kurzes",
                    --M13
                    ["bm_w_legacy"] = "M13",
                    ["bm_w_x_legacy"] = "Akimbo M13s",  
                    --Glock 17
                    ["bm_w_glock_17"] = "Chimano 88",
                    ["bm_w_x_g17"] = "Akimbo Chimano 88s",
                    --Bernetti 9
                    ["bm_w_b92fs"] = "Bernetti 92",
                    ["bm_w_x_b92fs"] = "Akimbo Bernetti 92s",
                    --White Streak
                    ["bm_w_pl14"] = "White Streak",
                    ["bm_w_x_pl14"] = "Akimbo White Streaks",
                    --Holt 9mm
                    ["bm_w_holt"] = "HOLT 9mm",
                    ["bm_w_x_holt"] = "Akimbo HOLT 9mms",
                    --FMG-9
                    ["bm_w_fmg9"] = "Wasp DS-9",
                    --93R
                    ["bm_w_beer"] = "Bernetti 93R",
                    --Contractor Pistols 
                    ["bm_w_packrat"] = "Contractor M30",
                    ["bm_w_x_packrat"] = "Akimbo Contractor M30s",
                    --Breech (Luger) 
                    ["bm_w_breech"] = "Parabellum-08",
                    --Chimano Custom
                    ["bm_w_g22c"] = "Chimano Custom",
                    ["bm_w_x_g22c"] = "Akimbo Chimano Customs",
                    --Signature .40
                    ["bm_w_p226"] = "Signature .40",
                    --LEO
                    ["bm_w_hs2000"] = "LEO-40",
                    ["bm_wp_hs2000_sl_long"] = "Elite Slide",
                    --5/7 pistol
                    ["bm_w_lemming"] = "Acuto 5/7",
                    --Baby Deagle--
                    ["bm_w_sparrow"] = "Sparrow 941",
                    --Crosskill
                    ["bm_w_colt_1911"] = "Crosskill Operator II",
                    ["bm_w_x_1911"] = "Mustang & Sally",
                    ["bm_wp_1911_m_big"] = "Casket Magazine",
                    --Crosskill Chunky
                    ["bm_w_m1911"] = "Crosskill A1",
                    --Crosskill Guard
                    ["bm_w_shrew"] = "Crosskill Guard",
                    ["bm_w_x_shrew"] = "Barry & Paul",
                    --USP 
                    ["bm_w_usp"] = "Interceptor-45",
                    ["bm_w_x_usp"] = "Akimbo Interceptor-45s",
                    ["bm_wp_usp_m_big"] = "Casket Magazine",
                    ["bm_wp_pis_usp_b_match"] = "Freeman Slide",
                    --Model 54 
                    ["bm_w_type54"] = "CC-33",
                    ["bm_w_x_type54"] = "Akimbo CC-33s",
                    --Broomstick--
                    ["bm_w_c96"] = "Broomstick",
                    ["bm_wp_c96_nozzle"] = "BlasTech DL-44 Muzzle",
                    --Sub2000
                    ["bm_w_sub2000"] = "Cavity .40",
                    --Deagle
                    ["bm_w_deagle"] = "Deagle",
                    ["bm_w_x_deagle"] = "Akimbo Deagles",
                    --Kahn .357
                    ["bm_w_korth"] = "Kahn .357",
                    ["bm_w_x_korth"] = "Akimbo Kahn .357s",
                    --Matever 2006m
                    ["bm_w_mateba"] = "Matever 9mm", --:^)
                    ["bm_wp_2006m_b_short"] = "Tachikoma Barrel",   
                    ["bm_wp_2006m_b_medium"] = "Togusa Barrel", 
                    ["bm_wp_2006m_b_long"] = "Kusanagi Barrel", 
                    ["bm_w_x_2006m"] = "Akimbo Matevers",
                    --Frenchman Model 87
                    ["bm_w_model3"] = "Frenchman 87",   
                    ["bm_w_x_model3"] = "Akimbo Frenchman 87s", 
                    --Raging bull
                    ["bm_w_raging_bull"] = "Bronco .44",    
                    ["bm_w_x_rage"] = "Akimbo Bronco .44s",
                    --Castigo
                    ["bm_w_chinchilla"] = "Castigo .44",
                    ["bm_w_x_chinchilla"] = "Akimbo Castigo .44s",
                    --RUS-12
                    ["bm_w_rsh12"] = "RUS-12",
                    --SAA/Peacemaker
                    ["bm_w_peacemaker"] = "Peacemaker .45LC",
                    --CUSTOM PISTOLS
                        --Px4
                        ["bm_w_px4"] = "Bernetti Hx4 Canaan",
                        --Browning Hi-Power
                        ["bm_w_hpb"] = "Hi-Power",
                        --Browning Hi-Power (Mira)
                        --["bm_w_hpb"] = "Hi-Power",
                        --Walther P99
                        ["bm_w_p99"] = "Gruber 99",
                        --Derringer
                        ["bm_w_derringer"] = "Derringer",
                        --Automag .44
                        ["bm_w_amt"] = "Automag .44",
                        --Colt Detective
                        ["bm_w_coltds"] = "Crosskill Investigator",
                        --SIG P320
                        ["bm_w_papa320"] = "Signature M19",
                        ["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "32 Round Magazine",
                --[[ SMGs ]]
                    --Kobus 90--
                    ["bm_w_p90"] = "Project-90",
                    ["bm_w_x_p90"] = "Akimbo Project-90s",
                    ["bm_wp_p90_b_ninja"] = "Ninja Barrel",
                    ["bm_wp_90_body_boxy"] = "OMNIA Assault Stock",
                    --Spec Ops
                    ["bm_w_mp7"] = "SpecOps-7",
                    --Tec-9
                    ["bm_w_tec9"] = "T3K Urban",
                    ["bm_w_x_tec9"] = "Akimbo T3K Urbans",
                    --Heather
                    ["bm_w_sr2"] = "Heather-2M",
                    ["bm_w_x_sr2"] = "Akimbo Heather-2Ms",
                    --CMP
                    ["bm_w_mp9"] = "CMP-9",
                    --Miyaka
                    ["bm_w_pm9"] = "Miyaka 9 Special",
                    --Micro Uzi
                    ["bm_w_baka"] = "Micro Uzi",
                    ["bm_w_x_baka"] = "Akimbo Micro Uzis",
                    --Cobra/Skorpion
                    ["bm_w_scorpion"] = "Cobra",
                    ["bm_w_x_scorpion"] = "Akimbo Cobras",
                    ["bm_wp_scorpion_m_extended"] = "Dual Magazines",
                    --Tatonka
                    ["bm_w_coal"] = "Tatonka",
                    --AK Gen
                    ["bm_w_vityaz"] = "AK Gen 21 Tactical",
                    --Signature SMG
                    ["bm_w_shepheard"] = "Signature-10",
                    --Compact-5/MP5
                    ["bm_w_mp5"] = "Compact-5", 
                    ["bm_w_x_mp5"] = "Akimbo Compact-5s",
                    ["bm_wp_mp5_fg_mp5sd"] = "SPOOC Foregrip",
                    --Swedish K
                    ["bm_w_m45"] = "Swedish K",
                    --Pachett/Sterling
                    ["bm_w_sterling"] = "Patchette L2A1",
                    ["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
                    --Uzi
                    ["bm_w_uzi"] = "Uzi",
                    --Chicago Typewriter
                    ["bm_w_m1928"] = "Chicago Typewriter",
                    --Mark 10
                    ["bm_w_mac10"] = "Mark 10",
                    ["bm_w_x_mac10"] = "Akimbo Mark 10s",
                    --MP40
                    ["bm_w_erma"] = "MP 40",
                    --Jackal
                    ["bm_w_schakal"] = "Jackal",
                    --Kross Vertex
                    ["bm_w_polymer"] = "Kross Vertex",
                    --CUSTOM SMGs
                        --AR57
                        ["bm_w_alpha57_prim"] = "FSS Hurricane",
                        --LWRC
                        ["bm_w_smg45"] = "FT Striker .45",
                        --Typhoon
                        ["bm_w_crysis3_typhoon"] = "CRYNET Typhoon",
                --[[ MGs ]]
                    --Bootleg/HK416c
                    ["bm_w_tecci"] = "Bootlegger",
                    ["bm_wp_tecci_s_minicontra_alt"] = "SG Fixed Stock",
                    --KSP/M249
                    ["bm_w_m249"] = "KSP-90",
                    --ChainSAW
                    ["bm_w_kacchainsaw"] = "Campbell 74",
                    --RPK
                    ["bm_w_rpk"] = "RPK",
                    --Brenner 21/HK21
                    ["bm_w_hk21"] = "Brenner-21",
                    --M60
                    ["bm_w_m60"] = "M60",
                    --Ksp 58
                    ["bm_w_par"] = "KSP-58B",
                    ["bm_wp_par_b_short"] = "Comped Barrel",
                    --Buzzsaw/Mg42
                    ["bm_w_mg42"] = "Buzzsaw-42",
                    --Versteckt-51/HK51B
                    ["bm_w_hk51b"] = "Versteckt-51B",
                    --Microgun
                    ["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Red Body",

                --[[ SHOTGUNS ]]
                    --Grimm
                    ["bm_w_basset"] = "Grimm 12G",  
                    --Saiga
                    ["bm_w_saiga"] = "IZHMA 12G",
                    --AA12
                    ["bm_w_aa12"] = "Steakout 12G",
                    --Spas12
                    ["bm_w_spas12"] = "Predator 12G",
                    --Benelli
                    ["bm_w_benelli"] = "M1014",
                    --Argos III
                    ["bm_w_ultima"] = "Argos III",
                    --Street Sweeper
                    ["bm_w_striker"] = "Street Sweeper",
                    --Goliath
                    ["bm_w_rota"] = "Goliath 12G",
                    --VD-12
                    ["bm_w_sko12"] = "VD-12",
                    ["bm_w_x_sko12"] = "Akimbo VD-12s",
                    --GSPS
                    ["bm_w_m37"] = "GSPS 12G",
                    --Supernova
                    ["bm_w_supernova"] = "Deimos",
                    --Loco
                    ["bm_w_serbu"] = "Locomotive 12G",
                    --Reinfeld 88
                    ["bm_w_m1897"] = "Repeater 1897",
                    --Mosconi 12g
                    ["bm_w_m590"] = "Mosconi Tactical 12G",
                    --R870
                    ["bm_w_r870"] = "Reinfeld 880",
                    --KSG
                    ["bm_w_ksg"] = "Raven 12G",
                    --Breaker 10g
                    ["bm_w_boot"] = "Breaker 10G",
                    --Claire Angélique Florette du Bertrand
                    ["bm_w_coach"] = "Claire S/S 12G",
                    --Mosconi
                    ["bm_w_huntsman"] = "Mosconi S/S 12G",
                    --Judge
                    ["bm_w_judge"] = "The Judge",
                    ["bm_w_x_judge"] = "Judge & Jury", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
                    --Joceline
                    ["bm_w_b682"] = "Joceline O/U 12G", 
                    --Custom Shotguns
                        --Doomstick
                        ["bm_w_quadbarrel"] = "Doomstick",
                        --Widowmaker TX
                        ["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "Extended Magazine",
                        ["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "Burst Fire System",
                --[[ ARs ]]
                    --S552
                    ["bm_w_s552"] = "Commando 552",
                    --M733/AMCAR
                    ["bm_w_amcar"] = "AM-CAR",
                    --G36
                    ["bm_w_g36"] = "JP36",
                    --VHS/Lion's Roar
                    ["bm_w_vhs"] = "Lion's Roar",
                    ["bm_wp_vhs_b_sniper"] = "Hyper Barrel",
                    ["bm_wp_vhs_b_silenced"] = "Bad Dragan Barrel",
                    --Olympic/Para
                    ["bm_w_olympic"] = "Para-23",
                    ["bm_w_x_olympic"] = "Akimbo Para-23s",
                    --TAR-21
                    ["bm_w_komodo"] = "Tempest-95",
                    --Famas
                    ["bm_w_famas"] = "Clarion 5.56",
                    --M4/CAR-4
                    ["bm_w_m4"] = "CAR-4",
                    ["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf Barrel",
                    ["bm_wp_upg_s_fixed"] = "CAR Fixed Stock",
                    --AK5
                    ["bm_w_ak5"] = "Ak 5",
                    --Union 5.56
                    ["bm_w_corgi"] = "Union 5.56",
                    ["bm_wp_corgi_b_short"] = "MSG Barrel",
                    --UAR
                    ["bm_w_aug"] = "UAR A2",
                    ["bm_wp_upg_b_hbar"] = "Heavy Barrel",  
                    --AK17
                    ["bm_w_ak12"] = "AK-17",
                    --AK 5.45
                    ["bm_w_ak74"] = "AK 5.45",
                    --CR 805
                    ["bm_w_hajk"] = "CR 805B",
                    --AMR-16
                    ["bm_w_m16"] = "AMR-16",
                    --Queen's Wrath
                    ["bm_w_l85a2"] = "Queen's Wrath",
                    --AK 7.62
                    ["bm_w_akm"] = "AK 7.62",
                    ["bm_w_akm_gold"] = "Golden AK 7.62",
                    ["bm_wp_upg_ass_ak_b_zastava"] = "Long Barrel",
                    --KETCHUPKNOB--
                    --ASPIRING POKEMON TRAINER, ASH KETCHNOV--
                    ["bm_w_groza"] = "OB-14st Byk-1", --Hopefully less silly than its Ketchup name
                    --"OB-14st" being an awful combo of "Oblast" (a word for region/zone/area, as well as literally having BLAST in the name) and the "14" in "OTs-14"
                    --Although, a Russian word for "region/zone/area" followed up with a Polish word...
                    --Eh, whatever
                    --CHIKUBI
                    ["bm_w_tkb"] = "Rodion 3B",
                    ["bm_wp_tkb_m_bakelite"] = "Siberian 15x3 Magazine",
                    --Krinkov
                    ["bm_w_akmsu"] = "Krinkov",
                    --Akimbo Krinkov
                    ["bm_w_x_akmsu"] = "Akimbo Krinkovs",
                    --CUSTOM ARs
                        --AN-94/92
                        ["bm_w_tilt"] = "KVK-99",
                        --HK G36
                        ["bm_w_g36k"] = "SG36K",
                        --SCAR-L
                        ["bm_w_scarl"] = "Eagle Light",
                        --Valmet Rk.62
                        ["bm_w_rk62"] = "Velmer",
                        --MW22 Honey Badger
                        ["bm_w_mcbravo"] = "Chimera",
                        --AR-18
                        ["bm_w_ar18"] = "CAR-18",
                --[[ DMRs ]]
                    --Little Friend
                    ["bm_w_contraband"] = "Bigger Friend 7.62",
                    --FAL
                    ["bm_w_fal"] = "Falcon 58",     
                    --ASS VAL
                    ["bm_w_asval"] = "Valkyria",
                    --Galil
                    ["bm_w_galil"] = "Defender 7.62",
                    --SCAR
                    ["bm_w_scar"] = "Eagle Heavy",          
                    --Galant--
                    ["bm_w_ching"] = "M1 Galant",
                    --M308
                    ["bm_w_m14"] = "M308",
                    --G3
                    ["bm_w_g3"] = "Gewehr-3",
                    ["bm_wp_g3_b_sniper"] = "Macro Barrel",
                    ["bm_wp_g3_b_short"] = "Micro Barrel",
                    --KS12
                    ["bm_w_shak12"] = "KS-12 Urban",
                    --HCAR
                    ["bm_w_hcar"] = "Akron HC",
                    
                    --Custom DMRs
                        --MCX Spear
                        ["bm_w_mcx_spear"] = "Signature M7",
                        ["bm_w_ngsierra"] = "Amicus 277",
                        --VSS
                        ["bm_w_vss"] = "Viktoriya",
                        --G3 HK79
                        ["bm_w_g3hk79"] = "Gewehr-A3 w/ GL79",
                        --BO3 XR2
                        ["bm_w_xr2"] = "XR-2",
                        --SIERRA .458
                        ["bm_w_sierra458"] = "Sierra .458",
                --[[ SNIPERS ]]
                    --MSR
                    ["bm_w_msr"] = "Rattlesnake",   
                    --R700
                    ["bm_w_r700"] = "Reinfeld Model 700",   
                    --QBU88
                    ["bm_w_qbu88"] = "Káng Arms X1",
                    --Winchester 1874
                    ["bm_w_winchester1874"] = "Repeater 1874",  
                    --TTI(TTY)
                    ["bm_w_tti"] = "Tecci Tactical .308",
                    --Icky Vicky
                    ["bm_w_victor"] = "SA North Star",
                    --Scunt
                    ["bm_w_scout"] = "Pronghorn",
                    --AWP
                    ["bm_w_awp"] = "Amaroq 900",
                    --WA2000
                    ["bm_w_wa2000"] = "Lebensauger .300",
                    --Rangerhitter
                    ["bm_w_sbl"] = "Rangehitter Mk. 2", --It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
                    --Contender G2
                    ["bm_w_contender"] = "Aran G2",
                    --Model 70
                    ["bm_w_model70"] = "Platypus 70",
                    --SVD
                    ["bm_w_siltstone"] = "Grom",
                    --Mosin--
                    ["bm_w_mosin"] = "Nagant",
                    --Desert Fox
                    ["bm_w_desertfox"] = "Desertfox",
                    --R93
                    ["bm_w_r93"] = "R93",
                    --Thanatos--
                    ["bm_w_m95"] = "Thanatos .50 BMG",
                    --Custom Snipers
                        --Guerilla
                        ["bm_w_sgs"] = "Guerilla 542",  
                        --M107
                        ["bm_w_m107cq"] = "Mors .50 BMG",
                        --M200
                        ["bm_w_m200"] = "TF-141",
                        --Marlin 1894
                        ["bm_w_m1894"] = "Mare's Leg",
                        --SPX Centerfire
                        ["bm_w_moss464spx"] = "Mosconi SPX",
                        --Winchester 1894
                        ["bm_w_winchester1894"] = "Repeater 1894",
                        --SVD
                        ["bm_w_svd"] = "SV7",
                        ["bm_wp_wpn_fps_snp_svd_pso"] = "SV7 Scope",
                        --L115
                        ["bm_w_l115"] = "AIM 90M",
                --[[ LAUNCHERS & BOWS ]]
                    --GL40      
                    ["bm_w_gre_m79"] = "GL-40",
                    --3GL
                    ["bm_w_ms3gl"] = "Basilisk 3GL",
                    --PIGLET/M32
                    ["bm_w_m32"] = "Piglet",
                    --China Puff
                    ["bm_w_china"] = "China Puff",
                    --Compact 40mm
                    ["bm_w_slap"] = "Compact 40mm",
                    --Arbiter
                    ["bm_w_arbiter"] = "Arbiter",
                    --RPG
                    ["bm_w_rpg7"] = "HRL-7",
                    --COMMANDO 101/M202 FLASH
                    ["bm_w_ray"] = "Commando 101 FLASH",
                --[[ UNIVERSAL ATTACHMENTS ]]
                    --MUZZLE DEVICES
                    ["bm_wp_upg_ns_ass_smg_stubby"] = "Stubby Flash Hider",
                    --SIGHTS
                    ["bm_wpn_fps_upg_o_hamr"] = "Trigonom SCRW Scope",
            })
        end

        if weapon_names == 2 then --Resmod names (No nicknames)
            LocalizationManager:add_localized_strings({ 

                ["bm_w_pl14"] = "WS-14",
                ["bm_w_g22c"] = "Chimano 22C",
                ["bm_w_x_g22c"] = "Akimbo Chimano 22Cs",
                ["bm_w_x_1911"] = "Akimbo Operator IIs",
                ["bm_w_schakal"] = "AMP 45",
                ["bm_w_tecci"] = "SG 416C",
                ["bm_w_x_judge"] = "Akimbo Judges",
                ["bm_w_vhs"] = "HVH-2",
                ["bm_w_contraband"] = "SG 417D"
    
            })
        elseif weapon_names == 3 then --DMCWO Reelnames
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
                    ["bm_wp_beretta_co_co2"] = "Competition Compensator", --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models    were based off of airsoft counterparts
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
                    ["bm_sub2000_sc_desc"] = "One of the guns that has ever been made. Tiny pistol bullets hit a lot harder when coming out of a longer barrel and its folding capability makes for decent concealment.",
                    ["bm_wp_sub2000_fg_gen2"] = "Gen2 Handguard",
                    ["bm_wp_sub2000_fg_railed"] = "Red Lion R6 Handguard",
                    ["bm_wp_sub2000_fg_suppressed"] = "Quad Rail Handguard w/Suppressor",
                    --C96
                    ["bm_w_c96"] = "Mauser C96",
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
                    --Castigo
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
                    ["bm_p90_sc_desc"] = "A bullpup SMG and competitor to the MP7. Frequently commented on as looking like a futuristic space gun.\n\n#{skill_color}#Deals 80% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
                    ["bm_wp_p90_b_long"] = "PS90 Barrel",
                    ["bm_wp_p90_b_civilian"] = "Moerse Lekker Barrel Shroud",
                    --MP7
                    ["bm_w_mp7"] = "H&K MP7A2", --PD2's version kinda existed before the real MP7A2 was a thing so there's still some MP7A1 bits on it but w/e
                    ["bm_mp7_sc_desc"] = "A lightweight SMG and competitor to the P90 SMG. Doesn't have an undermounted grenade launcher as some sources may lead you to believe.\n\n#{skill_color}#Deals 80% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
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
                    ["bm_sr2_sc_desc"] = "Utilizing a specialized 9×21mm round, the SR-2M is the Russian answer to the P90 and MP7 SMGs.\n\n#{skill_color}#Deals 80% of its damage through body armor and headshots deal 50% more damage to non-captain enemies.##",
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
                    ["bm_w_x_mp5"] = "Akimbo MP5A2s",
                    ["bm_mp5_sc_desc"] = "The little sister to the G3.\nFast-firing, accurate and easy to handle, what more could you want out of an SMG?",
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
                    ["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel",
                    ["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
                    ["bm_wp_sterling_m_short"] = "15rnd L2A1 Magazine",
                    ["bm_wp_sterling_m_long"] = "34rnd L2A1 Magazine",
                    --
                    ["bm_w_mac10"] = "Ingram M10",
                    ["bm_w_x_mac10"] = "Akimbo M10s",
                    ["bm_wp_mac10_m_extended"] = "30rnd M10 Magazine",
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
                    ["bm_wp_schakal_m_short"] = "15rnd UMP Magazine",
                    ["bm_wp_schakal_m_long"] = "45rnd UMP Magazine",
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
                    ["bm_hk21_sc_desc"] = "The big-little sister to the G3. Comes with an increased fire rate for even greater suppressive abilties.",
                    ["bm_wp_hk21_fg_short"] = "Short HK21 Handguard",
                    ["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip",
                    --MG42
                    ["bm_w_mg42"] = "Mauser Maschinengewehr 42",
                    ["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel",
                    ["bm_wp_mg42_b_vg38"] = "BlasTech DLT-19 Barrel",
                    --Versteckt-51/HK51B
                    ["bm_w_hk51b"] = "Vollmer HK51-B",
                    ["bm_hk51b_sc_desc"] = "Aftermarket conversion of the HK21, shrinking this MG down to MP5 sizes and increasing its rate of fire even further.",
                    ["bm_wp_hk51b_fg_railed"] = "Tri-Rail Handguard",
                    ["bm_wp_hk51b_b_fluted"] = "Fluted Long Barrel",

                    --M240
                    ["bm_w_par"] = "FN M240B",
                    ["bm_par_sc_desc"] = "A heavier sibling machinegun to the M249 typically mounted on vehicles. Trades mobility for an even bigger bullet.",
                
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
                    ["bm_w_basset_m_extended"] = "10rnd AGP Arms Saiga Magazine",
                    ["bm_w_saiga"] = "Kalashnikov Concern Saiga-12K",
                    ["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System",
                    ["bm_wp_saiga_m_20rnd"] = "20rnd MD Arms Saiga Drum",
                    ["bm_wp_saiga_fg_holy"] = "Fuglystick Rail System",
                    --AA12
                    ["bm_w_aa12"] = "MPS Auto Assault-12 CQB",
                    ["bm_wp_aa12_barrel_long"] = "Standard AA-12 Barrel",
                    ["bm_wp_aa12_mag_drum"] = "20rnd AA-12 Drum",
                    --Six12
                    ["bm_w_rota"] = "Crye Precision SIX12",
                    --M1014
                    ["bm_w_benelli"] = "Benelli M4 Super 90",
                    ["bm_wp_ben_b_long"] = "Long M4 Barrel",
                    ["bm_wp_ben_b_short"] = "NFA M4 Barrel",
                    ["bm_wp_ben_s_collapsed"] = "Collapsed M4 Stock",
                    ["bm_wp_ben_fg_standard"] = "M4 Tactical Stock",
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
                    ["bm_w_g36"] = "H&K G36K",
                    ["bm_wp_g36_fg_c"] = "G36c Handguard",
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
                    ["bm_wp_aug_fg_a3"] = "A3 Rail",
                    ["bm_wp_aug_body_f90"] = "Thales F90 Kit",
                    --Boatgun
                    ["bm_w_corgi"] = "FN F2000 Tactical TR",
                    --AK12
                    ["bm_w_ak12"] = "Kalashnikov Concern AK-12",
                    --Ak5
                     ["bm_w_ak5"] = "Bofors Ak 5",
                     ["bm_wp_ak5_fg_ak5c"] = "Ak 5c Handguard",
                     ["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard",
                     ["bm_wp_ak5_s_ak5b"] = "Ak 5b Stock",
                     ["bm_wp_ak5_s_ak5c"] = "Ak 5c Stock",
                    --CAR-4
                    ["bm_w_m4"] = "Colt M4A1",
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
                    ["bm_m203_weapon_sc_desc_pc"] = "The big sister to Scarface's personal \"Little Friend\" M16.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
                    ["bm_m203_weapon_sc_desc"] = "The big sister to Scarface's personal \"Little Friend\" M16.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
                        --VMP
                        ["bm_m203_vmp_sc_desc_pc"] = "A replica of Scarface's personal \"Little Friend\" M16.\n\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
                        ["bm_m203_vmp_sc_desc"] = "A replica of Scarface's personal \"Little Friend\" M16.\n\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
                
                    --SCAR
                    ["bm_w_scar"] = "FN Mk.17",
                    ["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension",
                    ["bm_wp_scar_s_sniper"] = "Mk.20 Stock",
                    --FAL
                    ["bm_w_fal"] = "FN FAL",
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
                    ["bm_g3_sc_desc"] = "Acting as the big sister to the MP5 and HK21, this rifle's accuracy rivals that of snipers.\n\n#{skill_color}#Deals 80% of its damage through body armor and can pierce enemies and thin walls.##",
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
                    --GARAND
                    ["bm_w_ching"] = "Springfield Armory M1 Garand",
                    ["bm_wp_ching_fg_railed"] = "Amega Mini-Scout-Mount",
                    --Custom DMRs
                        --G3 HK79
                        ["bm_g3hk79_sc_desc_pc"] = "A variant of the G3 that comes equipped with an #{skill_color}#underbarrel grenade launcher## and #{skill_color}#deals 80% of its damage through body armor and can pierce enemies and thin walls.##\n\nPress #{skill_color}#$BTN_BIPOD## to switch to the grenade launcher.",

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
                    --M95
                    ["bm_w_m95"] = "Barrett M95",

                    --M95
                    ["bm_w_m95"] = "Barrett M95",
                    ["bm_wp_m95_b_barrel_long"] = "Long Barrel w/AW50F Muzzle Brake",
                    --Custom Snipers
                        --M107
                        ["bm_m107cq_sc_desc"] = "If the M95 wasn't up to speed, then the M107 will deliver what you want as a fine, red mist.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",

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

                        ["bm_wp_upg_o_atibal"] = "Atibal MROC 3x32 Scope",
                        ["bm_wpn_fps_upg_o_hamr"] = "Leupold Mk. 4 HAMR 4x24 Scope",
    
                        --"Schmidt & Bender 1-8x24 PM Short Dot"
                        ["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 w/BORS",
                        ["bm_wp_upg_o_box"] = "Pulsar Digisight LRF N960 NV Scope",
    
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

            local twirl = math.rand(1)
            local shalashaska = 0.06
            if bobcat or not easterless and twirl <= shalashaska then
                LocalizationManager:add_localized_strings({
                    ["bm_w_peacemaker"] = "左轮山猫",
                    ["bm_w_peacemaker_desc"] = "左轮山猫",
                    ["bm_ap_weapon_peacemaker_sc_desc"] = "左轮山猫",
                    ["bm_wp_peacemaker_barrel_long"] = "左轮山猫",
                    ["bm_wp_peacemaker_barrel_short"] = "左轮山猫",
                    ["bm_wp_peacemaker_handle_bling"] = "左轮山猫",
                    ["bm_wp_peacemaker_rifle_stock"] = "左轮山猫",
                    ["bm_menu_ro_barrel"] = "左轮山猫",
                    ["bm_menu_ro_stock"] = "左轮山猫",
                    ["bm_menu_ro_modifier"] = "左轮山猫",
                    ["bm_menu_ro_charm"] = "左轮山猫",
                    ["bm_menu_ro_grip"] = "左轮山猫",

                    ["bm_m134_sc_desc"] = "不可言喻......",
                    ["bm_wp_upg_suppressor_boss"] = "\"CRAB BATTLE!!!\"\n\n#{skill_color}#Silences## your weapon and #{risk}#reduces the chance of enemies evading your aim.##"  --tra
                })
            end

            local game_meme = math.rand(1)
            local game_meme_fun = 0.05
            if eggplant or not easterless and game_meme <= game_meme_fun then
                LocalizationManager:add_localized_strings({
                    -- SanGuoSha
                    ["bm_wp_avelyn_desc"] = "“#{ghost_color}#万箭齐发##”\n“#{risk}#闪！##”\n\n一种真正的#{skill_color}#齐射##套件。\n让你可以一次射出#{skill_color}#3##发箭矢。",
                    -- CF
                    ["bm_w_kacchainsaw"] = "收割者",
                    ["bm_w_m16"] = "9000GP永久",
                    -- Genshin Impact
                    ["heist_deep"] = "原友觉醒",
                    -- apex
                    ["bm_w_fmg9"] = "平行手枪",
                    ["bm_w_mg42"] = "L-STAR充能机枪",
                    -- overwatch
                    ["bm_wp_upg_bazooka_desc"] = "#{heat_warm_color}#一枪——一个##\n这款驰名天下的狙击步枪以其标志性的枪鸣和一击必杀的能力而闻名。\n\n使用后能够#{skill_color}#穿透泰坦盾牌##。",
                    ["bm_bazooka_sc_desc"] = "#{heat_warm_color}#一枪——一个##\n这款驰名天下的狙击步枪以其标志性的枪鸣和一击必杀的能力而闻名。\n\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
                    ["bm_w_peacemaker"] = "维和者",
                    ["bm_ap_weapon_peacemaker_sc_desc"] = "“#{heat_warm_color}#正义可不会伸张自己##”\n\n\n辅助开火可以通过快速煽动击锤以#{important_1}#更高的后坐力、更低的有效射程和无法机瞄##为代价#{skill_color}#提高射速##进行速射。\n\n能够#{skill_color}#穿透敌人，护甲，盾牌以及薄墙壁##。"
                })
            end

            local game_meme_2 = math.rand(1)
            local game_meme_fun_2 = 0.01
            if eggplant or not easterless and game_meme_2 <= game_meme_fun_2 then
                LocalizationManager:add_localized_strings({
                    -- Genshin Impact
                    ["heist_deep"] = "OP觉醒",

                    -- battalfield
                    ["bm_w_m60"] = "M60重机枪（壕沟战）",
                    ["bm_w_mg42"] = "Buzzsaw-42重机枪（壕沟战）",

                    -- CSGO
                    ["bm_w_deagle"] = "700块钱的大狙",

                    ["bm_menu_drag_handle"] = "垃圾饼",
                    ["bm_wp_ak_upg_dh_zenitco"] = "美味垃圾饼",
                    ["menu_what_doesnt_kill_beta_sc"] = "没能杀死你的东西，只会让你更强大"
                })
            end

            local chinese_meme = math.rand(1)
            local chinese_meme_fun = 0.05
            if registeredloser or not easterless and chinese_meme <= chinese_meme_fun then
                LocalizationManager:add_localized_strings({
                    ["bm_melee_swing_arc_1"] = "有#{skill_color}#较宽##的攻击范围。",
                    ["bm_melee_swing_arc_2"] = "有#{skill_color}#很宽##的攻击范围。",
                    ["bm_melee_swing_arc_3"] = "有#{skill_color}#超级宽##的攻击范围。",
                    ["bm_melee_swing_arc_4"] = "有#{skill_color}#巨他妈宽##的攻击范围。",
                    ["ene_spring"] = "惊蛰战士",
                    ["bm_w_contraband"] = "大姐头7.62步枪",
                    ["bm_m203_weapon_sc_desc_pc"] = "鹰姐私人款\"大朋友\"AMR-16的姐妹。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。\n按下 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
                    ["bm_m203_weapon_sc_desc"] = "鹰姐私人款\"大朋友\"AMR-16的姐妹。\n\n可#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害并可#{skill_color}#穿透敌人##。\n按住 #{skill_color}#$BTN_BIPOD## 切换到下挂榴弹发射器。",
                    ["bm_saiga_sc_desc"] = "这把全自动霰弹枪正适合枪马的你。"
                })
            end

            local big = math.rand(1)
            local pistol = 0.02
            if shitpost or not easterless and big <= pistol then
                LocalizationManager:add_localized_strings({
                    ["bm_melee_great_info"] = "试着去刺击，但穿了个洞。\n\n攒累#{skill_color}#九成##之力，斩出一剑，剑尖即可深入#{skill_color}#半米##远方，视野也得以拓宽。",
                    ["bm_melee_jebus_info"] = "#{risk}#明暗双生，黑白两道，生死分明！##\n\n这把双刃无容于中庸，必能令敌手唯恐避之不及。\n\n攒累九成之力，斩出一剑，剑尖即可深入半米远方，视野也得以拓宽。",
                    ["bm_sparrow_sc_desc"] = "\n我一定会回来的！",
                    ["bm_m16_sc_desc"] = "我给你一个弹夹，这样你就可以输出了。",
                    ["bm_w_x_type54"] = "十字杀双胞胎",
                    ["bm_bessy_sc_desc"] = "自由美利坚，枪击每一天。\n\n对特殊敌人造成的伤害额外增加#{skill_color}#100%##。\n能够#{skill_color}#穿透护甲，敌人，盾牌，泰坦盾牌和薄墙壁##。",
                    ["bm_akmsu_sc_desc"] = "一支不可被低估的小型步枪，用于击倒#{stat_maxed}#大个子##。这把步枪几乎可以在任何时候都发挥效用。"
                })
            end


        local getaf = os.date("*t")
        if getaf.month == 4 and getaf.day == 1 then
            LocalizationManager:add_localized_strings({
                ["dialog_err_failed_joining_lobby"] = "你太菜了无法加入游戏。"
            })
        end
end)

local r = tweak_data.levels.ai_groups.russia -- LevelsTweakData.LevelType.Russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = tweak_data.levels.ai_groups.murkywater -- LevelsTweakData.LevelType.Murkywater
local z = tweak_data.levels.ai_groups.zombie -- LevelsTweakData.LevelType.Zombie
local f = tweak_data.levels.ai_groups.federales
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
    Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
        LocalizationManager:add_localized_strings({
            ["hud_assault_assault"] = "ИДЁТ ШТУРМ НАЁМНИКОВ",
            ["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
            ["hud_assault_alpha"] = "ШTУPM HAЁMHИKOB"
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
elseif ai_type == m then
    Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
        LocalizationManager:add_localized_strings({
            ["hud_assault_assault"] = "Murkywater Operation in Progress",
            ["hud_assault_alpha"] = "MURKYWATER OPERATION"
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
        ["menu_toggle_one_down"] = "专家模式",
        ["menu_one_down"] = "专家模式",
        ["menu_es_pro_job_bonus"] = "专家模式奖励",

        ["menu_asset_lock_additional_assets_pro"] = "专家模式下不可用！",
        ["menu_pro_warning"] = "这是一个专家级任务！如果你失败了，整场合约将直接被终止！\n此外，有去无回会触发于劫案的尾声部分，此时会出现具有极高威胁性的临界反应部队。\n全武器友军伤害已启用。完成劫案获得的经验和金钱提高25%。",

        ["cn_menu_contract_daypay_header"] = "任务天数：",
        ["cn_menu_contract_jobpay_header"] = "合约报酬：",
        ["victory_stage_cash_summary_name_job"] = "你从当日劫案中获得了额外的金钱： $stage_cash 因为完成合约，你又获得了额外的金钱： $job_cash ",

        ["debug_interact_grenade_crate_take_grenades"] = "按住 $BTN_INTERACT 来拾取一次投掷物(补满)",
        ["debug_interact_bodybags_bag_take_bodybag"] = "按住 $BTN_INTERACT 来拾取一次尸体袋和绑带(补满)",

        ["menu_equipment_armor_kit"] = "手雷箱",
        ["bm_equipment_armor_kit"] = "手雷箱",
        ["debug_equipment_armor_kit"] = "手雷箱",

        -- Throwable Case
        ["bm_equipment_armor_kit_desc"] = "要使用手雷箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。手雷箱一旦被放下就不能被移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#投掷物##。手雷箱只能被使用#{skill_color}#三次##。\n\n你可以通过看手雷箱里还剩多少个盒子来判断剩余使用次数。\n\n每使用一次就能#{skill_color}#补满##你的投掷物。\n\n手雷箱是一种隐蔽性补给品，通常被军队或雇佣兵用来捞薯条。\n\n#{important_1}#提示：你无法用此技能补充天赋/充能投掷物道具##",
        ["bm_equipment_armor_kit_desc_short"] = "要使用手雷箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。手雷箱一旦被放下就不能被移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#投掷物##。手雷箱只能被使用#{skill_color}#三次##。\n\n你可以通过看手雷箱里还剩多少个盒子来判断剩余使用次数。\n\n每使用一次就能#{skill_color}#补满##你的投掷物。\n\n#{important_1}#提示：你无法用此技能补充天赋/充能投掷物道具##",
        -- Ordnance Bag
        ["bm_equipment_grenade_crate_desc"] = "要使用军需包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。军需包一旦被放下就不能被移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#弹药##和#{risk}#投掷物##。军需包只能被使用#{skill_color}#三次##。\n\n你可以通过观察军需包来判断剩余使用次数。\n\n每使用一次就能补充#{skill_color}#25%##的弹药和#{skill_color}#1##颗投掷物。\n\n军需包是战斗人员随身携带的便携包，用于将投掷型武器运送到战场中。\n\n#{important_1}#提示：你无法用此技能补充天赋/充能投掷物道具##",
        ["bm_equipment_grenade_crate_desc_short"] = "要使用军需包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。军需包一旦被放下就不能被移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#弹药##和#{risk}#投掷物##。军需包只能被使用#{skill_color}#三次##。\n\n你可以通过观察军需包来判断剩余使用次数。\n\n每使用一次就能补充#{skill_color}#25%##的弹药和#{skill_color}#1##颗投掷物。\n\n#{important_1}#提示：你无法用此技能补充天赋/充能投掷物道具##",
        -- Trip Mine
        ["bm_equipment_trip_mine_desc"] = "要使用诡雷，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。诡雷一旦被安置就不能被移动，安置后靠近并对其按下#{skill_color}#$BTN_INTERACT##以在感应模式和爆炸模式之间切换。\n感应模式：潜入中，保安经过会被标记并发出声音；强袭中，特殊敌人经过会被标记并发出声音。\n爆炸模式：敌人经过时引爆。\n潜入中放下时会默认使用感应模式，强袭中放下时会默认使用爆炸模式。\n\n要使用聚能炸药，你需要先靠近可爆破的目标，并对准目标上的炸药标志按住#{skill_color}#$BTN_INTERACT##以部署一枚聚能炸药上去。聚能炸药一旦被安置就不能收回，当爆破目标所需的全部炸药被安置完毕后，聚能炸药就会在几秒后炸开目标。\n\n诡雷是一种基础陷阱，能将触碰镭射的敌人炸残或炸死。\n聚能炸药可用于炸开部分保险箱和门。\n两者都是战斗中的好帮手。",
        ["bm_equipment_trip_mine_desc_short"] = "要使用诡雷，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。诡雷一旦被安置就不能被移动，安置后靠近并对其按下#{skill_color}#$BTN_INTERACT##以在感应模式和爆炸模式之间切换。\n要使用聚能炸药，你需要先靠近可爆破的目标，并对准目标上的炸药标志按住#{skill_color}#$BTN_INTERACT##以部署。聚能炸药一旦被安置就不能收回，当所有炸药被安置完毕后，聚能炸药就会在几秒后炸开目标。",
        -- Ammo Bag
        ["bm_equipment_ammo_bag_desc"] = "要使用弹药包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就不能被移动，你和你的队友都可以按住#{skill_color}#$BTN_INTERACT##与其互动补充#{risk}#弹药##。\n\n它可以被用于完全补充一把没子弹的武器#{skill_color}#$deployable_uses##次，你可以通过观察弹药包中剩余的弹匣数量来判断弹药包余量。\n\n弹药包是一种便携式包裹，原本为士兵设计，使其在战斗中能携带更多弹药。",
        ["bm_equipment_ammo_bag_desc_short"] = "要使用弹药包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，你和你的队友都可以按住#{skill_color}#$BTN_INTERACT##与其互动补充#{risk}#弹药##。\n\n它可以被用于完全补充一把没子弹的武器#{skill_color}#$deployable_uses##次，你可以通过观察弹药包中剩余的弹匣数量来判断弹药包余量。",
        -- ECM Jammer
        ["bm_equipment_ecm_jammer"] = "ECM电子干扰器",
        ["bm_equipment_ecm_jammer_desc"] = "要使用ECM干扰器，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就不能被移动，并且它会立刻生效#{skill_color}#$deployable_uses##秒，期间它会阻止手机报警、干扰摄像头及一些其它电子设备。\n\n你可以靠近并对其按下#{skill_color}#$BTN_INTERACT##以启用ECM干扰器的反馈功能，反馈开始时有#{skill_color}#100%##的几率使半径#{skill_color}#25##米范围内的绝大部分敌人失去行动能力，随后每#{skill_color}#1.2##秒都有#{skill_color}#60%##的几率眩晕范围内的敌人。反馈持续#{skill_color}#$deployable_uses##秒且可以在#{skill_color}#4##分钟的充能后重新使用。\n靠近并对ATM机、安全门等目标上的干扰器标志按住#{skill_color}#$BTN_INTERACT##可以打开目标或造成目标失效等的影响。\n\nECM干扰器可以用于干扰电子设备，让你更轻松地实现目标。但若你使用不当，它反而有可能拖延你的任务进程。",
        ["bm_equipment_ecm_jammer_desc_short"] = "要使用ECM干扰器，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就不能被移动，并且它会立刻生效#{skill_color}#$deployable_uses##秒。\n你可以靠近并对其按下#{skill_color}#$BTN_INTERACT##以启用ECM干扰器的反馈功能，反馈开始时有#{skill_color}#100%##的几率使半径#{skill_color}#25##米范围内的绝大部分敌人失去行动能力，随后每#{skill_color}#1.2##秒都有#{skill_color}#60%##的几率眩晕范围内的敌人。反馈持续#{skill_color}#$deployable_uses##秒且可以在#{skill_color}#4##分钟的充能后重新使用。",
        -- FAQ U
        ["bm_equipment_first_aid_kit_desc"] = "要使用急救包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，你或你的队友都可以按住#{skill_color}#$BTN_INTERACT##使用并瞬间回复#{stats_positive}#150##点#{risk}#血量##。急救包只能使用#{skill_color}#一次##。\n\n急救包在紧急情况下用于快速急救。",
        ["bm_equipment_first_aid_kit_desc_short"] = "要使用急救包，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，你或你的队友都可以按住#{skill_color}#$BTN_INTERACT##使用并瞬间回复#{stats_positive}#150##点#{risk}#血量##。急救包只能使用#{skill_color}#一次##。",
        -- AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        ["bm_equipment_doctor_bag_desc"] = "要使用医疗箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，你或你的队友都可以按住#{skill_color}#$BTN_INTERACT##使用并立即回复血量上限#{stats_positive}#20%##的#{risk}#血量##，然后在#{skill_color}#3##分钟内每#{skill_color}#5##秒回复血量上限#{stats_positive}#4%##的#{risk}#血量##。医疗箱可以使用#{skill_color}#$deployable_uses##次，你可以通过观察医疗箱判断剩余使用次数。\n\n医疗箱是一种便携医疗用品，通常给医务人员用于运输医疗物品。",
        ["bm_equipment_doctor_bag_desc_short"] = "要使用医疗箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，你或你的队友都可以按住#{skill_color}#$BTN_INTERACT##使用并立即回复血量上限#{stats_positive}#20%##的#{risk}#血量##，然后在#{skill_color}#3##分钟内每#{skill_color}#5##秒回复血量上限#{stats_positive}#4%##的#{risk}#血量##。医疗箱可以使用#{skill_color}#$deployable_uses##次，你可以通过观察医疗箱判断剩余使用次数。",
        -- Sentry
        ["bm_equipment_sentry_gun_desc"] = "要使用哨戒机枪，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。部署哨戒机枪将用掉你备弹上限#{skill_color}#$deployable_uses##的弹药。\n哨戒机枪在承受过多伤害后会损坏，此时你可以通过靠近对其按住#{skill_color}#$BTN_INTERACT##使其进入#{risk}#自动维修模式##并在#{skill_color}#1##分钟的修理后重新运作。若未损坏，则靠近按住#{skill_color}#$BTN_INTERACT##会捡起哨戒机枪，这会返还它的剩余弹药并使其恢复到完好的状态。\n若掌握了“塔防机枪”技能，则在未靠近并目视机枪时按下#{skill_color}#$BTN_INTERACT##可以切换哨戒机枪使用的弹种。\n哨戒机枪可以用于#{skill_color}#恐吓平民##，使平民保持趴在地上的状态。\n\n哨戒机枪会自动瞄准和射击它的感应器检测到的目标，别问这是什么感应器。它通常用于分散敌人的注意力，避免敌人集火你和你的队友。",
        ["bm_equipment_sentry_gun_desc_short"] = "要使用哨戒机枪，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。部署哨戒机枪将用掉你备弹上限#{skill_color}#$deployable_uses##的弹药。\n哨戒机枪在承受过多伤害后会损坏，此时你可以通过靠近对其按住#{skill_color}#$BTN_INTERACT##使其进入#{risk}#自动维修模式##并在#{skill_color}#1##分钟的修理后重新运作。捡起哨戒机枪会返还它的剩余弹药并使其恢复到完好的状态。\n哨戒机枪可以用于#{skill_color}#恐吓平民##。",
        -- Supp. Sentry
        ["bm_equipment_sentry_gun_silent_desc"] = "要使用消音哨戒机枪，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。部署哨戒机枪将用掉你备弹上限#{skill_color}#$deployable_uses##的弹药。\n哨戒机枪在承受过多伤害后会损坏，此时你可以通过靠近对其按住#{skill_color}#$BTN_INTERACT##使其进入#{risk}#自动维修模式##并在#{skill_color}#1##分钟的修理后重新运作。若未损坏，则靠近按住#{skill_color}#$BTN_INTERACT##会捡起哨戒机枪，这会返还它的剩余弹药并使其恢复到完好的状态。\n若掌握了“塔防机枪”技能，则在未靠近并目视机枪时按下#{skill_color}#$BTN_INTERACT##可以切换哨戒机枪使用的弹种。\n哨戒机枪可以用于#{skill_color}#恐吓平民##，使平民保持趴在地上的状态。\n\n这个消音的哨戒机枪与普通的不同，它更多地被用于消灭敌人，而不是分散注意力。",
        ["bm_equipment_sentry_gun_silent_desc_short"] = "要使用消音哨戒机枪，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。部署哨戒机枪将用掉你备弹上限#{skill_color}#$deployable_uses##的弹药。\n哨戒机枪在承受过多伤害后会损坏，此时你可以通过靠近对其按住#{skill_color}#$BTN_INTERACT##使其进入#{risk}#自动维修模式##并在#{skill_color}#1##分钟的修理后重新运作。捡起哨戒机枪会返还它的剩余弹药并使其恢复到完好的状态。\n哨戒机枪可以用于#{skill_color}#恐吓平民##。",
        -- Body Bags
        ["bm_equipment_bodybags_bag_desc"] = "要使用尸体袋箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#尸体袋##和#{risk}#绑带##。\n\n尸体袋箱只能被使用#{skill_color}#三次##，你可以通过看尸体袋箱里还剩多少个袋子来判断剩余使用次数。\n\n这个箱子携带有额外的尸体袋和绑带，用于在潜入中搬运尸体和控制平民。",
        ["bm_equipment_bodybags_bag_desc_short"] = "要使用尸体袋箱，你需要按住#{skill_color}#$BTN_USE_ITEM##将其部署下来。一旦部署完毕就无法移动，但是你和你的队友可以按住#{skill_color}#$BTN_INTERACT##来补充#{risk}#尸体袋##和#{risk}#绑带##。\n\n尸体袋箱只能被使用#{skill_color}#三次##，你可以通过看尸体袋箱里还剩多少个袋子来判断剩余使用次数。",

        ["hud_int_hold_take_pardons"] = "按下 $BTN_INTERACT 拿走特赦令",
        ["debug_interact_gage_assignment_take"] = "按下 $BTN_INTERACT 捡起盖奇包裹",

        ["hint_ability_no_grenade_pickup"] = "你无法从中拾取天赋道具",
        ["hint_full_grenades"] = "你的投掷物已满。",
        ["debug_interact_ordnance_bag_take_grenades"] = "按住 $BTN_INTERACT 补充一颗投掷物和一些弹药",

        ["far_repair_sentry_macro"] = "哨戒机枪严重受损，需要维修。",
        ["fixing_sentry_macro"] = "维修进度: $AMMO_LEFT",
        -- Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
        ["repair_sentry_macro"] = " 以启动哨戒机枪的自动维修模式。",
        ["pickup_sentry_macro"] = " 以取回哨戒机枪。\n剩余弹药量: $AMMO_LEFT ", -- Gets % health remaining appended to the end.
        ["firemode_sentry_macro"] = " 以切换射击模式。\n剩余弹药量: $AMMO_LEFT ",
        ["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", -- $AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
        ["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
        ["hud_repair_sentry"] = "$AMMO_LEFT",
        ["hud_action_repair_sentry"] = "正在维修哨戒机枪......",

        -- More fitting descriptions of difficulties--
        ["menu_risk_elite"] = "做一个行动派，来体验一下死亡之愿难度吧。",
        ["menu_risk_sm_wish"] = "死刑宣告难度，向全世界证明没有人可以阻止你。",

        -- Loading Hints--
        -- Restoration Gameplay Hints--
        ["loading_gameplay_res_title"] = "恢复MOD劫匪小贴士(强攻)",
        ["loading_gameplay_res_1"] = "幻影特工在要飞踢劫匪时会发出\"Wulululululu\"的声音，用这个来找到他们的位置。",
        ["loading_gameplay_res_2"] = "幻影特工在普通和充能状态不再发出\"嗞嗞\"的声音了。",
        ["loading_gameplay_res_3"] = "当你的主武器有较长的切枪时间时，手枪就会是你完美的副武器。",
        ["loading_gameplay_res_4"] = "泰瑟警察在电击你时你的子弹不会回满了。试着让自己的弹药保持充足，或在被电击前切换为副武器。",
        ["loading_gameplay_res_5"] = "幻影特工喜欢抓那些落单的劫匪，与你的队友待在一起，否则就等着进局子喝茶吧。",
        ["loading_gameplay_res_6"] = "幻影特工在飞踢你后会对你的血量造成直接的伤害。此伤害可以被\"血量减伤分数\"或逃犯格斗系二阶的\"反\'控\'精英\"技能减少。",
        ["loading_gameplay_res_7"] = "绿熊有极高的单发伤害并会尝试突然从侧翼突入，打空子弹，然后逃走。你作为一个69岁的老劫匪要小心不要大意了，没有闪，然后就被偷袭了。",
        ["loading_gameplay_res_8"] = "使用高射速高弹容伊孜玛霰弹枪的黑熊极具进攻性并会直接从正面冲向劫匪。这使得他们会很容易被发现，但如果你还没做好准备，他们会变得极具威胁性。",
        ["loading_gameplay_res_9"] = "使用轻机枪的骷髅熊会给其它单位提供火力掩护，同时也会在各种情况下准备好突入，不射空弹匣他们不会停火。",
        ["loading_gameplay_res_10"] = "手雷熊取代了加特林熊在能投掷高爆手雷的同时，使用着Benelli霰弹枪。高伤高射速，绿熊和黑熊的完美结合。",
        ["loading_gameplay_res_11"] = "选择正确的目标很重要，任意一只熊都比一个轻甲水军更值得注意。（但我不是在叫你无脑优先怼熊）",
        ["loading_gameplay_res_12"] = "在\"死刑宣判\"难度下，熊会在面甲破碎后进入狂怒模式，狂怒模式下他们的伤害会提高10%。",
        ["loading_gameplay_res_13"] = "幻影特工在在飞踢时会发出标志性的声音。",
        ["loading_gameplay_res_14"] = "幻影特工的飞踢只会把你拷住，不算倒地次数。",
        ["loading_gameplay_res_15"] = "在\"死刑宣判\"难度下，警察的闪光弹无法被打掉。我不要你觉得，我要我觉得。",
        ["loading_gameplay_res_16"] = "你可以通过近战蓄力来招架住敌人的近战攻击。使用\"反\'控\'精英\"技能可以让其招架住幻影特工的飞踢。",
        ["loading_gameplay_res_17"] = "敌人的近战攻击比原版更快更猛，保持距离！别傻傻逼逼想着从警察堆里冲过去，这么做你只会被警察的一套连击打出十割。",
        ["loading_gameplay_res_18"] = "有什么比用棒球棍猛打敌人更好的事情呢？用棒球棒爆他们的头！",
        ["loading_gameplay_res_19"] = "狙击手在射击前需要一点时间集中注意力。如果你被狙击手盯上了，你会发觉你听到的声音正在逐渐淡出。你可以通过镭射或是狙击镜的反光找到狙击手的位置。",
        ["loading_gameplay_res_20"] = "近战武器现在可以爆头了，使用近战武器打击敌人的头部以造成更高伤害。",
        ["loading_gameplay_res_21"] = "不同种类的警察携带不同的武器。你可以通过观察他们的制服来判断他们使用的武器是什么。",
        ["loading_gameplay_res_22"] = "使用霰弹枪的警察极具威胁性。在近距离，如果你的护甲不够厚实的话，他们甚至可以两枪把你击倒。然而，霰弹枪的射程十分有限，毕竟谁也没法用一把霰弹枪八百米开外一枪爆鬼子的头。",
        ["loading_gameplay_res_23"] = "高难度下，敌人会依靠在一个持盾警察的后面向前推进。",
        ["loading_gameplay_res_24"] = "高难度下，敌人会更加聪明，行动更难以预测且更具战术性。",
        ["loading_gameplay_res_25"] = "在\"死刑宣判\"中，你会体验到各种搞人的设定带来的地狱般的难度。别指望特警们能有所保留，你一拳纵有十年功力，他们也能接的下来。",
        ["loading_gameplay_res_26"] = "在\"专家模式\"下，你无法重开，无法购买一般的有利条件(比如医疗箱、弹药袋和尸体袋)，启用了友军伤害(即使是对你的AI队友)，并且在任务的最后阶段可能会触发\"有去无回\"，此时会刷出具有高威胁性的Bravo临界反应部队。",
        ["loading_gameplay_res_27"] = "恢复MOD添加了不同的敌人单位和各种模型，比如新的黑水雇佣兵和其它国家的敌人种类等。一些单位虽差异不大，但也给游玩带来了独特的感觉。尤其是那些华盛顿特区以外的敌人和劫案。",
        ["loading_gameplay_res_28"] = "你转化的变节警察现在也会被幻影特工飞踢了，高难度下幻影特工在飞踢任何人前都会先扔一颗烟雾弹。",
        -- New Units Hints
        ["loading_new_units_res_title"] = "恢复MOD劫匪小贴士(敌对单位)", -- ASU : Assault Support Unit ： 支援兵
        ["loading_new_units_res_1"] = "OMNIA支援兵会给附近队友的武器安装黄色镭射附件并提高他们的武器伤害。",
        ["loading_new_units_res_2"] = "维生部队非常害怕近战攻击。",
        ["loading_new_units_res_3"] = "轻型部队可以被身边的维生部队超量治疗。受到超量治疗的敌人以紫色标记。",
        ["loading_new_units_res_4"] = "泰坦幻影特工使用了先进了装备以致于他们几乎是隐身的，但他们会发出\"嗞嗞\"的声音。戴上你的耳机，聆听他们发出的声音，找出他们的位置，一枪爆他们的狗头！",
        ["loading_new_units_res_5"] = "泰坦熊会尽可能避免与你正面作战，他们会试图保持安全距离并对你进行火力压制。",
        ["loading_new_units_res_6"] = "泰坦狙击手以降低伤害和不能穿甲为代价换取了更高的射速和移动射击的能力。",
        ["loading_new_units_res_7"] = "泰坦狙击手在瞄准时没有红色的镭射，但它们射击后会留下子弹轨迹。看准轨迹找到它们的位置。",
        ["loading_new_units_res_8"] = "泰坦盾兵的盾牌只能被反器材狙击步枪、\"锯刃轰鸣\"基础技能下的OVE9000电锯、以及使用AP弹的哨戒机枪穿透。",
        ["loading_new_units_res_9"] = "春日队长和泰坦熊会受到额外的爆头伤害。",
        ["loading_new_units_res_10"] = "泰坦泰瑟会使用电击枪限制你的移动。当你被电击枪射中时，你的屏幕周边会出现一圈蓝色的光作为指示。",
        ["loading_new_units_res_11"] = "非爆头和非近战击杀反恐老兵会使其拉开一颗催泪弹。",
        ["loading_new_units_res_12"] = "反恐老兵会空翻躲避子弹，他们还会迅速地移动以使自己更难被击中。",
        ["loading_new_units_res_13"] = "泰坦特警身着防爆装备，对近战伤害有些许的抗性，但这点抗性在高额近战伤害下并没有什么卵用。",
        ["loading_new_units_res_14"] = "泰坦特警不会投降，也不能被转化为变节警察为你作战。",
        ["loading_new_units_res_15"] = "泰坦特警装备了轻机枪和全自动霰弹枪，这使得他们对你极具威胁性。",
        ["loading_new_units_res_16"] = "触发\"有去无回\"时，Bravo临界反应部队会参与镇压劫匪。他们拥有更高级的护甲和更强力的武器，还会投掷破片手雷，他们可不想跟你多逼逼。",
        ["loading_new_units_res_17"] = "Bravo临界反应部队的血量和伤害都比一般单位要强上许多，他们进攻时会频繁地投掷破片手雷，你最好不要只在一个小坑位上蹲太久。",
        ["loading_new_units_res_18"] = "阿肯拥有他自己的D项目系列泰坦部队。他们看起来不同但实际属性是相同的。他们的整体视觉效果和穿着特征也是基本一致的，因此你可以轻易地认出不同的兵种。",
        ["loading_new_units_res_19"] = "掷弹兵的武器有能发射催泪瓦斯的下挂件，站在瓦斯中的玩家会持续受到伤害。在\"死刑宣判\"难度下，他装备了更致命的、伤血更快且会迅速清空你耐力的毒气弹。",
		["loading_new_units_res_20"] = "Titan Shields utilizes flashes that will use against you. Watch for red lights and beeping sounds. You can shoot shield's flash panels to stun them as they charge.",
        -- Captain Hints
        ["loading_captains_res_title"] = "恢复MOD劫匪小贴士(四季队长)",
        ["loading_captains_res_1"] = "要击败夏日队长，得先从他的医疗单位入手。夏日队长的队员死亡前，队长几乎是无敌的。而他的左右护法在医疗兵还活着时几乎是无懈可击的。",
        ["loading_captains_res_2"] = "不要靠近夏日队长，否则他会使用他的喷火器迅速把你燃烧殆尽。", -- 夏日队长还装备了一把电击枪以拖慢你的移动。
        ["loading_captains_res_3"] = "春日队长可以承受成吨的伤害，但他并不是无敌的。注意他扔出的手雷，试着放他风筝，他的行动比乌龟还慢。",
        ["loading_captains_res_4"] = "春日队长时不时会扔出一颗高爆手雷。不要长时间靠他太近。",
        ["loading_captains_res_5"] = "春日队长也许具有高威胁性，但他的输出范围实在是太有限了，而且他走的是真的很——慢——。",
        ["loading_captains_res_6"] = "秋日队长在他攻击你时会大声地嘲讽你，利用这一点来确定他的位置。",
        ["loading_captains_res_7"] = "不像其他队长，警方不会扛着个大喇叭告诉你秋日队长来了，这是为了给你一个\"惊喜\"。",
        ["loading_captains_res_8"] = "秋日队长在未被发现的情况下存活一段时间后就会破坏掉你部署的随身装备。被破坏的随身装备会变为紫色，只有在队长被击败时才能重新使用。",
        ["loading_captains_res_9"] = "你也许未能在第一次与秋日队长的交战中就击败他......不，想都别想。",
        ["loading_captains_res_10"] = "冬日队长对爆炸和火焰几乎免疫，并且有很强的抗子弹能力，但很容易受到近战伤害。",
        ["loading_captains_res_11"] = "冬日队长的盾牌是无法穿透的。",
        ["loading_captains_res_12"] = "冬日队长的行动模式和能力已被重做。他现在会在整个地图上移动游走，并治疗甚至是超量治疗他周围大片区域的警察。同时他还会找机会带领他的队友们冲锋陷阵。",
        -- Stealth Hints
        ["loading_stealth_res_title"] = "恢复MOD劫匪小贴士(潜入)",
        ["loading_stealth_res_1"] = "保安们不再会因为看到损坏的摄像头而立即警觉。有一个专门的保安会来检查摄像头，因此你可以用摄像头作为诱饵。",
        ["loading_stealth_res_2"] = "使用近战杀死一名未警觉的保安，或者吼住一名保安都不会触发对讲机。在保安刚警觉时用近战杀死它依然不会触发对讲机。",
        ["loading_stealth_res_3"] = "安保指挥部发现警卫失踪后，可能会派出增援。就算你使用不用回答对讲机的方式，也还是会触发潜入中的保安增援事件。",
        ["loading_stealth_res_4"] = "潜入中，保安会在巡逻时闲聊或吹口哨，这有助于你确定保安的位置。",
        ["loading_stealth_res_5"] = "不同难度下，对讲机操作员可以被说服的次数上限也不同，6头为2次，5头为3次，其余为4次。超过上限的对讲机回答将大幅度增加怀疑度。",
        ["loading_stealth_res_6"] = "现在你不需要技能也能用枪声控制平民趴下了，潜入和强攻均有效。",
        ["loading_stealth_res_7"] = "哨戒机枪能控制住它周围的平民，使平民保持趴下的状态。",
        ["loading_stealth_res_8"] = "携带战利品包时，NPC能从更远的位置看见你，并且你在站立、奔跑和跳跃时的暴露条增长速度大幅度加快。尽可能保持蹲伏的姿态来移动，不要急，慢慢来......",
        ["loading_stealth_res_9"] = "你最多能同时携带4个ECM，但每个ECM只有原版一半的持续时间，尽可能保证你的每个ECM都用对了地方。",
        ["loading_stealth_res_10"] = "消音武器在潜入中不会发出任何声音，不带消音的武器在潜入中会固定发出半径为25米的声音。",
        ["loading_stealth_res_11"] = "无论是潜入还是强攻，你都只能吼住4名保安或警察作为人质。",
        ["loading_stealth_res_12"] = "原版中大多数会直接导致潜入失败的因素（如警觉的摄像头和超过次数上限的对讲机）现在不会直接触发警报，而是大幅度增加你的怀疑度。",
        ["loading_stealth_res_13"] = "潜入中未警觉的保安不是必定被秒杀了，在击杀保安时注意瞄准他的头或使用高伤害武器。",
        ["loading_stealth_res_14"] = "潜入中屏幕上方的怀疑度填满后，你将剩下60秒的时间完成劫案，60秒后警报就会响起。",
        ["loading_stealth_res_15"] = "潜入中屏幕上方的怀疑度越高，你越容易被保安发现。",
        ["loading_stealth_res_16"] = "恢复MOD中，你可以携带更多的尸体袋。如果你玩的是单潜，你可以携带的尸体袋要更多。",
        ["loading_stealth_res_17"] = "在Crime.net离线模式游戏中，你将获得额外的绑带用于弥补缺少的玩家，即使你已经有了增加绑带的技能。",
        ["loading_stealth_res_18"] = "被枪械击杀的保安会触发对讲机，在有限次数内回答对讲机不会增加怀疑度，无视对讲机很显然会。杀死没有对讲机的保安不会增加怀疑度。",
        ["loading_stealth_res_19"] = "更高的难度下，对讲机操作员可不会过分地相信你说的话。对讲机操作员最后一次听信你时会用特别的语音提示你。",
        ["loading_stealth_res_20"] = "超出对讲机次数上限的回答会大幅度增加怀疑度，但不回答或中断回答增加的怀疑度要更多。",
        ["loading_stealth_res_21"] = "更高的难度下，给你接对讲机的时间更短，且回答对讲机所需的时间更长。",
        -- Equipment/Skill Hints
        ["loading_equip_skills_res_title"] = "恢复MOD劫匪小贴士(装备/技能)",
        ["loading_equip_skills_res_1"] = "霰弹枪的精准度越低，弹丸扩散越大，但射程也越低，只有亲自体验和测试才知道如何均衡二者。注意考虑用什么针对狙击手，不建议主副武器都使用霰弹枪的散弹丸。",
        ["loading_equip_skills_res_2"] = "掏出手枪的速度非常快，且多数手枪的精准度和稳定性都很可观。如果你不是为了整一些特别的活，那么手枪可能会是一个非常理想的副武器。",
        ["loading_equip_skills_res_3"] = "恢复MOD中的武器各有利弊，用法各有千秋。使用高伤害的武器可以更快地清理敌军，但你可能在不知不觉中就把子弹打完了。",
        ["loading_equip_skills_res_4"] = "高伤害的武器通常隐匿度较低，除非它们有其它的缺点——如打不准和射太慢。",
        ["loading_equip_skills_res_5"] = "沃尔夫升级了我们的哨戒机枪，它们即使被损坏也可以修复了。维修需要一些时间，但一旦你启动自动维修模式，它们就会自己慢慢修复。",
        ["loading_equip_skills_res_6"] = "如果你解锁了哨戒机枪的AP弹，你可以在放置物菜单内切换哨戒机枪的默认弹药使用种类。",
        ["loading_equip_skills_res_7"] = "天赋牌组能为你提供显著的伤害加成，有些牌组还有珍贵而罕见的治疗能力。如果你想冲击高难度，一定不能忽略它们。",
        ["loading_equip_skills_res_8"] = "领队、军械、肌肉男、骗术师、赌徒和飞车党的玩法非常基础，它们在恢复MOD下也不弱，是新玩家上手体验游戏的最好选择。",
        ["loading_equip_skills_res_9"] = "杀手已被重做为一个一个拥有持久生存能力和续航能力的天赋，但你需要完成一些复杂且高难的操作才能获得高额的\"临时虚血\"。",
        ["loading_equip_skills_res_10"] = "\"领队\"——一个以团队为中心的辅助天赋，可以为你和你的队友提供少量但非常有用的增益。如果你能控制住多个人质，你们可以获得更高的增益。领队与突击系的技能树相匹配，可以结合使用以提高增益的效益。",
        ["loading_equip_skills_res_11"] = "\"赌徒\"——一个以团队为中心的辅助天赋，你捡弹时可以使你和你的队友获得少量的血量和弹药，与捡弹技能相匹配。由于恢复MOD下非玩家击杀的敌人不一定会掉落弹药，赌徒的益处有了进一步的提升。",
        ["loading_equip_skills_res_12"] = "\"瘾君子\"——一个以团队为中心的辅助天赋，你持续杀敌时可以为你和你的队友提供减伤效果，与提高伤害和伤害减免的技能相匹配。",
        ["loading_equip_skills_res_13"] = "黑客的便携式ECM有着强大的控场能力，并能为队友提供一定的治疗能力，但冷却时间较长。黑客在潜入和强攻均有良效。",
        ["loading_equip_skills_res_14"] = "\"窃贼\"——一个强攻中需要把头低下的天赋，潜入下它能提供可观的蹲伏移速加成。",
        ["loading_equip_skills_res_15"] = "\"首脑\"——一个兼顾多方面的天赋，它的注射器既可以用于保证自己的生存能力，在重火力中生存；又可以吸引火力，为队友迎来喘息的机会。",
        ["loading_equip_skills_res_16"] = "\"双人组\"——一个以团队之间相互配合为核心的天赋，只要你和你标记的队友都能保证持续的输出杀敌，你们就能共同获得大量的治疗。",
        ["loading_equip_skills_res_17"] = "穿过盾牌的子弹伤害减半。",
        ["loading_equip_skills_res_18"] = "Peacemaker.45左轮手枪和Phoenix.500左轮手枪可以像狙击步枪一样穿透护甲、敌人等。",
        ["loading_equip_skills_res_19"] = "如果你有闪避点数，那么你能在游戏中的屏幕右边看到一个蓝色的条。当它闪烁时，你就能闪避一次敌人的攻击，并消耗黑线下面的部分。你可以在Steam指南中找到关于闪避机制的更多解释。",
        ["loading_equip_skills_res_20"] = "枪械武器隐藏度越高, 拔枪和收枪的速度越快。",
        ["loading_equip_skills_res_21"] = "电锯和风车刀蓄力时可以对面前的敌人造成伤害。",
        ["loading_equip_skills_res_22"] = "蝴蝶刀和折叠刀背刺能对敌人造成巨大的伤害。",
        ["loading_equip_skills_res_23"] = "冰镐和十字镐造成更高的爆头伤害，但攻击速度变得更慢。",
        ["loading_equip_skills_res_24"] = "中毒效果只能造成中等的伤害，但是增加了呕吐效果来打断敌人的动作。",
        ["loading_equip_skills_res_25"] = "闪光弹可以在一定范围内造成全面干扰，对大多数熊也是一样。",
        ["loading_equip_skills_res_26"] = "使用武器的瞄准可以显著提高你的精准度并减少武器后坐力，即使你使用的是轻机枪。",
        ["loading_equip_skills_res_27"] = "射钉枪拥有相较于其他近战武器更远的攻击距离。",
        ["loading_equip_skills_res_28"] = "升级天赋牌组可以解锁手雷箱供你使用，手雷箱有三次使用机会。",
        ["loading_equip_skills_res_29"] = "手雷箱/尸体袋箱现在只要消耗一次使用次数就能补满你的投掷物/尸体袋。",
        ["loading_equip_skills_res_30"] = "领袖鼓舞的激励战吼冷却时间非常长而且需要双方之间没有视野阻挡，你唯有在真正危急的时刻使用它才能发挥出它应有的效果。",
        ["loading_equip_skills_res_31"] = "恢复MOD增加了两个新的天赋牌组(通用牌组和空白牌组)，通用牌组只提供每个天赋都有的普通加成，空白牌组什么加成都没有。使用这俩牌组可以获得经验和金钱奖励加成。",
        ["loading_equip_skills_res_32"] = "瞄准技能的改动使得你必须瞄准完全才能享受相关技能加成。在改装枪的时候多留心\"瞄准时间\"这一属性。",
        ["loading_equip_skills_res_33"] = "长枪管，坚固枪托以及扩容弹夹虽然有各自的优点，但他们对切枪、换弹、瞄准和冲刺开火这些硬直时间负面影响巨大；用太多这类配件会让你的枪十分笨重。",
        ["loading_equip_skills_res_34"] = "枪托近战的攻击速度受武器本身隐蔽度影响。",
        ["loading_equip_skills_res_35"] = "\"瞄准时间\"属性也适用于\"冲刺-开火时间\"。\"冲刺-开火时间\"指的是在从你停止冲刺到能够射击的这段硬直时间。",
        ["loading_equip_skills_res_36"] = "在战斗中，消音器会降低敌人在被你瞄准时进行闪避动作的可能性。但你要知道，他们既然不花时间躲避你的射击，那就肯定会用这个时间射击你。",
        -- Misc Hints
        ["loading_misc_res_title"] = "恢复MOD劫匪小贴士(杂项)",
        ["loading_misc_res_1"] = "试试我们的新劫案吧！合约人\"胡狼\"里有两个，合约人\"弗拉德\"里有一个\"不速之客\"，此外还有官方地图的圣诞版本。",
        ["loading_misc_res_2"] = "恢复MOD有一个专门的Steam指南！你可以在ModWorkShop上的Restoration Mod页面进入这个指南。很遗憾因某种原因主菜单的指南按钮点击时并无反应。",
        ["loading_misc_res_3"] = "恢复MOD在Discord上有一个专门的服务器！你可以在ModWorkShop上的Restoration Mod页面加入这个服务器，你可以在服务器上对模组的方方面面进行探讨和反馈。",
        -- Trivia Hints
        ["loading_fluff_res_title"] = "恢复MOD冷知识",
        ["loading_fluff_res_1"] = "OMNIA公司花了一大笔钱重整失败的武器开发项目。",
        ["loading_fluff_res_2"] = "维生部队的人经常欠同事几瓶啤酒。",
        ["loading_fluff_res_3"] = "维生部队的人和泰坦狙击手都是澳大利亚人。",
        ["loading_fluff_res_4"] = "纽约警察局的警察喜欢吃甜甜圈。",
        ["loading_fluff_res_5"] = "看到那名拿着UMP45的狂热突击队精英了吗？他的名字叫查德。",
        ["loading_fluff_res_6"] = "由于基因工程、人体实验和战斗用药的关系，像泰坦熊这样的兵种有着一双发出荧光的眼睛。",
        ["loading_fluff_res_7"] = "春日队长其实不是人类......他也许曾经是，很久以前......",
        ["loading_fluff_res_8"] = "恢复MOD原名RestorationMod，时常被国内玩家戏称为\"PDTH2.0\"、\"PAYDAY2.5\"和\"收获日2重制版\"。",
        ["loading_fluff_res_9"] = "OMNIA公司一直在试图开发新型加固的安全门，以防止恐龙袭击。对，你没听错。",
        ["loading_fluff_res_10"] = "掷弹兵过去从事的是害虫防治工作。",
        ["loading_fluff_res_11"] = "你从没遇到过泰坦幻影特工（",
        ["loading_fluff_res_12"] = "Omnia是一支自称为\"新凯尔特异教民谣\"的乐队，时常在爱尔兰演奏。其成员来源自爱尔兰、荷兰、康沃尔、比利时、印度尼西亚和波斯六个不同的地方。与OMNIA公司的关系未知。",
        ["loading_fluff_res_13"] = "不管是什么原因导致胡狼退出GenSec加入Crime.net，他都拒绝谈论这件事。他似乎对这件事有点儿神经过敏。",
        ["loading_fluff_res_14"] = "红红火火恍恍惚惚，爬。",
        ["loading_fluff_res_15"] = "夏日队长的四人组曾经是像PAYDAY帮四人组一样臭名昭著的劫匪。他们现在作为特种突击队为OMNIA公司效命。",
        ["loading_fluff_res_16"] = "有关部门对外宣称夏日队长的四人组在抢劫一家银行时死于建筑倒塌，这很明显是一个诡计。",
        ["loading_fluff_res_17"] = "秋日队长花了很多钱在手铐上，夏日队长花了很多钱在燃油上，春日队长花了很多钱在子弹和手雷上，冬日队长花了很多钱在盾和强力胶上。你有没有花很多钱在金皮上呢？",
        ["loading_fluff_res_18"] = "夏日队长不是美少女，穿的也不是泳装，不是泳装，不是泳装！真不知道你们一个两个膜法劫匪脑子里都在想些什么。",
        ["loading_fluff_res_19"] = "正统PAYDAY2，就在恢复MOD！\"OVK, FK YOU!\"。",
        ["loading_fluff_res_20"] = "恢复MOD在武器装备和技能天赋以及敌军等方面的平衡上下了很大的功夫，我们鼓励玩家组成四人小队携带不同的战术道具各司其职、互相掩护，而不是人手两个医疗箱满图跑。",
        ["loading_fluff_res_21"] = "你知道吗？由于多次友军伤害事件，掷弹兵花了很多钱在敌腐特灵上。其实你每打一场有掷弹兵参与的劫案，就会有数名警察因为掷弹兵的友伤事件而被送医。",
        ["loading_fluff_res_22"] = "鬼知道做恢复MOD汉化的人从开始汉化到完成汉化鸽了多久。",
        ["loading_fluff_res_23"] = "B站是唯一一个可以直播PAYDAY2的国内知名平台。",
        ["loading_fluff_res_24"] = "你知道吗？每当队长被你打死时，他们并不是真的死了，而是跟你一样进了局子。",
        ["loading_fluff_res_25"] = "作为联邦特警成立联邦泰坦计划的替代品，阿肯集团提供的D系列特种兵以更快更高效的执行速度，与低于OMNIA的报价，从同类竞品中脱颖而出。该集团有望使联邦特警在墨西哥与美国两地拥有接近OMNIA和黑水的势力。",

        ["menu_button_deploy_bipod"] = "切换为脚架/下挂榴弹",
        ["hint_short_max_pagers"] = "不回答对讲机将会极大地增加怀疑度。",

        -- And now we're doing it again--
        ["menu_infamy_desc_root_new"] = "犯罪界一颗冉冉升起的新星。你要做的第一件事就是整理一下穿着打扮，享受其他人对你投来的敬仰目光。\n\n增益：\n你的基本恶名物品掉落几率从 ##0.3%## 增加到 ##0.6%## 。\n你获取的经验将增加 ##5%## 。",

        -- Renaming some of the skill subtrees--
        ["st_menu_mastermind_single_shot"] = "突击系",
        ["st_menu_enforcer_armor"] = "坦克系",
        ["st_menu_enforcer_ammo"] = "支援系",
        ["st_menu_technician_auto"] = "工兵系",
        ["st_menu_technician_breaching"] = "爆破系",
        ["st_menu_technician_sentry"] = "堡垒系",
        ["hud_instruct_mask_on"] = "按下 $BTN_USE_ITEM 戴上面具",
        ["hud_instruct_mask_on_alpha"] = "按下 $BTN_USE_ITEM 戴上面具",

        -- Default Suit String
        ["bm_suit_none_desc"] = "劫匪的默认服装及选择的护甲。在某些关卡默认服装会自动更换为劫案专属服装。",

        -- Ad Banner Change
        ["menu_changelog"] = "最近的更新日志",
        ["menu_discord"] = "Discord服务器",
        ["menu_guide"] = "大修指南",
        ["menu_captains"] = "四季队长信息",
        ["menu_content_updates"] = "指南/帮助",
        ["menu_content_updates_previous"] = "",

        -- Mutators
        ["menu_mutators_achievement_disabled"] = "", -- 启用突变模式将减少你获得的经验和金钱，同时也会禁用成就、大多数奖杯和劫案完成次数。",
        ["menu_mutators_category_holiday"] = "节日活动",
        ["menu_mutators_category_old_event"] = "活动事件",
        ["menu_mutators_category_crime_spree"] = "罪无止境",

        -- Enemy Replacers
        ["mutator_specials_override_boom"] = "掷弹兵",
        ["mutator_specials_override_sniper"] = "狙击手",

        ["mutator_titandozers_desc"] = "万圣节派对",
        ["mutator_titandozers_longdesc"] = "无头熊从沃尔夫的噩梦中逃出来进入了现实世界！一般的熊将变种成他们的无头版本，其它的万圣节效果也会启用！",

        ["mutator_medidozer_longdesc"] = "所有水军都将被替换为医疗兵，所有的特殊单位都将被替换为熊。",
        ["mutator_medicdozers"] = "医疗熊",
        ["mutator_medicdozers_desc"] = "在任意难度下生成医疗熊。",
        ["mutator_medicdozers_longdesc"] = "每当有一只熊生成时，这只熊都有50%的几率被替换为医疗熊。\n\n提示：如果启用了\"半自动喷子熊\"的突变，则黑熊只有33.3%的几率被替换为医疗熊。",

        ["mutator_notitans"] = "资金不足",
        ["mutator_notitans_desc"] = "取消生成泰坦单位。",
        ["mutator_notitans_longdesc"] = "不会有泰坦敌人单位生成。",

        ["mutator_mememanonly"] = "哈哈哈哈，你们一帮傻逼！",
        ["mutator_mememanonly_desc"] = "受苦吧......",
        ["mutator_mememanonly_longdesc"] = "有去无回...无路可逃...救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命救命\n\n 警告：此突变可能在某些地图导致闪退。",

        ["MutatorMoreDonutsPlus"] = "我要甜甜圈",
        ["MutatorMoreDonutsPlus_desc"] = "所有的水军都将被替换为纽约警察局的便衣警察，所有的特殊单位都被替换为维生部队。",
        ["MutatorMoreDonutsPlus_longdesc"] = "所有的水军都将被替换为纽约警察局的便衣警察，所有的特殊单位都被替换为维生部队。\n\n警告：你玩这个突变模式就是在犯罪！\n\n\"太坏惹，准备拿手铐去抓。\"",

        ["MutatorJungleInferno"] = "丛林地狱",
        ["MutatorJungleInferno_desc"] = "所有敌人使用喷火器。",
        ["MutatorJungleInferno_longdesc"] = "所有非地图脚本生成的敌人都将使用喷火器。\n\n狙击手和盾兵依然会使用默认武器。",

        ["mutator_minidozers"] = "手雷熊",
        ["mutator_minidozers_desc"] = "在任意难度下生成手雷熊。",
        ["mutator_minidozers_longdesc"] = "每当有一只黑熊生成时，这只熊都有50%的几率被替换为一只手持M1014的手雷熊。\n\n提示：如果启用了\"医疗熊\"的突变，则黑熊只有33.3%的几率被替换为手雷熊。",

        ["mutator_fatroll"] = "死亡翻滚",
        ["menu_mutator_fatroll"] = "Grace Period (in s)", -- tra
        ["mutator_fatroll_desc"] = "Custom Damage Grace value (in s).",
        ["mutator_fatroll_longdesc"] = "Damage grace on players and AI crew members is set to different value, meaning that there is your specific delay on instances of damage. Minimum is 0 s, maximum is 0.25 s",
        ["mutator_fatroll_desc"] = "取消无敌帧。",
        ["mutator_fatroll_longdesc"] = "玩家和AI队友的受击无敌时间都会被设置为0，这将意味着你被击中多少枪就会受到多少伤害，且AI队友将难以生存。",

        ["mutator_spawn_mult"] = "犯罪响应增幅",
        ["menu_mutator_enemy_spawn"] = "刷兵倍率",
        ["mutator_spawn_mult_desc"] = "增加刷兵量。",
        ["mutator_spawn_mult_longdesc"] = "突击进行中会刷出更多的敌人。Overkill™ 经典操作！",

        ["mutator_birthday"] = "气球派对",
        ["mutator_birthday_desc"] = "击杀特殊敌人将生成能提供增益的气球。",
        ["mutator_birthday_longdesc"] = "收获日-十周年活动事件：\n\n击杀特殊敌人将生成一个气球，射爆气球将能为全队带来增益效果，不同的单位会生成不同增益的气球。有些单位会更频繁地生成气球，不同种气球增益效果可以同时触发。",

        ["mutator_CG22"] = "犯罪颂歌",
        ["mutator_CG22_desc"] = "有些劫案会生成一颗掉落礼包的圣诞树，将礼包销毁或运到雪橇上。",
        ["mutator_CG22_longdesc"] = "收获日2-2022年圣诞节活动事件：\n\n一颗圣诞树会在某些劫案中出现，与其互动会使其持续掉落礼包。将礼包运送至销毁处销毁可使你获得一个效果增益，或送至雪橇上使你获得额外的经验、金钱或大陆币。每运一包礼物都有概率生成使用喷雪器的雪人熊。",

        ["menu_cg22_post_objective_1_desc"] = "使用任意狙击步枪击杀200名敌人。",
        ["menu_cg22_post_objective_2_desc"] = "在非常困难或更高的难度中，使用SA北极星狙击步枪击杀15个幻影特工。",
        ["menu_cg22_post_objective_3_desc"] = "在任意难度中，使用SA北极星狙击步枪完成50次一枪双杀。",
        ["menu_cg22_post_objective_4_desc"] = "在任意难度中，劫获10包战利品（成功完成劫案才计数）。 ",
        ["menu_cg22_post_objective_5_desc"] = "在枪林弹雨或更高的难度中，击杀10只熊。",
        ["menu_cg22_post_objective_6_desc"] = "在任意难度中，劫获25包战利品（成功完成劫案才计数）。",
        ["menu_cg22_post_objective_7_desc"] = "在任意难度中，劫获50包战利品（成功完成劫案才计数）。",
        ["menu_cg22_post_objective_8_desc"] = "在枪林弹雨或更高的难度中，击杀20只熊。",
        ["menu_cg22_post_objective_9_desc"] = "S在任意难度中，劫获75包战利品（成功完成劫案才计数）。",

        ["mutator_piggybank"] = "小猪小猪快长大",
        ["mutator_piggybank_desc"] = "警察爆金币啦！用小猪钞票喂饱金猪存钱罐吧！",
        ["mutator_piggybank_longdesc"] = "收获日2-九周年活动事件：\n\n特定劫案内，被击杀的敌人有几率掉落小猪钞票，每包小猪钞票只会暂时留在地上，你需要在它们消失前拿起并丢给巨大的金色小猪存钱罐，将存钱罐喂得越来越胖，然后打碎它。打碎小猪存钱罐时，小猪存钱罐越大，你在劫案结束时获得的经验和钱也越多。",

		["mutator_piggyrevenge"] = "Piggy's Revenge",
		["mutator_piggyrevenge_desc"] = "Enemies killed drop piggy bucks to feed to the Golden Pig and earn buffs.",
		["mutator_piggyrevenge_longdesc"] = "PAYDAY 2 10th Anniversary event:\n\nEnemies killed will have a chance to drop Piggy Bucks. Piggy Bucks are temporary bags that can be used to grow the Golden Piggy and earn buffs on certain heists, and doing so has a chance to spawn the Flamethrower wielding Piggy Dozer. The bigger the Piggy the more bonus XP and money will be rewarded at the end of the heist.",		

		["menu_pda10_post_objective_3_desc"] = "Complete 25 Heists on any difficulty",
		["menu_pda10_post_objective_5_desc"] = "Kill 50 enemies with Sniper Rifles",
		["menu_pda10_post_objective_2_desc"] = "Secure 50 loot bags",
		["menu_pda10_post_objective_6_desc"] = "Kill 50 enemies with Melee Weapons",
		["menu_pda10_post_objective_1_desc"] = "Kill 50 Dozers",
		["menu_pda10_post_objective_4_desc"] = "Collect 50 Gage Packages",

        ["mutator_bravos_only"] = "死亡地带",
        ["mutator_bravos_only_desc"] = "所有敌人将被替换为同等类别的有去无回单位。",
        ["mutator_bravos_only_longdesc"] = "所有非地图脚本生成的敌人都被替换成专家模式有去无回里的同类别单位。FBI SWAT将替代蓝皮SWAT，并且FBI SWAT会被替换成Bravo临界反应部队。",

        ["mutator_zombie_outbreak"] = "行尸走肉",
        ["mutator_zombie_outbreak_desc"] = "所有敌军都将被替换为丧尸单位。",
        ["mutator_zombie_outbreak_longdesc"] = "死亡正在持续蔓延着......将所有敌方单位替换为丧尸单位。",

        ["mutator_faction_override"] = "敌人阵营覆盖",
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
        ["faction_selector_choice"] = "阵营: ",

        --tra
        ["mutator_cloakercuff"] = "Сonjurer",
        ["mutator_cloakercuff_desc"] = "Cloaker melee strikes will now cuff players.",
        ["mutator_cloakercuff_longdesc"] = "Melee strikes from cloakers will force players into a cuffed state.",
        
        ["mutator_cloakerflashbang"] = "Dazzling Ninja",
        ["mutator_cloakerflashbang_desc"] = "Cloakers have a chance to drop a flashbang when they dodge.",
        ["mutator_cloakerflashbang_longdesc"] = "Cloakers will now have a 50% chance to drop a flashbang when they dodge.",
        
        ["mutator_fartsmella"] = "\"Pesticide\" Supplies",
        ["mutator_fartsmella_desc"] = "Smoke Grenades are now replaced with Tear Gas.",
        ["mutator_fartsmella_longdesc"] = "Smokes grenades deployed by enemies will instead be replaced by tear gas.\n\nNote: Does not replace smoke grenades from the \"Hurt Me More\" mutator.",
        
        ["mutator_kaboom"] = "Kamikaze",
        ["mutator_kaboom_desc"] = "Grenadiers now explode on death.",
        ["mutator_kaboom_longdesc"] = "Grenadiers now explode on death.",
        
        ["mutator_fastresponse"] = "Fast Response",
        ["mutator_fastresponse_desc"] = "All police assaults now start at maximum intensity.",
        ["mutator_fastresponse_longdesc"] = "All police assaults now start at maximum intensity.",
        
        ["mutator_crazytaser"] = "Taser Overcharge",
        ["mutator_crazytaser_desc"] = "Taser units no longer have an aim delay when attempting to stun players.",
        ["mutator_crazytaser_longdesc"] = "Taser units no longer have an aim delay when attempting to stun players.\n\nNote: Normal cooldowns between attempts still apply.",

        ["mutator_masterdodger"] = "Dodge This!",
        ["mutator_masterdodger_desc"] = "Veteran Cops now dodge all bullets.",
        ["mutator_masterdodger_longdesc"] = "Veteran Cops now dodge all bullets.",
        
        ["mutator_fullautoinbuilding"] = "Rabid Shooters",
        ["mutator_fullautoinbuilding_desc"] = "Titan Snipers and their equivalents will now fire their rifles on full auto at close range.",
        ["mutator_fullautoinbuilding_longdesc"] = "Titan Snipers, Bravo Sharpshooters will now fire their rifles on full auto at close range (within 10 meters).",
        
        ["mutator_quickscope360"] = "Eagle Eye",
        ["mutator_quickscope360_desc"] = "Snipers now aim their rifles 100% faster.",
        ["mutator_quickscope360_longdesc"] = "Snipers now aim their rifles 100% faster.",
		
		["mutator_goldfarbdozers"] = "Double Firepower",
		["mutator_goldfarbdozers_desc"] = "All Bulldozers that spawn will always deploy in pairs.",
		["mutator_goldfarbdozers_longdesc"] = "All Bulldozers that spawn will always deploy in pairs.",

        -- Crime spree modifier changes
        ["cn_crime_spree_brief"] = "\"罪无止境\"是一系列随机选取并需要连续完成的劫案组合。你完成的每次一次劫案都会为你增加罪无止境等级与奖励。每过20级或26级，你都需要选择一次附加难度因子；每过100级都会增加劫案的基础难度(如枪林弹雨到祸乱横行)，这会使劫案更难完成。等级600之后，玩家的无敌帧将会逐渐减少，Bravo临界反应部队将会开始生成。\n\n##如果你想邀请你的好友一起玩，请先确保他们开始了罪无止境以一起获得等级和奖励##",
        ["menu_cs_next_modifier_forced"] = "",
        ["menu_cs_modifier_dozers"] = "熊的生成上限增加1。",
        ["menu_cs_modifier_medics"] = "医疗兵的生成上限增加1。",
        ["menu_cs_modifier_no_hurt"] = "敌人获得50%的击倒抗性。",
        ["menu_cs_modifier_dozer_immune"] = "熊获得50%的爆炸伤害抗性。",
        ["menu_cs_modifier_bravos"] = "敌人有额外6.667%的概率被替换为一个Bravo临界反应部队的单位。",
        ["menu_cs_modifier_grace"] = "你的受击无敌时间减少六十分之一秒。",
        ["menu_cs_modifier_letstrygas"] = "烟雾弹被替换为毒气弹。",
        ["menu_cs_modifier_boomboom"] = "掷弹兵会在死亡时爆炸。",
        ["menu_cs_modifier_friendlyfire"] = "激活100%的友军伤害。",
        ["menu_cs_modifier_dodgethis"] = "反恐老兵现在会躲避所有子弹，你无法用子弹对他造成伤害。",
        ["menu_cs_modifier_sniper_aim"] = "狙击手瞄准所需时间减少100%。",
        ["menu_cs_modifier_health_damage_total"] = "",
        ["menu_cs_modifier_heavies"] = "所有使用步枪的轻型SWAT单位都会在生成时附带一个突击小组组长单位，每个小组中组长单位的上限提高1个。",
        ["menu_cs_modifier_heavy_sniper"] = "泰坦狙击手和狂暴神射手在近距离会使用武器的全自动射击模式。",
        ["menu_cs_modifier_dozer_medic"] = "每当有一只熊被生成时，它都有概率被替换为一只医疗熊。医疗熊与加特林熊共用一种生成上限。",
        ["menu_cs_modifier_dozer_minigun"] = "每当有一只绿熊或黑熊被生成时，它都有概率被替换为一只手持M1014的熊。",
        ["menu_cs_modifier_shield_phalanx"] = "所有标准的盾兵单位都有额外15%的概率被替换为泰坦盾兵。",
        ["menu_cs_modifier_taser_overcharge"] = "泰瑟警察在要电击你时不再受到瞄准延迟的影响，但两次电击之间依然存在冷却。",
        ["menu_cs_modifier_dozer_rage"] = "熊会在面甲被破坏后进入狂怒模式，此时他们的伤害增加10%。",
        ["menu_cs_modifier_medic_adrenaline"] = "所有的医疗单位都有额外15%的概率被替换为OMNIA维生部队或D-145“宏创”喷火兵，取决于敌人的派系如何。",
        ["menu_cs_modifier_cloaker_arrest"] = "幻影特工的飞踢倒地改为拷住玩家。",
        ["menu_cs_modifier_cloaker_smoke"] = "幻影特工现在有50%的概率在他们闪避时扔出一颗闪光弹。",
        ["menu_cs_modifier_cloaker_tear_gas"] = "所有人质救援队的单位都有额外15%的概率被替换为支援兵。",
        ["menu_cs_modifier_dozer_lmg"] = "每当有一只绿熊或黑熊被生成时，它都有概率被替换为一只骷髅熊。",
		["menu_cs_modifier_dozerpairs"] = "Bulldozers will now always spawn in pairs.",

        ["bm_menu_skill"] = "小队加成",

        ["menu_crew_interact"] = "身手敏捷",
        ["menu_crew_interact_desc"] = "每个AI队友将使你的互动速度加快15%",

        ["menu_crew_inspire"] = "鼓舞士气",
        ["menu_crew_inspire_desc"] = "AI队友可以使用\"领袖鼓舞\"技能\n\n冷却时间为90秒，每名AI队友将使冷却时间减少15秒",

        ["menu_crew_scavenge"] = "明察秋毫",
        ["menu_crew_scavenge_desc"] = "每名AI队友会提高玩家10%的捡弹量",

        ["menu_crew_ai_ap_ammo"] = "穿甲弹",
        ["menu_crew_ai_ap_ammo_desc"] = "AI队友的武器伤害增加25%\n\nAI队友现在能射穿敌人护甲，且它们射击盾牌将使盾兵被击晕",

        ["menu_crew_healthy"] = "铜浇铁铸",
        ["menu_crew_healthy_desc"] = "所有玩家的血量增加30",

        ["menu_crew_sturdy"] = "稳固防线",
        ["menu_crew_sturdy_desc"] = "所有玩家的护甲值增加10%",

        ["menu_crew_evasive"] = "掩人耳目",
        ["menu_crew_evasive_desc"] = "所有玩家的闪避条每秒增加闪避点数的3%",

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

        --[[   SKILLTREES   ]] --
        -- {

        --[[   MASTERMIND   ]] --
        -- {
        --[[   MEDIC SUBTREE   ]] --
        -- {

        -- Combat Medic
        ["menu_combat_medic_beta_sc"] = "医疗兵",
        ["menu_combat_medic_beta_desc_sc"] = "掌握: #{risk}#$basic##\n救起队友途中及救起队友后的#{skill_color}#5##秒内，你都将获得#{skill_color}#10%##的伤害减免。\n\n专精: #{risk}#$pro##\n救起一个队友将多给予他#{skill_color}#30%##的血量。",

        -- Quick Fix
        ["menu_tea_time_beta_sc"] = "快速包扎",
        ["menu_tea_time_beta_desc_sc"] = "掌握: #{risk}#$basic##\n减少#{skill_color}#50%##你放置 急救包 和 医疗箱 所需的时间。\n\n专精: #{risk}#$pro##\n使用你 急救包 的任何玩家将会在#{skill_color}#5##秒内获得#{skill_color}#50%##的伤害减免。",

        -- Pain Killers
        ["menu_fast_learner_beta_sc"] = "止疼药",
        ["menu_fast_learner_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你救起的队友将在#{skill_color}#5##秒内获得#{skill_color}#25%##的伤害减免。\n\n专精: #{risk}#$pro##\n你救起的队友再额外获得#{skill_color}#25%##的伤害减免。",

        -- Uppers
        ["menu_tea_cookies_beta_sc"] = "兴奋剂",
        ["menu_tea_cookies_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你可以多携带#{skill_color}#3##个 急救包。\n\n专精: #{risk}#$pro##\n你可以再多携带#{skill_color}#3##个 急救包\n\n你放置的急救包将会自动被#{skill_color}#5##米范围内受到致命伤害的玩家使用\n\n每位玩家在#{skill_color}#60##秒内只能触发一次。\n\n#{important_1}#提示：进入 天鹅绝唱 时不可用##",

        -- Combat Doctor
        ["menu_medic_2x_beta_sc"] = "战地医师",
        ["menu_medic_2x_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的 医疗箱 可额外使用#{skill_color}#1##次。\n\n专精: #{risk}#$pro##\n你可以携带#{skill_color}#2##个 医疗箱。",

        -- Inspire
        ["menu_inspire_beta_sc"] = "领袖鼓舞",
        ["menu_inspire_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的救人速度加快#{skill_color}#50%##\n\n呼喊你的队友会在#{skill_color}#10##秒内提升他们#{skill_color}#20%##的 移动速度 和 换弹速度\n\n专精: #{risk}#$pro##\n你可以通过呼喊半径#{skill_color}#9米##范围内的倒地队友将他们救起，冷却时间#{skill_color}#90##秒。\n\n#{important_1}#提示：队友必须在你视野范围内才可用，不能隔墙吼人##",

        -- }

        --[[   CONTROLLER SUBTREE   ]] --
        -- {

        -- Cable Guy
        ["menu_triathlete_beta_sc"] = "捆绑大师",
        ["menu_triathlete_beta_desc_sc"] = "掌握: #{risk}#$basic##\n增加#{skill_color}#3##根初始可携带的绑带数量。\n\n专精: #{risk}#$pro##\n你从警察死亡掉落的弹药盒中捡到绑带的概率增加到#{skill_color}#30%##。\n\n增加你最大绑带数#{skill_color}#3##根。",

        -- Clowns are Scary
        ["menu_cable_guy_beta_sc"] = "恐怖小丑",
        ["menu_cable_guy_beta_desc_sc"] = "掌握: #{risk}#$basic##\n平民被控制趴下的时间延长#{skill_color}#50%##。\n\n专精: #{risk}#$pro##\n你的威慑强度和范围提高#{skill_color}#50%##。",

        -- Stockholm Syndrome   
        ["menu_joker_beta_sc"] = "人质综合征",
        ["menu_joker_beta_desc_sc"] = "掌握: #{risk}#$basic##\n如果你呼喊附近的平民或转化的警察，他们可能会在你倒地时救你并给你一盒弹药。\n\n专精: #{risk}#$pro##\n每名人质将使你和你的队友获得#{skill_color}#1##点伤害吸收，最多叠加#{skill_color}#4##次。\n\n#{important_1}#提示：该效果不能与拥有该技能的其它玩家叠加##",

        -- Joker    
        ["menu_stockholm_syndrome_beta_sc"] = "背盟败约",
        ["menu_stockholm_syndrome_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你可以转化一名普通警察为你作战，该技能不能在潜入时使用，你必须先制服一名警察才能转化它。\n\n你同时只能拥有一名转化的警察。\n被转化的警察会被视为人质，可以用于技能加成或换出监狱里的队友。\n\n你转化的警察受到的伤害减少#{skill_color}#60%##。\n\n专精: #{risk}#$pro##\n转化的警察造成的伤害提高#{skill_color}#45%##。\n\n你能同时拥有#{skill_color}#2##名转化的警察。",

        -- Partners in Crime    
        ["menu_control_freak_beta_sc"] = "犯罪同伙",
        ["menu_control_freak_beta_desc_sc"] = "掌握: #{risk}#$basic##\n每名人质将增加你#{skill_color}#3%##的移动速度，可叠加#{skill_color}#4##次。\n\n专精: #{risk}#$pro##\n每名人质将提高你#{skill_color}#5%##的血量，可叠加#{skill_color}#4##次。",

        -- Hostage Taker
        ["menu_black_marketeer_beta_sc"] = "长久之策",
        ["menu_black_marketeer_beta_desc_sc"] = "掌握: #{risk}#$basic##\n每名人质将为你提供 \"每#{skill_color}#4##秒回复#{skill_color}#1##点血量\" 的效果，该效果上限#{skill_color}#4##名人质。\n\n专精: #{risk}#$pro##\n当你有#{skill_color}#4##名或以上的人质时，该回血效果增强#{skill_color}#50%##。\n\n人质被救后#{skill_color}#不会逃走##。\n\n你进监狱后，可以让一名人质主动把你交换出来。该效果可以在突击进行中使用，但每场劫案只能使用#{skill_color}#1##次。",

        -- }

        --[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]] --
        -- {

        -- Leadership
        ["menu_stable_shot_beta_sc"] = "领导风范",
        ["menu_stable_shot_beta_desc_sc"] = "掌握: #{risk}#$basic##\n冲锋枪和轻重机枪的稳定性增加#{skill_color}#2##。\n\n专精: #{risk}#$pro##\n全队的武器稳定性额外增加#{skill_color}#2##点。",

        -- MG Handling
        ["menu_scavenger_sc"] = "控枪达人",
        ["menu_scavenger_desc_sc"] = "掌握: #{risk}#$basic##\n冲锋枪和轻重机枪的腰射精准度提高#{skill_color}#20%##。\n\n专精: #{risk}#$pro##\n冲锋枪和轻重机枪的腰射精准度额外提高#{skill_color}#30%##。\n\n冲锋枪和轻重机枪的换弹速度提高#{skill_color}#25%##。",

        -- MG Specialist
        ["menu_sharpshooter_sc"] = "机枪专家",
        ["menu_sharpshooter_desc_sc"] = "掌握: #{risk}#$basic##\n在移动时，冲锋枪和轻重机枪受到的精准度惩罚减少#{skill_color}#60%##。\n\n移动时的精准度惩罚程度取决于稳定性。\n\n专精: #{risk}#$pro##\n冲锋枪和轻重机枪增加#{skill_color}#15%##的射速。\n\n冲锋枪和轻重机枪不松扳机连续射击每五发中的#{skill_color}#第五发##不会消耗弹药。",

        -- Shock and Awe
        ["menu_spotter_teamwork_beta_sc"] = "来势汹汹",
        ["menu_spotter_teamwork_beta_desc_sc"] = "掌握: #{risk}#$basic##\n武器弹匣容量增加#{skill_color}#20%##。\n\n#{important_1}#提示：该效果不适用于弓、弩、榴弹发射器和火箭筒##\n\n专精: #{risk}#$pro##\n你可以在冲刺时使用武器腰射，且武器不会有冲刺转开火时的硬直。\n\n武器弹匣容量额外增加#{skill_color}#30%##。",

        -- Heavy Impact
        ["menu_speedy_reload_sc"] = "沉重打击",
        ["menu_speedy_reload_desc_sc"] = "掌握: #{risk}#$basic##\n冲锋枪和轻重机枪有#{skill_color}#20%##的概率击倒敌人，轻机枪使用脚架时概率增加至#{skill_color}#40%##。\n\n#{important_1}#提示：该效果不适用于队长、熊、狙击手和盾兵##\n\n专精: #{risk}#$pro##\n你蹲下时获得#{skill_color}#12.5%##的伤害减免，轻机枪使用脚架时伤害减免增加至#{skill_color}#25%##。",

        -- Body Expertise
        ["menu_body_expertise_beta_sc"] = "血花四溅",
        ["menu_body_expertise_beta_desc_sc"] = "掌握: #{risk}#$basic##\n冲锋枪和轻重机枪可以#{skill_color}#穿透护甲##造成#{skill_color}#100%##的伤害。\n\n其余所有不能穿甲的武器都能#{skill_color}#穿透护甲##造成#{skill_color}#50%##的伤害。\n\n对于本身可以穿甲的武器，其穿透护甲造成的伤害百分比增加#{skill_color}#50%##，最多增加至#{skill_color}#100%##。\n\n专精: #{risk}#$pro##\n使用#{skill_color}#连发射击##的冲锋枪和轻重机枪在连续射击时，每击杀一名敌人就增加这些武器#{skill_color}#16.67%##的伤害，最多增加#{skill_color}#50%##，停止射击#{skill_color}#1.5##秒后失效。",

        -- }
        -- }

        --[[   ENFORCER   ]] --
        -- {
        --[[   SHOTGUNNER SUBTREE   ]] --
        -- {

        -- Underdog--
        ["menu_underdog_beta_sc"] = "落水狗",
        ["menu_underdog_beta_desc_sc"] = "掌握: #{risk}#$basic##\n在半径#{skill_color}#18##米范围内有3个或以上的敌人时，你将在#{skill_color}#7##秒内获得#{skill_color}#10%##的伤害加成。\n\n专精: #{risk}#$pro##\n在半径#{skill_color}#18##米范围内有3个或以上的敌人时，你还能在#{skill_color}#7##秒内获得#{skill_color}#10%##的伤害减免。",

        -- Shotgun CQB  
        ["menu_shotgun_cqb_beta_sc"] = "巷斗战术",
        ["menu_shotgun_cqb_beta_desc_sc"] = "掌握: #{risk}#$basic##\n霰弹枪和火焰喷射器的开镜速度和冲刺转开火速度加快#{skill_color}#7.5%##。\n\n专精: #{risk}#$pro##\n霰弹枪和火焰喷射器的换弹速度加快#{skill_color}#25%##。",

        -- Shotgun Impact
        ["menu_shotgun_impact_beta_sc"] = "强力冲击",
        ["menu_shotgun_impact_beta_desc_sc"] = "掌握: #{risk}#$basic##\n霰弹枪和火焰喷射器的稳定性增加#{skill_color}#2##。\n\n专精: #{risk}#$pro##\n霰弹枪每发多射出#{skill_color}#3##颗弹丸。\n\n#{important_1}#提示：该效果不适用于霰弹枪的独头弹和高爆弹##",
        ["menu_shotgun_impact_per_pellet_desc_sc"] = "掌握: #{risk}#$basic##\n霰弹枪和火焰喷射器的稳定性增加#{skill_color}#2##。\n\n专精: #{risk}#$pro##\n霰弹枪的最小伤害增加#{skill_color}#25%##。\n\n#{important_1}#提示：该效果不适用于霰弹枪的独头弹和高爆弹##",

        -- Pigeon Shooting  
        ["menu_far_away_beta_sc"] = "飞靶射手",
        ["menu_far_away_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你开镜瞄准时的移动速度加快#{skill_color}#50%##。\n\n#{important_1}#提示：该效果会覆盖你原本的最大速度##\n\n专精: #{risk}#$pro##\n霰弹枪和火焰喷射器开镜瞄准时增加#{skill_color}#30%##的精准，霰弹枪还额外增加#{skill_color}#30%##的射程。",

        -- Gung Ho
        ["menu_close_by_beta_sc"] = "激情四\"射\"",
        ["menu_close_by_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你可以在冲刺时使用霰弹枪或火焰喷射器腰射，且不会有冲刺转开火时的硬直。\n\n专精: #{risk}#$pro##\n霰弹枪和火焰喷射器腰射时的射速提高#{skill_color}#35%##。",

        -- Overkill
        ["menu_overkill_sc"] = "疯狂杀戮",
        ["menu_overkill_desc_sc"] = "掌握: #{risk}#$basic##\n使用霰弹枪、火焰喷射器或OVE9000电锯的#{ghost_color}#直击伤害##击杀#{skill_color}#武器衰减始距内##的敌人会在#{skill_color}#3##秒内提高这些武器#{skill_color}#50%##的最大伤害。\n\n#{important_1}#提示：该伤害加成对爆炸伤害和持续伤害无效，也不能由它们触发##\n\n专精: #{risk}#$pro##\n加快霰弹枪、火焰喷射器和OVE9000电锯的切枪速度#{skill_color}#60%##。\n\n伤害加成的持续时间提高至#{skill_color}#9##秒且伤害加成可适用于所有武器。\n\n#{important_1}#提示：该效果不适用于火箭筒和榴弹发射器##",

        -- }

        --[[   ARMORER SUBTREE   ]] --
        -- {

        -- Stun Resistance--
        ["menu_oppressor_beta_sc"] = "不可撼动",
        ["menu_oppressor_beta_desc_sc"] = "掌握: #{risk}#$basic##\n每一点护甲值将减少你受到警察近战击退效果的#{skill_color}#2.5%##\n\n专精: #{risk}#$pro##\n减少#{skill_color}#50%##闪光弹致盲效果的持续时间",

        -- Die Hard
        ["menu_show_of_force_sc"] = "不死小强",
        ["menu_show_of_force_desc_sc"] = "掌握: #{risk}#$basic##\n你受到对#{skill_color}#血量##的伤害减少#{skill_color}#5%##。\n\n对血量的减伤会在其他减伤计算完后再进行计算，你最多能有#{skill_color}#$deflection##的血量减伤分数。\n\n专精: #{risk}#$pro##\n你受到对#{skill_color}#血量##的伤害额外减少#{skill_color}#5%##。",

        -- Transporter
        ["menu_pack_mule_beta_sc"] = "运输者",
        ["menu_transporter_beta_desc_sc"] = "掌握: #{risk}#$basic##\n每#{skill_color}#10##点护甲值会减少携带战利品袋对移动速度的惩罚#{skill_color}#0.5%##\n\n专精: #{risk}#$pro##\n你现在可以#{skill_color}#背着重包跑步##了\n\n#{important_1}#提示：背包带来的移动速度惩罚依然存在##",

        -- More Blood to Bleed--
        ["menu_iron_man_beta_sc"] = "血流成河",
        ["menu_iron_man_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的血量上限提高#{skill_color}#10%##。\n\n专精: #{risk}#$pro##\n你的血量上限额外提高#{skill_color}#15%##。",

        -- Bullseye--
        ["menu_prison_wife_beta_sc"] = "正中靶心",
        ["menu_prison_wife_beta_desc_sc"] = "掌握: #{risk}#$basic##\n完成爆头击杀会恢复你#{skill_color}#5##点护甲值，冷却时间#{skill_color}#5##秒。\n\n专精: #{risk}#$pro##\n完成爆头击杀恢复的护甲值增加#{skill_color}#30##。",

        -- Iron Man
        ["menu_juggernaut_beta_sc"] = "钢铁之躯",
        ["menu_juggernaut_beta_desc_sc"] = "掌握: #{risk}#$basic##\n解锁 #{skill_color}#改良型复合战术背心## 以供你使用。\n\n近战打盾可以#{skill_color}#击退或推倒盾兵##。\n\n#{important_1}#提示：对冬日队长无效##\n\n专精: #{risk}#$pro##\n现在远程武器射击盾也有几率#{skill_color}#击退或推倒盾兵##，击倒概率取决于武器伤害。\n\n护甲恢复速度加快#{skill_color}#10%##。",

        -- }

        --[[   AMMO SPECIALIST SUBTREE   ]] --
        -- {

        -- Scavenger
        ["menu_scavenging_sc"] = "拾荒者",
        ["menu_scavenging_desc_sc"] = "掌握: #{risk}#$basic##\n你拾取弹药盒的范围增加#{skill_color}#50%##\n\n专精: #{risk}#$pro##\n每击杀#{skill_color}#5##名敌人，第五名被击杀的敌人会额外掉落一个弹药盒",

        -- Bulletstorm--
        ["menu_ammo_reservoir_beta_sc"] = "子弹风暴",
        ["menu_ammo_reservoir_beta_desc_sc"] = "掌握: #{risk}#$basic##\n任何玩家使用你放置的弹药袋将获得#{skill_color}#无限弹药##的增益，持续时间取决于补充的弹药数量，最多持续#{skill_color}#5##秒。\n\n#{important_1}#提示：榴弹发射器、火箭筒和任何其它使用爆炸类型弹药的武器都不受此技能的增益##\n\n专精: #{risk}#$pro##\n该技能的最长持续时间额外延长#{skill_color}#15##秒。",

        -- Specialist Equipment formally Rip and Tear
        ["menu_portable_saw_beta_sc"] = "专业配备",
        ["menu_portable_saw_beta_desc_sc"] = "掌握: #{risk}#$basic##\n电锯锯片的磨损速度减缓#{skill_color}#50%##\n\n专精: #{risk}#$pro##\n电锯、弓、弩、榴弹发射器或火箭筒的换弹速度加快#{skill_color}#25%##",

        -- Extra Lead
        ["menu_ammo_2x_beta_sc"] = "储备充足",
        ["menu_ammo_2x_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你放置的弹药袋的弹药容量额外增加#{skill_color}#200%##\n\n专精: #{risk}#$pro##\n你现在可以放置#{skill_color}#2##个弹药袋",

        -- Rip and Tear formally Carbon Blade
        ["menu_carbon_blade_beta_sc"] = "锯刃轰鸣",
        ["menu_carbon_blade_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的电锯攻击可以穿过盾牌和泰坦盾造成伤害。\n\n专精: #{risk}#$pro##\n你使用电锯、弓、弩、榴弹发射器或火箭筒击杀敌人有#{skill_color}#50%##的几率在半径#{skill_color}#10##米内的敌人中#{skill_color}#散播恐慌##。\n\n恐慌会使敌人短暂地失去行动能力",

        -- Fully Loaded--
        ["menu_bandoliers_beta_sc"] = "全副武装",
        ["menu_bandoliers_desc_sc"] = "掌握: #{risk}#$basic##\n你武器携带的总弹量增加#{skill_color}#25%##\n\n专精: #{risk}#$pro##\n你武器从每个弹药盒中获取的弹药量增加#{skill_color}#50%##\n\n你有#{skill_color}#5%##的几率从一个弹药盒中获得一个投掷物\n\n若你没有从一个弹药盒中成功获取投掷物，那么该几率将提升#{skill_color}#1%##，成功获取投掷物后该几率将被重置\n\n#{important_1}#提示：你无法用此技能补充天赋/充能投掷物道具##",

        -- }
        -- }

        --[[   TECHNICIAN   ]] --
        -- {
        --[[   ENGINEER SUBTREE   ]] --
        -- {

        -- Logistician
        ["menu_defense_up_beta_sc"] = "后勤干员",
        ["menu_defense_up_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你放置和使用随身装备的速度加快#{skill_color}#25%##\n\n专精: #{risk}#$pro##\n你的放置和使用随身装备的速度都额外加快#{skill_color}#50%##，你队友则加快#{skill_color}#25%##。\n\n#{important_1}#提示：该效果不能叠加##",

        -- Nerves of Steel--    
        ["menu_fast_fire_beta_sc"] = "钢铁意志",
        ["menu_fast_fire_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你现在可以#{skill_color}#在倒地时使用武器瞄准##。\n\n专精: #{risk}#$pro##\n你在互动时获得#{skill_color}#50%##的伤害减免。",

        -- Engineering
        ["menu_eco_sentry_beta_sc"] = "工程师",
        ["menu_eco_sentry_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的哨戒机枪血量上限增加#{skill_color}#40%##\n\n专精: #{risk}#$pro##\n你的哨戒机枪血量上限额外增加#{skill_color}#60%##",

        -- Jack of all Trades
        ["menu_jack_of_all_trades_beta_sc"] = "万事通",
        ["menu_jack_of_all_trades_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你携带非天赋投掷物的量提高#{skill_color}#50%##\n\n专精: #{risk}#$pro##\n你现在可以#{skill_color}#携带两个随身装备##，按#{skill_color}#$BTN_CHANGE_EQ##来在两个随身装备之间切换\n\n副随身装备的携带量只有原来的#{skill_color}#一半##，最少为#{skill_color}#1##",

        -- Sentry Tower Defense--
        ["menu_tower_defense_beta_sc"] = "塔防机枪",
        ["menu_tower_defense_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的哨戒机枪现在可以使用AP穿甲弹，使用这种弹药后哨戒机枪的射速减缓#{important_1}#66%##并且其射出的子弹可以#{skill_color}#穿透敌人的护甲和盾牌##\n\n专精: #{risk}#$pro##\n你现在最多可以携带#{skill_color}#2##个哨戒机枪\n\n放置哨戒机枪消耗的总弹量降低至#{skill_color}#35%##\n(主副武器各17.5%)",

        -- Bulletproof--
        ["menu_iron_man_sc"] = "刀枪不入",
        ["menu_iron_man_desc_sc"] = "掌握: #{risk}#$basic##\n你的护甲现在#{skill_color}#不能被穿透##\n#{important_1}#提示：对自我伤害无效##\n\n专精: #{risk}#$pro##\n当你的护甲值为满时，你将获得减伤，减伤的量等于你护甲值上限的#{skill_color}#15%##\n\n你的护甲恢复速度加快#{skill_color}#15%##",

        -- }

        --[[   BREACHER SUBTREE   ]] --
        -- {

        -- Hardware Expert-- 硬件专家  Silent Drilling
        ["menu_hardware_expert_beta_sc"] = "静音钻机",
        ["menu_hardware_expert_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的钻机现在#{skill_color}#完全静音##，平民和保安必须看到钻机才会警觉。\n\n专精: #{risk}#$pro##\n你修理电锯和钻机的速度加快#{skill_color}#50%##。",

        -- Danger Close 危险勿近  Demoman
        ["menu_trip_mine_expert_beta_sc"] = "恐怖分子",
        ["menu_combat_engineering_desc_sc"] = "掌握: #{risk}#$basic##\n你现在可以携带#{skill_color}#6##个聚能炸药。\n\n你放置聚能炸药和诡雷的速度加快#{skill_color}#25%##。\n\n专精: #{risk}#$pro##\n你现在可以携带#{skill_color}#8##个聚能炸药。\n\n诡雷的爆炸半径增加#{skill_color}#30%##。",

        -- Drill Sawgeant 钻锯技工
        ["menu_drill_expert_beta_sc"] = "钻锯技工",
        ["menu_drill_expert_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的电锯和钻机工作所需时间减少#{skill_color}#10%##\n\n专精: #{risk}#$pro##\n你的电锯和钻机工作所需时间额外减少#{skill_color}#20%##",

        -- Demoman-- 恐怖分子  Fire Trap
        ["menu_more_fire_power_sc"] = "火焰陷阱",
        ["menu_more_fire_power_desc_sc"] = "掌握: #{risk}#$basic##\n你的诡雷在爆炸后将释放一个持续#{skill_color}#10##秒，半径#{skill_color}#7.5##米的火焰。\n\n诡雷释放的火焰不会伤害你和你的队友。\n\n专精: #{risk}#$pro##\n你现在可以携带#{skill_color}#10##个诡雷。\n\n你诡雷的伤害提高#{skill_color}#50%##。",

        -- Kickstarter 物理修复  Expert Hardware
        ["menu_kick_starter_beta_sc"] = "硬件专家",
        ["menu_kick_starter_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的电锯和钻机在组装完毕时有#{skill_color}#10%##的概率变成自动修复的电锯或钻机。\n\n专精: #{risk}#$pro##\n你的电锯和钻机变成自动修复版的概率提高#{skill_color}#20%##。\n\n试图破坏你钻机的敌人有#{skill_color}#50%##的概率被电击，以阻止他们的破坏行为。",

        -- Fire Trap 火焰陷阱  Kickstarter
        ["menu_fire_trap_beta_sc"] = "物理修复",
        ["menu_fire_trap_beta_desc_sc"] = "掌握: #{risk}#$basic##\n钻机损坏后，近战武器有#{skill_color}#75%##的概率在攻击钻机后将其修复。\n\n#{important_1}#提示：每次损坏只有一次机会，若修复失败则本次无法再使用近战武器修复##\n\n专精: #{risk}#$pro##\n你#{skill_color}#互动时不再收起武器##。\n\n你可以在互动时自由地转向、蹲伏、瞄准和开火。",

        -- }

        --[[  BATTLE SAPPER  SUBTREE   ]] --
        -- {

        -- }
        -- }

        --[[   GHOST   ]] --
        -- {
        --[[   COVERT OPS SUBTREE   ]] --
        -- {

        -- Alert--
        ["menu_jail_workout_sc"] = "警戒",
        ["menu_jail_workout_desc_sc"] = "掌握: #{risk}#$basic##\n敌人被你标记的时间延长#{skill_color}#100%##。\n\n专精: #{risk}#$pro##\n你现在可以#{skill_color}#通过开镜瞄准来标记特殊敌人和你潜入时看见的保安##。",

        -- Sixth Sense--
        ["menu_chameleon_beta_sc"] = "第六感",
        ["menu_chameleon_beta_desc_sc"] = "掌握: #{risk}#$basic##\n原地不动#{skill_color}#3.5##秒后，你会#{skill_color}#自动标记##半径#{skill_color}#10##米内的所有单位。\n\n专精: #{risk}#$pro##\n你现在可以#{skill_color}#解锁所有的内应有利条件##了。",

        -- ECM Overdrive--
        ["menu_cleaner_beta_sc"] = "ECM过载",
        ["menu_cleaner_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的ECM干扰器现在能用于#{skill_color}#打开部分电子门##。\n\n专精: #{risk}#$pro##\nECM干扰器的干扰与反馈的持续时间提高#{skill_color}#25%##。\n\n你放置的ECM干扰器可以#{skill_color}#推迟对讲机应答##。",

        -- Nimble--
        ["menu_second_chances_beta_sc"] = "心灵手巧",
        ["menu_second_chances_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你现在可以无声地#{skill_color}#徒手打开部分保险箱##。\n\n你与电脑、摄像头、ECM干扰器等电子设备的互动速度加快#{skill_color}#30%##。\n\n专精: #{risk}#$pro##\n你的撬锁速度加快#{skill_color}#50%##。\n\n你与电脑、摄像头、ECM干扰器等电子设备的互动速度额外加快#{skill_color}#50%##。",

        -- ECM Specialist--
        ["menu_ecm_booster_beta_sc"] = "ECM专精",
        ["menu_ecm_booster_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你现在可以携带#{skill_color}#3##个ECM干扰器。\n\n专精: #{risk}#$pro##\n你现在可以携带#{skill_color}#4##个ECM干扰器。",

        -- Spotter--
        ["menu_ecm_2x_beta_sc"] = "侦察先锋",
        ["menu_ecm_2x_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你标记的敌人在#{skill_color}#20##米外受到的伤害增加#{skill_color}#25%##。\n\n专精: #{risk}#$pro##\n你标记的敌人在任何距离受到的伤害都额外增加#{skill_color}#35%##。",

        -- }

        --[[   COMMANDO SUBTREE   ]] --
        -- {

        -- Duck and Cover--
        ["menu_sprinter_beta_sc"] = "蹲防战术",
        ["menu_sprinter_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的耐力将提前#{skill_color}#25%##的时间进行恢复且恢复速度加快#{skill_color}#25%##。\n\n专精: #{risk}#$pro##\n蹲伏时，你的闪避条每秒增加你闪避点数的#{skill_color}#6%##。\n\n你的蹲伏移动速度加快#{skill_color}#10%##。",

        -- Deep Pockets--
        ["menu_thick_skin_beta_sc"] = "深层口袋",
        ["menu_thick_skin_beta_desc_sc"] = "掌握: #{risk}#$basic##\n近战武器的隐匿度增加#{skill_color}#2##。\n\n专精: #{risk}#$pro##\n所有防弹背心的隐匿度增加#{skill_color}#4##，其它护甲则增加#{skill_color}#2##。\n\n两件套西装和所有防弹背心的护甲增加#{skill_color}#20##。",

        -- Moving Target--
        ["menu_dire_need_beta_sc"] = "移动目标",
        ["menu_dire_need_beta_desc_sc"] = "掌握: #{risk}#$basic##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#3##点暴露风险都将获得#{skill_color}#1.5%##的移动速度加成，最多加快#{skill_color}#15%##。\n\n专精: #{risk}#$pro##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#1##点暴露风险都将获得#{skill_color}#1.5%##的移动速度加成，最多加快#{skill_color}#15%##。\n\n冲刺时，你的闪避条每秒增加你闪避点数的#{skill_color}#15%##；\n滑索上，你的闪避条每秒增加你闪避点数的#{skill_color}#30%##。",

        -- Shockproof
        ["menu_insulation_beta_sc"] = "绝缘装甲",
        ["menu_insulation_beta_desc_sc"] = "掌握: #{risk}#$basic##\n被泰瑟警察电击时，你#{skill_color}#不会被强制开枪##且有#{skill_color}#15%##的几率反火并击晕电击你的泰瑟警察。\n\n提示：被电击时产生的精准和稳定惩罚及抖动幅度不变。\n\n敌人枪击造成的抖动降低#{skill_color}#30%##。\n\n专精: #{risk}#$pro##\n被泰瑟警察电击后的#{skill_color}#2##秒内对它按[互动键]可以立即对电击你的泰瑟警察造成一次反火，并对其造成其血量#{skill_color}#50%##的伤害。\n\n泰坦泰瑟射击你造成的减速效果和时间减少#{skill_color}#50%##。",

        -- }

        --[[   SILENT KILLER SUBTREE   ]] --
        -- {

        -- Second Wind
        ["menu_scavenger_beta_sc"] = "卷土重来",
        ["menu_scavenger_beta_desc_sc"] = "掌握: #{risk}#$basic##\n护甲被破坏后你将在#{skill_color}#3##秒内获得#{skill_color}#10%##的移动速度加成\n\n专精: #{risk}#$pro##\n护甲被破坏后，你射出的第一发子弹将必定击倒敌人\n\n该效果在你护甲恢复后#{skill_color}#3##秒内仍然有效",

        -- Optical Illusions--
        ["menu_optic_illusions_sc"] = "光学幻象",
        ["menu_optic_illusions_desc_sc"] = "掌握: #{risk}#$basic##\n你的切枪速度加快#{skill_color}#15%##。\n\n专精: #{risk}#$pro##\n所有武器的隐匿度增加#{skill_color}#2##。",

        -- The Professional--
        ["menu_silence_expert_beta_sc"] = "职业杀手",
        ["menu_silence_expert_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你使用武器瞄准的速度和冲刺转开火的速度加快#{skill_color}#5%##。\n\n专精: #{risk}#$pro##\n你使用武器瞄准的速度和冲刺转开火的速度额外加快#{skill_color}#10%##。\n\n被使用一般实弹的武器击杀的特殊敌人会额外掉落一个弹药盒。",

        -- Unseen Strike, formally Dire Need--
        ["menu_backstab_beta_sc"] = "掩其无备",
        ["menu_backstab_beta_desc_sc"] = "掌握: #{risk}#$basic##\n如果你在#{skill_color}#3##秒内没有受到任何伤害，你将获得#{skill_color}#15%##的暴击率加成直到你受到伤害为止。\n\n成功暴击将使你造成的伤害提升#{skill_color}#50%##。\n\n#{important_1}#提示：\"杀手\"天赋的临时虚血自动衰减不算受到伤害，而临时虚血因非衰减因素降低都算受到伤害##\n\n专精: #{risk}#$pro##\n受到伤害后，暴击率加成仍将持续#{skill_color}#4##秒。",

        -- Cleaner--
        ["menu_hitman_beta_sc"] = "清道夫",
        ["menu_hitman_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你对特殊敌人造成的伤害增加#{skill_color}#10%##。\n\n#{important_1}#提示：该效果不适用于榴弹发射器和火箭筒##\n\n专精: #{risk}#$pro##\n你对特殊敌人造成的伤害额外增加#{skill_color}#15%##。\n\n爆头击杀敌人将使你的闪避条增加闪避点数的#{skill_color}#12.5%##，击杀一名背对你的敌人将使你的闪避条增加闪避点数的#{skill_color}#75%##，两者可以叠加。\n\n#{important_1}#提示：使用爆炸物或火焰这样的持续伤害击杀敌人无法获得闪避条的增加##\n",

        -- Low Blow--
        ["menu_unseen_strike_beta_sc"] = "下作手段",
        ["menu_unseen_strike_beta_desc_sc"] = "掌握: #{risk}#$basic##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#3##点暴露风险都将获得#{skill_color}#3%##的暴击率，最多增加#{skill_color}#30%##。\n\n成功暴击将使你造成的伤害提升#{skill_color}#50%##。\n\n专精: #{risk}#$pro##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#1##点暴露风险都将获得#{skill_color}#3%##的暴击率，最多增加#{skill_color}#30%##。\n\n使用枪械或近战武器从背后攻击一名敌人的暴击几率额外增加#{skill_color}#50%##。",

        -- }
        -- }

        --[[   FUGITIVE   ]] --
        -- {
        --[[   GUNSLINGER SUBTREE   ]] --
        -- {

        -- }

        --[[   RELENTLESS SUBTREE   ]] --
        -- {

        -- Swan Song
        ["menu_perseverance_desc_sc"] = "掌握: #{risk}#$basic##\n你的血量为#{skill_color}#0##时不会立刻倒地，你能在#{skill_color}#3##秒内获得无敌并持续战斗，但此时的移动速度减少#{skill_color}#60%##，3秒结束后进入倒地状态\n\n专精: #{risk}#$pro##\n倒地前持续战斗的时间额外增加#{skill_color}#6##秒",

        -- }

        --[[   BRAWLER SUBTREE   ]] --
        -- {

        -- Counter-Strike--
        ["menu_drop_soap_beta_sc"] = "反\"控\"精英",
        ["menu_drop_soap_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你现在能通过按住#{skill_color}#[近战键]##在近战武器蓄力时反击幻影特工的飞踢并将其击倒\n\n幻影特工的飞踢和泰瑟警察的电击使你倒地造成的伤害减少#{skill_color}#20%##\n\n专精: #{risk}#$pro##\n你手持近战武器时受到来自远程武器的伤害减少#{skill_color}#10%##\n\n幻影特工的飞踢和泰瑟警察的电击使你倒地造成的伤害额外减少#{skill_color}#30%##",

        -- Bloodthirst--
        ["menu_bloodthirst_sc"] = "血之渴望",
        ["menu_bloodthirst_desc_sc"] = "掌握: #{risk}#$basic##\n使用近战武器击杀敌人将在#{skill_color}#10##秒内获得#{skill_color}#25%##的换弹速度加成\n\n专精: #{risk}#$pro##\n每击杀一个敌人会提高#{skill_color}#25%##你下一次使用近战武器攻击的伤害，伤害增益上限为#{skill_color}#100%##\n\n该效果将在使用近战武器成功击中敌人后重置",

        -- }
        -- }
        -- }

        -- Sneaky Bastard--
        ["menu_jail_diet_beta_desc_sc"] = "掌握: #{risk}#$basic##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#3##点暴露风险都将获得#{skill_color}#1##点闪避点数，最多增加#{skill_color}#10##点\n\n专精: #{risk}#$pro##\n当你的暴露风险低于#{skill_color}#35##时，每降低#{skill_color}#1##点暴露风险都将获得#{skill_color}#1##点闪避点数，最多增加#{skill_color}#10##点\n\n你的护甲被破坏时，每次闪避成功都将恢复你血量上限#{skill_color}#2%##的血量",

        -- Sharpshooter--
        ["menu_discipline_sc"] = "神枪手",
        ["menu_discipline_desc_sc"] = "掌握: #{risk}#$basic##\n突击步枪和狙击步枪的稳定性增加#{skill_color}#2##\n\n专精: #{risk}#$pro##\n完成爆头击杀将在#{skill_color}#10##秒内使你的开火速率增加#{skill_color}#20%##，该效果只能由#{skill_color}#单发射击##和#{skill_color}#速射模式##的突击步枪和狙击步枪触发",

        -- Kilmer-- 
        ["menu_heavy_impact_beta_sc"] = "基尔默",
        ["menu_heavy_impact_beta_desc_sc"] = "掌握: #{risk}#$basic##\n突击步枪和狙击步枪的移动时受到的精准度惩罚减少#{skill_color}#60%##。\n\n移动时受到的精准度惩罚会被稳定性影响。\n\n专精: #{risk}#$pro##\n突击步枪和狙击步枪的换弹速度加快#{skill_color}#25%##",

        -- Mind Blown, formerly Explosive Headshot--
        ["menu_kilmer_sc"] = "脑\"洞\"大开",
        ["menu_kilmer_desc_sc"] = "掌握: #{risk}#$basic##\n完成爆头的同时，被爆头的敌人半径#{skill_color}#4##米内最近的敌人会受到你刚刚爆头伤害#{skill_color}#70%##的擦伤，该效果只能由#{skill_color}#单发射击##和#{skill_color}#速射模式##的突击步枪和狙击步枪触发\n\n被爆头的敌人每离你#{skill_color}#8##米远，就会有一个额外的敌人受到该擦伤效果，最多同时擦伤#{skill_color}#3##名敌人\n\n专精: #{risk}#$pro##\n使用突击步枪或狙击步枪爆头产生的伤害#{skill_color}#不受距离衰减影响##\n\n可被擦伤的距离增加#{skill_color}#1##米\n\n被爆头的敌人每离你#{skill_color}#8##米远，擦伤的伤害就额外增加#{skill_color}#10%##，最多额外增加#{skill_color}#100%##",

        -- Ammo Efficiency--
        ["menu_single_shot_ammo_return_sc"] = "弹无虚发",
        ["menu_single_shot_ammo_return_desc_sc"] = "掌握: #{risk}#$basic##\n在#{skill_color}#8##秒内完成#{skill_color}#3##次爆头击杀会额外给予你武器总弹量#{skill_color}#3%##的子弹，最少可以获得#{skill_color}#1##发弹药。\n该效果只能由#{skill_color}#单发射击##和#{skill_color}#速射模式##的突击步枪和狙击步枪触发。\n\n专精: #{risk}#$pro##\n现在只需要在#{skill_color}#12##秒内完成#{skill_color}#2##次爆头击杀就能触发技能。", -- ，子弹会在你弹匣不满时#{skill_color}#直接加进弹匣中##

        -- Rifleman
        ["menu_rifleman_sc"] = "步枪精通",
        ["menu_rifleman_desc_sc"] = "掌握: #{risk}#$basic##\n突击步枪和狙击步枪在瞄准时的精准度和射程提高#{skill_color}#15%##。\n\n专精: #{risk}#$pro##\n突击步枪和狙击步枪在瞄准时的精准度和射程额外增加#{skill_color}#15%##",

        -- Aggressive Reload
        ["menu_engineering_beta_sc"] = "迅猛装填",
        ["menu_engineering_beta_desc_sc"] = "掌握: #{risk}#$basic##\n完成爆头击杀会在#{skill_color}#10##秒内加快你#{skill_color}#25%##的换弹速度，该效果只能由#{skill_color}#单发射击##和#{skill_color}#速射模式##的突击步枪和狙击步枪触发\n\n专精: #{risk}#$pro##\n换弹速度增益提升至#{skill_color}#50%##且可以由#{skill_color}#连发射击##的突击步枪和狙击步枪触发",

        -- Evasion--
        ["menu_awareness_beta_sc"] = "紧急回避",
        ["menu_awareness_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的移动速度加快#{skill_color}#5%##。\n\n你受到的摔落伤害减少#{skill_color}#75%##。\n\n专精: #{risk}#$pro##\n#{skill_color}#跑步换弹##——你现在可以在冲刺时换弹。\n\n你可以在模组设置中选择是否依然在起跑时打断换弹",

        -- Equilibrium--
        ["menu_equilibrium_beta_sc"] = "沉着冷静",
        ["menu_equilibrium_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你与你队友的手枪稳定性增加#{skill_color}#2##。\n\n专精: #{risk}#$pro##\n手枪的切枪速度加快#{skill_color}#100%##。",

        -- Gun Nut--
        ["menu_dance_instructor_sc"] = "手枪狂徒",
        ["menu_dance_instructor_desc_sc"] = "掌握: #{risk}#$basic##\n腰射时，手枪的精准度增加#{skill_color}#20%##。\n\n专精: #{risk}#$pro##\n手枪的射速增加#{skill_color}#15%##。\n\n你的手枪现在可以#{skill_color}#穿透护甲##造成#{skill_color}#100%##的伤害。",

        -- Over Pressurized/Gunfighter--
        ["menu_gun_fighter_sc"] = "手枪斗士",
        ["menu_gun_fighter_desc_sc"] = "掌握: #{risk}#$basic##\n手枪的换弹速度加快#{skill_color}#5%##。\n\n在移动时，手枪受到的精准度惩罚减少#{skill_color}#40%##。\n\n移动时的精准度惩罚程度取决于稳定性\n\n专精: #{risk}#$pro##\n手枪的换弹速度额外加快#{skill_color}#25%##。",

        -- Akimbo--
        ["menu_akimbo_skill_sc"] = "孤岛飞鹰",
        ["menu_akimbo_skill_desc_sc"] = "掌握: #{risk}#$basic##\n双持武器的稳定性增加#{skill_color}#10##。\n\n专精: #{risk}#$pro##\n双持武器的精准度增加#{skill_color}#10##。",

        -- Desperado--
        ["menu_expert_handling_sc"] = "亡命之徒",
        ["menu_expert_handling_desc_sc"] = "掌握: #{risk}#$basic##\n使用手枪完成爆头会在#{skill_color}#4##秒内提高你所有武器#{skill_color}#8%##的精准度和射程。\n该效果可叠加#{skill_color}#5##次，每次使用手枪#{skill_color}#爆头##可以使效果持续时间重置为四秒。\n\n#{important_1}#提示：该技能的精准度增加不适用于霰弹枪和火焰喷射器##\n\n专精: #{risk}#$pro##\n该效果的持续时间延长至#{skill_color}#8##秒，重置后持续时间也是八秒。",

        -- Trigger Happy--
        ["menu_trigger_happy_beta_sc"] = "乱枪狂人",
        ["menu_trigger_happy_beta_desc_sc"] = "掌握: #{risk}#$basic##\n使用手枪完成爆头会在#{skill_color}#4##秒内提高手枪#{skill_color}#5%##的伤害。\n该效果可叠加#{skill_color}#4##次，每次使用手枪#{skill_color}#爆头##可以使效果持续时间重置为四秒。\n\n专精: #{risk}#$pro##\n该效果的可叠加次数增加至#{skill_color}#10##次，持续时间延长至#{skill_color}#8##秒，重置后持续时间也是八秒。",

        -- Running From Death--
        ["menu_nine_lives_beta_sc"] = "死里逃生",
        ["menu_nine_lives_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你倒地起身后在#{skill_color}#10##秒内移动速度加快#{skill_color}#25%##\n\n专精: #{risk}#$pro##\n你倒地起身后在#{skill_color}#10##秒内受到的伤害减少#{skill_color}#20%##，且起身后你的#{skill_color}#武器会立即装填完毕##",

        -- Undying--
        ["menu_running_from_death_beta_sc"] = "苟延残喘",
        ["menu_running_from_death_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你倒地时的血量增加#{skill_color}#100%##\n\n专精: #{risk}#$pro##\n你倒地时的血量额外增加#{skill_color}#100%##\n\n你现在可以#{skill_color}#在倒地时使用主武器##",

        -- What Doesn't Kill You Only Makes You Stronger--
        ["menu_what_doesnt_kill_beta_sc"] = "越挫越勇",
        ["menu_what_doesnt_kill_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你获得#{skill_color}#X##点伤害吸收。\n#{skill_color}#X##=#{skill_color}#初始倒地次数##-#{skill_color}#剩余倒地次数##\n\n专精: #{risk}#$pro##\n该技能提供的伤害吸收效果变为原来的#{skill_color}#3##倍。",

        -- Haunt--
        ["menu_haunt_sc"] = "恐惧弥漫",
        ["menu_haunt_desc_sc"] = "掌握: #{risk}#$basic##\n击杀一名在你半径#{skill_color}#18##米内的敌人有概率在附近#{skill_color}#12##米的敌人中#{skill_color}#散播恐慌##，初始概率为#{skill_color}#5%##，每次倒地会提升该效果触发概率的#{skill_color}#5%##，该效果会随着你倒地次数的恢复而减少。\n\n恐慌会使敌人短暂地失去行动能力\n\n专精: #{risk}#$pro##\n初始概率提高至#{skill_color}#20%##。",

        -- Messiah--
        ["menu_pistol_beta_messiah_sc"] = "弥赛亚",
        ["menu_pistol_beta_messiah_desc_sc"] = "掌握: #{risk}#$basic##\n倒地时，击杀一名敌人可以让你自起。\n\n你只有#{skill_color}#1##次机会，每次从监狱复活出来会让你恢复这次机会。\n\n在你第一次被逮捕之前，可倒地次数增加#{skill_color}#1##次。\n\n专精: #{risk}#$pro##\n你现在有#{skill_color}#无限##的自起次数，自起冷却时间为#{skill_color}#120##秒，倒地击杀敌人可以减少当前剩余冷却时间#{skill_color}#10##秒",

        -- Martial Arts--
        ["menu_martial_arts_beta_sc"] = "武术训练",
        ["menu_martial_arts_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你受到来源于近战武器的伤害减少#{skill_color}#50%##。\n\n专精: #{risk}#$pro##\n你近战武器的击倒指数增加#{skill_color}#100%##。\n\n近战武器的击倒指数将影响你用近战武器攻击时击倒敌人的概率，并决定你近战武器能对熊的护甲和面甲造成多少伤害。",

        -- Pumping Iron--
        ["menu_steroids_beta_sc"] = "铁拳无敌",
        ["menu_steroids_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你近战武器的蓄力速度和攻击速度都增快#{skill_color}#20%##\n\n专精: #{risk}#$pro##\n你近战武器的蓄力速度和攻击速度都额外增快#{skill_color}#30%##",

        -- Frenzy--
        ["menu_wolverine_beta_sc"] = "狂乱",
        ["menu_wolverine_beta_desc_sc"] = "掌握: #{risk}#$basic##\n你的血量越少，你的血量减伤分数越高，你受到的回血效果也越弱。\n\n你的血量低于#{skill_color}#100%##时，你受到的对#{skill_color}#血量##的伤害最多减少#{skill_color}#30%##，你受到的回血效果也最多减少#{skill_color}#20%##。\n\n对血量的减伤会在其他减伤计算完后再进行计算，你最多能有#{skill_color}#$deflection##的血量减伤分数。\n\n专精: #{risk}#$pro##\n你的血量越少，你的血量减伤分数越高，你受到的回血效果也越弱。\n\n现在你的血量低于#{skill_color}#100%##时，你受到的对#{skill_color}#血量##的伤害最多减少#{skill_color}#75%##，你受到的回血效果最多减少#{skill_color}#50%##。",

        -- Berserker--
        ["menu_frenzy_sc"] = "狂战士",
        ["menu_frenzy_desc_sc"] = "掌握: #{risk}#$basic##\n你的血量越少，伤害就越高。\n\n你的血量低于#{skill_color}#100%##时，你将会获得最高#{skill_color}#100%##的#{skill_color}#近战武器和电锯##伤害加成。\n\n专精: #{risk}#$pro##\n你的血量越少，伤害就越高。\n\n你的血量低于#{skill_color}#100%##时，你将获得最高#{skill_color}#50%##的#{skill_color}#远程武器##伤害加成。\n\n#{important_1}#提示：不适用于榴弹发射器和火箭筒##"

    })

    if not easterless then
        local butt = math.rand(1)
        local frame = 0.01
        if butt <= frame then
            LocalizationManager:add_localized_strings({
                ["menu_st_spec_23"] = "瑞典蠢驴",
                ["menu_st_spec_23_desc"] = "谁抄袭一堆MOD当DLC卖？谁的BUG的修了一个又一个，还是没修完？谁的游戏闪退成为日常？\n\n\n#{important_1}#只有我——Overkill。##\n\n\n",
                ["menu_difficulty_sm_wish"] = "钢铁之路",
                ["menu_risk_sm_wish"] = "钢铁之路，为那些掌控了秘密诀窍并寻求挑战的人而准备。"
            })
        end
    end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
    LocalizationManager:add_localized_strings({
        ["bm_menu_dodge"] = "闪避点数",
        ["menu_st_category_activated"] = "激活",
        ["menu_st_category_challenge"] = "白卡",
        ["menu_st_category_mod"] = "模组",

        -- Shared Perks--
        ["menu_deckall_2_desc_sc"] = "你的爆头伤害增加##25%##。\n\n你造成的伤害增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒。",
        ["menu_deckall_4_desc_sc"] = "你的隐匿度增加##1##。\n\n防弹背心带来的移动速度惩罚减少##15%##。\n\n你完成单日劫案和整个合约后获得的经验值增加##45%##。\n\n你造成的伤害额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒。",
        ["menu_deckall_6_desc_sc"] = "##解锁手雷箱##以供你使用。\n\n你造成的伤害再额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒。",
        ["menu_deckall_8_desc_sc"] = "你使用医疗箱的速度加快##20%##。\n\n你造成的伤害再次额外增加##25%##，该效果不适用于投掷物、榴弹发射器和火箭筒。",

        -- Crook--

        ["menu_deck6_1_desc_sc"] = "你的闪避点数增加##5##。\n\n防弹背心的护甲值提高##15%##。",
        ["menu_deck6_3_desc_sc"] = "防弹背心的闪避点数增加##5##。",
        ["menu_deck6_5_desc_sc"] = "防弹背心的护甲值额外提高##15%##。\n\n你的撬锁速度加快##20%##。",
        ["menu_deck6_7_desc_sc"] = "防弹背心的闪避点数额外增加##5##。",
        ["menu_deck6_9_desc_sc"] = "防弹背心的护甲值再额外提高##20%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Rogue

        ["menu_deck4_1_desc_sc"] = "你的闪避点数增加##5##。\n\n你的切枪速度加快##30%##。",
        ["menu_deck4_3_desc_sc"] = "你的闪避点数额外增加##5##。",
        ["menu_deck4_5_desc_sc"] = "倒地起身后，你的闪避条增加至其正常状态上限的##200%##。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        ["menu_deck4_7_desc_sc"] = "你的闪避点数再额外增加##5##。",
        ["menu_deck4_9_desc_sc"] = "完成一次闪避后的##5##秒内，你的血量每##1##秒将增加##1##点；该效果可以叠加，但一旦你受到了对血量的伤害，所有叠加的这种增益都会失效。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Hitman--
        ["menu_deck5_1_sc"] = "刀枪并进",
        ["menu_deck5_3_sc"] = "进阶杀手",
        ["menu_deck5_5_sc"] = "铅笔杀神",
        ["menu_deck5_7_sc"] = "终极杀手",

        ["menu_deck5_1_desc_sc"] = "使用非近战武器击杀一名敌人将为你储存##25##点血量，储存血量的上限为##75##点。\n\n使用近战武器杀敌将使储存的血量转化为临时虚血，临时虚血跟血量一样是你的生命值，临时虚血会以每秒##5##点的速度减少。\n\n临时虚血可以超出你的血量上限，你最多能拥有##240##点临时虚血。",
        ["menu_deck5_3_desc_sc"] = "你的护甲恢复后，闪避条将会增加闪避点数的##100%##。\n\n你的闪避点数增加##5##。",
        ["menu_deck5_5_desc_sc"] = "你现在可以多储存##60%##的血量。\n\n你初始携带的尸体袋数量增加##1##。",
        ["menu_deck5_7_desc_sc"] = "你倒地起身后获得##120##的临时虚血。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck5_9_desc_sc"] = "当你有临时虚血时，你受到的对##血量##的伤害减少##10%##且你的移动速度额外增加##20%##。\n\n对血量的减伤会在其他减伤计算完后再进行计算，你最多能有##60%##的血量减伤分数。\n\n赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Muscle

        ["menu_deck2_1_desc_sc"] = "你的血量上限增加##10%##。",
        ["menu_deck2_3_desc_sc"] = "你的血量上限额外增加##10%##。\n\n你的闪避点数增加##5##。",
        ["menu_deck2_5_desc_sc"] = "你的血量上限再额外增加##10%##。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        ["menu_deck2_7_desc_sc"] = "每次的开火射击有##5%##的几率在敌人中##散播恐慌##，恐慌会使敌人短暂地失去行动能力。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck2_9_desc_sc"] = "你的血量上限再次额外增加##10%##。\n\n你倒地起身后的血量恢复##25%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Crew Chief

        ["menu_deck1_3_desc_sc"] = "你和你队友的耐力提高##50%##。\n\n提示：该效果不能由多个使用领队天赋的玩家叠加\n\n你的闪避点数增加##5##。\n\n你呼喊的距离增加##25%##。",
        ["menu_deck1_5_desc_sc"] = "你的血量上限增加##10%##，你队友的血量上限增加##5%##。\n\n提示：该效果不能由多个使用领队天赋的玩家叠加\n\n你回答对讲机所需的时间减少##25%##。",
        ["menu_deck1_7_desc_sc"] = "你的护甲值提高##10%##。\n\n提示：该效果不能由多个使用领队天赋的玩家叠加。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck1_9_desc_sc"] = "每位人质会为你和队友增加##5%##的血量上限和##10%##的耐力，最多叠加##4##次。\n\n提示：该效果不能由多个使用领队天赋的玩家叠加\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
        -- I only had to put these in to fix Overkill's shitty rebalance attempt--
        -- Armorer--

        ["menu_deck3_1_desc_sc"] = "你的护甲值增加##10%##。",
        ["menu_deck3_3_desc_sc"] = "你的护甲值额外增加##10%##。",
        ["menu_deck3_5_desc_sc"] = "你的护甲值再额外增加##5%##。\n\n你可以放置##2##个尸体袋箱。",
        ["menu_deck3_7_desc_sc"] = "你的护甲恢复速度加快##10%##。",
        ["menu_deck3_9_desc_sc"] = "你的护甲恢复速度额外加快##5%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Burglar--

        ["menu_deck7_1_desc_sc"] = "你的闪避点数增加##5##。\n\n蹲伏时，你的闪避条每秒增加闪避点数的##5%##。",
        ["menu_deck7_3_desc_sc"] = "你的闪避点数额外增加##5##。",
        ["menu_deck7_5_desc_sc"] = "你蹲伏的移动速度加快##20%##。\n\n蹲伏时，你的闪避条每秒额外增加闪避点数的##5%##。",
        ["menu_deck7_7_desc_sc"] = "你的闪避点数再额外增加##5##。",
        ["menu_deck7_9_desc_sc"] = "你的护甲恢复速率增加##10%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Gambler--

        ["menu_deck10_1_desc_sc"] = "你捡起一个弹药盒会回复##3##至##6##点血量。\n\n冷却时间为##8##秒，每捡起一个弹药盒会减少冷却时间##1##至##4##秒。",
        ["menu_deck10_3_desc_sc"] = "你从敌人掉落的弹药盒中获得弹药时，你的团队成员会获得##15%##个弹药盒的弹药补充。\n\n你的闪避点数增加##5##。",
        ["menu_deck10_5_desc_sc"] = "你捡起一个弹药盒回复的血量额外增加##1##。\n\n你回答对讲机所需的时间减少##25%##。",
        ["menu_deck10_7_desc_sc"] = "当你触发捡弹回血时，你的队友也回复你回血量##50%##的血量。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck10_9_desc_sc"] = "你捡起一个弹药盒回复的血量再额外增加##1##。\n\n当你触发捡弹回血时，你的护甲值也回复##30##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
        ["menu_deck10_7"] = "狡诈灵药",
        ["menu_deck10_9"] = "满贯神药",

        -- Infiltrator--

        ["menu_deck8_1_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害减少##5%##。",
        ["menu_deck8_3_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害额外减少##5%##。\n你的闪避点数增加##5##。",
        ["menu_deck8_5_desc_sc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害再额外减少##10%##。\n\n每次使用近战武器成功击中敌人都将在##10##秒内使你的近战武器伤害增加##8%##，该效果可以叠加且最多叠加##5##次，打空失效。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        ["menu_deck8_7_desc_sc"] = "近战武器击中敌人后，近战武器伤害加成额外增加##8%##。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck8_9_desc_sc"] = "每次使用近战武器成功击中敌人都将在##5##秒内使你的血量每##1##秒回复##1##点，该效果可以叠加且最多叠加##5##次。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Sociopath--

        ["menu_deck9_1_sc"] = "非礼勿言",
        ["menu_deck9_1_desc_sc"] = "当你被##18##米内至少##3##名敌人包围时，你受到来自敌人的伤害减少##5%##。",
        ["menu_deck9_3_desc_sc"] = "击杀一名敌人将为你回复##20##点护甲值。\n\n该效果的冷却时间为##5##秒，每击杀一名敌人可使冷却时间减少##0.5##秒，近战击杀将额外减少##1.5##秒。\n\n如果某次杀敌把冷却时间减少到0，那么该效果会立刻触发，然后再次进入冷却。\n\n你的闪避点数增加##5##。",
        ["menu_deck9_5_desc_sc"] = "使用近战武器击杀一名敌人将为你回复##2%##的血量。\n\n这与“##危急情形##”（牌组三）同时计算冷却。\n\n你初始携带的尸体袋数量增加##1##。",
        ["menu_deck9_7_desc_sc"] = "击杀一名距你##18##米内的敌人将为你额外回复##15##点护甲值，若是近战击杀则多额外回复##15##点。\n\n这与“##危急情形##”（牌组三）同时计算冷却。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck9_9_desc_sc"] = "击杀一名距你##18##米内的敌人将有##25%##的几率在附近##12##米的敌人中##散播恐慌##，若是近战击杀则概率额外增加##25%##，恐慌会使敌人短暂地失去行动能力。\n\n这与“##危急情形##”（牌组三）同时计算冷却。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Grinder--

        ["menu_deck11_1_desc_sc"] = "身穿##防爆弹衣##时，成功伤害到敌人将使你在##3##秒内每秒回复##2##点血量。\n\n该效果可以叠加，但每##0.75##秒只能叠加一层，最高叠加##5##层。使用哨戒机枪、火焰或毒素伤害到敌人不能为你叠加回血效果。\n\n你所有护甲的护甲量减少##30##。\n\n你防爆弹衣的隐匿度增加##8##。",
        ["menu_deck11_3_desc_sc"] = "每层增益中每秒回复的血量额外增加##1##点。",
        ["menu_deck11_5_desc_sc"] = "每层增益的持续时间额外增加##2##秒。\n\n你可以放置##2##个尸体袋箱。",
        ["menu_deck11_7_desc_sc"] = "每层增益中每秒回复的血量再额外增加##1##点。",
        ["menu_deck11_9_desc_sc"] = "每层增益将使你的移动速度加快##5%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Open your mind--

        ["menu_deck13_1_desc_sc"] = "当你有护甲时，每击杀一名敌人将为你储存##4##点血量。\n\n当你的护甲完全被破坏后，回复护甲的同时也会将你储存的血量用于一等一回复你的血量。\n\n最多能储存多少血取决于你穿的是什么护甲，更轻的护甲能储存更多的血量。",
        ["menu_deck13_3_desc_sc"] = "每次杀敌储存的血量增加##2##点。\n\n你的闪避点数增加##5##。",
        ["menu_deck13_5_desc_sc"] = "提高你血量储存上限的##25%##。\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        ["menu_deck13_7_desc_sc"] = "每次杀敌储存的血量额外增加##2##点。\n\n你的闪避点额外增加##5##。",
        ["menu_deck13_9_desc_sc"] = "每击杀一名敌人都可以加快你的护甲恢复速度，加快的程度取决于你穿的是什么护甲，更轻的护甲能获得更快的恢复速度。护甲成功恢复后该效果需要重新叠加。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- THIS IS WAR BABY--

        ["menu_deck14_1_desc_sc"] = "你所造成伤害的100%将会转化为狂乱度，狂乱度最多可以叠##720##层。\n\n关于狂乱度：\n每累积##120##点狂乱度，你受到的伤害就减少##1##点。狂乱度每##8##秒减少##120##层。",
        ["menu_deck14_3_desc_sc"] = "你的队友现在也可以享受通过狂乱度获得的减伤效果。\n\n你和队友同时使用瘾君子的效果不叠加，减伤效果取团队内最高的狂乱度。\n\n你的闪避点数增加##5##。",
        ["menu_deck14_5_desc_sc"] = "你的狂乱度现在每##8##秒只减少##90##层。\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        ["menu_deck14_7_desc_sc"] = "现在每累积##90##层狂乱度，你受到的伤害就减少##1##点。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck14_9_desc_sc"] = "你通过狂乱度获得的减伤效果增加##100%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Anarchist--
        ["menu_st_spec_15"] = "无政府主义者", -- there's a random space at the end of the original string
        ["menu_deck15_1_desc_sc"] = "你的护甲不再是一次性回满，而是每段时间回复一次。回复量取决于积累的量，每秒会积累##8##点护甲值；两次回复的时间间隔取决于你穿的护甲，更厚重的防弹背心回复间隔更长。\n\n提示：加快护甲回复速率的技能效果将对此天赋无效",
        ["menu_deck15_3_desc_sc"] = "你##50%##的血量转化为##50%##的护甲值。",
        ["menu_deck15_5_desc_sc"] = "你##50%##的血量转化为##100%##的护甲值。\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        ["menu_deck15_7_desc_sc"] = "你##50%##的血量转化为##150%##的护甲值。",
        ["menu_deck15_9_desc_sc"] = "造成伤害会为你回复护甲值——该效果的冷却时间为##5##秒，穿越重型的防弹背心就能回复越多的护甲。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Scarface--

        ["menu_deck17_1_desc_sc"] = "解锁首脑##注射器##以供你使用。注射器会使用你的投掷物栏。\n\n游戏中你可以按##$BTN_ABILITY;##键激活注射器，激活注射器会在##4##秒内使你在受到伤害后回复所受到伤害##30%##的血量。\n\n注射器的冷却时间为##30##秒。\n\n提示：=注射器效果总结=\n1.先回血再受到伤害；\n2.有护甲时，受击回血；\n3.无护甲时，受击减伤。\n(并不是绝对的减伤，取决于不同的情况)",
        ["menu_deck17_3_desc_sc"] = "注射器生效期间，你的移动速度加快##20%##。",
        ["menu_deck17_5_desc_sc"] = "注射器的持续时间增加至##6##秒。\n\n注射器生效期间，你获得##嘲讽##——一旦你进入敌人的射击范围内，无论周围是什么情况敌人都会优先射击你。",
        ["menu_deck17_7_desc_sc"] = "你的血量低于##25%##时，注射器生效期间的回血量额外增加##60%##。",
        ["menu_deck17_9_desc_sc"] = "注射器生效期间，每获得##5##点血量的过量治疗将减少注射器冷却时间##2##秒。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- 10 feet higher--

        ["menu_deck18_1_desc_sc"] = "你的闪避点数增加##5##。\n\n解锁投掷物——##烟雾弹##以供你使用。\n\n烟雾弹扔出后，它会制造一片持续##12##秒的烟幕。处于烟幕中的你和你队友回复护甲的速度加快##100%##。烟幕中的敌人精准度降低##75%##。\n\n烟雾弹的冷却时间为##40##秒，击杀一名敌人将使冷却时间减少##1##秒。",
        ["menu_deck18_3_desc_sc"] = "你的闪避点数额外增加##5##。",
        ["menu_deck18_5_desc_sc"] = "成功闪避一次敌人的攻击将减少烟雾弹的冷却时间##1##秒。\n\n你初始携带的尸体袋数量增加##1##。",
        ["menu_deck18_7_desc_sc"] = "你的闪避点数再额外增加##5##。",
        ["menu_deck18_9_desc_sc"] = "当你在烟雾弹产生的烟幕中时，你的闪避条每秒增加闪避点数的##40%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Sweet liquor eases the pain--

        ["menu_deck19_1_desc_sc"] = "解锁##修士酒壶##以供你使用。\n\n你受到的对##血量##的伤害中的##30%##不会立刻使你丢失血量，而是变成虚血在##8##秒内逐渐衰减完。\n\n你可以按使用投掷物的按键激活修士酒壶并立刻使虚血变为实血。\n\n当虚血变为实血时，你也会恢复虚血转变量##150%##的血量。修士酒壶的冷却时间为##30##秒。\n\n你##50%##的##护甲量##将转变为##50%##的##血量##。",
        ["menu_deck19_3_desc_sc"] = "每击杀一名敌人，你的酒壶冷却时间就减少##2.5##秒。",
        ["menu_deck19_5_desc_sc"] = "在##4##秒内没受到伤害将会立即使虚血变为实血(即触发酒壶的效果)。\n\n你回答对讲机所需的时间减少##25%##。",
        ["menu_deck19_7_desc_sc"] = "你的血量低于##50%##时，你每击杀一名敌人将减少修士酒壶的冷却时间##5##秒。",
        ["menu_deck19_9_desc_sc"] = "你倒地被救起后的剩余血量提高##25%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- it's not a war crime if they're not people--

        ["menu_deck20_1_desc_sc"] = "解锁##电子烟##以供你使用。\n\n要使用电子烟，你需要看向一名没有视野遮挡的##18##米内的队友并按下使用投掷物的按键标记他。\n\n你和你标记的队友每击杀一名敌人都会为你回复##4##点血量，并且为你标记的队友回复##2##点血量。\n\n电子烟的持续时间为##11##秒，冷却时间为##80##秒。",
        ["menu_deck20_3_desc_sc"] = "你和你标记的队友每击杀一名敌人都会延长电子烟的持续时间##2##秒。每次杀敌将减少下次杀敌延长时间的##0.2##秒。",
        ["menu_deck20_5_desc_sc"] = "你和你标记的队友每击杀一名敌人都会为你获得##0.5##的伤害减免，最多获得##8##点伤害减免，电子烟效果结束时失效。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        ["menu_deck20_7_desc_sc"] = "电子烟效果回复的血量变为原来的##2##倍。",
        ["menu_deck20_9_desc_sc"] = "你每击杀一名敌人都会减少电子烟的冷却时间##2##秒。\n\n电子烟效果持续时间，你标记的队友击杀敌人也能为你减少电子烟的冷却时间##2##秒。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Biker--

        ["menu_deck16_1_desc_sc"] = "每当你或你队友击杀一名敌人时，你获得##2##点血量，冷却时间为##5##秒。",
        ["menu_deck16_3_desc_sc"] = "你每##5##秒恢复##10##点护甲值。",
        ["menu_deck16_5_desc_sc"] = "每减少##25%##的护甲值都将减少杀敌加血冷却时间##0.5##秒。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        ["menu_deck16_7_desc_sc"] = "你现在每##5##秒恢复##20##点护甲值。\n\n使用近战武器击杀敌人将使该效果下一次提前##1##秒触发。",
        ["menu_deck16_9_desc_sc"] = "每减少##25%##的护甲值都将使杀敌回血量增加##2##点。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Yakuza--

        ["menu_deck12_1_desc_sc"] = "你的血量低于##100%##时，血量越少，你的闪避条被动增长的速度越快，最快可以达到每秒增加闪避点数的##10%##。\n\n你的闪避点数增加##5##。",
        ["menu_deck12_3_desc_sc"] = "你的血量低于##100%##时，血量越少，你杀敌增加的闪避条越多，最多可以达到每击杀一个敌人增加闪避点数的##50%##。",
        ["menu_deck12_5_desc_sc"] = "你的血量低于##100%##时，血量越少，你受到的伤害越少，最多可以获得##20%##的伤害减免。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        ["menu_deck12_7_desc_sc"] = "你的血量低于##100%##时，血量越少，你使用近战武器杀敌增加的闪避条越多，最多可以达到每用近战武器击杀一个敌人增加闪避点数的##125%##。\n\n使用近战武器击杀敌人将使你下一次成功闪避获取的无敌时间增加##300%##，最多增加到##0.9##秒。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck12_9_desc_sc"] = "你的血量减伤分数上限提高至##80%##。\n\n受到致命伤害时，你不会倒地，你的血量会变为##1##并获得##50##点护甲值，该效果只能触发一次，每次倒地起身或使用应急急救包后重置使用次数。\n\n提示：该效果不适用于也不能被幻影特工飞踢或泰瑟警察电击造成的倒地刷新\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",
        ["menu_yakuza_deflection_add"] = "（因极道增加）",

        -- Hacker--

        ["menu_deck21_1_desc_sc"] = "解锁##便携式ECM干扰器##以供你使用。\n\n游戏中你可以按##$BTN_ABILITY;##键激活便携式ECM干扰器。\n\n警报响起前使用便携式ECM干扰器会带来电子干扰的效果，所有电子设备都将失效，对讲机也会被延迟，干扰持续##10##秒。\n\n警报响起后使用便携式ECM干扰器会带来反馈效果，反馈开始时必定使所有半径##15##米内的敌人失去行动能力，随后每##1.2##秒都有##60%##的几率眩晕范围内的敌人，反馈持续##10##秒。\n\n便携式ECM干扰器每##80##秒的冷却时间可以充能一次，击杀一名敌人将使冷却时间减少##2.5##秒。",
        ["menu_deck21_3_desc_sc"] = "你的闪避点数增加##5##。",
        ["menu_deck21_5_desc_sc"] = "便携式ECM干扰器的反馈生效时，击杀一名敌人将为你回复##5##点血量。",
        ["menu_deck21_7_desc_sc"] = "你的护甲回复速率增加##10%##。\n\n你的闪避点数额外增加##5##。",
        ["menu_deck21_9_desc_sc"] = "便携式ECM干扰器的反馈生效时，你的队友击杀一名敌人也能回复##2.5##点血量。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- Leech

        ["menu_deck22_1_desc_sc"] = "解锁并装备##水蛭安瓿瓶##。\n\n对局中你可以使用投掷物按键来启用水蛭安瓶，启用时会直接恢复##10%##的总血量并且在生效期间取消你的全部护甲。\n\n与此同时你的血量以血上限的每##10%##来被分割成小格，每受任意一次伤害移除整个格。同时每击杀##3##名敌人回复一格且免伤##1##秒。\n\n水蛭安瓶能够持续##6##秒钟并且有##40##秒冷却。",
        ["menu_deck22_3_desc_sc"] = "在水蛭安瓶生效期间，任何时候你受到生命值伤害会恢复你队友其总血量的##1%##。",
        ["menu_deck22_5_desc_sc"] = "水蛭安瓶的生效时间延长到##10##秒。\n\n每击杀一名敌人会减少水蛭安瓶的冷却时间##1##秒。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        ["menu_deck22_7_desc_sc"] = "水蛭生效期间血量分割变为血上限的每##5%##一格。",
        ["menu_deck22_9_desc_sc"] = "倒地时启用水蛭安瓶能够立即起身直至生效结束。\n\n使用水蛭安瓶起身会增加额外的##30##秒冷却时间。\n\n受到伤害时为队友恢复的血量变为##2%##。\n\n天赋牌组完成奖励：你结束劫案后翻牌获得稀有物品的概率增加##10%##",

        -- CopyCat--
        ["menu_deck23_1_desc"] = "使用主武器时，击杀##10##名敌人会自动装填副武器，反之亦然。\n提示：\n主副武器杀敌会独立计算，但你切出另一把武器并换弹后杀敌计数就会重置；\n只需要使用某武器即可，这意味着刀和投掷物杀敌也计入\n\n你武器切换速度增快##15%##。",
        ["menu_deck23_1_short"] = "使用主武器时，击杀##10##名敌人会自动装填副武器，反之亦然。\n\n你武器切换速度增快##15%##。",
        ["menu_deck23_1_1_desc"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_1_1_short"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_1_2_desc"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_1_2_short"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_1_3_desc"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_1_3_short"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_1_4_desc"] = "你蹲下时和背包时的移动速度加快##5%##。",
        ["menu_deck23_1_4_short"] = "你蹲下时和背包时的移动速度加快##5%##。",

        ["menu_deck23_3_desc"] = "你每次完成爆头可恢复##3##点血量，每##5##秒只能触发一次。",
        ["menu_deck23_3_short"] = "你每次完成爆头可恢复##3##点血量，每##5##秒只能触发一次。",
        ["menu_deck23_3_1_desc"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_3_1_short"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_3_2_desc"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_3_2_short"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_3_3_desc"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_3_3_short"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_3_4_desc"] = "你蹲下时和背包时的移动速度加快##5%##。",
        ["menu_deck23_3_4_short"] = "你蹲下时和背包时的移动速度加快##5%##。",

        ["menu_deck23_5_desc"] = "闪避成功将使本来的伤害##100%##反弹回开火的敌人身上。\n\n打破你护甲的子弹会以##200%##的伤害反弹回开火的敌人身上，冷却时间为##15##秒。",
        ["menu_deck23_5_short"] = "闪避成功将使本来的伤害##100%##反弹回开火的敌人身上。\n\n打破你护甲的子弹会以##200%##的伤害反弹回开火的敌人身上，冷却时间为##15##秒。",
        ["menu_deck23_5_1_desc"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_5_1_short"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_5_2_desc"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_5_2_short"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_5_3_desc"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_5_3_short"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_5_4_desc"] = "你蹲下时和背包时的移动速度加快##5%##。",
        ["menu_deck23_5_4_short"] = "你蹲下时和背包时的移动速度加快##5%##。",

        ["menu_deck23_7_desc"] = "当你的血量低于##50%##时，你会免疫对血量的伤害##2##秒，每##90##秒只能触发一次。",
        ["menu_deck23_7_short"] = "当你的血量低于##50%##时，你会免疫对血量的伤害##2##秒，每##90##秒只能触发一次。",
        ["menu_deck23_7_1_desc"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_7_1_short"] = "你的血量上限增加##7.5%##。",
        ["menu_deck23_7_2_desc"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_7_2_short"] = "你的护甲量增加##3.75%##。",
        ["menu_deck23_7_3_desc"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_7_3_short"] = "你的闪避点数增加##1.25##。",
        ["menu_deck23_7_4_desc"] = "你蹲下时和背包时的移动速度加快##5%##。",
        ["menu_deck23_7_4_short"] = "你蹲下时和背包时的移动速度加快##5%##。",
        -- Final Card
        -- Crew Chief
        ["menu_deck1_mrwi_desc"] = "你呼喊的距离增加##25%##。\n\n你和你队友的耐力提高##50%##。\n\n提示：不与其它同天赋玩家的效果叠加\n\n你回答对讲机所需的时间减少##25%##。",
        -- Muscle
        ["menu_deck2_mrwi_desc"] = "每次的开火射击有##5%##的几率在敌人中##散播恐慌##，恐慌会使敌人短暂地失去行动能力。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        -- Armorer
        ["menu_deck3_mrwi_desc"] = "你的护甲恢复速度加快##10%##。\n\n你可以放置##2##个尸体袋箱。",
        -- Rouge
        ["menu_deck4_mrwi_desc"] = "你的闪避点数额外增加##5##。\n\n你的切枪速度加快##30%##。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        -- Hitman
        ["menu_deck5_mrwi_desc"] = "使用非近战武器击杀一名敌人将为你储存##25##点血量，储存血量的上限为##75##点。\n\n使用近战武器杀敌将使储存的血量转化为临时虚血，临时虚血跟血量一样是你的生命值，临时虚血会以每秒##5##点的速度减少。\n\n临时虚血可以超出你的血量上限，你最多能拥有##240##点临时虚血。\n\n你初始携带的尸体袋数量增加##1##。",
        -- Crook
        ["menu_deck6_mrwi_desc"] = "防弹背心的闪避点数增加##5##。\n\n防弹背心的护甲值提高##15%##。\n\n你的撬锁速度加快##20%##。",
        -- Burglar
        ["menu_deck7_mrwi_desc"] = "你的闪避点数额外增加##5##。\n\n蹲伏时，你的闪避条每秒增加闪避点数的##5%##。\n\n你蹲伏的移动速度加快##20%##。",
        -- Infiltrator
        ["menu_deck8_mrwi_desc"] = "若在你半径##12##米范围内有一名敌人存在，你受到来自敌人的伤害减少##10%##。\n\n每次使用近战武器成功击中敌人都将在##5##秒内使你的近战武器伤害增加##8%##，该效果可以叠加且最多叠加##5##次，打空失效。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        -- Sociopath
        ["menu_deck9_mrwi_desc"] = "击杀一名敌人将为你回复护甲值，击杀的敌人若在你周围##18##米内，你回复##15##点护甲值（近战击杀效果##翻倍##），否则回复##20##点。\n\n该效果的冷却时间为##5##秒，每击杀一名敌人可使冷却时间减少##0.5##秒，近战击杀将额外减少##1.5##秒。\n\n如果某次杀敌把冷却时间减少到0，那么该效果会立刻触发，然后再次进入冷却。\n\n你初始携带的尸体袋数量增加##1##。",
        -- Gambler
        ["menu_deck10_mrwi_desc"] = "你捡起一个弹药盒会回复##2##至##5##点血量。\n冷却时间为##10##秒，每捡起一个弹药盒会减少冷却时间##1##至##4##秒。\n\n你从敌人掉落的弹药盒中获得弹药时，你的团队成员会获得##15%##个弹药盒的弹药补充。\n\n你回答对讲机所需的时间减少##25%##。",
        -- Grinder
        ["menu_deck11_mrwi_desc"] = "身穿##防爆弹衣##时，成功伤害到敌人将使你在##3##秒内每秒回复##2##点血量。\n\n该效果可以叠加，但每##0.75##秒只能叠加一层，最高叠加##5##层。使用哨戒机枪、火焰或毒素伤害到敌人不能为你叠加回血效果。\n\n你所有护甲的护甲量减少##30##。\n\n你防爆弹衣的隐匿度增加##4##。\n\n你可以放置##2##个尸体袋箱。",
        -- Yakuza
        ["menu_deck12_mrwi_desc"] = "你的血量低于##100%##时，血量越少，你杀敌增加的闪避条越多，最多可以达到每击杀一个敌人增加闪避点数的##50%##。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        -- Ex-Pres
        ["menu_deck13_mrwi_desc"] = "当你有护甲时，每击杀一名敌人将为你储存##4##点血量。\n\n当你的护甲完全被破坏后，回复护甲的同时也会将你储存的血量用于一等一回复你的血量。\n\n最多能储存多少血取决于你穿的是什么护甲，更轻的护甲能储存更多的血量。\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        -- Maniac
        ["menu_deck14_mrwi_desc"] = "你所造成伤害的100%将会转化为狂乱度，狂乱度最多可以叠##720##层。\n\n关于狂乱度：\n每累积##120##点狂乱度，你受到的伤害就减少##1##点。狂乱度每##8##秒减少##120##层。\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        -- Anarchist
        ["menu_deck15_mrwi_desc"] = "你的护甲不再是一次性回满，而是每段时间回复一次。回复量取决于积累的量，每秒会积累##8##点护甲值；两次回复的时间间隔取决于你穿的护甲，更厚重的防弹背心回复间隔更长。\n\n提示：加快护甲回复速率的技能效果将对此天赋无效\n\n你和你队友控制的平民趴下的时间延长##25%##。",
        -- Biker
        ["menu_deck16_mrwi_desc"] = "每当你或你队友击杀一名敌人时，你获得##2##点血量，冷却时间为##5##秒。\n\n你打包尸体和与人质互动的速度加快##75%##。",
        -- Kingpin
        ["menu_deck17_mrwi_desc"] = "解锁首脑##注射器##以供你使用。注射器会使用你的投掷物栏。\n\n游戏中你可以按##$BTN_ABILITY;##键激活注射器，激活注射器会在##4##秒内使你的移动速度加快##20%##并在受到伤害后回复所受到伤害##20%##的血量。\n\n注射器的冷却时间为##30##秒。",
        -- Sicario
        ["menu_deck18_mrwi_desc"] = "解锁投掷物——##烟雾弹##以供你使用\n\n烟雾弹扔出后，它会制造一片持续##12##秒的烟幕。处于烟幕中的你和你队友回复护甲的速度加快##100%##。烟幕中的敌人精准度降低##75%##。\n\n烟雾弹的冷却时间为##40##秒，击杀一名敌人将使冷却时间减少##1##秒。\n\n你的闪避点数额外增加##5##。\n\n你初始携带的尸体袋数量增加##1##。",
        -- Stoic
        ["menu_deck19_mrwi_desc"] = "解锁##修士酒壶##以供你使用。\n\n你受到的对##血量##的伤害中的##20%##不会立刻使你丢失血量，而是变成虚血在##5##秒内逐渐衰减完。\n\n你可以按使用投掷物的按键激活修士酒壶并立刻使虚血变为实血。\n\n当虚血变为实血时，你也会恢复虚血转变量##150%##的血量。修士酒壶的冷却时间为##30##秒。\n\n你##50%##的##护甲量##将转变为##50%##的##血量##。\n\n你回答对讲机所需的时间减少##25%##。",
        -- Tag Team
        ["menu_deck20_mrwi_desc"] = "解锁##电子烟##以供你使用。\n\n要使用电子烟，你需要看向一名没有视野遮挡的##18##米内的队友并按下使用投掷物的按键标记他。\n\n你和你标记的队友每击杀一名敌人都会为你回复##4##点血量，并且为你标记的队友回复##2##点血量。\n\n电子烟的持续时间为##11##秒，冷却时间为##80##秒。\n\n你回路的摄像头，失效的时间增加##20##秒。",
        -- Hacker
        ["menu_deck21_mrwi_desc"] = "解锁##便携式ECM干扰器##以供你使用。\n\n游戏中你可以按##$BTN_ABILITY;##键激活便携式ECM干扰器。\n\n警报响起前使用便携式ECM干扰器会带来电子干扰的效果，所有电子设备都将失效，对讲机也会被延迟，干扰持续##10##秒。\n\n警报响起后使用便携式ECM干扰器会带来反馈效果，反馈开始时必定使所有半径##15##米内的敌人失去行动能力，随后每##1.2##秒都有##60%##的几率眩晕范围内的敌人，反馈持续##10##秒。\n\n便携式ECM干扰器每##80##秒的冷却时间可以充能一次，击杀一名敌人将使冷却时间减少##2.5##秒。",
        -- Leech
        ["menu_deck22_mrwi_desc"] = "解锁并装备##水蛭安瓿瓶##。\n\n对局中你可以使用投掷物按键来启用水蛭安瓶，启用时会直接恢复##5%##的总血量并且在生效期间取消你的全部护甲。\n\n与此同时你的血量以血上限的每##10%##来被分割成小格，每受任意一次伤害移除整个格。同时每击杀##3##名敌人回复一格且免伤##1##秒。\n\n水蛭安瓶能够持续##6##秒钟并且有##40##秒冷却。\n\n你打包尸体和与人质互动的速度加快##75%##。",

        -- Better Description in Chinese
        ["menu_st_spec_6_desc"] = "骗术师是一个多面手，他和犯罪这个词一样古老。\n\n说真的，骗术师是无所不能的。他能偷会盗、花言巧语，一两句话就能将一个滔天大罪瞒天过海。他一生都以欺骗和犯罪为活。",
        ["menu_st_spec_4_desc"] = "浪人是无声无息的罪犯。各种无声且致命的技巧都是他的招牌。诡计多端的浪人经常被雇佣来做一些见不得人的勾当，比如偷窃，暗杀等等。\n\n诡计多端是浪人的代名词——力量不够，技术来凑。",
        ["menu_st_spec_5_desc"] = "杀手是精通各种杀人手段的行家。对于犯罪团伙来说，杀手一般被雇佣来刺杀敌对团伙的首脑，从而确保自己的统治。",
        ["menu_st_spec_2_desc"] = "肌肉男一般都是受雇于黑帮老大，用最暴力的手段向其他人或帮会传递一些信息的危险人物。他们也是所有犯罪团伙的核心。\n\n当你需要一些暴力手段比如打断腿、敲破脑壳以及其他一些方法来提醒其他人谁才是老大的时候，肌肉男是你的不二选择。",
        ["menu_st_spec_1_desc"] = "领队，有些时候也被称之为头目，是绝大部分犯罪团伙的组织者。领队一般都是带领一些喽啰并听命于犯罪团伙的高层领导，完成领导安排的任务。\n\n当犯罪团伙有某些事情要解决的时候，领队与他的喽啰们确保这些事情解决的干净利落。",
        ["menu_st_spec_3_desc"] = "军械士曾经是军队里的专家。他们的工作主要是维护和升级各类防弹衣和护甲。\n\n任何有野心的犯罪团伙都会有一名军械士来确保所有的团伙成员在进行犯罪活动时得到最佳的保护。",
        ["menu_st_spec_7_desc"] = "窃贼的天生敏捷可不是仅限于溜门撬锁而已。窃贼们潜入中的移动速度都比其他人快上许多。\n\n他们在战斗中更难被击中，对窃贼来说，生存的信条就是避开交战，远走高飞。",
        ["menu_st_spec_10_desc"] = "幸运的本质难以捉摸。古希腊人相信运气是由神赐予的。但是与其说是一种天赋，不如说它是一种能力。这种能力需要你做万全的打算，同时对即将发生的事有一定的计划，才能让你在每一次行动中如有神助。真正的赌徒是无论手里有什么牌都会想方设法打赢的玩家。\n\n赌徒天赋是辅助型天赋之一，虽然任何人都可以让团队赢，但是赌徒可以让团队的胜利更加完美。",
        ["menu_st_spec_8_desc"] = "渗透者一般受雇与政府机构或是大型商业公司，用来刺探机密情报或是获取竞争对手的商业机密。\n\n渗透者是近距离格斗的好手，懂得利用环境来逆转劣势。",
        ["menu_st_spec_9_desc"] = "反社会者是公认最有效率的犯罪者，效率高到大型犯罪团伙都对他另眼相看。\n\n胆大包天，毫无感情且凶狠毒辣使得反社会者经常在最暴力的案件中现身。不知负罪感为何物使得反社会者成为最危险的罪犯。",
        ["menu_st_spec_11_desc"] = "一个典型的冲锋手是属于闷声干实事的那种类型，他们可以控制现场的突发状况并扭转不利局面。\n\n冲锋手顾名思义就是永远冲在最前面，承担最多的那个人。他是那种能对敌人造成大量的伤害同时也能承担大量的伤害的狠角色。",
        ["menu_st_spec_13_desc"] = "前总统帮是最勇敢无畏的帮会之一。一群热爱挑战极限的人们组成了这个帮会。同样的理想使得帮会成员之间亲如手足。\n\n前总统帮的成员们的最高信条是完成尾崎八项挑战，通过完成一系列最高难度的极限挑战来达到自然与天性的平衡。",
        ["menu_st_spec_14_desc"] = "瘾君子是一群不知危险为何物的人物。在勇往直前大杀四方的时候，所有的团队成员都会受到瘾君子的影响而获得一层临时护盾。",
        ["menu_st_spec_15_desc"] = "无政府主义者一直都在与极权统治对抗。他们对国王，女王或总统都嗤之以鼻。无拘无束是他们的座右铭。无政府主义者不相信那些被他们称之为被操纵的真相的东西，他们走自己的非常规路线，用他们自己的方法来完成那些几乎不可能完成的任务。",
        ["menu_st_spec_17_desc"] = "首脑是真正的大亨，大亨中的大亨，所有人都得听命于他。首先你得有钱，有钱就会有权。但是你要记住：在这个世界上，想成大事？你得有种！",
        ["menu_st_spec_18_desc"] = "刺客是每一个贩毒团伙中必不可少的一份子。刺客用最简单的方法来处理最复杂的问题，无论是什么样的情况，刺客都能确保完成任务。",
        ["menu_st_spec_19_desc"] = "你是一面无法被摧毁的墙。意识上的修炼可以使修士轻松面对许多让其他人惊慌失措的局面。佛教徒传授的呼吸控制法和物我两忘的技巧可以让你在最恶劣的环境下生存最长的时间。",
        ["menu_st_spec_20_desc"] = "一个好汉三个帮，好东西需要分享！比如能增强属性的电子烟！让你与你的朋友联系更加紧密，无论是在抢劫银行还是在大杀四方。",
        ["menu_st_spec_16_desc"] = "在世界范围内，飞车党都家喻户晓和臭名远扬。想成为飞车党的一员你必须忠诚且强硬，并且全面遵守飞车党的规定。飞车党是一群冷血且暴力的恶棍，敢于挑战拦在他们路上的一切。",
        ["menu_st_spec_12_desc"] = "极道是世界上最恶名昭著的犯罪团伙。由组长和若头组成的领导层控制着整个组织。极道以严于律己的信条，高度的组织性及遍布全身的文身而广为人知。",
        ["menu_st_spec_21_desc"] = "靠你的聪明才智和得力工具，你只需轻轻一按就能使任何安保系统陷入瘫痪。你永远不会被摄像头或保安发现，但是事情一旦闹大，你也可以轻易骇入敌人的通讯系统，给所有的敌人来一个小小的惊喜。",
        ["menu_st_spec_22_desc"] = "你在战斗中是个有选择的寄生虫，吸收敌人的力量来强化你和你的队友。不过，你对砖厕里的玩意可不屑一顾。你能够发泄你的痛苦并且将这份斗气加强到你的队友身上。",

        -- Blank Perk Deck--
        ["menu_st_spec_0"] = "白板",
        ["menu_st_spec_0_desc"] = "有一种假说曾提出人生来并不具有天生的思想，观念或者意识形态，而这些都是通过后天多样的经历所习得的行为。某种意义上这会让一个人经历巨大的困难，另一种意义上这可以看作一种优势。白板天赋在初期提供的益处并不明显甚至有害于进行劫案，但挑战更大有时意味着回报更大。", -- \n\n完成全部牌组后的效果：\n##-##你购买武器和有利条件的花费减少##60%##。\n##-##你捡起的零散物品的价值提高##30%##。\n##-##你完成劫案获得的经验奖励增加##135%##。\n##-##你结束劫案后翻牌获得稀有物品的概率增加##20%##。",
        ["menu_st_spec_0_desc_short"] = "有一种假说曾提出人生来并不具有天生的思想，观念或者意识形态，而这些都是通过后天多样的经历所习得的行为。某种意义上这会让一个人经历巨大的困难，另一种意义上这可以看作一种优势。白板天赋在初期提供的益处并不明显甚至有害于进行劫案，但挑战更大有时意味着回报更大。",
        ["menu_deck0_1"] = "内应",
        ["menu_deck0_1_desc"] = "你购买武器和有利条件的花费减少##30%##。",
        ["menu_deck0_2"] = "黑市商人",
        ["menu_deck0_2_desc"] = "你购买武器和有利条件的花费额外减少##30%##。",
        ["menu_deck0_3"] = "为钱卖命",
        ["menu_deck0_3_desc"] = "你捡起的零散物品的价值提高##15%##。",
        ["menu_deck0_4"] = "退伍军人节",
        ["menu_deck0_4_desc"] = "你捡起的零散物品的价值额外提高##15%##。",
        ["menu_deck0_5"] = "萌新上路",
        ["menu_deck0_5_desc"] = "你完成劫案获得的经验奖励增加##45%##。",
        ["menu_deck0_6"] = "快速入门",
        ["menu_deck0_6_desc"] = "你完成劫案获得的经验奖励额外增加##45%##。",
        ["menu_deck0_7"] = "神奇博士",
        ["menu_deck0_7_desc"] = "你完成劫案获得的经验奖励再额外增加##45%##。",
        ["menu_deck0_8"] = "四叶草",
        ["menu_deck0_8_desc"] = "你结束劫案后翻牌获得稀有物品的概率增加##10%##。",
        ["menu_deck0_9"] = "幸运挂件",
        ["menu_deck0_9_desc"] = "你结束劫案后翻牌获得稀有物品的概率额外增加##20%##。",

        ["menu_st_spec_00"] = "先天异禀",
        ["menu_st_spec_00_desc"] = "有些人试图论证大脑中存在着天生的本能和知识，所以每个人本质上并不是一张白纸。先天异禀天赋包含每一个银行劫匪都理应具备的基础能力，只为个人所得加成留了部分空间。这种信念会给自己带来各方面的损失。这就是屈服于我们自身原始本能的代价吗？", -- \n\n完成全部牌组后的效果：\n##-##你购买武器和有利条件的花费减少##30%##。\n##-##你捡起的零散物品的价值提高##15%##。\n##-##你完成劫案获得的经验奖励增加##90%##。\n##-##你结束劫案后翻牌获得稀有物品的概率增加##20%##。",
        ["menu_st_spec_00_desc_short"] = "有些人试图论证大脑中存在着天生的本能和知识，所以每个人本质上并不是一张白纸。先天异禀天赋包含每一个银行劫匪都理应具备的基础能力，只为个人所得加成留了部分空间。这种信念会给自己带来各方面的损失。这就是屈服于我们自身原始本能的代价吗？",
        ["menu_deck00_9_desc"] = "你结束劫案后翻牌获得稀有物品的概率增加##20%##。",

        ["rpd_menu_button"] = "重置天赋牌组",
        ["rpd_menu_dialog_title"] = "你确定吗？",
        ["rpd_menu_dialog_text"] = "如果你重置 $perk_deck_name 天赋，你会被返还 $points_to_refund 天赋点。",

        -- MOD PERK DECKS
        -- OFFYERROCKER'S MERCENARY PERK DECK  --check
        --[[["menu_deck_kmerc_1_desc_sc"] = "Years of battle have made your skin tough. Take greatly reduced damage from heavy hits to your health so that ##no single attack can kill you##.\n\nYou gain ##5%## more health.",
        ["menu_deck_kmerc_3_desc_sc"] = "Stand strong and meet force with force! Gain ##1%## critical chance for every ##20## points of armor you have.\n\nYou gain ##10%## more armor.",
        ["menu_deck_kmerc_5_desc_sc"] = "When your health would become ##0##, it becomes ##1## instead and you gain ##2## seconds of invulnerability.\n\nYou cannot sprint while under the effects of this invulnerability.\nThis effect cannot occur again until you are restored to full health.\n\nYou gain an additional ##5%## more health.",
        ["menu_deck_kmerc_7_desc_sc"] = "The inner layer of your armor is lined with coagulant agents and hemostatic gel. After having armor for at least ##2## seconds, heal health equal to ##1%## of your max armor every ##5## seconds so long as you have armor.",--]]
        ["menu_deck_kmerc_1_desc_sc"] = "Take greatly reduced damage from heavy hits to your health so that no single attack can kill you.\n\nYou gain ##5%## more health.",
        ["menu_deck_kmerc_3_desc_sc"] = "You gain ##1%## reload speed and ##2%## weapon swap speed for every ##4## points armor you have.\n\nYou gain ##5%## more armor.",
        ["menu_deck_kmerc_5_desc_sc"] = "When your health would become ##0##, it becomes ##1## instead and you gain ##2## seconds of invulnerability.\nYou cannot sprint while under the effects of this invulnerability.\nThis effect cannot occur again until you are restored to full health.\n\nYou gain an additional ##5%## more health.",
        ["menu_deck_kmerc_7_desc_sc"] = "After having armor for at least ##2## seconds, heal health equal to ##1%## of your max armor every ##5## seconds so long as you have armor.",
        ["menu_deck_kmerc_9_desc_sc"] = "Whenever you take damage to your health that leaves you at ##30%## health or less, regain ##50%## of that damage as armor.\nThis cannot occur more than once every ##1## second or from the same hit that triggers Walk It Off's (Card 5) invulnerability.",

        -- OFFYERROCKER'S LIBERATOR PERK DECK
        ["menu_deck_liberator_1_desc_sc"] = "Unlocks the ##Survival Syringe## for use in place of a throwable. Using the Survival Syringe will immediately restore ##15## stamina and restore ##0.5## points of health every second for ##4## seconds or until the player takes health damage.\nThe Survival Syringe has ##1## charge with a cooldown of ##30## seconds; each kill you perform will reduce the cooldown by ##1## second.",
        ["menu_deck_liberator_3_desc_sc"] = "The health regen from the Survival Syringe now lasts for an additional ##2## seconds.\n\nWhen health regen from Survival Syringe is canceled, gain ##10%## damage resistance for the remaining time.",
        ["menu_deck_liberator_5_desc_sc"] = "The Survival Syringe restores an additional ##15## stamina and restores an additional ##0.5## points of health every second.\n\nYour dodge is increased by ##5## points.",
        ["menu_deck_liberator_7_desc_sc"] = "Your health is increased by ##10%##.\n\nThe health regen from Survival Syringe now lasts for an additional ##2## seconds.",
        ["menu_deck_liberator_9_desc_sc"] = "The Survival Syringe now restores an additional ##1## point of health every second."

        --[[ Original Blank Perk Deck--
        ["menu_st_spec_0"] = "空白天赋",    
        ["menu_st_spec_0_desc"] = "这个天赋没有任何增益",
        ["menu_st_spec_00"] = "通用天赋",       
        ["menu_st_spec_00_desc"] = "这个天赋只有所有天赋共同拥有的牌组的效果",
        ["menu_deck0_1"] = "",
        ["menu_deck0_1_desc"] = "",     --]]
    })
end)

