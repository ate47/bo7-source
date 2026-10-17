#using scripts\common\ai;

#namespace zombie_traverse;

// Namespace zombie_traverse
// Params 2
// Checksum 0x45b807e5, Offset: 0x76
// Size: 0x35
function processtraverse( taskid, params )
{
    if ( !self.var_a4d7ad445f64c817 )
    {
        return anim.failure;
    }
    
    return anim.running;
}

// Namespace zombie_traverse
// Params 0
// Checksum 0xc0e9aee5, Offset: 0xb4
// Size: 0x9
function is_traversing()
{
    return ai::is_doing_traversal( self );
}

