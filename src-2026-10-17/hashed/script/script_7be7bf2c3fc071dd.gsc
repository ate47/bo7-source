#using script_4ee44c794c53009e;
#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zm_bgb_anywhere_but_here;

// Namespace zm_bgb_anywhere_but_here
// Params 0, eflags: 0x5
// Checksum 0xcbf813fb, Offset: 0x253
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "anywhere_but_here", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_anywhere_but_here
// Params 0
// Checksum 0xace7af63, Offset: 0x278
// Size: 0x93
function __init__()
{
    bgb::register( "anywhere_but_here", "activated", 1, undefined, undefined, &validation, &activation );
    bgb::function_dbfbba0189f602fa( "anywhere_but_here", 1 );
    level._effect[ "teleport_splash" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_zmb" );
    level._effect[ "teleport_splash_3p" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_zmb_3p" );
    level._effect[ "teleport_aoe" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_aoe_zmb" );
    level._effect[ "teleport_aoe_kill" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_aoe_kill_zmb" );
}

// Namespace zm_bgb_anywhere_but_here
// Params 0
// Checksum 0x872634df, Offset: 0x313
// Size: 0x44b
function activation()
{
    self endon( #"death_or_disconnect" );
    val::set( "anywhere_but_here", "ignoreme", 1 );
    val::set( "anywhere_but_here", "vehicle_use", 0 );
    
    if ( isdefined( level.var_654073823a58b613 ) )
    {
        s_respawn_point = self [[ level.var_654073823a58b613 ]]();
    }
    else
    {
        s_respawn_point = function_bf6363e79a1a43f6();
    }
    
    if ( !s_respawn_point )
    {
        val::reset_all( "anywhere_but_here" );
        return;
    }
    
    streamhint::playerstreamhintlocation( s_respawn_point.origin );
    playfx( level._effect[ "teleport_splash_3p" ], self.origin );
    playsoundatpos( self.origin, #"evt_bgb_awbh_teleport_out" );
    wait 0.5;
    parent = self getlinkedparent();
    
    if ( isdefined( parent ) )
    {
        grandparent = parent getlinkedparent();
        self unlink();
    }
    
    if ( self isspectatinganyone() || self.sessionstate != "playing" )
    {
        return;
    }
    
    self setvelocity( ( 0, 0, 0 ) );
    
    if ( isvector( s_respawn_point.origin ) )
    {
        self setorigin( s_respawn_point.origin );
    }
    
    val::set( "anywhere_but_here", "freezecontrols", 1 );
    v_return_pos = self.origin + ( 0, 0, 60 );
    a_ai = getaiarray();
    a_closest = [];
    ai_closest = undefined;
    
    if ( a_ai.size )
    {
        a_closest = utility::get_array_of_closest( self.origin, a_ai );
        
        foreach ( ai in a_closest )
        {
            n_trace_val = ai sightconetrace( v_return_pos, self );
            
            if ( n_trace_val > 0.2 )
            {
                ai_closest = ai;
                break;
            }
        }
        
        if ( isdefined( ai_closest ) )
        {
            self setplayerangles( vectortoangles( ai_closest getcentroid() - v_return_pos ) );
        }
        else if ( isdefined( s_respawn_point.angles ) )
        {
            self setplayerangles( s_respawn_point.angles );
        }
    }
    else if ( isdefined( s_respawn_point.angles ) )
    {
        self setplayerangles( s_respawn_point.angles );
    }
    
    if ( isdefined( level.var_a5b16f887c432c02 ) )
    {
        self [[ level.var_a5b16f887c432c02 ]]();
    }
    
    wait 0.1;
    self show();
    playfx( level._effect[ "teleport_splash" ], self.origin );
    playfx( level._effect[ "teleport_aoe" ], self.origin );
    self playsound( "evt_bgb_awbh_teleport_in" );
    a_ai = getaiarray();
    a_aoe_ai = utility::get_array_of_closest( self.origin, a_ai, undefined, undefined, 200 );
    
    foreach ( ai in a_aoe_ai )
    {
        if ( isai( ai ) )
        {
            playfx( level._effect[ "teleport_aoe_kill" ], ai.origin );
            ai.ignore_enemy_count = 1;
            ai dodamage( ai.health + 1000, self.origin, undefined, undefined, "MOD_UNKNOWN" );
            
            if ( !isalive( ai ) )
            {
                ai callback::callback( #"anywhere_but_here_kill", { #player:self } );
            }
        }
    }
    
    wait 0.2;
    val::reset( "anywhere_but_here", "freezecontrols" );
    wait 0.5;
    val::reset( "anywhere_but_here", "ignoreme" );
    val::reset( "anywhere_but_here", "vehicle_use" );
}

// Namespace zm_bgb_anywhere_but_here
// Params 0
// Checksum 0x2d26a769, Offset: 0x766
// Size: 0x3d
function validation()
{
    if ( isdefined( level.var_2fb58637e118b8bd ) )
    {
        return [[ level.var_2fb58637e118b8bd ]]();
    }
    else if ( !isdefined( function_bf6363e79a1a43f6() ) || !val::get( "allow_teleport" ) )
    {
        return 0;
    }
    
    return 1;
}

// Namespace zm_bgb_anywhere_but_here
// Params 0
// Checksum 0x4024be7b, Offset: 0x7ac
// Size: 0x16
function function_bf6363e79a1a43f6()
{
    return utility::callsharedfunc( "anywhere_but_here", #"hash_590b47e0428d4ab3" );
}

