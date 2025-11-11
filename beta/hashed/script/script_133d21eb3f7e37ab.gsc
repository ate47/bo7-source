#using scripts\common\vehicle;

#namespace minimap;

// Namespace minimap
// Params 4
// Checksum 0x58f4eefb, Offset: 0xb2
// Size: 0x248
function function_ea07737cd34391bc( ent, setfunc, minimap_floor, var_5269d98756c2f039 )
{
    if ( !isplayer( ent ) && !ent vehicle::is_vehicle() )
    {
        return;
    }
    
    assert( isthreaded() );
    assert( isent( self ) );
    assert( isfunction( setfunc ) );
    var_4eca564c90ec663e = self getentitynumber();
    entnum = ent getentitynumber();
    var_1b82d683e0c151da = "trigger_set_floor_" + entnum + "_" + var_4eca564c90ec663e;
    ent endon( "death_or_disconnect" );
    self endon( "death_or_disconnect" );
    self notify( var_1b82d683e0c151da );
    self endon( var_1b82d683e0c151da );
    ent.var_4bdc8a1a86868e9[ var_4eca564c90ec663e ] = self;
    
    for ( var_2b318f8190be6f77 = getfirstarraykey( ent.var_4bdc8a1a86868e9 ); isdefined( var_2b318f8190be6f77 ) && !isent( ent.var_4bdc8a1a86868e9[ var_2b318f8190be6f77 ] ) ; var_2b318f8190be6f77 = getfirstarraykey( ent.var_4bdc8a1a86868e9 ) )
    {
        ent.var_4bdc8a1a86868e9[ var_2b318f8190be6f77 ] = undefined;
    }
    
    if ( ent.var_4bdc8a1a86868e9[ var_2b318f8190be6f77 ] == self )
    {
        if ( isplayer( ent ) )
        {
            player = ent;
            
            if ( player.var_1e8e6d27dc0e62a2 != minimap_floor )
            {
                player [[ setfunc ]]( minimap_floor, var_5269d98756c2f039 );
                player.var_1e8e6d27dc0e62a2 = minimap_floor;
            }
        }
        else if ( ent vehicle::is_vehicle() && isdefined( ent.owners ) )
        {
            foreach ( player in ent.owners )
            {
                if ( isplayer( player ) && player.var_1e8e6d27dc0e62a2 != minimap_floor )
                {
                    player [[ setfunc ]]( minimap_floor, var_5269d98756c2f039 );
                    player.var_1e8e6d27dc0e62a2 = minimap_floor;
                }
            }
        }
    }
    
    wait level.framedurationseconds * 2;
    ent.var_4bdc8a1a86868e9[ var_4eca564c90ec663e ] = undefined;
}

