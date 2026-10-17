#using scripts\common\utility;

#namespace pluto_veh;

// Namespace pluto_veh
// Params 3
// Checksum 0x51992540, Offset: 0xc9
// Size: 0x166
function set_vehicle_usable_state( vehicle, canbeused, doinvulnerability = 0 )
{
    if ( canbeused && vehicle.currentstage != 83 )
    {
        if ( vehicle utility::function_9f2c41c1dcc8c94( "single", "vehicle_unusable" ) && vehicle.health > 50 )
        {
            if ( doinvulnerability )
            {
                vehicle.var_e80954486df087be = gettime();
            }
            
            vehicle utility::function_7c10ea82c1e305b8( "single", "vehicle_use" );
            function_2d7ec1832d72a38f( vehicle, 0 );
            vehicle notify( #"hash_8c5d9655be6145c9" );
            
            foreach ( player in level.players )
            {
                player notify( #"exit_pluto_repair_hud" );
            }
        }
        
        return;
    }
    
    if ( vehicle utility::function_9f2c41c1dcc8c94( "single", "vehicle_use" ) )
    {
        vehicle utility::function_7c10ea82c1e305b8( "single", "vehicle_unusable" );
        
        if ( vehicle.currentstate > 0 )
        {
            function_2d7ec1832d72a38f( vehicle, 1 );
        }
    }
}

// Namespace pluto_veh
// Params 2
// Checksum 0x1fad83d, Offset: 0x237
// Size: 0x6d
function function_2d7ec1832d72a38f( vehicle, damaged )
{
    if ( damaged )
    {
        if ( vehicle utility::function_9f2c41c1dcc8c94( "plutoDamage", "disabled" ) )
        {
            vehicle utility::function_7c10ea82c1e305b8( "plutoDamage", "enabled" );
        }
        
        return;
    }
    
    if ( vehicle utility::function_9f2c41c1dcc8c94( "plutoDamage", "enabled" ) )
    {
        vehicle utility::function_7c10ea82c1e305b8( "plutoDamage", "disabled" );
    }
}

// Namespace pluto_veh
// Params 0, eflags: 0x4
// Checksum 0x4df65bbc, Offset: 0x2ac
// Size: 0xe, Type: bool
function private function_d5ded137742206c3()
{
    return self.health == 50;
}

