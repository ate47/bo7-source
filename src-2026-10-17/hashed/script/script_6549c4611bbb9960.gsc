#using scripts\common\shellshock_utility;

#namespace shellshock_utility_cpmp;

// Namespace shellshock_utility_cpmp
// Params 5
// Checksum 0x592bceb4, Offset: 0x8a
// Size: 0x3e
function _shellshock( name, category, duration, animationresponse, interruptdelayms )
{
    shellshock_utility::_shellshock( name, category, duration, animationresponse, interruptdelayms );
}

// Namespace shellshock_utility_cpmp
// Params 2
// Checksum 0x716ebf70, Offset: 0xd0
// Size: 0x31, Type: bool
function function_23ab5b3faeff3613( name, duration )
{
    if ( name === self.shockname )
    {
        self function_801f1f2c5f789ae1( name, duration );
        return true;
    }
    
    return false;
}

// Namespace shellshock_utility_cpmp
// Params 1
// Checksum 0x18439aaf, Offset: 0x10a
// Size: 0x13
function _stopshellshock( fromdeath )
{
    shellshock_utility::_stopshellshock();
}

// Namespace shellshock_utility_cpmp
// Params 5
// Checksum 0x7a61dc2e, Offset: 0x125
// Size: 0x69
function shellshock_artilleryearthquake( position, scale, duration, radius, ignoreclients )
{
    playrumbleonposition( "artillery_rumble", position );
    
    if ( !isdefined( scale ) )
    {
        scale = 0.7;
    }
    
    if ( !isdefined( duration ) )
    {
        duration = 0.5;
    }
    
    if ( !isdefined( radius ) )
    {
        radius = 800;
    }
    
    earthquake( scale, duration, position, radius );
}

