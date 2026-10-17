#using script_1187904f70bad0ea;

#namespace namespace_6698c489bf4d184b;

// Namespace namespace_6698c489bf4d184b
// Params 1
// Checksum 0x6e2dcaef, Offset: 0x76
// Size: 0xf8
function shouldheadbanger( taskid )
{
    target = self.enemy;
    
    if ( !isalive( target ) )
    {
        return anim.failure;
    }
    
    if ( abs( target.origin[ 2 ] - self.origin[ 2 ] ) > 100 )
    {
        return anim.failure;
    }
    
    if ( !self.zombieaisettings.var_d3de1a9faac42deb.enableheadbanger )
    {
        return anim.failure;
    }
    
    closest_tacpoint = findclosesttacpoint( target.origin );
    
    if ( isdefined( closest_tacpoint ) )
    {
        var_60aa9b3c1e06d816 = calculatetacpointexposureforleastexposedsector( closest_tacpoint );
        
        if ( var_60aa9b3c1e06d816 < 1000 )
        {
            return anim.failure;
        }
    }
    
    if ( zombie_deathworm::function_c1592b3e647c3368( target.origin ) )
    {
        return anim.failure;
    }
    
    return anim.success;
}

