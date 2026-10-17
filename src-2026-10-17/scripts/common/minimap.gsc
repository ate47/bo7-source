#using scripts\common\vehicle;

#namespace minimap;

// Namespace minimap
// Params 4
// Checksum 0x4475209d, Offset: 0x91
// Size: 0x250
function trigger_set_floor( ent, setfunc, minimap_floor, override_minimap_volume )
{
    if ( !isplayer( ent ) && !ent vehicle::is_vehicle() )
    {
        return;
    }
    
    assert( isthreaded() );
    assert( isent( self ) );
    assert( isfunction( setfunc ) );
    triggernum = self getentitynumber();
    entnum = ent getentitynumber();
    var_1b82d683e0c151da = "trigger_set_floor_" + entnum + "_" + triggernum;
    ent endon( #"death_or_disconnect" );
    self endon( #"death_or_disconnect" );
    self notify( var_1b82d683e0c151da );
    self endon( var_1b82d683e0c151da );
    ent.var_4bdc8a1a86868e9[ triggernum ] = self;
    
    for ( firstkey = getfirstarraykey( ent.var_4bdc8a1a86868e9 ); isdefined( firstkey ) && !isent( ent.var_4bdc8a1a86868e9[ firstkey ] ) ; firstkey = getfirstarraykey( ent.var_4bdc8a1a86868e9 ) )
    {
        ent.var_4bdc8a1a86868e9[ firstkey ] = undefined;
    }
    
    if ( ent.var_4bdc8a1a86868e9[ firstkey ] == self )
    {
        if ( isplayer( ent ) )
        {
            player = ent;
            
            if ( player.player_floor_number != minimap_floor )
            {
                player [[ setfunc ]]( minimap_floor, override_minimap_volume );
                player.player_floor_number = minimap_floor;
            }
        }
        else if ( ent vehicle::is_vehicle() && isdefined( ent.owners ) )
        {
            foreach ( player in ent.owners )
            {
                if ( isplayer( player ) && player.player_floor_number != minimap_floor )
                {
                    player [[ setfunc ]]( minimap_floor, override_minimap_volume );
                    player.player_floor_number = minimap_floor;
                }
            }
        }
    }
    
    wait level.framedurationseconds * 2;
    ent.var_4bdc8a1a86868e9[ triggernum ] = undefined;
}

