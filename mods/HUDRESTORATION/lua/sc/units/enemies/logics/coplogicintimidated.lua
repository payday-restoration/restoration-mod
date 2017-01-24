if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local level = Global.level_data.level_id
if level == "short2_stage2b" or level == "pal" then 
    --May or may not do something with this--

    else

    --No pager for dominated guards--
    function CopLogicIntimidated._do_tied( data, aggressor_unit )
        local my_data = data.internal_data

        if my_data.surrender_clbk_registered then
            managers.groupai:state():remove_from_surrendered( data.unit )
            my_data.surrender_clbk_registered = nil
        end
        my_data.tied = true
        data.unit:inventory():destroy_all_items()
        data.unit:brain():set_update_enabled_state( false )
        
        if my_data.update_task_key then
            managers.enemy:unqueue_task( my_data.update_task_key )
            my_data.update_task_key = nil
        end
        
        local rsrv_pos = my_data.rsrv_pos
        if rsrv_pos and rsrv_pos.stand then
            managers.navigation:unreserve_pos( rsrv_pos.stand )
            rsrv_pos.stand = nil
        end
        managers.groupai:state():on_enemy_tied( data.unit:key() )
        data.unit:base():set_slot( data.unit, 22 )    --22. Bound Hostages ( civilian and police ) handcuffed players are in slot 4
        
        data.unit:interaction():set_tweak_data( "hostage_convert" )
        data.unit:interaction():set_active( true, true, false )
        
        my_data.is_hostage = true
        managers.groupai:state():on_hostage_state( true, data.key, true )

	if data.unit:unit_data().mission_element then
		data.unit:unit_data().mission_element:event("tied", data.unit)
	end
        
        if aggressor_unit then
            data.unit:character_damage():drop_pickup() -- Steal his things
            data.unit:character_damage():set_pickup( nil )
                
            if aggressor_unit == managers.player:player_unit() then -- Its me, the server
                managers.statistics:tied( { name = data.unit:base()._tweak_table } )
            else -- It was one of the clients
                aggressor_unit:network():send_to_unit( { "statistics_tied", data.unit:base()._tweak_table } )
            end
        end
    end

end

end