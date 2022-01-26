Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "부스트",
		["menu_es_crew"] = "동료",
		["menu_es_personal"] = "개인",
		["menu_es_bad"] = "나쁨",
		["menu_es_other"] = "기타",
		["RestorationPDTHHudNeeded"] = "PD:TH HUD REBORN이 필요합니다!",
		["menu_paygrade"] = "급여 등급: ",
		["menu_diffgrade"] = "난이도: ",
		["menu_utility_radial_menu_name"] = "Utility Radial Menu",
		["menu_utility_radial_menu_desc"] = "Open the Utility Menu",

		["res_credits"] = "레스트레이션 모드 크레딧",
		["res_credits_help"] = "레스트레이션 모드에 대한 크레딧을 확인합니다.",
	
		["Warning_overhaul_title"] = "WARNING: Game closing to prevent save corruption.",
		["dialog_show_overhaul_dialog"] = "You are DISABLING the Complete Overhaul. It is typically NOT RECOMMENDED to do this, and you should instead REMOVE the mod from your mods folder if you intend not to use the Overhaul actively.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",
		["dialog_enable_overhaul_dialog"] = "You are ENABLING the Complete Overhaul. The Overhaul should typically remain ON at all times, and only be disabled by removing the mod from your mods folder.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",	

		["res_saveboost"] = "$BTN_INTERACT 키를 길게 눌려 레벨 100으로 올립니다.",

		["RestorationModOptionsButtonTitleID"] = "레스트레이션 모드 옵션",
		["RestorationModOptionsButtonDescID"] = "레스트레이션 모드의 옵션.",
		["RestorationModHUDOptionsButtonTitleID"] = "레스트레이션 HUD & UI 옵션.",
		["RestorationModHUDOptionsButtonDescID"] = "레스트레이션의 HUD & UI 옵션.",
		["RestorationModOTHEROptionsButtonTitleID"] = "추가 레스트레이션 모드 옵션.",
		["RestorationModOTHEROptionsButtonDescID"] = "추가 레스트레이션 모드 옵션.",
		["RestorationModUIOptionsButtonTitleID"] = "알파 UI",
		["RestorationModUIOptionsButtonDescID"] = "알파 UI 옵션.",
		["RestorationModTimeOfDayTitleID"] = "신규 + 랜덤 하루 중 시간",
		["RestorationModTimeOfDayDescID"] = "특정 하이스트의 시간을 커스텀마이징 합니다.",

		["restoration_level_data_unknown"] = "시간 불명, 위치 불명",
		["RestorationModEnv_BanksTitleID"] = "뱅크 지점",
		["RestorationModEnv_BanksDescID"] = "뱅크 지점의 환경을 선택합니다.",
		["RestorationModEnv_RVD1TitleID"] = "저수지의 개들 1일차",
		["RestorationModEnv_RVD1DescID"] = "저수지의 개들 1일차의 환경을 선택합니다.",
		["RestorationModEnv_RVD2TitleID"] = "저수지의 개들 2일차",
		["RestorationModEnv_RVD2DescID"] = "저수지의 개들 2일차의 환경을 선택합니다.",
		["RestorationModEnv_FSD1TitleID"] = "파이어스타터 1일차",
		["RestorationModEnv_FSD1DescID"] = "파이어스타터 1일차의 환경을 선택합니다.",
		["RestorationModEnv_PBR2TitleID"] = "버스 오브 스카이",
		["RestorationModEnv_PBR2DescID"] = "버스 오브 스카이의 환경을 선택합니다.",
		["RestorationModEnv_CJ2TitleID"] = "더 밤: 항구",
		["RestorationModEnv_CJ2DescID"] = "더 밤: 항구의 환경을 선택합니다.",
		["RestorationModEnv_UnderPassTitleID"] = "트랜스포트: 지하도",
		["RestorationModEnv_UnderPassDescID"] = "트랜스포트: 지하도 환경을 선택합니다.",
		["RestorationModEnv_MallCrasherTitleID"] = "몰크래셔",
		["RestorationModEnv_MallCrasherDescID"] = "몰크래셔의 환경을선택합니다.",
		["RestorationModEnv_Mia_1TitleID"] = "핫라인 마이애미 1일차",
		["RestorationModEnv_Mia_1DescID"] = "핫라인 마이애미 1일차의 환경을 선택합니다.",
		["RestorationModEnv_FSD3TitleID"] = "파이어스타터 3일차",
		["RestorationModEnv_FSD3DescID"] = "파이어스타터 3일차의 환경을 선택합니다.",
		["RestorationModEnv_WDD1NTitleID"] = "와치독스 1일차 (밤)",
		["RestorationModEnv_WDD1NDescID"] = "와치독스 1일차 (밤)의 환경을 선택합니다.",
		["RestorationModEnv_WDD1DTitleID"] = "와치독스 1일차 (낮)",
		["RestorationModEnv_WDD1DDescID"] = "와치독스 1일차 (낮)의 환경을 선택합니다.",
		["RestorationModEnv_WDD2DTitleID"] = "와치독스 2일차 (낮)",
		["RestorationModEnv_WDD2DDescID"] = "와치독스 2일차 (낮)의 환경을선택합니다.",
		["RestorationModEnv_Alex3TitleID"] = "랫츠 3일차",
		["RestorationModEnv_Alex3DescID"] = "랫츠 3일차의 환경을 선택합니다.",
		["RestorationModEnv_BigTitleID"] = "빅 뱅크",
		["RestorationModEnv_BigDescID"] = "빅 뱅크의 환경을 선택합니다.",
		["RestorationModEnv_FSTitleID"] = "포 스토어",
		["RestorationModEnv_FSDescID"] = "포 스토어의 환경을 선택합니다.",
		["RestorationModEnv_UkraTitleID"] = "우크라이니안 잡",
		["RestorationModEnv_UkraDescID"] = "우크라이니안 잡의 환경을 선택합니다.",
		["RestorationModEnv_KosugiTitleID"] = "섀도 레이드",
		["RestorationModEnv_KosugiDescID"] = "섀도 레이드의 환경을 선택합니다.",
		["RestorationModEnv_PetaTitleID"] = "고트 시뮬레이터 1일차",
		["RestorationModEnv_PetaDescID"] = "고트 시뮬레이터 1일차의 환경을 선택합니다.",
		["RestorationModEnv_FRIENDTitleID"] = "스카페이스 맨션",
		["RestorationModEnv_FRIENDDescID"] = "스카페이스 맨션의 환경을 선택합니다.",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "버프 추적",
		["RestorationModINFOHUDOptionsButtonDescID"] = "화면 왼쪽에 활성화 되어있는 스킬에 대한 정보를 반영하는 아이콘을 표시합니다. 알파 UI를 활성화할 필요가 없습니다.",
		["RestorationModInfo_HudTitleID"] = "버프 추적 활성화",
		["RestorationModInfo_HudDescID"] = "전체 버프 추적 UI를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_SizeTitleID"] = "아이콘 크기",
		["RestorationModInfo_SizeDescID"] = "버프 추적의 아이콘 크기를 설정합니다.",
		["RestorationModInfo_CountTitleID"] = "행 수",
		["RestorationModInfo_CountDescID"] = "새 열을 추가하기 전에 버프 추적이 표시하는 행 수를 제어합니다.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "공격적 재장전",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "효율적인 탄약 활용",
		["RestorationModInfo_ammo_efficiencyDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "피의 갈증",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_bullet_stormTitleID"] = "탄환 폭풍",
		["RestorationModInfo_bullet_stormDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "의무병",
		["RestorationModInfo_revive_damage_reductionDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_desperadoTitleID"] = "데스페라도",
		["RestorationModInfo_desperadoDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_grinderTitleID"] = "히스타민 (그라인더)",
		["RestorationModInfo_grinderDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_infiltratorTitleID"] = "체력 흡수 (인틸트레이터)",
		["RestorationModInfo_infiltratorDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "인스파이어",
		["RestorationModInfo_long_dis_reviveDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_messiahTitleID"] = "메시아",
		["RestorationModInfo_messiahDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "오버킬",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "진통제",
		["RestorationModInfo_revived_damage_reductionDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "응급 치료",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_rogueTitleID"] = "킬러 인스팅트 (로그)",
		["RestorationModInfo_rogueDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "죽음으로부터의 도주",
		["RestorationModInfo_increased_movement_speedDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "명사수",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_trigger_happyTitleID"] = "난사광",
		["RestorationModInfo_trigger_happyDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "언더독",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_unseen_strikeTitleID"] = "암습",
		["RestorationModInfo_unseen_strikeDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_survive_one_hitTitleID"] = "오니 문신 (야쿠자)",
		["RestorationModInfo_survive_one_hitDescID"] = "이 특정 기술의 추적을 활성화하거나 비활성화합니다.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "의료 가방 체력 회복",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "의료 가방 체력 회복 추적을 활성화하거나 비활성화합니다.",
		["RestorationModAltLastDownColorTitleID"] = "대체된 마지막 다운 컬러 그레이딩",
		["RestorationModAltLastDownColorDescID"] = "마지막 다운 컬러 그레이딩을 color_sin_classic으로 전환합니다.",
		["RestorationModNoBleedoutTiltTitleID"] = "최후의 저항 카메라 기울기 비활성화",
		["RestorationModNoBleedoutTiltDescID"] = "최후의 저항 상태에서 발생하는 카메라 기울기를 비활성화합니다.",
		["RestorationModClassicMoviesTitleID"] = "클래식 로드아웃 배경",
		["RestorationModClassicMoviesDescID"] = "클래식 하이스트을 플레이할 때 PD:TH 로드아웃 배경을 활성화 또는 비활성화합니다.",
		["RestorationModQuietRainTitleID"] = "조용한 비",
		["RestorationModQuietRainDescID"] = "비 내리는 하이스트의 비를 더 조용하게 만듭니다.",

		["default"] = "기본",
		["random"] = "랜덤",
		["mellowday"] = "부드러운 낮",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "향상된 기본",
		["env_trailer_bank"] = "트레일러 뱅크",
		["rvd1_alt1"] = "밤생활",
		["rvd1_alt2"] = "담홍색 연무",
		["rvd2_alt"] = "흐림",
		["fsd1_eve"] = "저녁",
		["bos_alt"] = "담홍색 하늘",
		["dockyard_alt"] = "야간 근무",
		["underpass_foggyday"] = "안개 낀 날",
		["mall_alt"] = "오후 쇼핑",
		["hlm_morn"] = "모닝콜",
		["funny_and_epic_synthwave_very_eighties"] = "레트로",
		["brightnight"] = "밝은 밤",
		["docks"] = "부두",
		["bank_green"] = "베타 그린",
		["cloudy_day"] = "흐린 날",
		["shadowraid_day"] = "섀도 레이드 하루",
		["shadowraiud_darker"] = "섀도 레이드 어둠",
		["friend_pink"] = "담홍색 일몰",
		["friend_night"] = "마이애미 밤",
		["off"] = "끄기",
		["windowofoppurtunity"] = "Window Of Opportunity",
		["wheresthevan"] = "Where's The Van",
		["menu_jukebox_heist_ponr"] = "돌아올 수 없는 지점",
		["RestorationModPaintingsTitleID"] = "미사용된 미술관 그림",
		["RestorationModPaintingsDescID"] = "아트 갤러리에서 미사용된 그림이 생성되는 기능을 활성화하거나 비활성화합니다. 호스트만 보입니다.",
		["RestorationModMainHUDTitleID"] = "알파 HUD 켜기/끄기",
		["RestorationModMainHUDDescID"] = "알파 HUD를 완전히 활성화 또는 비활성화합니다.",
		["RestorationModWaypointsTitleID"] = "알파 웨이포인트",
		["RestorationModWaypointsDescID"] = "알파 웨이포인트를 활성화하거나 비활성화합니다.",
		["RestorationModAssaultPanelTitleID"] = "알파 어썰트 테이프",
		["RestorationModAssaultPanelDescID"] = "알파 어썰트 테이프를 활성화 또는 비활성화합니다.",
		["RestorationModAltAssaultTitleID"] = "초기 어썰트 공격 표시기",
		["RestorationModAltAssaultDescID"] = "초기 어썰트 공격 표시기를 활성화 또는 비활성화하고 테이프를 대체합니다.",
		["RestorationModObjectivesPanelTitleID"] = "알파 목표 패널",
		["RestorationModObjectivesPanelDescID"] = "알파 목표 패널을 활성화하거나 비활성화합니다.",
		["RestorationModPresenterTitleID"] = "알파 프리젠터",
		["RestorationModPresenterDescID"] = "전리품 확보하거나 목표 알림 다일로그에 사용되는 알파 프리젠터를 활성화하거나 비활성화합니다.",
		["RestorationModInteractionTitleID"] = "알파 상호 작용 미터",
		["RestorationModInteractionDescID"] = "알파 상호 작용 미터를 활성화하거나 비활성화합니다.",
		["RestorationModStealthTitleID"] = "알파 스텔스 미터",
		["RestorationModStealthDescID"] = "알파 스텔스 미터를 활성화하거나 비활성화합니다.",
		["RestorationModDownTitleID"] = "알파 다운 타이머",
		["RestorationModDownDescID"] = "알파 다운 타이머를 활성화 또는 비활성화합니다.",
		["RestorationModBagTitleID"] = "알파 가방 패널",
		["RestorationModBagDescID"] = "알파 가방 패널을 활성화 또는 비활성화합니다.",
		["RestorationModHostageTitleID"] = "인질 패널 숨기기",
		["RestorationModHostageDescID"] = "활성화하면 어썰트 테이프 또는 초기 알파 표시기가 켜져 있는 경우 돌격이 시작될 때 인질 패널을 숨깁니다.",
		["RestorationModDifficultyMarkersTitleID"] = "출시 전 난이도 마커",
		["RestorationModDifficultyMarkersDescID"] = "출시 전 난이도 마커를 활성화 또는 비활성화합니다.",
		["RestorationModStaminaIndicatorTitleID"] = "디버그 스테미나 표시기",
		["RestorationModStaminaIndicatorDescID"] = "디버그 스테미나 표시기를 활성화하거나 비활성화합니다.",
		["RestorationModBlackScreenTitleID"] = "레스트레이션 블랙 스크린",
		["RestorationModBlackScreenDescID"] = "레스트레이션 블랙 스크린을 활성화 또는 비활성화합니다.",
		["RestorationModLoadoutsTitleID"] = "알파 로드아웃",
		["RestorationModLoadoutsDescID"] = "알파 로드아웃 화면을 활성화하거나 비활성화합니다.",
		["RestorationModDistrictTitleID"] = "CRIME.NET 구역 설명",
		["RestorationModDistrictDescID"] = "CRIME.NET에 구역 설명을 활성화 또는 비활성화합니다. 게임 플레이에 영향을 주지 않습니다.",
		["RestorationModSCOptionsButtonTitleID"] = "레스트레이션 오버홀 옵션",
		["RestorationModSCOptionsButtonDescID"] = "레스트레이션 오버홀 옵션",
		["RestorationModSCTitleID"] = "Complete Overhaul (DEBUG)",
		["RestorationModSCDescID"] = "Enable or disable Restoration's complete game overhaul. Toggling this option will automatically exit your game to prevent save corruption.",
		["RestorationModHolidayTitleID"] = "홀리데이 효과",
		["RestorationModHolidayDescID"] = "오버홀를 위한 홀레데이 효과를 활성화하거나 비활성화합니다.",
		["RestorationModRestoreHitFlashTitleID"] = "히트 플래시 복원",
		["RestorationModRestoreHitFlashDescID"] = "피해를 입었을 때 복원된 히트 플래시를 활성화 또는 비활성화합니다.",	
		["RestorationModNotifyTitleID"] = "기능 알림",
		["RestorationModNotifyDescID"] = "이 기능에 대한 알림을 활성화하거나 비활성화합니다.",
		["RestorationModPauseTitleID"] = "알파 일시 중지 메뉴",
		["RestorationModPauseDescID"] = "알파 일시 중지 메뉴를 활성화하거나 비활성화합니다.",

		["menu_support"] = "오버홀 가이드/지원",
		["menu_support_help"] = "레스트레이션 모드의 오버홀 가이드를 보고 지원을 받거나 팀원을 찾을 수 있습니다.",
		["menu_manual_header"] = "자리 표시기 텍스트",
		["hud_assault_alpha"] = "경찰 타격대",
		["hud_loot_secured_title"] = "전리품 확보!",
		["debug_none"] = "목표",

		["restoration_level_data_welcome_to_the_jungle_1"] = "오후 6:24, '오버킬 MC' 바이커 본부",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "오전 1:32, '오버킬 MC' 바이커 본부",
		["restoration_level_data_welcome_to_the_jungle_2"] = "오후 6:00, 빌라 비발디",
		["restoration_level_data_framing_frame_1"] = "오후 11:30, 국회 미술관",
		["restoration_level_data_framing_frame_2"] = "오후 12:30, 버려진 기차역",
		["restoration_level_data_framing_frame_3"] = "오전 2:20, 고층 아파트",
		["restoration_level_data_election_day_1"] = "오후 12:37, 39번 부두",
		["restoration_level_data_election_day_2"] = "오전 8:10, 저장 창고",
		["restoration_level_data_election_day_3"] = "안녕하세요! 게임 플레이 중 이 문자열을 발견하면 레스트레이션 팀에 신고하세요! 감사합니다!",
		["restoration_level_data_election_day_3_skip1"] = "오후 4:25, 국회 저축은행",
		["restoration_level_data_election_day_3_skip2"] = "오후 3:25, 국회 저축은행",
		["restoration_level_data_watchdogs_1"] = "오후 4:10, 고기 트럭",
		["restoration_level_data_watchdogs_1_res"] = "오후 9:10, 고기 트럭",
		["restoration_level_data_watchdogs_2"] = "오전 12:25, 알멘디아 조선소",
		["restoration_level_data_watchdogs_2_res"] = "오전 12:25, 알멘디아 조선소",
		["restoration_level_data_watchdogs_1_night"] = "오후 11:10, 고기 트럭",
		["restoration_level_data_watchdogs_2_day"] = "오후 6:05, 알멘디아 조선소",
		["restoration_level_data_watchdogs_3_res"] = "오전 12:20, 워싱턴 저스티스 다리",
		["restoration_level_data_alex_1"] = "오전 3:30, 조용한 언덕",
		["restoration_level_data_alex_2"] = "오전 5:55, 프로젝트",
		["restoration_level_data_alex_3"] = "오전 7:20, 워싱턴 저스티스 다리",
		["restoration_level_data_alex_1_res"] = "오전 3:30, 조용한 언덕",
		["restoration_level_data_alex_2_res"] = "오전 5:55, 프로젝트",
		["restoration_level_data_alex_3_res"] = "오전 7:20, 워싱턴 저스티스 다리",
		["restoration_level_data_firestarter_1"] = "오전 9:25, 개인 공항",
		["restoration_level_data_firestarter_1_res"] = "오전 9:25, 개인 공항",
		["restoration_level_data_firestarter_2"] = "오전 10:05, FBI 지부 사무소",
		["restoration_level_data_firestarter_2_res"] = "오전 10:05, FBI 지부 사무소",
		["restoration_level_data_firestarter_3"] = "오후 12:15, 하베스트 & 트러스티 은행",
		["restoration_level_data_firestarter_3_res"] = "오후 12:15, 하베스트 & 트러스티 은행",
		["restoration_level_data_ukrainian_job"] = "오후 2:50, 프레서스 띵스",
		["restoration_level_data_ukrainian_job_res"] = "오후 2:50, 프레서스 띵스",
		["restoration_level_data_jewelry_store"] = "오후 2:50, 프레서스 띵스",
		["restoration_level_data_four_stores"] = "오후 1:20, 상점 앞",
		["restoration_level_data_mallcrasher"] = "오후 12:50, 실드 쇼핑몰",
		["restoration_level_data_nightclub"] = "오후 8:00, 테이스트풀 클럽",
		["restoration_level_data_branchbank"] = "오후 12:15, 하베스트 & 트러스티 은행",
		["restoration_level_data_escape_cafe"] = "탈출하라!",
		["restoration_level_data_escape_park"] = "탈출하라!",
		["restoration_level_data_escape_cafe_day"] = "탈출하라!",
		["restoration_level_data_escape_park_day"] = "탈출하라!",
		["restoration_level_data_escape_street"] = "탈출하라!",
		["restoration_level_data_escape_overpass"] = "탈출하라!",
		["restoration_level_data_escape_garage"] = "탈출하라!",
		["restoration_level_data_escape_overpass_night"] = "탈출하라!",
		["restoration_level_data_safehouse"] = "오후 12:00, 세이프하우스",
		["restoration_level_data_arm_fac"] = "오전 9:30, 항구",
		["restoration_level_data_arm_par"] = "오후 2:25, 다운타운 구역",
		["restoration_level_data_arm_hcm"] = "오후 2:15, 다운타운 구역",
		["restoration_level_data_arm_cro"] = "오후 12:55, 매카시 거리와 제임스 거리의 교차로",
		["restoration_level_data_arm_und"] = "오후 8:15, 지하도",
		["restoration_level_data_arm_for"] = "오후 12:25, 아르마딜로 기차",
		["restoration_level_data_family"] = "오전 11:25, 조엘리 디 파밀리아",
		["restoration_level_data_family_res"] = "오전 11:25, 조엘리 디 파밀리아",
		["restoration_level_data_big"] = "오후 2:15, 베네볼렌트 은행",
		["restoration_level_data_big_res"] = "오후 2:15, 베네볼렌트 은행",
		["restoration_level_data_roberts"] = "오전 8:47, 로버트의 저축 및 신탁 은행",
		["restoration_level_data_roberts_v2"] = "오전 8:47, 로버트의 저축 및 신탁 은행",
		["restoration_level_data_mia_1"] = "오후 9:30, 커미사르의 모텔",
		["restoration_level_data_mia_2"] = "오전 11:45, 커미사르의 아파트 단지",
		["restoration_level_data_mia2_new"] = "오전 11:45, 커미사르의 아파트 단지",
		["restoration_level_data_kosugi"] = "오전 4:00, 터미널 창고",
		["restoration_level_data_gallery"] = "오후 11:45, 국회 미술관",
		["restoration_level_data_hox_1"] = "오전 10:30, 지하 법원 통로",
		["restoration_level_data_hox_2"] = "오후 4:10, J. 에드가 후버 빌딩",
		["restoration_level_data_pines"] = "오후 5:52, 깊은 숲속",
		["restoration_level_data_mus"] = "오후 8:15, 맥켄드릭 고대 예술 박물관",
		["restoration_level_data_crojob2"] = "오후 6:10, 워싱턴 항구",
		["restoration_level_data_crojob3"] = "오후 3:35, 숲 외곽",
		["restoration_level_data_crojob3_night"] = "오후 3:35, 숲 외곽",
		["restoration_level_data_cage"] = "오후 7:55, 토이어 자동차 판매점",
		["restoration_level_data_hox_3"] = "오후 11:55, FBI 세이프하우스",
		["restoration_level_data_rat"] = "오전 7:55, 조용한 언덕",
		["restoration_level_data_shoutout_raid"] = "오전 9:00, 터미널 창고",
		["restoration_level_data_arena"] = "오후 9:00, 젠섹 구역",
		["restoration_level_data_kenaz"] = "오후 8:00, 라스 베가스 스트립 - 골든 그린 카지노",
		["restoration_level_data_jolly"] = "오후 4:00, 로스앤젤레스 - 재난 지역",
		["restoration_level_data_red2"] = "오후 2:15, 다운타운 - 퍼스트 월드 뱅크",
		["restoration_level_data_dinner"] = "오전 8:01, 도살장 구역 - 매복!",
		["restoration_level_data_nail"] = "오후 0:00, 조용한 언덕",
		["restoration_level_data_haunted"] = "오후 ??:??, '세이프'하우스",
		["restoration_level_data_pbr"] = "오전 4:40, 네바다 - 블랙 릿지 시설",
		["restoration_level_data_pbr2"] = "시간 불명, Z-170 '제우스' - 머키워터 화물 비행기",
		["restoration_level_data_cane"] = "오후 3:15, 산타의 작업장",
		["restoration_level_data_peta"] = "오후 12:00, 다운타운 구역",
		["restoration_level_data_peta2"] = "오후 5:43, 난파된 헛간",
		["restoration_level_data_man"] = "오후 6:00, 구역 - 버려진 건물",
		["restoration_level_data_pal"] = "오후 12:00, 교외 - 보디의 수영장 수리점",
		["restoration_level_data_short1_stage1"] = "시간 불명, 위치 기밀",
		["restoration_level_data_short1_stage2"] = "시간 불명, 위치 기밀",
		["restoration_level_data_short2_stage1"] = "시간 불명, 위치 기밀",
		["restoration_level_data_short2_stage2"] = "시간 불명, 위치 기밀",
		["restoration_level_data_short2_stage2b"] = "시간 불명, 위치 기밀",
		["restoration_level_data_dark"] = "오전 2:21, 숨겨진 기차역",
		["restoration_level_data_mad"] = "시간 불명, 러시아 너머 어딘가...",
		["restoration_level_data_born"] = "오전 10:15, 오버킬 MC 클럽 & 바",
		["restoration_level_data_chew"] = "오후 5:25, DC 외부 - 움직이는 기차!",
		["restoration_level_data_flat"] = "오후 4:02, 프로젝트 - 차베스의 집",
		["restoration_level_data_chill"] = "오후 1:00, 세이프하우스",
		["restoration_level_data_chill_combat"] = "오후 1:00, 세이프하우스 - 경찰 습격!",
		["restoration_level_data_help"] = "다이얼을 만지지 마세요. 이제 시작일 뿐입니다.",
		["restoration_level_data_friend"] = "오후 4:30, 마이애미 - 엘 푸레이디스 맨션",
		["restoration_level_data_fish"] = "오후 7:30, 뉴욕시 외곽 - '레테' 요트",
		["restoration_level_data_spa"] = "오후 7:00, 뉴욕시 - 매복!",
		["restoration_level_data_moon"] = "오후 11:00, 무리카 쇼핑몰",
		["restoration_level_data_run"] = "오전 11:00, 업타운 - 이중 교차로",
		["restoration_level_data_glace"] = "오후 10:45, 그린 브릿지 - 남쪽",
		["restoration_level_data_dah"] = "오전 1:30, 22층 - 가넷 그룹 고층 빌딩",
		["restoration_level_data_hvh"] = "틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡. 틱, 톡.",
		["restoration_level_data_wwh"] = "시간 불명, 알래스카 어딘가...",
		["restoration_level_data_rvd1"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_rvd2"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_brb"] = "오후 6:53, 뉴욕, 브루클린 - 하베스트 & 트러스트 지점 은행",
		["restoration_level_data_des"] = "시간 기밀, 네바다 - 헨리스 락",
		["restoration_level_data_sah"] = "시간 기밀, 매사추세츠 - 섀클손 경매장",
		["restoration_level_data_tag"] = "오전 12:43, J. 에드가 후버 빌딩",
		["restoration_level_data_bph"] = "시간 기밀, 포트 클랏솝 감옥",
		["restoration_level_data_nmh"] = "오후 8:24, 머시 병원 - 격리 병동",
		["restoration_level_data_vit"] = "오후 1:07, 워싱턴 D.C. - 백악관",
		["restoration_level_data_mex"] = "시간 기밀, 미국 - 남부 국경",
		["restoration_level_data_mex_cooking"] = "시간 기밀, 멕시코 - 코요파 컴파운드",
		["restoration_level_data_bex"] = "시간 기밀, 멕시코 - 산 마르틴 은행",
		["restoration_level_data_pex"] = "시간 기밀, 멕시코 - 경찰서",
		["restoration_level_data_fex"] = "시간 기밀, 멕시코 - 불룩의 저택",
		["restoration_level_data_chas"] = "오후 8:30, 샌프란시스코 - 차이나타운",
		["restoration_level_data_sand"] = "오후 10:30, 샌프란시스코 - 조선소",
		["restoration_level_data_chca"] = "오후 9:24, 샌프란시스코 베이 - 흑묘",		
		["restoration_level_data_wetwork"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_junk"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_holly"] = "오후 5:00, 로스앤젤레스 - 루카스 맨션",
		["restoration_level_data_lvl_friday"] = "오후 5:00, 실드 쇼핑몰",
		
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
	
		["heist_contact_shatter"] = "자칼",
		["heist_contact_akashic"] = "니코",

		["menu_contacts_shatter"] = "Crime.net 계약자",
		
		["heist_contact_jackal_description"] = "자칼은 젠섹에서 소속했었지만 젠섹 및 옴니아와 관련된 인신매매 사건 이후 그만두었습니다.\n\n지금은 Crime.net에서 소속하여 싸움을 그들의 문으로 데려갑니다.",
		
		["heist_contact_akashic_description"] = "이전에 헥터 모랄레스 아래에서 속해있는 고위 간부였던 니콜라스 '니코' 르네는 현재 미국에서 시날론 카르텔의 잔당을 지휘하고 있습니다.\n그들의 수는 적고 더 큰 콜롬비아 카르텔은 그들을 돕거나 Crime.net과의 관계를 회복할 의도가 없었습니다.\n\n동부 해안에서 활동하는 다양한 소규모 갱단을 흡수하고 Crime.net과 동맹을 맺은 그는 서비스에 대한 대가로 자원을 제공합니다.",

		["bm_msk_shatter_true"] = "샤터",
		["bm_msk_shatter_true_desc"] = "은밀한 어조로만 말했던 전설의 마스크입니다.\n\n물론, 이건 단지 복제품일 뿐입니다.\n\n실제보다 훨씬 더 특별한 것이 있지만 진짜도 그만큼 좋아할 거라 생각됩니다.\n\n불사조는 진정으로 죽일 수 없는 영원한 존재인 재생을 상징합니다. 하나를 내리치려고 하면 화염과 연소의 멋진 쇼로 반격합니다.",

		["menu_l_global_value_veritas"] = "레스트레이션 모드",
		["menu_l_global_value_veritas_desc"] = "이 상품은 레스트레이션 모드 아이템입니다!",

		["menu_alex_1_zipline"] = "가방 짚라인",

		["menu_asset_wet_intel"] = "정보",
		["menu_asset_risk_murky"] = "머키워터 용병",
		["menu_asset_risk_bexico"] = "연방 경찰",
		["menu_asset_risk_zombie"] = "좀비 소생",
		["menu_asset_wet_boat"] = "보트",
		["menu_asset_wet_boat_desc"] = "확보 및 탈출 할 수 있는 보트를 삽니다",

		["bm_msk_canada"] = "하키 지옥",
		["bm_msk_canada_desc"] = "아무 것도 남기지 마세요. 더위가 닥쳐도 원하는 시간에 원하는 것을 위해 싸울 수 있습니다. (아님 열압폭발물 일지라도.)",
		["bm_msk_jsr"] = "그래피티 부인",
		["bm_msk_jsr_desc"] = "진정한 예술가에 의해 만들어졌습니다. 낙서를 청소하는 것은 책을 태우는 것과 같죠?\n\n예술은 예술입니다, 그것을 존중하십시오.",
		["bm_msk_jsrf"] = "미스터 그래피티",
		["bm_msk_jsrf_desc"] = "그래피티는 이야기를 전합니다. 추운 도시에서 예술가가 된다는 것은 고통스러운 이야기일 수 있습니다.\n\n그래피티는 이 이야기를 책처럼 들려줍니다. 당신은 그들을 가장 잘 읽을 것입니다.",
		["bm_msk_courier_stash"] = "전리품 가방",
		["bm_msk_courier_stash_desc"] = "몇 백 달러짜리 지폐를 몇 장 더 들고 싶은데 주머니에 여유가 없다면 이 마스크가 도움이 될 것입니다.",

		["bm_msk_female_mask"] = "표준 마스크 (여)",
		["bm_msk_female_mask_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.",
		["bm_msk_female_mask_blood"] = "회수된 마스크 (여)",
		["bm_msk_female_mask_blood_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.\n\n이것은 옴니아 창고에서 발생한 강도 사건의 여파로 발견되었으며, 그 곳에 남은 것은 시체와 피뿐이었습니다.\n\n어두워지기 전 팀원들의 마지막 메시지는 '에리트 프리미엄 생귀인 생텀''이었습니다.",
		["bm_msk_female_mask_clown"] = "로지",
		["bm_msk_female_mask_clown_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.\n\n이것은 로지라는 별명의 하이스터가 착용했지만, 그녀는 요즘엔 새 마스크을 쓰고 있습니다.\n\n영상에서 그녀는 완전히 무장하지 않은 SWAT의 전체 분대를 쓰러뜨리는 것이 보였습니다.",
		["bm_msk_male_mask"] = "표준 마스크 (남)",
		["bm_msk_male_mask_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.",
		["bm_msk_male_mask_blood"] = "회수된 마스크 (남)",
		["bm_msk_male_mask_blood_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.\n\n이것은 옴니아 창고에서 발생한 강도 사건의 여파로 발견되었으며, 그 곳에 남은 것은 시체와 피뿐이었습니다.\n\n어두워지기 전 팀원들의 마지막 메시지는 '에리트 프리미엄 생귀인 생텀''이었습니다.",
		["bm_msk_male_mask_clown"] = "크로스",
		["bm_msk_male_mask_clown_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 헐렁하지도 않고, 그렇다고 쓰기도 쉽지 않습니다.\n\n이것은 크로스라는 별명을 사용하는 하이스터가 착용했지만, 그는 요즘엔 새 마스크을 쓰고 있습니다.\n\n재능 있는 명사수인 그는 한때 5초 동안 4대의 장갑차를 격파했습니다.",

		["bm_msk_twister_mask"] = "미스터리 맨",
		["bm_msk_twister_mask_desc"] = "이 마스크 뒤에 누가 있는지는 미스터리입니다.\n\n모르는 사람일 수도 있고, 오랫동안 알고 지낸 사람일 수도 있습니다.",
		["bm_msk_voodoo_mask"] = "흑마법",
		["bm_msk_voodoo_mask_desc"] = "폭격 공습 당한 정글 폐허에서 발견된 이 마스크는 환경과 대학살을 견뎌냈고 지금은 징조로 알려져 있습니다.\n\n당신이 가장 필요로 할 때 당신을 찾아내고 파괴를 견딜 수 있는 행운을 불러일으킬 것입니다.\n\n하지만 이건 물어봐야 합니다. 비용은 얼마입니까?",

		["bm_msk_f1"] = "X1 헬멧",
		["bm_msk_f1_desc"] = "고속도로에서 속도를 내고 붐비는 거리에서 고무를 태울 때 보호 장비를 착용하십시오.\n\n이건 심한 추락으로부터 당신을 보호 할 수 있지만 확실히 총알에는 먹히지 않습니다.",
		["bm_msk_f1_b"] = "X1 헬멧 (깨긋함)",
		["bm_msk_f1_b_desc"] = "고속도로에서 속도를 내고 붐비는 거리에서 고무를 태울 때 보호 장비를 착용하십시오.\n\n이건 심한 추락으로부터 당신을 보호 할 수 있지만 확실히 총알은 먹히지 않습니다.\n\n이것은 브랜드 스티커가 없는 헬멧의 복제품으로, 멋진 차량 무리와 함께 잠긴 곳에서 발견되었습니다.\n\n이것을 편리하게 보관하면 자신의 차를 운전할 기회를 얻을 수 있습니다.",
		["bm_msk_sweettooth"] = "스위트 튜",
		["bm_msk_sweettooth_desc"] = "스위트 튜, 본명 마커스 '누들' 케인은 Twisted Metal 비디오 게임 시리즈의 캐릭터입니다. 스위트 튜는 전투 아이스크림 트럭을 운전하는 살인자 광대로 가장 잘 알려져 있습니다.\n\n한때 정신병원에서 탈출한 적이 있다고 합니다. 이제 그는 범죄의 삶을 살고 있습니다.",

		["bm_msk_wolf_stone"] = "스톤콜드 울프",
		["bm_msk_wolf_stone_desc"] = "그가 가장 좋아하는 매체의 범죄를 연기하면서 처음으로 가장자리를 넘어섰을 때의 울프의 원래 마스크, 이 마스크는 비디오 게임 'Hyper Heisting'에서 영감을 받아 강도 사건에서 잃어버린 것으로 생각되었습니다.\n\n갱단의 초기 작업의 여파로 마스크가 다시 나타났고 베인의 동료 중 한 명이 세이프하우스로 가져갔습니다.\n\n마스크의 원래 패턴은 시간이 지남에 따라 부분적으로 닳았으며 아마도 울프의 정신 안정감이 감소한 것을 반영한 것일 수 있습니다.",

		["bm_msk_dallas_aged"] = "오래된 달라스",
		["bm_msk_dallas_aged_desc"] = "당신과 당신의 팀원은 헨리스 락에서 이상한 이집트 상자에 이 마스크를 찾았습니다. 상자 자체는 나중에 운송 중에 가로채고 나머지 내용물은 귀하에게 배달되었습니다.\n\n이 마스크에 대해 뭔가... 이상합니다. 그들이 어디에서 왔는지에 대한 정보가 없습니다.\n\n자칼은 이것이 실용적인 농담일 수도 있고, 팀원을 놀라게 하려는 시도일 수도 있다고 말합니다.\n\n당신이 말할 수있는 한? 이것들은 아주 아주 오래된 것 같습니다.",
		["bm_msk_chains_aged"] = "오래된 체인스",
		["bm_msk_chains_aged_desc"] = "당신과 당신의 팀원은 헨리스 락에서 이상한 이집트 상자에 이 마스크를 찾았습니다. 상자 자체는 나중에 운송 중에 가로채고 나머지 내용물은 귀하에게 배달되었습니다.\n\n이 마스크에 대해 뭔가... 이상합니다. 그들이 어디에서 왔는지에 대한 정보가 없습니다.\n\n자칼은 이것이 실용적인 농담일 수도 있고, 팀원을 놀라게 하려는 시도일 수도 있다고 말합니다.\n\n당신이 말할 수있는 한? 이것들은 아주 아주 오래된 것 같습니다.",
		["bm_msk_hoxton_aged"] = "오래된 혹스턴",
		["bm_msk_hoxton_aged_desc"] = "당신과 당신의 팀원은 헨리스 락에서 이상한 이집트 상자에 이 마스크를 찾았습니다. 상자 자체는 나중에 운송 중에 가로채고 나머지 내용물은 귀하에게 배달되었습니다.\n\n이 마스크에 대해 뭔가... 이상합니다. 그들이 어디에서 왔는지에 대한 정보가 없습니다.\n\n자칼은 이것이 실용적인 농담일 수도 있고, 팀원을 놀라게 하려는 시도일 수도 있다고 말합니다.\n\n당신이 말할 수있는 한? 이것들은 아주 아주 오래된 것 같습니다.",
		["bm_msk_wolf_aged"] = "오래된 울프",
		["bm_msk_wolf_aged_desc"] = "당신과 당신의 팀원은 헨리스 락에서 이상한 이집트 상자에 이 마스크를 찾았습니다. 상자 자체는 나중에 운송 중에 가로채고 나머지 내용물은 귀하에게 배달되었습니다.\n\n이 마스크에 대해 뭔가... 이상합니다. 그들이 어디에서 왔는지에 대한 정보가 없습니다.\n\n자칼은 이것이 실용적인 농담일 수도 있고, 팀원을 놀라게 하려는 시도일 수도 있다고 말합니다.\n\n당신이 말할 수있는 한? 이것들은 아주 아주 오래된 것 같습니다.",

		["bm_msk_beef_dallas"] = "비프 달라스",
		["bm_msk_beef_dallas_desc"] = "팀원들은 도살장 하이스트를 할 때 이 마스크를 사용했습니다.\n\n달라스는 그의 상징적인 광대 마스크와 유사한 디자인을 유지하기로 결정했습니다.",
		["bm_msk_beef_chains"] = "비프 체인스",
		["bm_msk_beef_chains_desc"] = "팀원들은 도살장 하이스트를 할 때 이 마스크를 사용했습니다.\n\n체인스는 인포서 타입에 따라 그의 디자인에 위협적인 동물을 원했습니다. 무서운 공룡보다 더 무서운 것은 무엇입니까?",
		["bm_msk_beef_hoxton"] = "비프 혹스턴",
		["bm_msk_beef_hoxton_desc"] = "팀원들은 도살장 하이스트를 할 때 이 마스크를 사용했습니다.\n\n혹스턴은 그의 마스크에 대한 간단한 목록이 있었습니다:\n- 방어!\n- 효율!\n- 세련!\n\n그래서 이 가면이 탄생했습니다.",
		["bm_msk_beef_wolf"] = "비프 울프",
		["bm_msk_beef_wolf_desc"] = "팀원들은 도살장 하이스트를 할 때 이 마스크를 사용했습니다.\n\n울프의 디자인은 게임 개발자 시절부터 그가 가장 좋아하는 캐릭터 디자인 중 하나에서 영감을 받았습니다.",

		["bm_msk_vyse_dallas"] = "근원",
		["bm_msk_vyse_dallas_desc"] = "바이세는 후추 추출물의 악마와 대면하고 살아남았습니다. 이 마스크는 악마의 뼈로 만들어졌습니다.",
		["bm_msk_vyse_chains"] = "얘들 놀이",
		["bm_msk_vyse_chains_desc"] = "바이세는 포트 녹스가 보유할 수 있는 것보다 더 많은 돈과 금을 훔쳤지만 일부 내용물을 아픈 아이들과 공유하는 것을 보여줄 수 있는 품위가 있었습니다.\n\n베인이 그 아이들 중 일부를 방문했다고 전해지는 바에 따르면 이 마스크는 바이세에 대한 감사의 표시입니다.",
		["bm_msk_vyse_hoxton"] = "3명의 멍청이들",
		["bm_msk_vyse_hoxton_desc"] = "그들은 당신이 엉망이되면 고통을 직면하고 다시 시도해야한다고 말합니다. 그러나 바이세는 아닙니다. 그가 망칠 때마다 전직 군인들에게 계속 뺨을 맞고 다녔습니다. 래리, 컬리, 모에조차도 그런 구타를 견딜 수 없었습니다.",
		["bm_msk_vyse_wolf"] = "베어 그릴스",
		["bm_msk_vyse_wolf_desc"] = "바이세는 베어 그릴스에게 오줌 마시기 대결에 도전했고 바이세가 이겼습니다. 그리고 미스터 그릴스는 생존 기술을 사용하여 이 가면을 만들었습니다.",

		["bm_msk_secret_old_hoxton"] = "시크릿 혹스턴 리본",
		["bm_msk_secret_old_hoxton_desc"] = "혹스턴은 새 월급날을 받기 위해 본국을 떠났습니다. 베인이 그에게 비밀에 대해 처음 이야기했을 때, 그는 베인이 이야기한 전설적인 힘이 진짜인지 아닌지에 대해 전혀 신경 쓰지 않고 잠재적 가치를 위해 고대 아이템을 쫓는 아이디어를 생각했습니다.",

		["bm_msk_secret_clover"] = "시크릿 클로버",
		["bm_msk_secret_clover_desc"] = "베인이 클로버에게 비밀에 대해 이야기했을 때 그녀는 회의적이었습니다. 신화적인 힘을 지닌 고대의 물건에 대한 베인의 이야기는 항상 터무니없는 것 같았지만, 세 상자의 집합체를 마주했을 때 모든 의심이 그녀의 마음을 떠났습니다.",

		["bm_msk_secret_dragan"] = "시크릿 드라간",
		["bm_msk_secret_dragan_desc"] = "전직 경찰이었던 드라간은 증거를 찾는 눈이 있었고 베인이 비밀에 대한 연구를 보여주었을 때 그는 고대의 권력 물체를 사냥할 준비가 되어 있었습니다.",

		["bm_msk_secret_bonnie"] = "시크릿 보니",
		["bm_msk_secret_bonnie_desc"] = "베인에게 비밀을 들은 보니는 자신이 가장 좋아하는 위스키를 한 모금 마시고 카타루를 엿먹이려고 덤벼들었습니다.",

		["bm_msk_secret_syndey"] = "시크릿 시드니",
		["bm_msk_secret_syndey_desc"] = "베인에게 비밀을 들었을 때 시드니는 고대 세력에 대한 이야기를 믿지 않았습니다. 그럼에도 불구하고 알려지지 않았지만 가장 중요한 권위에 도전할 기회는 그녀를 승선시키기에 충분했습니다.",

		["bm_msk_secret_richard"] = "시크릿 리차드",
		["bm_msk_secret_richard_desc"] = "범죄 지하 세계를 돌고 있는 소문은 알려지지 않은 조직의 손에 끔찍한 최후를 맞이한 살인자 자켓에게 영감을 준 살인자에 대해 이야기합니다. 자켓이 베인한테 비밀에 대해 들었을 때, 그는 나중에 그의 가장 큰 영감의 가면처럼 보이는 것을 가지고 나타났습니다.",

		["bm_all_seeing"] = "모든 것을 보는 앵커",
		["bm_all_seeing_desc"] = "끔찍한 광경, 악몽 같은 광경.\n\n당신을 본 힘과 당신의 기여에 대한 보상을 보장합니다.",

		["bm_msk_classic_helmet"] = "클래식 인포서",
		["bm_msk_classic_helmet_desc"] = "전직 SWAT 인포서가 준 선물. 은퇴하기 전에 그는 자칼을 찾았고... 자칼의 노력을 돕기 위해 허용할 수 있는 장비만 제공했습니다.\n\n그의 호기심 어린 제안은 한 가지 이유 때문이었습니다. 그는 옴니아가 비밀리에 하고 있는 것을 보았습니다. 그러나 그 자신은 그 비밀을 밝히기를 거부하고 곧 떠나서 다시는 볼 수 없게 되었습니다.\n\n자칼은 이 헬멧을 여기로 보냈습니다. 기여에 대한 보상입니다.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Push the placeholder, we'll get around to it.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "자칼의 가면 또는 재현품.\n\n실제 마스크는 자칼에게 중요하며 일부에서는 실제로 민감한 데이터가 포함되어 있다고 말합니다.\n\n그러나 이 재현은 디스플레이를 실행하는 시스템이 매우 기초적이고 실제를 복제하려고 합니다.\n\n당신의 노력에 대한 선물입니다.",


		["bm_msk_finger"] = "그리퍼",
		["bm_msk_finger_desc"] = "그리퍼는 신화 속의 짐승으로 오래전에 이 세계의 일부였다고 알려져 있습니다. 그 짐승은 의도적으로 마을과 마을의 일반 사람들을 쫓고 괴롭히고, 순진한 방법으로 그들을 사냥했습니다. 그리퍼는 이러한 행위에서 즐거움을 얻었고 왕의 부하들이 마침내 그를 찾아내고 그를 죽일 때까지 평화를 위협했습니다.",

		["bm_msk_instinct"] = "직관",
		["bm_msk_instinct_desc"] = "이 마스크는 먼 곳에서 온 수수께끼의 전사의 것이었습니다. 그는 직감에 따라 땅을 걸으며 전 세계의 악의 세력을 사냥했습니다. 그는 던전을 탐험하고 그가 만난 수천 명의 사악한 존재를 죽였습니다. 결국 그는 자신이 그랬던 것처럼 다음 세대가 계속될 것이라는 것을 알고 평화를 찾았습니다.",

		["bm_msk_unforsaken"] = "포세이큰",
		["bm_msk_unforsaken_desc"] = "이 전설적인 마스크는 커뮤니티의 헌신, 이해 및 지속적인 지원에 대한 감사의 표시입니다. 오버킬 팀원에게 - 우리는 당신에게 경의를 표합니다.\n\n두꺼운 것과 얇은 것을 통해 그 헬멧을 날게하십시오.",

		["bm_msk_chains_halloween"] = "샤터 실드",
		["bm_msk_chains_halloween_desc"] = "고용된 용병이 되면 많은 고통과 죽음을 보게 됩니다. 당신이 무적이거나 멈출 수 없다고 느끼더라도... 때때로 모든 것이 당신을 괴롭히기 위해 되돌아옵니다.\n\n2008년의 아름답고 밝고 눈이 내리는 10월 오후, 체인스는 잠을 자고 있었습니다. 머키워터 대신하여 암살 일을 막 마친 그는 힘든 일을 하고 급여를 받았으며 잠을 잘 수 있는 멋진 호텔 방을 얻었습니다.\n\n몇 년 만에 처음으로 그는 악몽에 시달렸습니다. 그는 그것이 무엇인지 기억할 수 없지만 깨어나 마비되었고, 그 위에 사람보다 더 해골 같은 형체가 서 있었고 움직일 수 없었습니다.\n\n그 날 이후 총을 들 때마다 다음 밤은 불안하고 끔찍했졌습니다.\n\n결국 그는 '충분하다'라고 말해야 했고. 용병 사업에서 나와 치료사를 만났습니다. 약이 도움이 되었고 덕분에 1년은 잘 살았습니다...\n\n정확히 1년 후인 2009년 10월 31일 머키워터는 자신의 삶을 고친 사람이 비밀을 폭로하고 회사를 해칠 것이라고 확신했습니다. 그들은 그렇게 냅둘 순 없었습니다.\n\n범죄 생활에 휘말린 체인스는 결국 자신을 지키기 위해 다시 군인이 됩니다.\n\n그런데 이번에는 달랐습니다. 악몽과 수면마비는 돌아오지 않았고. 그는 다른 사람들에게 상처를 주려고 나온 것이 아닙니다.\n\n이번에는 자신을 보호하는 것이었습니다.",

		["bm_msk_dallas_halloween"] = "괴물의 반사",
		["bm_msk_dallas_halloween_desc"] = "거짓 신원, 거짓말, 이야기를 구성하는 데 너무 많은 세월을 보내다 보면 자신을 잃어버리기 시작합니다.\n\n당신은 당신의 다양한 친구, 연인, 친구로부터 특성과 특징을 선택하면서 사람에서 사람으로 튀기 시작합니다. 아마도 그것들이 서로 섞이기 시작하고, 당신은 융합처럼 느껴질 것입니다.\n\n달라스는 10월의 어느 날 아침에 일어나 거울로 걸어갔습니다. 머리는 못생긴 금발로 염색했고 헝클어진 면도를 했습니다. 쉼 없는 악몽의 땀으로 얼룩진 끈적끈적한 양복. 술에서 술로 넘어간 주말 후 욱신거리는 두통.\n\n자신을 쳐다보면서 그가 생각할 수 있는 것은 그가 사람이라기보다 프랑켄슈타인의 괴물에 더 가깝다는 것뿐이었습니다. 그의 범죄 경력을 더 발전시키기에 충분할 만큼 충분히 설득력 있는 부분일 뿐입니다.\n\n전환점이 되었지만 때때로 그는 여전히 자신의 조각이 전부가 아니라는 느낌은 지울 수가 없습니다.",

		["bm_msk_hoxton_halloween"] = "할로윈 꿈",
		["bm_msk_hoxton_halloween_desc"] = "혹스턴의 할로윈 기억 중 하나는 뉴욕에 일종의 특별한 휴양지로 보기 위해 친척과 함께 10월에 미국으로 여행하는 것이었습니다.\n\n그는 사탕의 열렬한 팬이 아니었지만 친척의 파티에서 제공되는 호박 파이를 좋아했습니다.\n\n연회장 밖 홀을 배회하는 동안 그는 커다란 금고 문이 있고 온갖 종류의 장신구와 재물이 들어 있는 것을 보았습니다.\n\n그 이후로 그는 항상 휴일 동안 장소를 치는 것을 좋아했습니다.",

		["bm_msk_wolf_halloween"] = "악마의 외침",
		["bm_msk_wolf_halloween_desc"] = "2010년의 추운 10월 저녁, 울프는 파산하는 회사로 인한 재정적 타격에서 여전히 회복 중이었습니다.\n\n모텔방에 혼자 누워 그는 가족에 대해 생각했고 가족에게 실망감을 안겼다는 생각이 들었고 마지막 생명선이 자신을 절단한 후 온 나라에서 가족을 다시는 볼 수 없을 것이라고 생각했습니다..\n\n새 집에서 새로 시작할 수 있는 충분한 돈을 확보하기 위해 그는 마지막으로 저축한 돈을 미국으로 여행하는 데 썼습니다.\n\n몇 주 후, 친구의 집, 모텔, 피난처에 간 그는 몇 주 만에 중요한 다른 사람에게서 첫 번째 전화를 받았습니다.\n\n관계는 더 이상 없었다. '더 이상 잘 일하지 않아.'\n\n아마도 새로운 시작이 있었을거나.\n\n아마도 추구해야 할 새로운 직업이 있었을 것입니다.",


		["pattern_jkl_patt01_title"] = "자칼",
		["pattern_jkl_patt02_title"] = "컴퍼니",
		["material_jkl_matt01_title"] = "파이팅 페더",
		["material_jkl_matt02_title"] = "베리타스 골드",

		["menu_scores"] = "SCORES",

		["RestorationModColorOption"] = "이 HUD 요소의 색상을 원하는 대로 변경합니다.",
		["RestorationModColorsOptionsButtonTitleID"] = "색상 설정",
		["RestorationModColorsOptionsButtonDescID"] = "많은 HUD 개체의 색상을 변경합니다.",
		["RestorationModObjectivesBGTitleID"] = "목표 배경",
		["RestorationModObjectivesFGTitleID"] = "목표 전경",
		["RestorationModAssaultBGTitleID"] = "어썰트 배경",
		["RestorationModAssaultFGTitleID"] = "어썰트 전경",
		["RestorationModNoReturnTitleID"] = "돌아갈 수 없는 지점 텍스트",
		["RestorationModTimerTextTitleID"] = "하이스트 타이머 텍스트",
		["RestorationModAssaultEndlessBGTitleID"] = "캡틴 어썰트 배경",
		["RestorationModAssaultSurvivedBGTitleID"] = "살아남은 어썰트 배경",
		["RestorationModStaminaTitleID"] = "스테미나",
		["RestorationModStaminaThresholdTitleID"] = "스테미나 한계점",
		["RestorationModBagBitmapTitleID"] = "가방",
		["RestorationModBagTextTitleID"] = "가방 텍스트",
		["RestorationModNoReturnTextTitleID"] = "돌아갈 수 없는 지점 텍스트",
		["RestorationModHostagesTextTitleID"] = "인질 텍스트",
		["RestorationModHintTextTitleID"] = "힌트 텍스트",
		["RestorationModMaskOnTextTitleID"] = "마스크 끼기 텍스트",
		["RestorationModStopAllBotsTitleID"] = "모든 봇 멈추기",
		["RestorationModStopAllBotsDescID"] = "봇 멈추는 키를 눌러 모든 봇을 멈춥니다.",
		["RestorationModPONRTrackTitleID"] = "돌아갈 수 없는 지점 음악",
		["RestorationModPONRTrackDescID"] = "돌아올 수 없는 지점이 시작되면 프로 잡의 음악 트랙을 변경합니다.",
		["RestorationModPONRTracksTitleID"] = "돌아갈 수 없는 지점 음악",
		["RestorationModPONRTracksDescID"] = "돌아올 수 없는 지점이 시작될 때 프로 잡의 음악 트랙을 선택합니다.",
		["RestorationModMusicShuffleTitleID"] = "음악 셔플",
		["RestorationModMusicShuffleDescID"] = "어썰트 종료 후 음악 트랙을 변경합니다.",
		["RestorationModScaleTitleID"] = "HUD 스케일링",
		["RestorationModScaleDescID"] = "HUD 스케일을 변경합니다. 재시작해야 적용됩니다.",
		["RestorationModSizeOnScreenTitleID"] = "화면의 HUD 크기",
		["RestorationModSizeOnScreenDescID"] = "화면의 HUD 크기를 변경합니다. 재시작해야 적용됩니다.",
		["RestorationModTeammateTitleID"] = "알파 팀원 패널",
		["RestorationModTeammateDescID"] = "당신과 당신 팀의 통계를 표시하는 알파 팀원 패널을 활성화하거나 비활성화합니다.",
		["RestorationModHeistTimerTitleID"] = "알파 하이스트 타이머",
		["RestorationModHeistTimerDescID"] = "알파 하이스트 타이머를 활성화하거나 비활성화합니다.",
		["RestorationModMaskOnTitleID"] = "알파 마스크 쓰기 텍스트",
		["RestorationModMaskOnDescID"] = "알파 마스크 쓰기 텍스트를 활성화하거나 비활성화합니다.",
		["RestorationModNameLabelsTitleID"] = "알파 이름 라벨",
		["RestorationModNameLabelsDescID"] = "알파 이름 라벨을 활성화하거나 비활성화합니다.",
		["RestorationModHintTitleID"] = "알파 힌트 패널",
		["RestorationModHintDescID"] = "알파 힌트 패널을 활성화하거나 비활성화합니다.",
		["RestorationModExtraOptionsButtonTitleID"] = "많은 HUD 옵션",
		["RestorationModExtraOptionsButtonDescID"] = "더 많은 옵션!",
		["RestorationModRealAmmoTitleID"] = "실제 탄약",
		["RestorationModRealAmmoDescID"] = "총 탄약 카운터가 현재 무기에 있는 탄약을 무시합니다.",
		["RestorationModStealthOrigPosTitleID"] = "바닐라 감지 미터 위치",
		["RestorationModStealthOrigPosDescID"] = "바닐라와 같은 위치에 감지 미터를 배치합니다.",
		["RestorationModLowerBagTitleID"] = "집을 때 가방 팝업 낮춤",
		["RestorationModLowerBagDescID"] = "가방을 집을 때 나타나는 팝업을 낮춥니다.",
		["RestorationModAssaultStyleTitleID"] = "어썰트 패널 스타일",
		["RestorationModAssaultStyleDescID"] = "사용하려는 어썰트 패널의 스타일을 선택합니다.",
		["RestorationModCasingTickerTitleID"] = "알파 케이싱 테이프",
		["RestorationModCasingTickerDescID"] = "알파 케이싱 테이프를 활성화 또는 비활성화합니다 (알파 테이프 스타일 필요).",
		["RestorationModCustodyTitleID"] = "알파 구금",
		["RestorationModCustodyDescID"] = "알파 구금 패널을 활성화 또는 비활성화합니다.",
		["RestorationModCrimenetTitleID"] = "알파 CRIMENET (WIP)",
		["RestorationModCrimenetDescID"] = "알파 CRIMENET을 활성화 또는 비활성화합니다.",
		["RestorationModProfileTitleID"] = "알파 프로필 박스",
		["RestorationModProfileDescID"] = "알파 프로필 박스를 활성화하거나 비활성화합니다.",
		["RestorationModNewsfeedTitleID"] = "알파 뉴스피드",
		["RestorationModNewsfeedDescID"] = "알파 뉴스피드를 활성화하거나 비활성화합니다.",
		["RestorationModUppercaseNamesTitleID"] = "대문자 이름",
		["RestorationModUppercaseNamesDescID"] = "대문자 이름을 활성화하거나 비활성화합니다.",
		["RestorationModPeerColorsTitleID"] = "알파 피어 색상",
		["RestorationModPeerColorsDescID"] = "알파 피어 색상을 활성화하거나 비활성화합니다.",
		["RestorationModPocoCrimenetAlignSortTitleID"] = "Poco 중심 맞추기 및 CRIMENET 정렬",
		["RestorationModPocoCrimenetAlignSortDescID"] = "CRIMENET을 난이도별로 중심을 맞추고 정렬합니다.",
		["RestorationModPocoCrimenetScaleTitleID"] = "Poco CRIMENET 크기",
		["RestorationModPocoCrimenetScaleDescID"] = "CRIMENET의 크기를 설정합니다.",
		["RestorationModVoiceIconTitleID"] = "음성 채팅 아이콘",
	    ["RestorationModVoiceIconDescID"] = "플레이어가 게임 내에서 음성 채팅을 사용할 때 표시합니다.",
		["alpha_assault"] = "초기 알파 코너",
		["beta_assault"] = "알파 테이프",

		["menu_ingame_manual"] = "오버홀 가이드",
		["menu_ingame_manual_help"] = "레스트레이션의 오버홀 가이드 봅니다.",

		["menu_asset_wet_add_saw"] = "추가 톱",
		["menu_asset_wet_add_saw_desc"] = "추가 톱을 구매합니다",
		["menu_rush_asset_sentrygun"] = "센트리 패키지",
		["menu_rush_asset_sentrygun_desc"] = "센트리 패키지를 구매합니다",

		["heist_junker_name"] = "도그하우스",
		["heist_junker_brief"] = "이건 블라드를 위한 작업이야. 분명히, 실패한 무역 거래는 그의 부하들과 그들이 가져온 물품을 나쁜 상황에 놓이게 만들고. 연방경찰은 거의 이 상황에 직면해 있지. 너희들을 해당 위치로 데려다 줄 차량이 준비되어 있고 백업을 제공할 수 있어. 우리는 지원 헬기를 확보하고 너희들과 필수품을 그곳에서 꺼낼거야.\n\n짧을 수도 있겠지만 경찰을 과소평가하지말고. 장비를 가져가.",
		["heist_junk_name"] = "경계하는 눈",
		["heist_junk_brief"] = "건설 지역이 바로 앞에 있어. 경찰은 아직 도착하지 않았지만 곧 올거야. 블라드의 부하들이 백업을 제공할 거지만 너무 오래 지속되지는 않을거야.\n\n보고에 따르면 현장에 마약 제조실이 분명히 있으니 블라드의 물건을 동시에 안전하게 보관할 수 있다면 약간의 추가 돈을 자유롭게 벌 수 있을거야.",
		["junk_01"] = "현금과 마약을 보호하라",
		["junk_01_desc"] = "경찰이 전리품에서 멀리 떨어지게 하라! 코카인와 돈 모두 방어해야 된다.",
		["junk_02"] = "각 가스통을 배치하여 쏘고 불을 붙여라",
		["junk_02_desc"] = "불을 붙여 조종사에게 위치를 알려라.",
		["junk_03"] = "현금과 마약을 보호하라",
		["junk_03_desc"] = "경찰이 블라드의 제품을 확보하게 두지마라! 가방을 너무 많이 잃어버리면 작업이 실패된다!",
		["junk_04"] = "블라드의 물건을 확보하라",
		["junk_04_desc"] = "블라드의 코카인을 확보해라. 그의 부하들이 돈을 확보할 것이다.",
		["junk_05"] = "탈출 가능",
		["junk_05_desc"] = "테이크에 만족하는 즉시 떠나라.",

		["heist_int_dock_name"] = "웨트워크",
		["heist_int_dock_brief"] = "이 창고는 머키워터 물류의 소유다. 적어도 지금은 말이지. 그들은 한동안 그곳을 전리품 보관소로 사용해 왔지만, 최근에 그들은 몇몇 '분류된' 서버들을 옮기는 것이 목격되었다. 정보에 따르면 그들은 옴니아와 그들 사이의 동맹에 관한 정보를 가지고 있다고 한다.\n\n시끄럽게든 은밀하게든 간에 유일한 목표는 해당 서버에 접근하여 데이터를 검색하는 것이다. 방법에 관계없이 그들의 저항이 예상되는군.",
		["heist_wetwork_name"] = "웨트워크",
		["heist_wetwork_brief"] = "이 창고는 머키워터 물류의 소유다. 적어도 지금은 말이지. 그들은 한동안 그곳을 전리품 보관소로 사용해 왔지만, 최근에 그들은 몇몇 '분류된' 서버들을 옮기는 것이 목격되었다. 정보에 따르면 그들은 옴니아와 그들 사이의 동맹에 관한 정보를 가지고 있다고 한다.\n\n시끄럽게든 조용하게든 유일한 목표는 해당 서버에 접근하여 데이터를 검색하는 것이다. 방법에 관계없이 그들의 저항이 예상되는군.",
		["obj1_enterwarehouse"] = "창고에 들어가라",
		["obj1_enterwarehouse_desc"] = "창고에 들어가라.",
		["obj2_findsecuritydoor"] = "서버룸을 찾아라",
		["obj2_findsecuritydoor_desc"] = "서버룸을 찾아라. 창고 어딘가에 있을 것이다, 아마 잠긴 문 뒤에 있을 거다.",
		["obj3_getsecuritydooropen"] = "문을 열어라",
		["obj3_getsecuritydooropen_desc"] = "문을 여는 방법을 찾아라.",
		["obj4_openseconddoor"] = "서버룸에 침입하라",
		["obj4_openseconddoor_desc"] = "서버룸에 침입하라. 키 카드나 드릴이 도움이 될 수 있을거다.",
		["obj5_hack"] = "노트북을 해킹하라",
		["obj5_hack_desc"] = "자칼이 제공한 소프트웨어로 노트북을 해킹하라.",
		["obj5b_explode"] = "C4를 해체하라!",
		["obj5b_explode_desc"] = "C4다! 해체하거나 멀리 떨어져라!",
		["obj6_wait"] = "데이터를 전송하라",
		["obj6_wait_desc"] = "해킹이 끝났다. 자칼에게 데이터를 전송하라.",
		["obj7_escapeorloot"] = "탈출 가능",
		["obj7_escapeorloot_desc"] = "테이크를 만족했다면 그 지역을 떠나라.",

		["heist_int_dock_burn_name"] = "번아웃",
		["heist_int_dock_burn_brief"] = "자세한 계획을 세울 시간이 없어. 그들이 추가 마스터 서버를 이동할 거다.\n운전자가 무장한 광대를 가득 실은 트럭을 현관에 주차시킬 거다.",
		["heist_wetwork_burn_name"] = "번아웃",
		["heist_wetwork_burn_brief"] = "좋아, 거의 다 왔어. 전에 여기 와 봤지만, 이번에는 화끈하게 갈 거다.\n아직 숨겨져 있는 전리품이 있을 수도 있지만 그건 나중에 확보할거다.\n\n닫힌 컨테이너 안에 무엇이 들어있는 보기 위해 사용할 수 있는 모든 것을 찾아봐. 카메라, 컨테이너 주변의 물체, 화이트보드 등 말이지.",
		["wwburn_01"] = "준비하라",
		["wwburn_01_desc"] = "정문에 다가가면, 머키워터가 모든 곳에 있을 테니 총을 꺼내라.",
		["wwburn_02"] = "서버를 찾아라",
		["wwburn_02_desc"] = "마스터 서버가 보관되어있는 세 개의 운반 컨테이너를 찾아라.",
		["wwburn_03"] = "백업을 태워라",
		["wwburn_03_desc"] = "마스터 서버의 백업을 태워라, 백업은 동일한 컨테이너에 있을 것이다.",
		["wwburn_04"] = "탈출 가능",
		["wwburn_04_desc"] = "탈출하거나 탐욕이 느껴진다면 더 많은 전리품을 확보하라.",

		["wwburn_serverpku"] = "확보",
		["wwburn_gaspku"] = "수집",
		["wwburn_defend"] = "방어",
		["wwburn_container"] = "운반 컨테이너",

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

		["gm_gms_purchase"] = "컨티넨탈 코인으로 구매",
		["gm_gms_purchase_window_title"] = "확실하십니까?",
		["gm_gms_purchase_window_message"] = "정말로 '{1}' 구매하시겠습니까?\n\n{3} {2}개가 소모됩니다.",
		["gm_gms_purchase_failed"] = "수량 부족",
		["gm_gms_free_of_charge_message"] = "{1} is free of charge and can be applied to as many weapons as you wish.",
		["gm_gms_cannot_afford_message"] = "{1}를 구입할 {3}이 부족합니다. {1}를 구입할려면  {2}개의 {3}이 필요합니다.",

		["bm_menu_amount_locked"] = "재고 없음",

		["pdth_hud_challenges"] = "챌린지",
		["pdth_hud_challenges_hint"] = "완료 및 활성화 된 챌린지를 봅니다.",
		["pdth_hud_active_challenges"] = "활성화되어 있는 챌린지",
		["pdth_hud_active_challenges_hint"] = "진행률 및 활성화 된 챌린지를 봅니다.",
		["pdth_hud_completed_challenges"] = "완료된 챌린지",
		["pdth_hud_completed_challenges_hint"] = "완료 및 달성된 챌린지를 봅니다.",

		["ch_vs_desc"] = "Using the $weapon, defeat $count $eneType. Using melee does not contribute to this challenge.",
		["ch_vs_head_shots_desc"] = "Using the $weapon, defeat $count $eneType with Headshots.",
		["ch_vs"] = "$weapons VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon VS. $eneType HEADSHOTS $no",

		["ene_law"] = "THE WORLD",
		["ene_law_desc"] = "hostile units",

		["menu_me"] = "HEISTER",

		["RestorationModPDTHChallengesTitleID"] = "Show PDTH Challenges",
		["RestorationModPDTHChallengesDescID"] = "Toggles the visibility of the PDTH challenges in the menu and the hud",

		["RestorationModRaidLockPickingTitleID"] = "Modify Lockpicks",
		["RestorationModRaidLockPickingDescID"] = "Should the mod modify lockpicks? This changes the gameplay revolving lockpicks",
		["RestorationModRaidLockPickingVOTitleID"] = "Play Voice Lines",
		["RestorationModRaidLockPickingVODescID"] = "Should the mod play voice lines when picking a lock?",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT Lockpick",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT Persuade",
		["hud_legend_exit"] = "$BTN_CANCEL Exit",
		["RestorationModArmorFixTitleID"] = "방어구 플래시 수정",
		["RestorationModArmorFixDescID"] = "방어구 플래시 수정을 활성화하거나 비활성화합니다.",

		-- /// Challenges Below ///
	-- Challenges don't have korean fonts
	["ch_deploy_ammobag_hl"] = "Last Bullet!",
	["ch_deploy_ammobag"] = "Deploy $count Ammo Bags.",
	["ch_plant_tripmine_hl"] = "Laser Show",
	["ch_plant_tripmine"] = "Deploy $count Trip Mines.",
	["ch_deploy_medicbag_hl"] = "Insurance Benefits",
	["ch_deploy_medicbag"] = "Deploy $count Medic Bags.",
	["ch_deploy_ecm_hl"] = "System Crasher",
	["ch_deploy_ecm"] = "Deploy $count ECM's.",
	["ch_deploy_fak_hl"] = "Lifeline",
	["ch_deploy_fak"] = "Deploy $count First Aid Kits.",
	["ch_deploy_sentry_hl"] = "White Mesa Enthusiast",
	["ch_deploy_sentry"] = "Deploy $count Sentries.",


	["ch_watchdogs_d1_heavy_wpn1_hl"] = "HEAVY ARMOR, AND HEAVIER WEAPONS",
	["ch_watchdogs_d1_heavy_wpn1"] = "Complete day one of the WATCHDOGS job, wearing an ICTV and using miniguns, the Thanatos sniper, or RPG's only, on the OVERKILL difficulty or above.  You must have played from the start of the heist to complete this challenge.",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "State",
		["menu_state_filter"] = "State Filter",
		["menu_state_filter_help"] = "Shows the lobby state",
		["menu_state_lobby"] = "Lobby",
		["menu_state_loading"] = "Loading",
		["menu_state_ingame"] = "Ingame",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "목 없는 불도저의 검",
		["menu_l_global_value_halloween_sword"] = "이 상품은 할로윈 2013 아이템입니다!",
		
		--S&W .500
		["bm_w_shatters_fury"] = "Phoenix .500 리볼버",
		
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "호루스 총열",
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "셰더 총열",
		["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "하토르 총열",
		["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "불새 총열",
		
		["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "Ergo 손잡이",
		
		["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "부드러운 실린더",

		["menu_l_global_value_shatters_fury"] = "이 상품은 베리타스 아이템입니다!",
		
		--MK-23
		--Semi-automatic pistol. Hold down ■ to aim. Release to fire.
		["bm_w_socom"] = "Anubis .45 권총",
		["bm_w_x_socom"] = "아킴보 Anubis .45 권총",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra 결합 모듈",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "$BTN_GADGET를 눌러 사용합니다.",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "No Mercy",
		["heist_no_mercy_ranted_brief"] = "We are hitting up the Mercy Hospital in a heist for blood. The source is carrying some kind of rare virus and we need to get it out of him. Let nothing stop us as the paycheck is a hefty one. Spilling some blood for this kind of cash is not the end of the world.",

		["heist_nmh_res_name"] = "자비 병원",
		["heist_nmh_res_brief"] = "우리의 의뢰인께서 머시 병원의 격리 병동에 있는 환자의 혈액 샘플이 필요하다고 하더군. 너희들이 가서, 보안장치를 없애고, 시민들을 제압한 뒤에 내가 우리가 찾는 녀석의 신원을 확인할 수 있도록 환자 데이터베이스를 내쪽으로 연결해, 경비가 별로 삼엄하지는 않으니까, 쉽게 끝낼 수 있겠지. 너희들이 옥상으로 혈액 샘플을 가져오면 일은 끝이야. 이번 작업은 뭔가 비밀스럽고, 베일에 감춰진 군사 산업이 연루된 거 같지만, 그 정도의 리스크는 감수해야지. 우리 미래에 월급날은 필요한 것이고, 거기에 짭짤한 현금 보너스까지 붙는다고 생각해.",
		
		["heist_nmh_new"] = "환자의 혈액을 채취하고 분석하라",
		["heist_nmh_new_desc"] = "혈액 샘플의 유효성을 검사하려면 원심분리기를 찾아라",
		
		["heist_nmh_new2"] = "엘리베이터를 불러라",
		["heist_nmh_new2_desc"] = "버튼을 누르고 엘리베이터를 기다려라",
		
		["heist_nmh_new3"] = "엘리베이터를 불러라",
		["heist_nmh_new3_desc"] = "버튼을 누르고 엘리베이터를 기다려라",	
		
		--OICW--
		["bm_w_osipr"] = "SABR 소총",
		["bm_w_osipr_gl"] = "SABR 유탄 발사기",
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "GO Bank Remastered",
		
		["heist_gobank_v2_name"] = "GO Bank Remastered",
		["heist_gobank_v2_brief"] = "This is a classic bank job. Break the vault, empty the deposit boxes and get the loot out. Simple. Bain's intel says this branch has the lowest hit-rate in the country. It's time to change that.\n\n» Search the environment for keycards. Two are needed for the vault\n» Failing that, use a drill on the vault\n» Crack open the deposit boxes\n» Assemble the skyhook\n» Get the money out",
		
		["heist_roberts_v2_name"] = "로버츠 은행",
		["heist_roberts_v2_brief"] = "우리가 이벤에 노릴곳은 은행이야. 큰 지점은 아니지만, 이 은행의 금고안에 임시적으로 수송할 현글을 보관하고 있다는 정보를 얻었어. 대부분 외화라고 하더라고.\n\n어쨌든, 일은 어떻게 진행되는지 알고 있지? - 너희가 하고 싶은대로 하면돼. 조용히 처리하던가, 아니면 지옥을 펼치던가. 어느쪽을 선택하든, 돈을 빼돌릴 방법은 내가 마련해 놨어. 아마 상당히 마음에 들꺼야.",

		["csgo_plane_timer_text"] = "Wait for the plane &&TIMER",
		["csgo_plane_timer_desc"] = "Wait for the plane &&TIMER",
		
		["hud_equipment_pickup_spraycan"] = "Press $BTN_INTERACT to pickup Spraycan",
		["hud_action_spraypaint"] = "Press $BTN_INTERACT to Spraypaint",
		["hud_action_spraypaint_none"] = "Spraycan Required",
		["spraycan_obtained"] = "Spraycan Obtained",
		["hud_equipment_obtained_spraycan"] = "Spraycan Obtained",
		
		["trophy_csgo01"] = "Graffiti Box",
		["trophy_csgo01_desc"] = "And you didnt even have to buy this one",
		["trophy_csgo01_objective"] = "Find spraypaint and spray graffiti in the vault on GO Bank Remastered.",

		["END"] = "END",	
		
		--Whurr Heat Street Edit
		["heist_heat_street_new_name"] = "Heat Street True Classic",
		["heist_heat_street_new_brief"] = "Someone once said there is no such thing as a sure thing, but this job looks easy: get in, get the briefcase, get out. Your trusted wheelman Matt will be waiting for you in the alley and as long as you get to the van there is no way you can fail. Is there?",
		["heist_street_new_name"] = "Heat Street: The Heist",
		["heist_street_new_brief"] = "Someone once said there is no such thing as a sure thing, but this job looks easy: get in, get the briefcase, get out. Your trusted wheelman Matt will be waiting for you in the alley and as long as you get to the van there is no way you can fail. Is there?",

		--Heat Street, Holdout edition
		["heist_skm_heat_street_name"] = "Uptown - Inkwell Industrial",
		["heist_skm_heat_street_brief"] = "The kerels recently interrogated a prisoner that claims to have seen the face of Bain and can identify him. While we know it isn't true, the kerels don't, and neither do our rivals, so we're going to use the situation to gain some cash. Intercept the chop while they're transferring him to witness protection, near the old factory storage yard where that dumkop Matt crashed his car while trying to get away from us.",
		["heist_skm_street_name"] = "홀드아웃: 업타운 - 잉크웰 산업장",
		["heist_skm_street_brief"] = "The kerels recently interrogated a prisoner that claims to have seen the face of Bain and can identify him. While we know it isn't true, the kerels don't, and neither do our rivals, so we're going to use the situation to gain some cash. Intercept the chop while they're transferring him to witness protection, near the old factory storage yard where that dumkop Matt crashed his car while trying to get away from us.",	

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "혹스턴 브레이크아웃 크리스마스 버전",
		["heist_xmn_hox1"] = "탈옥 크리스마스 버전",
		["heist_xmn_hox_1_brief"] = "치과의사가 혹스턴이 재심을 받을 수 있도록 손을 썼어. 어, 너 말고 혹스턴. 내 말은 예전... 일단, 이름 문제는 나중에 생각하자고. 재판은 금방 끝날 거야. 그의 전과를 생각해보면, 더 이상 세상 밖을 걸을 수 없게 될지도 모르지만 그건 중요한 게 아니지. 중요한 건 그 녀석이 이동하고 있다는 점이야. 그리고 우리는 이동할 때 녀석을 빼돌릴 수 있지. 우리는 공판이 끝나고 그를 탈옥시킬 거야. 미국 법정 제도를 물 먹이는 거지.$NL;$NL;이 계획은 아주 화끈하게 진행될 거야. 법원의 벽을 날려 버리고, 혹스턴을 데리고 탈출하는 거지$NL;$NL;주변 블록 여럿이 통제될 거야. 경찰들도 바짝 긴장하고 있겠지. 총 준비하고, 탄약도 빵빵하게 챙기라고.",
		["heist_xmn_hox2"] = "조사 크리스마스 버전",
		["heist_xmn_hox_2_brief"] = "이런, 친구들, 날 빼내준 건 고마워. 그런데 애초에 난 빵에 들어가지 않았어야 했어. 분명 누군가가 나를 팔아넘긴 거야. 확실하다고. FBI 녀석들이 나에 대해 너무나도 자세히 알고 있었단 말이야. 그 병신 새끼들이 절대로 찾아낼 수 없던 내용까지도 말이야. 누군가 고발한 거야. 누군가가 나를 엿 먹였다고. 내가 반드시 찾아내고 말 거야.$NL;$NL;자, 이 일이 쉽지는 않겠지. 사태를 파악하거나 그런 거 없고. 은밀한 거리나 작업 같은 쓸모없는 일 같은 건 안 할 거야. 우리는 바로 내 정보의 출처로 향한다. FBI 본진으로 말이야. 누가 날르 엿 먹였는지 찾아내고 말겠어.",
		["heist_xmn_hox_brief"] = "치과의사가 혹스턴이 재심을 받도록 손을 썻습니다. 우리는 재판이 끝난 직후 그를 빼내올 것입니다. 계획은 라우드로 진행될 것입니다: 벽을 날려 버리고, 혹스턴을 데리고 탈출하십시오.$NL;$NL;» 혹스턴 풀어주기$NL;» 혹스턴을 방탄 자량으로 데리고 가기$NL;» 혹스턴이 탄 방탄 차량을 엄호하기$NL;» 혹스턴과 함께 탈출하기",
		
		["heist_xmn_tag_name"] = "FBI 침입 크리스마스 버전"
	})

	local job = Global.level_data and Global.level_data.level_id
	for _,j4 in ipairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == j4 then
			log("Spooky!")
			LocalizationManager:add_localized_strings({	
				["hud_assault_vip"] = "악몽을 마주하고 잠에서 깨어나라",
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
		["menu_inspect_player"] = "Inspect Player",
		["menu_inspect_player_desc"] = "Inspect player's stats",
		["menu_toggle_one_down_lobbies"] = "프로 잡 로비 허용",
		
		["heist_safehouse"] = "세이프 하우스 - 기초",
		
		--Events
		
		--Anniversary Event
		["menu_pda8_1_prog_obj_desc"] = "주얼리 스토어, 포 스토어, 나이트클럽, 뱅크 하이스트, 몰크래셔 작업에서 2개의 서로 다른 기념 조각상을 찾아야 합니다. 하이스트를 완수해야만 카운터됩니다.",
		["menu_pda8_2_prog_obj_desc"] = "플레이어 공동체로서 모든 하이스터가 5,000,000명의 경찰을 현금 발사기로 퇴역시키고, 개별적으로는 주얼리 스토어, 포 스토어, 나이트클럽, 뱅크 하이스트, 몰크래셔 작업에서 3개의 다른 기념 조각상을 찾아야 합니다, 하이스트를 완수해야만 카운트됩니다.",
		["menu_pda8_3_prog_obj_desc"] = "플레이어 공동체로서 모든 하이스터가 10,000,000명의 경찰을 현금 발사기로 퇴역시키고, 개별적으로는 주얼리 스토어, 포 스토어, 나이트클럽, 뱅크 하이스트, 몰크래셔 작업에서 4개의 다른 기념 조각상을 찾아야 합니다, 하이스트를 완수해야만 카운트됩니다.",
		["menu_pda8_item_1_desc"] = "플레이어 공동체로서 모든 하이스터가 15,000,000명의 경찰을 현금 발사기로 퇴역시키고, 개별적으로는 주얼리 스토어, 포 스토어, 나이트클럽, 뱅크 하이스트, 몰크래셔 작업에서 5개의 다른 기념 조각상을 찾아야 합니다, 하이스트를 완수해야만 카운트됩니다.",

		["menu_pda8_2_prog_obj"] = "3개의 기념 조각상 찾기.",
		["menu_pda8_3_prog_obj"] = "4개의 기념 조각상 찾기.",
			
		--Holdout--
		["menu_cn_skirmish"] = "홀드아웃",
		["menu_skirmish"] = "홀드아웃 - 적대적 교전",
		["menu_skirmish_random"] = "Random Locale",
		["menu_random_skirmish_subtitle"] = "Random combat location.\n\nNo weekly rewards, no starting modifiers.",
		["menu_weekly_skirmish"] = "Target Locale",
		["menu_weekly_skirmish_progress"] = "Waves Completed, Reward Upon Total Completion",
		["menu_skirmish_random_briefing"] = "In this scenario, you're placed into a random HOLDOUT.\n\nA random HOLDOUT consists of 9 waves. Each consecutive wave increases in difficulty.\n\nYou gain a large cash & experience reward with each wave completed, but failure will negate all rewards accrued.\n\nYou will fail if anyone in your crew -- including yourself -- is taken into custody, or if the target hostage is rescued by hostiles.",
		["menu_weekly_skirmish_desc"] = "In this scenario, you're placed into a pre-configured HOLDOUT.\n\nThe weekly HOLDOUT consists of 9 waves, with starting modifiers. Each consecutive wave increases in difficulty.\n\nFinishing all waves will grant you additional weekly rewards, in addition to your cash payout.\n\n##You will fail if anyone in your crew -- including yourself -- are taken into custody, or if the target hostage is rescued by hostiles.##",
		["menu_weekly_skirmish_tab_description"] = "작전명 런다운",
		["menu_weekly_skirmish_rewards"] = "Total Waves Completed & Associated Rewards",
		["hud_skirmish"] = "홀드아웃",
		["hud_weekly_skirmish"] = "Weekly Holdout",
		["heist_contact_skirmish"] = "홀드아웃",
		["menu_skirmish_pick_heist"] = "Jackal Company Entrusts You With This Task",
		["menu_skirmish_map_selection"] = "타켓 위치",
		["menu_skirmish_selected_briefing"] = "이 시나리오에서 당신과 당신의 팀원들은 홀드아웃을 선택할 수 있습니다.\n\n홀드아웃은 9개의 웨이브로 구성됩니다. 연속되는 각 웨이브는 난이도가 높아집니다.\n\n각 웨이브가 완료될 때마다 많은 현금, 경험치 및 전리품 보상을 받습니다.\n\n목표 인질이 적에게 구출되면 실패됩니다.",
		["menu_skirmish_selected"] = "홀드아웃",

		--Holdout Heists--
		["heist_skm_mallcrasher"] = "실드 쇼핑몰",
		["heist_skm_mallcrasher_h1"] = "실드 쇼핑몰",
		["heist_skm_arena"] = "모나크 스타디움",
		["heist_skm_arena_h1"] = "모나크 스타디움",
		["heist_skm_big2"] = "베네볼렌트 은행",
		["heist_skm_big2_h1"] = "베네볼렌트 은행",
		["heist_skm_watchdogs_stage2"] = "알멘디아 물류 조선소",
		["heist_skm_watchdogs_stage2_h1"] = "알멘디아 물류 조선소",
		["heist_skm_mus"] = "앤더슨 박물관",
		["heist_skm_mus_h1"] = "앤더슨 박물관",
		["heist_skm_run"] = "업타운 - 잉크웰 산업장",
		["heist_skm_run_h1"] = "업타운 - 잉크웰 산업장",


		--Heist Breifings--
		["heist_pines_briefing"] = "너희들은 빨리 장소에 도착해야해, 하지만 장소가 숲속이다 보니까 낙하산으로 가야할꺼야. 조송사를 찾아봐 - 아마 사고지점 근처에 있을거야 - 그리고 탈출시킬 헬리콥터를 호출해. 그리고, 블라드가 말하길 그 비행기에 많은 상품이 있었다고 하더군, 숲을 수색해서 가지고 올 수 있는만큼 가지고와, 크리스마스에서 돈을 버는게 나쁘지는 않잖아?\n\n자칼의 충고:\n그 충돌로 인한 폭발은 인근 리퍼 팀을 건들었나봐. 경찰의 대응을 기대하지말라고.",

		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "확장 Muldon 개머리판",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Bernetti 93t 킷",
		["bm_wp_upg_i_93r_desc"] = "추가 반동을 대가로 3발 버스트 발사 모드를 활성화합니다.", --still need to do the one for the primary bernetti--

		--AMR16--
		["bm_wp_upg_i_m16a2"] = "AMR-16 B3 킷",
		["bm_wp_upg_i_m16a2_desc"] = "무기를 반/버스트 사격 모드로 고정하지만 발사 속도를 200만큼 증가시킵니다.",
		
		--Bernetti Auto--
		["bm_wp_upg_i_b93o"] = "Bernetti 오버킬 킷",
		["bm_wp_upg_i_b93o_desc"] = "추가 반동을 대가로 3발 버스트 발사 모드를 자동 발사 모드로 대체합니다.",		
		
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "펠릿이 뭉치지 않고 수평으로 퍼지도록 합니다.",
		["bm_wp_upg_a_slug_sc"] = "철갑 슬러그탄",
		["bm_wp_upg_a_slug_sc_desc"] = "정확한 한 발의 샷건 슬러그탄을 발사합니다. 관통하지 않습니다.", --Auto/Semi-Auto shotguns--
		["bm_wp_upg_a_slug_heavy_desc_sc"] = "방탄복, 적, 실드, 타이탄 실드 및 벽을 관통하는 단일 정확한 납탄 슬러그를 발사합니다.", --For shotguns that can hit Heavy Sniper damage tier--
		["bm_wp_upg_a_explosive_desc_sc"] = "고폭 슬러그. 대상을 죽이거나 기절시키는 폭발탄 하나를 발사합니다. 헤드샷을 할 수 없습니다.",
		["bm_wp_upg_a_custom_desc"] = "약간의 견실성과 탄약을 희생시키면서 피해를 증가시키는 더 적은 수의 더 큰 펠릿를 발사합니다.",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "방탄복을 관통하여 불태우는 탄환을 발사합니다. 일정 확률로 근거리에서 적을 불태워 96의 피해를 입히고 3초에 걸쳐 기절시킬 수 있습니다.",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "방탄복을 관통하여 불태우는 탄환을 발사합니다. 일정 확률로 근거리에서 적을 불태워 120의 피해를 입히고 3초에 걸쳐 기절시킬 수 있습니다.",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "방탄복을 관통하여 불태우는 탄환을 발사합니다. 일정 확률로 근거리에서 적을 불태워 180의 피해를 입히고 3초에 걸쳐 기절시킬 수 있습니다.",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "방탄복을 관통하여 불태우는 탄환을 발사합니다. 일정 확률로 근거리에서 적을 불태워 240의 피해를 입히고 3초에 걸쳐 기절시킬 수 있습니다.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "3초에 걸쳐 96의 출혈 피해를 입히는 철갑 플레셰트를 발사합니다.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "3초에 걸쳐 120의 출혈 피해를 입히는 철갑 플레셰트를 발사합니다.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "3초에 걸쳐 180의 출혈 피해를 입히는 철갑 플레셰트를 발사합니다.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "3초에 걸쳐 240의 출혈 피해를 입히는 철갑 플레셰트를 발사합니다.",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "AFG 그립",
		["bm_wp_upg_vg_stubby"] = "Stubby 수직 그립",
		["bm_wp_upg_vg_tac"] = "TAC 수직 그립",

		["bm_wp_upg_vintage_sc"] = "빈티지 탄창",
		["bm_wp_upg_mil_sc"] = "밀스펙 탄창",
		["bm_wp_upg_tac_sc"] = "전술 탄창",

		["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_wp_upg_vintage_desc"] = "",

		--Scorpion (get in-game-name later)--
		["bm_wp_scorpion_m_extended_sc"] = "Double Magazine",
		["bm_sc_scorpion_double_mag"] = "", --Unsure what this one is?--

		--RPK--
		["bm_wp_rpk_m_ban_sc"] = "Potassium 탄창",

		--Buzzsaw--
		["bm_wp_mg42_b_mg34_desc_sc"] = "발사 속도가 800으로 감소합니다.",

		--Saw--
		["bm_ap_saw_sc_desc"] = "방탄복을 관통할 수 있습니다.",
		["bm_ap_saw_blade_sc_desc"] = "방탄복을 뚫을 수 있을 정도로 칼날을 날카롭게 합니다.",
		["bm_fast_motor_sc_desc"] = "분당 회전 수가 15% 증가합니다.",
		["bm_slow_motor_sc_desc"] = "분당 회전 수가 15% 감소합니다.",

		--Weapon Sights--
		["bm_wp_upg_o_leupold_desc_sc"] = "조준하는 동안 자동으로 특수 적과 스텔스 상태에서 경비원을 마킹합니다.", --I believe all sights/objects with this effect call this same line, rather than having a unique one. Will need to be decoupled later when we add zoom to all of the sight descriptions.

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_tiny"] = "1.1x 배율.",
		["bm_wp_upg_o_small"] = "1.2x 배율.",
		["bm_wp_upg_o_cs_desc"] = "1.5x 배율.",
		["bm_wp_upg_o_aim"] = "2x 배율.",
		["bm_wp_upg_o_med"] = "3x 배율.",
		["bm_wp_upg_o_large"] = "4x 배율.",
		["bm_wp_upg_o_huge"] = "5x 배율.",
		--;)
		["bm_wp_upg_o_overkill"] = "6x 배율.",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "충돌 지점에 불을 일으키는 탄을 발사합니다. 불은 시간이 지남에 따라 피해를 입히고 적을 태우게 합니다.",
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "충돌 지점에서 폭발을 일으키는 탄을 발사합니다. 폭발은 800의 피해를 주고 범위는 5미터입니다.",
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "충돌 지점에 전기 폭발을 일으키는 탄을 발사합니다. 폭발은 400의 피해를 주고 범위는 5미터이며 적에게 전기 충격을 줍니다.",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "충돌 지점에 전기 폭발을 일으키는 탄을 발사합니다. 폭발은 300의 피해를 주고 범위는 2.5미터이며 적에게 전기 충격을 줍니다.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "레어",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "점화된 적의 화상 지속 시간이 두 배로 증가하지만 시간이 지남에 따라 피해는 절반으로 줄어듭니다.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "점화된 적의 화상 지속 시간을 절반으로 줄어지지만 시간이 지남에 따라 피해를 두 배로 늘립니다.",
		["bm_ap_flamethrower_sc_desc"] = "수천도의 완전한 고통. 어쩌다 이 지경이 됐을까요?\n방탄복을 관통하여 불태웁니다.", --used by both flamethrowers, decouple later?--
		["bm_ap_money_sc_desc"] = "수천 달러의 순수한 행복. 밸브를 돌리고 현금을 빼내십시오.\n방탄복을 관통하여 뇌물을 줍니다.", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "날 크게 늘려줘!", -- lol
		["bm_wp_m134_body_upper_light"] = "경량 몸체",
		["bm_wp_upg_a_halfthatkit_desc"] = "무기 들고 있을 때 이동 속도 10% 패널티를 추가합니다.\n\n무기의 탄약 획득량이 20% 증가합니다.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "무기 들고 있을 때 이동 속도 25% 패널티를 추가합니다.\n\n무기의 탄약 획득량이 50% 증가합니다.",

		--Thanatos--
		["bm_thanatos_sc_desc"] = "경량 차량를 상대할때 사용되는 대물 소총. 이것을 유기적 목표물에 사용하는 것은 아마도 전범일 것입니다.\n\n방탄복, 실드, 타이탄 실드 및 얇은 벽을 관통할 수 있습니다.",

		--Galant--
		["bm_galant_sc_desc"] = "고전적인 WW2 전투 소총. 안정적이고 정확하며 빠르게 재장전합니다.\n\n탄창이 빈 상태로 재장전하면 재장전 속도가 빨라집니다.",

		--Kobus 90--
		["bm_wp_p90_body_p90_tan"] = "탠 바디",
		["bm_ap_weapon_mod_sc_desc"] = "방탄 관통력, 방패 관통력 및 벽 관통력을 추가합니다.",
		["bm_wp_90_body_boxy"] = "옴니아 어썰트 프레임",
		["bm_wp_90_body_boxy_desc"] = "오래된 옴니아 창고의 황폐한 유적에서 복구된 이 프레임은 무기의 취급이나 기능에 아무런 차이가 없지만 블록과 같은 미학은 확실히 좋은 물건입니다.",

		--Phoenix .500--
		["bm_wp_shatters_fury_desc"] = "미친 반동과 저지력을 갖춘 거대한 .500 구경 리볼버. 샤터가 선택한 무기입니다.\n방탄복, 실드 및 얇은 벽을 관통할 수 있습니다.",

		--OICW--
		["bm_w_osipr_desc_pc"] = "X세대 무기 기술. 20mm 공중 폭발 유탄 발사기가 장착되어있습니다.\n$BTN_BIPOD키를 늘러 유탄 발사기로 전환합니다.",
		["bm_w_osipr_desc"] = "X세대 무기 기술. 20mm 공중 폭발 유탄 발사기가 장착되어있습니다.\n$BTN_BIPOD키를 꾹 눌러 유탄 발사기로 전환합니다.",

		--socom deez nuts--
		["bm_w_socom_desc"] = "자칼이 선택한 보조무기. 세련된 디자인과 안정적이고 강력한 .45ACP 권총입니다.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "전쟁과 범죄에서 피에 대한 끝없는 갈증을 보여준 특별한 AK입니다.",
		["bm_wskn_deagle_bling_desc_sc"] = "직접 만들어진 이 Deagle은 세계 최고의 게임 훈련을 받은 명사수의 증거로 제작되었습니다.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "수정치 없음",
		["bm_wp_upg_bonus_sc_none_desc"] = "무기 스킨의 부스트를 비활성화합니다.",

		--Little Friend--
		["bm_m203_weapon_sc_desc_pc"] = "$BTN_BIPOD키를 눌러 장착된 유탄 발사기로 전환합니다.",
		["bm_m203_weapon_sc_desc"] = "$BTN_BIPOD키를 길게 눌러 장착된 유탄 발사기로 전환합니다.",

		--Mosin--
		["bm_mosin_sc_desc"] = "고전적이고 강력한 볼트액션 소총. 이 무기는 한 번에 5발의 탄환으로 재장전됩니다.\n\n방탄복, 실드 및 얇은 벽을 관통할 수 있습니다.",

		--Broomstick--
		["bm_c96_sc_desc"] = "독일의 혁명적인 기관권총. 완전 자동으로 미친 속도로 발사할 수 있지만 탄약 소모가 큽니다.\n이 무기는 한 번에 10발의 탄환으로 재장전됩니다.",

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_ap_weapon_sc_desc"] = "방탄복, 실드 및 얇은 벽을 관통할 수 있습니다.",
		["bm_heavy_ap_weapon_sc_desc"] = "방탄복, 실드, 타이탄 실드 및 얇은 벽을 관통할 수 있습니다.",
		["bm_ap_2_weapon_sc_desc"] = "방탄복을 관통할 수 있습니다. 화살은 집어들면 회수할 수 있으며, 화살을 더 오래 당길 수록 사거리가 증가합니다.",
		["bm_ap_3_weapon_sc_desc"] = "방탄복을 관통할 수 있습니다. 화살은 집어들면 회수할 수 있습니다.",
		["bm_40mm_weapon_sc_desc"] = "$BTN_GADGET키 를 눌러 플립 업 시점을 전환합니다.",
		["bm_rocket_launcher_sc_desc"] = "이 무기를 들고 있는 동안 이동 속도가 15% 감소합니다. 이 무기로 발사하는 로켓은 즉시 포탑을 파괴합니다.",
		["bm_quake_shotgun_sc_desc"] = "두 배럴을 동시에 발사하여 펠렛 수를 두 배로 늘립니다.",
		["bm_hx25_buck_sc_desc"] = "12개의 펠렛을 광범위하게 발사합니다.\n\n여전히 스킬로 의해 유탄 발사기로 취급됩니다.",
		["bm_auto_generated_sc_desc"] = "이 무기는 자동 생성된 능력치를 사용하고 있으며 제작자의 의도에 맞지 않거나 완벽하게 균형이 맞지 않을 수 있습니다.",
		["bm_auto_generated_ap_sc_desc"] = "이 무기는 자동 생성된 능력치를 사용하고 있으며 제작자의 의도에 맞지 않거나 완벽하게 균형이 맞지 않을 수 있습니다.\n\n방탄복, 실드 및 얇은 벽을 관통할 수 있습니다.",
		["bm_auto_generated_sap_sc_desc"] = "이 무기는 자동 생성된 능력치를 사용하고 있으며 제작자의 의도에 맞지 않거나 완벽하게 균형이 맞지 않을 수 있습니다.\n\n방탄복, 실드, 타이탄 실드 및 얇은 벽을 관통할 수 있습니다.",
		["bm_auto_generated_lmg_sc_desc"] = "이 무기는 자동 생성된 능력치를 사용하고 있으며 제작자의 의도에 맞지 않거나 완벽하게 균형이 맞지 않을 수 있습니다.\n\n이 무기를 들고 있는 동안 이동 속도가 25%## 감소합니다.",
		["bm_auto_generated_mod_sc_desc"] = "이 부착물의 능력치는 자동 커스텀 부착물 능력치 생성이 완료될 때까지 제거되었습니다.",

		--Overhaul Content Indicators--
		["loot_sc"] = "레스트레이션 오버홀",
		["loot_sc_desc"] = "이 상품은 레스트레이션 오버홀의 아이템입니다!",

		["menu_l_global_value_omnia"] = "OMNIA",
		["menu_l_global_value_omnia_desc"] = "THIS IS AN OMNIA ITEM!",

		["menu_rifle"] = "RIFLES",
		["menu_jowi"] = "윅",
		["menu_moving_target_sc"] = "Subtle",

		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",

		["bm_hint_titan_60"] = "The Titandozer leaves in 60 seconds!",
		["bm_hint_titan_10"] = "The Titandozer leaves in 10 seconds!",
		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",

		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",
		["bm_menu_gadget_plural"] = "Gadgets",
		["menu_pistol_carbine"] = "Pistol Carbine",
		["menu_battle_rifle"] = "Battle Rifle",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
		["bm_melee_katana_info"] = "지로로 플레이하는 동안 충전 공격으로 클로커를 죽이면 특수 킬 애니메이션이 발동됩니다.",
		["bm_melee_buck_info"] = "현대 무기에도 통한다는게 놀라울 정도로 효과적입니다.\n\n충전하는 동안 받는 원거리 피해가 10% 감소합니다.", --Buckler Shield
		["bm_melee_cs_info"] = "찢고 죽여라, 모두 끝날때 까지.\n\n충전하는 동안 전방의 대상에게 0.25초마다 30의 피해를 줍니다. 이것은 스킬로 늘릴 수 있습니다. 적의 근접 공격을 반격할 수 없습니다.", -- ROAMING FR-
		["bm_melee_ostry_info"] = "스피이이인~\n\n충전하는 동안 전방의 대상에게 0.25초마다 18의 피해를 줍니다. 이것은 스킬로 늘릴 수 있습니다. 적의 근접 공격을 반격할 수 없습니다.", --Kazaguruma
		["bm_melee_wing_info"] = "변장 도구와 잘 어울립니다!\n\n뒤에서 적을 공격하면 4배의 피해를 줍니다.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "폭력을 위해 설계되었으며 리볼버처럼 치명적입니다. 이것이 바로 스위치블레이드입니다!\n\n뒤에서 적을 공격할 때 두 배의 피해를 줍니다.",-- Switchblade Knife
		["bm_melee_chef_info"] = "이것이 슈퍼마켓에서 고기를 자르는 데 사용되었는지 확실하지 않습니다.\n\n완전히 충전된 상태로 공격하면 패닉을 퍼뜨립니다.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "악몽에서 위조한 검.\n\n완전히 충전된 상태로 공격하면 패닉을 퍼뜨립니다..", -- Headless Dozer Sword
		["bm_melee_nin_info"] = "유효사거리가 짧고 아주 빠른 못을 발사합니다. 여전히 근접 킬로 간주됩니다.", -- Pounder
		["bm_melee_iceaxe_info"] = "헤드샷 피해를 50% 많이 줍니다.", -- Icepick
		["bm_melee_mining_pick_info"] = "헤드샷 피해를 50% 많이 줍니다.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "난 벨을 울린걸 들은 적 없는데.\n\nOVERKILL 권투 글러브로 적을 처치하면 즉시 스테미나가 채워집니다.", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "경찰이 필요로 하는 깨끗한 면도를 제공하십시오.\n\n3초 동안 120의 출혈 피해를 입힙니다.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "여생에서 불쌍한 놈을 기다리지 않아... 그리고 난 그냥... 망할 야구 방망이와 이야기하고 있잖아!\n\n3초 동안 120의 출혈 피해를 입힙니다.", --Lucille Baseball Bat
		["bm_melee_spoon_gold_info"] = "먹어버려, 먹어버려, 먹어버려, 먹어버려! \n\n50% 확률로 120의 화염 피해를 입히고 3초에 걸쳐 적을 방해합니다.", --Gold Spoon
		["bm_melee_cqc_info"] = "120의 추가 피해를 입히고 일정 확률로 3초에 걸쳐 중단시키는 이국적인 독이 들어 있습니다.", --Kunai, Syringe
		["bm_melee_fight_info"] = "물 처럼 되어라, 친구여.\n\n적의 근접 공격을 반격하면 120의 근접 피해를 입힙니다. 이것은 스킬로 늘릴 수 있습니다.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "잭팟 나와줘!\n\n5% 확률로 10배의 데미지와 넉다운을 줍니다.",
		["bm_melee_specialist_info"] = "두 배의 칼날, 두 배의 재미.\n\n근접 공격은 뽑힌 동안 첫 번째 공격 이후 매 공격마다 두 배의 피해를 줍니다.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "그는 치고 자르고 베고 있습니다.\n\n몸과 팔다리에 대한 전반적인 효과가 증가하는 대신 헤드샷 피해가 50% 감소합니다.",

		--We assets now--
		["menu_asset_dinner_safe"] = "금고",
		["menu_asset_bomb_inside_info"] = "내부자 정보",
		["menu_asset_mad_cyborg_test_subject"] = "시험 표본",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "투피스 정장",
		["bm_suit_two_piece_desc_sc"] = "강도에 대한 세련된 접근 방식. 소리를 지를 때 날카롭게 보이는 것이 결코 아프지 않죠, '땅에 엎드려!'\n\n이 옵션을 선택하면 습격의 복장과 상관없이 기본 복장을 착용하게 됩니다.",

		["bm_suit_loud_suit"] = "전투 하네스",
		["bm_suit_loud_suit_desc"] = "더위가 싫을 때 입기 좋은 옷입니다. 가볍고 이동이 쉬우며 유틸리티용으로 제작되었습니다. 부수고 줍기 하기 위한 좋은 선택, 또는 강력하게 요새화된 용병 시설을 공격할 때 좋은 선택입니다.",

		["bm_suit_jackal_track"] = "Special Merchandise",
		["bm_suit_jackal_track_desc"] = "A special-made tracksuit, with both the Jackal logo, and a variation on the VERITAS logo.\n\nThe crew received them in unmarked boxes, but Jackal confirms he never sent them, or has seen them before.\nIt's unknown where they came from.\n\n\n\n...Inside the packages, was one note:\n\n''##A TOKEN OF APPRECIATION, FOR THOSE WITH DEDICATION.\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "써니사이드 로버",
		["bm_suit_sunny_desc"] = "때로는 소매를 걷어붙이고 약간의 강도를 하고 싶을 때가 있습니다.",

		["bm_suit_pool"] = "보디의 수영장 수리복",
		["bm_suit_pool_desc"] = "수영장 수리공을 위한 날카로운 실...",

		["bm_suit_prison"] = "교도소 복장",
		["bm_suit_prison_desc"] = "당신은 구금되었습니다!",

		["bm_suit_var_jumpsuit_flecktarn"] = "Flecktarn Camo",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "A classic camo used by two European countries, proven battle-effective by its ability to blend into forested environments easily. It sure as hell doesn't work in urban areas, but in rural ones it does wonders to trick people's eyes.",

		["bm_suit_var_jumpsuit_flatgreen"] = "Gooey Green",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "This suit was rumored to have belonged to one member of a trio of psychotic criminals, having been recovered near a destroyed garbage truck that was presumed to have been involved in a bloody heist on a GenSec armored car, which left numerous SWAT members dead and quite a few wounded. The identity of these criminals are still shrouded in mystery, as most evidence was destroyed with the Garbage Truck, only leaving this jumpsuit.",

		--New menu stats--
		["bm_menu_deflection"] = "굴절",
		["bm_menu_regen_time"] = "재생 지연",
		["bm_menu_swap_speed"] = "스왑 시간",
		["bm_menu_standing_range"] = "사거리",
		["bm_menu_moving_range"] = "사거리 (움직일때)",
		["bm_menu_pickup"] = "탄약 획득량",

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_armor_grinding_1"] = "틱당 방탄복 재생량: $passive_armor_regen",
		["bm_menu_armor_grinding_2"] = "틱당 방탄복 재생량: $passive_armor_regen \n공격 적중시 방탄복 재생량: $active_armor_regen",

		["bm_menu_armor_max_health_store_1"] = "최대 체력 저장량: $health_stored",
		["bm_menu_armor_max_health_store_2"] = "최대 체력 저장량: $health_stored \n처치 시 방탄복의 재생량: $regen_bonus%",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "수정치",
		["steam_inventory_stat_boost"] = "스탯 수정치",

		--Safe House--
		["dialog_safehouse_text"] = "당신은 아직 세이프하우스를 방문하지 않았습니다.\n\n새로운 것을 찾을 수 있으므로 가셔야 합니다.\n\n지금 거기로 가겠습니까?",

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
		["bm_wp_corgi_b_short"] = "MSG 총열",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "유효한 표면에서 $BTN_BIPOD키를 눌러 거치/비거치 합니다.\n\n거치 시 반동을 크게 줄입니다.",
		["bm_sc_bipod_desc"] = "유효한 표면에서 $BTN_BIPOD키를 길게 눌러 거치/비거치 합니다.\n\n거치 시 반동을 크게 줄입니다.",

		--String override for the stungun--
		["bm_melee_taser_info"] = "완전 충전되면 접촉하는 대상을 감전시키고 방해하는 장치입니다.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

		["bm_wp_pis_usp_b_match"] = "Freeman 슬라이드",
		["bm_wp_1911_m_big"] = "Casket 탄창",
		["bm_wp_usp_m_big"] = "Casket 탄창",
		["bm_wp_upg_ass_ak_b_zastava"] = "연장 총열",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf 총열",
		["bm_wp_p90_b_ninja"] = "Ninja 총열",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_lemming"] = "5/7 권총",

		["bm_w_x_judge"] = "저지 & 쥬리", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
		["bm_w_x_shrew"] = "배리 & 폴",
		["bm_w_x_1911"] = "머스탱 & 샐리",
		["bm_w_tec9"] = "T3K Urban 기관단총",
		["bm_w_x_tec9"] = "아킴보 T3K Urban 기관단총",

		["bm_wp_mp5_fg_mp5sd"] = "SPOOC 포어그립",
		["bm_wp_hs2000_sl_long"] = "Elite 슬라이드",
		["bm_wp_vhs_b_sniper"] = "Hyper 총열",
		["bm_w_r0991"] = "AR-15 바민트 권총",
		["bm_wp_vhs_b_silenced"] = "Bad Dragan 총열",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "붉은 몸체",
		["bm_wp_g3_b_sniper"] = "Macro 총열",
		["bm_wp_g3_b_short"] = "Micro 총열",
		["bm_wp_g3_m_psg"] = "Präzision 탄창",
		["bm_wp_shak12_body_vks"] = "강화 프레임",

		["bm_w_beck_desc"] = "범죄 지하 세계에서 가장 인기 있는 산탄총이 산탄총 계층 구조에서 정당한 위치를 되찾기 위해 무덤에서 돌아왔습니다. 원래 2011 크라임 웨이브에서 사용된 이 산탄총은 거의 모든 근거리 상황에서 매우 안정적인 것으로 입증되었습니다.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "작은 은닉성 보너스 및 명중률/안정성 패널티",
		["bm_menu_bonus_concealment_p1_mod"] = "작은 은닉성 수정치",
		["bm_menu_bonus_concealment_p2"] = "큰 은닉성 보너스 및 명중률/안정성 패널티",
		["bm_menu_bonus_concealment_p2_mod"] = "큰 은닉성 수정치",
		["bm_menu_bonus_concealment_p3"] = "대규모 은닉성 보너스 및 명중률/안정성 패널티",
		["bm_menu_bonus_concealment_p3_mod"] = "대규모 은닉성 수정치",
		["bm_menu_bonus_spread_p1"] = "작은 명중률 보너스 및 안정성 패널티",
		["bm_menu_bonus_spread_p1_mod"] = "작은 명중률 수정치",
		["bm_menu_bonus_spread_n1"] = "대규모 안정성 보너스 및 명중률 패널티",
		["bm_menu_bonus_recoil_p3_mod"] = "대규모 안정성 수정치",
		["bm_menu_bonus_recoil_p1"] = "작은 안정성 보너스 및 명중률 패널티",
		["bm_menu_bonus_recoil_p1_mod"] = "작은 안정성 수정치",
		["bm_menu_bonus_recoil_p2"] = "큰 안정성 보너스 및 명중률 패널티",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "당신과 당신의 팀원을 위한 +5% 경험치 보상을 받는 대신 -10% 돈 보상를 받습니다.",
		["bm_menu_spread"] = "명중률\n",
		["bm_menu_recoil"] = "안정성\n",
		["bm_menu_concealment"] = "은닉성\n",
		["bm_menu_bonus_spread_p2_mod"] = "큰 정확도 수정치",
		["bm_menu_bonus_spread_p3_mod"] = "대규모 정확도 수정치",
		["bm_menu_bonus_recoil_p2_mod"] = "큰 안정성 수정치",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "돈 부스트",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "당신과 당신의 팀원을 위한 +10% 돈 보상을 받는 대신 -5% 경험치 보상를 받습니다.",

		["bm_wp_upg_i_singlefire_desc"] = "무기를 단발 모드로 잠급니다.",
		["bm_wp_upg_i_autofire_desc"] = "무기를 자동 발사 모드로 잠급니다.",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Para 소총",
		["bm_w_akmsu"] = "Krinkov 소총",
		["bm_w_x_akmsu"] = "아킴보 Krinkov 소총",
		["bm_w_hajk"] = "CR 805B 소총",

		["menu_akimbo_assault_rifle"] = "아킴보 돌격소총",

		--Throwables--
		["bm_concussion_desc"] = "소지 갯수: 3개 \n사거리: 10m \n최대 4초 동안 적을 기절 \n7초 동안 적 정확도 50% 감소 \n타이탄 실드, 타이탄 불도저 및 캡틴를 제외한 모든 적을 기절시킵니다. \n \n이 놀라운 작은 아름다움은 모든 사람의 숨을 죽이고 그들을 죽일 추가 순간을 제공합니다.",
		["bm_grenade_smoke_screen_grenade_desc"] = "사거리: 8m \n지속시간: 12초 \n \n이 중 하나를 떨어뜨리면 연기 구름 속으로 사라져 적들이 당신을 조준하기 위해 고군분투하게 됩니다.",
		["bm_grenade_frag_desc"] = "소지 갯수: 3개\n데미지: 800 \n사거리: 5m \n \n고전적인 폭발성 수류탄. 할 말이 더 있겠습니까?",
		["bm_dynamite_desc"] = "소지 갯수: 3\n데미지: 800 \n사거리: 4m \n충돌 지점에서 튕기거나 구르지 않지만 유사한 폭발물보다 스플래시 피해가 적습니다.\n\n바위를 효과적으로 폭파하도록 설계되었고. 사람을 폭파하는 데에도 더욱 효과적입니다.",
		["bm_grenade_frag_com_desc"] = "소지 갯수: 3개 \n데미지: 800 \n사거리: 5m \n \n클래식 수류탄의 날렵한 새로운 모습으로 폭발할 때마다 오버킬 터치를 제공합니다.",
		["bm_grenade_dada_com_desc"] = "소지 갯수: 3개 \n데미지: 800 \n사거리: 5m \n \n인형의 바같 층은 폭발적인 내부 구조를 숨깁니다. 조국에 대한 찬사입니다.",
		["bm_grenade_molotov_desc"] = "소지 갯수: 3개 \n데미지: 10초 이상 풀당 1200 \n사거리: 3.75m \n지속시간: 10초 \n충격 시 폭발 \n \n타오르는 걸레로 부서지기 쉬운 가연성 액체 병. 저렴하고 간단하며 매우 효과적입니다. 이걸로 다 태워버리십시오.",
		["bm_grenade_fir_com_desc"] = "소지 갯수: 3개 \n데미지: 12초 이상 풀당 1440 \n사거리: 3.75m \n지속시간: 12초 \n2.5초 후 폭발 \n \n자체 인 점화 용기. 벽과 모퉁이를 튕기며 적을 향해 튀어오기에 안성맞춤입니다.",
		["bm_wpn_prj_ace_desc"] = "소지 갯수: 9개 \n데미지: 240 \n \n추가된 무게와 면도날이 있고 던질 수 있는 카드. 진정한 킬러 손의 카드입니다.",
		["bm_wpn_prj_four_desc"] = "소지 갯수: 9개 \n데미지: 200 (직격) \n데미지: 5초 이상 200 (독) \n적의 행동을 방해 \n \n던질 수 있는 별은 피와 전투로 가득 찬 오랜 역사를 가지고 있습니다. 이 독이 코팅된 스테인리스 스틸 별은 앞을 가로막는 누구에게나 치명적인 위협이 될 것입니다.",
		["bm_wpn_prj_target_desc"] = "소지 갯수: 9개 \n데미지: 240 \n \n정확하고 조용한 킬을 위한 확실한 백업 계획과 신뢰할 수 있는 전술.",
		["bm_wpn_prj_jav_desc"] = "소지 갯수: 6개 \n데미지: 360 \n \n흐린 선사 시대에 그 기원을 잃어버린 자벨린은 단순한 무기입니다. 결국, 그것은 누군가의 하루를 망치는 끝이 뾰족한 던질 수 있는 막대기입니다.",
		["bm_wpn_prj_hur_desc"] = "소지 갯수: 6개 \n데미지: 360 \n \n날카로운 도끼는 절대 틀리지 않다고 합니다. 던질 수 있는 날카로운 도끼는 더 이상 옳지 않습니다.",
		["bm_grenade_electric_desc"] = "소지 갯수: 3개\n데미지: 400 \n사거리: 5m \n \n파편은 모두 훌륭하고 좋지만 일부는 튀겨야합니다. 이 작고 아름다운 이것은 고전압으로 약간의 피해를 입히기에 다소 실용적인 짐승입니다.",

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

local r = tweak_data.levels.ai_groups.russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = tweak_data.levels.ai_groups.murkywater
local z = tweak_data.levels.ai_groups.zombie
local f = tweak_data.levels.ai_groups.federales
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "ИДЁТ ШТУРМ НАЁМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЁMHИKO"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "겨차 타겨어대에 지행 주",
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
			["hud_assault_assault"] = "머키워터 타격대 돌입 중",
			["hud_assault_alpha"] = "머키워터 타격대"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "옴니아 침공 돌입 중",
			["hud_assault_alpha"] = "옴니아 침공"
		})
	end)
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater
	local lapd = tweak_data.levels.ai_groups.lapd

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
	end
 end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "프로 잡",
		["menu_one_down"] = "프로 잡",
		["menu_es_pro_job_bonus"] = "프로 잡",

		["menu_asset_lock_additional_assets_pro"] = "프로 잡에서는 사용할 수 없습니다!",

		["cn_menu_contract_daypay_header"] = "일일 요금:",
		["cn_menu_contract_jobpay_header"] = "계약금:",
		["victory_stage_cash_summary_name_job"] = "계약일 요금으로 $stage_cash를 벌었고 계약 완료에 대해 추가로 $job_cash를 받았습니다.",

		["debug_interact_grenade_crate_take_grenades"] = "$BTN_INTERACT 키를 길게 눌러 투척물을 보충합니다.",
		["debug_interact_bodybags_bag_take_bodybag"] = "$BTN_INTERACT 키를 길게 눌러 시체가방을 보충합니다.",

		["menu_equipment_armor_kit"] = "투척물 가방",
		["bm_equipment_armor_kit"] = "투척물 가방",
		["debug_equipment_armor_kit"] = "투척물 가방",
		["bm_equipment_armor_kit_desc"] = "투척물 가방을 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 $BTN_INTERACT 키를 길게 눌러 투척물을 보충할 수  있습니다. 세 번만 사용할 수 있습니다.\n\n당신은 가방을 보고 얼마나 남았는지 짐작할 수 있습니다.\n\n투척물 가방는 상황이 위험할때 특수 무기를 휴대하기 위해 일반적으로 군인이나 용병이 사용하는 은닉성 케이스입니다.",

		["bm_equipment_ecm_jammer_desc"] = "ECM 재머를 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 10초 동안 활성화됩니다.\n\nECM 재머를 상호 작용하여 피드백 기능을 킬 수 있습니다. 피드백은 반경 25미터 내의 적을 무력화시킬 확률이 있습니다. 피드백은 20초 동안 지속되며 4분 후에 재충전됩니다.\n\nECM 재머는 ATM 기계를 열 수 있고 휴대폰, 카메라 및 기타 탐지 시스템과 같은 전자 장치를 일시적으로 중지시키며 목표를 쉽게 달성할 수 있도록 합니다.",
		["bm_equipment_first_aid_kit_desc"] = "구급 키트를 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 $BTN_INTERACT 키를 길게 눌러 100 체력을 회복합니다. 한 번만 사용할 수 있습니다.\n\n구급 키트는 긴급 상황에서 신속하게 응급 처치를 제공하는 데 사용되는 소모품 및 장비입니다.",
		["bm_equipment_doctor_bag_desc"] = "의료 가방을 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 $BTN_INTERACT 키를 길게 눌러 3분 동안 4초마다 최대 체력의 20%와 최대 체력의 4%를 회복합니다. 두 번만 사용할 수 있습니다.\n\n의료 가방은 일반적으로 의사 또는 기타 의료 전문가가 의료 용품 및 의약품을 운반하는 데 사용하는 휴대용 가방입니다.",
		["bm_equipment_sentry_gun_desc"] = "센트리 건을 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 배치 시 최대 탄약의 40%를 사용합니다. 너무 많은 피해를 입으면 꺼집니다. 이 상태에서 $BTN_INTERACT 키를 길게 눌러 자동 복구 모드로 전환합니다. 센트리 건을 회수하면 남은 탄약을 되돌리고 수리합니다. 민간인을 겁에 질리게 하여 바닥에 눕게합니다.\n\n센트리 건은 센서에 감지된 목표물을 자동으로 조준하고 발사합니다. 일반적으로 주의를 산만하게 하여 당신과 당신의 팀원으로부터 주의를 끌기 위해 사용됩니다.",
		["bm_equipment_sentry_gun_silent_desc"] = "센트리 건을 사용하려면 $BTN_USE_ITEM 키를 길게 눌러 설치해야합니다. 배치 시 최대 탄약의 40%를 사용합니다. 너무 많은 피해를 입으면 꺼집니다. 이 상태에서 $BTN_INTERACT 키를 길게 눌러 자동 복구 모드로 전환합니다. 센트리 건을 회수하면 남은 탄약을 되돌리고 수리합니다. 민간인을 겁에 질리게 하여 바닥에 눕게합니다.\n\n저소음 센트리 건은 일반적인 방해 요소보다 적을 제거하는 데 더 많이 사용되기 때문에 일반 센트리 건에 대응합니다.",

		["hud_int_hold_take_pardons"] = "$BTN_INTERACT 키를 눌러 사면장을 얻습니다.",
		["debug_interact_gage_assignment_take"] = "$BTN_INTERACT 키를 눌러 패키지를 얻습니다.",

		["far_repair_sentry_macro"] = "센트리가 심각하게 손상되어 수리가 필요합니다.",
		["fixing_sentry_macro"] = "수리 진행도: $AMMO_LEFT%",
		["repair_sentry_macro"] = " 키를 길게 눌러 센트리 자동 수리 시퀀스를 시작합니다",
		["pickup_sentry_macro"] = " 키를 길게 눌러 센트리를 회수합니다.\n남은 탄약 수 $AMMO_LEFT ",
		["firemode_sentry_macro"] = " 키를 눌러 발사 모드를 변경합니다.\n남은 탄약 수 $AMMO_LEFT",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT",
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "센트리 수리중...",

		
		["menu_risk_elite"] = "데스 위시. 당신을 위한 난이도, 섣부른 행동은 당신을 주스로 만들어버릴겁니다.",
		["menu_risk_sm_wish"] = "데스 센텐스. 그들에게 멈출 수 없음을 보여주십시오.",


		["loading_gameplay_res_title"] = "레스트레이션 게임플레이 팁",
		["loading_gameplay_res_1"] = "클로커는 플레이어에게 공격적일 때 '쌕쌕' 소리를 냅니다. 이것을 들어서 찾아보십시오.",
		["loading_gameplay_res_2"] = "클로커는 더 이상 돌진할 때 주변에서 윙윙거리는 소리나 끽끽거리는 소리를 내지 않습니다. 그들의 고글은 이제 항상 켜져 있으므로 주변에 주의를 기울이십시오.",
		["loading_gameplay_res_3"] = "데스 센텐스에서 적이 재장전 중인 당신을 우선시할 수 있습니다. 당신이 엄폐물에 있는지 또는 적으로부터 멀리 있는지 확인하십시오. 때때로 무기를 교체하는 것이 더 나을 수 있습니다. 특히 권총을 보조 무기로 사용하는 경우 더욱 그렇습니다.",
		["loading_gameplay_res_4"] = "테이저는 더 이상 당신의 무기를 재장전 해주지 않습니다. 가능하면 멀리 떨어져있거나, 전기충격을 받을거 같다면 보조무기로 전환하십시오.",
		["loading_gameplay_res_5"] = "클로커는 혼자 있는 플레이어를 적극적으로 쫓습니다, 함께 뭉치거나 혼자 감옥에 가십시오.",
		["loading_gameplay_res_6"] = "클로커는 발로 차면 직접적인 체력 피해를 입힙니다. 이것은 굴절 또는 반격 스킬로 감소시킬 수 있습니다.",
		["loading_gameplay_res_7"] = "그린 불도저는 플레이어의 측면을 공격하려고 시도하고 기습하면서 발사하다가 도망칩니다. 당황하거나 놀라지 않도록 주의하십시오.",
		["loading_gameplay_res_8"] = "사이가/블랙 불도저는 매우 공격적이며 플레이어를 향해 돌진합니다. 예측하기 쉽지만 준비되지 않은 경우 매우 위험합니다.",
		["loading_gameplay_res_9"] = "경기관총 도저/스컬도저는 다른 유닛에게 엄호 사격을 지원하지만 여전히 그외 상황에서 돌격하고 매우 높은 DPS를 가지고 있습니다.",
		["loading_gameplay_res_10"] = "베넬리 샷건 도저는 미니건 도저를 대체합니다. 그들은 크라임 스프리 혹은 데스 센텐스에서 캡틴 스프링과 함께 스폰됩니다. 그들은 매우, 매우 위험합니다.",
		["loading_gameplay_res_11"] = "모든 도저는 재장전 중인 플레이어를 우선 순위로 지정합니다.",
		["loading_gameplay_res_12"] = "데스 센텐스에서 불도저는 바이저가 깨지면 버서커 분노 상태에 돌입하여 공격력을 10% 증가합니다.",
		["loading_gameplay_res_13"] = "클로커는 점프 킥을하려고 할 때 상징적인 소리를 냅니다, 소리가 들리면 옆으로 피하십시오.",
		["loading_gameplay_res_14"] = "클로커의 점프 킥은 당신을 다운 대신에 수갑을 채웁니다.",
		["loading_gameplay_res_15"] = "데스 센텐스에서는 섬광탄을 부술 수 없습니다.",
		["loading_gameplay_res_16"] = "근접 무기를 충전하여 적의 근접 공격을 반격 할 수 있습니다. 이것은 클로커 킥도 반격 할 수 있도록 업그레이드할 수 있습니다.",
		["loading_gameplay_res_17"] = "적의 근접 공격은 이전보다 훨씬 더 효과적입니다. 단순히 적 무리를 쉽게 지나칠 것이라고 기대하지 마십시오.",
		["loading_gameplay_res_18"] = "야구 방망이로 적을 때리는 것보다 더 나은 것이 무엇인지 아십니까? 야구 방망이로 머리를 때려 헤드샷 피해를 주십시오.",
		["loading_gameplay_res_19"] = "저격수는 발사하기 전에 집중하는 데 짧은 시간이 걸립니다. 모든 오디오가 희미해지기 시작하면 언제 집중하고 있는지 알 수 있습니다.",
		["loading_gameplay_res_20"] = "당신의 조커들은 클로커의 발차기로 부터 안전하지 않습니다.",
		["loading_gameplay_res_21"] = "일반 적들이 다양한 무기로 당신을 공격할 것입니다. 유니폼의 세부 사항을 보면 누가 무엇을 들고 있는지 알 수 있습니다.",
		["loading_gameplay_res_22"] = "산탄총을 든 적들은 치명적입니다. 가까이에 있는 상태에서 방탄복이 많지 않다면 두 발로 쓰러질 수 있습니다. 그러나 그들은 매우 제한된 사거리를 가지고 있습니다.",
		["loading_gameplay_res_23"] = "적들은 더 높은 난이도에서 실드 뒤에 숨으려고 시도합니다.",
		["loading_gameplay_res_24"] = "적들은 더 높은 난이도에서 훨씬 더 똑똑하게 행동하고 예측하기 어렵습니다.",
		["loading_gameplay_res_25"] = "데스 센텐스는 바닐라보다 불공평하지 않으면서 더 어렵고 의미심장하게 만들기 위해 전면적인 디자인 개편을 거쳤습니다. 가이드를 확인하세요.",
		["loading_gameplay_res_26"] = "프로 잡은 습격 전에 일반 에셋(예: 의료 가방, 탄약 가방 또는 시체 가방)을 구매하는 것을 금지시키고, 아군 사격이 가능해지고(봇도 적용) 임무의 마지막 부분에 다다르면 특별한 브라보 적이 대열에 나타나고 PONR가 발생합니다.",
		["loading_gameplay_res_27"] = "레스트레이션 모드는 머키워터 용병 및 다른 주의 집행자와 같은 다양한 팩션을 제공합니다. 그들은 동일하게 기능하지만 워싱턴 DC에서 정식으로 발생하는 하이스트에 멋진 풍미를 더합니다.",
		["loading_gameplay_res_28"] = "클로커는 돌진하기 전에 연막탄을 던집니다.",
		
		["loading_new_units_res_title"] = "레스트레이션 유닛 팁",
		["loading_new_units_res_1"] = "타이탄 HRT는 그들이 있다는 것을 알기도 전에 인질을 구출하고 전리품을 훔치는 번개처럼 빠른 유닛입니다. 또한 헤드샷이나 근접 공격 이외에 죽으면 최루탄을 떨어뜨립니다.",
		["loading_new_units_res_2"] = "LPF는 근접 공격에 약합니다.",
		["loading_new_units_res_3"] = "경무장 유닛은 LPF에 의해 과치료됩니다. 과치료된 적은 보라색으로 표시됩니다. 과치료된 유닛은 항상 적어도 한 발은 버팁니다.",
		["loading_new_units_res_4"] = "타이탄 클로커는 거의 보이지 않게 만드는 고급 은폐 장비를 가지고 있지만 여전히 표준 클로커 장비의 이전 모델의 주변 소음이 있습니다. 그 소리에 귀를 기울이십시오.",
		["loading_new_units_res_5"] = "타이탄 도저는 가능한 한 직접적인 전투를 피하고 적극적으로 옵니다. 그리고 안전한 거리에서 제압 사격을 가합니다.",
		["loading_new_units_res_6"] = "타이탄 저격수는 더 높은 연사력과 이동 중에 사격할 수 있는 대신 표준 대응품의 탄당 피해량과 방탄복 관통력을 교환했습니다.",
		["loading_new_units_res_7"] = "타이탄 저격수는 레이저 조준기를 사용하지 않는 대신 사격하면 보라색 예광을 남깁니다. 이를 이용하여 저격수를 추적하십시오.",
		["loading_new_units_res_8"] = "타이탄 실드는 Thanatos, 찢고 죽인다 베이직을 찍었을때 OVE9000 톱, 센트리 건의 특수 철갑탄 탄으로만 뚫을 수 있습니다.",
		["loading_new_units_res_9"] = "캡틴 스프링과 타이탄 도저는 항상 추가 헤드샷 피해를 입습니다.",
		["loading_new_units_res_10"] = "타이탄 테이저는 일시적으로 움직임을 심각하게 제한되는 전기탄을 발사합니다. 맞으면 화면이 파란색으로 빛납니다.",
		["loading_new_units_res_11"] = "베테랑 경찰은 주어진 사격이 얼마나 많은 피해를 줄 수 있는지를 제한하는 빠른 반사 능력을 가지고 있습니다. 하지만 그들은 근접, 화염 또는 폭발을 회피할 수 없습니다. 발사 속도가 빠르고 피해가 적은 무기를 선택하십시오.",
		["loading_new_units_res_12"] = "베테랑 경찰은 물리적으로 피하고 사방에 점프하여 공격하기 어렵게 만듭니다. 또한 연막탄을 자주 떨어뜨립니다.",
		["loading_new_units_res_13"] = "타이탄 SWAT은 근접 공격에 약간의 저항력을 갖지만 여전히 마무리용으론 유용합니다.",
		["loading_new_units_res_14"] = "타이탄 SWAT은 인질로 잡히거나 당신 편에 싸우도록 전향 시킬 수도 없습니다.",
		["loading_new_units_res_15"] = "타이탄 SWAT은 경기관총과 자동 산탄총을 자랑합니다. 그들은 당신의 웰빙에 큰 위협이 됩니다.",
		["loading_new_units_res_16"] = "위험한 브라보 유닛은 프로 잡에서 PONR이 트리거될 때만 생성됩니다. 그들은 강화된 방탄복과 더 강력한 무기를 갖춘 강력하고 무자비한 적입니다.",
		["loading_new_units_res_17"] = "브라보 유닛은 파편 수류탄을 던질 수 있습니다. 점멸기를 보고 신호음을 들으십시오.",
		["loading_new_units_res_18"] = "아칸은 다르게 보이지만 같은 방식으로 행동하는 자체 타이탄 유닛을 배치합니다. 그러나 전체적인 색 구성표와 시각적 특성은 동일하므로 쉽게 식별할 수 있습니다.",
		["loading_new_units_res_19"] = "척탄병은 언더베럴 부착물을 사용하여 원거리에서 최루 가스 유탄을 발사하여 구름 속에 있는 플레이어에게 피해를 줍니다. 데스 센텐스에선 대신 더 치명적이고 스태미너를 소모하는 신경 가스 유탄으로 무장합니다.",
		
		["loading_captains_res_title"] = "레스트레이션 캡틴 팁",
		["loading_captains_res_1"] = "캡틴 서머즈를 쓰러뜨리려면 먼저 닥부터 그의 팀원들을 목표로 삼으십시오. 그는 그의 모든 팀원들이 죽을 때까지 죽일 수 없으며 다른 두 사람은 닥이 죽을 때까지 거의 무적입니다.",		
		["loading_captains_res_2"] = "캡틴 서머즈를 안아주지 마세요. 그는 화염 방사기로 당신을 녹일 것이고, 당신을 감전시킬 버저를 가지고 있습니다.",		
		["loading_captains_res_3"] = "캡틴 스프링은 엄청난 피해를 버틸 수 있지만 결국 쓰러질 것입니다. 그의 수류탄을 조심하고 매우 느리기 때문에 그를 이끌려고 시도하십시오.",	
		["loading_captains_res_4"] = "캡틴 스프링은 주기적으로 클러스터 고폭 수류탄을 던집니다. 그와 오랫동안 가까이 있지 마십시오.",	
		["loading_captains_res_5"] = "캡틴 스프링은 위험할 수 있지만 엄청나게 느리고 사거리가 좋지 않습니다.",	
		["loading_captains_res_6"] = "캡틴 어텀은 공격할 때 큰 소리로 도발합니다. 그것을 이용하여 그를 찾으십시오.",	
		["loading_captains_res_7"] = "다른 캡틴과 달리 경찰은 기습 요소를 망치지 않기 위해 어텀의 도착을 알리지 않습니다.",	
		["loading_captains_res_8"] = "캡틴 어텀은 한동안 맵에서 들키지 않으면 개인 도구를 점진적으로 비활성화할 것입니다. 비활성화된 개인 도구은 보라색으로 표시되어 있으며 어텀을 찾아 패배시킨 경우에만 사용할 수 있습니다.",	
		["loading_captains_res_9"] = "근접 싸움에서 캡틴 어텀을 이기지 못할 것입니다. 시도하지도 마세요.",	
		["loading_captains_res_10"] = "캡틴 윈터스는 폭발물과 불에 거의 면역이 되며 강력한 총알 저항을 갖지만 근접 공격에 다소 취약합니다.",	
		["loading_captains_res_11"] = "캡틴 윈터스의 방패는 완전히 뚫을 수 없습니다.",	
		["loading_captains_res_12"] = "캡틴 윈터스가 개편되었습니다. 그는 이제 주변의 넓은 지역에 있는 적들을 치유하고 기회가 있을 때 공격적으로 돌진하는 동안 맵 주위를 배회합니다.",	
		--Stealth Hints
		["loading_stealth_res_title"] = "레스트레이션 스텔스 팁",
		["loading_stealth_res_1"] = "경비원은 더 이상 고장난 카메라를 보고 즉시 경고 하지 않습니다. 일부 경비원이 부서진 카메라를 검사 할 것입니다. 이를 이용해 미끼로 사용할 수 있습니다.",	
		["loading_stealth_res_2"] = "경계하지 않은 경비원을 근접 공격으로 죽이거나 인질로 잡아도 페이저는 울리지 않습니다. 경고를 받은 경비원을 바로 근접 공격으로 죽이면 페이저가 울리는 것을 막을 수 있습니다.",	
		["loading_stealth_res_3"] = "경계하지 않은 경비원을 근접 공격으로 죽이거나 인질로 잡아도 경비원 지원 및 맵 이벤트는 여전히 발생합니다.",	
		["loading_stealth_res_4"] = "페이저가 없는 경비원은 죽여도 의심을 증가시키지 않습니다.",	
		["loading_stealth_res_5"] = "스텔스에서 모든 시끄러운 무기는 25미터 고정 소음 반경을 가지고 있습니다.",	
		["loading_stealth_res_6"] = "시민들은 라우드와 스텔스에서 총소리에 반응하여 눕습니다.",	
		["loading_stealth_res_7"] = "센트리 건은 반경 내에 있는 모든 시민을 진정시킵니다.",	
		["loading_stealth_res_8"] = "가방을 들고 다니는 동안 훨씬 더 멀리 보일 수 있으며 서 있거나, 달리거나, 점프할 때도 훨씬 빠르게 감지합니다. 앉아서 천천히 가십시오.",	
		["loading_stealth_res_9"] = "바닐라처럼 2개 대신 최대 4개의 ECM을 얻을 수 있지만 지속 시간은 절반입니다. 목적에 맞게 사용하십시오.",	
		["loading_stealth_res_10"] = "소음기 무기는 스텔스에서 소음을 내지 않습니다.",	
		["loading_stealth_res_11"] = "라우드처럼 스텔스에 최대 4명의 경찰을 인질로 잡을 수 있습니다. 이것은 페이저를 활성화하거나 의심을 증가시키지 않지만 나중에 죽이면 활성화됩니다.",	
		["loading_stealth_res_12"] = "스텔스에 대부분의 즉각적인 실패(예: 경고 받은 카메라 또는 최대 페이저 수 초과)가 제거되었거나 심각하게 감소되었습니다. 자세한 내용은 가이드를 확인하세요.",	
		["loading_stealth_res_13"] = "경비원은 더 이상 경계하지 않은 상태에서 피해를 입더라도 즉시 죽지 않습니다. 머리를 겨냥하고 주먹보다 더 강력한 것을 가져 오십시오.",	
		["loading_stealth_res_14"] = "의심 미터가 가득 차면 알람이 울리기 전에 시작한 작업을 완료할 수 있는 60초가 주어집니다.",	
		["loading_stealth_res_15"] = "의심 미터가 높을수록 경비원에게 더 쉽게 감지됩니다.",	
		["loading_stealth_res_16"] = "기본 게임보다 더 많은 시체 가방을 휴대할 수 있으며, 솔로 플레이의 경우에는 더욱 많아집니다.",	
		["loading_stealth_res_17"] = "Crime.net 오프라인 모드에서는 없는 플레이어를 보충하기 위해 추가 케이블 타이가 제공됩니다. 올바른 스킬이 있으면 케이블 타이가 증가합니다.",	
		["loading_stealth_res_18"] = "총격으로 사망한 경비원은 페이저를 울립니다. 페이저를 울리는 것은 의심을 증가시키지는 않지만 무시하면 의심이 증가합니다.",	
		["loading_stealth_res_19"] = "페이저 오프레이터는 난이도가 높을 수록 덜 관대합니다. 마지막 호출기는 특수 대사을 사용하여 이걸로 알 수 있습니다.",	
		["loading_stealth_res_20"] = "허용된 한도를 초과하여 페이저에 응답하면 의심이 크게 증가하지만 페이저를 끊거나 응답하지 않는 것만큼은 아닙니다.",	
		["loading_stealth_res_21"] = "페이저를 응답하는 데 더 오래 걸리고 더 높은 난이도에서는 더 빨리 사라집니다.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "레스트레이션 장비/스킬 팁",
		["loading_equip_skills_res_1"] = "산탄총은 정확도가 낮아질수록 범위가 줄어듭니다. 실험을 통해 무엇이 가장 효과적인지 확인하십시오! 저격수를 상대할 수 없게 하지 않도록 주의하십시오. 아니면 산탄총이 아닌 보조무기를 고려하십시오.",	
		["loading_equip_skills_res_2"] = "권총은 교체가 매우 빠르고 일반적으로 정확도와 안정성이 높습니다. 당신이 다른 것에 특화되어 있지 않다면 백업 무기로도 아주 잘 사용됩니다.",	
		["loading_equip_skills_res_3"] = "레스트레이션의 무기는 장단점이 있는 다양한 클래스에 속합니다. 더 높은 데미지의 무기는 적을 더 빨리 죽일 수 있지만, 그것을 알기도 전에 그들은 당신을 죽일 수 있습니다!",	
		["loading_equip_skills_res_4"] = "데미지가 높은 무기는 정확도나 발사 속도와 같은 심각한 단점이 없는 한 일반적으로 은닉성이 낮습니다.",	
		["loading_equip_skills_res_5"] = "울프는 현장 수리가 가능하도록 센트리 건을 업그레이드했습니다. 시간이 좀 걸리지만 시작하면 자동으로 복구됩니다.",	
		["loading_equip_skills_res_6"] = "센트리 철갑탄을 잠금 해제된 경우 장비 메뉴에서 기본으로 탄약 유형을 선택할 수 있습니다.",	
		["loading_equip_skills_res_7"] = "퍽 덱은 상당한 데미지 보너스를 제공하며 그 중 다수는 희귀하고 귀중한 치유 능력을 제공합니다. 더 높은 난이도를 플레이하고 싶다면 업그레이드를 게을리하지 마십시오.",	
		["loading_equip_skills_res_8"] = "크루 치프, 아머러, 머슬, 크룩, 겜블러 및 바이커는 기본적이지만 일관된 퍽 덱입니다. 이것은 퍽 덱을 구축하기 위한 훌륭한 첫 번째로 선택할 수 있습니다.",	
		["loading_equip_skills_res_9"] = "히트맨은 낮은 장기 생존성과 일관성 퍽 덱으로 재작업되었지만 그 대가로 '임시 HP'를 엄청나게 모아 어려운 지점을 통과할 수 있습니다.",	
		["loading_equip_skills_res_10"] = "크루 치프는 작지만 유용한 버프를 당신과 팀원에게 부여하고 여러 명의 인질이 있는 경우 더 많은 버프를 제공하는 팀 중심의 퍽 덱입니다. 마스터마인드의 통제자 트리와 잘 어울립니다.",	
		["loading_equip_skills_res_11"] = "갬블러는 탄약을 획득할 때 팀원에게 약간의 HP와 추가 탄약을 제공하는 팀 중심의 퍽 덱입니다. 추가 탄약을 제공하는 스킬과 잘 어울립니다.",	
		["loading_equip_skills_res_12"] = "매니악은 빠른 팀 중심의 퍽 덱으로, 일관된 킬을 유지하는 한 자신과 팀원에게 받는 피해를 줄여줍니다. 고 데미지 출력 빌드와 데미지 저항과 빌드에 잘 어울립니다.",	
		["loading_equip_skills_res_13"] = "해커의 휴대용 ECM은 팀 전체의 치유와 강력한 군중 제어를 제공하지만 재충전하는 데 오랜 시간이 걸립니다. 스텔스에서도 효과적입니다.",	
		["loading_equip_skills_res_14"] = "버글러는 라우드용으로 사용되는 다른 덱보다 약간 약한 대가로 스텔스에 약간의 보너스를 제공하는 퍽 덱입니다.",	
		["loading_equip_skills_res_15"] = "킹핀은 다재다능한 퍽 덱입니다. 주사기로 자가 유지, 심각한 손상에서 살아남거나 팀 대신 적의 사격을 맞아주는 데 사용할 수 있습니다.",	
		["loading_equip_skills_res_16"] = "태그 팀은 두 사람이 일관된 킬을 유지하는 한 특정 팀원에게 많은 치유를 제공할 수 있는 팀 중심의 퍽 덱입니다.",	
		["loading_equip_skills_res_17"] = "실드를 관통하는 총알은 절반의 피해를 줍니다.",	
		["loading_equip_skills_res_18"] = "Peacemaker와 Phoenix .500 리볼버는 저격소총처럼 방탄복을 관통할 수 있습니다.",
		["loading_equip_skills_res_19"] = "화면 측면에 파란색 미터가 있으면 회피가 있는 것입니다. 깜박이면 다음 총알을 피합니다. 회피 리워크에 대한 자세한 설명은 가이드를 참조하십시오.",	
		["loading_equip_skills_res_20"] = "무기의 은폐가 높을수록 더 빨리 뽑고 수납할 수 있습니다.",	
		["loading_equip_skills_res_21"] = "전기톱과 카자구루마는 들고 있는 동안 전방의 적에게 피해를 줍니다.",	
		["loading_equip_skills_res_22"] = "버터플라이 나이프와 스위치블레이드는 적의 등을 찌르면 막대한 피해를 줍니다.",	
		["loading_equip_skills_res_23"] = "아이스 픽 및 금광 열풍은 느린 속도 대신 헤드샷 피해를 더 줍니다.",	
		["loading_equip_skills_res_24"] = "독은 중간 정도의 피해만 입히지만 구토를 유발하여 다른 행동을 방해합니다.",	
		["loading_equip_skills_res_25"] = "충격탄은 불도저를 상대로도 매우 강력한 교란을 줍니다.",	
		["loading_equip_skills_res_26"] = "조준기로 조준하면 경기관총을 사용하더라도 정확도가 크게 증가하고 반동이 감소합니다.",	
		["loading_equip_skills_res_27"] = "파운더 네일건은 다른 어떤 근접 무기보다 훨씬 더 긴 사거리를 가지고 있습니다.",	
		["loading_equip_skills_res_28"] = "퍽 덱의 레벨을 올리면 투척물 케이스가 잠금 해제됩니다.",
		["loading_equip_skills_res_29"] = "이제 투척물 케이스로 투척물을 보충하면 사용할 때마다 전체 투척물이 채워집니다.",	
		["loading_equip_skills_res_30"] = "상황이 안 좋을때 인스파이어 에이스로 팀원을 구하십시오. 재사용 대기 시간이 매우 길고 시야가 필요합니다.",	
		["loading_equip_skills_res_31"] = "레스트레이션 모드는 각각 일반 퍽만 제공하거나 퍽은 제공하지 않는 두 개의 새로운 퍽 덱(와일드카드 및 백지)을 추가합니다. 이것은 스스로 부과한 도전을 하고 싶은 사람들을 위한 것입니다.",
		--Misc Hints
		["loading_misc_res_title"] = "레스트레이션 기타 팁",
		["loading_misc_res_1"] = "커스텀 하이스트도 시도해보세요! 블라드의 '도그하우스'뿐만 아니라 '자칼'의 계약에서 대부분을 찾을 수 있습니다.",	
		["loading_misc_res_2"] = "레스트레이션 모드에 스팀 가이드가 있습니다! 이것은 더 자세한 정보를 알아가는데 유용합니다. 메인 메뉴를 확인하세요.",	
		["loading_misc_res_3"] = "레스트레이션 모드에 디스코드 서버가 있습니다! 토론, 벨런스 피드백 및 매치 메이킹에 참여하십시오! 메인 메뉴를 확인하세요.",	
		--Trivia Hints
		["loading_fluff_res_title"] = "레스트레이션 트라비아",
		["loading_fluff_res_1"] = "옴니아는 실패한 무기 프로젝트를 복구 하기 위해 많은 돈을 씁니다.",	
		["loading_fluff_res_2"] = "LPF는 많은 맥주를 빚지고 있습니다.",	
		["loading_fluff_res_3"] = "LPF와 타이탄 저격수는 호주인입니다.",	
		["loading_fluff_res_4"] = "NYPD 브롱코 경찰은 도넛을 좋아합니다.",	
		["loading_fluff_res_5"] = "ZEAL UMP 엘리트 SWAT의 이름은 Chad입니다.",	
		["loading_fluff_res_6"] = "타이탄 도저는 광범위한 유전 공학, 인간 실험 및 전투 약물 덕분에 빛나는 눈을 가지고 있습니다.",	
		["loading_fluff_res_7"] = "캡틴 스프링은 인간이 아닙니다. 아니면 옛날 옛적에 그랬을 수도 있습니다.",	
		["loading_fluff_res_8"] = "레스트레이션 모드는 커뮤니티의 다양한 맴버와 개발 팀에 의해 'resmod','SCmod','furry mod' 및 'mememod'라는 별명이 붙었습니다.",	
		["loading_fluff_res_9"] = "옴니아는 공룡의 공격으로부터 보호하기 위해 강화된 보안문을 개발하고 있습니다.",	
		["loading_fluff_res_10"] = "척탄병은 해충 방제에도 투입됩니다.",	
		["loading_fluff_res_11"] = "당신은 타이탄 클로커를 본 적이 없습니다.",
		["loading_fluff_res_12"] = "'옴니아'는 네덜란드에 기반을 둔 자칭 '네오켈트 이교도 포크' 밴드로 아일랜드, 네덜란드, 콘월, 벨기에, 인도네시아 및 페르시아 출신인 멤버가 있습니다. 옴니아와 관련되어 있는지는 확인되지 않았습니다.",	
		["loading_fluff_res_13"] = "자칼이 Crime.Net에 연루되어 젠섹을 떠나게 된 원인이 무엇이든, 그는 그것에 대해 이야기하기를 거부합니다. 그는 그 사건으로 인해 '정신장애'가 일어난 것 같습니다.",	
		["loading_fluff_res_14"] = "하하하하하!",
		["loading_fluff_res_15"] = "캡틴 서머즈와 그의 팀원들은 페이데이 갱과 매우 흡사한 4명의 강도로 구성되어 있었습니다. 그들은 이제 옴니아의 스트라이크 팀입니다.",
		["loading_fluff_res_16"] = "캡틴 서머즈와 그의 팀원들은 은행을 털다 건물 붕괴로 공식적으로 사망했다고 했지만 사실 이것은 거짓이었습니다.",
		["loading_fluff_res_17"] = "캡틴 어텀은 수갑에 많은 돈을 씁니다.",
		["loading_fluff_res_18"] = "캡틴 서머즈는 가스 가스 가스에 많은 돈을 씁니다.",
		["loading_fluff_res_19"] = "캡틴 스프링은 총알과 수류탄에 많은 돈을 씁니다.",
		["loading_fluff_res_20"] = "캡틴 윈터스는 방패와 덕트 테이프에 많은 돈을 씁니다.",
		["loading_fluff_res_21"] = "척탄병 사단은 아군 오사로 인한 몇 차례의 사건으로 인해 디포테린에 많은 돈을 씁니다.",
		["loading_fluff_res_22"] = "이전에 캡틴 서머즈를 만났을 수도 있고 만나지 않았을 수도 있습니다.",
		["loading_fluff_res_23"] = "연방 경찰은 특수 추파카브라 사냥 사단이 있습니다.",
		["loading_fluff_res_24"] = "캡틴은 죽지 않습니다. 그저 구금될 뿐입니다.",
		["loading_fluff_res_25"] = "리퍼는 연방 경찰에게 옴니아보다 저렴한 가격으로 '카르텔에 대한 신속하고 잔인한 단속'을 제안했으며, 이로 인해 연방 경찰은 리퍼의 타이탄 버전을 채택했습니다. 이것은 멕시코와 미국의 옴니아 및 머키워터 작전에 그들의 군대를 더 가깝게 만들기 위한 계략입니다.",

		["menu_button_deploy_bipod"] = "BIPOD/ALT-FIRE",
		["skill_stockholm_syndrome_trade"] = "Down Restored!",
		["hint_short_max_pagers"] = "페이저를 무시하면 경비원의 의심이 크게 증가합니다.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "크라임 엘리트에 새로 입학한 사람으로서 가장 먼저 해야 할 일은 자신의 지위에 맞는 장비와 과시감을 얻는 것입니다.\n\n보너스:\n인포머스 등급의 기본 드랍률이 ##0.3%##에서 ##0.6%##으로 증가합니다.\n획득 경험치가 ##5%## 증가합니다.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "강습",
		["st_menu_enforcer_armor"] = "저거너트",
		["st_menu_enforcer_ammo"] = "지원",
		["st_menu_technician_auto"] = "전투 공병",
		["st_menu_technician_breaching"] = "브리처",
		["st_menu_technician_sentry"] = "요새",
		["hud_instruct_mask_on"] = "$BTN_USE_ITEM 키를 눌러 마스크 착용",
		["hud_instruct_mask_on_alpha"] = "$BTN_USE_ITEM 키를 눌러 마스크 착용",

		--Default Suit String
		["bm_suit_none_desc"] = "이것은 선택한 갑옷을 입은 하이스터의 기본 복장입니다. 선택한 습격에 따라 투피스 슈트에서 자동으로 변경됩니다!",

		-- Ad Banner Change
		["menu_changelog"] = "Latest Changelog",
		["menu_discord"] = "Discord Server",
		["menu_guide"] = "Overhaul Guide",
		["menu_captains"] = "Information on Captains",
		["menu_content_updates"] = "Guide/Support",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "뮤테이터를 활성화하면 경험치와 획득한 돈이 감소되고 도전과제, 대부분의 트로피 및 레벨 완료 획득을 비활성화합니다!",
		["mutator_medidozer_longdesc"] = "All normal enemies during assault waves are replaced with Medics, and all special units are replaced with Bulldozers.",
		["mutator_medicdozers"] = "메딕 도저",
		["mutator_medicdozers_desc"] = "이제 메딕 도저가 생성됩니다.",
		["mutator_medicdozers_longdesc"] = "다양한 종류의 불도저가 생성될 때마다 50%의 확률로 메딕 도저로 교체됩니다. \n\n참고: 반자동 산탄총 불도저 뮤테이터도 활성화된 경우 메딕 도저는 33.3%의 확률로 블랙 도저를 교체합니다.",

		["mutator_notitans"] = "예산 삭감",
		["mutator_notitans_desc"] = "타이탄 유닛을 비활성화합니다.",
		["mutator_notitans_longdesc"] = "타이탄 유닛의 모든 생성 인스턴스가 비활성화됩니다.",

		["mutator_mememanonly"] = "님들아 그걸 믿었음?",
		["mutator_mememanonly_desc"] = "정신나갈거같애",
		["mutator_mememanonly_longdesc"] = "정신나갈거같애정신나갈거같애정신나갈거같애\n\n 경고: 해당 뮤테이터는 일부 맵에서 충돌을 일으킬 수 있습니다.",

		["MutatorMoreDonutsPlus"] = "많은 도넛+",
		["MutatorMoreDonutsPlus_desc"] = "모든 일반 적은 NYPD 브롱코 경찰로 대체되고 모든 특수 적은 옴니아 LPF로 대체됩니다.",
		["MutatorMoreDonutsPlus_longdesc"] = "모든 일반 적들은 NYPD 브롱코 경찰로 대체되고 모든 특수 적들은 옴니아 LPF로 대체됩니다. \n\n경고: 해당 뮤테이터를 활성화하면 잔학 행위를 저지르는 것입니다.",

		["MutatorJungleInferno"] = "정글 인페르노",
		["MutatorJungleInferno_desc"] = "모든 적들은 캡틴 서머즈로 대체됩니다.",
		["MutatorJungleInferno_longdesc"] = "스크립트로 스폰되지 않는 모든 적들은 캡틴 서머즈의 클론으로 대체됩니다.",

		["mutator_minidozers"] = "반자동 산탄총 불도저",
		["mutator_minidozers_desc"] = "이제 반자동 산탄총 불도저가 생성될 수 있습니다.",
		["mutator_minidozers_longdesc"] = "블랙 도저가 생성될 때마다 50%의 확률로 M1014를 들고 있는 불도저로 교체됩니다.\n\n참고: 메딕 도저 뮤테이터도 활성화된 경우 반자동 산탄총 불도저는 33.3%의 확률로 블랙 도저를 교체합니다.",

		["mutator_fatroll"] = "팻 롤",
		["mutator_fatroll_desc"] = "피해 유예시간을 비활성화 시킵니다.",
		["mutator_fatroll_longdesc"] = "플레이어와 AI 팀원에 대한 피해 유예는 0으로 설정되어 피해가 들어오는 지연이 없어집니다.",

		["mutator_zombie_outbreak"] = "데드 워킹",
		["mutator_zombie_outbreak_desc"] = "모든 적을 좀비 유닛으로 교체합니다",
		["mutator_zombie_outbreak_longdesc"] = "죽은 자들이 일어났다! 모든 적을 좀비 유닛으로 교체합니다.",

		["mutator_faction_override"] = "적 팩션 오버라이드",
		["mutator_faction_override_desc"] = "",
		["mutator_faction_override_longdesc"] = "",
		["mutator_faction_override_"] = "",
		["mutator_faction_override_select"] = "",
		["mutator_faction_override_america"] = "미국",
		["mutator_faction_override_russia"] = "러시아",
		["mutator_faction_override_zombie"] = "좀비",
		["mutator_faction_override_murkywater"] = "머키워터",
		["mutator_faction_override_nypd"] = "NYPD",
		["mutator_faction_override_lapd"] = "LAPD",
		["faction_selector_choice"] = "팩션: ",

		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "크라임 스프리는 연속적으로 실행되는 무작위로 선택되는 하이스트의 끝없는 시리즈입니다. 하이스트를 완료할 때마다 등급과 보상이 증가합니다! 20 또는 26 등급마다 개조를 선택해야 하고 100 등급마다 리스크 레벨이 증가하므로 다음 습격을 완료하기가 더 어려워집니다. 리스크 레벨 600 이후에는 플레이어가 가지고 있는 무적 프레임의 양이 감소하기 시작하고 브라보 유닛이 정상적으로 스폰되기 시작합니다.\n\n##팀원을 초대하는 경우 랭크와 보상을 얻기 위해 합류하기 전에 자신만의 크라임 스프리를 시작했는지 확인하십시오.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "하나의 추가 불도저가 레벨에 허용됩니다.",
		["menu_cs_modifier_medics"] = "하나의 추가 메딕이 레벨에 허용됩니다.",
		["menu_cs_modifier_no_hurt"] = "적들이 넉다운에 50% 저항을 얻습니다.",
		["menu_cs_modifier_dozer_immune"] = "불도저는 폭발 피해를 50% 덜 받게됩니다.",
		["menu_cs_modifier_bravos"] = "적은 6.667%의 추가 확률로 브라보 유닛이 됩니다.",
		["menu_cs_modifier_grace"] = "피해 유예 기간이 60분의 1초로 줄어듭니다.",
		["menu_cs_modifier_letstrygas"] = "연막탄은 이제 최루 가스로 대체됩니다.",
		["menu_cs_modifier_boomboom"] = "척탄병은 이제 사망 시 폭발합니다.",
		["menu_cs_modifier_friendlyfire"] = "팀원이 아군 사격 피해를 100% 받습니다.",
		["menu_cs_modifier_dodgethis"] = "베테랑 경찰은 이제 모든 총알을 피합니다.",
		["menu_cs_modifier_sniper_aim"] = "저격수가 이제 소총을 100% 더 빠르게 조준합니다.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "모든 소총 SWAT 유닛은 15%의 추가 확률로 엘리트 UMP 유닛이 됩니다.",
		["menu_cs_modifier_heavy_sniper"] = "타이탄 저격수와 브라보 지정 사수는 이제 근거리에서 완전 자동으로 소총을 발사합니다.",
		["menu_cs_modifier_dozer_medic"] = "불도저가 생성될 때마다 메딕 불도저가 될 가능성이 생깁니다. 메딕 불도저는 메딕과 불도저로 간주됩니다.",
		["menu_cs_modifier_dozer_minigun"] = "그린 또는  블랙 불도저가 생성될 때마다 M1014를 든 불도저로 교체될 가능성이 생깁니다.",
		["menu_cs_modifier_shield_phalanx"] = "모든 일반 실드 유닛은 15%의 추가 확률로 타이탄 실드가 됩니다.",
		["menu_cs_modifier_taser_overcharge"] = "테이저의 테이징 녹아웃 효과가 더 이상 지연되지 않습니다.",
		["menu_cs_modifier_dozer_rage"] = "불도저의 안면부가 파괴되면 불도저는 광포한 분노에 빠져 기본 피해량을 10% 증가시킵니다.",
		["menu_cs_modifier_medic_adrenaline"] = "모든 메딕 유닛은 15%의 추가 확률로 옴니아 LPF가 됩니다.",
		["menu_cs_modifier_cloaker_arrest"] = "클로커의 근접 공격운 이제 플레이어를 수갑을 채우게합니다.",
		["menu_cs_modifier_cloaker_smoke"] = "클로커는 이제 회피 시 50%의 확률로 섬광탄을 떨어뜨립니다.",
		["menu_cs_modifier_cloaker_tear_gas"] = "모든 HRT 유닛은 15%의 추가 확률로 타이탄 HRT이 됩니다.",
		["menu_cs_modifier_dozer_lmg"] = "그린 또는 블랙 불도저가 생성될 때마다 스컬도저로 교체될 가능성이 생깁니다.",
		["menu_cs_modifier_10secondsresponsetime"] = "모든 경찰 습격은 이제 최대 강도로 시작됩니다.",

		["bm_menu_skill"] = "팀원 부스트",

		["menu_crew_interact"] = "신속",
		["menu_crew_interact_desc"] = "플레이어의 상호 작용 속도가 다른 AI가 한 명씩 있을 때마다 15% 증가합니다.",

		["menu_crew_inspire"] = "인스파이어",
		["menu_crew_inspire_desc"] = "당신의 팀 AI가 인스파이어를 사용할 수 있습니다.\n\n매 90초마다 한 번 씩 인스파이어를 사용할 수 있습니다. 다른 AI가 한 명씩 있을 때마다 쿨타임이 15초씩 감소합니다.",

		["menu_crew_scavenge"] = "끈질김",
		["menu_crew_scavenge_desc"] = "플레이어가 3번의 어썰트 웨이브 후 1 다운을 회복합니다.\n\n다른 AI가 한 명씩 있을 때마다 요구되는 어썰트 웨이브의 수가 1씩 감소합니다.",

		["menu_crew_ai_ap_ammo"] = "관통탄",
		["menu_crew_ai_ap_ammo_desc"] = "당신의 팀 AI가 25% 추가 데미지를 주는 관통 탄환을 사용합니다.\n\nAI의 탄환이 적의 갑옷을 관통하고 실드를 넘어뜨립니다.",

		["menu_crew_healthy"] = "강화자",
		["menu_crew_healthy_desc"] = "플레이어의 체력이 30만큼 증가합니다.",

		["menu_crew_sturdy"] = "수호자",
		["menu_crew_sturdy_desc"] = "플레이어의 방탄량이 10만큼 증가합니다.",

		["menu_crew_evasive"] = "방해꾼",
		["menu_crew_evasive_desc"] = "플레이어의 회피 미터가 초당 회피의 3%씩 채워집니다.",

		["menu_crew_motivated"] = "활력꾼",
		["menu_crew_motivated_desc"] = "플레이어의 스태미나가 15만큼 증가합니다.",

		["menu_crew_regen"] = "치유자",
		["menu_crew_regen_desc"] = "플레이어가 매 4초마다 체력을 1 회복합니다.",

		["menu_crew_quiet"] = "은페자",
		["menu_crew_quiet_desc"] = "플레이어의 은페도가 2만큼 증가합니다.",

		["menu_crew_generous"] = "비축자",
		["menu_crew_generous_desc"] = "플레이어의 매 70킬마다 투척 무기를 한 개씩 회수합니다.",

		["menu_crew_eager"] = "가속자",
		["menu_crew_eager_desc"] = "플레이어의 장전 속도가 10%만큼 빨라집니다.",

--[[   SKILLTREES   ]]--
	--{

		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "의무병",
			["menu_combat_medic_beta_desc_sc"] = "베이직: ##$basic##\n당신이 팀원을 되살리는 동안과 그 이후 ##5##초간 ##10%##만큼의 피해 감소 효과를 받습니다.\n\n에이스: ##$pro##\n팀원을 되살릴때 ##30%##만큼 더 많은 체력을 추가로 회복시켜서 되살립니다.",

			--Quick Fix
			["menu_tea_time_beta_sc"] = "응급 치료",
			["menu_tea_time_beta_desc_sc"] = "베이직: ##$basic##\n당신의 구급 키트와 의료 가방의 배치시간이 ##50%##만큼 감소합니다.\n\n에이스: ##$pro##\n당신의 구급 키트을 사용한 사람은 ##5##초간 ##50%##만큼의 피해 감소를 받습니다.",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "진통제",
			["menu_fast_learner_beta_desc_sc"] = "베이직: ##$basic##\n당신이 되살린 팀원은 ##5##초간 피해 감소 효과 ##25%##만큼 받습니다.\n\n에이스: ##$pro##\n피해 감소량이 추가로 ##25%##만큼 늘어납니다.",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "각성제",
			["menu_tea_cookies_beta_desc_sc"] = "베이직: ##$basic##\n구급 키트의 소지량이 ##3##개 늘어납니다.\n\n에이스: ##$pro##\n구급 키트의 소지량이 ##3##개 더 늘어납니다.\n\n당신이 배치한 구급 키트는 구급 키트로부터 반경 ##5##미터 안에 플레이어가 다운된경우 자동으로 사용되어 다운을 방지합니다.\n\n이 효과는 플레이어마다 매 ##30##초당 한 번만 발동합니다.\n\n참고: 스완송에는 적용되지 않습니다",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "군의관",
			["menu_medic_2x_beta_desc_sc"] = "베이직: ##$basic##\n의료 가방의 사용 횟수를 ##1##번 더 늘려줍니다\n\n에이스: ##$pro##\n의료 가방의 소지 개수를 ##2##개로 늘려줍니다.",

			--Inspire
			["menu_inspire_beta_sc"] = "인스파이어",
			["menu_inspire_beta_desc_sc"] = "베이직: ##$basic##\n팀원을 되살리는 속도가 ##50%##만큼 상승합니다.\n\n팀원에게 소리치면 팀원의 이동 속도와 재장전 속도가 ##10##초간 ##20%##만큼 상습합니다.\n\n에이스: ##$pro##\n최대 ##9미터 안##에 ##시야를 확보한 상태##에서 다운된 팀원에게 소리치면 팀원을 되살립니다. 이 효과는 매 ##90##초 마다 한 번만 일어납니다.",


			--}

			--[[   CONTROLLER SUBTREE   ]]--
			--{

			--Cable Guy
			["menu_triathlete_beta_sc"] = "케이블 가이",
			["menu_triathlete_beta_desc_sc"] = "베이직: ##$basic##\n케이블 타이의 소지량이 ##4##개 늘어납니다.\n\n에이스: ##$pro##\n탄약 상자에서 케이블 타이를 획득할 확률이 ##30%##만큼 증가합니다\n\n최대 케이블 타이가 ##3##개 늘립니다.",

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "광대는 무섭다",
			["menu_cable_guy_beta_desc_sc"] = "베이직: ##$basic##\n시민들은 ##50%##만큼 더 오래 겁을 먹습니다.\n\n에이스: ##$pro##\n당신의 제압의 범위와 제압력이 ##50%##만큼 상승합니다.",

			--Stockholm Syndrome
			["menu_joker_beta_sc"] = "스톡홀름 증후군",
			["menu_joker_beta_desc_sc"] = "베이직: ##$basic##\n당신이 묶어둔 인질은 경찰들이 구조하여도 도망치려고 하지 않습니다.\n\n에이스: ##$pro##\n근처의 민간인과 조커가 있고 다운된 상태이면 그들과 상호 작용하면 일정 확률로 당신을 소생시키고 탄약을 줍니다.",

			--Joker
			["menu_stockholm_syndrome_beta_sc"] = "조커",
			["menu_stockholm_syndrome_beta_desc_sc"] = "베이직: ##$basic##\n일반 경찰이 당신을 위해 싸우게 만들 수 있습니다. 스텔스 도중에는 할 수 없고, 상대는 당신에게 제압당한 상태여야 합니다. 당신은 한 번에 한 명의 경찰만 전환시킬 수 있습니다.\n\n전환된 적은 받는 피해가 ##60%##만큼 감소합니다.\n\n스킬의 목적과 구금된 플레이어를 거래하기 위해 전환된 적은 인질로 간주됩니다.\n\n에이스: ##$pro##\n당신은 동시에 ##2##명의 전환된 적을 데리고 다닐 수 있습니다.\n\n전환된 적은 추가로 받는 피해가 ##20%##만큼 감소합니다.",

			--Partners in Crime
			["menu_control_freak_beta_sc"] = "공범",
			["menu_control_freak_beta_desc_sc"] = "베이직: ##$basic##\n당신은 인질 당 최대 ##4##명까지 당신의 이동 속도가 ##3%##만큼 상승합니다.\n\n에이스: ##$pro##\n당신은 인질 당 최대 ##4##명까지 당신의 최대 체력이 ##10%##씩 상승합니다.",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "인질범",
			["menu_black_marketeer_beta_desc_sc"] = "베이직: ##$basic##\n당신은 인질 당 최대 ##4##명까지 매 ##4##초마다 당신의 체력의 ##1##만큼 체력을 회복합니다.\n\n에이스: ##$pro##\n##4##명 이상의 인질이 있을 때 인질범의 체력 재생이 ##100%## 증가합니다.\n\n인질 당 최대 ##4##명까지 당신과 동료들이 받는 피해가 ##1##만큼 감소합니다.\n\n참고: 인질범은 중첩되지 않습니다.",


			--}

			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "리더쉽",
			["menu_stable_shot_beta_desc_sc"] = "베이직: ##$basic##\n기관단총과 경기관총의 안정성을 ##4##만큼 상승합니다.\n\n에이스: ##$pro##\n당신과 동료들의 모든 무기의 안정성을 ##4##만큼 상승시켜줍니다.",

			--MG Handling
			["menu_scavenger_sc"] = "기관총 핸들링",
			["menu_scavenger_desc_sc"] = "베이직: ##$basic##\n기관단총과 경기관총의 지향 사격 명중률이 ##20%##만큼 증가합니다.\n\n에이스: ##$pro##\n기관단총과 경기관총 재장전 속도가 ##25%##만큼 빨라집니다.",

			--MG Specialist
			["menu_sharpshooter_sc"] = "기관총 전문가",
			["menu_sharpshooter_desc_sc"] = "베이직: ##$basic##\n기관단총 및 경기관총의 이동 패널티에 대한 명중률이 ##60%##만큼 감소합니다.\n\n이동 패널티에 대한 명중률은 안정성에 따라 결정됩니다.\n\n에이스: ##$pro##\n기관단총와 경기관총의 발사 속도가 ##15%##만큼 빨라집니다.\n\n기관단총이나 경기관총으로 방아쇠를 놓지 않고 발사하면 ##5번째## 총알은 탄약을 소모하지 않습니다.",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "충격과 공포",
			["menu_spotter_teamwork_beta_desc_sc"] = "베이직: ##$basic##\n모든 무기의 장탄수가 ##20%##만큼 증가합니다.\n\n참고: 석궁, 활, 유탄 발사기 또는 로켓 발사기에는 적용되지 않습니다.\n\n에이스: ##$pro##\n달리면서 지향 사격이 가능해집니다.\n\n모든 무기의 장탄수가 추가로 ##30%##만큼 증가합니다.",

			--Heavy Impact
			["menu_speedy_reload_sc"] = "강력한 강타",
			["menu_speedy_reload_desc_sc"] = "베이직: ##$basic##\n경기관총으로 양각대를 사용하는 동안 ##40%## 확률로 적이 피격시 적을 쓰러뜨립니다.\n\n참고: 스태거 효과는 캡틴, 불도저 및 실드에게는 적용되지 않습니다.\n\n에이스: ##$pro##\n양각대를 사용하는 동안 받는 피해가 ##50%##만큼 감소합니다.",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "신체 전문지식",
			["menu_body_expertise_beta_desc_sc"] = "베이직: ##$basic##\n총알은 ##이제 방탄복을 관통할 수 있습니다.##\n\n자동으로 사격하는 기관단총와 경기관총은 적의 헤드샷 배율의 ##30%##가 몸통 사격에 적용됩니다.\n\n참고: 불도저에게는 적용되지 않습니다.\n\n에이스: ##$pro##\n자동으로 사격하는 모든 총은 적의 헤드샷 배율의 ##100%##가 몸통 사격에 적용됩니다.",

			--}
		--}

		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{

			--Underdog--
			["menu_underdog_beta_sc"] = "언더독",
			["menu_underdog_beta_desc_sc"] = "베이직: ##$basic##\n반경 ##18##m 이내에 적이 셋 이상 있을 경우, ##7##초 동안 공격력이 ##10%## 증가합니다.\n\n에이스: ##$pro##\n반경 ##18##m 이내에 적이 셋 이상 있을 경우, ##7##초 동안 입는 피해가 ##10%## 감소합니다.",

			--Shotgun CQB
			["menu_shotgun_cqb_beta_sc"] = "산탄총 CQB",
			["menu_shotgun_cqb_beta_desc_sc"] = "베이직: ##$basic##\n산탄총과 화염방사기의 정조준 속도가 ##75%##만큼 빨라집니다.\n\n에이스: ##$pro##\n산탄총과 화염방사기의 장전속도가 ##25%##만큼 빨라집니다.",

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "산탄총 임팩트",
			["menu_shotgun_impact_beta_desc_sc"] = "베이직: ##$basic##\n산탄총과 화염방사기의 안정성이 ##4##만큼 증가합니다\n\n에이스: ##$pro##\n산탄총은 ##3## 펠릿을 더 발사합니다.\n\n참고: 슬러그탄과 폭발탄에는 적용되지 않습니다.",

			--Pigeon Shooting
			["menu_far_away_beta_sc"] = "비둘기 사수",
			["menu_far_away_beta_desc_sc"] = "베이직: ##$basic##\n조준하는 동안 이동 속도가 ##60%##만큼 빨라집니다.\n\n에이스: ##$pro##\n산탄총과 화염방사기의 명중률와 사거리가 정조준하는 동안 ##30%##만큼 증가합니다.",

			--Gung Ho
			["menu_close_by_beta_sc"] = "궁호",
			["menu_close_by_beta_desc_sc"] = "베이직: ##$basic##\n산탄총과 화염방사기로 달리면서 지향 사격이 가능해집니다.\n\n에이스: ##$pro##\n산탄총과 화염방사기로 지향 사걱하는 동안 발사 속도가 ##35%##만큼 증가합니다.",

			--Overkill
			["menu_overkill_sc"] = "오버킬",
			["menu_overkill_desc_sc"] = "베이직: ##$basic##\n산탄총이나 화염방사기, 휴대용 톱으로 적을 처치할 경우, ##2##초 동안 산탄총과 휴대용 톱의 공격력이 ##50%##만큼 증가합니다.\n\n에이스: ##$pro##\n산탄총이나 휴대용 톱으로 적을 처치할 경우, ##10##초 동안 모든 무기의 공격력이 ##50%##만큼 증가합니다.\n\n참고: 유탄 발사기에는 적용되지 않습니다.\n\n산탄총과 톱의 교체 속도가 ##50%##만큼 빨라집니다.",

			--}

			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "기절 저항력",
			["menu_oppressor_beta_desc_sc"] = "베이직: ##$basic##\n당신이 가진 방어력 1점당 적의 근접 공격을 맞을때 ##0.25%##만큼 뒤로 밀려납니다.\n\n에이스: ##$pro##\n섬광탄을 비롯한 시각 교란의 지속 시간이 ##50%##만큼 감소합니다.",

			--Die Hard
			["menu_show_of_force_sc"] = "다이 하드",
			["menu_show_of_force_desc_sc"] = "베이직: ##$basic##\n굴절을 ##5##만큼 얻습니다.\n\n각 굴절 포인트마다 받는 체력 피해를 ##1%## 적게 하며 다른 형태의 피해 감소 후에 적용됩니다.\n\n에이스: ##$pro##\n추가로 굴절을 ##5##만큼 얻습니다.",

			--Transporter
			["menu_pack_mule_beta_sc"] = "트랜스포터",
			["menu_transporter_beta_desc_sc"] = "베이직: ##$basic##\n방어력 ##10##마다 가방의 이동속도 패널티가 ##0.5%##씩 감소합니다.\n\n에이스: ##$pro##\n이제 아무 가방을 들어도 질주할 수 있습니다.\n\n참고: 가방의 이동 패널티는 여전히 적용됩니다.",

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "더 많은 피, 더 많은 출혈",
			["menu_iron_man_beta_desc_sc"] = "베이직: ##$basic##\n추가 체력을 ##15%##만큼 얻습니다.\n\n에이스: ##$pro##\n추가로 ##25%##만큼의 추가 체력을 얻습니다.",

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "불스아이",
			["menu_prison_wife_beta_desc_sc"] = "베이직: ##$basic##\n헤드샷 성공시 ##3##초마다 ##5##씩 방어력을 회복합니다.\n\n에이스: ##$pro##\n헤드샷 성공시 ##3##초마다 추가로 ##30##씩 방어력을 회복합니다.",

			--Iron Man
			["menu_juggernaut_beta_sc"] = "철인",
			["menu_juggernaut_beta_desc_sc"] = "베이직: ##$basic##\n개량형 복합 전술 조끼를 착용할 수 있게 됩니다.\n\n에이스: ##$pro##\n실드를 근접 공격하면 넘어뜨립니다.\n\n원거리 무기로 실드을 공격할 때 일정 확률로 넘어뜨릴 수 있습니다. 무기의 총 데미지가 높을수록 넉백 확률이 증가합니다.\n\n방어력이 ##10%##만큼 더 빨리 회복됩니다.",


			--}

			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{

			--Scavenger
			["menu_scavenging_sc"] = "수색자",
			["menu_scavenging_desc_sc"] = "베이직: ##$basic##\n탄약 상자를 수급하는 범위가 ##50%##만큼 커집니다.\n\n에이스: ##$pro##\n매 ##5##번째로 죽인 적마다 하나의 탄약 상자가 추가로 생성됩니다.",

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "탄환폭풍",
			["menu_ammo_reservoir_beta_desc_sc"] = "베이직: ##$basic##\n이 스킬을 보유한 사람이 설치한 탄약 가방을 소모할 때, 공급받은 탄약량에 따라 소모 직후 최대 ##5##초까지 탄약 소모가 없어집니다.\n\n에이스: ##$pro##\n탄약 소모가 없어지는 시간이 최대 ##15##초로 늘어납니다.",

			--Specialist Equipment formally Rip and Tear
			["menu_portable_saw_beta_sc"] = "장비 전문가",
			["menu_portable_saw_beta_desc_sc"] = "베이직: ##$basic##\n톱으로 적을 공격할 때 톱날의 내구도가 ##50%##만큼 덜 감소됩니다.\n\n에이스: ##$pro##\n톱, 석궁, 활, 유탄 발사기 및 로켓 발사기의 재장전 속도가 ##25%##만큼 늘어납니다.",

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "추가 탄약통",
			["menu_ammo_2x_beta_desc_sc"] = "베이직: ##$basic##\n탄약 가방의 용량이 ##200%## 늘어납니다.\n\n에이스: ##$pro##\n탄약 가방의 휴대량이 ##2##개로 늘어납니다.",

			--Rip and Tear formally Carbon Blade
			["menu_carbon_blade_beta_sc"] = "찢고 죽인다",
			["menu_carbon_blade_beta_desc_sc"] = "베이직: ##$basic##\nOVE9000 전동톱이 실드의 방어를 무시하고 공격할 수 있습니다.\n\n에이스: ##$pro##\n적을 톱, 석궁, 활, 유탄 발사기 또는 로켓 발사기로 죽일 경우, 주변 ##10##m 이내의 적에게 ##50%## 확률로 패닉을 일으킵니다.\n\n패닉을 일으킨 적은 잠시 동안 공포에 질려 아무런 행동을 할 수 없습니다.",

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "완전무장",
			["menu_bandoliers_desc_sc"] = "베이직: ##$basic##\n소지 탄약이 ##25%##만큼 증가합니다.\n\n에이스: ##$pro##\n탄약 수급율이 ##50%##만큼 증가합니다.\n\n##5%## 확률로 탄약 상자에서 투척물을 회수할 수 있으며, 투척물을 얻을 때까지 얻지 못할 때마다 추가로 ##1%##씩 증가합니다.",

			--}
		--}

		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{

			--Logistician
			["menu_defense_up_beta_sc"] = "로지스티션",
			["menu_defense_up_beta_desc_sc"] = "베이직: ##$basic##\n도구와의 상호작용, 설치속도 ##25%##만큼 향상합니다.\n\n에이스: ##$pro##\n당신과 둉료들은 도구와의 상호작용, 설치속도 ##50%##만큼 향상합니다.",

			--Nerves of Steel--
			["menu_fast_fire_beta_sc"] = "강인한 정신",
			["menu_fast_fire_beta_desc_sc"] = "베이직: ##$basic##\n다운 상태에서 ##정조준을 할 수 있게 됩니다##.\n\n에이스: ##$pro##\n상호작용 중 입는 피해가 ##50%##만큼 감소합니다.",

			--Engineering
			["menu_eco_sentry_beta_sc"] = "엔지니어링",
			["menu_eco_sentry_beta_desc_sc"] = "베이직: ##$basic##\n센트리 건의 체력이 ##40%##만큼 증가합니다.\n\n에이스: ##$pro##\n센트리 건의 체력이 추가로 ##60%##만큼 증가합니다.",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "팔방미인",
			["menu_jack_of_all_trades_beta_desc_sc"] = "베이직: ##$basic##\n투척무기를 ##50%##만큼 소지 할 수 있습니다.\n\n에이스: ##$pro##\n주 장비와 함께 보조장비를 같이 소지할 수 있습니다. 주장비와 보조장비를 교체하려면 ##'X'## 키를 누르십시오.\n\n보조장비로 설정하여 가지고 온 장비는 ##50%##만 가지고 올 수 있습니다.",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "타워 디펜스",
			["menu_tower_defense_beta_desc_sc"] = "베이직: ##$basic##\n이제 센트리 건에서 철갑탄을 전환할 수 있으며 전환 시 발사 속도를 ##66%##만큼 낮추고 적과 실드를 관통할 수 있습니다.\n\n에이스: ##$pro##\n최대 ##2##개의 센트리 건을 휴대할 수 있습니다.\n\n센트리 건을 배치하는 데 최대 탄약의 ##35%##가 소모됩니다.",

			--Bulletproof--
			["menu_iron_man_sc"] = "방탄",
			["menu_iron_man_desc_sc"] = "베이직: ##$basic##\n방어구가 뚫리지 않습니다.\n\n에이스: ##$pro##\n방어구가 가득 차 있는 동안 받는 피해가 최대 방어력의 ##30%##만큼 감소합니다.\n\n방어구가 ##15%## 더 빨리 회복됩니다.",

			--}

			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "하드웨어 전문가",
			["menu_hardware_expert_beta_desc_sc"] = "베이직: ##$basic##\n드릴과 톱의 수리속도가 ##20%##증가합니다.\n\n드릴의 소음이 ##65%## 줄어듭니다.\n\n에이스: ##$pro##\n드릴과 톱의 수리속도가 추가로 ##30%##증가합니다.\n\n드릴과 톱은 무소음으로 설치됩니다. 시민과 경비원이 드릴이나 톱을 봐야 경고합니다.",

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "데인저 클로즈",
			["menu_combat_engineering_desc_sc"] = "베이직: ##$basic##\n트립 마인의 피해범위가 ##30%##만큼 증가합니다.\n\n에이스: ##$pro##\n트립 마인의 공격력이 ##50%##만큼 증가합니다.",

			--Drill Sawgeant
			["menu_drill_expert_beta_sc"] = "드릴 교관",
			["menu_drill_expert_beta_desc_sc"] = "베이직: ##$basic##\n드릴과 톱의 효율이 ##10%##만큼 증가합니다.\n\n에이스: ##$pro##\n드릴과 톱의 효율성을 ##20%##만큼 더 증가합니다.",

			--Demoman--
			["menu_more_fire_power_sc"] = "데모맨",
			["menu_more_fire_power_desc_sc"] = "베이직: ##$basic##\n성형작약탄 ##6##개, 트립마인 ##6##개를 소지합니다.\n\n성형작약탄과 트립마인을 ##20%##만큼 빠르게 설치합니다.\n\n에이스: ##$pro##\n성형작약탄 ##8##개, 트립마인 ##10##개를 더 소지합니다.\n\n성형작약탄과 트립마인을 추가로 ##20%##만큼 빠르게 설치합니다.",

			--Kickstarter
			["menu_kick_starter_beta_sc"] = "킥스타터",
			["menu_kick_starter_beta_desc_sc"] = "베이직: ##$basic##\n드릴과 톱이 고장났을 때 스스로 고쳐질 확률이 ##30%##만큼 증가합니다.\n\n에이스: ##$pro##\n##50%##의 확률로 드릴을 근접무기로 때려서 고칠 수 있습니다. 다만 기회는 드릴이 고장날 때마다 ##한 번##씩만 주어집니다.",

			--Fire Trap
			["menu_fire_trap_beta_sc"] = "화염 함정",
			["menu_fire_trap_beta_desc_sc"] = "베이직: ##$basic##\n##7.5##미터 반경에 ##10##초간 화염 데미지를 입힙니다.\n\n에이스: ##$pro##\n이제 ##11.25##미터 반경에 ##20##초 동안 화염 데미지를 입힙니다.",


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
			["menu_insulation_beta_sc"] = "절연갑옷",
			["menu_insulation_beta_desc_sc"] = "베이직: ##$basic##\n테이저의 전기 공격에 당하면 ##15%## 확률로 테이저를 넉백시킵니다.\n\n에이스: ##$pro##\n테이저의 전기 공격에 당한 직후 ##2##초 안에 상호작용 키를 누르면 감전시킨 테이저를 넉백 시키고 ##50##만큼 데미지를 줍니다.",


			--}

			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind
			["menu_scavenger_beta_sc"] = "새로운 활력",
			["menu_scavenger_beta_desc_sc"] = "베이직: ##$basic##\n방탄복이 부서지면 ##3##초 동안 이동속도가 ##10%##만큼 빨라집니다.\n\n에이스: ##$pro##\n방탄복이 완전히 부서진 상태로 첫 번째 공격을 가하면 근처에 있는 적이 비틀거리게 됩니다.\n\n이 효과는 방탄복이 재생된 후 ##3##초 동안 지속됩니다.",



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
			["menu_perseverance_desc_sc"] = "베이직: ##$basic##\n체력이 다 떨어졌을때 바로 쓰러지지 않고, ##3##초 동안 이동 속도 패널티를 ##60%##만큼 받으며 전투를 속행합니다.\n\n에이스: ##$pro##\n추가로 ##6##초 동안 전투를 속행할 수 있습니다.",



			--}

			--[[   BRAWLER SUBTREE   ]]--
			--{

			--Counter-Strike--
			["menu_drop_soap_beta_sc"] = "카운터 스트라이크",
			["menu_drop_soap_beta_desc_sc"] = "베이직: ##$basic##\n근접 무기를 뽑은 상태에서 클로커 킥을 막아내서 쓰러뜨릴 수 있습니다.\n\n클로커 킥과 테이저 전기 충격으로 인한 피해가 ##20%##만큼 감소합니다.\n\n에이스: ##$pro##\n근접 무기를 충전하는 동안 원거리 피해가 ##10%## 감소합니다.\n\n클로커 킥과 테이저 전기 충격으로 인한 피해가 추가로 ##30%##만큼 감소합니다.",

			--Bloodthirst--
			["menu_bloodthirst_sc"] = "피의 갈증",
			["menu_bloodthirst_desc_sc"] = "베이직: ##$basic##\n근접 공격으로 적을 죽이면 ##10##초 동안 장전 속도가 ##25%##만큼 빨라집니다.\n\n에이스: ##$pro##\n적을 처치할 때마다 다음 근접 공격 피해가 ##25%##씩 증가하고, 최대 ##100%##까지 증가합니다.\n\n이 효과는 근접 공격으로 적을 공격하면 초기화됩니다.",


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "깊은 주머니",
		["menu_thick_skin_beta_desc_sc"] = "베이직: ##$basic##\n근접 무기의 은닉성을 ##2##만큼 증가시킵니다.\n\n에이스: ##$pro##\n모든 방탄복의 내구도를 ##20##만큼 증가시킵니다.\n\n모든 방탄복의 은닉성을 ##4##만큼 증가시킵니다.",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "엄폐의 중요성",
		["menu_sprinter_beta_desc_sc"] = "베이직: ##$basic##\n스테미나의 회복 시작 시간을 ##25%##만큼 앞당기고 회복률도 ##25%##만큼 증가합니다.\n\n에이스: ##$pro##\n전력 질주하는 동안 회피 미터가 ##1##초마다 회피의 ##10%##만큼 채워집니다.\n\n지프 라인에 있는 동안 회피 미터가 ##1##초마다 회피의 ##30%##만큼 채워집니다.",

		--Sneaky Bastard--
		["menu_jail_diet_beta_desc_sc"] = "베이직: ##$basic##\n은닉성이 ##35##에서 ##3##씩 낮아질 수록 ##1%##의 회피 포인트를 최대 ##10%##까지 얻습니다.\n\n에이스: ##$pro##\n은닉성이 ##35##에서 ##1##씩 낮아질 수록 ##1%##의 회피 포인트를 최대 ##10%##까지 얻습니다.\n\n방탄복이 부서진 동안 공격을 회피하면 최대 체력의 ##6%##가 회복됩니다. 이것은 방탄복이 부서질 때마다 한 번만 발생합니다.",

		--Sharpshooter--
		["menu_discipline_sc"] = "명사수",
		["menu_discipline_desc_sc"] = "베이직: ##$basic##\n소총류의 안정성이 ##4##만큼 증가합니다.\n\n에이스: ##$pro##\n반자동으로 설정된 소총으로 헤드샷 할 시 ##10##초 동안 발사 속도를 ##20%##만큼 증가시킵니다.",

		--Kilmer--
		["menu_heavy_impact_beta_sc"] = "킬머",
		["menu_heavy_impact_beta_desc_sc"] = "베이직: ##$basic##\n소총류의 명중률이 ##5##만큼 증가합니다.\n\n에이스: ##$pro##\n소총류의 재장전 속도가 ##25%##만큼 빨라집니다.",

		--Mind Blown, formerly Explosive Headshot--
		["menu_kilmer_sc"] = "마인드 블로우",
		["menu_kilmer_desc_sc"] = "베이직: ##$basic##\n반자동으로 설정된 소총으로 헤드샷 할 시 ##4## 미터 반경에서 가장 가까운 적에게 입힌 피해의 ##70%##를 입힙니다.\n\n적에게서 ##7## 미터 떨어져 있을 때마다 효과가 추가 적에게 연결됩니다. 이 효과는 최대 ##4##번까지 됩니다.\n\n에이스: ##$pro##\n마인드 블로우의 반경이 ##1## 미터 증가합니다.\n\n적에게서 ##7## 미터 떨어져 있을 때마다 연쇄 효과가 추가로 ##10%##만큼 피해를 줍니다. 최대 총 ##110%##의 피해를 입힙니다.",

		--Ammo Efficiency--
		["menu_single_shot_ammo_return_sc"] = "효율적인 탄약 활용",
		["menu_single_shot_ammo_return_desc_sc"] = "베이직: ##$basic##\n##8##초안에 헤드샷을 ##3##번 성공하면 사용한 무기에 ##1##발을 혹은 ##3%## 총 탄약을 되돌려줍니다.\n\n에이스: ##$pro##\n이제 이 효과는 헤드샷을 ##2##번 맞힐 때 발동되며 탄약은 가능할 때마다 탄창으로 되돌립니다.",

		--Rifleman
		["menu_rifleman_sc"] = "라이플맨",
		["menu_rifleman_desc_sc"] = "베이직: ##$basic##\n모든 무기의 조준경 전환 속도가 ##50##만큼 상승합니다\n\n에이스: ##$pro##\n소총의 명중률과 사거리가 조준하는 동안 ##30##만큼 증가합니다.",

		--Aggressive Reload
		["menu_engineering_beta_sc"] = "공격적 재장전",
		["menu_engineering_beta_desc_sc"] = "베이직: ##$basic##\n반자동으로 설정된 소총으로 헤드샷 할 시 ##10##초 동안 재장전 속도를 ##25%##만큼 증가시킵니다.\n\n에이스: ##$pro##\n재장전 속도 보너스가 ##50%##만큼 증가하며 발사 모드와 상관없이 발동할 수 있습니다.",

		--Cleaner--
		["menu_jail_workout_sc"] = "청소부",
		["menu_jail_workout_desc_sc"] = "베이직: ##$basic##\n시체가방을 ##1##개 얻습니다.\n\n특수 적에게 ##5%##만큼 피해를 더 줍니다.\n\n에이스: ##$pro##\n시체 가방 케이스가 ##2##개로 증가합니다.\n\n특수 적에게 추가로 ##10%## 피해를 더 줍니다.",

		--Nimble--
		["menu_cleaner_beta_sc"] = "날렵함",
		["menu_cleaner_beta_desc_sc"] = "베이직: ##$basic##\n모든 자물쇠와 수갑을 ##50%##만큼 빨리 땁니다.\n\n에이스: ##$pro##\n이제 ##손으로 조용하게 금고를 딸 수 있습니다.##",

		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "식스 센스",
		["menu_chameleon_beta_desc_sc"] = "베이직: ##$basic##\n##3.5##초간 가만히 서있으면 ##10##미터 반경의 적을 마킹합니다.\n\n에이스: ##$pro##\n사전계획 요소들을 ##모두 언락합니다.##",

		--Systems Specialist--
		["menu_second_chances_beta_sc"] = "시스템 전문가",
		["menu_second_chances_beta_desc_sc"] = "베이직: ##$basic##\n카메라 루프 지속 시간이 ##20##초 증가합니다.\n\n모든 컴퓨터, 해킹, 카메라 및 ECM을 ##25%##만큼 빠르게 상호 작용합니다.\n\n에이스: ##$pro##\n적의 마킹 지속 시간을 ##100%##만큼 증가시키고 이제 스텔스에서 특수 적과 경비원을 아무 무기로 조준하여 마킹할 수 있습니다.\n\n모든 컴퓨터, 해킹, 카메라 및 ECM과 상호 작용하는 속도가 추가로 ##50%##만큼 빨라집니다.",

		--ECM Specialist--
		["menu_ecm_booster_beta_sc"] = "ECM 전문가",
		["menu_ecm_booster_beta_desc_sc"] = "베이직: ##$basic##\nECM가 ##3##개 증가합니다.\n\n에이스: ##$pro##\nECM가 ##4##개 증가합니다.",

		--ECM Overdrive--
		["menu_ecm_2x_beta_sc"] = "ECM 오버드라이브",
		["menu_ecm_2x_beta_desc_sc"] = "베이직: ##$basic##\nECM으로 ##전자보안문을 열 수 있습니다.##\n\nECM의 재밍 시간과 피드백 시간이 ##25%##만큼 증가합니다.\n\n에이스: ##$pro##\nECM의 재밍 시간과 피드백 시간이 추가로 ##25%##만큼 증가합니다.\n\n재밍 시간동안 페이저를 막을 수 있습니다.",

		--Evasion--
		["menu_awareness_beta_sc"] = "위기모면",
		["menu_awareness_beta_desc_sc"] = "베이직: ##$basic##\n이동 속도가 ##5%##만큼 증가합니다.\n\n낙하 피해가 ##75%##만큼 감소합니다.\n\n에이스: ##$pro##\n달리면서 재장전할 수 있습니다.",

		--Moving Target--
		["menu_dire_need_beta_sc"] = "움직이는 표적",
		["menu_dire_need_beta_desc_sc"] = "베이직: ##$basic##\n은닉성이 ##35##에서 ##3##씩 낮아질 수록 최대 ##15%##까지 이동 속도가 ##1.5%##만큼 증가합니다.\n\n에이스: ##$pro##\n은닉성이 ##35##에서 ##1##씩 낮아질 수록 최대 ##15%##까지 이동 속도가 ##1.5%##만큼 증가합니다.\n\n총이나 근접 공격으로 뒤에서 적을 죽이면 회피 미터가 ##75%##만큼 채워집니다.",

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "착시 현상",
		["menu_optic_illusions_desc_sc"] = "베이직: ##$basic##\n소음기의 은닉성이 ##1##만큼 증가합니다.\n\n에이스: ##$pro##\n소음기의 은닉성이 추가로 ##1##만큼 증가합니다\n\n소음기 낀 무기를 꺼내고 넣는 속도가 ##25%##만큼 증가합니다.",

		--The Professional--
		["menu_silence_expert_beta_sc"] = "프로페셔널",
		["menu_silence_expert_beta_desc_sc"] = "베이직: ##$basic##\n소음기 무기의 안정성이 ##5##만큼 증가합니다.\n\n에이스: ##$pro##\n소음기 무기로 특수 적을 처치하면 추가 탄약 상자를 떨굽니다.",

		--Unseen Strike, formally Dire Need--
		["menu_backstab_beta_sc"] = "기습 공격",
		["menu_backstab_beta_desc_sc"] = "베이직: ##$basic##\n##3##초 동안 피해를 입지 않는다면, 피해를 입을 때까지 치명타 확률을 ##15%##만큼 얻습니다.\n\n치명타의 피해가 추가로 ##100%##만큼 증가합니다.\n\n에이스: ##$pro##\n기습 공격의 치명타 확률이 피해를 입은 후 ##4##초 동안 지속됩니다.",

		--Spotter--
		["menu_hitman_beta_sc"] = "스포터",
		["menu_hitman_beta_desc_sc"] = "베이직: ##$basic##\n마킹된 적은 피해를 ##15%##만큼 입습니다.\n\n에이스: ##$pro##\n마킹된 적이 ##20## 미터 이상 있을 때 추가로 피해를 ##30%##만큼 입습니다.",

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "로 블로",
		["menu_unseen_strike_beta_desc_sc"] = "베이직: ##$basic##\n은닉성이 ##35##에서 ##3##씩 낮아질 수록 ##3%##의 치명타 확률을 최대 ##30%##까지 얻습니다.\n\n치명타의 피해가 추가로 ##100%##만큼 증가합니다.\n\n에이스: ##$pro##\n은닉성이 ##35##에서 ##1##씩 낮아질 수록 ##3%##의 치명타 확률을 최대 ##30%##까지 얻습니다.\n\n총이나 근접 공격으로 뒤에서 적을 공격할 때 치명타 확률이 추가로 ##50%##만큼 증가합니다.",

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "이퀼리브리엄",
		["menu_equilibrium_beta_desc_sc"] = "베이직: ##$basic##\n당신과 당신의 동료들의 권총의 안정성이 ##4##만큼 증가합니다.\n\n에이스: ##$pro##\n권총의 뽑고 넣는 시간이 ##100%##만큼 빨라집니다.",

		--Gun Nut--
		["menu_dance_instructor_sc"] = "총기광",
		["menu_dance_instructor_desc_sc"] = "베이직: ##$basic##\n권총의 지향 사격 명중률을 ##20%##만큼 증가합니다.\n\n에이스: ##$pro##\n권총의 발사 속도가 ##15%##만큼 빨라집니다.\n\n권총은 ##이제 방탄복을 관통할 수 있습니다.##",

		--Over Pressurized/Gunfighter--
		["menu_gun_fighter_sc"] = "총잡이",
		["menu_gun_fighter_desc_sc"] = "베이직: ##$basic##\n권총의 장전 속도가 ##5%##만큼 빨라집니다.\n\n권총의 명중률에 대한 이동 패널티가 ##40%##만큼 감소합니다.\n\n명중률에 대한 이동 패널티는 안정성에 의해 결정됩니다.\n\n에이스: ##$pro##\n권총의 장전 속도가 추가로 ##25%##만큼 빨라집니다.",

		--Akimbo--
		["menu_akimbo_skill_sc"] = "아킴보",
		["menu_akimbo_skill_desc_sc"] = "베이직: ##$basic##\n아킴보 총기의 안정성이 ##16##만큼 상승합니다.\n\n에이스: ##$pro##\n아킴보 총기의 탄약과 탄약 회수가 ##25%##만큼 늘어납니다",

		--Desperado--
		["menu_expert_handling_sc"] = "데스페라도",
		["menu_expert_handling_desc_sc"] = "베이직: ##$basic##\n권총으로 헤드샷 할 시 ##4##초 동안 무기의 명중률과 사거리를 ##8%##만큼 증가시킵니다. 이 효과는 ##5##번 중첩될 수 있으며 각 중첩의 지속 시간은 권총 헤드샷 할 시 다시 되돌려집니다.\n\n에이스: ##$pro##\n명줄률 및 사거리 증가 지속 시간이 ##10##초로 증가합니다.",

		--Trigger Happy--
		["menu_trigger_happy_beta_sc"] = "난사광",
		["menu_trigger_happy_beta_desc_sc"] = "베이직: ##$basic##\n권총으로 헤드샷 할 시 ##4##초 동안 데미지를 ##10%##만큼 증가시킵니다. 이 효과는 ##5##번 중첩될 수 있으며 각 중첩의 지속 시간은 권총으로 헤드샷 할 시 다시 되돌려집니다.\n\n에이스: ##$pro##\n데미지 증가 지속 시간이 ##10##초로 증가합니다.",

		--Running From Death--
		["menu_nine_lives_beta_sc"] = "죽음으로부터의 도주",
		["menu_nine_lives_beta_desc_sc"] = "베이직: ##$basic##\n일어난 뒤 ##10##초 동안 이동속도가 ##25%##만큼 빨라집니다.\n\n에이스: ##$pro##\n일어난 뒤 ##10##초 동안 데미지 감소 효과를 ##20%##만큼 얻습니다.\n\n무기가 일어난 뒤 즉시 재장전됩니다.",

		--Undying--
		["menu_running_from_death_beta_sc"] = "불사",
		["menu_running_from_death_beta_desc_sc"] = "베이직: ##$basic##\n출혈 체력이 ##100%##만큼 증가합니다.\n\n에이스: ##$pro##\n출혈 체력이 추가로 ##100%##만큼 증가합니다.\n\n출혈 상태에서 주 무기를 사용할 수 있습니다.",

		--What Doesn't Kill You Only Makes You Stronger--
		["menu_what_doesnt_kill_beta_sc"] = "죽지 않는 것",
		["menu_what_doesnt_kill_beta_desc_sc"] = "베이직: ##$basic##\n구금에 가까워질 때마다 받는 피해가 ##1##만큼 감소합니다.\n\n에이스: ##$pro##\n받는 피해가 추가로 ##3##만큼 감소합니다.",

		--Haunt--
		["menu_haunt_sc"] = "저주",
		["menu_haunt_desc_sc"] = "베이직: ##$basic##\n구금에 가까워질 때마다 ##18## 미터 내의 적을 죽이면 ##5%## 확률로 패닉이 퍼집니다.\n\n패닉은 적을 공포로 내몰게 만듭니다.\n\n에이스: ##$pro##\n적의 패닉 확률이 추가로 ##15%##만큼 증가합니다.",

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "구세주",
		["menu_pistol_beta_messiah_desc_sc"] = "베이직: ##$basic##\n쓰러질 동안 적을 사살하면 바로 일어날 수 있습니다. ##1##번의 기회만 주어지고 구금 상태에서 풀릴 때 다시 채워집니다.\n\n처음으로 구금되기 전까진 추가로 ##한 번## 더 다운될 수 있습니다.\n\n에이스: ##$pro##\n이제 구세주를 제한 없이 사용 가능하지만 ##120##초의 재사용 대기시간이 생깁니다. 쓰러진 상태에서 적을 처치하면 재사용 대기시간이 ##10##초 만큼 감소합니다.",

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "무술의 달인",
		["menu_martial_arts_beta_desc_sc"] = "베이직: ##$basic##\n훈련의 성과로, 모든 근접 공격으로 입는 피해가 ##50%##만큼 줄어듭니다.\n\n에이스: ##$pro##\n훈련의 성과로, 근접 공격으로 적을 쓰러뜨릴 확률이 ##50%##만큼 늘어납니다.",

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "펌핑 아이언",
		["menu_steroids_beta_desc_sc"] = "베이직: ##$basic##\n근접 무기를 휘두르고 충전하는 속도가 ##20%##만큼 빨라집니다.\n\n에이스: ##$pro##\n근접 무기를 휘두르고 중전하는 속도가 추가로 ##30%##만큼 빨라집니다.",

		--Frenzy--
		["menu_wolverine_beta_sc"] = "광분",
		["menu_wolverine_beta_desc_sc"] = "베이직: ##$basic##\n당신의 최대 체력이 ##25%##으로 고정되고 그 이상으로 회복될 수 없습니다.\n\n##20## 굴절을 얻지만 ##더 이상 회복할 수 없습니다.##\n\n각 굴절 포인트마다 받는 피해를 ##1%## 적게 하며 다른 형태의 피해 감소 후에 적용됩니다.\n\n에이스: ##$pro##\n추가로 ##25## 굴절을 얻지만 치료량이 ##75%##만큼 감소합니다.",

		--Berserker--
		["menu_frenzy_sc"] = "버서커",
		["menu_frenzy_desc_sc"] = "베이직: ##$basic##\n체력이 낮을수록 공격력이 상승합니다.\n\n체력이 ##50%## 미만일 때 근접 공격과 톱의 공격력이 ##150%##만큼 증가합니다.\n\n에이스: ##$pro##\n체력이 낮을수록 공격력이 상승합니다.\n\n체력이 ##50%## 미만일 때 총기류의 공격력이 ##75%##만큼 증가합니다."

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "회피",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "헤드샷 데미지가 ##25%만큼 증가합니다.##\n\n##25%##만큼 많은 피해를 입힙니다. 투척 무기, 유탄 발사기 또는 로켓 발사기에는 적용되지 않습니다.",
		["menu_deckall_4_desc_sc"] = "은닉성이 ##+1##만큼 증가합니다.\n\n방탄복 착용 시 이동 속도 저하가 ##15%## 감소합니다.\n\n일차와 작업을 완료하면 경험치를 ##45%##만큼 얻습니다.\n\n##25%##만큼 많은 피해를 입힙니다. 투척 무기, 유탄 발사기 또는 로켓 발사기에는 적용되지 않습니다.",
		["menu_deckall_6_desc_sc"] = "당신과 당신의 팀원이 사용할 수 있는 투척 무기 케이스 장비를 잠금 해제합니다. 투척 무기 케이스는 하이스트 중에 투척 무기를 보충하는 데 사용할 수 있습니다.\n\n##25%##만큼 많은 피해를 입힙니다. 투척 무기, 유탄 발사기 또는 로켓 발사기에는 적용되지 않습니다.",
		["menu_deckall_8_desc_sc"] = "의료 가방의 상호 작용 속도가 ##20%만큼 빨라집니다.##\n\n##25%## 더 많은 피해를 입힙니다. 투척 무기, 유탄 발사기 또는 로켓 발사기에는 적용되지 않습니다.",

		--Crook--
		["menu_st_spec_6_desc_sc"] = "크룩은 다재다능한 범죄자입니다. 사기꾼이란 단어는 범죄란 단어처럼 역사가 깊은 단어입니다.\n\n크룩은 진정한 팔방미인입니다. 그는 자신이 원하는 것이 있다면 훔치고, 거짓말하고, 속이고, 어떠한 일이더라도 할 것입니다.\n\n\n\n전체 특전 덱의 이점:\n##-##회피 포인트가 ##5##만큼 증가합니다.\n##-##방탄 조끼의 경우 회피가 추가로 ##10##만큼 증가합니다.\n##-##방탄 조끼의 방어력이 ##50%##만큼 증가합니다.",
		["menu_deck6_1_desc_sc"] = "회피가 ##5##만큼 증가합니다.\n\n방어 조끼의 경우 방어도가 ##15%##만큼 증가합니다.",
		["menu_deck6_3_desc_sc"] = "방탄조끼류의 회피 포인트가 추가로 ##5##만큼 증가합니다.",
		["menu_deck6_5_desc_sc"] = "방탄조끼류의 방어력이 추가로 ##15%##만큼 증가합니다.",
		["menu_deck6_7_desc_sc"] = "방탄조끼류의 회피 포인트가 추가로 ##5##만큼 증가합니다.",
		["menu_deck6_9_desc_sc"] = "방탄조끼류의 방어력이 추가로 ##20%##만큼 증가합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Rogue
		["menu_st_spec_4_desc_sc"] = "로그는 야비한 수단과 치명적인 힘을 둘 다 가진 은밀한 범죄자입니다. 다재다능하고 모두를 잘 속일수 있기에, 로그는 좀도둑질뿐만 아니라 사기까지 모든 일을 할 수 있습니다.\n\n로그의 트레이드마크라면 다재다능함이죠. 로그는 화력이 부족하더라도 그만의 기술로 커버할 수 있습니다.\n\n\n\n전체 특전 덱의 이점:\n##-##회피가 ##15##만큼 증가합니다.\n##-##무기를 교체하는 속도가 ##30%##만큼 빨라집니다.\n##-##일어날 때 회피 미터가 정상 최대치의 ##200%##까지 채워집니다.\n##-##공격을 회피하면 다음 ##20##초 동안 ##2##초마다 체력이 ##1##씩 회복됩니다. 이 효과는 중첩될 수 있지만 체력 피해를 입을 때마다 모든 중첩이 손실됩니다.",
		["menu_deck4_1_desc_sc"] = "회피 포인트가 ##5##만큼 증가합니다.\n\n무기를 교체하는 속도가 ##30%## 빨라집니다.",
		["menu_deck4_3_desc_sc"] = "회피 포인트가 추가로 ##5##만큼 증가합니다.",
		["menu_deck4_5_desc_sc"] = "일어날 때 회피 미터가 정상 최대치의 ##200%##까지 채워집니다.",
		["menu_deck4_7_desc_sc"] = "회피 포인트가 추가로 ##5##만큼 증가합니다.",
		["menu_deck4_9_desc_sc"] = "공격을 회피하면 다음 ##20##초 동안 ##2##초마다 체력이 ##1##씩 회복됩니다. 이 효과는 중첩될 수 있지만 체력 피해를 입을 때마다 모든 중첩이 손실됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Hitman--
		["menu_deck5_1_sc"] = "건푸",
		["menu_deck5_3_sc"] = "훈련된 암살자",
		["menu_deck5_5_sc"] = "연필로",
		["menu_deck5_7_sc"] = "전문 암살자",

		["menu_st_spec_5_desc_sc"] = "히트맨은 범죄의 뒷골목에서 온 근접전뿐만 아니라 원거리전에도 능통한 프로 암살자입니다.\n\n범죄단은 자신들의 힘을 보여주거나, 보복을 하거나, 경쟁자를 제거하기 위한 마지막 수단으로 히트맨을 고용할 것입니다.\n\n\n\n\n전체 특전 덱의 이점:\n##-##근접 무기 외로 적을 죽이면 ##25## 임시 체력이 생깁니다. 최대 ##120##까지 임시 체력을 저장할 수 있습니다. 근접 공격으로 적을 죽이면 저장된 임시 체력이 초당 ##5##씩 감소하는 임시 체력으로 바뀝니다. 임시 체력은 일반 최대 체력을 초과할 수 있지만 한 번에 최대 ##240## 임시 체력만 가질 수 있습니다. 참고: 광분은 임시 체력을 ##75%만큼 감소합니다.##\n##-##방어력이 회복되면 회피 미터가 회피의 ##100%##만큼 채워집니다.\n##-##회피가 ##5##만큼 증가합니다.\n##-##임시 체력이 있는 동안 굴절이 ##20## 증가하고 이동 속도가 ##20%## 증가합니다.",
		["menu_deck5_1_desc_sc"] = "근접 외로 적을 죽이면 ##25## 임시 체력이 생깁니다. 최대 ##75##의 체력을 저장할 수 있습니다.\n\n근접 공격으로 적을 죽이면 저장된 체력이 초당 ##5##의 속도로 감소하는 임시 체력으로 바뀝니다.\n\n임시 체력은 일반 최대 체력을 초과할 수 있지만 한 번에 최대 ##240## 임시 체력만 가질 수 있습니다.\n\n참고: 광분은 일시적인 체력을 ##75%만큼 감소시킵니다.##",
		["menu_deck5_3_desc_sc"] = "방어력이 회복되면 회피 미터가 회피의 ##100%##만큼 채워집니다.\n\n추가로 회피 포인트를 ##5##만큼 얻습니다.",
		["menu_deck5_5_desc_sc"] = "임시 체력을 ##60%##만큼 더 저장합니다.",
		["menu_deck5_7_desc_sc"] = "일어나면 임시 체력을 ##120##만큼 얻습니다.\n\n추가로 회피 포인트를 ##5##만큼 얻습니다.",
		["menu_deck5_9_desc_sc"] = "임시 체력이 있는 동안 ##20## 굴절 및 ##20%## 추가 이동 속도를 얻습니다.\n\n각 굴절 포인트마다 받는 체력 피해를 ##1%## 적게 하며 다른 형태의 피해 감소 후에 적용됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Muscle
		["menu_st_spec_2_desc_sc"] = "머슬은 자신의 마피아 간부들의 말을 폭력으로 전하는 터프가이입니다. 그들은 모든 범죄조직의 중심입니다.\n\n누군가가 다른사람을 때리고, 다리를 부러트리고, 머리를 박살내고, 누가 짱인지를 보여줘야할때, 머슬이 제 역할을 할 것입니다.\n\n\n전체 특전 덱의 이점:\n##-##체력을 ##40%## 더 얻습니다.\n##-##총을 사용하여 ##적들 사이에 공포를 퍼뜨릴 수 있습니다.##\n##-##일어난 후 최대 체력의 ##25%##를 얻습니다.",
		["menu_deck2_1_desc_sc"] = "체력을 ##10%##만큼 얻습니다.",
		["menu_deck2_3_desc_sc"] = "체력을 추가로 ##10%##만큼 얻습니다.",
		["menu_deck2_5_desc_sc"] = "체력을 추가로 ##10%##만큼 얻습니다.",
		["menu_deck2_7_desc_sc"] = "총으로 발사할 때 마다 ##5%## 확률로 적들에게 패닉를 퍼뜨릴 수 있습니다.\n\n패닉은 적을 공포에 질려 짧은 파열로 제어할 수 없게 만듭니다.",
		["menu_deck2_9_desc_sc"] = "추가로 체력을 ##10%##만큼 얻습니다.\n\n일어난 후 최대 체력의 ##25%##를 회복합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Crew Chief
		["menu_st_spec_1_desc_sc"] = "카포레짐으로도 알려져 있는 크루 치프는 마피아의 일부를 이끌 수 있는 고위 간부를 말합니다. 크루 치프는 그의 하수인과 동료들에게 지시를 하고 곧바로 보스와 그의 오른팔에게 보고합니다.\n\n범죄단이 처리할 일이 필요하다면, 크루 치프와 그의 동료들이 그 일을 제대로 처리할 것입니다.\n\n\n전체 특전 덱의 이점:\n##-##체력을 ##15%##만큼 얻습니다.\n##-##외침 거리가 ##25%##만큼 증가합니다.\n##-##방어력을 ##10%##만큼 얻습니다.\n##-##당신과 당신의 팀원이 스태미나를 ##50%##만큼 더 얻습니다.\n##-##팀원의 체력이 ##5%##만큼 증가합니다.\n##-##각 인질이 있을 때마다 당신과 당신의 팀원은 최대 ##5%## 최대 체력과 ##10%## 스태미나를 ##4##번 얻습니다.",
		["menu_deck1_3_desc_sc"] = "당신과 당신의 팀원의 스태미나가 ##50%##만큼 증가합니다.\n\n외침 거리가 ##25%##만큼 증가합니다.\n\n참고: 팀원의 퍽과 중첩되지 않습니다.",
		["menu_deck1_5_desc_sc"] = "당신과 당신의 팀원의 체력이 ##5%## 많이 얻습니다.\n\n참고: 팀원의 퍽은 중첩되지 않습니다.",
		["menu_deck1_7_desc_sc"] = "방어력을 ##10%##만큼 얻습니다.",
		["menu_deck1_9_desc_sc"] = "각 인질이 있을 때마다 당신과 당신의 팀원은 ##5%## 최대 체력과 ##10%## 스태미나를 최대 ##4##번 얻습니다.\n\n참고: 팀원의 퍽과 중첩되지 않습니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",
		
		--Armorer--
		["menu_st_spec_3_desc_sc"] = "아머러는 군대에 있었던 직책이었습니다. 아머러는 갑옷을 유지, 보수, 개량하는것이 자신의 일입니다.\n\n어느 범죄조직이라도 모두가 효율적인 일처리를 수행할 수 있게끔 충분한 보호구를 제공해 줄 수 있는 사람이 필요할 것입니다.\n\n\n\n전체 특전 덱의 이점:\n##-##방어력을 ##25%##만큼 얻습니다.\n##-##방어구 회복 속도가 ##20%##만큼 증가합니다.",
		["menu_deck3_1_desc_sc"] = "방어력을 ##10%##만큼 얻습니다.",
		["menu_deck3_3_desc_sc"] = "방어력을 추가로 ##10%##만큼 얻습니다.",
		["menu_deck3_5_desc_sc"] = "방어력을 추가로 ##5%##만큼 얻습니다.",
		["menu_deck3_7_desc_sc"] = "방어구 회복률이 ##10%##만큼 증가합니다.",
		["menu_deck3_9_desc_sc"] = "방어구 회복률이 추가로 ##10%##만큼 증가합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Burglar--
		["menu_st_spec_7_desc_sc"] = "버글러의 타고난 민첩함은 단순히 쳐부수고 들어가는 것을 넘어섭니다. 버글러의 재빠름은 자물쇠를 따는것과 시체를 처리하는것, 그리고 페이저에 응답하는것을 빠르게 하게 합니다.\n\n또한 그들은 전투에서 피격되기 힘듭니다. 그들은 대개 싸움에서 벗어나는 방법으로 살아남습니다.\n\n\n\n전체 특전 덱의 이점:\n##-##회피 포인트가 ##15##만큼 증가합니다.\n##-##웅크리고 있는 동안 회피 미터가 1초마다 회피의 ##10%##만큼 채워집니다.\n##-##시체 가방을 싸는 시간이 ##20%##만큼 빨라집니다.\n##-##락픽 시간이 ##20%##만큼 빨라집니다.\n##-##페이저에 응답하는 속도가 ##10%##만큼 빨라집니다.\n##-##방어구 회복률이 ##10%##만큼 증가합니다.\n##-##웅크리고 있을 때 이동 속도가 ##10%##만큼 증가합니다.",		
		["menu_deck7_1_desc_sc"] = "회피 포인트가 ##5##만큼 증가합니다.\n\n웅크리고 있는 동안 회피 미터가 1초마다 회피의 ##5%##만큼 채워집니다.",
		["menu_deck7_3_desc_sc"] = "추가로 회피 포인트가 ##5##만큼 증가합니다.\n\n시체 가방을 싸는 시간이 ##20%##만큼 빨라집니다.",
		["menu_deck7_5_desc_sc"] = "락픽 시간이 ##20%##만큼 빨라집니다.\n\n웅크리고 있는 동안 회피 미터가 1초마다 회피의 ##5%##만큼 채워집니다.",
		["menu_deck7_7_desc_sc"] = "회피 포인트가 추가로 ##5##만큼 증가합니다.\n\n페이저에 응답하는 속도가 ##10%##만큼 빨라집니다.",
		["menu_deck7_9_desc_sc"] = "방어구 회복률이 ##10%##만큼 증가합니다.\n\n웅크리고 있을 때 이동 속도가 ##10%##만큼 증가합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Gambler--
		["menu_st_spec_10_desc_sc"] = "운은 보기 힘든 재능입니다. 고대 그리스인들은 운을 신들만이 만들어 줬다고 믿었습니다. 이는 사실이 아닙니다. 운을 타고난 사람들도 존재하지만, 운은 만들어 낼 수도 있습니다. 이를 위해서는 준비와, 모든 것이 계획대로 이루어지게 하여 수익을 최대한으로 끌어들일 수 있는 치밀한 고려가 필요합니다. 운의 여신을 기다리는 것이 아니라, 카드들을 전부 기억해 두는 것이죠.\n\n갬블러 특성 덱은 지원형 덱입니다. 모두가 팀이 승리하도록 도울 수 있지만, 갬블러는 팀이 크게 승리하도록 돕습니다.\n\n전체 특전 덱의 이점:\n##-##획득한 탄약 상자가 ##8##에서 ##12##의 체력을 치료하는 의약품을 생성합니다. 매 ##10##초마다 한 번 밖에 일어나지만, 탄약 상자를 얻을 때마다 이를 ##3##에서 ##5##초씩 감소시킵니다.\n##-##탄약 상자를 획득하고 회복되면:\n당신의 팀원들도 ##탄약을 얻습니다##.\n탄약 상자로 치료할 때 회피 미터가 회피의 ##100%##만큼 채워집니다.\n당신의 팀원이 ##50%##만큼 치유됩니다.\n방어력을 ##30##만큼 얻습니다.\n##-##회피 포인트를 ##10##만큼 얻습니다.",		
		["menu_deck10_1_desc_sc"] = "획득한 탄약 상자가 ##8##~##12##의 체력을 치료하는 의약품을 생성합니다.\n\n매 ##10##초마다 한 번 밖에 일어나지만, 탄약 상자를 얻을 때마다 이를 ##3##~##5##초씩 감소시킵니다.",
		["menu_deck10_3_desc_sc"] = "탄약 상자를 획득하고 회복되면, 당신의 팀원들도 ##탄약을 얻습니다##.\n\n회피 포인트를 ##5##만큼 얻습니다.",
		["menu_deck10_5_desc_sc"] = "탄약 상자로 얻는 회복률을 ##2##만큼 추가로 증가합니다.\n\n탄약 상자를 획득하고 회복되면 회피 미터가 회피의 ##100%##만큼 채워집니다.",
		["menu_deck10_7_desc_sc"] = "탄약 상자를 획득하고 치유되면 당신의 팀원들도 ##50%##만큼 치유됩니다.\n\n회피 포인트를 ##5##만큼 얻습니다.",
		["menu_deck10_9_desc_sc"] = "탄약 상자로 얻는 회복률을 ##2##만큼 추가로 증가합니다.\n\n탄약 상자를 획득하고 회복되면 방어구도 ##30##만큼 회복합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Infiltrator--
		["menu_st_spec_8_desc_sc"] = "인필트레이터는 정부나 거대 범죄단에서 적의 정보를 알아내기 위해서나 기업에서 경쟁사의 기밀을 알아내기 위해 고용되는 요원입니다.\n\n인필트레이터는 전투에서 주변환경을 이용하는 근접전의 전문가입니다.\n\n\n전체 특전 덱의 이점:\n##-##적과 ##12##미터 이내에 있으면 적에게 받는 피해가 ##20%##만큼 감소합니다.\n##-##근접 공격이 적중할 때마다 ##10##초 동안 근접 피해가 ##16%##만큼 추가로 증가하며 최대 ##5##번 중첩될 수 있습니다.\n##-##근접 공격이 적중할 때마다 ##10##초 동안 ##1.25##초마다 체력이 ##1##씩 회복되며 최대 ##5##번 중첩됩니다.",
		["menu_deck8_1_desc_sc"] = "적과 ##12##미터 이내에 있으면 적에게 받는 피해가 ##5%##만큼 감소합니다.",
		["menu_deck8_3_desc_sc"] = "적과 ##12##미터 이내에 있으면 적에게 받는 피해가 ##5%##만큼 추가로 감소합니다.",
		["menu_deck8_5_desc_sc"] = "적과 ##12##미터 이내에 있으면 적에게 받는 피해가 ##10%##만큼 추가로 감소합니다.\n\n근접 공격이 적중할 때마다 ##10##초 동안 근접 피해가 ##8%##만큼 추가로 증가하며 최대 ##5##번 중첩될 수 있습니다.",
		["menu_deck8_7_desc_sc"] = "근접 공격이 적중할 때마다 ##10##초 동안 근접 피해가 ##8%##만큼 추가로 증가하며 최대 ##5##번 중첩될 수 있습니다.",
		["menu_deck8_9_desc_sc"] = "근접 공격이 적중할 때마다 ##10##초 동안 ##1.25##초마다 체력이 ##1##씩 회복되며 최대 ##5##번 중첩됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Sociopath--
		["menu_st_spec_9_desc_sc"] = "소시오패스는 범죄자중 가장 유용한 타입중 하나로 알려져 있습니다. 유용하기도 하지만, 상대하기에는 벅차기 때문에, 큰 조직들은 이들을 기피합니다.\n\n대담하고, 막을수 없고, 사악하기에, 소시오패스는 대부분의 잔혹한 일에 뛰어납니다. 자신이 저지르는 범죄에 대한 죄책감 따윈 없기에, 그들은 위험한 적이됩니다.\n\n\n전체 특전 덱의 이점:\n##-##적과 ##18##미터 이내에 있으면 적에게 받는 피해가 ##5%##만큼 감소합니다.\n##-##적을 죽이면 방어력이 ##40##만큼  재생됩니다. 매 ##3##초마다 한 번만 일어납니다.\n##-##근접 무기로 적을 죽이면 체력이 ##5%##만큼 회복됩니다. 매 ##3##초마다 한 번만 일어납니다.\n##-## ##18## 미터 이내의 적을 죽이면 ##25%## 확률로 적들에게 퍼뜨립니다. 매 ##2##초마다 한 번만 일어납니다.",
		["menu_deck9_1_sc"] = "말 없는",
		["menu_deck9_1_desc_sc"] = "##18미터## 내에 3명 이상의 적에게 둘러싸여 있을 때 적에게 받는 피해가 ##5%## 감소합니다.",
		["menu_deck9_3_desc_sc"] = "적을 죽이면 방어력이 ##20##만큼 재생됩니다.\n\n매 ##3##초마다 한 번만 일어납니다.",
		["menu_deck9_5_desc_sc"] = "근접 무기로 적을 죽이면 체력이 ##5%##만큼 회복됩니다.\n\n매 ##3##초마다 한 번만 일어납니다.",
		["menu_deck9_7_desc_sc"] = "##18## 미터 이내의 있는 적을 죽이면 ##20## 방어구가 재생됩니다.\n\n매 ##3##초마다 한 번만 일어납니다.",
		["menu_deck9_9_desc_sc"] = "##18## 미터 이내의 있는 적을 죽이면 ##25%## 확률로 적들에게 패닉을 퍼뜨립니다.\n\n패닉은 적을 공포에 질려 짧은 파열로 제어할 수 없게 만듭니다.\n\n매 ##2##초마다 한 번만 일어납니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Grinder--
		["menu_st_spec_11_desc_sc"] = "전형적인 그라인더는 열심히 일하고, 어려운 상황들 속에서도 흔들리지 않고 상황을 해결할 수 있습니다. \n\n그라인더는 항상 전방에 서고, 여러 처벌들을 이겨내 가며, 그가 얼마나 피해를 받든지 간에 적에게 피해를 줘 살아날수 있는 점에 크게 의존하고 있습니다.\n\n\n전체 특전 덱의 이점:\n##-##적에게 피해를 입히면 ##5##초 동안 1초마다 체력이 ##3##씩 회복됩니다. 이 효과는 최대 ##5##번까지 중첩되며 매 ##0.5##초마다 한 번만 일어나고 방편복을 착용한 상태에서만 발생합니다. 센트리 또는 지속 피해 효과로 적에게 피해를 입혀도 중첩이 부여되지 않습니다.\n##-##방편복을 착용하는 동안 방어력을 ##80##만큼 잃습니다.\n##-##모든 중첩이 이동 속도를 ##5%##만큼 증가시킵니다.",
		["menu_deck11_1_desc_sc"] = "적에게 피해를 입히면 ##3##초 동안 1초마다 체력이 ##3##씩 회복됩니다.\n\n이 효과는 최대 ##5##번까지 중첩되며 매 ##0.5##초마다 한 번만 일어나고 ##방편복을 착용한 상태에서만 발생합니다.## 센트리 또는 지속 피해 효과로 적에게 피해를 입혀도 중첩이 부여되지 않습니다.\n\n방편복을 착용하는 동안 방어력을 ##80##만큼 잃습니다",
		["menu_deck11_3_desc_sc"] = "중첩이 1초마다 ##1## 체력을 추가로 회복합니다.",
		["menu_deck11_5_desc_sc"] = "중첩이 ##2##초 동안 추가로 지속됩니다.",
		["menu_deck11_7_desc_sc"] = "중첩이 1초마다 ##1## 체력을 추가로 회복합니다.",
		["menu_deck11_9_desc_sc"] = "모든 중첩이 이동 속도를 ##5%##만큼 증가시킵니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Open your mind--
		["menu_st_spec_13_desc_sc"] = "엑스-프레지던트들은 가장 대담한 하이스터들 중 한 부류입니다. 상당한 위험부담을 감수하면서도 전우들과 같이 행동합니다. 그들은 반드시 죽게 된다는 사실에 대해 두려움을 느끼지 않기에 똘똘 뭉치게 되었고 지금과 같은 위치에 도달하게 되었습니다.\n\n엑스-프레지던트는 어떤 규율도 따르지 않고, 자연을 존중하기 위한 몇가지 시험인 오자키 8 만을 고수합니다.\n\n\n전체 특전 덱의 이점:\n##-##방어력이 있는 동안 적을 ##1##명씩 죽일때 마다 체력을 ##8##만큼 저장합니다. 방어력이 완전히 부서진 후 재생되기 시작하면 저장된 체력만큼 체력을 얻습니다. 저장할 수 있는 최대 체력은 장착한 방탄복에 따라 다릅니다.\n##-##적을 처치하면 방탄복의 양에 따라 방어력 회복 시간이 빨라집니다. 갑옷이 많을수록 처치당 회복 속도가 줄어듭니다. 방어력 회복 속도는 방어력이 회복될 때마다 초기화됩니다.\n##-##회피 포인트가 ##10##만큼 증가합니다.",
		["menu_deck13_1_desc_sc"] = "방어력이 있는 동안 적을 ##1##명씩 죽일때 마다 체력을 ##4##만큼 저장합니다.\n\n방어력이 완전히 부서진 후 재생되기 시작하면 저장된 체력만큼 체력을 얻습니다.\n\n저장할 수 있는 최대 체력은 장착한 방탄복에 따라 다르며, 무거운 방탄복일 수록 가벼운 방탄복보다 체력을 저장할 수 있는 양이 적어집니다.",
		["menu_deck13_3_desc_sc"] = "처치 시 저장할 수 있는 체력이 ##2##만큼 증가합니다.\n\n회피 포인트가 ##5##만큼 증가합니다.",
		["menu_deck13_5_desc_sc"] = "저장할 수 있는 최대 체력이 ##25%## 증가합니다.",
		["menu_deck13_7_desc_sc"] = "처치 시 저장할 수 있는 체력이 ##2##만큼 증가합니다.\n\n회피 포인트가 ##5##만큼 추가로 증가합니다.",
		["menu_deck13_9_desc_sc"] = "적을 처치하면 장착한 방탄복에 따라 방어구 회복 속도가 빨라집니다. 무거운 갑옷일 수록 가벼운 갑옷보다 적은 보너스를 얻습니다. 이 보너스는 방어력이 회복될 때마다 초기화됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--THIS IS WAR BABY--
		["menu_st_spec_14_desc_sc"] = "매니악 특성 덱은 위험의 순간에도 나쁜 확률 따위 신경쓰지 않는 광기의 상징입니다. 계속 밀어붙이면서 지속적으로 대미지를 가하면, 당신의 팀원은 일시적인 보호를 느끼며 지미의 무적과 같은 영혼을 잠시나마 느끼게 될 것입니다.\n\n\n\n\n\n전체 특전 덱의 이점:\n##-##당신이 입힌 피해가 히스테리 스택으로 전환됩니다. 최대 스택 수는 ##2400##입니다. 히스테리 스택: 히스테리가 ##240## 스택될 때마다 받는 피해가 ##1.5##만큼 감소합니다. 히스테리 스택은 ##8##초마다 ##240##씩 감소합니다.\n##-##당신의 팀원 또한 당신의 히스테리 스택의 효과를 얻습니다.",
		["menu_deck14_1_desc_sc"] = "당신이 입힌 피해가 히스테리 스택으로 전환됩니다. 최대 스택 수는 ##2400##입니다.\n\n히스테리 스택:\nI받는 피해가 히스테리의 ##400## 중첩마다 ##1## 포인트만큼 감소합니다. 히스테리 스택은 ##8##초마다 ##400##씩 감소합니다.",
		["menu_deck14_5_desc_sc"] = "히스테리 스택의 감소를 ##8##초마다 ##300##으로 변경합니다.",
		["menu_deck14_7_desc_sc"] = "이제 히스테리의 ##300## 중첩마다 받는 피해가 ##1##만큼 감소합니다.",
		["menu_deck14_9_desc_sc"] = "히스테리 스택이 ##100%## 더 강력합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Anarchist--
		["menu_st_spec_15_desc_sc"] = "아나키스트는 공권력이 사람들을 지도해야 한다고 믿지 않고 사람들은 스스로 자기 자신을 보호할 수 있다고 생각하는 사람들입니다.권력에 저항하는 방해 행위와 폭력은 더 좋은 결과를 내기 위한 수단일 뿐입니다. 아나키스트는 싸움에서 도망치지 않고 언제나 무력에 대항할 것입니다. 아나키스트는 돈만 밝히며 싸우는 것이 아니라 파괴 자체를 즐기기 때문에 진정한 도움이 될 것입니다.\n\n\n전체 특전 덱의 이점:\n##-##아나키스트는 전투 중이 아닐 때 갑옷을 완전히 재생하는 대신 초당 ##8##만큼 방탄복과 동일한 속도로 방어력을 주기적으로 재생합니다. 방탄복이 무거울 수록 틱당 많은 방어력을 재생하지만 틱 사이에는 긴 재생 시간이 있습니다.\n##-## 체력의 ##50%##가 ##150%##만큼 방어구로 변환됩니다.\n##-##피해를 입히면 방어력이 부여됩니다. 이것은 매 ##3##초마다 한 번만 발생합니다. 방탄복이 무거울 수록 많은 방어력이 부여됩니다.",
		["menu_deck15_1_desc_sc"] = "아나키스트는 전투 중이 아닐 때 갑옷을 완전히 재생하는 대신 초당 ##8##만큼 방탄복과 동일한 속도로 방어력을 주기적으로 재생합니다. 방탄복이 무거울 수록 틱당 많은 방어력을 재생하지만 틱 사이에는 긴 재생 시간이 있습니다.\n\n참고: 이 퍽 덱을 사용할 때 방어구 회복 속도를 증가시키는 스킬과 퍽은 비활성화됩니다.",
		["menu_deck15_3_desc_sc"] = "체력의 ##50%##가 ##50%##만큼 방어구로 전환됩니다.",
		["menu_deck15_5_desc_sc"] = "체력의 ##50%##가 ##100%##만큼 방어구로 전환됩니다.",
		["menu_deck15_7_desc_sc"] = "체력의 ##50%##가 ##150%##만큼 방어구로 전환됩니다.",
		["menu_deck15_9_desc_sc"] = "피해를 입히면 방어력이 부여됩니다. 이것은 매 ##3##초마다 한 번만 발생합니다. 방탄복이 무거울 수록 많은 방어력이 부여됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Scarface--
		["menu_st_spec_17_desc_sc"] = "킹핀은 대장, 어떠한 변덕을 부릴지라도 복종해야할 군주입니다. 허나 그전에 먼저 돈이 있어야 합니다. 그리고 돈을 얻었다면, 힘을 가질 수 있죠. 기억하십시오, 이 세상에서 당신에게 명령할 수 있는 유일한 존재는...당신의 배짱 뿐입니다.\n\n\n\n\n\n전체 특전 덱의 이점:\n##-##킹핀 주사기를 잠금 해제하고 장착합니다. 주사기를 활성화하면 ##6##초 동안 받은 모든 피해의 ##30%##만큼 치유됩니다. 효과 중에도 여전히 피해를 입을 수 있습니다. 주사기는 매 ##30##초마다 한 번만 사용할 수 있습니다.\n##-##킹핀 주사기가 활성화되어 있는 동안 이동 속도가 ##20%##만큼 증가합니다.\n##-##주사기가 활성화되어 있는 동안 주변의 적들은 가능할 때마다 당신을 조준하는 것을 집중합니다.\n##-##체력이 ##25%## 미만일 때 주사기 효과를 받는 동안 받는 체력이 ##60%##만큼 증가합니다.\n##-##최대 체력일 때 주사기 효과 동안 얻은 체력 ##3##마다 주사기 재충전 시간이 ##1##초만큼 감소합니다.",
		["menu_deck17_1_desc_sc"] = "킹핀 주사기를 잠금 해제하고 장착합니다. 다른 특전 덱으로 변경하면 주사기를 사용할 수 없게 됩니다. 주사기는 현재 투척무기을 대체하고 던질 수 있는 슬롯에 장착되어 있으며 원하는 경우 전환할 수 있습니다.\n\n게임 중에 투척무기 키를 사용하여 주사기를 활성화할 수 있습니다. 주사기를 활성화하면 ##4##초 동안 받는 모든 피해의 ##30%##만큼 치유됩니다.\n\n효과 중에도 여전히 피해를 입을 수 있습니다. 주사기는 매 ##30##초마다 한 번만 사용할 수 있습니다.",
		["menu_deck17_3_desc_sc"] = "킹핀 주사기가 활성화되어 있는 동안 이동 속도가 ##20%##만큼 증가합니다.",
		["menu_deck17_5_desc_sc"] = "이제 킹핀 주사기가 활성화된 동안 ##6##초 동안 받는 모든 피해의 ##30%##만큼 치유됩니다.\n\n주사기가 활성화되어 있는 동안 주변의 적들은 가능할 때마다 당신을 조준하는 것을 집중합니다.",
		["menu_deck17_7_desc_sc"] = "체력이 ##25%## 미만일 때 주사기 효과를 받는 동안 받는 체력이 ##60%##만큼 증가합니다.",
		["menu_deck17_9_desc_sc"] = "최대 체력일 때 주사기 효과 동안 얻은 체력 ##5##마다 주사기 재충전 시간이 ##1##초만큼 감소합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--10 feet higher--
		["menu_st_spec_18_desc_sc"] = "시카리오는 모든 마약 카르텔의 필수요소입니다. 모든 종류의 골칫거리를 대부분 치명적인 방법으로 해결하는 사람입니다. 시카리오는 절대 싸움에서 몸을 내빼지 않으며, 망설임이나 두려움없이 임무를 완수합니다.\n\n\n\n\n\n전체 특전 덱의 이점:\n##-##투척무기인 연막탄을 잠금 해제하고 장비합니다. 연막탄을 배치하면 ##12##초 동안 지속되는 연막이 생성됩니다. 연막탄 안에 서 있는 동안, 당신과 당신의 아군은 방어력을 ##100%## 더 빠르게 재생하고 적의 정확도가 ##75%##만큼 감소합니다. 연기가 사라진 후 연막탄의 재사용 대기시간은 ##40##초이지만 적을 죽이면 이 재사용 대기시간이 ##1##초 감소합니다.\n##-##공격을 회피하면 연막탄의 재사용 대기시간이 ##1##초 감소합니다.\n##-##연막 안에 있는 동안 회피 미터가 1초마다 회피의 ##40%##만큼 채워집니다.\n회피 포인트가 ##15##만큼 증가합니다.",
		["menu_deck18_1_desc_sc"] = "회피 포인트가 ##5##만큼 증가합니다.\n\n투척무기인 연막탄을 잠금 해제하고 장비합니다.\n\n연막탄을 배치하면 ##12##초 동안 지속되는 연막이 생성됩니다. 연막탄 안에 서 있는 동안, 당신과 당신의 아군은 방어력을 ##100%## 더 빠르게 재생하고 적의 정확도가 ##75%##만큼 감소합니다\n\n연막탄의 재사용 대기시간은 ##40##초이지만 적을 죽이면 이 재사용 대기시간이 ##1##초 감소합니다.",
		["menu_deck18_3_desc_sc"] = "회피 포인트가 ##5##만큼 추가로 증가합니다.",
		["menu_deck18_5_desc_sc"] = "공격을 회피하면 연막탄의 재사용 대기시간이 ##1##초 감소합니다.",
		["menu_deck18_7_desc_sc"] = "회피 포인트가 ##5##만큼 추가로 증가합니다.",
		["menu_deck18_9_desc_sc"] = "연막 안에 있는 동안 회피 미터가 1초마다 회피의 ##40%##만큼 채워집니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Sweet liquor eases the pain--
		["menu_st_spec_19_desc_sc"] = "당신의 결의와 침착함은 쓰러지지 않는 벽과 같습니다. 정신 단련은 금욕주의자로 하여금 다른 이들이 울부짖으며 전율하는 돌무더기로 만드는 문제조차 이겨낼 수 있게 도와줍니다. 수도승에게 배운 호흡법과 신체의 행동-통제는 적이 당신에게 무엇을 끼얹든간에 충분히 임무를 끝마치게끔 지켜줄 것입니다.\n\n\n\n전체 특전 덱의 이점:\n##-##금욕주의자의 힙 플라스크를 잠금 해제하고 장착합니다. 받는 피해의 ##30%##가 시간에(##8##초)에 걸쳐 적용됩니다. 힙 플라스크를 활성화하면 시간 경과에 따른 피해를 즉시 무효화됩니다. 지속 피해가 무효화될 때마다 남은 지속 피해의 ##250%##만큼 치유합니다. 플라스크의 재사용 대기시간은 ##30##입니다.\n##-##모든 방어구가 ##50%##만큼 체력으로 전환됩니다.\n##-##적을 죽일 때마다 플라스크의 재사용 대기시간이 ##1##초씩 감소합니다.\n##-## ##4##초 동안 피해를 입지 않으면 모든 지속 피해가 무효화됩니다.\n##-##체력이 ##50%## 미만이면 플라스크의 재사용 대기시간이 적을 죽일 때마다 ##6##초씩 감소합니다.\n##-##일어날 때 최대 체력의 ##25%##만큼 회복합니다.",
		["menu_deck19_1_desc_sc"] = "금욕주의자의 힙 플라스크를 잠금 해제하고 장착합니다.\n\n받는 피해의 ##30%##가 시간에(##8##초)에 걸쳐 적용됩니다.\n\n투척무기 키를 눌러 힙 플라스크를 활성화하면 시간 경과에 따른 피해를 즉시 무효화됩니다.\n\n지속 피해가 무효화될 때마다 남은 지속 피해의 ##300%##만큼 치유합니다. 플라스크의 재사용 대기시간은 ##30##입니다.\n\n모든 ##방어구가 50%만큼## 체력으로 전환됩니다.",
		["menu_deck19_3_desc_sc"] = "적을 죽일 때마다 플라스크의 재사용 대기시간이 ##1##초씩 감소합니다.",
		["menu_deck19_5_desc_sc"] = "##4##초 동안 피해를 입지 않으면 모든 지속 피해가 무효화됩니다.",
		["menu_deck19_7_desc_sc"] = "체력이 ##50%## 미만이면 플라스크의 재사용 대기시간이 적을 죽일 때마다 ##6##초씩 감소합니다.",
		["menu_deck19_9_desc_sc"] = "일어날 때 최대 체력의 ##25%##만큼 회복합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--it's not a war crime if they're not people--
		["menu_st_spec_20_desc_sc"] = "어떤 경험들은 서로 공유할 때 더 값진 법이고, 오감을 돋구는 가스를 방출하는 기계의 경우에는 더더욱 맞는 말입니다. 당신과 같은 특별한 하이스터를 위해서. 이것은 은행 금고에서 물건들을 훔치거나 일을 처리할 때 같이 나눠서 즐길 수 있는 물건입니다.\n\n\n\n\n\n전체 특전 덱의 이점:\n##-##가스 방사기를 잠금 해제하고 장비합니다. 가스 디스펜서를 활성화하려면 ##18## 미터 반경 내에서 시야가 확보된 상태에서 다른 아군 유닛을 보고 투척무기 키를 눌러 태그를 지정해야 합니다. 당신이나 태그로 지정된 유닛이 적을 죽일 때마다 ##15##만큼 체력을 회복하고 태그로 지정된 유닛의 체력을 ##7.5##만큼 회복합니다. 적을 죽일 때마다 효과 지속 시간이 ##2##초씩 늘어납니다. 효과는 ##12##초 동안 지속되며 재사용 대기시간은 ##60##초입니다.\n##-##당신이나 태그가 붙은 유닛을 죽일 때마다 최대 ##20##까지 흡수를 ##1##만큼 부여합니다. 이 효과는 퍽 덱 아이템의 재사용 대기시간이 끝날 때까지 지속됩니다.\n##-##적을 죽이면 재사용 대기시간이 ##2##초씩 감소합니다.\n##-##태그로 지정된 유닛이 적을 죽일 때마다 더 이상 짝을 이루지 않을 때까지 퍽 덱 아이템 재사용 대기시간이 ##2##초씩 감소합니다.",
		["menu_deck20_1_desc_sc"] = "가스 방사기를 잠금 해제하고 장비합니다.\n\n가스 방사기를 활성화하려면 ##18## 미터 반경 내에서 시야가 확보된 상태에서 다른 아군 유닛을 보고 투척무기 키를 눌러 태그를 지정해야 합니다.\n\n당신이나 태그로 지정된 유닛이 적을 죽일 때마다 ##8##만큼 체력을 회복하고 태그로 지정된 유닛의 체력을 ##5##만큼 회복합니다.\n\n효과는 ##11##초 동안 지속되며 재사용 대기시간은 ##80##초입니다.",
		["menu_deck20_3_desc_sc"] = "당신이나 태그로 지정된 유닛이 적을 죽이면 가스 방사기의 지속 시간이 ##2##초만큼 증가합니니다. 이 증가는 발생할 때마다 ##0.2##초씩 감소합니다.",
		["menu_deck20_5_desc_sc"] = "당신이나 태그로 지정된 유닛이 적을 죽일 때마다 당신이 받는 피해가 가가스 방사기의 효과와 재사용 대기시간이 끝날 때까지 ##0.5##만큼 최대 ##8##만큼 감소합니다.",
		["menu_deck20_7_desc_sc"] = "가스 방사기의 치유량이 ##100%## 증가합니다.",
		["menu_deck20_9_desc_sc"] = "적을 죽일 때마다 가스 방사기의 재사용 대기시간이 ##2##초씩 감소합니다.\n\n태그가 지정된 유닛이 더 이상 짝을 이루지 않을 때까지 적을 죽일 때마다 가스 디스펜서의 재사용 대기시간이 ##2##초 씩 감소합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Biker--
		["menu_st_spec_16_desc_sc"] = "바이커 갱은 전 세계에서 두려움의 대상이며, 가장 거대한 조직은 어느 누구나 알고 있을정도 입니다. 바이커가 되기 위해선 터프함과 충성심, 그리고 조직의 규칙이 절대적이란것에 대한 이해가 필요합니다. 바이커들은 무자비하고 폭력적인것으로 알려져 있으며, 감히 바이커에게 거스르는 대상이 누구든 도전하는것을 절대 두려워하지 않습니다.\n\n\n\n전체 특전 덱의 이점:\n##-##당신이나 당신의 팀원이 적을 죽일때마다 당신은 ##2##만큼 체력을 회복합니다. 매 ##2##초마다 한 번만 발생할 수 있습니다.\n##-####3##초마다 방어구를 ##10##만큼 재생합니다.\n##-##방어력을 ##25%##만큼 손실될 때마다 처치 재생을 위한 재사용 대기시간이 ##0.5##초 감소하고 처치로 얻는 회복이 ##2.##만큼 증가합니다.\n##-## ##2.5##초마다 방어구를 ##10##만큼 추가로 재생합니다. 근접 무기로 적을 죽이면 즉시 이 효과가 발동되고 다음 방어구 재생 틱이 ##1##초 더 빨리 발생합니다.",
		["menu_deck16_1_desc_sc"] = "당신이나 당신의 팀원이 적을 죽일때마다 당신은 ##2##만큼 체력을 회복합니다. 매 ##2##초마다 한 번만 발생할 수 있습니다.",
		["menu_deck16_3_desc_sc"] = "##3##초마다 방어구를 ##10##만큼 재생합니다.",
		["menu_deck16_5_desc_sc"] = "방어력을 ##25%##만큼 손실될 때마다 처치 재생을 위한 재사용 대기시간이 ##0.5##초 감소합니다",
		["menu_deck16_7_desc_sc"] = "이제 ##2.5##초마다 방어구를 ##30## 재생합니다.\n\n근접 무기로 적을 죽이면 즉시 이 효과가 발동되고 다음 방어구 재생 틱이 ##1##초 더 빨리 발생합니다.",
		["menu_deck16_9_desc_sc"] = "방어력을 ##25%##만큼 손실될 때마다 처치로 얻는 체력 수가 ##2##만큼 증가합니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Yakuza--
		["menu_st_spec_12_desc_sc"] = "야쿠자는 세계에서 가장 두려운 폭력조직 중 하나입니다. 야쿠자는 임협으로 다스려지고 오야붕에게 통솔되며, 엄격한 행동 강령과 조직성, 그리고 전신을 감싸는 문신으로 잘 알려져 있습니다. 사회로부터 추방되고 낙오된 야쿠자들은 자기 자신을 보호하기 위해 어떻게 행동해야 하는지 알고 있습니다. 그들이 관대해 보이더라도, 결코 가볍게 봐서는 안됩니다.\n\n\n전체 특전 덱의 이점:\n##-##체력이 50% 이하일 때:\n회피 미터가 초당 회피의 최대 ##8%##만큼 채워집니다.\n적을 죽였을 때 회피 미터가 회피의 최대 ##50%##만큼 채워집니다.\n근접 공격에서 적을 죽일 때 회피 미터가 회피의 최대 ##50%##만큼 채워집니다(효과 2와 중첩 가능).\n받는 피해가 최대 ##20%## 감소합니다.\n##-##다운당 한 번, 다운할려고 하면 대신 체력 ##1##만큼 남은 상태로 생존하고 방어구를 ##50##만큼 회복합니다.",
		["menu_deck12_1_desc_sc"] = "체력이 낮을수록 회피 미터가 더 빨리 채워집니다. 체력이 ##50%## 미만이면 회피 미터가 초당 회피의 최대 ##8%##만큼 채워집니다.\n\n회피 포인트가 ##5##만큼 증가합니다.",
		["menu_deck12_3_desc_sc"] = "체력이 낮을수록 적을 죽일 때 회피 미터가 채워집니다. 체력이 ##50%## 이하일 때, 회피 미터가 회피의 최대 ##50%##만큼 채워집니다.",
		["menu_deck12_5_desc_sc"] = "체력이 낮을수록 받는 피해가 줄어듭니다. 체력이 ##50%## 미만일 때 받는 피해가 최대 ##20%## 감소합니다.",
		["menu_deck12_7_desc_sc"] = "체력이 낮을수록 근접 공격으로 적을 죽일 때 회피 미터가 채워집니다. 체력이 ##50%## 이하일 때, 회피 미터가 회피의 최대 ##50%##만큼 채워집니다.\n\n이 효과는 뱀 문신과 중첩이 됩니다.",
		["menu_deck12_9_desc_sc"] = "다운당 한 번, 다운할려고 하면 대신 체력 ##1#만큼 남은 상태로 생존하고 ##50## 방어구를 회복합니다.\n\n참고: 이 효과는 클로커 킥과 테이저 전기충격로 인한 다운에는 적용되지 않으며 효과는 다시 돌아오지 않습니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Hacker--
		["menu_st_spec_21_desc_sc"] = "여러분의 날카로운 두뇌와 장비를 사용해, 여러분은 어떤 보안 시스템이라도 버튼 하나 누르는 것만으로 무릎을 꿇게 만들 수 있습니다. 여러분은 어떤 카메라나 보안 경비에게도 들키지 않을 테지만, 일이 엉망이 되어도 여러분은 적 무전을 듣는 이들에게 끔찍한 깜짝 선물을 줘서 손쉽게 뚤고 나갈 수 있을 것입니다.\n\n\n\n\n전체 특전 덱의 이점:\n##-##휴대용 ECM 재머를 잠금 해제하고 장비합니다. 알람이 울리기 전에 휴대용 ECM 재머를 활성화하면 방해 효과가 발생하여 ##12##초 동안 모든 전자 장치와 호출기가 비활성화됩니다. 알람이 발생한 후 휴대용 ECM 재머을 활성화하면 피드백 효과가 발동되어 ##12##초 동안 맵에 있는 적을 1초마다 기절시킬 확률을 부여합니다. 휴대용 ECM 재머에는 ##1##씩 충전되고 ##80##초의 재사용 대기시간 타이머가 있지만, 적을 죽일 때마다 재사용 대기시간이 ##3##초 단축됩니다.\n##-##피드백 효과가 활성화된 상태에서 적을 죽이면 ##20##의 체력이 회복됩니다. 피드백 효과가 활성화된 상태에서 팀원이 적을 죽이면 ##10##의 체력이 회복됩니다.\n##-##방어구 회복률이 ##10% 증가합니다.##\n##-##회피 포인트가 ##10##만큼 증가합니다.",
		["menu_deck21_1_desc_sc"] = "##휴대용 ECM 재머##를 잠금 해제하고 장착합니다.\n\n게임 내에서 투척무기 키를 사용하여 휴대용 ECM 재머를 활성화할 수 있습니다.\n\n알람이 울리기 전에 휴대용 ECM 재머를 활성화하면 방해 효과가 발생하여 ##12##초 동안 모든 전자 장치와 페이저를 비활성화합니다.\n\n알람이 발생한 후 휴대용 ECM 재머를 활성화하면 피드백 효과가 발동되어 ##12##초 동안 맵의 적을 1초마다 기절시킬 확률을 부여합니다.\n\n휴대용 ECM 재머에는 ##1## 충전과 ##80##초의 재사용 대기시간 타이머가 있지만 적을 처치할 때마다 재사용 대기시간이 ##3##초 단축됩니다.",
		["menu_deck21_3_desc_sc"] = "회피 포인트가 ##5##만큼 증가합니다.",
		["menu_deck21_5_desc_sc"] = "피드백 효과가 활성화된 상태에서 적을 죽이면 ##20##의 체력이 회복됩니다.",
		["menu_deck21_7_desc_sc"] = "방어구 회복률이 ##10% 증가합니다.\n\n회피 포인트가 ##10##만큼 추가로 증가합니다.",
		["menu_deck21_9_desc_sc"] = "피드백 효과가 활성화된 상태에서 팀원이 적을 죽이면 체력을 ##10##만큼 회복됩니다.\n\n덱 완성 보너스: PAYDAY 도중 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "백지 덱",
		["menu_st_spec_0_desc"] = "이 덱은 장점이 전혀 없습니다.",
		["menu_st_spec_00"] = "와일드카드 덱",
		["menu_st_spec_00_desc"] = "이 덱은 공유 스킬만 있습니다.",
		["menu_deck0_1"] = "",
		["menu_deck0_1_desc"] = "",
	})
end)