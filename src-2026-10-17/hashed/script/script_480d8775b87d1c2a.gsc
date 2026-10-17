#using scripts\asm\asm;
#using scripts\common\utility;

#namespace zombie_liveragdoll;

// Namespace zombie_liveragdoll
// Params 2
// Checksum 0xa56180ff, Offset: 0xa6
// Size: 0x37
function processliveragdoll( taskid, params )
{
    if ( !utility::ent_flag( "in_liveragdoll" ) )
    {
        return anim.failure;
    }
    
    return anim.running;
}

// Namespace zombie_liveragdoll
// Params 2
// Checksum 0xf4fc42e5, Offset: 0xe6
// Size: 0x9a, Type: bool
function liveragdoll_ai( source_pos, intensity )
{
    if ( !isdefined( source_pos ) )
    {
        return false;
    }
    
    if ( is_liveragdoll() )
    {
        return false;
    }
    
    if ( !self asmhasstate( self.asmname, "live_ragdoll_start" ) )
    {
        return false;
    }
    
    if ( getdvarint( @"hash_dee78f8c41d19b65", 0 ) > 0 )
    {
        source_to_ai = vectornormalize( self.origin - source_pos );
        self function_1d5453a0507b54e1( "head", source_to_ai * intensity, 1, 0 );
    }
    else
    {
        self startliveragdoll();
    }
    
    asm::function_7256f5ba459c840b( "live_ragdoll_start" );
    return true;
}

// Namespace zombie_liveragdoll
// Params 0
// Checksum 0xc4355e36, Offset: 0x189
// Size: 0xd
function is_liveragdoll()
{
    return utility::ent_flag( "in_liveragdoll" );
}

