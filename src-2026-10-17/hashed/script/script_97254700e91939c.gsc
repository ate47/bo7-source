#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_newtonian_negation;

// Namespace zm_bgb_newtonian_negation
// Params 0, eflags: 0x5
// Checksum 0xc31e071a, Offset: 0xe8
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "newtonian_negation", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_newtonian_negation
// Params 0
// Checksum 0xee92e621, Offset: 0x10d
// Size: 0x20
function __init__()
{
    bgb::register( "newtonian_negation", "time", 180, &enable, &disable, undefined );
}

// Namespace zm_bgb_newtonian_negation
// Params 0
// Checksum 0xc0320470, Offset: 0x135
// Size: 0x12
function enable()
{
    invert_gravity( 1 );
    thread disable_on_disconnect();
}

// Namespace zm_bgb_newtonian_negation
// Params 0
// Checksum 0xba9fc62b, Offset: 0x14f
// Size: 0x22
function disable_on_disconnect()
{
    self endon( #"newtonian_negation_disable" );
    self waittill( #"disconnect" );
    thread disable();
}

// Namespace zm_bgb_newtonian_negation
// Params 0
// Checksum 0x573429cf, Offset: 0x179
// Size: 0xa9
function disable()
{
    if ( isdefined( self ) )
    {
        self notify( #"newtonian_negation_disable" );
    }
    
    foreach ( player in level.players )
    {
        if ( player != self && player bgb::is_enabled( "newtonian_negation" ) )
        {
            return;
        }
    }
    
    invert_gravity( 0 );
    removeallcorpses();
}

// Namespace zm_bgb_newtonian_negation
// Params 1
// Checksum 0xcbefe8e9, Offset: 0x22a
// Size: 0x4c
function invert_gravity( b_onoff )
{
    if ( b_onoff )
    {
        physics_setgravityragdollscalar( -1 );
        level callback::add( "pre_killed_body_cloned", &on_ai_killed );
        return;
    }
    
    physics_setgravityragdollscalar( 1 );
    level callback::remove( "pre_killed_body_cloned", &on_ai_killed );
}

// Namespace zm_bgb_newtonian_negation
// Params 1, eflags: 0x4
// Checksum 0xf5d6d791, Offset: 0x27e
// Size: 0x32
function private on_ai_killed( params )
{
    self.var_f7d02d1022565946 = "death_upwards";
    utility::ent_flag_set( "dissolve_purple" );
    utility::ent_flag_set( "dark_aether_bubble" );
}

