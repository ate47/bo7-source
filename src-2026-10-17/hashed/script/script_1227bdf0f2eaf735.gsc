#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\mp\magicbox;

#namespace zm_bgb_wall_power;

// Namespace zm_bgb_wall_power
// Params 0, eflags: 0x5
// Checksum 0x7b32fb0d, Offset: 0x95
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "wonderbar", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xad8adda2, Offset: 0xba
// Size: 0x38
function __init__()
{
    bgb::register( "wonderbar", "event", &event, undefined, &disable );
    magicbox::function_1b154b89e87377fa( &function_bf0a20dea694ba5a );
    level.var_c7164a558fe3d921 = &function_c7164a558fe3d921;
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0x56ba2081, Offset: 0xfa
// Size: 0x33
function event()
{
    self endon( #"disconnect" );
    self endon( #"hash_f304d7f7ea390912" );
    self waittill( #"hash_b0358cd4c78b6b45" );
    bgb::do_one_shot_use( "wonderbar" );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0x3f795441, Offset: 0x135
// Size: 0xe
function disable()
{
    self notify( #"hash_f304d7f7ea390912" );
}

// Namespace zm_bgb_wall_power
// Params 3
// Checksum 0x1ecd4dae, Offset: 0x14b
// Size: 0x4a
function function_bf0a20dea694ba5a( player, str_override_rarity, respin )
{
    if ( player bgb::is_enabled( "wonderbar" ) || str_override_rarity == "ultra" && respin )
    {
        return level.var_8b6bf63f61fe01f9;
    }
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xecf26484, Offset: 0x19e
// Size: 0x2f
function function_c7164a558fe3d921()
{
    if ( self.var_37f3a4cd8252c9f0 bgb::is_enabled( "wonderbar" ) )
    {
        self.var_37f3a4cd8252c9f0 notify( #"hash_b0358cd4c78b6b45" );
        return 0;
    }
}

