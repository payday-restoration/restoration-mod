Month = os.date("%m")
Day = os.date("%d")
local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
	local eggplant = restoration and restoration.Options:GetValue("OTHER/ForceEggs/Upotte")
	local my_wife = restoration and restoration.Options:GetValue("OTHER/ForceEggs/MyWife")
	local bobcat = restoration and restoration.Options:GetValue("OTHER/ForceEggs/CrabBattle")
	local shitpost = restoration and restoration.Options:GetValue("OTHER/ForceEggs/BigMan")
	local registeredloser = restoration and restoration.Options:GetValue("OTHER/ForceEggs/EmberMyBeloved")

Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "부스트",
		["menu_es_crew"] = "동료",
		["menu_es_personal"] = "개인",
		["menu_es_bad"] = "심함",
		["menu_es_other"] = "기타",
		["RestorationPDTHHudNeeded"] = "PD:TH HUD REBORN이 필요합니다!",
		["menu_paygrade"] = "급여 등급: ",
		["menu_diffgrade"] = "난이도: ",
		["menu_utility_radial_menu_name"] = "유틸리티 방사형 메뉴",
		["menu_utility_radial_menu_desc"] = "유틸리티 메뉴를 엽니다.",

		["res_credits"] = "레스토레이션 모드 크레딧",
		["res_credits_help"] = "레스토레이션 모드의 크레딧을 봅니다.",

		["Warning_overhaul_title"] = "경고: 저장 데이터가 손상되는 것을 방지하기 위해 게임을 종료합니다.",
		["dialog_show_overhaul_dialog"] = "Complete Overhaul 옵션을 비활성화하고 있습니다. 일반적으로 비활성화하는걸 권장되지 않으며, 오버홀을 자주 하고 싶지 않다면 mods 폴더에서 모드를 제거해야 합니다.\n\n게임은 $TIME초 후 자동으로 종료되거나 '확인'을 누르면 종료됩니다.",
		["dialog_enable_overhaul_dialog"] = "Complete Overhaul 옵션을 활성화하고 있습니다. 오버홀은 일반적으로 항상 켜져 있어야 하며, 모드 폴더에서 모드를 제거해야만 비활성화할 수 있습니다.\n\n게임은 $TIME초 후 자동으로 종료되거나 '확인'을 누르면 종료됩니다.",

		["res_saveboost"] = "$BTN_INTERACT 키를 길게 눌려 레벨 100으로 올리기.",

		["RestorationModOptionsButtonTitleID"] = "레스토레이션 모드 옵션",
		["RestorationModOptionsButtonDescID"] = "레스토레이션 모드의 옵션을 봅니다.",
		["RestorationModHUDOptionsButtonTitleID"] = "레스토레이션 HUD & UI 옵션",
		["RestorationModHUDOptionsButtonDescID"] = "레스토레이션의 HUD & UI 옵션을 봅니다.",
		["RestorationModOTHEROptionsButtonTitleID"] = "추가 레스토레이션 모드 옵션",
		["RestorationModOTHEROptionsButtonDescID"] = "추가 레스토레이션 모드 옵션을 봅니다.",
		["RestorationModWeaponHandlingOptionsButtonTitleID"] = "++ 무기 조작성 옵션 ++",
		["RestorationModWeaponHandlingOptionsButtonDescID"] = "무기 조작성에 관한 추가 옵션을 봅니다.",
		["RestorationModUIOptionsButtonTitleID"] = "알파 UI",
		["RestorationModUIOptionsButtonDescID"] = "알파 UI 옵션을 봅니다.",
		["RestorationModTimeOfDayTitleID"] = "새로운 + 무작위 시간대",
		["RestorationModTimeOfDayDescID"] = "특정 하이스트의 시간대를 설정합니다.",

		["RestorationModOtherModsTitleID"] = "===다른 모드 옵션===",
		["RestorationModOtherModsDescID"] = "다른 모드에 대한 추가 옵션을 봅니다.",
			["RestorationModAdVMovResOptOptionsButtonTitleID"] = "\"Advanced Movement Standalone\" 옵션",
			["RestorationModAdVMovResOptOptionsButtonDescID"] = "Solo Queue Pixy의 \"Advanced Movement Standalone\" 모드에 대한 추가 옵션을 봅니다.",

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
		["RestorationModINFOHUDOptionsButtonTitleID"] = "버프 트래커",
		["RestorationModINFOHUDOptionsButtonDescID"] = "화면 왼쪽에 활성화된 스킬에 대한 정보를 반영하는 아이콘을 표시합니다. 버프 트래커는 알파 UI를 활성화할 필요가 없습니다.",
		["RestorationModInfo_HudTitleID"] = "버프 트래커 활성화",
		["RestorationModInfo_HudDescID"] = "버프 트래커 UI 전부를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_SizeTitleID"] = "아이콘 크기",
		["RestorationModInfo_SizeDescID"] = "버프 트래커의 아이콘 크기를 설정합니다.",
		["RestorationModInfo_CountTitleID"] = "행 개수",
		["RestorationModInfo_CountDescID"] = "새 열을 추가하기 전에 버프 트래커가 표시하는 행의 수를 설정합니다.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "공격적 재장전",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "효율적인 탄약 활용",
		["RestorationModInfo_ammo_efficiencyDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "피의 갈증",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_bullet_stormTitleID"] = "탄환 폭풍",
		["RestorationModInfo_bullet_stormDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "의무병",
		["RestorationModInfo_revive_damage_reductionDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_desperadoTitleID"] = "데스페라도",
		["RestorationModInfo_desperadoDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_grinderTitleID"] = "히스타민 (그라인더)",
		["RestorationModInfo_grinderDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_infiltratorTitleID"] = "체력 흡수 (인틸트레이터)",
		["RestorationModInfo_infiltratorDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_sociopathTitleID"] = "긴장 및 클린 히트 (소시오패스)",
		["RestorationModInfo_sociopathDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_body_expertiseTitleID"] = "뿌리고 기도",
		["RestorationModInfo_body_expertiseDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",		
		["RestorationModInfo_long_dis_reviveTitleID"] = "인스파이어",
		["RestorationModInfo_long_dis_reviveDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_messiahTitleID"] = "메시아",
		["RestorationModInfo_messiahDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "오버킬",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "진통제",
		["RestorationModInfo_revived_damage_reductionDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "응급 치료",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_rogueTitleID"] = "킬러 인스팅트 (로그)",
		["RestorationModInfo_rogueDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "죽음으로부터의 도주",
		["RestorationModInfo_increased_movement_speedDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "명사수",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_trigger_happyTitleID"] = "난사광",
		["RestorationModInfo_trigger_happyDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "언더독",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_unseen_strikeTitleID"] = "암습",
		["RestorationModInfo_unseen_strikeDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_survive_one_hitTitleID"] = "오니 문신 (야쿠자)",
		["RestorationModInfo_survive_one_hitDescID"] = "이 특정 스킬의 트래커를 활성화하거나 비활성화합니다.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "의료 가방 체력 회복",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "의료 가방 체력 회복 트래커를 활성화하거나 비활성화합니다.",

		--EXTRA OPTIONS
		["RestorationModAltLastDownColorTitleID"] = "대체 마지막 다운 색 보정",
		["RestorationModAltLastDownColorDescID"] = "마지막 다운의 색 보정을 color_sin_classic으로 전환합니다.",
		["RestorationModNoBleedoutTiltTitleID"] = "블리드아웃 카메라 기울기 비활성화",
		["RestorationModNoBleedoutTiltDescID"] = "블리드아웃 중에 발생하는 카메라 기울기를 비활성화합니다.",
		["RestorationModGOTTAGETAGRIPTitleID"] = "모든 포어그립 숨기기",
		["RestorationModGOTTAGETAGRIPDescID"] = "메뉴에 나오는 \"vertical_grip\" 유형의 *모든* 부착물을 숨깁니다. 무기에 이미 장착된 부착물은 영향을 받지 않습니다. 재시작이 필요합니다.",
		["RestorationModGCGPYPMMSACTitleID"] = "슈퍼 시리얼 무기",
		["RestorationModGCGPYPMMSACDescID"] = "스타 워즈 블래스터 메커니즘을 비활성화합니다. 재시작이 필요합니다.",
		["RestorationModGCGPYPMMSACTextTitleID"] = "슈퍼 시리얼 텍스트",
		["RestorationModGCGPYPMMSACTextDescID"] = "텍스트 기반의 이스터 에그가 랜덤으로 나타나는 것을 비활성화합니다. 재시작이 필요합니다.",
		["RestorationModForceEggsOptionsButtonTitleID"] = "강제 이스터 에그 텍스트",
		["RestorationModForceEggsOptionsButtonDescID"] = "개별 이스터 에그 텍스트를 강제로 활성화합니다. 활성화 되었을때 \"슈퍼 시리얼 텍스트\"도 활성화되어 있으면 해당 옵션을 무시합니다.\n무엇이든 전환하면 재시작이 필요합니다.",
			["RestorationModUpotteTitleID"] = "Enroll in Seishou Academy",
			["RestorationModUpotteDescID"] = "Work with the Modern Literature teacher or something",
			["RestorationModMyWifeTitleID"] = "G Less Than 3",
			["RestorationModMyWifeDescID"] = "The inner machinations of DMC's mind are an enigma",
			["RestorationModCrabBattleTitleID"] = "Now There's A Pretty Meme",
			["RestorationModCrabBattleDescID"] = "Exquisite!",
			["RestorationModEmberMyBelovedTitleID"] = "Go EXTREME Digital",
			["RestorationModEmberMyBelovedDescID"] = "Clem Grakata!",
			["RestorationModBigManTitleID"] = ":^)",
			["RestorationModBigManDescID"] = "다른 이스터 에그 텍스트를 활성화합니다.  ",
		["RestorationModSevenHoldTitleID"] = "상호작용 토글 (Press2Hold)",
		["RestorationModSevenHoldDescID"] = "상호작용 키가 토글 역할을 하는지 여부를 활성화하거나 비활성화합니다.",
		["RestorationModSevenHoldDeployCancelTitleID"] = "배치물 취소 상호작용",
		["RestorationModSevenHoldDeployCancelDescID"] = "배치물 키가 상호작용을 취소하는 데 토클이 사용되는지 여부를 활성화하거나 비활성화합니다. 상호작용 토글을 활성화해야 효과가 있습니다.",
		["RestorationModClassicMoviesTitleID"] = "클래식 로드아웃 배경",
		["RestorationModClassicMoviesDescID"] = "클래식 하이스트를 플레이할 때 PD:TH 로드아웃 배경을 활성화하거나 비활성화합니다.",
		["RestorationModWpnCatTitleID"] = "구매 메뉴 탭 정렬",
		["RestorationModWpnCatDescID"] = "블랙마켓 메뉴에서 무기를 구매할 때 사용되는 무기 그룹화 방식을 변경합니다. 재시작이 필요합니다.",
			["base_wpn_cat"] = "스킬 기반",
			["sub_wpn_cat"] = "하위 카테고리 및 피해량 티어",

		["RestorationModWepNamesTitleID"] = "무기 (재)명칭",
		["RestorationModWepNamesDescID"] = "무기와 부착물의 이름 스타일을 변경합니다. 재시작이 필요합니다.",
			["resmod_res_names"] = "Resmod 이름 (기본)",
			["resmod_no_nicknames"] = "Resmod 이름 (별명 없음)",
			["dmcwo_reelnames"] = "현실 무기 이름 (DMCWO Port - 미완성)",
			["resmod_no_renames"] = "바닐라 이름 (또는 자신만의 이름 변경 모드를 사용)",

		["RestorationModDisableAdvMovTFTitleID"] = "벽 달리기/점프 비활성화",
		["RestorationModDisableAdvMovTFDescID"] = "Advanced Movement의 벽 달리기와 점프 기능을 비활성화합니다.",
		["RestorationModAdvMovMeleeTitleID"] = "근접 공격 기능",
		["RestorationModAdvMovMeleeDescID"] = "Advanced Movement의 점프, 슬라이드, 대시, 달리기 킥 기능을 바꿉니다.",
			["resmod_advmov_melee_on"] = "기본",
			["resmod_advmov_melee_loud_only"] = "라우드에서만",
			["resmod_advmov_melee_off"] = "비활성화",

		--WEAPON HANDLING
		["RestorationModStaticAimTitleID"] = "정조준 도중 무기 움직임 없음",
		["RestorationModStaticAimDescID"] = "조준 중 장식 흔들림과 드리프트를 활성화 혹은 비활성화합니다. 활성화하면 \"뷰모델 움직임\" 설정을 재정의합니다. 재시작이 필요합니다. 경고: 체크하지 않은 상태면 일부 광학 조준기를 사용할 수 없게 될 수 있습니다.",
		["RestorationModBigScopeOffsetTitleID"] = "\"큰 조준기\" 뷰모델 오프셋",
		["RestorationModBigScopeOffsetDescID"] = "큰 광학 조준기를 사용할 때 시각적 방해를 줄이기 위해 지향 사격 뷰모델을 약간 기울이고 오른쪽으로 이동합니다.",
		["RestorationModViewmodelMovementTitleID"] = "뷰모델 움직임",
		["RestorationModViewmodelMovementDescID"] = "주변을 둘러볼 때 화면에서 무기의 뷰모델이 어떻게 움직이는지 선택합니다. 정조준 움직임은 \"ADS 중 무기 움직임 없음\" 설정이 활성화된 경우 재정의됩니다. 재시작이 필요합니다.",
			["vm_vanilla"] = "바닐라 동작",
			["vm_drag"] = "무기가 뒤로 끌림",
			["vm_lead"] = "무기가 앞서 나감",
			["vm_static"] = "정적 (움직임 없음)",
		["RestorationModCarpalTunnelTitleID"] = "반동 자동 복구",
		["RestorationModCarpalTunnelDescID"] = "반동 자동 회복 메커니즘이 어떻게 작동하는지 선택합니다. 활성화된 버전은 다르게 균형을 이룹니다.",
			["rr_off"] = "비활성화",
			["rr_per_weapon"] = "무기에 따라",
			["rr_full"] = "모두",
		["RestorationModAutoDMRsTitleID"] = "지정사수 소총 자동 사격으로 전환",
		["RestorationModAutoDMRsDescID"] = "단발 및 자동 사격 모드가 있는 모든 지정사수 소총을 자동 사격 모드로 전환할지 여부를 설정합니다.",
		["RestorationModWpnFireDescopeTitleID"] = "특정 무기의 디스코프 허용",
		["RestorationModWpnFireDescopeDescID"] = "일부 무기가 사격 시 디스코프를 해제할 수 있는지 여부를 설정합니다. 주의: 디스코프는 클리핑을 줄이는 데 사용됩니다. 일부 조준기는 비활성화하면 클리핑될 수 있습니다. 디스코프를 메커니즘으로 언급된 무기는 해당 설정이 무시합니다.",
		["RestorationModSprintCancelTitleID"] = "위기모면 에이스 효과의 달리기 재장전 취소",
		["RestorationModSprintCancelDescID"] = "\"위기모면\" 스킬을 에이스까지 가지고 있을때 달리기를 *시작*하면 진행 중인 재장전이 취소되는지 여부를 설정합니다. 전력 질주 도중에 재장전하는 것은 영향을 받지 않습니다.",
		["RestorationModQueuedShootingTitleID"] = "발사 선입력 버퍼",
		["RestorationModQueuedShootingDescID"] = "단발 및 오버샘플링(무기가 발사할 수 있는 속도보다 빠르게 입력을 전송)을 지원하는 무기의 발사 선입력 버퍼링을 활성화 혹은 비활성화하여 합니다.\n이 기능을 활성화하면 오버킬 버전의 입력 버퍼링이 비활성화됩니다.",
		["RestorationModQueuedShootingWindowTitleID"] = "단발 버퍼 감도",
		["RestorationModQueuedShootingWindowDescID"] = "무기의 발사 선입력의 %에 따라 발사 입력이 버퍼링되는 시간대를 결정합니다. 값이 높을수록 버퍼가 더 빨리 생성됩니다.",
		["RestorationModQueuedShootingExcludeTitleID"] = "단발 선입력 버퍼의 발사 속도 제한",
		["RestorationModQueuedShootingExcludeDescID"] = "이 옵션에서 설정한 발사 속도(RPM) *이상으로* 발사되는 무기의 발사 선입력 버퍼링을 제한합니다.",
		["RestorationModQueuedShootingMidBurstTitleID"] = "중간 점사 입력 버퍼",
		["RestorationModQueuedShootingMidBurstDescID"] = "점사 *도중*에 이루어지는 발사 선입력을 설정합니다.",
		["RestorationModQueuedShootingBurstExcludeTitleID"] = "중간 점사 선입력 버퍼 제한",
		["RestorationModQueuedShootingBurstExcludeDescID"] = "이 옵션에서 설정한 값(ms) *아래*의 버스트 지연 시간을 갖는 무기에 대한 버스트 *중*에 이루어지는 사격 입력 버퍼링을 제한합니다.",
		["RestorationModNoADSRecoilAnimsTitleID"] = "정조준 반동 애니메이션 없음",
		["RestorationModNoADSRecoilAnimsDescID"] = "정조준 반동 애니메이션을 활성화 혹은 비활성화합니다. 일부 무기는 이 옵션의 영향을 받지 않습니다(예: 수동 작동 총, 활, 화염 방사기)",
		["RestorationModNoSwapOnReviveTitleID"] = "소생 시 강제 무기 교체 없음",
		["RestorationModNoSwapOnReviveDescID"] = "불사 에이스 스킬이 없어도 주 무기로 쓰러졌을 때 소생 시 강제 무기 교체를 비활성화합니다.",
		["RestorationModManualReloadsTitleID"] = "수동 재장전",
		["RestorationModManualReloadsDescID"] = "탄창이 비어 있을 때 자동 재장전을 비활성화합니다.",
		["RestorationModSecondSightSprintTitleID"] = "달리기 버튼 누르는 동안 보조 조준기 전환",
		["RestorationModSecondSightSprintDescID"] = "정조준 중에 보조 조준기를 켜고 끄려면 가젯 버튼 대신 달리기 버튼을 사용합니다.\n활성화된 가젯은 U232 이전과 마찬가지로 전환이 가능하지만 정조준 중에는 달리기를 할 수 없습니다.",
		["RestorationModADSTransitionStyleTitleID"] = "정조준 스타일",
		["RestorationModADSTransitionStyleDescID"] = "조준기를 조준하는 전환 스타일을 변경합니다.",
			["vanilla_on_rails"] = "기본/온레일",
			["kf_mw_style"] = "킬플1/콜옵 스타일",
			["tilt_in"] = "기울어짐",
		["RestorationModAimDeploysBipodTitleID"] = "정조준 삼각대 배치",
		["RestorationModAimDeploysBipodDescID"] = "알맞는 표면 위로 정조준 할 때 삼각대가 자동으로 펼치는지에 대해 활성화 혹은 비활성화합니다.",
		["RestorationModMoveCancelBipodTitleID"] = "이동 시 삼각대 분리",
		["RestorationModMoveCancelBipodDescID"] = "기본적인 이동이 삼각대를 분리를 입력하는지에 대해 활성화 혹은 비활성화합니다.",
		["RestorationModSeparateBowADSTitleID"] = "별도 활 조준",
		["RestorationModSeparateBowADSDescID"] = "화살을 당낄 때 활의 강제 조준을 비활성화합니다. 활성화된 경우, 재장전 키는 당겨진 화살을 내리는 데 사용됩니다.",
		["RestorationModPerPelletShotgunsTitleID"] = "펠릿당 산탄총 대미지 (WIP)",
		["RestorationModPerPelletShotgunsDescID"] = "산탄총 피해는 표준 \"펠릿 1개 = 최대 피해량, 헤드샷 우선\"과 달리 펠릿당으로 계산합니다. 낮은 일관성을 보완하기 위해 슬러그를 제외한 산탄총의 대미지가 증가합니다. 재시작이 필요합니다.",


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
		["menu_jukebox_heist_ponr"] = "Point Of No Return",
		["RestorationModPaintingsTitleID"] = "미사용된 아트 갤러리 그림",
		["RestorationModPaintingsDescID"] = "사용하지 않는 그림이 아트 갤러리에 생성되는 기능을 활성화 또는 비활성화합니다. 호스트만 적용됩니다.",
		["RestorationModMainHUDTitleID"] = "알파 HUD 켜기 혹은 끄기",
		["RestorationModMainHUDDescID"] = "알파 HUD를 전체적으로 활성화하거나 비활성화합니다.",
		["RestorationModWaypointsTitleID"] = "알파 웨이포인트",
		["RestorationModWaypointsDescID"] = "알파 웨이포인트를 활성화하거나 비활성화합니다.",
		["RestorationModAssaultPanelTitleID"] = "알파 어썰트 테이프",
		["RestorationModAssaultPanelDescID"] = "알파 어썰트 테이프를 활성화하거나 비활성화합니다.",
		["RestorationModAltAssaultTitleID"] = "초기 어썰트 공격 표시기",
		["RestorationModAltAssaultDescID"] = "초기 어썰트 공격 표시기를 활성화하거나 비활성화하고 테이프를 대체합니다.",
		["RestorationModObjectivesPanelTitleID"] = "알파 목표 패널",
		["RestorationModObjectivesPanelDescID"] = "알파 목표 패널을 활성화하거나 비활성화합니다.",
		["RestorationModPresenterTitleID"] = "알파 프리젠터",
		["RestorationModPresenterDescID"] = "전리품 확보하거나 목표 알림 다일로그에 사용되는 알파 프리젠터를 활성화하거나 비활성화합니다.",
		["RestorationModInteractionTitleID"] = "알파 상호 작용 미터",
		["RestorationModInteractionDescID"] = "알파 상호 작용 미터를 활성화하거나 비활성화합니다.",
		["RestorationModStealthTitleID"] = "알파 스텔스 미터",
		["RestorationModStealthDescID"] = "알파 스텔스 미터를 활성화하거나 비활성화합니다.",
		["RestorationModDownTitleID"] = "알파 다운 타이머",
		["RestorationModDownDescID"] = "알파 다운 타이머를 활성화하거나 비활성화합니다.",
		["RestorationModBagTitleID"] = "알파 가방 패널",
		["RestorationModBagDescID"] = "알파 가방 패널을 활성화하거나 비활성화합니다.",
		["RestorationModHostageTitleID"] = "인질 패널 숨기기",
		["RestorationModHostageDescID"] = "활성화하면 어썰트 테이프 또는 초기 알파 표시기가 켜져 있는 경우 돌격이 시작될 때 인질 패널을 숨깁니다.",
		["RestorationModDifficultyMarkersTitleID"] = "출시 전 난이도 마커",
		["RestorationModDifficultyMarkersDescID"] = "출시 전 난이도 마커를 활성화하거나 비활성화합니다.",
		["RestorationModStaminaIndicatorTitleID"] = "디버그 스태미나 표시기",
		["RestorationModStaminaIndicatorDescID"] = "디버그 스태미나 표시기를 활성화하거나 비활성화합니다.",
		["RestorationModBlackScreenTitleID"] = "레스토레이션 블랙 스크린",
		["RestorationModBlackScreenDescID"] = "레스토레이션 블랙 스크린을 활성화하거나 비활성화합니다.",
		["RestorationModLoadoutsTitleID"] = "알파 로드아웃",
		["RestorationModLoadoutsDescID"] = "알파 로드아웃 화면을 활성화하거나 비활성화합니다.",
		["RestorationModDistrictTitleID"] = "CRIME.NET 구역 설명",
		["RestorationModDistrictDescID"] = "CRIME.NET에 구역 설명을 활성화하거나 비활성화합니다. 게임 플레이에는 영향을 주지 않습니다.",
		["RestorationModSCOptionsButtonTitleID"] = "레스토레이션 오버홀 옵션",
		["RestorationModSCOptionsButtonDescID"] = "레스토레이션 오버홀 옵션",
		["RestorationModSCTitleID"] = "완전한 오버홀 (디버그)",
		["RestorationModSCDescID"] = "레스토레잇녀의 완전한 게임 오버홀을 활성화 또는 비활성화합니다. 이 옵션을 토글하면 세이브 파일 손상을 방지하기 위해 게임이 자동으로 종료됩니다.",
		["RestorationModHolidayTitleID"] = "홀리데이 효과",
		["RestorationModHolidayDescID"] = "오버홀의 홀리데이 효과를 활성화하거나 비활성화합니다.",
		["RestorationModCloakerTurnTitleID"] = "클로커 킥 카메라 턴",
		["RestorationModCloakerTurnDescID"] = "클로커가 킥을 시전할 때 바닐라의 클로커 카메라 회전 기능을 활성화하거나 비활성화합니다.",		
		["RestorationModDisableMutatorColorsTitleID"] = "뮤테이터 어썰트 배너 색상 비활성화",
		["RestorationModDisableMutatorColorsDescID"] = "뮤테이터를 사용할 때 어썰트 배너의 색상 변경을 비활성화합니다(바닐라 HUD에만 해당).",			
		["RestorationModRestoreHitFlashTitleID"] = "히트 플래시 복원",
		["RestorationModRestoreHitFlashDescID"] = "대미지를 입었을 때 복원된 히트 플래시를 활성화하거나 비활성화합니다.",	
		["RestorationModBotsNoDropTitleID"] = "봇 전리품 가방 드롭 비활성화",
		["RestorationModBotsNoDropDescID"] = "봇이 전리품 가방을 떨어뜨리는 것을 활성화하거나 비활성화합니다.",			
		["RestorationModNotifyTitleID"] = "기능 알림",
		["RestorationModNotifyDescID"] = "이 기능에 대한 알림을 활성화하거나 비활성화합니다.",
		["RestorationModPauseTitleID"] = "알파 일시 정지 메뉴",
		["RestorationModPauseDescID"] = "알파 일시 정지 메뉴를 활성화하거나 비활성화합니다.",

		["menu_support"] = "오버홀 가이드/지원",
		["menu_support_help"] = "레스토레이션 모드의 가이드를 보거나 지원을 받거나 동료를 찾아보세요.",
		["menu_manual_header"] = "Placeholder Text",
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
		["restoration_level_data_election_day_3"] = "안녕하세요! 만약 게임 플레이 중 이 문자열을 발견하면 레스토레이션 팀에 신고하세요! 감사합니다!",
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
		["restoration_level_data_arm_fac"] = "오후 9:30, 항구",
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
		["restoration_level_data_pbr2"] = "시간 불명, Z-170 '제우스' - 머키워터 화물기",
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
		["restoration_level_data_chill_combat"] = "오후 1:00, 세이프하우스 - 경찰들의 습격!",
		["restoration_level_data_help"] = "다이얼을 만지지 마라. 이제 시작일 뿐이니.",
		["restoration_level_data_friend"] = "오후 4:30, 마이애미 - 엘 푸레이디스 맨션",
		["restoration_level_data_fish"] = "오후 7:30, 뉴욕시 외곽 - '레테' 요트",
		["restoration_level_data_spa"] = "오후 7:00, 뉴욕시 - 매복!",
		["restoration_level_data_moon"] = "오후 11:00, 무리카 쇼핑몰",
		["restoration_level_data_run"] = "오전 11:00, 업타운 - 이중 교차로",
		["restoration_level_data_glace"] = "오후 10:45, 그린 브릿지 - 남쪽",
		["restoration_level_data_dah"] = "오전 1:30, 22층 - 가넷 그룹 고층 빌딩",
		["restoration_level_data_hvh"] = "짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍. 짹, 깍.",
		["restoration_level_data_wwh"] = "시간 불명, 알래스카 어딘가...",
		["restoration_level_data_rvd1"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_rvd2"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_brb"] = "오후 6:53, 뉴욕, 브루클린 - 하베스트 & 트러스트 지점 은행",
		["restoration_level_data_des"] = "시간 기밀, 네바다 - 헨리스 락",
		["restoration_level_data_sah"] = "시간 기밀, 매사추세츠 - 섀클손 경매장",
		["restoration_level_data_tag"] = "오전 12:43, J. 에드가 후버 빌딩",
		["restoration_level_data_bph"] = "시간 기밀, 포트 클랏솝 감옥",
		["restoration_level_data_nmh"] = "오후 8:24, 머시 병원 - 격리 병동",
		["restoration_level_data_nmh_res"] = "오후 8:24, 머시 병원 - 격리 병동",
		["restoration_level_data_vit"] = "오후 1:07, 워싱턴 D.C. - 백악관",
		["restoration_level_data_mex"] = "시간 기밀, 미국 - 남부 국경",
		["restoration_level_data_mex_cooking"] = "시간 기밀, 멕시코 - 코요파 컴파운드",
		["restoration_level_data_bex"] = "시간 기밀, 멕시코 - 산 마르틴 은행",
		["restoration_level_data_pex"] = "시간 기밀, 멕시코 - 경찰서",
		["restoration_level_data_fex"] = "시간 기밀, 멕시코 - 불룩의 저택",
		["restoration_level_data_chas"] = "오후 8:30, 샌프란시스코 - 차이나타운",
		["restoration_level_data_sand"] = "오후 10:30, 샌프란시스코 - 조선소",
		["restoration_level_data_chca"] = "오후 9:24, 샌프란시스코 베이 - 흑묘",
		["restoration_level_data_pent"] = "오후 11:30, 샌프란시스코 - 유후 왕의 펜트하우스",
		["restoration_level_data_ranc"] = "오후 6:24, 텍사스 - 내륙 목장",
		["restoration_level_data_trai"] = "오후 7:40, 포트 워스 - 달튼 기차역",
		["restoration_level_data_corp"] = "오후 8:35, 댈러스 - SERA사 연구개발 시설",
		["restoration_level_data_deep"] = "오후 9:00, 멕시코 만 - SERA사 석유 굴착 유조선",
		["restoration_level_data_wetwork"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_junk"] = "시간 기밀, 위치 기밀",
		["restoration_level_data_holly"] = "오후 5:00, 로스앤젤레스 - 루카스 맨션",
		["restoration_level_data_lvl_friday"] = "오후 5:00, 실드 쇼핑몰",
		["restoration_level_data_skm_nightmare_lvl"] = "너는 너의 죄를 씻기 위해 여기에 왔는가?, 위치 세탁소?",
		["restoration_level_data_bluewave"] = "시간 기밀, 아우렐리안 창고",
		["restoration_level_data_secret_stash"] = "6:00 PM, 구역 - 버려진 건물",
		["restoration_level_data_bridge"] = "오후 10:45, 그린 브릿지 - 남쪽",
		["restoration_level_data_four_stores_remixed"] = "오후 1:20, 상점 앞",		

		--custom heists
		["restoration_level_data_flatline_lvl"] = "오후 10:26 볼니차 임. Н.И. 피로고프",
		["restoration_level_data_ahopl"] = "오후 9:06, 유리의 개인 클럽", --A House of Pleasure
		["restoration_level_data_atocl"] = "오후 7:03, 펜트하우스 파티", --A Touch of Class
		["restoration_level_data_rusdl"] = "전 10:23, 가넷 그룹 주얼리 스토어", --Cold Stones
		["restoration_level_data_crimepunishlvl"] = "오후 1:19, 러시아 어딘가의 교정 시설", --Crime and Punishment
		["restoration_level_data_deadcargol"] = "오후 8:36, 보급 창고 아래 하수도", --Deadly Cargo
		["restoration_level_data_hunter_party"] = "오후 3:56, 니콜라이의 펜트하우스", --Hunter and Hunted d1
		["restoration_level_data_hunter_departure"] = "오후 10:13, 알렉산드르의 전용 공항", --Hunger and Hunted d2
		["restoration_level_data_hunter_fall"] = "오전 1:36, 국제 해역 어딘가", --Hunter and Hunted d3
		["restoration_level_data_ruswl"] = "오전 11:50, 러시아 어딘가", --Scorched Earth
		["restoration_level_data_jambank"] = "오전 11:59, 하베스트 & 트러스티 은행", --Botched Bank
		["restoration_level_data_2Fort"] = "초과전, 투포트 어딘가", --2fort
		["restoration_level_data_anlh"] = "오후 2:35, 지안 리앙의 빌라", --An End to Liang
		["restoration_level_data_lvl_fourmorestores"] = "오후 3:12, 점포 앞", --Four More Stores
		["restoration_level_data_TonCont"] = "오전 11:01, 아트리움", --AT: Atrium
		["restoration_level_data_amsdeal1"] = "오후 9:49, 골목길", --Armsdeal Alleyway
		["restoration_level_data_ascension_III"] = "오후 10:53, 이클립스 연구 시설", --Ascension
		["restoration_level_data_hwu"] = "오후 11:03, 아발론 물류 세이프하우스", --Avalon's Shadow
		["restoration_level_data_vrc1"] = "오후 2:35, 다운타운 구역", --A Very Richie Christmas d1
		["restoration_level_data_vrc2"] = "오후 6:46, 보관 창고", --A Very Richie Christmas d2
		["restoration_level_data_vrc3"] = "오후 11:04, 젠섹 타워", --A Very Richie Christmas d3
		["restoration_level_data_btms"] = "오전 4:40, 네바다 - 블랙 릿지 시설", --Blackridge Facility
		["restoration_level_data_BloodMoney"] = "오후 8:00, 다운타임 사무소", --Blood Money
		["restoration_level_data_brb_rant"] = "오후 6:53, 뉴욕, 브루클린 - 하베스트 & 트러스트 지점 은행", --Brooklyn Bank Ranted
		["restoration_level_data_lit1"] = "오후 4:20, 캘리포니아 그린 스토어", --California Heat
		["restoration_level_data_lit2"] = "오후 4:20, 알미르의 게임 스토어", --California Heat - Almir's Games
		["restoration_level_data_dwn1"] = "오후 7:12, 캘리포니아 그린 창고", --Deep Inside
		["restoration_level_data_the_factory"] = "오후 9:37, 이클립스 연구 시설", --Eclipse Research Facility
		["restoration_level_data_Election_Funds"] = "오후 10:29, 선거 본사", --Election Funds
		["restoration_level_data_constantine_mex_level"] = "오후 3:46, 멕시코 어딘가", --End of an Era
		["restoration_level_data_battlearena"] = "오후 11:14, 조지타운", --FiveG
		["restoration_level_data_funbank"] = "뭔가 잘못되었다...", --Funbank
		["restoration_level_data_RogueCompany"] = "오후 8:20, 자칼의 영토", --Rogue Company
		["restoration_level_data_bnktower"] = "시간 기밀, 젠섹 H.I.V.E.", --GenSec HIVE
		["restoration_level_data_glb"] = "오전 11:19, 골든 로터스 은행", --Golden Lotus Bank
		["restoration_level_data_constantine_harbor_lvl"] = "오후 9:12, 조선소 창고", --Harboring a Grudge
		["restoration_level_data_tonmapjam22l"] = "오후 4:49, 하베스트 & 트러스티 은행", --Hard Cash
		["restoration_level_data_hardware_store"] = "오후 7:36, 하드웨어 스토어", --Hardware Store
		["restoration_level_data_tj_htsb"] = "오후 1:10, 하베스트 & 트러스티 은행", --H&T Southern Branch
		["restoration_level_data_tj_htsb_escape_level"] = "탈출하라!", --H&T Southern Branch escape day? probably unused, dunno
		["restoration_level_data_hntn"] = "오전 9:16, 하베스트 & 트러스티 은행", --H&T Northern Branch
		["restoration_level_data_hidden_vault"] = "오후 11:08, 크라니치 시설 시내", --Hidden Vault
		["restoration_level_data_crumch_returns"] = "오후 12:50, 실드 쇼핑몰", --Mallcrasher Ranted
		["restoration_level_data_mansion_stage1"] = "오전 2:13, 엘름스워스 경의 저택", --Elmsworth Mansion
		["restoration_level_data_skm_nmh"] = "오후 9:12, 머시 병원 - 지붕", --No Mercy SKM
		["restoration_level_data_office_strike"] = "오후 1:57, 다운타운 FBI 사무소", --Office Strike	
		["restoration_level_data_highrise_stage1"] = "오전 1:03, 트렘블레이의 아파트", --Out of Frame
		["restoration_level_data_constantine_bank_lvl"] = "오후 12:00, 퍼시픽 은행", --Pacific Bank
		["restoration_level_data_sh_raiders"] = "오후 5:16, 외곽 창고", --Safehouse Raiders
		["restoration_level_data_santas_hardware_store"] = "오후 3:47, 하드웨어 스토어", --Santa's Hardware Store
		["restoration_level_data_schl"] = "오후 9:57, 스칼렛 클럽", --Scarlet Club
		["restoration_level_data_skm_wd2_x"] = "오후 6:09, 알멘디아 물류 조선소", --Watchdogs d2 SKM revamp
		["restoration_level_data_Skyscraper"] = "오전 2:13, 젠섹 기업 본사", --Skyscraper Heist
		["restoration_level_data_tonisl1"] = "오후 3:31, 하베스트 & 트러스티 은행", --Grand Harvest
		["restoration_level_data_ttr_yct_lvl"] = "오후 2:19, 웨이 쳉의 요트", --Triad Takedown Remastered
		["restoration_level_data_Tonis2"] = "오후 1:31, 항구 창고", --Triple Threat
		["restoration_level_data_trop"] = "오전 11:48, 국제 해역 어딘가", --Tropical Treasure
		["restoration_level_data_Gambling_room"] = "오후 9:29, 트웬티 포 세븐 스토어", --Underground Bargains
		["restoration_level_data_finsternis"] = "오후 5:24, 독일 - 슈바르츠발트", --Projekt Finsternis	

		["heist_greattrain_name"] = "타임 윈도우",
		["heist_easystore_name"] = "트웬티 포 세븐",
		["heist_sin_villa_name"] = "스코어: 빌라 비발디",
		["heist_dragon_name"] = "스톤피스트",
		["heist_jkl_base_name"] = "자칼의 세이프하우스",
		["heist_junger_name"] = "일그러진 천사들",
		["heist_deep_name"] = "딥 식스",
		["heist_blood_name"] = "몸과 감옥",
		["heist_crystal_name"] = "공포의 노예들",
		["heist_gold_name"] = "아무 것도 남지 않는다",
		["heist_titanium_name"] = "영토 전쟁",
		["heist_airport_name"] = "추측 항법",
		["heist_platinum_name"] = "표면 장력",
		["heist_cursed_name"] = "그린 하베스트",
		["heist_holly_name"] = "블록버스터 나이트",

		["heist_platinum_brief"] = "배를 저어라",
		["heist_jackal_surface_tension_name"] = "옴니아 연구선 SN-XR-LETHE",
		["heist_jackal_surface_tension_brief"] = "PLACEHOLDER",

		["heist_vivinite_name"] = "제로 데이",

		["heist_contact_shatter"] = "자칼",
		["heist_contact_akashic"] = "니코",

		["menu_contacts_shatter"] = "CRIMENET 계약자",
		
		["heist_contact_jackal_description"] = "자칼은 젠섹에 소속되었었습니다. 하지만 젠섹과 옴니아가 관련된 인신매매 사건 이후 그만두었습니다.\n\n현재 그는 CRIMENET에서 일하며 그들의 앞길을 막고 있습니다.",
		
		["heist_contact_akashic_description"] = "예전에 엑토르 모랄레스 밑에서 활동했던 고위 중위였던 니콜라스 '니코' 르네는 현재 미국에서 활동하는 시날로아 카르텔 잔당을 지휘하고 있습니다.\n시날로아 카르텔의 규모는 작으며, 대규모 콜롬비아 카르텔은 그들을 도울 생각이 전혀 없고 CRIMENET과의 관계를 회복할 생각도 없습니다.\n\n그는 동부 해안에서 활동하는 다양한 소규모 갱단을 흡수하고 CRIMENET과 동맹을 맺고 그들의 서비스에 대한 대가로 자신의 자원을 제공할 것입니다.",

		["bm_msk_shatter_true"] = "샤터",
		["bm_msk_shatter_true_desc"] = "조용한 톤으로만 말했던 전설의 마스크입니다.\n\n물론, 이건 단지 복제품일 뿐입니다.\n\n진품에는 훨씬 더 특별한 점이 있겠지만, 복제품도 똑같이 마음에 드실 거라고 생각합니다.\n\n불사조는 부활을 상징하는데, 결코 진정으로 죽일 수 없는 영원한 존재입니다. 불사조를 쓰러뜨리려고 하면, 불사조는 불꽃과 연소의 경이로운 쇼로 반격할 것입니다.",

		["menu_l_global_value_veritas"] = "레스토레이션 모드",
		["menu_l_global_value_veritas_desc"] = "이 상품은 레스토레이션 모드 아이템입니다!",

		["menu_alex_1_zipline"] = "가방 짚라인",

		["menu_asset_wet_intel"] = "정보",
		["menu_asset_risk_murky"] = "머키워터 용병들",
		["menu_asset_risk_bexico"] = "연방 경찰",
		["menu_asset_risk_zombie"] = "조옴비들의 대으응",
		["menu_asset_wet_boat"] = "보트",
		["menu_asset_wet_boat_desc"] = "전리품 확보 및 탈출 할 수 있는 보트를 삽니다.",

		["bm_msk_canada"] = "하키 지옥",
		["bm_msk_canada_desc"] = "아무 것도 남기지 마세요. 열기가 닥쳐와도 원하는게 있다면 원하는 것을 위해 싸우십시오. (열기가 열압폭발 일지라도요.)",
		["bm_msk_jsr"] = "미스 그래피티",
		["bm_msk_jsr_desc"] = "진정한 예술가가 만들어졌습니다. 그래피티를 지우는 건 책을 태우는 것과 마찬가집니다, 그렇죠?\n\n예술은 예술이니 존중해주세요.",
		["bm_msk_jsrf"] = "미스터 그래피티",
		["bm_msk_jsrf_desc"] = "그래피티가 말하길, 추운 도시에서 예술가가 된다는 것은 고통스럽다라는걸요.\n\n그래피티는 이런 이야기를 책처럼 들려줍니다. 읽어보시는 걸 추천드립니다.",
		["bm_msk_courier_stash"] = "전리품 가방",
		["bm_msk_courier_stash_desc"] = "혹시 몇 백 달러 정도를 더 챙기고 싶은데 주머니에 공간이 없다면, 이 마스크가 안성맟춤 일 것입니다.",

		["bm_msk_female_mask"] = "표준 마스크 (여)",
		["bm_msk_female_mask_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.",
		["bm_msk_female_mask_blood"] = "회수된 마스크 (여)",
		["bm_msk_female_mask_blood_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.\n\n이 마스크는 옴니아 창고에서 발생한 강도 사건의 여파로 발견되었으며, 그곳에 남은 것은 시체들와 피뿐이었습니다.\n\n사라지기 전 팀원들의 마지막 메시지는 ''에리트 프리미엄 생귀인 생텀''이였습니다.",
		["bm_msk_female_mask_clown"] = "로지",
		["bm_msk_female_mask_clown_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.\n\n이 마스크는 로지라는 가명을 쓰는 하이스터가 착용했지만, 요즘 그녀는 새 마스크을 쓰고 있습니다.\n\n영상에서 그녀가 전혀 무장하지 않는 채로 SWAT 분대 전체를 사살하는 모습이 담겨졌습니다.",
		["bm_msk_male_mask"] = "표준 마스크 (남)",
		["bm_msk_male_mask_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.",
		["bm_msk_male_mask_blood"] = "회수된 마스크 (남)",
		["bm_msk_male_mask_blood_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.\n\n이 마스크는 옴니아 창고에서 발생한 강도 사건의 여파로 발견되었으며, 그 곳에 남은 것은 시체와 피뿐이었습니다.\n\n사라지기 전 팀원들의 마지막 메시지는 ''에리트 프리미엄 생귀인 생텀''이였습니다.",
		["bm_msk_male_mask_clown"] = "크로스",
		["bm_msk_male_mask_clown_desc"] = "CRIMENET에서 제공하는 표준 마스크입니다.\n\n촘촘한 소재로 만들어졌기 때문에 얇지는 않지만, 착용하기도 쉽지 않습니다.\n\n이 마스크는 크로스라는 가명을 쓰는 하이스터가 착용했지만, 요즘 그는 새 마스크을 쓰고 있습니다.\n\n재능 있는 저격수인 그는 단 5초만에 4대의 장갑 수송차 4대를 격파한 적이 있었습니다.",

		["bm_msk_twister_mask"] = "미스터리 맨",
		["bm_msk_twister_mask_desc"] = "이 가면 뒤에 누가 있는지는 미스터리입니다.\n\n뒤에 있는 사람은 모르는 사람일 수도 있고, 항상 알고 지내던 사람일 수도 있습니다.",
		["bm_msk_voodoo_mask"] = "흑마법",
		["bm_msk_voodoo_mask_desc"] = "폭격으로 인해 생긴 정글 폐허에서 발견된 이 가면은 날씨와 학살을 견더냈으며, 지금은 전조로 알려져 있습니다.\n\n이 마스크는 아마 당신이 가장 필요할 때 당신에게 찾아와 파멸을 견뎌낼 수 있는 행운을 불어넣을 것입니다.\n\n다만 한 가지 물어봐야 할 것은, 어떤 대가를 치려야할까요?",

		["bm_msk_f1"] = "X1 헬멧",
		["bm_msk_f1_desc"] = "고속도로를 질주하거나 사람들이 붐비는 거리에서 타이어를 불태울 때는 반드시 보호 장비를 착용하세요.\n\n헬멧은 당신을 끔찍한 낙하로부터 보호해 줄 수는 있지만 총알로부터는 절대 보호해 줄 수는 없습니다.",
		["bm_msk_f1_b"] = "X1 헬멧 (깨끗함)",
		["bm_msk_f1_b_desc"] = "고속도로를 질주하거나 사람들이 붐비는 거리에서 타이어를 불태울 때는 반드시 보호 장비를 착용하세요.\n\n헬멧은 당신을 끔찍한 낙하로부터 보호해 줄 수는 있지만 총알로부터는 절대 보호해 줄 수는 없습니다.\n\n고급 차량들이 모여 있는 보관소에서 발견된 이 헬멧은 브랜드 스티커가 없는 헬멧과 똑같은 복제품입니다.\n\n이걸 가까이에 두면, 당신은 당신만의 이동 수단을 운전해 볼 기회를 얻을 수도 있을 겁니다.",
		["bm_msk_sweettooth"] = "스위트 투스",
		["bm_msk_sweettooth_desc"] = "스위트 투스, 본명 마커스 '누들' 케인은 비디오 게임 Twisted Metal 시리즈의 캐릭터입니다. 스위트 투스는 전투용 아이스크림 트럭을 운전하는 살인 광대로 가장 잘 알려져 있습니다.\n\n그는 한때 정신병원에서 탈출했었다고 합니다. 지금은 범죄 생활을 하고 있죠.",

		["bm_msk_wolf_stone"] = "스톤콜드 울프",
		["bm_msk_wolf_stone_desc"] = "울프가 가장 좋아하는 미디어에 나오는 범죄 행위를 하며 처음으로 벼랑 끝에서 일어설 때 착용했던 원래 가면입니다. 비디오 게임 'Hyper Heisting'에서 영감을 받아 만들어진 이 마스크는 강도 사건으로 인해 분실된 것으로 생각했었습니다.\n\n재결성된 갱단의 초기 작업 이후 마스크가 다시 등장했고 베인의 동료 중 한 명이 이를 안전 가옥으로 가져왔습니다.\n\n마스크의 원래 무늬는 시간이 지나면서 부분적으로 닳아 없어졌는데, 아마도 울프의 정신적 안정감이 점차 감퇴한 것을 반영한 것 같습니다.",

		["bm_msk_thespian"] = "테스피안",
		["bm_msk_thespian_desc"] = "테스피안은 초인적인 용병입니다. 미래에 테스피안과 같은 우주 해병은 인류 세계와 그 우주 식민지를 사악한 세력으로부터 지킵니다.\n\n그의 헬멧은 범죄 조직에서 인기 있는 선물이며, 조직에 충성심과 인내심을 보이는 도둑, 깡패, 전문 범죄자들에게 주어집니다.",

		["bm_msk_dallas_aged"] = "오래된 달라스",
		["bm_msk_dallas_aged_desc"] = "당신과 당신의 팀원들은 헨리스 락에 있던 이상한 이집트풍 상자에서 이 마스크를 발견했습니다. 상자 자체는 나중에 운송 중에 가로채졌고, 나머지 내용물은 당신에게 전달되었습니다.\n\n이 가면에 대한 무언가... 이상합니다. 이 마스크가 어디에서 발견되었는지에 대한 정보는 없습니다.\n\n자칼은 그것이 장난이거나 동료들을 겁먹게 하려는 것을 암시한다고 말했습니다.\n\n하지만 당신이 알 수 있는 한, 이 마스크 아마 매우, 매우 오래된 것 같습니다.",
		["bm_msk_chains_aged"] = "오래된 체인스",
		["bm_msk_chains_aged_desc"] = "당신과 당신의 팀원들은 헨리스 락에 있던 이상한 이집트풍 상자에서 이 마스크를 발견했습니다. 상자 자체는 나중에 운송 중에 가로채졌고, 나머지 내용물은 당신에게 전달되었습니다.\n\n이 가면에 대한 무언가... 이상합니다. 이 마스크가 어디에서 발견되었는지에 대한 정보는 없습니다.\n\n자칼은 그것이 장난이거나 동료들을 겁먹게 하려는 것을 암시한다고 말했습니다.\n\n하지만 당신이 알 수 있는 한, 이 마스크 아마 매우, 매우 오래된 것 같습니다.",
		["bm_msk_hoxton_aged"] = "오래된 혹스턴",
		["bm_msk_hoxton_aged_desc"] = "당신과 당신의 팀원들은 헨리스 락에 있던 이상한 이집트풍 상자에서 이 마스크를 발견했습니다. 상자 자체는 나중에 운송 중에 가로채졌고, 나머지 내용물은 당신에게 전달되었습니다.\n\n이 가면에 대한 무언가... 이상합니다. 이 마스크가 어디에서 발견되었는지에 대한 정보는 없습니다.\n\n자칼은 그것이 장난이거나 동료들을 겁먹게 하려는 것을 암시한다고 말했습니다.\n\n하지만 당신이 알 수 있는 한, 이 마스크 아마 매우, 매우 오래된 것 같습니다.",
		["bm_msk_wolf_aged"] = "오래된 울프",
		["bm_msk_wolf_aged_desc"] = "당신과 당신의 팀원들은 헨리스 락에 있던 이상한 이집트풍 상자에서 이 마스크를 발견했습니다. 상자 자체는 나중에 운송 중에 가로채졌고, 나머지 내용물은 당신에게 전달되었습니다.\n\n이 가면에 대한 무언가... 이상합니다. 이 마스크가 어디에서 발견되었는지에 대한 정보는 없습니다.\n\n자칼은 그것이 장난이거나 동료들을 겁먹게 하려는 것을 암시한다고 말했습니다.\n\n하지만 당신이 알 수 있는 한, 이 마스크 아마 매우, 매우 오래된 것 같습니다.",

		["bm_msk_beef_dallas"] = "비프 달라스",
		["bm_msk_beef_dallas_desc"] = "갱들이 도살장 하이스트를 했을 때 사용한 마스크입니다.\n\n달라스는 그의 상징적인 광대 마스크와 비슷한 디자인을 유지하기로 했습니다.",
		["bm_msk_beef_chains"] = "비프 체인스",
		["bm_msk_beef_chains_desc"] = "갱들이 도살장 하이스트를 했을 때 사용한 마스크입니다.\n\n체인스는 인포서 역할이였기에 자신의 디자인에 위협적인 동물을 넣기 원했습니다. 빌어먹을 공룡보다 더 위협적인 게 뭐가 있을까요?",
		["bm_msk_beef_hoxton"] = "비프 혹스턴",
		["bm_msk_beef_hoxton_desc"] = "갱들이 도살장 하이스트를 했을 때 사용한 마스크입니다.\n\n혹스턴은 자신의 마스크에 대한 간단한 목록을 적어 놓았었습니다:\n- 보호!\n- 효율!\n- 스타일리시!\n\n그리하여 이 마스크가 탄생했습니다.",
		["bm_msk_beef_wolf"] = "비프 울프",
		["bm_msk_beef_wolf_desc"] = "갱들이 도살장 하이스트를 했을 때 사용한 마스크입니다.\n\n울프의 디자인은 게임 개발자 시절에 가장 좋아했던 캐릭터 디자인 중 한 명에게서 영감을 받았습니다.",

		["bm_msk_vyse_dallas"] = "근원",
		["bm_msk_vyse_dallas_desc"] = "바이스는 후추 추출물로 만들어진 악마와 마주서서 살아남았고, 이 마스크는 그 악마의 뼈로 만들어졌습니다.",
		["bm_msk_vyse_chains"] = "얘들 놀이",
		["bm_msk_vyse_chains_desc"] = "바이스는 포트 녹스에 보관할 수 있는 것보다 더 많은 돈과 금을 훔쳤지만, 그 내용물의 일부를 아픈 아이들에게 기부해 줄 만큼 예의 바른 태도를 보였습니다.\n\n베인은 그 아이들 중 일부에게 방문한 것으로 알려졌으며, 이 마스크는 아이들이 바이스에게 보내는 감사의 표시입니다.",
		["bm_msk_vyse_hoxton"] = "쓰리 스투지스",
		["bm_msk_vyse_hoxton_desc"] = "사람들은 실수하면 고통을 마주하고 다시 시도해야 한다고 말합니다. 하지만 바이스는 그렇지 않았습니다. 그는 매번 실수할 때마다 전직 군인의 손에 맞으면서 계속 나아갔습니다. 래리, 컬리, 모에조차도 그런 구타를 견뎌낼 수 없었습니다.",
		["bm_msk_vyse_wolf"] = "베어 그릴스",
		["bm_msk_vyse_wolf_desc"] = "바이스는 베어 그릴스에게 소변 마시기 도전을 했고... 바이스가 이겼습니다, 그리고 그릴스 씨는 자신의 생존 기술을 사용하여 이 마스크를 만들었습니다.",

		["bm_msk_secret_old_hoxton"] = "시크릿 혹스턴 리본",
		["bm_msk_secret_old_hoxton_desc"] = "혹스턴은 새로운 나라에서 페이데이를 받기 위해 구국을 떠났습니다. 베인이 처음으로 그에게 비밀에 대해 말했을 때, 그는 잠재적인 가치를 위해 고대 아이템을 찾는 아이디어를 떠올렸고, 베인이 말한 전설적인 힘이 진짜인지 아닌지는 전혀 신경 쓰지 않았습니다.",

		["bm_msk_secret_clover"] = "시크릿 클로버",
		["bm_msk_secret_clover_desc"] = "베인이 클로버에게 비밀에 대해 이야기했을 때, 그녀는 회의적이었습니다. 베인의 신화적인 힘을 지닌 고대 물건에 대한 이야기는 항상 터무니없는 듯 보였지만, 세 개의 상자에서 나온 것들을 마주쳤을 때 그녀의 마음 속의 의심은 모두 사라졌습니다.",

		["bm_msk_secret_dragan"] = "시크릿 드라간",
		["bm_msk_secret_dragan_desc"] = "전직 경찰이었던 드라간은 증거에 대한 의심을 가지고 있었고, 베인이 그에게 비밀에 대한 연구 결과를 보여주었을 때 그는 고대의 힘을 지닌 물건을 찾아 나설 준비가 되어 있었습니다.",

		["bm_msk_secret_bonnie"] = "시크릿 보니",
		["bm_msk_secret_bonnie_desc"] = "베인으로부터 비밀을 들은 보니는 좋아하는 위스키를 한 모금 크게 들이키고 카타루를 망가뜨리고 싶어 안달이 났습니다.",

		["bm_msk_secret_sydney"] = "시크릿 시드니",
		["bm_msk_secret_sydney_desc"] = "베인이 비밀을 말했을 때, 시드니는 고대의 힘에 대한 이야기를 믿지 않았습니다. 그럼에도 불구하고 알려지지 않은 포괄적인 권위에 도전할 수 있는 기회는 그녀를 동참시키기에 충분했습니다.",

		["bm_msk_secret_richard"] = "시크릿 리차드",
		["bm_msk_secret_richard_desc"] = "범죄 조직에 떠도는 소문에 따르면, 자켓에게 영감을 준 살인범이 알려지지 않은 조직의 손에 끔찍한 최후를 맞았다고 합니다. 자켓이 베인에게 비밀을 들었을 때, 그는 나중에 가장 큰 영감을 준 사람의 마스크를 쓰고 나타났습니다.",

		["bm_all_seeing"] = "모든 것을 보는 닻",
		["bm_all_seeing_desc"] = "소름끼치는 환상, 악몽같은 광경.\n\n권력자들은 당신을 보고, 당신의 기여에 대한 보상을 확실히 해 줄 것입니다.",

		["bm_msk_classic_helmet"] = "클래식 인포서",
		["bm_msk_classic_helmet_desc"] = "전 SWAT 집행자가 준 선물. 은퇴하기 전에 그는 자칼을 찾아왔고... 자칼의 노력을 돕기 위해 그가 접근할 수 있는 장비만 제공했습니다.\n\n그의 호기심 많은 제안은 한 가지 이유는 옴니아가 비밀리에 무엇을 하고 있는지 보았기 때문이였습니다. 하지만 그 자신은 그 비밀을 밝히기를 거부했고, 곧 떠나고 다시는 보이지 않았습니다.\n\n자칼은 이 헬멧을 당신의 기여에 대한 보상으로 보냈습니다.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Push the placeholder, we'll get around to it.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "자칼의 마스크. 혹은 아마 재현품.\n\n진짜 마스크는 자칼에게 중요한데, 일부 사람들은 진짜 마스크에는 민감한 데이터가 들어 있다고 말합니다.\n\n그러나 이 재현품의 디스플레이를 운영하는 시스템은 매우 기초적이며, 단지 진짜 마스크를 복제하려는 것일 뿐입니다.\n\n당신의 노고에 대한 선물입니다.",


		["bm_msk_finger"] = "그리퍼",
		["bm_msk_finger_desc"] = "그리퍼는 오래전 이 세상의 일부에서 있었다고 알려진 신화 속의 짐승입니다. 이 짐승은 마을과 도시에서 일반 사람들을 의도적으로 쫓아다니며 괴롭히고, 의심치 않는 방식으로 사냥했습니다. 그리퍼는 이런 행동에서 즐거움을 얻었고, 왕의 부하들이 마침내 그를 찾아내 죽일 때까지는 평화에 위협이 되었습니다.",

		["bm_msk_instinct"] = "직감",
		["bm_msk_instinct_desc"] = "이 가면은 먼 곳에서 온 신비한 전사의 것이었습니다. 그는 직감에 따라 땅을 걸으며 전 세계의 사악한 세력을 사냥했습니다. 그는 위험을 무릅쓰고 던전을 탐험하며 마주친 수천 명의 사악한 존재를 죽였습니다. 결국 그는 평화를 찾았고, 다음 세대가 그가 한 것처럼 계속될 것이라는 것을 알았습니다.",

		["bm_msk_unforsaken"] = "포세이큰",
		["bm_msk_unforsaken_desc"] = "이 전설적인 마스크는 우리 커뮤니티의 헌신, 이해 및 지속적인 지원에 대한 감사의 표시입니다. 오버킬 직원들에게 우리는 경의를 표합니다.\n\n좋을 때나 나쁠 때나 헬멧을 날려버리세요.",

		["bm_msk_chains_halloween"] = "샤터 실드",
		["bm_msk_chains_halloween_desc"] = "고용된 용병이 되는 것은 많은 고통과 죽음을 보게 됩니다. 당신이 무적이고, 멈출 수 없다고 느끼더라도... 때때로 모든 것이 당신을 괴롭히기 위해 돌아옵니다.\n\n2008년 10월의 아름답고 밝고 눈이 내리는 어느 오후, 체인스는 잠을 자고 있었습니다. 머키워터를 대신해 암살 임무를 수행한 그는 힘든 일을 해내어 돈을 받았고, 좋은 호텔 방에서 잠을 잤습니다.\n\n그리고 수년 만에 처음으로 그는 악몽을 꾸었습니다. 무슨 악몽이었는지 기억나지 않지만, 그는 그것이 무엇인지 기억할 수 없지만 깨어나보니 몸이 마비되었고, 그 위에 사람보다 뼈대만 남은은 인물이 서 있었고 몸을 움직일 수 없었습니다.\n\n그날 이후로 그가 총을 잡을 때마다 그 다음 밤은 불안하고 끔찍했습니다.\n\n결국 그는 '그만하자'라고 말해야 했습니다. 용병 사업에서 벗어나 치료사를 만났고 약을 복용해 도움을 받았습니다. 그리고 1년 동안은 잘 살았습니다...\n\n정확히 1년 후인 2009년 10월 31일, 머키워터는 자신의 삶을 바로잡으려는 남자가 비밀을 폭로하고 회사를 해치려 할 것이라고 확신했습니다. 그들은 그렇게 냅둘 순 없었기 때문이였죠.\n\n체인즈는 자신을 보호하기 위해 범죄의 길로 뛰어들었고, 다시 한번 군인이 되었습니다.\n\n하지만 이번에는 달랐습니다. 악몽과 수면 마비는 돌아오지 않았고 다른 사람을 해치려고 하지 않았습니다.\n\n이번에는 자신을 보호하는 것이기 때문이였죠.",

		["bm_msk_dallas_halloween"] = "괴물의 반사",
		["bm_msk_dallas_halloween_desc"] = "거짓 신원, 거짓말, 이야기를 구성하는 데 너무 많은 세월을 보내다 보면 자신을 잃어버리기 시작합니다.\n\n당신은 당신의 다양한 친구, 연인, 친구로부터 특성과 특징을 선택하면서 사람에서 사람으로 빠자기 시작합니다. 아마도 그것들이 서로 섞이기 시작하고, 당신은 융합처럼 느껴질 것입니다.\n\n10월의 어느 날 아침, 달라스는 일어나 거울로 걸어갔습니다. 머리는 못생긴 금발로 염색했고 헝클어진 면도를 했습니다. 쉼 없는 악몽의 땀으로 정장이 얼룩진 끈적끈적해졌고, 술에서 술로 넘어간 주말 후 욱신거리는 두통이 느껴졌습니다다.\n\n자신을 쳐다보면서 그가 생각할 수 있는 것은 그가 사람이라기보다 프랑켄슈타인의 괴물에 더 가깝다는 것뿐이었습니다. 그의 범죄 경력을 더 발전시키기에 충분할 만큼 충분히 설득력 있는 부분일 뿐입니다.\n\n전환점이 되었지만 때때로 그는 여전히 자신의 조각이 전부가 아니라는 느낌은 지울 수가 없습니다.",

		["bm_msk_hoxton_halloween"] = "할로윈 꿈",
		["bm_msk_hoxton_halloween_desc"] = "혹스턴의 할로윈 기억 중 하나는 뉴욕에 일종의 특별한 휴양지로 보기 위해 친척과 함께 10월에 미국으로 여행하는 것이었습니다.\n\n그는 사탕의 열렬한 팬이 아니었지만 친척의 파티에서 제공되는 호박 파이를 좋아했습니다.\n\n연회장 밖 홀을 배회하는 동안 그는 커다란 금고 문이 있고 온갖 종류의 장신구와 재물이 들어 있는 것을 보았습니다.\n\n그 이후로 그는 항상 휴일 동안 장소를 치는 것을 좋아했습니다.",

		["bm_msk_wolf_halloween"] = "악마의 외침",
		["bm_msk_wolf_halloween_desc"] = "2010년의 추운 10월 저녁, 울프는 파산하는 회사로 인한 재정적 타격에서 여전히 회복 중이었습니다.\n\n모텔방에 혼자 누워있는 그는 가족에 대해 생각했고, 가족을 실망시켰다는 생각이 들었고, 가족을 다시는 볼 수 없을지도 모른다는 생각을 했습니다. 온 나라와 마지막 생명줄이 그를 절단한 후 좌초된 상태였습니다.\n\n새 집에서 새로 시작할 수 있는 충분한 돈을 확보하기 위해 그는 마지막으로 저축한 돈을 미국으로 여행하는 데 썼습니다.\n\n몇 주 후, 친구의 집, 모텔, 피난처에 간 그는 몇 주 만에 중요한 다른 사람에게서 첫 번째 전화를 받았습니다.\n\n관계는 더 이상 없었습니다. '더 이상 잘 일하지 않는거 같아.'\n\n아마도 새로운 시작이 있었을거나.\n\n아마도 추구해야 할 새로운 직업이 있었을 것입니다.",


		["pattern_jkl_patt01_title"] = "자칼",
		["pattern_jkl_patt02_title"] = "컴퍼니",
		["material_jkl_matt01_title"] = "파이팅 페더스",
		["material_jkl_matt02_title"] = "베리타스 골드",

		["menu_scores"] = "점수",

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
		["RestorationModAssaultSurvivedBGTitleID"] = "생존한 어썰트 배경",
		["RestorationModStaminaTitleID"] = "스태미나",
		["RestorationModStaminaThresholdTitleID"] = "스태미나 한계점",
		["RestorationModBagBitmapTitleID"] = "가방",
		["RestorationModBagTextTitleID"] = "가방 텍스트",
		["RestorationModNoReturnTextTitleID"] = "돌아갈 수 없는 지점 텍스트",
		["RestorationModHostagesTextTitleID"] = "인질 텍스트",
		["RestorationModHintTextTitleID"] = "힌트 텍스트",
		["RestorationModMaskOnTextTitleID"] = "마스크 끼기 텍스트",
		["RestorationModDownsThreePlusTitleID"] = "다운 카운터 (다운 3개 이상 남음)",
		["RestorationModDownsTwoTitleID"] = "다운 카운터 (다운 2개 남음)",
		["RestorationModDownsOneTitleID"] = "다운 카운터 (다운 1개 남음)",
		["RestorationModDownsZeroTitleID"] = "다운 카운터 (다운 0개 남음)",
		["RestorationModStopAllBotsTitleID"] = "모든 봇 멈추기",
		["RestorationModStopAllBotsDescID"] = "봇 멈추는 키를 눌러 모든 봇을 멈추게합니다.",
		["RestorationModPONRTrackTitleID"] = "돌아갈 수 없는 지점 음악",
		["RestorationModPONRTrackDescID"] = "돌아올 수 없는 지점이 시작되면 프로 잡의 음악 트랙으로 변경합니다.",
		["RestorationModPONRTracksTitleID"] = "돌아갈 수 없는 지점 음악",
		["RestorationModPONRTracksDescID"] = "돌아올 수 없는 지점이 시작될 때 프로 잡의 음악 트랙을 선택합니다.",
		["RestorationModMusicShuffleTitleID"] = "음악 셔플",
		["RestorationModMusicShuffleDescID"] = "어썰트 종료 후 음악 트랙을 변경합니다.",
		["RestorationModScaleTitleID"] = "HUD 크기 조정",
		["RestorationModScaleDescID"] = "HUD의 크기를 조정합니다. 재시작이 필요할 수 있습니다.",
		["RestorationModSizeOnScreenTitleID"] = "화면의 HUD 크기",
		["RestorationModSizeOnScreenDescID"] = "화면의 HUD 크기를 변경합니다. 재시작이 필요할 수 있습니다.",
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
		["RestorationModExtraOptionsButtonDescID"] = "더 많은 옵션이 있습니다!",
		["RestorationModRealAmmoTitleID"] = "실제 탄약량",
		["RestorationModRealAmmoDescID"] = "총 탄약량 카운터가 현재 무기에 장전된 탄약량을 무시합니다.",
		["RestorationModStealthOrigPosTitleID"] = "바닐라 감지 미터 위치",
		["RestorationModStealthOrigPosDescID"] = "바닐라와 같은 영역에 감지 미터를 놓습니다.",
		["RestorationModLowerBagTitleID"] = "집을 때 가방 팝업 낮춤",
		["RestorationModLowerBagDescID"] = "가방을 집을 때 나타나는 팝업을 낮춥니다.",
		["RestorationModAssaultStyleTitleID"] = "어썰트 패널 스타일",
		["RestorationModAssaultStyleDescID"] = "사용하려는 어썰트 패널의 스타일을 선택합니다.",
		["RestorationModCasingTickerTitleID"] = "알파 케이싱 테이프",
		["RestorationModCasingTickerDescID"] = "알파 케이싱 테이프를 활성화 또는 비활성화합니다 (알파 테이프 스타일 필요).",
		["RestorationModCustodyTitleID"] = "알파 구금",
		["RestorationModCustodyDescID"] = "알파 구금 패널을 활성화 또는 비활성화합니다.",
		["RestorationModCrimenetTitleID"] = "알파 CRIMENET (미완성)",
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
		["RestorationModNewsFeedStyleTitleID"] = "알파 뉴스피드 스타일",
		["RestorationModNewsFeedStyleDescID"] = "뉴스피드와 뉴하이스트 박스를 둘 다 표시할지, 아니면 뉴스피드만 표시할지 선택합니다.",		
		["alpha_assault"] = "초기 알파 코너",
		["beta_assault"] = "알파 테이프",
		["show_both"] = "기본",
		["show_classic_newsfeed"] = "클래식",		

		["RestorationModDodgeDisplayTitleID"] = "회피 미터 판독 값",
		["RestorationModDodgeDisplayDescID"] = "회피 미터의 최대값 *표시*를 변경합니다. 재시작이 필요합니다.",
		["dd_scale"] = "150 - 회피율",
		["dd_150"] = "150",
		["dd_100"] = "100",

		["menu_ingame_manual"] = "오버홀 가이드",
		["menu_ingame_manual_help"] = "레스토레이션의 오버홀 가이드 봅니다.",

		["menu_asset_wet_add_saw"] = "추가 톱",
		["menu_asset_wet_add_saw_desc"] = "추가 톱을 구매합니다",
		["menu_rush_asset_sentrygun"] = "센트리 패키지",
		["menu_rush_asset_sentrygun_desc"] = "센트리 패키지를 구매합니다",

		["heist_junker_name"] = "도그하우스",
		["heist_junker_brief"] = "이건 블라드를 위한 작업이야. 분명히, 실패한 무역 거래는 그의 부하들과 그들이 가져온 물품을 나쁜 상황에 놓이게 만들고. 연방 경찰은 거의 이 상황에 직면해 있지. 너희들을 해당 위치로 데려다 줄 차량이 준비되어 있고 백업을 제공할 수 있어. 우리는 지원 헬기를 확보하고 너희들과 필수품을 그곳에서 꺼낼거야.\n\n짧을 수도 있겠지만 경찰을 과소평가 하지말고. 장비를 가져가.",
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
		["menu_color_rvd1"] = "반전",
		["menu_color_e3nice"] = "E3 Nice",
		["menu_color_force"] = "E3 BHD",
		["menu_color_halloween"] = "변이",
		["menu_color_halloween2"] = "호박 향신료",

		["color_plus"] = "E3 PAYDAY+",
		["color_rvd1"] = "반전",
		["color_e3nice"] = "E3 Nice",
		["color_force"] = "E3 BHD",
		["color_halloween"] = "변이",
		["color_halloween2"] = "호박 향신료",

		["gm_gms_purchase"] = "컨티넨탈 코인으로 구매",
		["gm_gms_purchase_window_title"] = "확실하십니까?",
		["gm_gms_purchase_window_message"] = "정말로 '{1}' 구매하시겠습니까?\n\n{3} {2}개가 소모됩니다.",
		["gm_gms_purchase_failed"] = "수량 부족",
		["gm_gms_free_of_charge_message"] = "{1}은 무료이며 원하는 만큼 많은 무기에 적용할 수 있습니다.",
		["gm_gms_cannot_afford_message"] = "{1}를 구입할 {3}이 부족합니다. {1}를 구입할려면  {2}개의 {3}이 필요합니다.",

		["bm_menu_amount_locked"] = "재고 없음",

		["resmod_challenges"] = "챌린지",
		["resmod_challenges_hint"] = "완료 및 활성화 된 챌린지를 봅니다.",
		["resmod_active_challenges"] = "활성화되어 있는 챌린지",
		["resmod_active_challenges_hint"] = "진행률 및 활성화 된 챌린지를 봅니다.",
		["resmod_completed_challenges"] = "완료된 챌린지",
		["resmod_completed_challenges_hint"] = "완료 및 달성된 챌린지를 봅니다.",

		["ch_vs_desc"] = "$weapon을(를) 사용하여 $eneType을 $count명 처치하기. 근접 공격을 사용하는 것은 이 도전에 기여하지 않습니다.",
		["ch_vs_head_shots_desc"] = "$weapon을(를) 사용하여 $eneType을 헤드샷으로 $count명 처치하기",
		["ch_vs"] = "$weapon VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon VS. $eneType 헤드샷 $no",

		["ene_law"] = "세계",
		["ene_law_desc"] = "적 유닛",

		["menu_me"] = "하이스터",

		["RestorationModPDTHChallengesTitleID"] = "PDTH 챌린지 보기",
		["RestorationModPDTHChallengesDescID"] = "메뉴와 HUD에서 PDTH 챌린지의 가시성을 전환합니다.",

		["RestorationModRaidLockPickingTitleID"] = "수정된 락픽",
		["RestorationModRaidLockPickingDescID"] = "모드가 수정된 락픽을 사용하게 설정하겠습니까? 활성화 시 회전식 락픽 게임플레이로 변경됩니다.",
		["RestorationModRaidLockPickingVOTitleID"] = "음성 라인 재생",
		["RestorationModRaidLockPickingVODescID"] = "잠금 장치를 따고 있을때 모드가 음성 대사를 재생하게 설정하겠습니까?",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT Lockpick",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT Persuade",
		["hud_legend_exit"] = "$BTN_CANCEL 키를 눌려 그만 두기",
		["RestorationModArmorFixTitleID"] = "방탄복 플래시 수정",
		["RestorationModArmorFixDescID"] = "방탄복 플래시 수정을 활성화하거나 비활성화합니다.",

		-- /// Challenges Below ///

		["ch_deploy_ammobag_hl"] = "마지막 총알이야!",
		["ch_deploy_ammobag"] = "$count개의 탄약 가방을 배치하기",
		["ch_plant_tripmine_hl"] = "레이져 쇼",
		["ch_plant_tripmine"] = "$count개의 트립 마인을 배치하기",
		["ch_deploy_medicbag_hl"] = "보험 혜택",
		["ch_deploy_medicbag"] = "$count개의 메딕백을 배치하기",
		["ch_deploy_ecm_hl"] = "시스템 크래셔",
		["ch_deploy_ecm"] = "$count개의 ECM를 배치하기",
		["ch_deploy_fak_hl"] = "생명선",
		["ch_deploy_fak"] = "$count개의 구급 키트를 배치하기",
		["ch_deploy_sentry_hl"] = "화이트 메사 애호가",
		["ch_deploy_sentry"] = "$count개의 센트리를 배치하기",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "무거운 방탄복과 더 무거운 무기",
		["ch_watchdogs_d1_heavy_wpn1"] = "와치독스 작업의 첫번째 날을 오버킬 난이도 이상에서 ICTV를 착용한 채 미니건, Thanatos 저격총 또는 RPG만 사용하여 완료하기. 이 도전을 완료하려면 하이스트의 시작부터 플레이해야 합니다.",

		-- New challanges
		["ch_melee_test"] = "망토와 단검",
		["ch_melee_test_desc"] = "캡틴 어텀을 주먹만을 사용해 처치하기",
		["ch_pro_job_test"] = "군조차도 우릴 막을 순 없지",
		["ch_pro_job_test_desc"] = "파이어스타터 작업을 메이헴 난이도 이상에서 프로 잡을 활성화한 채 완료하기",
		["ch_summers_test"] = "옛 세대가 더 낫다",
		["ch_summers_test_desc"] = "캡틴 서머스를 Mk.1 화염방사기만 사용하여 처치하기",
		["ch_winters_test"] = "정의 실현 실패",
		["ch_winters_test_desc"] = "방패를 든 캡틴 윈터스를 스위치 블레이드나 윙 버터플라이 나이프만 사용하여 처치하기",
		["ch_spring_test"] = "내 총이 니 총보다 더 커",
		["ch_spring_test_desc"] = "캡틴 스프링을 Vulcan 미니건 또는 XL 5.56 마이크로건만을 사용하여 처치하기",
		
		["ch_pdth_style_fwb"] = "올드 스쿨: 퍼스트 월드 뱅크",
		["ch_pdth_style_fwb_desc"] = "퍼스트 월드 뱅크 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_heat"] = "올드 스쿨: 히트 스트리트",
		["ch_pdth_style_heat_desc"] = "히트 스트리트 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_panic"] = "올드 스쿨: 패닉룸",
		["ch_pdth_style_panic_desc"] = "패닉룸 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_bridge"] = "올드 스쿨: 그린 브릿지",
		["ch_pdth_style_bridge_desc"] = "그린 브릿지 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_diamond"] = "올드 스쿨: 다이아몬드 하이스트",
		["ch_pdth_style_diamond_desc"] = "다이아몬드 하이스트 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_slaughterhouse"] = "올드 스쿨: 도살장",
		["ch_pdth_style_slaughterhouse_desc"] = "도살장 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_counterfeit"] = "올드 스쿨: 카운터핏",
		["ch_pdth_style_counterfeit_desc"] = "카운터핏 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_undercover"] = "올드 스쿨: 언더커버",
		["ch_pdth_style_undercover_desc"] = "언더커버 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		["ch_pdth_style_nomercy"] = "올드 스쿨: 노 머시",
		["ch_pdth_style_nomercy_desc"] = "노 머시 작업을 오버킬 난이도 이상에서 투피스 정장 또는 경량 방탄 조끼를 착용하고, 스킬이 없이, 인나타에 또는 타뷸라 특성 덱을 사용하고, 개머리판 근접 공격과 PD:TH에서 사용된 무기를 사용하여 완료하기",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "상태",
		["menu_state_filter"] = "상태 필터",
		["menu_state_filter_help"] = "로비 상태를 보여줍니다.",
		["menu_state_lobby"] = "로비",
		["menu_state_loading"] = "로딩 중",
		["menu_state_ingame"] = "인게임",
		
		["menu_description"] = "계획",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "머리 없는 불도저의 검",
		["menu_l_global_value_halloween_sword"] = "이 상품은 할로윈 2013 아이템입니다!",
		
		["menu_l_global_value_shatters_fury"] = "이 상품은 베리타스 아이템입니다!",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "노 머시",
		["heist_no_mercy_ranted_brief"] = "우린 피를 얻기 위해서 머시 병원을 털거야. 그 근원에는 희귀한 바이러스를 가지고 있고 우린 그 피를 뽑아야돼. 급여가 상당히 많으니 무엇도 우릴 막을 순 없어, 이런 돈을 위해 피 좀 흘린다고 세상이 멸망하진 않으니까.",

		["heist_nmh_res_name"] = "머시 병원",
		["heist_nmh_res_brief"] = "우리의 의뢰인께서 머시 병원의 격리 병동에 있는 환자의 혈액 샘플이 필요하다고 하더군. 너희들이 가서, 보안장치를 없애고, 시민들을 제압한 뒤에 내가 우리가 찾는 녀석의 신원을 확인할 수 있도록 환자 데이터베이스를 내쪽으로 연결해. 경비가 별로 삼엄하지는 않으니까, 쉽게 끝낼 수 있지. 너희들이 옥상으로 혈액 샘플을 가져오면 일은 끝이야. 이번 작업은 뭔가 비밀스럽고, 베일에 감춰진 군사 산업이 연루된 거 같지만, 그 정도의 리스크는 감수해야지. 우리 미래에 월급날은 필요한 것이고, 거기에 짭짤한 현금 보너스까지 붙는다고 생각해.",
		
		["heist_nmh_new"] = "환자의 혈액을 채취하여 분석하라",
		["heist_nmh_new_desc"] = "혈액 샘플의 유효성을 확인하려면 원심분리기를 찾아라.",
		
		["heist_nmh_new2"] = "엘리베이터를 불려라",
		["heist_nmh_new2_desc"] = "버튼을 누르고 엘리베이터를 기다려라",
		
		["heist_nmh_new3"] = "엘리베이터를 불려라",
		["heist_nmh_new3_desc"] = "버튼을 누르고 엘리베이터를 기다려라",	
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "GO Bank Remastered",
		
		["heist_gobank_v2_name"] = "GO Bank Remastered",
		["heist_gobank_v2_brief"] = "This is a classic bank job. Break the vault, empty the deposit boxes and get the loot out. Simple. Bain's intel says this branch has the lowest hit-rate in the country. It's time to change that.\n\n» Search the environment for keycards. Two are needed for the vault\n» Failing that, use a drill on the vault\n» Crack open the deposit boxes\n» Assemble the skyhook\n» Get the money out",
		
		["heist_roberts_v2_name"] = "로버츠 은행",
		["heist_roberts_v2_brief"] = "우리가 이벤에 노릴곳은 은행이야. 큰 지점은 아니지만, 이 은행의 금고안에 임시적으로 수송할 현글을 보관하고 있다는 정보를 얻었어. 대부분 외화라고 하더라고.\n\n어쨌든, 일은 어떻게 진행되는지 알고 있지? - 너희가 하고 싶은대로 하면돼. 조용히 처리하던가, 아니면 지옥을 펼치던가. 어느쪽을 선택하든, 돈을 빼돌릴 방법은 내가 마련해 놨어. 아마 상당히 마음에 들꺼야.",

		["csgo_plane_timer_text"] = "Wait for the plane &&TIMER",
		["csgo_plane_timer_desc"] = "Wait for the plane &&TIMER",
		
		["hud_equipment_pickup_spraycan"] = "$BTN_INTERACT 를 눌러 스프레이 캔을 얻기",
		["hud_action_spraypaint"] = "$BTN_INTERACT 를 눌러 스프레이 뿌리기",
		["hud_action_spraypaint_none"] = "스프레이 캔이 필요합니다",
		["spraycan_obtained"] = "스프레이 캔 획득",
		["hud_equipment_obtained_spraycan"] = "스프레이 캔 획득",
		
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
		
		["heist_xmn_tag_name"] = "FBI 침입 크리스마스 버전",
		
		--Rats Zipline
		["menu_alex_1_zipline_desc"] = "빠른 가방 운송을 위한 가방 짚라인을 삽니다",
		
		--The Bomb: Forest Breifing
		["heist_crojob3_briefing"] = "오늘 아침에 열기압 폭탄이 열차에 실렸다고 해. 노퍽으로 향하는 열차인데 아마도 누가 그걸 사거나, 해체를 할지도 모르지, 하지만 그건 별로 상관없어, 왜냐면 도착하지 못할 거니까. 움직이는 기차를 멈추는 건 어렵지만 옛날 서부 방식을 사용할 거야. 다리의 일부분을 날려 버리면 통째로 굴러떨어지겠지. 시끄럽고 지저분할지는 몰라도 하지만 효과적이야. 열차는 사방팔방 흩어질 거야. 그 중 하나의 금고에 우리의 폭탄이 실려있을 테니 전부다 살펴보고 가져와.\n\n자칼의 충고:\n현장 근처에 있는 리퍼 팀을 감지했어. 아무래도 아칸이 저 폭탄을 원하는 것 같다. 문제 일으킬 준비를 하라고.",		
		
		["heist_skm_watchdogs_stage2_briefing"] = "미아 칼리엔테는 살아있는 물건이 될걸세. 친구들, 그녀는 수년 동안 DC에서 머키워터의 작전 뒤에 있는 두뇌 역할을 하고 있었지. 얼마 전 머키워터는 어느 부두의 창고를 인수하여 추가 유통 지점으로 사용하고 있다네, 우리의 목표는 그들이 최근 해외에서 약탈한 전리품들을 확인하는 것이지. 거기에 들어가서 그 애새끼를 잡고 인질로 삼을걸세. 머키들은 그녀를 잃을 순 없을테니 그녀를 구하기 위해 우리에게 돈을 줄 것이라네. 아마도 앞서 언급한 좀 더 가치 있는 약탈품을 줄까?, 자네들의 생각은 어떨세?",

		--Side Jobs
		["menu_challenge_menu_challenge_moon_6_obj"] = "도살장 작업에서 오버킬 난이도 이상으로 캡틴 스프링을 물리치지 않은채로 완료하십시오.",
		
		--Generic Captain Text
		["hud_assault_vip"] = "캡틴을 죽여 어썰트 종료시키기",
		
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
			["hud_assault_vip"] = "두려워하지 마라, 캡틴 윈터스가 도착했다!!",
		})
	elseif captain_type == restoration.captain_types.winter then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "캡틴 윈터스를 죽여 어썰트 종료시키기",
		})
	elseif captain_type == restoration.captain_types.summer then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "캡틴 서머스 팀을 죽여 어썰트 종료시키기",
		})
	elseif captain_type == restoration.captain_types.spring then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "캡틴 스프링을 죽여 어썰트 종료시키기",
		})		
	elseif captain_type == restoration.captain_types.autumn then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "캡틴 어텀을 죽여 어썰트 종료시키기",
		})
	elseif captain_type == restoration.captain_types.hvh then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "악몽을 마주하고 잠에서 깨어나라",
		})
	end			
	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "플레이어 검사",
		["menu_inspect_player_desc"] = "플레이어의 통계를 검사합니다.",
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
		["heist_skmc_fish_name"] = "레테 요트",
		["heist_skmc_ovengrill_name"] = "오븐그릴 하드웨어",
		["heist_skmc_mad_name"] = "DRAK 연구개발 연구소",
		["heist_skm_friend_name"] = "엘 푸레이디스 맨션",		
		["heist_skm_nightmare_name"] = "옛 세이프하우스",
		["heist_skm_nightmare_lvl_name"] = "세이프하우스?",

		--Heist Breifings--
		["heist_pines_briefing"] = "너희들은 빨리 장소에 도착해야해, 하지만 장소가 숲속이다 보니까 낙하산으로 가야할꺼야. 조종사를 찾아봐 아마 사고지점 근처에 있을거야 그리고 탈출시킬 헬리콥터를 호출해. 그리고, 블라드가 말하길 그 비행기에 많은 상품이 있었다고 하더군, 숲을 수색해서 가지고 올 수 있는만큼 가지고와, 크리스마스에서 돈을 버는게 나쁘지는 않잖아?\n\n자칼의 충고:\n그 충돌로 인한 폭발은 인근 리퍼 팀을 건들었나봐. 경찰의 대응은 기대하지말라고.",

		----Custom Achievements----
				
		--Scarface Mansion--
		["skm_friend_name"] = "홀드아웃: 엘 푸레이디스 맨션",
		["friend_3"] = "빌어먹을 정도의 최고",
		["friend_3_desc"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 3까지 버티기.",
		["friend_3_obj"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 3까지 버티기.",
		["friend_5"] = "인질은 너의 것",
		["friend_5_desc"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 5까지 버티기.",
		["friend_5_obj"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 5까지 버티기.",
		["friend_7"] = "그딴 총알로 날 죽일 수 있을거라고 생각하냐?",
		["friend_7_desc"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 7까지 버티기.",
		["friend_7_obj"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 7까지 버티기.",
		["friend_9"] = "저 새끼들이 도망치는 꼴을 보라고!",
		["friend_9_desc"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 9까지 버티기.",
		["friend_9_obj"] = "엘 푸레이디스 맨션 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 9까지 버티기.",

		--Safehouse Nightmare--
		["skm_nightmare_name"] = "홀드아웃: 옛 세이프하우스",
		["nightmare_3"] = "진정 그 시간이 또 돌아왔나요?",
		["nightmare_3_desc"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 3까지 버티기.",
		["nightmare_3_obj"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 3까지 버티기.",
		["nightmare_5"] = "초자연적인 현상이 일어나지 않는 한, 이건 쉽겠군.",
		["nightmare_5_desc"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 5까지 버티기.",
		["nightmare_5_obj"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 5까지 버티기.",
		["nightmare_7"] = "아무리 밤이 어둡더라도 아침은 반드시 올거야.",
		["nightmare_7_desc"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 7까지 버티기.",
		["nightmare_7_obj"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 7까지 버티기.",
		["nightmare_9"] = "일어나세요, 스틸 씨. 이제 새로운 시작이에요.",
		["nightmare_9_desc"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 9까지 버티기.",
		["nightmare_9_obj"] = "옛 세이프하우스 하이스트에서의 홀드아웃을 웨이브 1부터 웨이브 9까지 버티기.",
				
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "펠릿이 뭉치지 않고 #{risk}#수평으로 퍼지게 합니다.##",
		["bm_wp_ns_ultima_desc_sc"] = "펠릿의 종합 퍼짐을 75%만큼 증가시킵니다.",
		["bm_wp_upg_a_slug_sc"] = "철갑 슬러그탄",
		["bm_wp_upg_a_slug_spam_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 75%만큼을 가하고 다수의 적, 얇은 벽도 관통하는## 납탄을 발사합니다.",
		["bm_wp_upg_a_slug_desc"] = "#{skill_color}#방탄복과 다수의 적, 얇은 벽을 관통하는## 납탄을 발사합니다.",
		["bm_wp_upg_a_slug_titan_desc"] = "#{skill_color}#방탄복과 다수의 적, 방패, 타이탄 방패, 얇은 벽을 관통하는## 납탄을 발사합니다.",
		["bm_wp_upg_a_explosive_desc_sc"] = "폭발 반경이 #{skill_color}#2##미터인 #{heat_warm_color}#폭발성## 납탄을 발사합니다.\nSlugs have #{skill_color}#no falloff## but #{risk}#damage is split between the slug and explosion.##",
		["bm_wp_upg_a_custom_desc"] = "더 크고 무거운 펠릿을 #{important_1}#6개## 발사하여 #{skill_color}#더 큰 피해를 가합니다.##",
		["bm_wp_upg_a_custom_4_desc"] = "더 크고 무거운 펠릿을 #{important_1}#4개## 발사하여 #{skill_color}#더 큰 피해를 가합니다.##",
		--["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#15%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#90## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##", --NOT IN USE
		--["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#40%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#120## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#60%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#180## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Fires magnesium shards that have up to an #{skill_color}#80%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#240## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--Removed the "can only stun enemies before damage falloff starts" due to the DoT changes, dunno if I can bring it back
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "#{skill_color}#15%## 확률로 #{heat_warm_color}#적을 불태워## #{skill_color}#2초에 걸쳐## 피해를 #{heat_warm_color}#90##까지 가하는 마그네슘 파편을 발사합니다.", --NOT IN USE
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "#{skill_color}#40%## 확률로 #{heat_warm_color}#적을 불태워## #{skill_color}#2초에 걸쳐## 피해를 #{heat_warm_color}#120##까지 가하는 마그네슘 파편을 발사합니다.\n\n#{risk}#적을 불태울 확률은 사거리에 따라 감소합니다.##",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "#{skill_color}#60%## 확률로 #{heat_warm_color}#적을 불태워## #{skill_color}#2초에 걸쳐## 피해를 #{heat_warm_color}#180##까지 가하는 마그네슘 파편을 발사합니다.\n\n#{risk}#적을 불태울 확률은 사거리에 따라 감소합니다.##",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "#{skill_color}#80%## 확률로 #{heat_warm_color}#적을 불태워## #{skill_color}#2초에 걸쳐## 피해를 #{heat_warm_color}#240##까지 가하는 마그네슘 파편을 발사합니다.\n\n#{risk}#적을 불태울 확률은 사거리에 따라 감소합니다.##",
		["bm_wp_upg_a_rip"] = "톰스톤 벅샷",
		["bm_wp_upg_a_rip_auto_desc_sc"] = "#{skill_color}#2##초에 걸쳐 독 피해를 #{stats_positive}#60##까지 가하고 적을 스턴 시키는 #{stats_positive}#독이 발려져있는 벅샷##을 발사합니다.\n\n#{risk}#지속 시간은 사거리 내에서 멀어질 수록 감소합니다.##",
		["bm_wp_upg_a_rip_semi_desc_sc"] = "#{skill_color}#4##초에 걸쳐 독 피해를 #{stats_positive}#120##까지 가하고 적을 스턴 시키는 #{stats_positive}#독이 발려져있는 벅샷##을 발사합니다.\n\n#{risk}#지속 시간은 사거리 내에서 멀어질 수록 감소합니다.##",
		["bm_wp_upg_a_rip_pump_desc_sc"] = "#{skill_color}#6##초에 걸쳐 독 피해를 #{stats_positive}#180##까지 가하고 적을 스턴 시키는 #{stats_positive}#독이 발려져있는 벅샷##을 발사합니다.\n\n#{risk}#지속 시간은 사거리 내에서 멀어질 수록 감소합니다.##",
		["bm_wp_upg_a_rip_heavy_desc_sc"] = "#{skill_color}#8##초에 걸쳐 독 피해를 #{stats_positive}#240##까지 가하고 적을 스턴 시키는 #{stats_positive}#독이 발려져있는 벅샷##을 발사합니다.\n\n#{risk}#지속 시간은 사거리 내에서 멀어질 수록 감소합니다.##",	
		--["bm_wp_upg_a_piercing_auto_desc_sc"] = "#{skill_color}#8##초에 걸쳐 #{skill_color}#96##의 출혈 피해를 가하는 #{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		--["bm_wp_upg_a_piercing_semi_desc_sc"] = "#{skill_color}#8##초에 걸쳐 #{skill_color}#120##의 출혈 피해를 가하는 #{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		--["bm_wp_upg_a_piercing_pump_desc_sc"] = "#{skill_color}#8##초에 걸쳐 #{skill_color}#180##의 출혈 피해를 가하는 #{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		--["bm_wp_upg_a_piercing_heavy_desc_sc"] = "#{skill_color}#8##초에 걸쳐 #{skill_color}#240##의 출혈 피해를 가하는 #{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		["bm_wp_upg_a_piercing_9_auto_desc_sc"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#9발##을 발사합니다.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.",
		["bm_wp_upg_a_piercing_auto_desc_per_pellet"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.\n#{skill_color}#헤드샷 피해량이 100% 증가하고 적 헤드샷 배율이 감소하지 않습니다.##",
		["bm_wp_upg_a_piercing_9_auto_desc_per_pellet"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#9발##을 발사합니다.\n{skill_color}#헤드샷 피해량이 100% 증가하고 적 헤드샷 배율이 감소하지 않습니다.##",
		["bm_wp_upg_a_piercing_semi_desc_per_pellet"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.\n#{skill_color}#헤드샷 피해량이 100% 증가하고 적 헤드샷 배율이 감소하지 않습니다.##",
		["bm_wp_upg_a_piercing_pump_desc_per_pellet"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.\n#{skill_color}#헤드샷 피해량이 100% 증가하고 적 헤드샷 배율이 감소하지 않습니다.##",
		["bm_wp_upg_a_piercing_heavy_desc_per_pellet"] = "#{skill_color}#철갑## 플레셰트 #{skill_color}#12발##을 발사합니다.\n#{skill_color}#헤드샷 피해량이 100% 증가하고 적 헤드샷 배율이 감소하지 않습니다.##",	

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_1_1"] = "반사식 조준기.\n#{risk}#1.1배율.##",
		["bm_wp_upg_o_1_1_health"] = "적을 조준할 때 #{skill_color}#적의 체력을## 표시하는 반사식 조준기.\n#{risk}#1.1배율.##",
		["bm_wp_upg_o_1_2"] = "레드 닷 조준기.\n#{risk}#1.2배율.##",
		["bm_wp_upg_o_1_5"] = "홀로그램 조준기.\n#{risk}#1.5배율.##",
		["bm_wp_upg_o_1_5_pris"] = "프리즘형 조준기.\n#{risk}#1.5배율.##",
		["bm_wp_upg_o_1_5_scope"] = "저배율 조준경.\n#{risk}#1.5배율.##",
		["bm_wp_upg_o_1_8"] = "레드 닷 조준기.\n#{risk}#1.8배율.##",
		--["bm_wp_upg_o_1_8_irons"] = "보조 기계식 조준기가 달린 레드 닷 조준기.\n#{risk}#1-1.8배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌려 조준기를 전환할 수 있습니다.",
		["bm_wp_upg_o_2"] = "저배율 조준기.\n#{risk}#2배율.##",
		["bm_wp_upg_o_2_szholot"] = "열화상 홀로그램 조준기.\n#{risk}#2배율.##\n조준 시 경비원, 엘리트, 특수 적을 #{skill_color}#자동으로 표시합니다.##\n\n#{risk}#주의: 경비원은 스텔스 중에만 표시를 받을 수 있습니다.##",
		["bm_wp_upg_o_2_5"] = "저배율 조준경.\n#{risk}#2.5배율.##",
		["bm_wp_upg_o_3"] = "중거리용 조준경.\n#{risk}#3배율.##",
		["bm_wp_upg_o_3_range"] = "#{skill_color}#거리 측정기##가 내장된 중거리용 조준경.\n#{risk}#3배율.##",
		["bm_wp_upg_o_3_rds"] = "상단에 반사식 조준기가 달린 중거리용 조준경.\n#{risk}#1.1-3배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌려 조준기를 전환할 수 있습니다.",
		["bm_wp_upg_o_3_4"] = "중거리용 조준경.\n#{risk}#3.4배율.##",
		["bm_wp_upg_o_3_5"] = "중거리용 조준경.\n#{risk}#3.5배율.##",
		["bm_wp_upg_o_4"] = "중거리용 조준경.\n#{risk}#4배율.##",
		["bm_wp_upg_o_4_cod"] = "중거리용 조준경.\n#{skill_color}#저지력##이 필요할 때가 어디 있을까?\n#{risk}#4배율.##",
		["bm_wp_upg_o_4_range"] = "#{skill_color}#거리 측정기##가 내장된 중거리용 조준경.\n#{risk}#4배율.##",
		["bm_wp_upg_o_4_irons"] = "보조 기계식 조준기가 달린 중거리용 조준경.\n#{risk}#1-4배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌려 조준기를 전환할 수 있습니다.",
		["bm_wp_upg_o_4_rds"] = "일체형 반사식 조준기가 달린 중거리용 조준경.\n#{risk}#1-4배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌려 조준기를 전환할 수 있습니다.",
		["bm_wp_upg_o_4_rds_mount"] = "상단에 반사식 조준기가 달린 중거리용 저배율 가변 광학 조준경.\n#{risk}#1.1-2-4배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET##을 눌려 확대/축소 레벨과 조준기을 전환할 수 있습니다.",
		["bm_wp_upg_o_4_vari"] = "가변 확대/축소 조준경.\n#{risk}#4-8배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET##을 눌려 확대/축소 레벨을 전환할 수 있습니다.",
		["bm_wp_upg_o_4_valentine"] = "\"니들 전부 객체 지정 해주마!\"\n\n가변 확대/축소 조준경.\n#{risk}#4-8배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌려 조준기를 전환할 수 있습니다.",
		["bm_wp_upg_o_4_valentine_x"] = "난 좆도 신경 안써, 씨발 신경 안 쓴다고!\n난 좆도 신경 안 써! 씨발 신경 안 써!\n내가 좆을 신경쓰면, 씹도 신경 쓸 수 있기야 하겠지!\n하지만 좆도 신경 안쓰니까 씹도 신경 안 쓸 거야!",
		["bm_wp_upg_o_5"] = "장거리용 조준경.\n#{risk}#5배율.##",
		["bm_wp_upg_o_5_range"] = "#{skill_color}#거리 측정기##가 내장된 장거리용 조준경.\n#{risk}#5배율.##",
		["bm_wp_upg_o_5_vari"] = "가변 확대/축소 조준경.\n#{risk}#5-8배율.##\n\n조준하는 동안 #{skill_color}#$BTN_GADGET##을 눌려 확대/축소 레벨을 전환할 수 있습니다.",
		["bm_wp_upg_o_6"] = "장거리용 조준경.\n#{risk}#6배율.##",
		["bm_wp_upg_o_6_range"] = "{skill_color}#거리 측정기##가 내장된 장거리용 조준경.\n#{risk}#6배율.##",
		["bm_wp_upg_o_8"] = "장거리용 조준경.\n#{risk}#8배율.##",
		["bm_wp_upg_o_8_range"] = "{skill_color}#거리 측정기##가 내장된 장거리용 조준경.\n#{risk}#8배율.##",

		["bm_wp_upg_fl_flashlight"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 손전등을 켜거나 끕니다.",
		["bm_wp_upg_fl_laser"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 레이저를 켜거나 끕니다.",
		["bm_wp_upg_fl_dual"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 레이저와 손전등 사이를 전환합니다.",
		["bm_wp_upg_fl_vmp_marker"] = "조준 시 #{skill_color}#40##미터 내에 있는 경비원, 특수 적, 엘리트를 #{skill_color}##자동으로 표시합니다.##\n\n#{risk}#NOTE: Guards can only be marked during stealth.##",
		["bm_wp_upg_fl_second_sight_warning"] = "\n\n#{important_1}#보조 조준기가 부착되어 있어 조준 중에는 전환할 수 없습니다.##",

		["bm_wp_upg_o_angled_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 주 광학 조준기와 각진 조준기 사이를 전환합니다.",
		["bm_wp_upg_o_angled_1_1_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 주 광학 조준기와 각진 반사식 조준기 사이를 전환합니다.\n#{skill_color}#1.1배율.##",
		["bm_wp_upg_o_angled_1_2_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 주 광학 조준기와 각진 레드 닷 조준기 사이를 전환합니다.\n#{skill_color}#1.2배율.##",
		["bm_wp_upg_o_angled_laser_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 주 광학 조준기와 무기 각도를 기울어 레이저 이용하는 조준 방식 사이를 전환합니다.\n\n#{risk}#레이저 가젯과 함께 사용하는 것을 적극 권장합니다.##", --VMP Point Shoot Laser
		["bm_wp_upg_o_angled_aim_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 기본 조준과 조준 기울기 사이를 전환합니다.##", --VMP Point Shoot Laser

		["bm_wp_upg_o_magnifier_desc"] = "조준하는 동안 #{skill_color}#$BTN_GADGET## 키를 눌러 조준경을 위아래로 뒤집습니다.\n#{risk}#3배율.##",

		--'Nade Launchers--
		--Incendiary UGL Nades
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "목표에 적중 시 #{heat_warm_color}#화염 지대##를 생성하는 유탄을 발사합니다.\n화염 지대는 반경 #{skill_color}#3.75##미터이고, #{skill_color}#5##초간 지속되며, 지대 안에 있는 적에게 초당 #{skill_color}#120##의 피해를 가하고, 일정 확률로 대부분의 적에게 불을 붙여 공포에 휩싸이게 만들며, #{skill_color}#3##초 동안 추가로 #{skill_color}#60##의 피해를 가합니다.",
		["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "목표에 적중 시 #{heat_warm_color}#화염 지대##를 생성하는 유탄을 발사합니다.\n화염 지대는 반경 #{skill_color}#3.75##미터이고, #{skill_color}#5##초간 지속되며, 지대 안에 있는 적에게 초당 #{skill_color}#80##의 피해를 가하고, 일정 확률로 대부분의 적에게 불을 붙여 공포에 휩싸이게 만들며, #{skill_color}#3##초 동안 추가로 #{skill_color}#60##의 피해를 가합니다.",
		["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "목표에 적중 시 #{heat_warm_color}#화염 지대##를 생성하는 유탄을 발사합니다.\n화염 지대는 반경 #{skill_color}#3.75##미터이고, #{skill_color}#5##초간 지속되며, 지대 안에 있는 적에게 초당 #{skill_color}#36##의 피해를 가하고, 일정 확률로 대부분의 적에게 불을 붙여 공포에 휩싸이게 만들며, #{skill_color}#3##초 동안 추가로 #{skill_color}#60##의 피해를 가합니다.",
		--Frag UGL Nade
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "목표에 적중 시 #{risk}#폭발##을 일으키는 유탄을 발사합니다. 폭발은 #{skill_color}#720##의 피해를 가하고 반경은 #{skill_color}#5##미터입니다.",
		--Taser UGL Nades
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "목표에 적중 시 #{ghost_color}#전기 폭발##을 일으키는 유탄을 발사합니다. 폭발은 #{skill_color}#5##미터 반경 내에 #{skill_color}#360##의 피해를 가하고 일정 확률로 적을 #{ghost_color}#감전시킬 수 있습니다.##",
		["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "목표에 적중 시 #{ghost_color}#전기 폭발##을 일으키는 유탄을 발사합니다. 폭발은 #{skill_color}#5##미터 반경 내에 #{skill_color}#180##의 피해를 가하고 일정 확률로 적을 #{ghost_color}#감전시킬 수 있습니다.##",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "목표에 적중 시 #{ghost_color}#전기 폭발##을 일으키는 유탄을 발사합니다. 폭발은 #{skill_color}#5##미터 반경 내에 #{skill_color}#300##의 피해를 가하고 적을 일정 확률로 적을 #{ghost_color}#감전시킬 수 있습니다.##",
		--Gas UGL Nades
		["bm_wp_upg_a_grenade_launcher_poison"] = "만티코어-6 유탄",
		["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "목표에 적중 시 #{stats_positive}#유독가스 구름##을 생성하는 유탄을 발사합니다.\n가스는 반경 #{skill_color}#6##미터이며, #{skill_color}#8##초 동안 지속되고, #{skill_color}#8##초 동안 #{skill_color}#240##의 피해를 가하며, 가스에 갇힌 대부분의 적에게 #{stats_positive}#구토## 효과를 #{important_1}#한 번## 유발시킵니다.",
		["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "목표에 적중 시 #{stats_positive}#유독가스 구름##을 생성하는 유탄을 발사합니다.\n가스는 반경 #{skill_color}#6##미터이며, #{skill_color}#6##초 동안 지속되고, #{skill_color}#6##초 동안 #{skill_color}#180##의 피해를 가하며, 가스에 갇힌 대부분의 적에게 #{stats_positive}#구토## 효과를 #{important_1}#한 번## 유발시킵니다.",
		["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "목표에 적중 시 #{stats_positive}#유독가스 구름##을 생성하는 유탄을 발사합니다.\n가스는 반경 #{skill_color}#6##미터이며, #{skill_color}#4##초 동안 지속되고, #{skill_color}#4##초 동안 #{skill_color}#120##의 피해를 가하며, 가스에 갇힌 대부분의 적에게 #{stats_positive}#구토## 효과를 #{important_1}#한 번## 유발시킵니다.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "레어",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "불이 붙은 적의 화상 지속시간을 두 배로 늘리지만, 시간이 지남에 따라 피해량은 절반으로 줄어듭니다.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "불이 붙은 적의 화상 지속시간을 반으로 줄이지만, 시간이 지남에 따라 피해량은 두 배로 증가합니다.",
		["bm_ap_flamethrower_sc_desc"] = "수천도의 완전한 고통. 어쩌다 이 지경이 됐을까요?\n#{heat_warm_color}#화염은 방탄복을 뚫고 태울 수 있습니다.##",
		["bm_ap_money_sc_desc"] = "수천 달러의 순수한 다시 없을 행복. 밸브를 돌려서 현금을 뿌리세요.\n#{competitive_color}#현금은 방탄복을 뚫고 뇌물을 줄 수 있습니다.##", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "슈퍼 사이즈 미!", -- lol
		["bm_wp_m134_body_upper_light"] = "경량 몸체",
		["bm_wp_upg_a_halfthatkit_desc"] = "무기를 장착하는 동안 이동 속도가 10%만큼 감소합니다.\n\n무기의 탄약 회수률이 20% 증가합니다.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "무기를 장착하는 동안 이동 속도가 25%만큼 감소합니다.\n\n무기의 탄약 회수률이 50% 증가합니다.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "전쟁과 범죄 속에서 충족시킬 수 없는 피에 대한 갈망을 보여준 특별 제작 AK입니다.",
		["bm_wskn_deagle_bling_desc_sc"] = "게임을 통해 명사수를 기를 수 있다는 것을 세계에 증명해 준 수제 제작한 Deagle입니다.",

		--Exclusive Sets--
		["bm_wp_upg_ultima_body_kit_desc_sc"] = "이 전용 세트는 다른 가젯과 함께 사용할 수 없는 고유한 #{risk}#트리플 쓰렛 레이저 조준기##가 추가됩니다.",
		["bm_wp_upg_fmg9_conversion_desc_sc"] = "이 전용 세트는 #{risk}#첨단 탄약 카운터##가 장착되어 있으며, 다른 가젯과 함께 사용할 수 없는 레이저 조준기도 포함되어 있습니다.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "수정치 없음",
		["bm_wp_upg_bonus_sc_none_desc"] = "무기 스킨의 부스트 효과를 비활성화합니다.",
		
		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_multishot_1"] = "발사체가",
		["bm_menu_weapon_multishot_2"] = "발로 나뉘어지고, 각각",
		["bm_menu_weapon_multishot_3"] = "의 피해를 가합니다.",
		["bm_menu_weapon_ene_hs_mult_sub"] = "적 헤드샷 배율이 일반 값의 ",
		["bm_menu_weapon_ene_hs_mult_add"] = "적 헤드샷 배율이 일반 값의 ",
		["bm_menu_weapon_ene_hs_mult_end"] = " 로 감소 혹은 증가합니다.",
		["bm_menu_weapon_hs_mult_1"] = "캡틴이 아닌 적에게 헤드샷을 입히면 대미지를 ",
		["bm_menu_weapon_hs_mult_2"] = "만큼 더 가합니다.",
		["bm_menu_weapon_exp_no_hs_info"] = "#{risk}#고폭탄이 장전되어 있습니다.## #{skill color}#직격 시 총알 피해로 간주되는 추가 피해가 50%만큼 증가합니다.##",
		["bm_menu_weapon_movement_penalty_info"] = "무기를 들고있는 동안 이동 속도가 ",
		["bm_menu_weapon_movement_bonus_info"] = "무기를 들고있는 동안 이동 속도가 ",
		["bm_menu_weapon_sms_bonus_info"] = "무기를 들고있는 동안 사격 중 이동 속도 패널티가 ",
		["bm_menu_weapon_movement_penalty_info_2"] = " 감소 혹은 증가합니다.",
		["bm_menu_sms_info_cont"] = "패널티가 증가합니다.",
		["bm_menu_sms_info_cont_2"] = "현재 개조품으로 인해 사격 시 패널티가 증가합니다.",
		["bm_menu_sms_info_2"] = " 만큼 사격 시 감소합니다.",
		["bm_menu_stat_sms_info_2"] = " 만큼 현재 개조품으로 인해 사격 시 감소합니다.",
		["bm_menu_weapon_slot_search_empty"] = "\n##\"$search\"## ##에 대한 결과가 없습니다.##",
		["bm_menu_weapon_slot_warning_1"] = "\n##//////////               사용하지 마시오               //////////\n",
		["bm_menu_weapon_slot_warning_2"] = "\n//////////               사용하지 마시오               //////////##",
		["bm_menu_weapon_slot_warning_primary"] = "무기가 주무기 슬롯으로 이동되었습니다.\n보조무기로 사용 시 하이스트에서 충돌이 발생할 수 있습니다.",
		["bm_menu_weapon_slot_warning_secondary"] = "무기가 보조무기 슬롯으로 옮겨졌습니다.\n주무기로 사용 시 하이스트에서 충돌이 발생할 수 있습니다.",
		["bm_menu_weapon_slot_warning_disabled"] = "무기가 캡틴 어텀에 의해 비활성화 되었습니다.\n사용하면 하이스트에서 충돌이 발생할 수 있습니다.",
		["bm_menu_weapon_slot_warning_wtfdoido"] = "만약 인벤토리에 해당 무기를 가지고 있다면 장착하지 마십시오.\n\n현재 해당 무기의 밸런스를 맞출 방법을 찾지 못했습니다.",
		["empty"] = "",
		["missing_cap"] = "#{risk}#Custom Attachment Points가## #{important_1}#설치되지 않았습니다.##\n\n해당 부착물은 슬롯의 기본 모양으로 보일 것입니다.",
		["bm_slamfire_generic_desc"] = "#{important_1}#더 높은 반동, 확산 및 조준이 불가능해지는 대신## 발사 속도를 높이기 위해 슬램 파이어를 할 수 있습니다.",
		["bm_rapidfire_generic_desc"] = "#{important_1}#사거리가 감소하고 반동이 높아지는 대신## 연사 속도를 높이기 위해 속사를 할 수 있습니다.",
		["bm_ap_weapon_sc_desc"] = "#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇을 관통할 수 있습니다.##",
		["bm_ap_weapon_semi_sc_desc"] = "#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
		["bm_ap_armor_weapon_sc_desc"] = "#{skill_color}#방탄복을 관통할 수 있습니다.##",
		["bm_ap25_armor_weapon_sc_desc"] = "#{skill_color}#방탄복을 관통하여 추가 피해의 25%를 가합니다.##",
		["bm_ap_armor_25_weapon_sc_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
		["bm_ap_armor_50_weapon_sc_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며 적을 관통할 수 있습니다.##",
		["bm_ap_armor_75_weapon_sc_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 75%를 가하고 다수의 적과 얇은 벽을 관통할 수 있습니다.##",
		["bm_pdw_gen_sc_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
		["bm_heavy_ap_weapon_sc_desc"] = "#{skill_color}#다수의 적과 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
		["bm_heavy_ap_no_mult_weapon_sc_desc"] = "#{skill_color}#다수의 적과 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",

		["bm_bow_sc_desc"] = "#{skill_color}#$BTN_FIRE## 키를 누르고 있으면 화살을 당기고 키를 놓으면 발사합니다.\n화살을 최대한 당길수록 화살의 피해량과 속도가 증가합니다.\n\n#{skill_color}#$BTN_AIM## 키을 누르면 당겨진 화살를 놓습니다.\n\n화살은 집어서 회수할 수 있습니다.\n#{skill_color}#방탄복을 관통할 수 있습니다.##",
		["bm_bow_exp_sc_desc"] = "#{skill_color}#$BTN_FIRE## 키를 누르고 있으면 화살을 당기고 키를 놓으면 발사합니다.\n화살을 최대한 당길수록 화살의 피해량과 속도가 증가합니다.\n\n#{skill_color}#$BTN_AIM## 키을 누르면 당겨진 화살를 놓습니다.\n\n#{risk}#화살은 목표에 적중 시 폭발합니다.## #{risk}#피해는 화살와 폭발로 나뉩니다.##",
		["bm_w_bow_exp_desc"] = "#{skill_color}#2##미터 반경 내에서 목표에 적중 시 #{risk}#폭발##하는 화살을 발사합니다.\n\n#{important_1}#화살의 속도가 감소하며, 회수할 수 없어 재사용이 불가능해집니다.##",
		["bm_w_bow_light_poison_desc"] = "#{stats_positive}#독##이 묻은 화살을 발사하여 적을 기절시키고 #{skill_color}#6##초 동안 #{stats_positive}#180##의 독 피해를 가합니다.\n\n#{important_1}#화살의 속도가 약간 감소합니다.##",
		["bm_w_bow_heavy_poison_desc"] = "#{stats_positive}#독##이 묻은 화살을 발사하여 적을 기절시키고 #{skill_color}#8##초 동안 #{stats_positive}#240##의 독 피해를 가합니다.\n\n#{important_1}#화살의 속도가 약간 감소합니다.##",

		["bm_xbow_sc_desc"] = "화살은 집어서 회수할 수 있습니다.\n\n#{skill_color}#방탄복을 관통할 수 있습니다.##",
		["bm_xbow_exp_sc_desc"] = "#{risk}#화살은 목표에 적중 시 폭발합니다.## #{skill_color}#직격 시 총알 피해로 간주되는 50%의 추가 피해를 입힙니다.##",
		["bm_w_xbow_exp_desc"] = "#{skill_color}#2##미터 반경 내에서 목표에 적중 시 #{risk}#폭발##하는 화살을 발사합니다.\n\n#{important_1}#화살의 속도가 감소하며, 회수할 수 없어 재사용이 불가능해집니다.##",
		["bm_w_xbow_light_poison_desc"] = "#{stats_positive}#독##이 묻은 화살을 발사하여 적을 기절시키고 #{skill_color}#6##초 동안 #{stats_positive}#180##의 독 피해를 가합니다.\n\n#{important_1}#화살의 속도가 약간 감소합니다.##",
		["bm_w_xbow_heavy_poison_desc"] = "#{stats_positive}#독##이 묻은 화살을 발사하여 적을 기절시키고 #{skill_color}#8##초 동안 #{stats_positive}#240##의 독 피해를 가합니다.\n\n#{important_1}#화살의 속도가 약간 감소합니다.##",

		["bm_airbow_sc_desc"] = "화살은 집어서 회수할 수 있습니다.\n\n#{skill_color}#방탄복을 관통할 수 있습니다.##",
		["bm_airbow_exp_sc_desc"] = "#{risk}#화살은 목표에 적중 시 폭발합니다.## #{skill_color}#직격 시 총알 피해로 간주되는 50%의 추가 피해를 입힙니다.##",
		["bm_w_airbow_poison_desc"] = "#{stats_positive}#독##이 묻은 화살을 발사하여 적을 기절시키고 #{skill_color}#4##초 동안 #{stats_positive}#120##의 독 피해를 가합니다.\n\n#{important_1}#화살의 속도가 약간 감소합니다.##",

		["bm_40mm_weapon_sc_desc"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 #{skill_color}#30##미터로 영점 조정된 리프 조준기로 전환합니다.",
		["bm_rocket_launcher_sc_desc"] = "해당 무기로 폭발 피해를 가하면 #{skill_color}#포탑을 즉시 파괴합니다.##",
		["bm_quake_shotgun_sc_desc"] = "두 개의 총신을 동시에 발사하여 펠릿의 수를 두 배로 늘립니다.",
		["bm_hx25_buck_sc_desc"] = "12개의 펠릿을 넓은 범위로 발사합니다.\n\n발사기와 관련된 스킬을 사용합니다.",
		["bm_auto_generated_sc_desc"] = "해당 무기는 자동 생성된 능력치를 사용하므로 제작자의 의도에 맞지 않거나 밸런스가 완벽하게 맞지 않을 수 있습니다.",
		["bm_auto_generated_ap_sc_desc"] = "해당 무기는 자동 생성된 능력치를 사용하므로 제작자의 의도에 맞지 않거나 밸런스가 완벽하게 맞지 않을 수 있습니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
		["bm_auto_generated_sap_sc_desc"] = "해당 무기는 자동 생성된 능력치를 사용하므로 제작자의 의도에 맞지 않거나 밸런스가 완벽하게 맞지 않을 수 있습니다.\n\n#{skill_color}#방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
		["bm_auto_generated_lmg_sc_desc"] = "해당 무기는 자동 생성된 능력치를 사용하므로 제작자의 의도에 맞지 않거나 밸런스가 완벽하게 맞지 않을 수 있습니다.",
		["bm_auto_generated_mod_sc_desc"] = "해당 개조품의 능력치는 자동 커스텀 개조품 능력치 생성이 완료될 때까지 제거되었습니다.",

		--Overhaul Content Indicators--
		["loot_sc"] = "레스토레이션 오버홀",
		["loot_sc_desc"] = "이 상품은 레스토레이션 오버홀의 아이템입니다!",
		["loot_sc_wcc_desc"] = "이 상품은 레스토레이션 오버홀의 아이템입니다! (WEAPON COLOR PACK 2가 필요합니다.)",
		["loot_sc_ocp_desc"] = "이 상품은 레스토레이션 오버홀의 아이템입니다! (WEAPON COLOR PACK 3이 필요합니다.)",
		["loot_sc_faco_desc"] = "이 상품은 레스토레이션 오버홀의 아이템입니다! (JIU FENG SMUGGLER PACK 1이 필요합니다.)",

		["menu_l_global_value_omnia"] = "옴니아",
		["menu_l_global_value_omnia_desc"] = "이 상품은 옴니아의 아이템입니다!",

		["menu_rifle"] = "소총",
		["menu_jowi"] = "윅",
		["menu_moving_target_sc"] = "세밀함",

		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",

		["bm_hint_titan_60"] = "The Titandozer leaves in 60 seconds!",
		["bm_hint_titan_10"] = "The Titandozer leaves in 10 seconds!",
		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",

		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",
		["bm_menu_gadget_plural"] = "가쳇",
		["menu_pistol_carbine"] = "권총형 소총",
		["menu_battle_rifle"] = "전투 소총",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
			--Attack patterns - These are added at the end of melee weapon descriptions and are purposely phrased to leave the end result of a melee attack ambiguous so I don't have to make different lines for something cutting vs something bludgeoning vs something stabbing etc.
				["bm_melee_pattern_knife"] = "빠른 잽으로 공격하거나 최소 #{skill_color}#50%## 이상 충전해서 더 넓게 휘두릅니다.",

				["bm_melee_pattern_knife2"] = "넓게 휘둘러 공격합니다. 측면 이동은 공격 방향에 영향을 미칩니다.", --Also works with "melee_clean", "melee_grip" and "melee_agave"

				["bm_melee_pattern_ballistic"] = "빠른 잽으로 공격하거나 최소 #{skill_color}#50%## 이상 충전하여 넓은 스윙과 내려치기를 합니다. 측면 이동은 공격 방향에 영향을 미칩니다.", 
				["bm_melee_pattern_poker"] = "내려치거나 최소 #{skill_color}#50%## 이상 충전하여 사거리가 확장되는 잽을 합니다.", 

				["bm_melee_pattern_boxcutter"] = "넓게 휘둘러 공격합니다.", --Also works with "melee_catch" and "melee_road"

				["bm_melee_pattern_shield"] = "앞치기를 하거나 최소 #{skill_color}#50%## 이상 충전하여 넓게 휘두릅니다.",

				["bm_melee_pattern_briefcsae"] = "앞치기를 하거나 최소 #{skill_color}#50%## 이상 충전하여 내려치기합니다.",

				["bm_melee_pattern_blunt"] = "내려치기로 공격하거나, 최소 #{skill_color}#50%## 이상 충전하여 넓게 휘두릅니다.", --Also works with "melee_brick", "melee_happy" and "melee_cleaver"
					["bm_melee_pattern_blunt_90"] = "내려치기로 공격하거나, 최소 #{skill_color}#50%## 이상 충전하여 넓게 휘두릅니다.",

				["bm_melee_pattern_beardy"] = "내려치기로 공격하거나, 최소 #{skill_color}#50%## 이상 충전하여 넓게 휘두릅니다. 측면 이동은 충전된 공격 방향에 영향을 미칩니다.",
				
				["bm_melee_pattern_axe"] = "내려치기로 공격합니다.", --Also works with "melee_psycho" and "melee_pickaxe"

				["bm_melee_pattern_cutter"] = "내려치거나 최소 #{skill_color}#50%## 이상 충전하여 사거리가 확장되는 잽을 합니다.",

				["bm_melee_pattern_great"] = "내려치기로 공격하고, 측면 이동하여 넓게 휘두르거나 최소 #{skill_color}#90%## 이상 충전하여 범위가 넓어지는 잽을 시전합니다. 측면 이동은 공격 방향에 영향을 미칩니다.",
					["bm_melee_pattern_great_no_stab"] = "내려치기로 공격하거나 측면 이동하여 넓게 휘두릅니다. 측면 이동은 공격 방향에 영향을 미칩니다.", -- Also works for "melee_cs"

				["bm_melee_pattern_katana"] = "대각선으로 공격하거나 측면 이동하여 넓게 휘두릅니다. 측면 이동은 공격 방향에 영향을 미칩니다.",

				["bm_melee_pattern_fist"] = "빠른 잽으로 공격하거나 최소 #{skill_color}#50%## 이상 충전하여 훅을 시전합니다. 측면 이동은 공격 방향에 영향을 미칩니다.",

				["bm_melee_pattern_boxing"] = "빠른 잽으로 공격하거나 최소 #{skill_color}#50%## 이상 충전하여 왼쪽 훅이나 오른쪽 어퍼컷을 시전합니다. 측면 이동은 공격 방향에 영향을 미칩니다.",

				["bm_melee_pattern_tiger"] = "오른쪽 잽으로 공격하거나 최소 #{skill_color}#50%## 이상 충전하여 왼쪽 어퍼컷이나 오른쪽 훅을 시전합니다. 측면 이동은 충전된 공격 방향에 영향을 미칩니다.",

				["bm_melee_pattern_jab"] = "빠른 잽으로 공격합니다.", --For anything that basically only has centered hitboxes like "melee_pitchfork", "melee_wing" and "melee_fight"


		--Weapon Butt
		["bm_melee_weapon_info"] = "무장 강도 사건에서 총을 쏘거나 칼로 찌르는 것보다 총으로 피해자를 때리는 것이 더 흔합니다.\n\n반복적으로 휘두를 때 사이의 지연 시간은 사용한 무기의 기동성의 능력치에 따라 더욱 달라집니다.",

		--URSA/USMC KA-BAR
		["bm_melee_kabar_info"] = "URSA 나이프는 1942년에 제작된 내구성이 뛰어나며 파괴 불가능한 전투용 및 다용도 나이프입니다.\n\n보위 블레이드, 톱니 모양의 날, 쓸데없는 건 없다.\n\n고전.",
		--Krieger
		["bm_melee_kampfmesser_info"] = "독일 연방군의 정식 전투용 칼. 이 칼의 시리즈는 엄격한 ISO 표준에 따라 제조되었으며, 절삭 날 용량이 크게 향상되었습니다.\n\nCQC를 할 때 좋은 선택일 것입니다.",
		--Berger
		["bm_melee_gerber_info"] = "Berger 전투용 나이프는 접이식 클립 포인트 블레이드가 있는 인기 있는 전술용 나이프입니다. 컴팩트하고 가볍고 하이테크 소재로 빠르고 위험한 도구가 되었습니다.",
		--Lambo
		["bm_melee_rambo_info"] = "무거운 보위 블레이드가 달린 생존용 나이프. 길이, 톱니 모양의 척추, 중앙에 있는 팁은 근접 전투에서와 마찬가지로 야외에서도 잘 작동합니다.",

		--Tomahawk
		["bm_melee_tomahawk_info"] = "시간이 촉박한 상황에서는 강도질을 위한 적절한 도구를 가지고 있는지 생각해가며 시간을 낭비할 수 없습니다.\n문이나 금고 너머에 무엇이 있든, 그걸 휘두르는 강도와 똑같은 확고한 의지를 지닌 도구가 필요합니다.",
		--Becker Machete
		["bm_melee_becker_info"] = "부수고, 내리치고, 뜯어내고, 망치질하고, 베는 특수한 마체테.\n이 마체테는 굳건한 힌지 핀을 들어올리고, 문이나 창문을 벌려 열고, 진열장을 두드리는 데 효과적일 뿐만 아니라 경찰 케이블 타이를 자르는 데도 효율적입니다.",
		--Baton
		["bm_melee_baton_info"] = "현재 법 집행관이 사용할 수 있는 가장 전술적으로 정교한 충격 무기입니다.\n연방 정부의 가장 뛰어난 팀에서 테스트한 결과, 사실상 파괴가 불가능하다는 것이 입증되었습니다.",
			["bm_melee_happy_info"] = "코드로 해결되지 않을 때를 위한 조이의 개인 경찰봉입니다.",
		--Shovel
		["bm_melee_shovel_info"] = "K.L.A.S.는 다양한 레크리에이션 목적으로 이용될 수 있습니다.\n또한 무기로도 쓸 수 있습니다. 모서리를 이용하면 살과 뼈를 베어낼 수 있고, 평평한 부분을 이용하면 불쌍한 놈을 몽둥이로 때려 죽일 수 있죠.",

		--MONEY MONEY MONEY
		["bm_melee_moneybundle_info"] = "L-O-D-S OF E-M-O-N-E\n어떻게 부르냐고?\n겁나많은돈!\n\n아마도.\n\nWOP IT OUT!",
		--Fists
		["bm_melee_fists_info"] = "당신은 복싱 선수는 아니지만, 여전히 꽤 강력한 펀치를 날릴 수 있습니다.\n필요한 것은 힘, 속도, 타이밍뿐이며, 금세 강력한 일격을 날릴 수 있습니다.",
		--& Knuckles
		["bm_melee_brass_knuckles_info"] = "너클 스타일 무기는 수백 년 동안 전 세계에서 사용되어 왔습니다.\n황동 너클은 펀치의 힘을 더 단단하고 작은 부위로 집중시켜 조직이 파괴될 가능성을 높입니다. 충분히 세게 치면 뼈가 부러질 수도 있습니다.",

		--Lucille
		["bm_melee_barbedwire_info"] = "미안하지만 내세는 찾아오지 않아... 난 그저 여기 있을 뿐이야... 빌어먹을 야구 배트와 이야기하고 있을 뿐이고!\n\n#{skill_color}#3##초 동안 #{skill_color}#120##의 출혈 피해를 가합니다.", 
			["bm_melee_bleed_info"] = "#{skill_color}#3##초 동안 #{skill_color}#120##의 출혈 피해를 가합니다.",
			["bm_melee_inner_child_info"] = "Get in touch with your inner child.\n\n#{skill_color}#3##초 동안 #{skill_color}#120##의 출혈 피해를 가합니다.",

		--Bayonet
		["bm_melee_bayonet_info"] = "소총 끝에 장착하여 적의 몸에 꽂기 위해 고안된 견고한 총검입니다.\n\n그렇게 사용하는게 맞지만 그냥 일반 칼처럼 쓰면 되는 거 아니에요?",
		--Bullseye
		["bm_melee_bullseye_info"] = "솔직히 말해서 뭐라고 말해야 할지 모르겠네요. 이건 사이코패스가 아니라면 싸움에 가져갈 만한 게 아니잖아요?\n이건 통나무를 자르고 캠핑을 가는 용도이지, 은행을 털기 위한 용도는 아니라고요.\n\n맞죠?",
		--X46
		["bm_melee_x46_info"] = "X46 나이프는 부분적으로 톱니 모양의 보위 블레이드 구성을 가진 6인치 길이의 A2 코팅 강철 단일 조각으로, 가짜 상단 칼날이 있습니다.\n통합 가드와 유리 파쇄기 폼멜 팁.\n이 나이프의 다목적 현장 디자인은 긴급 상황뿐 아니라 전장에서도 유용하게 사용됩니다.",
		--Gunther
		["bm_melee_dingdong_info"] = "쇠망치.\n공성추.\n지렛대\n이 세 가지 도구는 모두 문을 빠르게 통과해야 하는 강도에게 필수적인 돌파 도구입니다.\n딩동은 이 세 가지 도구를 팀원만큼 긴밀하게 하나의 패키지로 결합했습니다.",

		--Cleaver girl
		["bm_melee_cleaver_info"] = "그는 때리고, 베고, 해킹하고 있다.\n\n몸과 팔다리에 대한 전반적인 효과가 증가하는 대신 헤드샷 피해가 #{important_1}#50%##만큼 감소합니다.",
		--Batshit insane
		["bm_melee_bat_info"] = "야구 배트, 그 이상도 이하도 아닙니다.\n\n스포츠에 사용하기 위해 만들어진 것이지만 훨씬 더 사악한 일에 쓰이게 될 겁니다.",
		--Machete
		["bm_melee_machete_info"] = "당신은 사람에게 해를 가하는 걸 좋아하죠. 그래서 이 더럽고 오래된 마체테를 쓰는 거고요.\n벌어진 상처, 엉성하게 잘린 사지, 그리고 적들의 피를 얼리는 비명 소리가 당신을 계속 나아가게 만듭니다.\n\n참으로 잔인하고 잔혹한 강도의 무기죠.",
		--Fireaxe
		["bm_melee_fireaxe_info"] = "혹시 다른 사람을 해치는 것을 좋아하시나요?\n\n그렇다면 생명을 구하기 위한 무언가로 하는 것보다 더 나은 방법이 있을까요! 한 번 내려찍음으로써 희생자들을 당신으로부터 구해내면서, 희생자들에게 당신의 눈에서 불타오르는 모습을 보여주세요.",
		--Briefcase
		["bm_melee_briefcase_info"] = "안에 무엇이 들어있든 서류 가방 자체는 놀라울 정도로 탄력적입니다.\n\n충전하는 동안 원거리 공격으로 인해 받는 피해를 #{skill_color}#10%##만큼 감소시킵니다",
			--Toasty
			["bm_melee_toast"] = "알마르의 토스트",
			["bm_melee_toast_info"] = "배고프냐?\n\n충전하는 동안 원거리 공격으로 인해 받는 피해를 #{skill_color}#10%##만큼 감소시킵니다.",

		--KA-BAR Tanto
		["bm_melee_kabar_tanto_info"] = "아시아적 영향을 받은 탄토 칼날 모양은 관통에 좋은 두꺼운 뾰족한 칼날을 가지고 있습니다. 이 칼은 가장 힘든 작업을 위해 설계되었습니다.",

		--UberHaxorNova
		["bm_melee_toothbrush_info"] = "임시 칼처럼 날카롭게 만들어 다음 희생자에게 꽂아 넣기가 준비가 된 작은 플라스틱 칫솔입니다.",

		--Psycho Knife
		--["bm_melee_chef_info"] = "당신이 화난 강도이든 정신 나간 은행 강도이든, 스테인리스 몰리브덴 강철로 제작되어 뜨겁게 단조하고 레이저로 날카롭게 연마된 이 주방용 칼은 수년간 유용하게 써먹을 수 있을 것입니다.\n\n그런데 전통적인 셰프 칼은 원래 큰 살점을 썰어서 자르는 용도로 만들어졌다는 걸 알고 계셨나요?\n\n완전히 충전된 공격은 주변 #{skill_color}#12##미터 반경 내에 공포감을 퍼뜨립니다.",
		["bm_melee_chef_info"] = "이 칼이 슈퍼마켓에서 구매한 고기를 다지는 데 사용되었는지는 잘 모르겠습니다.\n\n완전히 충전된 공격은 주변 #{skill_color}#12##미터 반경 내에 공포감을 퍼뜨립니다.",

		--Trench Knife
		["bm_melee_fairbair_info"] = "영국 코만도들에게 인기 있는 트렌치 나이프는 베는 데 매우 뛰어납니다. 매우 인기 있는 나이프로, 오늘날에도 사용되고 생산되고 있습니다.",
		--Swag
		["bm_melee_swagger_info"] = "명령을 내리고, 대중 이미지를 개선하거나, 단순히 신체적 처벌을 내리는 데 사용하세요! Swagger Stick은 자존심 있는 리더라면 꼭 가져야 할 액세서리입니다. Old Blood and Guts는 하나를 가지고 다녔고, 그의 것은 숨겨진 칼날까지 가지고 있었습니다.",
		--FREEDOM ISN'T FREE
		["bm_melee_freedom_info"] = "흰색과 번갈아 가며 배열된 빨간색 줄무늬 13개, 광저우를 나타내는 파란색 직사각형, 작고 흰색의 다섯 개의 별 50개, 애국심의 한 줌, 자유의 컵 2개 그리고 부러진 깃대.\n\n짜잔. 이제 당신은 치명적인 무기를 손에 넣었습니다.", 
		--Who needs pants?
		["bm_melee_erica_info"] = "제정신인 사람이라면 이런 걸 던질 겁니다.\n\n살아있는 적에게 완전히 충전된 공격을 가하면 #{skill_color}#5%## 확률로 폭발하여 목표 적중 지점으로부터 #{skill_color}#5##미터 반경 내에 #{risk}#720##의 피해를 가합니다.",

		--Hammer
		["bm_melee_hammer_info"] = "\"목수의 기쁨\"은 자켓이 가장 좋아하는 망치입니다. 망치는 당신이 싫어하는 사람에게 둔탁한 타격을 가하기에 완벽한 도구죠.\n\n망치의 가장 흔한 용도는 못을 박고, 부품을 맞추고, 금속을 단조하고, 물건을 부수는 것인데 자켓은 이런 용도에 별로 관심이 없습니다.",

		--OVERKILL Boxing Gloves
		["bm_melee_boxing_gloves_info"] = "나 벨소리는 듣지 못했는데?\n\nOVERKILL 복싱 글러브로 적 처치 시 #{skill_color}#스태미나가 즉시 회복됩니다.##", 

		--A stick of lies
		["bm_melee_shillelagh_info"] = "실리리그의 진짜 기원을 알아내기는 어렵습니다. 누가 처음으로 튼튼한 막대기를 집어 다른 사람의 머리를 쳤는지 어떻게 알 수 있을까요? 그리고 실리리그는 그 이상으로 크게 진화하지 않았죠. 어떤 이는 검은 가시나무를 소중히 여기고, 어떤 이는 머리를 녹은 납으로 채울 수도 있죠.\n\n결국, 이 막대기는 두개골을 깨뜨리는 무거운 막대기일 뿐입니다.",

		--Bottle
		["bm_melee_whiskey_info"] = "위스키 한 병이 스카치 위스키라고 불리려면 거쳐야 할 여러 가지 규칙과 규정이 있습니다. 단단한 병을 갖는 것이 그 중 하나는 중요하지 않지만, 빈 리버타운 글렌 병을 가장 좋아하는 근접 무기로 보는 보니에게는 그다지 중요하지 않습니다.\n\n말할 것도 없이, 술병은 그녀의 적들에게 온갖 잘못된 이유로 골치 아픈 일을 안겨줍니다.",

		--Dragan's Cleaver
		["bm_melee_meat_cleaver_info"] = "중식도는 주로 고기와 뼈를 자르는 데 사용되는 일종의 칼이지만, 정밀한 절단을 사용하는 대신 가장 튼튼한 살점조차 찢어버리는 강력한 망치와 같은 타격을 제공합니다. 또한 가축뿐만 아니라 인간도 도살해 온 오랜 역사를 가지고 있죠.\n\n당신은 전자를 하게 될 겁니다.\n\n몸과 팔다리에 대한 전반적인 효과가 증가하는 대신 헤드샷 피해가 #{important_1}#50%##만큼 감소합니다.",

		--Poker
		["bm_melee_poker_info"] = "끝이 뾰족한 긴 철 조각은 타오르는 불씨를 치우는 데 좋은 도구이지만, 혼란과 극도의 불편함을 야기하는 완벽한 도구이기도 합니다.\n\n저희 말이 믿기지 않는다면, 웨이터에게 '에드워드 2세'를 달라고 하세요.",
		--Tenderizer
		["bm_melee_tenderizer_info"] = "이 고기 망치는 주로 질긴 스테이크 조각을 부드럽게 하고 편평하게 하기 위해 설계되었지만, 경찰의 질긴 살점 조각도 부드럽게 하고 편평하게 만드는데도 유용한 것으로 입증되었습니다.\n\n연한 홀란다즈 소스와도 잘 어울리죠.",
		--Fork
		["bm_melee_fork_info"] = "볼링공 한 트럭과 죽은 도저 한 트럭의 차이점은 무엇일까요? 에미꼬치로 볼링공 한 트럭을 내릴 수 없는 없습니다.\n\n후추 양념과 함께 즐겨보세요.",
		--Speng Bib
		["bm_melee_spatula_info"] = "도로 건너편에서 경찰을 뭉개버리는 데 사용하기도 하고, 다른 사람들이 경찰의 유해를 치우는 데 사용하도록 하는 이중 목적을 가진 근접 무기입니다.\n\n이 경우에는 냅킨을 한 장 더 가져가십시오.",

		--PIPPA NO
		["bm_melee_mining_pick_info"] = "저 언덕에는 금이 있다네! 그리고 언덕이란 말은 이빨을 뜻하지. 하지만 언덕이든 이빨이든, 휘두를 수 있는 선철못보다 더 빠르게 금을 파낼 수 있는 것은 없다네.\n\n헤드샷 피해가 #{skill_color}#50%##만큼 더 증가합니다.",
		--Ebay Seller
		["bm_melee_scalper_info"] = "승자에게는 전쟁과 권력, 지배의 상징입니다.\n\n그리고 패자에게는 정말, 정말 나쁜 머리 스타일이라는 상징이죠.",
		--NAOW THIS IS A KNOIFE
		["bm_melee_bowie_info"] = "9인치 클립 포인트 파이팅 스틸. 그 기원은 고전식 해적의 시대로 거슬러 올라가지만, 널리 유명해진 것은 유명한 캐럴 카운티의 난투(그리고 피투성이의 남자 12명) 덕분입니다.",
		--MY BRAND
		["bm_melee_branding_iron_info"] = "가축의 두꺼운 가죽에 표시를 하여 식별하도록 고안된 물건일 수도 있지만, 이 불로 달군 철은 경찰이나 보안관의 부드러운 살에도 더 효과적입니다.",

		--Mic
		["bm_melee_microphone_info"] = "\"마이크에 대고 명확하게 말해봐\"",
		--Mic Stand
		["bm_melee_micstand_info"] = "마이크와 함께 제공된 스탠드를 사용하는 것도 좋습니다.",
		--Nighty Night
		["bm_melee_oldbaton_info"] = "#{stats_positive}#\"세이프워드는 '과잉 진압'이다!\"##",
		--Metal Detector
		["bm_melee_detector_info"] = "이 감지기는 아마 꺼둔 상태로 두어야 할 것입니다.",

		--Croupier Rake
		["bm_melee_croupier_rake_info"] = "돈을 모으는 용도로만 사용할 수 있는 아이템? 이게 강도에게 딱 맞는 아이템이죠! 성가신 경찰들에게 도박장이 항상 이기는 이유를 보여주십시오.",
		--Switchblade Knife
		["bm_melee_switchblade_info"] = "폭력을 위해 고안되었고 리볼버만큼 치명적인 무기가 바로 스위치블레이드입니다!\n\n적을 뒤에서 공격하면 #{skill_color}#200%##의 피해를 가합니다.",
		--Slot Lever
		["bm_melee_slot_lever_info"] = "잭팟 좀 떠라!\n\n#{skill_color}#5%## 확률로 #{skill_color}#10##배의 피해량과 넉다운을 가합니다.",
		--ZAP ZAP MOTHERFUCKER
		["bm_melee_taser_info"] = "교만한 테이저에게 달콤하고 짜릿한 복수를 하게 해줍니다.\n\n완전히 충전되면 닿은 대상에게 감전시키고 방해합니다.",

		--Kunai
		["bm_melee_cqc_info"] = "가장 강한 상대라도 이 독이 묻은 쿠나이 칼에 한 번만 상처를 내면 쓰러트릴 수 있습니다.\n\n#{stats_positive}#120##의 독 피해를 가하고 #{skill_color}#4##초 동안 #{skill_color}#0.5##초마다 #{skill_color}#50%##의 확률로 방해를 주는 이국적인 독이 발라져있습니다.",
		--Sai
		["bm_melee_twins"] = "쌍차", --Plural form is still "sai"
		["bm_melee_twins_info"] = "가끔, 쌍차로 인해 죽은 사람들은 무기가 아무리 둔하더라도 상관없다는 것을 너무 늦게 깨닫습니다.\nIn a matter of seconds they have disarmed you of your sharp ones.\n\n적의 근접 공격을 받아치면 적에게 근접 피해를 #{skill_color}#60##만큼 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.",
		--Tekko-Kagi
		["bm_melee_tiger_info"] = "원래는 벽과 나무를 오르는 데 사용되던 이 날카로운 발톱은 이를 휘두르는 사람이 발각되면 금세 무기처럼 쓰여집니다.\n\n근접 공격은 첫 번째 공격 이후부터는 매 공격마다 #{skill_color}#2배##의 피해를 가합니다.",
		--Empty Palm Kata
		["bm_melee_fight_info"] = "물이 되어라, 친구여\n\n적의 근접 공격을 받아치면 적에게 #{skill_color}#120## 근접 피해를 입힙니다. 이 피해는 스킬로 증가할 수 있습니다.",
		--Katana
		["bm_melee_katana_info"] = "진품 카타나는 걸작품이지만, 새로 만들어진 것입니다. 피를 맛보지 않았고 실제 유산이나 역사도 없습니다. 그저 그걸 만들어 줄 사용자를 기다리고 있을 뿐입니다.\n\n완전히 충전된 공격은 #{skill_color}#50%##만큼 더 빨리 나가여, 더 빠른 후속 베기가 가능합니다.",
			["bm_melee_raiden_info"] = "이건 너의 손에 있는 #{important_1}#\"정의의 도구\"##가 아니야.\n\n완전히 충전된 공격은 #{skill_color}#50%##만큼 더 빨리 나가여, 더 빠른 후속 베기가 가능합니다.",
			["bm_melee_thejobissnotyours_info"] = "이 검은 너의 것이 아니지.\n\n완전히 충전된 공격은 #{skill_color}#50%##만큼 더 빨리 나가여, 더 빠른 후속 베기가 가능합니다.",
			["bm_melee_2077tkata_info"] = "나노 필라멘트로 가열된 칼날.\n카타나의 가장 순수한 정수, 추가 기능과 개조 없이 오직 뜨거운 강철만 사용되었습니다.\n\n완전히 충전된 공격은 #{heat_warm_color}#적을 불태워## #{skill_color}#3##초 동안 #{heat_warm_color}#120##의 화염 피해를 가합니다.",

		--Ayy L-Maul
		["bm_melee_alien_maul_info"] = "Alienware Alpha 출시를 기념하기 위해 만들어진 망치입니다.",

		--Beardy
		["bm_melee_beardy_info"] = "바이킹들은 페이건 북부의 어두운 숲에서 나타났고, 아이슬란드에서 이스탄불까지 피비린내 나는 파괴의 흔적을 남겼습니다.\n그들의 무기는 양손으로 드는 턱수염 도끼였습니다.",
		--Morningstar
		["bm_melee_morning_info"] = "가시에 깊게 찔려 죽지 않았더라도, 둔기에 찔린 끔찍한 외상은 분명히 사람을 죽일 것입니다.\n이 무기는 중세 시절 전장에 난도질된 시체 더미들을 잔뜩 남겼습니다.\n\n#{skill_color}#3##초 동안 #{skill_color}#120##의 출혈 피해를 가합니다.",
		--Greatsword
		["bm_melee_great_info"] = "#{item_stage_2}#\"구멍에다가 찌르기 해봐.\"##\n\n윌리엄 월리스가 유명하게 만든 검.\n6피트 길이의 날카로운 강철로, 세무원의 가죽으로 만든 칼집에 넣어 휴대했습니다.\n\n이걸로 권위를 찔려볼까요?",
			--Jebus
			["bm_melee_jebus_info"] = "빛과 #{item_stage_2}#어둠##\n#{item_stage_2}#흑##과 백\n#{stats_positive}#생명##과 #{important_1}#죽음##\n\n바이너리 소드는 타협하지 못합니다. 그 전에 상대방을 #{important_1}#반갈죽##으로 만들기 때문이죠.",
			--Headless Dozer Sword
			["bm_melee_headless_sword_info"] = "악몽에서 만들어진 검.\n\n완전히 충전된 공격은 주변 #{skill_color}#12##미터 반경 내에 공포감을 퍼뜨립니다.",
				--Headless Dozer Hammer
				["bm_melee_titham"] = "머리 없는 불도저의 망치",
				["bm_melee_titan_hammer_info"] = "악몽에서 만들어진 망치.\n\n완전히 충전된 공격은 주변 #{skill_color}#12##미터 반경 내에 공포감을 퍼뜨립니다.",
				--im not gaj
				["bm_melee_goat_info"] = "\"그것은 검이라 하기엔 너무도 컸다. 엄청나게 크고 두껍고 무거우며, 그리고 조잡했다. 그것은 말 그대로 철퇴였다.\"\n\n완전히 충전된 공격은 주변 #{skill_color}#12##미터 반경 내에 공포감을 퍼뜨립니다.",
			--Wt ring u got bithc?
			["bm_melee_zweihander"] = "플레멘슈베어",
			["bm_melee_zweihander_info"] = "#{heat_warm_color}#\"한 번 받아쳐봐.\"##\n\n검이라기보다는 장창에 더 가까운, 거대한 양손검입니다.\n\n적의 근접 공격을 받아치면 적에게 근접 피해를 #{skill_color}#180##만큼 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.",
			["bm_melee_broad"] = "롱소드",
			["bm_melee_broad_info"] = "기사의 대표적 무기.",
		--Buckler Shield
		["bm_melee_buck_info"] = "버클러 실드는 오른손의 방어 수단이자 무기입니다.\n팔뚝에 착용하면 적에게 충분한 힘으로 내리쳐 그들의 바지를 벗길 수 있겠죠.\n\n충전하는 동안 원거리 공격으로 인해 받는 피해를 #{skill_color}#10%##만큼 감소시킵니다.",

		--Bolt cutters
		["bm_melee_cutters_info"] = "당신이 좋아하는 연쇄 살인범에게는 도끼, 칼, 날카로운 손가락이 달린 장갑 외에 더 많은 게 필요합니다.\n그 살인범은 당신 잠겨 있다고 생각했던 곳에 조용히 들어가기 위해 볼트 커터가 필요하죠.\n\n당신이 안전하다고 생각했던 곳으로 들어가기 위해...",

		--Natsumi
		["bm_melee_boxcutter_info"] = "실용적인 도구처럼 보일지 몰라도 이 칼날이 진공 밀봉된 튼튼한 플라스틱 포장 상자를 자를 수 있다면 경찰이 몸을 감쌀 수 있는 무엇이든 상대할 수 있을 겁니다.",

		--Selfie
		["bm_melee_selfie_info"] = "혹스턴이 말하길, \"저 셀카봉을 들고 있는 멍청한 새끼 좀 봐. 정말 병신이군. 저거 강력해 보이는데, 저걸 빼앗아서 저 놈을 조져 버릴꺼야. 잠깐 돌아오겠...\"",
		--Lara
		["bm_melee_iceaxe_info"] = "앙헬 폭포 아래의 미끄러운 절벽을 오를 때는 단단한 바위를 파낼 수 있는 무언가가 필요하고 D.C.에서 은행을 털 때는 경찰의 헬멧을 파낼 수 있는 무언가가 필요합니다.\n\n헤드샷 피해가 #{skill_color}#50%##만큼 더 증가합니다.",
			["bm_melee_iceaxe_gen_info"] = "헤드샷 피해가 #{skill_color}#50%##만큼 더 증가합니다.",
		--Dive
		["bm_melee_pugio_info"] = "단순하면서도 강력합니다. 목을 자르든, 엉킨 어망에 빠져나온 돌고래를 잘라내든, 잘 해내죠. 그리고 서프에서 뽐내며 허풍 떨 때 멋지게 보여줍니다.",
		--Gator
		["bm_melee_gator_info"] = "사람들은 음식 없이 3주, 물 없이 3일을 버틸 수 있다고 말하지만, 적대적인 환경에서는 좋은 칼날 없이는 3시간도 버틸 수 없습니다.",

		--Pitch fork
		["bm_melee_pitch_info"] = "바이던트인지 트라이던트인지 뭔지 그걸 누가 신경 씁니까? 사실상 갈퀴일 뿐입니다. 포세이돈과 루시퍼가 쓸 수 있다면 우리도 쓸 수 있겠죠.\n\n앞으로 달려나가면 충전이 시작되어 #{skill_color}#0.4##초마다 앞에 있는 대상에게 #{skill_color}#45##의 피해를 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.\n\n달리기 하는 도중 적을 공격하면 최대 스태미나의 #{important_1}#15%##가 소모되고, 치명타를 가하면 #{skill_color}#10%##가 회복됩니다.\n\n#{important_1}#달리고 있지 않을 때에도 적의 근접 공격을 받아칠 수 없습니다.##",
			["bm_melee_number_3_info"] = "\"너의 이상을 위해 목숨을 바칠 수 있다면, 너는 분명 그걸 위해 죽을 준비가 되어 있을 것이다!\"\n\n앞으로 달려나가면 충전이 시작되어 #{skill_color}#0.4##초마다 앞에 있는 대상에게 #{skill_color}#45##의 피해를 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.\n\n달리기 하는 도중 적을 공격하면 최대 스태미나의 #{important_1}#15%##가 소모되고, 치명타를 가하면 #{skill_color}#10%##가 회복됩니다.\n\n#{important_1}#달리고 있지 않을 때에도 적의 근접 공격을 받아칠 수 없습니다.##",
			["bm_melee_charge_info"] = "앞으로 달려나가면 충전이 시작되어 #{skill_color}#0.4##초마다 앞에 있는 대상에게 #{skill_color}#45##의 피해를 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.\n\n달리기 하는 도중 적을 공격하면 최대 스태미나의 #{important_1}#15%##가 소모되고, 치명타를 가하면 #{skill_color}#10%##가 회복됩니다.\n\n#{important_1}#달리고 있지 않을 때에도 적의 근접 공격을 받아칠 수 없습니다.##",
		--BONK
		["bm_melee_scoutknife_info"] = "녹슬고 낡아 보이는 모습에 싫증나지 마세요. 칼은 언제나 칼입니다. 그리고 어떤 사람들은 오래된 칼이 좋은 와인처럼 오래 간다고 말합니다(다만 아무도 그렇게 말한 적이 없을 겁니다). 시도해 보면 피가 나는 것을 볼 수 있을 것입니다.",
		--Shears
		["bm_melee_shawn_info"] = "양털 깎기가 스포츠의 종목에 들어간다는 사실을 알고 계셨나요? 그럼 새로운 스포츠를 만들어볼까요? 경찰 털 깎기는 어떻습니까? 기각이라뇨? 왜 안 되죠? 뭐 어쨋든... 마음대로 사용하셔도 될거 같네요...",
		--Crook
		["bm_melee_stick"] = "양치기의 지팡이",
		["bm_melee_stick_info"] = "강도질을 너무 많이 해서 지쳤나요? 늙고 현명해 보이고 싶으신가요? 경찰의 얼굴을 박살내고 싶으신가요? 양치기의 지팡이는 모든 것을 할 수 있습니다.",

		--Pounder Nailgun
		["bm_melee_nin_info"] = "파운더는 울프가 가장 좋아하는 못 박는 총입니다.\n\n누군가가 그 이름에 관해 물으면 울프는 재빨리 이름을 \"파운더\"로 수정하고 그들이 말하듯이 그는 \"박혔군!\"라고 소리칩니다.\n\n짧은 유효 사거리와 즉시 꽂히는 못을 발사하고 여전히 근접 공격으로 간주됩니다.",
			["bm_melee_thebestweapon_info"] = "#{stats_positive}#게임 내에서 가장 쩌는 무기.##",

		--Ballistic Knives
		["bm_melee_ballistic_info"] = "지미는 적을수록 더 좋다고 생각하는 사람이 아니기 때문에, 그는 스페셜리스트 칼 두 세트를 가지고 있습니다.\n\n근접 공격은 첫 번째 공격 이후부터는 매 공격마다 #{skill_color}#2배##의 피해를 가합니다.",

		--ALSO ZAP ZAP MOTHERFUCKER
		["bm_melee_zeus_info"] = "완전히 충전되면 접촉하는 대상에게 감전을 일으켜 방해를 하는 수제 전기 너클 더스터 한 쌍입니다.",

		--Wing Butterfly Knife
		["bm_melee_wing_info"] = "변장 키트와 잘 어울릴겁니다!\n\n적을 뒤에서 공격할 때 #{skill_color}#400%##의 피해를 가합니다.",

		--PICKLE
		["bm_melee_road_info"] = "러스트는 옛날식의 고통스러운 악기를 좋아하기 때문에 체인 휩을 근접 무기로 선호합니다.\n실제 체인 휩 자체는 러스트가 철물점에서 훔친 것이 아니라 샀습니다. 그는 이렇게 중요한 도구는 돈을 낼 가치가 있다고 생각했습니다. 또 다른 얼굴에 휘두르며 나는 공기를 가르는 소리에 고급스러운 터치를 더하죠.",

		--ROAMING FROTHING MADNESS
		["bm_melee_cs_info"] = "찢고 죽여라, 모든 게 끝날 때까지.\n\n충전하는 동안 앞에 있는 대상에게 매 #{skill_color}#0.25##초마다 #{skill_color}#30##의 피해를 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.\n\n#{important_1}#적의 근접 공격을 받아칠 수 없습니다.##",

		--WHERE'S THE LEAK MA'AM?
		["bm_melee_shock_info"] = "\"부탁인데...\"",

		--YOU KNOW WHEN THAT HOTLINE RING
		["bm_melee_brick_info"] = "헷갈리지 마세요. 이건 그냥 전화기가 아닙니다. 이건 80년대 통신의 전성기를 상징하던 #{stat_maxed}#핫라인## #{skill_color}#8000X##입니다.\n\n여보세요, 누구 있나요?\n방금 할 말 있어서 전화했는데...\n\n난 니가 싫어.",

		--OMG IT SPINS
		["bm_melee_ostry_info"] = "도라아아아아간다.\n\n충전하는 동안 앞에 있는 대상에게 매 #{skill_color}#0.18##초마다 #{skill_color}#18##의 피해를 가합니다. 이 피해량은 스킬로 증가시킬 수 있습니다.\n\n#{important_1}#적의 근접 공격을 받아칠 수 없습니다.##",

		--Pencil
		["bm_melee_sword"] = "연필", 
		["bm_melee_sword_info"] = "\"존은 집중적이고, 헌신적에다가 순수한 의지를 가진 놈이야... 네가 거의 모르는 걸 알여주지.\n\n난 존이 술집에서 세 명의 남자를 죽이는 걸 봤어... 연필로...\n\n망할 연필말이야.\"",

		--Russian Machete
		["bm_melee_oxide_info"] = "획기적인 디자인으로 만들어진 신뢰할 수 있는 근접 무기. 울창한 초목이 있는 지역에서는 마체테 역할을 할 수 있어야 했고, 캠프에서는 칼 역할을 할 수 있어야 했습니다. 또한 수비대 노동도 처리할 수 있어야 했습니다.\n이 도구는 조종사, 야전 군인, 그리고 좋은 야전 칼이 필요한 사람이라면 누구나 사용할 수 있었습니다.", 

		--Another Machete
		["bm_melee_agave_info"] = "시카리오로 목숨을 앗아가는 것은 오직 죽이는 것 뿐만 아니라 위협하는 것이기도 합니다. 혼란을 목격한 사람들의 내면에 흔적을 남기는 무언가 필요하다면 이때가 바로 상그레스의 마체테가 등장할 차례죠. 마체테만큼 치명적인 것을 들고 다니는 사람은 아마도 마체테를 사용할 만큼 미친 것입니다.\n\n상그레스는 자신의 마체테에 \"엘 베르두고\"라는 이름을 붙였습니다. 딱 맞는 도구에 딱 맞는 이름이죠.",

		--Alabama Razor
		["bm_melee_clean_info"] = "경찰들에게 필요한 더욱 깔끔한 면도를 제공해주세요.\n\n#{skill_color}#3##초 동안 #{skill_color}#120##의 출혈 피해를 가합니다.", 
		
		--Kento's Tanto
		["bm_melee_ohwell_info"] = "카타나와 함께 탄토는 모든 사무라이의 필수품이었습니다.\n\n이 탄토는 켄토의 것이었지만 그가 어디서 얻었는지는 알려지지 않았습니다.",

		--Spoon
		["bm_melee_spoon_info"] = "딱 한 스푼만?", 
		--Gold Spoon
		["bm_melee_spoon_gold_info"] = "먹어라, 먹어라, 먹어라, 먹어라!\n\n#{skill_color}#50%## 확률로 #{heat_warm_color}#120##의 화염 피해를 가하고 #{skill_color}#3##초 동안 적을 방해합니다.", 
			["bm_melee_fire_info"] = "#{skill_color}#50%## 확률로 #{heat_warm_color}#120##의 화염 피해를 가하고 #{skill_color}#3##초 동안 적을 방해합니다.",

		--ADOBE FALSH(LITE)
		["bm_melee_aziz_info"] = "\"진짜로 피난처를 지을 건 아니지만, 캔 한 톤과 물, 그리고 이 새로운 손전등을 샀지. 세상이 어두워지면 어떤 종류의 빛이라도 필요하거든, 아니면 한 시간은 커녕 죽을 거야. 내가 장담하지!\"",

		--Chac
		["bm_melee_chac_info"] = "이 마라카스로 리듬을 타고 말 그대로 두개골을 흔들어 보세요.",

		--Sap
		["bm_melee_sap_info"] = "레더 샙은 신사의 무기입니다.\n\n이걸 적의 머리를 가볍게 두드려 쓰려트려보세요. 듀크는 래더 셉을 우아함과 잔혹함을 약간 담아 휘두르는데, 때로는 그것이 지나쳐서 필요 이상으로 피해를 입힙니다.\n\n그러니 휘두르든 말든 주의해서 사용해야 합니다.",

		--Hockey Stick
		["bm_melee_hockey_info"] = "아름답게 만들어진 나무 막대. 퍽을 골대에 박아넣고 이빨을 존나게 박살내는 데 아주 적합합니다.", 

		--Ruler
		["bm_melee_meter_info"] = "양손 거대 자는 우리가 만든 가장 큰 자입니다. 하지만 크기에 속지 마세요. 이 멋진 자는 다루기 힘들거나 꼴사납지가 않죠.", 

		--Hooked
		["bm_melee_catch_info"] = "갈고리는 신뢰할 수 있는 도구이며 솔직하게 말하자면 로켓 과학이 아니죠. 튼튼한 금속 갈고리가 달린 그 원목 손잡이는 충분히 단순하고 간단해 보이지 않나요? 갈고리는 엄청난 난장판을 일으킬 것입니다.\n\n그 용도는 적을 어떻게 낚을지에 대한 뒤틀린 상상력에 의해서만 제한됩니다. 가령 상대의 입을 찔러 죽이거나 몸을 잡아채는 정도?\n\n정신 바싹 차리고, 끔직한 걸 들고 싸우십시오.", 

		--Syringe
		["bm_melee_watson_info"] = "\"잠깐 아플 뿐이야, 알겠지?\"\n\n#{stats_positive}#120##의 독 피해를 가하고 #{skill_color}#4##초 동안 #{skill_color}#0.5##초마다 #{skill_color}#50%##의 확률로 행동을 방해할 수 있는 알 수 없는 혼합물이 들어 있습니다.", 

		--That oinky sploinky
		["bm_melee_piggy_hammer_info"] = "꿀꿀이.\n\n특수 및 엘리트 적에게 #{skill_color}#100%##만큼 더 많은 피해를 가하고, 성공적으로 적중 시 일정 확률로 아래의 #{risk}#무작위 효과## 중 하나를 가합니다.\n-#{skill_color}#12%## 확률로 #{important_1}#출혈##\n-#{skill_color}#7%## 확률로 #{ghost_color}#감전##\n-#{skill_color}#5%## 확률로 #{stats_positive}#독##\n-#{skill_color}#1%## 확률로 #{risk}#즉사##", --Piggu

		--Knuckle Daggers, Push Daggers
		["bm_melee_specialist_info"] = "나이프가 두 배면 재미도 두 배.\n\n근접 공격은 첫 번째 공격 이후부터 매 공격마다 #{skill_color}#2배##의 피해를 가합니다.", 

		--CUSTOM MELEE WEAPONS
		--WHERE IS TITANFALL YOU FUCKS
		["bm_melee_revenant_heirloom"] = "망자의 낫",
		["bm_melee_revenant_heirloom_info"] = "#{important_1}#\"날 가까이서 보면 이미 늦은 거라고, 고깃덩어리.\"##",
		--best girl
		["bm_melee_megumins_staff_info"] = "완전히 충전되면 강력한 폭발을 일으킵니다!\n모든 표면이나 존재에게 최대 #{skill_color}#30##미터까지 시전할 수 있지만, #{risk}#공중에는 시전할 수 없습니다.##\n\n#{important_1}#충전 속도는 스킬의 영향을 받지 않습니다.\n충전하면 시야가 왜곡되고, 스태미나가 소모되며, 움직임이 점점 느려지고\n성공적으로 폭발을 시전하면 즉시 쓰러집니다. 쓰러지는 것을 지연시키거나 구해주는 스킬과 특전 덱은 무시됩니다.##",
		--fishe
		["bm_melee_holy_mackerel_info"] = "#{item_stage_2}#레벨 42 생선##\n\n물고기에게 맞으면 아주 창피할 겁니다.",

		["bm_menu_weapon_bayonet_header"] = "주무기 통계 기준:",
		["bm_menu_weapon_bayonet_secondary_header"] = "보조무기 통계 기준:",
		["bm_menu_weapon_bayonet_damage"] = "\n추가 대미지: ##+",
		["bm_menu_weapon_bayonet_damage_base"] = "\n-기본: ##",
		["bm_menu_weapon_bayonet_damage_skill"] = "\n-스킬: ##+",
		["bm_menu_weapon_bayonet_range"] = "\n추가 사거리: ##+",

		--We assets now--
		["menu_asset_dinner_safe"] = "금고",
		["menu_asset_bomb_inside_info"] = "내부자의 정보",
		["menu_asset_mad_cyborg_test_subject"] = "시험용 표본",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "투피스 정장",
		["bm_suit_two_piece_desc_sc"] = "강도짓을 할 때 세련된 접근 방식입니다. '땅에 엎드려!'라고 소리를 지를 때 날카롭게 보이는 것이 결코 아프지 않죠.\n\n이 옵션을 선택하면 하이스트의 복장과 상관없이 기본 복장을 착용하게 됩니다.",

		["bm_suit_loud_suit"] = "전투용 하네스",
		["bm_suit_loud_suit_desc"] = "경찰 따위에게 신경쓰지 않을 때 입기 좋은 옷입니다. 가볍고, 움직이기 쉽고, 실용성을 위해 제작되었죠. 부수고 줍기를 하러 가거나 요새화된 용병 시설을 공격할 때 좋은 선택입니다.",

		["bm_suit_jackal_track"] = "특별 상품 복장",
		["bm_suit_jackal_track_desc"] = "자칼 로고와 베니타스 로고 변형이 있는 특수 제작 운동복.\n\n동료들은 표시가 없는 상자 안에서 이걸 발견했지만 자칼은 그것들을 보낸 적이 없으며, 전에 본 적도 없다고 말했습니다.\n이 복장이 어디에서 왔는지는 알려지지 않았죠.\n\n\n\n...패키지 안에는 메모 하나가 들어 있었습니다.\n\n''##헌신적인 사람들을 위한 감사의 표시\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "써니사이드 강도",
		["bm_suit_sunny_desc"] = "때로는 소매를 걷어붙이고 약간의 강도질을 하고 싶을 때가 있습니다.",

		["bm_suit_pool"] = "보디의 수영장 수리복",
		["bm_suit_pool_desc"] = "수영장 수리공을 위한 날카로운 실...",

		["bm_suit_prison"] = "교도소 복장",
		["bm_suit_prison_desc"] = "당신은 구금되었습니다!",

		["bm_suit_var_jumpsuit_flecktarn"] = "플렉탄 위장",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "두 유럽 국가에서 사용했던 클래식 위장으로, 숲이 우거진 환경에 쉽게 섞일 수 잇는 능력으로 전투에서 효과적임이 입증되었습니다. 도시 지역에서는 확실히 효과가 없지만, 시골 지역에서는 사람들의 눈을 속이는 데 큰 효과가 있습니다.",

		["bm_suit_var_jumpsuit_flatgreen"] = "끈적끈적한 녹색",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "이 복장은 수많은 SWAT 인원들이 사망하고 상당수의 부상자가 발생한 피내린내 나는 젠섹 장갑차 하이스트 사건에 관련된 것으로 추정되는 정신나간 범죄자 3명 중 한 명이 소유했다는 소문이 돌았습니다. 대부분의 증거가 쓰레기 트럭에서 인멸되었고 이 범죄자들의 신원은 여전히 수수께끼에 싸여 있지만 이 복장만은 파괴된 쓰레기 트럭 근처에 남았기 때문에 회수 되었습니다.",


		-- Color variations - Combat Harness
			["bm_suit_var_loud_suit_default"] = "프로페셔널 블랙",
			["bm_suit_var_loud_suit_default_desc"] = "이 투피스 정장은 페이데이 갱단의 브랜드 인지도가 어느 정도 높였습니다. 세련되고 유행적이며 군중 속에 섞일 수 있죠. 갱단이 머키워터의 창고를 다시 한 번 공격하기 위해 운전할 때 체인스가 '이런 씨발 뭐야! 저놈들이 왜 있는거야?!'라고 외쳤습니다. 그가 더 일찍 알아챘으면 좋았을 텐데 말이죠.",
			
			["bm_suit_var_loud_suit_white"] = "프러스티 화이트",
			["bm_suit_var_loud_suit_white_desc"] = "지미가 보일링 포인트 작업을 위해 제공한 이 복장은 작업의 혹독한 환경에서는 효과가 없다는 것이 금세 증명되었습니다. 어차피 지미는 투피스를 입는 것을 더 좋아했기 때문에 필요하지 않았죠.",
			
			["bm_suit_var_loud_suit_red"] = "언서튼 레드",
			["bm_suit_var_loud_suit_red_desc"] = "전장에서 빨간색은 보기에 흥미로운 색입니다. 팀원의 목숨을 구하러 온 의무병이든, 아니면 가장 위험한 놈이든. 누가 될지는 당신이 결정하세요.",
			
			["bm_suit_var_loud_suit_green"] = "포이즌 그린",
			["bm_suit_var_loud_suit_green_desc"] = "척탄병이 당신을 괴롭히는 걸 그만 둘 때가 됐죠. 제마 맥셰이가 당신에게 독이 든 무기고를 전부 제공했으니, 이제 그 돼지들에게 진정한 해충 구제자가 누구인지 보여줄 때가 되었습니다.",
			
			["bm_suit_var_loud_suit_blue"] = "폴리스 블루",
			["bm_suit_var_loud_suit_blue_desc"] = "그런데 왜 경찰들은 ICTV를 사용하지 않는 거죠?",
			
			["bm_suit_var_loud_suit_purple"] = "패셔너블 퍼플",
			["bm_suit_var_loud_suit_purple_desc"] = "전략적 넌센스에 세련된 패션 감각을 더하고 싶다면 ICTV 아래에 이 복장을 숨겨 보세요.",
			
			["bm_suit_var_loud_suit_brown"] = "아웃도어 브라운",
			["bm_suit_var_loud_suit_brown_desc"] = "휴스턴은 갱단이 자신이 최고의 모습을 보이는 아늑한 도시 정글에 머물 수 있었으면 좋겠다고 진심으로 바랬지만 아쉽게도 이 나라에서는 돈을 벌 수 있는 방법이 너무 많았죠.",
			
			["bm_suit_var_loud_suit_gorkagreen"] = "포레스트 택티컬",
			["bm_suit_var_loud_suit_gorkagreen_desc"] = "숲 속이나 당신이 옮기는 모든 돈 속에 잘 숨을 수 있을겁니다.",
			
			["bm_suit_var_loud_suit_gorkaearth"] = "머키 택티컬",
			["bm_suit_var_loud_suit_gorkaearth_desc"] = "머키워터는 유니폼을 몇 개나 생산할까요? 아마 이 시점에서 자신만의 패션 라인을 시작해야 될 정도죠.",
			
			["bm_suit_var_loud_suit_gorkagrey"] = "우반 택티컬",
			["bm_suit_var_loud_suit_gorkagrey_desc"] = "지금 은행에 들어갈 때 정장을 입을 이유는 없습니다. 왜냐하면 당신의 얼굴이 온통 뉴스에 뜨고 있어서 말이죠.",
			
			["bm_suit_var_loud_suit_gorkapurple"] = "퍼플 택티컬",
			["bm_suit_var_loud_suit_gorkapurple_desc"] = "보라색 정글에서 강도 사건을 언제 벌일지 알 수 없을겁니다.",
			
			["bm_suit_var_loud_suit_gorkasea"] = "네비 택티컬",
			["bm_suit_var_loud_suit_gorkasea_desc"] = "울프는 베인이 요트 강도를 제안했을 때 2011년에 이 복장을 되찾았습니다. 불행하게도 6년 동안 먼지를 모아야 했었지만요.",
			-- Color variations - Sunny Side
			["bm_suit_var_suit_sunny_default"] = "캐주얼 비즈니스",
			["bm_suit_var_suit_sunny_default_desc"] = "당신이 항상 열망했던 싸꾸려 90년대 액션 영화의 영웅이 되어보십시오.",
				
			["bm_suit_var_suit_sunny_skull"] = "치명적인 비즈니스",
			["bm_suit_var_suit_sunny_skull_desc"] = "이 작은 페인트칠 덕분에 스컬 도저는 무시무시한 이름을 갖게 되었습니다. 그걸 옷차림에 단순한 장식으로 축소하여 그것이 당신에게 아무 의미가 없음을 보여주십시오.",
				
			["bm_suit_var_suit_sunny_red"] = "블러디 비즈니스",
			["bm_suit_var_suit_sunny_red_desc"] = "의자에 묶인 클로커, 알라바마 면도기, 라디오에서 재생 중인 'Troubles Always Inbound'... 이 셔츠는 오랫동안 깨끗하지 않을겁니다.",
				
			["bm_suit_var_suit_sunny_blue"] = "디지털 비즈니스",
			["bm_suit_var_suit_sunny_blue_desc"] = "해커는 날카로운 기술로 상상할 수 없는 일을 할 수 있는 현대판 마법사입니다... 하지만 해킹은 총알을 막지 못합니다. 그에 비해 방탄 조끼는 총알을 막아주죠. 그러니 너무 자만하게 굴지 말고 자신을 보호하는 것을 잊지 마십시오.",
				
			["bm_suit_var_suit_sunny_green"] = "탐욕적인 비즈니스",
			["bm_suit_var_suit_sunny_green_desc"] = "위험에 관계없이 장소에 있는 전리품들을 깔끔히 청소하십시오. 그 시점에서는 돈에 관한 것이 아니라 자신의 진실을 유지하는 것입니다.",

			["bm_suit_var_suit_sunny_yellow"] = "선샤인 비즈니스",
			["bm_suit_var_suit_sunny_yellow_desc"] = "태양 아래에서 낭만적인 드라이브를 즐기기에 안성맞춤입니다.\n물론 수십 대의 경찰차에게 쫓기고 있을 동안에도 말이죠.",	

			["bm_suit_var_suit_sunny_pink"] = "스무스 비즈니스",
			["bm_suit_var_suit_sunny_pink_desc"] = "미스터 핑크는 캐벗의 갱단이 색으로 구분된 복장을 입지 않았다는 점에서 운이 좋았습니다.",			
					
			["bm_suit_var_suit_sunny_hawaii_black"] = "마이애미 여행",
			["bm_suit_var_suit_sunny_hawaii_black_desc"] = "울프는 치과 의사가 '핫라인 마이애미' 작업을 할 갱단을 구성하고 있다는 소식을 듣고 이 스타일리시한 셔츠를 구입했습니다. 그게 마이애미와 아무 관련이 없다는 것을 누가 알 수 있었을까요?",
			
			["bm_suit_var_suit_sunny_hawaii_blue"] = "사이버 여행",
			["bm_suit_var_suit_sunny_hawaii_blue_desc"] = "조이는 멀리 여행을 떠나 비디오 게임을 하며 시간을 보내는 사람입니다. 달라스는 그녀가 당구를 치거나 바다를 바라보거나 건강에 좋지 않은 양의 스카치 위스키를 마시거나 다른 구식 휴가 활동을 즐기게 할 수 없기에 '요즘 애들이구나'라고 생각했습니다.",
			
			["bm_suit_var_suit_sunny_hawaii_cyan"] = "수영 여행",
			["bm_suit_var_suit_sunny_hawaii_cyan_desc"] = "시드니는 열렬한 수영 선수이며 왜 세이프하우스에 수영장이 설치되어 있지 않은지 항상 궁금해했습니다. 뭐, 올드스톤은 그 자체로 충분한 역할을 가지고 있다고 생각하고 있고, 수영은 그린 브릿지 이후로 페이데이 갱단의 가장 소중한 취미는 아닙니다.",
			
			["bm_suit_var_suit_sunny_hawaii_green"] = "도그하우스 여행",
			["bm_suit_var_suit_sunny_hawaii_green_desc"] = "블라드는 멕시코에서 즐거운 시간을 보냈습니다. 새로운 땅은 새로운 기회를 제공했고, 그의 마약 사업 중 하나가 갑자기 타격을 입을 때까지는 상당히 빠르게 확장했습니다. 연방은 잠시 동안 블라드의 주요 라이벌이 될 불룩에게 이를 비밀리 알려 주었습니다. 다행인 것은 페이데이 갱단이 항상 대기하고 있다는 것입니다.",
						
			["bm_suit_var_suit_sunny_hawaii_orange"] = "해외 여행",
			["bm_suit_var_suit_sunny_hawaii_orange_desc"] = "모든 걸 끝냈고 당신은 해내셨습니다. 백악관 작업이 완료되고 모든 나쁜 놈들은 패배했으며 해외 계좌로 사상 최고의 파티를 열었습니다. 이제 여기에서 어디로 갈까요? \n어, 또 다른 은행 하이스트도 나쁘지는 않을 겁니다.",
			
			["bm_suit_var_suit_sunny_hawaii_pink"] = "댄싱 여행",
			["bm_suit_var_suit_sunny_hawaii_pink_desc"] = "체인스는 자주 휴가를 가지 않지만 그럴 때면 온 힘을 다합니다. 2016년쯤 휴가를 떠난 그의 날렵한 안무 영상이 화제를 모았습니다. 그는 그 영상을 인터넷에서 영원히 지우기 위해 베인에게 연락해야 했습니다.",
			
			["bm_suit_var_suit_sunny_security_red"] = "붉은 경호원",
			["bm_suit_var_suit_sunny_security_red_desc"] = "소사의 경비원의 엘리트 멤버. 에르네스토 소사는 자신이 큰 저택, 신뢰할 수 있는 사업체, 그의 안전을 보장하는 강력한 보안 같은 모든 것을 가졌다고 생각했습니다. 세계는 그의 것이죠... 하지만 역사는 반복될 수 밖에 없습니다.",

			["bm_suit_var_suit_sunny_hawaii_red"] = "먼 여행",
			["bm_suit_var_suit_sunny_hawaii_red_desc"] = "지미는 유전적으로 강화 된 슈퍼 군인 군대에 의해 중단된 멋진 열대 휴가 이야기를 들려주는 걸 좋아합니다. 그의 코카인 유발 동화 중 하나처럼 들리지만 아칸 하이스트 사건 이후에는... 누가 알까요?",

			["bm_suit_var_suit_sunny_payne"] = "무통 휴가",
			["bm_suit_var_suit_sunny_payne_desc"] = "상파울루로 휴가를 보내는 동안 울프는 이 셔츠를 사기로 결정했지만 판매자는 그에게 도시를 위해 한 일에 대한 감사의 마음으로 셔츠를 무료로 주었습니다.\n정작 울프는 브라질에 가본 적이 없기 때문에 혼란스러워했지만요.",
			
			["bm_suit_var_suit_sunny_vice"] = "악덕스러운 휴가",
			["bm_suit_var_suit_sunny_vice_desc"] = "당신은 상황에 관계없이 상그레스에게 화려한 셔츠 외에는 아무것도 입지 않도록 할 수 없습니다. 가장 위험한 범죄자들이 모두 단정한 옷차림을 하고 모여든다면 상그레스는 바이스 시의 차고 세일에서 얻은 낡고 허술한 셔츠를 입고 등장합니다.",
			
			["bm_suit_var_suit_sunny_security_purple"] = "보라색 경호원",
			["bm_suit_var_suit_sunny_security_purple_desc"] = "소사의 경비원의 엘리트 멤버. 매일 감시하는 드론 및 잘 조정된 경비 교대를 가진 소사의 저택은 뚫을 수 없습니다. 누군가 Yayo(코카인)의 최근 배치를 확인하기 위해 귀찮게만 한다면 말이죠...",

			["bm_suit_var_suit_sunny_soprano"] = "마피아 비즈니스",
			["bm_suit_var_suit_sunny_soprano_desc"] = "마피아는 페이데이 갱단과 친하지는 않지만 그들에게 경의를 표할 가치는 있습니다. 그들의 스타일은 일상에서도 뛰어나죠.",		
		    -- Color variations - Prison Suit
			["bm_suit_var_suit_prison_default"] = "퓨지티브",
			["bm_suit_var_suit_prison_default_desc"] = "혹스턴을 영원히 바꿔놓은 로브. 그는 암울한 과거의 유물을 옛 세이프하우스와 함께 불태웠다고 확신했지만, 새로운 복장을 어딘가에서 발견했습니다.",
			
			["bm_suit_var_suit_prison_repairman"] = "31일",
			["bm_suit_var_suit_prison_repairman_desc"] = "누가 스파이 카메라를 설치했는지 궁금한 적이 있습니까?\n\n뭐, 당신은 계속 궁금해 할 수 있지만 적어도 그들이 무엇을 입고 있는지 알게 될 것입니다.",
			
			["bm_suit_var_suit_prison_comedy"] = "펠론",
			["bm_suit_var_suit_prison_comedy_desc"] = "페이채크 (인)프레임의 '체인스' 로브. 그는 페어 상점에 있는 금전 등록기에서 225달러만큼 거의 돈을 벌었지만 경찰에 붙잡혀 구금되었습니다. 고맙게도 체인의 동료가 페어북스 직원 중 한 명을 인질로 잡고 교환했습니다.",
			
			["bm_suit_var_suit_prison_vaultboy"] = "거주자",
			["bm_suit_var_suit_prison_vaultboy_desc"] = "놀랍게도 베인은 '세상의 종말' 음모에 가담한 적이 없지만 멜트다운 하이스트 이후 작은 지하 방공호를 짓기 시작했습니다. 알잖아요? 앞으로 일어날 핵 전쟁을 대비하는거죠.",
			
			["bm_suit_var_suit_prison_janitor"] = "청소부",
			["bm_suit_var_suit_prison_janitor_desc"] = "옴니아가 전설적인 헨리스 락을 능가하는 곳에 일급 비밀 실험을 수행하고 있다는 소문이 범죄 지하 세계를 돌고 있습니다. 옴니아의 청소부도 계약서에 서명하고 그들의 통제를 받아야 합니다.",
			
			["bm_suit_var_suit_prison_subject"] = "설험체",
			["bm_suit_var_suit_prison_subject_desc"] = "지미는 아칸의 연구실에서 탈출하기 전에 실험체들의 이 복장들을 벗었습니다. 그 피로함이 뛰어난 능력의 비결이었을 때를 대비해서 말이죠. 한 번 알아 봅시다.",
			
		--Weapon Colors
		["bm_wskn_resmod_blackgold"] = "블랙 골드",
		["bm_wskn_resmod_cleangold"] = "클린 골드",
		["bm_wskn_resmod_imissfauna"] = "세레스 골드",
		["bm_wskn_resmod_imissfauna_desc"] = "대자연은 널 절대로 배신하지 않을거야... 맞지?",
		["bm_wskn_resmod_uuuuu"] = "고딕 세레스 골드",
		["bm_wskn_resmod_uuuuu_desc"] = "자연은 어둡기도 하고 아름답기도 하지?",		
		["bm_wskn_resmod_ownthiscity"] = "플뢰르 골드",
		["bm_wskn_resmod_ownthiscity_desc"] = "우리의 시간이 왔어! 한 판 해보자고!",
		["bm_wskn_resmod_kindoffeel"] = "앱스트랙트 다크 골드",
		["bm_wskn_resmod_kindoffeel2"] = "앱스트랙트 라이트 골드",
		["bm_wskn_resmod_insubstantial"] = "페이스드 골드",
		["bm_wskn_resmod_palmtop"] = "타이거 골드",
		["bm_wskn_resmod_palmtop_desc"] = "가장 바라는 것은 결코 얻지 못할 것이다.",
		["bm_wskn_resmod_blacktiger"] = "블랙 타이거 골드",
		["bm_wskn_resmod_joe"] = "엑조틱 골드",
		["bm_wskn_resmod_blackexotic"] = "블랙 엑조틱 골드",		
		["bm_wskn_resmod_lildonnie"] = "펄 골드",
		["bm_wskn_resmod_quacko"] = "블루 골드",
		["bm_wskn_resmod_snake"] = "리쿼드 골드",
		["bm_wskn_resmod_camo"] = "카모 골드",
		["bm_wskn_resmod_camo2"] = "헤이즈 골드",
		["bm_wskn_resmod_digital"] = "디지털 골드",
		["bm_wskn_resmod_splinter"] = "나르바 골드",
		["bm_wskn_resmod_urban"] = "우반 골드",
		["bm_wskn_resmod_rat"] = "스플린터 골드",
		["bm_wskn_resmod_ratdark"] = "스플린터 다크 골드",
		["bm_wskn_resmod_rocker"] = "스태딕 골드",
		["bm_wskn_resmod_shocker"] = "스태딕 다크 골드",
		["bm_wskn_resmod_whitefire"] = "플레임 골드",
		["bm_wskn_resmod_blackfire"] = "플레임 다크 골드",		
		["bm_wskn_resmod_dioxide"] = "카본 골드",
		["bm_wskn_resmod_topography"] = "토포그래피 골드",
		["bm_wskn_resmod_2019"] = "워페어 골드",
		["bm_wskn_resmod_llenn"] = "핑크 데블",
		["bm_wskn_resmod_llenn_desc"] = "이건 내가 생각한 것이 정확히는 아니지만 분홍색은 분홍색이야.",
		["bm_wskn_resmod_sugarhoneyicetea"] = "지브라 골드",
		["bm_wskn_resmod_blackzebra"] = "블랙 지브라 골드",
		["bm_wskn_resmod_charlotte"] = "웹 골드",
		["bm_wskn_resmod_joker"] = "라프 온 골드",
		["bm_wskn_resmod_jokerw"] = "라프 온 화이트",		
		
		["menu_weapon_color_index_11"] = "메탈 + 조준기",
		["menu_weapon_color_index_12"] = "메탈 + 탄창",
		["menu_weapon_color_index_13"] = "메탈 + 조준기 + 탄창",

		--Menu Buttons--
		["bm_menu_btn_sell"] = "무기 판매 ($price)",
		["bm_menu_btn_buy_selected_weapon"] = "무기 구매 ($price)",

		--New menu stats--
		["bm_menu_damage_shake"] = "흔들림",
		["bm_menu_deflection"] = "골절도",
		["bm_menu_regen_time"] = "재생 지연",
		["bm_menu_swap_speed"] = "교체 시간",
		["bm_menu_pickup"] = "탄약 획득량",
		["bm_menu_ads_speed"] = "조준 시간",
		["bm_menu_reload"] = "재장전 시간",
		["bm_menu_damage"] = "대미지", -- I gotta find out WHO KILLED MY DA- how to spoof the damage readout for melee ["bm_menu_damage"] = "최대 대미지",
		["bm_menu_standing_range"] = "대미지 감소 거리 시작",
		["bm_menu_damage_min"] = "최소 대미지",
		["bm_menu_moving_range"] = "대미지 감소 거리 최대",

		["bm_menu_attack_speed"] = "반복 지연",
		["bm_menu_impact_delay"] = "타격 지연",
		["bm_menu_cleave"] = "클리브",
		
		["bm_menu_stats_detection"] = "착용감",
		["bm_menu_stats_min_detection"] = "착용감",
		["bm_menu_stats_max_detection"] = "착용감",
		
		--Attachment type names--
		["bm_menu_barrel_ext"] = "총구",
		["bm_menu_barrel_ext_plural"] = "총구",
		["bm_menu_foregrip"] = "총열덮개",
		["bm_menu_foregrip_plural"] = "총열덮개",
		["bm_menu_vertical_grip"] = "수직 손잡이",
		["bm_menu_vertical_grip_plural"] = "수직 손잡이",
		["bm_menu_bayonet"] = "총검",
		["bm_menu_bayonet_plural"] = "총검",
		--Spoof types--
		["bm_menu_frame"] = "프레임",
		["bm_menu_whole_receiver"] = "리시버",
		["bm_menu_shell_rack"] = "셀 랙",
		["bm_menu_nozzle"] = "노즐",
		["bm_menu_fuel"] = "연료통",
		["bm_menu_cylinder"] = "실린더",
		["bm_menu_model"] = "모델",
		["bm_menu_forebarrelgrip"] = "총열 및 총열덮개",
		["bm_menu_riser"] = "라이저",
		["bm_menu_pump"] = "펌프",

		["bm_menu_upotte_barrel"] = "총열",
		["bm_menu_upotte_foregrip"] = "총열덮개",
		["bm_menu_upotte_stock"] = "개머리판",
		["bm_menu_jiisuri_stock"] = "개머리판",
		["bm_menu_upotte_grip"] = "손잡이",

		["bm_menu_ro_barrel"] = "총열",
		["bm_menu_ro_stock"] = "개머리판",
		["bm_menu_ro_modifier"] = "수정치",
		["bm_menu_ro_charm"] = "장식품",
		["bm_menu_ro_grip"] = "손잡이",
		
		--Weapon categories--
		["menu_pistol"] = "권총",
			["menu_light_pis"] = "경권총",
			["menu_heavy_pis"] = "중권총",
		
		["menu_shotgun"] = "산탄총",
			["menu_light_shot"] = "자동 산탄총",
			["menu_heavy_shot"] = "경산탄총",
			["menu_break_shot"] = "중산탄총",
		
		["menu_smg"] = "기관단총",
		["menu_lmg"] = "기관총",
		["menu_minigun"] = "개틀링 건",
			["menu_light_smg"] = "경기관단총",
			["menu_heavy_smg"] = "중기관단총",
			["menu_light_mg"] = "경기관총",
			["menu_heavy_mg"] = "중형기관총",
			["menu_miniguns"] = "개틀링 건",

		["menu_assault_rifle"] = "소총",
		["menu_snp"] = "저격소총",
			["menu_light_ar"] = "경소총",
			["menu_heavy_ar"] = "중소총",
			["menu_dmr_ar"] = "지정사수 소총",
			["menu_light_snp"] = "경저격소총",
			["menu_heavy_snp"] = "중저격소총",
			["menu_antim_snp"] = "대물 저격소총",

		["menu_wpn_special"] = "특수",


		["menu_flamethrower"] = "화염방사기",
		["menu_grenade_launcher"] = "발사기",

		["menu_saw"] = "톱",

		["menu_bow"] = "활",

		["menu_crossbow"] = "활",

		["menu_unsupported"] = "지원하지 않음",

		["st_menu_value"] = "가격:",

		["st_menu_skill_use"] = "사용하는 스킬:",
		["st_wpn_akimbo"] = "아킴보+",
		["st_wpn_assault_rifle"] = "소총",
		["st_wpn_snp"] = "소총",
		["st_wpn_pistol"] = "권총",
		["st_wpn_shotgun"] = "산탄총",
		["st_wpn_smg"] = "기관총",
		["st_wpn_lmg"] = "기관총",
		["st_wpn_minigun"] = "기관총",
		["st_wpn_crossbow"] = "활",
		["st_wpn_bow"] = "활",
		["st_wpn_saw"] = "톱",
		["st_wpn_grenade_launcher"] = "발사기",
		["st_wpn_wpn_special"] = "특수",
		["st_wpn_flamethrower"] = "화염방사기",

		["st_menu_firemode"] = "발사 모드:",
		["st_menu_firemode_semi"] = "단발",
		["st_menu_firemode_auto"] = "자동",
		["st_menu_firemode_burst"] = "점사",
			["st_menu_firemode_burst_slamfire"] = "슬램 파이어",
			["st_menu_firemode_burst_fanning"] = "팬링",
			["st_menu_firemode_burst_rapidfire"] = "속사",
			["st_menu_firemode_burst_autoburst"] = "자동 점사",
		["st_menu_firemode_volley"] = "일제 사격",

		["menu_reticle_dmc_eotech"] = "TECopt 풀",
		["menu_reticle_dmc_eotech_moa"] = "TECopt MOA 도트",
		["menu_reticle_dmc_eotech_seggs"] = "TECopt 세그먼트",
		["menu_reticle_dmc_ebr_cqb"] = "메엘스톰 EBR-CQB",
		["menu_reticle_dmc_trijicon_chevron"] = "삼각 셰브론",
		["menu_reticle_dmc_ncstar"] = "정찰용 십자선",
		["menu_reticle_dmc_lua"] = "Lua로 구동!",
		["menu_reticle_dmc_dot_4x4"] = "작은 도트",
		["menu_reticle_dmc_dot_2x2"] = "더 작은 점",
		["menu_reticle_dmc_cross_holotherm"] = "SZ 홀로썸",
		
		

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_append_milliseconds"] = "ms",
		["bm_menu_dodge_grace"] = "희피 시 추가 유예 시간: #{skill_color}#$grace_bonus##",
		["bm_menu_dodge_grace_cap"] = "회피 유예 기간이 현재 작업의 #{important_1}#프로 잡## 등급 및 ",
		["bm_menu_dodge_grace_jp_cap"] = "#{risk}#$risk_level## 리스크 레벨로",
		["bm_menu_dodge_grace_both"] = " 인해 ",
		["bm_menu_dodge_grace_diff_cap"] = "#{important_1}#$grace_bonus_cap##로 제한되었습니다.",

		["bm_menu_armor_grinding_1"] = "간격당 방탄복 재생량: #{skill_color}#$passive_armor_regen##",
		["bm_menu_armor_grinding_2"] = "간격당 방탄복 재생량: #{skill_color}#$passive_armor_regen## \n적에게 피해를 가할 시 방탄복 재생량: #{skill_color}#$active_armor_regen##",

		["bm_menu_armor_max_health_store_1"] = "최대 체력 저장량: #{skill_color}#$health_stored##",
		["bm_menu_armor_max_health_store_2"] = "최대 체력 저장량: #{skill_color}#$health_stored## \n처치 시 방탄복 재생 보너스: #{skill_color}#$regen_bonus%##",
	})

	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "수정치",
		["steam_inventory_stat_boost"] = "통계 수정치",

		--Safe House--
		["dialog_safehouse_text"] = "아직 세이프하우스를 방문하지 않으셨습니다.\n\n새로운 것을 발견할 수도 있으니 방문하세요.\n\n지금 세이프하우스로 가겠습니까?",

		["bm_menu_custom_plural"] = "커스텀 카테고리의 무기 부착물", --unused?--

		----Custom Weapon Mod Descriptions----

		--Is there a reason these have to be down here? If not, I'll move them up with the others (custom weapons in their own section dw)--

		--Triad Chi-Revolver [Custom]--
		["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "왜 카이 리볼버에 오래된 포스트 콜루젼 탄약을 사용해? 개들은 왜 지들 불알을 핥는 걸거야?\n최소 및 최대 탄약 획득량: 1.33배",
		["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "이 탄약을 사용하여 벽, 방탄복, 방패를 관통해 적을 조져버리세요.\n대미지가 감소하는 대신 방탄복, 방패, 벽 관통이 가능해집니다.",
		["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "출처를 알 수 없는 곳에서 훔친 치-소란스러운 빈 탄환. 알아야 할 것은 이 총은 존나 반동이 크고 총이 격발된 이후 총열 반대편에 있는 모든 것이 사실상 증발한다는 사실뿐입니다. 굉장히 쩔죠?\n이 탄약은 탄약 상자에서 찾기가 훨씬 어렵습니다.\n그 외의 모든 수치는 대미지와 탄약 획득량을 낮추는 방향으로 조정되었습니다.\n최소 및 최대 탄약 획득량: 0.33배",

		--DECK-ARD [Custom]--
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "그들을 완전히 쏴 죽여 지옥에서 죽게 만들어라.\n다른 모든 걸 희생한 대신 아주 강력한 피해를 가합니다.\n방탄복, 벽, 방패를 관통할 수 있습니다.\n이 탄약은 탄약 상자에서 찾기가 훨씬 어렵습니다.\n최소 및 최대 탄약 획득량: 0.33배",
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "그들을 쏴 죽여라.\n이 탄약은 탄약 상자에서 찾기가 훨씬 쉽습니다.\n최소 및 최대 탄약 획득량: 1.33배",

		--Unknown Weapon--
		["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "7.62mm 변환 키트",
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "무기의 탄을 7.62mm로 변환하여 발사 속도와 안정성을 약간 낮추고 대미지와 명중률을 높입니다.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "중간 티어 소총을 모방한 탄 종류입니다. 탄약 수와 안정성을 낮추는 대신 대미지와 명중률을 높입니다.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "매그웰 손잡이",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "확장 탄창",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "확악장 탄창",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "자칼을 마스티프로 바꿔줍니다. 자칼 가족의 여동생 같은 종입니다. 코요테만큼 안정적이지 않고 자칼만큼 치명적이지는 않지만, 적어도 방탄복과 벽을 모두 뚫을 수 있는 탄환을 발사하죠.",

		--Unknown weapon--
		["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "물리학 덕분에 적에게 더 크고 고통스러운 상처 구멍을 만드는 오픈 팁 탄입니다. 할로우 포인트탄은 적에게서 찾기 어렵고 반동이 더 크지만, 다행히도 머리에 더 효과적이고 일반탄보다 다소 더 정확합니다.",
		--Unknown Weapon--
		["bm_menu_weirdmagthing"] = "매그웰 손잡이",

		--Gecko 7.62--
		["bm_wp_wpn_fps_ass_galil_m_drum"] = "75발 드럼 탄창",

		--Cavity 9mm--
		["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "중형 권총 티어로 변환합니다.\n최소 및 최대 탄약 획득량: 0.8배",

		--DP-28 [Custom]--
		["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "측면에 추가 탄약이 장착한 양각대가 있습니다.\n장착 시 이동속도가 20%만큼 감소합니다.",

		--Arbiter--
		["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "Arbiter에 공중폭발 기능을 제공하는 실험용 조준경입니다.\n소이탄과는 같이 장착할 수 없습니다.", --this weapon mod isn't vanilla though iirc--

		--Itachi [Custom]--
		["bm_wp_wpn_fps_upg_bajur_m_pants"] = "하지마",
		["bm_wp_wpn_fps_upg_bajur_fg_dmr_desc"] = "Itachi의 상부 리시버를 .50 베오울프탄 버전으로 교체하여 무기의 반동을 훨씬 더 강하게 만들지만, 법 집행관한테 생기는 총알 구멍의 크기가 10배로 커졌습니다.\n정확도와 위력을 제외한 모든 능력치가 감소합니다.",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "유효한 표면 위에서 #{skill_color}#$BTN_BIPOD## 키를 눌러 거치하고 다시 누르면 해제합니다.\n\n거치 중 수직 반동을 #{skill_color}#50%##만큼 감소시키고, 수평 반동을 #{skill_color}#75%##만큼 감소시키며, 사거리를 #{skill_color}#30%##만큼 증가합니다.\n\n#{item_stage_2}#추가 거치 옵션은 레스토레이션 모드의 추가 옵션 메뉴에서 찾을 수 있습니다.##",
		["bm_sc_bipod_desc"] = "유효한 표면 위에서 #{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 거치하고 다시 누르면 해제합니다.\n\n거치 중 수직 반동을 #{skill_color}#50%##만큼 감소시키고, 수평 반동을 #{skill_color}#75%##만큼 감소시키며, 사거리를 #{skill_color}#30%##만큼 증가합니다.\n\n#{item_stage_2}#추가 거치 옵션은 레스토레이션 모드의 추가 옵션 메뉴에서 찾을 수 있습니다.##",
		["hud_hint_bipod_moving"] = "이동 중에는 거치할 수 없습니다.",
		["hud_hint_bipod_slide"] = "슬라이딩 중에는 거치할 수 없습니다.",
		["hud_hint_bipod_air"] = "공중에 떠 있을 동안에는 거치할 수 없습니다.",
		["hud_hint_bipod_lean"] = "기울이는 동안에는 거치할 수 없습니다.",
		["hud_hint_bipod_midstance"] = "자세를 바꾸는 동안에는 거치할 수 없습니다.",

		["hud_interact_autumn_disable"] = "캡틴 어텀에 의해 비활성화 되었습니다!",

		["hud_assault_restored_down"] = "어썰트에서 살아남아 다운 1회가 회복되었습니다.",
		["hud_assault_remaining_single"] = "다운 회복까지 어썰트 1회 남았습니다.",
		["hud_assault_remaining_plural"] = " 다운 회복까지 남은 어썰트",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_r0991"] = "AR-15 바민트 권총",
		
		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "낮은 기동성 보너스 및 안정성 패널티",
		["bm_menu_bonus_concealment_p1_mod"] = "낮은 기동성 수정치",
		["bm_menu_bonus_concealment_p2"] = "높은 기동성 보너스 및 안정성 패널티",
		["bm_menu_bonus_concealment_p2_mod"] = "높은 기동성 수정치",
		["bm_menu_bonus_concealment_p3"] = "매우 높은 기동성 보너스 및 안정성 패널티",
		["bm_menu_bonus_concealment_p3_mod"] = "매우 높은 기동성 수정치",
		["bm_menu_bonus_spread_p1"] = "낮은 명중률 보너스 및 안정성 패널티",
		["bm_menu_bonus_spread_p1_mod"] = "낮은 명중률 수정치",
		["bm_menu_bonus_spread_n1"] = "매우 높은 안정성 보너스 및 명중률 패널티",
		["bm_menu_bonus_recoil_p3_mod"] = "매우 높은 안정성 수정치",
		["bm_menu_bonus_recoil_p1"] = "낮은 안정성 보너스 및 명중률 패널티",
		["bm_menu_bonus_recoil_p1_mod"] = "작은 안정성 수정치",
		["bm_menu_bonus_recoil_p2"] = "높은 안정성 보너스 및 명중률 패널티",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "자신과 팀원에게 +3%만큼의 추가 경험치를 제공합니다.",
		["bm_menu_spread"] = "명중률\n",
		["bm_menu_recoil"] = "안정성\n",
		["bm_menu_concealment"] = "기동성\n",
		["bm_menu_bonus_spread_p2_mod"] = "높은 명중률 수정치",
		["bm_menu_bonus_spread_p3_mod"] = "매우 높은 명중률 수정치",
		["bm_menu_bonus_recoil_p2_mod"] = "높은 안정성 수정치",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "돈 부스트",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "자신과 팀원에게 +5%만큼의 추가 현금 보상을 제공합니다.",

		["bm_wp_upg_i_singlefire_desc"] = "무기를 #{risk}#단발 사격으로 고정합니다.##",
		["bm_wp_upg_i_autofire_desc"] = "무기를 #{risk}#자동 사격으로 고정합니다.##",

		--Throwables--
		["bm_dynamite_desc"] = "대미지: #{risk}#800## \n범위: #{skill_color}#4m## \n기폭: #{skill_color}#3초## \n- 다른 투척물에 비해 튀고 굴러가는 일이 적습니다.\n\n바위를 효과적으로 폭파시키도록 설계되었습니다. 사람을 폭파시키는 것도 더욱 효과적이죠.",
		--Frag
		["bm_grenade_frag_desc"] = "대미지: #{risk}#800## \n범위: #{skill_color}#5m## \n기폭: #{skill_color}#3초## \n\n고전적인 폭발성 수류탄입니다. 뭐, 더 설명할 게 있나요?",
		--Community Frag
		["bm_grenade_frag_com_desc"] = "대미지: #{risk}#800## \n범위: #{skill_color}#5m## \n기폭: #{skill_color}#3초## \n\n고전적인 수류탄에 세련된 새로운 모습을 더해, 매 폭발마다 더욱 오버킬의 느낌을 더할 것입니다.",
		--Community Frag 2
		["bm_grenade_dada_com_desc"] = "대미지: #{risk}#800## \n범위: #{skill_color}#5m## \n기폭: #{skill_color}#3초## \n\n인형의 바깥층은 폭발적인 내부 작용을 숨깁니다. 조국에 대한 헌사죠.",
		--Snowball
		["bm_grenade_xmas_snowball_desc"] = "대미지: #{skill_color}#180## \n범위: #{skill_color}#1m## \n재생 속도: #{skill_color}#25초마다 눈덩이 1개## \n\n간단하게 물에 담그고, 냉동고에 넣으면 치명적인 투척 무기가 됩니다.",
		--Zapper
		["bm_grenade_electric_desc"] = "대미지: #{skill_color}#400## \n범위: #{skill_color}#5m## \n기폭: #{skill_color}#3초## \n- #{skill_color}#대부분의 적을 감전시킵니다.## \n\n파편은 모두 훌륭하고 유용하지만 튀길 수 있는 무언가가 필요하죠. 이 작은 이쁜이는 고전압으로 약간의 피해를 가하는 데 다소 실용적인 수류탄입니다.",
		--Sticky
		["bm_grenade_sticky_grenade"] = "샘텍스 수류탄",
		["bm_grenade_sticky_grenade_desc"] = "대미지: #{risk}#800## \n범위: #{skill_color}#4m## \n기폭: #{skill_color}#2.5초## \n\n사람을 포함한 대부분의 표면에 부착되는 투척용 폭발성 혼합물입니다!",
		--Molotov
		["bm_grenade_molotov_desc"] = "대미지 (화염 지대): #{heat_warm_color}#10초 동안 1200##\n대미지 (화염): #{heat_warm_color}#3초 동안 60## \n대미지 (폭발): #{heat_warm_color}#30## \n범위 (화염 지대): #{skill_color}#3.75m## \n범위 (폭발): #{skill_color}#3m## \n기폭: #{skill_color}#충격 시 폭발## \n- #{skill_color}#50%## 확률로 적을 #{heat_warm_color}#불태워## 대부분의 적을 공포감에 빠트립니다. \n \n불붙은 천이 들어있는 인화성 액체가 담긴 부서지는 병입니다. 간단하고, 저렴하지만, 매우 효과적이죠. 이걸로 전부 태워 버리세요.",
		--Incendiary
		["bm_grenade_fir_com_desc"] = "대미지 (화염 지대): #{heat_warm_color}#12초 동안 1440##\n대미지 (화염): #{heat_warm_color}#6초 동안 120## \n대미지 (폭발): #{heat_warm_color}#30## \n범위 (화염 지대): #{skill_color}#3.75m## \n범위 (폭발): #{skill_color}#4.5m## \n기폭: #{skill_color}#2.5초## \n- #{skill_color}#50%## 확률로 적을 #{heat_warm_color}#불태워## 대부분의 적을 공포감에 빠트립니다.\n\n자연적으로 발화되는 인을 담은 수류탄입니다. 벽으로 튕겨낼 수 있어 적에게 던지기 적합합니다.",
		--Concussion
		["bm_concussion_desc"] = "범위: #{skill_color}#10m## \n- 최대 #{skill_color}#4초## 동안 적을 기절시킵니다.\n- 적의 명중률이 #{skill_color}#50%##만큼 #{skill_color}#7초## 동안 감소합니다. \n- #{important_1}#타이탄 실드, 타이탄 불도저 및 캡틴은 기절 효과에 면역입니다.## \n\n이 조그맣고 짜릿한 녀석은 적들을 깜짝 놀래켜서, 그들을 처리할 기회를 더 줍니다.",
		--Gas
		["bm_grenade_poison_gas_grenade"] = "만티코어-6 수류탄",
		["bm_grenade_poison_gas_grenade_desc"] = "대미지: #{stats_positive}#10초 동안 300## \n범위: #{skill_color}#6m## \n지속 시간 (가스 구름): #{skill_color}#12초## \n기폭: #{skill_color}#수류탄이 멈춘 후 1초## \n- #{skill_color}#100%## 확률로 가스 범위 내의 대부분의 적을 기절시킵니다.\n- #{important_1}#실드, 불도저, 척탄병 및 캡틴은 기절에 면역입니다.##\n- #{important_1}#적은 같은 가스 구름에서 두 번 이상 중독될 수 없습니다.## \n\n이 실험적 생물학 무기는 특정 유전자형을 표적으로 삼는 독성 가스 구름을 방출하며, 당신이나 당신의 팀원에게 피해가 가지 않도록 설계되었습니다. 희생자는 격렬한 기침, 메스꺼움, 구토를 경험하며 가장 강한 적을 제외한 모든 적에게 치명적입니다.\n\n그야말로 전범이 쓸법한 무기인거야, 페코.",
		["bm_grenade_poison_gas_grenade_desc_short"] = "대미지: #{stats_positive}#10초 동안 300## \n범위: #{skill_color}#6m## \n지속 시간 (가스 구름): #{skill_color}#12초## \n기폭: #{skill_color}#수류탄이 멈춘 후 1초## \n- #{skill_color}#100%## 확률로 가스 범위 내의 대부분의 적을 기절시킵니다.\n- #{important_1}#실드, 불도저, 척탄병 및 캡틴은 기절에 면역입니다.##\n- #{important_1}#적은 같은 가스 구름에서 두 번 이상 중독될 수 없습니다.##",

		--Throwing Cards
		["bm_wpn_prj_ace_desc"] = "대미지: #{skill_color}#240## \n- #{skill_color}#회수가 가능합니다.## \n\n무게를 싣고, 모서리를 매우 날카롭게 만들어진 카드를 던집니다. 진정한 암살자가 쓰이는 카드죠.",
		--Throwing Stars
		["bm_wpn_prj_four_desc"] = "대미지 (적중): #{skill_color}#200## \n대미지 (독): #{stats_positive}#4초 동안 120## \n- #{skill_color}#회수가 가능합니다.##\n- #{skill_color}#50%## 확률로 대부분의 적을 #{skill_color}#0.5초##마다 기절시킵니다.\n- #{important_1}#실드, 불도저, 척탄병 및 캡틴은 기절에 면역입니다.## \n\n표창은 피와 전투로 물든 역사를 지니고 있습니다. 최근에 만들어지는 강철로 만들어지고 독이 발라진 표창은 당신의 길을 막는 있는 목표에게 치명적인 위협이 됩니다.",
		--Javelin
		["bm_wpn_prj_jav_desc"] = "대미지: #{skill_color}#360## \n- #{skill_color}#회수가 가능합니다.## \n\n비록 이 무기의 기원은 흐릿한 원시시대 중 어딘가로 추정되지만, 재블린은 아주 단순한 무기입니다. 무엇보다도, 이것은 누군가의 하루를 망칠 수 있는 뾰족한 모서리를 지닌 투척 막대기일 뿐이니까요.",
		--Throwing Axe
		["bm_wpn_prj_hur_desc"] = "대미지: #{skill_color}#360## \n- #{skill_color}#회수가 가능합니다.## \n\n날카로운 도끼는 절대 틀리지 않는다고 합니다. 다만 투척용 날카로운 도끼는 그보다 더 옳을 수 없습니다.",
		--Throwing Knife
		["bm_wpn_prj_target_desc"] = "대미지: #{skill_color}#240## \n- #{skill_color}#회수가 가능합니다.## \n\n정밀하고 조용한 살인을 위한 예비책이자 믿음직한 물건입니다.",

		--Perk Deck Throwables
		["bm_grenade_copr_ability"] = "약병",
		["bm_grenade_damage_control"] = "힙 플라스크",
		["bm_grenade_smoke_screen_grenade_desc"] = "범위: #{skill_color}#6m## \n지속시간: #{skill_color}#12초## \n기폭: #{skill_color}#수류탄이 멈춘 후 1초## \n\n이것 하나만 던지면, 연기 속으로 사라져서, 적이 당신을 제대로 조준하지 못하게 할 수 있습니다.",
		
		--WEAPON & ATTACHMENT DESCRIPTIONS
		--[[ MANUFACTURERS ]]
				--In-Universe Manufacturer deets
					--Crosskill/Corvus (Payday/OTWD) = Colt
					--DSC [Defense System Crosskill] (PD2) = Saco Defense
					--B-Team (PD2) = Ruger
						--From that Mini-14 stock for the M14
					--Simmons Armory (PD2) = Springfield Armory 
						--same acronym lol
					--Bernetti = Beretta
					--Chimano/Stryk = Glock 
					--SG = HK (Heckler Und Koch)
					--Signature/FIK (PD2/OTWD + PD3) = Sig Sauer
						--Signature = European Branches, FIK = American Branch?
					--VF (OTWD + PD3) = FNH
					--Lakner (PD2) = Walther
					--Kang Arms (PD2) = Norinco
					--Northwest (PD3) = China South Industries Group
					--Touro = Taurus (lmao)
					--LWI [Lion Weapon Inc.] (PD2) = Kel-Tec 
						--LWI was Taken from the incredibly hard to read text on the right side of the SUB2000
					--ITI (OTWD) = IMI/IWI
					--CR/TKA (PD2/OTWD) = CZ
					--TTO [Tecci Tactical Operations] (PD2) = Taran Tactical
					--Ferino (OTWD) = Franchi
					--Moretti (PD2) = Benelli(?)
					--Stefan (PD2) = Steyr
					--Wasp = Magpul
						--idunno
					--Repeater/Eaton (PD2/OTWD) = Winchester
					--Rangehitter (PD2) = Marlin
						--"Rangehitter" was bummed off it's original "Bernetti Rangehitter" name as "Bernetti"/Beretta doesn't make the SBL

					["manufacturer_colt"] = "Crosskill",
					["manufacturer_saco"] = "DSC",
					["manufacturer_springfield"] = "Simmons",
					["manufacturer_sigusa"] = "FIK",
					["manufacturer_keltec"] = "LWI",
					["manufacturer_winchester"] = "Eaton",
					["manufacturer_marlin"] = "Rangehitter",
					["manufacturer_swesson"] = "J&M",
					["manufacturer_ruger"] = "B-Team",

					["manufacturer_fnh"] = "VF",
					["manufacturer_sig"] = "Signature",
					["manufacturer_hk"] = "S&G",
					["manufacturer_walther"] = "Lakner",
					["manufacturer_steyr"] = "Stefan",
					["manufacturer_glock"] = "Chimano",

					["manufacturer_benelli"] = "Moretti",
					["manufacturer_franchi"] = "Ferino",
					["manufacturer_beretta"] = "Bernetti",

					["manufacturer_kalashnikov"] = "KU",
						["manufacturer_izhmash"] = "IZMHA",
						["manufacturer_baikal"] = "Argos",
					["manufacturer_tula"] = "IZMHA",
					["manufacturer_cz"] = "TKA",

					["manufacturer_imi"] = "ITI",

					["manufacturer_taurus"] = "Touro",

					["manufacturer_chinaindustries"] = "Northwest",
					["manufacturer_norinco"] = "Kang Arms",


			--Contains anything that should always be set regardless of the weapon names option chosen like descriptions or Resmod added weapons and attachments
			--[[ RESMOD WEAPONS + ATTACHMENTS ]]
				--socom deez nuts--
				["bm_w_socom"] = "Anubis .45",
				["bm_w_socom_desc"] = "자칼이 사용하는 권총입니다. 스타일리시한 디자인이고 안정적이고 강력한 .45구경 ACP탄을 쓰죠.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "라 결합 모듈",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 켜기/끄기.",
				["bm_w_x_socom"] = "아킴보 Anubis .45",
				--S&W .500
				["bm_w_shatters_fury"] = "Phoenix .500",
				["bm_wp_shatters_fury_desc"] = "엄청난 반동과 저지력을 가진 .500 탄을 사용하는 거대한 리볼버입니다. 샤터가 사용하는 무기죠.\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "호루스 총열",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "셰더 총열",
				["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "하토르 총열",
				["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "파이어벌드 총열",
				["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "인체공학 손잡이",
				["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "매끄러운 실린더",
				--OICW--
				["bm_w_osipr"] = "SABR",
				["bm_w_osipr_gl"] = "SABR 유탄 발사기",
				["bm_w_osipr_desc_pc"] = "X-세대 무기 기술. #{skill_color}#20mm 유탄 발사기가 장착되어 있습니다.##\n#{skill_color}#$BTN_BIPOD## 키를 눌러 유탄 발사기로 전환합니다.",
				["bm_w_osipr_desc"] = "X-세대 무기 기술. #{skill_color}#20mm 유탄 발사기가 장착되어 있습니다.##\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 유탄 발사기로 전환합니다.",
	
				--Reinfield
				["bm_wp_r870_s_folding_ext"] = "펼친 멀던 개머리판",
				--Bernetti--
				["bm_wp_upg_i_93r"] = "Bernetti 93t 킷",
				["bm_wp_upg_i_93r_desc"] = "#{risk}#발사 선택기를 추가하여## 이 무기에 #{skill_color}#1100 RPM으로 증가한 3점사## 발사 모드로 전환할 수 있지만 #{important_1}#추가 반동이 발생합니다.##",
				--10-0
				["bm_wp_upg_i_tekna"] = "Tekna 점사 킷",
				["bm_wp_upg_i_tekna_desc"] = "이 무기를 #{risk}#3점사##로 발사하도록 고정합니다. #{skill_color}#글레이브##와 함께 사용하면 어떨까요?",
				["bm_wally_desc"] = "#{important_2}#안녕 꼬마야...##",
				--AMR16--
				["bm_wp_upg_i_m16a2"] = "AMR-16 B3 킷",
				["bm_wp_upg_i_m16a2_desc"] = "자동 사격을 #{skill_color}#3점사##로 대체합니다. #{risk}#점사## 속도가 #{skill_color}#950 RPM으로 증가합니다.## ",
				--Bernetti Auto--
				["bm_wp_upg_i_b93o"] = "Bernetti OVERKILL 킷",
				["bm_wp_upg_i_b93o_desc"] = "점사를 #{skill_color}#자동 사격##으로 대체하지만 #{important_1}#추가 반동이 발생합니다.##",
				--2006M Hailstorm
				["bm_w_hailstorm_2006m"] = "Hailstorm-9",
				["bm_w_hailstorm_rsh12"] = "Hailstorm-12",
				["bm_wp_upg_i_iw_hailstorm"] = "Hailstorm 킷",
				["bm_wp_upg_i_iw_hailstorm_desc"] = "후지와라 중공업에서 제작된 프로토타입 무기 키트입니다.\n\n이 무기를 특수 #{skill_color}#삼중 챔버 스택 탄약을 사용하도록## 개조합니다.",
				["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "후지와라 중공업에서 제작된 프로토타입 무기 키트입니다.\n\n이 무기를 특수 #{skill_color}#삼중 챔버 스택 탄약을 사용하도록## 개조하지만 #{important_1}#방탄복을 관통하여 가하는 피해가 50%만큼 감소하고 방패를 관통할 수 없습니다.##",
				--M32 MK32 Kit
				["bm_wp_upg_i_ghosts_mk32"] = "MK32 킷",
				["bm_wp_upg_i_ghosts_mk32_desc"] = "태스크 포스 스토커의 프로토타입 무기 키트입니다.\n\n단발 사격을 #{skill_color}#2점사##로 대체합니다.",
				--AR-15 Mods
				["bm_wp_upg_s_saintvictor_hera"] = "킬러 인센트 개머리판",
				["bm_wp_upg_vintage_fal_sc"] = "리지백 탄창",
				["bm_wp_upg_vintage_sc"] = "빈티지 탄창",
				["bm_wp_upg_mil_sc"] = "밀스펙 탄창",
				["bm_wp_upg_tac_sc"] = "전술 탄창",
				--Generic Mods
				["bm_wp_upg_vg_afg"] = "각진 수직 손잡이",
				["bm_wp_upg_vg_stubby"] = "단축형 수직 손잡이",
				["bm_wp_upg_vg_tac"] = "TAC 수직 손잡이",
				["fucktheatf"] = "이건 중범죄군.",
				["bm_wp_upg_flash_hider"] = "#{skill_color}#총구 화염을 숨기고## #{risk}#적이 당신의 조준을 회피할 가능성을 줄여줍니다.##",
				["bm_wp_upg_suppressor"] = "무기의 소리를 #{skill_color}#조용하게 만들고## #{risk}#적이 당신의 조준을 회피할 가능성을 줄여줍니다.##",
				["bm_wp_upg_suppressor_boss"] = "\"전율적이에요...\"\n\n무기의 소리를 #{skill_color}#조용하게 만들고## #{risk}#적이 당신의 조준을 회피할 가능성을 줄여줍니다.##",
				["bm_wp_upg_suppressor_warn"] = "무기의 소리를 #{skill_color}#조용하게 만들고## #{risk}#적이 당신의 조준을 회피할 가능성을 줄여줍니다.##\n\n#{important_1}#시야를 가릴 수도 있습니다.##",
				["bm_wp_upg_o_shortdot_dmc"] = "쇼트닷 조준경",
				["bm_wp_upg_o_5_default"] = "원거리용 조준경.\n기본 저격총 조준경에 십자선을 수정할 수 있도록 장착합니다.\n#{risk}#5배율.##",
				["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
				["bm_wp_upg_drum_desc"] = "",
				["bm_wp_upg_drum2_desc"] = "",
				["bm_wp_upg_quad_desc"] = "",
				["bm_wp_upg_quad2_desc"] = "",
				["bm_wp_upg_vintage_desc"] = "",

				--CUSTOM WEAPON ATTACHMENTS
					--M6D
					["kfa_scope"] = "KFA-2 스마트 링크 조준기",
					["kfa_scope_desc"] = "마스크와 장착된 #{skill_color}#스마트 링크## 조준기 간의 인터페이스를 활성화합니다.\n#{risk}#2배율.##",
					--M6D
					["halo_scope"] = "스마트 링크 조준기",
					["halo_scope_2_desc"] = "마스크와 장착된 #{skill_color}#스마트 링크## 조준기 간의 인터페이스를 활성화합니다.\n#{risk}#2배율.##",
					--M200 WIDOWMAKER
					["bm_w_m200_iw"] = "Widowmaker",
					["bm_wp_upg_i_iw_widowmaker"] = "Widowmaker 킷",
					["bm_wp_upg_i_iw_widowmaker_desc"] = "켄달 발리스틱에서 제조된 프로토타입 무기 키트.\n\n이 무기를 특수 #{skill_color}#이중 챔버 스택 탄약을 사용하도록## 개조합니다.",
					--NV4
					["bm_wp_upg_o_iwelo"] = "플로팅 조명 조준점이 있는 발광 광학 조준기.\n#{risk}#1.1배율.##",
					["bm_wp_upg_o_iwrds"] = "정밀 레드 닷 조준기.\n#{risk}#1.5배율.##",

					--Raygun
					["bm_wp_raygun_o_waw"] = "OG 기계식 조준기 조정",
					["bm_wp_raygun_o_waw_desc"] = "콜 오브 듀티: 블랙 옵스 II 이전과 같은 방식으로 기계식 조준기의 정렬을 변경합니다.",
			
			--[[ PISTOLS ]]
				--Gecko Pistol
				["bm_tranq_maxim_sc_desc"] = "세계 최초의 #{skill_color}#일체형 소음## 단발 권총으로, 쇠약하게 만드는 마취탄을 사용하고 조작성과 은폐성이 뛰어납니다.\n\n#{stats_positive}#마취탄을 사용해 시간이 지남에 따라 피해를 가합니다.##",
				["bm_tranq_x_maxim_sc_desc"] = "세계 최초의 #{skill_color}#일체형 소음## 단발 권총 한 쌍으로, 쇠약하게 만드는 마취탄을 사용하고 조작성과 은폐성이 뛰어납니다.\n\n#{stats_positive}#마취탄을 사용해 시간이 지남에 따라 피해를 가합니다.##",
				--Igor (APS)
				["bm_stech_sc_desc"] = "더 무겁고 발사 속도가 느린 기관권총으로, 휴대성이 떨어져 선호도가 떨어졌습니다. 무거운 무게 덕분에 은폐성을 희생한 대신 더 나은 반동 제어가 가능합니다.",
				["bm_x_stech_sc_desc"] = "더 무겁고 발사 속도가 느린 기관권총으로, 휴대성이 떨어져 선호도가 떨어졌습니다. 무거운 무게 덕분에 은폐성을 희생한 대신 더 나은 반동 제어가 가능합니다.",
				--Chimano Compact
				["bm_jowi_sc_desc"] = "극도의 은폐성을 확보하기 위해 다른 모든 것을 희생하도록 구성된 Chimano 권총입니다.\n\n소문에 따르면, 윅은 러시아 마피아에게 복수를 할 때 이 권총을 사용했다고 하죠.",
				["bm_x_jowi_sc_desc"] = "이렇게 작다면 두 개정도 들고 다니는 게 어떨까요? 윅이 개인적으로 선택했지만 잘못 선택된 아킴보 한 쌍입니다.",
				--Glock 18c
				["bm_g18c_sc_desc"] = "완전 자동으로 사격하는 오스트리아산 분무기입니다. 반동 제어가 어렵지만 근거리에서는 완전히 파괴적이죠.",
				["bm_x_g18c_sc_desc"] = "만약 하나가 총알 호스라면, 두 개를 들고 다니는 것은 폭풍과 마찬가지일 수도 있죠. 반동만 조심하면 됩니다!",
				--CZ 75
				["bm_czech_sc_desc"] = "원더 나인 중 하나이자, 인체 공학과 조작성이 뛰어난 기관권총입니다. 전 세계의 대테러 부대에서 사용하죠.",
				["bm_x_czech_sc_desc"] = "기관권총을 사용하지 않는 방법의 또 다른 예입니다. 어떻게 권총을 편안하게 재장전할 수 있을까요?",
				--PPK (Gruber)
				["bm_ppk_sc_desc"] = "더 크고 더 위험한 총기 대신 사용할 수 있는 권총입니다. 고전적인 용도를 가진 고전적인 무기이기도 하죠.",
				["bm_x_ppk_sc_desc"] = "007보다 더 킹스맨처럼 되고 싶은 경우를 위한 한 쌍을 쓸 수 있습니다.",
				--M13
				["bm_legacy_sc_desc"] = "Bernetti가 결국 채택되면서 거부된 서독의 디자인이지만, 총격격전에서도 여전히 그 자리를 굳건히 지킬 것입니다.",
				["bm_x_legacy_sc_desc"] = "역사 속에서 잊혀진 두 개의 권총은 당신이 선택한 방에 납의 유산을 남길 것입니다.",
				--Glock 17
				["bm_g17_sc_desc"] = "반동을 제어하기 쉽고 신뢰성이 높습니다. 강도 경력을 시작하기에 완벽한 권총이죠.",
				["bm_x_g17_sc_desc"] = "엄청난 양의 화력으로 보잘것없는 9mm 탄을 보완하면서도 반동이 낮은 장점을 활용합니다.\n\n우리가 혹스턴을 탈옥시킬 때 혹스턴이 사용했죠.",
				--Bernetti 9
				["bm_b92fs_sc_desc"] = "인상적인 탄창 용량과 적절한 대미지 덕분에 인기가 있는 총기입니다. 특히 여러 적대자를 상대할 때 편리하죠.",
				["bm_x_b92fs_sc_desc"] = "권총 두 개가 한 개보다 낫습니다. 모든 싸움을 9mm 파티로 바꾸는 또 다른 방법입니다.",
				--White Streak
				["bm_pl14_sc_desc"] = "서방의 소련 이후 기술을 사용한 현대 러시아 권총입니다. 신뢰성과 미래적인 외관으로 리퍼에게 인기가 있습니다.",
				["bm_x_pl14_sc_desc"] = "서방의 소련 이후 기술을 사용한 현대 러시아 권총입니다. 신뢰성과 미래적인 외관으로 리퍼에게 인기가 있습니다.",
				--Holt 9mm
				["bm_holt_sc_desc"] = "개발의 지옥에 빠진 권총의 작동형 프로토타입은 반동을 줄이는 데 도움이 되는 혁신적인 디자인을 특징으로 합니다.",
				["bm_x_holt_sc_desc"] = "잃어버린 미디어에 해당하는 권총의 작동하는 프로토타입은 하나가 아니라 두 개입니다.",
				--FMG-9
				["bm_fmg9_sc_desc"] = "STRYK 18c의 베이비 캐리어 역할을 하는 이 프로토타입 무기 플랫폼은 미래 지향적인 접이식 기술을 특징으로 합니다!",
				--93R
				["bm_beer_sc_desc"] = "누구의 움직임인지 알아내려고 애쓰는 괴짜들을 만들어낼, 거의 허구에 가까운 점사할 수 있는 무기입니다. 죽든 살든, 넌 나와 함께 간다.\n\n점사 시 발사 속도는 #{skill_color}#1200 RPM##입니다.",
				["bm_beer_auto_desc"] = "누구의 움직임인지 알아내려고 애쓰는 괴짜들을 만들어낼, 거의 허구에 가까운 발사 모드를 바꿀 수 있는 무기입니다. 죽든 살든, 넌 나와 함께 간다.",
				--Contractor Pistols 
				["bm_packrat_sc_desc"] = "윅은 신뢰성과 전반적인 사용 편의성 때문에 이 권총을 택했으며, 그가 레드 서클을 방문했을 때도 사용했다고 합니다.",
				["bm_x_packrat_sc_desc"] = "피와 복수의 메시지를 담아 러시아인이 소유 중인 나이트클럽을 정리하고 싶을 때 추천합니다.",
				--Breech (Luger) 
				["bm_breech_sc_desc"] = "전 세계를 장악할 뻔한 권총입니다. 그것도 두 번이나요. 이 독일 유물은 세련되고 정확하며 안타깝게도 구식이 되었습니다.",
				--Chimano Custom
				["bm_g22c_sc_desc"] = "이 무기는 최고의 전투용 권총 중 하나로 높은 용량과 높은 위력이 결합된 무기입니다.",
				["bm_x_g22c_sc_desc"] = "한 표가 총을 무료로 준다면, 이런 총 두 개를 손에 넣기 위해서 투표 조작을 시도하는 것도 매력적으로 보일 듯합니다.",
				--Signature .40
				["bm_p226_sc_desc"] = "수송 차량을 빼앗든 은행 강도 사건이든, 이 고전적인 경찰 저지용은 절대로 실망시키지 않을 것입니다.",
				--LEO
				["bm_hs2000_sc_desc"] = "인터폴 요원, 부패한 크로아티아 경찰, 그리고 국제 범죄자들 모두에게 이 작은 블래스터가 효과적이라는 것을 알게 될 것입니다.",
				["bm_wp_hs2000_sl_long"] = "엘리트 슬라이드",
				--5/7 pistol
				["bm_lemming_sc_desc"] = "저지력과 탄용량을 합친 권총입니다. 20발 안에 상대를 죽이기 못했다면 아마 쏘지 않는 게 나을지도 모릅니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%만큼 가합니다.##",
				--Baby Deagle--
				["bm_sparrow_sc_desc"] = "다음에 보자고, 스페이스 카우보이...",
				["bm_w_sparrow_sc_g_cowboy_desc"] = "그 무게을 짊어지고 살아라.",
				--socom deez nuts--
				["bm_w_socom_desc"] = "자칼이 사용하는 권총입니다. 스타일리시한 디자인이고 안정적이고 강력한 .45구경 ACP탄을 쓰죠.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "라 결합 모듈",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "#{skill_color}#$BTN_GADGET## 키를 눌러 켜기/끄기.",
				--Crosskill
				["bm_1911_sc_desc"] = "9mm로는 충분하지 않다면, 강력하고 최상급의 잔혹함을 선사해주는 .45ACP로 챔버링된 이 커스텀 1911A1을 선택하세요.",
				["bm_x_1911_sc_desc"] = "악마적인 힘은 없지만, 대학살은 사람들을 공포에 질려 비명을 지르게 만들 것입니다.",
				--Crosskill Chunky
				["bm_m1911_sc_desc"] = "클래식 Crosskill .45의 복제품입니다. 이름과 달리 커스텀보다 전혀 뭉툭하지는 않습니다.",
				--Crosskill Guard
				["bm_shrew_sc_desc"] = "고전적인 A1 사촌보다 작고 컴팩트합니다. 더 높은 은폐성을 위해 탄창 용량과 총열 길이를 희생했죠.",
				["bm_x_shrew_sc_desc"] = "가나안 사람들의 방식대로, 매우 작은 패키지에 두 명의 .45 문제 해결사들이 침입자를 계속 도망치게 할 것입니다.",
				["bm_shrew_g_bling_sc_desc"] = "비참함과 불확실성으로 가득 찬 세상에서도 결국 어둠 속에 빛이 있다는 것을 아는 것은 큰 위안이 됩니다.",
				--USP 
				["bm_usp_sc_desc"] = "S&G 권총은 평균 이상의 성능을 발휘하며, 대미지, 탄용량, 사거리 면에서 뛰어납니다.",
				["bm_x_usp_sc_desc"] = "정말로 메시지를 보내야 할 때를 대비하기 위한 S&G 권총 한 쌍입니다.",
				--Model 54 
				["bm_type54_sc_desc"] = "소련에서 설계한 권총으로, 강력한 타격을 가하는 7.62×25mm 탄을 사용하며, 나쁜 놈들을 제거할 수 있는 또 다른 방법을 제공하는 독특한 총열하부 산탄총이 특징입니다.",
				["bm_x_type54_sc_desc"] = "원투쓰리포 펀치로 변할 수 있는 원투펀치입니다.",
				--Broomstick--
				["bm_c96_sc_desc"] = "\"...그리고 #{important_1}#늑대##는 빨간 모자를 먹어치웠어요.\"\n\n독일의 혁명적인 권총으로, 특히 이 권총은 자동 사격으로 발사할 수 있도록 개조되었습니다.\n\n이 무기는 한 번에 10발의 총알을 재장전합니다.",
				["bm_wp_c96_nozzle"] = "블라스테크 DL-44 총구",
				["bm_wp_c96_nozzle_desc_sc"] = "#{skill_color}#머나먼 은하계##에서 왔다고 전해지는 기술은 이 무기를 #{risk}#플라스마 볼트를 발사하도록## 바꾸며, #{skill_color}#재충전식 탄창##을 사용합니다.\n\n재충전 지연: #{skill_color}#2초##\n재충전 속도: #{skill_color}#3초## #{important_1}#(과열되면 잘반으로 감소)##\n과열 페널티: #{important_1}#2초##",
				--Sub2000
				["bm_sub2000_sc_desc"] = "제조 품질이 의심스러운 접이식 권총 카빈입니다. 작은 권총탄은 긴 총열에서 발사할 때 훨씬 더 세게 맞추며 접이식 기능 덕분에 괜찮은 은폐력을 제공합니다.\n\n그저 오믈렛처럼 접히지 않도록 주의하면 됩니다.",
				--Deagle
				["bm_deagle_sc_desc"] = "이 단발 마술 지팡이에 대해 무슨 말이 더 필요할까요? 그저 나쁜 놈들에게 손 흔들며 \"헤디쿠스 익스플로디쿠스!\"라고 외치면 되죠.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
				["bm_x_deagle_sc_desc"] = "전투에 나가려면 정말 엄청난 용기가 필요한 쌍손목 파괴자입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",	
				--Kahn .357
				["bm_korth_r8"] = "#{skill_color}#캡틴이 아닌 적에게 헤드샷을 입히면 100%만큼 더 가합니다.##",
				--Matever 2006m
				["bm_2006m_sc_desc"] = "이미 드물게 생산되는 희귀한 디자인이자 .38탄을 사정거리 아래로 보내는 멋진 방법입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
				["bm_x_2006m_sc_desc"] = "이 중 두 가지를 처리하는 물류는 순전히 멋진 요인보다 더 중요합니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
				--Frenchman Model 87
				["bm_model3_sc_desc"] = "평생의 질문인 \"내 앞에 튀어나온 이 멍청이들을 어떻게 할까?\"에 대한 고전적인 대답입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
				["bm_x_model3_sc_desc"] = "당신의 내면에 뿌리내린 자질을 끌어내고 이 쌍발 리볼버를 이용해 정오에 경찰에게 듀얼을 도전하세요.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",	
				--Raging bull
				["bm_rage_sc_desc"] = "매우 강력한 단거리 대포입니다. 정확하게 사격하면 멍청이들을 빠르게 쓰러뜨릴 수 있습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 다수의 적을 관통할 수 있습니다.##",
				["bm_x_rage_sc_desc"] = "전혀 좋지도 실용적이지도 않은데, 은행 강도 사건 때 이걸 꺼내서 경찰을 얕보고 싶어질 정도입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 다수의 적을 관통할 수 있습니다.##",
				--Castigo
				["bm_chinchilla_sc_desc"] = "강력하고 정확하며 스타일리시합니다. DC에서 더 튼튼한 적을 돌파하는 데 편리하죠.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 다수의 적을 관통할 수 있습니다.##",
				["bm_x_chinchilla_sc_desc"] = "시카리오는 자신의 흔적을 확실히 남겨야 하는데, 이 두 리볼버가 그것을 보장해 줄 겁니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 다수의 적을 관통할 수 있습니다.##",
				--RUS-12
				["bm_rsh12_sc_desc"] = "한 손 탄싸개 시합의 최후의 단어.\n\n#{skill_color}#방탄복, 다수의 적, 방패 및 얇은 벽을 관통할 수 있습니다.##",
				--SAA/Peacemaker
				["bm_ap_weapon_peacemaker_sc_desc"] = "#{risk}#역사상 가장 뛰어난 권총.##\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##\n\n#{important_1}#반동이 증가하고 유효 사거리가 감소하며 조준이 불가능해지는 대신## #{skill_color}#발사 속도가 증가하는## 팬링을 할 수 있습니다.",
				--CUSTOM PISTOLS
					--Zippy 
					["bm_zippy_sc_desc"] = "배출 불량 및 불발에 있어서 최고의 무기입니다. 이걸로 손가락이 날아가지 않은 채 두 발을 쏘는데 성공했다면 운이 좋은 겁니다.",
					--Auto-9
					["bm_wp_rc_auto9_cartoon"] = "애니메이션 시리즈 트레이서",
					["bm_wp_rc_auto9_cartoon_desc"] = "1988년 같은 파티를 즐겨보세요!",
					--M2019 Blaster
					["thatgun_desc"] = "총이야!\n\n알잖아, 그 총!\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 다수의 적을 관통할 수 있습니다.##",
					--Malorian 3516
					["whydoyoucome"] = "로커보이 존 실버헤드를 위해 특별히 제작된 유일한 권총입니다.\n\n#{skill_color}#방탄복과 다수의 적을 관통할 수 있습니다.\n지향 사격으로 발사하면 총알이 표면에 튕기고, 조준하면 벽을 관통합니다.\n무기 개머리판으로 공격하면 짧은 사거리의 화염파를 뿜어냅니다.##",
					--Colt Detective
					["bm_lemon_dmc_desc"] = "숨길 수 있는 고화력 리볼버를 가지고 있다고 상상해보세요. 이제 더 이상 상상하지 마세요. Investigator가 바로 그 리볼버죠.\n\n#{skill_color}#적을 뒤에서 공격할 때 두 배의 대미지를 가합니다.##",
			
			--[[ SMGs ]]
				--Kobus 90
				["bm_p90_sc_desc"] = "불펍 기관단총이자 SpecOps-7 기관단총의 경쟁 총기입니다. 미래형 우주총처럼 생겼다는 평이 많습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
				["bm_wp_p90_body_p90_tan"] = "탠 개머리판",
				["bm_wp_90_body_boxy_desc"] = "오래된 옴니아 창고의 황폐한 잔해에서 회수한 이 프레임은 무기의 조작성이나 기능에는 전혀 차이를 두지 않지만, 블록과 같은 미학적 특성으로 인해 가지고 있으면 확실히 좋은 물건입니다.",
				--Spec Ops
				["bm_mp7_sc_desc"] = "경량 기관단총이며 Project-90 기관단총의 경쟁 총기입니다. 몇가지 이유로 유탄 발사기가 장착되었다고 믿을 수 있겠지만 실제로는 없습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
				--Heather
				["bm_sr2_sc_desc"] = "특수한 9×21mm 탄을 사용하는 Heather 기관단총은 Project-90과 SpecOps-7 기관단총에 대한 러시아의 대답입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
				--Compact-5/MP5
				["bm_mp5_sc_desc"] = "Gewehr-3의 여동생.\n발사 속도가 빠르고 정확하며 다루기 쉬운 기관단총에게 무엇을 더 바랄 수 있겠습니까?",
				--Pachett/Sterling
				["bm_wp_sterling_b_e11"] = "블라스테크 E-11 총열",
				["bm_wp_sterling_b_e11_desc_sc"] = "#{skill_color}#머나먼 은하계##에서 왔다고 전해지는 기술은 이 무기를 #{risk}#플라스마 볼트를 발사하도록## 바꾸며, #{skill_color}#재충전식 탄창##을 사용합니다.\n\n재충전 지연: #{skill_color}#1.4초##\n재충전 속도: #{skill_color}#6초## #{important_1}#(과열되면 잘반으로 감소)##\n과열 페널티: #{important_1}#2초##",
				--Uzi
				["bm_uzi_sc_desc"] = "Uzi는 발사 속도가 느리지만 안정적이고 제어하기 쉬운 기관단총으로 여전히 강력한 타격을 가하며, 특히 .41 AE 탄 변환이 적용된 버전은 그보다 더욱 강력합니다.",
				--Chicago Typewriter
				["bm_thompson_sc_desc"] = "대용량 드럼 탄창을 사용하여 적을 쓰러뜨리면서 마피아의 열기를 불러일으킬 수 있습니다.",
				--MP40
				["bm_erma_sc_desc"] = "제2차 세계대전 당시 보병들이 널리 사용했던 꽤 안정적인 기관단총이지만, 탄창을 그립으로 사용하지 마세요.",
				--CUSTOM SMGs
					["bm_w_m7caseless"] = "Misriah Armory M7 SMG",
					["bm_w_m7caseless_supp"] = "Misriah Armory M7S SMG",
					["bm_w_x_m7caseless"] = "아킴보 M7 SMG",
					["bm_w_x_m7caseless_supp"] = "아킴보 M7S SMG",
					--AR57
					["bm_w_alpha57_prim_desc"] = "FSS 허리케인은 사거리와 저지력을 포기했지만, 탄약 용량을 늘리고 안정성을 강화했습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
					--LWRC
					["bm_w_smg45_desc"] = "AMP-45의 미국 복제품입니다.",
					--Typhoon
					["bm_w_crysis3_typhoon_desc"] = "\"이건 가장 순수한 표현이지, 그리고 지금은 #{important_1}#할 말이 많다.##\"\n\n#{risk}#중첩 장전## 기술을 활용한 이 열 개의 총신이 달린 기관총은 엄청난 고속으로 납을 뿜어내는 대신 피해가 감소했습니다.\n\n보조 사격은 사거리 내에 #{skill_color}#10##발을 #{skill_color}#일제 사격합니다.##",
					--Fang 45
					["bm_w_fang45_desc"] = "#{skill_color}#재장전 시 처음 5발의 발사 속도가 33%만큼 증가합니다.##",
					--KSP 45
					["bm_w_ksp45_desc_sc"] = "이 3점사로 발사하는 기관단총은 중간 사거리에서는 높은 대미지를 가지고 있지만, 점사의 탄퍼짐은 장거리에서는 효율성이 떨어집니다.",
					--LC10
					["bm_w_lc10_desc_sc"] = "뛰어난 대미지 사거리와 좋은 명중률을 갖춘 다재다능한 전자동 기관단총입니다. 인상적인 총구 속도와 높은 발사 속도로 적당한 데ㅐㄷ미지를 제공하죠.",
			
			--[[ MGs ]]
				--Bootleg/HK416c
				["bm_w_tecci_desc_sc"] = "경기관총과 유사하지만 정확하게 납을 뿜을 수 있는 피스톤 작동식 소총입니다.",
				["bm_wp_tecci_s_minicontra_alt"] = "SG 고정 개머리판",
				--KSP/M249
				["bm_m249_sc_desc"] = "재장전을 하는 건 매우 번거로운 일이지만, 재장전이 필요하기도 전에 모두를 죽일 가능성이 크죠.",
				--ChainSAW
				["bm_kacchainsaw_sc_desc"] = "이 기관총 속에는 공허를 내뿜는 광기가 돌아다니고 있습니다.\n\n#{skill_color}#지향 사격의 탄퍼짐이 개선됩니다.##",
				["bm_wp_upg_i_kacchainsaw_adverse"] = "유해 가스 시스템",
				--RPK
				["bm_rpk_sc_desc"] = "총알을 정확하게 맞추고 동구권 특유의 느낌을 더하고 싶을 때 쓰기 좋은 선택입니다.",
				["bm_wp_rpk_m_ban_sc"] = "포타슘 탄창",
				["bm_wp_ak_m_drum"] = "드럼 탄창",
				["bm_wp_upg_i_rpk74"] = "AK 5.45 킷",
				--Brenner 21/HK21
				["bm_hk21_sc_desc"] = "Gewehr-3의 큰 자매. 더욱 강력한 제압 능력을 위해 발사 속도가 증가했습니다.",
				--M60
				["bm_m60_sc_desc"] = "탄을 많이 잡아먹고 엄청나게 다루기 번거롭다는 이유로 '돼지'라는 별명이 붙었습니다. 사정거리에 있는 적들은 누구든지 닫힌 관에 넣어질 것으로 생각하십시오.\n\n#{skill_color}#지향 사격의 탄퍼짐이 개선됩니다.##",
				--Ksp 58
				["bm_par_sc_desc"] = "일반적으로 차량에 장착되는 KSP-90의 더 무거운 형제 기관총입니다. 더 큰 총알을 위해 기동성을 희생합니다.",
				--Versteckt-51/HK51B
				["bm_hk51b_sc_desc"] = "Brenner-21을 에프터마켓에서 개조하여 이 기관총의 크기를 Compact-5의 크기로 줄이고 발사 속도를 Brenner보다 더욱 높였습니다.",
				["bm_wp_hk51b_magazine_belt_60"] = "60발 벨트",
				["bm_wp_hk51b_magazine_belt_80"] = "80발 벨트",
				--Buzzsaw/Mg42
				["bm_wolf_brigade_sc_desc"] = "\"우리는 단순한 개들로 위장한 사람이 아니다.\n우리는 단순한 인간으로 위장한 #{important_1}#늑대들##이다.\"\n\n#{skill_color}#지향 사격 시 탄퍼짐과 반동이 개선됩니다.##",
				["bm_wp_mg42_b_vg38"] = "블라스테크 DLT-19 총열",
				["bm_wp_mg42_b_vg38_desc_sc"] = "#{skill_color}#머나먼 은하계##에서 왔다고 전해지는 기술은 이 무기를 #{risk}#플라스마 볼트를 발사하도록## 바꾸며, #{skill_color}#재충전식 탄창##을 사용합니다.\n\n재충전 지연: #{skill_color}#3s##\n재충전 속도: #{skill_color}#9/s## #{important_1}#(과열되면 잘반으로 감소)##\n과열 페널티: #{important_1}#4s##",
				--M134
				["bm_m134_sc_desc"] = "\"어디까지 가더라도, 끝이 보이지 않을 정도의 무수한 시체를 넘더라도...\"\n\n#{risk}#발사 전 짧은 회전 시간을 가집니다. 조준하면 무기가 계속 회전합니다.##",
				--Microgun
				["bm_shuno_sc_desc"] = "\"이건 너의 길이다. 네가 올 때는, 혼자서 걸어오게 되겠지.\"\n\n#{risk}#발사 전 짧은 회전 시간을 가집니다. 조준하면 무기가 계속 회전합니다.##",
				--Custom MGs
					--Madsen MG
					["bm_wp_wpn_fps_lmg_madsen_mg_xmag"] = "40발 탄창",
					--Stoner 63 (LMG)
					["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_01"] = "스피드 테이프",
					["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_01"] = "드롭샷 랩",
					["bm_wp_wpn_fps_lmg_stoner63a_handle_01"] = "필드 테이프",
					["bm_wp_wpn_fps_lmg_stoner63a_handle_02"] = "SASR 정글 손잡이",
					["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_02"] = "세르팡 랩",
					["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_02"] = "공수부대용 탄성 랩",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_01"] = "100발 탄창",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_02"] = "STANAG 125발 탄창",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_01"] = "패스트 탄창",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_02"] = "반달 스피드 로더",
					--TF2 Minigun
					["bm_wp_wpn_fps_lmg_sasha_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_iron_curtain_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_tomislav_body_desc"] = "#{skill_color}#회전 시간을 20%만큼 단축합니다.##",
					["bm_wp_wpn_fps_lmg_natascha_body_desc"] = "#{skill_color}#최대 9.75m 떨어진 적을 휘청거리게 만듭니다.##\n#{risk}#(휘청거림 사거리는 수정할 수 없습니다.)##\n#{important_1}#회전 속도가 30%만큼 느려집니다.##",
					["bm_wp_wpn_fps_lmg_gatling_gun_body_desc"] = "#{important_1}#회전 속도가 50%만큼 느려집니다.##",
					["bm_wp_wpn_fps_lmg_canton_body_desc"] = "#{skill_color}#80% 확률로 적을 불태워 4초 동안## #{heat_warm_color}#60## #{skill_color}#의 데미지를 입힙니다.##\n#{risk}#사거리에 따라 확률이 감소하며, 대미지가 감소하기 전 사거리에만 적을 기절시킵니다.\n총알 피해 대신 화염 피해를 가합니다.##",
			
			--[[ SHOTGUNS ]]
				--Saiga
				["bm_saiga_sc_desc"] = "이 완전 자동 산탄총은 조준하고 싶지 않은 날에 딱 맞는 산탄총입니다.",
				["bm_wp_saiga_m_20rnd"] = "드럼 탄창",
				--AA12
				["bm_aa12_sc_desc"] = "박스 탄창을 사용하는 자동 사격 전용 산탄총입니다. 지속적인 인상을 남기기에 좋죠.",
				--Spas12
				["bm_spas12_sc_desc"] = "다른 단발 산탄총보다 더 무겁고 복잡한 대안책으로, 거의 생소한 대체 발사 모드를 제공합니다.",
				--Benelli
				["bm_benelli_sc_desc"] = "최고급 전술 산탄총. 특히 혼잡한 방을 청소하기에 완벽합니다.",
				--Argos III
				["bm_ultima_sc_desc"] = "플라스틱과 알루미늄만큼 현대적이라고 할 만한 것은 없습니다. 휴대폰을 충전할 수 있는 USB 슬롯도 갖추고 있죠.\n\n한 번에 탄을 #{skill_color}#2##개씩 재장전합니다.",
				--Supernova
				["bm_supernova_sc_desc"] = "펌프 액션과 단발을 전환할 수 있도록 특별히 제작된 산탄총입니다.",
				--Loco
				["bm_serbu_sc_desc"] = "Reinfeld 880의 에프터마켓 버전으로, 손목을 파괴하고 싶은 욕구와 은폐성을 원하는 사람들을 위해 그보다 크기를 줄여 제작되었습니다.",
				--Reinfeld 88
				["bm_menu_sc_m1897_desc"] = "이 상징적이고 역사적인 산탄총은 진흙 투성이의 참호에서부터 태평양 섬의 울창한 정글에 이르기까지 다양한 환경에서 사용되었으며, 꽤 효과적인 불쏘시개라는 나쁜 평판을 받고 있습니다.",
				--Mosconi 12g
				["bm_menu_sc_m590_desc"] = "오래된 고전 산탄총의 개량된 버전입니다. LEO, 군인, 민간인, 은행 강도 모두에게 좋은 선택입니다.",
				--R870
				["bm_menu_sc_r870_desc"] = "법과 자유의 긴 팔. 이제 자유에는 당신의 이름이 새겨진 산탄총과 셀을 가지고 있습니다.",
				--KSG
				["bm_menu_sc_ksg_desc"] = "미래에는 모든 것이 플라스틱이죠! LWI 특산품이자 장인 정신이 의심스러운 불펍 산탄총입니다.",
				--Breaker 10g
				["bm_menu_sc_boot_desc"] = "강력한 10g 산탄 셀과 더욱 개쩌는 성능을 자랑하는 골동품 산탄총입니다. 살고 싶으면 따라와라.",	
				--Mosconi
				["bm_menu_sc_huntsman_desc"] = "총열이 두 배면 재미도 두 배로 커지죠. 탄창 크기는 제한되어 있지만 #{skill_color}#두 개의 트리거##를 사용하여 같은 방에 있는 불행한 놈들에게 라그나로크의 벅샷을 발사할 수 있습니다.",
				--Judge
				["bm_x_judge_sc_desc"] = "저지와 주리라는 이 휴대용 방 정리자 두 개와 함께라면 당신은 사형 집행자가 될 수 있습니다.",
				--Joceline
				["bm_b682_sc_desc"] = "주로 스포츠 경기를 위한 오버언더 산탄총으로, 클레이 비둘기 대신 헬멧을 터뜨리는 데 사용합니다.",
				--Custom Shotguns
					--Reinbeck M1
					["bm_w_beck_desc"] = "범죄 암흑 세계에서 가장 인기 있는 산탄총이 무덤에서 돌아와 산탄총 계층에서 정당한 자리를 되찾았습니다. 원래 2011년 크라임 웨이브에서 사용된 이 산탄총은 거의 모든 근거리 상황에서 매우 신뢰할 수 있는 것으로 입증되었습니다.",
					--Doomstic
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "근거리에서 효과적인 펠릿 유형입니다.\n#{skill_color}#펠릿 수가 10개로 늘어납니다.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "중거리에서 효과적인 펠릿 유형입니다.\n#{important_1}#펠릿 수가 6개로 줄어듭니다.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "장거리에서 효과적인 강력한 강철 슬러그입니다.\n#{skill_color}#방탄복, 적, 방패, 타이탄 방패, 벽을 관통할 수 있습니다.##",
					--REBECCA CYBERPUNK
					["bm_w_rebecca_desc"] = "엄청난 혼란을 불러올 테지만, 예측 불가능할 수도 있죠.\n#{risk}#사격을 하면 밀쳐지고 일시적으로 조준을 할 수 없게 됩니다.##",
					--Widowmaker TX
					["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "확장 탄창",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "점사 시스템",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst_desc"] = "##{skill_color}#2점사## 모드를 추가합니다.",
			
			--[[ ARs ]]
				--S552		
				["bm_s552_sc_desc"] = "DHS에서 선호하는 다른 소형 5.56mm 소총에 대한 우아한 대안입니다. 더 나은 사거리를 제공하는 특수 스위스산 5.6mm 탄을 사용합니다.",
				--M733/AMCAR
				["bm_amcar_sc_desc"] = "세계에서 가장 많이 생산된 .223 소총입니다. 훌륭한 다목적 소총이죠.",
				["bm_wp_upg_i_patriot"] = "패트리엇",
				["bm_wp_upg_i_patriot_desc"] = "#{important_1}#[편집됨]##을 위해 개발된 돌격 권총.\n\n드럼 매거진 내부의 피더 메커니즘이 #{important_1}#[편집됨]## 모양을 형성합니다.",
				["bm_wp_upg_i_og_rof"] = "발사 속도 제한기",
				["bm_wp_upg_i_og_rof_desc"] = "관심이 있다면 원래 무기의 터무니없이 낮은 발사 속도를 복구해보십시오...",
				--G36
				["bm_g36_sc_desc"] = "'최고의 플라스틱 소총' 상을 노릴 수 있는 또 다른 유력한 후보입니다.",
				["bm_wp_upg_i_m8a1"] = "M8 점사 킷",
				["bm_wp_upg_i_m8a1_desc"] = "발사 모드를 #{risk}#4점사##로 고정시키고 발사 속도가 증가하며 탄창에 추가 탄약이 제공됩니다.",
				--VHS/Lion's Roar
				["bm_vhs_sc_desc"] = "잘 다룰 줄 아는 사람의 손에 쥐어지면 인상적인 성능을 자랑하는 다루기 힘든 무기입니다.\n\n전투에서 드라간의 분노의 정신을 옮긴다고 전해지죠.",
				["bm_wp_upg_i_swordfish"] = "소드피시 점사 킷",
				["bm_wp_upg_i_swordfish_desc"] = "발사 모드를 #{risk}#5점사##로 고정시키고 발사 속도가 증가하며 탄창에 추가 탄약이 제공됩니다.",
				--Olympic/Para
				["bm_menu_sc_olympic_desc"] = "자동 사격으로 소총탄을 발사하는 엄청나게 큰 권총. 이 총은 총알을 쏘는 실존적 위기입니다.",
				--TAR-21/Para
				["bm_menu_sc_komodo_desc"] = "매우 컴팩트한 패키지에 많은 대미지를 가합니다. CQB나 원거리 전투에 적합하죠.",
				--Famas
				["bm_menu_sc_famas_desc"] = "이 무기는 탄창 용량을 희생하고 발사 속도와 명중률을 늘렸습니다. 사람들의 머리에서 사과를 쏘는 데 매우 효과적인 총이기도 하죠.",
				--M4/CAR-4
				["bm_m4_sc_desc"] = "신뢰성 있고 컴팩트하며 치명적입니다. AM-CAR보다 반동 제어가 가능한 발사 속도를 자랑하는 CAR-4는 현대 군대에서 인기 있는 5.56mm 소총입니다.",
				["bm_wp_upg_fg_m4a1"] = "앰포 킷",
				["bm_wp_upg_fg_m4a1_desc"] = "이 전용 세트는 에프터마켓 플립업 조준기를 보다 전통적인 모양으로 교체합니다. #{risk}#총열덮개의 겉모습을 덮어씁니다.##",
				["bm_wp_upg_s_fixed"] = "CAR 고정 개머리판",
				["bm_wp_m4_m_drum"] = "드럼 탄창",
				--AK5
				["bm_ak5_sc_desc"] = "은행 강도에게 유명하고 총알 크기에 대해 잘 알지 못하는 사람들을 혼란스럽게 하는 좋은 다용도 소총입니다.",
				["fnc_burst_desc"] = "3점사 사격 모드를 추가합니다.",
				--Union 5.56
				["bm_corgi_sc_desc"] = "명성에도 불구하고, 이 불펍 소총은 항해에 전혀 적합하지 않습니다.",
				--UAR
				["bm_aug_sc_desc"] = "클래식 불펍 소총. 죽은 나쁜 놈들을 더 만들어주는 훌륭한 올라운더입니다.",
				--AK17
				["bm_flint_sc_desc"] = "고전 AK의 현대적 해석. 강력한 #{skill_color}#2점사##를 갖추고 있으며 상당한 정체성 위기를 가지고 있습니다.",
				--AK 5.45
				["bm_ak74_sc_desc"] = "7.62mm보다 작은 탄을 쏘지만, 이 소총의 치명적 위력은 전혀 떨어지지 않습니다.",
				--CR 805
				["bm_menu_sc_hajk_desc"] = "클래식한 총알 호스 코브라의 더 젊고 현대적인 사촌. 이 소총은 다양한 발사 모드와 심지어 여러가지 탄 변환을 제공하지만... 그런 걸 얻을 수는 없겠지만요.",
				--AMR-16
				["bm_m16_sc_desc"] = "이 클래식 소총은 AM-CAR의 전신입니다. 은폐성과 발사 속도가 부족한 점을 사거리와 저지력으로 보완합니다.",
				--Queen's Wrath
				["bm_l85a2_sc_desc"] = "이 소총은 이전 모델에 의해 명성이 훼손되기는 했지만, 역사상 가장 명중률이 높은 자동소총 중 하나로 손꼽힙니다.\n하지만 여전히 인체공학적인 악몽입니다.",
				--AK 7.62
				["bm_akm_sc_desc"] = "이 소총은 방탄복이 DC에서 인기를 끌기 시작할 때 가지고 다니기 편리한 물건이 될 것입니다.\n\n전 세계의 반군과 미친 정권이 자주 찾는 소총이기도 하죠.",
				["bm_akm_gold_sc_desc"] = "강도, 멕시코 마약왕, 과대망상증에 걸린 독재자의 공통점은 무엇일까요? 물론 금도금 소총에 대한 매혹이죠.",
				--KETCHUPKNOB--
				--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
				["bm_groza_sc_desc_pc"] = "AK 계열의 불펍 소총으로, 더욱 강력한 폭발력을 원하는 사람들을 위해 제작되었습니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
				["bm_groza_sc_desc"] = "AK 계열의 불펍 소총으로, 더욱 강력한 폭발력을 원하는 사람들을 위해 제작되었습니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
				--Krinkov
				["bm_akmsu_sc_desc"] = "빅 맨을 쓰러뜨리는 데 유용한 작은 소총입니다. 이 소총은 거의 모든 상황에서 자체 성능을 발휘할 수 있으므로 과소평가해서는 안 됩니다.",
				--Akimbo Krinkov
				["bm_x_akmsu_sc_desc"] = "빅 맨을 쓰러뜨리는 데 유용한 작은 소총입니다. 이 소총은 거의 모든 상황에서 자체 성능을 발휘할 수 있으므로 과소평가해서는 안 됩니다.",
				--CUSTOM ARs
					--QBZ-191
					["bm_qbz191_sc_desc"] = "5.8x42mm 탄을 사용하는 차세대 중국 돌격소총.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
					--AN-94/92
					["bm_tilt_sc_desc"] = "#{risk}#각 방아쇠 당긴 후 처음 2발은## 발사 속도의 #{skill_color}#3배로 발사됩니다.##",
					--NV4
					["bm_nova4_sc_desc"] = "자동 사격 탄도 소총. 적당한 발사 속도로 안정성이 향상되어 동급 최고의 명중률을 제공합니다. 중거리에서 장거리 교전에 적합하죠.",
					["bm_wp_wpn_fps_ass_nova4_flatline_desc"] = "다음과 같은 특전을 부여합니다:\n#{heat_warm_color}#정밀도:##\n발사 속도가 #{important_1}#감소하지만## #{skill_color}#대미지 감소가 없어집니다.##\n#{item_stage_2}#집중:##\n명중률이 #{skill_color}#증가합니다.##",
					["bm_wp_wpn_fps_ass_nova4_chaos_desc"] = "다음과 같은 특전을 부여합니다:\n#{heat_warm_color}#민첩함:##\n지향 사격의 발사 속도가 #{skill_color}#증가하지만## 조준 사격의 발사 속도가 #{important_1}#감소합니다.##\n#{item_stage_2}#안정함:##\n지향 사격의 탄퍼짐이 #{skill_color}#감소합니다.##",
					--MW22 Honey Badger
					["bm_w_mcbravo_desc"] = "#{skill_color}#일체형 소음기##와 느리고 고에너지의 아음속 #{risk}#.300 BLK## 탄을 사용하는 Chimera는 근접 전투에 능숙합니다.",
					--BOCW CARV2
					["bm_w_t9fastburst"] = "CARV.2",
					["bm_wp_upg_i_g11"] = "K1 하부",
					["bm_wp_upg_i_g11_desc"] = "점사 발사 속도가 #{skill_color}#2100 RPM##으로 증가하고 #{skill_color}#발사 선택기를 사용할 수 있습니다.##",
					--MW2023 STG-44 (FUCK YOU, SLEDGEHAMMER)
					["bm_w_stango44"] = "\"STG-44\"",
					["bm_wp_wpn_fps_ass_stango44_magazine_40"] = "30발 탄창",					
			
			--[[ DMRs ]]
				--Little Friend
				["bm_m203_weapon_sc_desc_pc"] = "스카페이스의 개인용 \"Little Friend\"이자 AMR-16의 큰 언니.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##\n#{skill_color}#$BTN_BIPOD## 키를 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
				["bm_m203_weapon_sc_desc"] = "스카페이스의 개인용 \"Little Friend\"이자 AMR-16의 큰 언니.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
					--VMP
					["bm_m203_vmp_sc_desc_pc"] = "스카페이스의 개인용 \"Little Friend\" AMR-16의 복제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
					["bm_m203_vmp_sc_desc"] = "스카페이스의 개인용 \"Little Friend\" AMR-16의 복제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 유탄 발사기로 전환합니다.",
					["bm_mesa_vmp_sc_desc_pc"] = "훔친 옴니아 배송물에서 나온 흥미로운 제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 하부에 장착된 유탄 발사기로 전환합니다.",
					["bm_mesa_vmp_sc_desc"] = "훔친 옴니아 배송물에서 나온 흥미로운 제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 유탄 발사기로 전환합니다.",
				--FAL
				["bm_fal_sc_desc"] = "자유 세계의 오른팔. 중량 방탄복을 입은 멍청이들을 쓰러뜨려야 할 때, 이 총을 써보십시오.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",	
				["bm_fal_ap25_sc_desc"] = "자유 세계의 오른팔. 중량 방탄복을 입은 멍청이들을 쓰러뜨려야 할 때, 이 총을 써보십시오.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가합니다.##",	
				--ASS VAL
				["bm_asval_sc_desc"] = "작은 소총용 총알이 당신의 총격전을 벌이는 데 적합할 수도 있지만, 이 총을 선호하는 사람도 있을 것입니다.\n\n#{skill_color}#일체형 소음기##가 장착되어 있고 #{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
				--Galil
				["bm_galil_sc_desc"] = "핀란드 디자인을 기반으로 한 소총의 모방품으로, 그 자체도 고전 AK의 파생품이었습니다. 모방은 아첨의 가장 진실한 형태이죠.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
				["bm_galil_ap25_sc_desc"] = "핀란드 디자인을 기반으로 한 소총의 모방품으로, 그 자체도 고전 AK의 파생품이었습니다. 모방은 아첨의 가장 진실한 형태이죠.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가합니다.##",
				["bm_galil_556_sc_desc"] = "핀란드 디자인을 기반으로 한 소총의 모방품으로, 그 자체도 고전 AK의 파생품이었습니다. 모방은 아첨의 가장 진실한 형태이죠.",
				--SCAR		
				["bm_scar_sc_desc"] = "미래의 전투용 소총. 조작성과 탄도 피해 간의 균형이 잘 잡혀 있어 USMC와 특수부대 사이에서 인기를 끌었습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
				["bm_scar_ap25_sc_desc"] = "미래의 전투용 소총. 조작성과 탄도 피해 간의 균형이 잘 잡혀 있어 USMC와 특수부대 사이에서 인기를 끌었습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가합니다.##",
				["bm_scarl_sc_desc"] = "미래의 보병 소총... 아님 아닐 수도 있습니다. 민간 시장에서는 인기가 있었지만 군에서는 5.56 소총이 더 필요하지 않았습니다.",
				["bm_scarhamr_sc_desc"] = "미래의 보병 자동소총... 아님 아닐 수도 있습니다.",

				--Galant
				["bm_galant_sc_desc"] = "고전적인 2차 세계 대전의 전투 소총. 신뢰성이 있고 정확하며, #{skill_color}#비었을 때 재장전이 빠릅니다.\n\n방탄복을 관통하여 피해의 75%를 가하고 다수의 적과 얇은 벽을 관통할 수 있습니다.##",
				--M308
				["bm_m14_sc_desc"] = "발사 속도가 빠르고 정확하지만, 특히 자동 사격 시에는 반동을 조심하는 것이 중요합니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",	
				--G3
				["bm_g3_sc_desc"] = "Compact-5 및 Brenner-21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",	
				["bm_g3_ap25_sc_desc"] = "Compact-5 및 Brenner-21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가하고 적을 관통할 수 있습니다.##",	
				["bm_g3_sg1_sc_desc"] = "Compact-5 및 Brenner-21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				["bm_wp_g3_m_psg"] = "프레지션 탄창",
				["bm_wp_upg_i_g3sg1"] = "프레지션 하부",
				["bm_wp_upg_i_g3sg1_desc"] = "#{skill_color}#완전한 방탄복 관통력 및 방패 관통 능력을 부여하는## 고화력 탄을 장전합니다. 부품은 더 무거운 소재로 강화되어 #{important_1}#발사 속도가 감소하고## #{risk}#단발 사격##으로 고정됩니다.",
				--KS12
				["bm_shak12_sc_desc"] = "매우 강력한 12.7x55mm 카트리지를 사용하는 불펍 디자인의 전투 소총입니다. 최고의 대학살이 매우 작은 패키지에 담겨있죠.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",	
				["bm_shak12_sc_oden_desc"] = "매우 강력한 12.7x55mm 카트리지를 사용하는 불펍 디자인의 전투 소총입니다. 최고의 대학살이 매우 작은 패키지에 담겨있죠.\n\n#{skill_color}#방탄복, 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				["bm_wp_shak12_body_vks"] = "\"비샤\" 개머리판",
				["bm_wp_shak12_body_vks_ap_desc"] = "#{skill_color}#완전한 방탄복 관통력 및 방패 관통 능력을 부여하는## 고화력 탄을 장전합니다. 개머리판과 볼트는 더 무거운 재료로 강화되어 #{important_1}#발사 속도가 감소합니다.##",
				--HCAR
				["bm_hcar_sc_desc"] = "고전적인 2차 세계대전 기관총을 현대적으로 재해석한 기관총입니다.",
				--Custom DMRs
					--BOCW EM2
					["bm_w_t9british"] = "EM2",
					["bm_wp_wpn_fps_ass_t9british_xmag_01"] = "30발 탄창",
					["bm_wp_wpn_fps_ass_t9british_xmag_01_desc"] = "",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_01"] = "25발 스피드 탄창",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_01_desc"] = "",
					["bm_wp_wpn_fps_ass_t9british_xmag_02"] = "STANAG 40발 탄창",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_02"] = "Salvo 30발 패스트 탄창",
					--MCX Spear
					["bm_mcx_spear_sc_desc"] = "#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
					["bm_ngsierra_sc_desc"] = "6.8x51mm TCVM 플라스틱 카트리지를 제어하기 위해 독특한 반동 완화 시스템을 사용합니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가하고 적을 관통할 수 있습니다.##",
					--["bm_w_xeno"] = "MA14 Surge 소총",	
					["bm_xeno_sc_desc_pc"] = "\"Armat\"에서 나온 이상한 우주 시대 기술. #{skill_color}#일체형 유탄 발사기##가 장착되어 있습니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 유탄 발사기로 전환합니다.",
					["bm_xeno_sc_desc"] = "\"Armat\"에서 나온 이상한 우주 시대 기술. #{skill_color}#일체형 유탄 발사기##가 장착되어 있습니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 꾹 눌러 유탄 발사기로 전환합니다.",
					--VSS
					["bm_vss_sc_desc"] = "더 나은 사거리와 명중률을 위해 구성된 Valkyria의 변형판입니다.\n\n#{skill_color}#일체형 소음기##가 장착되어 있고 #{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
					--G3 HK79
					["bm_g3hk79_sc_desc_pc"] = "#{skill_color}#총열하부 유탄 발사기##가 장착된 Gewehr-3의 변형입니다. 또한 #{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 유탄 발사기로 전환합니다.",
					--BO3 XR2
					["bm_xr2_sc_desc"] = "XR-2는 가장 역동적인 전투 시나리오를 위해 설계된 다목적 소총으로, 점사 모드에서 #{skill_color}#발사 속도가 증가하는 고유한## #{risk}#자동 3점사## 기능을 갖추고 있습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##",
					["bm_wp_xr2_handle_01_sc"] = "자동 사격 볼트",
					["bm_xr2_handle_01_sc_desc"] = "자동 점사를 #{skill_color}#자동 사격##으로 바꾸는 대신 #{important_1}#점사 속도 증가##를 희생합니다.",
					["bm_wp_xr2_handle_02_sc"] = "속사 볼트",
					["bm_xr2_handle_02_sc_desc"] = "점사 시 반동 완화가 #{important_1}#낮아지는 대신## 점사 발사 속도가 #{skill_color}#950 RPM##으로 증가합니다.\n\n#{important_1}#점사 지연 시간과 단발 발사 속도에는 영향이 없습니다.##",
					--SIERRA .458
					["bm_w_sierra458_sc_desc"] = "갱단의 무기 제작자인 체인스는 Tecci Tactical 소총을 대체할 강력하면서도 높은 발사 속도를 지닌 소총을 개발하기 시작했습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
					["bm_w_sierra458_beo_desc"] = "갱단의 무기 제작자인 체인스는 Tecci Tactical 소총을 대체할 강력하면서도 높은 발사 속도를 지닌 소총을 개발하기 시작했습니다.\n\n#{skill_color}#방탄복, 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
					["bm_wp_wpn_fps_snp_sierra458_m_bush_desc"] = ".458 SOCOM 탄을 #{stats_positive}#독이 함유된 .450 Bushmaster## 탄으로 전환합니다. 이 탄은 #{stats_positive}#4초 동안 초당 30씩 피해를 가하고 적을 기절시킬 수 있습니다.##\n\n#{important_1}#더 이상 다수의 적을 관통할 수 없습니다.##",
					["bm_w_sierra458_ivy_desc"] = "갱단의 무기 제작자인 체인스는 Tecci Tactical 소총을 대체할 강력하면서도 높은 발사 속도를 지닌 소총을 개발하기 시작했습니다.\n\n#{skill_color}#방탄복을 관통하여 50%의 피해를 가하고 얇은 벽을 관통할 수 있고## #{stats_positive}#독탄으로 시간이 지남에 따라 피해를 가합니다.##",
			
			--[[ SNIPERS ]]
				--MSR
				["bm_msr_sc_desc"] = "미군이 채택한 저격소총. 좋은 명중률, 조작성, 심지어 은폐성까지 갖춘 이 소총은 다용도 저격소총으로 적합합니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				--R700
				["bm_r700_sc_desc"] = "Rattlesnake의 전신. 명중률와 조작성이 좋고, 후기형보다 사정거리가 더 넓습니다. 단점이요? 형편없는 5발 탄창이죠.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				--QBU88
				["bm_qbu88_sc_desc"] = "동구권에서 영감을 받은 불펍 저격 플랫폼. 다른 사람들과 마찬가지로, 자신의 의지를 강요하기 데 적합합니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Winchester 1874
				["bm_winchester1874_sc_desc"] = "서부를 정복한 총. 총기의 성스러운 유물이지만 강력한 .44-40 탄약 공급으로 인해 덜 치명적인 것은 아닙니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##\n\n#{important_1}#사거리가 감소하고 반동이 커지는 대신## #{skill_color}#연사 속도를 높일 수 있는 속사##를 할 수 있습니다.",	
				--TTI(TTY)
				["bm_tti_sc_desc"] = "윅의 개인용 총기 중 하나. 온라인 어딘가에 그가 이 소총으로 3 건을 연습하는 영상이 있다고 합니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Icky Vicky
				--["bm_victor_sc_desc"] = "\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				--Scunt
				--["bm_scout_sc_desc"] = "\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				["bm_wp_scout_m_extended"] = "스탠드오프 신속 탄창",
				--AWP
				["bm_awp_sc_desc"] = "뛰어난 사정거리와 명중률로 유명한 저격소총. 초기 모델이 창고에서 세 사람에 의해 만들어졌다고 누가 생각이나 했을까요?\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
				["bm_awp_cs_dragon"] = "AWP | 용의 전설",
				["bm_awp_cs"] = "AWP",
				["bm_wp_upg_bazooka"] = "용의 비전설 전용 세트",
				["bm_wp_upg_bazooka_desc"] = "위험할수록 큰 보상이 따르는 이 악명 높은 소총은 단방에 적을 제압하는 방식이 특징인 것으로 널리 알려져 있습니다.\n\n#{skill_color}#헤드샷은 캡틴을 제외한 적에게 50%만큼 추가 피해를 가합니다.##\n#{skill_color}#타이탄 방패를 관통할 수 있습니다.##\n\n#{risk}#사격 시 잠시동안 조준을 할 수 없습니다.##",
				["bm_bazooka_sc_desc"] = "위험할수록 큰 보상이 따르는 이 악명 높은 소총은 단방에 적을 제압하는 방식이 특징인 것으로 널리 알려져 있습니다.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##\n\n#{risk}#사격 시 잠시동안 조준을 할 수 없습니다.##",
				--WA2000
				["bm_wa2000_sc_desc"] = "일류 암살자에게 적합한 저격소총인 이 명품 소총은 단 몇 백 정만 제작되었습니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Rangerhitter
				["bm_sbl_sc_desc"] = "19세기에 비해 더 많은 납을 제공하는 20세기 레버 액션. .45-70의 더 큰 반동과 더 많은 개돼지놈들을 기대하십시오.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##\n\n#{important_1}#사거리가 감소하고 반동이 커지는 대신## #{skill_color}#연사 속도를 높일 수 있는 속사##를 할 수 있습니다.",	
				--Contender G2
				["bm_contender_sc_desc"] = "",	
				--Model 70
				["bm_model70_sc_desc"] = "소총수의 소총. Repeater 1874의 디자이너가 만든 초기 볼트 액션 디자인입니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",			
				--SVD
				["bm_siltstone_sc_desc"] = "AK 계열에 속하는 고성능 단발 저격소총. 대부분의 동구권 무기와 마찬가지로, 그 명성은 충분히 좋습니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Mosin--
				["bm_mosin_sc_desc"] = "음식이 사치스럽더라도 여전히 총이 필요하다면 이 저렴하고 고전적인 볼트 액션 소총이 있습니다.\n\n이 무기는 한 번에 5발의 총알을 재장전하고 #{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				["bm_wp_upg_a_tranq_mosin"] = "마취탄",
				["bm_wp_upg_a_tranq_mosin_desc"] = "진정한 종언을 위해, #{item_stage_2}#디 엔드.##\n\n#{skill_color}#6초 동안 초당 30의 피해를 가하고 적을 기절시킬 수 있는## #{stats_positive}#마취##탄을 발사합니다.\n\n#{important_1}#더 이상 적을 관통할 수 없습니다.##",
				["bm_mosin_tranq_desc"] = "음식이 사치스럽더라도 여전히 총이 필요하다면 이 저렴하고 고전적인 볼트 액션 소총이 있습니다.\n\n이 무기는 한 번에 5발의 총알을 재장전하고,\n\n#{stats_positive}#마취탄으로 시간이 지남에 따라 피해를 가하고## #{skill_color}#방탄복, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Desert Fox
				["bm_desertfox_sc_desc"] = "윅이 러시아 마피아 은신처를 습격하는 동안 사용한 소형 불펍 저격 플랫폼입니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--R93
				["bm_r93_sc_desc"] = "주요 인물을 제압하기 위한 큰 총알을 장착한 독일 저격소총입니다. 전 세계의 경찰과 테러 방지 준군사 세력이 선호하는 저격소총이기도 하죠.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",			
				--Flintlock--
				["bm_bessy_sc_desc"] = "잘 규율된 민병대는 자유로운 주의 안보에 필수적이므로, 무기를 소장하고 휴대하는 인민의 권리는 침해될 수 없다.\n\n#{skill_color}#특수 및 엘리트 적에게 100%만큼 더 많은 피해를 가합니다.\n다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Thanatos--
				["bm_m95_sc_desc"] = "소형 차량과의 전투에 사용되는 대물 저격소총. 이걸로 유기체 표적에게 쏜다는 것은 아마도 전쟁 범죄일 것입니다.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
				--Custom Snipers
					--M107
					["bm_m107cq_sc_desc"] = "Thanatos가 빠르지 않았다면, Mors는 원하는 것을 붉은 안개 형태로 제공할 것입니다.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
					--M200
					["bm_m200_sc_desc"] = "멋있는 360도 노스코프 레더스톨 샷을 하고 싶은 사람들을 위한 저격소총입니다.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
					--S7
					["bm_w_srs99_s7_desc"] = "네 미래는 헤드샷이 보이는구나, 스파르탄.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
					["bm_w_srs99_s7_flexfire_desc"] = "네 미래는 헤드샷이 보이는구나, 스파르탄.\n\n#{skill_color}#다수의 적, 방탄복, 방패 그리고 얇은 벽을 관통할 수 있습니다.##",	
					["flexfire_desc"] = "#{important_1}#조준경의 배율이 고정된 3배 배율로 축소됩니다.\n더 이상 타이탄 방패를 관통할 수 없습니다.##",
					["oracle_scope"] = "오라클 테크링크 조준경",
					["oracle_scope_desc"] = "기본 #{skill_color}#스마트 링크## 조준경의 십자선을 변경하는 데 사용합니다.\n#{risk}#5-10배율.##",
					--SVD
					["bm_wp_wpn_fps_snp_svd_pso"] = "SV7 조준경",
					--Highly Modified CAR-4
					["bm_hmcar_sc_desc"] = "법 집행 기관에 의해 단계적으로 폐기되기 전에, 당신은 이러한 변환 키트로 가득 찬 케이스를 훔쳤습니다.\n\n#{skill_color}#방탄복, 다수의 적, 방패 그리고 얇은 벽을 관통할 수 있는## #{stat_maxed}#타이탄 저격수의 탄##을 발사합니다. 보조 발사는 #{skill_color}#총알과 저지력이 두 배인## #{event_color}#고화력 저격탄##을 발사하며, #{skill_color}#타이탄 방패를 관통하는 능력도 추가합니다.##",
					["bm_wp_hmcar_hd_kit"] = "32비트 8K HD 킷",
					["bm_wp_hmcar_hd_kit_desc"] = "Application has crashed: C++ exception\nCould not load texture because IDirect3D9::CreateTexture call failed.\nDirect3D could not allocate sufficient memory to complete the call.\n\n\n\n\n\n\n ",		
			
			--[[ SPECIALS ]]
				--Saw
				["bm_ap_saw_sc_desc"] = "#{skill_color}#방탄복을 뚫고 썰어버릴 수 있습니다.##",
				["bm_ap_saw_blade_sc_desc"] = "칼날을 날카롭게 하여 #{skill_color}#방탄복을 관통할 수 있습니다.##",
				["bm_fast_motor_sc_desc"] = "분당 회전수가 15%만큼 증가합니다.",
				["bm_slow_motor_sc_desc"] = "분당 회전수가 15%만큼 감소합니다.",
				--Light Crossbow		
				["bm_w_frankish_avelyn"] = "Avelyn",
				["bm_wp_avelyn"] = "Avelyn 킷",
				["bm_wp_avelyn_desc"] = "#{skill_color}#연발 쇠뇌## 킷.\n한 번의 방아쇠 당김으로 화살 #{skill_color}#3##개를 일제 사격할 수 있습니다.",
				["bm_wp_avelyn_override_desc"] = "극히 희귀한 속사형 쇠뇌입니다.\n정교한 메커니즘을 통해 연속으로 #{skill_color}#3##개의 화살을 발사합니다.\n\n#{skill_color}#방탄복을 관통할 수 있습니다.##",
				--GL40		
				["bm_w_gre_m79_sc_desc"] = "쿵 하고 펑.\n\n#{skill_color}#$BTN_GADGET## 키를 눌러 #{skill_color}#30##미터로 영점 조정된 리프 조준기로 전환합니다.",
				--3GL
				["bm_ms3gl_sc_desc"] = "단일 챔버에 중첩된 맞춤형 40mm 유탄을 발사합니다. 발사하기 위한 전기 뇌관을 사용하는 소형 패키지로, 신속한 후속 조치가 가능합니다.\n\n대체 발사는 #{skill_color}#유탄 3발을 발사합니다.##",
				--PIGLET/M32
				["bm_m32_sc_desc"] = "\"#{risk}#워 머신##\"이 되어, 아무리 사랑해도 이 6발 회전 유탄 발사기로부터 자신과 주변 사람들을 보호할 수 없다는 것을 적들에게 보여주세요.",
				--China Puff
				["bm_w_china_sc_desc"] = "\"진짜... 저질스런 동네야...!\"\n\n#{skill_color}#$BTN_GADGET## 키를 눌러 #{skill_color}#30##미터로 영점 조정된 리프 조준기로 전환합니다.",
				--COMMANDO 101/M202 FLASH
				["bm_ray_sc_desc"] = "4연발 #{heat_warm_color}#소이## 로켓 발사기를 이용해 \"#{risk}#그림 리퍼##\"가 되어 보세요.\n\n로켓은 화염 지대를 남기고, 이 무기로 폭발 피해를 가하면 터렛이 즉시 파괴됩니다.",
				
				
	})

	--[[ 
		WepNames Options
		1 = do nothing, use resmod default/in-universe names (i.e. Crosskill Operator, Bootleg)
		2 = same as 1, but no nicknames (i.e. Bootleg > SG 416c)
		3 = real names (i.e. SA 1911 Operator, HK 416c)
		4 = Vanilla names/use your own names
	]]
	if weapon_names then
		if weapon_names <= 2 then --Resmod names
			LocalizationManager:add_localized_strings({	

				--[[ PISTOLS ]]
					--Gecko Pistol
					["bm_w_maxim9"] = "Magnus 9",
					["bm_w_x_maxim9"] = "아킴보 Magnus 9",
					--Igor (APS)
					["bm_w_stech"] = "Igor Automatik",
					["bm_w_x_stech"] = "아킴보 Igor Automatik",
					--Chimano Compact
					["bm_wp_pis_g26"] = "Chimano 26 Compact",
					["bm_w_jowi"] = "아킴보 Chimano 26 Compact",
					--Glock 18c
					["bm_w_glock_18c"] = "Chimano 18C",
					["bm_w_x_g18c"] = "아킴보 Chimano 18C",
					--CZ 75
					["bm_w_czech"] = "CR 92",
					["bm_w_x_czech"] = "아킴보 CR 92",
					--PPK (Gruber)
					["bm_w_ppk"] = "Gruber Kurz",
					["bm_w_x_ppk"] = "아킴보 Gruber Kurze",
					--M13
					["bm_w_legacy"] = "M13",
					["bm_w_x_legacy"] = "아킴보 M13",	
					--Glock 17
					["bm_w_glock_17"] = "Chimano 88",
					["bm_w_x_g17"] = "아킴보 Chimano 88",
					--Bernetti 9
					["bm_w_b92fs"] = "Bernetti 92",
					["bm_w_x_b92fs"] = "아킴보 Bernetti 92",
					--White Streak
					["bm_w_pl14"] = "White Streak",
					["bm_w_x_pl14"] = "아킴보 White Streak",
					--Holt 9mm
					["bm_w_holt"] = "Holt 9",
					["bm_w_x_holt"] = "아킴보 Holt 9",
					--FMG-9
					["bm_w_fmg9"] = "Wasp DS-9",
					--93R
					["bm_w_beer"] = "Bernetti 93R",
					--Contractor Pistols 
					["bm_w_packrat"] = "Contractor M30L",
					["bm_w_x_packrat"] = "아킴보 Contractor M30L",
					--Breech (Luger) 
					["bm_w_breech"] = "Parabellum-08",
					--Chimano Custom
					["bm_w_g22c"] = "Chimano Custom",
					["bm_w_x_g22c"] = "아킴보 Chimano Custom",
					--Signature .40
					["bm_w_p226"] = "Signature .40",
					--LEO
					["bm_w_hs2000"] = "LEO-40",
					["bm_wp_hs2000_sl_long"] = "엘리트 슬라이드",
					--5/7 pistol
					["bm_w_lemming"] = "Acuto 5/7",
					--Baby Deagle--
					["bm_w_sparrow"] = "Sparrow 941",
					["bm_w_x_sparrow"] = "스파이크 & 비서스",
					--Crosskill
					["bm_w_colt_1911"] = "Crosskill Operator II",
					["bm_w_x_1911"] = "머스탱 & 섈리",
					["bm_wp_1911_m_big"] = "캐스킷 탄창",
					--Crosskill Chunky
					["bm_w_m1911"] = "Crosskill A1",
					["bm_w_x_m1911"] = "프라이스 & 맥티비시",
					--Crosskill Guard
					["bm_w_shrew"] = "Crosskill Guard",
					["bm_w_shrew_joshua"] = "어둠 속에서 반짝이는 빛",
					["bm_w_x_shrew"] = "배리 & 폴",
					--USP 
					["bm_w_usp"] = "Interceptor-45",
					["bm_w_x_usp"] = "아킴보 Interceptor-45",
					["bm_wp_usp_m_big"] = "캐스킷 탄창",
					["bm_wp_pis_usp_b_match"] = "프리맨 슬라이드",
					--Model 54 
					["bm_w_type54"] = "CC-33",
					["bm_w_x_type54"] = "아킴보 CC-33",
					--Broomstick--
					["bm_w_c96"] = "Broomstick",
					["bm_w_c96_dl44"] = "DL-44",
					["bm_wp_c96_nozzle"] = "블라스테크 DL-44 총구",
					--Sub2000
					["bm_w_sub2000"] = "Cavity .40",
					--Deagle
					["bm_w_deagle"] = "Deagle",
					["bm_w_x_deagle"] = "아킴보 Deagle",
					--Kahn .357
					["bm_w_korth"] = "Kahn .357",
					["bm_w_x_korth"] = "아킴보 Kahn .357",
					--Matever 2006m
					["bm_w_mateba"] = "Matever 9mm", --:^)
					["bm_wp_2006m_b_short"] = "타치코마 총열",
					["bm_wp_2006m_b_medium"] = "토구사 총열",
					["bm_wp_2006m_b_long"] = "쿠사나기 총열",
					["bm_w_x_2006m"] = "아킴보 Matevers",
					--Frenchman Model 87
					["bm_w_model3"] = "J&M Model 87",
					["bm_w_x_model3"] = "아킴보 Model 87",	
					--Raging bull
					["bm_w_raging_bull"] = "Bronco .44",
					["bm_w_x_rage"] = "아킴보 Bronco .44",
					--Castigo
					["bm_w_chinchilla"] = "Castigo .44",
					["bm_w_x_chinchilla"] = "아킴보 Castigo .44",
					--RUS-12
					["bm_w_rsh12"] = "RUS-12",
					--SAA/Peacemaker
					["bm_w_peacemaker"] = "Peacemaker .45LC",
					--CUSTOM PISTOLS
						--ZiP 22
						["bm_w_zip22"] = "Zippy 3000",
						--Px4
						["bm_w_px4"] = "Bernetti Hx4 Canaan",
						--Browning Hi-Power
						["bm_w_hpb"] = "Hi-Power",
						--Browning Hi-Power (Mira)
						--["bm_w_hpb"] = "Hi-Power",
						--Walther P99
						["bm_w_p99"] = "Lakner G99",
						--Derringer
						["bm_w_derringer"] = "Derringer",
						--Automag .44
						["bm_w_amt"] = "Automag .44",
						--Colt Detective
						["bm_w_coltds"] = "Crosskill Investigator",
						--SIG P320
						["bm_w_papa320"] = "M19",
						["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "32발 탄창",
				--[[ SMGs ]]
					--Kobus 90--
					["bm_w_p90"] = "Project-90",
					["bm_w_x_p90"] = "아킴보 Project-90",
					["bm_wp_p90_b_ninja"] = "난자 총열",
					["bm_wp_90_body_boxy"] = "옴니아 돌격용 개머리판",
					--Spec Ops
					["bm_w_mp7"] = "SpecOps-7",
					--Tec-9
					["bm_w_tec9"] = "T3K Urban",
					["bm_w_x_tec9"] = "아킴보 T3K Urbans",
					--Heather
					["bm_w_sr2"] = "Heather-2M",
					["bm_w_x_sr2"] = "아킴보 Heather-2M",
					--CMP
					["bm_w_mp9"] = "CMP-9",
					--Miyaka
					["bm_w_pm9"] = "Miyaka 9 Special",
					--Micro Uzi
					["bm_w_baka"] = "Micro Uzi",
					["bm_w_x_baka"] = "아킴보 Micro Uzi",
					--Cobra/Skorpion
					["bm_w_scorpion"] = "Cobra",
					["bm_w_x_scorpion"] = "아킴보 Cobras",
					["bm_wp_scorpion_m_extended"] = "듀얼 탄창",
					--Tatonka
					["bm_w_coal"] = "AK-19 Tatonka",
					--AK Gen
					["bm_w_vityaz"] = "AK-19-01 Tasunka",
					--Signature SMG
					["bm_w_shepheard"] = "FIK PC9",
					--Compact-5/MP5
					["bm_w_mp5"] = "Compact-5",	
					["bm_w_mp5sd"] = "Compact-5SD",	
					["bm_w_mp5k"] = "Compact-5K",
					["bm_w_mp5k_pdw"] = "Compact-5K PDW",
					["bm_w_x_mp5"] = "아킴보 Compact-5",
					["bm_wp_mp5_fg_mp5sd"] = "SPOOC 수직 손잡이",
					--Swedish K
					["bm_w_m45"] = "Swedish K",
					--Pachett/Sterling
					["bm_w_sterling"] = "Patchette L2A3",
					["bm_w_sterling_sd"] = "Patchette L34A1",
					["bm_w_sterling_pistol"] = "Patchette Mk. VII",
					["bm_w_sterling_e11"] = "E-11",
					["bm_wp_sterling_b_e11"] = "블라스테크 E-11 총열",
					--Uzi
					["bm_w_uzi"] = "Uzi",
					--Chicago Typewriter
					["bm_w_m1928"] = "Chicago Typewriter",
					--Mark 10
					["bm_w_mac10"] = "Mark 10",
					["bm_w_x_mac10"] = "아킴보 Mark 10",
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
						--LWRC
						["bm_w_fang45"] = "Fang 45",
						--Typhoon
						["bm_w_crysis3_typhoon"] = "CRYNET Typhoon",
						--KSP 45
						["bm_w_ksp45"] = "KSP 45",
						--LC10
						["bm_w_lc10"] = "LC10",
				--[[ MGs ]]
					--Bootleg/HK416c
					["bm_w_tecci"] = "Bootlegger",
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
					["bm_wp_par_b_short"] = "단축 총열",
					--Buzzsaw/Mg42
					["bm_w_mg42"] = "Buzzsaw-42",
					["bm_w_mg42_dlt19"] = "DLT-19",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "Versteckt-51B",
					--Microgun
					["bm_wp_wpn_fps_lmg_shuno_body_red"] = "붉은 몸체",
					--CUSTOM MGs
						["bm_w_sig_xm250"] = "FIK MG277",

				--[[ SHOTGUNS ]]
					--Grimm
					["bm_w_basset"] = "Grimm 12G",
					["bm_w_x_basset"] = "Brothers Grimm 12G",
					--Saiga
					["bm_w_saiga"] = "IZHMA 12G",
					--AA12
					["bm_w_aa12"] = "Steakout 12G",
					--Spas12
					["bm_w_spas12"] = "Predator 12G",
					--Benelli
					["bm_w_benelli"] = "M1014 12G",
					--Argos III
					["bm_w_ultima"] = "Argos III 12G",
					--Street Sweeper
					["bm_w_striker"] = "Street Sweeper 12G",
					--Goliath
					["bm_w_rota"] = "Goliath 12G",
					--VD-12
					["bm_w_sko12"] = "VD-12G",
					["bm_w_x_sko12"] = "아킴보 VD-12",
					--GSPS
					["bm_w_m37"] = "GSPS 12G",
					--Supernova
					["bm_w_supernova"] = "Deimos 12G",
					--Loco
					["bm_w_serbu"] = "Locomotive 12G",
					--Reinfeld 88
					["bm_w_m1897"] = "Repeater 1897 12G",
					--Mosconi 12g
					["bm_w_m590"] = "Mosconi Tactical 12G",
					--R870
					["bm_w_r870"] = "Reinfeld 880 12G",
					--KSG
					["bm_w_ksg"] = "Raven 12G",
					--Breaker 10g
					["bm_w_boot"] = "Breaker 10G",
					--Claire Angélique Florette du Bertrand
					["bm_w_coach"] = "Claire S/S 12G",
					--Mosconi
					["bm_w_huntsman"] = "Mosconi S/S 12G",
					--Judge
					["bm_w_judge"] = "The Judge .410",
					["bm_w_x_judge"] = "저지 & 주리", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
					--Joceline
					["bm_w_b682"] = "Joceline O/U 12G",	
					--Custom Shotguns
						--Doomstick
						["bm_w_quadbarrel"] = "Doomstick",
						--Widowmaker TX
						["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "확창 탄창",
						["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "점사 시스템",
				--[[ ARs ]]
					--S552
					["bm_w_s552"] = "Commando 552",
					--M733/AMCAR
					["bm_w_amcar"] = "AM-CAR",
					--G36
					["bm_w_g36"] = "JP-36KV",
					["bm_w_g36_k"] = "JP-36K",
					["bm_w_g36_c"] = "JP-36C",
					["bm_w_g36_v"] = "JP-36V",
					["bm_w_g36_long"] = "JP-36",
					--VHS/Lion's Roar
					["bm_w_vhs"] = "Lion's Roar",
					["bm_wp_vhs_b_sniper"] = "하이퍼 총열",
					["bm_wp_vhs_b_silenced"] = "배드 드라간 총열",
					--Olympic/Para
					["bm_w_olympic"] = "Para-23",
					["bm_w_x_olympic"] = "아킴보 Para-23",
					--TAR-21
					["bm_w_komodo"] = "Tempest-95", --it's modeled after the X95, not the 21
					--Famas
					["bm_w_famas"] = "Clarion 5.56",
					--M4/CAR-4
					["bm_w_m4"] = "CAR-4",
					["bm_w_m4_mk12"] = "CAR-12 SPR",
					["bm_w_m4_lr300"] = "TR-300",
					["bm_wp_upg_ass_m4_b_beowulf"] = "울프 총열",
					["bm_wp_upg_s_fixed"] = "CAR 고정 개머리판",
					--AK5
					["bm_w_ak5"] = "Ak 5",
					["bm_w_ak5b"] = "Ak 5B",
					["bm_w_ak5c"] = "Ak 5C",
					["bm_w_ak5_fnc"] = "VF Carabine",
					--Union 5.56
					["bm_w_corgi"] = "Union 5.56",
					["bm_wp_corgi_b_short"] = "MSG 총열",
					--UAR
					["bm_w_aug"] = "UAR A2",
					["bm_w_aug_a3"] = "UAR A3",
					["bm_w_aug_f90"] = "Raptor 90",
					["bm_wp_upg_b_hbar"] = "중총열",	
					--AK17
					["bm_w_ak12"] = "AK-17",
					--AK 5.45
					["bm_w_ak74"] = "AK 5.45",
					--CR 805
					["bm_w_hajk"] = "CR 805B",
					--AMR-16
					["bm_w_m16"] = "AMR-16",
					["bm_w_m16a1"] = "AMR-16A1",
					--Queen's Wrath
					["bm_w_l85a2"] = "Queen's Wrath",
					--AK 7.62
					["bm_w_akm"] = "AK 7.62",
					["bm_w_akm_gold"] = "황금 AK 7.62",
					["bm_wp_upg_ass_ak_b_zastava"] = "연장 총열",
					--KETCHUPKNOB--
					--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
					["bm_w_groza"] = "OB-14st Byk-1", --Hopefully less silly than its Ketchup name
					--"OB-14st" being an awful combo of "Oblast" (a word for region/zone/area, as well as literally having BLAST in the name) and the "14" in "OTs-14"
					--Although, a Russian word for "region/zone/area" followed up with a Polish word...
					--Eh, whatever
					--CHIKUBI
					["bm_w_tkb"] = "Rodion 3B",
					["bm_wp_tkb_m_bakelite"] = "시베리안 15x3 탄창",
					--Krinkov
					["bm_w_akmsu"] = "Krinkov",
					--Akimbo Krinkov
					["bm_w_x_akmsu"] = "아킴보 Krinkov",
					--CUSTOM ARs
						--QBZ-191
						["bm_w_pd3_qbz191"] = "Northwest B-9",
						--AN-94/92
						["bm_w_tilt"] = "KVK-99",
						--HK G36
						["bm_w_g36k"] = "JP36K",
						--SCAR-L
						["bm_w_scarl"] = "Eagle Light",
						--Valmet Rk.62
						["bm_w_rk62"] = "Velmer",
						--MW22 Honey Badger
						["bm_w_mcbravo"] = "Chimera",
						--AR-18
						["bm_w_ar18"] = "CAR-18",
						--FIK-22
						["bm_w_fik22"] = "FIK-22 TLR", --why does this use the in-universe Sig name?
				--[[ DMRs ]]
					--Little Friend
					["bm_w_contraband"] = "Bigger Friend 7.62",
					["bm_w_contraband_m16"] = "Little Friend 5.56",
					["bm_w_contraband_mpx"] = "옴니아 PC9 9mm",
					--FAL
					["bm_w_fal"] = "Falcon 58",
					["bm_w_fal_l1a1"] = "Falcon SLR",
					["bm_w_fal_sa58"] = "Falcon 58 OSW",
					["bm_w_fal_idf"] = "Falcon RMT",
					--ASS VAL
					["bm_w_asval"] = "Valkyria",
					--Galil
					["bm_w_galil"] = "Gecko 7.62",
					["bm_w_galil_galatz"] = "Gekkota 7.62",
					["bm_w_galil_mar"] = "Micro Gecko 7.62",
					["bm_w_galil_556"] = "Gecko 5.56",
					["bm_w_galil_mar_556"] = "Micro Gecko 5.56",
					--SCAR
					["bm_w_scar"] = "Eagle Heavy",
					["bm_w_scar_l"] = "Eagle Light",
					["bm_w_scar_hamr"] = "Eagle Hammer",
					--Galant--
					["bm_w_ching"] = "M1 Galant",
					--M308
					["bm_w_m14"] = "M308",
					--G3
					["bm_w_g3"] = "Gewehr-3",
					["bm_w_g3_sg1"] = "Gewehr-S1",
					["bm_w_g3_msg"] = "Gewehr-90",
					["bm_w_g3_psg"] = "Präzision Gewehr-1",
					["bm_w_g3_hk33"] = "SG-33",
					["bm_w_g3_hk33_fo3"] = "R91",
					["bm_wp_g3_b_sniper"] = "매크로 총열",
					["bm_wp_g3_b_short"] = "마이크로 총열",
					--KS12
					["bm_w_shak12"] = "KS-12 Urban",
					["bm_w_shak12_vks"] = "KSV-12 Urban",
					--HCAR
					["bm_w_hcar"] = "Akron HC",
					["bm_w_hcar_bar"] = "Akron HC",
					
					--Custom DMRs
						--MCX Spear
						["bm_w_mcx_spear"] = "FIK M7",
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
					["bm_wp_snp_msr_ns_suppressor"] = "바이퍼 소음기",	
					--R700
					["bm_w_r700"] = "Reinfeld Model 700",	
					--QBU88
					["bm_w_qbu88"] = "Káng Arms X1",
					--Winchester 1874
					["bm_w_winchester1874"] = "Repeater 1874", --"Repeater" is the stand-in/fake name for the IRL manufacturer "Winchester"; I know "Eaton" exists from OTWD
					--TTI(TTY)
					["bm_w_tti"] = "Tecci Tactical .308",
					--Icky Vicky
					["bm_w_victor"] = "SA North Star",
					--Scunt
					["bm_w_scout"] = "Pronghorn",
					--AWP
					["bm_w_awp"] = "AIM 900F", --Dunno why Overkill didn't use the naming method used for OTWD; the model itself even uses OTWD's method by directly referencing "AIM" on the receiver
					--WA2000
					["bm_w_wa2000"] = "Lebensauger",
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
					["bm_w_m95"] = "Thanatos 95",
					--Custom Snipers
						--Guerilla
						["bm_w_sgs"] = "Guerilla 542",	
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "HET-5 Red Fox",
						--AMR2
						["bm_w_amr2"] = "Northwest AM-2",
						--M107
						["bm_w_m107cq"] = "Thanatos 107",
						--M200
						["bm_w_m200"] = "TF 141",
						--Marlin 1894
						["bm_w_m1894"] = "Mare's Leg",
						--SPX Centerfire
						["bm_w_moss464spx"] = "Mosconi SPX",
						--Winchester 1894
						["bm_w_winchester1894"] = "Repeater 1894",
						--SVD
						["bm_w_svd"] = "SV7",
						["bm_wp_wpn_fps_snp_svd_pso"] = "SV7 조준경",
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
					["bm_wp_upg_ns_ass_smg_stubby"] = "짧은 소염기",
					--SIGHTS
					["bm_wpn_fps_upg_o_hamr"] = "트리고놈 SCRW 조준경",
			})
		end

		if weapon_names == 2 then --Resmod names (No nicknames)
			LocalizationManager:add_localized_strings({	

				["bm_w_pl14"] = "WS-14",
				["bm_w_x_pl14"] = "아킴보 WS-14",
				["bm_wp_pis_g26"] = "Chimano 26",
				["bm_w_jowi"] = "아킴보 Chimano 26",

				["bm_w_g22c"] = "Chimano 22C",
				["bm_w_x_g22c"] = "아킴보 Chimano 22C",
				["bm_w_x_sparrow"] = "아킴보 Sparrows",

				["bm_w_x_1911"] = "아킴보 Operator II",
				["bm_w_x_m1911"] = "아킴보 Crosskill A1",
				["bm_w_x_shrew"] = "아킴보 Crosskill Guard",

				["bm_w_schakal"] = "AMP 45",

				["bm_w_x_judge"] = "아킴보 Judge",

				["bm_w_l85a2"] = "L-95",
				["bm_w_contraband"] = "SG 417D GL",
				["bm_w_contraband_m16"] = "AMR-16 GL",
				["bm_w_contraband_mpx"] = "옴니아 PC9 GL",

				["bm_w_vhs"] = "HVH-2",
				["bm_w_scar"] = "VF-7S",
				["bm_w_scar_l"] = "VF-6M",
				["bm_w_scar_hamr"] = "VF-HAMR",
				["bm_w_scarl"] = "VF-6M",

				["bm_w_tecci"] = "SG 416C",
	
			})
		elseif weapon_names == 3 then --DMCWO Reelnames
			LocalizationManager:add_localized_strings({	

				--[[PISTOLS]]
					--5/7
					["bm_w_lemming"] = "FN Five-seveN",
					--Gecko Pistol
					["bm_w_maxim9"] = "SilencerCo Maxim 9",
					["bm_w_x_maxim9"] = "아킴보 Maxim 9",

					--Stryk 18
					["bm_w_glock_18c"] = "Glock 18C",
					["bm_w_x_g18c"] = "아킴보 Glock 18C",
					["bm_wp_g18c_co_comp_2"] = "SJC 보정기 9mm",
					--CZ
					["bm_w_czech"] = "CZ AccuShadow 2",
					["bm_w_x_czech"] = "아킴보 AccuShadow 2",

					--APS
					["bm_w_stech"] = "Stechkin APS",
					["bm_w_x_stech"] = "아킴보 Stechkin",
					--Gruber
					["bm_w_ppk"] = "Walther PPK/S",
					["bm_wp_pis_ppk_g_laser"] = "크림슨 트레이스 레이저 손잡이",
					["bm_wp_pis_ppk_b_long"] = "PPKS 슬라이드",
					--Chimano 88
					["bm_w_glock_17"] = "Glock 17",
					["bm_w_x_g17"] = "아킴보 Glock 17",
					--Glock 26
					["bm_wp_pis_g26"] = "Glock 26",
					["bm_w_jowi"] = "아킴보 Glock 26",
					["bm_wp_g26_body_salient"] = "스테플드 프레임",
					["bm_wp_g26_b_custom"] = "손질된 슬라이드",
					["bm_wp_g26_m_custom"] = "G26 스테폴드 탄창",
					--Luger
					["bm_w_breech"] = "Luger P08",
					--Bernetti 9
					["bm_w_b92fs"] = "Beretta 92FS",
					["bm_w_x_b92fs"] = "아킴보 92FS",
					["bm_wp_beretta_co_co1"] = "SGS 보정기", --Original name was a reference to the movie "The Professional"
					["bm_wp_beretta_co_co2"] = "콤프테이션 보정기", --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models 	were based off of airsoft counterparts
					["bm_wp_beretta_sl_brigadier"] = "브리가디어 엘리트 슬라이드",
					["bm_wp_beretta_g_ergo"] = "목재 인체공학 손잡이",
					["bm_wp_beretta_m_extended"] = "30탄 92FS 탄창",
					["bm_wp_beretta_g_engraved"] = "각인이 새겨진 92FS 손잡이",
					--PL14
					["bm_w_pl14"] = "Kalashnikov Concern PL-14 \"Lebedev\"",
					["bm_wp_pl14_m_extended"] = "17발 PL-14 탄창",
					["bm_wp_pl14_b_comp"] = "PL-14 보정기",
					--Wick
					["bm_w_packrat"] = "H&K P30L",
					["bm_w_x_packrat"] = "아킴보 P30L",
					--Hudson
					["bm_w_holt"] = "Hudson H9",
					["bm_w_x_holt"] = "아킴보 H9",
					--93R
					["bm_w_beer"] = "Beretta 93R",
					--M13
					["bm_w_legacy"] = "H&K P7M13",

					--LEO-40
					["bm_w_hs2000"] = "Springfield Armory XD(M)-40",
					["bm_wp_hs2000_m_extended"] = "22발 XD(M)-40 탄창",
					["bm_wp_hs2000_sl_custom"] = "보정된 슬라이드",
					["bm_wp_hs2000_sl_long"] = "커스텀 슬라이드",
					--Signature 40
					["bm_w_p226"] = "SIG P226R",
					["bm_w_x_p226"] = "아킴보 P226R",
					["bm_wp_p226_co_comp_2"] = "SJC 보정기 .40",
					["bm_wp_p226_m_extended"] = "22발 P226 탄창",
					["bm_wp_p226_b_equinox"] = "이쿼녹스 듀오톤 슬라이드",
					["bm_wp_p226_b_long"] = "손질된 연장 슬라이드",
					["bm_wp_p226_co_comp_2"] = "SJC 보정기 .40",
					--Chimano Custom
					["bm_w_g22c"] = "Glock 22C",
					["bm_w_x_g22c"] = "아킴보 Glock 22C",
					["bm_wp_g22c_b_long"] = "Glock 35 보정된 슬라이드",
					--Bang...
					["bm_w_sparrow"] = "IWI Jericho 941 RPL",
					["bm_w_x_sparrow"] = "아킴보 941",
					["bm_wp_sparrow_body_941"] = "IWI Jericho 941F 킷",
					["bm_wp_sparrow_g_cowboy"] = "가중 손잡이",
					["bm_wp_sparrow_g_cowboy_desc"] = "그 무게을 짊어지고 살아라.",
					
					--SUB2000
					["bm_w_sub2000"] = "Kel-Tec SUB-2000",
					["bm_sub2000_sc_desc"] = "지금까지 제작된 총 중 하나. 소형 권총탄은 긴 총열에서 나올 때 훨씬 더 강하고, 접이식 기능은 괜찮은 은폐력을 제공합니다.",
					["bm_wp_sub2000_fg_gen2"] = "Gen2 총열덮개",
					["bm_wp_sub2000_fg_railed"] = "레드 라이온 R6 총열덮개",
					["bm_wp_sub2000_fg_suppressed"] = "소음기가 장착된 쿼드 레일 총열덮개",
					--C96
					["bm_w_c96"] = "Mauser C96",
					["bm_w_c96_dl44"] = "블라스테크 DL-44",
					["bm_wp_c96_b_long"] = "카빈 총열",
					["bm_wp_c96_nozzle"] = "DL-44 총구",
					["bm_wp_c96_sight"] = "슈미트 & 벤더 1-8x24 PM 소트 닷",
					["bm_wp_c96_m_extended"] = "20발 C96 탄창",
					--Crosskill
					["bm_w_colt_1911"] = "Springfield Armory 1911 Operator",
					["bm_w_x_1911"] = "아킴보 1911 Operator",
					["bm_wp_1911_co_2"] = "TCII 보정기", --Not 100% but seems to be based off of it
					["bm_wp_1911_co_1"] = "Clark 헤비 보정기", --Not 100% but seems to be based off of it
					["bm_wp_1911_g_ergo"] = "파흐마이어 1911 손잡이",
					["bm_wp_1911_g_bling"] = "목재 손잡이",
					["bm_wp_1911_g_engraved"] = "각인이 새겨진 1911 손잡이",
					["bm_wp_1911_b_long"] = "보정된 연장 슬라이드",
					["bm_wp_1911_b_vented"] = "보정된 투톤 슬라이드",
					["bm_wp_1911_m_extended"] = "12발 SA 1911 탄창",
					--Crosskill Chunky
					["bm_w_m1911"] = "Colt 1911A1", --Not entirely but its the closest thing
					["bm_w_x_m1911"] = "아킴보 1911A1",
					--Crosskill Guard
					["bm_w_shrew"] = "Colt Defender",
					["bm_w_shrew_joshua"] = "어둠 속에서 반짝이는 빛",
					["bm_w_x_shrew"] = "아킴보 Defender",
					--Interceptor
					["bm_w_usp"] = "H&K USP Tactical",
					["bm_w_x_usp"] = "아킴보 USP Tactical",
					["bm_wp_usp_co_comp_2"] = "SJC 보정기 .45",
					["bm_wp_pis_usp_b_expert"] = "USP 엑퍼트 슬라이드",
					["bm_wp_pis_usp_b_match"] = "USP 매치 슬라이드",
					["bm_wp_pis_usp_m_extended"] = "20발 USP 탄창",
					--Anubis
					["bm_w_socom"] = "H&K Mk.23",
					["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "프로토타입 페이지 I LAM",
					["bm_w_x_socom"] = "아킴보 Mk.23",
					--TT-33	
					["bm_w_type54"] = "Tokarev TT-33",
					["bm_w_x_type54"] = "아킴보 TT-33",
					
					--Kahn .357
					["bm_w_korth"] = "Korth NXA",
					["bm_w_x_korth"] = "아킴보 Korth NXA",
					--Mateba
					["bm_w_mateba"] = "Mateba 2006M",
					["bm_wp_2006m_b_short"] = "타치코마 총열",
					["bm_wp_2006m_b_medium"] = "토구사 총열",
					["bm_wp_2006m_b_long"] = "쿠사나기 총열",
					["bm_w_x_2006m"] = "아킴보 2006M",
					--Frenchman Model 87
					["bm_w_model3"] = "S&W Model 3",	
					["bm_w_x_model3"] = "아킴보 Model 3",	
					--Castigo
					["bm_w_chinchilla"] = "S&W Model 29",
					["bm_w_x_chinchilla"] = "아킴보 Model 29",
					--Bronco
					["bm_w_raging_bull"] = "Taurus Raging Bull",
					["bm_w_x_rage"] = "아킴보 Raging Bull",
					["bm_wp_pis_rage_extra"] = "레이징 불 조준기 장착대",
					["bm_wp_rage_b_comp1"] = "S&W V-보정기",
					["bm_wp_rage_b_short"] = "스너브 노즈 총열",
					["bm_wp_rage_b_comp2"] = "S&W 총구 보정기",
					["bm_wp_rage_b_long"] = "연장 총열",
					--Deagle
					["bm_w_deagle"] = "MRI Desert Eagle Mark XIX", --"IS THAT A M16?"
					["bm_w_x_deagle"] = "아킴보 Desert Eagle",
					["bm_wp_deagle_co_short"] = "Desert Eagle 총구 소염기", --Original name was a reference to the 1990s film "La Femme Nikita" only for the gun's appearance in it, otherwise this is based on the real "DE50MB" Deagle muzzle brake
					["bm_wp_deagle_co_long"] = "맞춤형 총열 중량", --Attachment is a reference to the Boondock Saints
					["bm_wp_deagle_g_ergo"] = "파흐마이어 손잡이", --Doesn't exist but it's the same model from the 1911 but enlarged so w/e
					["bm_wp_deagle_g_bling"] = "펄 손잡이",
					["bm_wp_deagle_m_extended"] = "12발 Desert Eagle 탄창",
					["bm_wp_deagle_b_long"] = "10\" 연장 총열",
					--SAA
					["bm_w_peacemaker"] = "Colt Single Action Army", --Technically a Ruger New Vaquero but that's not as fun
					["bm_wp_peacemaker_barrel_long"] = "12\" 총열",
					["bm_wp_peacemaker_barrel_short"] = "4.62\" 총열",
					["bm_wp_peacemaker_handle_bling"] = "각인이 새겨진 SAA 손잡이",
					["bm_wp_peacemaker_rifle_stock"] = "뼈대 개머리판",
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
					["bm_w_x_p90"] = "아킴보 P90",
					["bm_p90_sc_desc"] = "A bullpup SMG and competitor to the MP7. Frequently commented on as looking like a futuristic space gun.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
					["bm_wp_p90_b_long"] = "PS90 총열",
					["bm_wp_p90_b_civilian"] = "모스 레커 슈라우드 총열",
					--MP7
					["bm_w_mp7"] = "H&K MP7A2", --PD2's version kinda existed before the real MP7A2 was a thing so there's still some MP7A1 bits on it but w/e
					["bm_mp7_sc_desc"] = "경량 기관단총이며 P90 기관단총의 경쟁 총기입니다. 몇가지 이유로 유탄 발사기가 장착되었다고 믿을 수 있겠지만 실제로는 없습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
					["bm_wp_mp7_b_suppressed"] = "B&T 로텍스-II 소음기",
					["bm_wp_mp7_s_long"] = "연장 개머리판",
					["bm_wp_mp7_m_extended"] = "MP7 40발 탄창",
					--CMP
					["bm_w_mp9"] = "B&T TP9SF",
					["bm_w_x_mp9"] = "아킴보 TP9SF",
					["bm_wp_mp9_m_extended"] = "30발 TP9 탄창",
					["bm_wp_mp9_s_skel"] = "슈타이어 TMP 고정 개머리판",
					["bm_wp_mp9_b_suppressed"] = "B&T MP9 QD 소음기",
					--Micro Uzi
					["bm_w_baka"] = "IWI Micro Uzi",
					["bm_w_x_baka"] = "아킴보 Micro Uzi",
					--T3K
					["bm_w_tec9"] = "Intratec TEC-9",
					["bm_wp_tec9_b_standard"] = "AB-10 총열",
					["bm_wp_tec9_ns_ext"] = "수도 연장 총열",
					["bm_wp_tec9_s_unfolded"] = "인터다이나믹 MP-9 와이어 개머리판",
					["bm_wp_tec9_m_extended"] = "50발 TEC-9 탄창",
					--Jacket's Piece
					["bm_w_cobray"] = "Cobray M11/9",
					["bm_wp_cobray_ns_barrelext"] = "MAC 연장 총열",
					--SR-2M
					["bm_w_sr2"] = "TsNIITochMash SR-2M \"Veresk\"",
					["bm_w_x_sr2"] = "아킴보 SR-2M",
					["bm_sr2_sc_desc"] = "특수한 9×21mm 탄을 사용하는 SR-2M 기관단총은 P90과 MP7 기관단총에 대한 러시아의 대답입니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가합니다.##",
					--Miyaka 9
					["bm_w_pm9"] = "Minebea PM-9",
					--FMG9
					["bm_w_fmg9"] = "Magpul FDC-9",
					["bm_wp_fmg9_grip_tape"] = "테이프 손잡이",
					["bm_wp_fmg9_stock_pad"] = "러버 개머리판 패드",

					--Cobra
					["bm_w_scorpion"] = "CZ vz. 61 Skorpion",
					["bm_w_x_scorpion"] = "아킴보 Skorpion",
					["bm_wp_scorpion_m_extended"] = "Skorpion 듀얼 탄창",
					["bm_wp_scorpion_b_suppressed"] = "Skorpion 소음기",
					--MP5
					["bm_w_mp5"] = "H&K MP5A2",
					["bm_w_mp5sd"] = "H&K MP5SD",	
					["bm_w_mp5k"] = "H&K MP5K",	
					["bm_w_mp5k_pdw"] = "H&K MP5K PDW",
					["bm_w_x_mp5"] = "아킴보 MP5A2",
					["bm_mp5_sc_desc"] = "G3의 여동생.\n발사 속도가 빠르고 정확하며 다루기 쉬운 기관단총에게 무엇을 더 바랄 수 있겠습니까?",
					["bm_wp_mp5_fg_m5k"] = "MP5k 삼중 레일 킷",
					["bm_wp_mp5_fg_mp5a5"] = "MP5 레일 총열덮개",
					["bm_wp_mp5_fg_mp5sd"] = "MP5SD 킷",
					["bm_wp_mp5_s_adjust"] = "H&K 수납형 개머리판",
					["bm_wp_mp5_s_ring"] = "개머리판 제거",
					["bm_wp_mp5_s_folding"] = "초이트 접철식 개머리판",
					["bm_wp_mp5_m_drum"] = "70발 MP5 드럼 탄창",
					["bm_wp_mp5_m_straight"] = "30발 MP5 40/10 탄창",
					--MPX
					["bm_w_shepheard"] = "SIG MPX", 
					--Vityaz
					["bm_w_vityaz"] = "Kalashnikov Concern PP-19 Vityaz-SN",
					--Bizon
					["bm_w_coal"] = "Kalashnikov Concern PP-19 Bizon-2",

					--Uzi
					["bm_w_uzi"] = "IWI Uzi",
					["bm_w_x_uzi"] = "아킴보 Uzi",
					["bm_wp_uzi_s_solid"] = "목재 개머리판",
					["bm_wp_uzi_fg_rail"] = "FAB 디펜스 Uzi 삼중 레일 시스템",
					["bm_wp_uzi_b_suppressed"] = "투 스테이지 소음기",
					--Pachette
					["bm_w_sterling"] = "Sterling L2A3",
					["bm_w_sterling_sd"] = "Sterling L34A1",
					["bm_w_sterling_pistol"] = "Sterling Mk. VII",
					["bm_w_sterling_e11"] = "블라스테크 E-11",
					["bm_wp_sterling_b_suppressed"] = "L34A1 총열",
					["bm_wp_sterling_b_e11"] = "블라스테크 E-11 총열",
					["bm_wp_sterling_m_short"] = "15발 탄창",
					["bm_wp_sterling_m_long"] = "34발 탄창",
					--
					["bm_w_mac10"] = "Ingram M10",
					["bm_w_x_mac10"] = "아킴보 M10",
					["bm_wp_mac10_m_extended"] = "30발 탄창",
					["bm_wp_mac10_body_ris"] = "MAC 레일 시스템", --I'm getting nothing but airsoft results so generic name
					["bm_wp_mac10_s_skel"] = "로우 마운트 스켈레톤 개머리판",
					--Thompson
					["bm_w_m1928"] = "Auto-Ordnance M1928",
					["bm_wp_m1928_b_short"] = "단축 총열",
					["bm_wp_m1928_fg_discrete"] = "폴리머 수직 손잡이",
					["bm_wp_m1928_g_discrete"] = "폴리머 권총 손잡이",
					["bm_wp_m1928_s_discrete"] = "폴리머 개머리판",
					--MP 40
					["bm_w_erma"] = "Erma MP 40",
					--UMP
					["bm_w_schakal"] = "H&K UMP-45",
					["bm_wp_schakal_b_civil"] = "USC 츙열",
					["bm_wp_schakal_ns_silencer"] = "젬테크 QD UMP 소음기",
					["bm_wp_schakal_m_short"] = "15발 탄창",
					["bm_wp_schakal_m_long"] = "45발 탄창",
					--M45
					["bm_w_m45"] = "Carl Gustaf Kpist M/45",
					["bm_wp_smg_m45_m_extended"] = "50발 M/45 탄창",
					--Vector
					["bm_w_polymer"] = "KRISS Vector SMG",
					["bm_wp_polymer_barrel_precision"] = "CRB 슈레이더 총열",
					["bm_wp_polymer_ns_silencer"] = "디파이언드 HPS 4GSK 소음기",
	
				--[[MGs]]
					--416C
					["bm_w_tecci"] = "H&K HK416-C",
					["bm_wp_tecci_b_long"] = "연장 총열",
					["bm_wp_tecci_ns_special"] = "JPE 리코일 일리미네이터 총구 소염기",
					--Shuno what it is
					["bm_w_shuno"] = "Empty Shell XM556 Microgun",

					--SAW
					["bm_w_m249"] = "FN M249 Para",
					["bm_wp_m249_fg_mk46"] = "Mk 46 총열덮개",
					["bm_wp_m249_s_solid"] = "M249 고정 개머리판",

					--ChainSAW
					["bm_w_kacchainsaw"] = "KAC ChainSAW",
					["bm_wp_kacchainsaw_barrel_short"] = "단축 총열",
					["bm_wp_kacchainsaw_barrel_long"] = "연장 총열",
					["bm_wp_kacchainsaw_mag_b"] = "100발 소프트 탄약통",
					["bm_wp_kacchainsaw_flamethrower"] = "언더베럴 화염방사기",
					["bm_wp_kacchainsaw_sling"] = "ChainSAW 슬링",

					--RPK
					["bm_w_rpk"] = "Kalashnikov Concern RPK",
					["bm_wp_rpk_fg_standard"] = "플리머 AK 총열덮개",
					["bm_wp_rpk_s_standard"] = "폴리머 RPK 개머리판",
					["bm_wp_rpk_m_ban_sc"] = "45발 몰롯 AK 탄창",

					--HK21
					["bm_w_hk21"] = "H&K HK21E",
					["bm_hk21_sc_desc"] = "G3의 큰 자매. 더욱 강력한 제압 능력을 위해 발사 속도가 증가했습니다.",
					["bm_wp_hk21_fg_short"] = "단축 HK21 총열덮개",
					["bm_wp_hk21_g_ergo"] = "HK21 인체공학 손잡이",
					--MG42
					["bm_w_mg42"] = "Mauser Maschinengewehr 42",
					["bm_w_mg42_dlt19"] = "블라스테크 DLT-19",
					["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 총열",
					["bm_wp_mg42_b_vg38"] = "블라스테크 DLT-19 총열",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "Vollmer HK51-B",
					["bm_hk51b_sc_desc"] = "HK21을 에프터마켓에서 개조하여 이 기관총의 크기를 MP5의 크기로 줄이고 발사 속도를 더욱 높였습니다.",
					["bm_wp_hk51b_fg_railed"] = "삼중 레일 총열덮개",
					["bm_wp_hk51b_b_fluted"] = "홈이 파인 연장 총열",

					--M240
					["bm_w_par"] = "FN M240B",
					["bm_par_sc_desc"] = "일반적으로 차량에 장착되는 M249의 더 무거운 형제 기관총입니다. 더 큰 총알을 위해 기동성을 희생합니다.",
				
					["bm_wp_par_s_plastic"] = "M240B 개머리판",
					--M60
					["bm_w_m60"] = "Saco M60",
					["bm_wp_m60_fg_tactical"] = "MK43 RIS 총열덮개",
					["bm_wp_m60_fg_tropical"] = "잎으로 감싼 총열덮개",
					["bm_wp_m60_fg_keymod"] = "키모드 총열덮개",

					--M134
					["bm_w_m134"] = "General Electric M134",
					["bm_wp_m134_barrel_extreme"] = "대공 총열",
					["bm_wp_m134_barrel_short"] = "단축 총열",
					--Custom MGs
						["bm_w_mx63"] = "KAC LAMG",

				--[[SHOTGUNS]]
					--Saiga
					["bm_w_basset"] = "Spike X1S Saiga",
					["bm_w_x_basset"] = "아킴보 Spike X1S Saiga",
					["bm_w_basset_m_extended"] = "10발 AGP 암즈 탄창",
					["bm_w_saiga"] = "Kalashnikov Concern Saiga-12K",
					["bm_wp_saiga_fg_lowerrail"] = "울티막 AK 모듈식 레일 포엔드 시스",
					["bm_wp_saiga_m_20rnd"] = "20발 MD 암즈 드럼탄창",
					["bm_wp_saiga_fg_holy"] = "퍼글리스틱 레일 시스템",
					--AA12
					["bm_w_aa12"] = "MPS Auto Assault-12 CQB",
					["bm_wp_aa12_barrel_long"] = "표준 총열",
					["bm_wp_aa12_mag_drum"] = "20발 드럼탄창",
					--Six12
					["bm_w_rota"] = "Crye Precision SIX12",
					--M1014
					["bm_w_benelli"] = "Benelli M4 Super 90",
					["bm_wp_ben_b_long"] = "연장 총열",
					["bm_wp_ben_b_short"] = "NFA 총열",
					["bm_wp_ben_s_collapsed"] = "개머리판 접기",
					["bm_wp_ben_fg_standard"] = "택티컬 개머리판",
					--SPAS-12
					["bm_w_spas12"] = "Franchi SPAS-12",
					["bm_wp_spas12_b_long"] = "8발 튜브",
					--Striker
					["bm_w_striker"] = "Sentinel Arms Striker",
					--VD-12
					["bm_w_sko12"] = "Standard Manufacturing SKO-12",
					--Argos III
					["bm_w_ultima"] = "Baikal MP-155 Ultima",

					--870
					["bm_w_r870"] = "Remington Model 870",
					["bm_wp_r870_m_extended"] = "2발 확장 튜브",
					["bm_wp_r870_fg_wood"] = "목재 펌프",
					["bm_wp_r870_s_folding"] = "개머리판 제거",
					["bm_wp_r870_s_folding_ext"] = "레밍턴 윙마스터 접이식 개머리판",
					["bm_wp_r870_s_folding"] = "레밍턴 윙마스터 개머리판 접히기",
					["bm_wp_r870_s_nostock_big"] = "전체 길이 레일이 있는 개머리판 제거",
					["bm_wp_r870_s_solid_big"] = "전체 길이 레일이 있는 고정 개머리판",
					--Loco
					["bm_w_serbu"] = "Short Remington Model 870",
					["bm_wp_shorty_m_extended_short"] = "1발 확장 튜브",
					["bm_wp_r870_s_solid"] = "고정 개머리판",
					["bm_wp_serbu_s_solid_short"] = "레일 있는 고정 개머리판",
					["bm_wp_serbu_s_nostock_short"] = "레일 있는 개머리판 제거",
					--KSG
					["bm_w_ksg"] = "Kel-Tec KSG",
					["bm_wp_ksg_b_long"] = "2개의 8발 튜브가 있는 연장 총열",
					["bm_wp_ksg_b_short"] = "2개의 6발 튜브가 있는 패트롤 총열",
					--Judge
					["bm_w_judge"] = "Taurus 4510PLYFS",
					["bm_w_x_judge"] = "아킴보 Judge",
					--M37
					["bm_w_m37"] = "Ithaca Model 37",
					--NO SHOTGUNS IN THE TRENCHES
					["bm_w_m1897"] = "Winchester Model 1897",
					--M590
					["bm_w_m590"] = "Mossberg 590",
					["bm_wp_m590_body_rail"] = "블랙 에이스 택티컬 쿼드 레일",
					--Supernova
					["bm_w_supernova"] = "Benelli Supernova",
					["bm_wp_supernova_g_adapter"] = "베넬리 AR-15 개머리판 어댑터",
					["bm_wp_supernova_g_raven"] = "ATI 레이븐 손잡이",
					["bm_wp_supernova_g_stakeout"] = "디킨슨 XX3 손잡이",
					["bm_wp_supernova_s_collapsed"] = "개머리판 접기",
					["bm_wp_supernova_s_Raven"] = "ATI 레이븐 개머리판",

					--Mosconi
					["bm_w_huntsman"] = "Mosconi Coach Gun",
					["bm_wp_huntsman_b_short"] = "소드 오프 총열",
					["bm_wp_huntsman_s_short"] = "소드 오프 개머리판",
					--725
					["bm_w_b682"] = "Beretta 682", --funni hybrid 682, naming it after its internal name anyways
					["bm_wp_b682_b_short"] = "소드 오프 총열",
					["bm_wp_b682_s_short"] = "소드 오프 개머리판",
					["bm_wp_b682_s_ammopouch"] = "탄약 주머니",
					--1887
					["bm_w_boot"] = "Winchester Model 1887",
					["bm_wp_boot_body_exotic"] = "경화 케이스 1887 리시버",
					--Claire 12G
					["bm_w_coach"] = "Remington Model 1889",

				--[[ARs]]
					--FAMAS
					["bm_w_famas"] = "Nexter FAMAS F1",
					["bm_wp_famas_b_sniper"] = "G2 저격용 총열",
					["bm_wp_famas_b_short"] = "G2 코만도 총열",
					["bm_wp_famas_g_retro"] = "G1 권총 손잡이",
					--VHS
					["bm_w_vhs"] = "HS Produkt VHS-2",
					["bm_wp_vhs_b_short"] = "단축 총열",
					["bm_wp_vhs_b_sniper"] = "저격용 총열",
					["bm_wp_vhs_b_silenced"] = "소음 총열",
					--JP36
					["bm_w_g36"] = "H&K G36KV",
					["bm_w_g36_k"] = "H&K G36K",
					["bm_w_g36_c"] = "H&K G36C",
					["bm_w_g36_v"] = "H&K G36V",
					["bm_w_g36_long"] = "H&K G36",
					["bm_wp_g36_fg_c"] = "G36C 총열덮개",
					["bm_wp_g36_fg_ksk"] = "나이츠 암머먼트 RAS 총열덮개",
					["bm_wp_g36_s_kv"] = "G36KV 개머리판",
					["bm_wp_g36_s_sl8"] = "SL8 개머리판",
					--S552
					["bm_w_s552"] = "SIG SG 552-2",
					["bm_wp_ass_s552_fg_standard_green"] = "OD 그린 총열덮개",
					["bm_wp_ass_s552_g_standard_green"] = "OD 그린 권총 손잡이",
					["bm_wp_ass_s552_s_standard_green"] = "OD 그린 개머리판",
					["bm_wp_ass_s552_fg_railed"] = "SIG 레일 총열덮개",
					["bm_wp_ass_s552_body_standard_black"] = "블랙 리시버",
					--AMCAR
					["bm_w_amcar"] = "Colt M733 Commando",
					--BABBY AR
					["bm_w_olympic"] = "Olympic Arms K23B",
					["bm_w_x_olympic"] = "아킴보 K23B",

					--AUG
					["bm_w_aug"] = "Steyr AUG A2",
					["bm_w_aug_a3"] = "Steyr AUG A3",
					["bm_w_aug_f90"] = "Thales F90",
					["bm_wp_aug_fg_a3"] = "A3 레일",
					["bm_wp_aug_body_f90"] = "Thales F90 킷",
					--Boatgun
					["bm_w_corgi"] = "FN F2000 Tactical TR",
					--AK12
					["bm_w_ak12"] = "Kalashnikov Concern AK-12",
					--Ak5
					["bm_w_ak5"] = "Bofors Ak 5",
					["bm_w_ak5b"] = "Bofors Ak 5B",
					["bm_w_ak5c"] = "Bofors Ak 5C",
					["bm_w_ak5_fnc"] = "FN FNC",
					["bm_wp_ak5_fg_ak5c"] = "Ak 5C 총열덮개",
					["bm_wp_ak5_fg_fnc"] = "FN FNC 총열덮개",
					["bm_wp_ak5_s_ak5b"] = "Ak 5B 개머리판",
					["bm_wp_ak5_s_ak5c"] = "Ak 5C 개머리판",
					--CAR-4
					["bm_w_m4"] = "Colt M4A1",
					["bm_w_m4_mk12"] = "Mk 12 SPR",
					["bm_w_m4_lr300"] = "ZM LR-300",
					--AK74
					["bm_w_ak74"] = "Kalashnikov Concern AKS-74",
					--805
					["bm_w_hajk"] = "CZ 805 BREN",
					["bm_wp_hajk_b_short"] = "A2 총열",
					--TAR-21
					["bm_w_komodo"] = "IWI X95",
					--OICW
					["bm_w_osipr"] = "XM29 OICW",

					--M16
					["bm_w_m16"] = "Colt M16A4",
					["bm_w_m16a1"] = "Colt M16A1",
					["bm_wp_m16_fg_railed"] = "다니엘 디펜스 라이트 레일",
					["bm_wp_m16_fg_vietnam"] = "M16A1 총열덮개",
					--["bm_wp_m16_s_solid"] = "M16 개머리판",
					--L85
					["bm_w_l85a2"] = "BAE L85A2",
					["bm_wp_l85a2_b_long"] = "연장 총열",
					["bm_wp_l85a2_b_short"] = "단축 총열",
					["bm_wp_l85a2_g_worn"] = "테이프를 붙인 권총 손잡이",
					["bm_wp_l85a2_fg_short"] = "다니엘 디펜스 라이트 레일",
					--Krink
					["bm_w_akmsu"] = "AKMSU",
					["bm_w_x_akmsu"] = "아킴보 AKMSU",
					["bm_wp_akmsu_fg_rail"] = "삼손 K-레일",
					--AKM
					["bm_w_akm"] = "Kalashnikov Concern AKMS",
					["bm_w_akm_gold"] = "금으로 도금된 AKMS",
					--Nipples
					["bm_w_tkb"] = "Tula Arms TKB-059",
					--Groza
					["bm_w_groza"] = "TsKIB SOO Groza-1",
					--Custom Rifles
						["bm_w_fik22"] = "Ruger 10/22",


				--[[DMRs]]
					--417
					["bm_w_contraband"] = "M203 유탄 발사기를 단 H&K HK417",
					["bm_w_contraband_m16"] = "M203 유탄 발사기를 단 Colt M16A1",
					["bm_w_contraband_mpx"] = "M203 유탄 발사기를 단 SIG MPX",
					["bm_m203_weapon_sc_desc_pc"] = "스카페이스의 개인용 \"Little Friend\"이자 M16의 큰 언니.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##\n#{skill_color}#$BTN_BIPOD## 키를 늘러 하부에 장착된 유탄 발사기로 전환합니다.",
					["bm_m203_weapon_sc_desc"] = "스카페이스의 개인용 \"Little Friend\"이자 M16의 큰 언니.\n\n#{skill_color}#방탄복을 관통하여 피해의 25%를 가합니다.##\n#{skill_color}#$BTN_BIPOD## 키를 꾹 늘러 유탄 발사기로 전환합니다.",
						--VMP
						["bm_m203_vmp_sc_desc_pc"] = "스카페이스의 개인용 \"Little Friend\" M16의 복제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 늘러 하부에  장착된 유탄 발사기로 전환합니다.",
						["bm_m203_vmp_sc_desc"] = "스카페이스의 개인용 \"Little Friend\" M16의 복제품입니다.\n\n#{skill_color}#$BTN_BIPOD## 키를 꾹 늘러 유탄 발사기로 전환합니다.",
				
					--SCAR
					["bm_w_scar"] = "FN Mk.17",
					["bm_w_scar_l"] = "FN Mk.16",
					["bm_w_scar_hamr"] = "FN HAMR",
					["bm_wp_scar_fg_railext"] = "PWS SCAR 확장 레일",
					["bm_wp_scar_s_sniper"] = "Mk.20 개머리판",
					--FAL
					["bm_w_fal"] = "FN FAL",
					["bm_w_fal_l1a1"] = "FAL L1A1",
					["bm_w_fal_sa58"] = "DSA SA58 OSW",
					["bm_w_fal_idf"] = "IWI Romat",
					["bm_wp_fal_body_standard"] = "DSA SA58 총열덮개",
					["bm_wp_fal_fg_wood"] = "목재 FAL 총열덮개",
					["bm_wp_fal_fg_04"] = "DSA 프리플롯 총열덮개",
					["bm_wp_fal_fg_03"] = "IWI Romat 총열덮개",
					["bm_wp_fal_g_01"] = "탭코 FAL 권총 손잡이",
					["bm_wp_fal_m_01"] = "20발 FAL 탄창",
					["bm_wp_fal_s_01"] = "접이식 FAL 개머리판",
					["bm_wp_fal_s_03"] = "맥풀 FAL PRS 개머리판",
					["bm_wp_upg_vintage_fal_sc"] = "20발 탄창",
					--Galil
					["bm_w_galil"] = "IWI Galil ARM",
					["bm_w_galil_galatz"] = "IWI Galatz",
					["bm_w_galil_mar"] = "IWI Micro Galil",
					["bm_w_galil_556"] = "IWI Galil ARM",
					["bm_w_galil_mar_556"] = "IWI Micro Galil",
					["bm_wp_galil_fg_sniper"] = "IWI Galatz 개머리판",
					["bm_wp_galil_fg_sar"] = "IWI Galil SAR 개머리판",
					["bm_wp_galil_fg_mar"] = "IWI Galil MAR 개머리판",
					["bm_wp_galil_fg_fab"] = "FAB 디펜스 VFR GA 개머리판",
					["bm_wp_galil_g_sniper"] = "IWI Galatz 권총 손잡이",
					["bm_wp_galil_s_sniper"] = "IWI Galatz 목재 개머리판",
					["bm_wp_galil_s_skeletal"] = "IWI Galil MAR 개머리판",
					["bm_wp_galil_s_light"] = "IWI Galatz 스켈레톤 개머리판",
					["bm_wp_galil_s_fab"] = "FAB 디펜스 MG-CP 칙패드",
					--AS VAL
					["bm_w_asval"] = "Tula Arms AS \"Val\"",
					["bm_wp_asval_b_proto"] = "프로토타입 총열",
					["bm_wp_asval_s_solid"] = "VSS 개머리판",

					--Raifu
					["bm_w_g3"] = "H&K G3A3",
					["bm_w_g3_hk33"] = "H&K HK33",
					["bm_w_g3_sg1"] = "H&K G3SG1",
					["bm_w_g3_msg"] = "H&K MSG90",
					["bm_w_g3_psg"] = "H&K PSG-1",
					["bm_w_g3_fo3"] = "R91",
					["bm_g3_sc_desc"] = "MP5 및 HK21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##",
					["bm_g3_ap25_sc_desc"] = "MP5 및 HK21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복을 관통하여 피해의 75%를 가하고 적을 관통할 수 있습니다.##",	
					["bm_g3_sg1_sc_desc"] = "MP5 및 HK21의 언니 역할을 하는 이 소총의 명중률은 저격소총의 명중률과 맞먹습니다.\n\n#{skill_color}#방탄복, 다수의 적, 최대 대미지 사거리 내에 있는 방패 그리고 얇은 벽을 관통할 수 있습니다.##",
					["bm_wp_g3_b_short"] = "단축 총열",
					["bm_wp_g3_b_sniper"] = "PSG-1 총열",
					["bm_wp_g3_fg_psg"] = "PSG-1 개머리판",
					["bm_wp_g3_fg_railed"] = "FAB 디펜스 G3-RS 개머리판",
					["bm_wp_g3_fg_retro"] = "목재 슬림라인 개머리판",
					["bm_wp_g3_fg_retro_plastic"] = "슬림라인 개머리판",
					["bm_wp_g3_g_retro"] = "G3 인체공학 손잡이",
					["bm_wp_g3_g_sniper"] = "PSG-1 목재 권총 손잡이",
					["bm_wp_g3_s_sniper"] = "PSG-1 개머리판",
					--M308
					["bm_w_m14"] = "Springfield Armory M14 DMR",
					["bm_wp_m14_body_ebr"] = "사지 EBR 몸체",
					["bm_wp_m14_body_jae"] = "JAE 100 G3 개머리판",
					["bm_wp_upg_o_m14_scopemount"] = "선 옵틱스 USA M14/M1A 조준기 장착대",
					--Shak12
					["bm_w_shak12"] = "Kalashnikov Concern ShAK-12",
					--HCAR
					["bm_w_hcar"] = "Ohio Ordnance HCAR",
					["bm_w_hcar_bar"] = "Browning BAR",
					--GARAND
					["bm_w_ching"] = "Springfield Armory M1 Garand",
					["bm_wp_ching_fg_railed"] = "아메가 미니 스카웃 마운트",
					--Custom DMRs
						--G3 HK79
						["bm_g3hk79_sc_desc_pc"] = "#{skill_color}#총열하부 유탄 발사기##가 장착된 G3의 변형입니다. 또한 #{skill_color}#방탄복을 관통하여 피해의 50%를 가하며, 적을 관통할 수 있습니다.##\n\n#{skill_color}#$BTN_BIPOD## 키를 눌러 유탄 발사기로 전환합니다.",

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
					["bm_wp_winchester_b_long"] = "연장 총열",
					["bm_wp_winchester_b_suppressed"] = "소음기",
					--MSR
					["bm_w_msr"] = "Remington MSR",
					["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD 소음기",
					["bm_wp_msr_body_msr"] = "MSR 알루미늄 개머리판과 리시버",
					--Scunt
					["bm_w_scout"] = "Steyr Scout",
					--AWP
					["bm_w_awp"] = "Accuracy International AW-F",
					["bm_wp_awp_stock_lightweight"] = "AT308 개머리판",

					--Drako
					["bm_w_siltstone"] = "Kalashnikov Concern SVD",
					--WA2000
					["bm_w_wa2000"] = "Walther WA2000",
					["bm_wp_wa2000_g_walnut"] = "월넛 몸체",
					["bm_wp_wa2000_g_stealth"] = "블랙 몸체",
					["bm_wp_wa2000_g_light"] = "경량 몸체",

					--SBL
					["bm_w_sbl"] = "Marlin Model 1895SBL",
					--G2
					["bm_w_contender"] = "Thompson Center G2 Contender",
					["bm_wp_contender_grip_m4"] = "초이트 M4 어뎁터 손잡이",
					--Moist Nugget
					["bm_w_mosin"] = "Mosin Nagant M91/30",
					["bm_wp_mosin_b_sniper"] = "Nagant 소음기",
					["bm_wp_mosin_body_conceal"] = "블랙 폴리머 개머리판",
					--Model 70
					["bm_w_model70"] = "Winchester Model 70",
					--R93
					["bm_w_r93"] = "Blaser R93 Tactical 2",
					["bm_wp_r93_b_suppressed"] = "SilencerCo Harvester 338 소음기",
					["bm_wp_r93_body_wood"] = "롱 레인지 스포터 2 개머리판",
					--SRS
					["bm_w_desertfox"] = "DTA Stealth Recon Scout",
					--Flintlock
					["bm_w_bessy"] = "Land Pattern Musket",

					--M95
					["bm_w_m95"] = "Barrett M95",
					["bm_wp_m95_b_barrel_long"] = "AW50F 소염기가 장착된 연장 총열",
					--Custom Snipers
						--Guerilla
						["bm_w_sgs"] = "SIG 542",
						--AMR2
						["bm_w_amr2"] = "CSI AMR-2",
						--M200
						["bm_w_m200"] = "Cheytac M200",
						--Marlin 1894
						["bm_w_m1894"] = "Marlin 1894",
						--SPX Centerfire
						["bm_w_moss464spx"] = "Mossberg SPX Centerfire",
						--Winchester 1894
						["bm_w_winchester1894"] = "Winchester 1894",
						--SVD
						["bm_w_svd"] = "Kalashnikov Concern SVD",
						--L115
						["bm_w_l115"] = "Accuracy International L115",
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "SERO Gepard M6",
						--M107
						["bm_w_m107cq"] = "Barrett M107CQ",
						["bm_m107cq_sc_desc"] = "M95가 빠르지 않았다면, M107는 원하는 것을 붉은 안개 형태로 제공할 것입니다.\n\n#{skill_color}#다수의 적, 방탄복, 방패, 타이탄 방패 그리고 얇은 벽을 관통할 수 있습니다.##",

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
					["bm_wp_elastic_body_tactic"] = "호이트 이그나이트 라이저",

				--Attachments

					--Gadgets
						["bm_wp_upg_fl_pis_tlr1"] = "스트림라이트 TLR-1 손전등",
						["bm_wp_upg_fl_pis_laser"] = "에임 스포츠 LH002 레이저 조준기", 
						["bm_wp_upg_fl_x400v"] = "슈어파이어 X400V-IRC 레이저 조준기",
						["bm_wp_upg_fl_crimson"] = "크림슨 트레이스 CMR-201 레이저 조준기",
						["bm_wp_upg_fl_pis_m3x"] = "인사이트 테크놀로지 M3X 손전등",
						["bm_wp_upg_fl_pis_perst"] = "제니트코 Perst-4M 레이저 조준기",

						["bm_wp_upg_fl_ass_smg_sho_surefire"] = "슈어파이어 정찰용 손전등",
						["bm_wp_upg_fl_ass_laser"] = "오프셋 마운트 레이저 사이트",
						["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "인사이트 테크놀로지 AN/PEQ-5 레이저 사이트",
						["bm_wp_upg_fl_ass_utg"] = "UTG P38 레이저 라이트",
						["bm_wp_upg_fl_ass_peq15"] = "인사이트 테크놀로지 AN/PEQ-15 레이저 사이트",
						["bm_wp_upg_fl_dbal_laser"] = "슈타이너 DBAL-PL 레이저 사이트",

					--Muzzle Devices
						["bm_wp_upg_ns_meatgrinder"] = "스탠드오프 소염기",
						["bm_wp_upg_ns_typhoon"] = "오메가 디펜스 소염기", --Internal name implies it's the Beretta TYPHOON but it resembles Omega Defense's more.
						["bm_wp_upg_pis_ns_flash"] = "CCF 티타늄 플래시 소음기",

						["bm_wp_upg_ns_pis_small"] = "톰슨 머신 포세이돈 소음기",
						["bm_wp_upg_ns_pis_medium"] = "젬테크 SFN 소음기", --Close enough... it's sectioned similarly enough for me to just name it this
						["bm_wp_upg_ns_pis_large"] = "SilencerCo 오스프리 소음기",
						["bm_wp_upg_ns_medium_gem"] = "젬테크 블랙사이드 소음기",
						["bm_wp_upg_ns_large_kac"] = "KAC MK.23 소음기",
						["bm_wp_upg_ns_pis_jungle"] = "FX-HND 소음기",
						["bm_wp_upg_ns_pis_putnik"] = "RS 퍼트닉 소음기",
						["bm_wp_upg_ns_ass_filter"] = "오일 필터",

						["bm_wp_upg_ns_ass_smg_small"] = "젬테크 HALO 소음기", --not 100% but I can't find any other 소음기 that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
						["bm_wp_upg_ns_ass_smg_medium"] = "스몰 암즈 인더스트리스 M80 소음기",
						["bm_wp_upg_ns_ass_smg_large"] = "GOV MOD 1 소음기", --Couldn't find an IRL equivalent, name is just what it says on the tin, literally
						["bm_wp_upg_ak_ns_tgp"] = "TGP-A 소음기",
						["bm_wp_victor_ns_omega"] = "SilencerCo 오메가 36M 소음기",
						["bm_wp_kacchainsaw_suppressor"] = "KAC QDSS NT4 소음기",
	
						["bm_wp_ultima_ns_comp"] = "하이테크 하우저70 소염기",
						["bm_wp_upg_ns_shot_shark"] = "트로믹스 샤크 브리칭 소염기",
						["bm_wp_upg_shot_ns_king"] = "킹 아머리 KA-1212 브리칭 소염기",
						["bm_wp_upg_ns_shot_thick"] = "산탄총용 소음기",
						["bm_wp_upg_ns_sho_salvo_large"] = "SilencerCo 살보 12 소음기",

						["bm_wp_upg_ns_ass_smg_stubby"] = "VFC BM4 소염기", --airsoft part AFAIK, lol (VFC Baby M4)
						["bm_wp_upg_ns_ass_smg_tank"] = "G&P BM 보정기", --airsoft part AFAIK, lol (G&P Baby Monster) also the little "sight" post on it is actually for an AR15 gas tube, lmao
						["bm_wp_upg_ns_ass_smg_firepig"] = "노베스케 KX3 보정기",
						["bm_wp_upg_ass_ns_jprifles"] = "JPE 베니 쿨리 소염기",
						["bm_wp_upg_ass_ns_linear"] = "KIES 블라스트 마스터 리니어 보정기",
						["bm_wp_upg_ass_ns_surefire"] = "슈어파이어 MBK 소염기",
						["bm_wp_ns_battle"] = "배틀콤프 2.0 보정기",
						["bm_wp_ak_upg_ns_zenitco"] = "제니트코 DTK-1 보정기",
						["bm_wp_upg_ns_ass_smg_v6"] = "Kel-Tec V6 보정기",
						["bm_wp_kacchainsaw_muzzle"] = "KAC QDC MAMS 소염기",
						["bm_wp_hk51b_ns_jcomp"] = "JCOMP Gen2 보정기",
						["bm_wp_awp_ns_muzzle"] = "애큐러시 인터내셔널 소염기",


					--Glock Parts
						["bm_wp_g18c_m_mag_33rnd"] = "확장 글록 탄창",
						["bm_wp_g18c_g_ergo"] = "호그 핸달 소매 손잡이",
						["bm_wp_pis_g_laser"] = "크림슨 트레이서 레이저 손잡이",
						["bm_wp_pis_g_beavertail"] = "비버테일 확장 손잡이",

					--AK parts
						["bm_wp_upg_ak_fg_krebs"] = "크렙스 UFM 키모드 시스템 개머리판",
						["bm_wp_upg_ak_fg_trax"] = "스트라이크 인더스트리스 TRAX 개머리판",
						["bm_wp_upg_ak_g_rk3"] = "제니트코 PK-3 권총 손잡이",
						["bm_wp_upg_ak_fg_zenit"] = "제니트코 개머리판",
						["bm_wp_upg_o_ak_scopemount"] = "K-VAR KV-04S 광학 조준기 장착대",
						["bm_wp_upg_ak_m_uspalm"] = "30발 US PALM AK30 탄창",
						["bm_wp_upg_ns_ass_pbs1"] = "PBS-1 소음기",
						["bm_wp_upg_ass_ak_b_zastava"] = "자스타바 M76 총열",
						["bm_wp_upg_ak_b_draco"] = "드라코 피스톨 총열",
						["bm_wp_upg_ak_b_ak105"] = "AK-105 총열",
						["bm_wp_upg_ak_ns_jmac"] = "JMac 커스텀스 MTC-1",
						["bm_wp_upg_ak_m_quad"] = "60발 KC 탄창",
						["bm_wp_ak_m_drum"] = "75발 AK 드럼 탄창",
						["bm_wp_ak_fg_combo2"] = "울티막 AK 광학 조준기 장착대",
						["bm_wp_ak_fg_combo3"] = "울티막 AK 모듈식 레일 포렌드 시스템",
						["bm_wp_upg_ak_fg_tapco"] = "탭코 인트라퓨즈 총열 덮개",
						["bm_wp_upg_fg_midwest"] = "미드웨스트 인더스트리스 쿼드 레일",
						["bm_wp_upg_ak_g_hgrip"] = "호그 오버몰디드 AK 권총 손잡이",
						["bm_wp_upg_ak_g_pgrip"] = "US PALM 인헨스드 권총 손잡이",
						["bm_wp_ak_s_folding"] = "언더폴딩 AK 개머리판",
						["bm_wp_ak_s_skfoldable"] = "사이드폴딩 AK 개머리판",
						["bm_wp_ak_s_psl"] = "PSL 썸홀 개머리판",
						["bm_wp_ak_upper_zenitco"] = "제니트코 B-33 먼지 덮개",
						["bm_wp_ak_upg_fg_zenitco"] = "제니트코 Sport-1 킷",
						["bm_wp_ak_upg_dh_zenitco"] = "제니트코 RP-5 차지 핸들",
						["wpn_fps_upg_ak_g_gradus"] = "FAB 디펜스 그라두스 인체공학 손잡이",
						["wpn_fps_upg_ak_g_edg"] = "질감 있는 에볼루션 디펜스 손잡이",
						["wpn_fps_upg_ak_g_rk9"] = "제니트코 RK-9 Grip",
						["bm_wp_ak_upg_s_zenitco"] = "제니트코 PT-1 텔레스코픽 개머리판",

					--Sights
						["bm_wp_upg_o_marksmansight_rear_desc"] = "조정 가능한 메프로라이트 트루닷 조준기 세트",
						["bm_wp_upg_o_rmr"] = "트리지콘 RMR 반사식 조준기",
	
						["bm_wp_upg_o_docter"] = "닥터 사이트 II 플러스가 장착된 아이언닷 반사식 조준기",
						["bm_wp_upg_o_reflex"] = "반사식 조준기반사식 조준기",
						["bm_wp_upg_o_cmore"] = "C-More 레일웨이 반사식 조준기",
						["bm_wp_upg_o_rx01"] = "트리지콘 RX01 반사식 조준기",
						["bm_wp_upg_o_rx30"] = "트리지콘 RX30 반사식 조준기",	
	
						["bm_wp_upg_o_cs"] = "에임포인트 CS 레드 닷 조준기",
						["bm_wp_upg_o_aimpoint"] = "에임포인트 프로 레드 닷 조준기",
						["bm_wp_upg_o_t1micro"] = "에임포인트 마이크로 T-1 레드 닷 조준기",
						["bm_wp_upg_o_tf90"] = "테크 포스 TF90 레드 닷 조준기",
	
						["bm_wp_upg_o_fc1"] = "DI 옵티컬 FC1 프리마직 레드 닷 조준기",
						["bm_wp_upg_o_eotech"] = "이오텍 553 홀로그램 조준기",
						["bm_wp_upg_o_eotech_xps"] = "이오텍 EXPS3 홀로그램 조준기",
						["bm_wp_upg_o_uh"] = "AMG UH-1 홀로그램 조준기",
	
						["bm_wp_upg_o_specter"] = "ELCAN 스펙터 DR 1-4배율 조준경",
						["bm_wp_upg_o_acog"] = "트리지콘 ACOG 조준경",
						["bm_wp_upg_o_poe"] = "벨로모 PO4x24P 조준경",
						["bm_wp_upg_o_bmg"] = "트리지콘 6x48 조준경",

						["bm_wp_upg_o_spot"] = "거리 측정기가 장착된 엔씨스타 ADO 3x42 스코프",

						["bm_wp_upg_o_atibal"] = "마이크로 반사식 조준기가 장착된 아티발 MROC 3x32 조준경",
						["bm_wpn_fps_upg_o_hamr"] = "레오폴드 Mk. 4 HAMR 4x24 조준경",

						["bm_wp_upg_o_northtac"] = "마이크로 반사식 조준기가 장착된 노스테크 어썰트 1-4x28 조준기",
						["bm_wp_uupg_o_schmidt"] = "슈미트 & 벤더 5-45x56 PM II 하이 파워",
	
						--"Schmidt & Bender 1-8x24 PM Short Dot"
						["bm_wp_upg_o_shortdot"] = "슈미트 & 벤더 1-8x24 PM Short Dot",
						["bm_wp_upg_o_shortdot_dmc"] = "슈미트 & 벤더 1-8x24 PM Short Dot",
						["bm_wp_upg_o_leupold"] = "BORS가 장착된 레오폴드 마크 4 LR/T M1",
						["bm_wp_upg_o_box"] = "펄서 디지사이트 LRF N960 NV 조준경",
	
						["bm_wpn_fps_upg_o_45iron"] = "XS 사이트 각진 조준기",
						["bm_wpn_fps_upg_o_45rds"] = "레오폴드 델타포인트 프로 각진 RDS",
						["bm_wpn_fps_upg_o_45rds_v2"] = "에임포인트 Micro T-1 레드 닷 조준기",
	
						["bm_wpn_fps_upg_o_xpsg33_magnifier"] = "에임포인트 3XMag 확대경",
						["bm_wpn_fps_upg_o_sig"] = "SIG Juliet3 확대경",
	
						["bm_wp_upg_o_mbus_rear"] = "맥풀 MBUS 보조 조준기",

					--Vertical Grips
						["bm_wp_upg_vg_tac"] = "나이츠 암머먼트 VFG",
						["bm_wp_upg_vg_stubby"] = "탱고 다운 QD 단축형 VFG",
						["bm_wp_upg_vg_afg"] = "맥풀 AFG 2",

					--STANAG compatible mags
						["bm_wp_upg_vintage_sc"] = "20발 STANAG 탄창",
						["bm_wp_m4_m_pmag"] = "30발 맥풀 PMAG GEN1 탄창",
						["bm_wp_l85a2_m_emag"] = "30발 맥풀 EMAG 탄창",
						["bm_wp_upg_m4_m_quad"] = "60발 SureFire 탄창",
						["bm_wp_m4_m_drum"] = "100발 베타-C 이중 드럼 탄창",
						["bm_wp_upg_m4_m_l5"] = "30발 렌서 시스템스 L5 AW 탄창",
						["bm_wp_m4_uupg_m_strike"] = "33발 스트라이크 인터스트리 탄창",
						["bm_wp_m4_m_quick"] = "맥풀 탄창 어시스트",

					--AR15 parts
						["bm_wp_m4_uupg_b_sd"] = "소음 총열",
						["bm_wp_upg_ass_m4_b_beowulf"] = "중형 총열",

						["bm_wp_m4_upper_reciever_edge"] = "VLTOR 상부 리시버",
						["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "2A-Arm BALIOS 상부 리시버",
						["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 상부 리시버",
						["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 하부 리시버",
						["bm_wp_m4_upper_radian"] = "라디안 모델 1 상부 리시버",
						["bm_wp_m4_lower_radian"] = "라디안 A-DAC 15 하부 리시버",

						["bm_wp_m4_uupg_fg_radian"] = "라디안 모델 1 총열 덮개",
						["bm_wp_upg_fg_jp"] = "JPE 모듈식 총열덮개",
						["bm_wp_m4_uupg_fg_lr300"] = "LR300 총열 덮개",
						["bm_wp_upg_fg_smr"] = "가이셀 슈퍼 모튤식 레일",
						["bm_wp_upg_smg_olympic_fg_lr300"] = "단축 LR300 총열 덮개",
						["bm_wp_upg_ass_m16_fg_stag"] = "스태그 암즈 모델 8T 총열 덮개",
						["bm_wp_upg_ass_m4_fg_moe"] = "맥풀 MOE SL 총열 덮개",
						["bm_wp_upg_ass_m4_fg_lvoa"] = "워 스포트 LVOA 총열 덮개",

						["bm_wp_m4_s_standard"] = "부시마스터 LE 개머리판",
						["bm_wp_m4_s_pts"] = "맥풀 PTS 개머리판",
						["bm_wp_m4_uupg_s_fold"] = "LR300 접이식 개머리판",
						["bm_wp_upg_m4_s_crane"] = "NSWC 크레인 개머리판",
						["bm_wp_upg_m4_s_mk46"] = "칙 패드가 장착된 NSWC 크레인 개머리판",
						["bm_wp_upg_m4_s_ubr"] = "맥풀 UBR 개머리판",
						["bm_wp_tti_s_vltor"] = "VLTOR E-MOD 개머리판",
						["bm_wp_victor_s_mod0"] = "BCM MOD 0 개머리판",
						["bm_wp_sko12_개머리판"] = "스탠다드 Mfg AR 개머리판",
						["bm_wp_m4_uupg_s_zulu"] = "오딘 워크스 줄루2.0 개머리판",
						["bm_wp_olympic_s_short"] = "락 리버 암스 권총 버퍼 튜브",

						["bm_wp_m4_g_ergo"] = "커맨드 암스 UPG16 권총 손잡이",
						["bm_wp_m4_g_sniper"] = "PSG 스타일 권총 손잡이",
						["bm_wp_upg_m4_g_hgrip"] = "호우지 러버 인체공학 손잡이",
						["bm_wp_upg_m4_g_mgrip"] = "맥풀 MOE-K 권총 손잡이",
						["bm_wp_tti_g_grippy"] = "호우지 오버몰드 손잡이",
						["bm_wp_victor_g_mod3"] = "BCM MOD 3 손잡이",
						["bm_wp_sko12_grip"] = "스탠다드 Mfg AR 손잡이",
						["bm_wp_upg_g_m4_surgeon"] = "택티컬 다이나믹스 뼈대형 권총 손잡이",
						["bm_wp_m4_g_billet"] = "JL 빌릿 AR 손잡이",

					["bm_wp_upg_lmg_lionbipod"] = "양각대",

				--[[MELEE]]
					["bm_melee_kabar"] = "USMC KA-BAR",
					["bm_melee_kampfmesser"] = "KM 2000",
					["bm_melee_gerber"] = "거버 DMF 폴더",
					["bm_melee_tomahawk"] = "거버 다운레인지 토마호크",
					["bm_melee_becker"] = "KA-BAR 베커 택 도구",
					["bm_melee_baton"] = "ASP 프릭션 록 경찰봉",
					["bm_melee_shovel"] = "K.L.A.S.",
					["bm_melee_baseballbat"] = "\"루실\"",
					["bm_melee_bayonet"] = "AKM 타입 II 총검",
					["bm_melee_bullseye"] = "스미스 앤 웨슨 불스아이 손도끼",
					["bm_melee_x46"] = "롭슨 나이프 X46 다용도 생존 칼",
					["bm_melee_dingdong"] = "거버 딩 동 진입용 도구",
					["bm_melee_cleaver"] = "중식도",
					["bm_melee_kabar_tanto"] = "KA-BAR 탄토",
					["bm_melee_chef"] = "요리사 칼",
					["bm_melee_fairbair"] = "페어베언-사이크스 결투용 칼",
					["bm_melee_model24"] = "모델 24 스틸한드그라네이트",
					["bm_melee_hammer"] = "자켓의 망치",
					["bm_melee_meat_cleaver"] = "드라간의 중식도",
					["bm_melee_poker"] = "파이어우드 포커",
					["bm_melee_tenderizer"] = "고기 다지개",
					["bm_melee_fork"] = "BBQ 포크",
					["bm_melee_mining_pick"] = "곡괭이",
					["bm_melee_bowie"] = "보위 나이프",
					["bm_melee_branding_iron"] = "브랜딩 아이언",
					["bm_melee_oldbaton"] = "야경봉",
					["bm_melee_detector"] = "가렛 휴대용 금속 탐지기",
					["bm_melee_taser"] = "ZAP 스턴 경찰봉",
					["bm_melee_cqc"] = "쿠나이",
					["bm_melee_twins"] = "사이스",
					["bm_melee_tiger"] = "테코-가기",
					["bm_melee_pugio"] = "엑스트라마 레시오 푸지오 SE",
					["bm_melee_gator"] = "거버 게이터 마체테 프로",
					["bm_melee_scoutknife"] = "모라크니프 클래식 스카우트 39",
					["bm_melee_shawn"] = "엔티스 양가위",
					["bm_melee_stick"] = "양치기 크룩",
					["bm_melee_nin"] = "파슬로데 IM90i 네일건",
					["bm_melee_ballistic"] = "발리스틱 나이프",
					["bm_melee_wing"] = "벤치메이드 모델 42 발리송",
					["bm_melee_cs"] = "홈라이트 슈퍼 2 전기톱",
					["bm_melee_brick"] = "모토로라 다이나택 8000X",
					["bm_melee_sword"] = "연필",
					["bm_melee_oxide"] = "UVSR 타이가-1",
					["bm_melee_selfie"] = "확장 폴라프로 파워폴리 고프로",
					["bm_melee_twins"] = "슈레이드 쌍차",

				--[[THROWABLES]]
					["bm_grenade_frag"] = "M67 파편 수류탄",
					["bm_grenade_frag_com"] = "M67 파편 수류탄 - OVERKILL 모델",
					["bm_wpn_prj_hur"] = "킷 레이 에어코브라 투척용 도끼",
					["bm_wpn_prj_target"] = "블레이징 애로우 닌자 투척용 단검",
			})
		end
	end	

		local twirl = math.rand(1)
		local shalashaska = 0.06
		if Month == "4" and Day == "1" then
			shalashaska = 1
		end
		if bobcat or not easterless and twirl <= shalashaska then
			LocalizationManager:add_localized_strings({	
				["bm_w_peacemaker"] = "리볼버 오셀롯",
				["bm_w_peacemaker_desc"] = "리볼버 오셀롯",
				["bm_ap_weapon_peacemaker_sc_desc"] = "리볼버 오셀롯",
				["bm_wp_peacemaker_barrel_long"] = "리볼버 오셀롯",
				["bm_wp_peacemaker_barrel_short"] = "리볼버 오셀롯",
				["bm_wp_peacemaker_handle_bling"] = "리볼버 오셀롯",
				["bm_wp_peacemaker_rifle_stock"] = "리볼버 오셀롯",
				["bm_menu_ro_barrel"] = "리볼버 오셀롯",
				["bm_menu_ro_stock"] = "리볼버 오셀롯",
				["bm_menu_ro_modifier"] = "리볼버 오셀롯",
				["bm_menu_ro_charm"] = "리볼버 오셀롯",
				["bm_menu_ro_grip"] = "리볼버 오셀롯",
	
				["bm_m134_sc_desc"] = "CRYPTIC METAPHOR...",
				["bm_wp_upg_suppressor_boss"] = "\"게 싸움이다!!!\"\n\n무기의 소리를 #{skill_color}#조용하게 만들고## #{risk}#적이 당신의 조준을 회피할 가능성을 줄여줍니다.##"

			})
		end

		local cute = math.rand(1)
		local funny = 0.02
		if Month == "4" and Day == "1" then
			funny = 1
		end
		if eggplant or not easterless and cute <= funny then
			LocalizationManager:add_localized_strings({	
			--It's an "Upotte!!" reference
			--SEISHOU ACADEMY
				--MIDDLE SCHOOLERS
					["bm_w_m16"] = "Ichiroku",
					["bm_w_m16a1"] = "Ichiroku",
						["bm_m16_sc_desc"] = "\"I won't lose!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nThe energetic and foul-mouthed figurehead of the school.",
					["bm_w_m4"] = "Em-Four",
					["bm_w_m4_mk12"] = "Em-Four",
					["bm_w_m4_lr300"] = "Em-Four",
						["bm_m4_sc_desc"] = "\"Don't underestimate a service rifle!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nVice-president of the middleschool student council.",
					["bm_w_aug"] = "AUG",
					["bm_w_aug_a3"] = "AUG",
					["bm_w_aug_f90"] = "AUG",
						["bm_aug_sc_desc"] = "#{stats_negative}#\"RUN AWAY! PLEAD FOR YOUR LIFE!\"##\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nPresident of the middleschool student council.",
					["bm_wp_ak5_fg_fnc"] = "Funco Kit",
						["bm_wp_ak5_fg_fnc_desc"] = "\"To respond to its master's wishes is a tool's joy.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nGives off a heavy \"main protagonist\" aura.",
					["bm_w_s552"] = "Shigu",
						["bm_s552_sc_desc"] = "\"Next shot, I'll take your ear off, bitch.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nAn honor student from a wealthy family who excels in both sports and studies.",
					["bm_w_l85a2"] = "Eru",
						["bm_l85a2_sc_desc"] = "\"...\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nShy and clumsy, she has an unreliable nature and the habit of breaking a lot.",
					["bm_w_rk62"] = "Sako",
						["bm_rk62_sc_desc"] = "\"#{stat_maxed}#What wonderful squeals!## You sound like you're about to #{stats_negative}#die!##\"\n\nA transfer student attending #{stats_positive}#Seishou Academy.##\nAn elf-eared sadist with a drive to be the \"alpha\" of any school she attends. Desires Funco.",
	
				--HIGH SCHOOLERS
					["bm_w_fal"] = "Faru",
					["bm_w_fal_l1a1"] = "Faru",
					["bm_w_fal_sa58"] = "Faru",
					["bm_w_fal_idf"] = "Faru",
						["bm_fal_sc_desc"] = "\"Your big sis arrived-!\"\n\nFunco's older sister.\nNot to be confused with Funco's other sister, L1A1.",
						["bm_fal_ap25_sc_desc"] = "\"Your big sis arrived-!\"\n\nFunco's older sister.\nNot to be confused with Funco's other sister, L1A1.",
					["bm_w_m14"] = "Ichiyon",
						["bm_m14_sc_desc"] = "\"What are those westerners doin' copying AKs!? Buncha traitors!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nEasy-going and chalk-full of puns. Currently going through a fashion-sense crisis.",
					["bm_w_g3"] = "Jiisuri",
					["bm_w_g3_sg1"] = "Jiisuri",
					["bm_w_g3_msg"] = "Jiisuri",
					["bm_w_g3_psg"] = "Jiisuri",
					["bm_w_g3_hk33"] = "HK33",
					["bm_w_g3_hk33_fo3"] = "R91",
						["bm_g3_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
						["bm_g3_ap25_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
						["bm_g3_sg1_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
						["bm_wp_wpn_fps_ass_g3_body_hk33"] = "HK33 \"Chuusuri\" Set",
						["bm_wp_wpn_fps_ass_g3_body_hk33_desc"] = "\"Call me that again, I dare you!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nDespite HK33's haugty attitude, she's been lovingly nicknamed \"Chuusuri\" by her peers, much to her chagrin.",
						["bm_menu_jiisuri_stock"] = "Pantyhose",

				--ELEMENTARY
					["bm_w_mp5"] = "Empi",
					["bm_w_mp5sd"] = "MP5SD",	
					["bm_w_mp5k"] = "MP5K",	
					["bm_w_mp5k_pdw"] = "MP5K",
						["bm_mp5_sc_desc"] = "\"If that's your hobby...\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nOne of Jiisuri's many younger siblings and the student council president of the elementary division.",
					["bm_w_schakal"] = "UMP",
						["bm_schakal_sc_desc"] = "An elementary schooler attending #{stats_positive}#Seishou Academy.##\nCousin to the G3 family; she's currently living together with them as she attends school. She often gets into fights with MP5K.",
					["bm_w_uzi"] = "Uzi",
						["bm_uzi_sc_desc"] = "\"Eat this!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nThe former self-declared leader of the elementary division, pushed out of the position by Empi when she arrived.",
					["bm_w_mac10"] = "Ram",
						["bm_mac10_sc_desc"] = "\"INGRAM!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nA machinegun with words. Also rather top-heavy.",
		
				--FACULTY
					["bm_w_erma"] = "Erma-sensei",
						["bm_erma_sc_desc"] = "\"Come in! Come in!\"\n\nAn elementary school dorm mom working at #{stats_positive}#Seishou Academy.##\nThe SMGs love her.",
					["bm_w_m1928"] = "Thompson-sensei",
						["bm_m1928_sc_desc"] = "\"It's common sense!\"\n\nAn elementary school teacher working at #{stats_positive}#Seishou Academy.##\nSpeaks with accented Japanese. A former member of the FBI.",
					["bm_w_ching"] = "Garand",
						["bm_galant_sc_desc"] = "\"ARE YOU TRYING TO PULL ONE OVER ON ME!?\"\n\nA drill instructor working at #{stats_positive}#Seishou Academy.##\nLooks over the middleschoolers.",
	
			--RED STEEL ACADEMY
				--THREE STRIPES
					["bm_w_siltstone"] = "Drako",
						["bm_siltstone_sc_desc"] = "\"Не поймите неправильно...\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nCalm, collected and speaks exclusively in Russian.", --sorry about the Google/MS translate
					["bm_w_akm"] = "AKM",
						["bm_akm_sc_desc"] = "\"DON'T FUCK WITH ME!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, menacing girl with the ears and tail of a fox. One of the few students capable of decieving AK47.",
					--["bm_w_rpk"] = "RPK",
						["bm_rpk_sc_desc"] = "\"This is why men are such pigs!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, blonde girl with the ears and tail of a Siberian Tiger. Gets sniped frequently.",
				--TWO STRIPES
					["bm_w_ak74"] = "Nanayon",
						["bm_ak74_sc_desc"] = "\"If it's the Major's orders, anything goes-\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nA beautiful girl with not only the ears and tail of a fox but the cunning nature to match.",
					["bm_w_saiga"] = "Saiga-chan",
						["bm_saiga_sc_desc"] = "\"All of you are like mice in a trap, nya!\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nHaughty, overconfident, and expressive, Saiga is a loud and boisterous auto-shotgun.",
				--ONE STRIPE
					["bm_w_coal"] = "Bizon",
						["bm_coal_sc_desc"] = "\"You can count on me-!\"\n\nA one-stripe student attending #{stats_negative}#Red Steel Academy.##\nReally looks up to her seniors, quite literally, but takes special care when addressing SVD.",
				--FACULTY
					["bm_w_mosin"] = "Mosin Nagant",
						["bm_mosin_sc_desc"] = "\"To the self-reflection room it is...\"\n\nA faculty member of #{stats_negative}#Red Steel Academy.##\nThe absolute Tsarista born of the Russian Empire. An old friend of Thomspon-sensei.",
			
			--ENOSHIMA
				--MIDDLE SCHOOLERS
					["bm_w_spas12"] = "Supasu",
						["bm_spas12_sc_desc"] = "\"Idiot! You're completely exposed!\"\n\nA middleschooler attending a public school in Enoshima.",
					["bm_w_benelli"] = "Beneri M4",
						["bm_benelli_sc_desc"] = "\"There's a limit to not being able to read the mood!\"\n\nA middleschooler attending a public school in Enoshima.",
			})
		end
		if my_wife then
			LocalizationManager:add_localized_strings({	
				["bm_w_g3"] = "Jiisuri",
				["bm_w_g3_sg1"] = "Jiisuri",
				["bm_w_g3_msg"] = "Jiisuri",
				["bm_w_g3_psg"] = "Jiisuri",
				["bm_w_g3_hk33"] = "HK33",
				["bm_w_g3_hk33_fo3"] = "R91",
					["bm_g3_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
					["bm_g3_ap25_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
					["bm_menu_jiisuri_개머리판"] = "Pantyhose",
			})
		end
	
		local big = math.rand(1)
		local pistol = 0.02
		if Month == "4" and Day == "1" then
			pistol = 1
		end
		if shitpost or not easterless and big <= pistol then
			LocalizationManager:add_localized_strings({	
				["bm_w_huntsman"] = "버블 데럴",
				["bm_w_deagle"] = "큰 권총",
				["bm_w_m16"] = weapon_names == 2 and "그거 파마스임?" or "그거 클라리온임?",
				["bm_m16_sc_desc"] = "I'll give you a clip so you can do some damage",
				["bm_w_x_type54"] = weapon_names == 2 and "쌍둥이 콜트" or "쌍둥이 크로스킬",
				["bm_akmsu_sc_desc"] = "#{stat_maxed}#큰 남자##를 쓰러뜨리는 데 유용한 작은 소총입니다. 이 소총은 거의 모든 상황에서 자체 성능을 발휘할 수 있으므로 과소평가해서는 안 됩니다.",
			})
		end

		local blizzard = math.rand(1)
		local tornado = 0.02
		if Month == "4" and Day == "1" then
			tornado = 1
		end
		if not easterless and blizzard <= tornado then
			LocalizationManager:add_localized_strings({	
				["menu_pattern_scale_small"] = "저스티스",
				["menu_pattern_scale_medium"] = "프리미엄",
				["menu_pattern_scale_large"] = "트루",
			})
		end
	
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
			["hud_assault_assault"] = "ИДЁТ ШТУРМ НАЁМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЁMHИKOB"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "겨차 타겨어대에 도이입 주웅",
			["hud_assault_cover"] = "어페무에 머무... 살덩이...",
			["hud_assault_alpha"] = "겨차 타겨어격"
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
			["hud_assault_assault"] = "머키워터 작전 진행 중",
			["hud_assault_alpha"] = "머키워터 작전"
		})
	end)	
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater
	local lapd = tweak_data.levels.ai_groups.lapd
	local mex = tweak_data.levels.ai_groups.federales
	local akan = tweak_data.levels.ai_groups.russia
	local nypd = tweak_data.levels.ai_groups.nypd
	local fbi = tweak_data.levels.ai_groups.fbi
	local breins = tweak_data.levels.ai_groups.zombie

	Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat", function(loc)
		loc:load_localization_file(ModPath .. "lua/sc/loc/hoplibkillfeedcompat_ko.json")
	end)

	if ai_type == murkywetew then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_murkywetew", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/murkywetew_ko.json")
		end)
	elseif ai_type == lapd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_lapd", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/lapd_ko.json")
		end)
	elseif ai_type == mex then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_mex", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/mex_ko.json")
		end)
	elseif ai_type == akan then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_akan", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/akan_ko.json")
		end)
	elseif ai_type == nypd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_nypd", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/nypd_ko.json")
		end)
	elseif ai_type == fbi then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_fbi", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/fbi_ko.json")
		end)
	elseif ai_type == breins then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_breins", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/breins_ko.json")
		end)
	end
 end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "프로 잡",
		["menu_one_down"] = "프로 잡",
		["menu_es_pro_job_bonus"] = "프로 잡",
		
		["menu_pro_warning"] = "이 작업은 프로 잡입니다! 실패할 경우, 재시작을 할 수 없고, 전체 계약이 파기됩니다.\n또한 하이스트가 끝날 무렵 더 강력한 적들이 배치되는 탈출 차량 출발 이벤트가 발생할 수도 있습니다.\n프로 잡을 완료하면 25%의 돈과 경험치 보너스를 받을 수 있습니다.",

		["menu_asset_lock_additional_assets_pro"] = "프로 잡에서는 사용이 불가능합니다!",

		["cn_menu_contract_daypay_header"] = "일일 보상:",
		["cn_menu_contract_jobpay_header"] = "작업 보수:",
		["victory_stage_cash_summary_name_job"] = "계약 일당에 대해 $stage_cash를 받았으며 작업을 완료한 보상으로 $job_cash를 추가로 받았습니다.",

		["debug_interact_grenade_crate_take_grenades"] = "$BTN_INTERACT 키를 길게 눌러 투척무기 보충하기",
		["debug_interact_bodybags_bag_take_bodybag"] = "$BTN_INTERACT 키를 길게 눌러 시체 가방과 케이블 타이 보충하기",

		["menu_equipment_armor_kit"] = "투척물 가방",
		["bm_equipment_armor_kit"] = "투척물 가방",
		["debug_equipment_armor_kit"] = "투척물 가방",
		["bm_equipment_armor_kit_desc"] = "투척물 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 투척 무기를 보충할 수 있습니다.\n\n투척물 가방은 #{skill_color}#3##번만 사용할 수 있으며, 가방을 보고 얼마나 많은 투척물이 남았는지 짐작할 수 있습니다.\n\n투척물 가방은 일반적으로 군인이나 용병이 상황이 위급할 때를 대비해 특수 무기를 휴대하기 위해 사용하는 은페용 가방입니다.\n\n#{important_1}#주의: 재생 또는 대기 시간 기반의 투척 무기는 보충할 수 업습니다.##",
		["bm_equipment_armor_kit_desc_short"] = "투척물 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 투척 무기를 보충할 수 있습니다.\n\n투척물 가방은 #{skill_color}#3##번만 사용할 수 있으며, 가방을 보고 얼마나 많은 투척물이 남았는지 짐작할 수 있습니다.\n\n#{important_1}#주의: 재생 또는 쿨다운 기반의 투척물은 사용할 수 없습니다.##",
		--Ordnance Bag
		["bm_equipment_grenade_crate_desc"] = "군장 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 총 탄약량의 ##25%##만큼 보충하고 투척 무기를 ##1##개를 보충할 수 있습니다.\n\n군장 가방은 #{skill_color}#4##번만 사용할 수 있으며, 군장 가방의 모습으로 얼마나 더 사용할 수 있는지 알 수 있습니다.\n\n군장 가방은 전투원이 폭발물 및 기타 투척물을 전투지역으로 운반할 때 사용하는 휴대용 가방입니다.\n\n#{important_1}#주의: 재생 또는 대기 시간 기반의 투척 무기는 보충할 수 업습니다.##",
		["bm_equipment_grenade_crate_desc_short"] = "군장 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 총 탄약량의 ##25%##만큼 보충하고 투척 무기를 ##1##개를 보충할 수 있습니다.\n\n군장 가방은 #{skill_color}#4##번만 사용할 수 있으며, 군장 가방의 모습으로 얼마나 더 사용할 수 있는지 알 수 있습니다.\n\n#{important_1}#주의: 재생 또는 대기 시간 기반의 투척 무기는 보충할 수 업습니다.##",
		--Trip Mine
		["bm_equipment_trip_mine_desc"] = "트립 마인을 사용하라면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 격발용 레이저는 #{skill_color}#$BTN_INTERACT## 키를 눌러 폭발 모드와 센서 모드로 설정을 변경할 수 있습니다.\n\n성형작약탄을 사용하려면, #{skill_color}#$BTN_INTERACT.## 키를 길게 눌러 설치하여야 합니다. 필요한 수만큼 설치하면 몇 초 뒤에 폭발합니다.\n\n트립 마인 주로 레이저를 지나는 적에게 피해를 주거나 처치하는 함정으로 사용합니다. 성형작약탄은 주로 문이나 금고를 터트리는 데 사용합니다. 둘 다 대부분의 전투 상황에서 유용한 장비로 사용될 수 있습니다.",
		["bm_equipment_trip_mine_desc_short"] = "트립 마인을 사용하라면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치하여야 합니다. 격발용 레이저는 #{skill_color}#$BTN_INTERACT## 키를 눌러 폭발 모드와 센서 모드로 설정을 변경할 수 있습니다.\n\n성형작약탄을 사용하려면, #{skill_color}#$BTN_INTERACT.## 키를 길게 눌러 설치하여야 합니다. 필요한 수만큼 설치하면 몇 초 뒤에 폭발합니다.",
		--Ammo Bag
		["bm_equipment_ammo_bag_desc"] = "탄약 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 탄약을 보충할 수 있습니다.\n\n탄약 가방은 당신의 무기 중 하나의 탄약을 #{skill_color}#$deployable_uses##번까지 완전히 보충할 수 있게 해주며, 가방을 들여다보면 얼마나 남았는지 알 수 있습니다.\n\n탄약 가방은 원래 군인들이 전투에 참여할 때 추가 탄약을 챙길 수 있도록 만든 휴대용 가방입니다.",
		["bm_equipment_ammo_bag_desc_short"] = "탄약 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 탄약을 보충할 수 있습니다.\n\n탄약 가방은 당신의 무기 중 하나의 탄약을 #{skill_color}#$deployable_uses##번까지 완전히 보충할 수 있게 해주며, 가방을 들여다보면 얼마나 남았는지 알 수 있습니다.",
		--ECM Jammer
		["bm_equipment_ecm_jammer_desc"] = "ECM 재머를 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없고 #{skill_color}#$deployable_uses##초 동안 작동합니다.\n\nECM 재머를 상호 작용하면 ECM 재머의 피드백 기능을 작동시킬 수 있습니다. 피드백 루프의 범위는 #{skill_color}#24##미터입니다. 첫 번째 피드백 루프는 대부분의 적을 기절시킬 확률이 #{skill_color}#100%##이며, 그 이후로는 #{skill_color}#1.2##초마다 기절 확률이 #{skill_color}#60%##로 감소된 채 기절시킵니다. 피드백은 #{skill_color}#$deployable_uses##초 동안 지속되며 #{skill_color}#4##분 후에 재충전됩니다.\n\nECM 재머는 ATM 기기를 열 수 있고 휴대전화, 카메라, 기타 감지 시스템 등의 전자 장치의 작동을 일시적으로 중지시켜 목표에 쉽게 도달할 수 있도록 도와줍니다.",
		["bm_equipment_ecm_jammer_desc_short"] = "ECM 재머를 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없고 #{skill_color}#$deployable_uses##초 동안 작동합니다.\n\nECM 재머를 상호 작용하면 ECM 재머의 피드백 기능을 작동시킬 수 있습니다. 피드백 루프의 범위는 #{skill_color}#24##미터입니다. 첫 번째 피드백 루프는 대부분의 적을 기절시킬 확률이 #{skill_color}#100%##이며, 그 이후로는 #{skill_color}#1.2##초마다 기절 확률이 #{skill_color}#60%##로 감소된 채 기절시킵니다. 피드백은 #{skill_color}#$deployable_uses##초 동안 지속되며 #{skill_color}#4##분 후에 재충전됩니다.",
		--FAQ U
		["bm_equipment_first_aid_kit_desc"] = "구급 키트를 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 #{skill_color}#150##만큼 체력을 회복할 수 있습니다.\n\n구급 키트는 #{skill_color}#한 번만## 사용할 수 있습니다.\n\n구급 키트는 응급치료를 위한 의약품 및 장비를 모은 조그만한 주머니입니다.",
		["bm_equipment_first_aid_kit_desc_short"] = "구급 키트를 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 #{skill_color}#150##만큼 체력을 회복할 수 있습니다.\n\n구급 키트는 #{skill_color}#한 번만## 사용할 수 있습니다.",
		--AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		["bm_equipment_doctor_bag_desc"] = "의료 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 최대 체력 #{skill_color}#20%##만큼 회복하고 #{skill_color}#3##분 동안 #{skill_color}#5##초마다 최대 체력의 #{skill_color}#4%##씩 회복합니다.\n\n의료 가방은 #{skill_color}#$deployable_uses##번만 사용할 수 있으며, 가방을 들여다보면 얼마나 남았는지 알 수 있습니다.\n\n의료 가방은 의사 또는 기타 의료 전문가가 의료 용품 및 의약품을 쉽게 들고 다니기 위해 사용하는 휴대용 가방입니다.",
		["bm_equipment_doctor_bag_desc_short"] = "의료 가방을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 최대 체력 #{skill_color}#20%##만큼 회복하고 #{skill_color}#3##분 동안 #{skill_color}#5##초마다 최대 체력의 #{skill_color}#4%##씩 회복합니다.\n\n의료 가방은 #{skill_color}#$deployable_uses##번만 사용할 수 있으며, 가방을 들여다보면 얼마나 남았는지 알 수 있습니다.",
		--Sentry
		["bm_equipment_sentry_gun_desc"] = "센트리 건을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 설치한 순간, 센트리 건은 당신의 무기들의 전체 탄약의 #{skill_color}#$deployable_uses##를 사용합니다.\n\n센트리 건 근처에 #{skill_color}#$BTN_INTERACT## 키를 길게 누르면 센트리 건을 회수 할 수 있습니다. 센트리 건을 회수하면 자동으로 수리되고, 센트리 건에 남아있는 탄약은 총 탄약에 회수됩니다.\n\n센트리 건은 너무 많은 피해를 입으면 작동을 멈추고, 이 상태에서 상호 작용하면 자동 수리 모드로 전환합니다.\n\n센트리 건은 시민들을 위협하여 땅에 눕히게 합니다.\n\n센트리 건은 부착된 센서를 통해 자동으로 목표를 조준하고 사격합니다. 센트리 건은 주로 당신과 당신의 팀원으로부터 주의를 끌어 교란용으로 주로 사용됩니다.",
		["bm_equipment_sentry_gun_desc_short"] = "센트리 건을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 설치한 순간, 센트리 건은 당신의 무기들의 전체 탄약의 #{skill_color}#$deployable_uses##를 사용합니다.\n\n센트리 건 근처에 #{skill_color}#$BTN_INTERACT## 키를 길게 누르면 센트리 건을 회수 할 수 있습니다. 센트리 건을 회수하면 자동으로 수리되고, 센트리 건에 남아있는 탄약은 총 탄약에 회수됩니다.\n\n센트리 건은 너무 많은 피해를 입으면 작동을 멈추고, 이 상태에서 상호 작용하면 자동 수리 모드로 전환합니다.",
		--Supp. Sentry
		["bm_equipment_sentry_gun_silent_desc"] = "저소음 센트리 건을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 설치한 순간, 저소음 센트리 건은 당신의 무기들의 전체 탄약의 #{skill_color}#$deployable_uses##를 사용합니다.\n\n저소음 센트리 건 근처에 #{skill_color}#$BTN_INTERACT## 키를 길게 누르면 저소음 센트리 건을 회수 할 수 있습니다. 센트리 건을 회수하면 자동으로 수리되고, 저소음 센트리 건에 남아있는 탄약은 총 탄약에 회수됩니다.\n\n저소음 센트리 건은 너무 많은 피해를 입으면 작동을 멈추고, 이 상태에서 상호 작용하면 자동 수리 모드로 전환합니다.\n\n저소음 센트리 건은 시민들을 위협하여 땅에 눕히게 합니다.\n\n저소음 센트리 건은 일반적인 시끄러운 센트리 건의 대체품으로 주의 분산보다는 적을 사살하는 데 더 자주 사용됩니다.",
		["bm_equipment_sentry_gun_silent_desc_short"] = "저소음 센트리 건을 사용하려면, #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 설치한 순간, 저소음 센트리 건은 당신의 무기들의 전체 탄약의 #{skill_color}#$deployable_uses##를 사용합니다.\n\n저소음 센트리 건 근처에 #{skill_color}#$BTN_INTERACT## 키를 길게 누르면 저소음 센트리 건을 회수 할 수 있습니다. 센트리 건을 회수하면 자동으로 수리되고, 저소음 센트리 건에 남아있는 탄약은 총 탄약에 회수됩니다.\n\n저소음 센트리 건은 너무 많은 피해를 입으면 작동을 멈추고, 이 상태에서 상호 작용하면 자동 수리 모드로 전환합니다.",
		--Body Bags
		["bm_equipment_bodybags_bag_desc"] = "시체 가방 케이스를 사용하려면 #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 시체 가방과 케이블 타이를 보충할 수 있습니다.\n\n시체 가방 케이스는 사용한도가 있습니다. 당신은 케이스를 보고 얼마나 사용 할 수 있는지 확인할 수 있습니다.\n\n시체 가방 케이스는 스텔스 도중에 시체를 운반할 때 사용되는 여분의 가방과 시민 군중을 통제하는 데 사용되는 추가 케이블 타이가 포함되어 있습니다.",
		["bm_equipment_bodybags_bag_desc_short"] = "시체 가방 케이스를 사용하려면 #{skill_color}#$BTN_USE_ITEM## 키를 길게 눌러 설치해야 합니다. 한 번 설치하게 되면 위치를 이동할 수 없지만, 당신과 당신의 팀원들이 #{skill_color}#$BTN_INTERACT## 키를 길게 눌러 시체 가방과 케이블 타이를 보충할 수 있습니다.\n\n시체 가방 케이스는 사용한도가 있습니다. 당신은 케이스를 보고 얼마나 사용 할 수 있는지 확인할 수 있습니다.",

		["hud_int_hold_take_pardons"] = "$BTN_INTERACT 키를 눌러 사면장을 얻기",
		["debug_interact_gage_assignment_take"] = "$BTN_INTERACT 키를 눌러 패키지를 얻기",

		["hint_ability_no_grenade_pickup"] = "특성 덱의 투척 무기는 보충할 수 없습니다.",
		["hint_full_grenades"] = "이미 충분히 가지고 있습니다.",
		["debug_interact_ordnance_bag_take_grenades"] = "$BTN_INTERACT 키를 길게 눌러 투척 무기와 탄약의 절반을 보충하기",

		["far_repair_sentry_macro"] = "센트리가 심각하게 손상되어 수리가 필요합니다.",
		["fixing_sentry_macro"] = "수리 진행도: $AMMO_LEFT",
		--Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
		["repair_sentry_macro"] = " 키를 길게 눌러 센트리 자동 수리 시퀀스를 시작하기",
		["pickup_sentry_macro"] = " 키를 길게 눌러 센트리를 회수하기\n남은 탄약 수 $AMMO_LEFT", --Gets % health remaining appended to the end.
		["firemode_sentry_macro"] = " 키를 눌러 발사 모드를 변경하기\n남은 탄약 수 $AMMO_LEFT",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", --$AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "센트리 수리 중...",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "데스 위시. 당신을 위한 난이도, 행동이 곧 활력입니다.",
		["menu_risk_sm_wish"] = "데스 센텐스. 이제 그 누구도 당신을 막을 수 없다는 걸 보여주십시오.",

		--Loading Hints--
		--Restoration Gameplay Hints--
		["loading_gameplay_res_title"] = "레스토레이션 게임플레이 팁들",
		["loading_gameplay_res_1"] = "클로커는 하이스터에게 공격적일 때 '쌕쌕거리는' 소리를 냅니다. 이를 이용하여 클로커의 위치를 찾을 수 있습니다.",
		["loading_gameplay_res_2"] = "클로커는 발차기를 시도 중일 때 더 이상  주변에 윙윙거리는 소리나 날카로운 소리를 내지 않습니다.",
		["loading_gameplay_res_3"] = "권총은 교체 시간이 긴 주 무기에 이상적인 보조 무기입니다.",
		["loading_gameplay_res_4"] = "테이저는 더 이상 당신의 무기를 재장전해주지 않습니다.",
		["loading_gameplay_res_5"] = "클로커는 혼자 있거나 동료와 멀리 떨어져 있는 하이스터를 쉽게 제압할 수 있습니다.",
		["loading_gameplay_res_6"] = "클로커는 당신을 걷어차면 직접적인 체력 피해를 가합니다. 이는 굴절도 또는 반격 스킬로 줄일 수 있습니다.",
		["loading_gameplay_res_7"] = "그린 불도저는 높은 피해를 가하며, 단 한 번의 사격으로 가장 무거운 방탄복도 부술 수 있습니다.",
		["loading_gameplay_res_8"] = "사이가/블랙 불도저는 높은 연사력으로 피해를 가하고 인상적인 드럼 탄창을 뽐냅니다. 또한 다른 불도저보다 빠르게 달려오지만 체력이 훨씬 적고 폭발물로 기절시킬 수 있습니다.",
		["loading_gameplay_res_9"] = "경기관총 도저/스컬 도저는 근거리에서 밀쳐내는 강력한 제압 사격을 가하며 탄이 비워질 때까지 사격합니다. 스컬 도저의 상단 장갑판은 일반 불도저보다 더 많은 피해를 견딜 수 있지만 타이탄 도저만큼 느리게 움직입니다.",
		["loading_gameplay_res_10"] = "베넬리 샷거너 도저는 미니건 도저를 대체하며, 높은 연사력과 높은 피해를 가지고 있습니다. 그린과 블랙 불도저의 무섭게 결합한 도저이죠.",
		["loading_gameplay_res_11"] = "타겟 우선 순위는 중요합니다. 모든 유형의 불도저는 경무장 SWAT보다 더 많은 관심을 기울일 가치가 있습니다.",
		["loading_gameplay_res_12"] = "데스 센텐스에서 불도저의 유리 바이저가 깨지면 버서거 상태에 돌입하여 피해량이 10%만큼 증가합니다.",
		["loading_gameplay_res_13"] = "클로커는 당신을 점프킥으로 걷어차려고 할 때 상징적인 날카로운 소리를 냅니다.",
		["loading_gameplay_res_14"] = "클로커의 점프킥은 당신을 쓰러뜨리는 대신 수갑으로 묶을 것입니다.",
		["loading_gameplay_res_15"] = "섬광탄을 데스 센텐스에서 파괴할 수 없습니다. 당신의 의견은 제 선택입니다.",
		["loading_gameplay_res_16"] = "근접 공격을 충전하여 적의 근접 공격을 막을 수 있습니다. 또한 클로커 킥도 막을 수 있도록 업그레이드할 수 있습니다.",
		["loading_gameplay_res_17"] = "적의 근접 공격은 빠르고 치명적입니다. 적과 거리를 두세요!",
		["loading_gameplay_res_18"] = "야구 방망이로 적을 때리는 것보다 나은 게 뭔지 아세요? 야구 방망이로 머리를 때려 헤드샷 피해를 가하는거죠.",
		["loading_gameplay_res_19"] = "저격수는 사격하기 전에 초점을 맞추는 데 짧은 시간이 걸립니다. 레이저를 주의하십시오!",
		["loading_gameplay_res_20"] = "당신의 조커는 클로커에게 걷어차이는 것에 안전하지 않습니다.",
		["loading_gameplay_res_21"] = "모든 진영의 공통된 적들은 선호하는 무기에 대한 경고를 하기 위해 유니폼에 대한 세부 정보를 공유합니다.",
		["loading_gameplay_res_22"] = "산탄총으로 무장한 적들은 원거리에서는 약하지만 근접전에서는 이를 보완합니다.",
		["loading_gameplay_res_23"] = "적들은 난이도가 높을수록 방패를 더 잘 활용하게 됩니다.",
		["loading_gameplay_res_24"] = "적들은 난이도가 높을수록 그들의 행동이 달라집니다.",
		["loading_gameplay_res_25"] = "데스 센텐스 난이도는 당신의 삶을 지옥으로 만드는 모든 종류의 불쾌한 트릭을 동원합니다. 그들이 당신을 봐줄 거라고 생각하지 마십시오.",
		["loading_gameplay_res_26"] = "프로 잡는 단 한 번의 기회만 허용하며 자신의 능력을 테스트할 수 있고, 무시무시한 브라보 유닛을 생성할 수도 있습니다.",
		["loading_gameplay_res_27"] = "레스토레이션 모드에서는 머키워터 용병과 다른 주의 법 집행관 등 다양한 진영이 등장합니다.",
		["loading_gameplay_res_28"] = "클로커는 더 높은 난이도에서 하이스터를 제압할 때 연막탄을 사용합니다.",
		--New Units Hints
		["loading_new_units_res_title"] = "레스토레이션 유닛 팁들",
		["loading_new_units_res_1"] = "옴니아 ASU는 근처에 있는 아군에게 노란색 레이저 부착물을 제공하여 대미지 보너스를 제공합니다.",
		["loading_new_units_res_2"] = "LPF는 근접 공격에 약합니다.",
		["loading_new_units_res_3"] = "경무장 유닛은 LPF의 과치료를 받습니다. 과치료 과정에서는 적의 외곽선이 보라색으로 표시됩니다.",
		["loading_new_units_res_4"] = "타이탄 클로커는 거의 보이지 않게 만드는 고급 클로킹 장비를 갖추고 있지만 여전히 표준 클로커 장비의 구형 모델과 같은 주변 소음을 가지고 있습니다.",
		["loading_new_units_res_5"] = "타이탄 도저는 레일건의 잠재력을 방해받지 않고 최대한 활용하기 위해 표적과 거리를 두는 것을 선호합니다.",
		["loading_new_units_res_6"] = "타이탄 저격수는 기본 저격수보다 발사 속도가 더 빠르고 이동 중에도 사격 할 수 있지만 발당 대미지와 장갑 관통 능력을 잃었습니다.",
		["loading_new_units_res_7"] = "타이탄 저격수는 레이저 사이트를 사용하는 대신 사격 시 보라색 예광탄을 남깁니다.",
		["loading_new_units_res_8"] = "타이탄 실드는 대물 저격소총, 찢고 죽인다 베이직을 사용 중 일때의 OVE9000 톱, 센트리 건의 특수 철갑탄으로 관통할 수 있습니다. 또한 방패를 오랫동안 쏘기만 해도 방패를 떨어뜨릴 수 있지만, 방패를 떨어뜨리게 만들면 바로 전략을 바꾸므로 조심하세요.",
		["loading_new_units_res_9"] = "캡틴 스프링과 타이탄 도저는 항상 추가 헤드샷 피해를 받습니다.",
		["loading_new_units_res_10"] = "타이탄 테이저는 일시적으로 움직임을 크게 감소하게 만드는 감전탄을 발사합니다. 이 효과는 파란색 UI 오버레이로 표시됩니다.",
		["loading_new_units_res_11"] = "베테랑 경찰은 헤드샷이 아닌 다른 공격으로 죽을 경우 최루탄을 떨어뜨립니다.",
		["loading_new_units_res_12"] = "베테랑 경찰은 빠르게 움직여 총격을 가하기 어렵게 만듭니다.",
		["loading_new_units_res_13"] = "진압 장비를 착용한 타이탄 SWAT은 근접 공격에 약간의 저항력이 있습니다.",
		["loading_new_units_res_14"] = "타이탄 SWAT은 인질로 잡히거나 당신 편에서 싸우도록 전향시킬 수도 없습니다.",
		["loading_new_units_res_15"] = "타이탄 SWAT은 적을 밀쳐내거나 충격을 가하는 경기관총과 자동 산탄총을 자랑합니다.",
		["loading_new_units_res_16"] = "강력한 브라보 유닛은 프로 잡에서 탈출 차량 출발 이벤트가 트리거될 때만 생성됩니다. 브라보는 향상된 방탄복과 더 강력한 무기를 갖춘 장난 아니게 강력한 적입니다.",
		["loading_new_units_res_17"] = "브라보 유닛은 파편 수류탄을 던질 수 있습니다. 수류탄이 깜박거리고 카운트다운을 알리는 경고음이 울릴 때 주변을 주의하세요.",
		["loading_new_units_res_18"] = "아칸은 자사의 R&D 회사인 DRAK에서 개발한 D-시리즈라는 자체 타이탄 유닛을 배치합니다.",
		["loading_new_units_res_19"] = "척탄병은 총열하부 부착물을 사용해 원거리에서 최루탄을 발사하여 구름 속에 서 있는 플레이어에게 피해를 가합니다. 데스 센텐스에서는 대신 더 치명적이고 스태미나를 소모시키는 신경 가스탄으로 무장합니다.",
		["loading_new_units_res_20"] = "타이탄 실드는 방패에 섬광 패널이 장착되어 있습니다. 패널이 충전 중일 때, 패널을 사격하면 충전이 멈추게 되는 동시에 파괴되어 그 과정에 방패를 든 적을 잠시 기절시킬 수 있습니다.",
		--Captain Hints
		["loading_captains_res_title"] = "레스토레이션 캡틴 팁들",
		["loading_captains_res_1"] = "캡틴 서머스의 높은 피해 저항력은 그의 팀원들이 한 명씩 죽을때마다 감소합니다. 닥은 살아 있는 동안 나머지 팀원을 치료할 수 있으므로 먼저 제거 대상으로 삼으십시오.",		
		["loading_captains_res_2"] = "캡틴 서머스에게 다가가지 마십시오. 그는 당신을 화염방사기로 녹일 것입니다.",		
		["loading_captains_res_3"] = "캡틴 스프링은 엄청난 피해량을 견더낼 수 있지만 결국에는 쓰러질 것입니다. 스프링이 던지는 수류탄을 조심하면서 그의 낮은 기동성을 활용하십시오.",	
		["loading_captains_res_4"] = "캡틴 스프링은 주기적으로 클러스터 고폭 수류탄을 던집니다.",	
		["loading_captains_res_5"] = "캡틴 스프링은 밀쳐내는 능력을 가지고 있어 위험할 수 있지만 엄청나게 느리고 사거리가 좋지 않습니다.",	
		["loading_captains_res_6"] = "캡틴 어텀은 공격할 때 큰 소리로 도발합니다.",	
		["loading_captains_res_7"] = "다른 캡틴들과 달리, 경찰은 어텀의 기습을 망치지 않기 위해 어텀의 도착을 알리지 않습니다.",	
		["loading_captains_res_8"] = "캡틴 어텀은 한동안 활동 중일 때 발각되지 않았다면 점진적으로 배치품을 비활성화합니다. 비활성화된 배치품은 보라색으로 표시되며 어텀을 발견하고 그를 처치한 경우에만 복구할 수 있습니다.",	
		["loading_captains_res_9"] = "당신은 아마도 주먹 싸움에서 캡틴 어텀을 이길 수 없을 것입니다. 시도조차 하지 마십시오.",	
		["loading_captains_res_10"] = "캡틴 윈터스는 총알 저항력 뿐만 아니라 폭발물과 불에 대한 저항력도 더 강합니다. 그럼에도 불구하고 윈터스는 근접 공격에 다소 취약합니다.",	
		["loading_captains_res_11"] = "캡틴 윈터스의 방패는 관통할 수 없지만 충분한 피해를 흡수하면 파괴됩니다. 타이탄 실드처럼 그의 두 번째 단계를 조심하세요.",	
		["loading_captains_res_12"] = "캡틴 윈터스는 맵 전체를 돌아다니며 근처의 적들을 치료하고 과치료합니다.",	
		["loading_captains_res_13"] = "캡틴 윈터스의 방패에는 타이탄 실드과 같은 섬광 패널이 장착되어 있습니다. 다만, 원터스의 방패의 섬광 패널은 총으로 맞춰도 파괴되지 않는다는 점을 명심하세요.",	
		--Stealth Hints
		["loading_stealth_res_title"] = "레스토레이션 스텔스 팁들",
		["loading_stealth_res_1"] = "보안 지휘소는 오작동하는 카메라를 조사하기 위해 경비원을 파견하기 때문에 이를 미끼로 사용할 수 있습니다.",	
		["loading_stealth_res_2"] = "경계하지 않는 경비병을 근접 공격으로 재빨리 처치하면 페이저를 빼앗을 수 있습니다.",	
		["loading_stealth_res_3"] = "보안 지휘소는 경비병의 실종을 알아차리고 지원 경비를 보낼 가능성이 높습니다.",	
		["loading_stealth_res_4"] = "페이저가 없는 경비원을 죽여도 의심도가 커지지 않습니다.",	
		["loading_stealth_res_5"] = "스텔스 모드의 모든 무기의 소음은 소음 반경이 25미터로 고정되어 있습니다.",	
		["loading_stealth_res_6"] = "시민들은 라우드와 스텔스에서 총격에 반응하여 엎드립니다.",	
		["loading_stealth_res_7"] = "센트리 건은 반경 내에 주변의 시야에 띄는 모든 민간인을 진정시킵니다.",	
		["loading_stealth_res_8"] = "가방을 들고 있는 동안에는 훨씬 더 멀리서도 볼 수 있으며, 서 있거나 질주하거나 점프하는 동안에도 훨씬 더 빠르게 감지됩니다. 몸을 낮추고 천천히 움직이세요.",	
		["loading_stealth_res_9"] = "바닐라처럼 2개 대신 최대 4개의 ECM을 얻지만 지속 시간은 절반입니다.",	
		["loading_stealth_res_10"] = "스텔스 모드에서 소음기가 장착된 무기는 소음을 발생시키지 않습니다.",	
		["loading_stealth_res_11"] = "스텔스에서는 라우드와 마찬가지로 최대 4명의 경찰을 인질로 잡을 수 있습니다.",	
		["loading_stealth_res_12"] = "스텔스는 더 관대하여 더 많은 뒷수습을 가능하게 합니다.",	
		["loading_stealth_res_13"] = "경비원은 더 이상 경고를 받지 않은 상태에서 어떠한 형태의 피해를 입어도 즉사하지 않습니다. 머리쪽을 노리고 주먹보다 더 강력한 것을 가져 오십시오.",	
		["loading_stealth_res_14"] = "만일 의심 미터가 가득 차게되면 알람이 울리기 전에 시작한 일을 완료하는 데 60초가 주어집니다.",	
		["loading_stealth_res_15"] = "의심 미터가 높을수록 경비원에게 발각 당하기 더 쉬워집니다.",	
		["loading_stealth_res_16"] = "기본 게임보다 더 많은 시체 가방을 운반할 수 있으며, 혼자 플레이하는 경우 가질 수 있는 시체 가방의 개수가 더욱 증가합니다.",	
		["loading_stealth_res_17"] = "Crime.net 오프라인 모드에서는 빠진 플레이어를 보충하기 위해 추가 케이블 타이가 제공합니다. 여전히 알맞는 기술이 있다면 갯수가 증가합니다.",	
		["loading_stealth_res_18"] = "총격으로 사망한 경비원은 페이저를 울립니다. 페이저가 울려도 의심도가 중가하지 않지만 무시하면 의심도가 증가합니다.",	
		["loading_stealth_res_19"] = "페이저 교환원은 난이도가 높을수록 덜 관대해집니다. 마지막 페이저는 특수 음성 대사를 사용하여 이를 알릴 것입니다.",	
		["loading_stealth_res_20"] = "허용된 한도를 초과한 채 페이저에 응답하면 의심도를 엄청나게 증가시키지만, 중간에 끊거나 응답하지 않는 것만큼은 아닙니다.",	
		["loading_stealth_res_21"] = "난이도가 높을수록 페이저를 응답하는 데 시간이 더 오래 걸리게 되고 그 자리에서 사라지는 시간도 빨라집니다.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "레스토레이션 장비 및 스킬 팁들",
		["loading_equip_skills_res_1"] = "산탄총은 명중률이 낮으면 장거리에서 효율성이 떨어지고, 명중률이 높으면 여러 타겟을 맞추는 능력이 떨어집니다. 실험을 해보고 무엇이 가장 효과적인지 알아보세요!",	
		["loading_equip_skills_res_2"] = "권총은 다른 무기 종류에 비해 교체 속도가 더 빠릅니다.",	
		["loading_equip_skills_res_3"] = "레스토레이션의 무기는 장단점이 있는 다양한 클래스로 나뉩니다. 대미지가 높은 무기는 적을 더 빨리 죽일 수 있지만, 어느새 탄이 부족해질 수 있습니다!",	
		["loading_equip_skills_res_4"] = "대미지가 높은 무기는 일반적으로 명중률이나 발사 속도와 같은 심각한 단점이 없는 한 은닉하기 어렵습니다.",	
		["loading_equip_skills_res_5"] = "울프는 현장 수리가 가능하도록 센트리 건을 업그레이드 했습니다. 시간이 좀 걸리지만 일단 가동하면 자동으로 복구됩니다.",	
		["loading_equip_skills_res_6"] = "센트리의 철갑탄이 잠금 해제되어 있으면 장비 메뉴에서 기본 탄약 유형을 선택할 수 있습니다.",	
		["loading_equip_skills_res_7"] = "특성 덱은 상당한 대미지 보너스를 제공하며 그 중 다수는 희귀하고 귀중한 치유 능력을 제공합니다.",	
		["loading_equip_skills_res_8"] = "크루 치프, 아머러, 머슬, 크룩, 갬블러, 바이커는 기본적이지만 일관성이 있는 특성 덱입니다.",	
		["loading_equip_skills_res_9"] = "히트맨은 장기 생존성과 지속성이 낮은 특성 덱으로 재설계되었지만, 그 대가로 어려운 상황을 헤쳐 나갈 수 있게 해주는 막대한 양의 '임시 체력'을 얻을 수 있습니다.",	
		["loading_equip_skills_res_10"] = "크루 치프는 낮지만 유용한 버프를 당신과 당신의 팀원들에게 부여하고 인질이 여러 명인 경우 더 높은 버프를 제공하는 팀 중심 특전 덱입니다. 이 특전 덱은 마스터마인드의 컨트롤러 트리와 유용하게 쓰일 수 있습니다.",	
		["loading_equip_skills_res_11"] = "갬블러는 탄약을 획득할 때 팀원에게 약간의 체력과 보너스 탄약을 제공하는 팀 중심 특성 덱입니다. 이 특전 덱은 탄약을 더 드랍하는 스킬과 유용하게 쓰일 수 있습니다.",	
		["loading_equip_skills_res_12"] = "매니악은 지속적으로 적을 처치하기만 하면 당신과 팀원이 받는 피해를 줄여주는 빠른 팀 중심의 특성 덱입니다. 이 특전 덱은 높은 대미지 중심 빌드와 피해 저항이 있는 빌드와 유용하게 쓰일 수 있습니다.",	
		["loading_equip_skills_res_13"] = "해커의 포켓 ECM은 팀 전체를 치료하거나 강력한 군중 제어를 제공하지만 재충전하는 데 오랜 시간이 걸립니다. 또한 스텔스에서도 효과적입니다.",	
		["loading_equip_skills_res_14"] = "버글러는 총격전 중에 머리를 숙이는 데 도움이 되는 회피 중심 특성 덱입니다.",	
		["loading_equip_skills_res_15"] = "킹핀은 다재다능한 특성 덱입니다. 주사기는 막대한 피해를 입어도 견뎌내게 하거나, 팀원들에게 쏟아지는 적의 사격을 끌어내는 데 사용할 수 있습니다.",	
		["loading_equip_skills_res_16"] = "태그 팀은 당신과 당신이 지정한 팀원이 지속적으로 적을 처치하기만 특정 팀원에게 많은 치료를 제공할 수 있는 팀 중심 특성 덱입니다.",	
		["loading_equip_skills_res_17"] = "방패를 관통한 총알은 절반의 피해를 가합니다.",	
		["loading_equip_skills_res_18"] = "Peacemaker와 Phoenix .500 리볼버는 저격소총처럼 관통할 수 있습니다.",
		["loading_equip_skills_res_19"] = "화면 측면에 파란색 미터가 있으면 회피할 수 있는 상태입니다. 깜빡일 때 다음 총알을 회피할 수 있습니다. 회피 재작업에 대한 자세한 설명을 보려면 가이드를 참조하세요.",	
		["loading_equip_skills_res_20"] = "무기의 기동성이 높을수록 무기를 꺼내고 집어넣는 속도가 빨라집니다.",	
		["loading_equip_skills_res_21"] = "전기톱과 카자구루마는 들고 있는 동안 전방의 적에게 피해를 가합니다.",	
		["loading_equip_skills_res_22"] = "버터플라이 나이프와 스위치블레이드는 적을 뒤에서 찌르면 막대한 대미지를 가합니다.",	
		["loading_equip_skills_res_23"] = "아이스픽과 금광 열풍은 공격 속도가 느린 대신 헤드샷 대미지가 증가합니다.",	
		["loading_equip_skills_res_24"] = "독은 중간 정도의 피해만 입히지만, 구토를 유발하게 하여 다른 행동을 방해합니다.",	
		["loading_equip_skills_res_25"] = "충격 수류탄은 불도저에게도 매우 강력한 방해 효과를 제공합니다.",	
		["loading_equip_skills_res_26"] = "조준기로 조준하면 경기관총을 사용해도 명중률이 크게 향상되고 반동이 감소합니다.",	
		["loading_equip_skills_res_27"] = "파운더 네일건 근접 무기는 다른 어떤 근접 무기보다 훨씬 긴 사거리를 자랑합니다.",	
		["loading_equip_skills_res_28"] = "특전 덱의 레벨을 올리면 투척물 가방이 잠금 해제됩니다.",
		["loading_equip_skills_res_29"] = "이제 장비 상자에 투척 무기를 보충하면 사용할 때마다 투척물이 전부 다시 채워집니다.",	
		["loading_equip_skills_res_30"] = "인스파이어 에이스 효과는 아껴두었다가 상황이 정말 나빠졌을 때만 사용하세요. 인스파이어 에이스 효과의 재사용 대기시간은 매우 길고 시야가 필요합니다.",	
		["loading_equip_skills_res_31"] = "레스토레이션 모드는 특성 효과를 비활성화하는 대신 더 많은 돈과 경험치 획득을 제공하는 두 개의 새로운 특성 덱을 추가합니다. 더 좋은 보상에 도전해보세요!",
		["loading_equip_skills_res_32"] = "조준 메커니즘이 변경되어 조준 명중률의 이점을 얻으려면 완전히 조준해야 합니다. 무기를 개조할 때 \"조준 시간\" 통계를 주의 깊게 살펴보세요.",
		["loading_equip_skills_res_33"] = "연장 총열, 더 튼튼한 개머리판 및 확장 탄창은 장점이 있지만 교체, 재장전, 조준 및 질주하여 발사까지의 시간이 매우 길어지게 만들어서 너무 많이 사용하면 무기를 사용하기가 불편해질 것입니다.",
		["loading_equip_skills_res_34"] = "개머리판 근접 공격 속도는 무기의 기동성에 영향을 받습니다.",
		["loading_equip_skills_res_35"] = "\"조준 시간\" 통계는 \"달리기 이후 사격\" 통계의 역할도 합니다. \"달리기 이후 사격\" 시간이란 달리기를 멈춘 후 무기를 발사할 수 있을 때까지 걸리는 시간입니다.",
		["loading_equip_skills_res_36"] = "소음기는 전투 중에 적이 당신의 조준을 회피할 가능성을 줄여줍니다. 적이 당신을 피하지 않는 시간은 대신 당신을 쏘는 데 사용될 가능성이 있다는 점을 알아두세요.",
		["loading_equip_skills_res_37"] = "광학 조준기는 조준 시 현재 배율에 따라 반동이 감소하여 장거리 사격에 도움이 되지만, 조준 시간이 더 느려지는 단점이 있습니다.",
		["loading_equip_skills_res_38"] = "근접 무기의 \"클리브\" 통계는 한 번의 공격으로 얼마나 많은 적들을 공격할 수 있는지를 나타냅니다.",
		--Misc Hints
		["loading_misc_res_title"] = "레스토레이션 기타 팁들",
		["loading_misc_res_1"] = "저희가 만든 커스텀 하이스트도 해보십시오! 대부분의 하이스트는 '자칼'이라는 계약자에게 찾아볼 수 있고, '도그하우스'는 블라드에게 찾을 수 있습니다.",	
		["loading_misc_res_2"] = "레스토레이션 모드는 스팀 가이드가 있습니다! 더 자세한 정보는 가이드에서 확인해볼 수 있습니다. 메인 메뉴를 확인하세요.",	
		["loading_misc_res_3"] = "레스토레이션 모드는 디스코드 서버가 있습니다! 토론, 벨런스 피드백 및 매치 메이킹에 참여해보십시오! 메인 메뉴를 확인하세요.",	
		--Trivia Hints
		["loading_fluff_res_title"] = "레스토레이션 트리비아",
		["loading_fluff_res_1"] = "옴니아는 실패한 무기 프로젝트를 되살리기 위해 상당한 돈을 투자합니다.",	
		["loading_fluff_res_2"] = "LPF는 많은 맥주를 빚지고 있습니다.",	
		["loading_fluff_res_3"] = "LPF와 타이탄 저격수는 호주인입니다.",	
		["loading_fluff_res_4"] = "NYPD Bronco 경찰은 도넛을 좋아합니다.",	
		["loading_fluff_res_5"] = "ZEAL UMP 엘리트 SWAT의 이름은 차드입니다.",	
		["loading_fluff_res_6"] = "타이탄 도저는 광범위한 유전 공학, 인체 실험 그리고 전투 약물 덕분에 빛나는 눈을 가지고 있습니다.",	
		["loading_fluff_res_7"] = "캡틴 스프링은 인간이 아닙니다. 아니면 아주 에젼에는 인간이였을 수도 있습니다.",	
		["loading_fluff_res_8"] = "레스토레이션 모드는 커뮤니티의 다양한 맴버와 개발 팀으로부터 'resmod','SCmod','furry mod' 및 'mememod'라는 별명이 불리기도 합니다.",	
		["loading_fluff_res_9"] = "옴니아는 공룡의 공격을 막기 위해 강화된 보안문을 개발해왔습니다.",	
		["loading_fluff_res_10"] = "척탄병은 해충 방제에 종사하곤 했습니다.",	
		["loading_fluff_res_11"] = "당신은 타이탄 클로커를 본 적이 없습니다.",
		["loading_fluff_res_12"] = "\"옴니아\"는 네덜란드에 기반을 둔 자칭 '네오켈트 이교도 사람' 밴드로, 멤버들은 아일랜드, 네덜란드, 콘월, 벨기에, 인도네시아 및 페르시아 출신으로 이루어져 있습니다. 옴니아와 연관이 있는지는 확인되지 않았습니다.",	
		["loading_fluff_res_13"] = "자칼이 Crime.Net에 연루되어 젠섹을 떠나게 된 원인이 무엇이었든 간에 그는 그 사건에 관한 이야기하기를 거부했습니다. 그는 그 사건으로 인해서 '불안해'한 듯합니다.",	
		["loading_fluff_res_14"] = "하하하하하.",
		["loading_fluff_res_15"] = "캡틴 서머스과 그의 팀원들은 페이데이 갱단과 같은 다국적 조직과 매우 유사하게 네 명의 강도로 구성된 조직이었습니다. 그들은 이제 옴니아의 타격팀이 되었습니다.",
		["loading_fluff_res_16"] = "캡틴 서머스과 그의 팀원들은 공식적으로 은행을 털다가 건물 붕괴로 사망했지만 이는 사실이 아니였습니다.",
		["loading_fluff_res_17"] = "캡틴 어텀은 수갑에 상당한 돈을 투자합니다.",
		["loading_fluff_res_18"] = "캡틴 서머스은 가스 가스 가스에 상당한 돈을 투자합니다.",
		["loading_fluff_res_19"] = "캡틴 스프링은 총알과 수류탄에 상당한 돈을 투자합니다.",
		["loading_fluff_res_20"] = "캡틴 윈터스는 방패와 접착 테이프에 상당한 돈을 투자합니다.",
		["loading_fluff_res_21"] = "척탄병 사단은 여러 아군 피해 사건으로 인해서 디포테린에 상당한 돈을 투자합니다.",
		["loading_fluff_res_22"] = "당신은 이전에 캡틴 서머스를 만났을 수도 있고 만나지 않았을 수도 있습니다.",
		["loading_fluff_res_23"] = "연방 경찰에는 특수 추파카브라 사냥 부서가 있습니다.",
		["loading_fluff_res_24"] = "캡틴은 죽는 것이 아니라 구금 당합니다.",
		["loading_fluff_res_25"] = "아칸은 옴니아보다 저렴한 가격으로 '카르텔에 대한 신속하고 잔혹한 단속'을 제안했고, 이로 인해 연방 경찰은 DRAK의 D-시리즈 병사 버전을 채택하게 되었습니다. 이는 멕시코와 미국의 옴니아와 머키 작전에 병력을 더욱 가까이 배치하기 위한 계략이었습니다.",

		["menu_button_deploy_bipod"] = "양각대/대체 발사",
		["hint_short_max_pagers"] = "페이저를 소홀히 하면 경비원의 의심이 크게 높아집니다.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "엘리트 범죄자로서 새로 시작하려면, 가장 먼저 여러분의 수준에 걸맞은 장비를 얻고 축하 팡파르를 울리는 것부터 시작해야겠군요.\n\n보너스:\n악명 아이템의 등장 확률이 ##0.3%##에서 ##$0.6%##로 증가합니다.\n획득 경험치가 ##5%##만큼 증가합니다.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "Assault",
		["st_menu_enforcer_armor"] = "저거너트",
		["st_menu_enforcer_ammo"] = "지원",
		["st_menu_technician_auto"] = "전투 엔지니어",
		["st_menu_technician_breaching"] = "돌파자",
		["st_menu_technician_sentry"] = "요새",
		["st_menu_ghost_silencer"] = "계약 킬러",
		["hud_instruct_mask_on"] = "$BTN_USE_ITEM 키를 눌러 마스크를 착용",
		["hud_instruct_mask_on_alpha"] = "$BTN_USE_ITEM 키를 눌러 마스크를 착용",

		--Default Suit String
		["bm_suit_none_desc"] = "선택한 방탄복을 착용한 하이스터의 기본 복장입니다. 선택한 하이스트에 따라 복장이 투피스 정장에서 자동으로 변경됩니다!",

		-- Ad Banner Change
		["menu_changelog"] = "최신 변경 로그",
		["menu_discord"] = "디스코드 서버",
		["menu_guide"] = "오버홀 가이드",
		["menu_captains"] = "캡틴에 대한 정보",
		["menu_content_updates"] = "가이드 및 서포트",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "",
		["menu_mutators_category_holiday"] = "연휴",
		["menu_mutators_category_old_event"] = "이벤트",
		["menu_mutators_category_crime_spree"] = "크라임 스프리",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "척탄병",
		["mutator_specials_override_sniper"] = "저격수",	
		
		["mutator_titandozers_desc"] = "할로윈 연휴 효과",
		["mutator_titandozers_longdesc"] = "머리 없는 불도저가 울프의 악몽에서 빠져나와 현실이 되었습니다! 모든 불도저들이 머리 없는 불도저가 되고, 다른 할로윈 효과도 활성화됩니다!",

		["mutator_medidozer_longdesc"] = "적의 공세가 진행되는 동안 모든 일반 적을 메딕으로, 특수 유닛을 불도저로 대체합니다.",
		["mutator_medicdozers"] = "메딕 도저",
		["mutator_medicdozers_desc"] = "이제 메딕 도저가 스폰될 수 있습니다.",
		["mutator_medicdozers_longdesc"] = "다양한 종류의 불도저가 스폰될 때마다 50%만큼의 확률로 메딕 불도저로 교체됩니다. \n\n주의: 단발 산탄총 불도저 뮤테이터가 활성화된 경우, 메딕 불도저가 블랙 불도저를 대체할 확률은 33.3%입니다.",

		--Alternative arsenal
		["mutator_enemy_damage_longdesc"] = "플레이어는 평상시보다 디른 피해량을 입게 됩니다.",

		--Because of Training
		["mutator_enemy_health_longdesc"] = "적군이 평상시보다 다른 체력을 갖고 스폰되어 죽이기 쉬워지거나 어렵게 합니다.",

		["mutator_notitans"] = "예산 삭감",
		["mutator_notitans_desc"] = "타이탄 유닛을 비활성화합니다.",
		["mutator_notitans_longdesc"] = "모든 타이탄 유닛의 스폰 인스턴스가 비활성화됩니다.",
		
		["mutator_onlytitans"] = "예산 증액",
		["mutator_onlytitans_desc"] = "타이탄 유닛이 타이탄이 아닌 모든 유닛을 대체합니다.",
		["mutator_onlytitans_longdesc"] = "타이탄이 아닌 유닛의 모든 스폰 인스턴스는 타이탄 유닛으로 대체됩니다.",

		["mutator_mememanonly"] = "HAHAHA, FOOLED YOU GUYS!",
		["mutator_mememanonly_desc"] = "SUFFERING",
		["mutator_mememanonly_longdesc"] = "CANTRUNNOESCAPEHELPHELPHELP\n\n 경고: 이 뮤테이터는 일부 맵에서 충돌을 일으킬 수 있습니다.",

		["MutatorMoreDonutsPlus"] = "더 많은 도넛+",
		["MutatorMoreDonutsPlus_desc"] = "모든 일반 적을 NYPD Bronco 경찰로, 특수 적은 LPF로 대체합니다.",
		["MutatorMoreDonutsPlus_longdesc"] = "모든 일반 적을 NYPD Bronco 경찰로, 특수 적은 LPF로 대체합니다. \n\n경고: 해당 뮤테이터를 활성화하면 잔학 행위를 저지르는 것입니다.",

		["MutatorJungleInferno"] = "정글 인페르노",
		["MutatorJungleInferno_desc"] = "모든 적은 이제 화염 방사기를 가지고 스폰됩니다.",
		["MutatorJungleInferno_longdesc"] = "모든 적의 기본 무기를 화염 방사기로 대체합니다.\n\n주의: 저격수와 방패를 든 적은 여전히 기본 무기를 들고 스폰합니다.",

		["mutator_minidozers"] = "단발 산탄총 불도저",
		["mutator_minidozers_desc"] = "이제 단발 산탄총 불도저가 스폰될 수 있습니다.",
		["mutator_minidozers_longdesc"] = "블랙 불도저가 스폰될 때마다 50%만큼의 확률로 M1014 산탄총으로 무장한 불도저로 교체됩니다.\n\n주의: 메딕 불도저 뮤테이터가 활성화된 경우, 단발 산탄총 불도저가 블랙 불도저를 대체할 확률은 33.3%입니다.",

		["mutator_fatroll"] = "팻 롤",
		["menu_mutator_fatroll"] = "유예 기간 (초 단위)",
		["mutator_fatroll_desc"] = "사용자 정의 피해 유예 값 (초 단위).",
		["mutator_fatroll_longdesc"] = "플레이어와 AI 팀원의 피해 유예를 특정 값으로 변경합니다. 피해 유예는 대미지 인스턴스가 계산되는 빈도에 영향을 미치며, 값이 낮을수록 더 짧은 시간에 더 많은 피해를 입게 됩니다.",
		
		["mutator_overheal"] = "과치료 전문의",
		["menu_mutator_overheal_mult_override"] = "과치료 배율",
		["menu_mutator_overheal_mult_override_toggle"] = "캡틴 포함",
		["mutator_overheal_desc"] = "LPF가 대부분의 적에게 과치료할 수 있습니다.",
		["mutator_overheal_longdesc"] = "LPF는 공세하는 유닛 전체(클로커 제외)에게 과치료할 수 있습니다.\n\n주의: 일부 유닛은 뮤테이터 설정과 관계없이 자체적인 과치료 배율을 사용합니다.",
		
		["mutator_asu_buff"] = "향상된 화력",
		["menu_mutator_captain_asu_buff_toggle"] = "캡틴 포함",
		["mutator_asu_buff_desc"] = "ASU는 대부분의 특수 유닛에게 버프를 부여할 수 있습니다.",
		["mutator_asu_buff_longdesc"] = "ASU는 대부분의 특수 유닛(클로커 제외)에게 버프를 부여할 수 있습니다.",
		
		["mutator_bo_flashbang"] = "당신의 의견은 나의 선택",
		["menu_mutator_flashbang_cooking_time"] = "기폭 시간 (초 단위)",
		["mutator_bo_flashbang_desc"] = "이제 섬광탄은 파괴되지 않습니다.",
		["mutator_bo_flashbang_longdesc"] = "이제 섬광탄은 파괴되지 않습니다.",
		
		["mutator_grenade_mayhem"] = "총체적 난국!",
		["menu_mutator_grenade_mayhem_usuals_toggle"] = "일반 및 엘리트 적 포함",
		["menu_mutator_grenade_mayhem_thugs_toggle"] = "갱스터 포함",
		["menu_mutator_grenade_mayhem_specials_toggle"] = "특수 적 포함",
		["menu_mutator_grenade_mayhem_bosses_toggle"] = "보스 포함",
		["menu_mutator_grenade_mayhem_captains_toggle"] = "캡틴 포함",
		--["menu_mutator_grenade_mayhem_sosa_cosplay_toggle"] = "척탄병의 파편 유탄 총열하부 포함",
		["mutator_grenade_mayhem_desc"] = "브라보가 아닌 적들도 파편 수류탄을 던질 수 있습니다.",
		["mutator_grenade_mayhem_longdesc"] = "브라보가 아닌 적들도 파편 수류탄을 던질 수 있습니다.\n\n주의: 화염방사기를 사용하는 적은 수류탄 대신 화염병을 사용하고, 클로커는 수류탄 대신 최루 가스를 사용합니다.",
		
		["mutator_captain_replace"] = "끝없는 계절",	
		["menu_mutator_captain_replace_1"] = "캡틴 (1일차)",
		["menu_mutator_captain_replace_2"] = "캡틴 (2일차)",
		["menu_mutator_captain_replace_3"] = "캡틴 (3일차)",
		["menu_mutator_captain_replace_no_captain_override"] = "바꾸지 않음",
		["menu_mutator_captain_replace_captain_random"] = "랜덤",
		["menu_mutator_captain_replace_winter"] = "윈터스",
		["menu_mutator_captain_replace_autumn"] = "어텀",
		["menu_mutator_captain_replace_spring"] = "스프링",
		["menu_mutator_captain_replace_summer"] = "서머스",
		["menu_mutator_captain_replace_hvh"] = "HHHTDFH",
		["menu_mutator_winter_blacklist_toggle"] = "\"랜덤\" 옵션에 윈터스를 블랙리스트에 추가",
		["menu_mutator_spring_blacklist_toggle"] = "\"랜덤\" 옵션에 스프링을 블랙리스트에 추가",
		["menu_mutator_summer_blacklist_toggle"] = "\"랜덤\" 옵션에 서머스를 블랙리스트에 추가",
		["menu_mutator_autumn_blacklist_toggle"] = "\"랜덤\" 옵션에 어텀을 블랙리스트에 추가",
		["menu_mutator_hvh_blacklist_toggle"] = "\"랜덤\" 옵션에 HHHTDFH를 블랙리스트에 추가",
		["mutator_captain_replace_desc"] = "하이스트 중에 스폰되는 캡틴을 변경합니다.",
		["mutator_captain_replace_longdesc"] = "하이스트 도중에 스폰하는 캡틴을 선택한 캡틴으로 변경합니다.\n\n주의: 스크립트된 캡틴 엔카운터는 변경되지 않습니다. \"무작위\" 옵션에서 모든 캡틴을 블랙리스트에 등록하면 \"변경 없음\" 옵션을 대신 사용합니다.",
		
		["mutator_no_outlines"] = "전문가 리얼리즘",
		["mutator_no_outlines_desc"] = "대부분의 외곽선이 비활성화됩니다.",
		["mutator_no_outlines_longdesc"] = "대부분의 외곽선과 플레이어 및 봇 위의 이름 라벨이 비활성화됩니다.",
		["menu_mutator_no_outlines_enemies_toggle"] = "적 외곽선 비활성화",
		["menu_mutator_no_outlines_objectives_toggle"] = "하이라이트 외곽선 비활성화 (에스코트 제외)",
		

		["mutator_spawn_mult"] = "증대된 대응",
		["menu_mutator_enemy_spawn"] = "적 스폰 배율",
		["mutator_spawn_mult_desc"] = "적의 스폰이 증가합니다.",
		["mutator_spawn_mult_longdesc"] = "공세가 진행되는 동안 더 많은 적들이 스폰됩니다. Overkill™이 써먹는 방식이죠!",
		
		["mutator_birthday"] = "풍선 터트리기",
		["mutator_birthday_desc"] = "특수 적을 처치 시 버프를 제공하는 풍선이 생성됩니다.",
		["mutator_birthday_longdesc"] = "PAYDAY 10주년 기념 이벤트:\n\n특수 유닛을 처치하면 풍선이 생성되어 팀 전체에게 버프를 부여할 수 있으며, 이 버프는 처치한 유닛에 따라 바로 보너스를 받거나 또는 시간 제한이 적용됩니다. 일부 유닛은 다른 유닛보다 풍선을 더 자주 생성하며, 여러 버프가 동시에 활성화될 수 있습니다.",		

		["mutator_CG22"] = "크리미널 캐롤",
		["mutator_CG22_desc"] = "하이스트에 크리스마스 트리가 스폰되어 선물을 으깨거나 하이루딘에게 줄 수 있습니다.",
		["mutator_CG22_longdesc"] = "PAYDAY 2 2022년 크리스마스 이벤트:\n\n하이스트에 나타나는 크리스마스 트리는 크리스마스 선물을 떨어뜨립니다. 크리스마스 선물은 하이스트 도중에 분쇄하여 일시적인 버프를 받거나, 하이루딘에게 주어 보너스 경험치, 현금 또는 컨티넨탈 코인를 얻을 수 있습니다. 둘 중 하나를 수행하면 일정 확률로 냉기 방사기를 사용하는 스노우맨 도저가 스폰합니다.",		

		["menu_cg22_post_objective_1_desc"] = "적 200명을 아무 저격총으로 처치하기.",
		["menu_cg22_post_objective_2_desc"] = "매우 어려움 이상 난이도에서 클로커 15명을 North Star 저격소총으로 처치하기.",
		["menu_cg22_post_objective_3_desc"] = "아무 난이도에서 North Star 소총으로 더블킬 50회 달성하기.",
		["menu_cg22_post_objective_4_desc"] = "아무 난이도에서 전리품 가방 10개 확보하기. (탈출에 성공해야 인정)",
		["menu_cg22_post_objective_5_desc"] = "오버킬 이상 난이도에서 불도저 10명 처치하기.",
		["menu_cg22_post_objective_6_desc"] = "아무 난이도에서 전리품 가방 25개 확보하기. (탈출에 성공해야 인정)",
		["menu_cg22_post_objective_7_desc"] = "아무 난이도에서 전리품 가방 50개 확보하기. (탈출에 성공해야 인정)",
		["menu_cg22_post_objective_8_desc"] = "오버킬 이상 난이도에서 불도저 20명 처치하기.",
		["menu_cg22_post_objective_9_desc"] = "아무 난이도에서 전리품 가방 75개 확보하기. (탈출에 성공해야 인정)",

		["mutator_piggybank"] = "돼지 먹이주기",
		["mutator_piggybank_desc"] = "적이 죽을 때 황금 돼지에게 먹이로 줄 꿀꿀이 가방을 떨어뜨립니다.",
		["mutator_piggybank_longdesc"] = "PAYDAY 2 9주년 기념 이벤트:\n\n적이 죽을 때 일정 확률로 꿀꿀이 가방을 떨어뜨립니다. 꿀꿀이 가방은 특정 하이스트에서 황금 돼지를 키우는 데 사용할 수 있는 일시적인 가방이며, 돼지가 클수록 하이스트가 끝날 때 더 많은 경험치와 돈을 보너스로 받을 수 있습니다.",		

		["mutator_piggyrevenge"] = "돼지의 복수",
		["mutator_piggyrevenge_desc"] = "적이 죽을 때 황금 돼지에게 먹이로 주고 버프를 받을 수 있는 꿀꿀이 가방을 떨어뜨립니다.",
		["mutator_piggyrevenge_longdesc"] = "PAYDAY 2 10주년 기념 이벤트:\n\n적이 죽을 때 일정 확률로 꿀꿀이 가방을 떨어뜨립니다. 꿀꿀이 가방은 특정 하이스트에서 황금 돼지를 키우고 버프를 받는 데 사용할 수 있는 일시적인 가방이며, 일정 확률로 화염방사기를 사용하는 피기 도저가 스폰합니다. 돼지가 클수록 하이스트가 끝날 때 더 많은 경험치와 돈을 보너스로 받을 수 있습니다.",		

		["menu_pda10_post_objective_3_desc"] = "아무 난이도에서 하이스트 25번 성공하기.",
		["menu_pda10_post_objective_5_desc"] = "저격소총으로 50명 처치하기.",
		["menu_pda10_post_objective_2_desc"] = "전리품 가방 50개 확보하기.",
		["menu_pda10_post_objective_6_desc"] = "근접 무기로 50명 처치하기.",
		["menu_pda10_post_objective_1_desc"] = "불도저 50명 처치하기.",
		["menu_pda10_post_objective_4_desc"] = "게이지 패키지 50개 모으기.",
		
		["mutator_bravos_only"] = "하드라인",
		["mutator_bravos_only_desc"] = "적을 탈출 차량 출발 이벤트에 대응하는 적으로 대체합니다.",
		["mutator_bravos_only_longdesc"] = "스크립트로 스폰하지 않는 적을 프로 잡의 탈출 차량 출발 이벤트와 동일한 스폰으로 대체합니다. FBI SWAT는 블루 SWAT을 대체하고 FBI SWAT을 주방위군 브라보 유닛으로 대체합니다.",
		["menu_bravo_replacement_choice"] = "대체 방식",
		["menu_mutator_bravo_replacement_all"] = "모든 유닛",
		["menu_mutator_bravo_replacement_random"] = "무작위 확률",
		["menu_mutator_bravo_replacement_slider"] = "대체 확률 (% 단위)",

		["mutator_zombie_outbreak"] = "데드 워킹",
		["mutator_zombie_outbreak_desc"] = "모든 적을 좀비 유닛으로 대체합니다.",
		["mutator_zombie_outbreak_longdesc"] = "죽은 자가 부활했습니다! 모든 적을 좀비 유닛으로 대체합니다.",

		["mutator_faction_override"] = "적 진영 오버라이드",
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
		["faction_selector_choice"] = "진영: ",

		--Crime Spree mutators
		["mutator_cloakercuff"] = "요술사",
		["mutator_cloakercuff_desc"] = "클로커의 근접 공격은 이제 플레이어에게 수갑을 채웁니다.",
		["mutator_cloakercuff_longdesc"] = "클로커의 근접 공격이 플레이어를 수갑 채워진 상태로 만듭니다.",
		
		["mutator_cloakerflashbang"] = "눈부신 닌자",
		["mutator_cloakerflashbang_desc"] = "클로커는 회피할 때 일정 확률로 섬광탄을 떨어뜨립니다.",
		["mutator_cloakerflashbang_longdesc"] = "클로커는 이제 회피 시 50% 확률로 섬광탄을 떨어뜨립니다.",
		
		["mutator_fartsmella"] = "\"살충제\" 보급품",
		["mutator_fartsmella_desc"] = "연막탄을 최루 가스로 대체합니다.",
		["mutator_fartsmella_longdesc"] = "적이 사용하는 연막탄은 최루 가스로 대체될 것입니다.\n\n주의: \"날 더 때려줘\" 뮤테이터의 연막탄은 대체하지 않습니다.",
		
		["mutator_kaboom"] = "카미카제",
		["mutator_kaboom_desc"] = "척탄병은 죽을 시 폭발합니다.",
		["mutator_kaboom_longdesc"] = "척탄병은 죽을 시 폭발합니다.",
		
		["mutator_fastresponse"] = "신속한 대응",
		["mutator_fastresponse_desc"] = "모든 경찰의 공세는 이제 최대 강도로 시작됩니다.",
		["mutator_fastresponse_longdesc"] = "모든 경찰의 공세는 이제 최대 강도로 시작됩니다.",
		
		["mutator_crazytaser"] = "테이저 과충전",
		["mutator_crazytaser_desc"] = "테이저 유닛이 플레이어를 스턴시키려고 할 때 더 이상 조준 지연이 발생하지 않습니다.",
		["mutator_crazytaser_longdesc"] = "테이저 유닛이 플레이어를 스턴시키려고 할 때 더 이상 조준 지연이 발생하지 않습니다.\n\n주의 : 스턴 시도 사이의 일반 재사용 대기시간은 계속 적용됩니다.",

		["mutator_masterdodger"] = "이것도 피해보시지!",
		["mutator_masterdodger_desc"] = "베테랑 경찰은 이제 모든 총알을 피할 수 있습니다.",
		["mutator_masterdodger_longdesc"] = "베테랑 경찰은 이제 모든 총알을 피할 수 있습니다.",
		
		["mutator_fullautoinbuilding"] = "광속 사수",
		["mutator_fullautoinbuilding_desc"] = "타이탄 저격수와 이에 상응하는 저격수는 이제 근거리에서 자동 사격으로 발사합니다.",
		["mutator_fullautoinbuilding_longdesc"] = "타이탄 저격수, 브라보 저격수는 근거리(10m 이내)에서 소총을 자동 사격으로 발사합니다.",
		
		["mutator_quickscope360"] = "독수리의 눈",
		["mutator_quickscope360_desc"] = "저격수가 소총을 조준하는 속도가 100% 빨라집니다.",
		["mutator_quickscope360_longdesc"] = "저격수가 소총을 조준하는 속도가 100% 빨라집니다.",
		
		["mutator_goldfarbdozers"] = "이중 문제",
		["mutator_goldfarbdozers_desc"] = "스폰되는 모든 불도저가 항상 쌍으로 배치됩니다.",
		["mutator_goldfarbdozers_longdesc"] = "스폰되는 모든 불도저가 항상 쌍으로 배치됩니다.",
		
		["mutator_spoocsquad"] = "비열한 분대",
		["mutator_spoocsquad_desc"] = "클로커는 그룹으로 스폰됩니다.",
		["mutator_spoocsquad_longdesc"] = "클로커는 그룹으로 스폰됩니다.",
		
		["mutator_vanilla_police_call"] = "침입자 경보",
		["mutator_vanilla_police_call_desc"] = "경찰 호출, 페이저, 카메라의 바닐라 기능을 활성화합니다.",
		["mutator_vanilla_police_call_longdesc"] = "경찰 호출, 페이저, 카메라의 바닐라 기능을 활성화합니다.",
		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "크라임 스프리는 무작위로 선택된 하이스트를 연속적으로 실행하는 무한 모드입니다. 하이스트를 완료할 때마다, 크라임 스프리 랭크와 보상이 증가합니다! 매 20번째와 26번째 랭크마다 게임 플레이의 변경 사항을 선택해야 하며, 매 100번째 랭크마다 리스크 레벨이 증가하여 이후 하이스트들이 점점 어려워지게 됩니다. 리스크 레벨이 600을 넘으면 플레이어가 가지고 있는 무적 프레임의 양이 감소하기 시작하고, 브라보 유닛이 기본으로 스폰하기 시작합니다.\n\n##만약 친구나 동료를 초대하려 한다면, 참가하기 전 반드시 그 사람들도 자신만의 크라임 스프리를 따로 시작해야만 랭크와 보상을 받을 수 있습니다.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "불도저의 최대 동시 스폰 수가 1명 더 증가합니다.",
		["menu_cs_modifier_medics"] = "메딕의 최대 동시 스폰 수가 1명 더 증가합니다.",
		["menu_cs_modifier_no_hurt"] = "적들이 넘어짐에 50% 저항을 가집니다.",
		["menu_cs_modifier_dozer_immune"] = "불도저가 폭발 피해를 50%만큼 덜 받습니다.",
		["menu_cs_modifier_bravos"] = "적이 브라보 유닛으로 대체될 확률이 6.667%만큼 증가합니다.",
		["menu_cs_modifier_grace"] = "피해 유예 시간이 60분의 1초로 감소합니다.",
		["menu_cs_modifier_letstrygas"] = "연막탄이 최루 가스로 대체됩니다.",
		["menu_cs_modifier_boomboom"] = "척탄병은 죽을 시 폭발합니다.",
		["menu_cs_modifier_friendlyfire"] = "팀원은 아군 사격으로부터 100%만큼의 피해를 입습니다.",
		["menu_cs_modifier_dodgethis"] = "베테랑 경찰은 이제 모든 총알을 피합니다.",
		["menu_cs_modifier_sniper_aim"] = "저격수가 소총을 조준하는 속도가 100% 빨라집니다.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "경소총 SWAT은 분대장 유닛과 함께 생성될 확률이 100%만큼 증가하고, 각 분대에 분대장 유닛이 한 명씩 더 스폰될 수 있습니다.",
		["menu_cs_modifier_heavy_sniper"] = "타이탄 저격수, 브라보 저격수는 근거리에서 소총을 자동 사격으로 발사합니다.",
		["menu_cs_modifier_dozer_medic"] = "불도저가 스폰될 때, 일정 확률로 그 유닛이 메딕 불도저로 교체됩니다. 메딕 불도저는 메딕과 불도저 두 가지로 동시 취급됩니다.",
		["menu_cs_modifier_dozer_minigun"] = "그린 혹은 블랙 불도저가 스폰될 때, 일정 확률로 그 유닛이 M1014으로 무장한 불도저로 교체됩니다.",
		["menu_cs_modifier_shield_phalanx"] = "일반 실드 유닛이 타이탄 실드로 교체될 확률이 15%만큼 더 증가합니다.",
		["menu_cs_modifier_taser_overcharge"] = "테이저 유닛이 플레이어를 스턴시키려고 할 때 더 이상 조준 지연이 발생하지 않습니다.",
		["menu_cs_modifier_dozer_rage"] = "불도저의 안면 보호구가 파괴되면, 불도저가 버서커 모드에 들어가며, 피해량이 기본 피해량의 10%만큼 증가합니다.",
		["menu_cs_modifier_medic_adrenaline"] = "모든 메딕 유닛이 진영에 따라 옴니아 LPF/D-145 시그마 플레이머로 교체될 확률이 15%만큼 더 증가합니다.",
		["menu_cs_modifier_cloaker_arrest"] = "클로커의 근접 공격은 이제 플레이어에게 수갑을 채웁니다.",
		["menu_cs_modifier_cloaker_smoke"] = "클로커는 이제 회피 시 50% 확률로 섬광탄을 떨어뜨립니다.",
		["menu_cs_modifier_cloaker_tear_gas"] = "모든 HRT 유닛이 ASU 유닛으로 교체될 확률이 15%만큼 더 증가합니다.",
		["menu_cs_modifier_dozer_lmg"] = "그린 혹은 블랙 불도저가 스폰될 때, 일정 확률로 그 유닛이 스컬 도저로 교체됩니다.",
		["menu_cs_modifier_10secondsresponsetime"] = "모든 경찰의 공세는 이제 최대 강도로 시작됩니다.",
		["menu_cs_modifier_dozerpairs"] = "스폰되는 모든 불도저가 항상 쌍으로 배치됩니다.",
		["menu_cs_modifier_spoocsquad"] = "클로커는 그룹으로 스폰됩니다.",

		["bm_menu_skill"] = "팀원 부스트",

		["menu_crew_interact"] = "신속",
		["menu_crew_interact_desc"] = "플레이어의 상호 작용 속도가 다른 AI가 한 명씩 있을 때마다 15% 빨라집니다.",

		["menu_crew_inspire"] = "인스파이어",
		["menu_crew_inspire_desc"] = "이 능력을 갖춘 봇은 이제 인스파이어 에이스 능력을 사용할 수 있습니다.\n\n90초마다 한 번만 사용하며, 다른 AI가 한 명씩 있을 때마다 쿨다운이 15초씩 감소합니다.",

		["menu_crew_scavenge"] = "탄환 절약",
		["menu_crew_scavenge_desc"] = "플레이어들의 탄약 획득량이 다른 AI가 한 명씩 있을 때마다 10%만큼 증가합니다.",

		["menu_crew_ai_ap_ammo"] = "관통탄",
		["menu_crew_ai_ap_ammo_desc"] = "당신의 팀 AI가 25%만큼 더 많은 피해를 가하는 관통 탄환을 사용합니다.\n\nAI의 탄환이 적의 방탄복을 관통하고 실드를 넘어뜨립니다.",

		["menu_crew_healthy"] = "강화자",
		["menu_crew_healthy_desc"] = "플레이어의 체력이 30만큼 증가합니다.",

		["menu_crew_sturdy"] = "수호자",
		["menu_crew_sturdy_desc"] = "플레이어의 방탄량이 10%만큼 증가합니다.",

		["menu_crew_evasive"] = "방해꾼",
		["menu_crew_evasive_desc"] = "플레이어의 회피 미터가 매 초마다 회피율의 3%씩 채워집니다.",

		["menu_crew_motivated"] = "활력꾼",
		["menu_crew_motivated_desc"] = "플레이어의 스태미나가 15만큼 증가합니다.",

		["menu_crew_regen"] = "치유자",
		["menu_crew_regen_desc"] = "플레이어가 매 4초마다 체력을 1 회복합니다.",

		["menu_crew_quiet"] = "은폐자",
		["menu_crew_quiet_desc"] = "플레이어의 기동성이 2만큼 증가합니다.",

		["menu_crew_generous"] = "비축자",
		["menu_crew_generous_desc"] = "플레이어의 매 70킬마다 투척 무기를 한 개씩 회수합니다.",

		["menu_crew_eager"] = "가속자",
		["menu_crew_eager_desc"] = "플레이어의 장전 속도가 10만큼 빨라집니다.",

	--[[   SKILLTREES   ]]--

		--[[   MASTERMIND   ]]--

			--[[   MEDIC SUBTREE   ]]--
				--Combat Medic
				["menu_combat_medic_beta_sc"] = "의무병",
				["menu_combat_medic_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 팀원을 되살리는 동안과 그 이후 #{skill_color}#$skill_value_b2##초간 #{skill_color}#$skill_value_b1##만큼의 피해 감소 효과를 받습니다.\n\n에이스: #{owned}#$pro##\n팀원을 되살릴 때 #{skill_color}#$skill_value_p1##만큼의 체력을 추가로 회복시켜서 되살립니다.",

				--Quick Fix
				["menu_tea_time_beta_sc"] = "응급 치료",
				["menu_tea_time_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 구급 키트와 의료 가방의 배치 시간이 #{skill_color}#$skill_value_b1##만큼 감소합니다.\n\n에이스: #{owned}#$pro##\n당신의 구급 키트와 의료 가방을 사용한 팀원은 #{skill_color}#$skill_value_p2##초간 #{skill_color}#$skill_value_p1##만큼의 피해 감소를 받습니다.",

				--Pain Killers
				["menu_fast_learner_beta_sc"] = "진통제",
				["menu_fast_learner_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 되살린 팀원은 #{skill_color}#$skill_value_b2##초간 #{skill_color}#$skill_value_b1##의 피해 감소 효과를 받습니다.\n\n에이스: #{owned}#$pro##\n피해 감소 효과가 추가로 #{skill_color}#$skill_value_p1##만큼 늘어납니다.",

				--Uppers
				["menu_tea_cookies_beta_sc"] = "각성제",
				["menu_tea_cookies_beta_desc_sc"] = "베이식: #{owned}#$basic##\n구급 키트를 #{skill_color}#$skill_value_b1##개 소지하고 배치할 수 있습니다.\n\n에이스: #{owned}#$pro##\n구급 키트를 #{skill_color}#$skill_value_b1##개 소지하고 배치할 수 있습니다.\n\n당신이 배치한 구급 키트로부터 반경 #{skill_color}#5##미터 안에서 쓰러진 당신 혹은 팀원을 구급 키트가 #{skill_color}#자동으로 되살립니다.## 자동 소생된 플레이어에게는 #{skill_color}#$skill_value_p2##초의 대기 시간이 주어집니다.\n\n#{risk}#주의: 구급 키트는 스완송 상태에 돌입되어 있는 플레이어를 소생시키지 않습니다.##",

				--Combat Doctor
				["menu_medic_2x_beta_sc"] = "군의관",
				["menu_medic_2x_beta_desc_sc"] = "베이식: #{owned}#$basic##\n의료 가방에 추가 의료품을 넣어 사용 횟수를 #{skill_color}#$skill_value_b1##번 더 늘려줍니다.\n\n에이스: #{owned}#$pro##\n의료 가방을 #{skill_color}#$skill_value_p1##개 소지하고 배치할 수 있습니다.",

				--Inspire
				["menu_inspire_beta_sc"] = "인스파이어",
				["menu_inspire_beta_desc_sc"] = "베이식: #{owned}#$basic##\n팀원을 되살리는 속도가 #{skill_color}#$skill_value_b1##만큼 상승합니다.\n\n팀원에게 소리치면 팀원의 이동 속도와 재장전 속도가 #{skill_color}#$skill_value_b3##초간 #{skill_color}#$skill_value_b2##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n장애물에 가려지지 않은 최대 #{skill_color}#9##미터 안에서 다운된 팀원에게 소리치면 되살립니다. 원거리 소생의 발동 대기 시간은 #{important_1}#$skill_value_p1##초입니다.",

			--[[   CONTROLLER SUBTREE   ]]--
				--Cable Guy
				["menu_triathlete_beta_sc"] = "케이블 가이",
				["menu_triathlete_beta_desc_sc"] = "베이식: #{owned}#$basic##\n케이블 타이의 소지량이 #{skill_color}#$skill_value_b1##개 늘어납니다.\n\n에이스: #{owned}#$pro##\n케이블 타이의 소지량이 #{skill_color}#$skill_value_p1##개 더 늘어납니다.\n\n탄약 상자에서 케이블 타이를 획득할 확률이 #{skill_color}#30%##로 상승합니다.",

				--Clowns are Scary
				["menu_cable_guy_beta_sc"] = "무서운 광대",
				["menu_cable_guy_beta_desc_sc"] = "베이식: #{owned}#$basic##\n시민들이 #{skill_color}#$skill_value_b1## 만큼 더 오래 겁을 먹습니다.\n\n에이스: #{owned}#$pro##\n당신의 제압의 범위와 제압력이 #{skill_color}#$skill_value_p1##만큼 상승합니다.",

				--Stockholm Syndrome
				["menu_joker_beta_sc"] = "스톡홀름 증후군",
				["menu_joker_beta_desc_sc"] = "베이식: #{owned}#$basic##\n쓰러진 동안 근처의 시민과 전환된 적을 #{skill_color}#부를 때 당신을 소생시키고## 탄약 상자를 줍니다.\n\n에이스: #{owned}#$pro##\n당신과 당신의 팀원은 인질 한 명당 #{skill_color}#$skill_value_p1##의 피해 감소 효과를 적용받으며, 최대 #{skill_color}#$skill_value_p2##번까지 중첩됩니다.\n\n#{risk}#주의: 여러 팀원이 이 스킬을 가지고 있을 경우 팀원 스킬의 효과와 중첩되지 않습니다.##",

				--Joker
				["menu_stockholm_syndrome_beta_sc"] = "조커",
				["menu_stockholm_syndrome_beta_desc_sc"] = "베이식: #{owned}#$basic##\n하이스트가 라우드로 진행될 때 항복한 일반 경찰 #{skill_color}#1##명을 당신을 위해 싸우게 만들 수 있습니다. 조커는 스킬 효과 및 구금 상태인 팀원을 풀기 위한 거래 목적으로 인질로 간주됩니다.\n\n당신이 전향한 적이 #{skill_color}#$skill_value_b1##만큼의 피해를 덜 받습니다.\n\n에이스: #{owned}#$pro##\n당신은 동시에 #{skill_color}#2##명의 전향한 적을 데리고 다닐 수 있습니다.\n\n당신이 전향한 적이 #{skill_color}#$skill_value_p1##만큼 피해를 추가적으로 덜 받습니다.",

				--Partners in Crime
				["menu_control_freak_beta_sc"] = "공범",
				["menu_control_freak_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 가진 인질 한 명당 당신의 이동 속도가 #{skill_color}#$skill_value_b1##만큼 상승하며, 최대 #{skill_color}#4##번까지 중첩됩니다.\n\n에이스: #{owned}#$pro##\n당신이 가진 인질 한 명당 당신의 체력이 #{skill_color}#$skill_value_p1##만큼 상승하며, 최대 #{skill_color}#4##번까지 중첩됩니다.",

				--Hostage Taker
				["menu_black_marketeer_beta_sc"] = "인질범",
				["menu_black_marketeer_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 가진 인질 한 명당 #{skill_color}#4##초마다 당신의 체력의 #{skill_color}#$skill_value_b1##만큼 체력을 회복하며, 최대 #{skill_color}#4##번까지 중첩됩니다.\n\n에이스: #{owned}#$pro##\n당신이 가진 인질이 #{skill_color}#4명 이상##일 때 이 스킬로 얻는 체력 회복량이 #{skill_color}#$skill_value_p1##만큼 증가합니다.\n\n당신이 묶어둔 시민 인질은 경찰들이 구조하여도 #{skill_color}#도망치려고 하지 않습니다.##\n\n경찰 공세 도중 당신이 구금되었을 경우, 당신의 인질은 #{skill_color}#스스로 자신을 거래하여## 당신이 안전하게 귀환할 수 있게 해줍니다.\n\n#{risk}#주의: 이 거래는 하이스트 도중## #{important_1}#1번만## #{risk}#발동됩니다.##",

			--[[   ASSAULT SUBTREE   ]]--
				--Leadership
				["menu_stable_shot_beta_sc"] = "리더십",
				["menu_stable_shot_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#기관총##의 안정성이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n당신과 당신의 팀원의 #{skill_color}#모든 무기##의 안정성이 #{skill_color}#$skill_value_p1##만큼 증가합니다.\n\n#{risk}#주의: 여러 팀원이 이 스킬을 가지고 있을 경우 팀원 스킬의 효과와 중첩되지 않습니다.##",

				--MG Handling
				["menu_scavenger_sc"] = "기관총 핸들링",
				["menu_scavenger_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#기관총##의 지향사격 명중률이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#기관총##의 지향사격 명중률이 #{skill_color}#$skill_value_p1##만큼 증가합니다.\n\n#{skill_color}#기관총##의 재장전 속도가 #{skill_color}#$skill_value_p2##만큼 빨라집니다.",

				--MG Specialist
				["menu_sharpshooter_sc"] = "기관총 전문가",
				["menu_sharpshooter_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#기관총##의 움직일 때 발생하는 명중률 페널티가 #{skill_color}#$skill_value_b1##만큼 감소합니다.\n\n움직일 때 발생하는 명중률 페널티는 안정성에 따라 수치가 정해집니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#기관총##의 발사 속도가 #{skill_color}#$skill_value_p1##만큼 빨라집니다.\n\n#{skill_color}#기관총##으로 방아쇠를 놓지 않고 발사할 때 #{skill_color}#5번째## 총알마다 탄을 소모하지 않습니다.",

				--Shock and Awe
				["menu_spotter_teamwork_beta_sc"] = "충격과 공포",
				["menu_spotter_teamwork_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#모든 무기##의 탄창 용량이 #{skill_color}#$skill_value_b1##발 증가합니다.\n\n#{risk}#주의:## #{important_1}#활이나 발사기에는## #{risk}#적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n탄창 용량의 증가량이 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.\n\n#{skill_color}#모든 무기##는 달리면서 지향 사격이 가능해지고 달리기 후 사격 딜레이가 제거됩니다.",

				--Heavy Impact
				["menu_speedy_reload_sc"] = "강력한 타격",
				["menu_speedy_reload_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#기관총##은 #{skill_color}#$skill_value_b1##의 확률로 적들이 휘청거리게 만듭니다.\n\n양각대를 사용하면 확률이 #{skill_color}#$skill_value_b2##만큼 증가합니다.\n\n#{risk}#주의:## #{important_1}#캡틴, 불도저, 저격수, 실드에게는 휘청거림 효과가 적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n웅크리고 있는 동안 #{skill_color}#$skill_value_p1##만큼의 피해를 덜 받습니다.\n\n양각대를 사용하면 피해 감소가 #{skill_color}#$skill_value_p2##만큼 증가합니다.",

				--Body Expertise
				["menu_body_expertise_beta_sc"] = "뿌리고 기도하기",
				["menu_body_expertise_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 무기들이 적의 방탄복을 관통하여 피해의 #{skill_color}#$skill_value_b1##를 가하며, #{skill_color}#기관총##의 경우 효과가 #{skill_color}#$skill_value_b2##로 증가합니다.\n\n이 효과는 무기가 이미 보유한 방탄복 관통력과 합산되며, 최대 100%까지 적용됩니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#기관총##을 자동 사격로 설정하여 방아쇠를 #{skill_color}#$skill_value_p1##초 이상 놓지 않고 적을 죽일 시 추가 피해를 #{skill_color}#$skill_value_p2##만큼 얻으며, 최대 #{skill_color}#$skill_value_p3##번까지 중첩됩니다.",


		--[[   ENFORCER   ]]--

			--[[   SHOTGUNNER SUBTREE   ]]--
				--Underdog--
				["menu_underdog_beta_sc"] = "언더독",
				["menu_underdog_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신을 중심으로 반경 #{skill_color}#18##미터 안에서 3명 이상의 적이 근처에 있을 때, 당신은 #{skill_color}#$skill_value_b2##초 동안 #{skill_color}#$skill_value_b1##만큼의 대미지 보너스를 받습니다.\n\n에이스: #{owned}#$pro##\n당신을 중심으로 반경 #{skill_color}#18##미터 안에서 3명 이상의 적이 근처에 있을 때, 당신은 #{skill_color}#$skill_value_p2##초 동안 #{skill_color}#$skill_value_p1##만큼의 피해 감소 효과를 받습니다.",

				--Shotgun CQB
				["menu_shotgun_cqb_beta_sc"] = "산탄총 CQB",
				["menu_shotgun_cqb_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총과 화염방사기##의 조준 속도와 달리기 후 사격 속도가 #{skill_color}#$skill_value_b1##만큼 빨라집니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#산탄총과 화염방사기##의 재장전 속도가 #{skill_color}#$skill_value_p1## 상승합니다.",
				["menu_shotgun_cqb_per_pellet_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총과 화염방사기##의 조준 속도와 달리기 후 사격 속도가 #{skill_color}#$skill_value_b1##만큼 빨라집니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#산탄총과 화염방사기##의 재장전 속도가 #{skill_color}#$skill_value_p1## 상승합니다.",

				--Shotgun Impact
				["menu_shotgun_impact_beta_sc"] = "산탄총 임팩트",
				["menu_shotgun_impact_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총과 화염방사기##의 안정성이 #{skill_color}#$skill_value_b1##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#산탄총##은 #{skill_color}#$skill_value_p1##발의 펠릿을 추가로 발사합니다.\n\n#{risk}#주의: 슬러그탄이나 폭발탄을 사용하는 산탄총에는 적용되지 않습니다.##",
				["menu_shotgun_impact_per_pellet_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총과 화염방사기##의 안정성이 #{skill_color}#$skill_value_b1##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#산탄총##의 최소 대미지가 #{skill_color}#$skill_value_p1##만큼 상승합니다.\n\n#{risk}#주의: 슬러그탄이나 폭발탄을 사용하는 산탄총에는 적용되지 않습니다.##",

				--Pigeon Shooting
				["menu_far_away_beta_sc"] = "비둘기 사수",
				["menu_far_away_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총##으로 여러 개의 발사체를 발사할 때, 각 발사체는 적 #{skill_color}#1##명을 관통할 수 있으며, 방탄복을 관통하여 피해의 #{skill_color}#$skill_value_b1##를 가합니다.\n\n이 효과는 #{skill_color}#산탄총##이 이미 보유한 방탄복 관통력과 합산되며, 최대 100%까지 적용됩니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#산탄총과 화염방사기##으로 조준 시의 명중률과 사거리가 #{skill_color}#$skill_value_p1##만큼 증가합니다.",

				--Gung Ho
				["menu_close_by_beta_sc"] = "겅호",
				["menu_close_by_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총과 화염방사기##는 달리면서 지향 사격이 가능해지고 달리기 후 사격 딜레이가 제거됩니다.\n\n에이스: #{owned}#$pro##\n지향 사격할 때 #{skill_color}#산탄총과 화염방사기##의 발사 속도가 #{skill_color}#$skill_value_p1##만큼 증가합니다.",

				--Overkill
				["menu_overkill_sc"] = "오버킬",
				["menu_overkill_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#산탄총, 화염방사기 또는 OVE9000 전기톱##으로 대미지 감소 시작되기 전 직접적인 피해로 적을 처치하면 #{skill_color}#$skill_value_b2##초간 최대 대미지가 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n#{risk}#주의:## #{important_1}#폭발물이나 지속 피해에 의해 발동되지 않으며 이에 영향을 주지 않습니다.##\n\n에이스: #{owned}#$pro##\n이제 대미지 증가가 #{skill_color}#모든 무기##에 적용되며 대신 #{skill_color}#$skill_value_p1##초 동안 지속됩니다.\n\n#{risk}#주의:## #{important_1}#발사기에는## #{risk}#대미지 보너스가 적용되지 않습니다.##\n\n#{skill_color}#산탄총, 화염방사기, OVE9000 전기톱##의 꺼내고 집어넣는 속도가 #{skill_color}#$skill_value_p2##만큼 더 빨라집니다.",

			--[[   JUGGERNAUT SUBTREE   ]]--
				--Stun Resistance--
				["menu_oppressor_beta_sc"] = "기절 저항력",
				["menu_oppressor_beta_desc_sc"] = "베이식: #{owned}#$basic##\n적의 근접 공격에 의해 밀려나는 당신이 보유한 방탄량 당 #{skill_color}#$skill_value_b1##만큼씩 감소합니다.\n\n에이스: #{owned}#$pro##\n섬광탄을 맞았을 때, 섬광탄 효과의 지속 시간이 #{skill_color}#$skill_value_p1##만큼 감소합니다.",

				--Die Hard
				["menu_show_of_force_sc"] = "다이 하드",
				["menu_show_of_force_desc_sc"] = "베이식: #{owned}#$basic##\n당신은 #{skill_color}#$skill_value_b1##만큼의 굴절도를 얻습니다.\n\n굴절도는 최대 #{skill_color}#$deflection##까지 받는 체력 피해를 감소시키며, 다른 형태의 피해 감소 후에 적용됩니다.\n\n에이스: #{owned}#$pro##\n당신은 #{skill_color}#$skill_value_b1##만큼의 굴절도를 추가로 얻습니다.",

				--Transporter
				["menu_pack_mule_beta_sc"] = "트랜스포터",
				["menu_transporter_beta_desc_sc"] = "베이식: #{owned}#$basic##\n가방을 운반할 때의 이동 속도 페널티가 보유한 매 ##10##의 방탄량마다 #{skill_color}#$skill_value_b1##씩 감소합니다.\n\n에이스: #{owned}#$pro##\n어떤 가방을 운반할 때도 달릴 수 있습니다.\n\n#{risk}#주의: 가방의 이동 속도 패널티는 여전히 적용됩니다.##",

				--More Blood to Bleed--
				["menu_iron_man_beta_sc"] = "아직 흘릴 피가 남아 있어",
				["menu_iron_man_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신은 #{skill_color}#$skill_value_b1##만큼의 추가 체력을 얻습니다.\n\n에이스: #{owned}#$pro##\n당신은 추가로 #{skill_color}#$skill_value_b1##만큼의 추가 체력을 얻습니다.",

				--Bullseye--
				["menu_prison_wife_beta_sc"] = "불스아이",
				["menu_prison_wife_beta_desc_sc"] = "베이식: #{owned}#$basic##\n헤드샷 시 #{skill_color}#$skill_value_b1##만큼의 방탄량을 회복하고, 발동 대기 시간은 #{important_1}#$skill_value_b2##초 입니다.\n\n헤드샷으로 적을 죽일 시 발동 대기 시간을 #{skill_color}#$skill_value_b3##초씩 감소시킵니다. $anarc_disable\n\n에이스: #{owned}#$pro##\n헤드샷 시 #{skill_color}#$skill_value_b1##만큼의 방탄량을 추가로 회복합니다.\n\n발동 대기 시간 감소량이 추가로 #{skill_color}#$skill_value_p2##초 증가합니다. $anarc_disable\n\n",

				--Iron Man
				["menu_juggernaut_beta_sc"] = "아이언맨",
				["menu_juggernaut_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#개량형 복합 전술 조끼##를 착용할 수 있게 됩니다.\n\n방패를 든 적에게 근접 공격을 하면 방패를 든 적이 엄청난 힘으로 인해 휘청거립니다.\n\n#{risk}#주의:## #{important_1}#타이탄 실드와 캡틴 윈터스에게는## #{risk}#휘청거림 효과가 적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n방탄복의 회복 속도가 #{skill_color}#$skill_value_p1##만큼 빨라집니다. $anarc_disable\n\n실드를 휘청거리게 하는 능력이 원거리 무기에도 적용되고, 무기의 총 피해량이 높을수록 확률이 높아집니다.",

			--[[   SUPPORT SUBTREE   ]]--
				--Scavenger
				["menu_scavenging_sc"] = "재활용꾼",
				["menu_scavenging_desc_sc"] = "베이식: #{owned}#$basic##\n탄약 상자의 회수 범위가 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n매 #{skill_color}#$skill_value_p1##번째로 죽은 적이 탄약 상자를 추가로 제공합니다.",

				--Bulletstorm--
				["menu_ammo_reservoir_beta_sc"] = "탄환 폭풍",
				["menu_ammo_reservoir_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 설치한 탄약 가방을 사용한 플레이어는 탄약을 보충한 이후 최대 #{skill_color}#5##초간 탄약을 소비하지 않고 무기를 발사할 수 있습니다.\n\n한 번에 탄약을 더 많이 보충할 수록 지속 시간이 길어집니다.\n\n#{risk}#주의:## #{important_1}#고폭탄을 사용하는 무기와 발사기는## #{risk}#해당 스킬 효과를 받지 않습니다.##\n\n에이스: #{owned}#$pro##\n효과의 최대 지속 시간을 #{skill_color}#15##초 증가시킵니다.",

				--Specialist Equipment formally Rip and Tear
				["menu_portable_saw_beta_sc"] = "장비 전문가",
				["menu_portable_saw_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#OVE9000 톱##을 사용할 때의 소모량을 #{skill_color}#50%##만큼 감소시킵니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#OVE9000 톱, 활, 발사기##의 재장전 속도가 #{skill_color}#$skill_value_p1##만큼 상승합니다.",

				--Extra Lead
				["menu_ammo_2x_beta_sc"] = "추가 탄약",
				["menu_ammo_2x_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 탄약 가방 한 개로부터 #{skill_color}#$skill_value_b1##만큼의 탄약을 추가로 보충할 수 있습니다.\n\n에이스: #{owned}#$pro##\n탄약 가방의 소지 개수를 #{skill_color}#$skill_value_p1##개로 늘려줍니다.",

				--Rip and Tear formally Carbon Blade
				["menu_carbon_blade_beta_sc"] = "찢고 죽이기",
				["menu_carbon_blade_beta_desc_sc"] = "베이식: #{owned}#$basic##\n이제 당신의 #{skill_color}#OVE9000 휴대용 전기톱##으로 실드를 뚫을 수 있습니다.\n\n에이스: #{owned}#$pro##\n적을 #{skill_color}#OVE9000 톱, 활, 발사기##로 처치하면 #{skill_color}#$skill_value_p1##의 확률로 주변 #{skill_color}#$skill_value_p2##미터 안의 적에게 공포감을 퍼트립니다.\n\n공포감은 적들이 잠시 동안 엄청난 두려움에 떨게 만듭니다.",

				--Fully Loaded--
				["menu_bandoliers_beta_sc"] = "준비만전",
				["menu_bandoliers_desc_sc"] = "베이식: #{owned}#$basic##\n모든 무기의 총 탄약량이 #{skill_color}#$skill_value_b1.##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n탄약 상자에서 #{skill_color}#$skill_value_p1##만큼 탄약을 더 얻을 수 있습니다.\n\n탄약 상자에서 투척 무기를 회수할 수 있는 기본 확률이 #{skill_color}#$skill_value_p2##만큼 증가합니다. 투척 무기를 회수하지 못할 때마다 확률이 #{skill_color}#$skill_value_p3##씩 증가하고, 투척 무기를 회수했을 경우 기본 확률로 초기화됩니다.\n\n#{risk}#주의: 재생 또는 대기 시간 기반의 투척 무기는 집을 수 업습니다.##",

		--[[   TECHNICIAN   ]]--

			--[[   FORTRESS SUBTREE   ]]--
				--Logistician
				["menu_defense_up_beta_sc"] = "로지스티션",
				["menu_defense_up_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 모든 장비를 배치하는 속도가 #{skill_color}#$skill_value_b1##만큼 빨라집니다.\n\n에이스: #{owned}#$pro##\n당신의 모든 장비를 배치하는 속도가 #{skill_color}#$skill_value_p1##만큼 더 빨라집니다.\n당신의 팀원의 모든 장비를 배치하는 속도가 #{skill_color}#$skill_value_p2##만큼 빨라집니다.\n\n#{risk}#주의: 여러 팀원이 이 스킬을 가지고 있을 경우 팀원 스킬의 효과와 중첩되지 않습니다.##",
	
				--Nerves of Steel--
				["menu_fast_fire_beta_sc"] = "강철의 의지",
				["menu_fast_fire_beta_desc_sc"] = "베이식: #{owned}#$basic##\n최후의 저항 상태에서 #{still color}#조준기를 사용할 수 있습니다.##\n\n에이스: #{owned}#$pro##\n오프젝트와 상호 작용 중 받는 피해를 #{skill_color}#$skill_value_p1##만큼 감소시킵니다.",
	
				--Engineering
				["menu_eco_sentry_beta_sc"] = "엔지니어링",
				["menu_eco_sentry_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 센트리 건의 체력이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n당신의 센트리 건의 체력이 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.",
	
				--Jack of all Trades
				["menu_jack_of_all_trades_beta_sc"] = "팔방미인",
				["menu_jack_of_all_trades_beta_desc_sc"] = "베이식: #{owned}#$basic##\n투척물의 소지량이 #{skill_color}#$skill_value_b1##개 늘어납니다.\n\n#{risk}#주의: 특성 덱의 투척물에는 적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n#{skill_color}#당신은 이제 주 장비와 함께 보조 장비를 같이 소지할 수 있습니다.## 주 장비와 보조 장비를 교체하려면 #{skill_color}#$BTN_CHANGE_EQ##키를 누르십시오.\n\n보조 장비는 주 장비의 #{important_1}#50%##만큼의 양을, 최소 #{skill_color}#1##개까지 소지합니다.",
	
				--Sentry Tower Defense--
				["menu_tower_defense_beta_sc"] = "타워 디펜스",
				["menu_tower_defense_beta_desc_sc"] = "베이식: #{owned}#$basic##\n이제 센트리 건에 연사속도가 #{skill_color}#66%##만큼 감소하지만, 적과 방패를 관통하는 #{skill_color}#철갑탄##을 사용하도록 설정할 수 있습니다.\n\n에이스: #{owned}#$pro##\n센트리 건의 최대 소지 개수가 #{skill_color}#$skill_value_p1##개 늘어납니다.\n\n센트리 건을 배치할 때 드는 최대 탄약이 #{skill_color}#35%##만큼 소모됩니다.",
	
				--Bulletproof--
				["menu_iron_man_sc"] = "방탄갑옷",
				["menu_iron_man_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 방탄복은 더 이상 관통되지 않습니다.\n\n#{risk}#주의: 자기 피해에는 적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n방탄량이 가득 찬 경우, 최대 방탄량의 #{skill_color}#$skill_value_p1##에 해당하는 수치만큼 피해를 덜 받습니다.\n\n당신의 방탄량 회복 속도를 #{skill_color}#$skill_value_p2##만큼 상승시킵니다. $anarc_disable",

			--[[   BREACHER SUBTREE   ]]--
				--Silent Drilling--
				["menu_hardware_expert_beta_sc"] = "무소음 드릴링",
				["menu_hardware_expert_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 설치한 #{skill_color}#드릴과 톱이 소리를 내지 않습니다.## 시민과 경비가 경보를 울리려면 드릴이나 톱을 직접 목격해야만 합니다.\n\n에이스: #{owned}#$pro##\n당신이 드릴과 톱을 고치는 속도가 #{skill_color}#$skill_value_p1##만큼 상승합니다.",
	
				--Demoman
				["menu_trip_mine_expert_beta_sc"] = "데모맨",
				["menu_combat_engineering_desc_sc"] = "베이식: #{owned}#$basic##\n성형작약탄을 #{skill_color}#6##개 설치할 수 있습니다.\n\n성형작약탄과 트립 마인의 설치 속도를 #{skill_color}#$skill_value_b1##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n성형작약탄을 #{skill_color}8##개 설치할 수 있습니다.\n\n트립 마인의 폭발 반경이 #{skill_color}#$skill_value_p1##만큼 증가합니다.",
	
				--Drill Sawgeant
				["menu_drill_expert_beta_sc"] = "드릴 교관",
				["menu_drill_expert_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 드릴과 톱의 효율성이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n당신의 드릴과 톱의 효율성이 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.",
	
				--Fire Trap--
				["menu_more_fire_power_sc"] = "화염 함정",
				["menu_more_fire_power_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 설치한 트립 마인은 폭발 시 #{skill_color}#10##초 동안 폭발한 지점을 중심으로 #{skill_color}#7.5##미터 반경의 범위에 화염을 퍼트립니다.\n\n트립 마인으로 퍼트린 화염은 자가 피해나 아군에게 피해를 가하지 않습니다.\n\n에이스: #{owned}#$pro##\n트립 마인을 #{skill_color}#10##개 소지하고 설치할 수 있습니다.\n\n트립 마인의 피해량이 #{skill_color}#50%##만큼 더 증가합니다.",
	
				--Expert Hardware
				["menu_kick_starter_beta_sc"] = "하드웨어 전문가",
				["menu_kick_starter_beta_desc_sc"] = "베이식: #{owned}#$basic##\n드릴과 톱이 고장나면 #{skill_color}#$skill_value_b1##의 확률로 자동으로 재시작합니다.\n\n에이스: #{owned}#$pro##\n드릴과 톱이 고장나면 #{skill_color}#$skill_value_p1##의 추가 확률로 자동으로 재시작합니다.\n\n당신의 드릴과 톱을 멈추게 할려는 적은 #{skill_color}#$skill_value_p2##의 확률로 전기 충격을 받아 방해 행동을 멈춥니다.",
	
				--Kickstarter
				["menu_fire_trap_beta_sc"] = "킥스타터",
				["menu_fire_trap_beta_desc_sc"] = "베이식: #{owned}#$basic##\n고장난 드릴과 톱을 근접 공격으로 때려서 바로 수리할 수 있습니다.\n\n드릴이나 톱이 고장날 때마다 #{skill_color}#75%##의 성공률를 가진 기회를 #{skill_color}#한 번##씩 얻습니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#상호작용을 하는 동안 더 이상 무기를 놓지 않습니다.##\n\n상호작용 키를 계속 누르고 상호작용 범위 내에 머물러 있는 상태에서 상호작용을 멈추지 않고도 자유롭게 주변을 둘러보거나, 조준하거나, 무기를 사용할 수 있습니다.",

			--[[   COMBAT ENGINEER SUBTREE   ]]--
				--Sharpshooter--
				["menu_discipline_sc"] = "명사수",
				["menu_discipline_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##의 안정성이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#소총##을 단발 또는 점사로 설정한 상태로 헤드샷을 하여 적을 죽이면 #{skill_color}#$skill_value_p2##초 동안 발사 속도가 #{skill_color}#$skill_value_p1##만큼 빨라집니다.",

				--Rifleman--
				["menu_rifleman_sc"] = "라이플맨",
				["menu_rifleman_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##의 명중률과 사거리가 조준 시 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#소총##의 명중률과 사거리가 조준 시 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.\n\n#{skill_color}#소총##의 조준 속도와 달리기 후 사격 속도가 #{skill_color}#$skill_value_p2##만큼 상승합니다.",

				--Kilmer--
				["menu_heavy_impact_beta_sc"] = "킬머",
				["menu_heavy_impact_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##의 움직일 때 발생하는 명중률 페널티가 #{skill_color}#$skill_value_b1##만큼 감소합니다.\n\n움직일 때 발생하는 명중률 페널티는 안정성에 따라 수치가 정해집니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#소총##의 재장전 속도가 #{skill_color}#$skill_value_p1##만큼 빨라집니다.",

				--Ammo Efficiency--
				["menu_single_shot_ammo_return_sc"] = "효율적인 탄약 활용",
				["menu_single_shot_ammo_return_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##으로 #{skill_color}#$skill_value_b2##초 안에 헤드샷으로 적을 죽이는데 #{skill_color}#$skill_value_b1##번 성공하면 사용한 무기에 최대 탄약량의 #{skill_color}#$skill_value_b3##와 최소 #{skill_color}#1##발을 되돌려줍니다.\n\n에이스: #{owned}#$pro##\n이제 이 효과는 #{skill_color}#$skill_value_p1##초 이내에 헤드샷으로 적을 죽이는데 #{skill_color}#$skill_value_p2##번 성공했을 때 발동됩니다.",

				--Aggressive Reload--
				["menu_engineering_beta_sc"] = "공격적 재장전",
				["menu_engineering_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##을 단발 또는 점사로 설정한 상태로 헤드샷을 하여 적을 죽이면 #{skill_color}#$skill_value_b2##초간 재장전 속도가 #{skill_color}#$skill_value_b1##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n재장전 속도 보너스가 #{skill_color}#$skill_value_p1##만큼 증가하고 발사 모드와 관계없이 발동할 수 있습니다.",

				--Mind Blown, formerly Explosive Headshot--
				["menu_kilmer_sc"] = "마인드 블로우",
				["menu_kilmer_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#소총##을 단발 또는 점사로 설정한 상태로 헤드샷을 성공하면 #{skill_color}#$skill_value_b2##미터 반경 안에 가장 가까운 적에게 가한 피해의 #{skill_color}#$skill_value_b1##만큼을 가합니다.\n\n적으로부터 #{skill_color}#$skill_value_b3##미터 떨어져 있을 때마다 효과가 다른 적에게도 연쇄적으로 연결되며, 최대 #{skill_color}#$skill_value_b4##명까지 연결합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#소총##을 단발로 설정한 상태로 헤드샷을 성공하면 #{skill_color}#대미지 감소가 없어지고## 연쇄 효과의 반경이 #{skill_color}#$skill_value_p1##미터만큼 증가합니다.\n\n적으로부터 #{skill_color}#$skill_value_b3##미터 떨어져 있을 때마다 연쇄 효과의 피해량이 #{skill_color}#$skill_value_p2##만큼 추가로 가하며, 최대 피해량은 가한 피해량의 #{skill_color}#$skill_value_p3##입니다.",

		--[[   GHOST   ]]--

			--[[   SHINOBI SUBTREE   ]]--
				--Alert--
				["menu_jail_workout_sc"] = "경계",
				["menu_jail_workout_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 표시한 적의 표시되는 시간이 #{skill_color}#100%##만큼 더 오래 지속합니다.\n\n에이스: #{owned}#$pro##\n당신의 #{skill_color}#40##미터 내에 있는 경비원, 특수, 엘리트 적을 조준하면 #{skill_color}#자동으로 표시합니다.##\n\n#{risk}#주의: 경비병은 스텔스 중에만 표시할 수 있습니다.##",

				--Sixth Sense--
				["menu_chameleon_beta_sc"] = "식스 센스",
				["menu_chameleon_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#3.5##초 동안 움직이지 않으면, 당신의 #{skill_color}#10##미터 반경에 있는 모든 사람을 #{skill_color}#자동으로 표시합니다.##\n\n에이스: #{owned}#$pro##\n#{skill_color}#모든 내부자 관련 애셋##을 구매할 수 있습니다.",

				--ECM Overdrive--
				["menu_cleaner_beta_sc"] = "ECM 오버드라이브",
				["menu_cleaner_beta_desc_sc"] = "베이식: #{owned}#$basic##\n이제 ECM 재머를 사용해서 #{skill_color}#특정 문을 열 수 있습니다.##\n\n에이스: #{owned}#$pro##\nECM 재머와 피드백의 지속 시간을 #{skill_color}#25%##만큼 증가시킵니다.\n\n##페이저 응답 신호가 ECM 재머에 의해 지연됩니다.##",

				--Nimble--
				["menu_second_chances_beta_sc"] = "날렵함",
				["menu_second_chances_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신은 #{skill_color}#조용히 금고의 자물쇠를 직접 손으로 딸 수 있습니다.##\n\n모든 컴퓨터, 해킹, 카메라, ECM의 상호작용 속도가 #{skill_color}#30%##만큼 더 빨라집니다.\n\n에이스: #{owned}#$pro##\n당신이 모든 자물쇠를 따는 속도가 #{skill_color}#50%##만큼 상승합니다.\n\n모든 컴퓨터, 해킹, 카메라, ECM의 상호작용 속도가 추가로 #{skill_color}#50%##만큼 더 빨라집니다.",

				--ECM Specialist--
				["menu_ecm_booster_beta_sc"] = "ECM 전문가",
				["menu_ecm_booster_beta_desc_sc"] = "베이식: #{owned}#$basic##\nECM 재머를 #{skill_color}#3##개 소지합니다.\n\n에이스: #{owned}#$pro##\nECM 재머를 #{skill_color}#4##개 소지합니다.",

				--Spotter--
				["menu_ecm_2x_beta_sc"] = "스포터",
				["menu_ecm_2x_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 표시한 적은 #{risk}#$skill_value_b2##미터보다 더 멀리 있을 때 #{skill_color}#$skill_value_b1##만큼의 대미지를 더 받습니다.\n\n에이스: #{owned}#$pro##\n당신이 표시한 적은 #{skill_color}#모든 거리##에서 #{skill_color}#$skill_value_p1##만큼의 대미지를 추가로 더 받습니다.",

			--[[   ARTFUL DODGER SUBTREE   ]]--
				--Duck and Cover--
				["menu_sprinter_beta_sc"] = "엄폐의 중요성",
				["menu_sprinter_beta_desc_sc"] = "베이식: #{owned}#$basic##\n스태미나가 회복할 때까지 걸리는 시간이 #{skill_color}#25%##만큼 감소하고, 스태미나의 회복 속도가 #{skill_color}#25%##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n웅크리는 동안 회피 미터가 초당 #{skill_color}#$skill_value_p1##만큼씩 채워집니다.\n\n웅크리고 동안 이동 속도가 #{skill_color}#$skill_value_p2##만큼 증가합니다.",

				--Evasion--
				["menu_awareness_beta_sc"] = "위기모면",
				["menu_awareness_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 이동속도가 #{skill_color}#$skill_value_b1##만큼 추가로 상승합니다.\n\n낙하 피해가 #{skill_color}#$skill_value_b2##만큼 감소합니다.\n\n에이스: #{owned}#$pro##\n당신은 #{skill_color}#달리면서 무기를 재장전할 수 있습니다.##\n\n#{item_stage_2}#달리기 재장전 취소를 허용하는 설정은 레스토레이션 모드의 추가 옵션에서 찾을 수 있습니다.##",

				--Deep Pockets--
				["menu_thick_skin_beta_sc"] = "속주머니",
				["menu_thick_skin_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 근접 무기의 기동성이 #{skill_color}#2##만큼 상승합니다.\n\n에이스: #{owned}#$pro##\n모든 방탄조끼류의 기동성이 #{skill_color}#2##만큼 상승합니다.",

				--Moving Target--
				["menu_dire_need_beta_sc"] = "움직이는 표적",
				["menu_dire_need_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 착용감이 #{risk}#$skill_value_b3##부터 #{risk}#$skill_value_b2##포인트만큼 감소할 때마다 이동 속도가 #{skill_color}#$skill_value_b1##만큼 추가로 상승합니다. 최대 이동 속도 상승률은 #{skill_color}#$skill_value_b4##입니다.\n\n조준하는 동안 이동 속도가 #{skill_color}#$skill_value_b5##만큼 더 빨라집니다.\n\n#{risk}#주의: 조준하는 동안의 이동 속도는 현재 자세의 최대 속도로 제한됩니다.##\n\n에이스: #{owned}#$pro##\n당신의 착용감이 #{risk}#$skill_value_p3##부터 #{risk}#$skill_value_p2##포인트만큼 감소할 때마다 이동 속도가 #{skill_color}#$skill_value_p1##만큼 추가로 상승합니다. 최대 이동 속도 상승률은 #{skill_color}#$skill_value_p4##입니다.\n\n달리는 동안에는 회피 게이지가 초당 #{skill_color}#$skill_value_p5##만큼 채워지고, 짚라인을 타는 동안에는 회피 게이지가 초당 #{skill_color}#$skill_value_p6##만큼 채워집니다.",

				--Shockproof
				["menu_insulation_beta_sc"] = "절연갑옷",
				["menu_insulation_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#더 이상 전기 충격에 당해도 강제로 사격을 하지 않게 되며## 테이저의 전기 공격이 #{skill_color}#$skill_value_b2##의 확률로 역효과를 일으켜 테이저를 넘어트리게 만듭니다.\n\n#{risk}#주의: 전기 충격으로 인한 명중률과 반동 패널티는 여전히 적용됩니다.##\n\n적의 총격으로 인한 밀쳐지는 강도가 #{skill_color}#$skill_value_b1##만큼 감소합니다.\n\n에이스: #{owned}#$pro##\n테이저에 맞은 후 #{skill_color}#$skill_value_p1##초 이내에 테이저와 상호작용하면 테이저를 #{skill_color}#역감전시키고## 테이저의 최대 체력의 #{skill_color}#$skill_value_p2##만큼 피해를 가합니다.\n\n타이탄 테이저의 공격의 감속 효과와 지속 시간이 #{skill_color}#50%##만큼 감소합니다.",

				--Sneaky Bastard--
				["menu_jail_diet_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 착용감이 #{risk}#$skill_value_b3##부터 #{risk}#$skill_value_b2##포인트만큼 감소할 때마다 회피 포인트가 #{skill_color}#$skill_value_b1##만큼 상승합니다. 최대 회피 상승률은 #{skill_color}#$skill_value_b4##입니다.\n\n에이스: #{owned}#$pro##\n당신의 착용감이 #{risk}#$skill_value_b3##부터 #{risk}#$skill_value_p2##포인트만큼 감소할 때마다 회피 포인트가 #{skill_color}#$skill_value_b1##만큼 상승합니다. 최대 회피 상승률은 #{skill_color}#$skill_value_b4##입니다.\n\n당신의 방탄량이 고갈될 때 적에게 가해지는 첫 번째 타격은 회피 미터를 최대 체력의 #{skill_color}#$skill_value_p2##만큼 회복시킵니다.",

			--[[   CONTRACT KILLER SUBTREE   ]]--
			--FORMERLY "SILENT KILLER"
				--Second Wind
				["menu_scavenger_beta_sc"] = "새로운 활력",
				["menu_scavenger_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 방탄량이 고갈될 때, 당신의 이동 속도가 #{skill_color}#$skill_value_b2##초간 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n당신의 방탄량이 완전히 고갈될 때 적에게 가해지는 첫 번째 타격이 적을 휘청거리게 만듭니다.\n\n효과가 방탄복이 회복되고 #{skill_color}#$skill_value_p1##초가 지날 때까지 지속됩니다.",

				--Optical Illusions--
				["menu_optic_illusions_sc"] = "착시 현상",
				["menu_optic_illusions_desc_sc"] = "베이식: #{owned}#$basic##\n무기의 꺼내고 집어넣는 시간이 #{skill_color}#$skill_value_b1##만큼 빨라집니다.\n\n에이스: #{owned}#$pro##\n모든 무기의 기동성이 #{skill_color}#$skill_value_p1##만큼 증가합니다.",

				--The Professional--
				["menu_silence_expert_beta_sc"] = "프로페셔널",
				["menu_silence_expert_beta_desc_sc"] = "베이식: #{owned}#$basic##\n조준 속도와 달리기 후 사격 속도가 #{skill_color}#$skill_value_b1##만큼 빨라집니다.\n\n에이스: #{owned}#$pro##\n조준 속도와 달리기 후 사격 속도가 #{skill_color}#$skill_value_b1##만큼 더 빨라집니다.\n\n비폭발성 원거리 무기로 죽은 특수 및 엘리트 적이 #{skill_color}#탄약 상자를 추가로 제공합니다.##",

				--Unseen Strike, formally Dire Need--
				["menu_backstab_beta_sc"] = "기습 공격",
				["menu_backstab_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#$skill_value_b1##초간 피해를 입지 않으면, 이후 피해를 입을 때까지 #{skill_color}#$skill_value_b2##만큼의 치명타 확률을 가집니다.\n\n치명타 발생 시 #{skill_color}#50%##만큼 추가 피해를 가합니다.\n\n에이스: #{owned}#$pro##\n치명타 확률이 피해를 입은 뒤 #{skill_color}#$skill_value_p1##초가 지날 때까지 지속됩니다.",

				--Cleaner--
				["menu_hitman_beta_sc"] = "청소부",
				["menu_hitman_beta_desc_sc"] = "베이식: #{owned}#$basic##\n특수 및 엘리트 적에게 #{skill_color}#$skill_value_b1##만큼의 추가 피해를 가합니다.\n\n#{risk}#주의:## #{important_1}#발사기에는## #{risk}#적용되지 않습니다.##\n\n에이스: #{owned}#$pro##\n특수 및 엘리트 적에게 #{skill_color}#$skill_value_p1##만큼의 추가 피해를 더 가합니다.\n\n헤드샷으로 적을 처치하면 회피 미터가 #{skill_color}#$skill_value_p2##만큼 채워집니다.\n\n적의 뒤에서 적을 처치하면 회피 미터가 #{skill_color}#$skill_value_p3##만큼 채워지고, 헤드샷 처치 시 얻는 회피율과 함께 중첩됩니다.\n\n#{risk}#주의:## #{important_1}#폭발물, 불 또는 지속 피해 효과를 사용하여## #{risk}#적을 처치해도 회피를 얻을 수 없습니다.##",

				--Low Blow--
				["menu_unseen_strike_beta_sc"] = "로 블로",
				["menu_unseen_strike_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 착용감이 #{risk}#$skill_value_b3##부터 #{risk}#$skill_value_b2##포인트만큼 감소할 때마다 치명타 확률이 #{skill_color}#$skill_value_b1##만큼 상승합니다. 최대 치명타는 #{skill_color}#$skill_value_b4##입니다.\n\n치명타 발생 시 #{skill_color}#50%##만큼 추가 피해를 가합니다.\n\n에이스: #{owned}#$pro##\n당신의 착용감이 #{risk}#$skill_value_p3##부터 #{risk}#$skill_value_p2##포인트만큼 감소할 때마다 치명타 확률이 #{skill_color}#$skill_value_p1##만큼 상승합니다. 최대 치명타는 #{skill_color}#$skill_value_p4##입니다.\n\n적의 뒤에서 총이나 근접 공격으로 공격할 때 치명타 확률이 #{skill_color}#$skill_value_p5##만큼 추가로 증가합니다.",

		--[[   FUGITIVE   ]]--

			--[[   GUNSLINGER SUBTREE   ]]--
				--Equilibrium--
				["menu_equilibrium_beta_sc"] = "이퀄리브리엄",
				["menu_equilibrium_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신과 당신의 팀원의 #{skill_color}#권총##의 안정성이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#권총##의 꺼내고 집어넣는 시간이 #{skill_color}#$skill_value_p1##만큼 빨라집니다.",

				--Gun Nut--
				["menu_dance_instructor_sc"] = "총기광",
				["menu_dance_instructor_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#권총##의 지향사격 명중률이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#권총##의 발사 속도가 #{skill_color}#$skill_value_p1##만큼 빨라집니다.\n\n#{skill_color}#권총##은 방탄복을 관통하여 피해의 #{skill_color}#$skill_value_p2##만큼 가합니다.",

				--Over Pressurized/Gunfighter--
				["menu_gun_fighter_sc"] = "총싸움꾼",
				["menu_gun_fighter_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#권총##의 재장전 속도를 #{skill_color}#$skill_value_b1##만큼 상승시킵니다.\n\n#{skill_color}#권총##의 움직일 때 발생하는 명중률 페널티가 #{skill_color}#$skill_value_b2##만큼 감소합니다.\n\n움직일 때 발생하는 명중률 페널티는 안정성에 따라 수치가 정해집니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#권총##의 재장전 속도를 #{skill_color}#$skill_value_b1##만큼 더 상승시킵니다.",

				--Akimbo--
				["menu_akimbo_skill_sc"] = "아킴보",
				["menu_akimbo_skill_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#아킴보## 무기의 안정성이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n#{skill_color}#아킴보## 무기의 명중률이 #{skill_color}#$skill_value_p1##만큼 증가합니다.",

				--Desperado--
				["menu_expert_handling_sc"] = "데스페라도",
				["menu_expert_handling_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#권총##으로 헤드샷을 맞힐 때마다 #{skill_color}#$skill_value_b2##초간 #{skill_color}#$skill_value_b1##만큼 명중률과 사거리가 상승합니다.\n\n이 효과는 최대 #{skill_color}#$skill_value_b3##번까지 중첩되며, 각 중첩의 지속시간은 헤드샷을 맞힐 때마다 새로 고침됩니다.\n\n에이스: #{owned}#$pro##\n명중률과 사거리 증가 지속시간이 #{skill_color}#$skill_value_p1##초로 증가합니다.",

				--Trigger Happy--
				["menu_trigger_happy_beta_sc"] = "난사광",
				["menu_trigger_happy_beta_desc_sc"] = "베이식: #{owned}#$basic##\n#{skill_color}#권총##으로 헤드샷을 맞힐 때마다 #{skill_color}#$skill_value_b2##초간 #{skill_color}#$skill_value_b1## 대미지 부스트를 받습니다.\n\n이 효과는 최대 #{skill_color}#$skill_value_b3##번까지 중첩되며, 각 중첩의 지속시간은 헤드샷을 맞힐 때마다 새로 고침됩니다.\n\n에이스: #{owned}#$pro##\n대미지 부스트의 지속 시간이 #{skill_color}#$skill_value_p1##초로 증가하고, 최대 중첩 수가 #{skill_color}#$skill_value_p2##번으로 증가합니다.",

			--[[   REVENANT SUBTREE   ]]--
				--Running From Death--
				["menu_nine_lives_beta_sc"] = "죽음으로부터의 도주",
				["menu_nine_lives_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 되살아난 뒤, #{skill_color}#$skill_value_b2##초간 이동 속도가 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n당신이 되살아난 뒤, #{skill_color}#$skill_value_p2##초간 #{skill_color}#$skill_value_p1##만큼의 피해 감소 효과를 받습니다.\n\n당신이 되살아난 뒤, 무기가 즉시 재장전됩니다.",

				--Undying--
				["menu_running_from_death_beta_sc"] = "불멸",
				["menu_running_from_death_beta_desc_sc"] = "베이식: #{owned}#$basic##\n최후의 저항 상태일 때의 체력이 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n최후의 저항 상태일 때의 체력이 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.\n\n최후의 저항 상태일 때도 주 무기를 사용할 수 있습니다.",

				--What Doesn't Kill You Only Makes You Stronger--
				["menu_what_doesnt_kill_beta_sc"] = "죽이지 않는 것",
				["menu_what_doesnt_kill_beta_desc_sc"] = "베이식: #{owned}#$basic##\n구금 상태에 가까워질 때마다 #{skill_color}#$skill_value_b1##만큼의 받는 피해가 감소합니다.\n\n에이스: #{owned}#$pro##\n항상 #{skill_color}#$skill_value_p1##만큼의 받는 피해가 추가로 감소합니다.",

				--Swan Song
				["menu_perseverance_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 체력이 #{skill_color}#0##이 되었을 때, 당신은 바로 쓰러지지 않고, 스완송 상태에 돌입하여 #{skill_color}#$skill_value_b1##초간 #{skill_color}#60%##의 이동속도 페널티를 받으며 싸울 수 있습니다.\n\n#{risk}#주의: 스완송 상태에 들어가면 효과가 종료되는 즉시 쓰러지게 됩니다.##\n\n에이스: #{owned}#$pro##\n당신은 #{skill_color}#$skill_value_p1##초간 더 오래 싸울 수 있습니다.",

				--Haunt--
				["menu_haunt_sc"] = "저주",
				["menu_haunt_desc_sc"] = "베이식: #{owned}#$basic##\n구금 상태에 가까워질 때마다 주변 #{skill_color}#18##미터 안의 적을 처치하면 #{skill_color}#$skill_value_b1##의 확률로 #{skill_color}#12##미터 내의 적에게 공포감을 퍼트립니다.\n\n공포감은 적들이 잠시 동안 엄청난 두려움에 떨게 만듭니다.\n\n에이스: #{owned}#$pro##\n적의 처치로 인한 공포감 발생 확률이 항상 #{skill_color}#$skill_value_p1##만큼 증가합니다.",

				--Messiah--
				["menu_pistol_beta_messiah_sc"] = "메시아",
				["menu_pistol_beta_messiah_desc_sc"] = "베이식: #{owned}#$basic##\n최후의 저항 상태에서, 적을 처치하면 메시아 충전이 채워지고 점프를 하여 스스로 부활할 수 있습니다. 사용 횟수는 #{skill_color}#1##번이며 구금 상태에서 벗어날 때마다 사용 횟수가 초기화됩니다.\n\n하이스트 도중 구금 상태에 이르기 전에 다운될 수 있는 횟수가 #{skill_color}#1##회 더 증가합니다.\n\n에이스: #{owned}#$pro##\n이제 메시아 충전을 무한으로 가지지만 #{important_1}#120##초의 대기 시간이 생깁니다. 최후의 저항 상태에서 적을 처치하면 대기 시간이 #{skill_color}#10##초씩 감소합니다.",

			--[[   BRAWLER SUBTREE   ]]--
				--Martial Arts--
				["menu_martial_arts_beta_sc"] = "무술의 달인",
				["menu_martial_arts_beta_desc_sc"] = "베이식: #{owned}#$basic##\n당신이 받는 모든 근접 공격의 피해가 #{skill_color}#$skill_value_b1##만큼 감소합니다.\n\n에이스: #{owned}#$pro##\n당신이 근접 공격으로 적을 넘어뜨릴 확률이 #{skill_color}#$skill_value_p1##만큼 증가합니다.\n\n근접 무기의 녹다운은 근접 공격으로 적을 휘청거리게 하는 것과 불도저의 장갑판과 바이저를 깨는 데 얼마나 많은 피해량을 가하는지를 결정합니다.",

				--Counter-Strike--
				["menu_drop_soap_beta_sc"] = "카운터 스트라이크",
				["menu_drop_soap_beta_desc_sc"] = "베이식: #{owned}#$basic##\n근접 무기를 충전하고 있을 때 클로커의 점프킥에 반격하여 클로커를 넘어뜨릴 수 있습니다.\n\n클로커 발차기와 테이저 전기 충격에 #{skill_color}#20%##만큼의 받는 피해가 감소합니다.\n\n에이스: #{owned}#$pro##\n이제 근접 무기를 충전하고 있을 때 클로커의 돌진 킥에 반격하여 클로커를 넘어뜨릴 수 있습니다.\n\n근접 무기를 충전하는 동안 원거리 공격에 #{skill_color}#10%##만큼의 받는 피해가 감소합니다.\n\n클로커 발차기와 테이저 전기 충격에 #{skill_color}#30%##만큼의 받는 피해가 추가로 감소합니다.",

				--Pumping Iron--
				["menu_steroids_beta_sc"] = "펌핑 아이언",
				["menu_steroids_beta_desc_sc"] = "베이식: #{owned}#$basic##\n근접 무기의 휘두르거나 충전하는 속도가 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n근접 무기의 휘두르거나 충전하는 속도가 #{skill_color}#$skill_value_p1##만큼 더 증가합니다.",

				--Bloodthirst--
				["menu_bloodthirst_sc"] = "피의 갈증",
				["menu_bloodthirst_desc_sc"] = "베이식: #{owned}#$basic##\n적을 근접 공격으로 처치할 때마다, #{skill_color}#$skill_value_b2##초 동안 장전 속도가 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n에이스: #{owned}#$pro##\n근접 무기를 제외한 다른 무기로 적을 처치할 때마다 다음 근접 공격의 대미지가 #{skill_color}#25%##만큼 증가하며 최대 #{skill_color}#100%##까지 증가합니다.\n\n이 효과는 근접 공격으로 적을 공격할 때 초기화됩니다.",

				--Frenzy--
				["menu_wolverine_beta_sc"] = "광분",
				["menu_wolverine_beta_desc_sc"] = "베이식: #{owned}#$basic##\n체력이 최대치에 가까울수록 치유량이 최대 #{important_1}#30%##까지 감소합니다.\n\n쓰러질 위험이 가까울수록 굴절도가 최대 #{skill_color}#$skill_value_b1##만큼 증가합니다.\n\n굴절도는 최대 #{skill_color}#$deflection##까지 받는 체력 피해를 감소시키며, 다른 형태의 피해 감소 후에 적용됩니다.\n\n에이스: #{owned}#$pro##\n치유량이 최대 #{important_1}#75%##까지 감소하지만 굴절도를 최대 #{skill_color}#$skill_value_p1##만큼까지 증가시킬 수 있습니다.",

				--Berserker--
				["menu_frenzy_sc"] = "버서커",
				["menu_frenzy_desc_sc"] = "베이식: #{owned}#$basic##\n당신의 체력에 반비례하여, 대미지를 추가로 가합니다.\n\n당신의 체력이 #{skill_color}#100%##이하일 경우, 근접 공격과 전기톱의 대미지가 최대 #{skill_color}#$skill_value_b1##까지 상승합니다.\n\n에이스: #{owned}#$pro##\n당신의 체력에 반비례하여, 대미지를 추가로 가합니다.\n\n당신의 체력이 #{skill_color}#100%##이하인 경우, 원거리 무기의 대미지가 최대 #{skill_color}#$skill_value_p1##만큼 상승합니다.\n\n#{risk}#주의:## #{important_1}#발사기에는## #{risk}#적용되지 않습니다.##"


	})

		local butt = math.rand(1)
		local frame = 0.01
		if Month == "4" and Day == "1" then
			frame = 1
		end
		if registeredloser or not easterless and butt <= frame then
			LocalizationManager:add_localized_strings({	
				["menu_st_spec_23"] = "헬민스",
				["menu_st_spec_23_desc"] = "당신이 안식을 취할 적에, 당신을 양육하는 건 누구이옵나이까? 날마다, 날마다, 또 날마다, 싸움의 상처로 얼룩진 당신의 틀을 치유하는 것은 누구이옵나이까? 동족으로 이루어진 당신의 육신에 끝없는 힘과 활력을 불어넣는 것은 누구의 양분이옵나이까?\n\n\n#{important_1}#나 이외에는 없나이다.##",
				["menu_difficulty_sm_wish"] = "강철의 길",
				["menu_risk_sm_wish"] = "강철의 길. 콘클레이브를 마스터하고 도전을 추구하는 사람들을 위한 난이도입니다."
			})
		end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "회피율",
		["menu_st_category_activated"] = "활성화 가능",
		["menu_st_category_challenge"] = "와일드 카드",
		["menu_st_category_mod"] = "모드",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "헤드샷 대미지가 #{skill_color}#25%## 증가합니다.\n\n당신은 추가로 #{skill_color}#25%##만큼의 대미지를 더 줍니다.\n\n#{risk}#주의:## #{important_1}#투척 무기, 발사기에는## #{risk}#대미지 증가가 적용되지 않습니다.##",
		["menu_deckall_4_desc_sc"] = "방탄복의 기동성이 #{skill_color}#1##만큼 증가합니다.\n\n방탄복으로 인해 발생하는 속도 감소 효과가 #{skill_color}#15%##만큼 감소합니다.\n\n하이스트를 끝낼 때마다 얻는 경험치가 #{skill_color}#45%##만큼 증가합니다.\n\n당신은 추가로 #{skill_color}#25%##만큼의 대미지를 더 줍니다.\n\n#{risk}#주의:## #{important_1}#투척 무기, 발사기에는## #{risk}#대미지 증가가 적용되지 않습니다.##",
		["menu_deckall_6_desc_sc"] = "하이스트 도중 당신과 당신의 팀원이 투척물을 보충할 수 있는 #{skill_color}#투척물 가방##을 소지할 수 있게 됩니다.\n\n당신은 추가로 #{skill_color}#25%##만큼의 대미지를 더 줍니다.\n\n#{risk}#주의:## #{important_1}#투척 무기, 발사기에는## #{risk}#대미지 증가가 적용되지 않습니다.##",
		["menu_deckall_8_desc_sc"] = "의료 가방과 상호 작용하는 속도를 #{skill_color}#20%##만큼 상승시킵니다.\n\n당신은 추가로 #{skill_color}#25%##만큼의 대미지를 더 줍니다.\n\n#{risk}#주의:## #{important_1}#투척 무기, 발사기에는## #{risk}#대미지 증가가 적용되지 않습니다.##",

		--Crook--
		["menu_deck6_1_desc_sc"] = "당신의 회피율을 ##$perk_value_1##포인트만큼 상승시킵니다.\n\n방탄조끼류의 방탄량이 ##$perk_value_2##만큼 증가합니다.",
		["menu_deck6_3_desc_sc"] = "방탄조끼류의 회피율이 추가로 ##$perk_value_1##포인트만큼 더 상승합니다.",
		["menu_deck6_5_desc_sc"] = "방탄조끼류의 방탄량이 추가로 ##$perk_value_1##포인트만큼 더 상승합니다.\n\n당신이 자물쇠를 따는 속도를 ##$perk_value_2##만큼 상승시킵니다.",
		["menu_deck6_7_desc_sc"] = "방탄조끼류의 회피율이 추가로 ##$perk_value_1##포인트만큼 더 상승합니다.",
		["menu_deck6_9_desc_sc"] = "방탄조끼류의 방탄량이 추가로 ##$perk_value_1##포인트만큼 더 상승합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Rogue
		["menu_deck4_1_desc_sc"] = "당신의 회피율을 ##$perk_value_1##포인트만큼 상승시킵니다.\n\n무기 전환 속도가 ##$perk_value_2## 증가합니다.",
		["menu_deck4_3_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck4_5_desc_sc"] = "되살아났을때 회피 미터가 기본 최대치의 ##200%##까지 채워집니다.\n\n카메라 루프의 지속 시간이 ##20##초 증가합니다.",
		["menu_deck4_7_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck4_9_desc_sc"] = "공격을 희피한 뒤 ##$perk_value_2##초 동안 체력을 초당 ##$perk_value_1##만큼씩 회복시킵니다. 이 효과는 중첩될 수 있지만 체력 피해를 입을 때마다 모든 중첩이 손실됩니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Hitman--
		["menu_deck5_1_sc"] = "건푸",
		["menu_deck5_3_sc"] = "훈련된 암살자",
		["menu_deck5_5_sc"] = "연필과 함께",
		["menu_deck5_7_sc"] = "전문 암살자",

		["menu_deck5_1_desc_sc"] = "근접 무기를 제외한 다른 무기로 적을 처치하면 #{skill_color}#$perk_value_1##만큼의 체력이 저장되며, 최대 #{risk}#$perk_value_2##만큼의 체력을 저장할 수 있습니다.\n\n근접 무기로 적을 처치하면 저장된 체력이 일시적인 체력으로 바뀌며, 이 체력은 초당 #{important_1}#$perk_value_3##씩 서서히 감소합니다.\n\n임시 체력은 기본 최대 체력을 초과할 수 있지만, 한 번에 최대 #{risk}#$perk_value_4##만큼의 임시 체력을 가질 수 있습니다.",
		["menu_deck5_3_desc_sc"] = "방탄복이 회복되었을 때 회피 게이지가 회피율의 ##$perk_value_1##까지 채워집니다.\n\n회피 포인트가 추가로 ##$perk_value_2##만큼 더 증가합니다.",
		["menu_deck5_5_desc_sc"] = "임시 체력을 ##$perk_value_1##만큼 더 저장할 수 있습니다.\n\n인벤토리에 시체 가방을 ##$perk_value_2##개 더 소지합니다.",
		["menu_deck5_7_desc_sc"] = "되살아났을때 임시 체력을 ##$perk_value_1##까지 얻습니다.\n\n회피 포인트가 추가로 ##$perk_value_2##만큼 더 증가합니다.",
		["menu_deck5_9_desc_sc"] = "일시 체력을 가지고 있는 동안, 굴절도가 ##$perk_value_1##만큼 증가하고, 이동 속도가 추가로 ##$perk_value_2##만큼 더 빨라집니다.\n\n굴절도는 최대 ##$perk_value_3##까지 받는 체력 피해를 감소시키며, 다른 형태의 피해 감소 후에 적용됩니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Muscle
		["menu_deck2_1_desc_sc"] = "당신의 체력을 ##$perk_value_1##만큼 증가시킵니다.",
		["menu_deck2_3_desc_sc"] = "당신의 체력을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.\n\n당신의 회피율을 ##$perk_value_2##포인트만큼 상승시킵니다.",
		["menu_deck2_5_desc_sc"] = "당신의 체력을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_2##만큼 빨라집니다.",
		["menu_deck2_7_desc_sc"] = "모든 무기로 발사할 때마다 ##$perk_value_1##의 확률로 근처의 적에게 공포감을 퍼트립니다.\n\n공포감은 적들이 잠시 동안 엄청난 두려움에 떨게 만듭니다.\n\n당신의 회피율을 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.",
		["menu_deck2_9_desc_sc"] = "당신의 체력을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.\n\n되살아났을때 최대 체력의 ##$perk_value_2##만큼 회복합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Crew Chief
		["menu_deck1_3_desc_sc"] = "당신과 당신의 팀원의 스태미나를 #{skill_color}#$perk_value_1##만큼 증가시킵니다.\n\n#{risk}#주의: 팀원의 특성 덱과 중첩되지 않습니다.##\n\n고함의 범위를 #{skill_color}#$perk_value_2##만큼 증가시킵니다.\n\n당신의 회피율을 #{skill_color}#5##포인트만큼 상승시킵니다.",
		["menu_deck1_5_desc_sc"] = "당신의 체력을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.\n\n당신의 팀원의 체력이 ##$perk_value_2##만큼 증가합니다.\n\n주의: 팀원의 특성 덱과 중첩되지 않습니다.\n\n당신이 페이저를 응답하는 속도가 ##$perk_value_3##만큼 빨라집니다.",
		["menu_deck1_7_desc_sc"] = "당신의 방탄량을 ##$perk_value_1##만큼 중가시킵니다.\n\n당신의 회피율을 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.",
		["menu_deck1_9_desc_sc"] = "당신과 당신의 팀원은 인질 한 명당 ##$perk_value_1##만큼의 최대 체력이 증가하고 ##$perk_value_2##만큼의 스태미나가 증가합니다. 이 효과는 ##$perk_value_3##명의 인질까지 적용됩니다.\n\n주의: 팀원의 특성 덱과 중첩되지 않습니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "당신의 방탄량을 ##$perk_value_1##만큼 증가시킵니다.",
		["menu_deck3_3_desc_sc"] = "당신의 방탄량을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.",
		["menu_deck3_5_desc_sc"] = "당신의 방탄량을 추가로 ##$perk_value_1##만큼 더 증가시킵니다.\n\n시체 가방의 소지 수가 ##$perk_value_2##개 증가합니다.",
		["menu_deck3_7_desc_sc"] = "당신의 방탄량 회복 속도를 ##$perk_value_1##만큼 상승시킵니다.",
		["menu_deck3_9_desc_sc"] = "당신의 방탄량 회복 속도를 추가로 ##$perk_value_1##만큼 더 상승시킵니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "당신의 회피율을 ##$perk_value_1##포인트만큼 상승시킵니다.\n\n앉아있을 때 회피 미터가 초당 ##$perk_value_2##만큼씩 채웁니다.",
		["menu_deck7_3_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck7_5_desc_sc"] = "앉아있을 때 회피 미터가 초당 추가로 ##$perk_value_1##만큼씩 더 채워집니다.\n\n앉아있을 때 이동 속도가 ##$perk_value_2##만큼 증가합니다.",
		["menu_deck7_7_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck7_9_desc_sc"] = "당신의 방탄량 회복 속도를 ##$perk_value_1##만큼 상승시킵니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "적에게서 얻는 탄약에서 의약품도 같이 회수합니다. 탄약을 회수할 때마다 #{skill_color}#$perk_value_1##에서 #{skill_color}#$perk_value_2##만큼의 체력을 회복합니다.\n\n치료의 발동 대기 시간은 #{important_1}#$perk_value_3##초이지만, 탄약 상자를 획득할 때마다 대기 시간이 #{skill_color}#$perk_value_4##초에서 #{skill_color}#$perk_value_5##초씩 감소합니다.",
		["menu_deck10_3_desc_sc"] = "탄약을 회수할 때마다, 당신의 팀원도 탄약 회수량의 ##$perk_value_1##만큼 탄약을 회수합니다.\n\n당신의 회피율을 ##$perk_value_2##포인트만큼 상승시킵니다.",
		["menu_deck10_5_desc_sc"] = "탄약 상자의 회복량이 #{skill_color}#$perk_value_1##에서 ##$perk_value_2##만큼 증가합니다.\n\n당신이 탄약으로 체력을 회복할 때마다, 회피 미터가 ##$perk_value_3##만큼 채워집니다.\n\n당신이 페이저를 응답하는 속도가 ##$perk_value_4##만큼 빨라집니다.",
		["menu_deck10_7_desc_sc"] = "당신이 탄약으로 체력을 회복할 때마다, 당신의 팀원도 당신이 회복한 체력량의 ##$perk_value_1##만큼 체력을 회복합니다.\n\n당신의 회피율을 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.",
		["menu_deck10_9_desc_sc"] = "탄약 상자의 회복량이 #{skill_color}#$perk_value_1##에서 ##$perk_value_2##만큼 증가합니다.\n\n당신이 탄약으로 체력을 회복할 때마다, 방탄량을 ##$perk_value_1##만큼 회복합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",
		["menu_deck10_7"] = "수상한 의약품",
		["menu_deck10_9"] = "잠겨있는 의약품",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "##$perk_value_1##미터 안에 적이 존재할 때, ##$perk_value_2##만큼의 피해 감소 효과를 받습니다.",
		["menu_deck8_3_desc_sc"] = "##$perk_value_1##미터 안에 적이 존재할 때, ##$perk_value_2##만큼의 추가적 피해 감소 효과를 더 받습니다.\n\n당신의 회피율을 ##$perk_value_3##포인트만큼 상승시킵니다.",
		["menu_deck8_5_desc_sc"] = "##$perk_value_1##미터 안에 적이 존재할 때, ##$perk_value_2##만큼의 추가적 피해 감소 효과를 더 받습니다.\n\n근접 무기로 적을 때릴 때마다 근접 무기의 대미지가 ##$perk_value_4##초 동안 또는 빗나갈 때까지 ##$perk_value_3##만큼 증가하며, 최대 ##$perk_value_5##번까지 중첩됩니다.\n\n카메라 루프의 지속 시간이 ##$perk_value_6##초 증가합니다.",
		["menu_deck8_7_desc_sc"] = "근접 무기로 적을 때릴 때마다 근접 무기의 대미지가 ##$perk_value_2##초 동안 또는 빗나갈 때까지 추가로 ##$perk_value_1##만큼 더 증가하며, 최대 ##$perk_value_3##번까지 중첩됩니다.\n\n당신의 회피율을 추가로 ##$perk_value_4##포인트만큼 더 상승시킵니다.",
		["menu_deck8_9_desc_sc"] = "근접 무기로 적을 때릴 때마다 ##$perk_value_2##초 동안 ##$perk_value_1##만큼의 체력을 회복하며, 최대 ##$perk_value_3##번까지 중첩됩니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Sociopath--
		["menu_deck9_1_sc"] = "잡담 금지",
		["menu_deck9_1_desc_sc"] = "##$perk_value_1##미터 안에 3명 이상의 적이 존재할 때, ##$perk_value_2##만큼의 피해 감소 효과를 받습니다.",
		["menu_deck9_3_desc_sc"] = "적을 처치하면 #{skill_color}#$perk_value_1##만큼의 방탄량을 회복합니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_2##초입니다. 대기 시간 도중 적을 처치할 때마다 대기 시간이 #{skill_color}#$perk_value_3##초씩 감소하고, 근접 공격으로 적을 처치할 경우 추가로 #{skill_color}#$perk_value_4##초씩 더 감소합니다.\n\n적 처치로 활성화된 대기 시간이 없어지면 해당 특성 효과가 발동되고 대기 시간이 다시 시작됩니다.\n\n당신의 회피율을 ##$perk_value_5##포인트만큼 상승시킵니다.",
		["menu_deck9_5_desc_sc"] = "근접 무기로 적을 처치하면 ##$perk_value_1##만큼의 체력을 회복합니다.##$perk_value_1##\n\n해당 특성은 효과가 발동되지 않았더라도 긴장(3번 카드)와 발동 대기 시간을 공유합니다.\n\n인벤토리에 시체 가방을 ##$perk_value_2##개 더 소지합니다.",
		["menu_deck9_7_desc_sc"] = "##$perk_value_1##미터 안에 있는 적을 처치하면 ##$perk_value_2##만큼의 방탄량을 회복하고, 근접 무기로 처치하면 두 배로 회복합니다.\n\n해당 특성은 효과가 발동되지 않았더라도 긴장(3번 카드)와 발동 대기 시간을 공유합니다.\n\n당신의 회피율을 추가로 ##$perk_value_3##포인트만큼 더 상승시킵니다.",
		["menu_deck9_9_desc_sc"] = "##$perk_value_1##미터 안에 있는 적을 처치하면 ##$perk_value_2##의 확률로 ##$perk_value_3##미터 안에 있는 적에게 공포감을 퍼트리고, 근접 무기로 처치하면 확률이 두 배로 증가합니다.\n\n공포감은 적들이 잠시 동안 엄청난 두려움에 떨게 만듭니다.\n\n해당 특성은 효과가 발동되지 않았더라도 긴장(3번 카드)와 발동 대기 시간을 공유합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "적에게 대미지를 가하면 #{skill_color}#$perk_value_2##초동안 매 초마다 #{skill_color}#$perk_value_1##만큼의 체력을 회복합니다. 이 효과는 #{skill_color}#$perk_value_3##번 중첩됩니다.\n중첩은 #{risk}#방편복##를 입을 때만 적용되며, #{important_1}#$perk_value_4##초마다 한 번씩만 적용됩니다.\n방편복의 방탄력이 #{important_1}#$perk_value_5##만큼 감소하지만 방편복의 기동성이 #{skill_color}#$perk_value_6##만큼 증가합니다.\n\n#{risk}#주의: 센트리 또는 지속 피해 효과로 적에게 피해를 가해도 중첩을 얻을 수 없습니다.##",
		["menu_deck11_3_desc_sc"] = "중첩이 매 초마다 체력을 추가로 ##$perk_value_1##만큼 더 회복시킵니다.",
		["menu_deck11_5_desc_sc"] = "중첩의 지속 시간이 추가로 ##$perk_value_1##초 더 지속합니다.\n\n시체 가방의 소지 수가 ##$perk_value_2##개 증가합니다.",
		["menu_deck11_7_desc_sc"] = "중첩이 매 초마다 체력을 추가로 ##$perk_value_1##만큼 더 회복시킵니다.",
		["menu_deck11_9_desc_sc"] = "중첩 하나당 이동 속도가 ##$perk_value_1##만큼 빨라집니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "당신의 방탄량이 남아있는 동안, 당신이 적을 처치할 때마다 ##$perk_value_1##만큼의 체력을 저장합니다.\n\n당신의 방탄량이 완전히 고갈되어 재생되기 시작하면, 당신은 당신이 저장했던 체력량만큼 체력을 회복합니다.\n\n저장할 수 있는 최대 체력량은 당신이 착용한 방탄복에 따라 달라지며, 두터운 방탄복일수록 경량 방탄복보다 적은 체력을 저장합니다.",
		["menu_deck13_3_desc_sc"] = "적을 처치할 때 저장되는 체력량을 ##$perk_value_1##만큼 증가시킵니다.\n\n당신의 회피율을 ##$perk_value_2##포인트만큼 상승시킵니다.",
		["menu_deck13_5_desc_sc"] = "저장할 수 있는 최대 체력량을 ##$perk_value_1##만큼 증가시킵니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_2##만큼 더 오랫동안 위협을 받습니다.",
		["menu_deck13_7_desc_sc"] = "적을 처치할 때 저장되는 체력량을 ##$perk_value_1##만큼 증가시킵니다.\n\n당신의 회피율을 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.",
		["menu_deck13_9_desc_sc"] = "당신이 적을 사살할 때마다 착용한 방탄복에 따라 방탄량 회복 속도가 빨라집니다. 무거운 방탄복은 가벼운 방탄복보다 방탄량 회복 속도 보너스가 적습니다. 이 보너스는 방탄복이 재생성되는 순간 원래대로 돌아갑니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "당신이 가한 대미지는 최대 ##$perk_value_1##까지 히스테리아 스택으로 변환됩니다.\n\n히스테리아 스택:\n매 ##$perk_value_3##의 히스테리아당 ##$perk_value_2##만큼의 받는 피해가 감소합니다. 히스테리아 스택은 매 ##8##초마다 ##$perk_value_4##씩 감소합니다.",
		["menu_deck14_3_desc_sc"] = "당신의 팀원도 히스테리아 스택의 효과를 받습니다.\n\n여러 팀원으로부터 나오는 히스테리아 스택은 중첩되지 않으며, 가장 많은 피해 감소량을 제공하는 팀원의 수치만 적용됩니다.\n\n당신의 회피율을 ##$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck14_5_desc_sc"] = "히스테리아 스택의 감소치가 매 ##$perk_value_2##초마다 ##$perk_value_1## 감소하는 것으로 바뀝니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_2##만큼 더 오랫동안 위협을 받습니다.",
		["menu_deck14_7_desc_sc"] = "이제 매 ##$perk_value_2##의 히스테리아당 ##$perk_value_1##만큼 받는 피해가 더 감소합니다.\n\n당신의 회피율을 추가로 ##$perk_value_3##포인트만큼 더 상승시킵니다.",
		["menu_deck14_9_desc_sc"] = "당신에게 적용되는 히스테리아 스택의 피해 감소 효과가 ##$perk_value_1## 더 증가합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Anarchist--
		["menu_st_spec_15"] = "아나키스트", --there's a random space at the end of the original string
		["menu_deck15_1_desc_sc"] = "전투에서 벗어난 뒤 방탄복을 완전히 회복하는 대신, 아나키스트는 주기적으로 매 초마다 방탄력을 #{skill_color}#8##씩 회복합니다. 방탄복이 두터울수록 간격당 더 많은 방탄량을 회복하지만, 회복이 일어나는 간격이 길어집니다.\n\n#{risk}#주의: 이 특성 덱을 사용하는 동안은 방탄복 회복 속도를 높이거나 방탄복 재생과 관련된 방탄복 회복 대기 시간 감소가 있는 스킬과 특성 덱의 효과는 비활성화됩니다.##",
		["menu_deck15_3_desc_sc"] = "최대 체력이 #{risk}#$perk_value_1## 감소하고 감소한 수치의 #{skill_color}#$perk_value_2##가 방탄량으로 전환되어 추가됩니다.",
		["menu_deck15_5_desc_sc"] = "최대 체력이 #{risk}#$perk_value_1## 감소하고 감소한 수치의 #{skill_color}#$perk_value_2##가 방탄량으로 전환되어 추가됩니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_2##만큼 더 오랫동안 위협을 받습니다.",
		["menu_deck15_7_desc_sc"] = "최대 체력이 #{risk}#$perk_value_1## 감소하고 감소한 수치의 #{skill_color}#$perk_value_2##가 방탄량으로 전환되어 추가됩니다.",
		["menu_deck15_9_desc_sc"] = "#{skill_color}#적에게 대미지를 가하면 방탄량을 회복하고## 방탄복이 두터울수록 방탄량을 더 많이 회복합니다.\n이 효과는 매 #{important_1}#$perk_value_1##초 마다 한 번만 일어납니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 #{skill_color}#10%## 상승합니다.",
		["menu_anarc_disable"] = "#{important_1}#(아나키스트로 인해 비활성화됨)##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#주사기##의 잠금이 해제됩니다.\n\n주사기를 사용하면 #{skill_color}#$perk_value_2##초 동안 받는 모든 피해량의 #{skill_color}#$perk_value_1##만큼을 회복하고, 주사기 사용 효과가 지속되는 동안에도 피해는 받게 됩니다.\n\n주사기는 매 #{important_1}#$perk_value_3##초마다 한 번만 쓸 수 있지만, 적을 처치할 때마다 재사용 대기 시간이 #{skill_color}#$perk_value_4##초씩 단축됩니다.",
		["menu_deck17_3_desc_sc"] = "주사기 사용 효과가 지속되는 동안 이동 속도가 ##$perk_value_1##만큼 빨라집니다.",
		["menu_deck17_5_desc_sc"] = "이제 주사기 사용 효과가 지속되는 동안 ##$perk_value_2##초 동안 받는 모든 피해량의 ##$perk_value_1##만큼 회복됩니다.\n\n주사기의 효과가 지속하는 동안 근처의 적이 당신을 집중 공격합니다.",
		["menu_deck17_7_desc_sc"] = "체력이 ##$perk_value_2## 이하일 때, 주사기의 회복 효과가 ##$perk_value_1##만큼 증가합니다.",
		["menu_deck17_9_desc_sc"] = "체력이 최대일 때 체력을 ##$perk_value_1##만큼 회복 할때마다 주사기 사용 쿨다운이 ##$perk_value_2##초씩 줄어듭니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#연막탄##의 잠금이 해제됩니다.\n\n연막탄을 사용하면, #{skill_color}#$perk_value_1##초간 숨을 수 있는 연막을 형성합니다. 연막 속에 숨어 있으면, 당신과 팀원은 방탄력의 회복 속도가 #{skill_color}#$perk_value_2##만큼 빨라집니다. 연막 속으로 들어간 적은 #{skill_color}#$perk_value_3##만큼 명중률이 감소합니다.\n\n연막탄은 투척한 시점에서 #{important_1}#$perk_value_4##초간 대기 시간이 시작되지만, 적을 처치하면 재사용 대기 시간이 #{skill_color}#$perk_value_5##초씩 감소합니다.\n\n당신의 회피율을 ##$perk_value_6##포인트만큼 상승시킵니다.",
		["menu_deck18_3_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck18_5_desc_sc"] = "공격을 회피하는데 성공하면 연막탄의 재사용 대기 시간이 ##$perk_value_1##초 감소합니다.\n\n인벤토리에 시체 가방을 ##$perk_value_2##개 더 소지합니다.",
		["menu_deck18_7_desc_sc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.",
		["menu_deck18_9_desc_sc"] = "연막 속에 숨어 있을 동안 초당 회피 미터가 ##$perk_value_1##만큼씩 채워집니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#힙 플라스크##의 잠금이 해제됩니다.\n\n받은 피해량의 #{skill_color}#$perk_value_1##을 #{skill_color}#$perk_value_2##초간 받습니다.\n\n플라스크를 사용하면 시간 경과에 따른 누적 피해를 바로 초기화할 수 있습니다.\n\n누적 피해가 초기화되면 남아있었던 누적 피해의 #{skill_color}#$perk_value_3##만큼 체력이 회복됩니다.\n\n플라스크는 #{important_1}#$perk_value_4##초의 대기 시간이 있습니다.\n\n방탄력이 #{important_1}#$perk_value_5## 감소하고 체력이 #{skill_color}#$perk_value_6## 증가합니다.",
		["menu_deck19_3_desc_sc"] = "적을 처치할 때마다 플라스크의 대기 시간이 ##$perk_value_1##초씩 감소합니다.",
		["menu_deck19_5_desc_sc"] = "##$perk_value_1##초간 피해를 받지 않으면 남아있는 누적 피해가 초기화됩니다.\n\n당신이 페이저를 응답하는 속도가 ##$perk_value_2##만큼 빨라집니다.",
		["menu_deck19_7_desc_sc"] = "당신의 체력이 ##$perk_value_1## 이하일때, 적을 처치할 때마다 당신의 플라스크의 대기 시간이 ##$perk_value_2##초씩 감소합니다.",
		["menu_deck19_9_desc_sc"] = "되살아났을때 최대 체력의 ##$perk_value_1##만큼 회복합니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#기체 디스펜서##의 잠금이 해제됩니다.\n\n기체 디스펜서를 사용하려면, #{skill_color}#$perk_value_1##미터 안에 있는 아군 동료를 바라보고 투척 무기 사용 키를 눌러 그 대상과 태그할 수 있습니다.\n\n당신이나 태그한 대상이 적을 처치할 때마다 당신의 체력을 #{skill_color}#$perk_value_2##만큼 회복시키고, 태그한 대상의 체력을 #{skill_color}#$perk_value_3##만큼 회복시킵니다.\n\n이 효과는 #{skill_color}#$perk_value_4##초간 지속되고 #{important_1}#$perk_value_5##초의 대기 시간을 가집니다.",
		["menu_deck20_3_desc_sc"] = "당신이나 태그한 대상이 적을 처치할 때마다 기체 디스펜서의 효과가 ##$perk_value_1##초 만큼 연장됩니다. 이 증가 효과는 매번 발동될 때마다 ##$perk_value_2##초씩 감소합니다.",
		["menu_deck20_5_desc_sc"] = "당신이나 태그한 대상이 적을 처치할 때마다 기체 디스펜서의 효과와 대기 시간이 끝날 때까지 당신은 ##$perk_value_1##만큼 받는 피해가 감소하고, 최대 ##$perk_value_2##까지 적용됩니다.\n\n카메라 루프의 지속 시간이 ##$perk_value_3##초 증가합니다.",
		["menu_deck20_7_desc_sc"] = "기체 디스펜서의 치료량이 ##$perk_value_1##만큼 증가합니다.",
		["menu_deck20_9_desc_sc"] = "적을 처치할 때마다 기체 디스펜서의 대기 시간이 ##$perk_value_1##초만큼 감소합니다.\n\n태그한 대상이 적을 처치할 때마다 기체 디스펜서의 대기 시간이 ##$perk_value_2##초만큼 감소하고, 이 효과는 대상과 태그가 풀릴 때까지 적용됩니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Biker--
		["menu_deck16_1_desc_sc"] = "자신 또는 팀원이 적을 처치할 때마다 #{skill_color}#$perk_value_1##의 체력을 회복합니다. 이 효과는 매 #{important_1}#$perk_value_2##초마다 발동됩니다.",
		["menu_deck16_3_desc_sc"] = "##$perk_value_2##초마다 방탄력을 ##$perk_value_1##만큼 재생합니다.",
		["menu_deck16_5_desc_sc"] = "매 ##$perk_value_1##의 방탄량을 잃을 때마다 처치 회복 대기 시간이 ##$perk_value_2##초씩 감소합니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_3##만큼 빨라집니다.",
		["menu_deck16_7_desc_sc"] = "이제 방탄력을 ##$perk_value_2##초마다 ##$perk_value_1##만큼 재생합니다.\n\n근접 무기로 적을 처치하면 다음 방어구 재생 시간을 ##$perk_value_3##초 앞당깁니다.",
		["menu_deck16_9_desc_sc"] = "매 ##$perk_value_1##의 방탄량을 잃을 때마다 사살시 얻는 체력량이 ##$perk_value_2##만큼 늘어납니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Yakuza--
		["menu_deck12_1_desc_sc"] = "당신의 체력에 반비례하여 회피 미터를 수동적으로 채워지는 속도가 빨라집니다.\n\n당신의 체력이 ##100%## 이하일 경우, 회피 미터가 매 초마다 최대 ##$perk_value_1##만큼 채워집니다.\n\n당신의 회피율을 ##$perk_value_2##포인트만큼 상승시킵니다.",
		["menu_deck12_3_desc_sc"] = "당신의 체력에 반비례하여 적을 처치할 때 회피 미터를 더 많이 채워집니다.\n\n당신의 체력이 ##100%## 이하일 경우, 적을 처치할 때 회피 게이지가 최대 ##$perk_value_1##만큼 채워집니다.",
		["menu_deck12_5_desc_sc"] = "당신의 체력에 반비례하여 받는 피해가 감소합니다. 당신의 체력이 ##100%## 이하일 경우, 최대 ##$perk_value_1##만큼 받는 피해가 감소합니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_2##만큼 빨라집니다.",
		["menu_deck12_7_desc_sc"] = "당신의 체력에 반비례하여 근접 공격으로 적을 처치할 때 회피를 더욱 효과적으로 만듭니다.\n\n체력이 ##100%## 이하일 경우, 근접 공격으로 적을 처치하면 회피 미터가 최대 ##$perk_value_1##만큼 채워지며, 이는 뱀 문신(3번 카드)의 효과와 중첩되고 다음 회피의 유예 시간이 최대 ##$perk_value_2##만큼 늘어나 최대 ##$perk_value_3##ms가 됩니다.\n\n당신의 회피율을 추가로 ##$perk_value_4##포인트만큼 더 상승시킵니다.",
		["menu_deck12_9_desc_sc"] = "당신이 얻을 수 있는 최대 굴절도가 #{skill_color}#$perk_value_1##만큼 상승합니다.\n\n다운 당, 쓰러지는 대신 체력이 ##1##로 살아남고 방탄력을 ##$perk_value_2##만큼 회복됩니다.\n\n#{risk}#주의: 이 효과는 클로커의 발차기 및 테이저의 전기 충격에 의해 쓰러지는 경우에는 적용되지 않으며, 갱신되지도 않습니다.##\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 #{skill_color}#10%## 상승합니다.",
		["menu_yakuza_deflection_add"] = "(야쿠자로 인해 증가함)",

		--Hacker--
		["menu_deck21_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#휴대용 ECM 장치##의 잠금이 해제됩니다.\n\n휴대용 ECM 장치의 지속 시간은 #{skill_color}#$perk_value_1##초입니다.\n\n경보가 울리기 전 휴대용 ECM 장치를 작동시키면 통신 장애를 일으켜, 모든 전자 장비와 페이저를 무력화시킵니다.\n\n경보가 울린 후 휴대용 ECM 장치를 작동시키면 #{skill_color}#$perk_value_2##미터 반경을 가진 피드백 효과를 일으키고, #{skill_color}#첫 번째## 피드백 루프는 #{skill_color}#$perk_value_3## 확률로 대부분의 적을 기절시키며, 그 이후의 루프는 #{skill_color}#$perk_value_4##초마다 #{skill_color}#$perk_value_5## 확률로 기절시킵니다.\n\n휴대용 ECM 장치는 #{important_1}#$perk_value_6##초의 대기 시간을 가지고 있으나, 적을 처치할 때마다 대기 시간이 #{skill_color}#$perk_value_7##초씩 감소합니다.",
		["menu_deck21_3_desc_sc"] = "당신의 회피율을 ##$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck21_5_desc_sc"] = "ECM 피드백의 효과가 작동 중일 때 적을 처치하면 ##$perk_value_1##만큼 체력이 회복됩니다.",
		["menu_deck21_7_desc_sc"] = "당신의 방탄량 회복 속도를 ##$perk_value_1##만큼 상승시킵니다.\n\n당신의 회피율을 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.",
		["menu_deck21_9_desc_sc"] = "ECM 피드백의 효과가 작동 중일 때 팀원이 적을 처치하면 ##$perk_value_1##만큼 체력이 회복됩니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",

		--Leech
		["menu_deck22_1_desc_sc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#약병##의 잠금이 해제됩니다.\n\n약병을 활성화하면 #{important_1}#$perk_value_2##초 동안 #{risk}#방탄량을 소모하고## 최대 체력의 #{skill_color}#$perk_value_1##만큼 회복합니다.\n\n능력이 활성화되어 있는 동안에는 체력이 #{skill_color}#$perk_value_3##로 분할되며 피해를 입을 때마다 한 칸이 제거됩니다. 적을 #{skill_color}#$perk_value_4##명씩 처치하면 체력의 일부를 회복하고 #{skill_color}#$perk_value_5##초간 피해를 받지 않습니다.\n\n약병은 #{important_1}#$perk_value_6##초의 대기 시간을 가지고 있습니다.",
		["menu_deck22_3_desc_sc"] = "약병이 활성화되어 있는 동안 피해를 입으면 팀원의 최대 체력의 #{skill_color}#$perk_value_1##를 회복합니다.",
		["menu_deck22_5_desc_sc"] = "약병의 지속시간이 #{skill_color}#$perk_value_1##초로 증가하고 적을 처치하면 약병의 대기 시간을 #{skill_color}#$perk_value_2##초씩 감소합니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 #{skill_color}#$perk_value_3##만큼 빨라집니다.",
		["menu_deck22_7_desc_sc"] = "이제 체력이 #{skill_color}#$perk_value_1##로 분할됩니다.",
		["menu_deck22_9_desc_sc"] = "다운된 상태에서도 약병을 사용하여 일시적으로 부활할 수 있고, 사용 후 약병의 대기 시간이 #{important_1}#$perk_value_1##초 추가됩니다.\n\n이제 공격을 받으면 팀원을 각자 최대 체력의 #{skill_color}#$perk_value_2##를 회복시킵니다.\n\n덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 #{skill_color}#10%## 상승합니다.",

		--CopyCat--
		["menu_st_spec_23"] = "카피캣",
		["menu_deck23_1_desc"] = "적을 #{skill_color}#$perk_value_1##명 처치하면 수납된 무기를 자동으로 재장전합니다.\n\n#{risk}#주의: 처치 횟수는 무기별로 별도로 계산되며, 수납한 무기를 재장전하면 횟수가 초기화됩니다.##\n\n무기 전환 속도가 #{skill_color}#$perk_value_2## 증가합니다.",
		["menu_deck23_1_short"] = "적을 #{skill_color}#$perk_value_1##명 처치하면 수납된 무기를 자동으로 재장전합니다.\n\n무기 전환 속도가 #{skill_color}#$perk_value_2## 증가합니다.",
		["menu_deck23_1_1_desc"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_1_1_short"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_1_2_desc"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_1_2_short"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_1_3_desc"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_1_3_short"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_1_4_desc"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",
		["menu_deck23_1_4_short"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",

		["menu_deck23_3_desc"] = "헤드샷을 달성할 때마다 체력을 #{skill_color}#$perk_value_1##씩 회복합니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_2##초이며, 대기 시간 감소는 효과가 발동될 때 #{skill_color}#\"불스아이\"## 스킬과 공유됩니다.",
		["menu_deck23_3_short"] = "헤드샷을 달성할 때마다 체력을 #{skill_color}#$perk_value_1##씩 회복합니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_2##초이며, 대기 시간 감소는 효과가 발동될 때 #{skill_color}#\"불스아이\"## 스킬과 공유됩니다.",
		["menu_deck23_3_1_desc"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_3_1_short"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_3_2_desc"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_3_2_short"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_3_3_desc"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_3_3_short"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_3_4_desc"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",
		["menu_deck23_3_4_short"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",

		["menu_deck23_5_desc"] = "회피한 탄환이 공격한 적에게 튕겨 돌아갑니다.\n\n방탄복을 관통하는 탄환은 공격한 적에게 튕겨내어 #{skill_color}#$perk_value_1##의 추가 피해를 가합니다.\n\n방탄복 관통 탄환을 튕겨내는 효과는 #{important_1}#$perk_value_2##초의 대기 시간을 가지고 있습니다.",
		["menu_deck23_5_short"] = "회피한 탄환이 공격한 적에게 튕겨 돌아갑니다.\n\n방탄복을 관통하는 탄환은 공격한 적에게 튕겨내어 #{skill_color}#$perk_value_1##의 추가 피해를 가합니다.\n\n방탄복 관통 탄환을 튕겨내는 효과는 #{important_1}#$perk_value_2##초의 대기 시간을 가지고 있습니다.",
		["menu_deck23_5_1_desc"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_5_1_short"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_5_2_desc"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_5_2_short"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_5_3_desc"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_5_3_short"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_5_4_desc"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",
		["menu_deck23_5_4_short"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",

		["menu_deck23_7_desc"] = "체력이 #{skill_color}#$perk_value_1## 밑으로 내려가면 #{skill_color}#$perk_value_2##초간 체력 대미지를 받지 않습니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_3##초입니다.",
		["menu_deck23_7_short"] = "체력이 #{skill_color}#$perk_value_1## 밑으로 내려가면 #{skill_color}#$perk_value_2##초간 체력 대미지를 받지 않습니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_3##초입니다.",
		["menu_deck23_7_1_desc"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_7_1_short"] = "당신의 체력을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_7_2_desc"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_7_2_short"] = "당신의 방탄량을 #{skill_color}#$perk_value_1##만큼 증가시킵니다.",
		["menu_deck23_7_3_desc"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_7_3_short"] = "당신의 회피율을 #{skill_color}#$perk_value_1##포인트만큼 상승시킵니다.",
		["menu_deck23_7_4_desc"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",
		["menu_deck23_7_4_short"] = "앉아있을 때와 가방을 운반할 때의 이동 속도가 #{skill_color}#$perk_value_1##만큼 증가합니다.",
		--Final Card
			--Crew Chief
			["menu_deck1_mrwi_desc"] = "당신과 당신의 팀원의 스태미나를 #{skill_color}#$perk_value_1##만큼 증가시킵니다.\n\n고함의 범위를 #{skill_color}#$perk_value_2##만큼 증가시킵니다.\n\n주의: 팀원의 특성 덱과 중첩되지 않습니다.\n\n당신이 페이저를 응답하는 속도가 ##$perk_value_3##만큼 빨라집니다.",
			--Muscle
			["menu_deck2_mrwi_desc"] = "모든 무기로 발사할 때마다 ##$perk_value_1##의 확률로 근처의 적에게 공포감을 퍼트립니다.\n\n공포감은 적들이 잠시 동안 엄청난 두려움에 떨게 만듭니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_2##만큼 빨라집니다.",
			--Armorer
			["menu_deck3_mrwi_desc"] = "당신의 방탄량 회복 속도를 ##$perk_value_1##만큼 상승시킵니다.\n\n시체 가방의 소지 수가 ##$perk_value_2##개 증가합니다.",
			--Rogue
			["menu_deck4_mrwi_desc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.\n\n무기 전환 속도가 추가로 ##$perk_value_2## 더 증가합니다.\n\n카메라 루프의 지속 시간이 ##$perk_value_3##초 증가합니다.",
			--Hitman
			["menu_deck5_mrwi_desc"] = "근접 무기를 제외한 다른 무기로 적을 처치하면 #{skill_color}#$perk_value_1##만큼의 체력이 저장되며, 최대 #{risk}#$perk_value_2##만큼의 체력을 저장할 수 있습니다.\n\n근접 무기로 적을 처치하면 저장된 체력이 일시적인 체력으로 바뀌며, 이 체력은 초당 #{important_1}#$perk_value_3##씩 서서히 감소합니다.\n\n임시 체력은 기본 최대 체력을 초과할 수 있지만, 한 번에 최대 #{risk}#$perk_value_4##만큼의 임시 체력을 가질 수 있습니다.\n\n인벤토리에 시체 가방을 ##$perk_value_5##개 더 소지합니다.",
			--Crook
			["menu_deck6_mrwi_desc"] = "방탄조끼류의 회피율이 추가로 ##$perk_value_1##포인트만큼 더 상승합니다.\n\n방탄조끼류의 방탄량이 추가로 ##$perk_value_2##포인트만큼 더 상승시킵니다.\n\n당신이 자물쇠를 따는 속도를 ##$perk_value_3##만큼 상승시킵니다.",
			--Burglar
			["menu_deck7_mrwi_desc"] = "당신의 회피율을 추가로 ##$perk_value_1##포인트만큼 더 상승시킵니다.\n\n앉아있을 때 회피 미터가 초당 추가로 ##$perk_value_2##만큼씩 더 채워집니다.\n\n앉아있을 때 이동 속도가 ##$perk_value_3##만큼 증가합니다.",
			--Infiltrator
			["menu_deck8_mrwi_desc"] = "##$perk_value_1##미터 안에 적이 존재할 때, ##$perk_value_2##만큼의 피해 감소 효과를 받습니다.\n\n근접 무기로 적을 때릴 때마다 근접 무기의 대미지가 ##$perk_value_4##초 동안 또는 빗나갈 때까지 추가로 ##$perk_value_3##만큼 더 증가하며, 최대 ##$perk_value_5##번까지 중첩됩니다.\n\n카메라 루프의 지속 시간이 ##$perk_value_6##초 증가합니다.",
			--Sociopath
			["menu_deck9_mrwi_desc"] = "적을 처치하면 #{skill_color}#$perk_value_1##만큼의 방탄량을 회복합니다.\n\n##$perk_value_2##미터 안에 있는 적을 처치하면 ##$perk_value_3##만큼의 방탄량을 회복하고, 근접 무기로 처치하면 두 배로 회복합니다.\n\n해당 효과의 발동 대기 시간은 #{important_1}#$perk_value_4##초입니다. 대기 시간 도중 적을 처치할 때마다 대기 시간이 #{skill_color}#$perk_value_5##초씩 감소하고, 근접 공격으로 적을 처치할 경우 추가로 #{skill_color}#$perk_value_6##초씩 더 감소합니다.\n\n적 처치로 활성화된 대기 시간이 없어지면 해당 특성 효과가 발동되고 대기 시간이 다시 시작됩니다.\n\n인벤토리에 시체 가방을 ##$perk_value_7##개 더 소지합니다.",
			--Gambler
			["menu_deck10_mrwi_desc"] = "적에게서 얻는 탄약에서 의약품도 같이 회수합니다. 탄약을 회수할 때마다 #{skill_color}#$perk_value_1##에서 #{skill_color}#$perk_value_2##만큼의 체력을 회복합니다.\n\n치료의 발동 대기 시간은 #{important_1}#$perk_value_3##초이지만, 탄약 상자를 획득할 때마다 대기 시간이 #{skill_color}#$perk_value_4##초에서 #{skill_color}#$perk_value_5##초씩 감소합니다.\n\n탄약을 회수할 때마다, 당신의 팀원도 탄약 회수량의 ##$perk_value_6##만큼 탄약을 회수합니다.\n\n당신이 페이저를 응답하는 속도가 ##$perk_value_7##만큼 빨라집니다.",
			--Grinder
			["menu_deck11_mrwi_desc"] = "적에게 대미지를 가하면 #{skill_color}#$perk_value_2##초동안 매 초마다 #{skill_color}#$perk_value_1##만큼의 체력을 회복합니다. 이 효과는 #{skill_color}#$perk_value_3##번 중첩됩니다.\n중첩은 #{risk}#방편복##를 입을 때만 적용되며, #{important_1}#$perk_value_4##초마다 한 번씩만 적용됩니다.\n방편복의 방탄력이 #{important_1}#$perk_value_5##만큼 감소하지만 방편복의 기동성이 #{skill_color}#$perk_value_6##만큼 증가합니다.\n\n#{risk}#주의: 센트리 또는 지속 피해 효과로 적에게 피해를 가해도 중첩을 얻을 수 없습니다.##\n\n시체 가방의 소지 수가 ##$perk_value_7##개 증가합니다.",
			--Yakuza
			["menu_deck12_mrwi_desc"] = "당신의 체력에 반비례하여 적을 처치할 때 회피 미터를 더 많이 채워집니다.\n\n당신의 체력이 ##100%## 이하일 경우, 회피 미터가 매 초마다 최대 ##$perk_value_1##만큼 채워집니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_2##만큼 빨라집니다.",
			--Ex-Pres
			["menu_deck13_mrwi_desc"] = "당신의 방탄량이 남아있는 동안, 당신이 적을 처치할 때마다 ##$perk_value_1##만큼의 체력을 저장합니다.\n\n당신의 방탄량이 완전히 고갈되어 재생되기 시작하면, 당신은 당신이 저장했던 체력량만큼 체력을 회복합니다.\n\n저장할 수 있는 최대 체력량은 당신이 착용한 방탄복에 따라 달라지며, 두터운 방탄복일수록 경량 방탄복보다 적은 체력을 저장합니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_2##만큼 오랫동안 위협을 받습니다.",
			--Maniac
			["menu_deck14_mrwi_desc"] = "당신이 가한 대미지는 최대 ##$perk_value_1##까지 히스테리아 스택으로 변환됩니다.\n\n히스테리아 스택:\n매 ##$perk_value_3##의 히스테리아당 ##$perk_value_2##만큼의 받는 피해가 감소합니다. 히스테리아 스택은 매 ##$perk_value_5##초마다 ##$perk_value_4##씩 감소합니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_6##만큼 오랫동안 위협을 받습니다.",
			--Anarchist
			["menu_deck15_mrwi_desc"] = "전투에서 벗어난 뒤 방탄복을 완전히 회복하는 대신, 아나키스트는 주기적으로 매 초마다 방탄력을 ##8##씩 회복합니다. 방탄복이 두터울수록 간격당 더 많은 방탄량을 회복하지만, 회복이 일어나는 간격이 길어집니다.\n\n주의: 이 특성 덱을 사용하는 동안은 방탄복 회복 속도를 높이거나 방탄복 재생과 관련된 방탄복 회복 대기 시간 감소가 있는 스킬과 특성 덱의 효과는 비활성화됩니다.\n\n당신과 당신의 텀원에게 위협을 느낀 시민은 ##$perk_value_1##만큼 오랫동안 위협을 받습니다.",
			--Biker
			["menu_deck16_mrwi_desc"] = "자신 또는 팀원이 적을 처치할 때마다 #{skill_color}#$perk_value_1##의 체력을 회복합니다. 이 효과는 매 #{important_1}#$perk_value_2##초마다 발동됩니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 ##$perk_value_3##만큼 빨라집니다.",
			--Kingpin
			["menu_deck17_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#주사기##의 잠금이 해제됩니다.\n\n주사기를 사용하면 #{skill_color}#$perk_value_2##초 동안 받는 모든 피해량의 #{skill_color}#$perk_value_1##만큼을 회복합니다.\n\n주사기 사용 효과가 지속되는 동안에도 피해는 받게 됩니다.\n\n주사기 사용 효과가 지속되는 동안 이동 속도가 ##$perk_value_3##만큼 빨라집니다.\n\n주사기는 매 #{important_1}#$perk_value_4##초마다 한 번만 쓸 수 있지만, 적을 처치할 때마다 재사용 대기 시간이 #{skill_color}#$perk_value_5##초씩 단축됩니다.",
			--Sicario
			["menu_deck18_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#연막탄##의 잠금이 해제됩니다.\n\n연막탄을 사용하면, #{skill_color}#$perk_value_1##초간 숨을 수 있는 연막을 형성합니다. 연막 속에 숨어 있으면, 당신과 팀원은 방탄력의 회복 속도가 #{skill_color}#$perk_value_2##만큼 빨라집니다. 연막 속으로 들어간 적은 #{skill_color}#$perk_value_3##만큼 명중률이 감소합니다.\n\n연막탄은 투척한 시점에서 #{important_1}#$perk_value_4##초간 대기 시간이 시작되지만, 적을 처치하면 재사용 대기 시간이 #{skill_color}#$perk_value_5##초씩 감소합니다.\n\n당신의 회피율을 #{skill_color}#$perk_value_6##포인트만큼 상승시킵니다.\n\n인벤토리에 시체 가방을 #{skill_color}#$perk_value_7##개 더 소지합니다.",
			--Stoic
			["menu_deck19_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#힙 플라스크##의 잠금이 해제됩니다.\n\n받은 피해량의 #{skill_color}#$perk_value_1##을 #{skill_color}#$perk_value_2##초간 받습니다.\n\n플라스크를 사용하면 시간 경과에 따른 누적 피해를 바로 초기화할 수 있습니다.\n\n누적 피해가 초기화되면 남아있었던 누적 피해의 #{skill_color}#$perk_value_3##만큼 체력이 회복됩니다.\n\n플라스크는 #{important_1}#$perk_value_4##초의 대기 시간이 있습니다.\n\n방탄력이 #{important_1}#$perk_value_5## 감소하고 체력이 #{skill_color}#$perk_value_6## 증가합니다.\n\n당신이 페이저를 응답하는 속도가 #{skill_color}#$perk_value_7##만큼 빨라집니다.",
			--Tag Team
			["menu_deck20_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#기체 디스펜서##의 잠금이 해제됩니다.\n\n기체 디스펜서를 사용하려면, #{skill_color}#$perk_value_1##미터 안에 있는 아군 동료를 바라보고 투척 무기 사용 키를 눌러 그 대상과 태그할 수 있습니다.\n\n당신이나 태그한 대상이 적을 처치할 때마다 당신의 체력을 #{skill_color}#$perk_value_2##만큼 회복시키고, 태그한 대상의 체력을 #{skill_color}#$perk_value_3##만큼 회복시킵니다.\n\n이 효과는 #{skill_color}#$perk_value_4##초간 지속되고 #{important_1}#$perk_value_5##초의 대기 시간을 가집니다.\n\n카메라 루프의 지속 시간이 #{skill_color}#$perk_value_6##초 증가합니다.",
			--Hacker
			["menu_deck21_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#휴대용 ECM 장치##의 잠금이 해제됩니다.\n\n휴대용 ECM 장치의 지속 시간은 #{skill_color}#$perk_value_1##초입니다.\n\n경보가 울리기 전 휴대용 ECM 장치를 작동시키면 통신 장애를 일으켜, 모든 전자 장비와 페이저를 무력화시킵니다.\n\n경보가 울린 후 휴대용 ECM 장치를 작동시키면 #{skill_color}#$perk_value_2##미터 반경을 가진 피드백 효과를 일으키고, #{skill_color}#첫 번째## 피드백 루프는 #{skill_color}#$perk_value_3## 확률로 대부분의 적을 기절시키며, 그 이후의 루프는 #{skill_color}#$perk_value_4##초마다 #{skill_color}#$perk_value_5## 확률로 기절시킵니다.\n\n휴대용 ECM 장치는 #{important_1}#$perk_value_6##초의 대기 시간을 가지고 있으나, 적을 처치할 때마다 대기 시간이 #{skill_color}#$perk_value_7##초씩 감소합니다.",
			--Leech
			["menu_deck22_mrwi_desc"] = "투척 무기 대신 사용할 수 있는 #{skill_color}#약병##의 잠금이 해제됩니다.\n\n약병을 활성화하면 #{important_1}#$perk_value_2##초 동안 #{risk}#방탄량을 소모하고## 최대 체력의 #{skill_color}#$perk_value_1##만큼 회복합니다.\n\n능력이 활성화되어 있는 동안에는 체력이 #{skill_color}#$perk_value_3##로 분할되며 피해를 입을 때마다 한 칸이 제거됩니다. 적을 #{skill_color}#$perk_value_4##명씩 처치하면 체력의 일부를 회복하고 #{skill_color}#$perk_value_5##초간 피해를 받지 않습니다.\n\n약병은 #{important_1}#$perk_value_6##초의 대기 시간을 가지고 있습니다.\n\n시체를 가방에 넣거나 인질과 상호 작용하는 속도가 #{skill_color}#$perk_value_3##만큼 빨라집니다.",

		["menu_deck23_9_desc"] = "덱 완료 보너스: PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 #{skill_color}#10%## 상승합니다.",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "타뷸라 라사",
		["menu_st_spec_0_desc"] = "인간은 타고난 생각이나 생각, 이념 없이 태어나며, 이는 모두 다양한 경험을 통해 학습된 행동이라는 가설이 세워져 있습니다. 어떤 면에서는 이로 인해 큰 어려움을 초래할 수도 있고, 다른 면에서는 이점으로 볼 수 있습니다. 타불라 라사 특성 덱은 처음에는 명확하지 않고 해로울 수도 있는 이점을 제공하지만, 더 큰 도전이 때로는 다른 보상을 받을 수 있게 합니다.",
		["menu_st_spec_0_desc_short"] = "인간은 타고난 생각이나 생각, 이념 없이 태어나며, 이는 모두 다양한 경험을 통해 학습된 행동이라는 가설이 세워져 있습니다. 어떤 면에서는 이로 인해 큰 어려움을 초래할 수도 있고, 다른 면에서는 이점으로 볼 수 있습니다. 타불라 라사 특성 덱은 처음에는 명확하지 않고 해로울 수도 있는 이점을 제공하지만, 더 큰 도전이 때로는 다른 보상을 받을 수 있게 합니다.",
		["menu_deck0_1"] = "내부자",
		["menu_deck0_1_desc"] = "암시장에서 구매할 수 있는 아이템과 하이스트에 사용할 에셋의 가격이 ##30%##만큼 저렴해집니다.",		
		["menu_deck0_2"] = "암시장 상인",
		["menu_deck0_2_desc"] = "암시장에서 구매할 수 있는 아이템과 하이스트에 사용할 에셋의 가격이 추가로 ##30%##만큼 더 저렴해집니다.",				
		["menu_deck0_3"] = "데드 프레지던트",
		["menu_deck0_3_desc"] = "당신이 획득한 간단한 전리품의 가치를 ##15%##만큼 증가합니다.",		
		["menu_deck0_4"] = "베테랑의 날",
		["menu_deck0_4_desc"] = "당신이 획득한 간단한 전리품의 가치를 추가로 ##15%##만큼 더 증가합니다.",	
		["menu_deck0_5"] = "초짜 통",
		["menu_deck0_5_desc"] = "하이스트를 끝낼 때마다 얻는 경험치가 ##45%##만큼 증가합니다.",	
		["menu_deck0_6"] = "빠른 학습자",
		["menu_deck0_6_desc"] = "하이스트를 끝낼 때마다 얻는 경험치가 추가로 ##45%##만큼 더 증가합니다.",		
		["menu_deck0_7"] = "미스터 닥터 판타스틱",
		["menu_deck0_7_desc"] = "하이스트를 끝낼 때마다 얻는 경험치가 추가로 ##45%##만큼 더 증가합니다.",			
		["menu_deck0_8"] = "네잎클로버",
		["menu_deck0_8_desc"] = "PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##10%## 상승합니다.",
		["menu_deck0_9"] = "행운의 부적",
		["menu_deck0_9_desc"] = "PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 추가로 ##20%## 더 상승합니다.",		
		
		["menu_st_spec_00"] = "인나타에",
		["menu_st_spec_00_desc"] = "다른 사람들은 마음에는 본능과 지식이 내재되어 있으며, 사람들은 실제로 빈 캔버스가 아니라고 주장할 것입니다. 인나타에는 모든 훌륭한 은행 강도가 가져야 할 기본적인 능력을 가지고 있으며, 개인적인 이익을 얻을 수 있는 여지만 남겨 둡니다. 그러한 신념은 다른 것과 마찬가지로 자신에게 피해를 줍니다. 이것이 우리가 원초적인 본능에 굴복한 대가인가요?",
		["menu_st_spec_00_desc_short"] = "다른 사람들은 마음에는 본능과 지식이 내재되어 있으며, 사람들은 실제로 빈 캔버스가 아니라고 주장할 것입니다. 인나타에는 모든 훌륭한 은행 강도가 가져야 할 기본적인 능력을 가지고 있으며, 개인적인 이익을 얻을 수 있는 여지만 남겨 둡니다. 그러한 신념은 다른 것과 마찬가지로 자신에게 피해를 줍니다. 이것이 우리가 원초적인 본능에 굴복한 대가인가요?",
		["menu_deck00_9_desc"] = "PAYDAY 카드에서 높은 등급의 아이템을 얻을 확률이 ##20%## 상승합니다.",
		
		["rpd_menu_button"] = "특성 덱 초기화",
		["rpd_menu_dialog_title"] = "확실합니까?",
		["rpd_menu_dialog_text"] = "$perk_deck_name 특성 덱을 초기화 시키면 $points_to_refund의 특성 포인트를 돌려받습니다.",


		--Strings for Lobby Player Info
		["menu_st_spec_24"] = "타뷸라 라사",
		["menu_st_spec_25"] = "인나타에",
		--MOD PERK DECKS
			--OFFYERROCKER'S MERCENARY PERK DECK
				["menu_deck_kmerc_1_desc_sc"] = "어떤 공격도 당신을 죽일 수 없도록 강한 타격으로 인한 체력 피해를 크게 줄입니다.\n\n체력을 ##5%##만큼 얻습니다.",
				["menu_deck_kmerc_3_desc_sc"] = "보유하고 있는 방탄력 ##4##포인트 당 재장전 속도 #1%##, 무기 교체 속도 ##2%##를 얻습니다.\n\n모든 방탄복의 방탄력이 ##5%## 증가합니다.",
				["menu_deck_kmerc_5_desc_sc"] = "체력이 ##0##에 도달되었을 때 대신 ##1##이 되고 ##2##초 동안 무적 상태가 됩니다.\n무적 효과를 받는 동안에는 전력 질주할 수 없습니다.\n이 효과는 체력을 완전히 회복할 때까지는 다시 발생하지 않습니다.\n\n추가로 체력을 ##5%##만큼 더 얻습니다.",
				["menu_deck_kmerc_7_desc_sc"] = "최소 ##2초##동안 방탄복을 회복된 후, 방탄력이 있는 있는 동안 ##5초마다## 체력을 최대 방탄력의 ##1%##만큼씩 회복합니다.",
				["menu_deck_kmerc_9_desc_sc"] = "체력을 ##30%## 이하가 될 만큼 피해를 입을 때마다 해당 피해의 ##50%##를 방탄력으로 회복합니다.\n이 효과는 매 초마다 한 번만 발생하거나 Walk It Off(카드 5)의 무적 상태를 동시에 발생할 수 없습니다.",
				
			--OFFYERROCKER'S LIBERATOR PERK DECK
				["menu_deck_liberator_1_desc_sc"] = "투척 무기를 대신 사용할 수 있는 ##비상용 주사기##를 잠금 해제합니다. 비상용 주사기를 사용하면 즉시 스태미나를 ##15##만큼 회복되고 ##4초## 동안 혹은 플레이어가 체력 피해를 입을 때까지 매 초마다 체력이 ##0.5##씩 회복됩니다.\n비상용 주사기는 ##한 번만## 사용할 수 있고 ##45##초의 재사용 대기시간이 있지만, 적을 처치할 때마다 재사용 대기시간이 ##1##초씩 단축됩니다.",
				["menu_deck_liberator_3_desc_sc"] = "이제 비상용 주사기의 체력 재생이 추가로 ##2##초 더 증가합니다.\n\n비상용 주사기의 체력 재생이 취소되면 남은 시간 동안 대미지 저항력을 ##10%##만큼 얻습니다.",
				["menu_deck_liberator_5_desc_sc"] = "서바이벌 주사기는 추가로 스태미나를 ##15##만큼 회복하고 매 초마다 추가로 체력을 ##0.5## 더 회복합니다.\n\n회피 포인트가 ##5##만큼 증가합니다.",
				["menu_deck_liberator_7_desc_sc"] = "체력이 ##10%##만큼 증가합니다.\n\n이제 비상용 주사기의 체력 재생은 추가로 ##2##초 더 증가합니다.",
				["menu_deck_liberator_9_desc_sc"] = "이제 비상용 주사기는 매 초 추가로 체력을 ##1##씩 회복합니다."

	})
end)
