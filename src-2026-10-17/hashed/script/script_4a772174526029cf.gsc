#using scripts\common\utility;

#namespace zombie_pain;

// Namespace zombie_pain
// Params 2
// Checksum 0x1a2ea90, Offset: 0x81
// Size: 0x37
function isinpain( taskid, params )
{
    if ( !utility::ent_flag( "in_pain" ) )
    {
        return anim.failure;
    }
    
    return anim.success;
}

