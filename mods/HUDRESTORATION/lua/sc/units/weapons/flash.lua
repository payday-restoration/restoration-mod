-- Grenade indicator on flash grenades only (smoke grenades excluded)
-- by BradolfPitler
-- v2.1 changed default icon to 'frag grenade', added info on how to change the icon
-- v2.0 improved indicator positioning (should now move along with the flash grenade)
-- v2.1 Added a new icon for the Flash grenade
-- http://www.unknowncheats.me/forum/payday-2/135236-grenade-indicator-flash-grenades-only-smoke-grenades-excluded.html
if restoration.Options:GetValue("SC/SC") then
local QuickFlashGrenade_flashbang_grenade_marker_ID

local QuickFlashGrenade__play_sound_and_effects_original = QuickFlashGrenade._play_sound_and_effects
function QuickFlashGrenade:_play_sound_and_effects()
    QuickFlashGrenade__play_sound_and_effects_original(self)
    
    if self._state == 1 then
        if QuickFlashGrenade_flashbang_grenade_marker_ID then 
            managers.hud:remove_waypoint(QuickFlashGrenade_flashbang_grenade_marker_ID)
        end
    
        QuickFlashGrenade_flashbang_grenade_marker_ID = tostring(math.random(0, 10000))
        managers.hud:add_waypoint(
            QuickFlashGrenade_flashbang_grenade_marker_ID,
            {     
                icon = 'pd2_flash', -- or comment this out and uncomment one of the other icons below
                -- icon =  'pd2_fire',  
                -- icon =  'pd2_kill', -- GoonMod's default
                -- more icons at:
                -- https://bitbucket.org/gir489/payday-2-lua-repo/src/cfcdf3e1bf5ab2a7e9945bedecf8a7e1fdd30786/lib/units/editor/waypointelement.lua?at=master
                -- https://bitbucket.org/gir489/payday-2-lua-repo/src/cfcdf3e1bf5ab2a7e9945bedecf8a7e1fdd30786/lib/tweak_data/tweakdatapd2.lua?at=master
                -- https://bitbucket.org/gir489/payday-2-lua-repo/src/cfcdf3e1bf5ab2a7e9945bedecf8a7e1fdd30786/lib/tweak_data/hudiconstweakdata.lua?at=master
                distance = true, 
                size = Vector3(64, 64, 0), 
                no_sync = false, 
                present_timer = 0, 
                state = "present",  
                unit = self._unit,
                radius = 100, 
                color = Color.yellow,
                blend_mode = "add", 
            }
        )
    elseif self._state == 3 then
        if QuickFlashGrenade_flashbang_grenade_marker_ID then 
            managers.hud:remove_waypoint(QuickFlashGrenade_flashbang_grenade_marker_ID)
            QuickFlashGrenade_flashbang_grenade_marker_ID = nil
        end
    end

end

end