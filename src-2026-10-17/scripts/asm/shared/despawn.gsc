#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\common\values;

#namespace despawn;

// Namespace despawn
// Params 3
// Checksum 0xb3fbdea3, Offset: 0xca
// Size: 0x27
function terminatedespawn( asmname, statename, params )
{
    thread queue_despawn( params );
}

// Namespace despawn
// Params 1
// Checksum 0xd43c18c3, Offset: 0xf9
// Size: 0x13b
function queue_despawn( bypassthrottle = 0 )
{
    if ( utility::ent_flag( "in_queue_despawn" ) )
    {
        return;
    }
    
    self endon( #"death" );
    level endon( #"game_ended" );
    utility::ent_flag_set( "in_queue_despawn" );
    
    if ( !isdefined( level.despawnThrottle ) )
    {
        level.despawnThrottle = throttle::throttle_initialize( "despawnThrottle", getdvarint( @"hash_31df6612d8150a09", 3 ), level.framedurationseconds );
    }
    
    if ( !bypassthrottle )
    {
        throttle::throttle_wait_in_queue( level.despawnThrottle, self );
    }
    
    if ( self.var_b1d9042e7d29abb8 )
    {
        self.nocorpse = 1;
    }
    
    self._blackboard.zombieindespawn = 0;
    utility::ent_flag_clear( "in_queue_despawn" );
    
    if ( val::get( "damageshield" ) && val::get( "damageshield_allow_delete" ) )
    {
        if ( utility::issharedfuncdefined( #"ai", #"hash_c649178f35fe47cf" ) )
        {
            utility::callsharedfunc( #"ai", #"hash_c649178f35fe47cf" );
        }
        else
        {
            return;
        }
    }
    else if ( val::get( "damageshield" ) )
    {
        return;
    }
    
    self kill();
}

// Namespace despawn
// Params 3
// Checksum 0xa41c005d, Offset: 0x23c
// Size: 0x32, Type: bool
function checkdespawn( asmname, statename, params )
{
    return !self._blackboard.zombieindespawn;
}

