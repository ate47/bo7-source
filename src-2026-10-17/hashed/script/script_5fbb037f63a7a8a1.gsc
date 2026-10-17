#using scripts\asm\asm;

#namespace zombie_leap_attack_asm;

// Namespace zombie_leap_attack_asm
// Params 0
// Checksum 0x19471a6b, Offset: 0x88
// Size: 0x1a
function function_cc6b10a6c37c57e5()
{
    asm::function_7256f5ba459c840b( self.leap_attack_state ?? "leap_attack_in" );
}

// Namespace zombie_leap_attack_asm
// Params 3
// Checksum 0xa11dd01c, Offset: 0xaa
// Size: 0xce
function function_3d8cd69a5c5394a0( var_a40c87f3e35aa316, var_d0f398aaece93bc3, var_3c081a0281fa8971 )
{
    assert( isdefined( self._blackboard.leapattackdamage ), "<dev string:x24>" );
    
    if ( isdefined( var_a40c87f3e35aa316 ) )
    {
        assert( var_a40c87f3e35aa316 >= 0, "<dev string:x7a>" );
    }
    
    if ( isdefined( var_d0f398aaece93bc3 ) || isdefined( var_3c081a0281fa8971 ) )
    {
        assert( var_d0f398aaece93bc3 <= var_3c081a0281fa8971, "<dev string:xcf>" );
    }
    
    self._blackboard.var_3bd8c41b5e79c983 = var_a40c87f3e35aa316 ?? 32;
    self._blackboard.var_8d57b81da087edc6 = var_d0f398aaece93bc3 ?? 0.68;
    self._blackboard.var_40984159a5204384 = var_3c081a0281fa8971 ?? 0.8;
}

