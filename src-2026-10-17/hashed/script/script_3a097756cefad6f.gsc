#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;

#namespace zm_bgb_holiday_cheer;

// Namespace zm_bgb_holiday_cheer
// Params 0, eflags: 0x5
// Checksum 0xa898e4af, Offset: 0x107
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "holiday_cheer", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_holiday_cheer
// Params 0
// Checksum 0x7fe88477, Offset: 0x12c
// Size: 0x42
function __init__()
{
    bgb::register( "holiday_cheer", "time", 180, &enable, &disable, undefined );
    callback::add( "on_zombie_ai_spawned", &on_ai_spawned );
    callback::add( "on_zombie_ai_killed", &on_ai_killed );
}

// Namespace zm_bgb_holiday_cheer
// Params 0
// Checksum 0x8ea17d60, Offset: 0x176
// Size: 0x2
function enable()
{
    
}

// Namespace zm_bgb_holiday_cheer
// Params 0
// Checksum 0x3244f803, Offset: 0x180
// Size: 0x2
function disable()
{
    
}

// Namespace zm_bgb_holiday_cheer
// Params 1, eflags: 0x4
// Checksum 0x3e049ec3, Offset: 0x18a
// Size: 0xcd
function private on_ai_spawned( params )
{
    if ( self.subclass === "zombie_base" )
    {
        var_6320609c80e36cb4 = 0;
        
        foreach ( player in level.players )
        {
            if ( player bgb::is_enabled( "holiday_cheer" ) )
            {
                var_6320609c80e36cb4 = 1;
            }
        }
        
        if ( var_6320609c80e36cb4 )
        {
            self attach( "c_t10_zmb_zombie_christmas_wreath_b_fxanim", "J_Spine4" );
            self.bgb_holiday_cheer = 1;
        }
    }
}

// Namespace zm_bgb_holiday_cheer
// Params 1
// Checksum 0x9bffde27, Offset: 0x25f
// Size: 0x3c
function on_ai_killed( params )
{
    if ( isdefined( self ) && self.bgb_holiday_cheer )
    {
        if ( gettime() >= level.var_7891483386bbdac2 && randomint( 100 ) < 40 )
        {
        }
    }
}

// Namespace zm_bgb_holiday_cheer
// Params 0
// Checksum 0x7dbdd24f, Offset: 0x2a3
// Size: 0x16
function clean_up_hat()
{
    wait randomintrange( 15, 25 );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

