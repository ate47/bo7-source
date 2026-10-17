#using script_6c2f6a14fa53759e;
#using scripts\common\utility;

#namespace zombie_viper_mini_shield;

// Namespace zombie_viper_mini_shield
// Params 2
// Checksum 0x6ed50119, Offset: 0xcf
// Size: 0x7f
function activate_chest_reactor_shield( healthpct, params )
{
    if ( self.chest_reactor_shield_enabled )
    {
        return;
    }
    
    self.chest_reactor_shield_enabled = 1;
    
    if ( self getscriptablehaspart( "chest_reactor_shield" ) )
    {
        self setscriptablepartstate( "chest_reactor_shield", "on" );
    }
    else
    {
        assertmsg( "<dev string:x24>" + "<dev string:x4d>" );
    }
    
    zombie_utils::function_584d912c70295d81( healthpct, [ "chest_reactor" ] );
    zombie_utils::function_dfae6a5bd222c586( &function_bd884ba71cdcb279 );
}

// Namespace zombie_viper_mini_shield
// Params 1, eflags: 0x4
// Checksum 0x4574eace, Offset: 0x156
// Size: 0xf7
function private function_bd884ba71cdcb279( params )
{
    if ( self.chest_reactor_shield_enabled )
    {
        b_shielded = 1;
        
        if ( isdefined( self.var_45f2beaaf602ef55 ) && ( isdefined( params.shitloc ) && arraycontains( self.var_45f2beaaf602ef55, params.shitloc ) || isdefined( params.partname ) && arraycontains( self.var_45f2beaaf602ef55, params.partname ) || isdefined( params.metabonename ) && arraycontains( self.var_45f2beaaf602ef55, params.metabonename ) ) )
        {
            b_shielded = 0;
        }
        
        if ( b_shielded )
        {
            var_1d4d1f382e7d2c0c = utility::getfx( "zombie_viper_mini_damage_impact_shield" );
            
            if ( isdefined( var_1d4d1f382e7d2c0c ) )
            {
                playfx( var_1d4d1f382e7d2c0c, params.vpoint );
            }
        }
    }
    
    return params.idamage;
}

