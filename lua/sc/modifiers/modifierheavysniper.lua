ModifierHeavySniper.heavy_units = {}

--Full auto on Titan/Bravo Snipers
function ModifierHeavySniper:init(data)

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	--Full auto on Titan Snipers within 10 meters
	--DW and below, just in case
	if difficulty_index <= 7 then
		tweak_data.character.heavy_swat_sniper.weapon = deep_clone(tweak_data.character.presets.weapon.good)
		tweak_data.character.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 6
		tweak_data.character.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
			{
				r = 500,
				acc = {0.3, 0.6},
				dmg_mul = 2,
				recoil = {0.1, 0.1},
				mode = {
					1,
					0,
					0,
					0
				}
			},			
			{
				r = 1000,
				acc = {0.6, 0.9},
				dmg_mul = 2,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},		
			{
				r = 2000,
				acc = {0.6, 0.9},
				dmg_mul = 2,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 4000,
				acc = {0.5, 0.85},
				dmg_mul = 2,
				recoil = {1, 1.25},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 6000,
				acc = {0.5, 0.8},
				dmg_mul = 1,
				recoil = {1.25, 1.5},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 8000,
				acc = {0.5, 0.7},
				dmg_mul = 1,
				recoil = {1.5, 2},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}		
		tweak_data.character.weekend_dmr.weapon = deep_clone(tweak_data.character.presets.weapon.good)
		tweak_data.character.weekend_dmr.weapon.is_rifle.melee_dmg = 6
		tweak_data.character.weekend_dmr.weapon.is_rifle.FALLOFF = {
			{
				r = 500,
				acc = {0.3, 0.6},
				dmg_mul = 2,
				recoil = {0.1, 0.1},
				mode = {
					1,
					0,
					0,
					0
				}
			},			
			{
				r = 1000,
				acc = {0.6, 0.9},
				dmg_mul = 2,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},		
			{
				r = 2000,
				acc = {0.6, 0.9},
				dmg_mul = 2,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 4000,
				acc = {0.5, 0.85},
				dmg_mul = 2,
				recoil = {1, 1.25},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 6000,
				acc = {0.5, 0.8},
				dmg_mul = 1,
				recoil = {1.25, 1.5},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 8000,
				acc = {0.5, 0.7},
				dmg_mul = 1,
				recoil = {1.5, 2},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}				
	else
		tweak_data.character.heavy_swat_sniper.weapon = deep_clone(tweak_data.character.presets.weapon.expert)
		tweak_data.character.heavy_swat_sniper.weapon.is_rifle.melee_dmg = 8.4
		tweak_data.character.heavy_swat_sniper.weapon.is_rifle.FALLOFF = {
			{
				r = 500,
				acc = {0.3, 0.6},
				dmg_mul = 2.3,
				recoil = {0.1, 0.1},
				mode = {
					1,
					0,
					0,
					0
				}
			},				
			{
				r = 1000,
				acc = {0.6, 0.9},
				dmg_mul = 2.3,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 1800,
				acc = {0.6, 0.9},
				dmg_mul = 2.1,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},		
			{
				r = 2000,
				acc = {0.6, 0.9},
				dmg_mul = 2.1,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 4000,
				acc = {0.5, 0.85},
				dmg_mul = 2.1,
				recoil = {1, 1.25},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 6000,
				acc = {0.5, 0.8},
				dmg_mul = 1.05,
				recoil = {1.25, 1.5},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 8000,
				acc = {0.5, 0.7},
				dmg_mul = 1.05,
				recoil = {1.5, 2},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}	
		tweak_data.character.weekend_dmr.weapon = deep_clone(tweak_data.character.presets.weapon.expert)
		tweak_data.character.weekend_dmr.weapon.is_rifle.melee_dmg = 8.4
		tweak_data.character.weekend_dmr.weapon.is_rifle.FALLOFF = {
			{
				r = 500,
				acc = {0.3, 0.6},
				dmg_mul = 2.3,
				recoil = {0.1, 0.1},
				mode = {
					1,
					0,
					0,
					0
				}
			},			
			{
				r = 1000,
				acc = {0.6, 0.9},
				dmg_mul = 2.3,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 1800,
				acc = {0.6, 0.9},
				dmg_mul = 2.1,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},		
			{
				r = 2000,
				acc = {0.6, 0.9},
				dmg_mul = 2.1,
				recoil = {1, 1},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 4000,
				acc = {0.5, 0.85},
				dmg_mul = 2.1,
				recoil = {1, 1.25},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 6000,
				acc = {0.5, 0.8},
				dmg_mul = 1.05,
				recoil = {1.25, 1.5},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				r = 8000,
				acc = {0.5, 0.7},
				dmg_mul = 1.05,
				recoil = {1.5, 2},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}	
	end
	
end

--Wiped
function ModifierHeavySniper:modify_value(id, value)
end