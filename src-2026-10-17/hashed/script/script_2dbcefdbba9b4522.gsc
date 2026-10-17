#using script_1187904f70bad0ea;

#namespace namespace_636cb8a8ba015294;

// Namespace namespace_636cb8a8ba015294
// Params 1
// Checksum 0xbdff1ce3, Offset: 0x76
// Size: 0x5c
function shouldsnakebite( taskid )
{
    target = self.enemy;
    
    if ( !isalive( target ) )
    {
        return anim.failure;
    }
    
    if ( zombie_deathworm::function_c1592b3e647c3368( target.origin ) )
    {
        return anim.failure;
    }
    
    return anim.success;
}

