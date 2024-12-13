Month = os.date("%m")
Day = os.date("%d")
local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
	local eggplant = restoration and restoration.Options:GetValue("OTHER/ForceEggs/Upotte")
	local my_wife = restoration and restoration.Options:GetValue("OTHER/ForceEggs/MyWife")
	local bobcat = restoration and restoration.Options:GetValue("OTHER/ForceEggs/CrabBattle")
	local shitpost = restoration and restoration.Options:GetValue("OTHER/ForceEggs/BigMan")
	local registeredloser = restoration and restoration.Options:GetValue("OTHER/ForceEggs/EmberMyBeloved")

-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "Mejora", --Bob: No se donde aparece esto
		["menu_es_crew"] = "Equipo", --Bob: No se donde aparece esto
		["menu_es_personal"] = "Personal", --Bob: No se donde aparece esto
		["menu_es_bad"] = "Malo", --Bob: No se donde aparece esto
		["menu_es_other"] = "Otro", --Bob: No se donde aparece esto
		["RestorationPDTHHudNeeded"] = "¡REQUIERE PD:TH HUD REBORN!",
		["menu_paygrade"] = "Pago: ",
		["menu_diffgrade"] = "Dificultad: ",
		["menu_utility_radial_menu_name"] = "Menú Radial De Utilidades",
		["menu_utility_radial_menu_desc"] = "Abrir El Menú De Utilidades",

		["res_credits"] = "Créditos De Restoration Mod",
		["res_credits_help"] = "Ver los créditos de RESTORATION MOD.",

		["Warning_overhaul_title"] = "ADVERTENCIA: El juego se cerrará para evitar que se corrompan los archivos de guardado.",
		["dialog_show_overhaul_dialog"] = "Estás DESHABILITANDO el Mod Completo. Normalmente NO ES RECOMENDABLE hacer esto, y deberías en su lugar ELIMINAR el mod de tu carpeta de mods si tienes la intención de no usar el mod activamente.\n\nTu juego se cerrará automáticamente en $TIME segundos, o cuando pulses OK.",
		["dialog_enable_overhaul_dialog"] = "Estás HABILITANDO el Mod Completo. El Mod debe permanecer normalmente HABILITADO en todo momento, y sólo se puede desactivar eliminando el mod de tu carpeta de mods.\n\nTu juego se cerrará automáticamente en $TIME segundos, o cuando pulses OK.",

		["res_saveboost"] = "MANTÉN $BTN_INTERACT PARA SUBIR A NIVEL 100",

		["RestorationModOptionsButtonTitleID"] = "Opciones De Restoration Mod",
		["RestorationModOptionsButtonDescID"] = "Opciones de Restoration Mod",
		["RestorationModHUDOptionsButtonTitleID"] = "Opciones Del HUD & UI De Restoration",
		["RestorationModHUDOptionsButtonDescID"] = "Opciones del HUD & UI de Restoration",
		["RestorationModOTHEROptionsButtonTitleID"] = "Opciones Adicionales De Restoration Mod",
		["RestorationModOTHEROptionsButtonDescID"] = "Opciones adicionales de Restoration Mod",
		["RestorationModWeaponHandlingOptionsButtonTitleID"] = "++ Opciones De Manejo De Armas ++",
		["RestorationModWeaponHandlingOptionsButtonDescID"] = "Opciones adicionales de manejo de armas.",
		["RestorationModUIOptionsButtonTitleID"] = "Interfaz Alfa",
		["RestorationModUIOptionsButtonDescID"] = "Opciones de interfaz Alfa.",
		["RestorationModTimeOfDayTitleID"] = "Nuevas + Horas Aleatorias De Días",
		["RestorationModTimeOfDayDescID"] = "Permite personalizar la hora del día en ciertos trabajos.",

		["RestorationModOtherModsTitleID"] = "===Opciones De Otros Mods===",
		["RestorationModOtherModsDescID"] = "Opciones adicionales para otros mods",
			["RestorationModAdVMovResOptOptionsButtonTitleID"] = "Opciones de\"Advanced Movement Standalone\"",
			["RestorationModAdVMovResOptOptionsButtonDescID"] = "Opciones adicionales para Cola en solitario del mod \"Advanced Movement Standalone\" de Pixy",

		["restoration_level_data_unknown"] = "HORA DESCONOCIDA, LUGAR DESCONOCIDO",
		["RestorationModEnv_BanksTitleID"] = "Banco Sucursal",
		["RestorationModEnv_BanksDescID"] = "Selecciona un ambiente para Banco Sucursal.",
		["RestorationModEnv_RVD1TitleID"] = "Reservoir Dogs Día 1",
		["RestorationModEnv_RVD1DescID"] = "Selecciona un ambiente para Reservoir Dogs Día 1.",
		["RestorationModEnv_RVD2TitleID"] = "Reservoir Dogs Día 2",
		["RestorationModEnv_RVD2DescID"] = "Selecciona un ambiente para Reservoir Dogs Día 2.",
		["RestorationModEnv_FSD1TitleID"] = "Pirómanos Día 1",
		["RestorationModEnv_FSD1DescID"] = "Selecciona un ambiente para Pirómanos Día 1.",
		["RestorationModEnv_PBR2TitleID"] = "Nacimiento En El Cielo",
		["RestorationModEnv_PBR2DescID"] = "Selecciona un ambiente para Nacimiento En El Cielo.",
		["RestorationModEnv_CJ2TitleID"] = "La Bomba: Astillero",
		["RestorationModEnv_CJ2DescID"] = "Selecciona un ambiente para La Bomba: Astillero.",
		["RestorationModEnv_UnderPassTitleID"] = "Paso A Desnivel",
		["RestorationModEnv_UnderPassDescID"] = "Selecciona un ambiente para Transporte - Paso A Desnivel.",
		["RestorationModEnv_MallCrasherTitleID"] = "Destrozacentros",
		["RestorationModEnv_MallCrasherDescID"] = "Selecciona un ambiente para Destrozacentros.",
		["RestorationModEnv_Mia_1TitleID"] = "Hotline Miami Día 1",
		["RestorationModEnv_Mia_1DescID"] = "Selecciona un ambiente para Hotline Miami Día 1.",
		["RestorationModEnv_FSD3TitleID"] = "Pirómanos Día 3",
		["RestorationModEnv_FSD3DescID"] = "Selecciona un ambiente para Pirómanos Día 3.",
		["RestorationModEnv_WDD1NTitleID"] = "Guardianes Día 1 (Noche)",
		["RestorationModEnv_WDD1NDescID"] = "Selecciona un ambiente para Perros Guardianes Día 1 (Noche).",
		["RestorationModEnv_WDD1DTitleID"] = "Guardianes Día 1 (Día)",
		["RestorationModEnv_WDD1DDescID"] = "Selecciona un ambiente para Perros Guardianes Día 1 (Día).",
		["RestorationModEnv_WDD2DTitleID"] = "Guardianes Día 2 (Día)",
		["RestorationModEnv_WDD2DDescID"] = "Selecciona un ambiente para Perros Guardianes Día 2 (Día).",
		["RestorationModEnv_Alex3TitleID"] = "Ratas Día 3",
		["RestorationModEnv_Alex3DescID"] = "Selecciona un ambiente para Ratas Día 3.",
		["RestorationModEnv_BigTitleID"] = "El Gran Banco",
		["RestorationModEnv_BigDescID"] = "Selecciona un ambiente para El Gran Banco.",
		["RestorationModEnv_FSTitleID"] = "Cuatro Tiendas",
		["RestorationModEnv_FSDescID"] = "Selecciona un ambiente para Cuatro Tiendas.",
		["RestorationModEnv_UkraTitleID"] = "Al Estilo Ucraniano",
		["RestorationModEnv_UkraDescID"] = "Selecciona un ambiente para Al Estilo Ucraniano.",
		["RestorationModEnv_KosugiTitleID"] = "Incursión Sombra",
		["RestorationModEnv_KosugiDescID"] = "Selecciona un ambiente para Incursión Sombra.",
		["RestorationModEnv_PetaTitleID"] = "Goat Simulator Día 1",
		["RestorationModEnv_PetaDescID"] = "Selecciona un ambiente para Goat Simulator Día 1.",
		["RestorationModEnv_FRIENDTitleID"] = "La Mansión De Scarface",
		["RestorationModEnv_FRIENDDescID"] = "Selecciona un ambiente para La Mansión De Scarface.",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "Rastreador de Bufos",
		["RestorationModINFOHUDOptionsButtonDescID"] = "Muestra iconos para reflejar información sobre las habilidades activas en la parte izquierda de la pantalla. No requiere activar Interfaz Alfa.",
		["RestorationModInfo_HudTitleID"] = "Activar Rastreador De Bufos.",
		["RestorationModInfo_HudDescID"] = "Activa o desactiva toda la interfaz del rastreador de Bufos.",
		["RestorationModInfo_SizeTitleID"] = "Tamaño De Icono",
		["RestorationModInfo_SizeDescID"] = "Controla el tamaño de los iconos en el rastreador de Bufos.",
		["RestorationModInfo_CountTitleID"] = "Número De Filas",
		["RestorationModInfo_CountDescID"] = "Controla el número de filas que el rastreador de bufos muestra antes de añadir una nueva columna.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "Recarga Agresiva",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "Eficiencia Municiosa",
		["RestorationModInfo_ammo_efficiencyDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "Sed de Sangre",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_bullet_stormTitleID"] = "Lluvia de Balas",
		["RestorationModInfo_bullet_stormDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "Médico Combatiente",
		["RestorationModInfo_revive_damage_reductionDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_desperadoTitleID"] = "Desperado",
		["RestorationModInfo_desperadoDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_grinderTitleID"] = "Histamina (Grinder)",
		["RestorationModInfo_grinderDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_infiltratorTitleID"] = "Absorción de Salud (Espía)",
		["RestorationModInfo_infiltratorDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_sociopathTitleID"] = "Tension y Otros (Sociópata)",
		["RestorationModInfo_sociopathDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_body_expertiseTitleID"] = "Regar y Rogar",
		["RestorationModInfo_body_expertiseDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "Inspiración",
		["RestorationModInfo_long_dis_reviveDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_messiahTitleID"] = "Mesías",
		["RestorationModInfo_messiahDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "Overkill",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "Analgésicos",
		["RestorationModInfo_revived_damage_reductionDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "Urgencia Médica",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_rogueTitleID"] = "Instinto Asesino (Renegado)",
		["RestorationModInfo_rogueDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "Evadiendo la Muerte",
		["RestorationModInfo_increased_movement_speedDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "Pulso Firme",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_trigger_happyTitleID"] = "Gatillo Fácil",
		["RestorationModInfo_trigger_happyDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "Mal Perdedor",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_unseen_strikeTitleID"] = "Ataque Sorpresa",
		["RestorationModInfo_unseen_strikeDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_survive_one_hitTitleID"] = "Oni Irezumi (Yakuza)",
		["RestorationModInfo_survive_one_hitDescID"] = "Activa o desactiva el rastreo de esta habilidad específica.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "Regeneración de salud del Botiquín Médico",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "Activa o desactiva el rastreo de la regeneración de salud del Botiquín Médico.",

		--EXTRA OPTIONS
		["RestorationModAltLastDownColorTitleID"] = "Color Alternativo De Ultiva Vida",
		["RestorationModAltLastDownColorDescID"] = "Cambia el color de última vida a color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Desactivar inclinación cámara incapacitado",
		["RestorationModNoBleedoutTiltDescID"] = "Desactiva la inclinación de la cámara al ser incapacitado.",
		["RestorationModGOTTAGETAGRIPTitleID"] = "Ocultar TODAS las empuñaduras",
		["RestorationModGOTTAGETAGRIPDescID"] = "Oculta *todos* los accesorios del tipo \"empuñadura_vertical\" para que no aparezcan en los menús; los que ya están acoplados a las armas no se ven afectados. Requiere reinicio.",
		["RestorationModGCGPYPMMSACTitleID"] = "Armas Super Cereal",
		["RestorationModGCGPYPMMSACDescID"] = "Desactiva las mecánicas de los blasters de Star Wars. Requiere reinicio.",
		["RestorationModGCGPYPMMSACTextTitleID"] = "Texto Super Cereal",
		["RestorationModGCGPYPMMSACTextDescID"] = "Desactiva los easter eggs basados en texto. Requiere reinicio.",
		["RestorationModForceEggsOptionsButtonTitleID"] = "Forzar Texto De Easter Eggs",
		["RestorationModForceEggsOptionsButtonDescID"] = "Forzar easter eggs de textos individuales ignora los efectos de \"Texto Super Cereal\" si está activado.\nCambiar cualquier cosa aquí requiere un reinicio.",
			["RestorationModUpotteTitleID"] = "Inscribirse en la Academia Seishou",
			["RestorationModUpotteDescID"] = "Trabaja con el profesor de Literatura Moderna o algo así",
			["RestorationModMyWifeTitleID"] = "G Menos que 3",
			["RestorationModMyWifeDescID"] = "Las maquinaciones internas de la mente de DMC son un enigma", --Bob: No se a que se refiere esto
			["RestorationModCrabBattleTitleID"] = "Este Sí Que Es Un Bonito Meme",
			["RestorationModCrabBattleDescID"] = "¡Exquisito!",
			["RestorationModEmberMyBelovedTitleID"] = "Ir Digital EXTREMO",
			["RestorationModEmberMyBelovedDescID"] = "Clem Grakata!",
			["RestorationModBigManTitleID"] = ":^)",
			["RestorationModBigManDescID"] = "Habilita otros textos de easter egg",
		["RestorationModSevenHoldTitleID"] = "Alternar interacciones (Pulsa una vez para mantener)",
		["RestorationModSevenHoldDescID"] = "Activa/desactiva si la tecla para interactuar actúa o no como interruptor.",
		["RestorationModSevenHoldDeployCancelTitleID"] = "Desplegable Cancela Interactuar",
		["RestorationModSevenHoldDeployCancelDescID"] = "Activa/desactiva si la tecla para desplegables es la que se utiliza para cancelar una interacción activa. Requiere que alternar interaciones esté activado para tener efecto.",
		["RestorationModClassicMoviesTitleID"] = "Fondos De Carga Clásicos",
		["RestorationModClassicMoviesDescID"] = "Activa o desactiva los fondos de carga de PD:TH cuando juegues en trabajos clásicos.",
		["RestorationModWpnCatTitleID"] = "Categorías Mercado Negro",
		["RestorationModWpnCatDescID"] = "Cambia el método de agrupamiento de armas utilizado al comprar un arma en el menú del mercado negro. Requiere reinicio.",
			["base_wpn_cat"] = "habilidad base",
			["sub_wpn_cat"] = "subcategoría y grado de daño",

		["RestorationModWepNamesTitleID"] = "(Re)Nombres De Armas",
		["RestorationModWepNamesDescID"] = "Cambia el estilo de los nombres de armas y accesorios. Requiere reinicio.",
			["resmod_res_names"] = "Nombres De Resmod (Predeterminado)",
			["resmod_no_nicknames"] = "Nombres De Resmod (Sin Apodos)",
			["dmcwo_reelnames"] = "Nombres De Armas Reales (DMCWO Port - NO TERMINADO)",
			["resmod_no_renames"] = "Nombres Vanilla (O Usa Tus Propios Mods De Nombres)",

		["RestorationModDisableAdvMovTFTitleID"] = "Desactivar Correr por pared/Saltar",
		["RestorationModDisableAdvMovTFDescID"] = "Desactiva los aspectos de correr por la pared/saltar de Advanced Movement.",
		["RestorationModAdvMovMeleeTitleID"] = "Comportamiento CaC",
		["RestorationModAdvMovMeleeDescID"] = "Cambia el comportamiento del salto/deslizamiento/impulso/patada de Advanced Movement.",
			["resmod_advmov_melee_on"] = "Predeterminado",
			["resmod_advmov_melee_loud_only"] = "Solo En Combate",
			["resmod_advmov_melee_off"] = "Deshabilitado",

		--WEAPON HANDLING
		["RestorationModStaticAimTitleID"] = "Sin Movimiento De Armas Mientras Apuntas",
		["RestorationModStaticAimDescID"] = "Activa/desactiva el balanceo y la desviación cosméticas al apuntar; anula la configuración de \"Movimiento de Viewmodel\" cuando está activada. Requiere reinicio. ADVERTENCIA: PUEDE INUTILIZAR ALGUNAS MIRAS SI NO SE MARCA.",
		["RestorationModBigScopeOffsetTitleID"] = "\"Miras Grandes\" Compensación De Viewmodel",
		["RestorationModBigScopeOffsetDescID"] = "Inclina y desplaza ligeramente hacia la derecha los viewmodels al disparar desde la cadera cuando se utilizan miras grandes para reducir las obstrucciones visuales.",
		["RestorationModViewmodelMovementTitleID"] = "Mov. del Viewmodel",
		["RestorationModViewmodelMovementDescID"] = "Elige cómo se mueve el viewmodel de tus armas al mirar a tu alrededor; el movimiento al apuntar es anulado por la opción \"Sin Movimiento De Armas Mientras Apuntas\" si está activada. Requiere reinicio.",
			["vm_vanilla"] = "Comportamiento Vanilla",
			["vm_drag"] = "Arrastre De Armas Por Detrás",
			["vm_lead"] = "Armas Van Por Delante",
			["vm_static"] = "Estático (Sin Movimiento)",
		["RestorationModCarpalTunnelTitleID"] = "Auto-Rec. Retroceso",
		["RestorationModCarpalTunnelDescID"] = "Elige cómo funciona la mecánica de auto-recuperación del retroceso. Las versiones activadas se equilibran de forma diferente.",
			["rr_off"] = "Desactivado",
			["rr_per_weapon"] = "Específico De Arma",
			["rr_full"] = "Completo",
		["RestorationModAutoDMRsTitleID"] = "Los DMR Comienzan En Automático",
		["RestorationModAutoDMRsDescID"] = "Activa o desactiva que todos los DMR con modos de disparo semiautomático y automático empiecen en modo automático.",
		["RestorationModWpnFireDescopeTitleID"] = "Permitir Anular Apuntado De Ciertas Armas",
		["RestorationModWpnFireDescopeDescID"] = "Activa/Desactiva Anular apuntado de armas al disparar. NOTA: Reduce errores visuales; algunas miras pueden atravesar la cámara si se desactiva. Se ignora en armas que mencionan el anulado como mecánica.",
		["RestorationModSprintCancelTitleID"] = "Corredor As Cancela Recargas Al Esprintar",
		["RestorationModSprintCancelDescID"] = "Alterna si *INICIAR* un sprint cancelará cualquier recarga en curso cuando hayas conseguido la habilidad \"Corredor AS\". La recarga mientras esprintas activamente no se ve afectada.",
		["RestorationModQueuedShootingTitleID"] = "Búfer Para Disparar",
		["RestorationModQueuedShootingDescID"] = "Activa/desactiva el búfer para semiautomáticas para ayudar con el oversampling.\nActivar esta opción desactiva la versión de Overkill del búfer.",
		["RestorationModQueuedShootingWindowTitleID"] = "Sensibilidad Del Búfer De Disparo Único",
		["RestorationModQueuedShootingWindowDescID"] = "Determina la ventana de tiempo para que los disparos sean almacenados en el búfer basándose en un % del retardo de disparo del arma. Mayor valor = búfer más temprano",
		["RestorationModQueuedShootingExcludeTitleID"] = "Límite De Cadencia De Tiro Del Búfer",
		["RestorationModQueuedShootingExcludeDescID"] = "Limita el almacenamiento en búfer de los disparos a las armas que disparan *por encima* de la cadencia de fuego (RPM) establecida por esta opción.",
		["RestorationModQueuedShootingMidBurstTitleID"] = "Búfer A Mitad De Ráfaga",
		["RestorationModQueuedShootingMidBurstDescID"] = "Buffer de disparos realizados *durante* una ráfaga.",
		["RestorationModQueuedShootingBurstExcludeTitleID"] = "Límite De Búfer A Mitad De Ráfaga",
		["RestorationModQueuedShootingBurstExcludeDescID"] = "Limita el almacenamiento en búfer de disparos realizados *durante* una ráfaga a las armas que tienen un retardo de ráfaga *inferior* al valor (ms) establecido por esta opción.",
		["RestorationModNoADSRecoilAnimsTitleID"] = "Sin Animaciones De Retroceso Al Apuntar",
		["RestorationModNoADSRecoilAnimsDescID"] = "Activa/desactiva las animaciones de retroceso al apuntar. Esta opción no afecta a algunas armas (por ejemplo, armas manuales, arcos y lanzallamas).",
		["RestorationModNoSwapOnReviveTitleID"] = "Sin Cambio Forzado De Armas Al Ser Reanimado",
		["RestorationModNoSwapOnReviveDescID"] = "Desactiva el cambio de arma forzado al ser reanimado cuando se te incapacita con una primaria sin la habilidad Inmortal As.",
		["RestorationModManualReloadsTitleID"] = "Recargas Manuales",
		["RestorationModManualReloadsDescID"] = "Desactiva las recargas automáticas cuando el cargador está vacío. NOTA: Esta opción se ignora si el mutador \"Maratón De Recarga\" está activo.",
		["RestorationModSecondSightSprintTitleID"] = "Botón De Esprintar Para Alternar La Mira",
		["RestorationModSecondSightSprintDescID"] = "Usa el botón de esprintar para alternar las miras mientras estás apuntando.\nLos gadgets podrán cambiarse como antes de la U232, pero no podrás iniciar esprint mientras apuntas.",
		["RestorationModADSTransitionStyleTitleID"] = "Estilo De Apuntado",
		["RestorationModADSTransitionStyleDescID"] = "Cambia el estilo de transición al apuntar con la mira.",
			["vanilla_on_rails"] = "Predeterminado/En Rieles",
			["kf_mw_style"] = "Estilo de KF1/CoD",
			["tilt_in"] = "Inclinado Hacia Dentro",
		["RestorationModAimDeploysBipodTitleID"] = "Apuntar Despliega Bípodes",
		["RestorationModAimDeploysBipodDescID"] = "Activa/desactiva el despliegue automático de los bípodes cuando apuntas sobre una superficie válida.",
		["RestorationModMoveCancelBipodTitleID"] = "Moverse Desmonta Bípode",
		["RestorationModMoveCancelBipodDescID"] = "Activa/desactiva desmontado de los bípodes al moverse.",
		["RestorationModSeparateBowADSTitleID"] = "Apuntar Con Arco Por Separado",
		["RestorationModSeparateBowADSDescID"] = "Desactiva el apuntado forzado con arcos al tensar una flecha. Si está activada, la tecla de recarga se usa para soltar la flecha.",
		["RestorationModPerPelletShotgunsTitleID"] = "Daño de escopeta por perdigón (NO TERMINADO)",
		["RestorationModPerPelletShotgunsDescID"] = "El daño de la escopeta se calcula por perdigón, a diferencia del predeterminado \"1 perdigón = daño completo, disparos en la cabeza tienen prioridad\".Se incrementa el daño de escopetas sin proyectiles para compensar la consistencia reducida. Requiere reinicio.",


		["default"] = "Predeterminado",
		["random"] = "Aleatorio",
		["mellowday"] = "Día Tranquilo",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "Predeterminado Mejorado",
		["env_trailer_bank"] = "Banco del Tráiler",
		["rvd1_alt1"] = "Vida Nocturna",
		["rvd1_alt2"] = "Niebla Rosa",
		["rvd2_alt"] = "Cubierto",
		["fsd1_eve"] = "Tarde",
		["bos_alt"] = "Cielos Rosados",
		["dockyard_alt"] = "Turno Nocturno",
		["underpass_foggyday"] = "Día Con Niebla",
		["mall_alt"] = "Tarde De Compras",
		["hlm_morn"] = "Llamada Matutina",
		["funny_and_epic_synthwave_very_eighties"] = "Retro",
		["brightnight"] = "Noche Brillante",
		["docks"] = "Muelles",
		["bank_green"] = "Verde Beta",
		["cloudy_day"] = "Día Nublado",
		["shadowraid_day"] = "Incursión Sombra De Día",
		["shadowraiud_darker"] = "Incursión Sombra Más Oscuro",
		["friend_pink"] = "Atardecer Rosado",
		["friend_night"] = "Noche En Miami",
		["off"] = "Desactivado",
		["windowofoppurtunity"] = "Window Of Opportunity", --Bob: Esto es musica?
		["wheresthevan"] = "Where's The Van", --Bob: Esto es musica?
		["menu_jukebox_heist_ponr"] = "Punto De No Retorno",
		["RestorationModPaintingsTitleID"] = "Cuadros No Utilizados En Galería De Arte",
		["RestorationModPaintingsDescID"] = "Activa o desactiva la posibilidad de que los cuadros no utilizados aparezcan en la Galería de Arte. Sólo funciona como anfitrión.",
		["RestorationModMainHUDTitleID"] = "HUD Alfa ON/OFF",
		["RestorationModMainHUDDescID"] = "Activa o desactiva el  por completo.",
		["RestorationModWaypointsTitleID"] = "Marcadores Alfa",
		["RestorationModWaypointsDescID"] = "Activar o desactivar los marcadores Alfa.",
		["RestorationModAssaultPanelTitleID"] = "Cinta de Asalto Alfa",
		["RestorationModAssaultPanelDescID"] = "Activa o desactiva la Cinta de Asalto Alfa.",
		["RestorationModAltAssaultTitleID"] = "Indicador De Asalto Alfa Temprana",
		["RestorationModAltAssaultDescID"] = "Activa o desactiva el Indicador de Asalto de la Alfa Temprana. Sustituye a la cinta.",
		["RestorationModObjectivesPanelTitleID"] = "Panel de Objetivos Alfa",
		["RestorationModObjectivesPanelDescID"] = "Activar o desactivar el Panel de Objetivos Alfa.",
		["RestorationModPresenterTitleID"] = "Presentador Alfa",
		["RestorationModPresenterDescID"] = "Activa o desactiva el Presentador Alfa, que se utiliza para el botín asegurado y el diálogo de recordatorio de objetivo.",
		["RestorationModInteractionTitleID"] = "Medidor De Interacción Alfa",
		["RestorationModInteractionDescID"] = "Activa o desactiva el medidor de Interacción Alfa.",
		["RestorationModStealthTitleID"] = "Medidor De sigilo Alfa",
		["RestorationModStealthDescID"] = "Activa o desactiva el medidor de sigilo Alfa.",
		["RestorationModDownTitleID"] = "Temporizador Incapacitado Alfa",
		["RestorationModDownDescID"] = "Activa o desactiva el temporizador al ser incapacitado Alfa.",
		["RestorationModBagTitleID"] = "Panel De Bolsas Alfa",
		["RestorationModBagDescID"] = "Activa o desactiva el panel de Bolsas Alfa.",
		["RestorationModHostageTitleID"] = "Ocultar Panel De Rehenes",
		["RestorationModHostageDescID"] = "Si se activa, oculta el panel de rehenes cuando comienza un asalto, si la bandera de asalto o el indicador de alfa temprana están activados.",
		["RestorationModDifficultyMarkersTitleID"] = "Indicadores De Dificultad De Prelanzamiento",
		["RestorationModDifficultyMarkersDescID"] = "Activa o desactiva los Indicadores de Dificultad del Prelanzamiento.",
		["RestorationModStaminaIndicatorTitleID"] = "Indicador De Resistencia De Debug",
		["RestorationModStaminaIndicatorDescID"] = "Activa o desactiva el indicador de resistencia de Debug.",
		["RestorationModBlackScreenTitleID"] = "Pantalla Negra De Restoration",
		["RestorationModBlackScreenDescID"] = "Activar o desactivar la pantalla negra de Restoration Mod.",
		["RestorationModLoadoutsTitleID"] = "Equipos Alfa",
		["RestorationModLoadoutsDescID"] = "Activa o desactiva la pantalla de equipo Alfa.",
		["RestorationModDistrictTitleID"] = "Descripciones De Los Distritos De CRIME.NET",
		["RestorationModDistrictDescID"] = "Activar o desactivar las descripciones de los distritos en CRIME.NET.  No son exactas para el gameplay.",
		["RestorationModSCOptionsButtonTitleID"] = "Opciones de Restoration Mod",
		["RestorationModSCOptionsButtonDescID"] = "Opciones de Restoration Mod",
		["RestorationModSCTitleID"] = "Modificación Completa (DEBUG)",
		["RestorationModSCDescID"] = "Activa o desactiva la modificación completa de Restoration Mod. Si activas esta opción, saldrás automáticamente de la partida para evitar que se dañen los archivos guardados.",
		["RestorationModHolidayTitleID"] = "Efectos Festivos",
		["RestorationModHolidayDescID"] = "Activar o desactivar Efectos festivos para el Mod.",
		["RestorationModCloakerTurnTitleID"] = "Giro De Cámara Por Patada De Cloaker",
		["RestorationModCloakerTurnDescID"] = "Activa o desactiva el giro de cámara de Cloakers de Vanilla al recibir una patada de Cloaker.",	
		["RestorationModDisableMutatorColorsTitleID"] = "Desactivar Colores Mutador Bandera Asalto",
		["RestorationModDisableMutatorColorsDescID"] = "Desactiva el cambio de color del estandarte de asalto al usar mutadores (solo HUD Vanilla).",		
		["RestorationModRestoreHitFlashTitleID"] = "Restaurar Destello De Golpe",
		["RestorationModRestoreHitFlashDescID"] = "Activa o desactiva el destello de golpe restaurado al recibir daño.",
		["RestorationModBotsNoDropTitleID"] = "Desactivar Lanzar Bolsas De Bots",
		["RestorationModBotsNoDropDescID"] = "Activa o desactiva que los bots puedan soltar bolsas de botín.",		
		["RestorationModNotifyTitleID"] = "Notificación De Función",
		["RestorationModNotifyDescID"] = "Activa o desactiva la notificación de esta función.",
		["RestorationModPauseTitleID"] = "Menú De Pausa Alfa",
		["RestorationModPauseDescID"] = "Activar o desactivar el menú de pausa Alfa.",

		["menu_support"] = "Guía/soporte de Restoration Mod",
		["menu_support_help"] = "Consulta la guía de Restoration Mod, obtén soporte y encuentra compañeros de equipo.",
		["menu_manual_header"] = "Texto de Placeholder",
		["hud_assault_alpha"] = "ASALTO POLICIAL",
		["hud_loot_secured_title"] = "BOTÍN ASEGURADO",
		["debug_none"] = "OBJETIVO",

		["restoration_level_data_welcome_to_the_jungle_1"] = "6:24 PM, Cuartel General De Los Motociclistas 'Overkill MC'",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "1:32 AM, Cuartel General De Los Motociclistas 'Overkill MC'",
		["restoration_level_data_welcome_to_the_jungle_2"] = "6:00 PM, Villa Vivaldi",
		["restoration_level_data_framing_frame_1"] = "11:30 PM, Galería De Arte Del Capitolio",
		["restoration_level_data_framing_frame_2"] = "12:30 PM, Depósito De Trenes Abandonado",
		["restoration_level_data_framing_frame_3"] = "2:20 AM, Apartamentos En Las Alturas",
		["restoration_level_data_election_day_1"] = "12:37 PM, Muelle 39",
		["restoration_level_data_election_day_2"] = "8:10 AM, Almacén",
		["restoration_level_data_election_day_3"] = "¡Hola! Si ves este mensaje durante el juego, ¡reportalo al equipo de Restoration Mod! ¡Gracias!",
		["restoration_level_data_election_day_3_skip1"] = "4:25 PM, Banco De Ahorros Del Capitolio",
		["restoration_level_data_election_day_3_skip2"] = "3:25 PM, Banco De Ahorros Del Capitolio",
		["restoration_level_data_watchdogs_1"] = "4:10 PM, Camión De Carne",
		["restoration_level_data_watchdogs_1_res"] = "9:10 PM, Camión De Carne",
		["restoration_level_data_watchdogs_2"] = "12:25 AM, Astillero Almendia",
		["restoration_level_data_watchdogs_2_res"] = "12:25 AM, Astillero Almendia",
		["restoration_level_data_watchdogs_1_night"] = "11:10 PM, Camión De Carne",
		["restoration_level_data_watchdogs_2_day"] = "6:05 PM, Astillero Almendia",
		["restoration_level_data_watchdogs_3_res"] = "12:20 AM, Enlace Washington Justice", --Bob: No se a que se refiere aqui
		["restoration_level_data_alex_1"] = "3:30 AM, Colina Tranquila",
		["restoration_level_data_alex_2"] = "5:55 AM, Proyectos",
		["restoration_level_data_alex_3"] = "7:20 AM, Enlace Washington Justice", --Bob: No se a que se refiere aqui
		["restoration_level_data_alex_1_res"] = "3:30 AM, Colina Tranquila",
		["restoration_level_data_alex_2_res"] = "5:55 AM, Proyectos",
		["restoration_level_data_alex_3_res"] = "7:20 AM, Enlace Washington Justice", --Bob: No se a que se refiere aqui
		["restoration_level_data_firestarter_1"] = "7:25 PM, Aeropuerto Privado",
		["restoration_level_data_firestarter_1_res"] = "7:25 PM, Aeropuerto Privado",
		["restoration_level_data_firestarter_2"] = "10:05 AM, Oficina Del FBI",
		["restoration_level_data_firestarter_2_res"] = "10:05 AM, Oficina Del FBI",
		["restoration_level_data_firestarter_3"] = "12:15 PM, Banco Harvest & Trustee",
		["restoration_level_data_firestarter_3_res"] = "12:15 PM, Banco Harvest & Trustee",
		["restoration_level_data_ukrainian_job"] = "2:50 PM, Cosas Preciosas", --Bob: Deberia adaptar el nombre o dejarlo como el original?
		["restoration_level_data_ukrainian_job_res"] = "2:50 PM, Cosas Preciosas",
		["restoration_level_data_jewelry_store"] = "2:50 PM, Cosas Preciosas",
		["restoration_level_data_four_stores"] = "1:20 PM, Escaparates",
		["restoration_level_data_mallcrasher"] = "12:50 PM, Centro Comercial Shield",
		["restoration_level_data_nightclub"] = "8:00 PM, Club Tasteful",
		["restoration_level_data_branchbank"] = "12:15 PM, Banco Harvest & Trustee",
		["restoration_level_data_escape_cafe"] = "¡Escapa!",
		["restoration_level_data_escape_park"] = "¡Escapa!",
		["restoration_level_data_escape_cafe_day"] = "¡Escapa!",
		["restoration_level_data_escape_park_day"] = "¡Escapa!",
		["restoration_level_data_escape_street"] = "¡Escapa!",
		["restoration_level_data_escape_overpass"] = "¡Escapa!",
		["restoration_level_data_escape_garage"] = "¡Escapa!",
		["restoration_level_data_escape_overpass_night"] = "¡Escapa!",
		["restoration_level_data_safehouse"] = "12:00 PM, El Refugio",
		["restoration_level_data_arm_fac"] = "9:30 PM, Puerto",
		["restoration_level_data_arm_par"] = "2:25 PM, Distrito Centro",
		["restoration_level_data_arm_hcm"] = "2:15 PM, Distrito Centro",
		["restoration_level_data_arm_cro"] = "12:55 PM, Intersección De Calles McCarthy Y James",
		["restoration_level_data_arm_und"] = "8:15 PM, Paso Subterráneo",
		["restoration_level_data_arm_for"] = "12:25 PM, Tren Armadillo",
		["restoration_level_data_family"] = "11:25 AM, Gioelli di Famiglia",
		["restoration_level_data_family_res"] = "11:25 AM, Gioelli di Famiglia",
		["restoration_level_data_big"] = "2:15 PM, Banco Benevolent",
		["restoration_level_data_big_res"] = "2:15 PM, Banco Benevolent",
		["restoration_level_data_roberts"] = "8:47 AM, Banco Roberts De Ahorros y Confianza",
		["restoration_level_data_roberts_v2"] = "8:47 AM, Banco Roberts De Ahorros y Confianza",
		["restoration_level_data_mia_1"] = "9:30 PM, Motel Del Comisario",
		["restoration_level_data_mia_2"] = "11:45 AM, Complejo De Apartamentos Del Comisario",
		["restoration_level_data_mia2_new"] = "11:45 AM, Complejo De Apartamentos Del Comisario",
		["restoration_level_data_kosugi"] = "4:00 AM, Almacén De Terminales",
		["restoration_level_data_gallery"] = "11:45 PM, Galería De Arte Del Capitolio",
		["restoration_level_data_hox_1"] = "10:30 AM, Pasillo Subterráneo Del Juzgado",
		["restoration_level_data_hox_2"] = "4:10 PM, Edificio J. Edgar Hoover",
		["restoration_level_data_pines"] = "5:52 PM, En Lo Profundo Del Bosque",
		["restoration_level_data_mus"] = "8:15 PM, Museo McKendrick De Arte Antiguo",
		["restoration_level_data_crojob2"] = "6:10 PM, Puerto De Washington",
		["restoration_level_data_crojob3"] = "3:35 PM, Afueras Del Bosque",
		["restoration_level_data_crojob3_night"] = "8:35 PM, Afueras Del Bosque",
		["restoration_level_data_cage"] = "7:55 PM, Automóviles Teuer",
		["restoration_level_data_hox_3"] = "11:55 PM, Refugio del FBI",
		["restoration_level_data_rat"] = "7:55 AM, Colina Tranquila",
		["restoration_level_data_shoutout_raid"] = "9:00 AM, Almacén De Terminales",
		["restoration_level_data_arena"] = "9:00 PM, Arena GENSEC",
		["restoration_level_data_kenaz"] = "8:00 PM, Strip de Las Vegas - Casino Golden Grin",
		["restoration_level_data_jolly"] = "4:00 PM, Los Ángeles - Zona De La Catástrofe",
		["restoration_level_data_red2"] = "2:15 PM, CENTRO DE LA CIUDAD - FIRST WORLD BANK",
		["restoration_level_data_dinner"] = "8:01 AM, Distrito del Matadero - ¡Emboscada!",
		["restoration_level_data_nail"] = "0:00 PM, Colina Tranquila",
		["restoration_level_data_haunted"] = "??:?? PM, El 'Refugio'",
		["restoration_level_data_pbr"] = "4:40 AM, Nevada - Instalación De Black Ridge",
		["restoration_level_data_pbr2"] = "HORA DESCONOCIDA, Z-170 'ZEUS' - Avión De Carga Murkywater",
		["restoration_level_data_cane"] = "3:15 PM, Taller De Papá Noel",
		["restoration_level_data_peta"] = "12:00 PM, Distrito Centro",
		["restoration_level_data_peta2"] = "5:43 PM, Granero Destrozado",
		["restoration_level_data_man"] = "6:00 PM, El Distrito - Edificio Abandonado",
		["restoration_level_data_pal"] = "12:00 PM, Suburbios - Reparación De Piscinas Bodhi",
		["restoration_level_data_short1_stage1"] = "HORA DESCONOCIDA, LUGAR CLASIFICADO",
		["restoration_level_data_short1_stage2"] = "HORA DESCONOCIDA, LUGAR CLASIFICADO",
		["restoration_level_data_short2_stage1"] = "HORA DESCONOCIDA, LUGAR CLASIFICADO",
		["restoration_level_data_short2_stage2"] = "HORA DESCONOCIDA, LUGAR CLASIFICADO",
		["restoration_level_data_short2_stage2b"] = "HORA DESCONOCIDA, LUGAR CLASIFICADO",
		["restoration_level_data_dark"] = "2:21 AM, Patio De Trenes Oculto",
		["restoration_level_data_mad"] = "HORA DESCONOCIDA, En algún lugar sobre Rusia...",
		["restoration_level_data_born"] = "10:15 AM, Club & Bar OVERKILL MC",
		["restoration_level_data_chew"] = "5:25 PM, Afueras de D.C. - ¡Tren en movimiento!",
		["restoration_level_data_flat"] = "4:02 PM, Proyectos - La Cuna De Chávez",
		["restoration_level_data_chill"] = "1:00 PM, El Refugio",
		["restoration_level_data_chill_combat"] = "1:00 PM, El Refugio - ¡Redada policial!",
		["restoration_level_data_help"] = "NO TOQUES ESE DIAL, ACABAMOS DE EMPEZAR",
		["restoration_level_data_friend"] = "4:30 PM, Miami - Mansión El Fureidis",
		["restoration_level_data_fish"] = "7:30 PM, Afueras de Nueva York - Yate Lethe",
		["restoration_level_data_spa"] = "7:00 PM, Nueva York - ¡Emboscada!",
		["restoration_level_data_moon"] = "11:00 PM, Centro Comercial Murica",
		["restoration_level_data_run"] = "11:00 AM, Centro De La ciudad - Cruce",
		["restoration_level_data_glace"] = "10:45 PM, Green Bridge - Hacia El Sur",
		["restoration_level_data_dah"] = "1:30 AM, Planta 22 - Rascacielos Del Grupo Garnet",
		["restoration_level_data_hvh"] = "TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC. TIC, TAC.",
		["restoration_level_data_wwh"] = "HORA DESCONOCIDA, En algún lugar de Alaska...",
		["restoration_level_data_rvd1"] = "HORA CLASIFICADA, UBICACIÓN CLASIFICADA",
		["restoration_level_data_rvd2"] = "HORA CLASIFICADA, UBICACIÓN CLASIFICADA",
		["restoration_level_data_brb"] = "6:53 PM, Nueva York, BROOKLYN - Banco Filial De Harvest & Trustee",
		["restoration_level_data_des"] = "HORA CLASIFICADA, Nevada - Henry's Rock",
		["restoration_level_data_sah"] = "HORA CLASIFICADA, Massachusetts - Shacklethorne Estate", --Bob: Comprobar si el nombre esta adaptado en el original
		["restoration_level_data_tag"] = "12:43 AM, Edificio J. Edgar Hoover",
		["restoration_level_data_bph"] = "HORA CLASIFICADA, Prisión De Fort Clatsop",
		["restoration_level_data_nmh"] = "8:24 PM, Hospital Mercy - Sala De Aislamiento",
		["restoration_level_data_nmh_res"] = "8:24 PM, Hospital Mercy - Sala De Aislamiento",
		["restoration_level_data_vit"] = "1:07 PM, Washington D.C. - La Casa Blanca",
		["restoration_level_data_mex"] = "HORA CLASIFICADA, Estados Unidos - Frontera Sur",
		["restoration_level_data_mex_cooking"] = "HORA CLASIFICADA, México - Complejo Coyopa",
		["restoration_level_data_bex"] = "HORA CLASIFICADA, México - Banco San Martín",
		["restoration_level_data_pex"] = "HORA CLASIFICADA, México - Comisaría",
		["restoration_level_data_fex"] = "HORA CLASIFICADA, México - Mansión De Buluc",
		["restoration_level_data_chas"] = "8:30 PM, San Francisco - Chinatown",
		["restoration_level_data_sand"] = "10:30 PM, San Francisco - Astillero",
		["restoration_level_data_chca"] = "9:24 PM, Bahía De San Francisco - El Black Cat", --Bob: Comprobar si el nombre esta adaptado en el original
		["restoration_level_data_pent"] = "11:30 PM, San Francisco - Penthouse De Yufu Wang",
		["restoration_level_data_ranc"] = "6:24 PM, Texas - Rancho Midland",
		["restoration_level_data_trai"] = "7:40 PM, Fort Worth - Patio Dalton", --Bob: Asumo que se refiere a un patio y no un astillero
		["restoration_level_data_corp"] = "8:35 PM, Dallas - Centro De I+D SERA",
		["restoration_level_data_deep"] = "9:00 PM, Golfo De México - Petrolero De SERA",
		["restoration_level_data_wetwork"] = "HORA CLASIFICADA, UBICACIÓN CLASIFICADA",
		["restoration_level_data_junk"] = "HORA CLASIFICADA, UBICACIÓN CLASIFICADA",
		["restoration_level_data_holly"] = "5:00 PM, Los Ángeles - Mansión De Lukas",
		["restoration_level_data_lvl_friday"] = "5:00 PM, Centro Comercial Shield",
		["restoration_level_data_skm_nightmare_lvl"] = "¿Una lavandería? ¿Estás aquí para limpiar tus pecados?",
		["restoration_level_data_bluewave"] = "HORA CLASIFICADA, Almacén Aureliano",
		["restoration_level_data_secret_stash"] = "6:00 PM, El Distrito - Edificio Abandonado",
		["restoration_level_data_bridge"] = "10:45 PM, Green Bridge - Hacia El Sur",
		["restoration_level_data_four_stores_remixed"] = "1:20 PM, Escaparates",

		--custom heists
		["restoration_level_data_flatline_lvl"] = "10:26 PM, Больница им. Н.И. Пирогова", --Flatline
		["restoration_level_data_ahopl"] = "9:06 PM, Club Privado De Yuri", --A House of Pleasure
		["restoration_level_data_atocl"] = "7:03 PM, Fiesta En El Penthouse", --A Touch of Class
		["restoration_level_data_rusdl"] = "10:23 AM, Joyería Del Grupo Garnet", --Cold Stones
		["restoration_level_data_crimepunishlvl"] = "1:19 PM, Correccional En Algún Lugar De Rusia", --Crime and Punishment
		["restoration_level_data_deadcargol"] = "8:36 PM, Alcantarillas Bajo El Depósito", --Deadly Cargo
		["restoration_level_data_hunter_party"] = "3:56 PM, Penthouse De Nikolai", --Hunter and Hunted d1
		["restoration_level_data_hunter_departure"] = "10:13 PM, Aeropuerto Privado De Aleksandr", --Hunger and Hunted d2
		["restoration_level_data_hunter_fall"] = "1:36 AM, En Algún Lugar Sobre Aguas Internacionales", --Hunter and Hunted d3
		["restoration_level_data_ruswl"] = "11:50 AM, En Algún Lugar De Rusia", --Scorched Earth
		["restoration_level_data_jambank"] = "11:59 AM, Banco Harvest & Trustee", --Botched Bank
		["restoration_level_data_2Fort"] = "Tiempo Extra, En Algún Lugar De Chufort", --2fort
		["restoration_level_data_anlh"] = "2:35 PM, Villa De Jian Liang", --An End to Liang
		["restoration_level_data_lvl_fourmorestores"] = "3:12 PM, Escaparates", --Four More Stores
		["restoration_level_data_TonCont"] = "11:01 AM, Atrio", --AT: Atrium
		["restoration_level_data_amsdeal1"] = "9:49 PM, Callejones", --Armsdeal Alleyway
		["restoration_level_data_ascension_III"] = "10:53 PM, Centro de Investigación Eclipse", --Ascension
		["restoration_level_data_hwu"] = "11:03 PM, Refugio Avalon Logistics", --Avalon's Shadow
		["restoration_level_data_vrc1"] = "2:35 PM, Distrito Centro", --A Very Richie Christmas d1
		["restoration_level_data_vrc2"] = "6:46 PM, Almacén", --A Very Richie Christmas d2
		["restoration_level_data_vrc3"] = "11:04 PM, Torre GenSec", --A Very Richie Christmas d3
		["restoration_level_data_btms"] = "4:40 AM, Nevada - Instalación De Black Ridge", --Blackridge Facility
		["restoration_level_data_BloodMoney"] = "8:00 PM, Oficinas Inactivas", --Blood Money
		["restoration_level_data_brb_rant"] = "6:53 PM, Nueva York, BROOKLYN - Banco Filial Harvest & Trustee", --Brooklyn Bank Ranted
		["restoration_level_data_lit1"] = "4:20 PM, Tienda California Green", --California Heat
		["restoration_level_data_lit2"] = "4:20 PM, Tienda De Juegos De Almir", --California Heat - Almir's Games
		["restoration_level_data_dwn1"] = "7:12 PM, Depósito California Green", --Deep Inside
		["restoration_level_data_the_factory"] = "9:37 PM, Centro de Investigación Eclipse", --Eclipse Research Facility
		["restoration_level_data_Election_Funds"] = "10:29 PM, Sede Electoral", --Election Funds
		["restoration_level_data_constantine_mex_level"] = "3:46 PM, En algún lugar de México", --End of an Era
		["restoration_level_data_battlearena"] = "11:14 PM, Georgetown", --FiveG
		["restoration_level_data_funbank"] = "Algo no está bien...", --Funbank
		["restoration_level_data_RogueCompany"] = "8:20 PM, Territorio De Jackal", --Rogue Company
		["restoration_level_data_bnktower"] = "HORA CLASIFICADA, H.I.V.E. de GenSec", --GenSec HIVE
		["restoration_level_data_glb"] = "11:19 AM, Banco Golden Lotus", --Golden Lotus Bank
		["restoration_level_data_constantine_harbor_lvl"] = "9:12 PM, Almacenes De Astilleros", --Harboring a Grudge
		["restoration_level_data_tonmapjam22l"] = "4:49 PM, Banco Harvest & Trustee", --Hard Cash
		["restoration_level_data_hardware_store"] = "7:36 PM, Ferretería", --Hardware Store
		["restoration_level_data_tj_htsb"] = "1:10 PM, Banco Harvest & Trustee", --H&T Southern Branch
		["restoration_level_data_tj_htsb_escape_level"] = "Escapa!", --H&T Southern Branch escape day? probably unused, dunno
		["restoration_level_data_hntn"] = "9:16 AM, Banco Harvest & Trustee", --H&T Northern Branch
		["restoration_level_data_hidden_vault"] = "11:08 PM, Instalacion Kranich En El Centro", --Hidden Vault
		["restoration_level_data_crumch_returns"] = "12:50 PM, Centro Comercial Shield", --Mallcrasher Ranted
		["restoration_level_data_mansion_stage1"] = "2:13 AM, Mansión De Sir Elmsworth", --Elmsworth Mansion
		["restoration_level_data_skm_nmh"] = "9:12 PM, Hospital Mercy - Techo", --No Mercy SKM
		["restoration_level_data_office_strike"] = "1:57 PM, Oficinas Del FBI En El Centro", --Office Strike	
		["restoration_level_data_highrise_stage1"] = "1:03 AM, Apartamento De Tremblay", --Out of Frame
		["restoration_level_data_constantine_bank_lvl"] = "12:00 PM, Banco Del Pacífico", --Pacific Bank
		["restoration_level_data_sh_raiders"] = "5:16 PM, Almacén De Las Afueras", --Safehouse Raiders
		["restoration_level_data_santas_hardware_store"] = "3:47 PM, Ferretería", --Santa's Hardware Store
		["restoration_level_data_schl"] = "9:57 PM, El Club Scarlet", --Scarlet Club
		["restoration_level_data_skm_wd2_x"] = "6:09 PM, Astillero Almendia Logistics", --Watchdogs d2 SKM revamp
		["restoration_level_data_Skyscraper"] = "2:13 AM, Sede Corporativa De GenSec", --Skyscraper Heist
		["restoration_level_data_tonisl1"] = "3:31 PM, Banco Harvest & Trustee", --Grand Harvest
		["restoration_level_data_ttr_yct_lvl"] = "2:19 PM, Yate De Wei Cheng", --Triad Takedown Remastered
		["restoration_level_data_Tonis2"] = "1:31 PM, Almacenes Del Puerto", --Triple Threat
		["restoration_level_data_trop"] = "11:48 AM, En Algún Lugar Sobre Aguas Internacionales", --Tropical Treasure
		["restoration_level_data_Gambling_room"] = "9:29 PM, Tienda Veinticuatro Siete", --Underground Bargains
		["restoration_level_data_finsternis"] = "5:24 PM, Alemania - Schwarzwald", --Projekt Finsternis

		["heist_greattrain_name"] = "Ventana Horaria",
		["heist_easystore_name"] = "Veinticuatro Siete", --Bob: Esto es un nombre?
		["heist_sin_villa_name"] = "PUNTUACIÓN: Villa Vivaldi",
		["heist_dragon_name"] = "Stonefist", --Bob: Es necesario adaptarlo?
		["heist_jkl_base_name"] = "Refugio de Jackal",
		["heist_junger_name"] = "Ángeles Distorsionados",
		["heist_deep_name"] = "Seis Profundos", --Bob: No se donde aparece esto y tampoco a que se refiere con deep six
		["heist_blood_name"] = "Cuerpo/Prisión",
		["heist_crystal_name"] = "Esclavos Del Miedo",
		["heist_gold_name"] = "Restos De Nada",
		["heist_titanium_name"] = "Guerra De Territorios",
		["heist_airport_name"] = "Ajuste De Cuentas", --Bob: Supongo que se refiere a ajuste de cuentas
		["heist_platinum_name"] = "Tensión Superficial",
		["heist_cursed_name"] = "Cosecha Verde",
		["heist_holly_name"] = "Noche De Éxito",

		["heist_platinum_brief"] = "mueve la lancha", --Bob: Esto se refiere a barco o lancha?
		["heist_jackal_surface_tension_name"] = "Buque de investigación OMNIA SN-XR-LETHE", --Bob: Asumo que se refiere a un barco
		["heist_jackal_surface_tension_brief"] = "PLACEHOLDER",

		["heist_vivinite_name"] = "Día Cero", --Bob: No se donde aparece esto

		["heist_contact_shatter"] = "Jackal",
		["heist_contact_akashic"] = "Nico",

		["menu_contacts_shatter"] = "Afiliados De CRIMENET",
		
		["heist_contact_jackal_description"] = "Jackal empezó trabajando para GenSec, pero renunció tras un incidente con tráfico de personas, vinculado a GenSec y OMNIA.\n\nAhora trabaja para CRIMENET, llevando la pelea al frente.",
		
		["heist_contact_akashic_description"] = "Antiguo teniente de alto rango a las órdenes de Héctor Morales, Nicolás 'Nico' René está ahora al mando de los remanentes del cártel de Sinaloa que operan en Estados Unidos.\nSus números son bajos y el cártel colombiano, más grande, no tiene intención de ayudarles -- ni de reparar la relación con CRIMENET.\n\nAbsorbiendo a varias bandas más pequeñas que operan en la costa este y aliándose con CRIMENET, proporcionará sus recursos a cambio de sus servicios.",

		["bm_msk_shatter_true"] = "Shatter", --Bob: Deberia adaptar esto?
		["bm_msk_shatter_true_desc"] = "La legendaria máscara de la que sólo se ha hablado en voz baja.\n\nPor supuesto, es sólo un duplicado.\n\nEl auténtico tiene algo mucho más especial, pero creo que una copia te gustará igualmente.\n\nEl Fénix simboliza el renacer, un ser eterno al que nunca se puede realmente matar.  Al intentar derribarlo, devolverá el golpe con un impresionante espectáculo de llamas y combustión.",

		["menu_l_global_value_veritas"] = "Restoration Mod",
		["menu_l_global_value_veritas_desc"] = "¡OBJETO DE RESTORATION MOD!",

		["menu_alex_1_zipline"] = "Tirolina para Bolsas",

		["menu_asset_wet_intel"] = "Información", --Bob: No se si se refiere a ayuda interna o informacion
		["menu_asset_risk_murky"] = "Mercenarios de Murkywater",
		["menu_asset_risk_bexico"] = "Policía Federal",
		["menu_asset_risk_zombie"] = "eQuiPo zOmbIe",
		["menu_asset_wet_boat"] = "Lancha", --Bob: No se si se refiere a lancha o barco a otro navio
		["menu_asset_wet_boat_desc"] = "Comprar una lancha adicional para dejar botín y escapar",

		["bm_msk_canada"] = "Infierno De Hockey",
		["bm_msk_canada_desc"] = "No te dejes nada atrás -- incluso cuando llega la pelea, luchas por lo que quieres, cuando lo quieres. (aunque sea un explosivo termobárico).",
		["bm_msk_jsr"] = "Sra. Grafiti",
		["bm_msk_jsr_desc"] = "Hecha por un verdadero artista. Limpiar un graffiti es como quemar un libro, ¿no?\n\nEl arte es arte, respétalo.",
		["bm_msk_jsrf"] = "Sr. Grafiti",
		["bm_msk_jsrf_desc"] = "Los grafitis cuentan historias. Ser artista en la fría ciudad puede ser una historia dolorosa.\n\nLos grafitis cuentan estas historias como un libro. Será mejor que los leas.",
		["bm_msk_courier_stash"] = "La Bolsa",
		["bm_msk_courier_stash_desc"] = "En caso de que quieras hacerte con unos billetes de cien dólares extra y no tengas espacio en los bolsillos, esta máscara te servirá.",

		["bm_msk_female_mask"] = "Máscara Estándar (Mujer)",
		["bm_msk_female_mask_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.",
		["bm_msk_female_mask_blood"] = "Máscara Recuperada (Mujer)",
		["bm_msk_female_mask_blood_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.\n\nSe encontró en las secuelas de un robo fallido en un deposito de OMNIA, todo lo que quedaba eran cuerpos y sangre.\n\nEl último mensaje del equipo antes de desaparecer, fue ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_female_mask_clown"] = "Rosie",
		["bm_msk_female_mask_clown_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.\n\nEsta máscara la llevaba una criminal con el alias de Rosie, aunque ahora lleva una máscara nueva.\n\nCaptada en imágenes, se la vio derribando a todo un escuadrón de SWAT totalmente desarmada.",
		["bm_msk_male_mask"] = "Máscara Estándar (Hombre)",
		["bm_msk_male_mask_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.",
		["bm_msk_male_mask_blood"] = "Máscara Recuperada (Hombre)",
		["bm_msk_male_mask_blood_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.\n\nSe encontró en las secuelas de un robo fallido en un deposito de OMNIA, todo lo que quedaba eran cuerpos y sangre.\n\nEl último mensaje del equipo antes de desaparecer, fue ''ERIT PREMIUM SANGUINE SANCTUM''.", --Bob: Deberia adaptar el mensaje?
		["bm_msk_male_mask_clown"] = "Cross",
		["bm_msk_male_mask_clown_desc"] = "Una máscara estándar, proporcionada por CRIMENET.\n\nHecho de un material denso, no es endeble, pero tampoco es fácil de desgastar.\n\nLa llevaba un criminal con el alias de Cross, aunque ahora lleva una máscara nueva.\n\nUn tirador talentoso, una vez derribó cuatro transportes blindados en un lapso de 5 segundos.",

		["bm_msk_twister_mask"] = "Hombre Misterio",
		["bm_msk_twister_mask_desc"] = "Quienquiera que esté detrás de esta máscara, es un misterio.\n\nPuede ser alguien desconocido o alguien a quien conozcas de siempre.",
		["bm_msk_voodoo_mask"] = "Magia Negra",
		["bm_msk_voodoo_mask_desc"] = "Encontrada en las ruinas de un bombardeo en la jungla, esta máscara resistió a los elementos y a la carnicería, y ahora se la conoce como un presagio.\n\nLo más probable es que te encuentre cuando más lo necesites y te infunda la suerte necesaria para resistir la destrucción.\n\nPero uno debe preguntarse -- ¿a qué precio?",

		["bm_msk_f1"] = "Casco X1",
		["bm_msk_f1_desc"] = "Cuando conduzcas a toda velocidad por autopistas y quemes caucho en calles abarrotadas, asegúrate de llevar protección.\n\nPuede que te proteja de una mala caída, pero no de las balas.",
		["bm_msk_f1_b"] = "Casco X1 (Limpio)",
		["bm_msk_f1_b_desc"] = "Cuando conduzcas a toda velocidad por autopistas y quemes caucho en calles abarrotadas, asegúrate de llevar protección.\n\nPuede que te proteja de una mala caída, pero no de las balas.\n\nEste es un duplicado del casco, sin las pegatinas de marca, encontrado en un depósito con un montón de vehículos de lujo.\n\nTenlo a mano y puede que tengas la oportunidad de conducir uno propio.",
		["bm_msk_sweettooth"] = "Sweet Tooth",
		["bm_msk_sweettooth_desc"] = "Sweet Tooth, de nombre real Marcus 'Needles' Kane, es un personaje de la serie de videojuegos Twisted Metal. Sweet Tooth es más conocido por ser un payaso asesino que conduce un camión de combate de helados.\n\nSe dice que una vez se escapó de un psiquiátrico. Ahora lleva una vida criminal.", --Bob: El original tiene algo raro con it's usando un backslash por algun motivo

		["bm_msk_wolf_stone"] = "Wolf Frío",
		["bm_msk_wolf_stone_desc"] = "La máscara original de Wolf, de cuando se volvió loco por primera vez, representando crímenes de sus series favoritas. La máscara se creyó perdida en un robo, inspirado en el videojuego 'Hyper Heisting'.\n\nTras los primeros trabajos de la banda, la máscara reapareció y fue llevada al refugio por uno de los socios de Bain.\n\nEl diseño original de la máscara se ha desgastado parcialmente con el tiempo, tal vez reflejando el declive de la estabilidad mental de Wolf.",

		["bm_msk_thespian"] = "Thespian",
		["bm_msk_thespian_desc"] = "Thespian es un superhombre soldado de la fortuna. En el futuro, los marines espaciales como Thespian protegen el mundo de la humanidad y sus colonias espaciales de las fuerzas del mal.\n\nSu casco es un regalo popular en el submundo criminal y se entrega a ladrones, matones y delincuentes profesionales que demuestran su lealtad y paciencia al sindicato.", --Bob: El original dice solider en vez de soldier y no estoy seguro de si es un typo

		["bm_msk_dallas_aged"] = "Dallas Envejecido",
		["bm_msk_dallas_aged_desc"] = "Tú y tu equipo encontraron estas máscaras en la extraña caja egipcia de Henry's Rock. La caja fue interceptada en tránsito y el resto del contenido os fue entregado.\n\nAlgo sobre estas máscaras... es inusual. No hay información sobre su posible procedencia.\n\nJackal sugiere que podría ser una broma pesada, o algún tipo de intento para asustar al equipo.\n\nSin embargo, hasta donde puedes decir, estas parecen muy, muy viejas.",
		["bm_msk_chains_aged"] = "Chains Envejecido",
		["bm_msk_chains_aged_desc"] = "Tú y tu equipo encontraron estas máscaras en la extraña caja egipcia de Henry's Rock. La caja fue interceptada en tránsito y el resto del contenido os fue entregado.\n\nAlgo sobre estas máscaras... es inusual. No hay información sobre su posible procedencia.\n\nJackal sugiere que podría ser una broma pesada, o algún tipo de intento para asustar al equipo.\n\nSin embargo, hasta donde puedes decir, estas parecen muy, muy viejas.",
		["bm_msk_hoxton_aged"] = "Hoxton Envejecido",
		["bm_msk_hoxton_aged_desc"] = "Tú y tu equipo encontraron estas máscaras en la extraña caja egipcia de Henry's Rock. La caja fue interceptada en tránsito y el resto del contenido os fue entregado.\n\nAlgo sobre estas máscaras... es inusual. No hay información sobre su posible procedencia.\n\nJackal sugiere que podría ser una broma pesada, o algún tipo de intento para asustar al equipo.\n\nSin embargo, hasta donde puedes decir, estas parecen muy, muy viejas.",
		["bm_msk_wolf_aged"] = "Wolf Envejecido",
		["bm_msk_wolf_aged_desc"] = "Tú y tu equipo encontraron estas máscaras en la extraña caja egipcia de Henry's Rock. La caja fue interceptada en tránsito y el resto del contenido os fue entregado.\n\nAlgo sobre estas máscaras... es inusual. No hay información sobre su posible procedencia.\n\nJackal sugiere que podría ser una broma pesada, o algún tipo de intento para asustar al equipo.\n\nSin embargo, hasta donde puedes decir, estas parecen muy, muy viejas.",

		["bm_msk_beef_dallas"] = "Beeef Dallas",
		["bm_msk_beef_dallas_desc"] = "El Equipo usó estas máscaras cuando realizaron el trabajo Slaughterhouse.\n\nDallas optó por mantener el diseño similar a su icónica máscara de payaso.",
		["bm_msk_beef_chains"] = "Beeef Chains",
		["bm_msk_beef_chains_desc"] = "El Equipo usó estas máscaras cuando realizaron el trabajo Slaughterhouse.\n\nChains, al ser un matón, quería un animal intimidante para su diseño. ¿Qué hay más intimidante que un maldito dinosaurio?",
		["bm_msk_beef_hoxton"] = "Beeef Hoxton",
		["bm_msk_beef_hoxton_desc"] = "El Equipo usó estas máscaras cuando realizaron el trabajo Slaughterhouse.\n\nHoxton tenía una lista simple para su máscara:\n- ¡Protectora!\n- ¡Eficiente!\n- ¡Estilosa!\n\nY así nació esta máscara.",
		["bm_msk_beef_wolf"] = "Beeef Wolf",
		["bm_msk_beef_wolf_desc"] = "El Equipo usó estas máscaras cuando realizaron el trabajo Slaughterhouse.\n\nEl diseño de Wolf se inspiró en uno de sus personajes favoritos de su época como desarrollador de videojuegos.",

		["bm_msk_vyse_dallas"] = "La Fuente",
		["bm_msk_vyse_dallas_desc"] = "Vyse se enfrentó cara a cara con el diablo de los extractos de pimienta y sobrevivió, esta máscara fue hecha con los huesos de ese diablo.",
		["bm_msk_vyse_chains"] = "Juego De Niños",
		["bm_msk_vyse_chains_desc"] = "Aunque Vyse robó más dinero y oro del que cabía en Fort Knox, tuvo la decencia de compartir parte del contenido con niños enfermos.\n\nAl parecer, Bain visitó a algunos de esos niños, y esta máscara es el agradecimiento que le dieron a Vyse.",
		["bm_msk_vyse_hoxton"] = "Los Tres Chiflados",
		["bm_msk_vyse_hoxton_desc"] = "Dicen que cuando metes la pata, debes afrontar el dolor e intentarlo de nuevo. Pero no Vyse. Cada vez que la cagaba, recibía una bofetada de manos de antiguos militares, y seguía adelante. Ni siquiera Larry, Curley y Moe podían aguantar semejante paliza.",
		["bm_msk_vyse_wolf"] = "Bear Grylls",
		["bm_msk_vyse_wolf_desc"] = "Vyse desafió a Bear Grylls a una competición de beber orina... Vyse ganó, y el Sr. Grylls utilizó sus habilidades de supervivencia para ayudar a hacer esta máscara.",

		["bm_msk_secret_old_hoxton"] = "Hoxton Secreto Renacido",
		["bm_msk_secret_old_hoxton_desc"] = "Hoxton abandonó el Viejo Continente para conseguir su Payday en el nuevo. Cuando Bain le habló por primera vez del Secreto, le entusiasmó la idea de ir tras objetos antiguos por su valor potencial, sin importarle realmente si el poder legendario del que hablaba Bain era real o no.",

		["bm_msk_secret_clover"] = "Clover Secreta",
		["bm_msk_secret_clover_desc"] = "Cuando Bain le contó el secreto, Clover se mostró escéptica; las conversaciones de Bain sobre objetos antiguos con un poder mítico siempre le parecieron descabelladas, pero cuando se encontró cara a cara con el ensamblado de las tres cajas, todas las dudas desaparecieron de su mente.",

		["bm_msk_secret_dragan"] = "Dragan Secreto",
		["bm_msk_secret_dragan_desc"] = "Como ex policía, Dragan tenía buen ojo para las evidencias, y cuando Bain le mostró su investigación sobre el secreto se mostró dispuesto a cazar antiguos objetos de poder.",

		["bm_msk_secret_bonnie"] = "Bonnie Secreta",
		["bm_msk_secret_bonnie_desc"] = "Bonnie, al enterarse del secreto por Bain, dio un gran trago a su whisky favorito y se puso en marcha para joder a Kataru.",

		["bm_msk_secret_sydney"] = "Sydney Secreta",
		["bm_msk_secret_sydney_desc"] = "Cuando Bain le contó el secreto, Sydney no creía en las historias de poderes ancestrales. Sin embargo, la oportunidad de desafiar a una autoridad desconocida pero dominante fue suficiente para convencerla.",

		["bm_msk_secret_richard"] = "Richard Secreto",
		["bm_msk_secret_richard_desc"] = "Los rumores que circulan por el submundo criminal hablan del asesino que inspiró a Jacket; un asesino que tuvo un final terrible a manos de una organización desconocida. Cuando Jacket fue informado del secreto por Bain, apareció más tarde con lo que parecía ser la máscara de su mayor inspiración.",

		["bm_all_seeing"] = "El Ancla Que Todo Lo Ve",
		["bm_all_seeing_desc"] = "Una visión horripilante, una visión de pesadilla.\n\nLos poderes te han visto y se aseguran de recompensarte por tus contribuciones.",

		["bm_msk_classic_helmet"] = "El Agente Clásico",
		["bm_msk_classic_helmet_desc"] = "Un regalo hecho por un ex agente del SWAT. Antes de retirarse, encontró a Jackal... y ofreció sólo el equipo al que tenía acceso, para ayudar en los esfuerzos de Jackal.\n\nSu curiosa oferta se debía a una razón: él mismo vio lo que OMNIA hacía en secreto. Pero él mismo, se negó a divulgar esos secretos, y se marchó poco después, para no volver a ser visto.\n\nJackal envió estos cascos. Una recompensa por tus contribuciones.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Mueve el placeholder, ya lo arreglaremos.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "La máscara de Jackal. O al menos, una recreación.\n\nLa máscara real es importante para Jackal, y algunos dicen que la real está llena de datos sensibles.\n\nSin embargo, en esta recreación, el sistema que ejecuta la pantalla es muy rudimentario, y sólo pretende replicar al real.\n\nUn regalo por tus esfuerzos.",


		["bm_msk_finger"] = "El Griefer",
		["bm_msk_finger_desc"] = "El Griefer es una bestia mítica, conocida por haber formado parte de este mundo hace mucho tiempo. La bestia perseguía y acosaba deliberadamente a la gente común en pueblos y ciudades, cazándolos de forma desprevenida. El Griefer obtenía placer de estos actos y era una amenaza para la paz hasta que los hombres del Rey finalmente lo encontraron y lo destruyeron.",

		["bm_msk_instinct"] = "La intuición",
		["bm_msk_instinct_desc"] = "Esta máscara perteneció a un misterioso guerrero de un lugar muy lejano. Recorría las tierras, guiado por su intuición, cazando fuerzas malignas por todo el mundo. Se aventuró en mazmorras y mató a miles de seres malignos con los que se cruzó. Al final, encontró la paz, sabiendo que la siguiente generación continuaría como él.",

		["bm_msk_unforsaken"] = "El Inolvidable", --Bob: Esto es lo mas cercano que pude encontrar a unforsaken
		["bm_msk_unforsaken_desc"] = "Esta legendaria máscara es una muestra de nuestro agradecimiento a la comunidad por su dedicación, comprensión y continuo apoyo. Desde el equipo de OVERKILL - os saludamos.\n\nEn las buenas y en las malas, que vuelen esos cascos.",

		["bm_msk_chains_halloween"] = "Escudo de Fragmentación",
		["bm_msk_chains_halloween_desc"] = "Como mercenario a sueldo, ves mucho dolor y muerte. Aunque te sientas invencible, imparable... a veces todo esto vuelve para atormentarte.\n\nEn una hermosa, luminosa y nevada tarde de octubre de 2008, Chains dormía. Recién terminado un trabajo de asesinato de Murkywater, había hecho lo más difícil, le habían pagado y tenía una bonita habitación de hotel donde dormir.\n\nPor primera vez en años, tuvo una pesadilla. No recuerda lo que era, pero se despertó paralizado y con una figura que era más esqueleto que hombre de pie sobre él, y era incapaz de moverse.\n\nCada vez que empuñaba su arma después de aquel día, las noches siguientes eran intranquilas y terribles.\n\nAl final, tuvo que decir 'suficiente'. Salió del mundo de los mercenarios a sueldo, y vio a un terapeuta. Tenía medicación para ayudar. La vida fue buena durante un año...\n\nExactamente un año después, el 31 de octubre de 2009, Murkywater estaba segura de que un hombre que quería arreglar su vida sacaría a la luz secretos, intentaría hacer daño a la compañía. No podían permitirlo.\n\nChains se vio empujado a la vida criminal para protegerse, convirtiéndose en soldado una vez más.\n\n¿Pero esta vez? Fue diferente. Las pesadillas y la parálisis del sueño no volvieron. No buscaba hacer daño a los demás.\n\nEsta vez, se trataba de protegerse a sí mismo.",

		["bm_msk_dallas_halloween"] = "Reflexión del Monstruo",
		["bm_msk_dallas_halloween_desc"] = "Pasas tantos años construyendo identidades falsas, mentiras e historias, que empiezas a perderte a ti mismo.\n\nEmpiezas a ir de una persona a otra, adquiriendo rasgos y peculiaridades de tus amigos, amantes y ligues. Tal vez empiecen a mezclarse y te sientas como una amalgama.\n\nDallas se despertó una mañana de octubre, caminando hacia el espejo -- el pelo teñido de un feo rubio y un afeitado desigual. Un traje de pacotilla, manchado de sudor por las pesadillas incesantes. Un dolor de cabeza palpitante tras un fin de semana saltando de licor en licor.\n\nMirándose a sí mismo, lo único que podía pensar es que se parecía más a un monstruo de Frankenstein que a una persona: sólo trozos lo suficientemente convincentes como para llegar más lejos en su carrera criminal.\n\nFue un punto de inflexión, pero a veces sigue sin poder quitarse de encima la sensación de que sus piezas no son todas suyas.",

		["bm_msk_hoxton_halloween"] = "Sueño de Halloween",
		["bm_msk_hoxton_halloween_desc"] = "Uno de los recuerdos de Halloween de Hoxton fue viajar a Estados Unidos en octubre con su familia, para conocer Nueva York como una especie de escapada especial.\n\nNunca fue un gran aficionado a los dulces, pero le encantaba el pastel de calabaza que se servía en la fiesta de su pariente.\n\nMientras deambulaba por los pasillos fuera de la sala de fiestas, vio una gran puerta de bóveda, y baratijas y riquezas de todo tipo siendo introducidas.\n\nDesde entonces, siempre le ha gustado asaltar lugares durante las vacaciones.",

		["bm_msk_wolf_halloween"] = "Llanto del Diablo",
		["bm_msk_wolf_halloween_desc"] = "En una fría tarde de octubre de 2010, Wolf aún se estaba recuperando de las secuelas financieras de la quiebra de su empresa.\n\nTumbado solo en la habitación de un motel, pensó en su familia, en cómo sentía que les había fallado y en cómo podría no volver a verlos nunca más -- a todo un país de distancia y desamparado después de que le cortaran su última línea de vida.\n\nSe había gastado todos sus ahorros en un viaje a Estados Unidos, en un intento por conseguir el dinero suficiente para empezar de cero con una nueva casa, estaba destrozado.\n\nSemanas después, yendo y viniendo entre casas de amigos, moteles y albergues, recibió la primera llamada de su pareja en semanas.\n\nLa relación había terminado. 'No veo que esto funcione bien por más tiempo'.\n\nTal vez había un nuevo comienzo.\n\nTal vez había una nueva profesión a la que dedicarse.",


		["pattern_jkl_patt01_title"] = "Jackal", --Bob: No se donde aparece esto y tampoco se si los primeros dos deberian estar al reves
		["pattern_jkl_patt02_title"] = "Compañia",
		["material_jkl_matt01_title"] = "Plumas de Combate",
		["material_jkl_matt02_title"] = "Oro Veritas",

		["menu_scores"] = "PUNTAJES", --Bob: No se donde aparece esto

		["RestorationModColorOption"] = "Cambia el color de este elemento de la interfaz a tu gusto",
		["RestorationModColorsOptionsButtonTitleID"] = "Ajustes de color",
		["RestorationModColorsOptionsButtonDescID"] = "Cambiar el color de muchos objetos de la interfaz.",
		["RestorationModObjectivesBGTitleID"] = "Fondo de objetivos",
		["RestorationModObjectivesFGTitleID"] = "Primer plano de objetivos",
		["RestorationModAssaultBGTitleID"] = "Fondo de asalto",
		["RestorationModAssaultFGTitleID"] = "Primer plano de asalto",
		["RestorationModNoReturnTitleID"] = "Texto de punto de no retorno",
		["RestorationModTimerTextTitleID"] = "Texto de temporizador del atraco",
		["RestorationModAssaultEndlessBGTitleID"] = "Fondo de asalto de capitán",
		["RestorationModAssaultSurvivedBGTitleID"] = "Fondo de asalto sobrevivido",
		["RestorationModStaminaTitleID"] = "Resistencia",
		["RestorationModStaminaThresholdTitleID"] = "Umbral de resistencia", --Bob: No se donde aparece esto
		["RestorationModBagBitmapTitleID"] = "Bolsa",
		["RestorationModBagTextTitleID"] = "Texto de bolsa",
		["RestorationModNoReturnTextTitleID"] = "Texto de punto de no retorno",
		["RestorationModHostagesTextTitleID"] = "Texto de rehenes",
		["RestorationModHintTextTitleID"] = "Texto de pistas",
		["RestorationModMaskOnTextTitleID"] = "Texto de equipar máscara",
		["RestorationModDownsThreePlusTitleID"] = "Contador de vidas (3+ vidas restantes)",
		["RestorationModDownsTwoTitleID"] = "Contador de vidas (2 vidas restantes)",
		["RestorationModDownsOneTitleID"] = "Contador de vidas (1 vidas restantes)",
		["RestorationModDownsZeroTitleID"] = "Contador de vidas (0 vidas restantes)",
		["RestorationModStopAllBotsTitleID"] = "Detener a todos los bots",
		["RestorationModStopAllBotsDescID"] = "Detiene a todos los miembros del equipo controlados por la IA manteniendo pulsada la tecla Detener IA.",
		["RestorationModPONRTrackTitleID"] = "Música De Punto De No Retorno",
		["RestorationModPONRTrackDescID"] = "Cambia la banda sonora en Trabajos Pro cuando comience el punto de no retorno.",
		["RestorationModPONRTracksTitleID"] = "Música De Punto De No Retorno",
		["RestorationModPONRTracksDescID"] = "Selecciona la banda sonora para Trabajos Pro cuando comience el punto de no retorno.",
		["RestorationModMusicShuffleTitleID"] = "Música Aleatoria",
		["RestorationModMusicShuffleDescID"] = "Cambia la banda sonora al terminar un asalto.",
		["RestorationModScaleTitleID"] = "Escala de la interfaz",
		["RestorationModScaleDescID"] = "Cambia la escala de la interfaz. Puede requerir un reinicio.",
		["RestorationModSizeOnScreenTitleID"] = "Tamaño de la interfaz en la pantalla",
		["RestorationModSizeOnScreenDescID"] = "Cambia el tamaño de la interfaz en la pantalla. Puede requerir un reinicio.",
		["RestorationModTeammateTitleID"] = "Panel de compañeros Alfa",
		["RestorationModTeammateDescID"] = "Activar o desactivar el panel de compañeros de equipo Alfa, que muestra tus estadísticas y las de tu equipo.",
		["RestorationModHeistTimerTitleID"] = "Temporizador de atraco Alfa.",
		["RestorationModHeistTimerDescID"] = "Activar o desactivar el temporizador de atraco Alfa.",
		["RestorationModMaskOnTitleID"] = "Texto para equipar máscara Alfa",
		["RestorationModMaskOnDescID"] = "Activar o desactivar texto para equipar máscara Alfa.",
		["RestorationModNameLabelsTitleID"] = "Etiquetas de nombre Alfa", --Bob: Probablemente se puede usar otro termino en vez de etiquetas
		["RestorationModNameLabelsDescID"] = "Activar o desactivar las etiquetas de nombre alfa.",
		["RestorationModHintTitleID"] = "Panel de pistas Alfa",
		["RestorationModHintDescID"] = "Activar o desactivar el panel de pistas alfa.",
		["RestorationModExtraOptionsButtonTitleID"] = "Más opciones de interfaz",
		["RestorationModExtraOptionsButtonDescID"] = "¡Aún más opciones!",
		["RestorationModRealAmmoTitleID"] = "Munición Real",
		["RestorationModRealAmmoDescID"] = "El contador de munición total ignora la munición que hay actualmente en tu arma.",
		["RestorationModStealthOrigPosTitleID"] = "Posicionamiento Medidor De Detección Base",
		["RestorationModStealthOrigPosDescID"] = "Coloca el medidor de detección en la misma zona que el juego base.",
		["RestorationModLowerBagTitleID"] = "Notificación de bolsa más baja",
		["RestorationModLowerBagDescID"] = "Baja la alerta que aparece al tomar una bolsa.",
		["RestorationModAssaultStyleTitleID"] = "Estilo Panel Asalto",
		["RestorationModAssaultStyleDescID"] = "Permite elegir el estilo de panel de asalto que quieras utilizar.",
		["RestorationModCasingTickerTitleID"] = "Texto De Modo Observador Alfa",
		["RestorationModCasingTickerDescID"] = "Activar o desactivar texto de modo Observador Alfa (Requiere estilo de cinta Alfa).",
		["RestorationModCustodyTitleID"] = "Custodia Alfa",
		["RestorationModCustodyDescID"] = "Activar o desactivar el panel de custodia alfa.",
		["RestorationModCrimenetTitleID"] = "CRIMENET Alfa (NO TERMINADO)",
		["RestorationModCrimenetDescID"] = "Activar o desactivar CRIMENET alfa.",
		["RestorationModProfileTitleID"] = "Marco De Perfil Alfa",
		["RestorationModProfileDescID"] = "Activar o desactivar el marco de perfil alfa.",
		["RestorationModNewsfeedTitleID"] = "Noticias Alfa",
		["RestorationModNewsfeedDescID"] = "Activar o desactivar Noticias alfa.",
		["RestorationModUppercaseNamesTitleID"] = "Nombres En Mayúsculas",
		["RestorationModUppercaseNamesDescID"] = "Activar o desactivar los nombres en mayúsculas.",
		["RestorationModPeerColorsTitleID"] = "Colores Pares Alfa",
		["RestorationModPeerColorsDescID"] = "Activa o desactiva los colores alfa.", --Bob: No se a que se refiere con esta opcion
		["RestorationModPocoCrimenetAlignSortTitleID"] = "Alinear y ordenar CRIMENET de Poco", --Bob: Esto se refiere al poco hud?
		["RestorationModPocoCrimenetAlignSortDescID"] = "Alinea y ordena CRIMENET por dificultad.",
		["RestorationModPocoCrimenetScaleTitleID"] = "Escala de CRIMENET de Poco", --Bob: Esto se refiere al poco hud?
		["RestorationModPocoCrimenetScaleDescID"] = "Permite ajustar la escala de CRIMENET.",
		["RestorationModVoiceIconTitleID"] = "Icono De Chat De Voz",
	    ["RestorationModVoiceIconDescID"] = "Mostrar cuando un jugador está usando el chat de voz dentro del juego.",
		["RestorationModNewsFeedStyleTitleID"] = "Estilo Alfa De Noticias", --Bob: Comprobar si newsfeed tiene otro nombre
		["RestorationModNewsFeedStyleDescID"] = "Te permite elegir entre mostrar las noticias y los nuevos trabajos o sólo las noticias.",
		["alpha_assault"] = "Esquina Alpha Temprana",
		["beta_assault"] = "Cinta Alfa", --Bob: No se como se interpretaria esto
		["show_both"] = "Predeterminado",
		["show_classic_newsfeed"] = "Clásico",

		["RestorationModDodgeDisplayTitleID"] = "Medidor de Esquiva",
		["RestorationModDodgeDisplayDescID"] = "Cambia lo que *muestra* el valor máximo del medidor de esquiva. Requiere reinicio.",
		["dd_scale"] = "150 -Esquiva", --Bob: Asumo que se refiere a que resta a 150 el valor total de tu esquiva
		["dd_150"] = "150",
		["dd_100"] = "100",

		["menu_ingame_manual"] = "Guía del Mod",
		["menu_ingame_manual_help"] = "Ver la guía de Restoration Mod.",

		["menu_asset_wet_add_saw"] = "Sierra Adicional",
		["menu_asset_wet_add_saw_desc"] = "Comprar una sierra adicional",
		["menu_rush_asset_sentrygun"] = "Paquete de Torreta",
		["menu_rush_asset_sentrygun_desc"] = "Compra un paquete de Torreta",

		["heist_junker_name"] = "Vigilantes",
		["heist_junker_brief"] = "Este es un trabajo para Vlad. Aparentemente, un trato comercial fallido ha dejado a sus hombres y la mercancía que traían en una mala situación -- Los federales están cerca del caso. Tenemos un vehículo listo para llevaros al lugar, y luego podéis proporcionar apoyo. Conseguiremos un helicóptero de apoyo, y os sacaremos con lo esencial de allí.\n\nEsto debería ser corto, pero no subestiméis a la policía. Traed equipo de combate.",
		["heist_junk_name"] = "Ojos Vigilantes",
		["heist_junk_brief"] = "La zona de obras está justo delante. La policía aún no ha llegado pero lo hará en breve. Los hombres de Vlad os darán apoyo, pero no durarán mucho.\n\nAl parecer, hay un laboratorio de metanfetamina en el lugar, así que no dudéis en ganar un dinerillo extra si al mismo tiempo podéis mantener a salvo la mercancía de Vlad.",
		["junk_01"] = "DEFIENDE EL DINERO Y LAS DROGAS",
		["junk_01_desc"] = "¡Mantén a la policía alejada del botín!  Debes defender tanto la coca como el dinero.",
		["junk_02"] = "COLOCA Y DISPARA A CADA BIDÓN DE GASOLINA PARA ENCENDERLOS",
		["junk_02_desc"] = "Enciende un fuego, alertará al piloto de tu posición.",
		["junk_03"] = "DEFIENDE EL DINERO Y LAS DROGAS",
		["junk_03_desc"] = "¡No dejes que la policía asegure nada de la mercancía de Vlad! ¡Pierde demasiadas bolsas y la operación será un fracaso!",
		["junk_04"] = "ASEGURA LA MERCANCÍA DE VLAD",
		["junk_04_desc"] = "Asegura la cocaína de Vlad. Sus propios hombres se encargarán de asegurar el dinero.",
		["junk_05"] = "EXTRACCIÓN DISPONIBLE",
		["junk_05_desc"] = "Abandona la zona en cuanto estés satisfecho.",

		["heist_int_dock_name"] = "Wetworks",
		["heist_int_dock_brief"] = "Este almacén es propiedad de Murkywater Logistics.  Al menos, por el momento. Lo han estado utilizando como almacén de botín durante un tiempo, pero recientemente, fueron vistos trasladando algunos servidores 'clasificados'. Contactos sugieren que están guardando información sobre la alianza entre ellos y OMNIA.\n\nEn sigilo o entrando a saco, el único objetivo es llegar a esos servidores y recuperar los datos. Esperen resistencia sin importar el método.",
		["heist_wetwork_name"] = "Wetworks",
		["heist_wetwork_brief"] = "Este almacén es propiedad de Murkywater Logistics.  Al menos, por el momento. Lo han estado utilizando como almacén de botín durante un tiempo, pero recientemente, fueron vistos trasladando algunos servidores 'clasificados'. Contactos sugieren que están guardando información sobre la alianza entre ellos y OMNIA.\n\nEn sigilo o entrando a saco, el único objetivo es llegar a esos servidores y recuperar los datos. Esperen resistencia sin importar el método.",
		["obj1_enterwarehouse"] = "ENTRA EN EL ALMACÉN",
		["obj1_enterwarehouse_desc"] = "Entra en el almacén.",
		["obj2_findsecuritydoor"] = "ENCUENTRA LA SALA DE SERVIDORES",
		["obj2_findsecuritydoor_desc"] = "Localiza la sala de servidores. Debería estar en algún lugar del almacén, probablemente detrás de una puerta cerrada.",
		["obj3_getsecuritydooropen"] = "ABRE LA PUERTA",
		["obj3_getsecuritydooropen_desc"] = "Encuentra una manera de abrir la puerta.",
		["obj4_openseconddoor"] = "ENTRA EN LA SALA DE SERVIDORES",
		["obj4_openseconddoor_desc"] = "Entra en la sala de servidores. Una tarjeta de acceso o un taladro podrían ayudar.",
		["obj5_hack"] = "HACKEA EL PORTÁTIL",
		["obj5_hack_desc"] = "Hackea el portátil con el software proporcionado por Jackal.",
		["obj5b_explode"] = "¡DESACTIVA EL C4!",
		["obj5b_explode_desc"] = "¡C4! ¡Desactívalos o corre!",
		["obj6_wait"] = "ENVIA LOS DATOS",
		["obj6_wait_desc"] = "El hackeo ha terminado. Envía los datos a Jackal.",
		["obj7_escapeorloot"] = "EXTRACCIÓN DISPONIBLE",
		["obj7_escapeorloot_desc"] = "Abandona la zona en cuanto estés satisfecho.",

		["heist_int_dock_burn_name"] = "Quemado",
		["heist_int_dock_burn_brief"] = "No hay tiempo para planes detallados, van a mover los servidores maestros adicionales.\nEl conductor va a dejar un camión lleno de payasos armados en su puerta.",
		["heist_wetwork_burn_name"] = "Quemado",
		["heist_wetwork_burn_brief"] = "Muy bien, ya casi estamos en el sitio. Habéis estado aquí antes, pero esta vez vamos a liarla parda.\nPodría haber algún botín todavía escondido por ahí, pero eso es secundario.\n\nEstad atentos a cualquier cosa que podáis usar para ver lo que hay dentro de los contenedores cerrados. Cámaras, objetos alrededor de los contenedores, pizarras, y cosas así.",
		["wwburn_01"] = "PREPÁRATE",
		["wwburn_01_desc"] = "Estamos en la puerta principal, Murkywater estará por todas partes así que saquen las armas.",
		["wwburn_02"] = "BUSCA LOS SERVIDORES",
		["wwburn_02_desc"] = "Localiza los tres contenedores que contienen los servidores maestros.",
		["wwburn_03"] = "QUEMA LAS COPIAS DE SEGURIDAD",
		["wwburn_03_desc"] = "Quema las copias de seguridad de los servidores maestros, estarán en los mismos contenedores.",
		["wwburn_04"] = "EXTRACCIÓN DISPONIBLE", --Bob: No estoy seguro si el original dice escape o extraccion
		["wwburn_04_desc"] = "Escapa, o consigue más botín si te sientes codicioso.",

		["wwburn_serverpku"] = "Proteje", --Bob: No se en que contexto salen estos mensajes
		["wwburn_gaspku"] = "Recoge",
		["wwburn_defend"] = "Defiende",
		["wwburn_container"] = "Contenedor",

		["menu_jukebox_resmusic_wetwork"] = "Spectre Shark", --Bob: Solo traducire lo que esta en parentesis
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
		["menu_jukebox_resmusic_ticktockalpha"] = "Tick Tock (Versión Alfa)",
		["menu_jukebox_screen_resmusic_ticktockalpha"] = "Tick Tock (Versión Alfa)",
		["menu_jukebox_resmusic_doublecrossbeta"] = "Double Cross (Versión Beta)",
		["menu_jukebox_screen_resmusic_doublecrossbeta"] = "Double Cross (Versión Beta)",
		["menu_jukebox_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Versión Beta)",
		["menu_jukebox_screen_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Versión Beta)",
		["menu_jukebox_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Versión Antigua)",
		["menu_jukebox_screen_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Versión Antigua)",
		["menu_jukebox_resmusic_razormindbeta"] = "Razormind (Versión Beta)",
		["menu_jukebox_screen_resmusic_razormindbeta"] = "Razormind (Versión Beta)",
		["menu_jukebox_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_screen_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_screen_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_screen_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_m1"] = "Criminal Intent (Versión Antigua)",
		["menu_jukebox_screen_m2"] = "Preparations (Versión Antigua)",
		["menu_jukebox_screen_m3"] = "Blueprints (Versión Prototipo)",
		["menu_jukebox_screen_m4"] = "Resistance",
		["menu_jukebox_screen_m5"] = "Fortress",
		["menu_jukebox_screen_m6"] = "Payday Royale Theme",
		["menu_jukebox_screen_m7"] = "Pre-Planning", --Bob: Deberia traducir esto?
		["menu_jukebox_screen_m_holiday"] = "The Headless Bulldozer", --Bob: Deberia traducir esto?

		["menu_color_plus"] = "E3 PAYDAY+", --Bob: Dejare sin traducir la mayoria
		["menu_color_rvd1"] = "Invertido",
		["menu_color_e3nice"] = "E3 Nice",
		["menu_color_force"] = "E3 BHD",
		["menu_color_halloween"] = "Change",
		["menu_color_halloween2"] = "Pumpkin Spice",

		["color_plus"] = "E3 PAYDAY+", --Bob: Dejare sin traducir la mayoria
		["color_rvd1"] = "Invertido",
		["color_e3nice"] = "E3 Nice",
		["color_force"] = "E3 BHD",
		["color_halloween"] = "Change",
		["color_halloween2"] = "Pumpkin Spice",

		["gm_gms_purchase"] = "Comprar con Monedas del Continental",
		["gm_gms_purchase_window_title"] = "¿Estás seguro?",
		["gm_gms_purchase_window_message"] = "¿De verdad quieres comprar '{1}'?\n\nTe costará {2} {3}.",
		["gm_gms_purchase_failed"] = "No Se Puede Comprar",
		["gm_gms_free_of_charge_message"] = "{1} es gratuito y puede aplicarse a tantas armas como desees.",
		["gm_gms_cannot_afford_message"] = "No puedes comprar {1}, ya que no tienes suficiente {3} para pagarlo. Para comprar {1}, necesitas {2} {3}",

		["bm_menu_amount_locked"] = "NINGUNO EN STOCK",

		["resmod_challenges"] = "Desafíos",
		["resmod_challenges_hint"] = "Ver desafíos completados y activos.",
		["resmod_active_challenges"] = "Desafíos Activos",
		["resmod_active_challenges_hint"] = "Desafíos actuales y activos.",
		["resmod_completed_challenges"] = "Desafíos Completados",
		["resmod_completed_challenges_hint"] = "Desafíos completados y recompensados.", --Bob: Tal vez recompensados se puede cambiar por reclamados aunque no estoy seguro como funicona in game

		["ch_vs_desc"] = "Usando $weapon, mata $count $eneType. Usar armas cuerpo a cuerpo no contribuye a este desafío.",
		["ch_vs_head_shots_desc"] = "Usando $weapon, mata $count $eneType con disparos en la cabeza.",
		["ch_vs"] = "$weapon VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon VS. $eneType HEADSHOTS $no",

		["ene_law"] = "EL MUNDO",
		["ene_law_desc"] = "unidades hostiles",

		["menu_me"] = "JUGADOR", --Bob: No se donde aparece esto, asi que lo pondre como jugador hasta descubrir donde sale

		["RestorationModPDTHChallengesTitleID"] = "Mostrar desafíos PD:TH",
		["RestorationModPDTHChallengesDescID"] = "Alterna la visibilidad de los desafíos PD:TH en el menú y en el hud.",

		["RestorationModRaidLockPickingTitleID"] = "Modificar Ganzúas",
		["RestorationModRaidLockPickingDescID"] = "¿Debería el mod modificar las ganzúas? Esto cambia la jugabilidad en torno a forzar cerraduras",
		["RestorationModRaidLockPickingVOTitleID"] = "Reproducir Líneas De Voz",
		["RestorationModRaidLockPickingVODescID"] = "¿Debería el mod reproducir líneas de voz al forzar cerraduras?",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT Forzar Cerradura",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT Convertir",
		["hud_legend_exit"] = "$BTN_CANCEL Salir",
		["RestorationModArmorFixTitleID"] = "Arreglo De Parpadeo Del Blindaje",
		["RestorationModArmorFixDescID"] = "Habilitar o deshabilitar el parpadeo del blindaje.",

		-- /// Challenges Below ///

		["ch_deploy_ammobag_hl"] = "¡Última Bala!",
		["ch_deploy_ammobag"] = "Despliega $count Bolsas de Munición.",
		["ch_plant_tripmine_hl"] = "Espectáculo Láser",
		["ch_plant_tripmine"] = "Despliega $count Minas Sensor.",
		["ch_deploy_medicbag_hl"] = "Beneficios Del Seguro",
		["ch_deploy_medicbag"] = "Despliega $count Bolsas Médicas.",
		["ch_deploy_ecm_hl"] = "Rompe Sistemas",
		["ch_deploy_ecm"] = "Despliega $count ECMs.",
		["ch_deploy_fak_hl"] = "Línea Vital",
		["ch_deploy_fak"] = "Despliega $count Botiquínes De Primeros Auxilios.",
		["ch_deploy_sentry_hl"] = "Entusiasta De White Mesa",
		["ch_deploy_sentry"] = "Despliega $count Torretas Portátiles.",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "ARMADURA PESADA, Y ARMAS MÁS PESADAS",
		["ch_watchdogs_d1_heavy_wpn1"] = "Completa el primer dia del trabajo PERROS GUARDIANES, usando la Armadura Corporal Experimental y usando únicamente miniguns, el rifle antimateria Thanatos, o el Lanzacohetes HRL-7, en la dificultad OVERKILL o superior.  Debes haber jugado desde el principio del trabajo para completar este desafío.",

		-- New challanges
		["ch_melee_test"] = "Capa y Espada",
		["ch_melee_test_desc"] = "Mata al Capitán Autumn usando únicamente tus puños",
		["ch_pro_job_test"] = "Ni Siquiera El Ejército Podría Detenernos",
		["ch_pro_job_test_desc"] = "Completa el trabajo Pirómanos con trabajo pro activado en la dificultad DEVASTACIÓN o superior",
		["ch_summers_test"] = "Las Viejas Generaciones Son Mejores",
		["ch_summers_test_desc"] = "Mata al Capitán Summers usando únicamente el Lanzallamas Mk.1",
		["ch_winters_test"] = "Injusticia servida",
		["ch_winters_test_desc"] = "Mata al Capitán Winters mientras sujeta su escudo usando únicamente la Navaja Automática o el Cuchillo Mariposa Wing.",
		["ch_spring_test"] = "El Mío Es Más Grande Que El Tuyo",
		["ch_spring_test_desc"] = "Mata al Capitán Spring usando únicamente la Minigun Vulcan o la Microgun XL", --Bob: La microgun en el original no incluye numeros al final
		
		["ch_pdth_style_fwb"] = "A La Vieja Escuela: First World Bank",
		["ch_pdth_style_fwb_desc"] = "Completa el trabajo First World Bank en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_heat"] = "A La Vieja Escuela: Heat Street",
		["ch_pdth_style_heat_desc"] = "Completa el trabajo Heat Street en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_panic"] = "A La Vieja Escuela: Panic Room",
		["ch_pdth_style_panic_desc"] = "Completa el trabajo Panic Room en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_bridge"] = "A La Vieja Escuela: Green Bridge",
		["ch_pdth_style_bridge_desc"] = "Completa el trabajo Green Bridge en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_diamond"] = "A La Vieja Escuela: Diamond Heist",
		["ch_pdth_style_diamond_desc"] = "Completa el trabajo Diamond Heist en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_slaughterhouse"] = "A La Vieja Escuela: Slaughterhouse",
		["ch_pdth_style_slaughterhouse_desc"] = "Completa el trabajo Slaughterhouse en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_counterfeit"] = "A La Vieja Escuela: Counterfeit",
		["ch_pdth_style_counterfeit_desc"] = "Completa el trabajo Counterfeit en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_undercover"] = "A La Vieja Escuela: Undercover",
		["ch_pdth_style_undercover_desc"] = "Completa el trabajo Undercover en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		["ch_pdth_style_nomercy"] = "A La Vieja Escuela: No Mercy",
		["ch_pdth_style_nomercy_desc"] = "Completa el trabajo No Mercy en la dificultad OVERKILL o superior, usando el traje de dos piezas o el chaleco antibalas ligero, sin habilidades, usando el talento Innatae o Tabula Rasa, la culata del arma como cuerpo a cuerpo y armas de PD:TH",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "Estado",
		["menu_state_filter"] = "Filtro de Estado",
		["menu_state_filter_help"] = "Muestra el estado de la sala",
		["menu_state_lobby"] = "En Sala",
		["menu_state_loading"] = "Cargando",
		["menu_state_ingame"] = "En Partida",
		
		["menu_description"] = "El Plan",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "Espada del Bulldozer sin Cabeza",
		["menu_l_global_value_halloween_sword"] = "¡OBJETO DE HALLOWEEN 2013!",
		
		["menu_l_global_value_shatters_fury"] = "¡OBJETO DE VERITAS!",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "NO MERCY",
		["heist_no_mercy_ranted_brief"] = "Estamos asaltando el Hospital Mercy en un robo de sangre. La fuente es portadora de algún tipo de virus raro y tenemos que sacárselo. Que nada nos detenga ya que la paga es considerable. Derramar un poco de sangre por esta cantidad de dinero no es el fin del mundo.",

		["heist_nmh_res_name"] = "HOSPITAL MERCY",
		["heist_nmh_res_brief"] = "Nuestro cliente necesita muestras de sangre de un paciente de la unidad de cuidados intensivos del hospital Mercy. Debemos entrar ahí, ocuparnos de las cámaras, controlar a los civiles y acceder a la base de datos para identificar al paciente. Considerando la baja seguridad de este sitio, debería ser un trabajo simple y limpio. Saldremos por la azotea al terminar. Este trabajo es un poco turbio, y me da la sensación de que nos estamos metiendo con alguna conspiración secreta militar, pero merece la pena el riesgo. Necesitaremos este Payday para el futuro, y también tendremos un lindo adicional en dinero efectivo.",
		
		["heist_nmh_new"] = "Extrae y analiza la sangre del paciente",
		["heist_nmh_new_desc"] = "Tienes que encontrar una centrifugadora para validar las muestras de sangre.",
		
		["heist_nmh_new2"] = "Llama al ascensor",
		["heist_nmh_new2_desc"] = "Pulsa el botón y espera al ascensor",
		
		["heist_nmh_new3"] = "Llama al ascensor",
		["heist_nmh_new3_desc"] = "Pulsa el botón y espera al ascensor",	
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "BANCO GO REMASTERIZADO",
		
		["heist_gobank_v2_name"] = "BANCO GO REMASTERIZADO",
		["heist_gobank_v2_brief"] = "Este es un trabajo clásico de banco. Rompan la bóveda, vacíen las cajas de depósito y saquen el botín. Simple. La información de Bain dice que esta sucursal tiene la tasa de robos más baja del país. Es hora de cambiar eso.\n\n» Buscad en el entorno tarjetas de acceso. Se necesitan dos para la bóveda\n» Si eso falla, usen una lanza térmica en la bóveda\n» Abrid las cajas de depósito\n» Monten el gancho\n» Saquen el dinero",
		
		["heist_roberts_v2_name"] = "BANCO ROBERT'S",
		["heist_roberts_v2_brief"] = "Tenemos un banco. No es una filial importante, pero la bóveda tiene temporalmente pilas de efectivo en tránsito. Notas de cambio extranjeras.\n\nEn fin, saben cómo hacerlo - a su manera. Entren sigilosamente o desaten el caos. Sea como sea, tengo una idea para sacar el dinero de ahí. Ya veran a qué me refiero. Creo que les gustará.",

		["csgo_plane_timer_text"] = "Espera al avión &&TIMER",
		["csgo_plane_timer_desc"] = "Espera al avión &&TIMER",
		
		["hud_equipment_pickup_spraycan"] = "Pulsa $BTN_INTERACT para tomar Pintura en Aerosol", --Bob: Probablemente se pueda decir aerosol a secas
		["hud_action_spraypaint"] = "Pulsa $BTN_INTERACT para pintar",
		["hud_action_spraypaint_none"] = "Requiere Pintura en Aerosol",
		["spraycan_obtained"] = "Pintura en Aerosol Obtenida",
		["hud_equipment_obtained_spraycan"] = "Pintura en Aerosol Obtenida",
		
		["trophy_csgo01"] = "Caja de Grafitis",
		["trophy_csgo01_desc"] = "Y ni siquiera tuviste que comprar este",
		["trophy_csgo01_objective"] = "Encuentra pintura en aerosol y pinta la bóveda de Banco Go Remasterizado.",

		["END"] = "FIN",	--Bob: Esto donde aparece?
		
		--Whurr Heat Street Edit
		["heist_heat_street_new_name"] = "HEAT STREET VERDADERO CLÁSICO",
		["heist_heat_street_new_brief"] = "Alguien dijo una vez que no hay nada seguro, pero este trabajo parece fácil: entrar, conseguir el maletín, salir. Vuestro conductor de confianza, Matt, os estará esperando en el callejón y mientras lleguéis a la furgoneta no hay forma de que falléis. ¿Verdad?",
		["heist_street_new_name"] = "HEAT STREET: EL ATRACO",
		["heist_street_new_brief"] = "Alguien dijo una vez que no hay nada seguro, pero este trabajo parece fácil: entrar, conseguir el maletín, salir. Vuestro conductor de confianza, Matt, os estará esperando en el callejón y mientras lleguéis a la furgoneta no hay forma de que falléis. ¿Verdad?",

		--Heat Street, Holdout edition
		["heist_skm_heat_street_name"] = "Centro - Inkwell Industrial",
		["heist_skm_heat_street_brief"] = "Los kerels interrogaron recientemente a un prisionero que afirma haber visto el rostro de Bain y poder identificarlo. Aunque sabemos que no es cierto, los kerels no, y nuestros rivales tampoco, así que vamos a aprovechar la situación para ganar algo de dinero. Interceptaremos al sujeto mientras lo trasladan a protección de testigos, cerca del antiguo almacén de la fábrica donde ese idiota de Matt estrelló su coche mientras intentaba huir de nosotros.",
		["heist_skm_street_name"] = "Secuestro: Centro - Inkwell Industrial",
		["heist_skm_street_brief"] = "Los kerels interrogaron recientemente a un prisionero que afirma haber visto el rostro de Bain y poder identificarlo. Aunque sabemos que no es cierto, los kerels no, y nuestros rivales tampoco, así que vamos a aprovechar la situación para ganar algo de dinero. Interceptaremos al sujeto mientras lo trasladan a protección de testigos, cerca del antiguo almacén de la fábrica donde ese idiota de Matt estrelló su coche mientras intentaba huir de nosotros.",		

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "LA FUGA DE HOXTON NAVIDEÑO",
		["heist_xmn_hox1"] = "LA FUGA NAVIDEÑO",
		["heist_xmn_hox_1_brief"] = "El Dentista le ha conseguido a Hoxton un segundo juicio. No, no tú, Hoxton, me refiero al viejo... Bueno, ya arreglaremos lo de los nombres. El juicio será rápido. Con su historial, no se va a ir de rositas. Pero el asunto no es ese, sino que podremos atacar cuando lo lleven al juzgado. Vamos a llevárnoslo justo después de la audiencia. Un pequeño 'que os jodan' en los morros del sistema judicial de Estados Unidos.$NL;$NL;El plan es liarla parda: reventaremos una pared del juzgado, cogeremos a Hoxton y lo sacaremos de allí.$NL;$NL;Han acordonado varias manzanas, es obvio que esperan tener problemas. Preparad las armas y coged mucha munición.",
		["heist_xmn_hox2"] = "LA BÚSQUEDA NAVIDEÑO",
		["heist_xmn_hox_2_brief"] = "Bueno, chicos, gracias por sacarme de ahí. Para empezar, no debería haber estado ahí. Alguien me ha tendido una trampa. Estoy seguro. Los federales sabían mucho sobre mí. Más de lo que esos inútiles hubiesen podido descubrir por su cuenta. Alguien me ha vendido. Alguien me ha jodido. Y voy a descubrir quién ha sido.$NL;$NL;Pero no va a ser fácil. Nada de andarse por las ramas. Nada de tratos con personas sombrías. Vamos a ir directamente a la fuente. El mayor nido de agentes del FBI. Vamos a descubrir quién me ha jodido la vida.",
		["heist_xmn_hox_brief"] = "El Dentista le ha conseguido a Hoxton un segundo juicio. Vamos a llevárnoslo justo después del juicio. El plan es liarla parda: reventaremos una pared del juzgado, cogeremos a Hoxton y lo sacaremos de allí.$NL;$NL;» Liberar a Hoxton$NL;» Llevar a Hoxton al vehículo blindado$NL;» Escoltar el vehículo blindado con Hoxton dentro$NL;» Escapar con Hoxton.",
		
		["heist_xmn_tag_name"] = "Robando a los Federales Navideño",
		
		--Rats Zipline
		["menu_alex_1_zipline_desc"] = "Tirolesa para transporte rápido de bolsas",
		
		
		--The Bomb: Forest Breifing
		["heist_crojob3_briefing"] = "Esos explosivos termobáricos fueron cargados en un tren de carga esta mañana. Se dirigen a Norfolk. Tal vez para ser vendidos, tal vez para ser desmantelados - no importa, porque no van a llegar allí. Un tren en movimiento es difícil de detener, así que lo haremos al estilo del Viejo Oeste. Vuela una sección del puente y todo se viene abajo. Es ruidoso y desastroso, pero efectivo. Los vagones se dispersarán hasta el infierno. Uno de ellos tiene una bóveda donde nuestros explosivos se encuentran - registren cada uno de ellos hasta que los encuentren. \n\nNOTA DE JACKAL:\nTengo información sobre equipos Reaper cerca de la escena - parece que Akan quiere este premio para sí mismo. Preparaos para problemas.",
		
		--Watchdogs Holdout
		["heist_skm_watchdogs_stage2_briefing"] = "Mia Calienté es una auténtica pieza, amigos. Durante años ha sido el cerebro de las operaciones de Murkywater en DC. No hace mucho, Murkywater se hizo con un almacén en los muelles y lo están utilizando como punto de distribución adicional. Nuestro objetivo está allí comprobando un botín recientemente saqueado. Vamos a entrar allí, agarrar a la dwankie y tomarla como rehén. Los Murkies no pueden permitirse perderla, pagarán por su liberación, tal vez con el ya mencionado y bastante valioso botín, ¿qué decís chicos?",  --Bob: Comprobar si dwankie se puede traducir
		
		--Side Jobs
		["menu_challenge_menu_challenge_moon_6_obj"] = "Completa el trabajo Slaughterhouse en la dificultad OVERKILL o superior sin matar al Capitán Spring.",
		
		
		--Generic Captain Text
		["hud_assault_vip"] = "MATA AL CAPITÁN PARA TERMINAR EL ASALTO",
		
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
			["hud_assault_vip"] = "¡¡NO TEMÁIS, EL CAPITÁN WINTERS ESTÁ AQUÍ!!",
		})
	elseif captain_type == restoration.captain_types.winter then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "MATA AL CAPITÁN WINTERS PARA TERMINAR EL ASALTO",
		})	
	elseif captain_type == restoration.captain_types.summer then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "MATA AL CAPITÁN SUMMERS PARA TERMINAR EL ASALTO",
		})
	elseif captain_type == restoration.captain_types.spring then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "MATA AL CAPITÁN SPRING PARA TERMINAR EL ASALTO",
		})		
	elseif captain_type == restoration.captain_types.autumn then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "MATA AL CAPITÁN AUTUMN PARA TERMINAR EL ASALTO",
		})		
	elseif captain_type == restoration.captain_types.hvh then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "ENFRÉNTATE A TUS PESADILLAS Y DESPIERTA",
		})
	end			
	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Inspeccionar Jugador",
		["menu_inspect_player_desc"] = "Inspeccionar Estadísticas Del Jugador",
		["menu_toggle_one_down_lobbies"] = "Permitir Salas Con Trabajo Pro",
		
		["heist_safehouse"] = "El Refugio - Conceptos Básicos",
		
		--Events
		
		--Anniversary Event
		["menu_pda8_1_prog_obj_desc"] = "Encuentra 2 estatuas de aniversario diferentes en Joyería, Cuatro Tiendas, Club Nocturno, Banco H&T o Destrozacentros. Tienes que terminar el atraco para que se registren las estatuas.",
		["menu_pda8_2_prog_obj_desc"] = "Como comunidad, todos los Jugadores deben gastar 5.000.000.000 de dólares sobornando policías con el Lanza Dinero y tienes que encontrar 3 estatuas de aniversario diferentes en Joyería, Cuatro Tiendas, Club Nocturno, Banco H&T o Destrozacentros. Tienes que terminar el atraco para que se registren las estatuas.",
		["menu_pda8_3_prog_obj_desc"] = "Como comunidad, todos los Jugadores deben gastar 10.000.000.000 de dólares sobornando policías con el Lanza Dinero y tienes que encontrar 4 estatuas de aniversario diferentes en Joyería, Cuatro Tiendas, Club Nocturno, Banco H&T o Destrozacentros. Tienes que terminar el atraco para que se registren las estatuas.",
		["menu_pda8_item_1_desc"] = "Como comunidad, todos los Jugadores deben gastar 15.000.000.000 de dólares sobornando policías con el Lanza Dinero y tienes que encontrar 5 estatuas de aniversario diferentes en Joyería, Cuatro Tiendas, Club Nocturno, Banco H&T o Destrozacentros. Tienes que terminar el atraco para que se registren las estatuas.",

		["menu_pda8_2_prog_obj"] = "Encuentra 3 Estatuas de Aniversario.",
		["menu_pda8_3_prog_obj"] = "Encuentra 4 Estatuas de Aniversario.",
			
		--Holdout--
		["menu_cn_skirmish"] = "Secuestro",
		["menu_skirmish"] = "Secuestro - Enfrentamiento Hostil",
		["menu_skirmish_random"] = "Ubicación Aleatoria",
		["menu_random_skirmish_subtitle"] = "Ubicación de combate aleatoria.\n\nSin recompensas semanales ni modificadores iniciales.",
		["menu_weekly_skirmish"] = "Ubicación Objetivo",
		["menu_weekly_skirmish_progress"] = "Oleadas Completadas, Recompensa Al Completarlas Todas",
		["menu_skirmish_random_briefing"] = "En este escenario, se te coloca en un SECUESTRO aleatorio.\n\nUn SECUESTRO aleatorio consta de 9 oleadas. Cada oleada consecutiva aumenta en dificultad.\n\nCada oleada completada otorga grandes recompensas en dinero y experiencia, pero si fallas se anularán todas las recompensas acumuladas.\n\nFallarás si alguien de tu equipo -- incluido tú mismo -- es detenido, o si el rehén objetivo es rescatado por hostiles.",
		["menu_weekly_skirmish_desc"] = "En este escenario, se te coloca en un SECUESTRO pre-configurado.\n\nUn SECUESTRO semanal consta de 9 oleadas, con modificadores iniciales. Cada oleada consecutiva aumenta en dificultad.\n\nCompletar todas las oleadas te otorgará recompensas semanales adicionales, además de tu recompensa en dinero.\n\n##Fallarás si alguien de tu equipo -- incluido tú mismo -- es detenido, o si el rehén objetivo es rescatado por hostiles.##",
		["menu_weekly_skirmish_tab_description"] = "Resumen De La Operación",
		["menu_weekly_skirmish_rewards"] = "Oleadas Totales Completadas y Recompensas Asociadas",
		["hud_skirmish"] = "Secuestro",
		["hud_weekly_skirmish"] = "Secuestro Semanal",
		["heist_contact_skirmish"] = "Secuestro",
		["menu_skirmish_pick_heist"] = "La Compañia Jackal Te Confía Esta Tarea",
		["menu_skirmish_map_selection"] = "Ubicaciones Objetivo",
		["menu_skirmish_selected_briefing"] = "En este escenario, puedes elegir cualquier SECUESTRO.\n\nUn SECUESTRO consta de 9 oleadas. Cada oleada consecutiva aumenta en dificultad.\n\nCada oleada completada otorga grandes recompensas en dinero y experiencia.\n\nFallarás si el rehén objetivo es rescatado por hostiles.",
		["menu_skirmish_selected"] = "Secuestro",

		--Holdout Heists--
		["heist_skm_mallcrasher"] = "Centro Comercial",
		["heist_skm_mallcrasher_h1"] = "Centro Comercial",
		["heist_skm_arena"] = "Estadio Monarch",
		["heist_skm_arena_h1"] = "Estadio Monarch",
		["heist_skm_big2"] = "Banco Benevolent",
		["heist_skm_big2_h1"] = "Banco Benevolent",
		["heist_skm_watchdogs_stage2"] = "Astillero Almendia Logistics",
		["heist_skm_watchdogs_stage2_h1"] = "Astillero Almendia Logistics",
		["heist_skm_mus"] = "Museo Andersonian",
		["heist_skm_mus_h1"] = "Museo Andersonian",
		["heist_skm_run"] = "Centro - Inkwell Industrial",
		["heist_skm_run_h1"] = "Centro - Inkwell Industrial",
		["heist_skmc_fish_name"] = "Yate Lethe",
		["heist_skmc_ovengrill_name"] = "Ovengrill Hardware",
		["heist_skmc_mad_name"] = "Laboratorios DRAK R&D",
		["heist_skm_friend_name"] = "Mansión El Fureidis",
		["heist_skm_nightmare_name"] = "El Viejo Refugio",
		["heist_skm_nightmare_lvl_name"] = "El Refugio?",

		--Heist Breifings--
		["heist_pines_briefing"] = "Es importante que lleguéis cuanto antes, pero está en medio de la nada, asi que no pasaréis desapercibidos. Encontrad al piloto: seguro que está cerca del accidente. Luego, enviaremos un helicóptero para sacarlo de ahí. No os separéis de él hasta que esté a salvo. Además, Vlad dice que ese avión estaba repleto de producto. Registrad el bosque y conseguid tanto como podáis. En navidades siempre se agradece un extra.\n\nNOTA DE JACKAL:\nLa explosión de ese accidente alertó a equipos Reaper cercanos. No esperéis una respuesta policial.",

		----Custom Achievements----
				
		--Scarface Mansion--
		["skm_friend_name"] = "SECUESTRO - MANSIÓN EL FUREIDIS",
		["friend_3"] = "Jodiendo Con Los Mejores",
		["friend_3_desc"] = "Sobrevive al asalto 3 habiendo permanecido en la partida desde el principio.",
		["friend_3_obj"] = "Sobrevive al asalto 3 habiendo permanecido en la partida desde el principio.",
		["friend_5"] = "El Rehén Es Tuyo",
		["friend_5_desc"] = "Sobrevive al asalto 5 habiendo permanecido en la partida desde el principio.",
		["friend_5_obj"] = "Sobrevive al asalto 5 habiendo permanecido en la partida desde el principio.",
		["friend_7"] = "¿Crees Que Me matarás A Balazos?",
		["friend_7_desc"] = "Sobrevive al asalto 7 habiendo permanecido en la partida desde el principio.",
		["friend_7_obj"] = "Sobrevive al asalto 7 habiendo permanecido en la partida desde el principio.",
		["friend_9"] = "¡Míralos Correr!",
		["friend_9_desc"] = "Sobrevive al asalto 9 habiendo permanecido en la partida desde el principio.",
		["friend_9_obj"] = "Sobrevive al asalto 9 habiendo permanecido en la partida desde el principio.",

		--Safehouse Nightmare--
		["skm_nightmare_name"] = "SECUESTRO - EL VIEJO REFUGIO.",
		["nightmare_3"] = "¿De verdad que, ha llegado la hora?", --translation note: quote from HL2 ending gman speech
		["nightmare_3_desc"] = "Sobrevive al asalto 3 habiendo permanecido en la partida desde el principio.",
		["nightmare_3_obj"] = "Sobrevive al asalto 3 habiendo permanecido en la partida desde el principio.",
		["nightmare_5"] = "Mientras no ocurra nada sobrenatural, esto debería ser fácil.", --translation note: quote from TF2 spy (Helltower event)
		["nightmare_5_desc"] = "Sobrevive al asalto 5 habiendo permanecido en la partida desde el principio.",
		["nightmare_5_obj"] = "Sobrevive al asalto 5 habiendo permanecido en la partida desde el principio.",
		["nightmare_7"] = "No importa cuan oscura que sea la noche, el día siempre vuelve a aparecer.", --translation note: quote from Lulu (Final Fantasy X)
		["nightmare_7_desc"] = "Sobrevive al asalto 7 habiendo permanecido en la partida desde el principio.",
		["nightmare_7_obj"] = "Sobrevive al asalto 7 habiendo permanecido en la partida desde el principio.",
		["nightmare_9"] = "Despierte Señor Steele. Despierte y mire a su alrededor.", --translation note: quote from HL2 intro gman speech + Dallas' alias
		["nightmare_9_desc"] = "Sobrevive al asalto 9 habiendo permanecido en la partida desde el principio.",
		["nightmare_9_obj"] = "Sobrevive al asalto 9 habiendo permanecido en la partida desde el principio.",
				
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Hace que los perdigones se #{risk}#dispersen horizontalmente## en lugar de en forma de racimo.",
		["bm_wp_ns_ultima_desc_sc"] = "Aumenta la dispersión general de los perdigones en un 75%.",
		["bm_wp_upg_a_slug_sc"] = "MUNICIÓN AP",
		["bm_wp_upg_a_slug_spam_desc"] = "Dispara un proyectil de plomo que #{skill_color}#inflige 75% de su daño a través de armadura corporal, atraviesa enemigos y paredes delgadas.##",
		["bm_wp_upg_a_slug_desc"] = "Dispara un proyectil de plomo que #{skill_color}#atraviesa armadura corporal, múltiples enemigos, escudos y paredes delgadas.##",
		["bm_wp_upg_a_slug_titan_desc"] = "Dispara un proyectil de plomo que #{skill_color}#atraviesa armadura corporal, múltiples enemigos, escudos, escudos titán y paredes delgadas.##",
		["bm_wp_upg_a_explosive_desc_sc"] = "Dispara un proyectil #{heat_warm_color}#explosivo## con un radio de explosión de #{skill_color}#2## metros.\nLos proyectiles #{skill_color}#no tienen caida de daño## pero #{risk}#el daño se divide entre el proyectil y la explosión.##",
		["bm_wp_upg_a_custom_desc"] = "Dispara #{important_1}#6## perdigones más grandes y pesados que infligen #{skill_color}#más## daño.",
		["bm_wp_upg_a_custom_4_desc"] = "Dispara #{important_1}#4## perdigones más grandes y pesados que infligen #{skill_color}#más## daño.",
		--["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#15%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#90## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##", --NOT IN USE
		--["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#40%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#120## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#60%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#180## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Fires magnesium shards that have up to an #{skill_color}#80%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#240## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##",
		--Removed the "can only stun enemies before damage falloff starts" due to the DoT changes, dunno if I can bring it back
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Dispara fragmentos de magnesio que tienen hasta un #{skill_color}#15%## de probabilidad de #{heat_warm_color}#incendiar enemigos##, infligiendo #{heat_warm_color}#90## de daño en #{skill_color}#2## segundos.\n\n#{risk}#La probabilidad de incendiar enemigos disminuye con la distancia.##", --NOT IN USE
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Dispara fragmentos de magnesio que tienen hasta un #{skill_color}#40%## de probabilidad de #{heat_warm_color}#incendiar enemigos##, infligiendo #{heat_warm_color}#120## de daño en #{skill_color}#2## segundos.\n\n#{risk}#La probabilidad de incendiar enemigos disminuye con la distancia.##",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Dispara fragmentos de magnesio que tienen hasta un #{skill_color}#60%## de probabilidad de #{heat_warm_color}#incendiar enemigos##, infligiendo #{heat_warm_color}#180## de daño en #{skill_color}#2## segundos.\n\n#{risk}#La probabilidad de incendiar enemigos disminuye con la distancia.##",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Dispara fragmentos de magnesio que tienen hasta un #{skill_color}#80%## de probabilidad de #{heat_warm_color}#incendiar enemigos##, infligiendo #{heat_warm_color}#240## de daño en #{skill_color}#2## segundos.\n\n#{risk}#La probabilidad de incendiar enemigos disminuye con la distancia.##",
		["bm_wp_upg_a_rip"] = "MUNICIÓN TOMBSTONE",
		["bm_wp_upg_a_rip_auto_desc_sc"] = "Dispara perdigones #{stats_positive}#envenenados##, puede aturdir a los enemigos e infligir #{stats_positive}#60## de daño por veneno en #{skill_color}#2## seconds.\n\n#{risk}#La duración disminuye con la distancia.##",
		["bm_wp_upg_a_rip_semi_desc_sc"] = "Dispara perdigones #{stats_positive}#envenenados##, puede aturdir a los enemigos e infligir #{stats_positive}#120## de daño por veneno en #{skill_color}#4## seconds.\n\n#{risk}#La duración disminuye con la distancia.##",
		["bm_wp_upg_a_rip_pump_desc_sc"] = "Dispara perdigones #{stats_positive}#envenenados##, puede aturdir a los enemigos e infligir #{stats_positive}#180## de daño por veneno en #{skill_color}#6## seconds.\n\n#{risk}#La duración disminuye con la distancia.##",
		["bm_wp_upg_a_rip_heavy_desc_sc"] = "Dispara perdigones #{stats_positive}#envenenados##, puede aturdir a los enemigos e infligir #{stats_positive}#240## de daño por veneno en #{skill_color}#8## seconds.\n\n#{risk}#La duración disminuye con la distancia.##",
		--["bm_wp_upg_a_piercing_auto_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#96## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_semi_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#120## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_pump_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#180## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#240## bleed damage over #{skill_color}#8## seconds.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.",
		["bm_wp_upg_a_piercing_9_auto_desc_sc"] = "Dispara #{skill_color}#9## dardos #{skill_color}#perforantes##.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.",
		["bm_wp_upg_a_piercing_auto_desc_per_pellet"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.\n#{skill_color}#El daño de los disparos en la cabeza aumenta un 100% y ya no se reducen los multiplicadores de los disparos en la cabeza.##", --Bob: Quizas se puede explicar mejor lo ultimo
		["bm_wp_upg_a_piercing_9_auto_desc_per_pellet"] = "Dispara #{skill_color}#9## dardos #{skill_color}#perforantes##.\n#{skill_color}#El daño de los disparos en la cabeza aumenta un 100% y ya no se reducen los multiplicadores de los disparos en la cabeza.##",
		["bm_wp_upg_a_piercing_semi_desc_per_pellet"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.\n#{skill_color}#El daño de los disparos en la cabeza aumenta un 100% y ya no se reducen los multiplicadores de los disparos en la cabeza.##",
		["bm_wp_upg_a_piercing_pump_desc_per_pellet"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.\n#{skill_color}#El daño de los disparos en la cabeza aumenta un 100% y ya no se reducen los multiplicadores de los disparos en la cabeza.##",
		["bm_wp_upg_a_piercing_heavy_desc_per_pellet"] = "Dispara #{skill_color}#12## dardos #{skill_color}#perforantes##.\n#{skill_color}#El daño de los disparos en la cabeza aumenta un 100% y ya no se reducen los multiplicadores de los disparos en la cabeza.##",

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_1_1"] = "Mira Reflex.\n#{risk}#1.1x aumentos.##",
		["bm_wp_upg_o_1_1_health"] = "Mira Reflex que #{skill_color}#muestra la salud de los enemigos## al apuntarlos.\n#{risk}#1.1x aumentos.##",
		["bm_wp_upg_o_1_2"] = "Mira de Punto Rojo.\n#{risk}#1.2x aumentos.##",
		["bm_wp_upg_o_1_5"] = "Mira Holográfica.\n#{risk}#1.5x aumentos.##",
		["bm_wp_upg_o_1_5_pris"] = "Mira Prismática.\n#{risk}#1.5x aumentos.##",
		["bm_wp_upg_o_1_5_scope"] = "Mira Telescópica de Baja Potencia.\n#{risk}#1.5x aumentos.##",
		["bm_wp_upg_o_1_8"] = "Mira de punto rojo.\n#{risk}#1.8x aumentos.##",
		--["bm_wp_upg_o_1_8_irons"] = "Red dot sight with back-up ironsights.\n#{risk}#1-1.8x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_2"] = "Mira Telescópica de Baja Potencia.\n#{risk}#2x aumentos.##",
		["bm_wp_upg_o_2_szholot"] = "Mira Holográfica térmica.\n#{risk}#2x aumentos.##\n#{skill_color}#Marca automáticamente## guardias, enemigos de élite y enemigos especiales cuando les apuntas.\n\n#{risk}#NOTA: Solo puedes marcar guardias en sigilo.##",
		["bm_wp_upg_o_2_5"] = "Mira Telescópica de Baja Potencia.\n#{risk}#2.5x aumentos.##",
		["bm_wp_upg_o_3"] = "Mira Telescópica de Alcance Medio.\n#{risk}#3x aumentos.##",
		["bm_wp_upg_o_3_range"] = "Mira Telescópica de Alcance Medio con #{skill_color}#Telémetro.##\n#{risk}#3x aumentos.##",
		["bm_wp_upg_o_3_rds"] = "Mira Telescópica de Alcance Medio con mira reflex.\n#{risk}#1.1-3x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar de mira.",
		["bm_wp_upg_o_3_4"] = "Mira Telescópica de Alcance Medio.\n#{risk}#3.4x aumentos.##",
		["bm_wp_upg_o_3_5"] = "Mira Telescópica de Alcance Medio.\n#{risk}#3.5x aumentos.##",
		["bm_wp_upg_o_4"] = "Mira Telescópica de Alcance Medio\n#{risk}#4x aumentos.##",
		["bm_wp_upg_o_4_cod"] = "Mira Telescópica de Alcance Medio.\n¿Dónde está la #{skill_color}#Potencia de Fuego## cuando la necesitas?\n#{risk}#4x aumentos.##",
		["bm_wp_upg_o_4_range"] = "Mira Telescópica de Alcance Medio con #{skill_color}#Telémetro.##\n#{risk}#4x aumentos.##",
		["bm_wp_upg_o_4_irons"] = "Mira Telescópica de Alcance Medio con mira de hierro.\n#{risk}#1-4x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar de mira.",
		["bm_wp_upg_o_4_rds"] = "Mira Telescópica de Alcance Medio con mira reflex integrada.\n#{risk}#1.1-4x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar de mira.",
		["bm_wp_upg_o_4_rds_mount"] = "LPVO de Alcance Medio con mira reflex montada en la parte superior.\n#{risk}#1.1-2-4x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre aumentos y mira.",
		["bm_wp_upg_o_4_vari"] = "Mira telescópica con zoom variable.\n#{risk}#4-8x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre aumentos.",
		["bm_wp_upg_o_4_valentine"] = "\"¡Tengo una tarea para todos vosotros!\"\nMira telescópica con zoom variable.\n#{risk}#4-8x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre aumentos.",
		["bm_wp_upg_o_4_valentine_x"] = "¡No me importa una mierda! ¡No me importa un carajo!\n¡No me importa una mierda! ¡No me importa un carajo!\n Si me importara una mierda, ¡podría importarme un carajo!\nPero no me importa una mierda, ¡así que no me importa un carajo!",
		["bm_wp_upg_o_5"] = "Mira telescópica de largo alcance.\n#{risk}#5x aumentos.##",
		["bm_wp_upg_o_5_range"] = "Mira telescópica de largo alcance con #{skill_color}#Telémetro.##\n#{risk}#5x aumentos.##",
		["bm_wp_upg_o_5_vari"] = "Mira telescópica con zoom variable.\n#{risk}#5-8x aumentos.##\n\nPresiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre aumentos.",
		["bm_wp_upg_o_6"] = "Mira telescópica de largo alcance.\n#{risk}#6x aumentos.##",
		["bm_wp_upg_o_6_range"] = "Mira telescópica de largo alcance con #{skill_color}#Telémetro.##\n#{risk}#6x aumentos.##",
		["bm_wp_upg_o_8"] = "Mira telescópica de largo alcance.\n#{risk}#8x aumentos.##",
		["bm_wp_upg_o_8_range"] = "Mira telescópica de largo alcance con #{skill_color}#Telémetro.##\n#{risk}#8x aumentos.##",

		["bm_wp_upg_fl_flashlight"] = "Enciende o apaga la linterna pulsando #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_laser"] = "Enciende o apaga el láser pulsando #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_dual"] = "Alterna entre el láser y la linterna pulsando #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_vmp_marker"] = "#{skill_color}#Marca automáticamente## guardias, enemigos de élite y enemigos especiales a menos de #{skill_color}#40## metros de ti cuando les apuntas.\n\n#{risk}#NOTA: Solo puedes marcar guardias en sigilo.##",
		["bm_wp_upg_fl_second_sight_warning"] = "\n\n#{important_1}#NO SE PUEDE CAMBIAR MIENTRAS SE APUNTA, YA QUE HAY UNA MIRA SECUNDARIA ACOPLADA.##",

		["bm_wp_upg_o_angled_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre la mira principal y la mira de hierro angulada.",
		["bm_wp_upg_o_angled_1_1_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre la mira principal y la mira reflex angulada.\n#{skill_color}#1.1x aumentos.##",
		["bm_wp_upg_o_angled_1_2_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre la mira principal y la mira de punto rojo angulada.\n#{skill_color}#1.2x aumentos.##",
		["bm_wp_upg_o_angled_laser_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre tu mira principal o para inclinar tu arma y utilizar tu láser para apuntar.\n\n#{risk}#Altamente recomendado usar un accesorio láser.##", --VMP Point Shoot Laser
		["bm_wp_upg_o_angled_aim_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para cambiar entre apuntar normal o inclinado.##", --VMP Point Shoot Laser

		["bm_wp_upg_o_magnifier_desc"] = "Presiona #{skill_color}#$BTN_GADGET## mientras apuntas para subir/bajar la lente de aumento.\n#{risk}#3x aumentos.##",

		--'Nade Launchers--
		--Incendiary UGL Nades
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Dispara un proyectil que crea un #{heat_warm_color}#charco de fuego## en el punto de impacto.\nEl charco tiene un radio de #{skill_color}#3.75m##, dura #{skill_color}#5## segundos e inflige #{skill_color}#120## de daño por segundo a enemigos que se encuentren en él con una probabilidad de incendiarlos, provocando que la mayoria entre en pánico e infligiendo #{skill_color}#60## de daño adicional en #{skill_color}#3## segundos.",
		["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "Dispara un proyectil que crea un #{heat_warm_color}#charco de fuego## en el punto de impacto.\nEl charco tiene un radio de #{skill_color}#3.75m##, dura #{skill_color}#5## segundos e inflige #{skill_color}#80## de daño por segundo a enemigos que se encuentren en él con una probabilidad de incendiarlos, provocando que la mayoria entre en pánico e infligiendo #{skill_color}#60## de daño adicional en #{skill_color}#3## segundos.",
		["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "Dispara un proyectil que crea un #{heat_warm_color}#charco de fuego## en el punto de impacto.\nEl charco tiene un radio de #{skill_color}#3.75m##, dura #{skill_color}#5## segundos e inflige #{skill_color}#36## de daño por segundo a enemigos que se encuentren en él con una probabilidad de incendiarlos, provocando que la mayoria entre en pánico e infligiendo #{skill_color}#60## de daño adicional en #{skill_color}#3## segundos.",
		--Frag UGL Nade
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "Dispara un proyectil que crea una #{risk}#explosión## en el punto de impacto. La explosión inflige #{skill_color}#720## de daño y tiene un radio de #{skill_color}#5## metros.",
		--Taser UGL Nades
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "Dispara un proyectil que crea un #{ghost_color}#estallido eléctrico## en el punto de impacto. El estallido inflige #{skill_color}#360## de daño en un radio de #{skill_color}#5## metros y tiene una probabilidad de #{ghost_color}#electrocutar enemigos.##",
		["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "Dispara un proyectil que crea un #{ghost_color}#estallido eléctrico## en el punto de impacto. El estallido inflige #{skill_color}#180## de daño en un radio de #{skill_color}#5## metros y tiene una probabilidad de #{ghost_color}#electrocutar enemigos.##",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "Dispara un proyectil que crea un #{ghost_color}#estallido eléctrico## en el punto de impacto. El estallido inflige #{skill_color}#300## de daño en un radio de #{skill_color}#5## metros y tiene una probabilidad de #{ghost_color}#electrocutar enemigos.##",
		--Gas UGL Nades
		["bm_wp_upg_a_grenade_launcher_poison"] = "Granada Mantícora-6",
		["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "Dispara un proyectil que crea una #{stats_positive}#nube de gas venenoso## en el punto de impacto.\nEl gas tiene un radio de #{skill_color}#6## metros, dura #{skill_color}#8## segundos, inflige #{skill_color}#240## de daño en #{skill_color}#8## segundos, e #{stats_positive}#induce el vómito## en la mayoría de enemigos #{important_1}#1## vez.",
		["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "Dispara un proyectil que crea una #{stats_positive}#nube de gas venenoso## en el punto de impacto.\nEl gas tiene un radio de #{skill_color}#6## metros, dura #{skill_color}#6## segundos, inflige #{skill_color}#180## de daño en #{skill_color}#6## segundos, e #{stats_positive}#induce el vómito## en la mayoría de enemigos #{important_1}#1## vez.",
		["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "Dispara un proyectil que crea una #{stats_positive}#nube de gas venenoso## en el punto de impacto.\nEl gas tiene un radio de #{skill_color}#6## metros, dura #{skill_color}#4## segundos, inflige #{skill_color}#120## de daño en #{skill_color}#4## segundos, e #{stats_positive}#induce el vómito## en la mayoría de enemigos #{important_1}#1## vez.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Poco Hecho",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Duplica la duración de la quemadura en enemigos incendiados, pero reduce el daño por el tiempo a la mitad.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Reduce a la mitad la duración de la quemadura en enemigos incendiados, pero duplica el daño por el tiempo.",
		["bm_ap_flamethrower_sc_desc"] = "Miles de grados de puro dolor. ¿Cómo se llegó a esto?\n#{heat_warm_color}#Quema a través de armadura corporal.##",
		["bm_ap_money_sc_desc"] = "Miles de dólares de pura felicidad. Gira la válvula y suelta el dinero.\n#{competitive_color}#Soborna a través de armadura corporal##", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "¡Supertamaño!", -- lol
		["bm_wp_m134_body_upper_light"] = "Cuerpo Ligero",
		["bm_wp_upg_a_halfthatkit_desc"] = "Agrega una penalización del 10% a la velocidad de movimiento mientras el arma está equipada.\n\nAumenta la recogida de munición del arma en 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Agrega una penalización del 25% a la velocidad de movimiento mientras el arma está equipada.\n\nAumenta la recogida de munición del arma en 50%.",

		--Legendary Skins--
		["bm_menu_legendary"] = "Set De Apariencias De Armas",
		["bm_menu_sc_legendary_ak"] = "Rodina de Vlad",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Toque de Midas",
		["bm_menu_sc_legendary_m134"] = "El Gimp",
		["bm_menu_sc_legendary_r870"] = "Gran Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "Un AK especial que -en la guerra y el crimen- ha demostrado una sed insaciable de sangre.",
		["bm_wskn_deagle_bling_desc_sc"] = "Una Deagle fabricada a mano como testimonio de los más hábiles jugadores del mundo.",

		--Exclusive Sets--
		["bm_wp_upg_ultima_body_kit_desc_sc"] = "Este Set Exclusivo añade una #{risk}#Mira Láser Triple## única que es mutuamente esclusiva con otros accesorios.",
		["bm_wp_upg_fmg9_conversion_desc_sc"] = "Este set exclusivo añade un #{risk}#Contador de Munición de Alta Tecnología## así como una mira láser que es mutuamente exclusiva con otros accesorios.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "SIN MODIFICADOR",
		["bm_wp_upg_bonus_sc_none_desc"] = "DESACTIVA MEJORAS DE ASPECTOS DE ARMA.",
		
		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_multishot_1"] = "El daño se divide entre",
		["bm_menu_weapon_multishot_2"] = "proyectiles, cada uno infligiendo",
		["bm_menu_weapon_multishot_3"] = "de daño.",
		["bm_menu_weapon_ene_hs_mult_sub"] = "Los multiplicadores por disparos en la cabeza se reducen a ",
		["bm_menu_weapon_ene_hs_mult_add"] = "Los multiplicadores por disparos en la cabeza se aumentan a ",
		["bm_menu_weapon_ene_hs_mult_end"] = " de su valor normal.",
		["bm_menu_weapon_hs_mult_1"] = "Los disparos en la cabeza infligen un ",
		["bm_menu_weapon_hs_mult_2"] = " más de daño a los enemigos que no son capitanes.",
		["bm_menu_weapon_exp_no_hs_info"] = "#{risk}#Cargado con cartuchos explosivos;## #{skill_color}#los impactos directos infligen un 50% de daño adicional que cuenta como daño de bala.##",
		["bm_menu_weapon_movement_penalty_info"] = "Reduce la velocidad de movimiento en ",
		["bm_menu_weapon_movement_bonus_info"] = "Aumenta la velocidad de movimiento en ",
		["bm_menu_weapon_sms_bonus_info"] = "Reduce la penalización de velocidad de movimiento al disparar en ",
		["bm_menu_weapon_movement_penalty_info_2"] = " mientras está desenfundado",
		["bm_menu_sms_info_cont"] = "la penalización aumenta al disparar.",
		["bm_menu_sms_info_cont_2"] = "la penalización aumenta al disparar debido a los accesorios actuales.",
		["bm_menu_sms_info_2"] = " mientras disparas.",
		["bm_menu_stat_sms_info_2"] = " mientras disparas debido a los accesorios actuales.",
		["bm_menu_weapon_slot_search_empty"] = "\n##NO SE HAN ENCONTRADO RESULTADOS PARA## ##\"$search\"##",
		["bm_menu_weapon_slot_warning_1"] = "\n##//////////               NO  USAR               //////////\n",
		["bm_menu_weapon_slot_warning_2"] = "\n//////////               NO  USAR               //////////##",
		["bm_menu_weapon_slot_warning_primary"] = "ARMA SE TRASLADÓ A LA RANURA PRIMARIA\nSE CERRARÁ EL JUEGO SI SE UTILIZA COMO SECUNDARIO",
		["bm_menu_weapon_slot_warning_secondary"] = "ARMA SE TRASLADÓ A LA RANURA SECUNDARIA\nSE CERRARÁ EL JUEGO SI SE UTILIZA COMO PRIMARIO",
		["bm_menu_weapon_slot_warning_disabled"] = "ARMA DESHABILITADA POR EL CAPITÁN AUTUMN\nSE CERRARÁ EL JUEGO SI SE UTILIZA",
		["bm_menu_weapon_slot_warning_wtfdoido"] = "SI TODAVÍA LO TIENES EN TU INVENTARIO NO LO EQUIPES.\n\nACTUALMENTE NO SE PUEDE ENCONTRAR UNA MANERA DE EQUILIBRARLO",
		["empty"] = "",
		["missing_cap"] = "#{risk}#Custom Attachment Points## #{important_1}#no instalado.##\n\nEl accesorio adoptará el aspecto predeterminado de la ranura.",
		["bm_slamfire_generic_desc"] = "Puede usar #{skill_color}#slamfire para aumentar la cadencia## a costa de #{important_1}#más retroceso, dispersión y no poder apuntar con la mira.##",
		["bm_rapidfire_generic_desc"] = "Puede usar #{skill_color}#fuegorápido para aumentar la cadencia## a costa de #{important_1}#más retroceso y menor alcance efectivo.##",
		["bm_ap_weapon_sc_desc"] = "#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##",
		["bm_ap_weapon_semi_sc_desc"] = "#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
		["bm_ap_armor_weapon_sc_desc"] = "#{skill_color}#Puede atravesar armadura corporal.##",
		["bm_ap25_armor_weapon_sc_desc"] = "#{skill_color}#Inflige un 25% de daño adicional a través de armadura corporal.##",
		["bm_ap_armor_25_weapon_sc_desc"] = "#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",
		["bm_ap_armor_50_weapon_sc_desc"] = "#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
		["bm_ap_armor_75_weapon_sc_desc"] = "#{skill_color}#Inflige 75% de su daño a través de armadura corporal y puede atravesar a multiples enemigos y paredes delgadas.##",
		["bm_pdw_gen_sc_desc"] = "#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
		["bm_heavy_ap_weapon_sc_desc"] = "#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
		["bm_heavy_ap_no_mult_weapon_sc_desc"] = "#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",

		["bm_bow_sc_desc"] = "Mantén #{skill_color}#$BTN_FIRE## para tensar una flecha, suélta para disparar.\nEl daño y la velocidad de la flecha aumentan a medida que te acercas a la carga máxima.\n\nPulsa #{skill_color}#$BTN_AIM## para cancelar la carga.\n\nLas flechas pueden recuperarse.\n#{skill_color}#Puede atravesar armadura corporal.##",
		["bm_bow_exp_sc_desc"] = "Mantén #{skill_color}#$BTN_FIRE## para tensar una flecha, suélta para disparar.\nLa velocidad de la flecha aumenta a medida que te acercas a la carga máxima.\n\nPulsa #{skill_color}#$BTN_AIM## para cancelar la carga.\n\n#{risk}#Las flechas explotan al impactar;## #{risk}#el daño se divide entre la flecha y la explosión.##",
		["bm_w_bow_exp_desc"] = "Lanza flechas que #{risk}#explotan## al impactar en un radio de #{skill_color}#2## metros.\n\n#{important_1}#La velocidad de las flechas se reduce y no pueden recuperarse.##",
		["bm_w_bow_light_poison_desc"] = "Lanza flechas #{stats_positive}#envenenadas##, que pueden aturdir a los enemigos e infligir #{stats_positive}#180## de daño por veneno en #{skill_color}#6## segundos.\n\n#{important_1}#La velocidad de la flecha se reduce ligeramente.##",
		["bm_w_bow_heavy_poison_desc"] = "Lanza flechas #{stats_positive}#envenenadas##, que pueden aturdir a los enemigos e infligir #{stats_positive}#240## de daño por veneno en #{skill_color}#8## segundos.\n\n#{important_1}#La velocidad de la flecha se reduce ligeramente.##",

		["bm_xbow_sc_desc"] = "Los virotes pueden recuperarse.\n\n#{skill_color}#Puede atravesar armadura corporal.##",
		["bm_xbow_exp_sc_desc"] = "#{risk}#Los virotes explotan al impactar;## #{skill_color}#los impactos directos infligen un 50% de daño adicional que cuenta como daño de bala.##",
		["bm_w_xbow_exp_desc"] = "Lanza virotes que #{risk}#explotan## al impactar en un radio de #{skill_color}#2## metros.\n\n#{important_1}#La velocidad de los virotes se reduce y no pueden recuperarse.##",
		["bm_w_xbow_light_poison_desc"] = "Lanza virotes #{stats_positive}#envenenados##, que pueden aturdir a los enemigos e infligir #{stats_positive}#180## de daño por veneno en #{skill_color}#6## segundos.\n\n#{important_1}#La velocidad de los virotes se reduce ligeramente.##",
		["bm_w_xbow_heavy_poison_desc"] = "Lanza virotes #{stats_positive}#envenenados##, que pueden aturdir a los enemigos e infligir #{stats_positive}#240## de daño por veneno en #{skill_color}#8## segundos.\n\n#{important_1}#La velocidad de los virotes se reduce ligeramente.##",

		["bm_airbow_sc_desc"] = "Las flechas pueden recuperarse.\n\n#{skill_color}#Puede atravesar armadura corporal.##",
		["bm_airbow_exp_sc_desc"] = "#{risk}#Las flechas explotan al impactar;## #{skill_color}#los impactos directos infligen un 50% de daño adicional que cuenta como daño de bala.##",
		["bm_w_airbow_poison_desc"] = "Lanza flechas #{stats_positive}#envenenadas##, que pueden aturdir a los enemigos e infligir #{stats_positive}#120## de daño por veneno en #{skill_color}#4## segundos.\n\n#{important_1}#La velocidad de la flecha se reduce ligeramente.##",

		["bm_40mm_weapon_sc_desc"] = "Presiona #{skill_color}#$BTN_GADGET## para alternar la mira; con punto cero a #{skill_color}#30## metros.",
		["bm_rocket_launcher_sc_desc"] = "El daño explosivo infligido por esta arma #{skill_color}#destruye instantáneamente torretas.##",
		["bm_quake_shotgun_sc_desc"] = "Dispara ambos cañones a la vez, duplicando el número de perdigones.",
		["bm_hx25_buck_sc_desc"] = "Dispara 12 perdigones con mucha dispersión.\n\nUtiliza habilidades relacionadas con lanzagranadas y lanzacohetes.",
		["bm_auto_generated_sc_desc"] = "Esta arma utiliza estadísticas generadas automáticamente, y puede no encajar con las intenciones de los creadores o no estar perfectamente equilibrada.",
		["bm_auto_generated_ap_sc_desc"] = "Esta arma utiliza estadísticas generadas automáticamente, y puede no encajar con las intenciones de los creadores o no estar perfectamente equilibrada.\n\n#{skill_color}#Puede atravesar armadura corporal, escudos, y paredes delgadas##",
		["bm_auto_generated_sap_sc_desc"] = "Esta arma utiliza estadísticas generadas automáticamente, y puede no encajar con las intenciones de los creadores o no estar perfectamente equilibrada.\n\n#{skill_color}#Puede atravesar armadura corporal, Escudos, Escudos titán y paredes delgadas##",
		["bm_auto_generated_lmg_sc_desc"] = "Esta arma utiliza estadísticas generadas automáticamente, y puede no encajar con las intenciones de los creadores o no estar perfectamente equilibrada.",
		["bm_auto_generated_mod_sc_desc"] = "Se han eliminado las estadísticas de este accesorio hasta que se agregue la generación automática de estadísticas de accesorios personalizados.",

		--Overhaul Content Indicators--
		["loot_sc"] = "Restoration Overhaul",
		["loot_sc_desc"] = "¡OBJETO DE RESTORATION MOD!",
		["loot_sc_wcc_desc"] = "¡OBJETO DE RESTORATION MOD! (REQUIERE WEAPON COLOR PACK 2)",
		["loot_sc_ocp_desc"] = "¡OBJETO DE RESTORATION MOD! (REQUIERE WEAPON COLOR PACK 3)",
		["loot_sc_faco_desc"] = "¡OBJETO DE RESTORATION MOD! (REQUIERE JIU FENG SMUGGLER PACK 1)",

		["menu_l_global_value_omnia"] = "OMNIA",
		["menu_l_global_value_omnia_desc"] = "¡OBJETO DE OMNIA!",

		["menu_rifle"] = "RIFLES",
		["menu_jowi"] = "Wick",
		["menu_moving_target_sc"] = "Sutil",

		["bm_wp_upg_i_singlefire_sc"] = "Ciclo Lento",
		["bm_wp_upg_i_singlefire_sc_desc"] = "RALENTIZA TU CADENCIA EN 15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "Ciclo Rápido",
		["bm_wp_upg_i_autofire_sc_desc"] = "AUMENTA TU CADENCIA EN 15%",

		["bm_hint_titan_60"] = "¡El Titandozer se va en 60 segundos!",
		["bm_hint_titan_10"] = "¡El Titandozer se va en 10 segundos!",
		["bm_hint_titan_end"] = "¡El Titandozer se ha ido a atormentar otro mundo!",

		["bm_hint_titan_end"] = "¡El Titandozer se ha ido a atormentar otro mundo!",
		["bm_menu_gadget_plural"] = "Accesorios",
		["menu_pistol_carbine"] = "Pistola Carabina",
		["menu_battle_rifle"] = "Rifle de Combate",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
			--Attack patterns - These are added at the end of melee weapon descriptions and are purposely phrased to leave the end result of a melee attack ambiguous so I don't have to make different lines for something cutting vs something bludgeoning vs something stabbing etc.
				["bm_melee_pattern_knife"] = "Ataca con golpes rápidos o carga almenos hasta #{skill_color}#50%## para golpes más amplios.",

				["bm_melee_pattern_knife2"] = "Ataca con golpes amplios. El movimiento influye en la dirección del ataque.", --Also works with "melee_clean", "melee_grip" and "melee_agave"

				["bm_melee_pattern_ballistic"] = "Ataca con golpes rápidos o carga almenos hasta #{skill_color}#50%## para golpes más amplios y golpes hacia abajo. El movimiento influye en la dirección del ataque.", 
				["bm_melee_pattern_poker"] = "Ataca con golpes hacia abajo o carga almenos hasta #{skill_color}#50%## para golpes que extiendan el alcance.",

				["bm_melee_pattern_boxcutter"] = "Ataca con golpes amplios.", --Also works with "melee_catch" and "melee_road"

				["bm_melee_pattern_shield"] = "Ataca con golpes hacia adelante o carga almenos hasta #{skill_color}#50%## para golpes más amplios.",

				["bm_melee_pattern_briefcsae"] = "Ataca con golpes hacia adelante o carga almenos hasta #{skill_color}#50%## para golpes hacia abajo.",

				["bm_melee_pattern_blunt"] = "Ataca con golpes hacia abajo o carga almenos hasta #{skill_color}#50%## para golpes más amplios.", --Also works with "melee_brick", "melee_happy" and "melee_cleaver"
					["bm_melee_pattern_blunt_90"] = "Ataca con golpes hacia abajo o carga almenos hasta #{skill_color}#90%## para golpes más amplios.",

				["bm_melee_pattern_beardy"] = "Ataca con golpes hacia abajo o carga almenos hasta #{skill_color}#50%## para golpes más amplios. El movimiento influye en la dirección del ataque.",
				
				["bm_melee_pattern_axe"] = "Ataca con golpes hacia abajo.", --Also works with "melee_psycho" and "melee_pickaxe"

				["bm_melee_pattern_cutter"] = "Ataca con golpes hacia abajo o carga almenos hasta #{skill_color}#50%## para para golpes que extiendan el alcance.",

				["bm_melee_pattern_great"] = "Ataca con golpes hacia abajo, muevete para ataques más amplios o carga almenos hasta #{skill_color}#90%## para para golpes que extiendan el alcance. El movimiento influye en la dirección del ataque.",
					["bm_melee_pattern_great_no_stab"] = "Ataca con golpes hacia abajo o muevete para ataques más amplios. El movimiento influye en la dirección del ataque.", -- Also works for "melee_cs"

				["bm_melee_pattern_katana"] = "Ataca con golpes diagonales o muevete para ataques más amplios. El movimiento influye en la dirección del ataque.",

				["bm_melee_pattern_fist"] = "Ataca con golpes rápidos o carga almenos hasta #{skill_color}#50%## para realizar un gancho. El movimiento influye en la dirección del ataque.",

				["bm_melee_pattern_boxing"] = "Ataca con golpes rápidos o carga almenos hasta #{skill_color}#50%## para realizar un gancho izquierdo o un uppercut derecho. El movimiento influye en la dirección del ataque.",

				["bm_melee_pattern_tiger"] = "Ataca con golpes derechos o carga almenos hasta #{skill_color}#50%## para realizar un uppercut izquierdo o un gancho derecho. El movimiento influye en la dirección del ataque.",

				["bm_melee_pattern_jab"] = "Ataca con golpes rápidos.", --For anything that basically only has centered hitboxes like "melee_pitchfork", "melee_wing" and "melee_fight"


		--Weapon Butt
		["bm_melee_weapon_info"] = "En robos a mano armada, golpear a las víctimas con armas de fuego suele ser más común que dispararles o apuñalarlas.\n\nEl retraso entre ataques se modifica aun más dependiendo de la movilidad del arma.",

		--URSA/USMC KA-BAR
		["bm_melee_kabar_info"] = "El cuchillo URSA es un cuchillo de combate/utilitario resistente e indestructible que data de 1942\n\nHoja Bowie, filo dentado, sin tonterías.\n\nUn Clásico.",
		--Krieger
		["bm_melee_kampfmesser_info"] = "El cuchillo de combate oficial de las Fuerzas Armadas Alemanas Bundeswehr. Esta serie de cuchillos se fabrican según los estándares ISO con una capacidad de corte sustancialmente mejorada.\n\nBuena elección para CQC.",
		--Berger
		["bm_melee_gerber_info"] = "El Cuchillo de Combate Berger es un popular cuchillo táctico con una hoja con punta de clip plegable. Los materiales compactos, livianos y de alta tecnología lo convierten en una herramienta rápida y peligrosa.",
		--Lambo
		["bm_melee_rambo_info"] = "Un cuchillo de supervivencia con una pesada hoja tipo bowie. Su longitud, lomo en forma de diente de sierra y punta centrada funciona igual de bien en la naturaleza que en combate cuerpo a cuerpo.",

		--Tomahawk
		["bm_melee_tomahawk_info"] = "Cuando estás en una situación en la que el tiempo es esencial, no puedes perder el tiempo preguntándote si tienes la herramienta correcta para el trabajo.\nNo importa lo que haya al otro lado de esa puerta o bóveda, necesitas una herramienta con la misma determinación que el ladrón que lo empuña.",
		--Becker Machete
		["bm_melee_becker_info"] = "Un machete especializado que aplasta, golpea, hace palanca, martilla y corta.\nEs suficientemente fuerte como para levantar pasadores de bisagras rebeldes, abrir puertas o ventanas y destrozar vitrinas y eficiente para cortar bridas de la policía.",
		--Baton
		["bm_melee_baton_info"] = "El arma de impacto más tácticamente sofisticada disponible actualmente para las fuerzas policiales.\nPuesta a prueba por los equipos federales más experimentados, ha demostrado ser prácticamente indestructible.",
			["bm_melee_happy_info"] = "El bastón personal de Joy, para cuando el código no es suficiente.",
		--Shovel
		["bm_melee_shovel_info"] = "El K.L.A.S. se puede usar para una variedad de propósitos recreativos.\nTambién se puede usar como arma - usa los bordes y cortarás a través carne y hueso o usa el plano para aporrear a algún pobre desgraciado hacia una tumba temprana.",

		--MONEY MONEY MONEY
		["bm_melee_moneybundle_info"] = "L-O-D-S OF E-M-O-N-E\n¿Qué es ese hechizo?\n¡MUCHO DINERO!\n\nEn íngles almenos. . .\n\n¡SACALO A RELUCIR!",
		--Fists
		["bm_melee_fists_info"] = "No eres un boxeador, pero aun así puedes lanzar un buen golpe.\nTodo lo que necesitas es algo de fuerza, velocidad y sincronización y asestarás un golpe contundente en poco tiempo.",
		--& Knuckles
		["bm_melee_brass_knuckles_info"] = "Las armas de nudillos se han utilizado en todo el mundo durante cientos de años.\nLos nudillos de latón concentran la fuerza del golpe dirigiéndolo hacia un área más dura y más pequeña, lo que aumenta las posibilidades de disrupción del tejido. Golpea lo suficientemente fuerte e incluso fracturarás algunos huesos.",

		--Lucille
		["bm_melee_barbedwire_info"] = "No hay otra vida esperando por mi lamentable trasero... y solo estoy aquí... ¡hablando con un maldito bate de béisbol!\n\nInflige #{skill_color}#120## de daño por sangrado en #{skill_color}#3## segundos.", --Bob: Esto es una referencia a algo? Si lo es, no logro reconocerla
			["bm_melee_bleed_info"] = "Inflige #{skill_color}#120## de daño por sangrado en #{skill_color}#3## segundos.",
			["bm_melee_inner_child_info"] = "Entra en contacto con tu niño interior.\n\nInflige #{skill_color}#120## de daño por sangrado en #{skill_color}#3## segundos.",

		--Bayonet
		["bm_melee_bayonet_info"] = "Una bayoneta resistente, diseñada para montarse en el extremo de un rifle y clavarla en los cuerpos de tus enemigos.\n\nSin embargo, hacer eso tendría sentido. Lo usarás como un cuchillo normal, ¿verdad?",
		--Bullseye
		["bm_melee_bullseye_info"] = "Para ser honesto, ni siquiera sé qué decir - esto no es algo que llevarías a una pelea a menos que fueras algún tipo de psicópata, ¿verdad?\nQuiero decir, esto está hecho para cortar troncos e ir a acampar, no para robar bancos.\n\n¿Verdad?",
		--X46
		["bm_melee_x46_info"] = "El X46 es una sola pieza de 15cm de acero A2 recubierto en una configuración de hoja bowie parcialmente dentada con un borde superior falso.\nProtector integrado y punta de pomo rompevidrios.\nEl diseño de campo multiusos de este cuchillo lo hace igualmente útil en el campo de batalla como en una emergencia.",
		--Gunther
		["bm_melee_dingdong_info"] = "Un mazo.\nUn ariete.\nUna palanca.\nLas tres son herramientas esenciales para los ladrones que necesitan atravesar puertas rápidamente.\nEl Ding Dong combina estas tres herramientas en un paquete tan compacto como el equipo.\n\nLos ataques completamente cargados salen #{skill_color}#25%## más rápido, lo que permite seguir con un golpe más rápido.",

		--Cleaver girl
		["bm_melee_cleaver_info"] = "Está golpeando, cortando y cortando.\n\nInflige #{important_1}#50%## menos daño con golpes en la cabeza a cambio de una mayor efectividad contra el cuerpo y las extremidades.", --Bob: No se si esto sea una referencia a algo
		--Batshit insane
		["bm_melee_bat_info"] = "Un bate de béisbol, ni más ni menos.\n\nDiseñado para uso deportivo, lo usarás para algo mucho más siniestro.\n\nLos ataques completamente cargados salen #{skill_color}#25%## más rápido, lo que permite seguir con un golpe más rápido.",
		--Machete
		["bm_melee_machete_info"] = "Te gusta hacer daño a la gente, por eso usas este viejo y sucio machete.\nLas heridas abiertas, los miembros brutalmente cortados y los gritos espeluznantes de tus enemigos te mantienen activo.\n\nVerdaderamente el arma de un ladrón muy cruel.",
		--Fireaxe
		["bm_melee_fireaxe_info"] = "¿Te gusta lastimar a otras personas?\n\nSi es el caso, ¡qué mejor manera de hacerlo que con algo destinado a salvar vidas! Muestra a tus víctimas el fuego en tus ojos mientras las salvas de ti mismo de un solo golpe.",
		--Briefcase
		["bm_melee_briefcase_info"] = "Independientemente de lo que pueda haber dentro, el maletín en sí es sorprendentemente resistente.\n\nReduce el daño a distancia que recibes por #{skill_color}#10%## mientras cargas.",
			--Toasty
			["bm_melee_toast"] = "Tostada de Almir",
			["bm_melee_toast_info"] = "¿Tienes hambre?\n\nReduce el daño a distancia que recibes por #{skill_color}#10%## mientras cargas.",

		--KA-BAR Tanto
		["bm_melee_kabar_tanto_info"] = "La forma de la hoja Tanto, de influencia asiática, tiene una hoja puntiaguda y gruesa que es buena para la penetración. Este cuchillo está diseñado para las tareas más duras.",

		--UberHaxorNova
		["bm_melee_toothbrush_info"] = "Un pequeño cepillo de dientes de plástico, afilado hasta convertirlo en una cuchilla improvisada, listo para clavarlo en tu próxima víctima.",

		--Psycho Knife
		--["bm_melee_chef_info"] = "Whether you're an angry heister or a psycho bank robber, this hot-forged, laser sharpened chef knife in fine, stainless molybdenum steel will serve you for years.\n\nBy the way, did you know that the traditional chef's knife was originally intended to slice and disjoint large cuts of flesh?\n\nFully charged hits spread panic in a #{skill_color}#12## meter radius around you.",
		["bm_melee_chef_info"] = "No estoy seguro si esto se usó para cortar carne del supermercado.\n\nLos golpes completamente cargados provocan que los enemigos a un radio de #{skill_color}#12## metros a tu alrededor entren en pánico.",

		--Trench Knife
		["bm_melee_fairbair_info"] = "Un favorito entre los Comandos Británicos, el Cuchillo de Trinchera es fantástico para infligir cortes amplios. Es un cuchillo muy popular que sigue utilizándose y produciéndose hoy en día.",
		--Swag
		["bm_melee_swagger_info"] = "¡Da órdenes, mejora tu imagen pública o simplemente úsalo para administrar castigos corporales! El Bastón Swagger es un accesorio imprescindible para cualquier líder que se precie. El viejo Blood and Guts llevaba uno y el suyo incluso tenía una espada oculta.",
		--FREEDOM ISN'T FREE
		["bm_melee_freedom_info"] = "Trece franjas rojas alternadas con blancas, un rectángulo azul en el cantón, cincuenta pequeñas estrellas blancas de cinco puntas, una pizca de patriotismo, dos copas de la libertad y un asta de bandera rota.\n\nVoilà, ya tienes una arma mortal.",
		--Who needs pants?
		["bm_melee_erica_info"] = "Una persona con sentido común lanzaría esto.\n\nLos golpes completamente cargados contra enemigos vivos tienen un #{skill_color}#5%## de probabilidad de explotar e infligir #{risk}#720## de daño en un radio de #{skill_color}#5## metros desde el punto de impacto.",

		--Hammer
		["bm_melee_hammer_info"] = "El \"Deleite del Carpintero\" es el martillo favorito de Jacket. El martillo es la herramienta perfecta para dar golpes contundentes a las personas que no te agradan.\n\nLos usos más comunes de los martillos son: clavar clavos, encajar piezas, forjar metal y romper objetos, ninguno de los cuales a Jacket le importa mucho.",

		--OVERKILL Boxing Gloves
		["bm_melee_boxing_gloves_info"] = "No escuché ninguna campana.\n\nEnemigos que mates con los Guantes de Boxeo OVERKILL #{skill_color}#restauran instantáneamente tu resistencia.##",

		--A stick of lies
		["bm_melee_shillelagh_info"] = "Es difícil determinar los verdaderos orígenes del shillelagh. ¿Cómo se puede identificar la primera vez que alguien tomó un palo resistente y le destrozó el cerebro a otra persona con él? Y el shillelagh realmente no ha evolucionado mucho más allá de eso. Algunos aprecian la madera de endrino, mientras que otros podrían llenar la cabeza con plomo fundido.\n\nAl final del día, en realidad es solo un palo muy pesado que rompe cráneos.",

		--Bottle
		["bm_melee_whiskey_info"] = "Hay varias reglas y regulaciones por las que una botella de whisky tiene que pasar para ser llamada whisky escocés. Tener una botella dura no es necesariamente una de ellas, pero eso le importa poco a Bonnie, quien ve una botella de Rivertown Glen vacía como su arma cuerpo a cuerpo favorita.\n\nNo hace falta decir que les da dolores de cabeza a sus enemigos por todas las razones equivocadas.",

		--Dragan's Cleaver
		["bm_melee_meat_cleaver_info"] = "La cuchilla de carnicero es un tipo de cuchillo que se utiliza principalmente para cortar carne y hueso, pero en lugar de realizar cortes precisos, la cuchilla proporciona poderosos golpes tipo martillo que desgarran incluso la carne más resistente. Las cuchillas de carnicero también tienen una larga historia de masacre de seres humanos como a ganado.\n\nHarás lo primero.\n\nInflige #{important_1}#50%## menos daño con golpes en la cabeza a cambio de una mayor efectividad contra el cuerpo y las extremidades.",

		--Poker
		["bm_melee_poker_info"] = "Un trozo largo de hierro con un extremo puntiagudo es un excelente utensilio para cuidar las brasas, pero también es el utensilio perfecto para causar estragos e incomodidad extrema.\n\nSi no nos crees, pídele a tu camarero una 'Eduardo II'.",
		--Tenderizer
		["bm_melee_tenderizer_info"] = "Si bien fue diseñado principalmente para ablandar y aplanar tiras duras de filete, también ha demostrado ser útil para ablandar y aplanar tiras duras de carne de policía.\n\nVa muy bien con una salsa holandesa ligera.",
		--Fork
		["bm_melee_fork_info"] = "¿Cuál es la diferencia entre un camión lleno de bolas de bolos y un camión lleno de bulldozers muertos? No puedes descargar un camión lleno de bolas de bolos con el Motherforker.\n\nDisfrútalo un poco de pimienta.",
		--Speng Bib
		["bm_melee_spatula_info"] = "Un arma cuerpo a cuerpo con un doble propósito: úsala para atraer un policía al otro lado de la calle y luego deja que otros la usen para recoger sus restos.\n\nLleva una servilleta extra para esta.",

		--PIPPA NO
		["bm_melee_mining_pick_info"] = "¡Hay oro en las colinas! Y por colinas nos referimos a dientes. Pero, colinas o dientes, nada extrae el oro más rápido que un pincho de arrabio.\n\nInflige #{skill_color}#50%## más de daño con golpes en la cabeza.",
		--Ebay Seller
		["bm_melee_scalper_info"] = "Para el vencedor, es el símbolo de la guerra, del poder y del dominio.\n\nPara el perdedor, es el símbolo de un corte de pelo realmente malo.",
		--NAOW THIS IS A KNOIFE
		["bm_melee_bowie_info"] = "Nueve pulgadas de acero de combate con punta de clip. Sus orígenes se remontan a la época del pirata clásico, pero fue la famosa pelea del condado de Carroll (y una docena de hombres ensangrentados) la que le trajo una fama generalizada",
		--MY BRAND
		["bm_melee_branding_iron_info"] = "Puede que haya sido diseñado para marcar las gruesas pieles del ganado para su identificación, pero el hierro calentado al fuego es aún más eficaz contra la carne blanda de un policia o mariscal.",

		--Mic
		["bm_melee_microphone_info"] = "\"Por favor, habla claramente al micrófono.\"",
		--Mic Stand
		["bm_melee_micstand_info"] = "También podrías usar el soporte con el que viene el micrófono.",
		--Nighty Night
		["bm_melee_oldbaton_info"] = "#{stats_positive}#\"¡LA PALABRA DE SEGURIDAD ES 'BRUTALIDAD POLICIAL'!\"##",
		--Metal Detector
		["bm_melee_detector_info"] = "Probablemente deberías dejarlo apagado.",

		--Croupier Rake
		["bm_melee_croupier_rake_info"] = "¿Un objeto con el único propósito de sacar dinero? ¡Perfecto para los ladrones! Muéstrales a esos molestos policías exactamente por qué la casa siempre gana.",
		--Switchblade Knife
		["bm_melee_switchblade_info"] = "Diseñado para la violencia, mortal como un revólver - ¡esa es la navaja!\n\nInflige #{skill_color}#200%## de daño al atacar a los enemigos por detrás.",
		--Slot Lever
		["bm_melee_slot_lever_info"] = "¡DAME UNO GORDO!\n\nTiene una probabilidad de #{skill_color}#5%## de causar #{skill_color}#10x## veces el daño y derribo.",
		--ZAP ZAP MOTHERFUCKER
		["bm_melee_taser_info"] = "Venganza exactamente dulce y electrizante contra esos engreídos Tasers.\n\nElectrocuta e interrumpe a los objetivos al tocarlos cuando está completamente cargado.",

		--Kunai
		["bm_melee_cqc_info"] = "Incluso los oponentes más poderosos caerán cuando sean tocados una sola vez por este cuchillo Kunai bañado en veneno.\n\nContiene un veneno exótico que inflige #{stats_positive}#120## de daño por veneno y lleva un #{skill_color}#50%## de probabilidad de interrumpir cada #{skill_color}#0.5## segundos durante #{skill_color}#4## segundos.",
		--Sai
		["bm_melee_twins"] = "Sai", --Plural form is still "sai"
		["bm_melee_twins_info"] = "De vez en cuando, una víctima del Sai se da cuenta demasiado tarde de que no importa lo contundentes que sean las armas.\nEn cuestión de segundos te han desarmado de tus armas afiladas.\n\nBloquear un ataque enemigo inflige #{skill_color}#60## de daño cuerpo a cuerpo. Esto se puede aumentar con habilidades.",
		--Tekko-Kagi
		["bm_melee_tiger_info"] = "Originalmente utilizadas para escalar paredes y árboles, estas garras afiladas rápidamente se convirtieron en armas cuando se descubrió a quien las empuñaba.\n\nLos ataques cuerpo a cuerpo infligen el #{skill_color}#doble## de daño con cada golpe después del primer golpe.",
		--Empty Palm Kata
		["bm_melee_fight_info"] = "Sé agua, amigo mío.\n\nBloquear un ataque enemigo inflige #{skill_color}#120## de daño cuerpo a cuerpo. Esto se puede aumentar con habilidades.",
		--Katana
		["bm_melee_katana_info"] = "La Katana-Shinsakuto es una obra maestra, pero también está recién forjada. No ha probado la sangre y no tiene herencia o historia real. Simplemente está esperando a un portador con quien crearla.\n\nLos ataques completamente cargados salen #{skill_color}#50%## más rápido, lo que permite seguir con un corte más rapido.",
			["bm_melee_raiden_info"] = "Esta no es una #{important_1}#\"herramienta de justicia\"## en tus manos.\n\nLos ataques completamente cargados salen #{skill_color}#50%## más rápido, lo que permite seguir con un corte más rápido.",
			["bm_melee_thejobissnotyours_info"] = "Esta ni siquiera es tu espada.\n\nLos ataques completamente cargados salen #{skill_color}#50%## más rápido, lo que permite seguir con un corte más rápido.",
			["bm_melee_2077tkata_info"] = "Hoja calentada con nanofilamento.\nLa esencia más pura de una katana, sin complementos ni modificaciones, solo acero caliente.\n\nLos ataques completamente cargados #{heat_warm_color}#prenden fuego a los enemigos,## infligiendo #{heat_warm_color}#120## daño por fuego durante #{skill_color}#3## segundos.",

		--Ayy L-Maul
		["bm_melee_alien_maul_info"] = "Un martillo hecho para conmemorar el lanzamiento de Alienware Alpha.\n\nLos ataques completamente cargados salen #{skill_color}#25%## más rápido, lo que permite seguir con un golpe más rápido.",

		--Beardy
		["bm_melee_beardy_info"] = "Los vikingos emergieron de los bosques oscuros del norte pagano y dejaron un sangriento rastro de destrucción desde Islandia hasta Estambul.\nSus armas era las hachas de dos manos.",
		--Morningstar
		["bm_melee_morning_info"] = "Si los profundos pinchazos de los pinchos no te matan, el trauma catastrófico de la cabeza contundente ciertamente lo hará.\nEsta arma dejó una pila de cuerpos destrozados en el campo de batalla medieval.\n\nInflige #{skill_color}#120## de daño por sangrado durante #{skill_color}#3## segundos.",
		--Greatsword
		["bm_melee_great_info"] = "#{item_stage_2}#\"Intenta atacar con estocada.\"##\n\nLa espada que William Wallace hizo famosa.\n180cm de acero afilado, se llevaba en una vaina hecha de piel de un recaudador de impuestos.\n\n¿Qué te parece eso para golpear a las autoridades?", --Bob: Esto creo que es una referencia a alguna linea de una pelicula
			--Jebus
			["bm_melee_jebus_info"] = "Luz y #{item_stage_2}#oscuridad##\n#{item_stage_2}#Negro## y blanco.\n#{stats_positive}#Vida## y #{important_1}#muerte##\n\nLa Espada Binaria no tiene término medio ya que #{important_1}#Apaga## a tus oponentes",
			--Headless Dozer Sword
			["bm_melee_headless_sword_info"] = "Una espada forjada a partir de pesadillas.\n\nLos golpes completamente cargados provocan que los enemigos a un radio de #{skill_color}#12## metros a tu alrededor entren en pánico.",
				--Headless Dozer Hammer
				["bm_melee_titham"] = "Martillo del Bulldozer sin Cabeza",
				["bm_melee_titan_hammer_info"] = "Un martillo forjado a partir de pesadillas.\n\nLos golpes completamente cargados provocan que los enemigos a un radio de #{skill_color}#12## metros a tu alrededor entren en pánico.",
				--im not gaj
				["bm_melee_goat_info"] = "\"Esta cosa era demasiado grande como para ser llamada una espada. Demasiado grande, gruesa, pesada y áspera; parecía mas un gran trozo de hierro.\"\n\nLos golpes completamente cargados provocan que los enemigos a un radio de #{skill_color}#12## metros a tu alrededor entren en pánico.",
			--Wt ring u got bithc?
			["bm_melee_zweihander"] = "Flammenschwert",
			["bm_melee_zweihander_info"] = "#{heat_warm_color}#\"Bloquea esto.\"##\n\nUna enorme espada de dos manos que se parece más a un arma de asta que a una espada.\n\nBloquear un ataque enemigo inflige #{skill_color}#180## de daño cuerpo a cuerpo. Esto se puede aumentar con habilidades.",
			["bm_melee_broad"] = "Espada Larga",
			["bm_melee_broad_info"] = "El arma distintiva de los caballeros.",
		--Buckler Shield
		["bm_melee_buck_info"] = "En las manos correctas, el Escudo Buckler es tanto un arma como un medio de defensa.\nUsado en el antebrazo, puede golpear a un enemigo con fuerza suficiente como para sacarlo de sus pantalones.\n\nReduce el daño a distancia que recibes por #{skill_color}#10%## mientras cargas.",

		--Bolt cutters
		["bm_melee_cutters_info"] = "Tus asesinos en serie favoritos necesitan algo más que un hacha, un cuchillo o un guante con dedos afilados.\nNecesitan cizallas para entrar silenciosamente en esos lugares que creías que estaban cerrados.\n\nDonde creías que estabas a salvo...",

		--Natsumi
		["bm_melee_boxcutter_info"] = "Puede parecer una herramienta utilitaria, pero si esta hoja puede cortar el duro plástico sellado al vacío de las cajas de embalaje, puede lidiar con cualquier cosa en la que se involucren los policías.",

		--Selfie
		["bm_melee_selfie_info"] = "Como dijo Hoxton, \"mira a ese maldito imbécil del palo para selfies. Que idiota. Pero apuesto que es fuerte. Ya sabes, debería quitárselo y golpearlo con él. Regreso en un mes...\"",
		--Lara
		["bm_melee_iceaxe_info"] = "Cuando escalas los resbaladizos acantilados de Angel Falls, necesitas algo que pueda perforar la dura roca. Cuando robas bancos en D.C., necesitas algo que pueda perforar los cascos de los policías.\n\nInflige #{skill_color}#50%## más de daño con golpes en la cabeza.",
			["bm_melee_iceaxe_gen_info"] = "Inflige #{skill_color}#50%## más de daño con golpes en la cabeza.",
		--Dive
		["bm_melee_pugio_info"] = "Simple y fuerte. Tanto si estás cortando gargantas como si estás liberando delfines de redes de pesca enredadas, cumple con su trabajo. Y queda muy bien en la cadera cuando sales pavoneándote de las olas.",
		--Gator
		["bm_melee_gator_info"] = "Dicen que puedes aguantar tres semanas sin comida y tres días sin agua, pero en un entorno hostil no durarás tres horas sin una buena navaja a tu lado",

		--Pitch fork
		["bm_melee_pitch_info"] = "Bidentes, tridentes, ¿a quién le importa? Son básicamente horquillas. Si Poseidón y Lucifer pueden usarlos, nosotros también.\n\nEsprintar hacia adelante comienza una carga que inflige #{skill_color}#45## de daño cada #{skill_color}#0.4## segundos a objetivos en frente tuyo. Esto se puede aumentar con habilidades.\n\nGolpear a un enemigo mientras esprintas consumirá #{important_1}#15%## de tu resistencia (para esprintar) máxima; matar a un enemigo restaurará #{skill_color}#10%## de resistencia (para esprintar).\n\n#{important_1}#No puedes bloquear ataques enemigos, incluso cuando no estás esprintando.##",
			["bm_melee_number_3_info"] = "\"Si matarías por tus ideales, ¡seguro que estarías dispuesto a morir por ellos!\"\n\nEsprintar hacia adelante comienza una carga que inflige #{skill_color}#45## de daño cada #{skill_color}#0.4## segundos a objetivos en frente tuyo. Esto se puede aumentar con habilidades.\n\nGolpear a un enemigo mientras esprintas consumirá #{important_1}#15%## de tu resistencia (para esprintar) máxima; matar a un enemigo restaurará #{skill_color}#10%## de resistencia (para esprintar).\n\n#{important_1}#No puedes bloquear ataques enemigos, incluso cuando no estás esprintando.##",
			["bm_melee_charge_info"] = "Esprintar hacia adelante comienza una carga que inflige #{skill_color}#45## de daño cada #{skill_color}#0.4## segundos a objetivos en frente tuyo. Esto se puede aumentar con habilidades.\n\nGolpear a un enemigo mientras esprintas consumirá #{important_1}#15%## de tu resistencia (para esprintar) máxima; matar a un enemigo restaurará #{skill_color}#10%## de resistencia (para esprintar).\n\n#{important_1}#No puedes bloquear ataques enemigos, incluso cuando no estás esprintando.##",
		--BONK
		["bm_melee_scoutknife_info"] = "No dejes que el aspecto oxidado y desgastado te eche para atrás. Un cuchillo siempre es un cuchillo - y hay quien dice que un cuchillo viejo envejece como un buen vino (probablemente nadie haya dicho eso nunca). Pruébalo y verás cómo las cosas sangran.",
		--Shears
		["bm_melee_shawn_info"] = "¿Sabías que esquilar ovejas se considera un deporte? ¿Quizás deberíamos inventar un nuevo deporte: esquilar policías? ¿No? ¿Por qué no? Lo que sea... úsalos como mejor te parezca, supongo...",
		--Crook
		["bm_melee_stick"] = "Bastón del Pastor",
		["bm_melee_stick_info"] = "¿Cansado tras un largo atraco? ¿Quieres parecer viejo y sabio? ¿Quizá partirle la cara a un policía? El bastón del pastor puede hacerlo todo.\n\nLos ataques completamente cargados salen #{skill_color}#25%## más rápido, lo que permite seguir con un golpe más rápido.",

		--Pounder Nailgun
		["bm_melee_nin_info"] = "Pounder, la pistola de clavos favorita de Wolf. \n\nCuando la gente le pregunta por el nombre, Wolf se apresura a corregirlo por \"Punder\" y mientras se lo dicen grita: \"¡Lo has clavado!\"\n\nDispara clavos que tienen un alcance efectivo corto y un recorrido instantáneo. Sigue contando como una muerte cuerpo a cuerpo.",
			["bm_melee_thebestweapon_info"] = "#{stats_positive}#La mejor arma en el juego.##",

		--Ballistic Knives
		["bm_melee_ballistic_info"] = "Jimmy no es de los que piensan que menos es más, por eso tiene un set doble de cuchillos especializados.\n\nLos ataques cuerpo a cuerpo infligen el #{skill_color}#doble## de daño con cada golpe después del primer golpe.",

		--ALSO ZAP ZAP MOTHERFUCKER
		["bm_melee_zeus_info"] = "Un par de nudilleras eléctricas caseras que electrocutan e interrumpen a los objetivos al tocarlos cuando están completamente cargadas.",

		--Wing Butterfly Knife
		["bm_melee_wing_info"] = "¡Combina muy bien con un kit de disfraces!\n\nInflige #{skill_color}#400%## de daño al golpear a enemigos desde la espalda.",

		--PICKLE
		["bm_melee_road_info"] = "El látigo de cadena es el arma cuerpo a cuerpo preferida de Rust, un fanático de los instrumentos de dolor de la vieja escuela.\nRust no robó el látigo de cadena, sino que lo compró en una ferretería. Pensó que valía la pena pagar por una herramienta tan importante. Le da un cierto toque de clase al sonido silbante que hace al azotar otra cara.",

		--ROAMING FROTHING MADNESS
		["bm_melee_cs_info"] = "Destroza y desgarra, hasta que termines.\n\nInflige #{skill_color}#30## de daño cada #{skill_color}#0.25## segundos a objetivos en frente tuyo mientras cargas. Esto se puede aumentar con habilidades.\n\n#{important_1}#No puede bloquear ataques enemigos.##", --Bob: Referencia a Doom 

		--WHERE'S THE LEAK MA'AM?
		["bm_melee_shock_info"] = "\"Sería tan amable...\"",

		--YOU KNOW WHEN THAT HOTLINE RING
		["bm_melee_brick_info"] = "No te equivoques - no es un teléfono cualquiera, es el #{stat_maxed}#HOTLINE## #{skill_color}#8000X##, la cima de la comunicación de los años 80.\n\n¿Hola, quien habla?\nSolo llamaba para decir...\n\nTe odio.", --Bob: no se si esto tambien sea una referencia a algo

		--OMG IT SPINS
		["bm_melee_ostry_info"] = "Giraaaaaaaaaa.\n\nInglife #{skill_color}#18## de daño cada #{skill_color}#0.18## segundos a objetivos en frente tuyo mientras cargas. Esto se puede aumentar con habilidades.\n\n#{important_1}#No puede bloquear ataques enemigos.##",

		--Pencil
		["bm_melee_sword"] = "Lápiz", 
		["bm_melee_sword_info"] = "\"John es un hombre de foco, compromiso, voluntad pura... algo de lo que tu sabes muy poco.\n\nUna vez lo vi matar a tres hombres en un bar... con un lápiz...\n\nCon un maldito lápiz.\"",

		--Russian Machete
		["bm_melee_oxide_info"] = "Un diseño innovador para crear una fiel arma cuerpo a cuerpo.  Debía poder hacer el trabajo de un machete en las zonas de vegetación densa igual que un cuchillo de campo. También necesitaba manejar el trabajo de guarnición.\nEsta herramienta podía ser utilizada por pilotos derribados, soldados de campo y cualquiera que necesitara un buen cuchillo de campo.",

		--Another Machete
		["bm_melee_agave_info"] = "Quitar una vida como sicario no consiste únicamente en matar, sino en intimidar. Algo que deja una huella en el interior de quienes presencian el caos. Ahí es donde entra en juego el machete de Sangres. Alguien que lleva algo tan mortífero como un machete probablemente está lo suficientemente loco como para usarlo también.\n\nSangres nombró a su machete \"El Verdugo\" - un nombre apropiado para una herramienta apropiada.",

		--Alabama Razor
		["bm_melee_clean_info"] = "Dale a la policía ese afeitado extra que necesita.\n\nInflige #{skill_color}#120## de daño por sangrado en #{skill_color}#3## segundos.",
		
		--Kento's Tanto
		["bm_melee_ohwell_info"] = "Junto con la katana, el tanto era un arma básica de todos los samuráis.\n\nÉsta perteneció a Kento, aunque se desconoce de dónde la sacó.",

		--Spoon
		["bm_melee_spoon_info"] = "Sólo una cucharada, ¿verdad?\n\nLos ataques completamente cargados salen #{skill_color}#25%## más rápido, lo que permite seguir con un golpe más rápido.", 
		--Gold Spoon
		["bm_melee_spoon_gold_info"] = "Perfecta para comer esos cereales.\n\nTiene un #{skill_color}#50%## de probabilidad de #{heat_warm_color}#prender en llamas## a los enemigos infligiendo #{heat_warm_color}#120## de daño por fuego e interrumpiendolos durante #{skill_color}#3## segundos.", --Bob: En ingles asumo que es una referencia al anuncio de los reeses puffs, aunque ni idea de como adaptarlo xd
			["bm_melee_fire_info"] = "Tiene un #{skill_color}#50%## de probabilidad de #{heat_warm_color}#prender en llamas## a los enemigos infligiendo #{heat_warm_color}#120## de daño por fuego e interrumpiendolos durante #{skill_color}#3## segundos.",

		--ADOBE FALSH(LITE)
		["bm_melee_aziz_info"] = "\"En realidad no estoy construyendo un refugio, pero he comprado una tonelada de latas y algo de agua y también una linterna nueva. Porque cuando el mundo se oscurece, tienes que tener algún tipo de luz o estarás muerto en una hora. ¡Te lo prometo!\"", --Bob: Esto es una referencia a thesecretisreallyreal del payday, uuuh traducción literal sirve supongo

		--Chac
		["bm_melee_chac_info"] = "Sigue el ritmo con esta maraca y sacude algunos cráneos, literalmente.",

		--Sap
		["bm_melee_sap_info"] = "La Slapjack es un arma de caballeros.\n\nUna simple palmada en la cabeza y tu enemigo cae. Duke maneja la Slapjack con cierta gracia y brutalidad que a veces se excede e inflige más daño del necesario.\n\nAsí que úsalo con precaución - o no.",

		--Hockey Stick
		["bm_melee_hockey_info"] = "Un hermoso trozo de madera. Perfecta para golpear un puck contra la red y romper los dientes.\n\nLos ataques completamente cargados salen #{skill_color}#50%## más rápido, lo que permite seguir con un golpe más rápido.", --Bob: Querido diario hoy descubri que el disco de hockey se llama puck

		--Ruler
		["bm_melee_meter_info"] = "Nuestra regla de dos manos es la más grande que fabricamos. Pero no dejes que su tamaño te engañe, ya que no hay nada incómodo o torpe acerca de esta impresionante regla.\n\nLos ataques completamente cargados salen #{skill_color}#50%## más rápido, lo que permite seguir con un golpe más rápido.",

		--Hooked
		["bm_melee_catch_info"] = "El gancho es una herramienta fiable y, francamente, no es ciencia de cohetes. Ese mango de madera en bruto con un fuerte gancho de metal parece sencillo y simple, ¿verdad? El gancho te garantiza que no ensuciarás mucho.\n\nSu uso sólo está limitado por tu retorcida imaginación a la hora de enganchar a tus enemigos. ¿Empalar a tus oponentes por la boca o engancharles el cuerpo? \n\nMantente alerta, trae algo desagradable a la pelea.", --Bob: No se si la ultima frase es una referencia

		--Syringe
		["bm_melee_watson_info"] = "\"Sólo dolerá un segundo, ¿vale?\"\n\nContiene un compuesto desconocido que inflige #{stats_positive}#120## de daño por veneno y lleva un #{skill_color}#50%## de probabilidad de interrumpir cada #{skill_color}#0.5## segundos durante #{skill_color}#4## segundos.",

		--That oinky sploinky
		["bm_melee_piggy_hammer_info"] = "Oinc.\n\nInflige #{skill_color}#100%## de daño adicional a enemigos especiales y de élite y tiene una probabilidad de infligir uno de los siguientes #{risk}#efectos aleatorios## al golpear enemigos:\n-#{skill_color}#12%## de probabilidad de infligir #{important_1}#sangrado##\n-#{skill_color}#7%## de probabilidad de #{ghost_color}#electrocutar##\n-#{skill_color}#5%## de probabilidad de infligir #{stats_positive}#veneno##\n-#{skill_color}#1%## probabilidad de #{risk}#matar instantáneamente##", --Piggu

		--Knuckle Daggers, Push Daggers
		["bm_melee_specialist_info"] = "El doble de cuchillas, el doble de diversión.\n\nLos ataques cuerpo a cuerpo infligen el #{skill_color}#doble## de daño con cada golpe después del primer golpe.", 

		--CUSTOM MELEE WEAPONS
		--WHERE IS TITANFALL YOU FUCKS
		["bm_melee_revenant_heirloom"] = "Dead Man's Curve",
		["bm_melee_revenant_heirloom_info"] = "#{important_1}#\"No quieres ver esto de cerca, saco de piel.\"##",
		--best girl
		["bm_melee_megumins_staff_info"] = "¡Lanza una potente explosión cuando está completamente cargada!\nPuede lanzarse a una distancia de hasta #{skill_color}#30## metros en cualquier superficie o ser; #{risk}#no puede lanzarse al aire.##\n\n#{important_1}#La velocidad de carga no se ve afectada por habilidades.\nCargar distorsiona la visión, drena la resistencia (para esprintar) y ralentiza progresivamente tu movimiento.\nEres incapacitado instantáneamente al lanzar con éxito una explosión; las habilidades y talentos que retrasen o te salven de ser incapacitado son ignoradas.##",
		--fishe
		["bm_melee_holy_mackerel_info"] = "#{item_stage_2}#Pez de nivel 42##\n\nQue te peguen con un pez debe ser de lo más humillante.",

		["bm_menu_weapon_bayonet_header"] = "ESTADÍSTICAS DE PRIMARIA:",
		["bm_menu_weapon_bayonet_secondary_header"] = "ESTADÍSTICAS DE SECUNDARIA:",
		["bm_menu_weapon_bayonet_damage"] = "\nDAÑOS ADICIONAL: ##+",
		["bm_menu_weapon_bayonet_damage_base"] = "\n-BASE: ##",
		["bm_menu_weapon_bayonet_damage_skill"] = "\n-HABILIDAD: ##+",
		["bm_menu_weapon_bayonet_range"] = "\nALCANCE ADICIONAL: ##+",

		--We assets now--
		["menu_asset_dinner_safe"] = "Caja Fuerte",
		["menu_asset_bomb_inside_info"] = "Información de Contactos",
		["menu_asset_mad_cyborg_test_subject"] = "Sujetos de Prueba",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "Traje de dos piezas",
		["bm_suit_two_piece_desc_sc"] = "El enfoque elegante para un atraco. Nunca está de más tener un buen aspecto al gritar '¡al suelo!'\n\nAl seleccionar esta opción llevarás tu atuendo predeterminado, independientemente del atuendo propio de cualquier atraco.",

		["bm_suit_loud_suit"] = "Arnés de Combate",
		["bm_suit_loud_suit_desc"] = "Este es un traje para cuando no te importa el calor. Es ligero, fácil de llevar y muy útil. Es una buena elección para combatir o para atacar instalaciones mercenarias fuertemente fortificadas.",

		["bm_suit_jackal_track"] = "Mercancías Especiales",
		["bm_suit_jackal_track_desc"] = "Un chándal especial, con el logotipo del Jackal y una variación del logotipo de VERITAS.\n\nLa tripulación los recibió en cajas sin marcar, pero Jackal confirma que nunca los envió ni los había visto antes.\nSe desconoce de dónde proceden.\n\n\n\n...Dentro de los paquetes, había una nota:\n\n''##UNA MUESTRA DE AGRADECIMIENTO, PARA AQUELLOS CON DEDICACIÓN.\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "Ladrón de Sunny-Side",
		["bm_suit_sunny_desc"] = "A veces lo que uno quiere es arremangarse y hacer un pequeño atraco.",

		["bm_suit_pool"] = "Uniforme Bodhi's Pool Repair",
		["bm_suit_pool_desc"] = "Roscas afiladas para reparadores de piscinas...",

		["bm_suit_prison"] = "Traje de Prisión",
		["bm_suit_prison_desc"] = "¡Te han detenido!",

		["bm_suit_var_jumpsuit_flecktarn"] = "Camuflaje Flecktarn",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "Un camuflaje clásico utilizado por dos países europeos, ha demostrado su eficacia en combate por su capacidad para mimetizarse fácilmente en entornos boscosos. Seguro que no funciona en zonas urbanas, pero en las rurales hace maravillas para engañar a los ojos de la gente.",

		["bm_suit_var_jumpsuit_flatgreen"] = "Verde Pringoso",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "Se rumoreaba que este traje pertenecía a uno de los miembros de un trío de criminales psicóticos, ya que fue recuperado cerca de un camión de basura destruido que se suponía que había participado en un sangriento atraco a un vehículo blindado de GenSec, que dejó numerosos miembros del SWAT muertos y bastantes heridos. La identidad de estos criminales sigue siendo un misterio, ya que la mayoría de las pruebas fueron destruidas con el camión de la basura, dejando únicamente este traje.",


		-- Color variations - Combat Harness
			["bm_suit_var_loud_suit_default"] = "Negro Profesional",
			["bm_suit_var_loud_suit_default_desc"] = "El traje de dos piezas se ha convertido en una especie de reconocimiento de marca para la pandilla PAYDAY. Elegante, a la moda, te permite mezclarte con la multitud. Simplemente icónico. '¡Espera, joder! ¡¿Qué maldita multitud?!', exclama Chains mientras la banda conduce para asaltar el almacén de Murkywater una vez más. Ojalá se hubiera dado cuenta antes.",
			
			["bm_suit_var_loud_suit_white"] = "Blanco Escarcha",
			["bm_suit_var_loud_suit_white_desc"] = "Proporcionados por Jimmy para el trabajo de Punto de Ebullición, pronto demostraron ser ineficaces contra las duras condiciones del trabajo. No es que Jimmy necesitara uno, ya que prefería llevar su traje de dos piezas de todos modos.",
			
			["bm_suit_var_loud_suit_red"] = "Rojo Incierto",
			["bm_suit_var_loud_suit_red_desc"] = "El rojo es un color interesante de ver en el campo de batalla. O es un médico, que viene a salvar la vida de sus compañeros, o el cabrón más peligroso que hay. Tú decides quién serías.",
			
			["bm_suit_var_loud_suit_green"] = "Poison Green",
			["bm_suit_var_loud_suit_green_desc"] = "Basta ya de que el Granadero te intimide. Gemma McShay te proporcionó todo un arsenal de armamento con aroma a veneno, así que es hora de demostrarles a estos cerdos quién es el verdadero control de plagas.",
			
			["bm_suit_var_loud_suit_blue"] = "Azul Policía",
			["bm_suit_var_loud_suit_blue_desc"] = "¿Por qué la policía no está usando la Armadura Corporal Experimental de todos modos?",
			
			["bm_suit_var_loud_suit_purple"] = "Morado a la Moda",
			["bm_suit_var_loud_suit_purple_desc"] = "Escóndelo bajo tu Armadura Corporal Experimental para dar un sutil toque de moda a todas tus tonterías tácticas.",
			
			["bm_suit_var_loud_suit_brown"] = "Marrón de Exterior",
			["bm_suit_var_loud_suit_brown_desc"] = "A Houston le hubiera gustado que la pandilla se hubiera quedado en una acogedora jungla urbana, donde se encuentra en su mejor forma. Pero, por desgracia, hay demasiado dinero que hacer en el país.",
			
			["bm_suit_var_loud_suit_gorkagreen"] = "Bosque Táctico",
			["bm_suit_var_loud_suit_gorkagreen_desc"] = "Te esconde bien en el bosque, o entre todo el dinero que estás moviendo.",
			
			["bm_suit_var_loud_suit_gorkaearth"] = "Murky Táctico",
			["bm_suit_var_loud_suit_gorkaearth_desc"] = "¿Cuántos uniformes produce Murkywater? Podrían crear su propia línea de moda en este punto.",
			
			["bm_suit_var_loud_suit_gorkagrey"] = "Urbano Táctico",
			["bm_suit_var_loud_suit_gorkagrey_desc"] = "No reason to don a suit when you walk into a bank now. Your face is all over the news anyway.",
			
			["bm_suit_var_loud_suit_gorkapurple"] = "Purpura Táctico",
			["bm_suit_var_loud_suit_gorkapurple_desc"] = "Nunca se sabe cuándo vas a cometer un atraco en una jungla púrpura.",
			
			["bm_suit_var_loud_suit_gorkasea"] = "Marino Táctico",
			["bm_suit_var_loud_suit_gorkasea_desc"] = "Wolf las consiguió en 2011, cuando Bain le propuso robar un yate. Por desgracia, tuvieron que acumular polvo durante casi seis años.",
			-- Color variations - Sunny Side
			["bm_suit_var_suit_sunny_default"] = "Negocios Informales",
			["bm_suit_var_suit_sunny_default_desc"] = "Conviértete en el héroe cursi de las películas de acción de los 90 que siempre has querido ser.",
				
			["bm_suit_var_suit_sunny_skull"] = "Negocios Mortales",
			["bm_suit_var_suit_sunny_skull_desc"] = "Este pequeño trabajo de pintura es lo que le dio al Skulldozer su temible nombre. Demuestra que no significa nada para ti reduciéndolo a un simple adorno para tu atuendo.",
				
			["bm_suit_var_suit_sunny_red"] = "Negocios Sangrientos",
			["bm_suit_var_suit_sunny_red_desc"] = "Un Cloaker atado a una silla, la Navaja de Barbero Alabama, 'Troubles Always Inbound' sonando... Esta camisa no permanecerá limpia por mucho tiempo.",
				
			["bm_suit_var_suit_sunny_blue"] = "Negocios Digitales",
			["bm_suit_var_suit_sunny_blue_desc"] = "Los hackers son magos modernos, capaces de hacer cosas inimaginables gracias a sus grandes habilidades...  Pero los hackers no detienen las balas. Los chalecos antibalas sí. Así que no seas demasiado engreído y recuerda protegerte.",
				
			["bm_suit_var_suit_sunny_green"] = "Negocios Avariciosos",
			["bm_suit_var_suit_sunny_green_desc"] = "No importa el riesgo, arrasas con todo el botín. En ese momento ni siquiera se trata de dinero, se trata de ser fiel a ti mismo.",

			["bm_suit_var_suit_sunny_yellow"] = "Negocios Solares",
			["bm_suit_var_suit_sunny_yellow_desc"] = "Perfecto para un viaje romántico bajo el sol.\nMientras te persigue una docena de coches de policía, claro.",
			
			["bm_suit_var_suit_sunny_pink"] = "Negocios Fluidos",
			["bm_suit_var_suit_sunny_pink_desc"] = "Mr. Pink ha tenido suerte de que la banda de Cabot no tenga atuendos codificados por colores.", --Bob: Esto es una referencia a reservoir dogs
					
			["bm_suit_var_suit_sunny_hawaii_black"] = "Vacaciones en Miami",
			["bm_suit_var_suit_sunny_hawaii_black_desc"] = "Wolf compró esta elegante camiseta cuando se enteró de que el Dentista estaba preparando a la banda para el trabajo de «Hotline Miami». ¿Quién iba a saber que no tendría nada que ver con Miami?",
			
			["bm_suit_var_suit_sunny_hawaii_blue"] = "Vacaciones Cibernéticas",
			["bm_suit_var_suit_sunny_hawaii_blue_desc"] = "Joy es el tipo de persona que se iría lejos de vacaciones y se pasaría todo el tiempo jugando a videojuegos. 'Los niños de hoy en día', pensó Dallas, ya que no podía conseguir que disfrutara jugando al billar, contemplando el mar, bebiendo cantidades insanas de whisky y otras actividades vacacionales de la vieja escuela.",
			
			["bm_suit_var_suit_sunny_hawaii_cyan"] = "Vacaciones en el Mar",
			["bm_suit_var_suit_sunny_hawaii_cyan_desc"] = "Sydney es una ávida nadadora y siempre se ha preguntado por qué el Refugio no tiene instalada una piscina. Bueno, además de que Aldstone ya tiene bastantes obligaciones, nadar no es la afición más apreciada por banda PAYDAY después de los eventos de Green Bridge.",
			
			["bm_suit_var_suit_sunny_hawaii_green"] = "Vacaciones en Caseta",
			["bm_suit_var_suit_sunny_hawaii_green_desc"] = "Vlad disfrutó mucho de su estancia en México. Las nuevas tierras le brindaban nuevas oportunidades, y logró expandirse con bastante rapidez, hasta que una de sus actividades de narcotráfico sufrió un golpe repentino. Los federales fueron avisados nada menos que por Buluc, que se convertiría en el principal rival de Vlad durante un tiempo. Menos mal que la banda PAYDAY siempre está disponible.",
						
			["bm_suit_var_suit_sunny_hawaii_orange"] = "Vacaciones en el Extranjero",
			["bm_suit_var_suit_sunny_hawaii_orange_desc"] = "Ya está, lo has conseguido. El trabajo de la Casa Blanca completado, todos los malos derrotados, y tu dinero extranjero gastado en la mejor fiesta de la historia. ¿Dónde podemos ir desde aquí? \nEh, otro atraco a un banco no hará daño.",
			
			["bm_suit_var_suit_sunny_hawaii_pink"] = "Vacaciones de Baile",
			["bm_suit_var_suit_sunny_hawaii_pink_desc"] = "Chains no suele irse de vacaciones, pero cuando lo hace, se deja llevar. Durante sus vacaciones, alrededor de 2016, un vídeo de sus elegantes pasos de baile se hizo viral. Tuvo que ponerse en contacto con Bain para que lo borrara de Internet para siempre.",
			
			["bm_suit_var_suit_sunny_hawaii_red"] = "Vacaciones Lejanas",
			["bm_suit_var_suit_sunny_hawaii_red_desc"] = "A Jimmy le encanta contar una historia sobre sus agradables vacaciones tropicales interrumpidas por un ejército de supersoldados genéticamente modificados. Parece uno de sus cuentos de hadas inducidos por la cocaína, pero después del atraco a AKAN... ¿Quién sabe?",
			
			["bm_suit_var_suit_sunny_payne"] = "Vacaciones Indoloras",
			["bm_suit_var_suit_sunny_payne_desc"] = "Durante sus vacaciones en Sao Paulo, Wolf decidió comprar esta camiseta, pero se la regalaron, al parecer en señal de agradecimiento por lo que había hecho por la ciudad.\nWolf estaba confuso porque nunca había ido a Brasil.",
			
			["bm_suit_var_suit_sunny_vice"] = "Vacaciones sin Víctimas",
			["bm_suit_var_suit_sunny_vice_desc"] = "No puedes hacer que Sangres se ponga otra cosa que no sea una camisa llamativa, no importa la ocasión. Mientras los criminales más peligrosos se reúnen alrededor, todos elegantemente vestidos, Sangres viene con una camisa vieja y desgastada que consiguió en una venta de garaje en la ciudad de Vice.",
			
			["bm_suit_var_suit_sunny_security_red"] = "Guardaespaldas Rojo",
			["bm_suit_var_suit_sunny_security_red_desc"] = "Un miembro de élite de la seguridad de Sosa. Ernesto Sosa pensaba que lo tenía todo. Una gran mansión, un negocio fiable y una sólida seguridad que garantizaba su integridad. El mundo es suyo... Sin embargo, la historia está destinada a repetirse.",
			
			["bm_suit_var_suit_sunny_security_purple"] = "Guardaespaldas Púrpura",
			["bm_suit_var_suit_sunny_security_purple_desc"] = "Un miembro de élite de la seguridad de Sosa. Vigilancia 24/7 con drones y turnos de guardia bien coordinados. La mansión de Sosa es impenetrable. Si tan sólo alguien se molestara en revisar el último lote de yayo...",
			
			["bm_suit_var_suit_sunny_soprano"] = "Negocios Mafiosos",
			["bm_suit_var_suit_sunny_soprano_desc"] = "Aunque la mafia ni siquiera se parece a la banda PAYDAY, merece la pena rendirles homenaje: su estilo es excelente incluso en la vida cotidiana.",
		    -- Color variations - Prison Suit
			["bm_suit_var_suit_prison_default"] = "El Fugitivo",
			["bm_suit_var_suit_prison_default_desc"] = "La túnica que cambió a Hoxton para siempre. Él estaba seguro de haber quemado esta reliquia del sombrío pasado junto con el viejo refugio, pero de alguna manera encontró su camino al nuevo.",
			
			["bm_suit_var_suit_prison_repairman"] = "El 31",
			["bm_suit_var_suit_prison_repairman_desc"] = "¿Alguna vez se ha preguntado quién ha instalado tus cámaras espía?\n\nBueno, puedes seguir preguntándotelo, pero al menos sabrás lo que llevan puesto.",
			
			["bm_suit_var_suit_prison_comedy"] = "El Delincuente",
			["bm_suit_var_suit_prison_comedy_desc"] = "La túnica de Chins de la (im)popular Banda Paycheck. Estuvo a punto de llevarse 225 dólares de la caja registradora de la Tienda Pear, pero lo atraparon y lo enviaron a custodia. Por suerte, los compañeros de Chin tomaron como rehén a uno de los PearBooks y consiguieron intercambiarlo por él.",
			
			["bm_suit_var_suit_prison_vaultboy"] = "El Morador",
			["bm_suit_var_suit_prison_vaultboy_desc"] = "Sorprendentemente, a Bain nunca le han gustado las conspiraciones del 'fin del mundo', pero tras el trabajo de Pánico Nuclear a construir un pequeño refugio antiaéreo subterráneo. Porque ya sabes. Guerra.",
			
			["bm_suit_var_suit_prison_janitor"] = "El Conserje",
			["bm_suit_var_suit_prison_janitor_desc"] = "Corren rumores por los círculos criminales de que OMNIA está llevando a cabo experimentos de alto secreto. Cosas que superarían incluso a las del legendario Henry's Rock. Incluso los conserjes de OMNIA tienen que firmar un contrato y ser mantenidos bajo control.",
			
			["bm_suit_var_suit_prison_subject"] = "El Sujeto",
			["bm_suit_var_suit_prison_subject_desc"] = "Jimmy se los quitó a los sujetos de prueba antes de escapar del laboratorio de AKAN. Sólo en caso de que esas fatigas fueran el secreto detrás de sus habilidades excepcionales. Averigüémoslo.",
			
		--Weapon Colors
		["bm_wskn_resmod_blackgold"] = "Oro Negro",
		["bm_wskn_resmod_cleangold"] = "Oro Limpio",
		["bm_wskn_resmod_imissfauna"] = "Oro Ceres",
		["bm_wskn_resmod_imissfauna_desc"] = "La Madre Naturaleza nunca te traicionaría... ¿verdad?", --Bob: Por que siento que esto es una referencia a vtubers
		["bm_wskn_resmod_uuuuu"] = "Oro Ceres Gótico", --#GothFauna
		["bm_wskn_resmod_uuuuu_desc"] = "La naturaleza es oscura y hermosa al mismo tiempo, ¿verdad?",
		["bm_wskn_resmod_ownthiscity"] = "Flor Dorada",
		["bm_wskn_resmod_ownthiscity_desc"] = "¡Ahora es nuestro momento! ¡Vamos a comenzar esta mierda!",
		["bm_wskn_resmod_kindoffeel"] = "Oro Oscuro Abstracto",
		["bm_wskn_resmod_kindoffeel2"] = "Oro Claro Abstracto",
		["bm_wskn_resmod_insubstantial"] = "Oro Fásico",
		["bm_wskn_resmod_palmtop"] = "Oro Tigre",
		["bm_wskn_resmod_palmtop_desc"] = "Lo que más deseas, es algo que nunca conseguirás.",
		["bm_wskn_resmod_blacktiger"] = "Oro Tigre Negro",
		["bm_wskn_resmod_joe"] = "Oro Exótico",
		["bm_wskn_resmod_blackexotic"] = "Oro Exótico Negro",
		["bm_wskn_resmod_lildonnie"] = "Oro Perla",
		["bm_wskn_resmod_quacko"] = "Oro Azul",
		["bm_wskn_resmod_snake"] = "Oro Líquido",
		["bm_wskn_resmod_camo"] = "Oro Camuflado",
		["bm_wskn_resmod_camo2"] = "Oro Niebla",
		["bm_wskn_resmod_digital"] = "Oro Digital",
		["bm_wskn_resmod_splinter"] = "Oro Narva",
		["bm_wskn_resmod_urban"] = "Oro Urbano",
		["bm_wskn_resmod_dioxide"] = "Oro Carbono",
		["bm_wskn_resmod_rat"] = "Oro Fragmentado",
		["bm_wskn_resmod_ratdark"] = "Oro Fragmentado Oscuro",
		["bm_wskn_resmod_rocker"] = "Oro Estático",
		["bm_wskn_resmod_shocker"] = "Oro Estático Oscuro",
		["bm_wskn_resmod_whitefire"] = "Oro Flama",
		["bm_wskn_resmod_blackfire"] = "Oro Flama Oscuro",
		["bm_wskn_resmod_topography"] = "Oro Topografía",
		["bm_wskn_resmod_2019"] = "Oro de Guerra",
		["bm_wskn_resmod_llenn"] = "Diablo Rosa",
		["bm_wskn_resmod_llenn_desc"] = "Esto no es exactamente lo que tenía en mente, pero rosa es rosa.",
		["bm_wskn_resmod_sugarhoneyicetea"] = "Oro Cebra",
		["bm_wskn_resmod_blackzebra"] = "Oro Cebra Negro",
		["bm_wskn_resmod_charlotte"] = "Oro Telaraña",
		["bm_wskn_resmod_joker"] = "Ríete en Oro",
		["bm_wskn_resmod_jokerw"] = "Ríete en Blanco",
		
		["menu_weapon_color_index_11"] = "Metal + Miras",
		["menu_weapon_color_index_12"] = "Metal + Cargador",
		["menu_weapon_color_index_13"] = "Metal + Miras + Cargador",

		--Menu Buttons--
		["bm_menu_btn_sell"] = "VENDER ARMA ($price)",
		["bm_menu_btn_buy_selected_weapon"] = "COMPRAR ARMA ($price)",

		--New menu stats--
		["bm_menu_damage_shake"] = "Retroceso",
		["bm_menu_deflection"] = "Desviación",
		["bm_menu_regen_time"] = "T.Regeneración",
		["bm_menu_swap_speed"] = "T. Cambio",
		["bm_menu_pickup"] = "Munición Recogida",
		["bm_menu_ads_speed"] = "T. Apuntado",
		["bm_menu_reload"] = "T. Recarga",
		["bm_menu_damage"] = "Daño", -- I gotta find out WHO KILLED MY DA- how to spoof the damage readout for melee ["bm_menu_damage"] = "Damage Max",
		["bm_menu_standing_range"] = "Inc. Caida de Daño",
		["bm_menu_damage_min"] = "Daño Min",
		["bm_menu_moving_range"] = "Fin Caida de Daño",

		["bm_menu_attack_speed"] = "T. Repetición",
		["bm_menu_impact_delay"] = "T. Impacto",
		["bm_menu_cleave"] = "Atravesar",
		
		["bm_menu_stats_detection"] = "Carga",
		["bm_menu_stats_min_detection"] = "Carga",
		["bm_menu_stats_max_detection"] = "Carga",
		
		--Attachment type names--
		["bm_menu_barrel_ext"] = "Boquilla",
		["bm_menu_barrel_ext_plural"] = "Boquillas",
		["bm_menu_foregrip"] = "Guardamanos",
		["bm_menu_foregrip_plural"] = "Guardamanos",
		["bm_menu_vertical_grip"] = "Empuñadura Vertical",
		["bm_menu_vertical_grip_plural"] = "Empuñaduras Verticales",
		["bm_menu_bayonet"] = "Bayoneta",
		["bm_menu_bayonet_plural"] = "Bayonetas",
		--Spoof types--
		["bm_menu_frame"] = "Mecanismos",
		["bm_menu_whole_receiver"] = "Receptor",
		["bm_menu_shell_rack"] = "Portacartuchos",
		["bm_menu_nozzle"] = "Boquilla",
		["bm_menu_fuel"] = "Tanque",
		["bm_menu_cylinder"] = "Tambor",
		["bm_menu_model"] = "Modelo",
		["bm_menu_forebarrelgrip"] = "Cañón y Guardamanos",
		["bm_menu_riser"] = "Elevador",
		["bm_menu_pump"] = "Corredera",

		["bm_menu_upotte_barrel"] = "Cañón",
		["bm_menu_upotte_foregrip"] = "Guardamanos",
		["bm_menu_upotte_stock"] = "Culata",
		["bm_menu_jiisuri_stock"] = "Culata",
		["bm_menu_upotte_grip"] = "Empuñadura",

		["bm_menu_ro_barrel"] = "Cañón",
		["bm_menu_ro_stock"] = "Culata",
		["bm_menu_ro_modifier"] = "Modificadores",
		["bm_menu_ro_charm"] = "Colgante",
		["bm_menu_ro_grip"] = "Empuñadura",
		
		--Weapon categories--
		["menu_pistol"] = "Pistolas",
			["menu_light_pis"] = "Pistolas Ligeras",
			["menu_heavy_pis"] = "Pistolas Pesadas",
		
		["menu_shotgun"] = "Escopetas",
			["menu_light_shot"] = "Escopetas Automáticas",
			["menu_heavy_shot"] = "Escopetas Ligeras",
			["menu_break_shot"] = "Escopetas Pesadas",
		
		["menu_smg"] = "Subfusiles",
		["menu_lmg"] = "Ametralladoras",
		["menu_minigun"] = "Ametralladora Cañón Múltiple",
			["menu_light_smg"] = "Subfusiles Ligeros",
			["menu_heavy_smg"] = "Subfusiles Pesados",
			["menu_light_mg"] = "Ametralladoras Ligeras",
			["menu_heavy_mg"] = "Ametralladoras Medianas",
			["menu_miniguns"] = "Ametralladora Cañón Múltiple",

		["menu_assault_rifle"] = "Rifles",
		["menu_snp"] = "Francotiradores",
			["menu_light_ar"] = "Rifles Ligeros",
			["menu_heavy_ar"] = "Rifles Pesados",
			["menu_dmr_ar"] = "DMRs",
			["menu_light_snp"] = "Francotiradores Ligeros",
			["menu_heavy_snp"] = "Francotiradores Pesados",
			["menu_antim_snp"] = "Rifles Antimaterial",

		["menu_wpn_special"] = "Especiales",


		["menu_flamethrower"] = "Lanzallamas",
		["menu_grenade_launcher"] = "Lanzagranadas",

		["menu_saw"] = "Sierras",

		["menu_bow"] = "Arcos",

		["menu_crossbow"] = "Ballestas",

		["menu_unsupported"] = "Sin Soporte",

		["st_menu_value"] = "Valor:",

		["st_menu_skill_use"] = "HABILIDAD:",
		["st_wpn_akimbo"] = "Duales+",
		["st_wpn_assault_rifle"] = "Rifle",
		["st_wpn_snp"] = "Rifle",
		["st_wpn_pistol"] = "Pistola",
		["st_wpn_shotgun"] = "Escopeta",
		["st_wpn_smg"] = "Ametralladora",
		["st_wpn_lmg"] = "Ametralladora",
		["st_wpn_minigun"] = "Ametralladora",
		["st_wpn_crossbow"] = "Arco",
		["st_wpn_bow"] = "Arco",
		["st_wpn_saw"] = "Sierra",
		["st_wpn_grenade_launcher"] = "Lanzagranadas",
		["st_wpn_wpn_special"] = "Especial",
		["st_wpn_flamethrower"] = "Lanzallamas",

		["st_menu_firemode"] = "MODO:",
		["st_menu_firemode_semi"] = "SEMI",
		["st_menu_firemode_auto"] = "AUTO",
		["st_menu_firemode_burst"] = "RÁFAGA",
			["st_menu_firemode_burst_slamfire"] = "SLAMFIRE", --Bob: Comprobar si esto tiene traduccion
			["st_menu_firemode_burst_fanning"] = "FANNING", --Bob: Comprobar si esto tiene traduccion
			["st_menu_firemode_burst_rapidfire"] = "FUEGORAPIDO",
			["st_menu_firemode_burst_autoburst"] = "AUTO-RÁFAGA",
		["st_menu_firemode_volley"] = "VOLEA",

		["menu_reticle_dmc_eotech"] = "TECopt Completo",
		["menu_reticle_dmc_eotech_moa"] = "Punto TECopt MOA",
		["menu_reticle_dmc_eotech_seggs"] = "TECopt Segmentado",
		["menu_reticle_dmc_ebr_cqb"] = "Maelstrom EBR-CQC",
		["menu_reticle_dmc_trijicon_chevron"] = "Trigonom Chevron",
		["menu_reticle_dmc_ncstar"] = "Cruz de Reconocimiento",
		["menu_reticle_dmc_lua"] = "Hecho en Lua!",
		["menu_reticle_dmc_dot_4x4"] = "Punto Pequeño",
		["menu_reticle_dmc_dot_2x2"] = "Punto Diminuto",
		["menu_reticle_dmc_cross_holotherm"] = "SZ Holotherm",
		
		

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_append_milliseconds"] = "ms",
		["bm_menu_dodge_grace"] = "TIEMPO DE GRACIA ADICIONAL AL ESQUIVAR: #{skill_color}#$grace_bonus##",
		["bm_menu_dodge_grace_cap"] = "El tiempo de gracia al esquivar tiene un límite de #{important_1}#$grace_bonus_cap## debido al trabajo actual ",
		["bm_menu_dodge_grace_jp_cap"] = "#{important_1}#Pro-Job## rating",
		["bm_menu_dodge_grace_both"] = " y ",
		["bm_menu_dodge_grace_diff_cap"] = "nivel de riesgo de #{risk}#$risk_level##",

		["bm_menu_armor_grinding_1"] = "Blindaje regenerado cada ciclo: #{skill_color}#$passive_armor_regen##",
		["bm_menu_armor_grinding_2"] = "Blindaje regenerado cada ciclo: #{skill_color}#$passive_armor_regen## \nBlindaje regenerado al dañar enemigos: #{skill_color}#$active_armor_regen##",

		["bm_menu_armor_max_health_store_1"] = "Máximo de Salud acumulada: #{skill_color}#$health_stored##",
		["bm_menu_armor_max_health_store_2"] = "Máximo de Salud acumulada: #{skill_color}#$health_stored## \nBonus de regeneración de Blindaje al matar: #{skill_color}#$regen_bonus%##",
	})

	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Modificador",
		["steam_inventory_stat_boost"] = "Modificador de Estadísticas",

		--Safe House--
		["dialog_safehouse_text"] = "Aún no has visitado el refugio.\n\nDeberías, puede que encuentres algo nuevo.\n\nTe gustaría ir ahora?",

		["bm_menu_custom_plural"] = "ACCESORIOS DE ARMAS EN LA CATEGORÍA CUSTOM", --unused?--

		----Custom Weapon Mod Descriptions----

		--Is there a reason these have to be down here? If not, I'll move them up with the others (custom weapons in their own section dw)--

		--Triad Chi-Revolver [Custom]--
		["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "¿Por qué usarías munición anticuada post-colisión con Chi-Revolvers? ¿Por qué coño se lamen las pelotas los perros?\nRatio mínimo y máximo de recogida de munición: 1.33x", --Bob: Comprobar si chi revolver tiene traduccion
		["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "Revienta a tus enemigos a través de muros, armadura corporal y escudos con estos cartuchos.\nPermite perforar armadura corporal, escudos y muros a costa de daño.",
		["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "Balas huecas robadas de un lugar de origen desconocido. Lo único que necesitas saber es que esta mierda PATEA fuerte y el hecho de que cualquier cosa en el otro extremo del cañón queda prácticamente vaporizada después de que el arma patee. Buena mierda, ¿no?\nEsta munición es mucho más difícil de encontrar en paquetes de munición.\nTodo lo demás se reduce a favor del daño y recogida de munición.\nRatio mínimo y máximo de recogida de munición: 0.33x",

		--DECK-ARD [Custom]--
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "Dispárales tanto que morirán en el infierno.\nDaño masivo a costa de todo lo demás.\nCapaz de atravesar armadura corporal, muros y escudos.\nEsta munición es mucho más difícil de encontrar en paquetes de munición.\nRatio mínimo y máximo de recogida de munición: 0.33x",
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "Mátalos a tiros.\nEsta munición es mucho más fácil de encontrar en paquetes de munición.\nRatio mínimo y máximo de recogida de munición: 1.33x",

		--Unknown Weapon--
		["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "KIT DE CONVERSIÓN 7,62 MM",
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Convierte el calibre del arma a 7,62 mm, lo que disminuye ligeramente la cadencia de fuego y la estabilidad a favor de un aumento de daño y precisión.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "Un tipo de munición que imita a los rifles de categoría media. Reduce la munición máxima y la estabilidad a cambio de un mayor daño y precisión.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "EMPUÑADURA MAGWELL",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "CARGADOR EXTENDIDO",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "CARGADOR EXTEND-O",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Convierte al Jackal en el Mastiff, algo así como la hermana pequeña de la familia del Jackal. No es tan estable como el Coyote ni tan letal como el Jackal, pero al menos dispara proyectiles capaces de atravesar armadura corporal y muros.",

		--Unknown weapon--
		["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "Rondas de punta abierta que, gracias a la física, crean cavidades de heridas más grandes y dolorosas en sus enemigos. Aunque las balas HP son más difíciles de encontrar en los enemigos y tienen más retroceso, afortunadamente son más eficaces contra la cabeza y algo más precisas que las balas normales.",
		--Unknown Weapon--
		["bm_menu_weirdmagthing"] = "EMPUÑADURA MAGWELL",

		--Gecko 7.62--
		["bm_wp_wpn_fps_ass_galil_m_drum"] = "CARGADOR DE TAMBOR 75 RNDS",

		--Cavity 9mm--
		["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "Convierte a pistola de categoría media.\nRatio mínimo y máximo de recogida de munición: 0.8x",

		--DP-28 [Custom]--
		["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "Un trípode con munición adicional montada en su lateral.\nReduce la velocidad de movimiento un 20% cuando está equipado.",

		--Arbiter--
		["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "Visor experimental que otorga al Arbiter la capacidad de lanzar ráfagas.\nIncompatible con proyectiles incendiarios.", --Bob: Comprobar si airburst tiene otra traduccion

		--Itachi [Custom]--
		["bm_wp_wpn_fps_upg_bajur_m_pants"] = "NO",
		["bm_wp_wpn_fps_upg_bajur_fg_dmr_desc"] = "Sustituye el receptor superior del Itachi por una variante Beowulf del calibre .50, lo que hace que el arma patee mucho más fuerte, pero aumentando el tamaño de los agujeros de bala que les hacen a los agentes de la ley.\n Reduce todas las estadísticas, excepto la precisión y la potencia.",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Presiona #{skill_color}#$BTN_BIPOD## sobre una superficie valida para desplegar. Presiona otra vez para plegar.\n\nMientras esté desplegado reduce el retroceso vertical en #{skill_color}#50%##, el retroceso horizontal en #{skill_color}#75%## e incrementa el alcance en #{skill_color}#30%##.\n\n#{item_stage_2}#Ajustes adicionales para desplegar se pueden encontrar en el menú de ajustes extra de Restoration Mod.##",
		["bm_sc_bipod_desc"] = "Presiona #{skill_color}#$BTN_BIPOD## sobre una superficie valida para desplegar. Presiona otra vez para plegar.\n\nMientras esté desplegado reduce el retroceso vertical en #{skill_color}#50%##, el retroceso horizontal en #{skill_color}#75%## e incrementa el alcance en #{skill_color}#30%##.\n\n#{item_stage_2}#Ajustes adicionales para desplegar se pueden encontrar en el menú de ajustes extra de Restoration Mod.##",
		["hud_hint_bipod_moving"] = "No se puede desplegar mientras está en movimiento",
		["hud_hint_bipod_slide"] = "No se puede desplegar mientras se desliza",
		["hud_hint_bipod_air"] = "No se puede desplegar en el aire",
		["hud_hint_bipod_lean"] = "No se puede desplegar mientras se inclina",
		["hud_hint_bipod_midstance"] = "No se puede desplegar mientras se cambia de postura",

		["hud_interact_autumn_disable"] = "¡Desactivado por el Capitán Autumn!",

		["hud_assault_restored_down"] = "Asalto Sobrevivido - Restaurando 1 Vida",
		["hud_assault_remaining_single"] = "1 Asalto Restante Para Restaurar 1 Vida",
		["hud_assault_remaining_plural"] = " Asaltos Restantes Para Restaurar 1 Vida",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_r0991"] = "Pistola Varmint AR-15",
		
		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Bonus Pequeño de Movilidad y Penalizador de Estabilidad",
		["bm_menu_bonus_concealment_p1_mod"] = "MOD. PEQUEÑO DE MOVILIDAD",
		["bm_menu_bonus_concealment_p2"] = "Bonus Grande de Movilidad y Penalizador de Estabilidad",
		["bm_menu_bonus_concealment_p2_mod"] = "MOD. GRANDE DE MOVILIDAD",
		["bm_menu_bonus_concealment_p3"] = "Bonus Masivo de Movilidad y Penalizador de Estabilidad",
		["bm_menu_bonus_concealment_p3_mod"] = "MOD. MASIVO DE MOVILIDAD",
		["bm_menu_bonus_spread_p1"] = "Bonus Pequeño de Precisión y Penalizador de Estabilidad",
		["bm_menu_bonus_spread_p1_mod"] = "MOD. PEQUEÑO DE PRECISIÓN",
		["bm_menu_bonus_spread_n1"] = "Bonus Masivo de Estabilidad y Penalizador de Precisión",
		["bm_menu_bonus_recoil_p3_mod"] = "MOD. MASIVO DE ESTABILIDAD",
		["bm_menu_bonus_recoil_p1"] = "Bonus Pequeño de Estabilidad y Penalizador de Precisión",
		["bm_menu_bonus_recoil_p1_mod"] = "MOD. PEQUEÑO DE ESTABILIDAD",
		["bm_menu_bonus_recoil_p2"] = "Bonus Grande de Estabilidad y Penalizador de Precisión",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+5% de recompensa de experiencia para ti y tu equipo.",
		["bm_menu_spread"] = "Precisión\n",
		["bm_menu_recoil"] = "Estabilidad\n",
		["bm_menu_concealment"] = "Movilidad\n",
		["bm_menu_bonus_spread_p2_mod"] = "MOD. GRANDE DE PRECISIÓN",
		["bm_menu_bonus_spread_p3_mod"] = "MOD. MASIVO DE PRECISIÓN",
		["bm_menu_bonus_recoil_p2_mod"] = "MOD. GRANDE DE ESTABILIDAD",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Mejora de Dinero",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+5% de recompensa de dinero para ti y tu equipo.",

		["bm_wp_upg_i_singlefire_desc"] = "Bloquea tu arma a modo #{risk}#semiautomático##.",
		["bm_wp_upg_i_autofire_desc"] = "Bloquea tu arma a modo #{risk}#automático##.",

		--Throwables--
		["bm_dynamite_desc"] = "Daño: #{risk}#800## \nAlcance de Explosión: #{skill_color}#4m## \nTiempo de Detonación: #{skill_color}#3s## \n- Rebote y rodado reducidos en comparación con otros explosivos arrojadizos\n\nDiseñado para atravesar rocas de manera efectiva. Aún más efectivo para atravesar personas.",
		--Frag
		["bm_grenade_frag_desc"] = "Daño: #{risk}#800## \nAlcance de Explosión: #{skill_color}#5m## \nTiempo de Detonación: #{skill_color}#3s## \n\nLa clásica granada de mano explosiva. ¿Hay algo más que decir?",
		--Community Frag
		["bm_grenade_frag_com_desc"] = "Daño: #{risk}#800## \nAlcance de Explosión: #{skill_color}#5m## \nTiempo de Detonación: #{skill_color}#3s## \n\nUna nueva y elegante apariencia de la clásica granada de mano, que seguramente otorgará ese toque OVERKILL a cada explosión.",
		--Community Frag 2
		["bm_grenade_dada_com_desc"] = "Daño: #{risk}#800## \nAlcance de Explosión: #{skill_color}#5m## \nTiempo de Detonación: #{skill_color}#3s## \n\nLas capas exteriores de la muñeca ocultan su explosivo funcionamiento interno. Un tributo a la Madre Patria.",
		--Snowball
		["bm_grenade_xmas_snowball_desc"] = "Daño: #{skill_color}#180## \nAlcance de Explosión: #{skill_color}#1m## \nTiempo de Recarga: #{skill_color}#1 bola cada 25s## \n\nMójalos en agua, tíralos al congelador y obtendrás un arma arrojadiza mortal. Simple.",
		--Zapper
		["bm_grenade_electric_desc"] = "Daño: #{skill_color}#400## \nAlcance de Explosión: #{skill_color}#5m## \nTiempo de Detonación: #{skill_color}#3s## \n- #{skill_color}#Electrocuta a la mayoría de enemigos## \n\nLa metralla está muy bien, pero algunas cosas necesitan freírse, y esta pequeña belleza es una bestia bastante práctica para causar daño con alto voltaje.",
		--Sticky
		["bm_grenade_sticky_grenade"] = "GRANADA ADHESIVA",
		["bm_grenade_sticky_grenade_desc"] = "Daño: #{risk}#800## \nAlcance de Explosión: #{skill_color}#4m## \nTiempo de Detonación: #{skill_color}#2.5s## \n\nCompuesto explosivo arrojadizo que se adhiere a la mayoría de las superficies, ¡Incluso a personas!",
		--Molotov
		["bm_grenade_molotov_desc"] = "Daño (Charco de Fuego): #{heat_warm_color}#1200 en 10s##\nDaño (Quemadura): #{heat_warm_color}#60 en 3s## \nDaño (Explosión): #{heat_warm_color}#30## \nAlcance (Charco de Fuego): #{skill_color}#3.75m## \nAlcance (Explosión): #{skill_color}#3m## \nTiempo de Detonación: #{skill_color}#Detona al Impactar## \n- Tiene un #{skill_color}#50%## de probabilidad de #{heat_warm_color}#incendiar## enemigos, provocando que la mayoria entre en pánico. \n \nUna botella llena de líquido inflamable con un trapo ardiendo. Es barato, sencillo y muy eficaz. Quemalo todo.",
		--Incendiary
		["bm_grenade_fir_com_desc"] = "Daño (Charco de Fuego): #{heat_warm_color}#1440 en 12s##\nDaño (Quemadura): #{heat_warm_color}#120 eb 6s## \nDaño (Explosión): #{heat_warm_color}#30## \nAlcance de Explosión (Charco de Fuego): #{skill_color}#3.75m## \nAlcance de Explosión (Explosión): #{skill_color}#4.5m## \nTiempo de Detonación: #{skill_color}#2.5s##  \n- #{skill_color}#50%## de probabilidad de #{heat_warm_color}#incendiar## enemigos, provocando que la mayoria entre en pánico.\n\nUn contenedor de fósforo autoinflamable. Perfecto para rebotar en las paredes y esquinas hacia tus enemigos.",
		--Concussion
		["bm_concussion_desc"] = "Alcance de Explosión: #{skill_color}#10m## \n- Aturde enemigos por hasta #{skill_color}#4s##\n- Reduce la precisión del enemigo en un #{skill_color}#50%## por #{skill_color}#7s## \n- #{important_1}#Escudos Titán, Bulldozers Titán y Capitanes son inmunes a sus efectos aturdidores## \n\nEsta pequeña e impresionante belleza dejará a todos sin aliento y te dará ese momento extra para matarlos.",
		--Gas
		["bm_grenade_poison_gas_grenade"] = "GRANADA MANTÍCORA-6",
		["bm_grenade_poison_gas_grenade_desc"] = "Daño: #{stats_positive}#300 en 10s## \nAlcance de Explosión: #{skill_color}#6m## \nDuración (Nube de Gas): #{skill_color}#12s## \n Tiempo de Detonación: #{skill_color}#1s despues de mantenerse quieta## \n- #{skill_color}#100%## de probabilidad de aturdir a la mayoría de enemigos dentro del alcance del gas\n- #{important_1}#Escudos, Bulldozers, Granaderos y Capitanes son inmunes a sus efectos aturdidores##\n- #{important_1}#Los enemigos no pueden ser envenenados por la misma nube de gas más de una vez## \n\nEsta arma biológica experimental emitirá una amplia nube de gas tóxico que afecta a genotipos específicos; ha sido diseñada para no dañarte a ti ni a tu equipo. Las víctimas experimentarán tos violenta, náuseas y vómitos y es letal para todos, excepto para los enemigos más duros.\n\nVerdaderamente el arma preferida de un criminal de guerra.",
		["bm_grenade_poison_gas_grenade_desc_short"] = "Daño: #{stats_positive}#300 en 10s## \nAlcance de Explosión: #{skill_color}#6m## \nDuración (Nube de Gas): #{skill_color}#12s## \n Tiempo de Detonación: #{skill_color}#1s despues de mantenerse quieta## \n- #{skill_color}#100%## de probabilidad de aturdir a la mayoría de enemigos dentro del alcance del gas\n- #{important_1}#Escudos, Bulldozers, Granaderos y Capitanes son inmunes a sus efectos aturdidores##\n- #{important_1}#Los enemigos no pueden ser envenenados por la misma nube de gas más de una vez##",

		--Throwing Cards
		["bm_wpn_prj_ace_desc"] = "Daño: #{skill_color}#240## \n- #{skill_color}#Pueden Recuperarse## \n\nCartas Arrojadizas con peso añadido y filo de cuchilla. Una mano de cartas realmente letal.",
		--Throwing Stars
		["bm_wpn_prj_four_desc"] = "Daño (Impacto): #{skill_color}#200## \nDaño (Veneno): #{stats_positive}#120 en 4s## \n- #{skill_color}#Pueden Recuperarse##\n- #{skill_color}#50%## de probabilidad de aturdir a la mayoría de enemigos cada #{skill_color}#0.5s##\n- #{important_1}#Escudos, Bulldozers, Granaderos y Capitanes son inmunes a sus efectos aturdidores## \n\nLa estrella arrojadiza tiene una larga historia llena de sangre y batallas. Estas estrellas de acero inoxidable recubiertas de veneno representarán una amenaza letal para cualquiera que se interponga en tu camino.",
		--Javelin
		["bm_wpn_prj_jav_desc"] = "Daño: #{skill_color}#360## \n- #{skill_color}#Pueden Recuperarse##\n\nCon sus orígenes perdidos en la prehistoria, la jabalina es un arma sencilla. Después de todo, es un palo arrojadizo con un extremo puntiagudo que le arruina el día a alguien.",
		--Throwing Axe
		["bm_wpn_prj_hur_desc"] = "Daño: #{skill_color}#360## \n- #{skill_color}#Pueden Recuperarse##\n\nDicen que un hacha afilada nunca viene mal. Un hacha afilada arrojadiza no podría ser más apropiada.",
		--Throwing Knife
		["bm_wpn_prj_target_desc"] = "Daño: #{skill_color}#240## \n- #{skill_color}#Pueden Recuperarse##\n\nUn plan de respaldo sólido y una táctica confiable para una baja precisa y silenciosa.",

		--Perk Deck Throwables
		["bm_grenade_copr_ability"] = "AMPOLLA DE SANGUIJUELA",
		["bm_grenade_damage_control"] = "PETACA STOIC",
		["bm_grenade_smoke_screen_grenade_desc"] = "Radio de Alcance: #{skill_color}#6m## \nDuración: #{skill_color}#12s## \nTiempo de Detonación: #{skill_color}#1 después de quedarse quieta## \n\nDeja caer uno de estos y desaparecerás en una nube de humo, dejando a tus enemigos esforzandose por poder apuntarte.",
		
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
				["bm_w_socom"] = "ANUBIS .45",
				["bm_w_socom_desc"] = "El arma preferida de Jackal. Una pistola .45 ACP fiable y potente con un diseño elegante.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Módulo Combinado Ra",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Enciendelo o apagalo pulsando #{skill_color}#$BTN_GADGET.##",
				["bm_w_x_socom"] = "ANUBIS .45 DUALES",
				--S&W .500
				["bm_w_shatters_fury"] = "PHOENIX .500",
				["bm_wp_shatters_fury_desc"] = "Un enorme revólver del calibre .500 con una potencia demencial. El arma preferida de Shatter.\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "CAÑÓN HORUS",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "CAÑÓN SHATTER",
				["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "CAÑÓN HATHOR",
				["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "CAÑÓN FIREBIRD",
				["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "EMPUÑADURA ERGONÓMICA",
				["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "CILINDRO LISO",
				--OICW--
				["bm_w_osipr"] = "SABR",
				["bm_w_osipr_gl"] = "LANZAGRANADAS SABR",
				["bm_w_osipr_desc_pc"] = "Tecnología de armas de generación X. Equipado con un #{skill_color}#lanzagranadas de 20 mm.##\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.",
				["bm_w_osipr_desc"] = "Tecnología de armas de generación X. Equipado con un #{skill_color}#lanzagranadas de 20 mm.##\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.", --Bob: En el original dice manten en vez de pulsar, puede ser un error
	
				--Reinfield
				["bm_wp_r870_s_folding_ext"] = "CULATA MULDON DESPLEGADA",
				--Bernetti--
				["bm_wp_upg_i_93r"] = "KIT BERNETTI 93T",
				["bm_wp_upg_i_93r_desc"] = "#{risk}#Añade un selector de disparo##, permitiendo que esta arma cambie a una configuración de #{skill_color}#ráfaga de 3 disparos a 1100 RPM##, a coste de un #{important_1}#mayor retroceso.##",
				--10-0
				["bm_wp_upg_i_tekna"] = "KIT DE RÁFAGA TEKNA",
				["bm_wp_upg_i_tekna_desc"] = "Bloquea esta arma para que dispare en #{risk}#ráfagas de 3 disparos##; ¿combinala con un #{skill_color}#glaive## quizás?", --Bob: No se a que se refiere con el glaive
				["bm_wally_desc"] = "#{important_2}#Eh, chaval...##", --Bob: Esto es una referencia?
				--AMR16--
				["bm_wp_upg_i_m16a2"] = "KIT AMR-16 B3",
				["bm_wp_upg_i_m16a2_desc"] = "Cambia el modo automático por una #{skill_color}#ráfaga de 3 disparos##. La cadencia de disparo en #{risk}#ráfaga## #{skill_color}#aumenta a 950 RPM.##",
				--Bernetti Auto--
				["bm_wp_upg_i_b93o"] = "KIT BERNETTI OVERKILL",
				["bm_wp_upg_i_b93o_desc"] = "Cambia el disparo en ráfaga por un modo #{skill_color}#automático##, a costa de un #{important_1}#mayor retroceso.##",
				--2006M Hailstorm
				["bm_w_hailstorm_2006m"] = "HAILSTORM-9",
				["bm_w_hailstorm_rsh12"] = "HAILSTORM-12",
				["bm_wp_upg_i_iw_hailstorm"] = "KIT HAILSTORM",
				["bm_wp_upg_i_iw_hailstorm_desc"] = "Un kit de armas prototipo fabricado por Fujiwara Heavy Industries.\n\nModifica esta arma para que pueda utilizar #{skill_color}#munición especial de triple carga.##",
				["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "Un kit de armas prototipo fabricado por Fujiwara Heavy Industries.\n\nModifica esta arma para que pueda utilizar #{skill_color}#munición especial de triple carga## pero #{important_1}#el daño a través de armadura corporal se reduce un 50% y ya no puede atravesar escudos.##",
				--M32 MK32 Kit
				["bm_wp_upg_i_ghosts_mk32"] = "KIT MK32",
				["bm_wp_upg_i_ghosts_mk32_desc"] = "Un kit de armas prototipo de Task Force: STALKER.\n\nCambia el disparo único por #{skill_color}#ráfagas de 2 disparos.##",
				--AR-15 Mods
				["bm_wp_upg_s_saintvictor_hera"] = "CULATA KILLER INSTINCT",
				["bm_wp_upg_vintage_fal_sc"] = "CARGADOR RIDGEBACK",
				["bm_wp_upg_vintage_sc"] = "CARGADOR VINTAGE",
				["bm_wp_upg_mil_sc"] = "CARGADOR MILSPEC",
				["bm_wp_upg_tac_sc"] = "CARGADOR TÁCTICO",
				--Generic Mods
				["bm_wp_upg_vg_afg"] = "AFG",
				["bm_wp_upg_vg_stubby"] = "EMPUÑADURA VERTICAL RECHONCHA",
				["bm_wp_upg_vg_tac"] = "EMPUÑADURA VERTICAL TAC",
				["fucktheatf"] = "Eso es un delito.",
				["bm_wp_upg_flash_hider"] = "#{skill_color}#Oculta los fogonazos## y #{risk}#reduce la probabilidad de que los enemigos intenten esquivar tus disparos.##",
				["bm_wp_upg_suppressor"] = "#{skill_color}#Silencia## tu arma y #{risk}#reduce la probabilidad de que los enemigos intenten esquivar tus disparos.##",
				["bm_wp_upg_suppressor_boss"] = "\"Que emoción...\"\n\n#{skill_color}#Silencia## tu arma y #{risk}#reduce la probabilidad de que los enemigos intenten esquivar tus disparos.##",
				["bm_wp_upg_suppressor_warn"] = "#{skill_color}#Silencia## tu arma y #{risk}#reduce la probabilidad de que los enemigos intenten esquivar tus disparos.##\n\n#{important_1}#Puede bloquear miras.##",
				["bm_wp_upg_o_shortdot_dmc"] = "Mira Telescópica Shortdot",
				["bm_wp_upg_o_5_default"] = "Mira telescópica de largo alcance.\nAgregalo para poder modificar la retícula predeterminada de la mira telescópica.\n#{risk}#5x aumentos.##",
				["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
				["bm_wp_upg_drum_desc"] = "",
				["bm_wp_upg_drum2_desc"] = "",
				["bm_wp_upg_quad_desc"] = "",
				["bm_wp_upg_quad2_desc"] = "",
				["bm_wp_upg_vintage_desc"] = "",

				--CUSTOM WEAPON ATTACHMENTS
					--M6D
					["kfa_scope"] = "VISOR KFA-2 SMART-LINK",
					["kfa_scope_desc"] = "Habilita la interconexión entre tu máscara y el visor #{skill_color}#Smart-Link## montado.\n#{risk}#2x aumentos.##",
					--M6D
					["halo_scope"] = "VISOR SMART-LINKED",
					["halo_scope_2_desc"] = "Habilita la interconexión entre tu máscara y el visor #{skill_color}#Smart-Link## montado.\n#{risk}#2x aumentos.##",
					--M200 WIDOWMAKER
					["bm_w_m200_iw"] = "WIDOWMAKER",
					["bm_wp_upg_i_iw_widowmaker"] = "KIT WIDOWMAKER",
					["bm_wp_upg_i_iw_widowmaker_desc"] = "Un kit de armas prototipo fabricado por Kendall Ballistics.\n\nModifica esta arma para que pueda utilizar #{skill_color}#munición especial de doble carga.##",
					--NV4
					["bm_wp_upg_o_iwelo"] = "Mira De Luz Emitida con retícula iluminada flotante\n#{risk}#1.1x aumentos.##",
					["bm_wp_upg_o_iwrds"] = "Mira de precisión de punto rojo.\n#{risk}#1.5x aumentos.##",

					--Raygun
					["bm_wp_raygun_o_waw"] = "ALINEACIÓN DE MIRAS DE HIERRO OG",
					["bm_wp_raygun_o_waw_desc"] = "Cambia la alineación de la mira de hierro a como era antes de Call of Duty: Black Ops II.",
			
			--[[ PISTOLS ]]
				--Gecko Pistol
				["bm_tranq_maxim_sc_desc"] = "La primera pistola semiautomática con #{skill_color}#supresión integrada## del mundo, el buen manejo y la ocultabilidad encajan bien con las debilitantes balas tranquilizantes.\n\n#{stats_positive}#Inflige daño por el tiempo con balas tranquilizantes.##",
				["bm_tranq_x_maxim_sc_desc"] = "Un par de las primeras pistolas semiautomáticas con #{skill_color}#supresión integrada## del mundo, el buen manejo y la ocultabilidad encajan bien con las debilitantes balas tranquilizantes.\n\n#{stats_positive}#Inflige daño por el tiempo con balas tranquilizantes.##",
				--Igor (APS)
				["bm_stech_sc_desc"] = "Una pistola ametralladora más pesada y lenta que perdió popularidad debido a su peso. Su peso permite un mejor control a costa de la capacidad de ocultación.",
				["bm_x_stech_sc_desc"] = "Una pistola ametralladora más pesada y lenta que perdió popularidad debido a su peso. Su peso permite un mejor control a costa de la capacidad de ocultación.",
				--Chimano Compact
				["bm_jowi_sc_desc"] = "Una Chimano configurada para llevar la ocultación al extremo a costa de casi todo lo demás.\n\nLos rumores dicen que Wick lo usó cuando buscaba venganza contra la mafia rusa.",
				["bm_x_jowi_sc_desc"] = "Cuando son tan pequeñas, ¿por qué no llevar dos? Un emparejamiento que incorrectamente se atribuye a la elección personal de Wick.",
				--Glock 18c
				["bm_g18c_sc_desc"] = "Pistola Austriaca totalmente automática. Difícil de controlar, pero a corta distancia es absolutamente devastadora.",
				["bm_x_g18c_sc_desc"] = "Si una era una manguera de balas, llevar dos bien podría ser una tormenta. ¡Cuidado con el retroceso!",
				--CZ 75
				["bm_czech_sc_desc"] = "Una de las Wonder Nine, una pistola ametralladora de excelente ergonomía y manejo. Utilizada por fuerzas antiterroristas de todo el mundo.", --Bob: Deberia traducir wonder nine?
				["bm_x_czech_sc_desc"] = "Otro ejemplo de cómo no usar una pistola ametralladora. ¿Cómo puedes recargar cómodamente estas cosas?",
				--PPK (Gruber)
				["bm_ppk_sc_desc"] = "Una alternativa compacta a armas de fuego más grandes y peligrosas. Un arma clásica con una aplicación clásica.",
				["bm_x_ppk_sc_desc"] = "Para cuando necesites ser menos 007 y más Kingsman.",
				--M13
				["bm_legacy_sc_desc"] = "Diseño de Alemania Occidental que acabó siendo rechazado en favor del Bernetti, pero todavía aguantará en un tiroteo.",
				["bm_x_legacy_sc_desc"] = "Dos pistolas olvidadas por la historia que dejarán un legado de plomo en la habitación que elijas.",
				--Glock 17
				["bm_g17_sc_desc"] = "Fácil control del retroceso y fiable. El arma perfecta para empezar una carrera como atracador.",
				["bm_x_g17_sc_desc"] = "Compensa la enclenque 9mm con una gran potencia de fuego y aprovechando el bajo retroceso.\n\nLa elección de Hoxton cuando lo liberamos.",
				--Bernetti 9
				["bm_b92fs_sc_desc"] = "Un arma de fuego muy popular debido a su impresionante capacidad de cargador y su decente daño. Especialmente útil para enfrentamientos con numerosos antagonistas.",
				["bm_x_b92fs_sc_desc"] = "Dos pistolas son mejor que una. Otra forma de convertir cualquier encuentro en una fiesta de 9 mm.",
				--White Streak
				["bm_pl14_sc_desc"] = "Pistola Rusa moderna que utiliza tecnología post-soviética occidental. Popular entre los Segadores por su fiabilidad y aspecto futurista.",
				["bm_x_pl14_sc_desc"] = "Pistola Rusa moderna que utiliza tecnología post-soviética occidental. Popular entre los Segadores por su fiabilidad y aspecto futurista.",
				--Holt 9mm
				["bm_holt_sc_desc"] = "Un prototipo funcional de un arma de mano que ha estado estancada en el infierno del desarrollo, presenta un diseño innovador para ayudar a reducir el retroceso.",
				["bm_x_holt_sc_desc"] = "No uno, sino dos prototipos en funcionamiento de la pistola equivalente a lost media.",
				--FMG-9
				["bm_fmg9_sc_desc"] = "Un prototipo de plataforma de armas que funciona como portabebés para tu STRYK 18c, ¡con tecnología de plegado futurista!",  --Bob: No se a que se refiere el original con el baby carrier
				--93R
				["bm_beer_sc_desc"] = "Una pieza de hardware de disparo en ráfaga que roza la ficción y que hará que los cretinos se peleen por averiguar de quién es. Vivo o muerto vendrás conmigo.\n\nTiene una cadencia de fuego de #{skill_color}#1200 RPM## cuando dispara en ráfaga.",
				["bm_beer_auto_desc"] = "Una pieza de hardware de disparo en ráfaga que roza la ficción y que hará que los cretinos se peleen por averiguar de quién es. Vivo o muerto vendrás conmigo.",
				--Contractor Pistols 
				["bm_packrat_sc_desc"] = "La elección de Wick por su fiabilidad y facilidad de uso. Se dice que la utilizó cuando le hizo una visita al Círculo Rojo.",
				["bm_x_packrat_sc_desc"] = "La opción perfecta para limpiar clubes nocturnos de propiedad Rusa con un mensaje de sangre y venganza.",
				--Breech (Luger) 
				["bm_breech_sc_desc"] = "La pistola que casi se apodera del mundo. Dos veces. Este artefacto alemán es elegante, preciso y desafortunadamente obsoleto.",
				--Chimano Custom
				["bm_g22c_sc_desc"] = "Esta arma es una combinación de alta capacidad y alta potencia. Entre las mejores pistolas de combate en general.",
				["bm_x_g22c_sc_desc"] = "Si un voto fuera un arma gratis, el fraude electoral parece atractivo cuando puedes conseguir dos de estas pistolas portátiles.",
				--Signature .40
				["bm_p226_sc_desc"] = "Tanto si se trata de interceptar transportes blindados como de robar bancos, este clásico nunca dejará de decepcionar.",
				--LEO
				["bm_hs2000_sc_desc"] = "Tanto los agentes de la Interpol como los policías croatas corruptos y los delincuentes internacionales encontrarán la eficacia de esta pistola compacta.",
				["bm_wp_hs2000_sl_long"] = "Corredera De Élite", --Bob: Comprobar que nombre poner a esto
				--5/7 pistol
				["bm_lemming_sc_desc"] = "Potencia y capacidad combinadas. Si no está muerto en 20 tiros probablemente no deberías dispararle.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
				--Baby Deagle--
				["bm_sparrow_sc_desc"] = "¡NOS VEMOS EN EL ESPACIO, VAQUERO ESPACIAL!", --Bob: referencia a cowboy beebop aun tenia que terminarme 6 episodios :c
				["bm_w_sparrow_sc_g_cowboy_desc"] = "VAS A CARGAR CON ESE PESO.", --Bob: me espoilee el final para ver a que hacia referencia T-T
				--socom deez nuts--
				["bm_w_socom_desc"] = "El arma preferida de Jackal. Una pistola .45 ACP fiable y potente con un diseño elegante.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "MÓDULO COMBINADO RA",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Enciendelo o apagalo pulsando #{skill_color}#$BTN_GADGET.##",
				--Crosskill
				["bm_1911_sc_desc"] = "Cuando la 9mm no es suficiente, busca esta 1911A1 personalizada con el poderoso .45ACP. Brutalidad de primera.",
				["bm_x_1911_sc_desc"] = "Aunque no tiene poderes demoníacos, la carnicería sin duda dejará a la gente gritando de terror.",
				--Crosskill Chunky
				["bm_m1911_sc_desc"] = "Una reproducción de la clásica Crosskill .45. A pesar del nombre, no es en absoluto más gruesa que la personalizada.",
				--Crosskill Guard
				["bm_shrew_sc_desc"] = "Más pequeña y compacta que su prima A1 clásica. Intercambia la capacidad del cargador y la longitud del cañón por una mayor ocultabilidad.",
				["bm_x_shrew_sc_desc"] = "El estilo de los Canaanites, dos pistolas del 45 que resuelven problemas en un paquete muy pequeño que seguramente hará huir a los intrusos.", --Bob: Comprobar si cananites es un nombre
				["bm_shrew_g_bling_sc_desc"] = "En un mundo lleno de miseria e incertidumbre, es un gran consuelo saber que, al final, hay luz en la oscuridad.",
				--USP 
				["bm_usp_sc_desc"] = "El arma de S&G, por encima de la media, destaca en daño, capacidad y alcance.",
				["bm_x_usp_sc_desc"] = "Un par de pistolas S&G para cuando realmente necesites enviar un mensaje.",
				--Model 54 
				["bm_type54_sc_desc"] = "Pistola de diseño soviético con munición del contundente 7,62×25 mm; cuenta con un exclusivo soporte para escopeta bajo el cañón que ofrece una forma adicional de deshacerse de los tipos malos.",
				["bm_x_type54_sc_desc"] = "Un golpe uno-dos que puede convertirse en un golpe uno-dos-tres-cuatro.",
				--Broomstick--
				["bm_c96_sc_desc"] = "\"...y entonces el  #{important_1}#lobo## se comió a Caperucita Roja.\"\n\nUna revolucionaria pistola alemana, ésta en particular ha sido modificada para disparar en modo automático.\n\nEsta arma se recarga con clips de 10 balas a la vez.",
				["bm_wp_c96_nozzle"] = "BOQUILLA BLASTECH DL-44",
				["bm_wp_c96_nozzle_desc_sc"] = "Tecnología supuestamente procedente de #{skill_color}#una galaxia muy, muy lejana## convierte esta arma para poder disparar #{risk}#rayos de plasma## y utilizar un #{skill_color}#cargador recargable.##\n\nRetraso de recarga: #{skill_color}#2s##\nVelocidad de recarga: #{skill_color}#3/s## #{important_1}#(Reducido a la mitad al sobrecalentarse)##\nPenalización por sobrecalentamiento: #{important_1}#2s##",
				--Sub2000
				["bm_sub2000_sc_desc"] = "Pistola carabina plegable de dudosa calidad de fabricación. Las pequeñas balas golpean mucho más fuerte cuando salen de un cañón más largo y su capacidad de plegado permite una ocultación decente.\n\nSólo intenta que no te doblen como una tortilla.",
				--Deagle
				["bm_deagle_sc_desc"] = "¿Qué más hay que decir sobre esta varita mágica semiautomática? Simplemente agítala contra los malos y grita \"Headicus Explodicus!\"\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##", --Bob: Deberia adaptar el nombre del hechizo?
				["bm_x_deagle_sc_desc"] = "Destrozamuñecas gemelas que hay que estar loco para llevar a la batalla.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				--Kahn .357
				["bm_korth_r8"] = "#{skill_color}#Los disparos en la cabeza infligen un 100% más de daño a los enemigos que no son capitanes.##",
				--Matever 2006m
				["bm_2006m_sc_desc"] = "Un raro diseño de una ya rara serie de producción. Una manera elegante de lanzar .38 por el campo de tiro.\n\n#{skill_color}#Inflige el 50% de su daño a través de blindaje corporal y puede atravesar enemigos.##",
				["bm_x_2006m_sc_desc"] = "La complejidad de manejar dos de estos se ve contrarrestada por el factor brutalidad.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				--Frenchman Model 87
				["bm_model3_sc_desc"] = "Una respuesta clásica a la pregunta de toda la vida \"¿Qué voy a hacer con todos estos imbéciles en mi cara?\"\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				["bm_x_model3_sc_desc"] = "Saca a relucir las cualidades de vaquero que llevas dentro y desafía a la policía a un duelo a plena luz del día con estos revólveres gemelos.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				--Raging bull
				["bm_rage_sc_desc"] = "Cañón de corto alcance muy potente. Derriba a los enemigos rápidamente siempre que alinees los disparos.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar múltiples enemigos.##",
				["bm_x_rage_sc_desc"] = "No es nada buena ni práctica, no puedes evitar querer presumir ante la policía sacándolas durante un robo a un banco.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar múltiples enemigos.##",
				--Castigo
				["bm_chinchilla_sc_desc"] = "Potente, preciso y elegante. Útil para atravesar a los enemigos más resistentes en DC.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar múltiples enemigos.##",
				["bm_x_chinchilla_sc_desc"] = "Un sicario necesita asegurar su objetivo, dos de estos lo garantizarán.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar múltiples enemigos.##",
				--RUS-12
				["bm_rsh12_sc_desc"] = "La última palabra absoluta en enfrentamientos con calibre de una mano.\n\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##",
				--SAA/Peacemaker
				["bm_ap_weapon_peacemaker_sc_desc"] = "#{risk}#La mejor pistola jamás fabricada.##\n\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##\n\nPuede #{skill_color}#dispararse rápido para aumentar la cadencia de fuego## a costa de un #{important_1}#mayor retroceso, un menor alcance efectivo y la imposibilidad de apuntar con la mira.##",
				--CUSTOM PISTOLS
					--Zippy 
					["bm_zippy_sc_desc"] = "El arma definitiva, en defectos de eyección y fallas de disparo. Tendrás suerte si consigues disparar dos veces sin volarte los dedos.",
					--Auto-9
					["bm_wp_rc_auto9_cartoon"] = "SERIE ANIMADA TRACERS",
					["bm_wp_rc_auto9_cartoon_desc"] = "¡Festeja como si fuera 1988!",
					--M2019 Blaster
					["thatgun_desc"] = "¡Es la pistola!\n\n¡Ya sabes, esa pistola!\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar múltiples enemigos.##",
					--Malorian 3516
					["whydoyoucome"] = "La única de su clase, hecha especialmente para el rockero Johnny Silverhand.\n\n#{skill_color}#Puede atravesar múltiples enemigos y su armadura corporal.\nLas balas rebotan contra las superficies al disparar desde la cadera y atraviesan las paredes al apuntar.\nLos ataques con la culata del arma disparan una onda de fuego de corto alcance.##",
					--Colt Detective
					["bm_lemon_dmc_desc"] = "Imagínate con un revólver ocultable de gran potencia. No imagines más, porque el Investigator es exactamente eso.\n\n#{skill_color}#Inflige el doble de daño al atacar a los enemigos por la espalda.##",
			
			--[[ SMGs ]]
				--Kobus 90
				["bm_p90_sc_desc"] = "Un Subfusil bullpup y competidora del Subfusil SpecOps-7. A menudo se comenta que parece un arma espacial futurista.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
				["bm_wp_p90_body_p90_tan"] = "CULATA BRONCEADA",
				["bm_wp_90_body_boxy_desc"] = "Recuperado de los restos desolados de un antiguo almacén de OMNIA, este armazón no supone ninguna diferencia en el manejo del arma ni en su funcionalidad en absoluto, pero su estética de bloque sin duda lo convierte en algo agradable de tener.",
				--Spec Ops
				["bm_mp7_sc_desc"] = "Un Subfusil ligero y competidor del Subfusil Project-90. No tiene un lanzagranadas inferior como algunas fuentes pueden hacer creer.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
				--Heather
				["bm_sr2_sc_desc"] = "Utilizando un proyectil especializado de 9×21 mm, el Subfusil Heather es la respuesta Rusa a los Subfusiles Project-90 y SpecOps-7.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
				--Compact-5/MP5
				["bm_mp5_sc_desc"] = "La hermana pequeña del Gewehr-3.\nRápido, preciso y fácil de manejar, ¿qué más se puede pedir de un Subfusil?",
				--Pachett/Sterling
				["bm_wp_sterling_b_e11"] = "CAÑÓN BLASTECH E-11",
				["bm_wp_sterling_b_e11_desc_sc"] = "Tecnología supuestamente procedente de #{skill_color}#una galaxia muy, muy lejana## convierte esta arma para poder disparar #{risk}#rayos de plasma## y utilizar un #{skill_color}#cargador recargable.##\n\nRetraso de recarga: #{skill_color}#1.4s##\nVelocidad de recarga: #{skill_color}#6/s## #{important_1}#(Reducido a la mitad al sobrecalentarse)##\nPenalización por sobrecalentamiento: #{important_1}#2s##",
				--Uzi
				["bm_uzi_sc_desc"] = "Aunque dispara lentamente, la Uzi es un Subfusil fiable y fácil de controlar que puede dar un buen golpe, especialmente ahora que ha sido convertida al .41 AE.",
				--Chicago Typewriter
				["bm_thompson_sc_desc"] = "Con un cargador de tambor de gran capacidad, tú también podrás dar rienda suelta a la ira mafiosa mientras acribillas a tus enemigos.",
				--MP40
				["bm_erma_sc_desc"] = "Un Subfusil bastante fiable que fue ampliamente utilizado por los soldados de infantería durante la Segunda Guerra Mundial, solo no utilices el cargador como empuñadura.",
				--CUSTOM SMGs
					["bm_w_m7caseless"] = "SUBFUSIL MISRIAH ARMORY M7",
					["bm_w_m7caseless_supp"] = "SUBFUSIL MISRIAH ARMORY M7S",
					["bm_w_x_m7caseless"] = "SUBFUSILES DUALES M7",
					["bm_w_x_m7caseless_supp"] = "SUBFUSILES DUALES M7S",
					--AR57
					["bm_w_alpha57_prim_desc"] = "El FSS Hurricane sacrifica el alcance y la potencia de tiro a cambio de una mayor capacidad de munición y estabilidad mejorada.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
					--LWRC
					["bm_w_smg45_desc"] = "Un clon Americano del AMP-45.",
					--Typhoon
					["bm_w_crysis3_typhoon_desc"] = "\"Es la forma más pura de expresión, y ahora mismo #{important_1}#tengo mucho que decir##\"\n\nUtilizando la tecnología de #{risk}#carga superpuesta##, esta ametralladora de 10 cañones intercambia daño por escupir plomo a velocidades de vértigo.\n\nEl Disparo alternativo lanza una #{skill_color}#ráfaga## de 10 proyectiles.",
					--Fang 45
					["bm_w_fang45_desc"] = "#{skill_color}#La cadencia de fuego aumenta un 33% en los 5 primeros disparos tras cada recarga.##",
					--KSP 45
					["bm_w_ksp45_desc_sc"] = "Subfusil con ráfaga de 3 disparos. Daño elevado con alcance moderado. La dispersión del disparo en ráfaga es menos eficaz a larga distancia.",
					--LC10
					["bm_w_lc10_desc_sc"] = "Subfusil automático. Bien equilibrada, con excelente alcance de daño y buena precisión. Daño moderado con una impresionante velocidad de salida y una alta cadencia de fuego.",
			
			--[[ MGs ]]
				--Bootleg/HK416c
				["bm_w_tecci_desc_sc"] = "Un rifle de pistón con las mismas especificaciones que una ametralladora ligera que puede escupir plomo con precisión.",
				["bm_wp_tecci_s_minicontra_alt"] = "CULATA FIJA SG",
				--KSP/M249
				["bm_m249_sc_desc"] = "Recargar es un coñazo, pero lo más probable es que todo el mundo esté muerto antes de que necesites recargar.",
				--ChainSAW
				["bm_kacchainsaw_sc_desc"] = "Locura ambulante en una ametralladora.\n\n#{skill_color}#Tiene una mejor dispersión al disparar desde la cadera.##",
				["bm_wp_upg_i_kacchainsaw_adverse"] = "SISTEMA DE GAS ADVERSO", --Bob: Adverse es un nombre?
				--RPK
				["bm_rpk_sc_desc"] = "Una buena elección cuando quieres que tus balas den en el blanco y sean un poco más Eastern Bloc.", --Bob: Comprobar que es eastern block, parece que es una coalicion de estados comunistas
				["bm_wp_rpk_m_ban_sc"] = "CARGADOR POTASSIUM",
				["bm_wp_ak_m_drum"] = "CARGADOR DE TAMBOR",
				["bm_wp_upg_i_rpk74"] = "KIT AK 5.45",
				--Brenner 21/HK21
				["bm_hk21_sc_desc"] = "La hermana pequeña del Gewehr-3. Viene con una cadencia de fuego aumentada para una mayor capacidad de supresión.",
				--M60
				["bm_m60_sc_desc"] = "Apodada 'El Cerdo' por estar hambrienta de munición y ser increíblemente pesada. Espera que cualquiera en el campo de tiro se convierta en un ataúd cerrado.\n\n#{skill_color}#Tiene una mejor dispersión al disparar desde la cadera.##",
				--Ksp 58
				["bm_par_sc_desc"] = "Una ametralladora más pesada hermana de la KSP-90 que suele montarse en vehículos. Intercambia movilidad por una bala más grande.",
				--Versteckt-51/HK51B
				["bm_hk51b_sc_desc"] = "Conversión postventa de la Brenner-21, reduciendo esta Ametralladora a las dimensiones de la Compact-5 y aumentando su cadencia de fuego aún más que la de la Brenner.",
				["bm_wp_hk51b_magazine_belt_60"] = "CINTA DE 60 BALAS",
				["bm_wp_hk51b_magazine_belt_80"] = "CINTA DE 80 BALAS",
				--Buzzsaw/Mg42
				["bm_wolf_brigade_sc_desc"] = "\"No somos hombres disfrazados de meros perros.\nSomos #{important_1}#lobos## disfrazados de simples hombres.\"\n\n#{skill_color}#Tiene mejor dispersión y retroces al disparar desde la cadera.##",
				["bm_wp_mg42_b_vg38"] = "CAÑÓN BLASTECH DLT-19",
				["bm_wp_mg42_b_vg38_desc_sc"] = "Tecnología supuestamente procedente de #{skill_color}#una galaxia muy, muy lejana## convierte esta arma para poder disparar #{risk}#rayos de plasma## y utilizar un #{skill_color}#cargador recargable.##\n\nRetraso de recarga: #{skill_color}#3s##\nVelocidad de recarga: #{skill_color}#9/s## #{important_1}#(Reducido a la mitad al sobrecalentarse)##\nPenalización por sobrecalentamiento: #{important_1}#4s##",
				--M134
				["bm_m134_sc_desc"] = "\"Cada paso que das está pavimentado con los cadáveres de tus enemigos...\"\n\n#{risk}#Tiene un breve periodo de giro antes de disparar; apuntar mantiene el arma en giro.##", --Bob: Esto es una referencia?
				--Microgun
				["bm_shuno_sc_desc"] = "\"Este es tu camino. Cuando vengas, lo recorrerás solo.\"\n\n#{risk}#Tiene un breve periodo de giro antes de disparar; apuntar mantiene el arma en giro.##", --Bob: Esto es una referencia?
				--Custom MGs
					--Madsen MG
					["bm_wp_wpn_fps_lmg_madsen_mg_xmag"] = "CARGADOR DE 40 BALAS",
					--Stoner 63 (LMG)
					["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_01"] = "CINTA DE VELOCIDAD",
					["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_01"] = "ENVOLTURA DROPSHOT",
					["bm_wp_wpn_fps_lmg_stoner63a_handle_01"] = "CINTA DE CAMPO",
					["bm_wp_wpn_fps_lmg_stoner63a_handle_02"] = "EMPUÑADURA SASR JUNGLE",
					["bm_wp_wpn_fps_lmg_stoner63a_quickdraw_02"] = "ENVOLTURA SERPENT",
					["bm_wp_wpn_fps_lmg_stoner63a_mixhandle_02"] = "ENVOLTURA AIRBORNE ELASTIC",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_01"] = "100 RNDS",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_ext_02"] = "STANAG 125 RNDS",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_01"] = "CARGADOR RÁPIDO",
					["bm_wp_wpn_fps_lmg_stoner63a_magazine_fast_02"] = "CARGADOR RÁPIDO VANDAL",
					--TF2 Minigun
					["bm_wp_wpn_fps_lmg_sasha_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_iron_curtain_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_tomislav_body_desc"] = "#{skill_color}#Acelera el tiempo de giro en un 20%.##",
					["bm_wp_wpn_fps_lmg_natascha_body_desc"] = "#{skill_color}#Tambalea enemigos hasta 9,75 metros de distancia.##\n#{risk}#(El alcance del tambaleo no puede modificarse)##\n#{important_1}#Ralentiza el tiempo de giro en un 30%.##",
					["bm_wp_wpn_fps_lmg_gatling_gun_body_desc"] = "#{important_1}#Ralentiza el tiempo de giro en un 50%.##",
					["bm_wp_wpn_fps_lmg_canton_body_desc"] = "#{skill_color}#80% de probabilidad de incendiar enemigos, infligiendo## #{heat_warm_color}#60## #{skill_color}#de daño por 4 segundos.##\n#{risk}#La probabilidad se reduce con la distancia y sólo aturde a los enemigos antes de que empiece la caída de daño.\nInflige daño de fuego en lugar de daño de bala.##",
			
			--[[ SHOTGUNS ]]
				--Saiga
				["bm_saiga_sc_desc"] = "Esta escopeta totalmente automática es perfecta para esos días en los que no te apetece apuntar.",
				["bm_wp_saiga_m_20rnd"] = "CARGADOR DE TAMBOR",
				--AA12
				["bm_aa12_sc_desc"] = "Escopeta automática con cargador de caja. Ideal para dejar impresiones duraderas",
				--Spas12
				["bm_spas12_sc_desc"] = "Una alternativa más pesada y complicada que otras escopetas semiautomáticas, presenta un modo de disparo alternativo casi alienígena.",
				--Benelli
				["bm_benelli_sc_desc"] = "Escopeta táctica de alta gama. Perfecta para despejar salas abarrotadas.",
				--Argos III
				["bm_ultima_sc_desc"] = "Nada dice moderno como el plástico y el aluminio, incluso viene con una ranura USB para cargar el teléfono.\n\nRecarga #{skill_color}#2## cartuchos a la vez.",
				--Supernova
				["bm_supernova_sc_desc"] = "Una escopeta modificada para poder alternar entre bombeo y semiautomática.",
				--Loco
				["bm_serbu_sc_desc"] = "Versión posventa de la Reinfeld 880 que ha sido recortada en tamaño; para aquellos que desean ocultabilidad y ganas de destrozarse la muñeca.",
				--Reinfeld 88
				["bm_menu_sc_m1897_desc"] = "Esta emblemática pieza histórica lo ha visto todo, desde fangosas trincheras hasta espesas selvas de islas del Pacífico, y tiene la desagradable reputación de ser un eficaz provocador de incendios.",
				--Mosconi 12g
				["bm_menu_sc_m590_desc"] = "Una versión mejorada de un viejo clásico. Una buena elección para LEOs, soldados, civiles particulares y ladrones de bancos por igual.",
				--R870
				["bm_menu_sc_r870_desc"] = "El largo brazo de la ley y la libertad. Ahora la libertad tiene una escopeta y cartuchos con tu nombre.",
				--KSG
				["bm_menu_sc_ksg_desc"] = "¡Todo es de plástico en el futuro! Escopeta Bullpup con artesanía cuestionable, una especialidad de LWI.",
				--Breaker 10g
				["bm_menu_sc_boot_desc"] = "Una escopeta antigua con un potente cartucho de 10g y un factor de brutalidad aún mayor. Ven conmigo si quieres vivir.",
				--Mosconi
				["bm_menu_sc_huntsman_desc"] = "Doble cañón, doble diversión. Aunque limitado en cuanto al tamaño del cargador, #{skill_color}#dos gatillos## te permiten desatar un ragnarok de perdigones sobre cualquier desgraciado hijo de puta que se encuentre en la misma habitación que tú.",
				--Judge
				["bm_x_judge_sc_desc"] = "Juez y Jurado, y con dos de estos limpiadores de habitaciones portátiles, tú eres el verdugo.", --Bob: Deberia adaptar los nombres o dejar el original
				--Joceline
				["bm_b682_sc_desc"] = "Una competición típicamente reservada a los eventos deportivos, sólo que en lugar de palomas de arcilla la utilizarás para reventar cascos.",
				--Custom Shotguns
					--Reinbeck M1
					["bm_w_beck_desc"] = "La escopeta más popular del mundo criminal ha regresado de su tumba para reclamar el lugar que le corresponde en la jerarquía de las escopetas. Utilizada originalmente en el Crimewave de 2011, esta escopeta ha demostrado ser extremadamente fiable en casi cualquier situación a corta distancia.",
					--Doomstic
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "Tipo de perdigones efectivos a corta distancia.\n#{skill_color}#Aumenta el número de perdigones a 10.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "Tipo de perdigones efectivos a media distancia.\n#{important_1}#Reduce el número de perdigones a 6.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "Potente proyectil de acero efectivo a larga distancia.\nCapaz de #{skill_color}#atravesar armadura corporal, enemigos, escudos, escudos titán y paredes.##",
					--REBECCA CYBERPUNK
					["bm_w_rebecca_desc"] = "Causará estragos sangrientos, aunque puede ser un poco impredecible.\n#{risk}#Al disparar, sufres un retroceso y dejas de apuntar temporalmente.##",
					--Widowmaker TX
					["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "CARGADOR EXTENDIDO",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "SISTEMA DE DISPARO EN RÁFAGA",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst_desc"] = "Agrega un ##{skill_color}#disparo en ráfaga de 2 rondas##.",
			
			--[[ ARs ]]
				--S552		
				["bm_s552_sc_desc"] = "Una elegante alternativa a otros rifles compactos de 5,56 mm, la elección preferida entre los DHS. Utiliza cartuchos especiales de 5,6 mm fabricados en Suiza que ofrecen un mejor alcance.",
				--M733/AMCAR
				["bm_amcar_sc_desc"] = "El rifle .223 más producido en masa que el mundo haya visto jamás. Un gran rifle multiusos.",
				["bm_wp_upg_i_patriot"] = "EL PATRIOTA",
				["bm_wp_upg_i_patriot_desc"] = "Una pistola de asalto desarrollada para #{important_1}#[REDACTED]##.\n\nEl mecanismo de alimentación dentro del cargador de tambor forma un #{important_1}#[REDACTED]##.",
				["bm_wp_upg_i_og_rof"] = "LIMITADOR DE VELOCIDAD",
				["bm_wp_upg_i_og_rof_desc"] = "Restaura la absurdamente baja cadencia de fuego del arma, si eso es lo que te interesa...",
				--G36
				["bm_g36_sc_desc"] = "Otro de los mejores aspirantes al premio al 'mejor rifle de plástico'.",
				["bm_wp_upg_i_m8a1"] = "KIT DE RÁFAGA M8",
				["bm_wp_upg_i_m8a1_desc"] = "Bloquea el modo de disparo a una #{risk}#ráfaga de 4 disparos## y otorga una cadencia de fuego aumentada y munición adicional al cargador.",
				--VHS/Lion's Roar
				["bm_vhs_sc_desc"] = "Un arma difícil de manejar que ofrece un rendimiento impresionante en manos de los más capaces.\n\nSe dice que lleva el espíritu de la furia de Dragan en combate.",
				["bm_wp_upg_i_swordfish"] = "KIT DE RÁFAGA SWORDFISH",
				["bm_wp_upg_i_swordfish_desc"] = "Bloquea el modo de disparo a una #{risk}#ráfaga de 5 disparos## y otorga una cadencia de fuego aumentada y munición adicional al cargador.",
				--Olympic/Para
				["bm_menu_sc_olympic_desc"] = "Una pistola exageradamente grande que dispara una bala de rifle de forma totalmente automática. Esta pistola es una crisis existencial que dispara balas.",
				--TAR-21/Para
				["bm_menu_sc_komodo_desc"] = "Mucho daño en un paquete muy compacto. Ideal para encuentros CQB o a distancia.",
				--Famas
				["bm_menu_sc_famas_desc"] = "Esta arma cambia la capacidad del cargador por cadencia y precisión. Una herramienta muy eficaz para disparar manzanas en la cabeza de la gente.",
				--M4/CAR-4
				["bm_m4_sc_desc"] = "Confiable, compacto y letal. Con una cadencia de fuego más controlable que el AM-CAR, el CAR-4 es un rifle de 5.56mm muy popular entre los ejércitos modernos.",
				["bm_wp_upg_fg_m4a1"] = "KIT EME-CUATRO",
				["bm_wp_upg_fg_m4a1_desc"] = "Este set exclusivo cambia las miras postventa por una configuración más tradicional. #{risk}#Anula la apariencia de tu guardamanos.##",
				["bm_wp_upg_s_fixed"] = "CULATA FIJA CAR",
				["bm_wp_m4_m_drum"] = "CARGADOR DE TAMBOR",
				--AK5
				["bm_ak5_sc_desc"] = "Un buen rifle multiusos famoso por los atracos a bancos y por confundir a los desinformados en cuanto a las dimensiones de sus balas.",
				["fnc_burst_desc"] = "Agrega un modo de ráfaga de 3 disparos.",
				--Union 5.56
				["bm_corgi_sc_desc"] = "A pesar de su reputación, este bullpup no es en absoluto apto para el mar.",
				--UAR
				["bm_aug_sc_desc"] = "Rifle bullpup clásico. Muy versátil para matar a los malos.",
				--AK17
				["bm_flint_sc_desc"] = "La interpretación moderna de la clásica AK. Dispone de una potente #{skill_color}#ráfaga de 2 disparos## y tiene toda una crisis de identidad.",
				--AK 5.45
				["bm_ak74_sc_desc"] = "A pesar de disparar una bala más pequeña que su hermana del 7.62, este rifle no es en absoluto menos letal.",
				--CR 805
				["bm_menu_sc_hajk_desc"] = "Un primo más joven y moderno que la clásica manguera de balas Cobra. Esta cuenta con varios modos de disparo e incluso conversiones de varias balas... aunque no es que las vayas a recibir.",
				--AMR-16
				["bm_m16_sc_desc"] = "Este rifle clásico es el predecesor del AM-CAR. Lo que le falta en ocultabilidad y cadencia de tiro lo compensa en alcance y potencia",
				--Queen's Wrath
				["bm_l85a2_sc_desc"] = "Aunque su reputación se ha visto empañada por versiones anteriores, este rifle es uno de los automáticos más precisos jamás fabricados.\nAunque sigue siendo una pesadilla ergonómica.",
				--AK 7.62
				["bm_akm_sc_desc"] = "Este rifle será muy útil cuando los chalecos antibalas empiecen a popularizarse en DC.\n\nEl preferido de los insurgentes y los regímenes locos de todo el mundo.",
				["bm_akm_gold_sc_desc"] = "¿Qué tienen en común un criminal, un narcotraficante mexicano y un dictador megalómano? Una fascinación por los rifles bañados en oro, por supuesto.",
				--KETCHUPKNOB--
				--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
				["bm_groza_sc_desc_pc"] = "La hermana bullpup de la familia AK, equipada para aquellos que quieren un poco más de explosión.\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
				["bm_groza_sc_desc"] = "La hermana bullpup de la familia AK, equipada para aquellos que quieren un poco más de explosión.\n\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
				--Krinkov
				["bm_akmsu_sc_desc"] = "Un pequeño rifle útil para abatir a hombres grandes. No hay que subestimarlo, ya que este rifle puede hacer frente a cualquier situación.",
				--Akimbo Krinkov
				["bm_x_akmsu_sc_desc"] = "Un pequeño rifle útil para abatir a hombres grandes. No hay que subestimarlo, ya que este rifle puede hacer frente a cualquier situación.",
				--CUSTOM ARs
					--QBZ-191
					["bm_qbz191_sc_desc"] = "Rifle de asalto chino de nueva generación con recámara de 5.8x42mm.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",
					--AN-94/92
					["bm_tilt_sc_desc"] = "#{risk}#Las 2 primeras rondas de cada tirón del gatillo## se disparan a #{skill_color}#3x la cadencia de fuego.##",
					--NV4
					["bm_nova4_sc_desc"] = "Fusil balístico completamente automático. Una cadencia de fuego moderada proporciona una mayor estabilidad y la mejor precisión de su clase. Ideal para enfrentamientos a media y larga distancia",
					["bm_wp_wpn_fps_ass_nova4_flatline_desc"] = "Otorga las siguientes ventajas:\n#{heat_warm_color}#Precisión:##\n#{skill_color}#Sin caída de daño## con cadencia #{important_1}#reducida##.\n#{item_stage_2}#Concentración:##\nPrecisión #{skill_color}#aumentada##.",
					["bm_wp_wpn_fps_ass_nova4_chaos_desc"] = "Otorga las siguientes ventajas:\n#{heat_warm_color}#Celeridad:##\n#{skill_color}#Aumenta## la cadencia al disparar desde la cadera pero #{important_1}#reduce## la cadencia al apuntar.\n#{item_stage_2}#Firme:##\n#{skill_color}#Reduce## la dispersión al disparar desde la cadera.",
					--MW22 Honey Badger
					["bm_w_mcbravo_desc"] = "Con un #{skill_color}#supresor integrado## y balas #{risk}#.300 BLK## subsónicas, lentas y de alta energía, el Chimera es experto en el combate cuerpo a cuerpo.",
					--BOCW CARV2
					["bm_w_t9fastburst"] = "CARV.2",
					["bm_wp_upg_i_g11"] = "INTERNOS K1",
					["bm_wp_upg_i_g11_desc"] = "Aumenta la cadencia de fuego de la ráfaga a #{skill_color}#2100 RPM## y #{skill_color}#desbloquea el selector de disparo.##",
					--MW2023 STG-44 (FUCK YOU, SLEDGEHAMMER)
					["bm_w_stango44"] = "\"STG-44\"",
					["bm_wp_wpn_fps_ass_stango44_magazine_40"] = "CARGADOR 30 RNDS",
					--HD2 AR-23
					["bm_w_ar23_penetrator"] = "AR-23P LIBERATOR PENETRANTE",
					["bm_wp_ck_penetrator_desc"] = "Una variante del AR-23 diseñada para #{skill_color}#penetrar blindaje.##",
					["bm_w_ar23_concussive"] = "AR-23C LIBERATOR CONTUNDENTE",
					["bm_wp_ck_concussive_desc"] = "Una variante del AR-23 con #{skill_color}#balas contundentes## y una mira de punto rojo modificada.\n#{skill_color}#Las balas contundentes tambalean a los enemigos hasta 20 metros de distancia.##\n#{risk}#El alcance del tambaleo no se puede modificar y se elimina el disparo en ráfaga.##",
			
			--[[ DMRs ]]
				--Little Friend
				["bm_m203_weapon_sc_desc_pc"] = "La hermana mayor del \"Little Friend\" AMR-16 personal de Scarface.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
				["bm_m203_weapon_sc_desc"] = "La hermana mayor del \"Little Friend\" AMR-16 personal de Scarface.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
					--VMP
					["bm_m203_vmp_sc_desc_pc"] = "Una réplica del \"Little Friend\" AMR-16 personal de Scarface.\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
					["bm_m203_vmp_sc_desc"] = "Una réplica del \"Little Friend\" AMR-16 personal de Scarface.\n\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
					["bm_mesa_vmp_sc_desc_pc"] = "Interesante producto procedente de un envío robado de OMNIA.\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
					["bm_mesa_vmp_sc_desc"] = "Interesante producto procedente de un envío robado de OMNIA.\n\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
				--FAL
				["bm_fal_sc_desc"] = "El brazo derecho del mundo libre. Cuando tengas que abatir a enemigos con armadura pesada, esta es el arma a la que debes recurrir.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",	
				["bm_fal_ap25_sc_desc"] = "El brazo derecho del mundo libre. Cuando tengas que abatir a enemigos con armadura pesada, esta es el arma a la que debes recurrir.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal.##",
				--ASS VAL
				["bm_asval_sc_desc"] = "Las pequeñas balas de rifle pueden ser suficientes para un pistolero corriente, pero otros pueden optar por esta arma.\n\nViene #{skill_color}#integralmente suprimida## e #{skill_color}#inflige 25% de su daño a través de armadura corporal.##",
				--Galil
				["bm_galil_sc_desc"] = "Una imitación de un rifle basado en un diseño finlandés, que a su vez también era un derivado del AK clásico. La imitación es la forma más sincera de adulación.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",
				["bm_galil_ap25_sc_desc"] = "Una imitación de un rifle basado en un diseño finlandés, que a su vez también era un derivado del AK clásico. La imitación es la forma más sincera de adulación.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal.##",
				["bm_galil_556_sc_desc"] = "Una imitación de un rifle basado en un diseño finlandés, que a su vez también era un derivado del AK clásico. La imitación es la forma más sincera de adulación.",
				--SCAR		
				["bm_scar_sc_desc"] = "El rifle de combate del futuro. Con un buen equilibrio entre manejo y daño balístico, se ha hecho popular entre el USMC y las fuerzas especiales.\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",
				["bm_scar_ap25_sc_desc"] = "El rifle de combate del futuro. Con un buen equilibrio entre manejo y daño balístico, se ha hecho popular entre el USMC y las fuerzas especiales.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal.##",
				["bm_scarl_sc_desc"] = "El rifle de infantería del futuro... o no. Aunque popular en el mercado civil, las fuerzas militares encontraron poca necesidad de otro rifle 5.56.",
				["bm_scarhamr_sc_desc"] = "El rifle de infantería del futuro... o no.",

				--Galant
				["bm_galant_sc_desc"] = "Un rifle de combate clásico de la Segunda Guerra Mundial. Confiable, preciso y rápido de recargar cuando se vacía.\n\nInflige 75% de su daño a través de armadura corporal y puede atravesar a multiples enemigos y paredes delgadas.##",
				--M308
				["bm_m14_sc_desc"] = "Rápido y preciso, sólo asegúrate de mantener el retroceso bajo control, especialmente en automático.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				--G3
				["bm_g3_sc_desc"] = "Hermana mayor del Compact-5 y del Brenner-21, su precisión rivaliza con la de los francotiradores.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",	
				["bm_g3_ap25_sc_desc"] = "Hermana mayor del Compact-5 y del Brenner-21, su precisión rivaliza con la de los francotiradores.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal y puede atravesar enemigos.##",
				["bm_g3_sg1_sc_desc"] = "Hermana mayor del Compact-5 y del Brenner-21, su precisión rivaliza con la de los francotiradores.\n\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
				["bm_wp_g3_m_psg"] = "CARGADOR PRÄZISION",
				["bm_wp_upg_i_g3sg1"] = "INTERNOS PRÄZISION",
				["bm_wp_upg_i_g3sg1_desc"] = "Carga proyectiles de alta potencia que #{skill_color}#penetran toda la armadura corporal y perforan escudos.## Las piezas están reforzadas con materiales más pesados que #{important_1}#reducen la cadencia de fuego## y bloquean tu arma en #{risk}#semiautomático##.",
				--KS12
				["bm_shak12_sc_desc"] = "Un rifle de combate con diseño bullpup y un potente cartucho de 12.7x55 mm. Carnicería suprema en un paquete muy compacto.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",	
				["bm_shak12_sc_oden_desc"] = "Un rifle de combate con diseño bullpup y un potente cartucho de 12.7x55 mm. Carnicería suprema en un paquete muy compacto.\n\n#{skill_color}#Puede atravesar armadura corporal, enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
				["bm_wp_shak12_body_vks"] = "CULATA \"VISHA\"",
				["bm_wp_shak12_body_vks_ap_desc"] = "Carga proyectiles de alta potencia que #{skill_color}#penetran toda la armadura corporal y perforan escudos.## La culata y el cerrojo están reforzados con materiales más pesados que #{important_1}#reducen la cadencia de fuego.##",
				--HCAR
				["bm_hcar_sc_desc"] = "Una versión moderna de una ametralladora clásica de la Segunda Guerra Mundial.",
				--Custom DMRs
					--BOCW EM2
					["bm_w_t9british"] = "EM2",
					["bm_wp_wpn_fps_ass_t9british_xmag_01"] = "30 RNDS",
					["bm_wp_wpn_fps_ass_t9british_xmag_01_desc"] = "",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_01"] = "CARGADOR DE VELOCIDAD 25 RNDS",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_01_desc"] = "",
					["bm_wp_wpn_fps_ass_t9british_xmag_02"] = "CARGADOR STANAG 40 RNDS",
					["bm_wp_wpn_fps_ass_t9british_magazine_mix_02"] = "CARGADOR DE VELOCIDAD SALVO 30 RNDS",
					--MCX Spear
					["bm_mcx_spear_sc_desc"] = "#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
					["bm_ngsierra_sc_desc"] = "Utiliza un sistema único de mitigación del retroceso para controlar su cartucho de plástico TCVM de 6.8x5mm.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal y puede atravesar enemigos.##",
					--["bm_w_xeno"] = "MA14 Surge Rifle",	
					["bm_xeno_sc_desc_pc"] = "De \"Armat\" llega esta extraña pieza de tecnología de la era espacial. Viene equipado con un #{skill_color}#lanzagranadas integrado.##\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.",
					["bm_xeno_sc_desc"] = "De \"Armat\" llega esta extraña pieza de tecnología de la era espacial. Viene equipado con un #{skill_color}#lanzagranadas integrado.##\n\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.",
					--VSS
					["bm_vss_sc_desc"] = "Una variante del Valkyria configurada para tener mejor alcance y precisión.\n\nViene #{skill_color}#integralmente suprimida## e #{skill_color}#inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
					--G3 HK79
					["bm_g3hk79_sc_desc_pc"] = "Una variante del Gewehr-3 que viene equipada con un #{skill_color}#lanzagranadas bajo el cañón## ye #{skill_color}#inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.",
					--BO3 XR2
					["bm_xr2_sc_desc"] = "El XR-2 es un rifle versátil diseñado para los escenarios de combate más dinámicos y cuenta con una exclusiva #{risk}#ráfaga automática de 3 disparos## que proporciona una #{skill_color}#mayor cadencia de fuego en el modo de ráfaga.##\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal.##",
					["bm_wp_xr2_handle_01_sc"] = "CERROJO AUTOMÁTICO",
					["bm_xr2_handle_01_sc_desc"] = "Intercambia la ráfaga automática por un #{skill_color}#disparo automático## a costa de #{important_1}no aumentar la cadencia de fuego de la ráfaga.##",
					["bm_wp_xr2_handle_02_sc"] = "CERROJO DE DISPARO RÁPIDO",
					["bm_xr2_handle_02_sc_desc"] = "Aumenta la cadencia de fuego de la ráfaga a #{skill_color}#950 RPM## a costa de una #{important_1}#menor mitigación del retroceso durante la ráfaga.\n\nEl retardo de ráfaga y la cadencia de fuego semiautomática no se ven afectados.##",
					--SIERRA .458
					["bm_w_sierra458_sc_desc"] = "Chains, el armero de la banda, comenzó a desarrollar una alternativa al rifle Tecci Tactical, de gran potencia pero alta cadencia de fuego.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos.##",
					["bm_w_sierra458_beo_desc"] = "Chains, el armero de la banda, comenzó a desarrollar una alternativa al rifle Tecci Tactical, de gran potencia pero alta cadencia de fuego.\n\n#{skill_color}#Puede atravesar armadura corporal, enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
					["bm_wp_wpn_fps_snp_sierra458_m_bush_desc"] = "Cambia los cartuchos .458 SOCOM por cartuchos #{stats_positive}#.450 Bushmaster envenenados## que #{stats_positive}#infligen 30 puntos de daño por segundo durante 4 segundos y pueden aturdir a los enemigos.##\n\n#{important_1}#Ya no puede atravesar a múltiples enemigos.##",
					["bm_w_sierra458_ivy_desc"] = "Chains, el armero de la banda, comenzó a desarrollar una alternativa al rifle Tecci Tactical, de gran potencia pero alta cadencia de fuego.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal, puede atravesar paredes delgadas## e #{stats_positive}#inflige daño con el tiempo con balas envenenadas.##",
					["bm_w_bulldog_desc"] = "Algún tipo de felicidad se mide eliminando enemigos con el Bulldog.\n\n#{risk}#Esta arma dispara en modo automático cuando se dispara desde la cadera y en ráfagas cuando se dispara apuntando con la mira.##",
			
			--[[ SNIPERS ]]
				--MSR
				["bm_msr_sc_desc"] = "La preferencia de los militares de Estados Unidos como rifle de francotirador. Su buena precisión, manejo e incluso ocultabilidad lo convierten en un buen rifle de francotirador multiusos.\n\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##",	
				--R700
				["bm_r700_sc_desc"] = "El predecesor del Rattlesnake. Buena precisión y manejo, incluso tiene mejor alcance que su hermano menor. ¿El inconveniente? Cargadores de mierda de 5 rondas.\n\n#{skill_color}#Puede atravesar armadura corporal, multiples enemigos, Escudos y paredes delgadas.##",
				--QBU88
				["bm_qbu88_sc_desc"] = "Plataforma de Francotirador Bullpup inspirada en el Bloque del Este. Como muchos, bueno para imponer tu voluntad sobre otros.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##", --Bob: Comprobar si Platform Bullpup Sniper esta bien adaptado
				--Winchester 1874
				["bm_winchester1874_sc_desc"] = "El arma que conquistó el Oeste. Sagrada reliquia de las armas de fuego, pero no por ello menos mortífera con su potente munición del .44-40.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##\n\nPuede #{skill_color}#dispararse rápidamente para aumentar la cadencia de fuego## a costa de un #{important_1}#mayor retroceso y una reducción del alcance efectivo.##",
				--TTI(TTY)
				["bm_tti_sc_desc"] = "Una de las armas de fuego personales de Wick. Se dice que hay imágenes de él practicando 3-Gun con este rifle en algún lugar en Internet.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
				--Icky Vicky
				--["bm_victor_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				--Scunt
				--["bm_scout_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				["bm_wp_scout_m_extended"] = "CARGADOR DE VELOCIDAD STANDOFF",
				--AWP
				["bm_awp_sc_desc"] = "Un francotirador conocido por su excepcional alcance y precisión. ¿Quién hubiera pensado que los modelos originales fueron construidos por tres tipos en un cobertizo?\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##",
				["bm_awp_cs_dragon"] = "AWP | DRAGON LORE",
				["bm_awp_cs"] = "AWP",
				["bm_wp_upg_bazooka"] = "SET EXCLUSIVO DRAGON LORE-LESS",
				["bm_wp_upg_bazooka_desc"] = "De alto riesgo y alta recompensa, este infame rifle es reconocible por su característico reporte y su filosofía de un disparo, una baja.\n\n#{skill_color}#Los disparos en la cabeza infligen un 50% más de daño a los enemigos que no son capitanes.##\n#{skill_color}#Permite atravesar Escudos Titán.##\n\n#{risk}#Disparar te deja temporalmente sin poder apuntar.##",
				["bm_bazooka_sc_desc"] = "De alto riesgo y alta recompensa, este infame rifle es reconocible por su característico reporte y su filosofía de un disparo, una baja.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##\n\n#{risk}#Disparar te deja temporalmente sin poder apuntar.##",
				--WA2000
				["bm_wa2000_sc_desc"] = "Sólo se fabricaron unos pocos centenares de estos prestigiosos rifles; un francotirador digno de un asesino a sueldo de alto nivel.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
				--Rangerhitter
				["bm_sbl_sc_desc"] = "Un arma de acción de palanca del siglo XX que ofrece una mayor carga de plomo en comparación con la del siglo XIX. Con el .45-70 de tu lado, puedes esperar más potencia y más cerdos muertos.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##\n\nPuede #{skill_color}#dispararse rápidamente para aumentar la cadencia de fuego## a costa de un #{important_1}#mayor retroceso y una reducción del alcance efectivo.##",
				--Contender G2
				["bm_contender_sc_desc"] = "",
				--Model 70
				["bm_model70_sc_desc"] = "El rifle de un tirador. Un primer diseño de cerrojo realizado por los mismos diseñadores del Repeater 1874.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##",
				--SVD
				["bm_siltstone_sc_desc"] = "Rifle de francotirador semiautomático de alta potencia perteneciente a la familia de los AK. Como la mayoría del armamento del bloque oriental, su reputación está bien ganada.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
				--Mosin--
				["bm_mosin_sc_desc"] = "Cuando la comida es un lujo pero sigues necesitando un arma, llega este rifle de cerrojo clásico y barato.\n\nEsta arma se recarga con clips de 5 balas a la vez y #{skill_color}#puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##",
				["bm_wp_upg_a_tranq_mosin"] = "RONDAS TRANQUILIZANTES",
				["bm_wp_upg_a_tranq_mosin_desc"] = "Por el verdadero olvido, #{item_stage_2}#El Fin.##\n\nDispara balas #{stats_positive}#tranquilizantes## que #{skill_color}#infligen 30 de daño/seg. durante 6 segundos y pueden aturdir enemigos.##\n\n#{important_1}#Ya no puede atravesar enemigos.##",
				["bm_mosin_tranq_desc"] = "Cuando la comida es un lujo pero sigues necesitando un arma, llega este rifle de cerrojo clásico y barato.\n\nEsta arma se recarga con clips de 5 balas a la vez,\n\n#{stats_positive}#inflige daño con el tiempo con balas tranquilizantes## y #{skill_color}#puede atravesar armadura corporal, Escudos y paredes delgadas.##",
				--Desert Fox
				["bm_desertfox_sc_desc"] = "Una plataforma de francotirador bullpup compacta, utilizada por Wick durante su asalto a un refugio de la mafia rusa.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##", --Bob: Comprobar si plataforma esta bien traducido
				--R93
				["bm_r93_sc_desc"] = "Rifle de francotirador alemán con una gran bala pensada para detener a hombres grandes. El francotirador preferido por la policía y las fuerzas paramilitares antiterroristas de todo el mundo.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, Escudos y paredes delgadas.##",		
				--Flintlock--
				["bm_bessy_sc_desc"] = "Siendo necesaria una Milicia bien regulada para la seguridad de un Estado libre, el derecho del pueblo a poseer y portar Armas no debe ser infringido.\n\n#{skill_color}#Inflige un 100% más de daño a enemigos especiales y de élite.\nPuede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
				--Thanatos--
				["bm_m95_sc_desc"] = "Rifle antimaterial utilizado para combatir vehículos pequeños. Usarlo contra objetivos orgánicos es probablemente un crimen de guerra.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
				--Custom Snipers
					--M107
					["bm_m107cq_sc_desc"] = "Si el Thanatos no estaba a la altura, el Mors proporcionará lo que deseas en forma de una fina niebla roja.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
					--M200
					["bm_m200_sc_desc"] = "Para aquellos que quieran realizar unos magníficos tiros de 360 no-scope ladder-stall.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
					--S7
					["bm_w_srs99_s7_desc"] = "Veo disparos en la cabeza en tu futuro, Spartan.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",
					["bm_w_srs99_s7_flexfire_desc"] = "Veo disparos en la cabeza en tu futuro, Spartan.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos y paredes delgadas.##",
					["flexfire_desc"] = "#{important_1}#Mira reducida a un aumento fijo de 3x.\nYa no puede atravesar escudos titán.##",
					["oracle_scope"] = "MIRA TELESCÓPICA ORACLE TECHLINK",
					["oracle_scope_desc"] = "Permite cambiar la retícula de la mira telescópica #{skill_color}#Smart-Link## predeterminada.\n#{risk}#5-10x aumentos.##",
					--SVD
					["bm_wp_wpn_fps_snp_svd_pso"] = "MIRA TELESCÓPICA SV7",
					--Highly Modified CAR-4
					["bm_hmcar_sc_desc"] = "Antes de ser retirados por las fuerzas policiales, te las arreglaste para hacerte con un maletín lleno de estos kits de conversión.\n\nDispara balas de #{stat_maxed}#francotirador titán## capaces de #{skill_color}#atravesar múltiples enemigos, armadura corporal, escudos en el rango de daño máximo y paredes delgadas;## El disparo alternativo dispara una bala de #{event_color}#francotirador a máxima potencia## por el doble de munición y potencia que también añade la capacidad de #{skill_color}#atravesar escudos titán.##",
					["bm_wp_hmcar_hd_kit"] = "KIT 32BIT 8K HD",
					["bm_wp_hmcar_hd_kit_desc"] = "Application has crashed: C++ exception\nCould not load texture because IDirect3D9::CreateTexture call failed.\nDirect3D could not allocate sufficient memory to complete the call.\n\n\n\n\n\n\n ", --Bob: Deberia adaptar esto?		
			
			--[[ SPECIALS ]]
				--Saw
				["bm_ap_saw_sc_desc"] = "#{skill_color}#Corta a través de armadura corporal.##",
				["bm_ap_saw_blade_sc_desc"] = "Afila la hoja lo suficiente como para #{skill_color}#atravesar armadura corporal.##",
				["bm_fast_motor_sc_desc"] = "Aumenta las rotaciones por minuto en un 15%.",
				["bm_slow_motor_sc_desc"] = "Disminuye las rotaciones por minuto en un 15%.",
				--Light Crossbow		
				["bm_w_frankish_avelyn"] = "AVELYN",
				["bm_wp_avelyn"] = "KIT AVELYN",
				["bm_wp_avelyn_desc"] = "Un kit de #{skill_color}#ballesta de repetición##.\nPermite disparar una ráfaga de #{skill_color}#3## virotes con un solo tirón del gatillo.",
				["bm_wp_avelyn_override_desc"] = "Una ballesta de disparo rápido extremadamente rara.\nDispara #{skill_color}#tres## virotes sucesivos mediante un elaborado mecanismo.\n\n#{skill_color}#Puede atravesar armadura corporal.##",
				--GL40		
				["bm_w_gre_m79_sc_desc"] = "Un golpe y un boom.\n\nPresiona #{skill_color}#$BTN_GADGET## para alternar la mira; con punto cero a #{skill_color}#30## metros.",
				--3GL
				["bm_ms3gl_sc_desc"] = "Dispara proyectiles personalizados de 40mm superpuestos en una sola recámara. Utiliza fulminantes eléctricos para disparar, lo que permite un seguimiento rápido en un paquete compacto.\n\nEl disparo alternativo #{skill_color}#dispara una ráfaga de 3 granadas.##",
				--PIGLET/M32
				["bm_m32_sc_desc"] = "Conviértete en una \"#{risk}#Máquina De Guerra##\" y demuestra a tus enemigos que ningún tipo de amor les protegerá de este lanzagranadas giratorio de 6 disparos.",
				--China Puff
				["bm_w_china_sc_desc"] = "\"¡Éste es realmente un barrio horrible!\"\n\nPresiona #{skill_color}#$BTN_GADGET## para alternar la mira; con punto cero a #{skill_color}#30## metros.", --Bob: Esto es una referencia?
				--COMMANDO 101/M202 FLASH
				["bm_ray_sc_desc"] = "Conviértete en la \"#{risk}#Parca##\" con este lanzacohetes #{heat_warm_color}#incendiario## de 4 disparos.\n\nLos cohetes dejan un #{heat_warm_color}#charco de fuego## y el daño explosivo infligido por esta arma #{skill_color}#destruye instantáneamente torretas.##",
				
				
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
					["bm_w_maxim9"] = "MAGNUS 9",
					["bm_w_x_maxim9"] = "MAGNUS 9 DUALES",
					--Igor (APS)
					["bm_w_stech"] = "IGOR AUTOMATIK",
					["bm_w_x_stech"] = "IGOR AUTOMATIK DUALES",
					--Chimano Compact
					["bm_wp_pis_g26"] = "CHIMANO 26 COMPACT",
					["bm_w_jowi"] = "CHIMANO 26 COMPACT DUALES",
					--Glock 18c
					["bm_w_glock_18c"] = "CHIMANO 18C",
					["bm_w_x_g18c"] = "CHIMANO 18C DUALES",
					--CZ 75
					["bm_w_czech"] = "CR 92",
					["bm_w_x_czech"] = "CR 92 DUALES",
					--PPK (Gruber)
					["bm_w_ppk"] = "GRUBER KURZ",
					["bm_w_x_ppk"] = "GRUBER KURZ DUALES",
					--M13
					["bm_w_legacy"] = "M13",
					["bm_w_x_legacy"] = "M13 DUALES",	
					--Glock 17
					["bm_w_glock_17"] = "CHIMANO 88",
					["bm_w_x_g17"] = "CHIMANO 88 DUALES",
					--Bernetti 9
					["bm_w_b92fs"] = "BERNETTI 92",
					["bm_w_x_b92fs"] = "BERNETTI 92 DUALES",
					--White Streak
					["bm_w_pl14"] = "WHITE STREAK",
					["bm_w_x_pl14"] = "WHITE STREAK DUALES",
					--Holt 9mm
					["bm_w_holt"] = "HOLT 9",
					["bm_w_x_holt"] = "HOLT 9 DUALES",
					--FMG-9
					["bm_w_fmg9"] = "WASP DS-9",
					--93R
					["bm_w_beer"] = "BERNETTI 93R",
					--Contractor Pistols 
					["bm_w_packrat"] = "CONTRACTOR M30L",
					["bm_w_x_packrat"] = "CONTRACTOR M30L DUALES",
					--Breech (Luger) 
					["bm_w_breech"] = "PARABELLUM-08",
					--Chimano Custom
					["bm_w_g22c"] = "CHIMANO CUSTOM",
					["bm_w_x_g22c"] = "CHIMANO CUSTOM DUALES",
					--Signature .40
					["bm_w_p226"] = "SIGNATURE .40",
					--LEO
					["bm_w_hs2000"] = "LEO-40",
					["bm_wp_hs2000_sl_long"] = "Corredera De Élite",
					--5/7 pistol
					["bm_w_lemming"] = "ACUTO 5/7",
					--Baby Deagle--
					["bm_w_sparrow"] = "SPARROW 941",
					["bm_w_x_sparrow"] = "SPIKE & VICIOUS", --Bob: Deberia adaptar el nom... es esto una referencia a cowboy bebop?...
					--Crosskill
					["bm_w_colt_1911"] = "CROSSKILL OPERATOR II",
					["bm_w_x_1911"] = "MUSTANG & SALLY", --Bob: No se si es una referencia
					["bm_wp_1911_m_big"] = "CARGADOR DE ALTA CAPACIDAD",
					--Crosskill Chunky
					["bm_w_m1911"] = "CROSSKILL A1",
					["bm_w_x_m1911"] = "PRICE & MACTAVISH", --Bob: No se si es una referencia
					--Crosskill Guard
					["bm_w_shrew"] = "CROSSKILL GUARD",
					["bm_w_shrew_joshua"] = "Una Luz Brillando En La Oscuridad", --Bob: Comprobar si esto no necesita estar en mayusculas
					["bm_w_x_shrew"] = "BARRY & PAUL", --Bob: No se si esto es una referencia
					--USP 
					["bm_w_usp"] = "INTERCEPTOR-45",
					["bm_w_x_usp"] = "INTERCEPTOR-45 DUALES",
					["bm_wp_usp_m_big"] = "CARGADOR DE ALTA CAPACIDAD",
					["bm_wp_pis_usp_b_match"] = "CORREDERA FREEMAN",
					--Model 54 
					["bm_w_type54"] = "CC-33",
					["bm_w_x_type54"] = "CC-33 DUALES",
					--Broomstick--
					["bm_w_c96"] = "BROOMSTICK",
					["bm_w_c96_dl44"] = "DL-44",
					["bm_wp_c96_nozzle"] = "BOQUILLA BLASTECH DL-44",
					--Sub2000
					["bm_w_sub2000"] = "CAVITY .40",
					--Deagle
					["bm_w_deagle"] = "DEAGLE",
					["bm_w_x_deagle"] = "DEAGLE DUALES",
					--Kahn .357
					["bm_w_korth"] = "KAHN .357",
					["bm_w_x_korth"] = "KAHN .357 DUALES",
					--Matever 2006m
					["bm_w_mateba"] = "MATEVER 9MM", --:^)
					["bm_wp_2006m_b_short"] = "CAÑÓN TACHIKOMA",
					["bm_wp_2006m_b_medium"] = "CAÑÓN TOGUSA",
					["bm_wp_2006m_b_long"] = "CAÑÓN KUSANAGI",
					["bm_w_x_2006m"] = "MATEVER DUALES",
					--Frenchman Model 87
					["bm_w_model3"] = "J&M MODELO 87",
					["bm_w_x_model3"] = "MODELO 87 DUALES",	
					--Raging bull
					["bm_w_raging_bull"] = "BRONCO .44",
					["bm_w_x_rage"] = "BRONCO .44 DUALES",
					--Castigo
					["bm_w_chinchilla"] = "CASTIGO .44",
					["bm_w_x_chinchilla"] = "CASTIGO .44 DUALES",
					--RUS-12
					["bm_w_rsh12"] = "RUS-12",
					--SAA/Peacemaker
					["bm_w_peacemaker"] = "PEACEMAKER .45LC",
					--CUSTOM PISTOLS
						--ZiP 22
						["bm_w_zip22"] = "ZIPPY 3000",
						--Px4
						["bm_w_px4"] = "BERNETTI HX4 CANAAN",
						--Browning Hi-Power
						["bm_w_hpb"] = "HI-POWER",
						--Browning Hi-Power (Mira)
						--["bm_w_hpb"] = "Hi-Power",
						--Walther P99
						["bm_w_p99"] = "LAKNER G99",
						--Derringer
						["bm_w_derringer"] = "DERRINGER",
						--Automag .44
						["bm_w_amt"] = "AUTOMAG .44",
						--Colt Detective
						["bm_w_coltds"] = "CROSSKILL INVESTIGATOR",
						--SIG P320
						["bm_w_papa320"] = "M19",
						["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "CARGADOR DE 32 CARTUCHOS",
				--[[ SMGs ]]
					--Kobus 90--
					["bm_w_p90"] = "PROJECT-90",
					["bm_w_x_p90"] = "PROJECT-90 DUALES",
					["bm_wp_p90_b_ninja"] = "CAÑÓN NINJA",
					["bm_wp_90_body_boxy"] = "CULATA DE ASALTO OMNIA",
					--Spec Ops
					["bm_w_mp7"] = "SPECOPS-7",
					--Tec-9
					["bm_w_tec9"] = "T3K URBAN",
					["bm_w_x_tec9"] = "T3K URBAN DUALES",
					--Heather
					["bm_w_sr2"] = "HEATHER-2M",
					["bm_w_x_sr2"] = "HEATHER-2M DUALES",
					--CMP
					["bm_w_mp9"] = "CMP-9",
					--Miyaka
					["bm_w_pm9"] = "MIYAKA 9 SPECIAL",
					--Micro Uzi
					["bm_w_baka"] = "MICRO UZI",
					["bm_w_x_baka"] = "MICRO UZI DUALES",
					--Cobra/Skorpion
					["bm_w_scorpion"] = "COBRA",
					["bm_w_x_scorpion"] = "COBRA DUALES",
					["bm_wp_scorpion_m_extended"] = "CARGADORES DUALES",
					--Tatonka
					["bm_w_coal"] = "AK-19 TATONKA",
					--AK Gen
					["bm_w_vityaz"] = "AK-19-01 TASUNKA",
					--Signature SMG
					["bm_w_shepheard"] = "FIK PC9",
					--Compact-5/MP5
					["bm_w_mp5"] = "COMPACT-5",	
					["bm_w_mp5sd"] = "COMPACT-5SD",	
					["bm_w_mp5k"] = "COMPACT-5K",
					["bm_w_mp5k_pdw"] = "COMPACT-5K PDW",
					["bm_w_x_mp5"] = "COMPACT-5 DUALES",
					["bm_wp_mp5_fg_mp5sd"] = "EMPUÑADURA SPOOC",
					--Swedish K
					["bm_w_m45"] = "SWEDISH K",
					--Pachett/Sterling
					["bm_w_sterling"] = "PATCHETTE L2A3",
					["bm_w_sterling_sd"] = "PATCHETTE L34A1",
					["bm_w_sterling_pistol"] = "PATCHETTE MK. VII",
					["bm_w_sterling_e11"] = "E-11",
					["bm_wp_sterling_b_e11"] = "CAÑÓN BLASTECH E-11",
					--Uzi
					["bm_w_uzi"] = "UZI",
					--Chicago Typewriter
					["bm_w_m1928"] = "CHICAGO TYPEWRITER",
					--Mark 10
					["bm_w_mac10"] = "MARK 10",
					["bm_w_x_mac10"] = "MARK 10 DUALES",
					--MP40
					["bm_w_erma"] = "MP 40",
					--Jackal
					["bm_w_schakal"] = "JACKAL",
					--Kross Vertex
					["bm_w_polymer"] = "KROSS VERTEX",
					--CUSTOM SMGs
						--AR57
						["bm_w_alpha57_prim"] = "FSS HURRICANE",
						--LWRC
						["bm_w_smg45"] = "FT STRIKER .45",
						--LWRC
						["bm_w_fang45"] = "FANG 45",
						--Typhoon
						["bm_w_crysis3_typhoon"] = "CRYNET TYPHOON",
						--KSP 45
						["bm_w_ksp45"] = "KSP 45",
						--LC10
						["bm_w_lc10"] = "LC10",
				--[[ MGs ]]
					--Bootleg/HK416c
					["bm_w_tecci"] = "BOOTLEGGER",
					--KSP/M249
					["bm_w_m249"] = "KSP-90",
					--ChainSAW
					["bm_w_kacchainsaw"] = "CAMPBELL 74",
					--RPK
					["bm_w_rpk"] = "RPK",
					--Brenner 21/HK21
					["bm_w_hk21"] = "BRENNER-21",
					--M60
					["bm_w_m60"] = "M60",
					--Ksp 58
					["bm_w_par"] = "KSP-58B",
					["bm_wp_par_b_short"] = "CAÑÓN COMPED",
					--Buzzsaw/Mg42
					["bm_w_mg42"] = "BUZZSAW-42",
					["bm_w_mg42_dlt19"] = "DLT-19",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "VERSTECKT-51B",
					--Microgun
					["bm_wp_wpn_fps_lmg_shuno_body_red"] = "CUERPO ROJO",
					--CUSTOM MGs
						["bm_w_sig_xm250"] = "FIK MG277",

				--[[ SHOTGUNS ]]
					--Grimm
					["bm_w_basset"] = "GRIMM 12G",
					["bm_w_x_basset"] = "HERMANAS GRIMM 12G",
					--Saiga
					["bm_w_saiga"] = "IZHMA 12G",
					--AA12
					["bm_w_aa12"] = "STEAKOUT 12G",
					--Spas12
					["bm_w_spas12"] = "PREDATOR 12G",
					--Benelli
					["bm_w_benelli"] = "M1014 12G",
					--Argos III
					["bm_w_ultima"] = "ARGOS III 12G",
					--Street Sweeper
					["bm_w_striker"] = "STREET SWEEPER 12G",
					--Goliath
					["bm_w_rota"] = "GOLIATH 12G",
					--VD-12
					["bm_w_sko12"] = "VD-12G",
					["bm_w_x_sko12"] = "VD-12G DUALES",
					--GSPS
					["bm_w_m37"] = "GSPS 12G",
					--Supernova
					["bm_w_supernova"] = "DEIMOS 12G",
					--Loco
					["bm_w_serbu"] = "LOCOMOTIVE 12G",
					--Reinfeld 88
					["bm_w_m1897"] = "REPEATER 1897 12G",
					--Mosconi 12g
					["bm_w_m590"] = "MOSCONI TACTICAL 12G", --Bob: Deberia traducir tactical?
					--R870
					["bm_w_r870"] = "REINFELD 880 12G",
					--KSG
					["bm_w_ksg"] = "RAVEN 12G",
					--Breaker 10g
					["bm_w_boot"] = "BREAKER 10G",
					--Claire Angélique Florette du Bertrand
					["bm_w_coach"] = "CLAIRE S/S 12G",
					--Mosconi
					["bm_w_huntsman"] = "MOSCONI S/S 12G",
					--Judge
					["bm_w_judge"] = "THE JUDGE .410", --Bob: Deberia adaptar el nombre?
					["bm_w_x_judge"] = "JUDGE & JURY", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
					--Joceline
					["bm_w_b682"] = "JOCELINE O/U 12G",	
					--Custom Shotguns
						--Doomstick
						["bm_w_quadbarrel"] = "DOOMSTICK",
						--Widowmaker TX
						["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "CARGADOR EXTENDIDO",
						["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "SISTEMA DE DISPARO EN RÁFAGA",
				--[[ ARs ]]
					--S552
					["bm_w_s552"] = "COMMANDO 552",
					--M733/AMCAR
					["bm_w_amcar"] = "AM-CAR",
					--G36
					["bm_w_g36"] = "JP-36KV",
					["bm_w_g36_k"] = "JP-36K",
					["bm_w_g36_c"] = "JP-36C",
					["bm_w_g36_v"] = "JP-36V",
					["bm_w_g36_long"] = "JP-36",
					--VHS/Lion's Roar
					["bm_w_vhs"] = "LION'S ROAR",
					["bm_wp_vhs_b_sniper"] = "CAÑÓN HYPER",
					["bm_wp_vhs_b_silenced"] = "CAÑÓN BAD DRAGAN",
					--Olympic/Para
					["bm_w_olympic"] = "PARA-23",
					["bm_w_x_olympic"] = "PARA-23 DUALES",
					--TAR-21
					["bm_w_komodo"] = "TEMPEST-95", --it's modeled after the X95, not the 21
					--Famas
					["bm_w_famas"] = "CLARION 5.56",
					--M4/CAR-4
					["bm_w_m4"] = "CAR-4",
					["bm_w_m4_mk12"] = "CAR-12 SPR",
					["bm_w_m4_lr300"] = "TR-300",
					["bm_wp_upg_ass_m4_b_beowulf"] = "CAÑÓN WOLF",
					["bm_wp_upg_s_fixed"] = "CULATA FIJA CAR",
					--AK5
					["bm_w_ak5"] = "AK 5",
					["bm_w_ak5b"] = "AK 5B",
					["bm_w_ak5c"] = "AK 5C",
					["bm_w_ak5_fnc"] = "VF CARABINE",
					--Union 5.56
					["bm_w_corgi"] = "UNION 5.56",
					["bm_wp_corgi_b_short"] = "CAÑÓN MSG",
					--UAR
					["bm_w_aug"] = "UAR A2",
					["bm_w_aug_a3"] = "UAR A3",
					["bm_w_aug_f90"] = "RAPTOR 90",
					["bm_wp_upg_b_hbar"] = "CAÑÓN PESADO",	
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
					["bm_w_l85a2"] = "QUEEN'S WRATH",
					--AK 7.62
					["bm_w_akm"] = "AK 7.62",
					["bm_w_akm_gold"] = "AK 7.62 DORADA",
					["bm_wp_upg_ass_ak_b_zastava"] = "CAÑÓN LARGO",
					--KETCHUPKNOB--
					--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
					["bm_w_groza"] = "OB-14ST BYK-1", --Hopefully less silly than its Ketchup name
					--"OB-14st" being an awful combo of "Oblast" (a word for region/zone/area, as well as literally having BLAST in the name) and the "14" in "OTs-14"
					--Although, a Russian word for "region/zone/area" followed up with a Polish word...
					--Eh, whatever
					--CHIKUBI
					["bm_w_tkb"] = "RODION 3B",
					["bm_wp_tkb_m_bakelite"] = "CARGADOR SIBERIANO 15X3",
					--Krinkov
					["bm_w_akmsu"] = "KRINKOV",
					--Akimbo Krinkov
					["bm_w_x_akmsu"] = "KRINKOV DUALES",
					--CUSTOM ARs
						--QBZ-191
						["bm_w_pd3_qbz191"] = "NORTHWEST B-9",
						--AN-94/92
						["bm_w_tilt"] = "KVK-99",
						--HK G36
						["bm_w_g36k"] = "JP36K",
						--SCAR-L
						["bm_w_scarl"] = "EAGLE LIGHT",
						--Valmet Rk.62
						["bm_w_rk62"] = "VELMER",
						--MW22 Honey Badger
						["bm_w_mcbravo"] = "CHIMERA",
						--AR-18
						["bm_w_ar18"] = "CAR-18",
						--FIK-22
						["bm_w_fik22"] = "FIK-22 TLR", --why does this use the in-universe Sig name?
				--[[ DMRs ]]
					--Little Friend
					["bm_w_contraband"] = "BIGGER FRIEND 7.62",
					["bm_w_contraband_m16"] = "LITTLE FRIEND 5.56",
					["bm_w_contraband_mpx"] = "OMNIA PC9 9MM",
					--FAL
					["bm_w_fal"] = "FALCON 58",
					["bm_w_fal_l1a1"] = "FALCON SLR",
					["bm_w_fal_sa58"] = "FALCON 58 OSW",
					["bm_w_fal_idf"] = "FALCON RMT",
					--ASS VAL
					["bm_w_asval"] = "VALKYRIA",
					--Galil
					["bm_w_galil"] = "GECKO 7.62",
					["bm_w_galil_galatz"] = "GEKKOTA 7.62",
					["bm_w_galil_mar"] = "MICRO GECKO 7.62",
					["bm_w_galil_556"] = "GECKO 5.56",
					["bm_w_galil_mar_556"] = "MICRO GECKO 5.56",
					--SCAR
					["bm_w_scar"] = "EAGLE HEAVY", --Bob: Deberia adaptar heavy y light?
					["bm_w_scar_l"] = "EAGLE LIGHT",
					["bm_w_scar_hamr"] = "EAGLE HAMMER",
					--Galant--
					["bm_w_ching"] = "M1 GALANT",
					--M308
					["bm_w_m14"] = "M308",
					--G3
					["bm_w_g3"] = "GEWEHR-3",
					["bm_w_g3_sg1"] = "GEWEHR-S1",
					["bm_w_g3_msg"] = "GEWEHR-90",
					["bm_w_g3_psg"] = "PRÄZISION GEWEHR-1",
					["bm_w_g3_hk33"] = "SG-33",
					["bm_w_g3_hk33_fo3"] = "R91",
					["bm_wp_g3_b_sniper"] = "MACRO CAÑÓN",
					["bm_wp_g3_b_short"] = "MICRO CAÑÓN",
					--KS12
					["bm_w_shak12"] = "KS-12 URBAN",
					["bm_w_shak12_vks"] = "KSV-12 URBAN",
					--HCAR
					["bm_w_hcar"] = "AKRON HC",
					["bm_w_hcar_bar"] = "AKRON HC",
					
					--Custom DMRs
						--MCX Spear
						["bm_w_mcx_spear"] = "FIK M7",
						["bm_w_ngsierra"] = "AMICUS 277",
						--VSS
						["bm_w_vss"] = "VIKTORIYA",
						--G3 HK79
						["bm_w_g3hk79"] = "GEWEHR-A3 W/ GL79",
						--BO3 XR2
						["bm_w_xr2"] = "XR-2",
						--SIERRA .458
						["bm_w_sierra458"] = "SIERRA .458",
				--[[ SNIPERS ]]
					--MSR
					["bm_w_msr"] = "RATTLESNAKE",
					["bm_wp_snp_msr_ns_suppressor"] = "SUPRESOR VIPER",	
					--R700
					["bm_w_r700"] = "REINFELD MODELO 700",	
					--QBU88
					["bm_w_qbu88"] = "KÁNG ARMS X1",
					--Winchester 1874
					["bm_w_winchester1874"] = "REPEATER 1874", --"Repeater" is the stand-in/fake name for the IRL manufacturer "Winchester"; I know "Eaton" exists from OTWD
					--TTI(TTY)
					["bm_w_tti"] = "TECCI TACTICAL .308",
					--Icky Vicky
					["bm_w_victor"] = "SA NORTH STAR", --Bob: Comprobar si tiene un nombre en el original
					--Scunt
					["bm_w_scout"] = "PRONGHORN",
					--AWP
					["bm_w_awp"] = "AIM 900F", --Dunno why Overkill didn't use the naming method used for OTWD; the model itself even uses OTWD's method by directly referencing "AIM" on the receiver
					--WA2000
					["bm_w_wa2000"] = "LEBENSAUGER",
					--Rangerhitter
					["bm_w_sbl"] = "RANGEHITTER MK. 2", --It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
					--Contender G2
					["bm_w_contender"] = "ARAN G2",
					--Model 70
					["bm_w_model70"] = "PLATYPUS 70",
					--SVD
					["bm_w_siltstone"] = "GROM",
					--Mosin--
					["bm_w_mosin"] = "NAGANT",
					--Desert Fox
					["bm_w_desertfox"] = "DESERTFOX",
					--R93
					["bm_w_r93"] = "R93",
					--Thanatos--
					["bm_w_m95"] = "THANATOS 95",
					--Custom Snipers
						--Guerilla
						["bm_w_sgs"] = "GUERILLA 542",	
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "HET-5 RED FOX",
						--AMR2
						["bm_w_amr2"] = "NORTHWEST AM-2",
						--M107
						["bm_w_m107cq"] = "THANATOS 107",
						--M200
						["bm_w_m200"] = "TF 141",
						--Marlin 1894
						["bm_w_m1894"] = "MARE'S LEG", --Bob: Deberia adaptar esto?
						--SPX Centerfire
						["bm_w_moss464spx"] = "MOSCONI SPX",
						--Winchester 1894
						["bm_w_winchester1894"] = "REPEATER 1894",
						--SVD
						["bm_w_svd"] = "SV7",
						["bm_wp_wpn_fps_snp_svd_pso"] = "MIRA TELESCÓPICA SV7",
						--L115
						["bm_w_l115"] = "AIM 90M",
				--[[ LAUNCHERS & BOWS ]]
					--GL40		
					["bm_w_gre_m79"] = "GL-40",
					--3GL
					["bm_w_ms3gl"] = "BASILISK 3GL",
					--PIGLET/M32
					["bm_w_m32"] = "PIGLET",
					--China Puff
					["bm_w_china"] = "CHINA PUFF",
					--Compact 40mm
					["bm_w_slap"] = "COMPACT 40mm",
					--Arbiter
					["bm_w_arbiter"] = "ARBITER",
					--RPG
					["bm_w_rpg7"] = "HRL-7",
					--COMMANDO 101/M202 FLASH
					["bm_w_ray"] = "COMMANDO 101 FLASH",
				--[[ UNIVERSAL ATTACHMENTS ]]
					--MUZZLE DEVICES
					["bm_wp_upg_ns_ass_smg_stubby"] = "APAGALLAMAS RECHONCHO", --Bob: Comprobar si usar Bocacha o apagallamas
					--SIGHTS
					["bm_wpn_fps_upg_o_hamr"] = "MIRA TELESCÓPICA TRIGONOM SCRW",
			})
		end

		if weapon_names == 2 then --Resmod names (No nicknames)
			LocalizationManager:add_localized_strings({	

				["bm_w_pl14"] = "WS-14",
				["bm_w_x_pl14"] = "WS-14 DUALES",
				["bm_wp_pis_g26"] = "CHIMANO 26",
				["bm_w_jowi"] = "CHIMANO 26 DUALES",

				["bm_w_g22c"] = "CHIMANO 22C",
				["bm_w_x_g22c"] = "CHIMANO 22C DUALES",
				["bm_w_x_sparrow"] = "SPARROW DUALES",

				["bm_w_x_1911"] = "OPERATOR II DUALES",
				["bm_w_x_m1911"] = "CROSSKILL A1 DUALES",
				["bm_w_x_shrew"] = "CROSSKILL GUARD DUALES",

				["bm_w_schakal"] = "AMP 45",

				["bm_w_x_judge"] = "JUDGE DUALES",

				["bm_w_l85a2"] = "L-95",
				["bm_w_contraband"] = "SG 417D GL",
				["bm_w_contraband_m16"] = "AMR-16 GL",
				["bm_w_contraband_mpx"] = "OMNIA PC9 GL",

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
					["bm_w_lemming"] = "FN FIVE-SEVEN",
					--Gecko Pistol
					["bm_w_maxim9"] = "SILENCERCO MAXIM 9",
					["bm_w_x_maxim9"] = "MAXIM 9 DUALES",

					--Stryk 18
					["bm_w_glock_18c"] = "GLOCK 18C",
					["bm_w_x_g18c"] = "GLOCK 18C DUALES",
					["bm_wp_g18c_co_comp_2"] = "SJC COMPENSATOR 9MM", --Bob: Esto es un accesorio para arma?
					--CZ
					["bm_w_czech"] = "CZ ACCUSHADOW 2",
					["bm_w_x_czech"] = "ACCUSHADOW 2 DUALES",

					--APS
					["bm_w_stech"] = "STECHKIN APS",
					["bm_w_x_stech"] = "STECHKIN DUALES",
					--Gruber
					["bm_w_ppk"] = "WALTHER PPK/S",
					["bm_wp_pis_ppk_g_laser"] = "EMPUÑADURA LÁSER CRIMSON TRACE",
					["bm_wp_pis_ppk_b_long"] = "CORREDERA PPKS",
					--Chimano 88
					["bm_w_glock_17"] = "GLOCK 17",
					["bm_w_x_g17"] = "GLOCK 17 DUALES",
					--Glock 26
					["bm_wp_pis_g26"] = "GLOCK 26",
					["bm_w_jowi"] = "GLOCK 26 DUALES",
					["bm_wp_g26_body_salient"] = "MARCO TENSADO",
					["bm_wp_g26_b_custom"] = "CORREDERA PULIDA",
					["bm_wp_g26_m_custom"] = "CARGADOR G26 STIPLED",
					--Luger
					["bm_w_breech"] = "LUGER P08",
					--Bernetti 9
					["bm_w_b92fs"] = "BERETTA 92FS",
					["bm_w_x_b92fs"] = "92FS DUALES",
					["bm_wp_beretta_co_co1"] = "COMPENSADOR SGS", --Original name was a reference to the movie "The Professional"
					["bm_wp_beretta_co_co2"] = "COMPENSADOR COMPETITION", --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models 	were based off of airsoft counterparts
					["bm_wp_beretta_sl_brigadier"] = "CORREDERA DE ÉLITE BRIGADIER",
					["bm_wp_beretta_g_ergo"] = "EMPUÑADURA ERGONÓMICA DE MADERA",
					["bm_wp_beretta_m_extended"] = "CARGADOR 30RNDS 92FS",
					["bm_wp_beretta_g_engraved"] = "EMPUÑADURAS 92FS GRABADAS",
					--PL14
					["bm_w_pl14"] = "KALASHNIKOV CONCERN PL-14 \"LEBEDEV\"",
					["bm_wp_pl14_m_extended"] = "CARGADOR 17RND PL-14",
					["bm_wp_pl14_b_comp"] = "COMPENSADOR PL-14",
					--Wick
					["bm_w_packrat"] = "H&K P30L",
					["bm_w_x_packrat"] = "P30L DUALES",
					--Hudson
					["bm_w_holt"] = "HUDSON H9",
					["bm_w_x_holt"] = "H9 DUALES",
					--93R
					["bm_w_beer"] = "BERETTA 93R",
					--M13
					["bm_w_legacy"] = "H&K P7M13",

					--LEO-40
					["bm_w_hs2000"] = "SPRINGFIELD ARMORY XD(M)-40",
					["bm_wp_hs2000_m_extended"] = "CARGADOR 22RND XD(M)-40",
					["bm_wp_hs2000_sl_custom"] = "CORREDERA COMPENSADA",
					["bm_wp_hs2000_sl_long"] = "CORREDERA PERSONALIZADA",
					--Signature 40
					["bm_w_p226"] = "SIG P226R",
					["bm_w_x_p226"] = "P226R DUALES",
					["bm_wp_p226_co_comp_2"] = "COMPENSADOR SJC .40",
					["bm_wp_p226_m_extended"] = "CARGADOR 22RND P226",
					["bm_wp_p226_b_equinox"] = "CORREDERA EQUINOX DUO-TONE",
					["bm_wp_p226_b_long"] = "CORREDERA LARGA PULIDA",
					["bm_wp_p226_co_comp_2"] = "COMPENSADOR SJC .40",
					--Chimano Custom
					["bm_w_g22c"] = "GLOCK 22C",
					["bm_w_x_g22c"] = "GLOCK 22C DUALES",
					["bm_wp_g22c_b_long"] = "CORREDERA COMPENSADA GLOCK 35",
					--Bang...
					["bm_w_sparrow"] = "IWI JERICHO 941 RPL",
					["bm_w_x_sparrow"] = "941 DUALES",
					["bm_wp_sparrow_body_941"] = "IWI JERICHO 941F KIT",
					["bm_wp_sparrow_g_cowboy"] = "EMPUÑADURA CON PESO",
					["bm_wp_sparrow_g_cowboy_desc"] = "VAS A CARGAR CON ESE PESO.", --Bob: Y aun no me terminaba el anime...
					
					--SUB2000
					["bm_w_sub2000"] = "KEL-TEC SUB-2000",
					["bm_sub2000_sc_desc"] = "Una de las pistolas que se han fabricado nunca. Las pequeñas balas de pistola golpean mucho más fuerte cuando salen de un cañón más largo y su capacidad de plegado permite una ocultación decente.",
					["bm_wp_sub2000_fg_gen2"] = "GUARDAMANOS GEN2",
					["bm_wp_sub2000_fg_railed"] = "GUARDAMANOS RED LION R6",
					["bm_wp_sub2000_fg_suppressed"] = "GUARDAMANOS DE CUATRO RIELES CON SUPRESOR",
					--C96
					["bm_w_c96"] = "MAUSER C96",
					["bm_w_c96_dl44"] = "BLASTECH DL-44",
					["bm_wp_c96_b_long"] = "CAÑÓN DE CARABINA",
					["bm_wp_c96_nozzle"] = "BOQUILLA DL-44",
					["bm_wp_c96_sight"] = "SCHMIDT & BENDER 1-8X24 PM PUNTO CORTO",
					["bm_wp_c96_m_extended"] = "CARGADOR 20RNDS C96",
					--Crosskill
					["bm_w_colt_1911"] = "SPRINGFIELD ARMORY 1911 OPERATOR",
					["bm_w_x_1911"] = "1911 OPERATOR DUALES",
					["bm_wp_1911_co_2"] = "COMPENSADOR TCII", --Not 100% but seems to be based off of it
					["bm_wp_1911_co_1"] = "CLARK HEAVY PINMASTER", --Bob: Deberia traducir esto?
					["bm_wp_1911_g_ergo"] = "EMPUÑADURA PACHMAYR 1911",
					["bm_wp_1911_g_bling"] = "EMPUÑADURAS DE MADERA",
					["bm_wp_1911_g_engraved"] = "EMPUÑADURAS GRABADAS 1911",
					["bm_wp_1911_b_long"] = "CORREDERA LARGA COMPENSADA",
					["bm_wp_1911_b_vented"] = "CORREDERA BICOLOR COMPENSADA",
					["bm_wp_1911_m_extended"] = "CARGADOR 12RNDS SA 1911",
					--Crosskill Chunky
					["bm_w_m1911"] = "COLT 1911A1", --Not entirely but its the closest thing
					["bm_w_x_m1911"] = "1911A1 DUALES",
					--Crosskill Guard
					["bm_w_shrew"] = "COLT DEFENDER",
					["bm_w_shrew_joshua"] = "Una luz brillando en la oscuridad", --Bob: Comprobar si esto deberia estar en mayusculas
					["bm_w_x_shrew"] = "DEFENDER DUALES",
					--Interceptor
					["bm_w_usp"] = "H&K USP TACTICAL",
					["bm_w_x_usp"] = "USP TACTICAL DUALES",
					["bm_wp_usp_co_comp_2"] = "COMPENSADOR SJC .45",
					["bm_wp_pis_usp_b_expert"] = "CORREDERA USP EXPERT",
					["bm_wp_pis_usp_b_match"] = "CORREDERA USP MATCH",
					["bm_wp_pis_usp_m_extended"] = "CARGADOR 20RNDS USP",
					--Anubis
					["bm_w_socom"] = "H&K MK.23",
					["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "PROTOTYPE PHASE I LAM", --Bob: Deberia adaptar esto?
					["bm_w_x_socom"] = "MK.23 DUALES",
					--TT-33	
					["bm_w_type54"] = "TOKAREV TT-33",
					["bm_w_x_type54"] = "TT-33 DUALES",
					
					--Kahn .357
					["bm_w_korth"] = "KORTH NXA",
					["bm_w_x_korth"] = "KORTH NXA DUALES",
					--Mateba
					["bm_w_mateba"] = "MATEBA 2006M",
					["bm_wp_2006m_b_short"] = "CAÑÓN TACHIKOMA",
					["bm_wp_2006m_b_medium"] = "CAÑÓN TOGUSA",
					["bm_wp_2006m_b_long"] = "CAÑÓN KUSANAGI",
					["bm_w_x_2006m"] = "2006M DUALES",
					--Frenchman Model 87
					["bm_w_model3"] = "S&W MODELO 3",	
					["bm_w_x_model3"] = "MODELO 3 DUALES",	
					--Castigo
					["bm_w_chinchilla"] = "S&W MODELO 29",
					["bm_w_x_chinchilla"] = "MODELO 29 DUALES",
					--Bronco
					["bm_w_raging_bull"] = "TAURUS RAGING BULL",
					["bm_w_x_rage"] = "RAGING BULL DUALES",
					["bm_wp_pis_rage_extra"] = "MONTURA DE MIRA TELESCÓPICA RAGING BULL",
					["bm_wp_rage_b_comp1"] = "COMPENSADOR V S&W",
					["bm_wp_rage_b_short"] = "CAÑÓN CORTO",
					["bm_wp_rage_b_comp2"] = "S&W MUZZLE COMPENSATOR",
					["bm_wp_rage_b_long"] = "CAÑÓN LARGO",
					--Deagle
					["bm_w_deagle"] = "MRI DESERT EAGLE MARK XIX", --"IS THAT A M16?"
					["bm_w_x_deagle"] = "DESERT EAGLE DUALES",
					["bm_wp_deagle_co_short"] = "FRENO DE BOCA DESERT EAGLE", --Original name was a reference to the 1990s film "La Femme Nikita" only for the gun's appearance in it, otherwise this is based on the real "DE50MB" Deagle muzzle brake
					["bm_wp_deagle_co_long"] = "PESO DEL CAÑÓN PERSONALIZADO", --Attachment is a reference to the Boondock Saints
					["bm_wp_deagle_g_ergo"] = "EMPUÑADURA PACHMAYR", --Doesn't exist but it's the same model from the 1911 but enlarged so w/e
					["bm_wp_deagle_g_bling"] = "EMPUÑADURAS PEARL",
					["bm_wp_deagle_m_extended"] = "CARGADOR 12RNDS DESERT EAGLE",
					["bm_wp_deagle_b_long"] = "CAÑON LARGO 25CM", --Bob: Puse cm en vez de pulgadas
					--SAA
					["bm_w_peacemaker"] = "COLT SINGLE ACTION ARMY", --Technically a Ruger New Vaquero but that's not as fun
					["bm_wp_peacemaker_barrel_long"] = "CAÑON 30CM",
					["bm_wp_peacemaker_barrel_short"] = "CAÑON 12CM",
					["bm_wp_peacemaker_handle_bling"] = "EMPUÑADURAS SAA GRABADAS",
					["bm_wp_peacemaker_rifle_stock"] = "CULATA ESQUELÉTICA",
					--RUS-12
					["bm_w_rsh12"] = "KPB RSH-12",
					--Shatter's Fury
					["bm_w_shatters_fury"] = "S&W MODELO 500",

					--MODS
					["bm_w_papa320"] = "SIG P320",
					["bm_w_coltds"] = "COLT DETECTIVE",
					["bm_w_amt"] = ".44 AUTO MAG",
					["bm_w_p99"] = "WALTHER P99",
					["bm_w_hpb"] = "BROWNING HI-POWER",

				--[[SMGs]]
					--P90
					["bm_w_p90"] = "FN P90 TR",
					["bm_w_x_p90"] = "P90 DUALES",
					["bm_p90_sc_desc"] = "Un Subfusil Bullpup y competidor del MP7. A menudo se comenta que parece un arma espacial futurista.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
					["bm_wp_p90_b_long"] = "CAÑÓN PS90",
					["bm_wp_p90_b_civilian"] = "CUBRECAÑÓN MOERSE LEKKER",
					--MP7
					["bm_w_mp7"] = "H&K MP7A2", --PD2's version kinda existed before the real MP7A2 was a thing so there's still some MP7A1 bits on it but w/e
					["bm_mp7_sc_desc"] = "Un Subfusil ligero y competidor del Subfusil P90. No tiene un lanzagranadas submontado como algunas fuentes pueden hacer creer.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
					["bm_wp_mp7_b_suppressed"] = "SUPRESOR B&T ROTEX-II",
					["bm_wp_mp7_s_long"] = "CULATA EXTENDIDA",
					["bm_wp_mp7_m_extended"] = "CARGADOR 40RND MP7",
					--CMP
					["bm_w_mp9"] = "B&T TP9SF",
					["bm_w_x_mp9"] = " TP9SF DUALES",
					["bm_wp_mp9_m_extended"] = "CARGADOR 30RNDS TP9",
					["bm_wp_mp9_s_skel"] = "CULATA FIJA STEYR TMP",
					["bm_wp_mp9_b_suppressed"] = "SUPRESOR B&T MP9 QD",
					--Micro Uzi
					["bm_w_baka"] = "IWI MICRO UZI",
					["bm_w_x_baka"] = "MICRO UZI DUALES",
					--T3K
					["bm_w_tec9"] = "INTRATEC TEC-9",
					["bm_wp_tec9_b_standard"] = "CAÑÓN AB-10",
					["bm_wp_tec9_ns_ext"] = "PSEUDOEXTENSIÓN DEL CAÑÓN",
					["bm_wp_tec9_s_unfolded"] = "CULATA INTERDYNAMIC MP-9 WIRE",
					["bm_wp_tec9_m_extended"] = "CARGADOR 50RNDS TEC-9",
					--Jacket's Piece
					["bm_w_cobray"] = "COBRAY M11/9",
					["bm_wp_cobray_ns_barrelext"] = "EXTENSIÓN DE CAÑÓN MAC",
					--SR-2M
					["bm_w_sr2"] = "TSNIITOCHMASH SR-2M \"VERESK\"",
					["bm_w_x_sr2"] = "SR-2M DUALES",
					["bm_sr2_sc_desc"] = "Utilizando un cartucho especializado de 9×21 mm, el SR-2M es la respuesta rusa a los subfusiles P90 y MP7.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal.##",
					--Miyaka 9
					["bm_w_pm9"] = "MINEBEA PM-9",
					--FMG9
					["bm_w_fmg9"] = "MAGPUL FDC-9",
					["bm_wp_fmg9_grip_tape"] = "CINTA DE AGARRE",
					["bm_wp_fmg9_stock_pad"] = "CANTONERA DE GOMA",

					--Cobra
					["bm_w_scorpion"] = "CZ VZ. 61 SKORPION",
					["bm_w_x_scorpion"] = "SKORPION DUALES",
					["bm_wp_scorpion_m_extended"] = "CARGADORES DUALES SKORPION",
					["bm_wp_scorpion_b_suppressed"] = "SUPRESOR SKORPION",
					--MP5
					["bm_w_mp5"] = "H&K MP5A2",
					["bm_w_mp5sd"] = "H&K MP5SD",	
					["bm_w_mp5k"] = "H&K MP5K",	
					["bm_w_mp5k_pdw"] = "H&K MP5K PDW",
					["bm_w_x_mp5"] = "MP5A2 DUALES",
					["bm_mp5_sc_desc"] = "La hermana pequeña del G3.\nRápido, preciso y fácil de manejar, ¿qué más se puede pedir de un Subfusil?",
					["bm_wp_mp5_fg_m5k"] = "KIT DE RIEL TRIPLE MP5K",
					["bm_wp_mp5_fg_mp5a5"] = "GUARDAMANOS CON RIEL MP5",
					["bm_wp_mp5_fg_mp5sd"] = "KIT MP5SD",
					["bm_wp_mp5_s_adjust"] = "CULATA RETRÁCTIL H&K",
					["bm_wp_mp5_s_ring"] = "SIN CULATA",
					["bm_wp_mp5_s_folding"] = "CULATA PLEGABLE CHOATE",
					["bm_wp_mp5_m_drum"] = "TAMBOR 70RND MP5",
					["bm_wp_mp5_m_straight"] = "CARGADOR 30RNDS MP5 40/10",
					--MPX
					["bm_w_shepheard"] = "SIG MPX", 
					--Vityaz
					["bm_w_vityaz"] = "KALASHNIKOV CONCERN PP-19 VITYAZ-SN",
					--Bizon
					["bm_w_coal"] = "KALASHNIKOV CONCERN PP-19 BIZON-2",

					--Uzi
					["bm_w_uzi"] = "IWI UZI",
					["bm_w_x_uzi"] = "UZI DUALES",
					["bm_wp_uzi_s_solid"] = "CULATA DE MADERA",
					["bm_wp_uzi_fg_rail"] = "SISTEMA DE RIEL TRIPLE FAB DEFENSE UZI",
					["bm_wp_uzi_b_suppressed"] = "SUPRESOR DE DOS FASES",
					--Pachette
					["bm_w_sterling"] = "STERLING L2A3",
					["bm_w_sterling_sd"] = "STERLING L34A1",
					["bm_w_sterling_pistol"] = "STERLING MK. VII",
					["bm_w_sterling_e11"] = "BLASTECH E-11",
					["bm_wp_sterling_b_suppressed"] = "CAÑÓN L34A1",
					["bm_wp_sterling_b_e11"] = "CAÑÓN BLASTECH E-11",
					["bm_wp_sterling_m_short"] = "CARGADOR 15RNDS",
					["bm_wp_sterling_m_long"] = "CARGADOR 34RNDS",
					--
					["bm_w_mac10"] = "INGRAM M10",
					["bm_w_x_mac10"] = "M10 DUALES",
					["bm_wp_mac10_m_extended"] = "CARGADOR 30RNDS",
					["bm_wp_mac10_body_ris"] = "SISTEMA DE RIELES MAC", --I'm getting nothing but airsoft results so generic name
					["bm_wp_mac10_s_skel"] = "CULATA ESQUELÉTICA DE MONTAJE BAJO",
					--Thompson
					["bm_w_m1928"] = "AUTO-ORDNANCE M1928",
					["bm_wp_m1928_b_short"] = "CAÑÓN CORTO",
					["bm_wp_m1928_fg_discrete"] = "EMPUÑADURA DE POLÍMERO",
					["bm_wp_m1928_g_discrete"] = "EMPUÑADURA DE POLÍMERO DE PISTOLA ",
					["bm_wp_m1928_s_discrete"] = "CULATA DE POLÍMERO",
					--MP 40
					["bm_w_erma"] = "ERMA MP 40",
					--UMP
					["bm_w_schakal"] = "H&K UMP-45",
					["bm_wp_schakal_b_civil"] = "CAÑÓN USC",
					["bm_wp_schakal_ns_silencer"] = "SUPRESOR GEMTECH QD UMP",
					["bm_wp_schakal_m_short"] = "CARGADOR 15RNDS",
					["bm_wp_schakal_m_long"] = "CARGADOR 45RNDS",
					--M45
					["bm_w_m45"] = "CARL GUSTAF KPIST M/45",
					["bm_wp_smg_m45_m_extended"] = "CARGADOR 50RNDS M/45",
					--Vector
					["bm_w_polymer"] = "KRISS VECTOR SMG",
					["bm_wp_polymer_barrel_precision"] = "CAÑÓN CRB CON CUBIERTA ",
					["bm_wp_polymer_ns_silencer"] = "SUPRESOR DEFIANCE HPS 4GSK",
	
				--[[MGs]]
					--416C
					["bm_w_tecci"] = "H&K HK416-C",
					["bm_wp_tecci_b_long"] = "CAÑÓN LARGO",
					["bm_wp_tecci_ns_special"] = "FRENO DE BOCA ELIMINADOR DE RETROCESO JPE",
					--Shuno what it is
					["bm_w_shuno"] = "EMPTY SHELL XM556 MICROGUN", --Bob: Deberia adaptar esto?

					--SAW
					["bm_w_m249"] = "FN M249 PARA",
					["bm_wp_m249_fg_mk46"] = "GUARDAMANOS MK 46",
					["bm_wp_m249_s_solid"] = "CULATA FIJA M249",

					--ChainSAW
					["bm_w_kacchainsaw"] = "KAC CHAINSAW", --Bob: Deberia adaptar esto?
					["bm_wp_kacchainsaw_barrel_short"] = "CAÑÓN CORTO",
					["bm_wp_kacchainsaw_barrel_long"] = "CAÑÓN LARGO",
					["bm_wp_kacchainsaw_mag_b"] = "BOLSA DE MUNICIÓN BLANDA DE 100 CARTUCHOS",
					["bm_wp_kacchainsaw_flamethrower"] = "LANZALLAMAS BAJO EL CAÑÓN",
					["bm_wp_kacchainsaw_sling"] = "CORREA CHAINSAW", --Bob: Deberia adaptar esto?

					--RPK
					["bm_w_rpk"] = "KALASHNIKOV CONCERN RPK",
					["bm_wp_rpk_fg_standard"] = "GUARDAMANOS AK DE POLÍMERO",
					["bm_wp_rpk_s_standard"] = "CULATA RPK DE POLÍMERO",
					["bm_wp_rpk_m_ban_sc"] = "CARGADOR 45RNDS MOLOT AK",

					--HK21
					["bm_w_hk21"] = "H&K HK21E",
					["bm_hk21_sc_desc"] = "La hermana mayor de la G3. Viene con una cadencia de fuego aumentada para una mayor capacidad de supresión.",
					["bm_wp_hk21_fg_short"] = "GUARDAMANOS CORTO HK21",
					["bm_wp_hk21_g_ergo"] = "EMPUÑADURA ERGONÓMICA HK21",
					--MG42
					["bm_w_mg42"] = "MAUSER MASCHINENGEWEHR 42",
					["bm_w_mg42_dlt19"] = "BLASTECH DLT-19",
					["bm_wp_mg42_b_mg34"] = "CAÑÓN MASCHINENGEWEHR 34",
					["bm_wp_mg42_b_vg38"] = "CAÑÓN BLASTECH DLT-19",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "VOLLMER HK51-B",
					["bm_hk51b_sc_desc"] = "Conversión posventa de la HK21, que encoge esta ametralladora hasta el tamaño de una MP5 y aumenta aún más su cadencia de fuego.",
					["bm_wp_hk51b_fg_railed"] = "GUARDAMANOS DE TRES RIELES",
					["bm_wp_hk51b_b_fluted"] = "CAÑÓN LARGO ESTRIADO",

					--M240
					["bm_w_par"] = "FN M240B",
					["bm_par_sc_desc"] = "Una ametralladora hermana más pesada de la M249 que suele montarse en vehículos. Intercambia movilidad por una bala aún más grande.",
				
					["bm_wp_par_s_plastic"] = "CULATA M240B",
					--M60
					["bm_w_m60"] = "SACO M60",
					["bm_wp_m60_fg_tactical"] = "GUARDAMANOS MK43 RIS",
					["bm_wp_m60_fg_tropical"] = "ENVOLTORIOS LEAF", --Bob: Traducir Leaf o es un nombre
					["bm_wp_m60_fg_keymod"] = "GUARDAMANOS KEYMOD",

					--M134
					["bm_w_m134"] = "GENERAL ELECTRIC M134",
					["bm_wp_m134_barrel_extreme"] = "CAÑÓN ANTIAÉREO",
					["bm_wp_m134_barrel_short"] = "CAÑÓN COMPACTO",
					--Custom MGs
						["bm_w_mx63"] = "KAC LAMG",

				--[[SHOTGUNS]]
					--Saiga
					["bm_w_basset"] = "SPIKE X1S SAIGA",
					["bm_w_x_basset"] = "SPIKE X1S SAIGA DUALES",
					["bm_w_basset_m_extended"] = "CARGADOR 10RND AGP ARMS",
					["bm_w_saiga"] = "KALASHNIKOV CONCERN SAIGA-12K",
					["bm_wp_saiga_fg_lowerrail"] = "SISTEMA MODULAR DE RIEL ULTIMAK AK",
					["bm_wp_saiga_m_20rnd"] = "TAMBOR 20RNDS MD ARMS",
					["bm_wp_saiga_fg_holy"] = "SISTEMA DE RIEL FUGLYSTICK",
					--AA12
					["bm_w_aa12"] = "MPS AUTO ASSAULT-12 CQB",
					["bm_wp_aa12_barrel_long"] = "CAÑÓN ESTÁNDAR",
					["bm_wp_aa12_mag_drum"] = "TAMBOR 20RNDS",
					--Six12
					["bm_w_rota"] = "CRYE PRECISION SIX12",
					--M1014
					["bm_w_benelli"] = "BENELLI M4 SUPER 90",
					["bm_wp_ben_b_long"] = "CAÑÓN LARGO",
					["bm_wp_ben_b_short"] = "CAÑÓN NFA",
					["bm_wp_ben_s_collapsed"] = "CULATA COLAPSADA",
					["bm_wp_ben_fg_standard"] = "CULATA TÁCTICA",
					--SPAS-12
					["bm_w_spas12"] = "FRANCHI SPAS-12",
					["bm_wp_spas12_b_long"] = "TUBO 8RND",
					--Striker
					["bm_w_striker"] = "SENTINEL ARMS STRIKER",
					--VD-12
					["bm_w_sko12"] = "SKO-12 DE FABRICACIÓN ESTÁNDAR",
					--Argos III
					["bm_w_ultima"] = "BAIKAL MP-155 ULTIMA",

					--870
					["bm_w_r870"] = "REMINGTON MODELO 870",
					["bm_wp_r870_m_extended"] = "EXTENSIÓN DE TUBO DE 2RND",
					["bm_wp_r870_fg_wood"] = "GUARDAMANOS DE MADERA",
					["bm_wp_r870_s_folding"] = "SIN CULATA",
					["bm_wp_r870_s_folding_ext"] = "CULATA PLEGABLE REMINGTON WINGMASTER",
					["bm_wp_r870_s_folding"] = "CULATA PLEGADA REMINGTON WINGMASTER",
					["bm_wp_r870_s_nostock_big"] = "SIN CULATA CON RIEL COMPLETO",
					["bm_wp_r870_s_solid_big"] = "CULATA FIJA CON RIEL COMPLETO",
					--Loco
					["bm_w_serbu"] = "REMINGTON CORTA MODELO 870",
					["bm_wp_shorty_m_extended_short"] = "EXTENSIÓN DE TUBO DE 1RND",
					["bm_wp_r870_s_solid"] = "CULATA FIJA",
					["bm_wp_serbu_s_solid_short"] = "CULATA FIJA CON RIEL",
					["bm_wp_serbu_s_nostock_short"] = "SIN CULATA CON RIEL",
					--KSG
					["bm_w_ksg"] = "KEL-TEC KSG",
					["bm_wp_ksg_b_long"] = "CAÑÓN LARGO CON 2 TUBOS DE 8 TIROS",
					["bm_wp_ksg_b_short"] = "CAÑÓN DE PATRULLA CON 2 TUBOS DE 6 TIROS",
					--Judge
					["bm_w_judge"] = "TAURUS 4510PLYFS",
					["bm_w_x_judge"] = "JUDGE DUALES",
					--M37
					["bm_w_m37"] = "ITHACA MODELO 37",
					--NO SHOTGUNS IN THE TRENCHES
					["bm_w_m1897"] = "WINCHESTER MODELO 1897",
					--M590
					["bm_w_m590"] = "MOSSBERG 590",
					["bm_wp_m590_body_rail"] = "RIEL CUÁDRUPLE TÁCTICO BLACK ACES",
					--Supernova
					["bm_w_supernova"] = "BENELLI SUPERNOVA",
					["bm_wp_supernova_g_adapter"] = "ADAPTADOR DE CULATA BENELLI AR-15",
					["bm_wp_supernova_g_raven"] = "EMPUÑADURA ATI RAVEN",
					["bm_wp_supernova_g_stakeout"] = "EMPUÑADURA DICKINSON XX3",
					["bm_wp_supernova_s_collapsed"] = "CULATA COLAPSADA",
					["bm_wp_supernova_s_Raven"] = "CULATA ATI RAVEN",

					--Mosconi
					["bm_w_huntsman"] = "MOSCONI COACH GUN", --Bob: Deberia traducir esto?
					["bm_wp_huntsman_b_short"] = "CAÑÓN RECORTADO",
					["bm_wp_huntsman_s_short"] = "CULATA RECORTADA",
					--725
					["bm_w_b682"] = "BERETTA 682", --funni hybrid 682, naming it after its internal name anyways
					["bm_wp_b682_b_short"] = "CAÑÓN RECORTADO",
					["bm_wp_b682_s_short"] = "CULATA RECORTADA",
					["bm_wp_b682_s_ammopouch"] = "BOLSA DE MUNICIÓN",
					--1887
					["bm_w_boot"] = "WINCHESTER MODELO 1887",
					["bm_wp_boot_body_exotic"] = "RECEPTOR ENDURECIDO 1887",
					--Claire 12G
					["bm_w_coach"] = "REMINGTON MODELO 1889",

				--[[ARs]]
					--FAMAS
					["bm_w_famas"] = "NEXTER FAMAS F1",
					["bm_wp_famas_b_sniper"] = "CAÑÓN DE FRANCOTIRADOR G2",
					["bm_wp_famas_b_short"] = "CAÑÓN G2 COMMANDO",
					["bm_wp_famas_g_retro"] = "EMPUÑADURA DE PISTOLA G1",
					--VHS
					["bm_w_vhs"] = "HS PRODUKT VHS-2",
					["bm_wp_vhs_b_short"] = "CAÑÓN CORTO",
					["bm_wp_vhs_b_sniper"] = "CAÑÓN DE FRANCOTIRADOR",
					["bm_wp_vhs_b_silenced"] = "CAÑÓN SUPRIMIDO",
					--JP36
					["bm_w_g36"] = "H&K G36KV",
					["bm_w_g36_k"] = "H&K G36K",
					["bm_w_g36_c"] = "H&K G36C",
					["bm_w_g36_v"] = "H&K G36V",
					["bm_w_g36_long"] = "H&K G36",
					["bm_wp_g36_fg_c"] = "GUARDAMANOS G36C",
					["bm_wp_g36_fg_ksk"] = "GUARDAMANOS KNIGHTS ARMAMENT CO. RAS",
					["bm_wp_g36_s_kv"] = "CULATA G36KV",
					["bm_wp_g36_s_sl8"] = "CULATA SL8",
					--S552
					["bm_w_s552"] = "SIG SG 552-2",
					["bm_wp_ass_s552_fg_standard_green"] = "GUARDAMANOS VERDE OD",
					["bm_wp_ass_s552_g_standard_green"] = "EMPUÑADURA VERDE DE PISTOLA OD",
					["bm_wp_ass_s552_s_standard_green"] = "CULATA VERDE OD",
					["bm_wp_ass_s552_fg_railed"] = "GUARDAMANOS CON RIEL SIG",
					["bm_wp_ass_s552_body_standard_black"] = "RECEPTOR NEGRO",
					--AMCAR
					["bm_w_amcar"] = "COLT M733 COMMANDO",
					--BABBY AR
					["bm_w_olympic"] = "OLYMPIC ARMS K23B",
					["bm_w_x_olympic"] = "K23B DUALES",

					--AUG
					["bm_w_aug"] = "STEYR AUG A2",
					["bm_w_aug_a3"] = "STEYR AUG A3",
					["bm_w_aug_f90"] = "THALES F90",
					["bm_wp_aug_fg_a3"] = "RIEL A3",
					["bm_wp_aug_body_f90"] = "KIT THALES F90",
					--Boatgun
					["bm_w_corgi"] = "FN F2000 TACTICAL TR",
					--AK12
					["bm_w_ak12"] = "KALASHNIKOV CONCERN AK-12",
					--Ak5
					["bm_w_ak5"] = "BOFORS AK 5",
					["bm_w_ak5b"] = "BOFORS AK 5B",
					["bm_w_ak5c"] = "BOFORS AK 5C",
					["bm_w_ak5_fnc"] = "FN FNC",
					["bm_wp_ak5_fg_ak5c"] = "GUARDAMANOS AK 5C",
					["bm_wp_ak5_fg_fnc"] = "GUARDAMANOS FN FNC",
					["bm_wp_ak5_s_ak5b"] = "CULATA AK 5B",
					["bm_wp_ak5_s_ak5c"] = "CULATA AK 5C",
					--CAR-4
					["bm_w_m4"] = "COLT M4A1",
					["bm_w_m4_mk12"] = "MK 12 SPR",
					["bm_w_m4_lr300"] = "ZM LR-300",
					--AK74
					["bm_w_ak74"] = "KALASHNIKOV CONCERN AKS-74",
					--805
					["bm_w_hajk"] = "CZ 805 BREN",
					["bm_wp_hajk_b_short"] = "CAÑÓN A2",
					--TAR-21
					["bm_w_komodo"] = "IWI X95",
					--OICW
					["bm_w_osipr"] = "XM29 OICW",

					--M16
					["bm_w_m16"] = "COLT M16A4",
					["bm_w_m16a1"] = "COLT M16A1",
					["bm_wp_m16_fg_railed"] = "RIEL DANIEL DEFENSE LITE",
					["bm_wp_m16_fg_vietnam"] = "GUARDAMANOS M16A1",
					--["bm_wp_m16_s_solid"] = "M16 Stock",
					--L85
					["bm_w_l85a2"] = "BAE L85A2",
					["bm_wp_l85a2_b_long"] = "CAÑÓN LARGO",
					["bm_wp_l85a2_b_short"] = "CAÑÓN CORTO",
					["bm_wp_l85a2_g_worn"] = "EMPUÑADURA DE PISTOLA ENCINTADA",
					["bm_wp_l85a2_fg_short"] = "RIEL CUÁDRUPLE DANIEL DEFENSE L85",
					--Krink
					["bm_w_akmsu"] = "AKMSU",
					["bm_w_x_akmsu"] = "AKMSU DUALES",
					["bm_wp_akmsu_fg_rail"] = "RIEL K SAMSON",
					--AKM
					["bm_w_akm"] = "KALASHNIKOV CONCERN AKMS",
					["bm_w_akm_gold"] = "AKMS BAÑADA EN ORO",
					--Nipples
					["bm_w_tkb"] = "TULA ARMS TKB-059",
					--Groza
					["bm_w_groza"] = "TSKIB SOO GROZA-1",
					--Custom Rifles
						["bm_w_fik22"] = "RUGER 10/22",


				--[[DMRs]]
					--417
					["bm_w_contraband"] = "H&K HK417 CON M203",
					["bm_w_contraband_m16"] = "COLT M16A1 CON M203",
					["bm_w_contraband_mpx"] = "SIG MPX CON M203",
					["bm_m203_weapon_sc_desc_pc"] = "La hermana mayor de la M16 personal de Scarface \"Little Friend\".\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal y puede atravesar enemigos.##\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
					["bm_m203_weapon_sc_desc"] = "La hermana mayor de la M16 personal de Scarface \"Little Friend\".\n\n#{skill_color}#Inflige 25% de su daño a través de armadura corporal y puede atravesar enemigos.##\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
						--VMP
						["bm_m203_vmp_sc_desc_pc"] = "Una réplica del M16 personal de Scarface \"Little Friend\".\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
						["bm_m203_vmp_sc_desc"] = "Una réplica del M16 personal de Scarface \"Little Friend\".\n\nMantén #{skill_color}#$BTN_BIPOD## para cambiar al lanzagranadas submontado.",
				
					--SCAR
					["bm_w_scar"] = "FN MK.17",
					["bm_w_scar_l"] = "FN MK.16",
					["bm_w_scar_hamr"] = "FN HAMR",
					["bm_wp_scar_fg_railext"] = "EXTENSIÓN DE RIEL PWS SCAR",
					["bm_wp_scar_s_sniper"] = "CULATA MK.20",
					--FAL
					["bm_w_fal"] = "FN FAL",
					["bm_w_fal_l1a1"] = "FAL L1A1",
					["bm_w_fal_sa58"] = "DSA SA58 OSW",
					["bm_w_fal_idf"] = "IWI ROMAT",
					["bm_wp_fal_body_standard"] = "GUARDAMANOS DSA SA58",
					["bm_wp_fal_fg_wood"] = "GUARDAMANOS DE MADERA FAL",
					["bm_wp_fal_fg_04"] = "GUARDAMANOS FLOTANTE DSA", --Bob: Esto esta bien traducido?
					["bm_wp_fal_fg_03"] = "GUARDAMANOS IWI ROMAT",
					["bm_wp_fal_g_01"] = "EMPUÑADURA DE PISTOLA TAPCO FAL",
					["bm_wp_fal_m_01"] = "CARGADOR 20RNDS FAL",
					["bm_wp_fal_s_01"] = "CULATA PLEGABLE LATERALMENTE FAL",
					["bm_wp_fal_s_03"] = "CULATA MAGPUL FAL PRS",
					["bm_wp_upg_vintage_fal_sc"] = "CARGADOR 20RNDS",
					--Galil
					["bm_w_galil"] = "IWI GALIL ARM",
					["bm_w_galil_galatz"] = "IWI GALATZ",
					["bm_w_galil_mar"] = "IWI MICRO GALIL",
					["bm_w_galil_556"] = "IWI GALIL ARM",
					["bm_w_galil_mar_556"] = "IWI MICRO GALIL",
					["bm_wp_galil_fg_sniper"] = "GUARDAMANOS IWI GALATZ",
					["bm_wp_galil_fg_sar"] = "GUARDAMANOS IWI GALIL SAR",
					["bm_wp_galil_fg_mar"] = "GUARDAMANOS IWI GALIL MAR",
					["bm_wp_galil_fg_fab"] = "GUARDAMANOS FAB DEFENSE VFR GA",
					["bm_wp_galil_g_sniper"] = "EMPUÑADURA DE PISTOLA IWI GALATZ",
					["bm_wp_galil_s_sniper"] = "CULATA DE MADERA IWI GALATZ",
					["bm_wp_galil_s_skeletal"] = "CULATA IWI GALIL MAR",
					["bm_wp_galil_s_light"] = "CULATA ESQUELÉTICA IWI GALATZ",
					["bm_wp_galil_s_fab"] = "ALMOHADILLA PARA MEJILLAS FAB DEFENSE MG-CP", --Bob: Si el nombre es muy largo cambiar a solamente almohadilla
					--AS VAL
					["bm_w_asval"] = "TULA ARMS AS \"VAL\"",
					["bm_wp_asval_b_proto"] = "CAÑÓN PROTOTIPO",
					["bm_wp_asval_s_solid"] = "CULATA VSS",

					--Raifu
					["bm_w_g3"] = "H&K G3A3",
					["bm_w_g3_hk33"] = "H&K HK33",
					["bm_w_g3_sg1"] = "H&K G3SG1",
					["bm_w_g3_msg"] = "H&K MSG90",
					["bm_w_g3_psg"] = "H&K PSG-1",
					["bm_w_g3_fo3"] = "R91",
					["bm_g3_sc_desc"] = "Hermana mayor del MP5 y del HK21, la precisión de este rifle rivaliza con la de los francotiradores.\n\n#{skill_color}#Inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos y paredes delgadas.##",
					["bm_g3_ap25_sc_desc"] = "Hermana mayor del MP5 y del HK21, la precisión de este rifle rivaliza con la de los francotiradores.\n\n#{skill_color}#Inflige 75% de su daño a través de armadura corporal y puede atravesar enemigos.##",
					["bm_g3_sg1_sc_desc"] = "Hermana mayor del MP5 y del HK21, la precisión de este rifle rivaliza con la de los francotiradores.\n\n#{skill_color}#Puede atravesar armadura corporal, múltiples enemigos, escudos en el rango de daño máximo y paredes delgadas.##",
					["bm_wp_g3_b_short"] = "CAÑÓN CORTO",
					["bm_wp_g3_b_sniper"] = "CAÑÓN PSG-1",
					["bm_wp_g3_fg_psg"] = "GUARDAMANOS PSG-1",
					["bm_wp_g3_fg_railed"] = "GUARDAMANOS FAB DEFENSE G3-RS",
					["bm_wp_g3_fg_retro"] = "GUARDAMANOS SLIMLINE DE MADERA", --Bob: Comprobar si Slimline tiene traduccion
					["bm_wp_g3_fg_retro_plastic"] = "GUARDAMANOS SLIMLINE",
					["bm_wp_g3_g_retro"] = "EMPUÑADURA ERGONÓMICA G3",
					["bm_wp_g3_g_sniper"] = "EMPUÑADURA DE MADERA DE PISTOLA PSG-1",
					["bm_wp_g3_s_sniper"] = "CULATA PSG-1",
					--M308
					["bm_w_m14"] = "SPRINGFIELD ARMORY M14 DMR",
					["bm_wp_m14_body_ebr"] = "CHASIS SAGE EBR",
					["bm_wp_m14_body_jae"] = "CULATA JAE 100 G3",
					["bm_wp_upg_o_m14_scopemount"] = "MONTURA DE MIRA SUN OPTICS USA M14/M1A",
					--Shak12
					["bm_w_shak12"] = "KALASHNIKOV CONCERN SHAK-12",
					--HCAR
					["bm_w_hcar"] = "OHIO ORDNANCE HCAR",
					["bm_w_hcar_bar"] = "BROWNING BAR", --Bob: Esto es un nombre?
					--GARAND
					["bm_w_ching"] = "SPRINGFIELD ARMORY M1 GARAND",
					["bm_wp_ching_fg_railed"] = "MONTURA AMEGA MINI-SCOUT",
					--Custom DMRs
						--G3 HK79
						["bm_g3hk79_sc_desc_pc"] = "Una variante del G3 que viene equipada con un #{skill_color}#lanzagranadas bajo el cañón## e #{skill_color}#inflige 50% de su daño a través de armadura corporal y puede atravesar enemigos y paredes delgadas.##\n\nPulsa #{skill_color}#$BTN_BIPOD## para cambiar al Lanzagranadas.",

				--[[SNIPERS]]
					--Titty
					["bm_w_tti"] = "TARAN TACTICAL TR-1 AR-10",
					--QBU88
					["bm_w_qbu88"] = "NORINCO QBU-88",
					--Icky Vicky
					["bm_w_victor"] = "SAINT VICTOR AR-15",

					--R700
					["bm_w_r700"] = "REMINGTON MODELO 700P",
					--Repeater
					["bm_w_winchester1874"] = "WINCHESTER MODEL 1873",
					["bm_wp_winchester_b_long"] = "CAÑÓN LARGO",
					["bm_wp_winchester_b_suppressed"] = "SUPRESOR",
					--MSR
					["bm_w_msr"] = "REMINGTON MSR",
					["bm_wp_snp_msr_ns_suppressor"] = "SUPRESOR AAC TITAN-QD",
					["bm_wp_msr_body_msr"] = "CULATA Y RECEPTOR DE ALUMINIO MSR",
					--Scunt
					["bm_w_scout"] = "STEYR SCOUT",
					--AWP
					["bm_w_awp"] = "ACCURACY INTERNATIONAL AW-F",
					["bm_wp_awp_stock_lightweight"] = "CULATA AT308",

					--Drako
					["bm_w_siltstone"] = "KALASHNIKOV CONCERN SVD",
					--WA2000
					["bm_w_wa2000"] = "WALTHER WA2000",
					["bm_wp_wa2000_g_walnut"] = "WALNUT FURNITURE", --Bob: Comprobar como adaptar esto
					["bm_wp_wa2000_g_stealth"] = "BLACK FURNITURE", --Bob: Comprobar como adaptar esto
					["bm_wp_wa2000_g_light"] = "LIGHTWEIGHT FURNITURE", --Bob: Comprobar como adaptar esto

					--SBL
					["bm_w_sbl"] = "MARLIN MODELO 1895SBL",
					--G2
					["bm_w_contender"] = "THOMPSON CENTER G2 CONTENDER",
					["bm_wp_contender_grip_m4"] = "EMPUÑADURA ADAPTADORA CHOATE M4",
					--Moist Nugget
					["bm_w_mosin"] = "MOSIN NAGANT M91/30",
					["bm_wp_mosin_b_sniper"] = "SUPRESOR NAGANT",
					["bm_wp_mosin_body_conceal"] = "CULATA DE POLÍMERO NEGRO",
					--Model 70
					["bm_w_model70"] = "WINCHESTER MODELO 70",
					--R93
					["bm_w_r93"] = "BLASER R93 TACTICAL 2",
					["bm_wp_r93_b_suppressed"] = "SUPRESOR SILENCERCO HARVESTER 338",
					["bm_wp_r93_body_wood"] = "CULATA PARA LARGO ALCANCE SPORTER 2", --Bob: Esto esta bien adaptado?
					--SRS
					["bm_w_desertfox"] = "DTA STEALTH RECON SCOUT",
					--Flintlock
					["bm_w_bessy"] = "MOSQUETE LAND PATTERN",

					--M95
					["bm_w_m95"] = "BARRETT M95",
					["bm_wp_m95_b_barrel_long"] = "CAÑÓN LARGO CON FRENO DE BOCA AW50F",
					--Custom Snipers
						--Guerilla
						["bm_w_sgs"] = "SIG 542",
						--AMR2
						["bm_w_amr2"] = "CSI AMR-2",
						--M200
						["bm_w_m200"] = "CHEYTAC M200",
						--Marlin 1894
						["bm_w_m1894"] = "MARLIN 1894",
						--SPX Centerfire
						["bm_w_moss464spx"] = "MOSSBERG SPX CENTERFIRE",
						--Winchester 1894
						["bm_w_winchester1894"] = "WINCHESTER 1894",
						--SVD
						["bm_w_svd"] = "KALASHNIKOV CONCERN SVD",
						--L115
						["bm_w_l115"] = "ACCURACY INTERNATIONAL L115",
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "SERO GEPARD M6",
						--M107
						["bm_w_m107cq"] = "BARRETT M107CQ",
						["bm_m107cq_sc_desc"] = "Si la M95 no estaba a la altura, la M107 proporcionará lo que deseas en forma de una fina niebla roja.\n\n#{skill_color}#Puede atravesar múltiples enemigos, armadura corporal, Escudos, Escudos Titán y paredes delgadas.##",

				--[[SPECIALS]]
					--GL40		
					["bm_w_gre_m79"] = "SPRINGFIELD ARMORY M79",
					--3GL
					["bm_w_ms3gl"] = "METAL STORM 3GL",
					--PIGLET/M32
					["bm_w_m32"] = "MILKOR MGL",
					--China Puff
					["bm_w_china"] = "NAWS CHINA LAKE",
					--Compact 40mm
					["bm_w_slap"] = "H&K M320",
					--Arbiter
					["bm_w_arbiter"] = "ATK XM25",
					--Wat is flash haow do u do it? haow 2 flash cartoonz? ADOEB FLASH... adoeb falsh... CS... 6.... a dobe.... a dobe
					["bm_w_ray"] = "NORTHROP M202 FLASH",
					--RPG
					["bm_w_rpg7"] = "BAZALT RPG-7",

					["bm_w_arblast"] = "ARBALESTA",
					["bm_w_frankish"] = "ARCO FRANCO", --Bob: Esto esta bien adaptado?
					["bm_w_hunter"] = "BALLESTA AVALANCHE CB1-50 CON EMPUÑADURA DE PISTOLA",
					["bm_w_elastic"] = "ARCO HOYT CARBON SPYDER ZT 30",
					["bm_wp_elastic_body_tactic"] = "ELEVADOR HOYT IGNITE", --Bob: Esto esta bien adaptado?

				--Attachments

					--Gadgets
						["bm_wp_upg_fl_pis_tlr1"] = "LINTERNA STREAMLIGHT TLR-1",
						["bm_wp_upg_fl_pis_laser"] = "MIRA LÁSER AIM SPORTS LH002", 
						["bm_wp_upg_fl_x400v"] = "LUZ LÁSER SUREFIRE X400V-IRC",
						["bm_wp_upg_fl_crimson"] = "MIRA LÁSER CRIMSON TRACE CMR-201",
						["bm_wp_upg_fl_pis_m3x"] = "LINTERNA INSIGHT TECHNOLOGY M3X",
						["bm_wp_upg_fl_pis_perst"] = "MIRA LÁSER ZENITCO PERST-4M",

						["bm_wp_upg_fl_ass_smg_sho_surefire"] = "LINTERNA SUREFIRE SCOUT",
						["bm_wp_upg_fl_ass_laser"] = "MIRA LÁSER DE MONTAJE DESPLAZADO",
						["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "MIRA LÁSER INSIGHT TECHNOLOGY AN/PEQ-5",
						["bm_wp_upg_fl_ass_utg"] = "LUZ LÁSER UTG P38",
						["bm_wp_upg_fl_ass_peq15"] = "LUZ LÁSER INSIGHT TECHNOLOGY AN/PEQ-15",
						["bm_wp_upg_fl_dbal_laser"] = "MIRA LÁSER STEINER DBAL-PL",

					--Muzzle Devices
						["bm_wp_upg_ns_meatgrinder"] = "BOCACHA SEPARADORA", --Bob: Esto esta bien adaptado?
						["bm_wp_upg_ns_typhoon"] = "FRENO DE BOCA OMEGA DEFENSE", --Internal name implies it's the Beretta TYPHOON but it resembles Omega Defense's more.
						["bm_wp_upg_pis_ns_flash"] = "SUPRESOR DE FLASH DE TITANIO CCF",

						["bm_wp_upg_ns_pis_small"] = "SUPRESOR THOMPSON MACHINE POSEIDON",
						["bm_wp_upg_ns_pis_medium"] = "SUPRESOR GEMTECH SFN", --Close enough... it's sectioned similarly enough for me to just name it this
						["bm_wp_upg_ns_pis_large"] = "SUPRESOR SILENCERCO OSPREY",
						["bm_wp_upg_ns_medium_gem"] = "SUPRESOR GEMTECH BLACKSIDE",
						["bm_wp_upg_ns_large_kac"] = "SUPRESOR KAC MK.23",
						["bm_wp_upg_ns_pis_jungle"] = "SUPRESOR FX-HND",
						["bm_wp_upg_ns_pis_putnik"] = "SUPRESOR RS PUTNIK",
						["bm_wp_upg_ns_ass_filter"] = "FILTRO DE ACEITE",

						["bm_wp_upg_ns_ass_smg_small"] = "SUPRESOR GEMTECH HALO", --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
						["bm_wp_upg_ns_ass_smg_medium"] = "SUPRESOR SMALL ARMS INDUSTRIES M80",
						["bm_wp_upg_ns_ass_smg_large"] = "SUPRESOR GOV MOD 1", --Couldn't find an IRL equivalent, name is just what it says on the tin, literally
						["bm_wp_upg_ak_ns_tgp"] = "SUPRESOR TGP-A",
						["bm_wp_victor_ns_omega"] = "SUPRESOR SILENCERCO OMEGA 36M",
						["bm_wp_kacchainsaw_suppressor"] = "SUPRESOR KAC QDSS NT4",
	
						["bm_wp_ultima_ns_comp"] = "FRENO DE BOCA HI-TECH HOWITZER70",
						["bm_wp_upg_ns_shot_shark"] = "FRENO DE BOCA BREACHER TROMIX SHARK", --Bob: No pude encontrar si breacher tiene nombre en español
						["bm_wp_upg_shot_ns_king"] = "FRENO DE BOCA BREACHER KING ARMORY KA-1212",
						["bm_wp_upg_ns_shot_thick"] = "SUPRESOR DE ESCOPETA",
						["bm_wp_upg_ns_sho_salvo_large"] = "SUPRESOR SILENCERCO SALVO 12",

						["bm_wp_upg_ns_ass_smg_stubby"] = "APAGALLAMAS VFC BM4", --airsoft part AFAIK, lol (VFC Baby M4)
						["bm_wp_upg_ns_ass_smg_tank"] = "COMPENSADOR G&P BM", --airsoft part AFAIK, lol (G&P Baby Monster) also the little "sight" post on it is actually for an AR15 gas tube, lmao
						["bm_wp_upg_ns_ass_smg_firepig"] = "COMPENSADOR NOVESKE KX3",
						["bm_wp_upg_ass_ns_jprifles"] = "FRENO DE BOCA JPE BENNIE COOLEY",
						["bm_wp_upg_ass_ns_linear"] = "COMPENSADOR LINEAL KIES BLAST MASTER",
						["bm_wp_upg_ass_ns_surefire"] = "FRENO DE BOCA SUREFIRE MBK",
						["bm_wp_ns_battle"] = "COMPENSADOR BATTLECOMP 2.0",
						["bm_wp_ak_upg_ns_zenitco"] = "COMPENSADOR ZENITCO DTK-1",
						["bm_wp_upg_ns_ass_smg_v6"] = "COMPENSADOR KEL-TEC V6",
						["bm_wp_kacchainsaw_muzzle"] = "FRENO DE BOCA KAC QDC MAMS",
						["bm_wp_hk51b_ns_jcomp"] = "COMPENSADOR JCOMP GEN2",
						["bm_wp_awp_ns_muzzle"] = "FRENO DE BOCA ACCURACY INTERNATIONAL",


					--Glock Parts
						["bm_wp_g18c_m_mag_33rnd"] = "CARGADOR EXTENDIDO PARA GLOCK",
						["bm_wp_g18c_g_ergo"] = "FUNDA DE EMPUÑADURA HOGUE HANDALL",
						["bm_wp_pis_g_laser"] = "EMPUÑADURA LÁSER CRIMSON TRACE",
						["bm_wp_pis_g_beavertail"] = "EXTENSIÓN DE LA EMPUÑADURA BEAVERTAIL",

					--AK parts
						["bm_wp_upg_ak_fg_krebs"] = "GUARDAMANOS KREBS UFM KEYMOD SYSTEM",
						["bm_wp_upg_ak_fg_trax"] = "GUARDAMANOS TRAX STRIKE INDUSTRIES", --Bob: Esto esta bien adaptado?
						["bm_wp_upg_ak_g_rk3"] = "EMPUÑADURA DE PISTOLA ZENITCO PK-3",
						["bm_wp_upg_ak_fg_zenit"] = "GUARDAMANOS ZENITCO",
						["bm_wp_upg_o_ak_scopemount"] = "SOPORTE ÓPTICO K-VAR KV-04S", --Bpb: Esto esta bien adaptado?
						["bm_wp_upg_ak_m_uspalm"] = "CARGADOR 30RNDS US PALM AK30",
						["bm_wp_upg_ns_ass_pbs1"] = "SUPRESOR PBS-1",
						["bm_wp_upg_ass_ak_b_zastava"] = "CAÑÓN ZASTAVA M76",
						["bm_wp_upg_ak_b_draco"] = "CAÑÓN DRACO PISTOL",
						["bm_wp_upg_ak_b_ak105"] = "CAÑÓN AK-105",
						["bm_wp_upg_ak_ns_jmac"] = "JMAC CUSTOMS MTC-1", --Bob: Deberia traducir esto?
						["bm_wp_upg_ak_m_quad"] = "CARGADOR 60RNDS KC",
						["bm_wp_ak_m_drum"] = "TAMBOR 75RNDS AK",
						["bm_wp_ak_fg_combo2"] = "SOPORTE ÓPTICO ULTIMAK AK",
						["bm_wp_ak_fg_combo3"] = "SISTEMA MODULAR DE RIEL ULTIMAK AK", --Bob: Esto esta bien traducido?
						["bm_wp_upg_ak_fg_tapco"] = "GUARDAMANOS TAPCO INTRAFUSE",
						["bm_wp_upg_fg_midwest"] = "RIEL CUÁDRUPLE MIDWEST INDUSTRIES",
						["bm_wp_upg_ak_g_hgrip"] = "EMPUÑADURA DE PISTOLA AK SOBREMOLDEADA HOGUE", --Bob: Esto esta bien adaptado?
						["bm_wp_upg_ak_g_pgrip"] = "EMPUÑADURA DE PISTOLA MEJORADA US PALM",
						["bm_wp_ak_s_folding"] = "CULATA PLEGABLE POR DEBAJO AK",
						["bm_wp_ak_s_skfoldable"] = "CULATA PLEGABLE LATERAL AK",
						["bm_wp_ak_s_psl"] = "CULATA PSL THUMBHOLE",
						["bm_wp_ak_upper_zenitco"] = "CUBIERTA ANTIPOLVO ZENITCO B-33",
						["bm_wp_ak_upg_fg_zenitco"] = "KIT ZENITCO SPORT-1",
						["bm_wp_ak_upg_dh_zenitco"] = "PALANCA DE CARGA ZENITCO RP-5",
						["wpn_fps_upg_ak_g_gradus"] = "EMPUÑADURA ERGONÓMICA FAB DEFENSE GRADUS",
						["wpn_fps_upg_ak_g_edg"] = "EMPUÑADURA TEXTURIZADA EVOLUTION DEFENSE",
						["wpn_fps_upg_ak_g_rk9"] = "EMPUÑADURA ZENITCO RK-9",
						["bm_wp_ak_upg_s_zenitco"] = "CULATA TELESCÓPICA ZENITCO PT-1",

					--Sights
						["bm_wp_upg_o_marksmansight_rear_desc"] = "SET DE MIRAS AJUSTABLE MEPROLIGHT TRU-DOT",
						["bm_wp_upg_o_rmr"] = "MIRA RÉFLEX TRIJICON RMR",
	
						["bm_wp_upg_o_docter"] = "IRONDOT CON MIRA RÉFLEX DOCTER SIGHT II PLUS", --Bob: Esto esta bien traducido?
						["bm_wp_upg_o_reflex"] = "MIRA RÉFLEX",
						["bm_wp_upg_o_cmore"] = "MIRA RÉFLEX C-MORE RAILWAY",
						["bm_wp_upg_o_rx01"] = "MIRA RÉFLEX TRIJICON RX01",
						["bm_wp_upg_o_rx30"] = "MIRA RÉFLEX TRIJICON RX30",	
	
						["bm_wp_upg_o_cs"] = "MIRA DE PUNTO ROJO AIMPOINT CS",
						["bm_wp_upg_o_aimpoint"] = "MIRA DE PUNTO ROJO AIMPOINT PRO",
						["bm_wp_upg_o_t1micro"] = "MIRA DE PUNTO ROJO AIMPOINT MICRO T-1",
						["bm_wp_upg_o_tf90"] = "MIRA DE PUNTO ROJO TECH FORCE TF90",
	
						["bm_wp_upg_o_fc1"] = "MIRA DE PUNTO ROJO DI OPTICAL FC1 PRISMATIC",
						["bm_wp_upg_o_eotech"] = "MIRA HOLOGRÁFICA EOTECH 553",
						["bm_wp_upg_o_eotech_xps"] = "MIRA HOLOGRÁFICA EOTECH EXPS3",
						["bm_wp_upg_o_uh"] = "MIRA HOLOGRÁFICA AMG UH-1",
	
						["bm_wp_upg_o_specter"] = "MIRA TELESCÓPICA ELCAN SPECTER DR 1-4X",
						["bm_wp_upg_o_acog"] = "MIRA TELESCÓPICA TRIJICON ACOG",
						["bm_wp_upg_o_poe"] = "MIRA TELESCÓPICA BELOMO PO4X24P",
						["bm_wp_upg_o_bmg"] = "MIRA TELESCÓPICA TRIJICON 6X48",

						["bm_wp_upg_o_spot"] = "MIRA TELESCÓPICA C/TELÉMETRO NCSTAR ADO 3X42",

						["bm_wp_upg_o_atibal"] = "MIRA TELESCÓPICA ATIBAL MROC 3X32 C/MICRO RÉFLEX",
						["bm_wpn_fps_upg_o_hamr"] = "MIRA TELESCÓPICA LEUPOLD MK. 4 HAMR 4X24",

						["bm_wp_upg_o_northtac"] = "NORTHTAC ASSAULT OPTIC 1-4X28 C/MICRO RÉFLEX", --Bob: Esto esta bien traducido?
						["bm_wp_uupg_o_schmidt"] = "SCHMIDT & BENDER 5-45X56 PM II HIGH POWER", --Bob: Deberia traducir esto?
	
						--"Schmidt & Bender 1-8x24 PM Short Dot"
						["bm_wp_upg_o_shortdot"] = "SCHMIDT & BENDER 1-8X24 PM PUNTO CORTO",
						["bm_wp_upg_o_shortdot_dmc"] = "SCHMIDT & BENDER 1-8X24 PM PUNTO CORTO",
						["bm_wp_upg_o_leupold"] = "LEUPOLD MARK 4 LR/T M1 C/BORS",
						["bm_wp_upg_o_box"] = "MIRA TELESCÓPICA PULSAR DIGISIGHT LRF N960 NV", --Bob: Esto esta bien traducido?
	
						["bm_wpn_fps_upg_o_45iron"] = "MIRAS ANGULARES XS SIGHTS",
						["bm_wpn_fps_upg_o_45rds"] = "MIRA DE PUNTO ROJO ANGULAR LEUPOLD DELTAPOINT PRO",
						["bm_wpn_fps_upg_o_45rds_v2"] = "MIRA DE PUNTO ROJO AIMPOINT MICRO T-1",
	
						["bm_wpn_fps_upg_o_xpsg33_magnifier"] = "MAGNIFICADOR AIMPOINT 3XMAG",
						["bm_wpn_fps_upg_o_sig"] = "MAGNIFICADOR SIG JULIET3",
	
						["bm_wp_upg_o_mbus_rear"] = "MIRAS DE RETROCESO MAGPUL MBUS", --Bob: Esto esta bien traducido?

					--Vertical Grips
						["bm_wp_upg_vg_tac"] = "KNIGHTS ARMAMENT CO. VFG", --Bob: Deberia traducir esto?
						["bm_wp_upg_vg_stubby"] = "TANGO DOWN QD STUBBY VFG", --Bob: Deberia traducir esto?
						["bm_wp_upg_vg_afg"] = "MAGPUL AFG 2",

					--STANAG compatible mags
						["bm_wp_upg_vintage_sc"] = "CARGADOR 20RNDS STANAG",
						["bm_wp_m4_m_pmag"] = "CARGADOR 30RNDS MAGPUL PMAG GEN1",
						["bm_wp_l85a2_m_emag"] = "CARGADOR 30RNDS MAGPUL EMAG",
						["bm_wp_upg_m4_m_quad"] = "CARGADOR 60RNDS SUREFIRE",
						["bm_wp_m4_m_drum"] = "TAMBOR DUAL 100RNDS BETA-C", --Bob: Esto esta bien traducido?
						["bm_wp_upg_m4_m_l5"] = "CARGADOR 30RNDS LANCER SYSTEMS L5 AW",
						["bm_wp_m4_uupg_m_strike"] = "CARGADOR 33RNDS STRIKE INDUSTRIES",
						["bm_wp_m4_m_quick"] = "CARGADOR MAGPUL ASSIST", --Bob: Esto esta bien traducido?

					--AR15 parts
						["bm_wp_m4_uupg_b_sd"] = "CAÑÓN SUPRIMIDO",
						["bm_wp_upg_ass_m4_b_beowulf"] = "CAÑÓN PESADO",

						["bm_wp_m4_upper_reciever_edge"] = "RECEPTOR SUPERIOR VLTOR",
						["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "RECEPTOR SUPERIOR 2A-ARM BALIOS",
						["bm_wp_upg_ass_m4_upper_reciever_core"] = "RECEPTOR SUPERIOR CORE15",
						["bm_wp_upg_ass_m4_lower_reciever_core"] = "RECEPTOR INFERIOR CORE15",
						["bm_wp_m4_upper_radian"] = "RECEPTOR SUPERIOR RADIAN MODEL 1",
						["bm_wp_m4_lower_radian"] = "RECEPTOR INFERIOR RADIAN A-DAC 15",

						["bm_wp_m4_uupg_fg_radian"] = "GUARDAMANOS RADIAN MODEL 1",
						["bm_wp_upg_fg_jp"] = "GUARDAMANOS MODULAR JPE ",
						["bm_wp_m4_uupg_fg_lr300"] = "GUARDAMANOS LR300",
						["bm_wp_upg_fg_smr"] = "RIEL SUPER MODULAR GEISSELE",
						["bm_wp_upg_smg_olympic_fg_lr300"] = "GUARDAMANOS SHORT LR300", --Bob: Esto esta bien traducido?
						["bm_wp_upg_ass_m16_fg_stag"] = "GUARDAMANOS STAG ARMS MODEL 8T",
						["bm_wp_upg_ass_m4_fg_moe"] = "GUARDAMANOS MAGPUL MOE SL",
						["bm_wp_upg_ass_m4_fg_lvoa"] = "GUARDAMANOS WAR SPORT LVOA",

						["bm_wp_m4_s_standard"] = "CULATA BUSHMASTER LE",
						["bm_wp_m4_s_pts"] = "CULATA MAGPUL PTS",
						["bm_wp_m4_uupg_s_fold"] = "CULATA PLEGABLE LR300",
						["bm_wp_upg_m4_s_crane"] = "CULATA DE GRÚA NSWC",
						["bm_wp_upg_m4_s_mk46"] = "CULATA DE GRÚA NSWC C/ALMOHADILLA DE MEJILLA",
						["bm_wp_upg_m4_s_ubr"] = "CULATA MAGPUL UBR",
						["bm_wp_tti_s_vltor"] = "CULATA VLTOR E-MOD",
						["bm_wp_victor_s_mod0"] = "CULATA BCM MOD 0",
						["bm_wp_sko12_stock"] = "CULATA ESTÁNDAR MFG AR", --Bob: Esto esta bien traducido?
						["bm_wp_m4_uupg_s_zulu"] = "CULATA ODIN WORKS ZULU 2.0",
						["bm_wp_olympic_s_short"] = "TUBO DE AMORTIGUACIÓN PARA PISTOLA ROCK RIVER ARMS", --Bob: Esto esta bien traducido?

						["bm_wp_m4_g_ergo"] = "EMPUÑADURA DE PISTOLA COMMAND ARMS UPG16",
						["bm_wp_m4_g_sniper"] = "EMPUÑADURA DE PISTOLA ESTILO PSG", --Bob: Esto esta bien traducido?
						["bm_wp_upg_m4_g_hgrip"] = "EMPUÑADURA ERGONÓMICA DE GOMA HOUGE",
						["bm_wp_upg_m4_g_mgrip"] = "EMPUÑADURA DE PISTOLA MAGPUL MOE-K",
						["bm_wp_tti_g_grippy"] = "EMPUÑADURA SOBREMOLDEADA HOUGE",
						["bm_wp_victor_g_mod3"] = "EMPUÑADURA BCM MOD 3",
						["bm_wp_sko12_grip"] = "EMPUÑADURA ESTÁNDAR MFG AR", --Bob: Esto esta bien traducido?
						["bm_wp_upg_g_m4_surgeon"] = "EMPUÑADURA DE PISTOLA ESQUELETIZADA TACTICAL DYNAMICS",
						["bm_wp_m4_g_billet"] = "EMPUÑADURA JL BILLET AR", --Bob: Esto esta bien traducido?

					["bm_wp_upg_lmg_lionbipod"] = "BÍPODE",

				--[[MELEE]]
					["bm_melee_kabar"] = "USMC KA-BAR",
					["bm_melee_kampfmesser"] = "KM 2000",
					["bm_melee_gerber"] = "GERBER DMF FOLDER", --Bob: Deberia traducir esto?
					["bm_melee_tomahawk"] = "TOMAHAWK GERBER DOWNRANGE",
					["bm_melee_becker"] = "KA-BAR BECKER TAC TOOL",
					["bm_melee_baton"] = "PORRA ASP FRICTION LOC",
					["bm_melee_shovel"] = "K.L.A.S.",
					["bm_melee_baseballbat"] = "\"LUCILLE\"",
					["bm_melee_bayonet"] = "BAYONETA AKM TYPE II",
					["bm_melee_bullseye"] = "HACHUELA SMITH & WESSON BULLSEYE",	
					["bm_melee_x46"] = "CUCHILLO UTILITARIO DE SUPERVIVENCIA ROBSON X46",
					["bm_melee_dingdong"] = "HERRAMIENTA ROMPEPUERTAS GERBER DING DONG",
					["bm_melee_cleaver"] = "CUCHILLO DE CARNICERO",
					["bm_melee_kabar_tanto"] = "TANTO KA-BAR",
					["bm_melee_chef"] = "CUCHILLO DE CHEF",
					["bm_melee_fairbair"] = "CUCHILLO DE COMBATE FAIRBAIRN-SYKES",
					["bm_melee_model24"] = "STIELHANDGRANATE MODELO 24 ",
					["bm_melee_hammer"] = "MARTILLO DE JACKET",
					["bm_melee_meat_cleaver"] = "CUCHILLO DE CARNICERO DE DRAGAN",
					["bm_melee_poker"] = "PÓQUER DE LEÑA",
					["bm_melee_tenderizer"] = "ABLANDADOR DE CARNE",
					["bm_melee_fork"] = "TENEDOR PARA BARBACOA",
					["bm_melee_mining_pick"] = "PICO",
					["bm_melee_bowie"] = "CUCHILLO BOWIE",
					["bm_melee_branding_iron"] = "HIERRO PARA MARCAS",
					["bm_melee_oldbaton"] = "NIGHTSTICK", --Bob: Deberia traducir esto?
					["bm_melee_detector"] = "DETECTOR DE METALES PORTÁTIL GARRETT",
					["bm_melee_taser"] = "BASTÓN ATURDIDOR ZAP",
					["bm_melee_cqc"] = "KUNAI",
					["bm_melee_twins"] = "SAIS",
					["bm_melee_tiger"] = "TEKKO-KAGI",
					["bm_melee_pugio"] = "EXTREMA RATIO PUGIO SE", --Bob: Deberia traducir esto?
					["bm_melee_gator"] = "MACHETE GERBER GATOR PRO",
					["bm_melee_scoutknife"] = "MORAKNIV CLASSIC SCOUT 39",
					["bm_melee_shawn"] = "TIJERAS PARA OVEJAS ANTIGUAS",
					["bm_melee_stick"] = "BASTÓN DE PASTOR",
					["bm_melee_nin"] = "PISTOLA DE CLAVOS PASLODE IM90I",
					["bm_melee_ballistic"] = "CUCHILLOS BALÍSTICOS",
					["bm_melee_wing"] = "BENCHMADE MODELO 42 BALISONG",
					["bm_melee_cs"] = "MOTOSIERRA HOMELITE SUPER 2",
					["bm_melee_brick"] = "MOTOROLA DYNATAC 8000X",
					["bm_melee_sword"] = "LÁPIZ",
					["bm_melee_oxide"] = "UVSR TAIGA-1",
					["bm_melee_selfie"] = "EXTENSIÓN PARA GOPRO POLARPRO POWERPOLE", --Bob: Esto esta bien traducido?
					["bm_melee_twins"] = "SAI SHUREIDO",

				--[[THROWABLES]]
					["bm_grenade_frag"] = "GRANADA DE FRAGMENTACIÓN M67",
					["bm_grenade_frag_com"] = "GRANADA DE FRAGMENTACIÓN M67 - MODELO OVERKILL",
					["bm_wpn_prj_hur"] = "HACHA ARROJADIZA KIT RAE AIRCOBRA",
					["bm_wpn_prj_target"] = "CUCHILLO ARROJADIZO BLAZING ARROW NINJA",
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
	
				["bm_m134_sc_desc"] = "CRYPTIC METAPHOR...", --Bob: Mira una referencia que no conozco :D
				["bm_wp_upg_suppressor_boss"] = "\"CRAB BATTLE!!!\"\n\n#{skill_color}#Silencia## tu arma y #{risk}#reduce la probabilidad de que los enemigos intenten esquivar tus disparos.##" --Bob: Deberia traducir crab battle?

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
						["bm_m16_sc_desc"] = "\"¡No perderé!\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nLa figura enérgica y malhablada de la escuela.",
					["bm_w_m4"] = "Eme-Cuatro",
					["bm_w_m4_mk12"] = "Eme-Cuatro",
					["bm_w_m4_lr300"] = "Eme-Cuatro",
						["bm_m4_sc_desc"] = "\"¡No subestimes un rifle de servicio!\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nVicepresidenta del consejo estudiantil de secundaria.",
					["bm_w_aug"] = "AUG",
					["bm_w_aug_a3"] = "AUG",
					["bm_w_aug_f90"] = "AUG",
						["bm_aug_sc_desc"] = "#{stats_negative}#\"¡HUID! ¡SUPLICAD POR VUESTRA VIDA!\"##\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nPresidenta del consejo de estudiantes de secundaria.",
					["bm_wp_ak5_fg_fnc"] = "Kit Funco",
						["bm_wp_ak5_fg_fnc_desc"] = "\"Responder a los deseos de su amo es la alegría de una herramienta.\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nDesprende un fuerte aura de \"protagonista principal\".",
					["bm_w_s552"] = "Shigu",
						["bm_s552_sc_desc"] = "\"El próximo disparo, te arrancaré la oreja, perra.\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nEstudiante de honor de una familia adinerada que destaca tanto en los deportes como en los estudios.",
					["bm_w_l85a2"] = "Eru",
						["bm_l85a2_sc_desc"] = "\"...\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nTímida y torpe, tiene un carácter poco fiable y la costumbre de romper mucho.",
					["bm_w_rk62"] = "Sako",
						["bm_rk62_sc_desc"] = "\"#{stat_maxed}#¡Qué chillidos tan maravillosos!## ¡Suenas como si estuvieras a punto de #{stats_negative}#morir!##\"\n\nEstudiante de transferencia que asiste a la #{stats_positive}#Academia Seishou.##\nUna sádica de orejas de elfo con ganas de ser la \"alfa\" de cualquier escuela a la que asista. Desea a Funco.",
	
				--HIGH SCHOOLERS
					["bm_w_fal"] = "Faru",
					["bm_w_fal_l1a1"] = "Faru",
					["bm_w_fal_sa58"] = "Faru",
					["bm_w_fal_idf"] = "Faru",
						["bm_fal_sc_desc"] = "\"¡Ha llegado tu hermana mayor!\"\n\nLa hermana mayor de Funco.\nNo confundir con la otra hermana de Funco, L1A1.",
						["bm_fal_ap25_sc_desc"] = "\"¡Ha llegado tu hermana mayor!\"\n\nLa hermana mayor de Funco.\nNo confundir con la otra hermana de Funco, L1A1.",
					["bm_w_m14"] = "Ichiyon",
						["bm_m14_sc_desc"] = "\"¿Qué hacen esos occidentales copiando AKs? ¡Banda de traidores!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nDespreocupada y llena de juegos de palabras. Actualmente atraviesa una crisis de sentido de la moda.",
					["bm_w_g3"] = "Jiisuri",
					["bm_w_g3_sg1"] = "Jiisuri",
					["bm_w_g3_msg"] = "Jiisuri",
					["bm_w_g3_psg"] = "Jiisuri",
					["bm_w_g3_hk33"] = "HK33",
					["bm_w_g3_hk33_fo3"] = "R91",
						["bm_g3_sc_desc"] = "\"¡Resolvamos esto!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nElegante pero un poco torpe. La mayor de sus muchas hermanas y #{stat_maxed}#raifu## de DMC.", --Bob: que se supone que sea raifu
						["bm_g3_ap25_sc_desc"] = "\"¡Resolvamos esto!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nElegante pero un poco torpe. La mayor de sus muchas hermanas y #{stat_maxed}#raifu## de DMC.",
						["bm_g3_sg1_sc_desc"] = "\"¡Resolvamos esto!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nElegante pero un poco torpe. La mayor de sus muchas hermanas y #{stat_maxed}#raifu## de DMC.",
						["bm_wp_wpn_fps_ass_g3_body_hk33"] = "Set \"Chuusuri\" HK33",
						["bm_wp_wpn_fps_ass_g3_body_hk33_desc"] = "\"Llámame así otra vez, ¡te reto!\"\n\nEstudiante de secundaria en la #{stats_positive}#Academia Seishou.##\nA pesar de la actitud agresiva de HK33, sus compañeros la apodan cariñosamente \"Chuusuri\", muy a su pesar.",
						["bm_menu_jiisuri_stock"] = "Pantyhose",

				--ELEMENTARY
					["bm_w_mp5"] = "Empi",
					["bm_w_mp5sd"] = "MP5SD",	
					["bm_w_mp5k"] = "MP5K",	
					["bm_w_mp5k_pdw"] = "MP5K",
						["bm_mp5_sc_desc"] = "\"Si ese es tu hobby...\"\n\nEstudiante de primaria que asiste a la #{stats_positive}#Academia Seishou.##\nUno de los muchos hermanos pequeños de Jiisuri y presidenta del consejo estudiantil de la división de primaria.",
					["bm_w_schakal"] = "UMP",
						["bm_schakal_sc_desc"] = "Estudiante de primaria que asiste a la #{stats_positive}#Academia Seishou.##\nPrima de la familia G3; actualmente vive con ellos mientras asiste a la escuela. A menudo se pelea con MP5K.",
					["bm_w_uzi"] = "Uzi",
						["bm_uzi_sc_desc"] = "\"¡Cómete esto!\"\n\nEstudiante de primaria que asiste a la #{stats_positive}#Academia Seishou.##\nLa antigua líder autoproclamada de la división de primaria, expulsada del puesto por Empi cuando llegó.",
					["bm_w_mac10"] = "Ram",
						["bm_mac10_sc_desc"] = "\"INGRAM!\"\n\nEstudiante de primaria que asiste a la #{stats_positive}#Academia Seishou.##\nUna ametralladora con palabras. También bastante pesada.",
		
				--FACULTY
					["bm_w_erma"] = "Erma-sensei",
						["bm_erma_sc_desc"] = "\"¡Adelante! ¡Adelante!\"\n\nUna madre de dormitorio de primaria que trabaja en la #{stats_positive}#Academia Seishou.##\nLos SMGs la adoran.",
					["bm_w_m1928"] = "Thompson-sensei",
						["bm_m1928_sc_desc"] = "\"¡Es sentido común!\"\n\nUn profesor de primaria que trabaja en la #{stats_positive}#Academia Seishou.##\nHabla con acento japonés. Antiguo miembro del FBI.",
					["bm_w_ching"] = "Garand",
						["bm_galant_sc_desc"] = "\"¿¡ESTÁS INTENTANDO TOMARME EL PELO!?\"\n\nUn instructor que trabaja en la #{stats_positive}#Academia Seishou.##\nVigila a los estudiantes de secundaria.",
	
			--RED STEEL ACADEMY
				--THREE STRIPES
					["bm_w_siltstone"] = "Drako",
						["bm_siltstone_sc_desc"] = "\"Не поймите неправильно...\"\n\nUn estudiante de tres rayas que asiste a la #{stats_negative}#Academia Acero Rojo.##\nTranquilo, recogido y habla exclusivamente en ruso.", --sorry about the Google/MS translate
					["bm_w_akm"] = "AKM",
						["bm_akm_sc_desc"] = "\"¡NO ME TOQUES LOS COJONES!\"\n\nUn estudiante de tres rayas que asiste a la #{stats_negative}#Academia Acero Rojo.##\nUna chica alta y amenazadora con orejas y cola de zorro. Una de las pocas estudiantes capaces de engañar a AK47.",
					--["bm_w_rpk"] = "RPK",
						["bm_rpk_sc_desc"] = "\"¡Por eso los hombres son tan cerdos!\"\n\nUn estudiante de tres rayas que asiste a la #{stats_negative}#Academia Acero Rojo.##\nUna chica alta y rubia con orejas y cola de tigre siberiano. Recibe disparos de francotirador con frecuencia.",
				--TWO STRIPES
					["bm_w_ak74"] = "Nanayon",
						["bm_ak74_sc_desc"] = "\"Si son órdenes del Mayor, todo vale...\"\n\nUn estudiante de dos rayas que asiste a la #{stats_negative}#Academia Acero Rojo.##\nUna hermosa chica con orejas y cola de zorro, pero también con una naturaleza astuta.",
					["bm_w_saiga"] = "Saiga-chan",
						["bm_saiga_sc_desc"] = "\"¡Todos vosotros sois como ratones en una trampa, nya!\"\n\nUn estudiante de dos rayas que asiste a la #{stats_negative}#Academia Acero Rojo.##\nAltivo, demasiado confiado y expresivo, Saiga es una escopeta automática ruidosa y bulliciosa.",
				--ONE STRIPE
					["bm_w_coal"] = "Bizon",
						["bm_coal_sc_desc"] = "\"¡Puedes contar conmigo!\"\n\nEstudiante de una raya que asiste a la #{stats_negative}#Academia Acero Rojo.##\nRealmente admira a sus mayores, literalmente, pero tiene especial cuidado cuando se dirige a SVD.",
				--FACULTY
					["bm_w_mosin"] = "Mosin Nagant",
						["bm_mosin_sc_desc"] = "\"A la sala de autorreflexión...\"\n\nMiembro del profesorado de la #{stats_negative}#Academia Acero Rojo.##\nEl zarista absoluto nacido del Imperio Ruso. Un viejo amigo de Thomspon-sensei.",
			
			--ENOSHIMA
				--MIDDLE SCHOOLERS
					["bm_w_spas12"] = "Supasu",
						["bm_spas12_sc_desc"] = "\"¡Idiota! ¡Estás completamente expuesto!\"\n\nUn estudiante de secundaria que asiste a una escuela pública en Enoshima.",
					["bm_w_benelli"] = "Beneri M4",
						["bm_benelli_sc_desc"] = "\"¡Hay un límite para no ser capaz de leer el estado de ánimo!\"\n\nUn estudiante de secundaria que asiste a una escuela pública en Enoshima.",
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
					["bm_g3_sc_desc"] = "\"¡Resolvamos esto!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nElegante pero un poco torpe. La mayor de sus muchas hermanas y #{stat_maxed}#raifu## de DMC.",
					["bm_g3_ap25_sc_desc"] = "\"¡Resolvamos esto!\"\n\nEstudiante de instituto en la #{stats_positive}#Academia Seishou.##\nElegante pero un poco torpe. La mayor de sus muchas hermanas y #{stat_maxed}#raifu## de DMC.",
					["bm_menu_jiisuri_stock"] = "Pantyhose",
			})
		end
	
		local big = math.rand(1)
		local pistol = 0.02
		if Month == "4" and Day == "1" then
			pistol = 1
		end
		if shitpost or not easterless and big <= pistol then
			LocalizationManager:add_localized_strings({	
				["bm_w_huntsman"] = "Bubble Daryl",
				["bm_w_deagle"] = "Big Pistol",
				["bm_w_m16"] = weapon_names == 2 and "is that a famas" or "is that a clarion",
				["bm_m16_sc_desc"] = "Te daré un clip para que puedas hacer algo de daño",
				["bm_w_x_type54"] = weapon_names == 2 and "The twin colts" or "The twin crosskills",
				["bm_akmsu_sc_desc"] = "Un pequeño rifle útil para derribar #{stat_maxed}#GRANDES HOMBRES##.No hay que subestimarlo, ya que este rifle puede mantenerse en casi cualquier escenario.",
			})
		end

		local blizzard = math.rand(1)
		local tornado = 0.02
		if Month == "4" and Day == "1" then
			tornado = 1
		end
		if not easterless and blizzard <= tornado then
			LocalizationManager:add_localized_strings({	
				["menu_pattern_scale_small"] = "Justicia",
				["menu_pattern_scale_medium"] = "Premium",
				["menu_pattern_scale_large"] = "Verdad",
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
			["hud_assault_assault"] = "Pciloe Asuaslt in Prergoss",
			["hud_assault_cover"] = "STYA IN COVRE...FLESH",
			["hud_assault_alpha"] = "PCILOE ASUASLT"
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
			["hud_assault_assault"] = "Murkywater Operation in Progress", --Bob: Deberia traducir esto?
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
		["menu_toggle_one_down"] = "Trabajo Pro",
		["menu_one_down"] = "Trabajo Pro",
		["menu_es_pro_job_bonus"] = "Trabajo Pro",
		
		["menu_pro_warning"] = "¡Este es un Trabajo Pro! Si fallas, el contrato entero se cancelara\nPuede que tambien encuentres un evento de Punto De No Retorno cerca del final del atraco, donde enemigos mas poderosos seran desplegados. \nCompletar un Trabajo Pro te otorga un bonus de dinero y experiencia del 25%.",

		["menu_asset_lock_additional_assets_pro"] = "¡NO DISPONIBLE EN TRABAJO PRO!",
		["menu_asset_buy_all_req_skill"] = "##¡NO DISPONIBLE!##",

		["cn_menu_contract_daypay_header"] = "Day Rate:",
		["cn_menu_contract_jobpay_header"] = "Contract Pay:",
		["victory_stage_cash_summary_name_job"] = "You earned $stage_cash on your contract day rate and an additional $job_cash for completing the contract.",

		["debug_interact_grenade_crate_take_grenades"] = "MANTÉN $BTN_INTERACT PARA REABASTECER TUS ARROJADIZAS",
		["debug_interact_bodybags_bag_take_bodybag"] = "MANTÉN $BTN_INTERACT PARA REABASTECER TUS BOLSAS DE CADÁVER Y BRIDAS",

		["menu_equipment_armor_kit"] = "CAJA DE ARROJADIZAS",
		["bm_equipment_armor_kit"] = "CAJA DE ARROJADIZAS",
		["debug_equipment_armor_kit"] = "CAJA DE ARROJADIZAS",
		["bm_equipment_armor_kit_desc"] = "Para usar la Caja de Arrojadizas, debes deplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer tus arrojadizas. \n\nTiene #{skill_color}#3## usos; puedes ver cuantos usos quedan mirando la caja. \n\nLa Caja de Arrojadizas es una caja ocultable, usualmente utilizada por un soldado o mercenario para transportar armamento especializado al campo de batalla.\n\n#{important_1}#NOTA: NO PUEDE SER USADA PARA RECUPERAR ARROJADIZAS DE TALENTOS.##",
		["bm_equipment_armor_kit_desc_short"] = "Para usar la Caja de Arrojadizas, debes deplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer tus arrojadizas. \n\nTiene #{skill_color}#3## usos; puedes ver cuantos usos quedan mirando la caja. \n\nLa Caja de Arrojadizas es una caja ocultable, usualmente utilizada por un soldado o mercenario para transportar armamento especializado al campo de batalla.\n\n#{important_1}#NOTA: NO PUEDE SER USADA PARA RECUPERAR ARROJADIZAS DE TALENTOS.##",
		--Ordnance Bag
		["bm_equipment_grenade_crate_desc"] = "Para usar la Bolsa de Artillería, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer #{skill_color}#25%## de munición de todas tus armas y #{skill_color}#1## arrojadiza.\n\nTiene #{skill_color}#4## usos; puedes ver cuantos usos quedan mirando la bolsa. \n\nLa Bolsa de Artillería es fácil de transportar, y suele ser usada por operativos de combate para transportar explosivos y otras armas arrojadizas al campo de batalla.\n\n#{important_1}#NOTA: NO PUEDE SER USADA PARA RECUPERAR ARROJADIZAS DE TALENTOS.##",
		["bm_equipment_grenade_crate_desc_short"] = "Para usar la Bolsa de Artillería, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer #{skill_color}#25%## de munición de todas tus armas y #{skill_color}#1## arrojadiza.\n\nTiene #{skill_color}#4## usos; puedes ver cuantos usos quedan mirando la bolsa. \n\nLa Bolsa de Artillería es fácil de transportar, y suele ser usada por operativos de combate para transportar explosivos y otras armas arrojadizas al campo de batalla.\n\n#{important_1}#NOTA: NO PUEDE SER USADA PARA RECUPERAR ARROJADIZAS DE TALENTOS.##",
		--Trip Mine
		["bm_equipment_trip_mine_desc"] = "Para usar la Mina De Sensor, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Esta se puede alternar entre modo explosivo o detector presionando #{skill_color}#$BTN_INTERACT.##\n\nPara usar una Carga Hueca, debes plantarla manteniendo #{skill_color}#$BTN_INTERACT.## Una vez que se haya plantado el número requerido de cargas, detonarán en unos segundos.\n\nLa mina de sensor es un dispositivo diseñado para eliminar o detectar a quienes pasen frente al láser. La carga hueca suele ser usada para abrir puertas o cajas fuertes. Ambas pueden ser muy útiles en un combate.",
		["bm_equipment_trip_mine_desc_short"] = "Para usar la Mina De Sensor, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Esta se puede alternar entre modo explosivo o detector presionando #{skill_color}#$BTN_INTERACT.##\n\nPara usar una Carga Hueca, debes plantarla manteniendo #{skill_color}#$BTN_INTERACT.## Una vez que se haya plantado el número requerido de cargas, detonarán en unos segundos.",
		--Ammo Bag
		["bm_equipment_ammo_bag_desc"] = "Para usar la Bolsa De Munición, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer la munición de las armas hasta #{skill_color}#$deployable_uses## veces; puedes ver cuantos usos quedan mirando la bolsa.\n\nLa Bolsa de Munición es fácil de transportar, y fue originalmente diseñada para que un soldado pudiese llevar más munición al combatir.",
		["bm_equipment_ammo_bag_desc_short"] = "Para usar la Bolsa De Munición, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegada no se puede mover, pero puede ser usada por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para recuperar munición.\n\nPuede ser usada para reabastecer la munición de las armas hasta #{skill_color}#$deployable_uses## veces; puedes ver cuantos usos quedan mirando la bolsa.",
		--ECM Jammer
		["bm_equipment_ecm_jammer_desc"] = "Para usar el Dispositivo ECM, debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover y estará activo por #{skill_color}#$deployable_uses## segundos.\n\nPuedes activar el efecto de acople interactuando con él. Éste tiene un radio de alcance de #{skill_color}#24## metros. El primer bucle tiene un #{skill_color}#100%## de probabilidad de aturdir a la mayoría de enemigos, y cada #{skill_color}#1.2## segundos después teniendo una probabilidad del #{skill_color}#60%## de aturdir. El efecto dura #{skill_color}#$deployable_uses## segundos y se recargará después de #{skill_color}#4## minutos.\n\nLos Dispositivos ECM pueden abrir cajeros y apagar temporalmente dispositivos electrónicos como teléfonos, cámaras y otros sistemas de detección.",
		["bm_equipment_ecm_jammer_desc_short"] = "Para usar el Dispositivo ECM, debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover y estará activo por #{skill_color}#$deployable_uses## segundos.\n\nPuedes activar el efecto de acople interactuando con él. Éste tiene un radio de alcance de #{skill_color}#24## metros. El primer bucle tiene un #{skill_color}#100%## de probabilidad de aturdir a la mayoría de enemigos, y cada #{skill_color}#1.2## segundos después teniendo una probabilidad del #{skill_color}#60%## de aturdir. El efecto dura #{skill_color}#$deployable_uses## segundos y se recargará después de #{skill_color}#4## minutos.",
		--FAQ U
		["bm_equipment_first_aid_kit_desc"] = "Para usar un Botiquín De Primeros Auxilios, debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para restaurar #{skill_color}#150## de salud.\n\nLos Botiquines solo pueden usar #{skill_color}#1## vez.\n\nEl Botiquín De Primeros Auxilios es un pequeño bolso que contiene suministros necesarios para administrar primeros auxilios rápidamente.",
		["bm_equipment_first_aid_kit_desc_short"] = "Para usar un Botiquín De Primeros Auxilios, debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para restaurar #{skill_color}#150## de salud.\n\nLos Botiquines solo pueden usar #{skill_color}#1## vez.",
		--AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		["bm_equipment_doctor_bag_desc"] = "Para usar el Botiquín Médico debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para restaurar #{skill_color}#20%## de su salud máxima y #{skill_color}#4%## de salud máxima cada #{skill_color}#5## segundos por #{skill_color}#3## minutos.\n\nLos Botiquines Médicos tienen #{skill_color}#$deployable_uses## usos; puedes ver cuantos usos quedan mirando el botiquín.\n\nEl Botiquín Médico es fácil de transportar, y suele ser usado por profesionales asociados con la medicina para llevar consigo suministros médicos y medicamentos para tratar heridas muy graves.",
		["bm_equipment_doctor_bag_desc_short"] = "Para usar el Botiquín Médico debes desplegarlo manteniendo #{skill_color}#$BTN_USE_ITEM.## Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para restaurar #{skill_color}#20%## de su salud máxima y #{skill_color}#4%## de salud máxima cada #{skill_color}#5## segundos por #{skill_color}#3## minutos.\n\nLos Botiquines Médicos tienen #{skill_color}#$deployable_uses## usos; puedes ver cuantos usos quedan mirando el botiquín.",
		--Sentry
		["bm_equipment_sentry_gun_desc"] = "Para usar la Torreta Portátil debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Al hacerlo, usará #{skill_color}#$deployable_uses## de tu munición máxima.\n\nPuedes recogerla manteniendo #{skill_color}#$BTN_INTERACT## mientras estás cerca; recogerla reembolsara la munición restante y la reparará.\n\nTras recibir mucho daño, se apagará. Mientras se encuentre en éste estado, interactuar con ella activara el modo de reparación automática.\n\nLas Torretas aterrorizan civiles, forzandolos a quedarse en el suelo.\n\nLa Torreta apunta y dispara automáticamente a objetivos detectados por sus sensores. Suele utilizarse como una distracción, desviando la atención de ti y tu equipo.",
		["bm_equipment_sentry_gun_desc_short"] = "Para usar la Torreta Portátil debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Al hacerlo, usará #{skill_color}#$deployable_uses## de tu munición máxima.\n\nPuedes recogerla manteniendo #{skill_color}#$BTN_INTERACT## mientras estás cerca; recogerla reembolsara la munición restante y la reparará.\n\nTras recibir mucho daño, se apagará. Mientras se encuentre en éste estado, interactuar con ella activara el modo de reparación automática.",
		--Supp. Sentry
		["bm_equipment_sentry_gun_silent_desc"] = "Para usar la Torreta Portátil Con Supresor debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Al hacerlo, usará #{skill_color}#$deployable_uses## de tu munición máxima.\n\nPuedes recogerla manteniendo #{skill_color}#$BTN_INTERACT## mientras estás cerca; recogerla reembolsara la munición restante y la reparará.\n\nTras recibir mucho daño, se apagará. Mientras se encuentre en éste estado, interactuar con ella activara el modo de reparación automática.\n\nLas Torretas aterrorizan civiles, forzandolos a quedarse en el suelo.\n\nLa Torreta Con Supresor es la contraparte de la Torreta Portátil, ya que se usa más para eliminar enemigos que como una distracción.",
		["bm_equipment_sentry_gun_silent_desc_short"] = "Para usar la Torreta Portátil Con Supresor debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM.## Al hacerlo, usará #{skill_color}#$deployable_uses## de tu munición máxima.\n\nPuedes recogerla manteniendo #{skill_color}#$BTN_INTERACT## mientras estás cerca; recogerla reembolsara la munición restante y la reparará.\n\nTras recibir mucho daño, se apagará. Mientras se encuentre en éste estado, interactuar con ella activara el modo de reparación automática.",
		--Body Bags
		["bm_equipment_bodybags_bag_desc"] = "Para usar la Caja De Bolsas Para Cadáveres, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM##. Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer tus bolsas de cadáver y bridas.\n\nTiene usos limitados; puedes ver cuantos usos quedan mirando la caja.\n\nLa Caja De Bolsas Para Cadáveres lleva bolsas y bridas adicionales, usadas para el transporte de cadáveres durante sigilo y controlar civiles.",
		["bm_equipment_bodybags_bag_desc_short"] = "Para usar la Caja De Bolsas Para Cadáveres, debes desplegarla manteniendo #{skill_color}#$BTN_USE_ITEM##. Una vez desplegado no se puede mover pero puede ser usado por ti y tu equipo manteniendo #{skill_color}#$BTN_INTERACT## para reabastecer tus bolsas de cadáver y bridas.\n\nTiene usos limitados; puedes ver cuantos usos quedan mirando la caja.",

		["hud_int_hold_take_pardons"] = "PRESIONA $BTN_INTERACT PARA TOMAR EL INDULTO",
		["debug_interact_gage_assignment_take"] = "PRESIONA $BTN_INTERACT PARA TOMAR EL PAQUETE",

		["hint_ability_no_grenade_pickup"] = "NO PUEDES TOMAR ARROJADIZAS DE TALENTO",
		["hint_full_grenades"] = "YA TIENES LA CANTIDAD MÁXIMA.",
		["debug_interact_ordnance_bag_take_grenades"] = "MANTÉN $BTN_INTERACT PARA TOMAR UNA ARROJADIZA Y MUNICIÓN",

		["far_repair_sentry_macro"] = "Torreta gravemente dañada, reparación necesaria.",
		["fixing_sentry_macro"] = "Progreso de reparación: $AMMO_LEFT",
		--Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
		["repair_sentry_macro"] = " para iniciar la secuencia de reparación automática",
		["pickup_sentry_macro"] = " para recuperar torreta.\n$AMMO_LEFT ammo left. ", --Gets % health remaining appended to the end.
		["firemode_sentry_macro"] = " para cambiar modo de tiro.\n$AMMO_LEFT ammo left.",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", --$AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "Reparando torreta...",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "ANIQUILACIÓN. PARA TI, LA ACCIÓN ES TODO.",
		["menu_risk_sm_wish"] = "DESOLACIÓN. AHORA DEMUESTRALES QUE NADA PUEDE DETENERTE.",

		--Loading Hints--
		--Restoration Gameplay Hints--
		["loading_gameplay_res_title"] = "Consejos de Gameplay de Restoration Mod", --Bob: Deberia traducir gameplay como jugabilidad?
		["loading_gameplay_res_1"] = "Los Cloakers emiten un sonido 'sibilante' cuando son agresivos con los jugadores. Úsalo para localizarlos.",
		["loading_gameplay_res_2"] = "Los Cloakers ya no emiten un zumbido ambiental ni chirrían al cargar.",
		["loading_gameplay_res_3"] = "Las pistolas son secundarias ideales para las primarias con tiempos de intercambio largos.",
		["loading_gameplay_res_4"] = "Los Tasers ya no recargan tus armas.",
		["loading_gameplay_res_5"] = "Los Cloakers pueden contrarrestar fácilmente a los jugadores solitarios o cortarles el paso.",
		["loading_gameplay_res_6"] = "Los Cloakers infligen daño directo a la salud cuando te patean. Esto se puede reducir con Desvío o la habilidad Contraataque.",
		["loading_gameplay_res_7"] = "Los Bulldozers verdes infligen grandes cantidades de daño y a menudo pueden romper incluso las armaduras más pesadas de un solo disparo.",
		["loading_gameplay_res_8"] = "Los Bulldozers Saiga/Negros intercambian daño por alta cadencia de fuego y cuentan con un impresionante cargador de tambor. También corren más rápido que otros bulldozers, pero tienen mucha menos salud y pueden ser aturdidos con explosivos.",
		["loading_gameplay_res_9"] = "Los Dozers/Skulldozers con ametralladora ligera lanzan un intenso fuego de supresión que empuja a corta distancia y disparan hasta que sus cinturones se vacían. Su blindaje superior puede recibir más daño que un dozer normal, pero se mueven con la misma lentitud que los Titandozers.",
		["loading_gameplay_res_10"] = "Los Dozers Escopeteros Benelli sustituyen a los Dozers Minigun, alta cadencia de fuego y buen daño. Una unión profana de dozers verdes y negros.",
		["loading_gameplay_res_11"] = "Es importante priorizar enemigos. Un Bulldozer de cualquier tipo merece más atención que un SWAT ligero.",
		["loading_gameplay_res_12"] = "En Desolación, los Bulldozers entran en una furia berserker cuando se rompen sus visores de cristal, lo que aumenta su daño en un 10%.",
		["loading_gameplay_res_13"] = "Los Cloakers emiten su icónico chillido cuando están por lanzarte una patada.",
		["loading_gameplay_res_14"] = "Las Patadas de Salto de Cloaker te esposarán en vez de derribarte.",
		["loading_gameplay_res_15"] = "Los flashbangs no se pueden romper en Desolación. Tu opinión, mi elección.",
		["loading_gameplay_res_16"] = "Puedes parar ataques cuerpo a cuerpo cargando los tuyos. Esto se puede mejorar para que funcione contra patadas de cloakers.",
		["loading_gameplay_res_17"] = "Los ataques enemigos cuerpo a cuerpo son rápidos y mortales. ¡Mantén distancia!",
		["loading_gameplay_res_18"] = "¿Sabes qué es mejor que golpear a los enemigos con un bate de béisbol? Golpearles en la cabeza con un bate de béisbol para hacerles daño adicional.",
		["loading_gameplay_res_19"] = "Los francotiradores se toman un breve periodo de tiempo para concentrarse antes de disparar. ¡Cuidado con sus láseres!",
		["loading_gameplay_res_20"] = "Tus Convertidos no están a salvo de ser pateados por Cloakers.",
		["loading_gameplay_res_21"] = "Los enemigos comunes de todas las facciones comparten detalles en sus uniformes para advertirte de su armamento preferido.",
		["loading_gameplay_res_22"] = "Los enemigos con escopeta son malos a distancia, pero lo compensan en distancias cortas.",
		["loading_gameplay_res_23"] = "Los enemigos utilizarán mejor los escudos en las dificultades más altas.",
		["loading_gameplay_res_24"] = "Los enemigos tendrán comportamientos diferentes en dificultades superiores.",
		["loading_gameplay_res_25"] = "La dificultad Desolación trae todo tipo de trucos desagradables para hacerte la vida imposible. No esperes que se anden con rodeos.",
		["loading_gameplay_res_26"] = "Los trabajos Pro ponen a prueba la habilidad de cada uno, ya que sólo permiten un intento para conseguir el premio, y permiten la aparición de las temidas unidades Bravo.",
		["loading_gameplay_res_27"] = "Restoration Mod proporciona diferentes facciones, como los mercenarios de Murkywater y los agentes de la ley de otros estados.",
		["loading_gameplay_res_28"] = "Los Cloakers usarán granadas de humo cuando realicen derribos en dificultades superiores.",
		--New Units Hints
		["loading_new_units_res_title"] = "Consejos de unidades de Restoration Mod",
		["loading_new_units_res_1"] = "Los ASUs de OMNIA proporcionarán bonificaciones de daño a los aliados cercanos marcados otorgándoles accesorios de láser Amarillo.",
		["loading_new_units_res_2"] = "Los LPF son débiles al cuerpo a cuerpo.",
		["loading_new_units_res_3"] = "Las unidades más ligeras recibirán exceso de curación por el LPF. Los enemigos se marcan en púrpura durante el proceso de exceso de curación.",
		["loading_new_units_res_4"] = "Los Cloaker Titán tienen un equipo de camuflaje avanzado que los hace casi invisibles, pero sigue teniendo el zumbido ambiental de los modelos más antiguos del equipo Cloaker estándar.",
		["loading_new_units_res_5"] = "Los Dozers Titán prefieren poner distancia entre ellos y su objetivo para desatar todo el potencial de sus cañones de riel sin ser molestados.",
		["loading_new_units_res_6"] = "Los Francotiradores Titán cambian el daño por disparo y la perforación de blindaje de sus contrapartes estándar por una mayor cadencia de fuego y la posibilidad de disparar en movimiento.",
		["loading_new_units_res_7"] = "En lugar de usar una mira láser, los disparos del Francotirador Titán dejan tras de sí trazas púrpuras.",
		["loading_new_units_res_8"] = "Los Escudos Titán se pueden perforar con rifles antimateria, con la sierra OVE9000 cuando se usa la habilidad Desgarrar y Destruir básico o con las balas AP especiales de las Sentry Guns. Incluso disparar a su escudo el tiempo suficiente puede hacer que lo suelten; ten cuidado con su repentino cambio de táctica cuando ocurra.",
		["loading_new_units_res_9"] = "El Capitán Spring y los Dozers Titán reciben daño adicional por disparos a la cabeza en todo momento.",
		["loading_new_units_res_10"] = "Los Taser Titán disparan balas eléctricas que restringen gravemente tus movimientos de forma temporal, lo que se indica mediante una imagen azul superpuesta en la interfaz de usuario.",
		["loading_new_units_res_11"] = "Los policías veteranos soltarán granadas lacrimógenas al morir si no se matan de un tiro en la cabeza.",
		["loading_new_units_res_12"] = "Los policías veteranos se mueven con rapidez, lo que dificulta el acertar los disparos.",
		["loading_new_units_res_13"] = "Los SWAT Titán vestidos con equipo antidisturbios son algo resistentes al cuerpo a cuerpo.",
		["loading_new_units_res_14"] = "Los SWAT Titán no pueden ser tomados como rehenes ni convertidos para luchar de tu lado.",
		["loading_new_units_res_15"] = "Los SWAT Titán cuentan con ametralladoras ligeras y escopetas automáticas que empujan o contusionan al enemigo.",
		["loading_new_units_res_16"] = "Las temidas unidades Bravo aparecen solo en Trabajos Pro, cuando se activa un PDNR. Son enemigos poderosos con armadura mejorada y armas más potentes.",
		["loading_new_units_res_17"] = "Las unidades Bravo pueden lanzar granadas de fragmentación. Presta atención a tu alrededor cuando las veas parpadear y emitir un pitido de cuenta atrás.",
		["loading_new_units_res_18"] = "AKAN comercializa sus propias unidades Titan denominadas Serie D, desarrolladas por su empresa de I+D DRAK.",
		["loading_new_units_res_19"] = "El Granadero lanza granadas de gas lacrimógeno a distancia con su accesorio bajo el cañón, dañando a los jugadores que se encuentren en la nube. En Desolación, viene armado con granadas de gas nervioso más mortíferas y que consumen resistencia.",
		["loading_new_units_res_20"] = "Los Escudos Titán tienen paneles cegadores montados en sus escudos. Cuando un panel se carga, puedes dispararle para detenerlo, rompiéndolo y aturdiendo brevemente a su portador en el proceso.",
		--Captain Hints
		["loading_captains_res_title"] = "Consejos de Capitán de Restoration Mod",
		["loading_captains_res_1"] = "La alta resistencia al daño del capitán Summers disminuye a medida que se elimina a cada miembro de su tripulación. Apunta primero al Doc, ya que puede curar al resto de su tripulación mientras siga en pie.",		
		["loading_captains_res_2"] = "No abraces al Capitán Summers. Te derretirá con su lanzallamas.",	
		["loading_captains_res_3"] = "El Capitán Spring puede recibir mucho daño, pero acabará cayendo. Ten cuidado con sus granadas y aprovecha su escasa movilidad.",	
		["loading_captains_res_4"] = "El Capitán Spring lanza granadas de racimo explosivas periódicamente.",	
		["loading_captains_res_5"] = "El Capitán Spring puede ser peligroso debido a su capacidad de empuje, pero es increíblemente lento y tiene poco alcance.",	
		["loading_captains_res_6"] = "El Capitán Autumn se burlará en voz alta cuando ataque.",	
		["loading_captains_res_7"] = "A diferencia de otros capitanes, la policía no anunciará la llegada de Autumn para no arruinar su factor sorpresa.",	
		["loading_captains_res_8"] = "El Capitán Autumn inutilizará progresivamente tus desplegables si se le permite permanecer activo sin ser detectado durante un tiempo. Los desplegables inutilizados aparecen en púrpura y solo pueden recuperarse si Autumn es encontrado y derrotado.",	
		["loading_captains_res_9"] = "Probablemente no vencerás al Capitán Autumn en una pelea a puñetazos. Ni lo intentes.",
		["loading_captains_res_10"] = "El capitán Winters tiene una gran resistencia a las balas y aún mayor a los explosivos y al fuego. A pesar de ello, es algo vulnerable al cuerpo a cuerpo.",	
		["loading_captains_res_11"] = "El escudo del Capitán Winters no puede ser perforado, pero se romperá tras absorber suficiente daño; al igual que los Escudos Titán, ten cuidado con su segunda fase.",
		["loading_captains_res_12"] = "El capitán Winters deambulará por el mapa, curando y otorgando exceso de curación a los enemigos cercanos.",
		["loading_captains_res_13"] = "El escudo del Capitán Winters tiene paneles cegadores como los que usan los Escudos Titán; sólo ten en cuenta que sus paneles cegadores no se rompen tras recibir un disparo.",	
		--Stealth Hints
		["loading_stealth_res_title"] = "Consejos de Sigilo de Restoration Mod",
		["loading_stealth_res_1"] = "El Puesto de Mando de seguridad enviará guardias para investigar el mal funcionamiento de las cámaras, lo que permitirá utilizarlo como señuelo.",	
		["loading_stealth_res_2"] = "Deshazte rápidamente de los guardias desprevenidos con un golpe cuerpo a cuerpo para robarles el localizador.",	
		["loading_stealth_res_3"] = "Es probable que el Puesto de Mando de seguridad note que faltan guardias y envíe refuerzos.",
		["loading_stealth_res_4"] = "Los guardias sin localizador no aumentan el nivel de sospecha cuando mueren.",	
		["loading_stealth_res_5"] = "Todas las armas ruidosas en sigilo tienen un radio de ruido fijo de 25 metros.",	
		["loading_stealth_res_6"] = "Los civiles se intimidaran en respuesta a los disparos, tanto en asalto como en sigilo.",	
		["loading_stealth_res_7"] = "Las Torretas Portátiles pacificarán a los civiles que se encuentren en un radio considerable a su alrededor.",	
		["loading_stealth_res_8"] = "Mientras llevas cualquier bolsa, puedes ser visto desde mucho más lejos, y también serás detectado mucho más rápido mientras estés de pie, esprintando o saltando. Mantente agachado y lento.",	
		["loading_stealth_res_9"] = "Tienes hasta 4 ECMs en lugar de 2 como en el juego base, pero tienen la mitad de duración.",	
		["loading_stealth_res_10"] = "Las armas silenciadas no generan ruido en sigilo.",	
		["loading_stealth_res_11"] = "Puedes tomar hasta 4 policías como rehenes en sigilo, como en asalto.",	
		["loading_stealth_res_12"] = "El sigilo es más permisivo, lo que permite una mayor recuperación.",	
		["loading_stealth_res_13"] = "Los guardias ya no morirán instantáneamente por cualquier fuente de daño mientras no estén alerta. Apunta a la cabeza y lleva algo más fuerte que tus puños.",	
		["loading_stealth_res_14"] = "Cuando el medidor de sospecha está lleno, tienes 60 segundos para terminar lo que empezaste antes de que salte la alarma.",
		["loading_stealth_res_15"] = "Cuanto más alto sea el medidor de sospecha, más fácil será ser detectado por los guardias.",	
		["loading_stealth_res_16"] = "Puedes llevar contigo más bolsas para cadáveres que en el juego base, y más aún si juegas en solitario.",
		["loading_stealth_res_17"] = "En el modo sin conexión de Crime.net, recibirás bridas adicionales para compensar la falta de jugadores. La cantidad sigue aumentando si tienes las habilidades adecuadas.",	
		["loading_stealth_res_18"] = "Los guardias que mueran por disparos activarán sus localizadores. Aunque la activación de los localizadores no aumenta las sospechas, ignorarlos sí lo hará.",	
		["loading_stealth_res_19"] = "Los operadores de localizadores son menos indulgentes con las dificultades más elevadas. Tu último localizador se indica mediante el uso de una línea de voz especial.",
		["loading_stealth_res_20"] = "Contestar a los localizadores por encima del límite permitido aumenta enormemente el medidor de sospecha, pero no tanto como dejar de contestar o no hacerlo.",
		["loading_stealth_res_21"] = "Los localizadores tardan más en contestarse y expiran más rápido en dificultades elevadas.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "Consejos de Equipamiento/Habilidades de Restoration Mod", --Bob: Esto quizas sea demasiado largo
		["loading_equip_skills_res_1"] = "Las escopetas pierden efectividad a larga distancia a medida que disminuye su precisión, mientras que una mayor precisión afecta a su capacidad para alcanzar múltiples objetivos; ¡experimenta y comprueba qué funciona mejor!",	
		["loading_equip_skills_res_2"] = "Las pistolas son más rápidas de cambiar en comparación con otras clases de armas.",
		["loading_equip_skills_res_3"] = "Las armas en Restoration Mod se dividen en varias clases con diferentes ventajas y desventajas. Las armas de mayor daño pueden matar a los enemigos más rápido, ¡pero pueden quedarse secas antes de que te des cuenta!",	
		["loading_equip_skills_res_4"] = "Las armas de mayor daño suelen ser menos ocultables a menos que tengan desventajas significativas, como la Precisión o la Cadencia de Fuego.",	
		["loading_equip_skills_res_5"] = "Wolf ha mejorado nuestras Torretas Portátiles para permitir reparaciones de campo. Tarda un poco, pero se repararán automáticamente cuando lo inicies.",	
		["loading_equip_skills_res_6"] = "Si tienes desbloqueados los cartuchos AP para Torretas Portátiles, puedes elegir tu tipo de munición por defecto en el menú de Equipamiento.",	
		["loading_equip_skills_res_7"] = "Los Talentos otorgan importantes bonificaciones de daño y muchos de ellos proporcionan raras y valiosas habilidades curativas.",	
		["loading_equip_skills_res_8"] = "Jefe de Equipo, Armero, Gorila, Criminal Común, Apostador y Motociclista son talentos básicos pero consistentes.",	
		["loading_equip_skills_res_9"] = "Espía fue rediseñado para convertirlo en un Talento con pocas habilidades de supervivencia y consistencia a largo plazo, pero a cambio te permite obtener enormes reservas de 'Salud temporal' para superar los momentos difíciles.",	
		["loading_equip_skills_res_10"] = "Jefe de Equipo es un Talento centrado en el equipo que otorga pequeñas pero útiles mejoras a ti y a tus compañeros de equipo, y más mejoras si tienes varios rehenes. Combina bien con el árbol de Controlador en Mente Maestra.",
		["loading_equip_skills_res_11"] = "Apostador es un Talento centrado en el equipo que otorga un poco de Salud y munición adicional a tus compañeros de equipo cuando recoges paquetes de munición. Combina bien con habilidades que otorgan paquetes de munición extra.",	
		["loading_equip_skills_res_12"] = "Maníaco es un Talento rápido y centrado en el equipo que reduce el daño que recibes tú y tus compañeros mientras sigas matando de forma consistente. Combina bien con builds de daño alto y builds con Resistencia al daño.",	
		["loading_equip_skills_res_13"] = "El ECM de bolsillo del Talento Hacker proporciona curación a todo el equipo y un potente control de masas, pero tarda mucho en recargarse. También es eficaz en sigilo.",	
		["loading_equip_skills_res_14"] = "Ladrón es una Talento centrado en la esquiva que promueve el agacharse durante un tiroteo.",	
		["loading_equip_skills_res_15"] = "Narcotraficante es un Talento versátil. El inyector puede usarse para autosustentarse, sobrevivir a grandes daños o alejar el fuego de tu equipo.",	
		["loading_equip_skills_res_16"] = "Pareja es un Talento centrado en el equipo que te permite proporcionar una gran cantidad de curación a un compañero de equipo específico, siempre y cuando ambos mantengan una matanza constante.",	
		["loading_equip_skills_res_17"] = "Las balas que atraviesen escudos infligirán la mitad de daño.",	
		["loading_equip_skills_res_18"] = "Los Revólveres Peacemaker y Phoenix .500 son capaces de perforar como un rifle de francotirador.",
		["loading_equip_skills_res_19"] = "Si tienes un medidor azul a un lado de la pantalla, entonces tienes esquiva. Cuando parpadee, esquivarás la siguiente bala. Consulta la Guía para obtener una explicación detallada de nuestro cambio en la mecánica de esquiva.",	
		["loading_equip_skills_res_20"] = "Cuanto mayor sea la movilidad de un arma, más rápido podrás desenfundarla y enfundarla.",	
		["loading_equip_skills_res_21"] = "La motosierra y la kazaguruma infligen daño a los enemigos que tengas delante mientras las cargas.",	
		["loading_equip_skills_res_22"] = "El Cuchillo Mariposa Wing y la Navaja Automática infligen mucho daño al apuñalar a los enemigos por la espalda.",
		["loading_equip_skills_res_23"] = "El Piolet y el Pico Gold Fever hacen más daño a la cabeza a cambio de poca velocidad.",	
		["loading_equip_skills_res_24"] = "El veneno inflige un daño moderado, pero provoca vómitos que interrumpen otras acciones.",	
		["loading_equip_skills_res_25"] = "Las Granadas Aturdidoras proporcionan una interrupción muy potente, incluso contra Bulldozers.",	
		["loading_equip_skills_res_26"] = "Al apuntar con la mira, la precisión aumenta considerablemente y el retroceso se reduce, incluso con las ametralladoras ligeras.",	
		["loading_equip_skills_res_27"] = "El arma cuerpo a cuerpo Pistola de Clabos Pounder tiene un alcance increíblemente largo, mucho más que cualquier otra arma cuerpo a cuerpo.",	
		["loading_equip_skills_res_28"] = "Al subir de nivel los Talentos se desbloquea la Caja de Arrojadizas.",
		["loading_equip_skills_res_29"] = "Al reponer tus arrojadizas en la caja de arrojadizas, se rellena toda tu reserva con cada uso.",	
		["loading_equip_skills_res_30"] = "Guarda Inspirar As para cuando las cosas se pongan realmente feas, tiene un tiempo de enfriamiento muy largo y requiere línea de visión.",	
		["loading_equip_skills_res_31"] = "Restoration Mod añade dos nuevos Talentos que proporcionan mayores ganancias de dinero y experiencia a cambio de desventajas. ¡Desafíate a ti mismo para obtener mejores recompensas!",
		["loading_equip_skills_res_32"] = "La mecánica de apuntar se ha modificado para que tengas que apuntar por completo para obtener los beneficios de la precisión. No pierdas de vista tu estadística \"T. Apuntado\" cuando modifiques tu arma.",
		["loading_equip_skills_res_33"] = "Los cañones largos, las culatas más robustas y los cargadores más largos tienen sus ventajas, pero pueden afectar a los tiempos de cambio, recarga, apuntado y esprint-a-apuntado.",
		["loading_equip_skills_res_34"] = "La velocidad cuerpo a cuerpo de las culatas de armas se ve afectada por el índice de movilidad del arma.",
		["loading_equip_skills_res_35"] = "La estadística \"T. Apuntado\" también sirve como la estadística \"Esprint-a-apuntado\". \"Esprint-a-apuntado\" es el tiempo que tardas en disparar tu arma después de dejar de esprintar.",
		["loading_equip_skills_res_36"] = "Durante el combate, los silenciadores reducen la probabilidad de que los enemigos intenten esquivar tus disparos. Pero ten en cuenta que el tiempo que pasen sin esquivarte lo dedicarán a dispararte.",
		["loading_equip_skills_res_37"] = "Al apuntar, las miras tienen una reducción del retroceso que escala con su nivel de aumento actual para ayudar a disparar a distancias más largas; esto tiene el coste de que los tiempos de apuntado son más lentos.",
		["loading_equip_skills_res_38"] = "La estadística \"Atravesar\" de las armas cuerpo a cuerpo representa a cuántos enemigos puedes golpear con un solo ataque.",
		--Misc Hints
		["loading_misc_res_title"] = "Consejos Varios de Restoration Mod",
		["loading_misc_res_1"] = "Prueba también nuestros trabajos personalizados. Puedes encontrar la mayoría de ellos bajo el Contacto 'Jackal', así como 'Vigilantes' bajo Vlad.",	
		["loading_misc_res_2"] = "¡Restoration Mod tiene una Guía de Steam! Este debería ser tu recurso para obtener información más detallada. Comprueba el Menú Principal.",
		["loading_misc_res_3"] = "¡Restoration Mod tiene un servidor Discord! (Solo en Inglés) Únete para discusiones, opiniones sobre el balance y emparejamiento. Comprueba el Menú Principal.", --Bob: Agrego una advertencia de que el servidor habla unicamente ingles	
		--Trivia Hints
		["loading_fluff_res_title"] = "Trivia de Restoration Mod",
		["loading_fluff_res_1"] = "OMNIA gasta una fortuna en revivir proyectos de armamento fallidos.",	
		["loading_fluff_res_2"] = "Al LPF se le deben muchas cervezas.",	
		["loading_fluff_res_3"] = "El LPF y el Francotirador Titán son australianos.",	
		["loading_fluff_res_4"] = "Al policía Bronco de Nueva York le encantan los donuts.",	
		["loading_fluff_res_5"] = "El SWAT de Élite ZEAL UMP se llama Chad.",	
		["loading_fluff_res_6"] = "Los Dozers Titán tienen ojos brillantes gracias a la ingeniería genética extensiva, los experimentos humanos y las drogas de combate.",	
		["loading_fluff_res_7"] = "El Capitán Spring no es humano. Pudo haberlo sido, alguna vez.",	
		["loading_fluff_res_8"] = "Los miembros de la comunidad y el equipo de desarrollo suelen apodar a Restoration Mod como 'resmod', 'SCmod', 'furry mod' y 'mememod'.",	
		["loading_fluff_res_9"] = "OMNIA ha estado desarrollando puertas de seguridad reforzadas para protegerse de ataques de dinosaurios.",	
		["loading_fluff_res_10"] = "El Granadero solía trabajar en el control de plagas.",	
		["loading_fluff_res_11"] = "Nunca has visto un Cloaker Titán.",
		["loading_fluff_res_12"] = "Omnia es una banda de 'folk pagano neocelta' autodenominada con sede en los Países Bajos y cuyos miembros han tenido orígenes irlandeses, holandeses, córnicos, belgas, indonesios y persas. Conexión con la organización OMNIA sin confirmar.", --Bob: No se si esto es una referencia a algo	
		["loading_fluff_res_13"] = "Sea lo que sea lo que provocó que Jackal se involucrara con Crime.Net y abandonara GenSec, se niega a hablar de ello. Parece haber sido 'perturbado' por el evento.",	
		["loading_fluff_res_14"] = "JAJAJAJAJA.",
		["loading_fluff_res_15"] = "El capitán Summers y su equipo solían ser un grupo de cuatro atracadores, algo así como un equivalente multinacional de la banda Payday. Ahora son un equipo de ataque de OMNIA.",
		["loading_fluff_res_16"] = "El Capitán Summers y su equipo murieron oficialmente en el derrumbe de un edificio mientras intentaban robar un banco. Esto fue una artimaña.",
		["loading_fluff_res_17"] = "El Capitán Autumn gasta una fortuna en grilletes.", --Bob: deberia poner esposas en vez de grilletes?
		["loading_fluff_res_18"] = "El Capitán Summers gasta una fortuna en gas gas gas.",
		["loading_fluff_res_19"] = "El Capitán Spring gasta una fortuna en balas y granadas.",
		["loading_fluff_res_20"] = "El capitán Winters gasta una fortuna en escudos y cinta aislante.",
		["loading_fluff_res_21"] = "La división de Granaderos gasta una fortuna en Diphoterine debido a varios incidentes de fuego amigo.",
		["loading_fluff_res_22"] = "Puede que hayas conocido al Capitán Summers antes o puede que no.",
		["loading_fluff_res_23"] = "La Policía Federal tiene una división especial de caza del chupacabras.",
		["loading_fluff_res_24"] = "Los capitanes no mueren, entran en custodia.",
		["loading_fluff_res_25"] = "AKAN ofrecía una 'represión rápida y brutal de los cárteles' a un precio más barato que OMNIA, lo que llevó a la Policía Federal a adoptar su versión de los soldados de la Serie D de DRAK. Se trataba de una estratagema para acercar sus fuerzas a las operaciones de OMNIA y Murky tanto en México como en Estados Unidos.",

		["menu_button_deploy_bipod"] = "BÍPODE/DISPARO-ALT",
		["hint_short_max_pagers"] = "No contestar los localizadores aumentará significativamente el nivel de sospecha.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "Como recién llegado a la élite criminal, lo primero que debes hacer es conseguir equipo y renombre propios de alguien de tu estatus.\n\nBONUS:\nTu probabilidad de obtener un objeto infame pasa de ##0.3%## a ##0.6%##\nLa experencia obtenida aumenta en un ##5%.##",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "Asalto",
		["st_menu_enforcer_armor"] = "Juggernaut",
		["st_menu_enforcer_ammo"] = "Soporte",
		["st_menu_technician_auto"] = "Ingeniero de Combate",
		["st_menu_technician_breaching"] = "Demoledor",
		["st_menu_technician_sentry"] = "Fortaleza",
		["st_menu_ghost_silencer"] = "Asesino a Sueldo",
		["hud_instruct_mask_on"] = "Presiona $BTN_USE_ITEM para equipar tu máscara",
		["hud_instruct_mask_on_alpha"] = "Presiona $BTN_USE_ITEM para equipar tu máscara",

		--Default Suit String
		["bm_suit_none_desc"] = "Este es el atuendo predeterminado del personaje con la armadura seleccionada. ¡Cambiará automáticamente del traje de dos piezas dependiendo del atraco seleccionado!",

		-- Ad Banner Change
		["menu_changelog"] = "Ultimas Notas de Cambios",
		["menu_discord"] = "Servidor de Discord",
		["menu_guide"] = "Guía del Mod",
		["menu_captains"] = "Información sobre Capitanes",
		["menu_content_updates"] = "Guía/Soporte",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "",
		["menu_mutators_category_holiday"] = "FESTIVOS",
		["menu_mutators_category_old_event"] = "EVENTOS",
		["menu_mutators_category_crime_spree"] = "RACHA CRIMINAL",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "Granaderos",
		["mutator_specials_override_sniper"] = "Francotirador",	
		
		["mutator_titandozers_desc"] = "Efectos festivos de Halloween",
		["mutator_titandozers_longdesc"] = "Los Bulldozers sin cabeza han escapado de las pesadillas de Wolf y se han hecho realidad. Los Bulldozers normales serán ahora sus variantes de Bulldozer sin cabeza y se activarán otros efectos de Halloween.",

		["mutator_medidozer_longdesc"] = "Todos los enemigos normales durante las oleadas de asalto se sustituyen por Médicos, y todas las unidades especiales se sustituyen por Bulldozers.",
		["mutator_medicdozers"] = "Dozers Médicos",
		["mutator_medicdozers_desc"] = "Ahora pueden aparecer Dozers Médicos.",
		["mutator_medicdozers_longdesc"] = "Siempre que aparezca un Bulldozer de cualquier tipo, hay un 50% de posibilidades de que sea reemplazado por un Bulldozer Médico. \n\nNOTA: Si el mutador de Bulldozer Con Escopeta Semiautomática está activado, el Bulldozer médico tendrá un 33,3% de posibilidades de reemplazar a un Bulldozer negro.",

		--Alternative arsenal
		["mutator_enemy_damage_longdesc"] = "Los jugadores recibirán un daño distinto al normal al ser golpeados por enemigos.",

		--Because of Training
		["mutator_enemy_health_longdesc"] = "Los enemigos aparecerán con una salud diferente a la normal, lo que los hará más fáciles o más difíciles de matar.",

		["mutator_notitans"] = "Cortes Presupuestarios",
		["mutator_notitans_desc"] = "Desactiva las Unidades Titán.",
		["mutator_notitans_longdesc"] = "Todas las apariciones de Unidades Titán están desactivadas.",
		
		["mutator_onlytitans"] = "Aumentos Presupuestarios",
		["mutator_onlytitans_desc"] = "Las unidades titán sustituyen a todas las unidades no titán.",
		["mutator_onlytitans_longdesc"] = "Todas las apariciones de unidades que no son titanes se sustituyen por unidades titanes.",

		["mutator_mememanonly"] = "JAJAJA, ¡OS ENGAÑÉ CHICOS!",
		["mutator_mememanonly_desc"] = "SUFRIMIENTO",
		["mutator_mememanonly_longdesc"] = "NOPUEDESCORRERNOHAYESCAPATORIAAYUDAAYUDAAYUDA\n\n ADVERTENCIA: Este mutador puede provocar crasheos en algunos mapas.",

		["MutatorMoreDonutsPlus"] = "Más Donuts+",
		["MutatorMoreDonutsPlus_desc"] = "Todos los enemigos comunes se sustituyen por Policías Bronco del NYPD, y todos los especiales se sustituyen por LPFs.",
		["MutatorMoreDonutsPlus_longdesc"] = "Todos los enemigos comunes se sustituyen por Policías Bronco del NYPD, y todos los especiales se sustituyen por LPFs. \n\nADVERTENCIA: Al activar este mutador, estás cometiendo una atrocidad.",

		["MutatorJungleInferno"] = "Jungla Infernal",
		["MutatorJungleInferno_desc"] = "Ahora todos los enemigos aparecen con lanzallamas.",
		["MutatorJungleInferno_longdesc"] = "Las armas estándar de todos los enemigos se sustituyen por lanzallamas.\n\nNota: Los francotiradores y los enemigos con escudo seguirán apareciendo con sus armas normales.",

		["mutator_minidozers"] = "Bulldozers Con Escopeta Semiautomática",
		["mutator_minidozers_desc"] = "Ahora pueden aparecer Bulldozers con escopetas semiautomáticas.",
		["mutator_minidozers_longdesc"] = "Cada vez que aparece un Bulldozer Negro, hay un 50% de posibilidades de que sea reemplazado por un Bulldozer con un M1014.\n\nNOTA: Si el mutador de Bulldozer médico está activado, el Bulldozer con escopeta semiautomática tendrá un 33,3% de posibilidades de sustituir a un Bulldozer negro.",

		["mutator_fatroll"] = "Rodada Gorda",
		["menu_mutator_fatroll"] = "Periodo de gracia (en segundos)",
		["mutator_fatroll_desc"] = "Valor de Gracia de Daño personalizado (en segundos).",
		["mutator_fatroll_longdesc"] = "La gracia de daño en jugadores y miembros del equipo controlados por la IA se cambia a un valor específico. La gracia de daño afecta a la frecuencia con la que se calculan las instancias de daño; los valores más bajos harán que recibas más daño en menos tiempo.",
		
		["mutator_overheal"] = "Experto En Exceso De Curación",
		["menu_mutator_overheal_mult_override"] = "Multiplicador De Exceso De Curación",
		["menu_mutator_overheal_mult_override_toggle"] = "Incluir Capitanes",
		["mutator_overheal_desc"] = "Ahora los LPFs pueden otorgar excesdo de curación a la mayoría de enemigos.",
		["mutator_overheal_longdesc"] = "Los LPFs ahora pueden otorgar excesdo de curación a todas las unidades de asalto (excepto a los Cloakers).\n\nNota: Algunas unidades seguirán utilizando su propio multiplicador de exceso de curación, independientemente de la configuración del Mutador.",
		
		["mutator_asu_buff"] = "Potencia Mejorada",
		["menu_mutator_captain_asu_buff_toggle"] = "Incluir Capitanes",
		["mutator_asu_buff_desc"] = "Ahora los ASUs pueden potenciar a la mayoría de las Unidades Especiales.",
		["mutator_asu_buff_longdesc"] = "Ahora los ASUs pueden potenciar a la mayoría de unidades especiales (excepto los Cloakers).",
		
		["mutator_bo_flashbang"] = "Tu Opinión - Mi elección",
		["menu_mutator_flashbang_cooking_time"] = "Tiempo de Detonación (en segundos)",
		["mutator_bo_flashbang_desc"] = "Las cegadoras ahora son indestructibles.",
		["mutator_bo_flashbang_longdesc"] = "Las cegadoras ahora son indestructibles; también se puede reducir el tiempo de detonación.",
		
		["mutator_grenade_mayhem"] = "¡Carnicería Total!",
		["menu_mutator_grenade_mayhem_usuals_toggle"] = "Incluir Comunes y Élites",
		["menu_mutator_grenade_mayhem_thugs_toggle"] = "Incluir Gangsters",
		["menu_mutator_grenade_mayhem_specials_toggle"] = "Incluir Especiales",
		["menu_mutator_grenade_mayhem_bosses_toggle"] = "Incluir Jefes",
		["menu_mutator_grenade_mayhem_captains_toggle"] = "Incluir Capitanes",
		--["menu_mutator_grenade_mayhem_sosa_cosplay_toggle"] = "Include Frag Underbarrels for Grenadiers",
		["mutator_grenade_mayhem_desc"] = "Los enemigos que no sean Bravo ahora pueden lanzar granadas de fragmentación.",
		["mutator_grenade_mayhem_longdesc"] = "Los enemigos que no sean Bravo ahora pueden lanzar granadas de fragmentación.\n\nNota: Los enemigos con lanzallamas usarán molotovs en lugar de granadas de fragmentación; los Cloakers usarán gas lacrimógeno en lugar de granadas de fragmentación.",
		
		["mutator_captain_replace"] = "Estación Eterna",	
		["menu_mutator_captain_replace_1"] = "Capitán (Día 1)",
		["menu_mutator_captain_replace_2"] = "Capitán (Día 2)",
		["menu_mutator_captain_replace_3"] = "Capitán (Día 3)",
		["menu_mutator_captain_replace_no_captain_override"] = "Sin Cambios",
		["menu_mutator_captain_replace_captain_random"] = "Al Azar",		
		["menu_mutator_captain_replace_winter"] = "Winters",
		["menu_mutator_captain_replace_autumn"] = "Autumn",
		["menu_mutator_captain_replace_spring"] = "Spring",
		["menu_mutator_captain_replace_summer"] = "Summers",
		["menu_mutator_captain_replace_hvh"] = "HHHTDFH",
		["menu_mutator_winter_blacklist_toggle"] = "Excluir a Winters para la opción \"Al Azar\"",
		["menu_mutator_spring_blacklist_toggle"] = "Excluir a Spring para la opción \"Al Azar\"",
		["menu_mutator_summer_blacklist_toggle"] = "Excluir a Summers para la opción \"Al Azar\"",
		["menu_mutator_autumn_blacklist_toggle"] = "Excluir a Autumn para la opción \"Al Azar\"",
		["menu_mutator_hvh_blacklist_toggle"] = "Excluir a HHHTDFH para la opción \"Al Azar\"",
		["mutator_captain_replace_desc"] = "Cambia el Capitán que aparece durante un Trabajo.",
		["mutator_captain_replace_longdesc"] = "El Capitán que aparecerá durante un atraco será el Capitán seleccionado.\n\nNota: Los Encuentros de Capitanes programados no cambiarán. Excluir a todos los capitanes de la opción \"Al Azar\" hará que se use la opción \"Sin Cambios\".",
		
		["mutator_no_outlines"] = "Realismo Experto",
		["mutator_no_outlines_desc"] = "La mayoría de contornos son desactivados.",
		["mutator_no_outlines_longdesc"] = "La mayoría de contornos están desactivados, así como las etiquetas de nombres sobre los jugadores/IA.",
		["menu_mutator_no_outlines_enemies_toggle"] = "Desactivar Contornos De Enemigos",
		["menu_mutator_no_outlines_objectives_toggle"] = "Desactivar Los Contornos De Resaltados (excepto escolta)",
		

		["mutator_spawn_mult"] = "Respuesta Amplificada",
		["menu_mutator_enemy_spawn"] = "MULTIPLICADOR DE APARICIÓN DE ENEMIGOS",
		["mutator_spawn_mult_desc"] = "Aumento de la aparición de enemigos.",
		["mutator_spawn_mult_longdesc"] = "Aparecerán más enemigos durante las fases de asalto. ¡A estilo Overkill™!", --Bob: Comprobar si se llaman fases de asalto o si tienen otro nombre
		
		["mutator_birthday"] = "Revienta Globos",
		["mutator_birthday_desc"] = "Matar Especiales generará globos que proporcionan potenciadores.",
		["mutator_birthday_longdesc"] = "Evento del 10º aniversario de PAYDAY:\n\nAl matar unidades especiales aparecerán globos a los que puedes disparar para dar bonificaciones a todo el equipo, ya sean directas o temporales, dependiendo de la unidad que hayas matado. Algunas unidades generan globos con más frecuencia que otras y varios potenciadores pueden estar activos al mismo tiempo.",

		["mutator_CG22"] = "Cuento de Criminal",
		["mutator_CG22_desc"] = "Algunos trabajos tendrán un árbol de navidad que generará regalos para triturar o entregar a Hajrudin.",
		["mutator_CG22_longdesc"] = "Evento de Navidad de PAYDAY 2 2022:\n\nLos Árboles de Navidad que aparecen en algunos trabajos dejan caer regalos de Navidad. Los regalos de Navidad se pueden triturar para obtener mejoras temporales durante el atraco o dárselos a Hajrudin para obtener experiencia extra, dinero o monedas del Continental. Al hacer cualquiera de las dos cosas, existe la posibilidad de que aparezca el Dozer Muñeco de Nieve con lanzahielos.",		

		["mutator_thecandlesburnoutforyou"] = "Maratón De Recarga",
		["mutator_thecandlesburnoutforyou_desc"] = "Debes recargar manualmente tu arma cuando el cargador se vacíe.",
		["mutator_thecandlesburnoutforyou_longdesc"] = "Debes recargar manualmente tu arma cuando el cargador se vacíe.",

		["mutator_letthesleepinggoddie"] = "Mártir De Los Cargadores",
		["mutator_letthesleepinggoddie_desc"] = "Perderás la munición actualmente cargada en tu arma tras recargar sin gastar toda la munición.",
		["mutator_letthesleepinggoddie_longdesc"] = "Perderás la munición actualmente cargada en tu arma tras recargar sin gastar toda la munición.\n\nNota: las armas que conservan su munición durante la recarga (recarga por cartucho, recarga de retención, etc.) así como las recargas activadas por habilidades no se ven afectadas por este mutador.",
		["mutator_letthesleepinggoddie_no_effect"] = "No se ve afectada por el mutador \"Mártir De Los Cargadores\".",


		["menu_cg22_post_objective_1_desc"] = "Mata 200 enemigos con cualquier rifle de francotirador.",
		["menu_cg22_post_objective_2_desc"] = "Mata a 15 Cloakers con el rifle SA North Star en la dificultad Muy Difícil o superior.", --Bob: Comprobar si el rifle tiene nombre
		["menu_cg22_post_objective_3_desc"] = "Consigue 50 muertes dobles con el rifle SA North Star en cualquier dificultad.",
		["menu_cg22_post_objective_4_desc"] = "Asegura 10 bolsas (seguido de un escape exitoso) en cualquier dificultad.",
		["menu_cg22_post_objective_5_desc"] = "Mata 10 Dozers en la dificultad Overkill o superior.",
		["menu_cg22_post_objective_6_desc"] = "Asegura 25 bolsas (seguido de un escape exitoso) en cualquier dificultad.",
		["menu_cg22_post_objective_7_desc"] = "Asegura 50 bolsas (seguido de un escape exitoso) en cualquier dificultad.",
		["menu_cg22_post_objective_8_desc"] = "Mata 20 Dozers en la dificultad Overkill o superior.",
		["menu_cg22_post_objective_9_desc"] = "Asegura 75 bolsas (seguido de un escape exitoso) en cualquier dificultad.",

		["mutator_piggybank"] = "Alimenta Al Cerdo", --Bob: Comprobar si Toda esta seccion tiene nombres ya traducidos en la oficial
		["mutator_piggybank_desc"] = "Los enemigos que mates dejarán caer Dólares de Cerdito para alimentar al Cerdo Dorado.",
		["mutator_piggybank_longdesc"] = "Evento del 9º aniversario de PAYDAY 2:\n\nLos enemigos que mates tendrán una probabilidad de dejar caer Dólares de Cerdito. Los Dólares de Cerdito son bolsas temporales que se pueden usar para hacer crecer el Cerdito Dorado en ciertos atracos, y cuanto más grande sea el Cerdito, más experiencia y dinero se obtendrá al final del atraco.",		

		["mutator_piggyrevenge"] = "La Venganza Del Cerdito", --Bob: Comprobar si Toda esta seccion tiene nombres ya traducidos en la oficial
		["mutator_piggyrevenge_desc"] = "Los enemigos que mates dejarán caer cerditos para alimentar al Cerdo Dorado y conseguir potenciadores.",
		["mutator_piggyrevenge_longdesc"] = "Evento del 10º aniversario de PAYDAY 2:\n\nLos enemigos que mates tendrán una posibilidad de soltar Dólares de Cerdito. Los Dólares de Cerdito son bolsas temporales que se pueden usar para hacer crecer el Cerdito Dorado y conseguir mejoras en ciertos trabajos, y al hacerlo existe la posibilidad de que aparezca el Dozer Cerdito con lanzallamas. Cuanto más grande sea el cerdito, más experiencia y dinero recibirás al final del asalto.",		

		["menu_pda10_post_objective_3_desc"] = "Completa 25 trabajos en cualquier dificultad",
		["menu_pda10_post_objective_5_desc"] = "Mata 50 enemigos con rifles de francotirador",
		["menu_pda10_post_objective_2_desc"] = "Asegura 50 bolsas",
		["menu_pda10_post_objective_6_desc"] = "Mata 50 enemigos con armas cuerpo a cuerpo",
		["menu_pda10_post_objective_1_desc"] = "Mata 50 Dozers",
		["menu_pda10_post_objective_4_desc"] = "Recoge 50 Paquetes de Gage",
		
		["mutator_bravos_only"] = "Línea Dura", --Bob: Esto esta bien traducido?
		["mutator_bravos_only_desc"] = "Los enemigos se reemplazan por sus equivalentes de PDNR.",
		["mutator_bravos_only_longdesc"] = "Las apariciones de enemigos no programadas se reemplazan por sus equivalentes en el Punto De No Retorno de los Trabajos-Pro. Los SWAT del FBI reemplazarán a los SWAT azules, y los SWAT del FBI serán reemplazados por unidades Bravo de la Guardia Nacional.",
		["menu_bravo_replacement_choice"] = "Método De Reemplazo",
		["menu_mutator_bravo_replacement_all"] = "Todas Las Unidades",
		["menu_mutator_bravo_replacement_random"] = "Probabilidad Al Azar",
		["menu_mutator_bravo_replacement_slider"] = "Probabilidad De Reemplazo (en %)",

		["mutator_zombie_outbreak"] = "Los Muertos Caminan", --Bob: No se si es una referencia a the walking dead
		["mutator_zombie_outbreak_desc"] = "Sustituye a todos los enemigos por unidades Zombie",
		["mutator_zombie_outbreak_longdesc"] = "¡Los muertos han resurgido! Sustituye a todos los enemigos por unidades Zombie",

		["mutator_faction_override"] = "Cambiar Facción Enemiga",
		["mutator_faction_override_desc"] = "",
		["mutator_faction_override_longdesc"] = "",
		["mutator_faction_override_"] = "",
		["mutator_faction_override_select"] = "",
		["mutator_faction_override_america"] = "América",
		["mutator_faction_override_russia"] = "Rusia",
		["mutator_faction_override_zombie"] = "Zombie",
		["mutator_faction_override_murkywater"] = "MurkyWater",
		["mutator_faction_override_nypd"] = "NYPD",
		["mutator_faction_override_lapd"] = "LAPD",
		["faction_selector_choice"] = "Facción: ",

		--Crime Spree mutators
		["mutator_cloakercuff"] = "Hechicero",
		["mutator_cloakercuff_desc"] = "Ahora los golpes cuerpo a cuerpo de Cloakers esposarán a los jugadores.",
		["mutator_cloakercuff_longdesc"] = "Los golpes cuerpo a cuerpo de los cloakers harán que los jugadores queden esposados.",
		
		["mutator_cloakerflashbang"] = "Ninja Deslumbrante",
		["mutator_cloakerflashbang_desc"] = "Los Cloakers tienen una probabilidad de soltar una cegadora cuando esquivan.",
		["mutator_cloakerflashbang_longdesc"] = "Ahora los Cloaker tendrán un 50% de probabilidad de soltar una cegadora al esquivar.",
		
		["mutator_fartsmella"] = "Suministros De \"Pesticida\"",
		["mutator_fartsmella_desc"] = "Las granadas de humo se reemplazan por gas lacrimógeno.",
		["mutator_fartsmella_longdesc"] = "Las granadas de humo desplegadas por los enemigos serán reemplazadas por gas lacrimógeno.\n\nNota: No sustituye a las granadas de humo del mutador \"Hazme más daño\".",
		
		["mutator_kaboom"] = "Kamikaze",
		["mutator_kaboom_desc"] = "Los Granaderos ahora explotan al morir.",
		["mutator_kaboom_longdesc"] = "Los Granaderos ahora explotan al morir.",
		
		["mutator_fastresponse"] = "Respuesta Rápida",
		["mutator_fastresponse_desc"] = "Todos los asaltos policiales empiezan con la máxima intensidad.",
		["mutator_fastresponse_longdesc"] = "Todos los asaltos policiales empiezan con la máxima intensidad.",
		
		["mutator_crazytaser"] = "Sobrecarga de Taser",
		["mutator_crazytaser_desc"] = "Las unidades Taser ya no tienen un retraso al apuntar cuando intentan aturdir a los jugadores.",
		["mutator_crazytaser_longdesc"] = "Las unidades Taser ya no tienen un retraso al apuntar cuando intentan aturdir a los jugadores.\n\nNota: Siguen aplicándose los tiempos de enfriamiento normales entre intentos.",

		["mutator_masterdodger"] = "¡Esquiva Esto!",
		["mutator_masterdodger_desc"] = "Los Policías Veteranos ahora esquivan todas las balas.",
		["mutator_masterdodger_longdesc"] = "Los Policías Veteranos ahora esquivan todas las balas.",
		
		["mutator_fullautoinbuilding"] = "Tiradores Rabiosos",
		["mutator_fullautoinbuilding_desc"] = "Los Francotiradores Titán y sus equivalentes dispararán sus rifles en modo automático a corta distancia.",
		["mutator_fullautoinbuilding_longdesc"] = "Los Francotiradores Titán y los Tiradores Bravo ahora disparan sus rifles a toda velocidad a corta distancia (a menos de 10 metros).",
		
		["mutator_quickscope360"] = "Ojo De Águila",
		["mutator_quickscope360_desc"] = "Los francotiradores ahora apuntan sus rifles un 100% más rápido.",
		["mutator_quickscope360_longdesc"] = "Los francotiradores ahora apuntan sus rifles un 100% más rápido.",
		
		["mutator_goldfarbdozers"] = "Doble Problema",
		["mutator_goldfarbdozers_desc"] = "Todos los Bulldozers que aparezcan se desplegarán siempre en parejas.",
		["mutator_goldfarbdozers_longdesc"] = "Todos los Bulldozers que aparezcan se desplegarán siempre en parejas.",
		
		["mutator_spoocsquad"] = "Escuadrón Sigiloso",
		["mutator_spoocsquad_desc"] = "Los Cloakers suelen aparecer en grupos.",
		["mutator_spoocsquad_longdesc"] = "Los Cloakers suelen aparecer en grupos.",
		
		["mutator_vanilla_police_call"] = "Alerta De Intrusos",
		["mutator_vanilla_police_call_desc"] = "Habilita el comportamiento del juego base para llamadas de policía, localizadores y cámaras.",
		["mutator_vanilla_police_call_longdesc"] = "Habilita el comportamiento del juego base para llamadas de policía, localizadores y cámaras.",
		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "Una Racha Criminal es una serie sin fin de trabajos seleccionados al azar, ejecutados en sucesión. Con cada trabajo que completes, tu rango y recompensa aumentarán. Cada 20 o 26 rangos tendrás que elegir un modificador y cada 100 rangos hay un aumento del nivel de riesgo, que hará que los siguientes trabajos sean más difíciles de completar. Después del nivel de riesgo 600, la cantidad de i-frames que tiene el jugador empieza a disminuir y las unidades bravo empiezan a aparecer normalmente.\n\n##Si invitas a tu equipo, asegúrate de que han empezado su propia Racha Criminal antes de unirse para obtener también rangos y Recompensas.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "Se permite un Bulldozer adicional en el nivel.",
		["menu_cs_modifier_medics"] = "Se permite un Médico adicional en el nivel.",
		["menu_cs_modifier_no_hurt"] = "Los enemigos tienen un 50% de resistencia al derribo.",
		["menu_cs_modifier_dozer_immune"] = "Los Bulldozers obtienen un 50% de resistencia al daño explosivo.",
		["menu_cs_modifier_bravos"] = "Los enemigos tienen una probabilidad adicional de 6,667% de convertirse en Unidades Bravo.",
		["menu_cs_modifier_grace"] = "Tu periodo de gracia de daño se reduce en una 60ª de segundo.", --Bob: Comprobar si el simbolo provoca problemas
		["menu_cs_modifier_letstrygas"] = "Las granadas de humo se reemplazan por gas lacrimógeno.",
		["menu_cs_modifier_boomboom"] = "Los Granaderos explotan al morir.",
		["menu_cs_modifier_friendlyfire"] = "Tú y tus compañeros de equipo reciben un 100% de daño por fuego amigo.",
		["menu_cs_modifier_dodgethis"] = "Los Policías Veteranos esquivan todas las balas.",
		["menu_cs_modifier_sniper_aim"] = "Los francotiradores apuntan sus rifles un 100% más rápido.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "Los SWAT con rifles ligeros tienen un 100% más de probabilidades de aparecer con una unidad de líder de escuadrón; además, puede aparecer una unidad de líder de escuadrón adicional en cada escuadrón.",
		["menu_cs_modifier_heavy_sniper"] = "Los Francotiradores Titán y los Tiradores Bravo dispararán sus rifles en modo automático a corta distancia.",
		["menu_cs_modifier_dozer_medic"] = "Siempre que aparece un Bulldozer, existe la posibilidad de que sea un Bulldozer Médico. Un Bulldozer Médico cuenta como Médico y como Bulldozer.",
		["menu_cs_modifier_dozer_minigun"] = "Cada vez que aparece un Bulldozer verde o negro, existe la posibilidad de que sea reemplazado por un Bulldozer con un M1014.",
		["menu_cs_modifier_shield_phalanx"] = "Todas las unidades de Escudo normales tienen un 15% de probabilidad adicional de convertirse en Escudos Titán.",
		["menu_cs_modifier_taser_overcharge"] = "Las unidades Taser ya no tienen un retraso al apuntar cuando intentan aturdir a los jugadores. Siguen aplicándose los tiempos de enfriamiento normales entre intentos.",
		["menu_cs_modifier_dozer_rage"] = "Cuando se destruye la placa frontal de un Bulldozer, éste entra en furia berserker y recibe un aumento del 10% de su daño base.",
		["menu_cs_modifier_medic_adrenaline"] = "Todas las unidades Médico tienen un 15% de probabilidad adicional de convertirse en un LPF de OMNIA o D-145 SIGMA FLAMER dependiendo de la facción.",
		["menu_cs_modifier_cloaker_arrest"] = "Los golpes cuerpo a cuerpo de Cloakers esposarán a los jugadores.",
		["menu_cs_modifier_cloaker_smoke"] = "Los Cloakers tendrán un 50% de probabilidad de soltar una cegadora al esquivar.",
		["menu_cs_modifier_cloaker_tear_gas"] = "Todas las unidades HRT tienen una probabilidad adicional del 15% de convertirse en una unidad ASU.", --Bob: Comprobar si las unidades tienen otro nombre
		["menu_cs_modifier_dozer_lmg"] = "Cada vez que aparece un Bulldozer verde o negro, existe la posibilidad de que sea reemplazado por un Skulldozer.",
		["menu_cs_modifier_10secondsresponsetime"] = "Todos los asaltos policiales empiezan con la máxima intensidad.",
		["menu_cs_modifier_dozerpairs"] = "Los Bulldozers aparecerán siempre en parejas.",
		["menu_cs_modifier_spoocsquad"] = "Los Cloakers ahora tienden a aparecer en grupos.",

		["bm_menu_skill"] = "Mejoras de Equipo",

		["menu_crew_interact"] = "Manos Rápidas",
		["menu_crew_interact_desc"] = "La velocidad de interacción de los jugadores aumenta en 15% por cada miembro del equipo controlado por la IA.",

		["menu_crew_inspire"] = "Inspiración",
		["menu_crew_inspire_desc"] = "Miembros del equipo controlados por la IA equipados con esta habilidad pueden usar la habilidad Inspiración As.\n\nNo pueden hacer esto más de una vez cada 90 segundos. El enfriamiento se reduce 15 segundos por cada miembro del equipo controlado por la IA.",

		["menu_crew_scavenge"] = "Recolección de Munición",
		["menu_crew_scavenge_desc"] = "La cantidad de munición que los jugadores obtienen al tomar paquetes de munición aumenta en 10% por cada miembro del equipo controlado por la IA.",

		["menu_crew_ai_ap_ammo"] = "Penetración",
		["menu_crew_ai_ap_ammo_desc"] = "Los miembros del equipo controlados por la IA usarán munición AP que inflige 25% de daño adicional.\n\nEsto les permite atravesar armadura corporal y derribar Escudos.",

		["menu_crew_healthy"] = "Fortalecedor",
		["menu_crew_healthy_desc"] = "La salud de todos los jugadores es aumentada por 30 puntos.",

		["menu_crew_sturdy"] = "Protector",
		["menu_crew_sturdy_desc"] = "El blindaje de todos los jugadores es aumentado por 10%.",

		["menu_crew_evasive"] = "Desorientador",
		["menu_crew_evasive_desc"] = "El medidor de esquiva de todos los jugadores se llena por 3% de su esquiva cada segundo.",

		["menu_crew_motivated"] = "Alentador",
		["menu_crew_motivated_desc"] = "La resistencia (para esprintar) de todos los jugadores es aumentada por 15 puntos.",

		["menu_crew_regen"] = "Curador",
		["menu_crew_regen_desc"] = "Todos los jugadores regeneran 1 de salud cada 4 segundos.",

		["menu_crew_quiet"] = "Ocultador",
		["menu_crew_quiet_desc"] = "La movilidad de todos los jugadores es aumentada por 2 puntos.",

		["menu_crew_generous"] = "Suministrador", --Bob: El original en inglés tiene un espacio al final??
		["menu_crew_generous_desc"] = "Cada jugador puede obtener una arrojadiza al matar a 70 enemigos.",

		["menu_crew_eager"] = "Estimulador",
		["menu_crew_eager_desc"] = "La velocidad de recarga de todos los jugadores es aumentada por 10%.",

	--[[   SKILLTREES   ]]--

		--[[   MASTERMIND   ]]--

			--[[   MEDIC SUBTREE   ]]--
				--Combat Medic
				["menu_combat_medic_beta_sc"] = "Médico Combatiente",
				["menu_combat_medic_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nObtienes una reducción de daño de #{skill_color}#$skill_value_b1## por #{skill_color}#$skill_value_b2## segundos mientras y después de revivir a otro jugador.\n\nAS: #{owned}#$pro##\nAl revivir a un jugador, este obtiene un #{skill_color}#$skill_value_p1## más de salud.",

				--Quick Fix
				["menu_tea_time_beta_sc"] = "Urgencia Médica",
				["menu_tea_time_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nReduce el tiempo de despliegue del Botiquín De Primeros Auxilios y el Botiquín Médico en #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nLos jugadores que utilicen tus Botiquines de Primeros Auxilios obtienen #{skill_color}#$skill_value_p1## de resistencia al daño por #{skill_color}#$skill_value_p2## segundos.",

				--Pain Killers
				["menu_fast_learner_beta_sc"] = "Analgésicos",
				["menu_fast_learner_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nJugadores que revivas obtienen #{skill_color}#$skill_value_b1## de resistencia al daño por #{skill_color}#$skill_value_b2## segundos.\n\nAS: #{owned}#$pro##\nLa reducción de daño aumenta en un #{skill_color}#$skill_value_p1## adicional.",

				--Uppers
				["menu_tea_cookies_beta_sc"] = "Estimulantes",
				["menu_tea_cookies_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes desplegar hasta #{skill_color}#$skill_value_b1## Botiquines de Primeros Auxilios.\n\nAS: #{owned}#$pro##\nPuedes desplegar hasta #{skill_color}#$skill_value_p1## Botiquines de Primeros Auxilios.\n\nTus Botiquines de Primeros Auxilios #{skill_color}#reaniman## jugadores que sean incapacitados a #{skill_color}#5## metros de el; esto no puede ocurrir más de una vez cada #{important_1}#$skill_value_p2## segundos a cada jugador.\n\n#{risk}#NOTA: Los Botiquines de Primeros Auxilios no reanimaran jugadores en Canto del Cisne.##",

				--Combat Doctor
				["menu_medic_2x_beta_sc"] = "Más Medicamentos",
				["menu_medic_2x_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus Botiquínes Médicos se pueden usar #{skill_color}#$skill_value_b1## vez más.\n\nAS: #{owned}#$pro##\nPuedes desplegar #{skill_color}#$skill_value_p1## Botiquínes Médicos.",

				--Inspire
				["menu_inspire_beta_sc"] = "Inspiración",
				["menu_inspire_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nReanimas jugadores un #{skill_color}#$skill_value_b1## más rápido.\n\nGritar a otros jugadores incrementará su velocidad de movimiento y recarga en #{skill_color}#$skill_value_b2## por #{skill_color}#$skill_value_b3## segundos.\n\nAS:#{owned}#$pro##\nPuedes gritar a jugadores incapacitados con los que tengas línea de visión en una distancia de hasta #{skill_color}#9## metros para reanimarlos; esto no puede ocurrir más de una vez cada #{important_1}#$skill_value_p1## segundos.",

			--[[   CONTROLLER SUBTREE   ]]--
				--Cable Guy
				["menu_triathlete_beta_sc"] = "Amistad Forzada",
				["menu_triathlete_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nIncrementa la cantidad de bridas que llevas contigo en #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nIncrementa la cantidad de bridas que llevas contigo en #{skill_color}#$skill_value_p1.## adicionales\n\nTu probabilidad de obtener bridas de paquetes de municion es aumentada hasta #{skill_color}#30%.##",

				--Clowns are Scary
				["menu_cable_guy_beta_sc"] = "Dominador",
				["menu_cable_guy_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLos civiles se mantienen intimidados un #{skill_color}#$skill_value_b1## más.\n\nAS: #{owned}#$pro##\nEl poder y alcance de tu intimidacion es incrementado por un #{skill_color}#$skill_value_p1.##",

				--Stockholm Syndrome
				["menu_joker_beta_sc"] = "SD. De Estocolmo",
				["menu_joker_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl estar incapacitado, Los civiles cercanos y enemigos convertidos te #{skill_color}#reanimaran cuando los llames## y te darán un paquete de munición.\n\nAS: #{owned}#$pro##\nPor cada rehén que el equipo tiene, todos obtienen #{skill_color}#$skill_value_p1## de absorción de daño; hasta un máximo de #{skill_color}#$skill_value_p2## rehenes.\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##",

				--Joker
				["menu_stockholm_syndrome_beta_sc"] = "Joker",
				["menu_stockholm_syndrome_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes convertir #{skill_color}#1## enemigo no especial para que luche a tu lado. Esto no funciona en sigilo y debes dominar al enemigo hasta que se haya esposado para poder convertirlo. Cuentan como rehenes para habilidades y pueden ser intercambiados por jugadores en custodia.\n\nTu convertido obtiene un #{skill_color}#$skill_value_b1## de resistencia al daño.\n\nAS: #{owned}#$pro##\nPuedes tener hasta #{skill_color}#2## convertidos a la vez.\n\nTus convertidos obtienen un #{skill_color}#$skill_value_p1## de resistencia al daño adicional.",

				--Partners in Crime
				["menu_control_freak_beta_sc"] = "Cómplices",
				["menu_control_freak_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de movimiento es incrementada por un #{skill_color}#$skill_value_b1## por cada rehén que tengas; hasta un maximo de #{skill_color}#4## rehenes.\n\nAS: #{owned}#$pro##\nTu salud es incrementada por un #{skill_color}#$skill_value_p1## por cada rehén que tengas; hasta un máximo de #{skill_color}#4## rehenes.",

				--Hostage Taker
				["menu_black_marketeer_beta_sc"] = "Secuestrador",
				["menu_black_marketeer_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nRegeneras #{skill_color}#$skill_value_b1## de salud cada #{skill_color}#4## segundos por cada rehén que tengas; hasta un máximo de #{skill_color}#4## rehenes.\n\nAS: #{owned}#$pro##\nLa regeneración de salud de esta habilidad es incrementada en #{skill_color}#$skill_value_p1## cuando tienes #{skill_color}#4 o más## rehenes.\n\n#{skill_color}#Los civiles atados por ti no intentaran huir## al ser rescatados.\n\n#{skill_color}#Un Rehén se intercambiará## por ti si entras en custodia durante un asalto en marcha.\n\n#{risk}#NOTA: Esto solo puede ocurrir## #{important_1}#1## #{risk}#vez por trabajo.##",

			--[[   ASSAULT SUBTREE   ]]--
				--Leadership
				["menu_stable_shot_beta_sc"] = "Liderazgo",
				["menu_stable_shot_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLas #{skill_color}#Ametralladoras## obtienen #{skill_color}#$skill_value_b1## de estabilidad.\n\nAS: #{owned}#$pro##\nTodos los jugadores obtienen #{skill_color}#$skill_value_p1## de estabilidad con #{skill_color}#todas las armas.##\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##",

				--MG Handling
				["menu_scavenger_sc"] = "Manejo de Subfusil",
				["menu_scavenger_desc_sc"] = "BÁSICA: #{owned}#$basic##\nMejora la precisión al disparar desde la cadera con #{skill_color}#ametralladoras## en #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nMejora la precisión al disparar desde la cadera con #{skill_color}#ametralladoras## en #{skill_color}#$skill_value_p1.## adicional\n\n#{skill_color}#Ametralladoras## recargan #{skill_color}#$skill_value_p2## más rápido.",

				--MG Specialist
				["menu_sharpshooter_sc"] = "Especialista de Subfusil",
				["menu_sharpshooter_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLa penalización de precisión al moverse se reduce en #{skill_color}#$skill_value_b1## con #{skill_color}#ametralladoras.##\n\nLa penalización de precisión al moverse depende de la estabilidad.\n\nAS: #{owned}#$pro##\nLas #{skill_color}#Ametralladoras## disparan #{skill_color}#$skill_value_p1## más rápido.\n\nCada #{skill_color}#5ta## bala disparada por una #{skill_color}#ametralladora## sin soltar el gatillo no consume munición.",

				--Shock and Awe
				["menu_spotter_teamwork_beta_sc"] = "Sorpresa y Asombro",
				["menu_spotter_teamwork_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLa capacidad del cargador de #{skill_color}#Todas las Armas## es incrementada en #{skill_color}#$skill_value_b1.##\n\n#{risk}#NOTA: No aplica a## #{important_1}#arcos, lanzagranadas o lanzacohetes.##\n\nAS: #{owned}#$pro##\nEl aumento de capacidad del cargador se incrementa en un #{skill_color}#$skill_value_p1## adicional.\n\n#{skill_color}#Todas las armas## pueden dispararse desde la cadera al esprintar sin retraso.",

				--Heavy Impact
				["menu_speedy_reload_sc"] = "Impacto Fuerte",
				["menu_speedy_reload_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLas #{skill_color}#Ametralladoras## tienen #{skill_color}#$skill_value_b1## de probabilidad de hacer que el enemigo se tambalee.\n\nEsta probabilidad es incrementada hasta #{skill_color}#$skill_value_b2## al usar un bípode.\n\n#{risk}#NOTA: No funciona en## #{important_1}#Capitanes, Bulldozers, Francotiradores, o Escudos.##\n\nAS: #{owned}#$pro##\nObtienes una reduccion de daño del #{skill_color}#$skill_value_p1## al estar agachado.\n\nEste efecto es incrementado hasta #{skill_color}#$skill_value_p2## al usar un bípode.",

				--Body Expertise
				["menu_body_expertise_beta_sc"] = "Regar y Rogar",
				["menu_body_expertise_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus armas infligen #{skill_color}#$skill_value_b1## de su daño a través de armadura corporal; este efecto es incrementado hasta #{skill_color}#$skill_value_b2## con #{skill_color}#ametralladoras.##\n\nEsto se agrega a cualquier capacidad de perforación de armadura, hasta un máximo de #{skill_color}#100%.##\n\nAS: #{owned}#$pro##\nBajas usando #{skill_color}#ametralladoras## en automático sin soltar el gatillo por más de #{skill_color}#$skill_value_p1## segundos les otorgaran un aumento de daño de #{skill_color}#$skill_value_p2## adicional; puede acumularse hasta #{skill_color}#$skill_value_p3## veces.",


		--[[   ENFORCER   ]]--

			--[[   SHOTGUNNER SUBTREE   ]]--
				--Underdog--
				["menu_underdog_beta_sc"] = "Mal Perdedor",
				["menu_underdog_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCuando 3 o más enemigos están a menos de #{skill_color}#18## metros de distancia, obtienes una bonificación de #{skill_color}#$skill_value_b1## de daño adicional por #{skill_color}#$skill_value_b2## segundos.\n\nAS: #{owned}#$pro##\nCuando 3 o más enemigos están a menos de #{skill_color}#18## metros de distancia, además obtienes #{skill_color}#$skill_value_p1## de resistencia al daño por #{skill_color}#$skill_value_p2## segundos.",

				--Shotgun CQB
				["menu_shotgun_cqb_beta_sc"] = "Manejo de Escopetas",
				["menu_shotgun_cqb_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de apuntado y velocidad de esprint-a-apuntado con #{skill_color}#escopetas y lanzallamas## es un #{skill_color}#$skill_value_b1## más rápido.\n\nAS: #{owned}#$pro##\n#{skill_color}#Escopetas y lanzallamas## recargan #{skill_color}#$skill_value_p1## más rápido.",
				["menu_shotgun_cqb_per_pellet_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de apuntado y velocidad de esprint-a-apuntado con #{skill_color}#escopetas y lanzallamas## es un #{skill_color}#$skill_value_b1## más rápido.\n\nAS: #{owned}#$pro##\n#{skill_color}#Escopetas y lanzallamas## recargan #{skill_color}#$skill_value_p1## más rápido.",

				--Shotgun Impact
				["menu_shotgun_impact_beta_sc"] = "Impacto de Escopetas",
				["menu_shotgun_impact_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\n#{skill_color}#Escopetas y lanzallamas## obtienen #{skill_color}#$skill_value_b1## de estabilidad.\n\nAS: #{owned}#$pro##\nLas #{skill_color}#Escopetas## disparan #{skill_color}#$skill_value_p1## más perdigones.\n\n#{risk}#NOTE: No aplica a escopetas usando munición AP o HE.##",
				["menu_shotgun_impact_per_pellet_desc_sc"] = "BÁSICA: #{owned}#$basic##\n#{skill_color}#Escopetas y lanzallamas## obtienen #{skill_color}#$skill_value_b1## de estabilidad.\n\nAS: #{owned}#$pro##\nEl Daño mínimo de #{skill_color}#escopetas## aumenta por #{skill_color}#$skill_value_p1.##\n\n#{risk}#NOTE: No aplica a escopetas usando munición AP o HE.##",

				--Pigeon Shooting
				["menu_far_away_beta_sc"] = "Tirador",
				["menu_far_away_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl usar una #{skill_color}#escopeta## que dispare multiples proyectiles, cada proyectil es capaz de atravesar #{skill_color}#1## enemigo e infligir #{skill_color}#$skill_value_b1## de su daño a través de armadura.\n\nEsto se agrega a cualquier capacidad de perforación de armadura que tu #{skill_color}#escopeta## pueda tener, hasta un máximo de #{skill_color}#100%.##\n\nAS: #{owned}#$pro##\nLa precisión y alcance de #{skill_color}#escopetas y lanzallamas## es aumentada en #{skill_color}#$skill_value_p1## al apuntar.",

				--Gung Ho
				["menu_close_by_beta_sc"] = "De Cerca",
				["menu_close_by_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTodas las #{skill_color}#escopetas y lanzallamas## pueden dispararse desde la cadera al esprintar sin retraso\n\nAS: #{owned}#$pro##\nAl disparar desde la cadera, la cadencia de #{skill_color}#escopetas y lanzallamas## es aumentada un #{skill_color}#$skill_value_p1.##",

				--Overkill
				["menu_overkill_sc"] = "OVERKILL",
				["menu_overkill_desc_sc"] = "BÁSICA: #{owned}#$basic##\nBajas antes de que comience la caida de daño usando daño directo de #{skill_color}#escopetas, lanzallamas o la sierra OVE9000## activan esta habilidad y les otorgan una bonificación de #{skill_color}#$skill_value_b1## a su daño máximo por #{skill_color}#$skill_value_b2## segundos.\n\n#{risk}#NOTA: No será activado ni tendrá ningún efecto con## #{important_1}#explosivos o daño con el tiempo.##\n\nAS: #{owned}#$pro##\nLa bonificación de daño ahora aplica a #{skill_color}#todas las armas## y dura #{skill_color}#$skill_value_p1## segundos.\n\n#{risk}#NOTA: La bonificación de daño no aplica a## #{important_1}#Lanzagranadas o Lanzacohetes.##\n\nTu velocidad para sacar y enfundar #{skill_color}#escopetas, lanzallamas y la sierra OVE9000## es #{skill_color}#$skill_value_p2## más rápida.",

			--[[   JUGGERNAUT SUBTREE   ]]--
				--Stun Resistance--
				["menu_oppressor_beta_sc"] = "Resilencia",
				["menu_oppressor_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLos ataques cuerpo a cuerpo de enemigos te empujan #{skill_color}#$skill_value_b1## menos por cada punto de blindaje que tengas.\n\nAS: #{owned}#$pro##\nReduce la duración del efecto visual de granadas cegadoras en #{skill_color}#$skill_value_p1.##",

				--Die Hard
				["menu_show_of_force_sc"] = "Duro de Matar",
				["menu_show_of_force_desc_sc"] = "BÁSICA: #{owned}#$basic##\nObtienes #{skill_color}#$skill_value_b1## de desviación.\n\nDesviación reduce la cantidad de daño a la salud que recibes, hasta un máximo de #{skill_color}#$deflection##, y se aplica después de otras formas de reducción de daño.\n\nAS: #{owned}#$pro##\nObtienes #{skill_color}#$skill_value_p1## de desviación adicionales.",

				--Transporter
				["menu_pack_mule_beta_sc"] = "Transporter",
				["menu_transporter_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPor cada #{skill_color}#10## puntos de blindaje, la penalización de movimiento al llevar bolsas en tu espalda es reducida un #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nPuedes esprintar con cualquier bolsa.\n\n#{risk}#NOTA: La penalización de movimiento sigue aplicando.##",

				--More Blood to Bleed--
				["menu_iron_man_beta_sc"] = "Más Sangre para Derramar",
				["menu_iron_man_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nObtienes #{skill_color}#$skill_value_b1## de salud extra.\n\nAS: #{owned}#$pro##\nObtienes #{skill_color}#$skill_value_p1## de salud extra adicionales.",

				--Bullseye--
				["menu_prison_wife_beta_sc"] = "Implacable",
				["menu_prison_wife_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nDisparos en la cabeza regeneran #{skill_color}#$skill_value_b1## de blindaje; esto no puede ocurrir más de una vez cada #{important_1}#$skill_value_b2## segundos.\n\nBajas con disparos en la cabeza reducen el enfriamiento #{skill_color}#$skill_value_b3## segundos. $anarc_disable\n\nAS: #{owned}#$pro##\nDisparos en la cabeza regeneran #{skill_color}#$skill_value_p1## de blindaje adicional.\n\nLa reducción de enfriamiento es incrementada #{skill_color}#$skill_value_p2## segundos adicionales. $anarc_disable\n\n",

				--Iron Man
				["menu_juggernaut_beta_sc"] = "Hombre de Acero",
				["menu_juggernaut_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes equipar la #{skill_color}#Armadura Corporal Experimental.##\n\nAl golpear con ataques cuerpo a cuerpo a escudos, se tambaleean por la fuerza del impacto.\n\n#{risk}#NOTA:## #{important_1}#Escudos Titán y el Capitán Winters## #{risk}#son inmunes a sus efectos.##\n\nAS: #{owned}#$pro##\nTu blindaje se regenera #{skill_color}#$skill_value_p1## más rápido. $anarc_disable\n\nTu habilidad para tambalear escudos ahora aplica con armas a distancia; las probabilidades aumentan dependiendo del daño total del arma.",

			--[[   SUPPORT SUBTREE   ]]--
				--Scavenger
				["menu_scavenging_sc"] = "Carroñero",
				["menu_scavenging_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLa distancia a la que puedes tomar paquetes de munición incrementa en #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nCada #{skill_color}#$skill_value_p1 to## enemigo que mates soltará un paquete de munición adicional.",

				--Bulletstorm--
				["menu_ammo_reservoir_beta_sc"] = "Lluvia de Balas",
				["menu_ammo_reservoir_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCualquier jugador que use bolsas de munición desplegadas por ti podrá disparar sin gastar munición por hasta #{skill_color}#5## segundos.\n\nCuanto más munición sea tomada, mas larga es la duración del efecto.\n\n#{risk}#NOTA:## #{risk}#Este efecto no aplica a## #{important_1}#lanzagranadas, lanzacohetes y armas usando munición explosiva.##\n\nAS: #{owned}#$pro##\nLa duracion máxima es aumentada hasta #{skill_color}#20## segundos.",

				--Specialist Equipment formally Rip and Tear
				["menu_portable_saw_beta_sc"] = "Equipo Especializado",
				["menu_portable_saw_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nReduce el desgaste de las hojas de la #{skill_color}#Sierra OVE9000## en #{skill_color}#50%.##\n\nAS: #{owned}#$pro##\nLa #{skill_color}#Sierra OVE9000, Arcos , Lanzacohetes y Lanzagranadas## recargan #{skill_color}#$skill_value_p1## más rápido.",

				--Extra Lead
				["menu_ammo_2x_beta_sc"] = "Más Plomo",
				["menu_ammo_2x_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus bolsas de munición contienen #{skill_color}#$skill_value_b1## más munición.\n\nAS: #{owned}#$pro##\nPuedes desplegar #{skill_color}#$skill_value_p1## bolsas de munición.",

				--Rip and Tear formally Carbon Blade
				["menu_carbon_blade_beta_sc"] = "Destroza y Desgarra",
				["menu_carbon_blade_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes cortar a través de escudos con la #{skill_color}#Sierra OVE9000.##\n\nAS: #{owned}#$pro##\nBajas con la #{skill_color}#Sierra OVE9000, Arcos, Lanzagranadas o Lanzacohetes## tienen #{skill_color}#$skill_value_p1## de probabilidad de causar pánico a enemigos en un radio de #{skill_color}#$skill_value_p2## metros.\n\nCuando un enemigo entra en pánico este será incapaz de atacar.",

				--Fully Loaded--
				["menu_bandoliers_beta_sc"] = "Armado Hasta Los Dientes",
				["menu_bandoliers_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus reservas de munición son aumentadas por un #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nLa munición que obtienes al tomar paquetes de munición es aumentada por un #{skill_color}#$skill_value_p1##.\n\nTu probabilidad base de obtener una arrojadiza es incrementada hasta #{skill_color}#$skill_value_p2##; esta probabilidad es aumentada por un #{skill_color}#$skill_value_p3## por cada paquete de munición que no contenga una, la probabilidad vuelve a su porcentaje original al obtener una arrojadiza.\n\n#{risk}#NOTA: No puedes recuperar arrojadizas de Talentos.##",

		--[[   TECHNICIAN   ]]--

			--[[   FORTRESS SUBTREE   ]]--
				--Logistician
				["menu_defense_up_beta_sc"] = "Logístico",
				["menu_defense_up_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nDespliegas e interactuas con todos los desplegables #{skill_color}#$skill_value_b1## más rápido.\n\nAS: #{owned}#$pro##\nDespliegas e interactuas con todos los desplegables un #{skill_color}#$skill_value_p1## más rápido adicional.\nTodos los jugadores interactuan con desplegables #{skill_color}#$skill_value_p2## más rápido.\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##",
	
				--Nerves of Steel--
				["menu_fast_fire_beta_sc"] = "Nervios de Acero",
				["menu_fast_fire_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes #{skill_color}#apuntar al ser incapacitado.##\n\nAS: #{owned}#$pro##\nObtienes una bonificación de #{skill_color}#$skill_value_p1## de resistencia al daño mientras interactuas con objetos.",
	
				--Engineering
				["menu_eco_sentry_beta_sc"] = "Ingeniería",
				["menu_eco_sentry_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus torretas obtienen #{skill_color}#$skill_value_b1## de salud extra.\n\nAS: #{owned}#$pro##\nTus torretas obtienen #{skill_color}#$skill_value_p1## de salud extra adicional.",
	
				--Jack of all Trades
				["menu_jack_of_all_trades_beta_sc"] = "Todólogo",
				["menu_jack_of_all_trades_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes llevar un #{skill_color}#$skill_value_b1## más de arrojadizas.\n\n#{risk}#NOTA: No aplica a arrojadizas de talentos.##\n\nAS: #{owned}#$pro##\n#{skill_color}#Puedes llevar un desplegable secundario contigo.## Presiona #{skill_color}#$BTN_CHANGE_EQ## para alternar entre desplegables.\n\nSolo podrás llevar un #{important_1}#50%## de dicho desplegable al equiparlo como secundario, hasta un mínimo de #{skill_color}#1.##",
	
				--Sentry Tower Defense--
				["menu_tower_defense_beta_sc"] = "Defensa de Torre-Ta",
				["menu_tower_defense_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes alternar el modo de disparo de tus torretas para usar #{skill_color}#munición AP##, esta reduce la cadencia por un #{skill_color}#66%## permitiendole atravesar enemigos y escudos.\n\nAS: #{owned}#$pro##\nPuedes llevar un máximo de #{skill_color}#$skill_value_p1## torretas.\n\nLas torretas ahora usarán #{skill_color}#35%## de tu munición máxima al desplegarse.",
	
				--Bulletproof--
				["menu_iron_man_sc"] = "A Prueba de Balas",
				["menu_iron_man_desc_sc"] = "BÁSICA: #{owned}#$basic##\nNo puedes recibir daño a la salud hasta que se haya roto tu blindaje.\n\n#{risk}#NOTA: No bloquea el daño por caída, el daño de tu propio equipamiento ni el daño recibido al ser derribado por patadas de Cloaker y descargas de Taser.##\n\nAS: #{owned}#$pro##\nMientras tu blindaje esté completo, el daño recibido se reduce en un número de puntos equivalente a #{skill_color}#$skill_value_p1## de tu blindaje máximo.\n\nTu blindaje se regenera #{skill_color}#$skill_value_p2## más rápido. $anarc_disable",

			--[[   BREACHER SUBTREE   ]]--
				--Silent Drilling--
				["menu_hardware_expert_beta_sc"] = "Experto en Herramientas",
				["menu_hardware_expert_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus #{skill_color}#taladros y sierras no emiten ruido##, civiles y guardias deben verlos para alertarse.\n\nAS: #{owned}#$pro##\nArreglas taladros y sierras un #{skill_color}#$skill_value_p1## más rápido.",
	
				--Demoman
				["menu_trip_mine_expert_beta_sc"] = "Demoman",
				["menu_combat_engineering_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes desplegar hasta #{skill_color}#6## cargas huecas.\n\nDespliegas cargas huecas y minas sensor un #{skill_color}#$skill_value_b1## más rápido.\n\nAS: #{owned}#$pro##\nPuedes desplegar hasta #{skill_color}#8## cargas huecas.\n\nEl alcance de explosión de tus minas sensor es incrementado por un #{skill_color}#$skill_value_p1.##",
	
				--Drill Sawgeant
				["menu_drill_expert_beta_sc"] = "Sierralanzataladros",
				["menu_drill_expert_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nEl tiempo que tardan tus taladros, sierras, y lanzas térmicas para finalizar es reducido por un #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nLa reducción de tiempo es aumentada un #{skill_color}#$skill_value_p1.##",
	
				--Fire Trap--
				["menu_more_fire_power_sc"] = "Trampas Incendiarias",
				["menu_more_fire_power_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus minas sensor dispersan fuego al detonar por #{skill_color}#10## segundos en un radio de #{skill_color}#7.5## metros.\n\nEl fuego producido por las minas no inflige daño a jugadores o aliados.\n\nAS: #{owned}#$pro##\nPuedes desplegar #{skill_color}#10## minas sensor.\n\nTus minas infligen #{skill_color}#50%## de daño extra.",
	
				--Expert Hardware
				["menu_kick_starter_beta_sc"] = "Hardware Experto",
				["menu_kick_starter_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl romperse, tus taladros sierras y lanzas térmicas tienen un #{skill_color}#$skill_value_b1## de probabilidad de reiniciarse automáticamente.\n\nAS: #{owned}#$pro##\nLa probabilidad es incrementada un #{skill_color}#$skill_value_p1## adicional.\n\nEnemigos que intenten sabotear tus sierras o taladros tienen un #{skill_color}#$skill_value_p2## de probabilidad de ser electrocutados, deteniendo su intento de sabotaje.",
	
				--Kickstarter
				["menu_fire_trap_beta_sc"] = "Golpe de Arranque",
				["menu_fire_trap_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes reiniciar taladros, sierras o lanzas térmicas con un ataque cuerpo a cuerpo.\n\nPuedes intentarlo #{skill_color}#1## vez por cada vez que se rompan. Esto tiene un #{skill_color}#75%## de probabilidad de funcionar.\n\nAS: #{owned}#$pro##\n#{skill_color}#No guardas tus armas al interactuar con objetos.##\n\nPuedes mirar alrededor, apuntar, y usar tus armas libremente sin detener la interacción, siempre y cuando continúes manteniendo presionada la tecla de interacción y permanezcas dentro del alcance de la interacción.",

			--[[   COMBAT ENGINEER SUBTREE   ]]--
				--Sharpshooter--
				["menu_discipline_sc"] = "Pulso Firme",
				["menu_discipline_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus #{skill_color}#Rifles## obtienen #{skill_color}#$skill_value_b1## de estabilidad.\n\nAS: #{owned}#$pro##\nBajas con disparos en la cabeza usando #{skill_color}#rifles## en modo de disparo semiautomático o ráfaga incrementan la cadencia por #{skill_color}#$skill_value_p1## durante #{skill_color}#$skill_value_p2## segundos.",

				--Rifleman--
				["menu_rifleman_sc"] = "Tirador de Élite",
				["menu_rifleman_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus #{skill_color}#Rifles## obtienen #{skill_color}#$skill_value_b1## precisión y alcance al apuntar.\n\nAS: #{owned}#$pro##\nTus #{skill_color}#Rifles## obtienen otro #{skill_color}#$skill_value_p1## de precisión y alcance al apuntar.\n\nTu velocidad de apuntado y esprint-a-apuntado con #{skill_color}#rifles## es un #{skill_color}#$skill_value_p2## más rápido.",

				--Kilmer--
				["menu_heavy_impact_beta_sc"] = "Fusilero",
				["menu_heavy_impact_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLa penalización de preicisión al moverse se reduce en #{skill_color}#$skill_value_b1## con #{skill_color}#rifles.##\n\nLa penalización de precisión al moverse depende de la estabilidad.\n\nAS: #{owned}#$pro##\nTus #{skill_color}#rifles## recargan #{skill_color}#$skill_value_p1## más rápido.",

				--Ammo Efficiency--
				["menu_single_shot_ammo_return_sc"] = "Eficiencia Municiosa",
				["menu_single_shot_ammo_return_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl obtener #{skill_color}#$skill_value_b1## bajas con disparos en la cabeza usando #{skill_color}#rifles## en menos de #{skill_color}#$skill_value_b2## segundos, se te devolverá #{skill_color}#$skill_value_b3## de tu munición total, hasta un mínimo de #{skill_color}#1## bala.\n\nAS: #{owned}#$pro##\nEl efecto se activa al obtener #{skill_color}#$skill_value_p1## bajas con disparos en la cabeza en menos de #{skill_color}#$skill_value_p2## segundos.",

				--Aggressive Reload--
				["menu_engineering_beta_sc"] = "Recarga Agresiva",
				["menu_engineering_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nBajas con disparos a la cabeza usando #{skill_color}#rifles## en modo de disparo semiautomático o ráfaga incrementarán tu velocidad de recarga por #{skill_color}#$skill_value_b1## durante #{skill_color}#$skill_value_b2## segundos.\n\nAS: #{owned}#$pro##\nEl aumento de velocidad de recarga se incrementa hasta #{skill_color}#$skill_value_p1## y puede ser activada independientemente del modo de disparo.",

				--Mind Blown, formerly Explosive Headshot--
				["menu_kilmer_sc"] = "Daño Colateral",
				["menu_kilmer_desc_sc"] = "BÁSICA: #{owned}#$basic##\nDisparos en la cabeza usando #{skill_color}#rifles## en modo de disparo semiautomático o ráfaga infligen #{skill_color}#$skill_value_b1## del daño hecho al enemigo más cercano en un radio de #{skill_color}#$skill_value_b2## metros.\n\nPor cada #{skill_color}#$skill_value_b3## metros de distancia entre el enemigo y tu, el efecto encadena a un enemigo adicional; hasta un máximo de #{skill_color}#$skill_value_b4## veces.\n\nAS: #{owned}#$pro##\nLos disparos en la cabeza usando #{skill_color}#rifles## en modo de disparo semiautomático o ráfaga #{skill_color}#no tienen caída de daño## y el radio del efecto es incrementado en #{skill_color}#$skill_value_p1## metro.\n\nPor cada #{skill_color}#$skill_value_b3## metros de distancia entre el enemigo y tu, el efecto inflige un #{skill_color}#$skill_value_p2## de daño adicional; hasta un total de #{skill_color}#$skill_value_p3## del daño hecho.",

		--[[   GHOST   ]]--

			--[[   SHINOBI SUBTREE   ]]--
				--Alert--
				["menu_jail_workout_sc"] = "Alerta",
				["menu_jail_workout_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAumenta la duración de los contornos al marcar enemigos por un #{skill_color}#100%.##\n\nAS: #{owned}#$pro##\n#{skill_color}#Marcas automáticamente## a guardias, especiales, y enemigos de élite a una distancia de #{skill_color}#40## metros apuntando con tus armas.\n\n#{risk}#NOTA: Solo puedes marcar guardias en sigilo.##",

				--Sixth Sense--
				["menu_chameleon_beta_sc"] = "Sexto Sentido",
				["menu_chameleon_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes #{skill_color}#marcar automáticamente## a enemigos en un radio de #{skill_color}#10## metros despues de quedarte quieto por #{skill_color}#3.5## segundos.\n\nAS: #{owned}#$pro##\nPuedes #{skill_color}#comprar recursos especiales## en el menú de resumen del trabajo o planificación previa.",

				--ECM Overdrive--
				["menu_cleaner_beta_sc"] = "ECM al Máximo",
				["menu_cleaner_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTus Dispositivos ECM pueden #{skill_color}#abrir ciertas puertas electrónicas.##\n\nAS: #{owned}#$pro##\nLa duración del Dispositivo ECM y el efecto de acople es incrementado por un #{skill_color}#25%.##\n\n##Tus Dispositivos ECM pueden retrasar los localizadores que llevan la mayoría de los guardias.##",

				--Nimble--
				["menu_second_chances_beta_sc"] = "Dedos Mágicos",
				["menu_second_chances_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes #{skill_color}#forzar y abrir cajas fuertes silenciosamente.##\n\nInteractuas con todas las computadoras, hackeos, camaras, y ECMs un #{skill_color}#30%## más rápido.\n\nAS: #{owned}#$pro##\nTu velocidad para forzar cerraduras es un #{skill_color}#50%## más rápida.\n\nInteractuas con todas las computadoras, hackeos, camaras, y ECMs un #{skill_color}#50%## más rápido adicional.",

				--ECM Specialist--
				["menu_ecm_booster_beta_sc"] = "Especialista en ECM",
				["menu_ecm_booster_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes desplegar #{skill_color}#3## Dispositivos ECM.\n\nAS: #{owned}#$pro##\nPuedes desplegar #{skill_color}#4## Dispositivos ECM.",

				--Spotter--
				["menu_ecm_2x_beta_sc"] = "HVT",
				["menu_ecm_2x_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nEl daño infligido a enemigos marcados por ti aumenta en #{skill_color}#$skill_value_b1## cuando están a más de #{risk}#$skill_value_b2## metros de distancia.\n\nAS: #{owned}#$pro##\nEl daño infligido a enemigos marcados por ti aumenta en #{skill_color}#$skill_value_p1## #{skill_color}#a cualquier distancia.##",

			--[[   ARTFUL DODGER SUBTREE   ]]--
				--Duck and Cover--
				["menu_sprinter_beta_sc"] = "Velocista",
				["menu_sprinter_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu resistencia (para esprintar) empieza a regenerarse un #{skill_color}#25%## antes y un #{skill_color}#25%## más rápido.\n\nAS: #{owned}#$pro##\nTu medidor de esquiva se llena un #{skill_color}#$skill_value_p1## de tu esquiva cada segundo mientras estas agachado.\n\nObtienes una bonificación de velocidad de movimiento de #{skill_color}#$skill_value_p2## al estar agachado.",

				--Evasion--
				["menu_awareness_beta_sc"] = "Corredor",
				["menu_awareness_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de movimiento es aumentada por un #{skill_color}#$skill_value_b1##.\n\nEl daño de caida que recibes se reduce en #{skill_color}#$skill_value_b2.##\n\nAS: #{owned}#$pro##\nPuedes #{skill_color}#recargar tus armas al esprintar.##\n\n#{item_stage_2}#Puedes encontrar una opción para permitir cancelar la recarga al esprintar en Opciones Adicionales De Restoration Mod.##",

				--Deep Pockets--
				["menu_thick_skin_beta_sc"] = "Bolsillos Profundos",
				["menu_thick_skin_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLa movilidad de todas las armas cuerpo a cuerpo es aumentada por #{skill_color}#2.##\n\nAS: #{owned}#$pro##\nLa movilidad de todos los chalecos antibalas es aumentada por #{skill_color}#4## y todas las demás armaduras por #{skill_color}#2.##",

				--Moving Target--
				["menu_dire_need_beta_sc"] = "Objetivo Móvil",
				["menu_dire_need_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de movimiento es aumentada por un #{skill_color}#$skill_value_b1%## por cada #{risk}#$skill_value_b2## puntos de carga por debajo de #{risk}#$skill_value_b3##, hasta un máximo de #{skill_color}#$skill_value_b4.##\n\nTe mueves un #{skill_color}#$skill_value_b5## más rápido al apuntar con tus armas.\n\n#{risk}#NOTA: Tu velocidad de movimiento al apuntar está limitada a tu velocidad máxima.##\n\nAS: #{owned}#$pro##\nTu velocidad de movimiento es aumentada por un #{skill_color}#$skill_value_p1## por cada #{risk}#$skill_value_p2## puntos de carga por debajo de #{risk}#$skill_value_p3##, hasta un máximo de #{skill_color}#$skill_value_p4.##\n\nTu medidor de esquiva se llena un #{skill_color}#$skill_value_p5## de tu esquiva cada segundo mientras esprintas y por un #{skill_color}#$skill_value_p6## de tu esquiva cada segundo mientras usas una tirolesa.",

				--Shockproof
				["menu_insulation_beta_sc"] = "Antichoque",
				["menu_insulation_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\n#{skill_color}#Al ser electrocutado ya no disparas involuntariamente## y el ataque electrico de un taser tiene una probabilidad del #{skill_color}#$skill_value_b2## de fallar, derribandolo en el proceso.\n\n#{risk}#NOTA: Las penalizaciones de precisión y estabilidad siguen aplicando.##\n\nEl empuje que recibes de disparos enemigos se reduce por un #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nAl interactuar con un taser enemigo en menos de #{skill_color}#$skill_value_p1## segundos de ser electrocutado lo #{skill_color}#contrarrestarás##, infligiendo #{skill_color}#$skill_value_p2## de su vida máxima como daño.\n\nLos efectos de ralentización y la duración de los ataques de los Tasers Titán se reducen por un #{skill_color}#50%.##",

				--Sneaky Bastard--
				["menu_jail_diet_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu esquiva aumenta por #{skill_color}#$skill_value_b1## punto por cada #{risk}#$skill_value_b2## puntos de carga por debajo de #{risk}#$skill_value_b3##, hasta un máximo de #{skill_color}#$skill_value_b4.##\n\nAS: #{owned}#$pro##\nTu esquiva aumenta por #{skill_color}#$skill_value_b1## punto por cada #{risk}#$skill_value_p1## puntos de carga por debajo de #{risk}#$skill_value_b3##, hasta un máximo de #{skill_color}#$skill_value_b4.##\n\nCuando tu blindaje se rompe, el primer ataque que esquives restaurará un #{skill_color}#$skill_value_p2## de tu salud máxima.",

			--[[   CONTRACT KILLER SUBTREE   ]]--
			--FORMERLY "SILENT KILLER"
				--Second Wind
				["menu_scavenger_beta_sc"] = "Segundo Aire",
				["menu_scavenger_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCuando tu blindaje se rompe tu velocidad de movimiento es aumentada por un #{skill_color}#$skill_value_b1## durante #{skill_color}#$skill_value_b2## segundos.\n\nCuando tu blindaje se rompe, el primer disparo en cada enemigo lo tambaleará.\n\nEste efecto persiste por #{skill_color}#$skill_value_p1## segundos después de que tu blindaje se haya regenerado.",

				--Optical Illusions--
				["menu_optic_illusions_sc"] = "Ilusiones Ópticas",
				["menu_optic_illusions_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad para sacar y enfundar armas aumenta por un #{skill_color}#$skill_value_b1##.\n\nAS: #{owned}#$pro##\nAumenta la movilidad de todas las armas por #{skill_color}#$skill_value_p1.##",

				--The Professional--
				["menu_silence_expert_beta_sc"] = "El Profesional",
				["menu_silence_expert_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu velocidad de apuntado y esprint-a-apuntado aunmenta por un #{skill_color}#$skill_value_b1##.\n\nAS: #{owned}#$pro##\nTu velocidad de apuntado y esprint-a-apuntado aunmenta por un #{skill_color}#$skill_value_p1## adicional.\n\nMatar enemigos especiales y de élite con armas a distancia no explosivas hará que #{skill_color}#dejen caer un paquete de munición extra.##",

				--Unseen Strike, formally Dire Need--
				["menu_backstab_beta_sc"] = "Ataque Sorpresa",
				["menu_backstab_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl no recibir daño durante #{skill_color}#$skill_value_b1## segundos, obtienes un #{skill_color}#$skill_value_b2## de probabilidad de crítico hasta que recibas daño.\n\nLos ataques críticos infligen #{skill_color}#50%## de daño adicional.\n\nAS: #{owned}#$pro##\nLa probabilidad de crítico de esta habilidad persiste durante #{skill_color}#$skill_value_p1## segundos después de recibir daño.",

				--Cleaner--
				["menu_hitman_beta_sc"] = "Limpiador",
				["menu_hitman_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nInfliges un #{skill_color}#$skill_value_b1## más de daño a enemigos especiales y de élite.\n\n#{risk}#NOTA: No aplica a## #{important_1}#lanzagranadas o lanzacohetes.##\n\nAS: #{owned}#$pro##\nInfliges un #{skill_color}#$skill_value_p1## más de daño adicional a enemigos especiales y de élite.\n\nMatar un enemigo con un disparo en la cabeza llena tu medidor de esquiva por un #{skill_color}#$skill_value_p2## de tu esquiva.\n\nMatar un enemigo por la espalda llena tu medidor de esquiva por un #{skill_color}#$skill_value_p3## de esquiva; se acumula con la esquiva obtenida por disparos en la cabeza.\n\n#{risk}#NOTA: Bajas usando## #{important_1}#explosivos, fuego o daño con el tiempo## #{risk}#no otorgarán esquiva.##\n ",

				--Low Blow--
				["menu_unseen_strike_beta_sc"] = "Golpe Bajo",
				["menu_unseen_strike_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTu probabilidad de crítico aumenta por un #{skill_color}#$skill_value_b1## por cada #{risk}#$skill_value_b2## puntos de carga por debajo de #{risk}#$skill_value_b3##, hasta un máximo de #{skill_color}#$skill_value_b4.##\n\nLos ataques críticos infligen #{skill_color}#50%## de daño adicional.\n\nAS: #{owned}#$pro##\nTu probabilidad de crítico aumenta por un #{skill_color}#$skill_value_p1## por cada #{risk}#$skill_value_p2## puntos de carga por debajo de #{risk}#$skill_value_p3##, hasta un máximo de #{skill_color}#$skill_value_p4.##\n\nTu probabilidad de crítico aumenta por un #{skill_color}#$skill_value_p5## adicional al atacar enemigos por la espalda.",

		--[[   FUGITIVE   ]]--

			--[[   GUNSLINGER SUBTREE   ]]--
				--Equilibrium--
				["menu_equilibrium_beta_sc"] = "Equilibrio",
				["menu_equilibrium_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nTodos los jugadores obtienen una bonificación de #{skill_color}#$skill_value_b1 de estabilidad con #{skill_color}#pistolas##.##\n\nAS: #{owned}#$pro##\nSacas y enfundas #{skill_color}#pistolas## un #{skill_color}#$skill_value_p1## más rápido.",

				--Gun Nut--
				["menu_dance_instructor_sc"] = "Loco de las Pistolas",
				["menu_dance_instructor_desc_sc"] = "BÁSICA: #{owned}#$basic##\nMejora la precisión al disparar desde la cadera con #{skill_color}#pistolas## por un #{skill_color}#$skill_value_b1.##\n\nAS: #{owned}#$pro##\nDisparas con #{skill_color}#pistolas## un #{skill_color}#$skill_value_p1## más rápido.\n\nLas #{skill_color}#pistolas## infligen #{skill_color}#$skill_value_p2## de su daño a través de armadura.",

				--Over Pressurized/Gunfighter--
				["menu_gun_fighter_sc"] = "Pistolero",
				["menu_gun_fighter_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLas #{skill_color}#pistolas## recargan un #{skill_color}#$skill_value_b1## más rápido.\n\nLa penalización de precisión al moverse se reduce por un #{skill_color}#$skill_value_b2## con #{skill_color}#pistolas.##\n\nLa penalización de precisión al moverse depende de la estabilidad.\n\nAS: #{owned}#$pro##\nLas #{skill_color}#pistolas## recargan un #{skill_color}#$skill_value_p1## más rápido adicional.",

				--Akimbo--
				["menu_akimbo_skill_sc"] = "Ejército de Dos",
				["menu_akimbo_skill_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLas armas #{skill_color}#duales## obtienen #{skill_color}#$skill_value_b1## de estabilidad.\n\nAS: #{owned}#$pro##\nLas armas #{skill_color}#duales## obtienen #{skill_color}#$skill_value_p1## de precisión.",

				--Desperado--
				["menu_expert_handling_sc"] = "Desperado",
				["menu_expert_handling_desc_sc"] = "BÁSICA: #{owned}#$basic##\nDisparos en la cabeza con #{skill_color}#pistolas## les otorgan una bonificación del #{skill_color}#$skill_value_b1## a la precisión y alcance durante #{skill_color}#$skill_value_b2## segundos.\n\nEste efecto puede acumularse hasta un máximo de #{skill_color}#$skill_value_b3## veces; la duración se reinicia con cada disparo en la cabeza.\n\nAS: #{owned}#$pro##\nAumenta la duración de la bonificación de precisión y alcance por #{skill_color}#$skill_value_p1## segundos adicionales.",

				--Trigger Happy--
				["menu_trigger_happy_beta_sc"] = "Gatillo Fácil",
				["menu_trigger_happy_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nDisparos en la cabeza con #{skill_color}#pistolas## les otorgan una bonificación del #{skill_color}#$skill_value_b1## al daño durante #{skill_color}#$skill_value_b2## segundos.\n\nEste efecto puede acumularse hasta un máximo de #{skill_color}#$skill_value_b3## cargas; la duración se reinicia con cada disparo en la cabeza.\n\nAS: #{owned}#$pro##\nAumenta la duración de la bonificación de daño por #{skill_color}#$skill_value_p1## segundos adicionales y la cantidad de cargas máximas en #{skill_color}#$skill_value_p2##.",

			--[[   REVENANT SUBTREE   ]]--
				--Running From Death--
				["menu_nine_lives_beta_sc"] = "Evadiendo la Muerte",
				["menu_nine_lives_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl ser reanimado, tu velocidad de movimiento es aumentada por un #{skill_color}#$skill_value_b1## durante #{skill_color}#$skill_value_b2## segundos.\n\nAS: #{owned}#$pro##\nAl ser reanimado obtienes una bonificación de #{skill_color}#$skill_value_p1## de resistencia al daño durante #{skill_color}#$skill_value_p2## segundos.\n\nTus armas se recargarán instantáneamente al ser reanimado.",

				--Undying--
				["menu_running_from_death_beta_sc"] = "Inmortal",
				["menu_running_from_death_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nObtienes un aumento de un #{skill_color}#$skill_value_b1## de salud mientras estás incapacitado.\n\nAS: #{owned}#$pro##\nObtienes un aumento de un #{skill_color}#$skill_value_p1## de salud adicional mientras estás incapacitado.\n\nPuedes usar tu arma primaria mientras estas incapacitado.",

				--What Doesn't Kill You Only Makes You Stronger--
				["menu_what_doesnt_kill_beta_sc"] = "Lo que no te Mata",
				["menu_what_doesnt_kill_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nReduce el daño recibido por #{skill_color}#$skill_value_b1## punto por cada vida que estés más cerca de custodia. \n\nAS: #{owned}#$pro##\nReduce el daño recibido por #{skill_color}#$skill_value_p1## puntos adicionales en todo momento.",

				--Swan Song
				["menu_perseverance_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCuando tu salud alcance #{skill_color}#0##, en lugar de ser incapacitado entras en un estado de Canto del Cisne; puedes luchar por #{skill_color}#$skill_value_b1## segundos con una penalización de #{skill_color}#60%## de velocidad de movimiento.\n\n#{risk}#NOTA: Entrar en el estado de Canto del Cisne siempre terminará contigo siendo incapacitado una vez que el efecto termine.##\n\nAS: #{owned}#$pro##\nEl efecto dura #{skill_color}#$skill_value_p1## segundos adicionales.",

				--Haunt--
				["menu_haunt_sc"] = "Espantar",
				["menu_haunt_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl Matar enemigos que están a menos de #{skill_color}#18## metros los enemigos en un radio de #{skill_color}#12## metros de ti tendrán un #{skill_color}#$skill_value_b1## de probabilidad de ser afectados por el pánico por cada vida que estés más cerca de custodia.\n\nCuando un enemigo entra en pánico, este será incapaz de atacar.\n\nAS: #{owned}#$pro##\nLa probabilidad es incrementada por un #{skill_color}#$skill_value_p1## adicional en todo momento.",

				--Messiah--
				["menu_pistol_beta_messiah_sc"] = "Mesías",
				["menu_pistol_beta_messiah_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAl estar incapacitado, matar a un enemigo activará una carga de mesías, permitiendote saltar para reanimarte. Tienes #{skill_color}#1## carga que se restaurará al salir de custodia.\n\nPuedes ser incapacitado #{skill_color}#1## vez más antes de ir a custodia por primera vez durante un trabajo.\n\nAS: #{owned}#$pro##\nTienes cargas infinitas de Mesías, pero solo puedes activar el efecto una vez cada #{important_1}#120## segundos. Las bajas que obtengas mientras estás incapacitado recuden este tiempo por #{skill_color}#10## segundos.",

			--[[   BRAWLER SUBTREE   ]]--
				--Martial Arts--
				["menu_martial_arts_beta_sc"] = "Entrenamiento Especial",
				["menu_martial_arts_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nObtienes una bonificación de #{skill_color}#$skill_value_b1## de resistencia al daño contra ataques cuerpo a cuerpo, gracias al entrenamiento.\n\nAS: #{owned}#$pro##\nEl índice de tambaleo de tus armas cuerpo a cuerpo es aumentado por un #{skill_color}#$skill_value_p1##, gracias al entrenamiento.\n\nEl índice de tambaleo determina si un ataque cuerpo a cuerpo tambaleará a un enemigo y afecta al daño infligido a los visores y placas de armadura de Bulldozers.",

				--Counter-Strike--
				["menu_drop_soap_beta_sc"] = "Contraataque",
				["menu_drop_soap_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nPuedes contraatacar patadas con salto de Cloakers mientras cargas tus ataques cuerpo a cuerpo, derribandolos.\n\nObtienes una bonificación de #{skill_color}#20%## de resistencia al daño contra patadas de Cloaker y descargas de Taser.\n\nAS: #{owned}#$pro##\nPuedes contraatacar patadas con esprint de Cloakers mientras cargas tus ataques cuerpo a cuerpo, derribandolos.\n\nObtienes una bonificación de #{skill_color}#10%## de reducción de daño contra ataques a distancia mientras cargas tus ataques cuerpo a cuerpo.\n\nObtienes una bonificación de #{skill_color}#30%## de reducción de daño adicional contra patadas de Cloaker y descargas de Taser.",

				--Pumping Iron--
				["menu_steroids_beta_sc"] = "Levantador de Pesas",
				["menu_steroids_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nAtacas y cargas con armas cuerpo a cuerpo un #{skill_color}#$skill_value_b1## más rápido.\n\nAS: #{owned}#$pro##\nAtacas y cargas con armas cuerpo a cuerpo un #{skill_color}#$skill_value_p1## más rápido adicional.",

				--Bloodthirst--
				["menu_bloodthirst_sc"] = "Sed de Sangre",
				["menu_bloodthirst_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCuando mates a un enemigo con un ataque cuerpo a cuerpo, obtendrás una bonificacion de #{skill_color}#$skill_value_b1## de velocidad de recarga durante #{skill_color}#$skill_value_b2## segundos.\n\nAS: #{owned}#$pro##\nCada baja que obtengas que no sea con ataques cuerpo a cuerpo aumentará el daño del siguiente ataque cuerpo a cuerpo por un #{skill_color}#25%##, hasta un máximo de #{skill_color}#100%.##\n\nEste efecto se reinicia al golpear a un enemigo con un ataque cuerpo a cuerpo.",

				--Frenzy--
				["menu_wolverine_beta_sc"] = "Frenesí",
				["menu_wolverine_beta_desc_sc"] = "BÁSICA: #{owned}#$basic##\nLos efectos curativos se reducen hasta un #{important_1}#30%## cuanto más cerca estés de tu salud máxima.\n\nLa desviación aumenta por hasta #{skill_color}#$skill_value_b1## cuanto más cerca estés de ser incapacitado.\n\nDesviación reduce la cantidad de daño a la salud que recibes, hasta un máximo de #{skill_color}#$deflection##, y se aplica después de otras formas de reducción de daño.\n\nAS: #{owned}#$pro##\nAhora los efectos curativos se reducen hasta un #{important_1}#75%## mientras que la desviación puede aumentarse hasta #{skill_color}#$skill_value_p1.##",

				--Berserker--
				["menu_frenzy_sc"] = "Furia Berserker",
				["menu_frenzy_desc_sc"] = "BÁSICA: #{owned}#$basic##\nCuanta menos salud tienes, más daño infliges.\n\nCuando tu salud esté por debajo del #{skill_color}#100%##, obtienes una bonificacion de daño hasta un #{skill_color}#$skill_value_b1## con armas cuerpo a cuerpo y sierras.\n\nAS: #{owned}#$pro##\nCuanta menos salud tienes, más daño infliges.\n\nCuando tu salud esté por debajo del #{skill_color}#100%##, obtienes una bonificacion de daño hasta un #{skill_color}#$skill_value_p1## con armas a distancia.\n\n#{risk}#NOTA: No aplica a## #{important_1}#lanzagranadas o lanzacohetes.##"


	})

		local butt = math.rand(1)
		local frame = 0.01
		if Month == "4" and Day == "1" then
			frame = 1
		end
		if registeredloser or not easterless and butt <= frame then
			LocalizationManager:add_localized_strings({	
				["menu_st_spec_23"] = "Helminth", --Bob: No se si esta seccion es una referencia a algo
				["menu_st_spec_23_desc"] = "¿Quién te cuida en tus momentos de descanso? ¿Quién restaura tu cuerpo destrozado día tras día? ¿Qué leche enriquece tu carne con fuerza y vigor sin fin?\n\n\n#{important_1}#Sólo puedo ser yo.##",
				["menu_difficulty_sm_wish"] = "El Camino De Acero",
				["menu_risk_sm_wish"] = "El Camino de Acero. Para aquellos que han dominado EL CONCLAVE y desean buscar un desafío.",
			})
		end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Esquiva",
		["menu_st_category_activated"] = "Activa",
		["menu_st_category_challenge"] = "Comodín",
		["menu_st_category_mod"] = "Mod",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Aumenta tu daño con disparos en la cabeza por un #{skill_color}#25%.##\n\nObtienes una bonificacion de daño de #{skill_color}#25%##.\n\n#{risk}#NOTA: El aumento de daño no aplica a## #{important_1}#Arrojadizas, Lanzacohetes o Lanzagranadas.##",
		["menu_deckall_4_desc_sc"] = "Obtienes #{skill_color}#1## punto de movilidad.\n\nCuando usas armadura, tu velocidad de movimiento se ve un #{skill_color}#15%## menos afectada.\n\nObtienes una bonificación de #{skill_color}#45%## de experiencia al completar días y trabajos.\n\nObtienes una bonificación de #{skill_color}#25%## de daño.\n\n#{risk}#NOTA: No aplica a## #{important_1}#Arrojadizas, Lanzacohetes o Lanzagranadas.##",
		["menu_deckall_6_desc_sc"] = "Desbloquea la #{skill_color}#Caja de Arrojadizas## en tu inventario. Puedes usar la Caja de Arrojadizas para reabastecer arrojadizas durante un trabajo.\n\nObtienes una bonificación de #{skill_color}#25%## de daño.\n\n#{risk}#NOTA: No aplica a## #{important_1}#Arrojadizas, Lanzacohetes o Lanzagranadas.##",
		["menu_deckall_8_desc_sc"] = "Tu velocidad para interactuar con Bolsas Médicas aumenta por un #{skill_color}#20%.##\n\nObtienes una bonificación de #{skill_color}#25%## de daño.\n\n#{risk}#NOTA: No aplica a## #{important_1}#Arrojadizas, Lanzacohetes o Lanzagranadas.##",

		--Crook--
		["menu_deck6_1_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos.\n\nObtienes una bonificación de blindaje de ##$perk_value_2## con chalecos antibala.",
		["menu_deck6_3_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos adicionales con chalecos antibala.",
		["menu_deck6_5_desc_sc"] = "Tu blindaje aumenta por ##$perk_value_1## puntos adicionales con chalecos antibala.\n\nFuerzas cerraduras ##$perk_value_2## más rápido.",
		["menu_deck6_7_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos adicionales con chalecos antibala.",
		["menu_deck6_9_desc_sc"] = "Tu blindaje aumenta por ##$perk_value_1## puntos adicionales con chalecos antibala.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos.\n\nTu velocidad de cambio de armas es ##$perk_value_2## más rápida.",
		["menu_deck4_3_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos adicionales.",
		["menu_deck4_5_desc_sc"] = "Tu medidor de esquiva se llenará hasta un ##200%## de su valor máximo al ser reanimado.\n\nLa duración al desactivar cámaras aumenta ##20## segundos.",
		["menu_deck4_7_desc_sc"] = "Tu esquiva aumenta por ##$perk_value_1## puntos adicionales.",
		["menu_deck4_9_desc_sc"] = "Esquivar un ataque regenerará ##$perk_value_1## de salud cada segundo por los siguientes ##$perk_value_2## seconds. Este efecto puede acumularse pero se perderán todas las cargas si recibes daño a la salud.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "TAEKWON-PLOMO",
		["menu_deck5_3_sc"] = "ASESINO ENTRENADO",
		["menu_deck5_5_sc"] = "CON UN LÁPIZ",
		["menu_deck5_7_sc"] = "ASESINO EXPERTO",

		["menu_deck5_1_desc_sc"] = "Matar a un enemigo fuera de cuerpo a cuerpo acumula #{skill_color}#$perk_value_1## de salud. Puedes acumular hasta #{risk}#$perk_value_2## de salud.\n\nMatar un enemigo con ataques cuerpo a cuerpo convierte la salud acumulada en salud temporal que decae a un ritmo de #{important_1}#$perk_value_3## por segundo.\n\nLa salud temporal puede exceder tu salud máxima, pero solo puedes tener #{risk}#$perk_value_4## de salud temporal al mismo tiempo.",
		["menu_deck5_3_desc_sc"] = "Tu medidor de esquiva se llena por ##$perk_value_1## de tu esquiva cuando tu blindaje se regenera.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck5_5_desc_sc"] = "Acumulas ##$perk_value_1## más de salud.\n\nLlevas ##$perk_value_2## bolsa para cadáver adicional.",
		["menu_deck5_7_desc_sc"] = "Obtienes ##$perk_value_1## de salud temporal al ser reanimado.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck5_9_desc_sc"] = "Mientras tienes salud temporal, obtienes ##$perk_value_1## de desviación y una bonificacion de ##$perk_value_2## de velocidad de movimiento.\n\nDesviación reduce la cantidad de daño a la salud que recibes, hasta un máximo de ##$perk_value_3##, y se aplica después de otras formas de reducción de daño.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Muscle
		["menu_deck2_1_desc_sc"] = "Obtienes ##$perk_value_1## de salud adicional.",
		["menu_deck2_3_desc_sc"] = "Obtienes ##$perk_value_1## de salud adicional.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck2_5_desc_sc"] = "Obtienes ##$perk_value_1## de salud adicional.\n\nCompactas cadáveres e interactuas con civiles ##$perk_value_2## más rápido.",
		["menu_deck2_7_desc_sc"] = "Cada disparo con tus armas tiene ##$perk_value_1## de probabilidad de esparcir pánico entre tus enemigos.\n\nCuando un enemigo entra en pánico este será incapaz de atacar.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck2_9_desc_sc"] = "Obtienes ##$perk_value_1## de salud adicional.\n\nObtienes ##$perk_value_2## de tu salud máxima al ser reanimado.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Crew Chief
		["menu_deck1_3_desc_sc"] = "La resistencia (para esprintar) de todos los jugadores aumenta por un #{skill_color}#$perk_value_1.##\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##\n\nAumenta la distancia a la que puedes gritar por un #{skill_color}#$perk_value_2.##\n\nObtienes #{skill_color}#5## puntos de esquiva adicionales.",
		["menu_deck1_5_desc_sc"] = "Obtienes ##$perk_value_1## de salud adicional.\n\nTu equipo obtiene ##$perk_value_2## de salud adicional.\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##\n\nContestas localizadores de guardias ##$perk_value_3## más rápido.",
		["menu_deck1_7_desc_sc"] = "Obtienes ##$perk_value_1## de blindaje adicional.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck1_9_desc_sc"] = "Todos los jugadores obtienen ##$perk_value_1## de salud máxima y ##$perk_value_2## de resistencia (para esprintar) adicionales por cada rehén que el equipo tenga hasta un máximo de ##$perk_value_3## rehenes.\n\n#{risk}#NOTA: Las habilidades de equipo no se acumulan.##\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "Obtienes ##$perk_value_1## de blindaje adicional.",
		["menu_deck3_3_desc_sc"] = "Obtienes ##$perk_value_1## de blindaje adicional.",
		["menu_deck3_5_desc_sc"] = "Obtienes ##$perk_value_1## de blindaje adicional.\n\nPuedes desplegar ##$perk_value_2## cajas de bolsas para cadáveres.",
		["menu_deck3_7_desc_sc"] = "La velocidad a la que se regenera tu blindaje aumenta por un ##$perk_value_1.##",
		["menu_deck3_9_desc_sc"] = "La velocidad a la que se regenera tu blindaje aumenta por un ##$perk_value_1## adicional.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.\n\nTu medidor de esquiva se llena hasta un ##$perk_value_2## de tu esquiva cada segundo al estar agachado.",
		["menu_deck7_3_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck7_5_desc_sc"] = "Tu medidor de esquiva se llena hasta un ##$perk_value_1%## adicional de tu esquiva cada segundo al estar agachado.\n\nObtienes una bonificación de ##$perk_value_2## de velocidad de movimiento al estar agachado.",
		["menu_deck7_7_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck7_9_desc_sc"] = "La velocidad a la que se regenera tu blindaje aumenta por un ##$perk_value_1.##\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Al tomar paquetes de munición, estos contienen suministros médicos que pueden curarte por #{skill_color}#$perk_value_1 hasta $perk_value_2## puntos de salud.\n\nEsto no puede ocurrir mas de una vez cada #{important_1}#$perk_value_3## segundos pero cada paquete de munición que tomes puede reducir este tiempo por #{skill_color}#$perk_value_4 hasta $perk_value_5## segundos.",
		["menu_deck10_3_desc_sc"] = "Al tomar un paquete de munición, los demás jugadores obtienen un paquete de munición con ##$perk_value_1## de munición.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck10_5_desc_sc"] = "Ahora los paquetes de munición te curan por #{skill_color}#$perk_value_1 hasta $perk_value_2## de salud.\n\nCuando te curas al tomar paquetes de munición, tu medidor de esquiva se llena por un ##$perk_value_3## de tu esquiva.\n\nContestas localizadores de guardias ##$perk_value_4## más rápido.",
		["menu_deck10_7_desc_sc"] = "Cuando te curas al tomar un paquete de munición, tu equipo tambien se curará por ##$perk_value_1## de la cantidad recuperada.\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck10_9_desc_sc"] = "Ahora los paquetes de munición te curan por #{skill_color}#$perk_value_1 hasta $perk_value_2## de salud.\n\nCuando te curas al tomar paquetes de munición, tambien obtienes ##$perk_value_3## de blindaje.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",
		["menu_deck10_7"] = "MEDICINA ESCURRIDIZA",
		["menu_deck10_9"] = "MEDICINA CARGADA",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "Cuando te encuentras a ##$perk_value_1## metros de un enemigo, obtienes una bonificacion de ##$perk_value_2## de resistencia al daño de enemigos.",
		["menu_deck8_3_desc_sc"] = "Cuando te encuentras a ##$perk_value_1## metros de un enemigo, obtienes una bonificacion adicional de ##$perk_value_2## de resistencia al daño de enemigos.\n\nObtienes ##$perk_value_3## puntos de esquiva adicionales.",
		["menu_deck8_5_desc_sc"] = "Cuando te encuentras ##$perk_value_1## metros de un enemigo, obtienes una bonificacion adicional de ##$perk_value_2## de resistencia al daño de enemigos.\n\nCada golpe cuerpo a cuerpo que aciertes te otorgará una bonificacion de ##$perk_value_3## de daño cuerpo a cuerpo durante ##$perk_value_4## segundos o hasta que falles; puede acumularse hasta ##$perk_value_5## veces.\n\nLa duración al desactivar cámaras aumenta ##$perk_value_6## segundos.",
		["menu_deck8_7_desc_sc"] = "Cada golpe cuerpo a cuerpo que aciertes te otorgará una bonificacion adicional de ##$perk_value_1## de daño cuerpo a cuerpo durante ##$perk_value_2## segundos o hasta que falles; puede acumularse hasta ##$perk_value_3## veces.\n\nObtienes ##$perk_value_4## puntos de esquiva adicionales.",
		["menu_deck8_9_desc_sc"] = "Cada golpe cuerpo a cuerpo que aciertes te curará por ##$perk_value_1## de salud cada segundo durante ##$perk_value_2## segundos, este efecto puede acumularse hasta ##$perk_value_3## veces.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Sociopath--
		["menu_deck9_1_sc"] = "NO TALK",
		["menu_deck9_1_desc_sc"] = "Cuando estás rodeado por 3 o más enemigos que están a menos de ##$perk_value_1## metros, obtienes una bonificación de ##$perk_value_2## resistencia al daño de enemigos.",
		["menu_deck9_3_desc_sc"] = "Matar a un enemigo regenera #{skill_color}#$perk_value_1## de blindaje.\n\nEsto no puede ocurrir más de una vez cada #{important_1}#$perk_value_2## segundos. Cada baja que obtengas reduce este enfriamiento por #{skill_color}#$perk_value_3## segundos; bajas usando ataques cuerpo a cuerpo reducen el enfriamiento por #{skill_color}#$perk_value_4## segundos adicionales.\n\nSi una baja elimina el enfriamiento restante, activará los efectos del talento y reiniciará el enfriamiento.\n\nObtienes #{skill_color}#$perk_value_5## puntos de esquiva adicionales.",
		["menu_deck9_5_desc_sc"] = "Matar a un enemigo con armas cuerpo a cuerpo regenerá ##$perk_value_1## de salud.\n\nEste efecto comparte su enfriamiento con Tensión (Carta 3) incluso si este efecto no fue activado.\n\nLlevas ##$perk_value_2## bolsa para cadáver adicional.",
		["menu_deck9_7_desc_sc"] = "Matar a un enemigo a menos de ##$perk_value_1## metros regenerará ##$perk_value_2## de blindaje; bajas con ataques cuerpo a cuerpo duplican la cantidad regenerada.\n\nEste efecto comparte su enfriamiento con Tensión (Carta 3) incluso si este efecto no fue activado.\n\nObtienes ##$perk_value_3## puntos de esquiva adicionales.",
		["menu_deck9_9_desc_sc"] = "Al matar enemigos que están a menos de ##$perk_value_1## metros los enemigos en un radio de ##$perk_value_3## metros de ti tendrán un ##$perk_value_2## de probabilidad de ser afectados por el pánico; bajas con armas cuerpo a cuerpo duplican esta probabilidad.\n\nCuando un enemigo entra en pánico este será incapaz de atacar.\n\nEste efecto comparte su enfriamiento con Tensión (Carta 3) incluso si este efecto no fue activado.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Al infligir daño a un enemigo, regeneras #{skill_color}#$perk_value_1## puntos de salud cada segundo durante #{skill_color}#$perk_value_2## segundos; este efecto puede acumularse hasta #{skill_color}#$perk_value_3## veces.\nSolo puedes obtener una carga cada #{important_1}#$perk_value_4## segundos y debes estar llevando el #{risk}#Chaleco Antiexplosivos.##\nTu Chaleco Antiexplosivos pierde #{important_1}#$perk_value_5## de blindaje pero obtiene #{skill_color}#$perk_value_6## de movilidad.\n\n#{risk}#NOTA: Infligir daño a enemigos con torretas o daño con el tiempo no otorgará cargas.##",
		["menu_deck11_3_desc_sc"] = "Las cargas regeneran ##$perk_value_1## punto de salud adicional cada segundo.",
		["menu_deck11_5_desc_sc"] = "Las cargas duran ##$perk_value_1## segundos adicionales.\n\nPuedes desplegar ##$perk_value_2## cajas de bolsas para cadáver.",
		["menu_deck11_7_desc_sc"] = "Las cargas regeneran ##$perk_value_1## punto de salud adicional cada segundo.",
		["menu_deck11_9_desc_sc"] = "Cada carga que tengas otorga una bonificación de ##$perk_value_1## de velocidad de movimiento.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "Si tu blindaje no está roto, acumulas hasta ##$perk_value_1## puntos de salud por cada baja que obtengas.\n\nCuando tu blindaje se regenera después de romperse, tu salud se regenera con la salud acumulada.\n\nLa cantidad máxima de salud acumulada depende de tu armadura corporal, con armaduras más pesadas acumulando menos salud que armaduras ligeras.",
		["menu_deck13_3_desc_sc"] = "La cantidad de salud que acumulas por cada baja aumenta por ##$perk_value_1.##\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck13_5_desc_sc"] = "La cantidad máxima de salud que puedes acumular es aumentada por un ##$perk_value_1.##\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_2## más.",
		["menu_deck13_7_desc_sc"] = "La cantidad de salud que acumulas por cada baja aumenta por ##$perk_value_1.##\n\nObtienes ##$perk_value_2## puntos de esquiva adicionales.",
		["menu_deck13_9_desc_sc"] = "Al matar enemigos, tu velocidad de regeneración de blindaje es aumentada dependiendo de tu armadura corporal. Las armaduras más pesadas obtienen un aumento menor que las armaduras nás ligeras. Este aumento se reinicia cuando se regenera tu blindaje.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "El daño que infliges es convertido en Cargas de Histeria. Hasta un máximo de ##$perk_value_1.##\n\nCargas de Histeria:\nEl daño recibido se reduce por ##$perk_value_2## punto por cada ##$perk_value_3## Cargas de Histeria. Pierdes ##$perk_value_4## de tus Cargas de Histeria cada ##8## segundos.",
		["menu_deck14_3_desc_sc"] = "Los demás jugadores támbien obtienen los efectos de tus Cargas de Histeria.\n\nLas Cargas de Histeria no se acumulan entre jugadores, y solo las cargas que otorguen la mayor cantidad de absorcion de daño tendrán efecto.\n\nObtienes ##$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck14_5_desc_sc"] = "La cantidad de Cargas de Histeria que pierdes es reducida a ##$perk_value_1## cada ##$perk_value_2## segundos.\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_3## más.",
		["menu_deck14_7_desc_sc"] = "El daño recibido ahora se reduce por ##$perk_value_1## punto por cada ##$perk_value_2## Cargas de Histeria.\n\nObtienes ##$perk_value_3## puntos de esquiva adicionales.",
		["menu_deck14_9_desc_sc"] = "Las Cargas de Histeria son un ##$perk_value_1## más potentes solo para ti.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Anarchist--
		["menu_st_spec_15"] = "ANARQUISTA", --there's a random space at the end of the original string
		["menu_deck15_1_desc_sc"] = "En vez de regenerar tu blindaje por completo al estar fuera de combate, este se regenera periodicamente a un ritmo de #{skill_color}#8## de blindaje por segundo. Las armaduras más pesadas regeneran más blindaje por ciclo pero tienen un retraso más largo entre ciclos.\n\n#{risk}#NOTA: Las Habilidades y Talentos que aumenten la velocidad de regeneración de blindaje o habilidades con reducciones de enfriamiento ligadas a regeneración de blindaje están deshabilitadas al usar este talento.##",
		["menu_deck15_3_desc_sc"] = "#{risk}#$perk_value_1 de tu salud## es convertida en #{skill_color}#$perk_value_2 de blindaje.##",
		["menu_deck15_5_desc_sc"] = "Ahora #{risk}#$perk_value_1 de tu salud## es convertida en #{skill_color}#$perk_value_2 de blindaje.##\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_3## más.",
		["menu_deck15_7_desc_sc"] = "Ahora #{risk}#$perk_value_1 de tu salud## es convertida en #{skill_color}#$perk_value_2 de blindaje.##",
		["menu_deck15_9_desc_sc"] = "#{skill_color}#Al infligir daño regeneras blindaje,## las armaduras más pesadas regeneran más armadura.\nEste efecto solo puede ocurrir una vez cada #{important_1}#$perk_value_1## segundos.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un #{skill_color}#10%.##",
		["menu_anarc_disable"] = "#{important_1}#(Deshabilitado por Anarquista)##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Desbloquea la #{skill_color}#Inyección de Adrenalina## en tu iventario como una arrojadiza.\n\nAl usar la inyección regeneras #{skill_color}#$perk_value_1## del daño recibido durante #{skill_color}#$perk_value_2## segundos; pero esto no quiere decir que no recibirás daño.\n\nSolo puedes usar la inyección una vez cada #{important_1}#$perk_value_3## segundos; cada baja que obtengas reduce el enfriamiento por #{skill_color}#$perk_value_4## segundos.",
		["menu_deck17_3_desc_sc"] = "Obtienes una bonificación de ##$perk_value_1## de velocidad de movimiento mientras la inyección está activa.",
		["menu_deck17_5_desc_sc"] = "Ahora regeneras ##$perk_value_1## del daño recibido durante ##$perk_value_2## segundos mientras la inyección esté activa.\n\nLos enemigos cercanos preferirán apuntarte a ti, siempre que sea posible, mientras la inyección esté activa.",
		["menu_deck17_7_desc_sc"] = "La cantidad de salud recibida durante el efecto de la inyección aumenta por un ##$perk_value_1## mientras estés por debajo del ##$perk_value_2## de salud.",
		["menu_deck17_9_desc_sc"] = "Por cada ##$perk_value_1## puntos de salud regenerada durante el efecto de la inyección mientras tienes la salud al máximo, el enfriamiento de la inyección se reduce por ##$perk_value_2## segundos.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "Desbloquea la #{skill_color}#Granada de Humo## en tu inventario como una arrojadiza.\n\nAl detonar, crea una cortina de humo durante #{skill_color}#$perk_value_1## segundos. Todo jugador dentro de esta regenera blindaje #{skill_color}#$perk_value_2## más rápido. La precisión de cualquier enemigo dentro de la cortina sera reducida por un #{skill_color}#$perk_value_3.##\n\nUna vez usada, debes esperar #{important_1}#$perk_value_4## segundos para poder usarla denuevo, por cada enemigo que mates el enfriamiento se reducirá por #{skill_color}#$perk_value_5## segundos.\n\nObtienes #{skill_color}#$perk_value_6## puntos de esquiva.",
		["menu_deck18_3_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck18_5_desc_sc"] = "Esquivar un ataque reduce el enfriamiento de la granada de humo por ##$perk_value_1## segundos.\n\nLlevas ##$perk_value_2## bolsa para cadáver adicional.",
		["menu_deck18_7_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck18_9_desc_sc"] = "Tu medidor de esquiva se llena por ##$perk_value_1## de tu esquiva cada segundo mientras estás dentro de la cortina de humo.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Desbloquea la #{skill_color}#Petaca Stoic## en tu inventario como una arrojadiza.\n\n#{skill_color}#$perk_value_1## del daño que recibes a tu salud se aplica como daño con el tiempo en un período de #{skill_color}#$perk_value_2## segundos.\n\nUsar la petaca eliminará todo el daño por tiempo.\n\nAl eliminar daño con el tiempo, recuperas salud equivalente al #{skill_color}#$perk_value_3## del daño pendiendte de ese momento.\n\nUna vez uses la petaca, debes esperar #{important_1}#$perk_value_4## segundos para poder usarla de nuevo.\n\nPierdes #{important_1}#$perk_value_5## de tu blindaje y obtienes #{skill_color}#$perk_value_6## más de salud.",
		["menu_deck19_3_desc_sc"] = "Por cada enemigo que mates el enfriamiento de la petaca se reducirá por ##$perk_value_1## segundos.",
		["menu_deck19_5_desc_sc"] = "Al no recibir daño durante ##$perk_value_1## segundos, todo daño con el tiempo pendiente sera eliminado.\n\nContestas localizadores de guardias ##$perk_value_2## más rápido.",
		["menu_deck19_7_desc_sc"] = "Cuando tu salud está por debajo del ##$perk_value_1##, el enfriamiento de la petaca se reduce por ##$perk_value_2## segundos por cada enemigo que mates.",
		["menu_deck19_9_desc_sc"] = "Recuperas ##$perk_value_1## de tu salud máxima tras ser reanimado.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "Desbloquea el #{skill_color}#Cigarrillo Electrónico## en tu inventario como una arrojadiza.\n\nPara activarlo debes mirar directamente a otra unidad aliada que esté a menos de #{skill_color}#$perk_value_1## metros y presionar el boton de arrojadiza para marcarlos.\n\nCada enemigo matado por ti y quien hayas marcado hara que tú regeneres #{skill_color}#$perk_value_2## de salud y quien hayas marcado regenere #{skill_color}#$perk_value_3##.\n\nEl efecto tiene una duración de #{skill_color}#$perk_value_4## segundos y debes esperar #{important_1}#$perk_value_5## para poder usarlo denuevo.",
		["menu_deck20_3_desc_sc"] = "Cada enemigo matado por ti o quien hayas marcado aumentará la duración del efecto del cigarrillo electrónico por ##$perk_value_1## segundos. Este aumento se reduce por ##$perk_value_2## segundos cada vez que ocurre.",
		["menu_deck20_5_desc_sc"] = "Cada enemigo matado por ti o quien hayas marcado te otorga una bonificación de ##$perk_value_1## de resistencia al daño hasta un máximo de ##$perk_value_2## hasta que el efecto y enfriamiento del cigarrillo electrónico terminen.\n\nLa duración al desactivar cámaras aumenta ##$perk_value_3## segundos.",
		["menu_deck20_7_desc_sc"] = "La curación del cigarrillo electrónico aumenta por ##$perk_value_1.##",
		["menu_deck20_9_desc_sc"] = "Cada enemigo que mates reduce el enfriamiento del Cigarrillo Electrónico por ##$perk_value_1## segundos.\n\nCada enemigo que mate quien hayas marcado reduce el enfriamiento del Cigarrillo Electrónico por ##$perk_value_2## segundos hasta que acabe el efecto.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Biker--
		["menu_deck16_1_desc_sc"] = "Cuando tú o tu equipo matan a un enemigo regeneras #{skill_color}#$perk_value_1## de salud. Esto solo puede ocurrir una vez cada #{important_1}#$perk_value_2## segundos.",
		["menu_deck16_3_desc_sc"] = "Regeneras ##$perk_value_1## de blindaje cada ##$perk_value_2## segundos.",
		["menu_deck16_5_desc_sc"] = "Por cada ##$perk_value_1## de blindaje perdido de tu blindaje total, el enfriamiento del efecto de curación se reduce por ##$perk_value_2## segundos.\n\nCompactas cadáveres e interactuas con civiles ##$perk_value_3## más rápido.",
		["menu_deck16_7_desc_sc"] = "Ahora regeneras ##$perk_value_1## de blindaje cada ##$perk_value_2## segundos.\n\nMatar a un enemigo con un arma cuerpo a cuerpo provoca que el siguiente ciclo de regeneración de armadura ocurra ##$perk_value_3## segundo antes.",
		["menu_deck16_9_desc_sc"] = "Por cada ##$perk_value_1## de blindaje perdido de tu blindaje total, aumenta la salud regenerada al matar por ##$perk_value_2.##\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Yakuza--
		["menu_deck12_1_desc_sc"] = "Cuanta menos salud tienes, más rápido se llenará pasivamente tu medidor de esquiva.\n\nCuando tu salud está por debajo del ##100%##, tu medidor de esquiva se llena por hasta ##$perk_value_1## de tu esquiva cada segundo.\n\nObtienes ##$perk_value_2## puntos de esquiva.",
		["menu_deck12_3_desc_sc"] = "Cuanta menos salud tienes, más rápido se llenará tu medidor de esquiva cuando mates a un enemigo.\n\nCuando tu salud está por debajo del ##100%##, tu medidor de esquiva se llena por hasta ##$perk_value_1## de tu esquiva al matar enemigos.",
		["menu_deck12_5_desc_sc"] = "Cuanta menos salud tienes, obtienes más resistencia al daño. Cuando tu salud está por debajo del ##100%##, obtienes hasta ##$perk_value_1## de resistencia al daño.\n\nCompactas cadáveres e interactuas con civiles ##$perk_value_2## más rápido.",
		["menu_deck12_7_desc_sc"] = "Cuanta menos salud tienes, más efectiva será tu esquiva cuando mates a un enemigo cuerpo a cuerpo.\n\nCuando tu salud está por debajo del ##100%##, matar enemigos con ataques cuerpo a cuerpo llenará tu medidor de esquiva por hasta ##$perk_value_1## de tu esquiva, acumulandose con los efectos de Hebi Irezumi (Carta 3) asi como incrementar el periodo de gracia de tu proxima esquiva hasta por ##$perk_value_2##, hasta un máximo de ##$perk_value_3 ms.##\n\nObtienes ##$perk_value_4## de esquiva adicionales.",
		["menu_deck12_9_desc_sc"] = "La cantidad máxima de desviación que puedes obtener es aumentada hasta #{skill_color}#$perk_value_1.##\n\nUna vez por vida, en vez de ser incapacitado sobrevives con ##1## de salud y regeneras ##$perk_value_2## de blindaje.\n\n#{risk}#NOTA: Este efecto no aplica y tampoco se reinicia al ser incapacitado por patadas de Cloaker o descargas de Taser.##\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un #{skill_color}#10%.##",
		["menu_yakuza_deflection_add"] = "(Aumentado por Yakuza)",

		--Hacker--
		["menu_deck21_1_desc_sc"] = "Desbloquea el #{skill_color}#Dispositivo ECM de bolsillo## en tu inventario como una arrojadiza.\n\nEl Dispositivo tiene una duración de #{skill_color}#$perk_value_1## segundos.\n\nAl usarlo en sigilo, activará el efecto de inhibición, desactivando todos los electrónicos y localizadores.\n\nAl usarlo en combate activará el efecto de acople que tendrá un alcance de #{skill_color}#$perk_value_2## metros. El #{skill_color}#primer## bucle tiene un #{skill_color}#$perk_value_3## de probabilidad de aturdir a la mayoría de enemigos, y cada #{skill_color}#$perk_value_4## segundos después con una probabilidad de #{skill_color}#$perk_value_5## de aturdir.\n\nEl Dispositivo tiene un enfriamiento de #{important_1}#$perk_value_6## segundos; por cada enemigo que mates el enfriamiento se reduce por #{skill_color}#$perk_value_7## segundos.",
		["menu_deck21_3_desc_sc"] = "Obtienes ##$perk_value_1## puntos de esquiva.",
		["menu_deck21_5_desc_sc"] = "Por cada enemigo que mates mientras el efecto está activo regeneras ##$perk_value_1## de salud.",
		["menu_deck21_7_desc_sc"] = "La velocidad a la que se regenera tu blindaje aumenta por ##$perk_value_1.##\n\nObtienes ##$perk_value_2## puntos de esquiva adicional.",
		["menu_deck21_9_desc_sc"] = "Cuando un compañero mata a un enemigo mientras el efecto está activo, este regenera ##$perk_value_1## de salud.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",

		--Leech
		["menu_deck22_1_desc_sc"] = "Desbloquea la #{skill_color}#Ampolla Sanguijuela## en tu inventario como una arrojadiza.\n\nActivar la ampolla regenerará #{skill_color}#$perk_value_1## de tu salud máxima y #{risk}#deshabilitará tu protección corporal## durabte #{important_1}#$perk_value_2## segundos.\n\nMientras el efecto de la ampolla está activo tu salud se dividirá en segmentos de #{skill_color}#$perk_value_3## y el daño que recibas te quitará uno de esos segmentos. Matar a #{skill_color}#$perk_value_4## enemigos te regenerará uno de los segmentos de vida y bloqueará el daño recibido durante #{skill_color}#$perk_value_5## segundo.\n\nLa ampolla tiene un enfriamiento de #{important_1}#$perk_value_6## segundos.",
		["menu_deck22_3_desc_sc"] = "Mientras el efecto de la ampolla está activo, recibir daño regenerará #{skill_color}#$perk_value_1## de salud máxima a tus compañeros.",
		["menu_deck22_5_desc_sc"] = "La duración del efecto de la ampolla es aumentada hasta #{skill_color}#$perk_value_1## segundos, cada enemigo matado por ti reducirá el enfriamiento por #{skill_color}#$perk_value_2## segundo.\n\nCompactas cadáveres e interactuas con civiles #{skill_color}#$perk_value_3## más rápido.",
		["menu_deck22_7_desc_sc"] = "Mientras el efecto de la ampolla está activo, tu salud se dividirá en segmentos de #{skill_color}#$perk_value_1.##",
		["menu_deck22_9_desc_sc"] = "Puedes activar la ampolla al ser incapacitado, lo que te permitira reanimarte temporalmente hasta que el efecto haya terminado agregando #{important_1}#$perk_value_1## segundos a su enfriamiento.\n\nAhora recibir daño regenera #{skill_color}#$perk_value_2## de salud máxima a tus compañeros.\n\nBonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un #{skill_color}#10%.##",

		--CopyCat--
		["menu_st_spec_23"] = "IMITADOR",
		["menu_deck23_1_desc"] = "Recarga automáticamente el arma que tengas enfundada al matar #{skill_color}#$perk_value_1## enemigos.\n\n#{risk}#NOTA: Las bajas se cuentan por separado entre armas y el contador solo se reinicia una vez que activas el efecto de recarga para el arma enfundada.##\n\nTu velocidad para cambiar entre armas aumenta por #{skill_color}#$perk_value_2##.",
		["menu_deck23_1_short"] = "Recarga automáticamente el arma que tengas enfundada al matar #{skill_color}#$perk_value_1## enemigos.\n\nTu velocidad para cambiar entre armas aumenta por #{skill_color}#$perk_value_2##.",
		["menu_deck23_1_1_desc"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_1_1_short"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_1_2_desc"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_1_2_short"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_1_3_desc"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_1_3_short"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_1_4_desc"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",
		["menu_deck23_1_4_short"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",

		["menu_deck23_3_desc"] = "Cada disparo a la cabeza que aciertas cura #{skill_color}#$perk_value_1## de salud.\n\nEsto no puede ocurrir más de una vez cada #{important_1}#$perk_value_2## segundos; la reducción de enfriamiento se comparte con la habilidad #{skill_color}#\"Implacable\"## si está activa.",
		["menu_deck23_3_short"] = "Cada disparo a la cabeza que aciertas cura #{skill_color}#$perk_value_1## de salud.\n\nEsto no puede ocurrir más de una vez cada #{important_1}#$perk_value_2## segundos; la reducción de enfriamiento se comparte con la habilidad #{skill_color}#\"Implacable\"## si está activa.",
		["menu_deck23_3_1_desc"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_3_1_short"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_3_2_desc"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_3_2_short"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_3_3_desc"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_3_3_short"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_3_4_desc"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",
		["menu_deck23_3_4_short"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",

		["menu_deck23_5_desc"] = "Las balas esquivadas rebotarán contra el enemigo que las disparó.\n\nLas balas que rompan tu blindaje rebotarán contra el enemigo que las disparó infligiendo #{skill_color}#$perk_value_1## de daño adicional.\n\nLos rebotes al romperse tu blindaje tienen un enfriamiento de #{important_1}#$perk_value_2## segundos.",
		["menu_deck23_5_short"] = "Las balas esquivadas rebotarán contra el enemigo que las disparó.\n\nLas balas que rompan tu blindaje rebotarán contra el enemigo que las disparó infligiendo #{skill_color}#$perk_value_1## de daño adicional.\n\nLos rebotes al romperse tu blindaje tienen un enfriamiento de #{important_1}#$perk_value_2## segundos.",
		["menu_deck23_5_1_desc"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_5_1_short"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_5_2_desc"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_5_2_short"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_5_3_desc"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_5_3_short"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_5_4_desc"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",
		["menu_deck23_5_4_short"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",

		["menu_deck23_7_desc"] = "Cuando tu salud esté por debajo de #{skill_color}#$perk_value_1## ésta no podra sufrir daño durante #{skill_color}#$perk_value_2## segundos.\n\nEsto no puede ocurrir mas de una vez cada #{important_1}#$perk_value_3## segundos.",
		["menu_deck23_7_short"] = "Cuando tu salud esté por debajo de #{skill_color}#$perk_value_1## ésta no podra sufrir daño durante #{skill_color}#$perk_value_2## segundos.\n\nEsto no puede ocurrir mas de una vez cada #{important_1}#$perk_value_3## segundos.",
		["menu_deck23_7_1_desc"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_7_1_short"] = "Obtienes #{skill_color}#$perk_value_1## de salud adicional.",
		["menu_deck23_7_2_desc"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_7_2_short"] = "Obtienes #{skill_color}#$perk_value_1## de blindaje adicional.",
		["menu_deck23_7_3_desc"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_7_3_short"] = "Obtienes #{skill_color}#$perk_value_1## puntos de esquiva adicionales.",
		["menu_deck23_7_4_desc"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",
		["menu_deck23_7_4_short"] = "Tu velocidad de movimiento al transportar objetos y estar agachado aumenta en #{skill_color}#$perk_value_1##.",
		--Final Card
			--Crew Chief
			["menu_deck1_mrwi_desc"] = "La resistencia (para esprintar) de todos los jugadores aumenta por un ##$perk_value_1.##\n\nAumenta la distancia a la que puedes gritar por un ##$perk_value_2.##\n\nNOTA: Las habilidades de equipo no se acumulan.\n\nContestas localizadores de guardias ##$perk_value_3## más rápido.",
			--Muscle
			["menu_deck2_mrwi_desc"] = "Cada disparo con tus armas tiene ##$perk_value_1## de probabilidad de esparcir pánico entre tus enemigos.\n\nCuando un enemigo entra en pánico este será incapaz de atacar.\n\nCompactas cadáveres e interactuas con civiles ##$perk_value_2## más rápido.",
			--Armorer
			["menu_deck3_mrwi_desc"] = "La velocidad a la que se regenera tu blindaje aumenta por un ##$perk_value_1.##\n\nPuedes desplegar ##$perk_value_2## cajas de bolsas para cadáver.",
			--Rogue
			["menu_deck4_mrwi_desc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales\n\nTu velocidad de cambio de armas es ##$perk_value_2## más rápida.\n\nLa duración al desactivar cámaras aumenta ##$perk_value_3## segundos.",
			--Hitman
			["menu_deck5_mrwi_desc"] = "Matar a un enemigo fuera de cuerpo a cuerpo acumula #{skill_color}#$perk_value_1## de salud. Puedes acumular hasta #{risk}#$perk_value_2## de salud.\n\nMatar un enemigo con ataques cuerpo a cuerpo convierte la salud acumulada en salud temporal que decae a un ritmo de #{important_1}#$perk_value_3## por segundo.\n\nLa salud temporal puede exceder tu salud máxima, pero solo puedes tener #{risk}#$perk_value_4## de salud temporal al mismo tiempo.\n\nLlevas #{skill_color}#$perk_value_5## bolsa para cadáver adicional.",
			--Crook
			["menu_deck6_mrwi_desc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales con chalecos antibala.\n\nTu blindaje aumenta por ##$perk_value_2## adicional con chalecos antibala.\n\nFuerzas cerraduras ##$perk_value_3## más rápido.",
			--Burglar
			["menu_deck7_mrwi_desc"] = "Obtienes ##$perk_value_1## puntos de esquiva adicionales.\n\nTu medidor de esquiva se llena hasta un ##$perk_value_2## de tu esquiva cada segundo al estar agachado.\n\nObtienes una bonificación de ##$perk_value_2## de velocidad de movimiento al estar agachado.",
			--Infiltrator
			["menu_deck8_mrwi_desc"] = "Cuando te encuentras a ##$perk_value_1## metros de un enemigo, obtienes una bonificacion de ##$perk_value_2## de resistencia al daño de enemigos.\n\nCada golpe cuerpo a cuerpo que aciertes te otorgará una bonificacion de ##$perk_value_3## de daño cuerpo a cuerpo durante ##$perk_value_4## segundos o hasta que falles; puede acumularse hasta ##$perk_value_5## veces.\n\nLa duración al desactivar cámaras aumenta ##$perk_value_6## segundos.",
			--Sociopath
			["menu_deck9_mrwi_desc"] = "Matar a un enemigo regenera #{skill_color}#$perk_value_1## de blindaje.\n\nMatar a un enemigo a menos de #{skill_color}#$perk_value_2## metros regenerará #{skill_color}#$perk_value_3## de blindaje; bajas con armas cuerpo a cuerpo duplican esta cantidad.\n\nEsto no puede ocurrir más de una vez cada #{important_1}#$perk_value_4## segundos. Cada baja que obtengas reduce este enfriamiento por #{skill_color}#$perk_value_5## segundos; bajas usando ataques cuerpo a cuerpo reducen el enfriamiento por #{skill_color}#$perk_value_6## segundos adicionales.\n\nSi una baja elimina el enfriamiento restante, activará los efectos del talento y reiniciará el enfriamiento.\n\nLlevas #{skill_color}#$perk_value_7## bolsa para cadáver adicional.",
			--Gambler
			["menu_deck10_mrwi_desc"] = "Al tomar paquetes de munición, estos contienen suministros médicos que pueden curarte por ##$perk_value_1 hasta $perk_value_3## de salud.\n\nEsto no puede ocurrir más de una vez cada ##$perk_value_3## segundos pero cada paquete de munición que tomes puede reducir este tiempo por ##$perk_value_4 hasta $perk_value_5## segundos.\n\nAl tomar un paquete de munición, los demás jugadores obtienen un paquete de munición con ##$perk_value_6## de munición.\n\nContestas localizadores de guardias ##$perk_value_7## más rápido.",
			--Grinder
			["menu_deck11_mrwi_desc"] = "Al infligir daño a un enemigo, regeneras #{skill_color}#$perk_value_1## de salud cada segundo durante #{skill_color}#$perk_value_2## segundos; este efecto puede acumularse hasta #{skill_color}#$perk_value_3## veces.\nSolo puedes obtener una carga cada #{important_1}#$perk_value_4## segundos y debes estar llevando el #{risk}#Chaleco Antiexplosivos.##\nTu Chaleco Antiexplosivos pierde #{important_1}#$perk_value_5## de blindaje pero obtiene #{skill_color}#$perk_value_6## de movilidad.\n\n#{risk}#NOTA: Infligir daño a enemigos con torretas o daño con el tiempo no otorgará cargas.##\n\nPuedes desplegar #{skill_color}#$perk_value_7## cajas de bolsas para cadáver.",
			--Yakuza
			["menu_deck12_mrwi_desc"] = "Cuanta menos salud tienes, más rápido se llenará tu medidor de esquiva cuando mates a un enemigo.\n\nCuando tu salud está por debajo del ##100%##, tu medidor de esquiva se llena por hasta ##$perk_value_1## de tu esquiva.\n\nCompactas cadáveres e interactuas con civiles ##$perk_value_2## más rápido.",
			--Ex-Pres
			["menu_deck13_mrwi_desc"] = "Si tu blindaje no está roto, acumulas hasta ##$perk_value_1## de salud por cada baja que obtengas.\n\nCuando tu blindaje se regenera después de romperse, tu salud se regenera con la salud acumulada.\n\nLa cantidad máxima de salud acumulada depende de tu armadura corporal, con armaduras más pesadas acumulando menos salud que armaduras ligeras.\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_2## más.",
			--Maniac
			["menu_deck14_mrwi_desc"] = "El daño que infliges es convertido en Cargas de Histeria. Hasta un máximo de ##$perk_value_1.##\n\nCargas de Histeria:\nEl daño recibido se reduce por ##$perk_value_2## punto por cada ##$perk_value_3## Cargas de Histeria. Pierdes ##$perk_value_4## de tus Cargas de Histeria cada ##$perk_value_5## segundos.\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_6## más.",
			--Anarchist
			["menu_deck15_mrwi_desc"] = "En vez de regenerar tu blindaje por completo al estar fuera de combate, este se regenera periodicamente a un ritmo de ##8## de blindaje por segundo. Las armaduras más pesadas regeneran más blindaje por ciclo pero tienen un retraso más largo entre ciclos.\n\nNOTA: Las Habilidades y Talentos que aumenten la velocidad de regeneración de blindaje están deshabilitadas al usar este talento.\n\nLos civiles intimidados por ti o tu equipo se mantienen intimidados un ##$perk_value_1## más.",
			--Biker
			["menu_deck16_mrwi_desc"] = "Cuando tú o tu equipo matan a un enemigo regeneras #{skill_color}#$perk_value_1## de salud. Esto solo puede ocurrir una vez cada #{important_1}#$perk_value_2## segundos.\n\nCompactas cadáveres e interactuas con civiles #{skill_color}#$perk_value_3## más rápido.",
			--Kingpin
			["menu_deck17_mrwi_desc"] = "Desbloquea la #{skill_color}#Inyección de Adrenalina## en tu iventario como una arrojadiza.\n\nAl usar la inyección regeneras #{skill_color}#$perk_value_1## del daño recibido durante #{skill_color}#$perk_value_2## segundos; pero esto no quiere decir que no recibirás daño.\n\nObtienes una bonificación de #{skill_color}#$perk_value_3## de velocidad de movimiento mientras la inyección está activa.\n\nSolo puedes usar la inyección una vez cada #{important_1}#$perk_value_4## segundos; cada baja que obtengas reduce el enfriamiento por #{skill_color}#$perk_value_5## segundo.",
			--Sicario
			["menu_deck18_mrwi_desc"] = "Desbloquea la #{skill_color}#Granada de Humo## en tu inventario como una arrojadiza.\n\nAl detonar, crea una cortina de humo durante #{skill_color}#$perk_value_1## segundos. Todo jugador dentro de esta regenera blindaje #{skill_color}#$perk_value_2## más rápido. La precisión de cualquier enemigo dentro de la cortina sera reducida por un #{skill_color}#$perk_value_3.##\n\nUna vez usada, debes esperar #{important_1}#$perk_value_4## segundos para poder usarla denuevo, por cada enemigo que mates el enfriamiento se reducirá por #{skill_color}#$perk_value_5## segundos.\n\nObtienes #{skill_color}#$perk_value_6## puntos de esquiva.\n\nLlevas #{skill_color}#$perk_value_7## bolsa para cadáver adicional.",
			--Stoic
			["menu_deck19_mrwi_desc"] = "Desbloquea la #{skill_color}#Petaca Stoic## en tu inventario como una arrojadiza.\n\n#{skill_color}#$perk_value_1## del daño que recibes a tu salud se aplica como daño con el tiempo en un período de #{skill_color}#$perk_value_2## segundos.\n\nUsar la petaca eliminará todo el daño por tiempo.\n\nAl eliminar daño con el tiempo, recuperas salud equivalente al #{skill_color}#$perk_value_3## del daño pendiendte de ese momento.\n\nUna vez uses la petaca, debes esperar #{important_1}#$perk_value_4## segundos para poder usarla de nuevo.\n\nPierdes #{important_1}#$perk_value_5## de tu blindaje y obtienes #{skill_color}#$perk_value_6## más de salud.\n\nContestas localizadores de guardias #{skill_color}#$perk_value_7## más rápido.",
			--Tag Team
			["menu_deck20_mrwi_desc"] = "Desbloquea el #{skill_color}#Cigarrillo Electrónico## en tu inventario como una arrojadiza.\n\nPara activarlo debes mirar directamente a otra unidad aliada que esté a menos de #{skill_color}#$perk_value_1## metros y presionar el boton de arrojadiza para marcarlos.\n\nCada enemigo matado por ti y quien hayas marcado hara que tú regeneres #{skill_color}#$perk_value_2## de salud y quien hayas marcado regenere #{skill_color}#$perk_value_3##.\n\nEl efecto tiene una duración de #{skill_color}#$perk_value_4## segundos y debes esperar #{important_1}#$perk_value_5## para poder usarlo denuevo.\n\nLa duración al desactivar cámaras aumenta #{skill_color}#$perk_value_6## segundos.",
			--Hacker
			["menu_deck21_mrwi_desc"] = "Desbloquea el #{skill_color}#Dispositivo ECM de bolsillo## en tu inventario como una arrojadiza.\n\nEl Dispositivo tiene un enfriamiento de #{skill_color}#$perk_value_1## segundos.\n\nAl usarlo en sigilo, activará el efecto de inhibición, desactivando todos los electrónicos y localizadores.\n\nAl usarlo en combate activará el efecto de acople que tendrá un alcance de #{skill_color}#$perk_value_2## metros. El #{skill_color}#primer## bucle tiene un #{skill_color}#$perk_value_3## de probabilidad de aturdir a la mayoría de enemigos, y cada #{skill_color}#$perk_value_4## segundos después con una probabilidad de #{skill_color}#$perk_value_5## de aturdir.\n\nEl Dispositivo tiene un enfriamiento de #{important_1}#$perk_value_6## segundos; por cada enemigo que mates el enfriamiento se reduce por #{skill_color}#$perk_value_7## segundos.",
			--Leech
			["menu_deck22_mrwi_desc"] = "Desbloquea la #{skill_color}#Ampolla Sanguijuela## en tu inventario como una arrojadiza.\n\nActivar la ampolla regenerará #{skill_color}#$perk_value_1## de tu salud máxima y #{risk}#deshabilitará tu protección corporal## durabte #{important_1}#$perk_value_2## segundos.\n\nMientras el efecto de la ampolla está activo tu salud se dividirá en segmentos de #{skill_color}#$perk_value_3## y el daño que recibas te quitará uno de esos segmentos. Matar a #{skill_color}#$perk_value_4## enemigos te regenerará uno de los segmentos de vida y bloqueará el daño recibido durante #{skill_color}#$perk_value_5## segundo.\n\nLa ampolla tiene un enfriamiento de #{important_1}#$perk_value_6## segundos.\n\nCompactas cadáveres e interactuas con civiles #{skill_color}#$perk_value_7## más rápido.",

		["menu_deck23_9_desc"] = "Bonificación por completar talento: Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un #{skill_color}#10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "TABULA RASA",
		["menu_st_spec_0_desc"] = "Se plantea la hipótesis de que los seres humanos nacen sin ideas, pensamientos o ideologías inherentes y que todos estos son comportamientos aprendidos a partir de diversas experiencias. En algunos aspectos, esto puede causar grandes dificultades; en otros, esto puede verse como una ventaja. El Talento Tabula Rasa ofrece beneficios que pueden no parecer obvios al principio e incluso perjudiciales, pero un desafío mayor a veces puede traer otras recompensas.",
		["menu_st_spec_0_desc_short"] = "Se plantea la hipótesis de que los seres humanos nacen sin ideas, pensamientos o ideologías inherentes y que todos estos son comportamientos aprendidos a partir de diversas experiencias. En algunos aspectos, esto puede causar grandes dificultades; en otros, esto puede verse como una ventaja. El Talento Tabula Rasa ofrece beneficios que pueden no parecer obvios al principio e incluso perjudiciales, pero un desafío mayor a veces puede traer otras recompensas.",
		["menu_deck0_1"] = "HOMBRE DE NEGOCIOS",
		["menu_deck0_1_desc"] = "Los artículos en el mercado negro y los recursos especiales para usar en trabajos cuestan un ##30%## menos.",		
		["menu_deck0_2"] = "NEGOCIANTE DEL MERCADO NEGRO",
		["menu_deck0_2_desc"] = "Los artículos en el mercado negro y los recursos especiales para usar en trabajos cuestan un ##30%## menos adicional.",					
		["menu_deck0_3"] = "PRESIDENTES MUERTOS",
		["menu_deck0_3_desc"] = "El valor de los objetos sueltos que tomes aumenta en ##15%##.",	
		["menu_deck0_4"] = "DÍA DEL VETERANO",
		["menu_deck0_4_desc"] = "El valor de los objetos sueltos que tomes aumenta en ##15%## adicional.",
		["menu_deck0_5"] = "LUBRICANTE PARA NOVATOS",
		["menu_deck0_5_desc"] = "Obtienes ##45%## de experiencia adicional al completar días y trabajos.",	
		["menu_deck0_6"] = "APRENDIZ HÁBIL",
		["menu_deck0_6_desc"] = "Obtienes ##45%## de experiencia adicional al completar días y trabajos.",		
		["menu_deck0_7"] = "DR. FANTÁSTICO",
		["menu_deck0_7_desc"] = "Obtienes ##45%## de experiencia adicional al completar días y trabajos.",			
		["menu_deck0_8"] = "TRÉBOL DE CUATRO HOJAS",
		["menu_deck0_8_desc"] = "Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##10%.##",
		["menu_deck0_9"] = "AMULETO DE LA SUERTE",
		["menu_deck0_9_desc"] = "Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##20%.## adicional",		
		
		["menu_st_spec_00"] = "INNATAE",
		["menu_st_spec_00_desc"] = "Otros argumentarían que la mente tiene instintos y conocimientos inherentes, que las personas en realidad no son un lienzo en blanco. El Innatae tiene las habilidades básicas que todo buen ladrón de bancos debería tener, dejando solo espacio para obtener beneficios personales. Estas convicciones, como cualquier otra cosa, tienen un costo para uno mismo. ¿Es este el costo de ceder a nuestros propios instintos primitivos?",
		["menu_st_spec_00_desc_short"] = "Otros argumentarían que la mente tiene instintos y conocimientos inherentes, que las personas en realidad no son un lienzo en blanco. El Innatae tiene las habilidades básicas que todo buen ladrón de bancos debería tener, dejando solo espacio para obtener beneficios personales. Estas convicciones, como cualquier otra cosa, tienen un costo para uno mismo. ¿Es este el costo de ceder a nuestros propios instintos primitivos?",
		["menu_deck00_9_desc"] = "Tu probabilidad de obtener un objeto infame en un Payday es aumentada por un ##20%.##",
		
		["rpd_menu_button"] = "Reiniciar Talento",
		["rpd_menu_dialog_title"] = "¿Estás seguro?",
		["rpd_menu_dialog_text"] = "Si reinicias el talento $perk_deck_name, se te reembolsarán $points_to_refund puntos de talento.",


		--Strings for Lobby Player Info
		["menu_st_spec_24"] = "TABULA RASA",
		["menu_st_spec_25"] = "INNATAE",
		--MOD PERK DECKS
			--OFFYERROCKER'S MERCENARY PERK DECK
				["menu_deck_kmerc_1_desc_sc"] = "Reduce el daño de golpes pesados a tu salud considerablemente de forma que ningún ataque único pueda matarte.\n\nObtienes una bonificación de ##5%## de salud.",
				["menu_deck_kmerc_3_desc_sc"] = "Obtienes una bonificación de ##1%## de velocidad de recarga y ##2%## de velocidad de cambio de armas por cada ##4## puntos de blindaje que tengas.\n\nObtienes una bonificación de ##5%## de blindaje.",	
				["menu_deck_kmerc_5_desc_sc"] = "Cuando tu salud llega ##0##, en vez de ser incapacitado, se convierte en ##1## de salud y obtienes ##2## segundos de invulnerabilidad.\n\nNo puedes esprintar mientras estás bajo los efectos de esta invulnerabilidad.\n\nEsto no puede volver a ocurrir hasta que hayas recuperado toda la salud.\n\nObtienes una bonificación de ##5%## de salud.",
				["menu_deck_kmerc_7_desc_sc"] = "Después de tener blindaje por almenos ##2## segundos, regenera salud equivalente a ##1%## de tu blindaje máximo cada ##5## segundos mientras tu blindaje no está roto.",
				["menu_deck_kmerc_9_desc_sc"] = "Al recibir daño de salud que te deje con ##30%## de salud o menos, regenera ##50%## de ese daño como blindaje.\nEsto no puede ocurrir más de una vez cada ##1## segundo o por el mismo golpe que activa la invulnerabilidad de Walk It Off's (Carta 5).",

			--OFFYERROCKER'S LIBERATOR PERK DECK
				["menu_deck_liberator_1_desc_sc"] = "Desbloquea la ##Jeringa de Supervivencia## en tu inventario como arrojadiza. Usar la Jeringa de Supervivencia restaurará inmediatamente ##15## puntos de resistencia (para esprintar) y ##0,5## puntos de salud cada segundo durante ##4## segundos o hasta que recibas daño a la salud.\nLa Jeringa de Supervivencia tiene ##1## carga con un enfriamiento de ##30## segundos; cada enemigo que mates reducirá el enfriamiento por ##1## segundo.",
				["menu_deck_liberator_3_desc_sc"] = "La regeneración de salud de la Jeringa de Supervivencia dura ##2## segundos adicionales.\n\nCuando se cancela la regeneración de salud de la Jeringa de Supervivencia, obtienes una bonificación de ##10%## de resistencia al daño durante el tiempo restante.",
				["menu_deck_liberator_5_desc_sc"] = "La Jeringa de Supervivencia restaura ##15## puntos de resistencia adicionales y regenera ##0.5## de salud adicionales cada segundo.\n\nObtienes ##5## puntos de esquiva adicionales.",
				["menu_deck_liberator_7_desc_sc"] = "Obtienes una bonificación de ##10%## de salud.\n\nLa regeneración de salud de la Jeringa de Supervivencia ahora dura ##2## segundos adicionales.",
				["menu_deck_liberator_9_desc_sc"] = "La Jeringa de Supervivencia ahora regenera ##1## punto de salud adicional cada segundo.",

	})
end)
