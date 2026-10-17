#namespace squad;

// Namespace squad
// Params 1
// Checksum 0xd580d47f, Offset: 0x76
// Size: 0x2c
function function_996c0da2e8fc48ea( aiarray )
{
    squadid = function_f0047461b4eb2369();
    
    if ( isdefined( squadid ) )
    {
        aijoinsquad( squadid, aiarray );
    }
    
    return squadid;
}

