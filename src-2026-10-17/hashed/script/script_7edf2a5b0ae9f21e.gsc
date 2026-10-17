#using script_4f9ce8d249a99f4a;
#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zm_bgb_nowhere_but_there;

// Namespace zm_bgb_nowhere_but_there
// Params 0, eflags: 0x5
// Checksum 0x7569f9c8, Offset: 0x26b
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "nowhere_but_there", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_nowhere_but_there
// Params 0
// Checksum 0xdb7116ce, Offset: 0x290
// Size: 0x9f
function __init__()
{
    bgb::register( "nowhere_but_there", "activated", 1, undefined, undefined, &validation, &activation );
    bgb::function_dbfbba0189f602fa( "nowhere_but_there", 1 );
    bgb::function_ecc4426f6a3d4e88( "nowhere_but_there" );
    level._effect[ "teleport_splash" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_zmb" );
    level._effect[ "teleport_splash_3p" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_zmb_3p" );
    level._effect[ "teleport_aoe" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_aoe_zmb" );
    level._effect[ "teleport_aoe_kill" ] = loadfxasset( "vfx_t10_gameplay_zm_bgb_anywhere_but_here_teleport_aoe_kill_zmb" );
}

// Namespace zm_bgb_nowhere_but_there
// Params 0
// Checksum 0x9600c455, Offset: 0x337
// Size: 0xde
function validation()
{
    if ( isdefined( level.var_867001b4f0460070 ) )
    {
        return [[ level.var_867001b4f0460070 ]]();
    }
    
    if ( self.b_disable_nowhere_but_there )
    {
        return 0;
    }
    
    foreach ( player in level.players )
    {
        if ( player != self && player.var_44c8fd4fb28eb652 === "nowhere_but_there" )
        {
            return 0;
        }
        
        if ( is_valid_target( player ) )
        {
            s_player_respawn = get_best_spawnpoint( player );
            
            if ( isdefined( s_player_respawn ) )
            {
                return 1;
            }
        }
    }
    
    return 0;
}

// Namespace zm_bgb_nowhere_but_there
// Params 0
// Checksum 0x82a8fbe2, Offset: 0x41e
// Size: 0x409
function activation()
{
    self endon( #"death_or_disconnect" );
    val::set( "zm_bgb_nowhere_but_there", "ignoreme", 1 );
    val::set( "nowhere_but_there", "vehicle_use", 0 );
    self.var_a633b562d5641d38 = 1;
    playfx( level._effect[ "teleport_splash_3p" ], self.origin );
    playsoundatpos( self.origin, #"evt_bgb_awbh_teleport_out" );
    wait 0.5;
    
    if ( ispointonnavmesh( self.origin ) )
    {
        playsoundatpos( self.origin, #"evt_bgb_nwbt_teleport_out" );
    }
    
    if ( isdefined( level.var_b6de8c8c99553b86 ) )
    {
        s_respawn_point = self [[ level.var_b6de8c8c99553b86 ]]();
    }
    else
    {
        s_respawn_point = function_e4de538b40e54fdd();
    }
    
    if ( !isdefined( s_respawn_point ) )
    {
        s_respawn_point = spawnstruct();
        s_respawn_point.origin = self.origin;
        s_respawn_point.angles = self.angles;
        self.var_860f55942efed674 = self.origin;
    }
    
    if ( self.var_348fdbfcc7d0f6eb )
    {
        e_link = utility::spawn_model( "tag_origin", s_respawn_point.origin, s_respawn_point.angles );
        self.angles = s_respawn_point.angles;
        self linkto( e_link );
    }
    else
    {
        parent = self getlinkedparent();
        
        if ( isdefined( parent ) )
        {
            self unlink();
        }
        
        if ( self.sessionstate != "playing" )
        {
            if ( isdefined( e_link ) )
            {
                e_link delete();
            }
            
            return;
        }
        
        self setorigin( s_respawn_point.origin );
        self setplayerangles( s_respawn_point.angles );
    }
    
    val::set( "zm_bgb_nowhere_but_there", "freezecontrols", 1 );
    v_return_pos = self.origin + ( 0, 0, 60 );
    
    if ( isdefined( level.var_a5075772bb06b565 ) )
    {
        self [[ level.var_a5075772bb06b565 ]]();
    }
    
    wait 0.1;
    
    if ( self.var_348fdbfcc7d0f6eb )
    {
        self unlink();
        self.var_348fdbfcc7d0f6eb = undefined;
        e_link delete();
    }
    
    self show();
    self playsound( "evt_bgb_nwbt_teleport_in" );
    playfx( level._effect[ "teleport_splash" ], self.origin );
    playfx( level._effect[ "teleport_aoe" ], self.origin );
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
    val::reset( "zm_bgb_nowhere_but_there", "freezecontrols" );
    self.var_a633b562d5641d38 = undefined;
    thread revive_nearby_players( s_respawn_point );
    wait 3;
    val::reset( "zm_bgb_nowhere_but_there", "ignoreme" );
    val::reset( "nowhere_but_there", "vehicle_use" );
    self.var_860f55942efed674 = undefined;
    self notify( #"zm_bgb_nowhere_but_there_complete" );
}

// Namespace zm_bgb_nowhere_but_there
// Params 1
// Checksum 0x565c746e, Offset: 0x82f
// Size: 0x9d
function is_valid_target( e_player )
{
    if ( !isdefined( e_player ) )
    {
        return 0;
    }
    
    if ( isdefined( level.var_f385a9cde106823 ) )
    {
        return [[ level.var_f385a9cde106823 ]]( e_player );
    }
    
    if ( self.team != e_player.team )
    {
        return 0;
    }
    
    if ( e_player.var_107a85bc107517bf )
    {
        return 0;
    }
    
    if ( e_player.var_1946560132e8d336 )
    {
        return 0;
    }
    
    if ( !e_player isonground() )
    {
        return 0;
    }
    
    if ( e_player != self && player::isinlaststand( e_player ) && !e_player.var_d1c4c78b9fb7d153 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace zm_bgb_nowhere_but_there
// Params 0, eflags: 0x4
// Checksum 0xf2d5fab6, Offset: 0x8d5
// Size: 0x132
function private function_e4de538b40e54fdd()
{
    var_dd40a76259b2b36f = [];
    
    foreach ( player in level.players )
    {
        if ( is_valid_target( player ) )
        {
            var_dd40a76259b2b36f[ var_dd40a76259b2b36f.size ] = player;
        }
    }
    
    if ( var_dd40a76259b2b36f.size )
    {
        var_dd40a76259b2b36f = utility::get_array_of_closest( self.origin, var_dd40a76259b2b36f, undefined, undefined, undefined, undefined, 1 );
    }
    else
    {
        var_dd40a76259b2b36f[ var_dd40a76259b2b36f.size ] = self;
    }
    
    foreach ( player in var_dd40a76259b2b36f )
    {
        s_player_respawn = get_best_spawnpoint( player );
        
        if ( isdefined( s_player_respawn ) )
        {
            return s_player_respawn;
        }
    }
}

// Namespace zm_bgb_nowhere_but_there
// Params 1
// Checksum 0x27f330a2, Offset: 0xa10
// Size: 0x22
function get_best_spawnpoint( e_player )
{
    return utility::callsharedfunc( "nowhere_but_there", #"get_best_spawnpoint", e_player );
}

// Namespace zm_bgb_nowhere_but_there
// Params 1
// Checksum 0x1b694503, Offset: 0xa3b
// Size: 0x59
function enable_nowhere_but_there( b_enable = 1 )
{
    if ( b_enable )
    {
        level.var_9980bb185b6144a5 = level.var_49cffb88839d53c8;
        level.var_49cffb88839d53c8 = undefined;
        return;
    }
    
    level.var_49cffb88839d53c8 = level.var_9980bb185b6144a5;
    level.var_9980bb185b6144a5 = &nowhere_but_there_disabled;
}

// Namespace zm_bgb_nowhere_but_there
// Params 1
// Checksum 0x3ed8d79f, Offset: 0xa9c
// Size: 0xd
function nowhere_but_there_disabled( var_293f21d34d2bcea8 )
{
    return [];
}

// Namespace zm_bgb_nowhere_but_there
// Params 1
// Checksum 0xf3f4183f, Offset: 0xab2
// Size: 0x23
function revive_nearby_players( s_respawn_point )
{
    utility::callsharedfunc( "nowhere_but_there", #"revive_nearby_players", s_respawn_point );
}

