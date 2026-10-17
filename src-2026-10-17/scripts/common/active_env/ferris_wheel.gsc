#using scripts\common\math;
#using scripts\common\utility;

#namespace ferris_wheel;

// Namespace ferris_wheel
// Params 0
// Checksum 0xfcbcaaaa, Offset: 0x94
// Size: 0x1d1
function function_608ecf2462b35d42()
{
    var_dd5cdc263802c077 = 2;
    n_angular_velocity = isdefined( self.script_parameters ) ? float( self.script_parameters ) : var_dd5cdc263802c077;
    var_9ce59f7f6749f63 = utility::getstructarray( self.target, "targetname" );
    n_delta_time = 0.5;
    var_b23738be0590b3a6 = n_angular_velocity / 2;
    var_e2607b109a0b1419 = self.origin;
    var_56c01eedcd65f5ee = anglestoforward( self.angles );
    var_6a68b62178202585 = [];
    
    foreach ( s_cart in var_9ce59f7f6749f63 )
    {
        e_cart = spawn( "script_model", s_cart.origin );
        e_cart.angles = s_cart.angles ?? ( 0, 0, 0 );
        
        if ( isdefined( s_cart.script_modelname ) )
        {
            e_cart setmodel( s_cart.script_modelname );
            var_6a68b62178202585[ var_6a68b62178202585.size ] = e_cart;
        }
        else
        {
            assertmsg( "<dev string:x24>" );
            return;
        }
        
        e_cart setmodel( s_cart.script_modelname );
        e_cart forcenetfieldhighlod( 1 );
        e_cart setmoveroptimized( 1 );
        e_cart setmoverantilagged( 1 );
        e_cart markkeyframedmover();
    }
    
    thread function_31bdd8b4f7683e96( var_6a68b62178202585, var_e2607b109a0b1419, var_56c01eedcd65f5ee, var_b23738be0590b3a6, n_delta_time );
}

// Namespace ferris_wheel
// Params 5, eflags: 0x4
// Checksum 0x9397921b, Offset: 0x26d
// Size: 0x141
function private function_31bdd8b4f7683e96( var_6a68b62178202585, var_e2607b109a0b1419, var_56c01eedcd65f5ee, var_b23738be0590b3a6, n_delta_time )
{
    level endon( #"game_ended" );
    
    foreach ( e_car in var_6a68b62178202585 )
    {
        e_car setmoveroptimized( 1 );
        e_car setmoverantilagged( 1 );
        e_car markkeyframedmover();
    }
    
    while ( true )
    {
        self rotateroll( var_b23738be0590b3a6, n_delta_time );
        
        foreach ( e_car in var_6a68b62178202585 )
        {
            e_car math::function_ad1b3fbc486397da( var_e2607b109a0b1419, var_56c01eedcd65f5ee, var_b23738be0590b3a6, n_delta_time );
        }
        
        wait n_delta_time;
        waitframe();
        waitframe();
    }
}

