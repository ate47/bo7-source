#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;

#namespace zm_bgb_quacknarok;

// Namespace zm_bgb_quacknarok
// Params 0, eflags: 0x5
// Checksum 0xfb39efb8, Offset: 0xf9
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "quacknarok", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_quacknarok
// Params 0
// Checksum 0xbc8081ef, Offset: 0x11e
// Size: 0x42
function __init__()
{
    bgb::register( "quacknarok", "time", 180, &enable, &disable, undefined );
    callback::add( "on_zombie_ai_spawned", &on_ai_spawned );
    callback::add( "on_zombie_ai_killed", &on_ai_killed );
}

// Namespace zm_bgb_quacknarok
// Params 0
// Checksum 0x243dc728, Offset: 0x168
// Size: 0x2
function enable()
{
    
}

// Namespace zm_bgb_quacknarok
// Params 0
// Checksum 0x98d8424b, Offset: 0x172
// Size: 0x2
function disable()
{
    
}

// Namespace zm_bgb_quacknarok
// Params 1, eflags: 0x4
// Checksum 0x10420799, Offset: 0x17c
// Size: 0xcd
function private on_ai_spawned( params )
{
    if ( self.subclass === "zombie_base" )
    {
        var_f74ed6e091c46e62 = 0;
        
        foreach ( player in level.players )
        {
            if ( player bgb::is_enabled( "quacknarok" ) )
            {
                var_f74ed6e091c46e62 = 1;
            }
        }
        
        if ( var_f74ed6e091c46e62 )
        {
            self attach( "t10_zm_red_floatie_duck_front", "J_MainRoot" );
            self.bgb_quacknarok = 1;
        }
    }
}

// Namespace zm_bgb_quacknarok
// Params 1
// Checksum 0xd044223b, Offset: 0x251
// Size: 0x2d
function on_ai_killed( params )
{
    if ( isdefined( self ) && self.bgb_quacknarok )
    {
        self playsoundevent( %"snd_quacknarok_death" );
    }
}

