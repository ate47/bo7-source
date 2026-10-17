#using script_6c2f6a14fa53759e;
#using scripts\common\values;

#namespace zombie_wander;

// Namespace zombie_wander
// Params 0
// Checksum 0xc0435fdf, Offset: 0xd9
// Size: 0x5b
function disable_wandering()
{
    if ( isdefined( self._blackboard.var_8d34ab856208146f ) && isdefined( self._blackboard.var_dd1cb4e12c4c12d2 ) )
    {
        self._blackboard.var_8d34ab856208146f = 0;
        self._blackboard.var_dd1cb4e12c4c12d2 = -1;
    }
}

// Namespace zombie_wander
// Params 2
// Checksum 0x90ac684c, Offset: 0x13c
// Size: 0x234
function wander_listener( var_274405aedd3a2e2d, var_d75b19704bd63a8d )
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"wander_start" );
        
        if ( zombie_utils::get_zombie_round_difficulty() > 20 && self.zombieaisettings.var_870436057aca227 )
        {
            move_speed = self.zombieaisettings.var_870436057aca227;
        }
        else
        {
            move_speed = self.zombieaisettings.wandermovetype;
        }
        
        zombie_utils::function_a8ce00e0448cb6f0( move_speed, "wander", 22 );
        
        if ( !self.zombieaisettings.var_cfb7412a183301ad )
        {
            val::set( "wander_listener", "collide_with_ai_allies", 0 );
        }
        
        if ( !self.zombieaisettings.var_cb500ace9989e397 )
        {
            val::set( "wander_listener", "script_pushable_by_ai", 0 );
            val::set( "wander_listener", "script_pushable", 0 );
        }
        
        if ( self.turnrate > 0 && self.zombieaisettings.var_9660839af3193e78 > 0 )
        {
            self.turnrate *= self.zombieaisettings.var_9660839af3193e78;
        }
        
        if ( !self.zombieaisettings.var_ec76dfc5bca09867 )
        {
            enabled_traversals = self function_3e35d42cc05b0324();
            self enabletraversals( 0 );
        }
        
        if ( isfunction( var_274405aedd3a2e2d ) )
        {
            self [[ var_274405aedd3a2e2d ]]();
        }
        
        self waittill( #"wander_end" );
        zombie_utils::function_a8ce00e0448cb6f0( undefined, "wander" );
        val::reset_all( "wander_listener" );
        
        if ( self.turnrate > 0 && self.zombieaisettings.var_9660839af3193e78 > 0 )
        {
            self.turnrate /= self.zombieaisettings.var_9660839af3193e78;
        }
        
        if ( !self.zombieaisettings.var_ec76dfc5bca09867 )
        {
            self enabletraversals( 1, flat_args( enabled_traversals, enabled_traversals.size ) );
        }
        
        if ( isfunction( var_d75b19704bd63a8d ) )
        {
            self [[ var_d75b19704bd63a8d ]]();
        }
    }
}

