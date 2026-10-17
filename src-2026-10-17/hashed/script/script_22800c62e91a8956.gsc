#using script_4bc38131d8ecd20b;
#using scripts\common\callbacks;

#namespace namespace_b76e7e4c1d057ec1;

// Namespace namespace_b76e7e4c1d057ec1
// Params 0
// Checksum 0x49d28791, Offset: 0xa8
// Size: 0x30
function function_c0467b6eefab8cac()
{
    template = callback::get_template( self.animsetname );
    template callback::add( "on_is_moving_melee_changed", &function_e0d499c13803af86 );
}

// Namespace namespace_b76e7e4c1d057ec1
// Params 0
// Checksum 0x583889a5, Offset: 0xe0
// Size: 0x9
function init_melee()
{
    function_1a57e936d77691d2();
}

// Namespace namespace_b76e7e4c1d057ec1
// Params 1, eflags: 0x4
// Checksum 0xda2c911b, Offset: 0xf1
// Size: 0x13
function private function_e0d499c13803af86( params )
{
    function_1a57e936d77691d2();
}

// Namespace namespace_b76e7e4c1d057ec1
// Params 0, eflags: 0x4
// Checksum 0x5e1caa19, Offset: 0x10c
// Size: 0xb2
function private function_1a57e936d77691d2()
{
    animset = self.animsetname;
    
    if ( !( isdefined( level.variant_type_max[ self.animsetname ] ) && isdefined( level.variant_type_max[ self.animsetname ] ) ) )
    {
        animset = self findoverridearchetype( "default" );
    }
    
    featurearray = [];
    alias = self function_805ca5e408d630c0( animset, "melee", featurearray, 0 );
    assert( isdefined( alias ), "<dev string:x24>" + self._blackboard.movetype );
    
    if ( isdefined( alias ) )
    {
        self function_695b8e1b655c2796( "melee", alias );
    }
    
    return alias;
}

// Namespace namespace_b76e7e4c1d057ec1
// Params 1
// Checksum 0x523ce41e, Offset: 0x1c7
// Size: 0x66
function request_melee( target_ent )
{
    if ( zombie_stun::is_stunned() )
    {
        return;
    }
    
    is_moving_melee = calculate_is_moving_melee( target_ent );
    self._blackboard.zombiemeleeismoving = is_moving_melee;
    
    if ( self.is_moving_melee != is_moving_melee )
    {
        self.is_moving_melee = is_moving_melee;
        callback::callback( "on_is_moving_melee_changed" );
    }
}

// Namespace namespace_b76e7e4c1d057ec1
// Params 1
// Checksum 0x87866476, Offset: 0x235
// Size: 0xd0
function calculate_is_moving_melee( target_ent )
{
    moving_melee_threshold = getdvarint( @"hash_b17a9432a377356d", 32 );
    is_moving_melee = lengthsquared( self.velocity ) > squared( moving_melee_threshold );
    
    if ( is_moving_melee && isalive( target_ent ) )
    {
        target_pos = target_ent.origin;
        to_target = target_pos - self.origin;
        range_sqr = lengthsquared( to_target );
        
        if ( range_sqr < squared( self.melee_trigger_dist ) )
        {
            target_vel = target_ent getentityvelocity();
            is_moving_melee = vectordot2( target_vel, to_target ) > 0 && length2dsquared( target_vel ) > squared( 30 );
        }
    }
    
    return is_moving_melee;
}

