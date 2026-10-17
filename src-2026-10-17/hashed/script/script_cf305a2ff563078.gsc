#namespace zombie_deathworm_mobile_spawner;

// Namespace zombie_deathworm_mobile_spawner
// Params 1
// Checksum 0x8c311d6, Offset: 0x76
// Size: 0x92
function function_10a42d423853dab1( taskid )
{
    if ( !self.zombieaisettings.var_d3de1a9faac42deb.var_39960d450ee3baa1 )
    {
        return anim.failure;
    }
    
    if ( self.var_87f2acda8758bab9 <= 1 )
    {
        return anim.success;
    }
    
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    
    if ( var_4912869f02b165bf >= 7 && self.var_87f2acda8758bab9 <= 3 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

