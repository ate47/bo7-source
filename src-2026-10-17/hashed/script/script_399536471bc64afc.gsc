#namespace zombie_deathworm_spittle;

// Namespace zombie_deathworm_spittle
// Params 1
// Checksum 0x775b74b2, Offset: 0x76
// Size: 0x44
function shouldspittle( taskid )
{
    if ( self.disable_spittle )
    {
        return anim.failure;
    }
    
    if ( self.var_89e47b7d790b5459 <= 1 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

