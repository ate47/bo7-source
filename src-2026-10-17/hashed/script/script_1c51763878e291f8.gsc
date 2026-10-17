#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\mp\common\powerups\nuke;

#namespace zm_bgb_tactical_diffusion;

// Namespace zm_bgb_tactical_diffusion
// Params 0, eflags: 0x5
// Checksum 0xb2160a6, Offset: 0x9d
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "tactical_diffusion", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_tactical_diffusion
// Params 0
// Checksum 0xf05e751d, Offset: 0xc2
// Size: 0x38
function __init__()
{
    bgb::register( "tactical_diffusion", "event", &event, undefined, &disable );
    nuke::register_grab_override( &function_fd7d724793ce9e01 );
    level.var_49f88fccd9b10cde = &function_bfb364ac125e367e;
}

// Namespace zm_bgb_tactical_diffusion
// Params 0
// Checksum 0x3f7a7404, Offset: 0x102
// Size: 0x33
function event()
{
    self endon( #"disconnect" );
    self endon( #"kill_tactical_diffusion" );
    self waittill( #"hash_c280a0e70dc71d4c" );
    bgb::do_one_shot_use( "tactical_diffusion" );
}

// Namespace zm_bgb_tactical_diffusion
// Params 0
// Checksum 0xf4d73dab, Offset: 0x13d
// Size: 0xe
function disable()
{
    self notify( #"kill_tactical_diffusion" );
}

// Namespace zm_bgb_tactical_diffusion
// Params 2
// Checksum 0x1b5b92eb, Offset: 0x153
// Size: 0xe1, Type: bool
function function_fd7d724793ce9e01( a_players, root )
{
    if ( bgb::is_enabled( "tactical_diffusion" ) )
    {
        self notify( #"hash_c280a0e70dc71d4c" );
        
        if ( isdefined( root.func_give_points ) )
        {
            foreach ( player in a_players )
            {
                player playlocalsound( #"hash_83d35f3ab78437ad" );
                player [[ root.func_give_points ]]( #"powerup_nuke", 2000 );
            }
        }
        
        self.var_e1e23a6d9f1887af = undefined;
        return true;
    }
    
    return false;
}

// Namespace zm_bgb_tactical_diffusion
// Params 1
// Checksum 0x84d6e74a, Offset: 0x23d
// Size: 0x32
function function_bfb364ac125e367e( pickupplayer )
{
    if ( pickupplayer bgb::is_enabled( "tactical_diffusion" ) && self.str_powerup == "nuke" )
    {
        return 1;
    }
}

