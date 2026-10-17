#namespace zombie_deathworm_burrow;

// Namespace zombie_deathworm_burrow
// Params 1
// Checksum 0x2a985096, Offset: 0x76
// Size: 0x44
function function_10fbebbd3b84aa3e( taskid )
{
    self.ents_in_mouth = function_46f9072493651dc9( self.ents_in_mouth );
    
    if ( self.ents_in_mouth.size > 0 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

// Namespace zombie_deathworm_burrow
// Params 1
// Checksum 0xaee7c59f, Offset: 0xc3
// Size: 0x63
function function_4bf7c598a5bc40f7( taskid )
{
    last_health_perc = self.var_c6cd6511556ae4e4 ?? 1;
    health_perc = self.health / self.maxhealth;
    
    if ( last_health_perc - health_perc >= 0.2 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

